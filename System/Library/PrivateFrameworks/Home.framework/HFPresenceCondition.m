@interface HFPresenceCondition
- (HFPresenceCondition)initWithPredicate:(id)a3;
- (HFPresenceCondition)initWithPresenceEvent:(id)a3;
- (HMPresenceEvent)presenceEvent;
- (id)hf_naturalLanguageSummaryWithOptions:(id)a3;
- (void)setPresenceEvent:(id)a3;
@end

@implementation HFPresenceCondition

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  id v5 = a3;
  v6 = [(HFPresenceCondition *)self presenceEvent];
  v7 = [[HFPresenceEventBuilder alloc] initWithEvent:v6];
  v8 = [(HFPresenceEventBuilder *)v7 users];
  v9 = (void *)[v8 type];

  uint64_t v10 = [(HFPresenceEventBuilder *)v7 locationEventType];
  if (v10 == 2)
  {
    if (v9 != (void *)2)
    {
      if (v9 != (void *)1)
      {
        if (!v9)
        {
          v11 = @"_noUserAtHome";
          goto LABEL_11;
        }
        goto LABEL_14;
      }
      v14 = @"_currentUserNotAtHome";
      goto LABEL_23;
    }
    v13 = @"_specificUsersNotAtHome";
    goto LABEL_18;
  }
  if (v10 == 1)
  {
    if (v9 != (void *)2)
    {
      if (v9 != (void *)1)
      {
        if (!v9)
        {
          v11 = @"_anyUserAtHome";
LABEL_11:
          v12 = [@"HFConditionNamePresence" stringByAppendingString:v11];
          goto LABEL_27;
        }
LABEL_14:
        v9 = 0;
        v12 = @"HFConditionNamePresence";
        goto LABEL_27;
      }
      v14 = @"_currentUserAtHome";
LABEL_23:
      v12 = [@"HFConditionNamePresence" stringByAppendingString:v14];
      goto LABEL_24;
    }
    v13 = @"_specificUsersAtHome";
LABEL_18:
    v12 = [@"HFConditionNamePresence" stringByAppendingString:v13];
    goto LABEL_19;
  }
  v12 = @"HFConditionNamePresence";
  if (v9 != (void *)2) {
    goto LABEL_24;
  }
LABEL_19:
  v15 = [(HFPresenceCondition *)self presenceEvent];
  v16 = [v15 users];
  uint64_t v17 = [v16 count];

  if (v17 != 1)
  {
LABEL_24:
    v9 = 0;
    goto LABEL_27;
  }
  v18 = [HFUserNameFormatter alloc];
  v19 = [v5 home];
  v20 = [(HFUserNameFormatter *)v18 initWithHome:v19];

  [(HFUserNameFormatter *)v20 setStyle:1];
  v21 = [v6 users];
  uint64_t v22 = [v21 count];

  if (v22 == 1)
  {
    uint64_t v36 = [(__CFString *)v12 stringByAppendingString:@"_oneUserFormat"];

    v23 = [v5 home];
    v24 = [v6 users];
    v25 = [v24 firstObject];
    v26 = objc_msgSend(v23, "hf_handleForUser:", v25);

    v9 = [(HFUserNameFormatter *)v20 stringForObjectValue:v26];

    v12 = (__CFString *)v36;
  }
  else
  {
    v9 = 0;
  }

LABEL_27:
  if ([v5 formattingStyle] != 3)
  {
    uint64_t v27 = [(__CFString *)v12 stringByAppendingString:@"_short"];

    v12 = (__CFString *)v27;
  }
  uint64_t v28 = _HFLocalizedStringWithDefaultValue(v12, 0, 0);
  if (v28)
  {
    v29 = (void *)v28;
    if (v9)
    {
      id v37 = 0;
      uint64_t v30 = [NSString stringWithValidatedFormat:v28, @"%@", &v37, v9 validFormatSpecifiers error];
      id v31 = v37;

      if (!v30)
      {
        v32 = NSStringFromSelector(a2);
        NSLog(&cfstr_CouldnTLocaliz.isa, v32, v31);
      }
      v29 = (void *)v30;
    }
  }
  else
  {
    v29 = _HFLocalizedStringWithDefaultValue(@"HFConditionNamePresence_Custom", @"HFConditionNamePresence_Custom", 1);
  }
  if ([v5 formattingContext] != 5)
  {
    uint64_t v33 = objc_msgSend(v29, "hf_stringByCapitalizingFirstWord");

    v29 = (void *)v33;
  }
  v34 = [[HFConditionUISummary alloc] initWithCondition:self title:v29 description:0];

  return v34;
}

- (HFPresenceCondition)initWithPredicate:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HFPresenceCondition;
  id v5 = [(HFCondition *)&v26 initWithPredicate:v4];
  if (!v5) {
    goto LABEL_20;
  }
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (!v8) {
    goto LABEL_10;
  }
  v9 = [v8 leftExpression];
  if ([v9 expressionType] != 3) {
    goto LABEL_9;
  }
  uint64_t v10 = [v8 leftExpression];
  v11 = [v10 keyPath];
  int v12 = [v11 isEqualToString:*MEMORY[0x263F0D4A8]];

  if (v12)
  {
    v9 = [v8 rightExpression];
    if ([v9 expressionType])
    {
LABEL_9:

      goto LABEL_10;
    }
    v14 = [v8 rightExpression];
    v15 = [v14 constantValue];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v17 = objc_opt_class();
    v18 = [v8 rightExpression];
    v19 = [v18 constantValue];
    if (v19)
    {
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
      v21 = v19;
      if (v20) {
        goto LABEL_19;
      }
      uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
      v23 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v22 handleFailureInFunction:v23, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v17, objc_opt_class() file lineNumber description];
    }
    v21 = 0;
LABEL_19:

    presenceEvent = v5->_presenceEvent;
    v5->_presenceEvent = v21;

LABEL_20:
    v13 = v5;
    goto LABEL_21;
  }
LABEL_10:

  v13 = 0;
LABEL_21:

  return v13;
}

- (HFPresenceCondition)initWithPresenceEvent:(id)a3
{
  id v4 = [MEMORY[0x263F0E310] predicateForEvaluatingTriggerWithPresence:a3];
  id v5 = [(HFPresenceCondition *)self initWithPredicate:v4];

  return v5;
}

- (HMPresenceEvent)presenceEvent
{
  return self->_presenceEvent;
}

- (void)setPresenceEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end