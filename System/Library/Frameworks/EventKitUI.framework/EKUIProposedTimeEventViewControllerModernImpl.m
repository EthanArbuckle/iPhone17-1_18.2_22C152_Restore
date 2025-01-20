@interface EKUIProposedTimeEventViewControllerModernImpl
- (EKCalendarEventInvitationNotificationAttendee)proposedTimeAttendee;
- (EKUIEmailCompositionManager)messageSendingManager;
- (EKUIRecurrenceAlertController)recurrenceAlertController;
- (EKViewControllerRemoteUIDelegate)remoteUIDelegate;
- (id)completionBlock;
- (id)proposedTime;
- (id)statusButtons;
- (id)viewControllerManager;
- (id)viewTitle;
- (void)invokeAction:(int64_t)a3 eventStatusButtonsView:(id)a4;
- (void)requestOrganizerDetailPresentation;
- (void)setCompletionBlock:(id)a3;
- (void)setMessageSendingManager:(id)a3;
- (void)setProposedTimeAttendee:(id)a3;
- (void)setRecurrenceAlertController:(id)a3;
- (void)setRemoteUIDelegate:(id)a3;
@end

@implementation EKUIProposedTimeEventViewControllerModernImpl

- (id)viewControllerManager
{
  id v3 = objc_alloc(MEMORY[0x1E4F57C08]);
  v4 = [(EKUIProposedTimeEventViewControllerModernImpl *)self proposedTime];
  v5 = (void *)[v3 initWithDelegate:self proposedTime:v4];

  return v5;
}

- (id)proposedTime
{
  v2 = [(EKUIProposedTimeEventViewControllerModernImpl *)self proposedTimeAttendee];
  id v3 = [v2 proposedStartDate];

  return v3;
}

- (id)viewTitle
{
  v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Proposed Time" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)statusButtons
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v23 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = [(EKEventViewControllerModernImpl *)self event];
  v4 = [v3 attendees];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [(EKUIProposedTimeEventViewControllerModernImpl *)self proposedTimeAttendee];
          v11 = [v10 URL];
          v12 = [v11 resourceSpecifier];

          v13 = [v9 URL];
          v14 = [v13 resourceSpecifier];

          if ([v12 isEqualToString:v14])
          {
            [v23 addObject:v9];

            goto LABEL_13;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  v15 = [(EKEventViewControllerModernImpl *)self event];
  BOOL v16 = +[EKUIEmailCompositionManager canShowViewControllerForEvent:v15 withParticipantRecipients:v23];

  v17 = [(EKEventViewControllerModernImpl *)self event];
  v18 = [v17 calendar];
  int v19 = [v18 allowsContentModifications];

  v20 = &unk_1F0D03AD8;
  if (v16) {
    v20 = &unk_1F0D03AC0;
  }
  if (v19) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }

  return v21;
}

- (void)invokeAction:(int64_t)a3 eventStatusButtonsView:(id)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v66 = a4;
  v69 = self;
  v68 = [(EKEventViewControllerModernImpl *)self event];
  uint64_t v6 = [(UIResponder *)self EKUI_editor];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke;
  aBlock[3] = &unk_1E6087598;
  id v65 = v6;
  id v89 = v65;
  v67 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  switch(a3)
  {
    case 0x4000:
      v64 = objc_opt_new();
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      v31 = [v68 attendees];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v77 objects:v91 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v78;
        while (2)
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v78 != v33) {
              objc_enumerationMutation(v31);
            }
            v35 = *(void **)(*((void *)&v77 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v36 = v35;
              v37 = [(EKUIProposedTimeEventViewControllerModernImpl *)v69 proposedTimeAttendee];
              v38 = [v37 emailAddress];
              v39 = [v36 emailAddress];
              int v40 = [v38 isEqual:v39];

              if (v40)
              {
                [v64 addObject:v36];

                goto LABEL_42;
              }
            }
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v77 objects:v91 count:16];
          if (v32) {
            continue;
          }
          break;
        }
      }
