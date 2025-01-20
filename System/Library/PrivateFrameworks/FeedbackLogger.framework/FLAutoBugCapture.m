@interface FLAutoBugCapture
- (FLAutoBugCapture)init;
- (void)triggerABCWithSubtype:(id)a3 bundleID:(id)a4 eventName:(id)a5 eventValue:(id)a6;
@end

@implementation FLAutoBugCapture

- (FLAutoBugCapture)init
{
  return (FLAutoBugCapture *)sub_1BA2BAB3C();
}

- (void)triggerABCWithSubtype:(id)a3 bundleID:(id)a4 eventName:(id)a5 eventValue:(id)a6
{
  uint64_t v9 = sub_1BA2D9C18();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1BA2D9C18();
  uint64_t v14 = v13;
  if (a5)
  {
    uint64_t v15 = sub_1BA2D9C18();
    a5 = v16;
  }
  else
  {
    uint64_t v15 = 0;
  }
  v17 = self;
  if (a6)
  {
    id v18 = a6;
    a6 = (id)sub_1BA2D98E8();
    unint64_t v20 = v19;
  }
  else
  {
    unint64_t v20 = 0xF000000000000000;
  }
  sub_1BA2BADEC(v9, v11, v12, v14, v15, (uint64_t)a5, (uint64_t)a6, v20);
  sub_1BA2BD20C((uint64_t)a6, v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end