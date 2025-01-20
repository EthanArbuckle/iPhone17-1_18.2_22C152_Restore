@interface CADisplayPersistedPreferredMode
+ (BOOL)supportsSecureCoding;
- (CADisplayPersistedPreferredMode)initWithCoder:(id)a3;
- (NSDictionary)mode;
- (NSString)uuid;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMode:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CADisplayPersistedPreferredMode

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
  mode = self->_mode;

  [a3 encodeObject:mode forKey:@"mode"];
}

- (CADisplayPersistedPreferredMode)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CADisplayPersistedPreferredMode;
  v4 = [(CADisplayPersistedPreferredMode *)&v6 init];
  if (v4)
  {
    v4->_uuid = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    if (mode_dictionary_classes(void)::once != -1) {
      dispatch_once(&mode_dictionary_classes(void)::once, &__block_literal_global_141_22917);
    }
    v4->_mode = (NSDictionary *)(id)[a3 decodeObjectOfClasses:mode_dictionary_classes(void)::set forKey:@"mode"];
  }
  return v4;
}

- (id)description
{
  v3 = (void *)[MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  [v3 appendFormat:@"<%@:%p; ", NSStringFromClass(v4), self];
  [v3 appendFormat:@"uuid: %@, mode: %@", self->_uuid, self->_mode];
  [v3 appendString:@">"];
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CADisplayPersistedPreferredMode;
  [(CADisplayPersistedPreferredMode *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end