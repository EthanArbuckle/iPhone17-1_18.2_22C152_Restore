@interface INStartAudioCallIntent(_CDInteractionAdditions)
- (uint64_t)cd_groupName;
- (uint64_t)cd_interactionMechanism;
- (uint64_t)cd_sender;
@end

@implementation INStartAudioCallIntent(_CDInteractionAdditions)

- (uint64_t)cd_sender
{
  return 0;
}

- (uint64_t)cd_interactionMechanism
{
  return 0;
}

- (uint64_t)cd_groupName
{
  return 0;
}

@end