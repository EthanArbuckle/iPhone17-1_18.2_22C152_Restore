@interface _EXExtensionIdentity(MKRemoteUIExtras)
+ (id)mkRemoteUIIdentity;
@end

@implementation _EXExtensionIdentity(MKRemoteUIExtras)

+ (id)mkRemoteUIIdentity
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F25880] extensionPointIdentifierQuery:@"com.apple.mapkit.private.RemoteUI"];
  v5[0] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  v2 = [MEMORY[0x1E4F25888] executeQueries:v1];
  v3 = [v2 firstObject];

  return v3;
}

@end