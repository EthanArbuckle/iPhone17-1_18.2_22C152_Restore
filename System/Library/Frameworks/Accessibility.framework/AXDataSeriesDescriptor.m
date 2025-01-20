@interface AXDataSeriesDescriptor
- (AXDataSeriesDescriptor)initWithAttributedName:(NSAttributedString *)attributedName isContinuous:(BOOL)isContinuous dataPoints:(NSArray *)dataPoints;
- (AXDataSeriesDescriptor)initWithDictionary:(id)a3;
- (AXDataSeriesDescriptor)initWithName:(NSString *)name isContinuous:(BOOL)isContinuous dataPoints:(NSArray *)dataPoints;
- (BOOL)isContinuous;
- (NSArray)dataPoints;
- (NSAttributedString)attributedName;
- (NSString)description;
- (NSString)meanValueDescription;
- (NSString)name;
- (double)meanYValue;
- (id)_mutableArrayOfNSNullWithCount:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)_commonInitWithContinuous:(BOOL)a3 dataPoints:(id)a4;
- (void)setAttributedName:(NSAttributedString *)attributedName;
- (void)setDataPoints:(NSArray *)dataPoints;
- (void)setIsContinuous:(BOOL)isContinuous;
- (void)setMeanValueDescription:(id)a3;
- (void)setName:(NSString *)name;
@end

@implementation AXDataSeriesDescriptor

- (AXDataSeriesDescriptor)initWithName:(NSString *)name isContinuous:(BOOL)isContinuous dataPoints:(NSArray *)dataPoints
{
  BOOL v6 = isContinuous;
  v8 = name;
  v9 = dataPoints;
  v13.receiver = self;
  v13.super_class = (Class)AXDataSeriesDescriptor;
  v10 = [(AXDataSeriesDescriptor *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(AXDataSeriesDescriptor *)v10 setName:v8];
    [(AXDataSeriesDescriptor *)v11 _commonInitWithContinuous:v6 dataPoints:v9];
  }

  return v11;
}

- (AXDataSeriesDescriptor)initWithAttributedName:(NSAttributedString *)attributedName isContinuous:(BOOL)isContinuous dataPoints:(NSArray *)dataPoints
{
  BOOL v6 = isContinuous;
  v9 = attributedName;
  v10 = dataPoints;
  v14.receiver = self;
  v14.super_class = (Class)AXDataSeriesDescriptor;
  v11 = [(AXDataSeriesDescriptor *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_attributedName, attributedName);
    [(AXDataSeriesDescriptor *)v12 _commonInitWithContinuous:v6 dataPoints:v10];
  }

  return v12;
}

