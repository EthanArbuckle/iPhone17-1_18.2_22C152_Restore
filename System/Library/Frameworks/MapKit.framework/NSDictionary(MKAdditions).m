@interface NSDictionary(MKAdditions)
- (uint64_t)_mapkit_writeBinaryPlist:()MKAdditions atomically:;
@end

@implementation NSDictionary(MKAdditions)

- (uint64_t)_mapkit_writeBinaryPlist:()MKAdditions atomically:
{
  v6 = (void *)MEMORY[0x1E4F28F98];
  uint64_t v12 = 0;
  id v7 = a3;
  v8 = [v6 dataWithPropertyList:a1 format:200 options:0 error:&v12];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 writeToFile:v7 atomically:a4];
  }
  else
  {
    NSLog(&cfstr_FailedToSerial.isa, v7, v12);
    uint64_t v10 = 0;
  }

  return v10;
}

@end