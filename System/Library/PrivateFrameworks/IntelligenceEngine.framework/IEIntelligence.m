@interface IEIntelligence
- (BOOL)hasActiveFallback;
- (BOOL)isActive;
- (BOOL)load:(id)a3;
- (BOOL)load:(id)a3 withFlowId:(id)a4;
- (BOOL)load:(id)a3 withId:(id)a4;
- (BOOL)loadFromString:(id)a3;
- (BOOL)setVariable:(id)a3 withValue:(id)a4;
- (BOOL)willHandleDirectInvocation:(id)a3;
- (BOOL)willHandleEvent:(id)a3;
- (IEIntelligence)init;
- (NSString)mFlowId;
- (id)activeEvents;
- (id)activeLocalEvents;
- (id)find:(id)a3 withId:(id)a4;
- (id)findInTemplateDir:(id)a3 withId:(id)a4;
- (id)flowId;
- (id)getActiveEventsWithScope:(int)a3;
- (id)getBuildVersion;
- (id)getChangedPersistentVariables;
- (id)getConditions;
- (id)getEvents;
- (id)getExitValue;
- (id)getFormatVersion;
- (id)getInputGroup:(id)a3;
- (id)getMetadata:(id)a3;
- (id)getRemainingResponses;
- (id)getUndo;
- (id)getVariables;
- (id)goTo:(id)a3;
- (id)processActivity:(id)a3;
- (id)processDirectInvocation:(id)a3;
- (id)processEvent:(id)a3;
- (id)processText:(id)a3;
- (id)processText:(id)a3 withMode:(unint64_t)a4 withFallback:(unint64_t)a5;
- (id)setExtensions:;
- (id)startConversation;
- (uint64_t)setExtensions:;
- (void)dealloc;
- (void)mIntelligence;
- (void)setExtensions:;
- (void)setExtensions:(id)a3;
- (void)setMFlowId:(id)a3;
- (void)setMIntelligence:(void *)a3;
@end

@implementation IEIntelligence

- (IEIntelligence)init
{
  if ((ModuleInitialization(void)::sModuleInitialized & 1) == 0)
  {
    ModuleInitialization(void)::sModuleInitialized = 1;
    siri::intelligence::Utils::SetRandomNumberGeneratorSeed((siri::intelligence::Utils *)self);
  }
  v4.receiver = self;
  v4.super_class = (Class)IEIntelligence;
  if ([(IEIntelligence *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mIntelligence = self->mIntelligence;
  if (mIntelligence)
  {
    objc_super v4 = (std::__shared_weak_count *)*((void *)mIntelligence + 1);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    MEMORY[0x23ECAACC0](mIntelligence, 0x20C40A4A59CD2);
  }
  v5.receiver = self;
  v5.super_class = (Class)IEIntelligence;
  [(IEIntelligence *)&v5 dealloc];
}

- (BOOL)load:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86418, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86418))
  {
    _MergedGlobals_1 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86418);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)_MergedGlobals_1);
  objc_super v5 = (id)_MergedGlobals_1;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "load(filename:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "load(filename:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __23__IEIntelligence_load___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'load(filename:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)_MergedGlobals_1;
  objc_super v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "load(filename:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)load:(id)a3 withFlowId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86428, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86428))
  {
    qword_26AD86420 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86428);
  }
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)qword_26AD86420);
  v8 = (id)qword_26AD86420;
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "load(templateDir:flowId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "load(templateDir:flowId:)");
  siri::intelligence::Timer::Timer(&v12);
}

void __34__IEIntelligence_load_withFlowId___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'load(templateDir:flowId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86420;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "load(templateDir:flowId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)load:(id)a3 withId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86438, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86438))
  {
    qword_26AD86430 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86438);
  }
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)qword_26AD86430);
  v8 = (id)qword_26AD86430;
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "load(bundle:flowId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "load(bundle:flowId:)");
  siri::intelligence::Timer::Timer(&v12);
}

void __30__IEIntelligence_load_withId___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'load(bundle:flowId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86430;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "load(bundle:flowId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)loadFromString:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86448, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86448))
  {
    qword_26AD86440 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86448);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)qword_26AD86440);
  id v5 = (id)qword_26AD86440;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "load(string:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "load(string:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __33__IEIntelligence_loadFromString___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'load(string:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86440;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "load(string:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)flowId
{
  return self->mFlowId;
}

- (id)find:(id)a3 withId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86458, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86458))
  {
    qword_26AD86450 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86458);
  }
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)qword_26AD86450);
  v8 = (id)qword_26AD86450;
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "find(bundle:flowId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "find(bundle:flowId:)");
  siri::intelligence::Timer::Timer(&v12);
}

