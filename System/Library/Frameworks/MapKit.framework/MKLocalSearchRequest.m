@interface MKLocalSearchRequest
+ (MKLocalSearchRequest)searchRequestWithCompletion:(id)a3;
- (BOOL)_allowPhoneNumberLookupUsingCellular;
- (BOOL)_hasRegion;
- (BOOL)hasSentFeedbackForCompletion;
- (CLLocation)_deviceLocation;
- (GEOCompletionItem)geoCompletionItem;
- (MKAddressFilter)addressFilter;
- (MKCoordinateRegion)region;
- (MKLocalSearchRequest)init;
- (MKLocalSearchRequest)initWithCompletion:(MKLocalSearchCompletion *)completion;
- (MKLocalSearchRequest)initWithMapsURL:(id)a3;
- (MKLocalSearchRequest)initWithNaturalLanguageQuery:(NSString *)naturalLanguageQuery;
- (MKLocalSearchRequest)initWithNaturalLanguageQuery:(NSString *)naturalLanguageQuery region:(MKCoordinateRegion)region;
- (MKLocalSearchResultType)resultTypes;
- (MKPointOfInterestFilter)pointOfInterestFilter;
- (NSArray)_muids;
- (NSArray)_phoneNumbers;
- (NSString)_canonicalSearchString;
- (NSString)_contactsDataString;
- (NSString)naturalLanguageQuery;
- (_MKLocalSearchExternalTransitLookupParameters)_externalTransitLookupParameters;
- (_MKLocalSearchMerchantParameters)_merchantParameters;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)_resultProviderID;
- (int64_t)regionPriority;
- (void)_setAllowPhoneNumberLookupUsingCellular:(BOOL)a3;
- (void)_setCanonicalSearchString:(id)a3;
- (void)_setContactsDataString:(id)a3;
- (void)_setDeviceLocation:(id)a3;
- (void)_setExternalTransitLookupParameters:(id)a3;
- (void)_setMerchantParameters:(id)a3;
- (void)_setMuids:(id)a3;
- (void)_setPhoneNumbers:(id)a3;
- (void)_setResultProviderID:(int)a3;
- (void)setAddressFilter:(id)a3;
- (void)setHasSentFeedbackForCompletion:(BOOL)a3;
- (void)setNaturalLanguageQuery:(NSString *)naturalLanguageQuery;
- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter;
- (void)setRegion:(MKCoordinateRegion)region;
- (void)setRegionPriority:(int64_t)a3;
- (void)setResultTypes:(MKLocalSearchResultType)resultTypes;
@end

@implementation MKLocalSearchRequest

- (void)_setAllowPhoneNumberLookupUsingCellular:(BOOL)a3
{
  self->_allowPhoneNumberLookupUsingCellular = a3;
}

- (void)_setPhoneNumbers:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_naturalLanguageQuery copy];
  v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  *(unsigned char *)(v4 + 16) = self->_hasRegion;
  CLLocationCoordinate2D center = self->_region.center;
  *($2AEA816EAF9616B0E64737FB4BB06332 *)(v4 + 40) = self->_region.span;
  *(CLLocationCoordinate2D *)(v4 + 24) = center;
  *(void *)(v4 + 128) = self->_regionPriority;
  objc_storeStrong((id *)(v4 + 64), self->_geoCompletionItem);
  uint64_t v8 = [(CLLocation *)self->_deviceLocation copy];
  v9 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v8;

  uint64_t v10 = [(_MKLocalSearchMerchantParameters *)self->_merchantParameters copy];
  v11 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v10;

  uint64_t v12 = [(_MKLocalSearchExternalTransitLookupParameters *)self->_externalTransitLookupParameters copy];
  v13 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v12;

  uint64_t v14 = [(NSArray *)self->_phoneNumbers copy];
  v15 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v14;

  uint64_t v16 = [(NSArray *)self->_muids copy];
  v17 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v16;

  *(_DWORD *)(v4 + 60) = self->_resultProviderID;
  uint64_t v18 = [(NSString *)self->_canonicalSearchString copy];
  v19 = *(void **)(v4 + 120);
  *(void *)(v4 + 120) = v18;

  *(unsigned char *)(v4 + 57) = self->_hasSentFeedbackForCompletion;
  uint64_t v20 = [(MKPointOfInterestFilter *)self->_pointOfInterestFilter copy];
  v21 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v20;

  uint64_t v22 = [(MKAddressFilter *)self->_addressFilter copy];
  v23 = *(void **)(v4 + 152);
  *(void *)(v4 + 152) = v22;

  *(void *)(v4 + 136) = self->_resultTypes;
  return (id)v4;
}

