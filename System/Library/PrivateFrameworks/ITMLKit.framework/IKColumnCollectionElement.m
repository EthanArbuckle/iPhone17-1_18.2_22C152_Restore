@interface IKColumnCollectionElement
- (NSArray)columns;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation IKColumnCollectionElement

- (id)applyUpdatesWithElement:(id)a3
{
  columns = self->_columns;
  self->_columns = 0;
  id v5 = a3;

  v8.receiver = self;
  v8.super_class = (Class)IKColumnCollectionElement;
  v6 = [(IKViewElement *)&v8 applyUpdatesWithElement:v5];

  return v6;
}

- (NSArray)columns
{
  columns = self->_columns;
  if (!columns)
  {
    v4 = [(IKViewElement *)self childElementsWithType:21];
    id v5 = self->_columns;
    self->_columns = v4;

    columns = self->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
}

@end