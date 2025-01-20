@interface ITAttentionAwarenessContext
- (BOOL)isEqual:(id)a3;
- (ITAttentionAwarenessContext)init;
- (NSUUID)identifier;
- (unint64_t)hash;
@end

@implementation ITAttentionAwarenessContext

- (ITAttentionAwarenessContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)ITAttentionAwarenessContext;
  v2 = [(ITAttentionAwarenessContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;
  }
  return v2;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    identifier = self->_identifier;
    v8 = [v4 identifier];
    char v6 = [(NSUUID *)identifier isEqual:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end