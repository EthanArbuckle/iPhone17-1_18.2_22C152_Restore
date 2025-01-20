@interface EKReminderTextDetailItem
+ (BOOL)allowDataDetector;
+ (id)textFromEventAndReminderBlock;
- (BOOL)showExtraSpaceAtBottom;
- (id)_createEventDetailCell;
- (void)setShowExtraSpaceAtBottom:(BOOL)a3;
@end

@implementation EKReminderTextDetailItem

- (id)_createEventDetailCell
{
  v3 = [EKReminderDetailTextCell alloc];
  event = self->super.super._event;
  reminder = self->super.super._reminder;
  BOOL v6 = [(EKReminderTextDetailItem *)self showExtraSpaceAtBottom];
  uint64_t v7 = [(id)objc_opt_class() allowDataDetector];
  v8 = [(id)objc_opt_class() titleForCell];
  v9 = [(id)objc_opt_class() textFromEventAndReminderBlock];
  v10 = [(EKReminderDetailTextCell *)v3 initWithEvent:event reminder:reminder editable:0 showExtraSpaceAtBottom:v6 allowDataDetector:v7 title:v8 textFromEventAndReminderBlock:v9];

  return v10;
}

- (BOOL)showExtraSpaceAtBottom
{
  return *(&self->super._cellNeedsUpdate + 1);
}

- (void)setShowExtraSpaceAtBottom:(BOOL)a3
{
  *(&self->super._cellNeedsUpdate + 1) = a3;
}

+ (id)textFromEventAndReminderBlock
{
  return 0;
}

+ (BOOL)allowDataDetector
{
  return 1;
}

@end