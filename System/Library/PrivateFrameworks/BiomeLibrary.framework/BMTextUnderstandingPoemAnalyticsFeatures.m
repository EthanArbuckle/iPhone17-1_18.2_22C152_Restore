@interface BMTextUnderstandingPoemAnalyticsFeatures
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMTextUnderstandingPoemAnalyticsFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMTextUnderstandingPoemAnalyticsFeatures)initWithNumOfFacesInMessages:(id)a3 numOfFacesOnDevice:(id)a4 numOfNamedFacesOnDevice:(id)a5 numOfConversationThreads:(id)a6 numOfNamedEntityMentions:(id)a7 numOfSenderMentions:(id)a8 numOfReceiverMentions:(id)a9 numOfPronounMentions:(id)a10 numOfImagesShared:(id)a11 numOfLinguisticMentions:(id)a12;
- (BOOL)hasNumOfConversationThreads;
- (BOOL)hasNumOfFacesInMessages;
- (BOOL)hasNumOfFacesOnDevice;
- (BOOL)hasNumOfImagesShared;
- (BOOL)hasNumOfLinguisticMentions;
- (BOOL)hasNumOfNamedEntityMentions;
- (BOOL)hasNumOfNamedFacesOnDevice;
- (BOOL)hasNumOfPronounMentions;
- (BOOL)hasNumOfReceiverMentions;
- (BOOL)hasNumOfSenderMentions;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int64_t)numOfConversationThreads;
- (int64_t)numOfFacesInMessages;
- (int64_t)numOfFacesOnDevice;
- (int64_t)numOfImagesShared;
- (int64_t)numOfLinguisticMentions;
- (int64_t)numOfNamedEntityMentions;
- (int64_t)numOfNamedFacesOnDevice;
- (int64_t)numOfPronounMentions;
- (int64_t)numOfReceiverMentions;
- (int64_t)numOfSenderMentions;
- (unsigned)dataVersion;
- (void)setHasNumOfConversationThreads:(BOOL)a3;
- (void)setHasNumOfFacesInMessages:(BOOL)a3;
- (void)setHasNumOfFacesOnDevice:(BOOL)a3;
- (void)setHasNumOfImagesShared:(BOOL)a3;
- (void)setHasNumOfLinguisticMentions:(BOOL)a3;
- (void)setHasNumOfNamedEntityMentions:(BOOL)a3;
- (void)setHasNumOfNamedFacesOnDevice:(BOOL)a3;
- (void)setHasNumOfPronounMentions:(BOOL)a3;
- (void)setHasNumOfReceiverMentions:(BOOL)a3;
- (void)setHasNumOfSenderMentions:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMTextUnderstandingPoemAnalyticsFeatures

- (void)setHasNumOfLinguisticMentions:(BOOL)a3
{
  self->_hasNumOfLinguisticMentions = a3;
}

- (BOOL)hasNumOfLinguisticMentions
{
  return self->_hasNumOfLinguisticMentions;
}

- (int64_t)numOfLinguisticMentions
{
  return self->_numOfLinguisticMentions;
}

- (void)setHasNumOfImagesShared:(BOOL)a3
{
  self->_hasNumOfImagesShared = a3;
}

- (BOOL)hasNumOfImagesShared
{
  return self->_hasNumOfImagesShared;
}

- (int64_t)numOfImagesShared
{
  return self->_numOfImagesShared;
}

- (void)setHasNumOfPronounMentions:(BOOL)a3
{
  self->_hasNumOfPronounMentions = a3;
}

- (BOOL)hasNumOfPronounMentions
{
  return self->_hasNumOfPronounMentions;
}

- (int64_t)numOfPronounMentions
{
  return self->_numOfPronounMentions;
}

- (void)setHasNumOfReceiverMentions:(BOOL)a3
{
  self->_hasNumOfReceiverMentions = a3;
}

- (BOOL)hasNumOfReceiverMentions
{
  return self->_hasNumOfReceiverMentions;
}

- (int64_t)numOfReceiverMentions
{
  return self->_numOfReceiverMentions;
}

- (void)setHasNumOfSenderMentions:(BOOL)a3
{
  self->_hasNumOfSenderMentions = a3;
}

- (BOOL)hasNumOfSenderMentions
{
  return self->_hasNumOfSenderMentions;
}

- (int64_t)numOfSenderMentions
{
  return self->_numOfSenderMentions;
}

- (void)setHasNumOfNamedEntityMentions:(BOOL)a3
{
  self->_hasNumOfNamedEntityMentions = a3;
}

- (BOOL)hasNumOfNamedEntityMentions
{
  return self->_hasNumOfNamedEntityMentions;
}

- (int64_t)numOfNamedEntityMentions
{
  return self->_numOfNamedEntityMentions;
}

- (void)setHasNumOfConversationThreads:(BOOL)a3
{
  self->_hasNumOfConversationThreads = a3;
}

- (BOOL)hasNumOfConversationThreads
{
  return self->_hasNumOfConversationThreads;
}

- (int64_t)numOfConversationThreads
{
  return self->_numOfConversationThreads;
}

- (void)setHasNumOfNamedFacesOnDevice:(BOOL)a3
{
  self->_hasNumOfNamedFacesOnDevice = a3;
}

- (BOOL)hasNumOfNamedFacesOnDevice
{
  return self->_hasNumOfNamedFacesOnDevice;
}

