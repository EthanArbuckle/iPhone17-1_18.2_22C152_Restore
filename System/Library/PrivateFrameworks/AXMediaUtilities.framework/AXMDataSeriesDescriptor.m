@interface AXMDataSeriesDescriptor
- (AXMDataSeriesDescriptor)initWithAttributedName:(id)a3 isContinuous:(BOOL)a4 dataPoints:(id)a5;
- (AXMDataSeriesDescriptor)initWithDictionary:(id)a3;
- (AXMDataSeriesDescriptor)initWithName:(id)a3 isContinuous:(BOOL)a4 dataPoints:(id)a5;
- (AXMDataSummary)dataSummary;
- (BOOL)isContinuous;
- (NSArray)additionalCategoricalValues;
- (NSArray)additionalNumericalValues;
- (NSArray)dataPoints;
- (NSArray)xValues;
- (NSArray)yValues;
- (NSAttributedString)attributedName;
- (NSString)description;
- (NSString)meanValueDescription;
- (NSString)name;
- (double)maximumDataValueOnTimeAxis;
- (double)minimumDataValueOnTimeAxis;
- (id)_mutableArrayOfNSNullWithCount:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)numericalValuesFromDataPointValues:(id)a3;
- (void)_commonInitWithContinuous:(BOOL)a3 dataPoints:(id)a4;
- (void)setAttributedName:(id)a3;
- (void)setDataPoints:(id)a3;
- (void)setDataSummary:(id)a3;
- (void)setIsContinuous:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation AXMDataSeriesDescriptor

- (AXMDataSeriesDescriptor)initWithName:(id)a3 isContinuous:(BOOL)a4 dataPoints:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AXMDataSeriesDescriptor;
  v10 = [(AXMDataSeriesDescriptor *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(AXMDataSeriesDescriptor *)v10 setName:v8];
    [(AXMDataSeriesDescriptor *)v11 _commonInitWithContinuous:v6 dataPoints:v9];
  }

  return v11;
}

- (AXMDataSeriesDescriptor)initWithAttributedName:(id)a3 isContinuous:(BOOL)a4 dataPoints:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AXMDataSeriesDescriptor;
  v11 = [(AXMDataSeriesDescriptor *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_attributedName, a3);
    [(AXMDataSeriesDescriptor *)v12 _commonInitWithContinuous:v6 dataPoints:v10];
  }

  return v12;
}

- (AXMDataSeriesDescriptor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"kAXMChartSeriesNameKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
  }
  v7 = v6;
  id v8 = [v4 objectForKeyedSubscript:@"kAXMChartSeriesContinuousKey"];
  unsigned int v43 = [v8 BOOLValue];

  id v9 = [v4 objectForKeyedSubscript:@"kAXMChartSeriesXDataKey"];
  id v10 = [v4 objectForKeyedSubscript:@"kAXMChartSeriesYDataKey"];
  v11 = [v4 objectForKeyedSubscript:@"kAXMChartSeriesZNumericDataKey"];
  v12 = [v4 objectForKeyedSubscript:@"kAXMChartSeriesZCategoricalDataKey"];
  v50 = [v4 objectForKeyedSubscript:@"kAXMChartSeriesLabelDataKey"];
  objc_super v13 = [v4 objectForKeyedSubscript:@"kAXMChartSeriesValueDescriptionsKey"];
  uint64_t v14 = [v9 count];
  if (v14 != [v10 count] && v10
    || (uint64_t v15 = [v9 count], v15 != objc_msgSend(v11, "count")) && v11
    || (uint64_t v16 = [v9 count], v16 != objc_msgSend(v12, "count")) && v12)
  {
    v17 = 0;
    goto LABEL_11;
  }
  v49 = v13;
  uint64_t v19 = [v9 count];
  if (v19 != [v50 count] && v50)
  {
    v17 = 0;
    goto LABEL_11;
  }
  v47 = v12;
  v40 = v7;
  v41 = self;
  v42 = v5;
  v48 = [MEMORY[0x1E4F1CA48] array];
  if ([v9 count])
  {
    unint64_t v20 = 0;
    v45 = v10;
    v46 = v9;
    v44 = v11;
    do
    {
      v21 = [v9 objectAtIndexedSubscript:v20];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v23 = [v9 objectAtIndexedSubscript:v20];
      v24 = v23;
      if (isKindOfClass)
      {
        +[AXMDataPointValue valueWithCategory:v23];
      }
      else
      {
        [v23 doubleValue];
        +[AXMDataPointValue valueWithNumber:](AXMDataPointValue, "valueWithNumber:");
      v25 = };

      if (v10)
      {
        v26 = [v10 objectAtIndexedSubscript:v20];
        [v26 doubleValue];
        v27 = +[AXMDataPointValue valueWithNumber:](AXMDataPointValue, "valueWithNumber:");

        if (!v11) {
          goto LABEL_24;
        }
      }
      else
      {
        v27 = 0;
        if (!v11)
        {
LABEL_24:
          v29 = 0;
          goto LABEL_25;
        }
      }
      v28 = [v11 objectAtIndexedSubscript:v20];
      [v28 doubleValue];
      v29 = +[AXMDataPointValue valueWithNumber:](AXMDataPointValue, "valueWithNumber:");

LABEL_25:
      if (v47)
      {
        v30 = [v47 objectAtIndexedSubscript:v20];
        v31 = +[AXMDataPointValue valueWithCategory:v30];
      }
      else
      {
        v31 = 0;
      }
      v32 = [v49 objectAtIndexedSubscript:v20];
      v33 = [MEMORY[0x1E4F1CA48] array];
      v34 = v33;
      if (v29) {
        [v33 addObject:v29];
      }
      if (v31) {
        [v34 addObject:v31];
      }
      if (v50)
      {
        v35 = [v50 objectAtIndexedSubscript:v20];
      }
      else
      {
        v35 = 0;
      }
      v36 = [[AXMDataPoint alloc] initWithX:v25 y:v27 additionalValues:v34 label:v35];
      [(AXMDataPoint *)v36 setValueDescription:v32];
      [v48 addObject:v36];

      ++v20;
      id v9 = v46;
      v11 = v44;
      id v10 = v45;
    }
    while (v20 < [v46 count]);
  }
  v7 = v40;
  v37 = [(AXMDataSeriesDescriptor *)v41 initWithAttributedName:v40 isContinuous:v43 dataPoints:v48];
  objc_super v13 = v49;
  if (v37)
  {
    uint64_t v38 = [v4 objectForKeyedSubscript:@"kAXMChartSeriesMeanValueDescriptionKey"];
    meanValueDescription = v37->_meanValueDescription;
    v37->_meanValueDescription = (NSString *)v38;
  }
  self = v37;

  v17 = self;
  v5 = v42;
  v12 = v47;
