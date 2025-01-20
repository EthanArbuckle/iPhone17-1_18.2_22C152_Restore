@interface CRXFAppClipCode
+ (id)appClipCodeWithBlock:(id)a3;
- (BOOL)cylLeftSignFlipped;
- (BOOL)cylRightSignFlipped;
- (BOOL)hasLeftAndRightRX;
- (BOOL)hasLeftRX;
- (BOOL)hasOnlyLeftRX;
- (BOOL)hasOnlyRightRX;
- (BOOL)hasRightRX;
- (BOOL)hasSingleLensRX;
- (BOOL)isLeftRXOutsideSupportedRange;
- (BOOL)isRightRXOutsideSupportedRange;
- (CRXFAppClipCode)initWithVersion:(unint64_t)a3 lensType:(unint64_t)a4 cylLeftSignFlipped:(BOOL)a5 cylRightSignFlipped:(BOOL)a6 leftRXID:(unint64_t)a7 leftCalibrationRXID:(unint64_t)a8 leftDisplaySphere:(float)a9 leftDisplayCylinder:(float)a10 leftCalibrationSphere:(float)a11 leftCalibrationCylinder:(float)a12 leftAddVR:(float)a13 leftAxisID:(unint64_t)a14 leftDisplayAxis:(unint64_t)a15 leftCalibrationAxis:(unint64_t)a16 leftClamping:(unint64_t)a17 rightRXID:(unint64_t)a18 rightCalibrationRXID:(unint64_t)a19 rightDisplaySphere:(float)a20 rightDisplayCylinder:(float)a21 rightCalibrationSphere:(float)a22 rightCalibrationCylinder:(float)a23 rightAddVR:(float)a24 rightAxisID:(unint64_t)a25 rightDisplayAxis:(unint64_t)a26 rightCalibrationAxis:(unint64_t)a27 rightClamping:(unint64_t)a28 identifyingColor:(unint64_t)a29 secret:(id)a30 randomBits:(unint64_t)a31;
- (NSData)secret;
- (float)leftAddVR;
- (float)leftCalibrationCylinder;
- (float)leftCalibrationSphere;
- (float)leftDisplayCylinder;
- (float)leftDisplaySphere;
- (float)rightAddVR;
- (float)rightCalibrationCylinder;
- (float)rightCalibrationSphere;
- (float)rightDisplayCylinder;
- (float)rightDisplaySphere;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)identifyingColor;
- (unint64_t)leftAxisID;
- (unint64_t)leftCalibrationAxis;
- (unint64_t)leftCalibrationRXID;
- (unint64_t)leftClamping;
- (unint64_t)leftDisplayAxis;
- (unint64_t)leftRXID;
- (unint64_t)lensType;
- (unint64_t)randomBits;
- (unint64_t)rightAxisID;
- (unint64_t)rightCalibrationAxis;
- (unint64_t)rightCalibrationRXID;
- (unint64_t)rightClamping;
- (unint64_t)rightDisplayAxis;
- (unint64_t)rightRXID;
- (unint64_t)version;
@end

@implementation CRXFAppClipCode

