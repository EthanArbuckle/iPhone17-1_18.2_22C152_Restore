@interface RTAddress
+ (BOOL)supportsSecureCoding;
+ (id)_decodeGeoAddressObjectFromData:(id)a3 decompress:(BOOL)a4;
+ (id)_encodeGeoAddressObject:(id)a3 compress:(BOOL)a4;
+ (id)_mergedThoroughfareWithSubPremises:(id)a3 subThoroughfare:(id)a4 thoroughfare:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAddress:(id)a3;
- (BOOL)isIsland;
- (NSArray)areasOfInterest;
- (NSArray)subPremises;
- (NSData)geoAddressData;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSString)administrativeArea;
- (NSString)administrativeAreaCode;
- (NSString)country;
- (NSString)countryCode;
- (NSString)inlandWater;
- (NSString)iso3166CountryCode;
- (NSString)iso3166SubdivisionCode;
- (NSString)locality;
- (NSString)mergedThoroughfare;
- (NSString)ocean;
- (NSString)postalCode;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (NSUUID)identifier;
- (RTAddress)init;
- (RTAddress)initWithCoder:(id)a3;
- (RTAddress)initWithGeoDictionary:(id)a3 language:(id)a4 country:(id)a5 phoneticLocale:(id)a6;
- (RTAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 iso3166CountryCode:(id)a9 iso3166SubdivisionCode:(id)a10;
- (RTAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 subThoroughfare:(id)a6 thoroughfare:(id)a7 subLocality:(id)a8 locality:(id)a9 subAdministrativeArea:(id)a10 administrativeArea:(id)a11 administrativeAreaCode:(id)a12 postalCode:(id)a13 country:(id)a14 countryCode:(id)a15 inlandWater:(id)a16 ocean:(id)a17 areasOfInterest:(id)a18 isIsland:(BOOL)a19 creationDate:(id)a20 expirationDate:(id)a21 iso3166CountryCode:(id)a22 iso3166SubdivisionCode:(id)a23;
- (RTAddress)initWithIdentifier:(id)a3 geoAddressObject:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 iso3166CountryCode:(id)a9 iso3166SubdivisionCode:(id)a10;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)geoAddressObject;
- (id)geoDictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
@end

@implementation RTAddress

- (NSString)postalCode
{
  v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    v4 = [(RTAddress *)self geoAddressObject];
    v5 = [v4 address];
    v6 = [v5 structuredAddress];

    v7 = [v6 postCode];
  }
  else
  {
    v7 = self->_postalCode;
  }
  return v7;
}

- (NSString)administrativeArea
{
  v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    v4 = [(RTAddress *)self geoAddressObject];
    v5 = [v4 address];
    v6 = [v5 structuredAddress];

    v7 = [v6 administrativeArea];
  }
  else
  {
    v7 = self->_administrativeArea;
  }
  return v7;
}

- (NSString)subThoroughfare
{
  v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    v4 = [(RTAddress *)self geoAddressObject];
    v5 = [v4 address];
    v6 = [v5 structuredAddress];

    v7 = [v6 subThoroughfare];
  }
  else
  {
    v7 = self->_subThoroughfare;
  }
  return v7;
}

- (NSArray)areasOfInterest
{
  v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    v4 = [(RTAddress *)self geoAddressObject];
    v5 = [v4 address];
    v6 = [v5 structuredAddress];

    v7 = [v6 areaOfInterests];
  }
  else
  {
    v7 = self->_areasOfInterest;
  }
  return v7;
}

- (NSString)subLocality
{
  v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    v4 = [(RTAddress *)self geoAddressObject];
    v5 = [v4 address];
    v6 = [v5 structuredAddress];

    v7 = [v6 subLocality];
  }
  else
  {
    v7 = self->_subLocality;
  }
  return v7;
}

- (NSString)subAdministrativeArea
{
  v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    v4 = [(RTAddress *)self geoAddressObject];
    v5 = [v4 address];
    v6 = [v5 structuredAddress];

    v7 = [v6 subAdministrativeArea];
  }
  else
  {
    v7 = self->_subAdministrativeArea;
  }
  return v7;
}

- (NSString)inlandWater
{
  v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    v4 = [(RTAddress *)self geoAddressObject];
    v5 = [v4 address];
    v6 = [v5 structuredAddress];

    v7 = [v6 inlandWater];
  }
  else
  {
    v7 = self->_inlandWater;
  }
  return v7;
}

- (NSString)ocean
{
  v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    v4 = [(RTAddress *)self geoAddressObject];
    v5 = [v4 address];
    v6 = [v5 structuredAddress];

    v7 = [v6 ocean];
  }
  else
  {
    v7 = self->_ocean;
  }
  return v7;
}

- (RTAddress)initWithIdentifier:(id)a3 geoAddressObject:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 iso3166CountryCode:(id)a9 iso3166SubdivisionCode:(id)a10
{
  BOOL v12 = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (!v16)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v31 = 0;
    v25 = "Invalid parameter not satisfying: identifier";
    v26 = (uint8_t *)&v31;
LABEL_12:
    _os_log_error_impl(&dword_1A8FEF000, v24, OS_LOG_TYPE_ERROR, v25, v26, 2u);
    goto LABEL_13;
  }
  if (!v19)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v30 = 0;
    v25 = "Invalid parameter not satisfying: creationDate";
    v26 = (uint8_t *)&v30;
    goto LABEL_12;
  }
  if (!v20)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: expirationDate";
      v26 = buf;
      goto LABEL_12;
    }
LABEL_13:

    v27 = 0;
    goto LABEL_16;
  }
  if (v17)
  {
    v23 = [(id)objc_opt_class() _encodeGeoAddressObject:v17 compress:1];
  }
  else
  {
    v23 = 0;
  }
  self = [(RTAddress *)self initWithIdentifier:v16 geoAddressData:v23 subPremises:v18 isIsland:v12 creationDate:v19 expirationDate:v20 iso3166CountryCode:v21 iso3166SubdivisionCode:v22];

  v27 = self;
LABEL_16:

  return v27;
}

