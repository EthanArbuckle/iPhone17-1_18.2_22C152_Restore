@interface BMPoirotSchematizerShim.BMPoirotRepeatedFieldEnumerator
- (_TtCC12BiomeStreams23BMPoirotSchematizerShimP33_6AF5E9B2F4D56B14EB8E6E9336EA174F31BMPoirotRepeatedFieldEnumerator)init;
- (id)nextObject;
@end

@implementation BMPoirotSchematizerShim.BMPoirotRepeatedFieldEnumerator

- (id)nextObject
{
  v2 = self;
  BMPoirotSchematizerShim.BMPoirotRepeatedFieldEnumerator.nextObject()(&v10);

  uint64_t v3 = v11;
  if (v11)
  {
    v4 = __swift_project_boxed_opaque_existential_1(&v10, v11);
    uint64_t v5 = *(void *)(v3 - 8);
    MEMORY[0x1F4188790](v4);
    v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    v8 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v10);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_TtCC12BiomeStreams23BMPoirotSchematizerShimP33_6AF5E9B2F4D56B14EB8E6E9336EA174F31BMPoirotRepeatedFieldEnumerator)init
{
}

- (void).cxx_destruct
{
}

@end