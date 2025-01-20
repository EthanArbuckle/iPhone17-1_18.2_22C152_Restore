@interface _INPBSearchForPhotosIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasActivities;
- (BOOL)hasAlbumName;
- (BOOL)hasDateCreated;
- (BOOL)hasEvents;
- (BOOL)hasGeographicalFeatures;
- (BOOL)hasIntentMetadata;
- (BOOL)hasLocationCreated;
- (BOOL)hasMemoryName;
- (BOOL)hasPeopleInPhoto;
- (BOOL)hasPlaces;
- (BOOL)hasSearchTerm;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBActivityList)activities;
- (_INPBContactList)peopleInPhoto;
- (_INPBDateTimeRange)dateCreated;
- (_INPBEventList)events;
- (_INPBGeographicalFeatureList)geographicalFeatures;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBLocation)locationCreated;
- (_INPBPlaceList)places;
- (_INPBSearchForPhotosIntent)initWithCoder:(id)a3;
- (_INPBString)albumName;
- (_INPBString)memoryName;
- (_INPBStringList)searchTerm;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)excludedAttributesAsString:(int)a3;
- (id)includedAttributesAsString:(int)a3;
- (int)StringAsExcludedAttributes:(id)a3;
- (int)StringAsIncludedAttributes:(id)a3;
- (int)excludedAttributeAtIndex:(unint64_t)a3;
- (int)excludedAttributes;
- (int)includedAttributeAtIndex:(unint64_t)a3;
- (int)includedAttributes;
- (unint64_t)excludedAttributesCount;
- (unint64_t)hash;
- (unint64_t)includedAttributesCount;
- (void)addExcludedAttribute:(int)a3;
- (void)addIncludedAttribute:(int)a3;
- (void)clearExcludedAttributes;
- (void)clearIncludedAttributes;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActivities:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setEvents:(id)a3;
- (void)setExcludedAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setGeographicalFeatures:(id)a3;
- (void)setIncludedAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setIntentMetadata:(id)a3;
- (void)setLocationCreated:(id)a3;
- (void)setMemoryName:(id)a3;
- (void)setPeopleInPhoto:(id)a3;
- (void)setPlaces:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForPhotosIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_peopleInPhoto, 0);
  objc_storeStrong((id *)&self->_memoryName, 0);
  objc_storeStrong((id *)&self->_locationCreated, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_geographicalFeatures, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_albumName, 0);

  objc_storeStrong((id *)&self->_activities, 0);
}

- (_INPBStringList)searchTerm
{
  return self->_searchTerm;
}

- (_INPBPlaceList)places
{
  return self->_places;
}

- (_INPBContactList)peopleInPhoto
{
  return self->_peopleInPhoto;
}

- (_INPBString)memoryName
{
  return self->_memoryName;
}

- (_INPBLocation)locationCreated
{
  return self->_locationCreated;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBGeographicalFeatureList)geographicalFeatures
{
  return self->_geographicalFeatures;
}

- (_INPBEventList)events
{
  return self->_events;
}

- (_INPBDateTimeRange)dateCreated
{
  return self->_dateCreated;
}

- (_INPBString)albumName
{
  return self->_albumName;
}

