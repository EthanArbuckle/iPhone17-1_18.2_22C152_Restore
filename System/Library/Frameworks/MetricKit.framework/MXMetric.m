@interface MXMetric
+ (BOOL)supportsSecureCoding;
- (MXMetric)init;
- (MXMetric)initWithCoder:(id)a3;
- (NSData)JSONRepresentation;
- (NSMeasurementFormatter)measurementFormatter;
- (id)toDictionary;
- (void)setMeasurementFormatter:(id)a3;
@end

@implementation MXMetric

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MXMetric)init
{
  v8.receiver = self;
  v8.super_class = (Class)MXMetric;
  v2 = [(MXMetric *)&v8 init];
  if (v2)
  {
    v3 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x263F08988]);
    measurementFormatter = v2->_measurementFormatter;
    v2->_measurementFormatter = v3;

    v5 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSMeasurementFormatter *)v2->_measurementFormatter setLocale:v5];

    [(NSMeasurementFormatter *)v2->_measurementFormatter setUnitOptions:1];
    [(NSMeasurementFormatter *)v2->_measurementFormatter setUnitStyle:2];
    v6 = [(NSMeasurementFormatter *)v2->_measurementFormatter numberFormatter];
    [v6 setMaximumFractionDigits:0];
  }
  return v2;
}

- (MXMetric)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MXMetric;
  v3 = [(MXMetric *)&v9 init];
  if (v3)
  {
    v4 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x263F08988]);
    measurementFormatter = v3->_measurementFormatter;
    v3->_measurementFormatter = v4;

    v6 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSMeasurementFormatter *)v3->_measurementFormatter setLocale:v6];

    [(NSMeasurementFormatter *)v3->_measurementFormatter setUnitOptions:1];
    [(NSMeasurementFormatter *)v3->_measurementFormatter setUnitStyle:2];
    v7 = [(NSMeasurementFormatter *)v3->_measurementFormatter numberFormatter];
    [v7 setMaximumFractionDigits:0];
  }
  return v3;
}

- (id)toDictionary
{
  return (id)MEMORY[0x263EFFA78];
}

- (NSData)JSONRepresentation
{
  v2 = [(MXMetric *)self toDictionary];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    id v5 = 0;
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:1 error:&v5];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSMeasurementFormatter)measurementFormatter
{
  return (NSMeasurementFormatter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMeasurementFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end