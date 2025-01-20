@interface SGRealtimeContact
+ (BOOL)supportsSecureCoding;
+ (id)realtimeContactForFields:(id)a3 updatedFields:(int)a4 addedToCuratedContact:(id)a5;
+ (id)realtimeContactForNewContact:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRealtimeContact:(id)a3;
- (BOOL)isHarvested;
- (NSString)cnContactIdentifier;
- (NSString)description;
- (SGContact)contact;
- (SGExtractionInfo)extractionInfo;
- (SGRealtimeContact)initWithCoder:(id)a3;
- (SGRealtimeContact)initWithState:(int)a3 updatedFields:(int)a4 contact:(id)a5 identifier:(id)a6;
- (id)markedAsHarvested;
- (int)state;
- (int)updatedFields;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCnContactIdentifier:(id)a3;
- (void)setExtractionInfo;
@end

@implementation SGRealtimeContact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (BOOL)isHarvested
{
  return self->_isHarvested;
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (SGContact)contact
{
  return self->_contact;
}

- (int)updatedFields
{
  return self->_updatedFields;
}

- (int)state
{
  return self->_state;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGRealtimeContact state=%i identifier=%@\ncontact = %@\n>", self->_state, self->_cnContactIdentifier, self->_contact];

  return (NSString *)v2;
}

- (void)setCnContactIdentifier:(id)a3
{
}

- (void)setExtractionInfo
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  v4 = [(SGContact *)self->_contact name];
  if (v4)
  {
    v5 = [(SGContact *)self->_contact name];
    v2 = [v5 extractionInfo];
    uint64_t v6 = [v2 extractionType];
  }
  else
  {
    uint64_t v6 = 0;
  }

  v7 = objc_opt_new();
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v79 = self;
  v8 = [(SGContact *)self->_contact phones];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v92 objects:v99 count:16];
  if (v9)
  {
    v2 = (void *)v9;
    uint64_t v10 = *(void *)v93;
    float v11 = 0.0;
    float v12 = 0.0;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v93 != v10) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v92 + 1) + 8 * i);
        v15 = [v14 extractionInfo];
        v6 |= [v15 extractionType];

        float v11 = v11 + 1.0;
        v16 = [v14 extractionInfo];
        v17 = [v16 confidence];
        [v17 floatValue];
        float v12 = v12 + v18;

        v19 = [v14 extractionInfo];
        uint64_t v20 = [v19 modelVersion];
        v21 = (void *)v20;
        if (v20) {
          v22 = (void *)v20;
        }
        else {
          v22 = &unk_1EF92F6D0;
        }
        [v7 addObject:v22];
      }
      v2 = (void *)[v8 countByEnumeratingWithState:&v92 objects:v99 count:16];
    }
    while (v2);
  }
  else
  {
    float v11 = 0.0;
    float v12 = 0.0;
  }

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v23 = [(SGContact *)v79->_contact postalAddresses];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v88 objects:v98 count:16];
  if (v24)
  {
    v2 = (void *)v24;
    uint64_t v25 = *(void *)v89;
    do
    {
      for (j = 0; j != v2; j = (char *)j + 1)
      {
        if (*(void *)v89 != v25) {
          objc_enumerationMutation(v23);
        }
        v27 = *(void **)(*((void *)&v88 + 1) + 8 * (void)j);
        v28 = [v27 extractionInfo];
        v6 |= [v28 extractionType];

        float v11 = v11 + 1.0;
        v29 = [v27 extractionInfo];
        v30 = [v29 confidence];
        [v30 floatValue];
        float v12 = v12 + v31;

        v32 = [v27 extractionInfo];
        uint64_t v33 = [v32 modelVersion];
        v34 = (void *)v33;
        if (v33) {
          v35 = (void *)v33;
        }
        else {
          v35 = &unk_1EF92F6D0;
        }
        [v7 addObject:v35];
      }
      v2 = (void *)[v23 countByEnumeratingWithState:&v88 objects:v98 count:16];
    }
    while (v2);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v36 = [(SGContact *)v79->_contact emailAddresses];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v84 objects:v97 count:16];
  if (v37)
  {
    v2 = (void *)v37;
    uint64_t v38 = *(void *)v85;
    do
    {
      for (k = 0; k != v2; k = (char *)k + 1)
      {
        if (*(void *)v85 != v38) {
          objc_enumerationMutation(v36);
        }
        v40 = *(void **)(*((void *)&v84 + 1) + 8 * (void)k);
        v41 = [v40 extractionInfo];
        v6 |= [v41 extractionType];

        float v11 = v11 + 1.0;
        v42 = [v40 extractionInfo];
        v43 = [v42 confidence];
        [v43 floatValue];
        float v12 = v12 + v44;

        v45 = [v40 extractionInfo];
        uint64_t v46 = [v45 modelVersion];
        v47 = (void *)v46;
        if (v46) {
          v48 = (void *)v46;
        }
        else {
          v48 = &unk_1EF92F6D0;
        }
        [v7 addObject:v48];
      }
      v2 = (void *)[v36 countByEnumeratingWithState:&v84 objects:v97 count:16];
    }
    while (v2);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v49 = [(SGContact *)v79->_contact socialProfiles];
  uint64_t v50 = [v49 countByEnumeratingWithState:&v80 objects:v96 count:16];
  if (v50)
  {
    v2 = (void *)v50;
    uint64_t v51 = *(void *)v81;
    do
    {
      for (m = 0; m != v2; m = (char *)m + 1)
      {
        if (*(void *)v81 != v51) {
          objc_enumerationMutation(v49);
        }
        v53 = *(void **)(*((void *)&v80 + 1) + 8 * (void)m);
        v54 = [v53 extractionInfo];
        v6 |= [v54 extractionType];

        float v11 = v11 + 1.0;
        v55 = [v53 extractionInfo];
        v56 = [v55 confidence];
        [v56 floatValue];
        float v12 = v12 + v57;

        v58 = [v53 extractionInfo];
        uint64_t v59 = [v58 modelVersion];
        v60 = (void *)v59;
        if (v59) {
          v61 = (void *)v59;
        }
        else {
          v61 = &unk_1EF92F6D0;
        }
        [v7 addObject:v61];
      }
      v2 = (void *)[v49 countByEnumeratingWithState:&v80 objects:v96 count:16];
    }
    while (v2);
  }

  v62 = [(SGContact *)v79->_contact birthday];

  if (v62)
  {
    v63 = [(SGContact *)v79->_contact birthday];
    v64 = [v63 extractionInfo];
    v6 |= [v64 extractionType];

    float v11 = v11 + 1.0;
    v65 = [(SGContact *)v79->_contact birthday];
    v66 = [v65 extractionInfo];
    v67 = [v66 confidence];
    [v67 floatValue];
    float v12 = v12 + v68;

    v69 = [(SGContact *)v79->_contact birthday];
    v2 = [v69 extractionInfo];
    uint64_t v70 = [v2 modelVersion];
    v71 = (void *)v70;
    if (v70) {
      v72 = (void *)v70;
    }
    else {
      v72 = &unk_1EF92F6D0;
    }
    [v7 addObject:v72];
  }
  uint64_t v73 = [v7 count];
  if (v73 == 1)
  {
    v2 = [v7 allObjects];
    v75 = [v2 firstObject];
  }
  else
  {
    v75 = &unk_1EF92F6E8;
  }
  if (v11 <= 0.0)
  {
    v76 = 0;
  }
  else
  {
    *(float *)&double v74 = v12 / v11;
    v76 = [NSNumber numberWithFloat:v74];
  }
  uint64_t v77 = +[SGExtractionInfo extractionInfoWithExtractionType:v6 modelVersion:v75 confidence:v76];
  extractionInfo = v79->_extractionInfo;
  v79->_extractionInfo = (SGExtractionInfo *)v77;

  if (v11 > 0.0) {
  if (v73 == 1)
  }
  {
  }
}

