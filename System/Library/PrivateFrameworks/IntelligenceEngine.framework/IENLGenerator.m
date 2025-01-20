@interface IENLGenerator
- (BOOL)fromCATI:(id)a3 withOutputFile:(id)a4;
- (BOOL)fromCATI:(id)a3 withOutputFile:(id)a4 withCATIManifest:(id)a5 withEnsemble:(id)a6;
@end

@implementation IENLGenerator

- (BOOL)fromCATI:(id)a3 withOutputFile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86798, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86798))
  {
    _MergedGlobals_4 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86798);
  }
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)_MergedGlobals_4);
  v8 = (id)_MergedGlobals_4;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "fromCATI(flowFile:outputFile:ensemble:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "fromCATI(flowFile:outputFile:ensemble:)");
  siri::intelligence::Timer::Timer(&v12);
}

void __41__IENLGenerator_fromCATI_withOutputFile___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'fromCATI(flowFile:outputFile:ensemble:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)_MergedGlobals_4;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "fromCATI(flowFile:outputFile:ensemble:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)fromCATI:(id)a3 withOutputFile:(id)a4 withCATIManifest:(id)a5 withEnsemble:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD867A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD867A8))
  {
    qword_26AD867A0 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD867A8);
  }
  os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)qword_26AD867A0);
  v14 = (id)qword_26AD867A0;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "fromCATI(flowFile:outputFile:manifestFile:ensemble:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "fromCATI(flowFile:outputFile:manifestFile:ensemble:)");
  siri::intelligence::Timer::Timer(&v18);
}

void __71__IENLGenerator_fromCATI_withOutputFile_withCATIManifest_withEnsemble___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'fromCATI(flowFile:outputFile:manifestFile:ensemble:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_26AD867A0;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "fromCATI(flowFile:outputFile:manifestFile:ensemble:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

@end