- (MKLocalSearchRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MKLocalSearchRequest;
  return [(MKLocalSearchRequest *)&v3 init];
}

- (NSArray)_phoneNumbers
{
  return self->_phoneNumbers;
}

- (_MKLocalSearchMerchantParameters)_merchantParameters
{
  return self->_merchantParameters;
}

- (_MKLocalSearchExternalTransitLookupParameters)_externalTransitLookupParameters
{
  return self->_externalTransitLookupParameters;
}

- (BOOL)_allowPhoneNumberLookupUsingCellular
{
  return self->_allowPhoneNumberLookupUsingCellular;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressFilter, 0);
  objc_storeStrong((id *)&self->_pointOfInterestFilter, 0);
  objc_storeStrong((id *)&self->_canonicalSearchString, 0);
  objc_storeStrong((id *)&self->_contactsDataString, 0);
  objc_storeStrong((id *)&self->_muids, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_externalTransitLookupParameters, 0);
  objc_storeStrong((id *)&self->_merchantParameters, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);
  objc_storeStrong((id *)&self->_geoCompletionItem, 0);

  objc_storeStrong((id *)&self->_naturalLanguageQuery, 0);
}

+ (MKLocalSearchRequest)searchRequestWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[MKLocalSearchRequest alloc] initWithCompletion:v3];

  return v4;
}

- (MKLocalSearchRequest)initWithCompletion:(MKLocalSearchCompletion *)completion
{
  uint64_t v4 = completion;
  v11.receiver = self;
  v11.super_class = (Class)MKLocalSearchRequest;
  uint64_t v5 = [(MKLocalSearchRequest *)&v11 init];
  if (v5)
  {
    v6 = [(MKLocalSearchCompletion *)v4 queryLine];
    [(MKLocalSearchRequest *)v5 setNaturalLanguageQuery:v6];

    uint64_t v7 = [(MKLocalSearchCompletion *)v4 geoCompletionItem];
    geoCompletionItem = v5->_geoCompletionItem;
    v5->_geoCompletionItem = (GEOCompletionItem *)v7;

    v5->_hasSentFeedbackForCompletion = [(MKLocalSearchCompletion *)v4 _alreadySentFeedback];
    v9 = v5;
  }

  return v5;
}

- (MKLocalSearchRequest)initWithNaturalLanguageQuery:(NSString *)naturalLanguageQuery
{
  uint64_t v4 = naturalLanguageQuery;
  uint64_t v5 = [(MKLocalSearchRequest *)self init];
  v6 = v5;
  if (v5)
  {
    [(MKLocalSearchRequest *)v5 setNaturalLanguageQuery:v4];
    uint64_t v7 = v6;
  }

  return v6;
}

- (MKLocalSearchRequest)initWithNaturalLanguageQuery:(NSString *)naturalLanguageQuery region:(MKCoordinateRegion)region
{
  double longitudeDelta = region.span.longitudeDelta;
  double latitudeDelta = region.span.latitudeDelta;
  double longitude = region.center.longitude;
  double latitude = region.center.latitude;
  v9 = naturalLanguageQuery;
  uint64_t v10 = [(MKLocalSearchRequest *)self init];
  objc_super v11 = v10;
  if (v10)
  {
    [(MKLocalSearchRequest *)v10 setNaturalLanguageQuery:v9];
    -[MKLocalSearchRequest setRegion:](v11, "setRegion:", latitude, longitude, latitudeDelta, longitudeDelta);
    uint64_t v12 = v11;
  }

  return v11;
}

