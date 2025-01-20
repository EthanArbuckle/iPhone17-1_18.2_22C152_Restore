@interface PHSearchResult
- (BOOL)hasOCRTextMatch;
- (BOOL)isEligibleForSuggestions;
- (BOOL)isExclusivelyExactOCRTextMatch;
- (BOOL)isSensitiveLocation;
- (NSArray)assetAlbumUUIDs;
- (NSArray)assetHighlightUUIDs;
- (NSArray)assetMemoryUUIDs;
- (NSArray)audioIdentifiers;
- (NSArray)embeddingDistances;
- (NSArray)humanActionIdentifiers;
- (NSArray)personUUIDS;
- (NSArray)sceneIdentifiers;
- (NSNumber)collectionScore;
- (NSNumber)l1Score;
- (NSNumber)l2Score;
- (NSString)uuid;
- (PHSearchResult)initWithSearchResultType:(unint64_t)a3 uuid:(id)a4 personUUIDs:(id)a5 sceneIdentifiers:(id)a6 audioIdentifiers:(id)a7 humanActionIdentifiers:(id)a8 retrievalType:(unint64_t)a9 hasOCRTextMatch:(BOOL)a10 isSensitiveLocation:(BOOL)a11 embeddingDistances:(id)a12 l1Score:(id)a13 l2Score:(id)a14 collectionScore:(id)a15 assetAlbumUUIDs:(id)a16 assetMemoryUUIDs:(id)a17 assetHighlightUUIDs:(id)a18;
- (id)description;
- (id)jsonDictionary;
- (unint64_t)matchType;
- (unint64_t)retrievalType;
- (unint64_t)type;
- (void)releaseOwningCollectionUUIDs;
@end

@implementation PHSearchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_audioIdentifiers, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_personUUIDS, 0);
  objc_storeStrong((id *)&self->_assetHighlightUUIDs, 0);
  objc_storeStrong((id *)&self->_assetMemoryUUIDs, 0);
  objc_storeStrong((id *)&self->_assetAlbumUUIDs, 0);
  objc_storeStrong((id *)&self->_collectionScore, 0);
  objc_storeStrong((id *)&self->_l2Score, 0);
  objc_storeStrong((id *)&self->_l1Score, 0);
  objc_storeStrong((id *)&self->_embeddingDistances, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSArray)humanActionIdentifiers
{
  return self->_humanActionIdentifiers;
}

- (NSArray)audioIdentifiers
{
  return self->_audioIdentifiers;
}

- (NSArray)sceneIdentifiers
{
  return self->_sceneIdentifiers;
}

- (NSArray)personUUIDS
{
  return self->_personUUIDS;
}

- (NSArray)assetHighlightUUIDs
{
  return self->_assetHighlightUUIDs;
}

- (NSArray)assetMemoryUUIDs
{
  return self->_assetMemoryUUIDs;
}

- (NSArray)assetAlbumUUIDs
{
  return self->_assetAlbumUUIDs;
}

- (NSNumber)collectionScore
{
  return self->_collectionScore;
}

- (NSNumber)l2Score
{
  return self->_l2Score;
}

- (NSNumber)l1Score
{
  return self->_l1Score;
}

