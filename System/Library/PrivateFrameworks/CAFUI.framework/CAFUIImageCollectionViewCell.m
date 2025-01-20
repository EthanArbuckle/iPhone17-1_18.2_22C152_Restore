@interface CAFUIImageCollectionViewCell
- (BOOL)isHighlighted;
- (_TtC5CAFUI28CAFUIImageCollectionViewCell)initWithCoder:(id)a3;
- (_TtC5CAFUI28CAFUIImageCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CAFUIImageCollectionViewCell

- (_TtC5CAFUI28CAFUIImageCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC5CAFUI28CAFUIImageCollectionViewCell *)CAFUIImageCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5CAFUI28CAFUIImageCollectionViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5CAFUI28CAFUIImageCollectionViewCell_checkImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5CAFUI28CAFUIImageCollectionViewCell_decoratorImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5CAFUI28CAFUIImageCollectionViewCell_focusRingView) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5CAFUI28CAFUIImageCollectionViewCell_enabled) = 1;
  id v4 = a3;

  result = (_TtC5CAFUI28CAFUIImageCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CAFUIImageCollectionViewCell();
  v2 = (char *)v6.receiver;
  [(CAFUIImageCollectionViewCell *)&v6 prepareForReuse];
  uint64_t v3 = OBJC_IVAR____TtC5CAFUI28CAFUIImageCollectionViewCell_checkImageView;
  id v4 = *(void **)&v2[OBJC_IVAR____TtC5CAFUI28CAFUIImageCollectionViewCell_checkImageView];
  if (v4)
  {
    objc_msgSend(v4, sel_removeFromSuperview, v6.receiver, v6.super_class);
    v5 = *(void **)&v2[v3];
  }
  else
  {
    v5 = 0;
  }
  *(void *)&v2[v3] = 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFUIImageCollectionViewCell.didUpdateFocus(in:with:)((UIFocusUpdateContext)v6, (UIFocusAnimationCoordinator)v7);
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAFUIImageCollectionViewCell();
  return [(CAFUIImageCollectionViewCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  CAFUIImageCollectionViewCell.isHighlighted.setter(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI28CAFUIImageCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI28CAFUIImageCollectionViewCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI28CAFUIImageCollectionViewCell_checkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI28CAFUIImageCollectionViewCell_decoratorImageView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5CAFUI28CAFUIImageCollectionViewCell_focusRingView);
}

@end