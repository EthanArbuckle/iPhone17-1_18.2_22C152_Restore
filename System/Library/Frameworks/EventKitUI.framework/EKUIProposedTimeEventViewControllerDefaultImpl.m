@interface EKUIProposedTimeEventViewControllerDefaultImpl
- (BOOL)shouldShowEditButtonInline;
- (EKCalendarEventInvitationNotificationAttendee)proposedTimeAttendee;
- (EKUIEmailCompositionManager)messageSendingManager;
- (EKUIRecurrenceAlertController)recurrenceAlertController;
- (EKViewControllerRemoteUIDelegate)remoteUIDelegate;
- (id)completionBlock;
- (id)items;
- (id)proposedTime;
- (id)statusButtons;
- (id)viewTitle;
- (void)acceptButtonTapped;
- (void)bottomStatusButtonTappedWithAction:(int64_t)a3 eventStatusButtonsView:(id)a4;
- (void)rejectButtonTapped;
- (void)replyButtonTapped;
- (void)setCompletionBlock:(id)a3;
- (void)setMessageSendingManager:(id)a3;
- (void)setProposedTimeAttendee:(id)a3;
- (void)setRecurrenceAlertController:(id)a3;
- (void)setRemoteUIDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EKUIProposedTimeEventViewControllerDefaultImpl

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)EKUIProposedTimeEventViewControllerDefaultImpl;
  [(EKEventViewControllerDefaultImpl *)&v11 viewWillAppear:a3];
  v4 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)self statusButtons];
  uint64_t v5 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)self remoteUIDelegate];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)self remoteUIDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)self remoteUIDelegate];
      v10 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)self _proposedTimeEventViewController];
      [v9 viewController:v10 didChangeBottomStatusButtons:v4];
    }
  }
}

- (id)proposedTime
{
  v2 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)self proposedTimeAttendee];
  v3 = [v2 proposedStartDate];

  return v3;
}

- (id)viewTitle
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Proposed Time" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (BOOL)shouldShowEditButtonInline
{
  v4.receiver = self;
  v4.super_class = (Class)EKUIProposedTimeEventViewControllerDefaultImpl;
  unsigned __int8 v2 = [(EKEventViewControllerDefaultImpl *)&v4 shouldShowEditButtonInline];
  return v2 & ~+[SwappableViewControllerImplementationFactory shouldUseOutOfProcessUI];
}

- (id)items
{
  v13[3] = *MEMORY[0x1E4F143B8];
  items = self->super._items;
  if (!items)
  {
    objc_super v4 = objc_alloc_init(EKEventTitleDetailItem);
    [(EKEventTitleDetailItem *)v4 setEditDelegate:self];
    uint64_t v5 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)self proposedTime];
    [(EKEventTitleDetailItem *)v4 setProposedTime:v5];

    v6 = objc_alloc_init(EKEventPreviewDetailItem);
    v7 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)self proposedTime];
    [(EKEventPreviewDetailItem *)v6 setProposedTime:v7];

    char v8 = objc_alloc_init(EKEventOrganizerDetailItem);
    v9 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)self proposedTimeAttendee];
    [(EKEventOrganizerDetailItem *)v8 setOrganizerOverride:v9];

    v13[0] = v4;
    v13[1] = v6;
    v13[2] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    objc_super v11 = self->super._items;
    self->super._items = v10;

    items = self->super._items;
  }

  return items;
}

- (id)statusButtons
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v23 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = [(EKEventViewControllerDefaultImpl *)self event];
  objc_super v4 = [v3 attendees];

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
          v10 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)self proposedTimeAttendee];
          objc_super v11 = [v10 URL];
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

  v15 = [(EKEventViewControllerDefaultImpl *)self event];
  BOOL v16 = +[EKUIEmailCompositionManager canShowViewControllerForEvent:v15 withParticipantRecipients:v23];

  v17 = [(EKEventViewControllerDefaultImpl *)self event];
  v18 = [v17 calendar];
  int v19 = [v18 allowsContentModifications];

  v20 = &unk_1F0D03B38;
  if (v16) {
    v20 = &unk_1F0D03B20;
  }
  if (v19) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }

  return v21;
}

- (void)bottomStatusButtonTappedWithAction:(int64_t)a3 eventStatusButtonsView:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v65 = a4;
  val = self;
  v67 = [(EKEventViewControllerDefaultImpl *)self event];
  uint64_t v6 = [(UIResponder *)self EKUI_editor];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke;
  aBlock[3] = &unk_1E6087598;
  id v64 = v6;
  id v88 = v64;
  v66 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  switch(a3)
  {
    case 0x4000:
      v63 = objc_opt_new();
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      v31 = [v67 attendees];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v76 objects:v90 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v77;
        while (2)
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v77 != v33) {
              objc_enumerationMutation(v31);
            }
            v35 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v36 = v35;
              v37 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)val proposedTimeAttendee];
              v38 = [v37 emailAddress];
              v39 = [v36 emailAddress];
              int v40 = [v38 isEqual:v39];

              if (v40)
              {
                [v63 addObject:v36];

                goto LABEL_42;
              }
            }
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v76 objects:v90 count:16];
          if (v32) {
            continue;
          }
          break;
        }
      }
