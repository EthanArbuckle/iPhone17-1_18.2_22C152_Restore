@interface BMPhotosMemoryCreation
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPhotosMemoryCreation)initWithIdentifier:(id)a3 queryContainsPersonEntity:(id)a4 queryContainsActivityEntity:(id)a5 queryContainsTimeEntity:(id)a6 queryContainsLocationEntity:(id)a7 queryContainsTripEntity:(id)a8 queryContainsMusicArtist:(id)a9 queryContainsMusicSong:(id)a10 queryContainsMusicGenre:(id)a11 queryContainsMusicMood:(id)a12 globalTraits:(id)a13 memoryGenerated:(id)a14 memoryAssetCount:(int)a15;
- (BMPhotosMemoryCreation)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasMemoryGenerated;
- (BOOL)hasQueryContainsActivityEntity;
- (BOOL)hasQueryContainsLocationEntity;
- (BOOL)hasQueryContainsMusicArtist;
- (BOOL)hasQueryContainsMusicGenre;
- (BOOL)hasQueryContainsMusicMood;
- (BOOL)hasQueryContainsMusicSong;
- (BOOL)hasQueryContainsPersonEntity;
- (BOOL)hasQueryContainsTimeEntity;
- (BOOL)hasQueryContainsTripEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)memoryGenerated;
- (BOOL)queryContainsActivityEntity;
- (BOOL)queryContainsLocationEntity;
- (BOOL)queryContainsMusicArtist;
- (BOOL)queryContainsMusicGenre;
- (BOOL)queryContainsMusicMood;
- (BOOL)queryContainsMusicSong;
- (BOOL)queryContainsPersonEntity;
- (BOOL)queryContainsTimeEntity;
- (BOOL)queryContainsTripEntity;
- (NSArray)globalTraits;
- (NSString)description;
- (NSString)identifier;
- (id)_globalTraitsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)memoryAssetCount;
- (unsigned)dataVersion;
- (void)setHasMemoryGenerated:(BOOL)a3;
- (void)setHasQueryContainsActivityEntity:(BOOL)a3;
- (void)setHasQueryContainsLocationEntity:(BOOL)a3;
- (void)setHasQueryContainsMusicArtist:(BOOL)a3;
- (void)setHasQueryContainsMusicGenre:(BOOL)a3;
- (void)setHasQueryContainsMusicMood:(BOOL)a3;
- (void)setHasQueryContainsMusicSong:(BOOL)a3;
- (void)setHasQueryContainsPersonEntity:(BOOL)a3;
- (void)setHasQueryContainsTimeEntity:(BOOL)a3;
- (void)setHasQueryContainsTripEntity:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPhotosMemoryCreation

+ (id)columns
{
  v17[13] = *MEMORY[0x1E4F143B8];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"queryContainsPersonEntity" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"queryContainsActivityEntity" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"queryContainsTimeEntity" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"queryContainsLocationEntity" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"queryContainsTripEntity" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"queryContainsMusicArtist" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"queryContainsMusicSong" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"queryContainsMusicGenre" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"queryContainsMusicMood" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"globalTraits_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_90];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"memoryGenerated" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:12 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"memoryAssetCount" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:4 convertedType:0];
  v17[0] = v16;
  v17[1] = v15;
  v17[2] = v14;
  v17[3] = v2;
  v17[4] = v3;
  v17[5] = v4;
  v17[6] = v5;
  v17[7] = v6;
  v17[8] = v13;
  v17[9] = v7;
  v17[10] = v12;
  v17[11] = v8;
  v17[12] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:13];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalTraits, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int)memoryAssetCount
{
  return self->_memoryAssetCount;
}

- (void)setHasMemoryGenerated:(BOOL)a3
{
  self->_hasMemoryGenerated = a3;
}

- (BOOL)hasMemoryGenerated
{
  return self->_hasMemoryGenerated;
}

- (BOOL)memoryGenerated
{
  return self->_memoryGenerated;
}

- (NSArray)globalTraits
{
  return self->_globalTraits;
}

- (void)setHasQueryContainsMusicMood:(BOOL)a3
{
  self->_hasQueryContainsMusicMood = a3;
}

- (BOOL)hasQueryContainsMusicMood
{
  return self->_hasQueryContainsMusicMood;
}

- (BOOL)queryContainsMusicMood
{
  return self->_queryContainsMusicMood;
}

- (void)setHasQueryContainsMusicGenre:(BOOL)a3
{
  self->_hasQueryContainsMusicGenre = a3;
}

- (BOOL)hasQueryContainsMusicGenre
{
  return self->_hasQueryContainsMusicGenre;
}

- (BOOL)queryContainsMusicGenre
{
  return self->_queryContainsMusicGenre;
}

- (void)setHasQueryContainsMusicSong:(BOOL)a3
{
  self->_hasQueryContainsMusicSong = a3;
}

- (BOOL)hasQueryContainsMusicSong
{
  return self->_hasQueryContainsMusicSong;
}

- (BOOL)queryContainsMusicSong
{
  return self->_queryContainsMusicSong;
}

- (void)setHasQueryContainsMusicArtist:(BOOL)a3
{
  self->_hasQueryContainsMusicArtist = a3;
}

- (BOOL)hasQueryContainsMusicArtist
{
  return self->_hasQueryContainsMusicArtist;
}

- (BOOL)queryContainsMusicArtist
{
  return self->_queryContainsMusicArtist;
}

- (void)setHasQueryContainsTripEntity:(BOOL)a3
{
  self->_hasQueryContainsTripEntity = a3;
}

- (BOOL)hasQueryContainsTripEntity
{
  return self->_hasQueryContainsTripEntity;
}

- (BOOL)queryContainsTripEntity
{
  return self->_queryContainsTripEntity;
}

- (void)setHasQueryContainsLocationEntity:(BOOL)a3
{
  self->_hasQueryContainsLocationEntity = a3;
}

- (BOOL)hasQueryContainsLocationEntity
{
  return self->_hasQueryContainsLocationEntity;
}

- (BOOL)queryContainsLocationEntity
{
  return self->_queryContainsLocationEntity;
}

- (void)setHasQueryContainsTimeEntity:(BOOL)a3
{
  self->_hasQueryContainsTimeEntity = a3;
}

- (BOOL)hasQueryContainsTimeEntity
{
  return self->_hasQueryContainsTimeEntity;
}

- (BOOL)queryContainsTimeEntity
{
  return self->_queryContainsTimeEntity;
}

- (void)setHasQueryContainsActivityEntity:(BOOL)a3
{
  self->_hasQueryContainsActivityEntity = a3;
}

- (BOOL)hasQueryContainsActivityEntity
{
  return self->_hasQueryContainsActivityEntity;
}

