@interface IAMEvaluator
+ (BOOL)_isMessageWithinDateRange:(id)a3;
+ (BOOL)applicationContext:(id)a3 allowsPresentationForPolicyGroup:(int64_t)a4 withLastDisplayTime:(id)a5;
+ (int64_t)_compareCurrentTimeWithMessageTime:(double)a3;
- (BOOL)_didCacheResourcesForMessageIfRequired:(id)a3;
- (BOOL)_doesPresentationPolicyAllowPresentationOfMessage:(id)a3;
- (BOOL)_evaluateCompoundRule:(id)a3 forMessageEntry:(id)a4;
- (BOOL)_evaluateCondition:(id)a3 forMessageEntry:(id)a4;
- (BOOL)_evaluateRule:(id)a3 forMessageEntry:(id)a4;
- (IAMEvaluator)initWithMessageEntries:(id)a3 metadataEntries:(id)a4 applicationContext:(id)a5 hostBundleIdentifier:(id)a6 messageGroups:(id)a7 lastDisplayTimeForRestrictedPresentationPolicyGroup:(id)a8 lastDisplayTimeForNormalPresentationPolicyGroup:(id)a9;
- (NSArray)messagesCloseToPassing;
- (NSArray)passingMessageEntries;
- (id)_contextPropertyWithName:(id)a3 forMessageGroupIdentifier:(id)a4;
- (id)_contextPropertyWithName:(id)a3 messageBundleIdentifier:(id)a4 conditionBundleIdentifier:(id)a5;
- (id)_valueForCondition:(id)a3 messageBundleIdentifier:(id)a4 messageMetadata:(id)a5;
- (id)computeMessagesCloseToPassingWithProximityThreshold:(unint64_t)a3;
- (id)computePassingMessageEntries;
- (unint64_t)_calculateCompoundRuleProximity:(id)a3 forMessageEntry:(id)a4;
- (unint64_t)_calculateConditionProximity:(id)a3 forMessageEntry:(id)a4;
- (unint64_t)_calculateRuleProximity:(id)a3 forMessageEntry:(id)a4;
- (unint64_t)_messageEntryProximity:(id)a3;
- (void)setMessagesCloseToPassing:(id)a3;
- (void)setPassingMessageEntries:(id)a3;
@end

@implementation IAMEvaluator

- (IAMEvaluator)initWithMessageEntries:(id)a3 metadataEntries:(id)a4 applicationContext:(id)a5 hostBundleIdentifier:(id)a6 messageGroups:(id)a7 lastDisplayTimeForRestrictedPresentationPolicyGroup:(id)a8 lastDisplayTimeForNormalPresentationPolicyGroup:(id)a9
{
  id v29 = a3;
  id v28 = a4;
  id v16 = a5;
  id v27 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v30.receiver = self;
  v30.super_class = (Class)IAMEvaluator;
  v20 = [(IAMEvaluator *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_messageEntries, a3);
    objc_storeWeak((id *)&v21->_applicationContext, v16);
    objc_storeStrong((id *)&v21->_hostBundleIdentifier, a6);
    objc_storeStrong((id *)&v21->_messageGroupsByGroupIdentifier, a7);
    objc_storeStrong((id *)&v21->_metadataEntries, a4);
    uint64_t v22 = [v18 copy];
    lastDisplayTimeForRestrictedPresentationPolicyGroup = v21->_lastDisplayTimeForRestrictedPresentationPolicyGroup;
    v21->_lastDisplayTimeForRestrictedPresentationPolicyGroup = (NSDate *)v22;

    uint64_t v24 = [v19 copy];
    lastDisplayTimeForNormalPresentationPolicyGroup = v21->_lastDisplayTimeForNormalPresentationPolicyGroup;
    v21->_lastDisplayTimeForNormalPresentationPolicyGroup = (NSDate *)v24;
  }
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesCloseToPassing, 0);
  objc_storeStrong((id *)&self->_passingMessageEntries, 0);
  objc_storeStrong((id *)&self->_messageGroupsByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_applicationContext);
  objc_storeStrong((id *)&self->_lastDisplayTimeForNormalPresentationPolicyGroup, 0);
  objc_storeStrong((id *)&self->_lastDisplayTimeForRestrictedPresentationPolicyGroup, 0);
  objc_storeStrong((id *)&self->_metadataEntries, 0);
  objc_storeStrong((id *)&self->_messageEntries, 0);
  objc_storeStrong((id *)&self->_currentProximityMetadata, 0);

  objc_storeStrong((id *)&self->_currentMetadata, 0);
}

