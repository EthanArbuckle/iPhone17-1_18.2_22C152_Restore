@interface NERelayConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEnabled;
- (BOOL)overlapsWithAppVPNConfiguration:(id)a3;
- (BOOL)overlapsWithRelayConfiguration:(id)a3;
- (BOOL)overlapsWithVPNConfiguration:(id)a3;
- (NEPerApp)perApp;
- (NERelayConfiguration)init;
- (NERelayConfiguration)initWithCoder:(id)a3;
- (NSArray)excludedDomains;
- (NSArray)matchDomains;
- (NSArray)onDemandRules;
- (NSArray)relays;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (uint64_t)overlapsWithAppsFromOtherAppRules:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExcludedDomains:(id)a3;
- (void)setMatchDomains:(id)a3;
- (void)setOnDemandRules:(id)a3;
- (void)setPerApp:(id)a3;
- (void)setRelays:(id)a3;
@end

@implementation NERelayConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDemandRules, 0);
  objc_storeStrong((id *)&self->_perApp, 0);
  objc_storeStrong((id *)&self->_excludedDomains, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);

  objc_storeStrong((id *)&self->_relays, 0);
}

- (void)setOnDemandRules:(id)a3
{
}

- (NSArray)onDemandRules
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPerApp:(id)a3
{
}

- (NEPerApp)perApp
{
  return (NEPerApp *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExcludedDomains:(id)a3
{
}

- (NSArray)excludedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMatchDomains:(id)a3
{
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRelays:(id)a3
{
}

- (NSArray)relays
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)overlapsWithAppVPNConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(NERelayConfiguration *)self perApp];
  v6 = [v5 appRules];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [v4 appRules];
    char v9 = -[NERelayConfiguration overlapsWithAppsFromOtherAppRules:]((uint64_t)self, v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (uint64_t)overlapsWithAppsFromOtherAppRules:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [(id)a1 perApp];
    v5 = [v4 appRules];
    if ([v5 count])
    {
      uint64_t v6 = [v3 count];

      if (v6)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v7 = [(id)a1 perApp];
        v8 = [v7 appRules];

        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
              long long v20 = 0u;
              long long v21 = 0u;
              long long v22 = 0u;
              long long v23 = 0u;
              id v14 = v3;
              uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v21;
                while (2)
                {
                  uint64_t v18 = 0;
                  do
                  {
                    if (*(void *)v21 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    if ([v13 overlapsWithRule:*(void *)(*((void *)&v20 + 1) + 8 * v18)])
                    {

                      a1 = 1;
                      goto LABEL_23;
                    }
                    ++v18;
                  }
                  while (v16 != v18);
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
              }

              ++v12;
            }
            while (v12 != v10);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
          }
          while (v10);
        }
      }
    }
    else
    {
    }
    a1 = 0;
  }
LABEL_23:

  return a1;
}

- (BOOL)overlapsWithVPNConfiguration:(id)a3
{
  id v4 = [(NERelayConfiguration *)self perApp];
  v5 = [v4 appRules];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [(NERelayConfiguration *)self matchDomains];
  uint64_t v8 = v6 | [v7 count];

  return v8 == 0;
}

