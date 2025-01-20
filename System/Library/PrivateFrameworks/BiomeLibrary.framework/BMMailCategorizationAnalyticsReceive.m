@interface BMMailCategorizationAnalyticsReceive
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMailCategorizationAnalyticsReceive)initWithAccountId:(id)a3 messageId:(id)a4 senderId:(id)a5 receivingAccountDomain:(id)a6 metadataPrimaryKey:(id)a7 predictedCategory:(id)a8 currCategoryView:(id)a9 reasonCodes:(id)a10 receiveTimestamp:(id)a11 isAllInboxesCategoriesEnabled:(id)a12 isMailAccountPersonalAccount:(id)a13 isMailAccountCategoriesEnabled:(id)a14;
- (BMMailCategorizationAnalyticsReceive)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasCurrCategoryView;
- (BOOL)hasIsAllInboxesCategoriesEnabled;
- (BOOL)hasIsMailAccountCategoriesEnabled;
- (BOOL)hasIsMailAccountPersonalAccount;
- (BOOL)hasMessageId;
- (BOOL)hasPredictedCategory;
- (BOOL)hasReceiveTimestamp;
- (BOOL)hasReceivingAccountDomain;
- (BOOL)hasSenderId;
- (BOOL)isAllInboxesCategoriesEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMailAccountCategoriesEnabled;
- (BOOL)isMailAccountPersonalAccount;
- (NSString)accountId;
- (NSString)description;
- (NSString)metadataPrimaryKey;
- (NSString)reasonCodes;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)currCategoryView;
- (int)messageId;
- (int)predictedCategory;
- (int)receiveTimestamp;
- (int)receivingAccountDomain;
- (int)senderId;
- (unsigned)dataVersion;
- (void)setHasCurrCategoryView:(BOOL)a3;
- (void)setHasIsAllInboxesCategoriesEnabled:(BOOL)a3;
- (void)setHasIsMailAccountCategoriesEnabled:(BOOL)a3;
- (void)setHasIsMailAccountPersonalAccount:(BOOL)a3;
- (void)setHasMessageId:(BOOL)a3;
- (void)setHasPredictedCategory:(BOOL)a3;
- (void)setHasReceiveTimestamp:(BOOL)a3;
- (void)setHasReceivingAccountDomain:(BOOL)a3;
- (void)setHasSenderId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMailCategorizationAnalyticsReceive

+ (id)columns
{
  v16[12] = *MEMORY[0x1E4F143B8];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accountId" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageId" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"senderId" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"receivingAccountDomain" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"metadataPrimaryKey" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"predictedCategory" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"currCategoryView" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reasonCodes" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"receiveTimestamp" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:2 convertedType:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAllInboxesCategoriesEnabled" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMailAccountPersonalAccount" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:12 convertedType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMailAccountCategoriesEnabled" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:12 convertedType:0];
  v16[0] = v15;
  v16[1] = v14;
  v16[2] = v2;
  v16[3] = v3;
  v16[4] = v4;
  v16[5] = v5;
  v16[6] = v6;
  v16[7] = v7;
  v16[8] = v8;
  v16[9] = v13;
  v16[10] = v9;
  v16[11] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonCodes, 0);
  objc_storeStrong((id *)&self->_metadataPrimaryKey, 0);

  objc_storeStrong((id *)&self->_accountId, 0);
}

- (void)setHasIsMailAccountCategoriesEnabled:(BOOL)a3
{
  self->_hasIsMailAccountCategoriesEnabled = a3;
}

- (BOOL)hasIsMailAccountCategoriesEnabled
{
  return self->_hasIsMailAccountCategoriesEnabled;
}

- (BOOL)isMailAccountCategoriesEnabled
{
  return self->_isMailAccountCategoriesEnabled;
}

- (void)setHasIsMailAccountPersonalAccount:(BOOL)a3
{
  self->_hasIsMailAccountPersonalAccount = a3;
}

- (BOOL)hasIsMailAccountPersonalAccount
{
  return self->_hasIsMailAccountPersonalAccount;
}

- (BOOL)isMailAccountPersonalAccount
{
  return self->_isMailAccountPersonalAccount;
}

- (void)setHasIsAllInboxesCategoriesEnabled:(BOOL)a3
{
  self->_hasIsAllInboxesCategoriesEnabled = a3;
}

- (BOOL)hasIsAllInboxesCategoriesEnabled
{
  return self->_hasIsAllInboxesCategoriesEnabled;
}

- (BOOL)isAllInboxesCategoriesEnabled
{
  return self->_isAllInboxesCategoriesEnabled;
}

- (void)setHasReceiveTimestamp:(BOOL)a3
{
  self->_hasReceiveTimestamp = a3;
}

- (BOOL)hasReceiveTimestamp
{
  return self->_hasReceiveTimestamp;
}

- (int)receiveTimestamp
{
  return self->_receiveTimestamp;
}

- (NSString)reasonCodes
{
  return self->_reasonCodes;
}

- (void)setHasCurrCategoryView:(BOOL)a3
{
  self->_hasCurrCategoryView = a3;
}

- (BOOL)hasCurrCategoryView
{
  return self->_hasCurrCategoryView;
}

- (int)currCategoryView
{
  return self->_currCategoryView;
}

