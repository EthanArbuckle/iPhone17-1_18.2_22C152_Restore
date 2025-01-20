@interface INRideCompletionStatus
+ (BOOL)supportsSecureCoding;
+ (INRideCompletionStatus)canceledByService;
+ (INRideCompletionStatus)canceledByUser;
+ (INRideCompletionStatus)canceledMissedPickup;
+ (INRideCompletionStatus)completed;
+ (INRideCompletionStatus)completedWithOutstandingFeedbackType:(INRideFeedbackTypeOptions)feedbackType;
+ (INRideCompletionStatus)completedWithOutstandingPaymentAmount:(INCurrencyAmount *)outstandingPaymentAmount;
+ (INRideCompletionStatus)completedWithSettledPaymentAmount:(INCurrencyAmount *)settledPaymentAmount;
- (BOOL)isCanceled;
- (BOOL)isCanceledByService;
- (BOOL)isCompleted;
- (BOOL)isMissedPickup;
- (BOOL)isOutstanding;
- (INCurrencyAmount)paymentAmount;
- (INRideCompletionStatus)initWithCoder:(id)a3;
- (INRideFeedbackTypeOptions)feedbackType;
- (NSSet)defaultTippingOptions;
- (NSString)description;
- (NSUserActivity)completionUserActivity;
- (id)_dictionaryRepresentation;
- (id)_initCompleted:(BOOL)a3 canceledByService:(BOOL)a4 missedPickup:(BOOL)a5 amount:(id)a6 feedbackType:(unint64_t)a7 outstanding:(BOOL)a8;
- (id)_initWithValue:(id)a3;
- (id)_intents_cacheableObjects;
- (id)_newValue;
- (id)descriptionAtIndent:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletionUserActivity:(NSUserActivity *)completionUserActivity;
- (void)setDefaultTippingOptions:(NSSet *)defaultTippingOptions;
@end

@implementation INRideCompletionStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTippingOptions, 0);
  objc_storeStrong((id *)&self->_paymentAmount, 0);

  objc_storeStrong((id *)&self->_completionUserActivity, 0);
}

- (BOOL)isCanceledByService
{
  return self->_canceledByService;
}

- (void)setDefaultTippingOptions:(NSSet *)defaultTippingOptions
{
}

- (NSSet)defaultTippingOptions
{
  return self->_defaultTippingOptions;
}

- (BOOL)isOutstanding
{
  return self->_outstanding;
}

- (INRideFeedbackTypeOptions)feedbackType
{
  return self->_feedbackType;
}

- (INCurrencyAmount)paymentAmount
{
  return self->_paymentAmount;
}

- (BOOL)isMissedPickup
{
  return self->_missedPickup;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompletionUserActivity:(NSUserActivity *)completionUserActivity
{
}

- (NSUserActivity)completionUserActivity
{
  return self->_completionUserActivity;
}

- (id)_dictionaryRepresentation
{
  v18[8] = *MEMORY[0x1E4F143B8];
  v17[0] = @"completionUserActivity";
  completionUserActivity = self->_completionUserActivity;
  uint64_t v4 = (uint64_t)completionUserActivity;
  if (!completionUserActivity)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v4;
  v17[1] = @"completed";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", self->_completed, v4);
  v18[1] = v16;
  v17[2] = @"isCanceled";
  v5 = objc_msgSend(NSNumber, "numberWithInt:", -[INRideCompletionStatus isCompleted](self, "isCompleted") ^ 1);
  v18[2] = v5;
  v17[3] = @"missedPickup";
  v6 = [NSNumber numberWithBool:self->_missedPickup];
  v18[3] = v6;
  v17[4] = @"paymentAmount";
  paymentAmount = self->_paymentAmount;
  v8 = paymentAmount;
  if (!paymentAmount)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[4] = v8;
  v17[5] = @"defaultTippingOptions";
  defaultTippingOptions = self->_defaultTippingOptions;
  v10 = defaultTippingOptions;
  if (!defaultTippingOptions)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[5] = v10;
  v17[6] = @"feedbackType";
  v11 = [NSNumber numberWithUnsignedInteger:self->_feedbackType];
  v18[6] = v11;
  v17[7] = @"outstanding";
  v12 = [NSNumber numberWithBool:self->_outstanding];
  v18[7] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:8];

  if (defaultTippingOptions)
  {
    if (paymentAmount) {
      goto LABEL_9;
    }
  }
  else
  {

    if (paymentAmount) {
      goto LABEL_9;
    }
  }

LABEL_9:
  if (!completionUserActivity) {

  }
  return v13;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INRideCompletionStatus;
  v6 = [(INRideCompletionStatus *)&v11 description];
  v7 = [(INRideCompletionStatus *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INRideCompletionStatus *)self descriptionAtIndent:0];
}

