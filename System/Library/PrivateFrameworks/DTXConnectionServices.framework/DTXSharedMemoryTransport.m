@interface DTXSharedMemoryTransport
+ (id)addressForMemory:(unint64_t)a3 inProcess:(int)a4;
+ (id)addressForPosixSharedMemoryWithName:(id)a3;
+ (id)schemes;
- (BOOL)_setupCreatingSharedMemory:(id)a3 size:(int)a4;
- (BOOL)_setupWithShm:(DTXSharedMemory *)a3 asCreator:(BOOL)a4;
- (DTXSharedMemory)sharedMemory;
- (DTXSharedMemoryTransport)initWithLocalName:(id)a3 size:(int)a4;
- (DTXSharedMemoryTransport)initWithMappedMemory:(DTXSharedMemory *)a3;
- (DTXSharedMemoryTransport)initWithMemoryAddress:(unint64_t)a3 inTask:(unsigned int)a4;
- (DTXSharedMemoryTransport)initWithRemoteAddress:(id)a3;
- (id)localAddresses;
- (id)permittedBlockCompressionTypes;
- (int)remotePid;
- (unint64_t)totalSharedMemorySize;
- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4;
- (void)dealloc;
- (void)disconnect;
- (void)setRemotePid:(int)a3;
@end

@implementation DTXSharedMemoryTransport

+ (id)schemes
{
  return [MEMORY[0x263EFFA08] setWithObjects:@"shm", @"mmap", @"shmem", nil];
}

+ (id)addressForPosixSharedMemoryWithName:(id)a3
{
  v3 = NSURL;
  v4 = [NSString stringWithFormat:@"%@://%@", @"shm", a3];
  v6 = [v3 URLWithString:v5];

  return v6;
}

+ (id)addressForMemory:(unint64_t)a3 inProcess:(int)a4
{
  v4 = NSURL;
  v5 = [NSString stringWithFormat:@"%@://%d/%#llx", @"mmap", a4, a3];
  v7 = [v4 URLWithString:v6];

  return v7;
}

- (unint64_t)totalSharedMemorySize
{
  return self->_shm->var0;
}

- (BOOL)_setupWithShm:(DTXSharedMemory *)a3 asCreator:(BOOL)a4
{
  if (a3)
  {
    self->_shm = a3;
    self->_creator = a4;
    v6 = (OS_dispatch_queue *)dispatch_queue_create("shared memory transport listener queue", 0);
    listenQueue = self->_listenQueue;
    self->_listenQueue = v6;

    v8 = self->_listenQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22AF478A8;
    block[3] = &unk_264883A58;
    block[4] = self;
    dispatch_async(v8, block);
  }
  return a3 != 0;
}

- (BOOL)_setupCreatingSharedMemory:(id)a3 size:(int)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v9 = (const char *)[v6 UTF8String];
  uint64_t v10 = (2 * a4);
  if (!v9)
  {
    size_t v14 = (v10 + 16463) & 0x1FFFFC000;
LABEL_7:
    v18 = mmap(0, v14, 3, 4098, 167772160, 0);
    if (v18 != (void *)-1)
    {
      v17 = v18;
      void *v18 = v14;
      v18[1] = v18;
      v18[2] = 0;
      goto LABEL_9;
    }
    return 0;
  }
  v11 = v9;
  size_t v12 = strlen(v9);
  size_t v13 = v12 + 1;
  size_t v14 = (v10 + 16463 + v12 + 1) & 0xFFFFFFFFFFFFC000;
  if (v12 == -1) {
    goto LABEL_7;
  }
  int v15 = shm_open(v11, 16777730, 511);
  if (v15 == -1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v21 = *__error();
      *(_DWORD *)buf = 136315906;
      v23 = v11;
      __int16 v24 = 2048;
      size_t v25 = v14;
      __int16 v26 = 1024;
      int v27 = 511;
      __int16 v28 = 1024;
      int v29 = v21;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error creating shared memory (name: %s, size: %lld, permissions: %x): %d\n", buf, 0x22u);
    }
    return 0;
  }
  int v16 = v15;
  ftruncate(v15, v14);
  v17 = mmap(0, v14, 3, 1, v16, 0);
  close(v16);
  if (v17 == (void *)-1) {
    return 0;
  }
  *(void *)v17 = v14;
  *((void *)v17 + 1) = v17;
  *((void *)v17 + 2) = v10 + 80;
  strlcpy((char *)v17 + v10 + 80, v11, v13);
