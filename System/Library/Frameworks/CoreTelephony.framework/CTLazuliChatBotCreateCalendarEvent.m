@interface CTLazuliChatBotCreateCalendarEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotCreateCalendarEvent:(id)a3;
- (CTLazuliChatBotCreateCalendarEvent)initWithCoder:(id)a3;
- (CTLazuliChatBotCreateCalendarEvent)initWithReflection:(const void *)a3;
- (NSString)calDescription;
- (NSString)endTime;
- (NSString)fallbackUrl;
- (NSString)startTime;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCalDescription:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setFallbackUrl:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CTLazuliChatBotCreateCalendarEvent

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotCreateCalendarEvent *)self startTime];
  [v3 appendFormat:@", startTime = %@", v4];

  v5 = [(CTLazuliChatBotCreateCalendarEvent *)self endTime];
  [v3 appendFormat:@", endTime = %@", v5];

  v6 = [(CTLazuliChatBotCreateCalendarEvent *)self title];
  [v3 appendFormat:@", title = %@", v6];

  v7 = [(CTLazuliChatBotCreateCalendarEvent *)self calDescription];
  [v3 appendFormat:@", calDescription = %@", v7];

  v8 = [(CTLazuliChatBotCreateCalendarEvent *)self fallbackUrl];
  [v3 appendFormat:@", fallbackUrl = %@", v8];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCreateCalendarEvent:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotCreateCalendarEvent *)self startTime];
  v6 = [v4 startTime];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CTLazuliChatBotCreateCalendarEvent *)self endTime];
    v8 = [v4 endTime];
    if (![v7 isEqualToString:v8])
    {
      char v10 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v22 = [(CTLazuliChatBotCreateCalendarEvent *)self title];
    v9 = [v4 title];
    if (![v22 isEqualToString:v9])
    {
      char v10 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v20 = [(CTLazuliChatBotCreateCalendarEvent *)self calDescription];
    if (v20 || ([v4 calDescription], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v21 = [(CTLazuliChatBotCreateCalendarEvent *)self calDescription];
      v19 = [v4 calDescription];
      if (!objc_msgSend(v21, "isEqualToString:"))
      {
        char v10 = 0;
        goto LABEL_17;
      }
      int v18 = 1;
    }
    else
    {
      v17 = 0;
      int v18 = 0;
    }
    v11 = [(CTLazuliChatBotCreateCalendarEvent *)self fallbackUrl];
    if (v11 || ([v4 fallbackUrl], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = [(CTLazuliChatBotCreateCalendarEvent *)self fallbackUrl];
      v13 = [v4 fallbackUrl];
      char v10 = [v12 isEqualToString:v13];

      if (v11)
      {

        if (!v18)
        {
LABEL_18:
          if (!v20) {

          }
          goto LABEL_21;
        }
LABEL_17:

        goto LABEL_18;
      }
      v15 = (void *)v16;
    }
    else
    {
      v15 = 0;
      char v10 = 1;
    }

    if ((v18 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  char v10 = 0;
LABEL_23:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotCreateCalendarEvent *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotCreateCalendarEvent *)self isEqualToCTLazuliChatBotCreateCalendarEvent:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotCreateCalendarEvent allocWithZone:a3];
  [(CTLazuliChatBotCreateCalendarEvent *)v4 setStartTime:self->_startTime];
  [(CTLazuliChatBotCreateCalendarEvent *)v4 setEndTime:self->_endTime];
  [(CTLazuliChatBotCreateCalendarEvent *)v4 setTitle:self->_title];
  [(CTLazuliChatBotCreateCalendarEvent *)v4 setCalDescription:self->_calDescription];
  [(CTLazuliChatBotCreateCalendarEvent *)v4 setFallbackUrl:self->_fallbackUrl];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_startTime forKey:@"kStartTimeKey"];
  [v4 encodeObject:self->_endTime forKey:@"kEndTimeKey"];
  [v4 encodeObject:self->_title forKey:@"kTitleKey"];
  [v4 encodeObject:self->_calDescription forKey:@"kCalDescriptionKey"];
  [v4 encodeObject:self->_fallbackUrl forKey:@"kFallbackUrlKey"];
}

- (CTLazuliChatBotCreateCalendarEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliChatBotCreateCalendarEvent;
  v5 = [(CTLazuliChatBotCreateCalendarEvent *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kStartTimeKey"];
    startTime = v5->_startTime;
    v5->_startTime = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kEndTimeKey"];
    endTime = v5->_endTime;
    v5->_endTime = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCalDescriptionKey"];
    calDescription = v5->_calDescription;
    v5->_calDescription = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFallbackUrlKey"];
    fallbackUrl = v5->_fallbackUrl;
    v5->_fallbackUrl = (NSString *)v14;
  }
  return v5;
}

- (CTLazuliChatBotCreateCalendarEvent)initWithReflection:(const void *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CTLazuliChatBotCreateCalendarEvent;
  id v4 = [(CTLazuliChatBotCreateCalendarEvent *)&v24 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    startTime = v4->_startTime;
    v4->_startTime = (NSString *)v6;

    if (*((char *)a3 + 47) >= 0) {
      uint64_t v8 = (char *)a3 + 24;
    }
    else {
      uint64_t v8 = (char *)*((void *)a3 + 3);
    }
    uint64_t v9 = [NSString stringWithUTF8String:v8];
    endTime = v4->_endTime;
    v4->_endTime = (NSString *)v9;

    if (*((char *)a3 + 71) >= 0) {
      v11 = (char *)a3 + 48;
    }
    else {
      v11 = (char *)*((void *)a3 + 6);
    }
    uint64_t v12 = [NSString stringWithUTF8String:v11];
    title = v4->_title;
    v4->_title = (NSString *)v12;

    if (*((unsigned char *)a3 + 96))
    {
      if (*((char *)a3 + 95) >= 0) {
        uint64_t v14 = (char *)a3 + 72;
      }
      else {
        uint64_t v14 = (char *)*((void *)a3 + 9);
      }
      uint64_t v15 = [NSString stringWithUTF8String:v14];
      calDescription = v4->_calDescription;
      v4->_calDescription = (NSString *)v15;
    }
    else
    {
      calDescription = v4->_calDescription;
      v4->_calDescription = 0;
    }

    if (*((unsigned char *)a3 + 128))
    {
      v19 = (char *)*((void *)a3 + 13);
      int v18 = (char *)a3 + 104;
      objc_super v17 = v19;
      if (v18[23] >= 0) {
        v20 = v18;
      }
      else {
        v20 = v17;
      }
      uint64_t v21 = [NSString stringWithUTF8String:v20];
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = (NSString *)v21;
    }
    else
    {
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSString)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)calDescription
{
  return self->_calDescription;
}

- (void)setCalDescription:(id)a3
{
}

- (NSString)fallbackUrl
{
  return self->_fallbackUrl;
}

- (void)setFallbackUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackUrl, 0);
  objc_storeStrong((id *)&self->_calDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endTime, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end