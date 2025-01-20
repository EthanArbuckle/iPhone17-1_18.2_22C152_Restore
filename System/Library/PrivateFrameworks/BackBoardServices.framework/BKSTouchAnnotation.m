@interface BKSTouchAnnotation
+ (BOOL)supportsSecureCoding;
- (BKSTouchAnnotation)initWithCoder:(id)a3;
- (NSString)text;
- (NSString)uniqueIdentifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unsigned)touchIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setText:(id)a3;
- (void)setTouchIdentifier:(unsigned int)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation BKSTouchAnnotation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setTouchIdentifier:(unsigned int)a3
{
  self->_touchIdentifier = a3;
}

- (unsigned)touchIdentifier
{
  return self->_touchIdentifier;
}

- (BKSTouchAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKSTouchAnnotation;
  v5 = [(BKSTouchAnnotation *)&v11 init];
  if (v5)
  {
    v5->_touchIdentifier = [v4 decodeInt32ForKey:@"touchIdentifier"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t touchIdentifier = self->_touchIdentifier;
  id v5 = a3;
  [v5 encodeInt32:touchIdentifier forKey:@"touchIdentifier"];
  [v5 encodeObject:self->_text forKey:@"text"];
  [v5 encodeObject:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(BKSTouchAnnotation *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendUnsignedInt:self->_touchIdentifier withName:@"touchIdentifier"];
  id v6 = (id)[v4 appendObject:self->_text withName:@"text"];
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    id v8 = (id)[v4 appendObject:uniqueIdentifier withName:@"uniqueIdentifier"];
  }
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKSTouchAnnotation *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(BKSTouchAnnotation *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end