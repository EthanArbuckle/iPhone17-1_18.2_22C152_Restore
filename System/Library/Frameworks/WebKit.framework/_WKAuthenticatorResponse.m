@interface _WKAuthenticatorResponse
- (NSData)clientDataJSON;
- (NSData)extensionOutputsCBOR;
- (NSData)rawId;
- (_WKAuthenticationExtensionsClientOutputs)extensions;
- (_WKAuthenticatorResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensionOutputsCBOR:(id)a5 attachment:(int64_t)a6;
- (_WKAuthenticatorResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensions:(void *)a5 attachment:(int64_t)a6;
- (id).cxx_construct;
- (int64_t)attachment;
- (void)dealloc;
- (void)setExtensionOutputsCBOR:(id)a3;
@end

@implementation _WKAuthenticatorResponse

- (_WKAuthenticatorResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensions:(void *)a5 attachment:(int64_t)a6
{
  v14.receiver = self;
  v14.super_class = (Class)_WKAuthenticatorResponse;
  v10 = [(_WKAuthenticatorResponse *)&v14 init];
  if (v10)
  {
    v10->_clientDataJSON = (NSData *)a3;
    v10->_rawId = (NSData *)a4;
    v11 = *(void **)a5;
    *(void *)a5 = 0;
    m_ptr = v10->_extensions.m_ptr;
    v10->_extensions.m_ptr = v11;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v10->_attachment = a6;
  }
  return v10;
}

- (_WKAuthenticatorResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensionOutputsCBOR:(id)a5 attachment:(int64_t)a6
{
  v12.receiver = self;
  v12.super_class = (Class)_WKAuthenticatorResponse;
  v10 = [(_WKAuthenticatorResponse *)&v12 init];
  if (v10)
  {
    v10->_clientDataJSON = (NSData *)a3;
    v10->_rawId = (NSData *)a4;
    v10->_extensionOutputsCBOR = (NSData *)[a5 copy];
    v10->_attachment = a6;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKAuthenticatorResponse;
  [(_WKAuthenticatorResponse *)&v3 dealloc];
}

- (_WKAuthenticationExtensionsClientOutputs)extensions
{
  return (_WKAuthenticationExtensionsClientOutputs *)self->_extensions.m_ptr;
}

- (int64_t)attachment
{
  return self->_attachment;
}

- (NSData)clientDataJSON
{
  return self->_clientDataJSON;
}

- (NSData)rawId
{
  return self->_rawId;
}

- (NSData)extensionOutputsCBOR
{
  return self->_extensionOutputsCBOR;
}

- (void)setExtensionOutputsCBOR:(id)a3
{
}

- (void).cxx_destruct
{
  m_ptr = self->_extensions.m_ptr;
  self->_extensions.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end