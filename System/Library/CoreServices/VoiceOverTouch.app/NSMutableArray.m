@interface NSMutableArray
- (void)addTVElement:(id)a3;
- (void)addTVElements:(id)a3;
@end

@implementation NSMutableArray

- (void)addTVElement:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self, "addObject:");
  }
}

- (void)addTVElements:(id)a3
{
  if (a3) {
    -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:");
  }
}

@end