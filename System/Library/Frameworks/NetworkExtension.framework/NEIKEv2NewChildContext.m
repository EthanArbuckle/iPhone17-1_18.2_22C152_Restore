@interface NEIKEv2NewChildContext
- (id)description;
@end

@implementation NEIKEv2NewChildContext

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self)
  {
    childSA = self->_childSA;
    if (childSA) {
      childSA = (NEIKEv2ChildSA *)childSA->_childID;
    }
  }
  else
  {
    childSA = 0;
  }
  v5 = objc_msgSend(v3, "initWithFormat:", @"new child request with id %u", childSA);

  return v5;
}

@end