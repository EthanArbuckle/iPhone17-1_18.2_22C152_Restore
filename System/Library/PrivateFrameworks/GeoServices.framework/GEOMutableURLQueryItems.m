@interface GEOMutableURLQueryItems
- (GEOMutableURLQueryItems)init;
- (GEOMutableURLQueryItems)initWithItems:(id)a3;
- (NSMutableArray)items;
- (void)addItem:(id)a3;
- (void)addItemWithName:(id)a3 intValue:(int)a4;
- (void)addItemWithName:(id)a3 uint64Value:(unint64_t)a4;
- (void)addItemWithName:(id)a3 uintValue:(unsigned int)a4;
- (void)addItemWithName:(id)a3 value:(id)a4;
- (void)addItemsFromArray:(id)a3;
@end

@implementation GEOMutableURLQueryItems

- (GEOMutableURLQueryItems)init
{
  return [(GEOMutableURLQueryItems *)self initWithItems:0];
}

- (GEOMutableURLQueryItems)initWithItems:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMutableURLQueryItems;
  v5 = [(GEOMutableURLQueryItems *)&v10 init];
  if (v5)
  {
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = (id)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    items = v5->_items;
    v5->_items = (NSMutableArray *)v7;
  }
  return v5;
}

- (void)addItemsFromArray:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOMutableURLQueryItems *)self items];
  [v5 addObjectsFromArray:v4];
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOMutableURLQueryItems *)self items];
  [v5 addObject:v4];
}

- (void)addItemWithName:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(GEOMutableURLQueryItems *)self items];
  v8 = [MEMORY[0x1E4F290C8] queryItemWithName:v7 value:v6];

  [v9 addObject:v8];
}

- (void)addItemWithName:(id)a3 intValue:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = NSString;
  id v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", @"%d", v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(GEOMutableURLQueryItems *)self addItemWithName:v7 value:v8];
}

- (void)addItemWithName:(id)a3 uintValue:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = NSString;
  id v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", @"%u", v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(GEOMutableURLQueryItems *)self addItemWithName:v7 value:v8];
}

- (void)addItemWithName:(id)a3 uint64Value:(unint64_t)a4
{
  id v6 = NSString;
  id v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", @"%llu", a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(GEOMutableURLQueryItems *)self addItemWithName:v7 value:v8];
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end