@interface MKServerFormattedStringParameters
+ (BOOL)supportsSecureCoding;
- ($14769AC32134521FBB471D523793ADA4)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToServerFormattedStringParameters:(id)a3;
- (MKServerFormattedStringParameters)initWithCoder:(id)a3;
- (MKServerFormattedStringParameters)initWithInstructionsDistanceDetailLevel:(int64_t)a3 variableOverrides:(id)a4;
- (MKServerFormattedStringParameters)initWithOptions:(id *)a3 variableOverrides:(id)a4;
- (NSDictionary)variableOverrides;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MKServerFormattedStringParameters

- (MKServerFormattedStringParameters)initWithOptions:(id *)a3 variableOverrides:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MKServerFormattedStringParameters;
  v7 = [(MKServerFormattedStringParameters *)&v13 init];
  v8 = v7;
  if (v7)
  {
    long long v9 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&v7->_options.abbreviatedUnits = *(_OWORD *)&a3->var0;
    *(_OWORD *)&v7->_options.spoken = v9;
    uint64_t v10 = [v6 copy];
    variableOverrides = v8->_variableOverrides;
    v8->_variableOverrides = (NSDictionary *)v10;
  }
  return v8;
}

- (MKServerFormattedStringParameters)initWithInstructionsDistanceDetailLevel:(int64_t)a3 variableOverrides:(id)a4
{
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = a4;
  MKFormattedStringOptionsMakeDefault((uint64_t)&v10);
  *((void *)&v10 + 1) = a3;
  v9[0] = v10;
  v9[1] = v11;
  v7 = [(MKServerFormattedStringParameters *)self initWithOptions:v9 variableOverrides:v6];

  return v7;
}

- (MKServerFormattedStringParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKServerFormattedStringParameters;
  v5 = [(MKServerFormattedStringParameters *)&v15 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
    [v6 getBytes:&v5->_options length:32];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    long long v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    long long v11 = [v4 decodeObjectOfClasses:v10 forKey:@"variableOverrides"];
    uint64_t v12 = [v11 copy];
    variableOverrides = v5->_variableOverrides;
    v5->_variableOverrides = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9B8];
  p_options = &self->_options;
  id v7 = a3;
  id v6 = [v4 dataWithBytes:p_options length:32];
  [v7 encodeObject:v6 forKey:@"options"];

  [v7 encodeObject:self->_variableOverrides forKey:@"variableOverrides"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MKServerFormattedStringParameters *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(MKServerFormattedStringParameters *)self isEqualToServerFormattedStringParameters:v5];

  return v6;
}

- (BOOL)isEqualToServerFormattedStringParameters:(id)a3
{
  id v4 = a3;
  [(MKServerFormattedStringParameters *)self options];
  if (v4) {
    [v4 options];
  }
  if (MNFormattedStringOptionsIsEqual())
  {
    uint64_t v5 = [(MKServerFormattedStringParameters *)self variableOverrides];
    uint64_t v6 = [v4 variableOverrides];
    if (v5 | v6) {
      char v7 = [(id)v5 isEqual:v6];
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(MKServerFormattedStringParameters *)self options];
  uint64_t v3 = MNFormattedStringOptionsHash();
  id v4 = [(MKServerFormattedStringParameters *)self variableOverrides];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- ($14769AC32134521FBB471D523793ADA4)options
{
  long long v3 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (NSDictionary)variableOverrides
{
  return self->_variableOverrides;
}

- (void).cxx_destruct
{
}

@end