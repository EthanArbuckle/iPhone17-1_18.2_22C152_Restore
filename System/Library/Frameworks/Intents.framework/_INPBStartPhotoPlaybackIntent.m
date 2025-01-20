@interface _INPBStartPhotoPlaybackIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAlbumName;
- (BOOL)hasDateCreated;
- (BOOL)hasIntentMetadata;
- (BOOL)hasLocationCreated;
- (BOOL)hasPeopleInPhoto;
- (BOOL)hasSearchTerm;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBContactList)peopleInPhoto;
- (_INPBDateTimeRange)dateCreated;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBLocation)locationCreated;
- (_INPBStartPhotoPlaybackIntent)initWithCoder:(id)a3;
- (_INPBString)albumName;
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
- (void)setAlbumName:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setExcludedAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setIncludedAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setIntentMetadata:(id)a3;
- (void)setLocationCreated:(id)a3;
- (void)setPeopleInPhoto:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBStartPhotoPlaybackIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_peopleInPhoto, 0);
  objc_storeStrong((id *)&self->_locationCreated, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);

  objc_storeStrong((id *)&self->_albumName, 0);
}

- (_INPBStringList)searchTerm
{
  return self->_searchTerm;
}

- (_INPBContactList)peopleInPhoto
{
  return self->_peopleInPhoto;
}

- (_INPBLocation)locationCreated
{
  return self->_locationCreated;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDateTimeRange)dateCreated
{
  return self->_dateCreated;
}

