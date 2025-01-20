@interface IMNicknameProvider
- (BOOL)hasObservedTransitionForHandleID:(id)a3;
- (BOOL)haveNicknamesLoaded;
- (IMNicknameProvider)init;
- (id)allNicknamesForContact:(id)a3;
- (id)currentNicknameForContact:(id)a3;
- (id)nicknameForContact:(id)a3;
- (id)nicknameForHandleID:(id)a3;
- (id)pendingNicknameForContact:(id)a3;
- (id)unknownSenderRecordInfoFor:(id)a3;
- (void)bannerActionTapped:(id)a3 IMNicknameBannerAction:(unint64_t)a4;
- (void)markTransitionAsObservedForHandleID:(id)a3 isAutoUpdate:(BOOL)a4;
- (void)nicknameForCurrentUserWithCompletionHandler:(id)a3;
- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4;
- (void)sendPersonalNicknameToHandleID:(id)a3;
- (void)sendPersonalNicknameToHandleID:(id)a3 fromHandleID:(id)a4;
- (void)setNicknameListener:(id)a3;
- (void)setPersonalNicknameWithContact:(id)a3;
- (void)updatePendingNicknameWithContact:(id)a3;
@end

@implementation IMNicknameProvider

- (IMNicknameProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMNicknameProvider;
  v2 = [(IMNicknameProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IMNicknameProvider_Impl);
    swiftImpl = v2->_swiftImpl;
    v2->_swiftImpl = v3;
  }
  return v2;
}

- (BOOL)haveNicknamesLoaded
{
  return ((uint64_t (*)(IMNicknameProvider_Impl *, char *))MEMORY[0x1F4181798])(self->_swiftImpl, sel_haveNicknamesLoaded);
}

- (void)nicknameForCurrentUserWithCompletionHandler:(id)a3
{
}

- (id)nicknameForHandleID:(id)a3
{
  return (id)((uint64_t (*)(IMNicknameProvider_Impl *, char *, id))MEMORY[0x1F4181798])(self->_swiftImpl, sel_nicknameForHandleID_, a3);
}

- (id)nicknameForContact:(id)a3
{
  return (id)((uint64_t (*)(IMNicknameProvider_Impl *, char *, id))MEMORY[0x1F4181798])(self->_swiftImpl, sel_nicknameForContact_, a3);
}

- (id)pendingNicknameForContact:(id)a3
{
  return (id)((uint64_t (*)(IMNicknameProvider_Impl *, char *, id))MEMORY[0x1F4181798])(self->_swiftImpl, sel_pendingNicknameForContact_, a3);
}

- (id)currentNicknameForContact:(id)a3
{
  return (id)((uint64_t (*)(IMNicknameProvider_Impl *, char *, id))MEMORY[0x1F4181798])(self->_swiftImpl, sel_currentNicknameForContact_, a3);
}

- (id)allNicknamesForContact:(id)a3
{
  return (id)((uint64_t (*)(IMNicknameProvider_Impl *, char *, id))MEMORY[0x1F4181798])(self->_swiftImpl, sel_allNicknamesForContact_, a3);
}

- (void)updatePendingNicknameWithContact:(id)a3
{
}

- (void)setPersonalNicknameWithContact:(id)a3
{
}

- (void)setNicknameListener:(id)a3
{
}

- (void)sendPersonalNicknameToHandleID:(id)a3
{
}

- (void)sendPersonalNicknameToHandleID:(id)a3 fromHandleID:(id)a4
{
}

- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4
{
}

- (BOOL)hasObservedTransitionForHandleID:(id)a3
{
  return objc_msgSend_hasObservedTransitionForHandleID_(self->_swiftImpl, a2, (uint64_t)a3, v3);
}

- (void)markTransitionAsObservedForHandleID:(id)a3 isAutoUpdate:(BOOL)a4
{
}

- (id)unknownSenderRecordInfoFor:(id)a3
{
  return (id)((uint64_t (*)(IMNicknameProvider_Impl *, char *, id))MEMORY[0x1F4181798])(self->_swiftImpl, sel_unknownSenderRecordInfoFor_, a3);
}

- (void)bannerActionTapped:(id)a3 IMNicknameBannerAction:(unint64_t)a4
{
}

- (void).cxx_destruct
{
}

@end