@interface AFVoiceIdScoreCard
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFVoiceIdScoreCard)init;
- (AFVoiceIdScoreCard)initWithBuilder:(id)a3;
- (AFVoiceIdScoreCard)initWithCoder:(id)a3;
- (AFVoiceIdScoreCard)initWithDictionaryRepresentation:(id)a3;
- (AFVoiceIdScoreCard)initWithSpIdAudioProcessedDuration:(id)a3 spIdUnknownUserScore:(id)a4 spIdKnownUserScores:(id)a5 spIdUserScoresVersion:(id)a6 spIdScoreThresholdingType:(id)a7 spIdAssetVersion:(id)a8 userClassified:(id)a9 userIdentityClassification:(int64_t)a10;
- (AFVoiceIdScoreCard)initWithSpIdAudioProcessedDuration:(id)a3 spIdUnknownUserScore:(id)a4 spIdKnownUserScores:(id)a5 spIdUserScoresVersion:(id)a6 spIdScoreThresholdingType:(id)a7 spIdAssetVersion:(id)a8 userClassified:(id)a9 userIdentityClassification:(int64_t)a10 lowScoreThreshold:(id)a11 highScoreThreshold:(id)a12 confidentScoreThreshold:(id)a13 deltaScoreThreshold:(id)a14;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)spIdKnownUserScores;
- (NSNumber)confidentScoreThreshold;
- (NSNumber)deltaScoreThreshold;
- (NSNumber)highScoreThreshold;
- (NSNumber)lowScoreThreshold;
- (NSNumber)spIdAudioProcessedDuration;
- (NSNumber)spIdUnknownUserScore;
- (NSNumber)spIdUserScoresVersion;
- (NSString)description;
- (NSString)spIdAssetVersion;
- (NSString)spIdScoreThresholdingType;
- (NSString)userClassified;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)userIdentityClassification;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFVoiceIdScoreCard

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deltaScoreThreshold, 0);
  objc_storeStrong((id *)&self->_confidentScoreThreshold, 0);
  objc_storeStrong((id *)&self->_highScoreThreshold, 0);
  objc_storeStrong((id *)&self->_lowScoreThreshold, 0);
  objc_storeStrong((id *)&self->_userClassified, 0);
  objc_storeStrong((id *)&self->_spIdAssetVersion, 0);
  objc_storeStrong((id *)&self->_spIdScoreThresholdingType, 0);
  objc_storeStrong((id *)&self->_spIdUserScoresVersion, 0);
  objc_storeStrong((id *)&self->_spIdKnownUserScores, 0);
  objc_storeStrong((id *)&self->_spIdUnknownUserScore, 0);
  objc_storeStrong((id *)&self->_spIdAudioProcessedDuration, 0);
}

- (NSNumber)deltaScoreThreshold
{
  return self->_deltaScoreThreshold;
}

- (NSNumber)confidentScoreThreshold
{
  return self->_confidentScoreThreshold;
}

- (NSNumber)highScoreThreshold
{
  return self->_highScoreThreshold;
}

- (NSNumber)lowScoreThreshold
{
  return self->_lowScoreThreshold;
}

- (int64_t)userIdentityClassification
{
  return self->_userIdentityClassification;
}

- (NSString)userClassified
{
  return self->_userClassified;
}

- (NSString)spIdAssetVersion
{
  return self->_spIdAssetVersion;
}

- (NSString)spIdScoreThresholdingType
{
  return self->_spIdScoreThresholdingType;
}

- (NSNumber)spIdUserScoresVersion
{
  return self->_spIdUserScoresVersion;
}

- (NSDictionary)spIdKnownUserScores
{
  return self->_spIdKnownUserScores;
}

- (NSNumber)spIdUnknownUserScore
{
  return self->_spIdUnknownUserScore;
}

- (NSNumber)spIdAudioProcessedDuration
{
  return self->_spIdAudioProcessedDuration;
}

