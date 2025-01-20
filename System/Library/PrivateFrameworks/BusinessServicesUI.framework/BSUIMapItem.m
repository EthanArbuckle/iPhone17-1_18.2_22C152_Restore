@interface BSUIMapItem
- (id)_bestBrandIconURLForSize:(id *)a1 allowSmaller:(uint64_t)a2;
- (id)_bestNavbarBrandIconURLForSize:(id *)a1 allowSmaller:(uint64_t)a2;
- (id)_localizedResponseTime;
- (id)_navBackgroundbrandColor;
- (id)_navTintBrandColor;
- (id)initWithMKMapItem:(id *)a1;
- (id)messageBusinessHours;
- (id)name;
- (id)phoneNumber;
- (id)timeZone;
- (id)url;
- (uint64_t)_isMessageIDVerified;
- (void)makePlacecardViewController;
@end

@implementation BSUIMapItem

- (id)initWithMKMapItem:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BSUIMapItem;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (id)name
{
  if (a1)
  {
    a1 = [a1[1] name];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)phoneNumber
{
  if (a1)
  {
    a1 = [a1[1] phoneNumber];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_localizedResponseTime
{
  if (a1)
  {
    a1 = [a1[1] _localizedResponseTime];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)_isMessageIDVerified
{
  if (result) {
    return [*(id *)(result + 8) _isMessageIDVerified];
  }
  return result;
}

- (id)_navTintBrandColor
{
  if (a1)
  {
    a1 = [a1[1] _navTintBrandColor];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_navBackgroundbrandColor
{
  if (a1)
  {
    a1 = [a1[1] _navBackgroundbrandColor];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)timeZone
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 8) _geoMapItem];
    v2 = [v1 _messageLink];
    v3 = [v2 timeZone];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)messageBusinessHours
{
  if (a1)
  {
    a1 = [a1[1] _messageBusinessHours];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)url
{
  if (a1)
  {
    a1 = [a1[1] url];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_bestBrandIconURLForSize:(id *)a1 allowSmaller:(uint64_t)a2
{
  if (a1)
  {
    objc_msgSend(a1[1], "_bestBrandIconURLForSize:allowSmaller:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)_bestNavbarBrandIconURLForSize:(id *)a1 allowSmaller:(uint64_t)a2
{
  if (a1)
  {
    objc_msgSend(a1[1], "_bestNavbarBrandIconURLForSize:allowSmaller:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)makePlacecardViewController
{
  if (a1)
  {
    a1 = (void *)[objc_alloc(MEMORY[0x263F53FA8]) initWithMapItem:a1[1]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
}

@end