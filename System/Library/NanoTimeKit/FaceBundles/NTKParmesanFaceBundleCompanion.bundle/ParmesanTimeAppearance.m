@interface ParmesanTimeAppearance
- (BOOL)isEqual:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance)init;
- (int64_t)hash;
@end

@implementation ParmesanTimeAppearance

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_246C2D1F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_246BB367C((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_246BAD92C((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for ParmesanTimeAppearance();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    BOOL v6 = 0;
    goto LABEL_9;
  }
  BOOL v6 = sub_246BCF824((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_246BAD92C((uint64_t)v11);
  return v6;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_246BCF6B0();

  return v3;
}

- (_TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance)init
{
  result = (_TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout));
  int64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device);
}

@end