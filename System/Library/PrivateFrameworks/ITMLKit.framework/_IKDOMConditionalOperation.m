@interface _IKDOMConditionalOperation
- (BOOL)passesForDataItem:(id)a3;
- (IKDataBindingPropertyPath)propertyPath;
- (NSString)literal;
- (unint64_t)type;
- (void)setLiteral:(id)a3;
- (void)setPropertyPath:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation _IKDOMConditionalOperation

- (BOOL)passesForDataItem:(id)a3
{
  id v4 = a3;
  v5 = [(_IKDOMConditionalOperation *)self propertyPath];
  v6 = [v4 valueForPropertyPath:v5 boxed:0];

  v7 = [(_IKDOMConditionalOperation *)self literal];

  if (v7)
  {
    if (v6)
    {
      if ([v6 isString])
      {
        v8 = [v6 toString];
        v9 = [(_IKDOMConditionalOperation *)self literal];
        uint64_t v10 = [v8 compare:v9];
      }
      else
      {
        if (![v6 isNumber])
        {
          if (![v6 isBoolean])
          {
            uint64_t v10 = 0;
LABEL_11:
            unint64_t v14 = [(_IKDOMConditionalOperation *)self type];
            uint64_t v16 = (~v14 & 0xFFFFFFFFFFFFFFFDLL) == 0 || v14 == -2;
            uint64_t v17 = v14 ^ (v16 << 63 >> 63);
            if (v17 == 2)
            {
              BOOL v18 = v10 == 1;
            }
            else if (v17 == 1)
            {
              BOOL v18 = v10 == -1;
            }
            else
            {
              if (v17)
              {
                char v20 = 0;
LABEL_32:
                char v11 = (v14 > 0xFFFFFFFFFFFFFFFCLL) ^ v20;
                goto LABEL_33;
              }
              BOOL v18 = v10 == 0;
            }
            char v20 = v18;
            goto LABEL_32;
          }
          int v19 = [v6 toBool];
          v8 = [(_IKDOMConditionalOperation *)self literal];
          if (v19 == [v8 BOOLValue])
          {
            uint64_t v10 = 0;
          }
          else if ([v6 toBool])
          {
            uint64_t v10 = 1;
          }
          else
          {
            uint64_t v10 = -1;
          }
LABEL_10:

          goto LABEL_11;
        }
        v8 = [v6 toNumber];
        v12 = NSNumber;
        v9 = [(_IKDOMConditionalOperation *)self literal];
        [v9 doubleValue];
        v13 = objc_msgSend(v12, "numberWithDouble:");
        uint64_t v10 = [v8 compare:v13];
      }
      goto LABEL_10;
    }
    char v11 = 0;
  }
  else
  {
    char v11 = v6 != 0;
  }
LABEL_33:

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (IKDataBindingPropertyPath)propertyPath
{
  return self->_propertyPath;
}

- (void)setPropertyPath:(id)a3
{
}

- (NSString)literal
{
  return self->_literal;
}

- (void)setLiteral:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_literal, 0);
  objc_storeStrong((id *)&self->_propertyPath, 0);
}

@end