- (void)setHasPredictedCategory:(BOOL)a3
{
  self->_hasPredictedCategory = a3;
}

- (BOOL)hasPredictedCategory
{
  return self->_hasPredictedCategory;
}

- (int)predictedCategory
{
  return self->_predictedCategory;
}

- (NSString)metadataPrimaryKey
{
  return self->_metadataPrimaryKey;
}

- (void)setHasReceivingAccountDomain:(BOOL)a3
{
  self->_hasReceivingAccountDomain = a3;
}

- (BOOL)hasReceivingAccountDomain
{
  return self->_hasReceivingAccountDomain;
}

- (int)receivingAccountDomain
{
  return self->_receivingAccountDomain;
}

- (void)setHasSenderId:(BOOL)a3
{
  self->_hasSenderId = a3;
}

- (BOOL)hasSenderId
{
  return self->_hasSenderId;
}

- (int)senderId
{
  return self->_senderId;
}

- (void)setHasMessageId:(BOOL)a3
{
  self->_hasMessageId = a3;
}

- (BOOL)hasMessageId
{
  return self->_hasMessageId;
}

- (int)messageId
{
  return self->_messageId;
}

- (NSString)accountId
{
  return self->_accountId;
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
    v6 = [(BMMailCategorizationAnalyticsReceive *)self accountId];
    uint64_t v7 = [v5 accountId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMailCategorizationAnalyticsReceive *)self accountId];
      v10 = [v5 accountId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_60;
      }
    }
    if ([(BMMailCategorizationAnalyticsReceive *)self hasMessageId]
      || [v5 hasMessageId])
    {
      if (![(BMMailCategorizationAnalyticsReceive *)self hasMessageId]) {
        goto LABEL_60;
      }
      if (![v5 hasMessageId]) {
        goto LABEL_60;
      }
      int v13 = [(BMMailCategorizationAnalyticsReceive *)self messageId];
      if (v13 != [v5 messageId]) {
        goto LABEL_60;
      }
    }
    if ([(BMMailCategorizationAnalyticsReceive *)self hasSenderId]
      || [v5 hasSenderId])
    {
      if (![(BMMailCategorizationAnalyticsReceive *)self hasSenderId]) {
        goto LABEL_60;
      }
      if (![v5 hasSenderId]) {
        goto LABEL_60;
      }
      int v14 = [(BMMailCategorizationAnalyticsReceive *)self senderId];
      if (v14 != [v5 senderId]) {
        goto LABEL_60;
      }
    }
    if ([(BMMailCategorizationAnalyticsReceive *)self hasReceivingAccountDomain]
      || [v5 hasReceivingAccountDomain])
    {
      if (![(BMMailCategorizationAnalyticsReceive *)self hasReceivingAccountDomain]) {
        goto LABEL_60;
      }
      if (![v5 hasReceivingAccountDomain]) {
        goto LABEL_60;
      }
      int v15 = [(BMMailCategorizationAnalyticsReceive *)self receivingAccountDomain];
      if (v15 != [v5 receivingAccountDomain]) {
        goto LABEL_60;
      }
    }
    v16 = [(BMMailCategorizationAnalyticsReceive *)self metadataPrimaryKey];
    uint64_t v17 = [v5 metadataPrimaryKey];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      v18 = (void *)v17;
      v19 = [(BMMailCategorizationAnalyticsReceive *)self metadataPrimaryKey];
      v20 = [v5 metadataPrimaryKey];
      int v21 = [v19 isEqual:v20];

      if (!v21) {
        goto LABEL_60;
      }
    }
    if ([(BMMailCategorizationAnalyticsReceive *)self hasPredictedCategory]
      || [v5 hasPredictedCategory])
    {
      if (![(BMMailCategorizationAnalyticsReceive *)self hasPredictedCategory]) {
        goto LABEL_60;
      }
      if (![v5 hasPredictedCategory]) {
        goto LABEL_60;
      }
      int v22 = [(BMMailCategorizationAnalyticsReceive *)self predictedCategory];
      if (v22 != [v5 predictedCategory]) {
        goto LABEL_60;
      }
    }
    if ([(BMMailCategorizationAnalyticsReceive *)self hasCurrCategoryView]
      || [v5 hasCurrCategoryView])
    {
      if (![(BMMailCategorizationAnalyticsReceive *)self hasCurrCategoryView]) {
        goto LABEL_60;
      }
      if (![v5 hasCurrCategoryView]) {
        goto LABEL_60;
      }
      int v23 = [(BMMailCategorizationAnalyticsReceive *)self currCategoryView];
      if (v23 != [v5 currCategoryView]) {
        goto LABEL_60;
      }
    }
    v24 = [(BMMailCategorizationAnalyticsReceive *)self reasonCodes];
    uint64_t v25 = [v5 reasonCodes];
    if (v24 == (void *)v25)
    {
    }
    else
    {
      v26 = (void *)v25;
      v27 = [(BMMailCategorizationAnalyticsReceive *)self reasonCodes];
      v28 = [v5 reasonCodes];
      int v29 = [v27 isEqual:v28];

      if (!v29) {
        goto LABEL_60;
      }
    }
    if (![(BMMailCategorizationAnalyticsReceive *)self hasReceiveTimestamp]
      && ![v5 hasReceiveTimestamp]
      || [(BMMailCategorizationAnalyticsReceive *)self hasReceiveTimestamp]
      && [v5 hasReceiveTimestamp]
      && (int v30 = [(BMMailCategorizationAnalyticsReceive *)self receiveTimestamp],
          v30 == [v5 receiveTimestamp]))
    {
      if (!-[BMMailCategorizationAnalyticsReceive hasIsAllInboxesCategoriesEnabled](self, "hasIsAllInboxesCategoriesEnabled")&& ![v5 hasIsAllInboxesCategoriesEnabled]|| -[BMMailCategorizationAnalyticsReceive hasIsAllInboxesCategoriesEnabled](self, "hasIsAllInboxesCategoriesEnabled")&& objc_msgSend(v5, "hasIsAllInboxesCategoriesEnabled")&& (int v31 = -[BMMailCategorizationAnalyticsReceive isAllInboxesCategoriesEnabled](self, "isAllInboxesCategoriesEnabled"), v31 == objc_msgSend(v5, "isAllInboxesCategoriesEnabled")))
      {
        if (!-[BMMailCategorizationAnalyticsReceive hasIsMailAccountPersonalAccount](self, "hasIsMailAccountPersonalAccount")&& ![v5 hasIsMailAccountPersonalAccount]|| -[BMMailCategorizationAnalyticsReceive hasIsMailAccountPersonalAccount](self, "hasIsMailAccountPersonalAccount")&& objc_msgSend(v5, "hasIsMailAccountPersonalAccount")&& (int v32 = -[BMMailCategorizationAnalyticsReceive isMailAccountPersonalAccount](self, "isMailAccountPersonalAccount"), v32 == objc_msgSend(v5, "isMailAccountPersonalAccount")))
        {
          if (!-[BMMailCategorizationAnalyticsReceive hasIsMailAccountCategoriesEnabled](self, "hasIsMailAccountCategoriesEnabled")&& ![v5 hasIsMailAccountCategoriesEnabled])
          {
            LOBYTE(v12) = 1;
            goto LABEL_61;
          }
          if (-[BMMailCategorizationAnalyticsReceive hasIsMailAccountCategoriesEnabled](self, "hasIsMailAccountCategoriesEnabled")&& [v5 hasIsMailAccountCategoriesEnabled])
          {
            BOOL v33 = [(BMMailCategorizationAnalyticsReceive *)self isMailAccountCategoriesEnabled];
            int v12 = v33 ^ [v5 isMailAccountCategoriesEnabled] ^ 1;
LABEL_61:

            goto LABEL_62;
          }
        }
      }
    }
