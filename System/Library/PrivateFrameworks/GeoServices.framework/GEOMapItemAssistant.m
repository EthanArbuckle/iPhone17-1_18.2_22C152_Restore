@interface GEOMapItemAssistant
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)_hasMUID;
- (BOOL)_hasUserRatingScore;
- (BOOL)_responseStatusIsIncomplete;
- (BOOL)isValid;
- (GEOMapItemAssistant)initWithWithLocation:(id)a3 addressDictionary:(id)a4 name:(id)a5 businessURL:(id)a6 phoneNumber:(id)a7 sessionID:(id)a8 muid:(unint64_t)a9 attributionID:(id)a10 sampleSizeForUserRatingScore:(unsigned int)a11 normalizedUserRatingScore:(float)a12;
- (float)_normalizedUserRatingScore;
- (id)_businessURL;
- (id)_place;
- (id)addressDictionary;
- (id)addressObject;
- (id)description;
- (id)geoAddress;
- (id)name;
- (id)weatherDisplayName;
- (unint64_t)_muid;
- (unsigned)_sampleSizeForUserRatingScore;
@end

@implementation GEOMapItemAssistant

- (id)_place
{
  place = self->_place;
  if (!place)
  {
    v4 = [GEOPlace alloc];
    *(float *)&double v5 = self->_normalizedUserRatingScore;
    LODWORD(v9) = self->_sampleSizeForUserRatingScore;
    v6 = [(GEOPlace *)v4 initWithLocation:self->_location addressDictionary:self->_addressDictionary name:self->_name businessURL:self->_businessURL phoneNumber:self->_phoneNumber muid:self->_muid attributionID:v5 sampleSizeForUserRatingScore:self->_attributionID normalizedUserRatingScore:v9];
    v7 = self->_place;
    self->_place = v6;

    place = self->_place;
  }

  return place;
}

- (BOOL)isValid
{
  return 1;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  location = self->_location;
  if (location)
  {
    [(GEOLocation *)location coordinate];
  }
  else
  {
    double v3 = -180.0;
    double v4 = -180.0;
  }
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressObject, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_attributionID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_businessURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_addressDictionary, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (GEOMapItemAssistant)initWithWithLocation:(id)a3 addressDictionary:(id)a4 name:(id)a5 businessURL:(id)a6 phoneNumber:(id)a7 sessionID:(id)a8 muid:(unint64_t)a9 attributionID:(id)a10 sampleSizeForUserRatingScore:(unsigned int)a11 normalizedUserRatingScore:(float)a12
{
  id v19 = a3;
  id v36 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a10;
  v37.receiver = self;
  v37.super_class = (Class)GEOMapItemAssistant;
  v24 = [(GEOMapItemAssistant *)&v37 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_location, a3);
    objc_storeStrong((id *)&v25->_addressDictionary, a4);
    uint64_t v26 = [v20 copy];
    name = v25->_name;
    v25->_name = (NSString *)v26;

    uint64_t v28 = [v21 copy];
    businessURL = v25->_businessURL;
    v25->_businessURL = (NSURL *)v28;

    uint64_t v30 = [v22 copy];
    phoneNumber = v25->_phoneNumber;
    v25->_phoneNumber = (NSString *)v30;

    v25->_muid = a9;
    uint64_t v32 = [v23 copy];
    attributionID = v25->_attributionID;
    v25->_attributionID = (NSString *)v32;

    v25->_sampleSizeForUserRatingScore = a11;
    v25->_normalizedUserRatingScore = a12;
    v34 = v25;
  }

  return v25;
}

- (id)description
{
  location = self->_location;
  v18 = (void *)MEMORY[0x1E4F1C9E8];
  addressDictionary = self->_addressDictionary;
  name = self->_name;
  businessURL = self->_businessURL;
  phoneNumber = self->_phoneNumber;
  v7 = [NSNumber numberWithLongLong:self->_muid];
  attributionID = self->_attributionID;
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:self->_sampleSizeForUserRatingScore];
  *(float *)&double v10 = self->_normalizedUserRatingScore;
  v11 = [NSNumber numberWithFloat:v10];
  objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", location, @"location", addressDictionary, @"addressDictionary", name, @"name", businessURL, @"businessURL", phoneNumber, @"phoneNumber", v7, @"muid", attributionID, @"attributionID", v9, @"sampleSizeForUserRatingScore", v11,
    @"normalizedUserRatingScore",
  v12 = 0);

  v13 = NSString;
  v19.receiver = self;
  v19.super_class = (Class)GEOMapItemAssistant;
  v14 = [(GEOMapItemAssistant *)&v19 description];
  v15 = [v13 stringWithFormat:@"%@ <%@>", v14, v12];

  return v15;
}

- (id)name
{
  return self->_name;
}

- (id)addressDictionary
{
  return self->_addressDictionary;
}

- (BOOL)_responseStatusIsIncomplete
{
  return 0;
}

- (id)geoAddress
{
  v2 = [[GEOAddress alloc] initWithAddressDictionary:self->_addressDictionary];

  return v2;
}

- (BOOL)_hasMUID
{
  return self->_muid != 0;
}

- (unint64_t)_muid
{
  return self->_muid;
}

- (id)_businessURL
{
  return [(NSURL *)self->_businessURL absoluteString];
}

- (BOOL)_hasUserRatingScore
{
  return self->_sampleSizeForUserRatingScore != 0;
}

- (unsigned)_sampleSizeForUserRatingScore
{
  return self->_sampleSizeForUserRatingScore;
}

- (float)_normalizedUserRatingScore
{
  return self->_normalizedUserRatingScore * 0.05;
}

- (id)addressObject
{
  addressObject = self->_addressObject;
  if (!addressObject)
  {
    double v4 = [(GEOMapItemAssistant *)self _place];
    GEOAddressObjectOfGEOPlace(v4);
    double v5 = (GEOAddressObject *)objc_claimAutoreleasedReturnValue();
    v6 = self->_addressObject;
    self->_addressObject = v5;

    addressObject = self->_addressObject;
  }

  return addressObject;
}

- (id)weatherDisplayName
{
  v2 = [(GEOMapItemAssistant *)self addressObject];
  double v3 = [v2 weatherDisplayName];

  return v3;
}

@end