- (id)buildDictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  spIdAudioProcessedDuration = self->_spIdAudioProcessedDuration;
  if (spIdAudioProcessedDuration) {
    [v3 setObject:spIdAudioProcessedDuration forKey:@"spIdAudioProcessedDuration"];
  }
  spIdUnknownUserScore = self->_spIdUnknownUserScore;
  if (spIdUnknownUserScore) {
    [v4 setObject:spIdUnknownUserScore forKey:@"spIdUnknownUserScore"];
  }
  if (self->_spIdKnownUserScores)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_spIdKnownUserScores, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v8 = self->_spIdKnownUserScores;
    uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v14 = -[NSDictionary objectForKey:](self->_spIdKnownUserScores, "objectForKey:", v13, (void)v29);
          [v7 setObject:v14 forKey:v13];
        }
        uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v10);
    }

    v15 = (void *)[v7 copy];
    [v4 setObject:v15 forKey:@"spIdKnownUserScores"];
  }
  spIdUserScoresVersion = self->_spIdUserScoresVersion;
  if (spIdUserScoresVersion) {
    [v4 setObject:spIdUserScoresVersion forKey:@"spIdUserScoresVersion"];
  }
  spIdScoreThresholdingType = self->_spIdScoreThresholdingType;
  if (spIdScoreThresholdingType) {
    [v4 setObject:spIdScoreThresholdingType forKey:@"spIdScoreThresholdingType"];
  }
  spIdAssetVersion = self->_spIdAssetVersion;
  if (spIdAssetVersion) {
    [v4 setObject:spIdAssetVersion forKey:@"spIdAssetVersion"];
  }
  userClassified = self->_userClassified;
  if (userClassified) {
    [v4 setObject:userClassified forKey:@"userClassified"];
  }
  unint64_t userIdentityClassification = self->_userIdentityClassification;
  if (userIdentityClassification > 4) {
    v21 = @"(unknown)";
  }
  else {
    v21 = off_1E5928F00[userIdentityClassification];
  }
  v22 = v21;
  [v4 setObject:v22 forKey:@"userIdentityClassification"];

  lowScoreThreshold = self->_lowScoreThreshold;
  if (lowScoreThreshold) {
    [v4 setObject:lowScoreThreshold forKey:@"lowScoreThreshold"];
  }
  highScoreThreshold = self->_highScoreThreshold;
  if (highScoreThreshold) {
    [v4 setObject:highScoreThreshold forKey:@"highScoreThreshold"];
  }
  confidentScoreThreshold = self->_confidentScoreThreshold;
  if (confidentScoreThreshold) {
    [v4 setObject:confidentScoreThreshold forKey:@"confidentScoreThreshold"];
  }
  deltaScoreThreshold = self->_deltaScoreThreshold;
  if (deltaScoreThreshold) {
    [v4 setObject:deltaScoreThreshold forKey:@"deltaScoreThreshold"];
  }
  v27 = objc_msgSend(v4, "copy", (void)v29);

  return v27;
}

