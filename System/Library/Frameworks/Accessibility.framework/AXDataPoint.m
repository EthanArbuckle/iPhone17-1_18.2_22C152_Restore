@interface AXDataPoint
- (AXDataPoint)initWithX:(AXDataPointValue *)xValue y:(AXDataPointValue *)yValue;
- (AXDataPoint)initWithX:(AXDataPointValue *)xValue y:(AXDataPointValue *)yValue additionalValues:(NSArray *)additionalValues;
- (AXDataPoint)initWithX:(AXDataPointValue *)xValue y:(AXDataPointValue *)yValue additionalValues:(NSArray *)additionalValues label:(NSString *)label;
- (AXDataPointValue)xValue;
- (AXDataPointValue)yValue;
- (NSArray)additionalValues;
- (NSAttributedString)attributedLabel;
- (NSNumber)durationEncodingValue;
- (NSNumber)pitchEncodingValue;
- (NSNumber)timeEncodingValue;
- (NSNumber)volumeEncodingValue;
- (NSString)categoryEncodingValue;
- (NSString)label;
- (NSString)valueDescription;
- (id)_additionalCategoricalValue;
- (id)_additionalNumericValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAdditionalValues:(NSArray *)additionalValues;
- (void)setAttributedLabel:(NSAttributedString *)attributedLabel;
- (void)setCategoryEncodingValue:(id)a3;
- (void)setDurationEncodingValue:(id)a3;
- (void)setLabel:(NSString *)label;
- (void)setPitchEncodingValue:(id)a3;
- (void)setTimeEncodingValue:(id)a3;
- (void)setValueDescription:(id)a3;
- (void)setVolumeEncodingValue:(id)a3;
- (void)setXValue:(AXDataPointValue *)xValue;
- (void)setYValue:(AXDataPointValue *)yValue;
@end

@implementation AXDataPoint

- (AXDataPoint)initWithX:(AXDataPointValue *)xValue y:(AXDataPointValue *)yValue
{
  return [(AXDataPoint *)self initWithX:xValue y:yValue additionalValues:0 label:0];
}

- (AXDataPoint)initWithX:(AXDataPointValue *)xValue y:(AXDataPointValue *)yValue additionalValues:(NSArray *)additionalValues
{
  return [(AXDataPoint *)self initWithX:xValue y:yValue additionalValues:additionalValues label:0];
}

