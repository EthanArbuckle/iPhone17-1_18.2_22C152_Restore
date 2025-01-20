@interface CDPDevice(Daemon)
- (_BYTE)initWithSecureBackupRecordInfo:()Daemon;
- (id)initWithEscrowRecord:()Daemon;
- (uint64_t)initWithEscrowRecordMetadata:()Daemon;
- (uint64_t)initWithSecureBackupMetadataInfo:()Daemon;
@end

@implementation CDPDevice(Daemon)

- (_BYTE)initWithSecureBackupRecordInfo:()Daemon
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"metadata"];
  v7 = [v6 objectForKeyedSubscript:@"ClientMetadata"];
  v8 = (unsigned char *)[a1 initWithSecureBackupMetadataInfo:v7];

  if (v8)
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:@"recordID"];
    uint64_t v10 = (int)*MEMORY[0x263F34488];
    v11 = *(void **)&v8[v10];
    *(void *)&v8[v10] = v9;

    v12 = [v5 objectForKeyedSubscript:@"metadata"];
    v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F32AE8]];
    char v14 = [v13 BOOLValue];
    v8[*MEMORY[0x263F34438]] = v14;

    v15 = [v5 objectForKeyedSubscript:*MEMORY[0x263F32AA8]];
    uint64_t v16 = [v15 integerValue];
    *(void *)&v8[*MEMORY[0x263F34498]] = v16;

    uint64_t v17 = [v5 objectForKeyedSubscript:*MEMORY[0x263F32A88]];
    uint64_t v18 = (int)*MEMORY[0x263F344A0];
    v19 = *(void **)&v8[v18];
    *(void *)&v8[v18] = v17;

    v20 = *(void **)&v8[v18];
    v21 = [MEMORY[0x263F343A8] sharedInstance];
    v22 = [v21 serialNumber];
    char v23 = [v20 isEqualToString:v22];
    v8[*MEMORY[0x263F34430]] = v23;

    objc_storeStrong((id *)&v8[*MEMORY[0x263F34490]], a3);
    v24 = [v5 objectForKeyedSubscript:*MEMORY[0x263F32AA0]];
    objc_msgSend(v8, "setRecoveryStatus:", objc_msgSend(v24, "unsignedIntegerValue"));

    v25 = [v5 objectForKeyedSubscript:*MEMORY[0x263F32A00]];
    [v8 setCoolOffPeriod:v25];
  }
  return v8;
}

- (id)initWithEscrowRecord:()Daemon
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 escrowInformationMetadata];
    v8 = (unsigned char *)[a1 initWithEscrowRecordMetadata:v7];

    if (v8)
    {
      uint64_t v9 = [v6 recordId];
      uint64_t v10 = (int)*MEMORY[0x263F34488];
      v11 = *(void **)&v8[v10];
      *(void *)&v8[v10] = v9;

      v12 = [v6 escrowInformationMetadata];
      BOOL v13 = [v12 secureBackupUsesMultipleIcscs] != 0;
      v8[*MEMORY[0x263F34438]] = v13;

      uint64_t v14 = [v6 remainingAttempts];
      *(void *)&v8[*MEMORY[0x263F34498]] = v14;
      uint64_t v15 = [v6 serialNumber];
      uint64_t v16 = (int)*MEMORY[0x263F344A0];
      uint64_t v17 = *(void **)&v8[v16];
      *(void *)&v8[v16] = v15;

      uint64_t v18 = *(void **)&v8[v16];
      v19 = [MEMORY[0x263F343A8] sharedInstance];
      v20 = [v19 serialNumber];
      char v21 = [v18 isEqualToString:v20];
      v8[*MEMORY[0x263F34430]] = v21;

      uint64_t v22 = [MEMORY[0x263F5B738] escrowRecordToDictionary:v6];
      uint64_t v23 = (int)*MEMORY[0x263F34490];
      v24 = *(void **)&v8[v23];
      *(void *)&v8[v23] = v22;

      objc_storeStrong((id *)&v8[*MEMORY[0x263F34478]], a3);
      objc_msgSend(v8, "setRecoveryStatus:", (int)objc_msgSend(v6, "recoveryStatus"));
      v25 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v6, "coolOffEnd"));
      [v8 setCoolOffPeriod:v25];
    }
    a1 = v8;
    id v26 = a1;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (uint64_t)initWithSecureBackupMetadataInfo:()Daemon
{
  id v4 = a3;
  uint64_t v5 = [a1 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"device_mid"];
    uint64_t v7 = (int)*MEMORY[0x263F34448];
    v8 = *(void **)(v5 + v7);
    *(void *)(v5 + v7) = v6;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"kSecureBackupEscrowedSPKIKey"];
    uint64_t v10 = (int)*MEMORY[0x263F344A8];
    v11 = *(void **)(v5 + v10);
    *(void *)(v5 + v10) = v9;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"device_name"];
    uint64_t v13 = (int)*MEMORY[0x263F34440];
    uint64_t v14 = *(void **)(v5 + v13);
    *(void *)(v5 + v13) = v12;

    uint64_t v15 = [v4 objectForKeyedSubscript:@"device_model"];
    uint64_t v16 = (int)*MEMORY[0x263F34450];
    uint64_t v17 = *(void **)(v5 + v16);
    *(void *)(v5 + v16) = v15;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"device_model_version"];
    v19 = (id *)(v5 + (int)*MEMORY[0x263F34460]);
    id v20 = *v19;
    id *v19 = (id)v18;

    if (!*v19) {
      objc_storeStrong(v19, *(id *)(v5 + v16));
    }
    uint64_t v21 = [v4 objectForKeyedSubscript:@"device_model_class"];
    uint64_t v22 = (id *)(v5 + (int)*MEMORY[0x263F34458]);
    id v23 = *v22;
    id *v22 = (id)v21;

    if (!*v22) {
      objc_storeStrong(v22, *(id *)(v5 + v16));
    }
    v24 = [v4 objectForKeyedSubscript:@"device_platform"];
    uint64_t v25 = [v24 integerValue];
    *(void *)(v5 + (int)*MEMORY[0x263F34470]) = v25;

    id v26 = [v4 objectForKeyedSubscript:*MEMORY[0x263F32AF0]];
    char v27 = [v26 BOOLValue];
    *(unsigned char *)(v5 + (int)*MEMORY[0x263F34428]) = v27;

    uint64_t v28 = [v4 objectForKeyedSubscript:*MEMORY[0x263F32A78]];
    uint64_t v29 = (int)*MEMORY[0x263F34468];
    v30 = *(void **)(v5 + v29);
    *(void *)(v5 + v29) = v28;

    v31 = [v4 objectForKeyedSubscript:@"metadata"];
    v32 = [v31 objectForKeyedSubscript:@"ClientMetadata"];
    v33 = [v32 objectForKeyedSubscript:@"SecureBackupMetadataTimestamp"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v34 = +[CDPDSecureBackupController _dateWithSecureBackupDateString:v33];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v34 = v33;
      }
      else {
        id v34 = 0;
      }
    }
    uint64_t v35 = (int)*MEMORY[0x263F34480];
    v36 = *(void **)(v5 + v35);
    *(void *)(v5 + v35) = v34;
    id v37 = v34;

    uint64_t v38 = [v4 objectForKeyedSubscript:@"device_color"];
    uint64_t v39 = (int)*MEMORY[0x263F34418];
    v40 = *(void **)(v5 + v39);
    *(void *)(v5 + v39) = v38;

    uint64_t v41 = [v4 objectForKeyedSubscript:@"device_enclosure_color"];
    uint64_t v42 = (int)*MEMORY[0x263F34420];
    v43 = *(void **)(v5 + v42);
    *(void *)(v5 + v42) = v41;
  }
  return v5;
}

