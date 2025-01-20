@interface VASResultArrayWrapper
+ (BOOL)supportsSecureCoding;
- (_TtC15ProximityReader21VASResultArrayWrapper)init;
- (_TtC15ProximityReader21VASResultArrayWrapper)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VASResultArrayWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15ProximityReader21VASResultArrayWrapper_vasEntries);
  id v5 = a3;
  v6 = self;
  sub_2288104C8(v4, v7, (void (*)(uint64_t))type metadata accessor for VASReadEntry);
  id v8 = objc_allocWithZone(MEMORY[0x263EFF9D8]);
  v9 = (void *)sub_228915E80();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_initWithArray_, v9);

  id v11 = (id)sub_228915C40();
  objc_msgSend(v5, sel_encodeObject_forKey_, v10, v11);
}

- (_TtC15ProximityReader21VASResultArrayWrapper)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader21VASResultArrayWrapper *)VASResultArrayWrapper.init(coder:)(a3);
}

- (_TtC15ProximityReader21VASResultArrayWrapper)init
{
  result = (_TtC15ProximityReader21VASResultArrayWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end