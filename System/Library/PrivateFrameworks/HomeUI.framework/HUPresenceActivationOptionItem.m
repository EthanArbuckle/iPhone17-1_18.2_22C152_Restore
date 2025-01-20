@interface HUPresenceActivationOptionItem
- (BOOL)isSelected;
- (HFSelectedUserCollection)selectedUsers;
- (HMHome)home;
- (HUPresenceActivationOptionItem)init;
- (HUPresenceActivationOptionItem)initWithEventType:(unint64_t)a3 selectedUsers:(id)a4 activationGranularity:(unint64_t)a5 style:(unint64_t)a6 home:(id)a7;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)_summaryTitle;
- (unint64_t)activationGranularity;
- (unint64_t)eventType;
- (unint64_t)style;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedUsers:(id)a3;
@end

@implementation HUPresenceActivationOptionItem

- (HUPresenceActivationOptionItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithEventType_selectedUsers_activationGranularity_style_home_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPresenceActivationOptionItem.m", 16, @"%s is unavailable; use %@ instead",
    "-[HUPresenceActivationOptionItem init]",
    v5);

  return 0;
}

- (HUPresenceActivationOptionItem)initWithEventType:(unint64_t)a3 selectedUsers:(id)a4 activationGranularity:(unint64_t)a5 style:(unint64_t)a6 home:(id)a7
{
  id v13 = a4;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HUPresenceActivationOptionItem;
  v15 = [(HUPresenceActivationOptionItem *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_eventType = a3;
    objc_storeStrong((id *)&v15->_selectedUsers, a4);
    v16->_activationGranularity = a5;
    v16->_style = a6;
    objc_storeStrong((id *)&v16->_home, a7);
  }

  return v16;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  unint64_t v5 = [(HUPresenceActivationOptionItem *)self style];
  if (v5 == 1)
  {
    v6 = _HULocalizedStringWithDefaultValue(@"HUPresenceActivationOptionSingleUserTitle", @"HUPresenceActivationOptionSingleUserTitle", 1);
    v7 = (void *)MEMORY[0x1E4F68980];
    v8 = (void *)MEMORY[0x1E4F68AB8];
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HUPresenceActivationOptionItem isSelected](self, "isSelected"));
    v7 = (void *)MEMORY[0x1E4F68AB8];
    v8 = (void *)MEMORY[0x1E4F68B40];
  }
  [v4 setObject:v6 forKeyedSubscript:*v8];

  v9 = [(HUPresenceActivationOptionItem *)self _summaryTitle];
  [v4 setObject:v9 forKeyedSubscript:*v7];

LABEL_6:
  v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v10;
}

- (id)_summaryTitle
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F69408]);
  objc_msgSend(v3, "setActivationGranularity:", -[HUPresenceActivationOptionItem activationGranularity](self, "activationGranularity"));
  objc_msgSend(v3, "setLocationEventType:", -[HUPresenceActivationOptionItem eventType](self, "eventType"));
  v4 = [(HUPresenceActivationOptionItem *)self selectedUsers];
  [v3 setUsers:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F69410]);
  v6 = [(HUPresenceActivationOptionItem *)self home];
  v7 = (void *)[v5 initWithHome:v6];

  [v7 setStyle:1];
  [v7 setNameType:1];
  v8 = [v7 stringForPresenceEventBuilder:v3];

  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (unint64_t)activationGranularity
{
  return self->_activationGranularity;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (HFSelectedUserCollection)selectedUsers
{
  return self->_selectedUsers;
}

- (void)setSelectedUsers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedUsers, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end