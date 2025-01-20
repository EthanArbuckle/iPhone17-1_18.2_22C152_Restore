@interface ProjectionHighlightTileViewModelContextData
+ (BOOL)supportsSecureCoding;
- (_TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData)init;
- (_TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ProjectionHighlightTileViewModelContextData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24125EA70(v4);
}

- (_TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData *)sub_24125EEF4();

  return v4;
}

- (_TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData)init
{
  result = (_TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData_projection));
}

@end