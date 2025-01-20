@interface CSListItemSection
- (BOOL)supportsViewGrouping;
- (CSListItemSection)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setSupportsViewGrouping:(BOOL)a3;
@end

@implementation CSListItemSection

- (CSListItemSection)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSListItemSection;
  v6 = [(CSListItemSection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (id)succinctDescription
{
  v2 = [(CSListItemSection *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CSListItemSection *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(CSListItemSection *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_identifier withName:@"identifier"];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)supportsViewGrouping
{
  return self->_supportsViewGrouping;
}

- (void)setSupportsViewGrouping:(BOOL)a3
{
  self->_supportsViewGrouping = a3;
}

- (void).cxx_destruct
{
}

@end