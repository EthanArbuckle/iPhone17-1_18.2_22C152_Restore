@interface CTLazuliGroupChatCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)autoAcceptGroupChat;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliGroupChatCapabilities:(id)a3;
- (BOOL)supportsComposingIndicator;
- (CTLazuliGroupChatCapabilities)initWithCoder:(id)a3;
- (CTLazuliGroupChatCapabilities)initWithReflection:(const void *)a3;
- (NSNumber)maxGroupSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoAcceptGroupChat:(BOOL)a3;
- (void)setMaxGroupSize:(id)a3;
- (void)setSupportsComposingIndicator:(BOOL)a3;
@end

@implementation CTLazuliGroupChatCapabilities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  [v3 appendFormat:@", autoAcceptGroupChat = %d", -[CTLazuliGroupChatCapabilities autoAcceptGroupChat](self, "autoAcceptGroupChat")];
  v4 = [(CTLazuliGroupChatCapabilities *)self maxGroupSize];
  [v3 appendFormat:@", maxGroupSize = %@", v4];

  [v3 appendFormat:@", supportsComposingIndicator = %d", -[CTLazuliGroupChatCapabilities supportsComposingIndicator](self, "supportsComposingIndicator")];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatCapabilities:(id)a3
{
  id v7 = a3;
  int v8 = [(CTLazuliGroupChatCapabilities *)self autoAcceptGroupChat];
  if (v8 != [v7 autoAcceptGroupChat])
  {
    LOBYTE(v9) = 0;
    goto LABEL_14;
  }
  v10 = [(CTLazuliGroupChatCapabilities *)self maxGroupSize];
  if (v10 || ([v7 maxGroupSize], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = [(CTLazuliGroupChatCapabilities *)self maxGroupSize];
    uint64_t v11 = [v4 longValue];
    v5 = [v7 maxGroupSize];
    if (v11 != [v5 longValue])
    {
      LOBYTE(v9) = 0;
LABEL_10:

      goto LABEL_11;
    }
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  BOOL v13 = [(CTLazuliGroupChatCapabilities *)self supportsComposingIndicator];
  int v9 = v13 ^ [v7 supportsComposingIndicator] ^ 1;
  if (v12) {
    goto LABEL_10;
  }
LABEL_11:
  if (!v10) {

  }
LABEL_14:
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliGroupChatCapabilities *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliGroupChatCapabilities *)self isEqualToCTLazuliGroupChatCapabilities:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliGroupChatCapabilities allocWithZone:a3];
  [(CTLazuliGroupChatCapabilities *)v4 setAutoAcceptGroupChat:self->_autoAcceptGroupChat];
  [(CTLazuliGroupChatCapabilities *)v4 setMaxGroupSize:self->_maxGroupSize];
  [(CTLazuliGroupChatCapabilities *)v4 setSupportsComposingIndicator:self->_supportsComposingIndicator];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->_autoAcceptGroupChat forKey:@"kAutoAcceptGroupChatKey"];
  [v4 encodeObject:self->_maxGroupSize forKey:@"kMaxGroupSizeKey"];
  [v4 encodeBool:self->_supportsComposingIndicator forKey:@"kSupportsComposingIndicatorKey"];
}

- (CTLazuliGroupChatCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatCapabilities;
  v5 = [(CTLazuliGroupChatCapabilities *)&v9 init];
  if (v5)
  {
    v5->_autoAcceptGroupChat = [v4 decodeBoolForKey:@"kAutoAcceptGroupChatKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMaxGroupSizeKey"];
    maxGroupSize = v5->_maxGroupSize;
    v5->_maxGroupSize = (NSNumber *)v6;

    v5->_supportsComposingIndicator = [v4 decodeBoolForKey:@"kSupportsComposingIndicatorKey"];
  }

  return v5;
}

- (CTLazuliGroupChatCapabilities)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatCapabilities;
  id v4 = [(CTLazuliGroupChatCapabilities *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_autoAcceptGroupChat = *(unsigned char *)a3;
    if (*((unsigned char *)a3 + 16))
    {
      uint64_t v6 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 1)];
      maxGroupSize = v5->_maxGroupSize;
      v5->_maxGroupSize = (NSNumber *)v6;
    }
    else
    {
      maxGroupSize = v4->_maxGroupSize;
      v4->_maxGroupSize = 0;
    }

    v5->_supportsComposingIndicator = *((unsigned char *)a3 + 24);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)autoAcceptGroupChat
{
  return self->_autoAcceptGroupChat;
}

- (void)setAutoAcceptGroupChat:(BOOL)a3
{
  self->_autoAcceptGroupChat = a3;
}

- (NSNumber)maxGroupSize
{
  return self->_maxGroupSize;
}

- (void)setMaxGroupSize:(id)a3
{
}

- (BOOL)supportsComposingIndicator
{
  return self->_supportsComposingIndicator;
}

- (void)setSupportsComposingIndicator:(BOOL)a3
{
  self->_supportsComposingIndicator = a3;
}

- (void).cxx_destruct
{
}

@end