@interface DCPresentmentSessionOptions
+ (BOOL)supportsSecureCoding;
- (DCPresentmentSessionOptions)init;
- (DCPresentmentSessionOptions)initWithCoder:(id)a3;
- (DCPresentmentSessionOptions)initWithSessionEncryptionMode:(unint64_t)a3;
- (DCPresentmentSessionOptions)initWithSessionEncryptionMode:(unint64_t)a3 readerAuthenticationPolicy:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)elementFallbackModes;
- (unint64_t)messageEncodingFormat;
- (unint64_t)readerAuthenticationPolicy;
- (unint64_t)responseEncryptionMode;
- (unint64_t)sessionEncryptionMode;
- (void)encodeWithCoder:(id)a3;
- (void)setElementFallbackModes:(unint64_t)a3;
- (void)setMessageEncodingFormat:(unint64_t)a3;
- (void)setReaderAuthenticationPolicy:(unint64_t)a3;
- (void)setResponseEncryptionMode:(unint64_t)a3;
- (void)setSessionEncryptionMode:(unint64_t)a3;
@end

@implementation DCPresentmentSessionOptions

- (DCPresentmentSessionOptions)init
{
  return [(DCPresentmentSessionOptions *)self initWithSessionEncryptionMode:0 readerAuthenticationPolicy:0];
}

- (DCPresentmentSessionOptions)initWithSessionEncryptionMode:(unint64_t)a3
{
  return [(DCPresentmentSessionOptions *)self initWithSessionEncryptionMode:a3 readerAuthenticationPolicy:0];
}

- (DCPresentmentSessionOptions)initWithSessionEncryptionMode:(unint64_t)a3 readerAuthenticationPolicy:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DCPresentmentSessionOptions;
  result = [(DCPresentmentSessionOptions *)&v7 init];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_sessionEncryptionMode = a3;
    result->_responseEncryptionMode = 0;
    result->_elementFallbackModes = 0;
    result->_messageEncodingFormat = 0;
    result->_readerAuthenticationPolicy = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeInteger:self->_sessionEncryptionMode forKey:0x26C59B880];
  [v5 encodeInteger:self->_readerAuthenticationPolicy forKey:0x26C59B4C0];
  [v5 encodeInteger:self->_responseEncryptionMode forKey:0x26C59B8A0];
  [v5 encodeInteger:self->_elementFallbackModes forKey:0x26C59B8C0];
  [v5 encodeInteger:self->_messageEncodingFormat forKey:0x26C59B8E0];

  os_unfair_lock_unlock(p_lock);
}

- (DCPresentmentSessionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[DCPresentmentSessionOptions initWithSessionEncryptionMode:readerAuthenticationPolicy:](self, "initWithSessionEncryptionMode:readerAuthenticationPolicy:", [v4 decodeIntegerForKey:0x26C59B880], objc_msgSend(v4, "decodeIntegerForKey:", 0x26C59B4C0));
  if (v5)
  {
    v5->_responseEncryptionMode = [v4 decodeIntegerForKey:0x26C59B8A0];
    v5->_elementFallbackModes = [v4 decodeIntegerForKey:0x26C59B8C0];
    v5->_messageEncodingFormat = [v4 decodeIntegerForKey:0x26C59B8E0];
  }

  return v5;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = NSString;
  id v5 = DCPresentmentSessionEncryptionModeToString(self->_sessionEncryptionMode);
  v6 = DCPresentmentSessionResponseEncryptionModeToString(self->_responseEncryptionMode);
  objc_super v7 = DCCredentialReaderAuthenticationPolicyToString(self->_readerAuthenticationPolicy);
  v8 = DCPresentmentElementFallbackModeToString(self->_elementFallbackModes);
  v9 = DCPresentmentMessageEncodingFormatToString(self->_messageEncodingFormat);
  v10 = [v4 stringWithFormat:@"Session encryption mode = %@, Response encryption mode = %@, Reader authentication policy = %@, Element fallback mode = %@, Message encoding format = %@", v5, v6, v7, v8, v9];

  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (unint64_t)sessionEncryptionMode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t sessionEncryptionMode = self->_sessionEncryptionMode;
  os_unfair_lock_unlock(p_lock);
  return sessionEncryptionMode;
}

- (void)setSessionEncryptionMode:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t sessionEncryptionMode = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)responseEncryptionMode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t responseEncryptionMode = self->_responseEncryptionMode;
  os_unfair_lock_unlock(p_lock);
  return responseEncryptionMode;
}

- (void)setResponseEncryptionMode:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t responseEncryptionMode = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)readerAuthenticationPolicy
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t readerAuthenticationPolicy = self->_readerAuthenticationPolicy;
  os_unfair_lock_unlock(p_lock);
  return readerAuthenticationPolicy;
}

- (void)setReaderAuthenticationPolicy:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t readerAuthenticationPolicy = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)elementFallbackModes
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t elementFallbackModes = self->_elementFallbackModes;
  os_unfair_lock_unlock(p_lock);
  return elementFallbackModes;
}

- (void)setElementFallbackModes:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t elementFallbackModes = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)messageEncodingFormat
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t messageEncodingFormat = self->_messageEncodingFormat;
  os_unfair_lock_unlock(p_lock);
  return messageEncodingFormat;
}

- (void)setMessageEncodingFormat:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t messageEncodingFormat = a3;

  os_unfair_lock_unlock(p_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(DCPresentmentSessionOptions);
  os_unfair_lock_lock(&self->_lock);
  [(DCPresentmentSessionOptions *)v4 setSessionEncryptionMode:self->_sessionEncryptionMode];
  [(DCPresentmentSessionOptions *)v4 setResponseEncryptionMode:self->_responseEncryptionMode];
  [(DCPresentmentSessionOptions *)v4 setReaderAuthenticationPolicy:self->_readerAuthenticationPolicy];
  [(DCPresentmentSessionOptions *)v4 setElementFallbackModes:self->_elementFallbackModes];
  [(DCPresentmentSessionOptions *)v4 setMessageEncodingFormat:self->_messageEncodingFormat];
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

@end