- (id)computeMessagesCloseToPassingWithProximityThreshold:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = self->_messageEntries;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (-[IAMEvaluator _messageEntryProximity:](self, "_messageEntryProximity:", v11, (void)v15) >= a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  [(IAMEvaluator *)self setMessagesCloseToPassing:v12];

  v13 = [(IAMEvaluator *)self messagesCloseToPassing];

  return v13;
}

- (void)setMessagesCloseToPassing:(id)a3
{
}

- (NSArray)messagesCloseToPassing
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (id)computePassingMessageEntries
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v24 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v3 = self->_messageEntries;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
        uint64_t v9 = [v8 applicationMessage];
        v10 = [v9 identifier];

        metadataEntries = self->_metadataEntries;
        if (metadataEntries)
        {
          v12 = [(NSDictionary *)metadataEntries objectForKeyedSubscript:v10];
          currentMetadata = self->_currentMetadata;
          self->_currentMetadata = v12;
        }
        if ([(id)objc_opt_class() _isMessageWithinDateRange:v8])
        {
          v14 = [v8 applicationMessage];
          long long v15 = [v14 rule];
          BOOL v16 = [(IAMEvaluator *)self _evaluateRule:v15 forMessageEntry:v8];

          if (!v16) {
            goto LABEL_17;
          }
          if (![(IAMEvaluator *)self _didCacheResourcesForMessageIfRequired:v8])
          {
            long long v17 = IAMLogCategoryDefault();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_16;
            }
            *(_DWORD *)buf = 138543362;
            objc_super v30 = v10;
            long long v18 = v17;
            id v19 = "Message with identifier = %{public}@ cannot be displayed because its resources aren't cached.";
            goto LABEL_15;
          }
          if ([(IAMEvaluator *)self _doesPresentationPolicyAllowPresentationOfMessage:v8])
          {
            [v24 addObject:v8];
            goto LABEL_17;
          }
          long long v17 = IAMLogCategoryDefault();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            objc_super v30 = v10;
            long long v18 = v17;
            id v19 = "Message with identifier = %{public}@ cannot be displayed because of its presentation policy.";
            goto LABEL_15;
          }
        }
        else
        {
          long long v17 = IAMLogCategoryDefault();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            objc_super v30 = v10;
            long long v18 = v17;
            id v19 = "Message with identifier = %{public}@ cannot be displayed because it's not within expected start and end date range.";
LABEL_15:
            _os_log_impl(&dword_2188AF000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
          }
        }
LABEL_16:

LABEL_17:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v20 = [(NSArray *)v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
      uint64_t v5 = v20;
    }
    while (v20);
  }

  v21 = (void *)[v24 copy];
  [(IAMEvaluator *)self setPassingMessageEntries:v21];

  uint64_t v22 = [(IAMEvaluator *)self passingMessageEntries];

  return v22;
}

- (void)setPassingMessageEntries:(id)a3
{
}

- (NSArray)passingMessageEntries
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

