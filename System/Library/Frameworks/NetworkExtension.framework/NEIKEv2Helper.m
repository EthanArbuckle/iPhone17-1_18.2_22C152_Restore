@interface NEIKEv2Helper
+ (NEIKEv2ChildSAProposal)createIKEv2ChildSAProposalFromProtocol:(void *)a3 saParameters:;
+ (NEIKEv2IKESAProposal)createIKESAProposalFromProtocol:(void *)a3 saParameters:(void *)a4 options:(unsigned int *)a5 nonceSize:;
+ (id)createRouteArrayFromTunnelConfig:(void *)a3 localTS:(void *)a4 remoteTS:(void *)a5 gatewayAddress:(int)a6 isIPv4:;
+ (uint64_t)getIdentifierType:(uint64_t)a1;
@end

@implementation NEIKEv2Helper

+ (uint64_t)getIdentifierType:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 rangeOfString:@".+@.+\\..+" options:1024] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v2 rangeOfString:@"^[1-2]?[0-9]{1,2}\\.[1-2]?[0-9]{1,2}\\.[1-2]?[0-9]{1,2}\\.[1-2]?[0-9]{1,2}$" options:1024] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v2 rangeOfString:@"^(:|(([0-9A-Fa-f]{1,4}):)){1,7}[0-9A-Fa-f]{1,4}$" options:1024] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v3 = 2;
      }
      else {
        uint64_t v3 = 5;
      }
    }
    else
    {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 3;
  }

  return v3;
}

+ (id)createRouteArrayFromTunnelConfig:(void *)a3 localTS:(void *)a4 remoteTS:(void *)a5 gatewayAddress:(int)a6 isIPv4:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v55 = a3;
  id v60 = a4;
  id v63 = a5;
  self;
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (!v10)
  {
    int v12 = 0;
    goto LABEL_16;
  }
  uint64_t v11 = v10;
  int v12 = 0;
  uint64_t v13 = *(void *)v71;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v71 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      if (a6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        v16 = [NEIPv4Route alloc];
        v17 = [v15 address];
        v18 = [v17 hostname];
        v19 = [v15 subnetMaskAddress];
        v20 = [v19 hostname];
        v21 = [(NEIPv4Route *)v16 initWithDestinationAddress:v18 subnetMask:v20];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        v22 = [NEIPv6Route alloc];
        v17 = objc_msgSend(v15, "address", v55);
        v18 = [v17 hostname];
        v19 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v15, "prefix"));
        v21 = [(NEIPv6Route *)v22 initWithDestinationAddress:v18 networkPrefixLength:v19];
      }

      [(NEIPv4Route *)v21 setGatewayAddress:v63];
      [v62 addObject:v21];
      ++v12;
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  }
  while (v11);
LABEL_16:

  if (a6) {
    uint64_t v23 = 7;
  }
  else {
    uint64_t v23 = 8;
  }
  v24 = @"::";
  if (a6)
  {
    v24 = @"0.0.0.0";
    v25 = @"255.255.255.255";
  }
  else
  {
    v25 = @"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff";
  }
  v57 = v24;
  v56 = v25;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v26 = v60;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    v59 = 0;
    v61 = 0;
    uint64_t v29 = *(void *)v67;
    uint64_t v58 = *(void *)v67;
