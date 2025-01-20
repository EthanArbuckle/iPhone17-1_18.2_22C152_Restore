@interface UIViewController(EKUIAppEntityAnnotation)
- (void)EKUI_annotateIfNeededWithAppEntityForEvent:()EKUIAppEntityAnnotation isEditing:;
@end

@implementation UIViewController(EKUIAppEntityAnnotation)

- (void)EKUI_annotateIfNeededWithAppEntityForEvent:()EKUIAppEntityAnnotation isEditing:
{
  id v9 = a3;
  if (CalendarLinkLibraryCore())
  {
    int v6 = [a1 isViewLoaded];
    if (v9)
    {
      if (v6 && ([v9 isNew] & 1) == 0)
      {
        v7 = [a1 view];
        objc_msgSend(v7, "Cal_annotateWithEvent:", v9);

        v8 = [a1 view];
        objc_msgSend(v8, "Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:", 1, 0, 0, 0, a4, 1);
      }
    }
  }
}

@end