@interface CLSBusinessItem
+ (BOOL)supportsSecureCoding;
+ (double)_defaultRadiusForCategories:(id)a3;
+ (id)_businessCategoriesFromGeoMapItems:(id)a3;
+ (id)_regionFromMapItem:(id)a3;
- (BOOL)cached;
- (BOOL)isEnriched;
- (CLCircularRegion)region;
- (CLSBusinessItem)initWithCoder:(id)a3;
- (CLSBusinessItem)initWithName:(id)a3 region:(id)a4 categories:(id)a5;
- (NSArray)businessCategories;
- (NSArray)categories;
- (NSString)geoServiceProvider;
- (NSString)isoCountryCode;
- (NSString)name;
- (id)description;
- (id)initFromMapItem:(id)a3 isoCountryCode:(id)a4 categoryOnly:(BOOL)a5;
- (int64_t)venueCapacity;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)encodeWithCoder:(id)a3;
- (void)setBusinessCategories:(id)a3;
- (void)setCached:(BOOL)a3;
- (void)setCategories:(id)a3;
- (void)setGeoServiceProvider:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setRegion:(id)a3;
- (void)setVenueCapacity:(int64_t)a3;
@end

@implementation CLSBusinessItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoServiceProvider, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_businessCategories, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setGeoServiceProvider:(id)a3
{
}

- (NSString)geoServiceProvider
{
  return self->_geoServiceProvider;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setBusinessCategories:(id)a3
{
}

- (NSArray)businessCategories
{
  return self->_businessCategories;
}

- (void)setVenueCapacity:(int64_t)a3
{
  self->_venueCapacity = a3;
}

- (int64_t)venueCapacity
{
  return self->_venueCapacity;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setCategories:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setRegion:(id)a3
{
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

- (BOOL)cached
{
  return self->_cached;
}

- (id)description
{
  v3 = NSString;
  name = self->_name;
  unint64_t muid = self->_muid;
  int64_t venueCapacity = self->_venueCapacity;
  v7 = [(NSArray *)self->_categories flattenWithSeparator:@","];
  region = self->_region;
  v9 = [(NSArray *)self->_businessCategories flattenWithSeparator:@","];
  v10 = [v3 stringWithFormat:@"Business Item: name:[%@] muid:[%lu] venueCapacity:[%lu] categories:[%@] region:[%@] businessCategories:[%@]", name, muid, venueCapacity, v7, region, v9];

  return v10;
}

- (unint64_t)hash
{
  return self->_muid;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL cached = self->_cached;
  id v5 = a3;
  [v5 encodeBool:cached forKey:@"cached"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_region forKey:@"region"];
  [v5 encodeObject:self->_categories forKey:@"categories"];
  [v5 encodeObject:self->_businessCategories forKey:@"businessCategories"];
  [v5 encodeInt64:self->_muid forKey:@"muid"];
  [v5 encodeInteger:self->_venueCapacity forKey:@"venueCapacity"];
}

- (CLSBusinessItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSBusinessItem *)self init];
  if (v5)
  {
    v5->_BOOL cached = [v4 decodeBoolForKey:@"cached"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    region = v5->_region;
    v5->_region = (CLCircularRegion *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"categories"];
    categories = v5->_categories;
    v5->_categories = (NSArray *)v13;

    v5->_unint64_t muid = [v4 decodeInt64ForKey:@"muid"];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"businessCategories"];
    businessCategories = v5->_businessCategories;
    v5->_businessCategories = (NSArray *)v18;

    v5->_int64_t venueCapacity = [v4 decodeIntegerForKey:@"venueCapacity"];
  }

  return v5;
}

- (BOOL)isEnriched
{
  v2 = [(CLSBusinessItem *)self name];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (CLSBusinessItem)initWithName:(id)a3 region:(id)a4 categories:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CLSBusinessItem;
  v12 = [(CLSBusinessItem *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_BOOL cached = 0;
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_region, a4);
    objc_storeStrong((id *)&v13->_categories, a5);
  }

  return v13;
}

- (id)initFromMapItem:(id)a3 isoCountryCode:(id)a4 categoryOnly:(BOOL)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 _hasMUID])
  {
    v35.receiver = self;
    v35.super_class = (Class)CLSBusinessItem;
    id v10 = [(CLSBusinessItem *)&v35 init];
    if (v10)
    {
      id v11 = [v8 spatialMappedCategories];
      v12 = [(id)objc_opt_class() _regionFromMapItem:v8];
      uint64_t v13 = v12;
      if (v12)
      {
        v14 = v12;
        region = v10->_region;
        v10->_region = v14;
      }
      else
      {
        [(id)objc_opt_class() _defaultRadiusForCategories:v11];
        double v18 = v17;
        [v8 centerCoordinate];
        CLLocationDegrees v20 = v19;
        CLLocationDegrees v22 = v21;
        id v23 = objc_alloc(MEMORY[0x1E4F1E5A8]);
        CLLocationCoordinate2D v24 = CLLocationCoordinate2DMake(v20, v22);
        region = [MEMORY[0x1E4F29128] UUID];
        v25 = [region UUIDString];
        uint64_t v26 = objc_msgSend(v23, "initWithCenter:radius:identifier:", v25, v24.latitude, v24.longitude, v18);
        v27 = v10->_region;
        v10->_region = (CLCircularRegion *)v26;
      }
      objc_storeStrong((id *)&v10->_isoCountryCode, a4);
      uint64_t v28 = [MEMORY[0x1E4F8AB68] currentRevGeoProvider];
      geoServiceProvider = v10->_geoServiceProvider;
      v10->_geoServiceProvider = (NSString *)v28;

      v10->_BOOL cached = 0;
      objc_storeStrong((id *)&v10->_categories, v11);
      v10->_unint64_t muid = [v8 _muid];
      if (!a5)
      {
        v10->_int64_t venueCapacity = [v8 venueCapacity];
        uint64_t v30 = [v8 name];
        name = v10->_name;
        v10->_name = (NSString *)v30;

        uint64_t v32 = [(id)objc_opt_class() _businessCategoriesFromGeoMapItems:v8];
        businessCategories = v10->_businessCategories;
        v10->_businessCategories = (NSArray *)v32;
      }
    }
    self = v10;
    uint64_t v16 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v37 = v8;
      _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot create BusinessItem from MapItem %{private}@ with no MUID", buf, 0xCu);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_businessCategoriesFromGeoMapItems:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v23 = v3;
  id v5 = [v3 _place];
  uint64_t v6 = [v5 business];

  obuint64_t j = v6;
  uint64_t v26 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v8 localizedCategoriesCount])
        {
          uint64_t v27 = i;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v9 = [v8 localizedCategories];
          id v10 = [v9 reverseObjectEnumerator];

          uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v33;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v33 != v13) {
                  objc_enumerationMutation(v10);
                }
                objc_super v15 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                long long v28 = 0u;
                long long v29 = 0u;
                long long v30 = 0u;
                long long v31 = 0u;
                uint64_t v16 = [v15 localizedNames];
                uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v40 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v29;
                  do
                  {
                    for (uint64_t k = 0; k != v18; ++k)
                    {
                      if (*(void *)v29 != v19) {
                        objc_enumerationMutation(v16);
                      }
                      double v21 = [*(id *)(*((void *)&v28 + 1) + 8 * k) name];
                      if ([v21 length]) {
                        [v4 addObject:v21];
                      }
                    }
                    uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v40 count:16];
                  }
                  while (v18);
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
            }
            while (v12);
          }

          uint64_t i = v27;
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v26);
  }

  return v4;
}