LABEL_24:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v67 != v29) {
        objc_enumerationMutation(v26);
      }
      v31 = *(void **)(*((void *)&v66 + 1) + 8 * v30);
      if (-[NEIKEv2TrafficSelector type]((uint64_t)v31) != v23) {
        goto LABEL_48;
      }
      v32 = [v31 startAddress];
      uint64_t v33 = [v32 hostname];
      if (v33)
      {
        v34 = (void *)v33;
        id v35 = v26;
        v36 = [v31 endAddress];
        v37 = [v36 hostname];

        if (v37)
        {
          v38 = [v31 startAddress];
          v39 = [v38 hostname];

          v40 = [v31 endAddress];
          v41 = [v40 hostname];

          id v26 = v35;
          if (v39
            && v41
            && ([(__CFString *)v39 isEqualToString:v57]
             && [(__CFString *)v41 isEqualToString:v56]
             || -[__CFString isEqualToString:](v39, "isEqualToString:", v57, v55)
             && [(__CFString *)v41 isEqualToString:v57]))
          {
            if (!v12)
            {
              v52 = off_1E598D638;
              if (!a6) {
                v52 = off_1E598D648;
              }
              v53 = [(__objc2_class *)*v52 defaultRoute];
              [v62 addObject:v53];

              v49 = v62;
              id v51 = v62;

              goto LABEL_59;
            }
          }
          else
          {
            uint64_t v42 = NEGetPrefixForAddressRangeStrings(v39, v41);
            if (v42)
            {
              uint64_t v43 = v42;
              if (!a6)
              {
                v47 = [NEIPv6Route alloc];
                v48 = [NSNumber numberWithInt:v43];
                v45 = [(NEIPv6Route *)v47 initWithDestinationAddress:v39 networkPrefixLength:v48];

                id v26 = v35;
                [(NEIPv6Route *)v45 setGatewayAddress:v63];
                [v62 addObject:v45];
                goto LABEL_47;
              }
              CFStringRef v44 = NECreateIPv4AddressMaskStringFromPrefix(v42);
              if (v44)
              {
                v45 = (NEIPv6Route *)v44;
                v46 = [[NEIPv4Route alloc] initWithDestinationAddress:v39 subnetMask:v44];
                [(NEIPv4Route *)v46 setGatewayAddress:v63];
                [v62 addObject:v46];

LABEL_47:
                uint64_t v29 = v58;

                ++v12;
                v59 = v39;
                v61 = v41;
                goto LABEL_48;
              }
            }
          }
          v59 = v39;
          v61 = v41;
        }
        else
        {
          id v26 = v35;
        }
        uint64_t v29 = v58;
      }
      else
      {
      }
LABEL_48:
      if (v28 == ++v30)
      {
        uint64_t v28 = [v26 countByEnumeratingWithState:&v66 objects:v74 count:16];
        if (v28) {
          goto LABEL_24;
        }
        goto LABEL_52;
      }
    }
  }
  v59 = 0;
  v61 = 0;
LABEL_52:

  v49 = v62;
  if (v12) {
    v50 = v62;
  }
  else {
    v50 = 0;
  }
  id v51 = v50;
  v39 = v59;
  v41 = v61;
LABEL_59:

  return v51;
}