- (CRXFAppClipCode)initWithVersion:(unint64_t)a3 lensType:(unint64_t)a4 cylLeftSignFlipped:(BOOL)a5 cylRightSignFlipped:(BOOL)a6 leftRXID:(unint64_t)a7 leftCalibrationRXID:(unint64_t)a8 leftDisplaySphere:(float)a9 leftDisplayCylinder:(float)a10 leftCalibrationSphere:(float)a11 leftCalibrationCylinder:(float)a12 leftAddVR:(float)a13 leftAxisID:(unint64_t)a14 leftDisplayAxis:(unint64_t)a15 leftCalibrationAxis:(unint64_t)a16 leftClamping:(unint64_t)a17 rightRXID:(unint64_t)a18 rightCalibrationRXID:(unint64_t)a19 rightDisplaySphere:(float)a20 rightDisplayCylinder:(float)a21 rightCalibrationSphere:(float)a22 rightCalibrationCylinder:(float)a23 rightAddVR:(float)a24 rightAxisID:(unint64_t)a25 rightDisplayAxis:(unint64_t)a26 rightCalibrationAxis:(unint64_t)a27 rightClamping:(unint64_t)a28 identifyingColor:(unint64_t)a29 secret:(id)a30 randomBits:(unint64_t)a31
{
  id v46 = a30;
  v49.receiver = self;
  v49.super_class = (Class)CRXFAppClipCode;
  v47 = [(CRXFAppClipCode *)&v49 init];
  if (v47)
  {
    v47->_version = a3;
    v47->_lensType = a4;
    v47->_cylLeftSignFlipped = a5;
    v47->_cylRightSignFlipped = a6;
    v47->_leftRXID = a7;
    v47->_leftCalibrationRXID = a8;
    v47->_leftDisplaySphere = a9;
    v47->_leftDisplayCylinder = a10;
    v47->_leftCalibrationSphere = a11;
    v47->_leftCalibrationCylinder = a12;
    v47->_leftAxisID = a14;
    v47->_leftCalibrationAxis = a16;
    v47->_leftDisplayAxis = a15;
    v47->_leftClamping = a17;
    v47->_rightRXID = a18;
    v47->_rightCalibrationRXID = a19;
    v47->_leftAddVR = a13;
    v47->_rightDisplaySphere = a20;
    v47->_rightDisplayCylinder = a21;
    v47->_rightCalibrationSphere = a22;
    v47->_rightCalibrationCylinder = a23;
    v47->_rightAddVR = a24;
    v47->_rightAxisID = a25;
    v47->_rightCalibrationAxis = a27;
    v47->_rightDisplayAxis = a26;
    v47->_rightClamping = a28;
    v47->_identifyingColor = a29;
    objc_storeStrong((id *)&v47->_secret, a30);
    v47->_randomBits = a31;
  }

  return v47;
}

+ (id)appClipCodeWithBlock:(id)a3
{
  v3 = (void (**)(id, CRXFAppClipCodeBuilder *))a3;
  v4 = objc_alloc_init(CRXFAppClipCodeBuilder);
  v3[2](v3, v4);

  v5 = [(CRXFAppClipCodeBuilder *)v4 build];

  return v5;
}

- (BOOL)hasLeftRX
{
  return self->_leftRXID != 0;
}

- (BOOL)hasRightRX
{
  return self->_rightRXID != 0;
}

- (BOOL)hasOnlyLeftRX
{
  BOOL v3 = [(CRXFAppClipCode *)self hasLeftRX];
  if (v3) {
    LOBYTE(v3) = ![(CRXFAppClipCode *)self hasRightRX];
  }
  return v3;
}

- (BOOL)hasOnlyRightRX
{
  BOOL v3 = [(CRXFAppClipCode *)self hasRightRX];
  if (v3) {
    LOBYTE(v3) = ![(CRXFAppClipCode *)self hasLeftRX];
  }
  return v3;
}

- (BOOL)hasSingleLensRX
{
  if ([(CRXFAppClipCode *)self hasOnlyLeftRX]) {
    return 1;
  }
  return [(CRXFAppClipCode *)self hasOnlyRightRX];
}

- (BOOL)hasLeftAndRightRX
{
  BOOL v3 = [(CRXFAppClipCode *)self hasLeftRX];
  if (v3)
  {
    LOBYTE(v3) = [(CRXFAppClipCode *)self hasRightRX];
  }
  return v3;
}

- (BOOL)isLeftRXOutsideSupportedRange
{
  return self->_leftRXID == 1023;
}