- (BOOL)overlapsWithRelayConfiguration:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v83 = self;
  uint64_t v6 = [(NERelayConfiguration *)self perApp];
  uint64_t v7 = [v6 appRules];
  uint64_t v8 = [v7 count];

  uint64_t v9 = [v5 perApp];
  uint64_t v10 = [v9 appRules];
  BOOL v11 = [v10 count] == 0;

  if ((v8 != 0) == v11) {
    goto LABEL_58;
  }
  uint64_t v12 = [(NERelayConfiguration *)v83 matchDomains];
  uint64_t v80 = [v12 count];

  v13 = [v5 matchDomains];
  BOOL v14 = [v13 count] == 0;

  if ((v80 != 0) == v14) {
    goto LABEL_58;
  }
  id v81 = [v5 onDemandRules];
  if (!v83) {
    goto LABEL_57;
  }
  uint64_t v15 = [(NERelayConfiguration *)v83 onDemandRules];
  if (![v15 count] || !objc_msgSend(v81, "count"))
  {

    goto LABEL_60;
  }
  uint64_t v16 = [(NERelayConfiguration *)v83 onDemandRules];
  uint64_t v17 = [v16 count];
  uint64_t v18 = [v81 count];

  if (v17 != v18) {
    goto LABEL_60;
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obuint64_t j = [(NERelayConfiguration *)v83 onDemandRules];
  uint64_t v74 = [obj countByEnumeratingWithState:&v103 objects:v108 count:16];
  if (!v74) {
    goto LABEL_56;
  }
  uint64_t v75 = *(void *)v104;
  id v78 = v5;
  uint64_t v72 = v8;
  while (2)
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v104 != v75) {
        objc_enumerationMutation(obj);
      }
      long long v20 = *(void **)(*((void *)&v103 + 1) + 8 * v19);
      uint64_t v76 = v19;
      BOOL v21 = [v20 action] == 2 || objc_msgSend(v20, "action") == 4;
      BOOL v77 = v21;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v93 = v81;
      uint64_t v22 = [v93 countByEnumeratingWithState:&v99 objects:v107 count:16];
      if (!v22)
      {
LABEL_89:

LABEL_90:
        id v5 = v78;
        uint64_t v8 = v72;
LABEL_60:

        v48 = [v5 perApp];
        v49 = [v48 appRules];
        char v50 = -[NERelayConfiguration overlapsWithAppsFromOtherAppRules:]((uint64_t)v83, v49);

        id v51 = v5;
        v52 = [(NERelayConfiguration *)v83 matchDomains];
        if ([v52 count])
        {
          v53 = [v51 matchDomains];
          uint64_t v54 = [v53 count];

          if (!v54) {
            goto LABEL_79;
          }
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          v52 = [(NERelayConfiguration *)v83 matchDomains];
          uint64_t v55 = [v52 countByEnumeratingWithState:&v103 objects:v108 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v104;
            id v79 = v5;
            uint64_t v73 = v8;
            uint64_t v96 = *(void *)v104;
            do
            {
              for (uint64_t i = 0; i != v56; ++i)
              {
                if (*(void *)v104 != v57) {
                  objc_enumerationMutation(v52);
                }
                v59 = *(void **)(*((void *)&v103 + 1) + 8 * i);
                long long v99 = 0u;
                long long v100 = 0u;
                long long v101 = 0u;
                long long v102 = 0u;
                v60 = [v51 matchDomains];
                uint64_t v61 = [v60 countByEnumeratingWithState:&v99 objects:v107 count:16];
                if (v61)
                {
                  uint64_t v62 = v61;
                  uint64_t v63 = *(void *)v100;
                  uint64_t v98 = v56;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v62; ++j)
                    {
                      if (*(void *)v100 != v63) {
                        objc_enumerationMutation(v60);
                      }
                      v65 = *(void **)(*((void *)&v99 + 1) + 8 * j);
                      if (([v59 hasSuffix:v65] & 1) != 0
                        || [v65 hasSuffix:v59])
                      {

                        char v66 = 0;
                        id v5 = v79;
                        uint64_t v8 = v73;
                        goto LABEL_81;
                      }
                    }
                    uint64_t v62 = [v60 countByEnumeratingWithState:&v99 objects:v107 count:16];
                    uint64_t v57 = v96;
                    uint64_t v56 = v98;
                    if (v62) {
                      continue;
                    }
                    break;
                  }
                }

                id v5 = v79;
                uint64_t v8 = v73;
              }
              uint64_t v56 = [v52 countByEnumeratingWithState:&v103 objects:v108 count:16];
            }
            while (v56);
          }
        }

LABEL_79:
        char v66 = 1;
LABEL_81:

        if (v80) {
          char v67 = v66;
        }
        else {
          char v67 = 0;
        }
        char v68 = v67 | ~v50;
        if (v8) {
          char v69 = 1;
        }
        else {
          char v69 = v66;
        }
        char v47 = v68 & v69 ^ 1;
        goto LABEL_88;
      }
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v100;
      v89 = v20;
      uint64_t v90 = *(void *)v100;
