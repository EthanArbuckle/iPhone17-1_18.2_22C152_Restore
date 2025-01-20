@interface E911LocationSelector
- (E911LocationSelector)initWithDelegate:(ImsLocationSelectorDelegate *)a3 sipStack:(shared_ptr<SipStack>)a4 updateMode:(int)a5 dispatchQueue:(dispatch_queue_s *)a6;
- (void)dealloc;
- (void)locationSelectorDidSelectLocation:(id)a3;
@end

@implementation E911LocationSelector

- (E911LocationSelector)initWithDelegate:(ImsLocationSelectorDelegate *)a3 sipStack:(shared_ptr<SipStack>)a4 updateMode:(int)a5 dispatchQueue:(dispatch_queue_s *)a6
{
  uint64_t v6 = *(void *)&a5;
  int var1 = (int)a4.var1;
  var0 = a4.var0;
  v34.receiver = self;
  v34.super_class = (Class)E911LocationSelector;
  v10 = [(E911LocationSelector *)&v34 init];
  v11 = v10;
  if (v10)
  {
    v10->_delegate = a3;
    v12 = (ImsPrefs *)SipStack::prefs(*(SipStack **)var0);
    PIDFConfidenceKey = (void **)ImsPrefs::getPIDFConfidenceKey(v12);
    v11->_confidence = ImsPrefs::intValue(v12, PIDFConfidenceKey);
    uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/LocationBundles/IPTelephonyEmergency.bundle"];
    bundle = v11->_bundle;
    v11->_bundle = (NSBundle *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1E5C0]) initForFeature:0 withUpdatesEnabled:var1 != 0];
    config = v11->_config;
    v11->_config = (CLEmergencyLocationSelectorConfig *)v16;

    [(CLEmergencyLocationSelectorConfig *)v11->_config setFirstLocationEarlyReturnEnabled:1];
    v18 = (std::__shared_weak_count *)*((void *)var0 + 1);
    v32 = *(SipStack **)var0;
    v33 = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unsigned int v19 = BambiEmergencyCallHandler::preferredLocationTimeout(&v32);
    v20 = (ImsPrefs *)SipStack::prefs(*(SipStack **)var0);
    FastEmergencyLocationEnabledKey = (void **)ImsPrefs::getFastEmergencyLocationEnabledKey(v20);
    if (ImsPrefs::BOOLValue(v20, FastEmergencyLocationEnabledKey))
    {
      double v22 = (double)v19;
    }
    else
    {
      double v23 = 0.95;
      if (var1) {
        double v23 = 0.5;
      }
      double v22 = v23 * (double)(v19 - 1);
    }
    -[CLEmergencyLocationSelectorConfig setFirstLocationTimeout:](v11->_config, "setFirstLocationTimeout:", v22, v32, v33);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    v24 = (ImsPrefs *)SipStack::prefs(*(SipStack **)var0);
    if (var1 == 1) {
      EmergencyLocationUpdateTimeSecondsKey = (void **)ImsPrefs::getEmergencyLocationUpdateTimeSecondsKey(v24);
    }
    else {
      EmergencyLocationUpdateTimeSecondsKey = (void **)ImsPrefs::getEmergencyLocationUpdateTimeSMSFixedKey(v24);
    }
    [(CLEmergencyLocationSelectorConfig *)v11->_config setLocationUpdateTimeout:(double)(int)ImsPrefs::intValue(v24, EmergencyLocationUpdateTimeSecondsKey)];
    if (var1 == 1)
    {
      v26 = (ImsPrefs *)SipStack::prefs(*(SipStack **)var0);
      EmergencyLocationUpdateTimeMinSecondsKey = (void **)ImsPrefs::getEmergencyLocationUpdateTimeMinSecondsKey(v26);
      int v28 = ImsPrefs::intValue(v26, EmergencyLocationUpdateTimeMinSecondsKey);
    }
    else
    {
      int v28 = 0;
    }
    [(CLEmergencyLocationSelectorConfig *)v11->_config setLocationUpdateMinDelay:(double)v28];
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1E5B8]) initWithConfig:v11->_config bundle:v11->_bundle delegate:v11 queue:v6];
    location = v11->_location;
    v11->_location = (CLEmergencyLocationSelector *)v29;
  }
  return v11;
}

- (void)dealloc
{
  bundle = self->_bundle;
  if (bundle)
  {
    self->_bundle = 0;
  }
  config = self->_config;
  if (config)
  {
    self->_config = 0;
  }
  self->_delegate = 0;
  location = self->_location;
  if (location)
  {
    [(CLEmergencyLocationSelector *)location stopSession];
    uint64_t v6 = self->_location;
    self->_location = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)E911LocationSelector;
  [(E911LocationSelector *)&v7 dealloc];
}