- (int64_t)numOfNamedFacesOnDevice
{
  return self->_numOfNamedFacesOnDevice;
}

- (void)setHasNumOfFacesOnDevice:(BOOL)a3
{
  self->_hasNumOfFacesOnDevice = a3;
}

- (BOOL)hasNumOfFacesOnDevice
{
  return self->_hasNumOfFacesOnDevice;
}

- (int64_t)numOfFacesOnDevice
{
  return self->_numOfFacesOnDevice;
}

- (void)setHasNumOfFacesInMessages:(BOOL)a3
{
  self->_hasNumOfFacesInMessages = a3;
}

- (BOOL)hasNumOfFacesInMessages
{
  return self->_hasNumOfFacesInMessages;
}

- (int64_t)numOfFacesInMessages
{
  return self->_numOfFacesInMessages;
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
    if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfFacesInMessages]
      || [v5 hasNumOfFacesInMessages])
    {
      if (![(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfFacesInMessages]) {
        goto LABEL_53;
      }
      if (![v5 hasNumOfFacesInMessages]) {
        goto LABEL_53;
      }
      int64_t v6 = [(BMTextUnderstandingPoemAnalyticsFeatures *)self numOfFacesInMessages];
      if (v6 != [v5 numOfFacesInMessages]) {
        goto LABEL_53;
      }
    }
    if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfFacesOnDevice]
      || [v5 hasNumOfFacesOnDevice])
    {
      if (![(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfFacesOnDevice]) {
        goto LABEL_53;
      }
      if (![v5 hasNumOfFacesOnDevice]) {
        goto LABEL_53;
      }
      int64_t v7 = [(BMTextUnderstandingPoemAnalyticsFeatures *)self numOfFacesOnDevice];
      if (v7 != [v5 numOfFacesOnDevice]) {
        goto LABEL_53;
      }
    }
    if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfNamedFacesOnDevice]
      || [v5 hasNumOfNamedFacesOnDevice])
    {
      if (![(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfNamedFacesOnDevice]) {
        goto LABEL_53;
      }
      if (![v5 hasNumOfNamedFacesOnDevice]) {
        goto LABEL_53;
      }
      int64_t v8 = [(BMTextUnderstandingPoemAnalyticsFeatures *)self numOfNamedFacesOnDevice];
      if (v8 != [v5 numOfNamedFacesOnDevice]) {
        goto LABEL_53;
      }
    }
    if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfConversationThreads]
      || [v5 hasNumOfConversationThreads])
    {
      if (![(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfConversationThreads]) {
        goto LABEL_53;
      }
      if (![v5 hasNumOfConversationThreads]) {
        goto LABEL_53;
      }
      int64_t v9 = [(BMTextUnderstandingPoemAnalyticsFeatures *)self numOfConversationThreads];
      if (v9 != [v5 numOfConversationThreads]) {
        goto LABEL_53;
      }
    }
    if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfNamedEntityMentions]
      || [v5 hasNumOfNamedEntityMentions])
    {
      if (![(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfNamedEntityMentions]) {
        goto LABEL_53;
      }
      if (![v5 hasNumOfNamedEntityMentions]) {
        goto LABEL_53;
      }
      int64_t v10 = [(BMTextUnderstandingPoemAnalyticsFeatures *)self numOfNamedEntityMentions];
      if (v10 != [v5 numOfNamedEntityMentions]) {
        goto LABEL_53;
      }
    }
    if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfSenderMentions]
      || [v5 hasNumOfSenderMentions])
    {
      if (![(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfSenderMentions]) {
        goto LABEL_53;
      }
      if (![v5 hasNumOfSenderMentions]) {
        goto LABEL_53;
      }
      int64_t v11 = [(BMTextUnderstandingPoemAnalyticsFeatures *)self numOfSenderMentions];
      if (v11 != [v5 numOfSenderMentions]) {
        goto LABEL_53;
      }
    }
    if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfReceiverMentions]
      || [v5 hasNumOfReceiverMentions])
    {
      if (![(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfReceiverMentions]) {
        goto LABEL_53;
      }
      if (![v5 hasNumOfReceiverMentions]) {
        goto LABEL_53;
      }
      int64_t v12 = [(BMTextUnderstandingPoemAnalyticsFeatures *)self numOfReceiverMentions];
      if (v12 != [v5 numOfReceiverMentions]) {
        goto LABEL_53;
      }
    }
    if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfPronounMentions]
      || [v5 hasNumOfPronounMentions])
    {
      if (![(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfPronounMentions]) {
        goto LABEL_53;
      }
      if (![v5 hasNumOfPronounMentions]) {
        goto LABEL_53;
      }
      int64_t v13 = [(BMTextUnderstandingPoemAnalyticsFeatures *)self numOfPronounMentions];
      if (v13 != [v5 numOfPronounMentions]) {
        goto LABEL_53;
      }
    }
    if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfImagesShared]
      || [v5 hasNumOfImagesShared])
    {
      if (![(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfImagesShared]) {
        goto LABEL_53;
      }
      if (![v5 hasNumOfImagesShared]) {
        goto LABEL_53;
      }
      int64_t v14 = [(BMTextUnderstandingPoemAnalyticsFeatures *)self numOfImagesShared];
      if (v14 != [v5 numOfImagesShared]) {
        goto LABEL_53;
      }
    }
    if (![(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfLinguisticMentions]
      && ![v5 hasNumOfLinguisticMentions])
    {
      BOOL v16 = 1;
      goto LABEL_54;
    }
    if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfLinguisticMentions]
      && [v5 hasNumOfLinguisticMentions])
    {
      int64_t v15 = [(BMTextUnderstandingPoemAnalyticsFeatures *)self numOfLinguisticMentions];
      BOOL v16 = v15 == [v5 numOfLinguisticMentions];
    }
    else
    {
LABEL_53:
      BOOL v16 = 0;
    }