- (id)_newValue
{
  v3 = objc_alloc_init(_INPBRideCompletionStatus);
  [(_INPBRideCompletionStatus *)v3 setCompleted:[(INRideCompletionStatus *)self isCompleted]];
  [(_INPBRideCompletionStatus *)v3 setCanceledByService:[(INRideCompletionStatus *)self isCanceledByService]];
  [(_INPBRideCompletionStatus *)v3 setMissedPickup:[(INRideCompletionStatus *)self isMissedPickup]];
  uint64_t v4 = [(INRideCompletionStatus *)self paymentAmount];
  v5 = INIntentSlotValueTransformToCurrencyAmountValue(v4);
  [(_INPBRideCompletionStatus *)v3 setPaymentAmount:v5];

  [(_INPBRideCompletionStatus *)v3 setOutstanding:[(INRideCompletionStatus *)self isOutstanding]];
  completionUserActivity = self->_completionUserActivity;
  if (completionUserActivity)
  {
    v7 = INUserActivitySerializeToBackingStore(completionUserActivity);
    [(_INPBRideCompletionStatus *)v3 setCompletionUserActivity:v7];
  }
  uint64_t v8 = [(INRideCompletionStatus *)self feedbackType];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__INRideCompletionStatus__newValue__block_invoke;
  v16[3] = &unk_1E5520C28;
  v9 = v3;
  v17 = v9;
  INRideFeedbackTypeOptionsEnumerateBackingTypes(v8, v16);
  v10 = (void *)MEMORY[0x1E4F1CA48];
  objc_super v11 = [(INRideCompletionStatus *)self defaultTippingOptions];
  v12 = [v11 allObjects];
  v13 = INIntentSlotValueTransformToCurrencyAmountValues(v12);
  v14 = [v10 arrayWithArray:v13];
  [(_INPBRideCompletionStatus *)v9 setDefaultTippingOptions:v14];

  return v9;
}

uint64_t __35__INRideCompletionStatus__newValue__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addFeedbackType:a2];
}

- (id)_initWithValue:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)INRideCompletionStatus;
  v5 = [(INRideCompletionStatus *)&v24 init];
  if (v5)
  {
    v5->_completed = [v4 completed];
    v5->_canceledByService = [v4 canceledByService];
    v5->_missedPickup = [v4 missedPickup];
    v6 = [v4 paymentAmount];
    uint64_t v7 = INIntentSlotValueTransformFromCurrencyAmountValue(v6);
    paymentAmount = v5->_paymentAmount;
    v5->_paymentAmount = (INCurrencyAmount *)v7;

    v5->_outstanding = [v4 outstanding];
    v9 = [v4 completionUserActivity];
    uint64_t v10 = INUserActivityDeserializeFromBackingStore(v9);
    completionUserActivity = v5->_completionUserActivity;
    v5->_completionUserActivity = (NSUserActivity *)v10;

    v5->_unint64_t feedbackType = 0;
    uint64_t v12 = [v4 feedbackTypesCount];
    if (v12)
    {
      uint64_t v13 = v12;
      for (uint64_t i = 0; i != v13; ++i)
      {
        int v15 = [v4 feedbackTypeAtIndex:i];
        unint64_t feedbackType = v5->_feedbackType;
        uint64_t v17 = feedbackType | 2;
        if (v15 == 1) {
          feedbackType |= 1uLL;
        }
        if (v15 == 2) {
          unint64_t feedbackType = v17;
        }
        v5->_unint64_t feedbackType = feedbackType;
      }
    }
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v19 = [v4 defaultTippingOptions];
    v20 = INIntentSlotValueTransformFromCurrencyAmountValues(v19);
    uint64_t v21 = [v18 setWithArray:v20];
    defaultTippingOptions = v5->_defaultTippingOptions;
    v5->_defaultTippingOptions = (NSSet *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL completed = self->_completed;
  id v5 = a3;
  [v5 encodeBool:completed forKey:@"isCompleted"];
  [v5 encodeBool:self->_canceledByService forKey:@"isCanceledByService"];
  [v5 encodeBool:self->_missedPickup forKey:@"isMissedPickup"];
  [v5 encodeObject:self->_paymentAmount forKey:@"paymentAmount"];
  [v5 encodeInteger:self->_feedbackType forKey:@"feedbackType"];
  [v5 encodeObject:self->_defaultTippingOptions forKey:@"defaultTippingOptions"];
  [v5 encodeBool:self->_outstanding forKey:@"isOutstanding"];
  INUserActivitySerializeToData(self->_completionUserActivity);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"completionUserActivity"];
}