LABEL_17:
      uint64_t v25 = 0;
      uint64_t v91 = v23;
      while (1)
      {
        if (*(void *)v100 != v24) {
          objc_enumerationMutation(v93);
        }
        long long v26 = *(void **)(*((void *)&v99 + 1) + 8 * v25);
        id v27 = v20;
        if (!v26) {
          goto LABEL_36;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_36;
        }
        v28 = [v26 DNSSearchDomainMatch];
        v29 = [v27 DNSSearchDomainMatch];
        if (v28 != v29)
        {
          uint64_t v30 = [v26 DNSSearchDomainMatch];
          v95 = [v27 DNSSearchDomainMatch];
          v97 = v30;
          if (![v30 isEqualToArray:v95]) {
            goto LABEL_34;
          }
        }
        v31 = [v26 DNSServerAddressMatch];
        v32 = [v27 DNSServerAddressMatch];
        if (v31 == v32
          || ([v26 DNSServerAddressMatch],
              uint64_t v33 = objc_claimAutoreleasedReturnValue(),
              [v27 DNSServerAddressMatch],
              uint64_t v34 = objc_claimAutoreleasedReturnValue(),
              v92 = (void *)v33,
              v35 = (void *)v33,
              id v3 = (void *)v34,
              [v35 isEqualToArray:v34]))
        {
          uint64_t v36 = [v26 interfaceTypeMatch];
          if (v36 == [v27 interfaceTypeMatch])
          {
            uint64_t v37 = [v26 SSIDMatch];
            v38 = [v27 SSIDMatch];
            v88 = (void *)v37;
            if ((void *)v37 == v38
              || ([v26 SSIDMatch],
                  v39 = objc_claimAutoreleasedReturnValue(),
                  [v27 SSIDMatch],
                  v84 = objc_claimAutoreleasedReturnValue(),
                  v85 = v39,
                  objc_msgSend(v39, "isEqualToArray:")))
            {
              v86 = v38;
              v87 = v3;
              v40 = [v26 probeURL];
              uint64_t v41 = [v27 probeURL];
              if (v40 == (void *)v41)
              {

                int v94 = 1;
              }
              else
              {
                v82 = (void *)v41;
                v42 = [v26 probeURL];
                v43 = [v27 probeURL];
                int v94 = [v42 isEqual:v43];
              }
              id v3 = v87;
              v45 = v88;
              v38 = v86;
              if (v88 == v86)
              {
LABEL_41:

                long long v20 = v89;
                if (v31 == v32) {
                  goto LABEL_43;
                }
                goto LABEL_42;
              }
            }
            else
            {
              int v94 = 0;
              v45 = v88;
            }

            goto LABEL_41;
          }
          long long v20 = v89;
          if (v31 == v32)
          {

            v44 = v28;
            uint64_t v24 = v90;
            uint64_t v23 = v91;
            if (v28 != v29)
            {
LABEL_34:

              v44 = v29;
            }

LABEL_36:
            goto LABEL_47;
          }
        }
        int v94 = 0;
LABEL_42:

LABEL_43:
        if (v28 == v29) {
          break;
        }

        uint64_t v24 = v90;
        uint64_t v23 = v91;
        if (v94) {
          goto LABEL_50;
        }
LABEL_47:
        if (v23 == ++v25)
        {
          uint64_t v23 = [v93 countByEnumeratingWithState:&v99 objects:v107 count:16];
          if (v23) {
            goto LABEL_17;
          }
          goto LABEL_89;
        }
      }

      uint64_t v24 = v90;
      uint64_t v23 = v91;
      if (!v94) {
        goto LABEL_47;
      }
LABEL_50:
      if ([v26 action] == 2)
      {

        if (v77) {
          goto LABEL_90;
        }
      }
      else
      {
        char v46 = v77 ^ ([v26 action] == 4);

        if ((v46 & 1) == 0) {
          goto LABEL_90;
        }
      }
      uint64_t v19 = v76 + 1;
      id v5 = v78;
    }
    while (v76 + 1 != v74);
    uint64_t v74 = [obj countByEnumeratingWithState:&v103 objects:v108 count:16];
    if (v74) {
      continue;
    }
    break;
  }
LABEL_56:

LABEL_57:
LABEL_58:
  char v47 = 0;
LABEL_88:

  return v47;
}

