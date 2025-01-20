@interface AVAudioSessionServerPriv
- (AVAudioSessionServerPriv)init;
- (AVAudioSessionServerPriv)initWithAudioControlQueue:(id)a3 delegate:(id)a4;
- (BOOL)checkMicrophoneInjectionPermission;
- (BOOL)interruptDummyPlayersForSession:(unsigned int)a3;
- (id)createTimestampWriterForDevice:(id)a3 halID:(unsigned int)a4 isDecoupledInput:(BOOL)a5;
- (id)getSessionsWithMicrophoneInjectionPreference;
- (int)activateWithFlags:(unsigned int)a3 auditToken:(id *)a4 flags:(unsigned int)a5;
- (int)deactivateWithFlags:(unsigned int)a3 auditToken:(id *)a4 flags:(unsigned int)a5;
- (int)destroyCMSessionForPID:(int)a3 sessionID:(unsigned int)a4;
- (int)destroySession:(unsigned int)a3 auditToken:(id *)a4;
- (int)destroySession:(unsigned int)a3 procID:(const void *)a4;
- (int)queuePIDOverridden:(int)a3;
- (int)requestApplyInputMuteForSession:(unsigned int)a3 inputMuted:(BOOL)a4;
- (int)setClientMuteState:(BOOL)a3 sessionID:(unsigned int)a4 playerType:(unsigned int)a5 playerRef:(void *)a6;
- (int)setMXSessionProperty:(id)a3 forSessionID:(unsigned int)a4 value:(id)a5;
- (int)setMicrophoneInjectionCapability:(BOOL)a3;
- (opaqueCMSession)copyCMSession:(unsigned int)a3;
- (tuple<int,)checkBooleanEntitlementForSession:(unsigned int)a3 entitlementIdentifier:(const char *)a4;
- (tuple<int,)getDescriptionForSession:(int> *__return_ptr)retstr;
- (tuple<int,)getJSONDescriptionForSession:(int> *__return_ptr)retstr;
- (tuple<int,)getMXSessionProperty:(id)a3 forSessionID:(unsigned int)a4;
- (tuple<int,)getSourceProcessAuditToken:(AVAudioSessionServerPriv *)self;
- (tuple<int,)isSessionMuted:(unsigned int)a3;
- (tuple<int,)setPlayState:(unsigned int)a3 sessionID:(unsigned int)a4 playerType:(unsigned int)a5 playerRef:(void *)a6 modes:(unsigned int)a7 subsessionRef:(void *)a8;
- (tuple<opaqueCMSession)createCoreMXSession:(unsigned int> *__return_ptr)retstr type:(AVAudioSessionServerPriv *)self;
- (tuple<opaqueCMSession)createCoreMXSessionForPID:(unsigned int> *__return_ptr)retstr;
- (tuple<opaqueCMSession)createCoreMXSessionForProcID:(unsigned int> *__return_ptr)retstr type:(AVAudioSessionServerPriv *)self;
- (tuple<opaqueCMSession)getPrimarySession:(unsigned int> *__return_ptr)retstr createIfNecessary:(AVAudioSessionServerPriv *)self;
- (tuple<opaqueCMSession)getPrimarySessionForPID:(unsigned int> *__return_ptr)retstr createIfNecessary:(AVAudioSessionServerPriv *)self;
- (tuple<opaqueCMSession)getPrimarySessionForProcID:(unsigned int> *__return_ptr)retstr createIfNecessary:(AVAudioSessionServerPriv *)self;
- (unint64_t)dynamicLatencyForDevice:(unsigned int)a3;
- (unint64_t)dynamicLatencyForDevice:(unsigned int)a3 isInput:(BOOL)a4;
- (vector<unsigned)getSessionIDsForToken:(AVAudioSessionServerPriv *)self;
- (void)destroyTimestampWriterForDevice:(id)a3;
- (void)generateIOControllerEvent:(unint64_t)a3 forDevice:(unsigned int)a4;
- (void)getDefaultMXSession:(unsigned int)a3;
- (void)mapSession:(unsigned int)a3 isInput:(BOOL)a4 toDevice:(id)a5;
- (void)sampleRateChanged:(double)a3 forDevice:(unsigned int)a4;
- (void)startXPCServer;
@end

@implementation AVAudioSessionServerPriv

- (void)getDefaultMXSession:(unsigned int)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3 + 4 < 5) {
    return 0;
  }
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v16, a3);
  v5 = v16;
  if (v16)
  {
    v6 = v17;
    if (v17) {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v5, cf);
    v3 = *(void **)cf;
    if (*(void *)cf) {
      CFRelease(*(CFTypeRef *)cf);
    }
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  else
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)cf, "sessionID");
    *(void *)&v20[2] = cf;
    v20[10] = 1;
    BYTE2(v22) = 6;
    v24 = (void **)a3;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22 + 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22 + 2);
    *(void *)v25 = (char *)&v22 + 2;
    v25[8] = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v26, (uint64_t)cf, 2, 1, 2);
    v28 = &v26;
    char v29 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v14, (uint64_t)&v26, 1, 1, 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v26);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26);
    for (uint64_t i = 0; i != -64; i -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22 + i + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v25[i - 8], *((unsigned __int8 *)&v22 + i + 2));
    }
    v9 = *(id *)as::server::gSessionServerLog(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v26 = 0;
      v27 = 0;
      v28 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v14, -1, 0x20u, 0, 0, __p);
      if (v13 >= 0) {
        v10 = __p;
      }
      else {
        v10 = (void **)__p[0];
      }
      *(_DWORD *)cf = 136316418;
      *(void *)&cf[4] = "AVAudioSessionServer.mm";
      __int16 v19 = 1024;
      *(_DWORD *)v20 = 177;
      *(_WORD *)&v20[4] = 2080;
      *(void *)&v20[6] = "get_mx_session";
      __int16 v21 = 2080;
      v22 = "Session lookup failed";
      __int16 v23 = 2080;
      v24 = &v26;
      *(_WORD *)v25 = 2080;
      *(void *)&v25[2] = v10;
      _os_log_impl(&dword_1CFE2A000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", cf, 0x3Au);
      if (v13 < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v28) < 0) {
        operator delete(v26);
      }
    }

    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v14);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v15, v14[0]);
    v3 = 0;
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  return v3;
}