- (BOOL)queryContainsActivityEntity
{
  return self->_queryContainsActivityEntity;
}

- (void)setHasQueryContainsPersonEntity:(BOOL)a3
{
  self->_hasQueryContainsPersonEntity = a3;
}

- (BOOL)hasQueryContainsPersonEntity
{
  return self->_hasQueryContainsPersonEntity;
}

- (BOOL)queryContainsPersonEntity
{
  return self->_queryContainsPersonEntity;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMPhotosMemoryCreation *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPhotosMemoryCreation *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_61;
      }
    }
    if ([(BMPhotosMemoryCreation *)self hasQueryContainsPersonEntity]
      || [v5 hasQueryContainsPersonEntity])
    {
      if (![(BMPhotosMemoryCreation *)self hasQueryContainsPersonEntity]) {
        goto LABEL_61;
      }
      if (![v5 hasQueryContainsPersonEntity]) {
        goto LABEL_61;
      }
      int v13 = [(BMPhotosMemoryCreation *)self queryContainsPersonEntity];
      if (v13 != [v5 queryContainsPersonEntity]) {
        goto LABEL_61;
      }
    }
    if ([(BMPhotosMemoryCreation *)self hasQueryContainsActivityEntity]
      || [v5 hasQueryContainsActivityEntity])
    {
      if (![(BMPhotosMemoryCreation *)self hasQueryContainsActivityEntity]) {
        goto LABEL_61;
      }
      if (![v5 hasQueryContainsActivityEntity]) {
        goto LABEL_61;
      }
      int v14 = [(BMPhotosMemoryCreation *)self queryContainsActivityEntity];
      if (v14 != [v5 queryContainsActivityEntity]) {
        goto LABEL_61;
      }
    }
    if ([(BMPhotosMemoryCreation *)self hasQueryContainsTimeEntity]
      || [v5 hasQueryContainsTimeEntity])
    {
      if (![(BMPhotosMemoryCreation *)self hasQueryContainsTimeEntity]) {
        goto LABEL_61;
      }
      if (![v5 hasQueryContainsTimeEntity]) {
        goto LABEL_61;
      }
      int v15 = [(BMPhotosMemoryCreation *)self queryContainsTimeEntity];
      if (v15 != [v5 queryContainsTimeEntity]) {
        goto LABEL_61;
      }
    }
    if ([(BMPhotosMemoryCreation *)self hasQueryContainsLocationEntity]
      || [v5 hasQueryContainsLocationEntity])
    {
      if (![(BMPhotosMemoryCreation *)self hasQueryContainsLocationEntity]) {
        goto LABEL_61;
      }
      if (![v5 hasQueryContainsLocationEntity]) {
        goto LABEL_61;
      }
      int v16 = [(BMPhotosMemoryCreation *)self queryContainsLocationEntity];
      if (v16 != [v5 queryContainsLocationEntity]) {
        goto LABEL_61;
      }
    }
    if ([(BMPhotosMemoryCreation *)self hasQueryContainsTripEntity]
      || [v5 hasQueryContainsTripEntity])
    {
      if (![(BMPhotosMemoryCreation *)self hasQueryContainsTripEntity]) {
        goto LABEL_61;
      }
      if (![v5 hasQueryContainsTripEntity]) {
        goto LABEL_61;
      }
      int v17 = [(BMPhotosMemoryCreation *)self queryContainsTripEntity];
      if (v17 != [v5 queryContainsTripEntity]) {
        goto LABEL_61;
      }
    }
    if ([(BMPhotosMemoryCreation *)self hasQueryContainsMusicArtist]
      || [v5 hasQueryContainsMusicArtist])
    {
      if (![(BMPhotosMemoryCreation *)self hasQueryContainsMusicArtist]) {
        goto LABEL_61;
      }
      if (![v5 hasQueryContainsMusicArtist]) {
        goto LABEL_61;
      }
      int v18 = [(BMPhotosMemoryCreation *)self queryContainsMusicArtist];
      if (v18 != [v5 queryContainsMusicArtist]) {
        goto LABEL_61;
      }
    }
    if ([(BMPhotosMemoryCreation *)self hasQueryContainsMusicSong]
      || [v5 hasQueryContainsMusicSong])
    {
      if (![(BMPhotosMemoryCreation *)self hasQueryContainsMusicSong]) {
        goto LABEL_61;
      }
      if (![v5 hasQueryContainsMusicSong]) {
        goto LABEL_61;
      }
      int v19 = [(BMPhotosMemoryCreation *)self queryContainsMusicSong];
      if (v19 != [v5 queryContainsMusicSong]) {
        goto LABEL_61;
      }
    }
    if ([(BMPhotosMemoryCreation *)self hasQueryContainsMusicGenre]
      || [v5 hasQueryContainsMusicGenre])
    {
      if (![(BMPhotosMemoryCreation *)self hasQueryContainsMusicGenre]) {
        goto LABEL_61;
      }
      if (![v5 hasQueryContainsMusicGenre]) {
        goto LABEL_61;
      }
      int v20 = [(BMPhotosMemoryCreation *)self queryContainsMusicGenre];
      if (v20 != [v5 queryContainsMusicGenre]) {
        goto LABEL_61;
      }
    }
    if ([(BMPhotosMemoryCreation *)self hasQueryContainsMusicMood]
      || [v5 hasQueryContainsMusicMood])
    {
      if (![(BMPhotosMemoryCreation *)self hasQueryContainsMusicMood]) {
        goto LABEL_61;
      }
      if (![v5 hasQueryContainsMusicMood]) {
        goto LABEL_61;
      }
      int v21 = [(BMPhotosMemoryCreation *)self queryContainsMusicMood];
      if (v21 != [v5 queryContainsMusicMood]) {
        goto LABEL_61;
      }
    }
    v22 = [(BMPhotosMemoryCreation *)self globalTraits];
    uint64_t v23 = [v5 globalTraits];
    if (v22 == (void *)v23)
    {
    }
    else
    {
      v24 = (void *)v23;
      v25 = [(BMPhotosMemoryCreation *)self globalTraits];
      v26 = [v5 globalTraits];
      int v27 = [v25 isEqual:v26];

      if (!v27) {
        goto LABEL_61;
      }
    }
    if (![(BMPhotosMemoryCreation *)self hasMemoryGenerated]
      && ![v5 hasMemoryGenerated]
      || [(BMPhotosMemoryCreation *)self hasMemoryGenerated]
      && [v5 hasMemoryGenerated]
      && (int v28 = [(BMPhotosMemoryCreation *)self memoryGenerated],
          v28 == [v5 memoryGenerated]))
    {
      int v30 = [(BMPhotosMemoryCreation *)self memoryAssetCount];
      BOOL v12 = v30 == [v5 memoryAssetCount];
      goto LABEL_62;
    }
