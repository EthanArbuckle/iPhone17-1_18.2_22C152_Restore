@interface AXMChartDescriptor
- (AXMCategoricalDataAxisDescriptor)timbreAxisDescriptor;
- (AXMCategoricalDataAxisDescriptor)timeCategoricalAxisDescriptor;
- (AXMChartDescriptor)initWithAttributedTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 additionalAxes:(id)a7 series:(id)a8;
- (AXMChartDescriptor)initWithAttributedTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 series:(id)a7;
- (AXMChartDescriptor)initWithDictionary:(id)a3;
- (AXMChartDescriptor)initWithTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 additionalAxes:(id)a7 series:(id)a8;
- (AXMChartDescriptor)initWithTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 series:(id)a7;
- (AXMDataAxisDescriptor)xAxis;
- (AXMNumericDataAxisDescriptor)durationAxisDescriptor;
- (AXMNumericDataAxisDescriptor)pitchAxisDescriptor;
- (AXMNumericDataAxisDescriptor)timeNumericAxisDescriptor;
- (AXMNumericDataAxisDescriptor)volumeAxisDescriptor;
- (AXMNumericDataAxisDescriptor)yAxis;
- (CGRect)contentFrame;
- (NSArray)additionalAxes;
- (NSArray)annotations;
- (NSArray)series;
- (NSAttributedString)attributedTitle;
- (NSString)description;
- (NSString)summary;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)zCategoricalAxisDescriptor;
- (id)zNumericAxisDescriptor;
- (int64_t)contentDirection;
- (void)_commonInitWithSummary:(id)a3 xAxisDescriptor:(id)a4 yAxisDescriptor:(id)a5 additionalAxes:(id)a6 series:(id)a7;
- (void)generateDataSummariesWithCompletion:(id)a3;
- (void)setAdditionalAxes:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setContentDirection:(int64_t)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setSeries:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTitle:(id)a3;
- (void)setXAxis:(id)a3;
- (void)setYAxis:(id)a3;
@end

@implementation AXMChartDescriptor

- (AXMChartDescriptor)initWithTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 series:(id)a7
{
  return [(AXMChartDescriptor *)self initWithTitle:a3 summary:a4 xAxisDescriptor:a5 yAxisDescriptor:a6 additionalAxes:0 series:a7];
}

- (AXMChartDescriptor)initWithAttributedTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 series:(id)a7
{
  return [(AXMChartDescriptor *)self initWithAttributedTitle:a3 summary:a4 xAxisDescriptor:a5 yAxisDescriptor:a6 additionalAxes:0 series:a7];
}

- (AXMChartDescriptor)initWithTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 additionalAxes:(id)a7 series:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AXMChartDescriptor;
  v20 = [(AXMChartDescriptor *)&v24 init];
  if (v20)
  {
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v14];
    attributedTitle = v20->_attributedTitle;
    v20->_attributedTitle = (NSAttributedString *)v21;

    [(AXMChartDescriptor *)v20 _commonInitWithSummary:v15 xAxisDescriptor:v16 yAxisDescriptor:v17 additionalAxes:v18 series:v19];
  }

  return v20;
}

- (AXMChartDescriptor)initWithAttributedTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 additionalAxes:(id)a7 series:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AXMChartDescriptor;
  uint64_t v21 = [(AXMChartDescriptor *)&v24 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_attributedTitle, a3);
    [(AXMChartDescriptor *)v22 _commonInitWithSummary:v16 xAxisDescriptor:v17 yAxisDescriptor:v18 additionalAxes:v19 series:v20];
  }

  return v22;
}

