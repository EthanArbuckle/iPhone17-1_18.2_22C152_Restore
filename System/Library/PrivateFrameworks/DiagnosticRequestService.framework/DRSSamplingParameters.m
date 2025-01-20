@interface DRSSamplingParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSamplingParameters:(id)a3;
- (DRSSamplingParameters)initWithJSONDict:(id)a3;
- (DRSSamplingParameters)initWithSamplingPercentage:(double)a3;
- (double)samplingPercentage;
- (id)debugDescription;
- (id)jsonDictRepresentation;
@end

@implementation DRSSamplingParameters

- (DRSSamplingParameters)initWithSamplingPercentage:(double)a3
{
  v4 = self;
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3 < 0.0)
  {
    v5 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      double v12 = a3;
      v6 = "Invalid sampling < 0%% (%f)";
LABEL_7:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SamplingParameterFailedInit", v6, buf, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (a3 > 100.0)
  {
    v5 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      double v12 = a3;
      v6 = "Invalid sampling > 100%% (%f)";
      goto LABEL_7;
    }
LABEL_8:

    v7 = 0;
    goto LABEL_12;
  }
  v10.receiver = self;
  v10.super_class = (Class)DRSSamplingParameters;
  v8 = [(DRSSamplingParameters *)&v10 init];
  if (v8) {
    v8->_samplingPercentage = a3;
  }
  v4 = v8;
  v7 = v4;
LABEL_12:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(DRSSamplingParameters *)self isEqualToSamplingParameters:v4];

  return v5;
}

- (BOOL)isEqualToSamplingParameters:(id)a3
{
  id v4 = (DRSSamplingParameters *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4)
  {
    [(DRSSamplingParameters *)v4 samplingPercentage];
    double v7 = v6;
    [(DRSSamplingParameters *)self samplingPercentage];
    BOOL v9 = v7 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (DRSSamplingParameters)initWithJSONDict:(id)a3
{
  if (!a3)
  {
    id v4 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SamplingParameterFailedJSONInit", "nil JSON dict", buf, 2u);
    }
    goto LABEL_13;
  }
  id v4 = [a3 objectForKeyedSubscript:@"samplingPercentage"];
  if (!v4)
  {
    double v6 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v6))
    {
      __int16 v11 = 0;
      double v7 = "JSON missing sampling percentage";
      double v8 = (uint8_t *)&v11;
LABEL_11:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SamplingParameterFailedJSONInit", v7, v8, 2u);
    }
LABEL_12:

LABEL_13:
    BOOL v5 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v6 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v6))
    {
      __int16 v10 = 0;
      double v7 = "Sampling percentage is wrong class";
      double v8 = (uint8_t *)&v10;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  [v4 doubleValue];
  self = -[DRSSamplingParameters initWithSamplingPercentage:](self, "initWithSamplingPercentage:");
  BOOL v5 = self;
LABEL_14:

  return v5;
}

- (id)jsonDictRepresentation
{
  v7[1] = *MEMORY[0x263EF8340];
  double v6 = @"samplingPercentage";
  v2 = NSNumber;
  [(DRSSamplingParameters *)self samplingPercentage];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  v7[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (id)debugDescription
{
  v2 = [(DRSSamplingParameters *)self jsonDictRepresentation];
  v3 = [v2 description];

  return v3;
}

- (double)samplingPercentage
{
  return self->_samplingPercentage;
}

@end