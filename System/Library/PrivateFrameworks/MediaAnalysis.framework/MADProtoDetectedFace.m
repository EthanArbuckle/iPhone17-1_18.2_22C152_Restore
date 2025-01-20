@interface MADProtoDetectedFace
+ (id)protoFromPhotosFace:(id)a3;
- (BOOL)hasAdjustmentVersion;
- (BOOL)hasAgeType;
- (BOOL)hasBlurScore;
- (BOOL)hasBodyCenterX;
- (BOOL)hasBodyCenterY;
- (BOOL)hasBodyHeight;
- (BOOL)hasBodyWidth;
- (BOOL)hasCenterX;
- (BOOL)hasCenterY;
- (BOOL)hasClusterSequenceNumber;
- (BOOL)hasDetectionType;
- (BOOL)hasEthnicityType;
- (BOOL)hasEyesState;
- (BOOL)hasFaceAlgorithmVersion;
- (BOOL)hasFaceExpressionType;
- (BOOL)hasFaceLocalIdentifier;
- (BOOL)hasFaceMask;
- (BOOL)hasFaceprint;
- (BOOL)hasFacialHairType;
- (BOOL)hasGazeAngle;
- (BOOL)hasGazeCenterX;
- (BOOL)hasGazeCenterY;
- (BOOL)hasGazeConfidence;
- (BOOL)hasGazeRect;
- (BOOL)hasGazeType;
- (BOOL)hasGlassesType;
- (BOOL)hasGroupingIdentifier;
- (BOOL)hasHairColorType;
- (BOOL)hasHairType;
- (BOOL)hasHasFaceMask;
- (BOOL)hasHasSmile;
- (BOOL)hasHeadgearType;
- (BOOL)hasHidden;
- (BOOL)hasIsInTrash;
- (BOOL)hasIsLeftEyeClosed;
- (BOOL)hasIsRightEyeClosed;
- (BOOL)hasManual;
- (BOOL)hasPoseType;
- (BOOL)hasPoseYaw;
- (BOOL)hasQuality;
- (BOOL)hasQualityMeasure;
- (BOOL)hasRoll;
- (BOOL)hasSexType;
- (BOOL)hasSize;
- (BOOL)hasSkintoneType;
- (BOOL)hasSmile;
- (BOOL)hasSmileType;
- (BOOL)hasSourceHeight;
- (BOOL)hasSourceWidth;
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInTrash;
- (BOOL)isLeftEyeClosed;
- (BOOL)isRightEyeClosed;
- (BOOL)manual;
- (BOOL)readFrom:(id)a3;
- (MADProtoFaceprint)faceprint;
- (NSString)faceLocalIdentifier;
- (NSString)groupingIdentifier;
- (VCPProtoBounds)gazeRect;
- (double)adjustmentVersion;
- (double)blurScore;
- (double)bodyCenterX;
- (double)bodyCenterY;
- (double)bodyHeight;
- (double)bodyWidth;
- (double)centerX;
- (double)centerY;
- (double)gazeCenterX;
- (double)gazeCenterY;
- (double)poseYaw;
- (double)quality;
- (double)roll;
- (double)size;
- (float)gazeAngle;
- (float)gazeConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)vcpPhotosFace;
- (int)detectionType;
- (int64_t)clusterSequenceNumber;
- (int64_t)faceAlgorithmVersion;
- (int64_t)qualityMeasure;
- (int64_t)sourceHeight;
- (int64_t)sourceWidth;
- (unint64_t)hash;
- (unsigned)ageType;
- (unsigned)ethnicityType;
- (unsigned)eyesState;
- (unsigned)faceExpressionType;
- (unsigned)facialHairType;
- (unsigned)gazeType;
- (unsigned)glassesType;
- (unsigned)hairColorType;
- (unsigned)hairType;
- (unsigned)headgearType;
- (unsigned)poseType;
- (unsigned)sexType;
- (unsigned)skintoneType;
- (unsigned)smileType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdjustmentVersion:(double)a3;
- (void)setAgeType:(unsigned int)a3;
- (void)setBlurScore:(double)a3;
- (void)setBodyCenterX:(double)a3;
- (void)setBodyCenterY:(double)a3;
- (void)setBodyHeight:(double)a3;
- (void)setBodyWidth:(double)a3;
- (void)setCenterX:(double)a3;
- (void)setCenterY:(double)a3;
- (void)setClusterSequenceNumber:(int64_t)a3;
- (void)setDetectionType:(int)a3;
- (void)setEthnicityType:(unsigned int)a3;
- (void)setEyesState:(unsigned int)a3;
- (void)setFaceAlgorithmVersion:(int64_t)a3;
- (void)setFaceExpressionType:(unsigned int)a3;
- (void)setFaceLocalIdentifier:(id)a3;
- (void)setFaceprint:(id)a3;
- (void)setFacialHairType:(unsigned int)a3;
- (void)setGazeAngle:(float)a3;
- (void)setGazeCenterX:(double)a3;
- (void)setGazeCenterY:(double)a3;
- (void)setGazeConfidence:(float)a3;
- (void)setGazeRect:(id)a3;
- (void)setGazeType:(unsigned int)a3;
- (void)setGlassesType:(unsigned int)a3;
- (void)setGroupingIdentifier:(id)a3;
- (void)setHairColorType:(unsigned int)a3;
- (void)setHairType:(unsigned int)a3;
- (void)setHasAdjustmentVersion:(BOOL)a3;
- (void)setHasAgeType:(BOOL)a3;
- (void)setHasBlurScore:(BOOL)a3;
- (void)setHasBodyCenterX:(BOOL)a3;
- (void)setHasBodyCenterY:(BOOL)a3;
- (void)setHasBodyHeight:(BOOL)a3;
- (void)setHasBodyWidth:(BOOL)a3;
- (void)setHasCenterX:(BOOL)a3;
- (void)setHasCenterY:(BOOL)a3;
- (void)setHasClusterSequenceNumber:(BOOL)a3;
- (void)setHasDetectionType:(BOOL)a3;
- (void)setHasEthnicityType:(BOOL)a3;
- (void)setHasEyesState:(BOOL)a3;
- (void)setHasFaceAlgorithmVersion:(BOOL)a3;
- (void)setHasFaceExpressionType:(BOOL)a3;
- (void)setHasFaceMask:(BOOL)a3;
- (void)setHasFacialHairType:(BOOL)a3;
- (void)setHasGazeAngle:(BOOL)a3;
- (void)setHasGazeCenterX:(BOOL)a3;
- (void)setHasGazeCenterY:(BOOL)a3;
- (void)setHasGazeConfidence:(BOOL)a3;
- (void)setHasGazeType:(BOOL)a3;
- (void)setHasGlassesType:(BOOL)a3;
- (void)setHasHairColorType:(BOOL)a3;
- (void)setHasHairType:(BOOL)a3;
- (void)setHasHasFaceMask:(BOOL)a3;
- (void)setHasHasSmile:(BOOL)a3;
- (void)setHasHeadgearType:(BOOL)a3;
- (void)setHasHidden:(BOOL)a3;
- (void)setHasIsInTrash:(BOOL)a3;
- (void)setHasIsLeftEyeClosed:(BOOL)a3;
- (void)setHasIsRightEyeClosed:(BOOL)a3;
- (void)setHasManual:(BOOL)a3;
- (void)setHasPoseType:(BOOL)a3;
- (void)setHasPoseYaw:(BOOL)a3;
- (void)setHasQuality:(BOOL)a3;
- (void)setHasQualityMeasure:(BOOL)a3;
- (void)setHasRoll:(BOOL)a3;
- (void)setHasSexType:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setHasSkintoneType:(BOOL)a3;
- (void)setHasSmile:(BOOL)a3;
- (void)setHasSmileType:(BOOL)a3;
- (void)setHasSourceHeight:(BOOL)a3;
- (void)setHasSourceWidth:(BOOL)a3;
- (void)setHeadgearType:(unsigned int)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsInTrash:(BOOL)a3;
- (void)setIsLeftEyeClosed:(BOOL)a3;
- (void)setIsRightEyeClosed:(BOOL)a3;
- (void)setManual:(BOOL)a3;
- (void)setPoseType:(unsigned int)a3;
- (void)setPoseYaw:(double)a3;
- (void)setQuality:(double)a3;
- (void)setQualityMeasure:(int64_t)a3;
- (void)setRoll:(double)a3;
- (void)setSexType:(unsigned int)a3;
- (void)setSize:(double)a3;
- (void)setSkintoneType:(unsigned int)a3;
- (void)setSmileType:(unsigned int)a3;
- (void)setSourceHeight:(int64_t)a3;
- (void)setSourceWidth:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MADProtoDetectedFace

