@interface _CLLSLHeading
+ (BOOL)supportsSecureCoding;
- (_CLLSLHeading)initWithCoder:(id)a3;
- (_CLLSLHeadingSupplInfo)supplemantaryInfo;
- (_CLLSLLocation)location;
- (__n128)rotationFromGlobalToCameraFrame;
- (__n128)rotationFromGlobalToDeviceFrame;
- (__n128)rotationalAccuracyInRadians;
- (__n128)setRotationFromGlobalToCameraFrame:(uint64_t)a3;
- (__n128)setRotationFromGlobalToDeviceFrame:(uint64_t)a3;
- (double)confidence;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4;
- (unint64_t)globalReferenceFrame;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setGlobalReferenceFrame:(unint64_t)a3;
- (void)setLocation:(id)a3;
- (void)setRotationalAccuracyInRadians:(_CLLSLHeading *)self;
- (void)setSupplemantaryInfo:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation _CLLSLHeading

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLLSLHeading;
  [(_CLLSLHeading *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 8) = self->_timestamp;
  long long v6 = *(_OWORD *)&self->_anon_50[32];
  long long v7 = *(_OWORD *)&self->_anon_50[48];
  long long v8 = *(_OWORD *)&self->_anon_50[80];
  *(_OWORD *)(v5 + 144) = *(_OWORD *)&self->_anon_50[64];
  *(_OWORD *)(v5 + 160) = v8;
  *(_OWORD *)(v5 + 112) = v6;
  *(_OWORD *)(v5 + 128) = v7;
  long long v9 = *(_OWORD *)&self->_anon_50[16];
  *(_OWORD *)(v5 + 80) = *(_OWORD *)self->_anon_50;
  *(_OWORD *)(v5 + 96) = v9;
  long long v10 = *(_OWORD *)&self[1]._confidence;
  *(_OWORD *)(v5 + 176) = *(_OWORD *)&self[1].super.isa;
  *(_OWORD *)(v5 + 192) = v10;
  long long v11 = *(_OWORD *)self[1]._anon_50;
  long long v13 = *(_OWORD *)&self[1]._location;
  long long v12 = *(_OWORD *)self[1]._rotationalAccuracyInRadians;
  *(_OWORD *)(v5 + 240) = *(_OWORD *)&self[1]._rotationalAccuracyInRadians[16];
  *(_OWORD *)(v5 + 256) = v11;
  *(_OWORD *)(v5 + 208) = v13;
  *(_OWORD *)(v5 + 224) = v12;
  long long v14 = *(_OWORD *)&self->_rotationalAccuracyInRadians[16];
  *(_OWORD *)(v5 + 48) = *(_OWORD *)self->_rotationalAccuracyInRadians;
  *(_OWORD *)(v5 + 64) = v14;
  *(double *)(v5 + 16) = self->_confidence;
  *(void *)(v5 + 24) = self->_globalReferenceFrame;
  *(void *)(v5 + 32) = [(_CLLSLLocation *)self->_location copyWithZone:a3];
  *(void *)(v5 + 40) = [(_CLLSLHeadingSupplInfo *)self->_supplemantaryInfo copyWithZone:a3];
  return (id)v5;
}

