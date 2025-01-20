@interface _INPBRideCompletionStatus
+ (BOOL)supportsSecureCoding;
+ (Class)defaultTippingOptionsType;
- (BOOL)canceled;
- (BOOL)canceledByService;
- (BOOL)completed;
- (BOOL)hasCanceled;
- (BOOL)hasCanceledByService;
- (BOOL)hasCompleted;
- (BOOL)hasCompletionUserActivity;
- (BOOL)hasMissedPickup;
- (BOOL)hasOutstanding;
- (BOOL)hasPaymentAmount;
- (BOOL)isEqual:(id)a3;
- (BOOL)missedPickup;
- (BOOL)outstanding;
- (BOOL)readFrom:(id)a3;
- (NSArray)defaultTippingOptions;
- (_INPBCurrencyAmountValue)paymentAmount;
- (_INPBRideCompletionStatus)initWithCoder:(id)a3;
- (_INPBUserActivity)completionUserActivity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultTippingOptionsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)feedbackTypesAsString:(int)a3;
- (int)StringAsFeedbackTypes:(id)a3;
- (int)feedbackTypeAtIndex:(unint64_t)a3;
- (int)feedbackTypes;
- (unint64_t)defaultTippingOptionsCount;
- (unint64_t)feedbackTypesCount;
- (unint64_t)hash;
- (void)addDefaultTippingOptions:(id)a3;
- (void)addFeedbackType:(int)a3;
- (void)clearDefaultTippingOptions;
- (void)clearFeedbackTypes;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCanceledByService:(BOOL)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setCompletionUserActivity:(id)a3;
- (void)setDefaultTippingOptions:(id)a3;
- (void)setFeedbackTypes:(int *)a3 count:(unint64_t)a4;
- (void)setHasCanceled:(BOOL)a3;
- (void)setHasCanceledByService:(BOOL)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setHasMissedPickup:(BOOL)a3;
- (void)setHasOutstanding:(BOOL)a3;
- (void)setMissedPickup:(BOOL)a3;
- (void)setOutstanding:(BOOL)a3;
- (void)setPaymentAmount:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRideCompletionStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentAmount, 0);
  objc_storeStrong((id *)&self->_defaultTippingOptions, 0);

  objc_storeStrong((id *)&self->_completionUserActivity, 0);
}

- (_INPBCurrencyAmountValue)paymentAmount
{
  return self->_paymentAmount;
}

- (BOOL)outstanding
{
  return self->_outstanding;
}

- (BOOL)missedPickup
{
  return self->_missedPickup;
}

- (NSArray)defaultTippingOptions
{
  return self->_defaultTippingOptions;
}

- (_INPBUserActivity)completionUserActivity
{
  return self->_completionUserActivity;
}

- (BOOL)completed
{
  return self->_completed;
}

