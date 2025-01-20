@interface BlastDoorContactMessage
- (BlastDoorContactMessage)init;
- (BlastDoorContactMessage_ContactInfo)contactInfo;
- (NSString)description;
@end

@implementation BlastDoorContactMessage

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorContactMessage_ContactInfo)contactInfo
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorContactMessage_contactMessage);
  uint64_t v2 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage];
  uint64_t v5 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 8];
  uint64_t v4 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 16];
  uint64_t v6 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 32];
  uint64_t v7 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 48];
  uint64_t v19 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 40];
  uint64_t v20 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 24];
  uint64_t v8 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 64];
  uint64_t v9 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 80];
  uint64_t v17 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 72];
  uint64_t v18 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 56];
  uint64_t v10 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 96];
  uint64_t v16 = *(void *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 88];
  v11 = (objc_class *)type metadata accessor for _ObjCContactMessage_ContactInfoWrapper();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = &v12[OBJC_IVAR___BlastDoorContactMessage_ContactInfo_contactMessage_ContactInfo];
  *(void *)v13 = v3;
  *((void *)v13 + 1) = v2;
  *((void *)v13 + 2) = v5;
  *((void *)v13 + 3) = v4;
  *((void *)v13 + 4) = v20;
  *((void *)v13 + 5) = v6;
  *((void *)v13 + 6) = v19;
  *((void *)v13 + 7) = v7;
  *((void *)v13 + 8) = v18;
  *((void *)v13 + 9) = v8;
  *((void *)v13 + 10) = v17;
  *((void *)v13 + 11) = v9;
  *((void *)v13 + 12) = v16;
  *((void *)v13 + 13) = v10;
  v21.receiver = v12;
  v21.super_class = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = [(BlastDoorContactMessage *)&v21 init];
  return (BlastDoorContactMessage_ContactInfo *)v14;
}

- (BlastDoorContactMessage)init
{
  result = (BlastDoorContactMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end