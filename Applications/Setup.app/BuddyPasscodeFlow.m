@interface BuddyPasscodeFlow
+ (BOOL)hiddenFromMultiUser;
+ (id)allowedFlowItems;
- (BOOL)_hasBiometricEnrollment;
- (BOOL)controllerNeedsToRun;
- (BOOL)hasPreviouslyEnrolledBiometrics;
- (BYCapabilities)capabilities;
- (BuddyMiscState)miscState;
- (id)classList;
- (id)firstItem;
- (void)flowItemDone:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setHasPreviouslyEnrolledBiometrics:(BOOL)a3;
- (void)setMiscState:(id)a3;
- (void)startFlowAnimated:(BOOL)a3;
@end

@implementation BuddyPasscodeFlow

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyPasscodeFlow *)self miscState];
  char v3 = ![(BuddyMiscState *)v2 hasPresentedPasscodeFlow];

  return v3 & 1;
}

- (void)startFlowAnimated:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  [(BuddyPasscodeFlow *)self setHasPreviouslyEnrolledBiometrics:[(BuddyPasscodeFlow *)self _hasBiometricEnrollment]];
  v3.receiver = v6;
  v3.super_class = (Class)BuddyPasscodeFlow;
  [(BuddyPasscodeFlow *)&v3 startFlowAnimated:v4];
}

- (id)classList
{
  v21 = self;
  SEL v20 = a2;
  v19.receiver = self;
  v19.super_class = (Class)BuddyPasscodeFlow;
  id v2 = [(BuddyPasscodeFlow *)&v19 classList];

  if (v2)
  {
    v18.receiver = v21;
    v18.super_class = (Class)BuddyPasscodeFlow;
    id v22 = [(BuddyPasscodeFlow *)&v18 classList];
  }
  else
  {
    objc_super v3 = [(BuddyPasscodeFlow *)v21 capabilities];
    char v16 = 0;
    char v4 = 0;
    if ([(BYCapabilities *)v3 supportsTouchID])
    {
      id v17 = [(BuddyPasscodeFlow *)v21 capabilities];
      char v16 = 1;
      char v4 = [v17 isTouchIDEnrolled] ^ 1;
    }
    if (v16) {

    }
    if (v4)
    {
      uint64_t v25 = objc_opt_class();
      SEL v5 = +[NSArray arrayWithObjects:&v25 count:1];
      [(BuddyPasscodeFlow *)v21 setClassList:v5];
    }
    else
    {
      v6 = [(BuddyPasscodeFlow *)v21 capabilities];
      unsigned __int8 v7 = [(BYCapabilities *)v6 supportsPearl];

      if (v7)
      {
        uint64_t v24 = objc_opt_class();
        v8 = +[NSArray arrayWithObjects:&v24 count:1];
        [(BuddyPasscodeFlow *)v21 setClassList:v8];
      }
    }
    v15.receiver = v21;
    v15.super_class = (Class)BuddyPasscodeFlow;
    id v9 = [(BuddyPasscodeFlow *)&v15 classList];
    BOOL v10 = v9 == 0;

    if (v10)
    {
      uint64_t v23 = objc_opt_class();
      v11 = +[NSArray arrayWithObjects:&v23 count:1];
      [(BuddyPasscodeFlow *)v21 setClassList:v11];
    }
    v14.receiver = v21;
    v14.super_class = (Class)BuddyPasscodeFlow;
    id v22 = [(BuddyPasscodeFlow *)&v14 classList];
  }
  v12 = v22;

  return v12;
}

- (id)firstItem
{
  v13 = self;
  location[1] = (id)a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyPasscodeFlow;
  location[0] = [(BuddyPasscodeFlow *)&v11 firstItem];
  char v9 = 0;
  BOOL v2 = 0;
  if (!location[0])
  {
    id v10 = [(BuddyPasscodeFlow *)v13 classList];
    char v9 = 1;
    id v3 = [v10 firstObject];
    BOOL v2 = v3 != (id)objc_opt_class();
  }
  if (v9) {

  }
  if (v2)
  {
    if (![(BuddyPasscodeFlow *)v13 hasPreviouslyEnrolledBiometrics]
      || (BYSetupAssistantHasCompletedInitialRun() & 1) != 0)
    {
      uint64_t v15 = objc_opt_class();
      SEL v5 = +[NSArray arrayWithObjects:&v15 count:1];
      [(BuddyPasscodeFlow *)v13 setClassList:v5];
    }
    else
    {
      uint64_t v16 = objc_opt_class();
      char v4 = +[NSArray arrayWithObjects:&v16 count:1];
      [(BuddyPasscodeFlow *)v13 setClassList:v4];
    }
    v8.receiver = v13;
    v8.super_class = (Class)BuddyPasscodeFlow;
    id v14 = [(BuddyPasscodeFlow *)&v8 firstItem];
  }
  else
  {
    id v14 = location[0];
  }
  objc_storeStrong(location, 0);
  v6 = v14;

  return v6;
}

+ (id)allowedFlowItems
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  return +[NSArray arrayWithObjects:v3 count:4];
}

- (void)flowItemDone:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v15 = 0;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v4 = 1;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v4 = objc_opt_isKindOfClass();
  }
  char v15 = v4 & 1;
  if (v4)
  {
    char v14 = 0;
    unsigned __int8 v5 = [(BuddyPasscodeFlow *)v17 hasPreviouslyEnrolledBiometrics];
    unsigned __int8 v6 = 0;
    if ((v5 & 1) == 0) {
      unsigned __int8 v6 = [(BuddyPasscodeFlow *)v17 _hasBiometricEnrollment];
    }
    char v14 = v6 & 1;
    char v13 = 0;
    unsigned __int8 v7 = [(BuddyPasscodeFlow *)v17 _hasBiometricEnrollment];
    char v8 = 0;
    if (v7) {
      char v8 = BYSetupAssistantHasCompletedInitialRun() ^ 1;
    }
    char v13 = v8 & 1;
    id v9 = [(BuddyPasscodeFlow *)v17 classList];
    id v12 = [v9 mutableCopy];

    [v12 removeObject:objc_opt_class()];
    [v12 removeObject:objc_opt_class()];
    [v12 addObject:objc_opt_class()];
    id v10 = [v12 copy];
    [(BuddyPasscodeFlow *)v17 setClassList:v10];

    objc_storeStrong(&v12, 0);
  }
  v11.receiver = v17;
  v11.super_class = (Class)BuddyPasscodeFlow;
  [(BuddyPasscodeFlow *)&v11 flowItemDone:location[0]];
  objc_storeStrong(location, 0);
}

- (BOOL)_hasBiometricEnrollment
{
  BOOL v2 = [(BuddyPasscodeFlow *)self capabilities];
  unsigned __int8 v3 = [(BYCapabilities *)v2 isTouchIDEnrolled];
  char v6 = 0;
  unsigned __int8 v4 = 1;
  if ((v3 & 1) == 0)
  {
    unsigned __int8 v7 = [(BuddyPasscodeFlow *)self capabilities];
    char v6 = 1;
    unsigned __int8 v4 = [(BYCapabilities *)v7 isPearlEnrolled];
  }
  char v9 = v4 & 1;
  if (v6) {

  }
  return v9 & 1;
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BOOL)hasPreviouslyEnrolledBiometrics
{
  return self->_hasPreviouslyEnrolledBiometrics;
}

- (void)setHasPreviouslyEnrolledBiometrics:(BOOL)a3
{
  self->_hasPreviouslyEnrolledBiometrics = a3;
}

- (void).cxx_destruct
{
}

@end