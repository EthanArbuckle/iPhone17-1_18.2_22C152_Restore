@interface MPCModelRadioPersonalizationResponse
- (MPCModelRadioPersonalizationResponse)initWithRequest:(id)a3 personalizationResponse:(id)a4;
- (MPSectionedCollection)radioStationTracks;
- (void)dealloc;
- (void)setRadioStationTracks:(id)a3;
@end

@implementation MPCModelRadioPersonalizationResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioStationTracks, 0);

  objc_storeStrong((id *)&self->_personalizationResponse, 0);
}

- (void)setRadioStationTracks:(id)a3
{
}

- (MPSectionedCollection)radioStationTracks
{
  return self->_radioStationTracks;
}

- (void)dealloc
{
  if (self->_personalizationResponse)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F11B18] object:self->_personalizationResponse];
  }
  v4.receiver = self;
  v4.super_class = (Class)MPCModelRadioPersonalizationResponse;
  [(MPCModelRadioPersonalizationResponse *)&v4 dealloc];
}

- (MPCModelRadioPersonalizationResponse)initWithRequest:(id)a3 personalizationResponse:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MPCModelRadioPersonalizationResponse;
  v8 = [(MPModelResponse *)&v15 initWithRequest:a3];
  v9 = v8;
  if (v8)
  {
    p_personalizationResponse = (id *)&v8->_personalizationResponse;
    objc_storeStrong((id *)&v8->_personalizationResponse, a4);
    v11 = [v7 representedObjectResults];
    [(MPCModelRadioPersonalizationResponse *)v9 setRadioStationTracks:v11];

    v12 = [v7 results];
    [(MPModelResponse *)v9 setResults:v12];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v9 selector:sel__invalidate name:*MEMORY[0x263F11B18] object:*p_personalizationResponse];
    if (([*p_personalizationResponse isValid] & 1) == 0) {
      [(MPModelResponse *)v9 _invalidate];
    }
  }
  return v9;
}

@end