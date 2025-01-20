@interface EKStructuredLocation
+ (Class)frozenClass;
+ (EKStructuredLocation)locationWithCalLocation:(id)a3;
+ (EKStructuredLocation)locationWithGEOMapItem:(id)a3;
+ (EKStructuredLocation)locationWithMapItem:(MKMapItem *)mapItem;
+ (EKStructuredLocation)locationWithPlacemark:(id)a3;
+ (EKStructuredLocation)locationWithTitle:(NSString *)title;
+ (id)_stringByStrippingControlCharactersFromString:(id)a3;
+ (id)displayLabelForContact:(id)a3 unlocalizedLabel:(id)a4;
+ (id)knownIdentityKeysForComparison;
+ (id)knownRelationshipWeakKeys;
+ (id)knownSingleValueKeysForComparison;
+ (id)knownSingleValueKeysToSkipForUIComparison;
- (BOOL)_reset;
- (BOOL)hasKnownSpatialData;
- (BOOL)isEqualToLocation:(id)a3;
- (BOOL)isImprecise;
- (BOOL)isPrediction;
- (BOOL)isStructured;
- (CLLocation)geoLocation;
- (EKPredictedLocationOfInterest)predictedLOI;
- (EKStructuredLocation)initWithPersistentObject:(id)a3 objectForCopy:(id)a4;
- (NSData)mapKitHandle;
- (NSString)address;
- (NSString)contactLabel;
- (NSString)derivedFrom;
- (NSString)routing;
- (NSString)title;
- (double)radius;
- (id)cacheKey;
- (id)calLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)geoURLString;
- (id)latitude;
- (id)longitude;
- (id)radiusRaw;
- (id)referenceFrame;
- (id)semanticIdentifier;
- (void)_clearGeoLocationCache;
- (void)setAddress:(id)a3;
- (void)setContactLabel:(id)a3;
- (void)setDerivedFrom:(id)a3;
- (void)setGeoLocation:(CLLocation *)geoLocation;
- (void)setImprecise:(BOOL)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setMapKitHandle:(id)a3;
- (void)setPredictedLOI:(id)a3;
- (void)setRadius:(double)radius;
- (void)setRadiusRaw:(id)a3;
- (void)setReferenceFrame:(id)a3;
- (void)setRouting:(id)a3;
- (void)setTitle:(NSString *)title;
- (void)updateFromMapItem:(id)a3;
@end

@implementation EKStructuredLocation

- (BOOL)isPrediction
{
  v2 = [(EKStructuredLocation *)self predictedLOI];
  BOOL v3 = v2 != 0;

  return v3;
}

- (EKPredictedLocationOfInterest)predictedLOI
{
  return self->_predictedLOI;
}

- (NSString)address
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57078]];
}

- (NSString)title
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F570D0]];
}

- (CLLocation)geoLocation
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__EKStructuredLocation_geoLocation__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKObject *)self cachedValueForKey:@"geoLocation" populateBlock:v4];

  return (CLLocation *)v2;
}

+ (EKStructuredLocation)locationWithGEOMapItem:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F1E630] placemarkWithGEOMapItem:v3];
  v6 = [v4 locationWithPlacemark:v5];

  v7 = [v3 _place];
  v8 = [v7 name];
  if (v8)
  {
    [v6 setTitle:v8];
  }
  else
  {
    v9 = [v3 name];
    [v6 setTitle:v9];
  }
  v10 = [(id)EKWeakLinkClass() sharedService];
  v11 = [v10 handleForMapItem:v3];
  [v6 setMapKitHandle:v11];

  return (EKStructuredLocation *)v6;
}

- (void)setMapKitHandle:(id)a3
{
}

+ (EKStructuredLocation)locationWithPlacemark:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = objc_opt_new();
  v5 = [v3 name];
  [v4 setTitle:v5];

  v6 = [v3 postalAddress];
  v7 = [v6 formattedAddressString];
  [v4 setAddress:v7];

  v8 = [v3 location];
  [v4 setGeoLocation:v8];

  v9 = [v3 region];

  [v9 radius];
  objc_msgSend(v4, "setRadius:");

  return (EKStructuredLocation *)v4;
}

