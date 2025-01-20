@interface HDHRAFibBurdenBiomeFocusModeDeterminer
- (id)isFocusModeOn;
@end

@implementation HDHRAFibBurdenBiomeFocusModeDeterminer

- (id)isFocusModeOn
{
  return (id)MEMORY[0x1F41216B8](self, a2);
}

@end