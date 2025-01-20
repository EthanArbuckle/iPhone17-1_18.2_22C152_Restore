@interface CNOnboardingPromptExtensionViewController
- (NSData)imageData;
- (NSString)bottomCaption;
- (NSString)contactBottomDetail;
- (NSString)contactCountString;
- (NSString)contactName;
- (double)avatarTrailingSpace;
- (double)avatarWidth;
- (void)loadView;
- (void)setAvatarTrailingSpace:(double)a3;
- (void)setAvatarWidth:(double)a3;
- (void)setBottomCaption:(id)a3;
- (void)setContactBottomDetail:(id)a3;
- (void)setContactCountString:(id)a3;
- (void)setContactName:(id)a3;
- (void)setImageData:(id)a3;
- (void)viewDidLoad;
@end

@implementation CNOnboardingPromptExtensionViewController

- (void)loadView
{
  v27.receiver = self;
  v27.super_class = (Class)CNOnboardingPromptExtensionViewController;
  [(CNOnboardingPromptExtensionViewController *)&v27 loadView];
  v3 = [(CNOnboardingPromptExtensionViewController *)self extensionContext];
  v4 = [v3 inputItems];
  v5 = [v4 firstObject];

  v6 = [v5 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"ContactName"];
  [(CNOnboardingPromptExtensionViewController *)self setContactName:v7];

  v8 = [v5 userInfo];
  v9 = [v8 objectForKeyedSubscript:@"BottomCaption"];
  [(CNOnboardingPromptExtensionViewController *)self setBottomCaption:v9];

  v10 = [v5 userInfo];
  v11 = [v10 objectForKeyedSubscript:@"ContactBottomDetail"];
  [(CNOnboardingPromptExtensionViewController *)self setContactBottomDetail:v11];

  v12 = [v5 userInfo];
  v13 = [v12 objectForKeyedSubscript:@"BottomCount"];
  [(CNOnboardingPromptExtensionViewController *)self setContactCountString:v13];

  v14 = [v5 userInfo];
  v15 = [v14 objectForKeyedSubscript:@"ImageData"];
  [(CNOnboardingPromptExtensionViewController *)self setImageData:v15];

  v16 = [v5 userInfo];
  v17 = [v16 objectForKeyedSubscript:@"AvatarWidth"];
  [v17 floatValue];
  [(CNOnboardingPromptExtensionViewController *)self setAvatarWidth:v18];

  v19 = [v5 userInfo];
  v20 = [v19 objectForKeyedSubscript:@"AvatarTrailingSpace"];
  [v20 floatValue];
  [(CNOnboardingPromptExtensionViewController *)self setAvatarTrailingSpace:v21];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v22 = [(CNOnboardingPromptExtensionViewController *)self contactName];
    v23 = [(CNOnboardingPromptExtensionViewController *)self contactBottomDetail];
    v24 = [(CNOnboardingPromptExtensionViewController *)self bottomCaption];
    v25 = [(CNOnboardingPromptExtensionViewController *)self contactCountString];
    v26 = [(CNOnboardingPromptExtensionViewController *)self imageData];
    *(_DWORD *)buf = 138478851;
    v29 = v22;
    __int16 v30 = 2113;
    v31 = v23;
    __int16 v32 = 2112;
    v33 = v24;
    __int16 v34 = 2112;
    v35 = v25;
    __int16 v36 = 2113;
    v37 = v26;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#ContactsButton loadView<Start> contactName: %{private}@  contactBottomDetail: %{private}@  bottomCaption: %@   contactCountStr: %@  imageData: %{private}@", buf, 0x34u);
  }
  -[CNOnboardingPromptExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, 125.0);
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)CNOnboardingPromptExtensionViewController;
  [(CNOnboardingPromptExtensionViewController *)&v16 viewDidLoad];
  v3 = [(CNOnboardingPromptExtensionViewController *)self contactName];
  v4 = [(CNOnboardingPromptExtensionViewController *)self contactBottomDetail];
  v5 = [(CNOnboardingPromptExtensionViewController *)self contactCountString];
  v6 = [(CNOnboardingPromptExtensionViewController *)self bottomCaption];
  [(CNOnboardingPromptExtensionViewController *)self avatarWidth];
  double v8 = v7;
  [(CNOnboardingPromptExtensionViewController *)self avatarTrailingSpace];
  double v10 = v9;
  v11 = [(CNOnboardingPromptExtensionViewController *)self imageData];
  v12 = +[OnboardingContactHostViewController makeHostingControllerWithName:v3 bottomField:v4 contactCountText:v5 bottomText:v6 avatarWidth:v11 trailPadding:v8 imageData:v10];

  v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, 270.0, 125.0);

  v14 = [(CNOnboardingPromptExtensionViewController *)self view];
  v15 = [v12 view];
  [v14 addSubview:v15];
}

- (NSString)contactName
{
  return self->_contactName;
}

- (void)setContactName:(id)a3
{
}

- (NSString)contactBottomDetail
{
  return self->_contactBottomDetail;
}

- (void)setContactBottomDetail:(id)a3
{
}

- (NSString)bottomCaption
{
  return self->_bottomCaption;
}

- (void)setBottomCaption:(id)a3
{
}

- (NSString)contactCountString
{
  return self->_contactCountString;
}

- (void)setContactCountString:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (double)avatarWidth
{
  return self->_avatarWidth;
}

- (void)setAvatarWidth:(double)a3
{
  self->_avatarWidth = a3;
}

- (double)avatarTrailingSpace
{
  return self->_avatarTrailingSpace;
}

- (void)setAvatarTrailingSpace:(double)a3
{
  self->_avatarTrailingSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_contactCountString, 0);
  objc_storeStrong((id *)&self->_bottomCaption, 0);
  objc_storeStrong((id *)&self->_contactBottomDetail, 0);

  objc_storeStrong((id *)&self->_contactName, 0);
}

@end