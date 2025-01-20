@interface FPTestingLookup
+ (BOOL)supportsSecureCoding;
- (FPTestingLookup)initWithCoder:(id)a3;
- (FPTestingLookup)initWithOperationIdentifier:(id)a3 itemIdentifier:(id)a4;
- (NSString)itemIdentifier;
- (int64_t)type;
- (unint64_t)side;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPTestingLookup

- (FPTestingLookup)initWithOperationIdentifier:(id)a3 itemIdentifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FPTestingLookup;
  v8 = [(FPTestingOperation *)&v11 initWithOperationIdentifier:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_itemIdentifier, a4);
  }

  return v9;
}

- (int64_t)type
{
  return 1;
}

- (unint64_t)side
{
  return [(NSString *)self->_itemIdentifier hasPrefix:@"__fp/fs/"] ^ 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FPTestingLookup;
  id v4 = a3;
  [(FPTestingOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemIdentifier, @"_itemIdentifier", v5.receiver, v5.super_class);
}

- (FPTestingLookup)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPTestingLookup;
  objc_super v5 = [(FPTestingOperation *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;
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

- (void).cxx_destruct
{
}

@end