@interface CMOdometry
+ (BOOL)supportsSecureCoding;
- (CMOdometry)initWithCoder:(id)a3;
- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 rotationArbitraryToTrueNorth:(float)a13 staticFlag:(int64_t)a14 timestamp:(double)a15;
- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 timestamp:(double)a13;
- (NSNumber)deltaPositionX;
- (NSNumber)deltaPositionY;
- (NSNumber)deltaPositionZ;
- (NSNumber)deltaVelocityX;
- (NSNumber)deltaVelocityY;
- (NSNumber)deltaVelocityZ;
- (NSNumber)quaternionW;
- (NSNumber)quaternionX;
- (NSNumber)quaternionY;
- (NSNumber)quaternionZ;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)staticFlag;
- (unint64_t)referenceFrame;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)rotateArbitraryToTrueNorth;
@end

@implementation CMOdometry

- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 rotationArbitraryToTrueNorth:(float)a13 staticFlag:(int64_t)a14 timestamp:(double)a15
{
  v24.receiver = self;
  v24.super_class = (Class)CMOdometry;
  v22 = [(CMLogItem *)&v24 initWithTimestamp:a15];
  if (v22)
  {
    v22->_deltaPositionX = (NSNumber *)a3;
    v22->_deltaPositionY = (NSNumber *)a4;
    v22->_deltaPositionZ = (NSNumber *)a5;
    v22->_deltaVelocityX = (NSNumber *)a6;
    v22->_deltaVelocityY = (NSNumber *)a7;
    v22->_deltaVelocityZ = (NSNumber *)a8;
    v22->_quaternionX = (NSNumber *)a9;
    v22->_quaternionY = (NSNumber *)a10;
    v22->_quaternionZ = (NSNumber *)a11;
    v22->_quaternionW = (NSNumber *)a12;
    v22->_referenceFrame = 1;
    v22->_rotationArbitraryToTrueNorth = a13;
    v22->_staticFlag = a14;
  }
  return v22;
}

- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 timestamp:(double)a13
{
  return (CMOdometry *)objc_msgSend_initWithDeltaPositionX_deltaPositionY_deltaPositionZ_deltaVelocityX_deltaVelocityY_deltaVelocityZ_quaternionX_quaternionY_quaternionZ_quaternionW_rotationArbitraryToTrueNorth_staticFlag_timestamp_(self, a2, (uint64_t)a3, a4, a5, a6, a7, a8, 0.0, a13, a9, a10, a11, a12, 0);
}

