@interface PKSelectionTile
- (PKSelectionTile)initWithProperties:(id)a3;
- (PKSelectionTileProperties)properties;
@end

@implementation PKSelectionTile

- (PKSelectionTile)initWithProperties:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSelectionTile;
  v5 = [(PKSelectionTile *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    properties = v5->_properties;
    v5->_properties = (PKSelectionTileProperties *)v6;

    [(PKSelectionTile *)v5 setMasksToBounds:1];
    [(PKSelectionTile *)v5 setShouldRasterize:1];
  }

  return v5;
}

- (PKSelectionTileProperties)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
}

@end