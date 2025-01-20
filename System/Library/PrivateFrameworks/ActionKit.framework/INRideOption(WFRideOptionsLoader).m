@interface INRideOption(WFRideOptionsLoader)
- (BOOL)wf_isAvailableForPartySize:()WFRideOptionsLoader;
@end

@implementation INRideOption(WFRideOptionsLoader)

- (BOOL)wf_isAvailableForPartySize:()WFRideOptionsLoader
{
  v5 = [a1 availablePartySizeOptions];
  uint64_t v6 = [v5 count];

  BOOL v7 = 1;
  if (a3 && v6)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8 = [a1 availablePartySizeOptions];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__INRideOption_WFRideOptionsLoader__wf_isAvailableForPartySize___block_invoke;
    v10[3] = &unk_264E57CD0;
    v10[4] = &v11;
    v10[5] = a3;
    [v8 enumerateObjectsUsingBlock:v10];

    BOOL v7 = *((unsigned char *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }
  return v7;
}

@end