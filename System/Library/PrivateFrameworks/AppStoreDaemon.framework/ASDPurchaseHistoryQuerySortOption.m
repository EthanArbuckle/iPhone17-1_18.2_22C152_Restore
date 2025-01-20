@interface ASDPurchaseHistoryQuerySortOption
+ (BOOL)supportsSecureCoding;
- (ASDPurchaseHistoryQuerySortOption)initWithCoder:(id)a3;
- (ASDPurchaseHistoryQuerySortOption)initWithName:(id)a3 ascending:(BOOL)a4;
- (BOOL)ascending;
- (NSString)name;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDPurchaseHistoryQuerySortOption

- (void).cxx_destruct
{
}

- (ASDPurchaseHistoryQuerySortOption)initWithName:(id)a3 ascending:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDPurchaseHistoryQuerySortOption;
  v7 = [(ASDPurchaseHistoryQuerySortOption *)&v11 init];
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic_copy(v7, v8, v6, 16);
    v9->_ascending = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"A"];
  [v5 encodeBool:self->_ascending forKey:@"B"];
}

- (ASDPurchaseHistoryQuerySortOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPurchaseHistoryQuerySortOption;
  id v5 = [(ASDPurchaseHistoryQuerySortOption *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"A"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_ascending = [v4 decodeBoolForKey:@"B"];
  }

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)ascending
{
  return self->_ascending;
}

@end