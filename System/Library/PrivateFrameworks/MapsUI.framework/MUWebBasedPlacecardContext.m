@interface MUWebBasedPlacecardContext
- (MUWebBasedPlacecardContext)initWithMapItemString:(id)a3 formattedAddressLines:(id)a4 locationAddress:(id)a5 traitCollection:(id)a6 guides:(id)a7 placeInShortcuts:(BOOL)a8 numberOfReportsInReview:(unint64_t)a9 userIcon:(id)a10 options:(id)a11 contact:(id)a12 userCanEdit:(BOOL)a13 canShowOpenFindMyAction:(BOOL)a14 canShowRequestLocation:(BOOL)a15 showMoreButton:(BOOL)a16 canShowDownloadOffline:(BOOL)a17;
- (NSDictionary)context;
- (id)_environment;
- (id)_formattedPhoneNumber;
- (id)_osVersion;
- (id)_userArpPhotos;
- (id)_userArpRating;
- (id)_userArpSuggestions;
- (id)_userData;
- (id)_userGuides;
- (id)_userInterfaceIdiom;
- (id)_userLocation;
- (id)_userNotes;
- (id)_userRapsInReview;
@end

@implementation MUWebBasedPlacecardContext

- (MUWebBasedPlacecardContext)initWithMapItemString:(id)a3 formattedAddressLines:(id)a4 locationAddress:(id)a5 traitCollection:(id)a6 guides:(id)a7 placeInShortcuts:(BOOL)a8 numberOfReportsInReview:(unint64_t)a9 userIcon:(id)a10 options:(id)a11 contact:(id)a12 userCanEdit:(BOOL)a13 canShowOpenFindMyAction:(BOOL)a14 canShowRequestLocation:(BOOL)a15 showMoreButton:(BOOL)a16 canShowDownloadOffline:(BOOL)a17
{
  id v36 = a3;
  id v23 = a4;
  id obj = a5;
  id v24 = a5;
  id v33 = a6;
  id v25 = a6;
  id v34 = a7;
  id v37 = a7;
  id v26 = a10;
  id v27 = a11;
  id v28 = a12;
  v38.receiver = self;
  v38.super_class = (Class)MUWebBasedPlacecardContext;
  v29 = [(MUWebBasedPlacecardContext *)&v38 init];
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_mapItemString, a3);
    objc_storeStrong((id *)&v30->_formattedAddressLines, a4);
    objc_storeStrong((id *)&v30->_locationAddress, obj);
    objc_storeStrong((id *)&v30->_traitCollection, v33);
    objc_storeStrong((id *)&v30->_guides, v34);
    v30->_placeInShortcuts = a8;
    v30->_numberOfReportsInReview = a9;
    objc_storeStrong((id *)&v30->_userIcon, a10);
    objc_storeStrong((id *)&v30->_options, a11);
    objc_storeStrong((id *)&v30->_contact, a12);
    v30->_userCanEdit = a13;
    v30->_canShowOpenFindMyAction = a14;
    v30->_canShowRequestLocation = a15;
    v30->_showMoreButton = a16;
    v30->_canShowDownloadOffline = a17;
  }

  return v30;
}

- (NSDictionary)context
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKeyedSubscript:@"locale"];
  }
  v6 = [(MUWebBasedPlacecardContext *)self _userLocation];
  [v4 setObject:v6 forKeyedSubscript:@"userLocation"];

  v7 = [(MUWebBasedPlacecardContext *)self _userData];
  [v4 setObject:v7 forKeyedSubscript:@"userData"];

  v8 = [(MUWebBasedPlacecardContext *)self _userInterfaceIdiom];
  [v4 setObject:v8 forKeyedSubscript:@"uiIdiom"];

  v9 = [(MUWebBasedPlacecardContext *)self _osVersion];
  [v4 setObject:v9 forKeyedSubscript:@"osVersion"];

  v10 = [(MUWebBasedPlacecardContext *)self _environment];
  [v4 setObject:v10 forKeyedSubscript:@"environment"];

  [v4 setObject:self->_mapItemString forKeyedSubscript:@"place"];
  [v4 setObject:self->_formattedAddressLines forKeyedSubscript:@"formattedAddressLines"];
  [v4 setObject:self->_locationAddress forKeyedSubscript:@"locationAddress"];
  [v4 setObject:self->_options forKeyedSubscript:@"placeItemOption"];
  v11 = [(MUWebBasedPlacecardContext *)self _formattedPhoneNumber];
  [v4 setObject:v11 forKeyedSubscript:@"formattedPhoneNumber"];

  v12 = [NSNumber numberWithBool:self->_userCanEdit];
  [v4 setObject:v12 forKeyedSubscript:@"userCanEdit"];

  v13 = [NSNumber numberWithBool:self->_canShowOpenFindMyAction];
  [v4 setObject:v13 forKeyedSubscript:@"canShowOpenFindMyAction"];

  v14 = [NSNumber numberWithBool:self->_canShowRequestLocation];
  [v4 setObject:v14 forKeyedSubscript:@"canShowRequestLocation"];

  v15 = [NSNumber numberWithBool:self->_showMoreButton];
  [v4 setObject:v15 forKeyedSubscript:@"showMoreButton"];

  v16 = [NSNumber numberWithBool:self->_canShowDownloadOffline];
  [v4 setObject:v16 forKeyedSubscript:@"canShowDownloadOffline"];

  v17 = (void *)[v4 copy];
  return (NSDictionary *)v17;
}

