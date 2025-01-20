@interface HMDActionSetResponse
+ (id)responsesFromSerializedResponses:(id)a3;
+ (id)serializeWithResponses:(id)a3;
- (BOOL)state;
- (HMDActionSetResponse)init;
- (HMDActionSetResponse)initWithActionSetUUID:(id)a3 state:(BOOL)a4;
- (NSUUID)actionSetUUID;
- (id)serialize;
@end

@implementation HMDActionSetResponse

- (NSUUID)actionSetUUID
{
  uint64_t v3 = sub_2302DD2B0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (NSUUID *)sub_22F5721F0((uint64_t)self + OBJC_IVAR___HMDActionSetResponse_internalActionSetUUID, (uint64_t)&v9);
  if (v10)
  {
    sub_22F5357E8(&v9, &v11);
    swift_dynamicCast();
    v8 = (void *)sub_2302DD250();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (NSUUID *)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)state
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR___HMDActionSetResponse_state);
}

- (HMDActionSetResponse)initWithActionSetUUID:(id)a3 state:(BOOL)a4
{
  uint64_t v6 = sub_2302DD2B0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302DD270();
  uint64_t v10 = (uint64_t *)((char *)self + OBJC_IVAR___HMDActionSetResponse_internalActionSetUUID);
  v10[3] = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 16))(boxed_opaque_existential_1, v9, v6);
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___HMDActionSetResponse_state) = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDActionSetResponse;
  v12 = [(HMDActionSetResponse *)&v14 init];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

+ (id)responsesFromSerializedResponses:(id)a3
{
  sub_22F54F4F8(0, (unint64_t *)&qword_2686D8D60);
  uint64_t v3 = sub_2302DDB00();
  sub_22F572258(v3);
  uint64_t v4 = swift_bridgeObjectRelease();
  type metadata accessor for HMDActionSetResponse(v4);
  uint64_t v5 = (void *)sub_2302DDD60();
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)serializeWithResponses:(id)a3
{
  type metadata accessor for HMDActionSetResponse((uint64_t)a1);
  unint64_t v3 = sub_2302DDD80();
  sub_22F572614(v3);
  swift_bridgeObjectRelease();
  sub_22F54F4F8(0, (unint64_t *)&qword_2686D8D60);
  uint64_t v4 = (void *)sub_2302DDAE0();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)serialize
{
  v2 = self;
  sub_22F571F2C();

  sub_22F54F4F8(0, (unint64_t *)&qword_2686D8D60);
  unint64_t v3 = (void *)sub_2302DDAE0();
  swift_bridgeObjectRelease();
  return v3;
}

- (HMDActionSetResponse)init
{
  result = (HMDActionSetResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end