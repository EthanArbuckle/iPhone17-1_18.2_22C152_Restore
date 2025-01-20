@interface HFScheduleTypeItem
+ (unint64_t)sortOrderForType:(unint64_t)a3;
- (BOOL)isSelected;
- (HFScheduleBuilder)scheduleBuilder;
- (HFScheduleTypeItem)initWithScheduleType:(unint64_t)a3 scheduleBuilder:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)type;
- (void)setSelected:(BOOL)a3;
@end

@implementation HFScheduleTypeItem

- (HFScheduleTypeItem)initWithScheduleType:(unint64_t)a3 scheduleBuilder:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFScheduleTypeItem;
  v8 = [(HFScheduleTypeItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_scheduleBuilder, a4);
    v9->_selected = [v7 estimatedScheduleType] == a3;
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v15[5] = *MEMORY[0x263EF8340];
  unint64_t v4 = +[HFScheduleTypeItem sortOrderForType:[(HFScheduleTypeItem *)self type]];
  v14[0] = @"title";
  v5 = +[HFScheduleUtilities localizedStringFromScheduleType:[(HFScheduleTypeItem *)self type]];
  v15[0] = v5;
  v14[1] = @"HFResultDisplayAccessibilityIDKey";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"Home.Schedule.Type.%lu", self->_type);
  v15[1] = v6;
  v14[2] = @"selected";
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HFScheduleTypeItem isSelected](self, "isSelected"));
  v15[2] = v7;
  v14[3] = @"manualSortKey";
  v8 = [NSNumber numberWithUnsignedInteger:v4];
  v14[4] = @"shouldDisableForNonAdminUsers";
  v15[3] = v8;
  v15[4] = MEMORY[0x263EFFA80];
  v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];

  v10 = (void *)MEMORY[0x263F58190];
  objc_super v11 = +[HFItemUpdateOutcome outcomeWithResults:v9];
  v12 = [v10 futureWithResult:v11];

  return v12;
}

+ (unint64_t)sortOrderForType:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 >= 3)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    id v7 = [NSNumber numberWithUnsignedInteger:v3];
    [v6 handleFailureInMethod:a2, a1, @"HFScheduleTypeItemProvider.m", 53, @"Unknown schedule type [%@]", v7 object file lineNumber description];

    return 0;
  }
  return v3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (HFScheduleBuilder)scheduleBuilder
{
  return self->_scheduleBuilder;
}

- (void).cxx_destruct
{
}

@end