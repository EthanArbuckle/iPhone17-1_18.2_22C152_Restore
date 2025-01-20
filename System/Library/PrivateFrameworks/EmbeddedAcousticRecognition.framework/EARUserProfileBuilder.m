@interface EARUserProfileBuilder
@end

@implementation EARUserProfileBuilder

void __145___EARUserProfileBuilder_initWithConfiguration_language_overrides_textNormalizationModelRoot_sdapiOverrides_emptyVoc_pgVoc_paramsetHolder_isJit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v5)
  {
    objc_msgSend(v5, "ear_toString");
    if (v7)
    {
LABEL_3:
      objc_msgSend(v7, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    uint64_t v11 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  memset(&__p, 0, sizeof(__p));
LABEL_6:
  quasar::LmeDataFactory::AddConfigOverride(v8, (unsigned __int8 *)v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(v10[0]);
  }
}

uint64_t __86___EARUserProfileBuilder_writeProfileToFile_protectionClass_coordinated_length_error___block_invoke(uint64_t a1)
{
  uint64_t result = quasar::filesystem::writeFileAlmostAtomic((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), a1 + 48, (unsigned __int8 *)(a1 + 72), *(_DWORD *)(a1 + 96));
  v3 = *(uint64_t **)(a1 + 104);
  if (v3 && (result & 0x8000000000000000) == 0) {
    uint64_t *v3 = result;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result >= 0;
  return result;
}

uint64_t __86___EARUserProfileBuilder_writeProfileToFile_protectionClass_coordinated_length_error___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __100___EARUserProfileBuilder__logSpeechProfileUpdatedEventWithLmeData_sizeInBytes_numEnumeratedEntries___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __84___EARUserProfileBuilder__logLmeSlotUpdatedEventsWithLanguage_numEnumeratedEntries___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end