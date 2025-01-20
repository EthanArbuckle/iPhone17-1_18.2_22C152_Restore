@interface CKAssistantSearchUtilities
+ (__CFString)canonicalizeNumber:(__CFString *)a3;
+ (id)getAddressesFromPeople:(id)a3;
@end

@implementation CKAssistantSearchUtilities

+ (__CFString)canonicalizeNumber:(__CFString *)a3
{
  if (!a3) {
    return 0;
  }
  if (!CFStringHasPrefix(a3, @"+"))
  {
    v6 = a3;
    if ([(__CFString *)v6 _appearsToBePhoneNumber])
    {
      v7 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
      v5 = (__CFString *)IMNormalizedPhoneNumberForCFPhoneNumberRef();
      if (v7) {
        CFRelease(v7);
      }
      if (!v5) {
        goto LABEL_11;
      }
    }
    else
    {
      [(__CFString *)v6 _appearsToBeEmail];
      v5 = (__CFString *)IMNormalizeFormattedString();
      if (!v5) {
        goto LABEL_11;
      }
    }
    CFRetain(v5);
LABEL_11:

    return v5;
  }
  v4 = (__CFString *)IMCanonicalizeFormattedString();
  v5 = v4;
  if (v4) {
    CFRetain(v4);
  }
  return v5;
}

