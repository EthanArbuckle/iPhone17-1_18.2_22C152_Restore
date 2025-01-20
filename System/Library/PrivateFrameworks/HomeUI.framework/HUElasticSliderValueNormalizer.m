@interface HUElasticSliderValueNormalizer
- ($F24F406B2B787EFB06265DBA3D28CBD5)currentValueRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizeRange:(id)a3;
- (BOOL)hasSecondaryValue;
- (HFNumberValueConstraints)maxValueConstraints;
- (HFNumberValueConstraints)minValueConstraints;
- (HUElasticSliderValueNormalizationOptions)options;
- (HUElasticSliderValueNormalizer)initWithCurrentValueRange:(id)a3 hasSecondaryValue:(BOOL)a4;
- (double)_rubberBandValue:(double)a3 ofType:(unint64_t)a4;
- (double)normalizeValue:(double)a3 ofType:(unint64_t)a4;
- (id)_effectiveConstraintsForValueOfType:(unint64_t)a3 boundRange:(BOOL)a4;
- (id)_originalConstraintsForValueType:(unint64_t)a3;
- (void)setCurrentValueRange:(id)a3;
- (void)setHasSecondaryValue:(BOOL)a3;
- (void)setMaxValueConstraints:(id)a3;
- (void)setMinValueConstraints:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation HUElasticSliderValueNormalizer

- (HUElasticSliderValueNormalizer)initWithCurrentValueRange:(id)a3 hasSecondaryValue:(BOOL)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v12.receiver = self;
  v12.super_class = (Class)HUElasticSliderValueNormalizer;
  v7 = [(HUElasticSliderValueNormalizer *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_currentValueRange.minimum = var0;
    v7->_currentValueRange.maximum = var1;
    v7->_hasSecondaryValue = a4;
    v9 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
    options = v8->_options;
    v8->_options = v9;
  }
  return v8;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizeRange:(id)a3
{
  double var1 = a3.var1;
  [(HUElasticSliderValueNormalizer *)self normalizeValue:1 ofType:a3.var0];
  double v6 = v5;
  [(HUElasticSliderValueNormalizer *)self normalizeValue:2 ofType:var1];
  double v8 = v7;
  double v9 = v6;
  result.double var1 = v8;
  result.double var0 = v9;
  return result;
}

- (double)normalizeValue:(double)a3 ofType:(unint64_t)a4
{
  double v7 = [(HUElasticSliderValueNormalizer *)self options];
  uint64_t v8 = [v7 boundingStrategy];

  if (v8 == 2)
  {
    [(HUElasticSliderValueNormalizer *)self _rubberBandValue:a4 ofType:a3];
    a3 = v9;
  }
  v10 = [(HUElasticSliderValueNormalizer *)self options];
  BOOL v11 = [v10 boundingStrategy] == 1;

  objc_super v12 = [(HUElasticSliderValueNormalizer *)self _effectiveConstraintsForValueOfType:a4 boundRange:v11];
  v13 = [NSNumber numberWithDouble:a3];
  v14 = [v12 normalizedValueForValue:v13];
  [v14 doubleValue];
  double v16 = v15;

  return v16;
}

- (double)_rubberBandValue:(double)a3 ofType:(unint64_t)a4
{
  if (![(HUElasticSliderValueNormalizer *)self hasSecondaryValue]) {
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    double v7 = 0.0625;
    double v8 = 0.02;
    goto LABEL_7;
  }
  if (a4 == 2)
  {
    double v7 = 0.02;
    double v8 = 0.0625;
  }
  else
  {
LABEL_5:
    double v8 = 0.0625;
    double v7 = 0.0625;
  }
LABEL_7:
  double v9 = [(HUElasticSliderValueNormalizer *)self _effectiveConstraintsForValueOfType:a4 boundRange:1];
  v10 = [v9 minValue];
  [v10 doubleValue];
  double v12 = v11;
  v13 = [v9 maxValue];
  [v13 doubleValue];
  double v15 = v14;

  double v16 = HURubberBandedValue(a3, v12, v15, v12 - v7, v8 + v15);
  return v16;
}

- (id)_effectiveConstraintsForValueOfType:(unint64_t)a3 boundRange:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = -[HUElasticSliderValueNormalizer _originalConstraintsForValueType:](self, "_originalConstraintsForValueType:");
  if (v4)
  {
    [(HUElasticSliderValueNormalizer *)self currentValueRange];
    double v9 = v8;
    double v11 = v10;
    if ([(HUElasticSliderValueNormalizer *)self hasSecondaryValue])
    {
      double v12 = [(HUElasticSliderValueNormalizer *)self options];
      int v13 = [v12 applyMinimumVisualRangeSpan];

      if (v13)
      {
        double v14 = v9 + (v11 - v9) * 0.5;
        double v9 = v14 + 0.04;
        double v11 = v14 + -0.04;
      }
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __81__HUElasticSliderValueNormalizer__effectiveConstraintsForValueOfType_boundRange___block_invoke;
    v23[3] = &__block_descriptor_56_e20___HFNumberRange_8__0l;
    v23[4] = a3;
    *(double *)&v23[5] = v9;
    *(double *)&v23[6] = v11;
    double v15 = __81__HUElasticSliderValueNormalizer__effectiveConstraintsForValueOfType_boundRange___block_invoke((uint64_t)v23);
    double v16 = [v7 validRange];

    if (v16)
    {
      v17 = [v7 validRange];
      uint64_t v18 = [v15 intersectRange:v17];

      double v15 = (void *)v18;
    }
  }
  else
  {
    double v15 = 0;
  }
  v19 = [(HUElasticSliderValueNormalizer *)self options];
  if ([v19 applyStepValue])
  {
    v20 = [v7 stepValue];
  }
  else
  {
    v20 = 0;
  }

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F69370]) initWithValidRange:v15 stepValue:v20];

  return v21;
}

