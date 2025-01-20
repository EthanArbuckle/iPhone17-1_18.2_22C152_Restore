@interface NSCharacterSet
@end

@implementation NSCharacterSet

void __68__NSCharacterSet_MailCoreAdditions__ef_unsafeDomainNameCharacterSet__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F28E58], "characterSetWithRange:", 48, 10);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInRange:", 65, 26);
  objc_msgSend(v2, "addCharactersInRange:", 97, 26);
  [v2 addCharactersInString:@"-."];
  [v2 invert];
  uint64_t v0 = [v2 copy];
  v1 = (void *)ef_unsafeDomainNameCharacterSet_unsafeDomainNameCharacterSet;
  ef_unsafeDomainNameCharacterSet_unsafeDomainNameCharacterSet = v0;
}

void __74__NSCharacterSet_MailCoreAdditions__ef_unsafeAddressLocalPartCharacterSet__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F28E58], "characterSetWithRange:", 48, 10);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInRange:", 65, 26);
  objc_msgSend(v2, "addCharactersInRange:", 97, 26);
  [v2 invert];
  uint64_t v0 = [v2 copy];
  v1 = (void *)ef_unsafeAddressLocalPartCharacterSet_unsafeAddressLocalPartCharacterSet;
  ef_unsafeAddressLocalPartCharacterSet_unsafeAddressLocalPartCharacterSet = v0;
}

void __69__NSCharacterSet_MailCoreAdditions__ef_asciiAlphaNumericCharacterSet__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F28E58], "characterSetWithRange:", 48, 10);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInRange:", 65, 26);
  objc_msgSend(v2, "addCharactersInRange:", 97, 26);
  uint64_t v0 = [v2 copy];
  v1 = (void *)ef_asciiAlphaNumericCharacterSet_sAsciiAlphaNumericCharacterSet;
  ef_asciiAlphaNumericCharacterSet_sAsciiAlphaNumericCharacterSet = v0;
}

void __69__NSCharacterSet_MailCoreAdditions__ef_rfc6376WhitespaceCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" \t"];
  v1 = (void *)ef_rfc6376WhitespaceCharacterSet_rfc6376WhitespaceCharacterSet;
  ef_rfc6376WhitespaceCharacterSet_rfc6376WhitespaceCharacterSet = v0;
}

@end