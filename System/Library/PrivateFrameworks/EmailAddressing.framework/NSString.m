@interface NSString
@end

@implementation NSString

void __60__NSString_EmailAddressingAdditions__ea_isLegalEmailAddress__block_invoke()
{
  uint64_t v0 = ;
  v1 = (void *)ea_isLegalEmailAddress_validLocalPartSet;
  ea_isLegalEmailAddress_validLocalPartSet = v0;

  uint64_t v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-."];
  v3 = (void *)ea_isLegalEmailAddress_validDomainPartSet;
  ea_isLegalEmailAddress_validDomainPartSet = v2;

  id v6 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
  uint64_t v4 = [v6 invertedSet];
  v5 = (void *)ea_isLegalEmailAddress_invalidTLDPartSet;
  ea_isLegalEmailAddress_invalidTLDPartSet = v4;
}

@end