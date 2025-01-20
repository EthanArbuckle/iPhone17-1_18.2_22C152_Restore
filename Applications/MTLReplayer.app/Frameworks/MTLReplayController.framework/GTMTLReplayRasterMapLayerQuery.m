@interface GTMTLReplayRasterMapLayerQuery
+ (BOOL)supportsSecureCoding;
- (GTMTLReplayRasterMapLayerQuery)initWithCoder:(id)a3;
- (GTSize)size;
- (NSArray)horizontalLogicalCoordinatesAtPhysicalTileBoundaries;
- (NSArray)verticalLogicalCoordinatesAtPhysicalTileBoundaries;
- (void)encodeWithCoder:(id)a3;
- (void)setHorizontalLogicalCoordinatesAtPhysicalTileBoundaries:(id)a3;
- (void)setSize:(GTSize *)a3;
- (void)setVerticalLogicalCoordinatesAtPhysicalTileBoundaries:(id)a3;
@end

@implementation GTMTLReplayRasterMapLayerQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalLogicalCoordinatesAtPhysicalTileBoundaries, 0);

  objc_storeStrong((id *)&self->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries, 0);
}

- (void)setSize:(GTSize *)a3
{
  long long v3 = *(_OWORD *)&a3->width;
  self->_size.depth = a3->depth;
  *(_OWORD *)&self->_size.width = v3;
}

- (GTSize)size
{
  *retstr = self[1];
  return self;
}

- (void)setVerticalLogicalCoordinatesAtPhysicalTileBoundaries:(id)a3
{
}

- (NSArray)verticalLogicalCoordinatesAtPhysicalTileBoundaries
{
  return self->_verticalLogicalCoordinatesAtPhysicalTileBoundaries;
}

- (void)setHorizontalLogicalCoordinatesAtPhysicalTileBoundaries:(id)a3
{
}

- (NSArray)horizontalLogicalCoordinatesAtPhysicalTileBoundaries
{
  return self->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t width = self->_size.width;
  id v5 = a3;
  [v5 encodeInt64:width forKey:@"size.width"];
  [v5 encodeInt64:self->_size.height forKey:@"size.height"];
  [v5 encodeInt64:self->_size.depth forKey:@"size.depth"];
  [v5 encodeObject:self->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries forKey:@"horizontalLogicalCoordinatesAtPhysicalTileBoundaries"];
  [v5 encodeObject:self->_verticalLogicalCoordinatesAtPhysicalTileBoundaries forKey:@"verticalLogicalCoordinatesAtPhysicalTileBoundaries"];
}

- (GTMTLReplayRasterMapLayerQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GTMTLReplayRasterMapLayerQuery;
  id v5 = [(GTMTLReplayRasterMapLayerQuery *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    v5->_size.unint64_t width = (unint64_t)[v4 decodeInt64ForKey:@"size.width"];
    v5->_size.height = (unint64_t)[v4 decodeInt64ForKey:@"size.height"];
    v5->_size.depth = (unint64_t)[v4 decodeInt64ForKey:@"size.depth"];
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"horizontalLogicalCoordinatesAtPhysicalTileBoundaries"];
    horizontalLogicalCoordinatesAtPhysicalTileBoundaries = v5->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries;
    v5->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClasses:v9 forKey:@"verticalLogicalCoordinatesAtPhysicalTileBoundaries"];
    verticalLogicalCoordinatesAtPhysicalTileBoundaries = v5->_verticalLogicalCoordinatesAtPhysicalTileBoundaries;
    v5->_verticalLogicalCoordinatesAtPhysicalTileBoundaries = (NSArray *)v12;

    v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end