- (id)_userLocation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = NSNumber;
  v4 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
  v5 = [v4 currentLocation];
  v6 = [v5 latLng];
  [v6 lat];
  v7 = objc_msgSend(v3, "numberWithDouble:");
  [v2 setObject:v7 forKeyedSubscript:@"latitude"];

  v8 = NSNumber;
  v9 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
  v10 = [v9 currentLocation];
  v11 = [v10 latLng];
  [v11 lng];
  v12 = objc_msgSend(v8, "numberWithDouble:");
  [v2 setObject:v12 forKeyedSubscript:@"longitude"];

  v13 = (void *)[v2 copy];
  return v13;
}

- (id)_userData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [NSNumber numberWithBool:self->_placeInShortcuts];
  [v3 setObject:v4 forKeyedSubscript:@"favorites"];

  v5 = [(MUWebBasedPlacecardContext *)self _userGuides];
  [v3 setObject:v5 forKeyedSubscript:@"guides"];

  v6 = [(MUWebBasedPlacecardContext *)self _userRapsInReview];
  [v3 setObject:v6 forKeyedSubscript:@"rapsInReview"];

  v7 = (void *)[v3 copy];
  return v7;
}

- (id)_userInterfaceIdiom
{
  UIUserInterfaceIdiom v2 = [(UITraitCollection *)self->_traitCollection userInterfaceIdiom];
  if ((unint64_t)(v2 + 1) > 7) {
    return @"phone";
  }
  else {
    return off_1E574FFF0[v2 + 1];
  }
}

- (id)_osVersion
{
  UIUserInterfaceIdiom v2 = [MEMORY[0x1E4F64860] sharedPlatform];
  id v3 = [v2 osAndBuildVersion];

  return v3;
}

- (id)_environment
{
  if (+[MapsUIUtilities isMapsProcess]) {
    return @"Maps";
  }
  if (+[MapsUIUtilities isSafariProcess]) {
    return @"Safari";
  }
  if (+[MapsUIUtilities isSiriProcess]) {
    return @"Siri";
  }
  if (+[MapsUIUtilities isSpotlightProcess]) {
    return @"Spotlight";
  }
  return &stru_1EE3BF360;
}

- (id)_userGuides
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = self->_guides;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v10 = [v8 title];
        [v9 setObject:v10 forKeyedSubscript:@"title"];

        v11 = [v8 guideID];
        [v9 setObject:v11 forKeyedSubscript:@"guideID"];

        v12 = [v8 image];
        [v9 setObject:v12 forKeyedSubscript:@"image"];

        v13 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v8, "numberOfPlaces"));
        [v9 setObject:v13 forKeyedSubscript:@"numberOfPlaces"];
        [v3 addObject:v9];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  v14 = (void *)[v3 copy];
  return v14;
}

- (id)_userRapsInReview
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_userIcon forKeyedSubscript:@"userImage"];
  uint64_t v4 = [NSNumber numberWithUnsignedLong:self->_numberOfReportsInReview];
  [v3 setObject:v4 forKeyedSubscript:@"count"];

  uint64_t v5 = (void *)[v3 copy];
  return v5;
}

- (id)_formattedPhoneNumber
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  UIUserInterfaceIdiom v2 = [(CNContact *)self->_contact phoneNumbers];
  memset(v6, 0, sizeof(v6));
  if ([v2 countByEnumeratingWithState:v6 objects:v7 count:16])
  {
    id v3 = [[MUContactLabeledValue alloc] initWithContactLabeledValue:**((void **)&v6[0] + 1) type:1];
    uint64_t v4 = [(MUContactLabeledValue *)v3 valueString];
  }
  else
  {
    uint64_t v4 = &stru_1EE3BF360;
  }

  return v4;
}

- (id)_userArpRating
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)_userArpPhotos
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)_userNotes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)_userArpSuggestions
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = (void *)[v2 copy];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userIcon, 0);
  objc_storeStrong((id *)&self->_guides, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_locationAddress, 0);
  objc_storeStrong((id *)&self->_formattedAddressLines, 0);
  objc_storeStrong((id *)&self->_mapItemString, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end