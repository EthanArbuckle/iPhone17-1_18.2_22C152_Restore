@interface CALNMutableNotificationRecord
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContent:(id)a3;
- (void)setDate:(id)a3;
- (void)setShouldPlaySound:(BOOL)a3;
- (void)setShouldPresentAlert:(BOOL)a3;
- (void)setSourceClientIdentifier:(id)a3;
- (void)setSourceIdentifier:(id)a3;
@end

@implementation CALNMutableNotificationRecord

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CALNNotificationRecord allocWithZone:a3];
  v5 = [(CALNNotificationRecord *)self sourceIdentifier];
  v6 = [(CALNNotificationRecord *)self sourceClientIdentifier];
  v7 = [(CALNNotificationRecord *)self content];
  v8 = [(CALNNotificationRecord *)self date];
  v9 = [(CALNNotificationRecord *)v4 initWithSourceIdentifier:v5 sourceClientIdentifier:v6 content:v7 date:v8 shouldPresentAlert:[(CALNNotificationRecord *)self shouldPresentAlert] shouldPlaySound:[(CALNNotificationRecord *)self shouldPlaySound]];

  return v9;
}

- (void)setSourceIdentifier:(id)a3
{
  self->super._sourceIdentifier = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setSourceClientIdentifier:(id)a3
{
  self->super._sourceClientIdentifier = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setContent:(id)a3
{
  self->super._content = (CALNNotificationContent *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setDate:(id)a3
{
  self->super._date = (NSDate *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setShouldPresentAlert:(BOOL)a3
{
  self->super._shouldPresentAlert = a3;
}

- (void)setShouldPlaySound:(BOOL)a3
{
  self->super._shouldPlaySound = a3;
}

@end