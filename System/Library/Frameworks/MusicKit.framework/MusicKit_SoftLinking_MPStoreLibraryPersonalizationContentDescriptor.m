@interface MusicKit_SoftLinking_MPStoreLibraryPersonalizationContentDescriptor
- (MPStoreLibraryPersonalizationContentDescriptor)_underlyingContentDescriptor;
- (MusicKit_SoftLinking_MPStoreLibraryPersonalizationContentDescriptor)initWithModel:(id)a3 personalizationStyle:(int64_t)a4;
- (id)underlyingObject;
@end

@implementation MusicKit_SoftLinking_MPStoreLibraryPersonalizationContentDescriptor

- (void).cxx_destruct
{
}

- (MusicKit_SoftLinking_MPStoreLibraryPersonalizationContentDescriptor)initWithModel:(id)a3 personalizationStyle:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MusicKit_SoftLinking_MPStoreLibraryPersonalizationContentDescriptor;
  v7 = [(MusicKit_SoftLinking_MPStoreLibraryPersonalizationContentDescriptor *)&v15 init];
  if (v7)
  {
    if ((unint64_t)(a4 - 1) >= 4) {
      int64_t v8 = 0;
    }
    else {
      int64_t v8 = a4;
    }
    v9 = [v6 _underlyingObject];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v10 = (void *)getMPStoreLibraryPersonalizationContentDescriptorClass_softClass;
    uint64_t v20 = getMPStoreLibraryPersonalizationContentDescriptorClass_softClass;
    if (!getMPStoreLibraryPersonalizationContentDescriptorClass_softClass)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __getMPStoreLibraryPersonalizationContentDescriptorClass_block_invoke;
      v16[3] = &unk_26443F950;
      v16[4] = &v17;
      __getMPStoreLibraryPersonalizationContentDescriptorClass_block_invoke((uint64_t)v16);
      v10 = (void *)v18[3];
    }
    v11 = v10;
    _Block_object_dispose(&v17, 8);
    uint64_t v12 = [[v11 alloc] initWithModel:v9 personalizationStyle:v8];
    underlyingContentDescriptor = v7->_underlyingContentDescriptor;
    v7->_underlyingContentDescriptor = (MPStoreLibraryPersonalizationContentDescriptor *)v12;
  }
  return v7;
}

- (id)underlyingObject
{
  return self->_underlyingContentDescriptor;
}

- (MPStoreLibraryPersonalizationContentDescriptor)_underlyingContentDescriptor
{
  return self->_underlyingContentDescriptor;
}

@end