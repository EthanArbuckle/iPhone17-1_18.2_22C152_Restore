@interface HMDRelationshipCodingDescription
- (BOOL)isParentChild;
- (BOOL)isReference;
- (NSRelationshipDescription)relationship;
@end

@implementation HMDRelationshipCodingDescription

- (BOOL)isReference
{
  return !self->_parentChild;
}

- (BOOL)isParentChild
{
  return self->_parentChild;
}

- (NSRelationshipDescription)relationship
{
  if (self)
  {
    self = [(HMDPropertyCodingDescription *)self property];
    uint64_t v2 = vars8;
  }
  return (NSRelationshipDescription *)self;
}

@end