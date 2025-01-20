@interface CHSGaugeParameters
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSGaugeParameters)initWithBSXPCCoder:(id)a3;
- (CHSGaugeParameters)initWithLeadingText:(id)a3 trailingText:(id)a4 style:(unint64_t)a5 gradientColors:(id)a6 gradientLocations:(id)a7 fraction:(double)a8;
- (NSArray)gradientColors;
- (NSArray)gradientLocations;
- (NSAttributedString)leadingText;
- (NSAttributedString)trailingText;
- (double)fraction;
- (unint64_t)hash;
- (unint64_t)style;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CHSGaugeParameters

- (CHSGaugeParameters)initWithLeadingText:(id)a3 trailingText:(id)a4 style:(unint64_t)a5 gradientColors:(id)a6 gradientLocations:(id)a7 fraction:(double)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CHSGaugeParameters;
  v18 = [(CHSGaugeParameters *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    leadingText = v18->_leadingText;
    v18->_leadingText = (NSAttributedString *)v19;

    uint64_t v21 = [v15 copy];
    trailingText = v18->_trailingText;
    v18->_trailingText = (NSAttributedString *)v21;

    v18->_style = a5;
    uint64_t v23 = [v16 copy];
    gradientColors = v18->_gradientColors;
    v18->_gradientColors = (NSArray *)v23;

    uint64_t v25 = [v17 copy];
    gradientLocations = v18->_gradientLocations;
    v18->_gradientLocations = (NSArray *)v25;

    v18->_fraction = a8;
  }

  return v18;
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

  leadingText = self->_leadingText;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __30__CHSGaugeParameters_isEqual___block_invoke;
  v42[3] = &unk_1E56C89D0;
  id v11 = v9;
  id v43 = v11;
  id v12 = (id)[v5 appendObject:leadingText counterpart:v42];
  trailingText = self->_trailingText;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __30__CHSGaugeParameters_isEqual___block_invoke_2;
  v40[3] = &unk_1E56C89D0;
  id v14 = v11;
  id v41 = v14;
  id v15 = (id)[v5 appendObject:trailingText counterpart:v40];
  unint64_t style = self->_style;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __30__CHSGaugeParameters_isEqual___block_invoke_3;
  v38[3] = &unk_1E56C84B8;
  id v17 = v14;
  id v39 = v17;
  id v18 = (id)[v5 appendUnsignedInteger:style counterpart:v38];
  gradientColors = self->_gradientColors;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __30__CHSGaugeParameters_isEqual___block_invoke_4;
  v36[3] = &unk_1E56C8178;
  id v20 = v17;
  id v37 = v20;
  id v21 = (id)[v5 appendObject:gradientColors counterpart:v36];
  gradientLocations = self->_gradientLocations;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __30__CHSGaugeParameters_isEqual___block_invoke_5;
  v34[3] = &unk_1E56C8178;
  id v23 = v20;
  id v35 = v23;
  id v24 = (id)[v5 appendObject:gradientLocations counterpart:v34];
  double fraction = self->_fraction;
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __30__CHSGaugeParameters_isEqual___block_invoke_6;
  v32 = &unk_1E56C8440;
  id v26 = v23;
  id v33 = v26;
  id v27 = (id)[v5 appendDouble:&v29 counterpart:fraction];
  LOBYTE(v23) = objc_msgSend(v5, "isEqual", v29, v30, v31, v32);

  return (char)v23;
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) leadingText];
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) trailingText];
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) style];
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) gradientColors];
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) gradientLocations];
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) fraction];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_leadingText];
  id v5 = (id)[v3 appendObject:self->_trailingText];
  id v6 = (id)[v3 appendUnsignedInteger:self->_style];
  id v7 = (id)[v3 appendObject:self->_gradientColors];
  id v8 = (id)[v3 appendObject:self->_gradientLocations];
  id v9 = (id)[v3 appendDouble:self->_fraction];
  unint64_t v10 = [v3 hash];

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_leadingText forKey:@"leadingText"];
  [v4 encodeObject:self->_trailingText forKey:@"trailingText"];
  [v4 encodeUInt64:self->_style forKey:@"style"];
  [v4 encodeCollection:self->_gradientColors forKey:@"gradientColors"];
  [v4 encodeCollection:self->_gradientLocations forKey:@"gradientLocations"];
  [v4 encodeDouble:@"fraction" forKey:self->_fraction];
}

- (CHSGaugeParameters)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CHSGaugeParameters;
  id v5 = [(CHSGaugeParameters *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leadingText"];
    leadingText = v5->_leadingText;
    v5->_leadingText = (NSAttributedString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trailingText"];
    trailingText = v5->_trailingText;
    v5->_trailingText = (NSAttributedString *)v8;

    v5->_unint64_t style = [v4 decodeUInt64ForKey:@"style"];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v4 decodeCollectionOfClass:v10 containingClass:objc_opt_class() forKey:@"gradientColors"];
    gradientColors = v5->_gradientColors;
    v5->_gradientColors = (NSArray *)v11;

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v4 decodeCollectionOfClass:v13 containingClass:objc_opt_class() forKey:@"gradientLocations"];
    gradientLocations = v5->_gradientLocations;
    v5->_gradientLocations = (NSArray *)v14;

    [v4 decodeDoubleForKey:@"fraction"];
    v5->_double fraction = v16;
  }

  return v5;
}

- (NSAttributedString)leadingText
{
  return self->_leadingText;
}

- (NSAttributedString)trailingText
{
  return self->_trailingText;
}

- (unint64_t)style
{
  return self->_style;
}

- (NSArray)gradientColors
{
  return self->_gradientColors;
}

- (NSArray)gradientLocations
{
  return self->_gradientLocations;
}

- (double)fraction
{
  return self->_fraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLocations, 0);
  objc_storeStrong((id *)&self->_gradientColors, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
}

@end