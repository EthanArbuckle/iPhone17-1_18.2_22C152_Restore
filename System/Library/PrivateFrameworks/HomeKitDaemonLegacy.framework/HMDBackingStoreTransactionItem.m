@interface HMDBackingStoreTransactionItem
- (HMDBackingStoreModelObject)change;
- (HMDBackingStoreTransactionItem)initWithChange:(id)a3 message:(id)a4;
- (HMFMessage)message;
- (NSSet)dependentUUIDs;
- (NSString)description;
@end

@implementation HMDBackingStoreTransactionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_dependentUUIDs, 0);
  objc_storeStrong((id *)&self->_change, 0);
}

- (HMFMessage)message
{
  return self->_message;
}

- (NSSet)dependentUUIDs
{
  return self->_dependentUUIDs;
}

- (HMDBackingStoreModelObject)change
{
  return self->_change;
}

- (NSString)description
{
  v3 = [(HMDBackingStoreTransactionItem *)self change];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v3 objectChangeType];
  if ((unint64_t)(v6 - 1) > 2) {
    v7 = @"unknown";
  }
  else {
    v7 = off_1E6A121D0[v6 - 1];
  }
  v8 = v7;
  v9 = [v3 uuid];
  v10 = [v3 parentUUID];
  v11 = [(HMDBackingStoreTransactionItem *)self message];
  v12 = [v11 name];
  v13 = [v4 stringWithFormat:@"<%@(%@) uuid:%@ parent:%@ message:%@>", v5, v8, v9, v10, v12];

  return (NSString *)v13;
}

- (HMDBackingStoreTransactionItem)initWithChange:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDBackingStoreTransactionItem;
  v9 = [(HMDBackingStoreTransactionItem *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_change, a3);
    uint64_t v11 = [v7 dependentUUIDs];
    dependentUUIDs = v10->_dependentUUIDs;
    v10->_dependentUUIDs = (NSSet *)v11;

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v14 = v8;
    if (isKindOfClass) {
      v14 = (void *)[v8 copy];
    }
    objc_storeStrong((id *)&v10->_message, v14);
    if (isKindOfClass) {

    }
    v15 = v10;
  }

  return v10;
}

@end