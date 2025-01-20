@interface CVASpuFastPathComboAxisData
+ (BOOL)supportsSecureCoding;
+ (double)getTimestamp:(id)a3;
+ (id)classes;
- (CVASpuFastPathComboAxisData)initWithCoder:(id)a3;
- (CVASpuFastPathComboAxisData)initWithFastPathIMUData:(id)a3;
- (double)timestamp;
- (id)debugDescription;
- (id)dictionary;
- (int)ax;
- (int)ay;
- (int)az;
- (int)gx;
- (int)gy;
- (int)gz;
- (int)temperature;
- (int)unfiltered_ax;
- (int)unfiltered_ay;
- (int)unfiltered_az;
- (unint64_t)frameId;
- (unint64_t)syncTimestamp;
- (unsigned)packetType;
- (unsigned)sample_id;
- (unsigned)valid_data;
- (void)encodeWithCoder:(id)a3;
- (void)setAx:(int)a3;
- (void)setAy:(int)a3;
- (void)setAz:(int)a3;
- (void)setFrameId:(unint64_t)a3;
- (void)setGx:(int)a3;
- (void)setGy:(int)a3;
- (void)setGz:(int)a3;
- (void)setPacketType:(unsigned int)a3;
- (void)setSample_id:(unsigned int)a3;
- (void)setSyncTimestamp:(unint64_t)a3;
- (void)setTemperature:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)setUnfiltered_ax:(int)a3;
- (void)setUnfiltered_ay:(int)a3;
- (void)setUnfiltered_az:(int)a3;
- (void)setValid_data:(unsigned int)a3;
@end

@implementation CVASpuFastPathComboAxisData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58BC8 == -1)
  {
    v2 = (void *)qword_267C58BC0;
  }
  else
  {
    dispatch_once(&qword_267C58BC8, &unk_26CB5E378);
    v2 = (void *)qword_267C58BC0;
  }
  return v2;
}

- (CVASpuFastPathComboAxisData)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CVASpuFastPathComboAxisData;
  v5 = [(CVASpuFastPathComboAxisData *)&v9 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    v5->_packetType = [v4 decodeInt32ForKey:@"pt"];
    v5->_sample_id = [v4 decodeInt32ForKey:@"si"];
    v5->_valid_data = [v4 decodeInt32ForKey:@"vd"];
    v5->_ax = [v4 decodeInt32ForKey:@"ax"];
    v5->_ay = [v4 decodeInt32ForKey:@"ay"];
    v5->_az = [v4 decodeInt32ForKey:@"az"];
    v5->_unfiltered_ax = [v4 decodeInt32ForKey:@"uax"];
    v5->_unfiltered_ay = [v4 decodeInt32ForKey:@"uay"];
    v5->_unfiltered_az = [v4 decodeInt32ForKey:@"uaz"];
    v5->_gx = [v4 decodeInt32ForKey:@"gx"];
    v5->_gy = [v4 decodeInt32ForKey:@"gy"];
    v5->_gz = [v4 decodeInt32ForKey:@"gz"];
    v5->_temperature = [v4 decodeInt32ForKey:@"p"];
    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v7;
    v5->_syncTimestamp = [v4 decodeInt64ForKey:@"st"];
    v5->_frameId = [v4 decodeInt64ForKey:@"fi"];
  }

  return v5;
}

