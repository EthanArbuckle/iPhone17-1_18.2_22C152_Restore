@interface IDSNGMKeyLoadingErrorContainer
- (BOOL)hasRegisteredContainer;
- (BOOL)hasUnregisteredContainer;
- (NSError)generationError;
- (NSError)identityToRegisterError;
- (NSError)registeredDeserializationError;
- (NSError)registeredKeychainError;
- (NSError)rollingError;
- (NSError)unregisteredDeserializationError;
- (NSError)unregisteredKeychainError;
- (NSNumber)shouldHaveRegisteredIdentity;
- (NSNumber)shouldHaveUnregisteredIdentity;
- (void)setGenerationError:(id)a3;
- (void)setHasRegisteredContainer:(BOOL)a3;
- (void)setHasUnregisteredContainer:(BOOL)a3;
- (void)setIdentityToRegisterError:(id)a3;
- (void)setRegisteredDeserializationError:(id)a3;
- (void)setRegisteredKeychainError:(id)a3;
- (void)setRollingError:(id)a3;
- (void)setShouldHaveRegisteredIdentity:(id)a3;
- (void)setShouldHaveUnregisteredIdentity:(id)a3;
- (void)setUnregisteredDeserializationError:(id)a3;
- (void)setUnregisteredKeychainError:(id)a3;
@end

@implementation IDSNGMKeyLoadingErrorContainer

- (NSError)registeredKeychainError
{
  return self->_registeredKeychainError;
}

- (void)setRegisteredKeychainError:(id)a3
{
}

- (NSError)unregisteredKeychainError
{
  return self->_unregisteredKeychainError;
}

- (void)setUnregisteredKeychainError:(id)a3
{
}

- (NSError)registeredDeserializationError
{
  return self->_registeredDeserializationError;
}

- (void)setRegisteredDeserializationError:(id)a3
{
}

- (NSError)unregisteredDeserializationError
{
  return self->_unregisteredDeserializationError;
}

- (void)setUnregisteredDeserializationError:(id)a3
{
}

- (NSError)generationError
{
  return self->_generationError;
}

- (void)setGenerationError:(id)a3
{
}

- (NSError)rollingError
{
  return self->_rollingError;
}

- (void)setRollingError:(id)a3
{
}

- (NSError)identityToRegisterError
{
  return self->_identityToRegisterError;
}

- (void)setIdentityToRegisterError:(id)a3
{
}

- (NSNumber)shouldHaveRegisteredIdentity
{
  return self->_shouldHaveRegisteredIdentity;
}

- (void)setShouldHaveRegisteredIdentity:(id)a3
{
}

- (NSNumber)shouldHaveUnregisteredIdentity
{
  return self->_shouldHaveUnregisteredIdentity;
}

- (void)setShouldHaveUnregisteredIdentity:(id)a3
{
}

- (BOOL)hasRegisteredContainer
{
  return self->_hasRegisteredContainer;
}

- (void)setHasRegisteredContainer:(BOOL)a3
{
  self->_hasRegisteredContainer = a3;
}

- (BOOL)hasUnregisteredContainer
{
  return self->_hasUnregisteredContainer;
}

- (void)setHasUnregisteredContainer:(BOOL)a3
{
  self->_hasUnregisteredContainer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shouldHaveUnregisteredIdentity, 0);
  objc_storeStrong((id *)&self->_shouldHaveRegisteredIdentity, 0);
  objc_storeStrong((id *)&self->_identityToRegisterError, 0);
  objc_storeStrong((id *)&self->_rollingError, 0);
  objc_storeStrong((id *)&self->_generationError, 0);
  objc_storeStrong((id *)&self->_unregisteredDeserializationError, 0);
  objc_storeStrong((id *)&self->_registeredDeserializationError, 0);
  objc_storeStrong((id *)&self->_unregisteredKeychainError, 0);

  objc_storeStrong((id *)&self->_registeredKeychainError, 0);
}

@end