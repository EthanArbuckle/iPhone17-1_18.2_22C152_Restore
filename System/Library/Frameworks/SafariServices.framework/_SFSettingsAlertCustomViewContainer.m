@interface _SFSettingsAlertCustomViewContainer
- (BOOL)hidesSeparator;
- (BOOL)isEnabled;
- (BOOL)isSelected;
- (NSAttributedString)attributedDetailText;
- (NSAttributedString)attributedText;
- (NSString)detailText;
- (NSString)text;
- (SFSettingsAlertItemViewDelegate)delegate;
- (UIImage)image;
- (UIView)contentView;
- (_SFSettingsAlertCustomViewContainer)initWithContentView:(id)a3;
- (_SFSettingsAlertItem)item;
- (int64_t)backgroundMode;
- (int64_t)defaultBackgroundMode;
- (void)setAttributedDetailText:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setDefaultBackgroundMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHidesSeparator:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setItem:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation _SFSettingsAlertCustomViewContainer

- (_SFSettingsAlertCustomViewContainer)initWithContentView:(id)a3
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 bounds];
  v25.receiver = self;
  v25.super_class = (Class)_SFSettingsAlertCustomViewContainer;
  v5 = -[_SFSettingsAlertCustomViewContainer initWithFrame:](&v25, sel_initWithFrame_);
  if (v5)
  {
    v6 = [_SFSettingsAlertItemBackgroundView alloc];
    [(_SFSettingsAlertCustomViewContainer *)v5 bounds];
    uint64_t v7 = -[_SFSettingsAlertItemBackgroundView initWithFrame:](v6, "initWithFrame:");
    backgroundView = v5->_backgroundView;
    v5->_backgroundView = (_SFSettingsAlertItemBackgroundView *)v7;

    [(_SFSettingsAlertItemBackgroundView *)v5->_backgroundView setAutoresizingMask:18];
    [(_SFSettingsAlertCustomViewContainer *)v5 addSubview:v5->_backgroundView];
    [(_SFSettingsAlertCustomViewContainer *)v5 addSubview:v4];
    v19 = (void *)MEMORY[0x1E4F28DC8];
    v24 = [v4 topAnchor];
    v23 = [(_SFSettingsAlertCustomViewContainer *)v5 topAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v26[0] = v22;
    v21 = [v4 leadingAnchor];
    v20 = [(_SFSettingsAlertCustomViewContainer *)v5 leadingAnchor];
    v9 = [v21 constraintEqualToAnchor:v20];
    v26[1] = v9;
    v10 = [v4 bottomAnchor];
    v11 = [(_SFSettingsAlertCustomViewContainer *)v5 bottomAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v26[2] = v12;
    v13 = [v4 trailingAnchor];
    v14 = [(_SFSettingsAlertCustomViewContainer *)v5 trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v26[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
    [v19 activateConstraints:v16];

    v17 = v5;
  }

  return v5;
}

- (void)setHidesSeparator:(BOOL)a3
{
  if (self->_hidesSeparator != a3)
  {
    self->_hidesSeparator = a3;
    if (a3) {
      int64_t defaultBackgroundMode = 0;
    }
    else {
      int64_t defaultBackgroundMode = self->_defaultBackgroundMode;
    }
    [(_SFSettingsAlertItemBackgroundView *)self->_backgroundView setMode:defaultBackgroundMode];
  }
}

- (void)setDefaultBackgroundMode:(int64_t)a3
{
  if (self->_defaultBackgroundMode != a3)
  {
    self->_int64_t defaultBackgroundMode = a3;
    if (self->_hidesSeparator) {
      a3 = 0;
    }
    [(_SFSettingsAlertItemBackgroundView *)self->_backgroundView setMode:a3];
  }
}

- (int64_t)backgroundMode
{
  return [(_SFSettingsAlertItemBackgroundView *)self->_backgroundView mode];
}

- (NSString)text
{
  return self->text;
}

- (void)setText:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return self->attributedText;
}

- (void)setAttributedText:(id)a3
{
}

- (NSString)detailText
{
  return self->detailText;
}

- (void)setDetailText:(id)a3
{
}

- (NSAttributedString)attributedDetailText
{
  return self->attributedDetailText;
}

- (void)setAttributedDetailText:(id)a3
{
}

- (UIImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
}

- (BOOL)isSelected
{
  return self->selected;
}

- (void)setSelected:(BOOL)a3
{
  self->selected = a3;
}

- (BOOL)isEnabled
{
  return self->enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

- (SFSettingsAlertItemViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SFSettingsAlertItemViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (_SFSettingsAlertItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  return (_SFSettingsAlertItem *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (BOOL)hidesSeparator
{
  return self->_hidesSeparator;
}

- (int64_t)defaultBackgroundMode
{
  return self->_defaultBackgroundMode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->image, 0);
  objc_storeStrong((id *)&self->attributedDetailText, 0);
  objc_storeStrong((id *)&self->detailText, 0);
  objc_storeStrong((id *)&self->attributedText, 0);
  objc_storeStrong((id *)&self->text, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end