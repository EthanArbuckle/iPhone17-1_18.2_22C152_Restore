@interface SFSiriReaderPlaybackPositionAndStateControllerAccessibility
@end

@implementation SFSiriReaderPlaybackPositionAndStateControllerAccessibility

id __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) safeBoolForKey:@"_isPlaying"]) {
    v1 = @"reader.pause";
  }
  else {
    v1 = @"reader.play";
  }
  v2 = accessibilitySafariServicesLocalizedString(v1);

  return v2;
}

id __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF980] array];
  id v3 = objc_alloc(MEMORY[0x263F1C390]);
  v4 = accessibilitySafariServicesLocalizedString(@"skip.backward");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_3;
  v11[3] = &unk_26514AB08;
  v11[4] = *(void *)(a1 + 32);
  v5 = (void *)[v3 initWithName:v4 actionHandler:v11];

  [v2 addObject:v5];
  id v6 = objc_alloc(MEMORY[0x263F1C390]);
  v7 = accessibilitySafariServicesLocalizedString(@"skip.forward");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_5;
  v10[3] = &unk_26514AB08;
  v10[4] = *(void *)(a1 + 32);
  v8 = (void *)[v6 initWithName:v7 actionHandler:v10];

  [v2 addObject:v8];

  return v2;
}

uint64_t __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_3()
{
  return 1;
}

uint64_t __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) decrementValue:0];
}

uint64_t __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_5()
{
  return 1;
}

uint64_t __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) incrementValue:0];
}

@end