@interface HDIDSMessageContext
- (BOOL)isEqual:(id)a3;
- (HDIDSMessageContext)initWithMessageContext:(id)a3;
- (NSString)originalGUID;
- (unint64_t)hash;
@end

@implementation HDIDSMessageContext

- (HDIDSMessageContext)initWithMessageContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDIDSMessageContext;
  v6 = [(HDIDSMessageContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDIDSMessageContext *)a3;
  if (v4 == self) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    char v7 = 0;
    goto LABEL_8;
  }
  context = self->_context;
  v6 = v4->_context;
  if (context == v6)
  {
LABEL_6:
    char v7 = 1;
    goto LABEL_8;
  }
  if (!v6) {
    goto LABEL_7;
  }
  char v7 = -[IDSMessageContext isEqual:](context, "isEqual:");
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  return [(IDSMessageContext *)self->_context hash];
}

- (NSString)originalGUID
{
  v2 = [(IDSMessageContext *)self->_context originalGUID];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

@end