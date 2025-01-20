@interface CNPostalAddress(CalLocalizedAddress)
- (CalLocation)CalLocation;
- (id)formattedAddressStrings;
- (uint64_t)formattedAddressString;
@end

@implementation CNPostalAddress(CalLocalizedAddress)

- (uint64_t)formattedAddressString
{
  return [MEMORY[0x1E4F1BA88] stringFromPostalAddress:a1 style:0];
}

- (id)formattedAddressStrings
{
  v1 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:a1 style:0];
  v2 = [v1 componentsSeparatedByString:@"\n"];

  return v2;
}

- (CalLocation)CalLocation
{
  v2 = objc_alloc_init(CalLocation);
  v3 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:a1 style:0];
  [(CalLocation *)v2 setAddress:v3];

  [(CalLocation *)v2 setType:5];

  return v2;
}

@end