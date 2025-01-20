@interface WFParticipant
+ (id)objectWithWFSerializedRepresentation:(id)a3;
- (BOOL)isCurrentUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToParticipant:(id)a3;
- (BOOL)isManaged;
- (NSPredicate)contactPredicate;
- (NSString)emailAddress;
- (NSString)name;
- (NSString)sourceIdentifier;
- (NSURL)URL;
- (WFParticipant)initWithEKParticipant:(id)a3;
- (WFParticipant)initWithURL:(id)a3 name:(id)a4 emailAddress:(id)a5 status:(int64_t)a6 role:(int64_t)a7 type:(int64_t)a8 sourceIdentifier:(id)a9 isManaged:(BOOL)a10 isCurrentUser:(BOOL)a11 contactPredicate:(id)a12;
- (id)wfSerializedRepresentation;
- (int64_t)role;
- (int64_t)status;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation WFParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPredicate, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (NSPredicate)contactPredicate
{
  return self->_contactPredicate;
}

- (BOOL)isCurrentUser
{
  return self->_currentUser;
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)role
{
  return self->_role;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSString)name
{
  return self->_name;
}

- (NSURL)URL
{
  return self->_URL;
}

- (id)wfSerializedRepresentation
{
  v21[1] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = [(WFParticipant *)self URL];

  if (v4)
  {
    v5 = [(WFParticipant *)self URL];
    v6 = [v5 absoluteString];
    [v3 setObject:v6 forKey:@"URL"];
  }
  v7 = [(WFParticipant *)self name];

  if (v7)
  {
    v8 = [(WFParticipant *)self name];
    [v3 setObject:v8 forKey:@"name"];
  }
  v9 = [(WFParticipant *)self emailAddress];

  if (v9)
  {
    v10 = [(WFParticipant *)self emailAddress];
    [v3 setObject:v10 forKey:@"emailAddress"];
  }
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFParticipant status](self, "status"));
  [v3 setObject:v11 forKey:@"participantStatus"];

  v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFParticipant role](self, "role"));
  [v3 setObject:v12 forKey:@"participantRole"];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFParticipant type](self, "type"));
  [v3 setObject:v13 forKey:@"participantType"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[WFParticipant isCurrentUser](self, "isCurrentUser"));
  [v3 setObject:v14 forKey:@"isCurrentUser"];

  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[WFParticipant isManaged](self, "isManaged"));
  [v3 setObject:v15 forKey:@"isManaged"];

  v16 = [(WFParticipant *)self sourceIdentifier];

  if (v16)
  {
    v17 = [(WFParticipant *)self sourceIdentifier];
    [v3 setObject:v17 forKey:@"sourceIdentifier"];
  }
  v20 = @"link.contentkit.ekparticipant";
  v21[0] = v3;
  v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

  return v18;
}

