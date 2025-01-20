@interface MusicKit_SoftLinking_MPMutableSectionedCollection
- (MPMutableSectionedCollection)_underlyingSectionedCollection;
- (MusicKit_SoftLinking_MPMutableSectionedCollection)init;
- (MusicKit_SoftLinking_MPMutableSectionedCollection)initWithUnderlyingSectionedCollection:(id)a3;
- (void)appendItem:(id)a3;
- (void)appendItems:(id)a3;
- (void)appendSection:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPMutableSectionedCollection

- (void)appendSection:(id)a3
{
  id v5 = a3;
  v4 = v5;
  if ([v5 conformsToProtocol:&unk_26CDCA160])
  {
    v4 = [v5 underlyingObject];
  }
  [(MPMutableSectionedCollection *)self->_underlyingSectionedCollection appendSection:v4];
}

- (void)appendItem:(id)a3
{
  id v5 = a3;
  v4 = v5;
  if ([v5 conformsToProtocol:&unk_26CDCA160])
  {
    v4 = [v5 underlyingObject];
  }
  [(MPMutableSectionedCollection *)self->_underlyingSectionedCollection appendItem:v4];
}

- (void).cxx_destruct
{
}

- (MPMutableSectionedCollection)_underlyingSectionedCollection
{
  return self->_underlyingSectionedCollection;
}

- (MusicKit_SoftLinking_MPMutableSectionedCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPMutableSectionedCollection;
  v2 = [(MusicKit_SoftLinking_MPSectionedCollection *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getMPMutableSectionedCollectionClass_softClass_0;
    uint64_t v13 = getMPMutableSectionedCollectionClass_softClass_0;
    if (!getMPMutableSectionedCollectionClass_softClass_0)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getMPMutableSectionedCollectionClass_block_invoke_0;
      v9[3] = &unk_26443F950;
      v9[4] = &v10;
      __getMPMutableSectionedCollectionClass_block_invoke_0((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    id v5 = (MPMutableSectionedCollection *)objc_alloc_init(v4);
    underlyingSectionedCollection = v2->_underlyingSectionedCollection;
    v2->_underlyingSectionedCollection = v5;
  }
  return v2;
}

- (MusicKit_SoftLinking_MPMutableSectionedCollection)initWithUnderlyingSectionedCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPMutableSectionedCollection;
  v6 = [(MusicKit_SoftLinking_MPSectionedCollection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingSectionedCollection, a3);
  }

  return v7;
}

- (void)appendItems:(id)a3
{
  objc_msgSend(a3, "msv_map:", &__block_literal_global_7);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(MPMutableSectionedCollection *)self->_underlyingSectionedCollection appendItems:v4];
}

@end