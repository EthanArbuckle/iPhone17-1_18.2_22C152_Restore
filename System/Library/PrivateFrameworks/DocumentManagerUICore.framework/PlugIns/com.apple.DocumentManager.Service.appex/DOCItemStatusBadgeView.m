@interface DOCItemStatusBadgeView
- (CGSize)intrinsicContentSize;
- (_TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView)initWithFrame:(CGRect)a3;
- (_TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView)initWithImage:(id)a3;
- (_TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation DOCItemStatusBadgeView

- (CGSize)intrinsicContentSize
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView_layoutTraits);
  if (self->layoutTraits[OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView_layoutTraits + 24])
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for DOCItemStatusBadgeView();
    [(DOCItemStatusBadgeView *)&v5 intrinsicContentSize];
  }
  else
  {
    double v3 = *v2;
    double v4 = v2[1];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView)initWithImage:(id)a3
{
  double v4 = (char *)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView_layoutTraits;
  *(_OWORD *)double v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemStatusBadgeView();
  return [(DOCItemStatusBadgeView *)&v6 initWithImage:a3];
}

- (_TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  objc_super v6 = (char *)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView_layoutTraits;
  *(_OWORD *)objc_super v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[32] = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCItemStatusBadgeView();
  return [(DOCItemStatusBadgeView *)&v8 initWithImage:a3 highlightedImage:a4];
}

- (_TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView_layoutTraits;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCItemStatusBadgeView();
  return -[DOCItemStatusBadgeView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView)initWithCoder:(id)a3
{
  double v4 = (char *)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCItemStatusBadgeView_layoutTraits;
  *(_OWORD *)double v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemStatusBadgeView();
  return [(DOCItemStatusBadgeView *)&v6 initWithCoder:a3];
}

@end