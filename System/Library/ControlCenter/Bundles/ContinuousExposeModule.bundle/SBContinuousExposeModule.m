@interface SBContinuousExposeModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (id)_glyphImage;
- (id)_selectedColor;
- (id)_symbolConfiguration;
- (id)backgroundViewControllerForContext:(id)a3;
- (id)contentViewControllerForContext:(id)a3;
- (void)setContentModuleContext:(id)a3;
@end

@implementation SBContinuousExposeModule

- (void)setContentModuleContext:(id)a3
{
}

- (id)contentViewControllerForContext:(id)a3
{
  v4 = objc_alloc_init(SBContinuousExposeModuleController);
  v5 = [[SBContinuousExposeModuleViewController alloc] initWithContinuousExposeController:v4];
  [(SBContinuousExposeModuleViewController *)v5 setContentModuleContext:self->_contentModuleContext];
  v6 = [(SBContinuousExposeModule *)self _glyphImage];
  [(SBContinuousExposeModuleViewController *)v5 setGlyphImage:v6];

  v7 = [(SBContinuousExposeModule *)self _selectedColor];
  [(SBContinuousExposeModuleViewController *)v5 setSelectedGlyphColor:v7];

  return v5;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  return 0;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (id)_glyphImage
{
  v2 = [(SBContinuousExposeModule *)self _symbolConfiguration];
  v3 = +[UIImage systemImageNamed:@"squares.leading.rectangle" withConfiguration:v2];

  return v3;
}

- (id)_symbolConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:28.0];
}

- (id)_selectedColor
{
  return +[UIColor systemBlueColor];
}

- (void).cxx_destruct
{
}

@end