void __30__IEIntelligence_find_withId___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'find(bundle:flowId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86450;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "find(bundle:flowId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)findInTemplateDir:(id)a3 withId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86468, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86468))
  {
    qword_26AD86460 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86468);
  }
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)qword_26AD86460);
  v8 = (id)qword_26AD86460;
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "find(templateDir:flowId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "find(templateDir:flowId:)");
  siri::intelligence::Timer::Timer(&v12);
}

void __43__IEIntelligence_findInTemplateDir_withId___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'find(templateDir:flowId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86460;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "find(templateDir:flowId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)startConversation
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86478, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86478))
  {
    qword_26AD86470 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86478);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)qword_26AD86470);
  id v3 = (id)qword_26AD86470;
  os_signpost_id_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "start()", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "start()");
  siri::intelligence::Timer::Timer(&v7);
}

void __35__IEIntelligence_startConversation__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'start()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86470;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "start()", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)processEvent:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86488, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86488))
  {
    qword_26AD86480 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86488);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)qword_26AD86480);
  id v5 = (id)qword_26AD86480;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "process(event:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "process(event:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __31__IEIntelligence_processEvent___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'process(event:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86480;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "process(event:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)processText:(id)a3 withMode:(unint64_t)a4 withFallback:(unint64_t)a5
{
  id v5 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86498, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86498))
  {
    qword_26AD86490 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86498);
  }
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)qword_26AD86490);
  uint64_t v7 = (id)qword_26AD86490;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "process(text:mode:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "process(text:mode:)");
  siri::intelligence::Timer::Timer(&v11);
}

void __52__IEIntelligence_processText_withMode_withFallback___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'process(text:mode:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86490;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "process(text:mode:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)processText:(id)a3
{
  id v3 = [(IEIntelligence *)self processText:a3 withMode:1 withFallback:0];

  return v3;
}

- (id)processActivity:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD864A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD864A8))
  {
    qword_26AD864A0 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD864A8);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)qword_26AD864A0);
  id v5 = (id)qword_26AD864A0;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "process(activityId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "process(activityId:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __34__IEIntelligence_processActivity___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'process(activityId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD864A0;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "process(activityId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)getRemainingResponses
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD864B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD864B8))
  {
    qword_26AD864B0 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD864B8);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)qword_26AD864B0);
  id v3 = (id)qword_26AD864B0;
  os_signpost_id_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "remainingResponses()", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "remainingResponses()");
  siri::intelligence::Timer::Timer(&v7);
}

void __39__IEIntelligence_getRemainingResponses__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'remainingResponses()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD864B0;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "remainingResponses()", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)goTo:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD864C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD864C8))
  {
    qword_26AD864C0 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD864C8);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)qword_26AD864C0);
  id v5 = (id)qword_26AD864C0;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "goTo(responseId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "goTo(responseId:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __23__IEIntelligence_goTo___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'goTo(responseId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD864C0;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "goTo(responseId:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)willHandleEvent:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD864D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD864D8))
  {
    qword_26AD864D0 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD864D8);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)qword_26AD864D0);
  id v5 = (id)qword_26AD864D0;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "willHandle(event:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "willHandle(event:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __34__IEIntelligence_willHandleEvent___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'willHandle(event:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD864D0;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "willHandle(event:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)getEvents
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD864E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD864E8))
  {
    qword_26AD864E0 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD864E8);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)qword_26AD864E0);
  id v3 = (id)qword_26AD864E0;
  os_signpost_id_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "events()", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "events()");
  siri::intelligence::Timer::Timer(&v7);
}

void __27__IEIntelligence_getEvents__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'events()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD864E0;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "events()", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)getActiveEventsWithScope:(int)a3
{
  id v5 = objc_opt_new();
  if ([(IEIntelligence *)self isActive])
  {
    siri::intelligence::Intelligence::GetActiveIntents((siri::intelligence::Intelligence::Impl **)self->mIntelligence, a3, &v13);
    uint64_t v6 = v13;
    for (uint64_t i = v14; v6 != i; v6 += 16)
    {
      uint64_t v11 = *(siri::intelligence::Intent **)v6;
      v8 = *(std::__shared_weak_count **)(v6 + 8);
      uint64_t v12 = v8;
      if (v8) {
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v9 = IE_IntentToIEEvent(&v11);
      objc_msgSend(v5, "addObject:", v9, v11);

      if (v12) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }
    }
    v15 = (void **)&v13;
    std::vector<std::shared_ptr<siri::intelligence::Variable>>::__destroy_vector::operator()[abi:ne180100](&v15);
  }

  return v5;
}

