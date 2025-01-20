@interface GEORisonParser
- (GEORisonParser)init;
- (id)BOOLWithReaderInfo:(id *)a3;
- (id)arrayWithReaderInfo:(id *)a3;
- (id)dictionaryWithReaderInfo:(id *)a3;
- (id)keyWithReaderInfo:(id *)a3;
- (id)nullWithReaderInfo:(id *)a3;
- (id)numberWithReaderInfo:(id *)a3;
- (id)objectFromRisonString:(id)a3;
- (id)objectWithReaderInfo:(id *)a3;
- (id)stringFromArray:(id)a3;
- (id)stringFromDictionary:(id)a3;
- (id)stringFromNull:(id)a3;
- (id)stringFromNumber:(id)a3;
- (id)stringFromRisonObject:(id)a3;
- (id)stringFromString:(id)a3;
- (id)stringLiteralWithReaderInfo:(id *)a3;
@end

@implementation GEORisonParser

- (GEORisonParser)init
{
  v11.receiver = self;
  v11.super_class = (Class)GEORisonParser;
  v2 = [(GEORisonParser *)&v11 init];
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    formatter = v2->_formatter;
    v2->_formatter = v3;

    [(NSNumberFormatter *)v2->_formatter setNumberStyle:1];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
    [(NSNumberFormatter *)v2->_formatter setLocale:v5];

    v6 = (NSMutableCharacterSet *)objc_alloc_init(MEMORY[0x1E4F28E58]);
    risonTerminators = v2->_risonTerminators;
    v2->_risonTerminators = v6;

    [(NSMutableCharacterSet *)v2->_risonTerminators addCharactersInString:@",=()"];
    v8 = (NSMutableCharacterSet *)objc_alloc_init(MEMORY[0x1E4F28E58]);
    risonEscapes = v2->_risonEscapes;
    v2->_risonEscapes = v8;

    [(NSMutableCharacterSet *)v2->_risonEscapes addCharactersInString:@"!'"];
  }
  return v2;
}

- (id)objectFromRisonString:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && (v5 = (const char *)[v4 UTF8String], (v8[0] = v5) != 0))
  {
    v8[1] = strlen(v5);
    v8[2] = 0;
    v6 = [(GEORisonParser *)self objectWithReaderInfo:v8];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)objectWithReaderInfo:(id *)a3
{
  unint64_t var2 = a3->var2;
  int v4 = a3->var0[var2];
  if (v4 != 33)
  {
    if (v4 == 39)
    {
      uint64_t v5 = -[GEORisonParser stringLiteralWithReaderInfo:](self, "stringLiteralWithReaderInfo:");
    }
    else
    {
      if (v4 == 40) {
        -[GEORisonParser dictionaryWithReaderInfo:](self, "dictionaryWithReaderInfo:");
      }
      else {
      uint64_t v5 = -[GEORisonParser numberWithReaderInfo:](self, "numberWithReaderInfo:");
      }
    }
    goto LABEL_17;
  }
  v6 = 0;
  int v7 = a3->var0[var2 + 1];
  if (v7 > 109)
  {
    if (v7 == 110)
    {
      uint64_t v5 = -[GEORisonParser nullWithReaderInfo:](self, "nullWithReaderInfo:");
      goto LABEL_17;
    }
    if (v7 != 116) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  if (v7 == 40)
  {
    uint64_t v5 = -[GEORisonParser arrayWithReaderInfo:](self, "arrayWithReaderInfo:");
    goto LABEL_17;
  }
  if (v7 == 102)
  {
LABEL_14:
    uint64_t v5 = -[GEORisonParser BOOLWithReaderInfo:](self, "BOOLWithReaderInfo:");
LABEL_17:
    v6 = (void *)v5;
  }
LABEL_18:

  return v6;
}

- (id)dictionaryWithReaderInfo:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v6 = a3->var2 + 1;
  a3->unint64_t var2 = v6;
  var0 = a3->var0;
  while (var0[v6] != 41 && v6 < a3->var1)
  {
    v8 = [(GEORisonParser *)self keyWithReaderInfo:a3];
    ++a3->var2;
    v9 = [(GEORisonParser *)self objectWithReaderInfo:a3];
    if (v9 && v8) {
      [v5 setObject:v9 forKey:v8];
    }
    unint64_t var2 = a3->var2;
    if (a3->var0[var2] == 44) {
      a3->unint64_t var2 = var2 + 1;
    }

    var0 = a3->var0;
    unint64_t v6 = a3->var2;
  }
  a3->unint64_t var2 = v6 + 1;

  return v5;
}