LABEL_61:
    BOOL v12 = 0;
LABEL_62:

    goto LABEL_63;
  }
  BOOL v12 = 0;
LABEL_63:

  return v12;
}

- (id)jsonDictionary
{
  v42[13] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMPhotosMemoryCreation *)self identifier];
  if ([(BMPhotosMemoryCreation *)self hasQueryContainsPersonEntity])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsPersonEntity](self, "queryContainsPersonEntity"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMPhotosMemoryCreation *)self hasQueryContainsActivityEntity])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsActivityEntity](self, "queryContainsActivityEntity"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMPhotosMemoryCreation *)self hasQueryContainsTimeEntity])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsTimeEntity](self, "queryContainsTimeEntity"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if ([(BMPhotosMemoryCreation *)self hasQueryContainsLocationEntity])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsLocationEntity](self, "queryContainsLocationEntity"));
    id v40 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v40 = 0;
  }
  if ([(BMPhotosMemoryCreation *)self hasQueryContainsTripEntity])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsTripEntity](self, "queryContainsTripEntity"));
    id v39 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v39 = 0;
  }
  if ([(BMPhotosMemoryCreation *)self hasQueryContainsMusicArtist])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicArtist](self, "queryContainsMusicArtist"));
    id v38 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v38 = 0;
  }
  if ([(BMPhotosMemoryCreation *)self hasQueryContainsMusicSong])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicSong](self, "queryContainsMusicSong"));
    id v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v37 = 0;
  }
  if ([(BMPhotosMemoryCreation *)self hasQueryContainsMusicGenre])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicGenre](self, "queryContainsMusicGenre"));
    id v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v36 = 0;
  }
  if ([(BMPhotosMemoryCreation *)self hasQueryContainsMusicMood])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicMood](self, "queryContainsMusicMood"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  v35 = [(BMPhotosMemoryCreation *)self _globalTraitsJSONArray];
  if ([(BMPhotosMemoryCreation *)self hasMemoryGenerated])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation memoryGenerated](self, "memoryGenerated"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosMemoryCreation memoryAssetCount](self, "memoryAssetCount"));
  v41[0] = @"identifier";
  uint64_t v10 = v3;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v10;
  v42[0] = v10;
  v41[1] = @"queryContainsPersonEntity";
  uint64_t v11 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  int v28 = (void *)v11;
  v42[1] = v11;
  v41[2] = @"queryContainsActivityEntity";
  uint64_t v12 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  int v27 = (void *)v12;
  v42[2] = v12;
  v41[3] = @"queryContainsTimeEntity";
  uint64_t v13 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v13;
  v42[3] = v13;
  v41[4] = @"queryContainsLocationEntity";
  uint64_t v14 = (uint64_t)v40;
  if (!v40)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v3;
  v42[4] = v14;
  v41[5] = @"queryContainsTripEntity";
  uint64_t v15 = (uint64_t)v39;
  if (!v39)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = v4;
  v42[5] = v15;
  v41[6] = @"queryContainsMusicArtist";
  int v16 = v38;
  if (!v38)
  {
    int v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = v5;
  v42[6] = v16;
  v41[7] = @"queryContainsMusicSong";
  int v17 = v37;
  if (!v37)
  {
    int v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = v6;
  v42[7] = v17;
  v41[8] = @"queryContainsMusicGenre";
  int v18 = v36;
  if (!v36)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v14;
  v42[8] = v18;
  v41[9] = @"queryContainsMusicMood";
  int v19 = v7;
  if (!v7)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v15;
  v42[9] = v19;
  v41[10] = @"globalTraits";
  int v20 = v35;
  if (!v35)
  {
    int v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[10] = v20;
  v41[11] = @"memoryGenerated";
  int v21 = v8;
  if (!v8)
  {
    int v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[11] = v21;
  v41[12] = @"memoryAssetCount";
  v22 = v9;
  if (!v9)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[12] = v22;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:13];
  if (v9)
  {
    if (v8) {
      goto LABEL_59;
    }
  }
  else
  {

    if (v8) {
      goto LABEL_59;
    }
  }

LABEL_59:
  if (v35)
  {
    if (v7) {
      goto LABEL_61;
    }
  }
  else
  {

    if (v7) {
      goto LABEL_61;
    }
  }

LABEL_61:
  if (!v36) {

  }
  if (!v37) {
  if (!v38)
  }

  if (!v39) {
  if (v40)
  }
  {
    if (v31) {
      goto LABEL_71;
    }
  }
  else
  {

    if (v31)
    {
LABEL_71:
      if (v32) {
        goto LABEL_72;
      }
      goto LABEL_83;
    }
  }

  if (v32)
  {
LABEL_72:
    if (v33) {
      goto LABEL_73;
    }
LABEL_84:

    if (v34) {
      goto LABEL_74;
    }
    goto LABEL_85;
  }
LABEL_83:

  if (!v33) {
    goto LABEL_84;
  }
LABEL_73:
  if (v34) {
    goto LABEL_74;
  }
LABEL_85:

LABEL_74:

  return v30;
}

- (id)_globalTraitsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMPhotosMemoryCreation *)self globalTraits];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMPhotosMemoryCreation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v208[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"identifier"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        uint64_t v23 = a4;
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v25 = *MEMORY[0x1E4F502C8];
        uint64_t v207 = *MEMORY[0x1E4F28568];
        id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
        v208[0] = v8;
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v208 forKeys:&v207 count:1];
        v26 = 0;
        int v27 = 0;
        *uint64_t v23 = (id)[v24 initWithDomain:v25 code:2 userInfo:v7];
        goto LABEL_140;
      }
      v26 = 0;
      int v27 = 0;
      goto LABEL_141;
    }
    id v172 = v6;
  }
  else
  {
    id v172 = 0;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"queryContainsPersonEntity"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v8 = 0;
        int v27 = 0;
        v26 = v172;
        goto LABEL_140;
      }
      int v28 = a4;
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v30 = *MEMORY[0x1E4F502C8];
      uint64_t v205 = *MEMORY[0x1E4F28568];
      v31 = v7;
      id v32 = [NSString alloc];
      uint64_t v136 = objc_opt_class();
      v33 = v32;
      uint64_t v7 = v31;
      id v10 = (id)[v33 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v136, @"queryContainsPersonEntity"];
      id v206 = v10;
      uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v206 forKeys:&v205 count:1];
      uint64_t v35 = v30;
      v9 = (void *)v34;
      id v8 = 0;
      int v27 = 0;
      *int v28 = (id)[v29 initWithDomain:v35 code:2 userInfo:v34];
      goto LABEL_97;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v5 objectForKeyedSubscript:@"queryContainsActivityEntity"];
  v171 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        goto LABEL_10;
      }
      if (a4)
      {
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v203 = *MEMORY[0x1E4F28568];
        id v38 = v8;
        id v39 = [NSString alloc];
        uint64_t v137 = objc_opt_class();
        id v40 = v39;
        id v8 = v38;
        id v169 = (id)[v40 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v137, @"queryContainsActivityEntity"];
        id v204 = v169;
        uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v204 forKeys:&v203 count:1];
        v42 = v36;
        long long v11 = (void *)v41;
        id v10 = 0;
        int v27 = 0;
        id *v171 = (id)[v42 initWithDomain:v37 code:2 userInfo:v41];
        goto LABEL_102;
      }
      id v10 = 0;
      int v27 = 0;