LABEL_54:

    goto LABEL_55;
  }
  BOOL v16 = 0;
LABEL_55:

  return v16;
}

- (id)jsonDictionary
{
  v36[10] = *MEMORY[0x1E4F143B8];
  if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfFacesInMessages])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfFacesInMessages](self, "numOfFacesInMessages"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfFacesOnDevice])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfFacesOnDevice](self, "numOfFacesOnDevice"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfNamedFacesOnDevice])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfNamedFacesOnDevice](self, "numOfNamedFacesOnDevice"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfConversationThreads])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfConversationThreads](self, "numOfConversationThreads"));
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfNamedEntityMentions])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfNamedEntityMentions](self, "numOfNamedEntityMentions"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfSenderMentions])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfSenderMentions](self, "numOfSenderMentions"));
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfReceiverMentions])
  {
    v34 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfReceiverMentions](self, "numOfReceiverMentions"));
  }
  else
  {
    v34 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfPronounMentions])
  {
    v33 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfPronounMentions](self, "numOfPronounMentions"));
  }
  else
  {
    v33 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfImagesShared])
  {
    int64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfImagesShared](self, "numOfImagesShared"));
  }
  else
  {
    int64_t v9 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalyticsFeatures *)self hasNumOfLinguisticMentions])
  {
    int64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfLinguisticMentions](self, "numOfLinguisticMentions"));
  }
  else
  {
    int64_t v10 = 0;
  }
  v35[0] = @"numOfFacesInMessages";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v11;
  v36[0] = v11;
  v35[1] = @"numOfFacesOnDevice";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v12;
  v36[1] = v12;
  v35[2] = @"numOfNamedFacesOnDevice";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v3;
  v25 = (void *)v13;
  v36[2] = v13;
  v35[3] = @"numOfConversationThreads";
  uint64_t v14 = v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v4;
  v24 = (void *)v14;
  v36[3] = v14;
  v35[4] = @"numOfNamedEntityMentions";
  int64_t v15 = (void *)v7;
  if (!v7)
  {
    int64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v5;
  v36[4] = v15;
  v35[5] = @"numOfSenderMentions";
  BOOL v16 = (void *)v8;
  if (!v8)
  {
    BOOL v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v6;
  v36[5] = v16;
  v35[6] = @"numOfReceiverMentions";
  v17 = v34;
  if (!v34)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)v7;
  v36[6] = v17;
  v35[7] = @"numOfPronounMentions";
  v19 = v33;
  if (!v33)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v8;
  v36[7] = v19;
  v35[8] = @"numOfImagesShared";
  v21 = v9;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v36[8] = v21;
  v35[9] = @"numOfLinguisticMentions";
  v22 = v10;
  if (!v10)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v36[9] = v22;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:10];
  if (v10)
  {
    if (v9) {
      goto LABEL_53;
    }
  }
  else
  {

    if (v9) {
      goto LABEL_53;
    }
  }

LABEL_53:
  if (!v33) {

  }
  if (!v34) {
  if (!v20)
  }

  if (!v18) {
  if (!v29)
  }

  if (v30)
  {
    if (v31) {
      goto LABEL_65;
    }
LABEL_72:

    if (v32) {
      goto LABEL_66;
    }
    goto LABEL_73;
  }

  if (!v31) {
    goto LABEL_72;
  }
LABEL_65:
  if (v32) {
    goto LABEL_66;
  }
LABEL_73:

LABEL_66:

  return v28;
}

- (BMTextUnderstandingPoemAnalyticsFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v128[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"numOfFacesInMessages"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v106 = 0;
LABEL_4:
    uint64_t v7 = [v5 objectForKeyedSubscript:@"numOfFacesOnDevice"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v8 = 0;
          v23 = 0;
          v24 = v106;
          goto LABEL_64;
        }
        v25 = a4;
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v125 = *MEMORY[0x1E4F28568];
        v24 = v106;
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numOfFacesOnDevice"];
        id v126 = v12;
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
        uint64_t v29 = v27;
        int64_t v9 = (void *)v28;
        v23 = 0;
        id v8 = 0;
        id *v25 = (id)[v26 initWithDomain:v29 code:2 userInfo:v28];
        goto LABEL_63;
      }
      id v8 = v7;
    }
    else
    {
      id v8 = 0;
    }
    int64_t v9 = [v5 objectForKeyedSubscript:@"numOfNamedFacesOnDevice"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          v23 = 0;
          v24 = v106;
          goto LABEL_63;
        }
        id v103 = objc_alloc(MEMORY[0x1E4F28C58]);
        v30 = a4;
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v123 = *MEMORY[0x1E4F28568];
        id v32 = v8;
        id v33 = [NSString alloc];
        uint64_t v81 = objc_opt_class();
        v34 = v33;
        id v8 = v32;
        id v105 = (id)[v34 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v81, @"numOfNamedFacesOnDevice"];
        id v124 = v105;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
        v23 = 0;
        id *v30 = (id)[v103 initWithDomain:v31 code:2 userInfo:v35];
        id v12 = 0;
        v24 = v106;
