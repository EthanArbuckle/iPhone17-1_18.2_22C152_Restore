@interface INMediaSearch
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INDateComponentsRange)releaseDate;
- (INMediaItemType)mediaType;
- (INMediaReference)reference;
- (INMediaSearch)initWithCoder:(id)a3;
- (INMediaSearch)initWithMediaType:(INMediaItemType)mediaType sortOrder:(INMediaSortOrder)sortOrder mediaName:(NSString *)mediaName artistName:(NSString *)artistName albumName:(NSString *)albumName genreNames:(NSArray *)genreNames moodNames:(NSArray *)moodNames releaseDate:(INDateComponentsRange *)releaseDate reference:(INMediaReference)reference mediaIdentifier:(NSString *)mediaIdentifier;
- (INMediaSortOrder)sortOrder;
- (NSArray)genreNames;
- (NSArray)moodNames;
- (NSString)albumName;
- (NSString)artistName;
- (NSString)description;
- (NSString)mediaIdentifier;
- (NSString)mediaName;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INMediaSearch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_moodNames, 0);
  objc_storeStrong((id *)&self->_genreNames, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);

  objc_storeStrong((id *)&self->_mediaName, 0);
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (INMediaReference)reference
{
  return self->_reference;
}

- (INDateComponentsRange)releaseDate
{
  return self->_releaseDate;
}

- (NSArray)moodNames
{
  return self->_moodNames;
}

- (NSArray)genreNames
{
  return self->_genreNames;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)mediaName
{
  return self->_mediaName;
}

- (INMediaSortOrder)sortOrder
{
  return self->_sortOrder;
}

- (INMediaItemType)mediaType
{
  return self->_mediaType;
}

- (id)_dictionaryRepresentation
{
  v28[10] = *MEMORY[0x1E4F143B8];
  v27[0] = @"mediaType";
  v26 = [NSNumber numberWithInteger:self->_mediaType];
  v28[0] = v26;
  v27[1] = @"sortOrder";
  v25 = [NSNumber numberWithInteger:self->_sortOrder];
  v28[1] = v25;
  v27[2] = @"mediaName";
  uint64_t mediaName = (uint64_t)self->_mediaName;
  uint64_t v24 = mediaName;
  if (!mediaName)
  {
    uint64_t mediaName = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)mediaName;
  v28[2] = mediaName;
  v27[3] = @"artistName";
  uint64_t artistName = (uint64_t)self->_artistName;
  uint64_t v23 = artistName;
  if (!artistName)
  {
    uint64_t artistName = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)artistName;
  v28[3] = artistName;
  v27[4] = @"albumName";
  albumName = self->_albumName;
  uint64_t v6 = (uint64_t)albumName;
  if (!albumName)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v6;
  v28[4] = v6;
  v27[5] = @"genreNames";
  genreNames = self->_genreNames;
  uint64_t v8 = (uint64_t)genreNames;
  if (!genreNames)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v8;
  v28[5] = v8;
  v27[6] = @"moodNames";
  moodNames = self->_moodNames;
  v10 = moodNames;
  if (!moodNames)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v20, v21, v22);
  }
  v28[6] = v10;
  v27[7] = @"releaseDate";
  releaseDate = self->_releaseDate;
  v12 = releaseDate;
  if (!releaseDate)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v12;
  v27[8] = @"reference";
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", self->_reference, v18);
  v28[8] = v13;
  v27[9] = @"mediaIdentifier";
  mediaIdentifier = self->_mediaIdentifier;
  v15 = mediaIdentifier;
  if (!mediaIdentifier)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[9] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:10];
  if (!mediaIdentifier) {

  }
  if (releaseDate)
  {
    if (moodNames) {
      goto LABEL_19;
    }
  }
  else
  {

    if (moodNames)
    {
LABEL_19:
      if (genreNames) {
        goto LABEL_20;
      }
LABEL_30:

      if (albumName) {
        goto LABEL_21;
      }
      goto LABEL_31;
    }
  }

  if (!genreNames) {
    goto LABEL_30;
  }
LABEL_20:
  if (albumName) {
    goto LABEL_21;
  }
LABEL_31:

