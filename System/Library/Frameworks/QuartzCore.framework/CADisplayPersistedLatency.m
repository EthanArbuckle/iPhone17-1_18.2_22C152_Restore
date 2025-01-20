@interface CADisplayPersistedLatency
+ (BOOL)supportsSecureCoding;
- (CADisplayPersistedLatency)initWithCoder:(id)a3;
- (NSDictionary)mode;
- (NSString)uuid;
- (double)latency;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLatency:(double)a3;
- (void)setMode:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CADisplayPersistedLatency

- (void)setLatency:(double)a3
{
  self->_latency = a3;
}

- (double)latency
{
  return self->_latency;
}

- (void)setMode:(id)a3
{
}

- (NSDictionary)mode
{
  return self->_mode;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_uuid forKey:@"uuid"];
  [a3 encodeObject:self->_mode forKey:@"mode"];
  uint64_t v5 = [NSNumber numberWithDouble:self->_latency];

  [a3 encodeObject:v5 forKey:@"latency"];
}

- (CADisplayPersistedLatency)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CADisplayPersistedLatency;
  v4 = [(CADisplayPersistedLatency *)&v7 init];
  if (v4)
  {
    v4->_uuid = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    if (mode_dictionary_classes(void)::once != -1) {
      dispatch_once(&mode_dictionary_classes(void)::once, &__block_literal_global_141_22917);
    }
    v4->_mode = (NSDictionary *)(id)[a3 decodeObjectOfClasses:mode_dictionary_classes(void)::set forKey:@"mode"];
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"latency"), "doubleValue");
    v4->_latency = v5;
  }
  return v4;
}

- (id)description
{
  v3 = (void *)[MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  [v3 appendFormat:@"<%@:%p; ", NSStringFromClass(v4), self];
  [v3 appendFormat:@"uuid: %@, mode: %@, latency:%g", self->_uuid, self->_mode, *(void *)&self->_latency];
  [v3 appendString:@">"];
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CADisplayPersistedLatency;
  [(CADisplayPersistedLatency *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end