@interface ABChangeHistoryEvent
+ (id)groupAddEventWithRecordID:(int)a3 identifier:(id)a4;
+ (id)groupDeleteEventWithRecordID:(int)a3 identifier:(id)a4 externalID:(id)a5;
+ (id)groupUpdateEventWithRecordID:(int)a3 identifier:(id)a4;
+ (id)groupWithRecordID:(int)a3 identifier:(id)a4 eventType:(int)a5 externalID:(id)a6;
+ (id)linkEventWithRecordID:(int)a3 identifier:(id)a4 linkToIdentifier:(id)a5 unifiedIdentifier:(id)a6;
+ (id)meCardChangedEventWithRecordID:(int)a3 identifier:(id)a4;
+ (id)personAddEventWithRecordID:(int)a3 identifier:(id)a4;
+ (id)personDeleteEventWithRecordID:(int)a3 identifier:(id)a4 externalID:(id)a5 personLink:(int)a6;
+ (id)personUpdateEventWithRecordID:(int)a3 identifier:(id)a4 imagesChanged:(BOOL)a5 personLink:(int)a6;
+ (id)personWithRecordID:(int)a3 identifier:(id)a4 eventType:(int)a5;
+ (id)personWithRecordID:(int)a3 identifier:(id)a4 eventType:(int)a5 imagesChanged:(BOOL)a6 externalID:(id)a7 personLink:(int)a8;
+ (id)setPreferredImageEventWithRecordID:(int)a3 identifier:(id)a4;
+ (id)setPreferredNameEventWithRecordID:(int)a3 identifier:(id)a4;
+ (id)unifiedPersonAddEventWithUnifiedIdentifier:(id)a3;
+ (id)unifiedPersonDeleteEventWithUnifiedIdentifier:(id)a3;
+ (id)unifiedPersonUpdateEventWithUnifiedIdentifier:(id)a3;
+ (id)unifiedPersonWithIdentifier:(id)a3 eventType:(int)a4;
+ (id)unlinkEventWithRecordID:(int)a3 identifier:(id)a4;
- (ABChangeHistoryEvent)initWithEntityType:(int)a3 eventType:(int)a4 sequenceNumber:(int64_t)a5 recordID:(int)a6 recordGUID:(id)a7 externalID:(id)a8 imagesChanged:(BOOL)a9 personLink:(int)a10 personLinkUUID:(id)a11 linkToPersonUUID:(id)a12;
- (BOOL)imagesChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSequenceNumber:(int64_t)a3 equalToOther:(int64_t)a4;
- (NSString)externalID;
- (NSString)linkToPersonUUID;
- (NSString)personLinkUUID;
- (NSString)recordGUID;
- (id)description;
- (id)descriptionForEntityType:(int)a3;
- (id)descriptionForEventType:(int)a3;
- (int)entityType;
- (int)eventType;
- (int)personLink;
- (int)recordID;
- (int64_t)sequenceNumber;
- (void)dealloc;
@end

@implementation ABChangeHistoryEvent

+ (id)personAddEventWithRecordID:(int)a3 identifier:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = objc_opt_class();
  return (id)[v6 personWithRecordID:v5 identifier:a4 eventType:0];
}

+ (id)personUpdateEventWithRecordID:(int)a3 identifier:(id)a4 imagesChanged:(BOOL)a5 personLink:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  uint64_t v9 = *(void *)&a3;
  v10 = objc_opt_class();
  return (id)[v10 personWithRecordID:v9 identifier:a4 eventType:1 imagesChanged:v7 externalID:0 personLink:v6];
}

+ (id)personDeleteEventWithRecordID:(int)a3 identifier:(id)a4 externalID:(id)a5 personLink:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v9 = *(void *)&a3;
  v10 = objc_opt_class();
  return (id)[v10 personWithRecordID:v9 identifier:a4 eventType:2 imagesChanged:0 externalID:a5 personLink:v6];
}

+ (id)unifiedPersonAddEventWithUnifiedIdentifier:(id)a3
{
  v4 = objc_opt_class();
  return (id)[v4 unifiedPersonWithIdentifier:a3 eventType:3];
}

