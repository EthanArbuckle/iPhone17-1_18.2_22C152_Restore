@interface LearnMoreItem
- (NSString)body;
- (NSString)title;
- (void)setBody:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LearnMoreItem

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end