LABEL_60:
    LOBYTE(v12) = 0;
    goto LABEL_61;
  }
  LOBYTE(v12) = 0;
LABEL_62:

  return v12;
}

- (id)jsonDictionary
{
  v38[12] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMMailCategorizationAnalyticsReceive *)self accountId];
  if ([(BMMailCategorizationAnalyticsReceive *)self hasMessageId])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive messageId](self, "messageId"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMMailCategorizationAnalyticsReceive *)self hasSenderId])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive senderId](self, "senderId"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMMailCategorizationAnalyticsReceive *)self hasReceivingAccountDomain])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive receivingAccountDomain](self, "receivingAccountDomain"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  v36 = [(BMMailCategorizationAnalyticsReceive *)self metadataPrimaryKey];
  if ([(BMMailCategorizationAnalyticsReceive *)self hasPredictedCategory])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive predictedCategory](self, "predictedCategory"));
    id v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v35 = 0;
  }
  if ([(BMMailCategorizationAnalyticsReceive *)self hasCurrCategoryView])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive currCategoryView](self, "currCategoryView"));
    id v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v34 = 0;
  }
  BOOL v33 = [(BMMailCategorizationAnalyticsReceive *)self reasonCodes];
  if ([(BMMailCategorizationAnalyticsReceive *)self hasReceiveTimestamp])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive receiveTimestamp](self, "receiveTimestamp"));
    id v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v32 = 0;
  }
  if ([(BMMailCategorizationAnalyticsReceive *)self hasIsAllInboxesCategoriesEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorizationAnalyticsReceive isAllInboxesCategoriesEnabled](self, "isAllInboxesCategoriesEnabled"));
    id v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v31 = 0;
  }
  if ([(BMMailCategorizationAnalyticsReceive *)self hasIsMailAccountPersonalAccount])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorizationAnalyticsReceive isMailAccountPersonalAccount](self, "isMailAccountPersonalAccount"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMMailCategorizationAnalyticsReceive *)self hasIsMailAccountCategoriesEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorizationAnalyticsReceive isMailAccountCategoriesEnabled](self, "isMailAccountCategoriesEnabled"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  v37[0] = @"accountId";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v9;
  v38[0] = v9;
  v37[1] = @"messageId";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v25 = (void *)v10;
  v38[1] = v10;
  v37[2] = @"senderId";
  uint64_t v11 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v11;
  v38[2] = v11;
  v37[3] = @"receivingAccountDomain";
  uint64_t v12 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v3;
  int v23 = (void *)v12;
  v38[3] = v12;
  v37[4] = @"metadataPrimaryKey";
  uint64_t v13 = (uint64_t)v36;
  if (!v36)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  int v29 = v4;
  v38[4] = v13;
  v37[5] = @"predictedCategory";
  int v14 = v35;
  if (!v35)
  {
    int v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[5] = v14;
  v37[6] = @"currCategoryView";
  int v15 = v34;
  if (!v34)
  {
    int v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = v5;
  v38[6] = v15;
  v37[7] = @"reasonCodes";
  v16 = v33;
  if (!v33)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[7] = v16;
  v37[8] = @"receiveTimestamp";
  uint64_t v17 = v32;
  if (!v32)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[8] = v17;
  v37[9] = @"isAllInboxesCategoriesEnabled";
  v18 = v31;
  if (!v31)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v22 = (void *)v13;
  v38[9] = v18;
  v37[10] = @"isMailAccountPersonalAccount";
  v19 = v7;
  if (!v7)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[10] = v19;
  v37[11] = @"isMailAccountCategoriesEnabled";
  v20 = v8;
  if (!v8)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[11] = v20;
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:12];
  if (v8)
  {
    if (v7) {
      goto LABEL_54;
    }
  }
  else
  {

    if (v7) {
      goto LABEL_54;
    }
  }

LABEL_54:
  if (!v31) {

  }
  if (!v32) {
  if (!v33)
  }

  if (!v34) {
  if (!v35)
  }

  if (!v36) {
  if (v6)
  }
  {
    if (v28) {
      goto LABEL_68;
    }
  }
  else
  {

    if (v28)
    {
LABEL_68:
      if (v29) {
        goto LABEL_69;
      }
LABEL_77:

      if (v30) {
        goto LABEL_70;
      }
      goto LABEL_78;
    }
  }

  if (!v29) {
    goto LABEL_77;
  }
LABEL_69:
  if (v30) {
    goto LABEL_70;
  }
LABEL_78:

LABEL_70:

  return v27;
}

- (BMMailCategorizationAnalyticsReceive)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v154[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"accountId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"messageId"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
LABEL_7:
      uint64_t v11 = [v6 objectForKeyedSubscript:@"senderId"];
      v129 = self;
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v130 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v130 = v11;
LABEL_10:
        uint64_t v12 = [v6 objectForKeyedSubscript:@"receivingAccountDomain"];
        id v124 = v8;
        id v128 = v10;
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v125 = a4;
          v122 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v125 = a4;
          v122 = v12;
LABEL_13:
          uint64_t v13 = [v6 objectForKeyedSubscript:@"metadataPrimaryKey"];
          if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v117 = v13;
            id v14 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v117 = v13;
            id v14 = v13;
LABEL_16:
            uint64_t v15 = [v6 objectForKeyedSubscript:@"predictedCategory"];
            id v120 = v14;
            v121 = (void *)v15;
            if (!v15 || (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v123 = 0;
LABEL_19:
              id v17 = [v6 objectForKeyedSubscript:@"currCategoryView"];
              v116 = v17;
              if (!v17)
              {
LABEL_40:
                uint64_t v29 = [v6 objectForKeyedSubscript:@"reasonCodes"];
                v114 = (void *)v29;
                if (v29 && (int v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (!v125)
                    {
                      id v115 = 0;
                      int v23 = 0;
                      v52 = v117;
                      a4 = v122;
                      id v10 = v128;
                      goto LABEL_99;
                    }
                    id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
                    id v79 = v17;
                    uint64_t v80 = *MEMORY[0x1E4F502C8];
                    uint64_t v139 = *MEMORY[0x1E4F28568];
                    id v113 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"reasonCodes"];
                    id v140 = v113;
                    uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
                    v82 = v78;
                    id v10 = v128;
                    uint64_t v83 = v80;
                    id v17 = v79;
                    v110 = (void *)v81;
                    int v23 = 0;
                    id v115 = 0;
                    id *v125 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v83, 2);
                    goto LABEL_111;
                  }
                  id v115 = v30;
                }
                else
                {
                  id v115 = 0;
                }
                uint64_t v31 = [v6 objectForKeyedSubscript:@"receiveTimestamp"];
                id v10 = v128;
                id v112 = v17;
                v110 = (void *)v31;
                if (!v31 || (id v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v113 = 0;
LABEL_46:
                  uint64_t v33 = [v6 objectForKeyedSubscript:@"isAllInboxesCategoriesEnabled"];
                  v109 = (void *)v33;
                  if (v33 && (id v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (!v125)
                      {
                        id v111 = 0;
                        int v23 = 0;
                        a4 = v122;
                        goto LABEL_96;
                      }
                      v93 = v12;
                      id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v95 = *MEMORY[0x1E4F502C8];
                      uint64_t v135 = *MEMORY[0x1E4F28568];
                      id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isAllInboxesCategoriesEnabled"];
                      id v136 = v36;
                      id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
                      v96 = v94;
                      uint64_t v12 = v93;
                      id v97 = (id)[v96 initWithDomain:v95 code:2 userInfo:v35];
                      int v23 = 0;
                      id v111 = 0;
                      id *v125 = v97;
                      goto LABEL_114;
                    }
                    id v111 = v34;
                  }
                  else
                  {
                    id v111 = 0;
                  }
                  id v35 = [v6 objectForKeyedSubscript:@"isMailAccountPersonalAccount"];
                  v108 = v12;
                  if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v36 = 0;
                    goto LABEL_52;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v36 = v35;
LABEL_52:
                    v37 = [v6 objectForKeyedSubscript:@"isMailAccountCategoriesEnabled"];
                    if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v38 = 0;
LABEL_55:
                      a4 = v122;
                      int v23 = [(BMMailCategorizationAnalyticsReceive *)v129 initWithAccountId:v124 messageId:v128 senderId:v130 receivingAccountDomain:v122 metadataPrimaryKey:v120 predictedCategory:v123 currCategoryView:v112 reasonCodes:v115 receiveTimestamp:v113 isAllInboxesCategoriesEnabled:v111 isMailAccountPersonalAccount:v36 isMailAccountCategoriesEnabled:v38];
                      v129 = v23;
LABEL_94:

                      uint64_t v12 = v108;
LABEL_95:

                      id v10 = v128;
LABEL_96:
                      v52 = v117;
                      v92 = v109;
                      goto LABEL_97;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v38 = v37;
                      goto LABEL_55;
                    }
                    if (v125)
                    {
                      id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v107 = *MEMORY[0x1E4F502C8];
                      uint64_t v131 = *MEMORY[0x1E4F28568];
                      v101 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isMailAccountCategoriesEnabled"];
                      v132 = v101;
                      v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
                      id *v125 = (id)[v119 initWithDomain:v107 code:2 userInfo:v102];
                    }
                    id v38 = 0;
                    int v23 = 0;
LABEL_93:
                    a4 = v122;
                    goto LABEL_94;
                  }
                  if (v125)
                  {
                    id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v99 = *MEMORY[0x1E4F502C8];
                    uint64_t v133 = *MEMORY[0x1E4F28568];
                    id v38 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isMailAccountPersonalAccount"];
                    id v134 = v38;
                    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
                    id v100 = (id)[v98 initWithDomain:v99 code:2 userInfo:v37];
                    int v23 = 0;
                    id v36 = 0;
                    id *v125 = v100;
                    goto LABEL_93;
                  }
                  id v36 = 0;
                  int v23 = 0;
LABEL_114:
                  a4 = v122;
                  goto LABEL_95;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v113 = v32;
                  goto LABEL_46;
                }
                if (v125)
                {
                  id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v85 = *MEMORY[0x1E4F502C8];
                  uint64_t v137 = *MEMORY[0x1E4F28568];
                  v86 = v12;
                  id v87 = [NSString alloc];
                  uint64_t v106 = objc_opt_class();
                  v88 = v87;
                  uint64_t v12 = v86;
                  id v111 = (id)[v88 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v106, @"receiveTimestamp"];
                  id v138 = v111;
                  uint64_t v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
                  v90 = v84;
                  id v10 = v128;
                  uint64_t v91 = v85;
                  v92 = (void *)v89;
                  int v23 = 0;
                  id v113 = 0;
                  id *v125 = (id)[v90 initWithDomain:v91 code:2 userInfo:v89];
                  v52 = v117;
                  a4 = v122;
LABEL_97:

                  id v17 = v112;
LABEL_98:

                  goto LABEL_99;
                }
                id v113 = 0;
                int v23 = 0;
LABEL_111:
                a4 = v122;
                v52 = v117;
                goto LABEL_98;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v17 = 0;
                goto LABEL_40;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v17 = v17;
                goto LABEL_40;
              }
              if (v125)
              {
                id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v71 = *MEMORY[0x1E4F502C8];
                uint64_t v141 = *MEMORY[0x1E4F28568];
                v72 = v12;
                id v73 = [NSString alloc];
                uint64_t v105 = objc_opt_class();
                v74 = v73;
                uint64_t v12 = v72;
                id v115 = (id)[v74 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v105, @"currCategoryView"];
                id v142 = v115;
                uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
                v76 = v70;
                id v10 = v128;
                v114 = (void *)v75;
                id v77 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v71, 2);
                int v23 = 0;
                id v17 = 0;
                id *v125 = v77;
                v52 = v117;
                a4 = v122;
LABEL_99:

LABEL_100:
                id v14 = v120;
                goto LABEL_101;
              }
              id v17 = 0;
              int v23 = 0;
