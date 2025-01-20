@interface HFItemBuilder
+ (Class)homeKitRepresentationClass;
- (HFItemBuilder)init;
- (HFItemBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HFItemBuilder)initWithHome:(id)a3;
- (HMHome)home;
- (id)_commitSetDiff:(id)a3 withBlock:(id)a4;
- (id)_failureErrorWithReason:(id)a3;
- (id)commitItem;
- (id)commitItemBuilderSetDiff:(id)a3 addBlock:(id)a4 deleteBlock:(id)a5;
- (id)commitSetDiff:(id)a3 addBlock:(id)a4 updateBlock:(id)a5 deleteBlock:(id)a6;
- (id)homeKitRepresentation;
- (id)lazy_verifyNameIsNotEmpty:(id)a3;
- (id)lazy_verifyPropertiesAreSet:(id)a3;
- (id)lazy_verifyProperty:(id)a3 matchesCondition:(id)a4 description:(id)a5;
- (id)lazy_verifyPropertyIsSet:(id)a3;
- (id)verifyNameIsNotEmpty:(id)a3;
- (id)verifyPropertiesAreSet:(id)a3;
- (id)verifyProperty:(id)a3 matchesCondition:(id)a4 description:(id)a5;
- (id)verifyPropertyIsSet:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeKitRepresentation:(id)a3;
@end

@implementation HFItemBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (id)commitItem
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFItemBuilder.m", 29, @"%s is an abstract method that must be overriden by subclass %@", "-[HFItemBuilder commitItem]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)setHomeKitRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() homeKitRepresentationClass];
  id v11 = v4;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v11;
    }
    else {
      v6 = 0;
    }
    v7 = v11;
    if (v6) {
      goto LABEL_8;
    }
    v8 = [MEMORY[0x263F08690] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];
  }
  v7 = 0;
LABEL_8:

  id homeKitRepresentation = self->_homeKitRepresentation;
  self->_id homeKitRepresentation = v7;
}

- (HFItemBuilder)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFItemBuilder.m", 40, @"%s is unavailable; use %@ instead",
    "-[HFItemBuilder init]",
    v5);

  return 0;
}

- (HFItemBuilder)initWithHome:(id)a3
{
  return [(HFItemBuilder *)self initWithExistingObject:0 inHome:a3];
}

- (HFItemBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFItemBuilder;
  v8 = [(HFItemBuilder *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    uint64_t v10 = [(id)objc_opt_class() homeKitRepresentationClass];
    id v11 = v6;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
      id v13 = v11;
      if (v12) {
        goto LABEL_9;
      }
      v14 = [MEMORY[0x263F08690] currentHandler];
      v15 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v14 handleFailureInFunction:v15, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v10, objc_opt_class() file lineNumber description];
    }
    id v13 = 0;
LABEL_9:

    id homeKitRepresentation = v9->_homeKitRepresentation;
    v9->_id homeKitRepresentation = v13;
  }
  return v9;
}

- (void)setHome:(id)a3
{
  uint64_t v5 = (HMHome *)a3;
  home = self->_home;
  p_home = &self->_home;
  if (home != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_home, a3);
    uint64_t v5 = v8;
  }
}

- (id)commitSetDiff:(id)a3 addBlock:(id)a4 updateBlock:(id)a5 deleteBlock:(id)a6
{
  v44[3] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (!v12 || !v13 || !v14)
  {
    v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"HFItemBuilder.m", 69, @"Invalid parameter not satisfying: %@", @"addBlock && updateBlock && deleteBlock" object file lineNumber description];
  }
  v16 = [HFMutableSetDiff alloc];
  v17 = [v11 fromSet];
  objc_super v18 = [(HFMutableSetDiff *)v16 initWithFromSet:v17];

  v19 = [v11 deletions];
  v20 = [(HFItemBuilder *)self _commitSetDiff:v19 withBlock:v15];

  v21 = [v11 additions];
  v22 = [(HFItemBuilder *)self _commitSetDiff:v21 withBlock:v12];

  v23 = [v11 updates];
  v24 = [(HFItemBuilder *)self _commitSetDiff:v23 withBlock:v13];

  v25 = (void *)MEMORY[0x263F58190];
  v44[0] = v20;
  v44[1] = v22;
  v44[2] = v24;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:3];
  v27 = [v25 chainFutures:v26];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke;
  v39[3] = &unk_26408F198;
  id v40 = v20;
  v28 = v18;
  v41 = v28;
  id v42 = v22;
  id v43 = v24;
  id v29 = v24;
  id v30 = v22;
  id v31 = v20;
  id v32 = (id)[v27 addCompletionBlock:v39];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_5;
  v37[3] = &unk_26408F1C0;
  v38 = v28;
  v33 = v28;
  v34 = [v27 recover:v37];

  return v34;
}

