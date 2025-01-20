@interface PHASERoomCongruenceInterfaceImpl
- (void)setRoomCongruenceParameters:(id)a3;
@end

@implementation PHASERoomCongruenceInterfaceImpl

- (void)setRoomCongruenceParameters:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v4);

  if (LoadSpatialTrackingServiceDylib(void)::onceToken != -1) {
    dispatch_once(&LoadSpatialTrackingServiceDylib(void)::onceToken, &__block_literal_global_3009);
  }
  if (pSTSSetRoomConfigurationDictionary) {
    pSTSSetRoomConfigurationDictionary(cf, 0);
  }
  if (cf) {
    CFRelease(cf);
  }
}

@end