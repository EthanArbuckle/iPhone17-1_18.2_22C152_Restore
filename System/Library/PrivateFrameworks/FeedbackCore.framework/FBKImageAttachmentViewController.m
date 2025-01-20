@interface FBKImageAttachmentViewController
+ (BOOL)canDisplayURL:(id)a3;
- (NSURL)imageURL;
- (UIImageView)imageView;
- (UIScrollView)scrollView;
- (void)didReceiveMemoryWarning;
- (void)loadImage;
- (void)setImageURL:(id)a3;
- (void)setImageUrl:(id)a3;
- (void)setImageView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FBKImageAttachmentViewController

+ (BOOL)canDisplayURL:(id)a3
{
  v3 = [a3 pathExtension];
  v4 = [v3 lowercaseString];

  LOBYTE(v3) = [&unk_26DE1EE98 containsObject:v4];
  return (char)v3;
}

- (void)setImageUrl:(id)a3
{
  [(FBKImageAttachmentViewController *)self setImageURL:a3];

  [(FBKImageAttachmentViewController *)self loadImage];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)FBKImageAttachmentViewController;
  [(FBKImageAttachmentViewController *)&v14 viewDidLoad];
  v3 = [(FBKImageAttachmentViewController *)self scrollView];
  [v3 setShowsVerticalScrollIndicator:0];

  v4 = [(FBKImageAttachmentViewController *)self scrollView];
  [v4 setShowsHorizontalScrollIndicator:0];

  v5 = [(FBKImageAttachmentViewController *)self scrollView];
  [v5 setAlwaysBounceVertical:1];

  v6 = [(FBKImageAttachmentViewController *)self scrollView];
  [v6 setAlwaysBounceHorizontal:1];

  v7 = [(FBKImageAttachmentViewController *)self scrollView];
  [v7 setMinimumZoomScale:1.0];

  v8 = [(FBKImageAttachmentViewController *)self scrollView];
  [v8 setMaximumZoomScale:6.0];

  v9 = [(FBKImageAttachmentViewController *)self imageView];
  [v9 setUserInteractionEnabled:1];

  v10 = [(FBKImageAttachmentViewController *)self imageView];
  [v10 setMultipleTouchEnabled:1];

  v11 = [(FBKImageAttachmentViewController *)self imageView];
  [v11 setClipsToBounds:1];

  v12 = [MEMORY[0x263F825C8] clearColor];
  v13 = [(FBKImageAttachmentViewController *)self view];
  [v13 setBackgroundColor:v12];

  [(FBKImageAttachmentViewController *)self loadImage];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)FBKImageAttachmentViewController;
  [(FBKImageAttachmentViewController *)&v2 didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBKImageAttachmentViewController;
  [(FBKImageAttachmentViewController *)&v3 viewWillAppear:a3];
}

- (void)loadImage
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "imageView and/or imageURL nil", v1, 2u);
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
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

- (NSURL)imageURL
{
  return (NSURL *)objc_getProperty(self, a2, 992, 1);
}

- (void)setImageURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_destroyWeak((id *)&self->_imageView);

  objc_destroyWeak((id *)&self->_scrollView);
}

@end