+ (id)getAddressesFromPeople:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v47 = [MEMORY[0x1E4F1CA48] array];
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v3;
  uint64_t v51 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
  if (v51)
  {
    uint64_t v48 = *(void *)v73;
    *(void *)&long long v5 = 138412802;
    long long v46 = v5;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v73 != v48)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v50 = v6;
        v8 = *(void **)(*((void *)&v72 + 1) + 8 * v6);
        v52 = objc_msgSend(v8, "internalGUID", v46);
        v9 = [v8 label];
        if ([v9 isAddressBookLabel])
        {
          v10 = [v8 label];
        }
        else
        {
          v10 = 0;
        }

        if (IMOSLoggingEnabled())
        {
          v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v46;
            *(void *)&buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v52;
            *(_WORD *)&buf[22] = 2112;
            v81 = v10;
            _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Trying to find address for person %@ with internalGUID %@ and desiredLabel %@", buf, 0x20u);
          }
        }
        if (v52)
        {
          v12 = [MEMORY[0x1E4F6E6D8] sharedInstance];
          v13 = [v12 fetchCNContactWithIdentifier:v52];

          if (IMOSLoggingEnabled())
          {
            v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v15 = @"YES";
              if (!v13) {
                v15 = @"NO";
              }
              *(void *)&buf[4] = v52;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v15;
              _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Found record for internalGUID %@: %@", buf, 0x16u);
            }
          }
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v53 = v13;
          uint64_t v55 = [v53 countByEnumeratingWithState:&v68 objects:v86 count:16];
          if (v55)
          {
            uint64_t v54 = *(void *)v69;
            do
            {
              for (uint64_t i = 0; i != v55; ++i)
              {
                if (*(void *)v69 != v54) {
                  objc_enumerationMutation(v53);
                }
                v57 = *(void **)(*((void *)&v68 + 1) + 8 * i);
                v59 = [v57 phoneNumbers];
                if ([v59 count])
                {
                  long long v66 = 0u;
                  long long v67 = 0u;
                  long long v64 = 0u;
                  long long v65 = 0u;
                  id v16 = v59;
                  uint64_t v17 = [v16 countByEnumeratingWithState:&v64 objects:v85 count:16];
                  if (v17)
                  {
                    uint64_t v18 = *(void *)v65;
                    do
                    {
                      for (uint64_t j = 0; j != v17; ++j)
                      {
                        if (*(void *)v65 != v18) {
                          objc_enumerationMutation(v16);
                        }
                        v20 = *(void **)(*((void *)&v64 + 1) + 8 * j);
                        v21 = [v20 value];
                        v22 = [v21 stringValue];

                        v23 = [v20 label];
                        if (![v10 length] || objc_msgSend(v10, "isEqualToString:", v23))
                        {
                          if (IMOSLoggingEnabled())
                          {
                            v24 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 138412546;
                              *(void *)&buf[4] = v22;
                              *(_WORD *)&buf[12] = 2112;
                              *(void *)&buf[14] = v23;
                              _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "Found number %@ for label %@", buf, 0x16u);
                            }
                          }
                          if (v22)
                          {
                            v25 = +[CKAssistantSearchUtilities canonicalizeNumber:v22];
                            if (v25) {
                              [v4 addObject:v25];
                            }
                          }
                        }
                      }
                      uint64_t v17 = [v16 countByEnumeratingWithState:&v64 objects:v85 count:16];
                    }
                    while (v17);
                  }
                }
                v58 = [v57 emailAddresses];
                if ([v58 count])
                {
                  long long v62 = 0u;
                  long long v63 = 0u;
                  long long v60 = 0u;
                  long long v61 = 0u;
                  id v26 = v58;
                  uint64_t v27 = [v26 countByEnumeratingWithState:&v60 objects:v84 count:16];
                  if (v27)
                  {
                    uint64_t v28 = *(void *)v61;
                    do
                    {
                      for (uint64_t k = 0; k != v27; ++k)
                      {
                        if (*(void *)v61 != v28) {
                          objc_enumerationMutation(v26);
                        }
                        v30 = *(void **)(*((void *)&v60 + 1) + 8 * k);
                        v31 = [v30 value];
                        v32 = [v30 label];
                        if (![v10 length] || objc_msgSend(v10, "isEqualToString:", v32))
                        {
                          if (IMOSLoggingEnabled())
                          {
                            v33 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 138412546;
                              *(void *)&buf[4] = v31;
                              *(_WORD *)&buf[12] = 2112;
                              *(void *)&buf[14] = v32;
                              _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "Found email %@ for label %@", buf, 0x16u);
                            }
                          }
                          if (v31)
                          {
                            v34 = +[CKAssistantSearchUtilities canonicalizeNumber:v31];
                            if (v34) {
                              [v4 addObject:v34];
                            }
                          }
                        }
                      }
                      uint64_t v27 = [v26 countByEnumeratingWithState:&v60 objects:v84 count:16];
                    }
                    while (v27);
                  }
                }
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v68 objects:v86 count:16];
            }
            while (v55);
          }

          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v81 = __Block_byref_object_copy__40;
          v82 = __Block_byref_object_dispose__40;
          id v83 = 0;
          id v35 = v4;
          IMDPersistencePerformBlock();
          if (*(void *)(*(void *)&buf[8] + 40))
          {
            if (IMOSLoggingEnabled())
            {
              v36 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
                v38 = *(void **)(*(void *)&buf[8] + 40);
                *(_DWORD *)v76 = 138412546;
                v77 = v37;
                __int16 v78 = 2112;
                v79 = v38;
                _os_log_impl(&dword_18EF18000, v36, OS_LOG_TYPE_INFO, "Found %@ addresses for recipients, selecting most recent address %@", v76, 0x16u);
              }
            }
            [v47 addObject:*(void *)(*(void *)&buf[8] + 40)];
          }
          else if ([v35 count])
          {
            if (IMOSLoggingEnabled())
            {
              v40 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
                v42 = [v35 firstObject];
                *(_DWORD *)v76 = 138412546;
                v77 = v41;
                __int16 v78 = 2112;
                v79 = v42;
                _os_log_impl(&dword_18EF18000, v40, OS_LOG_TYPE_INFO, "Found %@ addresses for recipients, but no recent address, selecting first address %@", v76, 0x16u);
              }
            }
            v43 = [v35 firstObject];
            [v47 addObject:v43];
          }
          [v35 removeAllObjects];

          _Block_object_dispose(buf, 8);
        }
        else if (IMOSLoggingEnabled())
        {
          v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "Internal guid of person was nil, could not find address for that person.", buf, 2u);
          }
        }
        uint64_t v6 = v50 + 1;
      }
      while (v50 + 1 != v51);
      uint64_t v51 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
    }
    while (v51);
  }

  if (IMOSLoggingEnabled())
  {
    v44 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v47;
      _os_log_impl(&dword_18EF18000, v44, OS_LOG_TYPE_INFO, "getAddressesFromPeople returning addresses: %@", buf, 0xCu);
    }
  }

  return v47;
}

void __53__CKAssistantSearchUtilities_getAddressesFromPeople___block_invoke(uint64_t a1)
{
  id v5 = (id)IMDMessageRecordCopyMostRecentUseageOfAddresses();
  uint64_t v2 = [v5 firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end