@interface NSBundle(ControlCenterUIPrototyping)
- (uint64_t)ccui_prototypeModuleSize;
@end

@implementation NSBundle(ControlCenterUIPrototyping)

- (uint64_t)ccui_prototypeModuleSize
{
  v1 = [a1 infoDictionary];
  v2 = objc_msgSend(v1, "bs_safeDictionaryForKey:", @"_CCModuleSizePROTOTYPE");

  if (v2) {
    uint64_t v3 = CCUIMakeLayoutSizeFromDictionary(v2, 1);
  }
  else {
    uint64_t v3 = -1;
  }

  return v3;
}

@end