@interface FKUtility
+ (BOOL)isRomanString:(id)a3;
+ (BOOL)personHasLinkages:(void *)a3;
+ (BOOL)shouldAllowAddingFriendWithRecordID:(int)a3 withFriendListManager:(id)a4 addressBook:(void *)a5 personValueCache:(id)a6;
+ (id)_nameFormatter;
+ (id)compressPhoneNumberString:(id)a3;
+ (id)hashFromData:(id)a3;
+ (id)initialForString:(id)a3;
+ (id)initialsForPerson:(void *)a3;
@end

@implementation FKUtility

+ (BOOL)shouldAllowAddingFriendWithRecordID:(int)a3 withFriendListManager:(id)a4 addressBook:(void *)a5 personValueCache:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  id v10 = a6;
  if (v9)
  {
    ABRecordRef PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a5, v8);
    v12 = (void *)ABRecordCopyValue(PersonWithRecordID, *MEMORY[0x263F24498]);
    int v13 = [v9 containsFriendWithABRecordGUID:v12] ^ 1;

    if (!a5) {
      goto LABEL_9;
    }
  }
  else
  {
    int v13 = 1;
    if (!a5) {
      goto LABEL_9;
    }
  }
  if (v13)
  {
    v14 = [NSNumber numberWithInt:v8];
    v15 = [v10 objectForKey:v14];
    if (!v15)
    {
      ABRecordRef v16 = ABAddressBookGetPersonWithRecordID(a5, v8);
      v17 = NSNumber;
      v18 = +[FKPerson allValuesForPerson:v16];
      v15 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));

      [v10 setObject:v15 forKey:v14];
    }
    LOBYTE(v13) = [v15 unsignedIntegerValue] != 0;
  }
LABEL_9:

  return v13;
}

+ (BOOL)personHasLinkages:(void *)a3
{
  return ABRecordGetIntValue() != -1;
}

+ (id)_nameFormatter
{
  if (_nameFormatter_name_formatter_init != -1) {
    dispatch_once(&_nameFormatter_name_formatter_init, &__block_literal_global);
  }
  v2 = (void *)_nameFormatter_sNameFormatter;

  return v2;
}

uint64_t __27__FKUtility__nameFormatter__block_invoke()
{
  _nameFormatter_sNameFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263F08A78]);

  return MEMORY[0x270F9A758]();
}

+ (id)initialsForPerson:(void *)a3
{
  if (a3 && (v4 = (const void *)ABPersonCopyPreferredLinkedPersonForName()) != 0)
  {
    v5 = v4;
    CFNumberRef v6 = (const __CFNumber *)ABRecordCopyValue(v4, *MEMORY[0x263F244B8]);
    CFComparisonResult v7 = CFNumberCompare(v6, (CFNumberRef)*MEMORY[0x263F244B0], 0);
    CFRelease(v6);
    uint64_t v8 = 0;
    if (v7 == kCFCompareEqualTo)
    {
      id v9 = objc_alloc_init(MEMORY[0x263F08A68]);
      id v10 = (void *)ABRecordCopyValue(v5, *MEMORY[0x263F24408]);
      [v9 setGivenName:v10];

      v11 = (void *)ABRecordCopyValue(v5, *MEMORY[0x263F244D0]);
      [v9 setFamilyName:v11];

      v12 = [a1 _nameFormatter];
      [v12 setStyle:4];
      objc_msgSend(v12, "set_ignoresFallbacks:", 1);
      uint64_t v8 = [v12 stringFromPersonNameComponents:v9];
    }
    if (![v8 length])
    {

      uint64_t v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v8 = 0;
  }
  int v13 = [v8 localizedUppercaseString];

  return v13;
}

+ (id)initialForString:(id)a3
{
  id v3 = a3;
  if ([v3 length] && +[FKUtility isRomanString:](FKUtility, "isRomanString:", v3))
  {
    v4 = objc_msgSend(v3, "substringWithRange:", 0, 1);
    v5 = [MEMORY[0x263F08708] letterCharacterSet];
    uint64_t v6 = [v4 rangeOfCharacterFromSet:v5];

    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  CFComparisonResult v7 = [v4 localizedUppercaseString];

  return v7;
}

+ (BOOL)isRomanString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (_ABStringContainsNonLatinCharacters()) {
      LOBYTE(v4) = 0;
    }
    else {
      int v4 = _ABStringContainsEmojiCharacters() ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

+ (id)compressPhoneNumberString:(id)a3
{
  id v3 = a3;
  int v4 = (void *)CPPhoneNumberCopyHomeCountryCode();
  uint64_t v5 = CFPhoneNumberCreate();
  uint64_t v6 = v3;
  if (v5)
  {
    CFComparisonResult v7 = (const void *)v5;
    String = (void *)CFPhoneNumberCreateString();
    id v9 = (void *)CFPhoneNumberCopyCountryCode();
    [v9 isEqualToString:v4];
    uint64_t v6 = (void *)PNCreateFormattedStringWithCountry();

    CFRelease(v7);
  }

  return v6;
}

+ (id)hashFromData:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = (const void *)[v3 bytes];
  CC_LONG v5 = [v3 length];

  CC_SHA1(v4, v5, md);
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:20];
  CFComparisonResult v7 = [v6 base64EncodedStringWithOptions:1];

  return v7;
}

@end