LABEL_9:
  *((_DWORD *)v17 + 6) = 0;
  *((_DWORD *)v17 + 7) = a4;
  *((_DWORD *)v17 + 8) = a4;
  *((_DWORD *)v17 + 9) = a4;
  atomic_store(0, (unsigned int *)v17 + 13);
  atomic_store(0, (unsigned int *)v17 + 14);
  atomic_store(0, (unsigned int *)v17 + 15);
  atomic_store(0, (unsigned int *)v17 + 16);
  atomic_store(0, (unsigned int *)v17 + 12);
  atomic_store(getpid(), (unsigned int *)v17 + 10);
  atomic_store(0, (unsigned int *)v17 + 11);

  return [self _setupWithShm_asCreator_:v19 shmSize:v17 asCreator:YES];
}

- (DTXSharedMemoryTransport)initWithLocalName:(id)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTXSharedMemoryTransport;
  v7 = [(DTXTransport *)&v11 init];
  v9 = v7;
  if (v7 && [v7 _setupCreatingSharedMemory_size_:v8 size:v6] == NO)
  {

    v9 = 0;
  }

  return v9;
}

- (DTXSharedMemoryTransport)initWithRemoteAddress:(id)a3
{
  kern_return_t v45;
  int v46;
  NSObject *v47;
  const char *v48;
  uint32_t v49;
  vm_map_t v50;
  vm_map_t v51;
  unsigned char *v52;
  int v53;
  NSObject *v54;
  const char *v55;
  int v56;
  const char *v57;
  vm_map_t v59;
  kern_return_t v60;
  mach_vm_address_t v61;
  mach_vm_size_t v62;
  kern_return_t v63;
  unsigned int v64;
  uint64_t v65;
  mach_port_name_t name;
  objc_super v67;
  vm_prot_t cur_protection[2];
  mach_vm_address_t target_address;
  unsigned char buf[24];
  void *v71;
  uint8_t *v72;
  uint8_t v73[8];
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t v77[4];
  mach_vm_address_t v78;
  __int16 v79;
  vm_map_t v80;
  __int16 v81;
  vm_prot_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)DTXSharedMemoryTransport;
  v7 = [(DTXTransport *)&v67 initWithRemoteAddress:v4];
  if (!v7) {
    goto LABEL_40;
  }
  uint64_t v8 = [v4 v5:v6];
  if ([v8 isEqualToString:@"shm"])
  {

LABEL_5:
    [v4 performSelector:v12 withObject:v13];
    id v17 = objc_claimAutoreleasedReturnValue();
    v20 = (const char *)[v17 UTF8String];
    int v21 = v20;
    if (!v20 || !*v20) {
      goto LABEL_36;
    }
    int v22 = shm_open(v20, 2);
    if (v22 == -1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        v46 = *__error();
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v46;
        v47 = &_os_log_internal;
        v48 = "Error connecting to shared memory (name: %s): %d\n";
        v49 = 18;
LABEL_24:
        _os_log_impl(&_dtx_internal_logger, v47, OS_LOG_TYPE_ERROR, v48, buf, v49);
      }
LABEL_36:
      uint64_t v25 = 0;
      goto LABEL_37;
    }
    v23 = (size_t *)mmap(0, 0x1000uLL, 3, 1, v22, 0);
    if (v23 == (size_t *)-1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        v53 = *__error();
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 4096;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v71) = v53;
        v54 = &_os_log_internal;
        v55 = "Unable to map shared memory \"%s\" with size %ld: %d\n";
