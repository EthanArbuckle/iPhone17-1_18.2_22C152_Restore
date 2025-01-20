@interface MUETAHelper
+ (id)axIDStringForTransportType:(unint64_t)a3;
+ (id)axLabelForTransportType:(unint64_t)a3;
+ (id)etaSymbolForTransportType:(unint64_t)a3;
+ (int)analyticsActionForTransportType:(unint64_t)a3;
@end

@implementation MUETAHelper

+ (id)etaSymbolForTransportType:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return @"arrow.triangle.turn.up.right.circle.fill";
  }
  else {
    return off_1E5750C18[a3 - 1];
  }
}

+ (int)analyticsActionForTransportType:(unint64_t)a3
{
  int result = 17099;
  switch(a3)
  {
    case 1uLL:
      int result = 11012;
      break;
    case 2uLL:
      int result = 11013;
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return result;
    case 4uLL:
      int result = 11014;
      break;
    case 8uLL:
      int result = 11026;
      break;
    default:
      if (a3 == 0xFFFFFFF) {
        int result = 6003;
      }
      else {
        int result = 17099;
      }
      break;
  }
  return result;
}

+ (id)axIDStringForTransportType:(unint64_t)a3
{
  id result = 0;
  switch(a3)
  {
    case 1uLL:
      id result = @"Driving";
      break;
    case 2uLL:
      id result = @"Walking";
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return result;
    case 4uLL:
      id result = @"Transit";
      break;
    case 8uLL:
      id result = @"Cycling";
      break;
    default:
      if (a3 == 0xFFFFFFF) {
        id result = @"Any";
      }
      else {
        id result = 0;
      }
      break;
  }
  return result;
}

+ (id)axLabelForTransportType:(unint64_t)a3
{
  unint64_t v4 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v4) & 1) != 0)
  {
    _MULocalizedStringFromThisBundle(off_1E5750C58[v4]);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1EE3BF360;
  }
  return v5;
}

@end