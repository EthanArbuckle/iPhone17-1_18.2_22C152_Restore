@interface CRKASMClassSessionInvitation
+ (id)instanceWithDictionary:(id)a3;
- (CRKASMClassSessionInvitation)initWithInvitationIdentifier:(id)a3 instructorIdentifier:(id)a4 sessionIdentifier:(id)a5;
- (CRKASMClassSessionInvitation)initWithSessionIdentifier:(id)a3 instructorIdentifier:(id)a4;
- (DMFControlSessionIdentifier)sessionIdentifier;
- (NSDictionary)dictionaryValue;
- (NSString)instructorIdentifier;
- (NSUUID)invitationIdentifier;
@end

@implementation CRKASMClassSessionInvitation

- (CRKASMClassSessionInvitation)initWithInvitationIdentifier:(id)a3 instructorIdentifier:(id)a4 sessionIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKASMClassSessionInvitation;
  v12 = [(CRKASMClassSessionInvitation *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_invitationIdentifier, a3);
    uint64_t v14 = [v10 copy];
    instructorIdentifier = v13->_instructorIdentifier;
    v13->_instructorIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_sessionIdentifier, a5);
  }

  return v13;
}

- (CRKASMClassSessionInvitation)initWithSessionIdentifier:(id)a3 instructorIdentifier:(id)a4
{
  v6 = (void *)MEMORY[0x263F08C38];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 UUID];
  id v10 = [(CRKASMClassSessionInvitation *)self initWithInvitationIdentifier:v9 instructorIdentifier:v7 sessionIdentifier:v8];

  return v10;
}

- (NSDictionary)dictionaryValue
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"SessionIdentifier";
  v3 = [(CRKASMClassSessionInvitation *)self sessionIdentifier];
  v4 = [v3 stringValue];
  v11[0] = v4;
  v10[1] = @"InstructorIdentifier";
  v5 = [(CRKASMClassSessionInvitation *)self instructorIdentifier];
  v11[1] = v5;
  v10[2] = @"InvitationIdentifier";
  v6 = [(CRKASMClassSessionInvitation *)self invitationIdentifier];
  id v7 = [v6 UUIDString];
  v11[2] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return (NSDictionary *)v8;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"SessionIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  id v8 = [v4 objectForKeyedSubscript:@"InstructorIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = [v4 objectForKeyedSubscript:@"InvitationIdentifier"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  uint64_t v14 = 0;
  if (v7 && v13 && v10)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F39D28]) initWithString:v7];
    uint64_t v16 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];
    objc_super v17 = (void *)v16;
    uint64_t v14 = 0;
    if (v15 && v16) {
      uint64_t v14 = (void *)[objc_alloc((Class)a1) initWithInvitationIdentifier:v16 instructorIdentifier:v10 sessionIdentifier:v15];
    }
  }

  return v14;
}

- (NSUUID)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (NSString)instructorIdentifier
{
  return self->_instructorIdentifier;
}

- (DMFControlSessionIdentifier)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_instructorIdentifier, 0);

  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
}

@end