@interface ATXMailSenderImportanceModel
- (id)calculateSenderImportanceForMailWithContextRequest:(id)a3 contactStore:(id)a4 contactRelationships:(id)a5;
@end

@implementation ATXMailSenderImportanceModel

- (id)calculateSenderImportanceForMailWithContextRequest:(id)a3 contactStore:(id)a4 contactRelationships:(id)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = [v7 mailMessage];
  v79 = [v11 sender];
  uint64_t v12 = +[ATXSenderImportanceUtils contactFromHandle:contactStore:](ATXSenderImportanceUtils, "contactFromHandle:contactStore:");
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  v80 = (void *)v12;
  if (v12)
  {
    v18 = (void *)v12;
    v77 = v11;
    v19 = [v9 cnContactIdsOfFavoriteContacts];
    v20 = [v18 identifier];
    unsigned int v21 = [v19 containsObject:v20];

    v22 = [v9 cnContactIdsOfEmergencyContacts];
    v23 = [v18 identifier];
    unsigned int v24 = [v22 containsObject:v23];

    v25 = [v9 cnContactIdsOfICloudFamilyMembers];
    v26 = [v18 identifier];
    unsigned int v27 = [v25 containsObject:v26];

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v28 = [v18 emailAddresses];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v81 objects:v85 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      unsigned int v71 = v27;
      unsigned int v72 = v24;
      unsigned int v73 = v21;
      id v74 = v8;
      id v75 = v7;
      char v31 = 0;
      uint64_t v32 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v82 != v32) {
            objc_enumerationMutation(v28);
          }
          v34 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          v35 = [v9 vipContactEmailAddresses];
          v36 = [v34 value];
          int v37 = [v35 containsObject:v36];

          if (v37) {
            char v31 = 1;
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v81 objects:v85 count:16];
      }
      while (v30);
      double v14 = (double)(v31 & 1);
      id v8 = v74;
      id v7 = v75;
      unsigned int v24 = v72;
      unsigned int v21 = v73;
      unsigned int v27 = v71;
    }

    double v17 = (double)v21;
    double v16 = (double)v24;
    double v15 = (double)v27;
    v11 = v77;
  }
  v38 = [v7 contextRequestSignals];
  v39 = [v38 entityID];
  v40 = [v11 mailID];
  int v41 = [v39 isEqualToString:v40];

  if (!v41)
  {
    unsigned int v43 = 0;
    v45 = v80;
    goto LABEL_21;
  }
  v42 = [v38 isFromMailingList];
  unsigned int v43 = [v42 BOOLValue];

  v44 = [v38 isFromPinnedMessage];
  if ([v44 BOOLValue])
  {

    v45 = v80;
LABEL_19:
    double v13 = 1.0;
    goto LABEL_21;
  }
  v78 = v11;
  v45 = v80;
  uint64_t v46 = [v80 identifier];
  if (v46)
  {
    v47 = (void *)v46;
    v48 = [v9 cnContactIdsOfPinnedChatsInMessage];
    v49 = [v80 identifier];
    int v76 = [v48 containsObject:v49];

    v45 = v80;
    v11 = v78;
    if (!v76) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }

LABEL_21:
  [v10 isFavoriteContact];
  double v51 = v17 * v50;
  [v10 isEmergencyContact];
  double v53 = v16 * v52;
  [v10 isiCloudFamilyMember];
  double v55 = v15 * v54;
  [v10 isVIP];
  double v57 = v14 * v56;
  [v10 isFromMailingList];
  double v59 = v58 * (double)v43;
  [v10 isContactChatPinnedInMessage];
  double v61 = v13 * v60;
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v63 = [NSNumber numberWithDouble:v51];
  [v62 setObject:v63 forKeyedSubscript:@"isFavorite"];

  v64 = [NSNumber numberWithDouble:v53];
  [v62 setObject:v64 forKeyedSubscript:@"isEmergency"];

  v65 = [NSNumber numberWithDouble:v55];
  [v62 setObject:v65 forKeyedSubscript:@"isFamily"];

  v66 = [NSNumber numberWithDouble:v57];
  [v62 setObject:v66 forKeyedSubscript:@"isVIP"];

  v67 = [NSNumber numberWithDouble:v59];
  [v62 setObject:v67 forKeyedSubscript:@"isFromMailingList"];

  v68 = [NSNumber numberWithDouble:v61];
  [v62 setObject:v68 forKeyedSubscript:@"isFromPinnedContactInMessage"];

  v69 = [[ATXSenderImportance alloc] initWithSenderImportanceScore:v62 featureDictionary:fmin(fmax(v51 + v53 + v55 + v57 + v59 + v61 + 0.0, 0.0), 1.0)];
  return v69;
}

@end