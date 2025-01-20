@interface ICDocCamPageContentViewController
+ (double)leadingTrailingOffset:(int64_t)a3;
- (BOOL)_canShowWhileLocked;
- (ICDocCamPageContentViewTapDelegate)tapDelegate;
- (UIImage)image;
- (UIImageView)imageView;
- (unint64_t)pageIndex;
- (void)didReceiveMemoryWarning;
- (void)handleSingleTap:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setTapDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICDocCamPageContentViewController

+ (double)leadingTrailingOffset:(int64_t)a3
{
  return 0.0;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)ICDocCamPageContentViewController;
  [(ICDocCamPageContentViewController *)&v7 viewDidLoad];
  v3 = [(ICDocCamPageContentViewController *)self image];
  v4 = [(ICDocCamPageContentViewController *)self imageView];
  [v4 setImage:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_handleSingleTap_];
  [v5 setNumberOfTapsRequired:1];
  v6 = [(ICDocCamPageContentViewController *)self view];
  [v6 addGestureRecognizer:v5];
}

- (void)handleSingleTap:(id)a3
{
  id v4 = [(ICDocCamPageContentViewController *)self tapDelegate];
  objc_msgSend(v4, "pageContentViewDidTap:", -[ICDocCamPageContentViewController pageIndex](self, "pageIndex"));
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)ICDocCamPageContentViewController;
  [(ICDocCamPageContentViewController *)&v2 didReceiveMemoryWarning];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (ICDocCamPageContentViewTapDelegate)tapDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapDelegate);

  return (ICDocCamPageContentViewTapDelegate *)WeakRetained;
}

- (void)setTapDelegate:(id)a3
{
}

- (UIImageView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);

  return (UIImageView *)WeakRetained;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_tapDelegate);

  objc_storeStrong((id *)&self->_image, 0);
}

@end