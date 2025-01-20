@interface TelephonyProviderDelegate
+ (int)getTTYType:(int64_t)a3;
+ (int)sActionToType:(id)a3;
+ (int)sSenderIdentityUuidToSimSlot:(id)a3;
+ (int64_t)toCXTTYType:(int)a3;
- (BOOL)doesHeldUnHeldcallAlreadyExist:(id)a3;
- (BOOL)evaluateAndSendCallUpdateWithCallInfo:(dict)a3 previousCallInfo:(dict)a4 appendCallUpdate:(id)a5;
- (BOOL)isAVCBBTapRegistered;
- (BOOL)possiblyFulfillUnexpectedHoldCallWithProvider:(id)a3 transactions:(id)a4;
- (BOOL)possiblyFulfillUnexpectedMOStartCallWithProvider:(id)a3 transactions:(id)a4;
- (BOOL)provider:(id)a3 executeTransaction:(id)a4;
- (BOOL)shouldIncludeInCallHistory:(int)a3 phoneNumber:()basic_string<char;
- (BOOL)supportsDownlinkDtmf:(int)a3;
- (NSDictionary)extraCallInfo;
- (TelephonyProvider)provider;
- (TelephonyProviderDelegate)initWithProvider:(id)a3 registry:(const void *)a4 queue:(queue)a5;
- (basic_string<char,)getiSOCountryCodeForCurrentLocation:(std::allocator<char>> *__return_ptr)retstr;
- (id).cxx_construct;
- (id)evaluateAndCreateCallUpdateWithCallInfo:(dict)a3 previousCallInfo:(dict)a4;
- (id)evaluateAndCreateCallUpdateWithCallInfo:(dict)a3 previousCallInfo:(dict)a4 appendCallUpdate:(id)a5;
- (id)getCallCapabilitiesUpdateForCall:(id)a3 simSlot:(int)a4 isEmergency:(BOOL)a5;
- (id)registerForAVCBBTap:(BOOL)a3;
- (vector<CurrentCallInfo,)getCurrentCalls;
- (void)checkBasebandAssertions;
- (void)handleCallCapabilitiesChanged;
- (void)handleCallControlFailure:(const void *)a3;
- (void)handleCallFrequencyDataChanged;
- (void)handleCallStatusChangedWithOldCalls:(const void *)a3;
- (void)handleCallToneComplete:(const void *)a3;
- (void)handleDisambiguationEmergencyNumbersChanged;
- (void)handleDownlinkDtmfEvent:(const void *)a3 dtmf:(char)a4;
- (void)handleEmergencyNumbersChanged;
- (void)handleLastKnownHomePlmnChanged:(const void *)a3;
- (void)handleSimSubscriptionInfoChanged:(id)a3;
- (void)handleSubscriptionInfoChanged;
- (void)handleThumperAccountIdChanged;
- (void)handleThumperHandoffAvailabilityChanged;
- (void)handleThumperSubscriptionInfoChanged:(id)a3;
- (void)initialize;
- (void)provider:(id)a3 didActivateAudioSession:(id)a4;
- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4;
- (void)provider:(id)a3 performAnswerCallAction:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performPlayDTMFCallAction:(id)a4;
- (void)provider:(id)a3 performPullCallAction:(id)a4;
- (void)provider:(id)a3 performSendMMIOrUSSDCodeAction:(id)a4;
- (void)provider:(id)a3 performSetGroupCallAction:(id)a4;
- (void)provider:(id)a3 performSetHeldCallAction:(id)a4;
- (void)provider:(id)a3 performSetMutedCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performSetScreeningCallAction:(id)a4;
- (void)provider:(id)a3 performSetTTYTypeCallAction:(id)a4;
- (void)provider:(id)a3 performStartCallAction:(id)a4;
- (void)provider:(id)a3 timedOutPerformingAction:(id)a4;
- (void)providerDidReset:(id)a3;
- (void)registerForRestProperties_sync;
- (void)setExtraCallInfo:(id)a3;
- (void)setIsAVCBBTapRegistered:(BOOL)a3;
- (void)updateAudioCategory:(unsigned __int8)a3 updateToUpdate:(id)a4 apOnlyMode:(BOOL)a5 usingBaseband:(BOOL)a6;
@end

@implementation TelephonyProviderDelegate

- (TelephonyProviderDelegate)initWithProvider:(id)a3 registry:(const void *)a4 queue:(queue)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TelephonyProviderDelegate;
  v9 = [(TelephonyProviderDelegate *)&v16 init];
  if (v9)
  {
    v10 = *(dispatch_object_s **)a5.fObj.fObj;
    if (*(void *)a5.fObj.fObj) {
      dispatch_retain(*(dispatch_object_t *)a5.fObj.fObj);
    }
    fObj = v9->fQueue.fObj.fObj;
    v9->fQueue.fObj.fObj = v10;
    if (fObj) {
      dispatch_release(fObj);
    }
    v13 = *(Registry **)a4;
    uint64_t v12 = *((void *)a4 + 1);
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v9->fRegistry.__cntrl_;
    v9->fRegistry.__ptr_ = v13;
    v9->fRegistry.__cntrl_ = (__shared_weak_count *)v12;
    if (cntrl) {
      sub_10004D2C8(cntrl);
    }
    operator new();
  }

  return 0;
}

- (void)initialize
{
  fObj = self->fQueue.fObj.fObj;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006EE674;
  block[3] = &unk_101999238;
  block[4] = self;
  dispatch_async(fObj, block);
  *(void *)operator new(8uLL) = kPhoneServicesWalletDomain;
  operator new();
}

- (vector<CurrentCallInfo,)getCurrentCalls
{
  v6[0] = &self->fLock;
  v6[1] = 1;
  ctu::UnfairLock::lock((ctu::UnfairLock *)&self->fLock);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  sub_1001F1EB0(retstr, (void **)self->fCurrentCallsCopy.__begin_, (void **)self->fCurrentCallsCopy.__end_, (self->fCurrentCallsCopy.__end_ - self->fCurrentCallsCopy.__begin_) >> 3);
  return (vector<CurrentCallInfo, std::allocator<CurrentCallInfo>> *)sub_100056724((uint64_t)v6);
}

- (void)registerForRestProperties_sync
{
  v2 = self;
  sub_100058DB0(__p, "/cc/props/current_calls");
  v3 = v2;
  v40 = off_1019FD140;
  p_fCurrentCalls = &v2->fCurrentCalls;
  v42 = v3;
  v43 = &v40;
  ctu::RestModule::observeProperty();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  v4 = v3;
  sub_100058DB0(__p, "/cc/props/call_capabilities");
  p_fCallCapabilities = (property_sink_t<current_calls> *)&v4->fCallCapabilities;
  v6 = v4;
  v40 = off_1019FD1C0;
  p_fCurrentCalls = p_fCallCapabilities;
  v42 = (TelephonyProviderDelegate *)v6;
  v43 = &v40;
  ctu::RestModule::observeProperty();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  v7 = v6;
  sub_100058DB0(__p, "/cc/props/emergency_numbers");
  id v8 = (property_sink_t<current_calls> *)(v7 + 152);
  v9 = v7;
  v40 = off_1019FD240;
  p_fCurrentCalls = v8;
  v42 = (TelephonyProviderDelegate *)v9;
  v43 = &v40;
  ctu::RestModule::observeProperty();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  v10 = v9;
  sub_100058DB0(__p, "/cc/props/disambiguation_emergency_numbers");
  v11 = (property_sink_t<current_calls> *)(v10 + 176);
  uint64_t v12 = v10;
  v40 = off_1019FD2C0;
  p_fCurrentCalls = v11;
  v42 = (TelephonyProviderDelegate *)v12;
  v43 = &v40;
  ctu::RestModule::observeProperty();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  v13 = v12;
  sub_100058DB0(__p, "/cc/props/call_frequency_data");
  v14 = (property_sink_t<current_calls> *)(v13 + 224);
  v15 = v13;
  v40 = off_1019FD340;
  p_fCurrentCalls = v14;
  v42 = (TelephonyProviderDelegate *)v15;
  v43 = &v40;
  ctu::RestModule::observeProperty();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  objc_super v16 = v15;
  sub_100058DB0(__p, "/cc/props/thumper_handoff_allowed");
  v17 = (property_sink_t<current_calls> *)(v16 + 264);
  v18 = v16;
  v40 = off_1019FD3C0;
  p_fCurrentCalls = v17;
  v42 = (TelephonyProviderDelegate *)v18;
  v43 = &v40;
  ctu::RestModule::observeProperty();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  v19 = v18;
  sub_100058DB0(__p, "/cc/props/vowifi_provisioning_state");
  v20 = (property_sink_t<current_calls> *)(v19 + 288);
  v21 = v19;
  v40 = off_1019FD440;
  p_fCurrentCalls = v20;
  v42 = (TelephonyProviderDelegate *)v21;
  v43 = &v40;
  ctu::RestModule::observeProperty();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  v22 = v21;
  sub_100058DB0(__p, "/cc/events/call_control_failure");
  v23 = v22;
  v40 = off_1019FD4C0;
  p_fCurrentCalls = v23;
  v43 = &v40;
  ctu::RestModule::observeEvent();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  v24 = v23;
  sub_100058DB0(__p, "/cc/events/call_tone_complete");
  v25 = v24;
  v40 = off_1019FD540;
  p_fCurrentCalls = v25;
  v43 = &v40;
  ctu::RestModule::observeEvent();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  v26 = v25;
  sub_100058DB0(__p, "/cc/props/subscription_info");
  v27 = (property_sink_t<current_calls> *)(v26 + 320);
  v28 = v26;
  v40 = off_1019FD5C0;
  p_fCurrentCalls = v27;
  v42 = (TelephonyProviderDelegate *)v28;
  v43 = &v40;
  ctu::RestModule::observeProperty();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  v29 = v28;
  sub_100058DB0(__p, "/cc/props/last_known_home_plmn");
  v30 = (property_sink_t<current_calls> *)(v29 + 392);
  v31 = v29;
  v40 = off_1019FD640;
  p_fCurrentCalls = v30;
  v42 = (TelephonyProviderDelegate *)v31;
  v43 = &v40;
  ctu::RestModule::observeProperty();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  v32 = v31;
  sub_100058DB0(__p, "/cc/events/downlink_dtmf_complete");
  v33 = v32;
  v40 = off_1019FD6C0;
  p_fCurrentCalls = (property_sink_t<current_calls> *)v33;
  v43 = &v40;
  ctu::RestModule::observeEvent();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }

  if (capabilities::ct::supportsThumperService(v34))
  {
    v35 = v33;
    sub_100058DB0(__p, "/cc/props/active_subscriptions");
    v36 = (property_sink_t<current_calls> *)(v35 + 344);
    v37 = v35;
    v40 = off_1019FD740;
    p_fCurrentCalls = v36;
    v42 = (TelephonyProviderDelegate *)v37;
    v43 = &v40;
    ctu::RestModule::observeProperty();
    sub_10003F600(&v40);
    if (v39 < 0) {
      operator delete(__p[0]);
    }
  }
  sub_100297F24((uint64_t)(v33 + 368));
  sub_100058DB0(__p, "/cc/props/numbers_excluded_from_call_history");
  v40 = off_1019FD7C0;
  p_fCurrentCalls = (property_sink_t<current_calls> *)(v33 + 200);
  v43 = &v40;
  ctu::RestModule::observeProperty();
  sub_10003F600(&v40);
  if (v39 < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleThumperSubscriptionInfoChanged:(id)a3
{
  void (***v34)(std::string *__return_ptr, void, char *);
  char v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  __CFString *v51;
  int v52;
  TelephonyProviderDelegate *v53;
  SubscriptionContext *end;
  std::string v55;
  const void *v56;
  std::string v57;
  void *v58;
  std::string v59;
  void *v60;
  std::string v61;
  std::string __dst;
  void *v63;
  std::string __p;
  void *v65;
  void *v66;
  unsigned char buf[64];
  long long v68;
  long long v69;
  long long v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  uint64_t v75;
  long long v76;
  void v77[8];

  v50 = a3;
  begin = self->fActiveSubscriptions.fValue.fSubscriptions.__begin_;
  v53 = self;
  end = self->fActiveSubscriptions.fValue.fSubscriptions.__end_;
  while (begin != end)
  {
    if (!*(_DWORD *)begin)
    {
      v5 = (char **)((char *)begin + 8);
      v6 = (char **)((char *)begin + 56);
      v7 = (void *)((char *)begin + 88);
      v52 = *((_DWORD *)begin + 35);
      id v8 = *(NSObject **)v53->logger.__ptr_.__value_;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = subscriber::asString();
        v10 = (char *)begin + 56;
        if (*((char *)begin + 79) < 0) {
          v10 = *v6;
        }
        v11 = (char *)begin + 8;
        if (*((char *)begin + 31) < 0) {
          v11 = *v5;
        }
        uint64_t v12 = (void *)((char *)begin + 88);
        if (*((char *)begin + 111) < 0) {
          uint64_t v12 = (void *)*v7;
        }
        uint64_t v13 = asString();
        uint64_t v14 = *((unsigned __int8 *)begin + 167);
        BOOL v15 = (v14 & 0x80u) != 0;
        if ((v14 & 0x80u) != 0) {
          uint64_t v14 = *((void *)begin + 19);
        }
        if (v15) {
          objc_super v16 = (const char *)*((void *)begin + 18);
        }
        else {
          objc_super v16 = (char *)begin + 144;
        }
        BOOL v17 = v14 == 0;
        v18 = "<invalid>";
        if (!v17) {
          v18 = v16;
        }
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2080;
        *(void *)&buf[24] = v11;
        *(_WORD *)&buf[32] = 2080;
        *(void *)&buf[34] = v12;
        *(_WORD *)&buf[42] = 2080;
        *(void *)&buf[44] = v13;
        *(_WORD *)&buf[52] = 2080;
        *(void *)&buf[54] = v18;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I ACTIVE SUBSCRIPTION INFO: SIM Slot %s; SIM Label ID: %s; SIM Label: %s; SIM Phone Number: %s; Is User Pref "
          "For Voice: %s; PersonalityID: %s",
          buf,
          0x3Eu);
      }
      if (*((char *)begin + 79) < 0)
      {
        if (*((void *)begin + 8))
        {
LABEL_22:
          if (*((char *)begin + 111) < 0) {
            v7 = (void *)*v7;
          }
          v19 = +[NSString stringWithUTF8String:v7];
          if ([v19 length]) {
            id v20 = [objc_alloc((Class)CXHandle) initWithType:2 value:v19];
          }
          else {
            id v20 = 0;
          }
          if (*((char *)begin + 31) < 0)
          {
            sub_10004FC84(&__dst, *((void **)begin + 1), *((void *)begin + 2));
          }
          else
          {
            long long v21 = *(_OWORD *)v5;
            __dst.__r_.__value_.__r.__words[2] = *((void *)begin + 3);
            *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v21;
          }
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
            sub_10004FC84(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
          }
          else {
            __p = __dst;
          }
          v65 = 0;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            sub_10004FC84(buf, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else {
            *(std::string *)buf = __p;
          }
          v66 = 0;
          if (ctu::cf::convert_copy())
          {
            std::string::size_type v22 = (std::string::size_type)v65;
            v65 = v66;
            v61.__r_.__value_.__r.__words[0] = v22;
            sub_1000558F4((const void **)&v61.__r_.__value_.__l.__data_);
          }
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
          v63 = v65;
          v65 = 0;
          sub_1000558F4((const void **)&v65);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          v23 = v63;
          sub_1000558F4((const void **)&v63);
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__dst.__r_.__value_.__l.__data_);
          }
          v51 = v23;
          v24 = &stru_101AC1B28;
          if (v23) {
            v24 = v23;
          }
          v25 = v24;
          memset(&v61, 0, sizeof(v61));
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
          ServiceMap = (std::mutex *)Registry::getServiceMap(v53->fRegistry.__ptr_);
          v27 = ServiceMap;
          if (v28 < 0)
          {
            v29 = (unsigned __int8 *)(v28 & 0x7FFFFFFFFFFFFFFFLL);
            uint64_t v30 = 5381;
            do
            {
              uint64_t v28 = v30;
              unsigned int v31 = *v29++;
              uint64_t v30 = (33 * v30) ^ v31;
            }
            while (v31);
          }
          std::mutex::lock(ServiceMap);
          *(void *)buf = v28;
          v32 = sub_10004D37C(&v27[1].__m_.__sig, (unint64_t *)buf);
          if (v32)
          {
            v34 = (void (***)(std::string *__return_ptr, void, char *))v32[3];
            v33 = (std::__shared_weak_count *)v32[4];
            if (v33)
            {
              atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
              std::mutex::unlock(v27);
              atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
              sub_10004D2C8(v33);
              v35 = 0;
LABEL_54:
              (**v34)(&__p, v34, (char *)begin + 144);
              if ((v35 & 1) == 0) {
                sub_10004D2C8(v33);
              }
              if (__p.__r_.__value_.__r.__words[0])
              {
                v73 = 0u;
                v74 = 0u;
                v71 = 0u;
                v72 = 0u;
                v69 = 0u;
                v70 = 0u;
                v68 = 0u;
                memset(buf, 0, sizeof(buf));
                v75 = 1;
                v76 = 0u;
                memset(v77, 0, 56);
                if ((*(unsigned int (**)(std::string::size_type, unsigned char *))(*(void *)__p.__r_.__value_.__l.__data_
                                                                                     + 104))(__p.__r_.__value_.__r.__words[0], buf))
                {
                  std::string::operator=(&v61, (const std::string *)&v77[1]);
                }
                sub_100350940((uint64_t)buf);
              }
              if (__p.__r_.__value_.__l.__size_) {
                sub_10004D2C8((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
              }
              v60 = 0;
              if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
                sub_10004FC84(&v59, v61.__r_.__value_.__l.__data_, v61.__r_.__value_.__l.__size_);
              }
              else {
                v59 = v61;
              }
              if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
                sub_10004FC84(&__p, v59.__r_.__value_.__l.__data_, v59.__r_.__value_.__l.__size_);
              }
              else {
                __p = v59;
              }
              v63 = 0;
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                sub_10004FC84(buf, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
              }
              else {
                *(std::string *)buf = __p;
              }
              v65 = 0;
              if (ctu::cf::convert_copy())
              {
                v36 = v63;
                v63 = v65;
                v66 = v36;
                sub_1000558F4((const void **)&v66);
              }
              if ((buf[23] & 0x80000000) != 0) {
                operator delete(*(void **)buf);
              }
              v60 = v63;
              v63 = 0;
              sub_1000558F4((const void **)&v63);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v59.__r_.__value_.__l.__data_);
              }
              v37 = v60;
              v38 = *(NSObject **)v53->logger.__ptr_.__value_;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                char v39 = [&stru_101AC1B28 UTF8String];
                v40 = [(__CFString *)v51 UTF8String];
                v41 = [v37 UTF8String];
                *(_DWORD *)buf = 136315650;
                *(void *)&buf[4] = v39;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = v40;
                *(_WORD *)&buf[22] = 2080;
                *(void *)&buf[24] = v41;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "#I ACTIVE SUBSCRIPTION INFO: short label: %s; long label: %s; ISO country code: %s",
                  buf,
                  0x20u);
              }
              v58 = 0;
              if (*((char *)begin + 79) < 0)
              {
                sub_10004FC84(&v57, *((void **)begin + 7), *((void *)begin + 8));
              }
              else
              {
                *(_OWORD *)&v57.__r_.__value_.__l.__data_ = *(_OWORD *)v6;
                v57.__r_.__value_.__r.__words[2] = *((void *)begin + 9);
              }
              if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
                sub_10004FC84(&__p, v57.__r_.__value_.__l.__data_, v57.__r_.__value_.__l.__size_);
              }
              else {
                __p = v57;
              }
              v63 = 0;
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                sub_10004FC84(buf, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
              }
              else {
                *(std::string *)buf = __p;
              }
              v65 = 0;
              if (ctu::cf::convert_copy())
              {
                v42 = v63;
                v63 = v65;
                v66 = v42;
                sub_1000558F4((const void **)&v66);
              }
              if ((buf[23] & 0x80000000) != 0) {
                operator delete(*(void **)buf);
              }
              v58 = v63;
              v63 = 0;
              sub_1000558F4((const void **)&v63);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v57.__r_.__value_.__l.__data_);
              }
              v43 = v58;
              v44 = [objc_alloc((Class)NSUUID) initWithUUIDString:v43];
              v45 = [objc_alloc((Class)CXAccount) initWithUUID:v44 description:v25 serviceName:&stru_101AC1B28 isoCountryCode:v37 handle:v20 shortLabel:&stru_101AC1B28];
              v46 = objc_alloc((Class)NSUUID);
              if (*((char *)begin + 135) < 0) {
                sub_10004FC84(&v55, *((void **)begin + 14), *((void *)begin + 15));
              }
              else {
                v55 = *(std::string *)((char *)begin + 112);
              }
              if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
                sub_10004FC84(&__p, v55.__r_.__value_.__l.__data_, v55.__r_.__value_.__l.__size_);
              }
              else {
                __p = v55;
              }
              v63 = 0;
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                sub_10004FC84(buf, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
              }
              else {
                *(std::string *)buf = __p;
              }
              v65 = 0;
              if (ctu::cf::convert_copy())
              {
                v47 = v63;
                v63 = v65;
                v66 = v47;
                sub_1000558F4((const void **)&v66);
              }
              if ((buf[23] & 0x80000000) != 0) {
                operator delete(*(void **)buf);
              }
              v56 = v63;
              v63 = 0;
              sub_1000558F4((const void **)&v63);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              v48 = [v46 initWithUUIDString:v56];
              sub_1000558F4(&v56);
              if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v55.__r_.__value_.__l.__data_);
              }
              v49 = [objc_alloc((Class)CXSenderIdentity) initWithUUID:v48 account:v45];
              if (v52 == 2) {
                [v50 insertObject:v49 atIndex:0];
              }
              else {
                [v50 addObject:v49];
              }

              sub_1000558F4((const void **)&v58);
              sub_1000558F4((const void **)&v60);
              if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v61.__r_.__value_.__l.__data_);
              }

              goto LABEL_121;
            }
          }
          else
          {
            v34 = 0;
          }
          std::mutex::unlock(v27);
          v33 = 0;
          v35 = 1;
          goto LABEL_54;
        }
      }
      else if (*((unsigned char *)begin + 79))
      {
        goto LABEL_22;
      }
    }
LABEL_121:
    begin = (SubscriptionContext *)((char *)begin + 176);
  }
}

