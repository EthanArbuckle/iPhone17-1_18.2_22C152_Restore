@interface _HKClinicalContact
+ (BOOL)supportsSecureCoding;
+ (id)clinicalContactWithContact:(id)a3 property:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSyncedContact:(id)a3;
- (NSString)name;
- (NSString)nameContactIdentifier;
- (NSString)phoneNumber;
- (NSString)phoneNumberContactIdentifier;
- (NSString)phoneNumberLabel;
- (NSString)relationship;
- (_HKClinicalContact)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setNameContactIdentifier:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPhoneNumberContactIdentifier:(id)a3;
- (void)setPhoneNumberLabel:(id)a3;
- (void)setRelationship:(id)a3;
@end

@implementation _HKClinicalContact

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v4 = [(_HKClinicalContact *)self name];
  v5 = [(_HKClinicalContact *)self phoneNumber];
  v6 = [v3 stringWithFormat:@"[%@]:%@", v4, v5];

  return v6;
}

- (_HKClinicalContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_HKClinicalContact *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKClinicalContactNameKey"];
    [(_HKClinicalContact *)v5 setName:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKClinicalContactNameContactIdentifierKey"];
    [(_HKClinicalContact *)v5 setNameContactIdentifier:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKEClinicalContactPhoneNumberKey"];
    [(_HKClinicalContact *)v5 setPhoneNumber:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKClinicalContactPhoneNumberContactIdentifierKey"];
    [(_HKClinicalContact *)v5 setPhoneNumberContactIdentifier:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKClinicalContactPhoneNumberLabelKey"];
    [(_HKClinicalContact *)v5 setPhoneNumberLabel:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKClinicalContactRelationshipKey"];
    [(_HKClinicalContact *)v5 setRelationship:v11];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(_HKClinicalContact *)self name];
    v7 = [v5 name];
    if (v6 != v7)
    {
      uint64_t v8 = [v5 name];
      if (!v8)
      {
        char v11 = 0;
        goto LABEL_75;
      }
      v3 = (void *)v8;
      v9 = [(_HKClinicalContact *)self name];
      v10 = [v5 name];
      v64 = v9;
      if (![v9 isEqualToString:v10])
      {
        char v11 = 0;
LABEL_74:

        goto LABEL_75;
      }
      v63 = v10;
    }
    v12 = [(_HKClinicalContact *)self nameContactIdentifier];
    v13 = [v5 nameContactIdentifier];
    if (v12 != v13)
    {
      uint64_t v14 = [v5 nameContactIdentifier];
      if (!v14) {
        goto LABEL_32;
      }
      v15 = (void *)v14;
      v60 = v3;
      v16 = [(_HKClinicalContact *)self nameContactIdentifier];
      v17 = [v5 nameContactIdentifier];
      if (([v16 isEqualToString:v17] & 1) == 0)
      {

        char v11 = 0;
        v10 = v63;
        v3 = v60;
        if (v6 == v7) {
          goto LABEL_75;
        }
        goto LABEL_74;
      }
      v56 = v16;
      v57 = v15;
      v58 = v17;
      v3 = v60;
    }
    v18 = [(_HKClinicalContact *)self phoneNumber];
    uint64_t v19 = [v5 phoneNumber];
    v20 = (void *)v19;
    v62 = v18;
    if (v18 == (void *)v19)
    {
      v59 = (void *)v19;
      goto LABEL_18;
    }
    uint64_t v21 = [v5 phoneNumber];
    if (v21)
    {
      v55 = (void *)v21;
      v18 = [(_HKClinicalContact *)self phoneNumber];
      v22 = [v5 phoneNumber];
      if ([v18 isEqualToString:v22])
      {
        v51 = v18;
        v59 = v20;
        v50 = v22;
LABEL_18:
        v23 = [(_HKClinicalContact *)self phoneNumberContactIdentifier];
        v24 = [v5 phoneNumberContactIdentifier];
        if (v23 == v24)
        {
          v54 = v12;
LABEL_25:
          v27 = [(_HKClinicalContact *)self phoneNumberLabel];
          v53 = [v5 phoneNumberLabel];
          if (v27 == v53)
          {
            v48 = v24;
            v52 = v23;
            v61 = v3;
          }
          else
          {
            uint64_t v28 = [v5 phoneNumberLabel];
            if (!v28)
            {
              v52 = v23;
              char v11 = 0;
              v38 = v58;
              goto LABEL_52;
            }
            v43 = v27;
            v45 = (void *)v28;
            v29 = [(_HKClinicalContact *)self phoneNumberLabel];
            v18 = [v5 phoneNumberLabel];
            if (([v29 isEqualToString:v18] & 1) == 0)
            {

              v30 = v23;
              char v11 = 0;
              if (v30 != v24)
              {
LABEL_67:
                v31 = v59;

                v12 = v54;
LABEL_68:

                v39 = v62;
                if (v62 == v31)
                {
LABEL_70:

                  if (v12 != v13)
                  {
                  }
                  goto LABEL_73;
                }
LABEL_69:

                goto LABEL_70;
              }
LABEL_47:

              v31 = v59;
              v39 = v62;
              v12 = v54;
              if (v62 == v59) {
                goto LABEL_70;
              }
              goto LABEL_69;
            }
            v42 = v29;
            v48 = v24;
            v52 = v23;
            v61 = v3;
            v27 = v43;
          }
          v32 = [(_HKClinicalContact *)self relationship];
          uint64_t v33 = [v5 relationship];
          char v11 = v32 == (void *)v33;
          if (v32 == (void *)v33)
          {
          }
          else
          {
            v34 = (void *)v33;
            uint64_t v35 = [v5 relationship];
            if (v35)
            {
              v41 = v18;
              v44 = (void *)v35;
              v36 = [(_HKClinicalContact *)self relationship];
              v37 = [v5 relationship];
              char v11 = [v36 isEqualToString:v37];

              if (v27 == v53)
              {
              }
              else
              {
              }
              v30 = v52;
              v24 = v48;
              v3 = v61;
              if (v52 != v48) {
                goto LABEL_67;
              }
              goto LABEL_47;
            }
          }
          if (v27 == v53)
          {

            v24 = v48;
            v3 = v61;
            v38 = v58;
            if (v52 == v48) {
              goto LABEL_54;
            }
            goto LABEL_53;
          }

          v3 = v61;
          v38 = v58;
          v24 = v48;
LABEL_52:

          if (v52 == v24)
          {
LABEL_54:

            if (v62 != v59)
            {
            }
            if (v54 != v13)
            {
            }
LABEL_73:
            v10 = v63;
            if (v6 != v7) {
              goto LABEL_74;
            }
LABEL_75:

            goto LABEL_76;
          }
LABEL_53:

          goto LABEL_54;
        }
        uint64_t v25 = [v5 phoneNumberContactIdentifier];
        if (!v25)
        {
          v30 = v23;
          v31 = v59;
          char v11 = 0;
          goto LABEL_68;
        }
        v49 = (void *)v25;
        v54 = v12;
        v18 = [(_HKClinicalContact *)self phoneNumberContactIdentifier];
        v26 = [v5 phoneNumberContactIdentifier];
        if ([v18 isEqualToString:v26])
        {
          v46 = v26;
          v47 = v18;
          goto LABEL_25;
        }

        if (v62 == v59)
        {
        }
        else
        {
        }
        if (v54 != v13)
        {
        }
LABEL_34:
        char v11 = 0;
        goto LABEL_73;
      }
    }
    if (v12 == v13)
    {

      goto LABEL_33;
    }

LABEL_32:
LABEL_33:

    goto LABEL_34;
  }
  char v11 = 0;
LABEL_76:

  return v11;
}

- (BOOL)isEqualToSyncedContact:(id)a3
{
  id v8 = a3;
  v9 = [(_HKClinicalContact *)self name];
  v10 = [v8 name];
  if (v9 != v10)
  {
    uint64_t v11 = [v8 name];
    if (!v11)
    {
      char v12 = 0;
      goto LABEL_40;
    }
    id v5 = (void *)v11;
    v3 = [(_HKClinicalContact *)self name];
    id v4 = [v8 name];
    if (![v3 isEqualToString:v4])
    {
      char v12 = 0;
LABEL_39:

      goto LABEL_40;
    }
  }
  v13 = [(_HKClinicalContact *)self phoneNumber];
  uint64_t v14 = [v8 phoneNumber];
  if (v13 == v14)
  {
    v43 = v13;
    goto LABEL_11;
  }
  uint64_t v15 = [v8 phoneNumber];
  if (v15)
  {
    v45 = v4;
    v16 = v3;
    v17 = v5;
    v41 = (void *)v15;
    v6 = [(_HKClinicalContact *)self phoneNumber];
    v18 = [v8 phoneNumber];
    if (([v6 isEqualToString:v18] & 1) == 0)
    {

      char v12 = 0;
      id v5 = v17;
      v3 = v16;
      id v4 = v45;
      if (v9 == v10) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    v37 = v18;
    v43 = v13;
    id v5 = v17;
    v3 = v16;
    id v4 = v45;
LABEL_11:
    uint64_t v19 = [(_HKClinicalContact *)self phoneNumberLabel];
    v44 = [v8 phoneNumberLabel];
    v42 = (void *)v19;
    v40 = v6;
    if ((void *)v19 == v44)
    {
      v38 = v3;
      v39 = v14;
      v46 = v4;
      [(_HKClinicalContact *)self relationship];
    }
    else
    {
      uint64_t v20 = [v8 phoneNumberLabel];
      if (!v20)
      {
        char v12 = 0;
        v29 = (void *)v19;
        goto LABEL_26;
      }
      v39 = v14;
      v36 = (void *)v20;
      uint64_t v21 = [(_HKClinicalContact *)self phoneNumberLabel];
      uint64_t v14 = [v8 phoneNumberLabel];
      if (([v21 isEqualToString:v14] & 1) == 0)
      {

        char v12 = 0;
        v13 = v43;
        uint64_t v14 = v39;
        BOOL v31 = v43 == v39;
LABEL_35:
        if (!v31)
        {
        }
        goto LABEL_37;
      }
      v46 = v4;
      v38 = v3;
      [(_HKClinicalContact *)self relationship];
    v22 = };
    uint64_t v23 = [v8 relationship];
    char v12 = v22 == (void *)v23;
    if (v22 == (void *)v23)
    {

      v29 = v42;
      if (v42 == v44) {
        goto LABEL_31;
      }
    }
    else
    {
      v24 = (void *)v23;
      uint64_t v35 = v5;
      uint64_t v25 = [v8 relationship];
      if (v25)
      {
        v26 = (void *)v25;
        v27 = [(_HKClinicalContact *)self relationship];
        uint64_t v28 = [v8 relationship];
        char v12 = [v27 isEqualToString:v28];

        if (v42 == v44)
        {
        }
        else
        {
        }
        v13 = v43;
        v3 = v38;
        uint64_t v14 = v39;
        BOOL v31 = v43 == v39;
        id v5 = v35;
        id v4 = v46;
        goto LABEL_35;
      }

      v29 = v42;
      if (v42 == v44)
      {
LABEL_31:

        v30 = v43;
        v3 = v38;
        uint64_t v14 = v39;
        id v4 = v46;
        if (v43 == v39) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }

    v3 = v38;
    uint64_t v14 = v39;
    id v4 = v46;
LABEL_26:

    v30 = v43;
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
  id v5 = [(_HKClinicalContact *)self name];
  [v4 encodeObject:v5 forKey:@"HKClinicalContactNameKey"];

  v6 = [(_HKClinicalContact *)self nameContactIdentifier];
  [v4 encodeObject:v6 forKey:@"HKClinicalContactNameContactIdentifierKey"];

  v7 = [(_HKClinicalContact *)self phoneNumber];
  [v4 encodeObject:v7 forKey:@"HKEClinicalContactPhoneNumberKey"];

  id v8 = [(_HKClinicalContact *)self phoneNumberContactIdentifier];
  [v4 encodeObject:v8 forKey:@"HKClinicalContactPhoneNumberContactIdentifierKey"];

  v9 = [(_HKClinicalContact *)self phoneNumberLabel];
  [v4 encodeObject:v9 forKey:@"HKClinicalContactPhoneNumberLabelKey"];

  id v10 = [(_HKClinicalContact *)self relationship];
  [v4 encodeObject:v10 forKey:@"HKClinicalContactRelationshipKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_HKClinicalContact allocWithZone:a3] init];
  id v5 = [(_HKClinicalContact *)self name];
  v6 = (void *)[v5 copy];
  [(_HKClinicalContact *)v4 setName:v6];

  v7 = [(_HKClinicalContact *)self nameContactIdentifier];
  id v8 = (void *)[v7 copy];
  [(_HKClinicalContact *)v4 setNameContactIdentifier:v8];

  v9 = [(_HKClinicalContact *)self phoneNumber];
  id v10 = (void *)[v9 copy];
  [(_HKClinicalContact *)v4 setPhoneNumber:v10];

  uint64_t v11 = [(_HKClinicalContact *)self phoneNumberContactIdentifier];
  char v12 = (void *)[v11 copy];
  [(_HKClinicalContact *)v4 setPhoneNumberContactIdentifier:v12];

  v13 = [(_HKClinicalContact *)self phoneNumberLabel];
  uint64_t v14 = (void *)[v13 copy];
  [(_HKClinicalContact *)v4 setPhoneNumberLabel:v14];

  uint64_t v15 = [(_HKClinicalContact *)self relationship];
  v16 = (void *)[v15 copy];
  [(_HKClinicalContact *)v4 setRelationship:v16];

  return v4;
}

+ (id)clinicalContactWithContact:(id)a3 property:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 contact];

    id v5 = (id)v8;
  }
  v9 = objc_alloc_init(_HKClinicalContact);
  id v10 = _HKFormattedMedicalIDNameForContact(v5);
  [(_HKClinicalContact *)v9 setName:v10];

  uint64_t v11 = [v5 identifier];
  [(_HKClinicalContact *)v9 setNameContactIdentifier:v11];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58___HKClinicalContact_clinicalContactWithContact_property___block_invoke;
  v14[3] = &unk_1E58C6138;
  char v12 = v9;
  uint64_t v15 = v12;
  _HKMedicalIDPhoneNumberForContact(v5, v7, v14);

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
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
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_nameContactIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end