@interface RegisterDailyANECompilationActivity
@end

@implementation RegisterDailyANECompilationActivity

void ___RegisterDailyANECompilationActivity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a3;
  +[CoreEmbeddedSpeechRecognizer compileAllAssetsWithType:3 completion:&__block_literal_global_306];
  v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "_RegisterDailyANECompilationActivity_block_invoke_2";
    _os_log_debug_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Done triggering daily ANE compilation", (uint8_t *)&v5, 0xCu);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3) {
LABEL_3:
  }
    v3[2](v3);
LABEL_4:
}

uint64_t ___RegisterDailyANECompilationActivity_block_invoke_3()
{
  +[CoreEmbeddedSpeechRecognizer compileAllAssetsWithType:7 completion:0];

  return +[CoreEmbeddedSpeechAnalyzer resetCache];
}

void ___RegisterDailyANECompilationActivity_block_invoke(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_object_t v2 = xpc_activity_copy_criteria(activity);
  if (!v2)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], 1);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14340], 1);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14138], 1);
    xpc_activity_set_criteria(activity, v3);
  }
}

@end