@interface GMAnalyticsProvider
- (BOOL)sendAction:(int64_t)a3;
- (GMAnalyticsProvider)init;
@end

@implementation GMAnalyticsProvider

- (GMAnalyticsProvider)init
{
  return (GMAnalyticsProvider *)GMAnalyticsProvider.init()();
}

- (BOOL)sendAction:(int64_t)a3
{
  v5 = *(uint64_t (**)(unint64_t, unint64_t, uint64_t (*)(), uint64_t))((char *)&self->super.isa
                                                                                            + OBJC_IVAR___GMAnalyticsProvider_sendFunction);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = self;
  v7 = self;
  char v8 = v5(0xD00000000000002CLL, 0x8000000220C7EE70, sub_220C59E7C, v6);

  swift_release();
  return v8 & 1;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GMAnalyticsProvider_gmAvailabilityProvider);

  swift_release();
}

@end