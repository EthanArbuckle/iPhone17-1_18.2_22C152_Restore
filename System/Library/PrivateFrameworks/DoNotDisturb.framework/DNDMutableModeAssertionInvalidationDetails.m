@interface DNDMutableModeAssertionInvalidationDetails
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation DNDMutableModeAssertionInvalidationDetails

- (void)setIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  identifier = self->super._identifier;
  self->super._identifier = v4;
  MEMORY[0x1F41817F8](v4, identifier);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDModeAssertionInvalidationDetails alloc];
  return [(DNDModeAssertionInvalidationDetails *)v4 _initWithDetails:self];
}

@end