- (AFVoiceIdScoreCard)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"spIdAudioProcessedDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v43 = v6;
    }
    else {
      id v43 = 0;
    }

    v8 = [v5 objectForKey:@"spIdUnknownUserScore"];
    objc_opt_class();
    v41 = self;
    if (objc_opt_isKindOfClass()) {
      id v40 = v8;
    }
    else {
      id v40 = 0;
    }

    uint64_t v9 = [v5 objectForKey:@"spIdKnownUserScores"];
    objc_opt_class();
    v42 = v5;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v37 = v9;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v45 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v17 = [v11 objectForKey:v16];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v18 = v17;

                if (v18) {
                  [v10 setObject:v18 forKey:v16];
                }
              }
              else
              {

                id v18 = 0;
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v13);
      }

      v39 = (void *)[v10 copy];
      v5 = v42;
      uint64_t v9 = v37;
    }
    else
    {
      v39 = 0;
    }

    v19 = [v5 objectForKey:@"spIdUserScoresVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v38 = v19;
    }
    else {
      id v38 = 0;
    }

    v20 = [v5 objectForKey:@"spIdScoreThresholdingType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v36 = v20;
    }
    else {
      id v36 = 0;
    }

    v21 = [v5 objectForKey:@"spIdAssetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v35 = v21;
    }
    else {
      id v35 = 0;
    }

    v22 = [v5 objectForKey:@"userClassified"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }

    v24 = [v5 objectForKey:@"userIdentityClassification"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v25 = AFUserIdentityClassficationGetFromName(v24);
    }
    else {
      uint64_t v25 = 0;
    }

    v26 = [v5 objectForKey:@"lowScoreThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }

    v28 = [v5 objectForKey:@"highScoreThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v28;
    }
    else {
      id v29 = 0;
    }

    long long v30 = [v5 objectForKey:@"confidentScoreThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v31 = v30;
    }
    else {
      id v31 = 0;
    }

    long long v32 = [v5 objectForKey:@"deltaScoreThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v33 = v32;
    }
    else {
      id v33 = 0;
    }

    self = [(AFVoiceIdScoreCard *)v41 initWithSpIdAudioProcessedDuration:v43 spIdUnknownUserScore:v40 spIdKnownUserScores:v39 spIdUserScoresVersion:v38 spIdScoreThresholdingType:v36 spIdAssetVersion:v35 userClassified:v23 userIdentityClassification:v25 lowScoreThreshold:v27 highScoreThreshold:v29 confidentScoreThreshold:v31 deltaScoreThreshold:v33];
    v7 = self;
    v5 = v42;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  spIdAudioProcessedDuration = self->_spIdAudioProcessedDuration;
  id v6 = a3;
  [v6 encodeObject:spIdAudioProcessedDuration forKey:@"AFVoiceIdScoreCard::spIdAudioProcessedDuration"];
  [v6 encodeObject:self->_spIdUnknownUserScore forKey:@"AFVoiceIdScoreCard::spIdUnknownUserScore"];
  [v6 encodeObject:self->_spIdKnownUserScores forKey:@"AFVoiceIdScoreCard::spIdKnownUserScores"];
  [v6 encodeObject:self->_spIdUserScoresVersion forKey:@"AFVoiceIdScoreCard::spIdUserScoresVersion"];
  [v6 encodeObject:self->_spIdScoreThresholdingType forKey:@"AFVoiceIdScoreCard::spIdScoreThresholdingType"];
  [v6 encodeObject:self->_spIdAssetVersion forKey:@"AFVoiceIdScoreCard::spIdAssetVersion"];
  [v6 encodeObject:self->_userClassified forKey:@"AFVoiceIdScoreCard::userClassified"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_userIdentityClassification];
  [v6 encodeObject:v5 forKey:@"AFVoiceIdScoreCard::userIdentityClassification"];

  [v6 encodeObject:self->_lowScoreThreshold forKey:@"AFVoiceIdScoreCard::lowScoreThreshold"];
  [v6 encodeObject:self->_highScoreThreshold forKey:@"AFVoiceIdScoreCard::highScoreThreshold"];
  [v6 encodeObject:self->_confidentScoreThreshold forKey:@"AFVoiceIdScoreCard::confidentScoreThreshold"];
  [v6 encodeObject:self->_deltaScoreThreshold forKey:@"AFVoiceIdScoreCard::deltaScoreThreshold"];
}