+ (id)_encodeGeoAddressObject:(id)a3 compress:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initRequiringSecureCoding:1];
  [v7 encodeObject:v6 forKey:@"geoAddress"];

  [v7 finishEncoding];
  if (v6)
  {
    v8 = [v7 encodedData];
    id v6 = v8;
    if (v4)
    {
      uint64_t v9 = [v8 compressedDataUsingAlgorithm:3 error:0];

      id v6 = (id)v9;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_geoAddressData forKey:@"geoAddressData"];
  [v5 encodeObject:self->_subPremises forKey:@"subPremises"];
  [v5 encodeObject:self->_subThoroughfare forKey:@"subThoroughfare"];
  [v5 encodeObject:self->_thoroughfare forKey:@"thoroughfare"];
  [v5 encodeObject:self->_subLocality forKey:@"subLocality"];
  [v5 encodeObject:self->_locality forKey:@"locality"];
  [v5 encodeObject:self->_subAdministrativeArea forKey:@"subAdministrativeArea"];
  [v5 encodeObject:self->_administrativeArea forKey:@"administrativeArea"];
  [v5 encodeObject:self->_administrativeAreaCode forKey:@"administrativeAreaCode"];
  [v5 encodeObject:self->_postalCode forKey:@"postalCode"];
  [v5 encodeObject:self->_country forKey:@"country"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_inlandWater forKey:@"inlandWater"];
  [v5 encodeObject:self->_ocean forKey:@"ocean"];
  [v5 encodeObject:self->_areasOfInterest forKey:@"areasOfInterest"];
  [v5 encodeBool:self->_isIsland forKey:@"isIsland"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeObject:self->_iso3166CountryCode forKey:@"iso3166CountryCode"];
  [v5 encodeObject:self->_iso3166SubdivisionCode forKey:@"iso3166SubdivisionCode"];
}

- (RTAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 iso3166CountryCode:(id)a9 iso3166SubdivisionCode:(id)a10
{
  LOBYTE(v11) = a6;
  return -[RTAddress initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           MEMORY[0x1E4F1CBF0],
           v11,
           a7,
           a8,
           a9,
           a10);
}

- (RTAddress)initWithCoder:(id)a3
{
  id v3 = a3;
  __int16 v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v29 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"geoAddressData"];
  BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v33 = [v3 decodeObjectOfClasses:v6 forKey:@"subPremises"];

  v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"subThoroughfare"];
  __int16 v31 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"thoroughfare"];
  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"subLocality"];
  v28 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"locality"];
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"subAdministrativeArea"];
  id v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"administrativeArea"];
  v27 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"administrativeAreaCode"];
  id v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"postalCode"];
  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"country"];
  id v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
  id v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"inlandWater"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ocean"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  id v17 = [v3 decodeObjectOfClasses:v10 forKey:@"areasOfInterest"];

  LOBYTE(v10) = [v3 decodeBoolForKey:@"isIsland"];
  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  BOOL v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"iso3166CountryCode"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"iso3166SubdivisionCode"];

  LOBYTE(v16) = (_BYTE)v10;
  v26 = -[RTAddress initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v30, v29, v33, v32, v31, v24, v28, v23, v22, v27, v19, v21, v20, v18, v7,
          v17,
          v16,
          v11,
          v12,
          v13,
          v14);

  return v26;
}

- (RTAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 subThoroughfare:(id)a6 thoroughfare:(id)a7 subLocality:(id)a8 locality:(id)a9 subAdministrativeArea:(id)a10 administrativeArea:(id)a11 administrativeAreaCode:(id)a12 postalCode:(id)a13 country:(id)a14 countryCode:(id)a15 inlandWater:(id)a16 ocean:(id)a17 areasOfInterest:(id)a18 isIsland:(BOOL)a19 creationDate:(id)a20 expirationDate:(id)a21 iso3166CountryCode:(id)a22 iso3166SubdivisionCode:(id)a23
{
  id v69 = a3;
  id v68 = a4;
  id v67 = a5;
  id v66 = a6;
  id v65 = a7;
  id v64 = a8;
  id v63 = a9;
  id v62 = a10;
  id v61 = a11;
  id v77 = a12;
  id v76 = a13;
  id v75 = a14;
  id v74 = a15;
  id v73 = a16;
  id v72 = a17;
  id v78 = a18;
  id v28 = a20;
  id v79 = a21;
  id v70 = a22;
  v71 = v28;
  id v60 = a23;
  if (!v69)
  {
    v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v47 = 0;
LABEL_19:
      v50 = v67;
      v49 = v68;
      v52 = v65;
      v51 = v66;
      v53 = v63;
      v56 = v64;
      v55 = v61;
      v54 = v62;
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: identifier";
LABEL_22:
    _os_log_error_impl(&dword_1A8FEF000, v45, OS_LOG_TYPE_ERROR, v46, buf, 2u);
    goto LABEL_11;
  }
  if (!v28)
  {
    v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: creationDate";
    goto LABEL_22;
  }
  if (v79)
  {
    v81.receiver = self;
    v81.super_class = (Class)RTAddress;
    v29 = [(RTAddress *)&v81 init];
    __int16 v30 = v29;
    if (!v29)
    {
LABEL_18:
      v47 = v30;
      self = v47;
      goto LABEL_19;
    }
    objc_storeStrong((id *)&v29->_identifier, a3);
    objc_storeStrong((id *)&v30->_geoAddressData, a4);
    localGeoAddressObject = v30->_localGeoAddressObject;
    v30->_localGeoAddressObject = 0;

    objc_storeStrong((id *)&v30->_subPremises, a5);
    if (v30->_geoAddressData)
    {
      subThoroughfare = v30->_subThoroughfare;
      v30->_subThoroughfare = 0;

      thoroughfare = v30->_thoroughfare;
      v30->_thoroughfare = 0;

      subLocality = v30->_subLocality;
      v30->_subLocality = 0;

      locality = v30->_locality;
      v30->_locality = 0;

      subAdministrativeArea = v30->_subAdministrativeArea;
      v30->_subAdministrativeArea = 0;

      administrativeArea = v30->_administrativeArea;
      v30->_administrativeArea = 0;

      administrativeAreaCode = v30->_administrativeAreaCode;
      v30->_administrativeAreaCode = 0;

      postalCode = v30->_postalCode;
      v30->_postalCode = 0;

      country = v30->_country;
      v30->_country = 0;

      countryCode = v30->_countryCode;
      v30->_countryCode = 0;

      inlandWater = v30->_inlandWater;
      v30->_inlandWater = 0;

      ocean = v30->_ocean;
      v30->_ocean = 0;
    }
    else
    {
      objc_storeStrong((id *)&v30->_subThoroughfare, a6);
      objc_storeStrong((id *)&v30->_thoroughfare, a7);
      objc_storeStrong((id *)&v30->_subLocality, a8);
      objc_storeStrong((id *)&v30->_locality, a9);
      objc_storeStrong((id *)&v30->_subAdministrativeArea, a10);
      objc_storeStrong((id *)&v30->_administrativeArea, a11);
      objc_storeStrong((id *)&v30->_administrativeAreaCode, a12);
      objc_storeStrong((id *)&v30->_postalCode, a13);
      objc_storeStrong((id *)&v30->_country, a14);
      objc_storeStrong((id *)&v30->_countryCode, a15);
      objc_storeStrong((id *)&v30->_inlandWater, a16);
      objc_storeStrong((id *)&v30->_ocean, a17);
      if ([v78 count])
      {
        uint64_t v57 = [v78 copy];
        areasOfInterest = v30->_areasOfInterest;
        v30->_areasOfInterest = (NSArray *)v57;
        goto LABEL_17;
      }
    }
    areasOfInterest = v30->_areasOfInterest;
    v30->_areasOfInterest = 0;
LABEL_17:

    v30->_isIsland = a19;
    objc_storeStrong((id *)&v30->_creationDate, a20);
    objc_storeStrong((id *)&v30->_expirationDate, a21);
    objc_storeStrong((id *)&v30->_iso3166CountryCode, a22);
    objc_storeStrong((id *)&v30->_iso3166SubdivisionCode, a23);
    goto LABEL_18;
  }
  v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v50 = v67;
  v49 = v68;
  v52 = v65;
  v51 = v66;
  v54 = v62;
  v53 = v63;
  v55 = v61;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A8FEF000, v48, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate", buf, 2u);
  }

  v47 = 0;
  v56 = v64;
LABEL_20:

  return v47;
}

