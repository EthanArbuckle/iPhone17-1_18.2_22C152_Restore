@interface _HKDisplayTypeAudiogramContextItemSection2
- (NSArray)items;
- (NSString)title;
- (void)setItems:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _HKDisplayTypeAudiogramContextItemSection2

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end