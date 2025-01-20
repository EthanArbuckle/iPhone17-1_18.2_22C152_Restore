@interface GCDeviceAdaptiveTriggersPayload
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEqualAmplitudes:(id)a3;
- (BOOL)hasEqualStrengths:(id)a3;
- (BOOL)isEqual:(id)a3;
- (GCDeviceAdaptiveTriggersPayload)initWithCoder:(id)a3;
- (NSArray)amplitudes;
- (NSArray)strengths;
- (NSNumber)endPosition;
- (NSNumber)frequency;
- (NSNumber)mode;
- (NSNumber)startPosition;
- (id)description;
- (id)initFeedbackWithResistiveStrengths:(id *)a3;
- (id)initFeedbackWithStartPosition:(float)a3 resistiveStrength:(float)a4;
- (id)initOff;
- (id)initSlopeFeedbackWithStartPosition:(float)a3 endPosition:(float)a4 startStrength:(float)a5 endStrength:(float)a6;
- (id)initVibrationWithAmplitudes:(id *)a3 frequency:(float)a4;
- (id)initVibrationWithStartPosition:(float)a3 amplitude:(float)a4 frequency:(float)a5;
- (id)initWeaponWithStartPosition:(float)a3 endPosition:(float)a4 resistiveStrength:(float)a5;
- (id)redactedDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCDeviceAdaptiveTriggersPayload

- (id)initSlopeFeedbackWithStartPosition:(float)a3 endPosition:(float)a4 startStrength:(float)a5 endStrength:(float)a6
{
  v26.receiver = self;
  v26.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v10 = [(GCDeviceAdaptiveTriggersPayload *)&v26 init];
  v11 = v10;
  if (v10)
  {
    mode = v10->_mode;
    v10->_mode = (NSNumber *)&unk_26D286420;

    *(float *)&double v13 = a3;
    uint64_t v14 = +[NSNumber numberWithFloat:v13];
    startPosition = v11->_startPosition;
    v11->_startPosition = (NSNumber *)v14;

    *(float *)&double v16 = a4;
    uint64_t v17 = +[NSNumber numberWithFloat:v16];
    endPosition = v11->_endPosition;
    v11->_endPosition = (NSNumber *)v17;

    *(float *)&double v19 = a5;
    v20 = +[NSNumber numberWithFloat:v19];
    v27[0] = v20;
    *(float *)&double v21 = a6;
    v22 = +[NSNumber numberWithFloat:v21];
    v27[1] = v22;
    uint64_t v23 = +[NSArray arrayWithObjects:v27 count:2];
    strengths = v11->_strengths;
    v11->_strengths = (NSArray *)v23;
  }
  return v11;
}

- (id)initFeedbackWithStartPosition:(float)a3 resistiveStrength:(float)a4
{
  v17.receiver = self;
  v17.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v6 = [(GCDeviceAdaptiveTriggersPayload *)&v17 init];
  v7 = v6;
  if (v6)
  {
    mode = v6->_mode;
    v6->_mode = (NSNumber *)&unk_26D286438;

    *(float *)&double v9 = a3;
    uint64_t v10 = +[NSNumber numberWithFloat:v9];
    startPosition = v7->_startPosition;
    v7->_startPosition = (NSNumber *)v10;

    *(float *)&double v12 = a4;
    double v13 = +[NSNumber numberWithFloat:v12];
    v18 = v13;
    uint64_t v14 = +[NSArray arrayWithObjects:&v18 count:1];
    strengths = v7->_strengths;
    v7->_strengths = (NSArray *)v14;
  }
  return v7;
}

- (id)initFeedbackWithResistiveStrengths:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v4 = [(GCDeviceAdaptiveTriggersPayload *)&v13 init];
  v5 = v4;
  if (v4)
  {
    mode = v4->_mode;
    v4->_mode = (NSNumber *)&unk_26D286438;

    v7 = (NSArray *)[objc_alloc((Class)&off_26D2B4AE0) initWithCapacity:10];
    for (uint64_t i = 0; i != 10; ++i)
    {
      *(float *)&double v8 = a3->var0[i];
      uint64_t v10 = +[NSNumber numberWithFloat:v8];
      [(NSArray *)v7 addObject:v10];
    }
    strengths = v5->_strengths;
    v5->_strengths = v7;
  }
  return v5;
}