- (void)setRadius:(double)radius
{
  id v4 = [NSNumber numberWithDouble:radius];
  [(EKStructuredLocation *)self setRadiusRaw:v4];
}

- (void)setRadiusRaw:(id)a3
{
}

- (void)setPredictedLOI:(id)a3
{
}

- (void)setImprecise:(BOOL)a3
{
  self->_imprecise = a3;
}

- (void)setGeoLocation:(CLLocation *)geoLocation
{
  if (geoLocation)
  {
    id v4 = NSNumber;
    v5 = geoLocation;
    [(CLLocation *)v5 coordinate];
    v6 = objc_msgSend(v4, "numberWithDouble:");
    [(EKStructuredLocation *)self setLatitude:v6];

    v7 = NSNumber;
    [(CLLocation *)v5 coordinate];
    v9 = [v7 numberWithDouble:v8];
    [(EKStructuredLocation *)self setLongitude:v9];

    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CLLocation referenceFrame](v5, "referenceFrame"));
    [(EKStructuredLocation *)self setReferenceFrame:v10];
  }
  else
  {
    id v11 = 0;
    [(EKStructuredLocation *)self setLatitude:0];
    [(EKStructuredLocation *)self setLongitude:0];
    [(EKStructuredLocation *)self setReferenceFrame:0];
  }
  [(EKObject *)self setCachedValue:geoLocation forKey:@"geoLocation"];
}

- (void)_clearGeoLocationCache
{
}

- (void)setReferenceFrame:(id)a3
{
  [(EKObject *)self setSingleChangedValue:a3 forKey:*MEMORY[0x1E4F570C0]];

  [(EKStructuredLocation *)self _clearGeoLocationCache];
}

- (void)setLongitude:(id)a3
{
  [(EKObject *)self setSingleChangedValue:a3 forKey:*MEMORY[0x1E4F570A8]];

  [(EKStructuredLocation *)self _clearGeoLocationCache];
}

- (void)setLatitude:(id)a3
{
  [(EKObject *)self setSingleChangedValue:a3 forKey:*MEMORY[0x1E4F570A0]];

  [(EKStructuredLocation *)self _clearGeoLocationCache];
}

- (void)setAddress:(id)a3
{
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

id __35__EKStructuredLocation_geoLocation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) latitude];
  uint64_t v3 = [*(id *)(a1 + 32) longitude];
  id v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    v14 = 0;
  }
  else
  {
    v6 = [*(id *)(a1 + 32) referenceFrame];
    uint64_t v7 = [v6 integerValue];

    [v2 doubleValue];
    CLLocationDegrees v9 = v8;
    [v4 doubleValue];
    CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v9, v10);
    id v12 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    v13 = [MEMORY[0x1E4F1C9C8] date];
    v14 = objc_msgSend(v12, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v13, v7, v11.latitude, v11.longitude, 0.0, 0.0, -1.0);
  }

  return v14;
}

- (id)longitude
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F570A8]];
}

- (id)latitude
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F570A0]];
}

- (id)referenceFrame
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F570C0]];
}

- (void)setTitle:(NSString *)title
{
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_11 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_11, &__block_literal_global_70);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_11;

  return v2;
}

void __54__EKStructuredLocation_knownIdentityKeysForComparison__block_invoke()
{
  v0 = (void *)knownIdentityKeysForComparison_keys_11;
  knownIdentityKeysForComparison_keys_11 = (uint64_t)&unk_1EF9531C8;
}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_10 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_10, &__block_literal_global_21);
  }
  v2 = (void *)knownSingleValueKeysForComparison_keys_10;

  return v2;
}