LABEL_11:

  return v17;
}

- (void)_commonInitWithContinuous:(BOOL)a3 dataPoints:(id)a4
{
  self->_isContinuous = a3;
  v5 = (NSArray *)[a4 copy];
  dataPoints = self->_dataPoints;
  self->_dataPoints = v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(AXMDataSeriesDescriptor *)self attributedName];
  BOOL v6 = [(AXMDataSeriesDescriptor *)self isContinuous];
  v7 = [(AXMDataSeriesDescriptor *)self dataPoints];
  id v8 = (void *)[v4 initWithAttributedName:v5 isContinuous:v6 dataPoints:v7];

  return v8;
}

- (void)setName:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F28B18];
    id v5 = a3;
    BOOL v6 = (NSAttributedString *)[[v4 alloc] initWithString:v5];

    attributedName = self->_attributedName;
    self->_attributedName = v6;
  }
}

- (NSString)name
{
  v2 = [(AXMDataSeriesDescriptor *)self attributedName];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (double)minimumDataValueOnTimeAxis
{
  v3 = [(AXMDataSeriesDescriptor *)self dataPoints];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0.0;
  }
  id v5 = [(AXMDataSeriesDescriptor *)self dataPoints];
  BOOL v6 = [v5 objectAtIndexedSubscript:0];
  v7 = [v6 timeEncodingValue];
  [v7 number];
  double v9 = v8;

  return v9;
}

- (double)maximumDataValueOnTimeAxis
{
  v3 = [(AXMDataSeriesDescriptor *)self dataPoints];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0.0;
  }
  id v5 = [(AXMDataSeriesDescriptor *)self dataPoints];
  BOOL v6 = [(AXMDataSeriesDescriptor *)self dataPoints];
  v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 1);
  double v8 = [v7 timeEncodingValue];
  [v8 number];
  double v10 = v9;

  return v10;
}