+ (NEIKEv2IKESAProposal)createIKESAProposalFromProtocol:(void *)a3 saParameters:(void *)a4 options:(unsigned int *)a5 nonceSize:
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  self;
  if (v9)
  {
    uint64_t v11 = objc_alloc_init(NEIKEv2IKESAProposal);
    -[NEIKEv2IKESAProposal setLifetimeSeconds:](v11, "setLifetimeSeconds:", (int)(60 * [v9 lifetimeMinutes]));
    switch([v9 encryptionAlgorithm])
    {
      case 1:
        int v12 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v13 = 2;
        goto LABEL_6;
      case 2:
        int v12 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v13 = 3;
LABEL_6:
        v16 = (NEIKEv2EncryptionProtocol *)-[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:](v12, v13, 0);
        goto LABEL_9;
      case 3:
        v14 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v15 = 2;
        goto LABEL_8;
      case 5:
        v18 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v19 = 4;
        goto LABEL_13;
      case 6:
        v18 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v19 = 5;
        goto LABEL_13;
      case 7:
        v18 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v19 = 6;
LABEL_13:
        v16 = [(NEIKEv2EncryptionProtocol *)v18 initWithEncryptionType:v19];
        int v17 = 0;
        break;
      default:
        v14 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v15 = 3;
LABEL_8:
        v16 = [(NEIKEv2EncryptionProtocol *)v14 initWithEncryptionType:v15];
LABEL_9:
        int v17 = 1;
        break;
    }
    id v62 = v16;
    long long v72 = v16;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    [(NEIKEv2IKESAProposal *)v11 setEncryptionProtocols:v20];

    switch([v9 integrityAlgorithm])
    {
      case 1:
        uint64_t v21 = 2;
        if ((v17 & 1) == 0) {
          goto LABEL_26;
        }
        uint64_t v22 = 2;
        goto LABEL_25;
      case 2:
        uint64_t v21 = 2;
        if ((v17 & 1) == 0) {
          goto LABEL_26;
        }
        uint64_t v22 = 7;
        goto LABEL_25;
      case 4:
        uint64_t v21 = 6;
        if ((v17 & 1) == 0) {
          goto LABEL_26;
        }
        uint64_t v22 = 13;
        goto LABEL_25;
      case 5:
        uint64_t v21 = 7;
        if ((v17 & 1) == 0) {
          goto LABEL_26;
        }
        uint64_t v22 = 14;
        goto LABEL_25;
      default:
        uint64_t v21 = 5;
        if (v17)
        {
          uint64_t v22 = 12;
LABEL_25:
          uint64_t v23 = [[NEIKEv2IntegrityProtocol alloc] initWithType:v22];
        }
        else
        {
LABEL_26:
          uint64_t v23 = 0;
        }
        v24 = [[NEIKEv2PRFProtocol alloc] initWithType:v21];
        long long v71 = v24;
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
        [(NEIKEv2IKESAProposal *)v11 setPrfProtocols:v25];

        id v60 = v24;
        unsigned int v26 = [(NEIKEv2PRFProtocol *)v24 nonceSize];
        if (v17)
        {
          long long v70 = v23;
          uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
          [(NEIKEv2IKESAProposal *)v11 setIntegrityProtocols:v27];
        }
        v61 = v23;
        if (a5 && v26 > *a5) {
          *a5 = v26;
        }
        uint64_t v28 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", [v9 diffieHellmanGroup]);
        long long v69 = v28;
        uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
        [(NEIKEv2IKESAProposal *)v11 setKemProtocols:v29];

        v31 = objc_getProperty(v9, v30, 40, 1);

        if (v31)
        {
          v56 = v28;
          v57 = v11;
          id v59 = v8;
          id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v58 = v9;
          v34 = objc_getProperty(v9, v33, 40, 1);
          uint64_t v35 = [v34 countByEnumeratingWithState:&v63 objects:v68 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v64;
            uint64_t v38 = 6;
            do
            {
              for (uint64_t i = 0; i != v36; ++i)
              {
                if (*(void *)v64 != v37) {
                  objc_enumerationMutation(v34);
                }
                v40 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                if (objc_msgSend(v40, "integerValue", v56))
                {
                  v41 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", [v40 integerValue]);
                  long long v67 = v41;
                  uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
                  uint64_t v43 = [NSNumber numberWithUnsignedInteger:v38 + i];
                  [v32 setObject:v42 forKeyedSubscript:v43];
                }
              }
              v38 += i;
              uint64_t v36 = [v34 countByEnumeratingWithState:&v63 objects:v68 count:16];
            }
            while (v36);
          }

          uint64_t v11 = v57;
          if ([v32 count])
          {
            CFStringRef v44 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v32];
            [(NEIKEv2IKESAProposal *)v57 setAdditionalKEMProtocols:v44];
          }
          id v9 = v58;
          id v8 = v59;
          uint64_t v28 = v56;
        }
        id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (![v8 useExtendedAuthentication])
        {
          v47 = [[NEIKEv2EAPProtocol alloc] initWithMethod:0];
          [v45 addObject:v47];
LABEL_57:

          [(NEIKEv2IKESAProposal *)v11 setEapProtocols:v45];
          v53 = v11;
          goto LABEL_58;
        }
        v46 = [v10 objectForKeyedSubscript:@"AccountName"];
        if (v46) {
          [v10 objectForKeyedSubscript:@"AccountName"];
        }
        else {
        v47 = [v8 username];
        }

        if (v47)
        {
          v48 = [v8 identityReferenceInternal];

          if (v48)
          {
            v49 = [[NEIKEv2EAPProtocol alloc] initWithMethod:7];
            [v45 addObject:v49];
          }
          v50 = [[NEIKEv2EAPProtocol alloc] initWithMethod:4];
          [v45 addObject:v50];
        }
        id v51 = objc_msgSend(v8, "identityReferenceInternal", v56);

        if (v51)
        {
          v52 = [[NEIKEv2EAPProtocol alloc] initWithMethod:6];
          [v45 addObject:v52];
        }
        if ([v45 count]) {
          goto LABEL_57;
        }
        id v55 = ne_log_obj();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v55, OS_LOG_TYPE_ERROR, "missing eap protocol", buf, 2u);
        }

        v53 = 0;
