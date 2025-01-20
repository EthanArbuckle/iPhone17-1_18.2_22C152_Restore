@interface MCMXPCMessageWithIdentifierBase
- (MCMXPCMessageWithIdentifierBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSString)identifier;
@end

@implementation MCMXPCMessageWithIdentifierBase

- (void).cxx_destruct
{
  p_identifier = &self->_identifier;

  objc_storeStrong((id *)p_identifier, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MCMXPCMessageWithIdentifierBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MCMXPCMessageWithIdentifierBase;
  v10 = [(MCMXPCMessageBase *)&v17 initWithXPCObject:v8 context:v9 error:a5];
  if (v10)
  {
    v11 = [v9 clientIdentity];
    v12 = [v11 codeSignInfo];
    v13 = [v12 identifier];
    uint64_t v14 = [(MCMXPCMessageBase *)v10 identifierFromXPCObject:v8 elseClientIdentifier:v13];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v14;
  }
  return v10;
}

@end