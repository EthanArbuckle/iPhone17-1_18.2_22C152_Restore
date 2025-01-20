@interface _MPCQCBMSPPendingAction
- (NSDate)expirationDate;
- (NSString)itemIdentifier;
- (NSString)label;
- (id)block;
- (id)description;
- (void)setBlock:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation _MPCQCBMSPPendingAction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setBlock:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p label=\"%@\" itemID=%@ expiration=%@>", objc_opt_class(), self, self->_label, self->_itemIdentifier, self->_expirationDate];
}

@end