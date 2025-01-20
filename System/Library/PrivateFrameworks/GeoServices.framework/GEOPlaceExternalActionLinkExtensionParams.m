@interface GEOPlaceExternalActionLinkExtensionParams
- (GEOAttributionApp)attributionApp;
- (GEOPlaceExternalActionLinkExtensionParams)initWithExtensionParams:(id)a3 attributionMap:(id)a4;
- (NSString)externalItemId;
- (NSString)vendorId;
- (unint64_t)featureType;
@end

@implementation GEOPlaceExternalActionLinkExtensionParams

- (GEOPlaceExternalActionLinkExtensionParams)initWithExtensionParams:(id)a3 attributionMap:(id)a4
{
  v7 = (id *)a3;
  id v8 = a4;
  if (v7
    && (-[GEOPDExtensionParams vendorId](v7),
        v9 = objc_claimAutoreleasedReturnValue(),
        [v8 objectForKey:v9],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v15.receiver = self;
    v15.super_class = (Class)GEOPlaceExternalActionLinkExtensionParams;
    v11 = [(GEOPlaceExternalActionLinkExtensionParams *)&v15 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_extensionParams, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)vendorId
{
  return -[GEOPDExtensionParams vendorId]((id *)&self->_extensionParams->super.super.isa);
}

- (NSString)externalItemId
{
  return -[GEOPDExtensionParams externalItemId]((id *)&self->_extensionParams->super.super.isa);
}

- (unint64_t)featureType
{
  return 1;
}

- (GEOAttributionApp)attributionApp
{
  attributionMap = self->_attributionMap;
  v3 = -[GEOPDExtensionParams vendorId]((id *)&self->_extensionParams->super.super.isa);
  v4 = [(NSMapTable *)attributionMap objectForKey:v3];

  if (v4)
  {
    v5 = [v4 attributionApps];
    v6 = [v5 firstObject];
  }
  else
  {
    v6 = 0;
  }

  return (GEOAttributionApp *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionMap, 0);

  objc_storeStrong((id *)&self->_extensionParams, 0);
}

@end