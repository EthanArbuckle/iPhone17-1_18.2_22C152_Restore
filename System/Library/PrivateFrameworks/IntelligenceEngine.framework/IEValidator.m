@interface IEValidator
- (id)validate:(id)a3;
- (id)validate:(id)a3 srcFilename:(id)a4;
@end

@implementation IEValidator

- (id)validate:(id)a3
{
  v3 = [(IEValidator *)self validate:a3 srcFilename:&stru_26ED2AF50];

  return v3;
}

- (id)validate:(id)a3 srcFilename:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86DE0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86DE0))
  {
    _MergedGlobals_19 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86DE0);
  }
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)_MergedGlobals_19);
  v8 = (id)_MergedGlobals_19;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "validate(filename:srcFilename:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "validate(filename:srcFilename:)");
  siri::intelligence::Timer::Timer(&v12);
}

void __36__IEValidator_validate_srcFilename___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'validate(filename:srcFilename:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)_MergedGlobals_19;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "validate(filename:srcFilename:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

@end