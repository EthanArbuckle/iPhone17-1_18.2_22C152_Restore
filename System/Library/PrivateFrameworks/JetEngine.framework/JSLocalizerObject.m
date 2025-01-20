@interface JSLocalizerObject
- (_TtC9JetEngine17JSLocalizerObject)init;
- (id)decimal:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (id)fileSize:(id)a3;
- (id)formattedCount:(id)a3;
- (id)formattedDateInSentence:(id)a3 :(id)a4 :(id)a5;
- (id)formattedDateWithContext:(id)a3 :(id)a4 :(id)a5;
- (id)integer:(id)a3 :(id)a4;
- (id)percentage:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (id)relativeDate:(id)a3;
- (id)string:(id)a3 :(id)a4 :(id)a5;
- (id)stringWithCount:(id)a3 :(id)a4 :(id)a5 :(id)a6;
@end

@implementation JSLocalizerObject

- (id)string:(id)a3 :(id)a4 :(id)a5
{
  v9 = self;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = self;
  id v14 = objc_msgSend(v9, sel_currentContext);
  if (v14)
  {
    v15 = v14;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    v19 = v13;
    v20 = (void *)sub_19EFA59FC((uint64_t)v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v19, (uint64_t)v18);

    return v20;
  }
  else
  {
    id result = (id)sub_19F1DCFCC();
    __break(1u);
  }
  return result;
}

- (id)decimal:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  return sub_19F163758(self, (uint64_t)a2, a3, a4, a5, a6, (uint64_t (*)(void *, id, id, id, id, id))sub_19EFA5A14);
}

- (id)percentage:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  return sub_19F163758(self, (uint64_t)a2, a3, a4, a5, a6, (uint64_t (*)(void *, id, id, id, id, id))sub_19EFA5A2C);
}

- (id)integer:(id)a3 :(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = objc_msgSend(v7, sel_currentContext);
  if (v11)
  {
    id v12 = v11;
    id v13 = v8;
    id v14 = v9;
    v15 = v10;
    id v16 = (void *)sub_19EFA5A44((uint64_t)v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15);

    return v16;
  }
  else
  {
    id result = (id)sub_19F1DCFCC();
    __break(1u);
  }
  return result;
}

- (id)stringWithCount:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = self;
  id v17 = objc_msgSend(v11, sel_currentContext);
  if (v17)
  {
    id v18 = v17;
    id v19 = v12;
    id v20 = v13;
    id v21 = v14;
    id v22 = v15;
    v23 = v16;
    v24 = (void *)sub_19EFA5A5C((uint64_t)v18, (uint64_t)v19, (uint64_t)v20, (uint64_t)v21, (uint64_t)v23, (uint64_t)v22);

    return v24;
  }
  else
  {
    id result = (id)sub_19F1DCFCC();
    __break(1u);
  }
  return result;
}

- (id)formattedCount:(id)a3
{
  return sub_19F164568(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19EFA5B58);
}

- (id)fileSize:(id)a3
{
  return sub_19F164568(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19EFA5D40);
}

- (id)formattedDateWithContext:(id)a3 :(id)a4 :(id)a5
{
  return sub_19F1640A8(self, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(void *, id, id, id, id))sub_19EFA5F2C);
}

- (id)formattedDateInSentence:(id)a3 :(id)a4 :(id)a5
{
  return sub_19F1640A8(self, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(void *, id, id, id, id))sub_19EFA5F44);
}

- (id)relativeDate:(id)a3
{
  return sub_19F164568(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19EFA6040);
}

- (_TtC9JetEngine17JSLocalizerObject)init
{
  id result = (_TtC9JetEngine17JSLocalizerObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end