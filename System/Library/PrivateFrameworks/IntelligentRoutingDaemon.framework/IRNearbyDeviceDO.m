@interface IRNearbyDeviceDO
+ (BOOL)supportsSecureCoding;
+ (id)miLoNearbyDeviceDOWithRange:(double)a3 idsIdentifier:(id)a4 mediaRemoteIdentifier:(id)a5 proximityType:(id)a6 measurementDate:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMiLoNearbyDeviceDO:(id)a3;
- (IRNearbyDeviceDO)initWithCoder:(id)a3;
- (IRNearbyDeviceDO)initWithRange:(double)a3 idsIdentifier:(id)a4 mediaRemoteIdentifier:(id)a5 proximityType:(id)a6 measurementDate:(id)a7;
- (NSDate)measurementDate;
- (NSString)idsIdentifier;
- (NSString)mediaRemoteIdentifier;
- (NSString)proximityType;
- (double)range;
- (id)copyWithReplacementIdsIdentifier:(id)a3;
- (id)copyWithReplacementMeasurementDate:(id)a3;
- (id)copyWithReplacementMediaRemoteIdentifier:(id)a3;
- (id)copyWithReplacementProximityType:(id)a3;
- (id)copyWithReplacementRange:(double)a3;
- (id)description;
- (id)exportAsDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRNearbyDeviceDO

- (id)exportAsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"yyyy-MMM-dd HH:mm:ss.SSSSSS"];
  v5 = NSNumber;
  [(IRNearbyDeviceDO *)self range];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:@"range"];

  v7 = [(IRNearbyDeviceDO *)self idsIdentifier];
  [v3 setObject:v7 forKeyedSubscript:@"idsIdentifier"];

  v8 = [(IRNearbyDeviceDO *)self mediaRemoteIdentifier];
  [v3 setObject:v8 forKeyedSubscript:@"mediaRemoteIdentifier"];

  v9 = [(IRNearbyDeviceDO *)self proximityType];
  [v3 setObject:v9 forKeyedSubscript:@"proximityType"];

  v10 = [(IRNearbyDeviceDO *)self measurementDate];
  v11 = [v4 stringFromDate:v10];
  [v3 setObject:v11 forKeyedSubscript:@"measurementDate"];

  return v3;
}

- (IRNearbyDeviceDO)initWithRange:(double)a3 idsIdentifier:(id)a4 mediaRemoteIdentifier:(id)a5 proximityType:(id)a6 measurementDate:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IRNearbyDeviceDO;
  v17 = [(IRNearbyDeviceDO *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_range = a3;
    objc_storeStrong((id *)&v17->_idsIdentifier, a4);
    objc_storeStrong((id *)&v18->_mediaRemoteIdentifier, a5);
    objc_storeStrong((id *)&v18->_proximityType, a6);
    objc_storeStrong((id *)&v18->_measurementDate, a7);
  }

  return v18;
}

+ (id)miLoNearbyDeviceDOWithRange:(double)a3 idsIdentifier:(id)a4 mediaRemoteIdentifier:(id)a5 proximityType:(id)a6 measurementDate:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = (void *)[objc_alloc((Class)a1) initWithRange:v15 idsIdentifier:v14 mediaRemoteIdentifier:v13 proximityType:v12 measurementDate:a3];

  return v16;
}

- (id)copyWithReplacementRange:(double)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  idsIdentifier = self->_idsIdentifier;
  mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
  proximityType = self->_proximityType;
  measurementDate = self->_measurementDate;

  return (id)[v5 initWithRange:idsIdentifier idsIdentifier:mediaRemoteIdentifier mediaRemoteIdentifier:proximityType proximityType:measurementDate measurementDate:a3];
}

- (id)copyWithReplacementIdsIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRange:v4 idsIdentifier:self->_mediaRemoteIdentifier mediaRemoteIdentifier:self->_proximityType proximityType:self->_measurementDate measurementDate:self->_range];

  return v5;
}

- (id)copyWithReplacementMediaRemoteIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRange:self->_idsIdentifier idsIdentifier:v4 mediaRemoteIdentifier:self->_proximityType proximityType:self->_measurementDate measurementDate:self->_range];

  return v5;
}

