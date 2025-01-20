@interface AXChartDescriptor
- (AXChartDescriptor)initWithAttributedTitle:(NSAttributedString *)attributedTitle summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis additionalAxes:(NSArray *)additionalAxes series:(NSArray *)series;
- (AXChartDescriptor)initWithAttributedTitle:(NSAttributedString *)attributedTitle summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis series:(NSArray *)series;
- (AXChartDescriptor)initWithDictionary:(id)a3;
- (AXChartDescriptor)initWithTitle:(NSString *)title summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis additionalAxes:(NSArray *)additionalAxes series:(NSArray *)series;
- (AXChartDescriptor)initWithTitle:(NSString *)title summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis series:(NSArray *)series;
- (AXChartDescriptorContentDirection)contentDirection;
- (AXNumericDataAxisDescriptor)yAxis;
- (CGRect)contentFrame;
- (NSArray)additionalAxes;
- (NSArray)annotations;
- (NSArray)series;
- (NSAttributedString)attributedTitle;
- (NSString)description;
- (NSString)summary;
- (NSString)title;
- (NSUUID)identifier;
- (id)_additionalCategoricalAxis;
- (id)_additionalNumericAxis;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)xAxis;
- (void)_commonInitWithSummary:(id)a3 xAxisDescriptor:(id)a4 yAxisDescriptor:(id)a5 additionalAxes:(id)a6 series:(id)a7;
- (void)computeValueDescriptionsIfNeeded;
- (void)setAdditionalAxes:(NSArray *)additionalAxes;
- (void)setAnnotations:(id)a3;
- (void)setAttributedTitle:(NSAttributedString *)attributedTitle;
- (void)setContentDirection:(AXChartDescriptorContentDirection)contentDirection;
- (void)setContentFrame:(CGRect)contentFrame;
- (void)setIdentifier:(id)a3;
- (void)setSeries:(NSArray *)series;
- (void)setSummary:(NSString *)summary;
- (void)setTitle:(NSString *)title;
- (void)setXAxis:(id)xAxis;
- (void)setYAxis:(AXNumericDataAxisDescriptor *)yAxis;
@end

@implementation AXChartDescriptor

- (AXChartDescriptor)initWithTitle:(NSString *)title summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis series:(NSArray *)series
{
  return [(AXChartDescriptor *)self initWithTitle:title summary:summary xAxisDescriptor:xAxis yAxisDescriptor:yAxis additionalAxes:0 series:series];
}

- (AXChartDescriptor)initWithAttributedTitle:(NSAttributedString *)attributedTitle summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis series:(NSArray *)series
{
  return [(AXChartDescriptor *)self initWithAttributedTitle:attributedTitle summary:summary xAxisDescriptor:xAxis yAxisDescriptor:yAxis additionalAxes:0 series:series];
}

- (AXChartDescriptor)initWithTitle:(NSString *)title summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis additionalAxes:(NSArray *)additionalAxes series:(NSArray *)series
{
  v14 = title;
  v15 = summary;
  id v16 = xAxis;
  v17 = yAxis;
  v18 = additionalAxes;
  v19 = series;
  v23.receiver = self;
  v23.super_class = (Class)AXChartDescriptor;
  v20 = [(AXChartDescriptor *)&v23 init];
  v21 = v20;
  if (v20)
  {
    [(AXChartDescriptor *)v20 setTitle:v14];
    [(AXChartDescriptor *)v21 _commonInitWithSummary:v15 xAxisDescriptor:v16 yAxisDescriptor:v17 additionalAxes:v18 series:v19];
  }

  return v21;
}

- (AXChartDescriptor)initWithAttributedTitle:(NSAttributedString *)attributedTitle summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis additionalAxes:(NSArray *)additionalAxes series:(NSArray *)series
{
  v15 = attributedTitle;
  id v16 = summary;
  id v17 = xAxis;
  v18 = yAxis;
  v19 = additionalAxes;
  v20 = series;
  v24.receiver = self;
  v24.super_class = (Class)AXChartDescriptor;
  v21 = [(AXChartDescriptor *)&v24 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_attributedTitle, attributedTitle);
    [(AXChartDescriptor *)v22 _commonInitWithSummary:v16 xAxisDescriptor:v17 yAxisDescriptor:v18 additionalAxes:v19 series:v20];
  }

  return v22;
}

