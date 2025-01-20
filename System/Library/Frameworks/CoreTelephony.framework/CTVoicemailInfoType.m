@interface CTVoicemailInfoType
+ (BOOL)supportsSecureCoding;
- (BOOL)available;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTVoicemailInfoType:(id)a3;
- (BOOL)isNetworkOriginated;
- (BOOL)isVoiceMailMWI;
- (CTVoicemailInfoType)init;
- (CTVoicemailInfoType)initWithCoder:(id)a3;
- (CTVoicemailInfoType)initWithParam:(id)a3 available:(BOOL)a4 count:(id)a5 isNetworkOriginated:(BOOL)a6 isVoiceMailMWI:(BOOL)a7;
- (NSNumber)count;
- (NSString)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setCount:(id)a3;
- (void)setIsNetworkOriginated:(BOOL)a3;
- (void)setIsVoiceMailMWI:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation CTVoicemailInfoType

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTVoicemailInfoType *)self url];
  [v3 appendFormat:@", url=%{sensitive}@", v4];

  v5 = [(CTVoicemailInfoType *)self count];
  [v3 appendFormat:@", count=%@", v5];

  if ([(CTVoicemailInfoType *)self isNetworkOriginated]) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  [v3 appendFormat:@", isNetworkOriginated=%s", v6];
  if ([(CTVoicemailInfoType *)self isVoiceMailMWI]) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  [v3 appendFormat:@", isVoiceMailMWI=%s", v7];
  if ([(CTVoicemailInfoType *)self available]) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  [v3 appendFormat:@", available=%s", v8];
  [v3 appendString:@">"];

  return v3;
}

- (CTVoicemailInfoType)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTVoicemailInfoType;
  v2 = [(CTVoicemailInfoType *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(CTVoicemailInfoType *)v2 setUrl:v3];

    v4 = objc_opt_new();
    [(CTVoicemailInfoType *)v2 setCount:v4];

    [(CTVoicemailInfoType *)v2 setIsNetworkOriginated:0];
    [(CTVoicemailInfoType *)v2 setIsVoiceMailMWI:0];
    [(CTVoicemailInfoType *)v2 setAvailable:0];
  }
  return v2;
}

- (CTVoicemailInfoType)initWithParam:(id)a3 available:(BOOL)a4 count:(id)a5 isNetworkOriginated:(BOOL)a6 isVoiceMailMWI:(BOOL)a7
{
  id v12 = a3;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CTVoicemailInfoType;
  v14 = [(CTVoicemailInfoType *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    url = v14->_url;
    v14->_url = (NSString *)v15;

    uint64_t v17 = [v13 copy];
    count = v14->_count;
    v14->_count = (NSNumber *)v17;

    v14->_isNetworkOriginated = a6;
    v14->_isVoiceMailMWI = a7;
    v14->_available = a4;
  }

  return v14;
}

- (BOOL)isEqualToCTVoicemailInfoType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(CTVoicemailInfoType *)self url];
    objc_super v6 = [v4 url];
    char v7 = [v5 isEqualToString:v6];
    if ((v7 & 1) == 0)
    {
      id v13 = [(CTVoicemailInfoType *)self url];
      if (v13)
      {
        LOBYTE(v12) = 0;
LABEL_24:

        goto LABEL_25;
      }
      v16 = [v4 url];
      if (v16)
      {

        LOBYTE(v12) = 0;
LABEL_23:
        id v13 = 0;
        goto LABEL_24;
      }
    }
    v8 = [(CTVoicemailInfoType *)self count];
    v9 = [v4 count];
    if (v8 != v9)
    {
      v10 = [(CTVoicemailInfoType *)self count];
      if (v10) {
        goto LABEL_14;
      }
      v11 = [v4 count];
      if (v11)
      {
        LOBYTE(v12) = 0;
        goto LABEL_21;
      }
    }
    int v14 = [(CTVoicemailInfoType *)self isNetworkOriginated];
    if (v14 == [v4 isNetworkOriginated])
    {
      int v15 = [(CTVoicemailInfoType *)self isVoiceMailMWI];
      if (v15 == [v4 isVoiceMailMWI])
      {
        BOOL v17 = [(CTVoicemailInfoType *)self available];
        int v12 = v17 ^ [v4 available] ^ 1;
        if (v8 == v9) {
          goto LABEL_22;
        }
        v11 = 0;
LABEL_21:

LABEL_22:
        if (v7)
        {
LABEL_25:

          goto LABEL_26;
        }
        goto LABEL_23;
      }
    }
    if (v8 == v9)
    {
      LOBYTE(v12) = 0;
      goto LABEL_22;
    }
    v10 = 0;
LABEL_14:

    LOBYTE(v12) = 0;
    if (v7) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  LOBYTE(v12) = 0;
LABEL_26:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTVoicemailInfoType *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTVoicemailInfoType *)self isEqualToCTVoicemailInfoType:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTVoicemailInfoType allocWithZone:a3];
  BOOL available = self->_available;
  url = self->_url;
  count = self->_count;
  BOOL isNetworkOriginated = self->_isNetworkOriginated;
  BOOL isVoiceMailMWI = self->_isVoiceMailMWI;

  return [(CTVoicemailInfoType *)v4 initWithParam:url available:available count:count isNetworkOriginated:isNetworkOriginated isVoiceMailMWI:isVoiceMailMWI];
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_count forKey:@"count"];
  [v5 encodeBool:self->_isNetworkOriginated forKey:@"is_network_originated"];
  [v5 encodeBool:self->_isVoiceMailMWI forKey:@"is_voicemail_MWI"];
  [v5 encodeBool:self->_available forKey:@"available"];
}

- (CTVoicemailInfoType)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTVoicemailInfoType;
  id v5 = [(CTVoicemailInfoType *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"count"];
    count = v5->_count;
    v5->_count = (NSNumber *)v8;

    v5->_BOOL isNetworkOriginated = [v4 decodeBoolForKey:@"is_network_originated"];
    v5->_BOOL isVoiceMailMWI = [v4 decodeBoolForKey:@"is_voicemail_MWI"];
    v5->_BOOL available = [v4 decodeBoolForKey:@"available"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)available
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_BOOL available = a3;
}

- (NSNumber)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
}

- (BOOL)isNetworkOriginated
{
  return self->_isNetworkOriginated;
}

- (void)setIsNetworkOriginated:(BOOL)a3
{
  self->_BOOL isNetworkOriginated = a3;
}

- (BOOL)isVoiceMailMWI
{
  return self->_isVoiceMailMWI;
}

- (void)setIsVoiceMailMWI:(BOOL)a3
{
  self->_BOOL isVoiceMailMWI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end