- (id)description
{
  return [(NERelayConfiguration *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NERelayConfiguration isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  uint64_t v8 = [(NERelayConfiguration *)self relays];
  [v7 appendPrettyObject:v8 withName:@"relays" andIndent:v5 options:a4];

  uint64_t v9 = [(NERelayConfiguration *)self matchDomains];
  [v7 appendPrettyObject:v9 withName:@"matchDomains" andIndent:v5 options:a4];

  uint64_t v10 = [(NERelayConfiguration *)self excludedDomains];
  [v7 appendPrettyObject:v10 withName:@"excludedDomains" andIndent:v5 options:a4];

  BOOL v11 = [(NERelayConfiguration *)self perApp];
  [v7 appendPrettyObject:v11 withName:@"perApp" andIndent:v5 options:a4];

  uint64_t v12 = [(NERelayConfiguration *)self onDemandRules];
  [v7 appendPrettyObject:v12 withName:@"onDemandRules" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NERelayConfiguration *)self relays];
  uint64_t v6 = [v5 count];
  int v7 = v6 != 0;

  if (!v6) {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing relays", v4);
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v8 = [(NERelayConfiguration *)self relays];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v96 objects:v106 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v97 != v11) {
          objc_enumerationMutation(v8);
        }
        v7 &= [*(id *)(*((void *)&v96 + 1) + 8 * i) checkValidityAndCollectErrors:v4];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v96 objects:v106 count:16];
    }
    while (v10);
  }

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v13 = [(NERelayConfiguration *)self matchDomains];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v92 objects:v105 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v93;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v93 != v16) {
          objc_enumerationMutation(v13);
        }
        if ((isa_nsstring(*(void **)(*((void *)&v92 + 1) + 8 * j)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid match domain", v4);
          int v7 = 0;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v92 objects:v105 count:16];
    }
    while (v15);
  }

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v18 = [(NERelayConfiguration *)self excludedDomains];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v88 objects:v104 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v89;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v89 != v21) {
          objc_enumerationMutation(v18);
        }
        if ((isa_nsstring(*(void **)(*((void *)&v88 + 1) + 8 * k)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid excluded domain", v4);
          int v7 = 0;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v88 objects:v104 count:16];
    }
    while (v20);
  }

  uint64_t v23 = [(NERelayConfiguration *)self perApp];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    uint64_t v25 = [(NERelayConfiguration *)self perApp];
    int v26 = [v25 checkValidityAndCollectErrors:v4];

    if ((v26 & v7) == 1) {
      goto LABEL_30;
    }
LABEL_68:
    int v56 = 0;
    goto LABEL_74;
  }
  if ((v7 & 1) == 0) {
    goto LABEL_68;
  }
LABEL_30:
  id v27 = [(NERelayConfiguration *)self perApp];
  if ([v27 restrictDomains])
  {
    v28 = [(NERelayConfiguration *)self matchDomains];
    uint64_t v29 = [v28 count];

    if (!v29)
    {
      int v56 = 1;
      goto LABEL_74;
    }
    char v69 = v4;
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v65 = self;
    uint64_t v30 = [(NERelayConfiguration *)self relays];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v84 objects:v103 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v85;
      do
      {
        for (uint64_t m = 0; m != v32; ++m)
        {
          if (*(void *)v85 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v84 + 1) + 8 * m);
          uint64_t v36 = [v35 HTTP3RelayURL];
          uint64_t v37 = [v36 host];
          v38 = NECopyETLDPlusOne(v37);

          if (v38) {
            [v27 addObject:v38];
          }
          v39 = [v35 HTTP2RelayURL];
          v40 = [v39 host];
          uint64_t v41 = NECopyETLDPlusOne(v40);

          if (v41) {
            [v27 addObject:v41];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v84 objects:v103 count:16];
      }
      while (v32);
    }

    if ([v27 count])
    {
      id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      obuint64_t j = [(NERelayConfiguration *)v65 matchDomains];
      id v4 = v69;
      uint64_t v71 = [obj countByEnumeratingWithState:&v80 objects:v102 count:16];
      if (v71)
      {
        uint64_t v42 = *(void *)v81;
        uint64_t v67 = *(void *)v81;
        id v68 = v27;
        do
        {
          for (uint64_t n = 0; n != v71; ++n)
          {
            if (*(void *)v81 != v42) {
              objc_enumerationMutation(obj);
            }
            v44 = *(void **)(*((void *)&v80 + 1) + 8 * n);
            v45 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"*."];
            char v46 = [v44 stringByTrimmingCharactersInSet:v45];

            if (([v27 containsObject:v46] & 1) == 0)
            {
              long long v78 = 0u;
              long long v79 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              id v47 = v27;
              uint64_t v48 = [v47 countByEnumeratingWithState:&v76 objects:v101 count:16];
              if (v48)
              {
                uint64_t v49 = v48;
                uint64_t v50 = *(void *)v77;
                while (2)
                {
                  for (iuint64_t i = 0; ii != v49; ++ii)
                  {
                    if (*(void *)v77 != v50) {
                      objc_enumerationMutation(v47);
                    }
                    v52 = *(void **)(*((void *)&v76 + 1) + 8 * ii);
                    v53 = [@"." stringByAppendingString:v52];
                    unint64_t v54 = [v46 length];
                    if (v54 > [v52 length] && (objc_msgSend(v46, "hasSuffix:", v53) & 1) == 0)
                    {

                      goto LABEL_61;
                    }
                  }
                  uint64_t v49 = [v47 countByEnumeratingWithState:&v76 objects:v101 count:16];
                  if (v49) {
                    continue;
                  }
                  break;
                }
              }

              [v66 addObject:v46];
LABEL_61:
              id v27 = v68;
              id v4 = v69;
              uint64_t v42 = v67;
            }
          }
          uint64_t v71 = [obj countByEnumeratingWithState:&v80 objects:v102 count:16];
        }
        while (v71);
      }

      uint64_t v55 = [v66 count];
      int v56 = v55 == 0;
      if (v55) {
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid match domains, do not match relay domains", v4);
      }
    }
    else
    {
      id v4 = v69;
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid relay domains", v69);
      int v56 = 0;
    }
    self = v65;
  }
  else
  {
    int v56 = 1;
  }