- (tuple<int,)getDescriptionForSession:(int> *__return_ptr)retstr
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (v2 != 0 && v2 < 0xFFFFFFFC)
  {
    unsigned int v5 = v2;
    as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v19, v2);
    uint64_t v6 = v19;
    if (v19)
    {
      v7 = (std::__shared_weak_count *)v20;
      if (v20) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)&v20->var0.var1.__r_.__value_.var0.var1, 1uLL, memory_order_relaxed);
      }
      v8 = (char *)(v6 + 176);
      if (*(char *)(v6 + 199) < 0) {
        v8 = *(char **)v8;
      }
      v9 = (std::__shared_weak_count *)v20;
      if (v20) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)&v20->var0.var1.__r_.__value_.var0.var1, 1uLL, memory_order_relaxed);
      }
      int v10 = *(_DWORD *)(v6 + 88);
      retstr->var0.var0 = 0;
      std::string::basic_string[abi:ne180100]<0>(&retstr->var0.var1.__r_.__value_.var0.var1.__data_, v8);
      retstr->var0.var1.__r_.var0 = v10;
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
      if (v7) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
    }
    else
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)buf, "sessionID");
      *(void *)&v24[2] = buf;
      v24[10] = 1;
      BYTE2(v26) = 6;
      unint64_t v28 = v5;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v26 + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v26 + 2);
      *(void *)char v29 = (char *)&v26 + 2;
      v29[8] = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v30, (uint64_t)buf, 2, 1, 2);
      v32 = &v30;
      char v33 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v17, (uint64_t)&v30, 1, 1, 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v31, v30);
      for (uint64_t i = 0; i != -64; i -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v26 + i + 2);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v29[i - 8], *((unsigned __int8 *)&v26 + i + 2));
      }
      char v13 = *(id *)as::server::gSessionServerLog(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = 0;
        v31 = 0;
        v32 = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v17, -1, 0x20u, 0, 0, __p);
        if (v16 >= 0) {
          v14 = __p;
        }
        else {
          v14 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136316418;
        v22 = "AVAudioSessionServer.mm";
        __int16 v23 = 1024;
        *(_DWORD *)v24 = 194;
        *(_WORD *)&v24[4] = 2080;
        *(void *)&v24[6] = "get_description";
        __int16 v25 = 2080;
        v26 = "Session lookup failed";
        __int16 v27 = 2080;
        unint64_t v28 = (unint64_t)&v30;
        *(_WORD *)char v29 = 2080;
        *(void *)&v29[2] = v14;
        _os_log_impl(&dword_1CFE2A000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x3Au);
        if (v16 < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v32) < 0) {
          operator delete(v30);
        }
      }

      retstr->var0.var0 = 561210739;
      std::string::basic_string[abi:ne180100]<0>(&retstr->var0.var1.__r_.__value_.var0.var1.__data_, "");
      retstr->var0.var1.__r_.var0 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v18, v17[0]);
    }
    result = v20;
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v20);
    }
  }
  else
  {
    retstr->var0.var0 = -50;
    result = (tuple<int, std::string, int> *)std::string::basic_string[abi:ne180100]<0>(&retstr->var0.var1.__r_.__value_.var0.var1.__data_, "");
    retstr->var0.var1.__r_.var0 = 0;
  }
  return result;
}

- (int)setClientMuteState:(BOOL)a3 sessionID:(unsigned int)a4 playerType:(unsigned int)a5 playerRef:(void *)a6
{
  return as::server::require_acq::AudioSessionServerSetClientMuteState(*(AudioSession **)&a4, a5, a6, a3);
}

- (id)createTimestampWriterForDevice:(id)a3 halID:(unsigned int)a4 isDecoupledInput:(BOOL)a5
{
  v7 = (as::server::LegacySessionManager *)a3;
  v8 = as::server::LegacySessionManager::Instance(v7);
  uint64_t v9 = v8[31];
  if (v9)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8[31]);
    unsigned int v15 = a4;
    int v10 = v7;
    v11 = v10;
    if (v10) {
      CFRetain(v10);
    }
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v11);

    BOOL v17 = a5;
    uint64_t v12 = mach_absolute_time();
    v18[0] = as::server::DeviceTimeObserver::createDevice((uint64_t *)(v9 + 8), (uint64_t)&v15, v12);
    v18[1] = v13;
    if (cf) {
      CFRelease(cf);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v9);
    uint64_t v9 = as::server::DeviceTimeObserver::DeviceSlot::timestampWriter((as::server::DeviceTimeObserver::DeviceSlot *)v18);
  }

  return (id)v9;
}

- (void)mapSession:(unsigned int)a3 isInput:(BOOL)a4 toDevice:(id)a5
{
  BOOL v5 = a4;
  v7 = (as::server::LegacySessionManager *)a5;
  v8 = as::server::LegacySessionManager::Instance(v7);
  uint64_t v9 = *((void *)v8 + 31);
  if (v9)
  {
    os_unfair_lock_lock(*((os_unfair_lock_t *)v8 + 31));
    int v10 = v7;
    v11 = v10;
    if (v10) {
      CFRetain(v10);
    }
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v11);

    uint64_t v12 = mach_absolute_time();
    as::server::DeviceTimeObserver::mapSessionToDevice((uint64_t *)(v9 + 8), a3, v5, (const __CFString **)&cf, v12);
    if (cf) {
      CFRelease(cf);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v9);
  }
}

