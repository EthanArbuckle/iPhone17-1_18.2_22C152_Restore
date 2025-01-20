@interface SGSchemaKeys
+ (BOOL)schemaURLString:(id)a3 isEqualTo:(id)a4;
@end

@implementation SGSchemaKeys

+ (BOOL)schemaURLString:(id)a3 isEqualTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 hasPrefix:@"http://schema.org/"];
  char v8 = [v6 hasPrefix:@"http://schema.org/"];
  char v9 = v8;
  if (v7 & 1) != 0 || (v8)
  {
    if ((v7 & 1) == 0)
    {
      uint64_t v10 = [[NSString alloc] initWithFormat:@"http://schema.org/%@", v5];

      id v5 = (id)v10;
    }
    if ((v9 & 1) == 0)
    {
      uint64_t v11 = [[NSString alloc] initWithFormat:@"http://schema.org/%@", v6];

      id v6 = (id)v11;
    }
  }
  char v12 = [v5 isEqualToString:v6];

  return v12;
}

@end