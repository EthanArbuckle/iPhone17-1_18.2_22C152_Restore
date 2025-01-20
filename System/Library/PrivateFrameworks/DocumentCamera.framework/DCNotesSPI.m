@interface DCNotesSPI
+ (void)scanWasDeleted:(id)a3;
@end

@implementation DCNotesSPI

+ (void)scanWasDeleted:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 postNotificationName:@"DCScanWasDeletedNotification" object:v4];
}

@end