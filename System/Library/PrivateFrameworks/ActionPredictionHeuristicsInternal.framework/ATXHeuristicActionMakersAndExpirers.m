@interface ATXHeuristicActionMakersAndExpirers
+ (BOOL)supportsSecureCoding;
- (ATXHeuristicActionMakersAndExpirers)initWithActionMakers:(id)a3 expirers:(id)a4;
- (ATXHeuristicActionMakersAndExpirers)initWithCoder:(id)a3;
- (NSArray)actionMakers;
- (NSSet)expirers;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXHeuristicActionMakersAndExpirers

- (ATXHeuristicActionMakersAndExpirers)initWithActionMakers:(id)a3 expirers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXHeuristicActionMakersAndExpirers;
  v9 = [(ATXHeuristicActionMakersAndExpirers *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionMakers, a3);
    objc_storeStrong((id *)&v10->_expirers, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  actionMakers = self->_actionMakers;
  id v5 = a3;
  [v5 encodeObject:actionMakers forKey:@"actionMakers"];
  [v5 encodeObject:self->_expirers forKey:@"expirers"];
}

- (ATXHeuristicActionMakersAndExpirers)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"actionMakers"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  objc_super v12 = [v5 decodeObjectOfClasses:v11 forKey:@"expirers"];

  v13 = [(ATXHeuristicActionMakersAndExpirers *)self initWithActionMakers:v8 expirers:v12];
  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<Actions: %@ Expirers: %@>", self->_actionMakers, self->_expirers];
}

- (NSArray)actionMakers
{
  return self->_actionMakers;
}

- (NSSet)expirers
{
  return self->_expirers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirers, 0);

  objc_storeStrong((id *)&self->_actionMakers, 0);
}

@end