- (CVASpuFastPathComboAxisData)initWithFastPathIMUData:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CVASpuFastPathComboAxisData;
  v5 = [(CVASpuFastPathComboAxisData *)&v18 init];
  if (v5)
  {
    v6 = (unsigned __int16 *)[v4 bytes];
    double v7 = v6;
    int v8 = *v6;
    if (v8 == 3)
    {
      CMClockMakeHostTimeFromSystemUnits(&time, *((void *)v6 + 1));
      *((Float64 *)v5 + 8) = CMTimeGetSeconds(&time);
      *((void *)v5 + 10) = -1;
      int v12 = *((_DWORD *)v7 + 4);
      *((void *)v5 + 9) = *((void *)v7 + 1);
      int v13 = v7[10];
      *((_DWORD *)v5 + 2) = v12;
      *((_DWORD *)v5 + 3) = v13;
      *((_DWORD *)v5 + 14) = vcvtd_n_s64_f64(*((double *)v7 + 3), 0x10uLL);
      *((_DWORD *)v5 + 4) = *((_DWORD *)v7 + 8);
      *((_DWORD *)v5 + 5) = vcvtd_n_s64_f64(*((double *)v7 + 5), 0x10uLL);
      *((int32x2_t *)v5 + 3) = vmovn_s64(vcvtq_n_s64_f64(*((float64x2_t *)v7 + 3), 0x10uLL));
      *((_DWORD *)v5 + 8) = vcvtd_n_s64_f64(*((double *)v7 + 8), 0x10uLL);
      *(int32x2_t *)(v5 + 36) = vmovn_s64(vcvtq_n_s64_f64(*(float64x2_t *)(v7 + 36), 0x10uLL));
      *((_DWORD *)v5 + 11) = vcvtd_n_s64_f64(*((double *)v7 + 11), 0x10uLL);
      double v14 = *((double *)v7 + 13);
      *((_DWORD *)v5 + 12) = vcvtd_n_s64_f64(*((double *)v7 + 12), 0x10uLL);
      unsigned int v11 = vcvtd_n_s64_f64(v14, 0x10uLL);
    }
    else
    {
      if (v8 != 1)
      {
        v15 = 0;
        goto LABEL_9;
      }
      *((void *)v5 + 8) = *((void *)v6 + 1);
      *((void *)v5 + 10) = *((void *)v6 + 2);
      int v9 = *((_DWORD *)v6 + 6);
      *((void *)v5 + 9) = *(void *)(v6 + 14);
      int v10 = v6[18];
      *((_DWORD *)v5 + 2) = v9;
      *((_DWORD *)v5 + 3) = v10;
      *((_DWORD *)v5 + 14) = *(_DWORD *)(v6 + 19);
      *((_DWORD *)v5 + 4) = *(_DWORD *)(v6 + 21);
      *((_DWORD *)v5 + 5) = *(_DWORD *)(v6 + 23);
      *((_DWORD *)v5 + 6) = *(_DWORD *)(v6 + 25);
      *((_DWORD *)v5 + 7) = *(_DWORD *)(v6 + 27);
      *((_DWORD *)v5 + 8) = *(_DWORD *)(v6 + 29);
      *((_DWORD *)v5 + 9) = *(_DWORD *)(v6 + 31);
      *((_DWORD *)v5 + 10) = *(_DWORD *)(v6 + 33);
      *((_DWORD *)v5 + 11) = *(_DWORD *)(v6 + 35);
      *((_DWORD *)v5 + 12) = *(_DWORD *)(v6 + 37);
      unsigned int v11 = *(_DWORD *)(v6 + 39);
    }
    *((_DWORD *)v5 + 13) = v11;
  }
  v15 = v5;
LABEL_9:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeInt32:self->_packetType forKey:@"pt"];
  [v5 encodeInt32:self->_sample_id forKey:@"si"];
  [v5 encodeInt32:self->_valid_data forKey:@"vd"];
  [v5 encodeInt32:self->_ax forKey:@"ax"];
  [v5 encodeInt32:self->_ay forKey:@"ay"];
  [v5 encodeInt32:self->_az forKey:@"az"];
  [v5 encodeInt32:self->_unfiltered_ax forKey:@"uax"];
  [v5 encodeInt32:self->_unfiltered_ay forKey:@"uay"];
  [v5 encodeInt32:self->_unfiltered_az forKey:@"uaz"];
  [v5 encodeInt32:self->_gx forKey:@"gx"];
  [v5 encodeInt32:self->_gy forKey:@"gy"];
  [v5 encodeInt32:self->_gz forKey:@"gz"];
  [v5 encodeInt32:self->_temperature forKey:@"p"];
  [v5 encodeDouble:@"t" forKey:self->_timestamp];
  [v5 encodeInt64:self->_syncTimestamp forKey:@"st"];
  [v5 encodeInt64:self->_frameId forKey:@"fi"];
}

+ (double)getTimestamp:(id)a3
{
  return *(double *)([a3 bytes] + 8);
}

