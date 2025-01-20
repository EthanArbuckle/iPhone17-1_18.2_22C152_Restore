@interface CSVoiceTriggerRTModel
+ (BOOL)supportsSecureCoding;
- (CSVoiceTriggerRTModel)initWithCoder:(id)a3;
- (CSVoiceTriggerRTModel)initWithData:(id)a3 hash:(id)a4 locale:(id)a5;
- (CSVoiceTriggerRTModel)initWithData:(id)a3 hash:(id)a4 locale:(id)a5 digest:(id)a6 signature:(id)a7 certificate:(id)a8;
- (CSVoiceTriggerRTModel)initWithHash:(id)a3 locale:(id)a4;
- (NSData)certificate;
- (NSData)digest;
- (NSData)modelData;
- (NSData)signature;
- (NSString)modelHash;
- (NSString)modelLocale;
- (id)builtInRTModelDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSVoiceTriggerRTModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_modelHash, 0);
  objc_storeStrong((id *)&self->_modelLocale, 0);
  objc_storeStrong((id *)&self->_modelData, 0);
}

- (NSData)certificate
{
  return self->_certificate;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)digest
{
  return self->_digest;
}

- (NSString)modelHash
{
  return self->_modelHash;
}

- (NSString)modelLocale
{
  return self->_modelLocale;
}

- (NSData)modelData
{
  return self->_modelData;
}

- (id)description
{
  v3 = +[NSMutableString string];
  NSUInteger v4 = [(NSData *)self->_modelData length];
  modelLocale = self->_modelLocale;
  modelHash = self->_modelHash;
  v7 = [(NSData *)self->_digest base64EncodedStringWithOptions:0];
  v8 = [v7 substringToIndex:5];
  v9 = [(NSData *)self->_certificate base64EncodedStringWithOptions:0];
  v10 = [v9 substringToIndex:5];
  v11 = [(NSData *)self->_signature base64EncodedStringWithOptions:0];
  v12 = [v11 substringToIndex:5];
  [v3 appendFormat:@"dataSize(%d), hash(%@), locale(%@), digest(%@), cert(%@), signature(%@)", v4, modelHash, modelLocale, v8, v10, v12];

  return v3;
}

- (id)builtInRTModelDictionary
{
  if (self->_modelData && self->_modelHash && self->_modelLocale)
  {
    v3 = objc_msgSend(@"RT Model for ", "stringByAppendingString:");
    NSUInteger v4 = [v3 stringByAppendingString:@" from asset "];

    v5 = [v4 stringByAppendingString:self->_modelHash];
    modelData = self->_modelData;
    v9[0] = @"CorealisRTModel";
    v9[1] = @"CorealisRTModelVersion";
    v10[0] = modelData;
    v10[1] = v5;
    v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  modelData = self->_modelData;
  id v11 = v4;
  if (modelData)
  {
    [v4 encodeObject:modelData forKey:@"RTModelData"];
    id v4 = v11;
  }
  modelHash = self->_modelHash;
  if (modelHash)
  {
    [v11 encodeObject:modelHash forKey:@"RTModelHash"];
    id v4 = v11;
  }
  modelLocale = self->_modelLocale;
  if (modelLocale)
  {
    [v11 encodeObject:modelLocale forKey:@"RTModelLocale"];
    id v4 = v11;
  }
  digest = self->_digest;
  if (digest)
  {
    [v11 encodeObject:digest forKey:@"RTModelDigest"];
    id v4 = v11;
  }
  signature = self->_signature;
  if (signature)
  {
    [v11 encodeObject:signature forKey:@"RTModelSignature"];
    id v4 = v11;
  }
  certificate = self->_certificate;
  if (certificate)
  {
    [v11 encodeObject:certificate forKey:@"RTModelCertificate"];
    id v4 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CSVoiceTriggerRTModel alloc];
  id v5 = [(NSData *)self->_modelData copy];
  id v6 = [(NSString *)self->_modelHash copy];
  id v7 = [(NSString *)self->_modelLocale copy];
  id v8 = [(NSData *)self->_digest copy];
  id v9 = [(NSData *)self->_signature copy];
  id v10 = [(NSData *)self->_certificate copy];
  id v11 = [(CSVoiceTriggerRTModel *)v4 initWithData:v5 hash:v6 locale:v7 digest:v8 signature:v9 certificate:v10];

  return v11;
}

- (CSVoiceTriggerRTModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSVoiceTriggerRTModel;
  id v5 = [(CSVoiceTriggerRTModel *)&v19 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"RTModelData"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTModelData"];
      modelData = v5->_modelData;
      v5->_modelData = (NSData *)v6;
    }
    if ([v4 containsValueForKey:@"RTModelHash"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTModelHash"];
      modelHash = v5->_modelHash;
      v5->_modelHash = (NSString *)v8;
    }
    if ([v4 containsValueForKey:@"RTModelLocale"])
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTModelLocale"];
      modelLocale = v5->_modelLocale;
      v5->_modelLocale = (NSString *)v10;
    }
    if ([v4 containsValueForKey:@"RTModelDigest"])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTModelDigest"];
      digest = v5->_digest;
      v5->_digest = (NSData *)v12;
    }
    if ([v4 containsValueForKey:@"RTModelSignature"])
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTModelSignature"];
      signature = v5->_signature;
      v5->_signature = (NSData *)v14;
    }
    if ([v4 containsValueForKey:@"RTModelCertificate"])
    {
      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTModelCertificate"];
      certificate = v5->_certificate;
      v5->_certificate = (NSData *)v16;
    }
  }

  return v5;
}

- (CSVoiceTriggerRTModel)initWithData:(id)a3 hash:(id)a4 locale:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSVoiceTriggerRTModel;
  uint64_t v12 = [(CSVoiceTriggerRTModel *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modelData, a3);
    objc_storeStrong((id *)&v13->_modelHash, a4);
    objc_storeStrong((id *)&v13->_modelLocale, a5);
  }

  return v13;
}

- (CSVoiceTriggerRTModel)initWithHash:(id)a3 locale:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSVoiceTriggerRTModel;
  id v9 = [(CSVoiceTriggerRTModel *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelHash, a3);
    objc_storeStrong((id *)&v10->_modelLocale, a4);
  }

  return v10;
}

- (CSVoiceTriggerRTModel)initWithData:(id)a3 hash:(id)a4 locale:(id)a5 digest:(id)a6 signature:(id)a7 certificate:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CSVoiceTriggerRTModel;
  v18 = [(CSVoiceTriggerRTModel *)&v24 init];
  objc_super v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_modelData, a3);
    objc_storeStrong((id *)&v19->_modelHash, a4);
    objc_storeStrong((id *)&v19->_modelLocale, a5);
    objc_storeStrong((id *)&v19->_digest, a6);
    objc_storeStrong((id *)&v19->_signature, a7);
    objc_storeStrong((id *)&v19->_certificate, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end