- (AFVoiceIdScoreCard)initWithCoder:(id)a3
{
  id v3 = a3;
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceIdScoreCard::spIdAudioProcessedDuration"];
  id v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceIdScoreCard::spIdUnknownUserScore"];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v8 = [v3 decodeObjectOfClasses:v7 forKey:@"AFVoiceIdScoreCard::spIdKnownUserScores"];

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceIdScoreCard::spIdUserScoresVersion"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceIdScoreCard::spIdScoreThresholdingType"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceIdScoreCard::spIdAssetVersion"];
  uint64_t v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceIdScoreCard::userClassified"];
  id v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceIdScoreCard::userIdentityClassification"];
  uint64_t v12 = [v11 integerValue];

  id v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceIdScoreCard::lowScoreThreshold"];
  uint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceIdScoreCard::highScoreThreshold"];
  uint64_t v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceIdScoreCard::confidentScoreThreshold"];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceIdScoreCard::deltaScoreThreshold"];

  id v23 = [(AFVoiceIdScoreCard *)self initWithSpIdAudioProcessedDuration:v21 spIdUnknownUserScore:v18 spIdKnownUserScores:v8 spIdUserScoresVersion:v9 spIdScoreThresholdingType:v20 spIdAssetVersion:v19 userClassified:v10 userIdentityClassification:v12 lowScoreThreshold:v17 highScoreThreshold:v13 confidentScoreThreshold:v14 deltaScoreThreshold:v15];
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFVoiceIdScoreCard *)a3;
  if (self == v4)
  {
    BOOL v31 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t userIdentityClassification = self->_userIdentityClassification;
      if (userIdentityClassification == [(AFVoiceIdScoreCard *)v5 userIdentityClassification])
      {
        v7 = [(AFVoiceIdScoreCard *)v5 spIdAudioProcessedDuration];
        spIdAudioProcessedDuration = self->_spIdAudioProcessedDuration;
        if (spIdAudioProcessedDuration == v7
          || [(NSNumber *)spIdAudioProcessedDuration isEqual:v7])
        {
          uint64_t v9 = [(AFVoiceIdScoreCard *)v5 spIdUnknownUserScore];
          spIdUnknownUserScore = self->_spIdUnknownUserScore;
          if (spIdUnknownUserScore == v9 || [(NSNumber *)spIdUnknownUserScore isEqual:v9])
          {
            id v11 = [(AFVoiceIdScoreCard *)v5 spIdKnownUserScores];
            spIdKnownUserScores = self->_spIdKnownUserScores;
            if (spIdKnownUserScores == v11
              || [(NSDictionary *)spIdKnownUserScores isEqual:v11])
            {
              uint64_t v13 = [(AFVoiceIdScoreCard *)v5 spIdUserScoresVersion];
              spIdUserScoresVersion = self->_spIdUserScoresVersion;
              if (spIdUserScoresVersion == v13
                || [(NSNumber *)spIdUserScoresVersion isEqual:v13])
              {
                v15 = [(AFVoiceIdScoreCard *)v5 spIdScoreThresholdingType];
                spIdScoreThresholdingType = self->_spIdScoreThresholdingType;
                if (spIdScoreThresholdingType == v15
                  || [(NSString *)spIdScoreThresholdingType isEqual:v15])
                {
                  id v17 = [(AFVoiceIdScoreCard *)v5 spIdAssetVersion];
                  spIdAssetVersion = self->_spIdAssetVersion;
                  if (spIdAssetVersion == v17 || [(NSString *)spIdAssetVersion isEqual:v17])
                  {
                    v19 = [(AFVoiceIdScoreCard *)v5 userClassified];
                    userClassified = self->_userClassified;
                    if (userClassified == v19 || [(NSString *)userClassified isEqual:v19])
                    {
                      id v35 = v19;
                      v21 = [(AFVoiceIdScoreCard *)v5 lowScoreThreshold];
                      lowScoreThreshold = self->_lowScoreThreshold;
                      if (lowScoreThreshold == v21
                        || [(NSNumber *)lowScoreThreshold isEqual:v21])
                      {
                        uint64_t v34 = v21;
                        id v23 = [(AFVoiceIdScoreCard *)v5 highScoreThreshold];
                        highScoreThreshold = self->_highScoreThreshold;
                        if (highScoreThreshold == v23
                          || [(NSNumber *)highScoreThreshold isEqual:v23])
                        {
                          id v33 = v23;
                          uint64_t v25 = [(AFVoiceIdScoreCard *)v5 confidentScoreThreshold];
                          confidentScoreThreshold = self->_confidentScoreThreshold;
                          if (confidentScoreThreshold == v25
                            || [(NSNumber *)confidentScoreThreshold isEqual:v25])
                          {
                            id v27 = [(AFVoiceIdScoreCard *)v5 deltaScoreThreshold];
                            deltaScoreThreshold = self->_deltaScoreThreshold;
                            BOOL v31 = 1;
                            if (deltaScoreThreshold != v27)
                            {
                              id v29 = v27;
                              int v30 = [(NSNumber *)deltaScoreThreshold isEqual:v27];
                              id v27 = v29;
                              if (!v30) {
                                BOOL v31 = 0;
                              }
                            }
                          }
                          else
                          {
                            BOOL v31 = 0;
                          }

                          id v23 = v33;
                        }
                        else
                        {
                          BOOL v31 = 0;
                        }

                        v21 = v34;
                      }
                      else
                      {
                        BOOL v31 = 0;
                      }

                      v19 = v35;
                    }
                    else
                    {
                      BOOL v31 = 0;
                    }
                  }
                  else
                  {
                    BOOL v31 = 0;
                  }
                }
                else
                {
                  BOOL v31 = 0;
                }
              }
              else
              {
                BOOL v31 = 0;
              }
            }
            else
            {
              BOOL v31 = 0;
            }
          }
          else
          {
            BOOL v31 = 0;
          }
        }
        else
        {
          BOOL v31 = 0;
        }
      }
      else
      {
        BOOL v31 = 0;
      }
    }
    else
    {
      BOOL v31 = 0;
    }
  }

  return v31;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_spIdAudioProcessedDuration hash];
  uint64_t v4 = [(NSNumber *)self->_spIdUnknownUserScore hash] ^ v3;
  uint64_t v5 = [(NSDictionary *)self->_spIdKnownUserScores hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_spIdUserScoresVersion hash];
  NSUInteger v7 = [(NSString *)self->_spIdScoreThresholdingType hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_spIdAssetVersion hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_userClassified hash];
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_userIdentityClassification];
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v9 ^ v11 ^ [(NSNumber *)self->_lowScoreThreshold hash];
  uint64_t v13 = [(NSNumber *)self->_highScoreThreshold hash];
  uint64_t v14 = v13 ^ [(NSNumber *)self->_confidentScoreThreshold hash];
  unint64_t v15 = v12 ^ v14 ^ [(NSNumber *)self->_deltaScoreThreshold hash];

  return v15;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v17 = [NSString alloc];
  v18.receiver = self;
  v18.super_class = (Class)AFVoiceIdScoreCard;
  uint64_t v4 = [(AFVoiceIdScoreCard *)&v18 description];
  spIdAudioProcessedDuration = self->_spIdAudioProcessedDuration;
  spIdUnknownUserScore = self->_spIdUnknownUserScore;
  spIdKnownUserScores = self->_spIdKnownUserScores;
  spIdUserScoresVersion = self->_spIdUserScoresVersion;
  spIdScoreThresholdingType = self->_spIdScoreThresholdingType;
  spIdAssetVersion = self->_spIdAssetVersion;
  userClassified = self->_userClassified;
  unint64_t userIdentityClassification = self->_userIdentityClassification;
  if (userIdentityClassification > 4) {
    uint64_t v13 = @"(unknown)";
  }
  else {
    uint64_t v13 = off_1E5928F00[userIdentityClassification];
  }
  uint64_t v14 = v13;
  v15 = (void *)[v17 initWithFormat:@"%@ {spIdAudioProcessedDuration = %@, spIdUnknownUserScore = %@, spIdKnownUserScores = %@, spIdUserScoresVersion = %@, spIdScoreThresholdingType = %@, spIdAssetVersion = %@, userClassified = %@, unint64_t userIdentityClassification = %@, lowScoreThreshold = %@, highScoreThreshold = %@, confidentScoreThreshold = %@, deltaScoreThreshold = %@}", v4, spIdAudioProcessedDuration, spIdUnknownUserScore, spIdKnownUserScores, spIdUserScoresVersion, spIdScoreThresholdingType, spIdAssetVersion, userClassified, v14, self->_lowScoreThreshold, self->_highScoreThreshold, self->_confidentScoreThreshold, self->_deltaScoreThreshold];

  return v15;
}

