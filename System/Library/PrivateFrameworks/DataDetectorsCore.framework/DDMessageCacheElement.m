@interface DDMessageCacheElement
- (NSDate)date;
- (NSString)text;
- (void)setDate:(id)a3;
- (void)setText:(id)a3;
@end

@implementation DDMessageCacheElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

@end