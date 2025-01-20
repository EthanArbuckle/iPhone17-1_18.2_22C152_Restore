@interface CNChangeHistoryContactChange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNChangeHistoryAnchor)changeAnchor;
- (CNChangeHistoryContactChange)initWithCoder:(id)a3;
- (CNChangeHistoryContactChange)initWithIdentifier:(id)a3 changeType:(int64_t)a4 changeAnchor:(id)a5 changeID:(id)a6;
- (CNChangeHistoryContactChange)initWithIdentifier:(id)a3 changeType:(int64_t)a4 changeAnchor:(id)a5 changeID:(id)a6 externalID:(id)a7 imagesChanged:(id)a8 linkToPersonUUID:(id)a9 personLinkUUID:(id)a10;
- (CNContact)contact;
- (NSArray)linkedContactIdentifiers;
- (NSNumber)changeID;
- (NSNumber)imagesChanged;
- (NSString)contactIdentifier;
- (NSString)externalID;
- (NSString)externalModificationTag;
- (NSString)externalURI;
- (NSString)linkToPersonUUID;
- (NSString)personLinkUUID;
- (id)description;
- (int64_t)changeType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChangeAnchor:(id)a3;
- (void)setChangeID:(id)a3;
- (void)setChangeType:(int64_t)a3;
- (void)setContact:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalURI:(id)a3;
- (void)setImagesChanged:(id)a3;
- (void)setLinkToPersonUUID:(id)a3;
- (void)setLinkedContactIdentifiers:(id)a3;
- (void)setPersonLinkUUID:(id)a3;
@end

@implementation CNChangeHistoryContactChange

- (CNChangeHistoryContactChange)initWithIdentifier:(id)a3 changeType:(int64_t)a4 changeAnchor:(id)a5 changeID:(id)a6
{
  return [(CNChangeHistoryContactChange *)self initWithIdentifier:a3 changeType:a4 changeAnchor:a5 changeID:a6 externalID:0 imagesChanged:0 linkToPersonUUID:0 personLinkUUID:0];
}

- (CNChangeHistoryContactChange)initWithIdentifier:(id)a3 changeType:(int64_t)a4 changeAnchor:(id)a5 changeID:(id)a6 externalID:(id)a7 imagesChanged:(id)a8 linkToPersonUUID:(id)a9 personLinkUUID:(id)a10
{
  v16 = (__CFString *)a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v42.receiver = self;
  v42.super_class = (Class)CNChangeHistoryContactChange;
  v23 = [(CNChangeHistoryContactChange *)&v42 init];
  if (v23)
  {
    int v24 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))();
    if (a4 != 10 || v24)
    {
      if (v24)
      {
LABEL_9:
        uint64_t v26 = [(__CFString *)v16 copy];
        contactIdentifier = v23->_contactIdentifier;
        v23->_contactIdentifier = (NSString *)v26;

        v23->_changeType = a4;
        uint64_t v28 = [v17 copy];
        changeAnchor = v23->_changeAnchor;
        v23->_changeAnchor = (CNChangeHistoryAnchor *)v28;

        uint64_t v30 = [v18 copy];
        changeID = v23->_changeID;
        v23->_changeID = (NSNumber *)v30;

        uint64_t v32 = [v19 copy];
        externalID = v23->_externalID;
        v23->_externalID = (NSString *)v32;

        uint64_t v34 = [v20 copy];
        imagesChanged = v23->_imagesChanged;
        v23->_imagesChanged = (NSNumber *)v34;

        uint64_t v36 = [v21 copy];
        linkToPersonUUID = v23->_linkToPersonUUID;
        v23->_linkToPersonUUID = (NSString *)v36;

        uint64_t v38 = [v22 copy];
        personLinkUUID = v23->_personLinkUUID;
        v23->_personLinkUUID = (NSString *)v38;

        v40 = v23;
        goto LABEL_10;
      }
      v25 = +[CNChangeHistory os_log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[CNChangeHistoryContactChange initWithIdentifier:changeType:changeAnchor:changeID:externalID:imagesChanged:linkToPersonUUID:personLinkUUID:]((uint64_t)v18, a4, v25);
      }
    }
    else
    {
      v25 = v16;
      v16 = &stru_1EE052B80;
    }

    goto LABEL_9;
  }