- (AXDataSeriesDescriptor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = getkAXMChartSeriesNameKey();
  BOOL v6 = [v4 objectForKeyedSubscript:v5];

  v7 = getkAXMChartSeriesContinuousKey();
  v8 = [v4 objectForKeyedSubscript:v7];
  unsigned int v57 = [v8 BOOLValue];

  v9 = getkAXMChartSeriesXDataKey();
  v10 = [v4 objectForKeyedSubscript:v9];

  v11 = getkAXMChartSeriesYDataKey();
  v12 = [v4 objectForKeyedSubscript:v11];

  objc_super v13 = getkAXMChartSeriesZNumericDataKey();
  objc_super v14 = [v4 objectForKeyedSubscript:v13];

  v15 = getkAXMChartSeriesZCategoricalDataKey();
  v16 = [v4 objectForKeyedSubscript:v15];

  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  v17 = (void *)getkAXMChartSeriesLabelDataKeySymbolLoc_ptr;
  uint64_t v68 = getkAXMChartSeriesLabelDataKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesLabelDataKeySymbolLoc_ptr)
  {
    v18 = (void *)AXMediaUtilitiesLibrary();
    v66[3] = (uint64_t)dlsym(v18, "kAXMChartSeriesLabelDataKey");
    getkAXMChartSeriesLabelDataKeySymbolLoc_ptr = v66[3];
    v17 = (void *)v66[3];
  }
  _Block_object_dispose(&v65, 8);
  if (!v17)
  {
    v54 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v65, 8);
    _Unwind_Resume(v54);
  }
  v19 = [v4 objectForKeyedSubscript:*v17];
  v20 = getkAXMChartSeriesValueDescriptionsKey();
  v64 = [v4 objectForKeyedSubscript:v20];

  uint64_t v21 = [v10 count];
  if (v21 != [v12 count] && v12
    || (uint64_t v22 = [v10 count], v22 != objc_msgSend(v14, "count")) && v14
    || (uint64_t v23 = [v10 count], v23 != objc_msgSend(v16, "count")) && v16
    || (uint64_t v24 = [v10 count], v24 != objc_msgSend(v19, "count")) && v19)
  {
    v25 = AXAudioGraphLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[AXDataSeriesDescriptor initWithDictionary:]((uint64_t)v4, v25);
    }
    v26 = 0;
    goto LABEL_15;
  }
  v62 = v19;
  v63 = v16;
  v61 = objc_msgSend(MEMORY[0x263EFF980], "array", self, v6);
  if ([v10 count])
  {
    unint64_t v28 = 0;
    unint64_t v29 = 0x2641D8000uLL;
    v59 = v12;
    v60 = v10;
    v58 = v14;
    do
    {
      v30 = [v10 objectAtIndexedSubscript:v28];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v32 = *(void **)(v29 + 1472);
      v33 = [v10 objectAtIndexedSubscript:v28];
      v34 = v33;
      if (isKindOfClass)
      {
        [v32 valueWithCategory:v33];
      }
      else
      {
        [v33 doubleValue];
        objc_msgSend(v32, "valueWithNumber:");
      v35 = };

      if (v12)
      {
        v36 = *(void **)(v29 + 1472);
        v37 = [v12 objectAtIndexedSubscript:v28];
        [v37 doubleValue];
        v38 = objc_msgSend(v36, "valueWithNumber:");

        if (!v14) {
          goto LABEL_25;
        }
      }
      else
      {
        v38 = 0;
        if (!v14)
        {
LABEL_25:
          v41 = 0;
          goto LABEL_26;
        }
      }
      v39 = *(void **)(v29 + 1472);
      v40 = [v14 objectAtIndexedSubscript:v28];
      [v40 doubleValue];
      v41 = objc_msgSend(v39, "valueWithNumber:");

LABEL_26:
      if (v63)
      {
        v42 = *(void **)(v29 + 1472);
        v43 = [v63 objectAtIndexedSubscript:v28];
        v44 = [v42 valueWithCategory:v43];
      }
      else
      {
        v44 = 0;
      }
      v45 = [v64 objectAtIndexedSubscript:v28];
      v46 = [MEMORY[0x263EFF980] array];
      v47 = v46;
      if (v41) {
        [v46 addObject:v41];
      }
      if (v44) {
        [v47 addObject:v44];
      }
      if (v62)
      {
        v48 = [v62 objectAtIndexedSubscript:v28];
      }
      else
      {
        v48 = 0;
      }
      v49 = [[AXDataPoint alloc] initWithX:v35 y:v38 additionalValues:v47 label:v48];
      [(AXDataPoint *)v49 setValueDescription:v45];
      [v61 addObject:v49];

      ++v28;
      v10 = v60;
      objc_super v14 = v58;
      v12 = v59;
      unint64_t v29 = 0x2641D8000;
    }
    while (v28 < [v60 count]);
  }
  BOOL v6 = v56;
  v25 = v61;
  v50 = (void *)[v55 initWithAttributedName:v56 isContinuous:v57 dataPoints:v61];
  if (v50)
  {
    v51 = getkAXMChartSeriesMeanValueDescriptionKey();
    uint64_t v52 = [v4 objectForKeyedSubscript:v51];
    v53 = (void *)v50[4];
    v50[4] = v52;
  }
  self = v50;
  v26 = self;
  v19 = v62;
  v16 = v63;
