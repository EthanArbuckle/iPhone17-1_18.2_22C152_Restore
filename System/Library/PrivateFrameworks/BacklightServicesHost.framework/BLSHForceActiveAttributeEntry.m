@interface BLSHForceActiveAttributeEntry
+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6;
- (BLSAssertionServiceResponding)assertion;
- (BLSAttribute)attribute;
- (BLSHAssertionAttributeHandlerService)service;
- (BOOL)reactivateIfPossible;
- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5;
@end

@implementation BLSHForceActiveAttributeEntry

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  v8 = (objc_class *)MEMORY[0x263F29970];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  id v13 = objc_alloc(MEMORY[0x263F29980]);
  v14 = NSString;
  v15 = [v10 descriptor];
  v16 = [v15 explanation];
  v17 = [v10 identifier];
  v18 = [v14 stringWithFormat:@"%@ (clientPid:%d) - force active", v16, objc_msgSend(v17, "clientPid")];
  v19 = (void *)[v13 initWithRequestedActivityState:1 explanation:v18 timestamp:mach_continuous_time() sourceEvent:11 sourceEventMetadata:0];
  id v20 = (id)[v12 performChangeRequest:v19];

  v21 = (void *)[objc_alloc((Class)objc_opt_class()) initForAttribute:v11 fromAssertion:v10 forService:v9];

  return v21;
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSHForceActiveAttributeEntry;
  id v11 = [(BLSHForceActiveAttributeEntry *)&v14 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_attribute, v8);
    objc_storeWeak(p_isa + 2, v9);
    objc_storeWeak(p_isa + 3, v10);
  }

  return p_isa;
}

- (BOOL)reactivateIfPossible
{
  return 0;
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
}

@end