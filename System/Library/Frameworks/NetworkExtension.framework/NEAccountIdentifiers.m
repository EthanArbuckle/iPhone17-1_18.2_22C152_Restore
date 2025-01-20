@interface NEAccountIdentifiers
- (NSArray)calendarAccountIdentifiers;
- (NSArray)contactsAccountIdentifiers;
- (NSArray)mailAccountIdentifiers;
- (void)setCalendarAccountIdentifiers:(id)a3;
- (void)setContactsAccountIdentifiers:(id)a3;
- (void)setMailAccountIdentifiers:(id)a3;
@end

@implementation NEAccountIdentifiers

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_calendarAccountIdentifiers, 0);

  objc_storeStrong((id *)&self->_mailAccountIdentifiers, 0);
}

- (void)setContactsAccountIdentifiers:(id)a3
{
}

- (NSArray)contactsAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCalendarAccountIdentifiers:(id)a3
{
}

- (NSArray)calendarAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMailAccountIdentifiers:(id)a3
{
}

- (NSArray)mailAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

@end