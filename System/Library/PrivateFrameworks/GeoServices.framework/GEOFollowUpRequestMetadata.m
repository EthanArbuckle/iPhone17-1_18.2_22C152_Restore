@interface GEOFollowUpRequestMetadata
- (BOOL)isSearchRequestForNearbyPlaces;
- (GEOFollowUpRequestMetadata)initWithGEOPDFollowUpRequestMetadata:(id)a3;
- (int)_dataTypeFrom:(int)a3;
- (int)_requestTypeFrom:(int)a3;
- (int)dataType;
- (int)requestType;
@end

@implementation GEOFollowUpRequestMetadata

- (GEOFollowUpRequestMetadata)initWithGEOPDFollowUpRequestMetadata:(id)a3
{
  v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)GEOFollowUpRequestMetadata;
    v5 = [(GEOFollowUpRequestMetadata *)&v11 init];
    v6 = v5;
    if (v5)
    {
      if ((v4[24] & 2) != 0) {
        uint64_t v7 = *((unsigned int *)v4 + 5);
      }
      else {
        uint64_t v7 = 0;
      }
      v5->_requestType = [(GEOFollowUpRequestMetadata *)v5 _requestTypeFrom:v7];
      if (v4[24]) {
        uint64_t v9 = *((unsigned int *)v4 + 4);
      }
      else {
        uint64_t v9 = 0;
      }
      v6->_dataType = [(GEOFollowUpRequestMetadata *)v6 _dataTypeFrom:v9];
    }
    self = v6;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int)_requestTypeFrom:(int)a3
{
  return a3 == 1;
}

- (int)_dataTypeFrom:(int)a3
{
  return a3 == 1;
}

- (BOOL)isSearchRequestForNearbyPlaces
{
  return [(GEOFollowUpRequestMetadata *)self requestType] == 1
      && [(GEOFollowUpRequestMetadata *)self dataType] == 1;
}

- (int)requestType
{
  return self->_requestType;
}

- (int)dataType
{
  return self->_dataType;
}

@end