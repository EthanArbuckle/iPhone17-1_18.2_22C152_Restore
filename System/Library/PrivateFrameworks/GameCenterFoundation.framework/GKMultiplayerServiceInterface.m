@interface GKMultiplayerServiceInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKMultiplayerServiceInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EAF3B8;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v24 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v24 setClasses:v5 forSelector:sel_getCompatibilityMatrix_handler_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v24 setClasses:v8 forSelector:sel_removePlayersFromGameInviteV2_handler_ argumentIndex:0 ofReply:0];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v24 setClasses:v11 forSelector:sel_getPlayersToInviteWithHandlerV2_ argumentIndex:0 ofReply:1];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v24 setClasses:v14 forSelector:sel_putMultiPlayerGroup_participants_playedAt_bundleID_numberOfAutomatched_handler_ argumentIndex:0 ofReply:0];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  [v24 setClasses:v17 forSelector:sel_putMultiPlayerGroup_participants_playedAt_bundleID_numberOfAutomatched_handler_ argumentIndex:1 ofReply:0];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v24 setClasses:v20 forSelector:sel_putMultiPlayerGroup_participants_playedAt_bundleID_numberOfAutomatched_handler_ argumentIndex:3 ofReply:0];

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v24 setClasses:v23 forSelector:sel_getMultiPlayerGroups_ argumentIndex:0 ofReply:1];

  [v24 setClass:objc_opt_class() forSelector:sel_fileMultiplayerTTRWithCallBackIdentifier_descriptionAddition_handler_ argumentIndex:0 ofReply:0];
  [v24 setClass:objc_opt_class() forSelector:sel_fileMultiplayerTTRWithCallBackIdentifier_descriptionAddition_handler_ argumentIndex:1 ofReply:0];
  [v24 setClass:objc_opt_class() forSelector:sel_uploadLogsForRadar_from_handler_ argumentIndex:0 ofReply:0];
  [v24 setClass:objc_opt_class() forSelector:sel_uploadLogsForRadar_from_handler_ argumentIndex:1 ofReply:0];
}

@end