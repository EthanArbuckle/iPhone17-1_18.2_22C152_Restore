@interface MusicKit_SoftLinking_MPSectionedCollection
- (BOOL)hasSameContentAsSectionedCollection:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPSectionedCollection)_underlyingSectionedCollection;
- (MusicKit_SoftLinking_MPSectionedCollection)init;
- (MusicKit_SoftLinking_MPSectionedCollection)initWithUnderlyingSectionedCollection:(id)a3;
- (id)allItems;
- (id)allSections;
- (id)identifiersForItemAtIndexPath:(id)a3;
- (id)identifiersForSectionAtIndex:(int64_t)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)itemAtIndexPathBlock;
- (id)sectionAtIndex:(int64_t)a3;
- (id)sectionIdentifiersAtIndexBlock;
- (id)sectionItemAtIndexPathBlock;
- (id)underlyingSectionedCollection;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)totalItemCount;
- (unint64_t)hash;
- (void)enumerateItemIdentifiersInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4;
- (void)enumerateItemIdentifiersUsingBlock:(id)a3;
- (void)enumerateSectionIdentifiersUsingBlock:(id)a3;
- (void)enumerateTitledSectionsUsingBlock:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPSectionedCollection

- (void).cxx_destruct
{
}

- (id)itemAtIndexPath:(id)a3
{
  return (id)[(MPSectionedCollection *)self->_underlyingSectionedCollection itemAtIndexPath:a3];
}

- (id)itemAtIndexPathBlock
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__MusicKit_SoftLinking_MPSectionedCollection_itemAtIndexPathBlock__block_invoke;
  aBlock[3] = &unk_264440190;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

- (MusicKit_SoftLinking_MPSectionedCollection)initWithUnderlyingSectionedCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPSectionedCollection;
  v6 = [(MusicKit_SoftLinking_MPSectionedCollection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingSectionedCollection, a3);
  }

  return v7;
}

- (void)enumerateItemIdentifiersUsingBlock:(id)a3
{
  id v4 = a3;
  underlyingSectionedCollection = self->_underlyingSectionedCollection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__MusicKit_SoftLinking_MPSectionedCollection_enumerateItemIdentifiersUsingBlock___block_invoke;
  v7[3] = &unk_2644401B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MPSectionedCollection *)underlyingSectionedCollection enumerateItemIdentifiersUsingBlock:v7];
}

- (MusicKit_SoftLinking_MPSectionedCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPSectionedCollection;
  v2 = [(MusicKit_SoftLinking_MPSectionedCollection *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getMPSectionedCollectionClass_softClass;
    uint64_t v13 = getMPSectionedCollectionClass_softClass;
    if (!getMPSectionedCollectionClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getMPSectionedCollectionClass_block_invoke;
      v9[3] = &unk_26443F950;
      v9[4] = &v10;
      __getMPSectionedCollectionClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    id v5 = (MPSectionedCollection *)objc_alloc_init(v4);
    underlyingSectionedCollection = v2->_underlyingSectionedCollection;
    v2->_underlyingSectionedCollection = v5;
  }
  return v2;
}

- (id)underlyingSectionedCollection
{
  return self->_underlyingSectionedCollection;
}

- (MPSectionedCollection)_underlyingSectionedCollection
{
  return self->_underlyingSectionedCollection;
}

- (int64_t)totalItemCount
{
  return [(MPSectionedCollection *)self->_underlyingSectionedCollection totalItemCount];
}

- (id)sectionIdentifiersAtIndexBlock
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__MusicKit_SoftLinking_MPSectionedCollection_sectionIdentifiersAtIndexBlock__block_invoke;
  aBlock[3] = &unk_264440168;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

- (id)sectionItemAtIndexPathBlock
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__MusicKit_SoftLinking_MPSectionedCollection_sectionItemAtIndexPathBlock__block_invoke;
  aBlock[3] = &unk_264440168;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

- (id)allSections
{
  return (id)[(MPSectionedCollection *)self->_underlyingSectionedCollection allSections];
}

- (id)allItems
{
  return (id)[(MPSectionedCollection *)self->_underlyingSectionedCollection allItems];
}

- (int64_t)numberOfSections
{
  return [(MPSectionedCollection *)self->_underlyingSectionedCollection numberOfSections];
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return [(MPSectionedCollection *)self->_underlyingSectionedCollection numberOfItemsInSection:a3];
}

- (id)sectionAtIndex:(int64_t)a3
{
  return (id)[(MPSectionedCollection *)self->_underlyingSectionedCollection sectionAtIndex:a3];
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  id v5 = -[MPSectionedCollection identifiersForSectionAtIndex:](self->_underlyingSectionedCollection, "identifiersForSectionAtIndex:");
  if ((objc_msgSend(v5, "musicKit_hasValidIdentifier") & 1) == 0)
  {
    id v6 = [(MPSectionedCollection *)self->_underlyingSectionedCollection sectionAtIndex:a3];
    v7 = [v6 identifiers];

    if (v7)
    {
      id v8 = v7;

      id v5 = v8;
    }
  }

  return v5;
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MPSectionedCollection *)self->_underlyingSectionedCollection identifiersForItemAtIndexPath:v4];
  if ((objc_msgSend(v5, "musicKit_hasValidIdentifier") & 1) == 0)
  {
    id v6 = [(MPSectionedCollection *)self->_underlyingSectionedCollection itemAtIndexPath:v4];
    v7 = [v6 identifiers];

    if (v7)
    {
      id v8 = v7;

      id v5 = v8;
    }
  }

  return v5;
}

