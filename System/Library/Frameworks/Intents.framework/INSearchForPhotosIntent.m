@interface INSearchForPhotosIntent
+ (BOOL)supportsSecureCoding;
- (CLPlacemark)locationCreated;
- (INConditionalOperator)peopleInPhotoOperator;
- (INConditionalOperator)searchTermsOperator;
- (INDateComponentsRange)dateCreated;
- (INPhotoAttributeOptions)excludedAttributes;
- (INPhotoAttributeOptions)includedAttributes;
- (INSearchForPhotosIntent)initWithDateCreated:(INDateComponentsRange *)dateCreated locationCreated:(CLPlacemark *)locationCreated albumName:(NSString *)albumName searchTerms:(NSArray *)searchTerms includedAttributes:(INPhotoAttributeOptions)includedAttributes excludedAttributes:(INPhotoAttributeOptions)excludedAttributes peopleInPhoto:(NSArray *)peopleInPhoto;
- (NSArray)activities;
- (NSArray)events;
- (NSArray)geographicalFeatures;
- (NSArray)peopleInPhoto;
- (NSArray)places;
- (NSArray)searchTerms;
- (NSString)albumName;
- (NSString)memoryName;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)activitiesOperator;
- (int64_t)eventsOperator;
- (int64_t)geographicalFeaturesOperator;
- (int64_t)placesOperator;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setActivities:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setEvents:(id)a3;
- (void)setExcludedAttributes:(unint64_t)a3;
- (void)setGeographicalFeatures:(id)a3;
- (void)setIncludedAttributes:(unint64_t)a3;
- (void)setLocationCreated:(id)a3;
- (void)setMemoryName:(id)a3;
- (void)setPeopleInPhoto:(id)a3;
- (void)setPlaces:(id)a3;
- (void)setSearchTerms:(id)a3;
@end

@implementation INSearchForPhotosIntent

- (void)setDateCreated:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setDateCreated:v5];
}

- (INConditionalOperator)searchTermsOperator
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  v3 = [v2 searchTerm];

  id v4 = [v3 conditionType];
  INConditionalOperator v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (INPhotoAttributeOptions)includedAttributes
{
  INPhotoAttributeOptions v8 = 0;
  v3 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v4 = [v3 includedAttributesCount];

  if (!v4) {
    return 0;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
    INPhotoAttributeOptionsAddBackingType((uint64_t *)&v8, [v6 includedAttributeAtIndex:i]);
  }
  return v8;
}

- (id)_dictionaryRepresentation
{
  v25[7] = *MEMORY[0x1E4F143B8];
  v24[0] = @"dateCreated";
  uint64_t v3 = [(INSearchForPhotosIntent *)self dateCreated];
  uint64_t v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v3;
  v25[0] = v3;
  v24[1] = @"locationCreated";
  uint64_t v5 = [(INSearchForPhotosIntent *)self locationCreated];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v5;
  v25[1] = v5;
  v24[2] = @"albumName";
  uint64_t v7 = [(INSearchForPhotosIntent *)self albumName];
  INPhotoAttributeOptions v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v7;
  v25[2] = v7;
  v24[3] = @"searchTerms";
  uint64_t v9 = [(INSearchForPhotosIntent *)self searchTerms];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v25[3] = v9;
  v24[4] = @"includedAttributes";
  v11 = INPhotoAttributeOptionsGetNames([(INSearchForPhotosIntent *)self includedAttributes]);
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = v4;
  v25[4] = v12;
  v24[5] = @"excludedAttributes";
  v13 = INPhotoAttributeOptionsGetNames([(INSearchForPhotosIntent *)self excludedAttributes]);
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v14;
  v24[6] = @"peopleInPhoto";
  v15 = [(INSearchForPhotosIntent *)self peopleInPhoto];
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[6] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:7];
  if (!v15) {

  }
  if (!v13) {
  if (!v11)
  }

  if (!v10) {
  if (!v8)
  }

  if (!v6) {
  if (!v23)
  }

  return v17;
}

- (CLPlacemark)locationCreated
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 locationCreated];
  uint64_t v4 = INIntentSlotValueTransformFromLocation(v3);

  return (CLPlacemark *)v4;
}

- (void)setAlbumName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToString(v4);

  [v6 setAlbumName:v5];
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)verb
{
  return @"SearchForPhotos";
}