- (AXMChartDescriptor)initWithDictionary:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  uint64_t v3 = [v55 objectForKeyedSubscript:@"kAXMChartTitleKey"];
  v52 = (void *)v3;
  if (v3)
  {
    v4 = (void *)v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];
    }
    v51 = v5;
  }
  else
  {
    v51 = 0;
  }
  v50 = [v55 objectForKeyedSubscript:@"kAXMChartSummaryKey"];
  v6 = [v55 objectForKeyedSubscript:@"kAXMChartContentDirectionKey"];
  uint64_t v48 = [v6 integerValue];

  v7 = [v55 objectForKeyedSubscript:@"kAXMChartContentFrameKey"];
  [v7 AXMRectValue];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v54 = [v55 objectForKeyedSubscript:@"kAXMChartXAxisKey"];
  v53 = [v55 objectForKeyedSubscript:@"kAXMChartYAxisKey"];
  [v55 objectForKeyedSubscript:@"kAXMChartAdditionalAxesKey"];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (!v16)
  {
    id v18 = 0;
    v57 = 0;
    goto LABEL_20;
  }
  uint64_t v17 = v16;
  id v18 = 0;
  v57 = 0;
  uint64_t v19 = *(void *)v63;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v63 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(AXMNumericDataAxisDescriptor **)(*((void *)&v62 + 1) + 8 * i);
      v22 = [(AXMNumericDataAxisDescriptor *)v21 objectForKeyedSubscript:@"kAXMChartAxisType"];
      char v23 = [v22 isEqualToString:@"numeric"];

      if (v23)
      {
        objc_super v24 = v57;
        v25 = v18;
        v57 = v21;
      }
      else
      {
        v26 = [(AXMNumericDataAxisDescriptor *)v21 objectForKeyedSubscript:@"kAXMChartAxisType"];
        int v27 = [v26 isEqualToString:@"categorical"];

        objc_super v24 = v18;
        v25 = v21;
        if (!v27) {
          continue;
        }
      }
      v28 = v21;

      id v18 = v25;
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  }
  while (v17);
LABEL_20:
  v29 = [v55 objectForKeyedSubscript:@"kAXMChartSeriesKey"];
  v30 = [v54 objectForKeyedSubscript:@"kAXMChartAxisType"];
  [v30 isEqualToString:@"categorical"];
  v31 = (objc_class *)objc_opt_class();

  v46 = (void *)[[v31 alloc] initWithDictionary:v54];
  if (v53) {
    v47 = [[AXMNumericDataAxisDescriptor alloc] initWithDictionary:v53];
  }
  else {
    v47 = 0;
  }
  v32 = v57;
  if (v57) {
    v32 = [[AXMNumericDataAxisDescriptor alloc] initWithDictionary:v57];
  }
  if (v18) {
    v33 = [[AXMCategoricalDataAxisDescriptor alloc] initWithDictionary:v18];
  }
  else {
    v33 = 0;
  }
  v34 = [MEMORY[0x1E4F1CA48] array];
  v35 = v34;
  if (v32) {
    [v34 addObject:v32];
  }
  if (v33) {
    [v35 addObject:v33];
  }
  v45 = v32;
  v36 = [MEMORY[0x1E4F1CA48] array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v37 = v29;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v59 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = [[AXMDataSeriesDescriptor alloc] initWithDictionary:*(void *)(*((void *)&v58 + 1) + 8 * j)];
        [v36 addObject:v42];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v39);
  }

  v43 = [(AXMChartDescriptor *)self initWithAttributedTitle:v51 summary:v50 xAxisDescriptor:v46 yAxisDescriptor:v47 additionalAxes:v35 series:v36];
  [(AXMChartDescriptor *)v43 setContentDirection:v48];
  -[AXMChartDescriptor setContentFrame:](v43, "setContentFrame:", v9, v11, v13, v15);

  return v43;
}

