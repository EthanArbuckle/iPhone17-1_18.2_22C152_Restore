@interface NSJSONSerialization(CRXUExtensions)
+ (id)crxu_JSONObjectWithString:()CRXUExtensions error:;
+ (id)crxu_stringWithJSONObject:()CRXUExtensions error:;
@end

@implementation NSJSONSerialization(CRXUExtensions)

+ (id)crxu_stringWithJSONObject:()CRXUExtensions error:
{
  id v9 = 0;
  v5 = [MEMORY[0x263F08900] dataWithJSONObject:a3 options:3 error:&v9];
  id v6 = v9;
  if (v5)
  {
    v7 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    v7 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (v6) {
    *a4 = v6;
  }
LABEL_7:

  return v7;
}

+ (id)crxu_JSONObjectWithString:()CRXUExtensions error:
{
  if (a3)
  {
    v5 = [a3 dataUsingEncoding:4];
    id v10 = 0;
    id v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:1 error:&v10];
    id v7 = v10;
    v8 = v7;
    if (a4 && v7) {
      *a4 = v7;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

@end