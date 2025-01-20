@interface CATInitializingServiceConnectionIDSMessage
+ (id)instanceWithDictionary:(id)a3;
- (CATInitializingIDSServiceConnectionMessageContent)content;
- (CATInitializingServiceConnectionIDSMessage)initWithInvitationIdentifier:(id)a3 content:(id)a4;
- (NSDictionary)dictionaryValue;
- (NSUUID)invitationIdentifier;
- (int64_t)messageType;
@end

@implementation CATInitializingServiceConnectionIDSMessage

- (CATInitializingServiceConnectionIDSMessage)initWithInvitationIdentifier:(id)a3 content:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATInitializingServiceConnectionIDSMessage;
  v9 = [(CATInitializingServiceConnectionIDSMessage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_content, a4);
    objc_storeStrong((id *)&v10->_invitationIdentifier, a3);
  }

  return v10;
}

- (int64_t)messageType
{
  return 101;
}

- (NSDictionary)dictionaryValue
{
  v13[3] = *MEMORY[0x263EF8340];
  v12[0] = @"Content";
  v3 = [(CATInitializingServiceConnectionIDSMessage *)self content];
  v4 = [v3 dictionaryValue];
  v13[0] = v4;
  v12[1] = @"ContentType";
  v5 = NSNumber;
  v6 = [(CATInitializingServiceConnectionIDSMessage *)self content];
  id v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "contentType"));
  v13[1] = v7;
  v12[2] = @"InvitationIdentifier";
  id v8 = [(CATInitializingServiceConnectionIDSMessage *)self invitationIdentifier];
  v9 = [v8 UUIDString];
  v13[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return (NSDictionary *)v10;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"ContentType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  id v8 = [v4 objectForKeyedSubscript:@"Content"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = objc_msgSend(v4, "cat_uuidForKey:", @"InvitationIdentifier");

  objc_super v12 = 0;
  if (v11)
  {
    if (v7 && v10 != 0)
    {
      uint64_t v14 = [v7 integerValue];
      if ((unint64_t)(v14 - 1) <= 3
        && ([(__objc2_class *)*off_2641DC778[v14 - 1] instanceWithDictionary:v10],
            (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v16 = (void *)v15;
        objc_super v12 = (void *)[objc_alloc((Class)a1) initWithInvitationIdentifier:v11 content:v15];
      }
      else
      {
        objc_super v12 = 0;
      }
    }
  }

  return v12;
}

- (NSUUID)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (CATInitializingIDSServiceConnectionMessageContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
}

@end