@interface CKXReaderBase
- (CKXReaderBase)initWithSchema:(id)a3;
- (CKXSchema)schema;
@end

@implementation CKXReaderBase

- (CKXReaderBase)initWithSchema:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKXReaderBase;
  v6 = [(CKXReaderBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_schema, a3);
  }

  return v7;
}

- (CKXSchema)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
}

@end