- (void)handleSimSubscriptionInfoChanged:(id)a3
{
  id v112 = a3;
  v150[0] = 0;
  uint64_t v149 = 0;
  v150[1] = 0;
  v122 = self;
  ServiceMap = (std::mutex *)Registry::getServiceMap(self->fRegistry.__ptr_);
  v5 = ServiceMap;
  if (v6 < 0)
  {
    v7 = (unsigned __int8 *)(v6 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v8 = 5381;
    do
    {
      uint64_t v6 = v8;
      unsigned int v9 = *v7++;
      uint64_t v8 = (33 * v8) ^ v9;
    }
    while (v9);
  }
  std::mutex::lock(ServiceMap);
  v140[0] = (void *)v6;
  v10 = sub_10004D37C(&v5[1].__m_.__sig, (unint64_t *)v140);
  if (v10)
  {
    uint64_t v12 = v10[3];
    v11 = (std::__shared_weak_count *)v10[4];
    if (v11)
    {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v5);
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v11);
      char v13 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  std::mutex::unlock(v5);
  v11 = 0;
  char v13 = 1;
LABEL_9:
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v12 + 312))(&v149, v12);
  uint64_t v14 = v122;
  if ((v13 & 1) == 0) {
    sub_10004D2C8(v11);
  }
  begin_node = (TelephonyProviderDelegate *)v122->fSubscriptionInfo.fValue.fSubscriptions.__tree_.__begin_node_;
  if (begin_node != (TelephonyProviderDelegate *)&v122->fSubscriptionInfo.fValue.fSubscriptions.__tree_.__pair1_)
  {
    p_pair1 = &v122->fLastKnownHomePlmn.fValue.__tree_.__pair1_;
    uint64_t v110 = kCarriersLocalizationTable;
    do
    {
      *(_OWORD *)v147 = 0u;
      long long v148 = 0u;
      *(_OWORD *)v145 = 0u;
      long long v146 = 0u;
      *(_OWORD *)v143 = 0u;
      long long v144 = 0u;
      memset(v142, 0, sizeof(v142));
      *(_OWORD *)v141 = 0u;
      memset(v140, 0, sizeof(v140));
      sub_1006F0E90((uint64_t)v140, (uint64_t)&begin_node->fRestModule);
      uint64_t v16 = LODWORD(v140[0]);
      int v123 = HIDWORD(v146);
      BOOL v17 = *(NSObject **)v14->logger.__ptr_.__value_;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = subscriber::asString();
        int v19 = SHIBYTE(v142[3]);
        id v20 = (void **)v142[1];
        int v21 = SHIBYTE(v140[3]);
        std::string::size_type v22 = (void **)v140[1];
        int v23 = SHIBYTE(v144);
        v24 = (void **)v143[1];
        uint64_t v25 = asString();
        v26 = &v143[1];
        if (v23 < 0) {
          v26 = v24;
        }
        uint64_t v28 = &v142[1];
        v27 = &v140[1];
        if (v21 < 0) {
          v27 = v22;
        }
        v29 = (void *)BYTE7(v148);
        if (v19 < 0) {
          uint64_t v28 = v20;
        }
        if (SBYTE7(v148) < 0) {
          v29 = v147[1];
        }
        uint64_t v30 = v147;
        if (SBYTE7(v148) < 0) {
          uint64_t v30 = (void **)v147[0];
        }
        BOOL v31 = v29 == 0;
        *(_DWORD *)buf = 136316930;
        v32 = "<invalid>";
        if (!v31) {
          v32 = (const char *)v30;
        }
        *(void *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2080;
        v157 = v27;
        __int16 v158 = 2080;
        v159 = v26;
        __int16 v160 = 2080;
        uint64_t v161 = v25;
        __int16 v162 = 1024;
        int v163 = BYTE8(v148);
        __int16 v164 = 1024;
        int v165 = BYTE10(v148);
        __int16 v166 = 2080;
        v167 = v32;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I SUBSCRIPTION INFO: SIM Slot %s; SIM Label ID: %s; SIM Label: %s; SIM Phone Number: %s; Is User Pref For Voi"
          "ce: %s; Sim Present: %d; SimHidden: %d; PersonalityID: %s",
          buf,
          0x4Au);
        uint64_t v14 = v122;
      }
      v33 = (void *)HIBYTE(v142[3]);
      if (SHIBYTE(v142[3]) < 0) {
        v33 = v142[2];
      }
      if (!v33) {
        goto LABEL_197;
      }
      v34 = (void *)HIBYTE(v140[3]);
      if (SHIBYTE(v140[3]) < 0) {
        v34 = v140[2];
      }
      if (!v34 || !BYTE8(v148) || BYTE10(v148)) {
        goto LABEL_197;
      }
      if (v144 >= 0) {
        v35 = &v143[1];
      }
      else {
        v35 = (void **)v143[1];
      }
      v36 = +[NSString stringWithUTF8String:v35];
      if ([v36 length]) {
        id v117 = [objc_alloc((Class)CXHandle) initWithType:2 value:v36];
      }
      else {
        id v117 = 0;
      }
      if (SHIBYTE(v140[3]) < 0)
      {
        sub_10004FC84(__dst, v140[1], (unint64_t)v140[2]);
      }
      else
      {
        *(_OWORD *)__dst = *(_OWORD *)&v140[1];
        v139 = v140[3];
      }
      if (SHIBYTE(v139) < 0)
      {
        sub_10004FC84(__p, __dst[0], (unint64_t)__dst[1]);
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)__dst;
        *(void *)&long long v137 = v139;
      }
      v154 = 0;
      if (SBYTE7(v137) < 0)
      {
        sub_10004FC84(buf, __p[0], (unint64_t)__p[1]);
      }
      else
      {
        *(_OWORD *)buf = *(_OWORD *)__p;
        *(void *)&buf[16] = v137;
      }
      v155 = 0;
      if (ctu::cf::convert_copy())
      {
        v37 = v154;
        v154 = v155;
        *(void *)&long long v152 = v37;
        sub_1000558F4((const void **)&v152);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      v151 = (void *)v154;
      v154 = 0;
      sub_1000558F4(&v154);
      if (SBYTE7(v137) < 0) {
        operator delete(__p[0]);
      }
      v38 = v151;
      sub_1000558F4((const void **)&v151);
      if (SHIBYTE(v139) < 0) {
        operator delete(__dst[0]);
      }
      if (v38) {
        char v39 = v38;
      }
      else {
        char v39 = &stru_101AC1B28;
      }
      v118 = v39;
      v40 = v150[0];
      if (v150[0])
      {
        v41 = v150;
        do
        {
          v42 = v40;
          v43 = v41;
          int v44 = *((_DWORD *)v40 + 8);
          if (v44 >= (int)v16) {
            v41 = (const void ***)v40;
          }
          else {
            ++v40;
          }
          v40 = (const void **)*v40;
        }
        while (v40);
        if (v41 == v150)
        {
          v47 = &stru_101AC1B28;
        }
        else
        {
          if (v44 >= (int)v16) {
            v45 = v42;
          }
          else {
            v45 = v43;
          }
          int v46 = v45[8];
          v47 = &stru_101AC1B28;
          if ((int)v16 >= v46)
          {
            if (v44 < (int)v16) {
              v42 = (const void **)v43;
            }
            v47 = (__CFString *)v42[5];
          }
        }
      }
      else
      {
        v47 = &stru_101AC1B28;
      }
      v121 = v47;
      *(_OWORD *)__p = 0u;
      long long v137 = 0u;
      v116 = v38;
      MCC::MCC((MCC *)__p);
      left = (char *)p_pair1->__value_.__left_;
      if (!p_pair1->__value_.__left_) {
        goto LABEL_87;
      }
      v49 = &v122->fLastKnownHomePlmn.fValue.__tree_.__pair1_;
      do
      {
        int v50 = *((_DWORD *)left + 8);
        BOOL v51 = v50 < (int)v16;
        if (v50 >= (int)v16) {
          v52 = (void **)left;
        }
        else {
          v52 = (void **)(left + 8);
        }
        if (!v51) {
          v49 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, rest::LastKnownHomePlmn>, void *>>> *)left;
        }
        left = (char *)*v52;
      }
      while (*v52);
      if (v49 != p_pair1 && (int)v16 >= SLODWORD(v49[4].__value_.__left_))
      {
        MCC::MCC();
        MCC::operator=();
        if (SHIBYTE(v157) < 0) {
          operator delete(*(void **)&buf[8]);
        }
      }
      else
      {
LABEL_87:
        v53 = *(NSObject **)v14->logger.__ptr_.__value_;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v54 = subscriber::asString();
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v54;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "#I No LastKnownHomePlmn found for slot %s", buf, 0xCu);
        }
      }
      *(_DWORD *)((char *)v135 + 3) = 0;
      v135[0] = 0;
      v55 = (std::mutex *)Registry::getServiceMap(v14->fRegistry.__ptr_);
      v56 = v55;
      if (v57 < 0)
      {
        v58 = (unsigned __int8 *)(v57 & 0x7FFFFFFFFFFFFFFFLL);
        uint64_t v59 = 5381;
        do
        {
          uint64_t v57 = v59;
          unsigned int v60 = *v58++;
          uint64_t v59 = (33 * v59) ^ v60;
        }
        while (v60);
      }
      std::mutex::lock(v55);
      *(void *)buf = v57;
      v61 = sub_10004D37C(&v56[1].__m_.__sig, (unint64_t *)buf);
      if (v61)
      {
        uint64_t v63 = v61[3];
        v62 = (std::__shared_weak_count *)v61[4];
        if (v62)
        {
          atomic_fetch_add_explicit(&v62->__shared_owners_, 1uLL, memory_order_relaxed);
          std::mutex::unlock(v56);
          atomic_fetch_add_explicit(&v62->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v14 = v122;
          sub_10004D2C8(v62);
          char v64 = 0;
          if (!v63) {
            goto LABEL_97;
          }
          goto LABEL_101;
        }
      }
      else
      {
        uint64_t v63 = 0;
      }
      std::mutex::unlock(v56);
      v62 = 0;
      char v64 = 1;
      if (!v63)
      {
LABEL_97:
        __src = 0;
        unint64_t v65 = 0;
        char v119 = 0;
        if ((v64 & 1) == 0) {
          goto LABEL_103;
        }
        goto LABEL_104;
      }
LABEL_101:
      MCC::getStringValue((uint64_t *)&v152, (MCC *)__p);
      (*(void (**)(unsigned char *__return_ptr, uint64_t, long long *))(*(void *)v63 + 24))(buf, v63, &v152);
      unint64_t v65 = *(void *)&buf[8];
      __src = *(void **)buf;
      v135[0] = *(_DWORD *)&buf[16];
      *(_DWORD *)((char *)v135 + 3) = *(_DWORD *)&buf[19];
      char v119 = buf[23];
      buf[23] = 0;
      buf[0] = 0;
      if ((SHIBYTE(v153) & 0x80000000) == 0)
      {
        if (v64) {
          goto LABEL_104;
        }
LABEL_103:
        sub_10004D2C8(v62);
        goto LABEL_104;
      }
      operator delete((void *)v152);
      if ((v64 & 1) == 0) {
        goto LABEL_103;
      }
LABEL_104:
      v134 = 0;
      if ((v119 & 0x80) == 0)
      {
        *(void *)&long long v132 = __src;
        *((void *)&v132 + 1) = v65;
        LODWORD(v133) = v135[0];
        *(_DWORD *)((char *)&v133 + 3) = *(_DWORD *)((char *)v135 + 3);
        HIBYTE(v133) = v119;
LABEL_107:
        long long v152 = v132;
        v153 = v133;
        goto LABEL_108;
      }
      sub_10004FC84(&v132, __src, v65);
      if ((SHIBYTE(v133) & 0x80000000) == 0) {
        goto LABEL_107;
      }
      sub_10004FC84(&v152, (void *)v132, *((unint64_t *)&v132 + 1));
LABEL_108:
      v151 = 0;
      if (SHIBYTE(v153) < 0)
      {
        sub_10004FC84(buf, (void *)v152, *((unint64_t *)&v152 + 1));
      }
      else
      {
        *(_OWORD *)buf = v152;
        *(void *)&buf[16] = v153;
      }
      v154 = 0;
      if (ctu::cf::convert_copy())
      {
        v66 = v151;
        v151 = (void *)v154;
        v155 = v66;
        sub_1000558F4(&v155);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      v134 = v151;
      v151 = 0;
      sub_1000558F4((const void **)&v151);
      if (SHIBYTE(v153) < 0) {
        operator delete((void *)v152);
      }
      if (SHIBYTE(v133) < 0) {
        operator delete((void *)v132);
      }
      id v120 = v134;
      CFTypeRef cf = @"Carrier";
      CFRetain(@"Carrier");
      v67 = (std::mutex *)Registry::getServiceMap(v14->fRegistry.__ptr_);
      v68 = v67;
      if (v69 < 0)
      {
        v70 = (unsigned __int8 *)(v69 & 0x7FFFFFFFFFFFFFFFLL);
        uint64_t v71 = 5381;
        do
        {
          uint64_t v69 = v71;
          unsigned int v72 = *v70++;
          uint64_t v71 = (33 * v71) ^ v72;
        }
        while (v72);
      }
      std::mutex::lock(v67);
      *(void *)buf = v69;
      v73 = sub_10004D37C(&v68[1].__m_.__sig, (unint64_t *)buf);
      if (v73)
      {
        uint64_t v74 = v73[3];
        v75 = (std::__shared_weak_count *)v73[4];
        if (v75)
        {
          atomic_fetch_add_explicit(&v75->__shared_owners_, 1uLL, memory_order_relaxed);
          std::mutex::unlock(v68);
          atomic_fetch_add_explicit(&v75->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v14 = v122;
          v111 = v75;
          sub_10004D2C8(v75);
          char v113 = 0;
          goto LABEL_127;
        }
      }
      else
      {
        uint64_t v74 = 0;
      }
      std::mutex::unlock(v68);
      v111 = 0;
      char v113 = 1;
LABEL_127:
      v130 = (void *)cf;
      if (cf) {
        CFRetain(cf);
      }
      if (v74)
      {
        (*(void (**)(const void **__return_ptr, uint64_t, uint64_t, uint64_t, const __CFString *, CFTypeRef, void))(*(void *)v74 + 96))(&v155, v74, v16, 1, @"CarrierName", cf, 0);
        sub_100056248(&v152, &v155);
        *(void *)buf = v130;
        v130 = (void *)v152;
        *(void *)&long long v152 = 0;
        sub_1000558F4((const void **)buf);
        sub_1000558F4((const void **)&v152);
        sub_1000577C4(&v155);
        if (v130) {
          v76 = sub_1000810B8;
        }
        else {
          v76 = 0;
        }
        if (v76)
        {
          v77 = (std::mutex *)Registry::getServiceMap(v14->fRegistry.__ptr_);
          v78 = v77;
          if (v79 < 0)
          {
            v80 = (unsigned __int8 *)(v79 & 0x7FFFFFFFFFFFFFFFLL);
            uint64_t v81 = 5381;
            do
            {
              uint64_t v79 = v81;
              unsigned int v82 = *v80++;
              uint64_t v81 = (33 * v81) ^ v82;
            }
            while (v82);
          }
          std::mutex::lock(v77);
          *(void *)buf = v79;
          v83 = sub_10004D37C(&v78[1].__m_.__sig, (unint64_t *)buf);
          if (v83)
          {
            uint64_t v85 = v83[3];
            v84 = (std::__shared_weak_count *)v83[4];
            if (v84)
            {
              atomic_fetch_add_explicit(&v84->__shared_owners_, 1uLL, memory_order_relaxed);
              std::mutex::unlock(v78);
              atomic_fetch_add_explicit(&v84->__shared_owners_, 1uLL, memory_order_relaxed);
              uint64_t v14 = v122;
              sub_10004D2C8(v84);
              char v86 = 0;
              goto LABEL_149;
            }
          }
          else
          {
            uint64_t v85 = 0;
          }
          std::mutex::unlock(v78);
          v84 = 0;
          char v86 = 1;
LABEL_149:
          (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, void *, uint64_t))(*(void *)v85 + 16))(&v152, v85, v110, v130, 1);
          *(void *)buf = v130;
          v130 = (void *)v152;
          *(void *)&long long v152 = 0;
          sub_1000558F4((const void **)buf);
          sub_1000558F4((const void **)&v152);
          if ((v86 & 1) == 0) {
            sub_10004D2C8(v84);
          }
          goto LABEL_151;
        }
        v91 = *(NSObject **)v14->logger.__ptr_.__value_;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          uint64_t v92 = subscriber::asString();
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v92;
          v88 = v91;
          v89 = "No carrier name found for slot %s";
          uint32_t v90 = 12;
          goto LABEL_146;
        }
      }
      else
      {
        v87 = *(NSObject **)v14->logger.__ptr_.__value_;
        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v88 = v87;
          v89 = "Can't populate carrier name. No CarrierSettings found.";
          uint32_t v90 = 2;
LABEL_146:
          _os_log_error_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, v89, buf, v90);
        }
      }
LABEL_151:
      v93 = v130;
      v94 = *(NSObject **)v14->logger.__ptr_.__value_;
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        id v95 = [(__CFString *)v121 UTF8String];
        id v96 = [(__CFString *)v116 UTF8String];
        v97 = (void **)[v120 UTF8String];
        v98 = (void **)[v93 UTF8String];
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v95;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v96;
        *(_WORD *)&buf[22] = 2080;
        v157 = v97;
        __int16 v158 = 2080;
        v159 = v98;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "#I SUBSCRIPTION INFO: short label: %s; long label: %s; ISO country code: %s; Carrier name: %s",
          buf,
          0x2Au);
      }
      v129 = 0;
      if (SHIBYTE(v142[3]) < 0)
      {
        sub_10004FC84(v127, v142[1], (unint64_t)v142[2]);
        v99 = CTEnhancedLinkQualityMetric_ptr;
      }
      else
      {
        *(_OWORD *)v127 = *(_OWORD *)&v142[1];
        v128 = v142[3];
        v99 = CTEnhancedLinkQualityMetric_ptr;
      }
      if (SHIBYTE(v128) < 0)
      {
        sub_10004FC84(&v152, v127[0], (unint64_t)v127[1]);
      }
      else
      {
        long long v152 = *(_OWORD *)v127;
        v153 = v128;
      }
      v151 = 0;
      if (SHIBYTE(v153) < 0)
      {
        sub_10004FC84(buf, (void *)v152, *((unint64_t *)&v152 + 1));
      }
      else
      {
        *(_OWORD *)buf = v152;
        *(void *)&buf[16] = v153;
      }
      v154 = 0;
      if (ctu::cf::convert_copy())
      {
        v100 = v151;
        v151 = (void *)v154;
        v155 = v100;
        sub_1000558F4(&v155);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      v129 = v151;
      v151 = 0;
      sub_1000558F4((const void **)&v151);
      if (SHIBYTE(v153) < 0) {
        operator delete((void *)v152);
      }
      if (SHIBYTE(v128) < 0) {
        operator delete(v127[0]);
      }
      v101 = v129;
      id v102 = [objc_alloc((Class)v99[261]) initWithUUIDString:v101];
      id v103 = [objc_alloc((Class)CXAccount) initWithUUID:v102 description:v118 serviceName:v93 isoCountryCode:v120 handle:v117 shortLabel:v121];
      id v104 = objc_alloc((Class)v99[261]);
      if (SBYTE7(v146) < 0)
      {
        sub_10004FC84(v124, v145[0], (unint64_t)v145[1]);
      }
      else
      {
        *(_OWORD *)v124 = *(_OWORD *)v145;
        v125 = (void *)v146;
      }
      if (SHIBYTE(v125) < 0)
      {
        sub_10004FC84(&v152, v124[0], (unint64_t)v124[1]);
      }
      else
      {
        long long v152 = *(_OWORD *)v124;
        v153 = v125;
      }
      v151 = 0;
      if (SHIBYTE(v153) < 0)
      {
        sub_10004FC84(buf, (void *)v152, *((unint64_t *)&v152 + 1));
      }
      else
      {
        *(_OWORD *)buf = v152;
        *(void *)&buf[16] = v153;
      }
      v154 = 0;
      if (ctu::cf::convert_copy())
      {
        v105 = v151;
        v151 = (void *)v154;
        v155 = v105;
        sub_1000558F4(&v155);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      v126 = v151;
      v151 = 0;
      sub_1000558F4((const void **)&v151);
      if (SHIBYTE(v153) < 0) {
        operator delete((void *)v152);
      }
      id v106 = [v104 initWithUUIDString:v126];
      sub_1000558F4(&v126);
      if (SHIBYTE(v125) < 0) {
        operator delete(v124[0]);
      }
      id v107 = [objc_alloc((Class)CXSenderIdentity) initWithUUID:v106 account:v103];
      if (v123 == 2) {
        [v112 insertObject:v107 atIndex:0];
      }
      else {
        [v112 addObject:v107];
      }

      sub_1000558F4((const void **)&v129);
      sub_1000558F4((const void **)&v130);
      if ((v113 & 1) == 0) {
        sub_10004D2C8(v111);
      }
      sub_1000558F4(&cf);

      sub_1000558F4((const void **)&v134);
      if (v119 < 0) {
        operator delete(__src);
      }
      if (SHIBYTE(v137) < 0) {
        operator delete(__p[1]);
      }

      uint64_t v14 = v122;
LABEL_197:
      if (SBYTE7(v148) < 0) {
        operator delete(v147[0]);
      }
      if (SBYTE7(v146) < 0) {
        operator delete(v145[0]);
      }
      if (SHIBYTE(v144) < 0) {
        operator delete(v143[1]);
      }
      if (SHIBYTE(v142[3]) < 0) {
        operator delete(v142[1]);
      }
      if (SHIBYTE(v142[0]) < 0) {
        operator delete(v141[0]);
      }
      if (SHIBYTE(v140[3]) < 0) {
        operator delete(v140[1]);
      }
      value = begin_node->logger.__ptr_.__value_;
      if (value)
      {
        do
        {
          fObj = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, rest::SubscriptionContext>, void *>>> *)value;
          value = *(OsLogLogger **)value;
        }
        while (value);
      }
      else
      {
        do
        {
          fObj = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, rest::SubscriptionContext>, void *>>> *)begin_node->fQueue.fObj.fObj;
          BOOL v31 = fObj->__value_.__left_ == begin_node;
          begin_node = (TelephonyProviderDelegate *)fObj;
        }
        while (!v31);
      }
      begin_node = (TelephonyProviderDelegate *)fObj;
    }
    while (fObj != &v122->fSubscriptionInfo.fValue.fSubscriptions.__tree_.__pair1_);
  }
  sub_100706DDC((uint64_t)&v149, v150[0]);
}

- (void)handleSubscriptionInfoChanged
{
  v3 = [(TelephonyProviderDelegate *)self provider];
  v4 = [v3 configuration];
  if (v4)
  {
    v5 = objc_opt_new();
    if (capabilities::ct::supportsThumperService((capabilities::ct *)-[TelephonyProviderDelegate handleSimSubscriptionInfoChanged:](self, "handleSimSubscriptionInfoChanged:", v5))&& ![v5 count])
    {
      [(TelephonyProviderDelegate *)self handleThumperSubscriptionInfoChanged:v5];
    }
    v7 = [v4 prioritizedSenderIdentities];
    unsigned int v8 = [v7 isEqualToOrderedSet:v5];

    if (v8)
    {
      unsigned int v9 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I Not updating config for CSD: no sender identities changed", (uint8_t *)&v12, 2u);
      }
    }
    else
    {
      [v4 setPrioritizedSenderIdentities:v5];
      v11 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        char v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I Updating config for CSD: sender identities: %@", (uint8_t *)&v12, 0xCu);
      }
      [v3 setConfiguration:v4];
    }
  }
  else
  {
    v10 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      char v13 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No config found for provider %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)handleLastKnownHomePlmnChanged:(const void *)a3
{
  if (self->fLastKnownHomePlmn.fValue.__tree_.__pair3_.__value_)
  {
    if (self->fSubscriptionInfo.fValue.fSubscriptions.__tree_.__pair3_.__value_)
    {
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, rest::LastKnownHomePlmn>, void *>>> *)self->fLastKnownHomePlmn.fValue.__tree_.__begin_node_;
      p_pair1 = &self->fLastKnownHomePlmn.fValue.__tree_.__pair1_;
      if (begin_node != &self->fLastKnownHomePlmn.fValue.__tree_.__pair1_)
      {
        uint64_t v6 = (char *)a3 + 8;
        while (1)
        {
          uint64_t v7 = *v6;
          if (!*v6) {
            goto LABEL_18;
          }
          int left = (int)begin_node[4].__value_.__left_;
          unsigned int v9 = v6;
          do
          {
            int v10 = *(_DWORD *)(v7 + 32);
            BOOL v11 = v10 < left;
            if (v10 >= left) {
              int v12 = (uint64_t *)v7;
            }
            else {
              int v12 = (uint64_t *)(v7 + 8);
            }
            if (!v11) {
              unsigned int v9 = (void *)v7;
            }
            uint64_t v7 = *v12;
          }
          while (*v12);
          if (v9 == v6 || left < *((_DWORD *)v9 + 8) || (rest::operator==() & 1) == 0)
          {
LABEL_18:
            left_high = (void *)HIBYTE(begin_node[7].__value_.__left_);
            if ((char)left_high < 0) {
              left_high = begin_node[6].__value_.__left_;
            }
            if (left_high) {
              break;
            }
          }
          uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, rest::LastKnownHomePlmn>, void *>>> *)begin_node[1].__value_.__left_;
          if (v14)
          {
            do
            {
              BOOL v15 = v14;
              uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, rest::LastKnownHomePlmn>, void *>>> *)v14->__value_.__left_;
            }
            while (v14);
          }
          else
          {
            do
            {
              BOOL v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, rest::LastKnownHomePlmn>, void *>>> *)begin_node[2].__value_.__left_;
              BOOL v16 = v15->__value_.__left_ == begin_node;
              begin_node = v15;
            }
            while (!v16);
          }
          begin_node = v15;
          if (v15 == p_pair1) {
            return;
          }
        }
        [(TelephonyProviderDelegate *)self handleSubscriptionInfoChanged];
      }
    }
  }
}

- (void)updateAudioCategory:(unsigned __int8)a3 updateToUpdate:(id)a4 apOnlyMode:(BOOL)a5 usingBaseband:(BOOL)a6
{
  BOOL v7 = a5;
  int v8 = a3;
  id v10 = a4;
  if (!qword_101B0D538)
  {
    uint64_t v11 = sub_1002B31F8();
    int v12 = (void *)qword_101B0D538;
    qword_101B0D538 = v11;
  }
  if (!qword_101B0D540)
  {
    uint64_t v13 = sub_1002B31F8();
    uint64_t v14 = (void *)qword_101B0D540;
    qword_101B0D540 = v13;
  }
  if (v8 == 2 || v7 && (v8 == 8 || v8 == 4))
  {
    if (!qword_101B0D548)
    {
      uint64_t v15 = sub_1002B31F8();
      BOOL v16 = (void *)qword_101B0D548;
      qword_101B0D548 = v15;
    }
    objc_msgSend(v10, "setAudioCategory:");
    if ((v8 == 8 || v8 == 4)
      && v7
      && sub_10025B63C((uint64_t)self->fStoredSwitchUseIbisMode.__ptr_.__value_, 0) == 1)
    {
      BOOL v17 = &qword_101B0D540;
    }
    else
    {
      BOOL v17 = &qword_101B0D538;
    }
    [v10 setAudioMode:*v17];
    [v10 setAudioInterruptionProvider:1];
    [v10 setAudioInterruptionOperationMode:1];
  }
  else
  {
    if (!qword_101B0D550)
    {
      uint64_t v18 = sub_1002B31F8();
      int v19 = (void *)qword_101B0D550;
      qword_101B0D550 = v18;
    }
    objc_msgSend(v10, "setAudioCategory:");
    [v10 setAudioMode:0];
    [v10 setAudioInterruptionProvider:0];
  }
  if (a6 || !_os_feature_enabled_impl()) {
    goto LABEL_50;
  }
  ServiceMap = (std::mutex *)Registry::getServiceMap(self->fRegistry.__ptr_);
  int v21 = ServiceMap;
  unint64_t v23 = v22;
  if ((v22 & 0x8000000000000000) != 0)
  {
    v24 = (unsigned __int8 *)(v22 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v25 = 5381;
    do
    {
      unint64_t v23 = v25;
      unsigned int v26 = *v24++;
      uint64_t v25 = (33 * v25) ^ v26;
    }
    while (v26);
  }
  std::mutex::lock(ServiceMap);
  v44[0] = v23;
  v27 = sub_10004D37C(&v21[1].__m_.__sig, v44);
  if (v27)
  {
    v29 = (GestaltUtilityInterface *)v27[3];
    uint64_t v28 = (std::__shared_weak_count *)v27[4];
    if (v28)
    {
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v21);
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v28);
      char v30 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v29 = 0;
  }
  std::mutex::unlock(v21);
  uint64_t v28 = 0;
  char v30 = 1;
LABEL_31:
  int isIPhone = GestaltUtilityInterface::isIPhone(v29);
  if ((v30 & 1) == 0) {
    sub_10004D2C8(v28);
  }
  if (isIPhone)
  {
    [v10 setAudioMode:qword_101B0D538];
    v32 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v44[0]) = 0;
      v33 = "#I Updating audio mode to VoiceChat";
LABEL_49:
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)v44, 2u);
      goto LABEL_50;
    }
    goto LABEL_50;
  }
  v34 = (std::mutex *)Registry::getServiceMap(self->fRegistry.__ptr_);
  v35 = v34;
  if ((v22 & 0x8000000000000000) != 0)
  {
    v36 = (unsigned __int8 *)(v22 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v37 = 5381;
    do
    {
      unint64_t v22 = v37;
      unsigned int v38 = *v36++;
      uint64_t v37 = (33 * v37) ^ v38;
    }
    while (v38);
  }
  std::mutex::lock(v34);
  v44[0] = v22;
  char v39 = sub_10004D37C(&v35[1].__m_.__sig, v44);
  if (v39)
  {
    v41 = (GestaltUtilityInterface *)v39[3];
    v40 = (std::__shared_weak_count *)v39[4];
    if (v40)
    {
      atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v35);
      atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v40);
      char v42 = 0;
      goto LABEL_44;
    }
  }
  else
  {
    v41 = 0;
  }
  std::mutex::unlock(v35);
  v40 = 0;
  char v42 = 1;
