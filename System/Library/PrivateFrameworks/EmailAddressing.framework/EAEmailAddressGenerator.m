@interface EAEmailAddressGenerator
+ (id)formattedAddressWithName:(id)a3 email:(id)a4 useQuotes:(BOOL)a5;
+ (id)stringByTrimmingCommasSpacesQuotesFromString:(id)a3;
@end

@implementation EAEmailAddressGenerator

+ (id)formattedAddressWithName:(id)a3 email:(id)a4 useQuotes:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F089D8] string];
  if ([v7 length])
  {
    [v9 appendString:v7];
    if (v5
      && (![v7 hasPrefix:@"\""]
       || ([v7 hasSuffix:@"\""] & 1) == 0))
    {
      if (formattedAddressWithName_email_useQuotes__onceToken != -1) {
        dispatch_once(&formattedAddressWithName_email_useQuotes__onceToken, &__block_literal_global);
      }
      if ([v7 rangeOfCharacterFromSet:formattedAddressWithName_email_useQuotes__requiresQuotes] != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v9, "length"));
        objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\\\", 0, 0, objc_msgSend(v9, "length"));
        objc_msgSend(v9, "replaceCharactersInRange:withString:", 0, 0, @"\"");
        objc_msgSend(v9, "replaceCharactersInRange:withString:", objc_msgSend(v9, "length"), 0, @"\"");
      }
    }
  }
  if ([v8 length])
  {
    if ([v9 length])
    {
      [v9 appendString:@" <"];
      [v9 appendString:v8];
      [v9 appendString:@">"];
    }
    else
    {
      [v9 appendString:v8];
    }
  }

  return v9;
}

uint64_t __68__EAEmailAddressGenerator_formattedAddressWithName_email_useQuotes___block_invoke()
{
  formattedAddressWithName_email_useQuotes__requiresQuotes = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"()<>[]:;@\\,.\""];
  return MEMORY[0x270F9A758]();
}

+ (id)stringByTrimmingCommasSpacesQuotesFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (!v4) {
    goto LABEL_16;
  }
  unsigned __int16 v5 = [v3 characterAtIndex:0];
  char v6 = 0;
  uint64_t v7 = 1;
  while (v5 <= 0x2Cu && ((1 << v5) & 0x100500000000) != 0)
  {
    v6 ^= v5 == 34;
    if (v4 == v7)
    {
      unint64_t v9 = v4;
      goto LABEL_9;
    }
    uint64_t v8 = v7 + 1;
    unsigned __int16 v5 = objc_msgSend(v3, "characterAtIndex:");
    uint64_t v7 = v8;
  }
  unint64_t v9 = v7 - 1;
LABEL_9:
  unint64_t v10 = v4 - 1;
  unsigned __int16 v11 = [v3 characterAtIndex:v10];
  char v12 = 0;
  while (v10 > v9)
  {
    if (v11 > 0x2Cu) {
      break;
    }
    if (((1 << v11) & 0x100500000000) == 0) {
      break;
    }
    --v10;
    v12 ^= v11 == 34;
    if (v10 <= v9) {
      break;
    }
    unsigned __int16 v11 = [v3 characterAtIndex:v10];
  }
  if (v10 < v9)
  {
LABEL_16:
    v13 = &stru_26C55BFE0;
    goto LABEL_22;
  }
  objc_msgSend(v3, "substringWithRange:", v9, v10 - v9 + 1);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
  if (v12 & 1 | ((v6 & 1) == 0))
  {
    if (v6 & 1 | ((v12 & 1) == 0)) {
      goto LABEL_22;
    }
    uint64_t v15 = [(__CFString *)v14 stringByAppendingString:@"\""];
  }
  else
  {
    uint64_t v15 = [@"\"" stringByAppendingString:v14];
  }
  v16 = (__CFString *)v15;

  v13 = v16;
LABEL_22:

  return v13;
}

@end