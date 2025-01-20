@interface ASABooleanControl
- (BOOL)value;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (void)setValue:(BOOL)a3;
@end

@implementation ASABooleanControl

- (void)setValue:(BOOL)a3
{
  BOOL v4 = a3;
  if (![(ASAObject *)self setMainGlobalProperty:1650685548 withData:&v4 ofSize:4 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not set value property", v3, 2u);
  }
}

- (BOOL)value
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1650685548 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read value property\n", v3, 2u);
  }
  return v4 != 0;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASABooleanControl;
  id v6 = a3;
  v7 = [(ASAControl *)&v11 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  BOOL v8 = [(ASABooleanControl *)self value];
  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  [v7 appendFormat:@"%@|    Value: %@\n", v6, v9, v11.receiver, v11.super_class];

  return v7;
}

- (id)coreAudioClassName
{
  int v2 = [(ASAObject *)self objectClass];
  v3 = @"AudioBooleanControl";
  if (v2 <= 1885888877)
  {
    int v4 = 1819504225;
    BOOL v8 = @"AudioMuteControl";
    if (v2 != 1836414053) {
      BOOL v8 = @"AudioBooleanControl";
    }
    if (v2 == 1819504226) {
      v7 = @"AudioListenbackControl";
    }
    else {
      v7 = v8;
    }
    if (v2 == 1784767339) {
      v3 = @"AudioJackControl";
    }
    if (v2 == 1668049264) {
      v3 = @"AudioClipLightControl";
    }
  }
  else
  {
    int v4 = 1936682094;
    int v5 = @"AudioLFEMuteControl";
    id v6 = @"AudioTalkbackControl";
    if (v2 != 1952541794) {
      id v6 = @"AudioBooleanControl";
    }
    if (v2 != 1937072749) {
      int v5 = v6;
    }
    if (v2 == 1936682095) {
      v7 = @"AudioSoloControl";
    }
    else {
      v7 = v5;
    }
    if (v2 == 1885893481) {
      v3 = @"AudioInvertControl";
    }
    if (v2 == 1885888878) {
      v3 = @"AudioPhantomPowerControl";
    }
  }
  if (v2 <= v4) {
    return v3;
  }
  else {
    return v7;
  }
}

@end