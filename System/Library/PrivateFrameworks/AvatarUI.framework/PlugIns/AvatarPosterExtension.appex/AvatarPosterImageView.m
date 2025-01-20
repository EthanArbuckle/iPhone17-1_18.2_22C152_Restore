@interface AvatarPosterImageView
- (BOOL)isHighlighted;
- (UIImage)highlightedImage;
- (UIImage)image;
- (_TtC21AvatarPosterExtension21AvatarPosterImageView)initWithCoder:(id)a3;
- (_TtC21AvatarPosterExtension21AvatarPosterImageView)initWithFrame:(CGRect)a3;
- (_TtC21AvatarPosterExtension21AvatarPosterImageView)initWithImage:(id)a3;
- (_TtC21AvatarPosterExtension21AvatarPosterImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedImage:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation AvatarPosterImageView

- (UIImage)image
{
  return (UIImage *)sub_100002F98((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_image);
}

- (void)setImage:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100002D80(a3);
}

- (UIImage)highlightedImage
{
  return (UIImage *)sub_100002F98((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_highlightedImage);
}

- (void)setHighlightedImage:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView);
  id v6 = a3;
  id v5 = self;
  [v4 setHighlightedImage:v6];
  [(AvatarPosterImageView *)v5 setNeedsLayout];
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AvatarPosterImageView();
  return [(AvatarPosterImageView *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AvatarPosterImageView();
  id v4 = v6.receiver;
  [(AvatarPosterImageView *)&v6 setHighlighted:v3];
  id v5 = objc_msgSend(v4, "layer", v6.receiver, v6.super_class);
  [v5 setContents:0];
}

- (_TtC21AvatarPosterExtension21AvatarPosterImageView)initWithImage:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView) = 0;
  id v4 = (char *)self + OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_delegate;
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AvatarPosterImageView();
  id v5 = a3;
  objc_super v6 = [(AvatarPosterImageView *)&v8 initWithImage:v5];
  sub_100003694(a3, 0);

  return v6;
}

- (_TtC21AvatarPosterExtension21AvatarPosterImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView) = 0;
  objc_super v6 = (char *)self + OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_delegate;
  *(_OWORD *)objc_super v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AvatarPosterImageView();
  id v7 = a3;
  id v8 = a4;
  v9 = [(AvatarPosterImageView *)&v11 initWithImage:v7 highlightedImage:v8];
  sub_100003694(a3, a4);

  return v9;
}

- (_TtC21AvatarPosterExtension21AvatarPosterImageView)initWithCoder:(id)a3
{
  sub_1000033AC(a3);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AvatarPosterImageView();
  id v2 = v3.receiver;
  [(AvatarPosterImageView *)&v3 layoutSubviews];
  objc_msgSend(v2, "layoutIfNeeded", v3.receiver, v3.super_class);
  sub_100003828();
}

- (void)didMoveToSuperview
{
}

- (void)didMoveToWindow
{
}

- (_TtC21AvatarPosterExtension21AvatarPosterImageView)initWithFrame:(CGRect)a3
{
  result = (_TtC21AvatarPosterExtension21AvatarPosterImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100003B08((uint64_t)self + OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_delegate);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView);
}

@end