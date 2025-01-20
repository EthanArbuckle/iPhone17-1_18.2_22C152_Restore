@interface JSPlistObject
- (_TtC9JetEngine13JSPlistObject)init;
- (id)parse:(id)a3;
- (id)stringify:(id)a3 :(id)a4;
@end

@implementation JSPlistObject

- (_TtC9JetEngine13JSPlistObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSPlistObject *)&v3 init];
}

- (id)parse:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  id v8 = objc_msgSend(v5, sel_currentContext);
  if (v8)
  {
    v9 = v8;
    id v10 = v6;
    v11 = (void *)sub_19EFA58D4(v9, v10);

    return v11;
  }
  else
  {
    id result = (id)sub_19F1DCFCC();
    __break(1u);
  }
  return result;
}

- (id)stringify:(id)a3 :(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = objc_msgSend(v7, sel_currentContext);
  if (v11)
  {
    v12 = v11;
    id v13 = v8;
    id v14 = v9;
    v15 = (void *)sub_19EFA59B4((uint64_t)v12, (uint64_t)v14, (uint64_t)v13);

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