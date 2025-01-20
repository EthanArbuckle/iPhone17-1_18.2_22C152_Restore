@interface AAPendingIDSMessage
- (NSData)data;
- (NSString)senderHandle;
- (id)initCustodianMessageFrom:(id)a3 data:(id)a4;
- (id)initInheritanceMessageFrom:(id)a3 data:(id)a4;
- (int64_t)type;
@end

@implementation AAPendingIDSMessage

- (id)initInheritanceMessageFrom:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AAPendingIDSMessage;
  v8 = [(AAPendingIDSMessage *)&v13 init];
  if (v8)
  {
    objc_msgSend(NSString, "aa_handleForIDSDestination:", v6);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    senderHandle = v8->_senderHandle;
    v8->_senderHandle = v9;
    v11 = v9;

    objc_storeStrong((id *)&v8->_data, a4);
    v8->_type = 1;
  }

  return v8;
}

- (id)initCustodianMessageFrom:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AAPendingIDSMessage;
  v8 = [(AAPendingIDSMessage *)&v13 init];
  if (v8)
  {
    objc_msgSend(NSString, "aa_handleForIDSDestination:", v6);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    senderHandle = v8->_senderHandle;
    v8->_senderHandle = v9;
    v11 = v9;

    objc_storeStrong((id *)&v8->_data, a4);
    v8->_type = 0;
  }

  return v8;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_senderHandle, 0);
}

@end