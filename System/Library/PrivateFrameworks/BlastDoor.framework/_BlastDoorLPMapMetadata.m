@interface _BlastDoorLPMapMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPointOfInterest;
- (CLLocationCoordinate2D)location;
- (CNPostalAddress)addressComponents;
- (CNPostalAddress)directionsDestinationAddressComponents;
- (CNPostalAddress)directionsSourceAddressComponents;
- (NSNumber)distance;
- (NSNumber)transportType;
- (NSString)address;
- (NSString)category;
- (NSString)directionsDestinationAddress;
- (NSString)directionsDestinationLocationName;
- (NSString)directionsSourceAddress;
- (NSString)directionsSourceLocationName;
- (NSString)directionsType;
- (NSString)name;
- (NSString)searchQuery;
- (_BlastDoorLPImage)categoryIcon;
- (_BlastDoorLPImage)darkImage;
- (_BlastDoorLPImage)image;
- (_BlastDoorLPImage)storeFrontImage;
- (_BlastDoorLPMapMetadata)init;
- (_BlastDoorLPMapMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAddressComponents:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCategoryIcon:(id)a3;
- (void)setDarkImage:(id)a3;
- (void)setDirectionsDestinationAddress:(id)a3;
- (void)setDirectionsDestinationAddressComponents:(id)a3;
- (void)setDirectionsDestinationLocationName:(id)a3;
- (void)setDirectionsSourceAddress:(id)a3;
- (void)setDirectionsSourceAddressComponents:(id)a3;
- (void)setDirectionsSourceLocationName:(id)a3;
- (void)setDirectionsType:(id)a3;
- (void)setDistance:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsPointOfInterest:(BOOL)a3;
- (void)setLocation:(CLLocationCoordinate2D)a3;
- (void)setName:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setStoreFrontImage:(id)a3;
- (void)setTransportType:(id)a3;
@end

@implementation _BlastDoorLPMapMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPMapMetadata)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorLPMapMetadata;
  v2 = [(_BlastDoorLPMapMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_storeFrontImage = *MEMORY[0x1E4F1E750];
    v4 = v2;
  }

  return v3;
}

