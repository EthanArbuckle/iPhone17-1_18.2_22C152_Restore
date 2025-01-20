@interface ASDTIOA2LevelControl
+ (BOOL)automaticallyNotifiesObserversOfDecibelValue;
+ (BOOL)automaticallyNotifiesObserversOfScalarValue;
+ (VolumeCurve)volumeCurveFromControlInfo:(SEL)a3;
- (ASDTIOA2Device)ioa2Device;
- (ASDTIOA2LevelControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9;
- (BOOL)changeDecibelValue:(float)a3;
- (BOOL)changeScalarValue:(float)a3;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)marked;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (BOOL)synchronizeWithRegistryDictionary:(id)a3;
- (NSArray)properties;
- (NSArray)propertySelectorInfo;
- (id).cxx_construct;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)userClientID;
- (void)dealloc;
- (void)doSetValue:(unsigned int)a3;
- (void)setDecibelValue:(float)a3;
- (void)setIoa2Device:(id)a3;
- (void)setMarked:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setUserClientID:(unsigned int)a3;
@end

@implementation ASDTIOA2LevelControl

+ (VolumeCurve)volumeCurveFromControlInfo:(SEL)a3
{
  id v5 = a4;
  ASDT::VolumeCurve::VolumeCurve((ASDT::VolumeCurve *)retstr);
  id v6 = v5;
  v7 = v6;
  if (v6) {
    CFRetain(v6);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v7);

  if (!ASDT::IOA2UserClient::SetupVolumeCurve((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)retstr, v8))
  {
    v9 = ASDTIOA2LogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ASDTIOA2LevelControl volumeCurveFromControlInfo:]((uint64_t)v7, v9);
    }
  }
  if (cf) {
    CFRelease(cf);
  }

  return result;
}

- (ASDTIOA2LevelControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  uint64_t v9 = *(void *)&a6;
  BOOL v10 = a5;
  id v12 = a3;
  id v13 = a9;
  +[ASDTIOA2LevelControl volumeCurveFromControlInfo:v13];
  self->_volumeCurve.mTag = v34;
  p_pair1 = &self->_volumeCurve.mCurveMap.__tree_.__pair1_;
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&self->_volumeCurve.mCurveMap, (void *)self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_);
  v15 = v36;
  self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = v35;
  self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_ = v15;
  unint64_t v16 = v37;
  self->_volumeCurve.mCurveMap.__tree_.__pair3_.__value_ = v37;
  if (v16)
  {
    v15[2] = p_pair1;
    v35 = &v36;
    v36 = 0;
    unint64_t v37 = 0;
    v15 = 0;
  }
  else
  {
    self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = p_pair1;
  }
  *(_OWORD *)&self->_volumeCurve.mIsApplyingTransferFunction = v38;
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&v35, v15);
  v17 = [v13 objectForKeyedSubscript:@"value"];
  self->_rawValue = [v17 unsignedIntValue];

  ASDT::VolumeCurve::ConvertRawToDB((ASDT::VolumeCurve *)&self->_volumeCurve);
  int v19 = v18;
  ASDT::VolumeCurve::GetMinimumDB((ASDT::VolumeCurve *)&self->_volumeCurve);
  int v21 = v20;
  ASDT::VolumeCurve::GetMaximumDB((ASDT::VolumeCurve *)&self->_volumeCurve);
  int v23 = v22;
  v24 = [v12 plugin];
  v33.receiver = self;
  v33.super_class = (Class)ASDTIOA2LevelControl;
  LODWORD(v25) = v19;
  LODWORD(v26) = v21;
  LODWORD(v27) = v23;
  v28 = [(ASDLevelControl *)&v33 initWithDecibelValue:v10 minimumValue:v9 maximumValue:a7 isSettable:v24 forElement:a8 inScope:v25 withPlugin:v26 andObjectClassID:v27];

  if (v28)
  {
    objc_storeWeak((id *)&v28->_ioa2Device, v12);
    v28->_userClientID = a4;
  }

  return v28;
}

- (void)dealloc
{
  [(ASDControl *)self asdtRemoveControlProperties];
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2LevelControl;
  [(ASDTIOA2LevelControl *)&v3 dealloc];
}

