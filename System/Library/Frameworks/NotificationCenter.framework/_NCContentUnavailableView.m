@interface _NCContentUnavailableView
- (double)_labelAlpha;
- (id)_titleFont;
- (id)_visualStylingProvider;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateVisualStyling;
- (void)didMoveToWindow;
@end

@implementation _NCContentUnavailableView

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_NCContentUnavailableView;
  [(_NCContentUnavailableView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(_NCContentUnavailableView *)self _updateVisualStyling];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_NCContentUnavailableView;
  [(_UIContentUnavailableView *)&v4 didMoveToWindow];
  objc_super v3 = [(_NCContentUnavailableView *)self window];

  if (v3)
  {
    [(_NCContentUnavailableView *)self layoutIfNeeded];
    [(_NCContentUnavailableView *)self _updateVisualStyling];
  }
}

- (id)_titleFont
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
}

- (double)_labelAlpha
{
  return 1.0;
}

- (id)_visualStylingProvider
{
  v2 = (void *)MEMORY[0x263F54000];
  objc_super v3 = [(_NCContentUnavailableView *)self traitCollection];
  objc_super v4 = objc_msgSend(v2, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 3, 1, objc_msgSend(v3, "userInterfaceStyle"));

  return v4;
}

- (void)_updateVisualStyling
{
  id v5 = [(_UIContentUnavailableView *)self _titleLabel];
  objc_super v3 = [(_NCContentUnavailableView *)self _visualStylingProvider];
  objc_super v4 = [v3 _visualStylingForStyle:1];
  objc_msgSend(v5, "mt_replaceVisualStyling:", v4);
}

@end