- (_BlastDoorLPMapMetadata)initWithCoder:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)_BlastDoorLPMapMetadata;
  v5 = [(_BlastDoorLPMapMetadata *)&v61 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    uint64_t v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    v8 = decodeNumberForKey(v4, @"locationLatitude");
    uint64_t v9 = decodeNumberForKey(v4, @"locationLongitude");
    v10 = (void *)v9;
    v11 = (CLLocationDegrees *)(v5 + 160);
    if (v8 && v9)
    {
      [v8 doubleValue];
      CLLocationDegrees v13 = v12;
      [v10 doubleValue];
      CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v13, v14);
      CLLocationDegrees *v11 = v15.latitude;
      *((void *)v5 + 21) = *(void *)&v15.longitude;
    }
    else
    {
      *(_OWORD *)v11 = *MEMORY[0x1E4F1E750];
    }
    uint64_t v16 = decodeStringForKey(v4, @"address");
    v17 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v20, @"addressComponents");
    v22 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v21;

    uint64_t v23 = decodeStringForKey(v4, @"category");
    v24 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v23;

    uint64_t v25 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"categoryIcon");
    v26 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v25;

    uint64_t v27 = decodeStringForKey(v4, @"searchQuery");
    v28 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v27;

    uint64_t v29 = decodeStringForKey(v4, @"directionsType");
    v30 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v29;

    uint64_t v31 = decodeNumberForKey(v4, @"transportType");
    v32 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v31;

    uint64_t v33 = decodeStringForKey(v4, @"directionsSourceAddress");
    v34 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v33;

    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    uint64_t v38 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v37, @"directionsSourceAddressComponents");
    v39 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v38;

    uint64_t v40 = decodeStringForKey(v4, @"directionsSourceLocationName");
    v41 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v40;

    uint64_t v42 = decodeStringForKey(v4, @"directionsDestinationAddress");
    v43 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v42;

    v44 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v45 = objc_opt_class();
    v46 = objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    uint64_t v47 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v46, @"directionsDestinationAddressComponents");
    v48 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v47;

    uint64_t v49 = decodeStringForKey(v4, @"directionsDestinationLocationName");
    v50 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v49;

    uint64_t v51 = decodeNumberForKey(v4, @"distance");
    v52 = (void *)*((void *)v5 + 16);
    *((void *)v5 + 16) = v51;

    uint64_t v53 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"image");
    v54 = (void *)*((void *)v5 + 17);
    *((void *)v5 + 17) = v53;

    uint64_t v55 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"darkImage");
    v56 = (void *)*((void *)v5 + 18);
    *((void *)v5 + 18) = v55;

    uint64_t v57 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"storeFront");
    v58 = (void *)*((void *)v5 + 19);
    *((void *)v5 + 19) = v57;

    v5[9] = [v4 decodeBoolForKey:@"isPointOfInterest"];
    v59 = v5;
  }
  return (_BlastDoorLPMapMetadata *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", *(void *)&self->_isPointOfInterest, @"name");
  if (CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&self->_storeFrontImage))
  {
    id v4 = [NSNumber numberWithDouble:*(double *)&self->_storeFrontImage];
    objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"locationLatitude");

    v5 = [NSNumber numberWithDouble:self->_location.latitude];
    objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v5, @"locationLongitude");
  }
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, @"address");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_address, @"addressComponents");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_addressComponents, @"category");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_category, @"categoryIcon");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_categoryIcon, @"searchQuery");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_searchQuery, @"directionsType");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsType, @"transportType");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_transportType, @"directionsSourceAddress");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsSourceAddress, @"directionsSourceAddressComponents");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsSourceAddressComponents, @"directionsSourceLocationName");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsSourceLocationName, @"directionsDestinationAddress");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsDestinationAddress, @"directionsDestinationAddressComponents");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsDestinationAddressComponents, @"directionsDestinationLocationName");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsDestinationLocationName, @"distance");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_distance, @"image");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_image, @"darkImage");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_darkImage, @"storeFront");
  [v6 encodeBool:*((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1) forKey:@"isPointOfInterest"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPMapMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(_BlastDoorLPMapMetadata *)self name];
    [(_BlastDoorLPMapMetadata *)v4 setName:v5];

    [(_BlastDoorLPMapMetadata *)self location];
    -[_BlastDoorLPMapMetadata setLocation:](v4, "setLocation:");
    id v6 = [(_BlastDoorLPMapMetadata *)self address];
    [(_BlastDoorLPMapMetadata *)v4 setAddress:v6];

    uint64_t v7 = [(_BlastDoorLPMapMetadata *)self addressComponents];
    [(_BlastDoorLPMapMetadata *)v4 setAddressComponents:v7];

    v8 = [(_BlastDoorLPMapMetadata *)self category];
    [(_BlastDoorLPMapMetadata *)v4 setCategory:v8];

    uint64_t v9 = [(_BlastDoorLPMapMetadata *)self categoryIcon];
    [(_BlastDoorLPMapMetadata *)v4 setCategoryIcon:v9];

    v10 = [(_BlastDoorLPMapMetadata *)self searchQuery];
    [(_BlastDoorLPMapMetadata *)v4 setSearchQuery:v10];

    v11 = [(_BlastDoorLPMapMetadata *)self directionsType];
    [(_BlastDoorLPMapMetadata *)v4 setDirectionsType:v11];

    double v12 = [(_BlastDoorLPMapMetadata *)self transportType];
    [(_BlastDoorLPMapMetadata *)v4 setTransportType:v12];

    CLLocationDegrees v13 = [(_BlastDoorLPMapMetadata *)self directionsSourceAddress];
    [(_BlastDoorLPMapMetadata *)v4 setDirectionsSourceAddress:v13];

    CLLocationDegrees v14 = [(_BlastDoorLPMapMetadata *)self directionsSourceAddressComponents];
    [(_BlastDoorLPMapMetadata *)v4 setDirectionsSourceAddressComponents:v14];

    CLLocationCoordinate2D v15 = [(_BlastDoorLPMapMetadata *)self directionsSourceLocationName];
    [(_BlastDoorLPMapMetadata *)v4 setDirectionsSourceLocationName:v15];

    uint64_t v16 = [(_BlastDoorLPMapMetadata *)self directionsDestinationAddress];
    [(_BlastDoorLPMapMetadata *)v4 setDirectionsDestinationAddress:v16];

    v17 = [(_BlastDoorLPMapMetadata *)self directionsDestinationAddressComponents];
    [(_BlastDoorLPMapMetadata *)v4 setDirectionsDestinationAddressComponents:v17];

    v18 = [(_BlastDoorLPMapMetadata *)self directionsDestinationLocationName];
    [(_BlastDoorLPMapMetadata *)v4 setDirectionsDestinationLocationName:v18];

    uint64_t v19 = [(_BlastDoorLPMapMetadata *)self distance];
    [(_BlastDoorLPMapMetadata *)v4 setDistance:v19];

    v20 = [(_BlastDoorLPMapMetadata *)self image];
    [(_BlastDoorLPMapMetadata *)v4 setImage:v20];

    uint64_t v21 = [(_BlastDoorLPMapMetadata *)self darkImage];
    [(_BlastDoorLPMapMetadata *)v4 setDarkImage:v21];

    v22 = [(_BlastDoorLPMapMetadata *)self storeFrontImage];
    [(_BlastDoorLPMapMetadata *)v4 setStoreFrontImage:v22];

    [(_BlastDoorLPMapMetadata *)v4 setIsPointOfInterest:[(_BlastDoorLPMapMetadata *)self isPointOfInterest]];
    uint64_t v23 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_BlastDoorLPMapMetadata;
  if ([(_BlastDoorLPMapMetadata *)&v28 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (double *)v4;
      unint64_t v7 = *((void *)v6 + 2);
      if (v7 | *(void *)&self->_isPointOfInterest && !objc_msgSend((id)v7, "isEqual:")) {
        goto LABEL_8;
      }
      v8 = v6 + 20;
      if (v6[21] != self->_location.latitude) {
        goto LABEL_8;
      }
      double v9 = *v8;
      if (*v8 != *(double *)&self->_storeFrontImage) {
        goto LABEL_8;
      }
      unint64_t v11 = *((void *)v6 + 3);
      if (v11 | (unint64_t)self->_name)
      {
        if (![(id)v11 isEqual:v9]) {
          goto LABEL_8;
        }
      }
      unint64_t v12 = *((void *)v6 + 4);
      if (v12 | (unint64_t)self->_address && ![(id)v12 isEqual:v9]) {
        goto LABEL_8;
      }
      unint64_t v13 = *((void *)v6 + 5);
      if (v13 | (unint64_t)self->_addressComponents && ![(id)v13 isEqual:v9]) {
        goto LABEL_8;
      }
      unint64_t v14 = *((void *)v6 + 6);
      if (v14 | (unint64_t)self->_category && ![(id)v14 isEqual:v9]) {
        goto LABEL_8;
      }
      unint64_t v15 = *((void *)v6 + 7);
      if (v15 | (unint64_t)self->_categoryIcon && ![(id)v15 isEqual:v9]) {
        goto LABEL_8;
      }
      unint64_t v16 = *((void *)v6 + 8);
      if (v16 | (unint64_t)self->_searchQuery && ![(id)v16 isEqual:v9]) {
        goto LABEL_8;
      }
      unint64_t v17 = *((void *)v6 + 9);
      if (v17 | (unint64_t)self->_directionsType && ![(id)v17 isEqual:v9]) {
        goto LABEL_8;
      }
      unint64_t v18 = *((void *)v6 + 10);
      if (v18 | (unint64_t)self->_transportType && ![(id)v18 isEqual:v9]) {
        goto LABEL_8;
      }
      unint64_t v19 = *((void *)v6 + 11);
      if (v19 | (unint64_t)self->_directionsSourceAddress
        && ![(id)v19 isEqual:v9])
      {
        goto LABEL_8;
      }
      unint64_t v20 = *((void *)v6 + 12);
      if (v20 | (unint64_t)self->_directionsSourceAddressComponents
        && ![(id)v20 isEqual:v9])
      {
        goto LABEL_8;
      }
      if (((unint64_t v21 = *((void *)v6 + 13), !(v21 | (unint64_t)self->_directionsSourceLocationName))
         || [(id)v21 isEqual:v9])
        && ((unint64_t v22 = *((void *)v6 + 14), !(v22 | (unint64_t)self->_directionsDestinationAddress))
         || [(id)v22 isEqual:v9])
        && ((unint64_t v23 = *((void *)v6 + 15), !(v23 | (unint64_t)self->_directionsDestinationAddressComponents))
         || [(id)v23 isEqual:v9])
        && ((unint64_t v24 = *((void *)v6 + 16), !(v24 | (unint64_t)self->_directionsDestinationLocationName))
         || [(id)v24 isEqual:v9])
        && ((unint64_t v25 = *((void *)v6 + 17), !(v25 | (unint64_t)self->_distance))
         || [(id)v25 isEqual:v9])
        && ((unint64_t v26 = *((void *)v6 + 18), !(v26 | (unint64_t)self->_image))
         || [(id)v26 isEqual:v9])
        && ((unint64_t v27 = *((void *)v6 + 19), !(v27 | (unint64_t)self->_darkImage))
         || [(id)v27 isEqual:v9]))
      {
        BOOL v5 = *((unsigned __int8 *)v6 + 9) == *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1);
      }
      else
      {
LABEL_8:
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  v3 = (void (**)(id, __CFString *))((char *)a3 + 16);
  id v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, @"darkImage");
  (*v3)(v5, @"storeFrontImage");
  (*v3)(v5, @"categoryIcon");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"location", @"address", @"addressComponents", @"category", @"categoryIcon", @"searchQuery", @"directionsType", @"transportType", @"directionsSourceAddress", @"directionsSourceAddressComponents", @"directionsSourceLocationName", @"directionsDestinationAddress", @"directionsDestinationAddressComponents", @"directionsDestinationLocationName", @"distance", @"image",
               @"darkImage",
               @"storeFrontImage",
               @"isPointOfInterest",
               0);
}

