@interface MUDirectionsActionRowItemViewModel
- (BOOL)isEnabled;
- (MUDirectionsActionRowItemViewModel)initWithETAProvider:(id)a3;
- (id)accessibilityIdentifier;
- (id)preferredBackgroundColor;
- (id)preferredTintColor;
- (id)symbolName;
- (id)titleText;
@end

@implementation MUDirectionsActionRowItemViewModel

- (MUDirectionsActionRowItemViewModel)initWithETAProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUDirectionsActionRowItemViewModel;
  v6 = [(MUActionRowItemViewModel *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_etaProvider, a3);
    [(MKETAProvider *)v7->_etaProvider addObserver:v7];
  }

  return v7;
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)symbolName
{
  uint64_t v2 = [(MKETAProvider *)self->_etaProvider etaTransportType];
  return +[MUETAHelper etaSymbolForTransportType:v2];
}

- (id)titleText
{
  [(MKETAProvider *)self->_etaProvider etaTravelTime];
  if (v3 <= 0.0)
  {
    v7 = _MULocalizedStringFromThisBundle(@"Directions [Placecard]");
  }
  else
  {
    [(MKETAProvider *)self->_etaProvider etaTravelTime];
    id v5 = +[MUPlaceHeaderETAFormatter etaStringFromSeconds:(unint64_t)v4 isRenderingInFullWidth:0];
    if ([v5 length])
    {
      id v6 = v5;
    }
    else
    {
      _MULocalizedStringFromThisBundle(@"Directions [Placecard]");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
  }
  return v7;
}

- (id)preferredTintColor
{
  return +[MUInfoCardStyle directionsButtonTintColor];
}

- (id)preferredBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemBlueColor];
}

- (id)accessibilityIdentifier
{
  return (id)[@"ActionRowItemType" stringByAppendingString:@"Directions"];
}

- (void).cxx_destruct
{
}

@end