- (NSString)countryCode
{
  id v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    BOOL v4 = [(RTAddress *)self geoAddressObject];
    uint64_t v5 = [v4 address];
    id v6 = [v5 structuredAddress];

    v7 = [v6 countryCode];
  }
  else
  {
    v7 = self->_countryCode;
  }
  return v7;
}

- (NSString)locality
{
  id v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    BOOL v4 = [(RTAddress *)self geoAddressObject];
    uint64_t v5 = [v4 address];
    id v6 = [v5 structuredAddress];

    v7 = [v6 locality];
  }
  else
  {
    v7 = self->_locality;
  }
  return v7;
}

- (NSString)thoroughfare
{
  id v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    BOOL v4 = [(RTAddress *)self geoAddressObject];
    uint64_t v5 = [v4 address];
    id v6 = [v5 structuredAddress];

    v7 = [v6 thoroughfare];
  }
  else
  {
    v7 = self->_thoroughfare;
  }
  return v7;
}

- (id)geoAddressObject
{
  localGeoAddressObject = self->_localGeoAddressObject;
  if (!localGeoAddressObject)
  {
    if (self->_geoAddressData)
    {
      BOOL v4 = [(id)objc_opt_class() _decodeGeoAddressObjectFromData:self->_geoAddressData decompress:1];
      uint64_t v5 = self->_localGeoAddressObject;
      self->_localGeoAddressObject = v4;
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x1E4F643C0]);
      uint64_t v5 = [(id)objc_opt_class() _mergedThoroughfareWithSubPremises:self->_subPremises subThoroughfare:self->_subThoroughfare thoroughfare:self->_thoroughfare];
      v7 = (GEOAddressObject *)[v6 initWithCurrentLocaleFullThoroughfare:v5 subLocality:self->_subLocality locality:self->_locality subAdministrativeArea:self->_subAdministrativeArea administrativeArea:self->_administrativeArea postalCode:self->_postalCode country:self->_country countryCode:self->_countryCode];
      v8 = self->_localGeoAddressObject;
      self->_localGeoAddressObject = v7;
    }
    localGeoAddressObject = self->_localGeoAddressObject;
  }
  return localGeoAddressObject;
}

- (NSData)geoAddressData
{
  return self->_geoAddressData;
}

+ (id)_decodeGeoAddressObjectFromData:(id)a3 decompress:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v8 = v7;
    if (v4)
    {
      uint64_t v9 = [v7 decompressedDataUsingAlgorithm:3 error:0];

      v8 = (void *)v9;
    }
    id v15 = 0;
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:&v15];
    id v11 = v15;
    if (v11)
    {
      BOOL v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_error_impl(&dword_1A8FEF000, v12, OS_LOG_TYPE_ERROR, "error decoding geoAddressData, %@", buf, 0xCu);
      }

      v13 = 0;
    }
    else
    {
      v13 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"geoAddress"];
      [v10 finishDecoding];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_iso3166SubdivisionCode, 0);
  objc_storeStrong((id *)&self->_iso3166CountryCode, 0);
  objc_storeStrong((id *)&self->_subPremises, 0);
  objc_storeStrong((id *)&self->_geoAddressData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_areasOfInterest, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_localGeoAddressObject, 0);
}

- (NSString)country
{
  id v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    BOOL v4 = [(RTAddress *)self geoAddressObject];
    id v5 = [v4 address];
    id v6 = [v5 structuredAddress];

    id v7 = [v6 country];
  }
  else
  {
    id v7 = self->_country;
  }
  return v7;
}

- (RTAddress)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_geoAddressData_subPremises_subThoroughfare_thoroughfare_subLocality_locality_subAdministrativeArea_administrativeArea_administrativeAreaCode_postalCode_country_countryCode_inlandWater_ocean_areasOfInterest_isIsland_creationDate_expirationDate_iso3166CountryCode_iso3166SubdivisionCode_);
}