- (void)generateIOControllerEvent:(unint64_t)a3 forDevice:(unsigned int)a4
{
  uint64_t v6 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  uint64_t v7 = *((void *)v6 + 31);
  if (v7)
  {
    v8 = (os_unfair_lock_s *)v6;
    os_unfair_lock_lock(*((os_unfair_lock_t *)v6 + 31));
    as::server::DeviceTimeObserver::sessionsObservingDeviceEvent((uint64_t *)(v7 + 8), a4, a3, (uint64_t)&__p);
    os_unfair_lock_unlock((os_unfair_lock_t)v7);
    uint64_t v9 = __p;
    if (__p != v11)
    {
      as::server::LegacySessionManager::GenerateIOControllerEventForSessions(v8, a3, (int **)&__p);
      uint64_t v9 = __p;
    }
    if (v9)
    {
      v11 = v9;
      operator delete(v9);
    }
  }
}

- (tuple<int,)checkBooleanEntitlementForSession:(unsigned int)a3 entitlementIdentifier:(const char *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a3 + 4 >= 5)
  {
    as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v19, a3);
    uint64_t v7 = v19;
    if (v19)
    {
      unint64_t v8 = (unint64_t)v20;
      if (v20) {
        atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      BOOL HasBooleanEntitlement = as::server::ConstAudioSessionInfo::HasBooleanEntitlement(v7, a4);
      if (v8)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
        unint64_t v8 = 0;
      }
    }
    else
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)buf, "sessionID");
      *(void *)&v24[2] = buf;
      v24[10] = 1;
      BYTE2(v26) = 6;
      unint64_t v28 = (void **)a3;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v26 + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v26 + 2);
      *(void *)char v29 = (char *)&v26 + 2;
      v29[8] = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v30, (uint64_t)buf, 2, 1, 2);
      v32 = &v30;
      char v33 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v17, (uint64_t)&v30, 1, 1, 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v31, v30);
      for (uint64_t i = 0; i != -64; i -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v26 + i + 2);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v29[i - 8], *((unsigned __int8 *)&v26 + i + 2));
      }
      uint64_t v12 = *(id *)as::server::gSessionServerLog(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = 0;
        v31 = 0;
        v32 = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v17, -1, 0x20u, 0, 0, __p);
        if (v16 >= 0) {
          uint64_t v13 = __p;
        }
        else {
          uint64_t v13 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136316418;
        v22 = "AVAudioSessionServer.mm";
        __int16 v23 = 1024;
        *(_DWORD *)v24 = 156;
        *(_WORD *)&v24[4] = 2080;
        *(void *)&v24[6] = "check_BOOL_entitlement";
        __int16 v25 = 2080;
        v26 = "Session lookup failed";
        __int16 v27 = 2080;
        unint64_t v28 = &v30;
        *(_WORD *)char v29 = 2080;
        *(void *)&v29[2] = v13;
        _os_log_impl(&dword_1CFE2A000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x3Au);
        if (v16 < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v32) < 0) {
          operator delete(v30);
        }
      }

      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v18, v17[0]);
      BOOL HasBooleanEntitlement = 0;
      unint64_t v8 = 561210739;
    }
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    uint64_t v14 = 0x100000000;
    if (!HasBooleanEntitlement) {
      uint64_t v14 = 0;
    }
    return (tuple<int, BOOL>)(v14 | v8);
  }
  else
  {
    return (tuple<int, BOOL>)4294967246;
  }
}

- (opaqueCMSession)copyCMSession:(unsigned int)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v16, a3);
  v4 = v16;
  if (v16)
  {
    BOOL v5 = v17;
    if (v17) {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    as::server::ConstAudioSessionInfo::GetCMSessionRef(v4, cf);
    uint64_t v6 = *(opaqueCMSession **)cf;
    if (*(void *)cf) {
      CFRelease(*(CFTypeRef *)cf);
    }
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
    if (v6) {
      CFRetain(v6);
    }
  }
  else
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)cf, "sessionID");
    *(void *)&v20[2] = cf;
    v20[10] = 1;
    BYTE2(v22) = 6;
    v24 = (void **)a3;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22 + 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22 + 2);
    *(void *)__int16 v25 = (char *)&v22 + 2;
    v25[8] = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v26, (uint64_t)cf, 2, 1, 2);
    unint64_t v28 = &v26;
    char v29 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v14, (uint64_t)&v26, 1, 1, 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v26);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26);
    for (uint64_t i = 0; i != -64; i -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22 + i + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v25[i - 8], *((unsigned __int8 *)&v22 + i + 2));
    }
    uint64_t v9 = *(id *)as::server::gSessionServerLog(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v26 = 0;
      __int16 v27 = 0;
      unint64_t v28 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v14, -1, 0x20u, 0, 0, __p);
      if (v13 >= 0) {
        int v10 = __p;
      }
      else {
        int v10 = (void **)__p[0];
      }
      *(_DWORD *)CFTypeRef cf = 136316418;
      *(void *)&cf[4] = "AVAudioSessionServer.mm";
      __int16 v19 = 1024;
      *(_DWORD *)v20 = 299;
      *(_WORD *)&v20[4] = 2080;
      *(void *)&v20[6] = "copy_CMSession";
      __int16 v21 = 2080;
      v22 = "Session lookup failed";
      __int16 v23 = 2080;
      v24 = &v26;
      *(_WORD *)__int16 v25 = 2080;
      *(void *)&v25[2] = v10;
      _os_log_impl(&dword_1CFE2A000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", cf, 0x3Au);
      if (v13 < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v28) < 0) {
        operator delete(v26);
      }
    }

    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v14);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v15, v14[0]);
    uint64_t v6 = 0;
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  return v6;
}

