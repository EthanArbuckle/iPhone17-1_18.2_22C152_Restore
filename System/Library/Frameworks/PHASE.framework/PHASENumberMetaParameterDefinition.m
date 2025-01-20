@interface PHASENumberMetaParameterDefinition
+ (PHASENumberMetaParameterDefinition)new;
- (PHASENumberMetaParameterDefinition)init;
- (PHASENumberMetaParameterDefinition)initWithValue:(double)value;
- (PHASENumberMetaParameterDefinition)initWithValue:(double)value identifier:(NSString *)identifier;
- (PHASENumberMetaParameterDefinition)initWithValue:(double)value minimum:(double)minimum maximum:(double)maximum;
- (PHASENumberMetaParameterDefinition)initWithValue:(double)value minimum:(double)minimum maximum:(double)maximum identifier:(NSString *)identifier;
- (double)maximum;
- (double)minimum;
- (double)rangeMax;
- (double)rangeMin;
@end

@implementation PHASENumberMetaParameterDefinition

- (double)rangeMin
{
  return self->_minimum;
}

- (double)rangeMax
{
  return self->_maximum;
}

- (PHASENumberMetaParameterDefinition)init
{
  return 0;
}

+ (PHASENumberMetaParameterDefinition)new
{
  return 0;
}

- (PHASENumberMetaParameterDefinition)initWithValue:(double)value identifier:(NSString *)identifier
{
  v6 = identifier;
  v7 = [(PHASENumberMetaParameterDefinition *)self initWithValue:value minimum:-INFINITY maximum:INFINITY];
  v8 = v7;
  if (v7)
  {
    [(PHASEDefinition *)v7 setIdentifier:v6];
    v9 = v8;
  }

  return v8;
}

- (PHASENumberMetaParameterDefinition)initWithValue:(double)value
{
  v3 = [(PHASENumberMetaParameterDefinition *)self initWithValue:value minimum:-INFINITY maximum:INFINITY];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (PHASENumberMetaParameterDefinition)initWithValue:(double)value minimum:(double)minimum maximum:(double)maximum identifier:(NSString *)identifier
{
  v10 = identifier;
  v11 = [(PHASENumberMetaParameterDefinition *)self initWithValue:value minimum:minimum maximum:maximum];
  v12 = v11;
  if (v11)
  {
    [(PHASEDefinition *)v11 setIdentifier:v10];
    v13 = v12;
  }

  return v12;
}

- (PHASENumberMetaParameterDefinition)initWithValue:(double)value minimum:(double)minimum maximum:(double)maximum
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v9 = objc_msgSend(NSNumber, "numberWithDouble:");
  v19.receiver = self;
  v19.super_class = (Class)PHASENumberMetaParameterDefinition;
  v10 = [(PHASEMetaParameterDefinition *)&v19 initWithValue:v9];

  if (!v10) {
    goto LABEL_11;
  }
  if (minimum > maximum)
  {
    v12 = **(id **)(Phase::Logger::GetInstance(v11) + 432);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "PHASEMetaParameter.mm";
      __int16 v22 = 1024;
      int v23 = 123;
      __int16 v24 = 2048;
      double v25 = minimum;
      __int16 v26 = 2048;
      double v27 = maximum;
      v13 = "%25s:%-5d PHASENumberMetaParameterDefinition:initWithValue: was called with a minimum %f > maximum %f";
      v14 = v12;
      uint32_t v15 = 38;
LABEL_10:
      _os_log_impl(&dword_221E5E000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (value < minimum || value > maximum)
  {
    v17 = **(id **)(Phase::Logger::GetInstance(v11) + 432);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "PHASEMetaParameter.mm";
      __int16 v22 = 1024;
      int v23 = 131;
      __int16 v24 = 2048;
      double v25 = value;
      __int16 v26 = 2048;
      double v27 = minimum;
      __int16 v28 = 2048;
      double v29 = maximum;
      v13 = "%25s:%-5d PHASENumberMetaParameterDefinition:initWithValue: was called with a value %f out-of-range [%f, %f]";
      v14 = v17;
      uint32_t v15 = 48;
      goto LABEL_10;
    }
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  v10->_minimum = minimum;
  v10->_maximum = maximum;
  v16 = v10;
LABEL_12:

  return v16;
}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

@end