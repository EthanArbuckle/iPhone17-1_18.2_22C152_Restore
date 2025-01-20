@interface CRKSendIDSMessageRequest
+ (BOOL)supportsSecureCoding;
- (CRKIDSMessageOptions)options;
- (CRKSendIDSMessageRequest)initWithCoder:(id)a3;
- (NSDictionary)message;
- (NSString)destinationAddress;
- (NSString)sourceAppleID;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationAddress:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSourceAppleID:(id)a3;
@end

@implementation CRKSendIDSMessageRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRKSendIDSMessageRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v9 encodeWithCoder:v4];
  v5 = [(CRKSendIDSMessageRequest *)self message];
  [v4 encodeObject:v5 forKey:@"message"];

  v6 = [(CRKSendIDSMessageRequest *)self destinationAddress];
  [v4 encodeObject:v6 forKey:@"destinationAddress"];

  v7 = [(CRKSendIDSMessageRequest *)self sourceAppleID];
  [v4 encodeObject:v7 forKey:@"sourceAppleID"];

  v8 = [(CRKSendIDSMessageRequest *)self options];
  [v4 encodeObject:v8 forKey:@"options"];
}

- (CRKSendIDSMessageRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CRKSendIDSMessageRequest;
  v5 = [(CATTaskRequest *)&v30 initWithCoder:v4];
  if (v5)
  {
    v29 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v29, "setWithObjects:", v28, v27, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSDictionary *)v15;

    v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"destinationAddress"];
    destinationAddress = v5->_destinationAddress;
    v5->_destinationAddress = (NSString *)v18;

    v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"sourceAppleID"];
    sourceAppleID = v5->_sourceAppleID;
    v5->_sourceAppleID = (NSString *)v21;

    v23 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"options"];
    options = v5->_options;
    v5->_options = (CRKIDSMessageOptions *)v24;
  }
  return v5;
}

- (NSString)sourceAppleID
{
  return self->_sourceAppleID;
}

- (void)setSourceAppleID:(id)a3
{
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (void)setDestinationAddress:(id)a3
{
}

- (NSDictionary)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (CRKIDSMessageOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);

  objc_storeStrong((id *)&self->_sourceAppleID, 0);
}

@end