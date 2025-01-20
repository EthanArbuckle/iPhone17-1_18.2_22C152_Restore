@interface CPLAdjustments
+ (BOOL)supportsSecureCoding;
- (CPLAdjustments)initWithCoder:(id)a3;
- (CPLResource)adjustmentData;
- (NSData)simpleAdjustmentData;
- (NSDate)adjustmentTimestamp;
- (NSString)adjustmentCompoundVersion;
- (NSString)adjustmentCreatorCode;
- (NSString)adjustmentType;
- (NSString)creatorCode;
- (NSString)otherAdjustmentsFingerprint;
- (NSString)similarToOriginalAdjustmentsFingerprint;
- (id)adjustmentSimpleDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)adjustmentRenderTypes;
- (unint64_t)adjustmentSourceType;
- (void)setAdjustmentCompoundVersion:(id)a3;
- (void)setAdjustmentCreatorCode:(id)a3;
- (void)setAdjustmentData:(id)a3;
- (void)setAdjustmentRenderTypes:(unint64_t)a3;
- (void)setAdjustmentSourceType:(unint64_t)a3;
- (void)setAdjustmentTimestamp:(id)a3;
- (void)setAdjustmentType:(id)a3;
- (void)setCreatorCode:(id)a3;
- (void)setOtherAdjustmentsFingerprint:(id)a3;
- (void)setSimilarToOriginalAdjustmentsFingerprint:(id)a3;
- (void)setSimpleAdjustmentData:(id)a3;
@end

@implementation CPLAdjustments

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creatorCode, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
  objc_storeStrong((id *)&self->_otherAdjustmentsFingerprint, 0);
  objc_storeStrong((id *)&self->_similarToOriginalAdjustmentsFingerprint, 0);
  objc_storeStrong((id *)&self->_simpleAdjustmentData, 0);
  objc_storeStrong((id *)&self->_adjustmentTimestamp, 0);
  objc_storeStrong((id *)&self->_adjustmentCreatorCode, 0);
  objc_storeStrong((id *)&self->_adjustmentCompoundVersion, 0);
  objc_storeStrong((id *)&self->_adjustmentType, 0);
}

- (void)setCreatorCode:(id)a3
{
}

- (NSString)creatorCode
{
  return self->_creatorCode;
}

- (void)setAdjustmentData:(id)a3
{
}

- (CPLResource)adjustmentData
{
  return self->_adjustmentData;
}

- (void)setAdjustmentRenderTypes:(unint64_t)a3
{
  self->_adjustmentRenderTypes = a3;
}

- (unint64_t)adjustmentRenderTypes
{
  return self->_adjustmentRenderTypes;
}

- (void)setOtherAdjustmentsFingerprint:(id)a3
{
}

- (NSString)otherAdjustmentsFingerprint
{
  return self->_otherAdjustmentsFingerprint;
}

- (void)setSimilarToOriginalAdjustmentsFingerprint:(id)a3
{
}

- (NSString)similarToOriginalAdjustmentsFingerprint
{
  return self->_similarToOriginalAdjustmentsFingerprint;
}

- (void)setSimpleAdjustmentData:(id)a3
{
}

- (NSData)simpleAdjustmentData
{
  return self->_simpleAdjustmentData;
}

- (void)setAdjustmentSourceType:(unint64_t)a3
{
  self->_adjustmentSourceType = a3;
}

- (unint64_t)adjustmentSourceType
{
  return self->_adjustmentSourceType;
}

- (void)setAdjustmentTimestamp:(id)a3
{
}

- (NSDate)adjustmentTimestamp
{
  return self->_adjustmentTimestamp;
}

- (void)setAdjustmentCreatorCode:(id)a3
{
}

- (NSString)adjustmentCreatorCode
{
  return self->_adjustmentCreatorCode;
}

- (void)setAdjustmentCompoundVersion:(id)a3
{
}

- (NSString)adjustmentCompoundVersion
{
  return self->_adjustmentCompoundVersion;
}

- (void)setAdjustmentType:(id)a3
{
}

- (NSString)adjustmentType
{
  return self->_adjustmentType;
}

- (id)adjustmentSimpleDescription
{
  unint64_t adjustmentSourceType = self->_adjustmentSourceType;
  v3 = @"autoloop";
  v4 = @"cinematic";
  unint64_t adjustmentRenderTypes = self->_adjustmentRenderTypes;
  v6 = @"undef";
  if (adjustmentRenderTypes == 2) {
    v6 = @"portait";
  }
  if (adjustmentRenderTypes != 128) {
    v4 = v6;
  }
  if (adjustmentRenderTypes != 1) {
    v3 = v4;
  }
  v7 = @"orig.";
  if (adjustmentSourceType) {
    v7 = @"unkn.";
  }
  if (adjustmentSourceType == 1) {
    v7 = @"base";
  }
  return (id)[NSString stringWithFormat:@"%@ on %@ (%@)", self->_adjustmentType, v7, v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 cplCopyPropertiesFromObject:self withCopyBlock:0];
  return v4;
}

- (CPLAdjustments)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLAdjustments;
  v5 = [(CPLAdjustments *)&v8 init];
  v6 = v5;
  if (v5) {
    [v5 cplDecodePropertiesFromCoder:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end