@interface MFMailRecipients
- (BOOL)sanitizeForComposeType:(int64_t)a3 sendingEmailAddress:(id)a4 hideMyEmailAddressProvider:(id)a5;
- (MFMailRecipients)initWithToRecipients:(id)a3 ccRecipients:(id)a4 bccRecipients:(id)a5;
- (NSArray)bccRecipients;
- (NSArray)ccRecipients;
- (NSArray)toRecipients;
- (void)setBccRecipients:(id)a3;
- (void)setCcRecipients:(id)a3;
- (void)setToRecipients:(id)a3;
@end

@implementation MFMailRecipients

- (MFMailRecipients)initWithToRecipients:(id)a3 ccRecipients:(id)a4 bccRecipients:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MFMailRecipients;
  v11 = [(MFMailRecipients *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    toRecipients = v11->_toRecipients;
    v11->_toRecipients = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    ccRecipients = v11->_ccRecipients;
    v11->_ccRecipients = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    bccRecipients = v11->_bccRecipients;
    v11->_bccRecipients = (NSArray *)v16;
  }
  return v11;
}

- (BOOL)sanitizeForComposeType:(int64_t)a3 sendingEmailAddress:(id)a4 hideMyEmailAddressProvider:(id)a5
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v74 = a4;
  v75 = (void (**)(void))a5;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v9 = [(MFMailRecipients *)self toRecipients];
  v76 = self;
  v81 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v11 = [(MFMailRecipients *)self ccRecipients];
  uint64_t v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = [(MFMailRecipients *)v76 bccRecipients];
  v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v16 = [(MFMailRecipients *)v76 toRecipients];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v99 objects:v107 count:16];
  if (v17)
  {
    char v82 = 0;
    uint64_t v18 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v100 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v99 + 1) + 8 * i);
        if ([v81 containsObject:v20]) {
          char v82 = 1;
        }
        else {
          [v81 addObject:v20];
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v99 objects:v107 count:16];
    }
    while (v17);
  }
  else
  {
    char v82 = 0;
  }

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v21 = [(MFMailRecipients *)v76 ccRecipients];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v95 objects:v106 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v96;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v96 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = *(void *)(*((void *)&v95 + 1) + 8 * j);
        if ([v12 containsObject:v25]) {
          char v82 = 1;
        }
        else {
          [v12 addObject:v25];
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v95 objects:v106 count:16];
    }
    while (v22);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v26 = [(MFMailRecipients *)v76 bccRecipients];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v91 objects:v105 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v92;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v92 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v91 + 1) + 8 * k);
        if ([v15 containsObject:v30]) {
          char v82 = 1;
        }
        else {
          [v15 addObject:v30];
        }
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v91 objects:v105 count:16];
    }
    while (v27);
  }

  if (a3 == 5)
  {
    id v31 = v74;
    v32 = [v31 emailAddressValue];
    v33 = [v32 simpleAddress];
    v34 = v33;
    if (v33)
    {
      id v77 = v33;
    }
    else
    {
      id v77 = [v31 stringValue];
    }

    v35 = v75[2]();
    uint64_t v36 = [v12 count];
    if (v36)
    {
      for (uint64_t m = v36 - 1; m != -1; --m)
      {
        if (v35)
        {
          id v38 = [v12 objectAtIndex:m];
          v39 = [v38 emailAddressValue];
          v40 = [v39 displayName];
          if (v40) {
            goto LABEL_43;
          }
        }
        else
        {
          id v38 = [v12 objectAtIndex:m];
          v39 = [v38 emailAddressValue];
          v40 = [v39 simpleAddress];
          if (v40)
          {
LABEL_43:
            id v41 = v40;
            v40 = v41;
            goto LABEL_44;
          }
        }
        id v41 = [v38 stringValue];
LABEL_44:
        v42 = v41;

        if (![v42 caseInsensitiveCompare:v77])
        {
          [v12 removeObjectAtIndex:m];
          char v82 = 1;
        }
      }
    }
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    obuint64_t j = v81;
    uint64_t v43 = [obj countByEnumeratingWithState:&v87 objects:v104 count:16];
    if (!v43) {
      goto LABEL_83;
    }
    uint64_t v79 = *(void *)v88;
LABEL_51:
    uint64_t v80 = v43;
    uint64_t v44 = 0;
    while (1)
    {
      if (*(void *)v88 != v79) {
        objc_enumerationMutation(obj);
      }
      id v45 = *(id *)(*((void *)&v87 + 1) + 8 * v44);
      v46 = [v45 emailAddressValue];
      v47 = [v46 simpleAddress];
      v48 = v47;
      if (v47)
      {
        id v49 = v47;
      }
      else
      {
        id v49 = [v45 stringValue];
      }
      v50 = v49;

      uint64_t v51 = [v12 count];
      if (v51)
      {
        for (uint64_t n = v51 - 1; n != -1; --n)
        {
          if (v35)
          {
            id v53 = [v12 objectAtIndex:n];
            v54 = [v53 emailAddressValue];
            v55 = [v54 displayName];
            if (v55) {
              goto LABEL_63;
            }
          }
          else
          {
            id v53 = [v12 objectAtIndex:n];
            v54 = [v53 emailAddressValue];
            v55 = [v54 simpleAddress];
            if (v55)
            {
LABEL_63:
              id v56 = v55;
              v55 = v56;
              goto LABEL_64;
            }
          }
          id v56 = [v53 stringValue];
LABEL_64:
          v57 = v56;

          if (![v57 caseInsensitiveCompare:v50])
          {
            [v12 removeObjectAtIndex:n];
            char v82 = 1;
          }
        }
      }
      uint64_t v58 = [v15 count];
      if (v58) {
        break;
      }
LABEL_81:

      if (++v44 == v80)
      {
        uint64_t v43 = [obj countByEnumeratingWithState:&v87 objects:v104 count:16];
        if (!v43)
        {
LABEL_83:

          goto LABEL_84;
        }
        goto LABEL_51;
      }
    }
    uint64_t v59 = v58 - 1;
    while (1)
    {
      if (v35)
      {
        id v60 = [v15 objectAtIndex:v59];
        v61 = [v60 emailAddressValue];
        v62 = [v61 displayName];
        if (v62) {
          goto LABEL_75;
        }
      }
      else
      {
        id v60 = [v15 objectAtIndex:v59];
        v61 = [v60 emailAddressValue];
        v62 = [v61 simpleAddress];
        if (v62)
        {
LABEL_75:
          id v63 = v62;
          v62 = v63;
          goto LABEL_76;
        }
      }
      id v63 = [v60 stringValue];
LABEL_76:
      v64 = v63;

      if (![v64 caseInsensitiveCompare:v50])
      {
        [v15 removeObjectAtIndex:v59];
        char v82 = 1;
      }

      if (--v59 == -1) {
        goto LABEL_81;
      }
    }
  }
