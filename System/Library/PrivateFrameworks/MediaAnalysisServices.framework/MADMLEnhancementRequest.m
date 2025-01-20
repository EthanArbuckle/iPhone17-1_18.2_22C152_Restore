@interface MADMLEnhancementRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)modelPreparationOnly;
- (MADMLEnhancementRequest)initWithCoder:(id)a3;
- (NSString)uuid;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setModelPreparationOnly:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation MADMLEnhancementRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMLEnhancementRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADMLEnhancementRequest;
  v5 = [(MADRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v5->_modelPreparationOnly = [v4 decodeBoolForKey:@"ModelPreparationOnly"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADMLEnhancementRequest;
  id v4 = a3;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, @"UUID", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_modelPreparationOnly forKey:@"ModelPreparationOnly"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p", v5, self];

  uint64_t v6 = [(MADMLEnhancementRequest *)self uuid];
  [v3 appendFormat:@"%@: %@", @"UUID", v6];

  BOOL v7 = [(MADMLEnhancementRequest *)self modelPreparationOnly];
  v8 = @"No";
  if (v7) {
    v8 = @"Yes";
  }
  [v3 appendFormat:@"%@: %@", @"ModelPreparationOnly", v8];
  objc_super v9 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v9];

  return v3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)modelPreparationOnly
{
  return self->_modelPreparationOnly;
}

- (void)setModelPreparationOnly:(BOOL)a3
{
  self->_modelPreparationOnly = a3;
}

- (void).cxx_destruct
{
}

@end