- (id)activeEvents
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD864F8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD864F8))
  {
    qword_26AD864F0 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD864F8);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)qword_26AD864F0);
  id v3 = (id)qword_26AD864F0;
  os_signpost_id_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "activeEvents()", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "activeEvents()");
  siri::intelligence::Timer::Timer(&v7);
}

void __30__IEIntelligence_activeEvents__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'activeEvents()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD864F0;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "activeEvents()", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)activeLocalEvents
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86508, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86508))
  {
    qword_26AD86500 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86508);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)qword_26AD86500);
  id v3 = (id)qword_26AD86500;
  os_signpost_id_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "activeLocalEvents()", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "activeLocalEvents()");
  siri::intelligence::Timer::Timer(&v7);
}

void __35__IEIntelligence_activeLocalEvents__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'activeLocalEvents()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86500;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "activeLocalEvents()", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)hasActiveFallback
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86518, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86518))
  {
    qword_26AD86510 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86518);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)qword_26AD86510);
  id v3 = (id)qword_26AD86510;
  os_signpost_id_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "hasActiveFallback()", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "hasActiveFallback()");
  siri::intelligence::Timer::Timer(&v7);
}

void __35__IEIntelligence_hasActiveFallback__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'hasActiveFallback()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86510;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "hasActiveFallback()", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)willHandleDirectInvocation:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86528, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86528))
  {
    qword_26AD86520 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86528);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)qword_26AD86520);
  id v5 = (id)qword_26AD86520;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "willHandle(invocation:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "willHandle(invocation:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __45__IEIntelligence_willHandleDirectInvocation___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'willHandle(invocation:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86520;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "willHandle(invocation:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)processDirectInvocation:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86538, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86538))
  {
    qword_26AD86530 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86538);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)qword_26AD86530);
  id v5 = (id)qword_26AD86530;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "process(invocation:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "process(invocation:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __42__IEIntelligence_processDirectInvocation___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'process(invocation:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86530;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "process(invocation:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)getInputGroup:(id)a3
{
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86548, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86548))
  {
    qword_26AD86540 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86548);
  }
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)qword_26AD86540);
  id v5 = (id)qword_26AD86540;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "inputGroup(id:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "inputGroup(id:)");
  siri::intelligence::Timer::Timer(&v9);
}

void __32__IEIntelligence_getInputGroup___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'inputGroup(id:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86540;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "inputGroup(id:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)isActive
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86558, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86558))
  {
    qword_26AD86550 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86558);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)qword_26AD86550);
  id v3 = (id)qword_26AD86550;
  os_signpost_id_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "isActive()", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "isActive()");
  siri::intelligence::Timer::Timer(&v7);
}

void __26__IEIntelligence_isActive__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'isActive()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86550;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "isActive()", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)getVariables
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86568, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86568))
  {
    qword_26AD86560 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86568);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)qword_26AD86560);
  id v3 = (id)qword_26AD86560;
  os_signpost_id_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "variables()", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "variables()");
  siri::intelligence::Timer::Timer(&v7);
}

void __30__IEIntelligence_getVariables__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'variables()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86560;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "variables()", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (BOOL)setVariable:(id)a3 withValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86578, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86578))
  {
    qword_26AD86570 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86578);
  }
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)qword_26AD86570);
  v8 = (id)qword_26AD86570;
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "setVariable(name:value:)", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "setVariable(name:value:)");
  siri::intelligence::Timer::Timer(&v12);
}

void __40__IEIntelligence_setVariable_withValue___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'setVariable(name:value:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86570;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "setVariable(name:value:)", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)getChangedPersistentVariables
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86588, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86588))
  {
    qword_26AD86580 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86588);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)qword_26AD86580);
  id v3 = (id)qword_26AD86580;
  os_signpost_id_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "changedPersistentVariables()", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "changedPersistentVariables()");
  siri::intelligence::Timer::Timer(&v7);
}

void __47__IEIntelligence_getChangedPersistentVariables__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'changedPersistentVariables()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86580;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "changedPersistentVariables()", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)getConditions
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD86598, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD86598))
  {
    qword_26AD86590 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD86598);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)qword_26AD86590);
  id v3 = (id)qword_26AD86590;
  os_signpost_id_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)__p = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "conditions()", (const char *)&unk_239BED0CB, __p, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(__p, "conditions()");
  siri::intelligence::Timer::Timer(&v7);
}

void __31__IEIntelligence_getConditions__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'conditions()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD86590;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "conditions()", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)getExitValue
{
  v7[18] = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD865A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AD865A8))
  {
    qword_26AD865A0 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_26AD865A8);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)qword_26AD865A0);
  id v3 = (id)qword_26AD865A0;
  os_signpost_id_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "exitValue()", (const char *)&unk_239BED0CB, buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "exitValue()");
  siri::intelligence::Timer::Timer(v7);
}

