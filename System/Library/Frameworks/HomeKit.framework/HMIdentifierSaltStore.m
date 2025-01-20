@interface HMIdentifierSaltStore
- (NSData)assistantIdentifierSalt;
- (NSData)identifierSalt;
- (void)setAssistantIdentifierSalt:(id)a3;
- (void)setIdentifierSalt:(id)a3;
@end

@implementation HMIdentifierSaltStore

- (NSData)identifierSalt
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_identifierSalt;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setIdentifierSalt:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if ([(NSData *)self->_identifierSalt isEqualToData:v5])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_identifierSalt, a3);
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x19F3A64A0]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated identifier salt to %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantIdentifierSalt, 0);

  objc_storeStrong((id *)&self->_identifierSalt, 0);
}

- (void)setAssistantIdentifierSalt:(id)a3
{
  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  assistantIdentifierSalt = self->_assistantIdentifierSalt;
  self->_assistantIdentifierSalt = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)assistantIdentifierSalt
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_assistantIdentifierSalt;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

@end