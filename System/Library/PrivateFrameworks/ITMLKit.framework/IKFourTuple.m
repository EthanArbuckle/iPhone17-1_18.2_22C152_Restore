@interface IKFourTuple
- (IKCornerRadii)cornerRadiiValue;
- (IKFourTuple)initWithCornerRadii:(IKCornerRadii)a3;
- (IKFourTuple)initWithStyleString:(id)a3;
- (NSString)namedStyle;
- (UIEdgeInsets)edgeInsetsValue;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IKFourTuple

- (IKFourTuple)initWithStyleString:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IKFourTuple;
  v5 = [(IKFourTuple *)&v21 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = [v4 componentsSeparatedByString:@" "];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __35__IKFourTuple_initWithStyleString___block_invoke;
    v19[3] = &unk_1E6DE5A70;
    id v8 = v6;
    id v20 = v8;
    [v7 enumerateObjectsUsingBlock:v19];

    uint64_t v9 = [v8 count];
    v5->_specifiedValueCount = v9;
    if (v9 < 2)
    {
      if (v9 == 1)
      {
        v14 = [v8 objectAtIndex:0];
        v15 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v14];
        float v18 = 0.0;
        if ([v15 scanFloat:&v18])
        {
          double v16 = v18;
          v5->_values[2] = v18;
          v5->_values[3] = v16;
          v5->_values[0] = v16;
          v5->_values[1] = v16;
        }
        else
        {
          objc_storeStrong((id *)&v5->_namedStyle, v14);
        }
      }
    }
    else
    {
      int64_t v10 = 0;
      values = v5->_values;
      do
      {
        if (v10 >= v5->_specifiedValueCount)
        {
          values[v10] = 0.0;
        }
        else
        {
          v12 = [v8 objectAtIndex:v10];
          [v12 floatValue];
          values[v10] = v13;
        }
        ++v10;
      }
      while (v10 != 4);
    }
  }
  return v5;
}

void __35__IKFourTuple_initWithStyleString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (IKFourTuple)initWithCornerRadii:(IKCornerRadii)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v8.receiver = self;
  v8.super_class = (Class)IKFourTuple;
  result = [(IKFourTuple *)&v8 init];
  if (result)
  {
    result->_specifiedValueCount = 4;
    result->_values[0] = var2;
    result->_values[1] = var3;
    result->_values[2] = var1;
    result->_values[3] = var0;
  }
  return result;
}

- (IKCornerRadii)cornerRadiiValue
{
  switch(self->_specifiedValueCount)
  {
    case 1:
      double v2 = self->_values[0];
      double v3 = v2;
      double v4 = v2;
      double v5 = v2;
      break;
    case 2:
      double v2 = self->_values[0];
      double v3 = self->_values[1];
      double v4 = v2;
      goto LABEL_6;
    case 3:
      double v2 = self->_values[0];
      double v3 = self->_values[1];
      double v4 = self->_values[2];
LABEL_6:
      double v5 = v3;
      break;
    case 4:
      double v2 = self->_values[0];
      double v3 = self->_values[1];
      double v4 = self->_values[2];
      double v5 = self->_values[3];
      break;
    default:
      double v2 = 0.0;
      double v3 = 0.0;
      double v4 = 0.0;
      double v5 = 0.0;
      break;
  }
  result.double var3 = v3;
  result.double var2 = v2;
  result.double var1 = v4;
  result.double var0 = v5;
  return result;
}

- (UIEdgeInsets)edgeInsetsValue
{
  switch(self->_specifiedValueCount)
  {
    case 1:
      double v2 = self->_values[1];
      double v3 = v2;
      double v4 = v2;
      goto LABEL_5;
    case 2:
      double v2 = self->_values[0];
      double v3 = self->_values[1];
      double v4 = v3;
LABEL_5:
      double v5 = v2;
      break;
    case 3:
      double v5 = self->_values[0];
      double v3 = self->_values[1];
      double v2 = self->_values[2];
      double v4 = v3;
      break;
    case 4:
      double v5 = self->_values[0];
      double v3 = self->_values[1];
      double v2 = self->_values[2];
      double v4 = self->_values[3];
      break;
    default:
      double v2 = 0.0;
      double v3 = 0.0;
      double v4 = 0.0;
      double v5 = 0.0;
      break;
  }
  result.right = v3;
  result.bottom = v2;
  result.left = v4;
  result.top = v5;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_namedStyle copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(void *)(v5 + 16) = self->_specifiedValueCount;
  long long v8 = *(_OWORD *)self->_values;
  *(_OWORD *)(v5 + 40) = *(_OWORD *)&self->_values[2];
  *(_OWORD *)(v5 + 24) = v8;
  return (id)v5;
}

- (NSString)namedStyle
{
  return self->_namedStyle;
}

- (void).cxx_destruct
{
}

@end