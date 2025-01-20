@interface SamplePageViewController
- (PSFontFacePreviewController)controller;
- (SamplePageViewController)initWithPage:(int64_t)a3 andController:(id)a4;
- (int64_t)page;
- (void)loadView;
- (void)setController:(id)a3;
- (void)setPage:(int64_t)a3;
@end

@implementation SamplePageViewController

- (SamplePageViewController)initWithPage:(int64_t)a3 andController:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SamplePageViewController;
  v7 = [(SamplePageViewController *)&v10 initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7)
  {
    [(SamplePageViewController *)v7 setPage:a3];
    [(SamplePageViewController *)v8 setController:v6];
  }

  return v8;
}

- (void)loadView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->controller);
  v3 = objc_msgSend(WeakRetained, "sampleViewForPage:", -[SamplePageViewController page](self, "page"));
  [(SamplePageViewController *)self setView:v3];
}

- (PSFontFacePreviewController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->controller);

  return (PSFontFacePreviewController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (int64_t)page
{
  return self->page;
}

- (void)setPage:(int64_t)a3
{
  self->page = a3;
}

- (void).cxx_destruct
{
}

@end