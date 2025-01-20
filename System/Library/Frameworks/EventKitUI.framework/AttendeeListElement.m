@interface AttendeeListElement
- (BOOL)xMore;
- (NSMutableAttributedString)string;
- (void)setString:(id)a3;
- (void)setXMore:(BOOL)a3;
@end

@implementation AttendeeListElement

- (NSMutableAttributedString)string
{
  return (NSMutableAttributedString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setString:(id)a3
{
}

- (BOOL)xMore
{
  return self->_xMore;
}

- (void)setXMore:(BOOL)a3
{
  self->_xMore = a3;
}

- (void).cxx_destruct
{
}

@end