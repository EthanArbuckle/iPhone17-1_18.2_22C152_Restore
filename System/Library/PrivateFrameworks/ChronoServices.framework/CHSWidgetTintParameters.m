@interface CHSWidgetTintParameters
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)accentedAlternateBackground;
- (BOOL)isEqual:(id)a3;
- (BSColor)primaryTintColor;
- (BSColor)secondaryTintColor;
- (CHSWidgetTintParameters)init;
- (CHSWidgetTintParameters)initWithBSXPCCoder:(id)a3;
- (CHSWidgetTintParameters)initWithPrimaryTintColor:(id)a3 secondaryTintColor:(id)a4 filterStyle:(int64_t)a5 fallbackFilterStyle:(int64_t)a6 fraction:(double)a7;
- (double)fraction;
- (id)_initWithTintParameters:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)accentedDesaturatedMode;
- (int64_t)fallbackFilterStyle;
- (int64_t)filterStyle;
- (unint64_t)effectiveRenderingMode;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CHSWidgetTintParameters

- (CHSWidgetTintParameters)init
{
  v7.receiver = self;
  v7.super_class = (Class)CHSWidgetTintParameters;
  v2 = [(CHSWidgetTintParameters *)&v7 init];
  v3 = v2;
  if (v2)
  {
    primaryTintColor = v2->_primaryTintColor;
    v2->_primaryTintColor = 0;

    secondaryTintColor = v3->_secondaryTintColor;
    v3->_secondaryTintColor = 0;

    v3->_filterStyle = 0;
    v3->_fraction = 1.0;
    v3->_accentedAlternateBackground = 0;
    v3->_accentedDesaturatedMode = 0;
  }
  return v3;
}

- (id)_initWithTintParameters:(id)a3
{
  v4 = (id *)a3;
  v5 = [(CHSWidgetTintParameters *)self init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_primaryTintColor, v4[1]);
    objc_storeStrong((id *)&v6->_secondaryTintColor, v4[2]);
    v6->_filterStyle = (int64_t)v4[3];
    v6->_fallbackFilterStyle = (int64_t)v4[4];
    *(void *)&v6->_fraction = v4[5];
    v6->_accentedAlternateBackground = *((unsigned char *)v4 + 48);
    v6->_accentedDesaturatedMode = (int64_t)v4[7];
  }

  return v6;
}

- (CHSWidgetTintParameters)initWithPrimaryTintColor:(id)a3 secondaryTintColor:(id)a4 filterStyle:(int64_t)a5 fallbackFilterStyle:(int64_t)a6 fraction:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CHSWidgetTintParameters;
  v15 = [(CHSWidgetTintParameters *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_filterStyle = a5;
    v15->_fallbackFilterStyle = a6;
    objc_storeStrong((id *)&v15->_primaryTintColor, a3);
    objc_storeStrong((id *)&v16->_secondaryTintColor, a4);
    v16->_fraction = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  primaryTintColor = self->_primaryTintColor;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke;
  v44[3] = &unk_1E56C8490;
  id v11 = v9;
  id v45 = v11;
  id v12 = (id)[v5 appendObject:primaryTintColor counterpart:v44];
  secondaryTintColor = self->_secondaryTintColor;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_2;
  v42[3] = &unk_1E56C8490;
  id v14 = v11;
  id v43 = v14;
  id v15 = (id)[v5 appendObject:secondaryTintColor counterpart:v42];
  int64_t filterStyle = self->_filterStyle;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_3;
  v40[3] = &unk_1E56C84B8;
  id v17 = v14;
  id v41 = v17;
  id v18 = (id)[v5 appendUnsignedInteger:filterStyle counterpart:v40];
  int64_t fallbackFilterStyle = self->_fallbackFilterStyle;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_4;
  v38[3] = &unk_1E56C84B8;
  id v20 = v17;
  id v39 = v20;
  id v21 = (id)[v5 appendUnsignedInteger:fallbackFilterStyle counterpart:v38];
  double fraction = self->_fraction;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_5;
  v36[3] = &unk_1E56C8440;
  id v23 = v20;
  id v37 = v23;
  id v24 = (id)[v5 appendDouble:v36 counterpart:fraction];
  BOOL accentedAlternateBackground = self->_accentedAlternateBackground;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_6;
  v34[3] = &unk_1E56C8468;
  id v26 = v23;
  id v35 = v26;
  id v27 = (id)[v5 appendBool:accentedAlternateBackground counterpart:v34];
  int64_t accentedDesaturatedMode = self->_accentedDesaturatedMode;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_7;
  v32[3] = &unk_1E56C84B8;
  id v29 = v26;
  id v33 = v29;
  id v30 = (id)[v5 appendUnsignedInteger:accentedDesaturatedMode counterpart:v32];
  LOBYTE(v26) = [v5 isEqual];

  return (char)v26;
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) primaryTintColor];
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) secondaryTintColor];
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) filterStyle];
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) fallbackFilterStyle];
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) fraction];
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) accentedAlternateBackground];
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) accentedDesaturatedMode];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_primaryTintColor];
  id v5 = (id)[v3 appendObject:self->_secondaryTintColor];
  id v6 = (id)[v3 appendUnsignedInteger:self->_filterStyle];
  id v7 = (id)[v3 appendUnsignedInteger:self->_fallbackFilterStyle];
  id v8 = (id)[v3 appendDouble:self->_fraction];
  id v9 = (id)[v3 appendBool:self->_accentedAlternateBackground];
  id v10 = (id)[v3 appendUnsignedInteger:self->_accentedDesaturatedMode];
  unint64_t v11 = [v3 hash];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CHSWidgetTintParameters alloc];
  return [(CHSWidgetTintParameters *)v4 _initWithTintParameters:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[CHSMutableWidgetTintParameters allocWithZone:a3];
  return [(CHSWidgetTintParameters *)v4 _initWithTintParameters:self];
}

