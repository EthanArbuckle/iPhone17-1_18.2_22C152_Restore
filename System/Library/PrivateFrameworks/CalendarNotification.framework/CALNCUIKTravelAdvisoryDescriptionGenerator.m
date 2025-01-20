@interface CALNCUIKTravelAdvisoryDescriptionGenerator
+ (CALNCUIKTravelAdvisoryDescriptionGenerator)sharedInstance;
- (id)travelAdvisoryDescriptionOfType:(unint64_t)a3 hypothesis:(id)a4 location:(id)a5;
@end

@implementation CALNCUIKTravelAdvisoryDescriptionGenerator

+ (CALNCUIKTravelAdvisoryDescriptionGenerator)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CALNCUIKTravelAdvisoryDescriptionGenerator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_14 != -1) {
    dispatch_once(&sharedInstance_onceToken_14, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_11;
  return (CALNCUIKTravelAdvisoryDescriptionGenerator *)v2;
}

uint64_t __60__CALNCUIKTravelAdvisoryDescriptionGenerator_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_11 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (id)travelAdvisoryDescriptionOfType:(unint64_t)a3 hypothesis:(id)a4 location:(id)a5
{
  return (id)[MEMORY[0x263F30528] travelAdvisoryDescriptionOfType:a3 hypothesis:a4 location:a5];
}

@end