void __57__EKStructuredLocation_knownSingleValueKeysForComparison__block_invoke()
{
  v7[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57090];
  v7[0] = *MEMORY[0x1E4F57078];
  v7[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F570A0];
  v7[2] = *MEMORY[0x1E4F57098];
  v7[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F570B0];
  v7[4] = *MEMORY[0x1E4F570A8];
  v7[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F570C0];
  v7[6] = *MEMORY[0x1E4F570B8];
  v7[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F570D0];
  v7[8] = *MEMORY[0x1E4F570C8];
  v7[9] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:10];
  v6 = (void *)knownSingleValueKeysForComparison_keys_10;
  knownSingleValueKeysForComparison_keys_10 = v5;
}

+ (id)knownSingleValueKeysToSkipForUIComparison
{
  if (knownSingleValueKeysToSkipForUIComparison_onceToken != -1) {
    dispatch_once(&knownSingleValueKeysToSkipForUIComparison_onceToken, &__block_literal_global_24_2);
  }
  uint64_t v2 = (void *)knownSingleValueKeysToSkipForUIComparison_keys;

  return v2;
}

void __65__EKStructuredLocation_knownSingleValueKeysToSkipForUIComparison__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F570C0];
  v3[0] = *MEMORY[0x1E4F57098];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v2 = (void *)knownSingleValueKeysToSkipForUIComparison_keys;
  knownSingleValueKeysToSkipForUIComparison_keys = v1;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_6 != -1) {
    dispatch_once(&knownRelationshipWeakKeys_onceToken_6, &__block_literal_global_26_0);
  }
  uint64_t v2 = (void *)knownRelationshipWeakKeys_keys_6;

  return v2;
}

void __49__EKStructuredLocation_knownRelationshipWeakKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57080];
  v3[0] = *MEMORY[0x1E4F57088];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v2 = (void *)knownRelationshipWeakKeys_keys_6;
  knownRelationshipWeakKeys_keys_6 = v1;
}

+ (EKStructuredLocation)locationWithTitle:(NSString *)title
{
  uint64_t v3 = title;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setTitle:v3];

  return (EKStructuredLocation *)v4;
}

+ (id)_stringByStrippingControlCharactersFromString:(id)a3
{
  uint64_t v3 = _stringByStrippingControlCharactersFromString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_stringByStrippingControlCharactersFromString__onceToken, &__block_literal_global_28);
  }
  uint64_t v5 = [v4 componentsSeparatedByCharactersInSet:_stringByStrippingControlCharactersFromString__s_charSet];

  v6 = [v5 componentsJoinedByString:&stru_1EF932508];

  return v6;
}

uint64_t __70__EKStructuredLocation__stringByStrippingControlCharactersFromString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  uint64_t v1 = [v0 mutableCopy];
  uint64_t v2 = (void *)_stringByStrippingControlCharactersFromString__s_charSet;
  _stringByStrippingControlCharactersFromString__s_charSet = v1;

  [(id)_stringByStrippingControlCharactersFromString__s_charSet invert];
  uint64_t v3 = (void *)_stringByStrippingControlCharactersFromString__s_charSet;
  id v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  [v3 formUnionWithCharacterSet:v4];

  uint64_t v5 = (void *)_stringByStrippingControlCharactersFromString__s_charSet;

  return [v5 invert];
}

+ (EKStructuredLocation)locationWithMapItem:(MKMapItem *)mapItem
{
  id v4 = mapItem;
  uint64_t v5 = objc_opt_class();
  v6 = [(MKMapItem *)v4 placemark];
  uint64_t v7 = [v5 locationWithPlacemark:v6];

  double v8 = [(MKMapItem *)v4 name];
  CLLocationDegrees v9 = [a1 _stringByStrippingControlCharactersFromString:v8];
  [v7 setTitle:v9];

  CLLocationDegrees v10 = [(MKMapItem *)v4 _handle];

  [v7 setMapKitHandle:v10];

  return (EKStructuredLocation *)v7;
}

+ (EKStructuredLocation)locationWithCalLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 title];
  v6 = [a1 locationWithTitle:v5];

  uint64_t v7 = [v4 address];
  [v6 setAddress:v7];

  [v4 radius];
  objc_msgSend(v6, "setRadius:");
  double v8 = [v4 location];
  [v6 setGeoLocation:v8];

  CLLocationDegrees v9 = [v4 mapKitHandle];

  [v6 setMapKitHandle:v9];

  return (EKStructuredLocation *)v6;
}