- (_CLLSLHeading)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_CLLSLHeading;
  v4 = [(_CLLSLHeading *)&v14 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"timestamp"];
    v4->_timestamp = v5;
    long long v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"rotationFromGlobalToDeviceFrame"];
    if (v6
      && (long long v7 = v6, [v6 length] == 96)
      && ([v7 getBytes:v4->_anon_50 length:96],
          (long long v8 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"rotationFromGlobalToCameraFrame"]) != 0)&& (v9 = v8, objc_msgSend(v8, "length") == 96)&& (objc_msgSend(v9, "getBytes:length:", &v4[1], 96), (v10 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"rotationalAccuracyInRadians")) != 0)&& (v11 = v10, objc_msgSend(v10, "length") == 32))
    {
      [v11 getBytes:v4->_rotationalAccuracyInRadians length:32];
      [a3 decodeDoubleForKey:@"confidence"];
      v4->_confidence = v12;
      v4->_globalReferenceFrame = [a3 decodeIntegerForKey:@"globalReferenceFrame"];
      v4->_location = (_CLLSLLocation *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
      v4->_supplemantaryInfo = (_CLLSLHeadingSupplInfo *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"supplemantaryInfo"];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"timestamp" forKey:self->_timestamp];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", self->_anon_50, 96), @"rotationFromGlobalToDeviceFrame");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &self[1], 96), @"rotationFromGlobalToCameraFrame");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", self->_rotationalAccuracyInRadians, 32), @"rotationalAccuracyInRadians");
  [a3 encodeDouble:@"confidence" forKey:self->_confidence];
  [a3 encodeInteger:self->_globalReferenceFrame forKey:@"globalReferenceFrame"];
  [a3 encodeObject:self->_location forKey:@"location"];
  supplemantaryInfo = self->_supplemantaryInfo;

  [a3 encodeObject:supplemantaryInfo forKey:@"supplemantaryInfo"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return [(_CLLSLHeading *)self descriptionWithMemberIndent:@"\t" endIndent:&stru_1EE006720];
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  long long v7 = NSString;
  [(_CLLSLHeading *)self timestamp];
  uint64_t v9 = v8;
  if (self)
  {
    [(_CLLSLHeading *)self rotationFromGlobalToDeviceFrame];
    int64x2_t v32 = v53;
    [(_CLLSLHeading *)self rotationFromGlobalToDeviceFrame];
    int64x2_t v31 = v52;
    [(_CLLSLHeading *)self rotationFromGlobalToDeviceFrame];
    uint64_t v30 = v51;
    [(_CLLSLHeading *)self rotationFromGlobalToDeviceFrame];
    *((void *)&v28 + 1) = v50;
    [(_CLLSLHeading *)self rotationFromGlobalToDeviceFrame];
    int64x2_t v27 = v49;
    [(_CLLSLHeading *)self rotationFromGlobalToDeviceFrame];
    int64x2_t v26 = v48;
    [(_CLLSLHeading *)self rotationFromGlobalToDeviceFrame];
    int64x2_t v24 = v47;
    [(_CLLSLHeading *)self rotationFromGlobalToDeviceFrame];
    int64x2_t v25 = v46;
    [(_CLLSLHeading *)self rotationFromGlobalToDeviceFrame];
    uint64_t v23 = v45;
    [(_CLLSLHeading *)self rotationFromGlobalToCameraFrame];
    int64x2_t v22 = v44;
    [(_CLLSLHeading *)self rotationFromGlobalToCameraFrame];
    int64x2_t v20 = v43;
    [(_CLLSLHeading *)self rotationFromGlobalToCameraFrame];
    uint64_t v21 = v42;
    [(_CLLSLHeading *)self rotationFromGlobalToCameraFrame];
    *((void *)&v18 + 1) = v41;
    [(_CLLSLHeading *)self rotationFromGlobalToCameraFrame];
    int64x2_t v19 = v40;
    [(_CLLSLHeading *)self rotationFromGlobalToCameraFrame];
    int64x2_t v16 = v39;
    [(_CLLSLHeading *)self rotationFromGlobalToCameraFrame];
    int64x2_t v17 = v38;
    [(_CLLSLHeading *)self rotationFromGlobalToCameraFrame];
    int64x2_t v15 = v37;
    [(_CLLSLHeading *)self rotationFromGlobalToCameraFrame];
    uint64_t v29 = v36;
    [(_CLLSLHeading *)self rotationalAccuracyInRadians];
    uint64_t v13 = v35;
    [(_CLLSLHeading *)self rotationalAccuracyInRadians];
    unint64_t v14 = vextq_s8(v34, v34, 8uLL).u64[0];
    [(_CLLSLHeading *)self rotationalAccuracyInRadians];
    uint64_t v10 = v33;
  }
  else
  {
    unint64_t v14 = 0;
    int64x2_t v17 = 0u;
    long long v18 = 0u;
    int64x2_t v19 = 0u;
    int64x2_t v20 = 0u;
    uint64_t v21 = 0;
    int64x2_t v22 = 0u;
    int64x2_t v25 = 0u;
    int64x2_t v26 = 0u;
    int64x2_t v27 = 0u;
    long long v28 = 0u;
    int64x2_t v31 = 0u;
    int64x2_t v32 = 0u;
    uint64_t v30 = 0;
    uint64_t v23 = 0;
    int64x2_t v24 = 0u;
    int64x2_t v15 = 0u;
    int64x2_t v16 = 0u;
    uint64_t v13 = 0;
    uint64_t v10 = 0;
    uint64_t v29 = 0;
  }
  [(_CLLSLHeading *)self confidence];
  return (id)objc_msgSend(v7, "stringWithFormat:", @"<_CLLSLHeading: %p> {\n%@.timestamp = %f,\n%@.rotationFromGlobalToDeviceFrame = [%f, %f, %f; %f, %f, %f; %f, %f, %f],\n%@.rotationFromGlobalToCameraFrame = [%f, %f, %f; %f, %f, %f; %f, %f, %f],\n%@.rotationalAccuracyInRadians = [%f, %f, %f],\n%@.confidence = %f,\n%@.globalReferenceFrame = %zu,\n%@.location = %@,\n%@.supplemantryInfo = %@\n%@}",
               self,
               a3,
               v9,
               a3,
               vzip1q_s64(v32, v31),
               v30,
               *((void *)&v28 + 1),
               vzip2q_s64(v27, v26),
               vzip1q_s64(v24, v25),
               v23,
               a3,
               vzip1q_s64(v22, v20),
               v21,
               *((void *)&v18 + 1),
               vzip2q_s64(v19, v16),
               vzip1q_s64(v17, v15),
               v29,
               a3,
               v13,
               v14,
               v10,
               a3,
               v11,
               a3,
               [(_CLLSLHeading *)self globalReferenceFrame],
               a3,
               -[_CLLSLLocation descriptionWithMemberIndent:endIndent:](-[_CLLSLHeading location](self, "location"), "descriptionWithMemberIndent:endIndent:", [a3 stringByAppendingString:@"\t"], objc_msgSend(a4, "stringByAppendingString:", @"\t")), a3, -[_CLLSLHeadingSupplInfo descriptionWithMemberIndent:endIndent:](-[_CLLSLHeading supplemantaryInfo](self, "supplemantaryInfo"), "descriptionWithMemberIndent:endIndent:", objc_msgSend(a3, "stringByAppendingString:", @"\t"), objc_msgSend(a4, "stringByAppendingString:", @"\t")), a4);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__n128)rotationFromGlobalToDeviceFrame
{
  long long v2 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 48) = v2;
  long long v3 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 80) = v3;
  __n128 result = *(__n128 *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 96);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)setRotationFromGlobalToDeviceFrame:(uint64_t)a3
{
  long long v3 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)a3;
  *(_OWORD *)(a1 + 96) = v3;
  __n128 result = *(__n128 *)(a3 + 32);
  long long v5 = *(_OWORD *)(a3 + 48);
  long long v6 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(a1 + 160) = v6;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v5;
  return result;
}