LABEL_44:
  int isWatch = GestaltUtilityInterface::isWatch(v41);
  if ((v42 & 1) == 0) {
    sub_10004D2C8(v40);
  }
  if (isWatch)
  {
    [v10 setAudioMode:qword_101B0D540];
    v32 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v44[0]) = 0;
      v33 = "#I Updating audio mode to Ibis";
      goto LABEL_49;
    }
  }
LABEL_50:
}

+ (int64_t)toCXTTYType:(int)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

+ (int)getTTYType:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

+ (int)sSenderIdentityUuidToSimSlot:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    *(_OWORD *)uu2 = xmmword_1014DE590;
    v7[0] = 0;
    v7[1] = 0;
    [v3 getUUIDBytes:v7];
    if (uuid_compare((const unsigned __int8 *)v7, uu2)) {
      int v5 = 1;
    }
    else {
      int v5 = 2;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)getCallCapabilitiesUpdateForCall:(id)a3 simSlot:(int)a4 isEmergency:(BOOL)a5
{
  id v8 = a3;
  int left = (char *)self->fCallCapabilities.fValue.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_11;
  }
  p_pair1 = &self->fCallCapabilities.fValue.__tree_.__pair1_;
  do
  {
    int v11 = *((_DWORD *)left + 8);
    BOOL v12 = v11 < a4;
    if (v11 >= a4) {
      uint64_t v13 = (char **)left;
    }
    else {
      uint64_t v13 = (char **)(left + 8);
    }
    if (!v12) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, xpc::dict>, void *>>> *)left;
    }
    int left = *v13;
  }
  while (*v13);
  if (p_pair1 == &self->fCallCapabilities.fValue.__tree_.__pair1_ || SLODWORD(p_pair1[4].__value_.__left_) > a4)
  {
LABEL_11:
    uint64_t v14 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = subscriber::asString();
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No call capabilities found for sim slot %s", (uint8_t *)&buf, 0xCu);
    }
    id v15 = v8;
    goto LABEL_14;
  }
  BOOL v17 = p_pair1[5].__value_.__left_;
  xpc_object_t v32 = v17;
  if (v17)
  {
    xpc_retain(v17);
    if (v8) {
      goto LABEL_19;
    }
LABEL_22:
    id v8 = (id)objc_opt_new();
    if (a5) {
      goto LABEL_20;
    }
LABEL_23:
    *(void *)&long long buf = &v32;
    *((void *)&buf + 1) = kSwappableKey;
    sub_100048BAC((uint64_t)&buf, &object);
    uint64_t v18 = xpc::dyn_cast_or_default((xpc *)&object, 0, v19);
    goto LABEL_24;
  }
  xpc_object_t v32 = xpc_null_create();
  if (!v8) {
    goto LABEL_22;
  }
LABEL_19:
  if (!a5) {
    goto LABEL_23;
  }
LABEL_20:
  uint64_t v18 = 0;
LABEL_24:
  [v8 setSupportsHolding:v18];
  if (!a5) {
    xpc_release(object);
  }
  *(void *)&long long buf = &v32;
  *((void *)&buf + 1) = kMergeableKey;
  sub_100048BAC((uint64_t)&buf, &v30);
  objc_msgSend(v8, "setSupportsGrouping:", xpc::dyn_cast_or_default((xpc *)&v30, 0, v20));
  xpc_release(v30);
  *(void *)&long long buf = &v32;
  *((void *)&buf + 1) = kIsConferenceSideBarBlockedKey;
  sub_100048BAC((uint64_t)&buf, &v30);
  objc_msgSend(v8, "setSupportsUngrouping:", xpc::dyn_cast_or_default((xpc *)&v30, 0, v21) ^ 1);
  xpc_release(v30);
  *(void *)&long long buf = &v32;
  *((void *)&buf + 1) = kDTMFSupportedKey;
  sub_100048BAC((uint64_t)&buf, &v30);
  objc_msgSend(v8, "setSupportsDTMF:", xpc::dyn_cast_or_default((xpc *)&v30, 0, v22));
  xpc_release(v30);
  *(void *)&long long buf = &v32;
  *((void *)&buf + 1) = kAddCallAllowedKey;
  sub_100048BAC((uint64_t)&buf, &v30);
  objc_msgSend(v8, "setSupportsAddCall:", xpc::dyn_cast_or_default((xpc *)&v30, 0, v23));
  xpc_release(v30);
  [v8 setSupportsSendingToVoicemail:sub_100849140(&self->fRegistry.__ptr_)];
  *(void *)&long long buf = &v32;
  *((void *)&buf + 1) = "kSupportsRTT";
  sub_100048BAC((uint64_t)&buf, &v30);
  objc_msgSend(v8, "setSupportsTTYWithVoice:", xpc::dyn_cast_or_default((xpc *)&v30, 0, v24));
  xpc_release(v30);
  *(void *)&long long buf = &v32;
  *((void *)&buf + 1) = kAmbiguousMultiPartyKey;
  sub_100048BAC((uint64_t)&buf, &v30);
  objc_msgSend(v8, "setSupportsUnambiguousMultiPartyState:", xpc::dyn_cast_or_default((xpc *)&v30, 0, v25) ^ 1);
  xpc_release(v30);
  unsigned int v26 = [v8 supportsUnambiguousMultiPartyState];
  if (v26)
  {
    *(void *)&long long buf = &v32;
    *((void *)&buf + 1) = kEndAndAnswerAllowedKey;
    sub_100048BAC((uint64_t)&buf, &v30);
    v27 = (const object *)[v8 supportsUnambiguousMultiPartyState];
    uint64_t v29 = xpc::dyn_cast_or_default((xpc *)&v30, v27, v28);
  }
  else
  {
    uint64_t v29 = 0;
  }
  [v8 setSupportsUnambiguousMultiPartyState:v29];
  if (v26) {
    xpc_release(v30);
  }
  id v15 = v8;
  xpc_release(v32);
LABEL_14:

  return v15;
}

- (id)evaluateAndCreateCallUpdateWithCallInfo:(dict)a3 previousCallInfo:(dict)a4 appendCallUpdate:(id)a5
{
  id v313 = a5;
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kCallStatus";
  sub_100048BAC((uint64_t)buf, __dst);
  int v309 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v8);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kCallSubType";
  sub_100048BAC((uint64_t)buf, __dst);
  unsigned __int8 v315 = xpc::dyn_cast_or_default((xpc *)__dst, (const object *)1, v9);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kCallType";
  sub_100048BAC((uint64_t)buf, __dst);
  int v11 = xpc::dyn_cast_or_default((xpc *)__dst, (const object *)1, v10);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kCallListedAsEmergency";
  sub_100048BAC((uint64_t)buf, __dst);
  int v13 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v12);
  xpc_release(*(xpc_object_t *)__dst);
  if ((v11 & 0xFFFFFFFE) == 2) {
    int v14 = 1;
  }
  else {
    int v14 = v13;
  }
  unsigned int v314 = v14;
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kCallSimSlot";
  sub_100048BAC((uint64_t)buf, __dst);
  uint64_t v316 = xpc::dyn_cast_or_default((xpc *)__dst, (const object *)1, v15);
  v318 = self;
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kSupportsEmergencyFallback";
  sub_100048BAC((uint64_t)buf, __dst);
  unsigned int v311 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v16);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kCallStatus";
  sub_100048BAC((uint64_t)buf, __dst);
  int v18 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v17);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kCallSubType";
  sub_100048BAC((uint64_t)buf, __dst);
  unsigned __int8 v306 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v19);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kCallType";
  sub_100048BAC((uint64_t)buf, __dst);
  int v21 = xpc::dyn_cast_or_default((xpc *)__dst, (const object *)1, v20);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kCallListedAsEmergency";
  sub_100048BAC((uint64_t)buf, __dst);
  int v23 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v22);
  xpc_release(*(xpc_object_t *)__dst);
  if ((v21 & 0xFFFFFFFE) == 2) {
    int v24 = 1;
  }
  else {
    int v24 = v23;
  }
  int v308 = v24;
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kCallSimSlot";
  sub_100048BAC((uint64_t)buf, __dst);
  int v312 = xpc::dyn_cast_or_default((xpc *)__dst, (const object *)(int)v316, v25);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kSupportsEmergencyFallback";
  sub_100048BAC((uint64_t)buf, __dst);
  int v27 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v26);
  int v305 = v23;
  xpc_release(*(xpc_object_t *)__dst);
  v344 = 0;
  uint64_t v345 = 0;
  uint64_t v346 = 0;
  *(dict *)__dst = a3;
  *(void *)&__dst[8] = "kUuid";
  sub_100048BAC((uint64_t)__dst, &v341);
  memset(buf, 0, 24);
  xpc::dyn_cast_or_default();
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(v341);
  v341 = 0;
  size_t v342 = 0;
  uint64_t v343 = 0;
  *(dict *)__dst = a4;
  *(void *)&__dst[8] = "kUuid";
  sub_100048BAC((uint64_t)__dst, &object);
  memset(buf, 0, 24);
  xpc::dyn_cast_or_default();
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(object);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kPendingInfoInitialization";
  sub_100048BAC((uint64_t)buf, __dst);
  int v29 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v28);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kPendingInfoInitialization";
  sub_100048BAC((uint64_t)buf, __dst);
  int v31 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v30);
  xpc_release(*(xpc_object_t *)__dst);
  uint64_t v32 = HIBYTE(v343);
  if (v343 >= 0) {
    size_t v33 = HIBYTE(v343);
  }
  else {
    size_t v33 = v342;
  }
  uint64_t v34 = HIBYTE(v346);
  if (v346 < 0) {
    uint64_t v34 = v345;
  }
  if (v33 != v34)
  {
LABEL_26:
    int v38 = 1;
    goto LABEL_33;
  }
  if (v346 >= 0) {
    v35 = (void **)&v344;
  }
  else {
    v35 = v344;
  }
  if (v343 < 0)
  {
    BOOL v37 = memcmp(v341, v35, v342) == 0;
  }
  else
  {
    if (HIBYTE(v343))
    {
      v36 = &v341;
      while (*(unsigned __int8 *)v36 == *(unsigned __int8 *)v35)
      {
        v36 = (void **)((char *)v36 + 1);
        v35 = (void **)((char *)v35 + 1);
        if (!--v32) {
          goto LABEL_25;
        }
      }
      goto LABEL_26;
    }
LABEL_25:
    BOOL v37 = 1;
  }
  int v39 = v29 & (v31 ^ 1);
  if (v18 == 9) {
    int v39 = 1;
  }
  if (v37) {
    int v38 = v39;
  }
  else {
    int v38 = 1;
  }
LABEL_33:
  int v317 = v38;
  BOOL v40 = v18 != 6 && v309 == 6;
  int v41 = v40;
  int v307 = v41;
  char v42 = objc_opt_new();
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kAudioToneRelayFlag";
  sub_100048BAC((uint64_t)buf, __dst);
  int v44 = (const object *)xpc::dyn_cast_or_default((xpc *)__dst, 0, v43);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kAudioToneRelayFlag";
  sub_100048BAC((uint64_t)buf, __dst);
  int v46 = xpc::dyn_cast_or_default((xpc *)__dst, v44, v45);
  xpc_release(*(xpc_object_t *)__dst);
  unsigned int v47 = v44 ^ v46;
  int v310 = v317 ^ 1;
  if (v317) {
    int v48 = (int)v44;
  }
  else {
    int v48 = v44 ^ v46;
  }
  if (v48 == 1)
  {
    v49 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109632;
      *(_DWORD *)&buf[4] = v44;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v317 & v44;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v310 & v47;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "#I Updating requiresInCallSounds to %d. newCallAndclientShouldRelayTones: %d, sameCallAndRelayTonesFlagChanged: %d", buf, 0x14u);
    }
    [v42 setRequiresInCallSounds:v44];
  }
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kAudioToneStandard";
  sub_100048BAC((uint64_t)buf, __dst);
  unsigned int v51 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v50);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kAudioToneStandard";
  sub_100048BAC((uint64_t)buf, __dst);
  int v53 = xpc::dyn_cast_or_default((xpc *)__dst, (const object *)v51, v52);
  xpc_release(*(xpc_object_t *)__dst);
  if (v51 != v53)
  {
    if (v51 < 5) {
      uint64_t v54 = v51 + 1;
    }
    else {
      uint64_t v54 = 0;
    }
    v55 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = v54;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#I Updating inCallSoundRegion to %d", buf, 8u);
    }
    [v42 setInCallSoundRegion:v54];
    int v48 = 1;
  }
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kCallerIdAvailability";
  sub_100048BAC((uint64_t)buf, __dst);
  int v57 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v56);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kCallerIdAvailability";
  sub_100048BAC((uint64_t)buf, __dst);
  int v59 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v58);
  xpc_release(*(xpc_object_t *)__dst);
  int v60 = v317;
  if (v57 != v59) {
    int v60 = 1;
  }
  if (v60 == 1)
  {
    v61 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v62 = asString();
      uint64_t v63 = "false";
      if (v57 == 1) {
        uint64_t v63 = "true";
      }
      *(_DWORD *)long long buf = 136315394;
      *(void *)&buf[4] = v62;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v63;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "#I Updating 'blocked' property to %s with remote number availability: %s", buf, 0x16u);
    }
    [v42 setBlocked:v57 == 1];
    int v48 = 1;
  }
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "CallLikelyToFail";
  sub_100048BAC((uint64_t)buf, __dst);
  uint64_t v65 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v64);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "CallLikelyToFail";
  sub_100048BAC((uint64_t)buf, __dst);
  int v67 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v66);
  xpc_release(*(xpc_object_t *)__dst);
  if (v65 != v67)
  {
    v68 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "#I Updating failureExpected because BB has notified us that the emergency call is likely to fail", buf, 2u);
    }
    [v42 setFailureExpected:v65];
    int v48 = 1;
  }
  if ((v317 | v311 ^ v27) == 1)
  {
    uint64_t v69 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = "false";
      if (v311) {
        v70 = "true";
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&buf[4] = v70;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "#I Updating emergency fallback support to %s", buf, 0xCu);
    }
    [v42 setSupportsEmergencyFallback:v311];
    int v48 = 1;
  }
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kEmSubSwitchAudioOverride";
  sub_100048BAC((uint64_t)buf, __dst);
  int v72 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v71);
  xpc_release(*(xpc_object_t *)__dst);
  if (v72)
  {
    int v73 = v316;
    int v74 = v312;
    BOOL v76 = v316 != v312 || v309 == 4;
  }
  else
  {
    BOOL v76 = 0;
    int v73 = v316;
    int v74 = v312;
  }
  BOOL v79 = v309 == 4 && v18 != 4 || v73 != v74;
  char v80 = v317;
  if (v306 != v315) {
    char v80 = 1;
  }
  if ((v80 & 1) != 0 || v76 || v79)
  {
    uint64_t v81 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v82 = asString();
      *(_DWORD *)long long buf = 136315650;
      *(void *)&buf[4] = v82;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v72;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v79;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "#I Updating audio flags. Call subtype: %s. Override: %{BOOL}d. Dialing or sim slot changed: %{BOOL}d", buf, 0x18u);
    }
    if ((v315 - 2) > 6u) {
      uint64_t v83 = 0;
    }
    else {
      uint64_t v83 = qword_1014E21D8[(char)(v315 - 2)];
    }
    uint64_t v84 = sd::IMSSubscriberConfigInterface::APOnlyModeDefaultVal((sd::IMSSubscriberConfigInterface *)[v42 setCallSubType:v83]);
    ServiceMap = (std::mutex *)Registry::getServiceMap(self->fRegistry.__ptr_);
    char v86 = ServiceMap;
    if (v87 < 0)
    {
      v88 = (unsigned __int8 *)(v87 & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t v89 = 5381;
      do
      {
        uint64_t v87 = v89;
        unsigned int v90 = *v88++;
        uint64_t v89 = (33 * v89) ^ v90;
      }
      while (v90);
    }
    std::mutex::lock(ServiceMap);
    *(void *)long long buf = v87;
    v91 = sub_10004D37C(&v86[1].__m_.__sig, (unint64_t *)buf);
    if (v91)
    {
      uint64_t v92 = v91[3];
      v93 = (std::__shared_weak_count *)v91[4];
      if (v93)
      {
        atomic_fetch_add_explicit(&v93->__shared_owners_, 1uLL, memory_order_relaxed);
        std::mutex::unlock(v86);
        atomic_fetch_add_explicit(&v93->__shared_owners_, 1uLL, memory_order_relaxed);
        sub_10004D2C8(v93);
        char v95 = 0;
        if (!v92)
        {
LABEL_108:
          if ((v95 & 1) == 0) {
            sub_10004D2C8(v93);
          }
          if (v316 == v312) {
            int v96 = 0;
          }
          else {
            int v96 = v72;
          }
          if (v96 == 1)
          {
            v97 = *(NSObject **)self->logger.__ptr_.__value_;
            BOOL v98 = os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
            uint64_t v99 = 0;
            if (v98)
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "#I Force overriding NOT usingBaseband for emergency call with sub switch", buf, 2u);
              uint64_t v99 = 0;
            }
          }
          else
          {
            uint64_t v99 = sd::IMSSubscriberConfigInterface::shouldUseAPMediaStack((sd::IMSSubscriberConfigInterface *)(v315 == 2), v84, v315 == 1, v94) ^ 1;
          }
          [v42 setUsingBaseband:v99];
          v100 = *(NSObject **)self->logger.__ptr_.__value_;
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v101 = [v42 isUsingBaseband];
            id v102 = "false";
            if (v101) {
              id v102 = "true";
            }
            *(_DWORD *)long long buf = 136315138;
            *(void *)&buf[4] = v102;
            _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "#I Updating usingBaseband to %s", buf, 0xCu);
          }
          if (v314)
          {
            if ([(TelephonyProviderDelegate *)self supportsDownlinkDtmf:v316])
            {
              [v42 setSupportsDTMFUpdates:v315 != 1];
              id v103 = *(NSObject **)self->logger.__ptr_.__value_;
              if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v104 = [v42 supportsDTMFUpdates];
                v105 = "false";
                if (v104) {
                  v105 = "true";
                }
                *(_DWORD *)long long buf = 136315138;
                *(void *)&buf[4] = v105;
                _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "#I Updating supportsDTMFUpdates to: %s", buf, 0xCu);
              }
            }
          }
          [v42 setPrefersExclusiveAccessToCellularNetwork:v315 == 1];
          id v106 = +[NSString stringWithUTF8String:"kCallSubType"];
          id v107 = +[NSString stringWithUTF8String:convertPhoneCallSubTypeToPublicString()];
          v108 = [(TelephonyProviderDelegate *)self extraCallInfo];
          [v108 setValue:v107 forKey:v106];

          if (v315 == 16)
          {
            v109 = *(NSObject **)self->logger.__ptr_.__value_;
            if (!os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
            {
LABEL_143:

              int v48 = 1;
              goto LABEL_144;
            }
            *(_WORD *)long long buf = 0;
            uint64_t v110 = "#I Not updating audio category for emergency call with undecided subtype";
LABEL_130:
            _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, v110, buf, 2u);
            goto LABEL_143;
          }
          if (v96)
          {
            v111 = *(NSObject **)self->logger.__ptr_.__value_;
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              unsigned __int8 v112 = 2;
              _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "#I Force updating audio category to Wifi for emergency call with sub switch", buf, 2u);
              uint64_t v84 = 0;
              id v113 = 0;
            }
            else
            {
              uint64_t v84 = 0;
              id v113 = 0;
              unsigned __int8 v112 = 2;
            }
          }
          else
          {
            if (v309 == 3) {
              int v114 = v72;
            }
            else {
              int v114 = 0;
            }
            if (v114 == 1)
            {
              v109 = *(NSObject **)self->logger.__ptr_.__value_;
              if (!os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_143;
              }
              *(_WORD *)long long buf = 0;
              uint64_t v110 = "#I Force suppressing audio category update for emergency call with sub switch when call subtype cha"
                     "nges during media init";
              goto LABEL_130;
            }
            id v113 = [v42 isUsingBaseband];
            unsigned __int8 v112 = v315;
          }
          [(TelephonyProviderDelegate *)self updateAudioCategory:v112 updateToUpdate:v42 apOnlyMode:v84 usingBaseband:v113];
          goto LABEL_143;
        }
LABEL_107:
        uint64_t v84 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v92 + 288))(v92, v316);
        goto LABEL_108;
      }
    }
    else
    {
      uint64_t v92 = 0;
    }
    std::mutex::unlock(v86);
    v93 = 0;
    char v95 = 1;
    if (!v92) {
      goto LABEL_108;
    }
    goto LABEL_107;
  }
LABEL_144:
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kIsTTY";
  sub_100048BAC((uint64_t)buf, __dst);
  uint64_t v116 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v115);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kIsTTY";
  sub_100048BAC((uint64_t)buf, __dst);
  int v118 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v117);
  xpc_release(*(xpc_object_t *)__dst);
  int v119 = v317;
  if (v116 != v118) {
    int v119 = 1;
  }
  if (v119 == 1)
  {
    id v120 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v121 = TTYTypeAsString();
      *(_DWORD *)long long buf = 136315138;
      *(void *)&buf[4] = v121;
      _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "#I Updating TTY type to %s", buf, 0xCu);
    }
    id v122 = v42;
    objc_msgSend(v122, "setTTYType:", +[TelephonyProviderDelegate toCXTTYType:](TelephonyProviderDelegate, "toCXTTYType:", v116));

    [v122 setSupportsTTYWithVoice:v315 != 1];
    int v48 = 1;
  }
  if (v307)
  {
    int v123 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "#I Adding to provider context: disconnect cause code", buf, 2u);
    }
    *(dict *)long long buf = a3;
    *(void *)&buf[8] = "kDisconnectCauseCode";
    sub_100048BAC((uint64_t)buf, __dst);
    uint64_t v125 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v124);
    xpc_release(*(xpc_object_t *)__dst);
    v126 = +[NSString stringWithUTF8String:"kDisconnectCauseCode"];
    v127 = +[NSNumber numberWithInt:v125];
    v128 = [(TelephonyProviderDelegate *)self extraCallInfo];
    [v128 setValue:v127 forKey:v126];

    memset(__dst, 0, sizeof(__dst));
    uint64_t v352 = 0;
    xpc_object_t object = a3.fObj.fObj;
    size_t __n = (size_t)"kDisconnectCauseCodeString";
    sub_100048BAC((uint64_t)&object, &v335);
    memset(buf, 0, 24);
    xpc::dyn_cast_or_default();
    if ((char)buf[23] < 0) {
      operator delete(*(void **)buf);
    }
    xpc_release(v335);
    v129 = +[NSString stringWithUTF8String:"kDisconnectCauseCodeString"];

    if (v352 >= 0) {
      v130 = __dst;
    }
    else {
      v130 = *(uint8_t **)__dst;
    }
    v131 = +[NSString stringWithUTF8String:v130];
    long long v132 = [(TelephonyProviderDelegate *)self extraCallInfo];
    [v132 setValue:v131 forKey:v129];

    *(dict *)long long buf = a3;
    *(void *)&buf[8] = "kBBCallDisconnectCause";
    sub_100048BAC((uint64_t)buf, &object);
    unsigned __int16 v134 = xpc::dyn_cast_or_default((xpc *)&object, 0, v133);
    xpc_release(object);
    v135 = +[NSString stringWithUTF8String:"kBBCallDisconnectCause"];

    v136 = +[NSNumber numberWithInt:v134];

    long long v137 = [(TelephonyProviderDelegate *)self extraCallInfo];
    [v137 setValue:v136 forKey:v135];

    if (SHIBYTE(v352) < 0) {
      operator delete(*(void **)__dst);
    }

    int v48 = 1;
  }
  xpc_object_t object = 0;
  size_t __n = 0;
  uint64_t v340 = 0;
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kCallName";
  sub_100048BAC((uint64_t)buf, __dst);
  xpc::dyn_cast_or_default((uint64_t *)&object, (xpc *)__dst, (const object *)"", v138);
  xpc_release(*(xpc_object_t *)__dst);
  xpc_object_t v335 = 0;
  uint64_t v336 = 0;
  uint64_t v337 = 0;
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kCallName";
  sub_100048BAC((uint64_t)buf, __dst);
  xpc::dyn_cast_or_default((uint64_t *)&v335, (xpc *)__dst, (const object *)"", v139);
  xpc_release(*(xpc_object_t *)__dst);
  uint64_t v140 = HIBYTE(v340);
  int v141 = SHIBYTE(v340);
  if (v340 >= 0) {
    size_t v142 = HIBYTE(v340);
  }
  else {
    size_t v142 = __n;
  }
  if (v142)
  {
    if ((v317 & 1) == 0)
    {
      uint64_t v143 = HIBYTE(v337);
      if (v337 < 0) {
        uint64_t v143 = v336;
      }
      if (v142 == v143)
      {
        if (v337 >= 0) {
          long long v144 = (unsigned __int8 *)&v335;
        }
        else {
          long long v144 = (unsigned __int8 *)v335;
        }
        if (SHIBYTE(v340) < 0)
        {
          long long v148 = (xpc_object_t *)object;
          if (!memcmp(object, v144, __n)) {
            goto LABEL_186;
          }
          long long v146 = *(NSObject **)v318->logger.__ptr_.__value_;
          if (!os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_182;
          }
          goto LABEL_181;
        }
        if (!HIBYTE(v340)) {
          goto LABEL_186;
        }
        p_xpc_object_t object = &object;
        while (*(unsigned __int8 *)p_object == *v144)
        {
          p_xpc_object_t object = (xpc_object_t *)((char *)p_object + 1);
          ++v144;
          if (!--v140) {
            goto LABEL_186;
          }
        }
      }
    }
    long long v146 = *(NSObject **)v318->logger.__ptr_.__value_;
    BOOL v147 = os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT);
    long long v148 = (xpc_object_t *)object;
    if (!v147)
    {
LABEL_182:
      if ((v141 & 0x80u) == 0) {
        uint64_t v149 = &object;
      }
      else {
        uint64_t v149 = v148;
      }
      v150 = +[NSString stringWithUTF8String:v149];
      [v42 setLocalizedCallerName:v150];

      int v48 = 1;
      goto LABEL_186;
    }
    if (v141 >= 0) {
      long long v148 = &object;
    }
