@interface CBColorSample
- ($1AB5FA073B851C12C2339EC22442E995)Lab;
- ($1AB5FA073B851C12C2339EC22442E995)XYZ;
- ($F24F406B2B787EFB06265DBA3D28CBD5)xy;
- (CBColorSample)init;
- (CBColorSample)initWithChromaticity:(id)a3 illuminance:(double)a4 andTempterature:(double)a5;
- (CBColorSample)initWithHIDEvent:(__IOHIDEvent *)a3;
- (CBColorSample)initWithTristimulus:(id)a3 illuminance:(double)a4 andTempterature:(double)a5;
- (double)CCT;
- (double)CCTDifferenceWith:(id)a3;
- (double)LuxDifferenceWith:(id)a3;
- (double)colorDeltaEWith:(id)a3;
- (double)lux;
- (id)copyDataInDictionary;
- (id)description;
- (int64_t)colorBin;
- (unint64_t)mode;
- (unint64_t)type;
- (void)fillInChromaticity;
- (void)fillInTristimulus;
- (void)setMode:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setXYZ:(id)a3;
- (void)setXy:(id)a3;
@end

@implementation CBColorSample

- (CBColorSample)init
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CBColorSample;
  v5 = [(CBColorSample *)&v3 init];
  if (v5)
  {
    v5->_lux = -1.0;
    v5->_CCT = 0.0;
    v5->_XYZ.X = 0.0;
    v5->_XYZ.Y = 0.0;
    v5->_XYZ.Z = 0.0;
    v5->_xy.x = 0.0;
    v5->_xy.y = 0.0;
  }
  return v5;
}

- (CBColorSample)initWithTristimulus:(id)a3 illuminance:(double)a4 andTempterature:(double)a5
{
  *(double *)&long long v12 = a3.var0;
  *((void *)&v12 + 1) = *(void *)&a3.var1;
  double var2 = a3.var2;
  v11 = (char *)self;
  SEL v10 = a2;
  double v9 = a4;
  double v8 = a5;
  v7.receiver = self;
  v7.super_class = (Class)CBColorSample;
  v11 = [(CBColorSample *)&v7 init];
  if (v11)
  {
    *((double *)v11 + 1) = v9;
    *((double *)v11 + 2) = v8;
    v5 = (double *)v11;
    *(_OWORD *)(v11 + 56) = v12;
    v5[9] = var2;
    [v11 fillInChromaticity];
  }
  return (CBColorSample *)v11;
}

- (CBColorSample)initWithChromaticity:(id)a3 illuminance:(double)a4 andTempterature:(double)a5
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v11 = a3;
  SEL v10 = (char *)self;
  SEL v9 = a2;
  double v8 = a4;
  double v7 = a5;
  v6.receiver = self;
  v6.super_class = (Class)CBColorSample;
  SEL v10 = [(CBColorSample *)&v6 init];
  if (v10)
  {
    *((double *)v10 + 1) = v8;
    *((double *)v10 + 2) = v7;
    *($F24F406B2B787EFB06265DBA3D28CBD5 *)(v10 + 40) = v11;
    [v10 fillInTristimulus];
  }
  return (CBColorSample *)v10;
}

- (CBColorSample)initWithHIDEvent:(__IOHIDEvent *)a3
{
  v24 = self;
  SEL v23 = a2;
  v22 = a3;
  if (IOHIDEventGetType() == 12)
  {
    if (IOHIDEventGetIntegerValue() == 1)
    {
      v15.receiver = v24;
      v15.super_class = (Class)CBColorSample;
      v24 = [(CBColorSample *)&v15 init];
      if (v24)
      {
        IOHIDEventGetDoubleValue();
        v24->_lux = v3;
        IOHIDEventGetDoubleValue();
        v24->_CCT = v4;
        IOHIDEventGetDoubleValue();
        v24->_XYZ.X = v5;
        IOHIDEventGetDoubleValue();
        v24->_XYZ.Y = v6;
        IOHIDEventGetDoubleValue();
        v24->_XYZ.Z = v7;
        [(CBColorSample *)v24 fillInChromaticity];
      }
      return v24;
    }
    else
    {
      v18 = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        inited = init_default_corebrightness_log();
      }
      v18 = inited;
      char v17 = 16;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        SEL v9 = v18;
        os_log_type_t v10 = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_error_impl(&dword_1BA438000, v9, v10, "ERROR: unsupported color space", v16, 2u);
      }
      return 0;
    }
  }
  else
  {
    v21 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      v14 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      v14 = init_default_corebrightness_log();
    }
    v21 = v14;
    char v20 = 16;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      log = v21;
      os_log_type_t type = v20;
      __os_log_helper_16_0_0(v19);
      _os_log_error_impl(&dword_1BA438000, log, type, "ERROR: not an ALS event", v19, 2u);
    }
    return 0;
  }
}

- (void)setXy:(id)a3
{
  self->_xy = ($69B62588CC25CB7767350DB9F5F34ADF)a3;
  [(CBColorSample *)self fillInTristimulus];
}

- (void)setXYZ:(id)a3
{
  self->_XYZ = ($2ECA4ECC36AE74DF8ED1D9484503D891)a3;
  [(CBColorSample *)self fillInChromaticity];
}

