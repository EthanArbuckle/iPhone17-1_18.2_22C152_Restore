@interface CinematicFramingSessionFramingParameters
- (CinematicFramingSessionFramingParameters)initWithPlist:(id)a3;
- (CinematicFramingSessionFramingParameters)initWithPlistPath:(id)a3;
- (float)deadbandHeightFractionOfScreenHeight;
- (float)deadbandTopOffsetFractionOfScreenHeight;
- (float)deadbandWidthFractionOfScreenWidth;
- (float)deadbandWidthMaxFraction;
- (float)deadbandWidthMinFraction;
- (float)horizontalMinAbsoluteDifferenceThreshold;
- (float)horizontalMinRelativeDifferenceThreshold;
- (float)minCropSize;
- (float)subjectHeightPaddingMultiplier;
- (float)subjectWidthPaddingMultiplier;
- (float)topMarginFractionRelaxed;
- (float)topMarginFractionTight;
- (float)widthPaddingAdditive;
- (float)widthPaddingMultiplierNoFocusRelaxed;
- (float)widthPaddingMultiplierNoFocusTight;
- (id)asDictionary;
- (void)_initializeWithPlist:(id)a3;
- (void)setDeadbandHeightFractionOfScreenHeight:(float)a3;
- (void)setDeadbandTopOffsetFractionOfScreenHeight:(float)a3;
- (void)setDeadbandWidthFractionOfScreenWidth:(float)a3;
- (void)setDeadbandWidthMaxFraction:(float)a3;
- (void)setDeadbandWidthMinFraction:(float)a3;
- (void)setHorizontalMinAbsoluteDifferenceThreshold:(float)a3;
- (void)setHorizontalMinRelativeDifferenceThreshold:(float)a3;
- (void)setMinCropSize:(float)a3;
- (void)setSubjectHeightPaddingMultiplier:(float)a3;
- (void)setSubjectWidthPaddingMultiplier:(float)a3;
- (void)setTopMarginFractionRelaxed:(float)a3;
- (void)setTopMarginFractionTight:(float)a3;
- (void)setWidthPaddingAdditive:(float)a3;
- (void)setWidthPaddingMultiplierNoFocusRelaxed:(float)a3;
- (void)setWidthPaddingMultiplierNoFocusTight:(float)a3;
@end

@implementation CinematicFramingSessionFramingParameters

- (CinematicFramingSessionFramingParameters)initWithPlist:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CinematicFramingSessionFramingParameters;
  v5 = [(CinematicFramingSessionFramingParameters *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(CinematicFramingSessionFramingParameters *)v5 _initializeWithPlist:v4];
    v7 = v6;
  }

  return v6;
}

- (CinematicFramingSessionFramingParameters)initWithPlistPath:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CinematicFramingSessionFramingParameters;
  v5 = [(CinematicFramingSessionFramingParameters *)&v8 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
    v5 = [(CinematicFramingSessionFramingParameters *)v5 initWithPlist:v6];
  }
  return v5;
}

