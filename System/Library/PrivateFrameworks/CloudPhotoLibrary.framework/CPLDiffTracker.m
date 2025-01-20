@interface CPLDiffTracker
- (BOOL)areObjectsDifferentOnProperty:(id)a3;
- (BOOL)objectsAreTotallyDifferent;
- (BOOL)shouldCompareAllProperties;
- (NSSet)differingProperties;
- (id)redactedDescription;
- (void)noteObjectAreTotallyDifferent;
- (void)noteObjectsDifferOnProperty:(id)a3;
- (void)setShouldCompareAllProperties:(BOOL)a3;
@end

@implementation CPLDiffTracker

- (void).cxx_destruct
{
}

- (NSSet)differingProperties
{
  return &self->_differingProperties->super;
}

- (BOOL)objectsAreTotallyDifferent
{
  return self->_objectsAreTotallyDifferent;
}

- (void)setShouldCompareAllProperties:(BOOL)a3
{
  self->_shouldCompareAllProperties = a3;
}

- (BOOL)shouldCompareAllProperties
{
  return self->_shouldCompareAllProperties;
}

- (id)redactedDescription
{
  if (self->_objectsAreTotallyDifferent)
  {
    v2 = @"[totally different objects]";
  }
  else if ([(NSMutableSet *)self->_differingProperties count])
  {
    id v4 = [NSString alloc];
    v5 = [(NSMutableSet *)self->_differingProperties allObjects];
    v6 = [v5 componentsJoinedByString:@", "];
    v2 = (__CFString *)[v4 initWithFormat:@"[diff. on %@]", v6];
  }
  else
  {
    v2 = @"[different objects]";
  }
  return v2;
}

- (BOOL)areObjectsDifferentOnProperty:(id)a3
{
  if (self->_objectsAreTotallyDifferent) {
    return 1;
  }
  else {
    return [(NSMutableSet *)self->_differingProperties containsObject:a3];
  }
}

- (void)noteObjectsDifferOnProperty:(id)a3
{
  id v4 = a3;
  differingProperties = self->_differingProperties;
  id v8 = v4;
  if (!differingProperties)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v7 = self->_differingProperties;
    self->_differingProperties = v6;

    id v4 = v8;
    differingProperties = self->_differingProperties;
  }
  [(NSMutableSet *)differingProperties addObject:v4];
}

- (void)noteObjectAreTotallyDifferent
{
  self->_objectsAreTotallyDifferent = 1;
}

@end