- (AXDataPoint)initWithX:(AXDataPointValue *)xValue y:(AXDataPointValue *)yValue additionalValues:(NSArray *)additionalValues label:(NSString *)label
{
  v11 = xValue;
  v12 = yValue;
  v13 = additionalValues;
  v14 = label;
  v20.receiver = self;
  v20.super_class = (Class)AXDataPoint;
  v15 = [(AXDataPoint *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_xValue, xValue);
    objc_storeStrong((id *)&v16->_yValue, yValue);
    uint64_t v17 = [(NSArray *)v13 copy];
    v18 = v16->_additionalValues;
    v16->_additionalValues = (NSArray *)v17;

    [(AXDataPoint *)v16 setLabel:v14];
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[AXDataPoint allocWithZone:a3];
  v5 = [(AXDataPoint *)self xValue];
  v6 = [(AXDataPoint *)self yValue];
  v7 = [(AXDataPoint *)self additionalValues];
  v8 = [(AXDataPoint *)self label];
  v9 = [(AXDataPoint *)v4 initWithX:v5 y:v6 additionalValues:v7 label:v8];

  return v9;
}

- (void)setLabel:(NSString *)label
{
  v6 = label;
  if (v6)
  {
    v4 = (NSAttributedString *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6];
    attributedLabel = self->_attributedLabel;
    self->_attributedLabel = v4;
  }
  else
  {
    attributedLabel = self->_attributedLabel;
    self->_attributedLabel = 0;
  }
}

- (NSString)label
{
  v2 = [(AXDataPoint *)self attributedLabel];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (id)description
{
  v3 = [(AXDataPoint *)self xValue];
  v4 = [v3 category];
  if (v4)
  {
    v5 = [(AXDataPoint *)self xValue];
    [v5 category];
  }
  else
  {
    v6 = NSNumber;
    v5 = [(AXDataPoint *)self xValue];
    [v5 number];
    objc_msgSend(v6, "numberWithDouble:");
  v30 = };

  v7 = [(AXDataPoint *)self additionalValues];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = [(AXDataPoint *)self additionalValues];
      v13 = [v12 objectAtIndexedSubscript:v9];
      v14 = [v13 category];

      if (v14)
      {
        v15 = [(AXDataPoint *)self additionalValues];
        v16 = [v15 objectAtIndexedSubscript:v9];
        [v16 category];
        v10 = uint64_t v17 = v10;
      }
      else
      {
        v18 = NSString;
        v19 = NSNumber;
        v15 = [(AXDataPoint *)self additionalValues];
        v16 = [v15 objectAtIndexedSubscript:v9];
        [v16 number];
        uint64_t v17 = objc_msgSend(v19, "numberWithDouble:");
        uint64_t v20 = [v18 stringWithFormat:@"%@", v17];

        v11 = (void *)v20;
      }

      ++v9;
      v21 = [(AXDataPoint *)self additionalValues];
      unint64_t v22 = [v21 count];
    }
    while (v9 < v22);
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  v23 = NSString;
  v24 = NSNumber;
  v25 = [(AXDataPoint *)self yValue];
  [v25 number];
  v26 = objc_msgSend(v24, "numberWithDouble:");
  v27 = [(AXDataPoint *)self label];
  v28 = [v23 stringWithFormat:@"(x=%@\ty=%@\tz=%@\tcategory=%@\tlabel=%@)", v30, v26, v11, v10, v27];

  return v28;
}

- (id)_additionalCategoricalValue
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(AXDataPoint *)self additionalValues];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "category", (void)v10);
        uint64_t v8 = [v7 length];

        if (v8)
        {
          v3 = [v6 category];
          goto LABEL_11;
        }
      }
      v3 = (void *)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_additionalNumericValue
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(AXDataPoint *)self additionalValues];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "category", (void)v11);
        uint64_t v8 = [v7 length];

        if (!v8)
        {
          unint64_t v9 = NSNumber;
          [v6 number];
          v3 = objc_msgSend(v9, "numberWithDouble:");
          goto LABEL_11;
        }
      }
      v3 = (void *)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (AXDataPointValue)xValue
{
  return self->_xValue;
}

- (void)setXValue:(AXDataPointValue *)xValue
{
}

- (AXDataPointValue)yValue
{
  return self->_yValue;
}

- (void)setYValue:(AXDataPointValue *)yValue
{
}

- (NSArray)additionalValues
{
  return self->_additionalValues;
}

- (void)setAdditionalValues:(NSArray *)additionalValues
{
}

- (NSAttributedString)attributedLabel
{
  return self->_attributedLabel;
}

- (void)setAttributedLabel:(NSAttributedString *)attributedLabel
{
}

- (NSNumber)timeEncodingValue
{
  return self->_timeEncodingValue;
}

- (void)setTimeEncodingValue:(id)a3
{
}

- (NSNumber)pitchEncodingValue
{
  return self->_pitchEncodingValue;
}

- (void)setPitchEncodingValue:(id)a3
{
}

- (NSNumber)volumeEncodingValue
{
  return self->_volumeEncodingValue;
}

- (void)setVolumeEncodingValue:(id)a3
{
}

- (NSNumber)durationEncodingValue
{
  return self->_durationEncodingValue;
}

- (void)setDurationEncodingValue:(id)a3
{
}

- (NSString)categoryEncodingValue
{
  return self->_categoryEncodingValue;
}

- (void)setCategoryEncodingValue:(id)a3
{
}

- (NSString)valueDescription
{
  return self->_valueDescription;
}

- (void)setValueDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueDescription, 0);
  objc_storeStrong((id *)&self->_categoryEncodingValue, 0);
  objc_storeStrong((id *)&self->_durationEncodingValue, 0);
  objc_storeStrong((id *)&self->_volumeEncodingValue, 0);
  objc_storeStrong((id *)&self->_pitchEncodingValue, 0);
  objc_storeStrong((id *)&self->_timeEncodingValue, 0);
  objc_storeStrong((id *)&self->_attributedLabel, 0);
  objc_storeStrong((id *)&self->_additionalValues, 0);
  objc_storeStrong((id *)&self->_yValue, 0);

  objc_storeStrong((id *)&self->_xValue, 0);
}

@end