+ (id)unifiedPersonUpdateEventWithUnifiedIdentifier:(id)a3
{
  v4 = objc_opt_class();
  return (id)[v4 unifiedPersonWithIdentifier:a3 eventType:4];
}

+ (id)unifiedPersonDeleteEventWithUnifiedIdentifier:(id)a3
{
  v4 = objc_opt_class();
  return (id)[v4 unifiedPersonWithIdentifier:a3 eventType:5];
}

+ (id)linkEventWithRecordID:(int)a3 identifier:(id)a4 linkToIdentifier:(id)a5 unifiedIdentifier:(id)a6
{
  HIDWORD(v8) = -1;
  LOBYTE(v8) = 0;
  uint64_t v6 = -[ABChangeHistoryEvent initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:]([ABChangeHistoryEvent alloc], "initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:", 0, 6, -2, *(void *)&a3, a4, 0, v8, a6, a5);
  return v6;
}

+ (id)unlinkEventWithRecordID:(int)a3 identifier:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = objc_opt_class();
  return (id)[v6 personWithRecordID:v5 identifier:a4 eventType:7];
}

+ (id)setPreferredNameEventWithRecordID:(int)a3 identifier:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = objc_opt_class();
  return (id)[v6 personWithRecordID:v5 identifier:a4 eventType:8];
}

+ (id)setPreferredImageEventWithRecordID:(int)a3 identifier:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = objc_opt_class();
  return (id)[v6 personWithRecordID:v5 identifier:a4 eventType:9];
}

+ (id)meCardChangedEventWithRecordID:(int)a3 identifier:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = objc_opt_class();
  return (id)[v6 personWithRecordID:v5 identifier:a4 eventType:10];
}

+ (id)groupAddEventWithRecordID:(int)a3 identifier:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = objc_opt_class();
  return (id)[v6 groupWithRecordID:v5 identifier:a4 eventType:0 externalID:0];
}

+ (id)groupUpdateEventWithRecordID:(int)a3 identifier:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = objc_opt_class();
  return (id)[v6 groupWithRecordID:v5 identifier:a4 eventType:1 externalID:0];
}

+ (id)groupDeleteEventWithRecordID:(int)a3 identifier:(id)a4 externalID:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  BOOL v7 = objc_opt_class();
  return (id)[v7 groupWithRecordID:v6 identifier:a4 eventType:2 externalID:0];
}

+ (id)personWithRecordID:(int)a3 identifier:(id)a4 eventType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = objc_opt_class();
  return (id)[v8 personWithRecordID:v7 identifier:a4 eventType:v5 imagesChanged:0 externalID:0 personLink:0xFFFFFFFFLL];
}

+ (id)unifiedPersonWithIdentifier:(id)a3 eventType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = objc_opt_class();
  return (id)[v6 personWithRecordID:0xFFFFFFFFLL identifier:a3 eventType:v4 imagesChanged:0 externalID:0 personLink:0xFFFFFFFFLL];
}

+ (id)personWithRecordID:(int)a3 identifier:(id)a4 eventType:(int)a5 imagesChanged:(BOOL)a6 externalID:(id)a7 personLink:(int)a8
{
  HIDWORD(v10) = a8;
  LOBYTE(v10) = a6;
  uint64_t v8 = -[ABChangeHistoryEvent initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:]([ABChangeHistoryEvent alloc], "initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:", 0, *(void *)&a5, -2, *(void *)&a3, a4, a7, v10, 0, 0);
  return v8;
}

+ (id)groupWithRecordID:(int)a3 identifier:(id)a4 eventType:(int)a5 externalID:(id)a6
{
  HIDWORD(v8) = -1;
  LOBYTE(v8) = 0;
  uint64_t v6 = -[ABChangeHistoryEvent initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:]([ABChangeHistoryEvent alloc], "initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:", 1, *(void *)&a5, -2, *(void *)&a3, a4, a6, v8, 0, 0);
  return v6;
}

