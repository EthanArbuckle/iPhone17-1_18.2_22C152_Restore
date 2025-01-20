@interface MPCPlayerResponseSection
- (MPCPlayerResponse)response;
- (MPCPlayerResponseSection)initWithModelGenericObject:(id)a3 sectionIndex:(int64_t)a4 response:(id)a5;
- (MPModelGenericObject)metadataObject;
- (id)_init;
- (id)remove;
@end

@implementation MPCPlayerResponseSection

- (MPModelGenericObject)metadataObject
{
  return self->_metadataObject;
}

- (MPCPlayerResponseSection)initWithModelGenericObject:(id)a3 sectionIndex:(int64_t)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MPCPlayerResponseSection;
  v10 = [(MPCPlayerResponseSection *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_response, v9);
    objc_storeStrong((id *)&v11->_metadataObject, a3);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataObject, 0);

  objc_destroyWeak((id *)&self->_response);
}

- (MPCPlayerResponse)response
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);

  return (MPCPlayerResponse *)WeakRetained;
}

- (id)remove
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MPCPlayerResponseSection;
  return [(MPCPlayerResponseSection *)&v3 init];
}

@end