@interface GEOCombinedFactoid
- (BOOL)canBeDisplayedInPlaceSummary;
- (BOOL)shouldUseStructuredData;
- (GEOColor)color;
- (GEOCombinedFactoid)initWithLabelFactoid:(id)a3 iconFactoid:(id)a4;
- (GEOMapItemIdentifier)placeIdentifier;
- (NSString)symbolName;
- (NSString)title;
- (NSString)unstructuredValue;
- (double)value;
- (int)semantic;
- (int)unitType;
@end

@implementation GEOCombinedFactoid

- (GEOCombinedFactoid)initWithLabelFactoid:(id)a3 iconFactoid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOCombinedFactoid;
  v9 = [(GEOCombinedFactoid *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_labelFactoid, a3);
    objc_storeStrong((id *)&v10->_iconFactoid, a4);
  }

  return v10;
}

- (NSString)title
{
  return [(GEOFactoid *)self->_labelFactoid title];
}

- (double)value
{
  [(GEOFactoid *)self->_labelFactoid value];
  return result;
}

- (NSString)unstructuredValue
{
  return [(GEOFactoid *)self->_labelFactoid unstructuredValue];
}

- (int)semantic
{
  return [(GEOFactoid *)self->_labelFactoid semantic];
}

- (int)unitType
{
  return [(GEOFactoid *)self->_labelFactoid unitType];
}

- (BOOL)shouldUseStructuredData
{
  return [(GEOFactoid *)self->_labelFactoid shouldUseStructuredData];
}

- (NSString)symbolName
{
  return [(GEOFactoid *)self->_iconFactoid symbolName];
}

- (GEOMapItemIdentifier)placeIdentifier
{
  return [(GEOFactoid *)self->_labelFactoid placeIdentifier];
}

- (BOOL)canBeDisplayedInPlaceSummary
{
  return [(GEOFactoid *)self->_labelFactoid canBeDisplayedInPlaceSummary];
}

- (GEOColor)color
{
  return [(GEOFactoid *)self->_labelFactoid color];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconFactoid, 0);

  objc_storeStrong((id *)&self->_labelFactoid, 0);
}

@end