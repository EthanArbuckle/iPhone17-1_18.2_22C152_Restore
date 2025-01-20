@interface HMSupportedAccessoryDiagnostics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMSupportedAccessoryDiagnostics)initWithCoder:(id)a3;
- (HMSupportedAccessoryDiagnostics)initWithSupportedTypes:(unint64_t)a3 format:(int64_t)a4 audio:(unint64_t)a5 options:(unint64_t)a6;
- (id)description;
- (int64_t)supportedFormat;
- (unint64_t)hash;
- (unint64_t)supportedAudio;
- (unint64_t)supportedOptions;
- (unint64_t)supportedTypes;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMSupportedAccessoryDiagnostics

- (unint64_t)supportedAudio
{
  return self->_supportedAudio;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (int64_t)supportedFormat
{
  return self->_supportedFormat;
}

- (unint64_t)supportedTypes
{
  return self->_supportedTypes;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMSupportedAccessoryDiagnostics *)self supportedTypes];
  int64_t v4 = [(HMSupportedAccessoryDiagnostics *)self supportedFormat] ^ v3;
  unint64_t v5 = [(HMSupportedAccessoryDiagnostics *)self supportedOptions];
  return v4 ^ v5 ^ [(HMSupportedAccessoryDiagnostics *)self supportedAudio];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (unint64_t v7 = [(HMSupportedAccessoryDiagnostics *)self supportedTypes],
        v7 == [v6 supportedTypes])
    && (int64_t v8 = [(HMSupportedAccessoryDiagnostics *)self supportedFormat],
        v8 == [v6 supportedFormat])
    && (unint64_t v9 = [(HMSupportedAccessoryDiagnostics *)self supportedOptions],
        v9 == [v6 supportedOptions]))
  {
    unint64_t v10 = [(HMSupportedAccessoryDiagnostics *)self supportedAudio];
    BOOL v11 = v10 == [v6 supportedAudio];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<HMSupportedAccessoryDiagnostics supportedFormat=%ld, supportedTypes=%lu, supportedAudio=%lu, supportedOptions=%lu>", -[HMSupportedAccessoryDiagnostics supportedFormat](self, "supportedFormat"), -[HMSupportedAccessoryDiagnostics supportedTypes](self, "supportedTypes"), -[HMSupportedAccessoryDiagnostics supportedAudio](self, "supportedAudio"), -[HMSupportedAccessoryDiagnostics supportedOptions](self, "supportedOptions")];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t supportedTypes = self->_supportedTypes;
  id v6 = a3;
  unint64_t v7 = [v4 numberWithUnsignedInteger:supportedTypes];
  [v6 encodeObject:v7 forKey:@"HMA.diagnostics.ck.ty"];

  int64_t v8 = [NSNumber numberWithInteger:self->_supportedFormat];
  [v6 encodeObject:v8 forKey:@"HMA.diagnostics.ck.sf"];

  unint64_t v9 = [NSNumber numberWithUnsignedInteger:self->_supportedOptions];
  [v6 encodeObject:v9 forKey:@"HMA.diagnostics.ck.so"];

  id v10 = [NSNumber numberWithUnsignedInteger:self->_supportedAudio];
  [v6 encodeObject:v10 forKey:@"HMA.diagnostics.ck.sa"];
}

- (HMSupportedAccessoryDiagnostics)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.ty"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.sf"];
  unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.so"];
  int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.sa"];

  uint64_t v9 = [v6 integerValue];
  if ((unint64_t)(v9 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    self = -[HMSupportedAccessoryDiagnostics initWithSupportedTypes:format:audio:options:](self, "initWithSupportedTypes:format:audio:options:", [v5 integerValue], v9, objc_msgSend(v8, "integerValue"), objc_msgSend(v7, "integerValue"));
    id v10 = self;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (HMSupportedAccessoryDiagnostics)initWithSupportedTypes:(unint64_t)a3 format:(int64_t)a4 audio:(unint64_t)a5 options:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)HMSupportedAccessoryDiagnostics;
  result = [(HMSupportedAccessoryDiagnostics *)&v11 init];
  if (result)
  {
    result->_unint64_t supportedTypes = a3;
    result->_supportedFormat = a4;
    result->_supportedOptions = a6;
    result->_supportedAudio = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end