- (unint64_t)retrievalType
{
  return self->_retrievalType;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (BOOL)isSensitiveLocation
{
  return self->_isSensitiveLocation;
}

- (BOOL)isExclusivelyExactOCRTextMatch
{
  return self->_isExclusivelyExactOCRTextMatch;
}

- (BOOL)hasOCRTextMatch
{
  return self->_hasOCRTextMatch;
}

- (NSArray)embeddingDistances
{
  return self->_embeddingDistances;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)releaseOwningCollectionUUIDs
{
  assetAlbumUUIDs = self->_assetAlbumUUIDs;
  self->_assetAlbumUUIDs = 0;

  assetMemoryUUIDs = self->_assetMemoryUUIDs;
  self->_assetMemoryUUIDs = 0;

  assetHighlightUUIDs = self->_assetHighlightUUIDs;
  self->_assetHighlightUUIDs = 0;
}

- (id)jsonDictionary
{
  v30[13] = *MEMORY[0x1E4F143B8];
  id v25 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v29[0] = @"type";
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchResult type](self, "type"));
  v30[0] = v28;
  v29[1] = @"type_humanReadable";
  unint64_t v3 = [(PHSearchResult *)self type];
  if (v3 > 4) {
    v4 = @"Unknown";
  }
  else {
    v4 = off_1E58428C0[v3];
  }
  v30[1] = v4;
  v29[2] = @"uuid";
  v27 = [(PHSearchResult *)self uuid];
  v30[2] = v27;
  v29[3] = @"retrievalType";
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchResult retrievalType](self, "retrievalType"));
  v30[3] = v26;
  v29[4] = @"retrievalType_humanReadable";
  unint64_t v5 = [(PHSearchResult *)self retrievalType];
  if (v5 > 3) {
    v6 = @"Unknown";
  }
  else {
    v6 = off_1E58428E8[v5];
  }
  v30[4] = v6;
  v29[5] = @"hasOCRTextMatch";
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchResult hasOCRTextMatch](self, "hasOCRTextMatch"));
  v30[5] = v24;
  v29[6] = @"isSensitiveLocation";
  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchResult isSensitiveLocation](self, "isSensitiveLocation"));
  v30[6] = v23;
  v29[7] = @"l1Score";
  uint64_t v7 = [(PHSearchResult *)self l1Score];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v7;
  v30[7] = v7;
  v29[8] = @"l2Score";
  v9 = [(PHSearchResult *)self l2Score];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[8] = v10;
  v29[9] = @"collectionScore";
  v11 = [(PHSearchResult *)self collectionScore];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[9] = v12;
  v29[10] = @"embeddingDistances";
  v13 = [(PHSearchResult *)self embeddingDistances];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[10] = v14;
  v29[11] = @"matchType";
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchResult matchType](self, "matchType"));
  v30[11] = v15;
  v29[12] = @"matchType_humanReadable";
  unint64_t v16 = [(PHSearchResult *)self matchType];
  if (v16 > 3) {
    v17 = @"Unknown";
  }
  else {
    v17 = off_1E58428A0[v16];
  }
  v30[12] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:13];
  v19 = (void *)[v25 initWithDictionary:v18];

  if (!v13) {
  if (!v11)
  }

  if (!v9) {
  if (!v8)
  }

  v20 = (void *)[v19 copy];

  return v20;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@:%p\n", v5, self];

  unint64_t v6 = self->_type - 1;
  if (v6 > 3) {
    uint64_t v7 = @"PHSearchResultTypeUndefined";
  }
  else {
    uint64_t v7 = off_1E5842868[v6];
  }
  [v3 appendFormat:@"type: '%@'\n", v7];
  [v3 appendFormat:@"uuid: '%@'\n", self->_uuid];
  unint64_t v8 = self->_retrievalType - 1;
  if (v8 > 2) {
    v9 = @"PHSearchResultRetrievalTypeUndefined";
  }
  else {
    v9 = off_1E5842888[v8];
  }
  [v3 appendFormat:@"retrievalType: %@\n", v9];
  unint64_t matchType = self->_matchType;
  if (matchType > 3) {
    v11 = @"Unknown";
  }
  else {
    v11 = off_1E58428A0[matchType];
  }
  [v3 appendFormat:@"matchType: %@\n", v11];
  if (self->_hasOCRTextMatch) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  [v3 appendFormat:@"hasOCRTextMatch: %@\n", v12];
  if (self->_isSensitiveLocation) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v3 appendFormat:@"isSensitiveLocation: %@\n", v13];
  [v3 appendFormat:@"L1 Score: %@\n", self->_l1Score];
  [v3 appendFormat:@"L2 Score: %@\n", self->_l2Score];
  [v3 appendFormat:@"collection score: %@\n", self->_collectionScore];
  [v3 appendFormat:@"embedding distances: %@\n", self->_embeddingDistances];

  return v3;
}

- (BOOL)isEligibleForSuggestions
{
  unint64_t v3 = [(PHSearchResult *)self retrievalType];
  if (v3 != 1) {
    LOBYTE(v3) = [(PHSearchResult *)self retrievalType] == 3;
  }
  return v3;
}

