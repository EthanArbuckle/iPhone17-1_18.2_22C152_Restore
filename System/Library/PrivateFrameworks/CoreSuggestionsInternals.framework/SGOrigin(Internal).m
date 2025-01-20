@interface SGOrigin(Internal)
+ (id)originForDuplicateKey:()Internal entity:parent:store:;
+ (id)originForDuplicateKey:()Internal sourceKey:store:;
+ (uint64_t)originTypeForEntityType:()Internal;
- (uint64_t)addDetailsFromOriginatingContactEntity:()Internal;
- (uint64_t)addDetailsFromOriginatingGenericEntity:()Internal;
- (uint64_t)addDetailsFromParticipantsOfEntity:()Internal;
- (void)addDetailsFromOriginatingCalendarEntity:()Internal;
- (void)addDetailsFromOriginatingInteractionEntity:()Internal;
- (void)addDetailsFromOriginatingMessageEntity:()Internal;
- (void)addRecipientDetailsFromOriginatingMessageEntity:()Internal entity:store:;
- (void)addSnippetIfNotExistsFromContentOfEntity:()Internal;
@end

@implementation SGOrigin(Internal)

- (void)addRecipientDetailsFromOriginatingMessageEntity:()Internal entity:store:
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F5D9F0];
  id v11 = a3;
  v12 = [v10 isSent];
  int v13 = [v11 hasTag:v12];

  v14 = [MEMORY[0x1E4F5D9F0] isSent];
  char v15 = [v8 hasTag:v14];

  *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F5DBC8]) = v13;
  if (v13 && (v15 & 1) == 0)
  {
    v16 = objc_msgSend(MEMORY[0x1E4F5DB20], "recordIdWithInternalEntityId:", objc_msgSend(v8, "groupId"));
    v17 = [v9 loadEntityByRecordId:v16];

    uint64_t v18 = [v17 title];
    v19 = [v17 duplicateKey];
    v20 = [v19 pseudoContactKey];
    v21 = [v20 identityKey];

    id v32 = v9;
    if ([v21 type] == 1)
    {
      v22 = (void *)v18;
      v23 = [v21 emailAddress];
      v24 = (id *)MEMORY[0x1E4F1ADC8];
    }
    else if ([v21 type] == 3)
    {
      v22 = (void *)v18;
      v23 = [v21 phone];
      v24 = (id *)MEMORY[0x1E4F1AEE0];
    }
    else
    {
      v22 = (void *)v18;
      if ([v21 type] != 5)
      {
        v23 = &stru_1F24EEF20;
        v25 = &stru_1F24EEF20;
        goto LABEL_10;
      }
      v23 = [v21 socialProfile];
      v24 = (id *)MEMORY[0x1E4F1AF78];
    }
    v25 = (__CFString *)*v24;
LABEL_10:
    id v26 = objc_alloc(MEMORY[0x1E4F23810]);
    v34[0] = v23;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    v28 = (void *)[v26 initWithDisplayName:v22 handles:v27 handleIdentifier:v25];

    v33 = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    uint64_t v30 = (int)*MEMORY[0x1E4F5DBE8];
    v31 = *(void **)(a1 + v30);
    *(void *)(a1 + v30) = v29;

    id v9 = v32;
  }
}

- (void)addSnippetIfNotExistsFromContentOfEntity:()Internal
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (int)*MEMORY[0x1E4F5DBA8];
    if (!*(void *)(a1 + v6))
    {
      id v7 = [v4 content];
      id v8 = v7;
      if (v7 && (unint64_t)[v7 length] > 0x7D0)
      {
        v10 = (void *)MEMORY[0x1CB79B230]();
        id v11 = NSString;
        v12 = [v8 substringToIndex:1999];
        v23[0] = v12;
        v23[1] = @"…";
        int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        objc_msgSend(v11, "_pas_proxyStringByConcatenatingStrings:", v13);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v9 = v8;
      }

      v14 = *(void **)(a1 + v6);
      *(void *)(a1 + v6) = v9;

      if (objc_msgSend(*(id *)(a1 + v6), "_pas_retainsConmingledBackingStore"))
      {
        uint64_t v15 = [[NSString alloc] initWithString:*(void *)(a1 + v6)];
        v16 = *(void **)(a1 + v6);
        *(void *)(a1 + v6) = v15;
      }
      v17 = (void *)(a1 + (int)*MEMORY[0x1E4F5DBB0]);
      void *v17 = [v5 contentRangeOfInterest];
      v17[1] = v18;
      uint64_t v19 = [v5 operatingSystemVersion];
      uint64_t v20 = (int)*MEMORY[0x1E4F5DBD0];
      v21 = *(void **)(a1 + v20);
      *(void *)(a1 + v20) = v19;

      char v22 = [MEMORY[0x1E4F5DAF0] showOperatingSystemVersionInSnippets];
      *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F5DBD8]) = v22;
    }
  }
}

