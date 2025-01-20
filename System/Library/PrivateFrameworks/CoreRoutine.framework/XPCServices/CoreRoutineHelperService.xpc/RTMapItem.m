@interface RTMapItem
+ (BOOL)addressDictionaryContainsContactsKeys:(id)a3;
+ (id)convertAddressDictionaryFromContactsToGeoServices:(id)a3;
+ (id)extendedAttributesFromGEOMapItem:(id)a3 confidenceScalingFactor:(double)a4;
+ (id)extendedAttributesFromGEOMapItem:(id)a3 wifiLabelType:(int64_t)a4 wifiConfidence:(double)a5;
+ (id)locationFromGEOMapItem:(id)a3;
+ (id)nameFromGEOMapItem:(id)a3 fromSource:(unint64_t)a4;
+ (int64_t)labelTypeFromFromGEOMapItem:(id)a3;
+ (unint64_t)mapItemPlaceTypeFromGEOMapItem:(id)a3 source:(unint64_t)a4;
+ (unint64_t)mapItemPlaceTypeFromGEOMapItemPlaceType:(int)a3;
- (RTMapItem)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8 confidenceScalingFactor:(double)a9;
- (RTMapItem)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8 wifiLabelType:(int64_t)a9 wifiConfidence:(double)a10;
- (id)addressFromGeoMapItem:(id)a3;
- (id)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8;
@end

@implementation RTMapItem

- (RTMapItem)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8 confidenceScalingFactor:(double)a9
{
  id v31 = a8;
  id v16 = a7;
  id v33 = a5;
  id v17 = a4;
  id v32 = a3;
  v30 = +[RTMapItem nameFromGEOMapItem:v17 fromSource:a6];
  v29 = [v17 _poiCategory];
  v28 = [(RTMapItem *)self addressFromGeoMapItem:v17];
  v27 = +[RTMapItem locationFromGEOMapItem:v17];
  v18 = +[RTMapItem extendedAttributesFromGEOMapItem:v17 confidenceScalingFactor:a9];
  v19 = [v17 addressObject];
  v20 = [v19 displayLanguage];

  id v21 = [(id)objc_opt_class() mapItemPlaceTypeFromGEOMapItem:v17 source:a6];
  id v22 = [v17 _muid];
  uint64_t v23 = (int)[v17 _resultProviderID];
  LOBYTE(a3) = [v17 isDisputed];

  LOBYTE(v25) = (_BYTE)a3;
  v26 = [(RTMapItem *)self initWithIdentifier:v32 name:v30 category:v29 address:v28 location:v27 source:a6 mapItemPlaceType:v21 muid:v22 resultProviderID:v23 geoMapItemHandle:v33 creationDate:v16 expirationDate:v31 extendedAttributes:v18 displayLanguage:v20 disputed:v25];

  return v26;
}

- (id)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8
{
  return [(RTMapItem *)self initWithIdentifier:a3 geoMapItem:a4 geoMapItemHandle:a5 source:a6 creationDate:a7 expirationDate:a8 confidenceScalingFactor:0.001];
}

- (id)addressFromGeoMapItem:(id)a3
{
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [v3 _additionalPlaceInfos];
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * i) placeType] == 11)
        {
          LODWORD(v5) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if ([v3 _placeType] == 11) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v5;
  }
  v9 = +[NSDate date];
  v10 = [v9 dateByAddingTimeInterval:4838400.0];
  id v11 = objc_alloc((Class)RTAddress);
  v12 = +[NSUUID UUID];
  v13 = [v3 addressObject];
  v14 = [v3 _iso3166CountryCode];
  v15 = [v3 _iso3166SubdivisionCode];
  id v16 = [v11 initWithIdentifier:v12 geoAddressObject:v13 subPremises:0 isIsland:v8 creationDate:v9 expirationDate:v10 iso3166CountryCode:v14 iso3166SubdivisionCode:v15];

  return v16;
}

+ (id)nameFromGEOMapItem:(id)a3 fromSource:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 addressObject];
  v7 = [v6 address];
  uint64_t v8 = [v7 structuredAddress];
  v9 = [v5 name];
  id v10 = [v9 length];

  id v11 = [v8 areaOfInterests];
  id v12 = [v11 count];

  if (v10)
  {
    BOOL v13 = (a4 & 1) != 0 || a4 == 0;
    if (!v13 || v12)
    {
      uint64_t v14 = [v5 name];
      goto LABEL_16;
    }
  }
  if ([v7 hasStructuredAddress])
  {
    if ([v8 hasThoroughfare])
    {
      uint64_t v14 = [v8 thoroughfare];
LABEL_16:
      v15 = (void *)v14;
      goto LABEL_18;
    }
    if ([v8 hasSubLocality])
    {
      uint64_t v14 = [v8 subLocality];
      goto LABEL_16;
    }
    if ([v8 hasLocality])
    {
      uint64_t v14 = [v8 locality];
      goto LABEL_16;
    }
  }
  v15 = 0;
LABEL_18:

  return v15;
}

