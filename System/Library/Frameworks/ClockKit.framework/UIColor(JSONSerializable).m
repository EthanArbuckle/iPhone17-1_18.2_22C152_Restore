@interface UIColor(JSONSerializable)
- (id)JSONObjectRepresentation;
- (uint64_t)initWithJSONObjectRepresentation:()JSONSerializable;
@end

@implementation UIColor(JSONSerializable)

- (uint64_t)initWithJSONObjectRepresentation:()JSONSerializable
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a dictionary. Invalid value: %@", v3 format];
  }
  v4 = [v3 objectForKeyedSubscript:@"red"];
  v5 = [v3 objectForKeyedSubscript:@"green"];
  v6 = [v3 objectForKeyedSubscript:@"blue"];
  v7 = [v3 objectForKeyedSubscript:@"alpha"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"red", v4 format];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"green", v5 format];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"blue", v6 format];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"alpha", v7 format];
  }
  [v4 floatValue];
  double v9 = v8;
  [v5 floatValue];
  double v11 = v10;
  [v6 floatValue];
  double v13 = v12;
  [v7 floatValue];
  uint64_t v15 = [a1 initWithRed:v9 green:v11 blue:v13 alpha:v14];

  return v15;
}

- (id)JSONObjectRepresentation
{
  v12[4] = *MEMORY[0x263EF8340];
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  [a1 getRed:&v10 green:&v9 blue:&v8 alpha:&v7];
  v11[0] = @"red";
  v1 = [NSNumber numberWithDouble:v10];
  v12[0] = v1;
  v11[1] = @"green";
  v2 = [NSNumber numberWithDouble:v9];
  v12[1] = v2;
  v11[2] = @"blue";
  id v3 = [NSNumber numberWithDouble:v8];
  v12[2] = v3;
  v11[3] = @"alpha";
  v4 = [NSNumber numberWithDouble:v7];
  v12[3] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v5;
}

@end