- (void)sampleRateChanged:(double)a3 forDevice:(unsigned int)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  uint64_t v7 = (os_unfair_lock_s *)*((void *)v6 + 31);
  if (v7)
  {
    os_unfair_lock_lock(*((os_unfair_lock_t *)v6 + 31));
    as::server::DeviceTimeObserver::setSampleRate((uint64_t)&v7[2], a4, a3);
    os_unfair_lock_unlock(v7);
    int outData = 0;
    UInt32 ioDataSize = 4;
    uint64_t inAddress = *(void *)"tlwhptuo";
    uint64_t inAddress_8 = 0;
    *(void *)&v14.mSelector = *(void *)"tlwhtpni";
    v14.mElement = 0;
    PropertyData = (as::server *)AudioObjectGetPropertyData(a4, (const AudioObjectPropertyAddress *)&inAddress, 0, 0, &ioDataSize, &outData);
    if (PropertyData)
    {
      uint64_t v9 = *(id *)as::server::gSessionServerLog(PropertyData);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136315394;
      v20 = "AVAudioSessionServer.mm";
      __int16 v21 = 1024;
      int v22 = 458;
LABEL_8:
      _os_log_impl(&dword_1CFE2A000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to get output device constant latency", buf, 0x12u);
      return;
    }
    int v10 = (as::server *)AudioObjectGetPropertyData(a4, &v14, 0, 0, &ioDataSize, (char *)&inAddress_8 + 4);
    if (v10)
    {
      uint64_t v9 = *(id *)as::server::gSessionServerLog(v10);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136315394;
      v20 = "AVAudioSessionServer.mm";
      __int16 v21 = 1024;
      int v22 = 464;
      goto LABEL_8;
    }
    os_unfair_lock_lock(v7);
    LODWORD(v11) = HIDWORD(inAddress_8);
    double v12 = 1000000000.0 / a3 * (double)v11;
    unint64_t v13 = llround(v12);
    LODWORD(v12) = outData;
    as::server::DeviceTimeObserver::setFixedLatency((uint64_t)&v7[2], a4, v13, llround(1000000000.0 / a3 * (double)*(unint64_t *)&v12));
    os_unfair_lock_unlock(v7);
  }
}

- (tuple<int,)setPlayState:(unsigned int)a3 sessionID:(unsigned int)a4 playerType:(unsigned int)a5 playerRef:(void *)a6 modes:(unsigned int)a7 subsessionRef:(void *)a8
{
  memset(v11, 0, 12);
  unsigned int v8 = as::server::require_acq::AudioSessionServerSetClientPlayState(*(AudioSession **)&a4, a5, (AudioSession *)a6, a7, a3, (char *)v11, (uint64_t)a8);
  uint64_t v9 = *(void *)((char *)v11 + 4);
  unint64_t v10 = v8 | ((unint64_t)LODWORD(v11[0]) << 32);
  *(void *)&result.var0.var1.var1 = v9;
  *(void *)&result.var0.var0 = v10;
  return result;
}

- (AVAudioSessionServerPriv)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVAudioSessionServerPriv;
  unsigned int v2 = [(AVAudioSessionServerPriv *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVAudioSessionXPCServer);
    xpcServer = v2->_xpcServer;
    v2->_xpcServer = v3;
  }
  return v2;
}

- (AVAudioSessionServerPriv)initWithAudioControlQueue:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVAudioSessionServerPriv;
  unsigned int v8 = [(AVAudioSessionServerPriv *)&v12 init];
  if (v8)
  {
    as::server::SetAudioControlQueue(v6);
    uint64_t v9 = [[AVAudioSessionXPCServer alloc] initWithDelegate:v7];
    xpcServer = v8->_xpcServer;
    v8->_xpcServer = v9;

    objc_storeStrong((id *)&v8->_serverDelegate, a4);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDelegate, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
}

- (void)startXPCServer
{
  as::server::forbid_acq::SystemController::Instance((as::server::forbid_acq::SystemController *)self);
  xpcServer = self->_xpcServer;
  [(AVAudioSessionXPCServer *)xpcServer start];
}

- (int)activateWithFlags:(unsigned int)a3 auditToken:(id *)a4 flags:(unsigned int)a5
{
  return as::server::ff_acq::AudioSessionServerActivateWithFlags(self->_serverDelegate, *(AudioSession **)&a3, (uint64_t)a4, a5);
}

- (int)deactivateWithFlags:(unsigned int)a3 auditToken:(id *)a4 flags:(unsigned int)a5
{
  return as::server::ff_acq::AudioSessionServerDeactivateWithFlags(self->_serverDelegate, *(uint64_t *)&a3, (as::server::AudioSessionInfoAccessor *)a4, a5);
}

- (vector<unsigned)getSessionIDsForToken:(AVAudioSessionServerPriv *)self
{
  id v6 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  as::server::LegacySessionManager::GetSessionIDsForToken(v6, (const audit_token_t *)a4, (char **)retstr);
  return result;
}

