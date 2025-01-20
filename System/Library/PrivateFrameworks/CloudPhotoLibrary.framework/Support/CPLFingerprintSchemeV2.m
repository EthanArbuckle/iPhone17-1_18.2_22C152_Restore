@interface CPLFingerprintSchemeV2
- (void)configureAssetTransferOptionsForCKAsset:(id)a3 scopeProvider:(id)a4;
@end

@implementation CPLFingerprintSchemeV2

- (void)configureAssetTransferOptionsForCKAsset:(id)a3 scopeProvider:(id)a4
{
  id v7 = a3;
  id v5 = objc_alloc_init((Class)CKAssetTransferOptions);
  [v5 setUseMMCSEncryptionV2:&__kCFBooleanTrue];
  if (qword_1002CE820 != -1) {
    dispatch_once(&qword_1002CE820, &stru_100279278);
  }
  if (byte_1002CE828 || ([v7 isReference] & 1) == 0)
  {
    v6 = [(CPLFingerprintSchemeV2 *)self boundaryKey];
    [v7 setBoundaryKey:v6];
  }
  [v7 setAssetTransferOptions:v5];
}

@end