+ (id)protoFromPhotosFace:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MADProtoDetectedFace);
  v5 = [v3 localIdentifier];
  [(MADProtoDetectedFace *)v4 setFaceLocalIdentifier:v5];

  [v3 size];
  -[MADProtoDetectedFace setSize:](v4, "setSize:");
  [v3 centerX];
  -[MADProtoDetectedFace setCenterX:](v4, "setCenterX:");
  [v3 centerY];
  -[MADProtoDetectedFace setCenterY:](v4, "setCenterY:");
  [v3 bodyCenterX];
  -[MADProtoDetectedFace setBodyCenterX:](v4, "setBodyCenterX:");
  [v3 bodyCenterY];
  -[MADProtoDetectedFace setBodyCenterY:](v4, "setBodyCenterY:");
  [v3 bodyWidth];
  -[MADProtoDetectedFace setBodyWidth:](v4, "setBodyWidth:");
  [v3 bodyHeight];
  -[MADProtoDetectedFace setBodyHeight:](v4, "setBodyHeight:");
  -[MADProtoDetectedFace setDetectionType:](v4, "setDetectionType:", [v3 detectionType]);
  -[MADProtoDetectedFace setClusterSequenceNumber:](v4, "setClusterSequenceNumber:", [v3 clusterSequenceNumber]);
  -[MADProtoDetectedFace setQualityMeasure:](v4, "setQualityMeasure:", [v3 qualityMeasure]);
  [v3 quality];
  -[MADProtoDetectedFace setQuality:](v4, "setQuality:");
  -[MADProtoDetectedFace setSourceWidth:](v4, "setSourceWidth:", [v3 sourceWidth]);
  -[MADProtoDetectedFace setSourceHeight:](v4, "setSourceHeight:", [v3 sourceHeight]);
  [v3 roll];
  -[MADProtoDetectedFace setRoll:](v4, "setRoll:");
  -[MADProtoDetectedFace setHidden:](v4, "setHidden:", [v3 isHidden]);
  -[MADProtoDetectedFace setIsInTrash:](v4, "setIsInTrash:", [v3 isInTrash]);
  -[MADProtoDetectedFace setManual:](v4, "setManual:", [v3 manual]);
  -[MADProtoDetectedFace setHasSmile:](v4, "setHasSmile:", [v3 hasSmile]);
  [v3 blurScore];
  -[MADProtoDetectedFace setBlurScore:](v4, "setBlurScore:");
  -[MADProtoDetectedFace setIsLeftEyeClosed:](v4, "setIsLeftEyeClosed:", [v3 isLeftEyeClosed]);
  -[MADProtoDetectedFace setIsRightEyeClosed:](v4, "setIsRightEyeClosed:", [v3 isRightEyeClosed]);
  v6 = [v3 adjustmentVersion];
  [v6 timeIntervalSinceReferenceDate];
  -[MADProtoDetectedFace setAdjustmentVersion:](v4, "setAdjustmentVersion:");

  [v3 poseYaw];
  -[MADProtoDetectedFace setPoseYaw:](v4, "setPoseYaw:");
  -[MADProtoDetectedFace setFaceAlgorithmVersion:](v4, "setFaceAlgorithmVersion:", [v3 faceAlgorithmVersion]);
  -[MADProtoDetectedFace setAgeType:](v4, "setAgeType:", [v3 ageType]);
  -[MADProtoDetectedFace setSexType:](v4, "setSexType:", [v3 sexType]);
  -[MADProtoDetectedFace setEyesState:](v4, "setEyesState:", [v3 eyesState]);
  -[MADProtoDetectedFace setSmileType:](v4, "setSmileType:", [v3 smileType]);
  -[MADProtoDetectedFace setFacialHairType:](v4, "setFacialHairType:", [v3 facialHairType]);
  -[MADProtoDetectedFace setHairColorType:](v4, "setHairColorType:", [v3 hairColorType]);
  -[MADProtoDetectedFace setGlassesType:](v4, "setGlassesType:", [v3 glassesType]);
  -[MADProtoDetectedFace setFaceExpressionType:](v4, "setFaceExpressionType:", [v3 faceExpressionType]);
  -[MADProtoDetectedFace setHeadgearType:](v4, "setHeadgearType:", [v3 headgearType]);
  -[MADProtoDetectedFace setHairType:](v4, "setHairType:", [v3 hairType]);
  -[MADProtoDetectedFace setPoseType:](v4, "setPoseType:", [v3 poseType]);
  -[MADProtoDetectedFace setSkintoneType:](v4, "setSkintoneType:", [v3 skintoneType]);
  -[MADProtoDetectedFace setEthnicityType:](v4, "setEthnicityType:", [v3 ethnicityType]);
  -[MADProtoDetectedFace setHasFaceMask:](v4, "setHasFaceMask:", [v3 hasFaceMask]);
  -[MADProtoDetectedFace setGazeType:](v4, "setGazeType:", [v3 gazeType]);
  [v3 gazeCenterX];
  -[MADProtoDetectedFace setGazeCenterX:](v4, "setGazeCenterX:");
  [v3 gazeCenterY];
  -[MADProtoDetectedFace setGazeCenterY:](v4, "setGazeCenterY:");
  [v3 gazeRect];
  v7 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:");
  [(MADProtoDetectedFace *)v4 setGazeRect:v7];

  [v3 gazeAngle];
  -[MADProtoDetectedFace setGazeAngle:](v4, "setGazeAngle:");
  [v3 gazeConfidence];
  -[MADProtoDetectedFace setGazeConfidence:](v4, "setGazeConfidence:");
  v8 = [v3 faceClusteringProperties];

  v9 = [v8 faceprint];
  v10 = +[MADProtoFaceprint protoFromPhotosFaceprint:v9];
  [(MADProtoDetectedFace *)v4 setFaceprint:v10];

  v11 = [v8 groupingIdentifier];
  [(MADProtoDetectedFace *)v4 setGroupingIdentifier:v11];

  return v4;
}

- (id)vcpPhotosFace
{
  id v3 = [(MADProtoDetectedFace *)self faceLocalIdentifier];
  v4 = +[VCPPhotosFace faceWithLocalIdentifier:v3];

  [(MADProtoDetectedFace *)self size];
  objc_msgSend(v4, "setSize:");
  [(MADProtoDetectedFace *)self centerX];
  objc_msgSend(v4, "setCenterX:");
  [(MADProtoDetectedFace *)self centerY];
  objc_msgSend(v4, "setCenterY:");
  [(MADProtoDetectedFace *)self bodyCenterX];
  objc_msgSend(v4, "setBodyCenterX:");
  [(MADProtoDetectedFace *)self bodyCenterY];
  objc_msgSend(v4, "setBodyCenterY:");
  [(MADProtoDetectedFace *)self bodyWidth];
  objc_msgSend(v4, "setBodyWidth:");
  [(MADProtoDetectedFace *)self bodyHeight];
  objc_msgSend(v4, "setBodyHeight:");
  objc_msgSend(v4, "setDetectionType:", (__int16)-[MADProtoDetectedFace detectionType](self, "detectionType"));
  objc_msgSend(v4, "setClusterSequenceNumber:", -[MADProtoDetectedFace clusterSequenceNumber](self, "clusterSequenceNumber"));
  objc_msgSend(v4, "setQualityMeasure:", -[MADProtoDetectedFace qualityMeasure](self, "qualityMeasure"));
  [(MADProtoDetectedFace *)self quality];
  objc_msgSend(v4, "setQuality:");
  objc_msgSend(v4, "setSourceWidth:", -[MADProtoDetectedFace sourceWidth](self, "sourceWidth"));
  objc_msgSend(v4, "setSourceHeight:", -[MADProtoDetectedFace sourceHeight](self, "sourceHeight"));
  [(MADProtoDetectedFace *)self roll];
  objc_msgSend(v4, "setRoll:");
  objc_msgSend(v4, "setHidden:", -[MADProtoDetectedFace hidden](self, "hidden"));
  objc_msgSend(v4, "setIsInTrash:", -[MADProtoDetectedFace isInTrash](self, "isInTrash"));
  objc_msgSend(v4, "setManual:", -[MADProtoDetectedFace manual](self, "manual"));
  objc_msgSend(v4, "setHasSmile:", -[MADProtoDetectedFace hasSmile](self, "hasSmile"));
  [(MADProtoDetectedFace *)self blurScore];
  objc_msgSend(v4, "setBlurScore:");
  objc_msgSend(v4, "setIsLeftEyeClosed:", -[MADProtoDetectedFace isLeftEyeClosed](self, "isLeftEyeClosed"));
  objc_msgSend(v4, "setIsRightEyeClosed:", -[MADProtoDetectedFace isRightEyeClosed](self, "isRightEyeClosed"));
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  [(MADProtoDetectedFace *)self adjustmentVersion];
  v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  [v4 setAdjustmentVersion:v6];

  [(MADProtoDetectedFace *)self poseYaw];
  objc_msgSend(v4, "setPoseYaw:");
  objc_msgSend(v4, "setAlgorithmVersion:", -[MADProtoDetectedFace faceAlgorithmVersion](self, "faceAlgorithmVersion"));
  objc_msgSend(v4, "setAgeType:", (unsigned __int16)-[MADProtoDetectedFace ageType](self, "ageType"));
  objc_msgSend(v4, "setSexType:", (unsigned __int16)-[MADProtoDetectedFace sexType](self, "sexType"));
  objc_msgSend(v4, "setEyesState:", (unsigned __int16)-[MADProtoDetectedFace eyesState](self, "eyesState"));
  objc_msgSend(v4, "setSmileType:", (unsigned __int16)-[MADProtoDetectedFace smileType](self, "smileType"));
  objc_msgSend(v4, "setFacialHairType:", (unsigned __int16)-[MADProtoDetectedFace facialHairType](self, "facialHairType"));
  objc_msgSend(v4, "setHairColorType:", (unsigned __int16)-[MADProtoDetectedFace hairColorType](self, "hairColorType"));
  objc_msgSend(v4, "setGlassesType:", (unsigned __int16)-[MADProtoDetectedFace glassesType](self, "glassesType"));
  objc_msgSend(v4, "setExpressionType:", (unsigned __int16)-[MADProtoDetectedFace faceExpressionType](self, "faceExpressionType"));
  objc_msgSend(v4, "setHeadgearType:", (unsigned __int16)-[MADProtoDetectedFace headgearType](self, "headgearType"));
  objc_msgSend(v4, "setHairType:", (unsigned __int16)-[MADProtoDetectedFace hairType](self, "hairType"));
  objc_msgSend(v4, "setPoseType:", (unsigned __int16)-[MADProtoDetectedFace poseType](self, "poseType"));
  objc_msgSend(v4, "setSkintoneType:", (unsigned __int16)-[MADProtoDetectedFace skintoneType](self, "skintoneType"));
  objc_msgSend(v4, "setEthnicityType:", (unsigned __int16)-[MADProtoDetectedFace ethnicityType](self, "ethnicityType"));
  objc_msgSend(v4, "setHasFaceMask:", -[MADProtoDetectedFace hasFaceMask](self, "hasFaceMask"));
  objc_msgSend(v4, "setGazeType:", (unsigned __int16)-[MADProtoDetectedFace gazeType](self, "gazeType"));
  [(MADProtoDetectedFace *)self gazeCenterX];
  objc_msgSend(v4, "setGazeCenterX:");
  [(MADProtoDetectedFace *)self gazeCenterY];
  objc_msgSend(v4, "setGazeCenterY:");
  v7 = [(MADProtoDetectedFace *)self gazeRect];
  [v7 rectValue];
  objc_msgSend(v4, "setGazeRect:");

  [(MADProtoDetectedFace *)self gazeAngle];
  objc_msgSend(v4, "setGazeAngle:");
  [(MADProtoDetectedFace *)self gazeConfidence];
  objc_msgSend(v4, "setGazeConfidence:");
  v8 = [(MADProtoDetectedFace *)self faceprint];
  v9 = objc_msgSend(v8, "vcpFaceprintWithDetectionType:", (__int16)-[MADProtoDetectedFace detectionType](self, "detectionType"));
  [v4 setImageprintWrapper:v9];

  v10 = [(MADProtoDetectedFace *)self groupingIdentifier];
  [v4 setGroupingIdentifier:v10];

  return v4;
}