+ (unint64_t)mapItemPlaceTypeFromGEOMapItem:(id)a3 source:(unint64_t)a4
{
  __int16 v4 = a4;
  id v5 = a3;
  if ((v4 & 0x4000) == 0) {
    goto LABEL_2;
  }
  id v7 = [(id)objc_opt_class() labelTypeFromFromGEOMapItem:v5];
  if (v7)
  {
    if (v7 == (id)2)
    {
      unint64_t v6 = 1;
      goto LABEL_10;
    }
    if (v7 != (id)1) {
      goto LABEL_2;
    }
LABEL_8:
    unint64_t v6 = 2;
    goto LABEL_10;
  }
  if ([v5 _muid]) {
    goto LABEL_8;
  }
LABEL_2:
  unint64_t v6 = (unint64_t)objc_msgSend((id)objc_opt_class(), "mapItemPlaceTypeFromGEOMapItemPlaceType:", objc_msgSend(v5, "_placeType"));
LABEL_10:

  return v6;
}

+ (unint64_t)mapItemPlaceTypeFromGEOMapItemPlaceType:(int)a3
{
  if ((a3 - 1) > 0x13) {
    return 0;
  }
  else {
    return qword_100019208[a3 - 1];
  }
}

+ (id)locationFromGEOMapItem:(id)a3
{
  id v3 = a3;
  __int16 v4 = v3;
  if (v3)
  {
    id v5 = [v3 _clientAttributes];
    unint64_t v6 = [v5 correctedLocationAttributes];
    if ([v6 hasCorrectedCoordinate])
    {
      id v7 = [v4 _clientAttributes];
      uint64_t v8 = [v7 correctedLocationAttributes];
      v9 = [v8 correctedCoordinate];
      [v9 coordinate];
      double v11 = v10;
      double v13 = v12;

      if (v13 >= -180.0 && v13 <= 180.0 && v11 >= -90.0 && v11 <= 90.0)
      {
        id v14 = objc_alloc((Class)RTLocation);
        v15 = [v4 _clientAttributes];
        id v16 = [v15 correctedLocationAttributes];
        id v17 = [v16 correctedCoordinate];
        [v17 lat];
        double v19 = v18;
        long long v20 = [v4 _clientAttributes];
        long long v21 = [v20 correctedLocationAttributes];
        id v22 = [v21 correctedCoordinate];
        [v22 lng];
        id v24 = objc_msgSend(v14, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, objc_msgSend(v4, "referenceFrame"), v19, v23, 1.0);

        goto LABEL_26;
      }
    }
    else
    {
    }
    v15 = +[CLPlacemark placemarkWithGEOMapItem:v4];
    id v16 = [v15 region];
    if (v16)
    {
      id v26 = objc_alloc((Class)RTLocation);
      [v16 center];
      double v28 = v27;
      [v16 center];
      double v30 = v29;
      [v16 radius];
      double v32 = v31;
      id v33 = [v4 referenceFrame];
      v34 = v26;
      double v35 = v28;
      double v36 = v30;
      double v37 = v32;
    }
    else
    {
      [v4 centerCoordinate];
      if (v39 < -180.0 || v39 > 180.0 || v38 < -90.0 || v38 > 90.0)
      {
        [v4 coordinate];
        if (v45 < -180.0 || v45 > 180.0 || v44 < -90.0 || v44 > 90.0)
        {
          v49 = sub_1000071D0(&qword_10002D358);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            int v50 = 136315394;
            v51 = "+[RTMapItem(GeoMapItem) locationFromGEOMapItem:]";
            __int16 v52 = 1024;
            int v53 = 319;
            _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "we should have extracted a coordinate out this map item (in %s:%d)", (uint8_t *)&v50, 0x12u);
          }

          id v24 = 0;
          goto LABEL_26;
        }
        id v40 = objc_alloc((Class)RTLocation);
        [v4 coordinate];
        double v42 = v46;
        [v4 coordinate];
      }
      else
      {
        id v40 = objc_alloc((Class)RTLocation);
        [v4 centerCoordinate];
        double v42 = v41;
        [v4 centerCoordinate];
      }
      double v47 = v43;
      id v33 = [v4 referenceFrame];
      double v37 = 1.0;
      v34 = v40;
      double v35 = v42;
      double v36 = v47;
    }
    id v24 = [v34 initWithLatitude:0 longitude:v33 horizontalUncertainty:v35 date:v36 referenceFrame:v37];
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v25 = sub_1000071D0(&qword_10002D358);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    int v50 = 136315394;
    v51 = "+[RTMapItem(GeoMapItem) locationFromGEOMapItem:]";
    __int16 v52 = 1024;
    int v53 = 281;
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: geoMapItem (in %s:%d)", (uint8_t *)&v50, 0x12u);
  }

  id v24 = 0;
LABEL_27:

  return v24;
}