- (_INPBActivityList)activities
{
  return self->_activities;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSearchForPhotosIntent *)self activities];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"activities"];

  v6 = [(_INPBSearchForPhotosIntent *)self albumName];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"albumName"];

  v8 = [(_INPBSearchForPhotosIntent *)self dateCreated];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"dateCreated"];

  v10 = [(_INPBSearchForPhotosIntent *)self events];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"events"];

  if (self->_excludedAttributes.count)
  {
    v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBSearchForPhotosIntent excludedAttributesCount](self, "excludedAttributesCount"));
    if ([(_INPBSearchForPhotosIntent *)self excludedAttributesCount])
    {
      unint64_t v13 = 0;
      do
      {
        int v14 = self->_excludedAttributes.list[v13];
        if (v14 <= 49)
        {
          v15 = @"PHOTO";
          switch(v14)
          {
            case 2:
              break;
            case 3:
              v15 = @"VIDEO";
              break;
            case 4:
              v15 = @"GIF";
              break;
            case 10:
              v15 = @"FLASH";
              break;
            case 11:
              v15 = @"LANDSCAPE_ORIENTATION";
              break;
            case 12:
              v15 = @"PORTRAIT_ORIENTATION";
              break;
            case 13:
              v15 = @"FAVORITE";
              break;
            case 14:
              v15 = @"SELFIE";
              break;
            case 15:
              v15 = @"FRONT_FACING_CAMERA";
              break;
            case 16:
              v15 = @"SCREENSHOT";
              break;
            default:
LABEL_39:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_excludedAttributes.list[v13]);
              v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
        }
        else if (v14 > 80)
        {
          switch(v14)
          {
            case 300:
              v15 = @"NOIR_FILTER";
              break;
            case 301:
              v15 = @"CHROME_FILTER";
              break;
            case 302:
              v15 = @"INSTANT_FILTER";
              break;
            case 303:
              v15 = @"TONAL_FILTER";
              break;
            case 304:
              v15 = @"TRANSFER_FILTER";
              break;
            case 305:
              v15 = @"MONO_FILTER";
              break;
            case 306:
              v15 = @"FADE_FILTER";
              break;
            case 307:
              v15 = @"PROCESS_FILTER";
              break;
            default:
              if (v14 != 81) {
                goto LABEL_39;
              }
              v15 = @"SLOW_MOTION_VIDEO";
              break;
          }
        }
        else
        {
          switch(v14)
          {
            case '2':
              v15 = @"BURST_PHOTO";
              break;
            case '3':
              v15 = @"HDR_PHOTO";
              break;
            case '4':
              v15 = @"SQUARE_PHOTO";
              break;
            case '5':
              v15 = @"PANORAMA_PHOTO";
              break;
            case '6':
              v15 = @"PORTRAIT_PHOTO";
              break;
            case '7':
              v15 = @"LIVE_PHOTO";
              break;
            case '8':
              v15 = @"LOOP_PHOTO";
              break;
            case '9':
              v15 = @"BOUNCE_PHOTO";
              break;
            case ':':
              v15 = @"LONG_EXPOSURE_PHOTO";
              break;
            default:
              if (v14 != 80) {
                goto LABEL_39;
              }
              v15 = @"TIME_LAPSE_VIDEO";
              break;
          }
        }
        [v12 addObject:v15];

        ++v13;
      }
      while (v13 < [(_INPBSearchForPhotosIntent *)self excludedAttributesCount]);
    }
    [v3 setObject:v12 forKeyedSubscript:@"excludedAttribute"];
  }
  v16 = [(_INPBSearchForPhotosIntent *)self geographicalFeatures];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"geographicalFeatures"];

  if (self->_includedAttributes.count)
  {
    v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBSearchForPhotosIntent includedAttributesCount](self, "includedAttributesCount"));
    if ([(_INPBSearchForPhotosIntent *)self includedAttributesCount])
    {
      unint64_t v19 = 0;
      do
      {
        int v20 = self->_includedAttributes.list[v19];
        if (v20 <= 49)
        {
          v21 = @"PHOTO";
          switch(v20)
          {
            case 2:
              break;
            case 3:
              v21 = @"VIDEO";
              break;
            case 4:
              v21 = @"GIF";
              break;
            case 10:
              v21 = @"FLASH";
              break;
            case 11:
              v21 = @"LANDSCAPE_ORIENTATION";
              break;
            case 12:
              v21 = @"PORTRAIT_ORIENTATION";
              break;
            case 13:
              v21 = @"FAVORITE";
              break;
            case 14:
              v21 = @"SELFIE";
              break;
            case 15:
              v21 = @"FRONT_FACING_CAMERA";
              break;
            case 16:
              v21 = @"SCREENSHOT";
              break;
            default:
LABEL_80:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_includedAttributes.list[v19]);
              v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
        }
        else if (v20 > 80)
        {
          switch(v20)
          {
            case 300:
              v21 = @"NOIR_FILTER";
              break;
            case 301:
              v21 = @"CHROME_FILTER";
              break;
            case 302:
              v21 = @"INSTANT_FILTER";
              break;
            case 303:
              v21 = @"TONAL_FILTER";
              break;
            case 304:
              v21 = @"TRANSFER_FILTER";
              break;
            case 305:
              v21 = @"MONO_FILTER";
              break;
            case 306:
              v21 = @"FADE_FILTER";
              break;
            case 307:
              v21 = @"PROCESS_FILTER";
              break;
            default:
              if (v20 != 81) {
                goto LABEL_80;
              }
              v21 = @"SLOW_MOTION_VIDEO";
              break;
          }
        }
        else
        {
          switch(v20)
          {
            case '2':
              v21 = @"BURST_PHOTO";
              break;
            case '3':
              v21 = @"HDR_PHOTO";
              break;
            case '4':
              v21 = @"SQUARE_PHOTO";
              break;
            case '5':
              v21 = @"PANORAMA_PHOTO";
              break;
            case '6':
              v21 = @"PORTRAIT_PHOTO";
              break;
            case '7':
              v21 = @"LIVE_PHOTO";
              break;
            case '8':
              v21 = @"LOOP_PHOTO";
              break;
            case '9':
              v21 = @"BOUNCE_PHOTO";
              break;
            case ':':
              v21 = @"LONG_EXPOSURE_PHOTO";
              break;
            default:
              if (v20 != 80) {
                goto LABEL_80;
              }
              v21 = @"TIME_LAPSE_VIDEO";
              break;
          }
        }
        [v18 addObject:v21];

        ++v19;
      }
      while (v19 < [(_INPBSearchForPhotosIntent *)self includedAttributesCount]);
    }
    [v3 setObject:v18 forKeyedSubscript:@"includedAttribute"];
  }
  v22 = [(_INPBSearchForPhotosIntent *)self intentMetadata];
  v23 = [v22 dictionaryRepresentation];
  [v3 setObject:v23 forKeyedSubscript:@"intentMetadata"];

  v24 = [(_INPBSearchForPhotosIntent *)self locationCreated];
  v25 = [v24 dictionaryRepresentation];
  [v3 setObject:v25 forKeyedSubscript:@"locationCreated"];

  v26 = [(_INPBSearchForPhotosIntent *)self memoryName];
  v27 = [v26 dictionaryRepresentation];
  [v3 setObject:v27 forKeyedSubscript:@"memoryName"];

  v28 = [(_INPBSearchForPhotosIntent *)self peopleInPhoto];
  v29 = [v28 dictionaryRepresentation];
  [v3 setObject:v29 forKeyedSubscript:@"peopleInPhoto"];

  v30 = [(_INPBSearchForPhotosIntent *)self places];
  v31 = [v30 dictionaryRepresentation];
  [v3 setObject:v31 forKeyedSubscript:@"places"];

  v32 = [(_INPBSearchForPhotosIntent *)self searchTerm];
  v33 = [v32 dictionaryRepresentation];
  [v3 setObject:v33 forKeyedSubscript:@"searchTerm"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBActivityList *)self->_activities hash];
  unint64_t v4 = [(_INPBString *)self->_albumName hash] ^ v3;
  unint64_t v5 = [(_INPBDateTimeRange *)self->_dateCreated hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBEventList *)self->_events hash];
  uint64_t v7 = PBRepeatedInt32Hash();
  unint64_t v8 = v7 ^ [(_INPBGeographicalFeatureList *)self->_geographicalFeatures hash];
  uint64_t v9 = v6 ^ v8 ^ PBRepeatedInt32Hash();
  unint64_t v10 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v11 = v10 ^ [(_INPBLocation *)self->_locationCreated hash];
  unint64_t v12 = v11 ^ [(_INPBString *)self->_memoryName hash];
  unint64_t v13 = v9 ^ v12 ^ [(_INPBContactList *)self->_peopleInPhoto hash];
  unint64_t v14 = [(_INPBPlaceList *)self->_places hash];
  return v13 ^ v14 ^ [(_INPBStringList *)self->_searchTerm hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_59;
  }
  unint64_t v5 = [(_INPBSearchForPhotosIntent *)self activities];
  unint64_t v6 = [v4 activities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_58;
  }
  uint64_t v7 = [(_INPBSearchForPhotosIntent *)self activities];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBSearchForPhotosIntent *)self activities];
    unint64_t v10 = [v4 activities];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForPhotosIntent *)self albumName];
  unint64_t v6 = [v4 albumName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_58;
  }
  uint64_t v12 = [(_INPBSearchForPhotosIntent *)self albumName];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_INPBSearchForPhotosIntent *)self albumName];
    v15 = [v4 albumName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForPhotosIntent *)self dateCreated];
  unint64_t v6 = [v4 dateCreated];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_58;
  }
  uint64_t v17 = [(_INPBSearchForPhotosIntent *)self dateCreated];
  if (v17)
  {
    v18 = (void *)v17;
    unint64_t v19 = [(_INPBSearchForPhotosIntent *)self dateCreated];
    int v20 = [v4 dateCreated];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForPhotosIntent *)self events];
  unint64_t v6 = [v4 events];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_58;
  }
  uint64_t v22 = [(_INPBSearchForPhotosIntent *)self events];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBSearchForPhotosIntent *)self events];
    v25 = [v4 events];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_59;
  }
  unint64_t v5 = [(_INPBSearchForPhotosIntent *)self geographicalFeatures];
  unint64_t v6 = [v4 geographicalFeatures];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_58;
  }
  uint64_t v27 = [(_INPBSearchForPhotosIntent *)self geographicalFeatures];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBSearchForPhotosIntent *)self geographicalFeatures];
    v30 = [v4 geographicalFeatures];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_59;
  }
  unint64_t v5 = [(_INPBSearchForPhotosIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_58;
  }
  uint64_t v32 = [(_INPBSearchForPhotosIntent *)self intentMetadata];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBSearchForPhotosIntent *)self intentMetadata];
    v35 = [v4 intentMetadata];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForPhotosIntent *)self locationCreated];
  unint64_t v6 = [v4 locationCreated];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_58;
  }
  uint64_t v37 = [(_INPBSearchForPhotosIntent *)self locationCreated];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_INPBSearchForPhotosIntent *)self locationCreated];
    v40 = [v4 locationCreated];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForPhotosIntent *)self memoryName];
  unint64_t v6 = [v4 memoryName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_58;
  }
  uint64_t v42 = [(_INPBSearchForPhotosIntent *)self memoryName];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_INPBSearchForPhotosIntent *)self memoryName];
    v45 = [v4 memoryName];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForPhotosIntent *)self peopleInPhoto];
  unint64_t v6 = [v4 peopleInPhoto];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_58;
  }
  uint64_t v47 = [(_INPBSearchForPhotosIntent *)self peopleInPhoto];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_INPBSearchForPhotosIntent *)self peopleInPhoto];
    v50 = [v4 peopleInPhoto];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForPhotosIntent *)self places];
  unint64_t v6 = [v4 places];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_58;
  }
  uint64_t v52 = [(_INPBSearchForPhotosIntent *)self places];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_INPBSearchForPhotosIntent *)self places];
    v55 = [v4 places];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForPhotosIntent *)self searchTerm];
  unint64_t v6 = [v4 searchTerm];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_58:

    goto LABEL_59;
  }
  uint64_t v57 = [(_INPBSearchForPhotosIntent *)self searchTerm];
  if (!v57)
  {

LABEL_62:
    BOOL v62 = 1;
    goto LABEL_60;
  }
  v58 = (void *)v57;
  v59 = [(_INPBSearchForPhotosIntent *)self searchTerm];
  v60 = [v4 searchTerm];
  char v61 = [v59 isEqual:v60];

  if (v61) {
    goto LABEL_62;
  }
