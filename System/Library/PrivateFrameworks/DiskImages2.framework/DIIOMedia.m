@interface DIIOMedia
- (DIIOMedia)initWithDevName:(id)a3 error:(id *)a4;
- (NSString)BSDName;
- (id)copyBlockDeviceWithError:(id *)a3;
@end

@implementation DIIOMedia

- (DIIOMedia)initWithDevName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  mach_port_t v7 = *MEMORY[0x263F0EC88];
  id v8 = [v6 lastPathComponent];
  CFDictionaryRef v9 = IOBSDNameMatching(v7, 0, (const char *)[v8 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(v7, v9);

  if (MatchingService)
  {
    v14.receiver = self;
    v14.super_class = (Class)DIIOMedia;
    self = [(DIIOObject *)&v14 initWithIOObject:MatchingService];
    v11 = self;
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Failed to find IO media entry for %@", v6];
    v11 = +[DIError nilWithEnumValue:153 verboseInfo:v12 error:a4];
  }
  return v11;
}

- (NSString)BSDName
{
  id v2 = [(DIIOObject *)self copyPropertyWithClass:objc_opt_class() key:@"BSD Name"];
  return (NSString *)v2;
}

- (id)copyBlockDeviceWithError:(id *)a3
{
  v3 = [(DIIOObject *)self ioObjectWithClassName:@"IOBlockStorageDevice" iterateParent:1 error:a3];
  v4 = [(DIIOObject *)[DIBlockDevice alloc] initWithDIIOObject:v3];

  return v4;
}

@end