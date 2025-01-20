@interface FigCaptureDisplayLayout
+ (void)initialize;
- (BOOL)isOnHomeScreen;
- (BOOL)isOnLockScreen;
- (BOOL)isPaymentServiceVisible;
- (BOOL)isSiriVisible;
- (NSArray)foregroundApps;
- (NSArray)obscuredApps;
- (NSArray)pipApps;
- (NSArray)transitioningApps;
- (NSDate)timestamp;
- (id)_init;
- (id)debugDescription;
- (id)description;
- (int64_t)displayType;
- (void)dealloc;
- (void)setDisplayType:(int64_t)a3;
- (void)setForegroundApps:(id)a3;
- (void)setObscuredApps:(id)a3;
- (void)setOnHomeScreen:(BOOL)a3;
- (void)setOnLockScreen:(BOOL)a3;
- (void)setPaymentServiceVisible:(BOOL)a3;
- (void)setPipApps:(id)a3;
- (void)setSiriVisible:(BOOL)a3;
- (void)setTimestamp:(id)a3;
- (void)setTransitioningApps:(id)a3;
@end

@implementation FigCaptureDisplayLayout

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[FigCaptureDisplayLayout debugDescription](self, "debugDescription")];
}

- (id)debugDescription
{
  v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([(NSArray *)self->_foregroundApps count]) {
    [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"foreground:[%@]", -[NSArray componentsJoinedByString:](self->_foregroundApps, "componentsJoinedByString:", @","];
  }
  if ([(NSArray *)self->_obscuredApps count]) {
    [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"obscured:[%@]", -[NSArray componentsJoinedByString:](self->_obscuredApps, "componentsJoinedByString:", @","];
  }
  if ([(NSArray *)self->_transitioningApps count]) {
    [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"transitioning:[%@]", -[NSArray componentsJoinedByString:](self->_transitioningApps, "componentsJoinedByString:", @","];
  }
  if ([(NSArray *)self->_pipApps count]) {
    [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"pip:[%@]", -[NSArray componentsJoinedByString:](self->_pipApps, "componentsJoinedByString:", @","];
  }
  if (self->_onHomeScreen) {
    [v3 addObject:@"Home Screen"];
  }
  if (self->_onLockScreen) {
    [v3 addObject:@"Lock Screen"];
  }
  if (self->_siriVisible) {
    [v3 addObject:@"siri: 1"];
  }
  if (self->_paymentServiceVisible) {
    [v3 addObject:@"paymentService: 1"];
  }
  if (![v3 count]) {
    [v3 addObject:@"ništa"];
  }
  unint64_t displayType = self->_displayType;
  if (displayType <= 2) {
    [v3 insertObject:off_1E5C29288[displayType] atIndex:0];
  }
  if (self->_timestamp) {
    objc_msgSend(v3, "insertObject:atIndex:", objc_msgSend((id)sLayoutTimestampDateFormatter, "stringFromDate:"), 0);
  }
  return (id)[v3 componentsJoinedByString:@", "];
}

- (void)setTransitioningApps:(id)a3
{
}

- (void)setTimestamp:(id)a3
{
}

- (void)setSiriVisible:(BOOL)a3
{
  self->_siriVisible = a3;
}

- (void)setPipApps:(id)a3
{
}

- (void)setPaymentServiceVisible:(BOOL)a3
{
  self->_paymentServiceVisible = a3;
}

- (void)setOnLockScreen:(BOOL)a3
{
  self->_onLockScreen = a3;
}

- (void)setOnHomeScreen:(BOOL)a3
{
  self->_onHomeScreen = a3;
}

- (void)setObscuredApps:(id)a3
{
}

- (void)setForegroundApps:(id)a3
{
}

- (void)setDisplayType:(int64_t)a3
{
  self->_unint64_t displayType = a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDisplayLayout;
  [(FigCaptureDisplayLayout *)&v3 dealloc];
}

- (id)_init
{
  v4.receiver = self;
  v4.super_class = (Class)FigCaptureDisplayLayout;
  v2 = [(FigCaptureDisplayLayout *)&v4 init];
  if (v2)
  {
    v2->_foregroundApps = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2->_obscuredApps = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2->_transitioningApps = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2->_pipApps = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  return v2;
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (NSArray)foregroundApps
{
  return self->_foregroundApps;
}

- (NSArray)transitioningApps
{
  return self->_transitioningApps;
}

- (BOOL)isPaymentServiceVisible
{
  return self->_paymentServiceVisible;
}

- (NSArray)pipApps
{
  return self->_pipApps;
}

- (NSArray)obscuredApps
{
  return self->_obscuredApps;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    sLayoutTimestampDateFormatter = (uint64_t)v2;
    [v2 setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
  }
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (BOOL)isOnHomeScreen
{
  return self->_onHomeScreen;
}

- (BOOL)isOnLockScreen
{
  return self->_onLockScreen;
}

- (BOOL)isSiriVisible
{
  return self->_siriVisible;
}

@end