LABEL_181:
    *(_DWORD *)long long buf = 136315138;
    *(void *)&buf[4] = v148;
    _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "#I Updating callerName to %s", buf, 0xCu);
    LOBYTE(v141) = HIBYTE(v340);
    long long v148 = (xpc_object_t *)object;
    goto LABEL_182;
  }
LABEL_186:
  __s1 = 0;
  size_t v333 = 0;
  uint64_t v334 = 0;
  *(dict *)__dst = a3;
  *(void *)&__dst[8] = "kPhoneNumber";
  sub_100048BAC((uint64_t)__dst, &v329);
  memset(buf, 0, 24);
  xpc::dyn_cast_or_default();
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(v329);
  xpc_object_t v329 = 0;
  uint64_t v330 = 0;
  uint64_t v331 = 0;
  *(dict *)__dst = a4;
  *(void *)&__dst[8] = "kPhoneNumber";
  sub_100048BAC((uint64_t)__dst, &fObj);
  memset(buf, 0, 24);
  xpc::dyn_cast_or_default();
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(fObj);
  uint64_t v151 = HIBYTE(v334);
  int v152 = SHIBYTE(v334);
  if (v334 >= 0) {
    size_t v153 = HIBYTE(v334);
  }
  else {
    size_t v153 = v333;
  }
  if (v153)
  {
    if ((v317 & 1) == 0)
    {
      uint64_t v154 = HIBYTE(v331);
      if (v331 < 0) {
        uint64_t v154 = v330;
      }
      if (v153 == v154)
      {
        if (v331 >= 0) {
          v155 = (unsigned __int8 *)&v329;
        }
        else {
          v155 = (unsigned __int8 *)v329;
        }
        if (SHIBYTE(v334) < 0)
        {
          v159 = (void **)__s1;
          if (!memcmp(__s1, v155, v333)) {
            goto LABEL_246;
          }
          v157 = *(NSObject **)v318->logger.__ptr_.__value_;
          if (!os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_211;
          }
          goto LABEL_210;
        }
        if (!HIBYTE(v334)) {
          goto LABEL_246;
        }
        p_s1 = &__s1;
        while (*(unsigned __int8 *)p_s1 == *v155)
        {
          p_s1 = (void **)((char *)p_s1 + 1);
          ++v155;
          if (!--v151) {
            goto LABEL_246;
          }
        }
      }
    }
    v157 = *(NSObject **)v318->logger.__ptr_.__value_;
    BOOL v158 = os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT);
    v159 = (void **)__s1;
    if (!v158)
    {
LABEL_211:
      if ((v152 & 0x80u) == 0) {
        __int16 v160 = &__s1;
      }
      else {
        __int16 v160 = v159;
      }
      uint64_t v161 = +[NSString stringWithUTF8String:v160];
      id v162 = [objc_alloc((Class)CXHandle) initWithType:2 value:v161];
      [v42 setRemoteHandle:v162];

      if ((v314 & v305 & v311) == 1)
      {
        if (v334 >= 0) {
          size_t v163 = HIBYTE(v334);
        }
        else {
          size_t v163 = v333;
        }
        uint64_t v164 = HIBYTE(v331);
        if (v331 < 0) {
          uint64_t v164 = v330;
        }
        if (v163 == v164)
        {
          if (v331 >= 0) {
            int v165 = (unsigned __int8 *)&v329;
          }
          else {
            int v165 = (unsigned __int8 *)v329;
          }
          if (v334 < 0)
          {
            BOOL v174 = memcmp(__s1, v165, v333) == 0;
          }
          else if (HIBYTE(v334))
          {
            uint64_t v166 = HIBYTE(v334) - 1;
            v167 = &__s1;
            do
            {
              int v169 = *(unsigned __int8 *)v167;
              v167 = (void **)((char *)v167 + 1);
              int v168 = v169;
              int v171 = *v165++;
              int v170 = v171;
              BOOL v173 = v166-- != 0;
              BOOL v40 = v168 == v170;
              BOOL v174 = v168 == v170;
            }
            while (v40 && v173);
          }
          else
          {
            BOOL v174 = 1;
          }
        }
        else
        {
          BOOL v174 = 0;
        }
        BOOL v175 = !v174;
      }
      else
      {
        BOOL v175 = 0;
      }
      [v42 setHasBeenRedirected:v175];

      int v48 = 1;
      goto LABEL_246;
    }
    if (v152 >= 0) {
      v159 = &__s1;
    }
LABEL_210:
    *(_DWORD *)long long buf = 136315138;
    *(void *)&buf[4] = v159;
    _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_DEFAULT, "#I Updating caller id/phone number to %s", buf, 0xCu);
    LOBYTE(v152) = HIBYTE(v334);
    v159 = (void **)__s1;
    goto LABEL_211;
  }
LABEL_246:
  if ((v317 | v314 ^ v308) == 1)
  {
    *(dict *)long long buf = a3;
    *(void *)&buf[8] = "kSuspicious380Redirect";
    sub_100048BAC((uint64_t)buf, __dst);
    v176 = v318;
    int v178 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v177);
    xpc_release(*(xpc_object_t *)__dst);
    if ((v178 ^ 1 | v317 | v308) == 1)
    {
      [v42 setEmergency:(v178 ^ 1) & v314];
      v179 = *(NSObject **)v318->logger.__ptr_.__value_;
      if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v180 = [v42 isEmergency];
        v181 = "false";
        if (v180) {
          v182 = "true";
        }
        else {
          v182 = "false";
        }
        if (v178) {
          v181 = "true";
        }
        *(_DWORD *)long long buf = 136315394;
        *(void *)&buf[4] = v182;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v181;
        _os_log_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_DEFAULT, "#I Updating emergency to %s. suspicious: %s", buf, 0x16u);
      }
      int v48 = 1;
    }
  }
  else
  {
    v176 = v318;
  }
  if (_os_feature_enabled_impl())
  {
    *(dict *)__dst = a3;
    *(void *)&__dst[8] = "kAudioStreamTokens";
    if (xpc_dictionary_get_value(*(xpc_object_t *)a3.fObj.fObj, "kAudioStreamTokens"))
    {
      sub_100048BAC((uint64_t)__dst, buf);
      xpc_object_t v183 = xpc_null_create();
      v184 = *(void **)buf;
      object1[0] = *(xpc_object_t *)buf;
      if (*(void *)buf && xpc_get_type(*(xpc_object_t *)buf) == (xpc_type_t)&_xpc_type_array)
      {
        xpc_retain(v184);
        xpc_object_t v185 = object1[0];
      }
      else
      {
        xpc_object_t v185 = xpc_null_create();
        object1[0] = v185;
      }
      if (xpc_get_type(v185) != (xpc_type_t)&_xpc_type_array)
      {
        if (v183)
        {
          xpc_retain(v183);
          xpc_object_t v186 = v183;
        }
        else
        {
          xpc_object_t v186 = xpc_null_create();
        }
        xpc_object_t v187 = object1[0];
        object1[0] = v186;
        xpc_release(v187);
      }
      xpc_release(v183);
      xpc_release(*(xpc_object_t *)buf);
      xpc_object_t fObj = a4.fObj.fObj;
      v326 = "kAudioStreamTokens";
      sub_100048BAC((uint64_t)&fObj, buf);
      xpc_object_t v188 = xpc_null_create();
      xpc_object_t v189 = *(xpc_object_t *)buf;
      if (*(void *)buf && xpc_get_type(*(xpc_object_t *)buf) == (xpc_type_t)&_xpc_type_array) {
        xpc_retain(v189);
      }
      else {
        xpc_object_t v189 = xpc_null_create();
      }
      if (xpc_get_type(v189) != (xpc_type_t)&_xpc_type_array)
      {
        if (v188)
        {
          xpc_retain(v188);
          xpc_object_t v190 = v188;
        }
        else
        {
          xpc_object_t v190 = xpc_null_create();
        }
        xpc_release(v189);
        xpc_object_t v189 = v190;
      }
      xpc_release(v188);
      xpc_release(*(xpc_object_t *)buf);
      if (((v317 & 1) != 0 || !xpc_dictionary_get_value(*(xpc_object_t *)fObj, v326) || !xpc_equal(object1[0], v189))
        && xpc_get_type(object1[0]) == (xpc_type_t)&_xpc_type_array
        && xpc_array_get_count(object1[0]) >= 3)
      {
        v191 = [v42 callTokens];
        if (v191)
        {

          goto LABEL_285;
        }
        v192 = [v313 callTokens];
        BOOL v193 = v192 == 0;

        if (!v193)
        {
LABEL_285:
          v176 = v318;
          v194 = *(NSObject **)v318->logger.__ptr_.__value_;
          if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_ERROR, "Not updating audio stream token: avoid overriding existing ones. This should NOT happen", buf, 2u);
          }
          goto LABEL_291;
        }
        *(void *)long long buf = object1;
        *(void *)&buf[8] = 0;
        sub_1000492E0((uint64_t)buf, v328);
        unsigned int v196 = xpc::dyn_cast_or_default((xpc *)v328, 0, v195);
        xpc_release(v328[0]);
        *(void *)long long buf = object1;
        *(void *)&buf[8] = 1;
        sub_1000492E0((uint64_t)buf, v328);
        unsigned int v198 = xpc::dyn_cast_or_default((xpc *)v328, 0, v197);
        xpc_release(v328[0]);
        *(void *)long long buf = object1;
        *(void *)&buf[8] = 2;
        sub_1000492E0((uint64_t)buf, v328);
        unsigned int v200 = xpc::dyn_cast_or_default((xpc *)v328, 0, v199);
        xpc_release(v328[0]);
        v201 = *(NSObject **)v318->logger.__ptr_.__value_;
        if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 67109632;
          *(_DWORD *)&buf[4] = v196;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v198;
          *(_WORD *)&buf[14] = 1024;
          *(_DWORD *)&buf[16] = v200;
          _os_log_impl((void *)&_mh_execute_header, v201, OS_LOG_TYPE_DEFAULT, "#I Updating audio stream token: %u, uplink: %u, downlink: %u", buf, 0x14u);
        }
        v202 = objc_opt_new();
        [v42 setCallTokens:v202];

        v203 = [v42 callTokens];
        [v203 setCombinedAudioStreamToken:v196];

        v204 = [v42 callTokens];
        [v204 setUplinkStreamToken:v198];

        v205 = [v42 callTokens];
        [v205 setDownlinkStreamToken:v200];

        int v48 = 1;
      }
      v176 = v318;
LABEL_291:
      xpc_release(v189);
      xpc_release(object1[0]);
    }
  }
  v328[0] = a3.fObj.fObj;
  v328[1] = "kTextStreamToken";
  if (xpc_dictionary_get_value(*(xpc_object_t *)a3.fObj.fObj, "kTextStreamToken"))
  {
    sub_100048BAC((uint64_t)v328, buf);
    uint64_t v207 = xpc::dyn_cast_or_default((xpc *)buf, 0, v206);
    xpc_release(*(xpc_object_t *)buf);
    *(dict *)__dst = a4;
    *(void *)&__dst[8] = "kTextStreamToken";
    sub_100048BAC((uint64_t)__dst, buf);
    int v209 = xpc::dyn_cast_or_default((xpc *)buf, 0, v208);
    xpc_release(*(xpc_object_t *)buf);
    v210 = *(NSObject **)v176->logger.__ptr_.__value_;
    if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
    {
      int v211 = SHIBYTE(v346);
      v212 = v344;
      xpc_object_t value = xpc_dictionary_get_value(**(xpc_object_t **)__dst, *(const char **)&__dst[8]);
      v214 = (void **)&v344;
      if (v211 < 0) {
        v214 = v212;
      }
      *(_DWORD *)long long buf = 136315906;
      *(void *)&buf[4] = v214;
      v215 = "false";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v207;
      *(_WORD *)&buf[18] = 2080;
      if (value) {
        v215 = "true";
      }
      *(void *)&buf[20] = v215;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v209;
      _os_log_impl((void *)&_mh_execute_header, v210, OS_LOG_TYPE_DEFAULT, "#I Call %s has text stream token: %u, HasPrev: %s, Prev token: %u", buf, 0x22u);
      v176 = v318;
    }
    if ((v317 & 1) != 0
      || !xpc_dictionary_get_value(**(xpc_object_t **)__dst, *(const char **)&__dst[8])
      || v207 != v209)
    {
      v216 = *(NSObject **)v176->logger.__ptr_.__value_;
      if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v216, OS_LOG_TYPE_DEFAULT, "#I Adding to provider context: text stream token", buf, 2u);
      }
      v217 = +[NSString stringWithUTF8String:"kTextStreamToken"];
      v218 = +[NSNumber numberWithInt:v207];
      v219 = [(TelephonyProviderDelegate *)v176 extraCallInfo];
      [v219 setValue:v218 forKey:v217];

      int v48 = 1;
    }
    *(dict *)long long buf = a3;
    *(void *)&buf[8] = "kIsTextHeldForRTTCall";
    sub_100048BAC((uint64_t)buf, &fObj);
    uint64_t v221 = xpc::dyn_cast_or_default((xpc *)&fObj, 0, v220);
    xpc_release(fObj);
    *(dict *)long long buf = a4;
    *(void *)&buf[8] = "kIsTextHeldForRTTCall";
    xpc_object_t fObj = 0;
    BOOL v222 = sub_100706E38((uint64_t)buf);
    *(dict *)long long buf = a4;
    *(void *)&buf[8] = "kIsTextHeldForRTTCall";
    sub_100048BAC((uint64_t)buf, &fObj);
    int v224 = xpc::dyn_cast_or_default((xpc *)&fObj, 0, v223);
    xpc_release(fObj);
    if (((v317 | v222) & 1) != 0 || v221 != v224)
    {
      v225 = *(NSObject **)v318->logger.__ptr_.__value_;
      if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v225, OS_LOG_TYPE_DEFAULT, "#I Adding to provider context: text stream direction", buf, 2u);
      }
      v226 = +[NSString stringWithUTF8String:"kIsTextHeldForRTTCall"];
      v227 = +[NSNumber numberWithBool:v221];
      v228 = [(TelephonyProviderDelegate *)v318 extraCallInfo];
      [v228 setValue:v227 forKey:v226];

      int v48 = 1;
    }
  }
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kVerstatEnabled";
  sub_100048BAC((uint64_t)buf, __dst);
  int v230 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v229);
  xpc_release(*(xpc_object_t *)__dst);
  if (!v230)
  {
    [v42 setVerificationStatus:4];
    goto LABEL_336;
  }
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kVerstatLevel";
  sub_100048BAC((uint64_t)buf, __dst);
  int v232 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v231);
  xpc_release(*(xpc_object_t *)__dst);
  if (v232 != 1)
  {
    if (v232 == 2) {
      uint64_t v233 = 2;
    }
    else {
      uint64_t v233 = 3;
    }
    [v42 setVerificationStatus:v233];
    goto LABEL_336;
  }
  [v42 setVerificationStatus:1];
  memset(buf, 0, 24);
  *(dict *)__dst = a3;
  *(void *)&__dst[8] = "kImagePath";
  sub_100048BAC((uint64_t)__dst, &fObj);
  xpc::dyn_cast_or_default((uint64_t *)buf, (xpc *)&fObj, (const object *)"", v234);
  xpc_release(fObj);
  uint64_t v235 = buf[23];
  int v236 = (char)buf[23];
  if ((buf[23] & 0x80u) != 0) {
    uint64_t v235 = *(void *)&buf[8];
  }
  if (v235)
  {
    if (v317)
    {
      v237 = *(NSObject **)v318->logger.__ptr_.__value_;
      if (os_log_type_enabled(v237, OS_LOG_TYPE_DEFAULT))
      {
        v238 = *(uint8_t **)buf;
        if (v236 >= 0) {
          v238 = buf;
        }
        *(_DWORD *)__dst = 136315138;
        *(void *)&__dst[4] = v238;
        _os_log_impl((void *)&_mh_execute_header, v237, OS_LOG_TYPE_DEFAULT, "#I Updating caller image URL to %s", __dst, 0xCu);
        LOBYTE(v236) = buf[23];
      }
      if ((v236 & 0x80u) == 0) {
        v239 = buf;
      }
      else {
        v239 = *(uint8_t **)buf;
      }
      v240 = +[NSString stringWithUTF8String:v239];
      v241 = +[NSURL fileURLWithPath:v240];

      id v242 = [objc_alloc((Class)CXSandboxExtendedURL) initWithURL:v241];
      [v42 setLocalizedCallerImageURL:v242];
    }
    else
    {
      if (!v307) {
        goto LABEL_334;
      }
      v243 = *(NSObject **)v318->logger.__ptr_.__value_;
      if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__dst = 136315138;
        *(void *)&__dst[4] = "/stock";
        _os_log_impl((void *)&_mh_execute_header, v243, OS_LOG_TYPE_DEFAULT, "#I Updating caller image URL to %s", __dst, 0xCu);
      }
      v244 = +[NSString stringWithUTF8String:"/stock"];
      v241 = +[NSURL fileURLWithPath:v244];

      id v242 = [objc_alloc((Class)CXSandboxExtendedURL) initWithURL:v241];
      [v42 setLocalizedCallerImageURL:v242];
    }

    int v48 = 1;
    LOBYTE(v236) = buf[23];
  }
LABEL_334:
  if ((v236 & 0x80) != 0) {
    operator delete(*(void **)buf);
  }
LABEL_336:
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kSpamRisk";
  sub_100048BAC((uint64_t)buf, __dst);
  uint64_t v246 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v245);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kSpamRisk";
  sub_100048BAC((uint64_t)buf, __dst);
  uint64_t v248 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v247);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kSpamCategory";
  sub_100048BAC((uint64_t)buf, __dst);
  uint64_t v250 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v249);
  xpc_release(*(xpc_object_t *)__dst);
  *(dict *)long long buf = a4;
  *(void *)&buf[8] = "kSpamCategory";
  sub_100048BAC((uint64_t)buf, __dst);
  uint64_t v252 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v251);
  xpc_release(*(xpc_object_t *)__dst);
  if (v246 == v248) {
    int v253 = v317 ^ 1;
  }
  else {
    int v253 = 0;
  }
  if (v253 != 1 || v250 != v252)
  {
    [v42 setJunkConfidence:v246];
    [v42 setIdentificationCategory:v250];
    v254 = *(NSObject **)v318->logger.__ptr_.__value_;
    if (os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT))
    {
      id v255 = [v42 junkConfidence];
      id v256 = [v42 identificationCategory];
      *(_DWORD *)long long buf = 134218240;
      *(void *)&buf[4] = v255;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v256;
      _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_DEFAULT, "#I Updating junk confidence to %ld and category to %ld", buf, 0x16u);
    }
    int v48 = 1;
  }
  *(dict *)long long buf = a3;
  *(void *)&buf[8] = "kCallDirectionMobileOriginated";
  sub_100048BAC((uint64_t)buf, __dst);
  int v258 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v257);
  xpc_release(*(xpc_object_t *)__dst);
  if (((v310 | v258) & 1) == 0)
  {
    *(dict *)long long buf = a3;
    *(void *)&buf[8] = "kMarkMTCallWithHighPriority";
    sub_100048BAC((uint64_t)buf, __dst);
    int v260 = xpc::dyn_cast_or_default((xpc *)__dst, 0, v259);
    xpc_release(*(xpc_object_t *)__dst);
    v261 = *(NSObject **)v318->logger.__ptr_.__value_;
    if (os_log_type_enabled(v261, OS_LOG_TYPE_DEFAULT))
    {
      v262 = "Low";
      if (v260) {
        v262 = "High";
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&buf[4] = v262;
      _os_log_impl((void *)&_mh_execute_header, v261, OS_LOG_TYPE_DEFAULT, "#I Updating priority to %s for a new MT call.", buf, 0xCu);
    }
    if (v260) {
      uint64_t v263 = 2;
    }
    else {
      uint64_t v263 = 0;
    }
    [v42 setPriority:v263];
  }
  v264 = [(TelephonyProviderDelegate *)v318 getCallCapabilitiesUpdateForCall:v42 simSlot:v316 isEmergency:v314];

  v265 = v264;
  v266 = v318;
  if ([v264 supportsUngrouping])
  {
    *(dict *)long long buf = a4;
    *(void *)&buf[8] = "kIsSplitAllowed";
    sub_100048BAC((uint64_t)buf, __dst);
    v267 = (const object *)[v264 supportsUngrouping];
    int v269 = xpc::dyn_cast_or_default((xpc *)__dst, v267, v268);
    xpc_release(*(xpc_object_t *)__dst);
    *(dict *)long long buf = a3;
    *(void *)&buf[8] = "kIsSplitAllowed";
    sub_100048BAC((uint64_t)buf, __dst);
    v270 = (const object *)[v264 supportsUngrouping];
    int v271 = v312;
    uint64_t v273 = xpc::dyn_cast_or_default((xpc *)__dst, v270, v272);
    xpc_release(*(xpc_object_t *)__dst);
    if (v269 != v273)
    {
      v274 = *(NSObject **)v318->logger.__ptr_.__value_;
      if (os_log_type_enabled(v274, OS_LOG_TYPE_DEFAULT))
      {
        v275 = "false";
        if (v273) {
          v275 = "true";
        }
        *(_DWORD *)long long buf = 136315138;
        *(void *)&buf[4] = v275;
        _os_log_impl((void *)&_mh_execute_header, v274, OS_LOG_TYPE_DEFAULT, "#I Updating supportsUngrouping to %s", buf, 0xCu);
      }
      [v265 setSupportsUngrouping:v273];
      int v48 = 1;
    }
  }
  else
  {
    int v271 = v312;
  }
  int v276 = v317;
  if (v316 != v271) {
    int v276 = 1;
  }
  if (v276 == 1)
  {
    xpc_object_t fObj = 0;
    v326 = 0;
    uint64_t v327 = 0;
    PersonalityIdFromSlotIdEx();
    id v277 = [objc_alloc((Class)NSUUID) initWithUUIDString:&stru_101AC1B28];
    CFUUIDRef uuid = 0;
    UuidFromPersonalityId();
    *(void *)long long buf = 0;
    CFUUIDRef v278 = uuid;
    sub_10012577C((const void **)buf);
    if (v278)
    {
      *(void *)__dst = 0;
      *(void *)__dst = CFUUIDCreateString(0, uuid);
      id v279 = *(id *)__dst;
      if (v279)
      {
        id v280 = [objc_alloc((Class)NSUUID) initWithUUIDString:v279];

        id v277 = v280;
      }
      else
      {
        v286 = *(NSObject **)v318->logger.__ptr_.__value_;
        if (os_log_type_enabled(v286, OS_LOG_TYPE_ERROR))
        {
          v302 = (const char *)HIBYTE(v327);
          if (v327 < 0) {
            v302 = v326;
          }
          p_xpc_object_t fObj = (const char *)&fObj;
          if (v327 < 0) {
            p_xpc_object_t fObj = (const char *)fObj;
          }
          if (v302) {
            v304 = p_fObj;
          }
          else {
            v304 = "<invalid>";
          }
          *(_DWORD *)long long buf = 136315138;
          *(void *)&buf[4] = v304;
          _os_log_error_impl((void *)&_mh_execute_header, v286, OS_LOG_TYPE_ERROR, "UUID for personality ID %s is NULL!", buf, 0xCu);
        }
      }

      sub_1000558F4((const void **)__dst);
      v281 = v318;
    }
    else
    {
      v281 = v318;
      v282 = *(NSObject **)v318->logger.__ptr_.__value_;
      if (os_log_type_enabled(v282, OS_LOG_TYPE_ERROR))
      {
        v283 = (const char *)HIBYTE(v327);
        if (v327 < 0) {
          v283 = v326;
        }
        v284 = (const char *)&fObj;
        if (v327 < 0) {
          v284 = (const char *)fObj;
        }
        if (v283) {
          v285 = v284;
        }
        else {
          v285 = "<invalid>";
        }
        *(_DWORD *)long long buf = 136315138;
        *(void *)&buf[4] = v285;
        _os_log_error_impl((void *)&_mh_execute_header, v282, OS_LOG_TYPE_ERROR, "UUID for personality ID %s is empty!", buf, 0xCu);
      }
    }
    v287 = *(NSObject **)v281->logger.__ptr_.__value_;
    if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v288 = subscriber::asString();
      v289 = (const char *)HIBYTE(v327);
      if (v327 < 0) {
        v289 = v326;
      }
      v290 = (const char *)&fObj;
      if (v327 < 0) {
        v290 = (const char *)fObj;
      }
      *(_DWORD *)long long buf = 136315650;
      if (v289) {
        v291 = v290;
      }
      else {
        v291 = "<invalid>";
      }
      *(void *)&buf[4] = v288;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v291;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v277;
      _os_log_impl((void *)&_mh_execute_header, v287, OS_LOG_TYPE_DEFAULT, "#I Updating local sender identity UUID for sim slot %s with PersonalityID %s to %@", buf, 0x20u);
    }
    [v265 setLocalSenderIdentityUUID:v277];
    object1[0] = 0;
    object1[1] = 0;
    uint64_t v323 = 0;
    [(TelephonyProviderDelegate *)v281 getiSOCountryCodeForCurrentLocation:v316];
    v292 = *(NSObject **)v281->logger.__ptr_.__value_;
    if (os_log_type_enabled(v292, OS_LOG_TYPE_DEFAULT))
    {
      v293 = object1;
      if (v323 < 0) {
        v293 = (xpc_object_t *)object1[0];
      }
      *(_DWORD *)long long buf = 136446210;
      *(void *)&buf[4] = v293;
      _os_log_impl((void *)&_mh_execute_header, v292, OS_LOG_TYPE_DEFAULT, "#I Updating ISO country code to '%{public}s'", buf, 0xCu);
    }
    v321 = 0;
    if (SHIBYTE(v323) < 0)
    {
      sub_10004FC84(__p, object1[0], (unint64_t)object1[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)object1;
      uint64_t v320 = v323;
    }
    if (SHIBYTE(v320) < 0)
    {
      sub_10004FC84(__dst, __p[0], (unint64_t)__p[1]);
    }
    else
    {
      *(_OWORD *)__dst = *(_OWORD *)__p;
      uint64_t v352 = v320;
    }
    v347 = 0;
    if (SHIBYTE(v352) < 0)
    {
      sub_10004FC84(buf, *(void **)__dst, *(unint64_t *)&__dst[8]);
    }
    else
    {
      *(_OWORD *)long long buf = *(_OWORD *)__dst;
      *(void *)&buf[16] = v352;
    }
    v348 = 0;
    if (ctu::cf::convert_copy())
    {
      v294 = v347;
      v347 = v348;
      v349 = v294;
      sub_1000558F4(&v349);
    }
    if ((char)buf[23] < 0) {
      operator delete(*(void **)buf);
    }
    v321 = (void *)v347;
    v347 = 0;
    sub_1000558F4(&v347);
    if (SHIBYTE(v352) < 0) {
      operator delete(*(void **)__dst);
    }
    if (SHIBYTE(v320) < 0) {
      operator delete(__p[0]);
    }
    v295 = v321;
    [v265 setISOCountryCode:v295];

    sub_1000558F4((const void **)&v321);
    if (SHIBYTE(v323) < 0) {
      operator delete(object1[0]);
    }
    sub_10012577C((const void **)&uuid);

    if (SHIBYTE(v327) < 0) {
      operator delete(fObj);
    }
    int v48 = 1;
    v266 = v318;
  }
  if (v313)
  {
    v296 = [v313 callTokens];
    BOOL v297 = v296 == 0;

    v266 = v318;
    if (!v297)
    {
      v298 = [v313 callTokens];
      [v265 setCallTokens:v298];

      v266 = v318;
LABEL_417:
      v299 = [(TelephonyProviderDelegate *)v266 extraCallInfo];
      [v265 setContext:v299];

      id v300 = v265;
      goto LABEL_419;
    }
  }
  if (v48) {
    goto LABEL_417;
  }
  id v300 = 0;
LABEL_419:
  if (SHIBYTE(v331) < 0) {
    operator delete(v329);
  }
  if (SHIBYTE(v334) < 0) {
    operator delete(__s1);
  }
  if (SHIBYTE(v337) < 0) {
    operator delete(v335);
  }
  if (SHIBYTE(v340) < 0) {
    operator delete(object);
  }

  if (SHIBYTE(v343) < 0) {
    operator delete(v341);
  }
  if (SHIBYTE(v346) < 0) {
    operator delete(v344);
  }

  return v300;
}

