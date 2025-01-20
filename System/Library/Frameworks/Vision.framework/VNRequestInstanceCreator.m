@interface VNRequestInstanceCreator
+ (id)defaultCreator;
- (BOOL)_isValidRequestClass:(void *)a1;
- (VNRequestInstanceCreator)init;
- (VNRequestInstanceCreator)initWithDelegate:(id)a3;
- (id)_newVNRequestInstanceOfClass:(Class)a3 withCompletionHandler:(id)a4 revision:(unint64_t)a5 error:(id *)a6;
- (id)_newVNTargetedImageRequestInstanceOfClass:(Class)a3 withCompletionHandler:(id)a4 revision:(unint64_t)a5 error:(id *)a6;
- (id)errorForFailedInstanceCreationOfRequestClass:(Class)a3 withCompletionHandler:(id)a4;
- (id)newRequestInstanceForSpecifier:(id)a3 withCompletionHandler:(id)a4 error:(id *)a5;
- (id)newRequestInstanceOfClass:(Class)a3 withCompletionHandler:(id)a4 revision:(unint64_t)a5 error:(id *)a6;
@end

@implementation VNRequestInstanceCreator

- (void).cxx_destruct
{
}

- (id)newRequestInstanceOfClass:(Class)a3 withCompletionHandler:(id)a4 revision:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  v11 = (void *)MEMORY[0x1A6257080]();
  id v33 = 0;
  id v12 = v10;
  if (self)
  {
    if (!-[VNRequestInstanceCreator _isValidRequestClass:](a3))
    {
      [(VNRequestInstanceCreator *)self errorForFailedInstanceCreationOfRequestClass:a3 withCompletionHandler:v12];
      v17 = 0;
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = WeakRetained;
    if (WeakRetained)
    {
      id v34 = 0;
      int v15 = [WeakRetained requestInstanceCreator:self newRequestInstance:&v34 ofClass:a3 withCompletionHandler:v12 revision:a5 error:&v33];
      id v16 = v34;
      v17 = v16;
      if (v15)
      {
        if (v16)
        {
          id v18 = v16;
        }
        else
        {
          id v33 = [(VNRequestInstanceCreator *)self errorForFailedInstanceCreationOfRequestClass:a3 withCompletionHandler:v12];
        }

        goto LABEL_21;
      }
    }
    v32 = a6;
    id v19 = [NSString alloc];
    v20 = NSStringFromClass(a3);
    v21 = (NSString *)[v19 initWithFormat:@"new%@InstanceWithCompletionHandler:revision:error:", v20];

    SEL v22 = NSSelectorFromString(v21);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v23 = ((uint64_t (*)(VNRequestInstanceCreator *, SEL, id, unint64_t, id *))[(VNRequestInstanceCreator *)self methodForSelector:v22])(self, v22, v12, a5, &v33);
    }
    else
    {
      if (!a3) {
        goto LABEL_17;
      }
      v24 = a3;
      while (1)
      {
        if (-[VNRequestInstanceCreator _isValidRequestClass:](a3))
        {
          id v25 = [NSString alloc];
          v26 = NSStringFromClass(v24);
          v27 = (NSString *)[v25 initWithFormat:@"_new%@InstanceOfClass:withCompletionHandler:revision:error:", v26];

          SEL v28 = NSSelectorFromString(v27);
          if (objc_opt_respondsToSelector()) {
            break;
          }
        }
        v24 = (objc_class *)[(objc_class *)v24 superclass];
        if (!v24) {
          goto LABEL_17;
        }
      }
      if (!v28)
      {
LABEL_17:
        [(VNRequestInstanceCreator *)self errorForFailedInstanceCreationOfRequestClass:a3 withCompletionHandler:v12];
        v17 = 0;
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      uint64_t v23 = ((uint64_t (*)(VNRequestInstanceCreator *, SEL, Class, id, unint64_t, id *))[(VNRequestInstanceCreator *)self methodForSelector:v28])(self, v28, a3, v12, a5, &v33);
    }
    v17 = (void *)v23;
LABEL_18:
    a6 = v32;
LABEL_21:

    goto LABEL_22;
  }
  v17 = 0;
LABEL_22:

  id v29 = v33;
  if (v17)
  {
    id v30 = v17;
  }
  else if (a6)
  {
    *a6 = v29;
  }

  return v17;
}

- (BOOL)_isValidRequestClass:(void *)a1
{
  uint64_t v2 = objc_opt_class();
  int v3 = [a1 isSubclassOfClass:v2];
  BOOL v4 = (void *)v2 == a1 || v3 == 0;
  BOOL result = 0;
  if (!v4)
  {
    Class v5 = NSClassFromString(&cfstr_Vncompoundrequ.isa);
    if (!v5 || ([a1 isSubclassOfClass:v5] & 1) == 0) {
      return 1;
    }
  }
  return result;
}

- (VNRequestInstanceCreator)init
{
  return [(VNRequestInstanceCreator *)self initWithDelegate:0];
}

- (VNRequestInstanceCreator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNRequestInstanceCreator;
  Class v5 = [(VNRequestInstanceCreator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (id)_newVNRequestInstanceOfClass:(Class)a3 withCompletionHandler:(id)a4 revision:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  v11 = (void *)[[a3 alloc] initWithCompletionHandler:v10];
  id v12 = v11;
  if (!v11)
  {
    if (a6)
    {
      [(VNRequestInstanceCreator *)self errorForFailedInstanceCreationOfRequestClass:a3 withCompletionHandler:v10];
      id v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    id v13 = 0;
    goto LABEL_8;
  }
  if (a5 && ![v11 setRevision:a5 error:a6]) {
    goto LABEL_7;
  }
  id v13 = v12;
LABEL_8:

  return v13;
}

- (id)_newVNTargetedImageRequestInstanceOfClass:(Class)a3 withCompletionHandler:(id)a4 revision:(unint64_t)a5 error:(id *)a6
{
  if (a6)
  {
    -[VNRequestInstanceCreator errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:](self, "errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:", a3, a4, a5);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)errorForFailedInstanceCreationOfRequestClass:(Class)a3 withCompletionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = [NSString alloc];
  v6 = NSStringFromClass(a3);
  v7 = (void *)[v5 initWithFormat:@"A new %@ instance cannot be created", v6];

  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.VN.Tests" code:1 userInfo:v8];

  return v9;
}

- (id)newRequestInstanceForSpecifier:(id)a3 withCompletionHandler:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 requestClassAndReturnError:a5];
  if (v10) {
    id v11 = -[VNRequestInstanceCreator newRequestInstanceOfClass:withCompletionHandler:revision:error:](self, "newRequestInstanceOfClass:withCompletionHandler:revision:error:", v10, v9, [v8 requestRevision], a5);
  }
  else {
    id v11 = 0;
  }

  return v11;
}

+ (id)defaultCreator
{
  if (defaultCreator_onceToken != -1) {
    dispatch_once(&defaultCreator_onceToken, &__block_literal_global_1095);
  }
  uint64_t v2 = (void *)defaultCreator_defaultCreator;

  return v2;
}

uint64_t __42__VNRequestInstanceCreator_defaultCreator__block_invoke()
{
  defaultCreator_defaultCreator = objc_alloc_init(VNRequestInstanceCreator);

  return MEMORY[0x1F41817F8]();
}

@end