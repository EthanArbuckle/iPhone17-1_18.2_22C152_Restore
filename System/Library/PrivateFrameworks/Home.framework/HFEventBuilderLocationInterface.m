@interface HFEventBuilderLocationInterface
- (BOOL)isCustomLocationTrigger;
- (BOOL)locationCanBeEdited;
- (HFLocationEventBuilder)locationEventBuilder;
- (void)setLocationEventBuilder:(id)a3;
@end

@implementation HFEventBuilderLocationInterface

- (void)setLocationEventBuilder:(id)a3
{
  id v4 = a3;
  v5 = self->_locationEventBuilder;
  v6 = (HFLocationEventBuilder *)v4;
  v13 = v6;
  if (v5 == v6)
  {

    locationEventBuilder = v13;
LABEL_8:

    v8 = v13;
    goto LABEL_9;
  }
  if (!v5)
  {

    goto LABEL_7;
  }
  char v7 = [(HFLocationEventBuilder *)v5 isEqual:v6];

  v8 = v13;
  if ((v7 & 1) == 0)
  {
LABEL_7:
    v10 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
    [v10 removeEventBuilder:self->_locationEventBuilder];

    v11 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
    [v11 addEventBuilder:v13];

    v12 = v13;
    locationEventBuilder = self->_locationEventBuilder;
    self->_locationEventBuilder = v12;
    goto LABEL_8;
  }
LABEL_9:
}

- (HFLocationEventBuilder)locationEventBuilder
{
  if (!self->_locationEventBuilder
    || ([(HFEventTriggerBuilderInterface *)self triggerBuilder],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 eventBuilders],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 containsObject:self->_locationEventBuilder],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    v6 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
    char v7 = [v6 eventBuilders];
    objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_123_2);
    v8 = (HFLocationEventBuilder *)objc_claimAutoreleasedReturnValue();
    locationEventBuilder = self->_locationEventBuilder;
    self->_locationEventBuilder = v8;
  }
  v10 = self->_locationEventBuilder;
  return v10;
}

uint64_t __55__HFEventBuilderLocationInterface_locationEventBuilder__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26C10A780];
}

- (BOOL)isCustomLocationTrigger
{
  objc_opt_class();
  v3 = [(HFEventBuilderLocationInterface *)self locationEventBuilder];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
    char v7 = [v6 home];
    int v8 = [v5 isRegionAtHome:v7] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)locationCanBeEdited
{
  v2 = [(HFEventTriggerBuilderInterface *)self triggerBuilder];
  char v3 = [v2 isShortcutOwned] ^ 1;

  return v3;
}

- (void).cxx_destruct
{
}

@end