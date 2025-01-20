@interface CTLazuliChatBotOrgNameEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotOrgNameEntry:(id)a3;
- (CTLazuliChatBotOrgNameEntry)initWithCoder:(id)a3;
- (CTLazuliChatBotOrgNameEntry)initWithReflection:(const void *)a3;
- (NSString)displayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CTLazuliChatBotOrgNameEntry

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotOrgNameEntry *)self displayName];
  [v3 appendFormat:@", displayName = %@", v4];

  int64_t v5 = [(CTLazuliChatBotOrgNameEntry *)self type];
  int64_t v7 = [(CTLazuliChatBotOrgNameEntry *)self type];
  [v3 appendFormat:@", type = [%ld - %s]", v5, print_CTLazuliChatBotOrgNameType(&v7)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotOrgNameEntry:(id)a3
{
  id v7 = a3;
  v8 = [(CTLazuliChatBotOrgNameEntry *)self displayName];
  if (!v8)
  {
    v3 = [v7 displayName];
    if (!v3)
    {
      int v9 = 0;
LABEL_7:
      int64_t v11 = [(CTLazuliChatBotOrgNameEntry *)self type];
      BOOL v10 = v11 == [v7 type];
      if (!v9) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  v4 = [(CTLazuliChatBotOrgNameEntry *)self displayName];
  int64_t v5 = [v7 displayName];
  if ([v4 isEqualToString:v5])
  {
    int v9 = 1;
    goto LABEL_7;
  }
  BOOL v10 = 0;
LABEL_8:

LABEL_9:
  if (!v8) {

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatBotOrgNameEntry *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotOrgNameEntry *)self isEqualToCTLazuliChatBotOrgNameEntry:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotOrgNameEntry allocWithZone:a3];
  [(CTLazuliChatBotOrgNameEntry *)v4 setDisplayName:self->_displayName];
  [(CTLazuliChatBotOrgNameEntry *)v4 setType:self->_type];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_displayName forKey:@"kDisplayNameKey"];
  v4 = [NSNumber numberWithLong:self->_type];
  [v5 encodeObject:v4 forKey:@"kTypeKey"];
}

- (CTLazuliChatBotOrgNameEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotOrgNameEntry;
  id v5 = [(CTLazuliChatBotOrgNameEntry *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDisplayNameKey"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTypeKey"];
    v5->_type = [v8 longValue];
  }
  return v5;
}

- (CTLazuliChatBotOrgNameEntry)initWithReflection:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotOrgNameEntry;
  id v4 = [(CTLazuliChatBotOrgNameEntry *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    if (*((unsigned char *)a3 + 24))
    {
      if (*((char *)a3 + 23) >= 0) {
        uint64_t v6 = a3;
      }
      else {
        uint64_t v6 = *(const void **)a3;
      }
      uint64_t v7 = [NSString stringWithUTF8String:v6];
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v7;
    }
    else
    {
      displayName = v4->_displayName;
      v4->_displayName = 0;
    }

    v5->_type = encode_CTLazuliChatBotMediaLabelType((_DWORD *)a3 + 8);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end