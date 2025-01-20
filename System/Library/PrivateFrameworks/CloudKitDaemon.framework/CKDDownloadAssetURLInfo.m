@interface CKDDownloadAssetURLInfo
- (BOOL)isEqual:(id)a3;
- (CKAsset)asset;
- (_OpaquePCSShareProtection)recordPCS;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAsset:(id)a3;
- (void)setRecordPCS:(_OpaquePCSShareProtection *)a3;
@end

@implementation CKDDownloadAssetURLInfo

- (void)dealloc
{
  recordPCS = self->_recordPCS;
  if (recordPCS)
  {
    CFRelease(recordPCS);
    self->_recordPCS = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDDownloadAssetURLInfo;
  [(CKDDownloadAssetURLInfo *)&v4 dealloc];
}

- (unint64_t)hash
{
  v3 = objc_msgSend_asset(self, a2, v2);
  unint64_t v6 = objc_msgSend_hash(v3, v4, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = objc_msgSend_asset(v4, v5, v6);
    v10 = objc_msgSend_asset(self, v8, v9);
    char isEqual = objc_msgSend_isEqual_(v7, v11, (uint64_t)v10);
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (void)setRecordPCS:(_OpaquePCSShareProtection *)a3
{
  recordPCS = self->_recordPCS;
  if (recordPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      recordPCS = self->_recordPCS;
    }
    self->_recordPCS = a3;
    if (recordPCS)
    {
      CFRelease(recordPCS);
    }
  }
}

- (CKAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (_OpaquePCSShareProtection)recordPCS
{
  return self->_recordPCS;
}

- (void).cxx_destruct
{
}

@end