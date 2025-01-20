@interface NSUUID(PKDrawingUUID)
- (id)AES128Key;
@end

@implementation NSUUID(PKDrawingUUID)

- (id)AES128Key
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:16];

  return v1;
}

@end