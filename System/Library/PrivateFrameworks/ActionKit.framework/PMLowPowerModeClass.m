@interface PMLowPowerModeClass
@end

@implementation PMLowPowerModeClass

void __get_PMLowPowerModeClass_block_invoke(uint64_t a1)
{
  LowPowerModeLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_PMLowPowerMode");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_PMLowPowerModeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x263F08690] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class get_PMLowPowerModeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFLowPowerModeSettingsClient.m", 25, @"Unable to find class %s", "_PMLowPowerMode");

    __break(1u);
  }
}

@end