- (id)dictionary
{
  v22[16] = *MEMORY[0x263EF8340];
  v21[0] = @"pt";
  v20 = [NSNumber numberWithUnsignedInt:self->_packetType];
  v22[0] = v20;
  v21[1] = @"si";
  v19 = [NSNumber numberWithUnsignedInt:self->_sample_id];
  v22[1] = v19;
  v21[2] = @"vd";
  objc_super v18 = [NSNumber numberWithUnsignedInt:self->_valid_data];
  v22[2] = v18;
  v21[3] = @"ax";
  v17 = [NSNumber numberWithInt:self->_ax];
  v22[3] = v17;
  v21[4] = @"ay";
  v16 = [NSNumber numberWithInt:self->_ay];
  v22[4] = v16;
  v21[5] = @"az";
  v15 = [NSNumber numberWithInt:self->_az];
  v22[5] = v15;
  v21[6] = @"uax";
  double v14 = [NSNumber numberWithInt:self->_unfiltered_ax];
  v22[6] = v14;
  v21[7] = @"uay";
  v3 = [NSNumber numberWithInt:self->_unfiltered_ay];
  v22[7] = v3;
  v21[8] = @"uaz";
  id v4 = [NSNumber numberWithInt:self->_unfiltered_az];
  v22[8] = v4;
  v21[9] = @"gx";
  id v5 = [NSNumber numberWithInt:self->_gx];
  v22[9] = v5;
  v21[10] = @"gy";
  v6 = [NSNumber numberWithInt:self->_gy];
  v22[10] = v6;
  v21[11] = @"gz";
  double v7 = [NSNumber numberWithInt:self->_gz];
  v22[11] = v7;
  v21[12] = @"p";
  int v8 = [NSNumber numberWithInt:self->_temperature];
  v22[12] = v8;
  v21[13] = @"t";
  int v9 = [NSNumber numberWithDouble:self->_timestamp];
  v22[13] = v9;
  v21[14] = @"st";
  int v10 = [NSNumber numberWithUnsignedLongLong:self->_syncTimestamp];
  v22[14] = v10;
  v21[15] = @"fi";
  unsigned int v11 = [NSNumber numberWithUnsignedLongLong:self->_frameId];
  v22[15] = v11;
  int v12 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:16];

  return v12;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CVASpuFastPathComboAxisData *)self dictionary];
  v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unsigned)packetType
{
  return self->_packetType;
}

- (void)setPacketType:(unsigned int)a3
{
  self->_packetType = a3;
}

- (unint64_t)syncTimestamp
{
  return self->_syncTimestamp;
}

- (void)setSyncTimestamp:(unint64_t)a3
{
  self->_syncTimestamp = a3;
}

- (unsigned)sample_id
{
  return self->_sample_id;
}

- (void)setSample_id:(unsigned int)a3
{
  self->_sample_id = a3;
}

- (unsigned)valid_data
{
  return self->_valid_data;
}

- (void)setValid_data:(unsigned int)a3
{
  self->_valid_data = a3;
}

- (int)ax
{
  return self->_ax;
}

- (void)setAx:(int)a3
{
  self->_ax = a3;
}

- (int)ay
{
  return self->_ay;
}

- (void)setAy:(int)a3
{
  self->_ay = a3;
}

- (int)az
{
  return self->_az;
}

- (void)setAz:(int)a3
{
  self->_az = a3;
}

- (int)unfiltered_ax
{
  return self->_unfiltered_ax;
}

- (void)setUnfiltered_ax:(int)a3
{
  self->_unfiltered_ax = a3;
}

- (int)unfiltered_ay
{
  return self->_unfiltered_ay;
}

- (void)setUnfiltered_ay:(int)a3
{
  self->_unfiltered_ay = a3;
}

- (int)unfiltered_az
{
  return self->_unfiltered_az;
}

- (void)setUnfiltered_az:(int)a3
{
  self->_unfiltered_az = a3;
}

- (int)gx
{
  return self->_gx;
}

- (void)setGx:(int)a3
{
  self->_gx = a3;
}

- (int)gy
{
  return self->_gy;
}

- (void)setGy:(int)a3
{
  self->_gy = a3;
}

- (int)gz
{
  return self->_gz;
}

- (void)setGz:(int)a3
{
  self->_gz = a3;
}

- (int)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(int)a3
{
  self->_temperature = a3;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

@end