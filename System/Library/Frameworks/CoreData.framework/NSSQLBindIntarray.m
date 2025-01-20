@interface NSSQLBindIntarray
- (NSSQLBindIntarray)initWithValue:(id)a3;
- (NSString)tableName;
- (id)value;
- (unsigned)index;
- (void)dealloc;
- (void)setIndex:(unsigned int)a3;
- (void)setTableName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation NSSQLBindIntarray

- (unsigned)index
{
  return self->_index;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (id)value
{
  return self->_value;
}

- (void)setTableName:(id)a3
{
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (NSSQLBindIntarray)initWithValue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSSQLBindIntarray;
  v4 = [(NSSQLBindIntarray *)&v6 init];
  if (v4) {
    v4->_value = a3;
  }
  return v4;
}

- (void)setValue:(id)a3
{
}

- (void)dealloc
{
  self->_value = 0;
  self->_tableName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBindIntarray;
  [(NSSQLBindIntarray *)&v3 dealloc];
}

@end