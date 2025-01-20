@interface CRXFAppClipCodeBuilder
- (BOOL)cylLeftSignFlipped;
- (BOOL)cylRightSignFlipped;
- (CRXFAppClipCodeBuilder)init;
- (CRXFAppClipCodeBuilder)initWithAppClipCode:(id)a3;
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
- (id)build;
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
- (void)setCylLeftSignFlipped:(BOOL)a3;
- (void)setCylRightSignFlipped:(BOOL)a3;
- (void)setIdentifyingColor:(unint64_t)a3;
- (void)setLeftAddVR:(float)a3;
- (void)setLeftAxisID:(unint64_t)a3;
- (void)setLeftCalibrationAxis:(unint64_t)a3;
- (void)setLeftCalibrationCylinder:(float)a3;
- (void)setLeftCalibrationRXID:(unint64_t)a3;
- (void)setLeftCalibrationSphere:(float)a3;
- (void)setLeftClamping:(unint64_t)a3;
- (void)setLeftDisplayAxis:(unint64_t)a3;
- (void)setLeftDisplayCylinder:(float)a3;
- (void)setLeftDisplaySphere:(float)a3;
- (void)setLeftRXID:(unint64_t)a3;
- (void)setLensType:(unint64_t)a3;
- (void)setRandomBits:(unint64_t)a3;
- (void)setRightAddVR:(float)a3;
- (void)setRightAxisID:(unint64_t)a3;
- (void)setRightCalibrationAxis:(unint64_t)a3;
- (void)setRightCalibrationCylinder:(float)a3;
- (void)setRightCalibrationRXID:(unint64_t)a3;
- (void)setRightCalibrationSphere:(float)a3;
- (void)setRightClamping:(unint64_t)a3;
- (void)setRightDisplayAxis:(unint64_t)a3;
- (void)setRightDisplayCylinder:(float)a3;
- (void)setRightDisplaySphere:(float)a3;
- (void)setRightRXID:(unint64_t)a3;
- (void)setSecret:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation CRXFAppClipCodeBuilder

- (CRXFAppClipCodeBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRXFAppClipCodeBuilder;
  result = [(CRXFAppClipCodeBuilder *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_version = xmmword_24C49AD00;
  }
  return result;
}

- (CRXFAppClipCodeBuilder)initWithAppClipCode:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRXFAppClipCodeBuilder;
  v5 = [(CRXFAppClipCodeBuilder *)&v20 init];
  if (v5)
  {
    v5->_version = [v4 version];
    v5->_lensType = [v4 lensType];
    v5->_cylLeftSignFlipped = [v4 cylLeftSignFlipped];
    v5->_cylRightSignFlipped = [v4 cylRightSignFlipped];
    v5->_leftRXID = [v4 leftRXID];
    v5->_leftCalibrationRXID = [v4 leftCalibrationRXID];
    [v4 leftDisplaySphere];
    v5->_leftDisplaySphere = v6;
    [v4 leftDisplayCylinder];
    v5->_leftDisplayCylinder = v7;
    [v4 leftCalibrationSphere];
    v5->_leftCalibrationSphere = v8;
    [v4 leftCalibrationCylinder];
    v5->_leftCalibrationCylinder = v9;
    [v4 leftAddVR];
    v5->_leftAddVR = v10;
    v5->_leftAxisID = [v4 leftAxisID];
    v5->_leftCalibrationAxis = [v4 leftCalibrationAxis];
    v5->_leftClamping = [v4 leftClamping];
    v5->_rightRXID = [v4 rightRXID];
    v5->_rightCalibrationRXID = [v4 rightCalibrationRXID];
    [v4 rightDisplaySphere];
    v5->_rightDisplaySphere = v11;
    [v4 rightDisplayCylinder];
    v5->_rightDisplayCylinder = v12;
    [v4 rightCalibrationSphere];
    v5->_rightCalibrationSphere = v13;
    [v4 rightCalibrationCylinder];
    v5->_rightCalibrationCylinder = v14;
    [v4 rightAddVR];
    v5->_rightAddVR = v15;
    v5->_rightAxisID = [v4 rightAxisID];
    v5->_rightDisplayAxis = [v4 rightDisplayAxis];
    v5->_rightCalibrationAxis = [v4 rightCalibrationAxis];
    v5->_rightClamping = [v4 rightClamping];
    v5->_identifyingColor = [v4 identifyingColor];
    v16 = [v4 secret];
    uint64_t v17 = [v16 copy];
    secret = v5->_secret;
    v5->_secret = (NSData *)v17;

    v5->_randomBits = [v4 randomBits];
  }

  return v5;
}

