@interface DNDClientEventDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)notifyAnyway;
- (BOOL)shouldAlwaysInterrupt;
- (DNDClientEventBehavior)forwardingBehavior;
- (DNDClientEventDetails)init;
- (DNDClientEventDetails)initWithCoder:(id)a3;
- (DNDContactHandle)sender;
- (NSString)body;
- (NSString)bundleIdentifier;
- (NSString)filterCriteria;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)threadIdentifier;
- (NSString)title;
- (id)_descriptionForRedacted:(BOOL)a3;
- (id)_initWithDetails:(id)a3;
- (id)_initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 platform:(unint64_t)a5 type:(unint64_t)a6 urgency:(unint64_t)a7 sender:(id)a8 threadIdentifier:(id)a9 filterCriteria:(id)a10 notifyAnyway:(BOOL)a11 behavior:(unint64_t)a12 forwardingBehavior:(id)a13 title:(id)a14 subtitle:(id)a15 body:(id)a16;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (unint64_t)behavior;
- (unint64_t)hash;
- (unint64_t)platform;
- (unint64_t)type;
- (unint64_t)urgency;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDClientEventDetails

- (DNDClientEventDetails)init
{
  return (DNDClientEventDetails *)[(DNDClientEventDetails *)self _initWithDetails:0];
}

- (id)_initWithDetails:(id)a3
{
  id v3 = a3;
  v20 = [v3 identifier];
  v19 = [v3 bundleIdentifier];
  uint64_t v18 = [v3 platform];
  uint64_t v17 = [v3 type];
  uint64_t v16 = [v3 urgency];
  v4 = [v3 sender];
  v5 = [v3 threadIdentifier];
  v6 = [v3 filterCriteria];
  char v7 = [v3 notifyAnyway];
  uint64_t v8 = [v3 behavior];
  v9 = [v3 forwardingBehavior];
  v10 = [v3 title];
  v11 = [v3 subtitle];
  v12 = [v3 body];

  LOBYTE(v15) = v7;
  id v13 = [(DNDClientEventDetails *)self _initWithIdentifier:v20 bundleIdentifier:v19 platform:v18 type:v17 urgency:v16 sender:v4 threadIdentifier:v5 filterCriteria:v6 notifyAnyway:v15 behavior:v8 forwardingBehavior:v9 title:v10 subtitle:v11 body:v12];

  return v13;
}

- (id)_initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 platform:(unint64_t)a5 type:(unint64_t)a6 urgency:(unint64_t)a7 sender:(id)a8 threadIdentifier:(id)a9 filterCriteria:(id)a10 notifyAnyway:(BOOL)a11 behavior:(unint64_t)a12 forwardingBehavior:(id)a13 title:(id)a14 subtitle:(id)a15 body:(id)a16
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v56 = a13;
  id v24 = a14;
  id v25 = a15;
  id v26 = a16;
  v57.receiver = self;
  v57.super_class = (Class)DNDClientEventDetails;
  v27 = [(DNDClientEventDetails *)&v57 init];
  if (v27)
  {
    v51 = v23;
    v52 = v22;
    v28 = v21;
    v29 = v20;
    v30 = (void *)[v19 copy];
    v31 = v30;
    if (v30)
    {
      v32 = v30;
      identifier = v27->_identifier;
      v27->_identifier = v32;
    }
    else
    {
      identifier = [MEMORY[0x1E4F29128] UUID];
      uint64_t v34 = [identifier UUIDString];
      v35 = v27->_identifier;
      v27->_identifier = (NSString *)v34;
    }
    id v20 = v29;
    uint64_t v36 = [v29 copy];
    bundleIdentifier = v27->_bundleIdentifier;
    v27->_bundleIdentifier = (NSString *)v36;

    v27->_platform = a5;
    v27->_type = a6;
    v27->_urgency = a7;
    id v21 = v28;
    uint64_t v38 = [v28 copy];
    sender = v27->_sender;
    v27->_sender = (DNDContactHandle *)v38;

    id v22 = v52;
    uint64_t v40 = [v52 copy];
    threadIdentifier = v27->_threadIdentifier;
    v27->_threadIdentifier = (NSString *)v40;

    id v23 = v51;
    uint64_t v42 = [v51 copy];
    filterCriteria = v27->_filterCriteria;
    v27->_filterCriteria = (NSString *)v42;

    v27->_notifyAnyway = a11;
    v27->_behavior = a12;
    objc_storeStrong((id *)&v27->_forwardingBehavior, a13);
    uint64_t v44 = [v24 copy];
    title = v27->_title;
    v27->_title = (NSString *)v44;

    uint64_t v46 = [v25 copy];
    subtitle = v27->_subtitle;
    v27->_subtitle = (NSString *)v46;

    uint64_t v48 = [v26 copy];
    body = v27->_body;
    v27->_body = (NSString *)v48;
  }
  return v27;
}

- (BOOL)shouldAlwaysInterrupt
{
  return self->_urgency == 2;
}

