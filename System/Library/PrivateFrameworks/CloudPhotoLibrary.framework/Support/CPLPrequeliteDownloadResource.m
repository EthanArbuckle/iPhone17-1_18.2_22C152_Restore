@interface CPLPrequeliteDownloadResource
- (CPLPrequeliteDownloadResource)initWithResource:(id)a3;
- (CPLPrequeliteDownloadResource)resourceWithDownloadQueue:(id)a3;
- (NSString)fileUTI;
- (NSString)fingerPrint;
- (NSString)itemIdentifier;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (int)retryCount;
- (int)status;
- (int64_t)scopeIndex;
- (unint64_t)fileSize;
- (unint64_t)intent;
- (unint64_t)position;
- (unint64_t)resourceType;
- (unint64_t)taskIdentifier;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileUTI:(id)a3;
- (void)setFingerPrint:(id)a3;
- (void)setIntent:(unint64_t)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setPosition:(unint64_t)a3;
- (void)setResourceType:(unint64_t)a3;
- (void)setRetryCount:(int)a3;
- (void)setScopeIndex:(int64_t)a3;
- (void)setStatus:(int)a3;
- (void)setTaskIdentifier:(unint64_t)a3;
@end

@implementation CPLPrequeliteDownloadResource

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPLPrequeliteDownloadResource;
  v6 = [(CPLPrequeliteDownloadResource *)&v14 init];
  if (v6)
  {
    v6->_position = (unint64_t)[v5 integerAtIndex:0];
    v6->_scopeIndex = (int64_t)[v5 integerAtIndex:1];
    uint64_t v7 = [v5 stringAtIndex:2];
    itemIdentifier = v6->_itemIdentifier;
    v6->_itemIdentifier = (NSString *)v7;

    v6->_resourceType = (int)[v5 intAtIndex:3];
    uint64_t v9 = [v5 stringAtIndex:4];
    fingerPrint = v6->_fingerPrint;
    v6->_fingerPrint = (NSString *)v9;

    uint64_t v11 = [v5 stringAtIndex:5];
    fileUTI = v6->_fileUTI;
    v6->_fileUTI = (NSString *)v11;

    v6->_fileSize = (unint64_t)[v5 unsignedIntegerAtIndex:6];
    v6->_taskIdentifier = (unint64_t)[v5 integerAtIndex:7];
    v6->_retryCount = [v5 intAtIndex:8];
    v6->_status = [v5 intAtIndex:9];
    v6->_intent = (int)[v5 intAtIndex:10];
  }

  return v6;
}

- (CPLPrequeliteDownloadResource)initWithResource:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CPLPrequeliteDownloadResource;
  id v5 = [(CPLPrequeliteDownloadResource *)&v18 init];
  if (v5)
  {
    v6 = [v4 itemScopedIdentifier];
    id v7 = [v6 scopeIndex];
    v5->_scopeIndex = (int64_t)v7;
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
      sub_1001D2844();
    }
    uint64_t v8 = [v6 identifier];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v8;

    v5->_resourceType = (unint64_t)[v4 resourceType];
    v10 = [v4 identity];
    uint64_t v11 = [v10 fingerPrint];
    fingerPrint = v5->_fingerPrint;
    v5->_fingerPrint = (NSString *)v11;

    v13 = [v4 identity];
    uint64_t v14 = [v13 fileUTI];
    fileUTI = v5->_fileUTI;
    v5->_fileUTI = (NSString *)v14;

    v16 = [v4 identity];
    v5->_fileSize = (unint64_t)[v16 fileSize];

    v5->_taskIdentifier = (unint64_t)[v4 _backgroundDownloadTaskIdentifier];
    v5->_intent = 1;
  }
  return v5;
}

- (CPLPrequeliteDownloadResource)resourceWithDownloadQueue:(id)a3
{
  id v4 = [a3 scopedIdentifierForLocalIdentifier:self->_itemIdentifier scopeIndex:self->_scopeIndex];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)CPLResourceIdentity);
    [v5 setFingerPrint:self->_fingerPrint];
    [v5 setFileUTI:self->_fileUTI];
    [v5 setFileSize:self->_fileSize];
    id v6 = [objc_alloc((Class)CPLResource) initWithResourceIdentity:v5 itemScopedIdentifier:v4 resourceType:self->_resourceType];
    [v6 _setBackgroundDownloadTaskIdentifier:self->_taskIdentifier];
  }
  else
  {
    id v6 = 0;
  }

  return (CPLPrequeliteDownloadResource *)v6;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (int64_t)scopeIndex
{
  return self->_scopeIndex;
}

- (void)setScopeIndex:(int64_t)a3
{
  self->_scopeIndex = a3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(unint64_t)a3
{
  self->_resourceType = a3;
}

- (NSString)fingerPrint
{
  return self->_fingerPrint;
}

- (void)setFingerPrint:(id)a3
{
}

- (NSString)fileUTI
{
  return self->_fileUTI;
}

- (void)setFileUTI:(id)a3
{
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (int)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->_retryCount = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileUTI, 0);
  objc_storeStrong((id *)&self->_fingerPrint, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end