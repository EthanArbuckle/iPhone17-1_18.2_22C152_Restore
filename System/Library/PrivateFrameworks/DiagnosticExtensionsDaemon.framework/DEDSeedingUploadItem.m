@interface DEDSeedingUploadItem
+ (id)itemAtPath:(id)a3 enclosedFilename:(id)a4 extensionID:(id)a5;
- (BOOL)completed;
- (NSString)extensionID;
- (NSString)filePromiseUUID;
- (NSURLSessionUploadTask)uploadTask;
- (id)description;
- (id)publicDescription;
- (int64_t)bytesUploaded;
- (int64_t)totalBytesExpectedToSend;
- (void)setBytesUploaded:(int64_t)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setExtensionID:(id)a3;
- (void)setFilePromiseUUID:(id)a3;
- (void)setTotalBytesExpectedToSend:(int64_t)a3;
- (void)setUploadTask:(id)a3;
@end

@implementation DEDSeedingUploadItem

+ (id)itemAtPath:(id)a3 enclosedFilename:(id)a4 extensionID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(DEDSeedingUploadItem);
  v11 = v10;
  if (v10)
  {
    [(DEDAttachmentItem *)v10 setDisplayName:v8];
    [(DEDAttachmentItem *)v11 setAttachedPath:v7];
    [(DEDSeedingUploadItem *)v11 setExtensionID:v9];
    v12 = [MEMORY[0x263F08850] defaultManager];
    v13 = [v7 path];
    v14 = [v12 attributesOfItemAtPath:v13 error:0];
    uint64_t v15 = [v14 fileSize];

    v16 = [NSNumber numberWithLongLong:v15];
    [(DEDAttachmentItem *)v11 setFileSize:v16];

    [(DEDSeedingUploadItem *)v11 setBytesUploaded:0];
    [(DEDSeedingUploadItem *)v11 setCompleted:0];
  }

  return v11;
}

- (id)publicDescription
{
  v3 = NSString;
  v4 = [(DEDAttachmentItem *)self attachedPath];
  v5 = [v4 path];
  v6 = [(DEDAttachmentItem *)self fileSize];
  id v7 = [v3 stringWithFormat:@"path: [%@] size: [%lu]", v5, objc_msgSend(v6, "longValue")];

  return v7;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)DEDSeedingUploadItem;
  v4 = [(DEDAttachmentItem *)&v9 description];
  v5 = [(DEDSeedingUploadItem *)self extensionID];
  v6 = [(DEDAttachmentItem *)self attachedPath];
  id v7 = [v3 stringWithFormat:@"%@: %@ - %@", v4, v5, v6];

  return v7;
}

- (NSString)extensionID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExtensionID:(id)a3
{
}

- (NSString)filePromiseUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFilePromiseUUID:(id)a3
{
}

- (int64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (void)setBytesUploaded:(int64_t)a3
{
  self->_bytesUploaded = a3;
}

- (int64_t)totalBytesExpectedToSend
{
  return self->_totalBytesExpectedToSend;
}

- (void)setTotalBytesExpectedToSend:(int64_t)a3
{
  self->_totalBytesExpectedToSend = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSURLSessionUploadTask)uploadTask
{
  return (NSURLSessionUploadTask *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUploadTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadTask, 0);
  objc_storeStrong((id *)&self->_filePromiseUUID, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
}

@end