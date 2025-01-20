@interface GEOVenueFilterItem
- (BOOL)describesParentVenue;
- (GEOVenueFilterItem)init;
- (GEOVenueFilterItem)initWithFilterElementInfo:(id)a3;
- (GEOVenueFilterItem)initWithLabel:(id)a3 filterID:(id)a4;
- (GEOVenueIdentifier)filterID;
- (GEOVenueLabel)label;
@end

@implementation GEOVenueFilterItem

- (GEOVenueFilterItem)init
{
  result = (GEOVenueFilterItem *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOVenueFilterItem)initWithLabel:(id)a3 filterID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOVenueFilterItem;
  v9 = [(GEOVenueFilterItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_filterID, a4);
    objc_storeStrong((id *)&v10->_label, a3);
    v10->_describesParentVenue = 0;
  }

  return v10;
}

- (GEOVenueFilterItem)initWithFilterElementInfo:(id)a3
{
  v4 = (id *)a3;
  v5 = [GEOVenueIdentifier alloc];
  v6 = -[GEOPDFilterElementInfo filterIds](v4);
  id v7 = [(GEOVenueIdentifier *)v5 initWithVenueIdentifiers:v6];

  id v8 = [GEOVenueLabel alloc];
  v9 = -[GEOPDFilterElementInfo label](v4);

  v10 = [(GEOVenueLabel *)v8 initWithLabel:v9];
  if (v7) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    objc_super v12 = 0;
  }
  else
  {
    self = [(GEOVenueFilterItem *)self initWithLabel:v10 filterID:v7];
    objc_super v12 = self;
  }

  return v12;
}

- (GEOVenueIdentifier)filterID
{
  return self->_filterID;
}

- (GEOVenueLabel)label
{
  return self->_label;
}

- (BOOL)describesParentVenue
{
  return self->_describesParentVenue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_filterID, 0);
}

@end