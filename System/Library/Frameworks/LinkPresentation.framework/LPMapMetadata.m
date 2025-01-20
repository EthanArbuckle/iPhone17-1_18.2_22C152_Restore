@interface LPMapMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)_isDirections;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPointOfInterest;
- (CLLocationCoordinate2D)location;
- (CNPostalAddress)addressComponents;
- (CNPostalAddress)directionsDestinationAddressComponents;
- (CNPostalAddress)directionsSourceAddressComponents;
- (LPImage)categoryIcon;
- (LPImage)darkImage;
- (LPImage)image;
- (LPMapMetadata)init;
- (LPMapMetadata)initWithCoder:(id)a3;
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
- (id)_address;
- (id)_bottomLineForTwoUpForTransformer:(id)a3;
- (id)_deduplicatedAddress;
- (id)_directionsDestinationAddress;
- (id)_directionsSourceAddress;
- (id)_iconForTransport;
- (id)_name;
- (id)_resolvedImage;
- (id)_singleLineShortDescription;
- (id)_singleLineVerboseDescription;
- (id)_topLineForTransformer:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fallbackIconForTransformer:(id)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (int64_t)_style;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
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
- (void)setTransportType:(id)a3;
@end

@implementation LPMapMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPMapMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPMapMetadata;
  v2 = [(LPMapMetadata *)&v6 init];
  v3 = (LPMapMetadata *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 152) = *MEMORY[0x1E4F1E750];
    v4 = v2;
  }

  return v3;
}

