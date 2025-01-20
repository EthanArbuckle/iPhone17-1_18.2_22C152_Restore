@interface NSHost
+ (BOOL)isHostCacheEnabled;
+ (NSHost)currentHost;
+ (NSHost)hostWithAddress:(NSString *)address;
+ (NSHost)hostWithName:(NSString *)name;
- (BOOL)isEqualToHost:(NSHost *)aHost;
- (NSArray)addresses;
- (NSArray)names;
- (NSString)address;
- (NSString)localizedName;
- (NSString)name;
- (id)_thingToResolve;
- (id)description;
- (void)__resolveWithFlags:(uint64_t)a3 resultArray:(uint64_t)a4 handler:;
- (void)blockingResolveUntil:(uint64_t)a1;
- (void)dealloc;
- (void)initToResolve:(int)a3 as:;
@end

@implementation NSHost

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSHost;
  [(NSHost *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p> %@ (%@ %@)", objc_opt_class(), self, -[NSHost name](self, "name"), -[NSHost names](self, "names"), -[NSHost addresses](self, "addresses")];
}

- (NSString)localizedName
{
  return (NSString *)0;
}

- (NSArray)addresses
{
  return self->addresses;
}

- (void)blockingResolveUntil:(uint64_t)a1
{
  if (a1)
  {
    v4 = dispatch_semaphore_create(0);
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    char v10 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __31__NSHost_blockingResolveUntil___block_invoke;
    v7[3] = &unk_1E5255258;
    int v8 = a2;
    v7[4] = v4;
    v7[5] = v9;
    uint64_t v5 = *(void *)(a1 + 24);
    if (v5) {
      v6 = *(NSObject **)(v5 + 24);
    }
    else {
      v6 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __18__NSHost_resolve___block_invoke;
    block[3] = &unk_1E5258028;
    block[4] = a1;
    block[5] = v7;
    dispatch_async(v6, block);
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v4);
    _Block_object_dispose(v9, 8);
  }
}

intptr_t __31__NSHost_blockingResolveUntil___block_invoke(intptr_t result, int a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    intptr_t v2 = result;
    if (a2 == 2 || *(_DWORD *)(result + 48) == a2)
    {
      result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
      *(unsigned char *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

void __18__NSHost_resolve___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 24);
    if (v3)
    {
      if (*(unsigned char *)(v3 + 48)) {
        goto LABEL_26;
      }
      *(unsigned char *)(v3 + 48) = 1;
    }
  }
  *(void *)(*(void *)(a1 + 32) + 16) = [objc_allocWithZone(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  *(void *)(*(void *)(a1 + 32) + 8) = [objc_allocWithZone(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = v4[3];
    if (v5 && (int v6 = *(_DWORD *)(v5 + 16)) != 0)
    {
      if (v6 == 2)
      {
        uint64_t v7 = v4[2];
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = 7;
        goto LABEL_25;
      }
      if (v6 == 1)
      {
        uint64_t v7 = v4[1];
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = 3;
LABEL_25:
        -[NSHost __resolveWithFlags:resultArray:handler:](v9, v10, v7, v8);
      }
    }
    else
    {
      uint64_t v23 = *(void *)(a1 + 40);
      v32[3] = 0;
      v33 = 0;
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x2020000000;
      v31[0] = 0;
      v31[1] = v31;
      v31[2] = 0x2020000000;
      v31[3] = 0;
      if (!getifaddrs(&v33))
      {
        v11 = dispatch_group_create();
        for (i = v33; i; i = i->ifa_next)
        {
          ifa_addr = i->ifa_addr;
          int sa_family = ifa_addr->sa_family;
          if (sa_family == 30 || sa_family == 2)
          {
            int sa_len = ifa_addr->sa_len;
            global_queue = dispatch_get_global_queue(0, 2uLL);
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke;
            v29[3] = &unk_1E52552F8;
            int v30 = sa_len;
            v29[4] = v11;
            v29[5] = v4;
            v29[8] = v32;
            v29[9] = i;
            v29[7] = v31;
            v29[6] = v23;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_4;
            block[3] = &unk_1E5258028;
            block[4] = v4;
            block[5] = v29;
            dispatch_group_async(v11, global_queue, block);
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_5;
            v27[3] = &unk_1E5258028;
            v27[4] = v4;
            v27[5] = v29;
            dispatch_group_async(v11, global_queue, v27);
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_6;
            v26[3] = &unk_1E5258028;
            v26[4] = v4;
            v26[5] = v29;
            dispatch_group_async(v11, global_queue, v26);
          }
        }
        dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v11);
        MEMORY[0x18531BE20](v33);
        uint64_t v18 = v4[3];
        if (v18) {
          v19 = *(NSObject **)(v18 + 32);
        }
        else {
          v19 = 0;
        }
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_7;
        v25[3] = &unk_1E5255320;
        v25[4] = v4;
        v25[5] = v31;
        dispatch_sync(v19, v25);
      }
      _Block_object_dispose(v31, 8);
      _Block_object_dispose(v32, 8);
    }
  }
LABEL_26:
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20 && (uint64_t v21 = *(void *)(v20 + 24)) != 0) {
    v22 = *(NSObject **)(v21 + 40);
  }
  else {
    v22 = 0;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __18__NSHost_resolve___block_invoke_2;
  v24[3] = &unk_1E5257FD8;
  v24[4] = *(void *)(a1 + 40);
  dispatch_async(v22, v24);
}

- (void)__resolveWithFlags:(uint64_t)a3 resultArray:(uint64_t)a4 handler:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void *)(a1 + 24);
  if (v7) {
    uint64_t v8 = *(void **)(v7 + 8);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = (const char *)[v8 UTF8String];
  if (v9)
  {
    int v10 = v9;
    if ((a2 & 4) == 0 || inet_pton(30, v9, v32) == 1 || inet_pton(2, v10, v32) == 1)
    {
      int v30 = 0;
      memset(&v31, 0, sizeof(v31));
      v31.ai_socktype = 1;
      v31.ai_flags = a2;
      if (!getaddrinfo(v10, 0, &v31, &v30))
      {
        v11 = dispatch_group_create();
        for (i = v30; i; i = i->ai_next)
        {
          ai_addr = i->ai_addr;
          int sa_family = ai_addr->sa_family;
          if (sa_family == 30 || sa_family == 2)
          {
            int sa_len = ai_addr->sa_len;
            global_queue = dispatch_get_global_queue(0, 2uLL);
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke;
            v28[3] = &unk_1E52552A8;
            int v29 = sa_len;
            v28[4] = v11;
            v28[5] = a1;
            v28[6] = a4;
            v28[7] = i;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_4;
            block[3] = &unk_1E5258028;
            block[4] = a1;
            block[5] = v28;
            dispatch_group_async(v11, global_queue, block);
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_5;
            v26[3] = &unk_1E5258028;
            v26[4] = a1;
            v26[5] = v28;
            dispatch_group_async(v11, global_queue, v26);
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_6;
            v25[3] = &unk_1E5258028;
            v25[4] = a1;
            v25[5] = v28;
            dispatch_group_async(v11, global_queue, v25);
            if (i->ai_canonname)
            {
              uint64_t v18 = *(void *)(a1 + 24);
              if (v18) {
                v19 = *(NSObject **)(v18 + 32);
              }
              else {
                v19 = 0;
              }
              v24[0] = MEMORY[0x1E4F143A8];
              v24[1] = 3221225472;
              v24[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_7;
              v24[3] = &unk_1E5258250;
              v24[4] = a1;
              void v24[5] = i;
              dispatch_group_async(v11, v19, v24);
            }
          }
        }
        dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v11);
        freeaddrinfo(v30);
        uint64_t v20 = *(void *)(a1 + 24);
        if (v20) {
          uint64_t v21 = *(NSObject **)(v20 + 32);
        }
        else {
          uint64_t v21 = 0;
        }
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_8;
        v23[3] = &unk_1E5257FB0;
        v23[4] = a3;
        v23[5] = v8;
        dispatch_sync(v21, v23);
      }
    }
  }
}

uint64_t __18__NSHost_resolve___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__NSHost_resolveCurrentHostWithHandler___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  bzero(v20, 0x401uLL);
  if (!getnameinfo(*(const sockaddr **)(*(void *)(a1 + 72) + 24), *(_DWORD *)(a1 + 80), v20, 0x401u, 0, 0, a3))
  {
    if ((a3 & 4) == 0 || (*(_DWORD *)v20 == 809002342 ? (BOOL v8 = v21 == 14906) : (BOOL v8 = 0), !v8))
    {
      uint64_t v9 = (void *)[NSString stringWithUTF8String:v20];
      if (([v9 isEqualToString:@"localhost"] & 1) == 0)
      {
        if (v9)
        {
          int v10 = *(NSObject **)(a1 + 32);
          uint64_t v11 = *(void *)(a1 + 40);
          if (v11 && (uint64_t v12 = *(void *)(v11 + 24)) != 0) {
            v13 = *(NSObject **)(v12 + 32);
          }
          else {
            v13 = 0;
          }
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          long long v14 = *(_OWORD *)(a1 + 48);
          long long v17 = *(_OWORD *)(a1 + 64);
          v15[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_2;
          v15[3] = &unk_1E52552D0;
          v15[4] = a2;
          v15[5] = v9;
          v15[6] = v11;
          long long v16 = v14;
          int v18 = a3;
          int v19 = a4;
          dispatch_group_async(v10, v13, v15);
        }
      }
    }
  }
}

uint64_t __40__NSHost_resolveCurrentHostWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16), 2, 1);
}

