@interface AMSUIEngagementContentRecord
+ (BOOL)isURLEngagementContent:(id)a3;
- (AMSUIEngagementContentRecord)init;
- (AMSUIEngagementContentRecord)initWithURL:(id)a3;
- (NSString)app;
- (NSString)cacheKey;
- (NSString)contentExtension;
- (NSString)version;
- (NSURL)fallbackURL;
@end

@implementation AMSUIEngagementContentRecord

- (NSString)app
{
  return (NSString *)sub_21C2371BC((uint64_t)self, (uint64_t)a2, (void (*)(void))EngagementContentRecord.app.getter);
}

- (NSString)cacheKey
{
  return (NSString *)sub_21C2371BC((uint64_t)self, (uint64_t)a2, (void (*)(void))EngagementContentRecord.cacheKey.getter);
}

- (NSString)contentExtension
{
  return (NSString *)sub_21C237380((uint64_t)self, (uint64_t)a2, (void (*)(void))EngagementContentRecord.contentExtension.getter);
}

- (NSURL)fallbackURL
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA82690);
  MEMORY[0x270FA5388](v2 - 8);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  EngagementContentRecord.fallbackURL.getter((uint64_t)v4);
  uint64_t v5 = sub_21C2BD740();
  v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_21C2BD6E0();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSURL *)v6;
}

- (NSString)version
{
  return (NSString *)sub_21C237380((uint64_t)self, (uint64_t)a2, (void (*)(void))EngagementContentRecord.version.getter);
}

+ (BOOL)isURLEngagementContent:(id)a3
{
  uint64_t v3 = sub_21C2BD740();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2BD6F0();
  char v7 = static EngagementContentRecord.isURLEngagementContent(url:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

- (AMSUIEngagementContentRecord)initWithURL:(id)a3
{
  uint64_t v3 = sub_21C2BD740();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2BD6F0();
  return (AMSUIEngagementContentRecord *)EngagementContentRecord.init(url:)((uint64_t)v5);
}

- (AMSUIEngagementContentRecord)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21C237CE4((uint64_t)self + OBJC_IVAR___AMSUIEngagementContentRecord_fallbackURL, (uint64_t *)&unk_26AA82690);
  swift_bridgeObjectRelease();
}

@end