- (LPMapMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)LPMapMetadata;
  v5 = [(LPMapMetadata *)&v59 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    v8 = decodeNumberForKey(v4, @"locationLatitude");
    uint64_t v9 = decodeNumberForKey(v4, @"locationLongitude");
    v10 = (void *)v9;
    v11 = (CLLocationDegrees *)(v5 + 152);
    if (v8 && v9)
    {
      [v8 doubleValue];
      CLLocationDegrees v13 = v12;
      [v10 doubleValue];
      CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v13, v14);
      CLLocationDegrees *v11 = v15.latitude;
      *((void *)v5 + 20) = *(void *)&v15.longitude;
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
    uint64_t v21 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClasses:forKey:", v20, @"addressComponents");
    v22 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v21;

    uint64_t v23 = decodeStringForKey(v4, @"category");
    v24 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v23;

    uint64_t v25 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"categoryIcon");
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
    uint64_t v38 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClasses:forKey:", v37, @"directionsSourceAddressComponents");
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
    uint64_t v47 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClasses:forKey:", v46, @"directionsDestinationAddressComponents");
    v48 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v47;

    uint64_t v49 = decodeStringForKey(v4, @"directionsDestinationLocationName");
    v50 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v49;

    uint64_t v51 = decodeNumberForKey(v4, @"distance");
    v52 = (void *)*((void *)v5 + 16);
    *((void *)v5 + 16) = v51;

    uint64_t v53 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"image");
    v54 = (void *)*((void *)v5 + 17);
    *((void *)v5 + 17) = v53;

    uint64_t v55 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"darkImage");
    v56 = (void *)*((void *)v5 + 18);
    *((void *)v5 + 18) = v55;

    v5[11] = [v4 decodeBoolForKey:@"isPointOfInterest"];
    v57 = v5;
  }
  return (LPMapMetadata *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", *(void *)&self->_isPointOfInterest, @"name");
  if (CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&self->_darkImage))
  {
    id v4 = [NSNumber numberWithDouble:*(double *)&self->_darkImage];
    objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", v4, @"locationLatitude");

    v5 = [NSNumber numberWithDouble:self->_location.latitude];
    objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", v5, @"locationLongitude");
  }
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_name, @"address");
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_address, @"addressComponents");
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_addressComponents, @"category");
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_category, @"categoryIcon");
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_categoryIcon, @"searchQuery");
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_searchQuery, @"directionsType");
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_directionsType, @"transportType");
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_transportType, @"directionsSourceAddress");
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_directionsSourceAddress, @"directionsSourceAddressComponents");
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_directionsSourceAddressComponents, @"directionsSourceLocationName");
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_directionsSourceLocationName, @"directionsDestinationAddress");
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_directionsDestinationAddress, @"directionsDestinationAddressComponents");
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_directionsDestinationAddressComponents, @"directionsDestinationLocationName");
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_directionsDestinationLocationName, @"distance");
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_distance, @"image");
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_image, @"darkImage");
  [v6 encodeBool:*((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1) forKey:@"isPointOfInterest"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPMapMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPMapMetadata *)self name];
    [(LPMapMetadata *)v4 setName:v5];

    [(LPMapMetadata *)self location];
    -[LPMapMetadata setLocation:](v4, "setLocation:");
    id v6 = [(LPMapMetadata *)self address];
    [(LPMapMetadata *)v4 setAddress:v6];

    v7 = [(LPMapMetadata *)self addressComponents];
    [(LPMapMetadata *)v4 setAddressComponents:v7];

    v8 = [(LPMapMetadata *)self category];
    [(LPMapMetadata *)v4 setCategory:v8];

    uint64_t v9 = [(LPMapMetadata *)self categoryIcon];
    [(LPMapMetadata *)v4 setCategoryIcon:v9];

    v10 = [(LPMapMetadata *)self searchQuery];
    [(LPMapMetadata *)v4 setSearchQuery:v10];

    v11 = [(LPMapMetadata *)self directionsType];
    [(LPMapMetadata *)v4 setDirectionsType:v11];

    double v12 = [(LPMapMetadata *)self transportType];
    [(LPMapMetadata *)v4 setTransportType:v12];

    CLLocationDegrees v13 = [(LPMapMetadata *)self directionsSourceAddress];
    [(LPMapMetadata *)v4 setDirectionsSourceAddress:v13];

    CLLocationDegrees v14 = [(LPMapMetadata *)self directionsSourceAddressComponents];
    [(LPMapMetadata *)v4 setDirectionsSourceAddressComponents:v14];

    CLLocationCoordinate2D v15 = [(LPMapMetadata *)self directionsSourceLocationName];
    [(LPMapMetadata *)v4 setDirectionsSourceLocationName:v15];

    uint64_t v16 = [(LPMapMetadata *)self directionsDestinationAddress];
    [(LPMapMetadata *)v4 setDirectionsDestinationAddress:v16];

    v17 = [(LPMapMetadata *)self directionsDestinationAddressComponents];
    [(LPMapMetadata *)v4 setDirectionsDestinationAddressComponents:v17];

    v18 = [(LPMapMetadata *)self directionsDestinationLocationName];
    [(LPMapMetadata *)v4 setDirectionsDestinationLocationName:v18];

    uint64_t v19 = [(LPMapMetadata *)self distance];
    [(LPMapMetadata *)v4 setDistance:v19];

    v20 = [(LPMapMetadata *)self image];
    [(LPMapMetadata *)v4 setImage:v20];

    uint64_t v21 = [(LPMapMetadata *)self darkImage];
    [(LPMapMetadata *)v4 setDarkImage:v21];

    [(LPMapMetadata *)v4 setIsPointOfInterest:[(LPMapMetadata *)self isPointOfInterest]];
    v22 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPMapMetadata;
  if ([(LPMapMetadata *)&v8 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (void **)v4;
      BOOL v5 = (objectsAreEqual_0(v6[2], *(void **)&self->_isPointOfInterest) & 1) != 0
        && *((double *)v6 + 20) == self->_location.latitude
        && *((double *)v6 + 19) == *(double *)&self->_darkImage
        && objectsAreEqual_0(v6[3], self->_name)
        && objectsAreEqual_0(v6[4], self->_address)
        && objectsAreEqual_0(v6[5], self->_addressComponents)
        && objectsAreEqual_0(v6[6], self->_category)
        && objectsAreEqual_0(v6[7], self->_categoryIcon)
        && objectsAreEqual_0(v6[8], self->_searchQuery)
        && objectsAreEqual_0(v6[9], self->_directionsType)
        && objectsAreEqual_0(v6[10], self->_transportType)
        && objectsAreEqual_0(v6[11], self->_directionsSourceAddress)
        && objectsAreEqual_0(v6[12], self->_directionsSourceAddressComponents)
        && objectsAreEqual_0(v6[13], self->_directionsSourceLocationName)
        && objectsAreEqual_0(v6[14], self->_directionsDestinationAddress)
        && objectsAreEqual_0(v6[15], self->_directionsDestinationAddressComponents)
        && objectsAreEqual_0(v6[16], self->_directionsDestinationLocationName)
        && objectsAreEqual_0(v6[17], self->_distance)
        && objectsAreEqual_0(v6[18], self->_image)
        && *((unsigned __int8 *)v6 + 11) == *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1);
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
  v3 = (void (**)(id, __CFString *))a3;
  v3[2](v3, @"image");
  v3[2](v3, @"darkImage");
  v3[2](v3, @"categoryIcon");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"location", @"address", @"addressComponents", @"category", @"categoryIcon", @"searchQuery", @"directionsType", @"transportType", @"directionsSourceAddress", @"directionsSourceAddressComponents", @"directionsSourceLocationName", @"directionsDestinationAddress", @"directionsDestinationAddressComponents", @"directionsDestinationLocationName", @"distance", @"image",
               @"darkImage",
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
  darkImage = self->_darkImage;
  double latitude = self->_location.latitude;
  result.longitude = latitude;
  result.double latitude = *(double *)&darkImage;
  return result;
}

