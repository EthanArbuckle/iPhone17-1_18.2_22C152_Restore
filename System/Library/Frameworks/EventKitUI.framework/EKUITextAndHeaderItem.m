@interface EKUITextAndHeaderItem
+ (EKUITextAndHeaderItem)itemWithText:(id)a3 andHeader:(id)a4;
- (EKUITextAndHeaderItem)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)header;
- (NSString)text;
- (id)description;
- (int64_t)lines;
- (void)setHeader:(id)a3;
- (void)setLines:(int64_t)a3;
- (void)setText:(id)a3;
@end

@implementation EKUITextAndHeaderItem

- (EKUITextAndHeaderItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKUITextAndHeaderItem;
  v5 = [(EKUITextAndHeaderItem *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"header"];
    header = v5->_header;
    v5->_header = (NSString *)v8;

    v10 = [v4 objectForKeyedSubscript:@"lines"];
    unint64_t v11 = [v10 integerValue];
    if (v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    v5->_lines = v12;
  }
  return v5;
}

+ (EKUITextAndHeaderItem)itemWithText:(id)a3 andHeader:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setText:v6];

  [v7 setHeader:v5];
  [v7 setLines:1];

  return (EKUITextAndHeaderItem *)v7;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = v3;
  text = self->_text;
  if (text) {
    [v3 setObject:text forKeyedSubscript:@"text"];
  }
  header = self->_header;
  if (header) {
    [v4 setObject:header forKeyedSubscript:@"header"];
  }
  v7 = [NSNumber numberWithInteger:self->_lines];
  [v4 setObject:v7 forKeyedSubscript:@"lines"];

  uint64_t v8 = (void *)[v4 copy];

  return (NSDictionary *)v8;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)EKUITextAndHeaderItem;
  v3 = [(EKUITextAndHeaderItem *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@"%@ text: %@ header: %@ lines: %d", v3, self->_text, self->_header, self->_lines];

  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (int64_t)lines
{
  return self->_lines;
}

- (void)setLines:(int64_t)a3
{
  self->_lines = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end