LABEL_97:
      v26 = v172;
      goto LABEL_139;
    }
  }
  id v10 = 0;
LABEL_10:
  long long v11 = [v5 objectForKeyedSubscript:@"queryContainsTimeEntity"];
  id v167 = v10;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v169 = v11;
        goto LABEL_13;
      }
      if (v171)
      {
        id v170 = objc_alloc(MEMORY[0x1E4F28C58]);
        v44 = v9;
        uint64_t v45 = *MEMORY[0x1E4F502C8];
        uint64_t v201 = *MEMORY[0x1E4F28568];
        id v46 = v8;
        id v47 = [NSString alloc];
        uint64_t v138 = objc_opt_class();
        v48 = v47;
        id v8 = v46;
        id v168 = (id)[v48 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v138, @"queryContainsTimeEntity"];
        id v202 = v168;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v202 forKeys:&v201 count:1];
        uint64_t v50 = v49 = v6;
        uint64_t v51 = v45;
        v9 = v44;
        id v10 = v167;
        id v52 = (id)[v170 initWithDomain:v51 code:2 userInfo:v50];
        id v169 = 0;
        int v27 = 0;
        id *v171 = v52;
        long long v12 = (void *)v50;
        uint64_t v6 = v49;
        v26 = v172;
        goto LABEL_137;
      }
      id v169 = 0;
      int v27 = 0;
LABEL_102:
      v26 = v172;
      goto LABEL_138;
    }
  }
  id v169 = 0;
LABEL_13:
  long long v12 = [v5 objectForKeyedSubscript:@"queryContainsLocationEntity"];
  v165 = v6;
  v166 = v7;
  v162 = v11;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v171)
      {
        id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
        v54 = v9;
        uint64_t v55 = *MEMORY[0x1E4F502C8];
        uint64_t v199 = *MEMORY[0x1E4F28568];
        id v56 = v8;
        id v57 = [NSString alloc];
        uint64_t v139 = objc_opt_class();
        v58 = v57;
        id v8 = v56;
        id v164 = (id)[v58 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v139, @"queryContainsLocationEntity"];
        id v200 = v164;
        uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v200 forKeys:&v199 count:1];
        v60 = v53;
        long long v11 = v162;
        uint64_t v61 = v55;
        v9 = v54;
        id v10 = v167;
        v163 = (void *)v59;
        id v168 = 0;
        int v27 = 0;
        id *v171 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2);
        v26 = v172;
        goto LABEL_136;
      }
      id v168 = 0;
      int v27 = 0;
      v26 = v172;
      goto LABEL_137;
    }
    id v13 = v8;
    id v14 = v10;
    id v168 = v12;
  }
  else
  {
    id v13 = v8;
    id v14 = v10;
    id v168 = 0;
  }
  uint64_t v15 = [v5 objectForKeyedSubscript:@"queryContainsTripEntity"];
  v163 = (void *)v15;
  if (v15 && (int v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v171)
      {
        id v164 = 0;
        int v27 = 0;
        v26 = v172;
        id v10 = v14;
        id v8 = v13;
        uint64_t v7 = v166;
        goto LABEL_136;
      }
      id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
      v78 = v9;
      uint64_t v79 = *MEMORY[0x1E4F502C8];
      uint64_t v197 = *MEMORY[0x1E4F28568];
      id v80 = [NSString alloc];
      uint64_t v140 = objc_opt_class();
      v81 = v80;
      id v8 = v13;
      id v161 = (id)[v81 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v140, @"queryContainsTripEntity"];
      id v198 = v161;
      uint64_t v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v198 forKeys:&v197 count:1];
      v83 = v77;
      long long v11 = v162;
      uint64_t v84 = v79;
      v9 = v78;
      id v10 = v167;
      v160 = (void *)v82;
      id v164 = 0;
      int v27 = 0;
      id *v171 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, 2);
      v26 = v172;
      goto LABEL_110;
    }
    id v164 = v16;
  }
  else
  {
    id v164 = 0;
  }
  uint64_t v17 = [v5 objectForKeyedSubscript:@"queryContainsMusicArtist"];
  v160 = (void *)v17;
  if (v17)
  {
    int v18 = (void *)v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v161 = v18;
        goto LABEL_22;
      }
      if (v171)
      {
        id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
        v86 = v9;
        uint64_t v87 = *MEMORY[0x1E4F502C8];
        uint64_t v195 = *MEMORY[0x1E4F28568];
        id v88 = [NSString alloc];
        uint64_t v141 = objc_opt_class();
        v89 = v88;
        id v8 = v13;
        id v159 = (id)[v89 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v141, @"queryContainsMusicArtist"];
        id v196 = v159;
        uint64_t v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v196 forKeys:&v195 count:1];
        v91 = v85;
        long long v11 = v162;
        uint64_t v92 = v87;
        v9 = v86;
        id v10 = v167;
        v158 = (void *)v90;
        id v161 = 0;
        int v27 = 0;
        id *v171 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v92, 2);
        v26 = v172;
LABEL_114:
        uint64_t v7 = v166;
        goto LABEL_134;
      }
      id v161 = 0;
      int v27 = 0;
      v26 = v172;
      id v10 = v14;
      id v8 = v13;
LABEL_110:
      uint64_t v7 = v166;
      goto LABEL_135;
    }
  }
  id v161 = 0;
