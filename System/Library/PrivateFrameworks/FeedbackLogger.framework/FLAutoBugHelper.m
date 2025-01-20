@interface FLAutoBugHelper
- (FLAutoBugHelper)init;
- (FLAutoBugHelper)initWithAutoBugCapture:(id)a3 bundleID:(id)a4 eventValue:(id)a5;
- (void)triggerABCWithSubtype:(id)a3;
- (void)triggerABCWithSubtype:(id)a3 additionalEventName:(id)a4;
@end

@implementation FLAutoBugHelper

- (FLAutoBugHelper)initWithAutoBugCapture:(id)a3 bundleID:(id)a4 eventValue:(id)a5
{
  uint64_t v7 = sub_1BA2D9C18();
  uint64_t v9 = v8;
  id v10 = a3;
  if (a5)
  {
    id v11 = a5;
    a5 = (id)sub_1BA2D98E8();
    unint64_t v13 = v12;
  }
  else
  {
    unint64_t v13 = 0xF000000000000000;
  }
  return (FLAutoBugHelper *)sub_1BA2BCC14(a3, v7, v9, (uint64_t)a5, v13);
}

- (void)triggerABCWithSubtype:(id)a3
{
  unint64_t v4 = sub_1BA2D9C18();
  v5 = self;
  sub_1BA2BCD78(v4);

  swift_bridgeObjectRelease();
}

- (void)triggerABCWithSubtype:(id)a3 additionalEventName:(id)a4
{
  uint64_t v5 = sub_1BA2D9C18();
  uint64_t v7 = v6;
  unint64_t v8 = sub_1BA2D9C18();
  uint64_t v9 = self;
  sub_1BA2BCEFC(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (FLAutoBugHelper)init
{
}

- (void).cxx_destruct
{
  sub_1BA2BD20C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FLAutoBugHelper_eventValue), *(void *)&self->autoBugCapture[OBJC_IVAR___FLAutoBugHelper_eventValue]);
  swift_bridgeObjectRelease();
}

@end