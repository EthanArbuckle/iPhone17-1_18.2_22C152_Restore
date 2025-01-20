@interface MUPlaceVerticalCardConfiguration
+ (id)developerPlaceCardConfiguration;
+ (id)plainConfiguration;
+ (id)separatorConfiguration;
- (BOOL)isDeveloperPlaceCard;
- (BOOL)showSeparators;
- (NSDirectionalEdgeInsets)bottomSeparatorInset;
- (void)setBottomSeparatorInset:(NSDirectionalEdgeInsets)a3;
- (void)setDeveloperPlaceCard:(BOOL)a3;
- (void)setShowSeparators:(BOOL)a3;
@end

@implementation MUPlaceVerticalCardConfiguration

+ (id)plainConfiguration
{
  v2 = objc_alloc_init(MUPlaceVerticalCardConfiguration);
  [(MUPlaceVerticalCardConfiguration *)v2 setShowSeparators:0];
  return v2;
}

+ (id)separatorConfiguration
{
  v2 = objc_alloc_init(MUPlaceVerticalCardConfiguration);
  [(MUPlaceVerticalCardConfiguration *)v2 setShowSeparators:1];
  if (MapKitIdiomIsMacCatalyst()) {
    double v3 = 16.0;
  }
  else {
    double v3 = 0.0;
  }
  -[MUPlaceVerticalCardConfiguration setBottomSeparatorInset:](v2, "setBottomSeparatorInset:", 0.0, 16.0, 0.0, v3);
  return v2;
}

+ (id)developerPlaceCardConfiguration
{
  v2 = [a1 plainConfiguration];
  [v2 setDeveloperPlaceCard:1];
  return v2;
}

- (BOOL)showSeparators
{
  return self->_showSeparators;
}

- (void)setShowSeparators:(BOOL)a3
{
  self->_showSeparators = a3;
}

- (NSDirectionalEdgeInsets)bottomSeparatorInset
{
  double top = self->_bottomSeparatorInset.top;
  double leading = self->_bottomSeparatorInset.leading;
  double bottom = self->_bottomSeparatorInset.bottom;
  double trailing = self->_bottomSeparatorInset.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setBottomSeparatorInset:(NSDirectionalEdgeInsets)a3
{
  self->_bottomSeparatorInset = a3;
}

- (BOOL)isDeveloperPlaceCard
{
  return self->_developerPlaceCard;
}

- (void)setDeveloperPlaceCard:(BOOL)a3
{
  self->_developerPlaceCard = a3;
}

@end