- (unint64_t)hash
{
  id v26 = [(DNDClientEventDetails *)self identifier];
  uint64_t v3 = [v26 hash];
  v4 = [(DNDClientEventDetails *)self bundleIdentifier];
  uint64_t v5 = [v4 hash] ^ v3;
  unint64_t v6 = [(DNDClientEventDetails *)self platform];
  unint64_t v7 = v6 ^ [(DNDClientEventDetails *)self type];
  unint64_t v8 = v5 ^ v7 ^ [(DNDClientEventDetails *)self urgency];
  v9 = [(DNDClientEventDetails *)self sender];
  uint64_t v10 = [v9 hash];
  v11 = [(DNDClientEventDetails *)self threadIdentifier];
  uint64_t v12 = v10 ^ [v11 hash];
  id v13 = [(DNDClientEventDetails *)self filterCriteria];
  uint64_t v14 = v8 ^ v12 ^ [v13 hash];
  uint64_t v15 = [(DNDClientEventDetails *)self notifyAnyway];
  unint64_t v16 = v15 ^ [(DNDClientEventDetails *)self behavior];
  uint64_t v17 = [(DNDClientEventDetails *)self forwardingBehavior];
  uint64_t v18 = v14 ^ v16 ^ [v17 hash];
  id v19 = [(DNDClientEventDetails *)self title];
  uint64_t v20 = [v19 hash];
  id v21 = [(DNDClientEventDetails *)self subtitle];
  uint64_t v22 = v20 ^ [v21 hash];
  id v23 = [(DNDClientEventDetails *)self body];
  unint64_t v24 = v18 ^ v22 ^ [v23 hash];

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DNDClientEventDetails *)a3;
  if (self == v4)
  {
    char v17 = 1;
    goto LABEL_94;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v17 = 0;
    goto LABEL_94;
  }
  uint64_t v5 = v4;
  unint64_t v6 = [(DNDClientEventDetails *)self identifier];
  unint64_t v7 = [(DNDClientEventDetails *)v5 identifier];
  uint64_t v8 = v6 != v7;
  if (v6 == v7) {
    goto LABEL_10;
  }
  uint64_t v9 = [(DNDClientEventDetails *)self identifier];
  if (!v9)
  {
    v110 = 0;
    uint64_t v116 = 0;
    uint64_t v114 = 0;
    memset(v113, 0, sizeof(v113));
    memset(v111, 0, sizeof(v111));
    memset(v112, 0, sizeof(v112));
    memset(v115, 0, sizeof(v115));
    LODWORD(v12) = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    char v17 = 0;
    goto LABEL_29;
  }
  v110 = (void *)v9;
  uint64_t v10 = [(DNDClientEventDetails *)v5 identifier];
  if (!v10)
  {
    v107 = 0;
    uint64_t v114 = 0;
    *(void *)&v115[8] = 0;
    memset(v113, 0, sizeof(v113));
    uint64_t v116 = 0;
    memset(v111, 0, sizeof(v111));
    memset(v112, 0, sizeof(v112));
    *(void *)v115 = 0;
    LODWORD(v12) = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    char v17 = 0;
    *(_DWORD *)&v115[16] = 1;
    goto LABEL_29;
  }
  v107 = (void *)v10;
  v11 = [(DNDClientEventDetails *)self identifier];
  v104 = [(DNDClientEventDetails *)v5 identifier];
  v105 = v11;
  if (objc_msgSend(v11, "isEqual:"))
  {
LABEL_10:
    uint64_t v18 = [(DNDClientEventDetails *)self bundleIdentifier];
    v108 = [(DNDClientEventDetails *)v5 bundleIdentifier];
    v109 = (void *)v18;
    BOOL v19 = v18 != (void)v108;
    *(_DWORD *)&v115[16] = v6 != v7;
    if ((void *)v18 != v108)
    {
      uint64_t v20 = [(DNDClientEventDetails *)self bundleIdentifier];
      if (!v20)
      {
        v106 = 0;
        memset(v113, 0, sizeof(v113));
        uint64_t v116 = 0;
        *(void *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        LODWORD(v12) = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        *(_DWORD *)v115 = 0;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v115[12] = 1;
        goto LABEL_29;
      }
      v106 = (void *)v20;
      uint64_t v21 = [(DNDClientEventDetails *)v5 bundleIdentifier];
      if (!v21)
      {
        v103 = 0;
        memset(v113, 0, 32);
        uint64_t v116 = 0;
        *(void *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        LODWORD(v12) = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        *(_DWORD *)v115 = 0;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v115[12] = 1;
        *(_DWORD *)&v113[32] = 1;
        goto LABEL_29;
      }
      v103 = (void *)v21;
      uint64_t v22 = [(DNDClientEventDetails *)self bundleIdentifier];
      v101 = [(DNDClientEventDetails *)v5 bundleIdentifier];
      v102 = v22;
      if (!objc_msgSend(v22, "isEqual:"))
      {
        uint64_t v116 = 0;
        *(void *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        *(void *)v112 = 0;
        memset(&v113[4], 0, 28);
        LODWORD(v12) = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        *(_DWORD *)v115 = 0;
        *(_DWORD *)&v113[32] = 1;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v115[12] = 1;
        int v23 = 1;
LABEL_25:
        *(_DWORD *)&v112[8] = 0;
        *(_DWORD *)v113 = v23;
        goto LABEL_29;
      }
    }
    unint64_t v24 = [(DNDClientEventDetails *)self platform];
    *(_DWORD *)&v115[12] = v19;
    if (v24 != [(DNDClientEventDetails *)v5 platform]
      || (unint64_t v25 = [(DNDClientEventDetails *)self type], v25 != [(DNDClientEventDetails *)v5 type])
      || (unint64_t v26 = [(DNDClientEventDetails *)self urgency], v26 != [(DNDClientEventDetails *)v5 urgency]))
    {
      uint64_t v116 = 0;
      *(void *)&v115[4] = 0;
      memset(v111, 0, sizeof(v111));
      *(void *)v112 = 0;
      memset(&v113[4], 0, 28);
      LODWORD(v12) = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      char v17 = 0;
      *(_DWORD *)v115 = 0;
      *(_DWORD *)&v113[32] = v19;
      uint64_t v114 = (v6 != v7) | 0x100000000;
      int v23 = v19;
      int v13 = 0;
      goto LABEL_25;
    }
    uint64_t v27 = [(DNDClientEventDetails *)self sender];
    v99 = [(DNDClientEventDetails *)v5 sender];
    v100 = (void *)v27;
    BOOL v28 = v27 == (void)v99;
    BOOL v29 = v27 != (void)v99;
    if (!v28)
    {
      uint64_t v30 = [(DNDClientEventDetails *)self sender];
      if (!v30)
      {
        v98 = 0;
        *(void *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        memset(&v113[4], 0, 24);
        *(_DWORD *)v113 = v19;
        LODWORD(v12) = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        *(_DWORD *)v115 = 0;
        *(_DWORD *)&v113[32] = v19;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        int v13 = 0;
        *(_DWORD *)&v113[28] = 1;
        uint64_t v116 = 0x100000000;
        goto LABEL_29;
      }
      v98 = (void *)v30;
      uint64_t v31 = [(DNDClientEventDetails *)v5 sender];
      if (!v31)
      {
        v95 = 0;
        *(void *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        memset(&v113[4], 0, 20);
        *(_DWORD *)v113 = v19;
        LODWORD(v12) = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        *(_DWORD *)v115 = 0;
        *(_DWORD *)&v113[32] = v19;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        int v13 = 0;
        *(_DWORD *)&v113[28] = 1;
        uint64_t v116 = 0x100000000;
        *(_DWORD *)&v113[24] = 1;
        goto LABEL_29;
      }
      v95 = (void *)v31;
      v32 = [(DNDClientEventDetails *)self sender];
      v90 = [(DNDClientEventDetails *)v5 sender];
      v91 = v32;
      if (!objc_msgSend(v32, "isEqual:"))
      {
        *(void *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        *(void *)&v113[4] = 0;
        *(_DWORD *)v113 = v19;
        LODWORD(v12) = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        *(_DWORD *)v115 = 0;
        *(_DWORD *)&v113[32] = v19;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        int v13 = 0;
        *(_DWORD *)&v113[24] = 1;
        *(_DWORD *)&v113[28] = 1;
        uint64_t v116 = 0x100000000;
        *(_DWORD *)&v113[12] = 0;
        *(void *)&v113[16] = 1;
        goto LABEL_29;
      }
    }
    uint64_t v41 = [(DNDClientEventDetails *)self threadIdentifier];
    uint64_t v42 = [(DNDClientEventDetails *)v5 threadIdentifier];
    BOOL v43 = v41 != v42;
    HIDWORD(v116) = v29;
    v96 = (void *)v42;
    v97 = (void *)v41;
    if (v41 != v42)
    {
      uint64_t v12 = [(DNDClientEventDetails *)self threadIdentifier];
      if (!v12)
      {
        v94 = 0;
        LODWORD(v116) = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        *(void *)&v113[4] = 0;
        *(void *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        int v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v115[8] = 1;
        goto LABEL_29;
      }
      uint64_t v44 = [(DNDClientEventDetails *)v5 threadIdentifier];
      v94 = (void *)v12;
      if (!v44)
      {
        v89 = 0;
        *(void *)v111 = 0;
        *(void *)&v111[8] = 0;
        LODWORD(v116) = 0;
        memset(v112, 0, sizeof(v112));
        *(void *)&v113[4] = 0;
        *(void *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        LODWORD(v12) = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        int v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v115[8] = 1;
        *(_DWORD *)&v111[16] = 1;
        goto LABEL_29;
      }
      v89 = (void *)v44;
      v45 = [(DNDClientEventDetails *)self threadIdentifier];
      v86 = [(DNDClientEventDetails *)v5 threadIdentifier];
      v87 = v45;
      if (!objc_msgSend(v45, "isEqual:"))
      {
        LODWORD(v116) = 0;
        *(void *)v111 = 0;
        memset(v112, 0, sizeof(v112));
        *(void *)&v113[4] = 0;
        *(void *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        LODWORD(v12) = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        int v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v115[8] = 1;
        *(_DWORD *)&v111[16] = 1;
        *(void *)&v111[8] = 1;
        goto LABEL_29;
      }
    }
    uint64_t v46 = [(DNDClientEventDetails *)self filterCriteria];
    uint64_t v47 = [(DNDClientEventDetails *)v5 filterCriteria];
    uint64_t v48 = (void *)v46;
    v92 = (void *)v47;
    BOOL v28 = v46 == v47;
    BOOL v49 = v46 != v47;
    *(_DWORD *)&v115[8] = v43;
    v93 = v48;
    if (!v28)
    {
      uint64_t v50 = [(DNDClientEventDetails *)self filterCriteria];
      if (!v50)
      {
        v88 = 0;
        BOOL v56 = v43;
        *(void *)v111 = 0;
        memset(v112, 0, sizeof(v112));
        *(void *)&v113[4] = 0;
        *(void *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        LODWORD(v12) = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        int v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v111[16] = v56;
        *(_DWORD *)&v111[8] = v56;
        *(_DWORD *)&v111[12] = 1;
        LODWORD(v116) = 1;
        goto LABEL_29;
      }
      v88 = (void *)v50;
      uint64_t v51 = [(DNDClientEventDetails *)v5 filterCriteria];
      if (!v51)
      {
        v85 = 0;
        *(void *)v111 = 0x100000000;
        memset(v112, 0, sizeof(v112));
        *(void *)&v113[4] = 0;
        *(void *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        LODWORD(v12) = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        int v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v111[12] = 1;
        *(_DWORD *)&v111[16] = v43;
        *(_DWORD *)&v111[8] = v43;
        int v14 = 0;
        LODWORD(v116) = 1;
        goto LABEL_29;
      }
      LODWORD(v116) = v49;
      v85 = (void *)v51;
      v52 = [(DNDClientEventDetails *)self filterCriteria];
      v83 = [(DNDClientEventDetails *)v5 filterCriteria];
      v84 = v52;
      if (!objc_msgSend(v52, "isEqual:"))
      {
        memset(v112, 0, sizeof(v112));
        *(void *)&v113[4] = 0;
        *(void *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        LODWORD(v12) = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        int v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v111[12] = 1;
        *(_DWORD *)&v111[16] = v43;
        *(_DWORD *)&v111[8] = v43;
        int v14 = 0;
        LODWORD(v116) = 1;
        *(void *)v111 = 0x100000001;
        goto LABEL_29;
      }
      BOOL v49 = v116;
    }
    BOOL v53 = [(DNDClientEventDetails *)self notifyAnyway];
    LODWORD(v116) = v49;
    if (v53 != [(DNDClientEventDetails *)v5 notifyAnyway]
      || (unint64_t v54 = [(DNDClientEventDetails *)self behavior],
          v54 != [(DNDClientEventDetails *)v5 behavior]))
    {
      memset(v112, 0, sizeof(v112));
      *(void *)&v113[4] = 0;
      *(void *)v115 = 0;
      *(_DWORD *)v113 = v19;
      int v15 = 0;
      int v16 = 0;
      char v17 = 0;
      uint64_t v114 = (v6 != v7) | 0x100000000;
      *(_DWORD *)&v113[28] = 1;
      *(_DWORD *)&v113[32] = v19;
      int v13 = 0;
      *(_DWORD *)&v113[24] = HIDWORD(v116);
      *(_DWORD *)&v113[12] = 0;
      *(_DWORD *)&v113[16] = HIDWORD(v116);
      *(_DWORD *)&v113[20] = 1;
      *(_DWORD *)&v111[12] = 1;
      *(_DWORD *)&v111[16] = v43;
      *(_DWORD *)&v111[4] = v49;
      *(_DWORD *)&v111[8] = v43;
      int v14 = 0;
      *(_DWORD *)v111 = v49;
      LODWORD(v12) = 0;
      goto LABEL_29;
    }
    uint64_t v55 = [(DNDClientEventDetails *)self forwardingBehavior];
    v81 = [(DNDClientEventDetails *)v5 forwardingBehavior];
    v82 = (void *)v55;
    if ((void *)v55 != v81)
    {
      *(void *)&v113[4] = 0;
      *(void *)v115 = 0;
      *(void *)&v112[4] = 0;
      *(_DWORD *)&v113[12] = 0;
      *(_DWORD *)&v113[16] = HIDWORD(v116);
      int v15 = 0;
      int v16 = 0;
      char v17 = 0;
      uint64_t v114 = (v6 != v7) | 0x100000000;
      *(_DWORD *)&v113[28] = 1;
      *(_DWORD *)&v113[32] = v19;
      *(_DWORD *)v113 = v19;
      int v13 = 0;
      *(_DWORD *)&v113[24] = HIDWORD(v116);
      *(_DWORD *)&v113[20] = 1;
      *(_DWORD *)&v111[12] = 1;
      *(_DWORD *)&v111[16] = v43;
      *(_DWORD *)&v111[4] = v49;
      *(_DWORD *)&v111[8] = v43;
      int v14 = 0;
      *(_DWORD *)v111 = v49;
      LODWORD(v12) = 0;
      *(_DWORD *)v112 = 1;
      goto LABEL_29;
    }
    uint64_t v57 = [(DNDClientEventDetails *)self title];
    v63 = v5;
    v79 = [(DNDClientEventDetails *)v5 title];
    v80 = (void *)v57;
    *(_DWORD *)&v115[4] = v57 != (void)v79;
    if ((void *)v57 == v79) {
      goto LABEL_122;
    }
    v78 = [(DNDClientEventDetails *)self title];
    if (!v78)
    {
      v78 = 0;
      *(void *)&v112[4] = 0;
      *(void *)&v113[8] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      char v17 = 0;
      *(void *)v115 = 0x100000000;
      uint64_t v114 = (v6 != v7) | 0x100000000;
      *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
      *(_DWORD *)v113 = *(_DWORD *)&v115[12];
      *(_DWORD *)&v113[28] = 1;
      *(_DWORD *)&v113[24] = HIDWORD(v116);
      *(_DWORD *)&v113[16] = HIDWORD(v116);
      *(_DWORD *)&v113[20] = 1;
      *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[4] = v49;
      *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[12] = 1;
      *(_DWORD *)v111 = v49;
      LODWORD(v12) = 0;
      v81 = v82;
      *(_DWORD *)v112 = 1;
      *(_DWORD *)&v113[4] = 1;
      goto LABEL_138;
    }
    v77 = [(DNDClientEventDetails *)v5 title];
    if (!v77)
    {
      v77 = 0;
      *(void *)&v113[8] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      char v17 = 0;
      *(void *)v115 = 0x100000000;
      uint64_t v114 = (v6 != v7) | 0x100000000;
      *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
      *(_DWORD *)&v112[8] = 0;
      *(_DWORD *)v113 = *(_DWORD *)&v115[12];
      *(_DWORD *)&v113[28] = 1;
      *(_DWORD *)&v113[24] = HIDWORD(v116);
      *(_DWORD *)&v113[16] = HIDWORD(v116);
      *(_DWORD *)&v113[20] = 1;
      *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[4] = v49;
      *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[12] = 1;
      *(_DWORD *)v111 = v49;
      LODWORD(v12) = 0;
      v81 = v82;
      *(void *)v112 = 0x100000001;
      *(_DWORD *)&v113[4] = 1;
      goto LABEL_138;
    }
    v58 = [(DNDClientEventDetails *)self title];
    v69 = [(DNDClientEventDetails *)v63 title];
    v70 = v58;
    if (objc_msgSend(v58, "isEqual:"))
    {
LABEL_122:
      uint64_t v59 = [(DNDClientEventDetails *)self subtitle];
      v75 = [(DNDClientEventDetails *)v63 subtitle];
      v76 = (void *)v59;
      *(_DWORD *)v115 = v59 != (void)v75;
      if ((void *)v59 == v75) {
        goto LABEL_128;
      }
      v74 = [(DNDClientEventDetails *)self subtitle];
      if (!v74)
      {
        v74 = 0;
        *(void *)&v113[8] = 0x100000000;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
        *(_DWORD *)v113 = *(_DWORD *)&v115[12];
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[24] = HIDWORD(v116);
        *(_DWORD *)&v113[16] = HIDWORD(v116);
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[4] = v49;
        *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[12] = 1;
        *(_DWORD *)v111 = v49;
        LODWORD(v12) = 0;
        v81 = v82;
        *(_DWORD *)v112 = 1;
        *(_DWORD *)&v113[4] = 1;
        *(_DWORD *)&v112[4] = v57 != (void)v79;
        *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
        *(_DWORD *)v115 = 1;
        goto LABEL_138;
      }
      v71 = [(DNDClientEventDetails *)v63 subtitle];
      if (!v71)
      {
        v71 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
        *(_DWORD *)v113 = *(_DWORD *)&v115[12];
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[24] = HIDWORD(v116);
        *(_DWORD *)&v113[16] = HIDWORD(v116);
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[4] = v49;
        *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[12] = 1;
        *(_DWORD *)v111 = v49;
        LODWORD(v12) = 0;
        v81 = v82;
        *(_DWORD *)v112 = 1;
        *(_DWORD *)&v113[4] = 1;
        *(_DWORD *)&v112[4] = v57 != (void)v79;
        *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
        *(_DWORD *)v115 = 1;
        *(void *)&v113[8] = 0x100000001;
        goto LABEL_138;
      }
      v60 = [(DNDClientEventDetails *)self subtitle];
      v65 = [(DNDClientEventDetails *)v63 subtitle];
      v66 = v60;
      if (objc_msgSend(v60, "isEqual:"))
      {
LABEL_128:
        uint64_t v61 = [(DNDClientEventDetails *)self body];
        v72 = [(DNDClientEventDetails *)v63 body];
        v73 = (void *)v61;
        if ((void *)v61 == v72)
        {
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          uint64_t v114 = (v6 != v7) | 0x100000000;
          *(_DWORD *)&v113[32] = v19;
          *(_DWORD *)v113 = v19;
          *(_DWORD *)&v113[24] = HIDWORD(v116);
          *(_DWORD *)&v113[28] = 1;
          *(_DWORD *)&v113[16] = HIDWORD(v116);
          *(_DWORD *)&v113[20] = 1;
          *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
          *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
          *(_DWORD *)&v111[12] = 1;
          *(_DWORD *)v111 = v49;
          *(_DWORD *)&v111[4] = v49;
          v81 = v82;
          *(_DWORD *)v112 = 1;
          *(_DWORD *)&v112[4] = v57 != (void)v79;
          *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
          *(_DWORD *)&v113[12] = 1;
          *(_DWORD *)&v113[4] = 1;
          *(_DWORD *)&v113[8] = *(_DWORD *)v115;
          LODWORD(v12) = *(_DWORD *)v115;
          v72 = (void *)v61;
          int v13 = 1;
          char v17 = 1;
        }
        else
        {
          v68 = [(DNDClientEventDetails *)self body];
          if (v68)
          {
            v67 = [(DNDClientEventDetails *)v63 body];
            if (v67)
            {
              v62 = [(DNDClientEventDetails *)self body];
              uint64_t v5 = v63;
              uint64_t v8 = [(DNDClientEventDetails *)v63 body];
              v64 = v62;
              char v17 = [v62 isEqual:v8];
              uint64_t v114 = *(unsigned int *)&v115[16] | 0x100000000;
              *(_DWORD *)&v113[32] = v19;
              *(_DWORD *)v113 = v19;
              *(_DWORD *)&v113[24] = HIDWORD(v116);
              *(_DWORD *)&v113[28] = 1;
              *(_DWORD *)&v113[16] = HIDWORD(v116);
              *(_DWORD *)&v113[20] = 1;
              *(_DWORD *)&v111[16] = v43;
              *(_DWORD *)&v111[8] = v43;
              *(_DWORD *)&v111[12] = 1;
              *(_DWORD *)v111 = v49;
              *(_DWORD *)&v111[4] = v49;
              v81 = v82;
              *(_DWORD *)v112 = 1;
              *(_DWORD *)&v112[4] = *(_DWORD *)&v115[4];
              *(_DWORD *)&v112[8] = *(_DWORD *)&v115[4];
              *(_DWORD *)&v113[12] = 1;
              *(_DWORD *)&v113[4] = 1;
              *(_DWORD *)&v113[8] = *(_DWORD *)v115;
              LODWORD(v12) = *(_DWORD *)v115;
              int v13 = 1;
              int v14 = 1;
              int v15 = 1;
              int v16 = 1;
              goto LABEL_29;
            }
            v67 = 0;
            int v16 = 0;
            char v17 = 0;
            uint64_t v114 = (v6 != v7) | 0x100000000;
            *(_DWORD *)&v113[32] = v19;
            *(_DWORD *)v113 = v19;
            *(_DWORD *)&v113[24] = HIDWORD(v116);
            *(_DWORD *)&v113[28] = 1;
            *(_DWORD *)&v113[16] = HIDWORD(v116);
            *(_DWORD *)&v113[20] = 1;
            *(_DWORD *)&v111[16] = v43;
            *(_DWORD *)&v111[8] = v43;
            *(_DWORD *)&v111[12] = 1;
            *(_DWORD *)v111 = v49;
            *(_DWORD *)&v111[4] = v49;
            v81 = v82;
            *(_DWORD *)v112 = 1;
            *(_DWORD *)&v112[4] = v57 != (void)v79;
            *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
            *(_DWORD *)&v113[12] = 1;
            *(_DWORD *)&v113[4] = 1;
            *(_DWORD *)&v113[8] = *(_DWORD *)v115;
            LODWORD(v12) = *(_DWORD *)v115;
            int v13 = 1;
            int v14 = 1;
            int v15 = 1;
          }
          else
          {
            v68 = 0;
            int v15 = 0;
            int v16 = 0;
            char v17 = 0;
            uint64_t v114 = (v6 != v7) | 0x100000000;
            *(_DWORD *)&v113[32] = v19;
            *(_DWORD *)v113 = v19;
            *(_DWORD *)&v113[24] = HIDWORD(v116);
            *(_DWORD *)&v113[28] = 1;
            *(_DWORD *)&v113[16] = HIDWORD(v116);
            *(_DWORD *)&v113[20] = 1;
            *(_DWORD *)&v111[16] = v43;
            *(_DWORD *)&v111[8] = v43;
            *(_DWORD *)&v111[12] = 1;
            *(_DWORD *)v111 = v49;
            *(_DWORD *)&v111[4] = v49;
            v81 = v82;
            *(_DWORD *)v112 = 1;
            *(_DWORD *)&v112[4] = v57 != (void)v79;
            *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
            *(_DWORD *)&v113[12] = 1;
            *(_DWORD *)&v113[4] = 1;
            *(_DWORD *)&v113[8] = *(_DWORD *)v115;
            LODWORD(v12) = *(_DWORD *)v115;
            int v13 = 1;
            int v14 = 1;
          }
        }
      }
      else
      {
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        uint64_t v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
        *(_DWORD *)v113 = *(_DWORD *)&v115[12];
        *(_DWORD *)&v113[24] = HIDWORD(v116);
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[16] = HIDWORD(v116);
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[12] = 1;
        *(_DWORD *)v111 = v49;
        *(_DWORD *)&v111[4] = v49;
        v81 = v82;
        *(_DWORD *)v112 = 1;
        *(_DWORD *)&v112[4] = v57 != (void)v79;
        *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
        *(_DWORD *)v115 = 1;
        *(_DWORD *)&v113[4] = 1;
        *(void *)&v113[8] = 0x100000001;
        LODWORD(v12) = 1;
      }
    }
    else
    {
      *(void *)&v113[8] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      char v17 = 0;
      *(void *)v115 = 0x100000000;
      uint64_t v114 = (v6 != v7) | 0x100000000;
      *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
      *(_DWORD *)v113 = *(_DWORD *)&v115[12];
      *(_DWORD *)&v113[28] = 1;
      *(_DWORD *)&v113[24] = HIDWORD(v116);
      *(_DWORD *)&v113[16] = HIDWORD(v116);
      *(_DWORD *)&v113[20] = 1;
      *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[4] = v49;
      *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[12] = 1;
      *(_DWORD *)v111 = v49;
      LODWORD(v12) = 0;
      v81 = v82;
      *(void *)v112 = 0x100000001;
      *(_DWORD *)&v113[4] = 1;
      *(_DWORD *)&v112[8] = 1;
    }
LABEL_138:
    uint64_t v5 = v63;
    goto LABEL_29;
  }
  memset(v113, 0, sizeof(v113));
  uint64_t v116 = 0;
  memset(v111, 0, sizeof(v111));
  memset(v112, 0, sizeof(v112));
  *(_OWORD *)v115 = 0uLL;
  LODWORD(v12) = 0;
  int v13 = 0;
  int v14 = 0;
  int v15 = 0;
  int v16 = 0;
  char v17 = 0;
  *(_DWORD *)&v115[16] = 1;
  uint64_t v114 = 1;
LABEL_29:
  if (v16)
  {
    v33 = v5;
    uint64_t v34 = v7;
    v35 = v6;
    int v36 = v12;
    int v37 = v13;
    int v38 = v14;
    int v39 = v15;

    int v15 = v39;
    int v14 = v38;
    int v13 = v37;
    LODWORD(v12) = v36;
    unint64_t v6 = v35;
    unint64_t v7 = v34;
    uint64_t v5 = v33;
  }
  if (v15) {

  }
  if (v14) {
  if (v13)
  }
  {
  }
  if (v12)
  {
  }
  if (*(_DWORD *)&v113[8]) {

  }
  if (*(_DWORD *)v115) {
  if (*(_DWORD *)&v113[12])
  }
  {
  }
  if (*(_DWORD *)&v112[8])
  {
  }
  if (*(_DWORD *)&v112[4]) {

  }
  if (*(_DWORD *)&v115[4]) {
  if (*(_DWORD *)&v113[4])
  }
  {
  }
  if (*(_DWORD *)v112)
  {
  }
  if (*(_DWORD *)v111)
  {
  }
  if (*(_DWORD *)&v111[4]) {

  }
  if (v116) {
  if (*(_DWORD *)&v111[12])
  }
  {
  }
  if (*(_DWORD *)&v111[8])
  {
  }
  if (*(_DWORD *)&v111[16]) {

  }
  if (*(_DWORD *)&v115[8]) {
  if (*(_DWORD *)&v113[20])
  }
  {
  }
  if (*(_DWORD *)&v113[16])
  {
  }
  if (*(_DWORD *)&v113[24]) {

  }
  if (HIDWORD(v116)) {
  if (*(_DWORD *)&v113[28])
  }
  {
  }
  if (*(_DWORD *)v113)
  {
  }
  if (*(_DWORD *)&v113[32]) {

  }
  if (*(_DWORD *)&v115[12]) {
  if (HIDWORD(v114))
  }
  {
  }
  if (v114)
  {
  }
  if (*(_DWORD *)&v115[16]) {

  }
  if (v6 != v7) {
LABEL_94:
  }

  return v17;
}

- (id)description
{
  return [(DNDClientEventDetails *)self _descriptionForRedacted:0];
}

- (id)redactedDescription
{
  return [(DNDClientEventDetails *)self _descriptionForRedacted:1];
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = NSString;
  uint64_t v29 = objc_opt_class();
  uint64_t v5 = [(DNDClientEventDetails *)self identifier];
  int v36 = [(DNDClientEventDetails *)self bundleIdentifier];
  v35 = NSStringFromDNDPlatform([(DNDClientEventDetails *)self platform]);
  unint64_t v6 = [(DNDClientEventDetails *)self type];
  if (v6 > 4) {
    unint64_t v7 = @"<unknown>";
  }
  else {
    unint64_t v7 = off_1E5911798[v6];
  }
  BOOL v28 = v7;
  unint64_t v8 = [(DNDClientEventDetails *)self urgency];
  uint64_t v9 = @"<unknown>";
  if (v8 <= 2) {
    uint64_t v9 = off_1E59117C0[v8];
  }
  uint64_t v27 = v9;
  uint64_t v10 = [(DNDClientEventDetails *)self sender];
  uint64_t v11 = (uint64_t)v10;
  v33 = (void *)v5;
  BOOL v32 = v3;
  uint64_t v30 = v10;
  if (v3)
  {
    uint64_t v34 = [v10 redactedDescription];
    unint64_t v26 = [(DNDClientEventDetails *)self threadIdentifier];
    int v38 = objc_msgSend(v26, "dnd_privacyObfuscatedString");
    unint64_t v25 = [(DNDClientEventDetails *)self filterCriteria];
    int v37 = objc_msgSend(v25, "dnd_privacyObfuscatedString");
  }
  else
  {
    int v38 = [(DNDClientEventDetails *)self threadIdentifier];
    int v37 = [(DNDClientEventDetails *)self filterCriteria];
    uint64_t v34 = v11;
  }
  BOOL v12 = [(DNDClientEventDetails *)self notifyAnyway];
  unint64_t v13 = [(DNDClientEventDetails *)self behavior];
  int v14 = @"Legacy";
  if (v13 != 1) {
    int v14 = @"<unknown>";
  }
  if (!v13) {
    int v14 = @"Default";
  }
  int v15 = v14;
  int v16 = [(DNDClientEventDetails *)self forwardingBehavior];
  char v17 = [(DNDClientEventDetails *)self title];
  uint64_t v18 = objc_msgSend(v17, "dnd_privacyObfuscatedString");
  BOOL v19 = [(DNDClientEventDetails *)self subtitle];
  uint64_t v20 = objc_msgSend(v19, "dnd_privacyObfuscatedString");
  uint64_t v21 = [(DNDClientEventDetails *)self body];
  uint64_t v22 = objc_msgSend(v21, "dnd_privacyObfuscatedString");
  objc_msgSend(v31, "stringWithFormat:", @"<%@: %p; identifier: '%@'; bundleIdentifier: %@; platform: %@; type: %@; urgency: %@; sender: %@; threadIdentifier: %@; filterCritera: %@; notifyAnyway: %d; behavior: %@; forwardingBehavior: %@; title: %@; subtitle: %@; body: %@>",
    v29,
    self,
    v33,
    v36,
    v35,
    v28,
    v27,
    v34,
    v38,
    v37,
    v12,
    v15,
    v16,
    v18,
    v20,
  int v23 = v22);

  if (v32)
  {

    int v37 = v26;
    int v38 = (void *)v34;
  }

  return v23;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [DNDMutableClientEventDetails alloc];
  return [(DNDClientEventDetails *)v4 _initWithDetails:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDClientEventDetails)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  BOOL v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  uint64_t v18 = [v3 decodeIntegerForKey:@"platform"];
  uint64_t v17 = [v3 decodeIntegerForKey:@"type"];
  uint64_t v16 = [v3 decodeIntegerForKey:@"urgency"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"threadIdentifier"];
  unint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"filterCriteria"];
  char v7 = [v3 decodeBoolForKey:@"notifyAnyway"];
  uint64_t v8 = [v3 decodeIntegerForKey:@"behavior"];
  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"forwardingBehavior"];
  uint64_t v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  BOOL v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"body"];

  LOBYTE(v15) = v7;
  unint64_t v13 = [(DNDClientEventDetails *)self _initWithIdentifier:v20 bundleIdentifier:v19 platform:v18 type:v17 urgency:v16 sender:v4 threadIdentifier:v5 filterCriteria:v6 notifyAnyway:v15 behavior:v8 forwardingBehavior:v9 title:v10 subtitle:v11 body:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DNDClientEventDetails *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  unint64_t v6 = [(DNDClientEventDetails *)self bundleIdentifier];
  [v4 encodeObject:v6 forKey:@"bundleIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventDetails platform](self, "platform"), @"platform");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventDetails type](self, "type"), @"type");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventDetails urgency](self, "urgency"), @"urgency");
  char v7 = [(DNDClientEventDetails *)self sender];
  [v4 encodeObject:v7 forKey:@"sender"];

  uint64_t v8 = [(DNDClientEventDetails *)self threadIdentifier];
  [v4 encodeObject:v8 forKey:@"threadIdentifier"];

  uint64_t v9 = [(DNDClientEventDetails *)self filterCriteria];
  [v4 encodeObject:v9 forKey:@"filterCriteria"];

  objc_msgSend(v4, "encodeBool:forKey:", -[DNDClientEventDetails notifyAnyway](self, "notifyAnyway"), @"notifyAnyway");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventDetails behavior](self, "behavior"), @"behavior");
  uint64_t v10 = [(DNDClientEventDetails *)self forwardingBehavior];
  [v4 encodeObject:v10 forKey:@"forwardingBehavior"];

  uint64_t v11 = [(DNDClientEventDetails *)self title];
  [v4 encodeObject:v11 forKey:@"title"];

  BOOL v12 = [(DNDClientEventDetails *)self subtitle];
  [v4 encodeObject:v12 forKey:@"subtitle"];

  id v13 = [(DNDClientEventDetails *)self body];
  [v4 encodeObject:v13 forKey:@"body"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)urgency
{
  return self->_urgency;
}

- (DNDContactHandle)sender
{
  return self->_sender;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (BOOL)notifyAnyway
{
  return self->_notifyAnyway;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (DNDClientEventBehavior)forwardingBehavior
{
  return self->_forwardingBehavior;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_forwardingBehavior, 0);
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end