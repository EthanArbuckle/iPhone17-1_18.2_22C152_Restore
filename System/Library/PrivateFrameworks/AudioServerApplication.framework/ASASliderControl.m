@interface ASASliderControl
- (_ASASliderRange)range;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (unsigned)value;
- (void)setValue:(unsigned int)a3;
@end

@implementation ASASliderControl

- (void)setValue:(unsigned int)a3
{
  unsigned int v4 = a3;
  if (![(ASAObject *)self setMainGlobalProperty:1935962742 withData:&v4 ofSize:4 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not set value property\n", v3, 2u);
  }
}

- (unsigned)value
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1935962742 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read value property\n", v3, 2u);
  }
  return v4;
}

- (_ASASliderRange)range
{
  int v4 = 8;
  _ASASliderRange v5 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1935962738 withData:&v5 ofSize:&v4 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read range property\n", v3, 2u);
  }
  return v5;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ASASliderControl;
  id v6 = a3;
  v7 = [(ASAControl *)&v10 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  _ASASliderRange v8 = [(ASASliderControl *)self range];
  [v7 appendFormat:@"%@|    Value: %u\n", v6, -[ASASliderControl value](self, "value")];
  [v7 appendFormat:@"%@|    Range: Min %u Max %u\n", v6, v8, HIDWORD(*(unint64_t *)&v8)];

  return v7;
}

- (id)coreAudioClassName
{
  return @"AudioSliderControl";
}

@end