@interface JSCryptoObject
- (BOOL)supports:(id)a3;
- (_TtC9JetEngine14JSCryptoObject)init;
- (id)hash:(id)a3 :(id)a4;
@end

@implementation JSCryptoObject

- (_TtC9JetEngine14JSCryptoObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSCryptoObject *)&v3 init];
}

- (BOOL)supports:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19F035B70(v4, (char *)&v8);
  int v6 = v8;

  return v6 != 2;
}

- (id)hash:(id)a3 :(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = objc_msgSend(v7, sel_currentContext);
  if (v11)
  {
    v12 = v11;
    id v13 = v8;
    id v14 = v9;
    v15 = (void *)sub_19EFA6184((uint64_t)v12, (uint64_t)v13, (uint64_t)v14);

    return v15;
  }
  else
  {
    id result = (id)sub_19F1DCFCC();
    __break(1u);
  }
  return result;
}

@end