- (BOOL)canceledByService
{
  return self->_canceledByService;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (id)dictionaryRepresentation
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBRideCompletionStatus *)self hasCanceled])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRideCompletionStatus canceled](self, "canceled"));
    [v3 setObject:v4 forKeyedSubscript:@"canceled"];
  }
  if ([(_INPBRideCompletionStatus *)self hasCanceledByService])
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRideCompletionStatus canceledByService](self, "canceledByService"));
    [v3 setObject:v5 forKeyedSubscript:@"canceledByService"];
  }
  if ([(_INPBRideCompletionStatus *)self hasCompleted])
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRideCompletionStatus completed](self, "completed"));
    [v3 setObject:v6 forKeyedSubscript:@"completed"];
  }
  v7 = [(_INPBRideCompletionStatus *)self completionUserActivity];
  v8 = [v7 dictionaryRepresentation];
  [v3 setObject:v8 forKeyedSubscript:@"completionUserActivity"];

  if ([(NSArray *)self->_defaultTippingOptions count])
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v10 = self->_defaultTippingOptions;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"defaultTippingOptions"];
  }
  if (self->_feedbackTypes.count)
  {
    v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBRideCompletionStatus feedbackTypesCount](self, "feedbackTypesCount"));
    if ([(_INPBRideCompletionStatus *)self feedbackTypesCount])
    {
      unint64_t v17 = 0;
      do
      {
        int v18 = self->_feedbackTypes.list[v17];
        if (v18 == 1)
        {
          v19 = @"RATE";
        }
        else if (v18 == 2)
        {
          v19 = @"TIP";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedbackTypes.list[v17]);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v16 addObject:v19];

        ++v17;
      }
      while (v17 < [(_INPBRideCompletionStatus *)self feedbackTypesCount]);
    }
    [v3 setObject:v16 forKeyedSubscript:@"feedbackType"];
  }
  if ([(_INPBRideCompletionStatus *)self hasMissedPickup])
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRideCompletionStatus missedPickup](self, "missedPickup"));
    [v3 setObject:v20 forKeyedSubscript:@"missedPickup"];
  }
  if ([(_INPBRideCompletionStatus *)self hasOutstanding])
  {
    v21 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRideCompletionStatus outstanding](self, "outstanding"));
    [v3 setObject:v21 forKeyedSubscript:@"outstanding"];
  }
  v22 = [(_INPBRideCompletionStatus *)self paymentAmount];
  v23 = [v22 dictionaryRepresentation];
  [v3 setObject:v23 forKeyedSubscript:@"paymentAmount"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBRideCompletionStatus *)self hasCanceled]) {
    uint64_t v3 = 2654435761 * self->_canceled;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBRideCompletionStatus *)self hasCanceledByService]) {
    uint64_t v4 = 2654435761 * self->_canceledByService;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(_INPBRideCompletionStatus *)self hasCompleted]) {
    uint64_t v5 = 2654435761 * self->_completed;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(_INPBUserActivity *)self->_completionUserActivity hash];
  uint64_t v7 = [(NSArray *)self->_defaultTippingOptions hash];
  uint64_t v8 = PBRepeatedInt32Hash();
  if ([(_INPBRideCompletionStatus *)self hasMissedPickup]) {
    uint64_t v9 = 2654435761 * self->_missedPickup;
  }
  else {
    uint64_t v9 = 0;
  }
  if ([(_INPBRideCompletionStatus *)self hasOutstanding]) {
    uint64_t v10 = 2654435761 * self->_outstanding;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(_INPBCurrencyAmountValue *)self->_paymentAmount hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  int v5 = [(_INPBRideCompletionStatus *)self hasCanceled];
  if (v5 != [v4 hasCanceled]) {
    goto LABEL_38;
  }
  if ([(_INPBRideCompletionStatus *)self hasCanceled])
  {
    if ([v4 hasCanceled])
    {
      int canceled = self->_canceled;
      if (canceled != [v4 canceled]) {
        goto LABEL_38;
      }
    }
  }
  int v7 = [(_INPBRideCompletionStatus *)self hasCanceledByService];
  if (v7 != [v4 hasCanceledByService]) {
    goto LABEL_38;
  }
  if ([(_INPBRideCompletionStatus *)self hasCanceledByService])
  {
    if ([v4 hasCanceledByService])
    {
      int canceledByService = self->_canceledByService;
      if (canceledByService != [v4 canceledByService]) {
        goto LABEL_38;
      }
    }
  }
  int v9 = [(_INPBRideCompletionStatus *)self hasCompleted];
  if (v9 != [v4 hasCompleted]) {
    goto LABEL_38;
  }
  if ([(_INPBRideCompletionStatus *)self hasCompleted])
  {
    if ([v4 hasCompleted])
    {
      int completed = self->_completed;
      if (completed != [v4 completed]) {
        goto LABEL_38;
      }
    }
  }
  uint64_t v11 = [(_INPBRideCompletionStatus *)self completionUserActivity];
  uint64_t v12 = [v4 completionUserActivity];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_37;
  }
  uint64_t v13 = [(_INPBRideCompletionStatus *)self completionUserActivity];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_INPBRideCompletionStatus *)self completionUserActivity];
    v16 = [v4 completionUserActivity];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  uint64_t v11 = [(_INPBRideCompletionStatus *)self defaultTippingOptions];
  uint64_t v12 = [v4 defaultTippingOptions];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_37;
  }
  uint64_t v18 = [(_INPBRideCompletionStatus *)self defaultTippingOptions];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(_INPBRideCompletionStatus *)self defaultTippingOptions];
    v21 = [v4 defaultTippingOptions];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_38;
  }
  int v23 = [(_INPBRideCompletionStatus *)self hasMissedPickup];
  if (v23 != [v4 hasMissedPickup]) {
    goto LABEL_38;
  }
  if ([(_INPBRideCompletionStatus *)self hasMissedPickup])
  {
    if ([v4 hasMissedPickup])
    {
      int missedPickup = self->_missedPickup;
      if (missedPickup != [v4 missedPickup]) {
        goto LABEL_38;
      }
    }
  }
  int v25 = [(_INPBRideCompletionStatus *)self hasOutstanding];
  if (v25 != [v4 hasOutstanding]) {
    goto LABEL_38;
  }
  if ([(_INPBRideCompletionStatus *)self hasOutstanding])
  {
    if ([v4 hasOutstanding])
    {
      int outstanding = self->_outstanding;
      if (outstanding != [v4 outstanding]) {
        goto LABEL_38;
      }
    }
  }
  uint64_t v11 = [(_INPBRideCompletionStatus *)self paymentAmount];
  uint64_t v12 = [v4 paymentAmount];
  if ((v11 == 0) != (v12 != 0))
  {
    uint64_t v27 = [(_INPBRideCompletionStatus *)self paymentAmount];
    if (!v27)
    {

LABEL_41:
      BOOL v32 = 1;
      goto LABEL_39;
    }
    long long v28 = (void *)v27;
    v29 = [(_INPBRideCompletionStatus *)self paymentAmount];
    uint64_t v30 = [v4 paymentAmount];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_41;
    }
  }
  else
  {
LABEL_37:
  }
