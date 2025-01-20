@interface MusicKit_SoftLinking_MPStoreLibraryPersonalizationResponse
- (MusicKit_SoftLinking_MPMutableSectionedCollection)representedObjectResults;
- (MusicKit_SoftLinking_MPStoreLibraryPersonalizationResponse)initWithUnderlyingPersonalizationResponse:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPStoreLibraryPersonalizationResponse

- (MusicKit_SoftLinking_MPMutableSectionedCollection)representedObjectResults
{
  v3 = [MusicKit_SoftLinking_MPSectionedCollection alloc];
  v4 = [(MPStoreLibraryPersonalizationResponse *)self->_underlyingResponse representedObjectResults];
  v5 = [(MusicKit_SoftLinking_MPSectionedCollection *)v3 initWithUnderlyingSectionedCollection:v4];

  return (MusicKit_SoftLinking_MPMutableSectionedCollection *)v5;
}

- (void).cxx_destruct
{
}

- (MusicKit_SoftLinking_MPStoreLibraryPersonalizationResponse)initWithUnderlyingPersonalizationResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPStoreLibraryPersonalizationResponse;
  v6 = [(MusicKit_SoftLinking_MPModelResponse *)&v9 initWithUnderlyingResponse:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingResponse, a3);
  }

  return v7;
}

@end