- (BOOL)isEquivalentToParticipant:(id)a3
{
  v4 = (WFParticipant *)a3;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFParticipant *)self URL];
      v6 = [(WFParticipant *)v4 URL];
      if ([v5 isEqual:v6])
      {
        v7 = [(WFParticipant *)self emailAddress];
        v8 = [(WFParticipant *)v4 emailAddress];
        if ([v7 isEqualToString:v8])
        {
          BOOL v9 = [(WFParticipant *)self isCurrentUser];
          BOOL v10 = v9 ^ [(WFParticipant *)v4 isCurrentUser] ^ 1;
        }
        else
        {
          LOBYTE(v10) = 0;
        }
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFParticipant *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFParticipant *)self URL];
      v6 = [(WFParticipant *)v4 URL];
      id v7 = v5;
      id v8 = v6;
      BOOL v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        char v10 = 0;
        v11 = v8;
        id v12 = v7;
        if (!v7 || !v8) {
          goto LABEL_47;
        }
        int v13 = [v7 isEqual:v8];

        if (!v13)
        {
          char v10 = 0;
LABEL_48:

          goto LABEL_49;
        }
      }
      v14 = [(WFParticipant *)self name];
      v15 = [(WFParticipant *)v4 name];
      id v12 = v14;
      id v16 = v15;
      v11 = v16;
      if (v12 == v16)
      {
      }
      else
      {
        char v10 = 0;
        v17 = v16;
        id v18 = v12;
        if (!v12 || !v16) {
          goto LABEL_46;
        }
        int v19 = [v12 isEqualToString:v16];

        if (!v19)
        {
          char v10 = 0;
LABEL_47:

          goto LABEL_48;
        }
      }
      v20 = [(WFParticipant *)self emailAddress];
      v21 = [(WFParticipant *)v4 emailAddress];
      id v18 = v20;
      id v22 = v21;
      v17 = v22;
      if (v18 == v22)
      {
      }
      else
      {
        char v10 = 0;
        v23 = v22;
        id v24 = v18;
        if (!v18 || !v22) {
          goto LABEL_45;
        }
        int v25 = [v18 isEqualToString:v22];

        if (!v25)
        {
LABEL_31:
          char v10 = 0;
LABEL_46:

          goto LABEL_47;
        }
      }
      int64_t v26 = [(WFParticipant *)self status];
      if (v26 != [(WFParticipant *)v4 status]) {
        goto LABEL_31;
      }
      int64_t v27 = [(WFParticipant *)self role];
      if (v27 != [(WFParticipant *)v4 role]) {
        goto LABEL_31;
      }
      int64_t v28 = [(WFParticipant *)self type];
      if (v28 != [(WFParticipant *)v4 type]) {
        goto LABEL_31;
      }
      v29 = [(WFParticipant *)self sourceIdentifier];
      v30 = [(WFParticipant *)v4 sourceIdentifier];
      id v24 = v29;
      id v31 = v30;
      id v45 = v31;
      if (v24 == v31)
      {
      }
      else
      {
        char v10 = 0;
        if (!v24)
        {
          v32 = v31;
          id v33 = 0;
          goto LABEL_43;
        }
        v32 = v31;
        id v33 = v24;
        if (!v31)
        {
LABEL_43:
          v41 = v33;

          goto LABEL_44;
        }
        v34 = v31;
        LODWORD(v43) = [v24 isEqualToString:v31];

        if (!v43)
        {
LABEL_35:
          char v10 = 0;
LABEL_44:
          v23 = v45;
LABEL_45:

          goto LABEL_46;
        }
      }
      BOOL v35 = [(WFParticipant *)self isManaged];
      if (v35 != [(WFParticipant *)v4 isManaged]) {
        goto LABEL_35;
      }
      BOOL v36 = [(WFParticipant *)self isCurrentUser];
      if (v36 != [(WFParticipant *)v4 isCurrentUser]) {
        goto LABEL_35;
      }
      v37 = [(WFParticipant *)self contactPredicate];
      v38 = [(WFParticipant *)v4 contactPredicate];
      id v39 = v37;
      id v40 = v38;
      v44 = v40;
      if (v39 == v40)
      {
        char v10 = 1;
      }
      else
      {
        char v10 = 0;
        if (v39 && v40) {
          char v10 = [v39 isEqual:v40];
        }
      }

      v32 = v44;
      id v33 = v39;
      goto LABEL_43;
    }
    char v10 = 0;
  }
LABEL_49:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(WFParticipant *)self URL];
  uint64_t v4 = [v3 hash];
  v5 = [(WFParticipant *)self name];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(WFParticipant *)self emailAddress];
  uint64_t v8 = [v7 hash];
  int64_t v9 = v6 ^ v8 ^ [(WFParticipant *)self status];
  int64_t v10 = [(WFParticipant *)self role];
  int64_t v11 = v10 ^ [(WFParticipant *)self type];
  id v12 = [(WFParticipant *)self sourceIdentifier];
  uint64_t v13 = v11 ^ [v12 hash];
  int64_t v14 = v9 ^ v13 ^ [(WFParticipant *)self isManaged];
  uint64_t v15 = [(WFParticipant *)self isCurrentUser];
  id v16 = [(WFParticipant *)self contactPredicate];
  unint64_t v17 = v14 ^ v15 ^ [v16 hash];

  return v17;
}

