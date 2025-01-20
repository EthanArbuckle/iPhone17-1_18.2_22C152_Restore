@interface GEOVectorTransitLine
- (GEOFeature)feature;
- (GeoCodecsRGBAColor8)color;
- (float)minZoom;
- (id)init:(void *)a3 withVectorTile:(id)a4;
- (unsigned)cartoId;
- (unsigned)order;
- (unsigned)subtitleOffset;
- (unsigned)systemIndex;
- (void)get;
@end

@implementation GEOVectorTransitLine

- (id)init:(void *)a3 withVectorTile:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOVectorTransitLine;
    v7 = [(GEOVectorTransitLine *)&v12 init];
    v8 = v7;
    if (v7)
    {
      v7->_vectorTransitLine = a3;
      v9 = [[GEOFeature alloc] init:a3 withVectorTile:v6];
      feature = v8->_feature;
      v8->_feature = v9;
    }
    self = v8;
    a3 = self;
  }

  return a3;
}

- (void)get
{
  return self->_vectorTransitLine;
}

- (GEOFeature)feature
{
  return self->_feature;
}

- (GeoCodecsRGBAColor8)color
{
  vectorTransitLine = (GeoCodecsRGBAColor8 *)self->_vectorTransitLine;
  if (vectorTransitLine) {
    return vectorTransitLine + 20;
  }
  else {
    return 0;
  }
}

- (unsigned)systemIndex
{
  vectorTransitLine = self->_vectorTransitLine;
  if (vectorTransitLine) {
    return vectorTransitLine[21];
  }
  else {
    return 0;
  }
}

- (float)minZoom
{
  vectorTransitLine = (float *)self->_vectorTransitLine;
  if (vectorTransitLine) {
    return vectorTransitLine[22];
  }
  else {
    return 0.0;
  }
}

- (unsigned)subtitleOffset
{
  vectorTransitLine = self->_vectorTransitLine;
  if (vectorTransitLine) {
    return vectorTransitLine[23];
  }
  else {
    return 0;
  }
}

- (unsigned)cartoId
{
  vectorTransitLine = self->_vectorTransitLine;
  if (vectorTransitLine) {
    return vectorTransitLine[24];
  }
  else {
    return 0;
  }
}

- (unsigned)order
{
  vectorTransitLine = self->_vectorTransitLine;
  if (vectorTransitLine) {
    return vectorTransitLine[25];
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end