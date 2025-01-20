@interface GPImageEditionViewController
+ (BOOL)isAvailable;
- (BOOL)isLoadingRecipe;
- (BOOL)sourceImageIsSketch;
- (GPImageEditionViewController)init;
- (GPImageEditionViewControllerDelegate)delegate;
- (GPRecipe)recipe;
- (NSArray)generatedAssets;
- (NSString)localizedCreateButtonTitle;
- (UIImage)sourceImage;
- (_TtC15ImagePlayground29ImagePlaygroundViewController)generationViewController;
- (int64_t)style;
- (void)imageEditionViewController:(id)a3 didCreate:(id)a4;
- (void)imageGenerationViewControllerWantsToShowGrid:(id)a3;
- (void)imagePlaygroundViewControllerDidCancel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGeneratedAssets:(id)a3;
- (void)setGenerationViewController:(id)a3;
- (void)setIsLoadingRecipe:(BOOL)a3;
- (void)setRecipe:(id)a3;
- (void)setSourceImage:(id)a3;
- (void)setSourceImageIsSketch:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation GPImageEditionViewController

- (GPImageEditionViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)GPImageEditionViewController;
  v2 = [(GPImageEditionViewController *)&v8 initWithNibName:0 bundle:0];
  v3 = objc_alloc_init(_TtC15ImagePlayground29ImagePlaygroundViewController);
  [(GPImageEditionViewController *)v2 setGenerationViewController:v3];

  v4 = [(GPImageEditionViewController *)v2 generationViewController];
  [v4 setDelegate:v2];

  v5 = [(GPImageEditionViewController *)v2 generationViewController];
  [v5 setPrivateDelegate:v2];

  v6 = [(GPImageEditionViewController *)v2 generationViewController];
  [(UIViewController *)v2 gp_addChildViewController:v6];

  return v2;
}

- (int64_t)style
{
  v2 = [(GPImageEditionViewController *)self generationViewController];
  int64_t v3 = [v2 style];

  return v3;
}

- (void)setStyle:(int64_t)a3
{
  id v4 = [(GPImageEditionViewController *)self generationViewController];
  [v4 setStyle:a3];
}

- (GPRecipe)recipe
{
  v2 = [(GPImageEditionViewController *)self generationViewController];
  int64_t v3 = [v2 recipe];

  return (GPRecipe *)v3;
}

- (void)setRecipe:(id)a3
{
  id v4 = a3;
  id v5 = [(GPImageEditionViewController *)self generationViewController];
  [v5 setRecipe:v4];
}

- (UIImage)sourceImage
{
  v2 = [(GPImageEditionViewController *)self generationViewController];
  int64_t v3 = [v2 sourceImage];

  return (UIImage *)v3;
}

- (void)setSourceImage:(id)a3
{
  id v4 = a3;
  id v5 = [(GPImageEditionViewController *)self generationViewController];
  [v5 setSourceImage:v4];
}

- (BOOL)sourceImageIsSketch
{
  v2 = [(GPImageEditionViewController *)self generationViewController];
  char v3 = [v2 sourceImageIsSketch];

  return v3;
}

- (void)setSourceImageIsSketch:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GPImageEditionViewController *)self generationViewController];
  [v4 setSourceImageIsSketch:v3];
}

- (NSString)localizedCreateButtonTitle
{
  v2 = [(GPImageEditionViewController *)self generationViewController];
  BOOL v3 = [v2 localizedCreateButtonTitle];

  return (NSString *)v3;
}

+ (BOOL)isAvailable
{
  return +[ImagePlaygroundViewController available];
}

- (void)imagePlaygroundViewControllerDidCancel:(id)a3
{
  id v4 = [(GPImageEditionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  v6 = [(GPImageEditionViewController *)self delegate];
  id v8 = v6;
  if (v5)
  {
    [v6 imageEditionViewControllerDidCancel:self];
  }
  else
  {
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      return;
    }
    id v8 = [(GPImageEditionViewController *)self delegate];
    [v8 imageEditionViewControllerDidCancel:self requiresShowingGrid:0];
  }
}

- (void)imageGenerationViewControllerWantsToShowGrid:(id)a3
{
  id v4 = [(GPImageEditionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(GPImageEditionViewController *)self delegate];
    [v6 imageEditionViewControllerDidCancel:self requiresShowingGrid:1];
  }
}

- (void)imageEditionViewController:(id)a3 didCreate:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a4;
  char v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a4;
  char v7 = [v5 arrayWithObjects:&v9 count:1];

  -[GPImageEditionViewController setGeneratedAssets:](self, "setGeneratedAssets:", v7, v9, v10);
  id v8 = [(GPImageEditionViewController *)self delegate];
  [v8 imageEditionViewControllerDidFinishEditing:self error:0];
}

- (GPImageEditionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (GPImageEditionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)generatedAssets
{
  return (NSArray *)objc_getProperty(self, a2, 992, 1);
}

- (void)setGeneratedAssets:(id)a3
{
}

- (BOOL)isLoadingRecipe
{
  return self->isLoadingRecipe;
}

- (void)setIsLoadingRecipe:(BOOL)a3
{
  self->isLoadingRecipe = a3;
}

- (_TtC15ImagePlayground29ImagePlaygroundViewController)generationViewController
{
  return self->_generationViewController;
}

- (void)setGenerationViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationViewController, 0);
  objc_storeStrong((id *)&self->generatedAssets, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end