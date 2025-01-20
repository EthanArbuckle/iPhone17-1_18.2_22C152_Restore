@interface NSXPCInterface(GEOAppleMediaServicesProtocol)
+ (id)_geo_GEOAppleMediaServicesProtocolInterface;
@end

@implementation NSXPCInterface(GEOAppleMediaServicesProtocol)

+ (id)_geo_GEOAppleMediaServicesProtocolInterface
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED835F90];
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_mediaResultWithIdentifiers_bundleIdentifiers_type_artworkSize_screenScale_source_completion_ argumentIndex:0 ofReply:1];

  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:sel_mediaResultWithIdentifiers_bundleIdentifiers_type_artworkSize_screenScale_source_completion_ argumentIndex:1 ofReply:1];

  return v0;
}

@end