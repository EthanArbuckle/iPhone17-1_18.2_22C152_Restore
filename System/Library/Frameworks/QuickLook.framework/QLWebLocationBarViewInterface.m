@interface QLWebLocationBarViewInterface
+ (id)makeLocationBarUI:(id)a3;
- (_TtC9QuickLook29QLWebLocationBarViewInterface)init;
@end

@implementation QLWebLocationBarViewInterface

+ (id)makeLocationBarUI:(id)a3
{
  uint64_t v3 = type metadata accessor for QLWebLocationBarView();
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)&v16 - v7;
  uint64_t v9 = sub_218037D74();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218037D54();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v8, v12, v9);
  sub_217FFA2E8((uint64_t)v8, (uint64_t)v6);
  id v13 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA0C8));
  v14 = (void *)sub_218038314();
  sub_217FFA34C((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return v14;
}

- (_TtC9QuickLook29QLWebLocationBarViewInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QLWebLocationBarViewInterface();
  return [(QLWebLocationBarViewInterface *)&v3 init];
}

@end