LABEL_38:
  BOOL v32 = 0;
LABEL_39:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBRideCompletionStatus allocWithZone:](_INPBRideCompletionStatus, "allocWithZone:") init];
  if ([(_INPBRideCompletionStatus *)self hasCanceled]) {
    [(_INPBRideCompletionStatus *)v5 setCanceled:[(_INPBRideCompletionStatus *)self canceled]];
  }
  if ([(_INPBRideCompletionStatus *)self hasCanceledByService]) {
    [(_INPBRideCompletionStatus *)v5 setCanceledByService:[(_INPBRideCompletionStatus *)self canceledByService]];
  }
  if ([(_INPBRideCompletionStatus *)self hasCompleted]) {
    [(_INPBRideCompletionStatus *)v5 setCompleted:[(_INPBRideCompletionStatus *)self completed]];
  }
  id v6 = [(_INPBUserActivity *)self->_completionUserActivity copyWithZone:a3];
  [(_INPBRideCompletionStatus *)v5 setCompletionUserActivity:v6];

  int v7 = (void *)[(NSArray *)self->_defaultTippingOptions copyWithZone:a3];
  [(_INPBRideCompletionStatus *)v5 setDefaultTippingOptions:v7];

  PBRepeatedInt32Copy();
  if ([(_INPBRideCompletionStatus *)self hasMissedPickup]) {
    [(_INPBRideCompletionStatus *)v5 setMissedPickup:[(_INPBRideCompletionStatus *)self missedPickup]];
  }
  if ([(_INPBRideCompletionStatus *)self hasOutstanding]) {
    [(_INPBRideCompletionStatus *)v5 setOutstanding:[(_INPBRideCompletionStatus *)self outstanding]];
  }
  id v8 = [(_INPBCurrencyAmountValue *)self->_paymentAmount copyWithZone:a3];
  [(_INPBRideCompletionStatus *)v5 setPaymentAmount:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRideCompletionStatus *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRideCompletionStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRideCompletionStatus *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRideCompletionStatus *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRideCompletionStatus *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBRideCompletionStatus *)self clearFeedbackTypes];
  v3.receiver = self;
  v3.super_class = (Class)_INPBRideCompletionStatus;
  [(_INPBRideCompletionStatus *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBRideCompletionStatus *)self hasCanceled]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBRideCompletionStatus *)self hasCanceledByService]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBRideCompletionStatus *)self hasCompleted]) {
    PBDataWriterWriteBOOLField();
  }
  int v5 = [(_INPBRideCompletionStatus *)self completionUserActivity];

  if (v5)
  {
    id v6 = [(_INPBRideCompletionStatus *)self completionUserActivity];
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_defaultTippingOptions;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if (self->_feedbackTypes.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_feedbackTypes.count);
  }
  if ([(_INPBRideCompletionStatus *)self hasMissedPickup]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBRideCompletionStatus *)self hasOutstanding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v13 = [(_INPBRideCompletionStatus *)self paymentAmount];

  if (v13)
  {
    v14 = [(_INPBRideCompletionStatus *)self paymentAmount];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideCompletionStatusReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPaymentAmount
{
  return self->_paymentAmount != 0;
}

- (void)setPaymentAmount:(id)a3
{
}

- (void)setHasOutstanding:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOutstanding
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setOutstanding:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int outstanding = a3;
}