LABEL_62:

LABEL_63:
        goto LABEL_64;
      }
      int64_t v10 = v6;
      uint64_t v11 = v7;
      id v12 = v9;
    }
    else
    {
      int64_t v10 = v6;
      uint64_t v11 = v7;
      id v12 = 0;
    }
    uint64_t v13 = [v5 objectForKeyedSubscript:@"numOfConversationThreads"];
    id v104 = v8;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v105 = 0;
          v23 = 0;
          v24 = v106;
          v35 = v13;
          uint64_t v7 = v11;
          uint64_t v6 = v10;
          goto LABEL_62;
        }
        id v97 = v12;
        v92 = a4;
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        v44 = v9;
        uint64_t v45 = *MEMORY[0x1E4F502C8];
        uint64_t v121 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numOfConversationThreads"];
        id v122 = v14;
        uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
        v47 = v43;
        v35 = v13;
        uint64_t v48 = v45;
        int64_t v9 = v44;
        v102 = (void *)v46;
        v23 = 0;
        id v105 = 0;
        id *v92 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2);
        id v12 = v97;
        v24 = v106;
        uint64_t v7 = v11;
        uint64_t v6 = v10;
        goto LABEL_61;
      }
      v95 = v13;
      id v105 = v13;
    }
    else
    {
      v95 = v13;
      id v105 = 0;
    }
    id v14 = [v5 objectForKeyedSubscript:@"numOfNamedEntityMentions"];
    uint64_t v7 = v11;
    v102 = v14;
    if (v14)
    {
      objc_opt_class();
      uint64_t v6 = v10;
      if (objc_opt_isKindOfClass())
      {
        id v14 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v14 = 0;
            v23 = 0;
            v24 = v106;
            v35 = v95;
            goto LABEL_61;
          }
          id v98 = v12;
          v49 = a4;
          id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
          v51 = v9;
          uint64_t v52 = *MEMORY[0x1E4F502C8];
          uint64_t v119 = *MEMORY[0x1E4F28568];
          id v101 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numOfNamedEntityMentions"];
          id v120 = v101;
          uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
          uint64_t v54 = v52;
          int64_t v9 = v51;
          int64_t v15 = (void *)v53;
          v23 = 0;
          id v14 = 0;
          id *v49 = (id)[v50 initWithDomain:v54 code:2 userInfo:v53];
          id v12 = v98;
          goto LABEL_91;
        }
        id v14 = v14;
      }
    }
    else
    {
      uint64_t v6 = v10;
    }
    int64_t v15 = [v5 objectForKeyedSubscript:@"numOfSenderMentions"];
    v91 = a4;
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v86 = v6;
      id v16 = v12;
      id v101 = 0;
LABEL_30:
      uint64_t v17 = [v5 objectForKeyedSubscript:@"numOfReceiverMentions"];
      v89 = (void *)v17;
      if (v17 && (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v94 = 0;
            v23 = 0;
            v35 = v95;
            id v12 = v16;
            uint64_t v6 = v86;
            v41 = v89;
            goto LABEL_59;
          }
          v100 = v16;
          v63 = a4;
          id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
          v65 = v15;
          v66 = v9;
          uint64_t v67 = *MEMORY[0x1E4F502C8];
          uint64_t v115 = *MEMORY[0x1E4F28568];
          id v68 = v14;
          id v69 = [NSString alloc];
          uint64_t v83 = objc_opt_class();
          v70 = v69;
          id v14 = v68;
          id v93 = (id)[v70 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v83, @"numOfReceiverMentions"];
          id v116 = v93;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
          uint64_t v71 = v67;
          int64_t v9 = v66;
          int64_t v15 = v65;
          v23 = 0;
          id v94 = 0;
          id *v63 = (id)[v64 initWithDomain:v71 code:2 userInfo:v19];
          id v12 = v100;
          uint64_t v6 = v86;
          goto LABEL_58;
        }
        id v94 = v18;
      }
      else
      {
        id v94 = 0;
      }
      v19 = [v5 objectForKeyedSubscript:@"numOfPronounMentions"];
      id v12 = v16;
      id v90 = v14;
      v85 = v15;
      if (v19)
      {
        objc_opt_class();
        uint64_t v6 = v86;
        if (objc_opt_isKindOfClass())
        {
          id v93 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v93 = 0;
              v23 = 0;
              goto LABEL_58;
            }
            v72 = v9;
            id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v74 = *MEMORY[0x1E4F502C8];
            uint64_t v113 = *MEMORY[0x1E4F28568];
            id v38 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numOfPronounMentions"];
            id v114 = v38;
            v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
            v75 = v73;
            int64_t v9 = v72;
            int64_t v15 = v85;
            id v76 = (id)[v75 initWithDomain:v74 code:2 userInfo:v36];
            v23 = 0;
            id v93 = 0;
            id *v91 = v76;
LABEL_57:

            id v14 = v90;
LABEL_58:

            v35 = v95;
            v41 = v89;
LABEL_59:

            v24 = v106;
LABEL_60:

LABEL_61:
            id v8 = v104;
            goto LABEL_62;
          }
          id v93 = v19;
        }
      }
      else
      {
        id v93 = 0;
        uint64_t v6 = v86;
      }
      v36 = [v5 objectForKeyedSubscript:@"numOfImagesShared"];
      v84 = v9;
      id v96 = v12;
      if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v38 = 0;
            v23 = 0;
            goto LABEL_57;
          }
          v37 = self;
          id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v77 = *MEMORY[0x1E4F502C8];
          uint64_t v111 = *MEMORY[0x1E4F28568];
          id v40 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numOfImagesShared"];
          id v112 = v40;
          v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
          id v78 = (id)[v87 initWithDomain:v77 code:2 userInfo:v39];
          v23 = 0;
          id v38 = 0;
          id *v91 = v78;
          goto LABEL_56;
        }
        v37 = self;
        id v38 = v36;
      }
      else
      {
        v37 = self;
        id v38 = 0;
      }
      v39 = [v5 objectForKeyedSubscript:@"numOfLinguisticMentions"];
      if (v39 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v91)
          {
            id v108 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v88 = *MEMORY[0x1E4F502C8];
            uint64_t v109 = *MEMORY[0x1E4F28568];
            v79 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numOfLinguisticMentions"];
            v110 = v79;
            v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
            id *v91 = (id)[v108 initWithDomain:v88 code:2 userInfo:v80];
          }
          id v40 = 0;
          v23 = 0;
          goto LABEL_56;
        }
        id v40 = v39;
      }
      else
      {
        id v40 = 0;
      }
      v23 = [(BMTextUnderstandingPoemAnalyticsFeatures *)v37 initWithNumOfFacesInMessages:v106 numOfFacesOnDevice:v104 numOfNamedFacesOnDevice:v96 numOfConversationThreads:v105 numOfNamedEntityMentions:v90 numOfSenderMentions:v101 numOfReceiverMentions:v94 numOfPronounMentions:v93 numOfImagesShared:v38 numOfLinguisticMentions:v40];
      v37 = v23;
