@interface UIKitSearchBar
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7SwiftUI14UIKitSearchBar)initWithCoder:(id)a3;
- (_TtC7SwiftUI14UIKitSearchBar)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation UIKitSearchBar

- (void)didMoveToWindow
{
  v2 = self;
  UIKitSearchBar.didMoveToWindow()();
}

- (_TtC7SwiftUI14UIKitSearchBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_ensureVibrancy) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_isActive) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_pendingIsFirstResponder) = 2;
  v9 = (char *)self + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  *((_OWORD *)v9 + 3) = 0u;
  *((_OWORD *)v9 + 4) = 0u;
  *((void *)v9 + 10) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarHost) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarVisibility) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[UIKitSearchBar initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)swift_getObjectType();
  v5 = (char *)v16.receiver;
  -[UIKitSearchBar sizeThatFits:](&v16, sel_sizeThatFits_, width, height);
  double v7 = v6;
  double v9 = v8;
  v10 = *(void **)&v5[OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarHost];
  if (v10)
  {
    id v11 = v10;
    if (objc_msgSend(v11, sel_isHidden, v16.receiver, v16.super_class))
    {
    }
    else
    {
      UIKitSearchBar.roundedScopeBarSizeThatFits(_:)(width, height);
      double v13 = v12;

      double v9 = v9 + v13;
    }
  }
  else
  {
  }
  double v14 = v7;
  double v15 = v9;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  UIKitSearchBar.layoutSubviews()();
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v6 = v7.receiver;
  [(UIKitSearchBar *)&v7 setShowsScopeBar:v5 animated:v4];
  UIKitSearchBar.updateCustomScopeBarIsActive(_:isAnimated:)(v5, v4);
}

- (_TtC7SwiftUI14UIKitSearchBar)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI14UIKitSearchBar *)UIKitSearchBar.init(coder:)(a3);
}

- (void).cxx_destruct
{
  outlined consume of BoundInputsView?(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView), *(uint64_t *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView), *(void **)((char *)&self->super.super._cachedTraitCollection+ OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_customScopeBarHost);
}

@end