- (unint64_t)hash
{
  return (unint64_t)self->_cnContactIdentifier;
}

- (BOOL)isEqualToRealtimeContact:(id)a3
{
  v4 = (id *)a3;
  int state = self->_state;
  if (state != [v4 state])
  {
    BOOL v8 = 0;
    goto LABEL_6;
  }
  cnContactIdentifier = self->_cnContactIdentifier;
  v7 = [v4 cnContactIdentifier];
  if (cnContactIdentifier != v7) {
    goto LABEL_3;
  }
  extractionInfo = self->_extractionInfo;
  float v11 = (SGExtractionInfo *)v4[5];
  if (extractionInfo == v11)
  {
  }
  else
  {
    float v12 = v11;
    v13 = extractionInfo;
    char v14 = [(SGExtractionInfo *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_3;
    }
  }
  contact = self->_contact;
  v16 = (SGContact *)v4[3];
  if (contact == v16)
  {

LABEL_15:
    int isHarvested = self->_isHarvested;
    BOOL v8 = isHarvested == [v4 isHarvested];
    goto LABEL_4;
  }
  v17 = v16;
  float v18 = contact;
  BOOL v19 = [(SGContact *)v18 isEqual:v17];

  if (v19) {
    goto LABEL_15;
  }
LABEL_3:
  BOOL v8 = 0;
LABEL_4:

LABEL_6:
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGRealtimeContact *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGRealtimeContact *)self isEqualToRealtimeContact:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInt32:state forKey:@"state"];
  [v5 encodeObject:self->_extractionInfo forKey:@"extractionInfo"];
  [v5 encodeObject:self->_contact forKey:@"contact"];
  [v5 encodeObject:self->_cnContactIdentifier forKey:@"cnContactIdentifier"];
  [v5 encodeBool:self->_isHarvested forKey:@"isHarvested"];
  [v5 encodeInt32:self->_updatedFields forKey:@"updatedFields"];
}