- (id)domain
{
  return @"Photos";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  id v21 = v6;
  INPhotoAttributeOptions v8 = (void *)[v7 copy];
  uint64_t v9 = [v7 dateCreated];
  v10 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);
  [v8 setDateCreated:v10];

  v11 = [v7 locationCreated];
  v12 = INIntentSlotValueRedactedLocationFromLocation(v11, a3, v21);
  [v8 setLocationCreated:v12];

  v13 = [v7 albumName];
  v14 = INIntentSlotValueRedactedStringFromString(v13, a3, v21);
  [v8 setAlbumName:v14];

  v15 = [v8 searchTerm];
  v16 = [v15 dataStrings];
  v17 = INIntentSlotValueRedactedStringsFromStrings(v16, a3, v21);

  [v15 setDataStrings:v17];
  v18 = [v8 peopleInPhoto];
  v19 = [v18 contacts];
  v20 = INIntentSlotValueRedactedContactsFromContacts(v19, a3, v21);

  [v18 setContacts:v20];
  [(INIntent *)self setBackingStore:v8];
}

- (void)setMemoryName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToString(v4);

  [v6 setMemoryName:v5];
}

- (NSString)memoryName
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 memoryName];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (void)setGeographicalFeatures:(id)a3
{
  id v8 = a3;
  id v4 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  id v5 = [v4 geographicalFeatures];

  if (!v5)
  {
    id v5 = objc_alloc_init(_INPBGeographicalFeatureList);
    id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
    [v6 setGeographicalFeatures:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToGeographicalFeatures(v8);
  [(_INPBGeographicalFeatureList *)v5 setGeographicalFeatures:v7];
}

- (int64_t)geographicalFeaturesOperator
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 geographicalFeatures];

  id v4 = [v3 condition];
  int64_t v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (NSArray)geographicalFeatures
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 geographicalFeatures];

  id v4 = [v3 geographicalFeatures];
  int64_t v5 = INIntentSlotValueTransformFromGeographicalFeatures(v4);

  return (NSArray *)v5;
}

- (void)setActivities:(id)a3
{
  id v8 = a3;
  id v4 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  int64_t v5 = [v4 activities];

  if (!v5)
  {
    int64_t v5 = objc_alloc_init(_INPBActivityList);
    id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
    [v6 setActivities:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToActivities(v8);
  [(_INPBActivityList *)v5 setActivities:v7];
}

- (int64_t)activitiesOperator
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 activities];

  id v4 = [v3 condition];
  int64_t v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (NSArray)activities
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 activities];

  id v4 = [v3 activities];
  int64_t v5 = INIntentSlotValueTransformFromActivities(v4);

  return (NSArray *)v5;
}

- (void)setPlaces:(id)a3
{
  id v8 = a3;
  id v4 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  int64_t v5 = [v4 places];

  if (!v5)
  {
    int64_t v5 = objc_alloc_init(_INPBPlaceList);
    id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
    [v6 setPlaces:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToPlaces(v8);
  [(_INPBPlaceList *)v5 setPlaces:v7];
}

- (int64_t)placesOperator
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 places];

  id v4 = [v3 condition];
  int64_t v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (NSArray)places
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 places];

  id v4 = [v3 places];
  int64_t v5 = INIntentSlotValueTransformFromPlaces(v4);

  return (NSArray *)v5;
}

- (void)setEvents:(id)a3
{
  id v8 = a3;
  id v4 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  int64_t v5 = [v4 events];

  if (!v5)
  {
    int64_t v5 = objc_alloc_init(_INPBEventList);
    id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
    [v6 setEvents:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToEvents(v8);
  [(_INPBEventList *)v5 setEvents:v7];
}

- (int64_t)eventsOperator
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 events];

  id v4 = [v3 condition];
  int64_t v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (NSArray)events
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 events];

  id v4 = [v3 events];
  int64_t v5 = INIntentSlotValueTransformFromEvents(v4);

  return (NSArray *)v5;
}

- (void)setPeopleInPhoto:(id)a3
{
  id v8 = a3;
  id v4 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  int64_t v5 = [v4 peopleInPhoto];

  if (!v5)
  {
    int64_t v5 = objc_alloc_init(_INPBContactList);
    id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
    [v6 setPeopleInPhoto:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToContacts(v8);
  [(_INPBContactList *)v5 setContacts:v7];
}

- (INConditionalOperator)peopleInPhotoOperator
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 peopleInPhoto];

  id v4 = [v3 condition];
  INConditionalOperator v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (NSArray)peopleInPhoto
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 peopleInPhoto];

  id v4 = [v3 contacts];
  INConditionalOperator v5 = INIntentSlotValueTransformFromContacts(v4);

  return (NSArray *)v5;
}