- (RTAddress)initWithGeoDictionary:(id)a3 language:(id)a4 country:(id)a5 phoneticLocale:(id)a6
{
  v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v10 date];
  uint64_t v16 = [v15 dateByAddingTimeInterval:4838400.0];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F643C0]) initWithContactAddressDictionary:v14 language:v13 country:v12 phoneticLocale:v11];

  uint64_t v18 = [MEMORY[0x1E4F29128] UUID];
  id v19 = [(RTAddress *)self initWithIdentifier:v18 geoAddressObject:v17 subPremises:0 isIsland:0 creationDate:v15 expirationDate:v16 iso3166CountryCode:0 iso3166SubdivisionCode:0];

  return v19;
}

- (id)description
{
  id v3 = NSString;
  if (self->_geoAddressData)
  {
    BOOL v4 = [(RTAddress *)self geoAddressObject];
    id v5 = [v4 fullAddressWithMultiline:0];
    id v6 = [v3 stringWithFormat:@"%@ (%@, %@, GEOAddressObject)", v5, self->_iso3166SubdivisionCode, self->_iso3166CountryCode];
  }
  else
  {
    BOOL v4 = [(RTAddress *)self mergedThoroughfare];
    id v6 = [v3 stringWithFormat:@"%@ %@, %@ %@ %@ (%@, %@, legacy)", v4, self->_locality, self->_administrativeArea, self->_postalCode, self->_country, self->_iso3166SubdivisionCode, self->_iso3166CountryCode];
  }

  return v6;
}

- (NSString)administrativeAreaCode
{
  id v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    BOOL v4 = [(RTAddress *)self geoAddressObject];
    id v5 = [v4 address];
    id v6 = [v5 structuredAddress];

    id v7 = [v6 administrativeAreaCode];
  }
  else
  {
    id v7 = self->_administrativeAreaCode;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOBYTE(v6) = self->_isIsland;
  return (id)objc_msgSend(v4, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", self->_identifier, self->_geoAddressData, self->_subPremises, self->_subThoroughfare, self->_thoroughfare, self->_subLocality, self->_locality, self->_subAdministrativeArea, self->_administrativeArea, self->_administrativeAreaCode, self->_postalCode, self->_country, self->_countryCode, self->_inlandWater, self->_ocean,
               self->_areasOfInterest,
               v6,
               self->_creationDate,
               self->_expirationDate,
               self->_iso3166CountryCode,
               self->_iso3166SubdivisionCode);
}

- (BOOL)isEqualToAddress:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  identifier = self->_identifier;
  v188 = identifier;
  if (!identifier)
  {
    v169 = [v4 identifier];
    if (!v169)
    {
      v169 = 0;
      int v189 = 0;
      uint64_t v186 = 0;
      memset(v187, 0, sizeof(v187));
      int v177 = 0;
      uint64_t v185 = 0;
      int v8 = 0;
      uint64_t v184 = 0;
      uint64_t v183 = 0;
      uint64_t v182 = 0;
      long long v175 = 0uLL;
      int v9 = 0;
      int v10 = 0;
      memset(v181, 0, sizeof(v181));
      int v11 = 0;
      int v12 = 0;
      uint64_t v180 = 0;
      int v13 = 0;
      uint64_t v179 = 0;
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v174 = 0;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      goto LABEL_13;
    }
    identifier = self->_identifier;
  }
  v173 = [v5 identifier];
  if (-[NSUUID isEqual:](identifier, "isEqual:"))
  {
    uint64_t v186 = 0;
    memset(v187, 0, sizeof(v187));
    int v177 = 0;
    uint64_t v185 = 0;
    int v8 = 0;
    uint64_t v184 = 0;
    uint64_t v183 = 0;
    uint64_t v182 = 0;
    long long v175 = 0uLL;
    int v9 = 0;
    int v10 = 0;
    memset(v181, 0, sizeof(v181));
    int v11 = 0;
    int v12 = 0;
    uint64_t v180 = 0;
    int v13 = 0;
    uint64_t v179 = 0;
    int v14 = 0;
    uint64_t v178 = 0;
    int v15 = 0;
    int v174 = 0;
    int v16 = 0;
    BOOL v17 = 0;
    int v18 = 0;
    int v189 = 1;
LABEL_13:
    BOOL v176 = 1;
    goto LABEL_14;
  }
  subPremises = self->_subPremises;
  *(_DWORD *)&v187[8] = subPremises == 0;
  if (!subPremises)
  {
    uint64_t v20 = [v5 subPremises];
    if (!v20)
    {
      v172 = 0;
      int v21 = 0;
      goto LABEL_115;
    }
    v172 = (void *)v20;
    subPremises = self->_subPremises;
  }
  v168 = [v5 subPremises];
  if (!-[NSArray isEqual:](subPremises, "isEqual:"))
  {
    int v189 = 1;
    *(void *)v187 = 0;
    int v177 = 0;
    uint64_t v185 = 0;
    int v8 = 0;
    uint64_t v184 = 0;
    uint64_t v183 = 0;
    uint64_t v182 = 0;
    long long v175 = 0uLL;
    int v9 = 0;
    int v10 = 0;
    memset(v181, 0, sizeof(v181));
    int v11 = 0;
    int v12 = 0;
    uint64_t v180 = 0;
    int v13 = 0;
    uint64_t v179 = 0;
    int v14 = 0;
    uint64_t v178 = 0;
    int v15 = 0;
    int v174 = 0;
    int v16 = 0;
    BOOL v17 = 0;
    int v18 = 0;
    BOOL v176 = 0;
    uint64_t v186 = 1;
    goto LABEL_14;
  }
  int v21 = 1;
