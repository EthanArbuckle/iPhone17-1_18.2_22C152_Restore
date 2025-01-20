@interface BlastDoorIDSCommandResponse
- (BOOL)has_failReason;
- (BOOL)has_internalBuild;
- (BOOL)has_loggingProfile;
- (BOOL)has_messageId;
- (BOOL)has_protocolVersion;
- (BOOL)has_requestType;
- (BOOL)has_responseStatus;
- (BOOL)has_sharedSession;
- (BOOL)internalBuild;
- (BOOL)loggingProfile;
- (BOOL)sharedSession;
- (BlastDoorIDSCommandResponse)init;
- (NSData)idsSessionId;
- (NSData)messageUUID;
- (NSData)token;
- (NSString)applicationId;
- (NSString)description;
- (int64_t)command;
- (int64_t)failReason;
- (int64_t)messageId;
- (int64_t)protocolVersion;
- (int64_t)requestType;
- (int64_t)responseStatus;
@end

@implementation BlastDoorIDSCommandResponse

- (NSString)description
{
  long long v2 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 136];
  v9[8] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 120];
  v9[9] = v2;
  long long v3 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 72];
  v9[4] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 56];
  v9[5] = v3;
  long long v4 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 104];
  v9[6] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 88];
  v9[7] = v4;
  long long v5 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse);
  v9[1] = v5;
  long long v6 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 40];
  v9[2] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 24];
  v9[3] = v6;
  unsigned __int8 v10 = self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 152];
  sub_1B17B2EA0(v9);
  sub_1B196A850();
  v7 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (int64_t)command
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse);
}

- (BOOL)has_messageId
{
  return (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 8] & 1) == 0;
}

- (int64_t)messageId
{
  if (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 8]) {
    return 0;
  }
  else {
    return *(void *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse];
  }
}

- (NSData)messageUUID
{
  return (NSData *)sub_1B1785BAC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse);
}

- (BOOL)has_responseStatus
{
  return (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 40] & 1) == 0;
}

- (int64_t)responseStatus
{
  if (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 40]) {
    return 0;
  }
  else {
    return *(void *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 32];
  }
}

- (BOOL)has_failReason
{
  return (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 56] & 1) == 0;
}

- (int64_t)failReason
{
  if (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 56]) {
    return 0;
  }
  else {
    return *(void *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 48];
  }
}

- (NSData)token
{
  unint64_t v2 = *(void *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 72];
  if (v2 >> 60 == 15)
  {
    long long v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 64];
    sub_1B11F1108(v4, v2);
    long long v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_internalBuild
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 80] != 2;
}

- (BOOL)internalBuild
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 80] & 1;
}

- (BOOL)has_loggingProfile
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 81] != 2;
}

- (BOOL)loggingProfile
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 81] & 1;
}

- (NSString)applicationId
{
  if (*(void *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 96])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_requestType
{
  return (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 112] & 1) == 0;
}

- (int64_t)requestType
{
  if (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 112]) {
    return 0;
  }
  else {
    return *(void *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 104];
  }
}

- (NSData)idsSessionId
{
  return (NSData *)sub_1B178554C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse);
}

- (BOOL)has_sharedSession
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 136] != 2;
}

- (BOOL)sharedSession
{
  return self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 136] & 1;
}

- (BOOL)has_protocolVersion
{
  return (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 152] & 1) == 0;
}

- (int64_t)protocolVersion
{
  if (self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 152]) {
    return 0;
  }
  else {
    return *(void *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 144];
  }
}

- (BlastDoorIDSCommandResponse)init
{
  result = (BlastDoorIDSCommandResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 136];
  v7[8] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 120];
  v7[9] = v2;
  unsigned __int8 v8 = self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 152];
  long long v3 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 72];
  v7[4] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 56];
  v7[5] = v3;
  long long v4 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 104];
  v7[6] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 88];
  v7[7] = v4;
  long long v5 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse);
  v7[1] = v5;
  long long v6 = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 40];
  v7[2] = *(_OWORD *)&self->iDSCommandResponse[OBJC_IVAR___BlastDoorIDSCommandResponse_iDSCommandResponse + 24];
  v7[3] = v6;
  sub_1B17C7028(v7);
}

@end