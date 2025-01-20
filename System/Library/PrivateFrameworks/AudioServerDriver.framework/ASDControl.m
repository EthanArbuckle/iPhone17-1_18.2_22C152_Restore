@interface ASDControl
- (ASDControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5;
- (ASDControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6;
- (ASDControl)initWithPlugin:(id)a3;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isKindOfAudioClass:(unsigned int)a3;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)driverClassName;
- (unsigned)baseClass;
- (unsigned)controlElement;
- (unsigned)controlScope;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)objectClass;
- (void)setControlElement:(unsigned int)a3;
- (void)setControlScope:(unsigned int)a3;
@end

@implementation ASDControl

- (ASDControl)initWithPlugin:(id)a3
{
  return [(ASDControl *)self initWithElement:0 inScope:1735159650 withPlugin:a3];
}

- (ASDControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  return [(ASDControl *)self initWithElement:0 inScope:1735159650 withPlugin:a5 andObjectClassID:1633907820];
}

- (ASDControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  v10.receiver = self;
  v10.super_class = (Class)ASDControl;
  result = [(ASDObject *)&v10 initWithPlugin:a5];
  if (result)
  {
    result->_controlElement = a3;
    result->_controlScope = a4;
    result->_objectClassID = a6;
  }
  return result;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1667591277 || a3->mSelector == 1668506480) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)ASDControl;
  return -[ASDObject hasProperty:](&v5, sel_hasProperty_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1667591277 || a3->mSelector == 1668506480) {
    return 4;
  }
  v7.receiver = self;
  v7.super_class = (Class)ASDControl;
  return -[ASDObject dataSizeForProperty:withQualifierSize:andQualifierData:](&v7, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL v8 = 0;
  if (a3 && a6 && a7)
  {
    if (a3->mSelector == 1667591277)
    {
      if (*a6 >= 4)
      {
        unsigned int v11 = [(ASDControl *)self controlElement];
        goto LABEL_10;
      }
    }
    else
    {
      if (a3->mSelector != 1668506480)
      {
        v13.receiver = self;
        v13.super_class = (Class)ASDControl;
        return -[ASDObject getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v13, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
      }
      if (*a6 >= 4)
      {
        unsigned int v11 = [(ASDControl *)self controlScope];
LABEL_10:
        *(_DWORD *)a7 = v11;
        *a6 = 4;
        return 1;
      }
    }
    return 0;
  }
  return v8;
}

- (unsigned)baseClass
{
  return 1633907820;
}

- (unsigned)objectClass
{
  return self->_objectClassID;
}

- (BOOL)isKindOfAudioClass:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASDControl;
  BOOL result = -[ASDObject isKindOfAudioClass:](&v5, sel_isKindOfAudioClass_);
  if (a3 == 1633907820) {
    return 1;
  }
  return result;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ASDControl;
  id v6 = a3;
  objc_super v7 = [(ASDObject *)&v21 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  int v8 = [(ASDControl *)self controlScope];
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
  int v14 = [(ASDControl *)self controlElement];
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

- (id)driverClassName
{
  return @"AudioControl";
}

- (unsigned)controlElement
{
  return self->_controlElement;
}

- (void)setControlElement:(unsigned int)a3
{
  self->_controlElement = a3;
}

- (unsigned)controlScope
{
  return self->_controlScope;
}

- (void)setControlScope:(unsigned int)a3
{
  self->_controlScope = a3;
}

@end