- (BOOL)isRightRXOutsideSupportedRange
{
  return self->_rightRXID == 1023;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[CRXFAppClipCode allocWithZone:](CRXFAppClipCode, "allocWithZone:");
  unint64_t version = self->_version;
  v39 = v5;
  unint64_t lensType = self->_lensType;
  BOOL cylRightSignFlipped = self->_cylRightSignFlipped;
  BOOL cylLeftSignFlipped = self->_cylLeftSignFlipped;
  unint64_t leftCalibrationRXID = self->_leftCalibrationRXID;
  unint64_t leftRXID = self->_leftRXID;
  float leftCalibrationSphere = self->_leftCalibrationSphere;
  float leftDisplayCylinder = self->_leftDisplayCylinder;
  float leftDisplaySphere = self->_leftDisplaySphere;
  float leftCalibrationCylinder = self->_leftCalibrationCylinder;
  float leftAddVR = self->_leftAddVR;
  unint64_t leftCalibrationAxis = self->_leftCalibrationAxis;
  unint64_t leftClamping = self->_leftClamping;
  unint64_t leftDisplayAxis = self->_leftDisplayAxis;
  unint64_t leftAxisID = self->_leftAxisID;
  unint64_t rightRXID = self->_rightRXID;
  unint64_t rightCalibrationRXID = self->_rightCalibrationRXID;
  float rightDisplaySphere = self->_rightDisplaySphere;
  float rightDisplayCylinder = self->_rightDisplayCylinder;
  float rightCalibrationSphere = self->_rightCalibrationSphere;
  float rightCalibrationCylinder = self->_rightCalibrationCylinder;
  float rightAddVR = self->_rightAddVR;
  unint64_t rightAxisID = self->_rightAxisID;
  unint64_t rightCalibrationAxis = self->_rightCalibrationAxis;
  unint64_t rightDisplayAxis = self->_rightDisplayAxis;
  unint64_t rightClamping = self->_rightClamping;
  unint64_t identifyingColor = self->_identifyingColor;
  v22 = (void *)[(NSData *)self->_secret copyWithZone:a3];
  *(float *)&double v24 = leftDisplayCylinder;
  *(float *)&double v23 = leftDisplaySphere;
  *(float *)&double v25 = leftCalibrationSphere;
  *(float *)&double v26 = leftCalibrationCylinder;
  *(float *)&double v27 = leftAddVR;
  *(float *)&double v28 = rightDisplaySphere;
  *(float *)&double v29 = rightDisplayCylinder;
  *(float *)&double v30 = rightCalibrationSphere;
  v31 = -[CRXFAppClipCode initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:randomBits:](v39, "initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:randomBits:", version, lensType, cylLeftSignFlipped, cylRightSignFlipped, leftRXID, leftCalibrationRXID, v23, v24, v25, v26, v27, v28, v29,
          v30,
          leftAxisID,
          leftDisplayAxis,
          leftCalibrationAxis,
          leftClamping,
          rightRXID,
          rightCalibrationRXID,
          __PAIR64__(LODWORD(rightAddVR), LODWORD(rightCalibrationCylinder)),
          rightAxisID,
          rightDisplayAxis,
          rightCalibrationAxis,
          rightClamping,
          identifyingColor,
          v22,
          self->_randomBits);

  return v31;
}