LABEL_115:
  geoAddressData = self->_geoAddressData;
  *(_DWORD *)&v187[4] = geoAddressData != 0;
  LODWORD(v186) = v21;
  if (geoAddressData)
  {
    uint64_t v35 = [v5 geoAddressData];
    if (v35)
    {
      v162 = (void *)v35;
      v36 = self->_geoAddressData;
      v155 = [v5 geoAddressData];
      char v37 = -[NSData isEqual:](v36, "isEqual:");
      int v38 = 1;
      if (v37)
      {
        HIDWORD(v186) = 0;
        *(_DWORD *)v187 = 1;
        uint64_t v185 = 0;
        uint64_t v184 = 0;
        uint64_t v183 = 0;
        uint64_t v182 = 0;
        memset(v181, 0, sizeof(v181));
        uint64_t v180 = 0;
        uint64_t v179 = 0;
        uint64_t v178 = 0;
        int v174 = 0;
        int v39 = 0;
        BOOL v171 = 0;
        int v84 = 0;
        goto LABEL_119;
      }
    }
    else
    {
      v162 = 0;
      int v38 = 0;
    }
  }
  else
  {
    int v38 = 0;
  }
  v167 = [(RTAddress *)self subThoroughfare];
  HIDWORD(v186) = v167 == 0;
  *(_DWORD *)v187 = v38;
  if (v167 || ([v5 subThoroughfare], (v160 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v166 = [(RTAddress *)self subThoroughfare];
    v41 = [v166 lowercaseString];
    v164 = [v5 subThoroughfare];
    [v164 lowercaseString];
    v163 = v165 = v41;
    if (!objc_msgSend(v41, "isEqual:"))
    {
      int v189 = 1;
      int v8 = 0;
      uint64_t v184 = 0;
      uint64_t v183 = 0;
      uint64_t v182 = 0;
      long long v175 = 0uLL;
      int v9 = 0;
      int v10 = 0;
      memset(v181, 0, sizeof(v181));
      int v11 = 0;
      int v12 = 0;
      uint64_t v180 = 0;
      int v13 = 0;
      uint64_t v179 = 0;
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v174 = 0;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      uint64_t v185 = 1;
      goto LABEL_14;
    }
    uint64_t v42 = 1;
  }
  else
  {
    v160 = 0;
    uint64_t v42 = 0;
  }
  uint64_t v43 = [(RTAddress *)self thoroughfare];
  HIDWORD(v185) = v43 == 0;
  v161 = (void *)v43;
  LODWORD(v185) = v42;
  if (v43 || ([v5 thoroughfare], (v153 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v159 = [(RTAddress *)self thoroughfare];
    v44 = [v159 lowercaseString];
    v157 = [v5 thoroughfare];
    [v157 lowercaseString];
    v156 = v158 = v44;
    if (!objc_msgSend(v44, "isEqual:"))
    {
      int v189 = 1;
      uint64_t v184 = 0;
      uint64_t v183 = 0;
      uint64_t v182 = 0;
      long long v175 = 0uLL;
      int v9 = 0;
      int v10 = 0;
      memset(v181, 0, 36);
      int v11 = 0;
      int v12 = 0;
      uint64_t v180 = 0;
      int v13 = 0;
      uint64_t v179 = 0;
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v174 = 0;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      int v8 = 1;
      HIDWORD(v181[4]) = 1;
      goto LABEL_14;
    }
    HIDWORD(v181[4]) = 1;
  }
  else
  {
    v153 = 0;
    HIDWORD(v181[4]) = 0;
  }
  uint64_t v45 = [(RTAddress *)self mergedThoroughfare];
  HIDWORD(v184) = v45 == 0;
  v154 = (void *)v45;
  if (v45 || ([v5 mergedThoroughfare], (v146 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v152 = [(RTAddress *)self mergedThoroughfare];
    v46 = [v152 lowercaseString];
    v150 = [v5 mergedThoroughfare];
    [v150 lowercaseString];
    v149 = v151 = v46;
    if (!objc_msgSend(v46, "isEqual:"))
    {
      int v189 = 1;
      *(void *)((char *)&v175 + 4) = 0;
      uint64_t v183 = 0;
      uint64_t v182 = 0;
      int v174 = 0;
      LODWORD(v175) = 0;
      int v9 = 0;
      int v10 = 0;
      memset(v181, 0, 36);
      int v11 = 0;
      int v12 = 0;
      uint64_t v180 = 0;
      int v13 = 0;
      uint64_t v179 = 0;
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      int v8 = 1;
      HIDWORD(v175) = 1;
      LODWORD(v184) = 1;
      goto LABEL_14;
    }
    LODWORD(v184) = 1;
  }
  else
  {
    v146 = 0;
    LODWORD(v184) = 0;
  }
  uint64_t v47 = [(RTAddress *)self subLocality];
  HIDWORD(v183) = v47 == 0;
  v148 = (void *)v47;
  if (v47 || ([v5 subLocality], (v141 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v145 = [(RTAddress *)self subLocality];
    uint64_t v48 = [v145 lowercaseString];
    v143 = [v5 subLocality];
    uint64_t v49 = [v143 lowercaseString];
    v144 = (void *)v48;
    v50 = (void *)v48;
    uint64_t v42 = v49;
    int v189 = 1;
    if (![v50 isEqual:v49])
    {
      v147 = (void *)v42;
      *(void *)&long long v175 = 0;
      LODWORD(v183) = 0;
      uint64_t v182 = 0x100000000;
      int v9 = 0;
      int v10 = 0;
      memset(v181, 0, 36);
      int v11 = 0;
      int v12 = 0;
      uint64_t v180 = 0;
      int v13 = 0;
      uint64_t v179 = 0;
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v174 = 0;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      int v8 = 1;
      *((void *)&v175 + 1) = 0x100000001;
      goto LABEL_14;
    }
    HIDWORD(v182) = 1;
  }
  else
  {
    v141 = 0;
    HIDWORD(v182) = 0;
  }
  v142 = [(RTAddress *)self locality];
  LODWORD(v183) = v142 == 0;
  v147 = (void *)v42;
  if (v142 || ([v5 locality], (v135 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v140 = [(RTAddress *)self locality];
    uint64_t v42 = [v140 lowercaseString];
    v138 = [v5 locality];
    [v138 lowercaseString];
    v137 = v139 = (void *)v42;
    if (!objc_msgSend((id)v42, "isEqual:"))
    {
      int v189 = 1;
      int v174 = 0;
      *(void *)&long long v175 = 0x100000000;
      LODWORD(v182) = 0;
      int v9 = 0;
      int v10 = 0;
      memset(v181, 0, 32);
      int v11 = 0;
      int v12 = 0;
      uint64_t v180 = 0;
      int v13 = 0;
      uint64_t v179 = 0;
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      int v8 = 1;
      *((void *)&v175 + 1) = 0x100000001;
      LODWORD(v181[4]) = 1;
      goto LABEL_14;
    }
    LODWORD(v181[4]) = 1;
  }
  else
  {
    v135 = 0;
    LODWORD(v181[4]) = 0;
  }
  uint64_t v51 = [(RTAddress *)self subAdministrativeArea];
  LODWORD(v182) = v51 == 0;
  v136 = (void *)v51;
  if (v51 || ([v5 subAdministrativeArea], (v129 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v134 = [(RTAddress *)self subAdministrativeArea];
    uint64_t v52 = [v134 lowercaseString];
    v132 = [v5 subAdministrativeArea];
    uint64_t v53 = [v132 lowercaseString];
    v133 = (void *)v52;
    v54 = (void *)v52;
    uint64_t v42 = v53;
    int v189 = 1;
    v131 = (void *)v53;
    if (![v54 isEqual:v53])
    {
      int v9 = 0;
      int v10 = 0;
      memset(v181, 0, 24);
      int v11 = 0;
      int v12 = 0;
      uint64_t v180 = 0;
      int v13 = 0;
      uint64_t v179 = 0;
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v174 = 0;
      *(void *)&long long v175 = 0x100000001;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      int v8 = 1;
      *((void *)&v175 + 1) = 0x100000001;
      v181[3] = 1;
      goto LABEL_14;
    }
    LODWORD(v181[3]) = 1;
  }
  else
  {
    v129 = 0;
    LODWORD(v181[3]) = 0;
  }
  uint64_t v55 = [(RTAddress *)self administrativeArea];
  HIDWORD(v181[3]) = v55 == 0;
  v130 = (void *)v55;
  if (v55 || ([v5 administrativeArea], (v123 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v128 = [(RTAddress *)self administrativeArea];
    uint64_t v56 = [v128 lowercaseString];
    v126 = [v5 administrativeArea];
    uint64_t v57 = [v126 lowercaseString];
    v127 = (void *)v56;
    v58 = (void *)v56;
    uint64_t v42 = v57;
    int v189 = 1;
    v125 = (void *)v57;
    if (![v58 isEqual:v57])
    {
      int v10 = 0;
      v181[0] = 0;
      int v11 = 0;
      v181[1] = 0;
      int v12 = 0;
      uint64_t v180 = 0;
      int v13 = 0;
      uint64_t v179 = 0;
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v174 = 0;
      *(void *)&long long v175 = 0x100000001;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      int v8 = 1;
      *((void *)&v175 + 1) = 0x100000001;
      int v9 = 1;
      v181[2] = 1;
      goto LABEL_14;
    }
    LODWORD(v181[2]) = 1;
  }
  else
  {
    v123 = 0;
    LODWORD(v181[2]) = 0;
  }
  uint64_t v59 = [(RTAddress *)self administrativeAreaCode];
  HIDWORD(v181[2]) = v59 == 0;
  v124 = (void *)v59;
  if (v59 || ([v5 administrativeAreaCode], (v117 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v122 = [(RTAddress *)self administrativeAreaCode];
    uint64_t v60 = [v122 lowercaseString];
    v120 = [v5 administrativeAreaCode];
    uint64_t v61 = [v120 lowercaseString];
    v121 = (void *)v60;
    id v62 = (void *)v60;
    uint64_t v42 = v61;
    int v189 = 1;
    v119 = (void *)v61;
    if (![v62 isEqual:v61])
    {
      int v11 = 0;
      v181[1] = 0;
      int v12 = 0;
      uint64_t v180 = 0;
      int v13 = 0;
      uint64_t v179 = 0;
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v174 = 0;
      *(void *)&long long v175 = 0x100000001;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      int v8 = 1;
      *((void *)&v175 + 1) = 0x100000001;
      int v9 = 1;
      int v10 = 1;
      v181[0] = 1;
      goto LABEL_14;
    }
    LODWORD(v181[0]) = 1;
  }
  else
  {
    v117 = 0;
    LODWORD(v181[0]) = 0;
  }
  uint64_t v63 = [(RTAddress *)self postalCode];
  HIDWORD(v181[1]) = v63 == 0;
  v118 = (void *)v63;
  if (v63 || ([v5 postalCode], (v111 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v116 = [(RTAddress *)self postalCode];
    uint64_t v64 = [v116 lowercaseString];
    v114 = [v5 postalCode];
    uint64_t v65 = [v114 lowercaseString];
    v115 = (void *)v64;
    id v66 = (void *)v64;
    uint64_t v42 = v65;
    int v189 = 1;
    v113 = (void *)v65;
    if (![v66 isEqual:v65])
    {
      int v12 = 0;
      uint64_t v180 = 0;
      int v13 = 0;
      uint64_t v179 = 0;
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v174 = 0;
      *(void *)&long long v175 = 0x100000001;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      int v8 = 1;
      *((void *)&v175 + 1) = 0x100000001;
      int v9 = 1;
      int v10 = 1;
      int v11 = 1;
      *(void *)((char *)v181 + 4) = 1;
      goto LABEL_14;
    }
    HIDWORD(v181[0]) = 1;
  }
  else
  {
    v111 = 0;
    HIDWORD(v181[0]) = 0;
  }
  uint64_t v67 = [(RTAddress *)self country];
  LODWORD(v181[1]) = v67 == 0;
  v112 = (void *)v67;
  if (v67 || ([v5 country], (v105 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v110 = [(RTAddress *)self country];
    uint64_t v68 = [v110 lowercaseString];
    v108 = [v5 country];
    uint64_t v69 = [v108 lowercaseString];
    v109 = (void *)v68;
    id v70 = (void *)v68;
    uint64_t v42 = v69;
    int v189 = 1;
    v107 = (void *)v69;
    if (![v70 isEqual:v69])
    {
      int v13 = 0;
      uint64_t v179 = 0;
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v174 = 0;
      *(void *)&long long v175 = 0x100000001;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      int v8 = 1;
      *((void *)&v175 + 1) = 0x100000001;
      int v9 = 1;
      int v10 = 1;
      int v11 = 1;
      int v12 = 1;
      uint64_t v180 = 1;
      goto LABEL_14;
    }
    LODWORD(v180) = 1;
  }
  else
  {
    v105 = 0;
    LODWORD(v180) = 0;
  }
  uint64_t v71 = [(RTAddress *)self countryCode];
  HIDWORD(v180) = v71 == 0;
  v106 = (void *)v71;
  if (v71 || ([v5 countryCode], (v98 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v104 = [(RTAddress *)self countryCode];
    uint64_t v72 = [v104 lowercaseString];
    v102 = [v5 countryCode];
    uint64_t v73 = [v102 lowercaseString];
    v103 = (void *)v72;
    id v74 = (void *)v72;
    uint64_t v42 = v73;
    int v189 = 1;
    v101 = (void *)v73;
    if (![v74 isEqual:v73])
    {
      int v14 = 0;
      uint64_t v178 = 0;
      int v15 = 0;
      int v174 = 0;
      *(void *)&long long v175 = 0x100000001;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      int v8 = 1;
      *((void *)&v175 + 1) = 0x100000001;
      int v9 = 1;
      int v10 = 1;
      int v11 = 1;
      int v12 = 1;
      int v13 = 1;
      uint64_t v179 = 1;
      goto LABEL_14;
    }
    LODWORD(v179) = 1;
  }
  else
  {
    v98 = 0;
    LODWORD(v179) = 0;
  }
  uint64_t v75 = [(RTAddress *)self inlandWater];
  HIDWORD(v179) = v75 == 0;
  v100 = (void *)v75;
  if (v75 || ([v5 inlandWater], (v93 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v97 = [(RTAddress *)self inlandWater];
    uint64_t v76 = [v97 lowercaseString];
    v95 = [v5 inlandWater];
    uint64_t v77 = [v95 lowercaseString];
    v96 = (void *)v76;
    id v78 = (void *)v76;
    uint64_t v42 = v77;
    int v189 = 1;
    if (![v78 isEqual:v77])
    {
      v99 = (void *)v42;
      int v15 = 0;
      int v174 = 0;
      *(void *)&long long v175 = 0x100000001;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v176 = 0;
      int v177 = 1;
      int v8 = 1;
      *((void *)&v175 + 1) = 0x100000001;
      int v9 = 1;
      int v10 = 1;
      int v11 = 1;
      int v12 = 1;
      int v13 = 1;
      int v14 = 1;
      uint64_t v178 = 1;
      goto LABEL_14;
    }
    LODWORD(v178) = 1;
  }
  else
  {
    v93 = 0;
    LODWORD(v178) = 0;
  }
  v99 = (void *)v42;
  uint64_t v79 = [(RTAddress *)self ocean];
  HIDWORD(v178) = v79 == 0;
  v94 = (void *)v79;
  if (!v79)
  {
    v87 = [v5 ocean];
    if (!v87)
    {
      v87 = 0;
      int v174 = 0;
      goto LABEL_201;
    }
  }
  v92 = [(RTAddress *)self ocean];
  v80 = [v92 lowercaseString];
  v90 = [v5 ocean];
  [v90 lowercaseString];
  v89 = v91 = v80;
  int v189 = 1;
  if (objc_msgSend(v80, "isEqual:"))
  {
    int v174 = 1;
LABEL_201:
    uint64_t v81 = [(RTAddress *)self areasOfInterest];
    BOOL v171 = v81 == 0;
    v88 = (void *)v81;
    if (v81 || ([v5 areasOfInterest], (v85 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v82 = [(RTAddress *)self areasOfInterest];
      [v5 areasOfInterest];
      uint64_t v83 = v86 = v82;
      int v189 = 1;
      if (!objc_msgSend(v82, "isEqualToArray:"))
      {
        BOOL v176 = 0;
        int v177 = 1;
        int v8 = 1;
        *((void *)&v175 + 1) = 0x100000001;
        *(void *)&long long v175 = 0x100000001;
        int v9 = 1;
        int v10 = 1;
        int v11 = 1;
        int v12 = 1;
        int v13 = 1;
        int v14 = 1;
        int v15 = 1;
        int v16 = 1;
        int v18 = 1;
        BOOL v17 = v171;
        goto LABEL_120;
      }
      int v84 = 1;
      int v39 = 1;
    }
    else
    {
      v88 = 0;
      v85 = 0;
      int v84 = 0;
      int v39 = 1;
      BOOL v171 = 1;
    }
LABEL_119:
    int v16 = v39;
    int isIsland = self->_isIsland;
    HIDWORD(v175) = v39;
    BOOL v176 = isIsland == [v5 isIsland];
    int v189 = 1;
    int v8 = v16;
    DWORD1(v175) = v16;
    DWORD2(v175) = v16;
    LODWORD(v175) = v16;
    int v9 = v16;
    int v10 = v16;
    int v11 = v16;
    int v12 = v16;
    int v13 = v16;
    int v14 = v16;
    int v15 = v16;
    int v177 = v16;
    BOOL v17 = v171;
    int v18 = v84;
LABEL_120:
    id v7 = (void *)v83;
    goto LABEL_14;
  }
  int v16 = 0;
  BOOL v17 = 0;
  int v18 = 0;
  BOOL v176 = 0;
  int v177 = 1;
  int v8 = 1;
  *((void *)&v175 + 1) = 0x100000001;
  *(void *)&long long v175 = 0x100000001;
  int v9 = 1;
  int v10 = 1;
  int v11 = 1;
  int v12 = 1;
  int v13 = 1;
  int v14 = 1;
  int v15 = 1;
  int v174 = 1;
LABEL_14:
  if (v18)
  {
    v170 = v5;
    int v23 = v12;
    int v24 = v13;
    int v25 = v11;
    int v26 = v14;
    int v27 = v10;
    int v28 = v15;
    int v29 = v9;
    int v30 = v16;
    int v31 = v8;
    BOOL v32 = v17;

    BOOL v33 = v32;
    int v8 = v31;
    int v16 = v30;
    int v9 = v29;
    int v15 = v28;
    int v10 = v27;
    int v14 = v26;
    int v11 = v25;
    int v13 = v24;
    int v12 = v23;
    id v5 = v170;
    if (!v33)
    {
LABEL_16:
      if (!v16) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if (!v17)
  {
    goto LABEL_16;
  }

  if (v16) {
LABEL_17:
  }

LABEL_18:
  if (v174)
  {
  }
  if (HIDWORD(v178)) {

  }
  if (v15) {
  if (v178)
  }
  {
  }
  if (HIDWORD(v179)) {

  }
  if (v14) {
  if (v179)
  }
  {
  }
  if (HIDWORD(v180)) {

  }
  if (v13) {
  if (v180)
  }
  {
  }
  if (LODWORD(v181[1])) {

  }
  if (v12) {
  if (HIDWORD(v181[0]))
  }
  {
  }
  if (HIDWORD(v181[1])) {

  }
  if (v11) {
  if (LODWORD(v181[0]))
  }
  {
  }
  if (HIDWORD(v181[2])) {

  }
  if (v10) {
  if (LODWORD(v181[2]))
  }
  {
  }
  if (HIDWORD(v181[3])) {

  }
  if (v9) {
  if (LODWORD(v181[3]))
  }
  {
  }
  if (v182) {

  }
  if (v175) {
  if (LODWORD(v181[4]))
  }
  {
  }
  if (v183) {

  }
  if (DWORD1(v175)) {
  if (HIDWORD(v182))
  }
  {
  }
  if (HIDWORD(v183)) {

  }
  if (DWORD2(v175)) {
  if (v184)
  }
  {
  }
  if (HIDWORD(v184)) {

  }
  if (HIDWORD(v175)) {
  if (HIDWORD(v181[4]))
  }
  {

    if (!HIDWORD(v185))
    {
LABEL_86:
      if (!v8) {
        goto LABEL_88;
      }
      goto LABEL_87;
    }
  }
  else if (!HIDWORD(v185))
  {
    goto LABEL_86;
  }

  if (v8) {
LABEL_87:
  }

LABEL_88:
  if (v185)
  {
  }
  if (HIDWORD(v186)) {

  }
  if (v177) {
  if (*(_DWORD *)v187)
  }
  {

    if (!*(_DWORD *)&v187[4])
    {
LABEL_96:
      if (!v186) {
        goto LABEL_98;
      }
      goto LABEL_97;
    }
  }
  else if (!*(_DWORD *)&v187[4])
  {
    goto LABEL_96;
  }

  if (v186) {
LABEL_97:
  }

LABEL_98:
  if (!*(_DWORD *)&v187[8])
  {
    if (!v189) {
      goto LABEL_100;
    }
LABEL_112:

    if (v188) {
      goto LABEL_101;
    }
LABEL_113:

    goto LABEL_101;
  }

  if (v189) {
    goto LABEL_112;
  }
LABEL_100:
  if (!v188) {
    goto LABEL_113;
  }
LABEL_101:

  return v176;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTAddress *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTAddress *)self isEqualToAddress:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  uint64_t v4 = [(NSData *)self->_geoAddressData hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_subPremises hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_subThoroughfare hash];
  NSUInteger v7 = [(NSString *)self->_thoroughfare hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_subLocality hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_locality hash];
  NSUInteger v10 = [(NSString *)self->_subAdministrativeArea hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_administrativeArea hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_administrativeAreaCode hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_postalCode hash];
  NSUInteger v14 = [(NSString *)self->_country hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_countryCode hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_inlandWater hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_ocean hash];
  uint64_t v18 = v13 ^ v17 ^ [(NSArray *)self->_areasOfInterest hash];
  id v19 = [NSNumber numberWithBool:self->_isIsland];
  uint64_t v20 = [v19 hash];
  NSUInteger v21 = v20 ^ [(NSString *)self->_iso3166CountryCode hash];
  NSUInteger v22 = v18 ^ v21 ^ [(NSString *)self->_iso3166SubdivisionCode hash];

  return v22;
}

+ (id)_mergedThoroughfareWithSubPremises:(id)a3 subThoroughfare:(id)a4 thoroughfare:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    [NSString stringWithFormat:@"%@ %@", v8, v9];
  }
  else
  {
    if (![v9 length])
    {
      NSUInteger v10 = 0;
      goto LABEL_8;
    }
    [NSString stringWithFormat:@"%@", v9, v15];
  NSUInteger v10 = };
LABEL_8:
  if ([v10 length] && objc_msgSend(v7, "count"))
  {
    NSUInteger v11 = NSString;
    NSUInteger v12 = [v7 componentsJoinedByString:@" "];
    id v13 = [v11 stringWithFormat:@"%@ %@", v10, v12];
  }
  else if (v10 && ![v7 count])
  {
    id v13 = v10;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (NSString)mergedThoroughfare
{
  uint64_t v3 = [(RTAddress *)self geoAddressData];

  if (v3)
  {
    uint64_t v4 = [(RTAddress *)self geoAddressObject];
    uint64_t v5 = [v4 address];
    NSUInteger v6 = [v5 structuredAddress];

    id v7 = [v6 fullThoroughfare];

    if (v7)
    {
      id v8 = [v6 fullThoroughfare];
      goto LABEL_6;
    }
  }
  id v9 = objc_opt_class();
  subPremises = self->_subPremises;
  NSUInteger v6 = [(RTAddress *)self subThoroughfare];
  NSUInteger v11 = [(RTAddress *)self thoroughfare];
  id v8 = [v9 _mergedThoroughfareWithSubPremises:subPremises subThoroughfare:v6 thoroughfare:v11];

LABEL_6:
  return (NSString *)v8;
}

- (id)geoDictionaryRepresentation
{
  uint64_t v2 = [(RTAddress *)self geoAddressObject];
  uint64_t v3 = [v2 addressDictionary];

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSArray)subPremises
{
  return self->_subPremises;
}

- (BOOL)isIsland
{
  return self->_isIsland;
}

- (NSString)iso3166CountryCode
{
  return self->_iso3166CountryCode;
}

- (NSString)iso3166SubdivisionCode
{
  return self->_iso3166SubdivisionCode;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

@end