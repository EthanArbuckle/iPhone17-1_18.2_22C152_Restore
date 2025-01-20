@interface CalOrderedListChangeItem
- (REMListChangeItem)listChangeItem;
- (int64_t)order;
- (void)setListChangeItem:(id)a3;
- (void)setOrder:(int64_t)a3;
@end

@implementation CalOrderedListChangeItem

- (REMListChangeItem)listChangeItem
{
  return self->_listChangeItem;
}

- (void)setListChangeItem:(id)a3
{
}

- (int64_t)order
{
  return self->_order;
}

- (void)setOrder:(int64_t)a3
{
  self->_order = a3;
}

- (void).cxx_destruct
{
}

@end