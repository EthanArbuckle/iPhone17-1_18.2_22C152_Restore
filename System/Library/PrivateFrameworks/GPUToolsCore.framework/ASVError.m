@interface ASVError
+ (id)errorWithCode:(unsigned int)a3 localizedDescription:(id)a4;
- (id)localizedDescription;
@end

@implementation ASVError

+ (id)errorWithCode:(unsigned int)a3 localizedDescription:(id)a4
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F08320];
  v6[0] = a4;
  return +[ASVError errorWithDomain:code:userInfo:](ASVError, "errorWithDomain:code:userInfo:", @"ASV", a3, [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (id)localizedDescription
{
  v3 = (void *)[(ASVError *)self userInfo];
  if (!v3 || (id result = (id)[v3 objectForKey:*MEMORY[0x263F08320]]) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)ASVError;
    return [(ASVError *)&v5 localizedDescription];
  }
  return result;
}

@end