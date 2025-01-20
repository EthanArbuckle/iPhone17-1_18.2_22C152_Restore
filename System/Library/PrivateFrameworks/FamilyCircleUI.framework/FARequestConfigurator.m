@interface FARequestConfigurator
@end

@implementation FARequestConfigurator

void __74__FARequestConfigurator_FamilyCircleUI__requestForContext_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v10];
    [v6 setHTTPMethod:@"POST"];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = (void *)[v6 copy];
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);

LABEL_3:
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (!v5)
  {
    v6 = objc_msgSend(MEMORY[0x263F087E8], "fa_familyErrorWithCode:", -1008);
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v6);
    goto LABEL_3;
  }
  (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v5);
LABEL_6:
}

void __66__FARequestConfigurator_FamilyCircleUI___urlEndpointForEventType___block_invoke()
{
  v18[16] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F3BEA8];
  v17[0] = @"FACircleEventTypeInitiate";
  v17[1] = @"FACircleEventTypeAcceptInvitation";
  uint64_t v1 = *MEMORY[0x263F3BE40];
  v18[0] = v0;
  v18[1] = v1;
  uint64_t v2 = *MEMORY[0x263F3BEC8];
  v17[2] = @"FACircleEventTypeAcceptInvitationFromMessages";
  v17[3] = @"FACircleEventTypeManageCircle";
  uint64_t v3 = *MEMORY[0x263F3BE98];
  v18[2] = v2;
  v18[3] = v3;
  uint64_t v4 = *MEMORY[0x263F3BE50];
  v17[4] = @"FACircleEventTypeAddFamilyMember";
  v17[5] = @"FACircleEventTypeAddFamilyMemberV3";
  uint64_t v5 = *MEMORY[0x263F3BE58];
  v18[4] = v4;
  v18[5] = v5;
  uint64_t v6 = *MEMORY[0x263F3BEB0];
  v17[6] = @"FACircleEventTypeInviteViaMessages";
  v17[7] = @"FACircleEventTypeGetFamilyInvitationsUI";
  uint64_t v7 = *MEMORY[0x263F3BEA0];
  v18[6] = v6;
  v18[7] = v7;
  uint64_t v8 = *MEMORY[0x263F3BE48];
  v17[8] = @"FACircleEventTypeAddMemberInline";
  v17[9] = @"FACircleEventTypeFamilyRepair";
  uint64_t v9 = *MEMORY[0x263F3BE90];
  v18[8] = v8;
  v18[9] = v9;
  uint64_t v10 = *MEMORY[0x263F3BE80];
  v17[10] = @"FACircleEventTypeFamilyPicker";
  v17[11] = @"FACircleEventTypeMercuryJourney";
  uint64_t v11 = *MEMORY[0x263F3BEB8];
  v18[10] = v10;
  v18[11] = v11;
  uint64_t v12 = *MEMORY[0x263F3BE78];
  v17[12] = @"FACircleEventTypeViewMemberDetail";
  v17[13] = @"FACircleEventTypeAddRemoteGuardian";
  uint64_t v13 = *MEMORY[0x263F3BE60];
  v18[12] = v12;
  v18[13] = v13;
  v17[14] = @"FACircleEventTypeShowPrivacySafetyUI";
  v17[15] = @"FACircleEventTypeFamilyPrivacyDisclosureUI";
  uint64_t v14 = *MEMORY[0x263F3BE88];
  v18[14] = *MEMORY[0x263F3BED0];
  v18[15] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:16];
  v16 = (void *)_urlEndpointForEventType__eventTypeToEndpointMap;
  _urlEndpointForEventType__eventTypeToEndpointMap = v15;
}

@end