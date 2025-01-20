@interface ATXNotificationSenderImportanceModel
- (id)calculateSenderImportanceForNotificationWithContextRequest:(id)a3;
@end

@implementation ATXNotificationSenderImportanceModel

- (id)calculateSenderImportanceForNotificationWithContextRequest:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [[ATXSenderImportance alloc] initWithSenderImportanceScore:v3 featureDictionary:0.0];

  return v4;
}

@end