+ (BOOL)applicationContext:(id)a3 allowsPresentationForPolicyGroup:(int64_t)a4 withLastDisplayTime:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v7 presentationPolicyForPolicyGroup:a4];
    v10 = (void *)v9;
    BOOL v11 = 1;
    if (v8 && v9)
    {
      id v12 = objc_alloc_init(MEMORY[0x263EFF910]);
      [v12 timeIntervalSinceDate:v8];
      double v14 = v13;
      [v10 minimumIntervalBetweenPresentations];
      BOOL v11 = v14 > v15;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

+ (BOOL)_isMessageWithinDateRange:(id)a3
{
  v3 = [a3 applicationMessage];
  if ([v3 hasStartDate] && (objc_msgSend(v3, "startDate"), v4 > 0.0))
  {
    uint64_t v5 = objc_opt_class();
    [v3 startDate];
    BOOL v6 = objc_msgSend(v5, "_compareCurrentTimeWithMessageTime:") == 1;
  }
  else
  {
    BOOL v6 = 1;
  }
  if ([v3 hasEndDate] && (objc_msgSend(v3, "endDate"), v7 > 0.0))
  {
    id v8 = objc_opt_class();
    [v3 endDate];
    BOOL v9 = objc_msgSend(v8, "_compareCurrentTimeWithMessageTime:") == -1;
  }
  else
  {
    BOOL v9 = 1;
  }
  BOOL v10 = v6 && v9;

  return v10;
}

+ (int64_t)_compareCurrentTimeWithMessageTime:(double)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF910]);
  uint64_t v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:a3];
  int64_t v6 = [v4 compare:v5];

  return v6;
}

- (BOOL)_didCacheResourcesForMessageIfRequired:(id)a3
{
  id v3 = a3;
  id v4 = [v3 applicationMessage];
  if (([v4 hasAssetPrefetchStrategy] & 1) == 0)
  {

    goto LABEL_5;
  }
  uint64_t v5 = [v3 applicationMessage];
  int v6 = [v5 assetPrefetchStrategy];

  if (v6 == 2)
  {
LABEL_5:
    char v7 = 1;
    goto LABEL_6;
  }
  char v7 = [v3 didCacheRequiredResources];
LABEL_6:

  return v7;
}

- (BOOL)_doesPresentationPolicyAllowPresentationOfMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 applicationMessage];
  int v6 = [v5 hasGlobalPresentationPolicyGroup];

  if (v6)
  {
    char v7 = [v4 applicationMessage];
    uint64_t v8 = [v7 globalPresentationPolicyGroup];

    uint64_t v9 = [MEMORY[0x263F4B618] presentationPolicyGroupForGlobalPresentationPolicyGroup:v8];
    if (v8 == 1)
    {
      uint64_t v10 = 40;
    }
    else
    {
      if (v8)
      {
        id v12 = 0;
        goto LABEL_9;
      }
      uint64_t v10 = 48;
    }
    id v12 = *(id *)((char *)&self->super.isa + v10);
LABEL_9:
    double v13 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationContext);
    char v11 = [v13 applicationContext:WeakRetained allowsPresentationForPolicyGroup:v9 withLastDisplayTime:v12];

    goto LABEL_10;
  }
  char v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)_evaluateRule:(id)a3 forMessageEntry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    goto LABEL_10;
  }
  if ([v7 hasRequiredApplicationContextBundleIdentifier])
  {
    uint64_t v4 = [v7 requiredApplicationContextBundleIdentifier];
    int v9 = [(id)v4 isEqualToString:self->_hostBundleIdentifier];

    if (!v9)
    {
      LOBYTE(v4) = 0;
      goto LABEL_13;
    }
  }
  uint64_t v10 = [v7 triggerCondition];
  if (v10)
  {

    goto LABEL_7;
  }
  uint64_t v4 = [v7 subrules];

  if (!v4)
  {
LABEL_10:
    LOBYTE(v4) = 1;
    goto LABEL_13;
  }
LABEL_7:
  int v11 = [v7 type];
  if (v11 == 1)
  {
    LOBYTE(v4) = [(IAMEvaluator *)self _evaluateCompoundRule:v7 forMessageEntry:v8];
  }
  else if (!v11)
  {
    id v12 = [v7 triggerCondition];
    LOBYTE(v4) = [(IAMEvaluator *)self _evaluateCondition:v12 forMessageEntry:v8];
  }
