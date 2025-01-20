@interface HFHomeItem
- (HFHomeItem)init;
- (HFHomeItem)initWithHome:(id)a3;
- (HMHome)home;
- (NSString)debugDescription;
- (NSString)description;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HFHomeItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = [(HFHomeItem *)self home];

  if (!v4) {
    NSLog(&cfstr_HomeMustBeSetO.isa);
  }
  v5 = [(HFHomeItem *)self home];

  if (v5)
  {
    v6 = objc_alloc_init(HFMutableItemUpdateOutcome);
    v7 = [(HFHomeItem *)self home];
    v8 = [v7 name];
    [(HFMutableItemUpdateOutcome *)v6 setObject:v8 forKeyedSubscript:@"title"];

    v9 = [(HFHomeItem *)self home];
    v10 = objc_msgSend(v9, "hf_reorderableServicesList");
    [(HFMutableItemUpdateOutcome *)v6 setObject:v10 forKeyedSubscript:@"reorderableServiceItemList"];

    v11 = [(HFHomeItem *)self home];
    v12 = objc_msgSend(v11, "hf_reorderableActionSetsList");
    [(HFMutableItemUpdateOutcome *)v6 setObject:v12 forKeyedSubscript:@"reorderableActionSetItemList"];

    v13 = [(HFHomeItem *)self home];
    v14 = objc_msgSend(v13, "hf_reorderableCamerasList");
    [(HFMutableItemUpdateOutcome *)v6 setObject:v14 forKeyedSubscript:@"reorderableCameraItemList"];

    v15 = [(HFHomeItem *)self home];
    v16 = objc_msgSend(v15, "hf_reorderableRoomsList");
    [(HFMutableItemUpdateOutcome *)v6 setObject:v16 forKeyedSubscript:@"reorderableRoomItemList"];

    v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [(HFMutableItemUpdateOutcome *)v6 setObject:v17 forKeyedSubscript:@"dependentHomeKitClasses"];

    v18 = +[HFHomeKitDispatcher sharedDispatcher];
    v19 = [v18 homeManager];
    v20 = [v19 incomingHomeInvitations];
    uint64_t v21 = [v20 count];

    v22 = [NSNumber numberWithUnsignedInteger:v21];
    [(HFMutableItemUpdateOutcome *)v6 setObject:v22 forKeyedSubscript:@"incomingHomeInvitationsCount"];

    v23 = NSNumber;
    v24 = [(HFHomeItem *)self home];
    v25 = objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "hf_currentUserIsAdministrator"));
    [(HFMutableItemUpdateOutcome *)v6 setObject:v25 forKeyedSubscript:@"administrator"];

    [MEMORY[0x263F58190] futureWithResult:v6];
  }
  else
  {
    v26 = (void *)MEMORY[0x263F58190];
    objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    v6 = (HFMutableItemUpdateOutcome *)objc_claimAutoreleasedReturnValue();
    [v26 futureWithError:v6];
  v27 = };

  return v27;
}

- (HMHome)home
{
  return self->_home;
}

- (HFHomeItem)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFHomeItem;
  v6 = [(HFHomeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (HFHomeItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFHomeItem.m", 41, @"%s is unavailable; use %@ instead",
    "-[HFHomeItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFHomeItem *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(HFHomeItem *)self home];
  v7 = objc_msgSend(v6, "hf_prettyDescription");
  v8 = [v3 stringWithFormat:@"<%@: %p, %@>", v5, self, v7];

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(HFHomeItem *)self home];
  v7 = objc_msgSend(v6, "hf_prettyDescription");
  v8 = [(HFItem *)self latestResults];
  objc_super v9 = [v3 stringWithFormat:@"<%@: %p, %@ %@>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (void).cxx_destruct
{
}

@end