- (NSString)description
{
  return (NSString *)[(AFVoiceIdScoreCard *)self _descriptionWithIndent:0];
}

- (AFVoiceIdScoreCard)initWithSpIdAudioProcessedDuration:(id)a3 spIdUnknownUserScore:(id)a4 spIdKnownUserScores:(id)a5 spIdUserScoresVersion:(id)a6 spIdScoreThresholdingType:(id)a7 spIdAssetVersion:(id)a8 userClassified:(id)a9 userIdentityClassification:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __205__AFVoiceIdScoreCard_initWithSpIdAudioProcessedDuration_spIdUnknownUserScore_spIdKnownUserScores_spIdUserScoresVersion_spIdScoreThresholdingType_spIdAssetVersion_userClassified_userIdentityClassification___block_invoke;
  v32[3] = &unk_1E5929128;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  id v36 = v19;
  id v37 = v20;
  id v38 = v21;
  id v39 = v22;
  int64_t v40 = a10;
  id v23 = v22;
  id v24 = v21;
  id v25 = v20;
  id v26 = v19;
  id v27 = v18;
  id v28 = v17;
  id v29 = v16;
  int v30 = [(AFVoiceIdScoreCard *)self initWithBuilder:v32];

  return v30;
}

void __205__AFVoiceIdScoreCard_initWithSpIdAudioProcessedDuration_spIdUnknownUserScore_spIdKnownUserScores_spIdUserScoresVersion_spIdScoreThresholdingType_spIdAssetVersion_userClassified_userIdentityClassification___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setSpIdAudioProcessedDuration:v3];
  [v4 setSpIdUnknownUserScore:a1[5]];
  [v4 setSpIdKnownUserScores:a1[6]];
  [v4 setSpIdUserScoresVersion:a1[7]];
  [v4 setSpIdScoreThresholdingType:a1[8]];
  [v4 setSpIdAssetVersion:a1[9]];
  [v4 setUserClassified:a1[10]];
  [v4 setUserIdentityClassification:a1[11]];
}

