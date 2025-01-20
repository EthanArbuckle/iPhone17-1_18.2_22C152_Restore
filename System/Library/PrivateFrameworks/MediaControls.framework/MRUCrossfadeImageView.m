@interface MRUCrossfadeImageView
- (MRUCrossfadeImageView)initWithCoder:(id)a3;
- (MRUCrossfadeImageView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (int64_t)contentMode;
- (void)layoutSubviews;
- (void)setContentMode:(int64_t)a3;
- (void)transitionTo:(id)a3;
@end

@implementation MRUCrossfadeImageView

- (UIImage)image
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MRUCrossfadeImageView_primaryImageView);
  v3 = self;
  if (objc_msgSend(v2, sel_isHidden)) {
    v2 = *(Class *)((char *)&v3->super.super.super.isa + OBJC_IVAR___MRUCrossfadeImageView_secondaryImageView);
  }
  id v4 = objc_msgSend(v2, sel_image);

  return (UIImage *)v4;
}

- (int64_t)contentMode
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CrossfadeImageView();
  return [(MRUCrossfadeImageView *)&v3 contentMode];
}

- (void)setContentMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CrossfadeImageView();
  id v4 = (char *)v5.receiver;
  [(MRUCrossfadeImageView *)&v5 setContentMode:a3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR___MRUCrossfadeImageView_primaryImageView], sel_setContentMode_, objc_msgSend(v4, sel_contentMode, v5.receiver, v5.super_class));
  objc_msgSend(*(id *)&v4[OBJC_IVAR___MRUCrossfadeImageView_secondaryImageView], sel_setContentMode_, objc_msgSend(v4, sel_contentMode));
}

- (MRUCrossfadeImageView)initWithFrame:(CGRect)a3
{
  return (MRUCrossfadeImageView *)sub_1AE928E28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MRUCrossfadeImageView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR___MRUCrossfadeImageView_primaryImageView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR___MRUCrossfadeImageView_secondaryImageView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);

  result = (MRUCrossfadeImageView *)sub_1AE9477B8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CrossfadeImageView();
  v2 = (char *)v5.receiver;
  [(MRUCrossfadeImageView *)&v5 layoutSubviews];
  objc_super v3 = *(void **)&v2[OBJC_IVAR___MRUCrossfadeImageView_primaryImageView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);
  id v4 = *(void **)&v2[OBJC_IVAR___MRUCrossfadeImageView_secondaryImageView];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
}

- (void)transitionTo:(id)a3
{
  id v5 = a3;
  id v6 = self;
  v9.is_nil = (char)v6;
  id v7 = v6;
  v9.value.super.isa = (Class)a3;
  CrossfadeImageView.transition(to:)(v9);
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MRUCrossfadeImageView_secondaryImageView);
}

@end