- (AXChartDescriptor)initWithDictionary:(id)a3
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v66 = a3;
  v3 = getkAXMChartTitleKey();
  v61 = [v66 objectForKeyedSubscript:v3];

  v4 = getkAXMChartSummaryKey();
  v60 = [v66 objectForKeyedSubscript:v4];

  v5 = getkAXMChartContentDirectionKey();
  v6 = [v66 objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 integerValue];

  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  v8 = (void *)getkAXMChartContentFrameKeySymbolLoc_ptr;
  uint64_t v84 = getkAXMChartContentFrameKeySymbolLoc_ptr;
  if (!getkAXMChartContentFrameKeySymbolLoc_ptr)
  {
    uint64_t v76 = MEMORY[0x263EF8330];
    uint64_t v77 = 3221225472;
    v78 = __getkAXMChartContentFrameKeySymbolLoc_block_invoke;
    v79 = &unk_2641D86D8;
    v80 = &v81;
    v9 = (void *)AXMediaUtilitiesLibrary();
    v82[3] = (uint64_t)dlsym(v9, "kAXMChartContentFrameKey");
    getkAXMChartContentFrameKeySymbolLoc_ptr = *(void *)(v80[1] + 24);
    v8 = (void *)v82[3];
  }
  _Block_object_dispose(&v81, 8);
  if (!v8)
  {
    AXAnimatedImagesEnabled_cold_1();
    __break(1u);
  }
  uint64_t v56 = v7;
  v10 = [v66 objectForKeyedSubscript:*v8];
  [v10 AXMRectValue];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  v19 = getkAXMChartXAxisKey();
  v65 = [v66 objectForKeyedSubscript:v19];

  v20 = getkAXMChartYAxisKey();
  v64 = [v66 objectForKeyedSubscript:v20];

  v21 = getkAXMChartAdditionalAxesKey();
  v22 = [v66 objectForKeyedSubscript:v21];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v22;
  objc_super v23 = 0;
  objc_super v24 = 0;
  uint64_t v25 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v73 != v26) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        v29 = getkAXMChartAxisTypeKey();
        v30 = [v28 objectForKeyedSubscript:v29];
        v31 = getkAXMChartAxisTypeNumeric();
        char v32 = [v30 isEqualToString:v31];

        if (v32)
        {
          v33 = v24;
          v34 = v23;
          objc_super v24 = v28;
        }
        else
        {
          v35 = getkAXMChartAxisTypeKey();
          v36 = [v28 objectForKeyedSubscript:v35];
          v37 = getkAXMChartAxisTypeCategorical();
          int v38 = [v36 isEqualToString:v37];

          v33 = v23;
          v34 = v28;
          if (!v38) {
            continue;
          }
        }
        id v39 = v28;

        objc_super v23 = v34;
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
    }
    while (v25);
  }

  v40 = getkAXMChartSeriesKey();
  v41 = [v66 objectForKeyedSubscript:v40];

  v42 = getkAXMChartAxisTypeKey();
  v43 = [v65 objectForKeyedSubscript:v42];
  v44 = getkAXMChartAxisTypeCategorical();
  [v43 isEqualToString:v44];
  v45 = (objc_class *)objc_opt_class();

  v59 = (void *)[[v45 alloc] initWithDictionary:v65];
  if (v64)
  {
    v58 = [[AXNumericDataAxisDescriptor alloc] initWithDictionary:v64];
    if (v24) {
      goto LABEL_17;
    }
LABEL_20:
    v63 = 0;
    if (v23) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
  v58 = 0;
  if (!v24) {
    goto LABEL_20;
  }
LABEL_17:
  v63 = [[AXNumericDataAxisDescriptor alloc] initWithDictionary:v24];
  if (v23)
  {
LABEL_18:
    v62 = [[AXCategoricalDataAxisDescriptor alloc] initWithDictionary:v23];
    goto LABEL_22;
  }
LABEL_21:
  v62 = 0;
LABEL_22:
  v46 = [MEMORY[0x263EFF980] array];
  v47 = v46;
  if (v63) {
    [v46 addObject:v63];
  }
  if (v62) {
    [v47 addObject:v62];
  }
  v48 = [MEMORY[0x263EFF980] array];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v49 = v41;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v68 objects:v85 count:16];
  if (v50)
  {
    uint64_t v51 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v69 != v51) {
          objc_enumerationMutation(v49);
        }
        v53 = [[AXDataSeriesDescriptor alloc] initWithDictionary:*(void *)(*((void *)&v68 + 1) + 8 * j)];
        [v48 addObject:v53];
      }
      uint64_t v50 = [v49 countByEnumeratingWithState:&v68 objects:v85 count:16];
    }
    while (v50);
  }

  v54 = [(AXChartDescriptor *)self initWithAttributedTitle:v61 summary:v60 xAxisDescriptor:v59 yAxisDescriptor:v58 additionalAxes:v47 series:v48];
  [(AXChartDescriptor *)v54 setContentDirection:v56];
  -[AXChartDescriptor setContentFrame:](v54, "setContentFrame:", v12, v14, v16, v18);

  return v54;
}