LABEL_42:

      v52 = EventKitUIBundle();
      v53 = [v52 localizedStringForKey:@"RE:" value:&stru_1F0CC2140 table:0];

      v54 = [[EKUIEmailCompositionManager alloc] initWithEvent:v67 participantRecipients:v63 subjectPrefix:v53 bodyPrefix:0];
      [(EKUIProposedTimeEventViewControllerDefaultImpl *)val setMessageSendingManager:v54];

      objc_initWeak(&location, val);
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke_3;
      v73[3] = &unk_1E60875E8;
      objc_copyWeak(&v74, &location);
      v55 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)val messageSendingManager];
      [v55 setMessageSendingComplete:v73];

      v56 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)val messageSendingManager];
      v57 = [v56 viewController];
      [v57 setModalPresentationStyle:2];

      v58 = [(EKEventViewControllerDefaultImpl *)val presentationNavigationDelegate];
      v59 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)val messageSendingManager];
      v60 = [v59 viewController];
      [v58 presentViewController:v60 animated:1 completion:0];

      objc_destroyWeak(&v74);
      objc_destroyWeak(&location);

      break;
    case 0x2000:
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      v41 = [v67 attendees];
      uint64_t v42 = [v41 countByEnumeratingWithState:&v69 objects:v89 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v70;
        do
        {
          for (uint64_t j = 0; j != v42; ++j)
          {
            if (*(void *)v70 != v43) {
              objc_enumerationMutation(v41);
            }
            v45 = *(void **)(*((void *)&v69 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v46 = v45;
              v47 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)val proposedTimeAttendee];
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
          uint64_t v42 = [v41 countByEnumeratingWithState:&v69 objects:v89 count:16];
        }
        while (v42);
      }

      if ([v67 isOrWasPartOfRecurringSeries]) {
        uint64_t v51 = 4;
      }
      else {
        uint64_t v51 = 0;
      }
      v66[2](v66, v67, v51);
      [(EKEventViewControllerDefaultImpl *)val completeWithAction:0];
      break;
    case 0x1000:
      uint64_t v7 = [v67 endDateUnadjustedForLegacyClients];
      char v8 = [v67 startDate];
      [v7 timeIntervalSinceDate:v8];
      double v10 = v9;

      objc_super v11 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)val proposedTime];
      [v67 setStartDate:v11];

      v12 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)val proposedTime];
      v13 = [v12 dateByAddingTimeInterval:v10];
      [v67 setEndDateUnadjustedForLegacyClients:v13];

      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      v14 = [v67 attendees];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v83 objects:v91 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v84;
        do
        {
          for (uint64_t k = 0; k != v15; ++k)
          {
            if (*(void *)v84 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = *(void **)(*((void *)&v83 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = v18;
              [v19 setCommentChanged:0];
              [v19 setStatusChanged:0];
              [v19 setProposedStartDateChanged:0];
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v83 objects:v91 count:16];
        }
        while (v15);
      }

      [v67 dismissAcceptedProposeNewTimeNotification];
      v20 = [v65 buttonForAction:4096];
      if ([v67 isOrWasPartOfRecurringSeries])
      {
        v21 = [(EKEventViewControllerDefaultImpl *)val presentationSourceViewController];
        [v20 bounds];
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        v80[0] = MEMORY[0x1E4F143A8];
        v80[1] = 3221225472;
        v80[2] = __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke_2;
        v80[3] = &unk_1E60875C0;
        v80[4] = val;
        v82 = v66;
        id v81 = v67;
        v30 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v21, v20, v81, v80, v23, v25, v27, v29);
        [(EKUIProposedTimeEventViewControllerDefaultImpl *)val setRecurrenceAlertController:v30];
      }
      else
      {
        v66[2](v66, v67, 0);
        [(EKEventViewControllerDefaultImpl *)val completeWithAction:0];
      }

      break;
  }
  v61 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)val completionBlock];

  if (v61)
  {
    v62 = [(EKUIProposedTimeEventViewControllerDefaultImpl *)val completionBlock];
    v62[2]();
  }
}

uint64_t __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) saveEvent:a2 span:a3 error:0];
}

void __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke_2(uint64_t a1, uint64_t a2)
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
    objc_super v4 = *(void **)(v3 + 1360);
    *(void *)(v3 + 1360) = 0;
  }
}

void __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained messageSendingManager];
  unsigned __int8 v2 = [v1 viewController];
  uint64_t v3 = [v2 presentingViewController];

  if (v3)
  {
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    objc_super v4 = [WeakRetained presentationNavigationDelegate];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)acceptButtonTapped
{
}

- (void)replyButtonTapped
{
}

- (void)rejectButtonTapped
{
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
  return (EKUIRecurrenceAlertController *)objc_getProperty(self, a2, 1360, 1);
}

- (void)setRecurrenceAlertController:(id)a3
{
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return (EKUIEmailCompositionManager *)objc_getProperty(self, a2, 1368, 1);
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