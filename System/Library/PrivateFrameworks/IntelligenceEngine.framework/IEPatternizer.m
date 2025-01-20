@interface IEPatternizer
- (BOOL)generateCATs:(id)a3 noOverwrite:(BOOL)a4 deleteText:(BOOL)a5 userParamTypes:(id)a6;
- (BOOL)generatePatterns:(id)a3 noOverwrite:(BOOL)a4 deleteText:(BOOL)a5 userParamTypes:(id)a6;
- (BOOL)updateCATMetadata:(id)a3 withMeta:(id)a4;
@end

@implementation IEPatternizer

- (BOOL)generatePatterns:(id)a3 noOverwrite:(BOOL)a4 deleteText:(BOOL)a5 userParamTypes:(id)a6
{
  id v7 = a3;
  id v8 = a6;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD869C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD869C0))
  {
    _MergedGlobals_11 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD869C0);
  }
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)_MergedGlobals_11);
  v10 = (id)_MergedGlobals_11;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "generatePatterns(flowFile:noOverwrite:deleteText:userParamTypes:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "generatePatterns(flowFile:noOverwrite:deleteText:userParamTypes:)");
  siri::intelligence::Timer::Timer(&v14);
}

void __72__IEPatternizer_generatePatterns_noOverwrite_deleteText_userParamTypes___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'generatePatterns(flowFile:noOverwrite:deleteText:userParamTypes:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)_MergedGlobals_11;
  v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "generatePatterns(flowFile:noOverwrite:deleteText:userParamTypes:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)generateCATs:(id)a3 noOverwrite:(BOOL)a4 deleteText:(BOOL)a5 userParamTypes:(id)a6
{
  id v7 = a3;
  id v8 = a6;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD869D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD869D0))
  {
    qword_26AD869C8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD869D0);
  }
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)qword_26AD869C8);
  v10 = (id)qword_26AD869C8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "generateCATs(flowFile:noOverwrite:deleteText:userParamTypes:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "generateCATs(flowFile:noOverwrite:deleteText:userParamTypes:)");
  siri::intelligence::Timer::Timer(&v14);
}

void __68__IEPatternizer_generateCATs_noOverwrite_deleteText_userParamTypes___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'generateCATs(flowFile:noOverwrite:deleteText:userParamTypes:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_26AD869C8;
  v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "generateCATs(flowFile:noOverwrite:deleteText:userParamTypes:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)updateCATMetadata:(id)a3 withMeta:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD869E0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD869E0))
  {
    qword_26AD869D8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD869E0);
  }
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)qword_26AD869D8);
  id v8 = (id)qword_26AD869D8;
  os_signpost_id_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "updateCATMetadata(flowFile:meta:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "updateCATMetadata(flowFile:meta:)");
  siri::intelligence::Timer::Timer(&v12);
}

void __44__IEPatternizer_updateCATMetadata_withMeta___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'updateCATMetadata(flowFile:meta:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_26AD869D8;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "updateCATMetadata(flowFile:meta:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

@end