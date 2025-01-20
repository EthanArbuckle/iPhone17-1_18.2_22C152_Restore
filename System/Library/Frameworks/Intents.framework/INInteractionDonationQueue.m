@interface INInteractionDonationQueue
@end

@implementation INInteractionDonationQueue

uint64_t ___INInteractionDonationQueue_block_invoke()
{
  _INInteractionDonationQueue_queue = (uint64_t)dispatch_queue_create("com.apple.intents.interaction.donation", 0);

  return MEMORY[0x1F41817F8]();
}

@end