- (MKLocalSearchRequest)initWithMapsURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(MKLocalSearchRequest *)self init];
  if (v6)
  {
    if (!v5)
    {
      p_super = GEOFindOrCreateLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v15 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        v24 = v15;
        _os_log_impl(&dword_18BAEC000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ called with nil for a URL", buf, 0xCu);
      }
      goto LABEL_19;
    }
    uint64_t v7 = [[_MKURLParser alloc] initWithURL:v5];
    if (!v7)
    {
      uint64_t v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543618;
        v24 = v17;
        __int16 v25 = 2114;
        id v26 = v5;
        _os_log_impl(&dword_18BAEC000, v16, OS_LOG_TYPE_ERROR, "%{public}@ could not build a parser for %{public}@", buf, 0x16u);
      }
      p_super = 0;
      goto LABEL_19;
    }
    p_super = &v7->super;
    if ([(_MKURLParser *)v7 parseIncludingCustomParameters:0])
    {
      uint64_t v9 = [p_super searchUID];
      uint64_t v10 = [p_super searchProviderID];
      if (v9)
      {
        uint64_t v11 = v10;
        uint64_t v12 = [NSNumber numberWithUnsignedLongLong:v9];
        uint64_t v22 = v12;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
        [(MKLocalSearchRequest *)v6 _setMuids:v13];

        [(MKLocalSearchRequest *)v6 _setResultProviderID:v11];
        uint64_t v14 = v6;
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v18 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      __int16 v25 = 2114;
      id v26 = v5;
      uint64_t v20 = "%{public}@ could not find a muid in %{public}@";
    }
    else
    {
      uint64_t v18 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

LABEL_19:
        uint64_t v14 = 0;
        goto LABEL_20;
      }
      v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      __int16 v25 = 2114;
      id v26 = v5;
      uint64_t v20 = "%{public}@ failed parsing %{public}@";
    }
    _os_log_impl(&dword_18BAEC000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);

    goto LABEL_18;
  }
  uint64_t v14 = 0;
LABEL_21:

  return v14;
}

- (id)_dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = v3;
  naturalLanguageQuery = self->_naturalLanguageQuery;
  if (naturalLanguageQuery) {
    [v3 setObject:naturalLanguageQuery forKey:@"naturalLanguageQuery"];
  }
  if (self->_hasRegion)
  {
    double latitudeDelta = self->_region.span.latitudeDelta;
    double longitudeDelta = self->_region.span.longitudeDelta;
    uint64_t v8 = NSString;
    uint64_t v9 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&self->_region.center.latitude, *(void *)&self->_region.center.longitude];
    uint64_t v10 = [v8 stringWithFormat:@"<center:%@ span:%+.8f, %+.8f>", v9, *(void *)&latitudeDelta, *(void *)&longitudeDelta];

    [v4 setObject:v10 forKey:@"region"];
    uint64_t v11 = [NSNumber numberWithInteger:self->_regionPriority];
    [v4 setObject:v11 forKey:@"regionPriority"];
  }
  geoCompletionItem = self->_geoCompletionItem;
  if (geoCompletionItem) {
    [v4 setObject:geoCompletionItem forKey:@"completionItem"];
  }
  deviceLocation = self->_deviceLocation;
  if (deviceLocation) {
    [v4 setObject:deviceLocation forKey:@"deviceLocation"];
  }
  merchantParameters = self->_merchantParameters;
  if (merchantParameters) {
    [v4 setObject:merchantParameters forKey:@"merchantParameters"];
  }
  externalTransitLookupParameters = self->_externalTransitLookupParameters;
  if (externalTransitLookupParameters) {
    [v4 setObject:externalTransitLookupParameters forKey:@"externalTransitLookupParameters"];
  }
  phoneNumbers = self->_phoneNumbers;
  if (phoneNumbers) {
    [v4 setObject:phoneNumbers forKey:@"phoneNumbers"];
  }
  muids = self->_muids;
  if (muids) {
    [v4 setObject:muids forKey:@"muids"];
  }
  if (self->_resultProviderID)
  {
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:");
    [v4 setObject:v18 forKey:@"resultProviderID"];
  }
  canonicalSearchString = self->_canonicalSearchString;
  if (canonicalSearchString) {
    [v4 setObject:canonicalSearchString forKey:@"canonicalSearchString"];
  }
  if (self->_resultTypes)
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v4 setObject:v20 forKey:@"resultTypes"];
  }
  pointOfInterestFilter = self->_pointOfInterestFilter;
  if (pointOfInterestFilter) {
    [v4 setObject:pointOfInterestFilter forKey:@"pointOfInterestFilter"];
  }
  addressFilter = self->_addressFilter;
  if (addressFilter) {
    [v4 setObject:addressFilter forKey:@"addressFilter"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MKLocalSearchRequest;
  uint64_t v4 = [(MKLocalSearchRequest *)&v8 description];
  id v5 = [(MKLocalSearchRequest *)self _dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setRegion:(MKCoordinateRegion)region
{
  self->_region = ($787999B08D62D8BBAAF19AF74A688926)region;
  self->_hasRegion = 1;
}

- (void)_setContactsDataString:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_contactsDataString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_contactsDataString, a3);
    +[MKMapItem _fillOutRequest:self withMapsDataString:self->_contactsDataString];
  }
}

