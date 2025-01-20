@interface IDSMPConversationGroupEntry
+ (id)entryFromPublicDataRepresentation:(id)a3 error:(id *)a4;
- (ENGroupID)groupID;
- (IDSMPConversationGroupEntry)initWithStableGroupID:(id)a3 groupServerEntry:(id)a4;
- (NSData)data;
- (NSData)forwardingTicket;
- (NSData)publicKeyData;
- (NSData)signature;
- (id)description;
- (id)publicDataRepresentationWithError:(id *)a3;
- (void)setData:(id)a3;
- (void)setForwardingTicket:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setPublicKeyData:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation IDSMPConversationGroupEntry

- (IDSMPConversationGroupEntry)initWithStableGroupID:(id)a3 groupServerEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IDSMPConversationGroupEntry;
  v8 = [(IDSMPConversationGroupEntry *)&v21 init];
  if (v8)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:@"key"];
    publicKeyData = v8->_publicKeyData;
    v8->_publicKeyData = (NSData *)v9;

    uint64_t v11 = [v7 objectForKeyedSubscript:@"data"];
    data = v8->_data;
    v8->_data = (NSData *)v11;

    uint64_t v13 = [v7 objectForKeyedSubscript:@"signature"];
    signature = v8->_signature;
    v8->_signature = (NSData *)v13;

    uint64_t v15 = [v7 objectForKeyedSubscript:@"forwarding-sig"];
    forwardingTicket = v8->_forwardingTicket;
    v8->_forwardingTicket = (NSData *)v15;

    v17 = [v7 objectForKeyedSubscript:@"version"];
    v18 = (ENGroupID *)objc_msgSend(objc_alloc((Class)ENGroupID), "initWithStableGroupID:generation:", v6, objc_msgSend(v17, "intValue"));
    groupID = v8->_groupID;
    v8->_groupID = v18;
  }
  return v8;
}

+ (id)entryFromPublicDataRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:a4];
  if (v6)
  {
    id v7 = objc_alloc_init(IDSMPConversationGroupEntry);
    v8 = [v6 objectForKeyedSubscript:@"data"];
    [(IDSMPConversationGroupEntry *)v7 setData:v8];

    uint64_t v9 = [v6 objectForKeyedSubscript:@"key"];
    [(IDSMPConversationGroupEntry *)v7 setPublicKeyData:v9];

    v10 = [v6 objectForKeyedSubscript:@"signature"];
    [(IDSMPConversationGroupEntry *)v7 setSignature:v10];

    uint64_t v11 = [v6 objectForKeyedSubscript:@"forwarding-sig"];
    [(IDSMPConversationGroupEntry *)v7 setForwardingTicket:v11];

    id v12 = objc_alloc((Class)ENGroupID);
    uint64_t v13 = [v6 objectForKeyedSubscript:@"groupID"];
    id v14 = [v12 initWithDataRepresentation:v13];
    [(IDSMPConversationGroupEntry *)v7 setGroupID:v14];
  }
  else
  {
    uint64_t v15 = +[ENLog groupContext];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10071164C();
    }

    id v7 = 0;
  }

  return v7;
}

- (id)publicDataRepresentationWithError:(id *)a3
{
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [(IDSMPConversationGroupEntry *)self publicKeyData];
  [v5 setObject:v6 forKeyedSubscript:@"key"];

  id v7 = [(IDSMPConversationGroupEntry *)self data];
  [v5 setObject:v7 forKeyedSubscript:@"data"];

  v8 = [(IDSMPConversationGroupEntry *)self signature];
  [v5 setObject:v8 forKeyedSubscript:@"signature"];

  uint64_t v9 = [(IDSMPConversationGroupEntry *)self groupID];
  v10 = [v9 dataRepresentation];
  [v5 setObject:v10 forKeyedSubscript:@"groupID"];

  uint64_t v11 = [(IDSMPConversationGroupEntry *)self forwardingTicket];
  [v5 setObject:v11 forKeyedSubscript:@"forwarding-sig"];

  id v12 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:a3];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    uint64_t v15 = +[ENLog groupContext];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_1007116C8((uint64_t *)a3, (uint64_t)v5, v15);
    }
  }

  return v13;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IDSMPConversationGroupEntry *)self publicKeyData];
  id v5 = [(IDSMPConversationGroupEntry *)self groupID];
  id v6 = [(IDSMPConversationGroupEntry *)self data];
  id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 length]);
  v8 = [(IDSMPConversationGroupEntry *)self signature];
  uint64_t v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 length]);
  v10 = +[NSString stringWithFormat:@"<%@ %p key: %@, groupID: %@, data.length: %@, signature.length: %@>", v3, self, v4, v5, v7, v9];

  return v10;
}

- (NSData)publicKeyData
{
  return self->_publicKeyData;
}

- (void)setPublicKeyData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (ENGroupID)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSData)forwardingTicket
{
  return self->_forwardingTicket;
}

- (void)setForwardingTicket:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardingTicket, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_publicKeyData, 0);
}

@end