- (BOOL)hasFaceLocalIdentifier
{
  return self->_faceLocalIdentifier != 0;
}

- (void)setSize:(double)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasSize
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setCenterX:(double)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_centerX = a3;
}

- (void)setHasCenterX:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCenterX
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCenterY:(double)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_centerY = a3;
}

- (void)setHasCenterY:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCenterY
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setBodyCenterX:(double)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_bodyCenterX = a3;
}

- (void)setHasBodyCenterX:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBodyCenterX
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBodyCenterY:(double)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_bodyCenterY = a3;
}

- (void)setHasBodyCenterY:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasBodyCenterY
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBodyWidth:(double)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_bodyWidth = a3;
}

- (void)setHasBodyWidth:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasBodyWidth
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setBodyHeight:(double)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_bodyHeight = a3;
}

- (void)setHasBodyHeight:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasBodyHeight
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDetectionType:(int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_detectionType = a3;
}

- (void)setHasDetectionType:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasDetectionType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setClusterSequenceNumber:(int64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_clusterSequenceNumber = a3;
}

- (void)setHasClusterSequenceNumber:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasClusterSequenceNumber
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setQualityMeasure:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_qualityMeasure = a3;
}

- (void)setHasQualityMeasure:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasQualityMeasure
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setQuality:(double)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_quality = a3;
}

- (void)setHasQuality:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasQuality
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setSourceWidth:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_sourceWidth = a3;
}

- (void)setHasSourceWidth:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSourceWidth
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSourceHeight:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_sourceHeight = a3;
}

- (void)setHasSourceHeight:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasSourceHeight
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRoll:(double)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_roll = a3;
}

- (void)setHasRoll:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasRoll
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHidden:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_hidden = a3;
}

- (void)setHasHidden:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasHidden
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setIsInTrash:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_isInTrash = a3;
}

- (void)setHasIsInTrash:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasIsInTrash
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setManual:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_manual = a3;
}

- (void)setHasManual:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasManual
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setHasSmile:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_hasSmile = a3;
}

- (void)setHasHasSmile:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasHasSmile
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setBlurScore:(double)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_blurScore = a3;
}

- (void)setHasBlurScore:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasBlurScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsLeftEyeClosed:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_isLeftEyeClosed = a3;
}

- (void)setHasIsLeftEyeClosed:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsLeftEyeClosed
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setIsRightEyeClosed:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_isRightEyeClosed = a3;
}

- (void)setHasIsRightEyeClosed:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsRightEyeClosed
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setAdjustmentVersion:(double)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_adjustmentVersion = a3;
}

- (void)setHasAdjustmentVersion:(BOOL)a3
{
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAdjustmentVersion
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPoseYaw:(double)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_poseYaw = a3;
}

- (void)setHasPoseYaw:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasPoseYaw
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFaceAlgorithmVersion:(int64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_faceAlgorithmVersion = a3;
}

- (void)setHasFaceAlgorithmVersion:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasFaceAlgorithmVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setAgeType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_ageType = a3;
}

- (void)setHasAgeType:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasAgeType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSexType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_sexType = a3;
}

- (void)setHasSexType:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasSexType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setEyesState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_eyesState = a3;
}

- (void)setHasEyesState:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasEyesState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSmileType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_smileType = a3;
}

- (void)setHasSmileType:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasSmileType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setFacialHairType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_facialHairType = a3;
}

- (void)setHasFacialHairType:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasFacialHairType
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHairColorType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_hairColorType = a3;
}

- (void)setHasHairColorType:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasHairColorType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setGlassesType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_glassesType = a3;
}

- (void)setHasGlassesType:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasGlassesType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setFaceExpressionType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_faceExpressionType = a3;
}

- (void)setHasFaceExpressionType:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasFaceExpressionType
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHeadgearType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_headgearType = a3;
}

- (void)setHasHeadgearType:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasHeadgearType
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setHairType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_hairType = a3;
}

- (void)setHasHairType:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasHairType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setPoseType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_poseType = a3;
}

- (void)setHasPoseType:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasPoseType
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setSkintoneType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_skintoneType = a3;
}

- (void)setHasSkintoneType:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasSkintoneType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setEthnicityType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_ethnicityType = a3;
}

- (void)setHasEthnicityType:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasEthnicityType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasFaceMask:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_hasFaceMask = a3;
}

- (void)setHasHasFaceMask:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasHasFaceMask
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setGazeType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_gazeType = a3;
}

- (void)setHasGazeType:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasGazeType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setGazeCenterX:(double)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_gazeCenterX = a3;
}

- (void)setHasGazeCenterX:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasGazeCenterX
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setGazeCenterY:(double)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_gazeCenterY = a3;
}

- (void)setHasGazeCenterY:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasGazeCenterY
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasGazeRect
{
  return self->_gazeRect != 0;
}

- (void)setGazeAngle:(float)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_gazeAngle = a3;
}

- (void)setHasGazeAngle:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasGazeAngle
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setGazeConfidence:(float)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_gazeConfidence = a3;
}

- (void)setHasGazeConfidence:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasGazeConfidence
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (BOOL)hasFaceprint
{
  return self->_faceprint != 0;
}

