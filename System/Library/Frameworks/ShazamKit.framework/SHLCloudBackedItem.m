@interface SHLCloudBackedItem
- (CKRecord)record;
- (SHLCloudBackedItem)initWithRecord:(id)a3;
@end

@implementation SHLCloudBackedItem

- (SHLCloudBackedItem)initWithRecord:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHLCloudBackedItem;
  v6 = [(SHLCloudBackedItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_record, a3);
  }

  return v7;
}

- (CKRecord)record
{
  return self->_record;
}

- (void).cxx_destruct
{
}

@end