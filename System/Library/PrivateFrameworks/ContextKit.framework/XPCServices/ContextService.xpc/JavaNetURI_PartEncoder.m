@interface JavaNetURI_PartEncoder
+ (const)__metadata;
- (BOOL)isRetainedWithChar:(unsigned __int16)a3;
- (JavaNetURI_PartEncoder)initWithNSString:(id)a3;
- (void)dealloc;
@end

@implementation JavaNetURI_PartEncoder

- (JavaNetURI_PartEncoder)initWithNSString:(id)a3
{
  return self;
}

- (BOOL)isRetainedWithChar:(unsigned __int16)a3
{
  if (!JavaNetURI_UNRESERVED_) {
    goto LABEL_12;
  }
  uint64_t v4 = a3;
  if (objc_msgSend(JavaNetURI_UNRESERVED_, "indexOf:") != -1) {
    return 1;
  }
  if (!JavaNetURI_PUNCTUATION_) {
    goto LABEL_12;
  }
  if ([JavaNetURI_PUNCTUATION_ indexOf:v4] != -1) {
    return 1;
  }
  extraLegalCharacters = self->extraLegalCharacters_;
  if (!extraLegalCharacters) {
LABEL_12:
  }
    JreThrowNullPointerException();
  if ([(NSString *)extraLegalCharacters indexOf:v4] != -1) {
    return 1;
  }
  return v4 >= 0x80
      && !JavaLangCharacter_isSpaceCharWithChar_(v4)
      && !JavaLangCharacter_isISOControlWithChar_(v4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetURI_PartEncoder;
  [(JavaNetURI_PartEncoder *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046A108;
}

@end