LABEL_22:
  uint64_t v19 = [v5 objectForKeyedSubscript:@"queryContainsMusicSong"];
  v158 = (void *)v19;
  if (!v19 || (int v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v159 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v171)
    {
      id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
      v98 = v9;
      uint64_t v99 = *MEMORY[0x1E4F502C8];
      uint64_t v193 = *MEMORY[0x1E4F28568];
      id v100 = [NSString alloc];
      uint64_t v142 = objc_opt_class();
      v101 = v100;
      id v8 = v13;
      uint64_t v102 = [v101 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v142, @"queryContainsMusicSong"];
      uint64_t v194 = v102;
      uint64_t v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v194 forKeys:&v193 count:1];
      v104 = v97;
      long long v11 = v162;
      uint64_t v105 = v99;
      v9 = v98;
      v106 = (void *)v102;
      v157 = (void *)v103;
      id v159 = 0;
      int v27 = 0;
      id *v171 = (id)objc_msgSend(v104, "initWithDomain:code:userInfo:", v105, 2);
      v26 = v172;
      uint64_t v7 = v166;
      goto LABEL_133;
    }
    id v159 = 0;
    int v27 = 0;
    v26 = v172;
    id v10 = v14;
    id v8 = v13;
    goto LABEL_114;
  }
  id v159 = v20;
LABEL_25:
  uint64_t v21 = [v5 objectForKeyedSubscript:@"queryContainsMusicGenre"];
  v157 = (void *)v21;
  if (!v21)
  {
    id v156 = 0;
    id v8 = v13;
    goto LABEL_49;
  }
  v22 = (void *)v21;
  objc_opt_class();
  id v8 = v13;
  if (objc_opt_isKindOfClass())
  {
    id v156 = 0;
LABEL_49:
    uint64_t v7 = v166;
    goto LABEL_50;
  }
  objc_opt_class();
  uint64_t v7 = v166;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v109 = v12;
    if (!v171)
    {
      v106 = 0;
      int v27 = 0;
      v26 = v172;
      uint64_t v6 = v165;
      goto LABEL_133;
    }
    id v110 = objc_alloc(MEMORY[0x1E4F28C58]);
    v111 = v9;
    uint64_t v112 = *MEMORY[0x1E4F502C8];
    uint64_t v191 = *MEMORY[0x1E4F28568];
    id v113 = v8;
    id v114 = [NSString alloc];
    uint64_t v143 = objc_opt_class();
    v115 = v114;
    id v8 = v113;
    uint64_t v116 = [v115 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v143, @"queryContainsMusicGenre"];
    uint64_t v192 = v116;
    uint64_t v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v192 forKeys:&v191 count:1];
    v118 = v110;
    long long v11 = v162;
    uint64_t v119 = v112;
    v9 = v111;
    id v43 = (id)v116;
    v155 = (void *)v117;
    id v156 = 0;
    int v27 = 0;
    id *v171 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v119, 2);
    goto LABEL_119;
  }
  id v156 = v22;
LABEL_50:
  id v43 = [v5 objectForKeyedSubscript:@"queryContainsMusicMood"];
  v153 = v9;
  v155 = v43;
  if (v43)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v43 = 0;
      goto LABEL_63;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v43 = v43;
      goto LABEL_63;
    }
    v109 = v12;
    if (v171)
    {
      id v121 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v122 = v8;
      uint64_t v123 = *MEMORY[0x1E4F502C8];
      uint64_t v189 = *MEMORY[0x1E4F28568];
      id v62 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"queryContainsMusicMood"];
      id v190 = v62;
      v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v190 forKeys:&v189 count:1];
      uint64_t v124 = v123;
      id v8 = v122;
      id v125 = (id)[v121 initWithDomain:v124 code:2 userInfo:v66];
      id v43 = 0;
      int v27 = 0;
      id *v171 = v125;
      v26 = v172;
      uint64_t v6 = v165;
      goto LABEL_130;
    }
    id v43 = 0;
    int v27 = 0;
LABEL_119:
    v26 = v172;
    long long v12 = v109;
    uint64_t v6 = v165;
    goto LABEL_132;
  }
LABEL_63:
  id v62 = [v5 objectForKeyedSubscript:@"globalTraits"];
  v63 = [MEMORY[0x1E4F1CA98] null];
  int v64 = [v62 isEqual:v63];

  id v154 = v8;
  if (v64)
  {
    v65 = v12;

    id v62 = 0;
  }
  else
  {
    if (v62)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v171)
        {
          id v126 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v127 = *MEMORY[0x1E4F502C8];
          uint64_t v187 = *MEMORY[0x1E4F28568];
          v66 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"globalTraits"];
          v188 = v66;
          uint64_t v128 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v188 forKeys:&v187 count:1];
          uint64_t v129 = v127;
          id v8 = v154;
          id v130 = (id)[v126 initWithDomain:v129 code:2 userInfo:v128];
          int v27 = 0;
          id *v171 = v130;
          v120 = (void *)v128;
          v26 = v172;
          goto LABEL_129;
        }
        int v27 = 0;
        v26 = v172;
        goto LABEL_131;
      }
    }
    v65 = v12;
  }
  v66 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v62, "count"));
  long long v174 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  id v62 = v62;
  uint64_t v67 = [v62 countByEnumeratingWithState:&v174 objects:v186 count:16];
  if (!v67) {
    goto LABEL_77;
  }
  uint64_t v68 = v67;
  uint64_t v69 = *(void *)v175;
  id v150 = v43;
  while (2)
  {
    for (uint64_t i = 0; i != v68; ++i)
    {
      if (*(void *)v175 != v69) {
        objc_enumerationMutation(v62);
      }
      uint64_t v71 = *(void *)(*((void *)&v174 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v171)
        {
          id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v94 = *MEMORY[0x1E4F502C8];
          uint64_t v184 = *MEMORY[0x1E4F28568];
          v149 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"globalTraits"];
          v185 = v149;
          id v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v185 forKeys:&v184 count:1];
          v95 = v93;
          uint64_t v96 = v94;
LABEL_95:
          v26 = v172;
          uint64_t v7 = v166;
          id v43 = v150;
          int v27 = 0;
          id *v171 = (id)[v95 initWithDomain:v96 code:2 userInfo:v76];
          id v151 = v62;
          long long v12 = v65;
          uint64_t v6 = v165;
          goto LABEL_127;
        }
LABEL_100:
        int v27 = 0;
        v120 = v62;
        v26 = v172;
        id v8 = v154;
        long long v12 = v65;
        uint64_t v6 = v165;
        uint64_t v7 = v166;
        id v43 = v150;
        goto LABEL_129;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v171)
        {
          id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v108 = *MEMORY[0x1E4F502C8];
          uint64_t v182 = *MEMORY[0x1E4F28568];
          v149 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"globalTraits"];
          v183 = v149;
          id v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v183 forKeys:&v182 count:1];
          v95 = v107;
          uint64_t v96 = v108;
          goto LABEL_95;
        }
        goto LABEL_100;
      }
      [v66 addObject:v71];
    }
    uint64_t v68 = [v62 countByEnumeratingWithState:&v174 objects:v186 count:16];
    id v43 = v150;
    if (v68) {
      continue;
    }
    break;
  }
