@interface STUsageMediaCollection
- (BOOL)isGrouped;
- (NSArray)itemSizes;
- (NSArray)items;
- (int64_t)totalSize;
- (void)removeItemAtIndex:(unint64_t)a3;
- (void)setGrouped:(BOOL)a3;
- (void)setItemSizes:(id)a3;
- (void)setItems:(id)a3;
- (void)setTotalSize:(int64_t)a3;
- (void)sortItemsByMediaKey:(id)a3;
@end

@implementation STUsageMediaCollection

- (void)removeItemAtIndex:(unint64_t)a3
{
  v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_itemSizes, "objectAtIndexedSubscript:");
  self->_totalSize -= (int64_t)[v5 longLongValue];

  [(NSMutableArray *)self->_items removeObjectAtIndex:a3];
  itemSizes = self->_itemSizes;

  [(NSMutableArray *)itemSizes removeObjectAtIndex:a3];
}

- (void)sortItemsByMediaKey:(id)a3
{
  if ([(STUsageMediaCollection *)self isGrouped])
  {
    v4 = +[NSDictionary dictionaryWithObjects:self->_itemSizes forKeys:self->_items];
    items = self->_items;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_D320;
    v8[3] = &unk_96578;
    id v9 = v4;
    id v6 = v4;
    [(NSMutableArray *)items sortUsingComparator:v8];
    [(NSMutableArray *)self->_itemSizes sortUsingComparator:&stru_965B8];
  }
  else
  {
    v7 = self->_items;
    [(NSMutableArray *)v7 sortUsingComparator:&stru_965D8];
  }
}

- (NSArray)items
{
  return (NSArray *)self->_items;
}

- (void)setItems:(id)a3
{
  if (self->_items != a3)
  {
    self->_items = (NSMutableArray *)[a3 mutableCopy];
    _objc_release_x1();
  }
}

- (NSArray)itemSizes
{
  return (NSArray *)self->_itemSizes;
}

- (void)setItemSizes:(id)a3
{
  if (self->_itemSizes != a3)
  {
    self->_itemSizes = (NSMutableArray *)[a3 mutableCopy];
    _objc_release_x1();
  }
}

- (BOOL)isGrouped
{
  return self->_grouped;
}

- (void)setGrouped:(BOOL)a3
{
  self->_grouped = a3;
}

- (int64_t)totalSize
{
  return self->_totalSize;
}

- (void)setTotalSize:(int64_t)a3
{
  self->_totalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSizes, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end