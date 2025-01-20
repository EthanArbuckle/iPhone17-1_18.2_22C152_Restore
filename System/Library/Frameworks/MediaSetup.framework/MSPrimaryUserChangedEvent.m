@interface MSPrimaryUserChangedEvent
- (BOOL)changedToHomeOwner;
- (BOOL)changedToUserNotInHome;
- (BOOL)isAutomatic;
- (MSPrimaryUserChangedEvent)initWithAccessory:(id)a3;
- (void)setChangedToHomeOwner:(BOOL)a3;
- (void)setChangedToUserNotInHome:(BOOL)a3;
- (void)setIsAutomatic:(BOOL)a3;
@end

@implementation MSPrimaryUserChangedEvent

- (MSPrimaryUserChangedEvent)initWithAccessory:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSPrimaryUserChangedEvent;
  v3 = [(MSPrimaryUserChangedEvent *)&v6 init];
  v4 = v3;
  if (v3)
  {
    [(MSPrimaryUserChangedEvent *)v3 setIsAutomatic:0];
    [(MSPrimaryUserChangedEvent *)v4 setChangedToHomeOwner:0];
    [(MSPrimaryUserChangedEvent *)v4 setChangedToUserNotInHome:0];
  }
  return v4;
}

- (BOOL)changedToHomeOwner
{
  return self->_changedToHomeOwner;
}

- (void)setChangedToHomeOwner:(BOOL)a3
{
  self->_changedToHomeOwner = a3;
}

- (BOOL)changedToUserNotInHome
{
  return self->_changedToUserNotInHome;
}

- (void)setChangedToUserNotInHome:(BOOL)a3
{
  self->_changedToUserNotInHome = a3;
}

- (BOOL)isAutomatic
{
  return self->_isAutomatic;
}

- (void)setIsAutomatic:(BOOL)a3
{
  self->_isAutomatic = a3;
}

@end