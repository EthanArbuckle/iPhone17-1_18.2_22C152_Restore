@interface AFTipKitDonatorQueue
@end

@implementation AFTipKitDonatorQueue

void ___AFTipKitDonatorQueue_block_invoke()
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("AFTipKitDonatorQueue", v0);
  v2 = (void *)_AFTipKitDonatorQueue_queue;
  _AFTipKitDonatorQueue_queue = (uint64_t)v1;
}

@end