- (id)initWeaponWithStartPosition:(float)a3 endPosition:(float)a4 resistiveStrength:(float)a5
{
  v22.receiver = self;
  v22.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  double v8 = [(GCDeviceAdaptiveTriggersPayload *)&v22 init];
  double v9 = v8;
  if (v8)
  {
    mode = v8->_mode;
    v8->_mode = (NSNumber *)&unk_26D286450;

    *(float *)&double v11 = a3;
    uint64_t v12 = +[NSNumber numberWithFloat:v11];
    startPosition = v9->_startPosition;
    v9->_startPosition = (NSNumber *)v12;

    *(float *)&double v14 = a4;
    uint64_t v15 = +[NSNumber numberWithFloat:v14];
    endPosition = v9->_endPosition;
    v9->_endPosition = (NSNumber *)v15;

    *(float *)&double v17 = a5;
    v18 = +[NSNumber numberWithFloat:v17];
    uint64_t v23 = v18;
    uint64_t v19 = +[NSArray arrayWithObjects:&v23 count:1];
    strengths = v9->_strengths;
    v9->_strengths = (NSArray *)v19;
  }
  return v9;
}

- (id)initVibrationWithStartPosition:(float)a3 amplitude:(float)a4 frequency:(float)a5
{
  v22.receiver = self;
  v22.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  double v8 = [(GCDeviceAdaptiveTriggersPayload *)&v22 init];
  double v9 = v8;
  if (v8)
  {
    mode = v8->_mode;
    v8->_mode = (NSNumber *)&unk_26D286468;

    *(float *)&double v11 = a3;
    uint64_t v12 = +[NSNumber numberWithFloat:v11];
    startPosition = v9->_startPosition;
    v9->_startPosition = (NSNumber *)v12;

    *(float *)&double v14 = a4;
    uint64_t v15 = +[NSNumber numberWithFloat:v14];
    uint64_t v23 = v15;
    uint64_t v16 = +[NSArray arrayWithObjects:&v23 count:1];
    amplitudes = v9->_amplitudes;
    v9->_amplitudes = (NSArray *)v16;

    *(float *)&double v18 = a5;
    uint64_t v19 = +[NSNumber numberWithFloat:v18];
    frequency = v9->_frequency;
    v9->_frequency = (NSNumber *)v19;
  }
  return v9;
}

- (id)initVibrationWithAmplitudes:(id *)a3 frequency:(float)a4
{
  v18.receiver = self;
  v18.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v6 = [(GCDeviceAdaptiveTriggersPayload *)&v18 init];
  v7 = v6;
  if (v6)
  {
    mode = v6->_mode;
    v6->_mode = (NSNumber *)&unk_26D286468;

    *(float *)&double v9 = a4;
    uint64_t v10 = +[NSNumber numberWithFloat:v9];
    frequency = v7->_frequency;
    v7->_frequency = (NSNumber *)v10;

    uint64_t v12 = (NSArray *)[objc_alloc((Class)&off_26D2B4AE0) initWithCapacity:10];
    for (uint64_t i = 0; i != 10; ++i)
    {
      *(float *)&double v13 = a3->var0[i];
      uint64_t v15 = +[NSNumber numberWithFloat:v13];
      [(NSArray *)v12 addObject:v15];
    }
    amplitudes = v7->_amplitudes;
    v7->_amplitudes = v12;
  }
  return v7;
}

- (id)initOff
{
  v6.receiver = self;
  v6.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v2 = [(GCDeviceAdaptiveTriggersPayload *)&v6 init];
  v3 = v2;
  if (v2)
  {
    mode = v2->_mode;
    v2->_mode = (NSNumber *)&unk_26D286480;
  }
  return v3;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ - mode=%@> %@ %@ %@ %@ %@", objc_opt_class(), self->_mode, self->_startPosition, self->_endPosition, self->_strengths, self->_amplitudes, self->_frequency];
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:@"<%@ - mode=%@>", objc_opt_class(), self->_mode];
}

