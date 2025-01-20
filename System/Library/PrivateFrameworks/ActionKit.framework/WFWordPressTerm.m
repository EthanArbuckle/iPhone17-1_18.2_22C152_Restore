@interface WFWordPressTerm
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)termIdJSONTransformer;
- (NSNumber)termId;
- (NSString)name;
- (NSString)taxonomy;
@end

@implementation WFWordPressTerm

+ (id)termIdJSONTransformer
{
  return +[WFWordPressBlog blogIdJSONTransformer];
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = @"termId";
  v4[1] = @"name";
  v5[0] = @"term_id";
  v5[1] = @"name";
  v4[2] = @"taxonomy";
  v5[2] = @"taxonomy";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taxonomy, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_termId, 0);
}

- (NSString)taxonomy
{
  return self->_taxonomy;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)termId
{
  return self->_termId;
}

@end