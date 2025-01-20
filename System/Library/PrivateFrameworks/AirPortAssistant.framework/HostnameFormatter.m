@interface HostnameFormatter
+ (id)hostnameFormatter:(unint64_t)a3;
+ (id)hostnameSet;
- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5;
@end

@implementation HostnameFormatter

+ (id)hostnameFormatter:(unint64_t)a3
{
  v5 = [HostnameFormatter alloc];
  uint64_t v8 = objc_msgSend_hostnameSet(a1, v6, v7);
  v10 = objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);

  return v10;
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  uint64_t v10 = objc_msgSend_rangeOfString_options_(a3, a2, @".local", 4);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v10 = objc_msgSend_length(a3, v9, 0x7FFFFFFFFFFFFFFFLL);
  }
  uint64_t v11 = objc_msgSend_substringToIndex_(a3, v9, v10);
  v16.receiver = self;
  v16.super_class = (Class)HostnameFormatter;
  unsigned __int8 v12 = [(APFormatter *)&v16 isPartialStringValid:v11 newEditingString:a4 errorDescription:a5];
  BOOL v14 = v12;
  if (a4 && (v12 & 1) == 0) {
    *a4 = (id)objc_msgSend_stringWithFormat_(NSString, v13, @"%@.local", *a4);
  }
  return v14;
}

+ (id)hostnameSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInString_(v2, v3, @"-");
  objc_msgSend_addCharactersInString_(v2, v4, @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
  uint64_t v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v5, v6);
  objc_msgSend_formUnionWithCharacterSet_(v2, v8, v7);

  return v2;
}

@end