- (void)_commonInitWithSummary:(id)a3 xAxisDescriptor:(id)a4 yAxisDescriptor:(id)a5 additionalAxes:(id)a6 series:(id)a7
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  double v17 = [MEMORY[0x263F08C38] UUID];
  identifier = self->_identifier;
  self->_identifier = v17;

  v19 = (NSString *)[v12 copy];
  summary = self->_summary;
  self->_summary = v19;

  objc_storeStrong((id *)&self->_xAxis, a4);
  objc_storeStrong((id *)&self->_yAxis, a5);
  v21 = (NSArray *)[v15 copy];
  additionalAxes = self->_additionalAxes;
  self->_additionalAxes = v21;

  objc_super v23 = (NSArray *)[v16 copy];
  series = self->_series;
  self->_series = v23;

  if (v14)
  {
    id v33 = v13;
    id v34 = v12;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v25 = v16;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v35 + 1) + 8 * v29);
          objc_msgSend(v14, "valueDescriptionProvider", v33, v34, (void)v35);
          v31 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          [v30 meanYValue];
          char v32 = v31[2](v31);

          if ([v32 length]) {
            [v30 setMeanValueDescription:v32];
          }

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v27);
    }

    id v13 = v33;
    id v12 = v34;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[AXChartDescriptor allocWithZone:a3];
  v5 = [(AXChartDescriptor *)self attributedTitle];
  v6 = [(AXChartDescriptor *)self summary];
  uint64_t v7 = [(AXChartDescriptor *)self xAxis];
  v8 = [(AXChartDescriptor *)self yAxis];
  v9 = [(AXChartDescriptor *)self additionalAxes];
  v10 = [(AXChartDescriptor *)self series];
  double v11 = [(AXChartDescriptor *)v4 initWithAttributedTitle:v5 summary:v6 xAxisDescriptor:v7 yAxisDescriptor:v8 additionalAxes:v9 series:v10];

  return v11;
}

- (NSString)title
{
  v2 = [(AXChartDescriptor *)self attributedTitle];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setTitle:(NSString *)title
{
  v6 = title;
  if (v6)
  {
    v4 = (NSAttributedString *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6];
    attributedTitle = self->_attributedTitle;
    self->_attributedTitle = v4;
  }
  else
  {
    attributedTitle = self->_attributedTitle;
    self->_attributedTitle = 0;
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  [(AXChartDescriptor *)self computeValueDescriptionsIfNeeded];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(AXChartDescriptor *)self xAxis];
  char v32 = [v4 dictionaryRepresentation];

  v5 = [(AXChartDescriptor *)self yAxis];
  v6 = [v5 dictionaryRepresentation];

  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v8 = [(AXChartDescriptor *)self additionalAxes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v10);
  }

  id v14 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v15 = [(AXChartDescriptor *)self series];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v33 + 1) + 8 * j) dictionaryRepresentation];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v17);
  }

  v21 = [(AXChartDescriptor *)self attributedTitle];
  v22 = getkAXMChartTitleKey();
  [v3 setObject:v21 forKeyedSubscript:v22];

  objc_super v23 = [(AXChartDescriptor *)self summary];
  objc_super v24 = getkAXMChartSummaryKey();
  [v3 setObject:v23 forKeyedSubscript:v24];

  id v25 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXChartDescriptor contentDirection](self, "contentDirection"));
  uint64_t v26 = getkAXMChartContentDirectionKey();
  [v3 setObject:v25 forKeyedSubscript:v26];

  uint64_t v27 = getkAXMChartXAxisKey();
  [v3 setObject:v32 forKeyedSubscript:v27];

  uint64_t v28 = getkAXMChartYAxisKey();
  [v3 setObject:v6 forKeyedSubscript:v28];

  uint64_t v29 = getkAXMChartAdditionalAxesKey();
  [v3 setObject:v7 forKeyedSubscript:v29];

  v30 = getkAXMChartSeriesKey();
  [v3 setObject:v14 forKeyedSubscript:v30];

  return v3;
}