LABEL_15:

  return v26;
}

- (void)_commonInitWithContinuous:(BOOL)a3 dataPoints:(id)a4
{
  self->_isContinuous = a3;
  self->_dataPoints = (NSArray *)[a4 copy];

  MEMORY[0x270F9A758]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(AXDataSeriesDescriptor *)self attributedName];
  BOOL v6 = [(AXDataSeriesDescriptor *)self isContinuous];
  v7 = [(AXDataSeriesDescriptor *)self dataPoints];
  v8 = (void *)[v4 initWithAttributedName:v5 isContinuous:v6 dataPoints:v7];

  return v8;
}

- (void)setName:(NSString *)name
{
  BOOL v6 = name;
  if (v6)
  {
    id v4 = (NSAttributedString *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6];
    attributedName = self->_attributedName;
    self->_attributedName = v4;
  }
  else
  {
    attributedName = self->_attributedName;
    self->_attributedName = 0;
  }
}

- (NSString)name
{
  v2 = [(AXDataSeriesDescriptor *)self attributedName];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (double)meanYValue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(AXDataSeriesDescriptor *)self dataPoints];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) yValue];
        [v9 number];
        double v7 = v7 + v10;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  v11 = [(AXDataSeriesDescriptor *)self dataPoints];
  unint64_t v12 = [v11 count];

  return v7 / (double)v12;
}

