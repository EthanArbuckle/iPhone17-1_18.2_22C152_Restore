@interface WKInterfaceObjectClassWithType
@end

@implementation WKInterfaceObjectClassWithType

void ___WKInterfaceObjectClassWithType_block_invoke()
{
  v3[12] = *MEMORY[0x263EF8340];
  v2[0] = @"button";
  v3[0] = objc_opt_class();
  v2[1] = @"switch";
  v3[1] = objc_opt_class();
  v2[2] = @"image";
  v3[2] = objc_opt_class();
  v2[3] = @"label";
  v3[3] = objc_opt_class();
  v2[4] = @"timer";
  v3[4] = objc_opt_class();
  v2[5] = @"date";
  v3[5] = objc_opt_class();
  v2[6] = @"list";
  v3[6] = objc_opt_class();
  v2[7] = @"table";
  v3[7] = objc_opt_class();
  v2[8] = @"group";
  v3[8] = objc_opt_class();
  v2[9] = @"map";
  v3[9] = objc_opt_class();
  v2[10] = @"slider";
  v3[10] = objc_opt_class();
  v2[11] = @"separator";
  v3[11] = objc_opt_class();
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:12];
  v1 = (void *)_WKInterfaceObjectClassWithType___interfaceClasses;
  _WKInterfaceObjectClassWithType___interfaceClasses = v0;
}

@end