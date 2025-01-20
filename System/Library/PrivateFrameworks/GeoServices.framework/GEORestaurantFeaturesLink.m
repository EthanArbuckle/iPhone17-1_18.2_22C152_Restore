@interface GEORestaurantFeaturesLink
- (BOOL)hasFeatures;
- (GEOPDRestaurantReservationLink)restaurantReservationLink;
- (GEORestaurantFeaturesLink)initWithRestaurantReservationLink:(id)a3 attributionMap:(id)a4;
- (NSArray)featureProviders;
- (NSArray)featureTypes;
- (id)applicationsForVendorID:(id)a3;
- (id)displayNameForVendorID:(id)a3;
- (unint64_t)extensionModeForVendorID:(id)a3;
- (void)setRestaurantReservationLink:(id)a3;
@end

@implementation GEORestaurantFeaturesLink

- (GEORestaurantFeaturesLink)initWithRestaurantReservationLink:(id)a3 attributionMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEORestaurantFeaturesLink;
  v9 = [(GEORestaurantFeaturesLink *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_restaurantReservationLink, a3);
    objc_storeStrong((id *)&v10->_attributionMap, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)hasFeatures
{
  uint64_t v2 = [(GEORestaurantFeaturesLink *)self restaurantReservationLink];
  v3 = (void *)v2;
  if (v2) {
    BOOL v4 = [*(id *)(v2 + 16) count] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSArray)featureProviders
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v4 = [(GEORestaurantFeaturesLink *)self restaurantReservationLink];
  v5 = -[GEOPDRestaurantReservationLink restaurantLinks](v4);

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(id **)(*((void *)&v15 + 1) + 8 * i);
        v11 = -[GEOPDVendorIDLink vendorId](v10);
        v19 = v11;
        v12 = -[GEOPDVendorIDLink externalItemId](v10);
        v20 = v12;
        objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        [v3 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (id)applicationsForVendorID:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v10 = 0;
    goto LABEL_16;
  }
  v5 = _getValue(GeoServicesConfig_DebugOverrideAppsForVendorID, (uint64_t)off_1E9114248, 1, 0, 0, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
        uint64_t v8 = [v6 objectForKeyedSubscript:@"restaurantReservationExtensionSupport"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v9 = objc_alloc_init(GEOAttributionApp);
            [(GEOAttributionApp *)v9 setAppBundleIdentifier:v7];
            if (v8) {
              -[GEOAttributionApp setRestaurantReservationExtensionSupport:](v9, "setRestaurantReservationExtensionSupport:", [v8 integerValue]);
            }
            v12[0] = v9;
            v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

            goto LABEL_15;
          }
        }
      }
    }
  }
  uint64_t v6 = [(NSMapTable *)self->_attributionMap objectForKey:v4];
  v10 = [v6 attributionApps];
LABEL_15:

LABEL_16:

  return v10;
}

- (id)displayNameForVendorID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  v5 = _getValue(GeoServicesConfig_DebugOverrideAppsForVendorID, (uint64_t)off_1E9114248, 1, 0, 0, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_8:
    uint64_t v6 = [(NSMapTable *)self->_attributionMap objectForKey:v4];
    uint64_t v7 = [v6 displayName];
    goto LABEL_9;
  }
  uint64_t v7 = [v6 objectForKeyedSubscript:@"displayName"];
LABEL_9:
  uint64_t v8 = (void *)v7;

LABEL_10:

  return v8;
}

- (unint64_t)extensionModeForVendorID:(id)a3
{
  v3 = [(GEORestaurantFeaturesLink *)self applicationsForVendorID:a3];
  id v4 = [v3 firstObject];

  if (v4 && (unsigned int v5 = [v4 restaurantReservationExtensionSupport] - 1, v5 <= 2)) {
    unint64_t v6 = qword_18A635C18[v5];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (NSArray)featureTypes
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(GEORestaurantFeaturesLink *)self restaurantReservationLink];
  unsigned int v5 = -[GEOPDRestaurantReservationLink restaurantLinks](v4);
  unint64_t v6 = [v5 firstObject];

  unint64_t v7 = 0;
  if (!v6) {
    goto LABEL_7;
  }
LABEL_2:
  -[GEOPDVendorIDLink _readReservationTypes]((uint64_t)v6);
  for (unint64_t i = v6[4]; v7 < i; unint64_t i = 0)
  {
    unsigned int v9 = -[GEOPDVendorIDLink reservationTypeAtIndex:]((uint64_t)v6, v7);
    if (v9 <= 2) {
      [v3 addObject:qword_1E53E0E48[v9]];
    }
    ++v7;
    if (v6) {
      goto LABEL_2;
    }
LABEL_7:
    ;
  }
  v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (GEOPDRestaurantReservationLink)restaurantReservationLink
{
  return self->_restaurantReservationLink;
}

- (void)setRestaurantReservationLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionMap, 0);

  objc_storeStrong((id *)&self->_restaurantReservationLink, 0);
}

@end