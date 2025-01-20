@interface DIAttributeCamera
+ (BOOL)supportsSecureCoding;
- (DIAttributeCamera)init;
- (DIAttributeCamera)initWithCoder:(id)a3;
- (NSArray)getCurrentValue;
- (NSArray)scanRequirements;
- (id)defaultValue;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setScanRequirements:(id)a3;
@end

@implementation DIAttributeCamera

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeCamera;
  id v4 = a3;
  [(DIAttribute *)&v5 encodeWithCoder:v4];
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeObject:forKey:", self->_scanRequirements, @"scanRequirements", v5.receiver, v5.super_class);

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeCamera)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIAttributeCamera;
  objc_super v5 = [(DIAttribute *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"scanRequirements"];
    scanRequirements = v5->_scanRequirements;
    v5->_scanRequirements = (NSArray *)v9;
  }
  return v5;
}

- (DIAttributeCamera)init
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeCamera;
  v2 = [(DIAttribute *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DIAttribute *)v2 setAttributeType:9];
  }
  return v3;
}

- (void)setCurrentValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributeCamera;
  [(DIAttribute *)&v3 setCurrentValue:a3];
}

- (void)setScanRequirements:(id)a3
{
  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_scanRequirements != v6)
  {
    id v4 = (NSArray *)[(NSArray *)v6 copyWithZone:0];
    scanRequirements = self->_scanRequirements;
    self->_scanRequirements = v4;
  }
  os_unfair_lock_unlock(&self->super._lock);
}

- (NSArray)getCurrentValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeCamera;
  v2 = [(DIAttribute *)&v4 getCurrentValue];
  return (NSArray *)v2;
}

- (id)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeCamera;
  v2 = [(DIAttribute *)&v4 defaultValue];
  return v2;
}

- (NSArray)scanRequirements
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  objc_super v4 = self->_scanRequirements;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v26.receiver = self;
  v26.super_class = (Class)DIAttributeCamera;
  objc_super v4 = [(DIAttribute *)&v26 description];
  [v3 appendFormat:@"%@", v4];

  [v3 appendFormat:@"scanRequirements: [ \n"];
  os_unfair_lock_lock(&self->super._lock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  objc_super v5 = self->_scanRequirements;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v22 + 1) + 8 * i) description];
        [v3 appendFormat:@"    scanRequirement: '%@'\n", v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->super._lock);
  [v3 appendFormat:@"]; "];
  [v3 appendFormat:@"currentValue: [ \n"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = [(DIAttributeCamera *)self getCurrentValue];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v18 + 1) + 8 * j) description];
        [v3 appendFormat:@"    image: '%@'\n", v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v13);
  }

  [v3 appendFormat:@"]; "];
  [v3 appendFormat:@">"];
  return v3;
}

- (void).cxx_destruct
{
}

@end