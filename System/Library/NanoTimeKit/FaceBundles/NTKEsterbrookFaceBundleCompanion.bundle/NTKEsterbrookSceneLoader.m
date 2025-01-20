@interface NTKEsterbrookSceneLoader
+ (NSBundle)esterbrookBundle;
- (NTKEsterbrookSceneLoader)init;
- (id)allSceneURLsAt:(id)a3;
- (id)allSceneURLsIn:(id)a3;
@end

@implementation NTKEsterbrookSceneLoader

+ (NSBundle)esterbrookBundle
{
  swift_getObjCClassMetadata();
  id v2 = sub_246A93A20();

  return (NSBundle *)v2;
}

- (id)allSceneURLsIn:(id)a3
{
  uint64_t v5 = sub_246AD8940();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  v10 = self;
  id v11 = objc_msgSend(v9, sel_bundleURL);
  sub_246AD8930();

  sub_246A95884((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  v12 = (void *)sub_246AD8C50();
  swift_bridgeObjectRelease();

  return v12;
}

- (id)allSceneURLsAt:(id)a3
{
  uint64_t v3 = sub_246AD8940();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246AD8930();
  sub_246A95884((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v7 = (void *)sub_246AD8C50();
  swift_bridgeObjectRelease();

  return v7;
}

- (NTKEsterbrookSceneLoader)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneLoader();
  return [(NTKEsterbrookSceneLoader *)&v3 init];
}

@end