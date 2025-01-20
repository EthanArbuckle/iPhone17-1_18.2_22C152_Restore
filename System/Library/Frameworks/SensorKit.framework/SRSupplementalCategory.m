@interface SRSupplementalCategory
+ (BOOL)supportsSecureCoding;
+ (SRSupplementalCategory)new;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (SRSupplementalCategory)init;
- (SRSupplementalCategory)initWithCoder:(id)a3;
- (SRSupplementalCategory)initWithIdentifier:(id)a3;
- (id)description;
- (id)sr_dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRSupplementalCategory

- (SRSupplementalCategory)init
{
  return 0;
}

+ (SRSupplementalCategory)new
{
  return 0;
}

- (SRSupplementalCategory)initWithIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRSupplementalCategory;
  v4 = [(SRSupplementalCategory *)&v6 init];
  if (v4) {
    v4->_identifier = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRSupplementalCategory;
  [(SRSupplementalCategory *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  identifier = self->_identifier;
  uint64_t v6 = [a3 identifier];

  return [(NSString *)identifier isEqualToString:v6];
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@ <%p>: (identifier: %@)", NSStringFromClass(v4), self, self->_identifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SRSupplementalCategory)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  return [(SRSupplementalCategory *)self initWithIdentifier:v4];
}

- (id)sr_dictionaryRepresentation
{
  v5[1] = *MEMORY[0x263EF8340];
  identifier = &stru_26D165EC8;
  if (self->_identifier) {
    identifier = (__CFString *)self->_identifier;
  }
  uint64_t v4 = @"identifier";
  v5[0] = identifier;
  return (id)[NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
}

- (NSString)identifier
{
  return self->_identifier;
}

@end