- (NSArray)propertySelectorInfo
{
  v22[6] = *MEMORY[0x263EF8340];
  v20[0] = @"selector";
  v20[1] = @"dataType";
  v21[0] = &unk_26FCB2118;
  v21[1] = &unk_26FCB2130;
  v2 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v22[0] = v2;
  v18[0] = @"selector";
  v18[1] = @"dataType";
  v19[0] = &unk_26FCB2148;
  v19[1] = &unk_26FCB2130;
  objc_super v3 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v22[1] = v3;
  v16[0] = @"selector";
  v16[1] = @"dataType";
  v17[0] = &unk_26FCB2160;
  v17[1] = &unk_26FCB2130;
  v4 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v22[2] = v4;
  v14[0] = @"selector";
  v14[1] = @"dataType";
  v15[0] = &unk_26FCB2178;
  v15[1] = &unk_26FCB2130;
  id v5 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v22[3] = v5;
  v12[0] = @"selector";
  v12[1] = @"dataType";
  v13[0] = &unk_26FCB2190;
  v13[1] = &unk_26FCB2130;
  id v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v22[4] = v6;
  v10[0] = @"selector";
  v10[1] = @"dataType";
  v11[0] = &unk_26FCB21A8;
  v11[1] = &unk_26FCB2130;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v22[5] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:6];

  return (NSArray *)v8;
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
    id v5 = [v4 objectForKeyedSubscript:@"property selectors"];
    BOOL v6 = [(ASDControl *)self asdtAddControlProperties:v5];

    if (v6)
    {
      v7 = [v4 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[ASDTIOA2LevelControl pushValue:](self, "pushValue:", [v7 unsignedIntValue]);
      }
    }
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_lock);
  }
  else
  {
    v8 = ASDTIOA2LogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      BOOL v10 = NSStringFromClass(v9);
      int v12 = 138412290;
      id v13 = v10;
      _os_log_impl(&dword_248A1B000, v8, OS_LOG_TYPE_DEFAULT, "%@: Couldn't synchronize with registry", (uint8_t *)&v12, 0xCu);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)changeDecibelValue:(float)a3
{
  return 1;
}

- (void)doSetValue:(unsigned int)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  if (self->_rawValue != a3)
  {
    self->_rawValue = a3;
    BOOL v6 = NSStringFromSelector(sel_decibelValue);
    [(ASDTIOA2LevelControl *)self willChangeValueForKey:v6];

    v7 = NSStringFromSelector(sel_scalarValue);
    [(ASDTIOA2LevelControl *)self willChangeValueForKey:v7];

    ASDT::VolumeCurve::ConvertRawToDB((ASDT::VolumeCurve *)&self->_volumeCurve);
    v17.receiver = self;
    v17.super_class = (Class)ASDTIOA2LevelControl;
    -[ASDLevelControl setDecibelValue:](&v17, sel_setDecibelValue_);
    [(ASDControl *)self asdtSendControlPropertyChangeNotificationAtIndex:0];
    [(ASDControl *)self asdtSendControlPropertyChangeNotificationAtIndex:1];
    v8 = NSStringFromSelector(sel_decibelValue);
    [(ASDTIOA2LevelControl *)self didChangeValueForKey:v8];

    uint64_t v9 = NSStringFromSelector(sel_scalarValue);
    [(ASDTIOA2LevelControl *)self didChangeValueForKey:v9];

    BOOL v10 = ASDTIOA2LogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
      int v12 = [WeakRetained deviceUID];
      if ([(ASDTIOA2LevelControl *)self objectClass] >> 29
        && [(ASDTIOA2LevelControl *)self objectClass] >> 24 <= 0x7E)
      {
        unsigned int v13 = [(ASDTIOA2LevelControl *)self objectClass] >> 24;
      }
      else
      {
        unsigned int v13 = 32;
      }
      if (([(ASDTIOA2LevelControl *)self objectClass] & 0xE00000) != 0
        && ([(ASDTIOA2LevelControl *)self objectClass] >> 16) <= 0x7Eu)
      {
        int v14 = ([(ASDTIOA2LevelControl *)self objectClass] >> 16);
      }
      else
      {
        int v14 = 32;
      }
      if (([(ASDTIOA2LevelControl *)self objectClass] & 0xE000) != 0
        && ((unsigned __int16)[(ASDTIOA2LevelControl *)self objectClass] >> 8) <= 0x7Eu)
      {
        int v15 = ((unsigned __int16)[(ASDTIOA2LevelControl *)self objectClass] >> 8);
      }
      else
      {
        int v15 = 32;
      }
      if (([(ASDTIOA2LevelControl *)self objectClass] & 0xE0) != 0
        && [(ASDTIOA2LevelControl *)self objectClass] <= 0x7Eu)
      {
        int v16 = [(ASDTIOA2LevelControl *)self objectClass];
      }
      else
      {
        int v16 = 32;
      }
      *(_DWORD *)buf = 138413570;
      int v19 = v12;
      __int16 v20 = 1024;
      unsigned int v21 = v13;
      __int16 v22 = 1024;
      int v23 = v14;
      __int16 v24 = 1024;
      int v25 = v15;
      __int16 v26 = 1024;
      int v27 = v16;
      __int16 v28 = 1024;
      unsigned int v29 = a3;
      _os_log_impl(&dword_248A1B000, v10, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);
    }
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
}

