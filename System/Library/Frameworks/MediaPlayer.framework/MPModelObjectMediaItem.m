@interface MPModelObjectMediaItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MPModelObject)modelObject;
- (MPModelObjectMediaItem)initWithCoder:(id)a3;
- (MPModelObjectMediaItem)initWithModelObject:(id)a3;
- (MPModelObjectMediaItem)initWithPersistentID:(unint64_t)a3;
- (id)fallbackArtworkCatalogBlock;
- (id)valueForProperty:(id)a3;
- (unint64_t)hash;
- (unint64_t)persistentID;
- (void)encodeWithCoder:(id)a3;
- (void)setFallbackArtworkCatalogBlock:(id)a3;
@end

@implementation MPModelObjectMediaItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fallbackArtworkCatalogBlock, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);

  objc_storeStrong((id *)&self->_propertyValues, 0);
}

- (void)setFallbackArtworkCatalogBlock:(id)a3
{
}

- (id)fallbackArtworkCatalogBlock
{
  return self->_fallbackArtworkCatalogBlock;
}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (id)valueForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"artwork"])
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__19602;
    v23 = __Block_byref_object_dispose__19603;
    id v24 = 0;
    if (objc_opt_respondsToSelector())
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __43__MPModelObjectMediaItem_valueForProperty___block_invoke;
      v18[3] = &unk_1E57F9F20;
      v18[4] = self;
      v18[5] = &v19;
      +[MPModelObject performWithoutEnforcement:v18];
      v5 = [(id)v20[5] token];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      char v7 = isKindOfClass ^ 1;
    }
    else
    {
      char v7 = 1;
    }
    if (v20[5]
      || (fallbackArtworkCatalogBlock = (void (**)(void))self->_fallbackArtworkCatalogBlock) != 0
      && (fallbackArtworkCatalogBlock[2](),
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          v15 = (void *)v20[5],
          v20[5] = v14,
          v15,
          v20[5]))
    {
      v11 = [MPConcreteMediaItemArtwork alloc];
      v12 = [(MPConcreteMediaItemArtwork *)v11 initWithArtworkCatalog:v20[5] allowsNetworking:v7 & 1];
    }
    else
    {
      v12 = 0;
    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v8 = [(NSDictionary *)self->_propertyValues valueForKey:v4];
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)MPModelObjectMediaItem;
      v10 = [(MPNondurableMediaItem *)&v17 valueForProperty:v4];
    }
    v12 = v10;
  }

  return v12;
}

void __43__MPModelObjectMediaItem_valueForProperty___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) artworkCatalog];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)hash
{
  return [(MPModelObject *)self->_modelObject hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(MPModelObject *)self->_modelObject isEqual:v4[5]];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MPModelObjectMediaItem)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mo"];

  if (v5)
  {
    self = [(MPModelObjectMediaItem *)self initWithModelObject:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)persistentID
{
  uint64_t v2 = [(MPModelObject *)self->_modelObject identifiers];
  uint64_t v3 = [v2 library];
  unint64_t v4 = [v3 persistentID];

  return v4;
}

- (MPModelObjectMediaItem)initWithPersistentID:(unint64_t)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"MPModelObjectMediaItem.m" lineNumber:286 description:@"MPModelObjectMediaItem initWithPersistentID: is not supported. Use initWithModelObject: instead."];

  v7.receiver = self;
  v7.super_class = (Class)MPModelObjectMediaItem;
  return [(MPModelObjectMediaItem *)&v7 init];
}

- (MPModelObjectMediaItem)initWithModelObject:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPModelObjectMediaItem;
  v6 = [(MPModelObjectMediaItem *)&v11 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelObject, a3);
    uint64_t v8 = [v5 mediaItemPropertyValues];
    propertyValues = v7->_propertyValues;
    v7->_propertyValues = (NSDictionary *)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end