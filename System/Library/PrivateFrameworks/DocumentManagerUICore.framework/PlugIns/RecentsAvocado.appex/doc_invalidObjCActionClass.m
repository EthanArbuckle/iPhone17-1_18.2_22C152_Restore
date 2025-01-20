@interface doc_invalidObjCActionClass
- (_TtC14RecentsAvocadoP33_14FAFF1AFA8F93FC2C8522D0D79198A726doc_invalidObjCActionClass)init;
- (void)actionNoOneImplements:(id)a3;
@end

@implementation doc_invalidObjCActionClass

- (void)actionNoOneImplements:(id)a3
{
  if (a3)
  {
    v3 = self;
    swift_unknownObjectRetain();
    sub_1004CF2A0();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_100049B74((uint64_t)v4, &qword_10062BA60);
}

- (_TtC14RecentsAvocadoP33_14FAFF1AFA8F93FC2C8522D0D79198A726doc_invalidObjCActionClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for doc_invalidObjCActionClass();
  return [(doc_invalidObjCActionClass *)&v3 init];
}

@end