- (id)description
{
  v39 = NSString;
  uint64_t v38 = objc_opt_class();
  v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRXFAppClipCode lensType](self, "lensType"));
  v36 = +[CRXUFormatters BOOLAsString:[(CRXFAppClipCode *)self cylLeftSignFlipped]];
  v35 = +[CRXUFormatters BOOLAsString:[(CRXFAppClipCode *)self cylRightSignFlipped]];
  v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRXFAppClipCode leftRXID](self, "leftRXID"));
  v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRXFAppClipCode leftCalibrationRXID](self, "leftCalibrationRXID"));
  [(CRXFAppClipCode *)self leftDisplaySphere];
  double v4 = v3;
  [(CRXFAppClipCode *)self leftDisplayCylinder];
  double v6 = v5;
  [(CRXFAppClipCode *)self leftCalibrationSphere];
  double v8 = v7;
  [(CRXFAppClipCode *)self leftCalibrationCylinder];
  double v10 = v9;
  v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRXFAppClipCode leftAxisID](self, "leftAxisID"));
  unint64_t v32 = [(CRXFAppClipCode *)self leftDisplayAxis];
  unint64_t v31 = [(CRXFAppClipCode *)self leftCalibrationAxis];
  double v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRXFAppClipCode leftClamping](self, "leftClamping"));
  double v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRXFAppClipCode rightRXID](self, "rightRXID"));
  double v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRXFAppClipCode rightCalibrationRXID](self, "rightCalibrationRXID"));
  [(CRXFAppClipCode *)self rightDisplaySphere];
  double v12 = v11;
  [(CRXFAppClipCode *)self rightDisplayCylinder];
  double v14 = v13;
  [(CRXFAppClipCode *)self rightCalibrationSphere];
  double v16 = v15;
  [(CRXFAppClipCode *)self rightCalibrationCylinder];
  double v18 = v17;
  double v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRXFAppClipCode rightAxisID](self, "rightAxisID"));
  unint64_t v19 = [(CRXFAppClipCode *)self rightDisplayAxis];
  unint64_t v20 = [(CRXFAppClipCode *)self rightCalibrationAxis];
  double v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRXFAppClipCode rightClamping](self, "rightClamping"));
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRXFAppClipCode identifyingColor](self, "identifyingColor"));
  v22 = [(CRXFAppClipCode *)self secret];
  double v23 = objc_msgSend(v22, "crxu_asHexString");
  objc_msgSend(v39, "stringWithFormat:", @"%@<%p> lensType:%@, cylLeftSignFlipped: %@, cylRightSignFlipped: %@, leftRXID: %@, leftCalibrationRXID: %@, leftDisplaySphere:%.02f, leftDisplayCylinder:%.02f, leftCalibrationSphere:%.02f, leftCalibrationCylinder:%.02f, leftAxisID: %@, leftDisplayAxis: %lu, leftCalibrationAxis: %lu, leftClamping: %@ rightRXID: %@, rightCalibrationRXID: %@, rightDisplaySphere: %.02f, rightDisplayCylinder: %.02f, rightCalibrationSphere:%.02f, rightCalibrationCylinder:%.02f, rightAxisID: %@, rightDisplayAxis: %lu, rightCalibrationAxis: %lu, rightClamping: %@ identifyingColor: %@, secret: %@", v38, self, v37, v36, v35, v40, v34, *(void *)&v4, *(void *)&v6, *(void *)&v8, *(void *)&v10, v33, v32, v31, v29, v30,
    v27,
    *(void *)&v12,
    *(void *)&v14,
    *(void *)&v16,
    *(void *)&v18,
    v28,
    v19,
    v20,
    v26,
    v21,
  double v24 = v23);

  return v24;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)lensType
{
  return self->_lensType;
}

- (unint64_t)leftRXID
{
  return self->_leftRXID;
}

- (unint64_t)leftCalibrationRXID
{
  return self->_leftCalibrationRXID;
}

- (float)leftDisplaySphere
{
  return self->_leftDisplaySphere;
}

- (float)leftDisplayCylinder
{
  return self->_leftDisplayCylinder;
}

- (float)leftCalibrationSphere
{
  return self->_leftCalibrationSphere;
}

- (float)leftCalibrationCylinder
{
  return self->_leftCalibrationCylinder;
}

- (float)leftAddVR
{
  return self->_leftAddVR;
}

- (unint64_t)leftAxisID
{
  return self->_leftAxisID;
}

- (unint64_t)leftCalibrationAxis
{
  return self->_leftCalibrationAxis;
}

- (unint64_t)leftDisplayAxis
{
  return self->_leftDisplayAxis;
}

- (unint64_t)leftClamping
{
  return self->_leftClamping;
}

- (unint64_t)rightRXID
{
  return self->_rightRXID;
}

- (unint64_t)rightCalibrationRXID
{
  return self->_rightCalibrationRXID;
}

- (float)rightDisplaySphere
{
  return self->_rightDisplaySphere;
}

- (float)rightDisplayCylinder
{
  return self->_rightDisplayCylinder;
}

- (float)rightCalibrationSphere
{
  return self->_rightCalibrationSphere;
}

- (float)rightCalibrationCylinder
{
  return self->_rightCalibrationCylinder;
}

- (float)rightAddVR
{
  return self->_rightAddVR;
}

- (unint64_t)rightAxisID
{
  return self->_rightAxisID;
}

- (unint64_t)rightCalibrationAxis
{
  return self->_rightCalibrationAxis;
}

- (unint64_t)rightDisplayAxis
{
  return self->_rightDisplayAxis;
}

- (unint64_t)rightClamping
{
  return self->_rightClamping;
}

- (unint64_t)identifyingColor
{
  return self->_identifyingColor;
}

- (NSData)secret
{
  return self->_secret;
}

- (unint64_t)randomBits
{
  return self->_randomBits;
}

- (BOOL)cylLeftSignFlipped
{
  return self->_cylLeftSignFlipped;
}

- (BOOL)cylRightSignFlipped
{
  return self->_cylRightSignFlipped;
}

- (void).cxx_destruct
{
}

@end