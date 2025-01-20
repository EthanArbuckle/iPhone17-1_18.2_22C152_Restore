@interface WFTrelloObject
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
- (NSString)identifier;
- (NSString)name;
- (void)setName:(id)a3;
@end

@implementation WFTrelloObject

+ (id)JSONKeyPathsByPropertyKey
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"name";
  v4[1] = @"identifier";
  v5[0] = @"name";
  v5[1] = @"id";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

@end