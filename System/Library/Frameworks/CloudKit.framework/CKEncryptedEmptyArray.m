@interface CKEncryptedEmptyArray
- (id)value;
@end

@implementation CKEncryptedEmptyArray

- (id)value
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end