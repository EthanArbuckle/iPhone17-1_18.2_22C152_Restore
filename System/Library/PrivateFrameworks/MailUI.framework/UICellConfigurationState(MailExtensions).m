@interface UICellConfigurationState(MailExtensions)
- (uint64_t)isChild;
- (uint64_t)isFocusSystemActive;
- (uint64_t)isFocusingOnMessageListCell;
- (uint64_t)isParent;
- (void)setIsChild:()MailExtensions;
- (void)setIsFocusSystemActive:()MailExtensions;
- (void)setIsFocusingOnMessageListCell:()MailExtensions;
- (void)setIsParent:()MailExtensions;
@end

@implementation UICellConfigurationState(MailExtensions)

- (void)setIsParent:()MailExtensions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:@"kMessageListCellConfigurationStateThreadParentKey"];
}

- (void)setIsFocusingOnMessageListCell:()MailExtensions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:@"kMessageListCellConfigurationStateFocusingOnMessageListCellKey"];
}

- (void)setIsFocusSystemActive:()MailExtensions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:@"kMessageListCellConfigurationStateFocusSystemActiveKey"];
}

- (void)setIsChild:()MailExtensions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:@"kMessageListCellConfigurationStateThreadChildKey"];
}

- (uint64_t)isParent
{
  v1 = [a1 objectForKeyedSubscript:@"kMessageListCellConfigurationStateThreadParentKey"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)isChild
{
  v1 = [a1 objectForKeyedSubscript:@"kMessageListCellConfigurationStateThreadChildKey"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)isFocusSystemActive
{
  v1 = [a1 objectForKeyedSubscript:@"kMessageListCellConfigurationStateFocusSystemActiveKey"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)isFocusingOnMessageListCell
{
  v1 = [a1 objectForKeyedSubscript:@"kMessageListCellConfigurationStateFocusingOnMessageListCellKey"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end