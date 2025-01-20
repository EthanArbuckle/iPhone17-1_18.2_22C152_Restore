@interface CRSUIStatefulCAPackage
- (BOOL)hasDynamicState;
- (CAPackage)package;
- (CRSUIStatefulCAPackage)initWithPackage:(id)a3 lightModeState:(id)a4 darkModeState:(id)a5;
- (CRSUIStatefulCAPackage)initWithPackage:(id)a3 lightModeState:(id)a4 darkModeState:(id)a5 hasDynamicState:(BOOL)a6;
- (CRSUIStatefulCAPackage)initWithPackage:(id)a3 state:(id)a4;
- (NSString)darkModeState;
- (NSString)lightModeState;
@end

@implementation CRSUIStatefulCAPackage

- (CRSUIStatefulCAPackage)initWithPackage:(id)a3 state:(id)a4
{
  return [(CRSUIStatefulCAPackage *)self initWithPackage:a3 lightModeState:a4 darkModeState:0 hasDynamicState:0];
}

- (CRSUIStatefulCAPackage)initWithPackage:(id)a3 lightModeState:(id)a4 darkModeState:(id)a5
{
  return [(CRSUIStatefulCAPackage *)self initWithPackage:a3 lightModeState:a4 darkModeState:a5 hasDynamicState:1];
}

- (CRSUIStatefulCAPackage)initWithPackage:(id)a3 lightModeState:(id)a4 darkModeState:(id)a5 hasDynamicState:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CRSUIStatefulCAPackage;
  v14 = [(CRSUIStatefulCAPackage *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_package, a3);
    uint64_t v16 = [v12 copy];
    lightModeState = v15->_lightModeState;
    v15->_lightModeState = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    darkModeState = v15->_darkModeState;
    v15->_darkModeState = (NSString *)v18;

    v15->_hasDynamicState = a6;
  }

  return v15;
}

- (CAPackage)package
{
  return self->_package;
}

- (NSString)lightModeState
{
  return self->_lightModeState;
}

- (NSString)darkModeState
{
  return self->_darkModeState;
}

- (BOOL)hasDynamicState
{
  return self->_hasDynamicState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeState, 0);
  objc_storeStrong((id *)&self->_lightModeState, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end