@interface WFPlaylistPickerParameter
+ (BOOL)hasPlaylistAccess;
+ (id)referencedActionResourceClasses;
- (BOOL)generatingNotifications;
- (BOOL)showLibrary;
- (Class)singleStateClass;
- (NSArray)possibleStates;
- (WFAppleMusicAccessResource)appleMusicAccessResource;
- (WFPlaylistPickerParameter)initWithDefinition:(id)a3;
- (WFPlaylistSubstitutableState)entireLibraryState;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (void)authorizationStatusDidChange;
- (void)possibleStatesDidChange;
- (void)setActionResources:(id)a3;
- (void)setAppleMusicAccessResource:(id)a3;
- (void)setEntireLibraryState:(id)a3;
- (void)setGeneratingNotifications:(BOOL)a3;
- (void)updateChangeNotificationRegistration;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
@end

@implementation WFPlaylistPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicAccessResource, 0);
  objc_storeStrong((id *)&self->_entireLibraryState, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (WFAppleMusicAccessResource)appleMusicAccessResource
{
  return self->_appleMusicAccessResource;
}

- (void)setGeneratingNotifications:(BOOL)a3
{
  self->_generatingNotifications = a3;
}

- (BOOL)generatingNotifications
{
  return self->_generatingNotifications;
}

- (void)setEntireLibraryState:(id)a3
{
}

- (WFPlaylistSubstitutableState)entireLibraryState
{
  return self->_entireLibraryState;
}

- (BOOL)showLibrary
{
  return self->_showLibrary;
}

- (id)defaultSerializedRepresentation
{
  if ([(WFPlaylistPickerParameter *)self showLibrary])
  {
    v3 = [(WFPlaylistPickerParameter *)self entireLibraryState];
    v4 = [v3 serializedRepresentation];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFPlaylistPickerParameter;
    v4 = [(WFPlaylistPickerParameter *)&v6 defaultSerializedRepresentation];
  }
  return v4;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3 = a3;
  v4 = [v3 value];
  int v5 = [v4 entireMusicLibrary];

  if (v5)
  {
    objc_super v6 = WFLocalizedString(@"My Music Library");
  }
  else
  {
    v7 = [v3 value];
    objc_super v6 = [v7 playlistName];
  }
  return v6;
}

- (NSArray)possibleStates
{
  if (!self->_possibleStates && [(id)objc_opt_class() hasPlaylistAccess])
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    id v3 = (void *)getMPMediaQueryClass_softClass_14388;
    uint64_t v17 = getMPMediaQueryClass_softClass_14388;
    if (!getMPMediaQueryClass_softClass_14388)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __getMPMediaQueryClass_block_invoke_14389;
      v13[3] = &unk_264E5EC88;
      v13[4] = &v14;
      __getMPMediaQueryClass_block_invoke_14389((uint64_t)v13);
      id v3 = (void *)v15[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v14, 8);
    int v5 = [v4 playlistsQuery];
    objc_super v6 = [v5 collections];
    v7 = objc_msgSend(v6, "if_compactMap:", &__block_literal_global_14390);
    v8 = (NSArray *)[v7 mutableCopy];

    if ([(WFPlaylistPickerParameter *)self showLibrary])
    {
      v9 = [(WFPlaylistPickerParameter *)self entireLibraryState];
      [(NSArray *)v8 insertObject:v9 atIndex:0];
    }
    possibleStates = self->_possibleStates;
    self->_possibleStates = v8;
  }
  v11 = self->_possibleStates;
  return v11;
}

WFPlaylistSubstitutableState *__43__WFPlaylistPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v3 = (void *)getMPMediaPlaylistClass_softClass;
  uint64_t v11 = getMPMediaPlaylistClass_softClass;
  if (!getMPMediaPlaylistClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getMPMediaPlaylistClass_block_invoke;
    v7[3] = &unk_264E5EC88;
    v7[4] = &v8;
    __getMPMediaPlaylistClass_block_invoke((uint64_t)v7);
    id v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = [[WFPlaylistSubstitutableState alloc] initWithPlaylist:v2];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (void)possibleStatesDidChange
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFPlaylistPickerParameter;
  [(WFPlaylistPickerParameter *)&v4 possibleStatesDidChange];
}

