@interface BlastDoorIDSCommandWebTunnelResponse
- (BOOL)has_epochTimeNanos;
- (BOOL)has_httpResponseStatus;
- (BOOL)has_messageId;
- (BOOL)has_responseStatus;
- (BlastDoorAPSUserPayloadHttpHeaders)httpHeaders;
- (BlastDoorIDSCommandWebTunnelResponse)init;
- (NSData)httpBody;
- (NSData)httpBodyKey;
- (NSData)messageUUID;
- (NSString)contentType;
- (NSString)description;
- (NSString)httpBodyUrl;
- (NSString)httpErrorMsg;
- (NSString)httpUrl;
- (int64_t)command;
- (int64_t)epochTimeNanos;
- (int64_t)httpResponseStatus;
- (int64_t)messageId;
- (int64_t)responseStatus;
@end

@implementation BlastDoorIDSCommandWebTunnelResponse

- (NSString)description
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse;
  memcpy(__dst, (char *)self + OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse, sizeof(__dst));
  memcpy(v5, v2, sizeof(v5));
  sub_1B17B2F30(__dst);
  sub_1B196A850();
  v3 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)command
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
}

- (BOOL)has_messageId
{
  return (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                          + 8] & 1) == 0;
}

- (int64_t)messageId
{
  if (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                       + 8])
    return 0;
  else {
    return *(void *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse];
  }
}

- (NSData)messageUUID
{
  return (NSData *)sub_1B1785BAC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
}

- (BOOL)has_responseStatus
{
  return (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                          + 40] & 1) == 0;
}

- (int64_t)responseStatus
{
  if (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                       + 40])
    return 0;
  else {
    return *(void *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
  }
                                                       + 32];
}

- (NSString)contentType
{
  return (NSString *)sub_1B17ABBA4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
}

- (BOOL)has_epochTimeNanos
{
  return (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                          + 72] & 1) == 0;
}

- (int64_t)epochTimeNanos
{
  if (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                       + 72])
    return 0;
  else {
    return *(void *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
  }
                                                       + 64];
}

- (NSString)httpUrl
{
  return (NSString *)sub_1B1791858((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
}

- (BlastDoorAPSUserPayloadHttpHeaders)httpHeaders
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
  uint64_t v3 = *(void *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                   + 104];
  if (v3 == 1)
  {
    v4 = 0;
  }
  else
  {
    uint64_t v5 = v2[22];
    uint64_t v18 = v2[23];
    uint64_t v19 = v2[24];
    uint64_t v6 = v2[20];
    uint64_t v17 = v2[21];
    uint64_t v7 = v2[18];
    uint64_t v8 = v2[19];
    uint64_t v9 = v2[16];
    uint64_t v10 = v2[17];
    uint64_t v11 = v2[15];
    uint64_t v12 = v2[13];
    v13 = (objc_class *)type metadata accessor for _ObjCAPSUserPayloadHttpHeadersWrapper();
    v14 = (char *)objc_allocWithZone(v13);
    v15 = &v14[OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders];
    *(void *)v15 = v12;
    *((void *)v15 + 1) = v3;
    *((void *)v15 + 2) = v11;
    *((void *)v15 + 3) = v9;
    *((void *)v15 + 4) = v10;
    *((void *)v15 + 5) = v7;
    *((void *)v15 + 6) = v8;
    *((void *)v15 + 7) = v6;
    *((void *)v15 + 8) = v17;
    *((void *)v15 + 9) = v5;
    *((void *)v15 + 10) = v18;
    *((void *)v15 + 11) = v19;
    v20.receiver = v14;
    v20.super_class = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v4 = [(BlastDoorIDSCommandWebTunnelResponse *)&v20 init];
  }
  return (BlastDoorAPSUserPayloadHttpHeaders *)v4;
}

- (NSData)httpBody
{
  unint64_t v2 = *(void *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                   + 200];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                     + 192];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)httpBodyUrl
{
  if (*(void *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                   + 216])
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

- (NSData)httpBodyKey
{
  return (NSData *)sub_1B1786138((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse);
}

- (BOOL)has_httpResponseStatus
{
  return (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                          + 248] & 1) == 0;
}

- (int64_t)httpResponseStatus
{
  if (self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                       + 248])
    return 0;
  else {
    return *(void *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
  }
                                                       + 240];
}

- (NSString)httpErrorMsg
{
  if (*(void *)&self->iDSCommandWebTunnelResponse[OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse
                                                   + 264])
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

- (BlastDoorIDSCommandWebTunnelResponse)init
{
  result = (BlastDoorIDSCommandWebTunnelResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(__dst, (char *)self + OBJC_IVAR___BlastDoorIDSCommandWebTunnelResponse_iDSCommandWebTunnelResponse, sizeof(__dst));
  sub_1B17C6F18(__dst);
}

@end