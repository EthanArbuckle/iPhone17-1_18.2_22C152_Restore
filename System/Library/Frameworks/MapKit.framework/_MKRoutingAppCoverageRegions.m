@interface _MKRoutingAppCoverageRegions
- (BOOL)containsCoordinate:(CLLocationCoordinate2D)a3;
- (_MKRoutingAppCoverageRegions)initWithContentsOfURL:(id)a3 error:(id *)a4;
@end

@implementation _MKRoutingAppCoverageRegions

- (_MKRoutingAppCoverageRegions)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_MKRoutingAppCoverageRegions;
  v7 = [(_MKRoutingAppCoverageRegions *)&v16 init];
  if (!v7) {
    goto LABEL_7;
  }
  if (([v6 isFileURL] & 1) == 0)
  {
    if (!a4) {
      goto LABEL_8;
    }
    v12 = (void *)MEMORY[0x1E4F28C58];
    v13 = MKErrorDomain;
    uint64_t v17 = *MEMORY[0x1E4F1D138];
    v18[0] = @"Invalid URL";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a4 = [v12 errorWithDomain:v13 code:1 userInfo:v14];

LABEL_7:
    a4 = 0;
    goto LABEL_8;
  }
  v8 = [_MKMultiPolygonGeoRegion alloc];
  v9 = [v6 path];
  uint64_t v10 = [(_MKMultiPolygonGeoRegion *)v8 initWithContentsOfFile:v9 error:a4];
  regions = v7->_regions;
  v7->_regions = (_MKMultiPolygonGeoRegion *)v10;

  if (!v7->_regions) {
    goto LABEL_7;
  }
  a4 = v7;
LABEL_8:

  return (_MKRoutingAppCoverageRegions *)a4;
}

- (BOOL)containsCoordinate:(CLLocationCoordinate2D)a3
{
  return -[_MKMultiPolygonGeoRegion coordinateLiesInRegion:](self->_regions, "coordinateLiesInRegion:", a3.latitude, a3.longitude);
}

- (void).cxx_destruct
{
}

@end