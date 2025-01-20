@interface AVTError
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation AVTError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"AVTAvatarUIErrorDomain" code:a3 userInfo:a4];
}

@end