@interface NSString
@end

@implementation NSString

uint64_t __63__NSString_ECEmailAddressQuoting__ecemailaddress_uniquedDomain__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.emailcore.domain_uniqueStrings", v0);
  v2 = (void *)ecemailaddress_uniquedDomain_uniqueStringsQueue;
  ecemailaddress_uniquedDomain_uniqueStringsQueue = (uint64_t)v1;

  ecemailaddress_uniquedDomain_uniqueStrings = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:100];
  return MEMORY[0x1F41817F8]();
}

uint64_t __77__NSString_ECEmailAddressQuoting__ecemailaddress_trimmedAndQuotedDisplayName__block_invoke()
{
  ecemailaddress_trimmedAndQuotedDisplayName_specials = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"()<>[]:;@\\,.\""];
  return MEMORY[0x1F41817F8]();
}

uint64_t __75__NSString_ECEmailAddressQuoting__ecemailaddress_trimmedAndQuotedLocalPart__block_invoke()
{
  ecemailaddress_trimmedAndQuotedLocalPart_specials = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" ()<>[]:;@\\,\""];
  return MEMORY[0x1F41817F8]();
}

uint64_t __53__NSString_ECPersonNameComponents__ec_nameExtensions__block_invoke()
{
  ec_nameExtensions_nameExtensions = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"jr.", @"sr.", @"iii", @"m.d.", @"md", @"d.d.s.", @"dds", @"ph.d.", @"phd", @"m.b.a.", @"mba", @"esq.", @"esq", @"jr", @"sr", @"ii", @"iv",
                                       @"v",
                                       @"vi",
                                       @"vii",
                                       @"viii",
                                       @"ix",
                                       0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __54__NSString_ECPersonNameComponents__ec_partialSurnames__block_invoke()
{
  ec_partialSurnames_partialSurnames = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"de", @"den", @"der", @"di", @"do", @"du", @"la", @"le", @"les", @"van", @"von", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __63__NSString_ECEmailAddressQuoting__ecemailaddress_uniquedDomain__block_invoke_258(uint64_t a1)
{
  if ((unint64_t)[(id)ecemailaddress_uniquedDomain_uniqueStrings count] >= 0x64) {
    [(id)ecemailaddress_uniquedDomain_uniqueStrings removeAllObjects];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend((id)ecemailaddress_uniquedDomain_uniqueStrings, "ef_uniquedObject:", *(void *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

@end