LABEL_10:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryContactChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactIdentifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"_changeType"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_changeAnchor"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_changeID"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_externalID"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imagesChanged"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_linkToPersonUUID"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_personLinkUUID"];

  v13 = [(CNChangeHistoryContactChange *)self initWithIdentifier:v5 changeType:v6 changeAnchor:v7 changeID:v8 externalID:v9 imagesChanged:v10 linkToPersonUUID:v11 personLinkUUID:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  contactIdentifier = self->_contactIdentifier;
  id v5 = a3;
  [v5 encodeObject:contactIdentifier forKey:@"_contactIdentifier"];
  [v5 encodeInteger:self->_changeType forKey:@"_changeType"];
  [v5 encodeObject:self->_changeAnchor forKey:@"_changeAnchor"];
  [v5 encodeObject:self->_changeID forKey:@"_changeID"];
  [v5 encodeObject:self->_externalID forKey:@"_externalID"];
  [v5 encodeObject:self->_imagesChanged forKey:@"_imagesChanged"];
  [v5 encodeObject:self->_linkToPersonUUID forKey:@"_linkToPersonUUID"];
  [v5 encodeObject:self->_personLinkUUID forKey:@"_personLinkUUID"];
}

- (id)description
{
  v14 = (void *)MEMORY[0x1E4F5A3A8];
  v3 = [(CNChangeHistoryContactChange *)self contactIdentifier];
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNChangeHistoryContactChange changeType](self, "changeType"));
  id v5 = [(CNChangeHistoryContactChange *)self changeAnchor];
  uint64_t v6 = [(CNChangeHistoryContactChange *)self changeID];
  v7 = [(CNChangeHistoryContactChange *)self externalID];
  v8 = [(CNChangeHistoryContactChange *)self imagesChanged];
  v9 = [(CNChangeHistoryContactChange *)self linkToPersonUUID];
  v10 = [(CNChangeHistoryContactChange *)self personLinkUUID];
  v11 = [(CNChangeHistoryContactChange *)self contact];
  objc_msgSend(v14, "descriptionForObject:withNamesAndObjects:", self, @"contactIdentifier", v3, @"changeType", v4, @"changeAnchor", v5, @"changeID", v6, @"externalID", v7, @"imagesChanged", v8, @"linkToPersonUUID", v9, @"personLinkUUID", v10,
    @"contact",
    v11,
  v12 = 0);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke;
  v35[3] = &unk_1E56B3E18;
  v35[4] = self;
  id v36 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v6 = v36;
  id v34 = v6;
  v7 = _Block_copy(aBlock);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_3;
  v31[3] = &unk_1E56B3E18;
  v31[4] = self;
  id v8 = v6;
  id v32 = v8;
  v9 = _Block_copy(v31);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_4;
  v29[3] = &unk_1E56B3E18;
  v29[4] = self;
  id v10 = v8;
  id v30 = v10;
  v11 = _Block_copy(v29);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_5;
  v27[3] = &unk_1E56B3E18;
  v27[4] = self;
  id v12 = v10;
  id v28 = v12;
  v13 = _Block_copy(v27);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_6;
  v25[3] = &unk_1E56B3E18;
  v25[4] = self;
  id v14 = v12;
  id v26 = v14;
  v15 = _Block_copy(v25);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_7;
  v23[3] = &unk_1E56B3E18;
  v23[4] = self;
  id v16 = v14;
  id v24 = v16;
  id v17 = _Block_copy(v23);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_8;
  v21[3] = &unk_1E56B3E18;
  v21[4] = self;
  id v22 = v16;
  id v18 = v16;
  id v19 = _Block_copy(v21);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v18, self, v35, v7, v9, v11, v13, v15, v17, v19, 0);

  return (char)self;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) contactIdentifier];
  id v4 = [*(id *)(a1 + 40) contactIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) changeType];
  uint64_t v4 = [*(id *)(a1 + 40) changeType];

  return [v2 isInteger:v3 equalToOther:v4];
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) changeAnchor];
  uint64_t v4 = [*(id *)(a1 + 40) changeAnchor];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) changeID];
  uint64_t v4 = [*(id *)(a1 + 40) changeID];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_5(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) externalID];
  uint64_t v4 = [*(id *)(a1 + 40) externalID];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_6(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) imagesChanged];
  uint64_t v4 = [*(id *)(a1 + 40) imagesChanged];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_7(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) linkToPersonUUID];
  uint64_t v4 = [*(id *)(a1 + 40) linkToPersonUUID];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_8(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) personLinkUUID];
  uint64_t v4 = [*(id *)(a1 + 40) personLinkUUID];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __36__CNChangeHistoryContactChange_hash__block_invoke;
  v20[3] = &unk_1E56B3E40;
  v20[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  uint64_t v4 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_3;
  v18[3] = &unk_1E56B3E40;
  v18[4] = self;
  uint64_t v5 = _Block_copy(v18);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_4;
  v17[3] = &unk_1E56B3E40;
  v17[4] = self;
  id v6 = _Block_copy(v17);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_5;
  v16[3] = &unk_1E56B3E40;
  v16[4] = self;
  v7 = _Block_copy(v16);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_6;
  v15[3] = &unk_1E56B3E40;
  v15[4] = self;
  id v8 = _Block_copy(v15);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_7;
  v14[3] = &unk_1E56B3E40;
  v14[4] = self;
  v9 = _Block_copy(v14);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_8;
  v13[3] = &unk_1E56B3E40;
  v13[4] = self;
  id v10 = _Block_copy(v13);
  unint64_t v11 = objc_msgSend(v3, "hashWithBlocks:", v20, v4, v5, v6, v7, v8, v9, v10, 0);

  return v11;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) contactIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) changeType];

  return [v1 integerHash:v2];
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) changeAnchor];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) changeID];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_5(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) externalID];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_6(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) imagesChanged];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_7(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) linkToPersonUUID];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_8(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) personLinkUUID];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSArray)linkedContactIdentifiers
{
  return self->_linkedContactIdentifiers;
}

