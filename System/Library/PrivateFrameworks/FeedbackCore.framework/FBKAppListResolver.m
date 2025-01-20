@interface FBKAppListResolver
+ (id)displayValueForChoiceValue:(id)a3;
- (BOOL)didFetch;
- (FBKAppListResolver)initWithServerSideChoices:(id)a3;
- (NSArray)prefetchedChoices;
- (id)choices;
- (void)prefetchChoices;
- (void)setDidFetch:(BOOL)a3;
- (void)setPrefetchedChoices:(id)a3;
@end

@implementation FBKAppListResolver

- (FBKAppListResolver)initWithServerSideChoices:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKAppListResolver;
  v5 = [(FBKAppListResolver *)&v9 init];
  if (v5)
  {
    if (v4) {
      v6 = (NSArray *)v4;
    }
    else {
      v6 = (NSArray *)MEMORY[0x263EFFA68];
    }
    prefetchedChoices = v5->_prefetchedChoices;
    v5->_prefetchedChoices = v6;
  }
  return v5;
}

- (NSArray)prefetchedChoices
{
  return self->_prefetchedChoices;
}

- (void)setPrefetchedChoices:(id)a3
{
}

- (BOOL)didFetch
{
  return self->_didFetch;
}

- (void)setDidFetch:(BOOL)a3
{
  self->_didFetch = a3;
}

- (void).cxx_destruct
{
}

+ (id)displayValueForChoiceValue:(id)a3
{
  uint64_t v3 = sub_22A4B3458();
  _sSo18FBKAppListResolverC12FeedbackCoreE12displayValue09forChoiceG0S2S_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)prefetchChoices
{
  v2 = self;
  FBKAppListResolver.prefetchChoices()();
}

- (id)choices
{
  v2 = self;
  FBKAppListResolver.choices()();

  sub_22A40F5A0(0, (unint64_t *)&qword_268376340);
  uint64_t v3 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return v3;
}

@end