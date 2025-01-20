@interface NEIKEv2RekeyChildContext
- (id)description;
@end

@implementation NEIKEv2RekeyChildContext

- (id)description
{
  id v3 = [NSString alloc];
  if (self) {
    uint64_t childID = self->_childID;
  }
  else {
    uint64_t childID = 0;
  }
  v5 = objc_msgSend(v3, "initWithFormat:", @"rekey child context with child id %u", childID);

  return v5;
}

@end