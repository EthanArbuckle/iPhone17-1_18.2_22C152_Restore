@interface WFWordPressPostType
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)allowedSecureCodingClassesByPropertyKey;
- (NSDictionary)labels;
- (NSString)label;
- (NSString)name;
@end

@implementation WFWordPressPostType

+ (id)JSONKeyPathsByPropertyKey
{
  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = @"name";
  v4[1] = @"label";
  v5[0] = @"name";
  v5[1] = @"label";
  v4[2] = @"labels";
  v5[2] = @"labels";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFWordPressPostType;
  v2 = objc_msgSendSuper2(&v6, sel_allowedSecureCodingClassesByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  [v3 setObject:v4 forKey:@"labels"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDictionary)labels
{
  return self->_labels;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)name
{
  return self->_name;
}

@end