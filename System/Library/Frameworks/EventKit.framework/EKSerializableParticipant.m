@interface EKSerializableParticipant
+ (id)classesForKey;
- (EKSerializableParticipant)initWithParticipant:(id)a3;
- (NSString)emailAddress;
- (NSString)name;
- (NSString)phoneNumber;
- (NSURL)url;
- (id)createAttendee:(id *)a3;
- (int64_t)participantRole;
- (int64_t)participantStatus;
- (int64_t)participantType;
- (void)setEmailAddress:(id)a3;
- (void)setName:(id)a3;
- (void)setParticipantRole:(int64_t)a3;
- (void)setParticipantStatus:(int64_t)a3;
- (void)setParticipantType:(int64_t)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation EKSerializableParticipant

+ (id)classesForKey
{
  v19[7] = *MEMORY[0x1E4F143B8];
  v18[0] = @"name";
  uint64_t v17 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v19[0] = v2;
  v18[1] = @"emailAddress";
  uint64_t v16 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v19[1] = v3;
  v18[2] = @"phoneNumber";
  uint64_t v15 = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v19[2] = v4;
  v18[3] = @"url";
  uint64_t v14 = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v19[3] = v5;
  v18[4] = @"participantRole";
  uint64_t v13 = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v19[4] = v6;
  v18[5] = @"participantStatus";
  uint64_t v12 = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v19[5] = v7;
  v18[6] = @"participantType";
  uint64_t v11 = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v19[6] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:7];

  return v9;
}

- (EKSerializableParticipant)initWithParticipant:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EKSerializableParticipant;
  v5 = [(EKSerializableParticipant *)&v11 init];
  if (v5)
  {
    v6 = [v4 name];
    [(EKSerializableParticipant *)v5 setName:v6];

    v7 = [v4 emailAddress];
    [(EKSerializableParticipant *)v5 setEmailAddress:v7];

    v8 = [v4 phoneNumber];
    [(EKSerializableParticipant *)v5 setPhoneNumber:v8];

    v9 = [v4 URL];
    [(EKSerializableParticipant *)v5 setUrl:v9];

    -[EKSerializableParticipant setParticipantRole:](v5, "setParticipantRole:", [v4 participantRole]);
    -[EKSerializableParticipant setParticipantStatus:](v5, "setParticipantStatus:", [v4 participantStatus]);
    -[EKSerializableParticipant setParticipantType:](v5, "setParticipantType:", [v4 participantType]);
  }

  return v5;
}

- (id)createAttendee:(id *)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v5 = [(EKSerializableParticipant *)self phoneNumber];
  if (v5
    || ([(EKSerializableParticipant *)self emailAddress],
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    v6 = [(EKSerializableParticipant *)self name];
    v7 = [(EKSerializableParticipant *)self emailAddress];
    v8 = [(EKSerializableParticipant *)self phoneNumber];
    v9 = [(EKSerializableParticipant *)self url];
    a3 = +[EKAttendee attendeeWithName:v6 emailAddress:v7 phoneNumber:v8 url:v9];

    objc_msgSend(a3, "setParticipantRole:", -[EKSerializableParticipant participantRole](self, "participantRole"));
    objc_msgSend(a3, "setParticipantType:", -[EKSerializableParticipant participantType](self, "participantType"));
    objc_msgSend(a3, "setParticipantStatus:", -[EKSerializableParticipant participantStatus](self, "participantStatus"));
    goto LABEL_5;
  }
  objc_super v11 = [(EKSerializableParticipant *)self url];

  if (v11) {
    goto LABEL_4;
  }
  if (a3)
  {
    uint64_t v13 = *MEMORY[0x1E4F28578];
    v14[0] = @"Either url, phoneNumber or emailAddress should not be nil.";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:0 userInfo:v12];

    a3 = 0;
  }
LABEL_5:

  return a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (int64_t)participantRole
{
  return self->_participantRole;
}

- (void)setParticipantRole:(int64_t)a3
{
  self->_participantRole = a3;
}

- (int64_t)participantStatus
{
  return self->_participantStatus;
}

- (void)setParticipantStatus:(int64_t)a3
{
  self->_participantStatus = a3;
}

- (int64_t)participantType
{
  return self->_participantType;
}

- (void)setParticipantType:(int64_t)a3
{
  self->_participantType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end