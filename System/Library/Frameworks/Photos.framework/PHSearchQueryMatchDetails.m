@interface PHSearchQueryMatchDetails
- (NSArray)audioIdentifiers;
- (NSArray)humanActionIdentifiers;
- (NSArray)ocrAssetUUIDs;
- (NSArray)ocrQueryTokens;
- (NSArray)personUUIDS;
- (NSArray)sceneIdentifiers;
- (NSAttributedString)queryText;
- (PHSearchQueryMatchDetails)initWithQueryText:(id)a3 queryEmbedding:(id)a4 personUUIDS:(id)a5 sceneIdentifiers:(id)a6 audioIdentifiers:(id)a7 humanActionIdentifiers:(id)a8 ocrAssetUUIDS:(id)a9;
- (_CSEmbedding)queryEmbedding;
- (id)description;
- (id)jsonDictionary;
- (unint64_t)countOfQueryTerms;
@end

@implementation PHSearchQueryMatchDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ocrQueryTokens, 0);
  objc_storeStrong((id *)&self->_ocrAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_audioIdentifiers, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_personUUIDS, 0);
  objc_storeStrong((id *)&self->_queryEmbedding, 0);

  objc_storeStrong((id *)&self->_queryText, 0);
}

- (unint64_t)countOfQueryTerms
{
  return self->_countOfQueryTerms;
}

- (NSArray)ocrQueryTokens
{
  return self->_ocrQueryTokens;
}

- (NSArray)ocrAssetUUIDs
{
  return self->_ocrAssetUUIDs;
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

- (_CSEmbedding)queryEmbedding
{
  return self->_queryEmbedding;
}

- (NSAttributedString)queryText
{
  return self->_queryText;
}

- (id)jsonDictionary
{
  v19[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v18[0] = @"queryText";
  v17 = [(PHSearchQueryMatchDetails *)self queryText];
  v16 = [v17 string];
  v19[0] = v16;
  v18[1] = @"queryEmbedding";
  v4 = [(PHSearchQueryMatchDetails *)self queryEmbedding];
  v5 = PLSearchJSONForCSEmbedding();
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[1] = v6;
  v18[2] = @"sceneIdentifiers";
  v7 = [(PHSearchQueryMatchDetails *)self sceneIdentifiers];
  v19[2] = v7;
  v18[3] = @"personUUIDS";
  v8 = [(PHSearchQueryMatchDetails *)self personUUIDS];
  v19[3] = v8;
  v18[4] = @"ocrAssetUUIDs";
  v9 = [(PHSearchQueryMatchDetails *)self ocrAssetUUIDs];
  v19[4] = v9;
  v18[5] = @"humanActionIdentifiers";
  v10 = [(PHSearchQueryMatchDetails *)self humanActionIdentifiers];
  v19[5] = v10;
  v18[6] = @"audioIdentifiers";
  v11 = [(PHSearchQueryMatchDetails *)self audioIdentifiers];
  v19[6] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:7];
  v13 = (void *)[v3 initWithDictionary:v12];

  if (!v5) {
  v14 = (void *)[v13 copy];
  }

  return v14;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@:%p\n", v5, self];

  v6 = [(NSAttributedString *)self->_queryText string];
  [v3 appendFormat:@"queryText: '%@'\n", v6];

  [v3 appendFormat:@"queryEmbedding: %@\n", self->_queryEmbedding];
  [v3 appendFormat:@"sceneIdentifiers: %@\n", self->_sceneIdentifiers];
  [v3 appendFormat:@"personUUIDS: %@\n", self->_personUUIDS];
  [v3 appendFormat:@"ocrAssetUUIDs: %@\n", self->_ocrAssetUUIDs];
  [v3 appendFormat:@"humanAction: %@\n", self->_humanActionIdentifiers];
  [v3 appendFormat:@"audio: %@\n", self->_audioIdentifiers];

  return v3;
}

- (PHSearchQueryMatchDetails)initWithQueryText:(id)a3 queryEmbedding:(id)a4 personUUIDS:(id)a5 sceneIdentifiers:(id)a6 audioIdentifiers:(id)a7 humanActionIdentifiers:(id)a8 ocrAssetUUIDS:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (v16)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"PHSearchQueryMatchDetails.m", 17, @"Invalid parameter not satisfying: %@", @"queryText" object file lineNumber description];

    if (v18)
    {
LABEL_3:
      if (v19) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"PHSearchQueryMatchDetails.m", 18, @"Invalid parameter not satisfying: %@", @"personUUIDS" object file lineNumber description];

  if (v19)
  {
LABEL_4:
    if (v20) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v43 = [MEMORY[0x1E4F28B00] currentHandler];
  [v43 handleFailureInMethod:a2, self, @"PHSearchQueryMatchDetails.m", 19, @"Invalid parameter not satisfying: %@", @"sceneIdentifiers" object file lineNumber description];

  if (v20)
  {
LABEL_5:
    if (v21) {
      goto LABEL_6;
    }
LABEL_14:
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"PHSearchQueryMatchDetails.m", 21, @"Invalid parameter not satisfying: %@", @"humanActionIdentifiers" object file lineNumber description];

    if (v22) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_13:
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"PHSearchQueryMatchDetails.m", 20, @"Invalid parameter not satisfying: %@", @"audioIdentifiers" object file lineNumber description];

  if (!v21) {
    goto LABEL_14;
  }
LABEL_6:
  if (v22) {
    goto LABEL_7;
  }
LABEL_15:
  v46 = [MEMORY[0x1E4F28B00] currentHandler];
  [v46 handleFailureInMethod:a2, self, @"PHSearchQueryMatchDetails.m", 22, @"Invalid parameter not satisfying: %@", @"ocrAssetUUIDs" object file lineNumber description];

LABEL_7:
  v47.receiver = self;
  v47.super_class = (Class)PHSearchQueryMatchDetails;
  v23 = [(PHSearchQueryMatchDetails *)&v47 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    queryText = v23->_queryText;
    v23->_queryText = (NSAttributedString *)v24;

    objc_storeStrong((id *)&v23->_queryEmbedding, a4);
    uint64_t v26 = [v19 copy];
    sceneIdentifiers = v23->_sceneIdentifiers;
    v23->_sceneIdentifiers = (NSArray *)v26;

    uint64_t v28 = [v20 copy];
    audioIdentifiers = v23->_audioIdentifiers;
    v23->_audioIdentifiers = (NSArray *)v28;

    uint64_t v30 = [v21 copy];
    humanActionIdentifiers = v23->_humanActionIdentifiers;
    v23->_humanActionIdentifiers = (NSArray *)v30;

    uint64_t v32 = [v18 copy];
    personUUIDS = v23->_personUUIDS;
    v23->_personUUIDS = (NSArray *)v32;

    uint64_t v34 = [v22 copy];
    ocrAssetUUIDs = v23->_ocrAssetUUIDs;
    v23->_ocrAssetUUIDs = (NSArray *)v34;

    v36 = [MEMORY[0x1E4F28D60] indexSetWithIndex:6];
    uint64_t v37 = +[PHSearchUtility queryTokensFromQueryText:v16 limitToSuggestionCategories:v36];
    ocrQueryTokens = v23->_ocrQueryTokens;
    v23->_ocrQueryTokens = (NSArray *)v37;

    v39 = +[PHSearchUtility queryTokensFromQueryText:v16 limitToSuggestionCategories:0];
    v23->_countOfQueryTerms = [v39 count];
  }
  return v23;
}

@end