@interface CPLPrequeliteUploadResource
- (BOOL)isAvailable;
- (CPLPrequeliteUploadResource)initWithResource:(id)a3;
- (NSString)fileUTI;
- (NSString)fingerPrint;
- (NSString)itemIdentifier;
- (NSString)originalPath;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)resource;
- (int)retryCount;
- (int)status;
- (unint64_t)pendingCount;
- (unint64_t)position;
- (unint64_t)resourceType;
- (void)setAvailable:(BOOL)a3;
- (void)setFileUTI:(id)a3;
- (void)setFingerPrint:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setOriginalPath:(id)a3;
- (void)setPendingCount:(unint64_t)a3;
- (void)setPosition:(unint64_t)a3;
- (void)setResourceType:(unint64_t)a3;
- (void)setRetryCount:(int)a3;
- (void)setStatus:(int)a3;
@end

@implementation CPLPrequeliteUploadResource

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPLPrequeliteUploadResource;
  v6 = [(CPLPrequeliteUploadResource *)&v16 init];
  if (v6)
  {
    v6->_position = (unint64_t)[v5 integerAtIndex:0];
    v6->_pendingCount = (unint64_t)[v5 integerAtIndex:1];
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

    uint64_t v13 = [v5 stringAtIndex:6];
    originalPath = v6->_originalPath;
    v6->_originalPath = (NSString *)v13;

    v6->_available = [v5 intAtIndex:7] != 0;
    v6->_retryCount = [v5 intAtIndex:8];
    v6->_status = [v5 intAtIndex:9];
  }

  return v6;
}

- (CPLPrequeliteUploadResource)initWithResource:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CPLPrequeliteUploadResource;
  id v5 = [(CPLPrequeliteUploadResource *)&v21 init];
  if (v5)
  {
    v6 = [v4 itemScopedIdentifier];
    uint64_t v7 = [v6 identifier];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v7;

    v5->_resourceType = (unint64_t)[v4 resourceType];
    uint64_t v9 = [v4 identity];
    uint64_t v10 = [v9 fingerPrint];
    fingerPrint = v5->_fingerPrint;
    v5->_fingerPrint = (NSString *)v10;

    v12 = [v4 identity];
    uint64_t v13 = [v12 fileUTI];
    fileUTI = v5->_fileUTI;
    v5->_fileUTI = (NSString *)v13;

    v15 = [v4 identity];
    objc_super v16 = [v15 fileURL];
    uint64_t v17 = [v16 path];
    originalPath = v5->_originalPath;
    v5->_originalPath = (NSString *)v17;

    v19 = [v4 identity];
    v5->_available = [v19 isAvailable];
  }
  return v5;
}

- (id)resource
{
  id v3 = objc_alloc_init((Class)CPLResourceIdentity);
  [v3 setFingerPrint:self->_fingerPrint];
  [v3 setFileUTI:self->_fileUTI];
  originalPath = self->_originalPath;
  if (originalPath)
  {
    id v5 = +[NSURL fileURLWithPath:originalPath isDirectory:0];
    [v3 setFileURL:v5];
  }
  [v3 setAvailable:self->_available];
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier)
  {
    uint64_t v7 = itemIdentifier;
    id v8 = objc_alloc((Class)CPLScopedIdentifier);
    id v9 = [v8 initWithScopeIdentifier:CPLPrimaryScopeIdentifier identifier:self->_itemIdentifier];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [objc_alloc((Class)CPLResource) initWithResourceIdentity:v3 itemScopedIdentifier:v9 resourceType:self->_resourceType];

  return v10;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (unint64_t)pendingCount
{
  return self->_pendingCount;
}

- (void)setPendingCount:(unint64_t)a3
{
  self->_pendingCount = a3;
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

- (NSString)originalPath
{
  return self->_originalPath;
}

- (void)setOriginalPath:(id)a3
{
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalPath, 0);
  objc_storeStrong((id *)&self->_fileUTI, 0);
  objc_storeStrong((id *)&self->_fingerPrint, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end