- (BOOL)hasGroupingIdentifier
{
  return self->_groupingIdentifier != 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MADProtoDetectedFace;
  v4 = [(MADProtoDetectedFace *)&v8 description];
  v5 = [(MADProtoDetectedFace *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  faceLocalIdentifier = self->_faceLocalIdentifier;
  if (faceLocalIdentifier) {
    [v3 setObject:faceLocalIdentifier forKey:@"faceLocalIdentifier"];
  }
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    v19 = [NSNumber numberWithDouble:self->_size];
    [v5 setObject:v19 forKey:@"size"];

    $328DD4DCDDD95E438D2690214D11354C has = self->_has;
    if ((*(unsigned char *)&has & 0x40) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_58;
    }
  }
  else if ((*(unsigned char *)&has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  v20 = [NSNumber numberWithDouble:self->_centerX];
  [v5 setObject:v20 forKey:@"centerX"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_59;
  }
LABEL_58:
  v21 = [NSNumber numberWithDouble:self->_centerY];
  [v5 setObject:v21 forKey:@"centerY"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_60;
  }
LABEL_59:
  v22 = [NSNumber numberWithDouble:self->_bodyCenterX];
  [v5 setObject:v22 forKey:@"bodyCenterX"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_61;
  }
LABEL_60:
  v23 = [NSNumber numberWithDouble:self->_bodyCenterY];
  [v5 setObject:v23 forKey:@"bodyCenterY"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_62;
  }
LABEL_61:
  v24 = [NSNumber numberWithDouble:self->_bodyWidth];
  [v5 setObject:v24 forKey:@"bodyWidth"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_63;
  }
LABEL_62:
  v25 = [NSNumber numberWithDouble:self->_bodyHeight];
  [v5 setObject:v25 forKey:@"bodyHeight"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_64;
  }
LABEL_63:
  v26 = [NSNumber numberWithInt:self->_detectionType];
  [v5 setObject:v26 forKey:@"detectionType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_65;
  }
LABEL_64:
  v27 = [NSNumber numberWithLongLong:self->_clusterSequenceNumber];
  [v5 setObject:v27 forKey:@"clusterSequenceNumber"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_66;
  }
LABEL_65:
  v28 = [NSNumber numberWithLongLong:self->_qualityMeasure];
  [v5 setObject:v28 forKey:@"qualityMeasure"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_67;
  }
LABEL_66:
  v29 = [NSNumber numberWithDouble:self->_quality];
  [v5 setObject:v29 forKey:@"quality"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_68;
  }
LABEL_67:
  v30 = [NSNumber numberWithLongLong:self->_sourceWidth];
  [v5 setObject:v30 forKey:@"sourceWidth"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_69;
  }
LABEL_68:
  v31 = [NSNumber numberWithLongLong:self->_sourceHeight];
  [v5 setObject:v31 forKey:@"sourceHeight"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_70;
  }
LABEL_69:
  v32 = [NSNumber numberWithDouble:self->_roll];
  [v5 setObject:v32 forKey:@"roll"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_71;
  }
LABEL_70:
  v33 = [NSNumber numberWithBool:self->_hidden];
  [v5 setObject:v33 forKey:@"hidden"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_72;
  }
LABEL_71:
  v34 = [NSNumber numberWithBool:self->_isInTrash];
  [v5 setObject:v34 forKey:@"isInTrash"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_73;
  }
LABEL_72:
  v35 = [NSNumber numberWithBool:self->_manual];
  [v5 setObject:v35 forKey:@"manual"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_74;
  }
LABEL_73:
  v36 = [NSNumber numberWithBool:self->_hasSmile];
  [v5 setObject:v36 forKey:@"hasSmile"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_75;
  }
LABEL_74:
  v37 = [NSNumber numberWithDouble:self->_blurScore];
  [v5 setObject:v37 forKey:@"blurScore"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_76;
  }
LABEL_75:
  v38 = [NSNumber numberWithBool:self->_isLeftEyeClosed];
  [v5 setObject:v38 forKey:@"isLeftEyeClosed"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_77;
  }
LABEL_76:
  v39 = [NSNumber numberWithBool:self->_isRightEyeClosed];
  [v5 setObject:v39 forKey:@"isRightEyeClosed"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_78;
  }
LABEL_77:
  v40 = [NSNumber numberWithDouble:self->_adjustmentVersion];
  [v5 setObject:v40 forKey:@"adjustmentVersion"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_79;
  }
LABEL_78:
  v41 = [NSNumber numberWithDouble:self->_poseYaw];
  [v5 setObject:v41 forKey:@"poseYaw"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_80;
  }
LABEL_79:
  v42 = [NSNumber numberWithLongLong:self->_faceAlgorithmVersion];
  [v5 setObject:v42 forKey:@"faceAlgorithmVersion"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_81;
  }
LABEL_80:
  v43 = [NSNumber numberWithUnsignedInt:self->_ageType];
  [v5 setObject:v43 forKey:@"ageType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_82;
  }
LABEL_81:
  v44 = [NSNumber numberWithUnsignedInt:self->_sexType];
  [v5 setObject:v44 forKey:@"sexType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_83;
  }
LABEL_82:
  v45 = [NSNumber numberWithUnsignedInt:self->_eyesState];
  [v5 setObject:v45 forKey:@"eyesState"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_84;
  }
LABEL_83:
  v46 = [NSNumber numberWithUnsignedInt:self->_smileType];
  [v5 setObject:v46 forKey:@"smileType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_85;
  }
LABEL_84:
  v47 = [NSNumber numberWithUnsignedInt:self->_facialHairType];
  [v5 setObject:v47 forKey:@"facialHairType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_86;
  }
LABEL_85:
  v48 = [NSNumber numberWithUnsignedInt:self->_hairColorType];
  [v5 setObject:v48 forKey:@"hairColorType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_87;
  }
LABEL_86:
  v49 = [NSNumber numberWithUnsignedInt:self->_glassesType];
  [v5 setObject:v49 forKey:@"glassesType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_88;
  }
LABEL_87:
  v50 = [NSNumber numberWithUnsignedInt:self->_faceExpressionType];
  [v5 setObject:v50 forKey:@"faceExpressionType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_89;
  }
LABEL_88:
  v51 = [NSNumber numberWithUnsignedInt:self->_headgearType];
  [v5 setObject:v51 forKey:@"headgearType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_90;
  }
LABEL_89:
  v52 = [NSNumber numberWithUnsignedInt:self->_hairType];
  [v5 setObject:v52 forKey:@"hairType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_91;
  }
LABEL_90:
  v53 = [NSNumber numberWithUnsignedInt:self->_poseType];
  [v5 setObject:v53 forKey:@"poseType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_92;
  }
LABEL_91:
  v54 = [NSNumber numberWithUnsignedInt:self->_skintoneType];
  [v5 setObject:v54 forKey:@"skintoneType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_93;
  }
LABEL_92:
  v55 = [NSNumber numberWithUnsignedInt:self->_ethnicityType];
  [v5 setObject:v55 forKey:@"ethnicityType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_94;
  }
LABEL_93:
  v56 = [NSNumber numberWithBool:self->_hasFaceMask];
  [v5 setObject:v56 forKey:@"hasFaceMask"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_43;
    }
    goto LABEL_95;
  }
LABEL_94:
  v57 = [NSNumber numberWithUnsignedInt:self->_gazeType];
  [v5 setObject:v57 forKey:@"gazeType"];

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_95:
  v58 = [NSNumber numberWithDouble:self->_gazeCenterX];
  [v5 setObject:v58 forKey:@"gazeCenterX"];

  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_44:
    objc_super v8 = [NSNumber numberWithDouble:self->_gazeCenterY];
    [v5 setObject:v8 forKey:@"gazeCenterY"];
  }
LABEL_45:
  gazeRect = self->_gazeRect;
  if (gazeRect)
  {
    v10 = [(VCPProtoBounds *)gazeRect dictionaryRepresentation];
    [v5 setObject:v10 forKey:@"gazeRect"];
  }
  $328DD4DCDDD95E438D2690214D11354C v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x2000000) != 0)
  {
    *(float *)&double v4 = self->_gazeAngle;
    v12 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v12 forKey:@"gazeAngle"];

    $328DD4DCDDD95E438D2690214D11354C v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x4000000) != 0)
  {
    *(float *)&double v4 = self->_gazeConfidence;
    v13 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v13 forKey:@"gazeConfidence"];
  }
  faceprint = self->_faceprint;
  if (faceprint)
  {
    v15 = [(MADProtoFaceprint *)faceprint dictionaryRepresentation];
    [v5 setObject:v15 forKey:@"faceprint"];
  }
  groupingIdentifier = self->_groupingIdentifier;
  if (groupingIdentifier) {
    [v5 setObject:groupingIdentifier forKey:@"groupingIdentifier"];
  }
  id v17 = v5;

  return v17;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoDetectedFaceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_faceLocalIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    $328DD4DCDDD95E438D2690214D11354C has = self->_has;
    if ((*(unsigned char *)&has & 0x40) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_60;
    }
  }
  else if ((*(unsigned char *)&has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_43;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_97:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_44:
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
LABEL_45:
  if (self->_gazeRect)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  $328DD4DCDDD95E438D2690214D11354C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v7;
    $328DD4DCDDD95E438D2690214D11354C v6 = self->_has;
  }
  if ((*(_DWORD *)&v6 & 0x4000000) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v7;
  }
  if (self->_faceprint)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_groupingIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = (char *)a3;
  id v7 = v4;
  if (self->_faceLocalIdentifier)
  {
    objc_msgSend(v4, "setFaceLocalIdentifier:");
    id v4 = v7;
  }
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *((void *)v4 + 17) = *(void *)&self->_size;
    *(void *)(v4 + 276) |= 0x10000uLL;
    $328DD4DCDDD95E438D2690214D11354C has = self->_has;
    if ((*(unsigned char *)&has & 0x40) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_60;
    }
  }
  else if ((*(unsigned char *)&has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 7) = *(void *)&self->_centerX;
  *(void *)(v4 + 276) |= 0x40uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)v4 + 8) = *(void *)&self->_centerY;
  *(void *)(v4 + 276) |= 0x80uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)v4 + 3) = *(void *)&self->_bodyCenterX;
  *(void *)(v4 + 276) |= 4uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)v4 + 4) = *(void *)&self->_bodyCenterY;
  *(void *)(v4 + 276) |= 8uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)v4 + 6) = *(void *)&self->_bodyWidth;
  *(void *)(v4 + 276) |= 0x20uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)v4 + 5) = *(void *)&self->_bodyHeight;
  *(void *)(v4 + 276) |= 0x10uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 41) = self->_detectionType;
  *(void *)(v4 + 276) |= 0x100000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((void *)v4 + 9) = self->_clusterSequenceNumber;
  *(void *)(v4 + 276) |= 0x100uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)v4 + 15) = self->_qualityMeasure;
  *(void *)(v4 + 276) |= 0x4000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)v4 + 14) = *(void *)&self->_quality;
  *(void *)(v4 + 276) |= 0x2000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)v4 + 19) = self->_sourceWidth;
  *(void *)(v4 + 276) |= 0x40000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)v4 + 18) = self->_sourceHeight;
  *(void *)(v4 + 276) |= 0x20000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)v4 + 16) = *(void *)&self->_roll;
  *(void *)(v4 + 276) |= 0x8000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_73;
  }
LABEL_72:
  v4[270] = self->_hidden;
  *(void *)(v4 + 276) |= 0x4000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_74;
  }
LABEL_73:
  v4[271] = self->_isInTrash;
  *(void *)(v4 + 276) |= 0x8000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_75;
  }
