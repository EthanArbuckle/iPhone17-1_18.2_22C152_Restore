@interface ADConfidenceLevelRanges
+ (id)rangesForUnits:(unint64_t)a3 lowLevel:(ADFloatRange)a4 mediumLevel:(ADFloatRange)a5 highLevel:(ADFloatRange)a6;
- (ADFloatRange)highLevel;
- (ADFloatRange)lowLevel;
- (ADFloatRange)mediumLevel;
- (id)createConvertedRangesWithUnits:(unint64_t)a3 operation:(void *)a4;
- (id)initForUnits:(unint64_t)a3 lowLevel:(ADFloatRange)a4 mediumLevel:(ADFloatRange)a5 highLevel:(ADFloatRange)a6;
- (id)rangesForUnits:(unint64_t)a3;
- (unint64_t)confidenceUnits;
- (void)setHighLevel:(ADFloatRange)a3;
- (void)setLowLevel:(ADFloatRange)a3;
- (void)setMediumLevel:(ADFloatRange)a3;
@end

@implementation ADConfidenceLevelRanges

- (unint64_t)confidenceUnits
{
  return self->_confidenceUnits;
}

- (void)setHighLevel:(ADFloatRange)a3
{
  self->_highLevel = a3;
}

- (ADFloatRange)highLevel
{
  float start = self->_highLevel.start;
  float end = self->_highLevel.end;
  result.float end = end;
  result.float start = start;
  return result;
}

- (void)setMediumLevel:(ADFloatRange)a3
{
  self->_mediumLevel = a3;
}

- (ADFloatRange)mediumLevel
{
  float start = self->_mediumLevel.start;
  float end = self->_mediumLevel.end;
  result.float end = end;
  result.float start = start;
  return result;
}

- (void)setLowLevel:(ADFloatRange)a3
{
  self->_lowLevel = a3;
}

- (ADFloatRange)lowLevel
{
  float start = self->_lowLevel.start;
  float end = self->_lowLevel.end;
  result.float end = end;
  result.float start = start;
  return result;
}

- (id)rangesForUnits:(unint64_t)a3
{
  unint64_t confidenceUnits = self->_confidenceUnits;
  if (confidenceUnits == a3)
  {
    *(float *)&double v3 = self->_lowLevel.start;
    *(float *)&double v4 = self->_lowLevel.end;
    *(float *)&double v5 = self->_mediumLevel.start;
    *(float *)&double v6 = self->_mediumLevel.end;
    *(float *)&double v7 = self->_highLevel.start;
    *(float *)&double v8 = self->_highLevel.end;
    v10 = +[ADConfidenceLevelRanges rangesForUnits:lowLevel:mediumLevel:highLevel:](ADConfidenceLevelRanges, "rangesForUnits:lowLevel:mediumLevel:highLevel:", v3, v4, v5, v6, v7, v8);
    goto LABEL_25;
  }
  switch(a3)
  {
    case 3uLL:
      if (confidenceUnits == 2)
      {
        v12 = postProcessingStandardDeviationToLogarithmicVariance;
      }
      else
      {
        if (confidenceUnits) {
          break;
        }
        v12 = postProcessingConfidenceToLogarithmicVariance;
      }
      v14 = v12;
      uint64_t v15 = 3;
      goto LABEL_24;
    case 2uLL:
      if (confidenceUnits == 3)
      {
        v13 = postProcessingLogarithmicVarianceToStd;
      }
      else
      {
        if (confidenceUnits) {
          break;
        }
        v13 = postProcessingConfidenceToStandardDeviation;
      }
      v14 = v13;
      uint64_t v15 = 2;
      goto LABEL_24;
    case 0uLL:
      if (confidenceUnits == 3)
      {
        v11 = postProcessingLogarithmicVarianceToConfidence;
        goto LABEL_19;
      }
      if (confidenceUnits == 2)
      {
        v11 = postProcessingStandardDeviationToConfidence;
LABEL_19:
        v14 = v11;
        uint64_t v15 = 0;
LABEL_24:
        v10 = [(ADConfidenceLevelRanges *)self createConvertedRangesWithUnits:v15 operation:v14];
        goto LABEL_25;
      }
      break;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed converting confidence levels range", v17, 2u);
  }
  v10 = 0;
LABEL_25:
  return v10;
}

