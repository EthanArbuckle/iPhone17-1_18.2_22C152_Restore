@interface AMDFetchAppSegmentsResponse
- (AMDFetchAppSegmentsResponse)initWithSegmentInfo:(id)a3 ofType:(id)a4 andMetaData:(id)a5;
- (NSArray)segmentInfo;
- (NSDictionary)metadata;
- (NSNumber)segmentInfoType;
- (id)getMetadata;
- (id)getSegmentInfo;
- (id)getSegmentInfoType;
- (void)setMetadata:(id)a3;
- (void)setSegmentInfo:(id)a3;
- (void)setSegmentInfoType:(id)a3;
@end

@implementation AMDFetchAppSegmentsResponse

- (id)getMetadata
{
  return self->_metadata;
}

- (id)getSegmentInfo
{
  return self->_segmentInfo;
}

- (id)getSegmentInfoType
{
  return self->_segmentInfoType;
}

- (AMDFetchAppSegmentsResponse)initWithSegmentInfo:(id)a3 ofType:(id)a4 andMetaData:(id)a5
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  v5 = v14;
  v14 = 0;
  v10.receiver = v5;
  v10.super_class = (Class)AMDFetchAppSegmentsResponse;
  v14 = [(AMDFetchAppSegmentsResponse *)&v10 init];
  objc_storeStrong((id *)&v14, v14);
  [(AMDFetchAppSegmentsResponse *)v14 setSegmentInfo:location[0]];
  [(AMDFetchAppSegmentsResponse *)v14 setSegmentInfoType:v12];
  [(AMDFetchAppSegmentsResponse *)v14 setMetadata:v11];
  v9 = v14;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v9;
}

- (NSArray)segmentInfo
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSegmentInfo:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadata:(id)a3
{
}

- (NSNumber)segmentInfoType
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSegmentInfoType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end