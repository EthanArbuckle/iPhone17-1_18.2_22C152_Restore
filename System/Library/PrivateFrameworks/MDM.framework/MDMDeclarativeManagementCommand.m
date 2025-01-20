@interface MDMDeclarativeManagementCommand
+ (BOOL)_isSupervised;
+ (BOOL)processMultiUserDeviceUserChannelRequestTypeWithProfileIdentifier:(id)a3 request:(id)a4 error:(id *)a5;
+ (BOOL)processRequestTypeWithProfileIdentifier:(id)a3 request:(id)a4 error:(id *)a5;
+ (BOOL)unenrollWithProfileIdentifier:(id)a3 error:(id *)a4;
+ (id)declarativeManagementFatalError;
+ (void)_enrollmentTypeWithProfileIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation MDMDeclarativeManagementCommand

+ (BOOL)processRequestTypeWithProfileIdentifier:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 1;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __89__MDMDeclarativeManagementCommand_processRequestTypeWithProfileIdentifier_request_error___block_invoke;
  v11[3] = &unk_264B9D2F0;
  v11[4] = &v24;
  v11[5] = &v18;
  v11[6] = &v12;
  [a1 _enrollmentTypeWithProfileIdentifier:v8 completionHandler:v11];
  LOBYTE(a5) = [MEMORY[0x263F635B8] processDeclarativeManagementCommandWithProfileIdentifier:v8 enrollmentType:v25[3] scope:1 username:v19[5] personaID:v13[5] request:v9 error:a5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return (char)a5;
}

void __89__MDMDeclarativeManagementCommand_processRequestTypeWithProfileIdentifier_request_error___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  uint64_t v9 = *(void *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

+ (BOOL)processMultiUserDeviceUserChannelRequestTypeWithProfileIdentifier:(id)a3 request:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x263EFB210];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 defaultStore];
  uint64_t v11 = objc_msgSend(v10, "dmc_primaryiCloudAccount");
  uint64_t v12 = [v11 username];

  LOBYTE(a5) = [MEMORY[0x263F635B8] processDeclarativeManagementCommandWithProfileIdentifier:v9 enrollmentType:3 scope:0 username:v12 personaID:0 request:v8 error:a5];
  return (char)a5;
}

+ (BOOL)unenrollWithProfileIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 1;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  id v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__1;
  v9[4] = __Block_byref_object_dispose__1;
  id v10 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__MDMDeclarativeManagementCommand_unenrollWithProfileIdentifier_error___block_invoke;
  v8[3] = &unk_264B9D2F0;
  v8[4] = &v13;
  v8[5] = v11;
  v8[6] = v9;
  [a1 _enrollmentTypeWithProfileIdentifier:v6 completionHandler:v8];
  LOBYTE(a4) = [MEMORY[0x263F635B8] unenrollWithProfileIdentifier:v6 enrollmentType:v14[3] scope:1 error:a4];
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return (char)a4;
}

void __71__MDMDeclarativeManagementCommand_unenrollWithProfileIdentifier_error___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

+ (void)_enrollmentTypeWithProfileIdentifier:(id)a3 completionHandler:(id)a4
{
  id v12 = (void (**)(id, void, void *, void *))a4;
  int v5 = [a1 _isSupervised];
  id v6 = [MEMORY[0x263F52810] sharedConfiguration];
  [v6 refreshDetailsFromDisk];
  int v7 = [v6 isUserEnrollment];
  id v8 = [v6 personaID];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F38B20] managedAppleIDNameWithPersonaID:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = 3;
  if (!v5) {
    uint64_t v10 = 1;
  }
  if (v7) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  v12[2](v12, v11, v9, v8);
}

+ (BOOL)_isSupervised
{
  v2 = [MEMORY[0x263F52808] sharedConfiguration];
  [v2 refreshDetailsFromDisk];
  char v3 = [v2 isSupervised];

  return v3;
}

+ (id)declarativeManagementFatalError
{
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  v4 = DMCErrorArray();
  int v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12097, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

@end