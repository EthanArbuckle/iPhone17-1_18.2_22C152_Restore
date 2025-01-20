@interface GEOReferenceTimeData
+ (BOOL)supportsSecureCoding;
- (GEOReferenceTimeData)initWithCoder:(id)a3;
- (GEOReferenceTimeData)initWithRefTime:(double)a3 refError:(double)a4 kernTime:(double)a5 bootTime:(timeval)a6;
- (double)currentReferenceTime;
- (double)kernTime;
- (double)refError;
- (double)refTime;
- (id)description;
- (timeval)kernBootTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOReferenceTimeData

- (double)currentReferenceTime
{
  [(GEOReferenceTimeData *)self refTime];
  double v4 = v3;
  geoTMGetKernelMonotonicClock();
  double v6 = v4 + v5;
  [(GEOReferenceTimeData *)self kernTime];
  return v6 - v7;
}

- (double)refTime
{
  return self->_refTime;
}

- (double)kernTime
{
  return self->_kernTime;
}

- (timeval)kernBootTime
{
  uint64_t v2 = *(void *)&self->_kernBoottime.tv_usec;
  __darwin_time_t tv_sec = self->_kernBoottime.tv_sec;
  result.tv_usec = v2;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOReferenceTimeData)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOReferenceTimeData;
  double v5 = [(GEOReferenceTimeData *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"t"];
    v5->_refTime = v6;
    [v4 decodeDoubleForKey:@"e"];
    v5->_refError = v7;
    [v4 decodeDoubleForKey:@"k"];
    v5->_kernTime = v8;
    v5->_kernBoottime.__darwin_time_t tv_sec = [v4 decodeInt64ForKey:@"bs"];
    v5->_kernBoottime.tv_usec = [v4 decodeInt32ForKey:@"bu"];
  }

  return v5;
}

- (GEOReferenceTimeData)initWithRefTime:(double)a3 refError:(double)a4 kernTime:(double)a5 bootTime:(timeval)a6
{
  uint64_t v6 = *(void *)&a6.tv_usec;
  __darwin_time_t tv_sec = a6.tv_sec;
  v12.receiver = self;
  v12.super_class = (Class)GEOReferenceTimeData;
  timeval result = [(GEOReferenceTimeData *)&v12 init];
  if (result)
  {
    result->_refTime = a3;
    result->_refError = a4;
    result->_kernTime = a5;
    result->_kernBoottime.__darwin_time_t tv_sec = tv_sec;
    *(void *)&result->_kernBoottime.tv_usec = v6;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  double refTime = self->_refTime;
  id v5 = a3;
  [v5 encodeDouble:@"t" forKey:refTime];
  [v5 encodeDouble:@"e" forKey:self->_refError];
  [v5 encodeDouble:@"k" forKey:self->_kernTime];
  [v5 encodeInt64:self->_kernBoottime.tv_sec forKey:@"bs"];
  [v5 encodeInt32:self->_kernBoottime.tv_usec forKey:@"bu"];
}

- (id)description
{
  double v3 = objc_msgSend(NSString, "stringWithFormat:", @"<GEOReferenceTimeData(%p) :\n", self);
  id v4 = [v3 stringByAppendingFormat:@"refTime = %f, kernTime = %f, kernBootTime = %ld.%d>", *(void *)&self->_refTime, *(void *)&self->_kernTime, self->_kernBoottime.tv_sec, self->_kernBoottime.tv_usec];

  return v4;
}

- (double)refError
{
  return self->_refError;
}

@end