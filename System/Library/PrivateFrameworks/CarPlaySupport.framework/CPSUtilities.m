@interface CPSUtilities
+ (id)sharedInstance;
- (unint64_t)lastButtonPressInteractionModel;
- (void)setLastButtonPressInteractionModel:(unint64_t)a3;
@end

@implementation CPSUtilities

+ (id)sharedInstance
{
  id v11 = a1;
  SEL v10 = a2;
  uint64_t obj = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __30__CPSUtilities_sharedInstance__block_invoke;
  v8 = &__block_descriptor_40_e5_v8__0l;
  id v9 = a1;
  v13 = (dispatch_once_t *)&sharedInstance_onceToken_0;
  id location = 0;
  objc_storeStrong(&location, &obj);
  if (*v13 != -1) {
    dispatch_once(v13, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance___utilities;

  return v2;
}

void __30__CPSUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___utilities;
  sharedInstance___utilities = (uint64_t)v1;
}

- (unint64_t)lastButtonPressInteractionModel
{
  return self->_lastButtonPressInteractionModel;
}

- (void)setLastButtonPressInteractionModel:(unint64_t)a3
{
  self->_lastButtonPressInteractionModel = a3;
}

@end