@interface IMNicknameEncryptionFieldTag
+ (id)tagWithDataRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqualToTag:(id)a3 error:(id *)a4;
@end

@implementation IMNicknameEncryptionFieldTag

+ (id)tagWithDataRepresentation:(id)a3 error:(id *)a4
{
  return (id)[a1 _tagWithDataRepresentation:a3 length:32 error:a4];
}

- (BOOL)isEqualToTag:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)IMNicknameEncryptionFieldTag;
  return [(IMNicknameEncryptionTag *)&v5 isEqualToTag:a3 error:a4];
}

@end