LABEL_108:
              a4 = v122;
              v52 = v117;
              goto LABEL_100;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v123 = v16;
              goto LABEL_19;
            }
            if (v125)
            {
              id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v62 = *MEMORY[0x1E4F502C8];
              uint64_t v143 = *MEMORY[0x1E4F28568];
              v63 = v12;
              id v64 = [NSString alloc];
              uint64_t v104 = objc_opt_class();
              v65 = v64;
              uint64_t v12 = v63;
              uint64_t v66 = [v65 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v104, @"predictedCategory"];
              uint64_t v144 = v66;
              uint64_t v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
              v68 = v61;
              id v10 = v128;
              uint64_t v69 = v62;
              id v17 = (id)v66;
              v116 = (void *)v67;
              int v23 = 0;
              id v123 = 0;
              id *v125 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, 2);
              goto LABEL_108;
            }
            id v123 = 0;
            int v23 = 0;
            a4 = v122;
            v52 = v117;
LABEL_101:

            goto LABEL_102;
          }
          v55 = v13;
          if (v125)
          {
            id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v57 = *MEMORY[0x1E4F502C8];
            uint64_t v145 = *MEMORY[0x1E4F28568];
            v52 = v13;
            id v123 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"metadataPrimaryKey"];
            id v146 = v123;
            uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
            v59 = v56;
            id v10 = v128;
            v121 = (void *)v58;
            id v60 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v57, 2);
            int v23 = 0;
            id v14 = 0;
            id *v125 = v60;
            a4 = v122;
            goto LABEL_101;
          }
          int v23 = 0;
          a4 = v122;
          v52 = v55;
          id v14 = 0;
