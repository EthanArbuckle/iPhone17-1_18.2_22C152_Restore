@interface AAFamilyDetailsResponse
- (AAFamilyDetailsResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (AAFamilyMember)me;
- (AAFamilyMember)organizer;
- (BOOL)canAddChildMembers;
- (BOOL)canAddMembers;
- (NSArray)firstNames;
- (NSArray)invites;
- (NSArray)members;
- (NSArray)pendingMembers;
- (NSString)addMemberInstructions;
- (NSString)childAccountButtonTitle;
- (NSString)childAccountPrompt;
- (int64_t)memberCount;
- (int64_t)pendingInviteCount;
- (int64_t)pendingMemberCount;
@end

@implementation AAFamilyDetailsResponse

- (AAFamilyDetailsResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  v120.receiver = self;
  v120.super_class = (Class)AAFamilyDetailsResponse;
  v4 = [(AAResponse *)&v120 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4 && [(NSHTTPURLResponse *)v4->super._httpResponse statusCode] == 200)
  {
    v6 = [(AAResponse *)v5 responseDictionary];
    v7 = [v6 objectForKey:@"family-members"];

    objc_opt_class();
    v98 = v7;
    v103 = v5;
    if (objc_opt_isKindOfClass())
    {
      v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      obuint64_t j = v7;
      uint64_t v9 = [obj countByEnumeratingWithState:&v116 objects:v124 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v117;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v117 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v116 + 1) + 8 * i);
            v14 = objc_alloc_init(AAFamilyMember);
            v15 = [v13 objectForKeyedSubscript:@"member-first-name"];
            [(AAFamilyMember *)v14 setFirstName:v15];

            v16 = [v13 objectForKeyedSubscript:@"member-last-name"];
            [(AAFamilyMember *)v14 setLastName:v16];

            v17 = [v13 objectForKeyedSubscript:@"member-apple-id"];
            [(AAFamilyMember *)v14 setAppleID:v17];

            v18 = [v13 objectForKeyedSubscript:@"member-dsid"];
            [(AAFamilyMember *)v14 setPersonID:v18];

            v19 = [v13 objectForKeyedSubscript:@"member-dsid-hash"];
            [(AAFamilyMember *)v14 setPersonIDHash:v19];

            v20 = [v13 objectForKeyedSubscript:@"member-altDSID"];
            [(AAFamilyMember *)v14 setAltDSID:v20];

            v21 = [v13 objectForKeyedSubscript:@"member-is-child-account"];
            -[AAFamilyMember setIsChild:](v14, "setIsChild:", [v21 BOOLValue]);

            v22 = [v13 objectForKeyedSubscript:@"is-me"];
            -[AAFamilyMember setIsMe:](v14, "setIsMe:", [v22 BOOLValue]);

            v23 = [v13 objectForKeyedSubscript:@"member-display-label"];
            [(AAFamilyMember *)v14 setTitle:v23];

            v24 = [v13 objectForKeyedSubscript:@"is-itunes-linked"];
            -[AAFamilyMember setIsSharingPurchases:](v14, "setIsSharingPurchases:", [v24 BOOLValue]);

            v25 = [v13 objectForKeyedSubscript:@"member-is-organizer"];
            -[AAFamilyMember setIsOrganizer:](v14, "setIsOrganizer:", [v25 BOOLValue]);

            v26 = [v13 objectForKeyedSubscript:@"itunes-not-linked-message"];
            [(AAFamilyMember *)v14 setITunesNotLinkedMessage:v26];

            v27 = [v13 objectForKeyedSubscript:@"linked-itunes-account-appleid"];
            [(AAFamilyMember *)v14 setLinkediTunesAppleID:v27];

            v28 = [v13 objectForKeyedSubscript:@"linked-itunes-account-dsid"];
            [(AAFamilyMember *)v14 setLinkediTunesDSID:v28];

            v29 = [v13 objectForKeyedSubscript:@"is-ask-to-buy-enabled"];
            -[AAFamilyMember setIsAskToBuyEnabled:](v14, "setIsAskToBuyEnabled:", [v29 BOOLValue]);

            v30 = [v13 objectForKeyedSubscript:@"is-parental-controls-enabled"];
            -[AAFamilyMember setAreParentalControlsEnabled:](v14, "setAreParentalControlsEnabled:", [v30 BOOLValue]);

            v31 = [v13 objectForKeyedSubscript:@"member-join-date-epoch"];
            [v31 doubleValue];
            double v33 = v32 / 1000.0;

            v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v33];
            [(AAFamilyMember *)v14 setJoinDate:v34];
            [(NSArray *)v8 addObject:v14];
            v5 = v103;
            if ([(AAFamilyMember *)v14 isOrganizer]) {
              objc_storeStrong((id *)&v103->_organizer, v14);
            }
            if ([(AAFamilyMember *)v14 isMe]) {
              objc_storeStrong((id *)&v103->_me, v14);
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v116 objects:v124 count:16];
        }
        while (v10);
      }

      [(NSArray *)v8 sortUsingComparator:&__block_literal_global_7];
      members = v5->_members;
      v5->_members = v8;
    }
    v36 = [(AAResponse *)v5 responseDictionary];
    v37 = [v36 objectForKey:@"family-invitations"];

    objc_opt_class();
    v97 = v37;
    if (objc_opt_isKindOfClass())
    {
      v38 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v112 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id obja = v37;
      uint64_t v39 = [obja countByEnumeratingWithState:&v112 objects:v123 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v113;
        do
        {
          for (uint64_t j = 0; j != v40; ++j)
          {
            if (*(void *)v113 != v41) {
              objc_enumerationMutation(obja);
            }
            v43 = *(void **)(*((void *)&v112 + 1) + 8 * j);
            v44 = objc_alloc_init(AAFamilyInvite);
            v45 = [v43 objectForKeyedSubscript:@"invitee-last-name"];
            [(AAFamilyInvite *)v44 setOrganizerLastName:v45];

            v46 = [v43 objectForKeyedSubscript:@"invitee-first-name"];
            [(AAFamilyInvite *)v44 setOrganizerFirstName:v46];

            v47 = [v43 objectForKeyedSubscript:@"inviter-email"];
            [(AAFamilyInvite *)v44 setOrganizerEmail:v47];

            v48 = [v43 objectForKeyedSubscript:@"invite-code"];
            [(AAFamilyInvite *)v44 setCode:v48];

            v49 = [v43 objectForKeyedSubscript:@"invitee-dsid"];
            [(AAFamilyInvite *)v44 setOrganizerDSID:v49];

            v50 = [v43 objectForKeyedSubscript:@"dsid"];
            [(AAFamilyInvite *)v44 setRecepientDSID:v50];

            [(NSArray *)v38 addObject:v44];
          }
          uint64_t v40 = [obja countByEnumeratingWithState:&v112 objects:v123 count:16];
        }
        while (v40);
      }

      v5 = v103;
      invites = v103->_invites;
      v103->_invites = v38;
    }
    v52 = [(AAResponse *)v5 responseDictionary];
    v53 = [v52 objectForKey:@"transfer-requests"];

    objc_opt_class();
    v96 = v53;
    if (objc_opt_isKindOfClass())
    {
      id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id objb = v53;
      uint64_t v55 = [objb countByEnumeratingWithState:&v108 objects:v122 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v109;
        do
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v109 != v57) {
              objc_enumerationMutation(objb);
            }
            v59 = *(void **)(*((void *)&v108 + 1) + 8 * k);
            v60 = objc_alloc_init(AAFamilyInvite);
            [(AAFamilyInvite *)v60 setIsChildTransferInvite:1];
            v61 = [v59 objectForKeyedSubscript:@"request-code"];
            [(AAFamilyInvite *)v60 setCode:v61];

            v62 = [v59 objectForKeyedSubscript:@"requestor-first-name"];
            [(AAFamilyInvite *)v60 setOrganizerFirstName:v62];

            v63 = [v59 objectForKeyedSubscript:@"requestor-last-name"];
            [(AAFamilyInvite *)v60 setOrganizerLastName:v63];

            v64 = [v59 objectForKeyedSubscript:@"child-first-name"];
            [(AAFamilyInvite *)v60 setChildFirstName:v64];

            v65 = [v59 objectForKeyedSubscript:@"child-last-name"];
            [(AAFamilyInvite *)v60 setChildLastName:v65];

            v66 = [v59 objectForKeyedSubscript:@"requestor-dsid"];
            [(AAFamilyInvite *)v60 setOrganizerDSID:v66];

            [v54 addObject:v60];
          }
          uint64_t v56 = [objb countByEnumeratingWithState:&v108 objects:v122 count:16];
        }
        while (v56);
      }

      v5 = v103;
      v67 = v103->_invites;
      if (v67)
      {
        v68 = [(NSArray *)v67 arrayByAddingObjectsFromArray:v54];
      }
      else
      {
        v68 = (NSArray *)v54;
      }
      v53 = v96;
      v69 = v103->_invites;
      v103->_invites = v68;
    }
    v70 = [(AAResponse *)v5 responseDictionary];
    v71 = [v70 objectForKey:@"pending-members"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v72 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      v95 = v71;
      id objc = v71;
      uint64_t v73 = [objc countByEnumeratingWithState:&v104 objects:v121 count:16];
      if (v73)
      {
        uint64_t v74 = v73;
        uint64_t v75 = *(void *)v105;
        do
        {
          for (uint64_t m = 0; m != v74; ++m)
          {
            if (*(void *)v105 != v75) {
              objc_enumerationMutation(objc);
            }
            v77 = *(void **)(*((void *)&v104 + 1) + 8 * m);
            v78 = objc_alloc_init(AAFamilyMember);
            v79 = [v77 objectForKeyedSubscript:@"member-invite-email"];
            [(AAFamilyMember *)v78 setAppleID:v79];

            v80 = [v77 objectForKeyedSubscript:@"member-display-label"];
            [(AAFamilyMember *)v78 setTitle:v80];

            v81 = [v77 objectForKeyedSubscript:@"member-first-name"];
            [(AAFamilyMember *)v78 setFirstName:v81];

            v82 = [v77 objectForKeyedSubscript:@"member-last-name"];
            [(AAFamilyMember *)v78 setLastName:v82];

            [(NSArray *)v72 addObject:v78];
          }
          uint64_t v74 = [objc countByEnumeratingWithState:&v104 objects:v121 count:16];
        }
        while (v74);
      }

      v5 = v103;
      pendingMembers = v103->_pendingMembers;
      v103->_pendingMembers = v72;

      v71 = v95;
      v53 = v96;
    }
    v84 = [(AAResponse *)v5 responseDictionary];
    v85 = [v84 objectForKey:@"family-meta-info"];

    if (v85)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v86 = [v85 objectForKeyedSubscript:@"add-child-enabled"];
        v5->_canAddChildMembers = [v86 BOOLValue];

        v87 = [v85 objectForKeyedSubscript:@"add-member-enabled"];
        v5->_canAddMembers = [v87 BOOLValue];

        uint64_t v88 = [v85 objectForKeyedSubscript:@"add-family-member-label"];
        addMemberInstructions = v5->_addMemberInstructions;
        v5->_addMemberInstructions = (NSString *)v88;

        uint64_t v90 = [v85 objectForKeyedSubscript:@"add-child-sub-label"];
        childAccountPrompt = v5->_childAccountPrompt;
        v5->_childAccountPrompt = (NSString *)v90;

        uint64_t v92 = [v85 objectForKeyedSubscript:@"add-child-link-title"];
        childAccountButtonTitle = v5->_childAccountButtonTitle;
        v5->_childAccountButtonTitle = (NSString *)v92;
      }
    }
  }
  return v5;
}

