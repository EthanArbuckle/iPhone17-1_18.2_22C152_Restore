@interface _MKDynamicTileOverlay
- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect;
- (BOOL)isGeometryFlipped;
- (CLLocationCoordinate2D)coordinate;
- (_MKDynamicTileOverlay)init;
- (int64_t)maximumZ;
- (int64_t)minimumZ;
- (unsigned)_providerID;
- (void)_cancelLoadingTileAtPath:(id *)a3;
- (void)dealloc;
- (void)loadTileAtPath:(id *)a3 result:(id)a4;
- (void)setMaximumZ:(int64_t)a3;
- (void)setMinimumZ:(int64_t)a3;
@end

@implementation _MKDynamicTileOverlay

- (_MKDynamicTileOverlay)init
{
  v5.receiver = self;
  v5.super_class = (Class)_MKDynamicTileOverlay;
  v2 = [(_MKDynamicTileOverlay *)&v5 init];
  if (v2)
  {
    v2->_providerID = +[_MKOverlayTileRequester registerDataSource:v2];
    *(_OWORD *)&v2->_minimumZ = xmmword_18BD1B900;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  +[_MKOverlayTileRequester unregisterDataSource:self->_providerID];
  v3.receiver = self;
  v3.super_class = (Class)_MKDynamicTileOverlay;
  [(_MKDynamicTileOverlay *)&v3 dealloc];
}

- (BOOL)isGeometryFlipped
{
  return 0;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  double v2 = 268435456.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 268435456.0;
  result.var1.var1 = v5;
  result.var1.var0 = v2;
  result.var0.var1 = v4;
  result.var0.var0 = v3;
  return result;
}

- (CLLocationCoordinate2D)coordinate
{
  CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(0.0, 0.0);
  double longitude = v4.longitude;
  double latitude = v4.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)loadTileAtPath:(id *)a3 result:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F28C58];
  v6 = MKErrorDomain;
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:1 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)_cancelLoadingTileAtPath:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var2;
  v4[0] = *(_OWORD *)&a3->var0;
  v4[1] = v3;
  [(_MKDynamicTileOverlay *)self cancelLoadingTileAtPath:v4];
}

- (unsigned)_providerID
{
  return self->_providerID;
}

- (int64_t)minimumZ
{
  return self->_minimumZ;
}

- (void)setMinimumZ:(int64_t)a3
{
  self->_minimumZ = a3;
}

- (int64_t)maximumZ
{
  return self->_maximumZ;
}

- (void)setMaximumZ:(int64_t)a3
{
  self->_maximumZ = a3;
}

@end