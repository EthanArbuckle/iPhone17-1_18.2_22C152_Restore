@interface JSLocalizerFactoryObject
- (_TtC9JetEngine24JSLocalizerFactoryObject)init;
- (id)localizerForLanguage:(id)a3;
@end

@implementation JSLocalizerFactoryObject

- (id)localizerForLanguage:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  v6 = self;
  id v7 = a3;
  v8 = self;
  id v9 = objc_msgSend(v6, sel_currentContext);
  if (v9)
  {
    v10 = v9;
    id v11 = v7;
    v12 = v8;
    v13 = (void *)sub_19EFA5168((uint64_t)v10, v11, v12, ObjectType);

    return v13;
  }
  else
  {
    id result = (id)sub_19F1DCFCC();
    __break(1u);
  }
  return result;
}

- (_TtC9JetEngine24JSLocalizerFactoryObject)init
{
  id result = (_TtC9JetEngine24JSLocalizerFactoryObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end