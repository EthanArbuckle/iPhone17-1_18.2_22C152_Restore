@interface CTLazuliGroupChatSubject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliGroupChatSubject:(id)a3;
- (CTLazuliGroupChatSubject)initWithCoder:(id)a3;
- (CTLazuliGroupChatSubject)initWithReflection:(const void *)a3;
- (NSString)displayString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayString:(id)a3;
@end

@implementation CTLazuliGroupChatSubject

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliGroupChatSubject *)self displayString];
  [v3 appendFormat:@", displayString = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatSubject:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliGroupChatSubject *)self displayString];
  v6 = [v4 displayString];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliGroupChatSubject *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliGroupChatSubject *)self isEqualToCTLazuliGroupChatSubject:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliGroupChatSubject allocWithZone:a3];
  [(CTLazuliGroupChatSubject *)v4 setDisplayString:self->_displayString];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliGroupChatSubject)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatSubject;
  v5 = [(CTLazuliGroupChatSubject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDisplayStringKey"];
    displayString = v5->_displayString;
    v5->_displayString = (NSString *)v6;
  }
  return v5;
}

- (CTLazuliGroupChatSubject)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatSubject;
  id v4 = [(CTLazuliGroupChatSubject *)&v9 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    displayString = v4->_displayString;
    v4->_displayString = (NSString *)v6;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end