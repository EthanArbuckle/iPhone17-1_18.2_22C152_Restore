@interface _MKSpatialPlaceLookupTicket
- (GEOMapRegion)boundingRegion;
- (_MKSpatialPlaceLookupTicket)initWithTicket:(id)a3;
- (id)traits;
- (void)cancel;
- (void)submitWithHandler:(id)a3 queue:(id)a4;
@end

@implementation _MKSpatialPlaceLookupTicket

- (_MKSpatialPlaceLookupTicket)initWithTicket:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKSpatialPlaceLookupTicket;
  v6 = [(_MKSpatialPlaceLookupTicket *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_spatialPlaceLookupTicket, a3);
  }

  return v7;
}

- (id)traits
{
  return (id)[(GEOMapServiceSpatialPlaceLookupTicket *)self->_spatialPlaceLookupTicket traits];
}

- (GEOMapRegion)boundingRegion
{
  return self->_resultBoundingRegion;
}

- (void)cancel
{
}

- (void)submitWithHandler:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    spatialPlaceLookupTicket = self->_spatialPlaceLookupTicket;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55___MKSpatialPlaceLookupTicket_submitWithHandler_queue___block_invoke;
    v9[3] = &unk_1E54BB060;
    v9[4] = self;
    id v10 = v6;
    [(GEOMapServiceSpatialPlaceLookupTicket *)spatialPlaceLookupTicket submitWithHandler:v9 queue:a4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultBoundingRegion, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_spatialPlaceLookupTicket, 0);
}

@end