@interface MPModelRadioStation(BehaviorMusicSharePlayAdditions)
- (id)msp_shortDescription;
@end

@implementation MPModelRadioStation(BehaviorMusicSharePlayAdditions)

- (id)msp_shortDescription
{
  v14.receiver = a1;
  v14.super_class = (Class)&off_26CC5CE30;
  v2 = objc_msgSendSuper2(&v14, sel_msp_shortDescription);
  v3 = (void *)[v2 mutableCopy];

  v4 = (void *)MEMORY[0x263F11F78];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __76__MPModelRadioStation_BehaviorMusicSharePlayAdditions__msp_shortDescription__block_invoke;
  v11 = &unk_2643C5EE8;
  id v12 = v3;
  v13 = a1;
  id v5 = v3;
  [v4 performWithoutEnforcement:&v8];
  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

@end