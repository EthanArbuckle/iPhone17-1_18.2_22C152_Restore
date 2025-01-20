@interface SFVibrantCellSelectionBackgroundView
- (SFVibrantCellSelectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)updateSelectionEffect;
@end

@implementation SFVibrantCellSelectionBackgroundView

- (SFVibrantCellSelectionBackgroundView)initWithFrame:(CGRect)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SFVibrantCellSelectionBackgroundView;
  v3 = -[SFVibrantCellSelectionBackgroundView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] blackColor];
    v5 = [(SFVibrantCellSelectionBackgroundView *)v3 contentView];
    [v5 setBackgroundColor:v4];

    v6 = self;
    v12[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v8 = (id)[(SFVibrantCellSelectionBackgroundView *)v3 registerForTraitChanges:v7 withTarget:v3 action:sel_updateSelectionEffect];

    [(SFVibrantCellSelectionBackgroundView *)v3 updateSelectionEffect];
    v9 = v3;
  }

  return v3;
}

- (void)updateSelectionEffect
{
  v3 = [(SFVibrantCellSelectionBackgroundView *)self traitCollection];
  v4 = objc_msgSend(v3, "sf_backgroundBlurEffect");
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultPopoverBackgroundEffect");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v6;

  v7 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v8 style:6];
  [(SFVibrantCellSelectionBackgroundView *)self setEffect:v7];
}

@end