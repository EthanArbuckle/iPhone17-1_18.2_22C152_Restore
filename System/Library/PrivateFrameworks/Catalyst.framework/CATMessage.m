@interface CATMessage
+ (BOOL)supportsSecureCoding;
- (CATMessage)init;
- (CATMessage)initWithCoder:(id)a3;
- (NSUUID)messageUUID;
- (id)cat_assertion;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCat_assertion:(id)a3;
- (void)setMessageUUID:(id)a3;
@end

@implementation CATMessage

- (CATMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)CATMessage;
  v2 = [(CATMessage *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    messageUUID = v2->_messageUUID;
    v2->_messageUUID = (NSUUID *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATMessage;
  v5 = [(CATMessage *)&v10 init];
  if (v5)
  {
    objc_super v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"messageUUID"];
    messageUUID = v5->_messageUUID;
    v5->_messageUUID = (NSUUID *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CATMessage *)self messageUUID];
  [v4 encodeObject:v5 forKey:@"messageUUID"];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CATMessage *)self messageUUID];
  objc_super v6 = [v5 UUIDString];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: { messageUUID = '%@' }>", v4, v6];

  return v7;
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (void)setMessageUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)cat_assertion
{
  return objc_getAssociatedObject(self, "cat_assertion");
}

- (void)setCat_assertion:(id)a3
{
}

@end