- (void)locationSelectorDidSelectLocation:(id)a3
{
  id v4 = a3;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  double v46 = 3000.0;
  uint64_t v53 = 0;
  std::string::basic_string[abi:ne180100]<0>(v42, "ims.location");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v5 = ims::debug((uint64_t)v42, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v5 + 8), (uint64_t)"updated location available", 26);
  *(unsigned char *)(v5 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v5 + 17) = 0;
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v43) < 0)
  {
    operator delete(v42[0]);
    if (!v4) {
      goto LABEL_28;
    }
  }
  else if (!v4)
  {
    goto LABEL_28;
  }
  [v4 coordinate];
  *(void *)&long long v44 = v6;
  [v4 coordinate];
  *((void *)&v44 + 1) = v7;
  [v4 horizontalAccuracy];
  *(void *)&long long v45 = v8;
  v9 = [v4 timestamp];
  [v9 timeIntervalSince1970];
  *(void *)&long long v47 = v10;

  [v4 ellipsoidalAltitude];
  uint64_t v12 = v11;
  uint64_t v39 = v11;
  [v4 verticalAccuracy];
  double v14 = v13;
  double v38 = v13;
  v42[0] = 0;
  v42[1] = 0;
  uint64_t v43 = 0;
  std::string::basic_string[abi:ne180100]<0>(v42, "invalid");
  std::string::basic_string[abi:ne180100]<0>(__p, "ims.location");
  std::string::basic_string[abi:ne180100]<0>(v36, "");
  uint64_t v15 = ims::debug((uint64_t)__p, (uint64_t)v36);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v15 + 8), (uint64_t)"selected valid location ", 24);
  *(unsigned char *)(v15 + 17) = 0;
  std::ostream::operator<<();
  *(unsigned char *)(v15 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v15 + 8), (uint64_t)", ", 2);
  *(unsigned char *)(v15 + 17) = 0;
  std::ostream::operator<<();
  *(unsigned char *)(v15 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v15 + 64))(v15, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v15 + 17) = 0;
  if (v37 < 0) {
    operator delete(v36[0]);
  }
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  if (v14 <= 0.0)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "ims.location");
    std::string::basic_string[abi:ne180100]<0>(v36, "");
    uint64_t v16 = ims::warn((uint64_t)__p, (uint64_t)v36);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v16 + 8), (uint64_t)"altitude is ", 12);
    *(unsigned char *)(v16 + 17) = 0;
    ims::detail::to_string_impl<double,std::integral_constant<BOOL,false>>::operator()();
  }
  *((void *)&v45 + 1) = v12;
  double v46 = v14;
  v35.__r_.__value_.__r.__words[0] = 0x3FF0000000000000;
  v34.__r_.__value_.__r.__words[0] = 0x3FF0000000000000;
  if (CLGetUncertaintyScaleFactors())
  {
    *(double *)&long long v45 = *(double *)&v35.__r_.__value_.__l.__data_ * *(double *)&v45;
    double v46 = *(double *)&v34.__r_.__value_.__l.__data_ * v46;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "ims.location");
  std::string::basic_string[abi:ne180100]<0>(v36, "");
  uint64_t v18 = ims::debug((uint64_t)__p, (uint64_t)v36);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v18 + 8), (uint64_t)"timestamp is : ", 15);
  *(unsigned char *)(v18 + 17) = 0;
  std::ostream::operator<<();
  *(unsigned char *)(v18 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v18 + 64))(v18, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v18 + 17) = 0;
  if (v37 < 0) {
    operator delete(v36[0]);
  }
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "ims.location");
  std::string::basic_string[abi:ne180100]<0>(v36, "");
  uint64_t v19 = ims::debug((uint64_t)__p, (uint64_t)v36);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v19 + 8), (uint64_t)"absolute timestamp is : ", 24);
  *(unsigned char *)(v19 + 17) = 0;
  [v4 trustedTimestamp];
  std::ostream::operator<<();
  *(unsigned char *)(v19 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v19 + 64))(v19, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v19 + 17) = 0;
  if (v37 < 0) {
    operator delete(v36[0]);
  }
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  [v4 trustedTimestamp];
  if (v20 > 0.0)
  {
    v21 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 trustedTimestamp];
    double v22 = objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
    [v22 timeIntervalSince1970];
    *(void *)&long long v47 = v23;
  }
  if (SHIBYTE(v43) < 0) {
    operator delete(v42[0]);
  }
LABEL_28:
  delegate = self->_delegate;
  if (delegate)
  {
    ims::LocationInfo::LocationInfo((ims::LocationInfo *)v25, (const ims::LocationInfo *)&v44);
    (*((void (**)(ImsLocationSelectorDelegate *, unsigned char *))delegate->var0 + 2))(delegate, v25);
    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(v28);
    }
    if (v27 < 0) {
      operator delete(v26);
    }
  }
  if (SHIBYTE(v53) < 0) {
    operator delete((void *)v52);
  }
  if (SHIBYTE(v51) < 0) {
    operator delete(*((void **)&v50 + 1));
  }
  if (SBYTE7(v50) < 0) {
    operator delete((void *)v49);
  }
  if (SHIBYTE(v48) < 0) {
    operator delete(*((void **)&v47 + 1));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end