- (void)setLocation:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)&self->_darkImage = a3;
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

- (LPImage)categoryIcon
{
  return (LPImage *)self->_category;
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

- (LPImage)image
{
  return (LPImage *)self->_distance;
}

- (void)setImage:(id)a3
{
}

- (LPImage)darkImage
{
  return self->_image;
}

- (void)setDarkImage:(id)a3
{
}

- (BOOL)isPointOfInterest
{
  return *(&self->super.__disallowsURLOverrideByDelegate + 1);
}

- (void)setIsPointOfInterest:(BOOL)a3
{
  *(&self->super.__disallowsURLOverrideByDelegate + 1) = a3;
}

- (void).cxx_destruct
{
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

- (id)_address
{
  v3 = [(LPMapMetadata *)self addressComponents];
  id v4 = [(LPMapMetadata *)self address];
  BOOL v5 = formattedAddressWithFallback(v3, v4, [(LPMapMetadata *)self isPointOfInterest]);

  return v5;
}

- (id)_directionsSourceAddress
{
  v3 = [(LPMapMetadata *)self directionsSourceLocationName];

  if (v3)
  {
    id v4 = [(LPMapMetadata *)self directionsSourceLocationName];
  }
  else
  {
    BOOL v5 = [(LPMapMetadata *)self directionsSourceAddressComponents];
    id v6 = [(LPMapMetadata *)self directionsSourceAddress];
    id v4 = formattedAddressWithFallback(v5, v6, [(LPMapMetadata *)self isPointOfInterest]);
  }

  return v4;
}

- (id)_directionsDestinationAddress
{
  v3 = [(LPMapMetadata *)self directionsDestinationLocationName];

  if (v3)
  {
    id v4 = [(LPMapMetadata *)self directionsDestinationLocationName];
  }
  else
  {
    BOOL v5 = [(LPMapMetadata *)self directionsDestinationAddressComponents];
    id v6 = [(LPMapMetadata *)self directionsDestinationAddress];
    id v4 = formattedAddressWithFallback(v5, v6, [(LPMapMetadata *)self isPointOfInterest]);
  }

  return v4;
}

- (BOOL)_isDirections
{
  v3 = [(LPMapMetadata *)self directionsSourceAddress];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [(LPMapMetadata *)self directionsSourceAddressComponents];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(LPMapMetadata *)self directionsDestinationAddress];
      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        v7 = [(LPMapMetadata *)self directionsDestinationAddressComponents];
        BOOL v4 = v7 != 0;
      }
    }
  }
  return v4;
}