- (id)asDictionary
{
  v36[15] = *MEMORY[0x1E4F143B8];
  v35[0] = @"horizontalMinAbsoluteDifferenceThreshold";
  v3 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self horizontalMinAbsoluteDifferenceThreshold];
  v34 = objc_msgSend(v3, "numberWithFloat:");
  v36[0] = v34;
  v35[1] = @"horizontalMinRelativeDifferenceThreshold";
  id v4 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self horizontalMinRelativeDifferenceThreshold];
  v33 = objc_msgSend(v4, "numberWithFloat:");
  v36[1] = v33;
  v35[2] = @"widthPaddingMultiplierNoFocusTight";
  v5 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self widthPaddingMultiplierNoFocusTight];
  v32 = objc_msgSend(v5, "numberWithFloat:");
  v36[2] = v32;
  v35[3] = @"widthPaddingMultiplierNoFocusRelaxed";
  v6 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self widthPaddingMultiplierNoFocusRelaxed];
  v31 = objc_msgSend(v6, "numberWithFloat:");
  v36[3] = v31;
  v35[4] = @"widthPaddingAdditive";
  v7 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self widthPaddingAdditive];
  v30 = objc_msgSend(v7, "numberWithFloat:");
  v36[4] = v30;
  v35[5] = @"topMarginFractionTight";
  objc_super v8 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self topMarginFractionTight];
  v29 = objc_msgSend(v8, "numberWithFloat:");
  v36[5] = v29;
  v35[6] = @"topMarginFractionRelaxed";
  objc_super v9 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self topMarginFractionRelaxed];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  v36[6] = v10;
  v35[7] = @"minCropSize";
  v11 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self minCropSize];
  v12 = objc_msgSend(v11, "numberWithFloat:");
  v36[7] = v12;
  v35[8] = @"deadbandWidthMinFraction";
  v13 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self deadbandWidthMinFraction];
  v14 = objc_msgSend(v13, "numberWithFloat:");
  v36[8] = v14;
  v35[9] = @"deadbandWidthMaxFraction";
  v15 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self deadbandWidthMaxFraction];
  v16 = objc_msgSend(v15, "numberWithFloat:");
  v36[9] = v16;
  v35[10] = @"deadbandWidthFractionOfScreenWidth";
  v17 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self deadbandWidthFractionOfScreenWidth];
  v18 = objc_msgSend(v17, "numberWithFloat:");
  v36[10] = v18;
  v35[11] = @"deadbandHeightFractionOfScreenHeight";
  v19 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self deadbandHeightFractionOfScreenHeight];
  v20 = objc_msgSend(v19, "numberWithFloat:");
  v36[11] = v20;
  v35[12] = @"deadbandTopOffsetFractionOfScreenHeight";
  v21 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self deadbandTopOffsetFractionOfScreenHeight];
  v22 = objc_msgSend(v21, "numberWithFloat:");
  v36[12] = v22;
  v35[13] = @"subjectWidthPaddingMultiplier";
  v23 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self subjectWidthPaddingMultiplier];
  v24 = objc_msgSend(v23, "numberWithFloat:");
  v36[13] = v24;
  v35[14] = @"subjectHeightPaddingMultiplier";
  v25 = NSNumber;
  [(CinematicFramingSessionFramingParameters *)self subjectHeightPaddingMultiplier];
  v26 = objc_msgSend(v25, "numberWithFloat:");
  v36[14] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:15];

  return v27;
}

- (void)_initializeWithPlist:(id)a3
{
  id v4 = a3;
  *(float *)&double v5 = PlistReadFloat(v4, @"horizontalMinAbsoluteDifferenceThreshold", 0.0);
  [(CinematicFramingSessionFramingParameters *)self setHorizontalMinAbsoluteDifferenceThreshold:v5];
  *(float *)&double v6 = PlistReadFloat(v4, @"horizontalMinRelativeDifferenceThreshold", 0.0);
  [(CinematicFramingSessionFramingParameters *)self setHorizontalMinRelativeDifferenceThreshold:v6];
  *(float *)&double v7 = PlistReadFloat(v4, @"widthPaddingMultiplierNoFocusTight", 0.0);
  [(CinematicFramingSessionFramingParameters *)self setWidthPaddingMultiplierNoFocusTight:v7];
  *(float *)&double v8 = PlistReadFloat(v4, @"widthPaddingMultiplierNoFocusRelaxed", 0.0);
  [(CinematicFramingSessionFramingParameters *)self setWidthPaddingMultiplierNoFocusRelaxed:v8];
  *(float *)&double v9 = PlistReadFloat(v4, @"widthPaddingAdditive", 0.0);
  [(CinematicFramingSessionFramingParameters *)self setWidthPaddingAdditive:v9];
  *(float *)&double v10 = PlistReadFloat(v4, @"topMarginFractionTight", 0.0);
  [(CinematicFramingSessionFramingParameters *)self setTopMarginFractionTight:v10];
  *(float *)&double v11 = PlistReadFloat(v4, @"topMarginFractionRelaxed", 0.0);
  [(CinematicFramingSessionFramingParameters *)self setTopMarginFractionRelaxed:v11];
  *(float *)&double v12 = PlistReadFloat(v4, @"minCropSize", 0.0);
  [(CinematicFramingSessionFramingParameters *)self setMinCropSize:v12];
  *(float *)&double v13 = PlistReadFloat(v4, @"deadbandWidthMinFraction", 0.8);
  [(CinematicFramingSessionFramingParameters *)self setDeadbandWidthMinFraction:v13];
  *(float *)&double v14 = PlistReadFloat(v4, @"deadbandWidthMaxFraction", 1.2);
  [(CinematicFramingSessionFramingParameters *)self setDeadbandWidthMaxFraction:v14];
  *(float *)&double v15 = PlistReadFloat(v4, @"deadbandWidthFractionOfScreenWidth", 0.7);
  [(CinematicFramingSessionFramingParameters *)self setDeadbandWidthFractionOfScreenWidth:v15];
  *(float *)&double v16 = PlistReadFloat(v4, @"deadbandHeightFractionOfScreenHeight", 0.5);
  [(CinematicFramingSessionFramingParameters *)self setDeadbandHeightFractionOfScreenHeight:v16];
  *(float *)&double v17 = PlistReadFloat(v4, @"deadbandTopOffsetFractionOfScreenHeight", 0.1);
  [(CinematicFramingSessionFramingParameters *)self setDeadbandTopOffsetFractionOfScreenHeight:v17];
  *(float *)&double v18 = PlistReadFloat(v4, @"subjectWidthPaddingMultiplier", 1.0);
  [(CinematicFramingSessionFramingParameters *)self setSubjectWidthPaddingMultiplier:v18];
  float Float = PlistReadFloat(v4, @"subjectHeightPaddingMultiplier", 1.0);

  *(float *)&double v20 = Float;

  [(CinematicFramingSessionFramingParameters *)self setSubjectHeightPaddingMultiplier:v20];
}

