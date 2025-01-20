@interface HUNCCameraPlayerPlaceholderContentViewController
- (BOOL)shouldShowPlaceholderContent;
- (HUNCCameraPlayerPlaceholderContentViewController)initWithImageURL:(id)a3;
- (NSURL)imageURL;
- (UIImage)notificationImage;
- (UIImageView)placeholderImageView;
- (void)setImageURL:(id)a3;
- (void)setNotificationImage:(id)a3;
- (void)setPlaceholderImageView:(id)a3;
- (void)setShouldShowPlaceholderContent:(BOOL)a3;
- (void)updatePlaceholderImage:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUNCCameraPlayerPlaceholderContentViewController

- (HUNCCameraPlayerPlaceholderContentViewController)initWithImageURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUNCCameraPlayerPlaceholderContentViewController;
  v6 = [(HUNCCameraPlayerPlaceholderContentViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_imageURL, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)HUNCCameraPlayerPlaceholderContentViewController;
  [(HUNCCameraPlayerPlaceholderContentViewController *)&v15 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  v4 = [(HUNCCameraPlayerPlaceholderContentViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(HUNCCameraPlayerPlaceholderContentViewController *)self view];
  [v5 setUserInteractionEnabled:0];

  v6 = [(HUNCCameraPlayerPlaceholderContentViewController *)self view];
  v7 = [(HUNCCameraPlayerPlaceholderContentViewController *)self placeholderImageView];
  [v6 addSubview:v7];

  v8 = [(HUNCCameraPlayerPlaceholderContentViewController *)self notificationImage];
  if (v8)
  {
    objc_super v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(HUNCCameraPlayerPlaceholderContentViewController *)self imageURL];
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "(NC) Displaying placeholder image using URL:%@", buf, 0xCu);
    }
    [(HUNCCameraPlayerPlaceholderContentViewController *)self updatePlaceholderImage:v8];
  }
  v11 = (void *)MEMORY[0x1E4F28DC8];
  v12 = [(HUNCCameraPlayerPlaceholderContentViewController *)self placeholderImageView];
  v13 = [(HUNCCameraPlayerPlaceholderContentViewController *)self view];
  v14 = objc_msgSend(v11, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v12, v13);
  [v11 activateConstraints:v14];
}

- (void)updatePlaceholderImage:(id)a3
{
  id v4 = a3;
  id v5 = [(HUNCCameraPlayerPlaceholderContentViewController *)self placeholderImageView];
  [v5 setImage:v4];
}

- (UIImageView)placeholderImageView
{
  placeholderImageView = self->_placeholderImageView;
  if (!placeholderImageView)
  {
    id v4 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:0];
    [(UIImageView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = self->_placeholderImageView;
    self->_placeholderImageView = v4;
    v6 = v4;

    [(UIImageView *)self->_placeholderImageView setContentMode:2];
    placeholderImageView = self->_placeholderImageView;
  }

  return placeholderImageView;
}

- (UIImage)notificationImage
{
  notificationImage = self->_notificationImage;
  if (!notificationImage)
  {
    id v4 = [(HUNCCameraPlayerPlaceholderContentViewController *)self imageURL];
    [v4 startAccessingSecurityScopedResource];

    id v5 = (void *)MEMORY[0x1E4F1C9B8];
    v6 = [(HUNCCameraPlayerPlaceholderContentViewController *)self imageURL];
    v7 = [v5 dataWithContentsOfURL:v6];

    v8 = [MEMORY[0x1E4F42A80] imageWithData:v7];
    objc_super v9 = [(HUNCCameraPlayerPlaceholderContentViewController *)self imageURL];
    [v9 stopAccessingSecurityScopedResource];

    v10 = self->_notificationImage;
    self->_notificationImage = v8;

    notificationImage = self->_notificationImage;
  }

  return notificationImage;
}

- (BOOL)shouldShowPlaceholderContent
{
  return self->_shouldShowPlaceholderContent;
}

- (void)setShouldShowPlaceholderContent:(BOOL)a3
{
  self->_shouldShowPlaceholderContent = a3;
}

- (void)setPlaceholderImageView:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (void)setNotificationImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationImage, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);

  objc_storeStrong((id *)&self->_placeholderImageView, 0);
}

@end