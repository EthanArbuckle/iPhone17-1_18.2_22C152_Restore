@interface CMContinuityCaptureTransportDeviceRapportStream
- (BOOL)isMediaStream;
- (CMContinuityCaptureTransportDeviceRapportStream)initWithRapportStream:(id)a3;
- (NSString)description;
- (NSString)streamIdentifier;
- (NSUUID)streamUUID;
- (RPStreamSession)stream;
- (id)cipherKeyforSessionID:(id)a3;
- (int64_t)entity;
- (void)sendMessage:(id)a3 message:(id)a4 completion:(id)a5;
@end

@implementation CMContinuityCaptureTransportDeviceRapportStream

- (CMContinuityCaptureTransportDeviceRapportStream)initWithRapportStream:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMContinuityCaptureTransportDeviceRapportStream;
  v6 = [(CMContinuityCaptureTransportDeviceRapportStream *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stream, a3);
    v8 = [v5 streamID];
    v7->_entity = CMContinuityCaptureEntityTypeFromMediaIdentifer(v8);

    v9 = v7;
  }

  return v7;
}

- (NSString)streamIdentifier
{
  return (NSString *)[(RPStreamSession *)self->_stream streamID];
}

- (RPStreamSession)stream
{
  return self->_stream;
}

- (int64_t)entity
{
  return self->_entity;
}

- (NSUUID)streamUUID
{
  return (NSUUID *)[(RPStreamSession *)self->_stream nwClientID];
}

- (id)cipherKeyforSessionID:(id)a3
{
  stream = self->_stream;
  id v4 = a3;
  id v5 = [(RPStreamSession *)stream streamKey];
  v6 = CMContinuityCaptureCreateCipherKey(v5, v4);

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(CMContinuityCaptureTransportDeviceRapportStream *)self streamIdentifier];
  v7 = [v3 stringWithFormat:@"%@: %@ entity:%u [%p]", v5, v6, self->_entity, self];

  return (NSString *)v7;
}

- (BOOL)isMediaStream
{
  return (unint64_t)(self->_entity - 1) < 3;
}

- (void)sendMessage:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CMContinuityCaptureTransportDeviceRapportStream *)self isMediaStream])
  {
    objc_super v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureTransportDeviceRapportStream sendMessage:message:completion:]();
    }
  }
  else
  {
    [(RPStreamSession *)self->_stream sendEventID:@"ContinuityCaptureStreamEventID" event:v9 options:0 completion:v10];
  }
}

- (void).cxx_destruct
{
}

- (void)sendMessage:message:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ Unsupported operation for %{public}@");
}

@end