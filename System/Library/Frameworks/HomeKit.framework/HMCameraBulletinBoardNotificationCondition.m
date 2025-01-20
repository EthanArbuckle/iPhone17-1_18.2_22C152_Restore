@interface HMCameraBulletinBoardNotificationCondition
+ (id)shortDescription;
+ (uint64_t)isDateComponentsComparisonPredicate:(uint64_t)a1;
+ (uint64_t)isPresenceComparisonPredicate:(uint64_t)a1;
+ (void)_updateCondition:(void *)a3 usingPredicate:;
- (HMCameraBulletinBoardNotificationCondition)init;
- (HMCameraBulletinBoardNotificationCondition)initWithPredicate:(id)a3;
- (HMCameraSignificantEventPersonFamiliarityNotificationCondition)significantEventPersonFamiliarityCondition;
- (HMCameraSignificantEventReasonNotificationCondition)significantEventReasonCondition;
- (NSArray)attributeDescriptions;
- (NSPredicate)dateComponentsPredicate;
- (NSPredicate)predicate;
- (NSPredicate)presencePredicate;
- (NSString)description;
- (NSString)shortDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setDateComponentsPredicate:(id)a3;
- (void)setPresencePredicate:(id)a3;
- (void)setSignificantEventPersonFamiliarityCondition:(id)a3;
- (void)setSignificantEventReasonCondition:(id)a3;
@end

@implementation HMCameraBulletinBoardNotificationCondition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presencePredicate, 0);
  objc_storeStrong((id *)&self->_dateComponentsPredicate, 0);
  objc_storeStrong((id *)&self->_significantEventPersonFamiliarityCondition, 0);

  objc_storeStrong((id *)&self->_significantEventReasonCondition, 0);
}

- (void)setPresencePredicate:(id)a3
{
}

- (NSPredicate)presencePredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDateComponentsPredicate:(id)a3
{
}

- (NSPredicate)dateComponentsPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSignificantEventPersonFamiliarityCondition:(id)a3
{
}

- (HMCameraSignificantEventPersonFamiliarityNotificationCondition)significantEventPersonFamiliarityCondition
{
  return (HMCameraSignificantEventPersonFamiliarityNotificationCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSignificantEventReasonCondition:(id)a3
{
}

- (HMCameraSignificantEventReasonNotificationCondition)significantEventReasonCondition
{
  return (HMCameraSignificantEventReasonNotificationCondition *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HMCameraBulletinBoardNotificationCondition *)self significantEventReasonCondition];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
    v6 = [(HMCameraBulletinBoardNotificationCondition *)self significantEventReasonCondition];
    v7 = (void *)[v5 initWithName:@"Significant Event Reason" value:v6];
    [v3 addObject:v7];
  }
  v8 = [(HMCameraBulletinBoardNotificationCondition *)self significantEventPersonFamiliarityCondition];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
    v10 = [(HMCameraBulletinBoardNotificationCondition *)self significantEventPersonFamiliarityCondition];
    v11 = (void *)[v9 initWithName:@"Person Familiarity" value:v10];
    [v3 addObject:v11];
  }
  v12 = [(HMCameraBulletinBoardNotificationCondition *)self dateComponentsPredicate];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
    v14 = [(HMCameraBulletinBoardNotificationCondition *)self dateComponentsPredicate];
    v15 = (void *)[v13 initWithName:@"Date Components" value:v14];
    [v3 addObject:v15];
  }
  v16 = [(HMCameraBulletinBoardNotificationCondition *)self presencePredicate];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
    v18 = [(HMCameraBulletinBoardNotificationCondition *)self presencePredicate];
    v19 = (void *)[v17 initWithName:@"Presence" value:v18];
    [v3 addObject:v19];
  }
  v20 = (void *)[v3 copy];

  return (NSArray *)v20;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(HMMutableCameraBulletinBoardNotificationCondition);
  id v5 = [(HMCameraBulletinBoardNotificationCondition *)self significantEventReasonCondition];
  [(HMCameraBulletinBoardNotificationCondition *)v4 setSignificantEventReasonCondition:v5];

  v6 = [(HMCameraBulletinBoardNotificationCondition *)self significantEventPersonFamiliarityCondition];
  [(HMCameraBulletinBoardNotificationCondition *)v4 setSignificantEventPersonFamiliarityCondition:v6];

  v7 = [(HMCameraBulletinBoardNotificationCondition *)self dateComponentsPredicate];
  [(HMCameraBulletinBoardNotificationCondition *)v4 setDateComponentsPredicate:v7];

  v8 = [(HMCameraBulletinBoardNotificationCondition *)self presencePredicate];
  [(HMCameraBulletinBoardNotificationCondition *)v4 setPresencePredicate:v8];

  return v4;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSPredicate)predicate
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HMCameraBulletinBoardNotificationCondition *)self significantEventReasonCondition];

  if (v4)
  {
    id v5 = [(HMCameraBulletinBoardNotificationCondition *)self significantEventReasonCondition];
    v6 = [v5 predicate];
    [v3 addObject:v6];
  }
  v7 = [(HMCameraBulletinBoardNotificationCondition *)self significantEventPersonFamiliarityCondition];

  if (v7)
  {
    v8 = [(HMCameraBulletinBoardNotificationCondition *)self significantEventPersonFamiliarityCondition];
    id v9 = [v8 predicate];
    [v3 addObject:v9];
  }
  v10 = [(HMCameraBulletinBoardNotificationCondition *)self dateComponentsPredicate];

  if (v10)
  {
    v11 = [(HMCameraBulletinBoardNotificationCondition *)self dateComponentsPredicate];
    [v3 addObject:v11];
  }
  v12 = [(HMCameraBulletinBoardNotificationCondition *)self presencePredicate];

  if (v12)
  {
    id v13 = [(HMCameraBulletinBoardNotificationCondition *)self presencePredicate];
    [v3 addObject:v13];
  }
  v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];

  return (NSPredicate *)v14;
}

