@interface MXDiagnostic
+ (BOOL)supportsSecureCoding;
- (MXDiagnostic)initWithCoder:(id)a3;
- (MXDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4;
- (MXDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 andPID:(int)a6;
- (MXMetaData)metaData;
- (NSArray)signpostData;
- (NSData)JSONRepresentation;
- (NSMeasurementFormatter)measurementFormatter;
- (NSString)applicationVersion;
- (id)toDictionary;
- (int)pid;
- (void)encodeWithCoder:(id)a3;
- (void)setMeasurementFormatter:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setPid:(int)a3;
- (void)setSignpostData:(id)a3;
@end

@implementation MXDiagnostic

- (MXDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MXDiagnostic;
  v9 = [(MXDiagnostic *)&v16 init];
  if (!v9) {
    goto LABEL_5;
  }
  v10 = 0;
  if (v7 && v8)
  {
    v11 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x263F08988]);
    measurementFormatter = v9->_measurementFormatter;
    v9->_measurementFormatter = v11;

    v13 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSMeasurementFormatter *)v9->_measurementFormatter setLocale:v13];

    [(NSMeasurementFormatter *)v9->_measurementFormatter setUnitOptions:1];
    [(NSMeasurementFormatter *)v9->_measurementFormatter setUnitStyle:2];
    v14 = [(NSMeasurementFormatter *)v9->_measurementFormatter numberFormatter];
    [v14 setMaximumFractionDigits:0];

    objc_storeStrong((id *)&v9->_metaData, a3);
    objc_storeStrong((id *)&v9->_applicationVersion, a4);
LABEL_5:
    v10 = v9;
  }

  return v10;
}

- (MXDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 andPID:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MXDiagnostic;
  v14 = [(MXDiagnostic *)&v21 init];
  if (!v14) {
    goto LABEL_5;
  }
  v15 = 0;
  if (v11 && v12)
  {
    objc_super v16 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x263F08988]);
    measurementFormatter = v14->_measurementFormatter;
    v14->_measurementFormatter = v16;

    v18 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSMeasurementFormatter *)v14->_measurementFormatter setLocale:v18];

    [(NSMeasurementFormatter *)v14->_measurementFormatter setUnitOptions:1];
    [(NSMeasurementFormatter *)v14->_measurementFormatter setUnitStyle:2];
    v19 = [(NSMeasurementFormatter *)v14->_measurementFormatter numberFormatter];
    [v19 setMaximumFractionDigits:0];

    objc_storeStrong((id *)&v14->_metaData, a3);
    objc_storeStrong((id *)&v14->_applicationVersion, a4);
    objc_storeStrong((id *)&v14->_signpostData, a5);
    v14->_pid = a6;
LABEL_5:
    v15 = v14;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  metaData = self->_metaData;
  id v5 = a3;
  [v5 encodeObject:metaData forKey:@"diagnosticMetaData"];
  [v5 encodeObject:self->_applicationVersion forKey:@"appVersion"];
  [v5 encodeObject:self->_signpostData forKey:@"signpostData"];
  id v6 = [NSNumber numberWithInt:self->_pid];
  [v5 encodeObject:v6 forKey:@"pid"];
}

- (MXDiagnostic)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MXDiagnostic;
  id v5 = [(MXDiagnostic *)&v21 init];
  if (v5)
  {
    id v6 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x263F08988]);
    measurementFormatter = v5->_measurementFormatter;
    v5->_measurementFormatter = v6;

    id v8 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSMeasurementFormatter *)v5->_measurementFormatter setLocale:v8];

    [(NSMeasurementFormatter *)v5->_measurementFormatter setUnitOptions:1];
    [(NSMeasurementFormatter *)v5->_measurementFormatter setUnitStyle:2];
    v9 = [(NSMeasurementFormatter *)v5->_measurementFormatter numberFormatter];
    [v9 setMaximumFractionDigits:0];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diagnosticMetaData"];
    metaData = v5->_metaData;
    v5->_metaData = (MXMetaData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appVersion"];
    applicationVersion = v5->_applicationVersion;
    v5->_applicationVersion = (NSString *)v12;

    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    objc_super v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"signpostData"];
    signpostData = v5->_signpostData;
    v5->_signpostData = (NSArray *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pid"];
    v5->_pid = [v19 intValue];
  }
  return v5;
}

- (id)toDictionary
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  metaData = self->_metaData;
  if (metaData)
  {
    id v6 = [(MXMetaData *)metaData toDictionary];
    [v4 addEntriesFromDictionary:v6];
  }
  applicationVersion = self->_applicationVersion;
  if (applicationVersion) {
    [v4 setObject:applicationVersion forKey:@"appVersion"];
  }
  if (self->_signpostData)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = self->_signpostData;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"signpostData"];
  }
  if (objc_msgSend(v4, "count", (void)v17))
  {
    uint64_t v15 = (void *)[v4 copy];
    [v3 setObject:v15 forKey:@"diagnosticMetaData"];
  }
  [v3 setObject:@"1.0.0" forKey:@"version"];

  return v3;
}

- (NSData)JSONRepresentation
{
  v2 = [(MXDiagnostic *)self toDictionary];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    id v5 = 0;
    id v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:1 error:&v5];
  }
  else
  {
    id v3 = 0;
  }

  return (NSData *)v3;
}

- (MXMetaData)metaData
{
  return (MXMetaData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetaData:(id)a3
{
}

- (NSString)applicationVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)signpostData
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSignpostData:(id)a3
{
}

- (NSMeasurementFormatter)measurementFormatter
{
  return (NSMeasurementFormatter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMeasurementFormatter:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementFormatter, 0);
  objc_storeStrong((id *)&self->_signpostData, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);

  objc_storeStrong((id *)&self->_metaData, 0);
}

@end