id __81__HUElasticSliderValueNormalizer__effectiveConstraintsForValueOfType_boundRange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (v2 == 2)
    {
      double v8 = (void *)MEMORY[0x1E4F69368];
      BOOL v4 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      double v7 = &unk_1F19B4F40;
      double v6 = v8;
      double v5 = v4;
    }
    else
    {
      if (v2 != 1) {
        goto LABEL_8;
      }
      v3 = (void *)MEMORY[0x1E4F69368];
      BOOL v4 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      double v5 = &unk_1F19B4F28;
      double v6 = v3;
      double v7 = v4;
    }
    v1 = [v6 rangeWithMaxValue:v7 minValue:v5];
  }
  else
  {
    v1 = objc_msgSend(MEMORY[0x1E4F69368], "rangeWithFloatRange:", 0.0, 1.0);
  }
LABEL_8:

  return v1;
}

- (id)_originalConstraintsForValueType:(unint64_t)a3
{
  if (a3 == 2)
  {
    v3 = [(HUElasticSliderValueNormalizer *)self maxValueConstraints];
  }
  else if (a3 == 1)
  {
    v3 = [(HUElasticSliderValueNormalizer *)self minValueConstraints];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (HFNumberValueConstraints)minValueConstraints
{
  return self->_minValueConstraints;
}

- (void)setMinValueConstraints:(id)a3
{
}

- (HFNumberValueConstraints)maxValueConstraints
{
  return self->_maxValueConstraints;
}

- (void)setMaxValueConstraints:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)currentValueRange
{
  double minimum = self->_currentValueRange.minimum;
  double maximum = self->_currentValueRange.maximum;
  result.double var1 = maximum;
  result.double var0 = minimum;
  return result;
}

- (void)setCurrentValueRange:(id)a3
{
  self->_currentValueRange = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (BOOL)hasSecondaryValue
{
  return self->_hasSecondaryValue;
}

- (void)setHasSecondaryValue:(BOOL)a3
{
  self->_hasSecondaryValue = a3;
}

- (HUElasticSliderValueNormalizationOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_maxValueConstraints, 0);

  objc_storeStrong((id *)&self->_minValueConstraints, 0);
}

@end