- (id)evaluateAndCreateCallUpdateWithCallInfo:(dict)a3 previousCallInfo:(dict)a4
{
  uint64_t v6 = *(void **)a3.fObj.fObj;
  xpc_object_t v11 = v6;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t v11 = xpc_null_create();
  }
  BOOL v7 = *(void **)a4.fObj.fObj;
  xpc_object_t object = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  uint64_t v8 = [(TelephonyProviderDelegate *)self evaluateAndCreateCallUpdateWithCallInfo:&v11 previousCallInfo:&object appendCallUpdate:0];
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v11);

  return v8;
}

- (basic_string<char,)getiSOCountryCodeForCurrentLocation:(std::allocator<char>> *__return_ptr)retstr
{
  void (***v15)(uint64_t *__return_ptr, void, void **);
  char v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  uint64_t *v21;
  NSObject *v22;
  std::mutex *v23;
  std::mutex *v24;
  uint64_t v25;
  unsigned __int8 *v26;
  uint64_t v27;
  unsigned int v28;
  void *v29;
  std::__shared_weak_count *v30;
  void (***v31)(uint8_t *__return_ptr, void, void **);
  char v32;
  std::mutex *v33;
  std::mutex *v34;
  uint64_t v35;
  unsigned __int8 *v36;
  uint64_t v37;
  unsigned int v38;
  void *v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  char v42;
  unint64_t size;
  std::mutex *v44;
  std::mutex *v45;
  uint64_t v46;
  unsigned __int8 *v47;
  uint64_t v48;
  unsigned int v49;
  void *v50;
  std::__shared_weak_count *v51;
  uint64_t v52;
  char v53;
  NSObject *v54;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  void *v56[2];
  char v57;
  uint8_t buf[16];
  uint64_t v59;
  void *__p[2];
  long long v61;
  long long v62;
  long long v63;
  long long v64;
  long long v65;
  long long v66;
  long long v67;
  long long v68;
  long long v69;
  long long v70;
  uint64_t v71;
  long long v72;
  void v73[8];
  uint64_t v74;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v75;
  void *v76[2];
  uint64_t v77;

  int v3 = v2;
  uint64_t v4 = v1;
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = 0uLL;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = 0;
  v76[0] = 0;
  v76[1] = 0;
  uint64_t v6 = (Registry **)(v1 + 24);
  v77 = 0;
  PersonalityIdFromSlotIdEx();
  int v74 = 0;
  v75 = 0;
  ServiceMap = (std::mutex *)Registry::getServiceMap(*v6);
  uint64_t v8 = ServiceMap;
  if (v9 < 0)
  {
    uint64_t v10 = (unsigned __int8 *)(v9 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v11 = 5381;
    do
    {
      uint64_t v9 = v11;
      unsigned int v12 = *v10++;
      uint64_t v11 = (33 * v11) ^ v12;
    }
    while (v12);
  }
  std::mutex::lock(ServiceMap);
  __p[0] = (void *)v9;
  int v13 = sub_10004D37C(&v8[1].__m_.__sig, (unint64_t *)__p);
  if (v13)
  {
    uint64_t v15 = (void (***)(uint64_t *__return_ptr, void, void **))v13[3];
    int v14 = (std::__shared_weak_count *)v13[4];
    if (v14)
    {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v8);
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v14);
      BOOL v16 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  std::mutex::unlock(v8);
  int v14 = 0;
  BOOL v16 = 1;
LABEL_9:
  (**v15)(&v74, v15, v76);
  if ((v16 & 1) == 0) {
    sub_10004D2C8(v14);
  }
  if (!v74 || *(_DWORD *)(v74 + 52))
  {
    *(_OWORD *)__p = 0u;
    v61 = 0u;
    MCC::MCC((MCC *)__p);
    uint64_t v17 = *(void *)(v4 + 376);
    if (!v17) {
      goto LABEL_23;
    }
    int v18 = v4 + 376;
    do
    {
      uint64_t v19 = *(_DWORD *)(v17 + 32);
      uint64_t v20 = v19 < v3;
      if (v19 >= v3) {
        int v21 = (uint64_t *)v17;
      }
      else {
        int v21 = (uint64_t *)(v17 + 8);
      }
      if (!v20) {
        int v18 = v17;
      }
      uint64_t v17 = *v21;
    }
    while (*v21);
    if (v18 == v4 + 376 || *(_DWORD *)(v18 + 32) > v3)
    {
LABEL_23:
      BOOL v22 = **(NSObject ***)(v4 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I Getting ISO from cache failed. No last visible MCC found", buf, 2u);
      }
LABEL_25:
      if (SHIBYTE(v61) < 0) {
        operator delete(__p[1]);
      }
      goto LABEL_50;
    }
    MCC::operator=();
    size_t v33 = (std::mutex *)Registry::getServiceMap(*v6);
    uint64_t v34 = v33;
    if (v35 < 0)
    {
      v36 = (unsigned __int8 *)(v35 & 0x7FFFFFFFFFFFFFFFLL);
      BOOL v37 = 5381;
      do
      {
        v35 = v37;
        int v38 = *v36++;
        BOOL v37 = (33 * v37) ^ v38;
      }
      while (v38);
    }
    std::mutex::lock(v33);
    *(void *)long long buf = v35;
    int v39 = sub_10004D37C(&v34[1].__m_.__sig, (unint64_t *)buf);
    if (v39)
    {
      int v41 = v39[3];
      BOOL v40 = (std::__shared_weak_count *)v39[4];
      if (v40)
      {
        atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
        std::mutex::unlock(v34);
        atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
        sub_10004D2C8(v40);
        char v42 = 0;
        if (!v41)
        {
LABEL_79:
          if ((v42 & 1) == 0) {
            sub_10004D2C8(v40);
          }
          goto LABEL_25;
        }
LABEL_75:
        MCC::getStringValue((uint64_t *)v56, (MCC *)__p);
        (*(void (**)(uint8_t *__return_ptr, uint64_t, void **))(*(void *)v41 + 24))(buf, v41, v56);
        if (*((char *)&retstr->__r_.__value_.var0.var1 + 23) < 0) {
          operator delete(retstr->__r_.__value_.var0.var1.__data_);
        }
        *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)buf;
        *((void *)&retstr->__r_.__value_.var0.var1 + 2) = v59;
        HIBYTE(v59) = 0;
        buf[0] = 0;
        if (v57 < 0) {
          operator delete(v56[0]);
        }
        goto LABEL_79;
      }
    }
    else
    {
      int v41 = 0;
    }
    std::mutex::unlock(v34);
    BOOL v40 = 0;
    char v42 = 1;
    if (!v41) {
      goto LABEL_79;
    }
    goto LABEL_75;
  }
  memset(buf, 0, sizeof(buf));
  int v23 = (std::mutex *)Registry::getServiceMap(*v6);
  int v24 = v23;
  if (v25 < 0)
  {
    BOOL v26 = (unsigned __int8 *)(v25 & 0x7FFFFFFFFFFFFFFFLL);
    int v27 = 5381;
    do
    {
      uint64_t v25 = v27;
      BOOL v28 = *v26++;
      int v27 = (33 * v27) ^ v28;
    }
    while (v28);
  }
  std::mutex::lock(v23);
  __p[0] = (void *)v25;
  int v29 = sub_10004D37C(&v24[1].__m_.__sig, (unint64_t *)__p);
  if (!v29)
  {
    int v31 = 0;
    goto LABEL_41;
  }
  int v31 = (void (***)(uint8_t *__return_ptr, void, void **))v29[3];
  BOOL v30 = (std::__shared_weak_count *)v29[4];
  if (!v30)
  {
LABEL_41:
    std::mutex::unlock(v24);
    BOOL v30 = 0;
    uint64_t v32 = 1;
    goto LABEL_42;
  }
  atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
  std::mutex::unlock(v24);
  atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_10004D2C8(v30);
  uint64_t v32 = 0;
LABEL_42:
  (**v31)(buf, v31, v76);
  if ((v32 & 1) == 0) {
    sub_10004D2C8(v30);
  }
  if (*(void *)buf)
  {
    uint64_t v69 = 0u;
    v70 = 0u;
    int v67 = 0u;
    v68 = 0u;
    uint64_t v65 = 0u;
    BOOL v66 = 0u;
    uint64_t v63 = 0u;
    BOOL v64 = 0u;
    v61 = 0u;
    uint64_t v62 = 0u;
    *(_OWORD *)__p = 0u;
    BOOL v71 = 1;
    int v72 = 0u;
    memset(v73, 0, 56);
    if ((*(unsigned int (**)(void, void **))(**(void **)buf + 104))(*(void *)buf, __p)) {
      std::string::operator=((std::string *)retstr, (const std::string *)&v73[1]);
    }
    sub_100350940((uint64_t)__p);
  }
  if (*(void *)&buf[8]) {
    sub_10004D2C8(*(std::__shared_weak_count **)&buf[8]);
  }
LABEL_50:
  size = *((unsigned __int8 *)&retstr->__r_.__value_.var0.var1 + 23);
  if ((size & 0x80u) != 0) {
    size = retstr->__r_.__value_.var0.var1.__size_;
  }
  if (!size)
  {
    int v44 = (std::mutex *)Registry::getServiceMap(*v6);
    BOOL v45 = v44;
    if (v46 < 0)
    {
      unsigned int v47 = (unsigned __int8 *)(v46 & 0x7FFFFFFFFFFFFFFFLL);
      int v48 = 5381;
      do
      {
        int v46 = v48;
        v49 = *v47++;
        int v48 = (33 * v48) ^ v49;
      }
      while (v49);
    }
    std::mutex::lock(v44);
    __p[0] = (void *)v46;
    uint64_t v50 = sub_10004D37C(&v45[1].__m_.__sig, (unint64_t *)__p);
    if (v50)
    {
      uint64_t v52 = v50[3];
      unsigned int v51 = (std::__shared_weak_count *)v50[4];
      if (v51)
      {
        atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
        std::mutex::unlock(v45);
        atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
        sub_10004D2C8(v51);
        int v53 = 0;
        if (!v52) {
          goto LABEL_59;
        }
        goto LABEL_63;
      }
    }
    else
    {
      uint64_t v52 = 0;
    }
    std::mutex::unlock(v45);
    unsigned int v51 = 0;
    int v53 = 1;
    if (!v52)
    {
LABEL_59:
      uint64_t v54 = **(NSObject ***)(v4 + 8);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Getting ISO based on IP failed. No CountryDeterminationInterface found", (uint8_t *)__p, 2u);
      }
LABEL_66:
      if ((v53 & 1) == 0) {
        sub_10004D2C8(v51);
      }
      goto LABEL_68;
    }
LABEL_63:
    (*(void (**)(void **__return_ptr, uint64_t))(*(void *)v52 + 96))(__p, v52);
    if (*((char *)&retstr->__r_.__value_.var0.var1 + 23) < 0) {
      operator delete(retstr->__r_.__value_.var0.var1.__data_);
    }
    *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)__p;
    *((void *)&retstr->__r_.__value_.var0.var1 + 2) = v61;
    goto LABEL_66;
  }
LABEL_68:
  result = v75;
  if (v75) {
    sub_10004D2C8((std::__shared_weak_count *)v75);
  }
  if (SHIBYTE(v77) < 0) {
    operator delete(v76[0]);
  }
  return result;
}

- (id)registerForAVCBBTap:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)qword_101B0D530;
  if (!qword_101B0D530)
  {
    CUTWeakLinkClass();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    qword_101B0D530 = (uint64_t)v5;
    if (!v5)
    {
      int v18 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "(De)Registering Audio Tap failed: null weak link", buf, 2u);
      }
      goto LABEL_27;
    }
  }
  uint64_t v6 = *(NSObject **)self->logger.__ptr_.__value_;
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I DeRegistering Audio Tap", buf, 2u);
      id v5 = (id)qword_101B0D530;
    }
    id v20 = 0;
    unsigned int v13 = [v5 unregisterFromTapWithError:&v20];
    id v14 = v20;
    if (v14) {
      unsigned int v15 = 0;
    }
    else {
      unsigned int v15 = v13;
    }
    if (v15 == 1)
    {
      [(TelephonyProviderDelegate *)self setIsAVCBBTapRegistered:0];
    }
    else
    {
      BOOL v16 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v23 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "DeRegistering Audio Tap failed: %@", buf, 0xCu);
      }
    }

LABEL_27:
    unsigned int v12 = 0;
    goto LABEL_28;
  }
  if (v7)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Registering Audio Tap", buf, 2u);
    id v5 = (id)qword_101B0D530;
  }
  id v21 = 0;
  uint64_t v8 = [v5 registerForTapWithError:&v21];
  id v9 = v21;
  unsigned int v10 = [v8 didSucceed];
  if (v9) {
    unsigned int v11 = 0;
  }
  else {
    unsigned int v11 = v10;
  }
  if (v11 == 1)
  {
    [(TelephonyProviderDelegate *)self setIsAVCBBTapRegistered:1];
    unsigned int v12 = objc_opt_new();
    objc_msgSend(v12, "setCombinedAudioStreamToken:", objc_msgSend(v8, "tapToken"));
    objc_msgSend(v12, "setUplinkStreamToken:", objc_msgSend(v8, "uplinkToken"));
    objc_msgSend(v12, "setDownlinkStreamToken:", objc_msgSend(v8, "downlinkToken"));
  }
  else
  {
    uint64_t v17 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v23 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Registering Audio Tap failed: %@", buf, 0xCu);
    }
    unsigned int v12 = 0;
  }

LABEL_28:

  return v12;
}

- (BOOL)evaluateAndSendCallUpdateWithCallInfo:(dict)a3 previousCallInfo:(dict)a4 appendCallUpdate:(id)a5
{
  id v8 = a5;
  id v9 = *(void **)a3.fObj.fObj;
  xpc_object_t v25 = v9;
  if (v9) {
    xpc_retain(v9);
  }
  else {
    xpc_object_t v25 = xpc_null_create();
  }
  unsigned int v10 = *(void **)a4.fObj.fObj;
  xpc_object_t object = v10;
  if (v10) {
    xpc_retain(v10);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  unsigned int v11 = [(TelephonyProviderDelegate *)self evaluateAndCreateCallUpdateWithCallInfo:&v25 previousCallInfo:&object appendCallUpdate:v8];
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v25);
  xpc_object_t v25 = 0;
  v22[0] = 0;
  v22[1] = 0;
  uint64_t v23 = 0;
  v20[0] = a3.fObj.fObj;
  v20[1] = "kUuid";
  sub_100048BAC((uint64_t)v20, &v21);
  memset(__p, 0, sizeof(__p));
  xpc::dyn_cast_or_default();
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  xpc_release(v21);
  if (v11)
  {
    if (v23 >= 0) {
      unsigned int v12 = v22;
    }
    else {
      unsigned int v12 = (void **)v22[0];
    }
    unsigned int v13 = +[NSString stringWithUTF8String:v12];
    id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
    unsigned int v15 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(__p[0]) = 138412546;
      *(void **)((char *)__p + 4) = v14;
      WORD2(__p[1]) = 2112;
      *(void **)((char *)&__p[1] + 6) = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I Reporting to CSD: call update for %@: %@", (uint8_t *)__p, 0x16u);
    }
    BOOL v16 = [(TelephonyProviderDelegate *)self provider];
    [v16 reportCallWithUUID:v14 updated:v11];
  }
  else
  {
    uint64_t v17 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = v22;
      if (v23 < 0) {
        int v18 = (void **)v22[0];
      }
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I Not reporting to CSD for %s because nothing requiring call update changed.", (uint8_t *)__p, 0xCu);
    }
  }
  if (SHIBYTE(v23) < 0) {
    operator delete(v22[0]);
  }

  return v11 != 0;
}

- (void)handleCallStatusChangedWithOldCalls:(const void *)a3
{
  BOOL v3 = [(TelephonyProviderDelegate *)self provider];
  uint64_t v4 = [v3 pendingTransactions];
  id v5 = [v4 count];

  uint64_t v6 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#N ----> Current calls changed. Num of pending transactions: %lu", buf, 0xCu);
  }
  if (v5)
  {
    BOOL v7 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(TelephonyProviderDelegate *)self provider];
      id v9 = [v8 pendingTransactions];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I Pending Transactions: %@", buf, 0xCu);
    }
  }
  memset(v14, 0, sizeof(v14));
  [(TelephonyProviderDelegate *)self getCurrentCalls];
  if (*((void *)a3 + 1) != *(void *)a3
    && _os_feature_enabled_impl()
    && [(TelephonyProviderDelegate *)self isAVCBBTapRegistered])
  {
    unsigned int v10 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Current calls cleaned up but still Audio Tap Registered. This should NOT happen", buf, 2u);
    }
    id v11 = [(TelephonyProviderDelegate *)self registerForAVCBBTap:0];
  }
  *(void *)long long buf = v14;
  sub_1001F1FAC((void ***)buf);
}

- (BOOL)shouldIncludeInCallHistory:(int)a3 phoneNumber:()basic_string<char
{
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)BOOL v26 = 0u;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)int v24 = 0u;
  long long v25 = 0u;
  *(_OWORD *)BOOL v22 = 0u;
  long long v23 = 0u;
  CSIPhoneNumber::CSIPhoneNumber();
  int left = (char *)self->fExcludedNumbers.fValue.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->fExcludedNumbers.fValue.__tree_.__pair1_;
  uint64_t v6 = left;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  if (!left) {
    goto LABEL_18;
  }
  id v9 = p_pair1;
  do
  {
    int v10 = *((_DWORD *)v6 + 8);
    BOOL v11 = v10 < a3;
    if (v10 >= a3) {
      unsigned int v12 = (void **)v6;
    }
    else {
      unsigned int v12 = (void **)(v6 + 8);
    }
    if (!v11) {
      id v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, std::vector<CSIPhoneNumber>>, void *>>> *)v6;
    }
    uint64_t v6 = (char *)*v12;
  }
  while (*v12);
  if (v9 == p_pair1
    || SLODWORD(v9[4].__value_.__left_) > a3
    || &v19 == (uint64_t *)&v9[5]
    || (sub_100702898((uint64_t)&v19, (uint64_t)v9[5].__value_.__left_, (uint64_t)v9[6].__value_.__left_, 0xF0F0F0F0F0F0F0F1 * (((char *)v9[6].__value_.__left_ - (char *)v9[5].__value_.__left_) >> 3)), uint64_t v13 = v19, v14 = v20, v19 == v20))
  {
LABEL_18:
    char v17 = 1;
  }
  else
  {
    do
    {
      char v15 = CSIPhoneNumber::operator==();
      v13 += 136;
      if (v13 == v14) {
        char v16 = 1;
      }
      else {
        char v16 = v15;
      }
    }
    while ((v16 & 1) == 0);
    char v17 = v15 ^ 1;
  }
  int v31 = (void **)&v19;
  sub_100702C2C(&v31);
  if (SHIBYTE(v28) < 0) {
    operator delete(__p[1]);
  }
  if (SHIBYTE(__p[0]) < 0) {
    operator delete(v26[0]);
  }
  if (SBYTE7(v25) < 0) {
    operator delete(v24[0]);
  }
  if (SHIBYTE(v23) < 0) {
    operator delete(v22[1]);
  }
  return v17;
}

- (BOOL)supportsDownlinkDtmf:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (capabilities::ct::supportsDownlinkDTMFDetection((capabilities::ct *)self))
  {
    ServiceMap = (std::mutex *)Registry::getServiceMap(self->fRegistry.__ptr_);
    uint64_t v6 = ServiceMap;
    if (v7 < 0)
    {
      id v8 = (unsigned __int8 *)(v7 & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t v9 = 5381;
      do
      {
        uint64_t v7 = v9;
        unsigned int v10 = *v8++;
        uint64_t v9 = (33 * v9) ^ v10;
      }
      while (v10);
    }
    std::mutex::lock(ServiceMap);
    *(void *)long long buf = v7;
    BOOL v11 = sub_10004D37C(&v6[1].__m_.__sig, (unint64_t *)buf);
    if (v11)
    {
      uint64_t v13 = v11[3];
      unsigned int v12 = (std::__shared_weak_count *)v11[4];
      if (v12)
      {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        std::mutex::unlock(v6);
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        sub_10004D2C8(v12);
        char v14 = 0;
        if (!v13)
        {
LABEL_8:
          char v15 = *(NSObject **)self->logger.__ptr_.__value_;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CarrierSettings not found.", buf, 2u);
          }
          BOOL v16 = 0;
LABEL_40:
          if ((v14 & 1) == 0) {
            sub_10004D2C8(v12);
          }
          return v16;
        }
LABEL_15:
        int v18 = operator new(0x18uLL);
        uint64_t v50 = v18 + 3;
        unsigned int v51 = (char *)(v18 + 3);
        *(_OWORD *)int v18 = *(_OWORD *)off_1019FD060;
        v18[2] = @"EnableIncomingDTMF";
        v49 = v18;
        uint64_t v19 = operator new(0x10uLL);
        unsigned int v47 = v19 + 2;
        int v48 = v19 + 2;
        void *v19 = @"EmergencyCalling";
        v19[1] = @"EnableSOSVoiceLoopControl";
        __p = v19;
        CFTypeRef cf = 0;
        (*(void (**)(CFTypeRef *__return_ptr, uint64_t, uint64_t, uint64_t, void **, const CFBooleanRef, void))(*(void *)v13 + 104))(&cf, v13, v3, 1, &v49, kCFBooleanFalse, 0);
        uint64_t v20 = (BOOL *)cf;
        buf[0] = 0;
        if (cf)
        {
          CFTypeID v21 = CFGetTypeID(cf);
          if (v21 == CFBooleanGetTypeID()) {
            ctu::cf::assign((ctu::cf *)buf, v20, v22);
          }
        }
        int v23 = buf[0];
        CFTypeRef v44 = 0;
        (*(void (**)(CFTypeRef *__return_ptr, uint64_t, uint64_t, uint64_t, void **, const CFBooleanRef, void))(*(void *)v13 + 104))(&v44, v13, v3, 1, &__p, kCFBooleanFalse, 0);
        int v24 = (BOOL *)v44;
        buf[0] = 0;
        if (v44)
        {
          CFTypeID v25 = CFGetTypeID(v44);
          if (v25 == CFBooleanGetTypeID()) {
            ctu::cf::assign((ctu::cf *)buf, v24, v26);
          }
        }
        int v27 = buf[0];
        CFTypeRef v43 = 0;
        (*(void (**)(CFTypeRef *__return_ptr, uint64_t, uint64_t, uint64_t, void **, const CFBooleanRef, void))(*(void *)v13 + 104))(&v43, v13, v3, 2, &v49, kCFBooleanFalse, 0);
        long long v28 = (BOOL *)v43;
        buf[0] = 0;
        if (v43)
        {
          CFTypeID v29 = CFGetTypeID(v43);
          if (v29 == CFBooleanGetTypeID()) {
            ctu::cf::assign((ctu::cf *)buf, v28, v30);
          }
        }
        int v31 = buf[0];
        CFTypeRef v42 = 0;
        (*(void (**)(CFTypeRef *__return_ptr, uint64_t, uint64_t, uint64_t, void **, const CFBooleanRef, void))(*(void *)v13 + 104))(&v42, v13, v3, 2, &__p, kCFBooleanFalse, 0);
        uint64_t v32 = (BOOL *)v42;
        buf[0] = 0;
        if (v42)
        {
          CFTypeID v33 = CFGetTypeID(v42);
          if (v33 == CFBooleanGetTypeID())
          {
            ctu::cf::assign((ctu::cf *)buf, v32, v34);
            LOBYTE(v32) = buf[0] != 0;
          }
          else
          {
            LOBYTE(v32) = 0;
          }
        }
        v35 = *(NSObject **)self->logger.__ptr_.__value_;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = asStringBool(v23 != 0);
          uint64_t v37 = asStringBool(v27 != 0);
          uint64_t v38 = asStringBool(v31 != 0);
          uint64_t v39 = asStringBool((BOOL)v32);
          *(_DWORD *)long long buf = 136315906;
          *(void *)&uint8_t buf[4] = v36;
          __int16 v53 = 2080;
          uint64_t v54 = v37;
          __int16 v55 = 2080;
          uint64_t v56 = v38;
          __int16 v57 = 2080;
          uint64_t v58 = v39;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#I Carrier supports EnableIncomingDTMF: %s, Carrier supports VoiceLoopControl: %s, Operator supports EnableIncomingDTMF: %s, Operator supports VoiceLoopControl: %s", buf, 0x2Au);
        }
        if (v23) {
          char v40 = (char)v32;
        }
        else {
          char v40 = 0;
        }
        if (v31) {
          BOOL v16 = v40;
        }
        else {
          BOOL v16 = 0;
        }
        sub_1000577C4(&v42);
        sub_1000577C4(&v43);
        sub_1000577C4(&v44);
        sub_1000577C4(&cf);
        if (__p)
        {
          unsigned int v47 = __p;
          operator delete(__p);
        }
        if (v49)
        {
          uint64_t v50 = v49;
          operator delete(v49);
        }
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    std::mutex::unlock(v6);
    unsigned int v12 = 0;
    char v14 = 1;
    if (!v13) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
  char v17 = *(NSObject **)self->logger.__ptr_.__value_;
  BOOL v16 = 0;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I Downlink DTMF voice loop control is not supported on current device", buf, 2u);
    return 0;
  }
  return v16;
}