- (id)keyWithReaderInfo:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t var2 = a3->var2;
  for (int i = a3->var0[var2]; i != 61; int i = var0[var2])
  {
    if (var2 >= a3->var1) {
      break;
    }
    objc_msgSend(v4, "appendFormat:", @"%c", (char)i);
    var0 = a3->var0;
    unint64_t var2 = a3->var2 + 1;
    a3->unint64_t var2 = var2;
  }

  return v4;
}

- (id)arrayWithReaderInfo:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v6 = a3->var2 + 2;
  a3->unint64_t var2 = v6;
  var0 = a3->var0;
  while (var0[v6] != 41 && v6 < a3->var1)
  {
    v8 = [(GEORisonParser *)self objectWithReaderInfo:a3];
    if (v8) {
      [v5 addObject:v8];
    }
    unint64_t var2 = a3->var2;
    if (a3->var0[var2] == 44) {
      a3->unint64_t var2 = var2 + 1;
    }

    var0 = a3->var0;
    unint64_t v6 = a3->var2;
  }
  a3->unint64_t var2 = v6 + 1;

  return v5;
}

- (id)stringLiteralWithReaderInfo:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t var2 = a3->var2 + 1;
  a3->unint64_t var2 = var2;
  int v6 = a3->var0[var2];
  if (v6 != 39)
  {
    while (1)
    {
      unint64_t var1 = a3->var1;
      unint64_t var2 = a3->var2;
      if (var2 >= var1) {
        break;
      }
      switch(v6)
      {
        case '!':
          var0 = a3->var0;
          unint64_t v17 = var2 + 1;
          a3->unint64_t var2 = v17;
          char v18 = var0[v17];
          break;
        case '%':
          unsigned __int16 v8 = 0;
          do
          {
            v8 += 3;
            unint64_t v9 = var2 + v8;
            int v6 = a3->var0[v9];
          }
          while (v6 == 37 && v9 < var1);
          uint64_t v11 = v8;
          size_t v12 = v8 + 1;
          v13 = (char *)malloc_type_malloc(v12, 0x557825ACuLL);
          snprintf(v13, v12, "%s", &a3->var0[a3->var2]);
          v14 = [NSString stringWithCString:v13 encoding:4];
          v15 = [v14 stringByRemovingPercentEncoding];
          free(v13);
          a3->var2 += v11;

          goto LABEL_17;
        case '+':
          char v18 = 32;
          break;
        default:
          char v18 = v6;
          break;
      }
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v18);
      v19 = a3->var0;
      unint64_t v20 = a3->var2 + 1;
      a3->unint64_t var2 = v20;
      int v6 = v19[v20];
LABEL_17:
      [v4 appendString:v15];

      if (v6 == 39)
      {
        unint64_t var2 = a3->var2;
        break;
      }
    }
  }
  a3->unint64_t var2 = var2 + 1;

  return v4;
}

- (id)nullWithReaderInfo:(id *)a3
{
  a3->var2 += 2;
  return (id)[MEMORY[0x1E4F1CA98] null];
}

- (id)BOOLWithReaderInfo:(id *)a3
{
  unint64_t v4 = a3->var2 + 1;
  a3->unint64_t var2 = v4;
  id v5 = [NSNumber numberWithBool:a3->var0[v4] == 116];
  ++a3->var2;

  return v5;
}

- (id)numberWithReaderInfo:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  char v6 = a3->var0[a3->var2];
  if (([(NSMutableCharacterSet *)self->_risonTerminators characterIsMember:(unsigned __int16)v6] & 1) == 0)
  {
    char v7 = v6;
    do
    {
      if (a3->var2 >= a3->var1) {
        break;
      }
      objc_msgSend(v5, "appendFormat:", @"%c", v7);
      var0 = a3->var0;
      unint64_t v9 = a3->var2 + 1;
      a3->unint64_t var2 = v9;
      LOWORD(var0) = var0[v9];
      char v7 = (char)var0;
    }
    while (![(NSMutableCharacterSet *)self->_risonTerminators characterIsMember:(unsigned __int16)var0]);
  }
  v10 = [(NSNumberFormatter *)self->_formatter numberFromString:v5];

  return v10;
}

