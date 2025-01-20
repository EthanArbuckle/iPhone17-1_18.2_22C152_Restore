@interface MPModelRadioStation
@end

@implementation MPModelRadioStation

void __76__MPModelRadioStation_BehaviorMusicSharePlayAdditions__msp_shortDescription__block_invoke(uint64_t a1)
{
  v2 = NSString;
  v3 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) name];
  v4 = [v2 stringWithFormat:@" name='%@'", v5];
  objc_msgSend(v3, "insertString:atIndex:", v4, objc_msgSend(*(id *)(a1 + 32), "length") - 1);
}

@end