- (void)enumerateSectionIdentifiersUsingBlock:(id)a3
{
  id v4 = a3;
  underlyingSectionedCollection = self->_underlyingSectionedCollection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__MusicKit_SoftLinking_MPSectionedCollection_enumerateSectionIdentifiersUsingBlock___block_invoke;
  v7[3] = &unk_2644401E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MPSectionedCollection *)underlyingSectionedCollection enumerateSectionIdentifiersUsingBlock:v7];
}

- (void)enumerateTitledSectionsUsingBlock:(id)a3
{
  id v4 = a3;
  underlyingSectionedCollection = self->_underlyingSectionedCollection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__MusicKit_SoftLinking_MPSectionedCollection_enumerateTitledSectionsUsingBlock___block_invoke;
  v7[3] = &unk_264440208;
  id v8 = v4;
  id v6 = v4;
  [(MPSectionedCollection *)underlyingSectionedCollection enumerateSectionsUsingBlock:v7];
}

- (void)enumerateItemIdentifiersInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  underlyingSectionedCollection = self->_underlyingSectionedCollection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __98__MusicKit_SoftLinking_MPSectionedCollection_enumerateItemIdentifiersInSectionAtIndex_usingBlock___block_invoke;
  v9[3] = &unk_264440230;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [(MPSectionedCollection *)underlyingSectionedCollection enumerateItemIdentifiersInSectionAtIndex:a3 usingBlock:v9];
}

- (BOOL)hasSameContentAsSectionedCollection:(id)a3
{
  underlyingSectionedCollection = self->_underlyingSectionedCollection;
  id v4 = [a3 _underlyingSectionedCollection];
  LOBYTE(underlyingSectionedCollection) = [(MPSectionedCollection *)underlyingSectionedCollection hasSameContentAsSectionedCollection:v4];

  return (char)underlyingSectionedCollection;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MusicKit_SoftLinking_MPSectionedCollection *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if ([(MusicKit_SoftLinking_MPSectionedCollection *)v4 isMemberOfClass:objc_opt_class()])
  {
    underlyingSectionedCollection = self->_underlyingSectionedCollection;
    id v6 = [(MusicKit_SoftLinking_MPSectionedCollection *)v4 _underlyingSectionedCollection];
    char v7 = [(MPSectionedCollection *)underlyingSectionedCollection isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(MPSectionedCollection *)self->_underlyingSectionedCollection hash];
}

@end