- (_INPBString)albumName
{
  return self->_albumName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBStartPhotoPlaybackIntent *)self albumName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"albumName"];

  v6 = [(_INPBStartPhotoPlaybackIntent *)self dateCreated];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"dateCreated"];

  if (self->_excludedAttributes.count)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBStartPhotoPlaybackIntent excludedAttributesCount](self, "excludedAttributesCount"));
    if ([(_INPBStartPhotoPlaybackIntent *)self excludedAttributesCount])
    {
      unint64_t v9 = 0;
      do
      {
        int v10 = self->_excludedAttributes.list[v9];
        if (v10 <= 49)
        {
          v11 = @"PHOTO";
          switch(v10)
          {
            case 2:
              break;
            case 3:
              v11 = @"VIDEO";
              break;
            case 4:
              v11 = @"GIF";
              break;
            case 10:
              v11 = @"FLASH";
              break;
            case 11:
              v11 = @"LANDSCAPE_ORIENTATION";
              break;
            case 12:
              v11 = @"PORTRAIT_ORIENTATION";
              break;
            case 13:
              v11 = @"FAVORITE";
              break;
            case 14:
              v11 = @"SELFIE";
              break;
            case 15:
              v11 = @"FRONT_FACING_CAMERA";
              break;
            case 16:
              v11 = @"SCREENSHOT";
              break;
            default:
LABEL_39:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_excludedAttributes.list[v9]);
              v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
        }
        else if (v10 > 80)
        {
          switch(v10)
          {
            case 300:
              v11 = @"NOIR_FILTER";
              break;
            case 301:
              v11 = @"CHROME_FILTER";
              break;
            case 302:
              v11 = @"INSTANT_FILTER";
              break;
            case 303:
              v11 = @"TONAL_FILTER";
              break;
            case 304:
              v11 = @"TRANSFER_FILTER";
              break;
            case 305:
              v11 = @"MONO_FILTER";
              break;
            case 306:
              v11 = @"FADE_FILTER";
              break;
            case 307:
              v11 = @"PROCESS_FILTER";
              break;
            default:
              if (v10 != 81) {
                goto LABEL_39;
              }
              v11 = @"SLOW_MOTION_VIDEO";
              break;
          }
        }
        else
        {
          switch(v10)
          {
            case '2':
              v11 = @"BURST_PHOTO";
              break;
            case '3':
              v11 = @"HDR_PHOTO";
              break;
            case '4':
              v11 = @"SQUARE_PHOTO";
              break;
            case '5':
              v11 = @"PANORAMA_PHOTO";
              break;
            case '6':
              v11 = @"PORTRAIT_PHOTO";
              break;
            case '7':
              v11 = @"LIVE_PHOTO";
              break;
            case '8':
              v11 = @"LOOP_PHOTO";
              break;
            case '9':
              v11 = @"BOUNCE_PHOTO";
              break;
            case ':':
              v11 = @"LONG_EXPOSURE_PHOTO";
              break;
            default:
              if (v10 != 80) {
                goto LABEL_39;
              }
              v11 = @"TIME_LAPSE_VIDEO";
              break;
          }
        }
        [v8 addObject:v11];

        ++v9;
      }
      while (v9 < [(_INPBStartPhotoPlaybackIntent *)self excludedAttributesCount]);
    }
    [v3 setObject:v8 forKeyedSubscript:@"excludedAttribute"];
  }
  if (self->_includedAttributes.count)
  {
    v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBStartPhotoPlaybackIntent includedAttributesCount](self, "includedAttributesCount"));
    if ([(_INPBStartPhotoPlaybackIntent *)self includedAttributesCount])
    {
      unint64_t v13 = 0;
      do
      {
        int v14 = self->_includedAttributes.list[v13];
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
LABEL_80:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_includedAttributes.list[v13]);
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
                goto LABEL_80;
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
                goto LABEL_80;
              }
              v15 = @"TIME_LAPSE_VIDEO";
              break;
          }
        }
        [v12 addObject:v15];

        ++v13;
      }
      while (v13 < [(_INPBStartPhotoPlaybackIntent *)self includedAttributesCount]);
    }
    [v3 setObject:v12 forKeyedSubscript:@"includedAttribute"];
  }
  v16 = [(_INPBStartPhotoPlaybackIntent *)self intentMetadata];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"intentMetadata"];

  v18 = [(_INPBStartPhotoPlaybackIntent *)self locationCreated];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"locationCreated"];

  v20 = [(_INPBStartPhotoPlaybackIntent *)self peopleInPhoto];
  v21 = [v20 dictionaryRepresentation];
  [v3 setObject:v21 forKeyedSubscript:@"peopleInPhoto"];

  v22 = [(_INPBStartPhotoPlaybackIntent *)self searchTerm];
  v23 = [v22 dictionaryRepresentation];
  [v3 setObject:v23 forKeyedSubscript:@"searchTerm"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_albumName hash];
  unint64_t v4 = [(_INPBDateTimeRange *)self->_dateCreated hash] ^ v3;
  uint64_t v5 = PBRepeatedInt32Hash();
  uint64_t v6 = v5 ^ PBRepeatedInt32Hash();
  unint64_t v7 = v4 ^ v6 ^ [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v8 = [(_INPBLocation *)self->_locationCreated hash];
  unint64_t v9 = v8 ^ [(_INPBContactList *)self->_peopleInPhoto hash];
  return v7 ^ v9 ^ [(_INPBStringList *)self->_searchTerm hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  uint64_t v5 = [(_INPBStartPhotoPlaybackIntent *)self albumName];
  uint64_t v6 = [v4 albumName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v7 = [(_INPBStartPhotoPlaybackIntent *)self albumName];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBStartPhotoPlaybackIntent *)self albumName];
    int v10 = [v4 albumName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBStartPhotoPlaybackIntent *)self dateCreated];
  uint64_t v6 = [v4 dateCreated];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v12 = [(_INPBStartPhotoPlaybackIntent *)self dateCreated];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    int v14 = [(_INPBStartPhotoPlaybackIntent *)self dateCreated];
    v15 = [v4 dateCreated];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_34;
  }
  uint64_t v5 = [(_INPBStartPhotoPlaybackIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v17 = [(_INPBStartPhotoPlaybackIntent *)self intentMetadata];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBStartPhotoPlaybackIntent *)self intentMetadata];
    v20 = [v4 intentMetadata];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBStartPhotoPlaybackIntent *)self locationCreated];
  uint64_t v6 = [v4 locationCreated];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v22 = [(_INPBStartPhotoPlaybackIntent *)self locationCreated];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBStartPhotoPlaybackIntent *)self locationCreated];
    v25 = [v4 locationCreated];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBStartPhotoPlaybackIntent *)self peopleInPhoto];
  uint64_t v6 = [v4 peopleInPhoto];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v27 = [(_INPBStartPhotoPlaybackIntent *)self peopleInPhoto];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBStartPhotoPlaybackIntent *)self peopleInPhoto];
    v30 = [v4 peopleInPhoto];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBStartPhotoPlaybackIntent *)self searchTerm];
  uint64_t v6 = [v4 searchTerm];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_INPBStartPhotoPlaybackIntent *)self searchTerm];
    if (!v32)
    {

LABEL_37:
      BOOL v37 = 1;
      goto LABEL_35;
    }
    v33 = (void *)v32;
    v34 = [(_INPBStartPhotoPlaybackIntent *)self searchTerm];
    v35 = [v4 searchTerm];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_37;
    }
  }
  else
  {
LABEL_33:
  }
