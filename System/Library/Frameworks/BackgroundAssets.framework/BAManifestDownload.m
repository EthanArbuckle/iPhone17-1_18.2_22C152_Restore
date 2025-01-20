@interface BAManifestDownload
+ (BOOL)supportsSecureCoding;
- (BAManifestDownload)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation BAManifestDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAManifestDownload)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BAManifestDownload;
  return [(BAURLDownload *)&v4 copyWithZone:a3];
}

@end