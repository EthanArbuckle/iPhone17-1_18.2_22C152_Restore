@interface CCUIToggleModule
- (BOOL)appearsSelected;
- (BOOL)expandsGridSizeClassesForAccessibility;
- (BOOL)isSelected;
- (CCUICAPackageDescription)glyphPackageDescription;
- (CCUIContentModuleContext)contentModuleContext;
- (NSString)glyphState;
- (NSString)selectedValueText;
- (NSString)title;
- (NSString)valueText;
- (UIColor)selectedColor;
- (UIImage)iconGlyph;
- (UIImage)selectedIconGlyph;
- (UIImageView)glyphImageView;
- (double)glyphScale;
- (id)contentViewControllerForContext:(id)a3;
- (void)reconfigureView;
- (void)refreshState;
- (void)refreshStateAnimated:(BOOL)a3;
- (void)setContentModuleContext:(id)a3;
@end

@implementation CCUIToggleModule

- (NSString)title
{
  displayName = self->_displayName;
  if (!displayName)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F28B50], "ccui_bundleForModuleInstance:", self);
    objc_msgSend(v4, "ccui_displayName");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_displayName;
    self->_displayName = v5;

    displayName = self->_displayName;
  }
  return displayName;
}

- (NSString)valueText
{
  return [(CCUIButtonModuleViewController *)self->_contentViewController valueText];
}

- (NSString)selectedValueText
{
  return [(CCUIButtonModuleViewController *)self->_contentViewController selectedValueText];
}

- (BOOL)isSelected
{
  return 0;
}

- (BOOL)appearsSelected
{
  return [(CCUIButtonModuleViewController *)self->_contentViewController appearsSelected];
}

- (UIImage)iconGlyph
{
  return 0;
}

- (UIImage)selectedIconGlyph
{
  return 0;
}

- (UIColor)selectedColor
{
  return 0;
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return 0;
}

- (NSString)glyphState
{
  return 0;
}

- (double)glyphScale
{
  return 1.0;
}

- (void)refreshStateAnimated:(BOOL)a3
{
}

- (void)reconfigureView
{
}

- (id)contentViewControllerForContext:(id)a3
{
  v4 = objc_alloc_init(CCUIToggleViewController);
  [(CCUIToggleViewController *)v4 setModule:self];
  objc_storeStrong((id *)&self->_contentViewController, v4);
  return v4;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void)refreshState
{
}

- (UIImageView)glyphImageView
{
  v2 = [(CCUIButtonModuleViewController *)self->_contentViewController buttonView];
  v3 = [v2 glyphImageView];

  return (UIImageView *)v3;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end