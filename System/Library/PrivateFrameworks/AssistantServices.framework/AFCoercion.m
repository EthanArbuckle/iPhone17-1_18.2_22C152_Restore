@interface AFCoercion
+ (id)coercionWithBlock:(id)a3;
+ (id)identityCoercion;
+ (id)stringToUUIDCoercion;
+ (id)typeAssertionWithClass:(Class)a3;
- (AFCoercion)init;
- (AFCoercion)initWithBlock:(id)a3;
- (id)coerceObject:(id)a3 error:(id *)a4;
@end

@implementation AFCoercion

- (void).cxx_destruct
{
}

- (id)coerceObject:(id)a3 error:(id *)a4
{
  return (id)(*((uint64_t (**)(void))self->_block + 2))();
}

- (AFCoercion)init
{
  return [(AFCoercion *)self initWithBlock:&__block_literal_global_11789];
}

id __18__AFCoercion_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (AFCoercion)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFCoercion;
  v5 = [(AFCoercion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x19F3A50D0](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

+ (id)stringToUUIDCoercion
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__AFCoercion_stringToUUIDCoercion__block_invoke;
  v4[3] = &__block_descriptor_40_e12__24__0_8__16l;
  v4[4] = a1;
  id v2 = [a1 coercionWithBlock:v4];
  return v2;
}

id __34__AFCoercion_stringToUUIDCoercion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 typeAssertionWithClass:objc_opt_class()];
  id v14 = 0;
  v7 = [v6 coerceObject:v5 error:&v14];

  id v8 = v14;
  if (!v7)
  {
    v10 = 0;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
  if (v9)
  {
    v10 = (void *)v9;
    if (!a3) {
      goto LABEL_7;
    }
LABEL_6:
    *a3 = v8;
    goto LABEL_7;
  }
  v12 = [NSString stringWithFormat:@"Unable to create UUID for string \"%@\"", v7];
  uint64_t v13 = +[AFConversationError errorWithCode:200 localizedFailureReason:v12];

  v10 = 0;
  id v8 = (id)v13;
  if (a3) {
    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

+ (id)typeAssertionWithClass:(Class)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AFCoercion_typeAssertionWithClass___block_invoke;
  v5[3] = &__block_descriptor_40_e12__24__0_8__16lu32l8;
  v5[4] = a3;
  v3 = [a1 coercionWithBlock:v5];
  return v3;
}

id __37__AFCoercion_typeAssertionWithClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [NSString stringWithFormat:@"Object %@ is not a kind of %@", v5, *(void *)(a1 + 32)];
    v7 = +[AFConversationError errorWithCode:200 localizedFailureReason:v8];

    id v6 = 0;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v6 = v5;
  v7 = 0;
  if (a3) {
LABEL_5:
  }
    *a3 = v7;
LABEL_6:

  return v6;
}

+ (id)identityCoercion
{
  return (id)[a1 coercionWithBlock:&__block_literal_global_9];
}

id __30__AFCoercion_identityCoercion__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

+ (id)coercionWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithBlock:v4];

  return v5;
}

@end