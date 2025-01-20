@interface MFRangedDataFilter
+ (id)rangedFilterWithConsumer:(id)a3 range:(_NSRange)a4;
+ (id)rangedFilterWithConsumers:(id)a3 range:(_NSRange)a4;
- (_NSRange)range;
- (int64_t)appendData:(id)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation MFRangedDataFilter

+ (id)rangedFilterWithConsumers:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v6 = [a1 filterWithConsumers:a3];
  v7 = v6;
  if (v6) {
    objc_msgSend(v6, "setRange:", location, length);
  }
  return v7;
}

+ (id)rangedFilterWithConsumer:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v6 = [a1 filterWithConsumer:a3];
  v7 = v6;
  if (v6) {
    objc_msgSend(v6, "setRange:", location, length);
  }
  return v7;
}

- (int64_t)appendData:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [v4 length];
  NSUInteger consumedLength = self->_consumedLength;
  v15.NSUInteger location = consumedLength;
  v15.NSUInteger length = v5;
  NSRange v7 = NSIntersectionRange(self->_range, v15);
  if (v7.length)
  {
    NSUInteger v8 = v7.location - self->_consumedLength;
    if (v7.length < v5)
    {
      v9 = -[MFData initWithBytesNoCopy:length:freeWhenDone:]([MFData alloc], "initWithBytesNoCopy:length:freeWhenDone:", [v4 bytes] + v8, v7.length, 0);
      v13.receiver = self;
      v13.super_class = (Class)MFRangedDataFilter;
      int64_t v10 = [(MFBaseFilterDataConsumer *)&v13 appendData:v9];

      if (v10 < 0) {
        goto LABEL_13;
      }
      goto LABEL_8;
    }
    v14.receiver = self;
    v14.super_class = (Class)MFRangedDataFilter;
    int64_t v10 = [(MFBaseFilterDataConsumer *)&v14 appendData:v4];
    if ((v10 & 0x8000000000000000) == 0)
    {
LABEL_8:
      if (v5 == v10) {
        NSUInteger v11 = 0;
      }
      else {
        NSUInteger v11 = v8;
      }
      NSUInteger v5 = v11 + v10;
      goto LABEL_12;
    }
  }
  else
  {
    if (consumedLength + v5 < self->_range.location)
    {
LABEL_12:
      self->_consumedLength += v5;
      int64_t v10 = v5;
      goto LABEL_13;
    }
    int64_t v10 = 0;
  }
LABEL_13:

  return v10;
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

@end