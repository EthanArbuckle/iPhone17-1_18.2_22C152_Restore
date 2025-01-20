@interface SRPhotoplethysmogramOpticalSample
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOpticalSample:(id)a3;
- (NSArray)conditions;
- (NSIndexSet)activePhotodiodeIndexes;
- (NSMeasurement)effectiveWavelength;
- (NSMeasurement)nominalWavelength;
- (NSMeasurement)samplingFrequency;
- (NSNumber)backgroundNoise;
- (NSNumber)backgroundNoiseOffset;
- (NSNumber)normalizedReflectance;
- (NSNumber)pinkNoise;
- (NSNumber)whiteNoise;
- (SRPhotoplethysmogramOpticalSample)initWithCoder:(id)a3;
- (SRPhotoplethysmogramOpticalSample)initWithEmitter:(int64_t)a3 photodiodes:(id)a4 signalIdentifier:(int64_t)a5 nominalWavelength:(double)a6 effectiveWavelength:(double)a7 frequency:(double)a8 timestamp:(int64_t)a9 normalizedReflectance:(id)a10 whiteNoise:(id)a11 pinkNoise:(id)a12 backgroundNoise:(id)a13 backgrounNoiseOffset:(id)a14 conditions:(id)a15;
- (SRPhotoplethysmogramOpticalSample)initWithHAPPGOpticalSample:(id)a3;
- (id)description;
- (int64_t)emitter;
- (int64_t)nanosecondsSinceStart;
- (int64_t)signalIdentifier;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRPhotoplethysmogramOpticalSample

- (SRPhotoplethysmogramOpticalSample)initWithEmitter:(int64_t)a3 photodiodes:(id)a4 signalIdentifier:(int64_t)a5 nominalWavelength:(double)a6 effectiveWavelength:(double)a7 frequency:(double)a8 timestamp:(int64_t)a9 normalizedReflectance:(id)a10 whiteNoise:(id)a11 pinkNoise:(id)a12 backgroundNoise:(id)a13 backgrounNoiseOffset:(id)a14 conditions:(id)a15
{
  v27.receiver = self;
  v27.super_class = (Class)SRPhotoplethysmogramOpticalSample;
  v24 = [(SRPhotoplethysmogramOpticalSample *)&v27 init];
  v25 = v24;
  if (v24)
  {
    v24->_emitter = a3;
    v24->_activePhotodiodeIndexes = (NSIndexSet *)a4;
    v25->_signalIdentifier = a5;
    v25->_rawNominalWavelength = a6;
    v25->_rawEffectiveWavelength = a7;
    v25->_rawFrequency = a8;
    v25->_nanosecondsSinceStart = a9;
    v25->_normalizedReflectance = (NSNumber *)a10;
    v25->_whiteNoise = (NSNumber *)a11;
    v25->_pinkNoise = (NSNumber *)a12;
    v25->_backgroundNoise = (NSNumber *)a13;
    v25->_backgroundNoiseOffset = (NSNumber *)a14;
    v25->_conditions = (NSArray *)[a15 copy];
  }
  return v25;
}

- (SRPhotoplethysmogramOpticalSample)initWithHAPPGOpticalSample:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([a3 saturated]) {
    [v4 addObject:@"SignalSaturation"];
  }
  if ([a3 noiseIsUnreliable]) {
    [v4 addObject:@"UnreliableNoise"];
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithBitfield:", objc_msgSend(a3, "photodiodes"));
  uint64_t v6 = [a3 emitter];
  uint64_t v7 = [a3 hardwareSetting];
  double v8 = (double)[a3 nominalWavelength];
  [a3 effectiveWavelength];
  v10 = -[SRPhotoplethysmogramOpticalSample initWithEmitter:photodiodes:signalIdentifier:nominalWavelength:effectiveWavelength:frequency:timestamp:normalizedReflectance:whiteNoise:pinkNoise:backgroundNoise:backgrounNoiseOffset:conditions:](self, "initWithEmitter:photodiodes:signalIdentifier:nominalWavelength:effectiveWavelength:frequency:timestamp:normalizedReflectance:whiteNoise:pinkNoise:backgroundNoise:backgrounNoiseOffset:conditions:", v6, v5, v7, [a3 timestamp], objc_msgSend(a3, "normalizedReflectance"), objc_msgSend(a3, "estimatedDeviceWhiteNoise"), v8, v9, (double)objc_msgSend(a3, "samplingFrequency"), objc_msgSend(a3, "estimatedDevicePinkNoise"), objc_msgSend(a3, "backgroundNoise"), objc_msgSend(a3, "estimatedDeviceNoiseOffset"), v4);

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRPhotoplethysmogramOpticalSample;
  [(SRPhotoplethysmogramOpticalSample *)&v3 dealloc];
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

  return [(SRPhotoplethysmogramOpticalSample *)self isEqualToOpticalSample:a3];
}