LABEL_13:

  return v4 & 1;
}

- (BOOL)_evaluateCompoundRule:(id)a3 forMessageEntry:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v9 = [v6 subrules];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = objc_msgSend(NSNumber, "numberWithBool:", -[IAMEvaluator _evaluateRule:forMessageEntry:](self, "_evaluateRule:forMessageEntry:", *(void *)(*((void *)&v27 + 1) + 8 * i), v7));
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  int v15 = [v6 ruleOperator];
  char v16 = v15 == 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        if (v15 == 1)
        {
          if (v16)
          {
            char v16 = 1;
            continue;
          }
        }
        else
        {
          if (v15) {
            continue;
          }
          if ((v16 & 1) == 0)
          {
            char v16 = 0;
            continue;
          }
        }
        char v16 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "BOOLValue", (void)v23);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v19);
  }

  return v16 & 1;
}

- (id)_contextPropertyWithName:(id)a3 forMessageGroupIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_messageGroupsByGroupIdentifier objectForKeyedSubscript:a4];
  id v8 = v7;
  if (v7)
  {
    int v9 = [v7 contextPropertyWithName:v6];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)_contextPropertyWithName:(id)a3 messageBundleIdentifier:(id)a4 conditionBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    if ([v10 isEqualToString:self->_hostBundleIdentifier])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationContext);
      double v13 = [WeakRetained contextPropertyWithName:v8];

      goto LABEL_8;
    }
    int v15 = self;
    id v16 = v8;
    id v17 = v11;
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)&self->_applicationContext);
    double v13 = [v14 contextPropertyWithName:v8];

    if (v13) {
      goto LABEL_8;
    }
    int v15 = self;
    id v16 = v8;
    id v17 = v9;
  }
  double v13 = [(IAMEvaluator *)v15 _contextPropertyWithName:v16 forMessageGroupIdentifier:v17];
LABEL_8:

  return v13;
}

- (id)_valueForCondition:(id)a3 messageBundleIdentifier:(id)a4 messageMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 hasKind])
  {
    int v11 = [v8 kind];
    if (v11 != 1)
    {
      if (v11 || !v10)
      {
LABEL_10:
        if ([v8 dataType] == 2 && !objc_msgSend(v8, "triggerConditionType"))
        {
          int v15 = [NSNumber numberWithInt:0];
        }
        else
        {
          int v15 = 0;
        }
        goto LABEL_14;
      }
      uint64_t v12 = [v8 identifier];
      double v13 = [v8 bundleIdentifier];
      id v14 = +[IAMTriggerKey nameSpacedKeyNameForName:v12 bundleIdentifier:v13];
      int v15 = [v10 metadataValueForKey:v14];

      goto LABEL_9;
    }
  }
  else if (v10)
  {
    id v16 = [v8 identifier];
    id v17 = [v8 bundleIdentifier];
    uint64_t v18 = +[IAMTriggerKey nameSpacedKeyNameForName:v16 bundleIdentifier:v17];
    int v15 = [v10 metadataValueForKey:v18];

    if (v15) {
      goto LABEL_14;
    }
  }
  uint64_t v12 = [v8 identifier];
  double v13 = [v8 bundleIdentifier];
  int v15 = [(IAMEvaluator *)self _contextPropertyWithName:v12 messageBundleIdentifier:v9 conditionBundleIdentifier:v13];
LABEL_9:

  if (!v15) {
    goto LABEL_10;
  }
LABEL_14:

  return v15;
}

