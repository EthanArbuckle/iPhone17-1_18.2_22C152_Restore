@interface DIAttributeDocumentScanRequirements
+ (BOOL)supportsSecureCoding;
- (DIAttributeDocumentScanRequirements)initWithCoder:(id)a3;
- (DIAttributeDocumentScanRequirements)initWithDocumentScanRequirements:(id)a3;
- (NSString)countryCode;
- (NSString)type;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setType:(id)a3;
@end

@implementation DIAttributeDocumentScanRequirements

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeDocumentScanRequirements;
  id v4 = a3;
  [(DIAttributeImageCaptureRequirements *)&v5 encodeWithCoder:v4];
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeObject:forKey:", self->_countryCode, @"countryCode", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_type forKey:@"type"];

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeDocumentScanRequirements)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIAttributeDocumentScanRequirements;
  objc_super v5 = [(DIAttributeImageCaptureRequirements *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v8;
  }
  return v5;
}

- (DIAttributeDocumentScanRequirements)initWithDocumentScanRequirements:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIAttributeDocumentScanRequirements;
  objc_super v5 = [(DIAttributeImageCaptureRequirements *)&v11 initWithImageCaptureRequirements:v4];
  if (v5)
  {
    uint64_t v6 = [v4 countryCode];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v6;

    uint64_t v8 = [v4 type];
    type = v5->_type;
    v5->_type = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v6.receiver = self;
  v6.super_class = (Class)DIAttributeDocumentScanRequirements;
  id v4 = [(DIAttributeImageCaptureRequirements *)&v6 description];
  [v3 appendFormat:@"%@", v4];

  os_unfair_lock_lock(&self->super._lock);
  [v3 appendFormat:@"countryCode: '%@'; ", self->_countryCode];
  [v3 appendFormat:@"type: '%@'; ", self->_type];
  os_unfair_lock_unlock(&self->super._lock);
  [v3 appendFormat:@">"];
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[DIAttributeDocumentScanRequirements allocWithZone:a3];
  return [(DIAttributeDocumentScanRequirements *)v4 initWithDocumentScanRequirements:self];
}

- (NSString)countryCode
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  id v4 = self->_countryCode;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCountryCode:(id)a3
{
  objc_super v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_countryCode != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    countryCode = self->_countryCode;
    self->_countryCode = v4;
  }
  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)type
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  id v4 = self->_type;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setType:(id)a3
{
  objc_super v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_type != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    type = self->_type;
    self->_type = v4;
  }
  os_unfair_lock_unlock(&self->super._lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end