- (id)build
{
  v51 = [CRXFAppClipCode alloc];
  unint64_t v49 = [(CRXFAppClipCodeBuilder *)self version];
  unint64_t v52 = [(CRXFAppClipCodeBuilder *)self lensType];
  BOOL v50 = [(CRXFAppClipCodeBuilder *)self cylLeftSignFlipped];
  BOOL v48 = [(CRXFAppClipCodeBuilder *)self cylRightSignFlipped];
  unint64_t v47 = [(CRXFAppClipCodeBuilder *)self leftRXID];
  unint64_t v46 = [(CRXFAppClipCodeBuilder *)self leftCalibrationRXID];
  [(CRXFAppClipCodeBuilder *)self leftDisplaySphere];
  int v45 = v3;
  [(CRXFAppClipCodeBuilder *)self leftDisplayCylinder];
  int v44 = v4;
  [(CRXFAppClipCodeBuilder *)self leftCalibrationSphere];
  int v6 = v5;
  [(CRXFAppClipCodeBuilder *)self leftCalibrationCylinder];
  int v8 = v7;
  [(CRXFAppClipCodeBuilder *)self leftAddVR];
  int v10 = v9;
  unint64_t v43 = [(CRXFAppClipCodeBuilder *)self leftAxisID];
  unint64_t v42 = [(CRXFAppClipCodeBuilder *)self leftDisplayAxis];
  unint64_t v41 = [(CRXFAppClipCodeBuilder *)self leftCalibrationAxis];
  unint64_t v11 = [(CRXFAppClipCodeBuilder *)self leftClamping];
  unint64_t v12 = [(CRXFAppClipCodeBuilder *)self rightRXID];
  unint64_t v13 = [(CRXFAppClipCodeBuilder *)self rightCalibrationRXID];
  [(CRXFAppClipCodeBuilder *)self rightDisplaySphere];
  int v15 = v14;
  [(CRXFAppClipCodeBuilder *)self rightDisplayCylinder];
  int v17 = v16;
  [(CRXFAppClipCodeBuilder *)self rightCalibrationSphere];
  int v19 = v18;
  [(CRXFAppClipCodeBuilder *)self rightCalibrationCylinder];
  unsigned int v21 = v20;
  [(CRXFAppClipCodeBuilder *)self rightAddVR];
  unsigned int v23 = v22;
  unint64_t v24 = [(CRXFAppClipCodeBuilder *)self rightAxisID];
  unint64_t v25 = [(CRXFAppClipCodeBuilder *)self rightDisplayAxis];
  unint64_t v26 = [(CRXFAppClipCodeBuilder *)self rightCalibrationAxis];
  unint64_t v27 = [(CRXFAppClipCodeBuilder *)self rightClamping];
  unint64_t v28 = [(CRXFAppClipCodeBuilder *)self identifyingColor];
  v29 = [(CRXFAppClipCodeBuilder *)self secret];
  unint64_t v30 = [(CRXFAppClipCodeBuilder *)self randomBits];
  LODWORD(v32) = v44;
  LODWORD(v31) = v45;
  LODWORD(v33) = v6;
  LODWORD(v34) = v8;
  LODWORD(v35) = v10;
  LODWORD(v36) = v15;
  LODWORD(v37) = v17;
  LODWORD(v38) = v19;
  v39 = -[CRXFAppClipCode initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:randomBits:](v51, "initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:randomBits:", v49, v52, v50, v48, v47, v46, v31, v32, v33, v34, v35, v36, v37,
          v38,
          v43,
          v42,
          v41,
          v11,
          v12,
          v13,
          __PAIR64__(v23, v21),
          v24,
          v25,
          v26,
          v27,
          v28,
          v29,
          v30);

  return v39;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)lensType
{
  return self->_lensType;
}

- (void)setLensType:(unint64_t)a3
{
  self->_lensType = a3;
}

- (BOOL)cylLeftSignFlipped
{
  return self->_cylLeftSignFlipped;
}

- (void)setCylLeftSignFlipped:(BOOL)a3
{
  self->_cylLeftSignFlipped = a3;
}

- (BOOL)cylRightSignFlipped
{
  return self->_cylRightSignFlipped;
}

- (void)setCylRightSignFlipped:(BOOL)a3
{
  self->_cylRightSignFlipped = a3;
}

- (unint64_t)leftRXID
{
  return self->_leftRXID;
}

- (void)setLeftRXID:(unint64_t)a3
{
  self->_leftRXID = a3;
}

- (unint64_t)leftCalibrationRXID
{
  return self->_leftCalibrationRXID;
}

