@interface CNChangeHistoryClearRequest
+ (BOOL)supportsSecureCoding;
- (CNChangeHistoryAnchor)toChangeAnchor;
- (CNChangeHistoryClearRequest)initWithClientIdentifier:(id)a3;
- (CNChangeHistoryClearRequest)initWithCoder:(id)a3;
- (NSArray)contactChangeIDs;
- (NSArray)groupChangeIDs;
- (NSString)clientIdentifier;
- (NSString)containerIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContactChangeIDs:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setGroupChangeIDs:(id)a3;
- (void)setToChangeAnchor:(id)a3;
@end

@implementation CNChangeHistoryClearRequest

- (CNChangeHistoryClearRequest)initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNChangeHistoryClearRequest;
  v5 = [(CNChangeHistoryClearRequest *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryClearRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNChangeHistoryClearRequest;
  v5 = [(CNChangeHistoryClearRequest *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientIdentifier"];
    uint64_t v7 = [v6 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_toChangeAnchor"];
    uint64_t v10 = [v9 copy];
    toChangeAnchor = v5->_toChangeAnchor;
    v5->_toChangeAnchor = (CNChangeHistoryAnchor *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_contactChangeIDs"];
    uint64_t v16 = [v15 copy];
    contactChangeIDs = v5->_contactChangeIDs;
    v5->_contactChangeIDs = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v21 = [v4 decodeObjectOfClasses:v20 forKey:@"_groupChangeIDs"];
    uint64_t v22 = [v21 copy];
    groupChangeIDs = v5->_groupChangeIDs;
    v5->_groupChangeIDs = (NSArray *)v22;

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_containerIdentifier"];
    uint64_t v25 = [v24 copy];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v25;

    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  clientIdentifier = self->_clientIdentifier;
  id v5 = a3;
  [v5 encodeObject:clientIdentifier forKey:@"_clientIdentifier"];
  [v5 encodeObject:self->_toChangeAnchor forKey:@"_toChangeAnchor"];
  [v5 encodeObject:self->_contactChangeIDs forKey:@"_contactChangeIDs"];
  [v5 encodeObject:self->_groupChangeIDs forKey:@"_groupChangeIDs"];
  [v5 encodeObject:self->_containerIdentifier forKey:@"_containerIdentifier"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNChangeHistoryClearRequest *)self clientIdentifier];
  id v5 = (id)[v3 appendName:@"clientIdentifier" object:v4];

  uint64_t v6 = [(CNChangeHistoryClearRequest *)self toChangeAnchor];
  id v7 = (id)[v3 appendName:@"toChangeAnchor" object:v6];

  v8 = [(CNChangeHistoryClearRequest *)self contactChangeIDs];
  id v9 = (id)[v3 appendName:@"contactChangeIDs" object:v8];

  uint64_t v10 = [(CNChangeHistoryClearRequest *)self groupChangeIDs];
  id v11 = (id)[v3 appendName:@"groupChangeIDs" object:v10];

  v12 = [(CNChangeHistoryClearRequest *)self containerIdentifier];
  id v13 = (id)[v3 appendName:@"containerIdentifier" object:v12];

  v14 = [v3 build];

  return v14;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (CNChangeHistoryAnchor)toChangeAnchor
{
  return self->_toChangeAnchor;
}

- (void)setToChangeAnchor:(id)a3
{
}

- (NSArray)contactChangeIDs
{
  return self->_contactChangeIDs;
}

- (void)setContactChangeIDs:(id)a3
{
}

- (NSArray)groupChangeIDs
{
  return self->_groupChangeIDs;
}

- (void)setGroupChangeIDs:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_groupChangeIDs, 0);
  objc_storeStrong((id *)&self->_contactChangeIDs, 0);
  objc_storeStrong((id *)&self->_toChangeAnchor, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end