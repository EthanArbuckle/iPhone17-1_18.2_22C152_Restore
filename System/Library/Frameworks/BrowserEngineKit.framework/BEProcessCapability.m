@interface BEProcessCapability
+ (id)background;
+ (id)foreground;
+ (id)mediaPlaybackAndCaptureWithEnvironment:(id)a3;
+ (id)suspended;
- (BEProcessCapability)init;
- (id)requestWithError:(id *)a3;
@end

@implementation BEProcessCapability

+ (id)foreground
{
  return sub_24323EDFC();
}

- (void).cxx_destruct
{
}

+ (id)mediaPlaybackAndCaptureWithEnvironment:(id)a3
{
  uint64_t v4 = type metadata accessor for ProcessCapability(0);
  MEMORY[0x270FA5388](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24323F35C((uint64_t)a3 + OBJC_IVAR___BEMediaEnvironment_inner, (uint64_t)v6, type metadata accessor for MediaEnvironment);
  swift_storeEnumTagMultiPayload();
  v7 = (objc_class *)type metadata accessor for BEProcessCapability(0);
  id v8 = objc_allocWithZone(v7);
  sub_24323F35C((uint64_t)v6, (uint64_t)v8 + OBJC_IVAR___BEProcessCapability_inner, type metadata accessor for ProcessCapability);
  v12.receiver = v8;
  v12.super_class = v7;
  id v9 = a3;
  id v10 = objc_msgSendSuper2(&v12, sel_init);
  sub_24323F508((uint64_t)v6, type metadata accessor for ProcessCapability);

  return v10;
}

+ (id)background
{
  return sub_24323EDFC();
}

+ (id)suspended
{
  return sub_24323EDFC();
}

- (id)requestWithError:(id *)a3
{
  v8[3] = &type metadata for Process;
  v8[4] = &off_26F88F728;
  v3 = self;
  sub_24323EF28(v8, 0, 0, v9);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  uint64_t v4 = v9[0];
  uint64_t v5 = v9[1];
  type metadata accessor for _BEProcessCapabilityGrant();
  v6 = (void *)swift_allocObject();
  v6[2] = v4;
  v6[3] = v5;

  return v6;
}

- (BEProcessCapability)init
{
  result = (BEProcessCapability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end