- (void)computeValueDescriptionsIfNeeded
{
  v2 = self;
  uint64_t v52 = *MEMORY[0x263EF8340];
  v3 = [(AXChartDescriptor *)self series];
  v4 = [v3 firstObject];
  v5 = [v4 dataPoints];
  v6 = [v5 firstObject];
  uint64_t v7 = [v6 valueDescription];

  if (!v7)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = [(AXChartDescriptor *)v2 series];
    uint64_t v33 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v47;
      long long v36 = v2;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v47 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = v8;
          uint64_t v9 = [*(id *)(*((void *)&v46 + 1) + 8 * v8) dataPoints];
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v35 = v9;
          uint64_t v38 = [v9 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v38)
          {
            uint64_t v37 = *(void *)v43;
            do
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v43 != v37) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                id v12 = [(AXChartDescriptor *)v2 xAxis];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v13 = [(AXChartDescriptor *)v2 xAxis];
                }
                else
                {
                  id v13 = 0;
                }

                id v14 = [(AXChartDescriptor *)v2 yAxis];
                id v15 = [(AXChartDescriptor *)v2 _additionalNumericAxis];
                v41 = v13;
                if (v13)
                {
                  uint64_t v16 = [v13 valueDescriptionProvider];
                  uint64_t v17 = [v11 xValue];
                  [v17 number];
                  uint64_t v18 = v16[2](v16);
                }
                else
                {
                  uint64_t v16 = [v11 xValue];
                  uint64_t v18 = [v16 category];
                }

                v19 = [v14 valueDescriptionProvider];

                long long v40 = v14;
                if (v19)
                {
                  v20 = [v14 valueDescriptionProvider];
                  v21 = [v11 yValue];
                  [v21 number];
                  v22 = v20[2](v20);
                }
                else
                {
                  v22 = 0;
                }
                objc_super v23 = [v11 _additionalNumericValue];
                long long v39 = v15;
                if (v23)
                {
                  objc_super v24 = [v15 valueDescriptionProvider];
                  [v23 doubleValue];
                  id v25 = v24[2](v24);
                }
                else
                {
                  id v25 = 0;
                }
                uint64_t v26 = [v11 _additionalCategoricalValue];
                uint64_t v27 = [v11 label];
                uint64_t v28 = [MEMORY[0x263EFF980] array];
                uint64_t v29 = v28;
                if (v27) {
                  [v28 addObject:v27];
                }
                if (v18) {
                  [v29 addObject:v18];
                }
                if (v22) {
                  [v29 addObject:v22];
                }
                if (v25) {
                  [v29 addObject:v25];
                }
                if (v26) {
                  [v29 addObject:v26];
                }
                v30 = [v29 componentsJoinedByString:@", "];
                [v11 setValueDescription:v30];

                v2 = v36;
              }
              uint64_t v38 = [v35 countByEnumeratingWithState:&v42 objects:v50 count:16];
            }
            while (v38);
          }

          uint64_t v8 = v34 + 1;
        }
        while (v34 + 1 != v33);
        uint64_t v33 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v33);
    }
  }
}

- (id)_additionalNumericAxis
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(AXChartDescriptor *)self additionalAxes];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_additionalCategoricalAxis
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(AXChartDescriptor *)self additionalAxes];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)description
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(AXChartDescriptor *)self xAxis];
  [v3 addObject:v4];

  v5 = [(AXChartDescriptor *)self yAxis];

  if (v5)
  {
    v6 = [(AXChartDescriptor *)self yAxis];
    [v3 addObject:v6];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [(AXChartDescriptor *)self additionalAxes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        [v3 addObject:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  id v12 = NSString;
  uint64_t v13 = objc_opt_class();
  id v14 = [(AXChartDescriptor *)self title];
  id v15 = [(AXChartDescriptor *)self summary];
  uint64_t v16 = [(AXChartDescriptor *)self series];
  uint64_t v17 = [v12 stringWithFormat:@"<%@ %p\n\ttitle=%@\n\tsummary=%@\n\tAxes:\n\t%@Series:\n\t%@>", v13, self, v14, v15, v3, v16];

  return (NSString *)v17;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(NSString *)summary
{
}

- (AXChartDescriptorContentDirection)contentDirection
{
  return self->_contentDirection;
}

- (void)setContentDirection:(AXChartDescriptorContentDirection)contentDirection
{
  self->_contentDirection = contentDirection;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)contentFrame
{
  self->_contentFrame = contentFrame;
}

- (NSArray)series
{
  return self->_series;
}

- (void)setSeries:(NSArray *)series
{
}

- (id)xAxis
{
  return self->_xAxis;
}

- (void)setXAxis:(id)xAxis
{
}

- (AXNumericDataAxisDescriptor)yAxis
{
  return self->_yAxis;
}

- (void)setYAxis:(AXNumericDataAxisDescriptor *)yAxis
{
}

- (NSArray)additionalAxes
{
  return self->_additionalAxes;
}

- (void)setAdditionalAxes:(NSArray *)additionalAxes
{
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_additionalAxes, 0);
  objc_storeStrong((id *)&self->_yAxis, 0);
  objc_storeStrong((id *)&self->_xAxis, 0);
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_summary, 0);

  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

@end