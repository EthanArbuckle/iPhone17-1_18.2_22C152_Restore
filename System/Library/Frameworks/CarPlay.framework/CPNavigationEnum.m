@interface CPNavigationEnum
+ (id)stringForEnum:(int64_t)a3 navEnum:(unsigned __int8)a4;
@end

@implementation CPNavigationEnum

+ (id)stringForEnum:(int64_t)a3 navEnum:(unsigned __int8)a4
{
  v4 = 0;
  switch(a4)
  {
    case 0u:
      break;
    case 1u:
      v4 = NSStringFromCPManeuverType(a3);
      break;
    case 2u:
      v4 = NSStringFromCPJunctionType(a3);
      break;
    case 3u:
      v4 = NSStringFromCPTrafficSide(a3);
      break;
    case 4u:
      v4 = NSStringFromCPLaneStatus(a3);
      break;
    case 5u:
      v4 = NSStringFromCPDistanceUnits(a3);
      break;
    case 6u:
      v4 = NSStringFromCPGuidanceState(a3);
      break;
    case 7u:
      v4 = NSStringFromCPManeuverState(a3);
      break;
    case 8u:
      v4 = NSStringFromCPStopType(a3);
      break;
    case 9u:
      v4 = NSStringFromCPChargingStationConnectorType(a3);
      break;
    default:
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"ERROR - %ld %d", a3, a4);
      break;
  }

  return v4;
}

@end