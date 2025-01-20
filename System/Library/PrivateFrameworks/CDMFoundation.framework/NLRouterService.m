@interface NLRouterService
+ (BOOL)isEnabled;
- (_TtC13CDMFoundation15NLRouterService)init;
@end

@implementation NLRouterService

- (_TtC13CDMFoundation15NLRouterService)init
{
  return (_TtC13CDMFoundation15NLRouterService *)sub_22651744C();
}

+ (BOOL)isEnabled
{
  return sub_22651763C() & 1;
}

- (void).cxx_destruct
{
  swift_release();
  sub_2263BE498((uint64_t)self + OBJC_IVAR____TtC13CDMFoundation15NLRouterService_cacheManager, &qword_26ABD3F90);
  sub_2264121EC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CDMFoundation15NLRouterService_promptGenerator), *(void *)&self->client[OBJC_IVAR____TtC13CDMFoundation15NLRouterService_promptGenerator]);
  swift_release();
  sub_2263BE498((uint64_t)self + OBJC_IVAR____TtC13CDMFoundation15NLRouterService_tokenizer, &qword_26ABD4058);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC13CDMFoundation15NLRouterService_generativeAssistantHelper);
  swift_release();
}

@end