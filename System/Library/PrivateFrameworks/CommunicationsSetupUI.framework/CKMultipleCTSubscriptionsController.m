@interface CKMultipleCTSubscriptionsController
- (NSArray)ctSubscriptions;
- (NSString)controllerTitle;
- (NSString)defaultsKey;
- (NSString)headerKey;
- (id)isEnabledForSubscription:(id)a3;
- (id)specifiers;
- (void)setControllerTitle:(id)a3;
- (void)setCtSubscriptions:(id)a3;
- (void)setDefaultsKey:(id)a3;
- (void)setEnabledForSubscription:(id)a3 specifier:(id)a4;
- (void)setHeaderKey:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKMultipleCTSubscriptionsController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CKMultipleCTSubscriptionsController;
  [(CKMultipleCTSubscriptionsController *)&v5 viewDidLoad];
  v3 = CommunicationsSetupUIBundle();
  v4 = [v3 localizedStringForKey:self->_controllerTitle value:self->_controllerTitle table:@"Messages"];

  [(CKMultipleCTSubscriptionsController *)self setTitle:v4];
}

- (id)isEnabledForSubscription:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"NoImplementation", @"%s must be implemented in a subclass.", "-[CKMultipleCTSubscriptionsController isEnabledForSubscription:]");
}

- (void)setEnabledForSubscription:(id)a3 specifier:(id)a4
{
}

- (id)specifiers
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v29 = (int)*MEMORY[0x263F5FDB8];
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_super v5 = CommunicationsSetupUIBundle();
    uint64_t v6 = [v5 localizedStringForKey:self->_headerKey value:self->_headerKey table:@"Messages"];

    v28 = (void *)v6;
    [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:0 edit:0];
    v27 = v31 = v4;
    objc_msgSend(v4, "addObject:");
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = [(CKMultipleCTSubscriptionsController *)self ctSubscriptions];
    uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x263F4AF40];
          v13 = [v11 phoneNumber];
          v14 = [v11 labelID];
          v15 = [v12 IMUniqueIdentifierForPhoneNumber:v13 simID:v14];

          if (v15)
          {
            v16 = (void *)MEMORY[0x263F5FC40];
            v17 = [v11 label];
            v18 = [v16 preferenceSpecifierNamed:v17 target:self set:sel_setEnabledForSubscription_specifier_ get:sel_isEnabledForSubscription_ detail:0 cell:6 edit:0];

            v19 = [NSString stringWithFormat:@"%@%@", self->_defaultsKey, v15];
            [v18 setIdentifier:v19];
            v20 = [v11 labelID];

            if (v20)
            {
              v21 = [v11 labelID];
              [v18 setProperty:v21 forKey:@"simID"];
            }
            v22 = [v11 phoneNumber];

            if (v22)
            {
              v23 = [v11 phoneNumber];
              [v18 setProperty:v23 forKey:@"phoneNumber"];
            }
            [v31 addObject:v18];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v8);
    }

    v24 = [MEMORY[0x263EFF8C0] arrayWithArray:v31];
    v25 = *(Class *)((char *)&self->super.super.super.super.super.isa + v29);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v29) = v24;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v29);
  }
  return v3;
}

- (NSString)defaultsKey
{
  return self->_defaultsKey;
}

- (void)setDefaultsKey:(id)a3
{
}

- (NSString)headerKey
{
  return self->_headerKey;
}

- (void)setHeaderKey:(id)a3
{
}

- (NSString)controllerTitle
{
  return self->_controllerTitle;
}

- (void)setControllerTitle:(id)a3
{
}

- (NSArray)ctSubscriptions
{
  return self->_ctSubscriptions;
}

- (void)setCtSubscriptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctSubscriptions, 0);
  objc_storeStrong((id *)&self->_controllerTitle, 0);
  objc_storeStrong((id *)&self->_headerKey, 0);
  objc_storeStrong((id *)&self->_defaultsKey, 0);
}

@end