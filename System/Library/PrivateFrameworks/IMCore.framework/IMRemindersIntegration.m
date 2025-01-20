@interface IMRemindersIntegration
+ (void)notifyInteractionWithPeople:(id)a3;
@end

@implementation IMRemindersIntegration

+ (void)notifyInteractionWithPeople:(id)a3
{
  id v5 = a3;
  if (!qword_1E965E758) {
    qword_1E965E758 = MEMORY[0x1A6263B40](@"REMStore", @"ReminderKit");
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_notifyOfInteractionWithPeople_((void *)qword_1E965E758, v3, (uint64_t)v5, v4);
  }
}

@end