- (EKStructuredLocation)initWithPersistentObject:(id)a3 objectForCopy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Trying to initialize an EKStructuredLocation as a copy of an object that is not an EKStructuredLocation" userInfo:0];
    [v8 raise];
  }
  v12.receiver = self;
  v12.super_class = (Class)EKStructuredLocation;
  CLLocationDegrees v9 = [(EKObject *)&v12 initWithPersistentObject:v6 objectForCopy:v7];
  if (v9)
  {
    CLLocationDegrees v10 = [v7 predictedLOI];
    [(EKStructuredLocation *)v9 setPredictedLOI:v10];
  }
  return v9;
}

- (BOOL)isStructured
{
  uint64_t v3 = [(EKStructuredLocation *)self geoLocation];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(EKStructuredLocation *)self contactLabel];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)hasKnownSpatialData
{
  uint64_t v3 = [(EKStructuredLocation *)self geoLocation];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(EKStructuredLocation *)self mapKitHandle];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)cacheKey
{
  uint64_t v3 = NSString;
  BOOL v4 = [(EKStructuredLocation *)self latitude];
  [v4 floatValue];
  double v6 = v5;
  id v7 = [(EKStructuredLocation *)self longitude];
  [v7 floatValue];
  CLLocationDegrees v9 = [v3 stringWithFormat:@"%4f, %4f", *(void *)&v6, v8];

  return v9;
}

- (id)radiusRaw
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F570B8]];
}

- (double)radius
{
  uint64_t v2 = [(EKStructuredLocation *)self radiusRaw];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (NSString)contactLabel
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57090]];
  double v3 = [v2 stringByReplacingOccurrencesOfString:@"ab://" withString:&stru_1EF932508];
  double v4 = [v3 stringByReplacingOccurrencesOfString:@"ab\\://" withString:&stru_1EF932508];

  float v5 = [v4 stringByRemovingPercentEncoding];

  if ([v5 length]) {
    double v6 = v5;
  }
  else {
    double v6 = v2;
  }
  id v7 = v6;

  return v7;
}

- (void)setContactLabel:(id)a3
{
}

- (NSData)mapKitHandle
{
  return (NSData *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F570B0]];
}

- (BOOL)_reset
{
  v7.receiver = self;
  v7.super_class = (Class)EKStructuredLocation;
  BOOL v3 = [(EKObject *)&v7 _reset];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __30__EKStructuredLocation__reset__block_invoke;
    v6[3] = &unk_1E5B98120;
    v6[4] = self;
    LOBYTE(v3) = [(EKObject *)self _resetIfBackingObjectIsOfClass:v4 fetchResetFrozenObjectBlock:v6];
  }
  return v3;
}

id __30__EKStructuredLocation__reset__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 eventStore];
  float v5 = [v4 reminderStore];
  double v6 = [v5 resetBackingLocationWithBackingLocation:v3];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E30901FFFFFFFFLL])
  {
    v17.receiver = self;
    v17.super_class = (Class)EKStructuredLocation;
    return [(EKObject *)&v17 copyWithZone:a3];
  }
  else
  {
    float v5 = objc_alloc_init(EKStructuredLocation);
    double v6 = [(EKStructuredLocation *)self title];
    [(EKStructuredLocation *)v5 setTitle:v6];

    objc_super v7 = [(EKStructuredLocation *)self geoLocation];
    [(EKStructuredLocation *)v5 setGeoLocation:v7];

    float v8 = [(EKStructuredLocation *)self mapKitHandle];
    [(EKStructuredLocation *)v5 setMapKitHandle:v8];

    [(EKStructuredLocation *)self radius];
    -[EKStructuredLocation setRadius:](v5, "setRadius:");
    CLLocationDegrees v9 = [(EKObject *)self backingObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      CLLocationCoordinate2D v11 = [(EKStructuredLocation *)self address];
      [(EKStructuredLocation *)v5 setAddress:v11];

      objc_super v12 = [(EKStructuredLocation *)self contactLabel];
      [(EKStructuredLocation *)v5 setContactLabel:v12];

      v13 = [(EKStructuredLocation *)self routing];
      [(EKStructuredLocation *)v5 setRouting:v13];

      v14 = [(EKStructuredLocation *)self derivedFrom];
      [(EKStructuredLocation *)v5 setDerivedFrom:v14];

      v15 = [(EKStructuredLocation *)self predictedLOI];
      [(EKStructuredLocation *)v5 setPredictedLOI:v15];

      [(EKStructuredLocation *)v5 setImprecise:[(EKStructuredLocation *)self isImprecise]];
    }
  }
  return v5;
}

