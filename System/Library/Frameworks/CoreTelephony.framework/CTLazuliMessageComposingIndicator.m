@interface CTLazuliMessageComposingIndicator
+ (BOOL)supportsSecureCoding;
- (BOOL)active;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageComposingIndicator:(id)a3;
- (CTLazuliMessageComposingIndicator)initWithCoder:(id)a3;
- (CTLazuliMessageComposingIndicator)initWithReflection:(const void *)a3;
- (NSNumber)refreshTime;
- (NSString)contentType;
- (NSString)lastActive;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setContentType:(id)a3;
- (void)setLastActive:(id)a3;
- (void)setRefreshTime:(id)a3;
@end

@implementation CTLazuliMessageComposingIndicator

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageComposingIndicator *)self refreshTime];
  [v3 appendFormat:@", refreshTime = %@", v4];

  [v3 appendFormat:@", active = %d", -[CTLazuliMessageComposingIndicator active](self, "active")];
  v5 = [(CTLazuliMessageComposingIndicator *)self lastActive];
  [v3 appendFormat:@", lastActive = %@", v5];

  v6 = [(CTLazuliMessageComposingIndicator *)self contentType];
  [v3 appendFormat:@", contentType = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageComposingIndicator:(id)a3
{
  id v7 = a3;
  v8 = [(CTLazuliMessageComposingIndicator *)self refreshTime];
  if (v8 || ([v7 refreshTime], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliMessageComposingIndicator *)self refreshTime];
    uint64_t v9 = [v3 longValue];
    v4 = [v7 refreshTime];
    if (v9 != [v4 longValue])
    {

      char v10 = 0;
      goto LABEL_10;
    }
    int v24 = 1;
  }
  else
  {
    v23 = 0;
    int v24 = 0;
  }
  int v11 = [(CTLazuliMessageComposingIndicator *)self active];
  if (v11 != [v7 active])
  {
    char v10 = 0;
    if ((v24 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v13 = [(CTLazuliMessageComposingIndicator *)self lastActive];
  if (!v13)
  {
    v20 = [v7 lastActive];
    if (!v20)
    {
      v20 = 0;
      char v21 = 0;
      goto LABEL_19;
    }
  }
  v22 = [(CTLazuliMessageComposingIndicator *)self lastActive];
  v5 = [v7 lastActive];
  if ([v22 isEqualToString:v5])
  {
    char v21 = 1;
LABEL_19:
    v14 = [(CTLazuliMessageComposingIndicator *)self contentType];
    if (v14 || ([v7 contentType], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v15 = [(CTLazuliMessageComposingIndicator *)self contentType];
      v16 = [v7 contentType];
      char v10 = [v15 isEqualToString:v16];

      if (v14)
      {

        goto LABEL_26;
      }
      v17 = v19;
    }
    else
    {
      v17 = 0;
      char v10 = 1;
    }

LABEL_26:
    if ((v21 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  char v10 = 0;
LABEL_27:

LABEL_28:
  if (!v13) {

  }
  if (v24)
  {
LABEL_9:
  }
LABEL_10:
  if (!v8) {

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliMessageComposingIndicator *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageComposingIndicator *)self isEqualToCTLazuliMessageComposingIndicator:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliMessageComposingIndicator allocWithZone:a3];
  [(CTLazuliMessageComposingIndicator *)v4 setRefreshTime:self->_refreshTime];
  [(CTLazuliMessageComposingIndicator *)v4 setActive:self->_active];
  [(CTLazuliMessageComposingIndicator *)v4 setLastActive:self->_lastActive];
  [(CTLazuliMessageComposingIndicator *)v4 setContentType:self->_contentType];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_refreshTime forKey:@"kRefreshTimeKey"];
  [v4 encodeBool:self->_active forKey:@"kActiveKey"];
  [v4 encodeObject:self->_lastActive forKey:@"kLastActiveKey"];
  [v4 encodeObject:self->_contentType forKey:@"kContentTypeKey"];
}

- (CTLazuliMessageComposingIndicator)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageComposingIndicator;
  v5 = [(CTLazuliMessageComposingIndicator *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRefreshTimeKey"];
    refreshTime = v5->_refreshTime;
    v5->_refreshTime = (NSNumber *)v6;

    v5->_active = [v4 decodeBoolForKey:@"kActiveKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLastActiveKey"];
    lastActive = v5->_lastActive;
    v5->_lastActive = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kContentTypeKey"];
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v10;
  }
  return v5;
}

- (CTLazuliMessageComposingIndicator)initWithReflection:(const void *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CTLazuliMessageComposingIndicator;
  id v4 = [(CTLazuliMessageComposingIndicator *)&v18 init];
  v5 = v4;
  if (v4)
  {
    if (*((unsigned char *)a3 + 8))
    {
      uint64_t v6 = [NSNumber numberWithUnsignedLong:*(void *)a3];
      refreshTime = v5->_refreshTime;
      v5->_refreshTime = (NSNumber *)v6;
    }
    else
    {
      refreshTime = v4->_refreshTime;
      v4->_refreshTime = 0;
    }

    v5->_active = *((unsigned char *)a3 + 16);
    if (*((unsigned char *)a3 + 48))
    {
      if (*((char *)a3 + 47) >= 0) {
        uint64_t v8 = (char *)a3 + 24;
      }
      else {
        uint64_t v8 = (char *)*((void *)a3 + 3);
      }
      uint64_t v9 = [NSString stringWithUTF8String:v8];
      lastActive = v5->_lastActive;
      v5->_lastActive = (NSString *)v9;
    }
    else
    {
      lastActive = v5->_lastActive;
      v5->_lastActive = 0;
    }

    if (*((unsigned char *)a3 + 80))
    {
      objc_super v13 = (char *)*((void *)a3 + 7);
      v12 = (char *)a3 + 56;
      int v11 = v13;
      if (v12[23] >= 0) {
        v14 = v12;
      }
      else {
        v14 = v11;
      }
      uint64_t v15 = [NSString stringWithUTF8String:v14];
      contentType = v5->_contentType;
      v5->_contentType = (NSString *)v15;
    }
    else
    {
      contentType = v5->_contentType;
      v5->_contentType = 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)refreshTime
{
  return self->_refreshTime;
}

- (void)setRefreshTime:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (NSString)lastActive
{
  return self->_lastActive;
}

- (void)setLastActive:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_lastActive, 0);

  objc_storeStrong((id *)&self->_refreshTime, 0);
}

@end