@interface LPApplicationIdentification
+ (BOOL)isCNNMobile;
+ (BOOL)isFreeform;
+ (BOOL)isMacNotes;
+ (BOOL)isMessages;
+ (BOOL)isMessagesOrMessagesViewService;
+ (BOOL)isMessagesViewService;
+ (BOOL)isMobileNotes;
+ (BOOL)isMobileReminders;
+ (BOOL)isNotesPreviewGenerator;
@end

@implementation LPApplicationIdentification

+ (BOOL)isCNNMobile
{
  return hasMainBundleIdentifier(@"com.cnn.iphone");
}

+ (BOOL)isMessages
{
  return hasMainBundleIdentifier(@"com.apple.mobilesms");
}

+ (BOOL)isMessagesViewService
{
  return hasMainBundleIdentifier(@"com.apple.mobilesms.compose");
}

+ (BOOL)isMessagesOrMessagesViewService
{
  if (+[LPApplicationIdentification isMessages]) {
    return 1;
  }

  return +[LPApplicationIdentification isMessagesViewService];
}

+ (BOOL)isMobileReminders
{
  return hasMainBundleIdentifier(@"com.apple.reminders");
}

+ (BOOL)isMobileNotes
{
  return hasMainBundleIdentifier(@"com.apple.mobilenotes");
}

+ (BOOL)isMacNotes
{
  return hasMainBundleIdentifier(@"com.apple.Notes");
}

+ (BOOL)isFreeform
{
  return hasMainBundleIdentifier(@"com.apple.freeform");
}

+ (BOOL)isNotesPreviewGenerator
{
  if (hasMainBundleIdentifier(@"com.apple.mobilenotes.LPPreviewGenerator")) {
    return 1;
  }

  return hasMainBundleIdentifier(@"com.apple.Notes.LPPreviewGenerator");
}

@end