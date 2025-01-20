@interface PictureInPictureWrapperView
- (UIEdgeInsets)_touchInsets;
- (_TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView)initWithCoder:(id)a3;
- (_TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView)initWithFrame:(CGRect)a3;
- (void)_setTouchInsets:(UIEdgeInsets)a3;
- (void)addSubview:(id)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
@end

@implementation PictureInPictureWrapperView

- (UIEdgeInsets)_touchInsets
{
  v2 = self;
  PictureInPictureWrapperView._touchInsets.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)_setTouchInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v7 = self;
  PictureInPictureWrapperView._touchInsets.setter(top, left, bottom, right);
}

- (void)layoutSubviews
{
  v2 = self;
  PictureInPictureWrapperView.layoutSubviews()();
}

- (void)addSubview:(id)a3
{
  id v4 = a3;
  double v5 = self;
  PictureInPictureWrapperView.addSubview(_:)(v4);
}

- (void)didMoveToSuperview
{
  v2 = self;
  PictureInPictureWrapperView._touchInsets.didset();
}

- (_TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView *)PictureInPictureWrapperView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView)initWithCoder:(id)a3
{
  return (_TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView *)PictureInPictureWrapperView.init(coder:)(a3);
}

@end