LABEL_56:
      self = v37;

      int64_t v9 = v84;
      int64_t v15 = v85;
      id v12 = v96;
      goto LABEL_57;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v86 = v6;
      id v16 = v12;
      id v101 = v15;
      goto LABEL_30;
    }
    if (a4)
    {
      id v99 = v12;
      id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
      v56 = v15;
      v57 = v9;
      uint64_t v58 = *MEMORY[0x1E4F502C8];
      uint64_t v117 = *MEMORY[0x1E4F28568];
      id v59 = v14;
      id v60 = [NSString alloc];
      uint64_t v82 = objc_opt_class();
      v61 = v60;
      id v14 = v59;
      id v94 = (id)[v61 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v82, @"numOfSenderMentions"];
      id v118 = v94;
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
      uint64_t v62 = v58;
      int64_t v9 = v57;
      int64_t v15 = v56;
      v23 = 0;
      id v101 = 0;
      id *v91 = (id)[v55 initWithDomain:v62 code:2 userInfo:v41];
      v35 = v95;
      id v12 = v99;
      goto LABEL_59;
    }
    id v101 = 0;
    v23 = 0;
LABEL_91:
    v24 = v106;
    v35 = v95;
    goto LABEL_60;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v106 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    v23 = 0;
    v24 = 0;
    goto LABEL_65;
  }
  v20 = a4;
  id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v22 = *MEMORY[0x1E4F502C8];
  uint64_t v127 = *MEMORY[0x1E4F28568];
  id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numOfFacesInMessages"];
  v128[0] = v8;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:&v127 count:1];
  v23 = 0;
  v24 = 0;
  id *v20 = (id)[v21 initWithDomain:v22 code:2 userInfo:v7];
LABEL_64:

