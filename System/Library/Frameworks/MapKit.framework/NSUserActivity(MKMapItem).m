@interface NSUserActivity(MKMapItem)
- (id)mapItem;
- (void)setMapItem:()MKMapItem;
@end

@implementation NSUserActivity(MKMapItem)

- (id)mapItem
{
  v1 = [a1 _internalUserActivity];
  v2 = [v1 objectForIdentifier:@"UAMKMapItemPayload"];
  if (!v2)
  {
    v3 = [v1 payloadForIdentifier:@"UAMKMapItemPayload"];
    if (v3)
    {
      uint64_t v6 = 0;
      v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v6];
      if (v4)
      {
        v2 = +[MKMapItem mapItemWithDictionary:v4];
        if (!v2) {
          NSLog(&cfstr_FailedToInitia.isa);
        }
        [v1 setPayload:v3 object:v2 identifier:@"UAMKMapItemPayload"];
      }
      else
      {
        NSLog(&cfstr_FailedToDeseri.isa, v6);
        v2 = 0;
      }
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

- (void)setMapItem:()MKMapItem
{
  id v7 = a3;
  v4 = [a1 _internalUserActivity];
  uint64_t v5 = [v4 objectForIdentifier:@"UAMKMapItemPayload"];
  uint64_t v6 = (void *)v5;
  if (v7)
  {
    [v4 setPayloadIdentifier:@"UAMKMapItemPayload" object:v7 withBlock:&__block_literal_global_102];
    objc_msgSend(a1, "_mapkit_populateFieldsForDonationOfMapItem:", v7);
  }
  else
  {
    if (v5) {
      [v4 setPayloadIdentifier:@"UAMKMapItemPayload" object:0 withBlock:0];
    }
    objc_msgSend(a1, "_mapkit_clearMapItemDonationFields");
  }
}

@end