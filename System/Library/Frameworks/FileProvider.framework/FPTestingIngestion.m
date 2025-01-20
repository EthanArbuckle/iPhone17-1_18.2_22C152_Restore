@interface FPTestingIngestion
+ (BOOL)supportsSecureCoding;
- (FPTestingIngestion)initWithCoder:(id)a3;
- (FPTestingIngestion)initWithOperationIdentifier:(id)a3 itemIdentifier:(id)a4 item:(id)a5;
- (NSFileProviderItem)item;
- (NSString)itemIdentifier;
- (int64_t)type;
- (unint64_t)side;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPTestingIngestion

- (FPTestingIngestion)initWithOperationIdentifier:(id)a3 itemIdentifier:(id)a4 item:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FPTestingIngestion;
  v11 = [(FPTestingOperation *)&v14 initWithOperationIdentifier:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_itemIdentifier, a4);
    objc_storeStrong((id *)&v12->_item, a5);
  }

  return v12;
}

- (int64_t)type
{
  return 0;
}

- (unint64_t)side
{
  return [(NSString *)self->_itemIdentifier hasPrefix:@"__fp/fs/"] ^ 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FPTestingIngestion;
  id v4 = a3;
  [(FPTestingOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemIdentifier, @"_itemIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_item forKey:@"_item"];
}

- (FPTestingIngestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPTestingIngestion;
  objc_super v5 = [(FPTestingOperation *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_item"];
    item = v5->_item;
    v5->_item = (NSFileProviderItem *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSFileProviderItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end