@interface EDAMLogResponse
+ (id)structFields;
+ (id)structName;
@end

@implementation EDAMLogResponse

+ (id)structFields
{
  v2 = (void *)structFields_structFields_2068;
  if (!structFields_structFields_2068)
  {
    v2 = (void *)MEMORY[0x263EFFA68];
    structFields_structFields_2068 = MEMORY[0x263EFFA68];
  }
  return v2;
}

+ (id)structName
{
  return @"LogResponse";
}

@end