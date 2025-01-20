@interface IMChatTranscriptItemLayoutAttributes
- (CGRect)frame;
- (CGSize)size;
- (NSIndexPath)indexPath;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIndexPath:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation IMChatTranscriptItemLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v7 = objc_msgSend_copy(self->_indexPath, v5, v6);
  v8 = (void *)v4[1];
  v4[1] = v7;

  *((_OWORD *)v4 + 1) = self->_size;
  CGSize size = self->_frame.size;
  *((_OWORD *)v4 + 2) = self->_frame.origin;
  *((CGSize *)v4 + 3) = size;
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_frame))
  {
    self->_frame.origin.CGFloat x = x;
    self->_frame.origin.CGFloat y = y;
    self->_frame.size.CGFloat width = width;
    self->_frame.size.CGFloat height = height;
    self->_size.CGFloat width = width;
    self->_size.CGFloat height = height;
  }
}

- (void)setSize:(CGSize)a3
{
  if (a3.width != self->_size.width || a3.height != self->_size.height)
  {
    self->_CGSize size = a3;
    self->_frame.CGSize size = a3;
  }
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
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

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end