@interface NTKParmesanAssetReader
+ (id)readerForAlbumWithResourceDirectory:(id)a3;
+ (id)readerForResourceDirectory:(id)a3;
- (BOOL)hasCityscapes;
- (BOOL)hasNature;
- (BOOL)hasPeople;
- (BOOL)hasPets;
- (BOOL)isShuffle;
- (NSArray)peopleIdentifiers;
- (NSString)assetCollectionIdentifier;
- (NSString)resourceDirectory;
- (NSString)uuidString;
- (NTKParmesanAssetReader)initWithResourceDirectory:(id)a3;
- (NTKParmesanAssetReaderDelegate)delegate;
- (NTKParmesanShuffleSelection)shuffleSelection;
- (id)description;
- (id)firstObject;
- (id)lastObject;
- (id)objectAtIndex:(unint64_t)a3;
- (int64_t)version;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)mutationCount;
- (void)setAssetCollectionIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasCityscapes:(BOOL)a3;
- (void)setHasNature:(BOOL)a3;
- (void)setHasPeople:(BOOL)a3;
- (void)setHasPets:(BOOL)a3;
- (void)setMutationCount:(unint64_t)a3;
- (void)setPeopleIdentifiers:(id)a3;
- (void)setUuidString:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)updateWithCompletion:(id)a3;
@end

@implementation NTKParmesanAssetReader

- (NTKParmesanAssetReader)initWithResourceDirectory:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKParmesanAssetReader;
  v8 = [(NTKParmesanAssetReader *)&v15 init];
  if (v8)
  {
    if (v4)
    {
      uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
      resourceDirectory = v8->_resourceDirectory;
      v8->_resourceDirectory = (NSString *)v9;
    }
    assetCollectionIdentifier = v8->_assetCollectionIdentifier;
    v8->_assetCollectionIdentifier = 0;

    peopleIdentifiers = v8->_peopleIdentifiers;
    v8->_peopleIdentifiers = 0;

    *(_DWORD *)&v8->_hasPeople = 0;
    uuidString = v8->_uuidString;
    v8->_uuidString = 0;
  }
  return v8;
}

- (BOOL)isShuffle
{
  return self->_hasPeople || self->_hasPets || self->_hasNature || self->_hasCityscapes;
}

- (NTKParmesanShuffleSelection)shuffleSelection
{
  if (objc_msgSend_isShuffle(self, a2, v2, v3))
  {
    v5 = (void *)MEMORY[0x263EFF980];
    uint64_t v6 = self->_peopleIdentifiers;
    v10 = objc_msgSend_array(v5, v7, v8, v9);
    v13 = v10;
    if (self->_hasPeople) {
      objc_msgSend_addObject_(v10, v11, (uint64_t)&unk_26FB35268, v12);
    }
    if (self->_hasPets) {
      objc_msgSend_addObject_(v13, v11, (uint64_t)&unk_26FB35280, v12);
    }
    if (self->_hasNature) {
      objc_msgSend_addObject_(v13, v11, (uint64_t)&unk_26FB35298, v12);
    }
    if (self->_hasCityscapes) {
      objc_msgSend_addObject_(v13, v11, (uint64_t)&unk_26FB352B0, v12);
    }
    v14 = [NTKParmesanShuffleSelection alloc];
    v16 = objc_msgSend_initWithShuffleTypesAsNSNumbers_personIdentifiers_(v14, v15, (uint64_t)v13, (uint64_t)v6);
  }
  else
  {
    v16 = 0;
  }

  return (NTKParmesanShuffleSelection *)v16;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_assetCollectionIdentifier(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_peopleIdentifiers(self, v9, v10, v11);
  unsigned int hasPeople = objc_msgSend_hasPeople(self, v13, v14, v15);
  unsigned int hasPets = objc_msgSend_hasPets(self, v17, v18, v19);
  unsigned int hasNature = objc_msgSend_hasNature(self, v21, v22, v23);
  unsigned int hasCityscapes = objc_msgSend_hasCityscapes(self, v25, v26, v27);
  v31 = objc_msgSend_stringWithFormat_(v3, v29, @"%@[album=%@, people=%@, hasPeople=%d, hasPets=%d, hasNature=%d, hasCityscapes=%d]", v30, v4, v8, v12, hasPeople, hasPets, hasNature, hasCityscapes);

  return v31;
}

+ (id)readerForResourceDirectory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_NTKParmesanImageListReader alloc];
  uint64_t v7 = objc_msgSend_initWithResourceDirectory_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

+ (id)readerForAlbumWithResourceDirectory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_NTKParmesanImageListReader alloc];
  uint64_t v7 = objc_msgSend_initWithResourceDirectory_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

- (unint64_t)count
{
  return 0;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)firstObject
{
  v5 = objc_msgSend_count(self, a2, v2, v3);
  if (v5)
  {
    v5 = objc_msgSend_objectAtIndex_(self, v6, 0, v7);
  }

  return v5;
}

- (id)lastObject
{
  v5 = objc_msgSend_count(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v9 = objc_msgSend_count(self, v6, v7, v8);
    v5 = objc_msgSend_objectAtIndex_(self, v10, v9 - 1, v11);
  }

  return v5;
}

- (void)updateWithCompletion:(id)a3
{
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  a3->var2 = &self->_mutationCount;
  a3->var0 = 1;
  unint64_t v8 = a3->var3[0];
  unint64_t v9 = v8 + a5;
  if (v8 + a5 > objc_msgSend_count(self, a2, (uint64_t)a3, (uint64_t)a4)) {
    unint64_t v9 = objc_msgSend_count(self, v10, v11, v12);
  }
  unint64_t v13 = v9 - v8;
  if (v9 > v8)
  {
    uint64_t v14 = a4;
    do
      *v14++ = (id)objc_msgSend_objectAtIndex_(self, v10, v8++, v12);
    while (v9 != v8);
  }
  a3->var3[0] = v9;
  a3->var1 = a4;
  return v13;
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (NTKParmesanAssetReaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKParmesanAssetReaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSString)assetCollectionIdentifier
{
  return self->_assetCollectionIdentifier;
}

- (void)setAssetCollectionIdentifier:(id)a3
{
}

- (NSArray)peopleIdentifiers
{
  return self->_peopleIdentifiers;
}

- (void)setPeopleIdentifiers:(id)a3
{
}

- (BOOL)hasPeople
{
  return self->_hasPeople;
}

- (void)setHasPeople:(BOOL)a3
{
  self->_unsigned int hasPeople = a3;
}

- (BOOL)hasPets
{
  return self->_hasPets;
}

- (void)setHasPets:(BOOL)a3
{
  self->_unsigned int hasPets = a3;
}

- (BOOL)hasNature
{
  return self->_hasNature;
}

- (void)setHasNature:(BOOL)a3
{
  self->_unsigned int hasNature = a3;
}

- (BOOL)hasCityscapes
{
  return self->_hasCityscapes;
}

- (void)setHasCityscapes:(BOOL)a3
{
  self->_unsigned int hasCityscapes = a3;
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (unint64_t)mutationCount
{
  return self->_mutationCount;
}

- (void)setMutationCount:(unint64_t)a3
{
  self->_mutationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_peopleIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetCollectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_resourceDirectory, 0);
}

@end