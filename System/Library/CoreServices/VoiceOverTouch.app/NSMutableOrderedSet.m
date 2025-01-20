@interface NSMutableOrderedSet
- (void)addTVElement:(id)a3;
- (void)addTVElements:(id)a3;
@end

@implementation NSMutableOrderedSet

- (void)addTVElement:(id)a3
{
  if (a3) {
    -[NSMutableOrderedSet addObject:](self, "addObject:");
  }
}

- (void)addTVElements:(id)a3
{
  if (a3) {
    -[NSMutableOrderedSet addObjectsFromArray:](self, "addObjectsFromArray:");
  }
}

@end