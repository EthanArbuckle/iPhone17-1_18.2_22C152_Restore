@interface EMKEmojiSignifier
- (EMKEmojiSignifier)initWithString:(id)a3;
- (NSString)string;
- (id)description;
@end

@implementation EMKEmojiSignifier

- (EMKEmojiSignifier)initWithString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)EMKEmojiSignifier;
    self = [(EMKEmojiSignifier *)&v8 init];
    if (self)
    {
      v5 = (NSString *)[v4 copy];
      string = self->_string;
      self->_string = v5;
    }
  }

  return self;
}

- (NSString)string
{
  return self->_string;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)EMKEmojiSignifier;
  id v4 = [(EMKEmojiSignifier *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@%@", v4, self->_string];

  return v5;
}

- (void).cxx_destruct
{
}

@end