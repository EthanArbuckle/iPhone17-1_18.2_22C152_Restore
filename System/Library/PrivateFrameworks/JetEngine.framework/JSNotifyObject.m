@interface JSNotifyObject
- (_TtC9JetEngine14JSNotifyObject)init;
- (void)post:(id)a3;
- (void)register:(id)a3 :(id)a4;
- (void)unregister:(id)a3 :(id)a4;
@end

@implementation JSNotifyObject

- (_TtC9JetEngine14JSNotifyObject)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC9JetEngine14JSNotifyObject_observersByName) = (Class)sub_19EE55E48(MEMORY[0x1E4FBC860]);

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return [(JSNotifyObject *)&v6 init];
}

- (void).cxx_destruct
{
}

- (void)register:(id)a3 :(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = objc_msgSend(v7, sel_currentContext);
  if (v11)
  {
    v12 = v11;
    id v15 = v8;
    id v13 = v9;
    v14 = v10;
  }
  else
  {
    sub_19F1DCFCC();
    __break(1u);
  }
}

- (void)unregister:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_19F169554(v6, (uint64_t)v7);
}

- (void)post:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19F16898C(v4);
}

@end