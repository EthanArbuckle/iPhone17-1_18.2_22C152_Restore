@interface APAdRequestContents
- (APAdRequestContents)initWithContext:(id)a3 contentTypes:(id)a4 deliverEntireBatch:(BOOL)a5;
- (APClientInfo)clientInfo;
- (APContext)apContext;
- (BOOL)deliverEntireBatch;
- (NSArray)contentTypes;
@end

@implementation APAdRequestContents

- (APAdRequestContents)initWithContext:(id)a3 contentTypes:(id)a4 deliverEntireBatch:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)APAdRequestContents;
  v11 = [(APAdRequestContents *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_apContext, a3);
    objc_storeStrong((id *)&v12->_contentTypes, a4);
    v12->_deliverEntireBatch = a5;
    uint64_t v19 = objc_msgSend_activeClientInfo(MEMORY[0x263F20B50], v13, v14, v15, v16, v17, v18);
    clientInfo = v12->_clientInfo;
    v12->_clientInfo = (APClientInfo *)v19;
  }
  return v12;
}

- (APContext)apContext
{
  return self->_apContext;
}

- (NSArray)contentTypes
{
  return self->_contentTypes;
}

- (APClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (BOOL)deliverEntireBatch
{
  return self->_deliverEntireBatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_apContext, 0);
}

@end