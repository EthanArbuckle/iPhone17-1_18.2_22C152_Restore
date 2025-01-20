@interface _BSCompoundAssertionState
- (BOOL)isActive;
- (NSOrderedSet)orderedContext;
- (NSSet)context;
- (id)description;
@end

@implementation _BSCompoundAssertionState

- (void).cxx_destruct
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSSet)context
{
  return [(NSOrderedSet *)self->_context set];
}

- (NSOrderedSet)orderedContext
{
  return self->_context;
}

- (id)description
{
  v2 = @"YES";
  if (!self->_active) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"active:%@ %@", v2, self->_context];
}

@end