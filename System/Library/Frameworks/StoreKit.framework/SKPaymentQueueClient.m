@interface SKPaymentQueueClient
- (BOOL)allowsBootstrapCellularData;
- (BOOL)hidesConfirmationDialogs;
- (BOOL)ignoresInAppPurchaseRestriction;
- (BOOL)requiresAuthenticationForPayment;
- (NSNumber)storeExternalVersion;
- (NSNumber)storeItemIdentifier;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)productsRequestBundleIdentifier;
- (NSString)receiptDirectoryPath;
- (NSString)vendorIdentifier;
- (SKPaymentQueueClientDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)plist;
- (int64_t)environmentType;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnvironmentType:(int64_t)a3;
- (void)setHidesConfirmationDialogs:(BOOL)a3;
- (void)setIgnoresInAppPurchaseRestriction:(BOOL)a3;
- (void)setProductsRequestBundleIdentifier:(id)a3;
- (void)setReceiptDirectoryPath:(id)a3;
- (void)setRequiresAuthenticationForPayment:(BOOL)a3;
- (void)setStoreExternalVersion:(id)a3;
- (void)setStoreItemIdentifier:(id)a3;
- (void)setVendorIdentifier:(id)a3;
@end

@implementation SKPaymentQueueClient

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setProductsRequestBundleIdentifier:self->_productsRequestBundleIdentifier];
  [v4 setAllowsBootstrapCellularData:self->_allowsBootstrapCellularData];
  [v4 setBundleIdentifier:self->_bundleIdentifier];
  [v4 setBundleVersion:self->_bundleVersion];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v4 setDelegate:WeakRetained];

  [v4 setEnvironmentType:self->_environmentType];
  [v4 setHidesConfirmationDialogs:self->_hidesConfirmationDialogs];
  [v4 setIgnoresInAppPurchaseRestriction:self->_ignoresInAppPurchaseRestriction];
  [v4 setReceiptDirectoryPath:self->_receiptDirectoryPath];
  [v4 setRequiresAuthenticationForPayment:self->_requiresAuthenticationForPayment];
  [v4 setStoreExternalVersion:self->_storeExternalVersion];
  [v4 setStoreItemIdentifier:self->_storeItemIdentifier];
  [v4 setVendorIdentifier:self->_vendorIdentifier];
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_productsRequestBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_storeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_storeExternalVersion, 0);
  objc_storeStrong((id *)&self->_receiptDirectoryPath, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (NSNumber)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (NSNumber)storeExternalVersion
{
  return self->_storeExternalVersion;
}

- (void)setVendorIdentifier:(id)a3
{
}

- (void)setStoreItemIdentifier:(id)a3
{
}

- (void)setStoreExternalVersion:(id)a3
{
}

- (void)setRequiresAuthenticationForPayment:(BOOL)a3
{
  self->_requiresAuthenticationForPayment = a3;
}

- (void)setReceiptDirectoryPath:(id)a3
{
}

- (void)setProductsRequestBundleIdentifier:(id)a3
{
}

- (void)setIgnoresInAppPurchaseRestriction:(BOOL)a3
{
  self->_ignoresInAppPurchaseRestriction = a3;
}

- (void)setHidesConfirmationDialogs:(BOOL)a3
{
  self->_hidesConfirmationDialogs = a3;
}

- (void)setEnvironmentType:(int64_t)a3
{
  self->_environmentType = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)setBundleVersion:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  self->_allowsBootstrapCellularData = a3;
}

- (NSString)productsRequestBundleIdentifier
{
  return self->_productsRequestBundleIdentifier;
}

- (int64_t)environmentType
{
  return self->_environmentType;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (id)plist
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  productsRequestBundleIdentifier = self->_productsRequestBundleIdentifier;
  if (productsRequestBundleIdentifier)
  {
    v5 = productsRequestBundleIdentifier;
  }
  else
  {
    v5 = self->_bundleIdentifier;
    if (!v5) {
      goto LABEL_5;
    }
  }
  [v3 setObject:v5 forKey:SKClientOverridesKeyRequestBundleID];
LABEL_5:
  bundleVersion = self->_bundleVersion;
  if (bundleVersion) {
    [v3 setObject:bundleVersion forKey:SKClientOverridesKeyRequestBundleVersion];
  }
  v7 = [NSNumber numberWithBool:self->_allowsBootstrapCellularData];
  [v3 setObject:v7 forKey:0x1F08A8AE0];

  v8 = [NSNumber numberWithInteger:self->_environmentType];
  [v3 setObject:v8 forKey:SKClientOverridesKeyServer];

  if (self->_receiptDirectoryPath)
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v9 createDirectoryAtPath:self->_receiptDirectoryPath withIntermediateDirectories:1 attributes:0 error:0];

    [(NSString *)self->_receiptDirectoryPath UTF8String];
    v10 = (unsigned char *)sandbox_extension_issue_file();
    if (v10 && (v11 = v10, *v10))
    {
      [v3 setObject:self->_receiptDirectoryPath forKey:0x1F08A8BC0];
      v12 = [NSString stringWithUTF8String:v11];
      [v3 setObject:v12 forKey:0x1F08A88E0];

      free(v11);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Cannot create sandbox token for custom receipt path", v17, 2u);
    }
  }
  storeExternalVersion = self->_storeExternalVersion;
  if (storeExternalVersion) {
    [v3 setObject:storeExternalVersion forKey:SKClientOverridesKeyStoreExternalVersion];
  }
  storeItemIdentifier = self->_storeItemIdentifier;
  if (storeItemIdentifier) {
    [v3 setObject:storeItemIdentifier forKey:SKClientOverridesKeyStoreItemID];
  }
  vendorIdentifier = self->_vendorIdentifier;
  if (vendorIdentifier) {
    [v3 setObject:vendorIdentifier forKey:SKClientOverridesKeyVendorID];
  }

  return v3;
}

- (BOOL)allowsBootstrapCellularData
{
  return self->_allowsBootstrapCellularData;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)hidesConfirmationDialogs
{
  return self->_hidesConfirmationDialogs;
}

- (BOOL)ignoresInAppPurchaseRestriction
{
  return self->_ignoresInAppPurchaseRestriction;
}

- (NSString)receiptDirectoryPath
{
  return self->_receiptDirectoryPath;
}

- (BOOL)requiresAuthenticationForPayment
{
  return self->_requiresAuthenticationForPayment;
}

- (SKPaymentQueueClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKPaymentQueueClientDelegate *)WeakRetained;
}

@end