@interface AMSPhoneNumberContextInfo
- (AMSPhoneNumberContextInfo)initWithPhoneNumber:(id)a3 simLabel:(id)a4 uuid:(id)a5 isVoicePreferred:(BOOL)a6;
- (BOOL)isVoicePreferred;
- (NSString)phoneNumber;
- (NSString)simLabel;
- (NSUUID)uuid;
- (id)description;
@end

@implementation AMSPhoneNumberContextInfo

- (AMSPhoneNumberContextInfo)initWithPhoneNumber:(id)a3 simLabel:(id)a4 uuid:(id)a5 isVoicePreferred:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSPhoneNumberContextInfo;
  v14 = [(AMSPhoneNumberContextInfo *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_isVoicePreferred = a6;
    objc_storeStrong((id *)&v14->_phoneNumber, a3);
    objc_storeStrong((id *)&v15->_simLabel, a4);
    objc_storeStrong((id *)&v15->_uuid, a5);
  }

  return v15;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSPhoneNumberContextInfo isVoicePreferred](self, "isVoicePreferred"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, @"voicePreferred");

  v5 = [(AMSPhoneNumberContextInfo *)self phoneNumber];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, @"phoneNumber");

  v6 = [(AMSPhoneNumberContextInfo *)self simLabel];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, @"simLabel");

  v7 = [(AMSPhoneNumberContextInfo *)self uuid];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, @"uuid");

  v8 = (void *)[v3 copy];
  v9 = [self ams_generateDescriptionWithSubObjects:v8];

  return v9;
}

- (BOOL)isVoicePreferred
{
  return self->_isVoicePreferred;
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)simLabel
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_simLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end