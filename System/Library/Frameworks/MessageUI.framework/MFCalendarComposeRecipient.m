@interface MFCalendarComposeRecipient
- (BOOL)isEqual:(id)a3;
- (MFCalendarComposeRecipient)initWithComposeRecipient:(id)a3;
- (id)displayString;
- (id)participant;
- (unint64_t)hash;
- (void)setCalAttendeeName:(id)a3;
- (void)setParticipant:(id)a3;
@end

@implementation MFCalendarComposeRecipient

- (MFCalendarComposeRecipient)initWithComposeRecipient:(id)a3
{
  id v4 = a3;
  v5 = [v4 address];
  v6 = -[MFComposeRecipient initWithContact:address:kind:](self, "initWithContact:address:kind:", 0, v5, [v4 kind]);

  if (v6)
  {
    v6->super._property = *MEMORY[0x1E4F49AC0];
    uint64_t v7 = [v4 displayString];
    displayString = v6->super._displayString;
    v6->super._displayString = (NSString *)v7;

    v6->super._sourceType = [v4 sourceType];
  }

  return v6;
}

- (void)setCalAttendeeName:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_calAttendeeName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_calAttendeeName, a3);
    v5 = v6;
  }
}

- (void)setParticipant:(id)a3
{
  id v5 = a3;
  if (self->_participant != v5)
  {
    id v6 = v5;
    objc_storeStrong(&self->_participant, a3);
    id v5 = v6;
  }
}

- (id)participant
{
  return self->_participant;
}

- (id)displayString
{
  if ([(MFComposeRecipient *)self record] || (calAttendeeName = self->_calAttendeeName) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)MFCalendarComposeRecipient;
    v3 = [(MFComposeRecipient *)&v6 displayString];
  }
  else
  {
    v3 = calAttendeeName;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(MFComposeRecipient *)self uncommentedAddress];
    objc_super v6 = [v4 uncommentedAddress];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [(MFComposeRecipient *)self uncommentedAddress];
  id v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 hash];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MFCalendarComposeRecipient;
    id v5 = [(MFComposeRecipient *)&v8 hash];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_participant, 0);

  objc_storeStrong((id *)&self->_calAttendeeName, 0);
}

@end