+ (double)_defaultRadiusForCategories:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:&unk_1F28F2C78])
  {
    double v4 = 500.0;
  }
  else if ([v3 containsObject:&unk_1F28F2C90])
  {
    double v4 = 2000.0;
  }
  else
  {
    double v4 = 50.0;
  }

  return v4;
}

+ (id)_regionFromMapItem:(id)a3
{
  id v3 = [a3 geoFenceMapRegion];
  if ([v3 hasNorthLat]
    && [v3 hasSouthLat]
    && [v3 hasEastLng]
    && [v3 hasWestLng])
  {
    [v3 northLat];
    double v5 = v4;
    [v3 southLat];
    double v7 = v6;
    [v3 westLng];
    double v9 = v8;
    [v3 eastLng];
    double v11 = (v5 + v7) * 0.5;
    if (v9 <= v10)
    {
      double v13 = (v9 + v10) * 0.5;
    }
    else
    {
      double v12 = (v10 + 360.0 - v9) * 0.5 + v9;
      if (v12 <= 180.0) {
        double v13 = v12;
      }
      else {
        double v13 = v12 + -360.0;
      }
    }
    [v3 southLat];
    double v17 = v16;
    [v3 westLng];
    CLSCommonCalculateDistanceRadius(1, v11, v13, v17, v18);
    double v20 = v19;
    id v21 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    CLLocationDegrees v22 = [NSString stringWithFormat:@"<%+.8f,%+.8f> radius %.2f", *(void *)&v11, *(void *)&v13, *(void *)&v20];
    v14 = objc_msgSend(v21, "initWithCenter:radius:identifier:", v22, v11, v13, v20);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end