- (void)addDetailsFromOriginatingInteractionEntity:()Internal
{
  if (a3)
  {
    id v4 = a3;
    [a1 addDetailsFromOriginatingGenericEntity:v4];
    id v9 = [v4 duplicateKey];

    v5 = [v9 interactionKey];
    uint64_t v6 = [v5 bundleId];
    uint64_t v7 = (int)*MEMORY[0x1E4F5DBA0];
    id v8 = *(void **)&a1[v7];
    *(void *)&a1[v7] = v6;
  }
}

- (void)addDetailsFromOriginatingCalendarEntity:()Internal
{
  if (a3)
  {
    id v4 = a3;
    [a1 addDetailsFromOriginatingGenericEntity:v4];
    [a1 addDetailsFromParticipantsOfEntity:v4];
  }
}

- (uint64_t)addDetailsFromOriginatingContactEntity:()Internal
{
  id v4 = a3;
  if (v4)
  {
    v10 = v4;
    [a1 addDetailsFromOriginatingGenericEntity:v4];
    uint64_t v5 = (int)*MEMORY[0x1E4F5DBA8];
    uint64_t v6 = *(void **)&a1[v5];
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      id v7 = [v10 title];
    }
    id v8 = *(void **)&a1[v5];
    *(void *)&a1[v5] = v7;
  }
  return MEMORY[0x1F41817F8]();
}

- (void)addDetailsFromOriginatingMessageEntity:()Internal
{
  if (a3)
  {
    id v4 = a3;
    [a1 addDetailsFromOriginatingGenericEntity:v4];
    [a1 addDetailsFromParticipantsOfEntity:v4];
  }
}

