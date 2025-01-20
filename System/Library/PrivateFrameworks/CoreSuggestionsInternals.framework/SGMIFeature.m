@interface SGMIFeature
+ (id)allFeatureNames;
+ (id)allFeaturePrettyNames;
+ (id)prettyName:(int64_t)a3;
+ (id)prettyNamesReverseMapping;
+ (id)submodeledFeatures;
+ (int64_t)featureTypeForName:(int64_t)a3;
- (BOOL)BOOLValue;
- (NSArray)numberArrayValue;
- (NSArray)stringArrayValue;
- (NSNumber)numberValue;
- (NSString)stringValue;
- (SGMIFeature)initWithFeatureName:(int64_t)a3;
- (SGMIFeature)initWithFeatureName:(int64_t)a3 numberArrayValue:(id)a4;
- (SGMIFeature)initWithFeatureName:(int64_t)a3 numberValue:(id)a4;
- (SGMIFeature)initWithFeatureName:(int64_t)a3 stringArrayValue:(id)a4;
- (SGMIFeature)initWithFeatureName:(int64_t)a3 stringValue:(id)a4;
- (double)doubleValue;
- (float)floatValue;
- (id)description;
- (id)stringArrayRepresentation;
- (int)intValue;
- (int64_t)featureName;
- (int64_t)featureType;
- (int64_t)integerValue;
@end

@implementation SGMIFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringArrayValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_numberArrayValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
}

- (NSArray)stringArrayValue
{
  return self->_stringArrayValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSArray)numberArrayValue
{
  return self->_numberArrayValue;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (int64_t)featureType
{
  return self->_featureType;
}

- (int64_t)featureName
{
  return self->_featureName;
}

- (int64_t)integerValue
{
  v3 = [(SGMIFeature *)self numberValue];

  if (!v3)
  {
    v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "Error accessing integerValue. numberValue is nil", v8, 2u);
    }
  }
  v5 = [(SGMIFeature *)self numberValue];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (int)intValue
{
  v3 = [(SGMIFeature *)self numberValue];

  if (!v3)
  {
    v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "Error accessing intValue. numberValue is nil", v8, 2u);
    }
  }
  v5 = [(SGMIFeature *)self numberValue];
  int v6 = [v5 intValue];

  return v6;
}

- (double)doubleValue
{
  v3 = [(SGMIFeature *)self numberValue];

  if (!v3)
  {
    v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "Error accessing doubleValue. numberValue is nil", v9, 2u);
    }
  }
  v5 = [(SGMIFeature *)self numberValue];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (float)floatValue
{
  v3 = [(SGMIFeature *)self numberValue];

  if (!v3)
  {
    v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "Error accessing floatValue. numberValue is nil", v9, 2u);
    }
  }
  v5 = [(SGMIFeature *)self numberValue];
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (BOOL)BOOLValue
{
  v3 = [(SGMIFeature *)self numberValue];

  if (!v3)
  {
    v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "Error accessing BOOLValue. numberValue is nil", v8, 2u);
    }
  }
  v5 = [(SGMIFeature *)self numberValue];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (id)description
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  switch([(SGMIFeature *)self featureType])
  {
    case 0:
      v3 = @"None";
      break;
    case 1:
      v4 = [(SGMIFeature *)self numberValue];
      v3 = [v4 stringValue];
      goto LABEL_13;
    case 2:
      v4 = objc_opt_new();
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v5 = [(SGMIFeature *)self numberArrayValue];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = [*(id *)(*((void *)&v20 + 1) + 8 * i) stringValue];
            [v4 addObject:v10];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v7);
      }

      id v11 = [NSString alloc];
      v12 = objc_msgSend(v4, "_pas_componentsJoinedByString:", @", ");
      v3 = (__CFString *)[v11 initWithFormat:@"[%@]", v12];

