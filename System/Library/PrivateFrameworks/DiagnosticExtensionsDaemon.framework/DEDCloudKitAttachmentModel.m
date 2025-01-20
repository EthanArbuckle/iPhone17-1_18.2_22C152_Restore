@interface DEDCloudKitAttachmentModel
- (DEDCloudKitAttachmentModel)initWithURL:(id)a3 withQueueItem:(id)a4 parameters:(id)a5;
- (NSNumber)fileSize;
- (NSString)queueItem;
- (NSURL)url;
- (id)modelName;
- (void)setFileSize:(id)a3;
- (void)setQueueItem:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation DEDCloudKitAttachmentModel

- (DEDCloudKitAttachmentModel)initWithURL:(id)a3 withQueueItem:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)DEDCloudKitAttachmentModel;
  v10 = [(DEDCloudKitBaseModel *)&v27 initModelWithDictionary:a5];
  v11 = v10;
  if (v10)
  {
    [(DEDCloudKitAttachmentModel *)v10 setUrl:v8];
    [(DEDCloudKitAttachmentModel *)v11 setQueueItem:v9];
    v12 = [MEMORY[0x263F08850] defaultManager];
    v13 = [v8 path];
    v14 = [v12 attributesOfItemAtPath:v13 error:0];
    uint64_t v15 = [v14 fileSize];

    v16 = [NSNumber numberWithLongLong:v15];
    [(DEDCloudKitAttachmentModel *)v11 setFileSize:v16];

    id v17 = objc_alloc(MEMORY[0x263EFD5E0]);
    v18 = [(DEDCloudKitAttachmentModel *)v11 url];
    v19 = (void *)[v17 initWithFileURL:v18];

    v20 = [(DEDCloudKitBaseModel *)v11 cloudKitModel];
    [v20 setObject:v19 forKeyedSubscript:@"asset"];

    v21 = [(DEDCloudKitAttachmentModel *)v11 url];
    v22 = [v21 lastPathComponent];
    v23 = [(DEDCloudKitBaseModel *)v11 cloudKitModel];
    [v23 setObject:v22 forKeyedSubscript:@"fileName"];

    v24 = [(DEDCloudKitAttachmentModel *)v11 queueItem];
    v25 = [(DEDCloudKitBaseModel *)v11 cloudKitModel];
    [v25 setObject:v24 forKeyedSubscript:@"queueItem"];
  }
  return v11;
}

- (id)modelName
{
  return @"Attachment";
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUrl:(id)a3
{
}

- (NSNumber)fileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFileSize:(id)a3
{
}

- (NSString)queueItem
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueueItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueItem, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end