- (BOOL)isEqualToLocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    double v6 = [(EKStructuredLocation *)self title];
    if (v6)
    {
    }
    else
    {
      float v8 = [v4 title];

      if (!v8) {
        goto LABEL_7;
      }
    }
    CLLocationDegrees v9 = [(EKStructuredLocation *)self title];
    CLLocationDegrees v10 = [v4 title];
    isKindOfClass &= [v9 isEqualToString:v10];

LABEL_7:
    CLLocationCoordinate2D v11 = [(EKStructuredLocation *)self address];
    if (v11)
    {
    }
    else
    {
      objc_super v12 = [v4 address];

      if (!v12) {
        goto LABEL_11;
      }
    }
    v13 = [(EKStructuredLocation *)self address];
    v14 = [v4 address];
    isKindOfClass &= [v13 isEqualToString:v14];

LABEL_11:
    v15 = [(EKStructuredLocation *)self contactLabel];
    if (v15)
    {
    }
    else
    {
      v16 = [v4 contactLabel];

      if (!v16) {
        goto LABEL_15;
      }
    }
    objc_super v17 = [(EKStructuredLocation *)self contactLabel];
    v18 = [v4 contactLabel];
    isKindOfClass &= [v17 isEqualToString:v18];

LABEL_15:
    v19 = [(EKStructuredLocation *)self geoLocation];
    if (v19)
    {
    }
    else
    {
      v20 = [v4 geoLocation];

      if (!v20) {
        goto LABEL_22;
      }
    }
    v21 = [(EKStructuredLocation *)self geoLocation];
    [v21 coordinate];
    double v23 = v22;
    v24 = [v4 geoLocation];
    [v24 coordinate];
    BOOL v26 = vabdd_f64(v23, v25) < 2.22044605e-16;

    v27 = [(EKStructuredLocation *)self geoLocation];
    [v27 coordinate];
    double v29 = v28;
    v30 = [v4 geoLocation];
    [v30 coordinate];
    BOOL v32 = vabdd_f64(v29, v31) < 2.22044605e-16 && v26;
    isKindOfClass &= v32;

LABEL_22:
    v33 = [(EKStructuredLocation *)self mapKitHandle];
    if (v33)
    {
    }
    else
    {
      v34 = [v4 mapKitHandle];

      if (!v34)
      {
LABEL_26:
        [(EKStructuredLocation *)self radius];
        double v38 = v37;
        [v4 radius];
        BOOL v7 = isKindOfClass & (vabdd_f64(v38, v39) < 2.22044605e-16);
        goto LABEL_27;
      }
    }
    v35 = [(EKStructuredLocation *)self mapKitHandle];
    v36 = [v4 mapKitHandle];
    isKindOfClass &= [v35 isEqualToData:v36];

    goto LABEL_26;
  }
  BOOL v7 = 0;
LABEL_27:

  return v7;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  float v5 = [(EKStructuredLocation *)self title];
  double v6 = [(EKStructuredLocation *)self address];
  BOOL v7 = [(EKStructuredLocation *)self geoLocation];
  float v8 = [(EKStructuredLocation *)self contactLabel];
  CLLocationDegrees v9 = [(EKStructuredLocation *)self routing];
  [(EKStructuredLocation *)self radius];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {title = %@; address = %@; geo = %@; abID = %@; routing = %@; radius = %f;}",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
  CLLocationCoordinate2D v11 = v10);

  return v11;
}

