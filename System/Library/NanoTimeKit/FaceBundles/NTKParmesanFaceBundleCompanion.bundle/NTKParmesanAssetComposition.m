@interface NTKParmesanAssetComposition
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (int64_t)hash;
@end

@implementation NTKParmesanAssetComposition

- (NSString)description
{
  v2 = self;
  sub_246BD6B6C();

  v3 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_246BD6C58();

  return v3;
}

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
    sub_246B8EA34((uint64_t)v9, &qword_2691D69A0);
    goto LABEL_8;
  }
  type metadata accessor for ParmesanAssetComposition();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    BOOL v6 = 0;
    goto LABEL_9;
  }
  BOOL v6 = sub_246BD7DAC((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_246B8EA34((uint64_t)v11, &qword_2691D69A0);
  return v6;
}

- (void).cxx_destruct
{
  swift_release();
  int64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NTKParmesanAssetComposition__cachedLayoutMaskImage);
}

@end