@interface AXMDataPoint
- (AXMDataPoint)initWithX:(id)a3 y:(id)a4;
- (AXMDataPoint)initWithX:(id)a3 y:(id)a4 additionalValues:(id)a5;
- (AXMDataPoint)initWithX:(id)a3 y:(id)a4 additionalValues:(id)a5 label:(id)a6;
- (AXMDataPointValue)timeEncodingValue;
- (AXMDataPointValue)xValue;
- (AXMDataPointValue)yValue;
- (AXMDataPointValue)zCategoryAxisValue;
- (AXMDataPointValue)zNumericAxisValue;
- (NSArray)additionalValues;
- (NSAttributedString)attributedLabel;
- (NSNumber)durationEncodingValue;
- (NSNumber)pitchEncodingValue;
- (NSNumber)volumeEncodingValue;
- (NSString)label;
- (NSString)timbreEncodingValue;
- (NSString)valueDescription;
- (double)playbackTimeOffsetMS;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAdditionalValues:(id)a3;
- (void)setAttributedLabel:(id)a3;
- (void)setDurationEncodingValue:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPitchEncodingValue:(id)a3;
- (void)setPlaybackTimeOffsetMS:(double)a3;
- (void)setTimbreEncodingValue:(id)a3;
- (void)setTimeEncodingValue:(id)a3;
- (void)setValueDescription:(id)a3;
- (void)setVolumeEncodingValue:(id)a3;
- (void)setXValue:(id)a3;
- (void)setYValue:(id)a3;
@end

@implementation AXMDataPoint

- (AXMDataPoint)initWithX:(id)a3 y:(id)a4
{
  return [(AXMDataPoint *)self initWithX:a3 y:a4 additionalValues:0 label:0];
}

- (AXMDataPoint)initWithX:(id)a3 y:(id)a4 additionalValues:(id)a5
{
  return [(AXMDataPoint *)self initWithX:a3 y:a4 additionalValues:a5 label:0];
}

- (AXMDataPoint)initWithX:(id)a3 y:(id)a4 additionalValues:(id)a5 label:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AXMDataPoint;
  v15 = [(AXMDataPoint *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_xValue, a3);
    objc_storeStrong((id *)&v16->_yValue, a4);
    uint64_t v17 = [v13 copy];
    additionalValues = v16->_additionalValues;
    v16->_additionalValues = (NSArray *)v17;

    [(AXMDataPoint *)v16 setLabel:v14];
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[AXMDataPoint allocWithZone:a3];
  v5 = [(AXMDataPoint *)self xValue];
  v6 = [(AXMDataPoint *)self yValue];
  v7 = [(AXMDataPoint *)self additionalValues];
  v8 = [(AXMDataPoint *)self label];
  v9 = [(AXMDataPoint *)v4 initWithX:v5 y:v6 additionalValues:v7 label:v8];

  return v9;
}

- (void)setLabel:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v4 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
    attributedLabel = self->_attributedLabel;
    self->_attributedLabel = v4;
  }
  else
  {
    attributedLabel = self->_attributedLabel;
    self->_attributedLabel = 0;
  }
}

- (AXMDataPointValue)zCategoryAxisValue
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(AXMDataPoint *)self additionalValues];
  id v3 = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        v7 = [v6 category];

        if (v7)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (AXMDataPointValue *)v3;
}

- (AXMDataPointValue)zNumericAxisValue
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(AXMDataPoint *)self additionalValues];
  id v3 = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        v7 = [v6 category];

        if (!v7)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (AXMDataPointValue *)v3;
}

- (NSString)label
{
  v2 = [(AXMDataPoint *)self attributedLabel];
  id v3 = [v2 string];

  return (NSString *)v3;
}

- (id)description
{
  id v3 = [(AXMDataPoint *)self xValue];
  uint64_t v4 = [v3 category];
  if (v4)
  {
    v5 = [(AXMDataPoint *)self xValue];
    [v5 category];
  }
  else
  {
    id v6 = NSNumber;
    v5 = [(AXMDataPoint *)self xValue];
    [v5 number];
    objc_msgSend(v6, "numberWithDouble:");
  v29 = };

  v7 = [(AXMDataPoint *)self additionalValues];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    long long v10 = &stru_1F0E72D10;
    do
    {
      long long v11 = [(AXMDataPoint *)self additionalValues];
      long long v12 = [v11 objectAtIndexedSubscript:v9];
      id v13 = [v12 category];
      if (v13)
      {
        uint64_t v14 = [(AXMDataPoint *)self additionalValues];
        v15 = [v14 objectAtIndexedSubscript:v9];
        [v15 category];
      }
      else
      {
        v16 = NSNumber;
        uint64_t v14 = [(AXMDataPoint *)self additionalValues];
        v15 = [v14 objectAtIndexedSubscript:v9];
        [v15 number];
        objc_msgSend(v16, "numberWithDouble:");
      uint64_t v17 = };

      v18 = [NSString stringWithFormat:@"%@%@\t", v10, v17];

      ++v9;
      v19 = [(AXMDataPoint *)self additionalValues];
      unint64_t v20 = [v19 count];

      long long v10 = v18;
    }
    while (v9 < v20);
  }
  else
  {
    v18 = &stru_1F0E72D10;
  }
  v21 = NSString;
  v22 = NSNumber;
  v23 = [(AXMDataPoint *)self yValue];
  [v23 number];
  v24 = objc_msgSend(v22, "numberWithDouble:");
  v25 = [(AXMDataPoint *)self label];
  v26 = [(AXMDataPoint *)self valueDescription];
  v27 = [v21 stringWithFormat:@"(%@\t%@\t%@\tlabel=%@\tdesc=%@)", v29, v24, v18, v25, v26];

  return v27;
}