- (tuple<int,)getJSONDescriptionForSession:(int> *__return_ptr)retstr
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (v2 != 0 && v2 < 0xFFFFFFFC)
  {
    unsigned int v5 = v2;
    as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v20, v2);
    uint64_t v6 = v20;
    if (v20)
    {
      id v7 = (std::__shared_weak_count *)v21;
      if (v21) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)&v21->var0.var1.__r_.__value_.var0.var1, 1uLL, memory_order_relaxed);
      }
      if (*(char *)(v6 + 223) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)buf, *(const std::string::value_type **)(v6 + 200), *(void *)(v6 + 208));
        uint64_t v6 = v20;
        if (!v20)
        {
          uint64_t v15 = _os_crash();
          as::server::require_acq::AudioSessionServerSetClientPlayState(v15);
        }
      }
      else
      {
        *(_OWORD *)buf = *(_OWORD *)(v6 + 200);
        *(void *)&buf[16] = *(void *)(v6 + 216);
      }
      objc_super v12 = (std::__shared_weak_count *)v21;
      if (v21) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)&v21->var0.var1.__r_.__value_.var0.var1, 1uLL, memory_order_relaxed);
      }
      int v13 = *(_DWORD *)(v6 + 88);
      retstr->var0.var0 = 0;
      p_var1 = (std::string *)&retstr->var0.var1;
      if ((buf[23] & 0x80000000) != 0)
      {
        std::string::__init_copy_ctor_external(p_var1, *(const std::string::value_type **)buf, *(std::string::size_type *)&buf[8]);
      }
      else
      {
        *(_OWORD *)&p_var1->__r_.__value_.__l.__data_ = *(_OWORD *)buf;
        *((void *)&retstr->var0.var1.__r_.__value_.var0.var1 + 2) = *(void *)&buf[16];
      }
      retstr->var0.var1.__r_.var0 = v13;
      if (v12) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if (v7) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
    }
    else
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)buf, "sessionID");
      *(void *)&buf[16] = buf;
      buf[24] = 1;
      BYTE2(v24) = 6;
      unint64_t v26 = v5;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v24 + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v24 + 2);
      *(void *)__int16 v27 = (char *)&v24 + 2;
      v27[8] = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v28, (uint64_t)buf, 2, 1, 2);
      uint64_t v30 = &v28;
      char v31 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v18, (uint64_t)&v28, 1, 1, 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v28);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28);
      for (uint64_t i = 0; i != -64; i -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v24 + i + 2);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v27[i - 8], *((unsigned __int8 *)&v24 + i + 2));
      }
      unint64_t v10 = *(id *)as::server::gSessionServerLog(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unint64_t v28 = 0;
        char v29 = 0;
        uint64_t v30 = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v18, -1, 0x20u, 0, 0, __p);
        if (v17 >= 0) {
          unint64_t v11 = __p;
        }
        else {
          unint64_t v11 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "AVAudioSessionServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 211;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "get_description";
        __int16 v23 = 2080;
        v24 = "Session lookup failed";
        __int16 v25 = 2080;
        unint64_t v26 = (unint64_t)&v28;
        *(_WORD *)__int16 v27 = 2080;
        *(void *)&v27[2] = v11;
        _os_log_impl(&dword_1CFE2A000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x3Au);
        if (v17 < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v30) < 0) {
          operator delete(v28);
        }
      }

      retstr->var0.var0 = 561210739;
      std::string::basic_string[abi:ne180100]<0>(&retstr->var0.var1.__r_.__value_.var0.var1.__data_, "");
      retstr->var0.var1.__r_.var0 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v18);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v19, v18[0]);
    }
    tuple<int, AudioSessionDuckingInfo> result = v21;
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v21);
    }
  }
  else
  {
    retstr->var0.var0 = -50;
    tuple<int, AudioSessionDuckingInfo> result = (tuple<int, std::string, int> *)std::string::basic_string[abi:ne180100]<0>(&retstr->var0.var1.__r_.__value_.var0.var1.__data_, "");
    retstr->var0.var1.__r_.var0 = 0;
  }
  return result;
}

- (BOOL)interruptDummyPlayersForSession:(unsigned int)a3
{
  return as::server::require_acq::AudioSessionServerInterruptDummyPlayers(*(as::server::require_acq **)&a3) != 0;
}

- (tuple<int,)isSessionMuted:(unsigned int)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3 + 4 >= 5)
  {
    as::server::AudioSessionInfoAccessor::AudioSessionInfoAccessor((as::server::AudioSessionInfoAccessor *)&v16, a3);
    unsigned int v5 = v16;
    if (v16)
    {
      uint64_t v6 = v17;
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int IsSessionInputMuted = as::server::AudioSessionInfo::IsSessionInputMuted(v5);
      if (v6) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
      as::server::AudioSessionInfoAccessor::~AudioSessionInfoAccessor((os_unfair_lock_s **)&v16);
      if (IsSessionInputMuted) {
        return (tuple<int, BOOL>)0x100000000;
      }
      else {
        return (tuple<int, BOOL>)0;
      }
    }
    else
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)buf, "sessionID");
      *(void *)&v21[2] = buf;
      v21[10] = 1;
      BYTE2(v23) = 6;
      __int16 v25 = (void **)a3;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v23 + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v23 + 2);
      *(void *)unint64_t v26 = (char *)&v23 + 2;
      v26[8] = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v27, (uint64_t)buf, 2, 1, 2);
      char v29 = &v27;
      char v30 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v14, (uint64_t)&v27, 1, 1, 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v27);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v28, v27);
      for (uint64_t i = 0; i != -64; i -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v23 + i + 2);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v26[i - 8], *((unsigned __int8 *)&v23 + i + 2));
      }
      unint64_t v10 = *(id *)as::server::gSessionServerLog(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = 0;
        unint64_t v28 = 0;
        char v29 = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v14, -1, 0x20u, 0, 0, __p);
        if (v13 >= 0) {
          unint64_t v11 = __p;
        }
        else {
          unint64_t v11 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136316418;
        __int16 v19 = "AVAudioSessionServer.mm";
        __int16 v20 = 1024;
        *(_DWORD *)__int16 v21 = 233;
        *(_WORD *)&v21[4] = 2080;
        *(void *)&v21[6] = "is_session_muted";
        __int16 v22 = 2080;
        __int16 v23 = "Session lookup failed";
        __int16 v24 = 2080;
        __int16 v25 = &v27;
        *(_WORD *)unint64_t v26 = 2080;
        *(void *)&v26[2] = v11;
        _os_log_impl(&dword_1CFE2A000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x3Au);
        if (v13 < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v29) < 0) {
          operator delete(v27);
        }
      }

      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v14);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v15, v14[0]);
      as::server::AudioSessionInfoAccessor::~AudioSessionInfoAccessor((os_unfair_lock_s **)&v16);
      return (tuple<int, BOOL>)561210739;
    }
  }
  else
  {
    return (tuple<int, BOOL>)4294967246;
  }
}

