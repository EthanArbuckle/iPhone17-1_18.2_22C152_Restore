@interface doc_invalidObjCActionClass
- (_TtC11SaveToFilesP33_45EBC3248644AC87923464991E9AB54626doc_invalidObjCActionClass)init;
- (void)actionNoOneImplements:(id)a3;
@end

@implementation doc_invalidObjCActionClass

- (void)actionNoOneImplements:(id)a3
{
  if (a3)
  {
    v3 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_10003D810((uint64_t)v4, &qword_10062D740);
}

- (_TtC11SaveToFilesP33_45EBC3248644AC87923464991E9AB54626doc_invalidObjCActionClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for doc_invalidObjCActionClass();
  return [(doc_invalidObjCActionClass *)&v3 init];
}

@end