- (uint64_t)addDetailsFromParticipantsOfEntity:()Internal
{
  if (a3)
  {
    uint64_t v3 = result;
    *(void *)(v3 + (int)*MEMORY[0x1E4F5DBC0]) = [a3 author];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (uint64_t)addDetailsFromOriginatingGenericEntity:()Internal
{
  if (a3)
  {
    uint64_t v3 = result;
    id v4 = a3;
    uint64_t v5 = [v4 title];
    uint64_t v6 = (int)*MEMORY[0x1E4F5DBE0];
    id v7 = *(void **)(v3 + v6);
    *(void *)(v3 + v6) = v5;

    id v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 creationTimestamp];
    double v10 = v9;

    *(void *)(v3 + (int)*MEMORY[0x1E4F5DBB8]) = [v8 dateWithTimeIntervalSince1970:v10];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)originForDuplicateKey:()Internal entity:parent:store:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  switch([v11 entityType])
  {
    case 1:
      uint64_t v30 = (void *)MEMORY[0x1E4F5DAC8];
      v31 = [v12 sourceKey];
      id v32 = [v11 curatedEventKey];
      v33 = [v32 externalId];
      id v26 = [v30 originWithType:3 sourceKey:v31 externalKey:v33 fromForwardedMessage:0];

      [v26 addDetailsFromOriginatingCalendarEntity:v12];
      goto LABEL_27;
    case 2:
    case 6:
    case 7:
    case 8:
    case 15:
    case 19:
    case 20:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      v83 = v12;
      id v15 = v14;
      v16 = [v11 parentKey];
      if (!v16)
      {
        v80 = [MEMORY[0x1E4F28B00] currentHandler];
        [v80 handleFailureInMethod:a2 object:a1 file:@"SGOrigin+Internal.m" lineNumber:143 description:@"Extracted data must have a parent."];
      }
      v17 = (void *)MEMORY[0x1E4F5DAC8];
      uint64_t v18 = objc_msgSend(a1, "originTypeForEntityType:", objc_msgSend(v16, "entityType"));
      uint64_t v19 = [v16 messageKey];
      uint64_t v20 = [v19 source];
      v21 = [v16 messageKey];
      char v22 = [v21 uniqueIdentifier];
      v23 = objc_msgSend(v17, "originWithType:sourceKey:externalKey:fromForwardedMessage:", v18, v20, v22, objc_msgSend(v13, "isFromForwardedMessage"));

      [v23 addDetailsFromOriginatingMessageEntity:v13];
      [v11 entityType];
      id v14 = v15;
      id v12 = v83;
      if (SGEntityTypeIsContactDetail()) {
        [v23 addRecipientDetailsFromOriginatingMessageEntity:v13 entity:v83 store:v15];
      }
      v24 = [v83 duplicateKey];
      uint64_t v25 = [v24 entityType];

      [v23 addSnippetIfNotExistsFromContentOfEntity:v83];
      if (v25 == 2) {
        [v23 addSnippetIfNotExistsFromContentOfEntity:v13];
      }
      id v26 = v23;

      goto LABEL_28;
    case 3:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 21:
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      v28 = [v12 duplicateKey];
      [v28 entityType];
      uint64_t v29 = SGEntityTypeDescription();
      [v27 handleFailureInMethod:a2, a1, @"SGOrigin+Internal.m", 241, @"Unsupported type: %@", v29 object file lineNumber description];

      goto LABEL_10;
    case 4:
      v34 = [v11 parentKey];
      if (!v34)
      {
        v81 = [MEMORY[0x1E4F28B00] currentHandler];
        [v81 handleFailureInMethod:a2 object:a1 file:@"SGOrigin+Internal.m" lineNumber:167 description:@"Pseudo contacts must be derived from at least one parent entity"];
      }
      id v82 = v11;
      if ([v34 entityType] == 5 || objc_msgSend(v34, "entityType") == 13)
      {
        v35 = (void *)MEMORY[0x1E4F5DAC8];
        uint64_t v36 = objc_msgSend(a1, "originTypeForEntityType:", objc_msgSend(v34, "entityType"));
        v37 = [v34 messageKey];
        v38 = [v37 source];
        [v34 messageKey];
        v39 = v34;
        v41 = v40 = v13;
        [v41 uniqueIdentifier];
        v43 = id v42 = v14;
        v44 = objc_msgSend(v35, "originWithType:sourceKey:externalKey:fromForwardedMessage:", v36, v38, v43, objc_msgSend(v40, "isFromForwardedMessage"));

        id v14 = v42;
        id v13 = v40;
        v34 = v39;

        [v44 addDetailsFromOriginatingMessageEntity:v13];
        [v44 addSnippetIfNotExistsFromContentOfEntity:v12];
        v45 = v44;
        id v46 = v13;
LABEL_17:
        [v45 addSnippetIfNotExistsFromContentOfEntity:v46];
LABEL_18:
        id v26 = v44;

        id v11 = v82;
        goto LABEL_28;
      }
      if ([v34 entityType] == 1)
      {
        v55 = (void *)MEMORY[0x1E4F5DAC8];
        v56 = [v12 sourceKey];
        v57 = [v34 curatedEventKey];
        [v57 externalId];
        id v58 = v12;
        v60 = id v59 = v13;
        v44 = [v55 originWithType:3 sourceKey:v56 externalKey:v60 fromForwardedMessage:0];

        id v13 = v59;
        id v12 = v58;

        [v44 addDetailsFromOriginatingCalendarEntity:v13];
        v45 = v44;
        id v46 = v58;
        goto LABEL_17;
      }
      if ([v34 entityType] == 16)
      {
        v61 = (void *)MEMORY[0x1E4F5DAC8];
        v62 = [v34 interactionKey];
        v63 = [v62 bundleId];
        [v34 interactionKey];
        v64 = v34;
        id v65 = v12;
        v67 = id v66 = v13;
        [v67 personHandle];
        v69 = id v68 = v14;
        v44 = [v61 originWithType:5 sourceKey:v63 externalKey:v69 fromForwardedMessage:0];

        id v14 = v68;
        id v13 = v66;
        id v12 = v65;
        v34 = v64;

        [v44 addDetailsFromOriginatingInteractionEntity:v13];
        goto LABEL_18;
      }
      v70 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 entityType];
      v71 = SGEntityTypeDescription();
      [v70 handleFailureInMethod:a2, a1, @"SGOrigin+Internal.m", 195, @"Dunno how to handle a pseudo contact with a parent entity type: %@", v71 object file lineNumber description];

LABEL_26:
      v84 = (void *)MEMORY[0x1E4F5DAC8];
      uint64_t v72 = objc_msgSend(a1, "originTypeForEntityType:", objc_msgSend(v11, "entityType"));
      v73 = [v11 messageKey];
      v74 = [v73 source];
      [v11 messageKey];
      v76 = id v75 = v13;
      [v76 uniqueIdentifier];
      v78 = id v77 = v14;
      objc_msgSend(v84, "originWithType:sourceKey:externalKey:fromForwardedMessage:", v72, v74, v78, objc_msgSend(v12, "isFromForwardedMessage"));
      id v26 = (id)objc_claimAutoreleasedReturnValue();

      id v14 = v77;
      id v13 = v75;

      [v26 addDetailsFromOriginatingMessageEntity:v12];
LABEL_27:
      [v26 addSnippetIfNotExistsFromContentOfEntity:v12];
LABEL_28:

      return v26;
    case 5:
    case 13:
    case 18:
      goto LABEL_26;
    case 16:
      v47 = (void *)MEMORY[0x1E4F5DAC8];
      v48 = [v11 interactionKey];
      v49 = [v48 bundleId];
      [v11 interactionKey];
      v51 = id v50 = v11;
      [v51 personHandle];
      id v52 = v12;
      v54 = id v53 = v13;
      id v26 = [v47 originWithType:5 sourceKey:v49 externalKey:v54 fromForwardedMessage:0];

      id v13 = v53;
      id v12 = v52;

      id v11 = v50;
      [v26 addDetailsFromOriginatingInteractionEntity:v12];
      goto LABEL_28;
    case 17:
      id v26 = [MEMORY[0x1E4F5DAC8] originWithType:6 sourceKey:&stru_1F24EEF20 externalKey:&stru_1F24EEF20 fromForwardedMessage:0];
      goto LABEL_28;
    default:
LABEL_10:
      id v26 = 0;
      goto LABEL_28;
  }
}

