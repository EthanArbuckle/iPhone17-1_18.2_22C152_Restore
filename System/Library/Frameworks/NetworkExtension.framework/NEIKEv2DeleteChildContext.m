@interface NEIKEv2DeleteChildContext
- (id)description;
@end

@implementation NEIKEv2DeleteChildContext

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self)
  {
    uint64_t childID = self->_childID;
    reasonError = self->_reasonError;
  }
  else
  {
    uint64_t childID = 0;
    reasonError = 0;
  }
  v6 = (void *)[v3 initWithFormat:@"delete child with id %u, reason %@", childID, reasonError];

  return v6;
}

@end