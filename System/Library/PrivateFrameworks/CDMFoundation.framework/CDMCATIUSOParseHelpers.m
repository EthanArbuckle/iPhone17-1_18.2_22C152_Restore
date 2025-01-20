@interface CDMCATIUSOParseHelpers
+ (id)buildCrisisSupportParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6;
+ (id)buildCrisisSupportParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6 addEntitySpans:(BOOL)a7;
+ (id)buildSocialConversationParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6;
+ (id)buildSocialConversationParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6 addEntitySpans:(BOOL)a7;
- (_TtC13CDMFoundation22CDMCATIUSOParseHelpers)init;
@end

@implementation CDMCATIUSOParseHelpers

+ (id)buildSocialConversationParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6
{
  return sub_22642DFBC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22642DE04);
}

+ (id)buildSocialConversationParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6 addEntitySpans:(BOOL)a7
{
  return sub_22642E9F8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, sub_22642DE54);
}

+ (id)buildCrisisSupportParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6
{
  return sub_22642DFBC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22642DF6C);
}

+ (id)buildCrisisSupportParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6 addEntitySpans:(BOOL)a7
{
  return sub_22642E9F8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, sub_22642E0BC);
}

- (_TtC13CDMFoundation22CDMCATIUSOParseHelpers)init
{
  return (_TtC13CDMFoundation22CDMCATIUSOParseHelpers *)CDMCATIUSOParseHelpers.init()();
}

@end