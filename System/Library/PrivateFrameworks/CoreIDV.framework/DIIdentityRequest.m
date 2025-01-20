@interface DIIdentityRequest
- (DIIdentityDocumentDescriptor)descriptor;
- (DIIdentityRequest)init;
- (NSData)nonce;
- (NSString)context;
- (NSString)merchantIdentifier;
- (NSString)merchantNameOverride;
- (NSURL)merchantPrivacyPolicyOverride;
- (id)description;
- (void)setDescriptor:(id)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setMerchantNameOverride:(id)a3;
- (void)setMerchantPrivacyPolicyOverride:(id)a3;
- (void)setNonce:(id)a3;
@end

@implementation DIIdentityRequest

- (DIIdentityRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)DIIdentityRequest;
  result = [(DIIdentityRequest *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (NSString)context
{
  return 0;
}

- (NSString)merchantNameOverride
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_merchantNameOverride;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMerchantNameOverride:(id)a3
{
  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_merchantNameOverride != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    merchantNameOverride = self->_merchantNameOverride;
    self->_merchantNameOverride = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (DIIdentityDocumentDescriptor)descriptor
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_descriptor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDescriptor:(id)a3
{
  v4 = (DIIdentityDocumentDescriptor *)a3;
  os_unfair_lock_lock(&self->_lock);
  descriptor = self->_descriptor;
  self->_descriptor = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)merchantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_merchantIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMerchantIdentifier:(id)a3
{
  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_merchantIdentifier != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    merchantIdentifier = self->_merchantIdentifier;
    self->_merchantIdentifier = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)nonce
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_nonce;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setNonce:(id)a3
{
  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_nonce != v6)
  {
    v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    nonce = self->_nonce;
    self->_nonce = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSURL)merchantPrivacyPolicyOverride
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_merchantPrivacyPolicyOverride;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMerchantPrivacyPolicyOverride:(id)a3
{
  v6 = (NSURL *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_merchantPrivacyPolicyOverride != v6)
  {
    v4 = (NSURL *)[(NSURL *)v6 copyWithZone:0];
    merchantPrivacyPolicyOverride = self->_merchantPrivacyPolicyOverride;
    self->_merchantPrivacyPolicyOverride = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [v3 appendFormat:@"descriptor: %@, ", self->_descriptor];
  [v3 appendFormat:@"nonce: %@, ", self->_nonce];
  [v3 appendFormat:@"merchantIdentifier: %@, ", self->_merchantIdentifier];
  [v3 appendFormat:@"merchantNameOverride: %@, ", self->_merchantNameOverride];
  v5 = [(NSURL *)self->_merchantPrivacyPolicyOverride absoluteString];
  [v3 appendFormat:@"merchantPrivacyPolicyOverride: %@, ", v5];

  os_unfair_lock_unlock(p_lock);
  [v3 appendFormat:@">"];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantPrivacyPolicyOverride, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_merchantNameOverride, 0);
}

@end