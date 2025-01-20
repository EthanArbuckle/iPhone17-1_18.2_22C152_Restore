@interface CKMenuBarManager
+ (id)sharedInstance;
- (BOOL)shouldConfigureAttributedTextStyleTitles;
- (BOOL)shouldForceFilterImageReload;
- (NSArray)filterCommands;
- (NSDictionary)filterImagesByFilterMode;
- (id)allKeyboardShortcutKeyCommands;
- (void)setFilterCommands:(id)a3;
- (void)setFilterImagesByFilterMode:(id)a3;
- (void)setShouldConfigureAttributedTextStyleTitles:(BOOL)a3;
- (void)setShouldForceFilterImageReload:(BOOL)a3;
@end

@implementation CKMenuBarManager

- (id)allKeyboardShortcutKeyCommands
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439F0] modifierFlags:0 action:NSSelectorFromString(&cfstr_Escbuttonpress.isa)];
  [v3 addObject:v4];

  v5 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"]" modifierFlags:0x100000 action:NSSelectorFromString(&cfstr_Keycommandnext.isa)];
  [v3 addObject:v5];

  v6 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"[" modifierFlags:0x100000 action:NSSelectorFromString(&cfstr_Keycommandprev.isa)];
  [v3 addObject:v6];

  v7 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"}" modifierFlags:0x100000 action:NSSelectorFromString(&cfstr_Keycommandnext.isa)];
  [v3 addObject:v7];

  v8 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"{" modifierFlags:0x100000 action:NSSelectorFromString(&cfstr_Keycommandprev.isa)];
  [v3 addObject:v8];

  v9 = +[CKUIBehavior sharedBehaviors];
  unint64_t v10 = [v9 maximumNumberOfPinnedConversations];

  if (v10 >= 9) {
    uint64_t v11 = 9;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v11)
  {
    uint64_t v12 = 0;
    do
    {
      ++v12;
      v13 = (void *)MEMORY[0x1E4F42AF8];
      v14 = [NSNumber numberWithInteger:v12];
      v15 = [v14 stringValue];
      v16 = [v13 keyCommandWithInput:v15 modifierFlags:0x100000 action:NSSelectorFromString(&cfstr_Keycommandsele.isa)];
      [v3 addObject:v16];
    }
    while (v11 != v12);
  }
  v17 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"1" modifierFlags:1179648 action:NSSelectorFromString(&cfstr_Keycommandsele_0.isa)];
  [v3 addObject:v17];

  v18 = [(CKMenuBarManager *)self filterCommands];
  [v3 addObjectsFromArray:v18];

  v19 = (void *)MEMORY[0x1E4F42AF8];
  SEL v20 = NSSelectorFromString(&cfstr_Keycommandcomp.isa);
  v21 = CKFrameworkBundle();
  v22 = [v21 localizedStringForKey:@"NEW_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v23 = [v19 keyCommandWithInput:@"N" modifierFlags:0x100000 action:v20 upAction:0 discoverabilityTitle:v22];
  [v3 addObject:v23];

  v24 = [MEMORY[0x1E4F6E778] sharedInstance];
  LODWORD(v20) = [v24 isExpressiveTextEnabled];

  if (v20) {
    uint64_t v25 = 1572864;
  }
  else {
    uint64_t v25 = 0x100000;
  }
  v26 = (void *)MEMORY[0x1E4F42AF8];
  SEL v27 = NSSelectorFromString(&cfstr_Keycommandtogg.isa);
  v28 = CKFrameworkBundle();
  v29 = [v28 localizedStringForKey:@"SHOW_DETAILS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v30 = [v26 keyCommandWithInput:@"I" modifierFlags:v25 action:v27 upAction:0 discoverabilityTitle:v29];
  [v3 addObject:v30];

  v31 = (void *)MEMORY[0x1E4F42AF8];
  SEL v32 = NSSelectorFromString(&cfstr_Keycommandfind.isa);
  v33 = CKFrameworkBundle();
  v34 = [v33 localizedStringForKey:@"FIND_ELLIPSIS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v35 = [v31 keyCommandWithInput:@"F" modifierFlags:0x100000 action:v32 upAction:0 discoverabilityTitle:v34];
  [v3 addObject:v35];

  v36 = (void *)MEMORY[0x1E4F42AF8];
  SEL v37 = NSSelectorFromString(&cfstr_Keycommandnext.isa);
  v38 = CKFrameworkBundle();
  v39 = [v38 localizedStringForKey:@"NEXT_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v40 = [v36 keyCommandWithInput:@"\t" modifierFlags:0x40000 action:v37 upAction:0 discoverabilityTitle:v39];

  [v40 setWantsPriorityOverSystemBehavior:1];
  [v3 addObject:v40];
  v41 = (void *)MEMORY[0x1E4F42AF8];
  SEL v42 = NSSelectorFromString(&cfstr_Keycommandprev.isa);
  v43 = CKFrameworkBundle();
  v44 = [v43 localizedStringForKey:@"PREVIOUS_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v45 = [v41 keyCommandWithInput:@"\t" modifierFlags:393216 action:v42 upAction:0 discoverabilityTitle:v44];

  [v45 setWantsPriorityOverSystemBehavior:1];
  [v3 addObject:v45];
  v46 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LOBYTE(v41) = [v46 isExpressiveTextEnabled];

  if (v41)
  {
    v47 = +[CKTextEffectsMenuFactory effectKeyCommandsWithAction:NSSelectorFromString(&cfstr_Keycommandappl.isa)];
    [v3 addObjectsFromArray:v47];
    v48 = +[CKTextEffectsMenuFactory textStyleKeyCommandsWithAction:NSSelectorFromString(&cfstr_Keycommandappl_0.isa) configureImages:0 configureAttributedTitles:0 activeTextStyles:0 selectedText:&stru_1EDE4CA38];
    [v3 addObjectsFromArray:v48];
  }
  v49 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v50 = [v49 isInternalInstall];

  if (v50)
  {
    v51 = objc_msgSend(MEMORY[0x1E4F42AF8], "ck_debugMenuWithAction:", NSSelectorFromString(&cfstr_Showdebugmenu.isa));
    [v3 addObject:v51];
  }

  return v3;
}

- (NSArray)filterCommands
{
  return self->_filterCommands;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)sharedInstance_sInstance;

  return v2;
}

void __34__CKMenuBarManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKMenuBarManager);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;
}

- (void)setFilterCommands:(id)a3
{
}

- (NSDictionary)filterImagesByFilterMode
{
  return self->_filterImagesByFilterMode;
}

- (void)setFilterImagesByFilterMode:(id)a3
{
}

- (BOOL)shouldForceFilterImageReload
{
  return self->_shouldForceFilterImageReload;
}

- (void)setShouldForceFilterImageReload:(BOOL)a3
{
  self->_shouldForceFilterImageReload = a3;
}

- (BOOL)shouldConfigureAttributedTextStyleTitles
{
  return self->_shouldConfigureAttributedTextStyleTitles;
}

- (void)setShouldConfigureAttributedTextStyleTitles:(BOOL)a3
{
  self->_shouldConfigureAttributedTextStyleTitles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterImagesByFilterMode, 0);

  objc_storeStrong((id *)&self->_filterCommands, 0);
}

@end