- (HMCameraBulletinBoardNotificationCondition)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMCameraBulletinBoardNotificationCondition;
  return [(HMCameraBulletinBoardNotificationCondition *)&v3 init];
}

- (HMCameraBulletinBoardNotificationCondition)initWithPredicate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v6 = [(HMCameraBulletinBoardNotificationCondition *)self init];
    v7 = (void *)[(HMCameraBulletinBoardNotificationCondition *)v6 mutableCopy];
    +[HMCameraBulletinBoardNotificationCondition _updateCondition:usingPredicate:]((uint64_t)HMCameraBulletinBoardNotificationCondition, v7, v5);
    v8 = (HMCameraBulletinBoardNotificationCondition *)[v7 copy];

    return v8;
  }
  else
  {
    uint64_t v10 = _HMFPreconditionFailure();
    +[HMCameraBulletinBoardNotificationCondition _updateCondition:usingPredicate:](v10, v11, v12);
  }
  return result;
}

+ (void)_updateCondition:(void *)a3 usingPredicate:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  v7 = [[HMCameraSignificantEventReasonNotificationCondition alloc] initWithPredicate:v5];
  if (!v7)
  {
    v8 = [[HMCameraSignificantEventPersonFamiliarityNotificationCondition alloc] initWithPredicate:v5];
    if (v8)
    {
      [v4 setSignificantEventPersonFamiliarityCondition:v8];
LABEL_36:

      goto LABEL_37;
    }
    id v9 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    if (!v11)
    {
      id v22 = v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      id v24 = v23;

      if (v24)
      {
        if (+[HMCameraBulletinBoardNotificationCondition isDateComponentsComparisonPredicate:](v6, v24))
        {
          [v4 setDateComponentsPredicate:v24];
        }
        else if (+[HMCameraBulletinBoardNotificationCondition isPresenceComparisonPredicate:](v6, v24))
        {
          [v4 setPresencePredicate:v24];
        }
      }
      goto LABEL_34;
    }
    id v12 = v11;
    uint64_t v30 = self;
    id v13 = [v12 subpredicates];

    if ([v13 count] == 2)
    {
      id v29 = v11;
      v14 = [v13 objectAtIndexedSubscript:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
      id v16 = v15;

      id v17 = [v13 objectAtIndexedSubscript:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      id v19 = v18;

      char v20 = +[HMCameraBulletinBoardNotificationCondition isDateComponentsComparisonPredicate:](v30, v16);
      if (v20)
      {
        int v21 = +[HMCameraBulletinBoardNotificationCondition isDateComponentsComparisonPredicate:](v30, v19);

        id v11 = v29;
        if (v21)
        {
          [v4 setDateComponentsPredicate:v12];
LABEL_35:

          goto LABEL_36;
        }
        goto LABEL_27;
      }

      id v11 = v29;
    }

LABEL_27:
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v24 = [v12 subpredicates];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          +[HMCameraBulletinBoardNotificationCondition _updateCondition:usingPredicate:](v6, v4, *(void *)(*((void *)&v31 + 1) + 8 * i));
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v26);
    }
LABEL_34:

    goto LABEL_35;
  }
  [v4 setSignificantEventReasonCondition:v7];
LABEL_37:
}

+ (uint64_t)isDateComponentsComparisonPredicate:(uint64_t)a1
{
  id v2 = a2;
  self;
  objc_super v3 = [v2 rightExpression];
  if ([v3 expressionType])
  {
    char isKindOfClass = 0;
  }
  else
  {
    id v5 = [v2 rightExpression];
    uint64_t v6 = [v5 constantValue];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

+ (uint64_t)isPresenceComparisonPredicate:(uint64_t)a1
{
  id v2 = a2;
  self;
  objc_super v3 = [v2 leftExpression];
  if ([v3 expressionType] == 3)
  {
    id v4 = [v2 leftExpression];
    id v5 = [v4 keyPath];
    uint64_t v6 = [v5 isEqualToString:@"presence"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end