@interface DomainNameFormatter
+ (id)domainNameFormatter:(unint64_t)a3;
+ (id)domainNameSet;
- (DomainNameFormatter)initWithMaxLength:(unint64_t)a3;
@end

@implementation DomainNameFormatter

+ (id)domainNameFormatter:(unint64_t)a3
{
  v3 = [DomainNameFormatter alloc];
  v5 = objc_msgSend_initWithMaxLength_(v3, v4, 0);

  return v5;
}

- (DomainNameFormatter)initWithMaxLength:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DomainNameFormatter;
  v5 = [(APFormatter *)&v13 initWithMaxLength:a3];
  if (v5)
  {
    v6 = objc_msgSend_domainNameSet(DomainNameFormatter, v3, v4);
    objc_msgSend_setCharacterSet_(v5, v7, (uint64_t)v6);
    uint64_t v10 = objc_msgSend_invertedSet(v6, v8, v9);
    objc_msgSend_setInvertedCharacterSet_(v5, v11, v10);
  }
  return v5;
}

+ (id)domainNameSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInString_(v2, v3, @".:-*/");
  objc_msgSend_addCharactersInString_(v2, v4, @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
  uint64_t v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v5, v6);
  objc_msgSend_formUnionWithCharacterSet_(v2, v8, v7);

  return v2;
}

@end