- (id)dictionaryRepresentation
{
  v57 = [MEMORY[0x1E4F1CA48] array];
  v56 = [MEMORY[0x1E4F1CA48] array];
  v3 = [(AXMDataSeriesDescriptor *)self dataPoints];
  uint64_t v4 = [v3 firstObject];
  id v5 = [v4 xValue];
  v55 = [v5 category];

  BOOL v6 = [(AXMDataSeriesDescriptor *)self dataPoints];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v58 = 0;
    v59 = 0;
    v60 = self;
    v61 = 0;
    double v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v12 = [(AXMDataSeriesDescriptor *)self dataPoints];
      objc_super v13 = [v12 objectAtIndexedSubscript:v9];

      uint64_t v14 = [v13 valueDescription];
      [v56 addObject:v14];

      if (v55)
      {
        uint64_t v15 = [v13 xValue];
        [v15 category];
      }
      else
      {
        uint64_t v16 = NSNumber;
        uint64_t v15 = [v13 xValue];
        [v15 number];
        objc_msgSend(v16, "numberWithDouble:");
      v17 = };
      [v57 addObject:v17];

      v18 = [v13 yValue];

      if (v18)
      {
        uint64_t v19 = (uint64_t)v59;
        if (!v59)
        {
          uint64_t v19 = [(AXMDataSeriesDescriptor *)self _mutableArrayOfNSNullWithCount:v9];
        }
        unint64_t v20 = NSNumber;
        v21 = (void *)v19;
        v22 = [v13 yValue];
        [v22 number];
        v23 = objc_msgSend(v20, "numberWithDouble:");
        v59 = v21;
        [v21 addObject:v23];
      }
      v24 = [v13 additionalValues];
      uint64_t v25 = [v24 count];

      if (v25) {
        break;
      }
LABEL_33:
      v44 = [v13 label];
      uint64_t v45 = [v44 length];

      if (v45)
      {
        self = v60;
        v46 = v58;
        if (!v58)
        {
          v46 = [(AXMDataSeriesDescriptor *)v60 _mutableArrayOfNSNullWithCount:v9];
        }
        v47 = [v13 label];
        v58 = v46;
        [v46 addObject:v47];
      }
      else
      {
        self = v60;
      }

      ++v9;
      v48 = [(AXMDataSeriesDescriptor *)self dataPoints];
      unint64_t v49 = [v48 count];

      if (v9 >= v49) {
        goto LABEL_41;
      }
    }
    unint64_t v26 = 0;
    while (1)
    {
      v27 = [v13 additionalValues];
      v28 = [v27 objectAtIndexedSubscript:v26];
      v29 = [v28 category];

      if (v29)
      {
        if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v11 = v26;
        }
        if (v26 != v11) {
          goto LABEL_32;
        }
        if (!v8)
        {
          double v8 = [(AXMDataSeriesDescriptor *)v60 _mutableArrayOfNSNullWithCount:v9];
        }
        v30 = [v13 additionalValues];
        v31 = [v30 objectAtIndexedSubscript:v26];
        v32 = [v31 category];

        if (v32)
        {
          [v8 addObject:v32];
        }
        else
        {
          uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
          [v8 addObject:v38];
        }
        uint64_t v11 = v26;
      }
      else
      {
        if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v10 = v26;
        }
        if (v26 != v10) {
          goto LABEL_32;
        }
        v33 = v61;
        if (!v61)
        {
          v33 = [(AXMDataSeriesDescriptor *)v60 _mutableArrayOfNSNullWithCount:v9];
        }
        v34 = [v13 additionalValues];
        v35 = [v34 objectAtIndexedSubscript:v26];
        [v35 number];
        double v37 = v36;

        v61 = v33;
        if (v37 == 9.22337204e18)
        {
          v32 = [MEMORY[0x1E4F1CA98] null];
          [v33 addObject:v32];
        }
        else
        {
          v39 = NSNumber;
          v32 = [v13 additionalValues];
          v40 = [v32 objectAtIndexedSubscript:v26];
          [v40 number];
          v41 = objc_msgSend(v39, "numberWithDouble:");
          [v33 addObject:v41];
        }
        uint64_t v10 = v26;
      }

LABEL_32:
      ++v26;
      v42 = [v13 additionalValues];
      unint64_t v43 = [v42 count];

      if (v26 >= v43) {
        goto LABEL_33;
      }
    }
  }
  v58 = 0;
  v59 = 0;
  double v8 = 0;
  v61 = 0;
LABEL_41:
  v50 = [MEMORY[0x1E4F1CA60] dictionary];
  v51 = [(AXMDataSeriesDescriptor *)self name];
  [v50 setObject:v51 forKeyedSubscript:@"kAXMChartSeriesNameKey"];

  v52 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMDataSeriesDescriptor isContinuous](self, "isContinuous"));
  [v50 setObject:v52 forKeyedSubscript:@"kAXMChartSeriesContinuousKey"];

  [v50 setObject:v57 forKeyedSubscript:@"kAXMChartSeriesXDataKey"];
  [v50 setObject:v59 forKeyedSubscript:@"kAXMChartSeriesYDataKey"];
  [v50 setObject:v61 forKeyedSubscript:@"kAXMChartSeriesZNumericDataKey"];
  [v50 setObject:v8 forKeyedSubscript:@"kAXMChartSeriesZCategoricalDataKey"];
  [v50 setObject:v56 forKeyedSubscript:@"kAXMChartSeriesValueDescriptionsKey"];
  v53 = [(AXMDataSeriesDescriptor *)self meanValueDescription];
  [v50 setObject:v53 forKeyedSubscript:@"kAXMChartSeriesMeanValueDescriptionKey"];

  return v50;
}

