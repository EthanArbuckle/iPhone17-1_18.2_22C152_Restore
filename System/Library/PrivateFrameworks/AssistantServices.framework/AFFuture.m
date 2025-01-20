@interface AFFuture
- (id)initAndGetSetterBlock:(id *)a3;
- (id)waitForValue:(unint64_t)a3;
@end

@implementation AFFuture

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (id)waitForValue:(unint64_t)a3
{
  if (dispatch_group_wait((dispatch_group_t)self->_group, a3)) {
    id v4 = 0;
  }
  else {
    id v4 = self->_value;
  }
  return v4;
}

- (id)initAndGetSetterBlock:(id *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)AFFuture;
  id v4 = [(AFFuture *)&v23 init];
  if (v4)
  {
    dispatch_group_t v5 = dispatch_group_create();
    v6 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v5;

    dispatch_group_enter(*((dispatch_group_t *)v4 + 1));
    v7 = [AFOneArgumentSafetyBlock alloc];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __34__AFFuture_initAndGetSetterBlock___block_invoke;
    v21 = &unk_1E5928150;
    id v22 = v4;
    v8 = [(AFOneArgumentSafetyBlock *)v7 initWithBlock:&v18];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __34__AFFuture_initAndGetSetterBlock___block_invoke_2;
    v16 = &unk_1E5928150;
    v17 = v8;
    v9 = v8;
    v10 = (void *)MEMORY[0x19F3A50D0](&v13);
    v11 = v10;
    if (a3) {
      *a3 = (id)objc_msgSend(v10, "copy", v13, v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  return v4;
}

void __34__AFFuture_initAndGetSetterBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
}

uint64_t __34__AFFuture_initAndGetSetterBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

@end