@interface ACActivityPresentationOptions
- (ACActivityPresentationOptions)initWithDestinations:(id)a3;
- (BOOL)isActionButtonInitiated;
- (BOOL)isUserDismissalAllowedOnLockScreen;
- (BOOL)shouldSuppressAlertContentOnLockScreen;
- (BOOL)showsAuthorizationOptions;
- (NSArray)destinations;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)authorizationOptionsType;
- (void)setActionButtonInitiated:(BOOL)a3;
- (void)setAuthorizationOptionsType:(int64_t)a3;
- (void)setDestinations:(id)a3;
- (void)setShouldSuppressAlertContentOnLockScreen:(BOOL)a3;
- (void)setShowsAuthorizationOptions:(BOOL)a3;
- (void)setUserDismissalAllowedOnLockScreen:(BOOL)a3;
@end

@implementation ACActivityPresentationOptions

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)ACActivityPresentationOptions;
  v2 = [(ACActivityPresentationOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_isUserDismissalAllowedOnLockScreen = 256;
    destinations = v2->_destinations;
    v2->_destinations = (NSArray *)MEMORY[0x263EFFA68];

    v3->_authorizationOptionsType = 3;
  }
  return v3;
}

- (ACActivityPresentationOptions)initWithDestinations:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACActivityPresentationOptions;
  objc_super v6 = [(ACActivityPresentationOptions *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_destinations, a3);
    *(_DWORD *)&v7->_isUserDismissalAllowedOnLockScreen = 256;
    v7->_authorizationOptionsType = 3;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ACActivityPresentationOptions);
  [(ACActivityPresentationOptions *)v4 setUserDismissalAllowedOnLockScreen:self->_isUserDismissalAllowedOnLockScreen];
  [(ACActivityPresentationOptions *)v4 setShouldSuppressAlertContentOnLockScreen:self->_shouldSuppressAlertContentOnLockScreen];
  [(ACActivityPresentationOptions *)v4 setShowsAuthorizationOptions:self->_showsAuthorizationOptions];
  [(ACActivityPresentationOptions *)v4 setActionButtonInitiated:self->_isActionButtonInitiated];
  [(ACActivityPresentationOptions *)v4 setDestinations:self->_destinations];
  [(ACActivityPresentationOptions *)v4 setAuthorizationOptionsType:self->_authorizationOptionsType];
  return v4;
}

- (BOOL)isUserDismissalAllowedOnLockScreen
{
  return self->_isUserDismissalAllowedOnLockScreen;
}

- (void)setUserDismissalAllowedOnLockScreen:(BOOL)a3
{
  self->_isUserDismissalAllowedOnLockScreen = a3;
}

- (BOOL)shouldSuppressAlertContentOnLockScreen
{
  return self->_shouldSuppressAlertContentOnLockScreen;
}

- (void)setShouldSuppressAlertContentOnLockScreen:(BOOL)a3
{
  self->_shouldSuppressAlertContentOnLockScreen = a3;
}

- (BOOL)showsAuthorizationOptions
{
  return self->_showsAuthorizationOptions;
}

- (void)setShowsAuthorizationOptions:(BOOL)a3
{
  self->_showsAuthorizationOptions = a3;
}

- (BOOL)isActionButtonInitiated
{
  return self->_isActionButtonInitiated;
}

- (void)setActionButtonInitiated:(BOOL)a3
{
  self->_isActionButtonInitiated = a3;
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
}

- (int64_t)authorizationOptionsType
{
  return self->_authorizationOptionsType;
}

- (void)setAuthorizationOptionsType:(int64_t)a3
{
  self->_authorizationOptionsType = a3;
}

- (void).cxx_destruct
{
}

@end