@interface EdgeController
- (CTXPCServiceSubscriptionContext)context;
- (CoreTelephonyClient)coreTelephonyClient;
- (id)specifiersWithSpecifier:(id)a3;
- (void)dealloc;
- (void)setBasebandValue:(id)a3 forTraceName:(id)a4 property:(id)a5;
- (void)setContext:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
@end

@implementation EdgeController

- (void)dealloc
{
  [(EdgeController *)self setCoreTelephonyClient:0];
  [(EdgeController *)self setContext:0];
  v3.receiver = self;
  v3.super_class = (Class)EdgeController;
  [(EdgeController *)&v3 dealloc];
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (id)specifiersWithSpecifier:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F60290];
  -[EdgeController setContext:](self, "setContext:", [a3 propertyForKey:*MEMORY[0x263F60290]]);
  NSLog(&cfstr_Edgecontroller.isa, [(CTXPCServiceSubscriptionContext *)[(EdgeController *)self context] description]);
  v5 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = (void *)[MEMORY[0x263EFF980] array];
  id v7 = objc_alloc(MEMORY[0x263F02D30]);
  -[EdgeController setCoreTelephonyClient:](self, "setCoreTelephonyClient:", (id)[v7 initWithQueue:MEMORY[0x263EF83A0]]);
  if (![(EdgeController *)self coreTelephonyClient]) {
    goto LABEL_4;
  }
  uint64_t v16 = 0;
  uint64_t v8 = [(CoreTelephonyClient *)self->_coreTelephonyClient context:[(EdgeController *)self context] getCarrierBundleValue:&unk_26DD4EB60 error:&v16];
  if (v16)
  {
    NSLog(&cfstr_Getcarrierbund.isa, v16);
LABEL_4:
    NSLog(&cfstr_AlloweditingD.isa, 0);
    return v6;
  }
  v10 = (void *)v8;
  if (!v8) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  unsigned int v11 = [v10 BOOLValue];
  NSLog(&cfstr_AlloweditingD.isa, v11);
  if (v11)
  {
    v12 = (void *)MEMORY[0x263F5FC40];
    if (MGGetBoolAnswer()) {
      v13 = @"APN_SETTINGS";
    }
    else {
      v13 = @"EDGE";
    }
    v14 = objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v5, "localizedStringForKey:value:table:", v13, &stru_26DD4D9A0, @"Edge"), self, 0, 0, objc_opt_class(), 1, 0);
    [v14 setIdentifier:@"APN_SETTINGS"];
    objc_msgSend(v14, "setProperty:forKey:", -[EdgeController context](self, "context"), v4);
    v15 = [(EdgeController *)self coreTelephonyClient];
    [v14 setProperty:v15 forKey:kEdgeSettingsClientConnection];
    [v6 addObject:v14];
  }
  return v6;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setBasebandValue:(id)a3 forTraceName:(id)a4 property:(id)a5
{
  uint64_t v6 = _CTServerConnectionCreate();
  if (v6)
  {
    id v7 = (const void *)v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_msgSend(a3, "BOOLValue", 0, 0, 0, 0, 0);
    }
    _CTServerConnectionSetTraceProperty();
    CFRelease(v7);
  }
}

@end