- (int)requestApplyInputMuteForSession:(unsigned int)a3 inputMuted:(BOOL)a4
{
  BOOL v4 = a4;
  {
    if (self)
    {
      as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
    }
  }
  int v6 = 2003329396;
  if (as::AudioSessionMuteEnabled(void)::enabled)
  {
    as::server::AudioSessionInfoAccessor::AudioSessionInfoAccessor((as::server::AudioSessionInfoAccessor *)&v13, a3);
    id v7 = v13;
    if (v13)
    {
      unsigned int v8 = v14;
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v6 = as::server::AudioSessionInfo::SetSessionInputMuted(v7, v4);
      if (v8) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
    }
    as::server::AudioSessionInfoAccessor::~AudioSessionInfoAccessor((os_unfair_lock_s **)&v13);
  }
  else
  {
    uint64_t v9 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
    as::server::LegacySessionManager::FindAudioApplicationForSession(v9, a3, &v13);
    unint64_t v10 = (os_unfair_lock_s *)v13;
    if (v13)
    {
      unint64_t v11 = [NSNumber numberWithBool:v4];
      int v6 = as::server::AudioApplicationInfo::SetProperty(v10, @"InputMute", v11);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  return v6;
}

- (int)queuePIDOverridden:(int)a3
{
  unsigned int v5 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  v8[0] = 0;
  v8[32] = 0;
  int v9 = a3;
  as::server::LegacySessionManager::FindOrCreatePrimarySession((uint64_t)v5, (uint64_t)v8, 0, self->_serverDelegate, 1, (uint64_t)&v10);
  if (v10)
  {
    int v6 = 0;
    *(unsigned char *)(v10 + 312) = 1;
  }
  else
  {
    int v6 = 2003329396;
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return v6;
}

- (tuple<opaqueCMSession)createCoreMXSessionForProcID:(unsigned int> *__return_ptr)retstr type:(AVAudioSessionServerPriv *)self
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v7 = *((_OWORD *)a4 + 1);
  v25[0] = *(_OWORD *)a4;
  v25[1] = v7;
  uint64_t v26 = *((void *)a4 + 4);
  unsigned int v27 = a5;
  id v28 = 0;
  id v29 = 0;
  int v30 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  unsigned int v8 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  as::server::LegacySessionManager::CreateSession(v8, (uint64_t)v25, 0, self->_serverDelegate, &v24);
  if ((void)v24)
  {
    strcpy(v42, "create_core_session");
    uint64_t v10 = *(id *)as::server::gSessionServerLog(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (*(char *)(v24 + 223) < 0) {
        std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)(v24 + 200), *(void *)(v24 + 208));
      }
      else {
        std::string v23 = *(std::string *)(v24 + 200);
      }
      int v11 = SHIBYTE(v23.__r_.__value_.__r.__words[2]);
      std::string::size_type v12 = v23.__r_.__value_.__r.__words[0];
      v19[0] = 0;
      __int16 v20 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v19, -1, 0x20u, 0, 0, __p);
      char v13 = &v23;
      if (v11 < 0) {
        char v13 = (std::string *)v12;
      }
      if (v22 >= 0) {
        AudioObjectPropertyAddress v14 = __p;
      }
      else {
        AudioObjectPropertyAddress v14 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "AVAudioSessionServer.mm";
      __int16 v34 = 1024;
      int v35 = 316;
      __int16 v36 = 2080;
      v37 = v42;
      __int16 v38 = 2080;
      v39 = v13;
      __int16 v40 = 2080;
      v41 = v14;
      _os_log_impl(&dword_1CFE2A000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d { \"action\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x30u);
      if (v22 < 0) {
        operator delete(__p[0]);
      }
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v20, v19[0]);
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v23.__r_.__value_.__l.__data_);
      }
    }

    as::server::ConstAudioSessionInfo::GetCMSessionRef((CFTypeRef)v24, buf);
    uint64_t v15 = *(opaqueCMSession **)buf;
    as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef((CFTypeRef)v24, &v23);
    char v16 = (void *)v23.__r_.__value_.__r.__words[0];
    unsigned int v17 = *(_DWORD *)(v24 + 8);
    retstr->var0.var0 = v15;
    retstr->var0.var1 = v16;
    retstr->var0.var2 = v17;
    if (v16) {
      CFRelease(v16);
    }
    if (*(void *)buf) {
      CFRelease(*(CFTypeRef *)buf);
    }
  }
  else
  {
    retstr->var0.var0 = 0;
    retstr->var0.var1 = 0;
    retstr->var0.var2 = 0;
  }
  if (*((void *)&v24 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v24 + 1));
  }
  if (*((void *)&v32 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v32 + 1));
  }

  return result;
}

- (tuple<opaqueCMSession)createCoreMXSession:(unsigned int> *__return_ptr)retstr type:(AVAudioSessionServerPriv *)self
{
  uint64_t v5 = *(void *)&a5;
  long long v7 = *(_OWORD *)&a4->var0[4];
  v9[0] = *(_OWORD *)a4->var0;
  v9[1] = v7;
  char v10 = 1;
  *(_OWORD *)atoken.val = v9[0];
  *(_OWORD *)&atoken.val[4] = v7;
  pid_t v11 = audit_token_to_pid(&atoken);
  return [(AVAudioSessionServerPriv *)self createCoreMXSessionForProcID:v9 type:v5];
}

