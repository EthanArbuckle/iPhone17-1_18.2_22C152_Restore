@interface doc_invalidObjCActionClass
- (_TtC33com_apple_DocumentManager_ServiceP33_BD6BE7FB0EE127DBE3CE1AA98047E2F226doc_invalidObjCActionClass)init;
- (void)actionNoOneImplements:(id)a3;
@end

@implementation doc_invalidObjCActionClass

- (void)actionNoOneImplements:(id)a3
{
  if (a3)
  {
    v3 = self;
    swift_unknownObjectRetain();
    sub_1004CEA50();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_10003B3B8((uint64_t)v4, &qword_10062CB00);
}

- (_TtC33com_apple_DocumentManager_ServiceP33_BD6BE7FB0EE127DBE3CE1AA98047E2F226doc_invalidObjCActionClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for doc_invalidObjCActionClass();
  return [(doc_invalidObjCActionClass *)&v3 init];
}

@end