- (AXMDataPointValue)timeEncodingValue
{
  timeEncodingValue = self->_timeEncodingValue;
  if (timeEncodingValue)
  {
    id v3 = timeEncodingValue;
  }
  else
  {
    v5 = [(AXMDataPoint *)self xValue];
    id v6 = [v5 category];
    v7 = [(AXMDataPoint *)self xValue];
    uint64_t v8 = v7;
    if (v6)
    {
      unint64_t v9 = [v7 category];
      id v3 = +[AXMDataPointValue valueWithCategory:v9];
    }
    else
    {
      [v7 number];
      +[AXMDataPointValue valueWithNumber:](AXMDataPointValue, "valueWithNumber:");
      id v3 = (AXMDataPointValue *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v3;
}

- (NSNumber)pitchEncodingValue
{
  pitchEncodingValue = self->_pitchEncodingValue;
  if (pitchEncodingValue)
  {
    id v3 = pitchEncodingValue;
  }
  else
  {
    uint64_t v4 = NSNumber;
    v5 = [(AXMDataPoint *)self yValue];
    [v5 number];
    objc_msgSend(v4, "numberWithDouble:");
    id v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (NSNumber)durationEncodingValue
{
  durationEncodingValue = self->_durationEncodingValue;
  if (durationEncodingValue)
  {
    id v3 = durationEncodingValue;
  }
  else
  {
    uint64_t v4 = NSNumber;
    v5 = [(AXMDataPoint *)self zNumericAxisValue];
    [v5 number];
    objc_msgSend(v4, "numberWithDouble:");
    id v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (NSNumber)volumeEncodingValue
{
  volumeEncodingValue = self->_volumeEncodingValue;
  if (volumeEncodingValue)
  {
    id v3 = volumeEncodingValue;
  }
  else
  {
    uint64_t v4 = NSNumber;
    v5 = [(AXMDataPoint *)self zNumericAxisValue];
    [v5 number];
    objc_msgSend(v4, "numberWithDouble:");
    id v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (NSString)timbreEncodingValue
{
  timbreEncodingValue = self->_timbreEncodingValue;
  if (timbreEncodingValue)
  {
    id v3 = timbreEncodingValue;
  }
  else
  {
    uint64_t v4 = [(AXMDataPoint *)self zCategoryAxisValue];
    id v3 = [v4 category];
  }

  return v3;
}

- (AXMDataPointValue)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
}

- (AXMDataPointValue)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
}

- (NSArray)additionalValues
{
  return self->_additionalValues;
}

- (void)setAdditionalValues:(id)a3
{
}

- (NSAttributedString)attributedLabel
{
  return self->_attributedLabel;
}

- (void)setAttributedLabel:(id)a3
{
}

- (NSString)valueDescription
{
  return self->_valueDescription;
}

- (void)setValueDescription:(id)a3
{
}

- (void)setTimeEncodingValue:(id)a3
{
}

- (void)setPitchEncodingValue:(id)a3
{
}

- (void)setVolumeEncodingValue:(id)a3
{
}

- (void)setDurationEncodingValue:(id)a3
{
}

- (void)setTimbreEncodingValue:(id)a3
{
}

- (double)playbackTimeOffsetMS
{
  return self->_playbackTimeOffsetMS;
}

- (void)setPlaybackTimeOffsetMS:(double)a3
{
  self->_playbackTimeOffsetMS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timbreEncodingValue, 0);
  objc_storeStrong((id *)&self->_durationEncodingValue, 0);
  objc_storeStrong((id *)&self->_volumeEncodingValue, 0);
  objc_storeStrong((id *)&self->_pitchEncodingValue, 0);
  objc_storeStrong((id *)&self->_timeEncodingValue, 0);
  objc_storeStrong((id *)&self->_valueDescription, 0);
  objc_storeStrong((id *)&self->_attributedLabel, 0);
  objc_storeStrong((id *)&self->_additionalValues, 0);
  objc_storeStrong((id *)&self->_yValue, 0);

  objc_storeStrong((id *)&self->_xValue, 0);
}

@end