- (id)copyWithReplacementProximityType:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRange:self->_idsIdentifier idsIdentifier:self->_mediaRemoteIdentifier mediaRemoteIdentifier:v4 proximityType:self->_measurementDate measurementDate:self->_range];

  return v5;
}

- (id)copyWithReplacementMeasurementDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRange:self->_idsIdentifier idsIdentifier:self->_mediaRemoteIdentifier mediaRemoteIdentifier:self->_proximityType proximityType:v4 measurementDate:self->_range];

  return v5;
}

- (BOOL)isEqualToMiLoNearbyDeviceDO:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_15;
  }
  double range = self->_range;
  [v4 range];
  if (range != v7) {
    goto LABEL_15;
  }
  int v8 = self->_idsIdentifier != 0;
  v9 = [v5 idsIdentifier];
  int v10 = v9 == 0;

  if (v8 == v10) {
    goto LABEL_15;
  }
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
  {
    id v12 = [v5 idsIdentifier];
    int v13 = [(NSString *)idsIdentifier isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  int v14 = self->_mediaRemoteIdentifier != 0;
  id v15 = [v5 mediaRemoteIdentifier];
  int v16 = v15 == 0;

  if (v14 == v16) {
    goto LABEL_15;
  }
  mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
  if (mediaRemoteIdentifier)
  {
    v18 = [v5 mediaRemoteIdentifier];
    int v19 = [(NSString *)mediaRemoteIdentifier isEqual:v18];

    if (!v19) {
      goto LABEL_15;
    }
  }
  int v20 = self->_proximityType != 0;
  v21 = [v5 proximityType];
  int v22 = v21 == 0;

  if (v20 == v22) {
    goto LABEL_15;
  }
  proximityType = self->_proximityType;
  if (proximityType)
  {
    v24 = [v5 proximityType];
    int v25 = [(NSString *)proximityType isEqual:v24];

    if (!v25) {
      goto LABEL_15;
    }
  }
  int v26 = self->_measurementDate != 0;
  v27 = [v5 measurementDate];
  int v28 = v27 == 0;

  if (v26 == v28)
  {
LABEL_15:
    char v31 = 0;
  }
  else
  {
    measurementDate = self->_measurementDate;
    if (measurementDate)
    {
      v30 = [v5 measurementDate];
      char v31 = [(NSDate *)measurementDate isEqual:v30];
    }
    else
    {
      char v31 = 1;
    }
  }

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRNearbyDeviceDO *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRNearbyDeviceDO *)self isEqualToMiLoNearbyDeviceDO:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t range = (unint64_t)self->_range;
  NSUInteger v4 = [(NSString *)self->_idsIdentifier hash] - range + 32 * range;
  NSUInteger v5 = [(NSString *)self->_mediaRemoteIdentifier hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_proximityType hash] - v5 + 32 * v5;
  return [(NSDate *)self->_measurementDate hash] - v6 + 32 * v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRNearbyDeviceDO)initWithCoder:(id)a3
{
  v43[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"range"];
  if (v5) {
    goto LABEL_2;
  }
  int v14 = [v4 error];

  if (!v14)
  {
    if (([v4 containsValueForKey:@"range"] & 1) == 0)
    {
      uint64_t v42 = *MEMORY[0x263F08320];
      v43[0] = @"Missing serialized value for IRNearbyDeviceDO.range";
      NSUInteger v6 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
      int v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRNearbyDeviceDOOCNTErrorDomain" code:1 userInfo:v6];
      [v4 failWithError:v8];
      goto LABEL_15;
    }
LABEL_2:
    NSUInteger v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsIdentifier"];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v7 = (objc_class *)objc_opt_class();
        int v8 = NSStringFromClass(v7);
        v9 = (objc_class *)objc_opt_class();
        int v10 = NSStringFromClass(v9);
        v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRNearbyDeviceDO key \"idsIdentifier\" (expected %@, decoded %@)", v8, v10, 0];
        uint64_t v40 = *MEMORY[0x263F08320];
        v41 = v11;
        id v12 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        int v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRNearbyDeviceDOOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v13];
LABEL_20:

