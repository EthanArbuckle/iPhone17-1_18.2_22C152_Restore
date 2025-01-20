@interface MKHairlineView
- (MKHairlineView)initWithFrame:(CGRect)a3;
- (UIColor)fillColor;
- (id)_bestStyleProviderForTraitCollection:(id)a3;
- (void)_createVibrancyEffectViewIfNeeded;
- (void)_fetchVibrancyGroupNameIfNeeded;
- (void)_invalidateStyleProvider;
- (void)_updateAppearanceForVibrancyChange;
- (void)_updateViewPositioning;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setFillColor:(id)a3;
@end

@implementation MKHairlineView

- (MKHairlineView)initWithFrame:(CGRect)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)MKHairlineView;
  v3 = -[MKHairlineView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v5;

    [(MKHairlineView *)v3 _invalidateStyleProvider];
    v7 = self;
    v12[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v9 = (id)[(MKHairlineView *)v3 registerForTraitChanges:v8 withAction:sel__invalidateStyleProvider];
  }
  return v3;
}

- (void)_invalidateStyleProvider
{
  v3 = [(MKHairlineView *)self traitCollection];
  id v4 = [(MKHairlineView *)self _bestStyleProviderForTraitCollection:v3];
  styleProvider = self->_styleProvider;
  self->_styleProvider = v4;

  [(MKHairlineView *)self _updateAppearanceForVibrancyChange];
}

- (id)_bestStyleProviderForTraitCollection:(id)a3
{
  uint64_t v3 = [a3 _vibrancy];
  id v4 = off_1E54B75A8;
  if (v3 != 1) {
    id v4 = off_1E54B74C8;
  }
  id v5 = objc_alloc_init(*v4);

  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MKHairlineView;
  [(MKHairlineView *)&v3 layoutSubviews];
  [(MKHairlineView *)self _updateViewPositioning];
}

- (void)_updateAppearanceForVibrancyChange
{
  objc_super v3 = [(MKHairlineView *)self fillColor];
  [(UIView *)self->_contentView setBackgroundColor:v3];

  id v4 = [(MKHairlineView *)self traitCollection];
  uint64_t v5 = [v4 _vibrancy];

  if (v5 == 1)
  {
    [(MKHairlineView *)self _createVibrancyEffectViewIfNeeded];
    [(UIVisualEffectView *)self->_vibrancyEffectView setHidden:0];
    styleProvider = self->_styleProvider;
    v7 = [(MKHairlineView *)self traitCollection];
    v8 = [(MKHairlineViewStyleProvider *)styleProvider vibrancyEffectForTraitCollection:v7];
    [(UIVisualEffectView *)self->_vibrancyEffectView setEffect:v8];

    [(MKHairlineView *)self _fetchVibrancyGroupNameIfNeeded];
    id v9 = [(UIVisualEffectView *)self->_vibrancyEffectView contentView];
    [v9 addSubview:self->_contentView];

    v10 = [(UIVisualEffectView *)self->_vibrancyEffectView superview];

    if (v10 != self)
    {
      [(MKHairlineView *)self addSubview:self->_vibrancyEffectView];
      [(MKHairlineView *)self _updateViewPositioning];
    }
  }
  else
  {
    [(MKHairlineView *)self addSubview:self->_contentView];
    [(MKHairlineView *)self _updateViewPositioning];
    vibrancyEffectView = self->_vibrancyEffectView;
    [(UIVisualEffectView *)vibrancyEffectView setHidden:1];
  }
}

- (void)_updateViewPositioning
{
  [(MKHairlineView *)self bounds];
  -[UIVisualEffectView setFrame:](self->_vibrancyEffectView, "setFrame:");
  id v3 = [(UIView *)self->_contentView superview];
  [v3 bounds];
  -[UIView setFrame:](self->_contentView, "setFrame:");
}

- (UIColor)fillColor
{
  fillColor = self->_fillColor;
  if (fillColor)
  {
    id v3 = fillColor;
  }
  else
  {
    id v3 = [(MKHairlineViewStyleProvider *)self->_styleProvider fillColor];
  }

  return v3;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MKHairlineView;
  [(MKHairlineView *)&v3 didMoveToWindow];
  [(MKHairlineView *)self _fetchVibrancyGroupNameIfNeeded];
}

- (void)_fetchVibrancyGroupNameIfNeeded
{
  objc_super v3 = [(MKHairlineView *)self window];

  if (v3)
  {
    vibrancyEffectView = self->_vibrancyEffectView;
    if (vibrancyEffectView)
    {
      if (([(UIVisualEffectView *)vibrancyEffectView isHidden] & 1) == 0)
      {
        uint64_t v5 = [(UIVisualEffectView *)self->_vibrancyEffectView _groupName];
        uint64_t v6 = [v5 length];

        if (!v6)
        {
          v7 = [(MKHairlineView *)self window];

          if (v7)
          {
            uint64_t v8 = [(MKHairlineView *)self superview];
            if (v8)
            {
              while (1)
              {
                id v11 = (id)v8;
                if (objc_opt_respondsToSelector()) {
                  break;
                }
                uint64_t v9 = [v11 superview];

                uint64_t v8 = v9;
                if (!v9) {
                  return;
                }
              }
              v10 = [v11 vibrancyGroupName];
              [(UIVisualEffectView *)self->_vibrancyEffectView _setGroupName:v10];
            }
          }
        }
      }
    }
  }
}

- (void)_createVibrancyEffectViewIfNeeded
{
  if (!self->_vibrancyEffectView)
  {
    objc_super v3 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    vibrancyEffectView = self->_vibrancyEffectView;
    self->_vibrancyEffectView = v3;
  }
}

- (void)setFillColor:(id)a3
{
  id v6 = a3;
  if ((-[UIColor isEqual:](self->_fillColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    uint64_t v5 = [(MKHairlineView *)self fillColor];
    [(UIView *)self->_contentView setBackgroundColor:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);

  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end