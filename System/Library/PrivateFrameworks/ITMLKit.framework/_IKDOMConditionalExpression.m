@interface _IKDOMConditionalExpression
+ (id)expressionFromString:(id)a3;
+ (id)parseExpressionsFromString:(id)a3;
- (BOOL)passesForDataItem:(id)a3;
- (NSSet)dependentPathStrings;
- (_IKDOMConditionalExpression)initWithOperations:(id)a3 dependentPathStrings:(id)a4 isNegated:(BOOL)a5;
@end

@implementation _IKDOMConditionalExpression

+ (id)parseExpressionsFromString:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = [a3 componentsSeparatedByString:@","];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "expressionFromString:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

+ (id)expressionFromString:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [MEMORY[0x1E4F1CA80] set];
  v27 = v3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v3];
  uint64_t v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":"]);
  char v9 = [v6 isAtEnd];
  if (v9)
  {
    char v26 = 0;
    int v10 = 0;
    v11 = 0;
    goto LABEL_48;
  }
  int v10 = 0;
  char v26 = 0;
  v11 = 0;
  while (2)
  {
    switch(v10)
    {
      case 0:
        id v30 = 0;
        objc_msgSend(v6, "scanUpToString:intoString:", @"("), &v30;
        id v12 = v30;
        id v13 = [v12 stringByTrimmingCharactersInSet:v7];

        if ([v13 isEqualToString:@"not"] && !objc_msgSend(v4, "count"))
        {
          char v26 = 1;
LABEL_36:
          int v10 = 4;
          goto LABEL_37;
        }
        if ([v13 isEqualToString:@"and"] && objc_msgSend(v4, "count")
          || ![v13 length] && !objc_msgSend(v4, "count"))
        {
          goto LABEL_36;
        }
LABEL_46:

LABEL_47:
        int v10 = 6;
LABEL_48:
        uint64_t v20 = [v4 count];
        v21 = 0;
        if ((v9 & 1) != 0 && v20 && !v10)
        {
          v22 = [_IKDOMConditionalExpression alloc];
          v23 = (void *)[v4 copy];
          v24 = (void *)[v5 copy];
          v21 = [(_IKDOMConditionalExpression *)v22 initWithOperations:v23 dependentPathStrings:v24 isNegated:v26 & 1];
        }
        return v21;
      case 1:
        id v29 = 0;
        [v6 scanUpToString:@"}" intoString:&v29];
        id v13 = v29;
        if (![v13 length]) {
          goto LABEL_46;
        }
        long long v15 = [[IKDataBindingPropertyPath alloc] initWithString:v13];
        long long v16 = [(IKDataBindingPropertyPath *)v15 string];
        [v5 addObject:v16];

        [(_IKDOMConditionalOperation *)v11 setPropertyPath:v15];
        int v10 = 7;
        goto LABEL_44;
      case 2:
        if ([v6 scanString:@"-not-equal" intoString:0])
        {
          uint64_t v17 = -1;
        }
        else if ([v6 scanString:@"-less-than-equal" intoString:0])
        {
          uint64_t v17 = -3;
        }
        else if ([v6 scanString:@"-less-than" intoString:0])
        {
          uint64_t v17 = 1;
        }
        else if ([v6 scanString:@"-greater-than-equal" intoString:0])
        {
          uint64_t v17 = -2;
        }
        else
        {
          if (![v6 scanString:@"-greater-than" intoString:0]) {
            goto LABEL_43;
          }
          uint64_t v17 = 2;
        }
        [(_IKDOMConditionalOperation *)v11 setType:v17];
LABEL_43:
        [v6 scanUpToCharactersFromSet:v8 intoString:0];
        int v10 = 8;
LABEL_44:
        char v9 = [v6 isAtEnd];
        if (v9) {
          goto LABEL_48;
        }
        continue;
      case 3:
        id v28 = 0;
        objc_msgSend(v6, "scanUpToString:intoString:", @""), &v28);
        id v18 = v28;
        id v13 = [v18 stringByTrimmingCharactersInSet:v7];

        if ([v13 length])
        {
          [(_IKDOMConditionalOperation *)v11 setLiteral:v13];

          int v10 = 5;
        }
        else
        {
          int v10 = 5;
LABEL_37:
        }
        goto LABEL_44;
      case 4:
        long long v14 = objc_alloc_init(_IKDOMConditionalOperation);

        int v10 = 6;
        v11 = v14;
        if (([v6 scanString:@"(" intoString:0) & 1] == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 5:
        int v19 = objc_msgSend(v6, "scanString:intoString:", @""), 0);
        [v4 addObject:v11];

        v11 = 0;
        int v10 = 0;
        if (!v19) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 6:
        if (([v6 scanString:@"{" intoString:0] & 1) == 0) {
          goto LABEL_47;
        }
        int v10 = 1;
        goto LABEL_44;
      case 7:
        if (([v6 scanString:@"}" intoString:0] & 1) == 0) {
          goto LABEL_47;
        }
        int v10 = 2;
        goto LABEL_44;
      case 8:
        id v13 = 0;
        if ([v6 scanString:@":" intoString:0]) {
          int v10 = 3;
        }
        else {
          int v10 = 5;
        }
        goto LABEL_37;
      default:
        id v13 = 0;
        goto LABEL_37;
    }
  }
}

- (_IKDOMConditionalExpression)initWithOperations:(id)a3 dependentPathStrings:(id)a4 isNegated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_IKDOMConditionalExpression;
  int v10 = [(_IKDOMConditionalExpression *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    operations = v10->_operations;
    v10->_operations = (NSArray *)v11;

    uint64_t v13 = [v9 copy];
    dependentPathStrings = v10->_dependentPathStrings;
    v10->_dependentPathStrings = (NSSet *)v13;

    v10->_isNegated = a5;
  }

  return v10;
}

- (BOOL)passesForDataItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_operations;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "passesForDataItem:", v4, (void)v13))
        {
          char v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  char v10 = 1;
LABEL_11:

  BOOL isNegated = self->_isNegated;
  return v10 ^ isNegated;
}

- (NSSet)dependentPathStrings
{
  return self->_dependentPathStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentPathStrings, 0);
  objc_storeStrong((id *)&self->_operations, 0);
}

@end