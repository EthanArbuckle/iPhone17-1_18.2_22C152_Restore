@interface CSUSceneNetV5SceneLabelAttributes
- (BOOL)isSearchable;
- (CSUMetricOperatingPointCurve)betaFScoreMaximizingOperatingPointCurve;
- (CSUMetricOperatingPointCurve)precisionOperatingPointCurve;
- (CSUMetricOperatingPointCurve)recallOperatingPointCurve;
- (CSUSceneNetV5SceneLabelAttributes)initWithTaxonomyAttributes:(id)a3 forLabel:(id)a4;
- (NSArray)detectorClasses;
- (NSArray)humanReadableSynonyms;
- (NSString)humanReadableLabel;
- (NSString)label;
- (float)photosSearchThreshold;
- (id)_metricOperatingPointCurveForAttribute:(id)a3 metricPattern:(int)a4;
@end

@implementation CSUSceneNetV5SceneLabelAttributes

- (CSUSceneNetV5SceneLabelAttributes)initWithTaxonomyAttributes:(id)a3 forLabel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSUSceneNetV5SceneLabelAttributes;
  v13 = [(CSUSceneNetV5SceneLabelAttributes *)&v18 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v8, v9, v10, v11, v12);
    label = v13->_label;
    v13->_label = (NSString *)v14;

    objc_storeStrong((id *)&v13->_attributeManager, a3);
    v16 = v13;
  }

  return v13;
}

- (NSArray)detectorClasses
{
  return (NSArray *)objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, @"detectorClasses", (uint64_t)self->_label, MEMORY[0x263EFFA68]);
}

- (NSString)humanReadableLabel
{
  return (NSString *)objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, @"humanReadableLabel", (uint64_t)self->_label, (uint64_t)self->_label);
}

- (NSArray)humanReadableSynonyms
{
  return (NSArray *)objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, @"humanReadableSynonyms", (uint64_t)self->_label, MEMORY[0x263EFFA68]);
}

- (BOOL)isSearchable
{
  v2 = objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, @"isSearchable", (uint64_t)self->_label, 0);
  id v7 = v2;
  if (v2)
  {
    char v8 = objc_msgSend_BOOLValue(v2, v3, v4, v5, v6);

    return v8;
  }
  else
  {

    return 0;
  }
}

- (float)photosSearchThreshold
{
  v2 = objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, @"searchThreshold", (uint64_t)self->_label, 0);
  id v7 = v2;
  if (v2)
  {
    objc_msgSend_floatValue(v2, v3, v4, v5, v6);
    float v9 = v8;

    return v9;
  }
  else
  {

    return NAN;
  }
}

- (id)_metricOperatingPointCurveForAttribute:(id)a3 metricPattern:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, (uint64_t)a3, (uint64_t)self->_label, 0);
  if (v5)
  {
    uint64_t v6 = [CSUMetricOperatingPointCurve alloc];
    id v15 = 0;
    float v8 = objc_msgSend_initWithOperatingPointsData_metricPattern_error_(v6, v7, (uint64_t)v5, v4, (uint64_t)&v15);
    id v12 = v15;
    if (v12)
    {
      objc_msgSend_logInternalError_(CSUError, v9, (uint64_t)v12, v10, v11);
      id v13 = 0;
    }
    else
    {
      id v13 = v8;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (CSUMetricOperatingPointCurve)precisionOperatingPointCurve
{
  return (CSUMetricOperatingPointCurve *)((uint64_t (*)(CSUSceneNetV5SceneLabelAttributes *, char *, __CFString *, void))MEMORY[0x270F9A6D0])(self, sel__metricOperatingPointCurveForAttribute_metricPattern_, @"thresholdsByPrecision", 0);
}

- (CSUMetricOperatingPointCurve)recallOperatingPointCurve
{
  return (CSUMetricOperatingPointCurve *)((uint64_t (*)(CSUSceneNetV5SceneLabelAttributes *, char *, __CFString *, void))MEMORY[0x270F9A6D0])(self, sel__metricOperatingPointCurveForAttribute_metricPattern_, @"thresholdsByRecall", 0);
}

- (CSUMetricOperatingPointCurve)betaFScoreMaximizingOperatingPointCurve
{
  return (CSUMetricOperatingPointCurve *)((uint64_t (*)(CSUSceneNetV5SceneLabelAttributes *, char *, __CFString *, uint64_t))MEMORY[0x270F9A6D0])(self, sel__metricOperatingPointCurveForAttribute_metricPattern_, @"thresholdsByMaxFScore", 1);
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_attributeManager, 0);
}

@end