uint64_t __40__NSHost_resolveCurrentHostWithHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8), 4, 0);
}

uint64_t __40__NSHost_resolveCurrentHostWithHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8), 5, 0);
}

uint64_t __40__NSHost_resolveCurrentHostWithHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  bzero(v6, 0x401uLL);
  if (!gethostname(v6, 0x401uLL))
  {
    uint64_t v3 = [NSString stringWithUTF8String:v6];
    if (v3)
    {
      uint64_t v4 = v3;
      if (([*(id *)(*(void *)(a1 + 32) + 8) containsObject:v3] & 1) == 0)
      {
        uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
        ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        objc_msgSend(v5, "insertObject:atIndex:", v4);
      }
    }
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) containsObject:@"localhost"];
  if ((result & 1) == 0) {
    return [*(id *)(*(void *)(a1 + 32) + 8) addObject:@"localhost"];
  }
  return result;
}

void __40__NSHost_resolveCurrentHostWithHandler___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v2 = *(unsigned char **)(*(void *)(a1 + 80) + 8);
    if (*v2 == 108 && v2[1] == 111)
    {
      [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = 64;
      if ((*(_DWORD *)(a1 + 88) & 4) == 0) {
        uint64_t v5 = 72;
      }
      ++*(void *)(*(void *)(*(void *)(a1 + v5) + 8) + 24);
      objc_msgSend(v3, "insertObject:atIndex:", v4);
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 && (uint64_t v7 = *(void *)(v6 + 24)) != 0) {
    BOOL v8 = *(NSObject **)(v7 + 40);
  }
  else {
    BOOL v8 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_3;
  block[3] = &unk_1E52554F8;
  uint64_t v9 = *(void *)(a1 + 56);
  int v11 = *(_DWORD *)(a1 + 92);
  block[4] = *(void *)(a1 + 40);
  block[5] = v9;
  dispatch_async(v8, block);
}

uint64_t __40__NSHost_resolveCurrentHostWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
}

