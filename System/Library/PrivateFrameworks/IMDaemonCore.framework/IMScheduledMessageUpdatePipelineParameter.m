@interface IMScheduledMessageUpdatePipelineParameter
+ (id)scheduleStateWithBlastDoorMessage:(id)a3;
- (BOOL)isFromMe;
- (IMScheduledMessageUpdatePipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4;
- (NSNumber)scheduleState;
- (NSString)GUID;
- (NSString)fromIdentifier;
- (NSString)toIdentifier;
- (id)description;
@end

@implementation IMScheduledMessageUpdatePipelineParameter

- (IMScheduledMessageUpdatePipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IMScheduledMessageUpdatePipelineParameter;
  v8 = [(IMScheduledMessageUpdatePipelineParameter *)&v20 init];
  if (v8)
  {
    v9 = [v6 metadata];
    v10 = [v9 messageGUID];
    uint64_t v11 = [v10 UUIDString];
    GUID = v8->_GUID;
    v8->_GUID = (NSString *)v11;

    v8->_isFromMe = [v7 isFromMe];
    uint64_t v13 = [v7 fromIdentifier];
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v13;

    uint64_t v15 = [v7 toIdentifier];
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v15;

    uint64_t v17 = +[IMScheduledMessageUpdatePipelineParameter scheduleStateWithBlastDoorMessage:v6];
    scheduleState = v8->_scheduleState;
    v8->_scheduleState = (NSNumber *)v17;
  }
  return v8;
}

+ (id)scheduleStateWithBlastDoorMessage:(id)a3
{
  id v3 = a3;
  if ([v3 scheduleState] == -1)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "scheduleState"));
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v4 = [(IMScheduledMessageUpdatePipelineParameter *)self GUID];
  v5 = [(IMScheduledMessageUpdatePipelineParameter *)self scheduleState];
  id v6 = [v3 stringWithFormat:@"<IMScheduledMessageUpdatePipelineParameter %p> { guid: %@, scheduleState: %@ }", self, v4, v5];

  return v6;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSNumber)scheduleState
{
  return self->_scheduleState;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduleState, 0);

  objc_storeStrong((id *)&self->_GUID, 0);
}

@end