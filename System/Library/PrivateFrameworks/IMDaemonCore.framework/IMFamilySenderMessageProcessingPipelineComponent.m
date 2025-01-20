@interface IMFamilySenderMessageProcessingPipelineComponent
- (IMDAccount)account;
- (IMDiMessageIDSTrustedData)idsTrustedData;
- (IMFamilySenderMessageProcessingPipelineComponent)initWithAccount:(id)a3 idsTrustedData:(id)a4;
- (id)_fromFamilyMember:(id)a3;
- (id)_generateError:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMFamilySenderMessageProcessingPipelineComponent

- (id)_fromFamilyMember:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  id v65 = objc_alloc_init(MEMORY[0x1E4F6BE98]);
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2050000000;
  v3 = (void *)qword_1EA8CA4F8;
  uint64_t v94 = qword_1EA8CA4F8;
  if (!qword_1EA8CA4F8)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v100 = sub_1D9738224;
    v101 = &unk_1E6B73480;
    v102 = &v91;
    sub_1D9738224((uint64_t)&buf);
    v3 = (void *)v92[3];
  }
  v4 = v3;
  _Block_object_dispose(&v91, 8);
  id v68 = objc_alloc_init(v4);
  [v68 setCachePolicy:1];
  id v90 = 0;
  v67 = [v68 fetchFamilyCircleWithError:&v90];
  id v5 = v90;
  v64 = v5;
  if (v67)
  {
    v6 = [v66 fromIdentifier];
    v70 = [v6 _stripFZIDPrefix];

    id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    obuint64_t j = [v67 members];
    uint64_t v61 = [obj countByEnumeratingWithState:&v86 objects:v98 count:16];
    if (v61)
    {
      uint64_t v7 = *(void *)v87;
      uint64_t v60 = *(void *)v87;
      while (2)
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v87 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          v10 = [v9 appleID];
          BOOL v11 = v10 == 0;

          if (!v11)
          {
            if (([v9 isMe] & 1) == 0)
            {
              v12 = [v9 appleID];
              [v63 addObject:v12];
            }
            v13 = [v9 appleID];
            int v14 = [v70 isEqualToString:v13];

            if (v14)
            {
              if (IMOSLoggingEnabled())
              {
                v58 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                {
                  v59 = [v9 appleID];
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v59;
                  _os_log_impl(&dword_1D967A000, v58, OS_LOG_TYPE_INFO, "Apple ID matches Family member %@", (uint8_t *)&buf, 0xCu);
                }
              }
LABEL_83:

              if (IMOSLoggingEnabled())
              {
                v50 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                {
                  v51 = [v66 fromIdentifier];
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v51;
                  _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, "Found family member relation using raw handles! %@", (uint8_t *)&buf, 0xCu);
                }
              }
              [v65 fullfillWithValue:v66];
              goto LABEL_98;
            }
          }
          v15 = [v9 dictionary];
          v16 = [v15 objectForKey:@"member-appleID-aliases"];
          if (v16)
          {
            if (([v9 isMe] & 1) == 0) {
              [v63 addObjectsFromArray:v16];
            }
            long long v84 = 0u;
            long long v85 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v82 objects:v97 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v83;
              while (2)
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v83 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v82 + 1) + 8 * j);
                  if ([v70 isEqualToString:v21])
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v48 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                      {
                        LODWORD(buf) = 138412290;
                        *(void *)((char *)&buf + 4) = v21;
                        _os_log_impl(&dword_1D967A000, v48, OS_LOG_TYPE_INFO, "Alias matches Family member %@", (uint8_t *)&buf, 0xCu);
                      }
                    }
                    goto LABEL_83;
                  }
                }
                uint64_t v18 = [v17 countByEnumeratingWithState:&v82 objects:v97 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }
          }
          v22 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v70];
          if (v22)
          {
            v23 = [v9 memberPhoneNumbers];
            v24 = [v23 componentsSeparatedByString:@","];

            if (([v9 isMe] & 1) == 0) {
              [v63 addObjectsFromArray:v24];
            }
            long long v80 = 0u;
            long long v81 = 0u;
            long long v79 = 0u;
            long long v78 = 0u;
            id v25 = v24;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v78 objects:v96 count:16];
            if (v26)
            {
              uint64_t v27 = *(void *)v79;
              while (2)
              {
                for (uint64_t k = 0; k != v26; ++k)
                {
                  if (*(void *)v79 != v27) {
                    objc_enumerationMutation(v25);
                  }
                  v29 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:*(void *)(*((void *)&v78 + 1) + 8 * k)];
                  if ([v22 isLikePhoneNumber:v29])
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v49 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                      {
                        LODWORD(buf) = 138412290;
                        *(void *)((char *)&buf + 4) = v22;
                        _os_log_impl(&dword_1D967A000, v49, OS_LOG_TYPE_INFO, "Phone number matches Family member %@", (uint8_t *)&buf, 0xCu);
                      }
                    }
                    goto LABEL_83;
                  }
                }
                uint64_t v26 = [v25 countByEnumeratingWithState:&v78 objects:v96 count:16];
                if (v26) {
                  continue;
                }
                break;
              }
            }
          }
          uint64_t v7 = v60;
        }
        uint64_t v61 = [obj countByEnumeratingWithState:&v86 objects:v98 count:16];
        uint64_t v7 = v60;
        if (v61) {
          continue;
        }
        break;
      }
    }

    v30 = [(IMFamilySenderMessageProcessingPipelineComponent *)self idsTrustedData];
    v31 = [v30 senderCorrelationIdentifier];
    BOOL v32 = v31 == 0;

    if (v32)
    {
      v52 = IMLogHandleForCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_1D99010E8(v66);
      }

      v53 = [(IMFamilySenderMessageProcessingPipelineComponent *)self _generateError:@"IDS data had no sender correlation identifier"];
      [v65 failWithError:v53];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Didn't find family member relation using raw handles. Attempting to lookup using SCIs.", (uint8_t *)&buf, 2u);
        }
      }
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v35 = v63;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v74 objects:v95 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v75;
        do
        {
          for (uint64_t m = 0; m != v36; ++m)
          {
            if (*(void *)v75 != v37) {
              objc_enumerationMutation(v35);
            }
            v39 = *(void **)(*((void *)&v74 + 1) + 8 * m);
            if ([v39 length])
            {
              v40 = (void *)IDSCopyBestGuessIDForID();
              if (v40)
              {
                [v34 addObject:v40];
              }
              else if (IMOSLoggingEnabled())
              {
                v42 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v39;
                  _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "handle could not be normalized for IDS lookup: %@", (uint8_t *)&buf, 0xCu);
                }
              }
            }
            else if (IMOSLoggingEnabled())
            {
              v41 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_1D967A000, v41, OS_LOG_TYPE_INFO, "Skipping normalization of empty handle in allFamilyMemberHandles", (uint8_t *)&buf, 2u);
              }
            }
          }
          uint64_t v36 = [v35 countByEnumeratingWithState:&v74 objects:v95 count:16];
        }
        while (v36);
      }

      if (IMOSLoggingEnabled())
      {
        v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v34;
          _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, "normalizedFamilyMemberHandles: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      if ([v34 count])
      {
        v44 = (void *)MEMORY[0x1E4F6E7B8];
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = sub_1D9737854;
        v71[3] = &unk_1E6B75550;
        v71[4] = self;
        id v72 = v65;
        id v73 = v66;
        [v44 currentRemoteDevicesForDestinations:v34 service:@"com.apple.madrid" listenerID:@"IMFamilySenderMessageProcessingPipelineComponent" queue:MEMORY[0x1E4F14428] completionBlock:v71];
      }
      else
      {
        v54 = IMLogHandleForCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_1D9901170(v66);
        }

        v55 = [(IMFamilySenderMessageProcessingPipelineComponent *)self _generateError:@"Family IDS handles were empty"];
        [v65 failWithError:v55];
      }
    }