- (tuple<opaqueCMSession)createCoreMXSessionForPID:(unsigned int> *__return_ptr)retstr
{
  v5[0] = 0;
  v5[32] = 0;
  int v6 = a4;
  return [(AVAudioSessionServerPriv *)self createCoreMXSessionForProcID:v5 type:1718183795];
}

- (tuple<opaqueCMSession)getPrimarySessionForProcID:(unsigned int> *__return_ptr)retstr createIfNecessary:(AVAudioSessionServerPriv *)self
{
  BOOL v5 = a5;
  int v9 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  as::server::LegacySessionManager::FindOrCreatePrimarySession((uint64_t)v9, (uint64_t)a4, 0, self->_serverDelegate, v5, (uint64_t)&v16);
  if (v16)
  {
    as::server::ConstAudioSessionInfo::GetCMSessionRef(v16, &v15);
    char v10 = (opaqueCMSession *)v15;
    as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v16, &cf);
    pid_t v11 = (void *)cf;
    unsigned int v12 = *((_DWORD *)v16 + 2);
    retstr->var0.var0 = v10;
    retstr->var0.var1 = v11;
    retstr->var0.var2 = v12;
    if (v11) {
      CFRelease(v11);
    }
    if (v15) {
      CFRelease(v15);
    }
  }
  else
  {
    retstr->var0.var0 = 0;
    retstr->var0.var1 = 0;
    retstr->var0.var2 = 0;
  }
  tuple<int, AudioSessionDuckingInfo> result = v17;
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v17);
  }
  return result;
}

- (tuple<opaqueCMSession)getPrimarySession:(unsigned int> *__return_ptr)retstr createIfNecessary:(AVAudioSessionServerPriv *)self
{
  BOOL v5 = a5;
  long long v7 = *(_OWORD *)&a4->var0[4];
  v9[0] = *(_OWORD *)a4->var0;
  v9[1] = v7;
  char v10 = 1;
  *(_OWORD *)atoken.val = v9[0];
  *(_OWORD *)&atoken.val[4] = v7;
  pid_t v11 = audit_token_to_pid(&atoken);
  return [(AVAudioSessionServerPriv *)self getPrimarySessionForProcID:v9 createIfNecessary:v5];
}

- (tuple<opaqueCMSession)getPrimarySessionForPID:(unsigned int> *__return_ptr)retstr createIfNecessary:(AVAudioSessionServerPriv *)self
{
  v6[0] = 0;
  v6[32] = 0;
  int v7 = a4;
  return [(AVAudioSessionServerPriv *)self getPrimarySessionForProcID:v6 createIfNecessary:a5];
}

- (int)destroySession:(unsigned int)a3 procID:(const void *)a4
{
  BOOL v5 = *(AudioSession **)&a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[11],char [11],0>((uint64_t)&v28, "client_PID");
  int v30 = &v28;
  char v31 = 1;
  uint64_t v7 = *((int *)a4 + 9);
  v33[0] = 5;
  v34[0] = v7;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v33);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v33);
  v34[1] = v33;
  char v35 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)buf, (uint64_t)&v28, 2, 1, 2);
  *(void *)&v39[2] = buf;
  v39[10] = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[3],char [3],0>((uint64_t)v22, "ID");
  std::string v23 = v22;
  char v24 = 1;
  AudioSession::FormatSessionIDAsHex(v5, __p);
  uint64_t v26 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v25, (uint64_t)__p);
  char v27 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v41 + 2, (uint64_t)v22, 2, 1, 2);
  *(void *)v44 = (char *)&v41 + 2;
  v44[8] = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v19, (uint64_t)buf, 2, 1, 2);
  for (uint64_t i = 0; i != -64; i -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v41 + i + 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v44[i - 8], *((unsigned __int8 *)&v41 + i + 2));
  }
  for (uint64_t j = 0; j != -64; j -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v25[j]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v25[j + 8], v25[j]);
  }
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  for (uint64_t k = 0; k != -8; k -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v33[k * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v34[k], v33[k * 8]);
  }
  strcpy(v21, "destroy_session");
  pid_t v11 = [(AVAudioSessionServerPriv *)self getDescriptionForSession:v5];
  if (v28)
  {
    unsigned int v12 = *(id *)as::server::gSessionServerLog((as::server *)v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22[0] = 0;
      v22[1] = 0;
      std::string v23 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v19, -1, 0x20u, 0, 0, __p);
      if (v18 >= 0) {
        char v13 = __p;
      }
      else {
        char v13 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136316418;
      v37 = "AVAudioSessionServer.mm";
      __int16 v38 = 1024;
      *(_DWORD *)v39 = 373;
      *(_WORD *)&v39[4] = 2080;
      *(void *)&v39[6] = v21;
      __int16 v40 = 2080;
      v41 = "unrecognized session ID";
      __int16 v42 = 2080;
      uint64_t v43 = v22;
      *(_WORD *)v44 = 2080;
      *(void *)&v44[2] = v13;
      _os_log_impl(&dword_1CFE2A000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x3Au);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v23) < 0) {
        operator delete(v22[0]);
      }
    }

    int v14 = v28;
  }
  else
  {
    CFTypeRef v15 = (as::server::LegacySessionManager *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)v11);
    if (as::server::LegacySessionManager::RemoveSession(v15, v5, (const as::server::ProcessIdentity *)a4)) {
      int v14 = 0;
    }
    else {
      int v14 = 2003329396;
    }
  }
  if (v32 < 0) {
    operator delete(v29);
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v20, v19[0]);
  return v14;
}

- (int)destroyCMSessionForPID:(int)a3 sessionID:(unsigned int)a4
{
  v5[0] = 0;
  v5[32] = 0;
  int v6 = a3;
  return [(AVAudioSessionServerPriv *)self destroySession:*(void *)&a4 procID:v5];
}

