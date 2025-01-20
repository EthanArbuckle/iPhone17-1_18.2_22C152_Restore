@interface _LABKDevice
+ (id)deviceWithDescriptor:(id)a3 error:(id *)a4;
- (BKDevice)_BKDevice;
- (BKDeviceDescriptor)descriptor;
- (BOOL)bioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5;
- (BOOL)extendedBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5;
- (_LAAuthenticationBiometricMethodShim)shim;
- (_LABKDevice)initWithDescriptor:(id)a3 error:(id *)a4;
- (id)createMatchOperationWithError:(id *)a3;
- (id)createPresenceDetectOperationWithError:(id *)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)identitiesWithError:(id *)a3;
@end

@implementation _LABKDevice

- (_LABKDevice)initWithDescriptor:(id)a3 error:(id *)a4
{
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_LABKDevice;
  v9 = [(_LABKDevice *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v11 = (void *)getBKDeviceDescriptorClass_softClass;
    uint64_t v34 = getBKDeviceDescriptorClass_softClass;
    if (!getBKDeviceDescriptorClass_softClass)
    {
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __getBKDeviceDescriptorClass_block_invoke;
      v29 = &unk_1E63C3EB0;
      v30 = &v31;
      __getBKDeviceDescriptorClass_block_invoke((uint64_t)&v26);
      v11 = (void *)v32[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v31, 8);
    v13 = objc_msgSend(v12, "deviceDescriptorForType:", objc_msgSend(v8, "type"));
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v14 = (void *)getBKDeviceClass_softClass;
    uint64_t v34 = getBKDeviceClass_softClass;
    if (!getBKDeviceClass_softClass)
    {
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __getBKDeviceClass_block_invoke;
      v29 = &unk_1E63C3EB0;
      v30 = &v31;
      __getBKDeviceClass_block_invoke((uint64_t)&v26);
      v14 = (void *)v32[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v31, 8);
    uint64_t v16 = [v15 deviceWithDescriptor:v13 error:a4];
    BKDevice = v10->__BKDevice;
    v10->__BKDevice = (BKDevice *)v16;

    uint64_t v18 = +[_LAAuthenticationBiometricMethodShim sharedInstance];
    shim = v10->_shim;
    v10->_shim = (_LAAuthenticationBiometricMethodShim *)v18;

    uint64_t v20 = objc_opt_class();
    v21 = [(_LABKDevice *)v10 descriptor];
    uint64_t v22 = [v21 type];
    v23 = [(_LABKDevice *)v10 _BKDevice];
    +[_LABKLog logClass:v20, a2, @"-> deviceType:%d, BKDevice=%@", v22, v23 selector message];
  }
  return v10;
}

+ (id)deviceWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  +[_LABKLog logClass:objc_opt_class() selector:a2 message:&stru_1F19E1C60];
  uint64_t v7 = [v6 type];
  if (v7 == 1)
  {
    id v8 = off_1E63C3C20;
    goto LABEL_5;
  }
  if (v7 == 2)
  {
    id v8 = off_1E63C3C18;
LABEL_5:
    v9 = (void *)[objc_alloc(*v8) initWithDescriptor:v6 error:a4];
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)identitiesWithError:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  +[_LABKLog logClass:objc_opt_class() selector:a2 message:&stru_1F19E1C60];
  v4 = [(_LABKDevice *)self shim];
  v5 = [v4 biometricMethod];
  if ([v5 isEnrolled])
  {
    id v6 = objc_opt_new();
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (BOOL)bioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  uint64_t v14 = 0;
  BOOL v7 = [(_LABKDevice *)self extendedBioLockoutState:&v14 forUser:*(void *)&a4 error:a5];
  if (v7)
  {
    uint64_t v8 = 2;
    uint64_t v9 = 4;
    uint64_t v10 = 6;
    uint64_t v11 = 7;
    if ((v14 & 0x40) == 0) {
      uint64_t v11 = 1;
    }
    if ((v14 & 8) == 0) {
      uint64_t v10 = v11;
    }
    if ((v14 & 4) == 0) {
      uint64_t v9 = v10;
    }
    if ((v14 & 1) == 0) {
      uint64_t v8 = v9;
    }
    if ((v14 & 2) != 0) {
      int64_t v12 = 3;
    }
    else {
      int64_t v12 = v8;
    }
    *a3 = v12;
    +[_LABKLog logClass:objc_opt_class(), a2, @"-> %d", *a3 selector message];
  }
  return v7;
}

- (BOOL)extendedBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  BOOL v7 = [(_LABKDevice *)self shim];
  uint64_t v8 = [v7 biometricMethodState];

  if (v8)
  {
    *a3 = 0;
    if (([v8 lockoutState] & 4) != 0) {
      *a3 |= 4uLL;
    }
    if (([v8 lockoutState] & 2) != 0) {
      *a3 |= 2uLL;
    }
    if ([v8 lockoutState]) {
      *a3 |= 1uLL;
    }
    if (([v8 lockoutState] & 0x10) != 0) {
      *a3 |= 0x40uLL;
    }
    if (([v8 lockoutState] & 8) != 0) {
      *a3 |= 0x10uLL;
    }
    *a3 = [v8 lockoutState];
  }
  else if (a5)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v10 = (id *)getBKErrorDomainSymbolLoc_ptr;
    uint64_t v19 = getBKErrorDomainSymbolLoc_ptr;
    if (!getBKErrorDomainSymbolLoc_ptr)
    {
      uint64_t v11 = (void *)BiometricKitLibrary();
      v17[3] = (uint64_t)dlsym(v11, "BKErrorDomain");
      getBKErrorDomainSymbolLoc_ptr = v17[3];
      uint64_t v10 = (id *)v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v10)
    {
      id v15 = (_Unwind_Exception *)_LAMKBLockDevice_cold_1();
      _Block_object_dispose(&v16, 8);
      _Unwind_Resume(v15);
    }
    id v12 = *v10;
    id v13 = [v9 errorWithDomain:v12 code:1 userInfo:0];

    *a5 = v13;
  }

  return v8 != 0;
}

- (id)createMatchOperationWithError:(id *)a3
{
  +[_LABKLog logClass:objc_opt_class() selector:a2 message:@"override"];
  v5 = [(_LABKDevice *)self _BKDevice];
  id v6 = [v5 createMatchOperationWithError:a3];

  if (v6)
  {
    BOOL v7 = +[_LABKOperation _wrapperForBKOperation:v6 device:self];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)createPresenceDetectOperationWithError:(id *)a3
{
  +[_LABKLog logClass:objc_opt_class() selector:a2 message:@"override"];
  v5 = [(_LABKDevice *)self _BKDevice];
  id v6 = [v5 createPresenceDetectOperationWithError:a3];

  if (v6)
  {
    BOOL v7 = +[_LABKOperation _wrapperForBKOperation:v6 device:self];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  +[_LABKLog logClass:objc_opt_class() selector:a3 message:@"forwarding to BK"];

  return [(_LABKDevice *)self _BKDevice];
}

- (BKDevice)_BKDevice
{
  return self->__BKDevice;
}

- (BKDeviceDescriptor)descriptor
{
  return self->_descriptor;
}

- (_LAAuthenticationBiometricMethodShim)shim
{
  return self->_shim;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shim, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);

  objc_storeStrong((id *)&self->__BKDevice, 0);
}

@end