LABEL_34:
        _os_log_impl(&_dtx_internal_logger, v54, OS_LOG_TYPE_ERROR, v55, buf, 0x1Cu);
      }
    }
    else
    {
      size_t v24 = *v23;
      munmap(v23, 0x1000uLL);
      uint64_t v25 = (uint64_t)mmap(0, v24, 3, 1, v22, 0);
      if (v25 != -1)
      {
        close(v22);
        if (!v25)
        {
LABEL_37:

          goto LABEL_38;
        }
        unsigned int v26 = atomic_load((unsigned int *)(v25 + 44));
        if (!v26 || v26 == getpid())
        {
          atomic_store(getpid(), (unsigned int *)(v25 + 44));
          uint64_t v27 = *(void *)(v25 + 16);
          if (v27) {
            shm_unlink((const char *)(v25 + v27));
          }
          goto LABEL_37;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v26;
          v47 = &_os_log_internal;
          v48 = "Unable to attach to shared memory - process %d already attached.\n";
          v49 = 8;
          goto LABEL_24;
        }
        goto LABEL_36;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        v56 = *__error();
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v71) = v56;
        v54 = &_os_log_internal;
        v55 = "Unable to map shared memory \"%s\" with size %lld: %d\n";
        goto LABEL_34;
      }
    }
    close(v22);
    goto LABEL_36;
  }
  size_t v14 = [v4 v10:v11];
  int isEqualToString = [v14 isEqualToString:@"shmem"];

  if (isEqualToString) {
    goto LABEL_5;
  }
  __int16 v28 = [v4 v12:v13];
  int v31 = [v28 v29:v30];

  v34 = [v4 v32:v33];
  if (v34.length <= 1)
  {

    mach_vm_address_t v43 = 0;
  }
  else
  {
    [v4 v37:v38];
    id v39 = objc_claimAutoreleasedReturnValue();
    uint64_t v42 = [v39 UTF8String];

    mach_vm_address_t v43 = strtoull((const char *)(v42 + 1), 0, 16);
  }
  name = 0;
  v44 = (vm_map_t *)MEMORY[0x263EF8960];
  v45 = task_for_pid(*MEMORY[0x263EF8960], v31, &name);
  if (v45)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v31;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v45;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to acquire task for pid: %d (%d)\n", buf, 0xEu);
    }
    goto LABEL_39;
  }
  if (!v43) {
    goto LABEL_58;
  }
  v50 = name;
  if (name - 1 > 0xFFFFFFFD) {
    goto LABEL_58;
  }
  v51 = *v44;
  if (*v44 - 1 >= 0xFFFFFFFE) {
    goto LABEL_58;
  }
  *(void *)v73 = 0;
  v74 = v73;
  v75 = 0x2020000000;
  v76 = 0;
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_22AF492F4;
  v71 = &unk_264884318;
  v72 = v73;
  v52 = buf;
  if (mach_task_is_self(v50))
  {
    (*(void (**)(unsigned char *, mach_vm_address_t))&buf[16])(v52, v43);
  }
  else
  {
    v59 = *v44;
    *(void *)cur_protection = 0;
    target_address = 0;
    v60 = mach_vm_remap(v59, &target_address, 0x50uLL, 0, 1048577, v50, v43, 0, &cur_protection[1], cur_protection, 2u);
    if (v60)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v77 = 134218496;
        v78 = v43;
        v79 = 1024;
        v80 = v50;
        v81 = 1024;
        v82 = v60;
        _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", v77, 0x18u);
      }
      v61 = 0;
    }
    else
    {
      if ((~cur_protection[1] & 3) != 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v77 = 134218496;
          v78 = v43;
          v79 = 1024;
          v80 = v50;
          v81 = 1024;
          v82 = cur_protection[1];
          _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", v77, 0x18u);
        }
        mach_vm_deallocate(v59, target_address, 0x50uLL);
      }
      v61 = target_address;
    }
    (*(void (**)(unsigned char *, mach_vm_address_t))&buf[16])(v52, v61);
    mach_vm_deallocate(*v44, v61, 0x50uLL);
  }

  v62 = *((void *)v74 + 3);
  if (!v62) {
    goto LABEL_57;
  }
  *(void *)cur_protection = 0;
  target_address = 0;
  v63 = mach_vm_remap(v51, &target_address, v62, 0, 1048577, v50, v43, 0, &cur_protection[1], cur_protection, 2u);
  if (v63)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v77 = 134218496;
      v78 = v43;
      v79 = 1024;
      v80 = v50;
      v81 = 1024;
      v82 = v63;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", v77, 0x18u);
    }
