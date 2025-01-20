@interface CRKIDSMessageNotificationInfo
+ (id)instanceWithDictionary:(id)a3;
- (CRKIDSMessageNotificationInfo)initWithMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5;
- (NSDictionary)dictionaryValue;
- (NSDictionary)message;
- (NSString)senderAddress;
- (NSString)senderAppleID;
@end

@implementation CRKIDSMessageNotificationInfo

- (CRKIDSMessageNotificationInfo)initWithMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRKIDSMessageNotificationInfo;
  v11 = [(CRKIDSMessageNotificationInfo *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    message = v11->_message;
    v11->_message = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    senderAppleID = v11->_senderAppleID;
    v11->_senderAppleID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    senderAddress = v11->_senderAddress;
    v11->_senderAddress = (NSString *)v16;
  }
  return v11;
}

- (NSDictionary)dictionaryValue
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"Message";
  v3 = [(CRKIDSMessageNotificationInfo *)self message];
  v9[0] = v3;
  v8[1] = @"SenderAppleID";
  v4 = [(CRKIDSMessageNotificationInfo *)self senderAppleID];
  v9[1] = v4;
  v8[2] = @"SenderAddress";
  v5 = [(CRKIDSMessageNotificationInfo *)self senderAddress];
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"Message"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    v11 = [NSString stringWithUTF8String:"+[CRKIDSMessageNotificationInfo instanceWithDictionary:]"];
    uint64_t v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    uint64_t v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v10 handleFailureInFunction:v11, @"CRKListenForIDSMessagesRequest.m", 56, @"expected %@, got %@", v13, v15 file lineNumber description];
  }
  v6 = [v4 objectForKeyedSubscript:@"SenderAppleID"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    v17 = [NSString stringWithUTF8String:"+[CRKIDSMessageNotificationInfo instanceWithDictionary:]"];
    v18 = (objc_class *)objc_opt_class();
    objc_super v19 = NSStringFromClass(v18);
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    [v16 handleFailureInFunction:v17, @"CRKListenForIDSMessagesRequest.m", 57, @"expected %@, got %@", v19, v21 file lineNumber description];
  }
  v7 = [v4 objectForKeyedSubscript:@"SenderAddress"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    v23 = [NSString stringWithUTF8String:"+[CRKIDSMessageNotificationInfo instanceWithDictionary:]"];
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    [v22 handleFailureInFunction:v23, @"CRKListenForIDSMessagesRequest.m", 58, @"expected %@, got %@", v25, v27 file lineNumber description];
  }
  id v8 = (void *)[objc_alloc((Class)a1) initWithMessage:v5 senderAppleID:v6 senderAddress:v7];

  return v8;
}

- (NSDictionary)message
{
  return self->_message;
}

- (NSString)senderAppleID
{
  return self->_senderAppleID;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_senderAppleID, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end