LABEL_42:

      v52 = EventKitUIBundle();
      v53 = [v52 localizedStringForKey:@"RE:" value:&stru_1F0CC2140 table:0];

      v54 = [[EKUIEmailCompositionManager alloc] initWithEvent:v68 participantRecipients:v64 subjectPrefix:v53 bodyPrefix:0];
      [(EKUIProposedTimeEventViewControllerModernImpl *)v69 setMessageSendingManager:v54];

      v55 = [(EKUIProposedTimeEventViewControllerModernImpl *)v69 messageSendingManager];
      objc_initWeak(&location, v55);

      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke_3;
      v74[3] = &unk_1E60875E8;
      objc_copyWeak(&v75, &location);
      v56 = [(EKUIProposedTimeEventViewControllerModernImpl *)v69 messageSendingManager];
      [v56 setMessageSendingComplete:v74];

      v57 = [(EKUIProposedTimeEventViewControllerModernImpl *)v69 messageSendingManager];
      v58 = [v57 viewController];
      [v58 setModalPresentationStyle:2];

      v59 = [(EKEventViewControllerModernImpl *)v69 presentationSourceViewController];
      v60 = [(EKUIProposedTimeEventViewControllerModernImpl *)v69 messageSendingManager];
      v61 = [v60 viewController];
      [v59 presentViewController:v61 animated:1 completion:0];

      objc_destroyWeak(&v75);
      objc_destroyWeak(&location);

      break;
    case 0x2000:
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v41 = [v68 attendees];
      uint64_t v42 = [v41 countByEnumeratingWithState:&v70 objects:v90 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v71;
        do
        {
          for (uint64_t j = 0; j != v42; ++j)
          {
            if (*(void *)v71 != v43) {
              objc_enumerationMutation(v41);
            }
            v45 = *(void **)(*((void *)&v70 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v46 = v45;
              v47 = [(EKUIProposedTimeEventViewControllerModernImpl *)v69 proposedTimeAttendee];
              v48 = [v47 emailAddress];
              v49 = [v46 emailAddress];
              int v50 = [v48 isEqual:v49];

              if (v50)
              {
                [v46 setCommentChanged:0];
                [v46 setStatusChanged:0];
                [v46 setProposedStartDateChanged:0];
                [v46 setProposedStartDateStatus:3];
              }
            }
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v70 objects:v90 count:16];
        }
        while (v42);
      }

      if ([v68 isOrWasPartOfRecurringSeries]) {
        uint64_t v51 = 4;
      }
      else {
        uint64_t v51 = 0;
      }
      v67[2](v67, v68, v51);
      [(EKEventViewControllerModernImpl *)v69 completeWithAction:0];
      break;
    case 0x1000:
      uint64_t v7 = [v68 endDateUnadjustedForLegacyClients];
      v8 = [v68 startDate];
      [v7 timeIntervalSinceDate:v8];
      double v10 = v9;

      v11 = [(EKUIProposedTimeEventViewControllerModernImpl *)v69 proposedTime];
      [v68 setStartDate:v11];

      v12 = [(EKUIProposedTimeEventViewControllerModernImpl *)v69 proposedTime];
      v13 = [v12 dateByAddingTimeInterval:v10];
      [v68 setEndDateUnadjustedForLegacyClients:v13];

      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      v14 = [v68 attendees];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v84 objects:v92 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v85;
        do
        {
          for (uint64_t k = 0; k != v15; ++k)
          {
            if (*(void *)v85 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = *(void **)(*((void *)&v84 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = v18;
              [v19 setCommentChanged:0];
              [v19 setStatusChanged:0];
              [v19 setProposedStartDateChanged:0];
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v84 objects:v92 count:16];
        }
        while (v15);
      }

      [v68 dismissAcceptedProposeNewTimeNotification];
      v20 = [v66 buttonForAction:4096];
      if ([v68 isOrWasPartOfRecurringSeries])
      {
        v21 = [(EKEventViewControllerModernImpl *)v69 presentationSourceViewController];
        [v20 bounds];
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke_2;
        v81[3] = &unk_1E60875C0;
        v81[4] = v69;
        v83 = v67;
        id v82 = v68;
        v30 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v21, v20, v82, v81, v23, v25, v27, v29);
        [(EKUIProposedTimeEventViewControllerModernImpl *)v69 setRecurrenceAlertController:v30];
      }
      else
      {
        v67[2](v67, v68, 0);
        [(EKEventViewControllerModernImpl *)v69 completeWithAction:0];
      }

      break;
  }
  v62 = [(EKUIProposedTimeEventViewControllerModernImpl *)v69 completionBlock];

  if (v62)
  {
    v63 = [(EKUIProposedTimeEventViewControllerModernImpl *)v69 completionBlock];
    v63[2]();
  }
}

uint64_t __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) saveEvent:a2 span:a3 error:0];
}

void __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 3) >= 3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) setRecurrenceAlertController:0];
    uint64_t v5 = *(void **)(a1 + 32);
    [v5 completeWithAction:0];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 1136);
    *(void *)(v3 + 1136) = 0;
  }
}

void __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained viewController];
    uint64_t v3 = [v2 presentingViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];

    id WeakRetained = v4;
  }
}

- (void)requestOrganizerDetailPresentation
{
  uint64_t v3 = [EKIdentityViewController alloc];
  id v4 = [(EKEventViewControllerModernImpl *)self event];
  uint64_t v5 = [v4 organizer];
  uint64_t v7 = [(EKIdentityViewController *)v3 initWithIdentity:v5];

  uint64_t v6 = [(EKUIProposedTimeEventViewControllerModernImpl *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (EKViewControllerRemoteUIDelegate)remoteUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIDelegate);

  return (EKViewControllerRemoteUIDelegate *)WeakRetained;
}

- (void)setRemoteUIDelegate:(id)a3
{
}

- (id)completionBlock
{
  return self->completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (EKCalendarEventInvitationNotificationAttendee)proposedTimeAttendee
{
  return self->proposedTimeAttendee;
}

- (void)setProposedTimeAttendee:(id)a3
{
}

- (EKUIRecurrenceAlertController)recurrenceAlertController
{
  return (EKUIRecurrenceAlertController *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setRecurrenceAlertController:(id)a3
{
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return (EKUIEmailCompositionManager *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setMessageSendingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->proposedTimeAttendee, 0);
  objc_storeStrong(&self->completionBlock, 0);

  objc_destroyWeak((id *)&self->_remoteUIDelegate);
}

@end