@interface NSXPCRow
- (NSXPCRow)initWithNode:(id)a3;
- (id)objectID;
- (void)dealloc;
@end

@implementation NSXPCRow

- (id)objectID
{
  return (id)[self->_node objectID];
}

- (NSXPCRow)initWithNode:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSXPCRow;
  v4 = [(NSPersistentCacheRow *)&v6 initWithOptions:0 andTimestamp:0.0];
  if (v4) {
    v4->_node = a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_node = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCRow;
  [(NSPersistentCacheRow *)&v3 dealloc];
}

@end