- (BOOL)isEqualToOpticalSample:(id)a3
{
  if (([(SRPhotoplethysmogramOpticalSample *)self normalizedReflectance]
     || [a3 normalizedReflectance])
    && !-[NSNumber isEqual:](-[SRPhotoplethysmogramOpticalSample normalizedReflectance](self, "normalizedReflectance"), "isEqual:", [a3 normalizedReflectance]))
  {
    return 0;
  }
  if ((-[SRPhotoplethysmogramOpticalSample whiteNoise](self, "whiteNoise") || [a3 whiteNoise])
    && !-[NSNumber isEqual:](-[SRPhotoplethysmogramOpticalSample whiteNoise](self, "whiteNoise"), "isEqual:", [a3 whiteNoise]))
  {
    return 0;
  }
  if ((-[SRPhotoplethysmogramOpticalSample pinkNoise](self, "pinkNoise") || [a3 pinkNoise])
    && !-[NSNumber isEqual:](-[SRPhotoplethysmogramOpticalSample pinkNoise](self, "pinkNoise"), "isEqual:", [a3 pinkNoise]))
  {
    return 0;
  }
  if (([(SRPhotoplethysmogramOpticalSample *)self backgroundNoise]
     || [a3 backgroundNoise])
    && !-[NSNumber isEqual:](-[SRPhotoplethysmogramOpticalSample backgroundNoise](self, "backgroundNoise"), "isEqual:", [a3 backgroundNoise]))
  {
    return 0;
  }
  if (([(SRPhotoplethysmogramOpticalSample *)self backgroundNoiseOffset]
     || [a3 backgroundNoiseOffset])
    && !-[NSNumber isEqual:](-[SRPhotoplethysmogramOpticalSample backgroundNoiseOffset](self, "backgroundNoiseOffset"), "isEqual:", [a3 backgroundNoiseOffset]))
  {
    return 0;
  }
  int64_t v5 = [(SRPhotoplethysmogramOpticalSample *)self emitter];
  if (v5 != [a3 emitter]) {
    return 0;
  }
  if (!-[NSIndexSet isEqual:](-[SRPhotoplethysmogramOpticalSample activePhotodiodeIndexes](self, "activePhotodiodeIndexes"), "isEqual:", [a3 activePhotodiodeIndexes]))return 0; {
  int64_t v6 = [(SRPhotoplethysmogramOpticalSample *)self signalIdentifier];
  }
  if (v6 != [a3 signalIdentifier]) {
    return 0;
  }
  if (!-[NSMeasurement isEqual:](-[SRPhotoplethysmogramOpticalSample nominalWavelength](self, "nominalWavelength"), "isEqual:", [a3 nominalWavelength]))return 0; {
  if (!-[NSMeasurement isEqual:](-[SRPhotoplethysmogramOpticalSample effectiveWavelength](self, "effectiveWavelength"), "isEqual:", [a3 effectiveWavelength]))return 0;
  }
  if (!-[NSMeasurement isEqual:](-[SRPhotoplethysmogramOpticalSample samplingFrequency](self, "samplingFrequency"), "isEqual:", [a3 samplingFrequency]))return 0; {
  int64_t v7 = [(SRPhotoplethysmogramOpticalSample *)self nanosecondsSinceStart];
  }
  if (v7 != [a3 nanosecondsSinceStart]) {
    return 0;
  }
  double v8 = [(SRPhotoplethysmogramOpticalSample *)self conditions];
  uint64_t v9 = [a3 conditions];

  return [(NSArray *)v8 isEqual:v9];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInteger:", self->_emitter), "hash");
  uint64_t v4 = [(NSIndexSet *)self->_activePhotodiodeIndexes hash] ^ v3;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInteger:", self->_signalIdentifier), "hash");
  uint64_t v6 = v4 ^ v5 ^ objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_rawNominalWavelength), "hash");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_rawEffectiveWavelength), "hash");
  uint64_t v8 = v7 ^ objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_rawFrequency), "hash");
  uint64_t v9 = v6 ^ v8 ^ objc_msgSend((id)objc_msgSend(NSNumber, "numberWithLongLong:", self->_nanosecondsSinceStart), "hash");
  uint64_t v10 = [(NSNumber *)self->_normalizedReflectance hash];
  uint64_t v11 = v10 ^ [(NSNumber *)self->_whiteNoise hash];
  uint64_t v12 = v11 ^ [(NSNumber *)self->_pinkNoise hash];
  uint64_t v13 = v12 ^ [(NSNumber *)self->_backgroundNoise hash];
  uint64_t v14 = v13 ^ [(NSNumber *)self->_backgroundNoiseOffset hash];
  return v9 ^ v14 ^ [(NSArray *)self->_conditions hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@ (%p): emitter: %ld, photodiodes: %@, signalIdentifier: %ld, nominalWavelength: %f, effectiveWavelength: %f, frequency: %f, nanosecondsSinceStart: %lld, normalizedReflectance: %@, whiteNoise: %@, pinkNoise: %@, backgroundNoise: %@, noiseOffset: %@, conditions: %@", NSStringFromClass(v4), self, self->_emitter, self->_activePhotodiodeIndexes, self->_signalIdentifier, *(void *)&self->_rawNominalWavelength, *(void *)&self->_rawEffectiveWavelength, *(void *)&self->_rawFrequency, self->_nanosecondsSinceStart, self->_normalizedReflectance, self->_whiteNoise, self->_pinkNoise, self->_backgroundNoise, self->_backgroundNoiseOffset, self->_conditions];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRPhotoplethysmogramSample.m", 234, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeInteger:self->_emitter forKey:@"emitter"];
  [a3 encodeObject:self->_activePhotodiodeIndexes forKey:@"photodiodes"];
  [a3 encodeInteger:self->_signalIdentifier forKey:@"hardwareSetting"];
  [a3 encodeDouble:@"nominalWavelength" forKey:self->_rawNominalWavelength];
  [a3 encodeDouble:@"effectiveWavelength" forKey:self->_rawEffectiveWavelength];
  [a3 encodeDouble:@"frequency" forKey:self->_rawFrequency];
  [a3 encodeInt64:self->_nanosecondsSinceStart forKey:@"nanosecondsSinceStart"];
  [a3 encodeObject:self->_normalizedReflectance forKey:@"normalizedReflectance"];
  [a3 encodeObject:self->_whiteNoise forKey:@"whiteNoise"];
  [a3 encodeObject:self->_pinkNoise forKey:@"pinkNoise"];
  [a3 encodeObject:self->_backgroundNoise forKey:@"backgroundNoise"];
  [a3 encodeObject:self->_backgroundNoiseOffset forKey:@"backgroundNoiseOffset"];
  conditions = self->_conditions;

  [a3 encodeObject:conditions forKey:@"conditions"];
}

