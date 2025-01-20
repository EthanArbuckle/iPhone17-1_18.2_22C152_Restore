@interface NTKParmesanAssetMask
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)imageName;
- (NTKParmesanAssetMask)init;
- (NTKParmesanAssetMask)initWithImageName:(id)a3;
- (NTKParmesanAssetMask)initWithImageName:(id)a3 style:(int64_t)a4;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (int64_t)style;
- (void)setImageName:(id)a3;
@end

@implementation NTKParmesanAssetMask

- (NSString)imageName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setImageName:(id)a3
{
  uint64_t v4 = sub_246C2CC48();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___NTKParmesanAssetMask_imageName);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (int64_t)style
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetMask_style);
}

- (NTKParmesanAssetMask)initWithImageName:(id)a3
{
  sub_246C2CC48();
  uint64_t v4 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  v5 = [(NTKParmesanAssetMask *)self initWithImageName:v4 style:0];

  return v5;
}

- (NTKParmesanAssetMask)initWithImageName:(id)a3 style:(int64_t)a4
{
  uint64_t v6 = sub_246C2CC48();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___NTKParmesanAssetMask_imageName);
  uint64_t *v7 = v6;
  v7[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetMask_style) = (Class)a4;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ParmesanAssetMask();
  return [(NTKParmesanAssetMask *)&v10 init];
}

- (NSString)description
{
  v2 = self;
  sub_246BE77AC();

  v3 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NTKParmesanAssetMask)init
{
  result = (NTKParmesanAssetMask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetMask_imageName);
  uint64_t v3 = *(void *)&self->imageName[OBJC_IVAR___NTKParmesanAssetMask_imageName];
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetMask_style);
  uint64_t v6 = (objc_class *)type metadata accessor for ParmesanAssetMask();
  v7 = (char *)objc_allocWithZone(v6);
  uint64_t v8 = &v7[OBJC_IVAR___NTKParmesanAssetMask_imageName];
  *(void *)uint64_t v8 = v4;
  *((void *)v8 + 1) = v3;
  *(void *)&v7[OBJC_IVAR___NTKParmesanAssetMask_style] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  swift_bridgeObjectRetain();
  return [(NTKParmesanAssetMask *)&v10 init];
}

- (int64_t)hash
{
  sub_246C2D6C8();
  uint64_t v3 = self;
  swift_bridgeObjectRetain();
  sub_246C2CCC8();
  swift_bridgeObjectRelease();
  sub_246C2D678();
  int64_t v4 = sub_246C2D6A8();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    int64_t v4 = self;
    swift_unknownObjectRetain();
    sub_246C2D1F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  BOOL v6 = sub_246BE7FA8((uint64_t)v8);

  sub_246BAD92C((uint64_t)v8);
  return v6;
}

@end