LABEL_57:
    _Block_object_dispose(v73, 8);
    goto LABEL_58;
  }
  if ((~cur_protection[1] & 3) != 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v77 = 134218496;
      v78 = v43;
      v79 = 1024;
      v80 = v50;
      v81 = 1024;
      v82 = cur_protection[1];
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", v77, 0x18u);
    }
    mach_vm_deallocate(v51, target_address, v62);
  }
  uint64_t v25 = target_address;
  _Block_object_dispose(v73, 8);
  if (!v25) {
    goto LABEL_59;
  }
  v64 = atomic_load((unsigned int *)(v25 + 44));
  if (!v64 || v64 == getpid())
  {
    atomic_store(getpid(), (unsigned int *)(v25 + 44));
    v65 = *(void *)(v25 + 16);
    if (v65) {
      shm_unlink((const char *)(v25 + v65));
    }
    goto LABEL_59;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v73 = 67109120;
    *(_DWORD *)&v73[4] = v64;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to attach to shared memory - process %d already attached.\n", v73, 8u);
  }
LABEL_58:
  uint64_t v25 = 0;
LABEL_59:
  mach_port_deallocate(*v44, name);
LABEL_38:
  if ([v7 _setupWithShm_asCreator_:v57 shm:v25] == NO)
  {
LABEL_39:

    v7 = 0;
  }
LABEL_40:

  return v7;
}

- (DTXSharedMemoryTransport)initWithMemoryAddress:(unint64_t)a3 inTask:(unsigned int)a4
{
  kern_return_t v11;
  mach_vm_address_t v12;
  mach_vm_size_t v13;
  kern_return_t v14;
  DTXSharedMemoryTransport *v15;
  const char *v17;
  void v18[2];
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  vm_prot_t cur_protection[2];
  mach_vm_address_t target_address;
  uint8_t buf[4];
  unint64_t v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  vm_prot_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x263EF8340];
  if (!a3) {
    goto LABEL_21;
  }
  if (a4 - 1 > 0xFFFFFFFD) {
    goto LABEL_21;
  }
  uint64_t v6 = (vm_map_t *)MEMORY[0x263EF8960];
  vm_map_t v7 = *MEMORY[0x263EF8960];
  if ((*MEMORY[0x263EF8960] - 1) >= 0xFFFFFFFE) {
    goto LABEL_21;
  }
  int v22 = 0;
  v23 = &v22;
  size_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  uint64_t v19 = sub_22AF492F4;
  v20 = &unk_264884318;
  int v21 = &v22;
  v9 = v18;
  if (mach_task_is_self(a4))
  {
    v19((uint64_t)v9, (void *)a3);
  }
  else
  {
    vm_map_t v10 = *v6;
    *(void *)cur_protection = 0;
    target_address = 0;
    uint64_t v11 = mach_vm_remap(v10, &target_address, 0x50uLL, 0, 1048577, a4, a3, 0, &cur_protection[1], cur_protection, 2u);
    if (v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        int v29 = a3;
        uint64_t v30 = 1024;
        int v31 = a4;
        v32 = 1024;
        uint64_t v33 = v11;
        _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", buf, 0x18u);
      }
      size_t v12 = 0;
    }
    else
    {
      if ((~cur_protection[1] & 3) != 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218496;
          int v29 = a3;
          uint64_t v30 = 1024;
          int v31 = a4;
          v32 = 1024;
          uint64_t v33 = cur_protection[1];
          _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", buf, 0x18u);
        }
        mach_vm_deallocate(v10, target_address, 0x50uLL);
      }
      size_t v12 = target_address;
    }
    v19((uint64_t)v9, (void *)v12);
    mach_vm_deallocate(*v6, v12, 0x50uLL);
  }

  uint64_t v13 = v23[3];
  if (!v13)
  {
LABEL_20:
    _Block_object_dispose(&v22, 8);
LABEL_21:
    int v15 = 0;
    goto LABEL_22;
  }
  *(void *)cur_protection = 0;
  target_address = 0;
  size_t v14 = mach_vm_remap(v7, &target_address, v13, 0, 1048577, a4, a3, 0, &cur_protection[1], cur_protection, 2u);
  if (v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      int v29 = a3;
      uint64_t v30 = 1024;
      int v31 = a4;
      v32 = 1024;
      uint64_t v33 = v14;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", buf, 0x18u);
    }
    goto LABEL_20;
  }
  if ((~cur_protection[1] & 3) != 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      int v29 = a3;
      uint64_t v30 = 1024;
      int v31 = a4;
      v32 = 1024;
      uint64_t v33 = cur_protection[1];
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", buf, 0x18u);
    }
    mach_vm_deallocate(v7, target_address, v13);
  }
  int v15 = (DTXSharedMemoryTransport *)target_address;
  _Block_object_dispose(&v22, 8);
  if (v15)
  {
    self = (DTXSharedMemoryTransport *)(id)[self initWithMappedMemory:v17 mappedMemory:v15];
    int v15 = self;
  }