LABEL_34:
  BOOL v37 = 0;
LABEL_35:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBStartPhotoPlaybackIntent allocWithZone:](_INPBStartPhotoPlaybackIntent, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_albumName copyWithZone:a3];
  [(_INPBStartPhotoPlaybackIntent *)v5 setAlbumName:v6];

  id v7 = [(_INPBDateTimeRange *)self->_dateCreated copyWithZone:a3];
  [(_INPBStartPhotoPlaybackIntent *)v5 setDateCreated:v7];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBStartPhotoPlaybackIntent *)v5 setIntentMetadata:v8];

  id v9 = [(_INPBLocation *)self->_locationCreated copyWithZone:a3];
  [(_INPBStartPhotoPlaybackIntent *)v5 setLocationCreated:v9];

  id v10 = [(_INPBContactList *)self->_peopleInPhoto copyWithZone:a3];
  [(_INPBStartPhotoPlaybackIntent *)v5 setPeopleInPhoto:v10];

  id v11 = [(_INPBStringList *)self->_searchTerm copyWithZone:a3];
  [(_INPBStartPhotoPlaybackIntent *)v5 setSearchTerm:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBStartPhotoPlaybackIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBStartPhotoPlaybackIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBStartPhotoPlaybackIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBStartPhotoPlaybackIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBStartPhotoPlaybackIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBStartPhotoPlaybackIntent *)self clearExcludedAttributes];
  [(_INPBStartPhotoPlaybackIntent *)self clearIncludedAttributes];
  v3.receiver = self;
  v3.super_class = (Class)_INPBStartPhotoPlaybackIntent;
  [(_INPBStartPhotoPlaybackIntent *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v18 = a3;
  id v4 = [(_INPBStartPhotoPlaybackIntent *)self albumName];

  if (v4)
  {
    uint64_t v5 = [(_INPBStartPhotoPlaybackIntent *)self albumName];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBStartPhotoPlaybackIntent *)self dateCreated];

  if (v6)
  {
    uint64_t v7 = [(_INPBStartPhotoPlaybackIntent *)self dateCreated];
    PBDataWriterWriteSubmessage();
  }
  if (self->_excludedAttributes.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_excludedAttributes.count);
  }
  if (self->_includedAttributes.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_includedAttributes.count);
  }
  id v10 = [(_INPBStartPhotoPlaybackIntent *)self intentMetadata];

  if (v10)
  {
    id v11 = [(_INPBStartPhotoPlaybackIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBStartPhotoPlaybackIntent *)self locationCreated];

  if (v12)
  {
    unint64_t v13 = [(_INPBStartPhotoPlaybackIntent *)self locationCreated];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(_INPBStartPhotoPlaybackIntent *)self peopleInPhoto];

  if (v14)
  {
    v15 = [(_INPBStartPhotoPlaybackIntent *)self peopleInPhoto];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(_INPBStartPhotoPlaybackIntent *)self searchTerm];

  if (v16)
  {
    uint64_t v17 = [(_INPBStartPhotoPlaybackIntent *)self searchTerm];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartPhotoPlaybackIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSearchTerm
{
  return self->_searchTerm != 0;
}

- (void)setSearchTerm:(id)a3
{
}

- (BOOL)hasPeopleInPhoto
{
  return self->_peopleInPhoto != 0;
}

- (void)setPeopleInPhoto:(id)a3
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end