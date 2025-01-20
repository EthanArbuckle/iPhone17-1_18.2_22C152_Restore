@interface Section
- (NSArray)rows;
- (NSString)title;
- (void)setRows:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation Section

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_rows, 0);
}

@end