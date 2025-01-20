@interface PKCustomTool
- (BOOL)isEqual:(id)a3;
- (Class)_toolPickerItemClass;
- (NSString)customIdentifier;
- (PKCustomTool)initWithCustomIdentifier:(id)a3 configuration:(id)a4 color:(id)a5 weight:(double)a6;
- (PKToolConfiguration)customConfigurationCopy;
- (UIColor)color;
- (double)_width;
- (double)weight;
- (id)copyWithColor:(id)a3;
- (id)copyWithScrubbedColor:(id)a3;
- (id)copyWithScrubbedWeight:(double)a3;
- (id)copyWithWeight:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation PKCustomTool

- (PKCustomTool)initWithCustomIdentifier:(id)a3 configuration:(id)a4 color:(id)a5 weight:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = [v11 supportsColor];
  if (v12 && (v13 & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    v26 = @"Color must be nil if tool does not support color.";
    goto LABEL_21;
  }
  int v14 = [v11 supportsColor];
  if (!v12 && v14)
  {
    v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    v26 = @"Color must not be nil if tool supports color.";
    goto LABEL_21;
  }
  if ([v11 supportsColor])
  {
    if (([v11 supportsOpacity] & 1) == 0)
    {
      [v12 alphaComponent];
      if (v15 != 1.0 && fabs(v15 + -1.0) >= 0.000000999999997)
      {
        v24 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v25 = *MEMORY[0x1E4F1C3C8];
        v26 = @"Color must be opaque if tool does not support opacity.";
LABEL_21:
        id v27 = [v24 exceptionWithName:v25 reason:v26 userInfo:0];
        objc_exception_throw(v27);
      }
    }
  }
  char v16 = [v11 supportsStrokeWeight];
  if (a6 != 0.0 && (v16 & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    v26 = @"Weight must be 0 if tool does not support weight.";
    goto LABEL_21;
  }
  if (v12 && ([v11 supportsColor] & 1) != 0)
  {
    uint64_t v17 = [v12 copy];
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4FB1618] blackColor];
  }
  v18 = (void *)v17;
  v19 = +[PKInk inkWithIdentifier:@"com.apple.ink.custom" color:v17 weight:a6];
  v28.receiver = self;
  v28.super_class = (Class)PKCustomTool;
  v20 = [(PKTool *)&v28 _initWithInk:v19 configuration:v11];

  if (v20)
  {
    uint64_t v21 = [v10 copy];
    customIdentifier = v20->_customIdentifier;
    v20->_customIdentifier = (NSString *)v21;
  }
  return v20;
}

- (PKToolConfiguration)customConfigurationCopy
{
  v2 = [(PKTool *)self _configuration];
  v3 = (void *)[v2 copy];

  return (PKToolConfiguration *)v3;
}

- (UIColor)color
{
  v3 = [(PKTool *)self _configuration];
  char v4 = [v3 supportsColor];

  if ((v4 & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Should not attempt to access color on a tool that does not support it." userInfo:0];
    objc_exception_throw(v9);
  }
  v5 = [(PKTool *)self ink];
  v6 = [v5 color];
  v7 = (void *)[v6 copy];

  return (UIColor *)v7;
}

- (double)weight
{
  v3 = [(PKTool *)self _configuration];
  char v4 = [v3 supportsStrokeWeight];

  if ((v4 & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Should not attempt to access weight on a tool that does not support it." userInfo:0];
    objc_exception_throw(v9);
  }
  v5 = [(PKTool *)self ink];
  [v5 weight];
  double v7 = v6;

  return v7;
}

- (double)_width
{
  v3 = [(PKTool *)self _configuration];
  int v4 = [v3 supportsStrokeWeight];

  if (!v4) {
    return 0.0;
  }

  [(PKCustomTool *)self weight];
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (PKCustomTool *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18.receiver = self;
        v18.super_class = (Class)PKCustomTool;
        if ([(PKTool *)&v18 isEqual:v5])
        {
          double v6 = v5;
          customIdentifier = v6->_customIdentifier;
          unint64_t v8 = self->_customIdentifier;
          id v9 = customIdentifier;
          if ((NSString *)v8 == v9)
          {
          }
          else
          {
            id v10 = v9;
            if (v8) {
              BOOL v11 = v9 == 0;
            }
            else {
              BOOL v11 = 1;
            }
            if (v11)
            {
              char v12 = 0;
LABEL_22:

LABEL_23:
              goto LABEL_24;
            }
            BOOL v13 = [(id)v8 isEqualToString:v9];

            if (!v13)
            {
              char v12 = 0;
              goto LABEL_23;
            }
          }
          int v14 = [(PKTool *)self _configuration];
          double v15 = [(PKTool *)v6 _configuration];
          unint64_t v8 = v14;
          unint64_t v16 = v15;
          id v10 = (void *)v16;
          if (v8 | v16)
          {
            char v12 = 0;
            if (v8 && v16) {
              char v12 = [(id)v8 isEqual:v16];
            }
          }
          else
          {
            char v12 = 1;
          }

          goto LABEL_22;
        }
      }
    }
    char v12 = 0;
  }
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)PKCustomTool;
  unint64_t v3 = [(PKTool *)&v8 hash];
  NSUInteger v4 = [(NSString *)self->_customIdentifier hash];
  v5 = [(PKTool *)self _configuration];
  unint64_t v6 = v4 ^ v3 ^ [v5 hash];

  return v6;
}

