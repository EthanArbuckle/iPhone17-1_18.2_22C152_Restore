@interface ASTUploadItem
- (ASTUploadItem)initWithDestinationUrl:(id)a3 andSourceData:(id)a4 andTask:(id)a5;
- (ASTUploadItem)initWithDestinationUrl:(id)a3 andSourceUrl:(id)a4 andTask:(id)a5;
- (BOOL)isComplete;
- (BOOL)isFailed;
- (NSMutableDictionary)metaInfo;
- (NSObject)dataObject;
- (NSURL)destinationUrl;
- (NSURLSessionUploadTask)task;
- (void)setDataObject:(id)a3;
- (void)setDestinationUrl:(id)a3;
- (void)setIsComplete:(BOOL)a3;
- (void)setIsFailed:(BOOL)a3;
- (void)setMetaInfo:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation ASTUploadItem

- (ASTUploadItem)initWithDestinationUrl:(id)a3 andSourceUrl:(id)a4 andTask:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ASTUploadItem;
  v12 = [(ASTUploadItem *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_destinationUrl, a3);
    objc_storeStrong((id *)&v13->_dataObject, a4);
    objc_storeWeak((id *)&v13->_task, v11);
    *(_WORD *)&v13->_isComplete = 0;
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    metaInfo = v13->_metaInfo;
    v13->_metaInfo = (NSMutableDictionary *)v14;
  }
  return v13;
}

- (ASTUploadItem)initWithDestinationUrl:(id)a3 andSourceData:(id)a4 andTask:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ASTUploadItem;
  v12 = [(ASTUploadItem *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_destinationUrl, a3);
    objc_storeStrong((id *)&v13->_dataObject, a4);
    objc_storeWeak((id *)&v13->_task, v11);
    *(_WORD *)&v13->_isComplete = 0;
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    metaInfo = v13->_metaInfo;
    v13->_metaInfo = (NSMutableDictionary *)v14;
  }
  return v13;
}

- (NSURL)destinationUrl
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDestinationUrl:(id)a3
{
}

- (NSObject)dataObject
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDataObject:(id)a3
{
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (BOOL)isFailed
{
  return self->_isFailed;
}

- (void)setIsFailed:(BOOL)a3
{
  self->_isFailed = a3;
}

- (NSMutableDictionary)metaInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetaInfo:(id)a3
{
}

- (NSURLSessionUploadTask)task
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_task);

  return (NSURLSessionUploadTask *)WeakRetained;
}

- (void)setTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_task);
  objc_storeStrong((id *)&self->_metaInfo, 0);
  objc_storeStrong((id *)&self->_dataObject, 0);

  objc_storeStrong((id *)&self->_destinationUrl, 0);
}

@end