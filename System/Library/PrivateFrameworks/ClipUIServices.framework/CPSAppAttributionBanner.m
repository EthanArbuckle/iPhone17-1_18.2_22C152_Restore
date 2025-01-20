@interface CPSAppAttributionBanner
+ (ISImageDescriptor)preferredImageDescriptor;
- (BOOL)showsAppStoreButton;
- (CPSAppAttributionBanner)init;
- (CPSAppAttributionBanner)initWithCoder:(id)a3;
- (CPSAppAttributionBanner)initWithFrame:(CGRect)a3;
- (NSString)subtitle;
- (NSString)supertitle;
- (NSString)title;
- (UIImage)icon;
- (id)tapAction;
- (void)_handleTap:(id)a3;
- (void)commonInit;
- (void)setIcon:(id)a3;
- (void)setShowsAppStoreButton:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSupertitle:(id)a3;
- (void)setTapAction:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CPSAppAttributionBanner

+ (ISImageDescriptor)preferredImageDescriptor
{
  id v2 = objc_alloc(MEMORY[0x1E4F6F258]);
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 scale];
  v5 = objc_msgSend(v2, "initWithSize:scale:", 48.0, 48.0, v4);

  [v5 setShape:1];

  return (ISImageDescriptor *)v5;
}

- (CPSAppAttributionBanner)init
{
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  v7.receiver = self;
  v7.super_class = (Class)CPSAppAttributionBanner;
  double v4 = -[CPSAppAttributionBanner initWithFrame:](&v7, sel_initWithFrame_);

  if (v4)
  {
    [(CPSAppAttributionBanner *)v4 commonInit];
    v5 = v4;
  }

  return v4;
}

- (CPSAppAttributionBanner)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPSAppAttributionBanner;
  v3 = -[CPSAppAttributionBanner initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(CPSAppAttributionBanner *)v3 commonInit];
    v5 = v4;
  }

  return v4;
}

- (CPSAppAttributionBanner)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-[CPSAppAttributionBanner initWithCoder:] is not available." userInfo:0];
  objc_exception_throw(v4);
}

- (void)commonInit
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D8589000, log, OS_LOG_TYPE_ERROR, "Could not load CPSAppAttributionBanner nib!", v1, 2u);
}

- (void)_handleTap:(id)a3
{
  tapAction = (void (**)(void))self->_tapAction;
  if (tapAction) {
    tapAction[2]();
  }
}

- (UIImage)icon
{
  return [(UIImageView *)self->_iconView image];
}

- (void)setIcon:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(CPSLabelWithPlaceholder *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  [(CPSLabelWithPlaceholder *)self->_titleLabel setText:a3];
  id v4 = [(CPSLabelWithPlaceholder *)self->_titleLabel text];
  -[CPSLabelWithPlaceholder setPlaceholderWidth:](self->_subtitleLabel, "setPlaceholderWidth:", fmax(fmin((double)(unint64_t)(5 * [v4 length]), 200.0), 50.0));
}

- (NSString)subtitle
{
  return (NSString *)[(CPSLabelWithPlaceholder *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)supertitle
{
  return [(UILabel *)self->_supertitleLabel text];
}

- (void)setSupertitle:(id)a3
{
}

- (void)setShowsAppStoreButton:(BOOL)a3
{
}

- (BOOL)showsAppStoreButton
{
  return [(CPSAppStoreButton *)self->_appStoreButton isHidden] ^ 1;
}

- (id)tapAction
{
  return self->_tapAction;
}

- (void)setTapAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapAction, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_overlayButton, 0);
  objc_storeStrong((id *)&self->_appStoreButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_supertitleLabel, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

@end