- (id)copyWithColor:(id)a3
{
  id v4 = a3;
  v5 = [(PKTool *)self _configuration];
  double v6 = 0.0;
  if ([v5 supportsStrokeWeight])
  {
    [(PKCustomTool *)self weight];
    double v6 = v7;
  }

  objc_super v8 = [PKCustomTool alloc];
  customIdentifier = self->_customIdentifier;
  id v10 = [(PKTool *)self _configuration];
  BOOL v11 = [(PKCustomTool *)v8 initWithCustomIdentifier:customIdentifier configuration:v10 color:v4 weight:v6];

  return v11;
}

- (id)copyWithScrubbedColor:(id)a3
{
  id v4 = a3;
  v5 = [(PKTool *)self _configuration];
  if ([v5 supportsColor]) {
    double v6 = v4;
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;

  objc_super v8 = [(PKTool *)self _configuration];
  if ([v8 supportsColor])
  {
    id v9 = [(PKTool *)self _configuration];
    if ([v9 supportsOpacity] || (objc_msgSend(v7, "alphaComponent"), v10 == 1.0))
    {
    }
    else
    {
      double v13 = fabs(v10 + -1.0);

      if (v13 < 0.000000999999997) {
        goto LABEL_9;
      }
      [v7 colorWithAlphaComponent:1.0];
      objc_super v8 = v7;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_9:
  id v11 = [(PKCustomTool *)self copyWithColor:v7];

  return v11;
}

- (id)copyWithWeight:(double)a3
{
  v5 = [(PKTool *)self _configuration];
  if ([v5 supportsColor])
  {
    double v6 = [(PKCustomTool *)self color];
  }
  else
  {
    double v6 = 0;
  }

  id v7 = [PKCustomTool alloc];
  customIdentifier = self->_customIdentifier;
  id v9 = [(PKTool *)self _configuration];
  double v10 = [(PKCustomTool *)v7 initWithCustomIdentifier:customIdentifier configuration:v9 color:v6 weight:a3];

  return v10;
}

- (id)copyWithScrubbedWeight:(double)a3
{
  v5 = [(PKTool *)self _configuration];
  if (![v5 supportsStrokeWeight]) {
    a3 = 0.0;
  }

  return [(PKCustomTool *)self copyWithWeight:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(PKTool *)self _configuration];
  if ([v5 supportsColor])
  {
    double v6 = [(PKCustomTool *)self color];
  }
  else
  {
    double v6 = 0;
  }

  id v7 = [(PKTool *)self _configuration];
  double v8 = 0.0;
  if ([v7 supportsStrokeWeight])
  {
    [(PKCustomTool *)self weight];
    double v8 = v9;
  }

  double v10 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  customIdentifier = self->_customIdentifier;
  char v12 = [(PKTool *)self _configuration];
  double v13 = (void *)[v10 initWithCustomIdentifier:customIdentifier configuration:v12 color:v6 weight:v8];

  return v13;
}

- (Class)_toolPickerItemClass
{
  return (Class)objc_opt_class();
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (void).cxx_destruct
{
}

@end