@interface HMCameraSignificantEventReasonNotificationCondition
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMCameraSignificantEventReasonNotificationCondition)initWithPredicate:(id)a3;
- (HMCameraSignificantEventReasonNotificationCondition)initWithSignificantEventTypes:(unint64_t)a3;
- (NSArray)attributeDescriptions;
- (NSPredicate)predicate;
- (NSString)description;
- (NSString)shortDescription;
- (unint64_t)significantEventTypes;
@end

@implementation HMCameraSignificantEventReasonNotificationCondition

- (unint64_t)significantEventTypes
{
  return self->_significantEventTypes;
}

- (NSArray)attributeDescriptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v8 = [(HMCameraSignificantEventReasonNotificationCondition *)self significantEventTypes];
  v4 = NSPrintF();
  v5 = objc_msgSend(v3, "initWithName:value:", @"Significant Events", v4, v8, &unk_19D47BA40);
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return (NSArray *)v6;
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

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    unint64_t v7 = [(HMCameraSignificantEventReasonNotificationCondition *)self significantEventTypes];
    BOOL v8 = v7 == [v6 significantEventTypes];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSPredicate)predicate
{
  unint64_t v2 = [(HMCameraSignificantEventReasonNotificationCondition *)self significantEventTypes];

  return (NSPredicate *)+[HMCameraBulletinBoardSmartNotification predicateForSignificantEventTypes:v2];
}

- (HMCameraSignificantEventReasonNotificationCondition)initWithSignificantEventTypes:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMCameraSignificantEventReasonNotificationCondition;
  result = [(HMCameraSignificantEventReasonNotificationCondition *)&v5 init];
  if (result) {
    result->_significantEventTypes = a3;
  }
  return result;
}

- (HMCameraSignificantEventReasonNotificationCondition)initWithPredicate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      unint64_t v7 = v5;
    }
    else {
      unint64_t v7 = 0;
    }
    id v8 = v7;
    if (isKindOfClass)
    {
      v9 = +[HMPredicateUtilities significantEventTypesInComparisonPredicate:v5];
      v10 = v9;
      if (v9)
      {
        self = -[HMCameraSignificantEventReasonNotificationCondition initWithSignificantEventTypes:](self, "initWithSignificantEventTypes:", [v9 integerValue]);
        v11 = self;
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }

    return v11;
  }
  else
  {
    v13 = (void *)_HMFPreconditionFailure();
    return (HMCameraSignificantEventReasonNotificationCondition *)+[HMCameraSignificantEventReasonNotificationCondition shortDescription];
  }
}

+ (id)shortDescription
{
  unint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end