@interface SHMatcherResponse
+ (BOOL)supportsSecureCoding;
+ (id)errorResponseForSignature:(id)a3 error:(id)a4;
+ (id)matchWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 match:(id)a6;
+ (id)noMatchWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 signature:(id)a6;
- (BOOL)isStillRunningAssociatedRequest;
- (NSError)error;
- (NSUUID)runningAssociatedRequestID;
- (SHMatch)match;
- (SHMatcherResponse)initWithCoder:(id)a3;
- (SHMatcherResponse)initWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 match:(id)a6 signature:(id)a7 associatedRequestID:(id)a8 result:(int64_t)a9 error:(id)a10;
- (SHMatcherResponse)initWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 match:(id)a6 signature:(id)a7 runningAssociatedRequestID:(id)a8 error:(id)a9;
- (SHSignature)signature;
- (double)recordingIntermission;
- (double)recordingSignatureOffset;
- (double)retrySeconds;
- (int64_t)result;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHMatcherResponse

+ (id)errorResponseForSignature:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SHMatcherResponse alloc] initWithRecordingIntermission:0 recordingSignatureOffset:v6 retrySeconds:0 match:3 signature:v5 associatedRequestID:0.0 result:0.0 error:0.0];

  return v7;
}

+ (id)noMatchWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 signature:(id)a6
{
  id v9 = a6;
  v10 = [[SHMatcherResponse alloc] initWithRecordingIntermission:0 recordingSignatureOffset:v9 retrySeconds:0 match:2 signature:0 associatedRequestID:a3 result:a4 error:a5];

  return v10;
}

+ (id)matchWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 match:(id)a6
{
  id v9 = a6;
  v10 = [SHMatcherResponse alloc];
  v11 = [v9 querySignature];
  v12 = [(SHMatcherResponse *)v10 initWithRecordingIntermission:v9 recordingSignatureOffset:v11 retrySeconds:0 match:1 signature:0 associatedRequestID:a3 result:a4 error:a5];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHMatcherResponse)initWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 match:(id)a6 signature:(id)a7 runningAssociatedRequestID:(id)a8 error:(id)a9
{
  return -[SHMatcherResponse initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:](self, "initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:", a3, a4, a5);
}

- (SHMatcherResponse)initWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 match:(id)a6 signature:(id)a7 associatedRequestID:(id)a8 result:(int64_t)a9 error:(id)a10
{
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  v26.receiver = self;
  v26.super_class = (Class)SHMatcherResponse;
  v23 = [(SHMatcherResponse *)&v26 init];
  v24 = v23;
  if (v23)
  {
    v23->_recordingSignatureOffset = a4;
    v23->_recordingIntermission = a3;
    v23->_retrySeconds = a5;
    objc_storeStrong((id *)&v23->_match, a6);
    objc_storeStrong((id *)&v24->_signature, a7);
    objc_storeStrong((id *)&v24->_runningAssociatedRequestID, a8);
    v24->_result = a9;
    objc_storeStrong((id *)&v24->_error, a10);
    [(SHMatcherResponse *)v24 validate];
  }

  return v24;
}

- (BOOL)isStillRunningAssociatedRequest
{
  v2 = [(SHMatcherResponse *)self runningAssociatedRequestID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SHSignature)signature
{
  signature = self->_signature;
  if (signature)
  {
    BOOL v3 = signature;
  }
  else
  {
    BOOL v3 = [(SHMatch *)self->_match querySignature];
  }

  return v3;
}

- (SHMatcherResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"recordingIntermission"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"recordingSignatureOffset"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"retrySeconds"];
  double v10 = v9;
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"match"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedRequestID"];
  uint64_t v15 = [v4 decodeIntegerForKey:@"resultType"];

  v16 = [(SHMatcherResponse *)self initWithRecordingIntermission:v11 recordingSignatureOffset:v12 retrySeconds:v14 match:v15 signature:v13 associatedRequestID:v6 result:v8 error:v10];
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  match = self->_match;
  id v6 = a3;
  [v6 encodeObject:match forKey:@"match"];
  [v6 encodeObject:self->_signature forKey:@"signature"];
  double v5 = +[SHError normalizedError:self->_error];
  [v6 encodeObject:v5 forKey:@"error"];

  [v6 encodeDouble:@"recordingIntermission" forKey:self->_recordingIntermission];
  [v6 encodeDouble:@"recordingSignatureOffset" forKey:self->_recordingSignatureOffset];
  [v6 encodeDouble:@"retrySeconds" forKey:self->_retrySeconds];
  [v6 encodeObject:self->_runningAssociatedRequestID forKey:@"associatedRequestID"];
  [v6 encodeInteger:self->_result forKey:@"resultType"];
}

- (double)recordingSignatureOffset
{
  return self->_recordingSignatureOffset;
}

- (double)recordingIntermission
{
  return self->_recordingIntermission;
}

- (double)retrySeconds
{
  return self->_retrySeconds;
}

- (SHMatch)match
{
  return self->_match;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)result
{
  return self->_result;
}

- (NSUUID)runningAssociatedRequestID
{
  return self->_runningAssociatedRequestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningAssociatedRequestID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_match, 0);

  objc_storeStrong((id *)&self->_signature, 0);
}

@end