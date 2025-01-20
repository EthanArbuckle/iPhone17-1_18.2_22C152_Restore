@interface NSURL
@end

@implementation NSURL

void __62__NSURL_BRCUbiquitousAttributes__brc_attributesValues_lookup___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)brc_attributesValues_lookup____personalPersona;
  brc_attributesValues_lookup____personalPersona = v0;
}

@end