@interface CSAttSiriRecognitionCompletionCachedInfo
- (CSAttSiriRecognitionCompletionCachedInfo)initWithRequestId:(id)a3 completionStatistics:(id)a4 endpointMode:(int64_t)a5 completionError:(id)a6;
- (NSDictionary)statistics;
- (NSError)completionError;
- (NSString)requestId;
- (id)description;
- (int64_t)endpointMode;
- (void)setCompletionError:(id)a3;
- (void)setEndpointMode:(int64_t)a3;
- (void)setRequestId:(id)a3;
- (void)setStatistics:(id)a3;
@end

@implementation CSAttSiriRecognitionCompletionCachedInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionError, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
}

- (void)setCompletionError:(id)a3
{
}

- (NSError)completionError
{
  return self->_completionError;
}

- (void)setEndpointMode:(int64_t)a3
{
  self->_endpointMode = a3;
}

- (int64_t)endpointMode
{
  return self->_endpointMode;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setStatistics:(id)a3
{
}

- (NSDictionary)statistics
{
  return self->_statistics;
}

- (id)description
{
  v3 = +[NSMutableString string];
  [v3 appendFormat:@"requestId : %@", self->_requestId];
  [v3 appendFormat:@"statistics : %@", self->_statistics];
  objc_msgSend(v3, "appendFormat:", @"endpointMode : %ld", self->_endpointMode);
  [v3 appendFormat:@"error:%@", self->_completionError];
  return v3;
}

- (CSAttSiriRecognitionCompletionCachedInfo)initWithRequestId:(id)a3 completionStatistics:(id)a4 endpointMode:(int64_t)a5 completionError:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CSAttSiriRecognitionCompletionCachedInfo;
  v14 = [(CSAttSiriRecognitionCompletionCachedInfo *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestId, a3);
    v16 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v12];
    statistics = v15->_statistics;
    v15->_statistics = v16;

    v15->_endpointMode = a5;
    objc_storeStrong((id *)&v15->_completionError, a6);
  }

  return v15;
}

@end