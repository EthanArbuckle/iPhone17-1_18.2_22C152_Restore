@interface IEExporter
- (BOOL)exportFile:(id)a3 withExportFile:(id)a4 withFormat:(unint64_t)a5 withOptions:(id)a6;
@end

@implementation IEExporter

- (BOOL)exportFile:(id)a3 withExportFile:(id)a4 withFormat:(unint64_t)a5 withOptions:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD87470, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD87470))
  {
    _MergedGlobals_24 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD87470);
  }
  os_signpost_id_t v11 = os_signpost_id_generate((os_log_t)_MergedGlobals_24);
  v12 = (id)_MergedGlobals_24;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "exportFile(flowFile:exportFile:format:options:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "exportFile(flowFile:exportFile:format:options:)");
  siri::intelligence::Timer::Timer(&v16);
}

void __63__IEExporter_exportFile_withExportFile_withFormat_withOptions___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'exportFile(flowFile:exportFile:format:options:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)_MergedGlobals_24;
  v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "exportFile(flowFile:exportFile:format:options:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

@end