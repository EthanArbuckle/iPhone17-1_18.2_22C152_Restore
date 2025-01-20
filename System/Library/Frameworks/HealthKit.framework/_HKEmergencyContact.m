@interface _HKEmergencyContact
+ (BOOL)supportsSecureCoding;
+ (id)emergencyContactUsingSimCardNumberWithContact:(id)a3 property:(id)a4;
+ (id)emergencyContactWithContact:(id)a3 property:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSyncedContact:(id)a3;
- (NSNumber)nameRecordID;
- (NSNumber)phoneNumberPropertyID;
- (NSString)name;
- (NSString)nameContactIdentifier;
- (NSString)phoneNumber;
- (NSString)phoneNumberContactIdentifier;
- (NSString)phoneNumberLabel;
- (NSString)relationship;
- (_HKEmergencyContact)init;
- (_HKEmergencyContact)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setNameContactIdentifier:(id)a3;
- (void)setNameRecordID:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPhoneNumberContactIdentifier:(id)a3;
- (void)setPhoneNumberLabel:(id)a3;
- (void)setPhoneNumberPropertyID:(id)a3;
- (void)setRelationship:(id)a3;
@end

@implementation _HKEmergencyContact

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKEmergencyContact)init
{
  v7.receiver = self;
  v7.super_class = (Class)_HKEmergencyContact;
  v2 = [(_HKEmergencyContact *)&v7 init];
  v3 = v2;
  if (v2)
  {
    nameRecordID = v2->_nameRecordID;
    v2->_nameRecordID = (NSNumber *)&unk_1EECE4C40;

    phoneNumberPropertyID = v3->_phoneNumberPropertyID;
    v3->_phoneNumberPropertyID = (NSNumber *)&unk_1EECE4C40;
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v4 = [(_HKEmergencyContact *)self name];
  v5 = [(_HKEmergencyContact *)self phoneNumber];
  v6 = [v3 stringWithFormat:@"[%@]:%@", v4, v5];

  return v6;
}

- (_HKEmergencyContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_HKEmergencyContact *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKEmergencyContactNameKey"];
    [(_HKEmergencyContact *)v5 setName:v6];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKEmergencyContactPhoneNumberKey"];
    [(_HKEmergencyContact *)v5 setPhoneNumber:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKEmergencyContactRelationshipKey"];
    [(_HKEmergencyContact *)v5 setRelationship:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKEmergencyContactNameRecordIDKey"];
    [(_HKEmergencyContact *)v5 setNameRecordID:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKEmergencyContactPhoneNumberPropertyIDKey"];
    [(_HKEmergencyContact *)v5 setPhoneNumberPropertyID:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKEmergencyContactNameContactIdentifierKey"];
    [(_HKEmergencyContact *)v5 setNameContactIdentifier:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKEmergencyContactPhoneNumberContactIdentifierKey"];
    [(_HKEmergencyContact *)v5 setPhoneNumberContactIdentifier:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKEmergencyContactPhoneNumberLabelKey"];
    [(_HKEmergencyContact *)v5 setPhoneNumberLabel:v13];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = [(_HKEmergencyContact *)self name];
    v8 = [v6 name];
    if (v7 != v8)
    {
      v3 = [v6 name];
      if (!v3)
      {
        char v11 = 0;
LABEL_88:

        goto LABEL_89;
      }
      v9 = [(_HKEmergencyContact *)self name];
      v10 = [v6 name];
      if (![v9 isEqualToString:v10])
      {
        char v11 = 0;
LABEL_51:

        goto LABEL_88;
      }
      v85 = v10;
      v86 = v9;
    }
    v12 = [(_HKEmergencyContact *)self phoneNumber];
    v89 = [v6 phoneNumber];
    if (v12 == v89)
    {
      BOOL v81 = 0;
    }
    else
    {
      uint64_t v13 = [v6 phoneNumber];
      if (!v13)
      {

        char v11 = 0;
        goto LABEL_86;
      }
      v14 = (void *)v13;
      id v4 = [(_HKEmergencyContact *)self phoneNumber];
      v84 = [v6 phoneNumber];
      if (!objc_msgSend(v4, "isEqualToString:"))
      {
        char v11 = 0;
LABEL_49:

        goto LABEL_50;
      }
      BOOL v81 = v12 != v89;
      v79 = v14;
    }
    v15 = [(_HKEmergencyContact *)self relationship];
    [v6 relationship];
    v88 = v87 = v15;
    BOOL v16 = v15 != v88;
    if (v15 != v88)
    {
      uint64_t v17 = [v6 relationship];
      if (!v17)
      {

        char v11 = 0;
        if (v12 != v89)
        {
          LOBYTE(v27) = 1;
          v28 = v79;
          goto LABEL_83;
        }
        BOOL v27 = 0;
        v28 = v79;
LABEL_91:
        if (!v27) {
          goto LABEL_85;
        }
        goto LABEL_84;
      }
      v75 = (void *)v17;
      v18 = [(_HKEmergencyContact *)self relationship];
      v76 = [v6 relationship];
      v77 = v18;
      if (!objc_msgSend(v18, "isEqualToString:"))
      {
        v83 = v3;
        v19 = v12;
        char v11 = 0;
        v21 = v87;
        v20 = v88;
        goto LABEL_48;
      }
    }
    v22 = [(_HKEmergencyContact *)self nameRecordID];
    uint64_t v23 = [v6 nameRecordID];
    BOOL v72 = v22 != (void *)v23;
    v80 = (void *)v23;
    v83 = v3;
    if (v22 == (void *)v23)
    {
      v71 = v4;
    }
    else
    {
      uint64_t v24 = [v6 nameRecordID];
      v19 = v12;
      if (!v24)
      {

        char v11 = 0;
        v21 = v87;
        v20 = v88;
        if (v87 != v88)
        {
          LOBYTE(v34) = 1;
          goto LABEL_80;
        }
        BOOL v34 = 0;
        goto LABEL_93;
      }
      BOOL v25 = v16;
      v68 = (void *)v24;
      v26 = [(_HKEmergencyContact *)self nameRecordID];
      v69 = [v6 nameRecordID];
      v70 = v26;
      if (!objc_msgSend(v26, "isEqual:"))
      {
        v78 = v22;
        char v11 = 0;
        v21 = v87;
        v20 = v88;
        goto LABEL_47;
      }
      v71 = v4;
      BOOL v16 = v25;
      v12 = v19;
      v3 = v83;
    }
    uint64_t v29 = [(_HKEmergencyContact *)self phoneNumberPropertyID];
    [v6 phoneNumberPropertyID];
    v74 = v73 = (void *)v29;
    BOOL v30 = v29 == (void)v74;
    BOOL v31 = v29 != (void)v74;
    v78 = v22;
    if (!v30)
    {
      uint64_t v32 = [v6 phoneNumberPropertyID];
      if (!v32)
      {
        BOOL v67 = v16;

        v40 = v22;
        char v11 = 0;
        id v4 = v71;
        v21 = v87;
        v20 = v88;
        v19 = v12;
        if (v40 != v80)
        {
          LOBYTE(v41) = 1;
          goto LABEL_77;
        }
        BOOL v41 = 0;
LABEL_95:
        if (!v41)
        {
LABEL_79:

          BOOL v34 = v67;
          if (v21 != v20)
          {
LABEL_80:

            if (!v34) {
              goto LABEL_82;
            }
            goto LABEL_81;
          }
LABEL_93:
          if (v34) {
LABEL_81:
          }

LABEL_82:
          v12 = v19;
          BOOL v30 = v19 == v89;
          v28 = v79;
          BOOL v27 = v81;
          v3 = v83;
          if (!v30)
          {
LABEL_83:

            if (!v27)
            {
LABEL_85:

LABEL_86:
              if (v7 != v8)
              {

                goto LABEL_88;
              }
              goto LABEL_89;
            }
LABEL_84:

            goto LABEL_85;
          }
          goto LABEL_91;
        }
LABEL_78:

        goto LABEL_79;
      }
      BOOL v66 = v31;
      v61 = (void *)v32;
      v33 = [(_HKEmergencyContact *)self phoneNumberPropertyID];
      v62 = [v6 phoneNumberPropertyID];
      v63 = v33;
      if (!objc_msgSend(v33, "isEqual:"))
      {
        BOOL v67 = v16;
        char v11 = 0;
        v21 = v87;
        v20 = v88;
LABEL_46:
        v19 = v12;

        id v4 = v71;
        if (v78 == v80) {
          goto LABEL_79;
        }
LABEL_47:

        if (v21 != v20)
        {
LABEL_48:

          v12 = v19;
          BOOL v30 = v19 == v89;
          v14 = v79;
          v3 = v83;
          if (!v30) {
            goto LABEL_49;
          }
          goto LABEL_85;
        }
        goto LABEL_82;
      }
      BOOL v31 = v66;
    }
    v35 = [(_HKEmergencyContact *)self nameContactIdentifier];
    v64 = [v6 nameContactIdentifier];
    v65 = v35;
    if (v35 != v64)
    {
      uint64_t v36 = [v6 nameContactIdentifier];
      if (!v36)
      {
        BOOL v67 = v16;

        char v11 = 0;
        v21 = v87;
        v20 = v88;
        if (v73 != v74) {
          goto LABEL_68;
        }
LABEL_71:
        if (v31) {
          goto LABEL_72;
        }
LABEL_75:
        v19 = v12;
LABEL_76:

        id v4 = v71;
        BOOL v41 = v72;
        if (v78 != v80)
        {
LABEL_77:

          if (!v41) {
            goto LABEL_79;
          }
          goto LABEL_78;
        }
        goto LABEL_95;
      }
      v58 = (void *)v36;
      v37 = [(_HKEmergencyContact *)self nameContactIdentifier];
      v56 = [v6 nameContactIdentifier];
      v57 = v37;
      if (!objc_msgSend(v37, "isEqualToString:"))
      {
        BOOL v67 = v16;
        char v11 = 0;
        v21 = v87;
        v20 = v88;
        v39 = v64;
        v38 = v65;
LABEL_66:

        if (v73 != v74)
        {
          LOBYTE(v31) = 1;
LABEL_68:

          if (!v31) {
            goto LABEL_75;
          }
LABEL_72:
          v19 = v12;

          goto LABEL_76;
        }
        BOOL v31 = 0;
        goto LABEL_71;
      }
    }
    v42 = [(_HKEmergencyContact *)self phoneNumberContactIdentifier];
    [v6 phoneNumberContactIdentifier];
    v60 = v59 = v42;
    if (v42 != v60)
    {
      uint64_t v43 = [v6 phoneNumberContactIdentifier];
      if (!v43)
      {
        BOOL v67 = v16;
        char v11 = 0;
        v21 = v87;
        v20 = v88;
        goto LABEL_65;
      }
      v55 = (void *)v43;
      v44 = [(_HKEmergencyContact *)self phoneNumberContactIdentifier];
      v42 = [v6 phoneNumberContactIdentifier];
      v54 = v44;
      if (([v44 isEqualToString:v42] & 1) == 0)
      {

        char v11 = 0;
LABEL_99:
        if (v65 != v64)
        {
        }
        if (v73 != v74)
        {
        }
        if (v78 != v80)
        {
        }
        if (v87 != v88)
        {
        }
        if (v12 != v89)
        {
        }
LABEL_50:

        v10 = v85;
        v9 = v86;
        if (v7 != v8) {
          goto LABEL_51;
        }
LABEL_89:

        goto LABEL_90;
      }
    }
    v45 = [(_HKEmergencyContact *)self phoneNumberLabel];
    uint64_t v46 = [v6 phoneNumberLabel];
    char v11 = v45 == (void *)v46;
    if (v45 == (void *)v46)
    {
      v51 = v42;
      BOOL v67 = v16;
    }
    else
    {
      v53 = v42;
      v47 = (void *)v46;
      uint64_t v48 = [v6 phoneNumberLabel];
      if (v48)
      {
        v82 = (void *)v48;
        v49 = [(_HKEmergencyContact *)self phoneNumberLabel];
        v50 = [v6 phoneNumberLabel];
        char v11 = [v49 isEqualToString:v50];

        if (v59 == v60)
        {
        }
        else
        {
        }
        goto LABEL_99;
      }
      v51 = v53;
      BOOL v67 = v16;
    }
    v42 = v59;
    if (v59 == v60)
    {

      v39 = v64;
      v38 = v65;
      v21 = v87;
      v20 = v88;
      if (v65 != v64) {
        goto LABEL_66;
      }
LABEL_74:

      if (v73 == v74) {
        goto LABEL_75;
      }
      goto LABEL_46;
    }

    v21 = v87;
    v20 = v88;
LABEL_65:

    v39 = v64;
    v38 = v65;
    if (v65 != v64) {
      goto LABEL_66;
    }
    goto LABEL_74;
  }
  char v11 = 0;
LABEL_90:

  return v11;
}

- (BOOL)isEqualToSyncedContact:(id)a3
{
  id v8 = a3;
  v9 = [(_HKEmergencyContact *)self name];
  v10 = [v8 name];
  if (v9 != v10)
  {
    uint64_t v11 = [v8 name];
    if (!v11)
    {
      char v12 = 0;
      goto LABEL_40;
    }
    v5 = (void *)v11;
    v3 = [(_HKEmergencyContact *)self name];
    id v4 = [v8 name];
    if (![v3 isEqualToString:v4])
    {
      char v12 = 0;
LABEL_39:

      goto LABEL_40;
    }
  }
  uint64_t v13 = [(_HKEmergencyContact *)self phoneNumber];
  v14 = [v8 phoneNumber];
  if (v13 == v14)
  {
    uint64_t v43 = v13;
    goto LABEL_11;
  }
  uint64_t v15 = [v8 phoneNumber];
  if (v15)
  {
    v45 = v4;
    BOOL v16 = v3;
    uint64_t v17 = v5;
    BOOL v41 = (void *)v15;
    id v6 = [(_HKEmergencyContact *)self phoneNumber];
    v18 = [v8 phoneNumber];
    if (([v6 isEqualToString:v18] & 1) == 0)
    {

      char v12 = 0;
      v5 = v17;
      v3 = v16;
      id v4 = v45;
      if (v9 == v10) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    v37 = v18;
    uint64_t v43 = v13;
    v5 = v17;
    v3 = v16;
    id v4 = v45;
LABEL_11:
    uint64_t v19 = [(_HKEmergencyContact *)self phoneNumberLabel];
    v44 = [v8 phoneNumberLabel];
    v42 = (void *)v19;
    v40 = v6;
    if ((void *)v19 == v44)
    {
      v38 = v3;
      v39 = v14;
      uint64_t v46 = v4;
      [(_HKEmergencyContact *)self relationship];
    }
    else
    {
      uint64_t v20 = [v8 phoneNumberLabel];
      if (!v20)
      {
        char v12 = 0;
        uint64_t v29 = (void *)v19;
        goto LABEL_26;
      }
      v39 = v14;
      uint64_t v36 = (void *)v20;
      v21 = [(_HKEmergencyContact *)self phoneNumberLabel];
      v14 = [v8 phoneNumberLabel];
      if (([v21 isEqualToString:v14] & 1) == 0)
      {

        char v12 = 0;
        uint64_t v13 = v43;
        v14 = v39;
        BOOL v31 = v43 == v39;
LABEL_35:
        if (!v31)
        {
        }
        goto LABEL_37;
      }
      uint64_t v46 = v4;
      v38 = v3;
      [(_HKEmergencyContact *)self relationship];
    v22 = };
    uint64_t v23 = [v8 relationship];
    char v12 = v22 == (void *)v23;
    if (v22 == (void *)v23)
    {

      uint64_t v29 = v42;
      if (v42 == v44) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v24 = (void *)v23;
      v35 = v5;
      uint64_t v25 = [v8 relationship];
      if (v25)
      {
        v26 = (void *)v25;
        BOOL v27 = [(_HKEmergencyContact *)self relationship];
        v28 = [v8 relationship];
        char v12 = [v27 isEqualToString:v28];

        if (v42 == v44)
        {
        }
        else
        {
        }
        uint64_t v13 = v43;
        v3 = v38;
        v14 = v39;
        BOOL v31 = v43 == v39;
        v5 = v35;
        id v4 = v46;
        goto LABEL_35;
      }

      uint64_t v29 = v42;
      if (v42 == v44)
      {
LABEL_31:

        BOOL v30 = v43;
        v3 = v38;
        v14 = v39;
        id v4 = v46;
        if (v43 == v39) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }

    v3 = v38;
    v14 = v39;
    id v4 = v46;
LABEL_26:

    BOOL v30 = v43;
    if (v43 == v14)
    {
LABEL_28:

      goto LABEL_38;
    }
LABEL_27:

    goto LABEL_28;
  }
  char v12 = 0;
LABEL_37:

LABEL_38:
  if (v9 != v10) {
    goto LABEL_39;
  }
LABEL_40:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_HKEmergencyContact *)self name];
  [v4 encodeObject:v5 forKey:@"HKEmergencyContactNameKey"];

  id v6 = [(_HKEmergencyContact *)self phoneNumber];
  [v4 encodeObject:v6 forKey:@"HKEmergencyContactPhoneNumberKey"];

  objc_super v7 = [(_HKEmergencyContact *)self relationship];
  [v4 encodeObject:v7 forKey:@"HKEmergencyContactRelationshipKey"];

  id v8 = [(_HKEmergencyContact *)self nameRecordID];
  [v4 encodeObject:v8 forKey:@"HKEmergencyContactNameRecordIDKey"];

  v9 = [(_HKEmergencyContact *)self phoneNumberPropertyID];
  [v4 encodeObject:v9 forKey:@"HKEmergencyContactPhoneNumberPropertyIDKey"];

  v10 = [(_HKEmergencyContact *)self nameContactIdentifier];
  [v4 encodeObject:v10 forKey:@"HKEmergencyContactNameContactIdentifierKey"];

  uint64_t v11 = [(_HKEmergencyContact *)self phoneNumberContactIdentifier];
  [v4 encodeObject:v11 forKey:@"HKEmergencyContactPhoneNumberContactIdentifierKey"];

  id v12 = [(_HKEmergencyContact *)self phoneNumberLabel];
  [v4 encodeObject:v12 forKey:@"HKEmergencyContactPhoneNumberLabelKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_HKEmergencyContact allocWithZone:a3] init];
  v5 = [(_HKEmergencyContact *)self name];
  id v6 = (void *)[v5 copy];
  [(_HKEmergencyContact *)v4 setName:v6];

  objc_super v7 = [(_HKEmergencyContact *)self phoneNumber];
  id v8 = (void *)[v7 copy];
  [(_HKEmergencyContact *)v4 setPhoneNumber:v8];

  v9 = [(_HKEmergencyContact *)self relationship];
  v10 = (void *)[v9 copy];
  [(_HKEmergencyContact *)v4 setRelationship:v10];

  uint64_t v11 = [(_HKEmergencyContact *)self nameRecordID];
  id v12 = (void *)[v11 copy];
  [(_HKEmergencyContact *)v4 setNameRecordID:v12];

  uint64_t v13 = [(_HKEmergencyContact *)self phoneNumberPropertyID];
  v14 = (void *)[v13 copy];
  [(_HKEmergencyContact *)v4 setPhoneNumberPropertyID:v14];

  uint64_t v15 = [(_HKEmergencyContact *)self nameContactIdentifier];
  BOOL v16 = (void *)[v15 copy];
  [(_HKEmergencyContact *)v4 setNameContactIdentifier:v16];

  uint64_t v17 = [(_HKEmergencyContact *)self phoneNumberContactIdentifier];
  v18 = (void *)[v17 copy];
  [(_HKEmergencyContact *)v4 setPhoneNumberContactIdentifier:v18];

  uint64_t v19 = [(_HKEmergencyContact *)self phoneNumberLabel];
  uint64_t v20 = (void *)[v19 copy];
  [(_HKEmergencyContact *)v4 setPhoneNumberLabel:v20];

  return v4;
}

+ (id)emergencyContactWithContact:(id)a3 property:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 contact];

    id v5 = (id)v8;
  }
  v9 = objc_alloc_init(_HKEmergencyContact);
  v10 = _HKFormattedMedicalIDNameForContact(v5);
  [(_HKEmergencyContact *)v9 setName:v10];

  uint64_t v11 = [v5 identifier];
  [(_HKEmergencyContact *)v9 setNameContactIdentifier:v11];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60___HKEmergencyContact_emergencyContactWithContact_property___block_invoke;
  v14[3] = &unk_1E58C6138;
  id v12 = v9;
  uint64_t v15 = v12;
  _HKMedicalIDPhoneNumberForContact(v5, v7, v14);

  return v12;
}

+ (id)emergencyContactUsingSimCardNumberWithContact:(id)a3 property:(id)a4
{
  id v5 = a3;
  id v6 = +[_HKEmergencyContact emergencyContactWithContact:v5 property:a4];
  objc_super v7 = _HKMedicalIDSimNumberForContact(v5);

  if (v7) {
    [v6 setPhoneNumber:v7];
  }

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)nameRecordID
{
  return self->_nameRecordID;
}

- (void)setNameRecordID:(id)a3
{
}

- (NSString)nameContactIdentifier
{
  return self->_nameContactIdentifier;
}

- (void)setNameContactIdentifier:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSNumber)phoneNumberPropertyID
{
  return self->_phoneNumberPropertyID;
}

- (void)setPhoneNumberPropertyID:(id)a3
{
}

- (NSString)phoneNumberContactIdentifier
{
  return self->_phoneNumberContactIdentifier;
}

- (void)setPhoneNumberContactIdentifier:(id)a3
{
}

- (NSString)phoneNumberLabel
{
  return self->_phoneNumberLabel;
}

- (void)setPhoneNumberLabel:(id)a3
{
}

- (NSString)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_phoneNumberLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumberContactIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumberPropertyID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_nameContactIdentifier, 0);
  objc_storeStrong((id *)&self->_nameRecordID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end