+ (BOOL)automaticallyNotifiesObserversOfDecibelValue
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfScalarValue
{
  return 0;
}

- (void)setDecibelValue:(float)a3
{
  unsigned int v6 = ASDT::VolumeCurve::ConvertDBToRaw((ASDT::VolumeCurve *)&self->_volumeCurve, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
  int v5 = [WeakRetained _setControlValue:&v6 forControl:self->_userClientID];

  if (v5) {
    [(ASDTIOA2LevelControl *)self doSetValue:v6];
  }
}

- (BOOL)changeScalarValue:(float)a3
{
  ASDT::VolumeCurve::ConvertScalarToDB((ASDT::VolumeCurve *)&self->_volumeCurve, a3);
  return -[ASDTIOA2LevelControl changeDecibelValue:](self, "changeDecibelValue:");
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1818457190) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)ASDTIOA2LevelControl;
  return -[ASDLevelControl hasProperty:](&v4, sel_hasProperty_);
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1818457190)
  {
    return [(ASDLevelControl *)self isSettable];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ASDTIOA2LevelControl;
    return -[ASDLevelControl isPropertySettable:](&v4, sel_isPropertySettable_);
  }
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1818457190) {
    return 4;
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOA2LevelControl;
  return -[ASDLevelControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v6, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1818457190)
  {
    BOOL v8 = 0;
    if (a6 && a7)
    {
      if (*a6 >= 4)
      {
        *(_DWORD *)a7 = self->_volumeCurve.mTransferFunction;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ASDTIOA2LevelControl;
    return -[ASDLevelControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v10, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
  }
  return v8;
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1818457190)
  {
    BOOL v8 = 0;
    if (a6 >= 4 && a7)
    {
      ASDT::VolumeCurve::SetTransferFunction((ASDT::VolumeCurve *)&self->_volumeCurve);
      return 1;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ASDTIOA2LevelControl;
    return -[ASDLevelControl setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v10, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
  }
  return v8;
}

- (BOOL)marked
{
  return self->marked;
}

- (void)setMarked:(BOOL)a3
{
  self->marked = a3;
}

- (NSArray)properties
{
  return self->properties;
}

- (void)setProperties:(id)a3
{
}

- (ASDTIOA2Device)ioa2Device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
  return (ASDTIOA2Device *)WeakRetained;
}

- (void)setIoa2Device:(id)a3
{
}

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (void)setUserClientID:(unsigned int)a3
{
  self->_userClientID = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ioa2Device);
  objc_storeStrong((id *)&self->properties, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_lock);
  left = self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_;
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&self->_volumeCurve.mCurveMap, left);
}

- (id).cxx_construct
{
  return self;
}

+ (void)volumeCurveFromControlInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_248A1B000, a2, OS_LOG_TYPE_ERROR, "ASDTIOA2LevelControl: Bad control info: %@", (uint8_t *)&v2, 0xCu);
}

@end