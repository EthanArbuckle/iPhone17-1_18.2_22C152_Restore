@interface CSAttSiriCachedEndpointInfo
- (CSEndpointerMetrics)endpointerMetrics;
- (NSString)trpID;
- (double)endpointTime;
- (void)setEndpointTime:(double)a3;
- (void)setEndpointerMetrics:(id)a3;
- (void)setTrpID:(id)a3;
@end

@implementation CSAttSiriCachedEndpointInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trpID, 0);
  objc_storeStrong((id *)&self->_endpointerMetrics, 0);
}

- (void)setTrpID:(id)a3
{
}

- (NSString)trpID
{
  return self->_trpID;
}

- (void)setEndpointerMetrics:(id)a3
{
}

- (CSEndpointerMetrics)endpointerMetrics
{
  return self->_endpointerMetrics;
}

- (void)setEndpointTime:(double)a3
{
  self->_endpointTime = a3;
}

- (double)endpointTime
{
  return self->_endpointTime;
}

@end