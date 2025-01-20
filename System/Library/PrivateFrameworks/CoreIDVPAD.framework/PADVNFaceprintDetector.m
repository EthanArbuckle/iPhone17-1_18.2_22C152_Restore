@interface PADVNFaceprintDetector
@end

@implementation PADVNFaceprintDetector

uint64_t __52___PADVNFaceprintDetector_requestsForFrame_handler___block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  if (result)
  {
    v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v2 = [v1 persistentDomainForName:*MEMORY[0x263F08100]];

    v3 = [v2 objectForKeyedSubscript:@"CIDVPAD.process-cpu-only"];
    v4 = v3;
    if (!v3) {
      v3 = (void *)MEMORY[0x263EFFA80];
    }
    uint64_t v5 = [v3 BOOLValue];

    return v5;
  }
  return result;
}

uint64_t __37___PADVNFaceprintDetector_invalidate__block_invoke_2()
{
  uint64_t result = os_variant_has_internal_content();
  if (result)
  {
    v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v2 = [v1 persistentDomainForName:*MEMORY[0x263F08100]];

    v3 = [v2 objectForKeyedSubscript:@"CIDVPAD.use-verbose-logging"];
    v4 = v3;
    if (!v3) {
      v3 = (void *)MEMORY[0x263EFFA80];
    }
    uint64_t v5 = [v3 BOOLValue];

    return v5;
  }
  return result;
}

@end