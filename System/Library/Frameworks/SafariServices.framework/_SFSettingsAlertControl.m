@interface _SFSettingsAlertControl
- (BOOL)hidesSeparator;
- (SFSettingsAlertItemViewDelegate)delegate;
- (_SFSettingsAlertControl)initWithFrame:(CGRect)a3;
- (_SFSettingsAlertItem)item;
- (_SFSettingsAlertItemBackgroundView)backgroundView;
- (int64_t)backgroundMode;
- (int64_t)defaultBackgroundMode;
- (void)_updateBackgroundView;
- (void)setDefaultBackgroundMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHidesSeparator:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItem:(id)a3;
@end

@implementation _SFSettingsAlertControl

- (_SFSettingsAlertControl)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_SFSettingsAlertControl;
  v3 = -[_SFSettingsAlertControl initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_defaultBackgroundMode = 4;
    v5 = [_SFSettingsAlertItemBackgroundView alloc];
    [(_SFSettingsAlertControl *)v4 bounds];
    uint64_t v6 = -[_SFSettingsAlertItemBackgroundView initWithFrame:](v5, "initWithFrame:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (_SFSettingsAlertItemBackgroundView *)v6;

    [(_SFSettingsAlertItemBackgroundView *)v4->_backgroundView setAutoresizingMask:18];
    [(_SFSettingsAlertControl *)v4 addSubview:v4->_backgroundView];
    [(_SFSettingsAlertControl *)v4 _updateBackgroundView];
    [(_SFSettingsAlertControl *)v4 setFocusGroupIdentifier:0];
    v8 = v4;
  }

  return v4;
}

- (void)setHidesSeparator:(BOOL)a3
{
  if (self->_hidesSeparator != a3)
  {
    self->_hidesSeparator = a3;
    [(_SFSettingsAlertControl *)self _updateBackgroundView];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFSettingsAlertControl;
  [(_SFSettingsAlertControl *)&v4 setHighlighted:a3];
  [(_SFSettingsAlertControl *)self _updateBackgroundView];
}

- (void)setDefaultBackgroundMode:(int64_t)a3
{
  if (self->_defaultBackgroundMode != a3)
  {
    self->_defaultBackgroundMode = a3;
    [(_SFSettingsAlertControl *)self _updateBackgroundView];
  }
}

- (void)_updateBackgroundView
{
  if (([(_SFSettingsAlertControl *)self isHighlighted] & 1) != 0
    || ([(_SFSettingsAlertControl *)self isFocused] & 1) != 0)
  {
    int64_t v3 = 1;
  }
  else if (self->_hidesSeparator)
  {
    int64_t v3 = 0;
  }
  else
  {
    int64_t v3 = [(_SFSettingsAlertControl *)self defaultBackgroundMode];
  }
  backgroundView = self->_backgroundView;

  [(_SFSettingsAlertItemBackgroundView *)backgroundView setMode:v3];
}

- (int64_t)backgroundMode
{
  return [(_SFSettingsAlertItemBackgroundView *)self->_backgroundView mode];
}

- (SFSettingsAlertItemViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFSettingsAlertItemViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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

- (_SFSettingsAlertItemBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (int64_t)defaultBackgroundMode
{
  return self->_defaultBackgroundMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_item);

  objc_destroyWeak((id *)&self->_delegate);
}

@end