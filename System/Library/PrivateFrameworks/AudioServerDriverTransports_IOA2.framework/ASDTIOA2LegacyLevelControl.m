@interface ASDTIOA2LegacyLevelControl
+ (BOOL)automaticallyNotifiesObserversOfDecibelValue;
+ (BOOL)automaticallyNotifiesObserversOfScalarValue;
+ (CAVolumeCurve)volumeCurveFromControlInfo:(SEL)a3;
- (ASDTIOA2LegacyLevelControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9;
- (BOOL)changeDecibelValue:(float)a3;
- (BOOL)changeScalarValue:(float)a3;
- (BOOL)marked;
- (BOOL)synchronizeWithRegistry;
- (id).cxx_construct;
- (unsigned)userClientID;
- (void)doSetValue:(unsigned int)a3;
- (void)setDecibelValue:(float)a3;
- (void)setMarked:(BOOL)a3;
@end

@implementation ASDTIOA2LegacyLevelControl

+ (CAVolumeCurve)volumeCurveFromControlInfo:(SEL)a3
{
  v5 = (__CFDictionary *)a4;
  CAVolumeCurve::CAVolumeCurve(retstr);
  v18.var0 = v5;
  *(_WORD *)&v18.var1 = 0;
  if (v5)
  {
    CFArrayRef theArray = 0;
    __int16 v17 = 1;
    CACFDictionary::GetCACFArray(&v18, @"range map", (CACFArray *)&theArray);
    CFArrayRef v6 = theArray;
    if (theArray)
    {
      uint64_t v7 = 0;
LABEL_4:
      LODWORD(v6) = CFArrayGetCount(v6);
      while (v7 < v6)
      {
        v15.var0 = 0;
        *(_WORD *)&v15.var1 = 1;
        CACFArray::GetCACFDictionary((CACFArray *)&theArray, v7, &v15);
        if (v15.var0)
        {
          int v14 = 0;
          double v13 = 0.0;
          unsigned int v12 = 0;
          double v11 = 0.0;
          CACFDictionary::GetSInt32(&v15, @"start int value", &v14);
          CACFDictionary::GetFixed64(&v15, @"start db value", &v13);
          CACFDictionary::GetUInt32(&v15, @"integer steps", &v12);
          CACFDictionary::GetFixed64(&v15, @"db per step", &v11);
          float v8 = v13;
          float v9 = v13 + (double)v12 * v11;
          CAVolumeCurve::AddRange(retstr, v14, v12 + v14, v8, v9);
        }
        CACFDictionary::~CACFDictionary(&v15);
        uint64_t v7 = (v7 + 1);
        CFArrayRef v6 = theArray;
        if (theArray) {
          goto LABEL_4;
        }
      }
    }
    LODWORD(v15.var0) = 0;
    if (CACFDictionary::GetUInt32(&v18, @"transfer function", (unsigned int *)&v15)) {
      CAVolumeCurve::SetTransferFunction(retstr, (signed int)v15.var0);
    }
    CACFArray::~CACFArray((CACFArray *)&theArray);
  }
  CACFDictionary::~CACFDictionary(&v18);

  return result;
}

- (ASDTIOA2LegacyLevelControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a9;
  +[ASDTIOA2LegacyLevelControl volumeCurveFromControlInfo:v13];
  self->_volumeCurve.mTag = v35;
  p_pair1 = &self->_volumeCurve.mCurveMap.__tree_.__pair1_;
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&self->_volumeCurve.mCurveMap, (void *)self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_);
  CACFDictionary v15 = v37;
  self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = v36;
  self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_ = v15;
  unint64_t v16 = v38;
  self->_volumeCurve.mCurveMap.__tree_.__pair3_.__value_ = v38;
  if (v16)
  {
    v15[2] = p_pair1;
    v36 = &v37;
    v37 = 0;
    unint64_t v38 = 0;
    CACFDictionary v15 = 0;
  }
  else
  {
    self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = p_pair1;
  }
  *(_OWORD *)&self->_volumeCurve.mIsApplyingTransferFunction = v39;
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&v36, v15);
  __int16 v17 = [v13 objectForKeyedSubscript:@"value"];
  self->_rawValue = [v17 unsignedIntValue];

  CAVolumeCurve::ConvertRawToDB(&self->_volumeCurve, self->_rawValue);
  int v19 = v18;
  double MinimumDB = CAVolumeCurve::GetMinimumDB(&self->_volumeCurve);
  int v21 = LODWORD(MinimumDB);
  double MaximumDB = CAVolumeCurve::GetMaximumDB(&self->_volumeCurve);
  int v23 = LODWORD(MaximumDB);
  v24 = [v12 plugin];
  v34.receiver = self;
  v34.super_class = (Class)ASDTIOA2LegacyLevelControl;
  LODWORD(v25) = v19;
  LODWORD(v26) = v21;
  LODWORD(v27) = v23;
  v28 = [(ASDLevelControl *)&v34 initWithDecibelValue:v9 minimumValue:a6 maximumValue:a7 isSettable:v24 forElement:a8 inScope:v25 withPlugin:v26 andObjectClassID:v27];

  if (v28)
  {
    objc_storeStrong((id *)&v28->_ioa2Device, a3);
    v28->_userClientID = a4;
  }

  return v28;
}

