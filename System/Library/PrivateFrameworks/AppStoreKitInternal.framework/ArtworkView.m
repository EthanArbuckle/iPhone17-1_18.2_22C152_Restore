@interface ArtworkView
- (BOOL)accessibilityIgnoresInvertColors;
- (CGRect)frame;
- (UIColor)backgroundColor;
- (_TtC19AppStoreKitInternal11ArtworkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ArtworkView

- (_TtC19AppStoreKitInternal11ArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)ArtworkView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  ArtworkView.traitCollectionDidChange(_:)(v9);
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC19AppStoreKitInternal11ArtworkView_internalBackgroundColor));
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  ArtworkView.backgroundColor.setter(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  ArtworkView.layoutSubviews()();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(ArtworkView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v23.receiver = self;
  v23.super_class = ObjectType;
  UITraitCollection_optional v9 = self;
  [(ArtworkView *)&v23 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v22.receiver = v9;
  v22.super_class = ObjectType;
  [(ArtworkView *)&v22 frame];
  if (v19 != width || v18 != height) {
    *((unsigned char *)&v9->super.super.super.super.isa
  }
    + OBJC_IVAR____TtC19AppStoreKitInternal11ArtworkView_isCornerRadiusInvalid) = 1;
  v21.receiver = v9;
  v21.super_class = ObjectType;
  -[ArtworkView setFrame:](&v21, sel_setFrame_, x, y, width, height);
  sub_1E16ADECC(v11, v13, v15, v17);
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal11ArtworkView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal11ArtworkView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal11ArtworkView_shadow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal11ArtworkView_internalBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal11ArtworkView_placeholderColor));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC19AppStoreKitInternal11ArtworkView_artworkTintColor);
}

@end