- (void)updateChangeNotificationRegistration
{
  uint64_t v3 = [(WFPlaylistPickerParameter *)self isInsideWorkflow];
  BOOL v4 = [(WFPlaylistPickerParameter *)self generatingNotifications];
  if (v3)
  {
    if (v4 || ![(id)objc_opt_class() hasPlaylistAccess]) {
      return;
    }
    id v5 = [getMPMediaLibraryClass_14415() defaultMediaLibrary];
    [v5 beginGeneratingLibraryChangeNotifications];
  }
  else
  {
    if (!v4) {
      return;
    }
    id v5 = [getMPMediaLibraryClass_14415() defaultMediaLibrary];
    [v5 endGeneratingLibraryChangeNotifications];
  }
  [(WFPlaylistPickerParameter *)self setGeneratingNotifications:v3];
}

- (void)authorizationStatusDidChange
{
  [(WFPlaylistPickerParameter *)self possibleStatesDidChange];
  [(WFPlaylistPickerParameter *)self updateChangeNotificationRegistration];
}

- (void)wasRemovedFromWorkflow
{
  v5.receiver = self;
  v5.super_class = (Class)WFPlaylistPickerParameter;
  [(WFPlaylistPickerParameter *)&v5 wasRemovedFromWorkflow];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  BOOL v4 = getMPMediaLibraryDidChangeNotification();
  [v3 removeObserver:self name:v4 object:0];

  [(WFPlaylistPickerParameter *)self updateChangeNotificationRegistration];
}

- (void)wasAddedToWorkflow
{
  v5.receiver = self;
  v5.super_class = (Class)WFPlaylistPickerParameter;
  [(WFPlaylistPickerParameter *)&v5 wasAddedToWorkflow];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  BOOL v4 = getMPMediaLibraryDidChangeNotification();
  [v3 addObserver:self selector:sel_possibleStatesDidChange name:v4 object:0];

  [(WFPlaylistPickerParameter *)self updateChangeNotificationRegistration];
}

- (void)setAppleMusicAccessResource:(id)a3
{
  id v9 = a3;
  p_appleMusicAccessResource = &self->_appleMusicAccessResource;
  objc_super v6 = (void *)MEMORY[0x263F873F0];
  if (self->_appleMusicAccessResource)
  {
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self name:*v6 object:*p_appleMusicAccessResource];
  }
  objc_storeStrong((id *)&self->_appleMusicAccessResource, a3);
  if (*p_appleMusicAccessResource)
  {
    uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_authorizationStatusDidChange name:*v6 object:*p_appleMusicAccessResource];
  }
}

- (void)setActionResources:(id)a3
{
  id v6 = [a3 anyObject];
  uint64_t v4 = objc_opt_class();
  objc_super v5 = WFEnforceClass(v6, v4);
  [(WFPlaylistPickerParameter *)self setAppleMusicAccessResource:v5];
}

- (WFPlaylistPickerParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFPlaylistPickerParameter;
  objc_super v5 = [(WFPlaylistPickerParameter *)&v15 initWithDefinition:v4];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"ShowLibrary"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
    v5->_showLibrary = [v8 BOOLValue];

    id v9 = [WFPlaylistSubstitutableState alloc];
    uint64_t v10 = [[WFPlaylistDescriptor alloc] initWithEntireMusicLibrary];
    uint64_t v11 = [(WFVariableSubstitutableParameterState *)v9 initWithValue:v10];
    entireLibraryState = v5->_entireLibraryState;
    v5->_entireLibraryState = (WFPlaylistSubstitutableState *)v11;

    v13 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

+ (id)referencedActionResourceClasses
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

+ (BOOL)hasPlaylistAccess
{
  return [getMPMediaLibraryClass_14415() authorizationStatus] == 3;
}

@end