- (id)dictionaryRepresentation
{
  uint64_t v65 = [MEMORY[0x263EFF980] array];
  v64 = [MEMORY[0x263EFF980] array];
  v3 = [(AXDataSeriesDescriptor *)self dataPoints];
  uint64_t v4 = [v3 firstObject];
  uint64_t v5 = [v4 xValue];
  v63 = [v5 category];

  uint64_t v6 = [(AXDataSeriesDescriptor *)self dataPoints];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v66 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = self;
    v69 = 0;
    v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      unint64_t v12 = [(AXDataSeriesDescriptor *)self dataPoints];
      objc_super v13 = [v12 objectAtIndexedSubscript:v9];

      long long v14 = [v13 valueDescription];
      [v64 addObject:v14];

      if (v63)
      {
        long long v15 = [v13 xValue];
        [v15 category];
      }
      else
      {
        long long v16 = NSNumber;
        long long v15 = [v13 xValue];
        [v15 number];
        objc_msgSend(v16, "numberWithDouble:");
      long long v17 = };
      [v65 addObject:v17];

      v18 = [v13 yValue];

      if (v18)
      {
        uint64_t v19 = (uint64_t)v67;
        if (!v67)
        {
          uint64_t v19 = [(AXDataSeriesDescriptor *)self _mutableArrayOfNSNullWithCount:v9];
        }
        v20 = NSNumber;
        uint64_t v21 = (void *)v19;
        uint64_t v22 = [v13 yValue];
        [v22 number];
        uint64_t v23 = objc_msgSend(v20, "numberWithDouble:");
        uint64_t v67 = v21;
        [v21 addObject:v23];
      }
      uint64_t v24 = [v13 additionalValues];
      uint64_t v25 = [v24 count];

      if (v25) {
        break;
      }
LABEL_33:
      v44 = [v13 label];
      uint64_t v45 = [v44 length];

      if (v45)
      {
        self = v68;
        v46 = v66;
        if (!v66)
        {
          v46 = [(AXDataSeriesDescriptor *)v68 _mutableArrayOfNSNullWithCount:v9];
        }
        v47 = [v13 label];
        v66 = v46;
        [v46 addObject:v47];
      }
      else
      {
        self = v68;
      }

      ++v9;
      v48 = [(AXDataSeriesDescriptor *)self dataPoints];
      unint64_t v49 = [v48 count];

      if (v9 >= v49) {
        goto LABEL_41;
      }
    }
    unint64_t v26 = 0;
    while (1)
    {
      v27 = [v13 additionalValues];
      unint64_t v28 = [v27 objectAtIndexedSubscript:v26];
      unint64_t v29 = [v28 category];

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
          v8 = [(AXDataSeriesDescriptor *)v68 _mutableArrayOfNSNullWithCount:v9];
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
          v38 = [MEMORY[0x263EFF9D0] null];
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
        v33 = v69;
        if (!v69)
        {
          v33 = [(AXDataSeriesDescriptor *)v68 _mutableArrayOfNSNullWithCount:v9];
        }
        v34 = [v13 additionalValues];
        v35 = [v34 objectAtIndexedSubscript:v26];
        [v35 number];
        double v37 = v36;

        v69 = v33;
        if (v37 == 9.22337204e18)
        {
          v32 = [MEMORY[0x263EFF9D0] null];
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
  v66 = 0;
  uint64_t v67 = 0;
  v8 = 0;
  v69 = 0;
LABEL_41:
  v50 = [MEMORY[0x263EFF9A0] dictionary];
  v51 = [(AXDataSeriesDescriptor *)self attributedName];
  uint64_t v52 = getkAXMChartSeriesNameKey();
  [v50 setObject:v51 forKeyedSubscript:v52];

  v53 = objc_msgSend(NSNumber, "numberWithBool:", -[AXDataSeriesDescriptor isContinuous](self, "isContinuous"));
  v54 = getkAXMChartSeriesContinuousKey();
  [v50 setObject:v53 forKeyedSubscript:v54];

  v55 = getkAXMChartSeriesXDataKey();
  [v50 setObject:v65 forKeyedSubscript:v55];

  v56 = getkAXMChartSeriesYDataKey();
  [v50 setObject:v67 forKeyedSubscript:v56];

  unsigned int v57 = getkAXMChartSeriesZNumericDataKey();
  [v50 setObject:v69 forKeyedSubscript:v57];

  v58 = getkAXMChartSeriesZCategoricalDataKey();
  [v50 setObject:v8 forKeyedSubscript:v58];

  v59 = getkAXMChartSeriesValueDescriptionsKey();
  [v50 setObject:v64 forKeyedSubscript:v59];

  v60 = [(AXDataSeriesDescriptor *)self meanValueDescription];
  v61 = getkAXMChartSeriesMeanValueDescriptionKey();
  [v50 setObject:v60 forKeyedSubscript:v61];

  return v50;
}

- (id)_mutableArrayOfNSNullWithCount:(int64_t)a3
{
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  if (a3 >= 1)
  {
    do
    {
      uint64_t v5 = [MEMORY[0x263EFF9D0] null];
      [v4 addObject:v5];

      --a3;
    }
    while (a3);
  }

  return v4;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(AXDataSeriesDescriptor *)self name];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[AXDataSeriesDescriptor isContinuous](self, "isContinuous"));
  uint64_t v7 = NSNumber;
  v8 = [(AXDataSeriesDescriptor *)self dataPoints];
  unint64_t v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  uint64_t v10 = [v3 stringWithFormat:@"<%@ %p name=%@ continuous=%@ points=%@>", v4, self, v5, v6, v9];

  return (NSString *)v10;
}

- (NSAttributedString)attributedName
{
  return self->_attributedName;
}

- (void)setAttributedName:(NSAttributedString *)attributedName
{
}

- (BOOL)isContinuous
{
  return self->_isContinuous;
}

- (void)setIsContinuous:(BOOL)isContinuous
{
  self->_isContinuous = isContinuous;
}

- (NSArray)dataPoints
{
  return self->_dataPoints;
}

- (void)setDataPoints:(NSArray *)dataPoints
{
}

- (NSString)meanValueDescription
{
  return self->_meanValueDescription;
}

- (void)setMeanValueDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meanValueDescription, 0);
  objc_storeStrong((id *)&self->_dataPoints, 0);

  objc_storeStrong((id *)&self->_attributedName, 0);
}

- (void)initWithDictionary:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_213B3D000, a2, OS_LOG_TYPE_FAULT, "Data is not aligned: %@", (uint8_t *)&v2, 0xCu);
}

@end