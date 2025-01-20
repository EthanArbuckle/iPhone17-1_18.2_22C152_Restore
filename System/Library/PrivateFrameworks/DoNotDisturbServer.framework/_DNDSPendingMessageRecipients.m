@interface _DNDSPendingMessageRecipients
- (NSDate)lastUpdateDate;
- (NSSet)deviceIdentifiers;
- (_DNDSPendingMessageRecipients)initWithLastUpdateDate:(id)a3 deviceIdentifiers:(id)a4;
- (id)description;
@end

@implementation _DNDSPendingMessageRecipients

- (_DNDSPendingMessageRecipients)initWithLastUpdateDate:(id)a3 deviceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_DNDSPendingMessageRecipients;
  v8 = [(_DNDSPendingMessageRecipients *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    lastUpdateDate = v8->_lastUpdateDate;
    v8->_lastUpdateDate = (NSDate *)v9;

    uint64_t v11 = [v7 copy];
    deviceIdentifiers = v8->_deviceIdentifiers;
    v8->_deviceIdentifiers = (NSSet *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [MEMORY[0x1E4F28C10] localizedStringFromDate:self->_lastUpdateDate dateStyle:1 timeStyle:1];
  v5 = [v3 stringWithFormat:@"sendDate: %@; deviceIdentifiers: %@", v4, self->_deviceIdentifiers];

  return v5;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (NSSet)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
}

@end