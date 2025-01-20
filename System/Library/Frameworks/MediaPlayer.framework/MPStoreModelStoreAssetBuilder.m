@interface MPStoreModelStoreAssetBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelStoreAssetBuilder

+ (id)allSupportedProperties
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyStoreAssetEndpointType";
  v5[1] = @"MPModelPropertyStoreAssetRedownloadParameters";
  v5[2] = @"MPModelPropertyStoreAssetRedownloadable";
  v5[3] = @"MPModelPropertyStoreAssetAccountIdentifier";
  v5[4] = @"MPModelPropertyStoreAssetShouldReportPlayEvents";
  v5[5] = @"MPModelPropertyStoreAssetSubscriptionRequired";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((*(unsigned char *)&self->_requestedStoreAssetProperties & 1) == 0)
  {
    v11 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v12 = [v11 properties];
    if ([v12 containsObject:@"MPModelPropertyStoreAssetEndpointType"]) {
      char v13 = 2;
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)&self->_requestedStoreAssetProperties = *(unsigned char *)&self->_requestedStoreAssetProperties & 0xFD | v13;
    if ([v12 containsObject:@"MPModelPropertyStoreAssetRedownloadParameters"]) {
      char v14 = 4;
    }
    else {
      char v14 = 0;
    }
    *(unsigned char *)&self->_requestedStoreAssetProperties = *(unsigned char *)&self->_requestedStoreAssetProperties & 0xFB | v14;
    if ([v12 containsObject:@"MPModelPropertyStoreAssetRedownloadable"]) {
      char v15 = 8;
    }
    else {
      char v15 = 0;
    }
    *(unsigned char *)&self->_requestedStoreAssetProperties = *(unsigned char *)&self->_requestedStoreAssetProperties & 0xF7 | v15;
    if ([v12 containsObject:@"MPModelPropertyStoreAssetAccountIdentifier"]) {
      char v16 = 16;
    }
    else {
      char v16 = 0;
    }
    *(unsigned char *)&self->_requestedStoreAssetProperties = *(unsigned char *)&self->_requestedStoreAssetProperties & 0xEF | v16;
    if ([v12 containsObject:@"MPModelPropertyStoreAssetShouldReportPlayEvents"]) {
      char v17 = 32;
    }
    else {
      char v17 = 0;
    }
    *(unsigned char *)&self->_requestedStoreAssetProperties = *(unsigned char *)&self->_requestedStoreAssetProperties & 0xDF | v17;
    if ([v12 containsObject:@"MPModelPropertyStoreAssetSubscriptionRequired"]) {
      char v18 = 65;
    }
    else {
      char v18 = 1;
    }
    *(unsigned char *)&self->_requestedStoreAssetProperties = v18 | *(unsigned char *)&self->_requestedStoreAssetProperties & 0xBE;
  }
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __97__MPStoreModelStoreAssetBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v29 = &unk_1E57F3ED8;
  id v19 = v8;
  id v30 = v19;
  v31 = self;
  v20 = (void *)MEMORY[0x19971E0F0](&v26);
  if (v9)
  {
    v21 = objc_msgSend(v9, "identifiers", v26, v27, v28, v29);
    uint64_t v22 = [v9 copyWithIdentifiers:v21 block:v20];
  }
  else
  {
    v23 = [MPModelStoreAsset alloc];
    v21 = +[MPIdentifierSet emptyIdentifierSet];
    uint64_t v22 = [(MPModelObject *)v23 initWithIdentifiers:v21 block:v20];
  }
  v24 = (void *)v22;

  return v24;
}

void __97__MPStoreModelStoreAssetBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  int v3 = [*(id *)(a1 + 32) hasSubscriptionOffer];
  uint64_t v4 = [*(id *)(a1 + 32) isStoreRedownloadable];
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 8) != 0
    && ([v9 hasLoadedValueForKey:@"MPModelPropertyStoreAssetRedownloadable"] & 1) == 0)
  {
    [v9 setRedownloadable:v4];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 2) != 0
    && ([v9 hasLoadedValueForKey:@"MPModelPropertyStoreAssetEndpointType"] & 1) == 0)
  {
    if (v4) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 0;
    }
    [v9 setEndpointType:v5];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 4) != 0
    && ([v9 hasLoadedValueForKey:@"MPModelPropertyStoreAssetRedownloadParameters"] & 1) == 0)
  {
    [v9 setRedownloadParameters:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 0x10) != 0
    && ([v9 hasLoadedValueForKey:@"MPModelPropertyStoreAssetAccountIdentifier"] & 1) == 0)
  {
    [v9 setAccountIdentifier:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 0x20) != 0
    && ([v9 hasLoadedValueForKey:@"MPModelPropertyStoreAssetShouldReportPlayEvents"] & 1) == 0)
  {
    objc_msgSend(v9, "setShouldReportPlayEvents:", objc_msgSend(*(id *)(a1 + 32), "shouldReportPlayEvents"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 0x40) != 0
    && ([v9 hasLoadedValueForKey:@"MPModelPropertyStoreAssetSubscriptionRequired"] & 1) == 0)
  {
    v6 = [*(id *)(a1 + 32) videoSubtype];
    v7 = [*(id *)(a1 + 32) itemKind];
    if ([v7 isEqualToString:@"tvEpisode"]) {
      int v8 = [v6 isEqualToString:@"tvtrailer"] ^ 1;
    }
    else {
      int v8 = 1;
    }
    [v9 setSubscriptionRequired:v3 & v8];
  }
}

@end