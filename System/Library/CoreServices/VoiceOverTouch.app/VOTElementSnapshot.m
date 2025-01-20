@interface VOTElementSnapshot
- (CGRect)frame;
- (NSString)description;
- (NSString)label;
- (NSString)value;
- (VOTElementSnapshot)initWithLabel:(id)a3 value:(id)a4 traits:(unint64_t)a5 rowRange:(_NSRange)a6 frame:(CGRect)a7;
- (_NSRange)rowRange;
- (unint64_t)traits;
@end

@implementation VOTElementSnapshot

- (VOTElementSnapshot)initWithLabel:(id)a3 value:(id)a4 traits:(unint64_t)a5 rowRange:(_NSRange)a6 frame:(CGRect)a7
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v16 = a3;
  id v17 = a4;
  v24.receiver = self;
  v24.super_class = (Class)VOTElementSnapshot;
  v18 = [(VOTElementSnapshot *)&v24 init];
  if (v18)
  {
    v19 = (NSString *)[v16 copy];
    label = v18->_label;
    v18->_label = v19;

    v21 = (NSString *)[v17 copy];
    value = v18->_value;
    v18->_value = v21;

    v18->_traits = a5;
    v18->_rowRange.NSUInteger location = location;
    v18->_rowRange.NSUInteger length = length;
    v18->_frame.origin.CGFloat x = x;
    v18->_frame.origin.CGFloat y = y;
    v18->_frame.size.CGFloat width = width;
    v18->_frame.size.CGFloat height = height;
  }

  return v18;
}

- (NSString)description
{
  v3 = [(VOTElementSnapshot *)self label];
  v4 = [(VOTElementSnapshot *)self value];
  v5 = +[NSNumber numberWithUnsignedLongLong:[(VOTElementSnapshot *)self traits]];
  [(VOTElementSnapshot *)self frame];
  v6 = NSStringFromCGRect(v10);
  v7 = +[NSString stringWithFormat:@"VOTElementSnapshot<%p>. Label:%@ Value:%@ traits:%@ frame:%@", self, v3, v4, v5, v6];

  return (NSString *)v7;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (unint64_t)traits
{
  return self->_traits;
}

- (_NSRange)rowRange
{
  NSUInteger length = self->_rowRange.length;
  NSUInteger location = self->_rowRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end