- (id)stringFromRisonObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(GEORisonParser *)self stringFromDictionary:v4];
LABEL_11:
    char v6 = (void *)v5;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(GEORisonParser *)self stringFromArray:v4];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(GEORisonParser *)self stringFromNumber:v4];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(GEORisonParser *)self stringFromNull:v4];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(GEORisonParser *)self stringFromString:v4];
    goto LABEL_11;
  }
  char v6 = 0;
LABEL_12:

  return v6;
}

- (id)stringFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  char v6 = [v4 allKeys];
  char v7 = [v6 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  objc_msgSend(v5, "appendString:", @"(");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__GEORisonParser_stringFromDictionary___block_invoke;
  v12[3] = &unk_1E53EC9A8;
  id v13 = v4;
  id v8 = v5;
  id v14 = v8;
  v15 = self;
  id v9 = v4;
  [v7 enumerateObjectsUsingBlock:v12];
  [v8 appendString:@""]);
  id v10 = v8;

  return v10;
}

void __39__GEORisonParser_stringFromDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v9 = [v5 objectForKey:v6];
  if (a3) {
    [*(id *)(a1 + 40) appendString:@","];
  }
  char v7 = *(void **)(a1 + 40);
  id v8 = [*(id *)(a1 + 48) stringFromRisonObject:v9];
  [v7 appendFormat:@"%@=%@", v6, v8];
}

- (id)stringFromArray:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28E78];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "appendString:", @"!(");
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  size_t v12 = __34__GEORisonParser_stringFromArray___block_invoke;
  id v13 = &unk_1E53EC9D0;
  id v7 = v6;
  id v14 = v7;
  v15 = self;
  [v5 enumerateObjectsUsingBlock:&v10];

  [v7 appendString:@""], v10, v11, v12, v13);
  id v8 = v7;

  return v8;
}

void __34__GEORisonParser_stringFromArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@","];
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) stringFromRisonObject:v7];
  [v5 appendFormat:@"%@", v6];
}

- (id)stringFromString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28E78];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 appendString:@"'"];
  uint64_t v6 = [v4 length];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__GEORisonParser_stringFromString___block_invoke;
  v9[3] = &unk_1E53EC9F8;
  id v7 = v5;
  id v10 = v7;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 2, v9);

  [v7 appendString:@"'"];

  return v7;
}

void __35__GEORisonParser_stringFromString___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (([v6 isEqualToString:@"!"] & 1) != 0
    || ([v6 isEqualToString:@"'"] & 1) != 0
    || ([v6 isEqualToString:@"+"] & 1) != 0
    || [v6 isEqualToString:@"\\""])
  {
    [*(id *)(a1 + 32) appendFormat:@"!%@", v6];
  }
  else
  {
    int v3 = [v6 isEqualToString:@" "];
    id v4 = *(void **)(a1 + 32);
    if (v3)
    {
      [v4 appendString:@"+"];
    }
    else
    {
      id v5 = [v6 stringByAddingPercentEscapesUsingEncoding:4];
      [v4 appendString:v5];
    }
  }
}

- (id)stringFromNumber:(id)a3
{
  id v3 = a3;
  CFTypeID v4 = CFGetTypeID(v3);
  if (v4 == CFBooleanGetTypeID())
  {
    int v5 = [v3 BOOLValue];

    id v6 = @"!f";
    if (v5) {
      id v6 = @"!t";
    }
    id v7 = v6;
  }
  else
  {
    id v7 = [v3 stringValue];
  }

  return v7;
}

- (id)stringFromNull:(id)a3
{
  return @"!n";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_risonEscapes, 0);
  objc_storeStrong((id *)&self->_risonTerminators, 0);

  objc_storeStrong((id *)&self->_formatter, 0);
}

@end