- (NSString)name
{
  return *(NSString **)&self->_isPointOfInterest;
}

- (void)setName:(id)a3
{
}

- (CLLocationCoordinate2D)location
{
  storeFrontImage = self->_storeFrontImage;
  double latitude = self->_location.latitude;
  result.longitude = latitude;
  result.double latitude = *(double *)&storeFrontImage;
  return result;
}

- (void)setLocation:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)&self->_storeFrontImage = a3;
}

- (NSString)address
{
  return self->_name;
}

- (void)setAddress:(id)a3
{
}

- (CNPostalAddress)addressComponents
{
  return (CNPostalAddress *)self->_address;
}

- (void)setAddressComponents:(id)a3
{
}

- (NSString)category
{
  return (NSString *)&self->_addressComponents->super.isa;
}

- (void)setCategory:(id)a3
{
}

- (_BlastDoorLPImage)categoryIcon
{
  return (_BlastDoorLPImage *)self->_category;
}

- (void)setCategoryIcon:(id)a3
{
}

- (NSString)searchQuery
{
  return (NSString *)&self->_categoryIcon->super.isa;
}

- (void)setSearchQuery:(id)a3
{
}

- (NSString)directionsType
{
  return self->_searchQuery;
}

- (void)setDirectionsType:(id)a3
{
}

