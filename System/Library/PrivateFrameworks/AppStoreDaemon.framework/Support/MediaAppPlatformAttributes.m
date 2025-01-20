@interface MediaAppPlatformAttributes
@end

@implementation MediaAppPlatformAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end