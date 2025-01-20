@interface IMAssistantHandleFromContact
- (BOOL)matchesHandleID:(id)a3;
- (BOOL)matchesIMHandle:(id)a3;
- (CNContact)contact;
- (CNLabeledValue)labeledEmailAddress;
- (CNLabeledValue)labeledPhoneNumber;
- (IMAssistantHandleFromContact)initWithBusinessID:(id)a3;
- (IMAssistantHandleFromContact)initWithCNLabeledEmailAddress:(id)a3 contact:(id)a4;
- (IMAssistantHandleFromContact)initWithCNLabeledPhoneNumber:(id)a3 contact:(id)a4;
- (NSString)businessID;
- (NSString)displayID;
- (NSString)handleID;
- (NSString)personHandleLabel;
- (id)_initWithPhoneNumber:(id)a3 emailAddress:(id)a4 businessID:(id)a5 handleType:(int64_t)a6 contact:(id)a7;
- (id)description;
- (int64_t)handleType;
- (int64_t)personHandleType;
@end

@implementation IMAssistantHandleFromContact

- (id)_initWithPhoneNumber:(id)a3 emailAddress:(id)a4 businessID:(id)a5 handleType:(int64_t)a6 contact:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v26 = a4;
  id v13 = a5;
  id v14 = a7;
  v27.receiver = self;
  v27.super_class = (Class)IMAssistantHandleFromContact;
  v15 = [(IMAssistantHandleFromContact *)&v27 init];
  if (!v15)
  {
LABEL_17:
    v23 = 0;
    goto LABEL_18;
  }
  switch(a6)
  {
    case 0:
    case 4:
      if (!IMOSLoggingEnabled()) {
        goto LABEL_17;
      }
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v29 = a6;
        _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Initialized IMAssistantHandleFromContact with an unrecognized handle type %ld, returning nil", buf, 0xCu);
      }
      goto LABEL_16;
    case 1:
      v17 = [v25 value];
      uint64_t v18 = [v17 stringValue];
      handleID = v15->_handleID;
      v15->_handleID = (NSString *)v18;

      uint64_t v20 = 2;
      goto LABEL_10;
    case 2:
      uint64_t v21 = [v26 value];
      v17 = v15->_handleID;
      v15->_handleID = (NSString *)v21;
      uint64_t v20 = 1;
      goto LABEL_10;
    case 3:
      v22 = (NSString *)v13;
      uint64_t v20 = 0;
      v17 = v15->_handleID;
      v15->_handleID = v22;
LABEL_10:

      v15->_personHandleType = v20;
      break;
    default:
      break;
  }
  if (![(NSString *)v15->_handleID length])
  {
    if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Can't initalize IMAssistantHandleFromContact with an empty handle", buf, 2u);
      }
LABEL_16:
    }
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v15->_contact, a7);
  objc_storeStrong((id *)&v15->_labeledPhoneNumber, a3);
  objc_storeStrong((id *)&v15->_labeledEmailAddress, a4);
  objc_storeStrong((id *)&v15->_businessID, a5);
  v15->_handleType = a6;
  v23 = v15;
LABEL_18:

  return v23;
}

- (IMAssistantHandleFromContact)initWithCNLabeledPhoneNumber:(id)a3 contact:(id)a4
{
  return (IMAssistantHandleFromContact *)MEMORY[0x270F9A6D0](self, sel__initWithPhoneNumber_emailAddress_businessID_handleType_contact_);
}

- (IMAssistantHandleFromContact)initWithCNLabeledEmailAddress:(id)a3 contact:(id)a4
{
  return (IMAssistantHandleFromContact *)MEMORY[0x270F9A6D0](self, sel__initWithPhoneNumber_emailAddress_businessID_handleType_contact_);
}

- (IMAssistantHandleFromContact)initWithBusinessID:(id)a3
{
  return (IMAssistantHandleFromContact *)MEMORY[0x270F9A6D0](self, sel__initWithPhoneNumber_emailAddress_businessID_handleType_contact_);
}

- (NSString)personHandleLabel
{
  int64_t v3 = [(IMAssistantHandleFromContact *)self handleType];
  if (v3 == 2)
  {
    uint64_t v4 = [(IMAssistantHandleFromContact *)self labeledEmailAddress];
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    uint64_t v4 = [(IMAssistantHandleFromContact *)self labeledPhoneNumber];
LABEL_5:
    v5 = (void *)v4;
    if (v4)
    {
      v6 = INPersonHandleLabelForCNLabeledValue();
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_10;
  }
  v6 = 0;
LABEL_10:

  return (NSString *)v6;
}

- (BOOL)matchesHandleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263F0FD20], "__im_assistant_handleTypeForString:", v4);
  if ([(IMAssistantHandleFromContact *)self handleType] == v5)
  {
    v6 = [(IMAssistantHandleFromContact *)self handleID];
    v7 = v6;
    if (v5 == 3)
    {
      char v11 = [v6 isEqualToString:v4];
    }
    else
    {
      if (v5 == 2)
      {
        v8 = IMNormalizeFormattedString();
        v9 = IMNormalizeFormattedString();
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        if (v5 != 1)
        {
          char v11 = 0;
          goto LABEL_11;
        }
        v8 = (void *)[objc_alloc(MEMORY[0x263EFEB28]) initWithStringValue:v6];
        v9 = (void *)[objc_alloc(MEMORY[0x263EFEB28]) initWithStringValue:v4];
        char v10 = [v8 isLikePhoneNumber:v9];
      }
      char v11 = v10;
    }
LABEL_11:

    goto LABEL_12;
  }
  char v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)matchesIMHandle:(id)a3
{
  id v4 = [a3 normalizedID];
  if (v4) {
    BOOL v5 = [(IMAssistantHandleFromContact *)self matchesHandleID:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)description
{
  unint64_t v3 = [(IMAssistantHandleFromContact *)self handleType] - 1;
  if (v3 > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", off_264912BB0[v3], self, *(Class *)((char *)&self->super.isa + qword_22C1DC7C0[v3]), self->_contact);
  }

  return v4;
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNLabeledValue)labeledEmailAddress
{
  return self->_labeledEmailAddress;
}

- (CNLabeledValue)labeledPhoneNumber
{
  return self->_labeledPhoneNumber;
}

- (NSString)businessID
{
  return self->_businessID;
}

- (NSString)handleID
{
  return self->_handleID;
}

- (NSString)displayID
{
  return self->_displayID;
}

- (int64_t)personHandleType
{
  return self->_personHandleType;
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_handleID, 0);
  objc_storeStrong((id *)&self->_businessID, 0);
  objc_storeStrong((id *)&self->_labeledPhoneNumber, 0);
  objc_storeStrong((id *)&self->_labeledEmailAddress, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end