@interface GKProfileServicePrivateInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKProfileServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EB3100;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  v5 = objc_msgSend(v3, "setWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v5 forSelector:sel_getGameCenterRelationshipsForContact_shouldRefresh_completionHandler_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v4 setClasses:v8 forSelector:sel_getGameCenterRelationshipsForContact_shouldRefresh_completionHandler_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v4 setClasses:v11 forSelector:sel_getContactAssociationIDsForContacts_shouldRefresh_completionHandler_ argumentIndex:0 ofReply:0];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  [v4 setClasses:v15 forSelector:sel_getContactAssociationIDsForContacts_shouldRefresh_completionHandler_ argumentIndex:0 ofReply:1];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [v4 setClasses:v18 forSelector:sel_getContactsForContactAssociationIDs_completionHandler_ argumentIndex:0 ofReply:0];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  [v4 setClasses:v22 forSelector:sel_getContactsForContactAssociationIDs_completionHandler_ argumentIndex:0 ofReply:1];

  v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v25 forSelector:sel_getProfilesForPlayerIDs_fetchOptions_handler_ argumentIndex:0 ofReply:1];
}

@end