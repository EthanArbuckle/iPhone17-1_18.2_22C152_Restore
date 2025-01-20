@interface CKSceneManager
+ (_TtC7ChatKit14CKSceneManager)shared;
- (NSString)debugDescription;
- (_TtC7ChatKit14CKSceneManager)init;
- (id)getDelegateFor:(id)a3;
- (id)getScenes;
- (void)addScene:(id)a3 withDelegate:(id)a4;
- (void)removeScene:(id)a3;
@end

@implementation CKSceneManager

+ (_TtC7ChatKit14CKSceneManager)shared
{
  if (qword_1E9237B28 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E92406E0;

  return (_TtC7ChatKit14CKSceneManager *)v2;
}

- (_TtC7ChatKit14CKSceneManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit14CKSceneManager_sceneToDelegateMap) = (Class)MEMORY[0x1E4FBC868];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKSceneManager();
  return [(CKSceneManager *)&v3 init];
}

- (id)getScenes
{
  swift_beginAccess();
  objc_super v3 = self;
  unint64_t v4 = sub_18F7B6CA0();
  sub_18F6EC468(v4);

  swift_bridgeObjectRelease();
  sub_18F723BE8();
  v5 = (void *)sub_18F7B99A0();
  swift_release();

  return v5;
}

- (void)addScene:(id)a3 withDelegate:(id)a4
{
  swift_beginAccess();
  swift_unknownObjectRetain_n();
  id v7 = a3;
  v8 = self;
  sub_18F7224D8((uint64_t)a4, v7);
  swift_endAccess();

  swift_unknownObjectRelease();
}

- (void)removeScene:(id)a3
{
  swift_beginAccess();
  id v5 = a3;
  v6 = self;
  sub_18F7222F0((unint64_t)v5);
  swift_endAccess();

  swift_unknownObjectRelease();
}

- (id)getDelegateFor:(id)a3
{
  id v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit14CKSceneManager_sceneToDelegateMap);
  swift_beginAccess();
  uint64_t v6 = *v5;
  id v7 = a3;
  v8 = self;
  sub_18F7B6CA0();
  v9 = (void *)sub_18F721674(v7, v6);

  swift_bridgeObjectRelease();

  return v9;
}

- (NSString)debugDescription
{
  v2 = self;
  sub_18F721D28();

  objc_super v3 = (void *)sub_18F7B97A0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

@end