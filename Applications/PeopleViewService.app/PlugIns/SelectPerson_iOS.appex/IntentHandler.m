@interface IntentHandler
- (_TtC16SelectPerson_iOS13IntentHandler)init;
- (id)defaultPeopleForSelectPeople:(id)a3;
- (void)providePeopleOptionsCollectionForSelectPeople:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5;
@end

@implementation IntentHandler

- (_TtC16SelectPerson_iOS13IntentHandler)init
{
  return (_TtC16SelectPerson_iOS13IntentHandler *)sub_100002AB4();
}

- (void)providePeopleOptionsCollectionForSelectPeople:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_100006AE8();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  id v12 = a3;
  v13 = self;
  sub_100002D38(v12, v9, (uint64_t)a4, (uint64_t)sub_1000063F4, v11);

  swift_release();

  swift_bridgeObjectRelease();
}

- (id)defaultPeopleForSelectPeople:(id)a3
{
  id v4 = a3;
  v5 = self;
  unint64_t v6 = sub_100005BB0();

  if (v6)
  {
    sub_100006998();
    v7.super.isa = sub_100006B38().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (void).cxx_destruct
{
  sub_1000064C4((uint64_t)self + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher);
  sub_1000064C4((uint64_t)self + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_widgetCenter);
  sub_1000064C4((uint64_t)self + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFormatter);
  sub_1000064C4((uint64_t)self + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_verticalTextHelper);

  swift_bridgeObjectRelease();
}

@end