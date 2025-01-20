@interface ActivateUsingComputerController
+ (unint64_t)applicableDispositions;
- (ActivateUsingComputerController)init;
- (BOOL)didActivate;
- (BOOL)isEphemeral;
- (BYSoftwareUpdateCache)softwareUpdateCache;
- (BuddyMiscState)miscState;
- (OS_dispatch_queue)activationQueue;
- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setActivationQueue:(id)a3;
- (void)setDidActivate:(BOOL)a3;
- (void)setMiscState:(id)a3;
- (void)setSoftwareUpdateCache:(id)a3;
@end

@implementation ActivateUsingComputerController

- (ActivateUsingComputerController)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)ActivateUsingComputerController;
  id location = [(RestoreFromComputerController *)&v6 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    dispatch_queue_t v2 = dispatch_queue_create("Computer Activation Queue", 0);
    v3 = (void *)*((void *)location + 9);
    *((void *)location + 9) = v2;
  }
  v4 = (ActivateUsingComputerController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[BuddyActivationConfiguration currentConfiguration];
  [v3 addDelegate:v12];

  v4 = dispatch_get_global_queue(0, 0);
  v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  v8 = sub_100157890;
  v9 = &unk_1002B0D70;
  id v10 = location[0];
  dispatch_async(v4, &v5);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isEphemeral
{
  return 1;
}

- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4
{
  v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  BOOL v13 = a4;
  if (a3)
  {
    v4 = &_dispatch_main_q;
    v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    v8 = sub_100157A28;
    v9 = &unk_1002B2418;
    BOOL v11 = v14;
    id v10 = v16;
    BOOL v12 = v13;
    dispatch_async((dispatch_queue_t)v4, &v5);

    objc_storeStrong((id *)&v10, 0);
  }
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->_softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
}

- (BOOL)didActivate
{
  return self->_didActivate;
}

- (void)setDidActivate:(BOOL)a3
{
  self->_didActivate = a3;
}

- (OS_dispatch_queue)activationQueue
{
  return self->_activationQueue;
}

- (void)setActivationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end