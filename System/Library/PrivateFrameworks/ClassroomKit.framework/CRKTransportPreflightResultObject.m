@interface CRKTransportPreflightResultObject
- (BOOL)shouldResetBackoff;
- (CATTransport)transport;
- (CRKTransportPreflightResultObject)initWithTransport:(id)a3 shouldResetBackoff:(BOOL)a4;
- (id)takeTransport;
- (void)dealloc;
- (void)setTransport:(id)a3;
@end

@implementation CRKTransportPreflightResultObject

- (void)dealloc
{
  if (self->_transport)
  {
    if (_CRKLogGeneral_onceToken_25 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_25, &__block_literal_global_78);
    }
    v3 = _CRKLogGeneral_logObj_25;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating transport that was not taken", buf, 2u);
    }
    +[CRKTransportInvalidator invalidateTransport:self->_transport];
  }
  v4.receiver = self;
  v4.super_class = (Class)CRKTransportPreflightResultObject;
  [(CRKTransportPreflightResultObject *)&v4 dealloc];
}

- (CRKTransportPreflightResultObject)initWithTransport:(id)a3 shouldResetBackoff:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKTransportPreflightResultObject;
  v8 = [(CRKTransportPreflightResultObject *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transport, a3);
    v9->_shouldResetBackoff = a4;
  }

  return v9;
}

- (id)takeTransport
{
  v3 = [(CRKTransportPreflightResultObject *)self transport];
  [(CRKTransportPreflightResultObject *)self setTransport:0];

  return v3;
}

- (BOOL)shouldResetBackoff
{
  return self->_shouldResetBackoff;
}

- (CATTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end