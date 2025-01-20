@interface CNEnvironmentTestDouble(CNComposeRecipientNameOptions)
- (uint64_t)setComposeRecipientNameOptions:()CNComposeRecipientNameOptions;
@end

@implementation CNEnvironmentTestDouble(CNComposeRecipientNameOptions)

- (uint64_t)setComposeRecipientNameOptions:()CNComposeRecipientNameOptions
{
  return [a1 setValue:a3 forKey:@"compose-recipient-name-options"];
}

@end