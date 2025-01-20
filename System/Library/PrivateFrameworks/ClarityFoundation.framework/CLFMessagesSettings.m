@interface CLFMessagesSettings
- (BOOL)requiresMoreRestrictiveOutgoingCommunicationLimit;
- (id)legacyOutgoingCommunicationLimit;
@end

@implementation CLFMessagesSettings

uint64_t __51__CLFMessagesSettings_GeneratedCode_sharedInstance__block_invoke()
{
  sharedInstance_SharedSettings_2 = objc_alloc_init(CLFMessagesSettings);
  return MEMORY[0x270F9A758]();
}

- (BOOL)requiresMoreRestrictiveOutgoingCommunicationLimit
{
  return 1;
}

- (id)legacyOutgoingCommunicationLimit
{
  return @"selectedContacts";
}

@end