LABEL_21:
  if (!v23) {

  }
  if (!v24) {

  }
  return v16;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INMediaSearch;
  uint64_t v6 = [(INMediaSearch *)&v11 description];
  v7 = [(INMediaSearch *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INMediaSearch *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  unint64_t v8 = self->_mediaType - 1;
  if (v8 > 0x13) {
    v9 = @"unknown";
  }
  else {
    v9 = *(&off_1E551E500 + v8);
  }
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"mediaType");

  unint64_t v11 = self->_sortOrder - 1;
  if (v11 > 7) {
    v12 = @"unknown";
  }
  else {
    v12 = off_1E551EE38[v11];
  }
  v13 = v12;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"sortOrder");

  v14 = [v6 encodeObject:self->_mediaName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"mediaName");

  v15 = [v6 encodeObject:self->_artistName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"artistName");

  v16 = [v6 encodeObject:self->_albumName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"albumName");

  v17 = [v6 encodeObject:self->_genreNames];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, @"genreNames");

  uint64_t v18 = [v6 encodeObject:self->_moodNames];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, @"moodNames");

  v19 = [v6 encodeObject:self->_releaseDate];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, @"releaseDate");

  int64_t reference = self->_reference;
  v21 = @"unknown";
  if (reference == 2) {
    v21 = @"my";
  }
  if (reference == 1) {
    v22 = @"currentlyPlaying";
  }
  else {
    v22 = v21;
  }
  uint64_t v23 = v22;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, @"reference");

  uint64_t v24 = [v6 encodeObject:self->_mediaIdentifier];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, @"mediaIdentifier");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t mediaType = self->_mediaType;
  id v5 = a3;
  [v5 encodeInteger:mediaType forKey:@"mediaType"];
  [v5 encodeInteger:self->_sortOrder forKey:@"sortOrder"];
  [v5 encodeObject:self->_mediaName forKey:@"mediaName"];
  [v5 encodeObject:self->_artistName forKey:@"artistName"];
  [v5 encodeObject:self->_albumName forKey:@"albumName"];
  [v5 encodeObject:self->_genreNames forKey:@"genreNames"];
  [v5 encodeObject:self->_moodNames forKey:@"moodNames"];
  [v5 encodeObject:self->_releaseDate forKey:@"releaseDate"];
  [v5 encodeInteger:self->_reference forKey:@"reference"];
  [v5 encodeObject:self->_mediaIdentifier forKey:@"mediaIdentifier"];
}