- (NSString)naturalLanguageQuery
{
  return self->_naturalLanguageQuery;
}

- (void)setNaturalLanguageQuery:(NSString *)naturalLanguageQuery
{
}

- (MKCoordinateRegion)region
{
  double latitude = self->_region.center.latitude;
  double longitude = self->_region.center.longitude;
  double latitudeDelta = self->_region.span.latitudeDelta;
  double longitudeDelta = self->_region.span.longitudeDelta;
  result.span.double longitudeDelta = longitudeDelta;
  result.span.double latitudeDelta = latitudeDelta;
  result.center.double longitude = longitude;
  result.center.double latitude = latitude;
  return result;
}

- (BOOL)_hasRegion
{
  return self->_hasRegion;
}

- (GEOCompletionItem)geoCompletionItem
{
  return self->_geoCompletionItem;
}

- (CLLocation)_deviceLocation
{
  return self->_deviceLocation;
}

- (void)_setDeviceLocation:(id)a3
{
}

- (void)_setMerchantParameters:(id)a3
{
}

- (void)_setExternalTransitLookupParameters:(id)a3
{
}

- (NSArray)_muids
{
  return self->_muids;
}

- (void)_setMuids:(id)a3
{
}

- (int)_resultProviderID
{
  return self->_resultProviderID;
}

- (void)_setResultProviderID:(int)a3
{
  self->_resultProviderID = a3;
}

- (NSString)_contactsDataString
{
  return self->_contactsDataString;
}

- (NSString)_canonicalSearchString
{
  return self->_canonicalSearchString;
}

- (void)_setCanonicalSearchString:(id)a3
{
}

- (BOOL)hasSentFeedbackForCompletion
{
  return self->_hasSentFeedbackForCompletion;
}

- (void)setHasSentFeedbackForCompletion:(BOOL)a3
{
  self->_hasSentFeedbackForCompletion = a3;
}

- (int64_t)regionPriority
{
  return self->_regionPriority;
}

- (void)setRegionPriority:(int64_t)a3
{
  self->_regionPriority = a3;
}

- (MKLocalSearchResultType)resultTypes
{
  return self->_resultTypes;
}

- (void)setResultTypes:(MKLocalSearchResultType)resultTypes
{
  self->_resultTypes = resultTypes;
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
}

- (MKAddressFilter)addressFilter
{
  return self->_addressFilter;
}

- (void)setAddressFilter:(id)a3
{
}

@end