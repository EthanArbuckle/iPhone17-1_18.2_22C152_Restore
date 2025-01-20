@interface LocalSceneSpecification
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (Class)uiSceneMinimumClass;
- (NSArray)defaultExtensions;
- (NSString)uiSceneSessionRole;
- (_TtC12DrawingBoard23LocalSceneSpecification)init;
@end

@implementation LocalSceneSpecification

- (BOOL)isInternal
{
  return 1;
}

- (NSString)uiSceneSessionRole
{
  v2 = self;
  v3 = (void *)sub_24CFD3398();

  return (NSString *)v3;
}

- (Class)uiSceneMinimumClass
{
  type metadata accessor for LocalWindowScene();
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSArray)defaultExtensions
{
  v2 = self;
  v3 = sub_24CF95424();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269848C38);
    v4 = (void *)sub_24CFD3428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_24CFD35B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_24CF95824((uint64_t)v8);

  sub_24CF8DE78((uint64_t)v8);
  return v6;
}

- (_TtC12DrawingBoard23LocalSceneSpecification)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocalSceneSpecification();
  return [(LocalSceneSpecification *)&v3 init];
}

@end