@interface HMDSParticipantIdentity
- (HMDSParticipantIdentity)initWithUnifiedContactIdentifier:(id)a3 nameComponents:(id)a4 emailAddress:(id)a5 phoneNumber:(id)a6 userID:(id)a7 pinCodeLabel:(id)a8;
- (NSPersonNameComponents)nameComponents;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)pinCodeLabel;
- (NSString)unifiedContactIdentifier;
- (NSString)userID;
@end

@implementation HMDSParticipantIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCodeLabel, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);

  objc_storeStrong((id *)&self->_unifiedContactIdentifier, 0);
}

- (NSString)pinCodeLabel
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSString)unifiedContactIdentifier
{
  return self->_unifiedContactIdentifier;
}

- (HMDSParticipantIdentity)initWithUnifiedContactIdentifier:(id)a3 nameComponents:(id)a4 emailAddress:(id)a5 phoneNumber:(id)a6 userID:(id)a7 pinCodeLabel:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDSParticipantIdentity;
  v18 = [(HMDSParticipantIdentity *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_unifiedContactIdentifier, a3);
    objc_storeStrong((id *)&v19->_nameComponents, a4);
    objc_storeStrong((id *)&v19->_emailAddress, a5);
    objc_storeStrong((id *)&v19->_phoneNumber, a6);
    objc_storeStrong((id *)&v19->_userID, a7);
    objc_storeStrong((id *)&v19->_pinCodeLabel, a8);
  }

  return v19;
}

@end