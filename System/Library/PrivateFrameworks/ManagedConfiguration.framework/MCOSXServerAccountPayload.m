@interface MCOSXServerAccountPayload
+ (id)typeStrings;
- (MCOSXServerAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
@end

@implementation MCOSXServerAccountPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.osxserver.account"];
}

- (MCOSXServerAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MCOSXServerAccountPayload;
  return [(MCPayload *)&v6 initWithDictionary:a3 profile:a4 outError:a5];
}

@end