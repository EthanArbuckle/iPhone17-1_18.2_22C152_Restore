uint64_t DeviceIdentityIsSupported()
{
  uint64_t vars8;

  if (!is_virtual_machine()) {
    return 1;
  }
  return libavp_guest_has_host_key(0);
}

BOOL is_virtual_machine()
{
  int v3 = 0;
  size_t v2 = 4;
  return !sysctlbyname("kern.hv_vmm_present", &v3, &v2, 0, 0) && v3 == 1;
}

uint64_t copy_unsupported_virtual_machine_oids()
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"1.2.840.113635.100.10.1", 0);
}

uint64_t copy_supported_eda_oids()
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"1.2.840.113635.100.8.9.1", @"1.2.840.113635.100.8.9.2", @"1.2.840.113635.100.8.10.1", @"1.2.840.113635.100.8.10.2", @"1.2.840.113635.100.8.10.3", @"1.2.840.113635.100.8.11.1", @"1.2.840.113635.100.8.13.1", @"1.2.840.113635.100.8.13.2", @"1.2.840.113635.100.8.13.3", @"1.2.840.113635.100.8.13.4", @"1.2.840.113635.100.8.9.3", @"1.2.840.113635.100.8.9.4", 0);
}

id copy_supported_baa_oids()
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"1.2.840.113635.100.10.1", @"1.2.840.113635.100.10.2", @"1.2.840.113635.100.8.1", @"1.2.840.113635.100.8.2", @"1.2.840.113635.100.8.3", @"1.2.840.113635.100.8.4", @"1.2.840.113635.100.8.5", @"1.2.840.113635.100.8.6", @"1.2.840.113635.100.8.7", @"1.2.840.113635.100.8.12", @"1.2.840.113635.100.6.71.1", @"1.2.840.113635.100.6.71.2", @"1.2.840.113635.100.6.71.3", @"1.2.840.113635.100.8.9.4", @"1.2.840.113635.100.8.10.4", 0);
  if (is_virtual_machine())
  {
    v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"1.2.840.113635.100.10.1", 0);
    [v0 minusSet:v1];
  }
  return v0;
}

CFTypeRef createReferenceKeyBlob(const void *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = (id)*MEMORY[0x1E4F3B740];
  CFErrorRef error = 0;
  if (v7
    && ([v7 objectForKeyedSubscript:@"KeySizeInBits"],
        v9 = objc_claimAutoreleasedReturnValue(),
        isNSNumber(v9),
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v11 = [v7 objectForKeyedSubscript:@"KeySizeInBits"];
    if (([v11 isEqualToNumber:&unk_1F38E5130] & 1) == 0
      && ([v11 isEqualToNumber:&unk_1F38E5148] & 1) == 0)
    {
      v14 = createMobileActivationError((uint64_t)"createReferenceKeyBlob", 73, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): unsupported size (%@)", v12, v13, @"KeySizeInBits");
      v15 = 0;
LABEL_19:
      v27 = 0;
      CFTypeRef v28 = 0;
      SecKeyRef v29 = 0;
      v21 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v11 = &unk_1F38E5130;
  }
  v16 = +[GestaltHlprDeviceIdentity getSharedInstance];
  v15 = (void *)[v16 copyAnswer:@"HasPKA"];

  v17 = isNSNumber(v15);

  if (!v17)
  {
    v14 = createMobileActivationError((uint64_t)"createReferenceKeyBlob", 84, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve PKA state.", v18, v19, v40);
    goto LABEL_19;
  }
  if ([v15 BOOLValue] && (a2 & 1) == 0)
  {
    id v20 = (id)*MEMORY[0x1E4F3B748];

    id v8 = v20;
  }
  if (a1)
  {
    v21 = CFRetain(a1);
    if (v21) {
      goto LABEL_22;
    }
  }
  if ((isRunningInRecovery() & 1) == 0 && !isRunningInDiagnosticsMode())
  {
    v21 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E4F3B578], 0x40000000uLL, &error);
    if (v21) {
      goto LABEL_22;
    }
    CFErrorRef v30 = error;
    uint64_t v40 = *MEMORY[0x1E4F3B598];
    v31 = @"Failed to create access control (%@).";
    uint64_t v32 = 115;
LABEL_28:
    createMobileActivationError((uint64_t)"createReferenceKeyBlob", v32, @"com.apple.MobileActivation.ErrorDomain", -1, v30, v31, v22, v23, v40);
    goto LABEL_29;
  }
  v21 = (const void *)SecAccessControlCreate();
  if (!v21)
  {
    CFErrorRef v30 = error;
    v31 = @"Failed to create access control.";
    uint64_t v32 = 104;
    goto LABEL_28;
  }
  uint64_t v24 = *MEMORY[0x1E4F3B5A0];
  if ((SecAccessControlSetProtection() & 1) == 0)
  {
    createMobileActivationError((uint64_t)"createReferenceKeyBlob", 109, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to set ACL protection to %@.", v25, v26, v24);
    v14 = LABEL_29:;
    v27 = 0;
    goto LABEL_30;
  }
LABEL_22:
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v27 = v33;
  if (!v33)
  {
    v14 = createMobileActivationError((uint64_t)"createReferenceKeyBlob", 123, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to alloc dictionary.", v34, v35, v40);
LABEL_30:
    CFTypeRef v28 = 0;
    SecKeyRef v29 = 0;
    goto LABEL_31;
  }
  [v33 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F3B6B0]];
  [v27 setObject:*MEMORY[0x1E4F3B898] forKeyedSubscript:*MEMORY[0x1E4F3B890]];
  [v27 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3B718]];
  [v27 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F3B548]];
  [v27 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3B708]];
  SecKeyRef v36 = SecKeyCreateRandomKey((CFDictionaryRef)v27, &error);
  SecKeyRef v29 = v36;
  if (v36)
  {
    CFTypeRef v28 = CFRetain(v36);
    v14 = 0;
  }
  else
  {
    v14 = createMobileActivationError((uint64_t)"createReferenceKeyBlob", 141, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to create ref key.", v37, v38, v40);
    CFTypeRef v28 = 0;
  }
LABEL_31:
  if (a4 && !v28) {
    *a4 = v14;
  }
  if (v29) {
    CFRelease(v29);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (error) {
    CFRelease(error);
  }

  return v28;
}

__SecKey *create_baa_info(const __CFData *a1, void *a2, void *a3)
{
  v329[3] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  CFErrorRef error = 0;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v329[0] = @"1.2.840.113635.100.8.4";
  v329[1] = @"1.2.840.113635.100.8.5";
  v329[2] = @"1.2.840.113635.100.8.7";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v329 count:3];
  id v7 = (void *)[v5 initWithArray:v6];

  v295 = [NSNumber numberWithUnsignedInt:0];
  v307 = v4;
  if (!v4)
  {
    CFDataRef v23 = 0;
    v292 = 0;
    v293 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    v290 = 0;
    v291 = 0;
    uint64_t v26 = 0;
    v283 = 0;
    v288 = 0;
    v289 = 0;
    int v27 = 0;
    int v28 = 0;
    int v280 = 0;
    int v305 = 0;
    char v29 = 1;
    v286 = &unk_1F38E5178;
    v301 = 0;
    v302 = &unk_1F38E5178;
    v287 = &unk_1F38E5160;
    goto LABEL_24;
  }
  id v8 = [v4 objectForKeyedSubscript:@"OIDSToInclude"];
  v9 = isNSArray(v8);

  SecKeyRef key = a1;
  if (v9)
  {
    v303 = v7;
    long long v323 = 0u;
    long long v324 = 0u;
    long long v321 = 0u;
    long long v322 = 0u;
    v10 = [v4 objectForKeyedSubscript:@"OIDSToInclude"];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v321 objects:v328 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v322;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v322 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = isNSString(*(void **)(*((void *)&v321 + 1) + 8 * i));

          if (!v15)
          {
            v256 = [v307 objectForKeyedSubscript:@"OIDSToInclude"];
            createMobileActivationError((uint64_t)"create_baa_info", 244, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid options (%@): %@", v37, v38, @"OIDSToInclude");
            id v306 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_29;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v321 objects:v328 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v17 = [v307 objectForKeyedSubscript:@"OIDSToInclude"];
    id v7 = (void *)[v16 initWithArray:v17];

    if (is_virtual_machine())
    {
      uint64_t v18 = copy_unsupported_virtual_machine_oids();
      uint64_t v19 = [v18 allObjects];
      [v7 removeObjectsInArray:v19];
    }
  }
  if (([v7 containsObject:@"1.2.840.113635.100.8.1"] & 1) != 0
    || ([v7 containsObject:@"1.2.840.113635.100.8.7"] & 1) != 0
    || ([v7 containsObject:@"1.2.840.113635.100.8.10.1"] & 1) != 0
    || ([v7 containsObject:@"1.2.840.113635.100.8.10.2"] & 1) != 0
    || [v7 containsObject:@"1.2.840.113635.100.8.10.3"])
  {
    int v280 = [v7 containsObject:@"1.2.840.113635.100.8.1"];
    int v305 = 1;
  }
  else
  {
    int v280 = 0;
    int v305 = 0;
  }
  int v20 = [v7 containsObject:@"1.2.840.113635.100.8.7"];
  v303 = v7;
  if (([v7 containsObject:@"1.2.840.113635.100.8.2"] & 1) != 0
    || [v7 containsObject:@"1.2.840.113635.100.8.11.1"])
  {
    v21 = [v307 objectForKeyedSubscript:@"nonce"];
    uint64_t v22 = isNSData(v21);
    if (v22)
    {
    }
    else
    {
      int v64 = v20;
      v65 = [v307 objectForKeyedSubscript:@"AppSpecificData"];
      v15 = isNSData(v65);

      if (!v15)
      {
        createMobileActivationError((uint64_t)"create_baa_info", 281, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Missing one of the required options: %@ / %@", v66, v67, @"nonce");
        id v306 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
        v281 = 0;
        v282 = 0;
        SecKeyRef v36 = 0;
        v288 = 0;
        v289 = 0;
        CFDataRef v300 = 0;
        v301 = 0;
        v291 = 0;
        v292 = 0;
        v283 = 0;
        CFDataRef v284 = 0;
        v278 = 0;
        v279 = 0;
        v290 = 0;
        v296 = 0;
        v297 = 0;
        v285 = 0;
        v39 = 0;
        uint64_t v40 = 0;
        v41 = 0;
        v42 = 0;
        uint64_t v26 = 0;
        a1 = 0;
        CFDataRef v43 = 0;
        v293 = 0;
        v294 = 0;
        CFDataRef v298 = 0;
        CFDataRef v271 = 0;
        SecKeyRef keya = 0;
        v44 = 0;
        goto LABEL_116;
      }
      int v20 = v64;
    }
    uint64_t v68 = [v307 objectForKeyedSubscript:@"nonce"];
    v69 = [v307 objectForKeyedSubscript:@"AppSpecificData"];
    v70 = v69;
    v297 = (void *)v68;
    if (v69)
    {
      isNSData(v69);
      CFDataRef v43 = (const __CFData *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
        v296 = v70;
        createMobileActivationError((uint64_t)"create_baa_info", 290, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@).", v71, v72, @"AppSpecificData");
        id v306 = (id)objc_claimAutoreleasedReturnValue();
        v281 = 0;
        v282 = 0;
        SecKeyRef v36 = 0;
        v288 = 0;
        v289 = 0;
        CFDataRef v300 = 0;
        v291 = 0;
        v292 = 0;
        v283 = 0;
        CFDataRef v284 = 0;
        v279 = 0;
        v290 = 0;
        v285 = 0;
        v39 = 0;
        uint64_t v40 = 0;
        v41 = 0;
        v42 = 0;
        uint64_t v26 = 0;
        a1 = 0;
LABEL_115:
        v293 = 0;
        v294 = 0;
        v301 = 0;
        CFDataRef v298 = 0;
        CFDataRef v271 = 0;
        SecKeyRef keya = 0;
        v278 = 0;
        v44 = 0;
        v15 = 0;
LABEL_116:
        v277 = 0;
        v302 = &unk_1F38E5178;
        v286 = &unk_1F38E5178;
        v287 = &unk_1F38E5160;
        goto LABEL_117;
      }
      if ((unint64_t)[v70 length] >= 0x41)
      {
        v296 = v70;
        [v70 length];
        createMobileActivationError((uint64_t)"create_baa_info", 295, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): unexpected size (%lu)", v73, v74, @"AppSpecificData");
LABEL_109:
        id v306 = (id)objc_claimAutoreleasedReturnValue();
LABEL_110:
        v281 = 0;
        v282 = 0;
        SecKeyRef v36 = 0;
        v288 = 0;
        v289 = 0;
        CFDataRef v300 = 0;
        v291 = 0;
        v292 = 0;
        goto LABEL_111;
      }
    }
  }
  else
  {
    v297 = 0;
    v70 = 0;
  }
  v79 = [v307 objectForKeyedSubscript:@"CertType"];
  v80 = isNSNumber(v79);

  v296 = v70;
  if (v80)
  {
    v81 = [v307 objectForKeyedSubscript:@"CertType"];

    v82 = [NSNumber numberWithUnsignedInt:0];
    if ([v81 isEqualToNumber:v82])
    {
LABEL_60:

      goto LABEL_62;
    }
    v83 = [NSNumber numberWithUnsignedInt:1];
    if ([v81 isEqualToNumber:v83])
    {

      goto LABEL_60;
    }
    int v272 = v20;
    v96 = [NSNumber numberWithUnsignedInt:2];
    char v97 = [v81 isEqualToNumber:v96];

    if ((v97 & 1) == 0)
    {
      v295 = v81;
      createMobileActivationError((uint64_t)"create_baa_info", 305, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): %@", v98, v99, @"CertType");
      goto LABEL_109;
    }
    int v20 = v272;
  }
  else
  {
    v81 = v295;
  }
LABEL_62:
  v84 = [NSNumber numberWithUnsignedInt:1];
  int v85 = [v81 isEqualToNumber:v84];

  v295 = v81;
  if (v85)
  {
    if ((device_supports_mfi_certificates() & 1) == 0)
    {
      createMobileActivationError((uint64_t)"create_baa_info", 312, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Certificate type not supported on this platform: %@", v86, v87, (uint64_t)v81);
      goto LABEL_109;
    }
    if (([v7 containsObject:@"1.2.840.113635.100.6.71.1"] & 1) == 0)
    {
      createMobileActivationError((uint64_t)"create_baa_info", 317, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Missing required OID for certificate type (%@): %@", v88, v89, (uint64_t)v81);
      goto LABEL_109;
    }
  }
  else if (([v7 containsObject:@"1.2.840.113635.100.6.71.1"] & 1) != 0 {
         || ([v7 containsObject:@"1.2.840.113635.100.6.71.2"] & 1) != 0
  }
         || [v7 containsObject:@"1.2.840.113635.100.6.71.3"])
  {
    createMobileActivationError((uint64_t)"create_baa_info", 324, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid OID(s) for requested certificate type: %@", v90, v91, (uint64_t)v81);
    goto LABEL_109;
  }
  if ([v7 containsObject:@"1.2.840.113635.100.6.71.1"]
    && ([v307 objectForKeyedSubscript:@"MFiProperties"],
        v92 = objc_claimAutoreleasedReturnValue(),
        isNSData(v92),
        v93 = objc_claimAutoreleasedReturnValue(),
        v93,
        v92,
        v93))
  {
    v94 = [v307 objectForKeyedSubscript:@"MFiProperties"];
    uint64_t v95 = [v94 length];

    if (v95 != 32)
    {
      v177 = [v307 objectForKeyedSubscript:@"MFiProperties"];
      [v177 length];
      createMobileActivationError((uint64_t)"create_baa_info", 332, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): unexpected size (%lu)", v178, v179, @"MFiProperties");
      id v306 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_110;
    }
    v292 = [v307 objectForKeyedSubscript:@"MFiProperties"];
  }
  else
  {
    v292 = 0;
  }
  if ([v7 containsObject:@"1.2.840.113635.100.6.71.2"])
  {
    v146 = [v307 objectForKeyedSubscript:@"MFiPPUID"];
    uint64_t v40 = isNSString(v146);

    if (!v40)
    {
      createMobileActivationError((uint64_t)"create_baa_info", 342, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Missing required option: %@", v147, v148, @"MFiPPUID");
      id v306 = (id)objc_claimAutoreleasedReturnValue();
      v281 = 0;
      v282 = 0;
      SecKeyRef v36 = 0;
      v288 = 0;
      v289 = 0;
      CFDataRef v300 = 0;
      v291 = 0;
      v283 = 0;
      v279 = 0;
LABEL_159:
      v290 = 0;
      v285 = 0;
      v39 = 0;
      goto LABEL_113;
    }
    v149 = [v307 objectForKeyedSubscript:@"MFiPPUID"];
    unint64_t v150 = [v149 length];

    if (v150 >= 0x25)
    {
      v151 = [v307 objectForKeyedSubscript:@"MFiPPUID"];
      [v151 length];
      createMobileActivationError((uint64_t)"create_baa_info", 347, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): unexpected size (%lu)", v152, v153, @"MFiPPUID");
      id v306 = (id)objc_claimAutoreleasedReturnValue();

      v281 = 0;
      v282 = 0;
      SecKeyRef v36 = 0;
      v288 = 0;
      v289 = 0;
      CFDataRef v300 = 0;
      v291 = 0;
LABEL_111:
      v283 = 0;
      v279 = 0;
LABEL_112:
      v290 = 0;
      v285 = 0;
      v39 = 0;
      uint64_t v40 = 0;
LABEL_113:
      v41 = 0;
      v42 = 0;
      uint64_t v26 = 0;
LABEL_114:
      CFDataRef v284 = 0;
      a1 = 0;
      CFDataRef v43 = 0;
      goto LABEL_115;
    }
    v181 = [v307 objectForKeyedSubscript:@"MFiPPUID"];
    uint64_t v26 = [v181 stringByPaddingToLength:36 withString:&stru_1F38E07E0 startingAtIndex:0];

    if (!v26)
    {
      createMobileActivationError((uint64_t)"create_baa_info", 356, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Failed to pad string.", v182, v183, v255);
      id v306 = (id)objc_claimAutoreleasedReturnValue();
      v281 = 0;
      v282 = 0;
      SecKeyRef v36 = 0;
      v288 = 0;
      v289 = 0;
      CFDataRef v300 = 0;
      v290 = 0;
      v291 = 0;
      v283 = 0;
      v279 = 0;
      v285 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      v41 = 0;
      v42 = 0;
      goto LABEL_114;
    }
    uint64_t v165 = [v26 dataUsingEncoding:4];
    if (!v165)
    {
      v279 = v26;
      createMobileActivationError((uint64_t)"create_baa_info", 362, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Failed to convert string to data.", v184, v185, v255);
      id v306 = (id)objc_claimAutoreleasedReturnValue();
      v281 = 0;
      v282 = 0;
      SecKeyRef v36 = 0;
      v288 = 0;
      v289 = 0;
      CFDataRef v300 = 0;
      v291 = 0;
      v283 = 0;
      goto LABEL_112;
    }
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v165 = 0;
  }
  v283 = (void *)v165;
  if (![v7 containsObject:@"1.2.840.113635.100.6.71.3"])
  {
    v291 = 0;
    goto LABEL_162;
  }
  v166 = [v307 objectForKeyedSubscript:@"MFiData"];
  uint64_t v40 = isNSData(v166);

  if (!v40)
  {
    v279 = v26;
    createMobileActivationError((uint64_t)"create_baa_info", 369, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Missing required option: %@", v167, v168, @"MFiData");
    id v306 = (id)objc_claimAutoreleasedReturnValue();
    v281 = 0;
    v282 = 0;
    SecKeyRef v36 = 0;
    v288 = 0;
    v289 = 0;
    CFDataRef v300 = 0;
    v291 = 0;
    goto LABEL_159;
  }
  v169 = [v307 objectForKeyedSubscript:@"MFiData"];
  unint64_t v170 = [v169 length];

  if (v170 >= 0x4B0)
  {
    v279 = v26;
    v171 = [v307 objectForKeyedSubscript:@"MFiData"];
    [v171 length];
    createMobileActivationError((uint64_t)"create_baa_info", 374, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): unexpected size (%lu)", v172, v173, @"MFiData");
    id v306 = (id)objc_claimAutoreleasedReturnValue();

    v281 = 0;
    v282 = 0;
    SecKeyRef v36 = 0;
    v288 = 0;
    v289 = 0;
    CFDataRef v300 = 0;
    v291 = 0;
    goto LABEL_112;
  }
  v291 = [v307 objectForKeyedSubscript:@"MFiData"];
LABEL_162:
  v186 = [v307 objectForKeyedSubscript:@"UseRKSigningInterface"];
  v187 = isNSNumber(v186);

  int v273 = v20;
  if (v187)
  {
    v188 = [v307 objectForKeyedSubscript:@"UseRKSigningInterface"];
    int v27 = [v188 BOOLValue];
  }
  else
  {
    int v27 = 0;
  }
  v189 = [v307 objectForKeyedSubscript:@"UseSoftwareGeneratedKey"];
  v190 = isNSNumber(v189);

  if (v190)
  {
    v191 = [v307 objectForKeyedSubscript:@"UseSoftwareGeneratedKey"];
    char v29 = [v191 BOOLValue];
  }
  else
  {
    char v29 = 1;
  }
  v192 = [v307 objectForKeyedSubscript:@"Validity"];
  v193 = isNSNumber(v192);

  if (v193)
  {
    v194 = NSNumber;
    v195 = [v307 objectForKeyedSubscript:@"Validity"];
    v287 = objc_msgSend(v194, "numberWithUnsignedInteger:", objc_msgSend(v195, "unsignedIntegerValue"));
  }
  else
  {
    v287 = &unk_1F38E5160;
  }
  v196 = [v307 objectForKeyedSubscript:@"CACert"];
  v197 = isNSNumber(v196);

  if (v197)
  {
    v198 = NSNumber;
    v199 = [v307 objectForKeyedSubscript:@"CACert"];
    v286 = objc_msgSend(v198, "numberWithUnsignedInteger:", objc_msgSend(v199, "unsignedIntegerValue"));
  }
  else
  {
    v286 = &unk_1F38E5178;
  }
  v200 = [v307 objectForKeyedSubscript:@"scrtAttestation"];
  v201 = isNSNumber(v200);

  if (v201)
  {
    v202 = NSNumber;
    v203 = [v307 objectForKeyedSubscript:@"scrtAttestation"];
    v302 = objc_msgSend(v202, "numberWithUnsignedInteger:", objc_msgSend(v203, "unsignedIntegerValue"));
  }
  else
  {
    v302 = &unk_1F38E5178;
  }
  v204 = [v307 objectForKeyedSubscript:@"ClientAttestationData"];
  v205 = isNSData(v204);

  if (!v205)
  {
    uint64_t v299 = 0;
    v301 = 0;
LABEL_182:
    v293 = 0;
    goto LABEL_183;
  }
  v206 = [v307 objectForKeyedSubscript:@"ClientAttestationPublicKey"];
  v41 = isNSData(v206);

  if (!v41)
  {
    v279 = v26;
    createMobileActivationError((uint64_t)"create_baa_info", 411, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Missing required option for %@.", v207, v208, @"ClientAttestationPublicKey");
    id v306 = (id)objc_claimAutoreleasedReturnValue();
    v281 = 0;
    v282 = 0;
    SecKeyRef v36 = 0;
    v288 = 0;
    v289 = 0;
    CFDataRef v300 = 0;
    v301 = 0;
    v290 = 0;
    CFDataRef v284 = 0;
    v285 = 0;
    v39 = 0;
    uint64_t v40 = 0;
    v42 = 0;
    uint64_t v26 = 0;
    a1 = 0;
    CFDataRef v43 = 0;
    v293 = 0;
    goto LABEL_85;
  }
  uint64_t v299 = [v307 objectForKeyedSubscript:@"ClientAttestationData"];
  v301 = [v307 objectForKeyedSubscript:@"ClientAttestationPublicKey"];
  v209 = [v307 objectForKeyedSubscript:@"ClientDirectAttestationCertificate"];
  v210 = isNSData(v209);

  id v7 = v303;
  if (!v210) {
    goto LABEL_182;
  }
  v293 = [v307 objectForKeyedSubscript:@"ClientDirectAttestationCertificate"];
LABEL_183:
  v211 = [v307 objectForKeyedSubscript:@"AppID"];
  v212 = isNSString(v211);

  if (v212)
  {
    v290 = [v307 objectForKeyedSubscript:@"AppID"];
  }
  else
  {
    v290 = 0;
  }
  v213 = [v307 objectForKeyedSubscript:@"LiveImage4Manifest"];
  v214 = isNSData(v213);

  if (v214)
  {
    v289 = [v307 objectForKeyedSubscript:@"LiveImage4Manifest"];
  }
  else
  {
    v289 = 0;
  }
  v215 = [v307 objectForKeyedSubscript:@"RepairImage4Manifest"];
  v216 = isNSData(v215);

  if (v216)
  {
    v288 = [v307 objectForKeyedSubscript:@"RepairImage4Manifest"];
  }
  else
  {
    v288 = 0;
  }
  v295 = v81;
  uint64_t v25 = v296;
  uint64_t v24 = v297;
  CFDataRef v23 = (const __CFData *)v299;
  int v28 = v273;
  a1 = key;
LABEL_24:
  int v270 = v28;
  v303 = v7;
  v296 = v25;
  v297 = v24;
  v279 = v26;
  if (is_virtual_machine())
  {
    int v32 = v27;
    char v33 = v29;
    CFDataRef v34 = a1;
    id v320 = 0;
    vm_copy_host_certificate(0, &v320);
    a1 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    id v35 = v320;
    CFDataRef v300 = a1;
    if (!a1)
    {
      CFDataRef v298 = v23;
      createMobileActivationError((uint64_t)"create_baa_info", 440, @"com.apple.MobileActivation.ErrorDomain", -1, v35, @"Failed to copy VM host certificate.", v30, v31, v255);
      id v306 = (id)objc_claimAutoreleasedReturnValue();

      v281 = 0;
      v282 = 0;
      SecKeyRef v36 = 0;
      CFDataRef v300 = 0;
      goto LABEL_71;
    }
    a1 = v34;
    char v29 = v33;
    int v27 = v32;
    if (!a1)
    {
LABEL_27:
      CFDataRef v298 = v23;
      createMobileActivationError((uint64_t)"create_baa_info", 472, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.", v30, v31, v255);
      id v306 = (id)objc_claimAutoreleasedReturnValue();

      v281 = 0;
      v282 = 0;
      SecKeyRef v36 = 0;
LABEL_71:
      CFDataRef v284 = 0;
      v285 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      v41 = 0;
      v42 = 0;
      uint64_t v26 = 0;
LABEL_72:
      CFDataRef v43 = 0;
LABEL_73:
      CFDataRef v271 = 0;
      SecKeyRef keya = 0;
      v277 = 0;
      v278 = 0;
      v294 = 0;
      v44 = 0;
      v15 = 0;
      goto LABEL_117;
    }
  }
  else
  {
    CFDataRef v300 = 0;
    id v35 = 0;
    if (!a1) {
      goto LABEL_27;
    }
  }
  if (v23) {
    int v45 = 0;
  }
  else {
    int v45 = v27;
  }
  if (v45 != 1)
  {
    CFTypeRef v265 = 0;
    v266 = 0;
    v267 = 0;
LABEL_52:
    CFDataRef v298 = v23;
    id v316 = v35;
    CFDataRef v317 = 0;
    v75 = security_copy_system_key(0, &v317, &v316);
    CFDataRef v43 = v317;
    id v76 = v316;

    if (v75)
    {
      CFTypeRef cf = v75;
      keyb = a1;
      if ([v302 BOOLValue])
      {
        a1 = 0;
        v44 = 0;
        goto LABEL_88;
      }
      id v314 = v76;
      CFDataRef v315 = 0;
      v44 = security_copy_system_key(2, &v315, &v314);
      a1 = v315;
      id v100 = v314;

      if (v44)
      {
        id v76 = v100;
LABEL_88:
        id v263 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        if (v263)
        {
          CFDataRef v261 = v43;
          v262 = v44;
          if ([v302 BOOLValue]) {
            goto LABEL_91;
          }
          v105 = [MEMORY[0x1E4F28CB8] defaultManager];
          v106 = copy_ucrt_path();
          v107 = [v106 stringByAppendingPathComponent:@"ucrt.pem"];
          char v108 = [v105 fileExistsAtPath:v107];

          if (v108)
          {
LABEL_91:
            v111 = +[GestaltHlprDeviceIdentity getSharedInstance];
            v112 = (void *)[v111 copyAnswer:@"UniqueChipID"];

            v260 = v112;
            v75 = isNSNumber(v112);

            if (v75)
            {
              v115 = +[GestaltHlprDeviceIdentity getSharedInstance];
              v116 = (void *)[v115 copyAnswer:@"ChipID"];

              v268 = v116;
              v75 = isNSNumber(v116);

              if (v75)
              {
                v119 = +[GestaltHlprDeviceIdentity getSharedInstance];
                v41 = (void *)[v119 copyAnswer:@"BoardId"];

                v75 = isNSNumber(v41);

                if (v75)
                {
                  v258 = v41;
                  v122 = +[GestaltHlprDeviceIdentity getSharedInstance];
                  v123 = (void *)[v122 copyAnswer:@"SecurityDomain"];

                  v259 = v123;
                  v75 = isNSNumber(v123);

                  if (v75)
                  {
                    v126 = +[GestaltHlprDeviceIdentity getSharedInstance];
                    v127 = (void *)[v126 copyAnswer:@"SerialNumber"];

                    v257 = v127;
                    v75 = isNSString(v127);

                    if (v75)
                    {
                      v130 = +[GestaltHlprDeviceIdentity getSharedInstance];
                      v131 = (void *)[v130 copyAnswer:@"BuildVersion"];

                      v285 = v131;
                      v132 = isNSString(v131);

                      if (v132)
                      {
                        v135 = SecKeyCopyPublicKey(keyb);
                        v75 = v135;
                        if (v135)
                        {
                          CFDataRef v138 = SecKeyCopyExternalRepresentation(v135, &error);
                          v44 = v262;
                          if (!v138)
                          {
                            createMobileActivationError((uint64_t)"create_baa_info", 601, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to encode RK public key as data.", v139, v140, v255);
                            id v306 = (id)objc_claimAutoreleasedReturnValue();

                            SecKeyRef keya = 0;
                            v277 = 0;
                            v269 = 0;
                            CFDataRef v271 = 0;
                            v294 = 0;
                            v278 = 0;
                            CFDataRef v284 = 0;
                            v281 = 0;
                            v282 = 0;
                            uint64_t v26 = v112;
                            CFDataRef v43 = v261;
                            v15 = v263;
LABEL_216:
                            v41 = v258;
                            uint64_t v40 = v259;
                            v39 = v257;
                            goto LABEL_148;
                          }
                          CFDataRef v141 = v138;
                          if (v293)
                          {
                            id v313 = v76;
                            v142 = &v313;
                            v143 = &v313;
                            uint64_t v144 = (uint64_t)keyb;
                            uint64_t v145 = 7;
                          }
                          else
                          {
                            if ([v302 BOOLValue]) {
                              uint64_t v145 = 0;
                            }
                            else {
                              uint64_t v145 = 2;
                            }
                            id v312 = v76;
                            v142 = &v312;
                            v143 = &v312;
                            uint64_t v144 = (uint64_t)keyb;
                          }
                          uint64_t v217 = security_create_system_key_attestation(v144, v145, v297, v143);
                          id v218 = *v142;

                          CFDataRef v284 = v141;
                          if (v217)
                          {
                            v221 = @"RKCertification";
                            v278 = (void *)v217;
                            if (v298)
                            {
                              [v263 setObject:v298 forKeyedSubscript:@"RKCertification"];
                              [v263 setObject:v217 forKeyedSubscript:@"RKSigning"];
                              v221 = @"RKSigningPub";
                              v222 = v263;
                              uint64_t v223 = (uint64_t)v141;
                            }
                            else
                            {
                              v222 = v263;
                              uint64_t v223 = v217;
                            }
                            [v222 setObject:v223 forKeyedSubscript:v221];
                            id v224 = objc_alloc(MEMORY[0x1E4F1CA60]);
                            v326[0] = @"UniqueChipID";
                            v326[1] = @"ChipID";
                            uint64_t v26 = v112;
                            v327[0] = v112;
                            v327[1] = v116;
                            v326[2] = @"BoardId";
                            v326[3] = @"SecurityDomain";
                            v41 = v258;
                            v327[2] = v258;
                            v327[3] = v259;
                            v326[4] = @"SerialNumber";
                            v326[5] = @"OsBuildVersion";
                            v327[4] = v257;
                            v327[5] = v285;
                            v326[6] = @"scrtAttestation";
                            v326[7] = @"CertType";
                            v327[6] = v302;
                            v327[7] = v295;
                            v326[8] = @"Validity";
                            v326[9] = @"CACert";
                            v327[8] = v287;
                            v327[9] = v286;
                            v326[10] = @"OIDSToInclude";
                            v326[11] = @"SIKPub";
                            v327[10] = v303;
                            CFDataRef v43 = v261;
                            v327[11] = v261;
                            v225 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v327 forKeys:v326 count:12];
                            v226 = (void *)[v224 initWithDictionary:v225];

                            int v227 = v270;
                            v294 = v226;
                            if (v298)
                            {
                              [v226 setObject:v301 forKeyedSubscript:@"RKCertificationPub"];
                              [v226 setObject:v284 forKeyedSubscript:@"RKSigningPub"];
                              v228 = v296;
                              v15 = v263;
                              if (v293) {
                                [v294 setObject:v293 forKeyedSubscript:@"DirectAttestationCertificate"];
                              }
                            }
                            else
                            {
                              [v226 setObject:v284 forKeyedSubscript:@"RKCertificationPub"];
                              v228 = v296;
                              v15 = v263;
                            }
                            uint64_t v40 = v259;
                            if (v300) {
                              [v294 setObject:v300 forKeyedSubscript:@"VMHostIdentityCertificate"];
                            }
                            if (a1) {
                              [v294 setObject:a1 forKeyedSubscript:@"UIKPub"];
                            }
                            if (v228) {
                              [v294 setObject:v228 forKeyedSubscript:@"AppSpecificData"];
                            }
                            v229 = copy_trusted_local_policy_hash();

                            if (v229)
                            {
                              id v311 = v218;
                              uint64_t v230 = copyPersonalizedFirmwareData(9, &v311);
                              id v231 = v311;

                              v282 = (void *)v230;
                              if (v230)
                              {
                                int v227 = v270;
                              }
                              else
                              {
                                v232 = MEMORY[0x1E4F14500];
                                id v233 = MEMORY[0x1E4F14500];
                                if (os_log_type_enabled(v232, OS_LOG_TYPE_FAULT)) {
                                  create_baa_info_cold_3();
                                }

                                id v231 = 0;
                                int v227 = v270;
                              }
                              [v294 setObject:v282 forKeyedSubscript:@"LocalPolicy"];
                              id v218 = v231;
                              uint64_t v40 = v259;
                            }
                            else
                            {
                              v282 = 0;
                            }
                            if (v305)
                            {
                              id v310 = v218;
                              uint64_t v234 = copyPersonalizedFirmwareData(2, &v310);
                              id v235 = v310;

                              if (!v234)
                              {
                                if (v280)
                                {
                                  createMobileActivationError((uint64_t)"create_baa_info", 722, @"com.apple.MobileActivation.ErrorDomain", -1, v235, @"Failed to load boot manifest.", v236, v237, v255);
                                  id v306 = (id)objc_claimAutoreleasedReturnValue();

                                  SecKeyRef keya = 0;
                                  v277 = 0;
                                  v269 = 0;
                                  CFDataRef v271 = 0;
                                  goto LABEL_215;
                                }
                                v238 = MEMORY[0x1E4F14500];
                                id v239 = MEMORY[0x1E4F14500];
                                if (os_log_type_enabled(v238, OS_LOG_TYPE_FAULT)) {
                                  create_baa_info_cold_2();
                                }

                                id v235 = 0;
                                uint64_t v26 = v260;
                                CFDataRef v43 = v261;
                                v15 = v263;
                                uint64_t v234 = 0;
                              }
                              v277 = (void *)v234;
                              [v294 setObject:v234 forKeyedSubscript:@"Image4Manifest"];
                              v240 = copy_sfr_manifest();
                              [v294 setObject:v240 forKeyedSubscript:@"FWImage4Manifest"];

                              id v218 = v235;
                              v41 = v258;
                              uint64_t v40 = v259;
                              int v227 = v270;
                            }
                            else
                            {
                              v277 = 0;
                            }
                            if (v229) {
                              int v241 = v227;
                            }
                            else {
                              int v241 = 0;
                            }
                            if (v241 == 1)
                            {
                              id v309 = v218;
                              uint64_t v242 = copyPersonalizedFirmwareData(10, &v309);
                              id v243 = v309;

                              v281 = (void *)v242;
                              if (!v242)
                              {
                                v244 = MEMORY[0x1E4F14500];
                                id v245 = MEMORY[0x1E4F14500];
                                if (os_log_type_enabled(v244, OS_LOG_TYPE_FAULT)) {
                                  create_baa_info_cold_1();
                                }

                                id v243 = 0;
                                uint64_t v26 = v260;
                                CFDataRef v43 = v261;
                                v15 = v263;
                                v41 = v258;
                                uint64_t v40 = v259;
                              }
                              [v294 setObject:v242 forKeyedSubscript:@"Cryptex1Image4Manifest"];
                              id v218 = v243;
                            }
                            else
                            {
                              v281 = 0;
                            }
                            if (v290) {
                              [v294 setObject:v290 forKeyedSubscript:@"AppID"];
                            }
                            if (v292) {
                              [v294 setObject:v292 forKeyedSubscript:@"MFiProperties"];
                            }
                            if (v283) {
                              [v294 setObject:v283 forKeyedSubscript:@"MFiPPUID"];
                            }
                            if (v291) {
                              [v294 setObject:v291 forKeyedSubscript:@"MFiData"];
                            }
                            v39 = v257;
                            if (v289) {
                              [v294 setObject:v289 forKeyedSubscript:@"LiveImage4Manifest"];
                            }
                            if (v288) {
                              [v294 setObject:v288 forKeyedSubscript:@"RepairImage4Manifest"];
                            }
                            id v308 = 0;
                            CFDataRef v246 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v294 format:100 options:0 error:&v308];
                            id v306 = v308;

                            if (v246)
                            {
                              [v15 setObject:v246 forKeyedSubscript:@"RKProperties"];
                              v249 = keyb;
                              SecKeyRef keya = v246;
                              CFDataRef v250 = SecKeyCreateSignature(v249, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA70], v246, &error);
                              v44 = v262;
                              if (v250)
                              {
                                CFDataRef v271 = v250;
                                [v15 setObject:v250 forKeyedSubscript:@"RKPropertiesSignature"];
                                v269 = v15;
                              }
                              else
                              {
                                uint64_t v254 = createMobileActivationError((uint64_t)"create_baa_info", 830, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to sign data with ref key.", v251, v252, v255);

                                v269 = 0;
                                CFDataRef v271 = 0;
                                id v306 = (id)v254;
                              }
                            }
                            else
                            {
                              uint64_t v253 = createMobileActivationError((uint64_t)"create_baa_info", 819, @"com.apple.MobileActivation.ErrorDomain", -1, v306, @"Could not convert dictionary to xml data.", v247, v248, v255);

                              v269 = 0;
                              CFDataRef v271 = 0;
                              SecKeyRef keya = 0;
                              id v306 = (id)v253;
                              v44 = v262;
                            }
                            goto LABEL_148;
                          }
                          createMobileActivationError((uint64_t)"create_baa_info", 614, @"com.apple.MobileActivation.ErrorDomain", -1, v218, @"Failed to create reference key attestation (nonce: %@).", v219, v220, (uint64_t)v297);
                          id v306 = (id)objc_claimAutoreleasedReturnValue();

                          SecKeyRef keya = 0;
                          v277 = 0;
                          v269 = 0;
                          CFDataRef v271 = 0;
                          v294 = 0;
                          v278 = 0;
                        }
                        else
                        {
                          createMobileActivationError((uint64_t)"create_baa_info", 595, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy RK public key.", v136, v137, v255);
                          id v306 = (id)objc_claimAutoreleasedReturnValue();

                          SecKeyRef keya = 0;
                          v277 = 0;
                          v269 = 0;
                          CFDataRef v271 = 0;
                          v294 = 0;
                          v278 = 0;
                          CFDataRef v284 = 0;
                        }
                      }
                      else
                      {
                        createMobileActivationError((uint64_t)"create_baa_info", 586, @"com.apple.MobileActivation.ErrorDomain", -1, v76, @"Failed to retrieve %@.", v133, v134, @"BuildVersion");
                        id v306 = (id)objc_claimAutoreleasedReturnValue();

                        SecKeyRef keya = 0;
                        v277 = 0;
                        v269 = 0;
                        CFDataRef v271 = 0;
                        v294 = 0;
                        v278 = 0;
                        CFDataRef v284 = 0;
                        v75 = 0;
                      }
                    }
                    else
                    {
                      createMobileActivationError((uint64_t)"create_baa_info", 580, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve %@.", v128, v129, @"SerialNumber");
                      id v306 = (id)objc_claimAutoreleasedReturnValue();

                      SecKeyRef keya = 0;
                      v277 = 0;
                      v269 = 0;
                      CFDataRef v271 = 0;
                      v294 = 0;
                      v278 = 0;
                      CFDataRef v284 = 0;
                      v285 = 0;
                    }
                    v282 = 0;
LABEL_215:
                    v281 = 0;
                    uint64_t v26 = v260;
                    CFDataRef v43 = v261;
                    v44 = v262;
                    v15 = v263;
                    goto LABEL_216;
                  }
                  createMobileActivationError((uint64_t)"create_baa_info", 574, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve %@.", v124, v125, @"SecurityDomain");
                  id v306 = (id)objc_claimAutoreleasedReturnValue();

                  SecKeyRef keya = 0;
                  v277 = 0;
                  v269 = 0;
                  CFDataRef v271 = 0;
                  v294 = 0;
                  v278 = 0;
                  CFDataRef v284 = 0;
                  v285 = 0;
                  v39 = 0;
                  v281 = 0;
                  v282 = 0;
                  uint64_t v26 = v112;
                  CFDataRef v43 = v261;
                  v44 = v262;
                  v15 = v263;
                  v41 = v258;
                  uint64_t v40 = v259;
LABEL_148:
                  CFRelease(cf);
                  if (v44) {
                    CFRelease(v44);
                  }
                  v44 = v269;
LABEL_151:
                  if (v265) {
                    CFRelease(v265);
                  }
                  v180 = v267;
                  if (!v267) {
                    goto LABEL_197;
                  }
                  goto LABEL_196;
                }
                createMobileActivationError((uint64_t)"create_baa_info", 568, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve %@.", v120, v121, @"BoardId");
                id v306 = (id)objc_claimAutoreleasedReturnValue();

                SecKeyRef keya = 0;
                v277 = 0;
                v269 = 0;
                CFDataRef v271 = 0;
                v294 = 0;
                v278 = 0;
                CFDataRef v284 = 0;
LABEL_147:
                uint64_t v40 = 0;
                v39 = 0;
                v285 = 0;
                v281 = 0;
                v282 = 0;
                uint64_t v26 = v260;
                CFDataRef v43 = v261;
                v44 = v262;
                v15 = v263;
                goto LABEL_148;
              }
              createMobileActivationError((uint64_t)"create_baa_info", 562, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve %@.", v117, v118, @"ChipID");
              id v306 = (id)objc_claimAutoreleasedReturnValue();

              SecKeyRef keya = 0;
              v277 = 0;
              v269 = 0;
              CFDataRef v271 = 0;
              v294 = 0;
              v278 = 0;
              CFDataRef v284 = 0;
            }
            else
            {
              createMobileActivationError((uint64_t)"create_baa_info", 556, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve %@.", v113, v114, @"UniqueChipID");
              id v306 = (id)objc_claimAutoreleasedReturnValue();

              SecKeyRef keya = 0;
              v277 = 0;
              v269 = 0;
              CFDataRef v271 = 0;
              v294 = 0;
              v278 = 0;
              CFDataRef v284 = 0;
              v268 = 0;
            }
            v41 = 0;
            goto LABEL_147;
          }
          createMobileActivationError((uint64_t)"create_baa_info", 548, @"com.apple.MobileActivation.ErrorDomain", -4, 0, @"UCRT is unavailable.", v109, v110, v255);
          id v306 = (id)objc_claimAutoreleasedReturnValue();

          SecKeyRef keya = 0;
          v277 = 0;
          v269 = 0;
          CFDataRef v271 = 0;
          v294 = 0;
          v278 = 0;
          CFDataRef v284 = 0;
          v285 = 0;
          uint64_t v26 = 0;
          v268 = 0;
          v41 = 0;
          uint64_t v40 = 0;
          v39 = 0;
          v75 = 0;
          v281 = 0;
          v282 = 0;
          CFDataRef v43 = v261;
          v44 = v262;
        }
        else
        {
          createMobileActivationError((uint64_t)"create_baa_info", 541, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate dictionary.", v103, v104, v255);
          id v306 = (id)objc_claimAutoreleasedReturnValue();

          SecKeyRef keya = 0;
          v277 = 0;
          v269 = 0;
          CFDataRef v271 = 0;
          v294 = 0;
          v278 = 0;
          CFDataRef v284 = 0;
          v285 = 0;
          uint64_t v26 = 0;
          v268 = 0;
          v41 = 0;
          uint64_t v40 = 0;
          v39 = 0;
          v75 = 0;
          v281 = 0;
          v282 = 0;
        }
        v15 = v263;
        goto LABEL_148;
      }
      createMobileActivationError((uint64_t)"create_baa_info", 533, @"com.apple.MobileActivation.ErrorDomain", -1, v100, @"Failed to copy UIK attestation key.", v101, v102, v255);
      id v306 = (id)objc_claimAutoreleasedReturnValue();

      CFRelease(cf);
      SecKeyRef keya = 0;
      v277 = 0;
      v15 = 0;
      v294 = 0;
      v278 = 0;
      CFDataRef v271 = 0;
      CFDataRef v284 = 0;
      v285 = 0;
      uint64_t v26 = 0;
      v268 = 0;
      v41 = 0;
      uint64_t v40 = 0;
      v39 = 0;
      v75 = 0;
    }
    else
    {
      createMobileActivationError((uint64_t)"create_baa_info", 524, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to copy SIK attestation key.", v77, v78, v255);
      id v306 = (id)objc_claimAutoreleasedReturnValue();

      SecKeyRef keya = 0;
      v277 = 0;
      v15 = 0;
      v44 = 0;
      v294 = 0;
      v278 = 0;
      CFDataRef v271 = 0;
      a1 = 0;
      CFDataRef v284 = 0;
      v285 = 0;
      uint64_t v26 = 0;
      v268 = 0;
      v41 = 0;
      uint64_t v40 = 0;
      v39 = 0;
    }
    v281 = 0;
    v282 = 0;
    goto LABEL_151;
  }
  if ([v302 BOOLValue]) {
    uint64_t v46 = 0;
  }
  else {
    uint64_t v46 = 2;
  }
  id v319 = v35;
  security_create_system_key_attestation((uint64_t)a1, v46, v24, &v319);
  CFDataRef v43 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  id v47 = v319;

  CFDataRef v298 = v43;
  if (!v43)
  {
    createMobileActivationError((uint64_t)"create_baa_info", 482, @"com.apple.MobileActivation.ErrorDomain", -1, v47, @"Failed to create reference key attestation.", v48, v49, v255);
    id v306 = (id)objc_claimAutoreleasedReturnValue();

    v281 = 0;
    v282 = 0;
    SecKeyRef v36 = 0;
    CFDataRef v284 = 0;
    v285 = 0;
    v39 = 0;
    uint64_t v40 = 0;
    v41 = 0;
    v42 = 0;
    uint64_t v26 = 0;
    a1 = 0;
LABEL_85:
    CFDataRef v298 = 0;
    goto LABEL_73;
  }
  v50 = SecKeyCopyPublicKey(a1);
  if (!v50)
  {
    createMobileActivationError((uint64_t)"create_baa_info", 488, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy RK public key.", v51, v52, v255);
    id v306 = (id)objc_claimAutoreleasedReturnValue();

    v281 = 0;
    v282 = 0;
    SecKeyRef v36 = 0;
    CFDataRef v284 = 0;
    v285 = 0;
    v39 = 0;
    uint64_t v40 = 0;
    v41 = 0;
    v42 = 0;
    uint64_t v26 = 0;
    a1 = 0;
    goto LABEL_72;
  }
  v267 = v50;
  CFDataRef v53 = SecKeyCopyExternalRepresentation(v50, &error);

  if (!v53)
  {
    CFErrorRef v174 = error;
    v175 = @"Failed to encode RK public key as data.";
    uint64_t v176 = 494;
LABEL_139:
    createMobileActivationError((uint64_t)"create_baa_info", v176, @"com.apple.MobileActivation.ErrorDomain", -1, v174, v175, v54, v55, v255);
    id v306 = (id)objc_claimAutoreleasedReturnValue();
    v266 = 0;
    goto LABEL_195;
  }
  uint64_t v56 = SecAccessControlCreate();
  if (!v56)
  {
    CFErrorRef v174 = error;
    v175 = @"Failed to create access control.";
    uint64_t v176 = 502;
    goto LABEL_139;
  }
  uint64_t v57 = *MEMORY[0x1E4F3B5A0];
  v58 = (const void *)v56;
  v266 = (const void *)v56;
  if (SecAccessControlSetProtection())
  {
    id v318 = v47;
    CFTypeRef v61 = createReferenceKeyBlob(v58, v29, v307, &v318);
    id v35 = v318;

    if (v61)
    {
      v301 = v53;
      CFTypeRef v265 = v61;
      a1 = (const __CFData *)v61;
      CFDataRef v23 = v298;
      goto LABEL_52;
    }
    createMobileActivationError((uint64_t)"create_baa_info", 513, @"com.apple.MobileActivation.ErrorDomain", -1, v35, @"Failed to create reference key.", v62, v63, v255);
    id v306 = (id)objc_claimAutoreleasedReturnValue();
    id v47 = v35;
  }
  else
  {
    createMobileActivationError((uint64_t)"create_baa_info", 507, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to set ACL protection to %@.", v59, v60, v57);
    id v306 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_195:

  SecKeyRef keya = 0;
  v277 = 0;
  v15 = 0;
  v44 = 0;
  v294 = 0;
  v278 = 0;
  CFDataRef v271 = 0;
  CFDataRef v43 = 0;
  a1 = 0;
  CFDataRef v284 = 0;
  v285 = 0;
  uint64_t v26 = 0;
  v268 = 0;
  v41 = 0;
  uint64_t v40 = 0;
  v39 = 0;
  v75 = 0;
  v281 = 0;
  v282 = 0;
  v301 = v53;
  v180 = v267;
LABEL_196:
  CFRelease(v180);
LABEL_197:
  if (v75) {
    CFRelease(v75);
  }
  SecKeyRef v36 = v266;
  v42 = v268;
LABEL_117:
  if (error)
  {
    v154 = v39;
    v155 = v40;
    v156 = v41;
    v157 = v42;
    v158 = v26;
    v159 = v15;
    CFDataRef v160 = a1;
    CFDataRef v161 = v43;
    v162 = v36;
    CFRelease(error);
    SecKeyRef v36 = v162;
    CFDataRef v43 = v161;
    a1 = v160;
    v15 = v159;
    uint64_t v26 = v158;
    v42 = v157;
    v41 = v156;
    uint64_t v40 = v155;
    v39 = v154;
  }
  CFErrorRef error = 0;
  if (v36) {
    CFRelease(v36);
  }
  if (a3 && !v44) {
    *a3 = v306;
  }
  v163 = v44;

  return v163;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t mobileactivationErrorHasDomainAndErrorCode(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    do
    {
      v10 = [v5 domain];
      if ([v10 isEqualToString:v7])
      {
        uint64_t v11 = [v5 code];

        if (v11 == a3)
        {
          uint64_t v8 = 1;
          goto LABEL_10;
        }
      }
      else
      {
      }
      uint64_t v12 = [v5 userInfo];
      uint64_t v13 = [v12 objectForKeyedSubscript:v9];

      id v5 = (id)v13;
    }
    while (v13);
    uint64_t v8 = 0;
  }
LABEL_10:

  return v8;
}

uint64_t isRunningInRecovery()
{
  return 0;
}

uint64_t isRunningInDiagnosticsMode()
{
  if (isRunningInDiagnosticsMode_onceToken != -1) {
    dispatch_once(&isRunningInDiagnosticsMode_onceToken, &__block_literal_global);
  }
  return isRunningInDiagnosticsMode_retval;
}

void __isRunningInDiagnosticsMode_block_invoke()
{
  id v1 = (id)MGCopyAnswer();
  v0 = isNSNumber(v1);

  if (v0) {
    isRunningInDiagnosticsMode_retval = [v1 BOOLValue];
  }
}

id isNSNumber(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

uint64_t isSupportedDeviceIdentityClient(uint64_t a1, void *a2)
{
  if (isSupportedDeviceIdentityClient_onceToken != -1) {
    dispatch_once(&isSupportedDeviceIdentityClient_onceToken, &__block_literal_global_3);
  }
  id v5 = copy_process_name();
  if (!v5)
  {
    createMobileActivationError((uint64_t)"isSupportedDeviceIdentityClient", 295, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to query process name.", v3, v4, v14);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    if (a2)
    {
LABEL_12:
      id v11 = v11;
      uint64_t v12 = 0;
      *a2 = v11;
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v12 = 0;
    goto LABEL_15;
  }
  BOOL v6 = is_virtual_machine();
  id v7 = &isSupportedDeviceIdentityClient_virtualDeviceSupportedList;
  if (!v6) {
    id v7 = &isSupportedDeviceIdentityClient_physicalDeviceSupportedList;
  }
  id v8 = (id)*v7;
  if (([v8 containsObject:v5] & 1) == 0)
  {
    createMobileActivationError((uint64_t)"isSupportedDeviceIdentityClient", 302, @"com.apple.MobileActivation.ErrorDomain", -25, 0, @"%@ is not allowed to use this API. File a radar with 'MobileActivation | all' for support.", v9, v10, (uint64_t)v5);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      isSupportedDeviceIdentityClient_cold_1(v11);
      if (a2) {
        goto LABEL_12;
      }
    }
    else if (a2)
    {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  id v11 = 0;
  uint64_t v12 = 1;
LABEL_15:

  return v12;
}

void __isSupportedDeviceIdentityClient_block_invoke()
{
  v0 = (void *)isSupportedDeviceIdentityClient_virtualDeviceSupportedList;
  isSupportedDeviceIdentityClient_virtualDeviceSupportedList = (uint64_t)&unk_1F38E50D0;

  id v1 = (void *)isSupportedDeviceIdentityClient_physicalDeviceSupportedList;
  isSupportedDeviceIdentityClient_physicalDeviceSupportedList = (uint64_t)&unk_1F38E50E8;
}

id copy_calling_process_name()
{
  return copy_process_name();
}

id copy_current_process_name()
{
  return copy_process_name();
}

id isNSDictionary(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSArray(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSString(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSData(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSDate(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id copy_process_name()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x1000uLL);
  memset(v8, 0, sizeof(v8));
  if (v0
    && ([MEMORY[0x1E4F29268] currentConnection], (id v1 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v2 = v1;
    pid_t v3 = [v1 processIdentifier];
  }
  else
  {
    pid_t v3 = getpid();
  }
  proc_pidpath(v3, buffer, 0x1000u);
  int v4 = strlen(buffer);
  if ((v4 & 0x80000000) == 0)
  {
    do
    {
      if (buffer[v4] == 47) {
        break;
      }
    }
    while (v4-- > 0);
  }
  __strlcpy_chk();
  BOOL v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", v8);
  return v6;
}

uint64_t device_supports_mfi_certificates()
{
  int v0 = +[DeviceTypeDeviceIdentity sharedInstance];
  uint64_t v1 = objc_msgSend(v0, "device_supports_mfi_certificates");

  return v1;
}

uint64_t device_supports_eda_certificates()
{
  int v0 = +[DeviceTypeDeviceIdentity sharedInstance];
  uint64_t v1 = objc_msgSend(v0, "device_supports_eda_certificates");

  return v1;
}

uint64_t platform_supports_activation()
{
  return os_variant_is_darwinos() ^ 1;
}

id copy_trusted_local_policy_hash()
{
  int v0 = +[DeviceTypeDeviceIdentity sharedInstance];
  uint64_t v1 = [@"IODeviceTree" stringByAppendingString:@":/chosen"];
  id v2 = (void *)[v0 copyDeviceTreeProperty:v1 key:@"trusted-boot-policy-measurement"];

  uint64_t v3 = isNSData(v2);
  if (!v3) {
    goto LABEL_8;
  }
  int v4 = (void *)v3;
  id v5 = (id)[v2 length];

  if (!v5) {
    goto LABEL_9;
  }
  BOOL v6 = malloc_type_calloc(1uLL, [v2 length], 0xDA89FFE2uLL);
  if (v6)
  {
    id v7 = v6;
    objc_msgSend(v2, "getBytes:length:", v6, objc_msgSend(v2, "length"));
    if (!*v7 && !memcmp(v7, v7 + 1, [v2 length] - 1)) {
      id v5 = 0;
    }
    else {
      id v5 = v2;
    }
    free(v7);
  }
  else
  {
LABEL_8:
    id v5 = 0;
  }
LABEL_9:

  return v5;
}

id copy_sfr_manifest()
{
  int v0 = +[DeviceTypeDeviceIdentity sharedInstance];
  uint64_t v1 = [@"IODeviceTree" stringByAppendingString:@":/chosen/iBoot"];
  id v2 = (void *)[v0 copyDeviceTreeInt:v1 key:@"sfr-manifest-size" defaultValue:0];

  if (!v2 || ![v2 unsignedIntValue])
  {
    id v6 = 0;
LABEL_8:
    id v5 = 0;
    goto LABEL_9;
  }
  uint64_t v3 = +[DeviceTypeDeviceIdentity sharedInstance];
  int v4 = [@"IODeviceTree" stringByAppendingString:@":/chosen/iBoot"];
  id v5 = (void *)[v3 copyDeviceTreeProperty:v4 key:@"sfr-manifest-data"];

  isNSData(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v7 = [v5 length];

  if (v7)
  {
    objc_msgSend(v5, "subdataWithRange:", 0, objc_msgSend(v2, "unsignedIntValue"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      id v6 = v6;
      id v5 = v6;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

id vm_copy_host_certificate(void *a1, void *a2)
{
  id v3 = a1;
  if (is_virtual_machine())
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v8)
    {
      id v33 = 0;
      uint64_t v9 = libavp_copy_strong_identity_data(v3, &v33);
      id v12 = v33;
      if (v9)
      {
        [v8 setObject:@"CopyVMHostCertificateRequest" forKeyedSubscript:@"Command"];
        [v8 setObject:v9 forKeyedSubscript:@"Value"];
        id v32 = v12;
        uint64_t v13 = libavp_send_host_message(v8, &v32);
        id v14 = v32;

        v15 = isNSDictionary(v13);

        if (v15)
        {
          v15 = [v13 objectForKeyedSubscript:@"Error"];
          uint64_t v18 = isNSString(v15);

          if (!v18)
          {
            uint64_t v22 = [v13 objectForKeyedSubscript:@"Value"];
            CFDataRef v23 = isNSDictionary(v22);

            if (v23)
            {
              CFDataRef v23 = [v22 objectForKeyedSubscript:@"RKCertification"];
              isNSData(v23);
              id v21 = (id)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                id v21 = v23;
                CFDataRef v23 = v21;
                goto LABEL_11;
              }
              uint64_t v31 = createMobileActivationError((uint64_t)"vm_copy_host_certificate", 71, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid response message.", v28, v29, v30);
            }
            else
            {
              uint64_t v31 = createMobileActivationError((uint64_t)"vm_copy_host_certificate", 65, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid response message.", v26, v27, v30);

              id v21 = 0;
            }
            goto LABEL_17;
          }
          createMobileActivationError((uint64_t)"vm_copy_host_certificate", 59, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Error occurred during request: %@", v19, v20, (uint64_t)v15);
        }
        else
        {
          createMobileActivationError((uint64_t)"vm_copy_host_certificate", 53, @"com.apple.MobileActivation.ErrorDomain", -1, v14, @"Failed to receive response.", v16, v17, v30);
        uint64_t v31 = };

        id v21 = 0;
        uint64_t v22 = 0;
        CFDataRef v23 = 0;
LABEL_17:
        id v14 = (id)v31;
        goto LABEL_11;
      }
      createMobileActivationError((uint64_t)"vm_copy_host_certificate", 44, @"com.apple.MobileActivation.ErrorDomain", -1, v12, @"Failed to copy AVP identity data.", v10, v11, v30);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      id v21 = 0;
    }
    else
    {
      createMobileActivationError((uint64_t)"vm_copy_host_certificate", 38, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create dictionary.", v6, v7, v30);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = 0;
      uint64_t v9 = 0;
    }
  }
  else
  {
    createMobileActivationError((uint64_t)"vm_copy_host_certificate", 32, @"com.apple.MobileActivation.ErrorDomain", -3, 0, @"Device is not a VM (not supported).", v4, v5, v30);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = 0;
    uint64_t v9 = 0;
    id v8 = 0;
  }
  uint64_t v13 = 0;
  uint64_t v22 = 0;
  CFDataRef v23 = 0;
  v15 = 0;
LABEL_11:
  if (a2 && !v21) {
    *a2 = v14;
  }
  id v24 = v21;

  return v24;
}

id vm_create_host_key_signature(void *a1, void *a2, void *a3, void *a4)
{
  id v6 = a1;
  id v7 = a2;
  v44 = v7;
  int v45 = v6;
  if (!is_virtual_machine())
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 101, @"com.apple.MobileActivation.ErrorDomain", -3, 0, @"Device is not a VM (not supported).", v8, v9, v41);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = 0;
    uint64_t v17 = 0;
    uint64_t v13 = 0;
LABEL_13:
    id v16 = 0;
LABEL_14:
    id v21 = 0;
    uint64_t v31 = 0;
    CFDataRef v23 = 0;
    id v32 = 0;
    uint64_t v26 = 0;
    goto LABEL_15;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = v10;
  if (!v10)
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 107, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create dictionary.", v11, v12, v41);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = 0;
    uint64_t v17 = 0;
    goto LABEL_13;
  }
  if (v7) {
    [v10 addEntriesFromDictionary:v7];
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v16)
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 117, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create dictionary.", v14, v15, v41);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = 0;
    uint64_t v17 = 0;
    goto LABEL_14;
  }
  id v48 = 0;
  uint64_t v17 = libavp_copy_strong_identity_data(v7, &v48);
  id v20 = v48;
  if (!v17)
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 123, @"com.apple.MobileActivation.ErrorDomain", -1, v20, @"Failed to copy AVP identity data.", v18, v19, v41);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    id v30 = 0;
    goto LABEL_14;
  }
  [v13 setObject:v17 forKeyedSubscript:@"BIKData"];
  [v16 setObject:@"CreateVMHostKeyAttestationRequest" forKeyedSubscript:@"Command"];
  [v16 setObject:v6 forKeyedSubscript:@"Value"];
  [v16 setObject:v13 forKeyedSubscript:@"Options"];
  id v47 = v20;
  id v21 = libavp_send_host_message(v16, &v47);
  id v22 = v47;

  CFDataRef v23 = isNSDictionary(v21);

  if (!v23)
  {
    uint64_t v42 = createMobileActivationError((uint64_t)"vm_create_host_key_signature", 136, @"com.apple.MobileActivation.ErrorDomain", -1, v22, @"Failed to receive response.", v24, v25, v41);

    id v30 = 0;
    uint64_t v31 = 0;
    id v32 = 0;
    uint64_t v26 = 0;
    goto LABEL_22;
  }
  uint64_t v26 = [v21 objectForKeyedSubscript:@"Error"];
  uint64_t v27 = isNSString(v26);

  if (v27)
  {
    uint64_t v42 = createMobileActivationError((uint64_t)"vm_create_host_key_signature", 142, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Error occurred during request: %@", v28, v29, (uint64_t)v26);

    id v30 = 0;
    uint64_t v31 = 0;
    CFDataRef v23 = 0;
LABEL_10:
    id v32 = 0;
LABEL_22:
    id v22 = (id)v42;
    goto LABEL_15;
  }
  CFDataRef v43 = a3;
  uint64_t v31 = [v21 objectForKeyedSubscript:@"Value"];
  CFDataRef v23 = isNSDictionary(v31);

  if (!v23)
  {
    uint64_t v42 = createMobileActivationError((uint64_t)"vm_create_host_key_signature", 148, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid response message.", v35, v36, v41);

    id v30 = 0;
    goto LABEL_10;
  }
  CFDataRef v23 = [v31 objectForKeyedSubscript:@"RKCertification"];
  id v32 = isNSData(v23);

  if (!v32)
  {
    uint64_t v42 = createMobileActivationError((uint64_t)"vm_create_host_key_signature", 154, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid response message.", v37, v38, v41);

    id v30 = 0;
    goto LABEL_22;
  }
  id v32 = [v31 objectForKeyedSubscript:@"RKSignature"];
  isNSData(v32);
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    uint64_t v42 = createMobileActivationError((uint64_t)"vm_create_host_key_signature", 160, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid response message.", v39, v40, v41);

    goto LABEL_22;
  }
  if (v43) {
    *CFDataRef v43 = v23;
  }
  id v30 = v32;
  id v32 = v30;
LABEL_15:
  if (a4 && !v30) {
    *a4 = v22;
  }
  id v33 = v30;

  return v33;
}

uint64_t load_certificate(CFTypeRef *a1, void *a2, void *a3, int *a4, void *a5)
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  uint64_t v13 = v10;
  CFTypeRef result = 0;
  if (!v10)
  {
    CFDataRef v23 = createMobileActivationError((uint64_t)"load_certificate", 231, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid inputs.", v11, v12, v27);
    uint64_t v24 = 0;
    uint64_t v18 = 0;
    int v22 = -1;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v14 = *MEMORY[0x1E4F3B978];
  v29[0] = *MEMORY[0x1E4F3B788];
  v29[1] = v14;
  uint64_t v15 = *MEMORY[0x1E4F3B980];
  v30[0] = v10;
  v30[1] = v15;
  uint64_t v16 = *MEMORY[0x1E4F3BD08];
  v29[2] = *MEMORY[0x1E4F3BC80];
  v29[3] = v16;
  v30[2] = MEMORY[0x1E4F1CC38];
  v30[3] = MEMORY[0x1E4F1CC38];
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];
  uint64_t v18 = (void *)[v17 mutableCopy];

  if (v9) {
    [v18 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  }
  OSStatus v19 = SecItemCopyMatching((CFDictionaryRef)v18, &result);
  if (v19)
  {
    int v22 = v19;
    CFDataRef v23 = createMobileActivationError((uint64_t)"load_certificate", 253, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy certificate (%@): %d", v20, v21, (uint64_t)v13);
    uint64_t v24 = 0;
    if (!a4) {
      goto LABEL_9;
    }
LABEL_8:
    *a4 = v22;
    goto LABEL_9;
  }
  int v22 = 0;
  CFDataRef v23 = 0;
  if (a1) {
    *a1 = CFRetain(result);
  }
  uint64_t v24 = 1;
  if (a4) {
    goto LABEL_8;
  }
LABEL_9:
  if (a5) {
    char v25 = v24;
  }
  else {
    char v25 = 1;
  }
  if ((v25 & 1) == 0) {
    *a5 = v23;
  }
  if (result) {
    CFRelease(result);
  }
  CFTypeRef result = 0;

  return v24;
}

uint64_t delete_certificate(void *a1, void *a2, void *a3)
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v9 = v6;
  if (!v6)
  {
    createMobileActivationError((uint64_t)"delete_certificate", 287, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.", v7, v8, v21);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = 0;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  uint64_t v10 = *MEMORY[0x1E4F3B978];
  v22[0] = *MEMORY[0x1E4F3B788];
  v22[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F3B980];
  v23[0] = v6;
  v23[1] = v11;
  uint64_t v12 = *MEMORY[0x1E4F3BD08];
  v22[2] = *MEMORY[0x1E4F3BC80];
  v22[3] = v12;
  v23[2] = MEMORY[0x1E4F1CC38];
  v23[3] = MEMORY[0x1E4F1CC38];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
  uint64_t v14 = (void *)[v13 mutableCopy];

  if (v5) {
    [v14 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  }
  OSStatus v17 = SecItemDelete((CFDictionaryRef)v14);
  id v18 = 0;
  uint64_t v19 = 1;
  if (v17 != -25300 && v17)
  {
    createMobileActivationError((uint64_t)"delete_certificate", 309, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to remove existing certificate (%@): %d", v15, v16, (uint64_t)v9);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      uint64_t v19 = 0;
      goto LABEL_10;
    }
LABEL_9:
    id v18 = v18;
    uint64_t v19 = 0;
    *a3 = v18;
  }
LABEL_10:

  return v19;
}

CFTypeRef copy_keychain_item(void *a1, void *a2, void *a3, OSStatus *a4, void *a5)
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  uint64_t v14 = v11;
  CFTypeRef result = 0;
  if (!v10)
  {
    id v18 = createMobileActivationError((uint64_t)"copy_keychain_item", 542, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.", v12, v13, v32);
    CFTypeRef v19 = 0;
    OSStatus v20 = -1;
    if (!a4) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  id v33 = a5;
  if (v11)
  {
    uint64_t v15 = [v11 objectForKeyedSubscript:@"LocalAuthenticationContext"];
    if (v15)
    {
      uint64_t v16 = [v14 objectForKeyedSubscript:@"LocalAuthenticationContext"];
      getLAContextClass();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v15 = [v14 objectForKeyedSubscript:@"LocalAuthenticationContext"];
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
    uint64_t v21 = [v14 objectForKeyedSubscript:@"UseAuthenticationUI"];
    int v22 = isNSString(v21);

    if (v22)
    {
      CFDataRef v23 = [v14 objectForKeyedSubscript:@"UseAuthenticationUI"];
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  CFDataRef v23 = 0;
LABEL_13:
  uint64_t v24 = *MEMORY[0x1E4F3B978];
  v35[0] = *MEMORY[0x1E4F3B788];
  v35[1] = v24;
  uint64_t v25 = *MEMORY[0x1E4F3B9A0];
  v36[0] = v10;
  v36[1] = v25;
  uint64_t v26 = *MEMORY[0x1E4F3BD08];
  v35[2] = *MEMORY[0x1E4F3BC80];
  v35[3] = v26;
  v36[2] = MEMORY[0x1E4F1CC38];
  v36[3] = MEMORY[0x1E4F1CC38];
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];
  uint64_t v28 = (void *)[v27 mutableCopy];

  if (v9) {
    [v28 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  }
  if (v15) {
    [v28 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F3BCE8]];
  }
  if (v23) {
    [v28 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F3BCF0]];
  }
  OSStatus v20 = SecItemCopyMatching((CFDictionaryRef)v28, &result);
  if (v20)
  {
    id v18 = createMobileActivationError((uint64_t)"copy_keychain_item", 586, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy keychain item %@: %d", v29, v30, (uint64_t)v10);

    CFTypeRef v19 = 0;
  }
  else
  {
    CFTypeRef v19 = result;
    CFTypeRef result = 0;

    id v18 = 0;
  }
  a5 = v33;
  if (a4) {
LABEL_23:
  }
    *a4 = v20;
LABEL_24:
  if (a5 && !v19) {
    *a5 = v18;
  }
  if (result) {
    CFRelease(result);
  }
  CFTypeRef result = 0;

  return v19;
}

id getLAContextClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  int v0 = (void *)getLAContextClass_softClass;
  uint64_t v7 = getLAContextClass_softClass;
  if (!getLAContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLAContextClass_block_invoke;
    v3[3] = &unk_1E6CD5CF0;
    v3[4] = &v4;
    __getLAContextClass_block_invoke((uint64_t)v3);
    int v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DD6DB8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t delete_keychain_item(void *a1, void *a2, void *a3)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v9 = v6;
  if (!v6)
  {
    createMobileActivationError((uint64_t)"delete_keychain_item", 617, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).", v7, v8, v21);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = 0;
    if (!a3)
    {
LABEL_13:
      uint64_t v18 = 0;
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  uint64_t v10 = *MEMORY[0x1E4F3B978];
  v22[0] = *MEMORY[0x1E4F3B788];
  v22[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F3B9A0];
  v23[0] = v6;
  v23[1] = v11;
  v22[2] = *MEMORY[0x1E4F3BD08];
  v23[2] = MEMORY[0x1E4F1CC38];
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  uint64_t v13 = (void *)[v12 mutableCopy];

  if (v5) {
    [v13 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  }
  OSStatus v14 = SecItemDelete((CFDictionaryRef)v13);
  if (v14 != -25300 && v14 != 0)
  {
    createMobileActivationError((uint64_t)"delete_keychain_item", 638, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to remove existing keychain item %@: %d", v15, v16, (uint64_t)v9);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_13;
    }
LABEL_11:
    id v19 = v19;
    uint64_t v18 = 0;
    *a3 = v19;
    goto LABEL_14;
  }
  id v19 = 0;
  uint64_t v18 = 1;
LABEL_14:

  return v18;
}

uint64_t store_keychain_item(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v40[5] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  OSStatus v14 = v11;
  if (a1 && v10)
  {
    if (v11)
    {
      uint64_t v15 = [v11 objectForKeyedSubscript:@"LocalAuthenticationContext"];
      if (!v15) {
        goto LABEL_9;
      }
      uint64_t v16 = (void *)v15;
      OSStatus v17 = [v14 objectForKeyedSubscript:@"LocalAuthenticationContext"];
      getLAContextClass();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v19 = [v14 objectForKeyedSubscript:@"LocalAuthenticationContext"];
      }
      else
      {
LABEL_9:
        id v19 = 0;
      }
      uint64_t v24 = [v14 objectForKeyedSubscript:@"UseAuthenticationUI"];
      uint64_t v25 = isNSString(v24);

      if (v25)
      {
        int v22 = [v14 objectForKeyedSubscript:@"UseAuthenticationUI"];
        goto LABEL_14;
      }
    }
    else
    {
      id v19 = 0;
    }
    int v22 = 0;
LABEL_14:
    id v38 = 0;
    char v26 = delete_keychain_item(v9, v10, &v38);
    id v20 = v38;
    if (v26)
    {
      uint64_t v29 = *MEMORY[0x1E4F3B978];
      v39[0] = *MEMORY[0x1E4F3B788];
      v39[1] = v29;
      uint64_t v30 = *MEMORY[0x1E4F3B9A0];
      v40[0] = v10;
      v40[1] = v30;
      uint64_t v31 = *MEMORY[0x1E4F3BD08];
      v39[2] = *MEMORY[0x1E4F3BD48];
      v39[3] = v31;
      v40[2] = a1;
      v40[3] = MEMORY[0x1E4F1CC38];
      v39[4] = *MEMORY[0x1E4F3B558];
      v40[4] = *MEMORY[0x1E4F3B598];
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:5];
      uint64_t v21 = (void *)[v32 mutableCopy];

      if (v9) {
        [v21 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
      }
      if (v19) {
        [v21 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F3BCE8]];
      }
      if (v22) {
        [v21 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F3BCF0]];
      }
      if (!SecItemAdd((CFDictionaryRef)v21, 0))
      {
        uint64_t v23 = 1;
        goto LABEL_27;
      }
      uint64_t v35 = createMobileActivationError((uint64_t)"store_keychain_item", 717, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to add %@ to keychain: %d", v33, v34, (uint64_t)v10);
    }
    else
    {
      uint64_t v35 = createMobileActivationError((uint64_t)"store_keychain_item", 684, @"com.apple.MobileActivation.ErrorDomain", -1, v20, @"Failed to delete existing keychain item.", v27, v28, v37);

      uint64_t v21 = 0;
    }
    id v20 = (id)v35;
    if (!a5) {
      goto LABEL_25;
    }
    goto LABEL_8;
  }
  createMobileActivationError((uint64_t)"store_keychain_item", 667, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).", v12, v13, v37);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = 0;
  id v19 = 0;
  int v22 = 0;
  if (!a5)
  {
LABEL_25:
    uint64_t v23 = 0;
    goto LABEL_27;
  }
LABEL_8:
  id v20 = v20;
  uint64_t v23 = 0;
  *a5 = v20;
LABEL_27:

  return v23;
}

id copy_keychain_data(void *a1, void *a2, OSStatus *a3, void *a4)
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v11 = v8;
  CFTypeRef result = 0;
  if (v8)
  {
    uint64_t v12 = *MEMORY[0x1E4F3B978];
    v26[0] = *MEMORY[0x1E4F3B788];
    v26[1] = v12;
    uint64_t v13 = *MEMORY[0x1E4F3B988];
    v27[0] = v8;
    v27[1] = v13;
    uint64_t v14 = *MEMORY[0x1E4F3BD08];
    v26[2] = *MEMORY[0x1E4F3BC70];
    v26[3] = v14;
    v27[2] = MEMORY[0x1E4F1CC38];
    v27[3] = MEMORY[0x1E4F1CC38];
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
    uint64_t v16 = (void *)[v15 mutableCopy];

    if (v7) {
      [v16 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    }
    OSStatus v19 = SecItemCopyMatching((CFDictionaryRef)v16, &result);
    if (v19)
    {
      id v20 = createMobileActivationError((uint64_t)"copy_keychain_data", 810, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy keychain item %@: %d", v17, v18, (uint64_t)v11);
      uint64_t v21 = 0;
      if (!a3) {
        goto LABEL_9;
      }
    }
    else
    {
      id v20 = 0;
      uint64_t v21 = (void *)result;
      CFTypeRef result = 0;
      if (!a3) {
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  id v20 = createMobileActivationError((uint64_t)"copy_keychain_data", 788, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.", v9, v10, v24);
  uint64_t v21 = 0;
  uint64_t v16 = 0;
  OSStatus v19 = -1;
  if (a3) {
LABEL_8:
  }
    *a3 = v19;
LABEL_9:
  if (a4 && !v21) {
    *a4 = v20;
  }
  if (result) {
    CFRelease(result);
  }
  CFTypeRef result = 0;
  id v22 = v21;

  return v22;
}

uint64_t delete_keychain_data(void *a1, void *a2, void *a3)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v9 = v6;
  if (!v6)
  {
    createMobileActivationError((uint64_t)"delete_keychain_data", 841, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).", v7, v8, v21);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = 0;
    if (!a3)
    {
LABEL_13:
      uint64_t v18 = 0;
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  uint64_t v10 = *MEMORY[0x1E4F3B978];
  v22[0] = *MEMORY[0x1E4F3B788];
  v22[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F3B988];
  v23[0] = v6;
  v23[1] = v11;
  v22[2] = *MEMORY[0x1E4F3BD08];
  v23[2] = MEMORY[0x1E4F1CC38];
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  uint64_t v13 = (void *)[v12 mutableCopy];

  if (v5) {
    [v13 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  }
  OSStatus v14 = SecItemDelete((CFDictionaryRef)v13);
  if (v14 != -25300 && v14 != 0)
  {
    createMobileActivationError((uint64_t)"delete_keychain_data", 862, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to remove existing keychain item %@: %d", v15, v16, (uint64_t)v9);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_13;
    }
LABEL_11:
    id v19 = v19;
    uint64_t v18 = 0;
    *a3 = v19;
    goto LABEL_14;
  }
  id v19 = 0;
  uint64_t v18 = 1;
LABEL_14:

  return v18;
}

uint64_t store_keychain_data(void *a1, void *a2, void *a3, void *a4)
{
  v31[7] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v12 = v9;
  if (v7 && v9)
  {
    id v29 = 0;
    char v13 = delete_keychain_data(v8, v9, &v29);
    id v16 = v29;
    if (v13)
    {
      uint64_t v17 = *MEMORY[0x1E4F3B978];
      v30[0] = *MEMORY[0x1E4F3B788];
      v30[1] = v17;
      uint64_t v18 = *MEMORY[0x1E4F3B988];
      v31[0] = v12;
      v31[1] = v18;
      uint64_t v19 = *MEMORY[0x1E4F3BD08];
      v30[2] = *MEMORY[0x1E4F3BD38];
      v30[3] = v19;
      v31[2] = v7;
      v31[3] = MEMORY[0x1E4F1CC38];
      uint64_t v20 = *MEMORY[0x1E4F3B5C0];
      v30[4] = *MEMORY[0x1E4F3B850];
      void v30[5] = v20;
      v31[4] = @"com.apple.mobileactivationd";
      v31[5] = v12;
      v30[6] = *MEMORY[0x1E4F3B558];
      v31[6] = *MEMORY[0x1E4F3B598];
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:7];
      id v22 = (void *)[v21 mutableCopy];

      if (v8) {
        [v22 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
      }
      if (!SecItemAdd((CFDictionaryRef)v22, 0))
      {
        uint64_t v26 = 1;
        goto LABEL_14;
      }
      uint64_t v25 = createMobileActivationError((uint64_t)"store_keychain_data", 920, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to add %@ to keychain: %d", v23, v24, (uint64_t)v12);
    }
    else
    {
      uint64_t v25 = createMobileActivationError((uint64_t)"store_keychain_data", 892, @"com.apple.MobileActivation.ErrorDomain", -1, v16, @"Failed to delete existing keychain item.", v14, v15, v28);

      id v22 = 0;
    }
    id v16 = (id)v25;
    if (!a4) {
      goto LABEL_12;
    }
  }
  else
  {
    createMobileActivationError((uint64_t)"store_keychain_data", 887, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).", v10, v11, v28);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = 0;
    if (!a4)
    {
LABEL_12:
      uint64_t v26 = 0;
      goto LABEL_14;
    }
  }
  id v16 = v16;
  uint64_t v26 = 0;
  *a4 = v16;
LABEL_14:

  return v26;
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __LocalAuthenticationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6CD5D10;
    uint64_t v5 = 0;
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LocalAuthenticationLibraryCore_frameworkLibrary) {
    __getLAContextClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("LAContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLAContextClass_block_invoke_cold_2();
  }
  getLAContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LocalAuthenticationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationLibraryCore_frameworkLibrary = result;
  return result;
}

id lockcrypto_query_certificate_properties(uint64_t a1, void *a2, void *a3)
{
  v214[14] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v8 = v5;
  uint64_t v199 = 0;
  uint64_t v200 = 0;
  v197[1] = 0;
  uint64_t v198 = 0;
  unint64_t v196 = 0;
  v197[0] = 0;
  long long v195 = 0uLL;
  long long v193 = 0uLL;
  unint64_t v194 = 0;
  int v192 = 0;
  unint64_t v191 = 0;
  BOOL v190 = 0;
  if (!a1 || !v5)
  {
    createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 229, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).", v6, v7, v174);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = 0;
LABEL_15:
    id v16 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    goto LABEL_181;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v11)
  {
    createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 235, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate dictionary.", v9, v10, v174);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (MEMORY[0x1E4F3B478])
  {
    uint64_t v14 = (void *)SecCertificateCopyExtensionValue();
    id v15 = 0;
    if (!v14) {
      goto LABEL_179;
    }
    goto LABEL_6;
  }
  id v26 = v8;
  if (lockcrypto_query_oid_der_sequence_data_onceToken != -1) {
    dispatch_once(&lockcrypto_query_oid_der_sequence_data_onceToken, &__block_literal_global_1);
  }
  uint64_t v27 = (void *)SecCertificateCopyProperties();
  uint64_t v30 = v27;
  if (!v27)
  {
    v44 = createMobileActivationError((uint64_t)"lockcrypto_query_oid_der_sequence_data", 137, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy certificate properties.", v28, v29, v174);
    id v32 = 0;
    goto LABEL_177;
  }
  v175 = v27;
  uint64_t v176 = v8;
  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  id v31 = v27;
  uint64_t v185 = [v31 countByEnumeratingWithState:&v205 objects:&v212 count:16];
  id v32 = 0;
  if (!v185) {
    goto LABEL_53;
  }
  id v182 = v11;
  uint64_t v184 = *(void *)v206;
  id v179 = v26;
  v180 = a3;
  id v178 = v31;
  do
  {
    uint64_t v33 = 0;
    do
    {
      if (*(void *)v206 != v184) {
        objc_enumerationMutation(v31);
      }
      uint64_t v34 = *(void **)(*((void *)&v205 + 1) + 8 * v33);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v35 = [v34 objectForKeyedSubscript:@"label"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v35 isEqualToString:v26])
        {
          uint64_t v36 = [v34 objectForKeyedSubscript:@"value"];

          if (v36)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v203 = 0u;
              long long v204 = 0u;
              long long v201 = 0u;
              long long v202 = 0u;
              id v32 = v36;
              uint64_t v37 = [v32 countByEnumeratingWithState:&v201 objects:&v209 count:16];
              if (!v37) {
                goto LABEL_46;
              }
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v202;
              while (1)
              {
                for (uint64_t i = 0; i != v38; ++i)
                {
                  if (*(void *)v202 != v39) {
                    objc_enumerationMutation(v32);
                  }
                  uint64_t v41 = *(void **)(*((void *)&v201 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    uint64_t v42 = 0;
LABEL_43:
                    uint64_t v14 = 0;
                    goto LABEL_44;
                  }
                  uint64_t v42 = [v41 objectForKeyedSubscript:@"label"];
                  if (!v42) {
                    goto LABEL_43;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0
                    || ![v42 isEqualToString:@"Unparsed Data"])
                  {
                    goto LABEL_43;
                  }
                  uint64_t v14 = [v41 objectForKeyedSubscript:@"value"];
                  if (v14)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0
                      && ![v14 isEqualToData:lockcrypto_query_oid_der_sequence_data_ASN1DERNull])
                    {

                      CFDataRef v138 = 0;
                      uint64_t v30 = v175;
                      id v8 = v176;
                      a3 = v180;
                      id v11 = v182;
                      id v139 = v178;
                      id v26 = v179;
                      goto LABEL_178;
                    }
                  }
LABEL_44:
                }
                uint64_t v38 = [v32 countByEnumeratingWithState:&v201 objects:&v209 count:16];
                if (!v38)
                {
LABEL_46:

                  a3 = v180;
                  id v11 = v182;
                  id v31 = v178;
                  id v26 = v179;
                  goto LABEL_48;
                }
              }
            }
            id v32 = v36;
          }
          else
          {
            id v32 = 0;
          }
        }
      }
      else
      {
        uint64_t v35 = 0;
      }
LABEL_48:

      ++v33;
    }
    while (v33 != v185);
    uint64_t v43 = [v31 countByEnumeratingWithState:&v205 objects:&v212 count:16];
    uint64_t v185 = v43;
  }
  while (v43);
LABEL_53:

  v44 = 0;
  uint64_t v30 = v175;
  id v8 = v176;
LABEL_177:
  id v139 = v44;
  uint64_t v14 = 0;
  CFDataRef v138 = v139;
LABEL_178:

  id v15 = v138;
  if (v14)
  {
LABEL_6:
    id v16 = v14;
    uint64_t v199 = [v16 bytes];
    uint64_t v200 = [v16 length];
    uint64_t v17 = DERDecodeSeqInit((uint64_t)&v199, &v198, v197);
    if (v17 == 2)
    {
      uint64_t v17 = DERDecodeItem((uint64_t)&v199, (unint64_t *)&v195);
      if (!v17 && (void)v195 == 4) {
        uint64_t v17 = DERDecodeSeqInit((uint64_t)&v195 + 8, &v198, v197);
      }
    }
    if (v17)
    {
      uint64_t v174 = v17;
      uint64_t v20 = @"Failed to intialize DER sequence: %d";
      uint64_t v21 = 267;
LABEL_12:
      uint64_t v22 = createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", v21, @"com.apple.MobileActivation.ErrorDomain", -1, 0, v20, v18, v19, v174);

      goto LABEL_180;
    }
    if (v198 != 0x2000000000000010)
    {
      if (v198 != 0x2000000000000011)
      {
        uint64_t v20 = @"Expected ASN1_CONSTR_SET or ASN1_CONSTR_SEQUENCE tag.";
        uint64_t v21 = 717;
        goto LABEL_12;
      }
      long long v205 = 0uLL;
      long long v201 = 0uLL;
      uint64_t v212 = 0;
      v213 = 0;
      v214[0] = 0;
      uint64_t v45 = DERDecodeSeqNext(v197, (unint64_t *)&v195);
      uint64_t v48 = 0;
      v181 = a3;
      id v183 = v11;
      if (v45 || (uint64_t v49 = *((void *)&v195 + 1)) == 0)
      {
        uint64_t v24 = 0;
        uint64_t v25 = 0;
LABEL_226:
        a3 = v181;
        if (v45 != 1)
        {
          uint64_t v166 = createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 468, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to decode DER sequence: %d", v46, v47, v45);

          id v15 = (id)v166;
        }
        uint64_t v23 = (void *)v48;
        goto LABEL_181;
      }
      uint64_t v25 = 0;
      uint64_t v24 = 0;
      uint64_t v23 = 0;
      v50 = @"com.apple.MobileActivation.ErrorDomain";
      while (1)
      {
        *(void *)&long long v205 = v49;
        *((void *)&v205 + 1) = v196;
        uint64_t v51 = DERDecodeSeqInit((uint64_t)&v205, &v198, &v201);
        if (v51)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 479, v50, -1, 0, @"Failed to intialize DER sequence: %d", v52, v53, v51);
          goto LABEL_240;
        }
        if (v198 != 0x2000000000000010)
        {
          uint64_t v168 = @"Expected ASN1_CONSTR_SEQUENCE tag.";
          uint64_t v169 = 484;
          goto LABEL_239;
        }
        uint64_t v54 = DERDecodeSeqNext((unint64_t *)&v201, (unint64_t *)&v212);
        if (v54 || !v213)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 492, v50, -1, 0, @"Failed to decode DER sequence: %d", v52, v53, v54);
          goto LABEL_240;
        }
        if (v212 != 22)
        {
          uint64_t v168 = @"Invalid DER tag.";
          uint64_t v169 = 497;
          goto LABEL_239;
        }
        uint64_t v55 = DERParseInteger((char **)&v213, &v192);
        if (v55) {
          break;
        }
        if (v214[0] != 4)
        {
          uint64_t v174 = v214[0];
          uint64_t v168 = @"Invalid property key length: %ld";
          uint64_t v169 = 508;
LABEL_239:
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", v169, v50, -1, 0, v168, v52, v53, v174);
          uint64_t v170 = LABEL_240:;

LABEL_241:
          id v15 = (id)v170;
LABEL_249:
          a3 = v181;
          id v11 = v183;
          goto LABEL_181;
        }
        id v56 = [NSString alloc];
        uint64_t v48 = [v56 initWithBytes:v213 length:v214[0] encoding:1];

        if (!v48)
        {
          uint64_t v170 = createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 514, v50, -1, 0, @"Failed to create string.", v57, v58, v174);

          uint64_t v23 = 0;
          goto LABEL_241;
        }
        uint64_t v59 = DERDecodeSeqNext((unint64_t *)&v201, (unint64_t *)&v212);
        if (v59 || !v213)
        {
          uint64_t v174 = v59;
          uint64_t v172 = @"Failed to decode DER sequence: %d";
          uint64_t v173 = 520;
LABEL_244:
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", v173, v50, -1, 0, v172, v60, v61, v174);
          goto LABEL_245;
        }
        if (v212 <= 1)
        {
          switch(v212)
          {
            case 0xA000000000000000:
              uint64_t v73 = v11;
              uint64_t v74 = &unk_1F38E5220;
              break;
            case 0xA000000000000001:
              uint64_t v73 = v11;
              uint64_t v74 = &unk_1F38E5238;
              break;
            case 1:
              uint64_t v62 = DERParseBoolean(&v213, &v190);
              if (!v62)
              {
                uint64_t v65 = [NSNumber numberWithBool:v190];
LABEL_92:
                uint64_t v78 = (void *)v65;
                [v11 setObject:v65 forKeyedSubscript:v48];

                goto LABEL_155;
              }
              createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 559, v50, -1, 0, @"Failed to decode DER encoded ASN1_BOOLEAN: %d", v63, v64, v62);
              goto LABEL_245;
            default:
              goto LABEL_155;
          }
LABEL_148:
          [v73 setObject:v74 forKeyedSubscript:v48];
          goto LABEL_155;
        }
        if (v212 == 2)
        {
          uint64_t v75 = DERParseInteger64((char **)&v213, &v191);
          if (!v75)
          {
            uint64_t v65 = [NSNumber numberWithUnsignedLongLong:v191];
            goto LABEL_92;
          }
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 551, v50, -1, 0, @"Failed to decode DER encoded ASN1_INTEGER: %d", v76, v77, v75);
          goto LABEL_245;
        }
        if (v212 != 0x2000000000000011)
        {
          if (v212 != 4) {
            goto LABEL_155;
          }

          if (v214[0])
          {
            uint64_t v66 = 0;
            int v67 = 0;
            while (((char)v213[v66] & 0x80000000) == 0)
            {
              uint64_t v66 = ++v67;
              if (v214[0] <= (unint64_t)v67)
              {
                int v68 = DERDecodeItem((uint64_t)&v213, (unint64_t *)&v193);
                id v69 = [NSString alloc];
                v70 = (unsigned __int8 **)&v193 + 1;
                if (v68) {
                  v70 = &v213;
                }
                uint64_t v71 = *v70;
                uint64_t v72 = (uint64_t *)&v194;
                if (v68) {
                  uint64_t v72 = v214;
                }
                uint64_t v25 = (void *)[v69 initWithBytes:v71 length:*v72 encoding:1];
                if (!v25)
                {
                  uint64_t v172 = @"Failed to decode DER encoded ANS1_OCTET_STRING.";
                  uint64_t v173 = 536;
                  goto LABEL_244;
                }
                goto LABEL_144;
              }
            }
          }
          id v127 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          uint64_t v128 = [v127 initWithBytes:v213 length:v214[0]];

          if (!v128)
          {
            uint64_t v171 = createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 542, v50, -1, 0, @"Failed to decode DER encoded ANS1_OCTET_STRING.", v129, v130, v174);

            uint64_t v24 = 0;
            uint64_t v25 = 0;
            goto LABEL_246;
          }
          uint64_t v25 = 0;
          uint64_t v24 = (void *)v128;
LABEL_144:
          if (v25) {
            uint64_t v74 = v25;
          }
          else {
            uint64_t v74 = v24;
          }
          uint64_t v73 = v11;
          goto LABEL_148;
        }
        v79 = DERDecodeSeqContentInit((unint64_t *)&v213, (unint64_t *)&v201);
        if (v79)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 571, v50, -1, 0, @"Failed to intialize DER sequence: %d", v80, v81, (uint64_t)v79);
          uint64_t v171 = LABEL_245:;

LABEL_246:
          id v15 = (id)v171;
LABEL_248:
          uint64_t v23 = (void *)v48;
          goto LABEL_249;
        }
        id v82 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v11 setObject:v82 forKeyedSubscript:v48];

        v188 = 0;
        uint64_t v189 = 0;
        unint64_t v186 = 0;
        uint64_t v187 = 0;
        uint64_t v209 = 0;
        v210 = 0;
        unint64_t v211 = 0;
        uint64_t v83 = DERDecodeSeqNext((unint64_t *)&v201, (unint64_t *)&v212);
        if (!v83)
        {
          uint64_t v86 = v213;
          v177 = v8;
          if (v213)
          {
            while (1)
            {
              v188 = v86;
              uint64_t v189 = v214[0];
              uint64_t v87 = DERDecodeSeqInit((uint64_t)&v188, &v198, &v186);
              if (v87)
              {
                createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 601, v50, -1, 0, @"Failed to intialize DER sequence: %d", v84, v85, v87);
                goto LABEL_153;
              }
              if (v198 != 0x2000000000000010)
              {
                uint64_t v131 = 606;
                v132 = v50;
                uint64_t v133 = @"Expected ASN1_CONSTR_SEQUENCE tag.";
                goto LABEL_152;
              }
              uint64_t v88 = DERDecodeSeqNext(&v186, (unint64_t *)&v209);
              if (v88 || !v210)
              {
                uint64_t v174 = v88;
                uint64_t v131 = 614;
                goto LABEL_151;
              }
              if (v209 != 22)
              {
                uint64_t v131 = 619;
                v132 = v50;
                uint64_t v133 = @"Invalid DER tag.";
                goto LABEL_152;
              }
              uint64_t v89 = DERParseInteger((char **)&v210, &v192);
              if (v89)
              {
                createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 625, v50, -1, 0, @"Failed to parse DER integer: %d", v90, v91, v89);
                goto LABEL_153;
              }
              if (v211 != 4)
              {
                createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 630, v50, -1, 0, @"Invalid property key length: %ld", v90, v91, v214[0]);
                goto LABEL_153;
              }
              v92 = v50;
              id v93 = [NSString alloc];
              uint64_t v94 = [v93 initWithBytes:v210 length:v211 encoding:1];
              if (!v94)
              {
                uint64_t v131 = 636;
                v132 = v50;
                uint64_t v133 = @"Failed to create string.";
                goto LABEL_152;
              }
              uint64_t v95 = (void *)v94;
              uint64_t v96 = DERDecodeSeqNext(&v186, (unint64_t *)&v209);
              if (v96 || !v210)
              {
                createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 644, v92, -1, 0, @"Failed to decode DER sequence: %d", v97, v98, v96);
                uint64_t v134 = LABEL_169:;

                id v15 = v95;
                v50 = v92;
                goto LABEL_154;
              }
              if (v209 > 0) {
                break;
              }
              if (v209 == 0xA000000000000000)
              {
                char v108 = [v11 objectForKeyedSubscript:v48];
                uint64_t v109 = v108;
                uint64_t v110 = &unk_1F38E5220;
              }
              else
              {
                if (v209 != 0xA000000000000001) {
                  goto LABEL_138;
                }
                char v108 = [v11 objectForKeyedSubscript:v48];
                uint64_t v109 = v108;
                uint64_t v110 = &unk_1F38E5238;
              }
              [v108 setObject:v110 forKeyedSubscript:v95];
LABEL_137:

LABEL_138:
              uint64_t v124 = DERDecodeSeqNext(&v186, (unint64_t *)&v209);
              if (v124 != 1)
              {
                createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 696, v92, -1, 0, @"DER sequence is invalid: %d", v125, v126, v124);
                goto LABEL_169;
              }

              v188 = 0;
              uint64_t v189 = 0;
              unint64_t v186 = 0;
              uint64_t v187 = 0;
              uint64_t v209 = 0;
              v210 = 0;
              unint64_t v211 = 0;
              uint64_t v83 = DERDecodeSeqNext((unint64_t *)&v201, (unint64_t *)&v212);
              if (v83)
              {
                v50 = v92;
                goto LABEL_149;
              }
              uint64_t v86 = v213;
              v50 = v92;
              if (!v213) {
                goto LABEL_149;
              }
            }
            switch(v209)
            {
              case 1:
                uint64_t v111 = DERParseBoolean(&v210, &v190);
                if (v111)
                {
                  createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 683, v92, -1, 0, @"Failed to decode DER encoded ASN1_BOOLEAN: %d", v112, v113, v111);
                  goto LABEL_174;
                }
                uint64_t v114 = [NSNumber numberWithBool:v190];
                break;
              case 2:
                uint64_t v115 = DERParseInteger64((char **)&v210, &v191);
                if (v115)
                {
                  createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 675, v92, -1, 0, @"Failed to decode DER encoded ASN1_INTEGER: %d", v116, v117, v115);
                  uint64_t v134 = LABEL_174:;

LABEL_175:
                  id v15 = v95;
                  v50 = v92;
                  id v8 = v177;
LABEL_154:

                  id v15 = (id)v134;
                  goto LABEL_155;
                }
                uint64_t v114 = [NSNumber numberWithUnsignedLongLong:v191];
                break;
              case 4:

                if (v211)
                {
                  uint64_t v99 = 0;
                  int v100 = 0;
                  while (((char)v210[v99] & 0x80000000) == 0)
                  {
                    uint64_t v99 = ++v100;
                    if (v211 <= v100)
                    {
                      int v101 = DERDecodeItem((uint64_t)&v210, (unint64_t *)&v193);
                      id v102 = [NSString alloc];
                      uint64_t v103 = (unsigned __int8 **)&v193 + 1;
                      if (v101) {
                        uint64_t v103 = &v210;
                      }
                      uint64_t v104 = *v103;
                      v105 = &v194;
                      if (v101) {
                        v105 = &v211;
                      }
                      uint64_t v25 = (void *)[v102 initWithBytes:v104 length:*v105 encoding:1];
                      if (!v25)
                      {
                        createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 660, v92, -1, 0, @"Failed to decode DER encoded ANS1_OCTET_STRING.", v106, v107, v174);
                        goto LABEL_174;
                      }
                      goto LABEL_132;
                    }
                  }
                }
                id v119 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                uint64_t v120 = [v119 initWithBytes:v210 length:v211];

                if (!v120)
                {
                  uint64_t v134 = createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 666, v92, -1, 0, @"Failed to decode DER encoded ANS1_OCTET_STRING.", v121, v122, v174);

                  uint64_t v24 = 0;
                  uint64_t v25 = 0;
                  goto LABEL_175;
                }
                uint64_t v25 = 0;
                uint64_t v24 = (void *)v120;
LABEL_132:
                if (v25) {
                  v123 = v25;
                }
                else {
                  v123 = v24;
                }
                uint64_t v109 = [v11 objectForKeyedSubscript:v48];
                [v109 setObject:v123 forKeyedSubscript:v95];
                goto LABEL_136;
              default:
                goto LABEL_138;
            }
            uint64_t v109 = (void *)v114;
            uint64_t v118 = [v11 objectForKeyedSubscript:v48];
            [v118 setObject:v109 forKeyedSubscript:v95];

LABEL_136:
            id v8 = v177;
            goto LABEL_137;
          }
        }
LABEL_149:
        if (v83 != 1)
        {
          uint64_t v174 = v83;
          uint64_t v131 = 590;
LABEL_151:
          v132 = v50;
          uint64_t v133 = @"Failed to decode DER sequence: %d";
LABEL_152:
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", v131, v132, -1, 0, v133, v84, v85, v174);
          uint64_t v134 = LABEL_153:;
          goto LABEL_154;
        }
LABEL_155:
        if (v15) {
          goto LABEL_248;
        }
        uint64_t v135 = DERDecodeSeqNext((unint64_t *)&v201, (unint64_t *)&v212);
        if (v135 != 1)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 710, v50, -1, 0, @"DER sequence is invalid: %d", v136, v137, v135);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_248;
        }
        long long v205 = 0uLL;
        long long v201 = 0uLL;
        uint64_t v212 = 0;
        v213 = 0;
        v214[0] = 0;
        uint64_t v45 = DERDecodeSeqNext(v197, (unint64_t *)&v195);
        id v15 = 0;
        if (!v45)
        {
          uint64_t v49 = *((void *)&v195 + 1);
          uint64_t v23 = (void *)v48;
          if (*((void *)&v195 + 1)) {
            continue;
          }
        }
        goto LABEL_226;
      }
      createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 503, v50, -1, 0, @"Failed to parse DER integer: %d", v52, v53, v55);
      goto LABEL_240;
    }
    uint64_t v142 = DERDecodeSeqNext(v197, (unint64_t *)&v195);
    uint64_t v23 = 0;
    v181 = a3;
    id v183 = v11;
    if (v142 || !*((void *)&v195 + 1))
    {
      uint64_t v24 = 0;
      uint64_t v25 = 0;
LABEL_230:
      if (v142 != 1)
      {
        uint64_t v167 = createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 299, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to decode DER sequence: %d", v143, v144, v142);

        id v15 = (id)v167;
      }
      goto LABEL_249;
    }
    uint64_t v25 = 0;
    uint64_t v24 = 0;
    uint64_t v23 = 0;
    while (1)
    {
      uint64_t v145 = v23;
      v146 = [NSNumber numberWithUnsignedLongLong:(unint64_t)v195 & 0x5FFFFFFFFFFFFFFFLL];
      uint64_t v23 = [v146 stringValue];

      if (!DERDecodeItem((uint64_t)&v195 + 8, (unint64_t *)&v193))
      {
        long long v195 = v193;
        unint64_t v196 = v194;
      }
      uint64_t v147 = v195 & 0x5FFFFFFFFFFFFFFFLL;
      if ((v195 & 0x5FFFFFFFFFFFFFFFLL) == 1)
      {
        uint64_t v153 = DERParseBoolean((unsigned __int8 **)&v195 + 1, &v190);
        if (v153)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 353, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to decode DER encoded ASN1_BOOLEAN: %d", v154, v155, v153);
          goto LABEL_208;
        }
        uint64_t v164 = [NSNumber numberWithBool:v190];
      }
      else
      {
        if (v147 != 2)
        {
          if (v147 != 4) {
            goto LABEL_219;
          }

          if (v196)
          {
            uint64_t v148 = 0;
            int v149 = 0;
            while ((*(char *)(*((void *)&v195 + 1) + v148) & 0x80000000) == 0)
            {
              uint64_t v148 = ++v149;
              if (v196 <= v149)
              {
                id v150 = [NSString alloc];
                uint64_t v25 = (void *)[v150 initWithBytes:*((void *)&v195 + 1) length:v196 encoding:1];
                if (v25)
                {
                  uint64_t v24 = 0;
                  goto LABEL_212;
                }
                uint64_t v159 = createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 326, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to decode DER encoded ANS1_OCTET_STRING.", v151, v152, v174);

                uint64_t v24 = 0;
                goto LABEL_209;
              }
            }
          }
          id v160 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          uint64_t v24 = (void *)[v160 initWithBytes:*((void *)&v195 + 1) length:v196];
          if (v24)
          {
            uint64_t v25 = 0;
LABEL_212:
            if (v25) {
              v163 = v25;
            }
            else {
              v163 = v24;
            }
            [v11 setObject:v163 forKeyedSubscript:v23];
            goto LABEL_219;
          }
          uint64_t v159 = createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 332, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to decode DER encoded ANS1_OCTET_STRING.", v161, v162, v174);

          uint64_t v25 = 0;
          goto LABEL_209;
        }
        uint64_t v156 = DERParseInteger64((char **)&v195 + 1, &v191);
        if (v156)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 343, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to decode DER encoded ASN1_INTEGER: %d", v157, v158, v156);
          uint64_t v159 = LABEL_208:;

LABEL_209:
          id v15 = (id)v159;
          goto LABEL_219;
        }
        uint64_t v164 = [NSNumber numberWithUnsignedLongLong:v191];
      }
      uint64_t v165 = (void *)v164;
      [v11 setObject:v164 forKeyedSubscript:v23];

LABEL_219:
      uint64_t v142 = DERDecodeSeqNext(v197, (unint64_t *)&v195);
      if (v142 || !*((void *)&v195 + 1)) {
        goto LABEL_230;
      }
    }
  }
LABEL_179:
  uint64_t v22 = createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 245, @"com.apple.MobileActivation.ErrorDomain", -1, v15, @"Failed to query DERSequence data for OID %@.", v12, v13, (uint64_t)v8);

  id v16 = 0;
LABEL_180:
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  id v15 = (id)v22;
LABEL_181:
  if (v15)
  {
LABEL_182:

LABEL_183:
    id v11 = 0;
    if (a3) {
      *a3 = v15;
    }
  }
  else
  {
    if (!v11) {
      goto LABEL_183;
    }
    if (![v11 count]) {
      goto LABEL_182;
    }
  }
  id v140 = v11;

  return v140;
}

id lockcrypto_decode_pem(void *a1, const char *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v8 = v5;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  *(_OWORD *)__str = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  *(_OWORD *)__little = 0u;
  long long v28 = 0u;
  if (v5 && a2)
  {
    id v9 = v5;
    uint64_t v10 = (const char *)[v9 bytes];
    uint64_t v11 = [v9 length];
    if (v11 < 0)
    {
      uint64_t v22 = @"Invalid data length.";
      uint64_t v23 = 1496;
    }
    else
    {
      size_t v12 = v11;
      int v13 = snprintf(__str, 0x50uLL, "-----BEGIN %s-----\n", a2);
      snprintf(__little, 0x50uLL, "\n-----END %s-----", a2);
      uint64_t v14 = strnstr(v10, __str, v12);
      id v15 = strnstr(v10, __little, v12);
      if (v14 && v15)
      {
        id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:&v14[v13] length:v15 - &v14[v13] freeWhenDone:0];
        uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedData:v16 options:1];
        if (v17)
        {
          uint64_t v20 = (void *)v17;
          id v21 = 0;
          goto LABEL_16;
        }
        createMobileActivationError((uint64_t)"lockcrypto_decode_pem", 1516, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to decode data.", v18, v19, v26);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        if (!a3) {
          goto LABEL_15;
        }
LABEL_13:
        id v21 = v21;
        uint64_t v20 = 0;
        *a3 = v21;
        goto LABEL_16;
      }
      uint64_t v22 = @"Invalid pem data.";
      uint64_t v23 = 1505;
    }
    uint64_t v24 = -1;
  }
  else
  {
    uint64_t v22 = @"Invalid inputs.";
    uint64_t v23 = 1489;
    uint64_t v24 = -2;
  }
  createMobileActivationError((uint64_t)"lockcrypto_decode_pem", v23, @"com.apple.MobileActivation.ErrorDomain", v24, 0, v22, v6, v7, v26);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = 0;
  if (a3) {
    goto LABEL_13;
  }
LABEL_15:
  uint64_t v20 = 0;
LABEL_16:

  return v20;
}

SecCertificateRef lockcrypto_cert_from_pem_data(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v6 = v3;
  if (!v3)
  {
    createMobileActivationError((uint64_t)"lockcrypto_cert_from_pem_data", 1734, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.", v4, v5, v18);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    CFDataRef v7 = 0;
    if (!a2)
    {
LABEL_10:
      SecCertificateRef v12 = 0;
      goto LABEL_11;
    }
LABEL_6:
    id v10 = v10;
    SecCertificateRef v12 = 0;
    *a2 = v10;
    goto LABEL_11;
  }
  id v19 = 0;
  lockcrypto_decode_pem(v3, "CERTIFICATE", &v19);
  CFDataRef v7 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  id v10 = v19;
  if (!v7)
  {
    int v13 = @"Failed to decode data.";
    uint64_t v14 = 1740;
    id v15 = v10;
    goto LABEL_9;
  }
  SecCertificateRef v11 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7);
  if (!v11)
  {
    int v13 = @"Failed to create certificate with cert data.";
    uint64_t v14 = 1746;
    id v15 = 0;
LABEL_9:
    uint64_t v16 = createMobileActivationError((uint64_t)"lockcrypto_cert_from_pem_data", v14, @"com.apple.MobileActivation.ErrorDomain", -1, v15, v13, v8, v9, v18);

    id v10 = (id)v16;
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  SecCertificateRef v12 = v11;
LABEL_11:

  return v12;
}

uint64_t __lockcrypto_query_oid_der_sequence_data_block_invoke()
{
  lockcrypto_query_oid_der_sequence_data_ASN1DERNull = [MEMORY[0x1E4F1C9B8] dataWithBytes:&unk_1DD6F6BF8 length:2];
  return MEMORY[0x1F41817F8]();
}

id DeviceIdentityCopyAttestationDictionary(__SecKey *a1, void *a2, void *a3)
{
  v138[1] = *MEMORY[0x1E4F143B8];
  id v106 = a2;
  uint64_t v127 = 0;
  uint64_t v128 = &v127;
  uint64_t v129 = 0x3032000000;
  uint64_t v130 = __Block_byref_object_copy_;
  uint64_t v131 = __Block_byref_object_dispose_;
  id v132 = 0;
  uint64_t v121 = 0;
  uint64_t v122 = &v121;
  uint64_t v123 = 0x3032000000;
  uint64_t v124 = __Block_byref_object_copy_;
  uint64_t v125 = __Block_byref_object_dispose_;
  id v126 = 0;
  CFErrorRef error = 0;
  char v119 = 0;
  if (is_virtual_machine())
  {
    uint64_t v8 = (id *)(v122 + 5);
    id obj = (id)v122[5];
    has_host_SecKeyRef key = libavp_guest_has_host_key(&obj);
    objc_storeStrong(v8, obj);
    if ((has_host_key & 1) == 0)
    {
      uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 354, @"com.apple.MobileActivation.ErrorDomain", -3, (void *)v122[5], @"Not supported on this device (VM support disabled).", v6, v7, v102);
      goto LABEL_32;
    }
  }
  if (!a1
    || (id v10 = (id *)(v122 + 5),
        id v117 = (id)v122[5],
        char valid = security_valid_security_enclave_reference_key(a1, 0, &v119, &v117, v4, v5, v6, v7),
        objc_storeStrong(v10, v117),
        (valid & 1) == 0))
  {
    uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 359, @"com.apple.MobileActivation.ErrorDomain", -2, (void *)v122[5], @"Invalid reference key.", v6, v7, v102);
LABEL_32:
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    id v107 = 0;
    char v108 = 0;
    CFDataRef v104 = 0;
    v105 = 0;
    uint64_t v109 = 0;
    id v40 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    task = 0;
LABEL_33:
    v44 = 0;
    goto LABEL_34;
  }
  SecCertificateRef v12 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  task = v12;
  if (!v12)
  {
    uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 365, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create task.", v13, v14, v102);
    goto LABEL_32;
  }
  uint64_t v109 = (__CFString *)SecTaskCopySigningIdentifier(v12, &error);
  if (!v109)
  {
    uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 371, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to query code signing identifier.", v15, v16, v102);
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    id v107 = 0;
    char v108 = 0;
    CFDataRef v104 = 0;
    uint64_t v109 = 0;
LABEL_53:
    id v40 = 0;
    uint64_t v41 = 0;
    v105 = 0;
LABEL_54:
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    goto LABEL_33;
  }
  char v108 = (void *)SecTaskCopyValueForEntitlement(task, @"com.apple.mobileactivationd.spi", &error);
  uint64_t v17 = isNSNumber(v108);
  if (!v17 || (char v18 = [v108 BOOLValue], v17, (v18 & 1) == 0))
  {
    CFErrorRef v51 = error;
    uint64_t v137 = @"com.apple.mobileactivationd.spi";
    v138[0] = MEMORY[0x1E4F1CC38];
    uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v138 forKeys:&v137 count:1];
    uint64_t v54 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 377, @"com.apple.MobileActivation.ErrorDomain", -7, v51, @"Missing required entitlement: %@", v52, v53, (uint64_t)v46);
    uint64_t v55 = (void *)v122[5];
    v122[5] = v54;

    uint64_t v38 = 0;
    uint64_t v39 = 0;
    id v107 = 0;
    CFDataRef v104 = 0;
    v105 = 0;
    id v40 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    v44 = 0;
    uint64_t v45 = 0;
    goto LABEL_36;
  }
  id v107 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v107)
  {
    uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 383, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate dictionary.", v19, v20, v102);
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    id v107 = 0;
    CFDataRef v104 = 0;
    goto LABEL_53;
  }
  if (v106) {
    [v107 addEntriesFromDictionary:v106];
  }
  if (is_virtual_machine()) {
    [v107 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"scrtAttestation"];
  }
  id v21 = [v107 objectForKeyedSubscript:@"OIDSToInclude"];
  uint64_t v22 = isNSArray(v21);

  if (!v22)
  {
    v105 = 0;
LABEL_59:
    uint64_t v61 = objc_msgSend(v107, "objectForKeyedSubscript:");

    if (!v61) {
      goto LABEL_69;
    }
    if ((isRunningInRecovery() & 1) != 0 || isRunningInDiagnosticsMode())
    {
      uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 432, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Option (%@) not allowed for processes running in recoveryOS or diagnostics mode.", v62, v63, @"AccessControls");
LABEL_89:
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      CFDataRef v104 = 0;
      id v40 = 0;
      uint64_t v41 = 0;
      goto LABEL_54;
    }
    uint64_t v64 = [v107 objectForKeyedSubscript:@"ClientAttestationData"];
    uint64_t v65 = isNSData(v64);

    if (v65)
    {
      uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 437, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"ACLs (%@) not supported with %@.", v66, v67, @"AccessControls");
      goto LABEL_89;
    }
    uint64_t v73 = [v107 objectForKeyedSubscript:@"AccessControls"];
    CFTypeID v74 = CFGetTypeID(v73);
    LODWORD(v74) = v74 == SecAccessControlGetTypeID();

    if (v74)
    {
      v44 = [v107 objectForKeyedSubscript:@"AccessControls"];

      CFRetain(v44);
      unsigned int v75 = 1;
    }
    else
    {
LABEL_69:
      v44 = 0;
      unsigned int v75 = 0;
    }
    uint64_t v76 = [v107 objectForKeyedSubscript:@"AppID"];
    uint64_t v77 = isNSString(v76);

    if (v77)
    {
      uint64_t v78 = [v107 objectForKeyedSubscript:@"AppID"];

      uint64_t v109 = (__CFString *)v78;
    }
    v79 = [v107 objectForKeyedSubscript:@"UseXPC"];
    uint64_t v80 = isNSNumber(v79);

    if (v80)
    {
      uint64_t v81 = [v107 objectForKeyedSubscript:@"UseXPC"];
      LODWORD(v80) = [v81 BOOLValue];
    }
    if (v119) {
      uint64_t v82 = 1;
    }
    else {
      uint64_t v82 = v75;
    }
    uint64_t v42 = (__SecKey *)CFRetain(a1);
    uint64_t v83 = SecKeyCopyPublicKey(v42);
    uint64_t v43 = v83;
    if (v83)
    {
      CFDataRef v104 = SecKeyCopyExternalRepresentation(v83, &error);
      if (v104)
      {
        uint64_t v91 = (id *)(v122 + 5);
        id v115 = (id)v122[5];
        id v116 = 0;
        uint64_t v41 = security_create_external_representation(v42, &v116, &v115, v86, v87, v88, v89, v90);
        id v40 = v116;
        objc_storeStrong(v91, v115);
        if (v41)
        {
          uint64_t v94 = [NSNumber numberWithBool:v82];
          [v107 setObject:v94 forKeyedSubscript:@"UseRKSigningInterface"];

          [v107 setObject:v109 forKeyedSubscript:@"AppID"];
          [v107 setObject:v40 forKeyedSubscript:@"SigningKeyAttributes"];
          if (v80)
          {
            uint64_t v45 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38E82B8];
            uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mobileactivationd" options:0];
            [v38 setRemoteObjectInterface:v45];
            [v38 resume];
            uint64_t v39 = (void *)[v107 mutableCopy];
            uint64_t v95 = [v39 objectForKey:@"AccessControls"];

            if (v95)
            {
              [v39 removeObjectForKey:@"AccessControls"];
              [v39 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"UseRKSigningInterface"];
            }
            [v39 removeObjectForKey:@"LocalAuthenticationContext"];
            v114[0] = MEMORY[0x1E4F143A8];
            v114[1] = 3221225472;
            v114[2] = __DeviceIdentityCopyAttestationDictionary_block_invoke;
            v114[3] = &unk_1E6CD5D50;
            v114[4] = &v121;
            uint64_t v96 = [v38 synchronousRemoteObjectProxyWithErrorHandler:v114];
            v113[0] = MEMORY[0x1E4F143A8];
            v113[1] = 3221225472;
            v113[2] = __DeviceIdentityCopyAttestationDictionary_block_invoke_2;
            v113[3] = &unk_1E6CD5D78;
            v113[4] = &v127;
            v113[5] = &v121;
            [v96 copyAttestationDictionaryWithCompletionBlock:v41 options:v39 completion:v113];
            [v38 invalidate];
          }
          else
          {
            uint64_t v97 = (id *)(v122 + 5);
            id v112 = (id)v122[5];
            uint64_t v98 = create_baa_info(v42, v107, &v112);
            objc_storeStrong(v97, v112);
            uint64_t v38 = 0;
            uint64_t v39 = 0;
            uint64_t v45 = 0;
            uint64_t v96 = (void *)v128[5];
            v128[5] = v98;
          }

          int v101 = (void *)v128[5];
          if (v101)
          {
            id v47 = v101;
LABEL_39:
            CFRelease(task);
            uint64_t v48 = v47;
            goto LABEL_40;
          }
          uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 548, @"com.apple.MobileActivation.ErrorDomain", -1, (void *)v122[5], @"Failed to copy certificate info.", v99, v100, v102);
          goto LABEL_35;
        }
        uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 486, @"com.apple.MobileActivation.ErrorDomain", -1, (void *)v122[5], @"Failed to encode RK as data.", v92, v93, v102);
        uint64_t v38 = 0;
        uint64_t v39 = 0;
      }
      else
      {
        uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 480, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to encode RK public key as data.", v89, v90, v102);
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        CFDataRef v104 = 0;
        id v40 = 0;
      }
      uint64_t v41 = 0;
    }
    else
    {
      uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 474, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy RK public key.", v84, v85, v102);
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      CFDataRef v104 = 0;
      id v40 = 0;
      uint64_t v41 = 0;
      uint64_t v43 = 0;
    }
LABEL_34:
    uint64_t v45 = 0;
LABEL_35:
    uint64_t v46 = (void *)v122[5];
    v122[5] = v37;
    goto LABEL_36;
  }
  id v23 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v24 = [v107 objectForKeyedSubscript:@"OIDSToInclude"];
  v105 = (void *)[v23 initWithArray:v24];

  if (([v105 containsObject:@"1.2.840.113635.100.10.1"] & 1) == 0
    && ([v105 containsObject:@"1.2.840.113635.100.8.1"] & 1) == 0
    && ![v105 containsObject:@"1.2.840.113635.100.8.3"])
  {
    goto LABEL_21;
  }
  uint64_t v103 = (void *)SecTaskCopyValueForEntitlement(task, @"com.apple.mobileactivationd.device-identifiers", &error);

  uint64_t v25 = isNSNumber(v103);
  if (v25)
  {
    char v26 = [v103 BOOLValue];

    if (v26)
    {
      char v108 = v103;
LABEL_21:
      uint64_t v27 = copy_supported_eda_oids();
      int v28 = [v105 intersectsSet:v27];

      if (!v28)
      {
LABEL_26:
        if ([v105 containsObject:@"1.2.840.113635.100.8.6"])
        {
          long long v33 = objc_msgSend(v107, "objectForKeyedSubscript:");
          BOOL v34 = v33 == 0;

          if (v34)
          {
            uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 425, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Missing required option: %@", v35, v36, @"AccessControls");
            goto LABEL_89;
          }
        }
        goto LABEL_59;
      }
      if ((device_supports_eda_certificates() & 1) == 0)
      {
        uint64_t v37 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 413, @"com.apple.MobileActivation.ErrorDomain", -3, (void *)v122[5], @"Enterprise Device Attestation is not supported on this device.", v29, v30, v102);
        goto LABEL_89;
      }
      uint64_t v103 = (void *)SecTaskCopyValueForEntitlement(task, @"com.apple.mobileactivationd.eda", &error);

      long long v31 = isNSNumber(v103);
      if (v31)
      {
        char v32 = [v103 BOOLValue];

        if (v32)
        {
          char v108 = v103;
          goto LABEL_26;
        }
      }
      CFErrorRef v68 = error;
      uint64_t v133 = @"com.apple.mobileactivationd.eda";
      uint64_t v134 = MEMORY[0x1E4F1CC38];
      uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
      uint64_t v71 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 419, @"com.apple.MobileActivation.ErrorDomain", -7, v68, @"Missing required entitlement: %@", v69, v70, (uint64_t)v46);
      uint64_t v72 = (void *)v122[5];
      v122[5] = v71;

      goto LABEL_57;
    }
  }
  CFErrorRef v56 = error;
  uint64_t v135 = @"com.apple.mobileactivationd.device-identifiers";
  uint64_t v136 = MEMORY[0x1E4F1CC38];
  uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
  uint64_t v59 = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 406, @"com.apple.MobileActivation.ErrorDomain", -7, v56, @"Missing required entitlement: %@", v57, v58, (uint64_t)v46);
  uint64_t v60 = (void *)v122[5];
  v122[5] = v59;

LABEL_57:
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  CFDataRef v104 = 0;
  id v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  v44 = 0;
  uint64_t v45 = 0;
  char v108 = v103;
LABEL_36:

  if (a3) {
    *a3 = (id) v122[5];
  }
  id v47 = 0;
  uint64_t v48 = 0;
  if (task) {
    goto LABEL_39;
  }
LABEL_40:
  if (v42) {
    CFRelease(v42);
  }
  if (v43) {
    CFRelease(v43);
  }
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  if (v44) {
    CFRelease(v44);
  }
  id v49 = v48;

  _Block_object_dispose(&v121, 8);
  _Block_object_dispose(&v127, 8);

  return v49;
}

void sub_1DD6DEE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __DeviceIdentityCopyAttestationDictionary_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary_block_invoke", 530, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.", a7, a8, v10);
  return MEMORY[0x1F41817F8]();
}

void __DeviceIdentityCopyAttestationDictionary_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 objectForKeyedSubscript:@"RKCertification"];
  uint64_t v7 = isNSDictionary(v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  SecCertificateRef v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

id DeviceIdentityCreateClientCertificateRequest(CFTypeRef *a1, void *a2, void *a3)
{
  id v5 = a2;
  CFTypeRef cf = 0;
  id v6 = 0;
  if (is_virtual_machine())
  {
    id v62 = 0;
    has_host_SecKeyRef key = libavp_guest_has_host_key(&v62);
    id v6 = v62;
    if ((has_host_key & 1) == 0)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 591, @"com.apple.MobileActivation.ErrorDomain", -3, v6, @"Not supported on this device (VM support disabled).", v8, v9, v52);
      id v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
      id v23 = 0;
      id v24 = 0;
      uint64_t v25 = 0;
      char v26 = 0;
      uint64_t v27 = 0;
      int v28 = 0;
      char v18 = 0;
      if (!a3) {
        goto LABEL_40;
      }
      goto LABEL_38;
    }
  }
  id v61 = v6;
  char v10 = isSupportedDeviceIdentityClient(0, &v61);
  id v11 = v61;

  if ((v10 & 1) == 0)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 596, @"com.apple.MobileActivation.ErrorDomain", -25, v11, @"Client is not supported.", v12, v13, v52);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:@"ClientAttestationData"];
  uint64_t v15 = isNSData(v14);

  if (v15)
  {
    char v18 = (const void *)SecAccessControlCreate();
    if (!v18)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 608, @"com.apple.MobileActivation.ErrorDomain", -1, (void *)cf, @"Failed to create access control.", v16, v17, v52);
LABEL_16:
      id v22 = (id)objc_claimAutoreleasedReturnValue();

      id v23 = 0;
      id v24 = 0;
      uint64_t v25 = 0;
      char v26 = 0;
      uint64_t v27 = 0;
      int v28 = 0;
      if (!a3) {
        goto LABEL_40;
      }
      goto LABEL_38;
    }
    uint64_t v19 = *MEMORY[0x1E4F3B5A0];
    if ((SecAccessControlSetProtection() & 1) == 0)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 613, @"com.apple.MobileActivation.ErrorDomain", -1, (void *)cf, @"Failed to set ACL protection to %@.", v20, v21, v19);
      goto LABEL_16;
    }
  }
  else
  {
    char v18 = 0;
  }
  uint64_t v29 = [v5 objectForKeyedSubscript:@"UseSoftwareGeneratedKey"];
  uint64_t v30 = isNSNumber(v29);

  if (v30)
  {
    long long v31 = [v5 objectForKeyedSubscript:@"UseSoftwareGeneratedKey"];
    char v32 = [v31 BOOLValue];
  }
  else
  {
    char v32 = 1;
  }
  id v60 = v11;
  int v28 = (__SecKey *)createReferenceKeyBlob(v18, v32, v5, &v60);
  id v33 = v60;

  if (!v28)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 626, @"com.apple.MobileActivation.ErrorDomain", -1, v33, @"Failed to create reference key.", v34, v35, v52);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    id v23 = 0;
    goto LABEL_33;
  }
  id v59 = v33;
  id v23 = DeviceIdentityCopyAttestationDictionary(v28, v5, &v59);
  id v36 = v59;

  if (!v23)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 632, @"com.apple.MobileActivation.ErrorDomain", -1, v36, @"Failed to copy certificate info.", v37, v38, v52);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
    id v24 = 0;
    uint64_t v25 = 0;
    char v26 = 0;
    uint64_t v27 = 0;
    if (!a3) {
      goto LABEL_40;
    }
    goto LABEL_38;
  }
  uint64_t v55 = a1;
  uint64_t v39 = +[GestaltHlprDeviceIdentity getSharedInstance];
  uint64_t v27 = (void *)[v39 copyAnswer:@"UniqueDeviceID"];

  id v57 = v36;
  id v58 = 0;
  char v40 = createXMLRequest(v23, &v58, &v57);
  id v24 = v58;
  id v22 = v57;

  if ((v40 & 1) == 0)
  {
    uint64_t v56 = createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 648, @"com.apple.MobileActivation.ErrorDomain", -1, v22, @"Failed to create XML request.", v41, v42, v52);

    uint64_t v25 = 0;
    char v26 = 0;
    goto LABEL_37;
  }
  id v54 = [NSString alloc];
  uint64_t v53 = copy_calling_process_name();
  char v26 = (void *)[v54 initWithFormat:@"%@ - %@"];

  if (!v26)
  {
    uint64_t v56 = createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 654, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create user agent string.", v43, v44, @"iOS Device Activator (MobileActivation-1015.60.1)");

    uint64_t v25 = 0;
LABEL_37:
    id v22 = (id)v56;
    if (!a3) {
      goto LABEL_40;
    }
    goto LABEL_38;
  }
  [v24 setValue:v26 forHTTPHeaderField:@"User-Agent"];
  uint64_t v45 = isNSString(v27);

  if (v45) {
    [v24 setValue:v27 forHTTPHeaderField:@"x-jmet-deviceid"];
  }
  uint64_t v46 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v47 = is_virtual_machine();
  uint64_t v48 = &VMBAA_URL;
  if (!v47) {
    uint64_t v48 = &BAA_URL;
  }
  id v49 = [v46 URLWithString:*v48];
  [v24 setURL:v49];

  if (v55) {
    *uint64_t v55 = CFRetain(v28);
  }
  id v24 = v24;
  uint64_t v25 = v24;
  if (a3)
  {
LABEL_38:
    if (!v25) {
      *a3 = v22;
    }
  }
LABEL_40:
  if (v28) {
    CFRelease(v28);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (cf) {
    CFRelease(cf);
  }
  id v50 = v25;

  return v50;
}

void DeviceIdentityIssueClientCertificateWithCompletion(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v27 = 0;
  int v28 = (id *)&v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  long long v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v8 = v5;
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v9 = dispatch_get_global_queue(0, 0);
  }
  char v10 = v28;
  id v26 = v28[5];
  char v11 = isSupportedDeviceIdentityClient(0, &v26);
  objc_storeStrong(v10 + 5, v26);
  if ((v11 & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke;
    block[3] = &unk_1E6CD5DA0;
    v25[1] = &v27;
    uint64_t v15 = (id *)v25;
    v25[0] = v7;
    uint64_t v16 = block;
LABEL_8:
    dispatch_async(v9, v16);
    goto LABEL_9;
  }
  if (is_virtual_machine())
  {
    uint64_t v12 = v28;
    id obj = v28[5];
    has_host_SecKeyRef key = libavp_guest_has_host_key(&obj);
    objc_storeStrong(v12 + 5, obj);
    if ((has_host_key & 1) == 0)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_167;
      v21[3] = &unk_1E6CD5DA0;
      v22[1] = &v27;
      uint64_t v15 = (id *)v22;
      v22[0] = v7;
      uint64_t v16 = v21;
      goto LABEL_8;
    }
  }
  uint64_t v14 = copyDeviceIdentitySerialQueue();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_168;
  v17[3] = &unk_1E6CD5E68;
  uint64_t v15 = (id *)v20;
  v20[0] = v7;
  v20[1] = &v27;
  id v18 = v6;
  uint64_t v19 = v9;
  dispatch_async(v14, v17);

LABEL_9:
  _Block_object_dispose(&v27, 8);
}

void sub_1DD6DF7D4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 703, @"com.apple.MobileActivation.ErrorDomain", -25, *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), @"Client is not supported.", a7, a8, *(uint64_t *)v14);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  char v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)uint64_t v14 = 138543362;
    *(void *)&v14[4] = v12;
    _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", v14, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

uint64_t __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_167(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 717, @"com.apple.MobileActivation.ErrorDomain", -3, *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), @"Not supported on this device (VM support disabled).", a7, a8, *(uint64_t *)v14);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  char v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)uint64_t v14 = 138543362;
    *(void *)&v14[4] = v12;
    _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", v14, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

id copyDeviceIdentitySerialQueue()
{
  if (copyDeviceIdentitySerialQueue_onceToken != -1) {
    dispatch_once(&copyDeviceIdentitySerialQueue_onceToken, &__block_literal_global_2);
  }
  int v0 = (void *)copyDeviceIdentitySerialQueue_queue;
  return v0;
}

void __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v533[1] = *MEMORY[0x1E4F143B8];
  v510[0] = 0;
  v510[1] = v510;
  v510[2] = 0x3032000000;
  v510[3] = __Block_byref_object_copy_;
  v510[4] = __Block_byref_object_dispose_;
  id v511 = 0;
  uint64_t v504 = 0;
  v505 = (id *)&v504;
  uint64_t v506 = 0x3032000000;
  v507 = __Block_byref_object_copy_;
  v508 = __Block_byref_object_dispose_;
  id v509 = 0;
  uint64_t v500 = 0;
  v501 = &v500;
  uint64_t v502 = 0x2020000000;
  uint64_t v503 = 0;
  uint64_t v496 = 0;
  v497 = &v496;
  uint64_t v498 = 0x2020000000;
  uint64_t v499 = 0;
  uint64_t v492 = 0;
  v493 = &v492;
  uint64_t v494 = 0x2020000000;
  uint64_t v495 = 0;
  uint64_t v488 = 0;
  v489 = &v488;
  uint64_t v490 = 0x2020000000;
  uint64_t v491 = 0;
  CFErrorRef error = 0;
  uint64_t v483 = 0;
  v484 = (CFTypeRef *)&v483;
  uint64_t v485 = 0x2020000000;
  uint64_t v486 = 0;
  uint64_t v479 = 0;
  v480 = &v479;
  uint64_t v481 = 0x2020000000;
  uint64_t v482 = 0;
  int v478 = -1;
  uint64_t v472 = 0;
  v473 = &v472;
  uint64_t v474 = 0x3032000000;
  v475 = __Block_byref_object_copy_;
  v476 = __Block_byref_object_dispose_;
  id v477 = 0;
  uint64_t v466 = 0;
  v467 = &v466;
  uint64_t v468 = 0x3032000000;
  v469 = __Block_byref_object_copy_;
  v470 = __Block_byref_object_dispose_;
  id v471 = 0;
  uint64_t v460 = 0;
  v461 = &v460;
  uint64_t v462 = 0x3032000000;
  v463 = __Block_byref_object_copy_;
  v464 = __Block_byref_object_dispose_;
  id v465 = 0;
  uint64_t v454 = 0;
  v455 = &v454;
  uint64_t v456 = 0x3032000000;
  v457 = __Block_byref_object_copy_;
  v458 = __Block_byref_object_dispose_;
  id v459 = 0;
  uint64_t v448 = 0;
  v449 = &v448;
  uint64_t v450 = 0x3032000000;
  v451 = __Block_byref_object_copy_;
  v452 = __Block_byref_object_dispose_;
  id v453 = 0;
  uint64_t v442 = 0;
  v443 = &v442;
  uint64_t v444 = 0x3032000000;
  v445 = __Block_byref_object_copy_;
  v446 = __Block_byref_object_dispose_;
  id v447 = 0;
  uint64_t v438 = 0;
  v439 = (double *)&v438;
  uint64_t v440 = 0x2020000000;
  uint64_t v441 = 0;
  double v437 = 0.0;
  int v436 = 0;
  uint64_t v432 = 0;
  v433 = &v432;
  uint64_t v434 = 0x2020000000;
  int v435 = 0;
  uint64_t v428 = 0;
  v429 = (double *)&v428;
  uint64_t v430 = 0x2020000000;
  uint64_t v431 = 0;
  if (!*(void *)(a1 + 48))
  {
    uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 807, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid input.", a7, a8, v331);
LABEL_23:
    id v369 = 0;
LABEL_24:
    id v34 = 0;
    v366 = 0;
    id v35 = 0;
    CFDataRef v36 = 0;
    v354 = 0;
    id v350 = 0;
    uint64_t v14 = 0;
LABEL_25:
    v367 = 0;
    CFTypeRef cf = 0;
    goto LABEL_26;
  }
  id v369 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v369)
  {
    uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 813, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate array.", v9, v10, v331);
    goto LABEL_23;
  }
  char v11 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  uint64_t v14 = v11;
  if (!v11)
  {
    uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 821, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create task.", v12, v13, v331);
    goto LABEL_24;
  }
  v367 = (__CFString *)SecTaskCopySigningIdentifier(v11, &error);
  if (!v367)
  {
    uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 827, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to query code signing identifier.", v15, v16, v331);
    id v34 = 0;
    v366 = 0;
    id v35 = 0;
    CFDataRef v36 = 0;
    v354 = 0;
    id v350 = 0;
    goto LABEL_25;
  }
  v366 = (void *)SecTaskCopyValueForEntitlement(v14, @"com.apple.mobileactivationd.spi", &error);
  uint64_t v17 = isNSNumber(v366);
  if (!v17 || (char v18 = [v366 BOOLValue], v17, (v18 & 1) == 0))
  {
    CFErrorRef v56 = error;
    v532 = @"com.apple.mobileactivationd.spi";
    v533[0] = MEMORY[0x1E4F1CC38];
    uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v533 forKeys:&v532 count:1];
    uint64_t v59 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 833, @"com.apple.MobileActivation.ErrorDomain", -7, v56, @"Missing required entitlement: %@", v57, v58, (uint64_t)v41);
    uint64_t v60 = *(void *)(*(void *)(a1 + 56) + 8);
    id v61 = *(void **)(v60 + 40);
    *(void *)(v60 + 40) = v59;

    id v34 = 0;
    id v35 = 0;
    CFDataRef v36 = 0;
    v352 = 0;
    v354 = 0;
    id v350 = 0;
    v351 = 0;
    CFTypeRef cf = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    id v363 = 0;
    v364 = 0;
    id v357 = 0;
    id v358 = 0;
    id v359 = 0;
    v360 = 0;
    id v361 = 0;
    id v362 = 0;
    v355 = 0;
    v356 = 0;
    id v365 = 0;
    goto LABEL_28;
  }
  id v365 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v365)
  {
    if (*(void *)(a1 + 32)) {
      objc_msgSend(v365, "addEntriesFromDictionary:");
    }
    int v21 = is_virtual_machine();
    if (v21)
    {
      id v22 = [NSNumber numberWithBool:1];
      [v365 setObject:v22 forKeyedSubscript:@"scrtAttestation"];
    }
    id v23 = [v365 objectForKeyedSubscript:@"OIDSToInclude"];
    id v24 = isNSArray(v23);

    if (v24)
    {
      id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v26 = [v365 objectForKeyedSubscript:@"OIDSToInclude"];
      v364 = (void *)[v25 initWithArray:v26];

      if (([v364 containsObject:@"1.2.840.113635.100.10.1"] & 1) != 0
        || ([v364 containsObject:@"1.2.840.113635.100.8.1"] & 1) != 0
        || [v364 containsObject:@"1.2.840.113635.100.8.3"])
      {
        v345 = (void *)SecTaskCopyValueForEntitlement(v14, @"com.apple.mobileactivationd.device-identifiers", &error);

        uint64_t v27 = isNSNumber(v345);
        if (!v27 || (char v28 = [v345 BOOLValue], v27, (v28 & 1) == 0))
        {
          CFErrorRef v62 = error;
          v530 = @"com.apple.mobileactivationd.device-identifiers";
          uint64_t v531 = MEMORY[0x1E4F1CC38];
          uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v531 forKeys:&v530 count:1];
          uint64_t v65 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 865, @"com.apple.MobileActivation.ErrorDomain", -7, v62, @"Missing required entitlement: %@", v63, v64, (uint64_t)v41);
          uint64_t v66 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v67 = *(void **)(v66 + 40);
          *(void *)(v66 + 40) = v65;

          id v34 = 0;
          id v35 = 0;
          CFDataRef v36 = 0;
          v352 = 0;
          v354 = 0;
          id v350 = 0;
          v351 = 0;
          CFTypeRef cf = 0;
          uint64_t v37 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          id v357 = 0;
          id v358 = 0;
          id v359 = 0;
          v360 = 0;
          id v361 = 0;
          id v362 = 0;
          v355 = 0;
          v356 = 0;
          id v363 = 0;
          v366 = v345;
          goto LABEL_28;
        }
        v366 = v345;
      }
      uint64_t v29 = copy_supported_eda_oids();
      int v30 = [v364 intersectsSet:v29];

      if (v30)
      {
        uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 871, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"This API does not support Enterprise Device Attestation OIDs: %@", v31, v32, (uint64_t)v364);
LABEL_57:
        id v34 = 0;
        id v35 = 0;
        CFDataRef v36 = 0;
        v352 = 0;
        v354 = 0;
        id v350 = 0;
        v351 = 0;
        CFTypeRef cf = 0;
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        id v357 = 0;
        id v358 = 0;
        id v359 = 0;
        v360 = 0;
        id v361 = 0;
        id v362 = 0;
        v355 = 0;
        v356 = 0;
        id v363 = 0;
        goto LABEL_27;
      }
      if ([v364 containsObject:@"1.2.840.113635.100.8.6"])
      {
        unsigned int v75 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"AccessControls"];
        BOOL v76 = v75 == 0;

        if (v76)
        {
          uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 876, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Missing required option: %@", v77, v78, @"AccessControls");
          goto LABEL_57;
        }
      }
    }
    else
    {
      v364 = 0;
    }
    CFErrorRef v68 = [v365 objectForKeyedSubscript:@"KeychainLabel"];
    uint64_t v69 = isNSString(v68);

    if (v69)
    {
      if ((isRunningInRecovery() & 1) != 0 || isRunningInDiagnosticsMode())
      {
        uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 883, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Option (%@) not allowed for processes running in recoveryOS or diagnostics mode.", v70, v71, @"KeychainLabel");
        goto LABEL_57;
      }
      uint64_t v85 = [v365 objectForKeyedSubscript:@"ClientAttestationData"];
      uint64_t v86 = isNSData(v85);

      if (v86)
      {
        uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 888, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Keychain (%@) not supported with %@.", v87, v88, @"KeychainLabel");
        goto LABEL_57;
      }
      id v363 = [v365 objectForKeyedSubscript:@"KeychainLabel"];
      id v362 = [NSString stringWithFormat:@"%@-rk", v363];
      v356 = [NSString stringWithFormat:@"%@-leaf", v363];
      v355 = [NSString stringWithFormat:@"%@-intermediate", v363];
      id v361 = [NSString stringWithFormat:@"%@-combined", v363];
      id v359 = [NSString stringWithFormat:@"%@-monotonic-clock", v363];
      id v357 = [NSString stringWithFormat:@"%@-server-timestamp", v363];
      uint64_t v331 = (uint64_t)v363;
      id v358 = [NSString stringWithFormat:@"%@-rtc-reset-count"];
    }
    else
    {
      id v362 = 0;
      id v363 = 0;
      id v361 = 0;
      v355 = 0;
      v356 = 0;
      id v358 = 0;
      id v359 = 0;
      id v357 = 0;
    }
    uint64_t v72 = [v365 objectForKeyedSubscript:@"KeychainAccessGroup"];
    uint64_t v73 = isNSString(v72);

    if (v73)
    {
      CFTypeID v74 = [v365 objectForKeyedSubscript:@"KeychainAccessGroup"];
    }
    else
    {
      CFTypeID v74 = 0;
    }
    if (v363 && !v74) {
      CFTypeID v74 = v367;
    }
    v360 = v74;
    v79 = [v365 objectForKeyedSubscript:@"IgnoreExistingKeychainItems"];
    uint64_t v80 = isNSNumber(v79);

    if (v80)
    {
      uint64_t v81 = [v365 objectForKeyedSubscript:@"IgnoreExistingKeychainItems"];
      char v353 = [v81 BOOLValue];
    }
    else
    {
      char v353 = 0;
    }
    uint64_t v82 = [v365 objectForKeyedSubscript:@"AccessControls"];

    if (!v82) {
      goto LABEL_85;
    }
    if ((isRunningInRecovery() & 1) != 0 || isRunningInDiagnosticsMode())
    {
      uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 917, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Option (%@) not allowed for processes running in recoveryOS or diagnostics mode.", v83, v84, @"AccessControls");
LABEL_75:
      id v34 = 0;
      id v35 = 0;
      CFDataRef v36 = 0;
      v354 = 0;
      id v350 = 0;
LABEL_76:
      CFTypeRef cf = 0;
LABEL_77:
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      v351 = 0;
      v352 = 0;
      goto LABEL_27;
    }
    uint64_t v89 = [v365 objectForKeyedSubscript:@"ClientAttestationData"];
    uint64_t v90 = isNSData(v89);

    if (v90)
    {
      uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 922, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"ACLs (%@) not supported with %@.", v91, v92, @"AccessControls");
      goto LABEL_75;
    }
    uint64_t v93 = [v365 objectForKeyedSubscript:@"AccessControls"];
    CFTypeID v94 = CFGetTypeID(v93);
    LODWORD(v94) = v94 == SecAccessControlGetTypeID();

    if (v94)
    {
      CFTypeRef cf = [v365 objectForKeyedSubscript:@"AccessControls"];

      CFRetain(cf);
    }
    else
    {
LABEL_85:
      CFTypeRef cf = 0;
    }
    uint64_t v95 = [v365 objectForKeyedSubscript:@"reuseExistingKey"];
    uint64_t v96 = isNSNumber(v95);

    if (v96)
    {
      uint64_t v97 = [v365 objectForKeyedSubscript:@"reuseExistingKey"];
      int v347 = [v97 BOOLValue];
    }
    else
    {
      int v347 = 0;
    }
    uint64_t v98 = [v365 objectForKeyedSubscript:@"UseSoftwareGeneratedKey"];
    uint64_t v99 = isNSNumber(v98);

    if (v99)
    {
      uint64_t v100 = [v365 objectForKeyedSubscript:@"UseSoftwareGeneratedKey"];
      char queue = [v100 BOOLValue];
    }
    else
    {
      char queue = 1;
    }
    int v101 = [v365 objectForKeyedSubscript:@"scrtAttestation"];
    uint64_t v102 = isNSNumber(v101);

    if (v102)
    {
      uint64_t v103 = [v365 objectForKeyedSubscript:@"scrtAttestation"];
      int v21 = [v103 BOOLValue];
    }
    CFDataRef v104 = [v365 objectForKeyedSubscript:@"ClientAttestationData"];
    v105 = isNSData(v104);

    if (v105)
    {
      id v106 = [v365 objectForKeyedSubscript:@"ClientAttestationPublicKey"];
      id v107 = isNSData(v106);
      BOOL v108 = v107 == 0;

      if (v108)
      {
        uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 946, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Missing required option for %@.", v109, v110, @"ClientAttestationPublicKey");
        id v34 = 0;
        id v35 = 0;
        CFDataRef v36 = 0;
        v354 = 0;
        id v350 = 0;
        goto LABEL_77;
      }
      v354 = [v365 objectForKeyedSubscript:@"ClientAttestationData"];
      id v350 = [v365 objectForKeyedSubscript:@"ClientAttestationPublicKey"];
    }
    else
    {
      id v350 = 0;
      v354 = 0;
    }
    uint64_t v111 = [v365 objectForKeyedSubscript:@"ReturnReferenceDate"];
    id v112 = isNSNumber(v111);

    if (v112)
    {
      uint64_t v113 = [v365 objectForKeyedSubscript:@"ReturnReferenceDate"];
      int v338 = [v113 BOOLValue];
    }
    else
    {
      int v338 = 0;
    }
    uint64_t v114 = [v365 objectForKeyedSubscript:@"SkipNetworkRequest"];
    id v115 = isNSNumber(v114);

    if (v115)
    {
      id v116 = [v365 objectForKeyedSubscript:@"SkipNetworkRequest"];
      int v340 = [v116 BOOLValue];
    }
    else
    {
      int v340 = 0;
    }
    id v117 = [v365 objectForKeyedSubscript:@"DeleteExistingKeysAndCerts"];
    uint64_t v118 = isNSNumber(v117);

    if (v118)
    {
      char v119 = [v365 objectForKeyedSubscript:@"DeleteExistingKeysAndCerts"];
      int v120 = [v119 BOOLValue];
    }
    else
    {
      int v120 = 0;
    }
    if (v362)
    {
      if (v21)
      {
        uint64_t v121 = [v362 stringByAppendingString:@"-scrt"];

        uint64_t v122 = [v356 stringByAppendingString:@"-scrt"];

        uint64_t v123 = [v355 stringByAppendingString:@"-scrt"];

        uint64_t v124 = [v361 stringByAppendingString:@"-scrt"];

        uint64_t v125 = [v359 stringByAppendingString:@"-scrt"];

        uint64_t v126 = [v357 stringByAppendingString:@"-scrt"];

        [v358 stringByAppendingString:@"-scrt"];
      }
      else
      {
        uint64_t v121 = [v362 stringByAppendingString:@"-ucrt"];

        uint64_t v122 = [v356 stringByAppendingString:@"-ucrt"];

        uint64_t v123 = [v355 stringByAppendingString:@"-ucrt"];

        uint64_t v124 = [v361 stringByAppendingString:@"-ucrt"];

        uint64_t v125 = [v359 stringByAppendingString:@"-ucrt"];

        uint64_t v126 = [v357 stringByAppendingString:@"-ucrt"];

        [v358 stringByAppendingString:@"-ucrt"];
      uint64_t v127 = };
      id v361 = (id)v124;
      id v362 = (id)v121;
      v355 = (void *)v123;
      v356 = (void *)v122;
      id v359 = (id)v125;
      id v357 = (id)v126;

      id v358 = (id)v127;
    }
    else
    {
      id v362 = 0;
    }
    if (v120)
    {
      id v34 = 0;
      if (v363 && v360)
      {
        delete_keychain_data(v360, v359, 0);
        delete_keychain_data(v360, v358, 0);
        delete_keychain_data(v360, v357, 0);
        delete_keychain_data(v360, v361, 0);
        delete_keychain_item(v360, v362, 0);
        delete_certificate(v360, v356, 0);
        delete_certificate(v360, v355, 0);
        id v34 = 0;
        id v35 = 0;
        CFDataRef v36 = 0;
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        v351 = 0;
        v352 = 0;
      }
      else
      {
        id v35 = 0;
        CFDataRef v36 = 0;
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        v351 = 0;
        v352 = 0;
      }
      goto LABEL_29;
    }
    if (v354)
    {
      if (cf) {
        CFRelease(cf);
      }
      CFTypeRef cf = (void *)SecAccessControlCreate();
      if (!cf)
      {
        uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1019, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to create access control.", v128, v129, v331);
        id v34 = 0;
        id v35 = 0;
        CFDataRef v36 = 0;
        goto LABEL_76;
      }
      uint64_t v130 = *MEMORY[0x1E4F3B5A0];
      if ((SecAccessControlSetProtection() & 1) == 0)
      {
        uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1024, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to set ACL protection to %@.", v131, v132, v130);
        goto LABEL_165;
      }
    }
    if (isRunningInRecovery())
    {
      BOOL v135 = 0;
    }
    else
    {
      uint64_t v139 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v139 + 40);
      BOOL v135 = isAutomaticTimeEnabledWithError(&obj);
      objc_storeStrong((id *)(v139 + 40), obj);
      uint64_t v142 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v145 = *(void **)(v142 + 40);
      uint64_t v144 = (id *)(v142 + 40);
      uint64_t v143 = v145;
      if (!v135 && v143)
      {
        uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1036, @"com.apple.MobileActivation.ErrorDomain", -1, v143, @"Failed to query automatic time state.", v140, v141, v331);
        goto LABEL_165;
      }
      id v426 = v143;
      double v146 = copyMonotonicClock(&v426);
      objc_storeStrong(v144, v426);
      v439[3] = v146;
      char v149 = v146 != 0.0 || v135;
      if ((v149 & 1) == 0)
      {
        uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1047, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to query monotonic clock.", v147, v148, v331);
        goto LABEL_165;
      }
      uint64_t v150 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v151 = *(void **)(v150 + 40);
      *(void *)(v150 + 40) = 0;

      if (v439[3] != 0.0)
      {
        uint64_t v152 = *(void *)(*(void *)(a1 + 56) + 8);
        id v425 = *(id *)(v152 + 40);
        int v153 = copyRTCResetCountWithError(&v425);
        objc_storeStrong((id *)(v152 + 40), v425);
        *((_DWORD *)v433 + 6) = v153;
        if (!v153)
        {
          uint64_t v154 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          if (v154)
          {
            uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1056, @"com.apple.MobileActivation.ErrorDomain", -1, v154, @"Failed to query RTC reset count.", v133, v134, v331);
            goto LABEL_165;
          }
        }
      }
    }
    char v136 = v353;
    if (!v363) {
      char v136 = 1;
    }
    if (v136)
    {
      uint64_t v137 = 0;
      v351 = 0;
      uint64_t v39 = 0;
      uint64_t v38 = 0;
      uint64_t v37 = 0;
      int v337 = 0;
      id v34 = 0;
      goto LABEL_128;
    }
    uint64_t v155 = *(void *)(*(void *)(a1 + 56) + 8);
    id v424 = *(id *)(v155 + 40);
    CFTypeRef v156 = copy_keychain_item(v360, v362, v365, &v478, &v424);
    objc_storeStrong((id *)(v155 + 40), v424);
    v489[3] = (uint64_t)v156;
    if (v478 != -25300 && v478)
    {
      uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1067, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to query existing reference key (%@/%@): %d", v157, v158, (uint64_t)v360);
    }
    else
    {
      uint64_t v159 = *(void *)(*(void *)(a1 + 56) + 8);
      id v160 = *(void **)(v159 + 40);
      *(void *)(v159 + 40) = 0;

      uint64_t v161 = *(void *)(*(void *)(a1 + 56) + 8);
      id v423 = *(id *)(v161 + 40);
      v352 = copy_keychain_data(v360, v361, &v478, &v423);
      objc_storeStrong((id *)(v161 + 40), v423);
      if (v478 != -25300 && v478)
      {
        uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1075, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to query existing leaf/intermediate certificates (%@/%@): %d", v162, v163, (uint64_t)v360);
        goto LABEL_167;
      }
      uint64_t v164 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v165 = *(void **)(v164 + 40);
      *(void *)(v164 + 40) = 0;

      if (v352)
      {
        uint64_t v166 = *(void *)(*(void *)(a1 + 56) + 8);
        id v422 = *(id *)(v166 + 40);
        v351 = parseDERCertificatesFromChain(v352, &v422);
        objc_storeStrong((id *)(v166 + 40), v422);
        if (!v351 || [v351 count] != 2)
        {
          uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1088, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to parse DER certificate chain.", v167, v168, v331);
          goto LABEL_169;
        }
        CFDataRef v169 = [v351 objectAtIndexedSubscript:0];
        SecCertificateRef v170 = SecCertificateCreateWithData(0, v169);
        v484[3] = v170;

        if (!v484[3])
        {
          uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1094, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create certificate from DER data.", v171, v172, v331);
          goto LABEL_169;
        }
        CFDataRef v173 = [v351 objectAtIndexedSubscript:1];
        SecCertificateRef v174 = SecCertificateCreateWithData(0, v173);
        v480[3] = (uint64_t)v174;

        if (!v480[3])
        {
          uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1100, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create certificate from DER data.", v175, v176, v331);
LABEL_169:
          id v34 = 0;
          id v35 = 0;
          CFDataRef v36 = 0;
          uint64_t v37 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          goto LABEL_27;
        }
LABEL_197:
        if ((isRunningInRecovery() & 1) == 0)
        {
          uint64_t v240 = *(void *)(*(void *)(a1 + 56) + 8);
          id v418 = *(id *)(v240 + 40);
          uint64_t v241 = copy_keychain_data(v360, v359, &v478, &v418);
          objc_storeStrong((id *)(v240 + 40), v418);
          uint64_t v242 = (void *)v443[5];
          v443[5] = v241;

          if (v478 != -25300 && v478)
          {
            uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1159, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to query existing motononic time (%@/%@): %d", v243, v244, (uint64_t)v360);
            goto LABEL_169;
          }
          uint64_t v245 = *(void *)(*(void *)(a1 + 56) + 8);
          CFDataRef v246 = *(void **)(v245 + 40);
          *(void *)(v245 + 40) = 0;

          uint64_t v247 = (void *)v443[5];
          if (v247) {
            [v247 getBytes:&v437 length:8];
          }
          uint64_t v248 = *(void *)(*(void *)(a1 + 56) + 8);
          id v417 = *(id *)(v248 + 40);
          uint64_t v249 = copy_keychain_data(v360, v358, &v478, &v417);
          objc_storeStrong((id *)(v248 + 40), v417);
          CFDataRef v250 = (void *)v467[5];
          v467[5] = v249;

          if (v478 != -25300 && v478)
          {
            uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1171, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to query existing RTC reset count (%@/%@): %d", v251, v252, (uint64_t)v360);
            goto LABEL_169;
          }
          uint64_t v253 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v254 = *(void **)(v253 + 40);
          *(void *)(v253 + 40) = 0;

          uint64_t v255 = (void *)v467[5];
          if (v255) {
            [v255 getBytes:&v436 length:4];
          }
          uint64_t v256 = *(void *)(*(void *)(a1 + 56) + 8);
          id v416 = *(id *)(v256 + 40);
          uint64_t v257 = copy_keychain_data(v360, v357, &v478, &v416);
          objc_storeStrong((id *)(v256 + 40), v416);
          v258 = (void *)v461[5];
          v461[5] = v257;

          if (v478 != -25300 && v478)
          {
            uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1183, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to query existing server timestamp (%@/%@): %d", v259, v260, (uint64_t)v360);
            goto LABEL_169;
          }
          uint64_t v261 = *(void *)(*(void *)(a1 + 56) + 8);
          v262 = *(void **)(v261 + 40);
          *(void *)(v261 + 40) = 0;

          id v263 = (void *)v461[5];
          if (v263)
          {
            [v263 getBytes:v429 + 3 length:8];
            id v264 = objc_alloc(MEMORY[0x1E4F1C9C8]);
            uint64_t v265 = [v264 initWithTimeIntervalSinceReferenceDate:v429[3]];
            v266 = (void *)v449[5];
            v449[5] = v265;

            if (!v449[5])
            {
              uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1194, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create date from server timestamp.", v133, v134, v331);
              goto LABEL_169;
            }
          }
        }
        if (v489[3] && (uint64_t v238 = (uint64_t)v484[3]) != 0)
        {
          if (v364)
          {
            id v239 = [v364 allObjects];
            uint64_t v39 = copyCertificateOIDsThatDiffer(v238, v239);
          }
          else
          {
            uint64_t v39 = 0;
          }
          if ([v39 count])
          {
            uint64_t v268 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1212, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Mismatch in requested OIDs and existing certificate's OIDs (%@).", v133, v134, (uint64_t)v39);
            uint64_t v269 = *(void *)(*(void *)(a1 + 56) + 8);
            int v270 = *(void **)(v269 + 40);
            *(void *)(v269 + 40) = v268;

            int v267 = 1;
            goto LABEL_225;
          }
        }
        else
        {
          uint64_t v39 = 0;
        }
        int v267 = 0;
LABEL_225:
        CFDataRef v271 = v489;
        if (v489[3])
        {
          int v272 = isFactoryMFiCertificate(v360, (uint64_t)v484[3]);
          CFDataRef v271 = v489;
          if (v272)
          {
            int v273 = (__SecKey *)v489[3];
            uint64_t v274 = *(void *)(*(void *)(a1 + 56) + 8);
            id v415 = *(id *)(v274 + 40);
            int valid = security_valid_security_enclave_reference_key(v273, 1, 0, &v415, v236, v237, v133, v134);
            objc_storeStrong((id *)(v274 + 40), v415);
            if (!valid) {
              goto LABEL_236;
            }
            CFDataRef v271 = v489;
          }
        }
        v276 = (__SecKey *)v271[3];
        if (!v276) {
          goto LABEL_234;
        }
        uint64_t v277 = *(void *)(*(void *)(a1 + 56) + 8);
        id v414 = *(id *)(v277 + 40);
        int v278 = security_valid_security_enclave_reference_key(v276, 0, 0, &v414, v236, v237, v133, v134);
        objc_storeStrong((id *)(v277 + 40), v414);
        if (v278)
        {
          v279 = (__SecKey *)v489[3];
          if (!v279
            || (int v280 = (__SecCertificate *)v484[3]) == 0
            || (uint64_t v281 = *(void *)(*(void *)(a1 + 56) + 8),
                id v413 = *(id *)(v281 + 40),
                char v282 = security_certificate_matches_key(v279, 0, v280, &v413),
                objc_storeStrong((id *)(v281 + 40), v413),
                (v282 & 1) != 0))
          {
LABEL_234:
            if (!v267) {
              goto LABEL_246;
            }
            goto LABEL_237;
          }
        }
LABEL_236:
        uint64_t v283 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1232, @"com.apple.MobileActivation.ErrorDomain", -2, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Invalid reference key.", v133, v134, v331);
        uint64_t v284 = *(void *)(*(void *)(a1 + 56) + 8);
        v285 = *(void **)(v284 + 40);
        *(void *)(v284 + 40) = v283;

LABEL_237:
        v286 = MEMORY[0x1E4F14500];
        id v287 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v286, OS_LOG_TYPE_DEFAULT))
        {
          v288 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          id v513 = v288;
          _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Deleting invalid keys/certificates: %@", buf, 0xCu);
        }

        delete_keychain_data(v360, v359, 0);
        delete_keychain_data(v360, v358, 0);
        delete_keychain_data(v360, v357, 0);
        delete_keychain_data(v360, v361, 0);
        delete_keychain_item(v360, v362, 0);
        delete_certificate(v360, v356, 0);
        delete_certificate(v360, v355, 0);
        v289 = v489;
        v290 = (const void *)v489[3];
        if (v290)
        {
          CFRelease(v290);
          v289 = v489;
        }
        v289[3] = 0;
        v291 = v484;
        CFTypeRef v292 = v484[3];
        if (v292)
        {
          CFRelease(v292);
          v291 = v484;
        }
        v291[3] = 0;
        v293 = v480;
        v294 = (const void *)v480[3];
        if (v294)
        {
          CFRelease(v294);
          v293 = v480;
        }
        v293[3] = 0;
        uint64_t v295 = *(void *)(*(void *)(a1 + 56) + 8);
        v296 = *(void **)(v295 + 40);
        *(void *)(v295 + 40) = 0;

LABEL_246:
        if (!v489[3] || !v484[3] || !v480[3])
        {
          uint64_t v38 = 0;
          uint64_t v37 = 0;
          int v337 = 0;
          id v34 = 0;
LABEL_257:
          uint64_t v137 = v352;
LABEL_128:
          v352 = v137;
          if (v340)
          {
            uint64_t v138 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1340, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Missing or expired certificates, and network request explictly not attempted.", v133, v134, v331);
          }
          else
          {
            if (v347 && (v177 = (const void *)v489[3]) != 0)
            {
              id v178 = (__SecKey *)CFRetain(v177);
              v497[3] = (uint64_t)v178;
            }
            else
            {
              uint64_t v179 = *(void *)(*(void *)(a1 + 56) + 8);
              id v412 = *(id *)(v179 + 40);
              id v178 = (__SecKey *)createReferenceKeyBlob(cf, queue, v365, &v412);
              objc_storeStrong((id *)(v179 + 40), v412);
              v497[3] = (uint64_t)v178;
              if (!v178)
              {
                uint64_t v138 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1351, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to create reference key.", v180, v181, v331);
                goto LABEL_184;
              }
            }
            id v182 = SecKeyCopyPublicKey(v178);
            v493[3] = (uint64_t)v182;
            if (v182)
            {
              CFDataRef v36 = SecKeyCopyExternalRepresentation(v182, &error);
              if (v36)
              {
                BOOL v190 = (__SecKey *)v497[3];
                id v411 = 0;
                uint64_t v191 = *(void *)(*(void *)(a1 + 56) + 8);
                id v410 = *(id *)(v191 + 40);
                v348 = security_create_external_representation(v190, &v411, &v410, v185, v186, v187, v188, v189);
                id v35 = v411;
                objc_storeStrong((id *)(v191 + 40), v410);
                if (v348)
                {
                  [v365 setObject:v35 forKeyedSubscript:@"SigningKeyAttributes"];
                  queuea = dispatch_get_global_queue(0, 0);
                  v374[0] = MEMORY[0x1E4F143A8];
                  v374[1] = 3221225472;
                  v374[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_2;
                  v374[3] = &unk_1E6CD5E40;
                  id v365 = v365;
                  id v375 = v365;
                  unint64_t v194 = v367;
                  uint64_t v195 = *(void *)(a1 + 56);
                  v367 = v194;
                  v376 = v194;
                  uint64_t v390 = v195;
                  id v54 = v348;
                  id v377 = v54;
                  v391 = v510;
                  v392 = &v454;
                  char v408 = v338;
                  id v369 = v369;
                  id v378 = v369;
                  v393 = &v472;
                  v394 = &v496;
                  id v350 = v350;
                  id v379 = v350;
                  id v363 = v363;
                  id v380 = v363;
                  v360 = v360;
                  v381 = v360;
                  id v361 = v361;
                  id v382 = v361;
                  id v362 = v362;
                  id v383 = v362;
                  id v359 = v359;
                  id v384 = v359;
                  id v358 = v358;
                  id v385 = v358;
                  id v357 = v357;
                  id v386 = v357;
                  v395 = &v438;
                  v396 = &v442;
                  v397 = &v466;
                  v398 = &v432;
                  v399 = &v428;
                  v400 = &v460;
                  v401 = &v500;
                  v402 = &v504;
                  v403 = &v488;
                  v404 = &v483;
                  v405 = &v479;
                  id v34 = v34;
                  id v387 = v34;
                  v406 = &v448;
                  char v409 = v337;
                  id v388 = *(id *)(a1 + 40);
                  id v389 = *(id *)(a1 + 48);
                  v407 = &v492;
                  dispatch_async(queuea, v374);

                  uint64_t v55 = &v375;
                  goto LABEL_40;
                }
                uint64_t v138 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1396, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to encode RK as data.", v192, v193, v331);
                goto LABEL_185;
              }
              uint64_t v138 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1364, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to encode RK public key as data.", v188, v189, v331);
            }
            else
            {
              uint64_t v138 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1358, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy RK public key.", v183, v184, v331);
            }
          }
LABEL_184:
          CFDataRef v36 = 0;
          id v35 = 0;
LABEL_185:
          uint64_t v220 = *(void *)(*(void *)(a1 + 56) + 8);
          v221 = *(void **)(v220 + 40);
          *(void *)(v220 + 40) = v138;

LABEL_186:
          v222 = (const void *)v489[3];
          if (!v222 || !v34) {
            goto LABEL_29;
          }
          CFTypeRef v223 = CFRetain(v222);
          v501[3] = (uint64_t)v223;
          objc_storeStrong(v505 + 5, v34);
          id v224 = MEMORY[0x1E4F14500];
          id v225 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT))
          {
            v334 = [v505[5] objectAtIndexedSubscript:0];
            v226 = (void *)MEMORY[0x1E4F1C9C8];
            v339 = [v505[5] objectAtIndexedSubscript:0];
            SecCertificateNotValidBefore();
            objc_msgSend(v226, "dateWithTimeIntervalSinceReferenceDate:");
            id v349 = (id)objc_claimAutoreleasedReturnValue();
            int v227 = (void *)MEMORY[0x1E4F1C9C8];
            v336 = [v505[5] objectAtIndexedSubscript:0];
            SecCertificateNotValidAfter();
            objc_msgSend(v227, "dateWithTimeIntervalSinceReferenceDate:");
            dispatch_queue_t queueb = (dispatch_queue_t)(id)objc_claimAutoreleasedReturnValue();
            v332 = [v505[5] objectAtIndexedSubscript:1];
            v228 = (void *)MEMORY[0x1E4F1C9C8];
            v335 = [v505[5] objectAtIndexedSubscript:1];
            SecCertificateNotValidBefore();
            objc_msgSend(v228, "dateWithTimeIntervalSinceReferenceDate:");
            id v341 = (id)objc_claimAutoreleasedReturnValue();
            v229 = (void *)MEMORY[0x1E4F1C9C8];
            v333 = [v505[5] objectAtIndexedSubscript:1];
            SecCertificateNotValidAfter();
            objc_msgSend(v229, "dateWithTimeIntervalSinceReferenceDate:");
            id v230 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v231 = v449[5];
            *(_DWORD *)buf = 138544898;
            id v513 = v334;
            __int16 v514 = 2114;
            id v515 = v349;
            __int16 v516 = 2114;
            dispatch_queue_t v517 = queueb;
            __int16 v518 = 2114;
            v519 = v332;
            __int16 v520 = 2114;
            id v521 = v341;
            __int16 v522 = 2114;
            id v523 = v230;
            __int16 v524 = 2114;
            uint64_t v525 = v231;
            _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Returning cached certificates:\n* %{public}@\n    Not Valid Before: %{public}@\n  Not Valid After: %{public}@\n* %{public}@\n    Not Valid Before: %{public}@\n  Not Valid After: %{public}@\n* Server Timestamp: %{public}@\n", buf, 0x48u);
          }
          if (!v337) {
            goto LABEL_29;
          }
          v232 = MEMORY[0x1E4F14500];
          id v233 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v234 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            *(_DWORD *)buf = 138543362;
            id v513 = v234;
            _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ (non-fatal, existing valid certificates)", buf, 0xCu);
          }

          uint64_t v235 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v41 = *(void **)(v235 + 40);
          *(void *)(v235 + 40) = 0;
          goto LABEL_28;
        }
        double v297 = v439[3];
        if (v297 == 0.0
          || (v437 == 0.0 ? (char v298 = 1) : (char v298 = v135), (v298 & 1) != 0 || (v299 = (void *)v449[5]) == 0))
        {
          uint64_t v303 = [MEMORY[0x1E4F1C9C8] date];
          v302 = (void *)v455[5];
          v455[5] = v303;
          char v301 = 1;
        }
        else
        {
          uint64_t v300 = [v299 dateByAddingTimeInterval:v297 - v437];
          char v301 = 0;
          v302 = (void *)v455[5];
          v455[5] = v300;
        }

        [(id)v455[5] timeIntervalSinceReferenceDate];
        if (SecCertificateIsValid()
          && ([(id)v455[5] timeIntervalSinceReferenceDate], SecCertificateIsValid()))
        {
          SecCertificateNotValidAfter();
          double v305 = v304;
          SecCertificateNotValidBefore();
          double v307 = v306;
          [(id)v455[5] timeIntervalSinceReferenceDate];
          double v309 = v308;
          SecCertificateNotValidBefore();
          if (v309 - v310 >= (v305 - v307) * 0.9)
          {
            int v312 = 1;
            int v311 = 1;
            if (v301) {
              goto LABEL_267;
            }
          }
          else
          {
            int v311 = 0;
            int v312 = 1;
            if (v301) {
              goto LABEL_267;
            }
          }
        }
        else
        {
          int v312 = 0;
          int v311 = 0;
          if (v301) {
            goto LABEL_267;
          }
        }
        if (*((_DWORD *)v433 + 6) != v436) {
          int v312 = 0;
        }
LABEL_267:
        if (is_virtual_machine())
        {
          id v313 = lockcrypto_query_certificate_properties((uint64_t)v484[3], @"1.2.840.113635.100.8.3", 0);
          uint64_t v38 = v313;
          if (v313)
          {
            id v314 = [v313 objectForKeyedSubscript:@"1021"];
            CFDataRef v315 = isNSData(v314);
            BOOL v316 = v315 == 0;

            if (!v316)
            {
              CFDataRef v317 = +[GestaltHlprDeviceIdentity getSharedInstance];
              uint64_t v37 = (void *)[v317 copyAnswer:@"UniqueDeviceID"];

              if (v37)
              {
                id v318 = [v38 objectForKeyedSubscript:@"1021"];
                id v319 = [v318 hexString];
                BOOL v320 = [v319 caseInsensitiveCompare:v37] == 0;

                if (v320) {
                  goto LABEL_278;
                }
                long long v321 = MEMORY[0x1E4F14500];
                id v322 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v321, OS_LOG_TYPE_DEFAULT))
                {
                  long long v323 = [v38 objectForKeyedSubscript:@"1021"];
                  id v324 = [v323 hexString];
                  *(_DWORD *)buf = 138412546;
                  id v513 = v324;
                  __int16 v514 = 2112;
                  id v515 = v37;
                  _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Existing certificate's UDID (%@) does not match the current UDID (%@), VM may have moved to a new host. Treating key/certificates as invalid.", buf, 0x16u);
                }
                int v312 = 0;
                int v347 = 0;
              }
              else
              {
                v328 = MEMORY[0x1E4F14500];
                id v329 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v328, OS_LOG_TYPE_FAULT))
                {
                  v330 = copy_current_process_name();
                  __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_168_cold_1(v330, (uint64_t)v529);
                }
                uint64_t v37 = 0;
              }

LABEL_278:
              if (v338)
              {
                uint64_t v325 = v480[3];
                v527[1] = v484[3];
                v527[2] = v325;
                v326 = &v528;
                v327 = v455 + 5;
              }
              else
              {
                CFTypeRef v526 = v484[3];
                v326 = v527;
                v327 = v480 + 3;
              }
              uint64_t *v326 = *v327;
              objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
              id v34 = (id)objc_claimAutoreleasedReturnValue();
              if (v312)
              {
                int v337 = 1;
                if (!v311)
                {
                  CFDataRef v36 = 0;
                  id v35 = 0;
                  goto LABEL_186;
                }
              }
              else
              {
                int v337 = 0;
              }
              goto LABEL_257;
            }
          }
        }
        else
        {
          uint64_t v38 = 0;
        }
        uint64_t v37 = 0;
        goto LABEL_278;
      }
      uint64_t v196 = *(void *)(*(void *)(a1 + 56) + 8);
      id v421 = *(id *)(v196 + 40);
      load_certificate(v484 + 3, v360, v356, &v478, &v421);
      objc_storeStrong((id *)(v196 + 40), v421);
      if (v478 != -25300 && v478)
      {
        uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1109, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to query existing leaf certificate (%@/%@): %d", v197, v198, (uint64_t)v360);
      }
      else
      {
        uint64_t v199 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v200 = *(void **)(v199 + 40);
        *(void *)(v199 + 40) = 0;

        uint64_t v201 = *(void *)(*(void *)(a1 + 56) + 8);
        id v420 = *(id *)(v201 + 40);
        load_certificate((CFTypeRef *)v480 + 3, v360, v355, &v478, &v420);
        objc_storeStrong((id *)(v201 + 40), v420);
        if (v478 != -25300 && v478)
        {
          uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1117, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to query existing intermediate certificate (%@/%@): %d", v202, v203, (uint64_t)v360);
        }
        else
        {
          uint64_t v204 = *(void *)(*(void *)(a1 + 56) + 8);
          long long v205 = *(void **)(v204 + 40);
          *(void *)(v204 + 40) = 0;

          if (!v484[3] || !v480[3])
          {
            v351 = 0;
            v352 = 0;
            goto LABEL_197;
          }
          id v206 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
          long long v207 = (void *)v473[5];
          v473[5] = (uint64_t)v206;

          if (v473[5])
          {
            CFDataRef v212 = SecCertificateCopyData((SecCertificateRef)v484[3]);
            if (v212)
            {
              [(id)v473[5] appendData:v212];
              v352 = SecCertificateCopyData((SecCertificateRef)v480[3]);

              if (v352)
              {
                [(id)v473[5] appendData:v352];
                v215 = (void *)v473[5];
                uint64_t v216 = *(void *)(*(void *)(a1 + 56) + 8);
                id v419 = *(id *)(v216 + 40);
                char v217 = store_keychain_data(v215, v360, v361, &v419);
                objc_storeStrong((id *)(v216 + 40), v419);
                if (v217)
                {
                  delete_certificate(v360, v356, 0);
                  delete_certificate(v360, v355, 0);
                  v351 = 0;
                  goto LABEL_197;
                }
                uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1147, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to store leaf/intermediate certificates.", v218, v219, v331);
LABEL_167:
                id v34 = 0;
                id v35 = 0;
                CFDataRef v36 = 0;
                uint64_t v37 = 0;
                uint64_t v38 = 0;
                uint64_t v39 = 0;
                v351 = 0;
                goto LABEL_27;
              }
              uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1140, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy certificate data.", v213, v214, v331);
            }
            else
            {
              uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1132, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy certificate data.", v210, v211, v331);
            }
          }
          else
          {
            uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1126, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate data.", v208, v209, v331);
          }
        }
      }
    }
LABEL_165:
    id v34 = 0;
    id v35 = 0;
    CFDataRef v36 = 0;
    goto LABEL_77;
  }
  uint64_t v33 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 839, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate dictionary.", v19, v20, v331);
  id v34 = 0;
  id v35 = 0;
  CFDataRef v36 = 0;
  v354 = 0;
  id v350 = 0;
  CFTypeRef cf = 0;
LABEL_26:
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  id v363 = 0;
  v364 = 0;
  v351 = 0;
  v352 = 0;
  id v357 = 0;
  id v358 = 0;
  id v359 = 0;
  v360 = 0;
  id v361 = 0;
  id v362 = 0;
  v355 = 0;
  v356 = 0;
  id v365 = 0;
LABEL_27:
  uint64_t v40 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v41 = *(void **)(v40 + 40);
  *(void *)(v40 + 40) = v33;
LABEL_28:

LABEL_29:
  uint64_t v42 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_320;
  block[3] = &unk_1E6CD5DF0;
  long long v346 = *(_OWORD *)(a1 + 48);
  id v43 = (id)v346;
  long long v371 = v346;
  v372 = &v500;
  v373 = &v504;
  dispatch_async(v42, block);
  uint64_t v44 = v497;
  uint64_t v45 = (const void *)v497[3];
  if (v45)
  {
    CFRelease(v45);
    uint64_t v44 = v497;
  }
  v44[3] = 0;
  uint64_t v46 = v493;
  BOOL v47 = (const void *)v493[3];
  if (v47)
  {
    CFRelease(v47);
    uint64_t v46 = v493;
  }
  v46[3] = 0;
  uint64_t v48 = v489;
  id v49 = (const void *)v489[3];
  if (v49)
  {
    CFRelease(v49);
    uint64_t v48 = v489;
  }
  v48[3] = 0;
  id v50 = v484;
  CFTypeRef v51 = v484[3];
  if (v51)
  {
    CFRelease(v51);
    id v50 = v484;
  }
  v50[3] = 0;
  uint64_t v52 = v480;
  uint64_t v53 = (const void *)v480[3];
  if (v53)
  {
    CFRelease(v53);
    uint64_t v52 = v480;
  }
  id v54 = 0;
  uint64_t v55 = (id *)&v371;
  v52[3] = 0;
LABEL_40:

  if (v14) {
    CFRelease(v14);
  }
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  if (cf) {
    CFRelease(cf);
  }
  _Block_object_dispose(&v428, 8);
  _Block_object_dispose(&v432, 8);
  _Block_object_dispose(&v438, 8);

  _Block_object_dispose(&v442, 8);
  _Block_object_dispose(&v448, 8);

  _Block_object_dispose(&v454, 8);
  _Block_object_dispose(&v460, 8);

  _Block_object_dispose(&v466, 8);
  _Block_object_dispose(&v472, 8);

  _Block_object_dispose(&v479, 8);
  _Block_object_dispose(&v483, 8);
  _Block_object_dispose(&v488, 8);
  _Block_object_dispose(&v492, 8);
  _Block_object_dispose(&v496, 8);
  _Block_object_dispose(&v500, 8);

  _Block_object_dispose(&v504, 8);
  _Block_object_dispose(v510, 8);
}

void sub_1DD6E2B10(_Unwind_Exception *a1)
{
}

BOOL isAutomaticTimeEnabledWithError(void *a1)
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  char v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38E82B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mobileactivationd" options:4096];
  [v3 setRemoteObjectInterface:v2];
  [v3 resume];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __isAutomaticTimeEnabledWithError_block_invoke;
  v9[3] = &unk_1E6CD5D50;
  v9[4] = &v14;
  uint64_t v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __isAutomaticTimeEnabledWithError_block_invoke_2;
  v8[3] = &unk_1E6CD5D78;
  v8[4] = &v10;
  v8[5] = &v14;
  [v4 copyAutomaticTimeEnabledWithCompletion:v8];
  id v5 = (void *)v15[5];
  if (v5)
  {
    BOOL v6 = 0;
    if (!a1) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v6 = *((unsigned char *)v11 + 24) != 0;
    if (!a1) {
      goto LABEL_7;
    }
  }
  if (!v6) {
    *a1 = v5;
  }
LABEL_7:
  [v3 invalidate];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void sub_1DD6E2DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

double copyMonotonicClock(void *a1)
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  char v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v10 = 0;
  char v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38E82B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mobileactivationd" options:4096];
  [v3 setRemoteObjectInterface:v2];
  [v3 resume];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __copyMonotonicClock_block_invoke;
  v9[3] = &unk_1E6CD5D50;
  v9[4] = &v14;
  uint64_t v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __copyMonotonicClock_block_invoke_2;
  v8[3] = &unk_1E6CD5D78;
  v8[4] = &v10;
  v8[5] = &v14;
  [v4 copyMonotonicClockWithCompletionBlock:v8];
  id v5 = (void *)v15[5];
  double v6 = 0.0;
  if (!v5) {
    double v6 = v11[3];
  }
  if (a1 && v6 == 0.0) {
    *a1 = v5;
  }
  [v3 invalidate];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void sub_1DD6E3018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t copyRTCResetCountWithError(void *a1)
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  char v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38E82B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mobileactivationd" options:4096];
  [v3 setRemoteObjectInterface:v2];
  [v3 resume];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __copyRTCResetCountWithError_block_invoke;
  v9[3] = &unk_1E6CD5D50;
  v9[4] = &v14;
  uint64_t v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __copyRTCResetCountWithError_block_invoke_2;
  v8[3] = &unk_1E6CD5D78;
  v8[4] = &v10;
  v8[5] = &v14;
  [v4 copyRTCResetCountWithCompletionBlock:v8];
  id v5 = (void *)v15[5];
  if (v5)
  {
    uint64_t v6 = 0;
    if (!a1) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = *((unsigned int *)v11 + 6);
    if (!a1) {
      goto LABEL_7;
    }
  }
  if (!v6) {
    *a1 = v5;
  }
LABEL_7:
  [v3 invalidate];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void sub_1DD6E3238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

id copyCertificateOIDsThatDiffer(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if (copyCertificateOIDsThatDiffer_onceToken != -1) {
      dispatch_once(&copyCertificateOIDsThatDiffer_onceToken, &__block_literal_global_336);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          if ([(id)copyCertificateOIDsThatDiffer_supportedOIDs containsObject:v9])
          {
            uint64_t v10 = (void *)SecCertificateCopyExtensionValue();

            if (!v10) {
              [v3 addObject:v9];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v6);
    }
    id v22 = v2;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = (id)copyCertificateOIDsThatDiffer_supportedOIDs;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * j);
          uint64_t v17 = SecCertificateCopyExtensionValue();
          if (v17)
          {
            char v18 = (void *)v17;
            char v19 = [v4 containsObject:v16];

            if ((v19 & 1) == 0) {
              [v3 addObject:v16];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v13);
    }

    id v20 = v3;
    id v2 = v22;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

uint64_t isFactoryMFiCertificate(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return 0;
  }
  if (![a1 isEqualToString:@"com.apple.mfiaccessory"]) {
    return 0;
  }
  id v2 = (void *)SecCertificateCopyIssuerSummary();
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  uint64_t v4 = [v2 isEqualToString:@"Apple Accessory Host Attestation Authority - 00000002"];
  CFRelease(v3);
  return v4;
}

void __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38E82B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mobileactivationd" options:4096];
  [v3 setRemoteObjectInterface:v2];
  [v3 resume];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v5 = [v4 objectForKey:@"AccessControls"];

  if (v5)
  {
    [v4 removeObjectForKey:@"AccessControls"];
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"UseRKSigningInterface"];
  }
  [v4 removeObjectForKey:@"LocalAuthenticationContext"];
  [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"AppID"];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_3;
  v45[3] = &unk_1E6CD5D50;
  v45[4] = *(void *)(a1 + 152);
  uint64_t v6 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v45];
  uint64_t v7 = *(void *)(a1 + 48);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_4;
  v42[3] = &unk_1E6CD5DC8;
  long long v43 = *(_OWORD *)(a1 + 160);
  uint64_t v44 = *(void *)(a1 + 152);
  [v6 issueClientCertificateWithReferenceKey:v7 options:v4 completion:v42];
  [v3 invalidate];
  uint64_t v8 = copyDeviceIdentitySerialQueue();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5;
  v15[3] = &unk_1E6CD5E18;
  long long v29 = *(_OWORD *)(a1 + 152);
  uint64_t v30 = *(void *)(a1 + 168);
  id v16 = *(id *)(a1 + 56);
  char v40 = *(unsigned char *)(a1 + 296);
  long long v31 = *(_OWORD *)(a1 + 176);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 80);
  id v20 = *(id *)(a1 + 88);
  id v21 = *(id *)(a1 + 96);
  id v22 = *(id *)(a1 + 104);
  id v23 = *(id *)(a1 + 112);
  id v24 = *(id *)(a1 + 120);
  long long v9 = *(_OWORD *)(a1 + 208);
  long long v32 = *(_OWORD *)(a1 + 192);
  long long v33 = v9;
  long long v34 = *(_OWORD *)(a1 + 224);
  id v25 = *(id *)(a1 + 32);
  long long v10 = *(_OWORD *)(a1 + 256);
  long long v35 = *(_OWORD *)(a1 + 240);
  long long v36 = v10;
  uint64_t v37 = *(void *)(a1 + 272);
  id v11 = *(id *)(a1 + 128);
  uint64_t v12 = *(void *)(a1 + 280);
  id v26 = v11;
  uint64_t v38 = v12;
  char v41 = *(unsigned char *)(a1 + 297);
  id v27 = *(id *)(a1 + 136);
  id v13 = *(id *)(a1 + 144);
  uint64_t v14 = *(void *)(a1 + 288);
  id v28 = v13;
  uint64_t v39 = v14;
  dispatch_async(v8, v15);
}

uint64_t __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_3", 1438, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.", a7, a8, v10);
  return MEMORY[0x1F41817F8]();
}

void __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_4(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"RKCertification"];
  uint64_t v8 = isNSArray(v7);
  uint64_t v9 = *(void *)(a1[4] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = [v6 objectForKeyedSubscript:@"ServerResponseDate"];

  uint64_t v12 = isNSDate(v11);
  uint64_t v13 = *(void *)(a1[5] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v5;
}

void __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v202 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40)) {
    goto LABEL_16;
  }
  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 144) + 8) + 40);
  if (!v9 || [v9 count] != 2 || !*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40))
  {
    id v20 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
    id v21 = @"Invalid response.";
    uint64_t v22 = 1457;
LABEL_15:
    uint64_t v23 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5", v22, @"com.apple.MobileActivation.ErrorDomain", -1, v20, v21, a7, a8, v159);
    uint64_t v24 = *(void *)(*(void *)(a1 + 136) + 8);
    id v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

LABEL_16:
    int v26 = 0;
    goto LABEL_17;
  }
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  id v10 = *(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v183 objects:v201 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v184;
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v184 != v13) {
          objc_enumerationMutation(v10);
        }
        SecCertificateRef v16 = SecCertificateCreateWithData(v14, *(CFDataRef *)(*((void *)&v183 + 1) + 8 * i));
        if (!v16)
        {
          uint64_t v63 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5", 1471, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create certificate.", v17, v18, v159);
          uint64_t v64 = *(void *)(*(void *)(a1 + 136) + 8);
          uint64_t v65 = *(void **)(v64 + 40);
          *(void *)(v64 + 40) = v63;

          goto LABEL_51;
        }
        SecCertificateRef v19 = v16;
        [*(id *)(a1 + 32) addObject:v16];
        CFRelease(v19);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v183 objects:v201 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_51:

  if (*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40)) {
    goto LABEL_16;
  }
  if (*(unsigned char *)(a1 + 280)) {
    [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40)];
  }
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v67 = *(void *)(*(void *)(a1 + 160) + 8);
  CFErrorRef v68 = *(void **)(v67 + 40);
  *(void *)(v67 + 40) = v66;

  uint64_t v69 = *(void **)(*(void *)(*(void *)(a1 + 160) + 8) + 40);
  if (!v69)
  {
    id v20 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
    id v21 = @"Failed to allocate data.";
    uint64_t v22 = 1489;
    goto LABEL_15;
  }
  uint64_t v70 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) objectAtIndexedSubscript:0];
  [v69 appendData:v70];

  uint64_t v71 = *(void **)(*(void *)(*(void *)(a1 + 160) + 8) + 40);
  uint64_t v72 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) objectAtIndexedSubscript:1];
  [v71 appendData:v72];

  uint64_t v73 = *(__SecKey **)(*(void *)(*(void *)(a1 + 168) + 8) + 24);
  CFTypeID v74 = *(void **)(a1 + 40);
  unsigned int v75 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
  uint64_t v76 = *(void *)(*(void *)(a1 + 136) + 8);
  id obj = *(id *)(v76 + 40);
  LOBYTE(v73) = security_certificate_matches_key(v73, v74, v75, &obj);
  objc_storeStrong((id *)(v76 + 40), obj);

  if ((v73 & 1) == 0)
  {
    id v20 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
    id v21 = @"Invalid reference key.";
    uint64_t v22 = 1497;
    goto LABEL_15;
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t v77 = *(void **)(a1 + 56);
    if (v77)
    {
      uint64_t v78 = *(void **)(a1 + 64);
      uint64_t v79 = *(void *)(*(void *)(a1 + 136) + 8);
      id v181 = *(id *)(v79 + 40);
      char v80 = delete_keychain_data(v77, v78, &v181);
      objc_storeStrong((id *)(v79 + 40), v181);
      if (v80)
      {
        uint64_t v83 = *(void **)(a1 + 56);
        uint64_t v84 = *(void **)(a1 + 72);
        uint64_t v85 = *(void *)(*(void *)(a1 + 136) + 8);
        id v180 = *(id *)(v85 + 40);
        char v86 = delete_keychain_item(v83, v84, &v180);
        objc_storeStrong((id *)(v85 + 40), v180);
        if (v86)
        {
          uint64_t v87 = *(void **)(a1 + 56);
          uint64_t v88 = *(void **)(a1 + 80);
          uint64_t v89 = *(void *)(*(void *)(a1 + 136) + 8);
          id v179 = *(id *)(v89 + 40);
          char v90 = delete_keychain_data(v87, v88, &v179);
          objc_storeStrong((id *)(v89 + 40), v179);
          if (v90)
          {
            uint64_t v91 = *(void **)(a1 + 56);
            uint64_t v92 = *(void **)(a1 + 88);
            uint64_t v93 = *(void *)(*(void *)(a1 + 136) + 8);
            id v178 = *(id *)(v93 + 40);
            char v94 = delete_keychain_data(v91, v92, &v178);
            objc_storeStrong((id *)(v93 + 40), v178);
            if (v94)
            {
              uint64_t v95 = *(void **)(a1 + 56);
              uint64_t v96 = *(void **)(a1 + 96);
              uint64_t v97 = *(void *)(*(void *)(a1 + 136) + 8);
              id v177 = *(id *)(v97 + 40);
              char v98 = delete_keychain_data(v95, v96, &v177);
              objc_storeStrong((id *)(v97 + 40), v177);
              if (v98)
              {
                if (*(double *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) != 0.0)
                {
                  uint64_t v99 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*(void *)(*(void *)(a1 + 176) + 8) + 24 length:8];
                  uint64_t v100 = *(void *)(*(void *)(a1 + 184) + 8);
                  int v101 = *(void **)(v100 + 40);
                  *(void *)(v100 + 40) = v99;

                  CFDataRef v104 = *(void **)(*(void *)(*(void *)(a1 + 184) + 8) + 40);
                  if (!v104)
                  {
                    int v153 = @"Failed to encode monotonic time.";
                    uint64_t v154 = 1537;
                    goto LABEL_89;
                  }
                  v105 = *(void **)(a1 + 56);
                  id v106 = *(void **)(a1 + 80);
                  uint64_t v107 = *(void *)(*(void *)(a1 + 136) + 8);
                  id v176 = *(id *)(v107 + 40);
                  char v108 = store_keychain_data(v104, v105, v106, &v176);
                  objc_storeStrong((id *)(v107 + 40), v176);
                  if ((v108 & 1) == 0)
                  {
                    uint64_t v155 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
                    int v153 = @"Failed to store monotonic time.";
                    uint64_t v154 = 1542;
                    goto LABEL_93;
                  }
                  uint64_t v109 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*(void *)(*(void *)(a1 + 200) + 8) + 24 length:4];
                  uint64_t v110 = *(void *)(*(void *)(a1 + 192) + 8);
                  uint64_t v111 = *(void **)(v110 + 40);
                  *(void *)(v110 + 40) = v109;

                  id v112 = *(void **)(*(void *)(*(void *)(a1 + 192) + 8) + 40);
                  if (!v112)
                  {
                    int v153 = @"Failed to encode RTC reset count.";
                    uint64_t v154 = 1548;
                    goto LABEL_89;
                  }
                  uint64_t v113 = *(void **)(a1 + 56);
                  uint64_t v114 = *(void **)(a1 + 88);
                  uint64_t v115 = *(void *)(*(void *)(a1 + 136) + 8);
                  id v175 = *(id *)(v115 + 40);
                  char v116 = store_keychain_data(v112, v113, v114, &v175);
                  objc_storeStrong((id *)(v115 + 40), v175);
                  if ((v116 & 1) == 0)
                  {
                    uint64_t v155 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
                    int v153 = @"Failed to store RTC reset count.";
                    uint64_t v154 = 1553;
                    goto LABEL_93;
                  }
                }
                [*(id *)(*(void *)(*(void *)(a1 + 152) + 8) + 40) timeIntervalSinceReferenceDate];
                *(void *)(*(void *)(*(void *)(a1 + 208) + 8) + 24) = v117;
                uint64_t v118 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*(void *)(*(void *)(a1 + 208) + 8) + 24 length:8];
                uint64_t v119 = *(void *)(*(void *)(a1 + 216) + 8);
                int v120 = *(void **)(v119 + 40);
                *(void *)(v119 + 40) = v118;

                uint64_t v121 = *(void **)(*(void *)(*(void *)(a1 + 216) + 8) + 40);
                if (v121)
                {
                  uint64_t v122 = *(void **)(a1 + 56);
                  uint64_t v123 = *(void **)(a1 + 96);
                  uint64_t v124 = *(void *)(*(void *)(a1 + 136) + 8);
                  id v174 = *(id *)(v124 + 40);
                  char v125 = store_keychain_data(v121, v122, v123, &v174);
                  objc_storeStrong((id *)(v124 + 40), v174);
                  if (v125)
                  {
                    uint64_t v126 = *(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 24);
                    uint64_t v127 = *(void **)(a1 + 56);
                    uint64_t v128 = *(void **)(a1 + 72);
                    uint64_t v129 = *(void **)(a1 + 104);
                    uint64_t v130 = *(void *)(*(void *)(a1 + 136) + 8);
                    id v173 = *(id *)(v130 + 40);
                    char v131 = store_keychain_item(v126, v127, v128, v129, &v173);
                    objc_storeStrong((id *)(v130 + 40), v173);
                    if (v131)
                    {
                      uint64_t v132 = *(void **)(*(void *)(*(void *)(a1 + 160) + 8) + 40);
                      uint64_t v133 = *(void **)(a1 + 56);
                      uint64_t v134 = *(void **)(a1 + 64);
                      uint64_t v135 = *(void *)(*(void *)(a1 + 136) + 8);
                      id v172 = *(id *)(v135 + 40);
                      char v136 = store_keychain_data(v132, v133, v134, &v172);
                      objc_storeStrong((id *)(v135 + 40), v172);
                      if (v136)
                      {
                        int v26 = 1;
                        goto LABEL_76;
                      }
                      uint64_t v155 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
                      int v153 = @"Failed to store leaf/intermediate certificates.";
                      uint64_t v154 = 1577;
                    }
                    else
                    {
                      uint64_t v155 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
                      int v153 = @"Failed to store reference key.";
                      uint64_t v154 = 1572;
                    }
                  }
                  else
                  {
                    uint64_t v155 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
                    int v153 = @"Failed to store server timestamp.";
                    uint64_t v154 = 1567;
                  }
LABEL_93:
                  uint64_t v156 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5", v154, @"com.apple.MobileActivation.ErrorDomain", -1, v155, v153, v102, v103, v159);
                  uint64_t v157 = *(void *)(*(void *)(a1 + 136) + 8);
                  uint64_t v158 = *(void **)(v157 + 40);
                  *(void *)(v157 + 40) = v156;

                  int v26 = 1;
                  goto LABEL_17;
                }
                int v153 = @"Failed to encode server timestamp.";
                uint64_t v154 = 1562;
LABEL_89:
                uint64_t v155 = 0;
                goto LABEL_93;
              }
              uint64_t v147 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
              uint64_t v148 = @"Failed to delete server timestamp.";
              uint64_t v149 = 1530;
            }
            else
            {
              uint64_t v147 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
              uint64_t v148 = @"Failed to delete RTC reset count.";
              uint64_t v149 = 1525;
            }
          }
          else
          {
            uint64_t v147 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
            uint64_t v148 = @"Failed to delete monotonic time.";
            uint64_t v149 = 1520;
          }
        }
        else
        {
          uint64_t v147 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
          uint64_t v148 = @"Failed to delete reference key.";
          uint64_t v149 = 1515;
        }
      }
      else
      {
        uint64_t v147 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
        uint64_t v148 = @"Failed to delete leaf/intermediate certificates.";
        uint64_t v149 = 1510;
      }
      uint64_t v150 = createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5", v149, @"com.apple.MobileActivation.ErrorDomain", -1, v147, v148, v81, v82, v159);
      uint64_t v151 = *(void *)(*(void *)(a1 + 136) + 8);
      uint64_t v152 = *(void **)(v151 + 40);
      *(void *)(v151 + 40) = v150;

      int v26 = 1;
      goto LABEL_17;
    }
  }
  int v26 = 0;
LABEL_76:
  *(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 24) = CFRetain(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 168) + 8)
                                                                                       + 24));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40), *(id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v137 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:0];
    uint64_t v138 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v168 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:0];
    SecCertificateNotValidBefore();
    uint64_t v163 = objc_msgSend(v138, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v139 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v165 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:0];
    SecCertificateNotValidAfter();
    uint64_t v140 = objc_msgSend(v139, "dateWithTimeIntervalSinceReferenceDate:");
    id v160 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:1];
    uint64_t v141 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v161 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:1];
    SecCertificateNotValidBefore();
    uint64_t v142 = objc_msgSend(v141, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v143 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v144 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:1];
    SecCertificateNotValidAfter();
    uint64_t v145 = objc_msgSend(v143, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v146 = *(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40);
    *(_DWORD *)buf = 138544898;
    uint64_t v188 = v137;
    __int16 v189 = 2114;
    BOOL v190 = v163;
    __int16 v191 = 2114;
    uint64_t v192 = v140;
    __int16 v193 = 2114;
    unint64_t v194 = v160;
    __int16 v195 = 2114;
    uint64_t v196 = v142;
    __int16 v197 = 2114;
    uint64_t v198 = v145;
    __int16 v199 = 2114;
    uint64_t v200 = v146;
    _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Returning newly obtained certificates:\n* %{public}@\n    Not Valid Before: %{public}@\n    Not Valid After: %{public}@\n* %{public}@\n    Not Valid Before: %{public}@\n    Not Valid After: %{public}@\n* Server Timestamp: %{public}@\n", buf, 0x48u);
  }
LABEL_17:
  if (!*(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 24)
    && !*(void *)(*(void *)(*(void *)(a1 + 232) + 8) + 40))
  {
    if ((v26 | mobileactivationErrorHasDomainAndErrorCode(*(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40), (void *)*MEMORY[0x1E4F25268], -3)) == 1&& *(void *)(a1 + 48)&& *(void *)(a1 + 56))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        char v40 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v188 = v40;
        _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Deleting invalid keys/certificates: %@", buf, 0xCu);
      }
      delete_keychain_data(*(void **)(a1 + 56), *(void **)(a1 + 64), 0);
      delete_keychain_item(*(void **)(a1 + 56), *(void **)(a1 + 72), 0);
      delete_keychain_data(*(void **)(a1 + 56), *(void **)(a1 + 80), 0);
      delete_keychain_data(*(void **)(a1 + 56), *(void **)(a1 + 88), 0);
      delete_keychain_data(*(void **)(a1 + 56), *(void **)(a1 + 96), 0);
      uint64_t v41 = *(void *)(*(void *)(a1 + 240) + 8);
      uint64_t v42 = *(const void **)(v41 + 24);
      if (v42)
      {
        CFRelease(v42);
        uint64_t v41 = *(void *)(*(void *)(a1 + 240) + 8);
      }
      *(void *)(v41 + 24) = 0;
      uint64_t v43 = *(void *)(*(void *)(a1 + 248) + 8);
      uint64_t v44 = *(const void **)(v43 + 24);
      if (v44)
      {
        CFRelease(v44);
        uint64_t v43 = *(void *)(*(void *)(a1 + 248) + 8);
      }
      *(void *)(v43 + 24) = 0;
      uint64_t v45 = *(void *)(*(void *)(a1 + 256) + 8);
      uint64_t v46 = *(const void **)(v45 + 24);
      if (v46)
      {
        CFRelease(v46);
        uint64_t v45 = *(void *)(*(void *)(a1 + 256) + 8);
      }
      *(void *)(v45 + 24) = 0;
    }
    BOOL v47 = *(const void **)(*(void *)(*(void *)(a1 + 240) + 8) + 24);
    if (v47 && *(void *)(a1 + 112))
    {
      *(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 24) = CFRetain(v47);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40), *(id *)(a1 + 112));
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v48 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:0];
        id v49 = (void *)MEMORY[0x1E4F1C9C8];
        uint64_t v167 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:0];
        SecCertificateNotValidBefore();
        uint64_t v162 = objc_msgSend(v49, "dateWithTimeIntervalSinceReferenceDate:");
        id v50 = (void *)MEMORY[0x1E4F1C9C8];
        uint64_t v164 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:0];
        SecCertificateNotValidAfter();
        CFTypeRef v51 = objc_msgSend(v50, "dateWithTimeIntervalSinceReferenceDate:");
        uint64_t v52 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:1];
        uint64_t v53 = (void *)MEMORY[0x1E4F1C9C8];
        id v54 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:1];
        SecCertificateNotValidBefore();
        uint64_t v55 = objc_msgSend(v53, "dateWithTimeIntervalSinceReferenceDate:");
        CFErrorRef v56 = (void *)MEMORY[0x1E4F1C9C8];
        uint64_t v57 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) objectAtIndexedSubscript:1];
        SecCertificateNotValidAfter();
        uint64_t v58 = objc_msgSend(v56, "dateWithTimeIntervalSinceReferenceDate:");
        uint64_t v59 = *(void *)(*(void *)(*(void *)(a1 + 264) + 8) + 40);
        *(_DWORD *)buf = 138544898;
        uint64_t v188 = v48;
        __int16 v189 = 2114;
        BOOL v190 = v162;
        __int16 v191 = 2114;
        uint64_t v192 = v51;
        __int16 v193 = 2114;
        unint64_t v194 = v52;
        __int16 v195 = 2114;
        uint64_t v196 = v55;
        __int16 v197 = 2114;
        uint64_t v198 = v58;
        __int16 v199 = 2114;
        uint64_t v200 = v59;
        _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Returning cached certificates:\n* %{public}@\n    Not Valid Before: %{public}@\n    Not Valid After: %{public}@\n* %{public}@\n    Not Valid Before: %{public}@\n    Not Valid After: %{public}@\n* Server Timestamp: %{public}@\n", buf, 0x48u);
      }
      if (*(unsigned char *)(a1 + 281))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v60 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
          *(_DWORD *)buf = 138543362;
          uint64_t v188 = v60;
          _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ (non-fatal, existing valid certificates)", buf, 0xCu);
        }
        uint64_t v61 = *(void *)(*(void *)(a1 + 136) + 8);
        CFErrorRef v62 = *(void **)(v61 + 40);
        *(void *)(v61 + 40) = 0;
      }
    }
  }
  id v27 = *(NSObject **)(a1 + 120);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_317;
  block[3] = &unk_1E6CD5DF0;
  long long v166 = *(_OWORD *)(a1 + 128);
  id v28 = (id)v166;
  long long v29 = *(_OWORD *)(a1 + 224);
  long long v170 = v166;
  long long v171 = v29;
  dispatch_async(v27, block);
  uint64_t v30 = *(void *)(*(void *)(a1 + 168) + 8);
  long long v31 = *(const void **)(v30 + 24);
  if (v31)
  {
    CFRelease(v31);
    uint64_t v30 = *(void *)(*(void *)(a1 + 168) + 8);
  }
  *(void *)(v30 + 24) = 0;
  uint64_t v32 = *(void *)(*(void *)(a1 + 272) + 8);
  long long v33 = *(const void **)(v32 + 24);
  if (v33)
  {
    CFRelease(v33);
    uint64_t v32 = *(void *)(*(void *)(a1 + 272) + 8);
  }
  *(void *)(v32 + 24) = 0;
  uint64_t v34 = *(void *)(*(void *)(a1 + 240) + 8);
  long long v35 = *(const void **)(v34 + 24);
  if (v35)
  {
    CFRelease(v35);
    uint64_t v34 = *(void *)(*(void *)(a1 + 240) + 8);
  }
  *(void *)(v34 + 24) = 0;
  uint64_t v36 = *(void *)(*(void *)(a1 + 248) + 8);
  uint64_t v37 = *(const void **)(v36 + 24);
  if (v37)
  {
    CFRelease(v37);
    uint64_t v36 = *(void *)(*(void *)(a1 + 248) + 8);
  }
  *(void *)(v36 + 24) = 0;
  uint64_t v38 = *(void *)(*(void *)(a1 + 256) + 8);
  uint64_t v39 = *(const void **)(v38 + 24);
  if (v39)
  {
    CFRelease(v39);
    uint64_t v38 = *(void *)(*(void *)(a1 + 256) + 8);
  }
  *(void *)(v38 + 24) = 0;
}

uint64_t __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_317(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1[5] + 8) + 40) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 40);
    int v4 = 138543362;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(*(void *)(a1[6] + 8) + 24), *(void *)(*(void *)(a1[7] + 8) + 40), *(void *)(*(void *)(a1[5] + 8) + 40));
  }
  return result;
}

uint64_t __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_320(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1[5] + 8) + 40) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 40);
    int v4 = 138543362;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(*(void *)(a1[6] + 8) + 24), *(void *)(*(void *)(a1[7] + 8) + 40), *(void *)(*(void *)(a1[5] + 8) + 40));
  }
  return result;
}

id DeviceIdentityCreateHostSignature(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v10 = a2;
  if (!v7)
  {
    uint64_t v22 = @"Invalid input.";
    uint64_t v23 = 1735;
    uint64_t v24 = -2;
LABEL_10:
    createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignature", v23, @"com.apple.MobileActivation.ErrorDomain", v24, 0, v22, v8, v9, v27);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    id v17 = 0;
    id v21 = 0;
    goto LABEL_12;
  }
  if (!is_virtual_machine())
  {
    uint64_t v22 = @"Device is not a VM (not supported).";
    uint64_t v23 = 1740;
    uint64_t v24 = -3;
    goto LABEL_10;
  }
  id v30 = 0;
  has_host_SecKeyRef key = libavp_guest_has_host_key(&v30);
  id v12 = v30;
  uint64_t v15 = v12;
  if ((has_host_key & 1) == 0)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignature", 1745, @"com.apple.MobileActivation.ErrorDomain", -3, v12, @"Not supported on this device (VM support disabled).", v13, v14, v27);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  id v28 = v12;
  id v29 = 0;
  SecCertificateRef v16 = vm_create_host_key_signature(v7, 0, &v29, &v28);
  id v17 = v29;
  id v18 = v28;

  if (v16)
  {
    id v21 = v16;
    if (a3)
    {
      id v17 = v17;
      *a3 = v17;
      if (!v18) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
LABEL_12:
    if (!v18) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  uint64_t v26 = createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignature", 1751, @"com.apple.MobileActivation.ErrorDomain", -1, v18, @"Failed to create host key signature.", v19, v20, v27);

  id v21 = 0;
  id v18 = (id)v26;
  if (!v26) {
    goto LABEL_15;
  }
LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v32 = v18;
    _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
LABEL_15:
  if (a4 && !v21) {
    *a4 = v18;
  }

  return v21;
}

void DeviceIdentityCreateHostSignatureWithCompletion(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v12 = a4;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy_;
  uint64_t v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  if (v8)
  {
    if (is_virtual_machine())
    {
      uint64_t v15 = (id *)(v31 + 5);
      id obj = (id)v31[5];
      has_host_SecKeyRef key = libavp_guest_has_host_key(&obj);
      objc_storeStrong(v15, obj);
      if (has_host_key)
      {
        uint64_t v19 = v7;
        if (!v19)
        {
          uint64_t v19 = dispatch_get_global_queue(0, 0);
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __DeviceIdentityCreateHostSignatureWithCompletion_block_invoke;
        block[3] = &unk_1E6CD5E90;
        id v25 = v8;
        id v26 = v9;
        id v28 = &v30;
        id v27 = v12;
        dispatch_async(v19, block);

        goto LABEL_15;
      }
      uint64_t v20 = createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion", 1792, @"com.apple.MobileActivation.ErrorDomain", -3, (void *)v31[5], @"Not supported on this device (VM support disabled).", v17, v18, v23);
    }
    else
    {
      uint64_t v20 = createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion", 1787, @"com.apple.MobileActivation.ErrorDomain", -3, 0, @"Device is not a VM (not supported).", v13, v14, v23);
    }
  }
  else
  {
    uint64_t v20 = createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion", 1782, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.", v10, v11, v23);
  }
  id v21 = (void *)v31[5];
  v31[5] = v20;

  if (v31[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = v31[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v37 = v22;
    _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  if (v12) {
    (*((void (**)(id, void, void, uint64_t))v12 + 2))(v12, 0, 0, v31[5]);
  }
LABEL_15:
  _Block_object_dispose(&v30, 8);
}

void sub_1DD6E520C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __DeviceIdentityCreateHostSignatureWithCompletion_block_invoke(void *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  id v3 = (void *)a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  id v33 = 0;
  uint64_t v5 = vm_create_host_key_signature(v2, v3, &v33, &obj);
  id v6 = v33;
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!v5)
  {
    uint64_t v25 = createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion_block_invoke", 1813, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(a1[7] + 8) + 40), @"Failed to create host key signature.", v7, v8, v30);
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v31 = *(id *)(v9 + 40);
  uint64_t v10 = parseDERCertificatesFromChain(v6, &v31);
  objc_storeStrong((id *)(v9 + 40), v31);
  if (!v10 || [v10 count] != 2)
  {
    uint64_t v25 = createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion_block_invoke", 1819, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(a1[7] + 8) + 40), @"Failed to parse certificate data.", v11, v12, v30);
LABEL_10:
    SecCertificateRef v15 = 0;
LABEL_11:
    SecCertificateRef v19 = 0;
    goto LABEL_12;
  }
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef v14 = [v10 objectAtIndexedSubscript:0];
  SecCertificateRef v15 = SecCertificateCreateWithData(v13, v14);

  if (!v15)
  {
    uint64_t v25 = createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion_block_invoke", 1825, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create certificate.", v16, v17, v30);
    goto LABEL_11;
  }
  CFDataRef v18 = [v10 objectAtIndexedSubscript:1];
  SecCertificateRef v19 = SecCertificateCreateWithData(v13, v18);

  if (!v19)
  {
    uint64_t v25 = createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion_block_invoke", 1831, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create certificate.", v20, v21, v30);
    goto LABEL_12;
  }
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v15];

  if (!v22)
  {
    uint64_t v25 = createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion_block_invoke", 1837, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to encode certificate chain.", v23, v24, (uint64_t)v19);
    uint64_t v10 = 0;
LABEL_12:
    uint64_t v26 = *(void *)(a1[7] + 8);
    id v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    uint64_t v22 = v10;
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 40) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = *(void *)(*(void *)(a1[7] + 8) + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v35 = v28;
    _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v29 = a1[6];
  if (v29) {
    (*(void (**)(uint64_t, void *, void *, void))(v29 + 16))(v29, v5, v22, *(void *)(*(void *)(a1[7] + 8) + 40));
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v19) {
    CFRelease(v19);
  }
}

void __copyDeviceIdentitySerialQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mobileactivationd.deviceidentity", v2);
  uint64_t v1 = (void *)copyDeviceIdentitySerialQueue_queue;
  copyDeviceIdentitySerialQueue_char queue = (uint64_t)v0;
}

uint64_t __isAutomaticTimeEnabledWithError_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = createMobileActivationError((uint64_t)"isAutomaticTimeEnabledWithError_block_invoke", 232, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), @"IPC Error.", a7, a8, v10);
  return MEMORY[0x1F41817F8]();
}

void __isAutomaticTimeEnabledWithError_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [v11 objectForKeyedSubscript:@"AutomaticTimeEnabled"];
  uint64_t v7 = isNSNumber(v6);

  if (v7)
  {
    uint64_t v8 = [v11 objectForKeyedSubscript:@"AutomaticTimeEnabled"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v8 BOOLValue];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

uint64_t __copyMonotonicClock_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = createMobileActivationError((uint64_t)"copyMonotonicClock_block_invoke", 185, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), @"IPC Error.", a7, a8, v10);
  return MEMORY[0x1F41817F8]();
}

void __copyMonotonicClock_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [v12 objectForKeyedSubscript:@"MonotonicClockNow"];
  uint64_t v7 = isNSNumber(v6);

  if (v7)
  {
    uint64_t v8 = [v12 objectForKeyedSubscript:@"MonotonicClockNow"];
    [v8 doubleValue];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

uint64_t __copyRTCResetCountWithError_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = createMobileActivationError((uint64_t)"copyRTCResetCountWithError_block_invoke", 138, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), @"IPC Error.", a7, a8, v10);
  return MEMORY[0x1F41817F8]();
}

void __copyRTCResetCountWithError_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [v11 objectForKeyedSubscript:@"TotalRTCResetCount"];
  uint64_t v7 = isNSNumber(v6);

  if (v7)
  {
    uint64_t v8 = [v11 objectForKeyedSubscript:@"TotalRTCResetCount"];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v8 unsignedIntValue];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

uint64_t __copyCertificateOIDsThatDiffer_block_invoke()
{
  copyCertificateOIDsThatDiffer_supportedOIDs = copy_supported_baa_oids();
  return MEMORY[0x1F41817F8]();
}

id copy_group_container_path(uint64_t a1)
{
  if (a1 && (uint64_t v1 = container_system_group_path_for_identifier()) != 0)
  {
    uint64_t v2 = (void *)v1;
    id v3 = [NSString stringWithUTF8String:v1];
    free(v2);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

id copy_ucrt_path()
{
  if (copy_ucrt_path_onceToken != -1) {
    dispatch_once(&copy_ucrt_path_onceToken, &__block_literal_global_62);
  }
  dispatch_queue_t v0 = (void *)copy_ucrt_path_retval;
  return v0;
}

void __copy_ucrt_path_block_invoke()
{
  dispatch_queue_t v0 = copy_group_container_path([@"systemgroup.com.apple.mobileactivationd" UTF8String]);
  if (v0)
  {
    id v3 = v0;
    uint64_t v1 = [v0 stringByAppendingPathComponent:@"Library/ucrt"];
    uint64_t v2 = (void *)copy_ucrt_path_retval;
    copy_ucrt_path_retval = v1;

    dispatch_queue_t v0 = v3;
  }
}

id copyPersonalizedFirmwareData(uint64_t a1, void *a2)
{
  if (getMSUDataAccessorClass())
  {
    id v6 = [getMSUDataAccessorClass() sharedDataAccessor];
    id v20 = 0;
    uint64_t v7 = (void *)[v6 copyPathForPersonalizedData:a1 error:&v20];
    id v8 = v20;

    if (v7)
    {
      id v19 = v8;
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7 options:0 error:&v19];
      id v12 = v19;

      if (v11)
      {
        id v15 = v11;
        goto LABEL_11;
      }
      uint64_t v16 = createMobileActivationError((uint64_t)"copyPersonalizedFirmwareData", 41, @"com.apple.MobileActivation.ErrorDomain", -1, v12, @"Failed to load firmware data from %@.", v13, v14, (uint64_t)v7);

      id v12 = (id)v16;
      if (!a2) {
        goto LABEL_10;
      }
LABEL_8:
      id v12 = v12;
      id v15 = 0;
      *a2 = v12;
      goto LABEL_11;
    }
    createMobileActivationError((uint64_t)"copyPersonalizedFirmwareData", 35, @"com.apple.MobileActivation.ErrorDomain", -1, v8, @"Failed to retrieve path for firmware data type %d.", v9, v10, a1);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a2) {
      goto LABEL_8;
    }
  }
  else
  {
    createMobileActivationError((uint64_t)"copyPersonalizedFirmwareData", 29, @"com.apple.MobileActivation.ErrorDomain", -3, 0, @"MSUDataAccessor is not supported on this platform.", v4, v5, v18);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
LABEL_10:
  id v15 = 0;
LABEL_11:

  return v15;
}

id getMSUDataAccessorClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getMSUDataAccessorClass_softClass;
  uint64_t v7 = getMSUDataAccessorClass_softClass;
  if (!getMSUDataAccessorClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMSUDataAccessorClass_block_invoke;
    v3[3] = &unk_1E6CD5CF0;
    v3[4] = &v4;
    __getMSUDataAccessorClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DD6E5F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMSUDataAccessorClass_block_invoke(uint64_t a1)
{
  if (!MSUDataAccessorLibraryCore_frameworkLibrary) {
    MSUDataAccessorLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("MSUDataAccessor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMSUDataAccessorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MSUDataAccessorLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MSUDataAccessorLibraryCore_frameworkLibrary = result;
  return result;
}

id createMobileActivationError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = a3;
  id v15 = a5;
  uint64_t v16 = (objc_class *)MEMORY[0x1E4F28E78];
  id v17 = a6;
  uint64_t v18 = (void *)[[v16 alloc] initWithFormat:v17 arguments:&a9];

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v20 = v19;
  if (v18) {
    [v19 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  if (v15) {
    [v20 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      uint64_t v21 = [NSString stringWithUTF8String:a1];
      [v20 setObject:v21 forKeyedSubscript:@"FunctionName"];
    }
    if (a2)
    {
      uint64_t v22 = [NSNumber numberWithUnsignedInt:a2];
      [v20 setObject:v22 forKeyedSubscript:@"SourceLine"];
    }
  }
  uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:v14 code:a4 userInfo:v20];

  return v23;
}

id copyRootCertificate(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch((int)a1)
  {
    case 1:
      BOOL v9 = a2 == 0;
      if (a2) {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIICGDCCAZ+gAwIBAgIIMyDS5tjDo60wCgYIKoZIzj0EAwMwUjEmMCQGA1UEAwwd\n"
              "VEVTVCBVQ1JUIEFUVEVTVEFUSU9OIFJPT1QgQ0ExEzARBgNVBAoMCkFwcGxlIElu\n"
              "Yy4xEzARBgNVBAgMCkNhbGlmb3JuaWEwHhcNMTcwMzE3MTg0NzIzWhcNMzIwMzE3\n"
              "MTg0NzIzWjBSMSYwJAYDVQQDDB1URVNUIFVDUlQgQVRURVNUQVRJT04gUk9PVCBD\n"
              "QTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTB2MBAG\n"
              "ByqGSM49AgEGBSuBBAAiA2IABK8j8XvaJOsMr8X6albKQ1LFlMi3k+b8Jooja8Qs\n"
              "0lsrRmax8FItjsoWcxj3c1sPjPF59FI2sCb+9cUZ8KgTeJ3b5748pO1XRGByMNHp\n"
              "tmIuLYRvqRHhkWl638PWGRUoYKNCMEAwHQYDVR0OBBYEFGnDBpAIQSifJVW2RWKm\n"
              "f6jT3iIXMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMAoGCCqGSM49\n"
              "BAMDA2cAMGQCMBFwSHXop87Ghm50PPMGFHtpB/o3K2Gx5747Q0mlR2qE0DsmrJSu\n"
              "2LO+9QEQL5HZRwIwBMg0g5oYcfMMDWwFSRESii+SqHxFgbmVuzHR5Cu0peL1MiMB\n"
              "nMjKoG3YyhB4geQ9\n"
              "-----END CERTIFICATE-----";
      else {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIICGjCCAaGgAwIBAgIIO0EdkA1/e+swCgYIKoZIzj0EAwMwUzEnMCUGA1UEAwwe\n"
              "QmFzaWMgQXR0ZXN0YXRpb24gVXNlciBSb290IENBMRMwEQYDVQQKDApBcHBsZSBJ\n"
              "bmMuMRMwEQYDVQQIDApDYWxpZm9ybmlhMB4XDTE3MDQxOTIxNDE1NloXDTMyMDMy\n"
              "MjAwMDAwMFowUzEnMCUGA1UEAwweQmFzaWMgQXR0ZXN0YXRpb24gVXNlciBSb290\n"
              "IENBMRMwEQYDVQQKDApBcHBsZSBJbmMuMRMwEQYDVQQIDApDYWxpZm9ybmlhMHYw\n"
              "EAYHKoZIzj0CAQYFK4EEACIDYgAE639EEPCGvFOPAbzd5eGJM46/I+N1rpRhPBc2\n"
              "+hvNC5vlVyv1hVNPSTIcF0sLPgCeEEQqGIZsUPO48ECh03YzXUT86015HwktM439\n"
              "bWGKGE/VRepW8S8EDRLh6+83XZ9do0IwQDAPBgNVHRMBAf8EBTADAQH/MB0GA1Ud\n"
              "DgQWBBSD5aMhnrB0w/lhkP2XTiMQdqSj8jAOBgNVHQ8BAf8EBAMCAQYwCgYIKoZI\n"
              "zj0EAwMDZwAwZAIwQol5uLqv1SXY9G1wHSx2EYIULFlLssYTnTwbSlZPj2yF9cgk\n"
              "7xJO8bw6nTklgnHhAjBgMvsir7UEVzw7uxn8y3GGf9KSCFV5scySrYDZnJhETYlc\n"
              "yPYSFsZIerKNPP6v28Y=\n"
              "-----END CERTIFICATE-----";
      id v11 = (unsigned int *)&QABAAUCRTRootCAPEMLen;
      id v12 = (unsigned int *)&BAAUCRTRootCAPEMLen;
      goto LABEL_48;
    case 2:
      BOOL v9 = a2 == 0;
      if (a2) {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIIB/zCCAYWgAwIBAgIIMyDS5tjDo6wwCgYIKoZIzj0EAwMwRTEZMBcGA1UEAwwQ\n"
              "VEVTVCBTRVAgUk9PVCBDQTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwK\n"
              "Q2FsaWZvcm5pYTAeFw0xNzAzMTcxNzQ4MzBaFw0zMjAzMTcxNzQ4MzBaMEUxGTAX\n"
              "BgNVBAMMEFRFU1QgU0VQIFJPT1QgQ0ExEzARBgNVBAoMCkFwcGxlIEluYy4xEzAR\n"
              "BgNVBAgMCkNhbGlmb3JuaWEwdjAQBgcqhkjOPQIBBgUrgQQAIgNiAARPM4laW0B+\n"
              "fOrILxB1SgluOqUops+ps7POnbPvuhEZq3A+/zMJpvuA9r81okf3hb2irmpUAuvd\n"
              "pbjz1pDf73/8VC/uMSJsWXEc39kpm2j6DwBOIxJ++OwnhEU7pf0gCQ6jQjBAMB0G\n"
              "A1UdDgQWBBRWyfg8mg8Ak5e1SZm7V0WL85j2NDAPBgNVHRMBAf8EBTADAQH/MA4G\n"
              "A1UdDwEB/wQEAwIBBjAKBggqhkjOPQQDAwNoADBlAjEAiOkQ9WnIfqiQXIKRjOhu\n"
              "eWd+RPxKGQt1XmVQZGiNDwIu6SVQ0UVDGZg4ywsotyLNAjAOQgMucccaDYgsmELm\n"
              "YpYzgzyReDQx/ajwQdc97/unxkOWYP/5TPptimsc9E0u9bU=\n"
              "-----END CERTIFICATE-----";
      else {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIICIDCCAaWgAwIBAgIIePhG1bNbWBcwCgYIKoZIzj0EAwMwVTEpMCcGA1UEAwwg\n"
              "QmFzaWMgQXR0ZXN0YXRpb24gU3lzdGVtIFJvb3QgQ0ExEzARBgNVBAoMCkFwcGxl\n"
              "IEluYy4xEzARBgNVBAgMCkNhbGlmb3JuaWEwHhcNMTcwNDIwMDAyMjA5WhcNMzIw\n"
              "MzIyMDAwMDAwWjBVMSkwJwYDVQQDDCBCYXNpYyBBdHRlc3RhdGlvbiBTeXN0ZW0g\n"
              "Um9vdCBDQTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5p\n"
              "YTB2MBAGByqGSM49AgEGBSuBBAAiA2IABN7OnRlUVkOVlHTw7UF9qForIhvM8pLL\n"
              "WTrHm6Be42c3LZFIM2RNT5FZZDkIgQfYLS6vsRpfrhEMKIHIWomtyuCxp2c/AIxu\n"
              "wEml4f2d8IktTRcNHwqKzUgzPJV3CyKh2KNCMEAwDwYDVR0TAQH/BAUwAwEB/zAd\n"
              "BgNVHQ4EFgQU/tHRwggHA9W5PDSyu/18OpklG48wDgYDVR0PAQH/BAQDAgEGMAoG\n"
              "CCqGSM49BAMDA2kAMGYCMQCmU03bvMmBE4X03P8MdpxEE/LpNcRmsnktIav8tpNh\n"
              "Gmo4mv2FyZKKvaJtO2OhIrwCMQDxMBcXge5NpWx/VBcFTj2Tb2VxQ8zMKbWapLE/\n"
              "HPN4kbBaiIIUl52drBlQjS/c3P8=\n"
              "-----END CERTIFICATE-----\n";
      id v11 = (unsigned int *)&QABAASCRTRootCAPEMLen;
      id v12 = (unsigned int *)&BAASCRTRootCAPEMLen;
      goto LABEL_48;
    case 3:
      BOOL v9 = a2 == 0;
      if (a2) {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIICGDCCAZ+gAwIBAgIIMyDS5tjDo60wCgYIKoZIzj0EAwMwUjEmMCQGA1UEAwwd\n"
              "VEVTVCBVQ1JUIEFUVEVTVEFUSU9OIFJPT1QgQ0ExEzARBgNVBAoMCkFwcGxlIElu\n"
              "Yy4xEzARBgNVBAgMCkNhbGlmb3JuaWEwHhcNMTcwMzE3MTg0NzIzWhcNMzIwMzE3\n"
              "MTg0NzIzWjBSMSYwJAYDVQQDDB1URVNUIFVDUlQgQVRURVNUQVRJT04gUk9PVCBD\n"
              "QTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTB2MBAG\n"
              "ByqGSM49AgEGBSuBBAAiA2IABK8j8XvaJOsMr8X6albKQ1LFlMi3k+b8Jooja8Qs\n"
              "0lsrRmax8FItjsoWcxj3c1sPjPF59FI2sCb+9cUZ8KgTeJ3b5748pO1XRGByMNHp\n"
              "tmIuLYRvqRHhkWl638PWGRUoYKNCMEAwHQYDVR0OBBYEFGnDBpAIQSifJVW2RWKm\n"
              "f6jT3iIXMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMAoGCCqGSM49\n"
              "BAMDA2cAMGQCMBFwSHXop87Ghm50PPMGFHtpB/o3K2Gx5747Q0mlR2qE0DsmrJSu\n"
              "2LO+9QEQL5HZRwIwBMg0g5oYcfMMDWwFSRESii+SqHxFgbmVuzHR5Cu0peL1MiMB\n"
              "nMjKoG3YyhB4geQ9\n"
              "-----END CERTIFICATE-----";
      else {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIIB9DCCAZqgAwIBAgIUfK8gpf3d6f7acICzvf5MBWnAVEYwCgYIKoZIzj0EAwIw\n"
              "VzErMCkGA1UEAwwiQXBwbGUgQWNjZXNzb3J5IFJvb3QgQ0EgLSAwMDAwMDAwMTET\n"
              "MBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTAgFw0yMDA5\n"
              "MTYxODI5MzRaGA8yMDUwMDkxNDAwMDAwMFowVzErMCkGA1UEAwwiQXBwbGUgQWNj\n"
              "ZXNzb3J5IFJvb3QgQ0EgLSAwMDAwMDAwMTETMBEGA1UECgwKQXBwbGUgSW5jLjET\n"
              "MBEGA1UECAwKQ2FsaWZvcm5pYTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABMGo\n"
              "QSB6dmrLAhjkTUVAoAC1RwaOmEmEk7SYEnnm6aBw9HZZQt5pkncuTXxvL6NDvx4D\n"
              "8Wn3frxp+UOTgEalb0ajQjBAMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFAZD\n"
              "Zup+SdTmXls49aokHuK+fHKjMA4GA1UdDwEB/wQEAwIBBjAKBggqhkjOPQQDAgNI\n"
              "ADBFAiEA4HcCYv5+W+1/HOy1v1cYVozNEW4+2WvR84Japg8rabkCIDP9zynWiR60\n"
              "O06J60wrt0rQfBOPnoeY1+ydbP2g8Tiy\n"
              "-----END CERTIFICATE-----";
      id v11 = (unsigned int *)&QABAAMFiRootCAPEMLen;
      id v12 = (unsigned int *)&BAAMFiRootCAPEMLen;
      goto LABEL_48;
    case 4:
      BOOL v9 = a2 == 0;
      if (a2) {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIIBgzCCASkCFDjx/NbFt/axSboRZlQvaFKmOM9cMAoGCCqGSM49BAMCMEQxGDAW\n"
              "BgNVBAMMD1JPT1QgVk1Ib3N0IERFVjETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEG\n"
              "A1UECAwKQ2FsaWZvcm5pYTAeFw0yMjEyMjAyMjQ5MjNaFw0zMjEyMTcyMjQ5MjNa\n"
              "MEQxGDAWBgNVBAMMD1JPT1QgVk1Ib3N0IERFVjETMBEGA1UECgwKQXBwbGUgSW5j\n"
              "LjETMBEGA1UECAwKQ2FsaWZvcm5pYTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IA\n"
              "BFEzB9BX594q7qqyNgDRIB2qQm6uhylOPgS3zX6kVNpCe+IGeuYGVKu+n0oVoUEq\n"
              "ah/zwVwo9xZPJycEbHBhGlAwCgYIKoZIzj0EAwIDSAAwRQIhAJxxz1ciDUVxdnIz\n"
              "34ondjHZD90U6Pzvu9abpIU1TsJxAiAKxVubHXInckv6HidbV1J2RghMPdxOyKnw\n"
              "ZR6YEAfSMQ==\n"
              "-----END CERTIFICATE-----";
      else {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIICLDCCAbOgAwIBAgIUfj+NzqI5TD5k+plnCuu7oXn/1NYwCgYIKoZIzj0EAwMw\n"
              "VjEqMCgGA1UEAwwhQmFzaWMgQXR0ZXN0YXRpb24gVk0gUm9vdCBDQSAtIEcxMRMw\n"
              "EQYDVQQKDApBcHBsZSBJbmMuMRMwEQYDVQQIDApDYWxpZm9ybmlhMB4XDTIyMTEx\n"
              "NzE5MjQ0NloXDTQ3MTExNzAwMDAwMFowVjEqMCgGA1UEAwwhQmFzaWMgQXR0ZXN0\n"
              "YXRpb24gVk0gUm9vdCBDQSAtIEcxMRMwEQYDVQQKDApBcHBsZSBJbmMuMRMwEQYD\n"
              "VQQIDApDYWxpZm9ybmlhMHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEh+bXFjhVZxpY\n"
              "SW1tUJhQc7Mesr7Ua/2EIJDhZnq1eUV666b7j8V1apF7zQdcVc1GHqBMRfeagBk0\n"
              "ktB5PgRQ4hFX3OAbfjSVnmuPVuHznBbS/1f/ABuTlJJjO592E9JVo0IwQDAPBgNV\n"
              "HRMBAf8EBTADAQH/MB0GA1UdDgQWBBTHKW8b5x+bDXk9PC/lPsufj3wUEzAOBgNV\n"
              "HQ8BAf8EBAMCAQYwCgYIKoZIzj0EAwMDZwAwZAIwXsNPIuolYDriFDkULrsZy81O\n"
              "yAk4v7Y4f1p86Ox2J7g4xdGIwAyLw/JNRKGoHGpVAjBk20GA6ZvKKoO+HvE9v2xu\n"
              "wiVPsqk37xSmgK+RHJDMMy+hrhJVsCsBzeYpI9Cz4sI=\n"
              "-----END CERTIFICATE-----";
      id v11 = (unsigned int *)&QABAAVMRootCAPEMLen;
      id v12 = (unsigned int *)&BAAVMRootCAPEMLen;
      goto LABEL_48;
    case 5:
      BOOL v9 = a2 == 0;
      if (a2) {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIIB9jCCAXwCFGyFzDAIXLHwUcHOxFEzhqQrOQOPMAoGCCqGSM49BAMDMF8xMzAx\n"
              "BgNVBAMMKkJhc2ljIEF0dGVzdGF0aW9uIFNFUCBBcHAgRGV2IFJvb3QgQ0EgLSBH\n"
              "MTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTAeFw0y\n"
              "MzAxMTkyMTEzNTFaFw0zMzAxMTYyMTEzNTFaMF8xMzAxBgNVBAMMKkJhc2ljIEF0\n"
              "dGVzdGF0aW9uIFNFUCBBcHAgRGV2IFJvb3QgQ0EgLSBHMTETMBEGA1UECgwKQXBw\n"
              "bGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTB2MBAGByqGSM49AgEGBSuBBAAi\n"
              "A2IABOnVQFqNs86j5R5dAcjUlpotBUkO2q3+udEnqwkzzcrptPz6FIp5GQagMCQk\n"
              "wDgzXTe3jUqDkGxMNUjLt6DkzbwX7SrHhvIf9RlTXmlgrCUUrR21089VP+FZu8sD\n"
              "38l7PTAKBggqhkjOPQQDAwNoADBlAjEA7qwslEakgN0e+27DzPtrOqbud2pXVdRP\n"
              "qGFmLcklmZWHF1UIn6JlD1TNLVHQlCr3AjBkSmV+m5D/pJVRvg4ewQq+9oeyuYg8\n"
              "JHQGGaubDFMjZXhJ3NXrLHmIWDRQW2lgChA=\n"
              "-----END CERTIFICATE-----";
      else {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIICODCCAb2gAwIBAgIUW5y5rEfNQCu9iSCmlQjrP1Rz/tAwCgYIKoZIzj0EAwMw\n"
              "WzEvMC0GA1UEAwwmQmFzaWMgQXR0ZXN0YXRpb24gU0VQIEFwcCBSb290IENBIC0g\n"
              "RzExEzARBgNVBAoMCkFwcGxlIEluYy4xEzARBgNVBAgMCkNhbGlmb3JuaWEwHhcN\n"
              "MjIwOTEyMTc1OTM0WhcNNDcwOTEyMDAwMDAwWjBbMS8wLQYDVQQDDCZCYXNpYyBB\n"
              "dHRlc3RhdGlvbiBTRVAgQXBwIFJvb3QgQ0EgLSBHMTETMBEGA1UECgwKQXBwbGUg\n"
              "SW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTB2MBAGByqGSM49AgEGBSuBBAAiA2IA\n"
              "BAXaHBhlPwzGbPrirq+GvLIVTB4ym+88OQOB2Aq3ZuWIDz2DV9EWt7/3tpHL276X\n"
              "WE4ObPymHzrbl5aNpIzjm9W0tgiZRWw8l3YEuoz56dh3sZqVdDxszB3CQw1KX+62\n"
              "YaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUywowhXlxUMVVx846sCHP\n"
              "XQIrUR4wDgYDVR0PAQH/BAQDAgEGMAoGCCqGSM49BAMDA2kAMGYCMQC/AZhw1x8+\n"
              "XBPQw3lTl2A4SxY5UvCMjyseU9uUD0qgFDYlvUzH0qi8KB5BZled0cYCMQClhMgI\n"
              "rl3Txh1EJBb5yoWhvs8Gy+qkov9/SIDIEGpmZ7OUngbjN5zheCyJio90Xig=\n"
              "-----END CERTIFICATE-----";
      id v11 = (unsigned int *)&QABAAASMFiOSRootCAPEMLen;
      id v12 = (unsigned int *)&BAAASMFiOSRootCAPEMLen;
      goto LABEL_48;
    case 6:
      unsigned int v14 = *(_DWORD *)"&\b";
      uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
            "MIIF2DCCA8CgAwIBAgIBADANBgkqhkiG9w0BAQsFADB9MQswCQYDVQQGEwJVUzET\n"
            "MBEGA1UEChMKQXBwbGUgSW5jLjFZMFcGA1UEAxNQRkRSLUNBMS1ST09ULUNNIDg2\n"
            "QkQ1QkFFQ0JBNEQ5RUM0QzdBOUJGRUZEM0I3QTE0Mzc5QTE1RTVGQjM2MDNCQ0U2\n"
            "OTA1MDczRUMwNjBBM0YwHhcNMTQwNjExMjEwODM5WhcNNDQwNjExMjEwODM5WjB9\n"
            "MQswCQYDVQQGEwJVUzETMBEGA1UEChMKQXBwbGUgSW5jLjFZMFcGA1UEAxNQRkRS\n"
            "LUNBMS1ST09ULUNNIDg2QkQ1QkFFQ0JBNEQ5RUM0QzdBOUJGRUZEM0I3QTE0Mzc5\n"
            "QTE1RTVGQjM2MDNCQ0U2OTA1MDczRUMwNjBBM0YwggIiMA0GCSqGSIb3DQEBAQUA\n"
            "A4ICDwAwggIKAoICAQDRSE8a8Xl+OFgz07qfQf610WJgBhQUMqYqLME8yNW6HRAo\n"
            "ZmRJCZhKzJCW7W77utpo/QZqCs/Tmc8yAuyw06MlLdb/EaFbIJhnd8KvhNO2aBn1\n"
            "0zTF3BrKu/iBj4Cb31nzd+P3BAyIIhnNfqnJ1YDGrXDHApFKs96bRNYfFj/cm55e\n"
            "+5ZaVAE4pGq3I45pO1HMEObvysFnbEw4R5EZ8BsyNaSe+EEprYZQqjfGciVZn+WD\n"
            "nP0g1TONgE8yAplaud+0QQIcLxE82toZqnAEErojrXbb9KYiW6OH+w8p8ITKrA0a\n"
            "byud5ZwU8x2dwJngg2P53vzdaEPgl+oEWm5uTtOBS5kGh9N0Ky3N094qn6Y9OmLD\n"
            "eXsYXGE3Q91AZ6Ps+0cmZYAMvnlTMh6h6TRgIG6kUi/7fIn6umQHgavSMP+XWNET\n"
            "CzbwE7YZnTnhMlW3Oaey40bKDgxZAgVAVKt+qf/B9Exb074GqicYr5RH3MmYYqVo\n"
            "bHZTPkeKykUxUJoNm/jRoyXQnStl0uBclShH3ORMOHL6MeQMSGIEIVbD6AJz3rIX\n"
            "7nidx3ePUeA7QVV/vhL09DU4Q5KKQsbgl4qSGzxA87ClUGworLaWa+AUE+MP5NLJ\n"
            "tSlsY4+Fl3VLq51AJA2oeOwF6KCTRTZWG56anqaSrEU0UKsWgQ6ys+9153eGTwID\n"
            "AQABo2MwYTAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4E\n"
            "FgQUESXWmKVwOl5LaoSB35L33xPje14wHwYDVR0jBBgwFoAUESXWmKVwOl5LaoSB\n"
            "35L33xPje14wDQYJKoZIhvcNAQELBQADggIBAJcISq7FqhBfFRpgEAiedVPPzff5\n"
            "rU2uNQLpApMb3A6jFSostHTwypA//pc0PbTPTi5t2CcF14Gznqt4Gf1Ej75C+fgK\n"
            "QoWjcgYPCXkK+6KkTW8EMLsL+n8ZL1tqdOuJCOBTRBTU3Lbwon5uYF98CdBlPIam\n"
            "ZqDEbEiwrp/I5uBMkut1P2sftxu5ysu3+A1bGMDI5T84sXbG0eJU6zmx1p/WUHAc\n"
            "HZy9/S7Ad5vJRMQrWx4JDdLvJ+1PXqdJtZUkp4TNPchxA9OzGsatVJJ5T/5EVDuL\n"
            "QgLaZNiWeAC19+clUREnS247RjLNIZZq0hj2Rk5zO6sSyt8vM+kJZrTVdGaSk++l\n"
            "OFWzSdo0Ev/izPkuL/cH146YZS1UWZJI61mdvbvvxqqQaoTmviuMDqDoCZ7crLu3\n"
            "LRoS6/+w+xir5s6hmAF8D6FzAkVmeAroyd6Hclk6CnhlcQP5GxjTQjA2YGe/9X54\n"
            "30qL4fjiDwdLYqxyL5J28/yxt068aoVaukoRAgiGoZouyieTV9DabenxYBOygijS\n"
            "4G4RVf4qVnQ7wGkQokhz4WIkMr4C4ydWU3GhSuM3T9Tx9ASscch/oLMczDMLKYMe\n"
            "3sdtc60+gxrctSq/B3E/5nddDj9vQ7BdRWcvJ+n/ESsXgwk5z15YZUwU/qW0j5rD\n"
            "4bPy9nox5DLds+/l\n"
            "-----END CERTIFICATE-----";
      goto LABEL_52;
    case 7:
      BOOL v9 = a2 == 0;
      if (a2) {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIIBtDCCAVqgAwIBAgIBJzAKBggqhkjOPQQDAjBIMRwwGgYDVQQDDBNTRVAgUm9v\n"
              "dCBDQSAoTG9jYWwpMRMwEQYDVQQKDApBcHBsZSBJbmMuMRMwEQYDVQQIDApDYWxp\n"
              "Zm9ybmlhMB4XDTE2MDQyMjIyMTgzOVoXDTI2MDQyMDIyMTgzOVowSDEcMBoGA1UE\n"
              "AwwTU0VQIFJvb3QgQ0EgKExvY2FsKTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEG\n"
              "A1UECAwKQ2FsaWZvcm5pYTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABLbmMPmv\n"
              "ubyAcSjOqIvq+HkYPAn68WV+DopU/kfpNtEo0y0kjdxYGyuiaKC3LPqBmgM8pHlJ\n"
              "pP81SMyx900L5YyjNTAzMA8GA1UdEwEB/wQFMAMBAf8wCwYDVR0PBAQDAgEGMBMG\n"
              "CSqGSIb3Y2QGLAQGFgR1Y3J0MAoGCCqGSM49BAMCA0gAMEUCIQCz/HH34JCprRWh\n"
              "srjvjvb0vUjLY22yA/3uJS0zZ2LRGgIgahGt0ZuEvMzPDnG9n8wRXEOB46xu7zDy\n"
              "rXK+zQjBPMY=\n"
              "-----END CERTIFICATE-----";
      else {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIIB9DCCAXugAwIBAgIIMyDS5tjDo6wwCgYIKoZIzj0EAwMwQDEUMBIGA1UEAwwL\n"
              "U0VQIFJvb3QgQ0ExEzARBgNVBAoMCkFwcGxlIEluYy4xEzARBgNVBAgMCkNhbGlm\n"
              "b3JuaWEwHhcNMTQwNjI0MjE0MzI0WhcNMjkwNjI0MjE0MzI0WjBAMRQwEgYDVQQD\n"
              "DAtTRVAgUm9vdCBDQTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2Fs\n"
              "aWZvcm5pYTB2MBAGByqGSM49AgEGBSuBBAAiA2IABEBGXhKwc7q3iFvkUoGDP6j2\n"
              "drpxSCxsSCODaDQIqGwd53wZJ0xIJIv0RTf2TS7+/u4KzhrANzb19r+TQzwqFJMp\n"
              "hp3mI3yY4pukIFc/kWS7DLQAx/ftWBXX6vl4ig3wEqNCMEAwHQYDVR0OBBYEFFjv\n"
              "1r7FgrBUzRimhK2i9nt7On/PMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQD\n"
              "AgEGMAoGCCqGSM49BAMDA2cAMGQCMCWRVB9DxwYdXsJ8KVZwbU5y0rfNEWJwpH5B\n"
              "bH3HoiOT/k7TIzlcXWiWAZVVBsDf/gIwC5wq3OepHwBMMCa3Q4ZvpT4Qs0dmc4oa\n"
              "GYxqUZYACJiGD7vRVavVMFnf0s4xG0JG\n"
              "-----END CERTIFICATE-----";
      id v11 = (unsigned int *)&QAUCRTRootCAPEMLen;
      goto LABEL_33;
    case 8:
      BOOL v9 = a2 == 0;
      if (a2) {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIICXjCCAeWgAwIBAgIJAO5ey/a/ZXo9MAoGCCqGSM49BAMDMGQxNzA1BgNVBAMT\n"
              "LmltZzQgdGVzdCBzZWNwMzg0cjEgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkx\n"
              "FDASBgNVBAoTC0FwcGxlLCBJbmMuMRMwEQYDVQQIEwpDYWxpZm9ybmlhMB4XDTE1\n"
              "MDgyNzA0MTk1MloXDTI1MDgyNDA0MTk1MlowZDE3MDUGA1UEAxMuaW1nNCB0ZXN0\n"
              "IHNlY3AzODRyMSBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eTEUMBIGA1UEChML\n"
              "QXBwbGUsIEluYy4xEzARBgNVBAgTCkNhbGlmb3JuaWEwdjAQBgcqhkjOPQIBBgUr\n"
              "gQQAIgNiAARmiQLNit/MHLEymNygtXRdYvZ2V9ujKbG78XPHs815eRetxfbAe0SU\n"
              "3LOKQ0xvpm77RUDARHdFyNzRSkKxTY2iBUGOapBwlwzfZlUmJU4JRXE9ATRwYNco\n"
              "KfVcrL0BFnejYzBhMB0GA1UdDgQWBBTFrjb8IhN7kz3HMYTxcqKeXtGm5DAPBgNV\n"
              "HRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFMWuNvwiE3uTPccxhPFyop5e0abkMA4G\n"
              "A1UdDwEB/wQEAwIBhjAKBggqhkjOPQQDAwNnADBkAjB5ryjJQJlO6BD0fqejchDc\n"
              "HB9su7+GoJMD5Kv9hoDeDlCTYoxE1fUp/36BAM3Ph/4CMB+QED5D9Nf7Fas99Xst\n"
              "xQ+EdLq74wvw/0YFQlsLVUH3UAnFE1uWnmwHkDZYF1EkcA==\n"
              "-----END CERTIFICATE-----";
      else {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIIB9DCCAXugAwIBAgIIMyDS5tjDo6wwCgYIKoZIzj0EAwMwQDEUMBIGA1UEAwwL\n"
              "U0VQIFJvb3QgQ0ExEzARBgNVBAoMCkFwcGxlIEluYy4xEzARBgNVBAgMCkNhbGlm\n"
              "b3JuaWEwHhcNMTQwNjI0MjE0MzI0WhcNMjkwNjI0MjE0MzI0WjBAMRQwEgYDVQQD\n"
              "DAtTRVAgUm9vdCBDQTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2Fs\n"
              "aWZvcm5pYTB2MBAGByqGSM49AgEGBSuBBAAiA2IABEBGXhKwc7q3iFvkUoGDP6j2\n"
              "drpxSCxsSCODaDQIqGwd53wZJ0xIJIv0RTf2TS7+/u4KzhrANzb19r+TQzwqFJMp\n"
              "hp3mI3yY4pukIFc/kWS7DLQAx/ftWBXX6vl4ig3wEqNCMEAwHQYDVR0OBBYEFFjv\n"
              "1r7FgrBUzRimhK2i9nt7On/PMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQD\n"
              "AgEGMAoGCCqGSM49BAMDA2cAMGQCMCWRVB9DxwYdXsJ8KVZwbU5y0rfNEWJwpH5B\n"
              "bH3HoiOT/k7TIzlcXWiWAZVVBsDf/gIwC5wq3OepHwBMMCa3Q4ZvpT4Qs0dmc4oa\n"
              "GYxqUZYACJiGD7vRVavVMFnf0s4xG0JG\n"
              "-----END CERTIFICATE-----";
      id v11 = (unsigned int *)&QAUCRTRootCAP384PEMLen;
LABEL_33:
      id v12 = (unsigned int *)&UCRTRootCAPEMLen;
      goto LABEL_48;
    case 9:
      BOOL v9 = a2 == 0;
      if (a2) {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIIBtjCCAVugAwIBAgIBJTAKBggqhkjOPQQDAjBIMRwwGgYDVQQDDBNTRVAgUm9v\n"
              "dCBDQSAoTG9jYWwpMRMwEQYDVQQKDApBcHBsZSBJbmMuMRMwEQYDVQQIDApDYWxp\n"
              "Zm9ybmlhMB4XDTE2MDQyMjIyMDMwMloXDTI2MDQyMDIyMDMwMlowSTETMBEGA1UE\n"
              "CAwKQ2FsaWZvcm5pYTETMBEGA1UECgwKQXBwbGUgSW5jLjEdMBsGA1UEAwwUdWNy\n"
              "dCBWZW5kaW5nIFNlcnZpY2UwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQooWKn\n"
              "j4PQnKhSGEpmJok/4CSDeG6fIk6A4vCDtuC5T2twqSmM0VWT3SY5B8QKMAspxnnT\n"
              "fxPmUJ+d2vhNPocFozUwMzAPBgNVHRMBAf8EBTADAQH/MAsGA1UdDwQEAwIBBjAT\n"
              "BgkqhkiG92NkBiwEBhYEdWNydDAKBggqhkjOPQQDAgNJADBGAiEAq6YVB2GvW4uu\n"
              "b17G+wTS/pehuM8tHLOH6RfJzUarkpUCIQDViFsKmYnrNx3yi9whnCHUE2SqvdRK\n"
              "YFSjST8cXO8B2g==\n"
              "-----END CERTIFICATE-----";
      else {
        uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
      }
              "MIICFzCCAZygAwIBAgIIOcUqQ8IC/hswCgYIKoZIzj0EAwIwQDEUMBIGA1UEAwwL\n"
              "U0VQIFJvb3QgQ0ExEzARBgNVBAoMCkFwcGxlIEluYy4xEzARBgNVBAgMCkNhbGlm\n"
              "b3JuaWEwHhcNMTYwNDI1MjM0NTQ3WhcNMjkwNjI0MjE0MzI0WjBFMRMwEQYDVQQI\n"
              "DApDYWxpZm9ybmlhMRMwEQYDVQQKDApBcHBsZSBJbmMuMRkwFwYDVQQDDBBGRFJE\n"
              "Qy1VQ1JULVNVQkNBMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEaDc2O/MruYvP\n"
              "VPaUbKR7RRzn66B14/8KoUMsEDb7nHkGEMX6eC+0gStGHe4HYMrLyWcap1tDFYmE\n"
              "DykGQ3uM2aN7MHkwHQYDVR0OBBYEFLSqOkOtG+V+zgoMOBq10hnLlTWzMA8GA1Ud\n"
              "EwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAUWO/WvsWCsFTNGKaEraL2e3s6f88wDgYD\n"
              "VR0PAQH/BAQDAgEGMBYGCSqGSIb3Y2QGLAEB/wQGFgR1Y3J0MAoGCCqGSM49BAMC\n"
              "A2kAMGYCMQDf5zNiiKN/Jqms1w+3CDYkESOPieJMpEkLe9a0UjWXEBDL0VEsq/Cd\n"
              "E3aKXkc6R10CMQDS4MiWiymY+Rxkvy/hicDDQqI/BL+N3LHqzJZUuw2Sx0afDX7B\n"
              "6LyKk+sLq4urkMY=\n"
              "-----END CERTIFICATE-----";
      id v11 = (unsigned int *)&QAUCRTSubCAPEMLen;
      id v12 = (unsigned int *)&UCRTSubCAPEMLen;
      goto LABEL_48;
    case 10:
      unsigned int v14 = 1115;
      uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
            "MIIDCjCCAnOgAwIBAgIJAKLEjm9wthY+MA0GCSqGSIb3DQEBBQUAMGIxCzAJBgNV\n"
            "BAYTAlVTMQswCQYDVQQIEwJDQTESMBAGA1UEBxMJQ3VwZXJ0aW5vMRMwEQYDVQQK\n"
            "EwpBcHBsZSBJbmMuMQwwCgYDVQQLEwNFVFMxDzANBgNVBAMTBlJhcHRvcjAeFw0x\n"
            "MTA2MjMxOTA1NDNaFw0xOTA5MDkxOTA1NDNaMGIxCzAJBgNVBAYTAlVTMQswCQYD\n"
            "VQQIEwJDQTESMBAGA1UEBxMJQ3VwZXJ0aW5vMRMwEQYDVQQKEwpBcHBsZSBJbmMu\n"
            "MQwwCgYDVQQLEwNFVFMxDzANBgNVBAMTBlJhcHRvcjCBnzANBgkqhkiG9w0BAQEF\n"
            "AAOBjQAwgYkCgYEAyckOSUo0WP7JAPTWXeVyEfeJ7JUm1cVzL4hURR/Kr9PR8x1g\n"
            "ptLaxWVcni+9D6eHmn9FxmmQFXRbIQCs5/qj4PhFZLC3c77wvi/8OL2EwSIOq9MN\n"
            "Hpm0P0jh/0e8AxJZS98gPfz6YF58H1/Vi5yYlM7zsGPdXaUiQokAbTcyXZUCAwEA\n"
            "AaOBxzCBxDAdBgNVHQ4EFgQUMSXJGuBw9hqPqJDExjgE206NyD4wgZQGA1UdIwSB\n"
            "jDCBiYAUMSXJGuBw9hqPqJDExjgE206NyD6hZqRkMGIxCzAJBgNVBAYTAlVTMQsw\n"
            "CQYDVQQIEwJDQTESMBAGA1UEBxMJQ3VwZXJ0aW5vMRMwEQYDVQQKEwpBcHBsZSBJ\n"
            "bmMuMQwwCgYDVQQLEwNFVFMxDzANBgNVBAMTBlJhcHRvcoIJAKLEjm9wthY+MAwG\n"
            "A1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADgYEAqrgiRsSNB4ubv2ZDUqH7p1a1\n"
            "Hca1vMmXZy1bTBXTbxoNJ/tHnkBZrQHoRq31931Sd6CDLnN/8h+Zpcg7C40vKMBu\n"
            "nJ4gaPVrPZlv36rrW/xNf6ZLETt0Q8VM554/P2QfT4aU/2v2rFb/orAqsKSW6wtJ\n"
            "9WmL1qAfmVJAPdcwYbY=\n"
            "-----END CERTIFICATE-----";
      goto LABEL_52;
    case 11:
      unsigned int v14 = 1143;
      uint64_t v10 = "-----BEGIN CERTIFICATE-----\n"
            "MIIDHzCCAoigAwIBAgIJAK/qJPz+p+3XMA0GCSqGSIb3DQEBBQUAMGkxCzAJBgNV\n"
            "BAYTAlVTMQswCQYDVQQIEwJDQTESMBAGA1UEBxMJQ3VwZXJ0aW5vMRMwEQYDVQQK\n"
            "EwpBcHBsZSBJbmMuMQwwCgYDVQQLEwNFVFMxFjAUBgNVBAMTDVJhcHRvciBEZXZp\n"
            "Y2UwHhcNMTEwNjIzMTkwNjE3WhcNMTkwOTA5MTkwNjE3WjBpMQswCQYDVQQGEwJV\n"
            "UzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzETMBEGA1UEChMKQXBw\n"
            "bGUgSW5jLjEMMAoGA1UECxMDRVRTMRYwFAYDVQQDEw1SYXB0b3IgRGV2aWNlMIGf\n"
            "MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDOPR58emAZ3QBW6U3tZXmTjELxK495\n"
            "JavHz3yZm1lX1z7K9tmbqcmUuEXpBbxHtgEkTTmwZQIgM3f6asTn8CKln8kq7aYj\n"
            "AWbSNOCy35hLDCy+hCN9hi++3LqqHiuQ9whVAvyrqpX7xPfgGwheIgpp/sPoPbZF\n"
            "x5EiwPt7/uHzfQIDAQABo4HOMIHLMB0GA1UdDgQWBBSWWwNRWUp2XVKrcZ8yKR4r\n"
            "Zh/4wDCBmwYDVR0jBIGTMIGQgBSWWwNRWUp2XVKrcZ8yKR4rZh/4wKFtpGswaTEL\n"
            "MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRIwEAYDVQQHEwlDdXBlcnRpbm8xEzAR\n"
            "BgNVBAoTCkFwcGxlIEluYy4xDDAKBgNVBAsTA0VUUzEWMBQGA1UEAxMNUmFwdG9y\n"
            "IERldmljZYIJAK/qJPz+p+3XMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQAD\n"
            "gYEAP2PMyy+666s+vDH4mLhFb2ZUFUM/nyxnLbjEyxgxR5Z5iZ/H0BEp7s59Matv\n"
            "dO0dzhP1+khkcM6opicPG3Vu5eDI0odn41m7LDj6Z3lgrxFTKIm/Ghc7c7c0qdWA\n"
            "YLTvijBQsDqsY1YoAXr+80ReSSouJgkNvljBAoPFPpoK2xQ=\n"
            "-----END CERTIFICATE-----";
      goto LABEL_52;
    case 12:
      BOOL v9 = a2 == 0;
      if (a2) {
        uint64_t v10 = "Certificate:\n"
      }
              "    Data:\n"
              "        Version: 3 (0x2)\n"
              "        Serial Number: 1 (0x1)\n"
              "        Signature Algorithm: sha1WithRSAEncryption\n"
              "        Issuer: C=US, O=Apple Inc., OU=Apple Certification Authority, CN=[TEST] Apple iPhone Certification"
              " Authority\n"
              "        Validity\n"
              "            Not Before: Mar 21 06:20:50 2007 GMT\n"
              "            Not After : Mar 12 06:20:50 2022 GMT\n"
              "        Subject: C=US, O=Apple Inc., OU=Apple iPhone, CN=[TEST] Apple iPhone Device CA\n"
              "        Subject Public Key Info:\n"
              "            Public Key Algorithm: rsaEncryption\n"
              "            RSA Public Key: (1024 bit)\n"
              "                Modulus (1024 bit):\n"
              "                    00:d7:60:52:2a:fa:93:52:dc:db:ae:92:6b:d6:ac:\n"
              "                    59:17:1f:9a:20:ed:34:ae:c2:15:e8:e3:f0:3b:63:\n"
              "                    84:d8:6d:8d:02:65:74:e6:62:18:27:d1:fc:78:c3:\n"
              "                    2f:36:83:39:91:9f:3d:32:e0:95:7f:90:3b:ab:47:\n"
              "                    be:f1:47:85:8c:5d:ab:1c:5c:bb:10:69:47:56:b8:\n"
              "                    15:bf:34:4a:f0:49:6e:8a:35:4a:4f:47:bb:3e:ea:\n"
              "                    cc:df:2e:f4:b8:96:16:94:dd:38:f6:f0:82:cf:26:\n"
              "                    fd:67:a1:73:01:43:d8:25:bd:02:2c:82:89:7c:70:\n"
              "                    01:68:c2:8a:85:60:84:77:83\n"
              "                Exponent: 65537 (0x10001)\n"
              "        X509v3 extensions:\n"
              "            X509v3 Key Usage: critical\n"
              "                Digital Signature, Certificate Sign, CRL Sign\n"
              "            X509v3 Basic Constraints: critical\n"
              "                CA:TRUE\n"
              "            X509v3 Subject Key Identifier:\n"
              "                38:05:20:A9:3F:C6:79:F4:EC:9A:6F:7F:47:02:5E:6E:A4:79:11:F5\n"
              "            X509v3 Authority Key Identifier:\n"
              "                keyid:45:A2:4C:A9:8A:5B:4A:27:5E:85:A6:4D:05:1C:27:44:A5:87:76:17\n"
              "\n"
              "            X509v3 CRL Distribution Points:\n"
              "                URI:http://www.apple.com/appleca/iphone.crl\n"
              "\n"
              "    Signature Algorithm: sha1WithRSAEncryption\n"
              "        8d:be:6b:c8:4e:80:9e:78:86:0c:09:d0:6e:ed:c1:dc:30:f7:\n"
              "        29:4b:20:4e:2c:6c:b3:24:72:fd:ce:24:34:60:95:30:d7:32:\n"
              "        61:31:e5:d4:d5:63:aa:3f:89:81:f6:44:ab:71:d0:bc:17:db:\n"
              "        ab:bc:ec:bb:a4:40:6a:e7:e4:57:c6:28:6f:11:72:fc:0c:51:\n"
              "        07:31:db:40:54:ee:b5:e6:1e:e3:dc:9b:f9:3c:6a:ba:d8:c3:\n"
              "        20:f1:dd:49:cb:3a:a6:29:cd:52:f9:f3:f3:18:5e:dd:82:83:\n"
              "        b8:e8:4e:94:10:7a:1e:11:a0:63:4d:8e:60:4a:1d:45:72:4d:\n"
              "        a0:ac:1f:b0:98:8b:b4:33:5a:85:60:cf:7f:89:35:62:65:d1:\n"
              "        1b:48:a4:ec:ca:60:1a:9d:a6:d1:b9:3d:f3:64:a4:67:d1:a5:\n"
              "        1b:b6:d9:e7:65:75:cb:af:2f:7a:db:d8:a1:f4:f3:09:bf:9a:\n"
              "        99:1a:34:a6:ed:1f:82:84:0b:b6:a8:68:5d:ec:49:d4:b3:34:\n"
              "        84:af:cb:a4:d9:00:f0:bc:07:6c:17:e7:95:bb:c3:3d:d9:bb:\n"
              "        6a:13:1d:34:bd:2f:c1:9a:f1:4d:67:5f:56:33:90:b2:ef:ff:\n"
              "        27:da:19:60:55:b0:78:c2:8c:34:5b:61:3a:e1:ec:61:92:8b:\n"
              "        2f:04:9a:c6\n"
              "-----BEGIN CERTIFICATE-----\n"
              "MIIDeDCCAmCgAwIBAgIBATANBgkqhkiG9w0BAQUFADCBgDELMAkGA1UEBhMCVVMx\n"
              "EzARBgNVBAoTCkFwcGxlIEluYy4xJjAkBgNVBAsTHUFwcGxlIENlcnRpZmljYXRp\n"
              "b24gQXV0aG9yaXR5MTQwMgYDVQQDFCtbVEVTVF0gQXBwbGUgaVBob25lIENlcnRp\n"
              "ZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MDMyMTA2MjA1MFoXDTIyMDMxMjA2MjA1\n"
              "MFowYTELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFwcGxlIEluYy4xFTATBgNVBAsT\n"
              "DEFwcGxlIGlQaG9uZTEmMCQGA1UEAxQdW1RFU1RdIEFwcGxlIGlQaG9uZSBEZXZp\n"
              "Y2UgQ0EwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANdgUir6k1Lc266Sa9as\n"
              "WRcfmiDtNK7CFejj8DtjhNhtjQJldOZiGCfR/HjDLzaDOZGfPTLglX+QO6tHvvFH\n"
              "hYxdqxxcuxBpR1a4Fb80SvBJboo1Sk9Huz7qzN8u9LiWFpTdOPbwgs8m/WehcwFD\n"
              "2CW9AiyCiXxwAWjCioVghHeDAgMBAAGjgZ4wgZswDgYDVR0PAQH/BAQDAgGGMA8G\n"
              "A1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFDgFIKk/xnn07Jpvf0cCXm6keRH1MB8G\n"
              "A1UdIwQYMBaAFEWiTKmKW0onXoWmTQUcJ0Slh3YXMDgGA1UdHwQxMC8wLaAroCmG\n"
              "J2h0dHA6Ly93d3cuYXBwbGUuY29tL2FwcGxlY2EvaXBob25lLmNybDANBgkqhkiG\n"
              "9w0BAQUFAAOCAQEAjb5ryE6AnniGDAnQbu3B3DD3KUsgTixssyRy/c4kNGCVMNcy\n"
              "YTHl1NVjqj+JgfZEq3HQvBfbq7zsu6RAaufkV8YobxFy/AxRBzHbQFTuteYe49yb\n"
              "+TxqutjDIPHdScs6pinNUvnz8xhe3YKDuOhOlBB6HhGgY02OYEodRXJNoKwfsJiL\n"
              "tDNahWDPf4k1YmXRG0ik7MpgGp2m0bk982SkZ9GlG7bZ52V1y68vetvYofTzCb+a\n"
              "mRo0pu0fgoQLtqhoXexJ1LM0hK/LpNkA8LwHbBfnlbvDPdm7ahMdNL0vwZrxTWdf\n"
              "VjOQsu//J9oZYFWweMKMNFthOuHsYZKLLwSaxg==\n"
              "-----END CERTIFICATE-----";
      else {
        uint64_t v10 = "Bag Attributes\n"
      }
              "    localKeyID: 7C 29 15 15 12 C9 CF F6 15 2B 5B 25 70 3D A7 9A 98 14 36 06\n"
              "subject=/C=US/O=Apple Inc./OU=Apple iPhone/CN=Apple iPhone Device CA\n"
              "issuer=/C=US/O=Apple Inc./OU=Apple Certification Authority/CN=Apple iPhone Certification Authority\n"
              "-----BEGIN CERTIFICATE-----\n"
              "MIIDaTCCAlGgAwIBAgIBATANBgkqhkiG9w0BAQUFADB5MQswCQYDVQQGEwJVUzET\n"
              "MBEGA1UEChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBwbGUgQ2VydGlmaWNhdGlv\n"
              "biBBdXRob3JpdHkxLTArBgNVBAMTJEFwcGxlIGlQaG9uZSBDZXJ0aWZpY2F0aW9u\n"
              "IEF1dGhvcml0eTAeFw0wNzA0MTYyMjU0NDZaFw0xNDA0MTYyMjU0NDZaMFoxCzAJ\n"
              "BgNVBAYTAlVTMRMwEQYDVQQKEwpBcHBsZSBJbmMuMRUwEwYDVQQLEwxBcHBsZSBp\n"
              "UGhvbmUxHzAdBgNVBAMTFkFwcGxlIGlQaG9uZSBEZXZpY2UgQ0EwgZ8wDQYJKoZI\n"
              "hvcNAQEBBQADgY0AMIGJAoGBAPGUSsnquloYYK3Lok1NTlQZaRdZB2bLl+hmmkdf\n"
              "Rq5nerVKc1SxywT2vTa4DFU4ioSDMVJl+TPhl3ecK0wmsCU/6TKqewh0lOzBSzgd\n"
              "Z04IUpRai1mjXNeT9KD+VYW7TEaXXm6yd0UvZ1y8Cxi/WblshvcqdXbSGXH0KWO5\n"
              "JQuvAgMBAAGjgZ4wgZswDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8w\n"
              "HQYDVR0OBBYEFLL+ISNEhpVqedWBJo5zENinTI50MB8GA1UdIwQYMBaAFOc0Ki4i\n"
              "3jlga7SUzneDYS8xoHw1MDgGA1UdHwQxMC8wLaAroCmGJ2h0dHA6Ly93d3cuYXBw\n"
              "bGUuY29tL2FwcGxlY2EvaXBob25lLmNybDANBgkqhkiG9w0BAQUFAAOCAQEAd13P\n"
              "Z3pMViukVHe9WUg8Hum+0I/0kHKvjhwVd/IMwGlXyU7DhUYWdja2X/zqj7W24Aq5\n"
              "7dEKm3fqqxK5XCFVGY5HI0cRsdENyTP7lxSiiTRYj2mlPedheCn+k6T5y0U4Xr40\n"
              "FXwWb2nWqCF1AgIudhgvVbxlvqcxUm8Zz7yDeJ0JFovXQhyO5fLUHRLCQFssAbf8\n"
              "B4i8rYYsBUhYTspVJcxVpIIltkYpdIRSIARA49HNvKK4hzjzMS/OhKQpVKw+OCEZ\n"
              "xptCVeN2pjbdt9uzi175oVo/u6B2ArKAW17u6XEHIdDMOe7cb33peVI6TD15W4MI\n"
              "pyQPbp8orlXe+tA8JA==\n"
              "-----END CERTIFICATE-----";
      id v11 = (unsigned int *)&QAIphoneDeviceCAPEMLen;
      id v12 = (unsigned int *)&iPhoneDeviceCAPEMLen;
      goto LABEL_48;
    case 13:
      BOOL v9 = a2 == 0;
      if (a2) {
        uint64_t v10 = "Certificate:\n"
      }
              "    Data:\n"
              "        Version: 3 (0x2)\n"
              "        Serial Number: 2 (0x2)\n"
              "        Signature Algorithm: sha1WithRSAEncryption\n"
              "        Issuer: C=US, O=Apple Inc., OU=Apple Certification Authority, CN=[TEST] Apple iPhone Certification"
              " Authority\n"
              "        Validity\n"
              "            Not Before: Mar 21 06:20:50 2007 GMT\n"
              "            Not After : Mar 12 06:20:50 2022 GMT\n"
              "        Subject: C=US, O=Apple Inc., OU=Apple iPhone, CN=[TEST] Apple iPhone Activation\n"
              "        Subject Public Key Info:\n"
              "            Public Key Algorithm: rsaEncryption\n"
              "            RSA Public Key: (1024 bit)\n"
              "                Modulus (1024 bit):\n"
              "                    00:b3:62:65:ec:48:dd:dd:ed:44:d4:f1:fe:fb:c2:\n"
              "                    6f:42:d0:82:09:03:00:a6:01:e8:b1:07:09:26:5b:\n"
              "                    12:65:db:7f:51:15:ef:4f:45:b3:8f:ce:4d:16:1d:\n"
              "                    38:84:01:10:57:4e:8c:71:e1:5e:de:67:14:75:da:\n"
              "                    48:9a:4c:6f:f0:45:65:66:e8:9c:b5:a2:4c:f4:53:\n"
              "                    c1:ec:98:62:90:b0:94:be:12:f2:a0:ac:5c:77:16:\n"
              "                    07:73:72:5a:97:ba:50:4e:67:30:52:1e:f0:30:4e:\n"
              "                    8f:b2:a4:d3:d1:fa:f8:66:79:87:91:2f:a1:ef:4e:\n"
              "                    e6:41:8d:94:18:29:e0:f2:cf\n"
              "                Exponent: 65537 (0x10001)\n"
              "        X509v3 extensions:\n"
              "            X509v3 Key Usage: critical\n"
              "                Digital Signature\n"
              "            X509v3 Basic Constraints: critical\n"
              "                CA:FALSE\n"
              "            X509v3 Subject Key Identifier:\n"
              "                C0:6F:3A:4A:1B:ED:51:DD:9D:A3:4B:C0:41:F6:6A:11:F9:AB:8B:F1\n"
              "            X509v3 Authority Key Identifier:\n"
              "                keyid:45:A2:4C:A9:8A:5B:4A:27:5E:85:A6:4D:05:1C:27:44:A5:87:76:17\n"
              "\n"
              "            X509v3 CRL Distribution Points:\n"
              "                URI:http://www.apple.com/appleca/iphone.crl\n"
              "\n"
              "    Signature Algorithm: sha1WithRSAEncryption\n"
              "        0e:4f:55:00:9d:1e:4c:75:28:e8:79:bb:db:5c:5c:cc:45:93:\n"
              "        46:d3:3b:14:00:2d:5b:b0:8c:2e:15:3e:19:60:43:25:59:7f:\n"
              "        7b:3a:b2:7c:cf:c2:96:dd:b0:d7:70:5a:8e:28:c4:cc:32:2c:\n"
              "        f4:c2:43:e3:e1:1f:b3:b1:df:ec:86:dd:43:93:45:60:a1:53:\n"
              "        05:ba:6a:70:43:44:11:a1:9e:dd:c1:71:8b:cb:30:cd:d3:15:\n"
              "        21:e0:27:30:35:8a:76:8e:c2:23:fb:44:22:bd:96:f6:aa:55:\n"
              "        bf:4d:11:b1:0e:c4:7f:cf:86:8d:f8:30:dd:80:48:5d:9e:41:\n"
              "        4e:e0:29:96:25:cc:d6:4a:0d:47:05:87:c4:61:f6:b0:1e:1a:\n"
              "        da:48:56:a3:c1:c1:56:95:b3:4e:84:82:1b:a5:4d:d3:d0:5d:\n"
              "        60:cf:fd:e5:75:3c:91:13:e2:e4:f1:60:4a:58:93:de:3f:e9:\n"
              "        3c:bf:da:c9:f6:ef:9b:9e:b1:6e:78:9e:81:f6:e7:4c:09:b3:\n"
              "        1c:87:25:bf:8f:6e:3f:d6:03:53:1e:09:a3:5b:00:4b:9e:98:\n"
              "        fb:ae:13:86:e4:47:6a:1a:44:f8:15:c8:fb:30:c7:bd:b0:e8:\n"
              "        8c:ac:2d:73:08:af:ed:b2:e8:f5:6d:a1:e2:d9:45:de:d5:b9:\n"
              "        98:89:16:72\n"
              "-----BEGIN CERTIFICATE-----\n"
              "MIIDdjCCAl6gAwIBAgIBAjANBgkqhkiG9w0BAQUFADCBgDELMAkGA1UEBhMCVVMx\n"
              "EzARBgNVBAoTCkFwcGxlIEluYy4xJjAkBgNVBAsTHUFwcGxlIENlcnRpZmljYXRp\n"
              "b24gQXV0aG9yaXR5MTQwMgYDVQQDFCtbVEVTVF0gQXBwbGUgaVBob25lIENlcnRp\n"
              "ZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MDMyMTA2MjA1MFoXDTIyMDMxMjA2MjA1\n"
              "MFowYjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFwcGxlIEluYy4xFTATBgNVBAsT\n"
              "DEFwcGxlIGlQaG9uZTEnMCUGA1UEAxQeW1RFU1RdIEFwcGxlIGlQaG9uZSBBY3Rp\n"
              "dmF0aW9uMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCzYmXsSN3d7UTU8f77\n"
              "wm9C0IIJAwCmAeixBwkmWxJl239RFe9PRbOPzk0WHTiEARBXToxx4V7eZxR12kia\n"
              "TG/wRWVm6Jy1okz0U8HsmGKQsJS+EvKgrFx3FgdzclqXulBOZzBSHvAwTo+ypNPR\n"
              "+vhmeYeRL6HvTuZBjZQYKeDyzwIDAQABo4GbMIGYMA4GA1UdDwEB/wQEAwIHgDAM\n"
              "BgNVHRMBAf8EAjAAMB0GA1UdDgQWBBTAbzpKG+1R3Z2jS8BB9moR+auL8TAfBgNV\n"
              "HSMEGDAWgBRFokypiltKJ16Fpk0FHCdEpYd2FzA4BgNVHR8EMTAvMC2gK6Aphido\n"
              "dHRwOi8vd3d3LmFwcGxlLmNvbS9hcHBsZWNhL2lwaG9uZS5jcmwwDQYJKoZIhvcN\n"
              "AQEFBQADggEBAA5PVQCdHkx1KOh5u9tcXMxFk0bTOxQALVuwjC4VPhlgQyVZf3s6\n"
              "snzPwpbdsNdwWo4oxMwyLPTCQ+PhH7Ox3+yG3UOTRWChUwW6anBDRBGhnt3BcYvL\n"
              "MM3TFSHgJzA1inaOwiP7RCK9lvaqVb9NEbEOxH/Pho34MN2ASF2eQU7gKZYlzNZK\n"
              "DUcFh8Rh9rAeGtpIVqPBwVaVs06EghulTdPQXWDP/eV1PJET4uTxYEpYk94/6Ty/\n"
              "2sn275uesW54noH250wJsxyHJb+Pbj/WA1MeCaNbAEuemPuuE4bkR2oaRPgVyPsw\n"
              "x72w6IysLXMIr+2y6PVtoeLZRd7VuZiJFnI=\n"
              "-----END CERTIFICATE-----\n";
      else {
        uint64_t v10 = "Bag Attributes\n"
      }
              "    localKeyID: 75 60 9A FA 74 F6 E1 90 9C 00 2D 77 E5 10 D6 1C B3 E5 1F 4B\n"
              "subject=/C=US/O=Apple Inc./OU=Apple iPhone/CN=Apple iPhone Activation\n"
              "issuer=/C=US/O=Apple Inc./OU=Apple Certification Authority/CN=Apple iPhone Certification Authority\n"
              "-----BEGIN CERTIFICATE-----\n"
              "MIIDZzCCAk+gAwIBAgIBAjANBgkqhkiG9w0BAQUFADB5MQswCQYDVQQGEwJVUzET\n"
              "MBEGA1UEChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBwbGUgQ2VydGlmaWNhdGlv\n"
              "biBBdXRob3JpdHkxLTArBgNVBAMTJEFwcGxlIGlQaG9uZSBDZXJ0aWZpY2F0aW9u\n"
              "IEF1dGhvcml0eTAeFw0wNzA0MTYyMjU1MDJaFw0xNDA0MTYyMjU1MDJaMFsxCzAJ\n"
              "BgNVBAYTAlVTMRMwEQYDVQQKEwpBcHBsZSBJbmMuMRUwEwYDVQQLEwxBcHBsZSBp\n"
              "UGhvbmUxIDAeBgNVBAMTF0FwcGxlIGlQaG9uZSBBY3RpdmF0aW9uMIGfMA0GCSqG\n"
              "SIb3DQEBAQUAA4GNADCBiQKBgQDFAXzRImArmoiHfbS2oPcqAfbEv0d1jk7GbnX7\n"
              "+4YUlyIfprzBVdlmz2JHYv1+04IzJtL7cL97UI7fk0i0OMY0al8a+JPQa4Ug611T\n"
              "bqEt+njAmAkge3HXWDBdAXD9MhkC7T/9o77zOQ1oli4cUdzlnYWfzmW0PduOxuve\n"
              "AeYY4wIDAQABo4GbMIGYMA4GA1UdDwEB/wQEAwIHgDAMBgNVHRMBAf8EAjAAMB0G\n"
              "A1UdDgQWBBShoNL+t7Rz/psUaq/NPXNPH+/WlDAfBgNVHSMEGDAWgBTnNCouIt45\n"
              "YGu0lM53g2EvMaB8NTA4BgNVHR8EMTAvMC2gK6AphidodHRwOi8vd3d3LmFwcGxl\n"
              "LmNvbS9hcHBsZWNhL2lwaG9uZS5jcmwwDQYJKoZIhvcNAQEFBQADggEBAF9qmrUN\n"
              "dA+FROYGP7pWcYTAK+pLyOf9zOaE7aeVI885V8Y/BKHhlwAo+zEkiOU3FbEPCS9V\n"
              "tS18ZBcwD/+d5ZQTMFknhcUJwdPqqjnm9LqTfH/x4pw8ONHRDzxHdp96gOV3A4+8\n"
              "abkoASfcYqvIRypXnbur3bRRhTzAs4VILS6jTyFYymZeSewtBubmmigo1kCQiZGc\n"
              "76c5feDAyHb2bzEqtvx3WprljtS46QT5CR6YelinZnio32jAzRYTxtS6r3JsvZDi\n"
              "J07+EHcmfGdpxwgO+7btW1pFar0ZjF9/jYKKnOYNyvCrwszhafbSYwzAG5EJoXFB\n"
              "4d+piWHUDcPxtcc=\n"
              "-----END CERTIFICATE-----";
      id v11 = (unsigned int *)&QAIphoneActivationPEMLen;
      id v12 = (unsigned int *)&iPhoneActivationPEMLen;
LABEL_48:
      if (v9) {
        id v11 = v12;
      }
      unsigned int v14 = *v11;
      goto LABEL_52;
    case 14:
      unsigned int v14 = 4721;
      uint64_t v10 = iPhoneCAPEM;
      goto LABEL_52;
    default:
      createMobileActivationError((uint64_t)"copyRootCertificate", 118, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid certificate type: %d", a7, a8, a1);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13) {
        goto LABEL_55;
      }
      unsigned int v14 = 0;
      uint64_t v10 = 0;
LABEL_52:
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v10 length:v14 freeWhenDone:0];
      if (v15)
      {
        uint64_t v18 = (void *)v15;
        id v13 = 0;
      }
      else
      {
        createMobileActivationError((uint64_t)"copyRootCertificate", 128, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create certificate.", v16, v17, v20);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_55:
        if (a3)
        {
          id v13 = v13;
          uint64_t v18 = 0;
          *a3 = v13;
        }
        else
        {
          uint64_t v18 = 0;
        }
      }

      return v18;
  }
}

id libavp_send_host_message(void *a1, void *a2)
{
  id v3 = a1;
  cf[0] = 0;
  if (!is_virtual_machine())
  {
    uint64_t v25 = @"Device is not a VM (not supported).";
    uint64_t v26 = 60;
    uint64_t v27 = -3;
LABEL_15:
    createMobileActivationError((uint64_t)"libavp_send_host_message", v26, @"com.apple.MobileActivation.ErrorDomain", v27, 0, v25, v4, v5, (uint64_t)v31);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = 0;
    id v19 = 0;
    uint64_t v10 = 0;
    uint64_t v20 = 0;
    id v8 = 0;
LABEL_16:
    BOOL v9 = 0;
    goto LABEL_17;
  }
  if (!AppleVirtualPlatformLibraryCore())
  {
    uint64_t v25 = @"Virtualization library not loaded on this platform.";
    uint64_t v26 = 65;
    uint64_t v27 = -1;
    goto LABEL_15;
  }
  if (!v3)
  {
    uint64_t v25 = @"Invalid intput.";
    uint64_t v26 = 70;
    uint64_t v27 = -2;
    goto LABEL_15;
  }
  id v8 = copy_calling_process_name();
  if (!v8)
  {
    createMobileActivationError((uint64_t)"libavp_send_host_message", 76, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve process name.", v6, v7, (uint64_t)v31);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = 0;
    id v19 = 0;
    uint64_t v10 = 0;
    uint64_t v20 = 0;
    goto LABEL_16;
  }
  BOOL v9 = (void *)[v3 mutableCopy];
  [v9 setObject:v8 forKeyedSubscript:@"HostProcessName"];
  id v32 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:100 options:0 error:&v32];
  id v13 = v32;
  if (!v10)
  {
    createMobileActivationError((uint64_t)"libavp_send_host_message", 85, @"com.apple.MobileActivation.ErrorDomain", -1, v13, @"Could not convert dictionary to xml data.", v11, v12, (uint64_t)v31);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    id v22 = 0;
    id v19 = 0;
LABEL_26:
    uint64_t v20 = 0;
    goto LABEL_17;
  }
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  unsigned int v14 = (uint64_t (*)(uint64_t, void *, CFTypeRef *))getAppleVirtualPlatformSendSubsystemMessageToHostSymbolLoc_ptr;
  uint64_t v38 = getAppleVirtualPlatformSendSubsystemMessageToHostSymbolLoc_ptr;
  if (!getAppleVirtualPlatformSendSubsystemMessageToHostSymbolLoc_ptr)
  {
    cf[1] = (CFTypeRef)MEMORY[0x1E4F143A8];
    cf[2] = (CFTypeRef)3221225472;
    cf[3] = __getAppleVirtualPlatformSendSubsystemMessageToHostSymbolLoc_block_invoke;
    cf[4] = &unk_1E6CD5CF0;
    uint64_t v34 = &v35;
    uint64_t v15 = (void *)AppleVirtualPlatformLibrary();
    uint64_t v16 = dlsym(v15, "AppleVirtualPlatformSendSubsystemMessageToHost");
    *(void *)(v34[1] + 24) = v16;
    getAppleVirtualPlatformSendSubsystemMessageToHostSymbolLoc_ptr = *(_UNKNOWN **)(v34[1] + 24);
    unsigned int v14 = (uint64_t (*)(uint64_t, void *, CFTypeRef *))v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (!v14) {
    libavp_send_host_message_cold_1();
  }
  id v19 = (void *)v14(6, v10, cf);
  if (!v19)
  {
    createMobileActivationError((uint64_t)"libavp_send_host_message", 91, @"com.apple.MobileActivation.ErrorDomain", -1, (void *)cf[0], @"Failed to send message to host.", v17, v18, (uint64_t)v31);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    id v22 = 0;
    goto LABEL_26;
  }
  id v31 = 0;
  uint64_t v20 = [MEMORY[0x1E4F28F98] propertyListWithData:v19 options:0 format:0 error:&v31];
  id v21 = v31;

  isNSDictionary(v20);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    id v22 = v20;
    uint64_t v20 = v22;
  }
  else
  {
    uint64_t v30 = createMobileActivationError((uint64_t)"libavp_send_host_message", 97, @"com.apple.MobileActivation.ErrorDomain", -1, v21, @"Failed to serialize data as dictionary.", v23, v24, (uint64_t)v31);

    id v21 = (id)v30;
  }
LABEL_17:
  if (a2 && !v22) {
    *a2 = v21;
  }
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  id v28 = v22;

  return v28;
}

void sub_1DD6E699C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id libavp_copy_strong_identity_data(void *a1, void *a2)
{
  id v3 = a1;
  CFTypeRef cf = 0;
  if (!is_virtual_machine())
  {
    uint64_t v15 = @"Device is not a VM (not supported).";
    uint64_t v16 = 126;
    uint64_t v17 = -3;
LABEL_9:
    createMobileActivationError((uint64_t)"libavp_copy_strong_identity_data", v16, @"com.apple.MobileActivation.ErrorDomain", v17, 0, v15, v4, v5, v40);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    goto LABEL_10;
  }
  if (!AppleVirtualPlatformLibraryCore())
  {
    uint64_t v15 = @"Virtualization library not loaded on this platform.";
    uint64_t v16 = 131;
    uint64_t v17 = -1;
    goto LABEL_9;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v8)
  {
    BOOL v9 = [v3 objectForKeyedSubscript:@"NetworkTimeoutInterval"];
    uint64_t v10 = isNSNumber(v9);

    if (v10)
    {
      uint64_t v11 = [v3 objectForKeyedSubscript:@"NetworkTimeoutInterval"];
      [v11 doubleValue];
      if (v14 <= 0.0)
      {
        createMobileActivationError((uint64_t)"libavp_copy_strong_identity_data", 144, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid network timeout requested: %@", v12, v13, (uint64_t)v11);
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v20 = [v8 objectForKeyedSubscript:@"SkipNetworkRequest"];
    id v21 = isNSNumber(v20);

    if (v21)
    {
      id v22 = [v8 objectForKeyedSubscript:@"SkipNetworkRequest"];
      uint64_t v23 = [v22 BOOLValue];
    }
    else
    {
      uint64_t v23 = 0;
    }
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v24 = (void *)getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousSymbolLoc_ptr;
    id v50 = (void *)getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousSymbolLoc_ptr;
    if (!getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousSymbolLoc_ptr)
    {
      uint64_t v42 = MEMORY[0x1E4F143A8];
      uint64_t v43 = 3221225472;
      uint64_t v44 = __getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousSymbolLoc_block_invoke;
      uint64_t v45 = &unk_1E6CD5CF0;
      uint64_t v46 = &v47;
      uint64_t v25 = (void *)AppleVirtualPlatformLibrary();
      v48[3] = (uint64_t)dlsym(v25, "kAppleVirtualPlatformGuestStrongIdentityOptionSynchronous");
      getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousSymbolLoc_ptr = *(void *)(v46[1] + 24);
      uint64_t v24 = (void *)v48[3];
    }
    _Block_object_dispose(&v47, 8);
    if (!v24) {
      libavp_copy_strong_identity_data_cold_1();
    }
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v24];
    uint64_t v26 = [NSNumber numberWithBool:v23];
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v27 = (void *)getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnlySymbolLoc_ptr;
    id v50 = (void *)getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnlySymbolLoc_ptr;
    if (!getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnlySymbolLoc_ptr)
    {
      uint64_t v42 = MEMORY[0x1E4F143A8];
      uint64_t v43 = 3221225472;
      uint64_t v44 = __getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnlySymbolLoc_block_invoke;
      uint64_t v45 = &unk_1E6CD5CF0;
      uint64_t v46 = &v47;
      id v28 = (void *)AppleVirtualPlatformLibrary();
      v48[3] = (uint64_t)dlsym(v28, "kAppleVirtualPlatformGuestStrongIdentityOptionCachedOnly");
      getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnlySymbolLoc_ptr = *(void *)(v46[1] + 24);
      uint64_t v27 = (void *)v48[3];
    }
    _Block_object_dispose(&v47, 8);
    if (!v27) {
      libavp_copy_strong_identity_data_cold_2();
    }
    [v8 setObject:v26 forKeyedSubscript:*v27];

    if (v11)
    {
      uint64_t v29 = NSNumber;
      [v11 doubleValue];
      id v31 = [v29 numberWithDouble:v30 * 1000000000.0];
      uint64_t v47 = 0;
      uint64_t v48 = &v47;
      uint64_t v49 = 0x2020000000;
      id v32 = (void *)getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsecSymbolLoc_ptr;
      id v50 = (void *)getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsecSymbolLoc_ptr;
      if (!getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsecSymbolLoc_ptr)
      {
        uint64_t v42 = MEMORY[0x1E4F143A8];
        uint64_t v43 = 3221225472;
        uint64_t v44 = __getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsecSymbolLoc_block_invoke;
        uint64_t v45 = &unk_1E6CD5CF0;
        uint64_t v46 = &v47;
        id v33 = (void *)AppleVirtualPlatformLibrary();
        v48[3] = (uint64_t)dlsym(v33, "kAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsec");
        getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsecSymbolLoc_ptr = *(void *)(v46[1] + 24);
        id v32 = (void *)v48[3];
      }
      _Block_object_dispose(&v47, 8);
      if (!v32) {
        libavp_copy_strong_identity_data_cold_4();
      }
      [v8 setObject:v31 forKeyedSubscript:*v32];
    }
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v34 = (uint64_t (*)(id, CFTypeRef *))getAppleVirtualPlatformGuestCopyStrongIdentityDataSymbolLoc_ptr;
    id v50 = getAppleVirtualPlatformGuestCopyStrongIdentityDataSymbolLoc_ptr;
    if (!getAppleVirtualPlatformGuestCopyStrongIdentityDataSymbolLoc_ptr)
    {
      uint64_t v42 = MEMORY[0x1E4F143A8];
      uint64_t v43 = 3221225472;
      uint64_t v44 = __getAppleVirtualPlatformGuestCopyStrongIdentityDataSymbolLoc_block_invoke;
      uint64_t v45 = &unk_1E6CD5CF0;
      uint64_t v46 = &v47;
      uint64_t v35 = (void *)AppleVirtualPlatformLibrary();
      v48[3] = (uint64_t)dlsym(v35, "AppleVirtualPlatformGuestCopyStrongIdentityData");
      getAppleVirtualPlatformGuestCopyStrongIdentityDataSymbolLoc_ptr = *(_UNKNOWN **)(v46[1] + 24);
      uint64_t v34 = (uint64_t (*)(id, CFTypeRef *))v48[3];
    }
    _Block_object_dispose(&v47, 8);
    if (!v34) {
      libavp_copy_strong_identity_data_cold_3();
    }
    uint64_t v36 = (void *)v34(v8, &cf);
    if (v36)
    {
      id v19 = v36;
      id v18 = 0;
      goto LABEL_36;
    }
    createMobileActivationError((uint64_t)"libavp_copy_strong_identity_data", 162, @"com.apple.MobileActivation.ErrorDomain", -24, (void *)cf, @"Failed to copy AVP guest identity data.", v37, v38, v40);
LABEL_34:
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!a2) {
      goto LABEL_35;
    }
LABEL_11:
    id v18 = v18;
    id v19 = 0;
    *a2 = v18;
    goto LABEL_36;
  }
  createMobileActivationError((uint64_t)"libavp_copy_strong_identity_data", 137, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate dictionary.", v6, v7, v40);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  uint64_t v11 = 0;
  if (a2) {
    goto LABEL_11;
  }
LABEL_35:
  id v19 = 0;
LABEL_36:
  if (cf) {
    CFRelease(cf);
  }

  return v19;
}

void sub_1DD6E6FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const void *libavp_copy_host_key_and_certs_with_data(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v45 = v7;
  if (is_virtual_machine())
  {
    uint64_t v11 = v8;
    uint64_t v12 = @"Device is a VM (not supported).";
    uint64_t v13 = 192;
    uint64_t v14 = -3;
LABEL_18:
    createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", v13, @"com.apple.MobileActivation.ErrorDomain", v14, 0, v12, v9, v10, (uint64_t)v44);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = 0;
    id v17 = 0;
    goto LABEL_19;
  }
  if (!AppleVirtualPlatformLibraryCore())
  {
    uint64_t v11 = v8;
    uint64_t v12 = @"Virtualization library not loaded on this platform.";
    uint64_t v13 = 197;
    uint64_t v14 = -1;
    goto LABEL_18;
  }
  if (!v7)
  {
    uint64_t v11 = v8;
    uint64_t v12 = @"Invalid intput.";
    uint64_t v13 = 202;
    uint64_t v14 = -2;
    goto LABEL_18;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  if (!v17)
  {
    uint64_t v11 = v8;
    createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 208, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate data.", v15, v16, (uint64_t)v44);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = 0;
LABEL_19:
    CFDataRef v34 = 0;
    id v31 = 0;
    uint64_t v38 = 0;
    uint64_t v27 = 0;
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2050000000;
  id v18 = (void *)getAppleVirtualPlatformHostCertificateClass_softClass;
  uint64_t v51 = getAppleVirtualPlatformHostCertificateClass_softClass;
  if (!getAppleVirtualPlatformHostCertificateClass_softClass)
  {
    v46[1] = (id)MEMORY[0x1E4F143A8];
    v46[2] = (id)3221225472;
    v46[3] = __getAppleVirtualPlatformHostCertificateClass_block_invoke;
    v46[4] = &unk_1E6CD5CF0;
    uint64_t v47 = &v48;
    AppleVirtualPlatformLibraryCore();
    v49[3] = (uint64_t)objc_getClass("AppleVirtualPlatformHostCertificate");
    getAppleVirtualPlatformHostCertificateClass_softClass = *(void *)(v47[1] + 24);
    id v18 = (void *)v49[3];
  }
  id v19 = v18;
  _Block_object_dispose(&v48, 8);
  v46[0] = 0;
  uint64_t v20 = (void *)[[v19 alloc] initWithDataRepresentation:v7 error:v46];
  id v23 = v46[0];
  if (!v20)
  {
    uint64_t v11 = v8;
    uint64_t v41 = createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 214, @"com.apple.MobileActivation.ErrorDomain", -1, v23, @"Failed to initialize identity data.", v21, v22, (uint64_t)v44);

    CFDataRef v34 = 0;
    id v31 = 0;
    uint64_t v38 = 0;
    uint64_t v27 = 0;
    goto LABEL_34;
  }
  uint64_t v24 = (const void *)[v20 hostKey];
  uint64_t v27 = v24;
  if (!v24)
  {
    uint64_t v11 = v8;
    uint64_t v41 = createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 220, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy AVP host key.", v25, v26, (uint64_t)v44);

    CFDataRef v34 = 0;
    id v31 = 0;
LABEL_33:
    uint64_t v38 = 0;
    goto LABEL_34;
  }
  uint64_t v11 = v8;
  CFRetain(v24);
  id v28 = (__SecCertificate *)[v20 leafCertificate];
  id v31 = v28;
  if (!v28)
  {
    uint64_t v41 = createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 228, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy AVP host leaf certificate.", v29, v30, (uint64_t)v44);

    CFDataRef v34 = 0;
    goto LABEL_33;
  }
  CFRetain(v28);
  CFDataRef v34 = SecCertificateCopyData(v31);
  if (!v34)
  {
    uint64_t v41 = createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 236, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create PEM data from cert.", v32, v33, (uint64_t)v44);

    goto LABEL_33;
  }
  [v17 appendData:v34];
  uint64_t v35 = (__SecCertificate *)[v20 intermediateCertificate];
  uint64_t v38 = v35;
  if (v35)
  {
    CFRetain(v35);
    CFDataRef v44 = SecCertificateCopyData(v38);

    CFDataRef v34 = v44;
    if (v44)
    {
      [v17 appendData:v44];
      if (a3)
      {
        id v17 = v17;
        *a3 = v17;
      }
      goto LABEL_24;
    }
    uint64_t v42 = @"Failed to create PEM data from cert.";
    uint64_t v43 = 252;
  }
  else
  {
    uint64_t v42 = @"Failed to copy AVP host intermediate certificate.";
    uint64_t v43 = 244;
  }
  uint64_t v41 = createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", v43, @"com.apple.MobileActivation.ErrorDomain", -1, 0, v42, v36, v37, (uint64_t)v44);

LABEL_34:
  id v23 = (id)v41;
  if (a4) {
LABEL_20:
  }
    *a4 = v23;
LABEL_21:
  if (v27) {
    CFRelease(v27);
  }
  uint64_t v27 = 0;
  uint64_t v39 = 0;
  if (v31)
  {
LABEL_24:
    CFRelease(v31);
    uint64_t v39 = v27;
  }
  if (v38) {
    CFRelease(v38);
  }

  return v39;
}

void sub_1DD6E74B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t libavp_guest_has_host_key(void *a1)
{
  if (!is_virtual_machine())
  {
    id v8 = @"Device is not a VM (not supported).";
    uint64_t v9 = 285;
    uint64_t v10 = -3;
    goto LABEL_10;
  }
  if (!AppleVirtualPlatformLibraryCore())
  {
    id v8 = @"Virtualization library not loaded on this platform.";
    uint64_t v9 = 290;
    uint64_t v10 = -1;
LABEL_10:
    id v7 = createMobileActivationError((uint64_t)"libavp_guest_has_host_key", v9, @"com.apple.MobileActivation.ErrorDomain", v10, 0, v8, v2, v3, v12);
    uint64_t v6 = 0;
    if (!a1) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(void))getAppleVirtualPlatformGuestHasHostKeySymbolLoc_ptr;
  uint64_t v16 = getAppleVirtualPlatformGuestHasHostKeySymbolLoc_ptr;
  if (!getAppleVirtualPlatformGuestHasHostKeySymbolLoc_ptr)
  {
    uint64_t v5 = (void *)AppleVirtualPlatformLibrary();
    v14[3] = (uint64_t)dlsym(v5, "AppleVirtualPlatformGuestHasHostKey");
    getAppleVirtualPlatformGuestHasHostKeySymbolLoc_ptr = (_UNKNOWN *)v14[3];
    uint64_t v4 = (uint64_t (*)(void))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v4) {
    libavp_guest_has_host_key_cold_1();
  }
  uint64_t v6 = v4();
  id v7 = 0;
  if (a1)
  {
LABEL_11:
    if ((v6 & 1) == 0) {
      *a1 = v7;
    }
  }
LABEL_13:

  return v6;
}

void sub_1DD6E7658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AppleVirtualPlatformLibraryCore()
{
  if (!AppleVirtualPlatformLibraryCore_frameworkLibrary) {
    AppleVirtualPlatformLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return AppleVirtualPlatformLibraryCore_frameworkLibrary;
}

uint64_t __AppleVirtualPlatformLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleVirtualPlatformLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAppleVirtualPlatformSendSubsystemMessageToHostSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppleVirtualPlatformLibrary();
  uint64_t result = dlsym(v2, "AppleVirtualPlatformSendSubsystemMessageToHost");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAppleVirtualPlatformSendSubsystemMessageToHostSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

uint64_t AppleVirtualPlatformLibrary()
{
  id v1 = 0;
  uint64_t result = AppleVirtualPlatformLibraryCore();
  if (!result) {
    AppleVirtualPlatformLibrary_cold_1(&v1);
  }
  return result;
}

void *__getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppleVirtualPlatformLibrary();
  uint64_t result = dlsym(v2, "kAppleVirtualPlatformGuestStrongIdentityOptionSynchronous");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                        + 24);
  return result;
}

void *__getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnlySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppleVirtualPlatformLibrary();
  uint64_t result = dlsym(v2, "kAppleVirtualPlatformGuestStrongIdentityOptionCachedOnly");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnlySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

void *__getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsecSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppleVirtualPlatformLibrary();
  uint64_t result = dlsym(v2, "kAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsec");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsecSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAppleVirtualPlatformGuestCopyStrongIdentityDataSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppleVirtualPlatformLibrary();
  uint64_t result = dlsym(v2, "AppleVirtualPlatformGuestCopyStrongIdentityData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAppleVirtualPlatformGuestCopyStrongIdentityDataSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

Class __getAppleVirtualPlatformHostCertificateClass_block_invoke(uint64_t a1)
{
  AppleVirtualPlatformLibraryCore();
  Class result = objc_getClass("AppleVirtualPlatformHostCertificate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAppleVirtualPlatformHostCertificateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAppleVirtualPlatformGuestHasHostKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppleVirtualPlatformLibrary();
  Class result = dlsym(v2, "AppleVirtualPlatformGuestHasHostKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAppleVirtualPlatformGuestHasHostKeySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id parseDERCertificatesFromChain(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v6 = v3;
  memset(v21, 0, sizeof(v21));
  unint64_t v20 = 0;
  if (!v3)
  {
    uint64_t v15 = @"Invalid input.";
    uint64_t v16 = 106;
    uint64_t v17 = -2;
    goto LABEL_13;
  }
  id v7 = v3;
  unint64_t v8 = [v7 bytes];
  uint64_t v9 = CTParseCertificateSet(v8, v8 + [v7 length], v21, 3, &v20);
  if (v9 || !v20)
  {
    uint64_t v19 = v9;
    uint64_t v15 = @"Failed to parse certificate set: 0x%08x";
    uint64_t v16 = 115;
    uint64_t v17 = -1;
LABEL_13:
    uint64_t v14 = createMobileActivationError((uint64_t)"parseDERCertificatesFromChain", v16, @"com.apple.MobileActivation.ErrorDomain", v17, 0, v15, v4, v5, v19);
    id v10 = 0;
    if (!a2) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v10)
  {
    if (v20)
    {
      uint64_t v11 = 0;
      int v12 = 0;
      do
      {
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*(void *)&v21[v11] length:*((void *)&v21[v11] + 1)];
        [v10 setObject:v13 atIndexedSubscript:v11];

        uint64_t v11 = ++v12;
      }
      while (v20 > v12);
    }
    id v10 = v10;
  }
  uint64_t v14 = 0;
  if (a2)
  {
LABEL_14:
    if (!v10) {
      *a2 = v14;
    }
  }
LABEL_16:

  return v10;
}

uint64_t evaluateBAATrust(void *a1, void *a2, int a3, void *a4)
{
  id v7 = a1;
  id v10 = a2;
  if (v7)
  {
    id v11 = v7;
    unint64_t v12 = [v11 bytes];
    uint64_t v13 = [v11 length];
    id v14 = v10;
    uint64_t v15 = [v14 bytes];
    uint64_t v16 = [v14 length];
    if (a3)
    {
      unint64_t v17 = CTEvaluateBAASystemTestRoot(v12, v13, v15, v16, 0, 0, 0);
      if (v17)
      {
LABEL_4:
        createMobileActivationError((uint64_t)"evaluateBAATrust", 290, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to evaluate trust: 0x%08x", v18, v19, v17);
        goto LABEL_6;
      }
    }
    else
    {
      unint64_t v17 = CTEvaluateBAAUserTestRoot(v12, v13, v15, v16, 0, 0, 0);
      if (v17) {
        goto LABEL_4;
      }
    }
    id v20 = 0;
    uint64_t v21 = 1;
    goto LABEL_11;
  }
  createMobileActivationError((uint64_t)"evaluateBAATrust", 280, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.", v8, v9, v23);
LABEL_6:
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    id v20 = v20;
    uint64_t v21 = 0;
    *a4 = v20;
  }
  else
  {
    uint64_t v21 = 0;
  }
LABEL_11:

  return v21;
}

uint64_t evaluateBAATrustWithCerts(__SecCertificate *a1, __SecCertificate *a2, __SecCertificate *a3, int a4, int a5, void *a6, void *a7)
{
  id v13 = a6;
  uint64_t v16 = v13;
  CFErrorRef error = 0;
  if (!a1 || !a2 || !a3)
  {
    unint64_t v17 = @"Invalid input(s).";
    uint64_t v18 = 317;
    uint64_t v19 = -2;
LABEL_20:
    createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", v18, @"com.apple.MobileActivation.ErrorDomain", v19, 0, v17, v14, v15, (uint64_t)v47);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = 0;
LABEL_24:
    CFDataRef v28 = 0;
LABEL_25:
    CFDataRef v25 = 0;
LABEL_26:
    CFDataRef v34 = 0;
    goto LABEL_27;
  }
  if (v13)
  {
    if (!a5) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    if (!a5) {
      goto LABEL_11;
    }
  }
  [v16 timeIntervalSinceReferenceDate];
  if (!SecCertificateIsValid()
    || ([v16 timeIntervalSinceReferenceDate], (SecCertificateIsValid() & 1) == 0))
  {
    unint64_t v17 = @"Certificate is expired.";
    uint64_t v18 = 333;
    uint64_t v19 = -1;
    goto LABEL_20;
  }
LABEL_11:
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  if (!v22)
  {
    uint64_t v42 = @"Failed to allocate data.";
    uint64_t v43 = 342;
LABEL_23:
    createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", v43, @"com.apple.MobileActivation.ErrorDomain", -1, 0, v42, v20, v21, (uint64_t)v47);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  CFDataRef v23 = SecCertificateCopyData(a1);
  if (!v23)
  {
    uint64_t v42 = @"Failed to copy certificate.";
    uint64_t v43 = 348;
    goto LABEL_23;
  }
  CFDataRef v24 = v23;
  [v22 appendData:v23];
  CFDataRef v25 = SecCertificateCopyData(a2);

  if (!v25)
  {
    createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", 356, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy certificate.", v26, v27, (uint64_t)v47);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    CFDataRef v28 = 0;
    goto LABEL_26;
  }
  [v22 appendData:v25];
  CFDataRef v28 = SecCertificateCopyData(a3);

  if (!v28)
  {
    createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", 364, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy certificate.", v29, v30, (uint64_t)v47);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  [v22 appendData:v28];
  id v31 = SecCertificateCopyKey(a3);
  CFDataRef v34 = v31;
  if (v31)
  {
    CFDataRef v25 = SecKeyCopyExternalRepresentation(v31, &error);
    if (v25)
    {
      id v47 = 0;
      char v37 = evaluateBAATrust(v22, v25, a4, &v47);
      id v40 = v47;
      if (v37)
      {
        uint64_t v41 = 1;
LABEL_30:
        CFRelease(v34);
        uint64_t v44 = v41;
        goto LABEL_31;
      }
      uint64_t v46 = createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", 391, @"com.apple.MobileActivation.ErrorDomain", -1, v40, @"Failed to verify BAA certificate.", v38, v39, (uint64_t)v47);

      id v40 = (id)v46;
    }
    else
    {
      createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", 384, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to copy public key data.", v35, v36, (uint64_t)v47);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", 378, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy public key.", v32, v33, (uint64_t)v47);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    CFDataRef v25 = 0;
  }
LABEL_27:
  if (a7) {
    *a7 = v40;
  }
  uint64_t v41 = 0;
  uint64_t v44 = 0;
  if (v34) {
    goto LABEL_30;
  }
LABEL_31:
  if (error) {
    CFRelease(error);
  }

  return v44;
}

id DeviceIdentityProcessVMRequest(void *a1)
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CFErrorRef error = 0;
  unint64_t v4 = 0x1E4F28000uLL;
  if (is_virtual_machine())
  {
    createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", 160, @"com.apple.MobileActivation.ErrorDomain", -3, 0, @"Device is a VM (not supported).", v2, v3, v54);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = 0;
    id v7 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    id v10 = 0;
    goto LABEL_19;
  }
  id v11 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  id v10 = v11;
  if (!v11)
  {
    id v31 = @"Failed to create task.";
    uint64_t v32 = 168;
    CFErrorRef v33 = 0;
LABEL_18:
    createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", v32, @"com.apple.MobileActivation.ErrorDomain", -1, v33, v31, v12, v13, v54);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = 0;
    id v7 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    goto LABEL_19;
  }
  CFStringRef v14 = SecTaskCopySigningIdentifier(v11, &error);
  if (!v14)
  {
    CFErrorRef v33 = error;
    id v31 = @"Failed to query code signing identifier.";
    uint64_t v32 = 174;
    goto LABEL_18;
  }
  id v15 = v1;
  uint64_t v8 = (__CFString *)v14;
  uint64_t v9 = (void *)SecTaskCopyValueForEntitlement(v10, @"com.apple.mobileactivationd.spi", &error);
  uint64_t v16 = isNSNumber(v9);
  if (!v16 || (v17 = (void *)v16, char v18 = [v9 BOOLValue], v17, (v18 & 1) == 0))
  {
    CFErrorRef v34 = error;
    uint64_t v69 = @"com.apple.mobileactivationd.spi";
    v70[0] = MEMORY[0x1E4F1CC38];
    uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
    createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", 180, @"com.apple.MobileActivation.ErrorDomain", -7, v34, @"Missing required entitlement: %@", v36, v37, (uint64_t)v35);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v6 = 0;
    id v7 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    unint64_t v4 = 0x1E4F28000uLL;
    id v1 = v15;
    goto LABEL_19;
  }
  unint64_t v4 = 0x1E4F28000uLL;
  id v61 = 0;
  id v1 = v15;
  uint64_t v19 = [MEMORY[0x1E4F28F98] propertyListWithData:v15 options:0 format:0 error:&v61];
  id v20 = v61;
  id v7 = isNSDictionary(v19);

  uint64_t v58 = v19;
  if (!v7)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", 186, @"com.apple.MobileActivation.ErrorDomain", -1, v20, @"Failed to create dictionary from data.", v21, v22, v54);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v6 = 0;
    uint64_t v57 = 0;
    goto LABEL_19;
  }
  CFDataRef v23 = [v19 objectForKeyedSubscript:@"HostProcessName"];
  CFDataRef v24 = isNSString(v23);

  if (!v24)
  {

    CFDataRef v23 = @"unknown";
  }
  CFDataRef v25 = [v19 objectForKeyedSubscript:@"Command"];
  uint64_t v26 = isNSString(v25);

  uint64_t v57 = v23;
  if (!v26)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", 197, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Request missing required key: %@", v27, v28, @"Command");
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v6 = 0;
    id v7 = v25;
    id v1 = v15;
    unint64_t v4 = 0x1E4F28000;
    goto LABEL_19;
  }
  id v7 = v25;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v66 = v23;
    __int16 v67 = 2114;
    CFErrorRef v68 = v25;
    _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Host connection (%{public}@): %{public}@", buf, 0x16u);
  }
  int v29 = [v25 isEqualToString:@"CopyVMHostCertificateRequest"];
  id v1 = v15;
  unint64_t v4 = 0x1E4F28000;
  if (v29)
  {
    id v60 = v20;
    uint64_t v6 = process_copy_host_certificate_request(v19, &v60);
    uint64_t v30 = v60;
LABEL_38:
    uint64_t v5 = v30;

    goto LABEL_19;
  }
  if ([v7 isEqualToString:@"CreateVMHostKeyAttestationRequest"])
  {
    id v59 = v20;
    uint64_t v6 = process_create_host_key_signature_request(v19, &v59);
    uint64_t v30 = v59;
    goto LABEL_38;
  }
  createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", 208, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid request: %@", v52, v53, (uint64_t)v7);
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = 0;
LABEL_19:
  if (v5)
  {
    uint64_t v38 = v7;
    uint64_t v55 = v9;
    CFErrorRef v56 = v10;
    uint64_t v39 = v8;
    unint64_t v40 = v4;
    uint64_t v41 = v1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v66 = v5;
      _os_log_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error occurred processing request: %@", buf, 0xCu);
    }
    uint64_t v42 = @"Error";
    uint64_t v43 = NSString;
    uint64_t v44 = [(__CFString *)v5 localizedDescription];
    uint64_t v45 = [(__CFString *)v5 userInfo];
    uint64_t v46 = [v43 stringWithFormat:@"%@ (%@)", v44, v45];

    uint64_t v63 = v42;
    uint64_t v64 = v46;
    uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];

    uint64_t v6 = (void *)v47;
    unint64_t v48 = v40;
    uint64_t v8 = v39;
    uint64_t v9 = v55;
    id v10 = v56;
  }
  else
  {
    unint64_t v48 = v4;
    uint64_t v41 = v1;
    uint64_t v38 = v7;
    uint64_t v42 = 0;
    uint64_t v46 = 0;
  }
  if (v6) {
    uint64_t v49 = v6;
  }
  else {
    uint64_t v49 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v50 = [*(id *)(v48 + 3992) dataWithPropertyList:v49 format:100 options:0 error:0];
  if (v10) {
    CFRelease(v10);
  }
  if (error) {
    CFRelease(error);
  }

  return v50;
}

id process_copy_host_certificate_request(void *a1, void *a2)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v6 = v3;
  if (!v3)
  {
    createMobileActivationError((uint64_t)"process_copy_host_certificate_request", 39, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.", v4, v5, v24);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = 0;
    id v9 = 0;
    uint64_t v8 = 0;
LABEL_14:
    uint64_t v22 = 0;
    id v15 = 0;
    goto LABEL_15;
  }
  id v7 = [v3 objectForKeyedSubscript:@"Options"];
  uint64_t v8 = v7;
  if (v7)
  {
    isNSDictionary(v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      createMobileActivationError((uint64_t)"process_copy_host_certificate_request", 45, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid key: %@", v10, v11, @"Options");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = 0;
      goto LABEL_14;
    }
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:@"Value"];
  isNSData(v12);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    createMobileActivationError((uint64_t)"process_copy_host_certificate_request", 51, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Missing or invalid required option: %@", v13, v14, @"BIKData");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  id v25 = 0;
  id v26 = 0;
  id v15 = libavp_copy_host_key_and_certs_with_data(v12, v8, &v26, &v25);
  id v9 = v26;
  id v18 = v25;
  if (v15) {
    BOOL v19 = v9 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    uint64_t v20 = createMobileActivationError((uint64_t)"process_copy_host_certificate_request", 57, @"com.apple.MobileActivation.ErrorDomain", -1, v18, @"Failed to decode host identity data.", v16, v17, v24);

    uint64_t v22 = 0;
    id v18 = (id)v20;
  }
  else
  {
    int v29 = @"RKCertification";
    v30[0] = v9;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    uint64_t v27 = @"Value";
    uint64_t v28 = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  }
LABEL_15:
  if (a2 && !v22) {
    *a2 = v18;
  }
  if (v15) {
    CFRelease(v15);
  }

  return v22;
}

id process_create_host_key_signature_request(void *a1, void *a2)
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v6 = v3;
  CFTypeRef cf = 0;
  if (!v3)
  {
    createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 89, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.", v4, v5, v29);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = 0;
    uint64_t v12 = 0;
    id v9 = 0;
LABEL_15:
    id v13 = 0;
    goto LABEL_16;
  }
  id v7 = [v3 objectForKeyedSubscript:@"Options"];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = isNSDictionary(v7);

    if (!v9)
    {
      createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 95, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid key: %@", v10, v11, @"Options");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v12 = [v8 objectForKeyedSubscript:@"BIKData"];
  isNSData(v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    id v9 = [v6 objectForKeyedSubscript:@"Value"];
    isNSData(v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      id v32 = 0;
      id v33 = 0;
      id v18 = (__SecKey *)libavp_copy_host_key_and_certs_with_data(v12, v8, &v33, &v32);
      id v13 = v33;
      id v21 = v32;
      if (v18) {
        BOOL v22 = v13 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (v22)
      {
        uint64_t v30 = createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 113, @"com.apple.MobileActivation.ErrorDomain", -1, v21, @"Failed to decode host identity data.", v19, v20, v29);

        CFDataRef v23 = 0;
      }
      else
      {
        CFDataRef Signature = SecKeyCreateSignature(v18, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA70], (CFDataRef)v9, (CFErrorRef *)&cf);
        CFDataRef v23 = Signature;
        if (Signature)
        {
          v37[0] = @"RKSignature";
          v37[1] = @"RKCertification";
          v38[0] = Signature;
          v38[1] = v13;
          id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
          uint64_t v35 = @"Value";
          uint64_t v36 = v31;
          uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];

          goto LABEL_17;
        }
        uint64_t v30 = createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 119, @"com.apple.MobileActivation.ErrorDomain", -2, (void *)cf, @"Failed to create signature.", v27, v28, v29);
      }
      uint64_t v24 = 0;
      id v21 = (id)v30;
      goto LABEL_17;
    }
    createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 107, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Missing or invalid required option: %@", v16, v17, @"Value");
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 101, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Missing or invalid required option: %@", v14, v15, @"BIKData");
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = 0;
  }
LABEL_16:
  CFDataRef v23 = 0;
  uint64_t v24 = 0;
  id v18 = 0;
LABEL_17:
  if (a2 && !v24) {
    *a2 = v21;
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0;
  if (v18) {
    CFRelease(v18);
  }

  return v24;
}

uint64_t DeviceIdentityValidateIdentity(__SecKey *a1, __SecCertificate *a2, __SecCertificate *a3, void *a4, BOOL *a5, void *a6)
{
  id v11 = a4;
  if (isRunningInRecovery())
  {
    uint64_t v16 = @"SPI not allowed for processes running in recoveryOS.";
    uint64_t v17 = 256;
    uint64_t v18 = -3;
LABEL_10:
    createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", v17, @"com.apple.MobileActivation.ErrorDomain", v18, 0, v16, v14, v15, v79);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!a2 || !a3)
  {
    uint64_t v16 = @"Invalid input(s).";
    uint64_t v17 = 263;
    uint64_t v18 = -2;
    goto LABEL_10;
  }
  if (a1)
  {
    id v91 = 0;
    int valid = security_valid_security_enclave_reference_key(a1, 0, 0, &v91, v12, v13, v14, v15);
    id v20 = v91;
    CFDataRef v23 = v20;
    if (!valid
      || (id v90 = v20,
          char v24 = security_certificate_matches_key(a1, 0, a2, &v90),
          id v25 = v90,
          v23,
          uint64_t v85 = v25,
          CFDataRef v23 = v25,
          (v24 & 1) == 0))
    {
      createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 270, @"com.apple.MobileActivation.ErrorDomain", -2, v23, @"Invalid reference key.", v21, v22, v79);
      id v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v85 = 0;
  }
  uint64_t v35 = [v11 objectForKeyedSubscript:@"scrtAttestation"];
  uint64_t v36 = isNSNumber(v35);

  uint64_t v82 = a5;
  if (v36)
  {
    uint64_t v37 = [v11 objectForKeyedSubscript:@"scrtAttestation"];
    int v38 = [v37 BOOLValue];
  }
  else
  {
    int v38 = 0;
  }
  BOOL v39 = is_virtual_machine();
  id v40 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v30 = [v40 persistentDomainForName:@"com.apple.mobileactivationd"];

  [@"com.apple.mobileactivationd" UTF8String];
  if (os_variant_allows_internal_security_policies()
    && ([v30 objectForKeyedSubscript:@"UseQACertificates"],
        uint64_t v41 = objc_claimAutoreleasedReturnValue(),
        isNSNumber(v41),
        uint64_t v42 = objc_claimAutoreleasedReturnValue(),
        v42,
        v41,
        v42))
  {
    uint64_t v43 = [v30 objectForKeyedSubscript:@"UseQACertificates"];
    int v83 = [v43 BOOLValue];
  }
  else
  {
    int v83 = 0;
  }
  int v44 = v39 | v38;
  uint64_t v45 = [v11 objectForKeyedSubscript:@"CertType"];
  uint64_t v46 = isNSNumber(v45);

  if (!v46)
  {
    uint64_t v29 = 0;
LABEL_34:
    int v58 = v83;
    BOOL v59 = is_virtual_machine();
    if (v44) {
      unsigned int v60 = 2;
    }
    else {
      unsigned int v60 = 1;
    }
    if (v59) {
      uint64_t v61 = 4;
    }
    else {
      uint64_t v61 = v60;
    }
    goto LABEL_40;
  }
  int v81 = v44;
  uint64_t v29 = [v11 objectForKeyedSubscript:@"CertType"];
  uint64_t v47 = [NSNumber numberWithUnsignedInt:0];
  if ([v29 isEqualToNumber:v47])
  {
  }
  else
  {
    unint64_t v48 = [NSNumber numberWithUnsignedInt:1];
    char v80 = [v29 isEqualToNumber:v48];

    if ((v80 & 1) == 0)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 299, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): %@", v49, v50, @"CertType");
      goto LABEL_51;
    }
  }
  uint64_t v51 = [NSNumber numberWithUnsignedInt:1];
  int v52 = [v29 isEqualToNumber:v51];

  if (!v52)
  {
    int v44 = v81;
    goto LABEL_34;
  }
  if (is_virtual_machine())
  {
    createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 310, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Certificate type (%@) is not supported on virtual machines.", v56, v57, (uint64_t)v29);
LABEL_51:
    id v26 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v27 = 0;
    uint64_t v28 = 0;
LABEL_12:
    id v31 = 0;
    if (!a6) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v61 = 3;
  int v44 = v81;
  int v58 = v83;
LABEL_40:
  id v89 = v85;
  uint64_t v28 = copyRootCertificate(v61, v58, &v89, v53, v54, v55, v56, v57);
  id v62 = v89;

  if (!v28)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 325, @"com.apple.MobileActivation.ErrorDomain", -1, v62, @"Failed to load BAA root CA certificate.", v63, v64, v79);
    id v26 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v27 = 0;
    goto LABEL_12;
  }
  id v88 = v62;
  uint64_t v27 = lockcrypto_cert_from_pem_data(v28, &v88);
  id v86 = v88;

  if (!v27)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 331, @"com.apple.MobileActivation.ErrorDomain", -1, v86, @"Failed to create certificate from pem data.", v65, v66, v79);
    id v26 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  id v87 = v86;
  char v84 = evaluateBAATrustWithCerts(a2, a3, v27, v44, 1, 0, &v87);
  id v26 = v87;

  if (v84)
  {
    id v31 = [MEMORY[0x1E4F1C9C8] date];
    [v31 timeIntervalSinceReferenceDate];
    if (SecCertificateIsValid())
    {
      [v31 timeIntervalSinceReferenceDate];
      if (SecCertificateIsValid())
      {
        SecCertificateNotValidAfter();
        double v72 = v71;
        SecCertificateNotValidBefore();
        double v74 = v73;
        [v31 timeIntervalSinceReferenceDate];
        double v76 = v75;
        SecCertificateNotValidBefore();
        if (v82) {
          BOOL *v82 = v76 - v77 >= (v72 - v74) * 0.9;
        }
        uint64_t v32 = 1;
        goto LABEL_15;
      }
    }
    uint64_t v78 = createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 355, @"com.apple.MobileActivation.ErrorDomain", -1, v26, @"BAA certificate is expired.", v69, v70, v79);
  }
  else
  {
    uint64_t v78 = createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 338, @"com.apple.MobileActivation.ErrorDomain", -1, v26, @"Failed to verify BAA certificate.", v67, v68, v79);

    id v31 = 0;
  }
  id v26 = (id)v78;
  if (a6) {
LABEL_13:
  }
    *a6 = v26;
LABEL_14:
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  if (v27)
  {
LABEL_15:
    CFRelease(v27);
    uint64_t v33 = v32;
  }

  return v33;
}

uint64_t createXMLRequest(void *a1, void *a2, void *a3)
{
  id v7 = a1;
  if (!v7)
  {
    createMobileActivationError((uint64_t)"createXMLRequest", 57, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.", v5, v6, v23);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = 0;
    if (!a3)
    {
LABEL_12:
      uint64_t v17 = 0;
      id v13 = 0;
      goto LABEL_13;
    }
LABEL_8:
    id v11 = v11;
    uint64_t v17 = 0;
    id v13 = 0;
    *a3 = v11;
    goto LABEL_13;
  }
  id v24 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:100 options:0 error:&v24];
  id v11 = v24;
  if (!v8)
  {
    uint64_t v18 = @"Failed to convert dictionary to data";
    uint64_t v19 = 67;
    id v20 = v11;
    goto LABEL_11;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E88]);
  if (!v12)
  {
    uint64_t v18 = @"Failed to allocate request.";
    uint64_t v19 = 74;
    id v20 = 0;
LABEL_11:
    uint64_t v21 = createMobileActivationError((uint64_t)"createXMLRequest", v19, @"com.apple.MobileActivation.ErrorDomain", -1, v20, v18, v9, v10, v23);

    id v11 = (id)v21;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  id v13 = v12;
  [v12 setCachePolicy:0];
  LODWORD(v14) = NETWORK_TIMEOUT_SECONDS;
  [v13 setTimeoutInterval:(double)v14];
  [v13 setHTTPMethod:@"POST"];
  uint64_t v15 = [NSString stringWithFormat:@"application/xml"];
  [v13 setValue:v15 forHTTPHeaderField:@"Content-Type"];

  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v8, "length"));
  [v13 setValue:v16 forHTTPHeaderField:@"Content-Length"];

  [v13 setHTTPBody:v8];
  if (a2)
  {
    id v13 = v13;
    *a2 = v13;
  }
  uint64_t v17 = 1;
LABEL_13:

  return v17;
}

uint64_t security_committed_uik_is_legacy(void *a1)
{
  [@"systemgroup.com.apple.mobileactivationd" UTF8String];
  uint64_t v4 = (void *)container_system_group_path_for_identifier();
  if (v4)
  {
    uint64_t v5 = [NSString stringWithUTF8String:v4];
    uint64_t v6 = [v5 stringByAppendingPathComponent:@"Library/uik/uik.pem"];

    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = [v7 fileExistsAtPath:v6];

    uint64_t v9 = 0;
    if (!a1) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v9 = createMobileActivationError((uint64_t)"security_committed_uik_is_legacy", 142, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to query group container path: %d", v2, v3, 1);
    uint64_t v8 = 0;
    if (!a1) {
      goto LABEL_7;
    }
  }
  if ((v8 & 1) == 0) {
    *a1 = v9;
  }
LABEL_7:
  if (v4) {
    free(v4);
  }

  return v8;
}

__SecKey *security_copy_system_key(uint64_t a1, const __CFData **a2, void *a3)
{
  uint64_t v6 = 0;
  v66[4] = *MEMORY[0x1E4F143B8];
  CFErrorRef v61 = 0;
  if (a1 != 2) {
    goto LABEL_12;
  }
  id v60 = 0;
  int is_legacy = security_committed_uik_is_legacy(&v60);
  id v8 = v60;
  uint64_t v6 = v8;
  if ((is_legacy & 1) == 0 && v8)
  {
    id v11 = createMobileActivationError((uint64_t)"security_copy_system_key", 180, @"com.apple.MobileActivation.ErrorDomain", -1, v8, @"Failed to query legacy UIK support.", v9, v10, v56);
    id v12 = 0;
LABEL_19:
    uint64_t v43 = 0;
    goto LABEL_23;
  }
  if (!is_legacy)
  {
LABEL_12:
    id v12 = (__SecKey *)SecKeyCopySystemKey();
    if (!v12)
    {
      id v11 = createMobileActivationError((uint64_t)"security_copy_system_key", 195, @"com.apple.MobileActivation.ErrorDomain", -1, v61, @"Failed to copy system key (%d).", v38, v39, a1);
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  uint64_t v63 = 1;
  CFErrorRef error = 0;
  [@"systemgroup.com.apple.mobileactivationd" UTF8String];
  uint64_t v15 = (void *)container_system_group_path_for_identifier();
  if (!v15)
  {
    createMobileActivationError((uint64_t)"copy_legacy_committed_uik", 44, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to query group container path: %d", v13, v14, v63);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v33 = 0;
    uint64_t v23 = 0;
    uint64_t v17 = 0;
LABEL_34:
    SecKeyRef v37 = 0;
    id v12 = 0;
    goto LABEL_40;
  }
  uint64_t v16 = [NSString stringWithUTF8String:v15];
  uint64_t v17 = [v16 stringByAppendingPathComponent:@"Library/uik/uik.pem"];

  uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v19 = [v18 fileExistsAtPath:v17];

  if ((v19 & 1) == 0)
  {
    createMobileActivationError((uint64_t)"copy_legacy_committed_uik", 50, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Legacy UIK does not exist.", v20, v21, v56);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v33 = 0;
    uint64_t v23 = 0;
    goto LABEL_34;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v62 = 0;
  uint64_t v23 = (void *)[v22 initWithContentsOfFile:v17 options:0 error:&v62];
  id v26 = v62;
  if (v23)
  {
    SecAccessControlRef v27 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E4F3B598], 0x40000000uLL, &error);
    if (v27)
    {
      uint64_t v30 = *MEMORY[0x1E4F3B890];
      v65[0] = *MEMORY[0x1E4F3B6B0];
      v65[1] = v30;
      uint64_t v31 = *MEMORY[0x1E4F3B898];
      v66[0] = MEMORY[0x1E4F1CC28];
      v66[1] = v31;
      uint64_t v32 = *MEMORY[0x1E4F3B548];
      v65[2] = *MEMORY[0x1E4F3B8B0];
      v65[3] = v32;
      v66[2] = v23;
      v66[3] = v27;
      SecAccessControlRef cf = v27;
      CFDictionaryRef v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:4];
      SecKeyRef v34 = SecKeyCreateWithData((CFDataRef)[MEMORY[0x1E4F1C9B8] data], v33, &error);
      SecKeyRef v37 = v34;
      if (v34)
      {
        id v12 = (__SecKey *)CFRetain(v34);
      }
      else
      {
        uint64_t v57 = createMobileActivationError((uint64_t)"copy_legacy_committed_uik", 74, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to query UIK.", v35, v36, v56);

        id v12 = 0;
        id v26 = (id)v57;
      }
      CFRelease(cf);
      goto LABEL_40;
    }
    createMobileActivationError((uint64_t)"copy_legacy_committed_uik", 62, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to create access control.", v28, v29, v56);
  }
  else
  {
    createMobileActivationError((uint64_t)"copy_legacy_committed_uik", 56, @"com.apple.MobileActivation.ErrorDomain", -1, v26, @"Failed to load %@.", v24, v25, (uint64_t)v17);
  }
  CFTypeRef cfa = (CFTypeRef)objc_claimAutoreleasedReturnValue();

  CFDictionaryRef v33 = 0;
  SecKeyRef v37 = 0;
  id v12 = 0;
  id v26 = (id)cfa;
LABEL_40:
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  if (v37) {
    CFRelease(v37);
  }
  if (v15) {
    free(v15);
  }
  id v52 = v6;
  if (!v12) {
    id v52 = v26;
  }

  id v53 = v52;
  if (!v12)
  {
    id v11 = createMobileActivationError((uint64_t)"security_copy_system_key", 189, @"com.apple.MobileActivation.ErrorDomain", -1, v53, @"Failed to copy system key (legacy).", v54, v55, v56);
    uint64_t v43 = 0;
    uint64_t v6 = v53;
    goto LABEL_23;
  }
  uint64_t v6 = v53;
LABEL_13:
  id v40 = SecKeyCopyPublicKey(v12);
  uint64_t v43 = v40;
  if (v40)
  {
    CFDataRef v44 = SecKeyCopyExternalRepresentation(v40, &v61);
    if (v44)
    {
      CFDataRef v45 = v44;
      if (a2)
      {
        CFDataRef v45 = v44;
        *a2 = v45;
      }
      id v11 = v6;
      goto LABEL_28;
    }
    CFErrorRef v48 = v61;
    uint64_t v46 = @"Failed to copy public key buffer.";
    uint64_t v47 = 208;
  }
  else
  {
    uint64_t v46 = @"Failed to copy public key.";
    uint64_t v47 = 202;
    CFErrorRef v48 = 0;
  }
  id v11 = createMobileActivationError((uint64_t)"security_copy_system_key", v47, @"com.apple.MobileActivation.ErrorDomain", -1, v48, v46, v41, v42, v56);
LABEL_23:

  if (a3) {
    *a3 = v11;
  }
  if (v12) {
    CFRelease(v12);
  }
  CFDataRef v45 = 0;
  id v12 = 0;
  CFDataRef v49 = 0;
  uint64_t v50 = 0;
  if (v43)
  {
LABEL_28:
    CFRelease(v43);
    CFDataRef v49 = v45;
    uint64_t v50 = v12;
  }
  if (v61) {
    CFRelease(v61);
  }
  CFErrorRef v61 = 0;

  return v50;
}

id security_create_system_key_attestation(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  CFTypeRef cf = 0;
  if (!a1)
  {
    createMobileActivationError((uint64_t)"security_create_system_key_attestation", 242, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid input(s)", v7, v8, (uint64_t)v23);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = 0;
    if (!a4)
    {
LABEL_16:
      id v19 = 0;
      uint64_t v21 = 0;
      if (!v10) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_15:
    *a4 = v13;
    goto LABEL_16;
  }
  id v23 = 0;
  uint64_t v10 = security_copy_system_key(a2, 0, &v23);
  id v13 = v23;
  if (!v10)
  {
    uint64_t v14 = @"Failed to copy attestation key.";
    uint64_t v15 = 248;
    uint64_t v16 = -1;
    uint64_t v17 = v13;
    goto LABEL_14;
  }
  if (v9)
  {
    if ((unint64_t)[v9 length] >= 0x21)
    {
      uint64_t v14 = @"Nonce is too big (> 32 bytes).";
      uint64_t v15 = 254;
      uint64_t v16 = -2;
      uint64_t v17 = 0;
      goto LABEL_14;
    }
    if (!SecKeySetParameter())
    {
      uint64_t v17 = (void *)cf;
      uint64_t v14 = @"Failed to set nonce.";
      uint64_t v15 = 259;
      uint64_t v16 = -1;
LABEL_14:
      uint64_t v20 = createMobileActivationError((uint64_t)"security_create_system_key_attestation", v15, @"com.apple.MobileActivation.ErrorDomain", v16, v17, v14, v11, v12, (uint64_t)v23);

      id v13 = (id)v20;
      if (!a4) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  Attestation = (void *)SecKeyCreateAttestation();
  if (!Attestation)
  {
    uint64_t v17 = (void *)cf;
    uint64_t v14 = @"Failed to create attestation.";
    uint64_t v15 = 266;
    uint64_t v16 = -11;
    goto LABEL_14;
  }
  id v19 = Attestation;
LABEL_17:
  CFRelease(v10);
  uint64_t v21 = v19;
LABEL_18:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0;

  return v21;
}

id security_create_attestation(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a2)
  {
    Attestation = (void *)SecKeyCreateAttestation();
    if (Attestation)
    {
      id v10 = Attestation;
      id v11 = 0;
      goto LABEL_10;
    }
    uint64_t v12 = @"Failed to create attestation.";
    uint64_t v13 = 299;
    uint64_t v14 = -11;
  }
  else
  {
    uint64_t v12 = @"Invalid input(s)";
    uint64_t v13 = 293;
    uint64_t v14 = -1;
  }
  uint64_t v15 = createMobileActivationError((uint64_t)"security_create_attestation", v13, @"com.apple.MobileActivation.ErrorDomain", v14, 0, v12, a7, a8, v17);
  id v11 = v15;
  if (a3)
  {
    id v11 = v15;
    id v10 = 0;
    *a3 = v11;
  }
  else
  {
    id v10 = 0;
  }
LABEL_10:

  return v10;
}

id security_create_external_representation(__SecKey *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    a2 = createMobileActivationError((uint64_t)"security_create_external_representation", 328, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.", a7, a8, v23);
    CFDictionaryRef v13 = 0;
    if (a3)
    {
LABEL_11:
      a2 = a2;
      id v18 = 0;
      *a3 = a2;
      goto LABEL_12;
    }
LABEL_7:
    id v18 = 0;
    goto LABEL_12;
  }
  CFDictionaryRef v10 = SecKeyCopyAttributes(a1);
  CFDictionaryRef v13 = v10;
  if (!v10)
  {
    uint64_t v20 = @"Failed to copy RK attributes.";
    uint64_t v21 = 334;
    goto LABEL_10;
  }
  uint64_t v14 = [(__CFDictionary *)v10 objectForKeyedSubscript:*MEMORY[0x1E4F3B8B0]];
  if (!v14)
  {
    uint64_t v20 = @"Failed to encode RK as data.";
    uint64_t v21 = 340;
LABEL_10:
    a2 = createMobileActivationError((uint64_t)"security_create_external_representation", v21, @"com.apple.MobileActivation.ErrorDomain", -1, 0, v20, v11, v12, v23);
    if (a3) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  uint64_t v15 = (void *)v14;
  uint64_t v16 = *MEMORY[0x1E4F3BD20];
  uint64_t v17 = [(__CFDictionary *)v13 objectForKeyedSubscript:*MEMORY[0x1E4F3BD20]];

  id v18 = v15;
  if (a2)
  {
    uint64_t v24 = v16;
    id v19 = [NSNumber numberWithBool:v17 != 0];
    v25[0] = v19;
    *a2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

    a2 = 0;
  }
LABEL_12:

  return v18;
}

uint64_t security_valid_security_enclave_reference_key(SecKeyRef key, int a2, char *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  Duplicate = key;
  v87[5] = *MEMORY[0x1E4F143B8];
  CFErrorRef error = 0;
  if (!key)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 394, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid input.", a7, a8, v77);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v45 = 0;
    uint64_t v82 = 0;
    SecKeyRef v43 = 0;
LABEL_23:
    uint64_t v16 = 0;
    CFDictionaryRef v80 = 0;
    int v81 = 0;
    int v83 = 0;
    goto LABEL_35;
  }
  CFDictionaryRef v12 = SecKeyCopyAttributes(key);
  if (!v12)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 400, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to query attributes.", v13, v14, v77);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v45 = 0;
    uint64_t v82 = 0;
    SecKeyRef v43 = 0;
    Duplicate = 0;
    goto LABEL_23;
  }
  uint64_t v15 = *MEMORY[0x1E4F3B890];
  CFDictionaryRef theDict = v12;
  uint64_t v16 = CFDictionaryGetValue(v12, (const void *)*MEMORY[0x1E4F3B890]);
  uint64_t v17 = isNSString(v16);

  if (!v17)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 406, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to query attribute '%@'.", v18, v19, v15);
LABEL_27:
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    int v81 = 0;
    uint64_t v82 = 0;
LABEL_32:
    SecKeyRef v43 = 0;
    Duplicate = 0;
    int v83 = 0;
    goto LABEL_33;
  }
  if (([v16 isEqualToString:*MEMORY[0x1E4F3B8A8]] & 1) == 0
    && ([v16 isEqualToString:*MEMORY[0x1E4F3B898]] & 1) == 0)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 412, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid key type (actual, expected): (%@, %@)", v20, v21, (uint64_t)v16);
    goto LABEL_27;
  }
  uint64_t v22 = *MEMORY[0x1E4F3B708];
  uint64_t v23 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F3B708]);
  uint64_t v24 = isNSNumber(v23);

  int v81 = v23;
  if (!v24)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 418, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to query attribute '%@'.", v25, v26, v22);
LABEL_31:
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v82 = 0;
    goto LABEL_32;
  }
  if ([v23 unsignedIntValue] != 256
    && [v23 unsignedIntValue] != 384)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 423, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Unsupported key size: %@", v27, v28, (uint64_t)v23);
    goto LABEL_31;
  }
  uint64_t v78 = a3;
  uint64_t v29 = *MEMORY[0x1E4F3B718];
  uint64_t v30 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F3B718]);
  uint64_t v31 = isNSString(v30);

  int v83 = v30;
  if (!v31)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 429, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to query attribute '%@'.", v32, v33, v29);
LABEL_29:
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v82 = 0;
    SecKeyRef v43 = 0;
    Duplicate = 0;
LABEL_33:
    CFDictionaryRef v80 = 0;
LABEL_34:
    CFDictionaryRef v45 = theDict;
    goto LABEL_35;
  }
  uint64_t v34 = *MEMORY[0x1E4F3B740];
  if (([v30 isEqualToString:*MEMORY[0x1E4F3B740]] & 1) == 0
    && ([v30 isEqualToString:*MEMORY[0x1E4F3B748]] & 1) == 0
    && ([v30 isEqualToString:*MEMORY[0x1E4F3B778]] & 1) == 0
    && ([v30 isEqualToString:*MEMORY[0x1E4F3B770]] & 1) == 0)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 441, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Unsupported key type: %@", v35, v36, (uint64_t)v30);
    goto LABEL_29;
  }
  if (!a2)
  {
    uint64_t v42 = 0;
    SecKeyRef v43 = 0;
    uint64_t v41 = 0;
    goto LABEL_49;
  }
  Duplicate = (__SecKey *)SecKeyCreateDuplicate();
  if (!Duplicate)
  {
    uint64_t v56 = @"Failed to create duplicate RK.";
    uint64_t v57 = 448;
    uint64_t v58 = -1;
    CFErrorRef v59 = 0;
LABEL_61:
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", v57, @"com.apple.MobileActivation.ErrorDomain", v58, v59, v56, v37, v38, v77);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v82 = 0;
LABEL_62:
    SecKeyRef v43 = 0;
    goto LABEL_33;
  }
  if (!SecKeySetParameter())
  {
    CFErrorRef v59 = error;
    uint64_t v56 = @"Failed to set RK parameter.";
    uint64_t v57 = 456;
LABEL_60:
    uint64_t v58 = -1;
    goto LABEL_61;
  }
  if (([v30 isEqualToString:v34] & 1) != 0
    || [v30 isEqualToString:*MEMORY[0x1E4F3B748]])
  {
    CFDataRef v39 = SecKeyCreateSignature(Duplicate, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA70], (CFDataRef)[MEMORY[0x1E4F1C9B8] data], &error);
    if (v39)
    {
      CFDataRef v40 = v39;
      uint64_t v41 = Duplicate;
      uint64_t v42 = 0;
      SecKeyRef v43 = 0;
LABEL_50:
      uint64_t v50 = 0;
      CFDictionaryRef v80 = 0;
      id v44 = 0;
      CFDictionaryRef v45 = theDict;
LABEL_51:
      uint64_t v82 = v42;
      if (v78)
      {
        uint64_t v46 = v16;
        if ([v83 isEqualToString:*MEMORY[0x1E4F3B778]]) {
          char v55 = 1;
        }
        else {
          char v55 = [v83 isEqualToString:*MEMORY[0x1E4F3B770]];
        }
        CFDictionaryRef v45 = theDict;
        *uint64_t v78 = v55;
      }
      else
      {
        uint64_t v46 = v16;
      }
      uint64_t v49 = 1;
LABEL_38:
      CFRelease(v45);
      uint64_t v51 = v49;
      CFDataRef v52 = v40;
      id v53 = (void *)v50;
      goto LABEL_39;
    }
    if (mobileactivationErrorHasDomainAndErrorCode(error, (void *)*MEMORY[0x1E4F25268], -3))
    {
      CFErrorRef v59 = error;
      uint64_t v56 = @"Failed to create test signature.";
      uint64_t v57 = 464;
      uint64_t v58 = -2;
      goto LABEL_61;
    }
    uint64_t v41 = Duplicate;
    uint64_t v42 = 0;
    SecKeyRef v43 = 0;
LABEL_49:
    CFDataRef v40 = 0;
    goto LABEL_50;
  }
  uint64_t v60 = SecAccessControlCreate();
  if (!v60)
  {
    CFErrorRef v59 = error;
    uint64_t v56 = @"Failed to create access control.";
    uint64_t v57 = 470;
    goto LABEL_60;
  }
  uint64_t v61 = *MEMORY[0x1E4F3B5A0];
  uint64_t v62 = v60;
  uint64_t v82 = (const void *)v60;
  if ((SecAccessControlSetProtection() & 1) == 0)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 475, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to set ACL protection to %@.", v63, v64, v61);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_62;
  }
  v86[0] = *MEMORY[0x1E4F3B6B0];
  v86[1] = v15;
  uint64_t v65 = *MEMORY[0x1E4F3B898];
  v87[0] = MEMORY[0x1E4F1CC28];
  v87[1] = v65;
  uint64_t v66 = *MEMORY[0x1E4F3B548];
  v86[2] = v29;
  v86[3] = v66;
  v87[2] = v34;
  v87[3] = v62;
  v86[4] = v22;
  v87[4] = &unk_1F38E5250;
  CFDictionaryRef v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:5];
  SecKeyRef v68 = SecKeyCreateRandomKey(v67, &error);
  SecKeyRef v43 = v68;
  CFDictionaryRef v80 = v67;
  if (!v68)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 488, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to create reference key.", v72, v73, v77);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  id v84 = 0;
  uint64_t v41 = Duplicate;
  uint64_t v50 = security_create_attestation((uint64_t)v68, (uint64_t)Duplicate, &v84, v69, v70, v71, v72, v73);
  id v44 = v84;
  if (v50)
  {
    CFDataRef v40 = 0;
    CFDictionaryRef v45 = theDict;
    uint64_t v42 = v82;
    goto LABEL_51;
  }
  uint64_t v76 = createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 494, @"com.apple.MobileActivation.ErrorDomain", -11, v44, @"Failed to create test attestation.", v74, v75, v77);

  id v44 = (id)v76;
  CFDictionaryRef v45 = theDict;
  Duplicate = v41;
LABEL_35:
  uint64_t v41 = Duplicate;
  uint64_t v46 = v16;
  if (a4)
  {
    CFDictionaryRef v47 = v45;
    id v48 = v44;
    CFDictionaryRef v45 = v47;
    *a4 = v48;
  }
  uint64_t v49 = 0;
  CFDataRef v40 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  CFDataRef v52 = 0;
  id v53 = 0;
  if (v45) {
    goto LABEL_38;
  }
LABEL_39:
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  if (v82) {
    CFRelease(v82);
  }
  if (v43) {
    CFRelease(v43);
  }
  if (v41) {
    CFRelease(v41);
  }

  return v51;
}

uint64_t security_certificate_matches_key(__SecKey *a1, void *a2, __SecCertificate *a3, void *a4)
{
  id v9 = a2;
  CFErrorRef error = 0;
  if (!a1 || !a3)
  {
    uint64_t v15 = createMobileActivationError((uint64_t)"security_certificate_matches_key", 533, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).", v7, v8, v31);
    CFDataRef v14 = 0;
    uint64_t v16 = 0;
    uint64_t v13 = 0;
    goto LABEL_20;
  }
  CFDictionaryRef v10 = SecKeyCopyPublicKey(a1);
  uint64_t v13 = v10;
  if (!v10)
  {
    uint64_t v15 = createMobileActivationError((uint64_t)"security_certificate_matches_key", 539, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy RK public key.", v11, v12, v31);
    CFDataRef v14 = 0;
LABEL_19:
    uint64_t v16 = 0;
LABEL_20:
    CFDataRef v24 = 0;
    if (!a4) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v9)
  {
    CFDataRef v14 = (CFDataRef)v9;
    goto LABEL_9;
  }
  CFDataRef v14 = SecKeyCopyExternalRepresentation(v10, &error);
  if (!v14)
  {
    uint64_t v15 = createMobileActivationError((uint64_t)"security_certificate_matches_key", 548, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to copy RK public key buffer.", v17, v18, v31);
    goto LABEL_19;
  }
LABEL_9:
  uint64_t v19 = SecCertificateCopyKey(a3);
  uint64_t v16 = v19;
  if (!v19)
  {
    uint64_t v15 = createMobileActivationError((uint64_t)"security_certificate_matches_key", 557, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve certificate public key.", v20, v21, v31);
    goto LABEL_20;
  }
  CFDataRef v24 = SecKeyCopyExternalRepresentation(v19, &error);
  if (!v24)
  {
    CFErrorRef v26 = error;
    uint64_t v27 = @"Failed to encode certificate public key as data.";
    uint64_t v28 = 563;
    goto LABEL_16;
  }
  if (([(__CFData *)v14 isEqualToData:v24] & 1) == 0)
  {
    uint64_t v27 = @"Certificate public key does not match RK public key.";
    uint64_t v28 = 570;
    CFErrorRef v26 = 0;
LABEL_16:
    uint64_t v15 = createMobileActivationError((uint64_t)"security_certificate_matches_key", v28, @"com.apple.MobileActivation.ErrorDomain", -1, v26, v27, v22, v23, v31);
    if (!a4)
    {
LABEL_22:
      uint64_t v25 = 0;
      uint64_t v29 = 0;
      if (!v13) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_21:
    *a4 = v15;
    goto LABEL_22;
  }
  uint64_t v15 = 0;
  uint64_t v25 = 1;
LABEL_23:
  CFRelease(v13);
  uint64_t v29 = v25;
LABEL_24:
  if (v16) {
    CFRelease(v16);
  }
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;

  return v29;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  uint64_t v5 = &v4[v3];
  uint64_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    uint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      CFDataRef v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            Class result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          Class result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  Class result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    uint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unint64_t v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  memset(v8, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  unint64_t v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!result)
  {
    uint64_t result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if (result)
    {
      uint64_t result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if (result)
      {
        uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if (result)
        {
          uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if (result)
          {
            uint64_t result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if (result) {
              return result;
            }
            uint64_t v3 = 0x1000000000;
          }
          else
          {
            uint64_t v3 = 0x800000000;
          }
        }
        else
        {
          uint64_t v3 = 0x400000000;
        }
      }
      else
      {
        uint64_t v3 = 8;
      }
    }
    else
    {
      uint64_t v3 = 3840;
    }
    *(void *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6)) {
      goto LABEL_3;
    }
    time_t v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      time_t v3 = timegm(&v4);
      double result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(void *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6)) {
          *(void *)(a1 + 240) |= 0x1000000000uLL;
        }
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (*(unsigned char *)(result + 16))
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!result
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !result)
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !result))
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  uint64_t v4 = *(void *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!result)
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(unsigned char *)(v3 + 17)) {
      double result = X509PolicySetFlagsForTestAnchor((void *)v3, a2);
    }
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0) {
    goto LABEL_15;
  }
  double result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if (result) {
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(void *)(a2 + 240) = v5;
LABEL_15:
  if (*(unsigned char *)(v3 + 16))
  {
    if (*(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!result
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !result)
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !result))
      {
        *(void *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(unsigned char *)(v3 + 16) && *(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!result) {
        *(void *)(a2 + 240) |= 0x6400000uLL;
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForTestAnchor(void *a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  uint64_t result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!result)
  {
    uint64_t result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!result)
    {
      uint64_t result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!result) {
        *(void *)(a2 + 240) |= a1[1];
      }
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t result = 0;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v23 = 0;
  if (a1)
  {
    if (a2)
    {
      unint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            unint64_t result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!result
              || (unint64_t result = validateOIDs((uint64_t)&rsaAlgs, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), result))
            {
              unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v10 = a5[9];
              uint64_t v9 = a5[10];
              if (__CFADD__(v10, v9)) {
                goto LABEL_31;
              }
              if (v10 > v10 + v9) {
                goto LABEL_32;
              }
              unint64_t v21 = a5[9];
              unint64_t v22 = v10 + v9;
              if (!v9 || (unint64_t result = ccder_blob_check_null(), result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    unint64_t result = ccder_decode_rsa_pub_n();
                    if (!result) {
                      return result;
                    }
                    unint64_t v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    unint64_t v12 = result << 6;
                    if (result << 6 < 0x400) {
                      return 0;
                    }
                    unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
                    __int16 v26 = -21846;
                    char v24 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      unint64_t v13 = a5[4];
                      LOBYTE(v25) = v13;
                      if ((unint64_t)&v24 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          uint64_t v14 = __memcpy_chk();
                          if (v12 > 0x1068) {
                            return 0;
                          }
                          unint64_t result = MEMORY[0x1F4188790](v14);
                          unint64_t v16 = (unint64_t *)((char *)&v20 - v15);
                          unint64_t v17 = 0;
                          *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
                          *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            unint64_t v19 = &v16[v17 / 8];
                            *(_OWORD *)unint64_t v19 = v18;
                            *((_OWORD *)v19 + 1) = v18;
                            v17 += 32;
                          }
                          while (v15 != v17);
                          if (v15 >= 1)
                          {
                            unint64_t *v16 = v11;
                            if (ccrsa_import_pub()) {
                              return 0;
                            }
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs()) {
                              return v23 != 0;
                            }
                            unint64_t result = 0;
                            char v23 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL validateOIDs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0;
  BOOL v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3)) {
      break;
    }
    BOOL v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0 = ccec_x963_import_pub_size();
  int is_supported = ccec_keysize_is_supported();
  unint64_t v2 = &CTOidSECP256r1;
  uint64_t v3 = &CTOidSECP521r1;
  uint64_t v4 = &CTOidSECP384r1;
  if (v0 != 384) {
    uint64_t v4 = 0;
  }
  if (v0 != 521) {
    uint64_t v3 = v4;
  }
  if (v0 != 256) {
    unint64_t v2 = v3;
  }
  if (is_supported) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  HIBYTE(v17) = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (uint64_t result = validateOIDs((uint64_t)&ecAlgs, a5 + 24, a5 + 56), result))
            {
              uint64_t result = ccec_cp_for_oid((int **)(a5 + 72));
              if (result)
              {
                uint64_t v8 = *(void *)result;
                if (*(void *)result >> 61 || !is_mul_ok(8 * v8, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  uint64_t v9 = 24 * v8;
                  BOOL v10 = __CFADD__(v9, 16);
                  unint64_t v11 = v9 + 16;
                  if (!v10 && v11 < 0xFFFFFFFFFFFFFFF0)
                  {
                    uint64_t result = MEMORY[0x1F4188790](result);
                    uint64_t v14 = (uint64_t *)((char *)&v17 - v12);
                    unint64_t v15 = 0;
                    do
                    {
                      unint64_t v16 = &v14[v15 / 8];
                      uint64_t *v16 = 0xAAAAAAAAAAAAAAAALL;
                      v16[1] = 0xAAAAAAAAAAAAAAAALL;
                      v15 += 16;
                    }
                    while (v12 != v15);
                    if (v13 >= 0x10)
                    {
                      uint64_t *v14 = result;
                      if (v12 >= 1)
                      {
                        if (!MEMORY[0x1E01BD260]())
                        {
                          uint64_t result = ccec_x963_import_pub_size();
                          if (result == 256 && *(void *)(a5 + 96) == 64)
                          {
                            if (*(void *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite()) {
                                return HIBYTE(v17) != 0;
                              }
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify()) {
LABEL_24:
                          }
                            HIBYTE(v17) = 0;
                        }
                        return HIBYTE(v17) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ccec_cp_for_oid(int **a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(void *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793) {
      JUMPOUT(0x1E01BD230);
    }
    return 0;
  }
  uint64_t v3 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497) {
    JUMPOUT(0x1E01BD240);
  }
  int v5 = *v3;
  int v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713) {
    return 0;
  }
  return MEMORY[0x1F40CAA50]();
}

unint64_t CTCopyDeviceIdentifiers(unint64_t result, uint64_t a2, uint64_t a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 327696;
  if (!result || !a2) {
    return v3;
  }
  uint64_t v11 = 0;
  v12[0] = 0;
  unint64_t v10 = 0;
  if (__CFADD__(result, a2))
  {
    __break(0x5513u);
  }
  else if (result + a2 >= result)
  {
    v9[0] = result;
    v9[1] = result + a2;
    int v5 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, v12);
    uint64_t v6 = 327697;
    if (!v5 && !HIDWORD(v12[0]))
    {
      if (CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v11))
      {
        return 327698;
      }
      else
      {
        int v7 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v10);
        uint64_t v6 = 327699;
        if (!v7)
        {
          char v8 = v10;
          if (v10 <= 0xFF)
          {
            uint64_t v6 = 0;
            if (a3)
            {
              *(_DWORD *)a3 = v12[0];
              *(void *)(a3 + _Block_object_dispose(&STACK[0x5A0], 8) = v11;
              *(unsigned char *)(a3 + 16) = (v8 & 8) != 0;
              *(unsigned char *)(a3 + 17) = (v8 & 4) != 0;
              *(unsigned char *)(a3 + 1_Block_object_dispose(&STACK[0x5A0], 8) = v8 & 3;
              *(void *)(a3 + 24) = 0;
              *(void *)(a3 + 32) = 0;
            }
          }
        }
      }
    }
    return v6;
  }
  __break(0x5519u);
  return result;
}

uint64_t CTConvertDashTerminatedHexstringTo64BitInteger(uint64_t result, void *a2)
{
  unint64_t v2 = *(unsigned __int8 **)result;
  unint64_t v3 = *(void *)(result + 8);
  if (*(void *)result > v3) {
    goto LABEL_51;
  }
  uint64_t v4 = (void *)result;
  int v5 = *(unsigned __int8 **)result;
  if (*(void *)result < v3)
  {
    unint64_t v6 = v3 - (void)v2;
    int v5 = *(unsigned __int8 **)result;
    while (*v5 != 45)
    {
      int v7 = v5 + 1;
      if ((unint64_t)(v5 + 1) > v3 || v5 > v7) {
        goto LABEL_51;
      }
      *(void *)uint64_t result = v7;
      ++v5;
      if (!--v6)
      {
        int v5 = (unsigned __int8 *)v3;
        break;
      }
    }
  }
  if ((unint64_t)v5 > v3 || v2 > v5) {
    goto LABEL_51;
  }
  uint64_t result = 327708;
  if (v5 == (unsigned __int8 *)v3) {
    return result;
  }
  char v8 = (_BYTE)v5 - (_BYTE)v2;
  if (v5 - v2 > 16) {
    return result;
  }
  if (v5 == (unsigned __int8 *)-1) {
    goto LABEL_52;
  }
  uint64_t v9 = v5 + 1;
  if ((unint64_t)(v5 + 1) > v3 || v5 > v9)
  {
LABEL_51:
    __break(0x5519u);
LABEL_52:
    __break(0x5513u);
LABEL_53:
    __break(0x5500u);
    return result;
  }
  uint64_t v10 = 0;
  *uint64_t v4 = v9;
  if (v2 >= v5 || (signed int v11 = v8 + 1 + (((v8 + 1) & 0x8000u) >> 15), v11 << 23 >> 24 < 1))
  {
LABEL_47:
    uint64_t result = 0;
    if (a2) {
      *a2 = v10;
    }
  }
  else
  {
    char v12 = 0;
    uint64_t v10 = 0;
    uint64_t v13 = v11 >> 1;
    char v14 = 8 * v13 - 8;
    while (1)
    {
      if (v8 & 1) == 0 || (v12)
      {
        unint64_t v16 = *v2;
        if (v16 > ~(unint64_t)asciiNibbleToByte) {
          goto LABEL_52;
        }
        uint64_t v17 = &asciiNibbleToByte[v16];
        BOOL v18 = v17 < (unsigned __int8 *)&CTOidAppleImg4Manifest && v17 >= asciiNibbleToByte;
        if (!v18) {
          goto LABEL_51;
        }
        if (v2 == (unsigned __int8 *)-1) {
          goto LABEL_52;
        }
        if (v2 + 1 > v5 || v2 > v2 + 1) {
          goto LABEL_51;
        }
        unsigned int v15 = *v17;
        ++v2;
      }
      else
      {
        unsigned int v15 = 0;
      }
      if (v2 >= v5) {
        return 327703;
      }
      unint64_t v19 = *v2;
      if (v19 > ~(unint64_t)asciiNibbleToByte) {
        goto LABEL_52;
      }
      uint64_t v20 = &asciiNibbleToByte[v19];
      if (&asciiNibbleToByte[v19] >= (unsigned __int8 *)&CTOidAppleImg4Manifest || v20 < asciiNibbleToByte) {
        goto LABEL_51;
      }
      unint64_t v22 = v2 + 1;
      if (v2 + 1 > v5 || v2 > v22) {
        goto LABEL_51;
      }
      if (v15 > 0xF) {
        return 327703;
      }
      unsigned int v23 = *v20;
      if (v23 > 0xF) {
        return 327703;
      }
      unint64_t v24 = (unint64_t)(v23 | (16 * v15)) << (v14 & 0xF8);
      BOOL v18 = __CFADD__(v10, v24);
      v10 += v24;
      if (v18) {
        goto LABEL_53;
      }
      if (v22 < v5)
      {
        v14 -= 8;
        char v12 = 1;
        unint64_t v2 = v22;
        if (v13-- > 1) {
          continue;
        }
      }
      goto LABEL_47;
    }
  }
  return result;
}

unint64_t CTFillBAAIdentity(int a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((a1 & 0x800000) != 0 && a4)
  {
    unint64_t result = CTCopyDeviceIdentifiers(a2, a3, a4);
    if (result) {
      return result;
    }
  }
  else if (!a4)
  {
    return 0;
  }
  unint64_t result = 0;
  if (a1 < 0 && a3)
  {
    if (a2)
    {
      *(void *)(a4 + 32) = 0;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      unint64_t result = 0;
      *(void *)(a4 + 24) = a2;
      *(void *)(a4 + 32) = a3;
      return result;
    }
    return 0;
  }
  return result;
}

unint64_t CTEvaluateBAASystemTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  unint64_t result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAASystem);
  if (!result) {
    return CTFillBAAIdentity(v9, v10, v11, a7);
  }
  return result;
}

unint64_t CTEvaluateBAAUserTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  unint64_t result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAAUser);
  if (!result) {
    return CTFillBAAIdentity(v9, v10, v11, a7);
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  if (v2 <= *(void *)(a2 + 8)) {
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 > a1[1]) {
      goto LABEL_20;
    }
    unint64_t v5 = *a1;
    unint64_t v6 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (a2)
    {
      if (v6 < v5) {
        goto LABEL_20;
      }
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (!result) {
        return result;
      }
      if (v5 != v6) {
        return 0;
      }
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(void *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_6;
  }
  if (ccder_blob_decode_tl()) {
    return 0;
  }
  if (*a1 > a1[1]) {
LABEL_6:
  }
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 - 1;
    unint64_t v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      void v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = X509CertificateParse((unint64_t *)v17, &v15);
      if (result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3) {
        __break(0x5519u);
      }
      _OWORD *v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    uint64_t result = 0;
    if (a5) {
      *a5 = v6;
    }
  }
  return result;
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, void *a10, long long *a11)
{
  v41[116] = *MEMORY[0x1E4F143B8];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_42;
  }
  uint64_t v36 = a1 + a2;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v35 = a1;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if (result) {
    return result;
  }
  if (v35 != v36) {
    return 327690;
  }
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    uint64_t v20 = v38[0];
    unint64_t v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0]) {
      unint64_t v21 = &v38[1];
    }
    uint64_t *v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7) {
      BOOL v23 = a8 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    long long v31 = *a11;
    v32[0] = *((unsigned char *)a11 + 16);
    if (v23) {
      char v25 = a3;
    }
    else {
      char v25 = 1;
    }
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(long long *)((char *)a11 + 24);
      uint64_t v27 = (_UNKNOWN **)*((void *)a11 + 5);
    }
    else
    {
      uint64_t v26 = *((void *)a11 + 4);
      *(void *)&v32[8] = v34;
      *(void *)&v32[16] = v26;
      uint64_t v27 = oidForPubKeyLength();
    }
    uint64_t v28 = *((void *)a11 + 6);
    *(void *)&v32[24] = v27;
    uint64_t v33 = v28;
    uint64_t result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!result)
    {
      uint64_t v29 = (void *)v38[0];
      if (!a5 || !a6 || !v38[0] || (uint64_t result = X509CertificateParseKey(v38[0], a5, a6), !result))
      {
        if (a10 && v29)
        {
          uint64_t v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        uint64_t result = 0;
        if (a9)
        {
          if (v29)
          {
            uint64_t result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      unint64_t v22 = (unsigned char *)v38[2];
      while (v22[265])
      {
        unint64_t v22 = (unsigned char *)*((void *)v22 + 34);
        if (!v22)
        {
          unint64_t v22 = (unsigned char *)v38[2];
          break;
        }
      }
    }
    else
    {
      unint64_t v22 = 0;
    }
  }
  else
  {
    unint64_t v22 = v39;
  }
  uint64_t result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  unint64_t v68 = 0;
  uint64_t v69 = 0;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915;
  unint64_t v66 = *a2;
  unint64_t v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x5A0], 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose(&STACK[0x5A0], 8) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 20_Block_object_dispose(&STACK[0x5A0], 8) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 28_Block_object_dispose(&STACK[0x5A0], 8) = 0u;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return v10;
  }
  uint64_t v12 = v69;
  unint64_t v13 = v66;
  unint64_t v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v67) {
    goto LABEL_186;
  }
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  unint64_t v62 = v13;
  unint64_t v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68)) {
      goto LABEL_187;
    }
    uint64_t v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v64 = v62 + v68;
      unint64_t v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl()) {
    return 720917;
  }
  unint64_t v18 = v64;
  unint64_t v17 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v19 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v64;
  *(void *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19)) {
    goto LABEL_187;
  }
  unint64_t v20 = v18 + v19;
  if (v18 > v20 || v20 > v17) {
    goto LABEL_186;
  }
  unint64_t v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152))) {
    return 720918;
  }
  if (!ccder_blob_decode_tl()) {
    return 720919;
  }
  unint64_t v22 = v64;
  unint64_t v21 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v23 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v64;
  *(void *)(a1 + 12_Block_object_dispose(&STACK[0x5A0], 8) = v23;
  if (__CFADD__(v22, v23)) {
    goto LABEL_187;
  }
  unint64_t v24 = v22 + v23;
  if (v22 > v24 || v24 > v21) {
    goto LABEL_186;
  }
  unint64_t v64 = v24;
  if (!ccder_blob_decode_tl()) {
    return 720920;
  }
  unint64_t v26 = v64;
  unint64_t v25 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v27 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v64;
  *(void *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27)) {
    goto LABEL_187;
  }
  unint64_t v28 = v26 + v27;
  if (v26 > v28 || v28 > v25) {
    goto LABEL_186;
  }
  unint64_t v64 = v28;
  if (!ccder_blob_decode_tl()) {
    return 720921;
  }
  unint64_t v29 = v64;
  unint64_t v30 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v31 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v64;
  *(void *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31)) {
    goto LABEL_187;
  }
  unint64_t v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30) {
    goto LABEL_186;
  }
  unint64_t v64 = v29 + v31;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return 720922;
  }
  unint64_t v33 = v64;
  unint64_t v34 = v68;
  unint64_t v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32) {
      goto LABEL_186;
    }
    *(void *)(a1 + 8_Block_object_dispose(&STACK[0x5A0], 8) = v32;
    *(void *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34)) {
      goto LABEL_187;
    }
    unint64_t v36 = v33 + v34;
    if (v33 > v36 || v36 > v65) {
      goto LABEL_186;
    }
    unint64_t v63 = v65;
    unint64_t v64 = v36;
    unint64_t v62 = v36;
    if (ccder_blob_decode_tl()) {
      return 720923;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl()) {
      return 720924;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl())
    {
      unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68)) {
        goto LABEL_187;
      }
      if (v62 > v62 + v68 || v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v60 = v62;
      unint64_t v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68) {
        return 720925;
      }
      unint64_t v37 = v60;
      if (__CFADD__(v60, v68)) {
LABEL_187:
      }
        __break(0x5513u);
      unint64_t v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61) {
        goto LABEL_186;
      }
      unint64_t v61 = v60 + v68;
      *(unsigned char *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3) {
        BOOL v39 = a4 == 0;
      }
      else {
        BOOL v39 = 1;
      }
      int v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        unsigned __int8 v53 = 0;
        int v41 = 0;
        do
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
          char v57 = 0;
          uint64_t v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0) {
            return 720926;
          }
          unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          if (v60 > v60 + v56 || v60 + v56 > v61) {
            goto LABEL_186;
          }
          unint64_t v54 = v60;
          unint64_t v55 = v60 + v56;
          if (!ccder_blob_decode_tl()) {
            return 720927;
          }
          if (v55 < v54 || v68 > v55 - v54) {
            goto LABEL_186;
          }
          unint64_t v58 = v54;
          unint64_t v59 = v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (!der_get_BOOLean(&v54, 1, &v57)) {
            return 720928;
          }
          if (!ccder_blob_decode_tl()) {
            return 720929;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v55 != v54 + v68) {
            return 720929;
          }
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54) {
              goto LABEL_186;
            }
            unint64_t v43 = v68;
            if (v68 > v55 - v54) {
              goto LABEL_186;
            }
            *(void *)(a1 + 24_Block_object_dispose(&STACK[0x5A0], 8) = v54;
            *(void *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 15)
            {
              uint64_t v16 = 720930;
              if ((v41 & 1) != 0 || (X509ExtensionParseKeyUsage() & 1) == 0) {
                return v16;
              }
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 19)
            {
              uint64_t v16 = 720931;
              if ((v41 & 2) != 0
                || (X509ExtensionParseBasicConstraints(&v54, (void *)(a1 + 200), (unsigned char *)(a1 + 265)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 35)
            {
              uint64_t v16 = 720932;
              if ((v41 & 4) != 0
                || (X509ExtensionParseAuthorityKeyIdentifier(&v54, (unint64_t *)(a1 + 168), (void *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 14)
            {
              uint64_t v16 = 720933;
              if ((v41 & 8) != 0
                || (X509ExtensionParseSubjectKeyIdentifier(&v54, (unint64_t *)(a1 + 184), (void *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 37)
            {
              uint64_t v16 = 720934;
              if ((v41 & 0x10) != 0
                || (X509ExtensionParseExtendedKeyUsage(&v54, (unint64_t *)(a1 + 208), (void *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 17)
            {
              uint64_t v16 = 720935;
              if ((v41 & 0x20) != 0
                || (X509ExtensionParseSubjectAltName(&v54, (unint64_t *)(a1 + 224), (void *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            uint64_t v16 = 720936;
            if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v58, (uint64_t)v70, v53)) {
              return v16;
            }
            uint64_t result = X509ExtensionParseAppleExtension((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!result) {
              return v16;
            }
            if (v53 == 0xFF) {
              goto LABEL_189;
            }
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (v57) {
            *(unsigned char *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v54 != v55) {
            return 720926;
          }
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          unint64_t v37 = v60 + v56;
          if (v60 > v60 + v56) {
            goto LABEL_186;
          }
          unint64_t v38 = v61;
          if (v37 > v61) {
            goto LABEL_186;
          }
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38) {
        return 720925;
      }
      if (v37 > v65 || v64 > v37) {
        goto LABEL_186;
      }
      unint64_t v64 = v37;
    }
    if (*(void *)(a1 + 32) < 3uLL)
    {
      uint64_t v16 = 720915;
      if (v64 != v65) {
        return v16;
      }
LABEL_170:
      if (__CFADD__(v66, v69)) {
        goto LABEL_187;
      }
      if (v66 > v66 + v69 || v66 + v69 > v67) {
        goto LABEL_186;
      }
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40))) {
        return 720937;
      }
      *(void *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v60 = 0;
      uint64_t result = ccder_blob_decode_bitstring();
      if (!result) {
        return 720938;
      }
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((void *)&v70[0] + 1) >= *(void *)&v70[0])
        {
          unint64_t v51 = (v60 + 7) >> 3;
          if (v51 <= *((void *)&v70[0] + 1) - *(void *)&v70[0])
          {
            *(void *)(a1 + 56) = *(void *)&v70[0];
            *(void *)(a1 + 64) = v51;
            unint64_t v52 = v67;
            if (v66 <= v67)
            {
              uint64_t v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(void *a1, int a2, unsigned char *a3)
{
  if (*a1 > a1[1]) {
    __break(0x5519u);
  }
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2) {
    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

uint64_t X509ExtensionParseKeyUsage()
{
  uint64_t result = ccder_blob_decode_bitstring();
  if (result) {
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    uint64_t result = der_get_BOOLean(a1, 1, a3);
    if (result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3) {
          return 0;
        }
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_15;
    }
    if (v7 - 0x5555555555555556 != a1[1]) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_16;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_16;
      }
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      unint64_t v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, void *a3)
{
  int v6 = ccder_blob_decode_tl();
  uint64_t result = 0;
  if (v6)
  {
    if (*a1 > a1[1]) {
      goto LABEL_11;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_11;
    }
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1]) {
LABEL_11:
    }
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result == 1)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16 * a3);
      void *v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a6) {
    a5 = 0;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_275;
    }
LABEL_159:
    int v44 = 0;
LABEL_160:
    if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 27)
    {
      return X509ExtensionParseServerAuthMarker(result, a2, a3, a4, a5);
    }
    if (v44)
    {
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x400000;
        goto LABEL_275;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 37748736;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4354)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 0x8004000000;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
      {
        return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
      {
        unint64_t v52 = *(void *)result;
        unint64_t v51 = *(void *)(result + 8);
        if (a5)
        {
          if (v52 > v51) {
            goto LABEL_281;
          }
          *a5 = v52;
          a5[1] = v51 - v52;
        }
        *a4 |= 0x80000000uLL;
LABEL_243:
        if (v52 <= v51)
        {
          *(void *)uint64_t result = v51;
          return 1;
        }
LABEL_281:
        __break(0x5519u);
        return result;
      }
    }
LABEL_242:
    unint64_t v52 = *(void *)result;
    unint64_t v51 = *(void *)(result + 8);
    goto LABEL_243;
  }
  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0;
LABEL_205:
      uint64_t v24 = v54 | v55;
LABEL_275:
      *a4 = v24;
      return 1;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_209;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_209:
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
    {
      return X509ExtensionParseMFISWAuth((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
    {
      return X509ExtensionParseGenericSSLMarker();
    }
    int v44 = 1;
    goto LABEL_160;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_242;
    }
    goto LABEL_159;
  }
  if (*(void *)a2 == 0xB6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    return X509ExtensionParseComponentAuth((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 49)
  {
    char v56 = 0;
    uint64_t result = der_get_BOOLean((void *)result, 0, &v56);
    if (result)
    {
      uint64_t v53 = 0x10000080002;
      if (!v56) {
        uint64_t v53 = 0x20000040001;
      }
      *a4 |= v53;
    }
    return result;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 44)
  {
    return X509ExtensionParseCertifiedChipIntermediate((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 36)
  {
    return X509ExtensionParseMFIAuthv3Leaf((unint64_t *)result);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 22)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v54 = *a4;
    uint64_t v55 = 1048584;
    goto LABEL_205;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 19)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x8000000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xA6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    *a4 |= 0x1000000uLL;
    goto LABEL_242;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 29)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x2000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 14)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x4000000;
    goto LABEL_275;
  }
  if (*(void *)a2 != 0x86463F78648862ALL || *(unsigned char *)(a2 + 8) != 3) {
    goto LABEL_242;
  }
  return X509ExtensionParseDeviceAttestationIdentity((unint64_t *)result, a4, a5);
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  if (!ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = *a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if (result) {
    return v8;
  }
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  uint64_t v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556) {
    return v8;
  }
  unint64_t v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, void *a4)
{
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (__CFADD__(*a1, v5)) {
    goto LABEL_31;
  }
  unint64_t v6 = v4 + v5;
  if (v4 > v6) {
    goto LABEL_30;
  }
  uint64_t v10 = 655361;
  unint64_t v14 = *a1;
  unint64_t v15 = v6;
  if (!ccder_blob_decode_tl()) {
    return v10;
  }
  if (!ccder_blob_decode_tl()) {
    return 655363;
  }
  if (v14 >= 0x5555555555555556) {
LABEL_31:
  }
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556 || v14 - 0x5555555555555556 > v15) {
    goto LABEL_30;
  }
  unint64_t v13 = v14 - 0x5555555555555556;
  if (!ccder_blob_decode_tl()) {
    return 655362;
  }
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
LABEL_12:
  unint64_t v11 = v14 - 0x5555555555555556;
  if (v14 > v14 - 0x5555555555555556 || v11 > v13) {
    goto LABEL_30;
  }
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }
  if (v13 > v15 || v14 > v13) {
    goto LABEL_30;
  }
  if (!ccder_blob_decode_bitstring()) {
    return 655364;
  }
  *a4 = 0;
  a4[1] = 0;
  if (v13 == v15) {
    return 0;
  }
  else {
    return 655365;
  }
}

uint64_t X509CertificateParseKey(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = 327691;
  if (a1)
  {
    if (*(void *)(a1 + 96))
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!result)
      {
        if (a2)
        {
          if (a3)
          {
            uint64_t v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v16 = 0uLL;
  long long v15 = 0uLL;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v7 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v16, (unint64_t *)&v15, &v13);
  if (v7) {
    return v7;
  }
  uint64_t v7 = 655632;
  int v9 = compare_octet_string((uint64_t)&v16, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string((uint64_t)&v16, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return 655617;
    }
  }
  unint64_t v12 = v10;
  if (((a1 & 1) == 0 || compare_octet_string_raw(a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw(a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw(a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw(a4, &CTOidSha512, 9uLL)))
  {
    return v7;
  }
  uint64_t result = v13;
  if ((v14 || !v13) && (a3[1] || !*a3))
  {
    if (v12(v13)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[2] = v6;
  void v10[3] = v6;
  v10[0] = v6;
  v10[1] = v6;
  v9[0] = v10;
  v9[1] = 64;
  v8[0] = 0;
  v8[1] = 0;
  uint64_t result = X509MatchSignatureAlgorithm(a3, a4, (uint64_t)v9, v8);
  if (!result) {
    return X509CertificateCheckSignatureDigest(a1, a2, v9, (uint64_t)v8);
  }
  return result;
}

uint64_t X509MatchSignatureAlgorithm(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_8;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(void *)(a3 + 8) < 0x20uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + _Block_object_dispose(&STACK[0x5A0], 8) = 32;
    ccsha256_di();
    goto LABEL_14;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_12;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(void *)(a3 + 8) < 0x14uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + _Block_object_dispose(&STACK[0x5A0], 8) = 20;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!result) {
    goto LABEL_10;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if (result) {
    return 656640;
  }
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(void *)(a3 + 8) >= 0x30uLL)
  {
    *(void *)(a3 + _Block_object_dispose(&STACK[0x5A0], 8) = 48;
    ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[2] = v7;
  v16[3] = v7;
  v16[0] = v7;
  v16[1] = v7;
  uint64_t v14 = v16;
  uint64_t v15 = 64;
  long long v13 = 0uLL;
  uint64_t matched = X509MatchSignatureAlgorithm(a4, a5, (uint64_t)&v14, &v13);
  if (matched) {
    return matched;
  }
  uint64_t matched = 655617;
  int v9 = compare_octet_string(a2, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string(a2, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return matched;
    }
  }
  uint64_t result = *a1;
  if ((a1[1] || !result) && (!v14 || v15))
  {
    if (v10(result)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  unint64_t v20 = v3;
  if (__CFADD__(*a1, v3)) {
    goto LABEL_59;
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }
  uint64_t v6 = 720901;
  unint64_t v18 = *a1;
  unint64_t v19 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl() || !v20) {
        return 720898;
      }
      unint64_t v2 = v18;
      if (__CFADD__(v18, v20)) {
        break;
      }
      unint64_t v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19) {
        goto LABEL_58;
      }
      unint64_t v16 = v18;
      unint64_t v17 = v18 + v20;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl()) {
          return 720899;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20 || v16 + v20 > v17) {
          goto LABEL_58;
        }
        unint64_t v15 = v16 + v20;
        if (!ccder_blob_decode_tl()) {
          return 720900;
        }
        unint64_t v2 = v16 + v20;
        if (v16 > v15) {
          goto LABEL_58;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20) {
          goto LABEL_58;
        }
        unint64_t v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(unsigned char *)(v16 + 2) == 3)
        {
          unint64_t v12 = v16 + v20;
          unint64_t v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15) {
              goto LABEL_58;
            }
            unint64_t v12 = v16 + v20;
            unint64_t v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15) {
                goto LABEL_58;
              }
              unint64_t v12 = v16 + v20;
              unint64_t v13 = v16 + v20;
              if (!ccder_blob_decode_tl()) {
                return v6;
              }
            }
          }
          if (__CFADD__(v12, v20)) {
            goto LABEL_59;
          }
          unint64_t v2 = v12 + v20;
          if (v15 != v12 + v20) {
            return 720902;
          }
          if (v13 < v12 || v20 > v13 - v12) {
            goto LABEL_58;
          }
          *a2 = v12;
          a2[1] = v20;
        }
        unint64_t v7 = v18 + v20;
        if (v2 > v17 || v16 > v2) {
          goto LABEL_58;
        }
        unint64_t v16 = v2;
      }
      if (v2 != v7) {
        return 720903;
      }
      unint64_t v4 = v19;
      if (v2 > v19 || v18 > v2) {
        goto LABEL_58;
      }
      unint64_t v18 = v2;
      if (v2 >= v19) {
        goto LABEL_46;
      }
    }
LABEL_59:
    __break(0x5513u);
  }
LABEL_46:
  if (v2 != v4) {
    return 720904;
  }
  if (a2[1] && *a2) {
    return 0;
  }
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  BOOL result = 0;
  v6[1] = *MEMORY[0x1E4F143B8];
  time_t v5 = 0;
  v6[0] = 0;
  if (a1 && a2 != -1) {
    return !X509CertificateGetNotBefore(a1, v6)
  }
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  unint64_t v4[2] = *(const char **)MEMORY[0x1E4F143B8];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  unint64_t v4[2] = *(const char **)MEMORY[0x1E4F143B8];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2 = time(0);
  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  time_t v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = 720906;
  if (!result) {
    return v1;
  }
  unint64_t v2 = *(void *)(result + 72);
  uint64_t v3 = *(void *)(result + 80);
  if (!v2 || v3 == 0) {
    return v1;
  }
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(void *)(result + 72);
      v6[1] = v5;
      if (!ccder_blob_decode_Time(v6)) {
        return 720907;
      }
      if (ccder_blob_decode_Time(v6)) {
        return 0;
      }
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509TimeConvert(const char **a1, time_t *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 720909;
  if (!a1) {
    return v2;
  }
  unint64_t v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF) {
    return v2;
  }
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  unint64_t v7 = *a1;
  if (v4 == (const char *)13)
  {
    uint64_t result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150) {
      v11.tm_year -= 100;
    }
  }
  else
  {
    uint64_t result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  int v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(void)*a1]) {
      return 720910;
    }
    time_t v10 = timegm(&v11);
    if (v10 == -1) {
      return 720911;
    }
    uint64_t v2 = 0;
    if (a2) {
      *a2 = v10;
    }
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  unint64_t v11 = v3 - *a1;
  if (ccder_blob_decode_tl()) {
    goto LABEL_5;
  }
  if (*a1 > a1[1]) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    unint64_t v8 = v12;
    unint64_t v7 = v13;
    if (v12 > v13) {
      goto LABEL_19;
    }
    *a1 = v12;
    a1[1] = v13;
    unint64_t v9 = v11;
  }
  else
  {
    unint64_t v8 = *a1;
    unint64_t v7 = a1[1];
    unint64_t v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9)) {
    goto LABEL_20;
  }
  if (v7 == v8 + v9)
  {
    if (!v9) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    unint64_t v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8) {
        goto LABEL_12;
      }
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556) {
        return 0;
      }
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556) {
        return 0;
      }
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL) {
          goto LABEL_13;
        }
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker()
{
  return 0;
}

uint64_t X509ExtensionParseServerAuthMarker(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null();
  if (result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    unint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if ((unint64_t)v12 >= v10 - 1) {
        break;
      }
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0;
      }
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_17;
    }
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_18;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
            goto LABEL_18;
          }
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        unint64_t v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          unint64_t v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *X509ExtensionParseMFI4Properties(unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  BOOL v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      uint64_t result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    unint64_t v9 = result;
    uint64_t v10 = 0;
    unint64_t v11 = a2 + 304 * a3;
    unint64_t v12 = ~a2;
    BOOL v13 = a4 + 1;
    BOOL v14 = (void *)(a2 + 272);
    uint64_t v15 = a3 - 1;
    unint64_t v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      unint64_t v16 = v14 - 34;
      if (v14 != (void *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      uint64_t result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if (result) {
        return result;
      }
      if (v10)
      {
        if ((unint64_t)v16 < a2) {
          goto LABEL_30;
        }
        if ((unint64_t)(v14 + 4) > v11) {
          goto LABEL_30;
        }
        unint64_t v17 = (void *)*v13;
        void *v14 = 0;
        v14[1] = v17;
        if (v14 != (void *)272 && (unint64_t)v16 >= v11) {
          goto LABEL_30;
        }
        void *v17 = v16;
        *BOOL v13 = (unint64_t)v14;
      }
      else
      {
        uint64_t v18 = *a4;
        *(void *)(a2 + 272) = *a4;
        if (v18) {
          unint64_t v19 = (unint64_t *)(v18 + 280);
        }
        else {
          unint64_t v19 = v13;
        }
        *unint64_t v19 = v21;
        *a4 = v16;
        *(void *)(a2 + 280) = a4;
      }
      uint64_t v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        BOOL v6 = v15 == v10++;
        if (!v6) {
          continue;
        }
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  for (uint64_t i = *a1; i; uint64_t i = *(void *)(i + 272))
  {
    if (*(void *)(i + 192) && !compare_octet_string(a2, i + 184)) {
      break;
    }
  }
  return i;
}

void *X509ChainResetChain(void *result, void *a2)
{
  *uint64_t result = 0;
  result[1] = result;
  uint64_t v2 = (void *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      uint64_t v2 = (void *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(void *a1, uint64_t *a2, void *a3, int a4)
{
  if (!a1) {
    return 327691;
  }
  unint64_t v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  uint64_t v8 = (uint64_t)(a1 + 15);
  uint64_t result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if (result)
  {
    while (1)
    {
      uint64_t v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (unint64_t v7 = (void *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        unint64_t v7 = (void *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (X509ChainGetAppleRootUsingKeyIdentifier(v10, 1)) {
            return 0;
          }
          uint64_t BAARootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v10);
          if (a4) {
            unsigned int v16 = 0;
          }
          else {
            unsigned int v16 = 524296;
          }
          if (BAARootUsingKeyIdentifier) {
            return 0;
          }
          else {
            return v16;
          }
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          unint64_t v7 = (void *)v7[34];
          if (!v7) {
            goto LABEL_16;
          }
        }
      }
      unint64_t v12 = (void *)*a3;
      if (*a3) {
        break;
      }
LABEL_13:
      BOOL v13 = (void *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *BOOL v13 = v7;
      a3[1] = v7 + 36;
      uint64_t v8 = (uint64_t)(v7 + 15);
      int v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      uint64_t result = 0;
      if (!v14) {
        return result;
      }
    }
    while (v12 != v7)
    {
      unint64_t v12 = (void *)v12[36];
      if (!v12) {
        goto LABEL_13;
      }
    }
    return 524297;
  }
  return result;
}

uint64_t X509ChainGetAppleRootUsingKeyIdentifier(uint64_t result, int a2)
{
  uint64_t v2 = &numAppleRoots;
  if (!a2) {
    uint64_t v2 = &numAppleProdRoots;
  }
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = result;
    for (uint64_t i = (uint64_t *)&AppleRoots; i < (uint64_t *)&UcrtRootSpki && i >= (uint64_t *)&AppleRoots; ++i)
    {
      uint64_t v7 = *i;
      uint64_t result = compare_octet_string(v4, *i + 184);
      if (!result) {
        return v7;
      }
      if (!--v3) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainGetBAARootUsingKeyIdentifier(uint64_t result)
{
  uint64_t v1 = numBAARoots;
  if (numBAARoots)
  {
    uint64_t v2 = result;
    for (uint64_t i = (uint64_t *)&BAARoots; i < (uint64_t *)&rsaEncryption && i >= (uint64_t *)&BAARoots; ++i)
    {
      uint64_t v5 = *i;
      uint64_t result = compare_octet_string(v2, *i + 184);
      if (!result) {
        return v5;
      }
      if (!--v1) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  BOOL v6 = a2;
  void v35[4] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *a2;
  if (a3)
  {
    uint64_t v9 = *(void *)(a3 + 48);
    if (v9)
    {
      if (*(void *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208)) {
          return 327701;
        }
        uint64_t v8 = *v6;
      }
    }
  }
  if (v8)
  {
    unint64_t v31 = v6;
    unint64_t v32 = a4;
    unint64_t v11 = 0;
    int v12 = 0;
    char v33 = 0;
    uint64_t v13 = -1;
    while (1)
    {
      unint64_t v14 = *(void *)(v8 + 288);
      unint64_t v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        char v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        char v16 = 0;
        unint64_t v15 = v8 + 304;
        unint64_t v14 = v8;
        goto LABEL_11;
      }
      if (!a3) {
        return v12 | 0x9000Du;
      }
      if (*(unsigned char *)(a3 + 16))
      {
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetAppleRootUsingKeyIdentifier(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(void *)(a3 + 24)) {
          goto LABEL_58;
        }
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v8 + 168);
      }
      unint64_t v14 = AppleRootUsingKeyIdentifier;
      v33 |= AppleRootUsingKeyIdentifier != 0;
      unint64_t v15 = AppleRootUsingKeyIdentifier + 304;
      if (AppleRootUsingKeyIdentifier) {
        goto LABEL_10;
      }
LABEL_58:
      if (!*(unsigned char *)(a3 + 19)) {
        return v12 | 0x9000Du;
      }
      unint64_t v14 = 0;
      char v16 = 1;
LABEL_11:
      if (v11 && *(void *)(v8 + 32) >= 2uLL)
      {
        if (!*(unsigned char *)(v8 + 265))
        {
          int v30 = 589825;
          return v12 | v30;
        }
        if ((*(unsigned char *)(v8 + 264) & 4) == 0)
        {
          int v30 = 589826;
          return v12 | v30;
        }
      }
      unint64_t v17 = *(void *)(v8 + 200);
      if (v17) {
        BOOL v18 = v17 >= v11;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
        int v30 = 589827;
        return v12 | v30;
      }
      if (*(unsigned char *)(v8 + 266))
      {
        int v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        int v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(void *)(v8 + 168) && *(void *)(v8 + 176))
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        if (compare_octet_string(v8 + 168, v14 + 184)) {
          return v12 | 0x9000Au;
        }
      }
      if (a3 && v11 && (*(void *)(v8 + 240) & *(void *)(a3 + 8)) == 0) {
        X509PolicySetFlagsForCommonNames(v8);
      }
      if (v14 == v8 && !*(void *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(unsigned char *)(a3 + 18) && !X509CertificateIsValid(v8)) {
            return v12 | 0x90009u;
          }
          uint64_t v19 = *(void *)(a3 + 8);
          if (!v11 && (*(void *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            uint64_t v19 = *(void *)(a3 + 8);
          }
          v13 &= *(void *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            int v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(void *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        uint64_t result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40);
        if (result) {
          return result;
        }
      }
      unint64_t v21 = v11 + 1;
      if (v11 == -1) {
        goto LABEL_99;
      }
      uint64_t v8 = *(void *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        BOOL v6 = v31;
        a4 = v32;
        LOBYTE(v_Block_object_dispose(&STACK[0x5A0], 8) = v33;
        if (a3) {
          goto LABEL_61;
        }
        goto LABEL_87;
      }
    }
  }
  unint64_t v21 = 0;
  uint64_t v13 = -1;
  if (!a3) {
    goto LABEL_87;
  }
LABEL_61:
  if (*(void *)a3)
  {
    unint64_t v22 = v21;
    if (v8)
    {
      unint64_t v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(void *)a3 != v22) {
      return (v22 << 8) | 0x90006u;
    }
  }
  uint64_t v23 = *(void *)(a3 + 24);
  if (!v23 || !*(void *)(v23 + 8))
  {
    if (!*(unsigned char *)(a3 + 16)) {
      goto LABEL_87;
    }
    int v24 = v21 << 8;
    uint64_t v25 = **(void **)(v6[1] + 8);
LABEL_75:
    uint64_t v27 = 184;
    if (v8) {
      uint64_t v27 = 168;
    }
    uint64_t v28 = X509ChainGetAppleRootUsingKeyIdentifier(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28) {
      return v24 | 0x9000Bu;
    }
    uint64_t v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40))
    {
      goto LABEL_87;
    }
    int v26 = 589836;
    return v24 | v26;
  }
  int v24 = v21 << 8;
  uint64_t v25 = **(void **)(v6[1] + 8);
  if (*(unsigned char *)(a3 + 16)) {
    goto LABEL_75;
  }
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    int v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(void *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(void *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(void *)(a3 + 32), *(void *)(a3 + 40), v25 + 16, v25 + 40))goto LABEL_72; {
  }
    }
  else if (!compare_octet_string(*(void *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(void *)(a3 + 40));
  }
LABEL_87:
  uint64_t result = 0;
  if (a4) {
    *a4 = v13;
  }
  return result;
}

void create_baa_info_cold_1()
{
  copy_current_process_name();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DD6D4000, MEMORY[0x1E4F14500], v1, "%{public}@ failed to load cryptex1 manifest (%@) (non-fatal). Client should adopt new option (kMAOptionsBAAPerformOperationsOverIPC=True), or update entitlements and/or sandbox rules.", v2, v3, v4, v5, v6);
}

void create_baa_info_cold_2()
{
  copy_current_process_name();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DD6D4000, MEMORY[0x1E4F14500], v1, "%{public}@ failed to load boot manifest (%@) (non-fatal). Client should adopt new option (kMAOptionsBAAPerformOperationsOverIPC=True), or update entitlements and/or sandbox rules.", v2, v3, v4, v5, v6);
}

void create_baa_info_cold_3()
{
  copy_current_process_name();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DD6D4000, MEMORY[0x1E4F14500], v1, "%{public}@ failed to load cryptex1 local policy (%@) (non-fatal). Client should adopt new option (kMAOptionsBAAPerformOperationsOverIPC=True), or update entitlements and/or sandbox rules.", v2, v3, v4, v5, v6);
}

void isSupportedDeviceIdentityClient_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [a1 localizedDescription];
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_fault_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

void __getLAContextClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *LocalAuthenticationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"identity_support.m", 21, @"%s", *a1);

  __break(1u);
}

void __getLAContextClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getLAContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"identity_support.m", 22, @"Unable to find class %s", "LAContext");

  __break(1u);
}

void __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_168_cold_1(void *a1, uint64_t a2)
{
  id v3 = a1;
  *(_DWORD *)a2 = 138543618;
  *(void *)(a2 + 4) = v3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = @"UniqueDeviceID";
  _os_log_fault_impl(&dword_1DD6D4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%{public}@ failed to query %@ (non-fatal). Client should adopt new entitlement (com.apple.private.MobileGestalt.AllowedProtectedKeys / UniqueDeviceID).", (uint8_t *)a2, 0x16u);
}

void libavp_send_host_message_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CFDataRef gAppleVirtualPlatformSendSubsystemMessageToHost(AppleVirtualPlatformMessageSubsystem, CFDataRef, CFErrorRef *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"vm_libavp.m", 34, @"%s", dlerror());

  __break(1u);
}

void libavp_copy_strong_identity_data_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronous(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"vm_libavp.m", 38, @"%s", dlerror());

  __break(1u);
}

void libavp_copy_strong_identity_data_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnly(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"vm_libavp.m", 41, @"%s", dlerror());

  __break(1u);
}

void libavp_copy_strong_identity_data_cold_3()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CFDataRef gAppleVirtualPlatformGuestCopyStrongIdentityData(CFDictionaryRef, CFErrorRef *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"vm_libavp.m", 32, @"%s", dlerror());

  __break(1u);
}

void libavp_copy_strong_identity_data_cold_4()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsec(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"vm_libavp.m", 44, @"%s", dlerror());

  __break(1u);
}

void libavp_guest_has_host_key_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"_Bool gAppleVirtualPlatformGuestHasHostKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"vm_libavp.m", 36, @"%s", dlerror());

  __break(1u);
}

void AppleVirtualPlatformLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *AppleVirtualPlatformLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"vm_libavp.m", 26, @"%s", *a1);

  __break(1u);
  CFDictionaryGetValue(v4, v5);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t SecAccessControlCreate()
{
  return MEMORY[0x1F40F6A08]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1F40F6A18](allocator, protection, flags, error);
}

CFTypeID SecAccessControlGetTypeID(void)
{
  return MEMORY[0x1F40F6A40]();
}

uint64_t SecAccessControlSetProtection()
{
  return MEMORY[0x1F40F6A60]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1F40F6AD0](certificate);
}

uint64_t SecCertificateCopyExtensionValue()
{
  return MEMORY[0x1F40F6AF0]();
}

uint64_t SecCertificateCopyIssuerSummary()
{
  return MEMORY[0x1F40F6B00]();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1F40F6B10](certificate);
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x1F40F6B30]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

uint64_t SecCertificateIsValid()
{
  return MEMORY[0x1F40F6BC8]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1F40F6BD0]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x1F40F6BD8]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x1F40F6E38](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E40](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1F40F6E70](key);
}

uint64_t SecKeyCopySystemKey()
{
  return MEMORY[0x1F40F6E88]();
}

uint64_t SecKeyCreateAttestation()
{
  return MEMORY[0x1F40F6E90]();
}

uint64_t SecKeyCreateDuplicate()
{
  return MEMORY[0x1F40F6EA8]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6EE0](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6EF8](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6F08](keyData, attributes, error);
}

uint64_t SecKeySetParameter()
{
  return MEMORY[0x1F40F6F78]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x1F40CA820]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1F40CA848]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x1F40CA850]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x1F40CA8A8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1F40CA9B0]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1F40CAA40]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1F40CAA48]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1F40CAB00]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1F40CAB08]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1F40CAB78]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x1F40CAB80]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1F40CABB0]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1F40CB0D0]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x1F40CB108]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1F40CB138]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1F40CB148]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1F40CB150]();
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1F40CB7F8]();
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x1F40CB8F8](a1, a2);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1F40CD660]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1F40CE220](a1, a2, a3);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1F40CE590](a1);
}