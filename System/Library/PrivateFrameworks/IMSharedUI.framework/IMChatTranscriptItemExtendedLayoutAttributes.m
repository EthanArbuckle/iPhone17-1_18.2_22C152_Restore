@interface IMChatTranscriptItemExtendedLayoutAttributes
- (CGSize)drawableSize;
- (double)topMargin;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)layoutOrientation;
- (void)setDrawableSize:(CGSize)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setTopMargin:(double)a3;
@end

@implementation IMChatTranscriptItemExtendedLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IMChatTranscriptItemExtendedLayoutAttributes;
  id result = [(IMChatTranscriptItemLayoutAttributes *)&v5 copyWithZone:a3];
  *((_OWORD *)result + 5) = self->_drawableSize;
  *((void *)result + 8) = self->_layoutOrientation;
  *((void *)result + 9) = *(void *)&self->_topMargin;
  return result;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
}

- (CGSize)drawableSize
{
  double width = self->_drawableSize.width;
  double height = self->_drawableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDrawableSize:(CGSize)a3
{
  self->_drawableSize = a3;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_topMargin = a3;
}

@end