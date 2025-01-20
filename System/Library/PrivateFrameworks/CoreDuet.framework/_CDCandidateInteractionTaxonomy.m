@interface _CDCandidateInteractionTaxonomy
+ (void)taxonomyOfInteraction:(uint64_t)a1;
+ (void)taxonomyWithDirection:(uint64_t)a3 mechanism:;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _CDCandidateInteractionTaxonomy

+ (void)taxonomyWithDirection:(uint64_t)a3 mechanism:
{
  v5 = objc_alloc((Class)self);
  if (v5)
  {
    v5[1] = a2;
    v5[2] = a3;
  }
  return v5;
}

+ (void)taxonomyOfInteraction:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 direction];
  uint64_t v4 = [v2 mechanism];

  return +[_CDCandidateInteractionTaxonomy taxonomyWithDirection:mechanism:]((uint64_t)_CDCandidateInteractionTaxonomy, v3, v4);
}

- (unint64_t)hash
{
  return self->_direction + 4 * self->_mechanism;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  v6 = v5;
  BOOL v7 = v6 && self->_direction == v6[1] && self->_mechanism == v6[2];

  return v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = directionToString(self->_direction);
  v6 = mechanismToString(self->_mechanism);
  BOOL v7 = (void *)[v3 initWithFormat:@"<%@: %@ %@>", v4, v5, v6];

  return v7;
}

@end