- (ABChangeHistoryEvent)initWithEntityType:(int)a3 eventType:(int)a4 sequenceNumber:(int64_t)a5 recordID:(int)a6 recordGUID:(id)a7 externalID:(id)a8 imagesChanged:(BOOL)a9 personLink:(int)a10 personLinkUUID:(id)a11 linkToPersonUUID:(id)a12
{
  v21.receiver = self;
  v21.super_class = (Class)ABChangeHistoryEvent;
  v18 = [(ABChangeHistoryEvent *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_entityType = a3;
    v18->_eventType = a4;
    v18->_sequenceNumber = a5;
    v18->_recordID = a6;
    v18->_recordGUID = (NSString *)[a7 copy];
    v19->_externalID = (NSString *)[a8 copy];
    v19->_imagesChanged = a9;
    v19->_personLink = a10;
    v19->_personLinkUUID = (NSString *)[a11 copy];
    v19->_linkToPersonUUID = (NSString *)[a12 copy];
  }
  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ABChangeHistoryEvent;
  [(ABChangeHistoryEvent *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  objc_msgSend(v3, "appendName:object:", @"entityType", -[ABChangeHistoryEvent descriptionForEntityType:](self, "descriptionForEntityType:", self->_entityType));
  objc_msgSend(v3, "appendName:object:", @"eventType", -[ABChangeHistoryEvent descriptionForEventType:](self, "descriptionForEventType:", self->_eventType));
  objc_msgSend(v3, "appendName:object:", @"sequenceNumber", objc_msgSend(NSNumber, "numberWithInteger:", self->_sequenceNumber));
  if (self->_recordID != -1) {
    objc_msgSend(v3, "appendName:object:", @"recordID", objc_msgSend(NSNumber, "numberWithInt:"));
  }
  if (self->_recordGUID) {
    objc_msgSend(v3, "appendName:object:", @"recordGUID");
  }
  if (self->_externalID) {
    objc_msgSend(v3, "appendName:object:", @"externalID");
  }
  if (self->_imagesChanged) {
    [v3 appendName:@"imagesChanged" BOOLValue:1];
  }
  if (self->_personLink >= 1) {
    objc_msgSend(v3, "appendName:object:", @"_personLink", objc_msgSend(NSNumber, "numberWithInt:"));
  }
  if (self->_linkToPersonUUID) {
    objc_msgSend(v3, "appendName:object:", @"linkToPersonUUID");
  }
  if (self->_personLinkUUID) {
    objc_msgSend(v3, "appendName:object:", @"personLinkUUID");
  }
  return (id)[v3 build];
}

- (id)descriptionForEntityType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (descriptionForEntityType__cn_once_token_1 != -1) {
    dispatch_once(&descriptionForEntityType__cn_once_token_1, &__block_literal_global_14);
  }
  id result = (id)objc_msgSend((id)descriptionForEntityType__cn_once_object_1, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3));
  if (!result) {
    return @"Unknown";
  }
  return result;
}

uint64_t __49__ABChangeHistoryEvent_descriptionForEntityType___block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v1[0] = &unk_1EF050400;
  v1[1] = &unk_1EF050418;
  v2[0] = @"Person";
  v2[1] = @"Group";
  v1[2] = &unk_1EF050430;
  v2[2] = @"MultiValue";
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v2, v1, 3), "copy");
  descriptionForEntityType__cn_once_object_1 = result;
  return result;
}

- (id)descriptionForEventType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (descriptionForEventType__cn_once_token_2 != -1) {
    dispatch_once(&descriptionForEventType__cn_once_token_2, &__block_literal_global_52);
  }
  id result = (id)objc_msgSend((id)descriptionForEventType__cn_once_object_2, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3));
  if (!result) {
    return @"Unknown";
  }
  return result;
}

