@interface BKSDisplayProgressIndicatorProperties
+ (BOOL)supportsSecureCoding;
+ (id)progressIndicatorWithStyle:(int64_t)a3 position:(CGPoint)a4;
- (BKSDisplayProgressIndicatorProperties)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGPoint)position;
- (id)_initWithStyle:(int64_t)a3 position:(CGPoint)a4;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSDisplayProgressIndicatorProperties

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)style
{
  return self->_style;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKSDisplayProgressIndicatorProperties *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendInteger:self->_style withName:@"style"];
  id v5 = (id)objc_msgSend(v3, "appendPoint:withName:", @"position", self->_position.x, self->_position.y);
  return v3;
}

- (id)succinctDescription
{
  v2 = [(BKSDisplayProgressIndicatorProperties *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (unint64_t)hash
{
  return self->_style + (unint64_t)self->_position.x + (unint64_t)self->_position.y;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__BKSDisplayProgressIndicatorProperties_isEqual___block_invoke;
  v18[3] = &unk_1E5440C40;
  id v6 = v4;
  id v19 = v6;
  v7 = objc_msgSend(v5, "appendCGPoint:counterpart:", v18, self->_position.x, self->_position.y);
  int64_t style = self->_style;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __49__BKSDisplayProgressIndicatorProperties_isEqual___block_invoke_2;
  v16 = &unk_1E5441208;
  id v17 = v6;
  id v9 = v6;
  v10 = [v7 appendInteger:style counterpart:&v13];
  char v11 = objc_msgSend(v10, "isEqual", v13, v14, v15, v16);

  return v11;
}

uint64_t __49__BKSDisplayProgressIndicatorProperties_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) position];
}

uint64_t __49__BKSDisplayProgressIndicatorProperties_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) style];
}

- (BKSDisplayProgressIndicatorProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"style"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"position"];

  if (v6)
  {
    MEMORY[0x18C123470](v6);
  }
  else
  {
    double v8 = 0.0;
    double v7 = 0.0;
  }
  id v9 = -[BKSDisplayProgressIndicatorProperties _initWithStyle:position:](self, "_initWithStyle:position:", v5, v7, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style = self->_style;
  id v4 = a3;
  [v4 encodeInteger:style forKey:@"style"];
  BSValueWithPoint();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"position"];
}

- (id)_initWithStyle:(int64_t)a3 position:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)BKSDisplayProgressIndicatorProperties;
  id result = [(BKSDisplayProgressIndicatorProperties *)&v8 init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((CGFloat *)result + 2) = x;
    *((CGFloat *)result + 3) = y;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)progressIndicatorWithStyle:(int64_t)a3 position:(CGPoint)a4
{
  id v4 = objc_msgSend(objc_alloc((Class)a1), "_initWithStyle:position:", a3, a4.x, a4.y);
  return v4;
}

@end