@interface SALCMShowChannel
- (id)_ad_OTTRequestRepresentation;
@end

@implementation SALCMShowChannel

- (id)_ad_OTTRequestRepresentation
{
  v2 = [(SALCMShowChannel *)self channel];
  v3 = objc_msgSend(v2, "ad_OTTModelRepresentation");

  if (v3) {
    id v4 = [objc_alloc((Class)STShowChannelRequest) _initWithChannel:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end