- (BOOL)_evaluateCondition:(id)a3 forMessageEntry:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 bundleIdentifier];
  id v8 = [(IAMEvaluator *)self _valueForCondition:v6 messageBundleIdentifier:v7 messageMetadata:self->_currentMetadata];

  int v9 = [v6 dataType];
  if ((!v9 || v9 == 2 || v9 == 1) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    switch([v6 comparisonType])
    {
      case 0u:
        int v10 = [v6 dataType];
        if (v10)
        {
          if (v10 == 2)
          {
            LODWORD(v7) = [v8 intValue];
            int v11 = [v6 triggerValue];
            LOBYTE(v7) = v7 == [v11 intValue];
          }
          else
          {
            if (v10 != 1) {
              goto LABEL_11;
            }
            int v11 = [v6 triggerValue];
            LOBYTE(v7) = [v8 isEqualToString:v11];
          }
        }
        else
        {
          char v14 = [v8 BOOLValue];
          int v11 = [v6 triggerValue];
          LOBYTE(v7) = v14 ^ [v11 BOOLValue] ^ 1;
        }
        goto LABEL_23;
      case 1u:
LABEL_11:
        int v12 = [v6 dataType];
        if (v12)
        {
          if (v12 == 2)
          {
            LODWORD(v7) = [v8 intValue];
            int v11 = [v6 triggerValue];
            LOBYTE(v7) = v7 != [v11 intValue];
          }
          else if (v12 == 1)
          {
            int v11 = [v6 triggerValue];
            LOBYTE(v7) = [v8 isEqualToString:v11] ^ 1;
          }
          else
          {
LABEL_15:
            LODWORD(v7) = [v8 intValue];
            int v11 = [v6 triggerValue];
            LOBYTE(v7) = (int)v7 < (int)[v11 intValue];
          }
        }
        else
        {
          char v13 = [v8 BOOLValue];
          int v11 = [v6 triggerValue];
          LOBYTE(v7) = v13 ^ [v11 BOOLValue];
        }
LABEL_23:

        break;
      case 2u:
        goto LABEL_15;
      case 3u:
        LODWORD(v7) = [v8 intValue];
        int v11 = [v6 triggerValue];
        LOBYTE(v7) = (int)v7 <= (int)[v11 intValue];
        goto LABEL_23;
      case 4u:
        LODWORD(v7) = [v8 intValue];
        int v11 = [v6 triggerValue];
        LOBYTE(v7) = (int)v7 > (int)[v11 intValue];
        goto LABEL_23;
      case 5u:
        LODWORD(v7) = [v8 intValue];
        int v11 = [v6 triggerValue];
        LOBYTE(v7) = (int)v7 >= (int)[v11 intValue];
        goto LABEL_23;
      default:
        break;
    }
  }

  return v7 & 1;
}

- (unint64_t)_messageEntryProximity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  metadataEntries = self->_metadataEntries;
  if (metadataEntries)
  {
    uint64_t v7 = [v4 applicationMessage];
    id v8 = [v7 identifier];
    int v9 = [(NSDictionary *)metadataEntries objectForKeyedSubscript:v8];
    currentProximityMetadata = self->_currentProximityMetadata;
    self->_currentProximityMetadata = v9;
  }
  int v11 = [v5 applicationMessage];
  int v12 = [v11 rule];
  unint64_t v13 = [(IAMEvaluator *)self _calculateRuleProximity:v12 forMessageEntry:v5];

  return v13;
}

- (unint64_t)_calculateRuleProximity:(id)a3 forMessageEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_10;
  }
  if ([v6 hasRequiredApplicationContextBundleIdentifier])
  {
    id v8 = [v6 requiredApplicationContextBundleIdentifier];
    int v9 = [v8 isEqualToString:self->_hostBundleIdentifier];

    if (!v9)
    {
LABEL_11:
      unint64_t v14 = 0;
      goto LABEL_13;
    }
  }
  int v10 = [v6 triggerCondition];
  if (v10)
  {

    goto LABEL_7;
  }
  int v11 = [v6 subrules];

  if (!v11)
  {
LABEL_10:
    unint64_t v14 = 100;
    goto LABEL_13;
  }
