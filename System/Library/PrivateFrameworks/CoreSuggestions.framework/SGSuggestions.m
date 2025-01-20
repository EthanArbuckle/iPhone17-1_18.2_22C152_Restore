@interface SGSuggestions
+ (BOOL)supportsSecureCoding;
- (NSArray)contacts;
- (NSArray)events;
- (NSArray)reminders;
- (NSArray)walletOrders;
- (NSArray)walletPasses;
- (SGSuggestions)initWithCoder:(id)a3;
- (SGSuggestions)initWithContacts:(id)a3 events:(id)a4 reminders:(id)a5 walletOrders:(id)a6 walletPasses:(id)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGSuggestions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletPasses, 0);
  objc_storeStrong((id *)&self->_walletOrders, 0);
  objc_storeStrong((id *)&self->_reminders, 0);
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

- (NSArray)walletPasses
{
  return self->_walletPasses;
}

- (NSArray)walletOrders
{
  return self->_walletOrders;
}

- (NSArray)reminders
{
  return self->_reminders;
}

- (NSArray)events
{
  return self->_events;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)encodeWithCoder:(id)a3
{
  contacts = self->_contacts;
  id v5 = a3;
  [v5 encodeObject:contacts forKey:@"contacts"];
  [v5 encodeObject:self->_events forKey:@"events"];
  [v5 encodeObject:self->_reminders forKey:@"reminders"];
  [v5 encodeObject:self->_walletOrders forKey:@"walletOrders"];
  [v5 encodeObject:self->_walletPasses forKey:@"walletPasses"];
}

- (SGSuggestions)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SGSuggestions;
  id v5 = [(SGSuggestions *)&v32 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"contacts"];
    contacts = v5->_contacts;
    v5->_contacts = (NSArray *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"events"];
    events = v5->_events;
    v5->_events = (NSArray *)v14;

    id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"reminders"];
    reminders = v5->_reminders;
    v5->_reminders = (NSArray *)v19;

    id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"walletOrders"];
    walletOrders = v5->_walletOrders;
    v5->_walletOrders = (NSArray *)v24;

    id v26 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "initWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"walletPasses"];
    walletPasses = v5->_walletPasses;
    v5->_walletPasses = (NSArray *)v29;
  }
  return v5;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"[SGSuggestions\n\t - contacts:%@\n\t- events: %@\n\t- reminders:%@\n\t- orders:%@\n\t- passes: %@\n]", self->_contacts, self->_events, self->_reminders, self->_walletOrders, self->_walletPasses];

  return v2;
}

- (SGSuggestions)initWithContacts:(id)a3 events:(id)a4 reminders:(id)a5 walletOrders:(id)a6 walletPasses:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SGSuggestions;
  uint64_t v17 = [(SGSuggestions *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contacts, a3);
    objc_storeStrong((id *)&v18->_events, a4);
    objc_storeStrong((id *)&v18->_reminders, a5);
    objc_storeStrong((id *)&v18->_walletOrders, a6);
    objc_storeStrong((id *)&v18->_walletPasses, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end