- (int)destroySession:(unsigned int)a3 auditToken:(id *)a4
{
  uint64_t v4 = *(void *)&a3;
  long long v6 = *(_OWORD *)&a4->var0[4];
  v8[0] = *(_OWORD *)a4->var0;
  v8[1] = v6;
  char v9 = 1;
  *(_OWORD *)atoken.val = v8[0];
  *(_OWORD *)&atoken.val[4] = v6;
  pid_t v10 = audit_token_to_pid(&atoken);
  return [(AVAudioSessionServerPriv *)self destroySession:v4 procID:v8];
}

- (void)destroyTimestampWriterForDevice:(id)a3
{
  v3 = (as::server::LegacySessionManager *)a3;
  uint64_t v4 = as::server::LegacySessionManager::Instance(v3);
  BOOL v5 = (os_unfair_lock_s *)*((void *)v4 + 31);
  if (v5)
  {
    os_unfair_lock_lock(*((os_unfair_lock_t *)v4 + 31));
    long long v6 = v3;
    uint64_t v7 = v6;
    if (v6) {
      CFRetain(v6);
    }
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v7);

    uint64_t v8 = mach_absolute_time();
    as::server::DeviceTimeObserver::removeDevice((gsl::details *)&v5[2], &cf, v8);
    if (cf) {
      CFRelease(cf);
    }
    os_unfair_lock_unlock(v5);
  }
}

- (unint64_t)dynamicLatencyForDevice:(unsigned int)a3
{
  uint64_t v4 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  BOOL v5 = (os_unfair_lock_s *)*((void *)v4 + 31);
  if (!v5) {
    return 0;
  }
  os_unfair_lock_lock(*((os_unfair_lock_t *)v4 + 31));
  unint64_t v6 = as::server::DeviceTimeObserver::nanosecondLatency((as::server::DeviceTimeObserver *)&v5[2], a3, 0);
  os_unfair_lock_unlock(v5);
  return v6;
}

- (int)setMicrophoneInjectionCapability:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  as::server::LegacySessionManager::SetMicrophoneInjectionIsEnabled(v4, v3);
  return 0;
}

- (BOOL)checkMicrophoneInjectionPermission
{
  unsigned int v2 = (as::server::LegacySessionManager *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  return as::server::LegacySessionManager::UserAllowsMicrophoneInjection(v2);
}

- (id)getSessionsWithMicrophoneInjectionPreference
{
  unsigned int v2 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  return as::server::LegacySessionManager::GetSessionsWithMicrophoneInjectionPreference(v2);
}

- (unint64_t)dynamicLatencyForDevice:(unsigned int)a3 isInput:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  uint64_t v7 = (os_unfair_lock_s *)*((void *)v6 + 31);
  if (!v7) {
    return 0;
  }
  os_unfair_lock_lock(*((os_unfair_lock_t *)v6 + 31));
  unint64_t v8 = as::server::DeviceTimeObserver::nanosecondLatency((as::server::DeviceTimeObserver *)&v7[2], a3, v4);
  os_unfair_lock_unlock(v7);
  return v8;
}

- (tuple<int,)getSourceProcessAuditToken:(AVAudioSessionServerPriv *)self
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v12, a4);
  uint64_t v5 = v12;
  if (v12)
  {
    unint64_t v6 = (std::__shared_weak_count *)v13;
    if (v13)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)&v13->var0.var1.var0[1], 1uLL, memory_order_relaxed);
      long long v7 = *(_OWORD *)(v5 + 68);
      long long v14 = *(_OWORD *)(v5 + 52);
      long long v15 = v7;
      int v8 = *(unsigned __int8 *)(v5 + 84);
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      if (v8)
      {
LABEL_4:
        retstr->var0.var0 = 0;
        long long v9 = v15;
        *(_OWORD *)retstr->var0.var1.var0 = v14;
        *(_OWORD *)&retstr->var0.var1.var0[4] = v9;
        goto LABEL_7;
      }
    }
    else
    {
      long long v10 = *(_OWORD *)(v12 + 68);
      long long v14 = *(_OWORD *)(v12 + 52);
      long long v15 = v10;
      if (*(unsigned char *)(v12 + 84)) {
        goto LABEL_4;
      }
    }
  }
  *(_OWORD *)&retstr->var0.var1.var0[4] = 0u;
  *(_OWORD *)retstr->var0.var1.var0 = 0u;
  retstr->var0.var0 = -50;
LABEL_7:
  tuple<int, AudioSessionDuckingInfo> result = v13;
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v13);
  }
  return result;
}

- (tuple<int,)getMXSessionProperty:(id)a3 forSessionID:(unsigned int)a4
{
  uint64_t v6 = v4;
  id v7 = a3;
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v15, a4);
  int v8 = v15;
  if (v15)
  {
    long long v9 = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v8, &cf);
    if (cf) {
      CFRelease(cf);
    }
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    CFTypeRef cf = 0;
    int v10 = MXSessionCopyProperty();
    CFTypeRef v11 = cf;
    *(_DWORD *)uint64_t v6 = v10;
    *(void *)(v6 + 8) = v11;
  }
  else
  {
    *(_DWORD *)uint64_t v6 = -50;
    *(void *)(v6 + 8) = 0;
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }

  result.var0.var1 = v13;
  *(void *)&result.var0.var0 = v12;
  return result;
}

- (int)setMXSessionProperty:(id)a3 forSessionID:(unsigned int)a4 value:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v14, a4);
  long long v9 = v14;
  if (v14)
  {
    int v10 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v9, &cf);
    if (cf) {
      CFRelease(cf);
    }
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    int v11 = MXSessionSetProperty();
  }
  else
  {
    int v11 = -50;
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }

  return v11;
}

@end