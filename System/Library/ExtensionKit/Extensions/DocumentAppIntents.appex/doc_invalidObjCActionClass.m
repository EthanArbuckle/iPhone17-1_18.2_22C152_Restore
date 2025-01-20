@interface doc_invalidObjCActionClass
- (_TtC18DocumentAppIntentsP33_DCC97C27BC6E8CCFFBE6E7A8931B84E326doc_invalidObjCActionClass)init;
- (void)actionNoOneImplements:(id)a3;
@end

@implementation doc_invalidObjCActionClass

- (void)actionNoOneImplements:(id)a3
{
  if (a3)
  {
    v3 = self;
    swift_unknownObjectRetain();
    sub_1004F5D00();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_10004B8B4((uint64_t)v4, &qword_10065B250);
}

- (_TtC18DocumentAppIntentsP33_DCC97C27BC6E8CCFFBE6E7A8931B84E326doc_invalidObjCActionClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for doc_invalidObjCActionClass();
  return [(doc_invalidObjCActionClass *)&v3 init];
}

@end