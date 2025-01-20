@interface CNContactRecentsReference
+ (BOOL)supportsSecureCoding;
- (CNContactRecentsReference)init;
- (CNContactRecentsReference)initWithCoder:(id)a3;
- (CNContactRecentsReference)initWithRecentContactID:(id)a3 domain:(id)a4;
- (NSNumber)recentContactID;
- (NSString)domain;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNContactRecentsReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_recentContactID, 0);
}

- (NSString)domain
{
  return self->_domain;
}

- (NSNumber)recentContactID
{
  return self->_recentContactID;
}

- (void)encodeWithCoder:(id)a3
{
  recentContactID = self->_recentContactID;
  id v5 = a3;
  [v5 encodeObject:recentContactID forKey:@"_recentContactID"];
  [v5 encodeObject:self->_domain forKey:@"_domain"];
}

- (CNContactRecentsReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNContactRecentsReference;
  id v5 = [(CNContactRecentsReference *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recentContactID"];
    uint64_t v7 = [v6 copy];
    recentContactID = v5->_recentContactID;
    v5->_recentContactID = (NSNumber *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_domain"];
    uint64_t v10 = [v9 copy];
    domain = v5->_domain;
    v5->_domain = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (CNContactRecentsReference)initWithRecentContactID:(id)a3 domain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactRecentsReference;
  v9 = [(CNContactRecentsReference *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recentContactID, a3);
    objc_storeStrong((id *)&v10->_domain, a4);
    v11 = v10;
  }

  return v10;
}

- (CNContactRecentsReference)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end