- (void)rotateArbitraryToTrueNorth
{
  if (self->_referenceFrame == 1)
  {
    quaternionX = self->_quaternionX;
    if (quaternionX)
    {
      if (self->_quaternionY)
      {
        if (self->_quaternionZ)
        {
          if (self->_quaternionW)
          {
            float rotationArbitraryToTrueNorth = self->_rotationArbitraryToTrueNorth;
            if (rotationArbitraryToTrueNorth != 0.0)
            {
              uint64_t v73 = 0;
              float v74 = rotationArbitraryToTrueNorth;
              double v5 = sub_1904CF7FC(&v72, (float *)&v73);
              objc_msgSend_floatValue(quaternionX, v6, v7, v5);
              unsigned int v9 = v8;
              objc_msgSend_floatValue(self->_quaternionY, v10, v11);
              unsigned int v13 = v12;
              objc_msgSend_floatValue(self->_quaternionZ, v14, v15);
              unsigned int v17 = v16;
              objc_msgSend_floatValue(self->_quaternionW, v18, v19);
              v71.i64[0] = __PAIR64__(v13, v9);
              v71.i64[1] = __PAIR64__(v20.u32[0], v17);
              float32x4_t v21 = sub_1902D9ACC(&v71, v20);
              sub_1904CF3F4((uint64_t)&v71, v72.f32, &v70, v21);
              float32x4_t v71 = v70;

              id v22 = objc_alloc(NSNumber);
              LODWORD(v23) = v71.i32[0];
              self->_quaternionX = (NSNumber *)objc_msgSend_initWithFloat_(v22, v24, v25, v23);
              id v26 = objc_alloc(NSNumber);
              LODWORD(v27) = v71.i32[1];
              self->_quaternionY = (NSNumber *)objc_msgSend_initWithFloat_(v26, v28, v29, v27);
              id v30 = objc_alloc(NSNumber);
              LODWORD(v31) = v71.i32[2];
              self->_quaternionZ = (NSNumber *)objc_msgSend_initWithFloat_(v30, v32, v33, v31);
              id v34 = objc_alloc(NSNumber);
              LODWORD(v35) = v71.i32[3];
              self->_quaternionW = (NSNumber *)objc_msgSend_initWithFloat_(v34, v36, v37, v35);
              deltaPositionX = self->_deltaPositionX;
              if (deltaPositionX && self->_deltaPositionY)
              {
                objc_msgSend_floatValue(deltaPositionX, v38, v39);
                __int32 v42 = v41;
                objc_msgSend_floatValue(self->_deltaPositionY, v43, v44);
                v70.i32[0] = v42;
                *(uint64_t *)((char *)v70.i64 + 4) = v45;
                sub_1904CF778(v72.f32, (uint64_t)&v70);

                id v46 = objc_alloc(NSNumber);
                LODWORD(v47) = v70.i32[0];
                self->_deltaPositionX = (NSNumber *)objc_msgSend_initWithFloat_(v46, v48, v49, v47);
                id v50 = objc_alloc(NSNumber);
                LODWORD(v51) = v70.i32[1];
                self->_deltaPositionY = (NSNumber *)objc_msgSend_initWithFloat_(v50, v52, v53, v51);
              }
              else
              {

                self->_deltaPositionX = 0;
                self->_deltaPositionY = 0;
              }
              deltaVelocityX = self->_deltaVelocityX;
              if (deltaVelocityX && self->_deltaVelocityY)
              {
                objc_msgSend_floatValue(deltaVelocityX, v54, v55);
                __int32 v58 = v57;
                objc_msgSend_floatValue(self->_deltaVelocityY, v59, v60);
                v70.i32[0] = v58;
                *(uint64_t *)((char *)v70.i64 + 4) = v61;
                sub_1904CF778(v72.f32, (uint64_t)&v70);

                id v62 = objc_alloc(NSNumber);
                LODWORD(v63) = v70.i32[0];
                self->_deltaVelocityX = (NSNumber *)objc_msgSend_initWithFloat_(v62, v64, v65, v63);
                id v66 = objc_alloc(NSNumber);
                LODWORD(v67) = v70.i32[1];
                self->_deltaVelocityY = (NSNumber *)objc_msgSend_initWithFloat_(v66, v68, v69, v67);
              }
              else
              {

                self->_deltaVelocityX = 0;
                self->_deltaVelocityY = 0;
              }
              self->_referenceFrame = 8;
            }
          }
        }
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMOdometry)initWithCoder:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CMOdometry;
  double v5 = -[CMLogItem initWithCoder:](&v24, sel_initWithCoder_);
  if (v5)
  {
    v5->_deltaPositionX = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v4, @"kCMOdometryCodingKeyDeltaPositionX");
    v5->_deltaPositionY = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v6, @"kCMOdometryCodingKeyDeltaPositionY");
    v5->_deltaPositionZ = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v7, @"kCMOdometryCodingKeyDeltaPositionZ");
    v5->_deltaVelocityX = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v8, @"kCMOdometryCodingKeyDeltaVelocityX");
    v5->_deltaVelocityY = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v9, @"kCMOdometryCodingKeyDeltaVelocityY");
    v5->_deltaVelocityZ = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v10, @"kCMOdometryCodingKeyDeltaVelocityZ");
    v5->_quaternionX = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v11, @"kCMOdometryCodingKeyQuaternionX");
    v5->_quaternionY = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v12, @"kCMOdometryCodingKeyQuaternionY");
    v5->_quaternionZ = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v13, @"kCMOdometryCodingKeyQuaternionZ");
    v5->_quaternionW = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v14, @"kCMOdometryCodingKeyQuaternionW");
    objc_msgSend_decodeFloatForKey_(a3, v15, @"kCMOdometryCodingKeyReferenceFrame");
    v5->_referenceFrame = (unint64_t)v16;
    objc_msgSend_decodeFloatForKey_(a3, v17, @"kCMOdometryCodingKeyRotationArbitraryToTrueNort");
    v5->_float rotationArbitraryToTrueNorth = v18;
    float32x4_t v20 = objc_msgSend_decodeObjectForKey_(a3, v19, @"kCMOdometryCodingKeyStaticFlag");
    v5->_staticFlag = objc_msgSend_integerValue(v20, v21, v22);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CMOdometry;
  -[CMLogItem encodeWithCoder:](&v22, sel_encodeWithCoder_);
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_deltaPositionX, @"kCMOdometryCodingKeyDeltaPositionX");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_deltaPositionY, @"kCMOdometryCodingKeyDeltaPositionY");
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_deltaPositionZ, @"kCMOdometryCodingKeyDeltaPositionZ");
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_deltaVelocityX, @"kCMOdometryCodingKeyDeltaVelocityX");
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->_deltaVelocityY, @"kCMOdometryCodingKeyDeltaVelocityY");
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_deltaVelocityZ, @"kCMOdometryCodingKeyDeltaVelocityZ");
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->_quaternionX, @"kCMOdometryCodingKeyQuaternionX");
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->_quaternionY, @"kCMOdometryCodingKeyQuaternionY");
  objc_msgSend_encodeObject_forKey_(a3, v13, (uint64_t)self->_quaternionZ, @"kCMOdometryCodingKeyQuaternionZ");
  objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)self->_quaternionW, @"kCMOdometryCodingKeyQuaternionW");
  *(float *)&double v15 = (float)self->_referenceFrame;
  objc_msgSend_encodeFloat_forKey_(a3, v16, @"kCMOdometryCodingKeyReferenceFrame", v15);
  *(float *)&double v17 = self->_rotationArbitraryToTrueNorth;
  objc_msgSend_encodeFloat_forKey_(a3, v18, @"kCMOdometryCodingKeyRotationArbitraryToTrueNort", v17);
  uint64_t v20 = objc_msgSend_numberWithInteger_(NSNumber, v19, self->_staticFlag);
  objc_msgSend_encodeObject_forKey_(a3, v21, v20, @"kCMOdometryCodingKeyStaticFlag");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMOdometry;
  [(CMLogItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CMOdometry;
  v6 = -[CMLogItem copyWithZone:](&v17, sel_copyWithZone_);
  if (v6)
  {
    v6[3] = objc_msgSend_copyWithZone_(self->_deltaPositionX, v5, (uint64_t)a3);
    v6[4] = objc_msgSend_copyWithZone_(self->_deltaPositionY, v7, (uint64_t)a3);
    v6[5] = objc_msgSend_copyWithZone_(self->_deltaPositionZ, v8, (uint64_t)a3);
    v6[6] = objc_msgSend_copyWithZone_(self->_deltaVelocityX, v9, (uint64_t)a3);
    v6[7] = objc_msgSend_copyWithZone_(self->_deltaVelocityY, v10, (uint64_t)a3);
    v6[8] = objc_msgSend_copyWithZone_(self->_deltaVelocityZ, v11, (uint64_t)a3);
    v6[9] = objc_msgSend_copyWithZone_(self->_quaternionX, v12, (uint64_t)a3);
    v6[10] = objc_msgSend_copyWithZone_(self->_quaternionY, v13, (uint64_t)a3);
    v6[11] = objc_msgSend_copyWithZone_(self->_quaternionZ, v14, (uint64_t)a3);
    v6[12] = objc_msgSend_copyWithZone_(self->_quaternionW, v15, (uint64_t)a3);
    v6[13] = self->_referenceFrame;
    *((_DWORD *)v6 + 4) = LODWORD(self->_rotationArbitraryToTrueNorth);
    v6[14] = self->_staticFlag;
  }
  return v6;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = NSNumber;
  v9.receiver = self;
  v9.super_class = (Class)CMOdometry;
  [(CMLogItem *)&v9 timestamp];
  uint64_t v7 = objc_msgSend_numberWithDouble_(v4, v5, v6);
  return (id)objc_msgSend_stringWithFormat_(v3, (const char *)self->_quaternionW, @"Timestamp, %@, DeltaPositionXYZ, %@, %@, %@, DeltaVelocityXYZ, %@, %@, %@, QuaternionXYZW, %@, %@, %@, %@, ReferenceFrame, %d, StaticFlag, %d", v7, self->_deltaPositionX, self->_deltaPositionY, self->_deltaPositionZ, self->_deltaVelocityX, self->_deltaVelocityY, self->_deltaVelocityZ, self->_quaternionX, self->_quaternionY, self->_quaternionZ, self->_quaternionW, self->_referenceFrame, self->_staticFlag);
}

- (NSNumber)deltaPositionX
{
  return self->_deltaPositionX;
}

- (NSNumber)deltaPositionY
{
  return self->_deltaPositionY;
}

- (NSNumber)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (NSNumber)deltaVelocityX
{
  return self->_deltaVelocityX;
}

- (NSNumber)deltaVelocityY
{
  return self->_deltaVelocityY;
}

- (NSNumber)deltaVelocityZ
{
  return self->_deltaVelocityZ;
}

- (NSNumber)quaternionX
{
  return self->_quaternionX;
}

- (NSNumber)quaternionY
{
  return self->_quaternionY;
}

- (NSNumber)quaternionZ
{
  return self->_quaternionZ;
}

- (NSNumber)quaternionW
{
  return self->_quaternionW;
}

- (unint64_t)referenceFrame
{
  return self->_referenceFrame;
}

- (int64_t)staticFlag
{
  return self->_staticFlag;
}

@end