@interface _CRKConcreteArrayDifferenceConfiguration
- (id)incomingItemsIdentifierFunction;
- (id)liftingFunction;
- (id)publishedItemsComparator;
- (id)publishedItemsIdentifierFunction;
- (id)updateBlock;
- (void)setIncomingItemsIdentifierFunction:(id)a3;
- (void)setLiftingFunction:(id)a3;
- (void)setPublishedItemsComparator:(id)a3;
- (void)setPublishedItemsIdentifierFunction:(id)a3;
- (void)setUpdateBlock:(id)a3;
@end

@implementation _CRKConcreteArrayDifferenceConfiguration

- (id)publishedItemsComparator
{
  return self->_publishedItemsComparator;
}

- (void)setPublishedItemsComparator:(id)a3
{
}

- (id)incomingItemsIdentifierFunction
{
  return self->_incomingItemsIdentifierFunction;
}

- (void)setIncomingItemsIdentifierFunction:(id)a3
{
}

- (id)publishedItemsIdentifierFunction
{
  return self->_publishedItemsIdentifierFunction;
}

- (void)setPublishedItemsIdentifierFunction:(id)a3
{
}

- (id)liftingFunction
{
  return self->_liftingFunction;
}

- (void)setLiftingFunction:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong(&self->_liftingFunction, 0);
  objc_storeStrong(&self->_publishedItemsIdentifierFunction, 0);
  objc_storeStrong(&self->_incomingItemsIdentifierFunction, 0);

  objc_storeStrong(&self->_publishedItemsComparator, 0);
}

@end