LABEL_74:
  uint64_t v57 = [(NERelayConfiguration *)self onDemandRules];

  if (v57)
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v58 = [(NERelayConfiguration *)self onDemandRules];
    uint64_t v59 = [v58 countByEnumeratingWithState:&v72 objects:v100 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v73;
      do
      {
        for (juint64_t j = 0; jj != v60; ++jj)
        {
          if (*(void *)v73 != v61) {
            objc_enumerationMutation(v58);
          }
          uint64_t v63 = *(void **)(*((void *)&v72 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v56 &= [v63 checkValidityAndCollectErrors:v4];
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid on demand rule object", v4);
            int v56 = 0;
          }
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v72 objects:v100 count:16];
      }
      while (v60);
    }
  }
  return v56;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NERelayConfiguration allocWithZone:a3] init];
  [(NERelayConfiguration *)v4 setEnabled:[(NERelayConfiguration *)self isEnabled]];
  uint64_t v5 = [(NERelayConfiguration *)self relays];
  [(NERelayConfiguration *)v4 setRelays:v5];

  uint64_t v6 = [(NERelayConfiguration *)self matchDomains];
  [(NERelayConfiguration *)v4 setMatchDomains:v6];

  int v7 = [(NERelayConfiguration *)self excludedDomains];
  [(NERelayConfiguration *)v4 setExcludedDomains:v7];

  uint64_t v8 = [(NERelayConfiguration *)self perApp];
  [(NERelayConfiguration *)v4 setPerApp:v8];

  uint64_t v9 = [(NERelayConfiguration *)self onDemandRules];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v11 = [(NERelayConfiguration *)self onDemandRules];
    uint64_t v12 = (void *)[v10 initWithArray:v11 copyItems:1];
    [(NERelayConfiguration *)v4 setOnDemandRules:v12];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NERelayConfiguration isEnabled](self, "isEnabled"), @"Enabled");
  uint64_t v5 = [(NERelayConfiguration *)self relays];
  [v4 encodeObject:v5 forKey:@"Relays"];

  uint64_t v6 = [(NERelayConfiguration *)self matchDomains];
  [v4 encodeObject:v6 forKey:@"MatchDomains"];

  int v7 = [(NERelayConfiguration *)self excludedDomains];
  [v4 encodeObject:v7 forKey:@"ExcludedDomains"];

  uint64_t v8 = [(NERelayConfiguration *)self perApp];
  [v4 encodeObject:v8 forKey:@"PerApp"];

  id v9 = [(NERelayConfiguration *)self onDemandRules];
  [v4 encodeObject:v9 forKey:@"OnDemandRules"];
}

- (NERelayConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NERelayConfiguration;
  uint64_t v5 = [(NERelayConfiguration *)&v29 init];
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Relays"];
    relays = v5->_relays;
    v5->_relays = (NSArray *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"MatchDomains"];
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v14;

    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"ExcludedDomains"];
    excludedDomains = v5->_excludedDomains;
    v5->_excludedDomains = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PerApp"];
    perApp = v5->_perApp;
    v5->_perApp = (NEPerApp *)v21;

    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"OnDemandRules"];
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v26;
  }
  return v5;
}

- (NERelayConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)NERelayConfiguration;
  v2 = [(NERelayConfiguration *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(NERelayConfiguration *)v2 setEnabled:0];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end