LABEL_22:

  return v15;
}

- (DTXSharedMemoryTransport)initWithMappedMemory:(DTXSharedMemory *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)DTXSharedMemoryTransport;
  v5 = [(DTXTransport *)&v9 init];
  if (v5)
  {
    if (a3)
    {
      unsigned int v6 = atomic_load((unsigned int *)&a3->var8);
      if (v6 && v6 != getpid())
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v11 = v6;
          _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to attach to shared memory - process %d already attached.\n", buf, 8u);
        }
        a3 = 0;
      }
      else
      {
        atomic_store(getpid(), (unsigned int *)&a3->var8);
        unint64_t var2 = a3->var2;
        if (var2) {
          shm_unlink((const char *)a3 + var2);
        }
      }
    }
    if ([v5 _setupWithShm_asCreator_:v4 shmSize:a3] == NO)
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  shm = self->_shm;
  if (shm)
  {
    atomic_store(1u, &shm->var9);
    if (shm->var2)
    {
      if (!atomic_load((unsigned int *)&shm->var8)) {
        shm_unlink((const char *)shm + shm->var2);
      }
    }
    mach_vm_deallocate(*MEMORY[0x263EF8960], (mach_vm_address_t)shm, shm->var0);
  }
  self->_shm = 0;
  v5.receiver = self;
  v5.super_class = (Class)DTXSharedMemoryTransport;
  [(DTXTransport *)&v5 dealloc];
}

- (int)remotePid
{
  uint64_t v2 = 44;
  if (!self->_creator) {
    uint64_t v2 = 40;
  }
  return atomic_load((unsigned int *)((char *)self->_shm + v2));
}

