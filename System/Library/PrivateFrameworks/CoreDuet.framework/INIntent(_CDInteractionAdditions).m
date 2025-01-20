@interface INIntent(_CDInteractionAdditions)
- (uint64_t)cd_derivedIntentIdentifier;
- (uint64_t)cd_groupName;
- (uint64_t)cd_interactionMechanism;
- (uint64_t)cd_recipients;
- (uint64_t)cd_sender;
@end

@implementation INIntent(_CDInteractionAdditions)

- (uint64_t)cd_recipients
{
  return 0;
}

- (uint64_t)cd_sender
{
  return 0;
}

- (uint64_t)cd_interactionMechanism
{
  return 7;
}

- (uint64_t)cd_groupName
{
  return 0;
}

- (uint64_t)cd_derivedIntentIdentifier
{
  return 0;
}

@end