- (void)_commonInitWithSummary:(id)a3 xAxisDescriptor:(id)a4 yAxisDescriptor:(id)a5 additionalAxes:(id)a6 series:(id)a7
{
  double v12 = (AXMDataAxisDescriptor *)a4;
  double v13 = (AXMNumericDataAxisDescriptor *)a5;
  id v14 = a7;
  id v15 = a6;
  uint64_t v16 = (NSString *)[a3 copy];
  summary = self->_summary;
  self->_summary = v16;

  xAxis = self->_xAxis;
  self->_xAxis = v12;
  v25 = v12;

  yAxis = self->_yAxis;
  self->_yAxis = v13;
  id v20 = v13;

  uint64_t v21 = (NSArray *)[v15 copy];
  additionalAxes = self->_additionalAxes;
  self->_additionalAxes = v21;

  char v23 = (NSArray *)[v14 copy];
  series = self->_series;
  self->_series = v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[AXMChartDescriptor allocWithZone:a3];
  id v5 = [(AXMChartDescriptor *)self attributedTitle];
  v6 = [(AXMChartDescriptor *)self summary];
  v7 = [(AXMChartDescriptor *)self xAxis];
  double v8 = [(AXMChartDescriptor *)self yAxis];
  double v9 = [(AXMChartDescriptor *)self additionalAxes];
  double v10 = [(AXMChartDescriptor *)self series];
  double v11 = [(AXMChartDescriptor *)v4 initWithAttributedTitle:v5 summary:v6 xAxisDescriptor:v7 yAxisDescriptor:v8 additionalAxes:v9 series:v10];

  return v11;
}

- (NSString)title
{
  v2 = [(AXMChartDescriptor *)self attributedTitle];
  uint64_t v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v4 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
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
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(AXMChartDescriptor *)self xAxis];
  v25 = [v4 dictionaryRepresentation];

  id v5 = [(AXMChartDescriptor *)self yAxis];
  id v6 = [v5 dictionaryRepresentation];

  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v8 = [(AXMChartDescriptor *)self additionalAxes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dictionaryRepresentation];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  id v14 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = [(AXMChartDescriptor *)self series];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v26 + 1) + 8 * j) dictionaryRepresentation];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }

  uint64_t v21 = [(AXMChartDescriptor *)self title];
  [v3 setObject:v21 forKeyedSubscript:@"kAXMChartTitleKey"];

  v22 = [(AXMChartDescriptor *)self summary];
  [v3 setObject:v22 forKeyedSubscript:@"kAXMChartSummaryKey"];

  char v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXMChartDescriptor contentDirection](self, "contentDirection"));
  [v3 setObject:v23 forKeyedSubscript:@"kAXMChartContentDirectionKey"];

  [v3 setObject:v25 forKeyedSubscript:@"kAXMChartXAxisKey"];
  [v3 setObject:v6 forKeyedSubscript:@"kAXMChartYAxisKey"];
  [v3 setObject:v7 forKeyedSubscript:@"kAXMChartAdditionalAxesKey"];
  [v3 setObject:v14 forKeyedSubscript:@"kAXMChartSeriesKey"];

  return v3;
}

- (NSString)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(AXMChartDescriptor *)self xAxis];
  [v3 addObject:v4];

  id v5 = [(AXMChartDescriptor *)self yAxis];

  if (v5)
  {
    id v6 = [(AXMChartDescriptor *)self yAxis];
    [v3 addObject:v6];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = [(AXMChartDescriptor *)self additionalAxes];
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

  double v12 = NSString;
  uint64_t v13 = objc_opt_class();
  id v14 = [(AXMChartDescriptor *)self title];
  id v15 = [(AXMChartDescriptor *)self summary];
  uint64_t v16 = [(AXMChartDescriptor *)self series];
  uint64_t v17 = [v12 stringWithFormat:@"<%@ %p\n\ttitle=%@\n\tsummary=%@\n\tAxes:\n\t%@Series:\n\t%@>", v13, self, v14, v15, v3, v16];

  return (NSString *)v17;
}

- (void)generateDataSummariesWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(AXMChartDescriptor *)self series];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        uint64_t v10 = [[AXMDataSummary alloc] initWithSeries:v9 chartDescriptor:self];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __58__AXMChartDescriptor_generateDataSummariesWithCompletion___block_invoke;
        v11[3] = &unk_1E6118728;
        uint64_t v13 = v18;
        v11[4] = self;
        id v12 = v4;
        [(AXMDataSummary *)v10 computeRegressionModel:v11];
        [v9 setDataSummary:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(v18, 8);
}

void __58__AXMChartDescriptor_generateDataSummariesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v5 = [*(id *)(a1 + 32) series];
  if (v2 == [v5 count])
  {
    uint64_t v3 = *(void *)(a1 + 40);

    if (v3)
    {
      id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v4();
    }
  }
  else
  {
  }
}

