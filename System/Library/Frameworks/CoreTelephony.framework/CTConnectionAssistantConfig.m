@interface CTConnectionAssistantConfig
+ (BOOL)supportsSecureCoding;
- (CTCAModelVector)modelVector;
- (CTConnectionAssistantConfig)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setModelVector:(id)a3;
@end

@implementation CTConnectionAssistantConfig

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTConnectionAssistantConfig *)self modelVector];
  [v3 appendFormat:@", modelVector=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTConnectionAssistantConfig *)self modelVector];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setModelVector:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(CTConnectionAssistantConfig *)self modelVector];
  [v5 encodeObject:v4 forKey:@"modelVector"];
}

- (CTConnectionAssistantConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTConnectionAssistantConfig;
  id v5 = [(CTConnectionAssistantConfig *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelVector"];
    modelVector = v5->_modelVector;
    v5->_modelVector = (CTCAModelVector *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCAModelVector)modelVector
{
  return self->_modelVector;
}

- (void)setModelVector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end