LABEL_7:
  int v12 = [v6 type];
  if (v12 == 1)
  {
    unint64_t v14 = [(IAMEvaluator *)self _calculateCompoundRuleProximity:v6 forMessageEntry:v7];
    goto LABEL_13;
  }
  if (v12) {
    goto LABEL_11;
  }
  unint64_t v13 = [v6 triggerCondition];
  unint64_t v14 = [(IAMEvaluator *)self _calculateConditionProximity:v13 forMessageEntry:v7];

LABEL_13:
  return v14;
}

- (unint64_t)_calculateCompoundRuleProximity:(id)a3 forMessageEntry:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v29 = a4;
  id v7 = objc_opt_new();
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  long long v28 = v6;
  id v8 = [v6 subrules];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __64__IAMEvaluator__calculateCompoundRuleProximity_forMessageEntry___block_invoke;
  v42[3] = &unk_264342270;
  v42[4] = &v47;
  v42[5] = &v43;
  [v8 enumerateObjectsUsingBlock:v42];

  BOOL v9 = ![v28 ruleOperator] && v48[3] && v44[3] != 0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  int v10 = [v28 subrules];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v39;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * v13);
        if (!v9 || ([*(id *)(*((void *)&v38 + 1) + 8 * v13) isExactMatchRule] & 1) == 0)
        {
          int v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IAMEvaluator _calculateRuleProximity:forMessageEntry:](self, "_calculateRuleProximity:forMessageEntry:", v14, v29));
          [v7 addObject:v15];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v53 count:16];
    }
    while (v11);
  }

  if ([v28 ruleOperator])
  {
    if ([v28 ruleOperator] == 1)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v16 = v7;
      unint64_t v17 = 0;
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v51 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v31;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            unint64_t v21 = [*(id *)(*((void *)&v30 + 1) + 8 * v20) unsignedIntegerValue];
            if (v17 <= v21) {
              unint64_t v17 = v21;
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v51 count:16];
        }
        while (v18);
      }
    }
    else
    {
      unint64_t v17 = 0;
    }
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v22 = v7;
    unint64_t v23 = 0;
    uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v52 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v35;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v22);
          }
          v23 += [*(id *)(*((void *)&v34 + 1) + 8 * v26++) unsignedIntegerValue];
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v52 count:16];
      }
      while (v24);
    }

    unint64_t v17 = v23 / [v22 count];
  }
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v17;
}

uint64_t __64__IAMEvaluator__calculateCompoundRuleProximity_forMessageEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isExactMatchRule];
  if (result) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  ++*(void *)(*(void *)(v4 + 8) + 24);
  return result;
}

