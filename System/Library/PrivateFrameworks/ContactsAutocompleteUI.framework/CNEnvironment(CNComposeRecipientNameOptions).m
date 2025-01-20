@interface CNEnvironment(CNComposeRecipientNameOptions)
- (uint64_t)composeRecipientNameOptions;
@end

@implementation CNEnvironment(CNComposeRecipientNameOptions)

- (uint64_t)composeRecipientNameOptions
{
  return [a1 valueForKey:@"compose-recipient-name-options" onCacheMiss:&__block_literal_global_4];
}

@end