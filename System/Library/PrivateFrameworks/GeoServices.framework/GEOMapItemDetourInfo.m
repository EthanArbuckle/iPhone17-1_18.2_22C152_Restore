@interface GEOMapItemDetourInfo
- (GEOMapItemDetourInfo)init;
- (GEOMapItemDetourInfo)initWithResultDetourInfo:(id)a3;
- (GEOPDResultDetourInfo)_detourInfo;
- (GEOPDResultDetourInfo)pdDetourInfo;
- (NSData)detourInfoAsData;
- (double)detourDistance;
- (double)detourTime;
- (double)distanceToPlace;
- (double)timeToPlace;
@end

@implementation GEOMapItemDetourInfo

- (GEOMapItemDetourInfo)init
{
  result = (GEOMapItemDetourInfo *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOMapItemDetourInfo)initWithResultDetourInfo:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapItemDetourInfo;
  v6 = [(GEOMapItemDetourInfo *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_detourInfo, a3);
    v8 = v7;
  }

  return v7;
}

- (double)detourTime
{
  return (double)[(GEOPDResultDetourInfo *)self->_detourInfo detourTime];
}

- (double)timeToPlace
{
  return (double)[(GEOPDResultDetourInfo *)self->_detourInfo timeToPlace];
}

- (double)detourDistance
{
  return (double)[(GEOPDResultDetourInfo *)self->_detourInfo detourDistance];
}

- (double)distanceToPlace
{
  return (double)[(GEOPDResultDetourInfo *)self->_detourInfo distanceToPlace];
}

- (NSData)detourInfoAsData
{
  return (NSData *)[(GEOPDResultDetourInfo *)self->_detourInfo data];
}

- (GEOPDResultDetourInfo)pdDetourInfo
{
  return self->_detourInfo;
}

- (GEOPDResultDetourInfo)_detourInfo
{
  return self->_detourInfo;
}

- (void).cxx_destruct
{
}

@end