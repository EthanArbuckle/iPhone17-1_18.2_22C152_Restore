@interface _AFAssertionImpl
- (AFAssertionContext)context;
- (NSString)description;
- (NSUUID)uuid;
- (_AFAssertionImpl)initWithUUID:(id)a3 context:(id)a4 relinquishmentHandler:(id)a5;
- (void)invokeRelinquishmentHandlerWithContext:(id)a3 error:(id)a4;
@end

@implementation _AFAssertionImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_relinquishmentHandler, 0);
}

- (AFAssertionContext)context
{
  return self->_context;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)_AFAssertionImpl;
  v4 = [(_AFAssertionImpl *)&v8 description];
  v5 = _AFAssertionCreateDescriptionOfProperties(self);
  v6 = (void *)[v3 initWithFormat:@"%@ {%@}", v4, v5];

  return (NSString *)v6;
}

- (void)invokeRelinquishmentHandlerWithContext:(id)a3 error:(id)a4
{
}

- (_AFAssertionImpl)initWithUUID:(id)a3 context:(id)a4 relinquishmentHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_AFAssertionImpl;
  v11 = [(_AFAssertionImpl *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    context = v11->_context;
    v11->_context = (AFAssertionContext *)v14;

    v16 = [AFTwoArgumentSafetyBlock alloc];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __63___AFAssertionImpl_initWithUUID_context_relinquishmentHandler___block_invoke;
    v21[3] = &unk_1E59256F8;
    id v22 = v10;
    v17 = +[AFError errorWithCode:40];
    uint64_t v18 = [(AFTwoArgumentSafetyBlock *)v16 initWithBlock:v21 defaultValue1:0 defaultValue2:v17];
    relinquishmentHandler = v11->_relinquishmentHandler;
    v11->_relinquishmentHandler = (AFTwoArgumentSafetyBlock *)v18;
  }
  return v11;
}

@end