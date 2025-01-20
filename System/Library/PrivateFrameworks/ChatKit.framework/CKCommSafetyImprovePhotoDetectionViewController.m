@interface CKCommSafetyImprovePhotoDetectionViewController
- (CKCommSafetyImprovePhotoDetectionViewController)initWithChatItem:(id)a3;
- (UIImageView)imageView;
- (id)configureImageFromChatItem:(id)a3;
- (void)layoutImageView;
- (void)setImageView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CKCommSafetyImprovePhotoDetectionViewController

- (CKCommSafetyImprovePhotoDetectionViewController)initWithChatItem:(id)a3
{
  id v4 = a3;
  v5 = [(CKCommSafetyImprovePhotoDetectionViewController *)self init];
  v6 = v5;
  if (v5)
  {
    v7 = [(CKCommSafetyImprovePhotoDetectionViewController *)v5 configureImageFromChatItem:v4];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v7];
    [(CKCommSafetyImprovePhotoDetectionViewController *)v6 setImageView:v8];

    v9 = [(CKCommSafetyImprovePhotoDetectionViewController *)v6 imageView];
    v10 = [(CKCommSafetyImprovePhotoDetectionViewController *)v6 view];
    objc_msgSend(v9, "__ck_makeEdgesEqualTo:", v10);
  }
  return v6;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CKCommSafetyImprovePhotoDetectionViewController;
  [(CKCommSafetyImprovePhotoDetectionViewController *)&v4 viewDidLoad];
  v3 = [(CKCommSafetyImprovePhotoDetectionViewController *)self view];
  [v3 addSubview:self->_imageView];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKCommSafetyImprovePhotoDetectionViewController;
  [(CKCommSafetyImprovePhotoDetectionViewController *)&v3 viewDidLayoutSubviews];
  [(CKCommSafetyImprovePhotoDetectionViewController *)self layoutImageView];
}

- (id)configureImageFromChatItem:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F6BCC8];
  id v4 = a3;
  v5 = [v3 sharedInstance];
  v6 = [v4 transferGUID];

  v7 = [v5 transferForGUID:v6];

  v8 = [v7 localURL];
  v9 = (void *)MEMORY[0x1E4F42A80];
  v10 = [v8 path];
  v11 = [v9 imageWithContentsOfFile:v10];

  return v11;
}

- (void)layoutImageView
{
  [(UIImageView *)self->_imageView setContentMode:1];
  objc_super v3 = [(CKCommSafetyImprovePhotoDetectionViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  [(UIImageView *)self->_imageView bounds];
  double v7 = v5 / v6;

  v8 = [(CKCommSafetyImprovePhotoDetectionViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  [(UIImageView *)self->_imageView bounds];
  double v12 = v10 / v11;

  if (v7 >= v12) {
    double v7 = v12;
  }
  [(UIImageView *)self->_imageView bounds];
  double v14 = v7 * v13;
  [(UIImageView *)self->_imageView bounds];
  double v16 = v7 * v15;
  v17 = [(CKCommSafetyImprovePhotoDetectionViewController *)self view];
  [v17 bounds];
  double v19 = v18;
  v20 = [(CKCommSafetyImprovePhotoDetectionViewController *)self view];
  [v20 bounds];
  double v22 = v21;

  id v23 = [(CKCommSafetyImprovePhotoDetectionViewController *)self imageView];
  objc_msgSend(v23, "setFrame:", v19, v22, v14, v16);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end