- (AFVoiceIdScoreCard)initWithSpIdAudioProcessedDuration:(id)a3 spIdUnknownUserScore:(id)a4 spIdKnownUserScores:(id)a5 spIdUserScoresVersion:(id)a6 spIdScoreThresholdingType:(id)a7 spIdAssetVersion:(id)a8 userClassified:(id)a9 userIdentityClassification:(int64_t)a10 lowScoreThreshold:(id)a11 highScoreThreshold:(id)a12 confidentScoreThreshold:(id)a13 deltaScoreThreshold:(id)a14
{
  id v40 = a3;
  id v19 = a4;
  id v39 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a11;
  id v25 = a12;
  id v26 = a13;
  id v27 = a14;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __286__AFVoiceIdScoreCard_initWithSpIdAudioProcessedDuration_spIdUnknownUserScore_spIdKnownUserScores_spIdUserScoresVersion_spIdScoreThresholdingType_spIdAssetVersion_userClassified_userIdentityClassification_lowScoreThreshold_highScoreThreshold_confidentScoreThreshold_deltaScoreThreshold___block_invoke;
  v44[3] = &unk_1E5929100;
  id v45 = v40;
  id v46 = v19;
  id v47 = v39;
  id v48 = v20;
  id v49 = v21;
  id v50 = v22;
  id v51 = v23;
  id v52 = v24;
  id v53 = v25;
  id v54 = v26;
  id v55 = v27;
  int64_t v56 = a10;
  id v42 = v27;
  id v41 = v26;
  id v28 = v25;
  id v29 = v24;
  id v30 = v23;
  id v31 = v22;
  id v32 = v21;
  id v33 = v20;
  id v34 = v39;
  id v35 = v19;
  id v36 = v40;
  id v37 = [(AFVoiceIdScoreCard *)self initWithBuilder:v44];

  return v37;
}

void __286__AFVoiceIdScoreCard_initWithSpIdAudioProcessedDuration_spIdUnknownUserScore_spIdKnownUserScores_spIdUserScoresVersion_spIdScoreThresholdingType_spIdAssetVersion_userClassified_userIdentityClassification_lowScoreThreshold_highScoreThreshold_confidentScoreThreshold_deltaScoreThreshold___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setSpIdAudioProcessedDuration:v3];
  [v4 setSpIdUnknownUserScore:a1[5]];
  [v4 setSpIdKnownUserScores:a1[6]];
  [v4 setSpIdUserScoresVersion:a1[7]];
  [v4 setSpIdScoreThresholdingType:a1[8]];
  [v4 setSpIdAssetVersion:a1[9]];
  [v4 setUserClassified:a1[10]];
  [v4 setUserIdentityClassification:a1[15]];
  [v4 setLowScoreThreshold:a1[11]];
  [v4 setHighScoreThreshold:a1[12]];
  [v4 setConfidentScoreThreshold:a1[13]];
  [v4 setDeltaScoreThreshold:a1[14]];
}

