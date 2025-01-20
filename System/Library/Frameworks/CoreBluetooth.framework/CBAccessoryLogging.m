@interface CBAccessoryLogging
+ (id)getComponentNameFromProductID:(unint64_t)a3;
+ (id)getComponentNameFromRadarReason:(int)a3;
+ (id)getComponentVersionFromProductID:(unint64_t)a3;
+ (id)getComponentVersionFromRadarReason:(int)a3;
+ (id)getProductNameFromProductID:(unint64_t)a3;
+ (unint64_t)getComponentIDFromProductID:(unint64_t)a3;
+ (unint64_t)getComponentIDFromRadarReason:(int)a3;
@end

@implementation CBAccessoryLogging

+ (id)getProductNameFromProductID:(unint64_t)a3
{
  v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MobileBluetooth"];
  v5 = v4;
  unint64_t v6 = a3 - 8194;
  v7 = @"Beats Studio Pro";
  switch(v6)
  {
    case 0uLL:
      v10 = @"AIRPODS";
      v11 = @"AirPods";
      goto LABEL_25;
    case 1uLL:
      v10 = @"POWERBEATS3";
      v11 = @"Powerbeats³";
      goto LABEL_25;
    case 3uLL:
      v10 = @"BEATSX";
      v11 = @"Beatsˣ";
      goto LABEL_25;
    case 4uLL:
      v10 = @"SOLO3";
      v11 = @"Beats Solo³";
      goto LABEL_25;
    case 7uLL:
      v10 = @"BEATSSTUDIO3";
      v11 = @"Beats Studio³";
      goto LABEL_25;
    case 8uLL:
    case 0x1DuLL:

      v8 = @"AirPods Max";
      return v8;
    case 9uLL:
      v10 = @"POWERBEATSPRO";
      v11 = @"PowerBeats Pro";
      goto LABEL_25;
    case 0xAuLL:
      v10 = @"SOLOPRO";
      v11 = @"Beats Solo Pro";
LABEL_25:
      uint64_t v12 = [v4 localizedStringForKey:v10 value:v11 table:0];

      v8 = (__CFString *)v12;
      return v8;
    case 0xBuLL:

      v8 = @"Powerbeats 4";
      return v8;
    case 0xCuLL:
    case 0x12uLL:
    case 0x22uLL:

      v8 = @"AirPods Pro";
      return v8;
    case 0xDuLL:

      v8 = @"AirPods 2";
      return v8;
    case 0xEuLL:

      v8 = @"Beats Flex";
      return v8;
    case 0xFuLL:

      v8 = @"Beats Studio Buds";
      return v8;
    case 0x11uLL:

      v8 = @"AirPods 3";
      return v8;
    case 0x13uLL:
    case 0x16uLL:
    case 0x1AuLL:

      v8 = @"AirPods Case";
      return v8;
    case 0x14uLL:

      v8 = @"Beats Studio Buds +";
      return v8;
    case 0x15uLL:
      goto LABEL_3;
    case 0x17uLL:
    case 0x19uLL:
    case 0x1CuLL:
    case 0x1EuLL:
      v7 = @"AirPods";
LABEL_3:

      v8 = v7;
      break;
    default:

      v8 = @"Unknown";
      break;
  }
  return v8;
}

+ (unint64_t)getComponentIDFromProductID:(unint64_t)a3
{
  if (a3 - 8194 > 0x22) {
    return 1210810;
  }
  else {
    return qword_1ABA8FB88[a3 - 8194];
  }
}

+ (id)getComponentNameFromProductID:(unint64_t)a3
{
  if (a3 - 8194 > 0x22) {
    return @"AudioProducts FW";
  }
  else {
    return off_1E5E31F30[a3 - 8194];
  }
}

+ (id)getComponentVersionFromProductID:(unint64_t)a3
{
  if (a3 - 8194 > 0x22) {
    return @"All";
  }
  else {
    return off_1E5E32048[a3 - 8194];
  }
}

+ (unint64_t)getComponentIDFromRadarReason:(int)a3
{
  if (a3 == 5) {
    return 1046269;
  }
  else {
    return 1210810;
  }
}

+ (id)getComponentNameFromRadarReason:(int)a3
{
  if (a3 == 5) {
    return @"SpockEngine";
  }
  else {
    return @"AudioProducts FW";
  }
}

+ (id)getComponentVersionFromRadarReason:(int)a3
{
  if (a3 == 5) {
    return @"New Bugs";
  }
  else {
    return @"All";
  }
}

@end