@interface MKLocationShifterClass
@end

@implementation MKLocationShifterClass

Class __get_MKLocationShifterClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!MapKitLibraryCore_frameworkLibrary_12732)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __MapKitLibraryCore_block_invoke_12733;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_2642884B0;
    uint64_t v8 = 0;
    MapKitLibraryCore_frameworkLibrary_12732 = _sl_dlopen();
  }
  if (!MapKitLibraryCore_frameworkLibrary_12732)
  {
    v3 = [MEMORY[0x263F08690] currentHandler];
    v4 = [NSString stringWithUTF8String:"void *MapKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"DCMapsLink+WFLocationCoercions.m", 14, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("_MKLocationShifter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v3 = [MEMORY[0x263F08690] currentHandler];
    v5 = [NSString stringWithUTF8String:"Class get_MKLocationShifterClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"DCMapsLink+WFLocationCoercions.m", 15, @"Unable to find class %s", "_MKLocationShifter");

LABEL_10:
    __break(1u);
  }
  get_MKLocationShifterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end