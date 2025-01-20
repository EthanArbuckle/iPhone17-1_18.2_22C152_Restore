@interface GEOButtonItemGroup
- (GEOButtonItemGroup)initWithGroupParams:(id)a3;
- (NSArray)buttonItems;
- (id)debugDescription;
- (id)description;
- (int)buttonType;
- (int)groupType;
- (unint64_t)actionDataIndex;
@end

@implementation GEOButtonItemGroup

- (GEOButtonItemGroup)initWithGroupParams:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOButtonItemGroup;
    v6 = [(GEOButtonItemGroup *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_params, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)buttonItems
{
  v2 = [(GEOPDGroupParams *)self->_params groupData];
  v3 = [v2 buttonItems];
  v4 = +[GEOButtonItem buttonItemsFromPDButtonItems:v3];

  return (NSArray *)v4;
}

- (int)buttonType
{
  return 7;
}

- (int)groupType
{
  int v2 = [(GEOPDGroupParams *)self->_params groupButtonType];
  if (v2) {
    return v2 == 1;
  }
  else {
    return 2;
  }
}

- (unint64_t)actionDataIndex
{
  return [(GEOPDGroupParams *)self->_params actionDataItemIndex];
}

- (id)description
{
  return [(GEOPDGroupParams *)self->_params description];
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(GEOPDGroupParams *)self->_params debugDescription];
  v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end