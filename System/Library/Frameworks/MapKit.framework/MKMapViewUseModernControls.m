@interface MKMapViewUseModernControls
@end

@implementation MKMapViewUseModernControls

uint64_t ___MKMapViewUseModernControls_block_invoke()
{
  uint64_t result = _MKLinkedOnOrAfterReleaseSet(2824);
  if (result) {
    uint64_t result = GEOConfigGetBOOL();
  }
  byte_1E9153FDB = result;
  return result;
}

@end