LABEL_77:

  uint64_t v72 = [v5 objectForKeyedSubscript:@"memoryGenerated"];
  v149 = (void *)v72;
  if (v72 && (v73 = (void *)v72, objc_opt_class(), id v8 = v154, (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v151 = v73;
      goto LABEL_80;
    }
    uint64_t v7 = v166;
    if (v171)
    {
      id v131 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v152 = *MEMORY[0x1E4F502C8];
      uint64_t v180 = *MEMORY[0x1E4F28568];
      id v76 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"memoryGenerated"];
      id v181 = v76;
      v148 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v181 forKeys:&v180 count:1];
      id v132 = (id)objc_msgSend(v131, "initWithDomain:code:userInfo:", v152, 2);
      id v151 = 0;
      int v27 = 0;
      id *v171 = v132;
      v26 = v172;
      long long v12 = v65;
      uint64_t v6 = v165;

      goto LABEL_127;
    }
    id v151 = 0;
    int v27 = 0;
    v26 = v172;
    long long v12 = v65;
    uint64_t v6 = v165;
  }
  else
  {
    id v151 = 0;
LABEL_80:
    uint64_t v7 = v166;
    long long v12 = v65;
    uint64_t v74 = [v5 objectForKeyedSubscript:@"memoryAssetCount"];
    uint64_t v6 = v165;
    v147 = (void *)v74;
    if (!v74 || (v75 = (void *)v74, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v76 = 0;
      v26 = v172;
      goto LABEL_125;
    }
    v26 = v172;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v76 = v75;
      goto LABEL_125;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v76 = [NSNumber numberWithInt:BMPhotosMemoryCreationMemoryAssetCountFromString(v75)];
      uint64_t v7 = v166;
LABEL_125:
      LODWORD(v144) = [v76 intValue];
      int v27 = [(BMPhotosMemoryCreation *)self initWithIdentifier:v26 queryContainsPersonEntity:v154 queryContainsActivityEntity:v167 queryContainsTimeEntity:v169 queryContainsLocationEntity:v168 queryContainsTripEntity:v164 queryContainsMusicArtist:v161 queryContainsMusicSong:v159 queryContainsMusicGenre:v156 queryContainsMusicMood:v43 globalTraits:v66 memoryGenerated:v151 memoryAssetCount:v144];
      self = v27;
    }
    else
    {
      if (v171)
      {
        id v146 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v145 = *MEMORY[0x1E4F502C8];
        uint64_t v178 = *MEMORY[0x1E4F28568];
        v134 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"memoryAssetCount"];
        v179 = v134;
        v135 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v178 count:1];
        id *v171 = (id)[v146 initWithDomain:v145 code:2 userInfo:v135];
      }
      id v76 = 0;
      int v27 = 0;
      uint64_t v7 = v166;
    }

LABEL_127:
    id v8 = v154;
  }

  v120 = v151;
LABEL_129:

LABEL_130:
LABEL_131:

  v9 = v153;
  long long v11 = v162;
LABEL_132:

  v106 = v156;
LABEL_133:

  id v10 = v167;
LABEL_134:

LABEL_135:
LABEL_136:

LABEL_137:
LABEL_138:

LABEL_139:
LABEL_140:

