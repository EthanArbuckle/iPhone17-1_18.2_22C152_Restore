@interface _DDUIArtificialPerson
- (NSString)accountAltDSID;
- (NSString)accountIdentifier;
- (NSString)description;
- (NSString)deviceModel;
- (NSString)identifier;
- (NSString)name;
- (RPRemoteDisplayPerson)rapportPerson;
- (id)initGuestPairPerson;
- (id)initSessionPairedPersonWithDevice:(id)a3;
- (void)setAccountAltDSID:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation _DDUIArtificialPerson

- (id)initGuestPairPerson
{
  v7.receiver = self;
  v7.super_class = (Class)_DDUIArtificialPerson;
  v2 = [(_DDUIArtificialPerson *)&v7 init];
  v3 = v2;
  if (v2)
  {
    accountIdentifier = v2->_accountIdentifier;
    v2->_accountIdentifier = (NSString *)@"ddui@other.account.identifier";

    accountAltDSID = v3->_accountAltDSID;
    v3->_accountAltDSID = (NSString *)@"ddui@other.account.identifier";
  }
  return v3;
}

- (id)initSessionPairedPersonWithDevice:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_DDUIArtificialPerson;
  v5 = [(_DDUIArtificialPerson *)&v19 init];
  v6 = v5;
  if (v5)
  {
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)@"ddui@session.paired.identifier";

    accountAltDSID = v6->_accountAltDSID;
    v6->_accountAltDSID = (NSString *)@"ddui@session.paired.identifier";

    v9 = [v4 model];
    uint64_t v10 = [v9 copy];
    deviceModel = v6->_deviceModel;
    v6->_deviceModel = (NSString *)v10;

    v12 = [v4 idsDeviceIdentifier];
    uint64_t v13 = [v12 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v13;

    v15 = [v4 name];
    uint64_t v16 = [v15 copy];
    name = v6->_name;
    v6->_name = (NSString *)v16;
  }
  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; name = \"%@\"; deviceModel = \"%@\"; identifier = \"%@\"; accountIdentifier = \"%@\">",
                       objc_opt_class(),
                       self,
                       self->_name,
                       self->_deviceModel,
                       self->_identifier,
                       self->_accountIdentifier);
}

- (RPRemoteDisplayPerson)rapportPerson
{
  return self->rapportPerson;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (void)setAccountAltDSID:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->rapportPerson, 0);
}

@end