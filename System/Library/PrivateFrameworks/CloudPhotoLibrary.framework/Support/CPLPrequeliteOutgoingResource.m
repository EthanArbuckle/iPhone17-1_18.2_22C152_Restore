@interface CPLPrequeliteOutgoingResource
- (CPLPrequeliteOutgoingResource)initWithResource:(id)a3 uploadIdentifier:(id)a4;
- (CPLPrequeliteOutgoingResource)resourceWithOutgoingResources:(id)a3;
- (CPLPrequeliteOutgoingResource)resourceWithScopeIdentifier:(id)a3;
- (NSString)fileUTI;
- (NSString)fingerPrint;
- (NSString)itemIdentifier;
- (NSString)uploadIdentifier;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (int)fileKind;
- (int64_t)scopeIndex;
- (unint64_t)fileSize;
- (unint64_t)resourceType;
- (void)setFileKind:(int)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileUTI:(id)a3;
- (void)setFingerPrint:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setResourceType:(unint64_t)a3;
- (void)setScopeIndex:(int64_t)a3;
- (void)setUploadIdentifier:(id)a3;
@end

@implementation CPLPrequeliteOutgoingResource

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPLPrequeliteOutgoingResource;
  v6 = [(CPLPrequeliteOutgoingResource *)&v16 init];
  if (v6)
  {
    v6->_scopeIndex = (int64_t)[v5 integerAtIndex:0];
    uint64_t v7 = [v5 stringAtIndex:1];
    itemIdentifier = v6->_itemIdentifier;
    v6->_itemIdentifier = (NSString *)v7;

    v6->_resourceType = (int)[v5 intAtIndex:2];
    uint64_t v9 = [v5 stringAtIndex:3];
    fingerPrint = v6->_fingerPrint;
    v6->_fingerPrint = (NSString *)v9;

    uint64_t v11 = [v5 stringAtIndex:4];
    fileUTI = v6->_fileUTI;
    v6->_fileUTI = (NSString *)v11;

    v6->_fileKind = [v5 intAtIndex:5];
    v6->_fileSize = (unint64_t)[v5 unsignedIntegerAtIndex:6];
    uint64_t v13 = [v5 stringAtIndex:7];
    uploadIdentifier = v6->_uploadIdentifier;
    v6->_uploadIdentifier = (NSString *)v13;
  }
  return v6;
}

- (CPLPrequeliteOutgoingResource)initWithResource:(id)a3 uploadIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CPLPrequeliteOutgoingResource;
  uint64_t v9 = [(CPLPrequeliteOutgoingResource *)&v28 init];
  if (v9)
  {
    v10 = [v7 itemScopedIdentifier];
    id v11 = [v10 scopeIndex];
    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
      sub_1001D1EF8((uint64_t)a2, (uint64_t)v9);
    }
    v9->_scopeIndex = (int64_t)v11;
    v12 = [v10 identifier];
    uint64_t v13 = (NSString *)[v12 copy];
    itemIdentifier = v9->_itemIdentifier;
    v9->_itemIdentifier = v13;

    v9->_resourceType = (unint64_t)[v7 resourceType];
    v15 = [v7 identity];
    objc_super v16 = [v15 fingerPrint];
    v17 = (NSString *)[v16 copy];
    fingerPrint = v9->_fingerPrint;
    v9->_fingerPrint = v17;

    v19 = [v15 fileUTI];
    v20 = (NSString *)[v19 copy];
    fileUTI = v9->_fileUTI;
    v9->_fileUTI = v20;

    if (v9->_fileUTI)
    {
      v22 = +[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:");
      v23 = v22;
      if (v9->_resourceType != 1)
      {
LABEL_13:
        v9->_fileSize = (unint64_t)[v15 fileSize];
        v25 = (NSString *)[v8 copy];
        uploadIdentifier = v9->_uploadIdentifier;
        v9->_uploadIdentifier = v25;

        goto LABEL_14;
      }
      if (v22)
      {
        if ([v22 conformsToType:UTTypeImage])
        {
          v9->_fileKind = 0;
          goto LABEL_13;
        }
        if ([v23 conformsToType:UTTypeMovie])
        {
          int v24 = 1;
          goto LABEL_11;
        }
LABEL_10:
        int v24 = 2;
LABEL_11:
        v9->_fileKind = v24;
        goto LABEL_13;
      }
    }
    else if (v9->_resourceType != 1)
    {
      v23 = 0;
      goto LABEL_13;
    }
    v23 = 0;
    goto LABEL_10;
  }
LABEL_14:

  return v9;
}

- (CPLPrequeliteOutgoingResource)resourceWithOutgoingResources:(id)a3
{
  id v4 = [a3 scopedIdentifierForLocalIdentifier:self->_itemIdentifier scopeIndex:self->_scopeIndex];
  if (!v4) {
    id v4 = [objc_alloc((Class)CPLScopedIdentifier) initWithScopeIdentifier:@"<DELETED_SCOPE>" identifier:self->_itemIdentifier scopeIndex:self->_scopeIndex];
  }
  id v5 = objc_alloc_init((Class)CPLResourceIdentity);
  [v5 setFingerPrint:self->_fingerPrint];
  [v5 setFileUTI:self->_fileUTI];
  [v5 setFileSize:self->_fileSize];
  [v5 setAvailable:1];
  id v6 = [objc_alloc((Class)CPLResource) initWithResourceIdentity:v5 itemScopedIdentifier:v4 resourceType:self->_resourceType];

  return (CPLPrequeliteOutgoingResource *)v6;
}

- (CPLPrequeliteOutgoingResource)resourceWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CPLScopedIdentifier) initWithScopeIdentifier:v4 identifier:self->_itemIdentifier];

  id v6 = objc_alloc_init((Class)CPLResourceIdentity);
  [v6 setFingerPrint:self->_fingerPrint];
  [v6 setFileUTI:self->_fileUTI];
  [v6 setFileSize:self->_fileSize];
  [v6 setAvailable:1];
  id v7 = [objc_alloc((Class)CPLResource) initWithResourceIdentity:v6 itemScopedIdentifier:v5 resourceType:self->_resourceType];

  return (CPLPrequeliteOutgoingResource *)v7;
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

- (int)fileKind
{
  return self->_fileKind;
}

- (void)setFileKind:(int)a3
{
  self->_fileKind = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSString)uploadIdentifier
{
  return self->_uploadIdentifier;
}

- (void)setUploadIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadIdentifier, 0);
  objc_storeStrong((id *)&self->_fileUTI, 0);
  objc_storeStrong((id *)&self->_fingerPrint, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end