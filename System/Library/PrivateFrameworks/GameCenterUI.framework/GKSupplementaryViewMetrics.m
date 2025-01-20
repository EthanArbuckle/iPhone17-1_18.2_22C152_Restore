@interface GKSupplementaryViewMetrics
+ (id)supplementaryMetrics;
- (BOOL)isHidden;
- (BOOL)shouldPin;
- (BOOL)shouldPinGlobal;
- (BOOL)shouldUseGlobalIndexing;
- (CGSize)sizeForCollectionView:(id)a3;
- (Class)reusableViewClass;
- (GKSupplementaryViewMetrics)init;
- (NSString)kind;
- (SEL)configurator;
- (_NSRange)globalSectionRange;
- (double)desiredHeight;
- (double)desiredWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localDescription;
- (id)target;
- (int64_t)animateWithSection;
- (void)setAnimateWithSection:(int64_t)a3;
- (void)setConfigurator:(SEL)a3;
- (void)setDesiredHeight:(double)a3;
- (void)setDesiredWidth:(double)a3;
- (void)setGlobalSectionRange:(_NSRange)a3;
- (void)setHidden:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setReusableViewClass:(Class)a3;
- (void)setShouldPin:(BOOL)a3;
- (void)setShouldPinGlobal:(BOOL)a3;
- (void)setShouldUseGlobalIndexing:(BOOL)a3;
- (void)setTarget:(id)a3;
@end

@implementation GKSupplementaryViewMetrics

+ (id)supplementaryMetrics
{
  v2 = objc_alloc_init(GKSupplementaryViewMetrics);

  return v2;
}

- (GKSupplementaryViewMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKSupplementaryViewMetrics;
  result = [(GKSupplementaryViewMetrics *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_desiredWidth = xmmword_1AF7CABD0;
    result->_animateWithSection = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    [v4 setDesiredWidth:self->_desiredWidth];
    [v5 setDesiredHeight:self->_desiredHeight];
    [v5 setShouldPin:self->_shouldPin];
    [v5 setShouldPinGlobal:self->_shouldPinGlobal];
    [v5 setKind:self->_kind];
    [v5 setReusableViewClass:self->_reusableViewClass];
    if (self->_configurator) {
      SEL configurator = self->_configurator;
    }
    else {
      SEL configurator = 0;
    }
    [v5 setConfigurator:configurator];
    [v5 setTarget:self->_target];
    [v5 setHidden:self->_hidden];
    objc_msgSend(v5, "setGlobalSectionRange:", self->_globalSectionRange.location, self->_globalSectionRange.length);
    [v5 setAnimateWithSection:self->_animateWithSection];
    [v5 setShouldUseGlobalIndexing:self->_shouldUseGlobalIndexing];
  }
  return v5;
}

- (id)localDescription
{
  if (self->_desiredWidth == 1.79769313e308)
  {
    objc_super v3 = @"*";
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithDouble:");
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_desiredHeight == 1.79769313e308)
  {
    id v4 = @"*";
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithDouble:");
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_target)
  {
    v5 = [NSString stringWithFormat:@" <%@:%p>", objc_opt_class(), self->_target];
  }
  else
  {
    v5 = &stru_1F07B2408;
  }
  if (self->_reusableViewClass)
  {
    v6 = [NSString stringWithFormat:@" %@", self->_reusableViewClass];
  }
  else
  {
    v6 = &stru_1F07B2408;
  }
  SEL configurator = self->_configurator;
  if (configurator)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %s", sel_getName(configurator));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1F07B2408;
  }
  v9 = NSString;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = _gkRangeFromToDescription(@" sect:", self->_globalSectionRange.location, self->_globalSectionRange.length);
  v12 = (void *)v11;
  if (self->_shouldPin) {
    v13 = @" pin";
  }
  else {
    v13 = &stru_1F07B2408;
  }
  if (self->_hidden) {
    v14 = @" hidden";
  }
  else {
    v14 = &stru_1F07B2408;
  }
  v15 = [v9 stringWithFormat:@"<%@:%p%@ %@%@ size:{%@, %@} kind:%@%@%@%@", v10, self, v11, v13, v14, v3, v4, self->_kind, v6, v5, v8];

  return v15;
}

- (CGSize)sizeForCollectionView:(id)a3
{
  double desiredWidth = self->_desiredWidth;
  double desiredHeight = self->_desiredHeight;
  [a3 bounds];
  if (desiredWidth == 1.79769313e308) {
    double v7 = v5;
  }
  else {
    double v7 = desiredWidth;
  }
  if (desiredHeight == 1.79769313e308) {
    double v8 = v6;
  }
  else {
    double v8 = desiredHeight;
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)desiredWidth
{
  return self->_desiredWidth;
}

- (void)setDesiredWidth:(double)a3
{
  self->_double desiredWidth = a3;
}

- (double)desiredHeight
{
  return self->_desiredHeight;
}

- (void)setDesiredHeight:(double)a3
{
  self->_double desiredHeight = a3;
}

- (BOOL)shouldPin
{
  return self->_shouldPin;
}

- (void)setShouldPin:(BOOL)a3
{
  self->_shouldPin = a3;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (Class)reusableViewClass
{
  return self->_reusableViewClass;
}

- (void)setReusableViewClass:(Class)a3
{
  self->_reusableViewClass = a3;
}

- (SEL)configurator
{
  if (self->_configurator) {
    return self->_configurator;
  }
  else {
    return 0;
  }
}

- (void)setConfigurator:(SEL)a3
{
  if (a3) {
    objc_super v3 = a3;
  }
  else {
    objc_super v3 = 0;
  }
  self->_SEL configurator = v3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  self->_target = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)shouldUseGlobalIndexing
{
  return self->_shouldUseGlobalIndexing;
}

- (void)setShouldUseGlobalIndexing:(BOOL)a3
{
  self->_shouldUseGlobalIndexing = a3;
}

- (BOOL)shouldPinGlobal
{
  return self->_shouldPinGlobal;
}

- (void)setShouldPinGlobal:(BOOL)a3
{
  self->_shouldPinGlobal = a3;
}

- (_NSRange)globalSectionRange
{
  NSUInteger length = self->_globalSectionRange.length;
  NSUInteger location = self->_globalSectionRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setGlobalSectionRange:(_NSRange)a3
{
  self->_globalSectionRange = a3;
}

- (int64_t)animateWithSection
{
  return self->_animateWithSection;
}

- (void)setAnimateWithSection:(int64_t)a3
{
  self->_animateWithSection = a3;
}

- (void).cxx_destruct
{
}

@end