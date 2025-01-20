@interface NSSQLiteIntarrayTable
- (void)dealloc;
@end

@implementation NSSQLiteIntarrayTable

- (void)dealloc
{
  self->_intarrayTable = 0;

  self->_intarrayTableName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLiteIntarrayTable;
  [(NSSQLiteIntarrayTable *)&v3 dealloc];
}

@end