+ (id)originForDuplicateKey:()Internal sourceKey:store:
{
  id v8 = a3;
  id v9 = a5;
  switch([v8 entityType])
  {
    case 1:
    case 5:
    case 13:
    case 16:
    case 18:
      id v11 = [v9 loadEntityByKey:v8];
      id v14 = [a1 originForDuplicateKey:v8 entity:v11 parent:0 store:v9];
      goto LABEL_9;
    case 2:
    case 6:
    case 7:
    case 8:
    case 15:
    case 19:
    case 20:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      double v10 = [v8 parentKey];

      if (!v10)
      {
        uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:a1 file:@"SGOrigin+Internal.m" lineNumber:71 description:@"Extracted data must have a parent."];
      }
      id v11 = [v9 loadEntityByKey:v8];
      id v12 = [v8 parentKey];
      id v13 = [v9 loadEntityByKey:v12];

      id v14 = [a1 originForDuplicateKey:v8 entity:v11 parent:v13 store:v9];
      goto LABEL_5;
    case 3:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 21:
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = [0 duplicateKey];
      [v16 entityType];
      v17 = SGEntityTypeDescription();
      [v15 handleFailureInMethod:a2, a1, @"SGOrigin+Internal.m", 102, @"Unsupported type: %@", v17 object file lineNumber description];

      goto LABEL_7;
    case 4:
      uint64_t v19 = [v8 parentKey];
      if (!v19)
      {
        uint64_t v19 = [v9 mostRecentParentKeyForDuplicateKey:v8];
        if (!v19)
        {
          v21 = [MEMORY[0x1E4F28B00] currentHandler];
          [v21 handleFailureInMethod:a2 object:a1 file:@"SGOrigin+Internal.m" lineNumber:78 description:@"Pseudo contacts must be derived from at least one parent entity"];

          uint64_t v19 = 0;
        }
      }
      id v11 = [v9 loadEntityByKey:v8];
      id v13 = [v9 loadEntityByKey:v19];
      id v14 = [a1 originForDuplicateKey:v8 entity:v11 parent:v13 store:v9];

LABEL_5:
LABEL_9:

      break;
    case 17:
      id v14 = [MEMORY[0x1E4F5DAC8] originWithType:6 sourceKey:&stru_1F24EEF20 externalKey:&stru_1F24EEF20 fromForwardedMessage:0];
      break;
    default:
LABEL_7:
      id v14 = 0;
      break;
  }

  return v14;
}

+ (uint64_t)originTypeForEntityType:()Internal
{
  uint64_t result = 4;
  switch(a3)
  {
    case 13:
      return result;
    case 14:
    case 15:
      goto LABEL_6;
    case 16:
      uint64_t result = 5;
      break;
    case 17:
      uint64_t result = 6;
      break;
    case 18:
      uint64_t result = 7;
      break;
    default:
      if (a3 == 1)
      {
        uint64_t result = 3;
      }
      else if (a3 == 5)
      {
        uint64_t result = 1;
      }
      else
      {
LABEL_6:
        id v7 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGOrigin+Internal.m", 44, @"Unknown entity type %u", a3);

        uint64_t result = 0;
      }
      break;
  }
  return result;
}

@end