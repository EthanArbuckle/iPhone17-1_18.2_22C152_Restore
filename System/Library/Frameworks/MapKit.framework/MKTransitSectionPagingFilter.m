@interface MKTransitSectionPagingFilter
+ (id)defaultFilterForDepartures;
+ (id)defaultFilterForInactiveLines;
+ (unint64_t)_kNumLinesFallbackValue;
- (BOOL)limitNumLines;
- (unint64_t)numLinesFallbackThreshold;
- (unint64_t)numLinesFallbackValue;
- (void)setLimitNumLines:(BOOL)a3;
- (void)setNumLinesFallbackThreshold:(unint64_t)a3;
- (void)setNumLinesFallbackValue:(unint64_t)a3;
@end

@implementation MKTransitSectionPagingFilter

+ (id)defaultFilterForDepartures
{
  v3 = objc_alloc_init(MKTransitSectionPagingFilter);
  [(MKTransitSectionPagingFilter *)v3 setLimitNumLines:1];
  -[MKTransitSectionPagingFilter setNumLinesFallbackThreshold:](v3, "setNumLinesFallbackThreshold:", [a1 _kMaxLinesInSectionBeforePage]);
  -[MKTransitSectionPagingFilter setNumLinesFallbackValue:](v3, "setNumLinesFallbackValue:", [a1 _kNumLinesFallbackValue]);

  return v3;
}

+ (id)defaultFilterForInactiveLines
{
  v3 = objc_alloc_init(MKTransitSectionPagingFilter);
  [(MKTransitSectionPagingFilter *)v3 setLimitNumLines:1];
  -[MKTransitSectionPagingFilter setNumLinesFallbackThreshold:](v3, "setNumLinesFallbackThreshold:", [a1 _kMaxLinesInSectionBeforePage]);
  -[MKTransitSectionPagingFilter setNumLinesFallbackValue:](v3, "setNumLinesFallbackValue:", [a1 _kNumLinesFallbackValue]);

  return v3;
}

+ (unint64_t)_kNumLinesFallbackValue
{
  return -1;
}

- (BOOL)limitNumLines
{
  return self->_limitNumLines;
}

- (void)setLimitNumLines:(BOOL)a3
{
  self->_limitNumLines = a3;
}

- (unint64_t)numLinesFallbackThreshold
{
  return self->_numLinesFallbackThreshold;
}

- (void)setNumLinesFallbackThreshold:(unint64_t)a3
{
  self->_numLinesFallbackThreshold = a3;
}

- (unint64_t)numLinesFallbackValue
{
  return self->_numLinesFallbackValue;
}

- (void)setNumLinesFallbackValue:(unint64_t)a3
{
  self->_numLinesFallbackValue = a3;
}

@end