LABEL_13:
      break;
    case 3:
      v3 = [(SGMIFeature *)self stringValue];
      break;
    case 4:
      id v13 = [NSString alloc];
      v14 = [(SGMIFeature *)self stringArrayValue];
      v15 = objc_msgSend(v14, "_pas_componentsJoinedByString:", @", ");
      v3 = (__CFString *)[v13 initWithFormat:@"[%@]", v15];

      break;
    default:
      v3 = 0;
      break;
  }
  id v16 = [NSString alloc];
  v17 = +[SGMIFeature prettyName:[(SGMIFeature *)self featureName]];
  v18 = (void *)[v16 initWithFormat:@"%@: %@", v17, v3];

  return v18;
}

- (id)stringArrayRepresentation
{
  v10[1] = *MEMORY[0x1E4F143B8];
  switch([(SGMIFeature *)self featureType])
  {
    case 1:
      v3 = [(SGMIFeature *)self numberValue];
      v4 = [v3 stringValue];
      v10[0] = v4;
      v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

      goto LABEL_7;
    case 2:
      v3 = [(SGMIFeature *)self numberArrayValue];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __40__SGMIFeature_stringArrayRepresentation__block_invoke;
      v8[3] = &unk_1E65B90A0;
      v8[4] = self;
      uint64_t v6 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v8);
      goto LABEL_6;
    case 3:
      v3 = [(SGMIFeature *)self stringValue];
      v9 = v3;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
LABEL_6:
      v5 = (void *)v6;
LABEL_7:

      break;
    case 4:
      v5 = [(SGMIFeature *)self stringArrayValue];
      break;
    default:
      v5 = (void *)MEMORY[0x1E4F1CBF0];
      break;
  }
  return v5;
}

uint64_t __40__SGMIFeature_stringArrayRepresentation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stringValue];
}

- (SGMIFeature)initWithFeatureName:(int64_t)a3 stringArrayValue:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(SGMIFeature *)self initWithFeatureName:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_stringArrayValue, a4);
  }

  return v9;
}

- (SGMIFeature)initWithFeatureName:(int64_t)a3 stringValue:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(SGMIFeature *)self initWithFeatureName:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_stringValue, a4);
  }

  return v9;
}

- (SGMIFeature)initWithFeatureName:(int64_t)a3 numberArrayValue:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(SGMIFeature *)self initWithFeatureName:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_numberArrayValue, a4);
  }

  return v9;
}

- (SGMIFeature)initWithFeatureName:(int64_t)a3 numberValue:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(SGMIFeature *)self initWithFeatureName:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_numberValue, a4);
  }

  return v9;
}

- (SGMIFeature)initWithFeatureName:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SGMIFeature;
  v4 = [(SGMIFeature *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_featureName = a3;
    v4->_featureType = +[SGMIFeature featureTypeForName:a3];
  }
  return v5;
}

+ (id)prettyNamesReverseMapping
{
  if (prettyNamesReverseMapping__pasOnceToken3 != -1) {
    dispatch_once(&prettyNamesReverseMapping__pasOnceToken3, &__block_literal_global_262_19769);
  }
  v2 = (void *)prettyNamesReverseMapping__pasExprOnceResult;
  return v2;
}

void __40__SGMIFeature_prettyNamesReverseMapping__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  v1 = objc_opt_new();
  v2 = +[SGMIFeature allFeatureNames];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__SGMIFeature_prettyNamesReverseMapping__block_invoke_2;
  v6[3] = &unk_1E65B9078;
  id v7 = v1;
  id v3 = v1;
  [v2 enumerateObjectsUsingBlock:v6];

  uint64_t v4 = [v3 copy];
  v5 = (void *)prettyNamesReverseMapping__pasExprOnceResult;
  prettyNamesReverseMapping__pasExprOnceResult = v4;
}

void __40__SGMIFeature_prettyNamesReverseMapping__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[v3 intValue]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v3 forKeyedSubscript:v4];
}

+ (id)allFeaturePrettyNames
{
  v2 = +[SGMIFeature allFeatureNames];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_260_19773);

  return v3;
}

id __36__SGMIFeature_allFeaturePrettyNames__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (int)[a2 intValue];
  return +[SGMIFeature prettyName:v2];
}

+ (id)allFeatureNames
{
  return &unk_1F2536A40;
}