- (BOOL)synchronizeWithRegistry
{
  ioa2Device = self->_ioa2Device;
  if (ioa2Device)
  {
    [(ASDTIOA2LegacyDevice *)ioa2Device scopedLock];
    ioa2Device = self->_ioa2Device;
  }
  else
  {
    CACFDictionary v15 = 0;
    uint64_t v16 = 0;
  }
  v4 = [(ASDTIOA2LegacyDevice *)ioa2Device _controlDictionaryForControl:self->_userClientID];
  if (v4)
  {
    +[ASDTIOA2LegacyLevelControl volumeCurveFromControlInfo:v4];
    self->_volumeCurve.mTag = v10;
    p_pair1 = &self->_volumeCurve.mCurveMap.__tree_.__pair1_;
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&self->_volumeCurve.mCurveMap, (void *)self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_);
    CFArrayRef v6 = v12;
    self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = v11;
    self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_ = v6;
    unint64_t v7 = v13;
    self->_volumeCurve.mCurveMap.__tree_.__pair3_.__value_ = v13;
    if (v7)
    {
      v6[2] = p_pair1;
      double v11 = &v12;
      id v12 = 0;
      unint64_t v13 = 0;
      CFArrayRef v6 = 0;
    }
    else
    {
      self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = p_pair1;
    }
    *(_OWORD *)&self->_volumeCurve.mIsApplyingTransferFunction = v14;
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&v11, v6);
    float v8 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v15);
      [(ASDTIOA2LegacyLevelControl *)self pushValue:[v8 unsignedIntValue]];
    }
  }
  else
  {
    float v8 = ASDTIOA2LogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_248A1B000, v8, OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", (uint8_t *)&v10, 2u);
    }
  }

  if ((_BYTE)v16) {
    std::recursive_mutex::unlock(v15);
  }
  return v4 != 0;
}

- (BOOL)changeDecibelValue:(float)a3
{
  return 1;
}

