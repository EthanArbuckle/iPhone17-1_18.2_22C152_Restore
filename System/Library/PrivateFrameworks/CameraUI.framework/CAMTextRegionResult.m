@interface CAMTextRegionResult
- (AVMetadataTextRegionObject)_metadataTextRegionObject;
- (CAMTextRegionResult)initWithTextRegionObject:(id)a3;
- (CGRect)bounds;
- (NSString)description;
- (NSString)metadataType;
- (NSString)uniqueIdentifier;
- (double)baselineAngle;
- (float)confidence;
- (void)set_metadataTextRegionObject:(id)a3;
@end

@implementation CAMTextRegionResult

- (CAMTextRegionResult)initWithTextRegionObject:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAMTextRegionResult;
  v6 = [(CAMTextRegionResult *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__metadataTextRegionObject, a3);
    [v5 angularOffsetBounds];
    v7->_bounds.origin.x = v8;
    v7->_bounds.origin.y = v9;
    v7->_bounds.size.width = v10;
    v7->_bounds.size.height = v11;
    [v5 angularOffset];
    v7->_baselineAngle = v12 * 3.14159265 / 180.0;
    v13 = NSString;
    v14 = [(CAMTextRegionResult *)v7 metadataType];
    uint64_t v15 = [v13 stringWithFormat:@"%@ %ld", v14, objc_msgSend(v5, "regionID")];
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v15;

    v17 = v7;
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(CAMTextRegionResult *)self _metadataTextRegionObject];
  v7 = [v3 stringWithFormat:@"<%@: %p identifier: %ld>", v5, self, objc_msgSend(v6, "regionID")];

  return (NSString *)v7;
}

- (float)confidence
{
  v2 = [(CAMTextRegionResult *)self _metadataTextRegionObject];
  [v2 confidence];
  float v4 = v3;

  return v4;
}

- (NSString)metadataType
{
  return (NSString *)@"TextRegion";
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)baselineAngle
{
  return self->_baselineAngle;
}

- (AVMetadataTextRegionObject)_metadataTextRegionObject
{
  return self->__metadataTextRegionObject;
}

- (void)set_metadataTextRegionObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__metadataTextRegionObject, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end