void __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke(uint64_t a1)
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_2;
  v12[3] = &unk_26408F170;
  v2 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v3 = (id)[v2 addCompletionBlock:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_3;
  v10[3] = &unk_26408F170;
  id v4 = *(void **)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  id v5 = (id)[v4 addCompletionBlock:v10];
  id v6 = *(void **)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_4;
  v8[3] = &unk_26408F170;
  id v9 = *(id *)(a1 + 40);
  id v7 = (id)[v6 addCompletionBlock:v8];
}

uint64_t __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObjects:a2];
}

uint64_t __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjects:a2];
}

uint64_t __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateObjects:a2];
}

id __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_5(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F58190];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v10 = @"HFItemBuilderErrorUserInfoSuccessfulChangesKey";
  v11[0] = v3;
  id v4 = NSDictionary;
  id v5 = a2;
  id v6 = [v4 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = objc_msgSend(v5, "hf_errorWithAddedUserInfo:", v6);

  v8 = [v2 futureWithError:v7];

  return v8;
}

- (id)_commitSetDiff:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF9C0] set];
  v8 = (void *)MEMORY[0x263F58190];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke;
  v16[3] = &unk_26408F260;
  id v18 = v7;
  id v19 = v6;
  id v17 = v5;
  id v9 = (void *)MEMORY[0x263F581B8];
  id v10 = v7;
  id v11 = v6;
  id v12 = v5;
  id v13 = [v9 mainThreadScheduler];
  id v14 = [v8 lazyFutureWithBlock:v16 scheduler:v13];

  return v14;
}

void __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_2;
  v14[3] = &unk_26408F210;
  id v16 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 40);
  id v5 = objc_msgSend(v4, "na_map:", v14);
  id v6 = (void *)MEMORY[0x263F58190];
  id v7 = [v5 allObjects];
  v8 = [v6 chainFutures:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_4;
  v11[3] = &unk_26408F238;
  id v12 = v3;
  id v13 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = (id)[v8 addCompletionBlock:v11];
}

id __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_3;
  v8[3] = &unk_26408F1E8;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v5 = v3;
  id v6 = [v4 addSuccessBlock:v8];

  return v6;
}

uint64_t __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

uint64_t __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40) error:a3];
}

- (id)commitItemBuilderSetDiff:(id)a3 addBlock:(id)a4 deleteBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (!v10 || !v11)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HFItemBuilder.m", 126, @"Invalid parameter not satisfying: %@", @"addBlock && deleteBlock" object file lineNumber description];
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__HFItemBuilder_commitItemBuilderSetDiff_addBlock_deleteBlock___block_invoke;
  v17[3] = &unk_26408F2B0;
  id v18 = v10;
  id v13 = v10;
  id v14 = [(HFItemBuilder *)self commitSetDiff:v9 addBlock:v17 updateBlock:&__block_literal_global_29 deleteBlock:v12];

  return v14;
}

id __63__HFItemBuilder_commitItemBuilderSetDiff_addBlock_deleteBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 commitItem];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__HFItemBuilder_commitItemBuilderSetDiff_addBlock_deleteBlock___block_invoke_2;
  v9[3] = &unk_26408F288;
  id v5 = *(id *)(a1 + 32);
  id v10 = v3;
  id v11 = v5;
  id v6 = v3;
  id v7 = [v4 flatMap:v9];

  return v7;
}

