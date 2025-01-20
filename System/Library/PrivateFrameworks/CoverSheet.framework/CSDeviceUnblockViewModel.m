@interface CSDeviceUnblockViewModel
- (CSDeviceBlockViewController)blockViewController;
- (CSDeviceUnblockPolicy)unblockPolicy;
- (CSDeviceUnblockViewModel)initWithUnblockPolicy:(id)a3 blockViewController:(id)a4;
- (id)_localizedProductName;
- (id)_localizedStringForKey:(id)a3;
- (id)bodySubtitleText;
- (id)bodyTextForTimeout:(id)a3;
- (id)cancelButtonText;
- (id)iconName;
- (id)primaryButtonText;
- (id)secondaryButtonText;
- (id)titleText;
- (void)setBlockViewController:(id)a3;
- (void)setUnblockPolicy:(id)a3;
@end

@implementation CSDeviceUnblockViewModel

- (CSDeviceUnblockViewModel)initWithUnblockPolicy:(id)a3 blockViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSDeviceUnblockViewModel;
  v9 = [(CSDeviceUnblockViewModel *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unblockPolicy, a3);
    objc_storeWeak((id *)&v10->_blockViewController, v8);
  }

  return v10;
}

- (id)_localizedProductName
{
  v2 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  v3 = [v2 localizedProductName];

  return v3;
}

- (id)_localizedStringForKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:v4 value:&stru_1F3020248 table:@"CoverSheet"];

  return v6;
}

- (id)iconName
{
  return &stru_1F3020248;
}

- (id)titleText
{
  return &stru_1F3020248;
}

- (id)bodyTextForTimeout:(id)a3
{
  return &stru_1F3020248;
}

- (id)bodySubtitleText
{
  return &stru_1F3020248;
}

- (id)cancelButtonText
{
  return &stru_1F3020248;
}

- (id)primaryButtonText
{
  return &stru_1F3020248;
}

- (id)secondaryButtonText
{
  return &stru_1F3020248;
}

- (CSDeviceBlockViewController)blockViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_blockViewController);

  return (CSDeviceBlockViewController *)WeakRetained;
}

- (void)setBlockViewController:(id)a3
{
}

- (CSDeviceUnblockPolicy)unblockPolicy
{
  return self->_unblockPolicy;
}

- (void)setUnblockPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unblockPolicy, 0);

  objc_destroyWeak((id *)&self->_blockViewController);
}

@end