- (NSString)routing
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F570C8]];
}

- (void)setRouting:(id)a3
{
}

- (id)calLocation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F57740]);
  uint64_t v4 = [(EKStructuredLocation *)self title];
  [v3 setTitle:v4];

  float v5 = [(EKStructuredLocation *)self address];
  [v3 setAddress:v5];

  double v6 = [(EKStructuredLocation *)self title];
  [v3 setDisplayName:v6];

  [v3 setType:1];
  [(EKStructuredLocation *)self radius];
  objc_msgSend(v3, "setRadius:");
  BOOL v7 = [(EKStructuredLocation *)self geoLocation];
  [v3 setLocation:v7];

  float v8 = [(EKStructuredLocation *)self routing];
  [v3 setRouteType:v8];

  CLLocationDegrees v9 = [(EKStructuredLocation *)self mapKitHandle];
  [v3 setMapKitHandle:v9];

  return v3;
}

- (id)geoURLString
{
  id v3 = NSString;
  uint64_t v4 = [(EKStructuredLocation *)self geoLocation];
  [v4 coordinate];
  uint64_t v6 = v5;
  BOOL v7 = [(EKStructuredLocation *)self geoLocation];
  [v7 coordinate];
  CLLocationDegrees v9 = objc_msgSend(v3, "stringWithFormat:", @"geo:%f,%f", v6, v8);

  return v9;
}

- (void)updateFromMapItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 placemark];
  uint64_t v6 = [v5 location];
  [(EKStructuredLocation *)self setGeoLocation:v6];

  BOOL v7 = [v4 placemark];
  uint64_t v8 = [v7 region];
  [v8 radius];
  -[EKStructuredLocation setRadius:](self, "setRadius:");

  id v9 = [v4 _handle];

  [(EKStructuredLocation *)self setMapKitHandle:v9];
}

- (NSString)derivedFrom
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57098]];
}

- (void)setDerivedFrom:(id)a3
{
}

+ (id)displayLabelForContact:(id)a3 unlocalizedLabel:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1B910];
  id v7 = a4;
  uint64_t v8 = [v6 stringFromContact:v5 style:0];
  id v9 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v7];

  uint64_t v10 = [v9 capitalizedString];

  if ([v5 contactType] == 1) {
    goto LABEL_2;
  }
  if (v10)
  {
    objc_super v12 = [MEMORY[0x1E4F576B0] defaultProvider];
    v13 = [v5 identifier];
    int v14 = [v12 contactIdentifierIsMe:v13];

    if (!v14 && v8)
    {
      v15 = NSString;
      v16 = EKBundle();
      objc_super v17 = [v16 localizedStringForKey:@"%@’s %@" value:&stru_1EF932508 table:0];
      v18 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v8, v10);

      goto LABEL_9;
    }
    id v11 = v10;
    goto LABEL_8;
  }
  if (v8)
  {
LABEL_2:
    id v11 = v8;
LABEL_8:
    v18 = v11;
    goto LABEL_9;
  }
  v18 = 0;
LABEL_9:
  if ([v18 length]) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  return v19;
}

- (id)semanticIdentifier
{
  id v3 = [(EKStructuredLocation *)self title];
  id v4 = [(EKStructuredLocation *)self address];
  id v5 = [(EKStructuredLocation *)self mapKitHandle];
  uint64_t v6 = [(EKStructuredLocation *)self contactLabel];
  id v7 = [(EKStructuredLocation *)self latitude];
  uint64_t v8 = [(EKStructuredLocation *)self longitude];
  id v9 = NSNumber;
  [(EKStructuredLocation *)self radius];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  id v11 = +[EKStructuredLocationSemanticIdentifierGenerator semanticIdentifierForLocationWithTitle:v3 address:v4 mapKitHandle:v5 contactLabel:v6 latitude:v7 longitude:v8 radius:v10];

  return v11;
}

- (BOOL)isImprecise
{
  return self->_imprecise;
}

- (void).cxx_destruct
{
}

@end