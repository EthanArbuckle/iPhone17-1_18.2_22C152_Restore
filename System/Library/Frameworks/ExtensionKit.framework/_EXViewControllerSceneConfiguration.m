@interface _EXViewControllerSceneConfiguration
- (Class)viewControllerClass;
- (NSString)storyboardName;
- (NSString)viewControllerClassName;
- (UIStoryboard)storyboard;
- (void)setStoryboard:(id)a3;
- (void)setStoryboardName:(id)a3;
- (void)setViewControllerClass:(Class)a3;
- (void)setViewControllerClassName:(id)a3;
@end

@implementation _EXViewControllerSceneConfiguration

- (UIStoryboard)storyboard
{
  storyboard = self->_storyboard;
  if (!storyboard)
  {
    v4 = [(_EXViewControllerSceneConfiguration *)self storyboardName];
    if (v4
      && ([MEMORY[0x263F82C28] storyboardWithName:v4 bundle:0],
          (v5 = (UIStoryboard *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = self->_storyboard;
      self->_storyboard = v5;
      v7 = v5;
    }
    else
    {
      v8 = [MEMORY[0x263EFF9D0] null];
      v7 = self->_storyboard;
      self->_storyboard = v8;
    }

    storyboard = self->_storyboard;
  }
  v9 = [MEMORY[0x263EFF9D0] null];

  if (storyboard == v9) {
    v10 = 0;
  }
  else {
    v10 = self->_storyboard;
  }

  return v10;
}

- (Class)viewControllerClass
{
  viewControllerClass = (NSString *)self->_viewControllerClass;
  if (!viewControllerClass)
  {
    viewControllerClass = self->_viewControllerClassName;
    if (viewControllerClass)
    {
      NSClassFromString(viewControllerClass);
      v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
      Class v5 = self->_viewControllerClass;
      self->_viewControllerClass = v4;

      viewControllerClass = (NSString *)self->_viewControllerClass;
    }
  }

  return (Class)viewControllerClass;
}

- (NSString)storyboardName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoryboardName:(id)a3
{
}

- (void)setStoryboard:(id)a3
{
}

- (NSString)viewControllerClassName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setViewControllerClassName:(id)a3
{
}

- (void)setViewControllerClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerClass, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);

  objc_storeStrong((id *)&self->_storyboardName, 0);
}

@end