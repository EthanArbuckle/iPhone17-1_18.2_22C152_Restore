@interface CLPlacemark(AssistantCardService)
- (id)acs_formattedNameOrStreetAddress;
@end

@implementation CLPlacemark(AssistantCardService)

- (id)acs_formattedNameOrStreetAddress
{
  v2 = [a1 name];
  if (![v2 length])
  {

LABEL_5:
    v4 = [a1 subThoroughfare];
    if ([v4 length])
    {
      v5 = [a1 subThoroughfare];
    }
    else
    {
      v5 = &stru_26D3AA9F8;
    }

    v6 = [a1 thoroughfare];
    if ([v6 length])
    {
      v7 = [a1 thoroughfare];
    }
    else
    {
      v7 = &stru_26D3AA9F8;
    }

    v3 = [NSString stringWithFormat:@"%@ %@", v5, v7];

    goto LABEL_12;
  }
  v3 = [a1 name];

  if (!v3) {
    goto LABEL_5;
  }
LABEL_12:
  return v3;
}

@end