LABEL_102:

          id v8 = v124;
          goto LABEL_103;
        }
        if (a4)
        {
          id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v47 = *MEMORY[0x1E4F502C8];
          uint64_t v147 = *MEMORY[0x1E4F28568];
          v118 = v7;
          v48 = v9;
          v49 = v11;
          v50 = a4;
          uint64_t v51 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"receivingAccountDomain"];
          uint64_t v148 = v51;
          v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
          v53 = v46;
          id v10 = v128;
          uint64_t v54 = v47;
          id v14 = (id)v51;
          int v23 = 0;
          a4 = 0;
          id *v50 = (id)[v53 initWithDomain:v54 code:2 userInfo:v52];
          uint64_t v11 = v49;
          uint64_t v9 = v48;
          id v7 = v118;
          goto LABEL_102;
        }
        int v23 = 0;
LABEL_103:

        self = v129;
        goto LABEL_104;
      }
      if (a4)
      {
        v127 = a4;
        id v39 = v10;
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v41 = v8;
        uint64_t v42 = *MEMORY[0x1E4F502C8];
        uint64_t v149 = *MEMORY[0x1E4F28568];
        v43 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"senderId"];
        v150 = v43;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
        v44 = v40;
        id v10 = v39;
        a4 = v43;
        uint64_t v45 = v42;
        id v8 = v41;
        int v23 = 0;
        id v130 = 0;
        id *v127 = (id)[v44 initWithDomain:v45 code:2 userInfo:v12];
        goto LABEL_103;
      }
      id v130 = 0;
      int v23 = 0;
