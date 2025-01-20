@interface PFUbiquityPeerRange
- (void)loadFromBaselineDictionary:(void *)result;
@end

@implementation PFUbiquityPeerRange

- (void)loadFromBaselineDictionary:(void *)result
{
  if (result)
  {
    v3 = result;
    objc_msgSend(result, "setPeerStart:", objc_msgSend(a2, "objectForKey:", @"peerStart"));
    objc_msgSend(v3, "setPeerEnd:", objc_msgSend(a2, "objectForKey:", @"peerEnd"));
    objc_msgSend(v3, "setEnd:", objc_msgSend(a2, "objectForKey:", @"rangeStart"));
    objc_msgSend(v3, "setStart:", objc_msgSend(a2, "objectForKey:", @"rangeEnd"));
    uint64_t v4 = [a2 valueForKey:@"entityName"];
    return (void *)[v3 setPeerEntityName:v4];
  }
  return result;
}

@end