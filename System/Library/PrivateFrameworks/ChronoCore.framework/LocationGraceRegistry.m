@interface LocationGraceRegistry
+ (id)deserializeFromReader:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)serializeToWriter:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)serializedDataLength;
@end

@implementation LocationGraceRegistry

- (int64_t)serializedDataLength
{
  swift_retain();
  int64_t v2 = sub_1DAC0D60C();
  swift_release();
  return v2;
}

- (BOOL)serializeToWriter:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_copy(v3);
  uint64_t v4 = swift_retain();
  BOOL v5 = sub_1DAC0F070(v4, (uint64_t)v3);
  _Block_release(v3);
  _Block_release(v3);
  swift_release();
  return v5;
}

+ (id)deserializeFromReader:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = (void *)sub_1DAC0F660((uint64_t (**)(void, void, void))v3);
  _Block_release(v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    swift_retain();
    swift_unknownObjectRetain();
    sub_1DAD282E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
    swift_retain();
  }
  char v3 = sub_1DAC0DB6C((uint64_t)v5);
  swift_release();
  sub_1DA9FC374((uint64_t)v5);
  return v3 & 1;
}

- (id)copyWithZone:(void *)a3
{
  swift_beginAccess();
  uint64_t v4 = *(void *)self->timeoutByIdentifier;
  type metadata accessor for LocationGraceRegistry();
  *(void *)(swift_allocObject() + 16) = v4;
  swift_bridgeObjectRetain();
  BOOL v5 = (void *)sub_1DAD288E8();
  swift_release();
  return v5;
}

@end