LABEL_84:
  if ([v15 count])
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v65 = v12;
    uint64_t v66 = [v65 countByEnumeratingWithState:&v83 objects:v103 count:16];
    if (v66)
    {
      uint64_t v67 = *(void *)v84;
      do
      {
        for (iuint64_t i = 0; ii != v66; ++ii)
        {
          if (*(void *)v84 != v67) {
            objc_enumerationMutation(v65);
          }
          uint64_t v69 = [v15 indexOfObject:*(void *)(*((void *)&v83 + 1) + 8 * ii)];
          if (v69 != 0x7FFFFFFFFFFFFFFFLL)
          {
            [v15 removeObjectAtIndex:v69];
            char v82 = 1;
          }
        }
        uint64_t v66 = [v65 countByEnumeratingWithState:&v83 objects:v103 count:16];
      }
      while (v66);
    }
  }
  v70 = (void *)[v81 copy];
  [(MFMailRecipients *)v76 setToRecipients:v70];

  v71 = (void *)[v12 copy];
  [(MFMailRecipients *)v76 setCcRecipients:v71];

  v72 = (void *)[v15 copy];
  [(MFMailRecipients *)v76 setBccRecipients:v72];

  return v82 & 1;
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (void)setToRecipients:(id)a3
{
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (void)setCcRecipients:(id)a3
{
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (void)setBccRecipients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);

  objc_storeStrong((id *)&self->_toRecipients, 0);
}

@end