LABEL_74:
  v4[274] = self->_manual;
  *(void *)(v4 + 276) |= 0x40000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_76;
  }
LABEL_75:
  v4[269] = self->_hasSmile;
  *(void *)(v4 + 276) |= 0x2000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((void *)v4 + 2) = *(void *)&self->_blurScore;
  *(void *)(v4 + 276) |= 2uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_78;
  }
LABEL_77:
  v4[272] = self->_isLeftEyeClosed;
  *(void *)(v4 + 276) |= 0x10000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_79;
  }
LABEL_78:
  v4[273] = self->_isRightEyeClosed;
  *(void *)(v4 + 276) |= 0x20000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((void *)v4 + 1) = *(void *)&self->_adjustmentVersion;
  *(void *)(v4 + 276) |= 1uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((void *)v4 + 13) = *(void *)&self->_poseYaw;
  *(void *)(v4 + 276) |= 0x1000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((void *)v4 + 10) = self->_faceAlgorithmVersion;
  *(void *)(v4 + 276) |= 0x200uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)v4 + 40) = self->_ageType;
  *(void *)(v4 + 276) |= 0x80000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)v4 + 64) = self->_sexType;
  *(void *)(v4 + 276) |= 0x200000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v4 + 43) = self->_eyesState;
  *(void *)(v4 + 276) |= 0x400000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)v4 + 66) = self->_smileType;
  *(void *)(v4 + 276) |= 0x800000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)v4 + 50) = self->_facialHairType;
  *(void *)(v4 + 276) |= 0x1000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)v4 + 60) = self->_hairColorType;
  *(void *)(v4 + 276) |= 0x20000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v4 + 57) = self->_glassesType;
  *(void *)(v4 + 276) |= 0x10000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v4 + 44) = self->_faceExpressionType;
  *(void *)(v4 + 276) |= 0x800000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v4 + 62) = self->_headgearType;
  *(void *)(v4 + 276) |= 0x80000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v4 + 61) = self->_hairType;
  *(void *)(v4 + 276) |= 0x40000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v4 + 63) = self->_poseType;
  *(void *)(v4 + 276) |= 0x100000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v4 + 65) = self->_skintoneType;
  *(void *)(v4 + 276) |= 0x400000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)v4 + 42) = self->_ethnicityType;
  *(void *)(v4 + 276) |= 0x200000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_96;
  }
LABEL_95:
  v4[268] = self->_hasFaceMask;
  *(void *)(v4 + 276) |= 0x1000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_43;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)v4 + 56) = self->_gazeType;
  *(void *)(v4 + 276) |= 0x8000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_97:
  *((void *)v4 + 11) = *(void *)&self->_gazeCenterX;
  *(void *)(v4 + 276) |= 0x400uLL;
  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_44:
    *((void *)v4 + 12) = *(void *)&self->_gazeCenterY;
    *(void *)(v4 + 276) |= 0x800uLL;
  }
LABEL_45:
  if (self->_gazeRect)
  {
    objc_msgSend(v7, "setGazeRect:");
    id v4 = v7;
  }
  $328DD4DCDDD95E438D2690214D11354C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    *((_DWORD *)v4 + 51) = LODWORD(self->_gazeAngle);
    *(void *)(v4 + 276) |= 0x2000000uLL;
    $328DD4DCDDD95E438D2690214D11354C v6 = self->_has;
  }
  if ((*(_DWORD *)&v6 & 0x4000000) != 0)
  {
    *((_DWORD *)v4 + 52) = LODWORD(self->_gazeConfidence);
    *(void *)(v4 + 276) |= 0x4000000uLL;
  }
  if (self->_faceprint)
  {
    objc_msgSend(v7, "setFaceprint:");
    id v4 = v7;
  }
  if (self->_groupingIdentifier)
  {
    objc_msgSend(v7, "setGroupingIdentifier:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_faceLocalIdentifier copyWithZone:a3];
  id v7 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v6;

  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *(double *)(v5 + 136) = self->_size;
    *(void *)(v5 + 276) |= 0x10000uLL;
    $328DD4DCDDD95E438D2690214D11354C has = self->_has;
    if ((*(unsigned char *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_50;
    }
  }
  else if ((*(unsigned char *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 56) = self->_centerX;
  *(void *)(v5 + 276) |= 0x40uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(double *)(v5 + 64) = self->_centerY;
  *(void *)(v5 + 276) |= 0x80uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(double *)(v5 + 24) = self->_bodyCenterX;
  *(void *)(v5 + 276) |= 4uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(double *)(v5 + 32) = self->_bodyCenterY;
  *(void *)(v5 + 276) |= 8uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(double *)(v5 + 48) = self->_bodyWidth;
  *(void *)(v5 + 276) |= 0x20uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(double *)(v5 + 40) = self->_bodyHeight;
  *(void *)(v5 + 276) |= 0x10uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v5 + 164) = self->_detectionType;
  *(void *)(v5 + 276) |= 0x100000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(void *)(v5 + 72) = self->_clusterSequenceNumber;
  *(void *)(v5 + 276) |= 0x100uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(void *)(v5 + 120) = self->_qualityMeasure;
  *(void *)(v5 + 276) |= 0x4000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(double *)(v5 + 112) = self->_quality;
  *(void *)(v5 + 276) |= 0x2000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(void *)(v5 + 152) = self->_sourceWidth;
  *(void *)(v5 + 276) |= 0x40000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(void *)(v5 + 144) = self->_sourceHeight;
  *(void *)(v5 + 276) |= 0x20000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(double *)(v5 + 128) = self->_roll;
  *(void *)(v5 + 276) |= 0x8000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_16:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(unsigned char *)(v5 + 270) = self->_hidden;
  *(void *)(v5 + 276) |= 0x4000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_17:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(unsigned char *)(v5 + 271) = self->_isInTrash;
  *(void *)(v5 + 276) |= 0x8000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(unsigned char *)(v5 + 274) = self->_manual;
  *(void *)(v5 + 276) |= 0x40000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(unsigned char *)(v5 + 269) = self->_hasSmile;
  *(void *)(v5 + 276) |= 0x2000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(double *)(v5 + 16) = self->_blurScore;
  *(void *)(v5 + 276) |= 2uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(unsigned char *)(v5 + 272) = self->_isLeftEyeClosed;
  *(void *)(v5 + 276) |= 0x10000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(unsigned char *)(v5 + 273) = self->_isRightEyeClosed;
  *(void *)(v5 + 276) |= 0x20000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(double *)(v5 + 8) = self->_adjustmentVersion;
  *(void *)(v5 + 276) |= 1uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(double *)(v5 + 104) = self->_poseYaw;
  *(void *)(v5 + 276) |= 0x1000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(void *)(v5 + 80) = self->_faceAlgorithmVersion;
  *(void *)(v5 + 276) |= 0x200uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v5 + 160) = self->_ageType;
  *(void *)(v5 + 276) |= 0x80000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 256) = self->_sexType;
  *(void *)(v5 + 276) |= 0x200000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 172) = self->_eyesState;
  *(void *)(v5 + 276) |= 0x400000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v5 + 264) = self->_smileType;
  *(void *)(v5 + 276) |= 0x800000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v5 + 200) = self->_facialHairType;
  *(void *)(v5 + 276) |= 0x1000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 240) = self->_hairColorType;
  *(void *)(v5 + 276) |= 0x20000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v5 + 228) = self->_glassesType;
  *(void *)(v5 + 276) |= 0x10000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v5 + 176) = self->_faceExpressionType;
  *(void *)(v5 + 276) |= 0x800000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(_DWORD *)(v5 + 248) = self->_headgearType;
  *(void *)(v5 + 276) |= 0x80000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v5 + 244) = self->_hairType;
  *(void *)(v5 + 276) |= 0x40000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_36:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v5 + 252) = self->_poseType;
  *(void *)(v5 + 276) |= 0x100000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v5 + 260) = self->_skintoneType;
  *(void *)(v5 + 276) |= 0x400000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v5 + 168) = self->_ethnicityType;
  *(void *)(v5 + 276) |= 0x200000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(unsigned char *)(v5 + 268) = self->_hasFaceMask;
  *(void *)(v5 + 276) |= 0x1000000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_41;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v5 + 224) = self->_gazeType;
  *(void *)(v5 + 276) |= 0x8000000uLL;
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_87:
  *(double *)(v5 + 88) = self->_gazeCenterX;
  *(void *)(v5 + 276) |= 0x400uLL;
  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_42:
    *(double *)(v5 + 96) = self->_gazeCenterY;
    *(void *)(v5 + 276) |= 0x800uLL;
  }
