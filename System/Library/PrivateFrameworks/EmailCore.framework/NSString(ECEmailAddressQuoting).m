@interface NSString(ECEmailAddressQuoting)
- (__CFString)ecemailaddress_trimmedAndQuotedLocalPart;
- (id)ecemailaddress_quotedString;
- (id)ecemailaddress_trimmedAndQuotedDisplayName;
- (id)ecemailaddress_uniquedDomain;
@end

@implementation NSString(ECEmailAddressQuoting)

- (id)ecemailaddress_uniquedDomain
{
  if (ecemailaddress_uniquedDomain_onceToken != -1) {
    dispatch_once(&ecemailaddress_uniquedDomain_onceToken, &__block_literal_global_255);
  }
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__NSString_ECEmailAddressQuoting__ecemailaddress_uniquedDomain__block_invoke_258;
  v4[3] = &unk_1E63EE510;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)ecemailaddress_uniquedDomain_uniqueStringsQueue, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (__CFString)ecemailaddress_trimmedAndQuotedLocalPart
{
  if (ecemailaddress_trimmedAndQuotedLocalPart_onceToken != -1) {
    dispatch_once(&ecemailaddress_trimmedAndQuotedLocalPart_onceToken, &__block_literal_global_226);
  }
  id v2 = a1;
  if ([v2 length])
  {
    v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v4 = [v2 stringByTrimmingCharactersInSet:v3];

    if ([(__CFString *)v4 length]
      && ([(__CFString *)v4 rangeOfCharacterFromSet:ecemailaddress_trimmedAndQuotedLocalPart_specials] != 0x7FFFFFFFFFFFFFFFLL|| [(__CFString *)v4 characterAtIndex:0] == 46|| [(__CFString *)v4 characterAtIndex:[(__CFString *)v4 length] - 1] == 46|| [(__CFString *)v4 rangeOfString:@".."] != 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v5 = [(__CFString *)v4 ecemailaddress_quotedString];
      goto LABEL_12;
    }
  }
  else
  {

    v4 = @"\"\"";
  }
  uint64_t v5 = v4;
  v4 = v5;
LABEL_12:
  v6 = v5;

  return v6;
}

- (id)ecemailaddress_trimmedAndQuotedDisplayName
{
  if (ecemailaddress_trimmedAndQuotedDisplayName_onceToken != -1) {
    dispatch_once(&ecemailaddress_trimmedAndQuotedDisplayName_onceToken, &__block_literal_global_238);
  }
  id v2 = a1;
  if (![v2 length]) {
    goto LABEL_7;
  }
  v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];

  if (![v4 length]
    || [v4 rangeOfCharacterFromSet:ecemailaddress_trimmedAndQuotedDisplayName_specials] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = v4;
LABEL_7:
    id v5 = v2;
    v4 = v5;
    goto LABEL_8;
  }
  objc_msgSend(v4, "ecemailaddress_quotedString");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v6 = v5;

  return v6;
}

- (id)ecemailaddress_quotedString
{
  v1 = (void *)[a1 mutableCopy];
  if ([v1 length])
  {
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v1, "length"));
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\\\", 0, 0, objc_msgSend(v1, "length"));
    objc_msgSend(v1, "replaceCharactersInRange:withString:", 0, 0, @"\"");
    objc_msgSend(v1, "replaceCharactersInRange:withString:", objc_msgSend(v1, "length"), 0, @"\"");
  }
  return v1;
}

@end