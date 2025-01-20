@interface INVocabulary
+ (INVocabulary)sharedVocabulary;
- (INVocabulary)init;
- (void)_THROW_EXCEPTION_FOR_PROCESS_MISSING_ENTITLEMENT_com_apple_developer_siri;
- (void)removeAllVocabularyStrings;
- (void)setVocabulary:(NSOrderedSet *)vocabulary ofType:(INVocabularyStringType)type;
- (void)setVocabularyStrings:(NSOrderedSet *)vocabulary ofType:(INVocabularyStringType)type;
@end

@implementation INVocabulary

uint64_t __32__INVocabulary_sharedVocabulary__block_invoke(uint64_t a1)
{
  sharedVocabulary_sharedVocabulary = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (INVocabulary)init
{
  if (INThisProcessHasEntitlement(@"com.apple.developer.siri", 1))
  {
    v5.receiver = self;
    v5.super_class = (Class)INVocabulary;
    self = [(INVocabulary *)&v5 init];
    v3 = self;
  }
  else
  {
    [(INVocabulary *)self _THROW_EXCEPTION_FOR_PROCESS_MISSING_ENTITLEMENT_com_apple_developer_siri];
    v3 = 0;
  }

  return v3;
}

- (void)removeAllVocabularyStrings
{
  id v2 = +[_INVocabulary sharedVocabulary];
  [v2 removeAllVocabularyStrings];
}

- (void)setVocabularyStrings:(NSOrderedSet *)vocabulary ofType:(INVocabularyStringType)type
{
  objc_super v5 = vocabulary;
  id v6 = +[_INVocabulary sharedVocabulary];
  [v6 setVocabularyStrings:v5 ofType:type];
}

void __45___INVocabulary_setVocabularyStrings_ofType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) validateVocabularyType:*(void *)(a1 + 48)];
  +[_INAggregator logReceivedCount:ofVocabularyStringType:](_INAggregator, "logReceivedCount:ofVocabularyStringType:", [*(id *)(a1 + 40) count], *(void *)(a1 + 48));
  id v2 = [*(id *)(a1 + 32) _validator];
  id v3 = [v2 validatedItemsFromVocabularyStrings:*(void *)(a1 + 40) ofType:*(void *)(a1 + 48) loggingWarnings:1];

  [*(id *)(a1 + 32) setValidatedVocabulary:v3 ofType:*(void *)(a1 + 48)];
}

uint64_t __33___INVocabulary_sharedVocabulary__block_invoke(uint64_t a1)
{
  sharedVocabulary_sSharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

void __58___INVocabulary_setValidatedVocabulary_ofType_onBehalfOf___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __58___INVocabulary_setValidatedVocabulary_ofType_onBehalfOf___block_invoke_2;
    v3[3] = &unk_1E551C558;
    objc_copyWeak(v4, (id *)(a1 + 32));
    v4[1] = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v3);
    objc_destroyWeak(v4);
  }
}

uint64_t __43___INVocabulary_removeAllVocabularyStrings__block_invoke()
{
  v0 = objc_opt_class();

  return [v0 clearAllCustomVocabulary];
}

+ (INVocabulary)sharedVocabulary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__INVocabulary_sharedVocabulary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedVocabulary_onceToken != -1) {
    dispatch_once(&sharedVocabulary_onceToken, block);
  }
  id v2 = (void *)sharedVocabulary_sharedVocabulary;

  return (INVocabulary *)v2;
}

- (void)_THROW_EXCEPTION_FOR_PROCESS_MISSING_ENTITLEMENT_com_apple_developer_siri
{
  [NSString stringWithFormat:@"Use of the class %@ requires the entitlement %@. Make sure you have enabled the Siri capability in your Xcode project.", objc_opt_class(), @"com.apple.developer.siri"];
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v2);
}

uint64_t __54___INVocabulary_removeAllVocabularyStringsOnBehalfOf___block_invoke(uint64_t a1)
{
  id v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 clearAllCustomVocabularyOnBehalfOf:v3];
}

void __50___INVocabulary__setVocabulary_ofType_onBehalfOf___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) validateVocabularyType:*(void *)(a1 + 56)];
  +[_INAggregator logReceivedCount:ofVocabularyStringType:](_INAggregator, "logReceivedCount:ofVocabularyStringType:", [*(id *)(a1 + 40) count], *(void *)(a1 + 56));
  id v2 = [*(id *)(a1 + 32) _validator];
  id v3 = [v2 validatedItemsFromVocabularySpeakables:*(void *)(a1 + 40) ofType:*(void *)(a1 + 56) loggingWarnings:1];

  [*(id *)(a1 + 32) setValidatedVocabulary:v3 ofType:*(void *)(a1 + 56) onBehalfOf:*(void *)(a1 + 48)];
}

void __58___INVocabulary_setValidatedVocabulary_ofType_onBehalfOf___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = _INStringFromVocabularyStringType(*(void *)(a1 + 40));
  objc_msgSend(WeakRetained, "_THROW_EXCEPTION_FOR_ATTEMPT_TO_PROVIDE_VOCABULARY_OF_TYPE_THAT_APP_DOES_NOT_HANDLE_:", v2);
}

void __47___INVocabulary_supportedVocabularyStringTypes__block_invoke()
{
  v2[20] = *MEMORY[0x1E4F143B8];
  v2[0] = @"ContactNameType";
  v2[1] = @"ContactGroupNameType";
  v2[2] = @"PhotoTagsType";
  v2[3] = @"PhotoAlbumNameType";
  v2[4] = @"PhotoMemoryNameType";
  v2[5] = @"HealthActivityNameType";
  v2[6] = @"CarProfileNameType";
  v2[7] = @"CarNameType";
  v2[8] = @"PaymentsOrganizationNameType";
  v2[9] = @"PaymentsAccountNicknameType";
  v2[10] = @"NotebookItemTitleType";
  v2[11] = @"NotebookItemGroupNameType";
  v2[12] = @"VoiceCommandNameType";
  v2[13] = @"AutoShortcutNameType";
  v2[14] = @"PlaylistTitleType";
  v2[15] = @"MusicArtistNameType";
  v2[16] = @"AudiobookTitleType";
  v2[17] = @"AudiobookAuthorNameType";
  v2[18] = @"ShowTitleType";
  v2[19] = @"MediaUserContextType";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:20];
  v1 = (void *)supportedVocabularyStringTypes_stAllTypes;
  supportedVocabularyStringTypes_stAllTypes = v0;
}

- (void)setVocabulary:(NSOrderedSet *)vocabulary ofType:(INVocabularyStringType)type
{
  objc_super v5 = vocabulary;
  id v6 = +[_INVocabulary sharedVocabulary];
  [v6 setVocabulary:v5 ofType:type];
}

@end