- (NSNumber)transportType
{
  return (NSNumber *)self->_directionsType;
}

- (void)setTransportType:(id)a3
{
}

- (NSString)directionsSourceAddress
{
  return (NSString *)&self->_transportType->super.super.isa;
}

- (void)setDirectionsSourceAddress:(id)a3
{
}

- (CNPostalAddress)directionsSourceAddressComponents
{
  return (CNPostalAddress *)self->_directionsSourceAddress;
}

- (void)setDirectionsSourceAddressComponents:(id)a3
{
}

- (NSString)directionsSourceLocationName
{
  return (NSString *)&self->_directionsSourceAddressComponents->super.isa;
}

- (void)setDirectionsSourceLocationName:(id)a3
{
}

- (NSString)directionsDestinationAddress
{
  return self->_directionsSourceLocationName;
}

- (void)setDirectionsDestinationAddress:(id)a3
{
}

- (CNPostalAddress)directionsDestinationAddressComponents
{
  return (CNPostalAddress *)self->_directionsDestinationAddress;
}

- (void)setDirectionsDestinationAddressComponents:(id)a3
{
}

- (NSString)directionsDestinationLocationName
{
  return (NSString *)&self->_directionsDestinationAddressComponents->super.isa;
}

- (void)setDirectionsDestinationLocationName:(id)a3
{
}

- (NSNumber)distance
{
  return (NSNumber *)self->_directionsDestinationLocationName;
}

- (void)setDistance:(id)a3
{
}

- (_BlastDoorLPImage)image
{
  return (_BlastDoorLPImage *)self->_distance;
}

- (void)setImage:(id)a3
{
}

- (_BlastDoorLPImage)darkImage
{
  return self->_image;
}

- (void)setDarkImage:(id)a3
{
}

- (_BlastDoorLPImage)storeFrontImage
{
  return self->_darkImage;
}

- (void)setStoreFrontImage:(id)a3
{
}

- (BOOL)isPointOfInterest
{
  return *(&self->super.__dummyPropertyForObservation + 1);
}

- (void)setIsPointOfInterest:(BOOL)a3
{
  *(&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_directionsDestinationLocationName, 0);
  objc_storeStrong((id *)&self->_directionsDestinationAddressComponents, 0);
  objc_storeStrong((id *)&self->_directionsDestinationAddress, 0);
  objc_storeStrong((id *)&self->_directionsSourceLocationName, 0);
  objc_storeStrong((id *)&self->_directionsSourceAddressComponents, 0);
  objc_storeStrong((id *)&self->_directionsSourceAddress, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_directionsType, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_categoryIcon, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_addressComponents, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_isPointOfInterest, 0);
}

@end