- (void)setExcludedAttributes:(unint64_t)a3
{
  INConditionalOperator v5 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  [v5 clearExcludedAttributes];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__INSearchForPhotosIntent_setExcludedAttributes___block_invoke;
  v6[3] = &unk_1E5520C28;
  v6[4] = self;
  INPhotoAttributeOptionsEnumerateBackingTypes(a3, v6);
}

void __49__INSearchForPhotosIntent_setExcludedAttributes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _typedBackingStore];
  [v3 addExcludedAttribute:a2];
}

- (INPhotoAttributeOptions)excludedAttributes
{
  INPhotoAttributeOptions v8 = 0;
  id v3 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  uint64_t v4 = [v3 excludedAttributesCount];

  if (!v4) {
    return 0;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
    INPhotoAttributeOptionsAddBackingType((uint64_t *)&v8, [v6 excludedAttributeAtIndex:i]);
  }
  return v8;
}

- (void)setIncludedAttributes:(unint64_t)a3
{
  INConditionalOperator v5 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  [v5 clearIncludedAttributes];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__INSearchForPhotosIntent_setIncludedAttributes___block_invoke;
  v6[3] = &unk_1E5520C28;
  v6[4] = self;
  INPhotoAttributeOptionsEnumerateBackingTypes(a3, v6);
}

void __49__INSearchForPhotosIntent_setIncludedAttributes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _typedBackingStore];
  [v3 addIncludedAttribute:a2];
}

- (void)setSearchTerms:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  INConditionalOperator v5 = [v4 searchTerm];

  if (!v5)
  {
    INConditionalOperator v5 = objc_alloc_init(_INPBStringList);
    id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
    [v6 setSearchTerm:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToStrings(v8);
  [(_INPBStringList *)v5 setDataStrings:v7];
}

- (NSArray)searchTerms
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  id v3 = [v2 searchTerm];

  uint64_t v4 = [v3 dataStrings];
  INConditionalOperator v5 = INIntentSlotValueTransformFromStrings(v4);

  return (NSArray *)v5;
}

- (NSString)albumName
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  id v3 = [v2 albumName];
  uint64_t v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (void)setLocationCreated:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  INConditionalOperator v5 = INIntentSlotValueTransformToLocation(v4);

  [v6 setLocationCreated:v5];
}

- (INDateComponentsRange)dateCreated
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  id v3 = [v2 dateCreated];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (INSearchForPhotosIntent)initWithDateCreated:(INDateComponentsRange *)dateCreated locationCreated:(CLPlacemark *)locationCreated albumName:(NSString *)albumName searchTerms:(NSArray *)searchTerms includedAttributes:(INPhotoAttributeOptions)includedAttributes excludedAttributes:(INPhotoAttributeOptions)excludedAttributes peopleInPhoto:(NSArray *)peopleInPhoto
{
  v15 = dateCreated;
  v16 = locationCreated;
  v17 = albumName;
  v18 = searchTerms;
  v19 = peopleInPhoto;
  v23.receiver = self;
  v23.super_class = (Class)INSearchForPhotosIntent;
  v20 = [(INIntent *)&v23 init];
  id v21 = v20;
  if (v20)
  {
    [(INSearchForPhotosIntent *)v20 setDateCreated:v15];
    [(INSearchForPhotosIntent *)v21 setLocationCreated:v16];
    [(INSearchForPhotosIntent *)v21 setAlbumName:v17];
    [(INSearchForPhotosIntent *)v21 setSearchTerms:v18];
    [(INSearchForPhotosIntent *)v21 setIncludedAttributes:includedAttributes];
    [(INSearchForPhotosIntent *)v21 setExcludedAttributes:excludedAttributes];
    [(INSearchForPhotosIntent *)v21 setPeopleInPhoto:v19];
  }

  return v21;
}

- (id)_categoryVerb
{
  return @"Search";
}

- (int64_t)_intentCategory
{
  return 9;
}

- (id)_metadata
{
  v2 = [(INSearchForPhotosIntent *)self _typedBackingStore];
  id v3 = [v2 intentMetadata];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end