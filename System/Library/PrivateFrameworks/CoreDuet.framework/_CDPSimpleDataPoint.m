@interface _CDPSimpleDataPoint
- (BOOL)userIsSender;
- (BOOL)userIsThreadInitiator;
- (NSArray)peopleIdentifiers;
- (NSDate)timestamp;
- (NSString)title;
- (void)setPeopleIdentifiers:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserIsSender:(BOOL)a3;
- (void)setUserIsThreadInitiator:(BOOL)a3;
@end

@implementation _CDPSimpleDataPoint

- (BOOL)userIsSender
{
  return self->_userIsSender;
}

- (void)setUserIsSender:(BOOL)a3
{
  self->_userIsSender = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSArray)peopleIdentifiers
{
  return self->_peopleIdentifiers;
}

- (void)setPeopleIdentifiers:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)userIsThreadInitiator
{
  return self->_userIsThreadInitiator;
}

- (void)setUserIsThreadInitiator:(BOOL)a3
{
  self->_userIsThreadInitiator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_peopleIdentifiers, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end