uint64_t __63__HFItemBuilder_commitItemBuilderSetDiff_addBlock_deleteBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __63__HFItemBuilder_commitItemBuilderSetDiff_addBlock_deleteBlock___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 commitItem];
}

- (id)verifyPropertyIsSet:(id)a3
{
  return [(HFItemBuilder *)self verifyProperty:a3 matchesCondition:&__block_literal_global_41_0 description:@"Property is required but not set"];
}

BOOL __37__HFItemBuilder_verifyPropertyIsSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (id)verifyPropertiesAreSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[HFItemBuilder verifyPropertyIsSet:](self, "verifyPropertyIsSet:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v9)
        {
          id v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)verifyNameIsNotEmpty:(id)a3
{
  if ([a3 length])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 1);
  }
  return v3;
}

- (id)verifyProperty:(id)a3 matchesCondition:(id)a4 description:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (uint64_t (**)(id, void *))a4;
  id v11 = a5;
  if (!v10)
  {
    id v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HFItemBuilder.m", 166, @"Invalid parameter not satisfying: %@", @"condition" object file lineNumber description];
  }
  long long v12 = [(HFItemBuilder *)self valueForKey:v9];
  char v13 = v10[2](v10, v12);

  if (v13)
  {
    long long v14 = 0;
  }
  else
  {
    long long v15 = [NSString stringWithFormat:@"%@ has invalid property \"%@\": %@", self, v9, v11];
    id v16 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Failed to verify builder: %@ for reason: %@", buf, 0x16u);
    }

    long long v14 = [(HFItemBuilder *)self _failureErrorWithReason:v15];
  }
  return v14;
}

- (id)lazy_verifyPropertyIsSet:(id)a3
{
  return [(HFItemBuilder *)self lazy_verifyProperty:a3 matchesCondition:&__block_literal_global_54 description:@"Property is required but not set"];
}

BOOL __42__HFItemBuilder_lazy_verifyPropertyIsSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (id)lazy_verifyPropertiesAreSet:(id)a3
{
  id v3 = (void *)MEMORY[0x263F58190];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__HFItemBuilder_lazy_verifyPropertiesAreSet___block_invoke;
  v7[3] = &unk_26408F2F8;
  v7[4] = self;
  id v4 = objc_msgSend(a3, "na_map:", v7);
  uint64_t v5 = [v3 chainFutures:v4];

  return v5;
}

uint64_t __45__HFItemBuilder_lazy_verifyPropertiesAreSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) verifyPropertyIsSet:a2];
}

- (id)lazy_verifyProperty:(id)a3 matchesCondition:(id)a4 description:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F58190];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__HFItemBuilder_lazy_verifyProperty_matchesCondition_description___block_invoke;
  v17[3] = &unk_26408F320;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v10;
  id v20 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  long long v15 = [v11 lazyFutureWithBlock:v17];

  return v15;
}

void __66__HFItemBuilder_lazy_verifyProperty_matchesCondition_description___block_invoke(void *a1, void *a2)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v4 = a1[7];
  id v6 = a2;
  uint64_t v7 = [v2 verifyProperty:v3 matchesCondition:v4 description:v5];
  id v8 = (id)v7;
  if (v7) {
    [v6 finishWithError:v7];
  }
  else {
    [v6 finishWithNoResult];
  }
}

- (id)lazy_verifyNameIsNotEmpty:(id)a3
{
  uint64_t v3 = [a3 length];
  uint64_t v4 = (void *)MEMORY[0x263F58190];
  if (v3)
  {
    uint64_t v5 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 1);
    uint64_t v5 = [v4 futureWithError:v6];
  }
  return v5;
}

- (id)_failureErrorWithReason:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = @"HFItemBuilderFailureReason";
  v9[0] = a3;
  uint64_t v3 = NSDictionary;
  id v4 = a3;
  uint64_t v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F58160] code:2 userInfo:v5];

  return v6;
}

- (id)homeKitRepresentation
{
  return self->_homeKitRepresentation;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_homeKitRepresentation, 0);
}

@end