@interface JSBagObject
- (_TtC9JetEngineP33_CD4A13C520117F75F11731052EDCF02B11JSBagObject)init;
- (id)BOOLean:(id)a3;
- (id)array:(id)a3;
- (id)dictionary:(id)a3;
- (id)double:(id)a3;
- (id)integer:(id)a3;
- (id)string:(id)a3;
- (id)url:(id)a3;
- (void)registerBagKeys:(id)a3;
@end

@implementation JSBagObject

- (id)BOOLean:(id)a3
{
  return sub_19EEA1FD8(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19EEA21D0);
}

- (id)array:(id)a3
{
  return sub_19EEA1FD8(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19EEA2CBC);
}

- (id)string:(id)a3
{
  return sub_19EEA1FD8(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19EEA3130);
}

- (id)url:(id)a3
{
  return sub_19EEA1FD8(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19EEA3BF4);
}

- (id)double:(id)a3
{
  return sub_19EEA1FD8(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19EEA41E0);
}

- (id)dictionary:(id)a3
{
  return sub_19EEA1FD8(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19EEA48AC);
}

- (void)registerBagKeys:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  id v8 = objc_msgSend(v5, sel_currentContext);
  if (v8)
  {
    v9 = v8;
    id v10 = v6;
    v11 = v7;
  }
  else
  {
    sub_19F1DCFCC();
    __break(1u);
  }
}

- (id)integer:(id)a3
{
  return sub_19EEA1FD8(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19EFA616C);
}

- (_TtC9JetEngineP33_CD4A13C520117F75F11731052EDCF02B11JSBagObject)init
{
  result = (_TtC9JetEngineP33_CD4A13C520117F75F11731052EDCF02B11JSBagObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end