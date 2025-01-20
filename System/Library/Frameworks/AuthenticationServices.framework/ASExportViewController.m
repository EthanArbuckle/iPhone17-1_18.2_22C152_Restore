@interface ASExportViewController
- (ASExportViewController)initWithExportedCredentialData:(id)a3 exporterBundleID:(id)a4;
- (ASExportViewControllerDelegate)delegate;
- (NSData)exportedCredentialData;
- (NSString)exporterBundleID;
- (int64_t)modalPresentationStyle;
- (void)setDelegate:(id)a3;
@end

@implementation ASExportViewController

- (ASExportViewController)initWithExportedCredentialData:(id)a3 exporterBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASExportViewController;
  v8 = [(ASExportViewController *)&v15 initWithNibName:0 bundle:0];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    exportedCredentialData = v8->_exportedCredentialData;
    v8->_exportedCredentialData = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    exporterBundleID = v8->_exporterBundleID;
    v8->_exporterBundleID = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (NSData)exportedCredentialData
{
  return self->_exportedCredentialData;
}

- (NSString)exporterBundleID
{
  return self->_exporterBundleID;
}

- (ASExportViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASExportViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_exporterBundleID, 0);

  objc_storeStrong((id *)&self->_exportedCredentialData, 0);
}

@end