@interface _WKAuthenticatorAttestationResponse
- (NSArray)transports;
- (NSData)attestationObject;
- (_WKAuthenticatorAttestationResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensionOutputsCBOR:(id)a5 attestationObject:(id)a6 attachment:(int64_t)a7 transports:(id)a8;
- (_WKAuthenticatorAttestationResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensions:(void *)a5 attestationObject:(id)a6 attachment:(int64_t)a7 transports:(id)a8;
- (void)dealloc;
- (void)setTransports:(id)a3;
@end

@implementation _WKAuthenticatorAttestationResponse

- (_WKAuthenticatorAttestationResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensions:(void *)a5 attestationObject:(id)a6 attachment:(int64_t)a7 transports:(id)a8
{
  v12.receiver = self;
  v12.super_class = (Class)_WKAuthenticatorAttestationResponse;
  v10 = [(_WKAuthenticatorResponse *)&v12 initWithClientDataJSON:a3 rawId:a4 extensions:a5 attachment:a7];
  if (v10)
  {
    v10->_attestationObject = (NSData *)a6;
    v10->_transports = (NSArray *)[a8 copy];
  }
  return v10;
}

- (_WKAuthenticatorAttestationResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensionOutputsCBOR:(id)a5 attestationObject:(id)a6 attachment:(int64_t)a7 transports:(id)a8
{
  v12.receiver = self;
  v12.super_class = (Class)_WKAuthenticatorAttestationResponse;
  v10 = [(_WKAuthenticatorResponse *)&v12 initWithClientDataJSON:a3 rawId:a4 extensionOutputsCBOR:a5 attachment:a7];
  if (v10)
  {
    v10->_attestationObject = (NSData *)a6;
    v10->_transports = (NSArray *)[a8 copy];
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKAuthenticatorAttestationResponse;
  [(_WKAuthenticatorResponse *)&v3 dealloc];
}

- (NSData)attestationObject
{
  return self->_attestationObject;
}

- (NSArray)transports
{
  return self->_transports;
}

- (void)setTransports:(id)a3
{
}

@end