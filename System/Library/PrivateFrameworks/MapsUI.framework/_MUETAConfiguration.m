@interface _MUETAConfiguration
+ (id)addStopConfigurationETAStringForTravelTime:(double)a3;
+ (id)configurationForEtaStringFor:(unint64_t)a3 travelTime:(double)a4 hasSecondaryController:(BOOL)a5 isStackingButtons:(BOOL)a6;
+ (id)rerouteConfigurationETAStringForTravelTime:(double)a3;
- (NSString)etaString;
- (NSString)symbolName;
- (void)setEtaString:(id)a3;
- (void)setSymbolName:(id)a3;
@end

@implementation _MUETAConfiguration

+ (id)rerouteConfigurationETAStringForTravelTime:(double)a3
{
  v4 = objc_alloc_init(_MUETAConfiguration);
  v5 = NSString;
  v6 = _MULocalizedStringFromThisBundle(@"Reroute ETA button title [Placecard]");
  v7 = objc_msgSend(NSString, "_navigation_stringWithSeconds:andAbbreviationType:", (unint64_t)a3, 1);
  v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  [(_MUETAConfiguration *)v4 setEtaString:v8];

  return v4;
}

+ (id)addStopConfigurationETAStringForTravelTime:(double)a3
{
  v4 = objc_alloc_init(_MUETAConfiguration);
  if (a3 == 0.0)
  {
    v5 = _MULocalizedStringFromThisBundle(@"Add Stop [Placecard]");
    [(_MUETAConfiguration *)v4 setEtaString:v5];
  }
  else
  {
    v6 = NSString;
    v5 = _MULocalizedStringFromThisBundle(@"Add Stop With Detour Time [Placecard]");
    v7 = objc_msgSend(NSString, "_navigation_stringWithSeconds:andAbbreviationType:", (unint64_t)a3, 1);
    v8 = objc_msgSend(v6, "stringWithFormat:", v5, v7);
    [(_MUETAConfiguration *)v4 setEtaString:v8];
  }
  return v4;
}

+ (id)configurationForEtaStringFor:(unint64_t)a3 travelTime:(double)a4 hasSecondaryController:(BOOL)a5 isStackingButtons:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v10 = 0;
  switch(a3)
  {
    case 1uLL:
      v10 = @"car.fill";
      break;
    case 2uLL:
      v10 = @"figure.walk";
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      v10 = @"tram.fill";
      break;
    case 8uLL:
      v10 = @"bicycle";
      break;
    default:
      if (a3 == 0xFFFFFFF) {
        v10 = @"arrow.triangle.turn.up.right.circle.fill";
      }
      else {
        v10 = 0;
      }
      break;
  }
  v11 = objc_alloc_init(_MUETAConfiguration);
  [(_MUETAConfiguration *)v11 setSymbolName:v10];
  if (a3 == 0xFFFFFFF || a4 == 0.0)
  {
    uint64_t v12 = _MULocalizedStringFromThisBundle(@"Directions [Placecard]");
  }
  else
  {
    if (a4 <= 0.0) {
      goto LABEL_15;
    }
    uint64_t v12 = +[MUPlaceHeaderETAFormatter etaStringFromSeconds:(unint64_t)a4 isRenderingInFullWidth:!v7 | v6];
  }
  v13 = (void *)v12;
  [(_MUETAConfiguration *)v11 setEtaString:v12];

LABEL_15:
  return v11;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (NSString)etaString
{
  return self->_etaString;
}

- (void)setEtaString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaString, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end