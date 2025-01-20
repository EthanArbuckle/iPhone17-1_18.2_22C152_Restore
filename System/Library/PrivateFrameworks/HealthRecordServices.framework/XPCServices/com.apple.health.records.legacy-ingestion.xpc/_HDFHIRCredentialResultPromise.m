@interface _HDFHIRCredentialResultPromise
- (HDFHIRCredentialResult)result;
- (_HDFHIRCredentialResultPromise)init;
- (void)fulfillWithResult:(id)a3;
@end

@implementation _HDFHIRCredentialResultPromise

- (_HDFHIRCredentialResultPromise)init
{
  v3.receiver = self;
  v3.super_class = (Class)_HDFHIRCredentialResultPromise;
  result = [(_HDFHIRCredentialResultPromise *)&v3 init];
  if (result) {
    result->_resultLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (HDFHIRCredentialResult)result
{
  p_resultLock = &self->_resultLock;
  os_unfair_lock_lock(&self->_resultLock);
  v5 = self->_result;
  if (!v5)
  {
    v7 = +[NSAssertionHandler currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"HDFHIRCredentialVendor.m", 345, @"%@ accessed before fulfillment of %@", v8, objc_opt_class() object file lineNumber description];
  }
  os_unfair_lock_unlock(p_resultLock);

  return v5;
}

- (void)fulfillWithResult:(id)a3
{
  v5 = (HDFHIRCredentialResult *)a3;
  os_unfair_lock_lock(&self->_resultLock);
  if (self->_result)
  {
    v7 = +[NSAssertionHandler currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"HDFHIRCredentialVendor.m", 352, @"%@ called on fulfilled %@", v8, objc_opt_class() object file lineNumber description];
  }
  result = self->_result;
  self->_result = v5;

  os_unfair_lock_unlock(&self->_resultLock);
}

- (void).cxx_destruct
{
}

@end