- (INRideCompletionStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INRideCompletionStatus;
  id v5 = [(INRideCompletionStatus *)&v14 init];
  if (v5)
  {
    v5->_BOOL completed = [v4 decodeBoolForKey:@"isCompleted"];
    v5->_canceledByService = [v4 decodeBoolForKey:@"isCanceledByService"];
    v5->_missedPickup = [v4 decodeBoolForKey:@"isMissedPickup"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentAmount"];
    paymentAmount = v5->_paymentAmount;
    v5->_paymentAmount = (INCurrencyAmount *)v6;

    v5->_unint64_t feedbackType = [v4 decodeIntegerForKey:@"feedbackType"];
    uint64_t v8 = [v4 decodeObjectForKey:@"defaultTippingOptions"];
    defaultTippingOptions = v5->_defaultTippingOptions;
    v5->_defaultTippingOptions = (NSSet *)v8;

    v5->_outstanding = [v4 decodeBoolForKey:@"isOutstanding"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completionUserActivity"];
    uint64_t v11 = INUserActivityDeserializeFromData(v10);
    completionUserActivity = v5->_completionUserActivity;
    v5->_completionUserActivity = (NSUserActivity *)v11;
  }
  return v5;
}

- (BOOL)isCanceled
{
  return ![(INRideCompletionStatus *)self isCompleted];
}

- (id)_initCompleted:(BOOL)a3 canceledByService:(BOOL)a4 missedPickup:(BOOL)a5 amount:(id)a6 feedbackType:(unint64_t)a7 outstanding:(BOOL)a8
{
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)INRideCompletionStatus;
  int v15 = [(INRideCompletionStatus *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_BOOL completed = a3;
    v15->_canceledByService = a4;
    v15->_missedPickup = a5;
    uint64_t v17 = [v14 copy];
    paymentAmount = v16->_paymentAmount;
    v16->_paymentAmount = (INCurrencyAmount *)v17;

    v16->_unint64_t feedbackType = a7;
    v16->_outstanding = a8;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (INRideCompletionStatus)canceledMissedPickup
{
  v2 = (void *)[objc_alloc((Class)a1) _initCompleted:0 canceledByService:1 missedPickup:1 amount:0 feedbackType:0 outstanding:0];

  return (INRideCompletionStatus *)v2;
}

+ (INRideCompletionStatus)canceledByService
{
  v2 = (void *)[objc_alloc((Class)a1) _initCompleted:0 canceledByService:1 missedPickup:0 amount:0 feedbackType:0 outstanding:0];

  return (INRideCompletionStatus *)v2;
}

+ (INRideCompletionStatus)canceledByUser
{
  v2 = (void *)[objc_alloc((Class)a1) _initCompleted:0 canceledByService:0 missedPickup:0 amount:0 feedbackType:0 outstanding:0];

  return (INRideCompletionStatus *)v2;
}

+ (INRideCompletionStatus)completedWithOutstandingFeedbackType:(INRideFeedbackTypeOptions)feedbackType
{
  v3 = (void *)[objc_alloc((Class)a1) _initCompleted:1 canceledByService:0 missedPickup:0 amount:0 feedbackType:feedbackType outstanding:1];

  return (INRideCompletionStatus *)v3;
}

+ (INRideCompletionStatus)completedWithOutstandingPaymentAmount:(INCurrencyAmount *)outstandingPaymentAmount
{
  id v4 = outstandingPaymentAmount;
  id v5 = (void *)[objc_alloc((Class)a1) _initCompleted:1 canceledByService:0 missedPickup:0 amount:v4 feedbackType:0 outstanding:1];

  return (INRideCompletionStatus *)v5;
}

+ (INRideCompletionStatus)completedWithSettledPaymentAmount:(INCurrencyAmount *)settledPaymentAmount
{
  id v4 = settledPaymentAmount;
  id v5 = (void *)[objc_alloc((Class)a1) _initCompleted:1 canceledByService:0 missedPickup:0 amount:v4 feedbackType:0 outstanding:0];

  return (INRideCompletionStatus *)v5;
}

+ (INRideCompletionStatus)completed
{
  v2 = (void *)[objc_alloc((Class)a1) _initCompleted:1 canceledByService:0 missedPickup:0 amount:0 feedbackType:0 outstanding:0];

  return (INRideCompletionStatus *)v2;
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(INRideCompletionStatus *)self completionUserActivity];

  if (v4)
  {
    id v5 = [(INRideCompletionStatus *)self completionUserActivity];
    [v3 addObject:v5];
  }
  if ([v3 count]) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

@end