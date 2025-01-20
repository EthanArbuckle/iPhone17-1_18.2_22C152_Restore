@interface SRElectrocardiogramSample
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSample:(id)a3;
- (NSArray)data;
- (NSDate)date;
- (NSMeasurement)frequency;
- (SRElectrocardiogramSample)init;
- (SRElectrocardiogramSample)initWithCoder:(id)a3;
- (SRElectrocardiogramSample)initWithHAECGSample:(id)a3;
- (SRElectrocardiogramSample)initWithTimestamp:(double)a3 frequency:(double)a4 session:(id)a5 lead:(int64_t)a6 data:(id)a7;
- (SRElectrocardiogramSession)session;
- (id)description;
- (int64_t)lead;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRElectrocardiogramSample

- (SRElectrocardiogramSample)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (SRElectrocardiogramSample)initWithHAECGSample:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([a3 flags])
  {
    uint64_t v4 = 1;
  }
  else if (([a3 flags] & 2) != 0)
  {
    uint64_t v4 = 3;
  }
  else
  {
    uint64_t v4 = 2;
  }
  if (([a3 flags] & 4) != 0) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  v24 = -[SRElectrocardiogramSession initWithState:sessionGuidance:identifier:]([SRElectrocardiogramSession alloc], "initWithState:sessionGuidance:identifier:", v4, v5, [a3 sessionIdentifier]);
  objc_msgSend((id)objc_msgSend(a3, "timestamp"), "timeIntervalSinceReferenceDate");
  double v7 = v6;
  [a3 frequency];
  float v9 = v8;
  v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "ecgData"), "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v11 = (void *)[a3 ecgData];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v17 = [SRElectrocardiogramData alloc];
        uint64_t v18 = [v16 flags];
        [v16 value];
        v20 = [(SRElectrocardiogramData *)v17 initWithFlags:v18 value:v19];
        [v10 addObject:v20];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }
  if (([a3 flags] & 8) != 0) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = 2;
  }
  v22 = [(SRElectrocardiogramSample *)self initWithTimestamp:v24 frequency:v21 session:v10 lead:v7 data:v9];

  return v22;
}

- (SRElectrocardiogramSample)initWithTimestamp:(double)a3 frequency:(double)a4 session:(id)a5 lead:(int64_t)a6 data:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)SRElectrocardiogramSample;
  uint64_t v12 = [(SRElectrocardiogramSample *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_time = a3;
    v12->_freq = a4;
    v12->_lead = a6;
    v12->_session = (SRElectrocardiogramSession *)a5;
    v13->_data = (NSArray *)[a7 copy];
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRElectrocardiogramSample;
  [(SRElectrocardiogramSample *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(SRElectrocardiogramSample *)self isEqualToSample:a3];
}

- (BOOL)isEqualToSample:(id)a3
{
  if ((!-[SRElectrocardiogramSample session](self, "session") && ![a3 session]
     || (int v5 = -[SRElectrocardiogramSession isEqual:](-[SRElectrocardiogramSample session](self, "session"), "isEqual:", [a3 session])) != 0)&& (!-[SRElectrocardiogramSample data](self, "data") && !objc_msgSend(a3, "data")|| (int v5 = -[NSArray isEqual:](-[SRElectrocardiogramSample data](self, "data"), "isEqual:", objc_msgSend(a3, "data"))) != 0))
  {
    int v5 = -[NSDate isEqualToDate:](-[SRElectrocardiogramSample date](self, "date"), "isEqualToDate:", [a3 date]);
    if (v5)
    {
      int v5 = -[NSMeasurement isEqual:](-[SRElectrocardiogramSample frequency](self, "frequency"), "isEqual:", [a3 frequency]);
      if (v5)
      {
        int64_t v6 = [(SRElectrocardiogramSample *)self lead];
        LOBYTE(v5) = v6 == [a3 lead];
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)[(SRElectrocardiogramSample *)self date] hash];
  uint64_t v4 = [(NSMeasurement *)[(SRElectrocardiogramSample *)self frequency] hash] ^ v3;
  unint64_t v5 = [(SRElectrocardiogramSession *)[(SRElectrocardiogramSample *)self session] hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)[(SRElectrocardiogramSample *)self data] hash];
  return v6 ^ objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInteger:", -[SRElectrocardiogramSample lead](self, "lead")), "hash");
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@ (%p): timestamp: %@, frequency: %@, session: %@, lead: %ld, data: %@", NSStringFromClass(v4), self, -[SRElectrocardiogramSample date](self, "date"), -[SRElectrocardiogramSample frequency](self, "frequency"), -[SRElectrocardiogramSample session](self, "session"), -[SRElectrocardiogramSample lead](self, "lead"), -[SRElectrocardiogramSample data](self, "data")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRElectrocardiogramSample.m", 239, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeObject:self->_session forKey:@"session"];
  [a3 encodeDouble:@"timestamp" forKey:self->_time];
  [a3 encodeDouble:@"frequency" forKey:self->_freq];
  [a3 encodeObject:self->_data forKey:@"data"];
  int64_t lead = self->_lead;

  [a3 encodeInteger:lead forKey:@"lead"];
}

- (SRElectrocardiogramSample)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRElectrocardiogramSample.m", 249, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), @"data");
  [a3 decodeDoubleForKey:@"frequency"];
  double v10 = v9;
  [a3 decodeDoubleForKey:@"timestamp"];
  double v12 = v11;
  uint64_t v13 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"session"];
  uint64_t v14 = [a3 decodeIntegerForKey:@"lead"];

  return [(SRElectrocardiogramSample *)self initWithTimestamp:v13 frequency:v14 session:v8 lead:v12 data:v10];
}

- (NSMeasurement)frequency
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v4 = objc_msgSend(v3, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08CC8], "hertz"), self->_freq);

  return (NSMeasurement *)v4;
}

- (NSDate)date
{
  return (NSDate *)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_time];
}

- (SRElectrocardiogramSession)session
{
  return self->_session;
}

- (int64_t)lead
{
  return self->_lead;
}

- (NSArray)data
{
  return self->_data;
}

@end