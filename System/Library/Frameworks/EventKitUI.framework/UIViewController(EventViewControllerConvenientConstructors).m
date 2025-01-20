@interface UIViewController(EventViewControllerConvenientConstructors)
+ (EKEventViewController)eventDetailViewControllerWithEvent:()EventViewControllerConvenientConstructors delegate:context:allowInlinePreview:previewInline:minimalMode:;
+ (uint64_t)eventDetailViewControllerWithEvent:()EventViewControllerConvenientConstructors delegate:context:;
@end

@implementation UIViewController(EventViewControllerConvenientConstructors)

+ (uint64_t)eventDetailViewControllerWithEvent:()EventViewControllerConvenientConstructors delegate:context:
{
  return [a1 eventDetailViewControllerWithEvent:a3 delegate:a4 context:a5 allowInlinePreview:1 previewInline:1 minimalMode:0];
}

+ (EKEventViewController)eventDetailViewControllerWithEvent:()EventViewControllerConvenientConstructors delegate:context:allowInlinePreview:previewInline:minimalMode:
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = [v13 calendar];
  uint64_t v17 = [v16 type];

  v18 = (void *)EKWeakLinkClass();
  uint64_t v19 = EKWeakLinkClass();
  if (v17 == 4 && (v20 = (objc_class *)v19, [v18 authorizationStatusForEntityType:0] == 3))
  {
    v21 = (void *)EKWeakLinkClass();
    id v22 = objc_alloc_init(v20);
    v23 = objc_msgSend((id)objc_msgSend(v18, "alloc"), "initWithConfiguration:", v22);
    v24 = [v13 birthdayContactIdentifier];
    v25 = [v21 descriptorForRequiredKeys];
    v36[0] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    v27 = [v23 unifiedContactWithIdentifier:v24 keysToFetch:v26 error:0];

    v28 = [v21 viewControllerForContact:v27];
    [(EKEventViewController *)v28 setContactStore:v23];
    [(EKEventViewController *)v28 setShouldShowLinkedContacts:1];
    [(EKEventViewController *)v28 setDisplayMode:1];
    [(EKEventViewController *)v28 setActions:[(EKEventViewController *)v28 actions] | 0x400];
    [(EKEventViewController *)v28 setAllowsEditing:0];
    if ([v14 conformsToProtocol:&unk_1F0D480A8]) {
      [(EKEventViewController *)v28 setDelegate:v14];
    }
  }
  else
  {
    v28 = objc_alloc_init(EKEventViewController);
    [(EKEventViewController *)v28 setContext:v15];
    v29 = [v15 objectForKeyedSubscript:@"EKUIEventDetailsContext_AllowsCalendarPreview"];
    v30 = v29;
    if (v29) {
      -[EKEventViewController setAllowsCalendarPreview:](v28, "setAllowsCalendarPreview:", [v29 BOOLValue]);
    }
    v31 = [v15 objectForKeyedSubscript:@"EKUIEventDetailsContext_CalendarPreviewIsInlineDayView"];

    if (v31) {
      -[EKEventViewController setCalendarPreviewIsInlineDayView:](v28, "setCalendarPreviewIsInlineDayView:", [v31 BOOLValue]);
    }
    v32 = [v15 objectForKeyedSubscript:@"EKUIEventDetailsContext_MinimalMode"];

    if (v32) {
      -[EKEventViewController setMinimalMode:](v28, "setMinimalMode:", [v32 BOOLValue]);
    }
    v33 = [v15 objectForKeyedSubscript:@"EKUIEventDetailsContext_AllowsConferenceItem"];

    if (v33) {
      -[EKEventViewController setShowsDetectedConferenceItem:](v28, "setShowsDetectedConferenceItem:", [v33 BOOLValue]);
    }
    v34 = [v15 objectForKeyedSubscript:@"EKUIEventDetailsContext_ShowsDoneButton"];

    if (v34) {
      -[EKEventViewController setShowsDoneButton:](v28, "setShowsDoneButton:", [v34 BOOLValue]);
    }
    if ([v14 conformsToProtocol:&unk_1F0D6CE58]) {
      [(EKEventViewController *)v28 setDelegate:v14];
    }
    [(EKEventViewController *)v28 setAllowsCalendarPreview:a6];
    [(EKEventViewController *)v28 setCalendarPreviewIsInlineDayView:a7];
    [(EKEventViewController *)v28 setMinimalMode:a8];
    [(EKEventViewController *)v28 setAllowsEditing:1];
    if (objc_opt_respondsToSelector()) {
      -[EKEventViewController setEditorShowTransition:](v28, "setEditorShowTransition:", [v14 editorShowTransition]);
    }
    if (objc_opt_respondsToSelector()) {
      -[EKEventViewController setEditorHideTransition:](v28, "setEditorHideTransition:", [v14 editorHideTransition]);
    }
    [(EKEventViewController *)v28 setEvent:v13];
  }

  return v28;
}

@end