@interface IEUpdater
- (BOOL)isUpdateAvailable:(id)a3;
- (BOOL)updateToLatest:(id)a3;
- (id)getFileVersion:(id)a3;
- (id)getHighestVersionWithinRelease:(id)a3;
@end

@implementation IEUpdater

- (id)getFileVersion:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v3 UTF8String]);
    siri::intelligence::Updater::GetFileVersion((uint64_t)__p, &v10);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v5 = &v10;
    }
    else {
      v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
    }
    v6 = [NSString stringWithUTF8String:v5];
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v10.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    v6 = &stru_26ED2AF50;
  }

  return v6;
}

- (BOOL)updateToLatest:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD874E0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD874E0))
  {
    _MergedGlobals_27 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD874E0);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)_MergedGlobals_27);
  v5 = (id)_MergedGlobals_27;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "updateToLatest(flowFile:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "updateToLatest(flowFile:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __28__IEUpdater_updateToLatest___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'updateToLatest(flowFile:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)_MergedGlobals_27;
  v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "updateToLatest(flowFile:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)isUpdateAvailable:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD874F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD874F0))
  {
    qword_26AD874E8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD874F0);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)qword_26AD874E8);
  v5 = (id)qword_26AD874E8;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "isUpdateAvailable(version:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "isUpdateAvailable(version:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __31__IEUpdater_isUpdateAvailable___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'isUpdateAvailable(version:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD874E8;
  v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "isUpdateAvailable(version:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)getHighestVersionWithinRelease:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD87500, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD87500))
  {
    qword_26AD874F8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD87500);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)qword_26AD874F8);
  v5 = (id)qword_26AD874F8;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "highestVersionWithinRelease(version:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "highestVersionWithinRelease(version:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __44__IEUpdater_getHighestVersionWithinRelease___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'highestVersionWithinRelease(version:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD874F8;
  v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "highestVersionWithinRelease(version:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

@end