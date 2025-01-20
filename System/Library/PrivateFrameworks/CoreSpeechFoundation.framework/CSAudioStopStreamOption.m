@interface CSAudioStopStreamOption
- (BOOL)supportsMagus;
- (CSAudioStopStreamOption)initWithStopRecordingReason:(unint64_t)a3 expectedStopHostTime:(unint64_t)a4 trailingSilenceDurationAtEndpoint:(double)a5;
- (CSAudioStopStreamOption)initWithStopRecordingReason:(unint64_t)a3 expectedStopHostTime:(unint64_t)a4 trailingSilenceDurationAtEndpoint:(double)a5 holdRequest:(id)a6 supportsMagus:(BOOL)a7;
- (CSAudioStopStreamOption)initWithStopRecordingReason:(unint64_t)a3 expectedStopHostTime:(unint64_t)a4 trailingSilenceDurationAtEndpoint:(double)a5 holdRequest:(id)a6 supportsMagus:(BOOL)a7 requestId:(id)a8;
- (CSAudioStopStreamOption)initWithXPCObject:(id)a3;
- (CSAudioStreamHoldRequestOption)holdRequest;
- (NSString)requestId;
- (double)trailingSilenceDurationAtEndpoint;
- (id)description;
- (id)xpcObject;
- (unint64_t)expectedStopHostTime;
- (unint64_t)stopRecordingReason;
- (void)setRequestId:(id)a3;
@end

@implementation CSAudioStopStreamOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_holdRequest, 0);
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (CSAudioStreamHoldRequestOption)holdRequest
{
  return self->_holdRequest;
}

- (double)trailingSilenceDurationAtEndpoint
{
  return self->_trailingSilenceDurationAtEndpoint;
}

- (unint64_t)expectedStopHostTime
{
  return self->_expectedStopHostTime;
}

- (BOOL)supportsMagus
{
  return self->_supportsMagus;
}

- (unint64_t)stopRecordingReason
{
  return self->_stopRecordingReason;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"{"];
  v4 = v3;
  unint64_t stopRecordingReason = self->_stopRecordingReason;
  if (stopRecordingReason <= 7) {
    [v3 appendString:off_1E6200BF8[stopRecordingReason]];
  }
  [v4 appendFormat:@", %llu", self->_expectedStopHostTime];
  [v4 appendFormat:@", %f", *(void *)&self->_trailingSilenceDurationAtEndpoint];
  [v4 appendFormat:@", %d", self->_supportsMagus];
  holdRequest = self->_holdRequest;
  if (holdRequest)
  {
    v7 = [(CSAudioStreamHoldRequestOption *)holdRequest description];
    [v4 appendFormat:@", %@", v7];
  }
  [v4 appendFormat:@"}"];
  return v4;
}

- (id)xpcObject
{
  keys[4] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "stopRecordingReason";
  keys[1] = "expectedStopHostTime";
  keys[2] = "trailingSilenceDurationAtEndpoint";
  keys[3] = "supportsMagus";
  values[0] = xpc_uint64_create(self->_stopRecordingReason);
  values[1] = xpc_uint64_create(self->_expectedStopHostTime);
  values[2] = xpc_double_create(self->_trailingSilenceDurationAtEndpoint);
  values[3] = xpc_BOOL_create(self->_supportsMagus);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  holdRequest = self->_holdRequest;
  if (holdRequest)
  {
    v5 = [(CSAudioStreamHoldRequestOption *)holdRequest xpcObject];
    xpc_dictionary_set_value(v3, "holdRequest", v5);
  }
  requestId = self->_requestId;
  if (requestId)
  {
    xpc_object_t v7 = xpc_string_create([(NSString *)requestId UTF8String]);
    xpc_dictionary_set_value(v3, "requestId", v7);
  }
  for (uint64_t i = 3; i != -1; --i)

  return v3;
}

- (CSAudioStopStreamOption)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSAudioStopStreamOption;
  v5 = [(CSAudioStopStreamOption *)&v15 init];
  if (v5)
  {
    v5->_unint64_t stopRecordingReason = xpc_dictionary_get_uint64(v4, "stopRecordingReason");
    v5->_expectedStopHostTime = xpc_dictionary_get_uint64(v4, "expectedStopHostTime");
    v5->_trailingSilenceDurationAtEndpoint = xpc_dictionary_get_double(v4, "trailingSilenceDurationAtEndpoint");
    v5->_supportsMagus = xpc_dictionary_get_BOOL(v4, "supportsMagus");
    string = xpc_dictionary_get_string(v4, "requestId");
    if (string)
    {
      uint64_t v7 = [NSString stringWithUTF8String:string];
      requestId = v5->_requestId;
      v5->_requestId = (NSString *)v7;
    }
    else
    {
      requestId = v5->_requestId;
      v5->_requestId = 0;
    }

    v9 = xpc_dictionary_get_dictionary(v4, "holdRequest");

    if (v9)
    {
      v10 = [CSAudioStreamHoldRequestOption alloc];
      v11 = xpc_dictionary_get_dictionary(v4, "holdRequest");
      uint64_t v12 = [(CSAudioStreamHoldRequestOption *)v10 initWithXPCObject:v11];
      holdRequest = v5->_holdRequest;
      v5->_holdRequest = (CSAudioStreamHoldRequestOption *)v12;
    }
  }

  return v5;
}

- (CSAudioStopStreamOption)initWithStopRecordingReason:(unint64_t)a3 expectedStopHostTime:(unint64_t)a4 trailingSilenceDurationAtEndpoint:(double)a5
{
  return [(CSAudioStopStreamOption *)self initWithStopRecordingReason:a3 expectedStopHostTime:a4 trailingSilenceDurationAtEndpoint:0 holdRequest:0 supportsMagus:a5];
}

- (CSAudioStopStreamOption)initWithStopRecordingReason:(unint64_t)a3 expectedStopHostTime:(unint64_t)a4 trailingSilenceDurationAtEndpoint:(double)a5 holdRequest:(id)a6 supportsMagus:(BOOL)a7
{
  return [(CSAudioStopStreamOption *)self initWithStopRecordingReason:a3 expectedStopHostTime:a4 trailingSilenceDurationAtEndpoint:a6 holdRequest:a7 supportsMagus:0 requestId:a5];
}

- (CSAudioStopStreamOption)initWithStopRecordingReason:(unint64_t)a3 expectedStopHostTime:(unint64_t)a4 trailingSilenceDurationAtEndpoint:(double)a5 holdRequest:(id)a6 supportsMagus:(BOOL)a7 requestId:(id)a8
{
  id v15 = a6;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)CSAudioStopStreamOption;
  v17 = [(CSAudioStopStreamOption *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_unint64_t stopRecordingReason = a3;
    v17->_expectedStopHostTime = a4;
    v17->_trailingSilenceDurationAtEndpoint = a5;
    objc_storeStrong((id *)&v17->_holdRequest, a6);
    v18->_supportsMagus = a7;
    objc_storeStrong((id *)&v18->_requestId, a8);
  }

  return v18;
}

@end