- (void)setRemotePid:(int)a3
{
  uint64_t v3 = 44;
  if (!self->_creator) {
    uint64_t v3 = 40;
  }
  atomic_store(a3, (unsigned int *)((char *)self->_shm + v3));
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  shm = self->_shm;
  if (!shm) {
    goto LABEL_48;
  }
  uint64_t v5 = 52;
  if (!self->_creator) {
    uint64_t v5 = 60;
  }
  uint64_t v6 = 56;
  if (!self->_creator) {
    uint64_t v6 = 64;
  }
  uint64_t v7 = 32;
  if (self->_creator) {
    uint64_t v7 = 24;
  }
  uint64_t v8 = 36;
  if (self->_creator) {
    uint64_t v8 = 28;
  }
  uint64_t v9 = 44;
  if (!self->_creator) {
    uint64_t v9 = 40;
  }
  if (a4)
  {
    vm_map_t v10 = (char *)a3;
    unint64_t v11 = 0;
    int v12 = *(_DWORD *)((char *)&shm->var0 + v8);
    uint64_t v13 = &shm->var17[*(unsigned int *)((char *)&shm->var0 + v7)];
    v32 = v13;
    uint64_t v33 = (unsigned int *)((char *)shm + v6);
    size_t v14 = (unsigned int *)((char *)shm + v5);
    int v31 = (unsigned int *)((char *)shm + v9);
    unint64_t v15 = a4;
    unsigned int v16 = 64;
    while (!atomic_load_explicit((atomic_uint *volatile)&shm->var9, memory_order_acquire))
    {
      signed int v17 = atomic_load(v33);
      signed int v18 = atomic_load(v14);
      if (v17 <= v18) {
        int v19 = v12;
      }
      else {
        int v19 = 0;
      }
      unsigned int v20 = v17 + ~v18 + v19;
      if (v20)
      {
        signed int v21 = v18;
        LODWORD(v22) = v12 - v18;
        if (v12 - v18 >= v20) {
          size_t v22 = v20;
        }
        else {
          size_t v22 = v22;
        }
        if (v15 >= v22) {
          size_t v23 = v22;
        }
        else {
          size_t v23 = v15;
        }
        memcpy(&v13[v18], v10, v23);
        v10 += v23;
        v15 -= v23;
        v11 += v23;
        if (v15) {
          BOOL v24 = v20 == v23;
        }
        else {
          BOOL v24 = 1;
        }
        if (v24)
        {
          LODWORD(v23) = v21 + v23;
        }
        else
        {
          if (v15 >= v20 - v23) {
            size_t v23 = v20 - v23;
          }
          else {
            size_t v23 = v15;
          }
          memmove(v13, v10, v23);
          v10 += v23;
          v15 -= v23;
          v11 += v23;
        }
        signed int v27 = v21;
        atomic_compare_exchange_strong((atomic_uint *volatile)v14, (unsigned int *)&v27, v23);
        if (v27 != v21)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Inconsistent writer offset in shared memory! MT transmission suspected...\n", buf, 2u);
          }
          break;
        }
        unsigned int v16 = 64;
      }
      else
      {
        pid_t v25 = atomic_load(v31);
        if (v16 <= 0x40) {
          useconds_t v26 = 64;
        }
        else {
          useconds_t v26 = v16;
        }
        usleep(v26);
        if (v26 <= 0x10000)
        {
          unsigned int v16 = 2 * v26;
        }
        else
        {
          if (v25 && kill(v25, 0) == -1 && *__error() == 3) {
            break;
          }
          unsigned int v16 = 0x20000;
        }
      }
      uint64_t v13 = v32;
      if (!v15) {
        break;
      }
    }
  }
  else
  {
LABEL_48:
    unint64_t v11 = 0;
  }
  if (v11 < a4) {
    [self a2:(uint64_t)a3];
  }
  return v11;
}

- (void)disconnect
{
  atomic_store(1u, &self->_shm->var9);
  listenQueue = self->_listenQueue;
  if (listenQueue) {
    dispatch_sync(listenQueue, &unk_26DE3D010);
  }
  v4.receiver = self;
  v4.super_class = (Class)DTXSharedMemoryTransport;
  [(DTXTransport *)&v4 disconnect];
}

- (id)localAddresses
{
  uint64_t v3 = atomic_load((unsigned int *)&self->_shm->var7);
  uint64_t v5 = [DTXSharedMemoryTransport addressForMemory:a2 inProcess:self->_shm->var1];
  shm = self->_shm;
  unint64_t var2 = shm->var2;
  if (var2)
  {
    uint64_t v9 = [NSString stringWithUTF8String:(const char *)((uint64_t)shm + var2)];
    if (v9)
    {
      vm_map_t v10 = [DTXSharedMemoryTransport addressForPosixSharedMemoryWithName:v8];
      [MEMORY[0x263EFF8C0] arrayWithObjects:v11, v5, v10, nil];
    }
    else
    {
      vm_map_t v10 = 0;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v8, v5, nil];
    }
  }
  else
  {
    vm_map_t v10 = 0;
    uint64_t v9 = 0;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v4, (uint64_t)v5, nil];
  int v12 = };

  return v12;
}

- (id)permittedBlockCompressionTypes
{
  return [MEMORY[0x263EFFA08] setFoo:v2];
}

- (DTXSharedMemory)sharedMemory
{
  return self->_shm;
}

- (void).cxx_destruct
{
}

@end