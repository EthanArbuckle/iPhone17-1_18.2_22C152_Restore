@interface _NSFileProviderEmptyItemVersion
+ (BOOL)supportsSecureCoding;
+ (id)emptyVersion;
- (_NSFileProviderEmptyItemVersion)init;
- (_NSFileProviderEmptyItemVersion)initWithCoder:(id)a3;
- (id)contentVersion;
- (id)metadataVersion;
@end

@implementation _NSFileProviderEmptyItemVersion

+ (id)emptyVersion
{
  if (emptyVersion_onceToken != -1) {
    dispatch_once(&emptyVersion_onceToken, &__block_literal_global_111);
  }
  v2 = (void *)emptyVersion_instance;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSFileProviderEmptyItemVersion)init
{
  v3 = [MEMORY[0x1E4F1C9B8] data];
  v4 = [MEMORY[0x1E4F1C9B8] data];
  v7.receiver = self;
  v7.super_class = (Class)_NSFileProviderEmptyItemVersion;
  v5 = [(NSFileProviderItemVersion *)&v7 initWithContentVersion:v3 metadataVersion:v4];

  return v5;
}

- (_NSFileProviderEmptyItemVersion)initWithCoder:(id)a3
{
  v4 = +[_NSFileProviderEmptyItemVersion emptyVersion];

  return v4;
}

- (id)contentVersion
{
  return (id)[MEMORY[0x1E4F1C9B8] data];
}

- (id)metadataVersion
{
  return (id)[MEMORY[0x1E4F1C9B8] data];
}

@end