- (__n128)rotationFromGlobalToCameraFrame
{
  long long v2 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 48) = v2;
  long long v3 = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 240);
  *(_OWORD *)(a2 + 80) = v3;
  __n128 result = *(__n128 *)(a1 + 176);
  long long v5 = *(_OWORD *)(a1 + 192);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)setRotationFromGlobalToCameraFrame:(uint64_t)a3
{
  long long v3 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)a3;
  *(_OWORD *)(a1 + 192) = v3;
  __n128 result = *(__n128 *)(a3 + 32);
  long long v5 = *(_OWORD *)(a3 + 48);
  long long v6 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(a1 + 256) = v6;
  *(__n128 *)(a1 + 208) = result;
  *(_OWORD *)(a1 + 224) = v5;
  return result;
}

- (__n128)rotationalAccuracyInRadians
{
  __n128 result = *(__n128 *)(a1 + 48);
  long long v3 = *(_OWORD *)(a1 + 64);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setRotationalAccuracyInRadians:(_CLLSLHeading *)self
{
  long long v3 = v2[1];
  *(_OWORD *)self->_rotationalAccuracyInRadians = *v2;
  *(_OWORD *)&self->_rotationalAccuracyInRadians[16] = v3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (unint64_t)globalReferenceFrame
{
  return self->_globalReferenceFrame;
}

- (void)setGlobalReferenceFrame:(unint64_t)a3
{
  self->_globalReferenceFrame = a3;
}

- (_CLLSLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (_CLLSLHeadingSupplInfo)supplemantaryInfo
{
  return self->_supplemantaryInfo;
}

- (void)setSupplemantaryInfo:(id)a3
{
}

@end