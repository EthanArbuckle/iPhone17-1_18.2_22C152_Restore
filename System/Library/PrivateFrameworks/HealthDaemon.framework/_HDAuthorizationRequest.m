@interface _HDAuthorizationRequest
- (id)description;
- (void)invokeCompletionHandlerWithSuccess:(void *)a3 error:;
@end

@implementation _HDAuthorizationRequest

- (void)invokeCompletionHandlerWithSuccess:(void *)a3 error:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    if (v6)
    {
      id v7 = v5;
      (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, *(void *)(a1 + 16), a2);
      id v5 = v7;
    }
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(NSUUID *)self->_identifier UUIDString];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p id:\"%@\">", v4, self, v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typesToRead, 0);
  objc_storeStrong((id *)&self->_typesToWrite, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end