LABEL_65:
  return v23;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMTextUnderstandingPoemAnalyticsFeatures *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasNumOfFacesInMessages)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasNumOfFacesOnDevice)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasNumOfNamedFacesOnDevice)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasNumOfConversationThreads)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasNumOfNamedEntityMentions)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasNumOfSenderMentions)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasNumOfReceiverMentions)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasNumOfPronounMentions)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasNumOfImagesShared)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasNumOfLinguisticMentions)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v99.receiver = self;
  v99.super_class = (Class)BMTextUnderstandingPoemAnalyticsFeatures;
  id v5 = [(BMEventBase *)&v99 init];
  if (!v5) {
    goto LABEL_121;
  }
  uint64_t v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    int64_t v9 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfFacesInMessages;
    int64_t v10 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    id v12 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v13 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfFacesOnDevice;
    id v14 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    int64_t v15 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    id v16 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v17 = 0;
      unsigned int v18 = 0;
      unint64_t v19 = 0;
      while (1)
      {
        uint64_t v20 = *v6;
        uint64_t v21 = *(void *)&v4[v20];
        unint64_t v22 = v21 + 1;
        if (v21 == -1 || v22 > *(void *)&v4[*v7]) {
          break;
        }
        char v23 = *(unsigned char *)(*(void *)&v4[*v11] + v21);
        *(void *)&v4[v20] = v22;
        v19 |= (unint64_t)(v23 & 0x7F) << v17;
        if ((v23 & 0x80) == 0) {
          goto LABEL_13;
        }
        v17 += 7;
        if (v18++ >= 9)
        {
          unint64_t v19 = 0;
          int v25 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v25 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v19 = 0;
      }
LABEL_15:
      if (v25 || (v19 & 7) == 4) {
        break;
      }
      switch((v19 >> 3))
      {
        case 1u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + v10[567]) = 1;
          while (1)
          {
            uint64_t v30 = *v6;
            uint64_t v31 = *(void *)&v4[v30];
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)&v4[*v7])
            {
              v35 = v9;
              goto LABEL_102;
            }
            char v33 = *(unsigned char *)(*(void *)&v4[*v11] + v31);
            *(void *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              break;
            }
            v34 = 0;
            v27 += 7;
            v35 = v9;
            BOOL v36 = v28++ > 8;
            if (v36) {
              goto LABEL_106;
            }
          }
          v35 = v9;
          goto LABEL_103;
        case 2u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + v12[569]) = 1;
          while (2)
          {
            uint64_t v45 = *v6;
            uint64_t v46 = *(void *)&v4[v45];
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)&v4[*v7])
            {
              v35 = v13;
              goto LABEL_102;
            }
            char v48 = *(unsigned char *)(*(void *)&v4[*v11] + v46);
            *(void *)&v4[v45] = v47;
            v29 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v34 = 0;
              v43 += 7;
              v35 = v13;
              BOOL v36 = v44++ > 8;
              if (v36) {
                goto LABEL_106;
              }
              continue;
            }
            break;
          }
          v35 = v13;
          goto LABEL_103;
        case 3u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + v14[571]) = 1;
          while (2)
          {
            uint64_t v51 = *v6;
            uint64_t v52 = *(void *)&v4[v51];
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)&v4[*v7])
            {
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedFacesOnDevice;
              goto LABEL_102;
            }
            char v54 = *(unsigned char *)(*(void *)&v4[*v11] + v52);
            *(void *)&v4[v51] = v53;
            v29 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v34 = 0;
              v49 += 7;
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedFacesOnDevice;
              BOOL v36 = v50++ > 8;
              if (v36) {
                goto LABEL_106;
              }
              continue;
            }
            break;
          }
          v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedFacesOnDevice;
          goto LABEL_103;
        case 4u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + v15[573]) = 1;
          while (2)
          {
            uint64_t v57 = *v6;
            uint64_t v58 = *(void *)&v4[v57];
            unint64_t v59 = v58 + 1;
            if (v58 == -1 || v59 > *(void *)&v4[*v7])
            {
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfConversationThreads;
              goto LABEL_102;
            }
            char v60 = *(unsigned char *)(*(void *)&v4[*v11] + v58);
            *(void *)&v4[v57] = v59;
            v29 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v34 = 0;
              v55 += 7;
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfConversationThreads;
              BOOL v36 = v56++ > 8;
              if (v36) {
                goto LABEL_106;
              }
              continue;
            }
            break;
          }
          v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfConversationThreads;
          goto LABEL_103;
        case 5u:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + v16[575]) = 1;
          while (2)
          {
            uint64_t v63 = *v6;
            uint64_t v64 = *(void *)&v4[v63];
            unint64_t v65 = v64 + 1;
            if (v64 == -1 || v65 > *(void *)&v4[*v7])
            {
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedEntityMentions;
              goto LABEL_102;
            }
            char v66 = *(unsigned char *)(*(void *)&v4[*v11] + v64);
            *(void *)&v4[v63] = v65;
            v29 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              v34 = 0;
              v61 += 7;
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedEntityMentions;
              BOOL v36 = v62++ > 8;
              if (v36) {
                goto LABEL_106;
              }
              continue;
            }
            break;
          }
          v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedEntityMentions;
          goto LABEL_103;
        case 6u:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v29 = 0;
          v5->_hasNumOfSenderMentions = 1;
          while (2)
          {
            uint64_t v69 = *v6;
            uint64_t v70 = *(void *)&v4[v69];
            unint64_t v71 = v70 + 1;
            if (v70 == -1 || v71 > *(void *)&v4[*v7])
            {
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfSenderMentions;
              goto LABEL_102;
            }
            char v72 = *(unsigned char *)(*(void *)&v4[*v11] + v70);
            *(void *)&v4[v69] = v71;
            v29 |= (unint64_t)(v72 & 0x7F) << v67;
            if (v72 < 0)
            {
              v34 = 0;
              v67 += 7;
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfSenderMentions;
              BOOL v36 = v68++ > 8;
              if (v36) {
                goto LABEL_106;
              }
              continue;
            }
            break;
          }
          v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfSenderMentions;
          goto LABEL_103;
        case 7u:
          char v73 = 0;
          unsigned int v74 = 0;
          uint64_t v29 = 0;
          v5->_hasNumOfReceiverMentions = 1;
          while (2)
          {
            uint64_t v75 = *v6;
            uint64_t v76 = *(void *)&v4[v75];
            unint64_t v77 = v76 + 1;
            if (v76 == -1 || v77 > *(void *)&v4[*v7])
            {
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfReceiverMentions;
              goto LABEL_102;
            }
            char v78 = *(unsigned char *)(*(void *)&v4[*v11] + v76);
            *(void *)&v4[v75] = v77;
            v29 |= (unint64_t)(v78 & 0x7F) << v73;
            if (v78 < 0)
            {
              v34 = 0;
              v73 += 7;
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfReceiverMentions;
              BOOL v36 = v74++ > 8;
              if (v36) {
                goto LABEL_106;
              }
              continue;
            }
            break;
          }
          v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfReceiverMentions;
          goto LABEL_103;
        case 8u:
          char v79 = 0;
          unsigned int v80 = 0;
          uint64_t v29 = 0;
          v5->_hasNumOfPronounMentions = 1;
          while (2)
          {
            uint64_t v81 = *v6;
            uint64_t v82 = *(void *)&v4[v81];
            unint64_t v83 = v82 + 1;
            if (v82 == -1 || v83 > *(void *)&v4[*v7])
            {
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfPronounMentions;
              goto LABEL_102;
            }
            char v84 = *(unsigned char *)(*(void *)&v4[*v11] + v82);
            *(void *)&v4[v81] = v83;
            v29 |= (unint64_t)(v84 & 0x7F) << v79;
            if (v84 < 0)
            {
              v34 = 0;
              v79 += 7;
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfPronounMentions;
              BOOL v36 = v80++ > 8;
              if (v36) {
                goto LABEL_106;
              }
              continue;
            }
            break;
          }
          v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfPronounMentions;
          goto LABEL_103;
        case 9u:
          char v85 = 0;
          unsigned int v86 = 0;
          uint64_t v29 = 0;
          v5->_hasNumOfImagesShared = 1;
          while (2)
          {
            uint64_t v87 = *v6;
            uint64_t v88 = *(void *)&v4[v87];
            unint64_t v89 = v88 + 1;
            if (v88 == -1 || v89 > *(void *)&v4[*v7])
            {
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfImagesShared;
              goto LABEL_102;
            }
            char v90 = *(unsigned char *)(*(void *)&v4[*v11] + v88);
            *(void *)&v4[v87] = v89;
            v29 |= (unint64_t)(v90 & 0x7F) << v85;
            if (v90 < 0)
            {
              v34 = 0;
              v85 += 7;
              v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfImagesShared;
              BOOL v36 = v86++ > 8;
              if (v36) {
                goto LABEL_106;
              }
              continue;
            }
            break;
          }
          v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfImagesShared;
          goto LABEL_103;
        case 0xAu:
          char v91 = 0;
          unsigned int v92 = 0;
          uint64_t v29 = 0;
          v5->_hasNumOfLinguisticMentions = 1;
          break;
        default:
          v37 = v9;
          id v38 = v10;
          v39 = v12;
          id v40 = v13;
          v41 = v14;
          char v42 = PBReaderSkipValueWithTag();
          id v14 = v41;
          id v8 = (int *)MEMORY[0x1E4F940C8];
          uint64_t v13 = v40;
          id v12 = v39;
          int64_t v15 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          int64_t v10 = v38;
          id v16 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          int64_t v9 = v37;
          if ((v42 & 1) == 0) {
            goto LABEL_120;
          }
          continue;
      }
      while (1)
      {
        uint64_t v93 = *v6;
        uint64_t v94 = *(void *)&v4[v93];
        unint64_t v95 = v94 + 1;
        if (v94 == -1 || v95 > *(void *)&v4[*v7]) {
          break;
        }
        char v96 = *(unsigned char *)(*(void *)&v4[*v11] + v94);
        *(void *)&v4[v93] = v95;
        v29 |= (unint64_t)(v96 & 0x7F) << v91;
        if ((v96 & 0x80) == 0)
        {
          v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfLinguisticMentions;
          goto LABEL_103;
        }
        v34 = 0;
        v91 += 7;
        v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfLinguisticMentions;
        BOOL v36 = v92++ > 8;
        if (v36) {
          goto LABEL_106;
        }
      }
      v35 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfLinguisticMentions;
