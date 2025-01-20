@interface IDSCryptionContext
- (BOOL)isEqual:(id)a3;
- (IDSCryptionContext)initWithGuid:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 service:(id)a8;
- (IDSPushToken)receivingPushToken;
- (IDSPushToken)sendingPushToken;
- (IDSURI)receivingURI;
- (IDSURI)sendingURI;
- (NSData)authenticatedData;
- (NSString)guid;
- (NSString)service;
- (id)description;
- (int64_t)messageType;
- (void)setMessageType:(int64_t)a3;
@end

@implementation IDSCryptionContext

- (IDSCryptionContext)initWithGuid:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 service:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)IDSCryptionContext;
  v18 = [(IDSCryptionContext *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_guid, a3);
    objc_storeStrong((id *)&v19->_sendingURI, a4);
    objc_storeStrong((id *)&v19->_sendingPushToken, a5);
    objc_storeStrong((id *)&v19->_receivingURI, a6);
    objc_storeStrong((id *)&v19->_receivingPushToken, a7);
    objc_storeStrong((id *)&v19->_service, a8);
  }

  return v19;
}

- (NSData)authenticatedData
{
  return [(NSString *)self->_service dataUsingEncoding:4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 guid];
    v7 = [(IDSCryptionContext *)self guid];
    if ([v6 isEqualToString:v7])
    {
      v8 = [v5 sendingURI];
      v9 = [(IDSCryptionContext *)self sendingURI];
      if ([v8 isEqual:v9])
      {
        v10 = [v5 sendingPushToken];
        v11 = [(IDSCryptionContext *)self sendingPushToken];
        if ([v10 isEqual:v11])
        {
          v12 = [v5 receivingURI];
          v20 = [(IDSCryptionContext *)self receivingURI];
          id v21 = v12;
          if ([v12 isEqual:v20])
          {
            v13 = [v5 receivingPushToken];
            v18 = [(IDSCryptionContext *)self receivingPushToken];
            v19 = v13;
            if ([v13 isEqual:v18])
            {
              id v17 = [v5 service];
              v14 = [(IDSCryptionContext *)self service];
              unsigned __int8 v15 = objc_msgSend(v17, "isEqualToString:");
            }
            else
            {
              unsigned __int8 v15 = 0;
            }
          }
          else
          {
            unsigned __int8 v15 = 0;
          }
        }
        else
        {
          unsigned __int8 v15 = 0;
        }
      }
      else
      {
        unsigned __int8 v15 = 0;
      }
    }
    else
    {
      unsigned __int8 v15 = 0;
    }
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(IDSCryptionContext *)self guid];
  id v5 = [(IDSCryptionContext *)self sendingURI];
  v6 = [(IDSCryptionContext *)self sendingPushToken];
  v7 = [(IDSCryptionContext *)self receivingURI];
  v8 = [(IDSCryptionContext *)self receivingPushToken];
  v9 = [(IDSCryptionContext *)self service];
  v10 = +[NSString stringWithFormat:@"<%@: %p { guid: %@, sendingURI: %@, sendingPushToken: %@, receivingURI: %@, receivingPushToken: %@ service: %@ }>", v3, self, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)guid
{
  return self->_guid;
}

- (IDSURI)sendingURI
{
  return self->_sendingURI;
}

- (IDSPushToken)sendingPushToken
{
  return self->_sendingPushToken;
}

- (IDSURI)receivingURI
{
  return self->_receivingURI;
}

- (IDSPushToken)receivingPushToken
{
  return self->_receivingPushToken;
}

- (NSString)service
{
  return self->_service;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_receivingPushToken, 0);
  objc_storeStrong((id *)&self->_receivingURI, 0);
  objc_storeStrong((id *)&self->_sendingPushToken, 0);
  objc_storeStrong((id *)&self->_sendingURI, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

@end