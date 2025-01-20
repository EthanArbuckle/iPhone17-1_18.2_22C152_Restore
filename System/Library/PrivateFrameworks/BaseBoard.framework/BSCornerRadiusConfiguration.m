@interface BSCornerRadiusConfiguration
- (BOOL)isCongruent;
- (BOOL)isEqual:(id)a3;
- (BSCornerRadiusConfiguration)initWithCornerRadius:(double)a3;
- (BSCornerRadiusConfiguration)initWithTopLeft:(double)a3 bottomLeft:(double)a4 bottomRight:(double)a5 topRight:(double)a6;
- (BSCornerRadiusConfiguration)initWithXPCDictionary:(id)a3;
- (NSString)description;
- (double)bottomLeft;
- (double)bottomRight;
- (double)topLeft;
- (double)topRight;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BSCornerRadiusConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (self)
    {
      v6 = +[BSEqualsBuilder builderWithObject:v5 ofExpectedClass:objc_opt_class()];
      double topLeft = self->_topLeft;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke;
      v28[3] = &unk_1E5445E50;
      id v8 = v5;
      id v29 = v8;
      id v9 = (id)[v6 appendCGFloat:v28 counterpart:topLeft];
      double bottomLeft = self->_bottomLeft;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_2;
      v26[3] = &unk_1E5445E50;
      id v11 = v8;
      id v27 = v11;
      id v12 = (id)[v6 appendCGFloat:v26 counterpart:bottomLeft];
      double bottomRight = self->_bottomRight;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_3;
      v24[3] = &unk_1E5445E50;
      id v14 = v11;
      id v25 = v14;
      id v15 = (id)[v6 appendCGFloat:v24 counterpart:bottomRight];
      double topRight = self->_topRight;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_4;
      v22 = &unk_1E5445E50;
      id v23 = v14;
      id v17 = (id)[v6 appendCGFloat:&v19 counterpart:topRight];
      LOBYTE(self) = objc_msgSend(v6, "isEqual", v19, v20, v21, v22);
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (double)topLeft
{
  return self->_topLeft;
}

- (double)bottomRight
{
  return self->_bottomRight;
}

- (double)topRight
{
  return self->_topRight;
}

- (double)bottomLeft
{
  return self->_bottomLeft;
}

uint64_t __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) topLeft];
}

uint64_t __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) topRight];
}

uint64_t __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) bottomRight];
}

uint64_t __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) bottomLeft];
}

- (BSCornerRadiusConfiguration)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(BSCornerRadiusConfiguration *)self init];
  if (v5)
  {
    v5->_double topLeft = BSDeserializeDoubleFromXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationTopLeftKey");
    v5->_double bottomLeft = BSDeserializeDoubleFromXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationBottomLeftKey");
    v5->_double bottomRight = BSDeserializeDoubleFromXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationBottomRightKey");
    v5->_double topRight = BSDeserializeDoubleFromXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationTopRightKey");
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  BSSerializeDoubleToXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationTopLeftKey", self->_topLeft);
  BSSerializeDoubleToXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationBottomLeftKey", self->_bottomLeft);
  BSSerializeDoubleToXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationBottomRightKey", self->_bottomRight);
  BSSerializeDoubleToXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationTopRightKey", self->_topRight);
}

- (BSCornerRadiusConfiguration)initWithTopLeft:(double)a3 bottomLeft:(double)a4 bottomRight:(double)a5 topRight:(double)a6
{
  result = [(BSCornerRadiusConfiguration *)self init];
  if (result)
  {
    result->_double topLeft = a3;
    result->_double bottomLeft = a4;
    result->_double bottomRight = a5;
    result->_double topRight = a6;
  }
  return result;
}

- (BSCornerRadiusConfiguration)initWithCornerRadius:(double)a3
{
  result = [(BSCornerRadiusConfiguration *)self init];
  if (result)
  {
    result->_double topLeft = a3;
    result->_double bottomLeft = a3;
    result->_double bottomRight = a3;
    result->_double topRight = a3;
  }
  return result;
}

- (BOOL)isCongruent
{
  double topLeft = self->_topLeft;
  return topLeft == self->_bottomLeft && topLeft == self->_bottomRight && topLeft == self->_topRight;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: (topLeft: %g, bottom left: %g, bottom right: %g, top right: %g)", v5, *(void *)&self->_topLeft, *(void *)&self->_bottomLeft, *(void *)&self->_bottomRight, *(void *)&self->_topRight];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v3 = +[BSHashBuilder builder];
  id v4 = [v3 appendCGFloat:self->_topLeft];
  id v5 = [v4 appendCGFloat:self->_bottomLeft];
  v6 = [v5 appendCGFloat:self->_bottomRight];
  v7 = [v6 appendCGFloat:self->_topRight];
  unint64_t v8 = [v7 hash];

  return v8;
}

@end