@interface _CDContactRecord
- (_CDContact)contact;
- (void)setContact:(id)a3;
@end

@implementation _CDContactRecord

- (_CDContact)contact
{
  return (_CDContact *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContact:(id)a3
{
}

- (void).cxx_destruct
{
}

@end