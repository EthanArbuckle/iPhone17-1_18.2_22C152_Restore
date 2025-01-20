@interface NSString(FUFlightViewController)
- (id)localizedTerminalOrGateID;
@end

@implementation NSString(FUFlightViewController)

- (id)localizedTerminalOrGateID
{
  v2 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  v3 = [v2 invertedSet];

  if ([a1 rangeOfCharacterFromSet:v3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [a1 integerValue];
    if ((unint64_t)(v4 - 1) <= 0x3E6)
    {
      v5 = (void *)MEMORY[0x263F08A30];
      v6 = [NSNumber numberWithInteger:v4];
      id v7 = [v5 localizedStringFromNumber:v6 numberStyle:0];

      if ([v7 length]) {
        goto LABEL_6;
      }
    }
  }
  id v7 = a1;
LABEL_6:

  return v7;
}

@end