@interface BLSValidWhenBacklightInactiveAttributeEntry
+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6;
- (BLSAssertionServiceResponding)assertion;
- (BLSAttribute)attribute;
- (BLSHAssertionAttributeHandlerService)service;
- (BOOL)reactivateIfPossible;
- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5;
@end

@implementation BLSValidWhenBacklightInactiveAttributeEntry

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v12 = &off_264531F58;
  if ((isKindOfClass & 1) == 0) {
    v12 = off_264531C90;
  }
  v13 = (void *)[objc_alloc(*v12) initForAttribute:v8 fromAssertion:v10 forService:v9];

  return v13;
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSValidWhenBacklightInactiveAttributeEntry;
  v11 = [(BLSValidWhenBacklightInactiveAttributeEntry *)&v14 init];
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