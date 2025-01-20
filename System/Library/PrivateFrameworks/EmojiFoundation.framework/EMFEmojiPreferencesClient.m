@interface EMFEmojiPreferencesClient
+ (id)serviceInterface;
- (BOOL)isValid;
- (EMFEmojiPreferencesClient)initWithMachName:(id)a3;
- (NSString)machName;
- (id)_initWithoutConnection;
- (id)copySortedEmojis:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5;
- (void)_disconnect;
- (void)createConnectionIfNecessary;
- (void)dealloc;
- (void)didDisplaySkinToneHelp;
- (void)didUseEmoji:(id)a3;
- (void)didUseEmoji:(id)a3 usageMode:(id)a4;
- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5;
- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5 replacementContext:(id)a6;
- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9;
- (void)didUseEmojiInCharacterPickerExtended:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5;
- (void)didUseEmojiInCharacterPickerLightweight:(id)a3 replacementContext:(id)a4;
- (void)didUseEmojiInCharacterPickerPopover:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5;
- (void)didUseEmojiInDFRBar:(id)a3 replacementContext:(id)a4;
- (void)didUseEmojiInDictation:(id)a3 replacementContext:(id)a4;
- (void)didUseEmojiInEmojiKeyboardPalette:(id)a3 wasFromRecentsSection:(BOOL)a4;
- (void)didUseEmojiInEmojiKeyboardSearch:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5;
- (void)didUseEmojiInHandwriting:(id)a3 replacementContext:(id)a4;
- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 candidatePosition:(id)a4 replacementContext:(id)a5;
- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 replacementContext:(id)a4;
- (void)didViewEmojiIndex:(int64_t)a3 forCategory:(id)a4;
- (void)setIsValid:(BOOL)a3;
- (void)setMachName:(id)a3;
@end

@implementation EMFEmojiPreferencesClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (EMFEmojiPreferencesClient)initWithMachName:(id)a3
{
  v4 = (__CFString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)EMFEmojiPreferencesClient;
  v5 = [(EMFEmojiPreferences *)&v8 init];
  v6 = v5;
  if (v5)
  {
    if (!v4) {
      v4 = @"com.apple.TextInput.emoji";
    }
    objc_storeStrong((id *)&v5->_machName, v4);
    v6->_isValid = 0;
    [(EMFEmojiPreferencesClient *)v6 createConnectionIfNecessary];
  }

  return v6;
}

- (void)createConnectionIfNecessary
{
  if (!self->_isValid)
  {
    [(NSXPCConnection *)self->_connection invalidate];
    connection = self->_connection;
    self->_connection = 0;

    self->_isValid = 1;
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:self->_machName options:4096];
    v5 = self->_connection;
    self->_connection = v4;

    v6 = +[EMFEmojiPreferencesClient serviceInterface];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    v7 = self->_connection;
    if (_emojiClientDispatchQueue(void)::onceToken != -1) {
      dispatch_once(&_emojiClientDispatchQueue(void)::onceToken, &__block_literal_global_338);
    }
    [(NSXPCConnection *)v7 _setQueue:_emojiClientDispatchQueue(void)::__xpc_queue];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__EMFEmojiPreferencesClient_createConnectionIfNecessary__block_invoke;
    v10[3] = &unk_1E61A9D60;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__EMFEmojiPreferencesClient_createConnectionIfNecessary__block_invoke_2;
    v8[3] = &unk_1E61A9D60;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v8];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  machName = self->_machName;
  self->_machName = 0;

  if (self->_isValid)
  {
    [(NSXPCConnection *)self->_connection invalidate];
    connection = self->_connection;
    self->_connection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)EMFEmojiPreferencesClient;
  [(EMFEmojiPreferences *)&v5 dealloc];
}

+ (id)serviceInterface
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F128B6E8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  objc_super v5 = [v3 setWithArray:v4];

  [v2 setClasses:v5 forSelector:sel_sortedEmojis_keyword_localeIdentifier_handler_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v5 forSelector:sel_sortedEmojis_keyword_localeIdentifier_handler_ argumentIndex:0 ofReply:1];

  return v2;
}

void __56__EMFEmojiPreferencesClient_createConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsValid:0];
}

- (id)_initWithoutConnection
{
  v6.receiver = self;
  v6.super_class = (Class)EMFEmojiPreferencesClient;
  v2 = [(EMFEmojiPreferences *)&v6 init];
  v3 = v2;
  if (v2)
  {
    machName = v2->_machName;
    v2->_machName = (NSString *)@"com.apple.TextInput.emoji";

    v3->_isValid = 0;
  }
  return v3;
}

- (void)_disconnect
{
  obj = self;
  objc_sync_enter(obj);
  [(NSXPCConnection *)obj->_connection invalidate];
  connection = obj->_connection;
  obj->_connection = 0;

  obj->_isValid = 0;
  objc_sync_exit(obj);
}

void __56__EMFEmojiPreferencesClient_createConnectionIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsValid:0];
}

- (void)didUseEmoji:(id)a3
{
}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4
{
}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5
{
}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5 replacementContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  objc_sync_enter(v14);
  v15 = v14;
  [v15 createConnectionIfNecessary];
  v16 = [v15[11] remoteObjectProxy];
  [v16 didUseEmoji:v10 usageMode:v11 typingName:v12 replacementContext:v13];

  v17.receiver = v15;
  v17.super_class = (Class)EMFEmojiPreferencesClient;
  [(EMFEmojiPreferences *)&v17 didUseEmoji:v10 usageMode:v11 typingName:v12];

  objc_sync_exit(v15);
}

