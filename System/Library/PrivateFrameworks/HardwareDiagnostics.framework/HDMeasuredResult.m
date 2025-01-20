@interface HDMeasuredResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMeasuredResult:(id)a3;
- (BOOL)valueWithinLimits;
- (HDLimit)limit;
- (HDMeasuredResult)initWithCoder:(id)a3;
- (HDMeasuredResult)initWithName:(id)a3 measurement:(id)a4;
- (NSMeasurement)measurement;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setLimit:(id)a3;
- (void)setName:(id)a3;
@end

@implementation HDMeasuredResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDMeasuredResult)initWithName:(id)a3 measurement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDMeasuredResult;
  v8 = [(HDMeasuredResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    measurement = v8->_measurement;
    v8->_measurement = (NSMeasurement *)v11;

    v8->_valueWithinLimits = 1;
  }

  return v8;
}

- (HDMeasuredResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDMeasuredResult;
  v5 = [(HDMeasuredResult *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDMeasuredResult.name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDMeasuredResult.measurement"];
    measurement = v5->_measurement;
    v5->_measurement = (NSMeasurement *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDMeasuredResult.limit"];
    limit = v5->_limit;
    v5->_limit = (HDLimit *)v10;

    v12 = v5->_limit;
    if (v12) {
      char v13 = [(HDLimit *)v12 measurementWithinBounds:v5->_measurement];
    }
    else {
      char v13 = 1;
    }
    v5->_valueWithinLimits = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"HDMeasuredResult.name"];
  [v5 encodeObject:self->_measurement forKey:@"HDMeasuredResult.measurement"];
  [v5 encodeObject:self->_limit forKey:@"HDMeasuredResult.limit"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:measurement:", self->_name, self->_measurement);
  [v4 setLimit:self->_limit];
  return v4;
}

- (void)setLimit:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4) {
    char v5 = [v4 measurementWithinBounds:self->_measurement];
  }
  else {
    char v5 = 1;
  }
  uint64_t v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [v9 copy];
  limit = v6->_limit;
  v6->_limit = (HDLimit *)v7;

  v6->_valueWithinLimits = v5;
  objc_sync_exit(v6);
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  id v4 = objc_opt_new();
  char v5 = NSNumber;
  [(NSMeasurement *)self->_measurement doubleValue];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setObject:v6 forKeyedSubscript:@"value"];

  uint64_t v7 = [(NSMeasurement *)self->_measurement unit];
  uint64_t v8 = [v7 symbol];
  [v4 setObject:v8 forKeyedSubscript:@"units"];

  [v3 setObject:v4 forKeyedSubscript:@"measurement"];
  limit = self->_limit;
  if (limit)
  {
    uint64_t v10 = [(HDLimit *)limit dictionaryRepresentation];
    [v3 setObject:v10 forKeyedSubscript:@"limit"];
  }
  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDMeasuredResult *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HDMeasuredResult *)self isEqualToMeasuredResult:v4];
  }

  return v5;
}

- (BOOL)isEqualToMeasuredResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 name];
  uint64_t v6 = [(HDMeasuredResult *)self name];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = [v4 limit];
  if (v8)
  {
  }
  else
  {
    id v9 = [(HDMeasuredResult *)self limit];

    if (!v9) {
      goto LABEL_8;
    }
  }
  uint64_t v10 = [v4 limit];
  if (!v10) {
    goto LABEL_10;
  }
  uint64_t v11 = (void *)v10;
  v12 = [(HDMeasuredResult *)self limit];

  if (!v12) {
    goto LABEL_10;
  }
  char v13 = [v4 limit];
  objc_super v14 = [(HDMeasuredResult *)self limit];
  int v15 = [v13 isEqualToLimit:v14];

  if (!v15) {
    goto LABEL_10;
  }
LABEL_8:
  v16 = [v4 measurement];
  v17 = [(HDMeasuredResult *)self measurement];
  v18 = [v17 unit];
  int v19 = [v16 canBeConvertedToUnit:v18];

  if (!v19)
  {
LABEL_10:
    char v25 = 0;
    goto LABEL_11;
  }
  v20 = [v4 measurement];
  v21 = [(HDMeasuredResult *)self measurement];
  v22 = [v21 unit];
  v23 = [v20 measurementByConvertingToUnit:v22];

  v24 = [(HDMeasuredResult *)self measurement];
  char v25 = [v23 isEqual:v24];

LABEL_11:
  return v25;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (HDLimit)limit
{
  return self->_limit;
}

- (NSMeasurement)measurement
{
  return self->_measurement;
}

- (BOOL)valueWithinLimits
{
  return self->_valueWithinLimits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurement, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end