LABEL_102:
      v4[*v8] = 1;
LABEL_103:
      v34 = v4[*v8] ? 0 : (objc_class *)v29;
LABEL_106:
      *(Class *)((char *)&v5->super.super.isa + *v35) = v34;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_120:
  }
    id v97 = 0;
  else {
LABEL_121:
  }
    id v97 = v5;

  return v97;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfFacesInMessages](self, "numOfFacesInMessages"));
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfFacesOnDevice](self, "numOfFacesOnDevice"));
  id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfNamedFacesOnDevice](self, "numOfNamedFacesOnDevice"));
  id v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfConversationThreads](self, "numOfConversationThreads"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfNamedEntityMentions](self, "numOfNamedEntityMentions"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfSenderMentions](self, "numOfSenderMentions"));
  id v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfReceiverMentions](self, "numOfReceiverMentions"));
  int64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfPronounMentions](self, "numOfPronounMentions"));
  int64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfImagesShared](self, "numOfImagesShared"));
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfLinguisticMentions](self, "numOfLinguisticMentions"));
  id v15 = (id)[v14 initWithFormat:@"BMTextUnderstandingPoemAnalyticsFeatures with numOfFacesInMessages: %@, numOfFacesOnDevice: %@, numOfNamedFacesOnDevice: %@, numOfConversationThreads: %@, numOfNamedEntityMentions: %@, numOfSenderMentions: %@, numOfReceiverMentions: %@, numOfPronounMentions: %@, numOfImagesShared: %@, numOfLinguisticMentions: %@", v13, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v15;
}

