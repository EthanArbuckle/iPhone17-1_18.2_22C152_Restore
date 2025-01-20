@interface EKUIInviteeContextMenuData
- (EKUIInviteeContextMenuData)initWithDefaultActionsForSection:(id)a3 indexPath:(id)a4 participant:(id)a5 interaction:(id)a6 participantSetRole:(id)a7;
- (UIMenu)menu;
- (id)_buildCombinedCalendarAndContactsMenu;
- (id)_contactsMenu;
- (id)presentingViewControllerForActionsController:(id)a3;
- (void)_setupCalendarMenuForSection:(id)a3 indexPath:(id)a4 participant:(id)a5 participantSetRole:(id)a6;
- (void)_setupContactsOrbActionControllerForParticipant:(id)a3;
- (void)contactOrbActionsController:(id)a3 didUpdateWithMenu:(id)a4;
- (void)setMenu:(id)a3;
@end

@implementation EKUIInviteeContextMenuData

- (EKUIInviteeContextMenuData)initWithDefaultActionsForSection:(id)a3 indexPath:(id)a4 participant:(id)a5 interaction:(id)a6 participantSetRole:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)EKUIInviteeContextMenuData;
  v17 = [(EKUIInviteeContextMenuData *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_interaction, a6);
    [(EKUIInviteeContextMenuData *)v18 _setupContactsOrbActionControllerForParticipant:v14];
    [(EKUIInviteeContextMenuData *)v18 _setupCalendarMenuForSection:v12 indexPath:v13 participant:v14 participantSetRole:v16];
    uint64_t v19 = [(EKUIInviteeContextMenuData *)v18 _buildCombinedCalendarAndContactsMenu];
    menu = v18->_menu;
    v18->_menu = (UIMenu *)v19;
  }
  return v18;
}

- (id)_buildCombinedCalendarAndContactsMenu
{
  v3 = [(EKUIInviteeContextMenuData *)self _contactsMenu];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count")+ -[NSArray count](self->_calendarMenuStartItems, "count")+ -[NSArray count](self->_calendarMenuEndItems, "count"));
  [v4 addObjectsFromArray:self->_calendarMenuStartItems];
  [v4 addObjectsFromArray:v3];
  [v4 addObjectsFromArray:self->_calendarMenuEndItems];
  v5 = [MEMORY[0x1E4FB1970] menuWithChildren:v4];

  return v5;
}

- (void)_setupContactsOrbActionControllerForParticipant:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)EKWeakLinkClass();
  v6 = [v5 descriptorForRequiredKeys];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = +[EKIdentityViewController contactForIdentity:v4 keysToFetch:v7];

  v9 = (void *)[objc_alloc((Class)v5) initWithContact:v8];
  [v9 setDelegate:self];
  contactActionsController = self->_contactActionsController;
  self->_contactActionsController = (CNContactOrbActionsController *)v9;
}

- (void)_setupCalendarMenuForSection:(id)a3 indexPath:(id)a4 participant:(id)a5 participantSetRole:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v45 = a6;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  id v13 = [MEMORY[0x1E4F1CA48] array];
  id v14 = (void *)MEMORY[0x1E4FB13F0];
  id v15 = EventKitUIBundle();
  id v16 = [v15 localizedStringForKey:@"View Contact" value:&stru_1F0CC2140 table:0];
  v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle"];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke;
  v57[3] = &unk_1E6087DD0;
  id v18 = v9;
  id v58 = v18;
  id v19 = v10;
  id v59 = v19;
  v20 = [v14 actionWithTitle:v16 image:v17 identifier:0 handler:v57];

  [(NSArray *)v12 addObject:v20];
  if ([v18 canEditRow:v19])
  {
    uint64_t v21 = [v11 participantRole];
    objc_super v22 = EventKitUIBundle();
    v23 = v22;
    id v43 = v11;
    if (v21 == 2)
    {
      uint64_t v24 = [v22 localizedStringForKey:@"Make Required" value:&stru_1F0CC2140 table:0];

      v41 = (void *)MEMORY[0x1E4FB13F0];
      v25 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.fill.checkmark"];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_2;
      v53[3] = &unk_1E6087DF8;
      v42 = &v56;
      id v56 = v45;
      v26 = &v54;
      id v27 = v11;
      v28 = (void *)v24;
      id v54 = v27;
      v29 = &v55;
      id v55 = v19;
      v30 = v53;
    }
    else
    {
      uint64_t v24 = [v22 localizedStringForKey:@"Make Optional" value:&stru_1F0CC2140 table:0];

      v41 = (void *)MEMORY[0x1E4FB13F0];
      v25 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.fill.questionmark"];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_3;
      v49[3] = &unk_1E6087DF8;
      v42 = &v52;
      id v52 = v45;
      v26 = &v50;
      id v31 = v11;
      v28 = (void *)v24;
      id v50 = v31;
      v29 = &v51;
      id v51 = v19;
      v30 = v49;
    }
    v32 = [v41 actionWithTitle:v24 image:v25 identifier:0 handler:v30];

    [(NSArray *)v12 addObject:v32];
    v33 = (void *)MEMORY[0x1E4FB13F0];
    v34 = [v18 titleForDeleteConfirmationButtonForRow:v19];
    v35 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_4;
    v46[3] = &unk_1E6087DD0;
    id v47 = v18;
    id v48 = v19;
    v36 = [v33 actionWithTitle:v34 image:v35 identifier:0 handler:v46];

    [v36 setAttributes:2];
    [(NSArray *)v13 addObject:v36];

    id v11 = v43;
  }
  calendarMenuStartItems = self->_calendarMenuStartItems;
  self->_calendarMenuStartItems = v12;
  v38 = v12;

  calendarMenuEndItems = self->_calendarMenuEndItems;
  self->_calendarMenuEndItems = v13;
  v40 = v13;
}

uint64_t __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) selectRow:*(void *)(a1 + 40)];
}

void __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v2 + 16))(v2, v1, 1, v3);
}

void __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v2 + 16))(v2, v1, 2, v3);
}

uint64_t __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitEditingStyle:1 forRow:*(void *)(a1 + 40)];
}

- (id)_contactsMenu
{
  return (id)[(CNContactOrbActionsController *)self->_contactActionsController currentAvailableMenuItems];
}

- (void)contactOrbActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  v5 = [(EKUIInviteeContextMenuData *)self _buildCombinedCalendarAndContactsMenu];
  menu = self->_menu;
  self->_menu = v5;

  interaction = self->_interaction;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__EKUIInviteeContextMenuData_contactOrbActionsController_didUpdateWithMenu___block_invoke;
  v8[3] = &unk_1E6087E20;
  v8[4] = self;
  [(UIContextMenuInteraction *)interaction updateVisibleMenuWithBlock:v8];
}

id __76__EKUIInviteeContextMenuData_contactOrbActionsController_didUpdateWithMenu___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

- (id)presentingViewControllerForActionsController:(id)a3
{
  return 0;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_contactActionsController, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_calendarMenuEndItems, 0);

  objc_storeStrong((id *)&self->_calendarMenuStartItems, 0);
}

@end