- (id)_name
{
  v3 = [(LPMapMetadata *)self name];

  if (v3)
  {
    BOOL v4 = [(LPMapMetadata *)self name];
  }
  else
  {
    BOOL v4 = [(LPMapMetadata *)self addressComponents];

    if (v4)
    {
      BOOL v5 = [(LPMapMetadata *)self addressComponents];
      BOOL v4 = [v5 street];
    }
  }

  return v4;
}

- (id)_deduplicatedAddress
{
  v3 = [(LPMapMetadata *)self _address];
  BOOL v4 = [(LPMapMetadata *)self _name];
  if ([v4 length] && objc_msgSend(v3, "_lp_hasCaseInsensitivePrefix:", v4))
  {
    BOOL v5 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v4, "length"));

    id v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v3 = [v5 stringByTrimmingCharactersInSet:v6];
  }

  return v3;
}

- (id)_singleLineShortDescription
{
  v3 = [(LPMapMetadata *)self searchQuery];

  if (v3)
  {
    uint64_t v4 = [(LPMapMetadata *)self searchQuery];
LABEL_3:
    BOOL v5 = (void *)v4;
    goto LABEL_9;
  }
  id v6 = [(LPMapMetadata *)self _directionsDestinationAddress];

  if (v6)
  {
    v7 = NSString;
    objc_super v8 = LPLocalizedString(@"Directions to %@");
    uint64_t v9 = [(LPMapMetadata *)self _directionsDestinationAddress];
    uint64_t v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);
LABEL_8:
    BOOL v5 = (void *)v10;

    goto LABEL_9;
  }
  v11 = [(LPMapMetadata *)self _directionsSourceAddress];

  if (v11)
  {
    double v12 = NSString;
    objc_super v8 = LPLocalizedString(@"Directions from %@");
    uint64_t v9 = [(LPMapMetadata *)self _directionsSourceAddress];
    uint64_t v10 = objc_msgSend(v12, "stringWithFormat:", v8, v9);
    goto LABEL_8;
  }
  CLLocationDegrees v14 = [(LPMapMetadata *)self _name];

  if (v14)
  {
    uint64_t v4 = [(LPMapMetadata *)self _name];
    goto LABEL_3;
  }
  BOOL v5 = 0;
LABEL_9:

  return v5;
}

- (id)_singleLineVerboseDescription
{
  v3 = [(LPMapMetadata *)self searchQuery];

  if (v3)
  {
    uint64_t v4 = NSString;
    BOOL v5 = LPLocalizedString(@"Search for “%@”");
    id v6 = [(LPMapMetadata *)self searchQuery];
    uint64_t v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);
LABEL_7:
    double v12 = (void *)v7;
    goto LABEL_8;
  }
  objc_super v8 = [(LPMapMetadata *)self _directionsDestinationAddress];

  if (v8)
  {
    uint64_t v9 = NSString;
    BOOL v5 = LPLocalizedString(@"Directions to %@");
    id v6 = [(LPMapMetadata *)self _directionsDestinationAddress];
    uint64_t v7 = objc_msgSend(v9, "stringWithFormat:", v5, v6);
    goto LABEL_7;
  }
  uint64_t v10 = [(LPMapMetadata *)self _directionsSourceAddress];

  if (v10)
  {
    v11 = NSString;
    BOOL v5 = LPLocalizedString(@"Directions from %@");
    id v6 = [(LPMapMetadata *)self _directionsSourceAddress];
    uint64_t v7 = objc_msgSend(v11, "stringWithFormat:", v5, v6);
    goto LABEL_7;
  }
  BOOL v5 = [(LPMapMetadata *)self _name];
  id v6 = [(LPMapMetadata *)self _deduplicatedAddress];
  CLLocationDegrees v14 = joinedBySpace(v5, v6);
  double v12 = [v14 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

LABEL_8:

  return v12;
}