- (AFVoiceIdScoreCard)init
{
  return [(AFVoiceIdScoreCard *)self initWithBuilder:0];
}

- (AFVoiceIdScoreCard)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFVoiceIdScoreCardMutation *))a3;
  v42.receiver = self;
  v42.super_class = (Class)AFVoiceIdScoreCard;
  uint64_t v5 = [(AFVoiceIdScoreCard *)&v42 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFVoiceIdScoreCardMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFVoiceIdScoreCardMutation *)v7 isDirty])
    {
      NSUInteger v8 = [(_AFVoiceIdScoreCardMutation *)v7 getSpIdAudioProcessedDuration];
      uint64_t v9 = [v8 copy];
      spIdAudioProcessedDuration = v6->_spIdAudioProcessedDuration;
      v6->_spIdAudioProcessedDuration = (NSNumber *)v9;

      uint64_t v11 = [(_AFVoiceIdScoreCardMutation *)v7 getSpIdUnknownUserScore];
      uint64_t v12 = [v11 copy];
      spIdUnknownUserScore = v6->_spIdUnknownUserScore;
      v6->_spIdUnknownUserScore = (NSNumber *)v12;

      uint64_t v14 = [(_AFVoiceIdScoreCardMutation *)v7 getSpIdKnownUserScores];
      uint64_t v15 = [v14 copy];
      spIdKnownUserScores = v6->_spIdKnownUserScores;
      v6->_spIdKnownUserScores = (NSDictionary *)v15;

      id v17 = [(_AFVoiceIdScoreCardMutation *)v7 getSpIdUserScoresVersion];
      uint64_t v18 = [v17 copy];
      spIdUserScoresVersion = v6->_spIdUserScoresVersion;
      v6->_spIdUserScoresVersion = (NSNumber *)v18;

      id v20 = [(_AFVoiceIdScoreCardMutation *)v7 getSpIdScoreThresholdingType];
      uint64_t v21 = [v20 copy];
      spIdScoreThresholdingType = v6->_spIdScoreThresholdingType;
      v6->_spIdScoreThresholdingType = (NSString *)v21;

      id v23 = [(_AFVoiceIdScoreCardMutation *)v7 getSpIdAssetVersion];
      uint64_t v24 = [v23 copy];
      spIdAssetVersion = v6->_spIdAssetVersion;
      v6->_spIdAssetVersion = (NSString *)v24;

      id v26 = [(_AFVoiceIdScoreCardMutation *)v7 getUserClassified];
      uint64_t v27 = [v26 copy];
      userClassified = v6->_userClassified;
      v6->_userClassified = (NSString *)v27;

      v6->_unint64_t userIdentityClassification = [(_AFVoiceIdScoreCardMutation *)v7 getUserIdentityClassification];
      id v29 = [(_AFVoiceIdScoreCardMutation *)v7 getLowScoreThreshold];
      uint64_t v30 = [v29 copy];
      lowScoreThreshold = v6->_lowScoreThreshold;
      v6->_lowScoreThreshold = (NSNumber *)v30;

      id v32 = [(_AFVoiceIdScoreCardMutation *)v7 getHighScoreThreshold];
      uint64_t v33 = [v32 copy];
      highScoreThreshold = v6->_highScoreThreshold;
      v6->_highScoreThreshold = (NSNumber *)v33;

      id v35 = [(_AFVoiceIdScoreCardMutation *)v7 getConfidentScoreThreshold];
      uint64_t v36 = [v35 copy];
      confidentScoreThreshold = v6->_confidentScoreThreshold;
      v6->_confidentScoreThreshold = (NSNumber *)v36;

      id v38 = [(_AFVoiceIdScoreCardMutation *)v7 getDeltaScoreThreshold];
      uint64_t v39 = [v38 copy];
      deltaScoreThreshold = v6->_deltaScoreThreshold;
      v6->_deltaScoreThreshold = (NSNumber *)v39;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFVoiceIdScoreCardMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFVoiceIdScoreCardMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFVoiceIdScoreCardMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFVoiceIdScoreCard);
      NSUInteger v7 = [(_AFVoiceIdScoreCardMutation *)v5 getSpIdAudioProcessedDuration];
      uint64_t v8 = [v7 copy];
      spIdAudioProcessedDuration = v6->_spIdAudioProcessedDuration;
      v6->_spIdAudioProcessedDuration = (NSNumber *)v8;

      uint64_t v10 = [(_AFVoiceIdScoreCardMutation *)v5 getSpIdUnknownUserScore];
      uint64_t v11 = [v10 copy];
      spIdUnknownUserScore = v6->_spIdUnknownUserScore;
      v6->_spIdUnknownUserScore = (NSNumber *)v11;

      uint64_t v13 = [(_AFVoiceIdScoreCardMutation *)v5 getSpIdKnownUserScores];
      uint64_t v14 = [v13 copy];
      spIdKnownUserScores = v6->_spIdKnownUserScores;
      v6->_spIdKnownUserScores = (NSDictionary *)v14;

      id v16 = [(_AFVoiceIdScoreCardMutation *)v5 getSpIdUserScoresVersion];
      uint64_t v17 = [v16 copy];
      spIdUserScoresVersion = v6->_spIdUserScoresVersion;
      v6->_spIdUserScoresVersion = (NSNumber *)v17;

      id v19 = [(_AFVoiceIdScoreCardMutation *)v5 getSpIdScoreThresholdingType];
      uint64_t v20 = [v19 copy];
      spIdScoreThresholdingType = v6->_spIdScoreThresholdingType;
      v6->_spIdScoreThresholdingType = (NSString *)v20;

      id v22 = [(_AFVoiceIdScoreCardMutation *)v5 getSpIdAssetVersion];
      uint64_t v23 = [v22 copy];
      spIdAssetVersion = v6->_spIdAssetVersion;
      v6->_spIdAssetVersion = (NSString *)v23;

      id v25 = [(_AFVoiceIdScoreCardMutation *)v5 getUserClassified];
      uint64_t v26 = [v25 copy];
      userClassified = v6->_userClassified;
      v6->_userClassified = (NSString *)v26;

      v6->_unint64_t userIdentityClassification = [(_AFVoiceIdScoreCardMutation *)v5 getUserIdentityClassification];
      id v28 = [(_AFVoiceIdScoreCardMutation *)v5 getLowScoreThreshold];
      uint64_t v29 = [v28 copy];
      lowScoreThreshold = v6->_lowScoreThreshold;
      v6->_lowScoreThreshold = (NSNumber *)v29;

      id v31 = [(_AFVoiceIdScoreCardMutation *)v5 getHighScoreThreshold];
      uint64_t v32 = [v31 copy];
      highScoreThreshold = v6->_highScoreThreshold;
      v6->_highScoreThreshold = (NSNumber *)v32;

      id v34 = [(_AFVoiceIdScoreCardMutation *)v5 getConfidentScoreThreshold];
      uint64_t v35 = [v34 copy];
      confidentScoreThreshold = v6->_confidentScoreThreshold;
      v6->_confidentScoreThreshold = (NSNumber *)v35;

      id v37 = [(_AFVoiceIdScoreCardMutation *)v5 getDeltaScoreThreshold];
      uint64_t v38 = [v37 copy];
      deltaScoreThreshold = v6->_deltaScoreThreshold;
      v6->_deltaScoreThreshold = (NSNumber *)v38;
    }
    else
    {
      uint64_t v6 = (AFVoiceIdScoreCard *)[(AFVoiceIdScoreCard *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFVoiceIdScoreCard *)[(AFVoiceIdScoreCard *)self copy];
  }

  return v6;
}

@end