+ (id)extendedAttributesFromGEOMapItem:(id)a3 confidenceScalingFactor:(double)a4
{
  id v5 = a3;
  unint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 _clientAttributes];
    uint64_t v8 = [v7 addressBookAttributes];
    v9 = [v8 addressIdentifier];

    double v10 = [v6 _clientAttributes];
    double v11 = [v10 addressBookAttributes];
    id v12 = [v11 isMe];

    double v13 = (double)[v6 _wifiFingerprintConfidence] * a4;
    if (v13 < 0.0) {
      double v13 = 0.0;
    }
    double v14 = fmin(v13, 1.0);
    int64_t v15 = +[RTMapItem labelTypeFromFromGEOMapItem:v6];
    if (v9 || (v14 > 0.0 ? (char v19 = 1) : (char v19 = (char)v12), (v19 & 1) != 0 || v15)) {
      id v16 = [objc_alloc((Class)RTMapItemExtendedAttributes) initWithAddressIdentifier:v9 isMe:v12 wifiConfidence:v15 wifiFingerprintLabelType:v14];
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v17 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v20 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: geoMapItem", v20, 2u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (int64_t)labelTypeFromFromGEOMapItem:(id)a3
{
  LODWORD(result) = [a3 _wifiFingerprintLabelType];
  if (result < 3) {
    return result;
  }
  __int16 v4 = sub_1000071D0(&qword_10002D358);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    unint64_t v6 = "+[RTMapItem(GeoMapItem) labelTypeFromFromGEOMapItem:]";
    __int16 v7 = 1024;
    int v8 = 222;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "unknown wifi fingerprint label (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

  return -1;
}

- (RTMapItem)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8 wifiLabelType:(int64_t)a9 wifiConfidence:(double)a10
{
  id v17 = a8;
  id v18 = a7;
  id v37 = a5;
  id v19 = a4;
  id v34 = a3;
  id v33 = +[RTMapItem nameFromGEOMapItem:v19 fromSource:a6];
  double v32 = [v19 _poiCategory];
  double v30 = [(RTMapItem *)self addressFromGeoMapItem:v19];
  double v29 = +[RTMapItem locationFromGEOMapItem:v19];
  long long v20 = +[RTMapItem extendedAttributesFromGEOMapItem:v19 wifiLabelType:a9 wifiConfidence:a10];
  if (a9 == 1) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = a9 == 2;
  }
  id v22 = [v19 addressObject];
  double v23 = [v22 displayLanguage];

  id v24 = [v19 _muid];
  uint64_t v25 = (int)[v19 _resultProviderID];
  unsigned __int8 v26 = [v19 isDisputed];

  LOBYTE(v28) = v26;
  double v36 = [(RTMapItem *)self initWithIdentifier:v34 name:v33 category:v32 address:v30 location:v29 source:a6 mapItemPlaceType:v21 muid:v24 resultProviderID:v25 geoMapItemHandle:v37 creationDate:v18 expirationDate:v17 extendedAttributes:v20 displayLanguage:v23 disputed:v28];

  return v36;
}

+ (id)extendedAttributesFromGEOMapItem:(id)a3 wifiLabelType:(int64_t)a4 wifiConfidence:(double)a5
{
  id v7 = a3;
  int v8 = v7;
  if (v7)
  {
    v9 = [v7 _clientAttributes];
    double v10 = [v9 addressBookAttributes];
    double v11 = [v10 addressIdentifier];

    id v12 = [v8 _clientAttributes];
    double v13 = [v12 addressBookAttributes];
    id v14 = [v13 isMe];

    if (v11 || (a5 <= 0.0 ? (v15 = a4 == 0) : (v15 = 0), !v15 ? (int v16 = 1) : (int v16 = (int)v14), v16 == 1)) {
      id v17 = [objc_alloc((Class)RTMapItemExtendedAttributes) initWithAddressIdentifier:v11 isMe:v14 wifiConfidence:a4 wifiFingerprintLabelType:a5];
    }
    else {
      id v17 = 0;
    }
  }
  else
  {
    id v18 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v20 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: geoMapItem", v20, 2u);
    }

    id v17 = 0;
  }

  return v17;
}

+ (BOOL)addressDictionaryContainsContactsKeys:(id)a3
{
  id v3 = a3;
  __int16 v4 = [v3 allKeys];
  if ([v4 containsObject:CNPostalAddressStreetKey])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unint64_t v6 = [v3 allKeys];
    if ([v6 containsObject:CNPostalAddressCityKey])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      id v7 = [v3 allKeys];
      if ([v7 containsObject:CNPostalAddressStateKey])
      {
        unsigned __int8 v5 = 1;
      }
      else
      {
        int v8 = [v3 allKeys];
        if ([v8 containsObject:CNPostalAddressPostalCodeKey])
        {
          unsigned __int8 v5 = 1;
        }
        else
        {
          v9 = [v3 allKeys];
          if ([v9 containsObject:CNPostalAddressCountryKey])
          {
            unsigned __int8 v5 = 1;
          }
          else
          {
            double v10 = [v3 allKeys];
            unsigned __int8 v5 = [v10 containsObject:CNPostalAddressISOCountryCodeKey];
          }
        }
      }
    }
  }
  return v5;
}

+ (id)convertAddressDictionaryFromContactsToGeoServices:(id)a3
{
  id v3 = a3;
  +[NSMutableDictionary dictionary];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000816C;
  v6[3] = &unk_100024628;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

@end