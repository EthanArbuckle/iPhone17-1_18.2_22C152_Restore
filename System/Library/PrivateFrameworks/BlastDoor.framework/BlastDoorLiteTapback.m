@interface BlastDoorLiteTapback
- (BlastDoorLiteTapback)init;
- (NSString)associatedMessageEmoji;
- (NSString)description;
- (NSUUID)associatedMessageUUID;
- (int64_t)associatedMessageType;
@end

@implementation BlastDoorLiteTapback

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for LiteTapback, &OBJC_IVAR___BlastDoorLiteTapback_liteTapback, type metadata accessor for LiteTapback);
}

- (NSUUID)associatedMessageUUID
{
  uint64_t v3 = sub_1B1969EE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, (char *)self + OBJC_IVAR___BlastDoorLiteTapback_liteTapback, v3);
  v7 = (void *)sub_1B1969EB0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v7;
}

- (int64_t)associatedMessageType
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorLiteTapback_liteTapback;
  uint64_t v3 = v2[*(int *)(type metadata accessor for LiteTapback(0) + 20)];
  if (v3 == 15) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v3 - 1;
  }
  int64_t result = sub_1B17B30D0(v4);
  if (v6) {
    __break(1u);
  }
  return result;
}

- (NSString)associatedMessageEmoji
{
  return (NSString *)sub_1B17875EC((uint64_t)self, (uint64_t)a2, type metadata accessor for LiteTapback, &OBJC_IVAR___BlastDoorLiteTapback_liteTapback, type metadata accessor for LiteTapback, type metadata accessor for LiteTapback);
}

- (BlastDoorLiteTapback)init
{
  int64_t result = (BlastDoorLiteTapback *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end