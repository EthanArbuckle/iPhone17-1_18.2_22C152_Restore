@interface MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest
- (MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest)initWithUnpersonalizedRequest:(id)a3 unpersonalizedContentDescriptors:(id)a4 representedObjects:(id)a5;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest

- (void).cxx_destruct
{
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  underlyingPersonalizationRequest = self->_underlyingPersonalizationRequest;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_26443FA30;
  id v8 = v4;
  id v6 = v4;
  [(MPStoreLibraryPersonalizationRequest *)underlyingPersonalizationRequest performWithResponseHandler:v7];
}

- (MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest)initWithUnpersonalizedRequest:(id)a3 unpersonalizedContentDescriptors:(id)a4 representedObjects:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest;
  v11 = [(MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest *)&v25 init];
  if (v11)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v12 = (void *)getMPStoreLibraryPersonalizationRequestClass_softClass;
    uint64_t v30 = getMPStoreLibraryPersonalizationRequestClass_softClass;
    if (!getMPStoreLibraryPersonalizationRequestClass_softClass)
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __getMPStoreLibraryPersonalizationRequestClass_block_invoke;
      v26[3] = &unk_26443F950;
      v26[4] = &v27;
      __getMPStoreLibraryPersonalizationRequestClass_block_invoke((uint64_t)v26);
      v12 = (void *)v28[3];
    }
    v13 = v12;
    _Block_object_dispose(&v27, 8);
    id v14 = [v13 alloc];
    v15 = [v8 _underlyingRequest];
    v16 = [v9 _underlyingSectionedCollection];
    uint64_t v17 = [v14 initWithUnpersonalizedRequest:v15 unpersonalizedContentDescriptors:v16];
    underlyingPersonalizationRequest = v11->_underlyingPersonalizationRequest;
    v11->_underlyingPersonalizationRequest = (MPStoreLibraryPersonalizationRequest *)v17;

    v19 = v11->_underlyingPersonalizationRequest;
    v20 = [v10 _underlyingSectionedCollection];
    [(MPStoreLibraryPersonalizationRequest *)v19 setRepresentedObjects:v20];

    v21 = v11->_underlyingPersonalizationRequest;
    v22 = [v8 _underlyingRequest];
    v23 = [v22 itemProperties];
    [(MPStoreLibraryPersonalizationRequest *)v21 setItemProperties:v23];
  }
  return v11;
}

@end