+ (id)prettyName:(int64_t)a3
{
  id result = @"None";
  if (a3 <= 1999)
  {
    if ((unint64_t)a3 <= 0x7CF)
    {
      switch(a3)
      {
        case 1000:
          id result = @"PersonFromSenderProbability";
          break;
        case 1001:
          id result = @"PersonToRecipientsProbability";
          break;
        case 1002:
          id result = @"PersonCCRecipientsProbability";
          break;
        case 1003:
          id result = @"SubjectContentProbability";
          break;
        case 1004:
          id result = @"DomainFromSenderProbability";
          break;
        case 1005:
          id result = @"PersonFromSenderInDyadicConversationProbability";
          break;
        case 1006:
          id result = @"AttachmentHistogramProbability";
          break;
        case 1007:
          id result = @"ListIdProbability";
          break;
        case 1008:
          id result = @"ConversationIdProbability";
          break;
        default:
          JUMPOUT(0);
      }
    }
    else
    {
      switch(a3)
      {
        case 1:
          id result = @"SubjectLength";
          break;
        case 2:
          id result = @"SubjectWordCount";
          break;
        case 3:
          id result = @"SenderIsVIP";
          break;
        case 4:
          id result = @"AttachmentHistogramMedia";
          break;
        case 5:
          id result = @"AttachmentHistogramApplication";
          break;
        case 6:
          id result = @"AttachmentHistogramOthers";
          break;
        case 7:
          id result = @"SenderConnectionScore";
          break;
        case 8:
          id result = @"EmailAgeInDays";
          break;
        default:
          return result;
      }
    }
  }
  else if (a3 <= 2999)
  {
    switch(a3)
    {
      case 2000:
        id result = @"PrivateSubject";
        break;
      case 2001:
        id result = @"PrivateTokenizedSubject";
        break;
      case 2002:
      case 2008:
      case 2009:
      case 2013:
      case 2014:
        return result;
      case 2003:
        id result = @"PrivateSenderFrom";
        break;
      case 2004:
        id result = @"PrivateSortedToRecipients";
        break;
      case 2005:
        id result = @"PrivateToRecipientsPairs";
        break;
      case 2006:
        id result = @"PrivateSortedCCRecipients";
        break;
      case 2007:
        id result = @"PrivateCCRecipientsPairs";
        break;
      case 2010:
        id result = @"SenderFullEmailDomain";
        break;
      case 2011:
        id result = @"PrivateSenderFromInDyadicConversation";
        break;
      case 2012:
        id result = @"PrivateAttachmentHistogram";
        break;
      case 2015:
        id result = @"PrivateListId";
        break;
      case 2016:
        id result = @"PrivateConversationId";
        break;
      default:
        id v4 = @"PrivateHTMLBodyTextContentLanguageIdentifier";
        if (a3 != 2102) {
          id v4 = @"None";
        }
        if (a3 == 2101) {
          id result = @"PrivateHTMLBodyTextContent";
        }
        else {
          id result = v4;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 3000:
        id result = @"ScrolledToEnd";
        break;
      case 3001:
        id result = @"UserReplied";
        break;
      case 3002:
        id result = @"NumberOfMailsViewedBeforeSinceAvailable";
        break;
      case 3003:
        id result = @"TimeBeforeViewStartSinceAvailable";
        break;
      case 3004:
        id result = @"MessageViewCount";
        break;
      case 3005:
        id result = @"MessageViewMaxDwellTime";
        break;
      case 3006:
        id result = @"MessageViewTotalDwellTime";
        break;
      case 3007:
        id result = @"NumberOfUnreadMessageAtFirstViewTime";
        break;
      case 3008:
        id result = @"NumberOfMoreRecentUnreadMessageAtFirstViewTime";
        break;
      case 3009:
        id result = @"MarkedAsRead";
        break;
      case 3010:
        id result = @"MarkedAsUnread";
        break;
      case 3011:
        id result = @"MailGotFlagged";
        break;
      case 3012:
        id result = @"ReplyDraftStarted";
        break;
      case 3013:
        id result = @"ForwardDraftStarted";
        break;
      case 3014:
        id result = @"MarkedAsJunk";
        break;
      case 3015:
        id result = @"LinkClicked";
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (id)submodeledFeatures
{
  if (submodeledFeatures__pasOnceToken2 != -1) {
    dispatch_once(&submodeledFeatures__pasOnceToken2, &__block_literal_global_19927);
  }
  uint64_t v2 = (void *)submodeledFeatures__pasExprOnceResult;
  return v2;
}

void __33__SGMIFeature_submodeledFeatures__block_invoke()
{
  v12[9] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = [[SGMIFeatureSubmodelLink alloc] initFor:1000 fromUnigram:2003 andBigram:0];
  id v2 = -[SGMIFeatureSubmodelLink initFor:fromUnigram:andBigram:]([SGMIFeatureSubmodelLink alloc], "initFor:fromUnigram:andBigram:", 1004, 2010, 0, v1);
  v12[1] = v2;
  id v3 = [[SGMIFeatureSubmodelLink alloc] initFor:1003 fromUnigram:2001 andBigram:0];
  v12[2] = v3;
  id v4 = [[SGMIFeatureSubmodelLink alloc] initFor:1001 fromUnigram:2004 andBigram:2005];
  v12[3] = v4;
  id v5 = [[SGMIFeatureSubmodelLink alloc] initFor:1002 fromUnigram:2006 andBigram:2007];
  v12[4] = v5;
  id v6 = [[SGMIFeatureSubmodelLink alloc] initFor:1005 fromUnigram:2011 andBigram:0];
  v12[5] = v6;
  id v7 = [[SGMIFeatureSubmodelLink alloc] initFor:1006 fromUnigram:2012 andBigram:0];
  v12[6] = v7;
  id v8 = [[SGMIFeatureSubmodelLink alloc] initFor:1008 fromUnigram:2016 andBigram:0];
  v12[7] = v8;
  id v9 = [[SGMIFeatureSubmodelLink alloc] initFor:1007 fromUnigram:2015 andBigram:0];
  v12[8] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:9];
  id v11 = (void *)submodeledFeatures__pasExprOnceResult;
  submodeledFeatures__pasExprOnceResult = v10;
}

+ (int64_t)featureTypeForName:(int64_t)a3
{
  int64_t result = 0;
  if (a3 <= 1999)
  {
    if ((unint64_t)a3 <= 0x7CF)
    {
      switch(a3)
      {
        case 1000:
        case 1001:
        case 1002:
        case 1003:
        case 1004:
        case 1005:
        case 1006:
        case 1007:
        case 1008:
LABEL_10:
          int64_t result = 1;
          break;
        default:
          JUMPOUT(0);
      }
    }
    else
    {
      switch(a3)
      {
        case 1:
        case 2:
        case 3:
        case 7:
        case 8:
          goto LABEL_10;
        case 4:
        case 5:
        case 6:
          int64_t result = 2;
          break;
        default:
          return result;
      }
    }
  }
  else if (a3 <= 2999)
  {
    switch(a3)
    {
      case 2000:
      case 2003:
      case 2010:
      case 2011:
      case 2015:
      case 2016:
        int64_t result = 3;
        break;
      case 2001:
      case 2004:
      case 2005:
      case 2006:
      case 2007:
      case 2012:
        int64_t result = 4;
        break;
      case 2002:
      case 2008:
      case 2009:
      case 2013:
      case 2014:
        return result;
      default:
        int64_t v4 = 3;
        if (a3 != 2102) {
          int64_t v4 = 0;
        }
        if (a3 == 2101) {
          int64_t result = 3;
        }
        else {
          int64_t result = v4;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 3000:
      case 3001:
      case 3002:
      case 3003:
      case 3004:
      case 3005:
      case 3006:
      case 3007:
      case 3008:
      case 3009:
      case 3010:
      case 3011:
      case 3012:
      case 3013:
      case 3014:
      case 3015:
        goto LABEL_10;
      default:
        return result;
    }
  }
  return result;
}

@end