LABEL_98:
  }
  else
  {
    BOOL v45 = v5 == 0;
    v46 = IMLogHandleForCategory();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (v45)
    {
      if (v47) {
        sub_1D9901030(v46);
      }

      v70 = [(IMFamilySenderMessageProcessingPipelineComponent *)self _generateError:@"Unknown FamilyCircle fetch error"];
      [v65 failWithError:v70];
    }
    else
    {
      if (v47) {
        sub_1D9901074();
      }

      v70 = [(IMFamilySenderMessageProcessingPipelineComponent *)self _generateError:@"FamilyCircle fetch failed with specific error"];
      [v65 failWithError:v70];
    }
  }

  id v56 = v65;
  return v56;
}

- (id)_generateError:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = objc_msgSend(v5, "initWithObjectsAndKeys:", v4, *MEMORY[0x1E4F28228], 0);

  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  v8 = (void *)[v7 initWithDomain:*MEMORY[0x1E4F6BE88] code:21 userInfo:v6];

  return v8;
}

- (IMFamilySenderMessageProcessingPipelineComponent)initWithAccount:(id)a3 idsTrustedData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMFamilySenderMessageProcessingPipelineComponent;
  v9 = [(IMFamilySenderMessageProcessingPipelineComponent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_idsTrustedData, a4);
  }

  return v10;
}

- (id)runIndividuallyWithInput:(id)a3
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F6CB20];
  v29[0] = *MEMORY[0x1E4F6CB18];
  v29[1] = v4;
  v29[2] = *MEMORY[0x1E4F6CAE0];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "<IMFamilySenderMessageProcessingPipelineComponent> Started processing", buf, 2u);
    }
  }
  if ([v3 isFromMe])
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [v3 fromIdentifier];
        *(_DWORD *)long long buf = 138412290;
        v28 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Message is a message from me: %@", buf, 0xCu);
      }
    }
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v3];
  }
  else
  {
    if ([v3 conformsToProtocol:&unk_1F33EF158])
    {
      id v10 = v3;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = v5;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12)
      {
        char v13 = 0;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            if (v13)
            {
              char v13 = 1;
            }
            else
            {
              v16 = [v10 balloonPluginBundleID];
              id v17 = IMBalloonExtensionIDWithSuffix();
              char v13 = [v16 isEqualToString:v17];
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v12);

        if (v13)
        {
          uint64_t v9 = [(IMFamilySenderMessageProcessingPipelineComponent *)self _fromFamilyMember:v10];
          goto LABEL_30;
        }
      }
      else
      {
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Message is not family extension", buf, 2u);
      }
    }
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v3];
  }
LABEL_30:
  uint64_t v19 = (void *)v9;

  return v19;
}

- (IMDAccount)account
{
  return self->_account;
}

- (IMDiMessageIDSTrustedData)idsTrustedData
{
  return self->_idsTrustedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTrustedData, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end