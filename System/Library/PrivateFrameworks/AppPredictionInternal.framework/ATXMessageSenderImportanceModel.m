@interface ATXMessageSenderImportanceModel
- (id)calculateSenderImportanceForMessageWithContextRequest:(id)a3 contactStore:(id)a4 contactRelationships:(id)a5;
@end

@implementation ATXMessageSenderImportanceModel

- (id)calculateSenderImportanceForMessageWithContextRequest:(id)a3 contactStore:(id)a4 contactRelationships:(id)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = [v7 textMessage];
  v12 = [v11 sender];
  v13 = +[ATXSenderImportanceUtils contactFromHandle:v12 contactStore:v8];
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  double v18 = 0.0;
  v83 = v8;
  v84 = v13;
  if (v13)
  {
    v80 = v11;
    v19 = [v9 cnContactIdsOfFavoriteContacts];
    v20 = [v13 identifier];
    unsigned int v21 = [v19 containsObject:v20];

    v22 = [v9 cnContactIdsOfEmergencyContacts];
    v23 = [v13 identifier];
    unsigned int v24 = [v22 containsObject:v23];

    v25 = [v9 cnContactIdsOfICloudFamilyMembers];
    v26 = [v13 identifier];
    unsigned int v79 = [v25 containsObject:v26];

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v27 = [v13 emailAddresses];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v85 objects:v89 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      unsigned int v76 = v24;
      unsigned int v77 = v21;
      v81 = v12;
      id v78 = v7;
      char v30 = 0;
      uint64_t v31 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v86 != v31) {
            objc_enumerationMutation(v27);
          }
          v33 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          v34 = [v9 vipContactEmailAddresses];
          v35 = [v33 value];
          int v36 = [v34 containsObject:v35];

          if (v36) {
            char v30 = 1;
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v85 objects:v89 count:16];
      }
      while (v29);
      double v15 = (double)(v30 & 1);
      id v7 = v78;
      v12 = v81;
      v13 = v84;
      unsigned int v24 = v76;
      unsigned int v21 = v77;
    }

    double v18 = (double)v21;
    double v17 = (double)v24;
    double v16 = (double)v79;
    v11 = v80;
  }
  v37 = [v7 contextRequestSignals];
  v38 = [v37 entityID];
  v39 = [v11 messageID];
  int v40 = [v38 isEqualToString:v39];

  if (v40)
  {
    v82 = v12;
    v41 = v11;
    v42 = [v37 isFromPinnedMessage];
    if ([v42 BOOLValue])
    {
      unsigned int v43 = 1;
    }
    else
    {
      v45 = [v13 identifier];
      if (v45)
      {
        v46 = [v9 cnContactIdsOfPinnedChatsInMessage];
        v47 = [v13 identifier];
        unsigned int v43 = [v46 containsObject:v47];
      }
      else
      {
        unsigned int v43 = 0;
      }
    }
    v48 = [v37 isAudioMessage];
    unsigned int v44 = [v48 BOOLValue];

    v49 = [v37 isFromGroupMessage];
    if ([v49 BOOLValue])
    {
      v50 = [v37 isMentionedInGroup];
      int v51 = [v50 BOOLValue];

      if (v51) {
        double v14 = 1.0;
      }
      else {
        double v14 = 0.0;
      }
    }
    else
    {
    }
    v11 = v41;
    v12 = v82;
  }
  else
  {
    unsigned int v44 = 0;
    unsigned int v43 = 0;
  }
  [v10 isFavoriteContact];
  double v53 = v18 * v52;
  [v10 isEmergencyContact];
  double v55 = v17 * v54;
  [v10 isiCloudFamilyMember];
  double v57 = v16 * v56;
  [v10 isVIP];
  double v59 = v15 * v58;
  [v10 isContactChatPinnedInMessage];
  double v61 = v60 * (double)v43;
  [v10 isAudioMessage];
  double v63 = v62 * (double)v44;
  [v10 isMentionedInGroupMessage];
  double v65 = v14 * v64;
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v67 = [NSNumber numberWithDouble:v53];
  [v66 setObject:v67 forKeyedSubscript:@"isFavorite"];

  v68 = [NSNumber numberWithDouble:v55];
  [v66 setObject:v68 forKeyedSubscript:@"isEmergency"];

  v69 = [NSNumber numberWithDouble:v57];
  [v66 setObject:v69 forKeyedSubscript:@"isFamily"];

  v70 = [NSNumber numberWithDouble:v59];
  [v66 setObject:v70 forKeyedSubscript:@"isVIP"];

  v71 = [NSNumber numberWithDouble:v61];
  [v66 setObject:v71 forKeyedSubscript:@"isFromPinnedContactInMessage"];

  v72 = [NSNumber numberWithDouble:v63];
  [v66 setObject:v72 forKeyedSubscript:@"isAudioMessage"];

  v73 = [NSNumber numberWithDouble:v65];
  [v66 setObject:v73 forKeyedSubscript:@"isMentionedInGroupMessage"];

  v74 = [[ATXSenderImportance alloc] initWithSenderImportanceScore:v66 featureDictionary:fmin(fmax(v53 + v55 + v57 + v59 + v61 + v63 + v65 + 0.0, 0.0), 1.0)];
  return v74;
}

@end