- (BMTextUnderstandingPoemAnalyticsFeatures)initWithNumOfFacesInMessages:(id)a3 numOfFacesOnDevice:(id)a4 numOfNamedFacesOnDevice:(id)a5 numOfConversationThreads:(id)a6 numOfNamedEntityMentions:(id)a7 numOfSenderMentions:(id)a8 numOfReceiverMentions:(id)a9 numOfPronounMentions:(id)a10 numOfImagesShared:(id)a11 numOfLinguisticMentions:(id)a12
{
  id v17 = a3;
  id v39 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v40.receiver = self;
  v40.super_class = (Class)BMTextUnderstandingPoemAnalyticsFeatures;
  id v26 = [(BMEventBase *)&v40 init];
  if (v26)
  {
    v26->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v17)
    {
      v26->_hasNumOfFacesInMessages = 1;
      uint64_t v27 = [v17 longLongValue];
    }
    else
    {
      v26->_hasNumOfFacesInMessages = 0;
      uint64_t v27 = -1;
    }
    v26->_numOfFacesInMessages = v27;
    if (v39)
    {
      v26->_hasNumOfFacesOnDevice = 1;
      uint64_t v28 = [v39 longLongValue];
    }
    else
    {
      v26->_hasNumOfFacesOnDevice = 0;
      uint64_t v28 = -1;
    }
    v26->_numOfFacesOnDevice = v28;
    if (v18)
    {
      v26->_hasNumOfNamedFacesOnDevice = 1;
      uint64_t v29 = [v18 longLongValue];
    }
    else
    {
      v26->_hasNumOfNamedFacesOnDevice = 0;
      uint64_t v29 = -1;
    }
    v26->_numOfNamedFacesOnDevice = v29;
    if (v19)
    {
      v26->_hasNumOfConversationThreads = 1;
      uint64_t v30 = [v19 longLongValue];
    }
    else
    {
      v26->_hasNumOfConversationThreads = 0;
      uint64_t v30 = -1;
    }
    v26->_numOfConversationThreads = v30;
    if (v20)
    {
      v26->_hasNumOfNamedEntityMentions = 1;
      uint64_t v31 = [v20 longLongValue];
    }
    else
    {
      v26->_hasNumOfNamedEntityMentions = 0;
      uint64_t v31 = -1;
    }
    v26->_numOfNamedEntityMentions = v31;
    if (v21)
    {
      v26->_hasNumOfSenderMentions = 1;
      uint64_t v32 = [v21 longLongValue];
    }
    else
    {
      v26->_hasNumOfSenderMentions = 0;
      uint64_t v32 = -1;
    }
    v26->_numOfSenderMentions = v32;
    if (v22)
    {
      v26->_hasNumOfReceiverMentions = 1;
      uint64_t v33 = [v22 longLongValue];
    }
    else
    {
      v26->_hasNumOfReceiverMentions = 0;
      uint64_t v33 = -1;
    }
    v26->_numOfReceiverMentions = v33;
    if (v23)
    {
      v26->_hasNumOfPronounMentions = 1;
      uint64_t v34 = [v23 longLongValue];
    }
    else
    {
      v26->_hasNumOfPronounMentions = 0;
      uint64_t v34 = -1;
    }
    v26->_numOfPronounMentions = v34;
    if (v24)
    {
      v26->_hasNumOfImagesShared = 1;
      uint64_t v35 = [v24 longLongValue];
    }
    else
    {
      v26->_hasNumOfImagesShared = 0;
      uint64_t v35 = -1;
    }
    v26->_numOfImagesShared = v35;
    if (v25)
    {
      v26->_hasNumOfLinguisticMentions = 1;
      uint64_t v36 = [v25 longLongValue];
    }
    else
    {
      v26->_hasNumOfLinguisticMentions = 0;
      uint64_t v36 = -1;
    }
    v26->_numOfLinguisticMentions = v36;
  }

  return v26;
}

+ (id)protoFields
{
  v14[10] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numOfFacesInMessages" number:1 type:3 subMessageClass:0];
  v14[0] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numOfFacesOnDevice" number:2 type:3 subMessageClass:0];
  v14[1] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numOfNamedFacesOnDevice" number:3 type:3 subMessageClass:0];
  v14[2] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numOfConversationThreads" number:4 type:3 subMessageClass:0];
  v14[3] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numOfNamedEntityMentions" number:5 type:3 subMessageClass:0];
  v14[4] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numOfSenderMentions" number:6 type:3 subMessageClass:0];
  v14[5] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numOfReceiverMentions" number:7 type:3 subMessageClass:0];
  v14[6] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numOfPronounMentions" number:8 type:3 subMessageClass:0];
  v14[7] = v8;
  int64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numOfImagesShared" number:9 type:3 subMessageClass:0];
  v14[8] = v9;
  int64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numOfLinguisticMentions" number:10 type:3 subMessageClass:0];
  v14[9] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3D20;
}

+ (id)columns
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numOfFacesInMessages" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:3 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numOfFacesOnDevice" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:3 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numOfNamedFacesOnDevice" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:3 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numOfConversationThreads" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:3 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numOfNamedEntityMentions" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:3 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numOfSenderMentions" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:3 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numOfReceiverMentions" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:3 convertedType:0];
  int64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numOfPronounMentions" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:3 convertedType:0];
  int64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numOfImagesShared" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:3 convertedType:0];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numOfLinguisticMentions" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:3 convertedType:0];
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v13;
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

    id v8 = [[BMTextUnderstandingPoemAnalyticsFeatures alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end