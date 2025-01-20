@interface doc_invalidObjCActionClass
- (_TtC17RecentsAppPopoverP33_82D62E299851C4C829943D1F7D60822626doc_invalidObjCActionClass)init;
- (void)actionNoOneImplements:(id)a3;
@end

@implementation doc_invalidObjCActionClass

- (void)actionNoOneImplements:(id)a3
{
  if (a3)
  {
    v3 = self;
    swift_unknownObjectRetain();
    sub_1004C0260();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1000516C4((uint64_t)v4, (uint64_t *)&unk_100618730);
}

- (_TtC17RecentsAppPopoverP33_82D62E299851C4C829943D1F7D60822626doc_invalidObjCActionClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for doc_invalidObjCActionClass();
  return [(doc_invalidObjCActionClass *)&v3 init];
}

@end