void __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  bzero(v17, 0x401uLL);
  if (!getnameinfo(*(const sockaddr **)(*(void *)(a1 + 56) + 32), *(_DWORD *)(a1 + 64), v17, 0x401u, 0, 0, a3))
  {
    uint64_t v8 = [NSString stringWithUTF8String:v17];
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = *(NSObject **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11 && (uint64_t v12 = *(void *)(v11 + 24)) != 0) {
        v13 = *(NSObject **)(v12 + 32);
      }
      else {
        v13 = 0;
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_2;
      v15[3] = &unk_1E5255280;
      v15[4] = a2;
      v15[5] = v9;
      uint64_t v14 = *(void *)(a1 + 48);
      v15[6] = v11;
      void v15[7] = v14;
      int v16 = a4;
      dispatch_group_async(v10, v13, v15);
    }
  }
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16), 2, 1);
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8), 4, 0);
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8), 5, 0);
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_7(uint64_t a1)
{
  uint64_t result = [NSString stringWithUTF8String:*(void *)(*(void *)(a1 + 40) + 24)];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) containsObject:result];
    if ((result & 1) == 0)
    {
      uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
      return [v4 addObject:v3];
    }
  }
  return result;
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_8(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)(id)[*(id *)(a1 + 40) copyWithZone:0];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void **)(a1 + 32);
      return [v4 addObject:v3];
    }
  }
  return result;
}