- (BOOL)hasEqualStrengths:(id)a3
{
  id v4 = a3;
  v5 = [v4 strengths];
  uint64_t v6 = [v5 count];
  NSUInteger v7 = [(NSArray *)self->_strengths count];

  if (v6 == v7)
  {
    double v8 = [v4 strengths];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      char v11 = 1;
      do
      {
        uint64_t v12 = [v4 strengths];
        double v13 = [v12 objectAtIndexedSubscript:v10];
        [v13 floatValue];
        float v15 = v14;
        uint64_t v16 = [(NSArray *)self->_strengths objectAtIndexedSubscript:v10];
        [v16 floatValue];
        v11 &= vabds_f32(v15, v17) < 0.0001;

        ++v10;
        objc_super v18 = [v4 strengths];
        unint64_t v19 = [v18 count];
      }
      while (v19 > v10);
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)hasEqualAmplitudes:(id)a3
{
  id v4 = a3;
  v5 = [v4 amplitudes];
  uint64_t v6 = [v5 count];
  NSUInteger v7 = [(NSArray *)self->_amplitudes count];

  if (v6 == v7)
  {
    double v8 = [v4 amplitudes];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      char v11 = 1;
      do
      {
        uint64_t v12 = [v4 amplitudes];
        double v13 = [v12 objectAtIndexedSubscript:v10];
        [v13 floatValue];
        float v15 = v14;
        uint64_t v16 = [(NSArray *)self->_amplitudes objectAtIndexedSubscript:v10];
        [v16 floatValue];
        v11 &= vabds_f32(v15, v17) < 0.0001;

        ++v10;
        objc_super v18 = [v4 amplitudes];
        unint64_t v19 = [v18 count];
      }
      while (v19 > v10);
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (GCDeviceAdaptiveTriggersPayload *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(GCDeviceAdaptiveTriggersPayload *)v5 mode];
      mode = self->_mode;

      if (v6 == mode)
      {
        switch([(NSNumber *)self->_mode integerValue])
        {
          case 1:
            if (![(GCDeviceAdaptiveTriggersPayload *)self hasEqualStrengths:v5]) {
              goto LABEL_4;
            }
            unint64_t v10 = [(GCDeviceAdaptiveTriggersPayload *)v5 startPosition];
            [v10 floatValue];
            float v19 = v18;
            [(NSNumber *)self->_startPosition floatValue];
            BOOL v8 = vabds_f32(v19, v20) < 0.0001;
            goto LABEL_21;
          case 2:
          case 4:
            if (![(GCDeviceAdaptiveTriggersPayload *)self hasEqualStrengths:v5]) {
              goto LABEL_4;
            }
            unint64_t v10 = [(GCDeviceAdaptiveTriggersPayload *)v5 startPosition];
            [v10 floatValue];
            float v12 = v11;
            [(NSNumber *)self->_startPosition floatValue];
            if (vabds_f32(v12, v13) >= 0.0001) {
              goto LABEL_20;
            }
            float v14 = [(GCDeviceAdaptiveTriggersPayload *)v5 endPosition];
            [v14 floatValue];
            float v16 = v15;
            endPosition = self->_endPosition;
            goto LABEL_19;
          case 3:
            if (![(GCDeviceAdaptiveTriggersPayload *)self hasEqualAmplitudes:v5]) {
              goto LABEL_4;
            }
            unint64_t v10 = [(GCDeviceAdaptiveTriggersPayload *)v5 frequency];
            [v10 floatValue];
            float v22 = v21;
            [(NSNumber *)self->_frequency floatValue];
            if (vabds_f32(v22, v23) >= 0.0001)
            {
LABEL_20:
              BOOL v8 = 0;
            }
            else
            {
              float v14 = [(GCDeviceAdaptiveTriggersPayload *)v5 startPosition];
              [v14 floatValue];
              float v16 = v24;
              endPosition = self->_startPosition;
LABEL_19:
              [(NSNumber *)endPosition floatValue];
              BOOL v8 = vabds_f32(v16, v25) < 0.0001;
            }
LABEL_21:

            break;
          default:
            BOOL v8 = 1;
            break;
        }
      }
      else
      {
LABEL_4:
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSNumber)mode
{
  return self->_mode;
}

- (NSNumber)startPosition
{
  return self->_startPosition;
}

- (NSNumber)endPosition
{
  return self->_endPosition;
}

- (NSArray)strengths
{
  return self->_strengths;
}

- (NSArray)amplitudes
{
  return self->_amplitudes;
}

- (NSNumber)frequency
{
  return self->_frequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_amplitudes, 0);
  objc_storeStrong((id *)&self->_strengths, 0);
  objc_storeStrong((id *)&self->_endPosition, 0);
  objc_storeStrong((id *)&self->_startPosition, 0);

  objc_storeStrong((id *)&self->_mode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceAdaptiveTriggersPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v5 = [(GCDeviceAdaptiveTriggersPayload *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mode"];
    mode = v5->_mode;
    v5->_mode = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_startPosition"];
    startPosition = v5->_startPosition;
    v5->_startPosition = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_endPosition"];
    endPosition = v5->_endPosition;
    v5->_endPosition = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_strengths"];
    strengths = v5->_strengths;
    v5->_strengths = (NSArray *)v12;

    uint64_t v14 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_amplitudes"];
    amplitudes = v5->_amplitudes;
    v5->_amplitudes = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_frequency"];
    frequency = v5->_frequency;
    v5->_frequency = (NSNumber *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  mode = self->_mode;
  id v5 = a3;
  [v5 encodeObject:mode forKey:@"_mode"];
  [v5 encodeObject:self->_startPosition forKey:@"_startPosition"];
  [v5 encodeObject:self->_endPosition forKey:@"_endPosition"];
  [v5 encodeObject:self->_strengths forKey:@"_strengths"];
  [v5 encodeObject:self->_amplitudes forKey:@"_amplitudes"];
  [v5 encodeObject:self->_frequency forKey:@"_frequency"];
}

@end