- (void)setLeftCalibrationRXID:(unint64_t)a3
{
  self->_leftCalibrationRXID = a3;
}

- (float)leftDisplaySphere
{
  return self->_leftDisplaySphere;
}

- (void)setLeftDisplaySphere:(float)a3
{
  self->_leftDisplaySphere = a3;
}

- (float)leftDisplayCylinder
{
  return self->_leftDisplayCylinder;
}

- (void)setLeftDisplayCylinder:(float)a3
{
  self->_leftDisplayCylinder = a3;
}

- (float)leftCalibrationSphere
{
  return self->_leftCalibrationSphere;
}

- (void)setLeftCalibrationSphere:(float)a3
{
  self->_leftCalibrationSphere = a3;
}

- (float)leftCalibrationCylinder
{
  return self->_leftCalibrationCylinder;
}

- (void)setLeftCalibrationCylinder:(float)a3
{
  self->_leftCalibrationCylinder = a3;
}

- (float)leftAddVR
{
  return self->_leftAddVR;
}

- (void)setLeftAddVR:(float)a3
{
  self->_leftAddVR = a3;
}

- (unint64_t)leftAxisID
{
  return self->_leftAxisID;
}

- (void)setLeftAxisID:(unint64_t)a3
{
  self->_leftAxisID = a3;
}

- (unint64_t)leftCalibrationAxis
{
  return self->_leftCalibrationAxis;
}

- (void)setLeftCalibrationAxis:(unint64_t)a3
{
  self->_leftCalibrationAxis = a3;
}

- (unint64_t)leftDisplayAxis
{
  return self->_leftDisplayAxis;
}

- (void)setLeftDisplayAxis:(unint64_t)a3
{
  self->_leftDisplayAxis = a3;
}

- (unint64_t)leftClamping
{
  return self->_leftClamping;
}

- (void)setLeftClamping:(unint64_t)a3
{
  self->_leftClamping = a3;
}

- (unint64_t)rightRXID
{
  return self->_rightRXID;
}

- (void)setRightRXID:(unint64_t)a3
{
  self->_rightRXID = a3;
}

- (unint64_t)rightCalibrationRXID
{
  return self->_rightCalibrationRXID;
}

- (void)setRightCalibrationRXID:(unint64_t)a3
{
  self->_rightCalibrationRXID = a3;
}

- (float)rightDisplaySphere
{
  return self->_rightDisplaySphere;
}

- (void)setRightDisplaySphere:(float)a3
{
  self->_rightDisplaySphere = a3;
}

- (float)rightDisplayCylinder
{
  return self->_rightDisplayCylinder;
}

- (void)setRightDisplayCylinder:(float)a3
{
  self->_rightDisplayCylinder = a3;
}

- (float)rightCalibrationSphere
{
  return self->_rightCalibrationSphere;
}

- (void)setRightCalibrationSphere:(float)a3
{
  self->_rightCalibrationSphere = a3;
}

- (float)rightCalibrationCylinder
{
  return self->_rightCalibrationCylinder;
}

- (void)setRightCalibrationCylinder:(float)a3
{
  self->_rightCalibrationCylinder = a3;
}

- (float)rightAddVR
{
  return self->_rightAddVR;
}

- (void)setRightAddVR:(float)a3
{
  self->_rightAddVR = a3;
}

- (unint64_t)rightAxisID
{
  return self->_rightAxisID;
}

- (void)setRightAxisID:(unint64_t)a3
{
  self->_rightAxisID = a3;
}

- (unint64_t)rightCalibrationAxis
{
  return self->_rightCalibrationAxis;
}

- (void)setRightCalibrationAxis:(unint64_t)a3
{
  self->_rightCalibrationAxis = a3;
}

- (unint64_t)rightDisplayAxis
{
  return self->_rightDisplayAxis;
}

- (void)setRightDisplayAxis:(unint64_t)a3
{
  self->_rightDisplayAxis = a3;
}

- (unint64_t)rightClamping
{
  return self->_rightClamping;
}

- (void)setRightClamping:(unint64_t)a3
{
  self->_rightClamping = a3;
}

- (unint64_t)identifyingColor
{
  return self->_identifyingColor;
}

- (void)setIdentifyingColor:(unint64_t)a3
{
  self->_identifyingColor = a3;
}

- (NSData)secret
{
  return self->_secret;
}

- (void)setSecret:(id)a3
{
}

- (unint64_t)randomBits
{
  return self->_randomBits;
}

- (void)setRandomBits:(unint64_t)a3
{
  self->_randomBits = a3;
}

- (void).cxx_destruct
{
}

@end