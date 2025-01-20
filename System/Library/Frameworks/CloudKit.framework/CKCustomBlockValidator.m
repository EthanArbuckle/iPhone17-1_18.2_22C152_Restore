@interface CKCustomBlockValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKCustomBlockValidator)initWithBlock:(id)a3;
- (id)block;
- (void)setBlock:(id)a3;
@end

@implementation CKCustomBlockValidator

- (CKCustomBlockValidator)initWithBlock:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKCustomBlockValidator;
  id v3 = a3;
  v4 = [(CKCustomBlockValidator *)&v8 init];
  objc_msgSend_setBlock_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_msgSend_block(self, v7, v8, v9);
  v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  v11 = ((void (**)(void, id))v10)[2](v10, v6);

  if (a4 && v11) {
    *a4 = v11;
  }

  return v11 == 0;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end