@interface SubscriberTransactionElement
- (BOOL)bootstrapDataAllowed;
- (BOOL)cancelationSupported;
- (BOOL)expired;
- (BOOL)hasLeftAttempts;
- (BOOL)isUserInitiated;
- (BOOL)matchContent:(id)a3;
- (BOOL)requiresFullAuthentication;
- (BOOL)requiresSecureIntent;
- (NSMutableDictionary)info;
- (NSObject)annotation;
- (SubscriberTransactionElement)initWithAction:(id)a3 andAnnotation:(id)a4;
- (SubscriberTransactionElement)initWithInfo:(id)a3;
- (id).cxx_construct;
- (id)action;
- (id)description;
- (id)identifier;
- (int)type;
- (unsigned)secondsTillCancelation;
- (void)dealloc;
- (void)decreaseAttempts;
- (void)disarmCancelation;
- (void)setAction:(id)a3;
- (void)setAnnotation:(id)a3;
- (void)setAttemptsLimit:(unsigned int)a3;
- (void)setBootstrapDataAllowed:(BOOL)a3;
- (void)setCancelationTimestampInSecond:(unsigned int)a3;
- (void)setFullAuthenticationNeeded;
- (void)setIdentifier:(int)a3;
- (void)setInfo:(id)a3;
- (void)setNeedSecureIntent:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation SubscriberTransactionElement

- (SubscriberTransactionElement)initWithAction:(id)a3 andAnnotation:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SubscriberTransactionElement;
  v6 = [(SubscriberTransactionElement *)&v8 init];
  if (v6)
  {
    *((void *)v6 + 6) = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
    *((void *)v6 + 7) = a4;
    [v6 setAction:a3];
    [v6 setIdentifier:0xFFFFFFFFLL];
    v6[8] = 0;
    v6[40] = 0;
    *((_DWORD *)v6 + 3) = 0;
    *(_DWORD *)(v6 + 15) = 0;
  }
  return (SubscriberTransactionElement *)v6;
}

- (SubscriberTransactionElement)initWithInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SubscriberTransactionElement;
  v4 = [(SubscriberTransactionElement *)&v6 init];
  if (v4)
  {
    *((void *)v4 + 6) = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:a3];
    *((void *)v4 + 7) = 0;
    v4[8] = 0;
    v4[40] = 0;
    *((_DWORD *)v4 + 3) = 0;
    *(_DWORD *)(v4 + 15) = 0;
  }
  return (SubscriberTransactionElement *)v4;
}

- (void)dealloc
{
  info = self->_info;
  if (info) {

  }
  annotation = self->_annotation;
  if (annotation) {

  }
  v5.receiver = self;
  v5.super_class = (Class)SubscriberTransactionElement;
  [(SubscriberTransactionElement *)&v5 dealloc];
}

- (id)identifier
{
  v3 = [(SubscriberTransactionElement *)self info];
  if ([(SubscriberTransactionElement *)self type]) {
    CFStringRef v4 = @"response-id";
  }
  else {
    CFStringRef v4 = @"request-id";
  }

  return [(NSMutableDictionary *)v3 objectForKey:v4];
}

- (void)setIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v5 = [(SubscriberTransactionElement *)self info];
  objc_super v6 = +[NSNumber numberWithInt:v3];
  if ([(SubscriberTransactionElement *)self type]) {
    CFStringRef v7 = @"response-id";
  }
  else {
    CFStringRef v7 = @"request-id";
  }

  [(NSMutableDictionary *)v5 setObject:v6 forKey:v7];
}

- (id)action
{
  v2 = [(SubscriberTransactionElement *)self info];

  return [(NSMutableDictionary *)v2 objectForKey:@"action-name"];
}

- (void)setAction:(id)a3
{
  CFStringRef v4 = [(SubscriberTransactionElement *)self info];

  [(NSMutableDictionary *)v4 setObject:a3 forKey:@"action-name"];
}

- (void)setAttemptsLimit:(unsigned int)a3
{
  self->hasAttemptLimitation = 1;
  self->leftAttempts = a3;
}

- (void)decreaseAttempts
{
  if (self->hasAttemptLimitation)
  {
    unsigned int leftAttempts = self->leftAttempts;
    if (leftAttempts) {
      self->unsigned int leftAttempts = leftAttempts - 1;
    }
  }
}

