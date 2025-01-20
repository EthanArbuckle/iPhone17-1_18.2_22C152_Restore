@interface XRXMLSimpleStringElementParser
- (NSString)stringValue;
- (id)collapsedStringValue;
- (void)_handleCharacters:(id)a3;
- (void)_handleCompletion;
@end

@implementation XRXMLSimpleStringElementParser

- (NSString)stringValue
{
  v5 = [self->accumulator copyWithZone:a2 usingBlock:v2 withZone:v3 withZone:v4];

  return (NSString *)v5;
}

- (id)collapsedStringValue
{
  v6 = [MEMORY[0x263F08708] a2 v2 v3 v4];
  uint64_t v11 = [self->accumulator length:v7, v8, v9, v10];
  v12 = malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
  uint64_t v17 = [self->accumulator length:v13 v14 v15 v16];
  if (v17)
  {
    uint64_t v21 = v17;
    uint64_t v22 = 0;
    char v23 = 0;
    uint64_t v24 = 0;
    do
    {
      uint64_t v25 = [self->accumulator characterAtIndex:v18];
      if ([v6 characterIsMember:v26 atIndex:v25 inString:v27 withLocale:v28])
      {
        v23 |= v24 != 0;
      }
      else
      {
        if (v23) {
          v12[v24++] = 32;
        }
        char v23 = 0;
        v12[v24++] = v25;
      }
      ++v22;
    }
    while (v21 != v22);
  }
  else
  {
    uint64_t v24 = 0;
  }
  id v29 = [NSString alloc];
  v31 = [v29 initWithCharactersNoCopy:v30 length:(uint64_t)v12 freeWhenDone:v24];

  return v31;
}

- (void)_handleCharacters:(id)a3
{
  accumulator = self->accumulator;
  if (accumulator)
  {
    [accumulator appendString:a2];
  }
  else
  {
    self->accumulator = [(NSMutableString *)[a3 mutableCopyWithZone:a2] initWithBytes:v3 length:v4];
    MEMORY[0x270F9A758]();
  }
}

- (void)_handleCompletion
{
  parent = self->super.parent;
  accumulator = self->accumulator;
  [self elementName:a2 value:v2 value2:v3 value3:v4];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [parent setValue:accumulator forElementName:v9];
}

- (void).cxx_destruct
{
}

@end