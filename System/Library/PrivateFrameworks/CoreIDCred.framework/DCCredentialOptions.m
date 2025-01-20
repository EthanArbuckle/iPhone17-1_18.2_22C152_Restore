@interface DCCredentialOptions
+ (BOOL)supportsSecureCoding;
- (DCCredentialOptions)init;
- (DCCredentialOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)deleteInactiveKeysAfterDays;
- (int64_t)deleteIncompleteCredentialAfterDays;
- (unint64_t)payloadProtectionPolicy;
- (unint64_t)presentmentAuthPolicy;
- (unint64_t)readerAuthenticationPolicy;
- (void)encodeWithCoder:(id)a3;
- (void)setDeleteInactiveKeysAfterDays:(int64_t)a3;
- (void)setDeleteIncompleteCredentialAfterDays:(int64_t)a3;
- (void)setPayloadProtectionPolicy:(unint64_t)a3;
- (void)setPresentmentAuthPolicy:(unint64_t)a3;
- (void)setReaderAuthenticationPolicy:(unint64_t)a3;
@end

@implementation DCCredentialOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeInteger:self->_deleteInactiveKeysAfterDays forKey:0x26C59B480];
  [v5 encodeInteger:self->_deleteIncompleteCredentialAfterDays forKey:0x26C59B4A0];
  [v5 encodeInteger:self->_readerAuthenticationPolicy forKey:0x26C59B4C0];
  [v5 encodeInteger:self->_presentmentAuthPolicy forKey:0x26C59B4E0];
  [v5 encodeInteger:self->_payloadProtectionPolicy forKey:0x26C59B500];

  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DCCredentialOptions *)self init];
  if (v5)
  {
    v5->_deleteInactiveKeysAfterDays = [v4 decodeIntegerForKey:0x26C59B480];
    v5->_deleteIncompleteCredentialAfterDays = [v4 decodeIntegerForKey:0x26C59B4A0];
    v5->_readerAuthenticationPolicy = [v4 decodeIntegerForKey:0x26C59B4C0];
    v5->_presentmentAuthPolicy = [v4 decodeIntegerForKey:0x26C59B4E0];
    v5->_payloadProtectionPolicy = [v4 decodeIntegerForKey:0x26C59B500];
  }

  return v5;
}

- (DCCredentialOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)DCCredentialOptions;
  result = [(DCCredentialOptions *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"DCCredentialOptions deleteInactiveKeysAfterDays=%ld deleteIncompleteCredentialAfterDays=%ld readerAuthenticationPolicy=%ld presentmentAuthPolicy=%ld payloadProtectionPolicy=%ld", self->_deleteInactiveKeysAfterDays, self->_deleteIncompleteCredentialAfterDays, self->_readerAuthenticationPolicy, self->_presentmentAuthPolicy, self->_payloadProtectionPolicy);
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (int64_t)deleteInactiveKeysAfterDays
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t deleteInactiveKeysAfterDays = self->_deleteInactiveKeysAfterDays;
  os_unfair_lock_unlock(p_lock);
  return deleteInactiveKeysAfterDays;
}

- (void)setDeleteInactiveKeysAfterDays:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_int64_t deleteInactiveKeysAfterDays = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)deleteIncompleteCredentialAfterDays
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t deleteIncompleteCredentialAfterDays = self->_deleteIncompleteCredentialAfterDays;
  os_unfair_lock_unlock(p_lock);
  return deleteIncompleteCredentialAfterDays;
}

- (void)setDeleteIncompleteCredentialAfterDays:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_int64_t deleteIncompleteCredentialAfterDays = a3;

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

- (unint64_t)presentmentAuthPolicy
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t presentmentAuthPolicy = self->_presentmentAuthPolicy;
  os_unfair_lock_unlock(p_lock);
  return presentmentAuthPolicy;
}

- (void)setPresentmentAuthPolicy:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t presentmentAuthPolicy = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)payloadProtectionPolicy
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t payloadProtectionPolicy = self->_payloadProtectionPolicy;
  os_unfair_lock_unlock(p_lock);
  return payloadProtectionPolicy;
}

- (void)setPayloadProtectionPolicy:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t payloadProtectionPolicy = a3;

  os_unfair_lock_unlock(p_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_lock);
  [v4 setDeleteInactiveKeysAfterDays:self->_deleteInactiveKeysAfterDays];
  [v4 setDeleteIncompleteCredentialAfterDays:self->_deleteIncompleteCredentialAfterDays];
  [v4 setReaderAuthenticationPolicy:self->_readerAuthenticationPolicy];
  [v4 setPresentmentAuthPolicy:self->_presentmentAuthPolicy];
  [v4 setPayloadProtectionPolicy:self->_payloadProtectionPolicy];
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

@end