- (SGRealtimeContact)initWithCoder:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SGRealtimeContact;
  BOOL v6 = [(SGRealtimeContact *)&v18 init];
  if (v6)
  {
    v6->_uint64_t state = [v5 decodeInt32ForKey:@"state"];
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"extractionInfo"];
    extractionInfo = v6->_extractionInfo;
    v6->_extractionInfo = (SGExtractionInfo *)v8;

    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    float v11 = [v5 decodeObjectOfClasses:v10 forKey:@"contact"];

    if (v11)
    {
      float v12 = v11;
      contact = v6->_contact;
      v6->_contact = v12;
    }
    else
    {
      contact = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(contact, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGRealtimeContact.m", 64, @"nonnull property %s *%s was null when decoded", "SGContact", "contact");
    }

    char v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v15 = [v5 decodeObjectOfClasses:v14 forKey:@"cnContactIdentifier"];
    cnContactIdentifier = v6->_cnContactIdentifier;
    v6->_cnContactIdentifier = (NSString *)v15;

    v6->_int isHarvested = [v5 decodeBoolForKey:@"isHarvested"];
    v6->_updatedFields = [v5 decodeInt32ForKey:@"updatedFields"];
  }

  return v6;
}

- (id)markedAsHarvested
{
  v2 = [[SGRealtimeContact alloc] initWithState:self->_state updatedFields:self->_updatedFields contact:self->_contact identifier:self->_cnContactIdentifier];
  v2->_int isHarvested = 1;

  return v2;
}

- (SGRealtimeContact)initWithState:(int)a3 updatedFields:(int)a4 contact:(id)a5 identifier:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGRealtimeContact.m", 35, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)SGRealtimeContact;
  v13 = [(SGRealtimeContact *)&v17 init];
  char v14 = v13;
  if (v13)
  {
    v13->_uint64_t state = a3;
    v13->_updatedFields = [v11 updatedFields];
    objc_storeStrong((id *)&v14->_contact, a5);
    objc_storeStrong((id *)&v14->_cnContactIdentifier, a6);
    [(SGRealtimeContact *)v14 setExtractionInfo];
  }

  return v14;
}

+ (id)realtimeContactForFields:(id)a3 updatedFields:(int)a4 addedToCuratedContact:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [[SGRealtimeContact alloc] initWithState:2 updatedFields:v5 contact:v8 identifier:v7];

  return v9;
}

+ (id)realtimeContactForNewContact:(id)a3
{
  id v3 = a3;
  v4 = [[SGRealtimeContact alloc] initWithState:1 updatedFields:0 contact:v3 identifier:&stru_1EF915628];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end