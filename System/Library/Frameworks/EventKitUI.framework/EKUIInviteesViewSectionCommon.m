@interface EKUIInviteesViewSectionCommon
+ (id)deleteRowAction:(id)a3 forRow:(id)a4;
+ (id)setRoleRowActionWithParticipant:(id)a3 withSetRoleBlock:(id)a4 forSections:(id)a5;
@end

@implementation EKUIInviteesViewSectionCommon

+ (id)deleteRowAction:(id)a3 forRow:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4FB1688];
  v8 = [v5 titleForDeleteConfirmationButtonForRow:v6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__EKUIInviteesViewSectionCommon_deleteRowAction_forRow___block_invoke;
  v13[3] = &unk_1E608ACC8;
  id v14 = v5;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  v11 = [v7 contextualActionWithStyle:1 title:v8 handler:v13];

  return v11;
}

void __56__EKUIInviteesViewSectionCommon_deleteRowAction_forRow___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a4;
  [v4 commitEditingStyle:1 forRow:v5];
  v6[2](v6, 1);
}

+ (id)setRoleRowActionWithParticipant:(id)a3 withSetRoleBlock:(id)a4 forSections:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [a3 participant];
  uint64_t v10 = [v9 participantRole];
  v11 = EventKitUIBundle();
  v12 = v11;
  if (v10 == 2)
  {
    v13 = [v11 localizedStringForKey:@"Make Required" value:&stru_1F0CC2140 table:0];

    id v14 = (void *)MEMORY[0x1E4FB1688];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __94__EKUIInviteesViewSectionCommon_setRoleRowActionWithParticipant_withSetRoleBlock_forSections___block_invoke;
    v34[3] = &unk_1E608ACF0;
    id v15 = &v37;
    id v36 = v8;
    id v37 = v7;
    v16 = &v35;
    v17 = &v36;
    v35 = v9;
    id v18 = v8;
    id v19 = v9;
    id v20 = v7;
    v21 = v34;
  }
  else
  {
    v13 = [v11 localizedStringForKey:@"Make Optional" value:&stru_1F0CC2140 table:0];

    id v14 = (void *)MEMORY[0x1E4FB1688];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __94__EKUIInviteesViewSectionCommon_setRoleRowActionWithParticipant_withSetRoleBlock_forSections___block_invoke_17;
    v30 = &unk_1E608ACF0;
    id v15 = &v33;
    id v32 = v8;
    id v33 = v7;
    v16 = &v31;
    v17 = &v32;
    v31 = v9;
    id v22 = v8;
    id v23 = v9;
    id v24 = v7;
    v21 = &v27;
  }
  v25 = objc_msgSend(v14, "contextualActionWithStyle:title:handler:", 0, v13, v21, v27, v28, v29, v30);

  return v25;
}

void __94__EKUIInviteesViewSectionCommon_setRoleRowActionWithParticipant_withSetRoleBlock_forSections___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a1[6];
  if (v10)
  {
    (*(void (**)(uint64_t, void, uint64_t, void))(v10 + 16))(v10, a1[4], 1, a1[5]);
    v9[2](v9, 1);
  }
  else
  {
    v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 0;
      _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_ERROR, "No 'participant set role' callback defined.  Will not toggle participant", (uint8_t *)v12, 2u);
    }
    v9[2](v9, 0);
  }
}

void __94__EKUIInviteesViewSectionCommon_setRoleRowActionWithParticipant_withSetRoleBlock_forSections___block_invoke_17(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a1[6];
  if (v10)
  {
    (*(void (**)(uint64_t, void, uint64_t, void))(v10 + 16))(v10, a1[4], 2, a1[5]);
    v9[2](v9, 1);
  }
  else
  {
    v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 0;
      _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_ERROR, "No 'participant set role' callback defined.  Will not toggle participant.", (uint8_t *)v12, 2u);
    }
    v9[2](v9, 0);
  }
}

@end