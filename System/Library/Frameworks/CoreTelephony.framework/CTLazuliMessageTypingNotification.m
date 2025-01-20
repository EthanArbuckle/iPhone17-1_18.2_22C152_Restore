@interface CTLazuliMessageTypingNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageTypingNotification:(id)a3;
- (CTLazuliMessageTypingNotification)initWithCoder:(id)a3;
- (CTLazuliMessageTypingNotification)initWithReflection:(const void *)a3;
- (NSNumber)forTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setForTime:(id)a3;
@end

@implementation CTLazuliMessageTypingNotification

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageTypingNotification *)self forTime];
  [v3 appendFormat:@", forTime = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageTypingNotification:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliMessageTypingNotification *)self forTime];
  if (!v6)
  {
    v3 = [v5 forTime];
    if (!v3)
    {
      BOOL v10 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v7 = [(CTLazuliMessageTypingNotification *)self forTime];
  uint64_t v8 = [v7 longValue];
  v9 = [v5 forTime];
  BOOL v10 = v8 == [v9 longValue];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliMessageTypingNotification *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageTypingNotification *)self isEqualToCTLazuliMessageTypingNotification:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliMessageTypingNotification allocWithZone:a3];
  [(CTLazuliMessageTypingNotification *)v4 setForTime:self->_forTime];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliMessageTypingNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageTypingNotification;
  id v5 = [(CTLazuliMessageTypingNotification *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kForTimeKey"];
    forTime = v5->_forTime;
    v5->_forTime = (NSNumber *)v6;
  }
  return v5;
}

- (CTLazuliMessageTypingNotification)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageTypingNotification;
  id v4 = [(CTLazuliMessageTypingNotification *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    if (*((unsigned char *)a3 + 8))
    {
      uint64_t v6 = [NSNumber numberWithUnsignedLong:*(void *)a3];
      forTime = v5->_forTime;
      v5->_forTime = (NSNumber *)v6;
    }
    else
    {
      forTime = v4->_forTime;
      v4->_forTime = 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)forTime
{
  return self->_forTime;
}

- (void)setForTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end