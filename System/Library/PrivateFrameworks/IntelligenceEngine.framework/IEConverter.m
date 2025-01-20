@interface IEConverter
- (BOOL)convertFile:(id)a3 withFormat:(unint64_t)a4;
@end

@implementation IEConverter

- (BOOL)convertFile:(id)a3 withFormat:(unint64_t)a4
{
  id v4 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD867D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD867D8))
  {
    _MergedGlobals_6 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD867D8);
  }
  os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)_MergedGlobals_6);
  v6 = (id)_MergedGlobals_6;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "convertFile(flowFile:format:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "convertFile(flowFile:format:)");
  siri::intelligence::Timer::Timer(&v10);
}

void __38__IEConverter_convertFile_withFormat___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'convertFile(flowFile:format:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  id v4 = (id)_MergedGlobals_6;
  os_signpost_id_t v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "convertFile(flowFile:format:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

@end