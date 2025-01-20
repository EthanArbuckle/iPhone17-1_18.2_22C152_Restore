@interface WFUlyssesSheet
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)allowedSecureCodingClassesByPropertyKey;
- (NSArray)keywords;
- (NSArray)notes;
- (NSString)identifier;
- (NSString)text;
- (NSString)title;
@end

@implementation WFUlyssesSheet

+ (id)JSONKeyPathsByPropertyKey
{
  v5[5] = *MEMORY[0x263EF8340];
  v4[0] = @"identifier";
  v4[1] = @"title";
  v5[0] = @"identifier";
  v5[1] = @"title";
  v4[2] = @"text";
  v4[3] = @"keywords";
  v5[2] = @"text";
  v5[3] = @"keywords";
  v4[4] = @"notes";
  v5[4] = @"notes";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  v9[2] = *MEMORY[0x263EF8340];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFUlyssesSheet;
  v2 = objc_msgSendSuper2(&v7, sel_allowedSecureCodingClassesByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  [v3 setObject:v4 forKey:@"notes"];

  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v3 setObject:v5 forKey:@"keywords"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)notes
{
  return self->_notes;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

@end