LABEL_59:
  BOOL v62 = 0;
LABEL_60:

  return v62;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSearchForPhotosIntent allocWithZone:](_INPBSearchForPhotosIntent, "allocWithZone:") init];
  id v6 = [(_INPBActivityList *)self->_activities copyWithZone:a3];
  [(_INPBSearchForPhotosIntent *)v5 setActivities:v6];

  id v7 = [(_INPBString *)self->_albumName copyWithZone:a3];
  [(_INPBSearchForPhotosIntent *)v5 setAlbumName:v7];

  id v8 = [(_INPBDateTimeRange *)self->_dateCreated copyWithZone:a3];
  [(_INPBSearchForPhotosIntent *)v5 setDateCreated:v8];

  id v9 = [(_INPBEventList *)self->_events copyWithZone:a3];
  [(_INPBSearchForPhotosIntent *)v5 setEvents:v9];

  PBRepeatedInt32Copy();
  id v10 = [(_INPBGeographicalFeatureList *)self->_geographicalFeatures copyWithZone:a3];
  [(_INPBSearchForPhotosIntent *)v5 setGeographicalFeatures:v10];

  PBRepeatedInt32Copy();
  id v11 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSearchForPhotosIntent *)v5 setIntentMetadata:v11];

  id v12 = [(_INPBLocation *)self->_locationCreated copyWithZone:a3];
  [(_INPBSearchForPhotosIntent *)v5 setLocationCreated:v12];

  id v13 = [(_INPBString *)self->_memoryName copyWithZone:a3];
  [(_INPBSearchForPhotosIntent *)v5 setMemoryName:v13];

  id v14 = [(_INPBContactList *)self->_peopleInPhoto copyWithZone:a3];
  [(_INPBSearchForPhotosIntent *)v5 setPeopleInPhoto:v14];

  id v15 = [(_INPBPlaceList *)self->_places copyWithZone:a3];
  [(_INPBSearchForPhotosIntent *)v5 setPlaces:v15];

  id v16 = [(_INPBStringList *)self->_searchTerm copyWithZone:a3];
  [(_INPBSearchForPhotosIntent *)v5 setSearchTerm:v16];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForPhotosIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForPhotosIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForPhotosIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForPhotosIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForPhotosIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBSearchForPhotosIntent *)self clearExcludedAttributes];
  [(_INPBSearchForPhotosIntent *)self clearIncludedAttributes];
  v3.receiver = self;
  v3.super_class = (Class)_INPBSearchForPhotosIntent;
  [(_INPBSearchForPhotosIntent *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v28 = a3;
  id v4 = [(_INPBSearchForPhotosIntent *)self activities];

  if (v4)
  {
    unint64_t v5 = [(_INPBSearchForPhotosIntent *)self activities];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSearchForPhotosIntent *)self albumName];

  if (v6)
  {
    uint64_t v7 = [(_INPBSearchForPhotosIntent *)self albumName];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSearchForPhotosIntent *)self dateCreated];

  if (v8)
  {
    id v9 = [(_INPBSearchForPhotosIntent *)self dateCreated];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBSearchForPhotosIntent *)self events];

  if (v10)
  {
    id v11 = [(_INPBSearchForPhotosIntent *)self events];
    PBDataWriterWriteSubmessage();
  }
  if (self->_excludedAttributes.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_excludedAttributes.count);
  }
  id v13 = [(_INPBSearchForPhotosIntent *)self geographicalFeatures];

  if (v13)
  {
    id v14 = [(_INPBSearchForPhotosIntent *)self geographicalFeatures];
    PBDataWriterWriteSubmessage();
  }
  if (self->_includedAttributes.count)
  {
    unint64_t v15 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v15;
    }
    while (v15 < self->_includedAttributes.count);
  }
  id v16 = [(_INPBSearchForPhotosIntent *)self intentMetadata];

  if (v16)
  {
    uint64_t v17 = [(_INPBSearchForPhotosIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  v18 = [(_INPBSearchForPhotosIntent *)self locationCreated];

  if (v18)
  {
    unint64_t v19 = [(_INPBSearchForPhotosIntent *)self locationCreated];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(_INPBSearchForPhotosIntent *)self memoryName];

  if (v20)
  {
    int v21 = [(_INPBSearchForPhotosIntent *)self memoryName];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v22 = [(_INPBSearchForPhotosIntent *)self peopleInPhoto];

  if (v22)
  {
    v23 = [(_INPBSearchForPhotosIntent *)self peopleInPhoto];
    PBDataWriterWriteSubmessage();
  }
  v24 = [(_INPBSearchForPhotosIntent *)self places];

  if (v24)
  {
    v25 = [(_INPBSearchForPhotosIntent *)self places];
    PBDataWriterWriteSubmessage();
  }
  int v26 = [(_INPBSearchForPhotosIntent *)self searchTerm];

  if (v26)
  {
    uint64_t v27 = [(_INPBSearchForPhotosIntent *)self searchTerm];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForPhotosIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSearchTerm
{
  return self->_searchTerm != 0;
}

- (void)setSearchTerm:(id)a3
{
}

- (BOOL)hasPlaces
{
  return self->_places != 0;
}

- (void)setPlaces:(id)a3
{
}

- (BOOL)hasPeopleInPhoto
{
  return self->_peopleInPhoto != 0;
}

- (void)setPeopleInPhoto:(id)a3
{
}

- (BOOL)hasMemoryName
{
  return self->_memoryName != 0;
}

- (void)setMemoryName:(id)a3
{
}

- (BOOL)hasLocationCreated
{
  return self->_locationCreated != 0;
}

- (void)setLocationCreated:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (int)StringAsIncludedAttributes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PHOTO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VIDEO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GIF"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FLASH"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LANDSCAPE_ORIENTATION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PORTRAIT_ORIENTATION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FAVORITE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SELFIE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FRONT_FACING_CAMERA"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SCREENSHOT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"BURST_PHOTO"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"HDR_PHOTO"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"SQUARE_PHOTO"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"PANORAMA_PHOTO"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"TIME_LAPSE_VIDEO"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"SLOW_MOTION_VIDEO"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"NOIR_FILTER"])
  {
    int v4 = 300;
  }
  else if ([v3 isEqualToString:@"CHROME_FILTER"])
  {
    int v4 = 301;
  }
  else if ([v3 isEqualToString:@"INSTANT_FILTER"])
  {
    int v4 = 302;
  }
  else if ([v3 isEqualToString:@"TONAL_FILTER"])
  {
    int v4 = 303;
  }
  else if ([v3 isEqualToString:@"TRANSFER_FILTER"])
  {
    int v4 = 304;
  }
  else if ([v3 isEqualToString:@"MONO_FILTER"])
  {
    int v4 = 305;
  }
  else if ([v3 isEqualToString:@"FADE_FILTER"])
  {
    int v4 = 306;
  }
  else if ([v3 isEqualToString:@"PROCESS_FILTER"])
  {
    int v4 = 307;
  }
  else if ([v3 isEqualToString:@"PORTRAIT_PHOTO"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"LIVE_PHOTO"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"LOOP_PHOTO"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"BOUNCE_PHOTO"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"LONG_EXPOSURE_PHOTO"])
  {
    int v4 = 58;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (id)includedAttributesAsString:(int)a3
{
  if (a3 <= 49)
  {
    int v4 = @"PHOTO";
    switch(a3)
    {
      case 2:
        goto LABEL_93;
      case 3:
        int v4 = @"VIDEO";
        break;
      case 4:
        int v4 = @"GIF";
        break;
      case 10:
        int v4 = @"FLASH";
        break;
      case 11:
        int v4 = @"LANDSCAPE_ORIENTATION";
        break;
      case 12:
        int v4 = @"PORTRAIT_ORIENTATION";
        break;
      case 13:
        int v4 = @"FAVORITE";
        break;
      case 14:
        int v4 = @"SELFIE";
        break;
      case 15:
        int v4 = @"FRONT_FACING_CAMERA";
        break;
      case 16:
        int v4 = @"SCREENSHOT";
        break;
      default:
LABEL_92:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_93:
        break;
    }
  }
  else if (a3 > 80)
  {
    switch(a3)
    {
      case 300:
        int v4 = @"NOIR_FILTER";
        break;
      case 301:
        int v4 = @"CHROME_FILTER";
        break;
      case 302:
        int v4 = @"INSTANT_FILTER";
        break;
      case 303:
        int v4 = @"TONAL_FILTER";
        break;
      case 304:
        int v4 = @"TRANSFER_FILTER";
        break;
      case 305:
        int v4 = @"MONO_FILTER";
        break;
      case 306:
        int v4 = @"FADE_FILTER";
        break;
      case 307:
        int v4 = @"PROCESS_FILTER";
        break;
      default:
        if (a3 != 81) {
          goto LABEL_92;
        }
        int v4 = @"SLOW_MOTION_VIDEO";
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case '2':
        int v4 = @"BURST_PHOTO";
        break;
      case '3':
        int v4 = @"HDR_PHOTO";
        break;
      case '4':
        int v4 = @"SQUARE_PHOTO";
        break;
      case '5':
        int v4 = @"PANORAMA_PHOTO";
        break;
      case '6':
        int v4 = @"PORTRAIT_PHOTO";
        break;
      case '7':
        int v4 = @"LIVE_PHOTO";
        break;
      case '8':
        int v4 = @"LOOP_PHOTO";
        break;
      case '9':
        int v4 = @"BOUNCE_PHOTO";
        break;
      case ':':
        int v4 = @"LONG_EXPOSURE_PHOTO";
        break;
      default:
        if (a3 != 80) {
          goto LABEL_92;
        }
        int v4 = @"TIME_LAPSE_VIDEO";
        break;
    }
  }
  return v4;
}

- (int)includedAttributeAtIndex:(unint64_t)a3
{
  return self->_includedAttributes.list[a3];
}

- (unint64_t)includedAttributesCount
{
  return self->_includedAttributes.count;
}

- (void)addIncludedAttribute:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearIncludedAttributes
{
}

- (int)includedAttributes
{
  return self->_includedAttributes.list;
}

- (void)setIncludedAttributes:(int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasGeographicalFeatures
{
  return self->_geographicalFeatures != 0;
}

- (void)setGeographicalFeatures:(id)a3
{
}

- (int)StringAsExcludedAttributes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PHOTO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VIDEO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GIF"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FLASH"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LANDSCAPE_ORIENTATION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PORTRAIT_ORIENTATION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FAVORITE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SELFIE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FRONT_FACING_CAMERA"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SCREENSHOT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"BURST_PHOTO"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"HDR_PHOTO"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"SQUARE_PHOTO"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"PANORAMA_PHOTO"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"TIME_LAPSE_VIDEO"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"SLOW_MOTION_VIDEO"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"NOIR_FILTER"])
  {
    int v4 = 300;
  }
  else if ([v3 isEqualToString:@"CHROME_FILTER"])
  {
    int v4 = 301;
  }
  else if ([v3 isEqualToString:@"INSTANT_FILTER"])
  {
    int v4 = 302;
  }
  else if ([v3 isEqualToString:@"TONAL_FILTER"])
  {
    int v4 = 303;
  }
  else if ([v3 isEqualToString:@"TRANSFER_FILTER"])
  {
    int v4 = 304;
  }
  else if ([v3 isEqualToString:@"MONO_FILTER"])
  {
    int v4 = 305;
  }
  else if ([v3 isEqualToString:@"FADE_FILTER"])
  {
    int v4 = 306;
  }
  else if ([v3 isEqualToString:@"PROCESS_FILTER"])
  {
    int v4 = 307;
  }
  else if ([v3 isEqualToString:@"PORTRAIT_PHOTO"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"LIVE_PHOTO"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"LOOP_PHOTO"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"BOUNCE_PHOTO"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"LONG_EXPOSURE_PHOTO"])
  {
    int v4 = 58;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (id)excludedAttributesAsString:(int)a3
{
  if (a3 <= 49)
  {
    int v4 = @"PHOTO";
    switch(a3)
    {
      case 2:
        goto LABEL_93;
      case 3:
        int v4 = @"VIDEO";
        break;
      case 4:
        int v4 = @"GIF";
        break;
      case 10:
        int v4 = @"FLASH";
        break;
      case 11:
        int v4 = @"LANDSCAPE_ORIENTATION";
        break;
      case 12:
        int v4 = @"PORTRAIT_ORIENTATION";
        break;
      case 13:
        int v4 = @"FAVORITE";
        break;
      case 14:
        int v4 = @"SELFIE";
        break;
      case 15:
        int v4 = @"FRONT_FACING_CAMERA";
        break;
      case 16:
        int v4 = @"SCREENSHOT";
        break;
      default:
LABEL_92:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_93:
        break;
    }
  }
  else if (a3 > 80)
  {
    switch(a3)
    {
      case 300:
        int v4 = @"NOIR_FILTER";
        break;
      case 301:
        int v4 = @"CHROME_FILTER";
        break;
      case 302:
        int v4 = @"INSTANT_FILTER";
        break;
      case 303:
        int v4 = @"TONAL_FILTER";
        break;
      case 304:
        int v4 = @"TRANSFER_FILTER";
        break;
      case 305:
        int v4 = @"MONO_FILTER";
        break;
      case 306:
        int v4 = @"FADE_FILTER";
        break;
      case 307:
        int v4 = @"PROCESS_FILTER";
        break;
      default:
        if (a3 != 81) {
          goto LABEL_92;
        }
        int v4 = @"SLOW_MOTION_VIDEO";
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case '2':
        int v4 = @"BURST_PHOTO";
        break;
      case '3':
        int v4 = @"HDR_PHOTO";
        break;
      case '4':
        int v4 = @"SQUARE_PHOTO";
        break;
      case '5':
        int v4 = @"PANORAMA_PHOTO";
        break;
      case '6':
        int v4 = @"PORTRAIT_PHOTO";
        break;
      case '7':
        int v4 = @"LIVE_PHOTO";
        break;
      case '8':
        int v4 = @"LOOP_PHOTO";
        break;
      case '9':
        int v4 = @"BOUNCE_PHOTO";
        break;
      case ':':
        int v4 = @"LONG_EXPOSURE_PHOTO";
        break;
      default:
        if (a3 != 80) {
          goto LABEL_92;
        }
        int v4 = @"TIME_LAPSE_VIDEO";
        break;
    }
  }
  return v4;
}

- (int)excludedAttributeAtIndex:(unint64_t)a3
{
  return self->_excludedAttributes.list[a3];
}

- (unint64_t)excludedAttributesCount
{
  return self->_excludedAttributes.count;
}

- (void)addExcludedAttribute:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearExcludedAttributes
{
}

- (int)excludedAttributes
{
  return self->_excludedAttributes.list;
}

- (void)setExcludedAttributes:(int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasEvents
{
  return self->_events != 0;
}

- (void)setEvents:(id)a3
{
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (void)setDateCreated:(id)a3
{
}

- (BOOL)hasAlbumName
{
  return self->_albumName != 0;
}

- (void)setAlbumName:(id)a3
{
}

- (BOOL)hasActivities
{
  return self->_activities != 0;
}

- (void)setActivities:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end