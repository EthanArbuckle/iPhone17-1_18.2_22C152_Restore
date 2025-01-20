@interface GCHapticMotor
+ (BOOL)supportsSecureCoding;
- (GCHapticMotor)init;
- (GCHapticMotor)initWithCoder:(id)a3;
- (GCHapticMotor)initWithIndex:(int)a3;
- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4;
- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4 features:(unint64_t)a5;
- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4 features:(unint64_t)a5 frequency:(float)a6 amplitude:(float)a7;
- (NSMutableArray)queuedTransients;
- (NSString)name;
- (float)amplitude;
- (float)frequency;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)index;
- (unint64_t)features;
- (void)applyValuesFrom:(id)a3;
- (void)drainQueuedTransients;
- (void)encodeWithCoder:(id)a3;
- (void)enqueueHapticTransientEvent:(id)a3;
- (void)setAmplitude:(float)a3;
- (void)setFrequency:(float)a3;
- (void)setQueuedTransients:(id)a3;
@end

@implementation GCHapticMotor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4 features:(unint64_t)a5 frequency:(float)a6 amplitude:(float)a7
{
  id v13 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GCHapticMotor;
  v14 = [(GCHapticMotor *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_index = a3;
    objc_storeStrong((id *)&v14->_name, a4);
    v15->_features = a5;
    v15->_frequency = a6;
    v15->_amplitude = a7;
    uint64_t v16 = +[NSMutableArray array];
    queuedTransients = v15->_queuedTransients;
    v15->_queuedTransients = (NSMutableArray *)v16;
  }
  return v15;
}

- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4 features:(unint64_t)a5
{
  return [(GCHapticMotor *)self initWithIndex:*(void *)&a3 name:a4 features:a5 frequency:0.0 amplitude:0.0];
}

- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4
{
  return [(GCHapticMotor *)self initWithIndex:*(void *)&a3 name:a4 features:0];
}

- (GCHapticMotor)initWithIndex:(int)a3
{
  return [(GCHapticMotor *)self initWithIndex:*(void *)&a3 name:0 features:0];
}

- (GCHapticMotor)init
{
  return [(GCHapticMotor *)self initWithIndex:0];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t index = self->_index;
  id v7 = a3;
  [v7 encodeInteger:index forKey:@"_index"];
  [v7 encodeObject:self->_name forKey:@"_name"];
  [v7 encodeInteger:self->_features forKey:@"_features"];
  *(float *)&double v5 = self->_frequency;
  [v7 encodeFloat:@"_frequency" forKey:v5];
  *(float *)&double v6 = self->_amplitude;
  [v7 encodeFloat:@"_amplitude" forKey:v6];
}

- (GCHapticMotor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"_index"];
  double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"_features"];
  [v4 decodeFloatForKey:@"_frequency"];
  int v9 = v8;
  [v4 decodeFloatForKey:@"_amplitude"];
  int v11 = v10;

  LODWORD(v12) = v9;
  LODWORD(v13) = v11;
  v14 = [(GCHapticMotor *)self initWithIndex:v5 name:v6 features:v7 frequency:v12 amplitude:v13];

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    double v6 = [(GCHapticMotor *)self name];
    uint64_t v7 = [v6 copyWithZone:a3];
    int v8 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v7;

    *(_DWORD *)(v5 + 8) = [(GCHapticMotor *)self index];
    *(void *)(v5 + 32) = [(GCHapticMotor *)self features];
    [(GCHapticMotor *)self frequency];
    *(_DWORD *)(v5 + 12) = v9;
    [(GCHapticMotor *)self amplitude];
    *(_DWORD *)(v5 + 16) = v10;
  }
  return (id)v5;
}

- (void)applyValuesFrom:(id)a3
{
  id v4 = a3;
  [v4 frequency];
  -[GCHapticMotor setFrequency:](self, "setFrequency:");
  if ([(GCHapticMotor *)self features])
  {
    [v4 amplitude];
    -[GCHapticMotor setAmplitude:](self, "setAmplitude:");
  }
}

- (void)enqueueHapticTransientEvent:(id)a3
{
  id v4 = a3;
  if ((-[GCHapticMotor features](self, "features") & 2) != 0 && [v4 type] == 1) {
    [(NSMutableArray *)self->_queuedTransients addObject:v4];
  }
}

- (void)drainQueuedTransients
{
}

- (id)description
{
  return +[NSString stringWithFormat:@"GCHapticMotor - %@(%d) f=%f a=%f", self->_name, self->_index, self->_frequency, self->_amplitude];
}

- (NSString)name
{
  return self->_name;
}

- (int)index
{
  return self->_index;
}

- (unint64_t)features
{
  return self->_features;
}

- (float)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(float)a3
{
  self->_frequency = a3;
}

- (float)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(float)a3
{
  self->_amplitude = a3;
}

- (NSMutableArray)queuedTransients
{
  return self->_queuedTransients;
}

- (void)setQueuedTransients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedTransients, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end