- (id)_topLineForTransformer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(LPMapMetadata *)self searchQuery];

  if (v5)
  {
    uint64_t v6 = [(LPMapMetadata *)self searchQuery];
  }
  else if ([(LPMapMetadata *)self _isDirections])
  {
    if ([v4 effectiveSizeClass] != 2
      || ([(LPMapMetadata *)self distance],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          !v7))
    {
      uint64_t v10 = [(LPMapMetadata *)self _directionsDestinationAddress];
      v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v12 = [(LPMapMetadata *)self _directionsSourceAddress];
      }
      objc_super v8 = v12;

      goto LABEL_9;
    }
    uint64_t v6 = [(LPMapMetadata *)self _singleLineVerboseDescription];
  }
  else
  {
    uint64_t v6 = [(LPMapMetadata *)self _name];
  }
  objc_super v8 = (void *)v6;
LABEL_9:

  return v8;
}

- (id)_bottomLineForTwoUpForTransformer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v6 = [(LPMapMetadata *)self category];

  if (v6)
  {
    uint64_t v7 = [(LPMapMetadata *)self category];
    [v5 appendString:v7];
  }
  if ([(LPMapMetadata *)self _isDirections])
  {
    objc_super v8 = [(LPMapMetadata *)self distance];

    if (v8)
    {
      uint64_t v18 = 0;
      uint64_t v19 = &v18;
      uint64_t v20 = 0x2050000000;
      uint64_t v9 = (void *)getMKDistanceFormatterClass_softClass;
      uint64_t v21 = getMKDistanceFormatterClass_softClass;
      if (!getMKDistanceFormatterClass_softClass)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __getMKDistanceFormatterClass_block_invoke;
        v17[3] = &unk_1E5B04EB8;
        v17[4] = &v18;
        __getMKDistanceFormatterClass_block_invoke((uint64_t)v17);
        uint64_t v9 = (void *)v19[3];
      }
      uint64_t v10 = v9;
      _Block_object_dispose(&v18, 8);
      v11 = (void *)[[v10 alloc] init];
      if ([v5 length]) {
        [v5 appendString:@" · "];
      }
      id v12 = [(LPMapMetadata *)self distance];
      [v12 doubleValue];
      CLLocationDegrees v13 = objc_msgSend(v11, "stringFromDistance:");
      [v5 appendString:v13];
    }
    else
    {
      if ([v5 length]) {
        goto LABEL_18;
      }
      v11 = LPLocalizedString(@"Directions");
      [v5 appendString:v11];
    }
  }
  else
  {
    CLLocationDegrees v14 = [(LPMapMetadata *)self addressComponents];

    if (!v14) {
      goto LABEL_18;
    }
    CLLocationCoordinate2D v15 = [(LPMapMetadata *)self addressComponents];
    v11 = cityAndState(v15);

    if ([v11 length])
    {
      if ([v5 length]) {
        [v5 appendString:@" · "];
      }
      [v5 appendString:v11];
    }
  }

LABEL_18:

  return v5;
}

- (int64_t)_style
{
  v2 = [(LPMapMetadata *)self searchQuery];
  if (v2) {
    int64_t v3 = 32;
  }
  else {
    int64_t v3 = 31;
  }

  return v3;
}

- (id)_resolvedImage
{
  int64_t v3 = [(LPMapMetadata *)self image];
  id v4 = [v3 platformImage];

  if (v4)
  {
    id v5 = [LPImage alloc];
    uint64_t v6 = [(LPMapMetadata *)self image];
    id v4 = [(LPImage *)v5 _initWithImage:v6];

    uint64_t v7 = [(LPMapMetadata *)self darkImage];
    [v4 _setDarkInterfaceAlternativeImage:v7];
  }

  return v4;
}

