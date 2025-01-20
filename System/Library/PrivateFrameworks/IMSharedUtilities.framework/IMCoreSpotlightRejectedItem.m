@interface IMCoreSpotlightRejectedItem
- (IMCoreSpotlightRejectedItem)initWithDomain:(id)a3 identifier:(id)a4 reason:(int64_t)a5;
- (NSString)proposedDomain;
- (NSString)proposedIdentifier;
- (int64_t)reason;
@end

@implementation IMCoreSpotlightRejectedItem

- (IMCoreSpotlightRejectedItem)initWithDomain:(id)a3 identifier:(id)a4 reason:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMCoreSpotlightRejectedItem;
  v11 = [(IMCoreSpotlightRejectedItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_proposedDomain, a3);
    objc_storeStrong((id *)&v12->_proposedIdentifier, a4);
    v12->_reason = a5;
  }

  return v12;
}

- (NSString)proposedDomain
{
  return self->_proposedDomain;
}

- (NSString)proposedIdentifier
{
  return self->_proposedIdentifier;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedIdentifier, 0);

  objc_storeStrong((id *)&self->_proposedDomain, 0);
}

@end