- (BOOL)hasLeftAttempts
{
  return !self->hasAttemptLimitation || self->leftAttempts != 0;
}

- (void)setCancelationTimestampInSecond:(unsigned int)a3
{
  v5.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  if (!self->cancelationTS.__engaged_) {
    self->cancelationTS.__engaged_ = 1;
  }
  self->cancelationTS.var0.__val_.__d_.__rep_ = v5.__d_.__rep_ + 1000000000 * a3;
}

- (void)disarmCancelation
{
  if (self->cancelationTS.__engaged_) {
    self->cancelationTS.__engaged_ = 0;
  }
}

- (BOOL)cancelationSupported
{
  return self->cancelationTS.__engaged_;
}

- (BOOL)expired
{
  if (!self->cancelationTS.__engaged_) {
    return 0;
  }
  v3.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  return !self->cancelationTS.__engaged_ || self->cancelationTS.var0.__val_.__d_.__rep_ <= v3.__d_.__rep_;
}

- (unsigned)secondsTillCancelation
{
  if (!self->cancelationTS.__engaged_) {
    return 0;
  }
  v3.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep = self->cancelationTS.var0.__val_.__d_.__rep_;
  BOOL v5 = rep <= v3.__d_.__rep_;
  uint64_t v6 = rep - v3.__d_.__rep_;
  if (v5) {
    return 0;
  }
  if (1000000000 * (v6 / 1000000000) >= v6) {
    uint64_t v7 = v6 / 1000000000;
  }
  else {
    uint64_t v7 = v6 / 1000000000 + 1;
  }
  if (v7 <= 1) {
    return 1;
  }
  else {
    return v7;
  }
}

- (void)setNeedSecureIntent:(BOOL)a3
{
  self->needSecureIntent = a3;
}

- (BOOL)requiresSecureIntent
{
  return self->needSecureIntent;
}

- (void)setFullAuthenticationNeeded
{
  self->needFullAuthentication = 1;
}

- (BOOL)requiresFullAuthentication
{
  return self->needFullAuthentication;
}

- (void)setBootstrapDataAllowed:(BOOL)a3
{
  self->allowOverBootstrapData = a3;
}

- (BOOL)bootstrapDataAllowed
{
  return self->allowOverBootstrapData;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->userInitiated = a3;
}

- (BOOL)isUserInitiated
{
  return self->userInitiated;
}

- (id)description
{
  id v3 = [(NSMutableDictionary *)[(SubscriberTransactionElement *)self info] objectForKey:@"action-name"];
  if (self->hasAttemptLimitation) {
    CFStringRef v4 = "";
  }
  else {
    CFStringRef v4 = "un";
  }
  uint64_t leftAttempts = self->leftAttempts;
  uint64_t v6 = [(SubscriberTransactionElement *)self secondsTillCancelation];
  if (self->needSecureIntent) {
    uint64_t v7 = "true";
  }
  else {
    uint64_t v7 = "false";
  }
  if (self->needFullAuthentication) {
    objc_super v8 = "true";
  }
  else {
    objc_super v8 = "false";
  }
  if (self->userInitiated) {
    v9 = "true";
  }
  else {
    v9 = "false";
  }
  return +[NSString stringWithFormat:@"Type: %@, attempts:%slimited (%u), expire:%us secure-intent:%s, full-auth:%s, user-initiated:%s, Info: %@", v3, v4, leftAttempts, v6, v7, v8, v9, [(NSMutableDictionary *)[(SubscriberTransactionElement *)self info] description]];
}

- (BOOL)matchContent:(id)a3
{
  id v6 = [(NSMutableDictionary *)[(SubscriberTransactionElement *)self info] mutableCopy];
  [v6 removeObjectForKey:@"action-name"];
  [v6 removeObjectForKey:@"request-id"];
  [v6 removeObjectForKey:@"response-id"];
  LOBYTE(a3) = [v6 isEqualToDictionary:a3];
  return (char)a3;
}

- (NSMutableDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSObject)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 24) = 0;
  *((unsigned char *)self + 32) = 0;
  return self;
}

@end