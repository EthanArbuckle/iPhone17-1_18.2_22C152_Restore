@interface HFEventTriggerBuilderTimeInterface
- (HFTimeEventBuilder)eventBuilder;
- (NSArray)recurrences;
- (NSString)name;
- (NSTimeZone)timeZone;
- (void)copyCurrentStateFromTriggerBuilder:(id)a3;
- (void)setEventBuilder:(id)a3;
- (void)setRecurrences:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)triggerEnabledStateDidChange:(BOOL)a3;
@end

@implementation HFEventTriggerBuilderTimeInterface

- (NSString)name
{
  v2 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (HFTimeEventBuilder)eventBuilder
{
  if (!self->_eventBuilder
    || ([(HFEventTriggerBuilderInterface *)self triggerBuilder],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 eventBuilders],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 containsObject:self->_eventBuilder],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    v6 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
    v7 = [v6 eventBuilders];
    objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_146_0);
    v8 = (HFTimeEventBuilder *)objc_claimAutoreleasedReturnValue();
    eventBuilder = self->_eventBuilder;
    self->_eventBuilder = v8;
  }
  v10 = self->_eventBuilder;
  return v10;
}

uint64_t __50__HFEventTriggerBuilderTimeInterface_eventBuilder__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26C121548];
}

- (void)setEventBuilder:(id)a3
{
  id v4 = a3;
  char v5 = self->_eventBuilder;
  v6 = (HFTimeEventBuilder *)v4;
  v13 = v6;
  if (v5 == v6)
  {

    eventBuilder = v13;
LABEL_8:

    v8 = v13;
    goto LABEL_9;
  }
  if (!v5)
  {

    goto LABEL_7;
  }
  char v7 = [(HFTimeEventBuilder *)v5 isEqual:v6];

  v8 = v13;
  if ((v7 & 1) == 0)
  {
LABEL_7:
    v10 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
    [v10 removeEventBuilder:self->_eventBuilder];

    v11 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
    [v11 addEventBuilder:v13];

    v12 = v13;
    eventBuilder = self->_eventBuilder;
    self->_eventBuilder = v12;
    goto LABEL_8;
  }
LABEL_9:
}

- (NSArray)recurrences
{
  v2 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  v3 = [v2 recurrences];

  return (NSArray *)v3;
}

- (void)setRecurrences:(id)a3
{
  id v4 = a3;
  id v5 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  [v5 setRecurrences:v4];
}

- (void)copyCurrentStateFromTriggerBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  v6 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  [v6 setName:v5];

  char v7 = [v4 eventBuilder];
  [(HFEventTriggerBuilderTimeInterface *)self setEventBuilder:v7];

  v8 = [v4 recurrences];
  [(HFEventTriggerBuilderTimeInterface *)self setRecurrences:v8];

  id v9 = [v4 timeZone];

  [(HFEventTriggerBuilderTimeInterface *)self setTimeZone:v9];
}

- (void)triggerEnabledStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  id v5 = [(HFEventTriggerBuilderTimeInterface *)self eventBuilder];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v10 = v6;

  char v7 = v10;
  if (v3)
  {
    if (v10)
    {
      v8 = [(HFEventTriggerBuilderTimeInterface *)self recurrences];
      uint64_t v9 = [v8 count];

      char v7 = v10;
      if (!v9)
      {
        [v10 updateBaseFireDateForTrigger];
        char v7 = v10;
      }
    }
  }
}

- (NSTimeZone)timeZone
{
  return self->timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timeZone, 0);
  objc_storeStrong((id *)&self->_eventBuilder, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
}

@end