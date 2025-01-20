@interface IMDiMessageIDSTrustedData
- (BOOL)isFromMe;
- (BOOL)isFromSnapTrustedSender;
- (BOOL)isFromTrustedSender;
- (IMDiMessageIDSTrustedData)initWithTopLevelMessage:(id)a3 fromPushID:(id)a4 messageContext:(id)a5;
- (NSData)fromToken;
- (NSString)fromIdentifier;
- (NSString)fromPushID;
- (NSString)senderCorrelationIdentifier;
- (NSString)toIdentifier;
- (id)description;
- (int64_t)command;
- (void)setSenderCorrelationIdentifier:(id)a3;
@end

@implementation IMDiMessageIDSTrustedData

- (IMDiMessageIDSTrustedData)initWithTopLevelMessage:(id)a3 fromPushID:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)IMDiMessageIDSTrustedData;
  v11 = [(IMDiMessageIDSTrustedData *)&v28 init];
  if (v11)
  {
    v12 = [v8 objectForKey:@"IDSIncomingMessagePushPayload"];
    v13 = [v12 objectForKey:*MEMORY[0x1E4F6B1A8]];
    if (!v13)
    {
      v13 = [v12 objectForKey:@"c"];
    }
    uint64_t v14 = [v9 copy];
    fromPushID = v11->_fromPushID;
    v11->_fromPushID = (NSString *)v14;

    v16 = [v12 objectForKey:@"t"];
    uint64_t v17 = [v16 copy];
    fromToken = v11->_fromToken;
    v11->_fromToken = (NSData *)v17;

    v19 = [v12 objectForKey:@"sP"];
    uint64_t v20 = [v19 copy];
    fromIdentifier = v11->_fromIdentifier;
    v11->_fromIdentifier = (NSString *)v20;

    v22 = [v12 objectForKey:@"tP"];
    uint64_t v23 = [v22 copy];
    toIdentifier = v11->_toIdentifier;
    v11->_toIdentifier = (NSString *)v23;

    v11->_command = [v13 integerValue];
    v11->_fromTrustedSender = [v10 isFromTrustedSender];
    v11->_fromSnapTrustedSender = [v12 BOOLValueForKey:@"stu" withDefault:1];
    uint64_t v25 = [v10 senderCorrelationIdentifier];
    senderCorrelationIdentifier = v11->_senderCorrelationIdentifier;
    v11->_senderCorrelationIdentifier = (NSString *)v25;
  }
  return v11;
}

- (BOOL)isFromMe
{
  return self->_toIdentifier && -[NSString isEqualToString:](self->_fromIdentifier, "isEqualToString:");
}

- (id)description
{
  v3 = NSString;
  v4 = [(IMDiMessageIDSTrustedData *)self fromPushID];
  v5 = [(IMDiMessageIDSTrustedData *)self fromToken];
  v6 = [(IMDiMessageIDSTrustedData *)self fromIdentifier];
  v7 = [(IMDiMessageIDSTrustedData *)self toIdentifier];
  if ([(IMDiMessageIDSTrustedData *)self isFromMe]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<IMDiMessageIDSTrustedData: %p; fromPushID = %@; fromToken = %@; fromIdentifier = %@; toIdentifier = %@; isFromMe = %@; command = %ld>",
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
  id v9 = [(IMDiMessageIDSTrustedData *)self command]);

  return v9;
}

- (NSString)fromPushID
{
  return self->_fromPushID;
}

- (NSData)fromToken
{
  return self->_fromToken;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (int64_t)command
{
  return self->_command;
}

- (BOOL)isFromTrustedSender
{
  return self->_fromTrustedSender;
}

- (BOOL)isFromSnapTrustedSender
{
  return self->_fromSnapTrustedSender;
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (void)setSenderCorrelationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_fromToken, 0);

  objc_storeStrong((id *)&self->_fromPushID, 0);
}

@end