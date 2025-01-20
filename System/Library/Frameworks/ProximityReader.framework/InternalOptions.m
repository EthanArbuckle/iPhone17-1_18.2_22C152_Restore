@interface InternalOptions
+ (BOOL)supportsSecureCoding;
- (_TtC15ProximityReader15InternalOptions)init;
- (_TtC15ProximityReader15InternalOptions)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation InternalOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *((unsigned __int8 *)&self->super.isa
       + OBJC_IVAR____TtC15ProximityReader15InternalOptions_returnReadResultImmediately);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_228915C40();
  objc_msgSend(v5, sel_encodeBool_forKey_, v4, v7);

  uint64_t v8 = *((unsigned __int8 *)&v6->super.isa + OBJC_IVAR____TtC15ProximityReader15InternalOptions_includeErrorInReadResult);
  id v9 = (id)sub_228915C40();
  objc_msgSend(v5, sel_encodeBool_forKey_, v8, v9);
}

- (_TtC15ProximityReader15InternalOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (_TtC15ProximityReader15InternalOptions *)sub_2288378D8(v3);

  return v4;
}

- (_TtC15ProximityReader15InternalOptions)init
{
  result = (_TtC15ProximityReader15InternalOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end