uint64_t __53__AAFamilyDetailsResponse_initWithHTTPResponse_data___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 joinDate];
  v6 = [v4 joinDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (int64_t)memberCount
{
  return [(NSArray *)self->_members count];
}

- (int64_t)pendingMemberCount
{
  return [(NSArray *)self->_pendingMembers count];
}

- (int64_t)pendingInviteCount
{
  return [(NSArray *)self->_invites count];
}

- (NSArray)firstNames
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_members count])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = self->_members;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isMe", (void)v12) & 1) == 0)
          {
            uint64_t v10 = [v9 firstName];
            if (v10) {
              [v3 addObject:v10];
            }
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSArray)members
{
  return self->_members;
}

- (AAFamilyMember)organizer
{
  return self->_organizer;
}

- (AAFamilyMember)me
{
  return self->_me;
}

- (NSArray)invites
{
  return self->_invites;
}

- (NSArray)pendingMembers
{
  return self->_pendingMembers;
}

- (BOOL)canAddMembers
{
  return self->_canAddMembers;
}

- (BOOL)canAddChildMembers
{
  return self->_canAddChildMembers;
}

- (NSString)addMemberInstructions
{
  return self->_addMemberInstructions;
}

- (NSString)childAccountPrompt
{
  return self->_childAccountPrompt;
}

- (NSString)childAccountButtonTitle
{
  return self->_childAccountButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childAccountButtonTitle, 0);
  objc_storeStrong((id *)&self->_childAccountPrompt, 0);
  objc_storeStrong((id *)&self->_addMemberInstructions, 0);
  objc_storeStrong((id *)&self->_pendingMembers, 0);
  objc_storeStrong((id *)&self->_invites, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_organizer, 0);

  objc_storeStrong((id *)&self->_members, 0);
}

@end