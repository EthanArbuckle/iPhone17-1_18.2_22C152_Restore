@interface FPDItemIteratorEnumState
- (FPItem)parentItem;
- (FPXPCAutomaticErrorProxy)enumerator;
- (NSData)nextPage;
- (void)setEnumerator:(id)a3;
- (void)setNextPage:(id)a3;
- (void)setParentItem:(id)a3;
@end

@implementation FPDItemIteratorEnumState

- (FPItem)parentItem
{
  return self->_parentItem;
}

- (void)setParentItem:(id)a3
{
}

- (FPXPCAutomaticErrorProxy)enumerator
{
  return self->_enumerator;
}

- (void)setEnumerator:(id)a3
{
}

- (NSData)nextPage
{
  return self->_nextPage;
}

- (void)setNextPage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextPage, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_parentItem, 0);
}

@end