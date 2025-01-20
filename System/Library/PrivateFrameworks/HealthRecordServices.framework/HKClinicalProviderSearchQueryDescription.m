@interface HKClinicalProviderSearchQueryDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalProviderSearchQueryDescription)init;
- (HKClinicalProviderSearchQueryDescription)initWithCoder:(id)a3;
- (HKClinicalProviderSearchQueryDescription)initWithSearchString:(id)a3 latitude:(id)a4 longitude:(id)a5 pageOffset:(int64_t)a6 options:(unint64_t)a7;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSString)searchString;
- (int64_t)pageOffset;
- (unint64_t)hash;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalProviderSearchQueryDescription

- (HKClinicalProviderSearchQueryDescription)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalProviderSearchQueryDescription)initWithSearchString:(id)a3 latitude:(id)a4 longitude:(id)a5 pageOffset:(int64_t)a6 options:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HKClinicalProviderSearchQueryDescription;
  v15 = [(HKClinicalProviderSearchQueryDescription *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    searchString = v15->_searchString;
    v15->_searchString = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    latitude = v15->_latitude;
    v15->_latitude = (NSNumber *)v18;

    uint64_t v20 = [v14 copy];
    longitude = v15->_longitude;
    v15->_longitude = (NSNumber *)v20;

    v15->_pageOffset = a6;
    v15->_options = a7;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKClinicalProviderSearchQueryDescription *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v13 = 0;
LABEL_39:

      goto LABEL_40;
    }
    searchString = self->_searchString;
    v9 = [(HKClinicalProviderSearchQueryDescription *)v7 searchString];
    if (searchString != v9)
    {
      uint64_t v10 = [(HKClinicalProviderSearchQueryDescription *)v7 searchString];
      if (!v10)
      {
        BOOL v13 = 0;
        goto LABEL_38;
      }
      v3 = (void *)v10;
      v11 = self->_searchString;
      id v12 = [(HKClinicalProviderSearchQueryDescription *)v7 searchString];
      if (![(NSString *)v11 isEqual:v12])
      {
        BOOL v13 = 0;
LABEL_37:

        goto LABEL_38;
      }
      v36 = v12;
    }
    latitude = self->_latitude;
    v15 = [(HKClinicalProviderSearchQueryDescription *)v7 latitude];
    if (latitude != v15)
    {
      uint64_t v16 = [(HKClinicalProviderSearchQueryDescription *)v7 latitude];
      if (!v16)
      {
        BOOL v13 = 0;
        goto LABEL_27;
      }
      v17 = (void *)v16;
      uint64_t v18 = self->_latitude;
      uint64_t v19 = [(HKClinicalProviderSearchQueryDescription *)v7 latitude];
      uint64_t v20 = v18;
      v21 = (void *)v19;
      if (([(NSNumber *)v20 isEqual:v19] & 1) == 0)
      {

        BOOL v13 = 0;
        goto LABEL_36;
      }
      v34 = v21;
      v35 = v17;
    }
    longitude = self->_longitude;
    objc_super v23 = [(HKClinicalProviderSearchQueryDescription *)v7 longitude];
    if (longitude == v23)
    {
      int64_t pageOffset = self->_pageOffset;
      if (pageOffset == [(HKClinicalProviderSearchQueryDescription *)v7 pageOffset])
      {
        unint64_t options = self->_options;
        BOOL v30 = options == [(HKClinicalProviderSearchQueryDescription *)v7 options];
      }
      else
      {
        BOOL v30 = 0;
      }

      BOOL v13 = v30;
    }
    else
    {
      v24 = [(HKClinicalProviderSearchQueryDescription *)v7 longitude];
      if (v24)
      {
        v33 = v3;
        v25 = self->_longitude;
        v32 = [(HKClinicalProviderSearchQueryDescription *)v7 longitude];
        if ((-[NSNumber isEqual:](v25, "isEqual:") & 1) == 0)
        {
          BOOL v13 = 0;
          goto LABEL_25;
        }
        int64_t v26 = self->_pageOffset;
        if (v26 == [(HKClinicalProviderSearchQueryDescription *)v7 pageOffset])
        {
          unint64_t v27 = self->_options;
          BOOL v13 = v27 == [(HKClinicalProviderSearchQueryDescription *)v7 options];
LABEL_25:
          v3 = v33;

          if (latitude != v15)
          {

LABEL_27:
            id v12 = v36;

            if (searchString == v9) {
              goto LABEL_38;
            }
            goto LABEL_37;
          }

LABEL_36:
          id v12 = v36;
          if (searchString != v9) {
            goto LABEL_37;
          }
LABEL_38:

          goto LABEL_39;
        }

        v3 = v33;
      }

      BOOL v30 = 0;
      BOOL v13 = 0;
    }
    if (latitude != v15)
    {

      BOOL v13 = v30;
    }

    goto LABEL_36;
  }
  BOOL v13 = 1;
LABEL_40:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_searchString hash];
  uint64_t v4 = [(NSNumber *)self->_latitude hash] ^ v3;
  return v4 ^ [(NSNumber *)self->_longitude hash] ^ self->_pageOffset ^ self->_options;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  searchString = self->_searchString;
  id v5 = a3;
  [v5 encodeObject:searchString forKey:@"SearchString"];
  [v5 encodeObject:self->_latitude forKey:@"Latitude"];
  [v5 encodeObject:self->_longitude forKey:@"Longitude"];
  [v5 encodeInteger:self->_pageOffset forKey:@"PageOffset"];
  [v5 encodeInteger:self->_options forKey:@"Options"];
}

- (HKClinicalProviderSearchQueryDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SearchString"];
  if (v5
    && [v4 containsValueForKey:@"PageOffset"]
    && ([v4 containsValueForKey:@"Options"] & 1) != 0)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Latitude"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Longitude"];
    self = -[HKClinicalProviderSearchQueryDescription initWithSearchString:latitude:longitude:pageOffset:options:](self, "initWithSearchString:latitude:longitude:pageOffset:options:", v5, v6, v7, [v4 decodeIntegerForKey:@"PageOffset"], objc_msgSend(v4, "decodeIntegerForKey:", @"Options"));

    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);

  objc_storeStrong((id *)&self->_searchString, 0);
}

@end