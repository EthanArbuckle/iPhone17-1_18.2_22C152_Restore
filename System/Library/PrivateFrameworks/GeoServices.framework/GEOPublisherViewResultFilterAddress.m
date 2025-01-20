@interface GEOPublisherViewResultFilterAddress
- (GEOMapItemIdentifier)filterAddressIdentifier;
- (GEOPDPublisherViewResultFilterAddress)addressIdentifier;
- (GEOPublisherViewResultFilterAddress)initWithFilterAddressIdentifier:(id)a3 withPlaces:(id)a4;
- (NSString)displayString;
@end

@implementation GEOPublisherViewResultFilterAddress

- (GEOPublisherViewResultFilterAddress)initWithFilterAddressIdentifier:(id)a3 withPlaces:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)GEOPublisherViewResultFilterAddress;
  v9 = [(GEOPublisherViewResultFilterAddress *)&v21 init];
  if (v9)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__24;
    v19 = __Block_byref_object_dispose__24;
    id v20 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__GEOPublisherViewResultFilterAddress_initWithFilterAddressIdentifier_withPlaces___block_invoke;
    v12[3] = &unk_1E53DF208;
    id v13 = v7;
    v14 = &v15;
    [v8 enumerateObjectsUsingBlock:v12];
    if (!v16[5])
    {

      _Block_object_dispose(&v15, 8);
      v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v9->_filterAddressIdentifier, a3);
    objc_storeStrong((id *)&v9->_placeEntity, (id)v16[5]);

    _Block_object_dispose(&v15, 8);
  }
  v10 = v9;
LABEL_6:

  return v10;
}

void __82__GEOPublisherViewResultFilterAddress_initWithFilterAddressIdentifier_withPlaces___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  v6 = [[GEOMapItemIdentifier alloc] initWithPlace:v13];
  id v7 = [GEOMapItemIdentifier alloc];
  id v8 = -[GEOPDPublisherViewResultFilterAddress geoId](*(id **)(a1 + 32));
  v9 = [(GEOMapItemIdentifier *)v7 initWithMapsIdentifier:v8];

  if ([(GEOMapItemIdentifier *)v6 isEqual:v9])
  {
    uint64_t v10 = +[GEOPDEntity entityForPlaceData:v13];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (GEOMapItemIdentifier)filterAddressIdentifier
{
  v3 = [GEOMapItemIdentifier alloc];
  v4 = -[GEOPDPublisherViewResultFilterAddress geoId]((id *)&self->_filterAddressIdentifier->super.super.isa);
  v5 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v4];

  return v5;
}

- (GEOPDPublisherViewResultFilterAddress)addressIdentifier
{
  return self->_filterAddressIdentifier;
}

- (NSString)displayString
{
  return (NSString *)[(GEOPDEntity *)self->_placeEntity bestLocalizedString];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeEntity, 0);

  objc_storeStrong((id *)&self->_filterAddressIdentifier, 0);
}

@end