LABEL_43:
  id v9 = [(VCPProtoBounds *)self->_gazeRect copyWithZone:a3];
  v10 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v9;

  $328DD4DCDDD95E438D2690214D11354C v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x2000000) != 0)
  {
    *(float *)(v5 + 204) = self->_gazeAngle;
    *(void *)(v5 + 276) |= 0x2000000uLL;
    $328DD4DCDDD95E438D2690214D11354C v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x4000000) != 0)
  {
    *(float *)(v5 + 208) = self->_gazeConfidence;
    *(void *)(v5 + 276) |= 0x4000000uLL;
  }
  id v12 = [(MADProtoFaceprint *)self->_faceprint copyWithZone:a3];
  v13 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v12;

  uint64_t v14 = [(NSString *)self->_groupingIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v14;

  id v16 = (id)v5;
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_247;
  }
  faceLocalIdentifier = self->_faceLocalIdentifier;
  if ((unint64_t)faceLocalIdentifier | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](faceLocalIdentifier, "isEqual:")) {
      goto LABEL_247;
    }
  }
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  uint64_t v7 = *(void *)(v4 + 276);
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_size != *((double *)v4 + 17)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_centerX != *((double *)v4 + 7)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_247;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_centerY != *((double *)v4 + 8)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_247;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_bodyCenterX != *((double *)v4 + 3)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_247;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_bodyCenterY != *((double *)v4 + 4)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_247;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_bodyWidth != *((double *)v4 + 6)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_247;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_bodyHeight != *((double *)v4 + 5)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_detectionType != *((_DWORD *)v4 + 41)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_clusterSequenceNumber != *((void *)v4 + 9)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_qualityMeasure != *((void *)v4 + 15)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_quality != *((double *)v4 + 14)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_sourceWidth != *((void *)v4 + 19)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_sourceHeight != *((void *)v4 + 18)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_roll != *((double *)v4 + 16)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0) {
      goto LABEL_247;
    }
    if (self->_hidden)
    {
      if (!v4[270]) {
        goto LABEL_247;
      }
    }
    else if (v4[270])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0) {
      goto LABEL_247;
    }
    if (self->_isInTrash)
    {
      if (!v4[271]) {
        goto LABEL_247;
      }
    }
    else if (v4[271])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0) {
      goto LABEL_247;
    }
    if (self->_manual)
    {
      if (!v4[274]) {
        goto LABEL_247;
      }
    }
    else if (v4[274])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0) {
      goto LABEL_247;
    }
    if (self->_hasSmile)
    {
      if (!v4[269]) {
        goto LABEL_247;
      }
    }
    else if (v4[269])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_blurScore != *((double *)v4 + 2)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_247;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0) {
      goto LABEL_247;
    }
    if (self->_isLeftEyeClosed)
    {
      if (!v4[272]) {
        goto LABEL_247;
      }
    }
    else if (v4[272])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0) {
      goto LABEL_247;
    }
    if (self->_isRightEyeClosed)
    {
      if (!v4[273]) {
        goto LABEL_247;
      }
    }
    else if (v4[273])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_247;
  }
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_adjustmentVersion != *((double *)v4 + 1)) {
      goto LABEL_247;
    }
  }
  else if (v7)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_poseYaw != *((double *)v4 + 13)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_faceAlgorithmVersion != *((void *)v4 + 10)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_ageType != *((_DWORD *)v4 + 40)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_sexType != *((_DWORD *)v4 + 64)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_eyesState != *((_DWORD *)v4 + 43)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0 || self->_smileType != *((_DWORD *)v4 + 66)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_facialHairType != *((_DWORD *)v4 + 50)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_hairColorType != *((_DWORD *)v4 + 60)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_glassesType != *((_DWORD *)v4 + 57)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_faceExpressionType != *((_DWORD *)v4 + 44)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_headgearType != *((_DWORD *)v4 + 62)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_hairType != *((_DWORD *)v4 + 61)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_poseType != *((_DWORD *)v4 + 63)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_skintoneType != *((_DWORD *)v4 + 65)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_ethnicityType != *((_DWORD *)v4 + 42)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0) {
      goto LABEL_247;
    }
    if (self->_hasFaceMask)
    {
      if (!v4[268]) {
        goto LABEL_247;
      }
    }
    else if (v4[268])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_gazeType != *((_DWORD *)v4 + 56)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_gazeCenterX != *((double *)v4 + 11)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_gazeCenterY != *((double *)v4 + 12)) {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_247;
  }
  gazeRect = self->_gazeRect;
  if ((unint64_t)gazeRect | *((void *)v4 + 27))
  {
    if (-[VCPProtoBounds isEqual:](gazeRect, "isEqual:"))
    {
      $328DD4DCDDD95E438D2690214D11354C has = self->_has;
      goto LABEL_233;
    }
LABEL_247:
    char v12 = 0;
    goto LABEL_248;
  }
LABEL_233:
  uint64_t v9 = *(void *)(v4 + 276);
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v9 & 0x2000000) == 0 || self->_gazeAngle != *((float *)v4 + 51)) {
      goto LABEL_247;
    }
  }
  else if ((v9 & 0x2000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v9 & 0x4000000) == 0 || self->_gazeConfidence != *((float *)v4 + 52)) {
      goto LABEL_247;
    }
  }
  else if ((v9 & 0x4000000) != 0)
  {
    goto LABEL_247;
  }
  faceprint = self->_faceprint;
  if ((unint64_t)faceprint | *((void *)v4 + 24) && !-[MADProtoFaceprint isEqual:](faceprint, "isEqual:")) {
    goto LABEL_247;
  }
  groupingIdentifier = self->_groupingIdentifier;
  if ((unint64_t)groupingIdentifier | *((void *)v4 + 29)) {
    char v12 = -[NSString isEqual:](groupingIdentifier, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_248:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v130 = [(NSString *)self->_faceLocalIdentifier hash];
  $328DD4DCDDD95E438D2690214D11354C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    double size = self->_size;
    double v6 = -size;
    if (size >= 0.0) {
      double v6 = self->_size;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    double centerX = self->_centerX;
    double v11 = -centerX;
    if (centerX >= 0.0) {
      double v11 = self->_centerX;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    double centerY = self->_centerY;
    double v16 = -centerY;
    if (centerY >= 0.0) {
      double v16 = self->_centerY;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    double bodyCenterX = self->_bodyCenterX;
    double v21 = -bodyCenterX;
    if (bodyCenterX >= 0.0) {
      double v21 = self->_bodyCenterX;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    double bodyCenterY = self->_bodyCenterY;
    double v26 = -bodyCenterY;
    if (bodyCenterY >= 0.0) {
      double v26 = self->_bodyCenterY;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    double bodyWidth = self->_bodyWidth;
    double v31 = -bodyWidth;
    if (bodyWidth >= 0.0) {
      double v31 = self->_bodyWidth;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    double bodyHeight = self->_bodyHeight;
    double v36 = -bodyHeight;
    if (bodyHeight >= 0.0) {
      double v36 = self->_bodyHeight;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  unint64_t v126 = v34;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    uint64_t v125 = 2654435761 * self->_detectionType;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_59:
      uint64_t v124 = 2654435761 * self->_clusterSequenceNumber;
      if ((*(_WORD *)&has & 0x4000) != 0) {
        goto LABEL_60;
      }
LABEL_67:
      uint64_t v123 = 0;
      if ((*(_WORD *)&has & 0x2000) != 0) {
        goto LABEL_61;
      }
LABEL_68:
      unint64_t v43 = 0;
      goto LABEL_71;
    }
  }
  else
  {
    uint64_t v125 = 0;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_59;
    }
  }
  uint64_t v124 = 0;
  if ((*(_WORD *)&has & 0x4000) == 0) {
    goto LABEL_67;
  }
LABEL_60:
  uint64_t v123 = 2654435761 * self->_qualityMeasure;
  if ((*(_WORD *)&has & 0x2000) == 0) {
    goto LABEL_68;
  }
LABEL_61:
  double quality = self->_quality;
  double v40 = -quality;
  if (quality >= 0.0) {
    double v40 = self->_quality;
  }
  long double v41 = floor(v40 + 0.5);
  double v42 = (v40 - v41) * 1.84467441e19;
  unint64_t v43 = 2654435761u * (unint64_t)fmod(v41, 1.84467441e19);
  if (v42 >= 0.0)
  {
    if (v42 > 0.0) {
      v43 += (unint64_t)v42;
    }
  }
  else
  {
    v43 -= (unint64_t)fabs(v42);
  }
LABEL_71:
  unint64_t v122 = v43;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
    uint64_t v121 = 0;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_73;
    }
LABEL_79:
    uint64_t v120 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_74;
    }
LABEL_80:
    unint64_t v48 = 0;
    goto LABEL_83;
  }
  uint64_t v121 = 2654435761 * self->_sourceWidth;
  if ((*(_DWORD *)&has & 0x20000) == 0) {
    goto LABEL_79;
  }
LABEL_73:
  uint64_t v120 = 2654435761 * self->_sourceHeight;
  if ((*(_WORD *)&has & 0x8000) == 0) {
    goto LABEL_80;
  }
LABEL_74:
  double roll = self->_roll;
  double v45 = -roll;
  if (roll >= 0.0) {
    double v45 = self->_roll;
  }
  long double v46 = floor(v45 + 0.5);
  double v47 = (v45 - v46) * 1.84467441e19;
  unint64_t v48 = 2654435761u * (unint64_t)fmod(v46, 1.84467441e19);
  if (v47 >= 0.0)
  {
    if (v47 > 0.0) {
      v48 += (unint64_t)v47;
    }
  }
  else
  {
    v48 -= (unint64_t)fabs(v47);
  }
LABEL_83:
  unint64_t v119 = v48;
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    uint64_t v118 = 2654435761 * self->_hidden;
    if ((*(void *)&has & 0x8000000000) != 0)
    {
LABEL_85:
      uint64_t v117 = 2654435761 * self->_isInTrash;
      if ((*(void *)&has & 0x40000000000) != 0) {
        goto LABEL_86;
      }
      goto LABEL_94;
    }
  }
  else
  {
    uint64_t v118 = 0;
    if ((*(void *)&has & 0x8000000000) != 0) {
      goto LABEL_85;
    }
  }
  uint64_t v117 = 0;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
LABEL_86:
    uint64_t v116 = 2654435761 * self->_manual;
    if ((*(void *)&has & 0x2000000000) != 0) {
      goto LABEL_87;
    }
LABEL_95:
    uint64_t v115 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_88;
    }
LABEL_96:
    unint64_t v53 = 0;
    goto LABEL_99;
  }
