@interface InstallProgressLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (_TtC20ProductPageExtension20InstallProgressLayer)init;
- (_TtC20ProductPageExtension20InstallProgressLayer)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension20InstallProgressLayer)initWithLayer:(id)a3;
- (id)actionForKey:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation InstallProgressLayer

+ (BOOL)needsDisplayForKey:(id)a3
{
  uint64_t v3 = sub_10077BCB0();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  if (v3 == 0x73736572676F7270 && v5 == 0xE800000000000000
    || (sub_10077D230() & 1) != 0
    || v3 == 0x6F72507265746E65 && v5 == 0xED00007373657267
    || (sub_10077D230() & 1) != 0
    || v3 == 0x676F725074697865 && v5 == 0xEC00000073736572
    || (sub_10077D230() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    NSString v9 = sub_10077BC80();
    v10.receiver = ObjCClassFromMetadata;
    v10.super_class = (Class)&OBJC_METACLASS____TtC20ProductPageExtension20InstallProgressLayer;
    unsigned __int8 v6 = objc_msgSendSuper2(&v10, "needsDisplayForKey:", v9);
    swift_bridgeObjectRelease();
  }
  return v6;
}

- (id)actionForKey:(id)a3
{
  uint64_t v4 = sub_10077BCB0();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = sub_1000C6534(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  sub_1000C6854(v4);
}

- (_TtC20ProductPageExtension20InstallProgressLayer)init
{
  return (_TtC20ProductPageExtension20InstallProgressLayer *)sub_1000C7040();
}

- (_TtC20ProductPageExtension20InstallProgressLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_10077CDF0();
  swift_unknownObjectRelease();
  return (_TtC20ProductPageExtension20InstallProgressLayer *)sub_1000C7130(v4);
}

- (_TtC20ProductPageExtension20InstallProgressLayer)initWithCoder:(id)a3
{
  return (_TtC20ProductPageExtension20InstallProgressLayer *)sub_1000C7288(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20InstallProgressLayer_stageColor));
}

@end