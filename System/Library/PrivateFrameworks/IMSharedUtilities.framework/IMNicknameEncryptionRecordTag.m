@interface IMNicknameEncryptionRecordTag
+ (id)tagWithDataRepresentation:(id)a3 error:(id *)a4;
+ (id)tagWithStringRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqualToTag:(id)a3 error:(id *)a4;
@end

@implementation IMNicknameEncryptionRecordTag

+ (id)tagWithDataRepresentation:(id)a3 error:(id *)a4
{
  return (id)[a1 _tagWithDataRepresentation:a3 length:16 error:a4];
}

+ (id)tagWithStringRepresentation:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel__tagWithStringRepresentation_length_error_);
}

- (BOOL)isEqualToTag:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)IMNicknameEncryptionRecordTag;
  return [(IMNicknameEncryptionTag *)&v5 isEqualToTag:a3 error:a4];
}

@end