LABEL_94:
  uint64_t v116 = 0;
  if ((*(void *)&has & 0x2000000000) == 0) {
    goto LABEL_95;
  }
LABEL_87:
  uint64_t v115 = 2654435761 * self->_hasSmile;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_96;
  }
LABEL_88:
  double blurScore = self->_blurScore;
  double v50 = -blurScore;
  if (blurScore >= 0.0) {
    double v50 = self->_blurScore;
  }
  long double v51 = floor(v50 + 0.5);
  double v52 = (v50 - v51) * 1.84467441e19;
  unint64_t v53 = 2654435761u * (unint64_t)fmod(v51, 1.84467441e19);
  if (v52 >= 0.0)
  {
    if (v52 > 0.0) {
      v53 += (unint64_t)v52;
    }
  }
  else
  {
    v53 -= (unint64_t)fabs(v52);
  }
LABEL_99:
  unint64_t v114 = v53;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    uint64_t v113 = 2654435761 * self->_isLeftEyeClosed;
    if ((*(void *)&has & 0x20000000000) != 0)
    {
LABEL_101:
      uint64_t v112 = 2654435761 * self->_isRightEyeClosed;
      if (*(unsigned char *)&has) {
        goto LABEL_102;
      }
LABEL_108:
      unint64_t v131 = 0;
      goto LABEL_112;
    }
  }
  else
  {
    uint64_t v113 = 0;
    if ((*(void *)&has & 0x20000000000) != 0) {
      goto LABEL_101;
    }
  }
  uint64_t v112 = 0;
  if ((*(unsigned char *)&has & 1) == 0) {
    goto LABEL_108;
  }
LABEL_102:
  double adjustmentVersion = self->_adjustmentVersion;
  double v55 = -adjustmentVersion;
  if (adjustmentVersion >= 0.0) {
    double v55 = self->_adjustmentVersion;
  }
  long double v56 = floor(v55 + 0.5);
  double v57 = (v55 - v56) * 1.84467441e19;
  unint64_t v58 = 2654435761u * (unint64_t)fmod(v56, 1.84467441e19);
  if (v57 >= 0.0)
  {
    unint64_t v131 = v58;
    if (v57 <= 0.0) {
      goto LABEL_112;
    }
    unint64_t v59 = v58 + (unint64_t)v57;
  }
  else
  {
    unint64_t v59 = v58 - (unint64_t)fabs(v57);
  }
  unint64_t v131 = v59;
LABEL_112:
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    double poseYaw = self->_poseYaw;
    double v62 = -poseYaw;
    if (poseYaw >= 0.0) {
      double v62 = self->_poseYaw;
    }
    long double v63 = floor(v62 + 0.5);
    double v64 = (v62 - v63) * 1.84467441e19;
    unint64_t v60 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0) {
        v60 += (unint64_t)v64;
      }
    }
    else
    {
      v60 -= (unint64_t)fabs(v64);
    }
  }
  else
  {
    unint64_t v60 = 0;
  }
  unint64_t v111 = v60;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    uint64_t v110 = 2654435761 * self->_faceAlgorithmVersion;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
LABEL_122:
      uint64_t v109 = 2654435761 * self->_ageType;
      if ((*(void *)&has & 0x200000000) != 0) {
        goto LABEL_123;
      }
      goto LABEL_137;
    }
  }
  else
  {
    uint64_t v110 = 0;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_122;
    }
  }
  uint64_t v109 = 0;
  if ((*(void *)&has & 0x200000000) != 0)
  {
LABEL_123:
    uint64_t v108 = 2654435761 * self->_sexType;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_124;
    }
    goto LABEL_138;
  }
LABEL_137:
  uint64_t v108 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_124:
    uint64_t v107 = 2654435761 * self->_eyesState;
    if ((*(void *)&has & 0x800000000) != 0) {
      goto LABEL_125;
    }
    goto LABEL_139;
  }
LABEL_138:
  uint64_t v107 = 0;
  if ((*(void *)&has & 0x800000000) != 0)
  {
LABEL_125:
    uint64_t v106 = 2654435761 * self->_smileType;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_126;
    }
    goto LABEL_140;
  }
LABEL_139:
  uint64_t v106 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_126:
    uint64_t v105 = 2654435761 * self->_facialHairType;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_127;
    }
    goto LABEL_141;
  }
LABEL_140:
  uint64_t v105 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_127:
    uint64_t v104 = 2654435761 * self->_hairColorType;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_128;
    }
    goto LABEL_142;
  }
LABEL_141:
  uint64_t v104 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_128:
    uint64_t v103 = 2654435761 * self->_glassesType;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_129;
    }
    goto LABEL_143;
  }
LABEL_142:
  uint64_t v103 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_129:
    uint64_t v102 = 2654435761 * self->_faceExpressionType;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_130;
    }
    goto LABEL_144;
  }
LABEL_143:
  uint64_t v102 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_130:
    uint64_t v101 = 2654435761 * self->_headgearType;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_131;
    }
    goto LABEL_145;
  }
LABEL_144:
  uint64_t v101 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_131:
    uint64_t v100 = 2654435761 * self->_hairType;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_132;
    }
    goto LABEL_146;
  }
LABEL_145:
  uint64_t v100 = 0;
  if ((*(void *)&has & 0x100000000) != 0)
  {
LABEL_132:
    uint64_t v99 = 2654435761 * self->_poseType;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_133;
    }
LABEL_147:
    uint64_t v98 = 0;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_134;
    }
    goto LABEL_148;
  }
LABEL_146:
  uint64_t v99 = 0;
  if ((*(void *)&has & 0x400000000) == 0) {
    goto LABEL_147;
  }
LABEL_133:
  uint64_t v98 = 2654435761 * self->_skintoneType;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_134:
    uint64_t v97 = 2654435761 * self->_ethnicityType;
    goto LABEL_149;
  }
LABEL_148:
  uint64_t v97 = 0;
LABEL_149:
  unint64_t v129 = v9;
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    uint64_t v96 = 2654435761 * self->_hasFaceMask;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_151;
    }
  }
  else
  {
    uint64_t v96 = 0;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
LABEL_151:
      uint64_t v94 = 2654435761 * self->_gazeType;
      goto LABEL_154;
    }
  }
  uint64_t v94 = 0;
LABEL_154:
  unint64_t v127 = v29;
  unint64_t v128 = v4;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    double gazeCenterX = self->_gazeCenterX;
    double v68 = -gazeCenterX;
    if (gazeCenterX >= 0.0) {
      double v68 = self->_gazeCenterX;
    }
    long double v69 = floor(v68 + 0.5);
    double v70 = (v68 - v69) * 1.84467441e19;
    unint64_t v66 = 2654435761u * (unint64_t)fmod(v69, 1.84467441e19);
    unint64_t v65 = v19;
    if (v70 >= 0.0)
    {
      if (v70 > 0.0) {
        v66 += (unint64_t)v70;
      }
    }
    else
    {
      v66 -= (unint64_t)fabs(v70);
    }
  }
  else
  {
    unint64_t v65 = v19;
    unint64_t v66 = 0;
  }
  unint64_t v71 = v14;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    double gazeCenterY = self->_gazeCenterY;
    double v74 = -gazeCenterY;
    if (gazeCenterY >= 0.0) {
      double v74 = self->_gazeCenterY;
    }
    long double v75 = floor(v74 + 0.5);
    double v76 = (v74 - v75) * 1.84467441e19;
    unint64_t v72 = 2654435761u * (unint64_t)fmod(v75, 1.84467441e19);
    if (v76 >= 0.0)
    {
      if (v76 > 0.0) {
        v72 += (unint64_t)v76;
      }
    }
    else
    {
      v72 -= (unint64_t)fabs(v76);
    }
  }
  else
  {
    unint64_t v72 = 0;
  }
  unint64_t v77 = v24;
  unint64_t v78 = [(VCPProtoBounds *)self->_gazeRect hash];
  $328DD4DCDDD95E438D2690214D11354C v79 = self->_has;
  if ((*(_DWORD *)&v79 & 0x2000000) != 0)
  {
    float gazeAngle = self->_gazeAngle;
    float v82 = -gazeAngle;
    if (gazeAngle >= 0.0) {
      float v82 = self->_gazeAngle;
    }
    float v83 = floorf(v82 + 0.5);
    float v84 = (float)(v82 - v83) * 1.8447e19;
    unint64_t v80 = 2654435761u * (unint64_t)fmodf(v83, 1.8447e19);
    if (v84 >= 0.0)
    {
      if (v84 > 0.0) {
        v80 += (unint64_t)v84;
      }
    }
    else
    {
      v80 -= (unint64_t)fabsf(v84);
    }
  }
  else
  {
    unint64_t v80 = 0;
  }
  if ((*(_DWORD *)&v79 & 0x4000000) == 0)
  {
    unint64_t v85 = 0;
LABEL_184:
    unint64_t v90 = v131;
    goto LABEL_185;
  }
  float gazeConfidence = self->_gazeConfidence;
  float v87 = -gazeConfidence;
  if (gazeConfidence >= 0.0) {
    float v87 = self->_gazeConfidence;
  }
  float v88 = floorf(v87 + 0.5);
  float v89 = (float)(v87 - v88) * 1.8447e19;
  unint64_t v85 = 2654435761u * (unint64_t)fmodf(v88, 1.8447e19);
  if (v89 < 0.0)
  {
    v85 -= (unint64_t)fabsf(v89);
    goto LABEL_184;
  }
  unint64_t v90 = v131;
  if (v89 > 0.0) {
    v85 += (unint64_t)v89;
  }
