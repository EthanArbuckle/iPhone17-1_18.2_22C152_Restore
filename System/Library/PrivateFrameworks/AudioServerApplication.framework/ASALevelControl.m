@interface ASALevelControl
- (AudioValueRange)decibelRange;
- (float)decibelFromScalar:(float)a3;
- (float)decibelValue;
- (float)maximumDecibelValue;
- (float)minimumDecibelValue;
- (float)scalarFromDecibel:(float)a3;
- (float)scalarValue;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (void)setDecibelValue:(float)a3;
- (void)setScalarValue:(float)a3;
@end

@implementation ASALevelControl

- (void)setScalarValue:(float)a3
{
  float v4 = a3;
  if (![(ASAObject *)self setMainGlobalProperty:1818456950 withData:&v4 ofSize:4 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not set scalar value property\n", v3, 2u);
  }
}

- (float)scalarValue
{
  int v5 = 4;
  float v4 = 0.0;
  if (![(ASAObject *)self getMainGlobalProperty:1818456950 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read current item property\n", v3, 2u);
  }
  return v4;
}

- (void)setDecibelValue:(float)a3
{
  float v4 = a3;
  if (![(ASAObject *)self setMainGlobalProperty:1818453110 withData:&v4 ofSize:4 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not set decibel value property\n", v3, 2u);
  }
}

- (float)decibelValue
{
  int v5 = 4;
  float v4 = 0.0;
  if (![(ASAObject *)self getMainGlobalProperty:1818453110 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read current item property\n", v3, 2u);
  }
  return v4;
}

- (float)minimumDecibelValue
{
  [(ASALevelControl *)self decibelRange];
  return v2;
}

- (float)maximumDecibelValue
{
  [(ASALevelControl *)self decibelRange];
  return v2;
}

- (AudioValueRange)decibelRange
{
  int v5 = 16;
  double v6 = 0.0;
  double v7 = 0.0;
  if (![(ASAObject *)self getMainGlobalProperty:1818453106 withData:&v6 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read decibel range property\n", v4, 2u);
  }
  double v2 = v6;
  double v3 = v7;
  result.mMaximum = v3;
  result.mMinimum = v2;
  return result;
}

- (float)scalarFromDecibel:(float)a3
{
  float v7 = a3;
  float v5 = 0.0;
  int v6 = 4;
  if (![(ASAObject *)self getMainGlobalProperty:1818453107 withData:&v5 ofSize:&v6 withQualifier:&v7 ofSize:4]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read decibel to scalar property\n", v4, 2u);
  }
  return v5;
}

- (float)decibelFromScalar:(float)a3
{
  float v7 = a3;
  float v5 = 0.0;
  int v6 = 4;
  if (![(ASAObject *)self getMainGlobalProperty:1818456932 withData:&v5 ofSize:&v6 withQualifier:&v7 ofSize:4]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read scalar to decibel property\n", v4, 2u);
  }
  return v5;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASALevelControl;
  id v6 = a3;
  float v7 = [(ASAControl *)&v14 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  [(ASALevelControl *)self scalarValue];
  [v7 appendFormat:@"%@|    Scalar Value: %f\n", v6, v8];
  [(ASALevelControl *)self decibelValue];
  [v7 appendFormat:@"%@|    Decibel Value: %f\n", v6, v9];
  [(ASALevelControl *)self minimumDecibelValue];
  double v11 = v10;
  [(ASALevelControl *)self maximumDecibelValue];
  [v7 appendFormat:@"%@|    Decibel Range: Min %f Max %f\n", v6, *(void *)&v11, v12];

  return v7;
}

- (id)coreAudioClassName
{
  unsigned int v2 = [(ASAObject *)self objectClass];
  double v3 = @"AudioLevelControl";
  if (v2 == 1986817381) {
    double v3 = @"AudioVolumeControl";
  }
  if (v2 == 1937072758) {
    return @"AudioLFEVolumeControl";
  }
  else {
    return v3;
  }
}

@end