- (void)didViewEmojiIndex:(int64_t)a3 forCategory:(id)a4
{
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_super v8 = v7;
  [v8 createConnectionIfNecessary];
  id v9 = [v8[11] remoteObjectProxy];
  [v9 didViewEmojiIndex:a3 forCategory:v6];

  v10.receiver = v8;
  v10.super_class = (Class)EMFEmojiPreferencesClient;
  [(EMFEmojiPreferences *)&v10 didViewEmojiIndex:a3 forCategory:v6];

  objc_sync_exit(v8);
}

- (void)didDisplaySkinToneHelp
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2;
  [v3 createConnectionIfNecessary];
  v4 = [v3[11] remoteObjectProxy];
  [v4 didDisplaySkinToneHelp];

  v5.receiver = v3;
  v5.super_class = (Class)EMFEmojiPreferencesClient;
  [(EMFEmojiPreferences *)&v5 didDisplaySkinToneHelp];

  objc_sync_exit(v3);
}

- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = self;
  objc_sync_enter(v20);
  v21 = v20;
  [v21 createConnectionIfNecessary];
  v22 = [v21[11] remoteObjectProxy];
  LOBYTE(v23) = a9;
  [v22 didUseEmoji:v15 usageSource:a4 replacementContext:v16 searchQuery:v17 resultPosition:v18 numberSearchQueriesRun:v19 wasPositiveEngagement:v23];

  objc_sync_exit(v21);
  v24.receiver = v21;
  v24.super_class = (Class)EMFEmojiPreferencesClient;
  [(EMFEmojiPreferences *)&v24 didUseEmoji:v15 usageMode:0];
}

- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 replacementContext:(id)a4
{
  LOBYTE(v4) = 1;
  [(EMFEmojiPreferencesClient *)self didUseEmoji:a3 usageSource:4 replacementContext:a4 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v4];
}

- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 candidatePosition:(id)a4 replacementContext:(id)a5
{
  LOBYTE(v5) = 1;
  [(EMFEmojiPreferencesClient *)self didUseEmoji:a3 usageSource:4 replacementContext:a5 searchQuery:0 resultPosition:a4 numberSearchQueriesRun:0 wasPositiveEngagement:v5];
}

- (void)didUseEmojiInDictation:(id)a3 replacementContext:(id)a4
{
  LOBYTE(v4) = 1;
  [(EMFEmojiPreferencesClient *)self didUseEmoji:a3 usageSource:6 replacementContext:a4 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v4];
}

- (void)didUseEmojiInHandwriting:(id)a3 replacementContext:(id)a4
{
  LOBYTE(v4) = 1;
  [(EMFEmojiPreferencesClient *)self didUseEmoji:a3 usageSource:5 replacementContext:a4 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v4];
}

- (void)didUseEmojiInDFRBar:(id)a3 replacementContext:(id)a4
{
  LOBYTE(v4) = 1;
  [(EMFEmojiPreferencesClient *)self didUseEmoji:a3 usageSource:10 replacementContext:a4 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v4];
}

- (void)didUseEmojiInCharacterPickerLightweight:(id)a3 replacementContext:(id)a4
{
  LOBYTE(v4) = 1;
  [(EMFEmojiPreferencesClient *)self didUseEmoji:a3 usageSource:7 replacementContext:a4 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v4];
}

- (void)didUseEmojiInCharacterPickerPopover:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  LOBYTE(v5) = 1;
  [(EMFEmojiPreferencesClient *)self didUseEmoji:a3 usageSource:8 replacementContext:0 searchQuery:a4 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v5];
}

- (void)didUseEmojiInCharacterPickerExtended:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  LOBYTE(v5) = 1;
  [(EMFEmojiPreferencesClient *)self didUseEmoji:a3 usageSource:9 replacementContext:0 searchQuery:a4 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v5];
}

- (void)didUseEmojiInEmojiKeyboardPalette:(id)a3 wasFromRecentsSection:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  LOBYTE(v5) = 1;
  [(EMFEmojiPreferencesClient *)self didUseEmoji:a3 usageSource:v4 replacementContext:0 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v5];
}

- (void)didUseEmojiInEmojiKeyboardSearch:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  LOBYTE(v5) = 1;
  [(EMFEmojiPreferencesClient *)self didUseEmoji:a3 usageSource:3 replacementContext:0 searchQuery:a4 resultPosition:a5 numberSearchQueriesRun:0 wasPositiveEngagement:v5];
}

- (id)copySortedEmojis:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  objc_super v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  id v11 = self;
  objc_sync_enter(v11);
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  id v13 = v11;
  [v13 createConnectionIfNecessary];
  v14 = [v13[11] remoteObjectProxy];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__EMFEmojiPreferencesClient_copySortedEmojis_keyword_localeIdentifier___block_invoke;
  v20[3] = &unk_1E61A9D88;
  v22 = &v23;
  id v15 = v12;
  v21 = v15;
  [v14 sortedEmojis:v8 keyword:v9 localeIdentifier:v10 handler:v20];

  dispatch_time_t v16 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v15, v16);

  objc_sync_exit(v13);
  id v17 = (void *)v24[5];
  if (!v17) {
    id v17 = v8;
  }
  id v18 = v17;
  _Block_object_dispose(&v23, 8);

  return v18;
}

void __71__EMFEmojiPreferencesClient_copySortedEmojis_keyword_localeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)machName
{
  return self->_machName;
}

- (void)setMachName:(id)a3
{
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

@end