@interface CUIKORTextDrawInfo
- (CGSize)contentSize;
- (CUIKORTextDrawInfo)initWithContentSize:(CGSize)a3 renderingBlock:(id)a4;
- (id)renderingBlock;
@end

@implementation CUIKORTextDrawInfo

- (CUIKORTextDrawInfo)initWithContentSize:(CGSize)a3 renderingBlock:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CUIKORTextDrawInfo;
  v8 = [(CUIKORTextDrawInfo *)&v12 init];
  if (v8)
  {
    v9 = _Block_copy(v7);
    id renderingBlock = v8->_renderingBlock;
    v8->_id renderingBlock = v9;

    v8->_contentSize.CGFloat width = width;
    v8->_contentSize.CGFloat height = height;
  }

  return v8;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)renderingBlock
{
  return self->_renderingBlock;
}

- (void).cxx_destruct
{
}

@end