LABEL_141:
  return v27;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMPhotosMemoryCreation *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasQueryContainsPersonEntity) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasQueryContainsActivityEntity) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasQueryContainsTimeEntity) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasQueryContainsLocationEntity) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasQueryContainsTripEntity) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasQueryContainsMusicArtist) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasQueryContainsMusicSong) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasQueryContainsMusicGenre) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasQueryContainsMusicMood) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_globalTraits;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_hasMemoryGenerated) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)BMPhotosMemoryCreation;
  id v5 = [(BMEventBase *)&v97 init];
  if (!v5) {
    goto LABEL_153;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        unint64_t v15 = *(void *)&v4[v14];
        if (v15 == -1 || v15 >= *(void *)&v4[*v8]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v17 = v12++ >= 9;
        if (v17)
        {
          unint64_t v13 = 0;
          int v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v18 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v18 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          identifier = v5->_identifier;
          v5->_identifier = (NSString *)v20;

          continue;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          v5->_hasQueryContainsPersonEntity = 1;
          while (2)
          {
            uint64_t v25 = *v7;
            unint64_t v26 = *(void *)&v4[v25];
            if (v26 == -1 || v26 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)&v4[*v10] + v26);
              *(void *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v17 = v23++ >= 9;
                if (v17)
                {
                  uint64_t v24 = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v24 = 0;
          }
LABEL_105:
          BOOL v90 = v24 != 0;
          uint64_t v91 = 16;
          goto LABEL_142;
        case 3u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasQueryContainsActivityEntity = 1;
          while (2)
          {
            uint64_t v31 = *v7;
            unint64_t v32 = *(void *)&v4[v31];
            if (v32 == -1 || v32 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)&v4[*v10] + v32);
              *(void *)&v4[v31] = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                BOOL v17 = v29++ >= 9;
                if (v17)
                {
                  uint64_t v30 = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v30 = 0;
          }
LABEL_109:
          BOOL v90 = v30 != 0;
          uint64_t v91 = 18;
          goto LABEL_142;
        case 4u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          v5->_hasQueryContainsTimeEntity = 1;
          while (2)
          {
            uint64_t v37 = *v7;
            unint64_t v38 = *(void *)&v4[v37];
            if (v38 == -1 || v38 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v4[*v10] + v38);
              *(void *)&v4[v37] = v38 + 1;
              v36 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                BOOL v17 = v35++ >= 9;
                if (v17)
                {
                  uint64_t v36 = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v36 = 0;
          }
LABEL_113:
          BOOL v90 = v36 != 0;
          uint64_t v91 = 20;
          goto LABEL_142;
        case 5u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          v5->_hasQueryContainsLocationEntity = 1;
          while (2)
          {
            uint64_t v43 = *v7;
            unint64_t v44 = *(void *)&v4[v43];
            if (v44 == -1 || v44 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)&v4[*v10] + v44);
              *(void *)&v4[v43] = v44 + 1;
              v42 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                BOOL v17 = v41++ >= 9;
                if (v17)
                {
                  uint64_t v42 = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v42 = 0;
          }
LABEL_117:
          BOOL v90 = v42 != 0;
          uint64_t v91 = 22;
          goto LABEL_142;
        case 6u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v48 = 0;
          v5->_hasQueryContainsTripEntity = 1;
          while (2)
          {
            uint64_t v49 = *v7;
            unint64_t v50 = *(void *)&v4[v49];
            if (v50 == -1 || v50 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v51 = *(unsigned char *)(*(void *)&v4[*v10] + v50);
              *(void *)&v4[v49] = v50 + 1;
              v48 |= (unint64_t)(v51 & 0x7F) << v46;
              if (v51 < 0)
              {
                v46 += 7;
                BOOL v17 = v47++ >= 9;
                if (v17)
                {
                  uint64_t v48 = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v48 = 0;
          }
LABEL_121:
          BOOL v90 = v48 != 0;
          uint64_t v91 = 24;
          goto LABEL_142;
        case 7u:
          char v52 = 0;
          unsigned int v53 = 0;
          uint64_t v54 = 0;
          v5->_hasQueryContainsMusicArtist = 1;
          while (2)
          {
            uint64_t v55 = *v7;
            unint64_t v56 = *(void *)&v4[v55];
            if (v56 == -1 || v56 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v57 = *(unsigned char *)(*(void *)&v4[*v10] + v56);
              *(void *)&v4[v55] = v56 + 1;
              v54 |= (unint64_t)(v57 & 0x7F) << v52;
              if (v57 < 0)
              {
                v52 += 7;
                BOOL v17 = v53++ >= 9;
                if (v17)
                {
                  uint64_t v54 = 0;
                  goto LABEL_125;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v54 = 0;
          }
LABEL_125:
          BOOL v90 = v54 != 0;
          uint64_t v91 = 26;
          goto LABEL_142;
        case 8u:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v60 = 0;
          v5->_hasQueryContainsMusicSong = 1;
          while (2)
          {
            uint64_t v61 = *v7;
            unint64_t v62 = *(void *)&v4[v61];
            if (v62 == -1 || v62 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v63 = *(unsigned char *)(*(void *)&v4[*v10] + v62);
              *(void *)&v4[v61] = v62 + 1;
              v60 |= (unint64_t)(v63 & 0x7F) << v58;
              if (v63 < 0)
              {
                v58 += 7;
                BOOL v17 = v59++ >= 9;
                if (v17)
                {
                  uint64_t v60 = 0;
                  goto LABEL_129;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v60 = 0;
          }
LABEL_129:
          BOOL v90 = v60 != 0;
          uint64_t v91 = 28;
          goto LABEL_142;
        case 9u:
          char v64 = 0;
          unsigned int v65 = 0;
          uint64_t v66 = 0;
          v5->_hasQueryContainsMusicGenre = 1;
          while (2)
          {
            uint64_t v67 = *v7;
            unint64_t v68 = *(void *)&v4[v67];
            if (v68 == -1 || v68 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v69 = *(unsigned char *)(*(void *)&v4[*v10] + v68);
              *(void *)&v4[v67] = v68 + 1;
              v66 |= (unint64_t)(v69 & 0x7F) << v64;
              if (v69 < 0)
              {
                v64 += 7;
                BOOL v17 = v65++ >= 9;
                if (v17)
                {
                  uint64_t v66 = 0;
                  goto LABEL_133;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v66 = 0;
          }
LABEL_133:
          BOOL v90 = v66 != 0;
          uint64_t v91 = 30;
          goto LABEL_142;
        case 0xAu:
          char v70 = 0;
          unsigned int v71 = 0;
          uint64_t v72 = 0;
          v5->_hasQueryContainsMusicMood = 1;
          while (2)
          {
            uint64_t v73 = *v7;
            unint64_t v74 = *(void *)&v4[v73];
            if (v74 == -1 || v74 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v75 = *(unsigned char *)(*(void *)&v4[*v10] + v74);
              *(void *)&v4[v73] = v74 + 1;
              v72 |= (unint64_t)(v75 & 0x7F) << v70;
              if (v75 < 0)
              {
                v70 += 7;
                BOOL v17 = v71++ >= 9;
                if (v17)
                {
                  uint64_t v72 = 0;
                  goto LABEL_137;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v72 = 0;
          }
LABEL_137:
          BOOL v90 = v72 != 0;
          uint64_t v91 = 32;
          goto LABEL_142;
        case 0xBu:
          uint64_t v76 = PBReaderReadString();
          if (!v76) {
            goto LABEL_155;
          }
          id v77 = (void *)v76;
          [v6 addObject:v76];

          continue;
        case 0xCu:
          char v78 = 0;
          unsigned int v79 = 0;
          uint64_t v80 = 0;
          v5->_hasMemoryGenerated = 1;
          while (2)
          {
            uint64_t v81 = *v7;
            unint64_t v82 = *(void *)&v4[v81];
            if (v82 == -1 || v82 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v83 = *(unsigned char *)(*(void *)&v4[*v10] + v82);
              *(void *)&v4[v81] = v82 + 1;
              v80 |= (unint64_t)(v83 & 0x7F) << v78;
              if (v83 < 0)
              {
                v78 += 7;
                BOOL v17 = v79++ >= 9;
                if (v17)
                {
                  uint64_t v80 = 0;
                  goto LABEL_141;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v80 = 0;
          }
LABEL_141:
          BOOL v90 = v80 != 0;
          uint64_t v91 = 34;
LABEL_142:
          *((unsigned char *)&v5->super.super.isa + v91) = v90;
          continue;
        case 0xDu:
          char v84 = 0;
          unsigned int v85 = 0;
          uint64_t v86 = 0;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_155:

          goto LABEL_152;
      }
      while (1)
      {
        uint64_t v87 = *v7;
        unint64_t v88 = *(void *)&v4[v87];
        if (v88 == -1 || v88 >= *(void *)&v4[*v8]) {
          break;
        }
        char v89 = *(unsigned char *)(*(void *)&v4[*v10] + v88);
        *(void *)&v4[v87] = v88 + 1;
        v86 |= (unint64_t)(v89 & 0x7F) << v84;
        if ((v89 & 0x80) == 0) {
          goto LABEL_146;
        }
        v84 += 7;
        BOOL v17 = v85++ >= 9;
        if (v17)
        {
          LODWORD(v86) = 0;
          goto LABEL_148;
        }
      }
      v4[*v9] = 1;
LABEL_146:
      if (v4[*v9]) {
        LODWORD(v86) = 0;
      }
LABEL_148:
      if (v86 >= 5) {
        LODWORD(v86) = 0;
      }
      v5->_memoryAssetCount = v86;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v92 = [v6 copy];
  globalTraits = v5->_globalTraits;
  v5->_globalTraits = (NSArray *)v92;

  int v94 = v4[*v9];
  if (v94) {
LABEL_152:
  }
    v95 = 0;
  else {
LABEL_153:
  }
    v95 = v5;

  return v95;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  uint64_t v14 = [(BMPhotosMemoryCreation *)self identifier];
  unint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsPersonEntity](self, "queryContainsPersonEntity"));
  int v18 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsActivityEntity](self, "queryContainsActivityEntity"));
  BOOL v17 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsTimeEntity](self, "queryContainsTimeEntity"));
  unsigned int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsLocationEntity](self, "queryContainsLocationEntity"));
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsTripEntity](self, "queryContainsTripEntity"));
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicArtist](self, "queryContainsMusicArtist"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicSong](self, "queryContainsMusicSong"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicGenre](self, "queryContainsMusicGenre"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicMood](self, "queryContainsMusicMood"));
  uint64_t v8 = [(BMPhotosMemoryCreation *)self globalTraits];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoryCreation memoryGenerated](self, "memoryGenerated"));
  long long v10 = BMPhotosMemoryCreationMemoryAssetCountAsString([(BMPhotosMemoryCreation *)self memoryAssetCount]);
  char v16 = (void *)[v15 initWithFormat:@"BMPhotosMemoryCreation with identifier: %@, queryContainsPersonEntity: %@, queryContainsActivityEntity: %@, queryContainsTimeEntity: %@, queryContainsLocationEntity: %@, queryContainsTripEntity: %@, queryContainsMusicArtist: %@, queryContainsMusicSong: %@, queryContainsMusicGenre: %@, queryContainsMusicMood: %@, globalTraits: %@, memoryGenerated: %@, memoryAssetCount: %@", v14, v13, v18, v17, v12, v3, v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v16;
}

- (BMPhotosMemoryCreation)initWithIdentifier:(id)a3 queryContainsPersonEntity:(id)a4 queryContainsActivityEntity:(id)a5 queryContainsTimeEntity:(id)a6 queryContainsLocationEntity:(id)a7 queryContainsTripEntity:(id)a8 queryContainsMusicArtist:(id)a9 queryContainsMusicSong:(id)a10 queryContainsMusicGenre:(id)a11 queryContainsMusicMood:(id)a12 globalTraits:(id)a13 memoryGenerated:(id)a14 memoryAssetCount:(int)a15
{
  id v32 = a3;
  id v21 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  v36.receiver = self;
  v36.super_class = (Class)BMPhotosMemoryCreation;
  unsigned int v29 = [(BMEventBase *)&v36 init];
  if (v29)
  {
    v29->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v29->_identifier, a3);
    if (v21)
    {
      v29->_hasQueryContainsPersonEntity = 1;
      v29->_queryContainsPersonEntity = [v21 BOOLValue];
    }
    else
    {
      v29->_hasQueryContainsPersonEntity = 0;
      v29->_queryContainsPersonEntity = 0;
    }
    if (v35)
    {
      v29->_hasQueryContainsActivityEntity = 1;
      v29->_queryContainsActivityEntity = [v35 BOOLValue];
    }
    else
    {
      v29->_hasQueryContainsActivityEntity = 0;
      v29->_queryContainsActivityEntity = 0;
    }
    if (v34)
    {
      v29->_hasQueryContainsTimeEntity = 1;
      v29->_queryContainsTimeEntity = [v34 BOOLValue];
    }
    else
    {
      v29->_hasQueryContainsTimeEntity = 0;
      v29->_queryContainsTimeEntity = 0;
    }
    if (v33)
    {
      v29->_hasQueryContainsLocationEntity = 1;
      v29->_queryContainsLocationEntity = [v33 BOOLValue];
    }
    else
    {
      v29->_hasQueryContainsLocationEntity = 0;
      v29->_queryContainsLocationEntity = 0;
    }
    if (v22)
    {
      v29->_hasQueryContainsTripEntity = 1;
      v29->_queryContainsTripEntity = [v22 BOOLValue];
    }
    else
    {
      v29->_hasQueryContainsTripEntity = 0;
      v29->_queryContainsTripEntity = 0;
    }
    if (v23)
    {
      v29->_hasQueryContainsMusicArtist = 1;
      v29->_queryContainsMusicArtist = [v23 BOOLValue];
    }
    else
    {
      v29->_hasQueryContainsMusicArtist = 0;
      v29->_queryContainsMusicArtist = 0;
    }
    if (v24)
    {
      v29->_hasQueryContainsMusicSong = 1;
      v29->_queryContainsMusicSong = [v24 BOOLValue];
    }
    else
    {
      v29->_hasQueryContainsMusicSong = 0;
      v29->_queryContainsMusicSong = 0;
    }
    if (v25)
    {
      v29->_hasQueryContainsMusicGenre = 1;
      v29->_queryContainsMusicGenre = [v25 BOOLValue];
    }
    else
    {
      v29->_hasQueryContainsMusicGenre = 0;
      v29->_queryContainsMusicGenre = 0;
    }
    if (v26)
    {
      v29->_hasQueryContainsMusicMood = 1;
      v29->_queryContainsMusicMood = [v26 BOOLValue];
    }
    else
    {
      v29->_hasQueryContainsMusicMood = 0;
      v29->_queryContainsMusicMood = 0;
    }
    objc_storeStrong((id *)&v29->_globalTraits, a13);
    if (v28)
    {
      v29->_hasMemoryGenerated = 1;
      v29->_memoryGenerated = [v28 BOOLValue];
    }
    else
    {
      v29->_hasMemoryGenerated = 0;
      v29->_memoryGenerated = 0;
    }
    v29->_memoryAssetCount = a15;
  }

  return v29;
}

+ (id)protoFields
{
  v17[13] = *MEMORY[0x1E4F143B8];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  v17[0] = v16;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queryContainsPersonEntity" number:2 type:12 subMessageClass:0];
  v17[1] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queryContainsActivityEntity" number:3 type:12 subMessageClass:0];
  v17[2] = v14;
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queryContainsTimeEntity" number:4 type:12 subMessageClass:0];
  v17[3] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queryContainsLocationEntity" number:5 type:12 subMessageClass:0];
  v17[4] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queryContainsTripEntity" number:6 type:12 subMessageClass:0];
  v17[5] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queryContainsMusicArtist" number:7 type:12 subMessageClass:0];
  v17[6] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queryContainsMusicSong" number:8 type:12 subMessageClass:0];
  v17[7] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queryContainsMusicGenre" number:9 type:12 subMessageClass:0];
  v17[8] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queryContainsMusicMood" number:10 type:12 subMessageClass:0];
  v17[9] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"globalTraits" number:11 type:13 subMessageClass:0];
  v17[10] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"memoryGenerated" number:12 type:12 subMessageClass:0];
  v17[11] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"memoryAssetCount" number:13 type:4 subMessageClass:0];
  v17[12] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:13];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5B80;
}

id __33__BMPhotosMemoryCreation_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _globalTraitsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMPhotosMemoryCreation alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[9] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end