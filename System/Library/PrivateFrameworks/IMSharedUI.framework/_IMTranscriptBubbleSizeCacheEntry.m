@interface _IMTranscriptBubbleSizeCacheEntry
- (CGSize)size;
- (_IMTranscriptBubbleSizeCacheEntry)initWithSize:(CGSize)a3 maximumWidth:(double)a4;
- (double)maximumWidth;
- (double)minimumWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMaximumWidth:(double)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation _IMTranscriptBubbleSizeCacheEntry

- (_IMTranscriptBubbleSizeCacheEntry)initWithSize:(CGSize)a3 maximumWidth:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)_IMTranscriptBubbleSizeCacheEntry;
  result = [(_IMTranscriptBubbleSizeCacheEntry *)&v8 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_maximumWidth = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [_IMTranscriptBubbleSizeCacheEntry alloc];
  double maximumWidth = self->_maximumWidth;
  double width = self->_size.width;
  double height = self->_size.height;
  return (id)objc_msgSend_initWithSize_maximumWidth_(v4, v5, v6, width, height, maximumWidth);
}

- (double)minimumWidth
{
  return self->_size.width;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_minimumWidth(self, v6, v7);
  uint64_t v9 = v8;
  objc_msgSend_maximumWidth(self, v10, v11);
  uint64_t v13 = v12;
  objc_msgSend_size(self, v14, v15);
  v18 = objc_msgSend_stringWithFormat_(v3, v16, @"<%@ (%p)> MINWIDTH: %f, MAXWIDTH: %f, HEIGHT: %f", v5, self, v9, v13, v17);

  return v18;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setMaximumWidth:(double)a3
{
  self->_double maximumWidth = a3;
}

@end