LABEL_185:
  NSUInteger v91 = v128 ^ v130 ^ v129 ^ v71 ^ v65 ^ v77 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v90 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v66 ^ v72 ^ v78 ^ v80;
  unint64_t v92 = v85 ^ [(MADProtoFaceprint *)self->_faceprint hash];
  return v91 ^ v92 ^ [(NSString *)self->_groupingIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (char *)a3;
  double v11 = v4;
  if (*((void *)v4 + 23))
  {
    -[MADProtoDetectedFace setFaceLocalIdentifier:](self, "setFaceLocalIdentifier:");
    unint64_t v4 = v11;
  }
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x10000) != 0)
  {
    self->_double size = *((double *)v4 + 17);
    *(void *)&self->_has |= 0x10000uLL;
    uint64_t v5 = *(void *)(v4 + 276);
    if ((v5 & 0x40) == 0)
    {
LABEL_5:
      if ((v5 & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_50;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_5;
  }
  self->_double centerX = *((double *)v4 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_double centerY = *((double *)v4 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_double bodyCenterX = *((double *)v4 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_double bodyCenterY = *((double *)v4 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_double bodyWidth = *((double *)v4 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_double bodyHeight = *((double *)v4 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x100000) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_detectionType = *((_DWORD *)v4 + 41);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_clusterSequenceNumber = *((void *)v4 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_qualityMeasure = *((void *)v4 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x2000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_double quality = *((double *)v4 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x40000) == 0)
  {
LABEL_15:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_sourceWidth = *((void *)v4 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x20000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_sourceHeight = *((void *)v4 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_double roll = *((double *)v4 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_18:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_hidden = v4[270];
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_isInTrash = v4[271];
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x2000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_manual = v4[274];
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_21:
    if ((v5 & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_hasSmile = v4[269];
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 2) == 0)
  {
LABEL_22:
    if ((v5 & 0x10000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_double blurScore = *((double *)v4 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x20000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_isLeftEyeClosed = v4[272];
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_24:
    if ((v5 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_isRightEyeClosed = v4[273];
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 1) == 0)
  {
LABEL_25:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_double adjustmentVersion = *((double *)v4 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x1000) == 0)
  {
LABEL_26:
    if ((v5 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_double poseYaw = *((double *)v4 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x200) == 0)
  {
LABEL_27:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_faceAlgorithmVersion = *((void *)v4 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x80000) == 0)
  {
LABEL_28:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_ageType = *((_DWORD *)v4 + 40);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_sexType = *((_DWORD *)v4 + 64);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x400000) == 0)
  {
LABEL_30:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_eyesState = *((_DWORD *)v4 + 43);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_smileType = *((_DWORD *)v4 + 66);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_facialHairType = *((_DWORD *)v4 + 50);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_hairColorType = *((_DWORD *)v4 + 60);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_glassesType = *((_DWORD *)v4 + 57);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x800000) == 0)
  {
LABEL_35:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_faceExpressionType = *((_DWORD *)v4 + 44);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_headgearType = *((_DWORD *)v4 + 62);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_37:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_hairType = *((_DWORD *)v4 + 61);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_poseType = *((_DWORD *)v4 + 63);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_skintoneType = *((_DWORD *)v4 + 65);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x200000) == 0)
  {
LABEL_40:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_ethnicityType = *((_DWORD *)v4 + 42);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_hasFaceMask = v4[268];
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_42:
    if ((v5 & 0x400) == 0) {
      goto LABEL_43;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_gazeType = *((_DWORD *)v4 + 56);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v5 = *(void *)(v4 + 276);
  if ((v5 & 0x400) == 0)
  {
LABEL_43:
    if ((v5 & 0x800) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_87:
  self->_double gazeCenterX = *((double *)v4 + 11);
  *(void *)&self->_has |= 0x400uLL;
  if ((*(void *)(v4 + 276) & 0x800) != 0)
  {
LABEL_44:
    self->_double gazeCenterY = *((double *)v4 + 12);
    *(void *)&self->_has |= 0x800uLL;
  }
LABEL_45:
  gazeRect = self->_gazeRect;
  uint64_t v7 = *((void *)v4 + 27);
  if (gazeRect)
  {
    if (!v7) {
      goto LABEL_92;
    }
    -[VCPProtoBounds mergeFrom:](gazeRect, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_92;
    }
    -[MADProtoDetectedFace setGazeRect:](self, "setGazeRect:");
  }
  unint64_t v4 = v11;
LABEL_92:
  uint64_t v8 = *(void *)(v4 + 276);
  if ((v8 & 0x2000000) != 0)
  {
    self->_float gazeAngle = *((float *)v4 + 51);
    *(void *)&self->_has |= 0x2000000uLL;
    uint64_t v8 = *(void *)(v4 + 276);
  }
  if ((v8 & 0x4000000) != 0)
  {
    self->_float gazeConfidence = *((float *)v4 + 52);
    *(void *)&self->_has |= 0x4000000uLL;
  }
  faceprint = self->_faceprint;
  uint64_t v10 = *((void *)v4 + 24);
  if (faceprint)
  {
    if (!v10) {
      goto LABEL_102;
    }
    -[MADProtoFaceprint mergeFrom:](faceprint, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_102;
    }
    -[MADProtoDetectedFace setFaceprint:](self, "setFaceprint:");
  }
  unint64_t v4 = v11;
LABEL_102:
  if (*((void *)v4 + 29))
  {
    -[MADProtoDetectedFace setGroupingIdentifier:](self, "setGroupingIdentifier:");
    unint64_t v4 = v11;
  }
}

- (NSString)faceLocalIdentifier
{
  return self->_faceLocalIdentifier;
}

- (void)setFaceLocalIdentifier:(id)a3
{
}

- (double)size
{
  return self->_size;
}

- (double)centerX
{
  return self->_centerX;
}

- (double)centerY
{
  return self->_centerY;
}

- (double)bodyCenterX
{
  return self->_bodyCenterX;
}

- (double)bodyCenterY
{
  return self->_bodyCenterY;
}

- (double)bodyWidth
{
  return self->_bodyWidth;
}

- (double)bodyHeight
{
  return self->_bodyHeight;
}

- (int)detectionType
{
  return self->_detectionType;
}

- (int64_t)clusterSequenceNumber
{
  return self->_clusterSequenceNumber;
}

- (int64_t)qualityMeasure
{
  return self->_qualityMeasure;
}

- (double)quality
{
  return self->_quality;
}

- (int64_t)sourceWidth
{
  return self->_sourceWidth;
}

- (int64_t)sourceHeight
{
  return self->_sourceHeight;
}

- (double)roll
{
  return self->_roll;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (BOOL)isInTrash
{
  return self->_isInTrash;
}

- (BOOL)manual
{
  return self->_manual;
}

- (BOOL)hasSmile
{
  return self->_hasSmile;
}

- (double)blurScore
{
  return self->_blurScore;
}

- (BOOL)isLeftEyeClosed
{
  return self->_isLeftEyeClosed;
}

- (BOOL)isRightEyeClosed
{
  return self->_isRightEyeClosed;
}

- (double)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (double)poseYaw
{
  return self->_poseYaw;
}

- (int64_t)faceAlgorithmVersion
{
  return self->_faceAlgorithmVersion;
}

- (unsigned)ageType
{
  return self->_ageType;
}

- (unsigned)sexType
{
  return self->_sexType;
}

- (unsigned)eyesState
{
  return self->_eyesState;
}

- (unsigned)smileType
{
  return self->_smileType;
}

- (unsigned)facialHairType
{
  return self->_facialHairType;
}

- (unsigned)hairColorType
{
  return self->_hairColorType;
}

- (unsigned)glassesType
{
  return self->_glassesType;
}

- (unsigned)faceExpressionType
{
  return self->_faceExpressionType;
}

- (unsigned)headgearType
{
  return self->_headgearType;
}

- (unsigned)hairType
{
  return self->_hairType;
}

- (unsigned)poseType
{
  return self->_poseType;
}

- (unsigned)skintoneType
{
  return self->_skintoneType;
}

- (unsigned)ethnicityType
{
  return self->_ethnicityType;
}

- (BOOL)hasFaceMask
{
  return self->_hasFaceMask;
}

- (unsigned)gazeType
{
  return self->_gazeType;
}

- (double)gazeCenterX
{
  return self->_gazeCenterX;
}

- (double)gazeCenterY
{
  return self->_gazeCenterY;
}

- (VCPProtoBounds)gazeRect
{
  return self->_gazeRect;
}

- (void)setGazeRect:(id)a3
{
}

- (float)gazeAngle
{
  return self->_gazeAngle;
}

- (float)gazeConfidence
{
  return self->_gazeConfidence;
}

- (MADProtoFaceprint)faceprint
{
  return self->_faceprint;
}

- (void)setFaceprint:(id)a3
{
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (void)setGroupingIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
  objc_storeStrong((id *)&self->_gazeRect, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_faceLocalIdentifier, 0);
}

@end