LABEL_104:

      goto LABEL_105;
    }
    if (a4)
    {
      id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
      v126 = a4;
      id v25 = v8;
      uint64_t v26 = *MEMORY[0x1E4F502C8];
      uint64_t v151 = *MEMORY[0x1E4F28568];
      id v130 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"messageId"];
      id v152 = v130;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
      uint64_t v27 = v26;
      id v8 = v25;
      id v28 = (id)[v24 initWithDomain:v27 code:2 userInfo:v11];
      int v23 = 0;
      id v10 = 0;
      id *v126 = v28;
      goto LABEL_104;
    }
    id v10 = 0;
    int v23 = 0;
LABEL_105:

    goto LABEL_106;
  }
  if (a4)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = *MEMORY[0x1E4F502C8];
    uint64_t v153 = *MEMORY[0x1E4F28568];
    uint64_t v20 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accountId"];
    v154[0] = v20;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v154 forKeys:&v153 count:1];
    int v21 = v18;
    id v10 = (id)v20;
    id v22 = (id)[v21 initWithDomain:v19 code:2 userInfo:v9];
    int v23 = 0;
    id v8 = 0;
    *a4 = v22;
    goto LABEL_105;
  }
  int v23 = 0;
  id v8 = 0;
LABEL_106:

  return v23;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMailCategorizationAnalyticsReceive *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_accountId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasMessageId)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSenderId)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasReceivingAccountDomain)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_metadataPrimaryKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasPredictedCategory)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCurrCategoryView)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_reasonCodes)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasReceiveTimestamp)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasIsAllInboxesCategoriesEnabled)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsMailAccountPersonalAccount)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsMailAccountCategoriesEnabled)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)BMMailCategorizationAnalyticsReceive;
  id v5 = [(BMEventBase *)&v76 init];
  if (!v5) {
    goto LABEL_130;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
          goto LABEL_60;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          v5->_hasMessageId = 1;
          while (2)
          {
            uint64_t v24 = *v6;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
              *(void *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_92:
          uint64_t v71 = 32;
          goto LABEL_113;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          v5->_hasSenderId = 1;
          while (2)
          {
            uint64_t v29 = *v6;
            unint64_t v30 = *(void *)&v4[v29];
            if (v30 == -1 || v30 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
              *(void *)&v4[v29] = v30 + 1;
              v23 |= (unint64_t)(v31 & 0x7F) << v27;
              if (v31 < 0)
              {
                v27 += 7;
                BOOL v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_96:
          uint64_t v71 = 36;
          goto LABEL_113;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v23 = 0;
          v5->_hasReceivingAccountDomain = 1;
          while (2)
          {
            uint64_t v34 = *v6;
            unint64_t v35 = *(void *)&v4[v34];
            if (v35 == -1 || v35 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
              *(void *)&v4[v34] = v35 + 1;
              v23 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                BOOL v16 = v33++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_100:
          uint64_t v71 = 40;
          goto LABEL_113;
        case 5u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 64;
          goto LABEL_60;
        case 6u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v23 = 0;
          v5->_hasPredictedCategory = 1;
          while (2)
          {
            uint64_t v39 = *v6;
            unint64_t v40 = *(void *)&v4[v39];
            if (v40 == -1 || v40 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
              *(void *)&v4[v39] = v40 + 1;
              v23 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                BOOL v16 = v38++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_104;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_104:
          uint64_t v71 = 44;
          goto LABEL_113;
        case 7u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v23 = 0;
          v5->_hasCurrCategoryView = 1;
          while (2)
          {
            uint64_t v44 = *v6;
            unint64_t v45 = *(void *)&v4[v44];
            if (v45 == -1 || v45 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)&v4[*v9] + v45);
              *(void *)&v4[v44] = v45 + 1;
              v23 |= (unint64_t)(v46 & 0x7F) << v42;
              if (v46 < 0)
              {
                v42 += 7;
                BOOL v16 = v43++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_108:
          uint64_t v71 = 48;
          goto LABEL_113;
        case 8u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 72;
LABEL_60:
          uint64_t v47 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 9u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v23 = 0;
          v5->_hasReceiveTimestamp = 1;
          while (2)
          {
            uint64_t v50 = *v6;
            unint64_t v51 = *(void *)&v4[v50];
            if (v51 == -1 || v51 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v52 = *(unsigned char *)(*(void *)&v4[*v9] + v51);
              *(void *)&v4[v50] = v51 + 1;
              v23 |= (unint64_t)(v52 & 0x7F) << v48;
              if (v52 < 0)
              {
                v48 += 7;
                BOOL v16 = v49++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_112:
          uint64_t v71 = 52;
LABEL_113:
          *(_DWORD *)((char *)&v5->super.super.isa + v71) = v23;
          continue;
        case 0xAu:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v55 = 0;
          v5->_hasIsAllInboxesCategoriesEnabled = 1;
          while (2)
          {
            uint64_t v56 = *v6;
            unint64_t v57 = *(void *)&v4[v56];
            if (v57 == -1 || v57 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)&v4[*v9] + v57);
              *(void *)&v4[v56] = v57 + 1;
              v55 |= (unint64_t)(v58 & 0x7F) << v53;
              if (v58 < 0)
              {
                v53 += 7;
                BOOL v16 = v54++ >= 9;
                if (v16)
                {
                  uint64_t v55 = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v55 = 0;
          }
LABEL_117:
          BOOL v72 = v55 != 0;
          uint64_t v73 = 22;
          goto LABEL_126;
        case 0xBu:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v61 = 0;
          v5->_hasIsMailAccountPersonalAccount = 1;
          while (2)
          {
            uint64_t v62 = *v6;
            unint64_t v63 = *(void *)&v4[v62];
            if (v63 == -1 || v63 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)&v4[*v9] + v63);
              *(void *)&v4[v62] = v63 + 1;
              v61 |= (unint64_t)(v64 & 0x7F) << v59;
              if (v64 < 0)
              {
                v59 += 7;
                BOOL v16 = v60++ >= 9;
                if (v16)
                {
                  uint64_t v61 = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v61 = 0;
          }
LABEL_121:
          BOOL v72 = v61 != 0;
          uint64_t v73 = 24;
          goto LABEL_126;
        case 0xCu:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          v5->_hasIsMailAccountCategoriesEnabled = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_129;
          }
          continue;
      }
      while (1)
      {
        uint64_t v68 = *v6;
        unint64_t v69 = *(void *)&v4[v68];
        if (v69 == -1 || v69 >= *(void *)&v4[*v7]) {
          break;
        }
        char v70 = *(unsigned char *)(*(void *)&v4[*v9] + v69);
        *(void *)&v4[v68] = v69 + 1;
        v67 |= (unint64_t)(v70 & 0x7F) << v65;
        if ((v70 & 0x80) == 0) {
          goto LABEL_123;
        }
        v65 += 7;
        BOOL v16 = v66++ >= 9;
        if (v16)
        {
          uint64_t v67 = 0;
          goto LABEL_125;
        }
      }
      v4[*v8] = 1;
LABEL_123:
      if (v4[*v8]) {
        uint64_t v67 = 0;
      }
LABEL_125:
      BOOL v72 = v67 != 0;
      uint64_t v73 = 26;
LABEL_126:
      *((unsigned char *)&v5->super.super.isa + v73) = v72;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_129:
  }
    v74 = 0;
  else {
LABEL_130:
  }
    v74 = v5;

  return v74;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v13 = [(BMMailCategorizationAnalyticsReceive *)self accountId];
  int v17 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive messageId](self, "messageId"));
  BOOL v16 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive senderId](self, "senderId"));
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive receivingAccountDomain](self, "receivingAccountDomain"));
  id v4 = [(BMMailCategorizationAnalyticsReceive *)self metadataPrimaryKey];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive predictedCategory](self, "predictedCategory"));
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive currCategoryView](self, "currCategoryView"));
  id v7 = [(BMMailCategorizationAnalyticsReceive *)self reasonCodes];
  id v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsReceive receiveTimestamp](self, "receiveTimestamp"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorizationAnalyticsReceive isAllInboxesCategoriesEnabled](self, "isAllInboxesCategoriesEnabled"));
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorizationAnalyticsReceive isMailAccountPersonalAccount](self, "isMailAccountPersonalAccount"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorizationAnalyticsReceive isMailAccountCategoriesEnabled](self, "isMailAccountCategoriesEnabled"));
  id v15 = (id)[v14 initWithFormat:@"BMMailCategorizationAnalyticsReceive with accountId: %@, messageId: %@, senderId: %@, receivingAccountDomain: %@, metadataPrimaryKey: %@, predictedCategory: %@, currCategoryView: %@, reasonCodes: %@, receiveTimestamp: %@, isAllInboxesCategoriesEnabled: %@, isMailAccountPersonalAccount: %@, isMailAccountCategoriesEnabled: %@", v13, v17, v16, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v15;
}