- (void)doSetValue:(unsigned int)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (self->_rawValue != a3)
  {
    self->_rawValue = a3;
    v5 = NSStringFromSelector(sel_decibelValue);
    [(ASDTIOA2LegacyLevelControl *)self willChangeValueForKey:v5];

    CFArrayRef v6 = NSStringFromSelector(sel_scalarValue);
    [(ASDTIOA2LegacyLevelControl *)self willChangeValueForKey:v6];

    CAVolumeCurve::ConvertRawToDB(&self->_volumeCurve, a3);
    v15.receiver = self;
    v15.super_class = (Class)ASDTIOA2LegacyLevelControl;
    -[ASDLevelControl setDecibelValue:](&v15, sel_setDecibelValue_);
    unint64_t v7 = NSStringFromSelector(sel_decibelValue);
    [(ASDTIOA2LegacyLevelControl *)self didChangeValueForKey:v7];

    float v8 = NSStringFromSelector(sel_scalarValue);
    [(ASDTIOA2LegacyLevelControl *)self didChangeValueForKey:v8];

    BOOL v9 = ASDTIOA2LogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [(ASDAudioDevice *)self->_ioa2Device deviceUID];
      if ([(ASDTIOA2LegacyLevelControl *)self objectClass] >> 29
        && [(ASDTIOA2LegacyLevelControl *)self objectClass] >> 24 <= 0x7E)
      {
        unsigned int v11 = [(ASDTIOA2LegacyLevelControl *)self objectClass] >> 24;
      }
      else
      {
        unsigned int v11 = 32;
      }
      if (([(ASDTIOA2LegacyLevelControl *)self objectClass] & 0xE00000) != 0
        && ([(ASDTIOA2LegacyLevelControl *)self objectClass] >> 16) <= 0x7Eu)
      {
        int v12 = ([(ASDTIOA2LegacyLevelControl *)self objectClass] >> 16);
      }
      else
      {
        int v12 = 32;
      }
      if (([(ASDTIOA2LegacyLevelControl *)self objectClass] & 0xE000) != 0
        && ((unsigned __int16)[(ASDTIOA2LegacyLevelControl *)self objectClass] >> 8) <= 0x7Eu)
      {
        int v13 = ((unsigned __int16)[(ASDTIOA2LegacyLevelControl *)self objectClass] >> 8);
      }
      else
      {
        int v13 = 32;
      }
      if (([(ASDTIOA2LegacyLevelControl *)self objectClass] & 0xE0) != 0
        && [(ASDTIOA2LegacyLevelControl *)self objectClass] <= 0x7Eu)
      {
        int v14 = [(ASDTIOA2LegacyLevelControl *)self objectClass];
      }
      else
      {
        int v14 = 32;
      }
      *(_DWORD *)buf = 138413570;
      __int16 v17 = v10;
      __int16 v18 = 1024;
      unsigned int v19 = v11;
      __int16 v20 = 1024;
      int v21 = v12;
      __int16 v22 = 1024;
      int v23 = v13;
      __int16 v24 = 1024;
      int v25 = v14;
      __int16 v26 = 1024;
      unsigned int v27 = a3;
      _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);
    }
  }
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
  unsigned int v8 = CAVolumeCurve::ConvertDBToRaw(&self->_volumeCurve, a3);
  ioa2Device = self->_ioa2Device;
  if (ioa2Device)
  {
    [(ASDTIOA2LegacyDevice *)ioa2Device scopedLock];
    ioa2Device = self->_ioa2Device;
  }
  else
  {
    CFArrayRef v6 = 0;
    uint64_t v7 = 0;
  }
  BOOL v5 = [(ASDTIOA2LegacyDevice *)ioa2Device _setControlValue:&v8 forControl:self->_userClientID];
  std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v6);
  if (v5) {
    [(ASDTIOA2LegacyLevelControl *)self doSetValue:v8];
  }
  if ((_BYTE)v7) {
    std::recursive_mutex::unlock(v6);
  }
}

- (BOOL)changeScalarValue:(float)a3
{
  CAVolumeCurve::ConvertScalarToDB(&self->_volumeCurve, a3);
  return -[ASDTIOA2LegacyLevelControl changeDecibelValue:](self, "changeDecibelValue:");
}

- (BOOL)marked
{
  return self->marked;
}

- (void)setMarked:(BOOL)a3
{
  self->marked = a3;
}

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&self->_volumeCurve.mCurveMap, (void *)self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_ioa2Device, 0);
}

- (id).cxx_construct
{
  return self;
}

@end