- (unint64_t)_calculateConditionProximity:(id)a3 forMessageEntry:(id)a4
{
  id v6 = a3;
  id v7 = [a4 bundleIdentifier];
  id v8 = [(IAMEvaluator *)self _valueForCondition:v6 messageBundleIdentifier:v7 messageMetadata:self->_currentProximityMetadata];

  int v9 = [v6 dataType];
  if ((!v9 || v9 == 2 || v9 == 1) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_27:
    unint64_t v43 = 0;
  }
  else
  {
    switch([v6 comparisonType])
    {
      case 0u:
        int v10 = [v6 dataType];
        switch(v10)
        {
          case 0:
            int v48 = [v8 BOOLValue];
            uint64_t v11 = [v6 triggerValue];
            BOOL v14 = v48 == [v11 BOOLValue];
LABEL_36:
            if (v14) {
              unint64_t v43 = 100;
            }
            else {
              unint64_t v43 = 0;
            }
            goto LABEL_46;
          case 2:
            int v49 = [v8 intValue];
            uint64_t v50 = [v6 triggerValue];
            int v51 = [v50 intValue];

            if (v49 != v51)
            {
              int v52 = [v8 intValue];
              v53 = [v6 triggerValue];
              int v54 = [v53 intValue];

              int v55 = [v8 intValue];
              int v32 = v55;
              if (v52 < v54)
              {
                int v35 = 100 * v55;
LABEL_43:
                long long v36 = [v6 triggerValue];
                uint64_t v11 = v36;
                goto LABEL_44;
              }
LABEL_22:
              long long v33 = [v6 triggerValue];
              int v34 = [v33 intValue];

              if (v32 <= v34) {
                goto LABEL_27;
              }
LABEL_23:
              uint64_t v11 = [v6 triggerValue];
              int v35 = 100 * [v11 intValue];
              long long v36 = v8;
LABEL_44:
              int v28 = v35 / (int)[v36 intValue];
LABEL_45:
              unint64_t v43 = v28;
              goto LABEL_46;
            }
LABEL_40:
            unint64_t v43 = 100;
            goto LABEL_47;
          case 1:
            uint64_t v11 = [v6 triggerValue];
            BOOL v12 = [v8 isEqualToString:v11] == 0;
            goto LABEL_29;
        }
LABEL_10:
        int v13 = [v6 dataType];
        if (!v13)
        {
          int v44 = [v8 BOOLValue];
          uint64_t v11 = [v6 triggerValue];
          BOOL v12 = v44 == [v11 BOOLValue];
LABEL_29:
          if (v12) {
            unint64_t v43 = 0;
          }
          else {
            unint64_t v43 = 100;
          }
LABEL_46:

          break;
        }
        if (v13 != 2)
        {
          if (v13 == 1)
          {
            uint64_t v11 = [v6 triggerValue];
            BOOL v14 = [v8 isEqualToString:v11] == 0;
            goto LABEL_36;
          }
LABEL_14:
          int v15 = [v8 intValue];
          id v16 = [v6 triggerValue];
          int v17 = [v16 intValue];

          if (v15 >= v17)
          {
            int v18 = [v8 intValue];
            uint64_t v19 = [v6 triggerValue];
            int v20 = [v19 intValue];

            if (v18 < v20) {
              goto LABEL_27;
            }
            goto LABEL_23;
          }
          goto LABEL_40;
        }
        int v45 = [v8 intValue];
        uint64_t v46 = [v6 triggerValue];
        int v47 = [v46 intValue];

        if (v45 == v47) {
          unint64_t v43 = 0;
        }
        else {
          unint64_t v43 = 100;
        }
        break;
      case 1u:
        goto LABEL_10;
      case 2u:
        goto LABEL_14;
      case 3u:
        int v29 = [v8 intValue];
        long long v30 = [v6 triggerValue];
        int v31 = [v30 intValue];

        if (v29 <= v31) {
          goto LABEL_40;
        }
        int v32 = [v8 intValue];
        goto LABEL_22;
      case 4u:
        int v21 = [v8 intValue];
        id v22 = [v6 triggerValue];
        int v23 = [v22 intValue];

        if (v21 > v23) {
          goto LABEL_40;
        }
        int v24 = [v8 intValue];
        uint64_t v25 = [v6 triggerValue];
        int v26 = [v25 intValue];

        if (v24 > v26) {
          goto LABEL_27;
        }
        int v27 = 100 * [v8 intValue];
        uint64_t v11 = [v6 triggerValue];
        int v28 = v27 / (int)([v11 intValue] + 1);
        goto LABEL_45;
      case 5u:
        int v37 = [v8 intValue];
        long long v38 = [v6 triggerValue];
        int v39 = [v38 intValue];

        if (v37 >= v39) {
          goto LABEL_40;
        }
        int v40 = [v8 intValue];
        long long v41 = [v6 triggerValue];
        int v42 = [v41 intValue];

        if (v40 >= v42) {
          goto LABEL_27;
        }
        int v35 = 100 * [v8 intValue];
        goto LABEL_43;
      default:
        goto LABEL_27;
    }
  }
LABEL_47:

  return v43;
}

@end