- (WFParticipant)initWithEKParticipant:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 owner];
  v5 = [v4 calendar];

  char v18 = [v5 isManaged];
  unint64_t v17 = [v3 URL];
  uint64_t v6 = [v3 name];
  id v7 = [v3 emailAddress];
  uint64_t v16 = [v3 participantStatus];
  uint64_t v8 = [v3 participantRole];
  uint64_t v9 = [v3 participantType];
  int64_t v10 = [v5 source];
  int64_t v11 = [v10 sourceIdentifier];
  LOBYTE(v4) = [v3 isCurrentUser];
  id v12 = [v3 contactPredicate];

  BYTE1(v15) = (_BYTE)v4;
  LOBYTE(v15) = v18;
  uint64_t v13 = -[WFParticipant initWithURL:name:emailAddress:status:role:type:sourceIdentifier:isManaged:isCurrentUser:contactPredicate:](self, "initWithURL:name:emailAddress:status:role:type:sourceIdentifier:isManaged:isCurrentUser:contactPredicate:", v17, v6, v7, v16, v8, v9, v11, v15, v12);

  return v13;
}

- (WFParticipant)initWithURL:(id)a3 name:(id)a4 emailAddress:(id)a5 status:(int64_t)a6 role:(int64_t)a7 type:(int64_t)a8 sourceIdentifier:(id)a9 isManaged:(BOOL)a10 isCurrentUser:(BOOL)a11 contactPredicate:(id)a12
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a9;
  id v35 = a12;
  if (!v19)
  {
    id obj = [MEMORY[0x263F08690] currentHandler];
    [obj handleFailureInMethod:a2, self, @"WFParticipant.m", 26, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  v36.receiver = self;
  v36.super_class = (Class)WFParticipant;
  v23 = [(WFParticipant *)&v36 init];
  id v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_URL, a3);
    uint64_t v25 = [v20 copy];
    name = v24->_name;
    v24->_name = (NSString *)v25;

    uint64_t v27 = [v21 copy];
    emailAddress = v24->_emailAddress;
    v24->_emailAddress = (NSString *)v27;

    v24->_status = a6;
    v24->_role = a7;
    v24->_type = a8;
    uint64_t v29 = [v22 copy];
    sourceIdentifier = v24->_sourceIdentifier;
    v24->_sourceIdentifier = (NSString *)v29;

    v24->_managed = a10;
    v24->_currentUser = a11;
    objc_storeStrong((id *)&v24->_contactPredicate, a12);
    id v31 = v24;
  }

  return v24;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.ekparticipant"];

  uint64_t v6 = NSURL;
  id v7 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"URL"];
  uint64_t v8 = [v6 URLWithString:v7];

  if (v8)
  {
    uint64_t v9 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"name"];
    int64_t v10 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"emailAddress"];
    uint64_t v25 = (objc_class *)a1;
    int64_t v11 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"participantStatus"];
    uint64_t v24 = [v11 integerValue];

    id v12 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"participantRole"];
    uint64_t v13 = [v12 integerValue];

    int64_t v14 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"participantType"];
    uint64_t v15 = [v14 integerValue];

    uint64_t v16 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"isCurrentUser"];
    char v17 = [v16 BOOLValue];

    char v18 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"isManaged"];
    char v19 = [v18 BOOLValue];

    id v20 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"sourceIdentifier"];
    BYTE1(v23) = v17;
    LOBYTE(v23) = v19;
    id v21 = objc_msgSend([v25 alloc], "initWithURL:name:emailAddress:status:role:type:sourceIdentifier:isManaged:isCurrentUser:contactPredicate:", v8, v9, v10, v24, v13, v15, v20, v23, 0);
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

@end