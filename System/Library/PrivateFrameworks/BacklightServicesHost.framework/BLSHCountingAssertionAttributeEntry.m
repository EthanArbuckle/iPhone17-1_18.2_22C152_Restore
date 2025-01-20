@interface BLSHCountingAssertionAttributeEntry
+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6;
- (BLSAssertionServiceResponding)assertion;
- (BLSAttribute)attribute;
- (BLSHAssertionAttributeHandlerService)service;
- (BOOL)reactivateIfPossible;
- (NSString)description;
- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6;
- (void)activate;
- (void)invalidate;
@end

@implementation BLSHCountingAssertionAttributeEntry

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [[BLSHCountingAssertionAttributeEntry alloc] initForAttribute:v11 fromAssertion:v12 forService:v13 attributeHandler:v14];
    -[BLSHCountingAssertionAttributeEntry activate](v15);

    return v15;
  }
  else
  {
    v17 = [NSString stringWithFormat:@"attributeHandler:%@ is not a kindof BLSHLocalCountingAssertionAttributeHandler", v14];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHCountingAssertionAttributeEntry activateForAttribute:fromAssertion:forService:attributeHandler:](a2, (uint64_t)a1, (uint64_t)v17);
    }
    [v17 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)activate
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    -[BLSHLocalCountingAssertionAttributeHandler incrementCountWithEntry:]((uint64_t)WeakRetained, a1);
  }
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BLSHCountingAssertionAttributeEntry;
  id v14 = [(BLSHCountingAssertionAttributeEntry *)&v17 init];
  p_isa = (id *)&v14->super.isa;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_attribute, v10);
    objc_storeWeak(p_isa + 3, v11);
    objc_storeWeak(p_isa + 4, v12);
    objc_storeWeak(p_isa + 1, v13);
  }

  return p_isa;
}

- (BOOL)reactivateIfPossible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attributeHandler);
  -[BLSHLocalCountingAssertionAttributeHandler incrementCountWithEntry:]((uint64_t)WeakRetained, self);

  return 1;
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attributeHandler);
  -[BLSHLocalCountingAssertionAttributeHandler decrementCountWithEntry:]((uint64_t)WeakRetained, self);
}

- (NSString)description
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __50__BLSHCountingAssertionAttributeEntry_description__block_invoke;
  id v10 = &unk_2645322D0;
  id v11 = v3;
  id v12 = self;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return (NSString *)v5;
}

void __50__BLSHCountingAssertionAttributeEntry_description__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  id v4 = (id)[v2 appendObject:WeakRetained withName:@"attribute"];

  v5 = *(void **)(a1 + 32);
  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  uint64_t v7 = NSStringFromBLSAssertingObject();
  id v8 = (id)[v5 appendObject:v7 withName:@"assertion"];

  v9 = *(void **)(a1 + 32);
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  id v10 = (id)[v9 appendObject:v11 withName:@"service"];
}

- (BLSAttribute)attribute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attribute);

  return (BLSAttribute *)WeakRetained;
}

- (BLSAssertionServiceResponding)assertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assertion);

  return (BLSAssertionServiceResponding *)WeakRetained;
}

- (BLSHAssertionAttributeHandlerService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (BLSHAssertionAttributeHandlerService *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_assertion);
  objc_destroyWeak((id *)&self->_attribute);

  objc_destroyWeak((id *)&self->_attributeHandler);
}

+ (void)activateForAttribute:(uint64_t)a3 fromAssertion:forService:attributeHandler:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"BLSHLocalCountingAssertionAttributeHandler.m";
  __int16 v16 = 1024;
  int v17 = 136;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end