- (id)_iconForTransport
{
  int64_t v3 = [(LPMapMetadata *)self transportType];

  if (v3)
  {
    id v4 = [(LPMapMetadata *)self transportType];
    uint64_t v5 = [v4 integerValue];

    switch(v5)
    {
      case 1:
        uint64_t v6 = +[LPResources transportTransitIcon];
        break;
      case 2:
        uint64_t v6 = +[LPResources transportWalkIcon];
        break;
      case 3:
        uint64_t v6 = +[LPResources transportBicycleIcon];
        break;
      default:
        goto LABEL_3;
    }
  }
  else
  {
LABEL_3:
    uint64_t v6 = +[LPResources transportDriveIcon];
  }

  return v6;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "commonPresentationPropertiesForStyle:", -[LPMapMetadata _style](self, "_style"));
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  if ([(LPMapMetadata *)self _isDirections])
  {
    uint64_t v7 = objc_alloc_init(LPImagePresentationProperties);
    if (!sizeClassRequiresLargeMedia([v4 effectiveSizeClass])
      && [v4 effectiveSizeClass] != 10)
    {
      [(LPImagePresentationProperties *)v7 setFilter:12];
      objc_super v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [(LPImagePresentationProperties *)v7 setBackgroundColor:v8];

      uint64_t v9 = [MEMORY[0x1E4FB1618] whiteColor];
      [(LPImagePresentationProperties *)v7 setMaskColor:v9];

      [(LPImagePresentationProperties *)v7 setShouldApplyBackground:1];
    }
    uint64_t v10 = [(LPMapMetadata *)self _iconForTransport];
    [v4 _populateProperties:v5 withPrimaryIcon:v10 iconProperties:v7];
  }
  else
  {
    if (objc_msgSend(v4, "_prefersImageAsIconWithStyle:", -[LPMapMetadata _style](self, "_style"))
      && ([(LPMapMetadata *)self categoryIcon],
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      uint64_t v7 = [(LPMapMetadata *)self categoryIcon];
    }
    else
    {
      uint64_t v7 = [(LPMapMetadata *)self _resolvedImage];
      id v12 = [(LPMapMetadata *)self darkImage];

      if (v12)
      {
        CLLocationDegrees v13 = [(LPMapMetadata *)self darkImage];
        [(LPImagePresentationProperties *)v7 _setDarkInterfaceAlternativeImage:v13];
      }
    }
    [v4 _populateProperties:v5 withPrimaryImage:v7];
  }

  [v4 effectiveSizeClass];
  populatePropertiesForVisualRefresh(v5);
  switch(objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style")))
  {
    case 0:
      CLLocationDegrees v14 = LPLocalizedString(@" Maps");
      uint64_t v15 = [(LPMapMetadata *)self _singleLineShortDescription];
      uint64_t v16 = (void *)v15;
      if (v15) {
        v17 = (void *)v15;
      }
      else {
        v17 = v14;
      }
      uint64_t v18 = [v5 captionBar];
      uint64_t v19 = [v18 top];
      uint64_t v20 = [v19 leading];
      [v20 setText:v17];
      goto LABEL_37;
    case 1:
      uint64_t v21 = [(LPMapMetadata *)self _topLineForTransformer:v4];
      v22 = [v5 captionBar];
      uint64_t v23 = [v22 top];
      v24 = [v23 leading];
      [v24 setText:v21];

      CLLocationDegrees v14 = [(LPMapMetadata *)self _bottomLineForTwoUpForTransformer:v4];
      if ([v4 effectiveSizeClass] != 2)
      {
        uint64_t v16 = LPLocalizedString(@" Maps");
        uint64_t v18 = joinedByDot(v16, v14);
        uint64_t v19 = [v5 captionBar];
        uint64_t v20 = [v19 bottom];
        v39 = [v20 leading];
        [v39 setText:v18];
        goto LABEL_36;
      }
      uint64_t v16 = v14;
      if (!v14)
      {
        uint64_t v16 = LPLocalizedString(@" Maps");
      }
      uint64_t v25 = [v5 captionBar];
      v26 = [v25 bottom];
      uint64_t v27 = [v26 leading];
      [v27 setText:v16];

      if (!v14) {
        goto LABEL_39;
      }
      goto LABEL_40;
    case 2:
      v28 = [(LPMapMetadata *)self _topLineForTransformer:v4];
      uint64_t v29 = [v5 captionBar];
      v30 = [v29 top];
      uint64_t v31 = [v30 leading];
      [v31 setText:v28];

      v32 = [(LPMapMetadata *)self _bottomLineForTwoUpForTransformer:v4];
      uint64_t v33 = [v5 captionBar];
      v34 = [v33 bottom];
      v35 = [v34 leading];
      [v35 setText:v32];

      CLLocationDegrees v14 = LPLocalizedString(@" Maps");
      uint64_t v16 = [v5 captionBar];
      uint64_t v18 = [v16 belowBottom];
      uint64_t v19 = [v18 leading];
      [v19 setText:v14];
      goto LABEL_38;
    case 3:
      uint64_t v36 = [(LPMapMetadata *)self _topLineForTransformer:v4];
      if ([(LPMapMetadata *)self _isDirections])
      {
        uint64_t v37 = LPLocalizedString(@"Directions");
      }
      else
      {
        uint64_t v38 = [(LPMapMetadata *)self searchQuery];

        if (v38)
        {
          uint64_t v16 = 0;
          goto LABEL_30;
        }
        uint64_t v37 = [(LPMapMetadata *)self _deduplicatedAddress];
      }
      uint64_t v16 = (void *)v37;
LABEL_30:
      uint64_t v40 = [v4 metadata];
      v41 = [v40 URL];
      BOOL v42 = +[LPPresentationSpecializations isMuninURL:v41];

      if (v42)
      {
        v43 = LPLocalizedString(@"Look Around");
        v44 = [v5 captionBar];
        uint64_t v45 = [v44 aboveTop];
        v46 = [v45 leading];
        [v46 setText:v43];

        CLLocationDegrees v14 = [(LPMapMetadata *)self _name];

        if (!v14)
        {
LABEL_32:
          uint64_t v47 = [v5 captionBar];
          v48 = [v47 top];
          uint64_t v49 = [v48 leading];
          [v49 setText:v16];
          goto LABEL_35;
        }
      }
      else
      {
        CLLocationDegrees v14 = v36;
        if (!v36) {
          goto LABEL_32;
        }
      }
      v50 = [v5 captionBar];
      uint64_t v51 = [v50 top];
      v52 = [v51 leading];
      [v52 setText:v14];

      uint64_t v47 = [v5 captionBar];
      v48 = [v47 bottom];
      uint64_t v49 = [v48 leading];
      [v49 setText:v16];
LABEL_35:

      uint64_t v18 = LPLocalizedString(@" Maps");
      uint64_t v19 = [v5 captionBar];
      uint64_t v20 = [v19 belowBottom];
      v39 = [v20 leading];
      [v39 setText:v18];
LABEL_36:

LABEL_37:
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
      return v5;
    default:
      goto LABEL_41;
  }
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isAppleMapsURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  uint64_t v5 = LPLocalizedString(@"Location: %@");
  uint64_t v6 = [(LPMapMetadata *)self _name];
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = [(LPMapMetadata *)self _singleLineVerboseDescription];
  }
  objc_super v8 = objc_msgSend(v4, "stringWithFormat:", v5, v7);
  if (!v6) {

  }
  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  int64_t v3 = [(LPMapMetadata *)self image];

  return v3;
}

- (id)fallbackIconForTransformer:(id)a3
{
  if ([(LPMapMetadata *)self _isDirections]) {
    [(LPMapMetadata *)self _iconForTransport];
  }
  else {
  id v4 = +[LPResources mapIcon];
  }

  return v4;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v6 = a3;
  id v4 = [(LPMapMetadata *)self _singleLineVerboseDescription];
  [v6 setTitle:v4];

  uint64_t v5 = [(LPMapMetadata *)self image];
  [v6 setImage:v5];
}

@end