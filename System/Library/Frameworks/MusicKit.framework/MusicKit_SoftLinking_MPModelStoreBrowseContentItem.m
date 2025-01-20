@interface MusicKit_SoftLinking_MPModelStoreBrowseContentItem
+ (int64_t)_genericObjectTypeForItemType:(unint64_t)a3;
- (MPModelStoreBrowseContentItem)_underlyingObject;
- (MusicKit_SoftLinking_MPModelObject)innerObject;
- (MusicKit_SoftLinking_MPModelStoreBrowseContentItem)initWithInnerObject:(id)a3;
- (id)underlyingObject;
@end

@implementation MusicKit_SoftLinking_MPModelStoreBrowseContentItem

- (void).cxx_destruct
{
}

- (MPModelStoreBrowseContentItem)_underlyingObject
{
  return self->_underlyingItem;
}

+ (int64_t)_genericObjectTypeForItemType:(unint64_t)a3
{
  if (a3 - 1 > 0xE) {
    return 0;
  }
  else {
    return qword_21D2F2BA0[a3 - 1];
  }
}

- (MusicKit_SoftLinking_MPModelStoreBrowseContentItem)initWithInnerObject:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MusicKit_SoftLinking_MPModelStoreBrowseContentItem;
  v5 = [(MusicKit_SoftLinking_MPModelStoreBrowseContentItem *)&v20 init];
  if (v5)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v6 = (void *)getMPModelStoreBrowseContentItemClass_softClass_2;
    uint64_t v25 = getMPModelStoreBrowseContentItemClass_softClass_2;
    if (!getMPModelStoreBrowseContentItemClass_softClass_2)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __getMPModelStoreBrowseContentItemClass_block_invoke_2;
      v21[3] = &unk_26443F950;
      v21[4] = &v22;
      __getMPModelStoreBrowseContentItemClass_block_invoke_2((uint64_t)v21);
      v6 = (void *)v23[3];
    }
    v7 = v6;
    _Block_object_dispose(&v22, 8);
    id v8 = [v7 alloc];
    v9 = [v4 underlyingObject];
    v10 = [v9 identifiers];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __74__MusicKit_SoftLinking_MPModelStoreBrowseContentItem_initWithInnerObject___block_invoke;
    v18 = &unk_264440440;
    id v19 = v4;
    v11 = (void *)[v8 initWithIdentifiers:v10 block:&v15];

    if (!objc_msgSend(v11, "itemType", v15, v16, v17, v18))
    {

      v13 = 0;
      goto LABEL_8;
    }
    underlyingItem = v5->_underlyingItem;
    v5->_underlyingItem = (MPModelStoreBrowseContentItem *)v11;
  }
  v13 = v5;
LABEL_8:

  return v13;
}

- (MusicKit_SoftLinking_MPModelObject)innerObject
{
  v3 = [MusicKit_SoftLinking_MPModelObject alloc];
  id v4 = [(MPModelStoreBrowseContentItem *)self->_underlyingItem innerObject];
  v5 = [(MusicKit_SoftLinking_MPModelObject *)v3 initWithUnderlyingModelObject:v4];

  return v5;
}

- (id)underlyingObject
{
  return self->_underlyingItem;
}

@end