- (unint64_t)effectiveRenderingMode
{
  if (self->_filterStyle >= 2uLL) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_primaryTintColor forKey:@"primaryTintColor"];
  [v4 encodeObject:self->_secondaryTintColor forKey:@"secondaryTintColor"];
  [v4 encodeUInt64:self->_filterStyle forKey:@"filterStyle"];
  [v4 encodeUInt64:self->_fallbackFilterStyle forKey:@"fallbackFilterStyle"];
  [v4 encodeDouble:@"fraction" forKey:self->_fraction];
  [v4 encodeBool:self->_accentedAlternateBackground forKey:@"accentedAlternateBackground"];
  [v4 encodeUInt64:self->_accentedDesaturatedMode forKey:@"accentedDesaturatedMode"];
}

- (CHSWidgetTintParameters)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CHSWidgetTintParameters *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryTintColor"];
    primaryTintColor = v5->_primaryTintColor;
    v5->_primaryTintColor = (BSColor *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryTintColor"];
    secondaryTintColor = v5->_secondaryTintColor;
    v5->_secondaryTintColor = (BSColor *)v8;

    v5->_int64_t filterStyle = [v4 decodeUInt64ForKey:@"filterStyle"];
    v5->_int64_t fallbackFilterStyle = [v4 decodeUInt64ForKey:@"fallbackFilterStyle"];
    [v4 decodeDoubleForKey:@"fraction"];
    v5->_double fraction = v10;
    v5->_BOOL accentedAlternateBackground = [v4 decodeBoolForKey:@"accentedAlternateBackground"];
    v5->_int64_t accentedDesaturatedMode = [v4 decodeUInt64ForKey:@"accentedDesaturatedMode"];
  }

  return v5;
}

- (BSColor)primaryTintColor
{
  return self->_primaryTintColor;
}

- (BSColor)secondaryTintColor
{
  return self->_secondaryTintColor;
}

- (int64_t)filterStyle
{
  return self->_filterStyle;
}

- (int64_t)fallbackFilterStyle
{
  return self->_fallbackFilterStyle;
}

- (double)fraction
{
  return self->_fraction;
}

- (BOOL)accentedAlternateBackground
{
  return self->_accentedAlternateBackground;
}

- (int64_t)accentedDesaturatedMode
{
  return self->_accentedDesaturatedMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTintColor, 0);
  objc_storeStrong((id *)&self->_primaryTintColor, 0);
}

@end