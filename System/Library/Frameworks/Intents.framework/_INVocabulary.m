@interface _INVocabulary
+ (id)sharedVocabulary;
+ (id)supportedVocabularyStringTypes;
+ (void)enumerateVocabularyUsingBlock:(id)a3;
- (_INVocabulary)init;
- (id)_validator;
- (void)_THROW_EXCEPTION_FOR_ATTEMPT_TO_PROVIDE_VOCABULARY_OF_TYPE_THAT_APP_DOES_NOT_HANDLE_:(id)a3;
- (void)_THROW_EXCEPTION_FOR_INVALID_VOCABULARY_TYPE_;
- (void)_setVocabulary:(id)a3 ofType:(int64_t)a4 onBehalfOf:(id)a5;
- (void)removeAllVocabularyStrings;
- (void)removeAllVocabularyStringsOnBehalfOf:(id)a3;
- (void)setValidatedVocabulary:(id)a3 ofType:(int64_t)a4;
- (void)setValidatedVocabulary:(id)a3 ofType:(int64_t)a4 onBehalfOf:(id)a5;
- (void)setVocabulary:(id)a3 ofType:(int64_t)a4;
- (void)setVocabularyStrings:(id)a3 ofType:(int64_t)a4;
- (void)validateVocabularyType:(int64_t)a3;
@end

@implementation _INVocabulary

+ (id)sharedVocabulary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33___INVocabulary_sharedVocabulary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedVocabulary_onceToken_190 != -1) {
    dispatch_once(&sharedVocabulary_onceToken_190, block);
  }
  v2 = (void *)sharedVocabulary_sSharedInstance;

  return v2;
}

- (void)setVocabularyStrings:(id)a3 ofType:(int64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___INVocabulary_setVocabularyStrings_ofType___block_invoke;
  block[3] = &unk_1E551C5A8;
  id v10 = v6;
  int64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)removeAllVocabularyStrings
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___INVocabulary_removeAllVocabularyStrings__block_invoke;
  block[3] = &unk_1E55208F8;
  block[4] = self;
  dispatch_async(queue, block);
}

+ (id)supportedVocabularyStringTypes
{
  if (supportedVocabularyStringTypes_onceToken != -1) {
    dispatch_once(&supportedVocabularyStringTypes_onceToken, &__block_literal_global_92201);
  }
  v2 = (void *)supportedVocabularyStringTypes_stAllTypes;

  return v2;
}

- (void)validateVocabularyType:(int64_t)a3
{
  v4 = _INSyncSlotFromVocabularyStringType(a3);

  if (!v4)
  {
    [(_INVocabulary *)self _THROW_EXCEPTION_FOR_INVALID_VOCABULARY_TYPE];
  }
}

- (void)setValidatedVocabulary:(id)a3 ofType:(int64_t)a4 onBehalfOf:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _INSyncSlotFromVocabularyStringType(a4);
  objc_initWeak(&location, self);
  vocabularyUpdater = self->_vocabularyUpdater;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58___INVocabulary_setValidatedVocabulary_ofType_onBehalfOf___block_invoke;
  v12[3] = &unk_1E551C580;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a4;
  [(INVocabularyUpdater *)vocabularyUpdater setValidatedVocabulary:v8 forIntentSlot:v10 onBehalfOf:v9 validationCompletion:v12];
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)setValidatedVocabulary:(id)a3 ofType:(int64_t)a4
{
}

- (id)_validator
{
  validator = self->_validator;
  if (!validator)
  {
    v4 = objc_alloc_init(_INVocabularyValidator);
    v5 = self->_validator;
    self->_validator = v4;

    validator = self->_validator;
  }

  return validator;
}

- (_INVocabulary)init
{
  v9.receiver = self;
  v9.super_class = (Class)_INVocabulary;
  v2 = [(_INVocabulary *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[INVocabularyUpdater _sharedAppInstance];
    vocabularyUpdater = v2->_vocabularyUpdater;
    v2->_vocabularyUpdater = (INVocabularyUpdater *)v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.intents._INVocabulary.internal-queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_validator, 0);

  objc_storeStrong((id *)&self->_vocabularyUpdater, 0);
}

- (void)removeAllVocabularyStringsOnBehalfOf:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54___INVocabulary_removeAllVocabularyStringsOnBehalfOf___block_invoke;
  v7[3] = &unk_1E551F790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setVocabulary:(id)a3 ofType:(int64_t)a4
{
}

- (void)_setVocabulary:(id)a3 ofType:(int64_t)a4 onBehalfOf:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __50___INVocabulary__setVocabulary_ofType_onBehalfOf___block_invoke;
  v13[3] = &unk_1E551C5D0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)_THROW_EXCEPTION_FOR_ATTEMPT_TO_PROVIDE_VOCABULARY_OF_TYPE_THAT_APP_DOES_NOT_HANDLE_:(id)a3
{
  id v5 = a3;
  uint64_t v3 = [NSString stringWithFormat:@"Illegal attempt to provide vocabulary of type %@ by an app that does not handle any intents that could use that type of vocabulary", v5];
  if (INIsInternalInstall_onceToken != -1) {
    dispatch_once(&INIsInternalInstall_onceToken, &__block_literal_global_226);
  }
  if (INIsInternalInstall_isInternal)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v3 userInfo:0];
    objc_exception_throw(v4);
  }
  NSLog((NSString *)@"ERROR: %@", v3);
}

- (void)_THROW_EXCEPTION_FOR_INVALID_VOCABULARY_TYPE_
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"-[INVocabulary setVocabularyStrings:ofType:] was given an invalid type" userInfo:0];
  objc_exception_throw(v2);
}

+ (void)enumerateVocabularyUsingBlock:(id)a3
{
}

@end