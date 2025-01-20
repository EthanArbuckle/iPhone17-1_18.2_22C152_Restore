@interface CNEither
+ (BOOL)supportsSecureCoding;
+ (CNEither)eitherWithBlock:(id)a3;
+ (CNEither)eitherWithBool:(BOOL)a3 error:(id)a4;
+ (CNEither)eitherWithLeft:(id)a3;
+ (CNEither)eitherWithLeft:(id)a3 right:(id)a4;
+ (CNEither)eitherWithRight:(id)a3;
+ (id)firstLeftInLazyChain:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLeft;
- (BOOL)isRight;
- (CNEither)initWithCoder:(id)a3;
- (CNEither)initWithLeft:(id)a3 right:(id)a4;
- (CNPair)pair;
- (id)description;
- (id)left;
- (id)right;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPair:(id)a3;
@end

@implementation CNEither

+ (CNEither)eitherWithBool:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = [CNEither alloc];
  if (v4) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [(CNEither *)v6 initWithLeft:v7 right:v5];

  return v8;
}

+ (CNEither)eitherWithLeft:(id)a3 right:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithLeft:v7 right:v6];

  return (CNEither *)v8;
}

- (CNEither)initWithLeft:(id)a3 right:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNEither;
  v8 = [(CNEither *)&v13 init];
  if (v8)
  {
    uint64_t v9 = +[CNPair pairWithFirst:v6 second:v7];
    pair = v8->_pair;
    v8->_pair = (CNPair *)v9;

    v11 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (BOOL)isLeft
{
  v2 = [(CNEither *)self left];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isRight
{
  v2 = [(CNEither *)self right];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)right
{
  v2 = [(CNEither *)self pair];
  BOOL v3 = [v2 second];

  return v3;
}

- (id)left
{
  v2 = [(CNEither *)self pair];
  BOOL v3 = [v2 first];

  return v3;
}

- (CNPair)pair
{
  return self->_pair;
}

+ (CNEither)eitherWithLeft:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_0 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_71);
    }
    id v5 = CNGuardOSLog_cn_once_object_0_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT)) {
      +[CNEither eitherWithLeft:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_super v13 = [a1 eitherWithLeft:v4 right:0];

  return (CNEither *)v13;
}

+ (CNEither)eitherWithRight:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_0 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_71);
    }
    id v5 = CNGuardOSLog_cn_once_object_0_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT)) {
      +[CNEither eitherWithRight:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_super v13 = [a1 eitherWithLeft:0 right:v4];

  return (CNEither *)v13;
}

+ (CNEither)eitherWithBlock:(id)a3
{
  BOOL v3 = (void (**)(id, id *))a3;
  id v4 = (void *)MEMORY[0x192FD0880]();
  id v9 = 0;
  id v5 = v3[2](v3, &v9);
  id v6 = v9;
  uint64_t v7 = +[CNEither eitherWithLeft:v5 right:v6];

  return (CNEither *)v7;
}

+ (id)firstLeftInLazyChain:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_0 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_71);
    }
    id v4 = CNGuardOSLog_cn_once_object_0_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT)) {
      +[CNEither firstLeftInLazyChain:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  if (![v3 count])
  {
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"no either blocks passed to firstLeftInLazyChain" userInfo:0];
    objc_exception_throw(v20);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v3;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    v15 = 0;
    uint64_t v16 = *(void *)v22;
LABEL_9:
    uint64_t v17 = 0;
    v18 = v15;
    while (1)
    {
      if (*(void *)v22 != v16) {
        objc_enumerationMutation(v12);
      }
      v15 = (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * v17) + 16))(*(void *)(*((void *)&v21 + 1) + 8 * v17));

      if ((*((uint64_t (**)(uint64_t, void *))CNEitherIsLeft + 2))((uint64_t)CNEitherIsLeft, v15)) {
        break;
      }
      ++v17;
      v18 = v15;
      if (v14 == v17)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          goto LABEL_9;
        }
        break;
      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  id v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = [(CNEither *)self left];
  id v5 = (id)[v3 appendName:@"left" object:v4];

  uint64_t v6 = [(CNEither *)self right];
  id v7 = (id)[v3 appendName:@"right" object:v6];

  uint64_t v8 = [v3 build];

  return v8;
}

- (unint64_t)hash
{
  aBlock[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __16__CNEither_hash__block_invoke;
  v6[3] = &unk_1E56A0070;
  v6[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __16__CNEither_hash__block_invoke_2;
  aBlock[3] = &unk_1E56A0070;
  v2 = _Block_copy(aBlock);
  unint64_t v3 = +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v6, v2, 0);

  return v3;
}

unint64_t __16__CNEither_hash__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) left];
  unint64_t v2 = +[CNHashBuilder objectHash:v1];

  return v2;
}

unint64_t __16__CNEither_hash__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) right];
  unint64_t v2 = +[CNHashBuilder objectHash:v1];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNEither *)a3;
  BOOL v6 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (pair = self->_pair, (unint64_t)pair | (unint64_t)v4->_pair)
      && !-[CNPair isEqual:](pair, "isEqual:"))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNEither)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectForKey:@"left"];
  BOOL v6 = [v4 decodeObjectForKey:@"right"];

  id v7 = [(CNEither *)self initWithLeft:v5 right:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CNEither *)self left];
  [v4 encodeObject:v5 forKey:@"left"];

  id v6 = [(CNEither *)self right];
  [v4 encodeObject:v6 forKey:@"right"];
}

- (void)setPair:(id)a3
{
}

+ (void)eitherWithLeft:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)eitherWithRight:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)firstLeftInLazyChain:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end