- (SRPhotoplethysmogramOpticalSample)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRPhotoplethysmogramSample.m", 252, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v23 = [a3 decodeIntegerForKey:@"emitter"];
  uint64_t v22 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"photodiodes"];
  uint64_t v21 = [a3 decodeIntegerForKey:@"hardwareSetting"];
  [a3 decodeDoubleForKey:@"nominalWavelength"];
  double v7 = v6;
  [a3 decodeDoubleForKey:@"effectiveWavelength"];
  double v9 = v8;
  [a3 decodeDoubleForKey:@"frequency"];
  double v11 = v10;
  uint64_t v12 = [a3 decodeInt64ForKey:@"nanosecondsSinceStart"];
  uint64_t v13 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"normalizedReflectance"];
  uint64_t v14 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"whiteNoise"];
  uint64_t v15 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"pinkNoise"];
  uint64_t v16 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundNoise"];
  uint64_t v17 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundNoiseOffset"];
  v18 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = objc_opt_class();
  return -[SRPhotoplethysmogramOpticalSample initWithEmitter:photodiodes:signalIdentifier:nominalWavelength:effectiveWavelength:frequency:timestamp:normalizedReflectance:whiteNoise:pinkNoise:backgroundNoise:backgrounNoiseOffset:conditions:](self, "initWithEmitter:photodiodes:signalIdentifier:nominalWavelength:effectiveWavelength:frequency:timestamp:normalizedReflectance:whiteNoise:pinkNoise:backgroundNoise:backgrounNoiseOffset:conditions:", v23, v22, v21, v12, v13, v14, v7, v9, v11, v15, v16, v17, objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0),
             @"conditions"));
}

- (NSMeasurement)nominalWavelength
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v4 = objc_msgSend(v3, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08CE8], "nanometers"), self->_rawNominalWavelength);

  return (NSMeasurement *)v4;
}

- (NSMeasurement)effectiveWavelength
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v4 = objc_msgSend(v3, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08CE8], "nanometers"), self->_rawEffectiveWavelength);

  return (NSMeasurement *)v4;
}

- (NSMeasurement)samplingFrequency
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v4 = objc_msgSend(v3, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08CC8], "hertz"), self->_rawFrequency);

  return (NSMeasurement *)v4;
}

- (int64_t)emitter
{
  return self->_emitter;
}

- (NSIndexSet)activePhotodiodeIndexes
{
  return self->_activePhotodiodeIndexes;
}

- (int64_t)signalIdentifier
{
  return self->_signalIdentifier;
}

- (int64_t)nanosecondsSinceStart
{
  return self->_nanosecondsSinceStart;
}

- (NSNumber)normalizedReflectance
{
  return self->_normalizedReflectance;
}

- (NSNumber)whiteNoise
{
  return self->_whiteNoise;
}

- (NSNumber)pinkNoise
{
  return self->_pinkNoise;
}

- (NSNumber)backgroundNoise
{
  return self->_backgroundNoise;
}

- (NSNumber)backgroundNoiseOffset
{
  return self->_backgroundNoiseOffset;
}

- (NSArray)conditions
{
  return self->_conditions;
}

@end