- (void)fillInChromaticity
{
  if (self->_XYZ.X + self->_XYZ.Y + self->_XYZ.Z == 0.0)
  {
    self->_xy.x = 0.0;
    self->_xy.y = 0.0;
  }
  else
  {
    self->_xy.x = self->_XYZ.X / (self->_XYZ.X + self->_XYZ.Y + self->_XYZ.Z);
    self->_xy.y = self->_XYZ.Y / (self->_XYZ.X + self->_XYZ.Y + self->_XYZ.Z);
  }
}

- (void)fillInTristimulus
{
  if (self->_xy.y == 0.0)
  {
    self->_XYZ.X = 0.0;
    self->_XYZ.Y = 0.0;
    self->_XYZ.Z = 0.0;
  }
  else
  {
    self->_XYZ.X = self->_xy.x / self->_xy.y * self->_lux / 3.14159265;
    self->_XYZ.Y = self->_lux / 3.14159265;
    self->_XYZ.Z = (1.0 - self->_xy.x - self->_xy.y) / self->_xy.y * self->_XYZ.Y;
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)Lab
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  $F24F406B2B787EFB06265DBA3D28CBD5 v11 = self;
  SEL v10 = a2;
  uint64_t v12 = 0;
  float v13 = 0.0;
  float X = self->_XYZ.X;
  *(float *)&uint64_t v12 = X;
  float Y = self->_XYZ.Y;
  *((float *)&v12 + 1) = Y;
  float Z = self->_XYZ.Z;
  float v13 = Z;
  uint64_t v8 = 0;
  float v9 = 0.0;
  CFXTristimulus2Lab((float *)&v12, (float *)&v8);
  double v5 = v9;
  double v6 = *((float *)&v8 + 1);
  double v7 = *(float *)&v8;
  result.double var2 = v5;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

- (double)colorDeltaEWith:(id)a3
{
  double v18 = 0.0;
  if (a3)
  {
    [(CBColorSample *)self Lab];
    double v15 = v3;
    double v16 = v4;
    double v17 = v5;
    [a3 Lab];
    double v13 = v6;
    double v14 = v7;
    double v11 = pow(v15 - v8, 2.0);
    long double v12 = v11 + pow(v16 - v13, 2.0);
    long double v9 = pow(v17 - v14, 2.0);
    return pow(v12 + v9, 0.5);
  }
  return v18;
}

- (double)CCTDifferenceWith:(id)a3
{
  double v7 = 0.0;
  if (a3)
  {
    [(CBColorSample *)self CCT];
    double v6 = v3;
    [a3 CCT];
    return vabdd_f64(v6, v4);
  }
  return v7;
}

- (double)LuxDifferenceWith:(id)a3
{
  double v7 = 0.0;
  if (a3)
  {
    [(CBColorSample *)self lux];
    double v6 = v3;
    [a3 lux];
    return vabdd_f64(v6, v4);
  }
  return v7;
}

- (int64_t)colorBin
{
  double v7 = self;
  v6[1] = a2;
  v6[0] = 0;
  [(CBColorSample *)self xy];
  *(float *)&double v2 = v2;
  LODWORD(v6[0]) = LODWORD(v2);
  [(CBColorSample *)v7 xy];
  float v4 = v3;
  *((float *)v6 + 1) = v4;
  return (int)CFXAnsiBinFromChromaticity((float *)v6);
}

- (id)copyDataInDictionary
{
  double v11 = self;
  SEL v10 = a2;
  long double v9 = 0;
  id v8 = 0;
  v3[12] = 0x1E4F28000uLL;
  id v8 = (id)[objc_alloc(NSNumber) initWithDouble:self->_lux];
  id v7 = 0;
  id v7 = (id)[objc_alloc(NSNumber) initWithDouble:v11->_CCT];
  id v6 = 0;
  id v6 = (id)[objc_alloc(NSNumber) initWithDouble:v11->_xy.x];
  id v5 = 0;
  id v5 = (id)[objc_alloc(NSNumber) initWithDouble:v11->_xy.y];
  id v4 = 0;
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:v11->_mode];
  if (v8 && v7 && v6 && v5 && v4)
  {
    v3[11] = v3;
    long double v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"lux", v7, @"CCT", v6, @"x", v5, @"y", v4, @"mode", 0);
  }

  return v9;
}

- (id)description
{
  id v4 = self;
  SEL v3 = a2;
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Lux = %f; CCT = %f; XYfloat Z = [%f, %f, %f]; xy = [%f, %f]",
               *(void *)&self->_lux,
               *(void *)&self->_CCT,
               *(void *)&self->_XYZ.X,
               *(void *)&self->_XYZ.Y,
               *(void *)&self->_XYZ.Z,
               *(void *)&self->_xy.x,
               *(void *)&self->_xy.y);
}

- (double)lux
{
  return self->_lux;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)xy
{
  double y = self->_xy.y;
  double x = self->_xy.x;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)XYZ
{
  double Y = self->_XYZ.Y;
  double X = self->_XYZ.X;
  double Z = self->_XYZ.Z;
  result.double var2 = Z;
  result.var1 = Y;
  result.var0 = X;
  return result;
}

- (double)CCT
{
  return self->_CCT;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_os_log_type_t type = a3;
}

@end