- (INMediaSearch)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v21 = [v3 decodeIntegerForKey:@"mediaType"];
  uint64_t v20 = [v3 decodeIntegerForKey:@"sortOrder"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"mediaName"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"artistName"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"albumName"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v9 = [v7 setWithArray:v8];
  v10 = [v3 decodeObjectOfClasses:v9 forKey:@"genreNames"];

  unint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v13 = [v11 setWithArray:v12];
  v14 = [v3 decodeObjectOfClasses:v13 forKey:@"moodNames"];

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"releaseDate"];
  uint64_t v16 = [v3 decodeIntegerForKey:@"reference"];
  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"mediaIdentifier"];

  uint64_t v18 = [(INMediaSearch *)self initWithMediaType:v21 sortOrder:v20 mediaName:v4 artistName:v5 albumName:v6 genreNames:v10 moodNames:v14 releaseDate:v15 reference:v16 mediaIdentifier:v17];
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INMediaSearch *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = v5;
      BOOL v14 = 0;
      if (self->_mediaType == v5->_mediaType && self->_sortOrder == v5->_sortOrder)
      {
        uint64_t mediaName = self->_mediaName;
        if (mediaName == v6->_mediaName || -[NSString isEqual:](mediaName, "isEqual:"))
        {
          uint64_t artistName = self->_artistName;
          if (artistName == v6->_artistName || -[NSString isEqual:](artistName, "isEqual:"))
          {
            albumName = self->_albumName;
            if (albumName == v6->_albumName || -[NSString isEqual:](albumName, "isEqual:"))
            {
              genreNames = self->_genreNames;
              if (genreNames == v6->_genreNames || -[NSArray isEqual:](genreNames, "isEqual:"))
              {
                moodNames = self->_moodNames;
                if (moodNames == v6->_moodNames || -[NSArray isEqual:](moodNames, "isEqual:"))
                {
                  releaseDate = self->_releaseDate;
                  if ((releaseDate == v6->_releaseDate || -[INDateComponentsRange isEqual:](releaseDate, "isEqual:"))
                    && self->_reference == v6->_reference)
                  {
                    mediaIdentifier = self->_mediaIdentifier;
                    if (mediaIdentifier == v6->_mediaIdentifier
                      || -[NSString isEqual:](mediaIdentifier, "isEqual:"))
                    {
                      BOOL v14 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithInteger:self->_mediaType];
  uint64_t v4 = [v3 hash];
  id v5 = [NSNumber numberWithInteger:self->_sortOrder];
  uint64_t v6 = [v5 hash] ^ v4;
  NSUInteger v7 = [(NSString *)self->_mediaName hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_artistName hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_albumName hash];
  uint64_t v10 = v6 ^ v9 ^ [(NSArray *)self->_genreNames hash];
  uint64_t v11 = [(NSArray *)self->_moodNames hash];
  unint64_t v12 = v11 ^ [(INDateComponentsRange *)self->_releaseDate hash];
  v13 = [NSNumber numberWithInteger:self->_reference];
  uint64_t v14 = v12 ^ [v13 hash];
  NSUInteger v15 = v10 ^ v14 ^ [(NSString *)self->_mediaIdentifier hash];

  return v15;
}

- (INMediaSearch)initWithMediaType:(INMediaItemType)mediaType sortOrder:(INMediaSortOrder)sortOrder mediaName:(NSString *)mediaName artistName:(NSString *)artistName albumName:(NSString *)albumName genreNames:(NSArray *)genreNames moodNames:(NSArray *)moodNames releaseDate:(INDateComponentsRange *)releaseDate reference:(INMediaReference)reference mediaIdentifier:(NSString *)mediaIdentifier
{
  uint64_t v18 = mediaName;
  v19 = artistName;
  uint64_t v20 = albumName;
  uint64_t v21 = genreNames;
  v22 = moodNames;
  uint64_t v23 = releaseDate;
  uint64_t v24 = mediaIdentifier;
  v42.receiver = self;
  v42.super_class = (Class)INMediaSearch;
  v25 = [(INMediaSearch *)&v42 init];
  v26 = v25;
  if (v25)
  {
    v25->_int64_t mediaType = mediaType;
    v25->_sortOrder = sortOrder;
    uint64_t v27 = [(NSString *)v18 copy];
    v28 = v26->_mediaName;
    v26->_uint64_t mediaName = (NSString *)v27;

    uint64_t v29 = [(NSString *)v19 copy];
    v30 = v26->_artistName;
    v26->_uint64_t artistName = (NSString *)v29;

    uint64_t v31 = [(NSString *)v20 copy];
    v32 = v26->_albumName;
    v26->_albumName = (NSString *)v31;

    uint64_t v33 = [(NSArray *)v21 copy];
    v34 = v26->_genreNames;
    v26->_genreNames = (NSArray *)v33;

    uint64_t v35 = [(NSArray *)v22 copy];
    v36 = v26->_moodNames;
    v26->_moodNames = (NSArray *)v35;

    uint64_t v37 = [(INDateComponentsRange *)v23 copy];
    v38 = v26->_releaseDate;
    v26->_releaseDate = (INDateComponentsRange *)v37;

    v26->_int64_t reference = reference;
    uint64_t v39 = [(NSString *)v24 copy];
    v40 = v26->_mediaIdentifier;
    v26->_mediaIdentifier = (NSString *)v39;
  }
  return v26;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSUInteger v9 = [v8 objectForKeyedSubscript:@"mediaType"];
    uint64_t v37 = INMediaItemTypeWithString(v9);

    uint64_t v10 = [v8 objectForKeyedSubscript:@"sortOrder"];
    uint64_t v36 = INMediaSortOrderWithString(v10);

    uint64_t v11 = objc_opt_class();
    unint64_t v12 = [v8 objectForKeyedSubscript:@"mediaName"];
    uint64_t v35 = [v7 decodeObjectOfClass:v11 from:v12];

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v8 objectForKeyedSubscript:@"artistName"];
    v34 = [v7 decodeObjectOfClass:v13 from:v14];

    uint64_t v15 = objc_opt_class();
    uint64_t v16 = [v8 objectForKeyedSubscript:@"albumName"];
    v17 = [v7 decodeObjectOfClass:v15 from:v16];

    uint64_t v18 = objc_opt_class();
    v19 = [v8 objectForKeyedSubscript:@"genreNames"];
    uint64_t v20 = [v7 decodeObjectsOfClass:v18 from:v19];

    uint64_t v21 = objc_opt_class();
    v22 = [v8 objectForKeyedSubscript:@"moodNames"];
    uint64_t v23 = [v7 decodeObjectsOfClass:v21 from:v22];

    uint64_t v24 = objc_opt_class();
    v25 = [v8 objectForKeyedSubscript:@"releaseDate"];
    v26 = [v7 decodeObjectOfClass:v24 from:v25];

    uint64_t v27 = [v8 objectForKeyedSubscript:@"reference"];
    uint64_t v28 = INMediaReferenceWithString(v27);

    uint64_t v29 = objc_opt_class();
    v30 = [v8 objectForKeyedSubscript:@"mediaIdentifier"];
    uint64_t v31 = [v7 decodeObjectOfClass:v29 from:v30];

    v32 = (void *)[objc_alloc((Class)a1) initWithMediaType:v37 sortOrder:v36 mediaName:v35 artistName:v34 albumName:v17 genreNames:v20 moodNames:v23 releaseDate:v26 reference:v28 mediaIdentifier:v31];
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end