- (id)_mutableArrayOfNSNullWithCount:(int64_t)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  if (a3 >= 1)
  {
    do
    {
      id v5 = [MEMORY[0x1E4F1CA98] null];
      [v4 addObject:v5];

      --a3;
    }
    while (a3);
  }

  return v4;
}

- (NSArray)xValues
{
  v2 = [(AXMDataSeriesDescriptor *)self dataPoints];
  v3 = objc_msgSend(v2, "ax_mappedArrayUsingBlock:", &__block_literal_global_373_0);

  return (NSArray *)v3;
}

id __34__AXMDataSeriesDescriptor_xValues__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 xValue];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[AXMDataPointValue emptyValue];
  }
  id v5 = v4;

  return v5;
}

- (NSArray)yValues
{
  v2 = [(AXMDataSeriesDescriptor *)self dataPoints];
  v3 = objc_msgSend(v2, "ax_mappedArrayUsingBlock:", &__block_literal_global_375);

  return (NSArray *)v3;
}

id __34__AXMDataSeriesDescriptor_yValues__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 yValue];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[AXMDataPointValue emptyValue];
  }
  id v5 = v4;

  return v5;
}

- (NSArray)additionalNumericalValues
{
  v2 = [(AXMDataSeriesDescriptor *)self dataPoints];
  v3 = objc_msgSend(v2, "ax_mappedArrayUsingBlock:", &__block_literal_global_377_0);

  return (NSArray *)v3;
}

id __52__AXMDataSeriesDescriptor_additionalNumericalValues__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 zNumericAxisValue];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[AXMDataPointValue emptyValue];
  }
  id v5 = v4;

  return v5;
}

- (NSArray)additionalCategoricalValues
{
  v2 = [(AXMDataSeriesDescriptor *)self dataPoints];
  v3 = objc_msgSend(v2, "ax_mappedArrayUsingBlock:", &__block_literal_global_379_0);

  return (NSArray *)v3;
}

id __54__AXMDataSeriesDescriptor_additionalCategoricalValues__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 zCategoryAxisValue];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[AXMDataPointValue emptyValue];
  }
  id v5 = v4;

  return v5;
}

- (id)numericalValuesFromDataPointValues:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v3 objectAtIndexedSubscript:0];
  BOOL v6 = [v5 category];

  if (v6)
  {
    if ([v3 count])
    {
      unint64_t v7 = 0;
      do
      {
        double v8 = [NSNumber numberWithInteger:v7];
        [v4 addObject:v8];

        ++v7;
      }
      while (v7 < [v3 count]);
    }
    uint64_t v9 = [v4 copy];
  }
  else
  {
    uint64_t v9 = objc_msgSend(v3, "ax_mappedArrayUsingBlock:", &__block_literal_global_382);
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

uint64_t __62__AXMDataSeriesDescriptor_numericalValuesFromDataPointValues___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 number];

  return objc_msgSend(v2, "numberWithDouble:");
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(AXMDataSeriesDescriptor *)self name];
  BOOL v6 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMDataSeriesDescriptor isContinuous](self, "isContinuous"));
  unint64_t v7 = NSNumber;
  double v8 = [(AXMDataSeriesDescriptor *)self dataPoints];
  uint64_t v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  uint64_t v10 = [v3 stringWithFormat:@"<%@ %p name=%@ continuous=%@ points=%@>", v4, self, v5, v6, v9];

  return (NSString *)v10;
}

- (void)setDataSummary:(id)a3
{
}

- (NSAttributedString)attributedName
{
  return self->_attributedName;
}

- (void)setAttributedName:(id)a3
{
}

- (BOOL)isContinuous
{
  return self->_isContinuous;
}

- (void)setIsContinuous:(BOOL)a3
{
  self->_isContinuous = a3;
}

- (NSArray)dataPoints
{
  return self->_dataPoints;
}

- (void)setDataPoints:(id)a3
{
}

- (AXMDataSummary)dataSummary
{
  return self->_dataSummary;
}

- (NSString)meanValueDescription
{
  return self->_meanValueDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meanValueDescription, 0);
  objc_storeStrong((id *)&self->_dataSummary, 0);
  objc_storeStrong((id *)&self->_dataPoints, 0);

  objc_storeStrong((id *)&self->_attributedName, 0);
}

@end