- (PHSearchResult)initWithSearchResultType:(unint64_t)a3 uuid:(id)a4 personUUIDs:(id)a5 sceneIdentifiers:(id)a6 audioIdentifiers:(id)a7 humanActionIdentifiers:(id)a8 retrievalType:(unint64_t)a9 hasOCRTextMatch:(BOOL)a10 isSensitiveLocation:(BOOL)a11 embeddingDistances:(id)a12 l1Score:(id)a13 l2Score:(id)a14 collectionScore:(id)a15 assetAlbumUUIDs:(id)a16 assetMemoryUUIDs:(id)a17 assetHighlightUUIDs:(id)a18
{
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  id v28 = a12;
  v29 = self;
  id v66 = a13;
  id v65 = a14;
  id v64 = a15;
  id v30 = a16;
  id v67 = a17;
  id v31 = a18;
  v68 = v23;
  if (v23)
  {
    if (v24) {
      goto LABEL_3;
    }
  }
  else
  {
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2, v29, @"PHSearchResult.m", 24, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];

    if (v24)
    {
LABEL_3:
      if (v25) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  v58 = [MEMORY[0x1E4F28B00] currentHandler];
  [v58 handleFailureInMethod:a2, v29, @"PHSearchResult.m", 25, @"Invalid parameter not satisfying: %@", @"personUUIDs" object file lineNumber description];

  if (v25)
  {
LABEL_4:
    if (v26) {
      goto LABEL_5;
    }
LABEL_18:
    v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2, v29, @"PHSearchResult.m", 27, @"Invalid parameter not satisfying: %@", @"audioIdentifiers" object file lineNumber description];

    if (v27) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_17:
  v59 = [MEMORY[0x1E4F28B00] currentHandler];
  [v59 handleFailureInMethod:a2, v29, @"PHSearchResult.m", 26, @"Invalid parameter not satisfying: %@", @"sceneIdentifiers" object file lineNumber description];

  if (!v26) {
    goto LABEL_18;
  }
LABEL_5:
  if (v27) {
    goto LABEL_6;
  }
LABEL_19:
  v61 = [MEMORY[0x1E4F28B00] currentHandler];
  [v61 handleFailureInMethod:a2, v29, @"PHSearchResult.m", 28, @"Invalid parameter not satisfying: %@", @"humanActionIdentifiers" object file lineNumber description];

LABEL_6:
  v69.receiver = v29;
  v69.super_class = (Class)PHSearchResult;
  v32 = [(PHSearchResult *)&v69 init];
  v33 = v32;
  if (v32)
  {
    v32->_type = a3;
    uint64_t v34 = [v68 copy];
    uuid = v33->_uuid;
    v33->_uuid = (NSString *)v34;

    uint64_t v36 = [v24 copy];
    personUUIDS = v33->_personUUIDS;
    v33->_personUUIDS = (NSArray *)v36;

    uint64_t v38 = [v25 copy];
    sceneIdentifiers = v33->_sceneIdentifiers;
    v33->_sceneIdentifiers = (NSArray *)v38;

    uint64_t v40 = [v26 copy];
    audioIdentifiers = v33->_audioIdentifiers;
    v33->_audioIdentifiers = (NSArray *)v40;

    uint64_t v42 = [v27 copy];
    humanActionIdentifiers = v33->_humanActionIdentifiers;
    v33->_humanActionIdentifiers = (NSArray *)v42;

    v33->_retrievalType = a9;
    v33->_hasOCRTextMatch = a10;
    uint64_t v44 = [v28 copy];
    embeddingDistances = v33->_embeddingDistances;
    v33->_embeddingDistances = (NSArray *)v44;

    objc_storeStrong((id *)&v33->_l1Score, a13);
    objc_storeStrong((id *)&v33->_l2Score, a14);
    objc_storeStrong((id *)&v33->_collectionScore, a15);
    v33->_isSensitiveLocation = a11;
    uint64_t v46 = [v30 copy];
    assetAlbumUUIDs = v33->_assetAlbumUUIDs;
    v33->_assetAlbumUUIDs = (NSArray *)v46;

    uint64_t v48 = [v67 copy];
    assetMemoryUUIDs = v33->_assetMemoryUUIDs;
    v33->_assetMemoryUUIDs = (NSArray *)v48;

    uint64_t v50 = [v31 copy];
    assetHighlightUUIDs = v33->_assetHighlightUUIDs;
    v33->_assetHighlightUUIDs = (NSArray *)v50;

    [(NSNumber *)v33->_l1Score doubleValue];
    if (v52 >= 100.0)
    {
      v33->_unint64_t matchType = 1;
      [(NSNumber *)v33->_l1Score doubleValue];
      if (v55 == 100.0) {
        v33->_isExclusivelyExactOCRTextMatch = 1;
      }
    }
    else
    {
      [(NSNumber *)v33->_l1Score doubleValue];
      if (v53 >= 10.0) {
        uint64_t v54 = 2;
      }
      else {
        uint64_t v54 = 3;
      }
      v33->_unint64_t matchType = v54;
    }
  }

  return v33;
}

@end