LABEL_58:

        break;
    }
  }
  else
  {
    ne_log_obj();
    uint64_t v11 = (NEIKEv2IKESAProposal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v74 = "+[NEIKEv2Helper createIKESAProposalFromProtocol:saParameters:options:nonceSize:]";
      _os_log_fault_impl(&dword_19DDAF000, &v11->super, OS_LOG_TYPE_FAULT, "%s called with null saParameters", buf, 0xCu);
    }
    v53 = 0;
  }

  return v53;
}

+ (NEIKEv2ChildSAProposal)createIKEv2ChildSAProposalFromProtocol:(void *)a3 saParameters:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  if (v5)
  {
    v6 = objc_alloc_init(NEIKEv2ChildSAProposal);
    [(NEIKEv2ChildSAProposal *)v6 setProtocol:3];
    -[NEIKEv2ChildSAProposal setLifetimeSeconds:](v6, "setLifetimeSeconds:", (int)(60 * [v5 lifetimeMinutes]));
    switch([v5 encryptionAlgorithm])
    {
      case 1:
        v7 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v8 = 2;
        goto LABEL_5;
      case 2:
        v7 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v8 = 3;
LABEL_5:
        id v9 = (NEIKEv2EncryptionProtocol *)-[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:](v7, v8, 0);
        goto LABEL_9;
      case 3:
        id v10 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v11 = 2;
        goto LABEL_8;
      case 5:
        v14 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v15 = 4;
        goto LABEL_13;
      case 6:
        v14 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v15 = 5;
        goto LABEL_13;
      case 7:
        v14 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v15 = 6;
LABEL_13:
        p_super = [(NEIKEv2EncryptionProtocol *)v14 initWithEncryptionType:v15];
        int v13 = 0;
        break;
      default:
        id v10 = [NEIKEv2EncryptionProtocol alloc];
        uint64_t v11 = 3;
LABEL_8:
        id v9 = [(NEIKEv2EncryptionProtocol *)v10 initWithEncryptionType:v11];
LABEL_9:
        p_super = &v9->super;
        int v13 = 1;
        break;
    }
    id v51 = p_super;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    [(NEIKEv2ChildSAProposal *)v6 setEncryptionProtocols:v16];

    if (v13)
    {
      uint64_t v17 = [v5 integrityAlgorithm];
      if ((unint64_t)(v17 - 1) > 4) {
        uint64_t v18 = 12;
      }
      else {
        uint64_t v18 = qword_19DF9D1C8[v17 - 1];
      }
      uint64_t v19 = [[NEIKEv2IntegrityProtocol alloc] initWithType:v18];
      v50 = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      [(NEIKEv2ChildSAProposal *)v6 setIntegrityProtocols:v20];
    }
    if ([v4 enablePFS])
    {
      uint64_t v21 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", [v5 diffieHellmanGroup]);
      v49 = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
      [(NEIKEv2ChildSAProposal *)v6 setKemProtocols:v22];

      v24 = objc_getProperty(v5, v23, 40, 1);

      if (v24)
      {
        v39 = v21;
        v40 = p_super;
        v41 = v6;
        id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v42 = v5;
        uint64_t v27 = objc_getProperty(v5, v26, 40, 1);
        uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v44;
          uint64_t v31 = 6;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v44 != v30) {
                objc_enumerationMutation(v27);
              }
              SEL v33 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              if ([v33 unsignedIntegerValue])
              {
                v34 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", [v33 unsignedIntegerValue]);
                v47 = v34;
                uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
                uint64_t v36 = [NSNumber numberWithUnsignedInteger:v31 + i];
                [v25 setObject:v35 forKeyedSubscript:v36];
              }
            }
            v31 += i;
            uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v29);
        }

        v6 = v41;
        if ([v25 count])
        {
          uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v25];
          [(NEIKEv2ChildSAProposal *)v41 setAdditionalKEMProtocols:v37];
        }
        id v5 = v42;
        uint64_t v21 = v39;
        p_super = v40;
      }
    }
  }
  else
  {
    p_super = ne_log_obj();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "+[NEIKEv2Helper createIKEv2ChildSAProposalFromProtocol:saParameters:]";
      _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, "%s called with null saParameters", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

@end