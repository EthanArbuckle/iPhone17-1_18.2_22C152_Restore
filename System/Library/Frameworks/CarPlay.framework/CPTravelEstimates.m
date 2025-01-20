@interface CPTravelEstimates
+ (BOOL)supportsSecureCoding;
+ (id)_greenColor;
+ (id)_orangeColor;
+ (id)_redColor;
+ (id)timeRemainingColorForColor:(unint64_t)a3;
- (CPTravelEstimates)initWithCoder:(id)a3;
- (CPTravelEstimates)initWithDistanceRemaining:(NSMeasurement *)distance timeRemaining:(NSTimeInterval)time;
- (CPTravelEstimates)initWithDistanceRemaining:(id)a3 distanceRemainingToDisplay:(id)a4 timeRemaining:(double)a5;
- (NSMeasurement)distanceRemaining;
- (NSMeasurement)distanceRemainingToDisplay;
- (NSTimeInterval)timeRemaining;
- (id)_init;
- (id)description;
- (unint64_t)timeRemainingColor;
- (void)encodeWithCoder:(id)a3;
- (void)setTimeRemainingColor:(unint64_t)a3;
@end

@implementation CPTravelEstimates

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)timeRemainingColorForColor:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v3 = [a1 _greenColor];
      break;
    case 2uLL:
      v3 = [a1 _orangeColor];
      break;
    case 3uLL:
      v3 = [a1 _redColor];
      break;
    default:
      v3 = [MEMORY[0x263F1C550] labelColor];
      break;
  }

  return v3;
}

+ (id)_greenColor
{
  return (id)[MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_1];
}

id __32__CPTravelEstimates__greenColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.298039216;
    double v3 = 0.850980392;
    double v4 = 0.392156863;
  }
  else
  {
    double v2 = 0.121568627;
    double v3 = 0.4;
    double v4 = 0.168627451;
  }
  v5 = [MEMORY[0x263F1C550] colorWithRed:v2 green:v3 blue:v4 alpha:1.0];

  return v5;
}

+ (id)_redColor
{
  return (id)[MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_12];
}

id __30__CPTravelEstimates__redColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.48627451;
    double v3 = 0.458823529;
    double v4 = 1.0;
  }
  else
  {
    double v4 = 0.670588235;
    double v2 = 0.129411765;
    double v3 = 0.101960784;
  }
  v5 = [MEMORY[0x263F1C550] colorWithRed:v4 green:v2 blue:v3 alpha:1.0];

  return v5;
}

+ (id)_orangeColor
{
  return (id)[MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_14];
}

id __33__CPTravelEstimates__orangeColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.584313725;
    double v3 = 1.0;
  }
  else
  {
    double v3 = 0.521568627;
    double v2 = 0.290196078;
  }
  double v4 = [MEMORY[0x263F1C550] colorWithRed:v3 green:v2 blue:0.0 alpha:1.0];

  return v4;
}

- (id)_init
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  double v4 = [MEMORY[0x263F08CE8] meters];
  v5 = (void *)[v3 initWithDoubleValue:v4 unit:0.0];
  v6 = [(CPTravelEstimates *)self initWithDistanceRemaining:v5 timeRemaining:0.0];

  return v6;
}

- (CPTravelEstimates)initWithDistanceRemaining:(NSMeasurement *)distance timeRemaining:(NSTimeInterval)time
{
  v6 = distance;
  v13.receiver = self;
  v13.super_class = (Class)CPTravelEstimates;
  v7 = [(CPTravelEstimates *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [(NSMeasurement *)v6 copy];
    distanceRemaining = v7->_distanceRemaining;
    v7->_distanceRemaining = (NSMeasurement *)v8;

    uint64_t v10 = [(NSMeasurement *)v6 copy];
    distanceRemainingToDisplay = v7->_distanceRemainingToDisplay;
    v7->_distanceRemainingToDisplay = (NSMeasurement *)v10;

    v7->_timeRemaining = time;
  }

  return v7;
}

- (CPTravelEstimates)initWithDistanceRemaining:(id)a3 distanceRemainingToDisplay:(id)a4 timeRemaining:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CPTravelEstimates;
  uint64_t v10 = [(CPTravelEstimates *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    distanceRemaining = v10->_distanceRemaining;
    v10->_distanceRemaining = (NSMeasurement *)v11;

    uint64_t v13 = [v9 copy];
    distanceRemainingToDisplay = v10->_distanceRemainingToDisplay;
    v10->_distanceRemainingToDisplay = (NSMeasurement *)v13;

    v10->_timeRemaining = a5;
  }

  return v10;
}

- (CPTravelEstimates)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPTravelEstimates *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPTravelEstimatesDistanceRemainingKey"];
    distanceRemaining = v5->_distanceRemaining;
    v5->_distanceRemaining = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPTravelEstimatesDistanceRemainingDisplayKey"];
    distanceRemainingToDisplay = v5->_distanceRemainingToDisplay;
    v5->_distanceRemainingToDisplay = (NSMeasurement *)v8;

    [v4 decodeDoubleForKey:@"kCPTravelEstimatesTimeRemainingKey"];
    v5->_timeRemaining = v10;
    v5->_timeRemainingColor = [v4 decodeIntegerForKey:@"kCPTravelEstimatesTimeRemainingColorKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(CPTravelEstimates *)self distanceRemaining];
  [v6 encodeObject:v4 forKey:@"kCPTravelEstimatesDistanceRemainingKey"];

  v5 = [(CPTravelEstimates *)self distanceRemainingToDisplay];
  [v6 encodeObject:v5 forKey:@"kCPTravelEstimatesDistanceRemainingDisplayKey"];

  [(CPTravelEstimates *)self timeRemaining];
  objc_msgSend(v6, "encodeDouble:forKey:", @"kCPTravelEstimatesTimeRemainingKey");
  objc_msgSend(v6, "encodeInteger:forKey:", -[CPTravelEstimates timeRemainingColor](self, "timeRemainingColor"), @"kCPTravelEstimatesTimeRemainingColorKey");
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CPTravelEstimates;
  id v4 = [(CPTravelEstimates *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ {distanceRemaining: %@, distanceRemainingToDisplay: %@, timeRemaining: %f}", v4, self->_distanceRemaining, self->_distanceRemainingToDisplay, *(void *)&self->_timeRemaining];

  return v5;
}

- (NSMeasurement)distanceRemainingToDisplay
{
  return self->_distanceRemainingToDisplay;
}

- (NSMeasurement)distanceRemaining
{
  return self->_distanceRemaining;
}

- (NSTimeInterval)timeRemaining
{
  return self->_timeRemaining;
}

- (unint64_t)timeRemainingColor
{
  return self->_timeRemainingColor;
}

- (void)setTimeRemainingColor:(unint64_t)a3
{
  self->_timeRemainingColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceRemaining, 0);

  objc_storeStrong((id *)&self->_distanceRemainingToDisplay, 0);
}

@end