LABEL_21:
        id v15 = 0;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {
      int v16 = [v4 error];

      if (v16)
      {
        id v15 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    int v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaRemoteIdentifier"];
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = (objc_class *)objc_opt_class();
        int v10 = NSStringFromClass(v17);
        v18 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v18);
        id v12 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRNearbyDeviceDO key \"mediaRemoteIdentifier\" (expected %@, decoded %@)", v10, v11, 0];
        uint64_t v38 = *MEMORY[0x263F08320];
        v39 = v12;
        int v13 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        int v19 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRNearbyDeviceDOOCNTErrorDomain" code:3 userInfo:v13];
        [v4 failWithError:v19];
LABEL_19:

        goto LABEL_20;
      }
LABEL_16:
      int v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proximityType"];
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = (objc_class *)objc_opt_class();
          v11 = NSStringFromClass(v21);
          int v22 = (objc_class *)objc_opt_class();
          id v12 = NSStringFromClass(v22);
          int v13 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRNearbyDeviceDO key \"proximityType\" (expected %@, decoded %@)", v11, v12, 0];
          uint64_t v36 = *MEMORY[0x263F08320];
          v37 = v13;
          int v19 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          v23 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRNearbyDeviceDOOCNTErrorDomain" code:3 userInfo:v19];
          [v4 failWithError:v23];

          goto LABEL_19;
        }
      }
      else
      {
        int v25 = [v4 error];

        if (v25)
        {
          id v15 = 0;
          goto LABEL_23;
        }
      }
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"measurementDate"];
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v26 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v26);
          v27 = (objc_class *)objc_opt_class();
          int v28 = NSStringFromClass(v27);
          v29 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRNearbyDeviceDO key \"measurementDate\" (expected %@, decoded %@)", v33, v28, 0];
          uint64_t v34 = *MEMORY[0x263F08320];
          v35 = v29;
          v30 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          char v31 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRNearbyDeviceDOOCNTErrorDomain" code:3 userInfo:v30];
          [v4 failWithError:v31];

          goto LABEL_21;
        }
      }
      else
      {
        v32 = [v4 error];

        if (v32) {
          goto LABEL_21;
        }
      }
      self = [(IRNearbyDeviceDO *)self initWithRange:v6 idsIdentifier:v8 mediaRemoteIdentifier:v10 proximityType:v11 measurementDate:(double)v5];
      id v15 = self;
      goto LABEL_22;
    }
    int v20 = [v4 error];

    if (!v20) {
      goto LABEL_16;
    }
LABEL_15:
    id v15 = 0;
LABEL_24:

    goto LABEL_25;
  }
  id v15 = 0;
LABEL_26:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  [v9 encodeInt64:(uint64_t)self->_range forKey:@"range"];
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier) {
    [v9 encodeObject:idsIdentifier forKey:@"idsIdentifier"];
  }
  mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
  if (mediaRemoteIdentifier) {
    [v9 encodeObject:mediaRemoteIdentifier forKey:@"mediaRemoteIdentifier"];
  }
  proximityType = self->_proximityType;
  double v7 = v9;
  if (proximityType)
  {
    [v9 encodeObject:proximityType forKey:@"proximityType"];
    double v7 = v9;
  }
  measurementDate = self->_measurementDate;
  if (measurementDate)
  {
    [v9 encodeObject:measurementDate forKey:@"measurementDate"];
    double v7 = v9;
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithDouble:self->_range];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<IRNearbyDeviceDO | range:%@ idsIdentifier:%@ mediaRemoteIdentifier:%@ proximityType:%@ measurementDate:%@>", v4, self->_idsIdentifier, self->_mediaRemoteIdentifier, self->_proximityType, self->_measurementDate];

  return v5;
}

- (double)range
{
  return self->_range;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)mediaRemoteIdentifier
{
  return self->_mediaRemoteIdentifier;
}

- (NSString)proximityType
{
  return self->_proximityType;
}

- (NSDate)measurementDate
{
  return self->_measurementDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementDate, 0);
  objc_storeStrong((id *)&self->_proximityType, 0);
  objc_storeStrong((id *)&self->_mediaRemoteIdentifier, 0);

  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

@end