- (BMMailCategorizationAnalyticsReceive)initWithAccountId:(id)a3 messageId:(id)a4 senderId:(id)a5 receivingAccountDomain:(id)a6 metadataPrimaryKey:(id)a7 predictedCategory:(id)a8 currCategoryView:(id)a9 reasonCodes:(id)a10 receiveTimestamp:(id)a11 isAllInboxesCategoriesEnabled:(id)a12 isMailAccountPersonalAccount:(id)a13 isMailAccountCategoriesEnabled:(id)a14
{
  id v41 = a3;
  id v19 = a4;
  id v20 = a5;
  id v42 = a6;
  id v21 = a7;
  id v40 = a7;
  id v22 = a8;
  id v23 = a9;
  id v39 = a10;
  uint64_t v24 = v20;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  v43.receiver = self;
  v43.super_class = (Class)BMMailCategorizationAnalyticsReceive;
  uint64_t v29 = [(BMEventBase *)&v43 init];
  if (v29)
  {
    v29->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v29->_accountId, a3);
    if (v19)
    {
      v29->_hasMessageId = 1;
      int v30 = [v19 intValue];
    }
    else
    {
      v29->_hasMessageId = 0;
      int v30 = -1;
    }
    v29->_messageId = v30;
    if (v24)
    {
      v29->_hasSenderId = 1;
      int v31 = [v24 intValue];
    }
    else
    {
      v29->_hasSenderId = 0;
      int v31 = -1;
    }
    v29->_senderId = v31;
    if (v42)
    {
      v29->_hasReceivingAccountDomain = 1;
      int v32 = [v42 intValue];
    }
    else
    {
      v29->_hasReceivingAccountDomain = 0;
      int v32 = -1;
    }
    v29->_receivingAccountDomain = v32;
    objc_storeStrong((id *)&v29->_metadataPrimaryKey, v21);
    if (v22)
    {
      v29->_hasPredictedCategory = 1;
      int v33 = [v22 intValue];
    }
    else
    {
      v29->_hasPredictedCategory = 0;
      int v33 = -1;
    }
    v29->_predictedCategory = v33;
    if (v23)
    {
      v29->_hasCurrCategoryView = 1;
      int v34 = [v23 intValue];
    }
    else
    {
      v29->_hasCurrCategoryView = 0;
      int v34 = -1;
    }
    v29->_currCategoryView = v34;
    objc_storeStrong((id *)&v29->_reasonCodes, a10);
    if (v25)
    {
      v29->_hasReceiveTimestamp = 1;
      int v35 = [v25 intValue];
    }
    else
    {
      v29->_hasReceiveTimestamp = 0;
      int v35 = -1;
    }
    v29->_receiveTimestamp = v35;
    if (v26)
    {
      v29->_hasIsAllInboxesCategoriesEnabled = 1;
      v29->_isAllInboxesCategoriesEnabled = [v26 BOOLValue];
    }
    else
    {
      v29->_hasIsAllInboxesCategoriesEnabled = 0;
      v29->_isAllInboxesCategoriesEnabled = 0;
    }
    if (v27)
    {
      v29->_hasIsMailAccountPersonalAccount = 1;
      v29->_isMailAccountPersonalAccount = [v27 BOOLValue];
    }
    else
    {
      v29->_hasIsMailAccountPersonalAccount = 0;
      v29->_isMailAccountPersonalAccount = 0;
    }
    if (v28)
    {
      v29->_hasIsMailAccountCategoriesEnabled = 1;
      v29->_isMailAccountCategoriesEnabled = [v28 BOOLValue];
    }
    else
    {
      v29->_hasIsMailAccountCategoriesEnabled = 0;
      v29->_isMailAccountCategoriesEnabled = 0;
    }
  }

  return v29;
}

+ (id)protoFields
{
  v16[12] = *MEMORY[0x1E4F143B8];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accountId" number:1 type:13 subMessageClass:0];
  v16[0] = v15;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageId" number:2 type:2 subMessageClass:0];
  v16[1] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"senderId" number:3 type:2 subMessageClass:0];
  v16[2] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"receivingAccountDomain" number:4 type:2 subMessageClass:0];
  v16[3] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"metadataPrimaryKey" number:5 type:13 subMessageClass:0];
  v16[4] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"predictedCategory" number:6 type:2 subMessageClass:0];
  v16[5] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"currCategoryView" number:7 type:2 subMessageClass:0];
  v16[6] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reasonCodes" number:8 type:13 subMessageClass:0];
  v16[7] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"receiveTimestamp" number:9 type:2 subMessageClass:0];
  v16[8] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAllInboxesCategoriesEnabled" number:10 type:12 subMessageClass:0];
  v16[9] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMailAccountPersonalAccount" number:11 type:12 subMessageClass:0];
  v16[10] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMailAccountCategoriesEnabled" number:12 type:12 subMessageClass:0];
  v16[11] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7620;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMailCategorizationAnalyticsReceive alloc] initByReadFrom:v7];
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