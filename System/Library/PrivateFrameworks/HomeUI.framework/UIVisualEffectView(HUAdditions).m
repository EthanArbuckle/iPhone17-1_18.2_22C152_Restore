@interface UIVisualEffectView(HUAdditions)
- (void)hu_configureEffectForIdentifier:()HUAdditions;
@end

@implementation UIVisualEffectView(HUAdditions)

- (void)hu_configureEffectForIdentifier:()HUAdditions
{
  id v6 = a3;
  if ([v6 isEqualToString:@"HUSharedVisualEffectIdentifierTileOff"])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F43020], "hu_gridCellBackgroundOffEffects");
LABEL_5:
    v5 = (void *)v4;
    [a1 setBackgroundEffects:v4];

    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"HUSharedVisualEffectIdentifierTileOn"])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F43020], "hu_gridCellBackgroundOnEffects");
    goto LABEL_5;
  }
  NSLog(&cfstr_UnexpectedVisu.isa, v6);
LABEL_7:
}

@end