- (void)setHasMissedPickup:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMissedPickup
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMissedPickup:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int missedPickup = a3;
}

- (int)StringAsFeedbackTypes:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"RATE"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"TIP"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)feedbackTypesAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"RATE";
  }
  else if (a3 == 2)
  {
    int v4 = @"TIP";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)feedbackTypeAtIndex:(unint64_t)a3
{
  return self->_feedbackTypes.list[a3];
}

- (unint64_t)feedbackTypesCount
{
  return self->_feedbackTypes.count;
}

- (void)addFeedbackType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearFeedbackTypes
{
}

- (int)feedbackTypes
{
  return self->_feedbackTypes.list;
}

- (void)setFeedbackTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)defaultTippingOptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_defaultTippingOptions objectAtIndexedSubscript:a3];
}

- (unint64_t)defaultTippingOptionsCount
{
  return [(NSArray *)self->_defaultTippingOptions count];
}

- (void)addDefaultTippingOptions:(id)a3
{
  id v4 = a3;
  defaultTippingOptions = self->_defaultTippingOptions;
  id v8 = v4;
  if (!defaultTippingOptions)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_defaultTippingOptions;
    self->_defaultTippingOptions = v6;

    id v4 = v8;
    defaultTippingOptions = self->_defaultTippingOptions;
  }
  [(NSArray *)defaultTippingOptions addObject:v4];
}

- (void)clearDefaultTippingOptions
{
}

- (void)setDefaultTippingOptions:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  defaultTippingOptions = self->_defaultTippingOptions;
  self->_defaultTippingOptions = v4;

  MEMORY[0x1F41817F8](v4, defaultTippingOptions);
}

- (BOOL)hasCompletionUserActivity
{
  return self->_completionUserActivity != 0;
}

- (void)setCompletionUserActivity:(id)a3
{
}

- (void)setHasCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCompleted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int completed = a3;
}

- (void)setHasCanceledByService:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCanceledByService
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCanceledByService:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int canceledByService = a3;
}

- (void)setHasCanceled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCanceled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCanceled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int canceled = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)defaultTippingOptionsType
{
  return (Class)objc_opt_class();
}

@end