- (float)horizontalMinAbsoluteDifferenceThreshold
{
  return self->horizontalMinAbsoluteDifferenceThreshold;
}

- (void)setHorizontalMinAbsoluteDifferenceThreshold:(float)a3
{
  self->horizontalMinAbsoluteDifferenceThreshold = a3;
}

- (float)horizontalMinRelativeDifferenceThreshold
{
  return self->horizontalMinRelativeDifferenceThreshold;
}

- (void)setHorizontalMinRelativeDifferenceThreshold:(float)a3
{
  self->horizontalMinRelativeDifferenceThreshold = a3;
}

- (float)widthPaddingMultiplierNoFocusTight
{
  return self->widthPaddingMultiplierNoFocusTight;
}

- (void)setWidthPaddingMultiplierNoFocusTight:(float)a3
{
  self->widthPaddingMultiplierNoFocusTight = a3;
}

- (float)widthPaddingMultiplierNoFocusRelaxed
{
  return self->widthPaddingMultiplierNoFocusRelaxed;
}

- (void)setWidthPaddingMultiplierNoFocusRelaxed:(float)a3
{
  self->widthPaddingMultiplierNoFocusRelaxed = a3;
}

- (float)widthPaddingAdditive
{
  return self->widthPaddingAdditive;
}

- (void)setWidthPaddingAdditive:(float)a3
{
  self->widthPaddingAdditive = a3;
}

- (float)topMarginFractionTight
{
  return self->topMarginFractionTight;
}

- (void)setTopMarginFractionTight:(float)a3
{
  self->topMarginFractionTight = a3;
}

- (float)topMarginFractionRelaxed
{
  return self->topMarginFractionRelaxed;
}

- (void)setTopMarginFractionRelaxed:(float)a3
{
  self->topMarginFractionRelaxed = a3;
}

- (float)minCropSize
{
  return self->minCropSize;
}

- (void)setMinCropSize:(float)a3
{
  self->minCropSize = a3;
}

- (float)deadbandWidthMinFraction
{
  return self->deadbandWidthMinFraction;
}

- (void)setDeadbandWidthMinFraction:(float)a3
{
  self->deadbandWidthMinFraction = a3;
}

- (float)deadbandWidthMaxFraction
{
  return self->deadbandWidthMaxFraction;
}

- (void)setDeadbandWidthMaxFraction:(float)a3
{
  self->deadbandWidthMaxFraction = a3;
}

- (float)deadbandWidthFractionOfScreenWidth
{
  return self->deadbandWidthFractionOfScreenWidth;
}

- (void)setDeadbandWidthFractionOfScreenWidth:(float)a3
{
  self->deadbandWidthFractionOfScreenWidth = a3;
}

- (float)deadbandHeightFractionOfScreenHeight
{
  return self->deadbandHeightFractionOfScreenHeight;
}

- (void)setDeadbandHeightFractionOfScreenHeight:(float)a3
{
  self->deadbandHeightFractionOfScreenHeight = a3;
}

- (float)deadbandTopOffsetFractionOfScreenHeight
{
  return self->deadbandTopOffsetFractionOfScreenHeight;
}

- (void)setDeadbandTopOffsetFractionOfScreenHeight:(float)a3
{
  self->deadbandTopOffsetFractionOfScreenHeight = a3;
}

- (float)subjectWidthPaddingMultiplier
{
  return self->subjectWidthPaddingMultiplier;
}

- (void)setSubjectWidthPaddingMultiplier:(float)a3
{
  self->subjectWidthPaddingMultiplier = a3;
}

- (float)subjectHeightPaddingMultiplier
{
  return self->subjectHeightPaddingMultiplier;
}

- (void)setSubjectHeightPaddingMultiplier:(float)a3
{
  self->subjectHeightPaddingMultiplier = a3;
}

@end