- (uint64_t)initWithEscrowRecordMetadata:()Daemon
{
  id v4 = a3;
  uint64_t v5 = [a1 init];
  uint64_t v6 = [v4 clientMetadata];
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 deviceMid];
    uint64_t v9 = (int)*MEMORY[0x263F34448];
    uint64_t v10 = *(void **)(v5 + v9);
    *(void *)(v5 + v9) = v8;

    uint64_t v11 = [v4 escrowedSpki];
    uint64_t v12 = (int)*MEMORY[0x263F344A8];
    uint64_t v13 = *(void **)(v5 + v12);
    *(void *)(v5 + v12) = v11;

    uint64_t v14 = [v7 deviceName];
    uint64_t v15 = (int)*MEMORY[0x263F34440];
    uint64_t v16 = *(void **)(v5 + v15);
    *(void *)(v5 + v15) = v14;

    uint64_t v17 = [v7 deviceModel];
    uint64_t v18 = (int)*MEMORY[0x263F34450];
    v19 = *(void **)(v5 + v18);
    *(void *)(v5 + v18) = v17;

    uint64_t v20 = [v7 deviceModelVersion];
    uint64_t v21 = (id *)(v5 + (int)*MEMORY[0x263F34460]);
    id v22 = *v21;
    id *v21 = (id)v20;

    if (!*v21) {
      objc_storeStrong(v21, *(id *)(v5 + v18));
    }
    uint64_t v23 = [v7 deviceModelClass];
    v24 = (id *)(v5 + (int)*MEMORY[0x263F34458]);
    id v25 = *v24;
    id *v24 = (id)v23;

    if (!*v24) {
      objc_storeStrong(v24, *(id *)(v5 + v18));
    }
    uint64_t v26 = [v7 devicePlatform];
    *(void *)(v5 + (int)*MEMORY[0x263F34470]) = v26;
    BOOL v27 = [v7 secureBackupUsesNumericPassphrase] != 0;
    *(unsigned char *)(v5 + (int)*MEMORY[0x263F34428]) = v27;
    uint64_t v28 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v7, "secureBackupNumericPassphraseLength"));
    uint64_t v29 = (int)*MEMORY[0x263F34468];
    v30 = *(void **)(v5 + v29);
    *(void *)(v5 + v29) = v28;

    v31 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v7, "secureBackupMetadataTimestamp"));
    uint64_t v32 = (int)*MEMORY[0x263F34480];
    v33 = *(void **)(v5 + v32);
    *(void *)(v5 + v32) = v31;
    id v34 = v31;

    uint64_t v35 = [v7 deviceColor];
    uint64_t v36 = (int)*MEMORY[0x263F34418];
    id v37 = *(void **)(v5 + v36);
    *(void *)(v5 + v36) = v35;

    uint64_t v38 = [v7 deviceEnclosureColor];
    uint64_t v39 = (int)*MEMORY[0x263F34420];
    v40 = *(void **)(v5 + v39);
    *(void *)(v5 + v39) = v38;
  }
  return v5;
}

@end