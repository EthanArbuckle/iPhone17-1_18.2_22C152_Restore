@interface EMKEmojiTokenList
- (EMKEmojiTokenList)initWithEmojiTokenArray:(id)a3;
- (NSArray)emojiTokenArray;
- (id)description;
- (id)emojiTokenAtIndex:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation EMKEmojiTokenList

- (EMKEmojiTokenList)initWithEmojiTokenArray:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)EMKEmojiTokenList;
    self = [(EMKEmojiTokenList *)&v8 init];
    if (self)
    {
      v5 = (NSArray *)[v4 copy];
      emojiTokenArray = self->_emojiTokenArray;
      self->_emojiTokenArray = v5;
    }
  }

  return self;
}

- (NSArray)emojiTokenArray
{
  return self->_emojiTokenArray;
}

- (unint64_t)count
{
  return [(NSArray *)self->_emojiTokenArray count];
}

- (id)emojiTokenAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_emojiTokenArray objectAtIndex:a3];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_emojiTokenArray objectAtIndex:a3];
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)EMKEmojiTokenList;
  v3 = [(EMKEmojiTokenList *)&v11 description];
  id v4 = (void *)[v3 mutableCopy];

  NSUInteger v5 = [(NSArray *)self->_emojiTokenArray count];
  if (v5)
  {
    NSUInteger v6 = v5;
    uint64_t v7 = 0;
    do
    {
      objc_super v8 = [(NSArray *)self->_emojiTokenArray objectAtIndex:v7];
      v9 = [v8 string];
      [v4 appendString:v9];

      if (++v7 < v6) {
        [v4 appendString:@"/"];
      }
    }
    while (v6 != v7);
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end