- (void)handleCallCapabilitiesChanged
{
  id v8 = [(TelephonyProviderDelegate *)self provider];
  uint64_t v3 = [v8 configuration];
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    uint64_t v7 = (void *)v3;
    memset(v9, 0, sizeof(v9));
    [(TelephonyProviderDelegate *)self getCurrentCalls];
    uint64_t v6 = *(NSObject **)self->logger.__ptr_.__value_;
    uint64_t v4 = v7;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Drop call capabilities change because of no active calls", buf, 2u);
    }
    *(void *)long long buf = v9;
    sub_1001F1FAC((void ***)buf);
  }
  else
  {
    id v5 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "No config found for provider %@", buf, 0xCu);
    }
  }
}

- (void)handleEmergencyNumbersChanged
{
  int v23 = [(TelephonyProviderDelegate *)self provider];
  uint64_t v3 = [v23 configuration];
  if (v3)
  {
    int left = (char *)self->fEmergencyNumbers.fValue.__tree_.__pair1_.__value_.__left_;
    long long buf = 0uLL;
    uint64_t v27 = 0;
    if (left)
    {
      p_pair1 = &self->fEmergencyNumbers.fValue.__tree_.__pair1_;
      do
      {
        int v6 = *((_DWORD *)left + 8);
        BOOL v7 = v6 < 1;
        if (v6 >= 1) {
          id v8 = (char **)left;
        }
        else {
          id v8 = (char **)(left + 8);
        }
        if (!v7) {
          p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, std::vector<std::string>>, void *>>> *)left;
        }
        int left = *v8;
      }
      while (*v8);
      if (p_pair1 != &self->fEmergencyNumbers.fValue.__tree_.__pair1_
        && SLODWORD(p_pair1[4].__value_.__left_) <= 1
        && &buf != (long long *)&p_pair1[5])
      {
        sub_10005CA3C((uint64_t)&buf, (std::string *)p_pair1[5].__value_.__left_, (long long *)p_pair1[6].__value_.__left_, 0xAAAAAAAAAAAAAAABLL * (((char *)p_pair1[6].__value_.__left_ - (char *)p_pair1[5].__value_.__left_) >> 3));
      }
    }
    unsigned int v10 = objc_opt_new();
    unsigned int v12 = (long long *)*((void *)&buf + 1);
    for (i = (long long *)buf; i != v12; i = (long long *)((char *)i + 24))
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v25 = 0;
      if (*((char *)i + 23) < 0)
      {
        sub_10004FC84(__p, *(void **)i, *((void *)i + 1));
      }
      else
      {
        long long v13 = *i;
        uint64_t v25 = *((void *)i + 2);
        *(_OWORD *)__p = v13;
      }
      if (v25 >= 0) {
        char v14 = __p;
      }
      else {
        char v14 = (void **)__p[0];
      }
      char v15 = +[NSString stringWithUTF8String:v14];
      id v16 = [objc_alloc((Class)CXHandle) initWithType:2 value:v15];
      [v10 addObject:v16];

      if (SHIBYTE(v25) < 0) {
        operator delete(__p[0]);
      }
    }
    if ([v10 count])
    {
      char v17 = [v3 emergencyHandles];
      unsigned int v18 = [v17 isEqualToArray:v10];

      if (!v18)
      {
        [v3 setEmergencyHandles:v10];
        CFBooleanRef v22 = *(NSObject **)self->logger.__ptr_.__value_;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(__p[0]) = 138412290;
          *(void **)((char *)__p + 4) = v10;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I Updating config for CSD: emergency handles: %@", (uint8_t *)__p, 0xCu);
        }
        [v23 setConfiguration:v3];
        goto LABEL_38;
      }
      uint64_t v19 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(__p[0]) = 0;
        uint64_t v20 = "#I Not updating config for CSD: no emergency handles changed";
LABEL_34:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)__p, 2u);
      }
    }
    else
    {
      uint64_t v19 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(__p[0]) = 0;
        uint64_t v20 = "#I Not updating config for CSD: no emergency handles found";
        goto LABEL_34;
      }
    }
LABEL_38:

    __p[0] = &buf;
    sub_100047F64((void ***)__p);
    goto LABEL_39;
  }
  CFTypeID v21 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "No config found for provider %@", (uint8_t *)&buf, 0xCu);
  }
LABEL_39:
}

- (void)handleDisambiguationEmergencyNumbersChanged
{
  int v46 = [(TelephonyProviderDelegate *)self provider];
  BOOL v45 = [v46 configuration];
  if (v45)
  {
    unsigned int v51 = 0;
    uint64_t v52 = 0;
    unint64_t v53 = 0;
    subscriber::makeSimSlotRange();
    uint64_t v3 = *(unsigned int **)__dst;
    int v2 = *(unsigned int **)&__dst[8];
    if (*(void *)__dst != *(void *)&__dst[8])
    {
      uint64_t v4 = (uint64_t (*)(void))__p[0];
      while ((((uint64_t (*)(void))__p[0])(*v3) & 1) == 0)
      {
        if (++v3 == *(unsigned int **)&__dst[8])
        {
          uint64_t v3 = *(unsigned int **)&__dst[8];
          break;
        }
      }
      id v5 = *(unsigned int **)&__dst[8];
      if (v3 != *(unsigned int **)&__dst[8])
      {
        p_pair1 = &self->fDisambiguationEmergencyNumbers.fValue.__tree_.__pair1_;
        CFTypeRef v44 = *(unsigned int **)&__dst[8];
        do
        {
          int left = (char *)p_pair1->__value_.__left_;
          if (p_pair1->__value_.__left_)
          {
            signed int v8 = *v3;
            uint64_t v9 = &self->fDisambiguationEmergencyNumbers.fValue.__tree_.__pair1_;
            do
            {
              signed int v10 = *((_DWORD *)left + 8);
              BOOL v11 = v10 < v8;
              if (v10 >= v8) {
                unsigned int v12 = (void **)left;
              }
              else {
                unsigned int v12 = (void **)(left + 8);
              }
              if (!v11) {
                uint64_t v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, std::vector<DisambiguationEmergencyNumber>>, void *>>> *)left;
              }
              int left = (char *)*v12;
            }
            while (*v12);
            if (v9 != p_pair1 && v8 >= SLODWORD(v9[4].__value_.__left_))
            {
              int v48 = 0;
              v49 = 0;
              uint64_t v50 = 0;
              sub_100702CB0(&v48, (uint64_t)v9[5].__value_.__left_, (uint64_t)v9[6].__value_.__left_, 0x6DB6DB6DB6DB6DB7 * (((char *)v9[6].__value_.__left_ - (char *)v9[5].__value_.__left_) >> 3));
              char v14 = v48;
              long long v13 = v49;
              while (v14 != v13)
              {
                char v15 = *(NSObject **)self->logger.__ptr_.__value_;
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  id v16 = (unsigned __int8 *)v14;
                  if (*((char *)v14 + 23) < 0) {
                    id v16 = (unsigned __int8 *)*v14;
                  }
                  char v17 = v14 + 3;
                  if (*((char *)v14 + 47) < 0) {
                    char v17 = (void *)*v17;
                  }
                  *(_DWORD *)long long buf = 136446466;
                  *(void *)&uint8_t buf[4] = v16;
                  __int16 v58 = 2082;
                  int v59 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I Adding emergency labeled number (disambiguation number): Num %{public}s Title %{public}s", buf, 0x16u);
                }
                uint64_t v18 = (uint64_t)v51;
                uint64_t v19 = v52;
                if (v51 != v52)
                {
                  int v20 = *((char *)v14 + 23);
                  if (v20 >= 0) {
                    uint64_t v21 = *((unsigned __int8 *)v14 + 23);
                  }
                  else {
                    uint64_t v21 = v14[1];
                  }
                  do
                  {
                    uint64_t v22 = *(unsigned __int8 *)(v18 + 23);
                    if ((v22 & 0x80u) == 0) {
                      uint64_t v23 = *(unsigned __int8 *)(v18 + 23);
                    }
                    else {
                      uint64_t v23 = *(void *)(v18 + 8);
                    }
                    if (v23 == v21)
                    {
                      if (v20 >= 0) {
                        int v24 = (unsigned __int8 *)v14;
                      }
                      else {
                        int v24 = (unsigned __int8 *)*v14;
                      }
                      if ((v22 & 0x80) != 0)
                      {
                        if (!memcmp(*(const void **)v18, v24, *(void *)(v18 + 8))) {
                          goto LABEL_50;
                        }
                      }
                      else
                      {
                        if (!*(unsigned char *)(v18 + 23)) {
                          goto LABEL_50;
                        }
                        uint64_t v25 = 0;
                        while (*(unsigned __int8 *)(v18 + v25) == v24[v25])
                        {
                          if (v22 == ++v25) {
                            goto LABEL_50;
                          }
                        }
                      }
                    }
                    v18 += 56;
                  }
                  while ((char *)v18 != v19);
                }
                if ((unint64_t)v19 >= v53)
                {
                  uint64_t v26 = sub_100702EE0((uint64_t *)&v51, (long long *)v14);
                }
                else
                {
                  sub_100703000(v19, (long long *)v14);
                  uint64_t v26 = (uint64_t)(v19 + 56);
                }
                uint64_t v52 = (char *)v26;
LABEL_50:
                v14 += 7;
              }
              *(void *)long long buf = &v48;
              sub_100702E5C((void ***)buf);
              id v5 = v44;
            }
          }
          uint64_t v27 = v3 + 1;
          uint64_t v3 = v2;
          if (v27 != v2)
          {
            uint64_t v3 = v27;
            while ((v4(*v3) & 1) == 0)
            {
              if (++v3 == v2)
              {
                uint64_t v3 = v2;
                break;
              }
            }
          }
        }
        while (v3 != v5);
      }
    }
    long long v28 = objc_opt_new();
    uint64_t v29 = (uint64_t)v51;
    for (i = v52; (char *)v29 != i; v29 += 56)
    {
      uint64_t v56 = 0;
      memset(__p, 0, sizeof(__p));
      *(_OWORD *)__dst = 0u;
      if (*(char *)(v29 + 23) < 0)
      {
        sub_10004FC84(__dst, *(void **)v29, *(void *)(v29 + 8));
      }
      else
      {
        long long v31 = *(_OWORD *)v29;
        __p[0] = *(void **)(v29 + 16);
        *(_OWORD *)__dst = v31;
      }
      if (*(char *)(v29 + 47) < 0)
      {
        sub_10004FC84(&__p[1], *(void **)(v29 + 24), *(void *)(v29 + 32));
      }
      else
      {
        long long v32 = *(_OWORD *)(v29 + 24);
        __p[3] = *(void **)(v29 + 40);
        *(_OWORD *)&__p[1] = v32;
      }
      uint64_t v56 = *(void *)(v29 + 48);
      if (SHIBYTE(__p[0]) >= 0) {
        CFTypeID v33 = __dst;
      }
      else {
        CFTypeID v33 = *(uint8_t **)__dst;
      }
      CFBooleanRef v34 = +[NSString stringWithUTF8String:v33];
      if (SHIBYTE(__p[3]) >= 0) {
        v35 = &__p[1];
      }
      else {
        v35 = (void **)__p[1];
      }
      uint64_t v36 = +[NSString stringWithUTF8String:v35];
      id v37 = [objc_alloc((Class)CXHandle) initWithType:2 value:v34];
      id v38 = [objc_alloc((Class)CXLabeledHandle) initWithHandle:v37 label:v36];
      [v28 addObject:v38];

      if (SHIBYTE(__p[3]) < 0) {
        operator delete(__p[1]);
      }
      if (SHIBYTE(__p[0]) < 0) {
        operator delete(*(void **)__dst);
      }
    }
    uint64_t v39 = [v45 emergencyLabeledHandles];
    unsigned int v40 = [v39 isEqualToArray:v28];

    if (v40)
    {
      int v41 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__dst = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#I Not updating config for CSD: no emergency labeled handles changed", __dst, 2u);
      }
    }
    else
    {
      [v45 setEmergencyLabeledHandles:v28];
      CFTypeRef v43 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__dst = 138412290;
        *(void *)&__dst[4] = v28;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#I Updating config for CSD: emergency labeled handles: %@", __dst, 0xCu);
      }
      [v46 setConfiguration:v45];
    }

    *(void *)__dst = &v51;
    sub_100702E5C((void ***)__dst);
  }
  else
  {
    CFTypeRef v42 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__dst = 138412290;
      *(void *)&__dst[4] = v46;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "No config found for provider %@", __dst, 0xCu);
    }
  }
}

- (void)handleCallFrequencyDataChanged
{
  uint64_t v20 = 0;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)xpc_object_t object = 0u;
  if (*((char *)&self->fCallFrequencyData.fValue.fCallUuid.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_10004FC84(__p, self->fCallFrequencyData.fValue.fCallUuid.__r_.__value_.var0.var1.__data_, self->fCallFrequencyData.fValue.fCallUuid.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)self->fCallFrequencyData.fValue.fCallUuid.__r_.__value_.var0.var0.__data_;
    object[0] = *((xpc_object_t *)&self->fCallFrequencyData.fValue.fCallUuid.__r_.__value_.var0.var1 + 2);
  }
  uint64_t v3 = *(void **)&self->fCallFrequencyData.fValue.fCallUuid.__r_.var0;
  object[1] = v3;
  if (v3)
  {
    xpc_retain(v3);
    xpc_object_t v4 = object[1];
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    object[1] = v4;
  }
  LOBYTE(v20) = self->fCallFrequencyData.fValue.fCallUuid.var0;
  id v5 = (void *)HIBYTE(object[0]);
  if (SHIBYTE(object[0]) < 0) {
    id v5 = __p[1];
  }
  if (v5)
  {
    xpc_object_t v17 = v4;
    if (v4)
    {
      xpc_retain(v4);
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v17 = v4;
    }
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_null)
    {
      char v14 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Not sending call freq update. Frequency data is nil.", buf, 2u);
      }
    }
    else
    {
      if (SHIBYTE(object[0]) >= 0) {
        int v6 = __p;
      }
      else {
        int v6 = (void **)__p[0];
      }
      BOOL v7 = +[NSString stringWithUTF8String:v6];
      id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
      if ((_BYTE)v20) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 2;
      }
      *(void *)long long buf = 0;
      xpc::bridge((uint64_t *)&v15, (xpc *)&v17, v8);
      sub_1000C15D8(buf, &v15);
      sub_1000577C4(&v15);
      if (*(void *)buf) {
        BOOL v11 = sub_10008324C;
      }
      else {
        BOOL v11 = 0;
      }
      if (v11)
      {
        id v12 = *(id *)buf;
        long long v13 = [(TelephonyProviderDelegate *)self provider];
        [v13 reportCallWithUUID:v9 changedFrequencyData:v12 forDirection:v10];
      }
      sub_100030068((const void **)buf);

      xpc_object_t v4 = v17;
    }
    xpc_release(v4);
    xpc_object_t v4 = object[1];
  }
  xpc_release(v4);
  object[1] = 0;
  if (SHIBYTE(object[0]) < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleThumperAccountIdChanged
{
  uint64_t v3 = [(TelephonyProviderDelegate *)self provider];
  xpc_object_t v4 = [v3 configuration];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<PersonalityID, VoWiFiProvisioningState>, void *>>> *)self->fVoWiFiProv.fValue.__tree_.__begin_node_;
    if (begin_node != &self->fVoWiFiProv.fValue.__tree_.__pair1_)
    {
      do
      {
        *(_OWORD *)__p = 0u;
        long long v19 = 0u;
        sub_1000593FC((uint64_t)__p, (long long *)&begin_node[8]);
        if (BYTE8(v19))
        {
          char v7 = BYTE7(v19);
          if (SBYTE7(v19) < 0)
          {
            if (!__p[1]) {
              goto LABEL_10;
            }
            signed int v8 = (void **)__p[0];
          }
          else
          {
            if (!BYTE7(v19)) {
              goto LABEL_12;
            }
            signed int v8 = __p;
          }
          id v9 = +[NSString stringWithUTF8String:v8];
          [v5 addObject:v9];

          char v7 = BYTE7(v19);
          if (BYTE8(v19))
          {
LABEL_10:
            if (v7 < 0) {
              operator delete(__p[0]);
            }
          }
        }
LABEL_12:
        int left = (TelephonyProviderDelegate *)begin_node[1].__value_.__left_;
        if (left)
        {
          do
          {
            BOOL v11 = left;
            int left = (TelephonyProviderDelegate *)left->super.isa;
          }
          while (left);
        }
        else
        {
          do
          {
            BOOL v11 = (TelephonyProviderDelegate *)begin_node[2].__value_.__left_;
            BOOL v12 = v11->super.isa == (Class)begin_node;
            begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<PersonalityID, VoWiFiProvisioningState>, void *>>> *)v11;
          }
          while (!v12);
        }
        begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<PersonalityID, VoWiFiProvisioningState>, void *>>> *)v11;
      }
      while (v11 != (TelephonyProviderDelegate *)&self->fVoWiFiProv.fValue.__tree_.__pair1_);
    }
    long long v13 = [v4 handoffIdentifiers];
    unsigned int v14 = [v13 isEqualToArray:v5];

    if (v14)
    {
      char v15 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I Not updating config for CSD: no handoff identifiers changed", (uint8_t *)__p, 2u);
      }
    }
    else
    {
      [v4 setHandoffIdentifiers:v5];
      xpc_object_t v17 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(__p[0]) = 138412290;
        *(void **)((char *)__p + 4) = v5;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I Updating config for CSD: handoff identifiers: %@ ", (uint8_t *)__p, 0xCu);
      }
      [v3 setConfiguration:v4];
    }
  }
  else
  {
    id v16 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p[0]) = 138412290;
      *(void **)((char *)__p + 4) = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No config found for provider %@", (uint8_t *)__p, 0xCu);
    }
  }
}

- (void)handleCallControlFailure:(const void *)a3
{
  id v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *((int *)a3 + 6);
    if (v6 > 8) {
      char v7 = "Unknown";
    }
    else {
      char v7 = off_1019FE0F8[v6];
    }
    if (*((char *)a3 + 23) >= 0) {
      signed int v8 = a3;
    }
    else {
      signed int v8 = *(const void **)a3;
    }
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#N Got call control failure for action type %s for call %s", buf, 0x16u);
  }
  id v9 = [(TelephonyProviderDelegate *)self provider];
  uint64_t v10 = [v9 pendingTransactions];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v11 = v10;
  CFTypeRef v42 = v11;
  id v12 = [v11 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v12)
  {
    uint64_t v14 = *(void *)v54;
    *(void *)&long long v13 = 134218242;
    long long v40 = v13;
    uint64_t v41 = *(void *)v54;
    do
    {
      id v43 = v12;
      CFTypeRef v44 = 0;
      do
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v11);
        }
        char v15 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v44);
        if ((objc_msgSend(v15, "isComplete", v40) & 1) == 0)
        {
          memset(buf, 0, sizeof(buf));
          id v16 = [v15 UUID];
          sub_100848F68(v16, buf);

          uint64_t v17 = *((unsigned __int8 *)a3 + 79);
          if ((v17 & 0x80u) == 0) {
            uint64_t v18 = *((unsigned __int8 *)a3 + 79);
          }
          else {
            uint64_t v18 = *((void *)a3 + 8);
          }
          if (!v18) {
            goto LABEL_32;
          }
          uint64_t v19 = buf[23];
          if ((buf[23] & 0x80u) != 0) {
            uint64_t v19 = *(void *)&buf[8];
          }
          if (v18 != v19) {
            goto LABEL_32;
          }
          if ((buf[23] & 0x80u) == 0) {
            uint64_t v20 = buf;
          }
          else {
            uint64_t v20 = *(uint8_t **)buf;
          }
          if ((v17 & 0x80) != 0)
          {
            if (memcmp(*((const void **)a3 + 7), v20, *((void *)a3 + 8))) {
              goto LABEL_32;
            }
          }
          else if (*((unsigned char *)a3 + 79))
          {
            uint64_t v21 = (unsigned __int8 *)a3 + 56;
            while (*v21 == *v20)
            {
              ++v21;
              ++v20;
              if (!--v17) {
                goto LABEL_66;
              }
            }
LABEL_32:
            uint64_t v22 = [v15 actions];
            uint64_t v23 = v22;
            uint64_t v25 = (long long *)*((void *)a3 + 4);
            int v24 = (long long *)*((void *)a3 + 5);
            if (v24 == v25)
            {
              long long v47 = 0u;
              long long v48 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              id v27 = v22;
              id v28 = [v27 countByEnumeratingWithState:&v45 objects:v57 count:16];
              if (v28)
              {
                uint64_t v29 = *(void *)v46;
                do
                {
                  for (i = 0; i != v28; i = (char *)i + 1)
                  {
                    if (*(void *)v46 != v29) {
                      objc_enumerationMutation(v27);
                    }
                    long long v31 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                    if (([v31 isComplete] & 1) == 0)
                    {
                      if ([v31 fail:a3])
                      {
                        long long v32 = *(NSObject **)self->logger.__ptr_.__value_;
                        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                        {
                          uint64_t v33 = [v31 UUID];
                          CFBooleanRef v34 = (void *)v33;
                          if (*((char *)a3 + 23) >= 0) {
                            v35 = a3;
                          }
                          else {
                            v35 = *(const void **)a3;
                          }
                          *(_DWORD *)__dst = 138412546;
                          *(void *)&__dst[4] = v33;
                          *(_WORD *)&__dst[12] = 2080;
                          *(void *)&__dst[14] = v35;
                          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#I **** Action %@ failed with call %s! ****", __dst, 0x16u);
                        }
                      }
                    }
                  }
                  id v28 = [v27 countByEnumeratingWithState:&v45 objects:v57 count:16];
                }
                while (v28);
              }
            }
            else
            {
              do
              {
                memset(__dst, 0, 24);
                if (*((char *)v25 + 23) < 0)
                {
                  sub_10004FC84(__dst, *(void **)v25, *((void *)v25 + 1));
                }
                else
                {
                  long long v26 = *v25;
                  *(void *)&uint8_t __dst[16] = *((void *)v25 + 2);
                  *(_OWORD *)__dst = v26;
                }
                v49[0] = _NSConcreteStackBlock;
                v49[1] = 3321888768;
                v49[2] = sub_1006FC268;
                v49[3] = &unk_1019FD080;
                if ((char)__dst[23] < 0)
                {
                  sub_10004FC84(&__p, *(void **)__dst, *(unint64_t *)&__dst[8]);
                }
                else
                {
                  long long __p = *(_OWORD *)__dst;
                  uint64_t v51 = *(void *)&__dst[16];
                }
                v49[4] = self;
                uint64_t v52 = a3;
                [v23 enumerateObjectsUsingBlock:v49];
                if (SHIBYTE(v51) < 0) {
                  operator delete((void *)__p);
                }
                if ((char)__dst[23] < 0) {
                  operator delete(*(void **)__dst);
                }
                uint64_t v25 = (long long *)((char *)v25 + 24);
              }
              while (v25 != v24);
            }

            uint64_t v14 = v41;
            id v12 = v43;
LABEL_61:
            if ((char)buf[23] < 0) {
              operator delete(*(void **)buf);
            }
            id v11 = v42;
            goto LABEL_64;
          }
LABEL_66:
          uint64_t v36 = sub_100848FE8(v15);
          id v37 = *(NSObject **)self->logger.__ptr_.__value_;
          uint64_t v14 = v41;
          id v12 = v43;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            id v38 = (char *)a3 + 56;
            if (*((char *)a3 + 79) < 0) {
              id v38 = (char *)*((void *)a3 + 7);
            }
            *(_DWORD *)__dst = v40;
            *(void *)&__dst[4] = v36;
            *(_WORD *)&__dst[12] = 2080;
            *(void *)&__dst[14] = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#I For call control failure, failed %zu actions in transaction %s", __dst, 0x16u);
          }
          goto LABEL_61;
        }
LABEL_64:
        CFTypeRef v44 = (char *)v44 + 1;
      }
      while (v44 != v12);
      id v39 = [v11 countByEnumeratingWithState:&v53 objects:v60 count:16];
      id v12 = v39;
    }
    while (v39);
  }
}

- (void)handleCallToneComplete:(const void *)a3
{
  if (*((char *)a3 + 23) < 0)
  {
    if (!*((void *)a3 + 1)) {
      return;
    }
    a3 = *(const void **)a3;
  }
  else if (!*((unsigned char *)a3 + 23))
  {
    return;
  }
  xpc_object_t v4 = +[NSString stringWithUTF8String:a3];
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:v4];
  uint64_t v6 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Reporting to CSD: Tone end received for call %@", (uint8_t *)&v8, 0xCu);
  }
  char v7 = [(TelephonyProviderDelegate *)self provider];
  [v7 reportAudioFinishedForCallWithUUID:v5];
}

