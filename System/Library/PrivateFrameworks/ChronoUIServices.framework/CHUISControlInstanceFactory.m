@interface CHUISControlInstanceFactory
+ (id)instanceOfType:(unint64_t)a3 instanceIdentity:(id)a4;
+ (id)instanceWithControl:(id)a3 type:(unint64_t)a4 content:(unint64_t)a5;
+ (id)instanceWithIdentity:(id)a3 type:(unint64_t)a4;
- (CHUISControlInstanceFactory)init;
@end

@implementation CHUISControlInstanceFactory

+ (id)instanceOfType:(unint64_t)a3 instanceIdentity:(id)a4
{
  if (a3 - 1 > 2)
  {
    id result = (id)sub_1BC488E98();
    __break(1u);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)*off_1E62AFEB8[a3 - 1]), sel_initWithInstanceIdentity_, a4);
    return v4;
  }
  return result;
}

+ (id)instanceWithControl:(id)a3 type:(unint64_t)a4 content:(unint64_t)a5
{
  id v9 = objc_allocWithZone(MEMORY[0x1E4F58C90]);
  id v10 = a3;
  id v11 = objc_msgSend(v9, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v10, a5, 0, 0);
  id v12 = objc_msgSend(a1, sel_instanceOfType_instanceIdentity_, a4, v11);

  return v12;
}

+ (id)instanceWithIdentity:(id)a3 type:(unint64_t)a4
{
  swift_getObjCClassMetadata();
  id v6 = a3;
  v7 = sub_1BC456FB0((uint64_t)v6, a4);

  return v7;
}

- (CHUISControlInstanceFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHUISControlInstanceFactory;
  return [(CHUISControlInstanceFactory *)&v3 init];
}

@end