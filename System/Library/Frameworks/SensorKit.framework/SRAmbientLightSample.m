@interface SRAmbientLightSample
+ (BOOL)supportsSecureCoding;
- (NSMeasurement)lux;
- (NSString)placementString;
- (NSString)typeString;
- (SRAmbientLightChromaticity)chromaticity;
- (SRAmbientLightSample)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRAmbientLightSample)initWithCoder:(id)a3;
- (SRAmbientLightSample)initWithSRALSSampleStruct:(id *)a3;
- (SRAmbientLightSensorPlacement)placement;
- (id)binarySampleRepresentation;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRAmbientLightSample

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRAmbientLightSample)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRAmbientLightSample.m", 66, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  v10[0] = [a3 decodeIntegerForKey:@"sensorType"];
  v10[1] = (int)[a3 decodeIntegerForKey:@"placement"];
  [a3 decodeFloatForKey:@"lux"];
  int v11 = v6;
  [a3 decodeFloatForKey:@"x"];
  int v12 = v7;
  [a3 decodeFloatForKey:@"y"];
  uint64_t v13 = v8;
  return [(SRAmbientLightSample *)self initWithSRALSSampleStruct:v10];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRAmbientLightSample.m", 79, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeInteger:self->_type forKey:@"sensorType"];
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRAmbientLightSample placement](self, "placement"), @"placement");
  [(NSMeasurement *)[(SRAmbientLightSample *)self lux] doubleValue];
  objc_msgSend(a3, "encodeDouble:forKey:", @"lux");
  [(SRAmbientLightSample *)self chromaticity];
  objc_msgSend(a3, "encodeFloat:forKey:", @"x");
  [(SRAmbientLightSample *)self chromaticity];
  LODWORD(v7) = v6;

  [a3 encodeFloat:@"y" forKey:v7];
}

- (id)binarySampleRepresentation
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (SRAmbientLightSample)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend(a3, "length", a5))
  {
    v11.receiver = self;
    v11.super_class = (Class)SRAmbientLightSample;
    double v7 = [(SRAmbientLightSample *)&v11 init];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:0];
      if (v8)
      {
        v9 = (void *)v8;

        return (SRAmbientLightSample *)v9;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

- (SRAmbientLightSample)initWithSRALSSampleStruct:(id *)a3
{
  if (!a3) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)SRAmbientLightSample;
  v4 = [(SRAmbientLightSample *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3->var0;
    v4->_placement = a3->var1;
    id v6 = objc_alloc(MEMORY[0x263F08980]);
    v5->_lux = (NSMeasurement *)objc_msgSend(v6, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08CD8], "lux"), a3->var2);
    v5->_chromaticity = ($38C3DEC81229B66F67FB6D350D75FF5A)a3->var3;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRAmbientLightSample;
  [(SRAmbientLightSample *)&v3 dealloc];
}

- (NSString)typeString
{
  int64_t type = self->_type;
  objc_super v3 = @"Unknown";
  if (type == 1) {
    objc_super v3 = @"Color";
  }
  if (type) {
    return &v3->isa;
  }
  else {
    return (NSString *)@"Monochromatic";
  }
}

- (NSString)placementString
{
  SRAmbientLightSensorPlacement v2 = [(SRAmbientLightSample *)self placement];
  if ((unint64_t)(v2 - 1) > 7) {
    return (NSString *)@"Unknown";
  }
  else {
    return &off_26452E3A0[v2 - 1]->isa;
  }
}

- (id)sr_dictionaryRepresentation
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"sensorType";
  v10[0] = [NSNumber numberWithInteger:self->_type];
  v9[1] = @"placement";
  v10[1] = [NSNumber numberWithInteger:self->_placement];
  v9[2] = @"chromaticity";
  v7[0] = @"x";
  *(float *)&double v3 = self->_chromaticity.x;
  v7[1] = @"y";
  v8[0] = [NSNumber numberWithFloat:v3];
  *(float *)&double v4 = self->_chromaticity.y;
  v8[1] = [NSNumber numberWithFloat:v4];
  void v10[2] = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v9[3] = @"lux";
  v5 = NSNumber;
  [(NSMeasurement *)self->_lux doubleValue];
  v10[3] = objc_msgSend(v5, "numberWithDouble:");
  return (id)[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
}

- (SRAmbientLightSensorPlacement)placement
{
  return self->_placement;
}

- (SRAmbientLightChromaticity)chromaticity
{
  objc_copyStruct(dest, &self->_chromaticity, 8, 1, 0);
  float v2 = *(float *)dest;
  float v3 = *(float *)&dest[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSMeasurement)lux
{
  return (NSMeasurement *)objc_getProperty(self, a2, 32, 1);
}

@end