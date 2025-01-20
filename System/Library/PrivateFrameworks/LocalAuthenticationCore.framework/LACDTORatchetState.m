@interface LACDTORatchetState
+ (BOOL)supportsSecureCoding;
+ (id)nullInstance;
- (BOOL)isEqual:(id)a3;
- (LACDTORatchetState)initWithCoder:(id)a3;
- (LACDTORatchetState)initWithRawValue:(int64_t)a3 duration:(double)a4 resetDuration:(double)a5 uuid:(id)a6;
- (NSString)uuid;
- (double)duration;
- (double)effectiveDuration;
- (double)resetDuration;
- (id)description;
- (int64_t)rawValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACDTORatchetState

- (LACDTORatchetState)initWithRawValue:(int64_t)a3 duration:(double)a4 resetDuration:(double)a5 uuid:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)LACDTORatchetState;
  v12 = [(LACDTORatchetState *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_rawValue = a3;
    v12->_duration = a4;
    v12->_resetDuration = a5;
    objc_storeStrong((id *)&v12->_uuid, a6);
  }

  return v13;
}

+ (id)nullInstance
{
  v2 = [[LACDTORatchetState alloc] initWithRawValue:0 duration:0 resetDuration:-1.0 uuid:-1.0];
  return v2;
}

- (double)effectiveDuration
{
  [(LACDTORatchetState *)self duration];
  double v3 = 3600.0;
  if (v4 != -1.0)
  {
    [(LACDTORatchetState *)self duration];
    if (v5 > 0.0)
    {
      [(LACDTORatchetState *)self duration];
      double v3 = fmin(v6, 3600.0);
    }
  }
  return fmax(v3, 1.0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t rawValue = self->_rawValue;
  id v5 = a3;
  double v6 = NSStringFromSelector(sel_rawValue);
  [v5 encodeInteger:rawValue forKey:v6];

  double duration = self->_duration;
  v8 = NSStringFromSelector(sel_duration);
  [v5 encodeDouble:v8 forKey:duration];

  double resetDuration = self->_resetDuration;
  v10 = NSStringFromSelector(sel_resetDuration);
  [v5 encodeDouble:v10 forKey:resetDuration];

  uuid = self->_uuid;
  NSStringFromSelector(sel_uuid);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:uuid forKey:v12];
}

- (LACDTORatchetState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(sel_rawValue);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  v7 = NSStringFromSelector(sel_duration);
  [v4 decodeDoubleForKey:v7];
  double v9 = v8;

  v10 = NSStringFromSelector(sel_resetDuration);
  [v4 decodeDoubleForKey:v10];
  double v12 = v11;

  uint64_t v13 = objc_opt_class();
  v14 = NSStringFromSelector(sel_uuid);
  objc_super v15 = [v4 decodeObjectOfClass:v13 forKey:v14];

  v16 = [(LACDTORatchetState *)self initWithRawValue:v6 duration:v15 resetDuration:v9 uuid:v12];
  return v16;
}

- (id)description
{
  v24[5] = *MEMORY[0x263EF8340];
  v23 = NSString;
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = self->_rawValue - 1;
  if (v4 > 3) {
    id v5 = @"LACDTORatchetStateRawValueNotStarted";
  }
  else {
    id v5 = off_2653B62E8[v4];
  }
  uint64_t v6 = [NSString stringWithFormat:@"rawValue: %@", v5];
  v24[0] = v6;
  v7 = NSString;
  [(LACDTORatchetState *)self duration];
  double v9 = [v7 stringWithFormat:@"duration: %.2f", v8];
  v24[1] = v9;
  v10 = NSString;
  [(LACDTORatchetState *)self resetDuration];
  double v12 = [v10 stringWithFormat:@"resetDuration: %.2f", v11];
  v24[2] = v12;
  uint64_t v13 = NSString;
  [(LACDTORatchetState *)self effectiveDuration];
  objc_super v15 = [v13 stringWithFormat:@"effectiveDuration: %.2f", v14];
  v24[3] = v15;
  v16 = NSString;
  v17 = [(LACDTORatchetState *)self uuid];
  v18 = [v16 stringWithFormat:@"uuid: %@", v17];
  v24[4] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:5];
  v20 = [v19 componentsJoinedByString:@"; "];
  v21 = [v23 stringWithFormat:@"<%@ %p; %@>", v3, self, v20];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(LACDTORatchetState *)self rawValue];
    if (v6 != [v5 rawValue]) {
      goto LABEL_6;
    }
    [(LACDTORatchetState *)self duration];
    double v8 = v7;
    [v5 duration];
    if (v8 != v9) {
      goto LABEL_6;
    }
    [(LACDTORatchetState *)self resetDuration];
    double v11 = v10;
    [v5 resetDuration];
    if (v11 == v12
      && ([(LACDTORatchetState *)self effectiveDuration],
          double v14 = v13,
          [v5 effectiveDuration],
          v14 == v15))
    {
      v18 = [(LACDTORatchetState *)self uuid];
      uint64_t v19 = [v5 uuid];
      if (v18 == (void *)v19)
      {
        char v16 = 1;
        v20 = v18;
      }
      else
      {
        v20 = (void *)v19;
        v21 = [(LACDTORatchetState *)self uuid];
        v22 = [v5 uuid];
        char v16 = [v21 isEqualToString:v22];
      }
    }
    else
    {
LABEL_6:
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (double)duration
{
  return self->_duration;
}

- (double)resetDuration
{
  return self->_resetDuration;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end