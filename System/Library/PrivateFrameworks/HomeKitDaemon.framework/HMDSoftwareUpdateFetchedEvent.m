@interface HMDSoftwareUpdateFetchedEvent
+ (id)eventWasUserInitiated:(BOOL)a3 wasNewUpdateFetched:(BOOL)a4;
- (BOOL)wasNewUpdateFetched;
- (BOOL)wasUserInitiated;
- (void)setNewUpdateFetched:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation HMDSoftwareUpdateFetchedEvent

- (void)setNewUpdateFetched:(BOOL)a3
{
  self->_newUpdateFetched = a3;
}

- (BOOL)wasNewUpdateFetched
{
  return self->_newUpdateFetched;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)wasUserInitiated
{
  return self->_userInitiated;
}

+ (id)eventWasUserInitiated:(BOOL)a3 wasNewUpdateFetched:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v6 = objc_alloc_init(HMDSoftwareUpdateFetchedEvent);
  [(HMDSoftwareUpdateFetchedEvent *)v6 setUserInitiated:v5];
  [(HMDSoftwareUpdateFetchedEvent *)v6 setNewUpdateFetched:v4];
  return v6;
}

@end