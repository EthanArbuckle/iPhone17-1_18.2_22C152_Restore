@interface NSSetupLibXML
@end

@implementation NSSetupLibXML

void ___NSSetupLibXML_block_invoke()
{
  xmlInitParser();
  __originalLoader = xmlGetExternalEntityLoader();

  xmlSetExternalEntityLoader((xmlExternalEntityLoader)_xmlExternalEntityLoader);
}

@end