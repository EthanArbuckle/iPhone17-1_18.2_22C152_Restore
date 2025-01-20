@interface IDSPACState
- (BOOL)isAnyPNRInFlight;
- (BOOL)isAnySIMInserted;
- (BOOL)isAnySIMPNRCapable;
- (BOOL)isAnySIMPNRReady;
- (BOOL)isAnySIMUsable;
- (BOOL)isAuthenticationInFlight;
- (BOOL)isAwaitingAuthentication;
- (BOOL)isDualSIM;
- (IDSPACState)init;
- (NSDictionary)simStates;
- (id)description;
- (int64_t)simCount;
- (void)setIsAnyPNRInFlight:(BOOL)a3;
- (void)setIsAnySIMInserted:(BOOL)a3;
- (void)setIsAnySIMPNRCapable:(BOOL)a3;
- (void)setIsAnySIMPNRReady:(BOOL)a3;
- (void)setIsAnySIMUsable:(BOOL)a3;
- (void)setIsAuthenticationInFlight:(BOOL)a3;
- (void)setIsAwaitingAuthentication:(BOOL)a3;
- (void)setIsDualSIM:(BOOL)a3;
- (void)setSimCount:(int64_t)a3;
- (void)setSimStates:(id)a3;
@end

@implementation IDSPACState

- (IDSPACState)init
{
  v7.receiver = self;
  v7.super_class = (Class)IDSPACState;
  v2 = [(IDSPACState *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isAnySIMInserted = 0;
    v2->_isDualSIM = 0;
    v2->_simCount = 0;
    v4 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    simStates = v3->_simStates;
    v3->_simStates = v4;

    v3->_isAuthenticationInFlight = 0;
    *(_DWORD *)&v3->_isAnySIMPNRCapable = 0;
  }
  return v3;
}

- (id)description
{
  CFStringRef v2 = @"YES";
  if (self->_isAnySIMInserted) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  if (self->_isAnySIMUsable) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  if (self->_isDualSIM) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  if (self->_isAnySIMPNRCapable) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  if (self->_isAnySIMPNRReady) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  if (self->_isAnyPNRInFlight) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  if (self->_isAwaitingAuthentication) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  if (!self->_isAuthenticationInFlight) {
    CFStringRef v2 = @"NO";
  }
  return +[NSString stringWithFormat:@"isAnySIMInserted: %@, isAnySIMUsable: %@, isDualSIM: %@, simCount: %ld, isAnySIMPNRCapable: %@, isAnySIMPNRReady: %@, isAnyPNRInFlight: %@, isAwaitingAuthentication: %@, isAuthenticationInFlight: %@", v3, v4, v5, self->_simCount, v6, v7, v8, v9, v2];
}

- (BOOL)isAnySIMInserted
{
  return self->_isAnySIMInserted;
}

- (void)setIsAnySIMInserted:(BOOL)a3
{
  self->_isAnySIMInserted = a3;
}

- (BOOL)isAnySIMUsable
{
  return self->_isAnySIMUsable;
}

- (void)setIsAnySIMUsable:(BOOL)a3
{
  self->_isAnySIMUsable = a3;
}

- (BOOL)isDualSIM
{
  return self->_isDualSIM;
}

- (void)setIsDualSIM:(BOOL)a3
{
  self->_isDualSIM = a3;
}

- (int64_t)simCount
{
  return self->_simCount;
}

- (void)setSimCount:(int64_t)a3
{
  self->_simCount = a3;
}

- (NSDictionary)simStates
{
  return self->_simStates;
}

- (void)setSimStates:(id)a3
{
}

- (BOOL)isAnySIMPNRCapable
{
  return self->_isAnySIMPNRCapable;
}

- (void)setIsAnySIMPNRCapable:(BOOL)a3
{
  self->_isAnySIMPNRCapable = a3;
}

- (BOOL)isAnySIMPNRReady
{
  return self->_isAnySIMPNRReady;
}

- (void)setIsAnySIMPNRReady:(BOOL)a3
{
  self->_isAnySIMPNRReady = a3;
}

- (BOOL)isAnyPNRInFlight
{
  return self->_isAnyPNRInFlight;
}

- (void)setIsAnyPNRInFlight:(BOOL)a3
{
  self->_isAnyPNRInFlight = a3;
}

- (BOOL)isAwaitingAuthentication
{
  return self->_isAwaitingAuthentication;
}

- (void)setIsAwaitingAuthentication:(BOOL)a3
{
  self->_isAwaitingAuthentication = a3;
}

- (BOOL)isAuthenticationInFlight
{
  return self->_isAuthenticationInFlight;
}

- (void)setIsAuthenticationInFlight:(BOOL)a3
{
  self->_isAuthenticationInFlight = a3;
}

- (void).cxx_destruct
{
}

@end