void __30__IEIntelligence_getExitValue__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'exitValue()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((void *)a1 + 5) + 24)) * 10000.0);
  os_signpost_id_t v4 = (id)qword_26AD865A0;
  id v5 = v4;
  os_signpost_id_t v6 = *((void *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239A02000, v5, OS_SIGNPOST_INTERVAL_END, v6, "exitValue()", (const char *)&unk_239BED0CB, buf, 2u);
  }
}

- (id)getUndo
{
  mIntelligence = (uint64_t *)self->mIntelligence;
  if (mIntelligence)
  {
    uint64_t v3 = *mIntelligence;
    id v5 = *(long long **)(v3 + 216);
    os_signpost_id_t v4 = *(std::__shared_weak_count **)(v3 + 224);
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v5)
    {
      os_signpost_id_t v6 = objc_opt_new();
      uint64_t v7 = NSString;
      if (*((char *)v5 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v17, *(const std::string::value_type **)v5, *((void *)v5 + 1));
      }
      else
      {
        long long v8 = *v5;
        v17.__r_.__value_.__r.__words[2] = *((void *)v5 + 2);
        *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v8;
      }
      if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v9 = &v17;
      }
      else {
        uint64_t v9 = (std::string *)v17.__r_.__value_.__r.__words[0];
      }
      v10 = [v7 stringWithUTF8String:v9];
      [v6 setIdentifier:v10];

      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v17.__r_.__value_.__l.__data_);
      }
      uint64_t v12 = *((void *)v5 + 3);
      uint64_t v11 = (std::__shared_weak_count *)*((void *)v5 + 4);
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v15 = v12;
      v16 = v11;
      uint64_t v13 = IE_VariableToNSObject((uint64_t)&v15);
      [v6 setUserData:v13];

      if (v16) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v16);
      }
    }
    else
    {
      os_signpost_id_t v6 = 0;
    }
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  else
  {
    os_signpost_id_t v6 = 0;
  }

  return v6;
}

- (void)setExtensions:(id)a3
{
  v11[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->mIntelligence)
  {
    id v5 = (std::__shared_weak_count *)operator new(0x38uLL);
    v5->__shared_owners_ = 0;
    v5->__shared_weak_owners_ = 0;
    v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_26ED271D0;
    os_signpost_id_t v6 = &v5[1].__vftable;
    v5[2].__vftable = 0;
    std::__function::__value_func<std::string ()(std::string const&,std::shared_ptr<siri::intelligence::VariableDictionary>)>::operator=[abi:ne180100](&v5[1].__vftable);
    if (v4)
    {
      uint64_t v7 = [v4 directInvocationBuilder];

      if (v7)
      {
        v11[0] = &unk_26ED27220;
        v11[1] = v4;
        v11[3] = v11;
        std::function<std::string ()(std::string const&,std::shared_ptr<siri::intelligence::VariableDictionary>)>::operator=(v6, (uint64_t)v11);
        std::__function::__value_func<std::string ()(std::string const&,std::shared_ptr<siri::intelligence::VariableDictionary>)>::~__value_func[abi:ne180100](v11);
      }
    }
    mIntelligence = (uint64_t *)self->mIntelligence;
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v9 = *mIntelligence;
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    v10 = *(std::__shared_weak_count **)(v9 + 240);
    *(void *)(v9 + 232) = v6;
    *(void *)(v9 + 240) = v5;
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

- (id)getBuildVersion
{
  return (id)[NSString stringWithUTF8String:"3402.2.2"];
}

- (id)getFormatVersion
{
  return (id)[NSString stringWithUTF8String:"2.0.8"];
}

- (id)getMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)self->mIntelligence;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  siri::intelligence::FlowGraph::GetMetaData((void *)(v5 + 8), (const void **)__p, &v12);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v7 = &v12;
  }
  else {
    uint64_t v7 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  long long v8 = [NSString stringWithUTF8String:v7];
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }

  return v8;
}

- (void)mIntelligence
{
  return self->mIntelligence;
}

- (void)setMIntelligence:(void *)a3
{
  self->mIntelligence = a3;
}

- (NSString)mFlowId
{
  return self->mFlowId;
}

- (void)setMFlowId:(id)a3
{
}

- (void).cxx_destruct
{
}

- (uint64_t)setExtensions:
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)setExtensions:
{
}

- (id)setExtensions:
{
  *a2 = &unk_26ED27220;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

@end