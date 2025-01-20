@interface NSData(IntentsFoundation)
+ (id)if_dataWithAuditToken:()IntentsFoundation;
+ (id)if_dataWithValue:()IntentsFoundation;
- (id)if_valueOfType:()IntentsFoundation;
- (void)if_auditToken;
@end

@implementation NSData(IntentsFoundation)

- (void)if_auditToken
{
  objc_msgSend(a1, "if_valueOfType:", "{?=[8I]}");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *a2 = 0u;
  a2[1] = 0u;
  [v3 getValue:a2];
}

- (id)if_valueOfType:()IntentsFoundation
{
  uint64_t v5 = [a1 length];
  NSUInteger sizep = 0;
  NSGetSizeAndAlignment(a3, &sizep, 0);
  v6 = 0;
  if (v5 == sizep)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", objc_msgSend(a1, "bytes"), a3);
  }
  return v6;
}

+ (id)if_dataWithAuditToken:()IntentsFoundation
{
  v4 = [MEMORY[0x1E4F29238] value:a3 withObjCType:"{?=[8I]}"];
  uint64_t v5 = objc_msgSend(a1, "if_dataWithValue:", v4);

  return v5;
}

+ (id)if_dataWithValue:()IntentsFoundation
{
  if (a3)
  {
    NSUInteger sizep = 0;
    id v3 = a3;
    NSGetSizeAndAlignment((const char *)[v3 objCType], &sizep, 0);
    v4 = malloc_type_malloc(sizep, 0xBBD9uLL);
    [v3 getValue:v4];

    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:sizep];
    free(v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

@end