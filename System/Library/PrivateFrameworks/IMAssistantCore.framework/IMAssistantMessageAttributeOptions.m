@interface IMAssistantMessageAttributeOptions
+ (id)optionsWithAttributes:(unint64_t)a3;
+ (id)optionsWithAttributes:(unint64_t)a3 sanitizer:(id)a4;
- (BOOL)includeRead;
- (BOOL)includeUnread;
- (IMAssistantMessageAttributeOptions)initWithAttributes:(unint64_t)a3;
- (IMAssistantMessageAttributeOptions)initWithAttributes:(unint64_t)a3 sanitizer:(id)a4;
- (unint64_t)attributes;
@end

@implementation IMAssistantMessageAttributeOptions

- (IMAssistantMessageAttributeOptions)initWithAttributes:(unint64_t)a3
{
  return [(IMAssistantMessageAttributeOptions *)self initWithAttributes:a3 sanitizer:0];
}

- (IMAssistantMessageAttributeOptions)initWithAttributes:(unint64_t)a3 sanitizer:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)IMAssistantMessageAttributeOptions;
  v7 = [(IMAssistantMessageAttributeOptions *)&v9 init];
  if (v7)
  {
    if (v6) {
      a3 = [v6 sanitize:a3];
    }
    v7->_attributes = a3;
  }

  return v7;
}

- (BOOL)includeRead
{
  return [(IMAssistantMessageAttributeOptions *)self attributes] & 1;
}

- (BOOL)includeUnread
{
  return ([(IMAssistantMessageAttributeOptions *)self attributes] >> 1) & 1;
}

+ (id)optionsWithAttributes:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithAttributes:a3];

  return v3;
}

+ (id)optionsWithAttributes:(unint64_t)a3 sanitizer:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithAttributes:a3 sanitizer:v6];

  return v7;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

@end