@interface CNContactContentNavigationItemUpdaterResult
- (BOOL)enableCancelShortcut;
- (BOOL)enableEditShortcut;
- (BOOL)enableSaveShortcut;
- (void)setEnableCancelShortcut:(BOOL)a3;
- (void)setEnableEditShortcut:(BOOL)a3;
- (void)setEnableSaveShortcut:(BOOL)a3;
@end

@implementation CNContactContentNavigationItemUpdaterResult

- (void)setEnableSaveShortcut:(BOOL)a3
{
  self->_enableSaveShortcut = a3;
}

- (BOOL)enableSaveShortcut
{
  return self->_enableSaveShortcut;
}

- (void)setEnableCancelShortcut:(BOOL)a3
{
  self->_enableCancelShortcut = a3;
}

- (BOOL)enableCancelShortcut
{
  return self->_enableCancelShortcut;
}

- (void)setEnableEditShortcut:(BOOL)a3
{
  self->_enableEditShortcut = a3;
}

- (BOOL)enableEditShortcut
{
  return self->_enableEditShortcut;
}

@end