- (void)handleDownlinkDtmfEvent:(const void *)a3 dtmf:(char)a4
{
  int v4 = a4;
  if (*((char *)a3 + 23) < 0) {
    a3 = *(const void **)a3;
  }
  uint64_t v6 = +[NSString stringWithUTF8String:a3];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  __int16 v13 = v4;
  id v8 = objc_alloc((Class)CXCallDTMFUpdate);
  id v9 = +[NSString stringWithCharacters:&v13 length:1];
  id v10 = [v8 initWithDigits:v9];

  id v11 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v15 = v7;
    __int16 v16 = 1024;
    int v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I Reporting to CSD: downlink DTMF event received for call %@: key pressed: %c", buf, 0x12u);
  }
  id v12 = [(TelephonyProviderDelegate *)self provider];
  [v12 reportCallWithUUID:v7 receivedDTMFUpdate:v10];
}

- (void)handleThumperHandoffAvailabilityChanged
{
  memset(v2, 0, sizeof(v2));
  [(TelephonyProviderDelegate *)self getCurrentCalls];
  *(void *)long long buf = v2;
  sub_1001F1FAC((void ***)buf);
}

+ (int)sActionToType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v4 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v4 = 2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v4 = 3;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v4 = 4;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v4 = 5;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v4 = 6;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  int v4 = 7;
                }
                else {
                  int v4 = 8;
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (BOOL)provider:(id)a3 executeTransaction:(id)a4
{
  id v64 = a3;
  id v6 = a4;
  BOOL v66 = self;
  id v7 = *(NSObject **)self->logger.__ptr_.__value_;
  int v67 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 actions];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&uint8_t buf[4] = [v8 count];
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#N Transaction (size %lu): %@", buf, 0x16u);
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v9 = objc_msgSend(v6, "actions", v64);
  id v10 = [v9 countByEnumeratingWithState:&v97 objects:v110 count:16];
  if (!v10)
  {

    goto LABEL_53;
  }
  char v11 = 0;
  uint64_t v12 = *(void *)v98;
LABEL_5:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v98 != v12) {
      objc_enumerationMutation(v9);
    }
    uint64_t v14 = *(void **)(*((void *)&v97 + 1) + 8 * v13);
    if ([v14 isComplete]) {
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    char v11 = 1;
LABEL_11:
    if (v10 == (id)++v13)
    {
      id v10 = [v9 countByEnumeratingWithState:&v97 objects:v110 count:16];
      if (!v10)
      {

        if (v11)
        {
          BOOL v94 = 0;
          char v95 = 0;
          uint64_t v96 = 0;
          goto LABEL_51;
        }
LABEL_53:
        long long v31 = *(NSObject **)self->logger.__ptr_.__value_;
        CFBooleanRef v30 = v67;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#I Transaction: all actions already completed", buf, 2u);
        }
        BOOL v32 = 1;
        goto LABEL_128;
      }
      goto LABEL_5;
    }
  }
  id v15 = [v14 callUUIDToGroupWith];
  BOOL v16 = v15 == 0;

  BOOL v94 = 0;
  char v95 = 0;
  uint64_t v96 = 0;
  if (v16)
  {
    *(void *)&uint8_t buf[16] = 0;
    *(void *)&uint8_t buf[8] = 0;
    *(void *)long long buf = &buf[8];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    uint64_t v33 = [v67 actions];
    id v34 = [v33 countByEnumeratingWithState:&v90 objects:v109 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v91;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v91 != v35) {
            objc_enumerationMutation(v33);
          }
          id v37 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v38 = [v37 callUUID];
            sub_100848F68(v38, &v111);
            sub_1000EA6A0((uint64_t **)buf, (void **)&v111, (uint64_t)&v111);
            if (SHIBYTE(v112) < 0) {
              operator delete((void *)v111);
            }
          }
        }
        id v34 = [v33 countByEnumeratingWithState:&v90 objects:v109 count:16];
      }
      while (v34);
    }

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v39 = [v67 actions];
    id v40 = [v39 countByEnumeratingWithState:&v86 objects:v108 count:16];
    if (!v40)
    {
LABEL_90:

      int64_t v50 = (char *)v95 - (char *)v94;
      sub_10005CD2C((uint64_t)buf, *(char **)&buf[8]);
      CFBooleanRef v30 = v67;
      if (v50 != 8)
      {
        BOOL v32 = 0;
        goto LABEL_127;
      }
      goto LABEL_91;
    }
    uint64_t v41 = *(void *)v87;
LABEL_69:
    uint64_t v42 = 0;
    while (1)
    {
      if (*(void *)v87 != v41) {
        objc_enumerationMutation(v39);
      }
      id v43 = *(void **)(*((void *)&v86 + 1) + 8 * v42);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_88;
      }
      id v44 = v43;
      long long v45 = [v44 callUUID];
      sub_100848F68(v45, &v111);
      uint64_t v46 = sub_10010E128((uint64_t)buf, (void **)&v111);
      if (SHIBYTE(v112) < 0) {
        operator delete((void *)v111);
      }

      if (!v46) {
        break;
      }
LABEL_87:

LABEL_88:
      if (v40 == (id)++v42)
      {
        id v40 = [v39 countByEnumeratingWithState:&v86 objects:v108 count:16];
        if (!v40) {
          goto LABEL_90;
        }
        goto LABEL_69;
      }
    }
    __p[0] = 0;
    xpc_object_t v47 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v48 = v47;
    if (v47)
    {
      __p[0] = v47;
    }
    else
    {
      xpc_object_t v48 = xpc_null_create();
      __p[0] = v48;
      if (!v48)
      {
        xpc_object_t v49 = xpc_null_create();
        xpc_object_t v48 = 0;
        goto LABEL_83;
      }
    }
    if (xpc_get_type(v48) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v48);
LABEL_84:
      xpc_release(v48);
      [v44 asDictionary:__p];
      xpc_object_t v84 = xpc_int64_create(4);
      if (!v84) {
        xpc_object_t v84 = xpc_null_create();
      }
      *(void *)&long long v111 = __p;
      *((void *)&v111 + 1) = "kActionType";
      sub_100035E70((uint64_t)&v111, &v84, &v85);
      xpc_release(v85);
      xpc_object_t v85 = 0;
      xpc_release(v84);
      xpc_object_t v84 = 0;
      sub_1006FE7FC(&v94, __p);
      xpc_release(__p[0]);
      goto LABEL_87;
    }
    xpc_object_t v49 = xpc_null_create();
LABEL_83:
    __p[0] = v49;
    goto LABEL_84;
  }
  memset(buf, 0, 24);
  [(TelephonyProviderDelegate *)self getCurrentCalls];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  int v17 = [v67 actions];
  id v18 = [v17 countByEnumeratingWithState:&v80 objects:v107 count:16];
  if (!v18) {
    goto LABEL_49;
  }
  uint64_t v19 = *(void *)v81;
  while (2)
  {
    uint64_t v20 = 0;
    while (2)
    {
      if (*(void *)v81 != v19) {
        objc_enumerationMutation(v17);
      }
      uint64_t v21 = *(void **)(*((void *)&v80 + 1) + 8 * v20);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v21;
        long long v111 = 0uLL;
        uint64_t v112 = 0;
        uint64_t v23 = [v22 callUUID];
        sub_100848F68(v23, &v111);

        __p[1] = 0;
        __p[0] = 0;
        uint64_t v103 = 0;
        int v24 = [v22 callUUIDToGroupWith];
        sub_100848F68(v24, __p);

        memset(v79, 0, sizeof(v79));
        sub_1001F1EB0(v79, *(void ***)buf, *(void ***)&buf[8], (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
        if (sub_1008492F8(v79, (unsigned __int8 *)&v111))
        {
          memset(v78, 0, sizeof(v78));
          sub_1001F1EB0(v78, *(void ***)buf, *(void ***)&buf[8], (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
          int v25 = sub_1008492F8(v78, (unsigned __int8 *)__p);
          v75[0] = v78;
          sub_1001F1FAC((void ***)v75);
          v75[0] = v79;
          sub_1001F1FAC((void ***)v75);
          if (v25)
          {
            [v22 fulfill];
            goto LABEL_42;
          }
        }
        else
        {
          v75[0] = v79;
          sub_1001F1FAC((void ***)v75);
        }
        xpc_object_t v101 = 0;
        xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
        xpc_object_t v28 = v27;
        if (v27)
        {
          xpc_object_t v101 = v27;
          goto LABEL_34;
        }
        xpc_object_t v28 = xpc_null_create();
        xpc_object_t v101 = v28;
        if (v28)
        {
LABEL_34:
          if (xpc_get_type(v28) != (xpc_type_t)&_xpc_type_dictionary)
          {
            xpc_object_t v29 = xpc_null_create();
            goto LABEL_38;
          }
          xpc_retain(v28);
        }
        else
        {
          xpc_object_t v29 = xpc_null_create();
          xpc_object_t v28 = 0;
LABEL_38:
          xpc_object_t v101 = v29;
        }
        xpc_release(v28);
        [v22 asDictionary:&v101];
        xpc_object_t v76 = xpc_int64_create(4);
        if (!v76) {
          xpc_object_t v76 = xpc_null_create();
        }
        v75[0] = &v101;
        v75[1] = "kActionType";
        sub_100035E70((uint64_t)v75, &v76, &object);
        xpc_release(object);
        xpc_object_t object = 0;
        xpc_release(v76);
        xpc_object_t v76 = 0;
        sub_1006FE7FC(&v94, &v101);
        xpc_release(v101);
LABEL_42:
        if (SHIBYTE(v103) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v112) < 0) {
          operator delete((void *)v111);
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v111 = 0uLL;
          uint64_t v112 = 0;
          long long v26 = [v21 callUUID];
          sub_100848F68(v26, &v111);

          memset(v74, 0, sizeof(v74));
          sub_1001F1EB0(v74, *(void ***)buf, *(void ***)&buf[8], (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
          LODWORD(v26) = sub_1008492F8(v74, (unsigned __int8 *)&v111);
          __p[0] = v74;
          sub_1001F1FAC((void ***)__p);
          if (v26) {
            [v21 fulfill];
          }
          if (SHIBYTE(v112) < 0) {
            operator delete((void *)v111);
          }
        }
      }
      if (v18 != (id)++v20) {
        continue;
      }
      break;
    }
    id v18 = [v17 countByEnumeratingWithState:&v80 objects:v107 count:16];
    if (v18) {
      continue;
    }
    break;
  }
LABEL_49:

  if (v94 == v95)
  {
    long long v53 = *(NSObject **)self->logger.__ptr_.__value_;
    CFBooleanRef v30 = v67;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v111) = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "#N Transaction: complete transaction. All calls already merged", (uint8_t *)&v111, 2u);
    }
    *(void *)&long long v111 = buf;
    sub_1001F1FAC((void ***)&v111);
    goto LABEL_101;
  }
  *(void *)&long long v111 = buf;
  sub_1001F1FAC((void ***)&v111);
LABEL_51:
  CFBooleanRef v30 = v67;
LABEL_91:
  if ([(TelephonyProviderDelegate *)v66 possiblyFulfillUnexpectedMOStartCallWithProvider:v65 transactions:v30])
  {
    uint64_t v51 = *(NSObject **)v66->logger.__ptr_.__value_;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v52 = "#N Transaction: complete transaction. Unexpected MO Start Call found";
      goto LABEL_97;
    }
    goto LABEL_101;
  }
  if ([(TelephonyProviderDelegate *)v66 possiblyFulfillUnexpectedHoldCallWithProvider:v65 transactions:v30])
  {
    uint64_t v51 = *(NSObject **)v66->logger.__ptr_.__value_;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v52 = "#N Transaction: complete transaction. Unexpected Hold Call found";
      goto LABEL_97;
    }
    goto LABEL_101;
  }
  if (v94 != v95) {
    goto LABEL_124;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v54 = [v30 actions];
  id v55 = [v54 countByEnumeratingWithState:&v70 objects:v106 count:16];
  if (!v55) {
    goto LABEL_123;
  }
  uint64_t v56 = *(void *)v71;
  while (2)
  {
    uint64_t v57 = 0;
    while (2)
    {
      if (*(void *)v71 != v56) {
        objc_enumerationMutation(v54);
      }
      __int16 v58 = *(void **)(*((void *)&v70 + 1) + 8 * v57);
      if (([v58 isComplete] & 1) == 0)
      {
        *(void *)&long long v111 = 0;
        xpc_object_t v59 = xpc_dictionary_create(0, 0, 0);
        xpc_object_t v60 = v59;
        if (v59)
        {
          *(void *)&long long v111 = v59;
          goto LABEL_113;
        }
        xpc_object_t v60 = xpc_null_create();
        *(void *)&long long v111 = v60;
        if (v60)
        {
LABEL_113:
          if (xpc_get_type(v60) != (xpc_type_t)&_xpc_type_dictionary)
          {
            xpc_object_t v61 = xpc_null_create();
            goto LABEL_117;
          }
          xpc_retain(v60);
        }
        else
        {
          xpc_object_t v61 = xpc_null_create();
          xpc_object_t v60 = 0;
LABEL_117:
          *(void *)&long long v111 = v61;
        }
        xpc_release(v60);
        [v58 asDictionary:&v111];
        xpc_object_t v68 = xpc_int64_create(+[TelephonyProviderDelegate sActionToType:v58]);
        if (!v68) {
          xpc_object_t v68 = xpc_null_create();
        }
        *(void *)long long buf = &v111;
        *(void *)&uint8_t buf[8] = "kActionType";
        sub_100035E70((uint64_t)buf, &v68, &v69);
        xpc_release(v69);
        xpc_object_t v69 = 0;
        xpc_release(v68);
        xpc_object_t v68 = 0;
        sub_1006FE7FC(&v94, (void **)&v111);
        xpc_release((xpc_object_t)v111);
      }
      if (v55 != (id)++v57) {
        continue;
      }
      break;
    }
    id v55 = [v54 countByEnumeratingWithState:&v70 objects:v106 count:16];
    if (v55) {
      continue;
    }
    break;
  }
LABEL_123:

  CFBooleanRef v30 = v67;
  if (v94 != v95)
  {
LABEL_124:
    long long v105 = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v62 = [v30 UUID];
    sub_100848F68(v62, &v111);
    if ((char)buf[23] < 0) {
      operator delete(*(void **)buf);
    }
    *(_OWORD *)long long buf = v111;
    *(void *)&uint8_t buf[16] = v112;
    HIBYTE(v112) = 0;
    LOBYTE(v111) = 0;

    sub_100703214((void ***)&buf[24], v94, v95, v95 - v94);
    operator new();
  }
  uint64_t v51 = *(NSObject **)v66->logger.__ptr_.__value_;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    uint64_t v52 = "#I Transaction: no actions to take";
LABEL_97:
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
  }
LABEL_101:
  BOOL v32 = 1;
LABEL_127:
  *(void *)long long buf = &v94;
  sub_10070345C((void ***)buf);
LABEL_128:

  return v32;
}

- (BOOL)possiblyFulfillUnexpectedMOStartCallWithProvider:(id)a3 transactions:(id)a4
{
  id v37 = a3;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v36 = a4;
  id obj = [v36 actions];
  id v5 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (!v5)
  {
LABEL_58:
    BOOL v34 = 0;
    goto LABEL_59;
  }
  unsigned int v6 = 9;
  uint64_t v39 = *(void *)v57;
  id v40 = v5;
LABEL_3:
  uint64_t v43 = 0;
  while (1)
  {
    if (*(void *)v57 != v39) {
      objc_enumerationMutation(obj);
    }
    id v7 = *(void **)(*((void *)&v56 + 1) + 8 * v43);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      [(TelephonyProviderDelegate *)self getCurrentCalls];
      uint64_t v9 = v54;
      if (v53 != v54)
      {
        char v42 = 0;
        uint64_t v10 = v53 + 8;
        while (1)
        {
          xpc_object_t v11 = *(xpc_object_t *)(v10 - 8);
          if (v11)
          {
            xpc_retain(*(xpc_object_t *)(v10 - 8));
            xpc_object_t v52 = v11;
          }
          else
          {
            xpc_object_t v11 = xpc_null_create();
            xpc_object_t v52 = v11;
            if (!v11)
            {
              xpc_object_t v11 = 0;
              xpc_object_t v52 = xpc_null_create();
              goto LABEL_13;
            }
          }
          xpc_retain(v11);
LABEL_13:
          __p[0] = 0;
          __p[1] = 0;
          uint64_t v51 = 0;
          v48[0] = &v52;
          v48[1] = "kUuid";
          sub_100048BAC((uint64_t)v48, &object);
          long long buf = 0uLL;
          uint64_t v63 = 0;
          xpc::dyn_cast_or_default();
          if (SHIBYTE(v63) < 0) {
            operator delete((void *)buf);
          }
          xpc_release(object);
          if (v51 >= 0) {
            uint64_t v12 = __p;
          }
          else {
            uint64_t v12 = (void **)__p[0];
          }
          uint64_t v13 = +[NSString stringWithUTF8String:v12];
          uint64_t v14 = [v8 callUUID];
          id v15 = [v14 UUIDString];
          unsigned int v16 = [v13 isEqualToString:v15];

          if (v16)
          {
            *(void *)&long long buf = &v52;
            *((void *)&buf + 1) = "kCallStatus";
            sub_100048BAC((uint64_t)&buf, v48);
            unsigned int v6 = xpc::dyn_cast_or_default((xpc *)v48, 0, v17);
            xpc_release(v48[0]);
            *(void *)&long long buf = &v52;
            *((void *)&buf + 1) = "kCallDirectionMobileOriginated";
            sub_100048BAC((uint64_t)&buf, v48);
            int v19 = xpc::dyn_cast_or_default((xpc *)v48, 0, v18);
            xpc_release(v48[0]);
            if (v19 && v6 <= 7 && ((1 << v6) & 0x9C) != 0)
            {
              char v42 = 1;
              LOBYTE(v16) = 1;
            }
            else
            {
              LOBYTE(v16) = 0;
            }
          }

          if (SHIBYTE(v51) < 0) {
            operator delete(__p[0]);
          }
          xpc_release(v52);
          xpc_release(v11);
          if (v10 == v9) {
            char v20 = 1;
          }
          else {
            char v20 = v16;
          }
          v10 += 8;
          if (v20) {
            goto LABEL_33;
          }
        }
      }
      char v42 = 0;
LABEL_33:
      *(void *)&long long buf = &v53;
      sub_1001F1FAC((void ***)&buf);

      if (v42) {
        break;
      }
    }
    if ((id)++v43 == v40)
    {
      id v40 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (!v40) {
        goto LABEL_58;
      }
      goto LABEL_3;
    }
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [v36 actions];
  id v21 = [obj countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v45;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(obj);
        }
        int v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v25 = v24;
          if ([v25 isComplete])
          {

            goto LABEL_58;
          }
          long long v26 = +[NSDate date];
          if (v6 - 5 <= 0xFFFFFFFC)
          {
            xpc_object_t v27 = *(NSObject **)self->logger.__ptr_.__value_;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              xpc_object_t v28 = [v25 callUUID];
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v28;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I Reporting to CSD: Unexpected MO dialed call %@ is not in Dialing or WaitingToDial state", (uint8_t *)&buf, 0xCu);
            }
            xpc_object_t v29 = [v25 callUUID];
            [v37 reportOutgoingCallWithUUID:v29 sentInvitationAtDate:v26];
          }
          CFBooleanRef v30 = *(NSObject **)self->logger.__ptr_.__value_;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            long long v31 = [v25 UUID];
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#N Fulfilling CXStartCallAction %@,for a call that already exists (Unexpected MO call, likely)", (uint8_t *)&buf, 0xCu);
          }
          [v25 fulfillWithDateStarted:v26];
        }
        else
        {
          BOOL v32 = *(NSObject **)self->logger.__ptr_.__value_;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = [v24 UUID];
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#N Auto fulfilling action %@ because one of the actions in this transaction is a StartCallAction for Unexpected MO", (uint8_t *)&buf, 0xCu);
          }
          [v24 fulfill];
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v44 objects:v60 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  BOOL v34 = 1;
LABEL_59:

  return v34;
}

- (void)provider:(id)a3 performStartCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = v7;
  operator new();
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = v7;
  operator new();
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 callUUID];
  sub_100848F68(v8, v18);
  uint64_t v12 = (void *)v18[0];
  char v13 = HIBYTE(v19);
  HIBYTE(v19) = 0;
  LOBYTE(v18[0]) = 0;

  id v9 = v7;
  uint64_t v10 = self;
  xpc_object_t v17 = 0;
  write_rest_value();
  sub_100058DB0(&__p, "/cc/requests/end_this_call");
  xpc_object_t object = v17;
  xpc_object_t v17 = xpc_null_create();
  xpc_object_t v11 = v10;
  v18[0] = off_1019FDA88;
  v18[1] = v9;
  int v19 = v11;
  char v20 = v18;
  ctu::RestModule::sendRequest();
  sub_10003F600(v18);
  xpc_release(object);
  if (v16 < 0) {
    operator delete(__p);
  }
  xpc_release(v17);

  if (v13 < 0) {
    operator delete(v12);
  }
}

- (BOOL)doesHeldUnHeldcallAlreadyExist:(id)a3
{
  id v4 = a3;
  memset(v6, 0, sizeof(v6));
  [(TelephonyProviderDelegate *)self getCurrentCalls];
  long long __p = v6;
  sub_1001F1FAC((void ***)&__p);

  return 0;
}

- (BOOL)possiblyFulfillUnexpectedHoldCallWithProvider:(id)a3 transactions:(id)a4
{
  id v5 = a4;
  id v6 = [v5 actions];
  id v7 = [v6 count];

  if (v7 == (id)1)
  {
    id v8 = [v5 actions];
    id v9 = [v8 objectAtIndexedSubscript:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      BOOL v11 = [(TelephonyProviderDelegate *)self doesHeldUnHeldcallAlreadyExist:v10];
      if (v11)
      {
        uint64_t v12 = *(NSObject **)self->logger.__ptr_.__value_;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v13 = [v10 isOnHold];
          uint64_t v14 = [v10 UUID];
          id v15 = (void *)v14;
          char v16 = "false";
          if (v13) {
            char v16 = "true";
          }
          int v18 = 136315394;
          int v19 = v16;
          __int16 v20 = 2112;
          uint64_t v21 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#N Fulfilling CXSetHeldCallAction(%s) %@ due to an existing call in Active/Held state (unexpected hold call, likely)", (uint8_t *)&v18, 0x16u);
        }
        [v10 fulfill];
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)provider:(id)a3 performSetHeldCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v7, "callUUID", 0, 0, 0, 0);
  sub_100848F68(v8, v18);
  uint64_t v12 = (void *)v18[0];
  char v13 = HIBYTE(v19);
  HIBYTE(v19) = 0;
  LOBYTE(v18[0]) = 0;

  [v7 isOnHold];
  id v9 = v7;
  id v10 = self;
  xpc_object_t v17 = 0;
  write_rest_value();
  sub_100058DB0(&__p, "/cc/requests/hold_call");
  xpc_object_t object = v17;
  xpc_object_t v17 = xpc_null_create();
  BOOL v11 = v10;
  v18[0] = off_1019FDB08;
  v18[1] = v9;
  int v19 = v11;
  __int16 v20 = v18;
  ctu::RestModule::sendRequest();
  sub_10003F600(v18);
  xpc_release(object);
  if (v16 < 0) {
    operator delete(__p);
  }
  xpc_release(v17);

  if (v13 < 0) {
    operator delete(v12);
  }
}

- (void)provider:(id)a3 performSetGroupCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 callUUID];
  sub_100848F68(v8, v21);
  long long __p = (void *)v21[0];
  char v14 = HIBYTE(v22);
  HIBYTE(v22) = 0;
  LOBYTE(v21[0]) = 0;

  id v9 = [v7 callUUIDToGroupWith];
  sub_100848F68(v9, v21);
  id v15 = (void *)v21[0];
  char v16 = HIBYTE(v22);
  HIBYTE(v22) = 0;
  LOBYTE(v21[0]) = 0;

  [v7 callUUIDToGroupWith];
  id v10 = v7;
  BOOL v11 = self;
  xpc_object_t v20 = 0;
  write_rest_value();
  sub_100058DB0(&v18, "/cc/requests/merge");
  xpc_object_t object = v20;
  xpc_object_t v20 = xpc_null_create();
  uint64_t v12 = v11;
  v21[0] = off_1019FDB88;
  v21[1] = v10;
  uint64_t v22 = v12;
  uint64_t v23 = v21;
  ctu::RestModule::sendRequest();
  sub_10003F600(v21);
  xpc_release(object);
  if (v19 < 0) {
    operator delete(v18);
  }
  xpc_release(v20);

  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(__p);
  }
}

- (void)provider:(id)a3 performPlayDTMFCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 callUUID];
  sub_100848F68(v8, v19);
  long long __p = (void *)v19[0];
  char v14 = HIBYTE(v20);
  HIBYTE(v20) = 0;
  LOBYTE(v19[0]) = 0;

  id v9 = [v7 digits];
  ctu::cf::assign();

  [v7 type];
  id v10 = v7;
  BOOL v11 = self;
  xpc_object_t v18 = 0;
  write_rest_value();
  sub_100058DB0(&v16, "/cc/requests/SendDTMF");
  xpc_object_t object = v18;
  xpc_object_t v18 = xpc_null_create();
  uint64_t v12 = v11;
  v19[0] = off_1019FDC08;
  v19[1] = v10;
  xpc_object_t v20 = v12;
  uint64_t v21 = v19;
  ctu::RestModule::sendRequest();
  sub_10003F600(v19);
  xpc_release(object);
  if (v17 < 0) {
    operator delete(v16);
  }
  xpc_release(v18);

  if (v14 < 0) {
    operator delete(__p);
  }
}

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v7, "callUUID", 0, 0, 0, 0);
  sub_100848F68(v8, v18);
  uint64_t v12 = (void *)v18[0];
  char v13 = HIBYTE(v19);
  HIBYTE(v19) = 0;
  LOBYTE(v18[0]) = 0;

  [v7 isRelaying];
  id v9 = v7;
  id v10 = self;
  xpc_object_t v17 = 0;
  write_rest_value();
  sub_100058DB0(&__p, "/cc/requests/SetRelaying");
  xpc_object_t object = v17;
  xpc_object_t v17 = xpc_null_create();
  BOOL v11 = v10;
  v18[0] = off_1019FDC88;
  v18[1] = v9;
  char v19 = v11;
  xpc_object_t v20 = v18;
  ctu::RestModule::sendRequest();
  sub_10003F600(v18);
  xpc_release(object);
  if (v16 < 0) {
    operator delete(__p);
  }
  xpc_release(v17);

  if (v13 < 0) {
    operator delete(v12);
  }
}

