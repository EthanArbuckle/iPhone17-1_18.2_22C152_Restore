@interface MRUMediaControlsModuleGradientView
- (BOOL)isGradientEnabled;
- (MRUMediaControlsModuleGradientView)initWithCoder:(id)a3;
- (MRUMediaControlsModuleGradientView)initWithFrame:(CGRect)a3;
- (UIImage)backdropImage;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackdropImage:(id)a3;
- (void)setIsGradientEnabled:(BOOL)a3;
@end

@implementation MRUMediaControlsModuleGradientView

- (BOOL)isGradientEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___MRUMediaControlsModuleGradientView_isGradientEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsGradientEnabled:(BOOL)a3
{
  v4 = self;
  MediaControlsModuleGradientView.isGradientEnabled.setter(a3);
}

- (UIImage)backdropImage
{
  v2 = *(uint64_t (**)(void))((**(void **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR___MRUMediaControlsModuleGradientView_backdropImageView) & *MEMORY[0x1E4FBC8C8])
                           + 0x60);
  v3 = self;
  v4 = (void *)v2();

  return (UIImage *)v4;
}

- (void)setBackdropImage:(id)a3
{
  v5 = *(void (**)(id))((**(void **)((char *)&self->super.super.super.isa
                                                + OBJC_IVAR___MRUMediaControlsModuleGradientView_backdropImageView) & *MEMORY[0x1E4FBC8C8])
                                 + 0x78);
  id v7 = a3;
  v6 = self;
  v5(a3);
}

- (MRUMediaControlsModuleGradientView)initWithFrame:(CGRect)a3
{
  return (MRUMediaControlsModuleGradientView *)sub_1AE91C6B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MRUMediaControlsModuleGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE91D1D8();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MediaControlsModuleGradientView();
  v2 = (char *)v5.receiver;
  [(MRUMediaControlsModuleGradientView *)&v5 layoutSubviews];
  id v3 = self;
  objc_msgSend(v3, sel_begin, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setDisableActions_, 1);
  v4 = *(void **)&v2[OBJC_IVAR___MRUMediaControlsModuleGradientView_gradientLayer];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
  objc_msgSend(v3, sel_commit);
}

- (void)prepareForReuse
{
  v2 = self;
  MediaControlsModuleGradientView.prepareForReuse()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MRUMediaControlsModuleGradientView_backdropImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MRUMediaControlsModuleGradientView_gradientLayer);
}

@end