void __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) containsObject:*(void *)(a1 + 40)] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 24)) != 0) {
    uint64_t v4 = *(NSObject **)(v3 + 40);
  }
  else {
    uint64_t v4 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_3;
  block[3] = &unk_1E52554F8;
  uint64_t v5 = *(void *)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 64);
  block[4] = *(void *)(a1 + 40);
  block[5] = v5;
  dispatch_async(v4, block);
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
}

- (NSString)address
{
  -[NSHost blockingResolveUntil:]((uint64_t)self, 1);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__8863;
  uint64_t v12 = __Block_byref_object_dispose__8864;
  uint64_t v13 = 0;
  if (self && (id reserved = self->reserved) != 0) {
    uint64_t v4 = *((void *)reserved + 4);
  }
  else {
    uint64_t v4 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __17__NSHost_address__block_invoke;
  v7[3] = &unk_1E5255320;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);
  uint64_t v5 = (NSString *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __17__NSHost_address__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndex:0];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSArray)names
{
  return self->names;
}

- (NSString)name
{
  -[NSHost blockingResolveUntil:]((uint64_t)self, 0);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__8863;
  uint64_t v12 = __Block_byref_object_dispose__8864;
  uint64_t v13 = 0;
  if (self && (id reserved = self->reserved) != 0) {
    uint64_t v4 = *((void *)reserved + 4);
  }
  else {
    uint64_t v4 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __14__NSHost_name__block_invoke;
  v7[3] = &unk_1E5255320;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);
  uint64_t v5 = (NSString *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __14__NSHost_name__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:0];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)isEqualToHost:(NSHost *)aHost
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!aHost)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  if (aHost == self) {
    goto LABEL_12;
  }
  uint64_t v4 = [(NSHost *)aHost addresses];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSHost *)self addresses];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([(NSArray *)v4 containsObject:*(void *)(*((void *)&v11 + 1) + 8 * v9)]) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        LOBYTE(v6) = 0;
        if (v7) {
          goto LABEL_5;
        }
        return v6;
      }
    }
LABEL_12:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)_thingToResolve
{
  if (self)
  {
    uint64_t v2 = *((void *)self + 3);
    if (v2) {
      return *(id *)(v2 + 8);
    }
    else {
      return 0;
    }
  }
  return self;
}

+ (BOOL)isHostCacheEnabled
{
  return 0;
}

+ (NSHost)hostWithAddress:(NSString *)address
{
  uint64_t v3 = -[NSHost initToResolve:as:](objc_allocWithZone((Class)a1), address, 2);

  return (NSHost *)v3;
}

- (void)initToResolve:(int)a3 as:
{
  if (!a1) {
    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)NSHost;
  uint64_t v5 = objc_msgSendSuper2(&v14, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_alloc_init(__NSHostExtraIvars);
    objc_setProperty_nonatomic(v5, v7, v6, 24);
    int v9 = [a2 isEqualToString:&stru_1ECFAD558];
    uint64_t v10 = (void *)v5[3];
    if (v10)
    {
      if (v9) {
        long long v11 = 0;
      }
      else {
        long long v11 = a2;
      }
      objc_setProperty_nonatomic(v10, v8, v11, 8);
      uint64_t v12 = v5[3];
      if (v12) {
        *(_DWORD *)(v12 + 16) = a3;
      }
    }
  }
  return v5;
}

+ (NSHost)hostWithName:(NSString *)name
{
  uint64_t v3 = -[NSHost initToResolve:as:](objc_allocWithZone((Class)a1), name, 1);

  return (NSHost *)v3;
}

+ (NSHost)currentHost
{
  uint64_t v2 = -[NSHost initToResolve:as:](objc_allocWithZone((Class)a1), 0, 0);

  return (NSHost *)v2;
}

@end