- (id)createConvertedRangesWithUnits:(unint64_t)a3 operation:(void *)a4
{
  double v7 = [ADConfidenceLevelRanges alloc];
  float v8 = ((float (*)(uint64_t))a4)([(ADConfidenceLevelRanges *)self lowLevel]);
  float v9 = ((float (*)(uint64_t))a4)([(ADConfidenceLevelRanges *)self lowLevel]);
  float v10 = ((float (*)(uint64_t))a4)([(ADConfidenceLevelRanges *)self mediumLevel]);
  float v11 = ((float (*)(uint64_t))a4)([(ADConfidenceLevelRanges *)self mediumLevel]);
  float v12 = ((float (*)(uint64_t))a4)([(ADConfidenceLevelRanges *)self highLevel]);
  double v13 = ((double (*)(uint64_t))a4)([(ADConfidenceLevelRanges *)self highLevel]);
  LODWORD(v14) = LODWORD(v13);
  *(float *)&double v13 = v8;
  *(float *)&double v15 = v9;
  *(float *)&double v16 = v10;
  *(float *)&double v17 = v11;
  *(float *)&double v18 = v12;
  id v19 = -[ADConfidenceLevelRanges initForUnits:lowLevel:mediumLevel:highLevel:](v7, "initForUnits:lowLevel:mediumLevel:highLevel:", a3, v13, v15, v16, v17, v18, v14);
  return v19;
}

- (id)initForUnits:(unint64_t)a3 lowLevel:(ADFloatRange)a4 mediumLevel:(ADFloatRange)a5 highLevel:(ADFloatRange)a6
{
  float end = a6.end;
  float start = a6.start;
  float v8 = a5.end;
  float v9 = a5.start;
  float v10 = a4.end;
  float v11 = a4.start;
  v18.receiver = self;
  v18.super_class = (Class)ADConfidenceLevelRanges;
  double v13 = [(ADConfidenceLevelRanges *)&v18 init];
  double v14 = v13;
  if (!v13) {
    goto LABEL_7;
  }
  if (a3 != 1)
  {
    v13->_lowLevel.float start = v11;
    v13->_lowLevel.float end = v10;
    v13->_mediumLevel.float start = v9;
    v13->_mediumLevel.float end = v8;
    v13->_highLevel.float start = start;
    v13->_highLevel.float end = end;
    v13->_unint64_t confidenceUnits = a3;
LABEL_7:
    double v15 = v13;
    goto LABEL_8;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v17[0] = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADConfidenceLevelRanges does not support levels confidence units", (uint8_t *)v17, 2u);
  }
  double v15 = 0;
LABEL_8:

  return v15;
}

+ (id)rangesForUnits:(unint64_t)a3 lowLevel:(ADFloatRange)a4 mediumLevel:(ADFloatRange)a5 highLevel:(ADFloatRange)a6
{
  float end = a6.end;
  float start = a6.start;
  float v8 = a5.end;
  float v9 = a5.start;
  float v10 = a4.end;
  float v11 = a4.start;
  double v13 = [ADConfidenceLevelRanges alloc];
  *(float *)&double v14 = v11;
  *(float *)&double v15 = v10;
  *(float *)&double v16 = v9;
  *(float *)&double v17 = v8;
  *(float *)&double v18 = start;
  *(float *)&double v19 = end;
  id v20 = -[ADConfidenceLevelRanges initForUnits:lowLevel:mediumLevel:highLevel:](v13, "initForUnits:lowLevel:mediumLevel:highLevel:", a3, v14, v15, v16, v17, v18, v19);
  return v20;
}

@end