- (void)provider:(id)a3 performSetScreeningCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v7, "callUUID", 0, 0, 0, 0);
  sub_100848F68(v8, v18);
  uint64_t v12 = (void *)v18[0];
  char v13 = HIBYTE(v19);
  HIBYTE(v19) = 0;
  LOBYTE(v18[0]) = 0;

  [v7 isScreening];
  id v9 = v7;
  id v10 = self;
  xpc_object_t v17 = 0;
  write_rest_value();
  sub_100058DB0(&__p, "/cc/requests/SetScreening");
  xpc_object_t object = v17;
  xpc_object_t v17 = xpc_null_create();
  BOOL v11 = v10;
  v18[0] = off_1019FDD08;
  v18[1] = v9;
  char v19 = v11;
  xpc_object_t v20 = v18;
  ctu::RestModule::sendRequest();
  sub_10003F600(v18);
  xpc_release(object);
  if (v16 < 0) {
    operator delete(__p);
  }
  xpc_release(v17);

  if (v13 < 0) {
    operator delete(v12);
  }
}

- (void)provider:(id)a3 performPullCallAction:(id)a4
{
  id v34 = a3;
  id v6 = a4;
  id v7 = [v6 handoffContext];
  id v8 = [v6 handoffContext];
  id v9 = [v8 context];

  id v10 = [v7 remoteHandle];
  uint64_t v11 = [v10 value];

  v59[0] = 0;
  v59[1] = 0;
  uint64_t v60 = 0;
  uint64_t v36 = v11;
  ctu::cf::assign();
  uint64_t v12 = +[NSString stringWithUTF8String:"kCTCallCallerName"];
  [v9 objectForKeyedSubscript:v12];
  v57[0] = 0;
  v57[1] = 0;
  uint64_t v38 = v58 = 0;
  ctu::cf::assign();
  unsigned __int8 v13 = [v7 isOutgoing];
  v55[0] = 0;
  v55[1] = 0;
  uint64_t v56 = 0;
  char v14 = [v6 callUUID];
  sub_100848F68(v14, v55);

  id v15 = +[NSString stringWithUTF8String:"kCTCallStartTime"];

  char v16 = [v9 objectForKeyedSubscript:v15];
  xpc_object_t v17 = v16;
  if (!v16)
  {
    objc_msgSend(v6, "fail", v34, v36, v38);
    goto LABEL_44;
  }
  id v18 = objc_msgSend(v16, "integerValue", v34, v36, v38);
  double Current = CFAbsoluteTimeGetCurrent();
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v54 = 0;
  xpc_object_t v20 = [v7 handoffIdentifier];
  ctu::cf::assign();

  uint64_t v21 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "CXPullCallAction's handoffIdentifier shouldn't be empty", buf, 2u);
  }
  xpc_object_t v52 = 0;
  xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v23 = v22;
  if (v22)
  {
    xpc_object_t v52 = v22;
  }
  else
  {
    xpc_object_t v23 = xpc_null_create();
    xpc_object_t v52 = v23;
    if (!v23)
    {
      xpc_object_t v24 = xpc_null_create();
      xpc_object_t v23 = 0;
      goto LABEL_12;
    }
  }
  if (xpc_get_type(v23) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v24 = xpc_null_create();
LABEL_12:
    xpc_object_t v52 = v24;
    goto LABEL_13;
  }
  xpc_retain(v23);
LABEL_13:
  xpc_release(v23);
  if (v60 >= 0) {
    id v25 = v59;
  }
  else {
    id v25 = (void **)v59[0];
  }
  xpc_object_t v50 = xpc_string_create((const char *)v25);
  if (!v50) {
    xpc_object_t v50 = xpc_null_create();
  }
  *(void *)long long buf = &v52;
  uint64_t v65 = "kPhoneNumber";
  sub_100035E70((uint64_t)buf, &v50, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v50);
  xpc_object_t v50 = 0;
  if (v54 >= 0) {
    long long v26 = __p;
  }
  else {
    long long v26 = (void **)__p[0];
  }
  xpc_object_t v48 = xpc_string_create((const char *)v26);
  if (!v48) {
    xpc_object_t v48 = xpc_null_create();
  }
  *(void *)long long buf = &v52;
  uint64_t v65 = "kThumperAccountId";
  sub_100035E70((uint64_t)buf, &v48, &v49);
  xpc_release(v49);
  xpc_object_t v49 = 0;
  xpc_release(v48);
  xpc_object_t v48 = 0;
  if (v58 >= 0) {
    xpc_object_t v27 = v57;
  }
  else {
    xpc_object_t v27 = (void **)v57[0];
  }
  xpc_object_t v46 = xpc_string_create((const char *)v27);
  if (!v46) {
    xpc_object_t v46 = xpc_null_create();
  }
  *(void *)long long buf = &v52;
  uint64_t v65 = "kCallName";
  sub_100035E70((uint64_t)buf, &v46, &v47);
  xpc_release(v47);
  xpc_object_t v47 = 0;
  xpc_release(v46);
  xpc_object_t v46 = 0;
  xpc_object_t v44 = xpc_int64_create((int)llround(Current - (double)(uint64_t)v18));
  if (!v44) {
    xpc_object_t v44 = xpc_null_create();
  }
  *(void *)long long buf = &v52;
  uint64_t v65 = "kCallDuration";
  sub_100035E70((uint64_t)buf, &v44, &v45);
  xpc_release(v45);
  xpc_object_t v45 = 0;
  xpc_release(v44);
  xpc_object_t v44 = 0;
  xpc_object_t v42 = xpc_BOOL_create(v13);
  if (!v42) {
    xpc_object_t v42 = xpc_null_create();
  }
  *(void *)long long buf = &v52;
  uint64_t v65 = "kCallDirectionMobileOriginated";
  sub_100035E70((uint64_t)buf, &v42, &v43);
  xpc_release(v43);
  xpc_object_t v43 = 0;
  xpc_release(v42);
  xpc_object_t v42 = 0;
  if (v56 >= 0) {
    xpc_object_t v28 = v55;
  }
  else {
    xpc_object_t v28 = (void **)v55[0];
  }
  xpc_object_t v40 = xpc_string_create((const char *)v28);
  if (!v40) {
    xpc_object_t v40 = xpc_null_create();
  }
  *(void *)long long buf = &v52;
  uint64_t v65 = "kUuid";
  sub_100035E70((uint64_t)buf, &v40, &v41);
  xpc_release(v41);
  xpc_object_t v41 = 0;
  xpc_release(v40);
  xpc_object_t v40 = 0;
  xpc_object_t v29 = (const char *)v6;
  CFBooleanRef v30 = self;
  xpc_object_t v31 = v52;
  if (v52) {
    xpc_retain(v52);
  }
  else {
    xpc_object_t v31 = xpc_null_create();
  }
  sub_100058DB0(&v62, "/cc/requests/PullCall");
  xpc_object_t v61 = v31;
  xpc_object_t v32 = xpc_null_create();
  uint64_t v33 = v30;
  *(void *)long long buf = off_1019FDD88;
  uint64_t v65 = v29;
  BOOL v66 = v33;
  int v67 = buf;
  ctu::RestModule::sendRequest();
  sub_10003F600(buf);
  xpc_release(v61);
  xpc_object_t v61 = 0;
  if (v63 < 0) {
    operator delete(v62);
  }
  xpc_release(v32);

  xpc_release(v52);
  if (SHIBYTE(v54) < 0) {
    operator delete(__p[0]);
  }
LABEL_44:

  if (SHIBYTE(v56) < 0) {
    operator delete(v55[0]);
  }
  if (SHIBYTE(v58) < 0) {
    operator delete(v57[0]);
  }

  if (SHIBYTE(v60) < 0) {
    operator delete(v59[0]);
  }
}

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ServiceMap = (std::mutex *)Registry::getServiceMap(self->fRegistry.__ptr_);
  id v9 = ServiceMap;
  if ((v10 & 0x8000000000000000) != 0)
  {
    uint64_t v11 = (unsigned __int8 *)(v10 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v12 = 5381;
    do
    {
      unint64_t v10 = v12;
      unsigned int v13 = *v11++;
      uint64_t v12 = (33 * v12) ^ v13;
    }
    while (v13);
  }
  std::mutex::lock(ServiceMap);
  unint64_t v20 = v10;
  char v14 = sub_10004D37C(&v9[1].__m_.__sig, &v20);
  if (v14)
  {
    uint64_t v16 = v14[3];
    id v15 = (std::__shared_weak_count *)v14[4];
    if (v15)
    {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v9);
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v15);
      char v17 = 0;
      if (!v16) {
        goto LABEL_13;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  std::mutex::unlock(v9);
  id v15 = 0;
  char v17 = 1;
  if (!v16) {
    goto LABEL_13;
  }
LABEL_10:
  id v18 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v19 = [v7 isMuted];
    LODWORD(v20) = 67109120;
    HIDWORD(v20) = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I Setting muted to %d", (uint8_t *)&v20, 8u);
  }
  (*(void (**)(uint64_t, id))(*(void *)v16 + 40))(v16, [v7 isMuted]);
LABEL_13:
  [v7 fulfill];
  if ((v17 & 1) == 0) {
    sub_10004D2C8(v15);
  }
}

- (void)provider:(id)a3 timedOutPerformingAction:(id)a4
{
  id v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = a4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Action timed out: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)provider:(id)a3 performSendMMIOrUSSDCodeAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v24 = 0;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v9 = v8;
  if (v8)
  {
    xpc_object_t v24 = v8;
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    xpc_object_t v24 = v9;
    if (!v9)
    {
      xpc_object_t v10 = xpc_null_create();
      xpc_object_t v9 = 0;
      goto LABEL_8;
    }
  }
  if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v9);
    goto LABEL_9;
  }
  xpc_object_t v10 = xpc_null_create();
LABEL_8:
  xpc_object_t v24 = v10;
LABEL_9:
  xpc_release(v9);
  [v7 asDictionary:&v24];
  long long v20 = 0u;
  uint64_t v21 = 0;
  *(_OWORD *)unsigned int v19 = 0u;
  *(_OWORD *)char v17 = 0u;
  memset(__p, 0, sizeof(__p));
  uint64_t v22 = 1;
  uint64_t v23 = 0;
  v16[0] = &v24;
  v16[1] = "kPhoneNumber";
  sub_100048BAC((uint64_t)v16, &object);
  xpc_object_t v28 = 0;
  xpc_object_t v29 = 0;
  CFBooleanRef v30 = 0;
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v30) < 0) {
    operator delete(v28);
  }
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  *(_OWORD *)&__p[1] = v26;
  __p[3] = v27;
  HIBYTE(v27) = 0;
  LOBYTE(v26) = 0;
  xpc_release(object);
  BYTE4(v21) = 1;
  xpc_object_t v28 = &v24;
  xpc_object_t v29 = "kIsTTY";
  sub_100048BAC((uint64_t)&v28, &v26);
  LODWORD(v21) = xpc::dyn_cast_or_default((xpc *)&v26, 0, v11);
  xpc_release((xpc_object_t)v26);
  uint64_t v12 = [v7 senderIdentityUUID];
  LODWORD(v22) = +[TelephonyProviderDelegate sSenderIdentityUuidToSimSlot:v12];
  unsigned int v13 = (char *)v7;
  char v14 = self;
  v16[0] = 0;
  write_rest_value();
  sub_100058DB0(&v26, "/cc/requests/dial");
  xpc_object_t object = v16[0];
  v16[0] = xpc_null_create();
  id v15 = v14;
  xpc_object_t v28 = (xpc_object_t *)off_1019FDE08;
  xpc_object_t v29 = v13;
  CFBooleanRef v30 = v15;
  xpc_object_t v31 = &v28;
  ctu::RestModule::sendRequest();
  sub_10003F600(&v28);
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(v27) < 0) {
    operator delete((void *)v26);
  }
  xpc_release(v16[0]);

  if (SBYTE7(v20) < 0) {
    operator delete(v19[0]);
  }
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (SHIBYTE(__p[0]) < 0) {
    operator delete(v17[0]);
  }
  xpc_release(v24);
}

- (void)provider:(id)a3 didActivateAudioSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = self;
  xpc_object_t v9 = xpc_BOOL_create(1);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  sub_100058DB0(&__p, "/cc/requests/start_media");
  xpc_object_t object = v9;
  xpc_object_t v10 = xpc_null_create();
  uint64_t v11 = v8;
  v15[0] = off_1019FDE88;
  v15[1] = v11;
  v15[3] = v15;
  ctu::RestModule::sendRequest();
  sub_10003F600(v15);
  xpc_release(object);
  if (v14 < 0) {
    operator delete(__p);
  }
  xpc_release(v10);
}

- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = self;
  xpc_object_t v9 = xpc_BOOL_create(1);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  sub_100058DB0(&__p, "/cc/requests/stop_media");
  xpc_object_t object = v9;
  xpc_object_t v10 = xpc_null_create();
  uint64_t v11 = v8;
  v15[0] = off_1019FDF08;
  v15[1] = v11;
  v15[3] = v15;
  ctu::RestModule::sendRequest();
  sub_10003F600(v15);
  xpc_release(object);
  if (v14 < 0) {
    operator delete(__p);
  }
  xpc_release(v10);
}

- (void)provider:(id)a3 performSetTTYTypeCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[TelephonyProviderDelegate getTTYType:](TelephonyProviderDelegate, "getTTYType:", [v7 ttyType]);
  xpc_object_t v8 = [v7 callUUID];
  sub_100848F68(v8, v17);
  uint64_t v11 = (void *)v17[0];
  char v12 = HIBYTE(v18);
  HIBYTE(v18) = 0;
  LOBYTE(v17[0]) = 0;

  xpc_object_t v9 = self;
  xpc_object_t v16 = 0;
  write_rest_value();
  sub_100058DB0(&__p, "/cc/requests/update_call_to_tty");
  xpc_object_t object = v16;
  xpc_object_t v16 = xpc_null_create();
  xpc_object_t v10 = v9;
  v17[0] = off_1019FDF88;
  v17[1] = v10;
  unsigned int v19 = v17;
  ctu::RestModule::sendRequest();
  sub_10003F600(v17);
  xpc_release(object);
  if (v15 < 0) {
    operator delete(__p);
  }
  xpc_release(v16);

  if (v12 < 0) {
    operator delete(v11);
  }
}

- (void)providerDidReset:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  [(TelephonyProviderDelegate *)self getCurrentCalls];
  memset(v6, 0, sizeof(v6));
  id v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = (v8 - v7) >> 3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Ending all calls (num: %zu) due to provider reset", buf, 0xCu);
  }
  *(void *)long long buf = v6;
  sub_10070345C((void ***)buf);
  *(void *)long long buf = &v7;
  sub_1001F1FAC((void ***)buf);
}

- (void)checkBasebandAssertions
{
  ptr = self->fBasebandOnlineAssertion.__ptr_;
  [(TelephonyProviderDelegate *)self getCurrentCalls];
  id v4 = *(char **)buf;
  id v5 = v19;
  if (*(char **)buf == v19)
  {
LABEL_7:
    v16.__ptr_ = buf;
    sub_1001F1FAC((void ***)&v16);
    if (ptr)
    {
      uint64_t v11 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I Releasing baseband-online assertion", buf, 2u);
      }
      cntrl = self->fBasebandOnlineAssertion.__cntrl_;
      self->fBasebandOnlineAssertion.__ptr_ = 0;
      self->fBasebandOnlineAssertion.__cntrl_ = 0;
      if (cntrl) {
LABEL_19:
      }
        sub_10004D2C8((std::__shared_weak_count *)cntrl);
    }
  }
  else
  {
    id v6 = *(char **)buf;
    while (1)
    {
      v16.__ptr_ = v4;
      v16.__cntrl_ = (__shared_weak_count *)"kCallStatus";
      sub_100048BAC((uint64_t)&v16, object);
      int v8 = xpc::dyn_cast_or_default((xpc *)object, 0, v7);
      xpc_release(object[0]);
      if (v8 != 6)
      {
        v16.__ptr_ = v4;
        v16.__cntrl_ = (__shared_weak_count *)"kCallSubType";
        sub_100048BAC((uint64_t)&v16, object);
        unsigned __int8 v10 = xpc::dyn_cast_or_default((xpc *)object, (const object *)1, v9);
        xpc_release(object[0]);
        if (v10 <= 0x10u && ((1 << v10) & 0x10112) != 0) {
          break;
        }
      }
      v6 += 8;
      v4 += 8;
      if (v6 == v5) {
        goto LABEL_7;
      }
    }
    v16.__ptr_ = buf;
    sub_1001F1FAC((void ***)&v16);
    if (!ptr)
    {
      unsigned int v13 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I Acquiring baseband-online assertion", buf, 2u);
      }
      sub_100058DB0(buf, "/cc/assertions/baseband_online");
      ctu::rest::AssertionHandle::create();
      if (v20 < 0) {
        operator delete(*(void **)buf);
      }
      shared_ptr<void> v14 = v16;
      shared_ptr<void> v16 = (shared_ptr<void>)0;
      char v15 = self->fBasebandOnlineAssertion.__cntrl_;
      self->fBasebandOnlineAssertion = v14;
      if (v15)
      {
        sub_10004D2C8((std::__shared_weak_count *)v15);
        cntrl = v16.__cntrl_;
        if (v16.__cntrl_) {
          goto LABEL_19;
        }
      }
    }
  }
}

- (TelephonyProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (TelephonyProvider *)WeakRetained;
}

- (NSDictionary)extraCallInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 432, 1);
}

- (void)setExtraCallInfo:(id)a3
{
}

- (BOOL)isAVCBBTapRegistered
{
  return *(&self->_isAVCBBTapRegistered + 1);
}

- (void)setIsAVCBBTapRegistered:(BOOL)a3
{
  *(&self->_isAVCBBTapRegistered + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraCallInfo, 0);
  objc_destroyWeak((id *)&self->_provider);
  sub_10019D5B8((uint64_t)&self->fLastKnownHomePlmn, (void *)self->fLastKnownHomePlmn.fValue.__tree_.__pair1_.__value_.__left_);
  sub_100030EE0((uint64_t)&self->fLastVisibleMCC, (char *)self->fLastVisibleMCC.fValue.__tree_.__pair1_.__value_.__left_);
  p_begin = (void **)&self->fActiveSubscriptions.fValue.fSubscriptions.__begin_;
  sub_1007034E0(&p_begin);
  sub_10030A9DC((uint64_t)&self->fSubscriptionInfo, (void *)self->fSubscriptionInfo.fValue.fSubscriptions.__tree_.__pair1_.__value_.__left_);
  sub_1007035FC((uint64_t)&self->fVoWiFiProv, (void *)self->fVoWiFiProv.fValue.__tree_.__pair1_.__value_.__left_);
  sub_1000346F8((uint64_t)&self->fThumperHandoffAllowed, (void *)self->fThumperHandoffAllowed.fValue.__tree_.__pair1_.__value_.__left_);
  xpc_release(*(xpc_object_t *)&self->fCallFrequencyData.fValue.fCallUuid.__r_.var0);
  *(void *)&self->fCallFrequencyData.fValue.fCallUuid.__r_.var0 = 0;
  if (*((char *)&self->fCallFrequencyData.fValue.fCallUuid.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->fCallFrequencyData.fValue.fCallUuid.__r_.__value_.var0.var1.__data_);
  }
  sub_1007036B8((uint64_t)&self->fExcludedNumbers, (char *)self->fExcludedNumbers.fValue.__tree_.__pair1_.__value_.__left_);
  sub_100703718((uint64_t)&self->fDisambiguationEmergencyNumbers, (char *)self->fDisambiguationEmergencyNumbers.fValue.__tree_.__pair1_.__value_.__left_);
  sub_100703778((uint64_t)&self->fEmergencyNumbers, (char *)self->fEmergencyNumbers.fValue.__tree_.__pair1_.__value_.__left_);
  sub_100453C90((uint64_t)&self->fCallCapabilities, (void *)self->fCallCapabilities.fValue.__tree_.__pair1_.__value_.__left_);
  xpc_object_t value = self->fStoredSwitchUseIbisMode.__ptr_.__value_;
  self->fStoredSwitchUseIbisMode.__ptr_.__value_ = 0;
  if (value) {
    sub_1007037D8((uint64_t)value);
  }
  p_begin = (void **)&self->fCurrentCalls.fValue.__begin_;
  sub_1001F1FAC(&p_begin);
  p_begin = (void **)&self->fCurrentCallsCopy.__begin_;
  sub_1001F1FAC(&p_begin);
  cntrl = self->fBasebandOnlineAssertion.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  id v5 = self->fRestModule.__ptr_.__value_;
  self->fRestModule.__ptr_.__value_ = 0;
  if (v5) {
    sub_1001F20B0((uint64_t)&self->fRestModule, (uint64_t)v5);
  }
  id v6 = self->fRegistry.__cntrl_;
  if (v6) {
    sub_10004D2C8((std::__shared_weak_count *)v6);
  }
  xpc_object_t fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  sub_100119D1C((ctu::OsLogLogger **)&self->logger, 0);
}

- (id).cxx_construct
{
  self->fCallCapabilities.fValue.__tree_.__pair1_.__value_.__left_ = 0;
  *(_OWORD *)&self->logger.__ptr_.__value_ = 0u;
  self->fRegistry = 0u;
  *(_OWORD *)&self->fRestModule.__ptr_.__value_ = 0u;
  *(shared_ptr<void> *)((char *)&self->fBasebandOnlineAssertion + 4) = 0u;
  *(_OWORD *)&self->fCurrentCallsCopy.__begin_ = 0u;
  *(_OWORD *)&self->fCurrentCallsCopy.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->fCurrentCalls.fValue.__end_ = 0u;
  self->fStoredSwitchUseIbisMode.__ptr_.__value_ = 0;
  self->fCallCapabilities.fValue.__tree_.__begin_node_ = &self->fCallCapabilities.fValue.__tree_.__pair1_;
  self->fEmergencyNumbers.fValue.__tree_.__pair1_.__value_.__left_ = 0;
  self->fCallCapabilities.fValue.__tree_.__pair3_.__value_ = 0;
  self->fEmergencyNumbers.fValue.__tree_.__begin_node_ = &self->fEmergencyNumbers.fValue.__tree_.__pair1_;
  self->fDisambiguationEmergencyNumbers.fValue.__tree_.__pair1_.__value_.__left_ = 0;
  self->fEmergencyNumbers.fValue.__tree_.__pair3_.__value_ = 0;
  self->fDisambiguationEmergencyNumbers.fValue.__tree_.__begin_node_ = &self->fDisambiguationEmergencyNumbers.fValue.__tree_.__pair1_;
  self->fExcludedNumbers.fValue.__tree_.__pair1_.__value_.__left_ = 0;
  self->fDisambiguationEmergencyNumbers.fValue.__tree_.__pair3_.__value_ = 0;
  self->fExcludedNumbers.fValue.__tree_.__begin_node_ = &self->fExcludedNumbers.fValue.__tree_.__pair1_;
  self->fExcludedNumbers.fValue.__tree_.__pair3_.__value_ = 0;
  sub_100058DB0(&self->fCallFrequencyData.fValue.fCallUuid.__r_.__value_.var0.var1.__data_, "");
  *(void *)&self->fCallFrequencyData.fValue.fCallUuid.__r_.var0 = xpc_null_create();
  LOBYTE(self->fCallFrequencyData.fValue.fCallUuid.var0) = 0;
  self->fThumperHandoffAllowed.fValue.__tree_.__begin_node_ = &self->fThumperHandoffAllowed.fValue.__tree_.__pair1_;
  self->fThumperHandoffAllowed.fValue.__tree_.__pair1_.__value_.__left_ = 0;
  self->fVoWiFiProv.fValue.__tree_.__pair1_.__value_.__left_ = 0;
  self->fVoWiFiProv.fValue.__tree_.__pair3_.__value_ = 0;
  self->fThumperHandoffAllowed.fValue.__tree_.__pair3_.__value_ = 0;
  self->fVoWiFiProv.fValue.__tree_.__begin_node_ = &self->fVoWiFiProv.fValue.__tree_.__pair1_;
  self->fSubscriptionInfo.fValue.fSubscriptions.__tree_.__pair3_.__value_ = 0;
  self->fActiveSubscriptions.fValue.fSubscriptions.__begin_ = 0;
  self->fSubscriptionInfo.fValue.fSubscriptions.__tree_.__begin_node_ = &self->fSubscriptionInfo.fValue.fSubscriptions.__tree_.__pair1_;
  self->fSubscriptionInfo.fValue.fSubscriptions.__tree_.__pair1_.__value_.__left_ = 0;
  self->fActiveSubscriptions.fValue.fSubscriptions.__end_ = 0;
  self->fActiveSubscriptions.fValue.fSubscriptions.__end_cap_.__value_ = 0;
  self->fLastVisibleMCC.fValue.__tree_.__begin_node_ = &self->fLastVisibleMCC.fValue.__tree_.__pair1_;
  self->fLastVisibleMCC.fValue.__tree_.__pair1_.__value_.__left_ = 0;
  self->fLastKnownHomePlmn.fValue.__tree_.__pair1_.__value_.__left_ = 0;
  self->fLastKnownHomePlmn.fValue.__tree_.__pair3_.__value_ = 0;
  self->fLastVisibleMCC.fValue.__tree_.__pair3_.__value_ = 0;
  self->fLastKnownHomePlmn.fValue.__tree_.__begin_node_ = &self->fLastKnownHomePlmn.fValue.__tree_.__pair1_;
  return self;
}

@end