- (void)setLinkedContactIdentifiers:(id)a3
{
}

- (CNChangeHistoryAnchor)changeAnchor
{
  return self->_changeAnchor;
}

- (void)setChangeAnchor:(id)a3
{
}

- (NSNumber)changeID
{
  return self->_changeID;
}

- (void)setChangeID:(id)a3
{
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
}

- (NSNumber)imagesChanged
{
  return self->_imagesChanged;
}

- (void)setImagesChanged:(id)a3
{
}

- (NSString)linkToPersonUUID
{
  return self->_linkToPersonUUID;
}

- (void)setLinkToPersonUUID:(id)a3
{
}

- (NSString)personLinkUUID
{
  return self->_personLinkUUID;
}

- (void)setPersonLinkUUID:(id)a3
{
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (void)setExternalURI:(id)a3
{
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_personLinkUUID, 0);
  objc_storeStrong((id *)&self->_linkToPersonUUID, 0);
  objc_storeStrong((id *)&self->_imagesChanged, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_changeID, 0);
  objc_storeStrong((id *)&self->_changeAnchor, 0);
  objc_storeStrong((id *)&self->_linkedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log changeType:changeAnchor:changeID:externalID:imagesChanged:linkToPersonUUID:personLinkUUID:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "Attempt to create a change history event without an expected contact identifier! Change id: %{public}@, type: %ld", (uint8_t *)&v3, 0x16u);
}

@end