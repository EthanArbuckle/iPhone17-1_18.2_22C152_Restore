@interface CDMAutoBugCapture
+ (void)reportUnsafeWithType:(id)a3 subType:(id)a4;
- (CDMAutoBugCapture)init;
@end

@implementation CDMAutoBugCapture

+ (void)reportUnsafeWithType:(id)a3 subType:(id)a4
{
  uint64_t v4 = sub_2265FB0A0();
  unint64_t v6 = v5;
  uint64_t v7 = sub_2265FB0A0();
  unint64_t v9 = v8;
  swift_getObjCClassMetadata();
  sub_2264B8804(v4, v6, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (CDMAutoBugCapture)init
{
  return (CDMAutoBugCapture *)sub_2264B91D4();
}

@end