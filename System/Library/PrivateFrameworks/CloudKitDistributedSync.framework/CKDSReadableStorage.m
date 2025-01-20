@interface CKDSReadableStorage
- (CKDSReadableStorage)initWithData:(id)a3;
- (CKDSReadableStorage)initWithFileURL:(id)a3;
@end

@implementation CKDSReadableStorage

- (CKDSReadableStorage)initWithFileURL:(id)a3
{
  id v4 = a3;
  v5 = [CKDSStorageFile alloc];
  isOwned = objc_msgSend_initWithURL_isOwned_(v5, v6, (uint64_t)v4, 0);

  v9 = (CKDSReadableStorage *)objc_msgSend_initForWriting_withFile_orData_(self, v8, 0, isOwned, 0);
  return v9;
}

- (CKDSReadableStorage)initWithData:(id)a3
{
  return (CKDSReadableStorage *)objc_msgSend_initForWriting_withFile_orData_(self, a2, 0, 0, a3);
}

@end