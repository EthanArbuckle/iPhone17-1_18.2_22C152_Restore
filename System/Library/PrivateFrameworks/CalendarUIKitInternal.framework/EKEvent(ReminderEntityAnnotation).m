@interface EKEvent(ReminderEntityAnnotation)
- (CUIKReminderEntityAnnotation)CUIK_reminderEntityAnnotation;
- (id)CUIK_reminderEntityIdentifier;
@end

@implementation EKEvent(ReminderEntityAnnotation)

- (CUIKReminderEntityAnnotation)CUIK_reminderEntityAnnotation
{
  return +[CUIKReminderEntityAnnotation annotationWithReminderIntegrationEvent:a1];
}

- (id)CUIK_reminderEntityIdentifier
{
  return +[CUIKReminderEntityAnnotation entityIdentifierForReminderIntegrationEvent:a1];
}

@end