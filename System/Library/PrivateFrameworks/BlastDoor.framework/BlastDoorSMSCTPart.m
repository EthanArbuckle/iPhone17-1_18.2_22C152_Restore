@interface BlastDoorSMSCTPart
- (BlastDoorSMSCTPart)init;
- (BlastDoorSMSCTPartContentWrapper)content;
- (NSString)contentId;
- (NSString)contentLocation;
- (NSString)contentType;
- (NSString)description;
@end

@implementation BlastDoorSMSCTPart

- (NSString)description
{
  uint64_t v2 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 40];
  unint64_t v3 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 48];
  uint64_t v4 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 56];
  uint64_t v5 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 64];
  char v6 = self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 72];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B11F103C(v2, v3, v4, v5, v6);
  sub_1B196A850();
  v7 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)contentType
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart);
}

- (NSString)contentId
{
  return (NSString *)sub_1B17AD14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart);
}

- (NSString)contentLocation
{
  return (NSString *)sub_1B17A78F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart);
}

- (BlastDoorSMSCTPartContentWrapper)content
{
  uint64_t v2 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 40];
  unint64_t v3 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 48];
  uint64_t v4 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 56];
  uint64_t v5 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 64];
  char v6 = self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 72];
  v7 = (objc_class *)type metadata accessor for _ObjCEnumSMSCTPartContentWrapper();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content];
  *(void *)v9 = v2;
  *((void *)v9 + 1) = v3;
  *((void *)v9 + 2) = v4;
  *((void *)v9 + 3) = v5;
  v9[32] = v6;
  sub_1B11F103C(v2, v3, v4, v5, v6);
  v12.receiver = v8;
  v12.super_class = v7;
  v10 = [(BlastDoorSMSCTPart *)&v12 init];
  return (BlastDoorSMSCTPartContentWrapper *)v10;
}

- (BlastDoorSMSCTPart)init
{
  result = (BlastDoorSMSCTPart *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 40];
  unint64_t v3 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 48];
  uint64_t v4 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 56];
  uint64_t v5 = *(void *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 64];
  char v6 = self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 72];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B11F11B4(v2, v3, v4, v5, v6);
}

@end