- (AXMNumericDataAxisDescriptor)timeNumericAxisDescriptor
{
  uint64_t v3 = self->_timeNumericAxisDescriptor;
  if (!v3)
  {
    id v4 = [(AXMChartDescriptor *)self xAxis];
    char v5 = [v4 isCategoricalAxis];

    if (v5)
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = [(AXMChartDescriptor *)self xAxis];
    }
  }

  return v3;
}

- (AXMCategoricalDataAxisDescriptor)timeCategoricalAxisDescriptor
{
  uint64_t v3 = self->_timeCategoricalAxisDescriptor;
  if (!v3)
  {
    id v4 = [(AXMChartDescriptor *)self xAxis];
    int v5 = [v4 isCategoricalAxis];

    if (v5)
    {
      uint64_t v3 = [(AXMChartDescriptor *)self xAxis];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }

  return v3;
}

- (AXMNumericDataAxisDescriptor)pitchAxisDescriptor
{
  pitchAxisDescriptor = self->_pitchAxisDescriptor;
  if (pitchAxisDescriptor)
  {
    uint64_t v3 = pitchAxisDescriptor;
  }
  else
  {
    uint64_t v3 = [(AXMChartDescriptor *)self yAxis];
  }

  return v3;
}

- (AXMNumericDataAxisDescriptor)durationAxisDescriptor
{
  durationAxisDescriptor = self->_durationAxisDescriptor;
  if (durationAxisDescriptor)
  {
    uint64_t v3 = durationAxisDescriptor;
  }
  else
  {
    uint64_t v3 = [(AXMChartDescriptor *)self zNumericAxisDescriptor];
  }

  return v3;
}

- (AXMNumericDataAxisDescriptor)volumeAxisDescriptor
{
  volumeAxisDescriptor = self->_volumeAxisDescriptor;
  if (volumeAxisDescriptor)
  {
    uint64_t v3 = volumeAxisDescriptor;
  }
  else
  {
    uint64_t v3 = [(AXMChartDescriptor *)self zNumericAxisDescriptor];
  }

  return v3;
}

- (AXMCategoricalDataAxisDescriptor)timbreAxisDescriptor
{
  timbreAxisDescriptor = self->_timbreAxisDescriptor;
  if (timbreAxisDescriptor)
  {
    uint64_t v3 = timbreAxisDescriptor;
  }
  else
  {
    uint64_t v3 = [(AXMChartDescriptor *)self zCategoricalAxisDescriptor];
  }

  return v3;
}

- (id)zNumericAxisDescriptor
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(AXMChartDescriptor *)self additionalAxes];
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
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (![v6 isCategoricalAxis])
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

- (id)zCategoricalAxisDescriptor
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(AXMChartDescriptor *)self additionalAxes];
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
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isCategoricalAxis])
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

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (int64_t)contentDirection
{
  return self->_contentDirection;
}

- (void)setContentDirection:(int64_t)a3
{
  self->_contentDirection = a3;
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

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (NSArray)series
{
  return self->_series;
}

- (void)setSeries:(id)a3
{
}

- (AXMDataAxisDescriptor)xAxis
{
  return self->_xAxis;
}

- (void)setXAxis:(id)a3
{
}

- (AXMNumericDataAxisDescriptor)yAxis
{
  return self->_yAxis;
}

- (void)setYAxis:(id)a3
{
}

- (NSArray)additionalAxes
{
  return self->_additionalAxes;
}

- (void)setAdditionalAxes:(id)a3
{
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_additionalAxes, 0);
  objc_storeStrong((id *)&self->_yAxis, 0);
  objc_storeStrong((id *)&self->_xAxis, 0);
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_timbreAxisDescriptor, 0);
  objc_storeStrong((id *)&self->_volumeAxisDescriptor, 0);
  objc_storeStrong((id *)&self->_durationAxisDescriptor, 0);
  objc_storeStrong((id *)&self->_pitchAxisDescriptor, 0);
  objc_storeStrong((id *)&self->_timeCategoricalAxisDescriptor, 0);

  objc_storeStrong((id *)&self->_timeNumericAxisDescriptor, 0);
}

@end