@interface ASAStereoPanControl
- (float)value;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (unsigned)getPanChannel:(BOOL)a3;
- (unsigned)leftPanChannel;
- (unsigned)rightPanChannel;
- (void)setValue:(float)a3;
@end

@implementation ASAStereoPanControl

- (void)setValue:(float)a3
{
  float v4 = a3;
  if (![(ASAObject *)self setMainGlobalProperty:1936745334 withData:&v4 ofSize:4 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not set value property\n", v3, 2u);
  }
}

- (float)value
{
  int v5 = 4;
  float v4 = 0.0;
  if (![(ASAObject *)self getMainGlobalProperty:1936745334 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read value property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)getPanChannel:(BOOL)a3
{
  BOOL v3 = a3;
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = 0;
  int v6 = 8;
  if (![(ASAObject *)self getMainGlobalProperty:1936745315 withData:v7 ofSize:&v6 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read panning channels property\n", v5, 2u);
  }
  return *(_DWORD *)((unint64_t)v7 | (4 * !v3));
}

- (unsigned)leftPanChannel
{
  return [(ASAStereoPanControl *)self getPanChannel:1];
}

- (unsigned)rightPanChannel
{
  return [(ASAStereoPanControl *)self getPanChannel:0];
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ASAStereoPanControl;
  id v6 = a3;
  v7 = [(ASAControl *)&v10 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  [(ASAStereoPanControl *)self value];
  [v7 appendFormat:@"%@|    Value: %f\n", v6, v8, v10.receiver, v10.super_class];
  [v7 appendFormat:@"%@|    Left Pan Channel: %d\n", v6, -[ASAStereoPanControl leftPanChannel](self, "leftPanChannel")];
  [v7 appendFormat:@"%@|    Right Pan Channel: %d\n", v6, -[ASAStereoPanControl rightPanChannel](self, "rightPanChannel")];

  return v7;
}

- (id)coreAudioClassName
{
  return @"AudioStereoPanControl";
}

@end