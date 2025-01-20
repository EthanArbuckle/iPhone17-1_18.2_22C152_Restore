@interface ASAControl
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (unsigned)controlElement;
- (unsigned)controlScope;
@end

@implementation ASAControl

- (unsigned)controlElement
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainInputProperty:1667591277 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read control element property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)controlScope
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainOutputProperty:1668506480 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read control scope property\n", v3, 2u);
  }
  return v4;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ASAControl;
  id v6 = a3;
  v7 = [(ASAObject *)&v21 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  int v8 = [(ASAControl *)self controlScope];
  LODWORD(v9) = v8 >> 24;
  if ((v8 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v9 = 32;
  }
  else {
    uint64_t v9 = v9;
  }
  LODWORD(v10) = v8 << 8 >> 24;
  if (((v8 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v10 = 32;
  }
  else {
    uint64_t v10 = v10;
  }
  LODWORD(v11) = (__int16)v8 >> 8;
  if (((v8 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v11 = 32;
  }
  else {
    uint64_t v11 = v11;
  }
  if (v8 << 24 == 2130706432 || v8 << 24 < 520093697) {
    uint64_t v13 = 32;
  }
  else {
    uint64_t v13 = (char)v8;
  }
  [v7 appendFormat:@"%@|    Control Scope: %c%c%c%c\n", v6, v9, v10, v11, v13];
  int v14 = [(ASAControl *)self controlElement];
  LODWORD(v15) = v14 >> 24;
  if ((v14 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v15 = 32;
  }
  else {
    uint64_t v15 = v15;
  }
  LODWORD(v16) = v14 << 8 >> 24;
  if (((v14 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v16 = 32;
  }
  else {
    uint64_t v16 = v16;
  }
  LODWORD(v17) = (__int16)v14 >> 8;
  if (((v14 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v17 = 32;
  }
  else {
    uint64_t v17 = v17;
  }
  if (v14 << 24 == 2130706432 || v14 << 24 < 520093697) {
    uint64_t v19 = 32;
  }
  else {
    uint64_t v19 = (char)v14;
  }
  [v7 appendFormat:@"%@|    Control Element: %c%c%c%c\n", v6, v15, v16, v17, v19];

  return v7;
}

- (id)coreAudioClassName
{
  return @"AudioControl";
}

@end