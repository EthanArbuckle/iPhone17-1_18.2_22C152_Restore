@interface AMSEngagementSyncResult
+ (BOOL)supportsSecureCoding;
+ (id)archiveClasses;
- (AMSEngagementSyncResult)initWithCoder:(id)a3;
- (NSArray)actions;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
@end

@implementation AMSEngagementSyncResult

+ (id)archiveClasses
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementSyncResult *)self actions];
  [v4 encodeObject:v5 forKey:@"kCodingKeyActions"];
}

- (AMSEngagementSyncResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSEngagementSyncResult;
  id v5 = [(AMSEngagementSyncResult *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"kCodingKeyActions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v7;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end