@interface CTLazuliSuggestedActionCalendar
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSuggestedActionCalendar:(id)a3;
- (CTLazuliChatBotCreateCalendarEvent)event;
- (CTLazuliSuggestedActionCalendar)initWithCoder:(id)a3;
- (CTLazuliSuggestedActionCalendar)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEvent:(id)a3;
@end

@implementation CTLazuliSuggestedActionCalendar

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliSuggestedActionCalendar *)self event];
  [v3 appendFormat:@", event = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionCalendar:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliSuggestedActionCalendar *)self event];
  v6 = [v4 event];
  char v7 = [v5 isEqualToCTLazuliChatBotCreateCalendarEvent:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliSuggestedActionCalendar *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSuggestedActionCalendar *)self isEqualToCTLazuliSuggestedActionCalendar:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliSuggestedActionCalendar allocWithZone:a3];
  [(CTLazuliSuggestedActionCalendar *)v4 setEvent:self->_event];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliSuggestedActionCalendar)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliSuggestedActionCalendar;
  v5 = [(CTLazuliSuggestedActionCalendar *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kEventKey"];
    event = v5->_event;
    v5->_event = (CTLazuliChatBotCreateCalendarEvent *)v6;
  }
  return v5;
}

- (CTLazuliSuggestedActionCalendar)initWithReflection:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliSuggestedActionCalendar;
  id v4 = [(CTLazuliSuggestedActionCalendar *)&v8 init];
  if (v4)
  {
    v5 = [[CTLazuliChatBotCreateCalendarEvent alloc] initWithReflection:a3];
    event = v4->_event;
    v4->_event = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotCreateCalendarEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end