uint64_t __48__ABChangeHistoryEvent_descriptionForEventType___block_invoke()
{
  v2[11] = *MEMORY[0x1E4F143B8];
  v1[0] = &unk_1EF050400;
  v1[1] = &unk_1EF050418;
  v2[0] = @"Add";
  v2[1] = @"Update";
  v1[2] = &unk_1EF050430;
  void v1[3] = &unk_1EF050448;
  v2[2] = @"Delete";
  v2[3] = @"UnifiedAdd";
  v1[4] = &unk_1EF050460;
  v1[5] = &unk_1EF050478;
  void v2[4] = @"UnifiedUpdate";
  v2[5] = @"Delete";
  v1[6] = &unk_1EF050490;
  v1[7] = &unk_1EF0504A8;
  v2[6] = @"Link";
  v2[7] = @"Unlink";
  v1[8] = &unk_1EF0504C0;
  v1[9] = &unk_1EF0504D8;
  v2[8] = @"SetPreferredName";
  v2[9] = @"SetPreferredImage";
  v1[10] = &unk_1EF0504F0;
  v2[10] = @"MeCardChanged";
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v2, v1, 11), "copy");
  descriptionForEventType__cn_once_object_2 = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v12[6] = MEMORY[0x1E4F143A8];
  v12[7] = 3221225472;
  v12[8] = __32__ABChangeHistoryEvent_isEqual___block_invoke;
  v12[9] = &unk_1E5989850;
  v12[10] = self;
  v12[11] = a3;
  v11[5] = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_2;
  v12[3] = &unk_1E5989850;
  v12[4] = self;
  v12[5] = a3;
  v10[5] = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_3;
  v11[3] = &unk_1E5989850;
  v11[4] = self;
  v9[5] = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_4;
  v10[3] = &unk_1E5989850;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_5;
  v9[3] = &unk_1E5989850;
  v9[4] = self;
  v7[5] = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_6;
  v8[3] = &unk_1E5989850;
  v8[4] = self;
  v8[5] = a3;
  v6[5] = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_7;
  v7[3] = &unk_1E5989850;
  v7[4] = self;
  v5[5] = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_8;
  v6[3] = &unk_1E5989850;
  v6[4] = self;
  v4[5] = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_9;
  v5[3] = &unk_1E5989850;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_10;
  v4[3] = &unk_1E5989850;
  v4[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A3E0], "isObject:equalToOther:withBlocks:", v12, v11, v10, v9, v8, v7, v6, v5, v4, 0);
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) entityType];
  uint64_t v4 = [*(id *)(a1 + 40) entityType];
  return [v2 isInteger:v3 equalToOther:v4];
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) eventType];
  uint64_t v4 = [*(id *)(a1 + 40) eventType];
  return [v2 isInteger:v3 equalToOther:v4];
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 sequenceNumber];
  uint64_t v4 = [*(id *)(a1 + 40) sequenceNumber];
  return [v2 isSequenceNumber:v3 equalToOther:v4];
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = (int)[*(id *)(a1 + 32) recordID];
  uint64_t v4 = (int)[*(id *)(a1 + 40) recordID];
  return [v2 isInteger:v3 equalToOther:v4];
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_5(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) recordGUID];
  uint64_t v4 = [*(id *)(a1 + 40) recordGUID];
  return [v2 isObject:v3 equalToOther:v4];
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_6(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) externalID];
  uint64_t v4 = [*(id *)(a1 + 40) externalID];
  return [v2 isObject:v3 equalToOther:v4];
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_7(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) imagesChanged];
  uint64_t v4 = [*(id *)(a1 + 40) imagesChanged];
  return [v2 isBool:v3 equalToOther:v4];
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_8(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = (int)[*(id *)(a1 + 32) personLink];
  uint64_t v4 = (int)[*(id *)(a1 + 40) personLink];
  return [v2 isInteger:v3 equalToOther:v4];
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_9(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) personLinkUUID];
  uint64_t v4 = [*(id *)(a1 + 40) personLinkUUID];
  return [v2 isObject:v3 equalToOther:v4];
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_10(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) linkToPersonUUID];
  uint64_t v4 = [*(id *)(a1 + 40) linkToPersonUUID];
  return [v2 isObject:v3 equalToOther:v4];
}

- (BOOL)isSequenceNumber:(int64_t)a3 equalToOther:(int64_t)a4
{
  return a3 == -2 || a4 == -2 || a3 == a4;
}

- (int)entityType
{
  return self->_entityType;
}

- (int)eventType
{
  return self->_eventType;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int)recordID
{
  return self->_recordID;
}

- (NSString)recordGUID
{
  return self->_recordGUID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (BOOL)imagesChanged
{
  return self->_imagesChanged;
}

- (int)personLink
{
  return self->_personLink;
}

- (NSString)personLinkUUID
{
  return self->_personLinkUUID;
}

- (NSString)linkToPersonUUID
{
  return self->_linkToPersonUUID;
}

@end