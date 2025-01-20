double gfxInitializeBufferState(uint64_t a1)
{
  double result;

  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 24) = -2001041180;
  *(void *)&result = 0x10000000100;
  *(_DWORD *)(a1 + 28) = 256;
  *(_DWORD *)(a1 + 32) = -1;
  *(_WORD *)(a1 + 36) = 0;
  return result;
}

uint64_t gfxInitializeBufferObject(uint64_t result, int a2)
{
  *(void *)(result + 152) = 0;
  *(_DWORD *)(result + 160) = 0;
  *(void *)(result + 232) = 0;
  *(void *)(result + 240) = 0;
  *(void *)(result + 245) = 0;
  *(_WORD *)(result + 254) = 1;
  *(_DWORD *)(result + 256) = 16843009;
  *(_OWORD *)result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 80) = 0u;
  if (a2 >= 1)
  {
    uint64_t v2 = a2;
    v3 = (unsigned char *)(result + 268);
    do
    {
      *((_DWORD *)v3 - 1) = -1;
      unsigned char *v3 = 0;
      v3 += 8;
      --v2;
    }
    while (v2);
  }
  *(void *)(result + 96) = 0;
  *(void *)(result + 104) = 0;
  *(void *)(result + 112) = 0;
  *(_DWORD *)(result + 120) = -2001041180;
  *(_DWORD *)(result + 124) = 256;
  *(_DWORD *)(result + 128) = -1;
  *(_WORD *)(result + 132) = 0;
  *(_OWORD *)(result + 168) = 0uLL;
  *(_OWORD *)(result + 184) = 0uLL;
  *(_DWORD *)(result + 200) = -2001041180;
  *(_DWORD *)(result + 204) = 256;
  *(_DWORD *)(result + 208) = -1;
  *(_WORD *)(result + 212) = 0;
  return result;
}

uint64_t gfxWaitPluginBuffer(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + 320))
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    uint64_t v5 = result + 360;
    do
    {
      result = (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)v5 + 1344))(*(void *)(v5 - 8), 3, 0, *(void *)(a2 + 8 * v4++));
      v5 += 32;
    }
    while (v4 < *(unsigned __int8 *)(v3 + 320));
  }
  return result;
}

uint64_t gfxWaitBufferOnDevices(uint64_t result, uint64_t a2, unsigned int a3)
{
  unsigned int v3 = *(unsigned __int8 *)(result + 320);
  if (*(unsigned char *)(result + 320))
  {
    uint64_t v5 = result;
    unint64_t v6 = 0;
    uint64_t v7 = a3;
    uint64_t v8 = result + 360;
    do
    {
      if (v7 != v6)
      {
        result = (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)v8 + 1344))(*(void *)(v8 - 8), 3, 0, *(void *)(a2 + 8 * v6));
        unsigned int v3 = *(unsigned __int8 *)(v5 + 320);
      }
      ++v6;
      v8 += 32;
    }
    while (v6 < v3);
  }
  return result;
}

uint64_t gfxCreatePluginBuffer(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + 320))
  {
    uint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = 0;
    uint64_t v5 = a2 + 96;
    uint64_t v6 = result + 360;
    do
    {
      result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)v6 + 1464))(*(void *)(v6 - 8), v2, v5, v2 + 264);
      ++v4;
      v2 += 8;
      v6 += 32;
    }
    while (v4 < *(unsigned __int8 *)(v3 + 320));
  }
  return result;
}

uint64_t gfxDestroyPluginBuffer(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(result + 320);
  if (*(unsigned char *)(result + 320))
  {
    uint64_t v4 = result;
    unint64_t v5 = 0;
    uint64_t v6 = result + 360;
    do
    {
      if (*(void *)(a2 + 8 * v5))
      {
        result = (*(uint64_t (**)(void))(*(void *)v6 + 1520))(*(void *)(v6 - 8));
        *(void *)(a2 + 8 * v5) = 0;
        unsigned int v2 = *(unsigned __int8 *)(v4 + 320);
      }
      ++v5;
      v6 += 32;
    }
    while (v5 < v2);
  }
  return result;
}

uint64_t gfxFreeBufferObjectStorage(uint64_t a1, uint64_t a2)
{
  return mach_vm_deallocate(*MEMORY[0x263EF8960], *(void *)(a2 + 96), *(void *)(a2 + 104));
}

uint64_t gfxUploadPluginBufferData(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 != -1)
  {
    result = (*(uint64_t (**)(void, void, uint64_t))(*(void *)(result + 32 * a3 + 360) + 1496))(*(void *)(result + 32 * a3 + 352), *(void *)(a2 + 8 * a3), a4);
    *(unsigned char *)(a2 + 127) = 1;
  }
  return result;
}

uint64_t gfxInitializeLibrary(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t a6, uint64_t a7)
{
  v79[33] = *MEMORY[0x263EF8340];
  unint64_t v8 = 0x26ACCC000uLL;
  gfx_io_data_0 = a3;
  unint64_t v9 = 0x26ACCC000uLL;
  gfx_io_data_1 = a1;
  gfx_io_data_2 = a2;
  if (a4) {
    gfx_io_data_3 = a4;
  }
  if (a5) {
    gfx_io_data_4 = a5;
  }
  if (a6) {
    gfx_io_data_5 = a6;
  }
  os_unfair_lock_lock(&gfx_initialize_lock);
  if (gfx_ref_count++) {
    goto LABEL_8;
  }
  if (!(_BYTE)a7) {
    a7 = gfxLinkedOSVersion() | a7;
  }
  memset(v79, 0, 256);
  memset(v78, 0, sizeof(v78));
  unsigned int v74 = a7;
  if (gfx_io_data_0)
  {
    unint64_t v12 = 0;
    int v13 = 0;
    unsigned int v14 = 0;
    CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    while (1)
    {
      uint64_t v16 = v14;
      v17 = *(int **)(v9 + 1048);
      io_registry_entry_t v18 = v17[v12];
      if (!v18) {
        goto LABEL_49;
      }
      if (v16)
      {
        v19 = v78;
        v20 = v79;
        uint64_t v21 = v16;
        while (1)
        {
          int v22 = *v17++;
          if (v18 == v22) {
            break;
          }
          ++v19;
          ++v20;
          if (!--v21) {
            goto LABEL_18;
          }
        }
        uint64_t v27 = *v20;
        uint64_t v28 = *v19;
        if (v27) {
          *(_DWORD *)(v27 + 1048) |= 1 << v16;
        }
        if (v28) {
          *(_DWORD *)(v28 + 20) |= 1 << v16;
        }
        goto LABEL_49;
      }
LABEL_18:
      CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v18, @"IOGLESBundleName", v15, 0);
      CFStringRef v24 = (const __CFString *)IORegistryEntryCreateCFProperty(*(_DWORD *)(*(void *)(v9 + 1048) + 4 * v12), @"IOGLESMetalBundleName", v15, 0);
      if (v24) {
        break;
      }
      if (!CFProperty)
      {
        a7 = v74;
        if ((v74 & 0x80000000) != 0) {
          goto LABEL_57;
        }
LABEL_54:
        if ((a7 & 0x40000000) == 0)
        {
          gfx_io_data_3 = gfxGetSurfaceProperties;
          gfx_io_data_4 = gfxGetNewSurface;
        }
        goto LABEL_74;
      }
LABEL_35:
      CStringPtr = CFStringGetCStringPtr(CFProperty, 0);
      if (CStringPtr)
      {
        v34 = CStringPtr;
        v35 = 0;
      }
      else
      {
        CFIndex v36 = CFStringGetLength(CFProperty) + 1;
        v37 = (char *)malloc_type_malloc(v36, 0xDCD90CA9uLL);
        if (!v37) {
          abort();
        }
        v34 = v37;
        CFStringGetCString(CFProperty, v37, v36, 0);
        v35 = (char *)v34;
      }
      snprintf((char *)keyExistsAndHasValidFormat, 0x400uLL, "/System/Library/Extensions/%s.bundle", v34);
      if (snprintf(__str, 0x400uLL, "%s/%s", (const char *)keyExistsAndHasValidFormat, v34) <= 1023)
      {
        gfxAddDevice();
        uint64_t v39 = v38;
        int v40 = 1 << v16;
        *(_DWORD *)(v38 + 20) = 1 << v16;
        v41 = &gfx_plugin_head;
        while (1)
        {
          v41 = (uint64_t *)*v41;
          if (!v41) {
            break;
          }
          if (!strcmp(__str, (const char *)v41 + 8))
          {
            *((_DWORD *)v41 + 262) |= v40;
            goto LABEL_46;
          }
        }
        gfxAddPlugin();
        v41 = v42;
        __strcpy_chk();
        *((_DWORD *)v41 + 262) = v40;
LABEL_46:
        *(void *)(v39 + 8) = v41;
        v78[v12] = v39;
        v79[v12] = v41;
        unint64_t v9 = 0x26ACCC000;
        if (v35) {
          free(v35);
        }
        CFRelease(CFProperty);
        a7 = v74;
        unint64_t v8 = 0x26ACCC000uLL;
LABEL_49:
        v13 |= 1 << v16;
        goto LABEL_50;
      }
      a7 = v74;
      unint64_t v8 = 0x26ACCC000;
LABEL_50:
      unint64_t v12 = (v16 + 1);
      unsigned int v14 = v16 + 1;
      if (*(void *)(v8 + 1040) <= v12) {
        goto LABEL_53;
      }
    }
    CFStringRef v25 = v24;
    if (!CFProperty)
    {
      CFStringRef CFProperty = v24;
      goto LABEL_35;
    }
    keyExistsAndHasValidFormat[0] = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UseMetal", @"com.apple.opengl", keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat[0])
    {
      if (!AppBooleanValue)
      {
LABEL_33:
        CFStringRef v32 = v25;
        goto LABEL_34;
      }
    }
    else
    {
      CFBooleanRef v29 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(*(_DWORD *)(*(void *)(v9 + 1048) + 4 * v12), @"IOGLESDefaultUseMetal", v15, 0);
      if (!v29) {
        goto LABEL_33;
      }
      CFBooleanRef v30 = v29;
      int Value = CFBooleanGetValue(v29);
      CFRelease(v30);
      if (!Value) {
        goto LABEL_33;
      }
    }
    CFStringRef v32 = CFProperty;
    CFStringRef CFProperty = v25;
LABEL_34:
    CFRelease(v32);
    goto LABEL_35;
  }
  int v13 = 0;
LABEL_53:
  if ((a7 & 0x80000000) == 0) {
    goto LABEL_54;
  }
LABEL_57:
  v75 = 0;
  v43 = getenv("GL_RESOURCES");
  if (v43) {
    goto LABEL_115;
  }
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.opengles");
  if (BundleWithIdentifier)
  {
    CFURLRef v55 = CFBundleCopyResourcesDirectoryURL(BundleWithIdentifier);
    if (v55)
    {
      CFURLRef v56 = v55;
      CFURLRef v57 = CFURLCopyAbsoluteURL(v55);
      CFRelease(v56);
      if (v57)
      {
        CFStringRef v58 = CFURLCopyFileSystemPath(v57, kCFURLPOSIXPathStyle);
        CFRelease(v57);
        if (v58)
        {
          v43 = (const char *)keyExistsAndHasValidFormat;
          int CString = CFStringGetCString(v58, (char *)keyExistsAndHasValidFormat, 1024, 0x600u);
          CFRelease(v58);
          if (CString)
          {
LABEL_115:
            int v44 = scandir(v43, &v75, 0, 0);
            if (v44 >= 1)
            {
              unint64_t v45 = 0;
              if (v13) {
                int v46 = v13;
              }
              else {
                int v46 = -1;
              }
              uint64_t v47 = 8 * v44;
              while (1)
              {
                v48 = v75[v45 / 8];
                if (strncmp(v48->d_name, "GLRendererFloat", 0xFuLL)) {
                  goto LABEL_66;
                }
                gfxAddPlugin();
                uint64_t v50 = v49;
                gfxAddDevice();
                uint64_t v52 = v51;
                *(void *)(v51 + 8) = v50;
                unsigned int v53 = snprintf(__str, 0x400uLL, "%s/%s/%s", v43, v75[v45 / 8]->d_name, v75[v45 / 8]->d_name);
                if (v53 <= 0x406) {
                  break;
                }
LABEL_67:
                v45 += 8;
                if (v47 == v45)
                {
                  free(v75);
                  a7 = v74;
                  goto LABEL_74;
                }
              }
              __str[v53 - 7] = 0;
              strncpy((char *)(v50 + 8), __str, 0x400uLL);
              *(_DWORD *)(v50 + 1048) = v46;
              *(_DWORD *)(v52 + 16) = 0x1000000;
              *(_DWORD *)(v52 + 20) = v46;
              v48 = v75[v45 / 8];
LABEL_66:
              free(v48);
              goto LABEL_67;
            }
          }
        }
      }
    }
  }
LABEL_74:
  for (uint64_t i = gfx_plugin_head; i; uint64_t i = gfxDeletePlugin((uint64_t *)i))
  {
LABEL_75:
    v61 = dlopen((const char *)(i + 8), 5);
    *(void *)(i + 1032) = v61;
    if (v61)
    {
      v62 = (void (*)(uint64_t, uint64_t, void, uint64_t (*)(), uint64_t (*)(), uint64_t))dlsym(v61, "gldInitializeLibrary");
      if (v62)
      {
        v62(gfx_io_data_1, gfx_io_data_2, *(unsigned int *)(i + 1048), gfxIODataGetSurfaceProperties, gfxIODataGetNewSurface, a7);
        uint64_t v63 = gfx_plugin_head;
        v64 = dlsym(*(void **)(i + 1032), "gldGetVersion");
        if (v64)
        {
          *(_DWORD *)keyExistsAndHasValidFormat = 0;
          *(_DWORD *)__str = 0;
          LODWORD(v79[0]) = 0;
          LODWORD(v78[0]) = 0;
          if (((unsigned int (*)(Boolean *, char *, void *, void *))v64)(keyExistsAndHasValidFormat, __str, v79, v78))
          {
            __int16 v65 = v78[0];
            if ((v78[0] & 0xFFFF00FF) == 0
              && *(_DWORD *)keyExistsAndHasValidFormat == 4
              && *(_DWORD *)__str == 1
              && LODWORD(v79[0]) == 16)
            {
              int v67 = LODWORD(v78[0]) | 0x20000;
              if (v63)
              {
                while (v67 != *(_DWORD *)(v63 + 1040))
                {
                  uint64_t v63 = *(void *)v63;
                  if (!v63) {
                    goto LABEL_95;
                  }
                }
              }
              else
              {
LABEL_95:
                *(_DWORD *)(i + 1040) = v67;
                if ((v65 & 0x7F00) == 0x400) {
                  gfx_float_device_id = v65 & 0xFF00 | 0x1020000;
                }
                uint64_t v68 = 0;
                while (1)
                {
                  v69 = dlsym(*(void **)(i + 1032), gfx_gld_names[v68]);
                  *(void *)(i + v68 * 8 + 1056) = v69;
                  if (!v69) {
                    break;
                  }
                  if (++v68 == 129)
                  {
                    uint64_t i = *(void *)i;
                    if (i) {
                      goto LABEL_75;
                    }
                    goto LABEL_101;
                  }
                }
              }
            }
          }
        }
        gfxPluginDisconnect(i);
      }
      else
      {
        dlclose(*(void **)(i + 1032));
        *(void *)(i + 1032) = 0;
      }
    }
    v66 = (uint64_t *)gfx_device_head;
    if (gfx_device_head)
    {
      do
      {
        while (v66[1] != i)
        {
          v66 = (uint64_t *)*v66;
          if (!v66) {
            goto LABEL_87;
          }
        }
        v66 = (uint64_t *)gfxDeleteDevice(v66);
      }
      while (v66);
    }
LABEL_87:
    ;
  }
LABEL_101:
  for (uint64_t j = gfx_device_head; j; uint64_t j = *(void *)j)
  {
    while (1)
    {
      uint64_t v71 = *(void *)(j + 8);
      int v72 = *(_DWORD *)(v71 + 1044) + 1;
      *(_DWORD *)(v71 + 1044) = v72;
      *(_DWORD *)(j + 16) = *(_DWORD *)(v71 + 1040) | (v72 << 24);
      if (!(*(unsigned int (**)(uint64_t, void, uint64_t))(v71 + 1064))(j + 24, *(unsigned int *)(j + 20), j + 32))break; {
      uint64_t j = gfxDeleteDevice((uint64_t *)j);
      }
      --*(_DWORD *)(v71 + 1044);
      if (!j) {
        goto LABEL_106;
      }
    }
  }
LABEL_106:
  for (uint64_t k = gfx_plugin_head; k; uint64_t k = gfxDeletePlugin((uint64_t *)k))
  {
    while (*(_DWORD *)(k + 1044))
    {
      uint64_t k = *(void *)k;
      if (!k) {
        goto LABEL_8;
      }
    }
    gfxPluginDisconnect(k);
  }
LABEL_8:
  os_unfair_lock_unlock(&gfx_initialize_lock);
  uint64_t result = gfxAnnotateAddDataSource();
  gfx_memlist_ogl_key = result;
  return result;
}

void gfxReleaseLibrary()
{
  gfxAnnotateRemoveDataSource();
  gfx_memlist_ogl_key = 0;
  os_unfair_lock_lock(&gfx_initialize_lock);
  if (!--gfx_ref_count)
  {
    v0 = (void *)gfx_device_head;
    if (gfx_device_head)
    {
      do
      {
        (*(void (**)(void))(v0[1] + 1072))(v0[3]);
        v0[3] = 0;
        v0 = (void *)*v0;
      }
      while (v0);
    }
    v1 = (void *)gfx_plugin_head;
    if (gfx_plugin_head)
    {
      do
      {
        gfxPluginDisconnect((uint64_t)v1);
        v1 = (void *)*v1;
      }
      while (v1);
      unsigned int v2 = (void *)gfx_plugin_head;
      uint64_t v3 = (void *)gfx_device_head;
      if (gfx_device_head)
      {
        do
        {
          uint64_t v4 = (void *)*v3;
          free(v3);
          uint64_t v3 = v4;
        }
        while (v4);
      }
      gfx_device_head = 0;
      if (v2)
      {
        do
        {
          unint64_t v5 = (void *)*v2;
          free(v2);
          unsigned int v2 = v5;
        }
        while (v5);
      }
      gfx_plugin_head = 0;
      gfx_float_device_id = 0;
    }
  }

  os_unfair_lock_unlock(&gfx_initialize_lock);
}

uint64_t gfxGetPlugins()
{
  return gfx_plugin_head;
}

uint64_t gfxGetDevices()
{
  return gfx_device_head;
}

uint64_t *gfxGetPluginWithDriverID(int a1)
{
  uint64_t result = &gfx_plugin_head;
  do
    uint64_t result = (uint64_t *)*result;
  while (result && *((_DWORD *)result + 260) != a1);
  return result;
}

uint64_t *gfxGetDeviceWithDeviceID(int a1)
{
  uint64_t result = &gfx_device_head;
  do
    uint64_t result = (uint64_t *)*result;
  while (result && *((_DWORD *)result + 4) != a1);
  return result;
}

uint64_t gfxLoadPluginData()
{
  return 0;
}

uint64_t gfxDeleteDevice(uint64_t *a1)
{
  v1 = (uint64_t *)gfx_device_head;
  if ((uint64_t *)gfx_device_head == a1)
  {
    uint64_t v3 = *a1;
    gfx_device_head = *a1;
LABEL_6:
    free(a1);
  }
  else
  {
    while (v1)
    {
      unsigned int v2 = v1;
      v1 = (uint64_t *)*v1;
      if (v1 == a1)
      {
        uint64_t v3 = *a1;
        *unsigned int v2 = *a1;
        goto LABEL_6;
      }
    }
    return 0;
  }
  return v3;
}

uint64_t gfxDeletePlugin(uint64_t *a1)
{
  v1 = (uint64_t *)gfx_plugin_head;
  if ((uint64_t *)gfx_plugin_head == a1)
  {
    uint64_t v3 = *a1;
    gfx_plugin_head = *a1;
LABEL_6:
    free(a1);
  }
  else
  {
    while (v1)
    {
      unsigned int v2 = v1;
      v1 = (uint64_t *)*v1;
      if (v1 == a1)
      {
        uint64_t v3 = *a1;
        *unsigned int v2 = *a1;
        goto LABEL_6;
      }
    }
    return 0;
  }
  return v3;
}

void *gfxPluginDisconnect(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 1032);
  if (result)
  {
    uint64_t v3 = (void (*)(void))dlsym(result, "gldTerminateLibrary");
    if (v3) {
      v3();
    }
    uint64_t result = (void *)dlclose(*(void **)(a1 + 1032));
    *(void *)(a1 + 1032) = 0;
  }
  return result;
}

double gfxAddDevice()
{
  v0 = &gfx_device_head;
  do
  {
    v1 = v0;
    v0 = (uint64_t *)*v0;
  }
  while (v0);
  unsigned int v2 = malloc_type_malloc(0x1B0uLL, 0xDCD90CA9uLL);
  if (!v2) {
    abort();
  }
  uint64_t *v1 = (uint64_t)v2;
  double result = 0.0;
  v2[25] = 0u;
  v2[26] = 0u;
  v2[23] = 0u;
  v2[24] = 0u;
  v2[21] = 0u;
  v2[22] = 0u;
  v2[19] = 0u;
  v2[20] = 0u;
  v2[17] = 0u;
  v2[18] = 0u;
  v2[15] = 0u;
  v2[16] = 0u;
  v2[13] = 0u;
  v2[14] = 0u;
  v2[11] = 0u;
  v2[12] = 0u;
  v2[9] = 0u;
  v2[10] = 0u;
  v2[7] = 0u;
  v2[8] = 0u;
  v2[5] = 0u;
  v2[6] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  *unsigned int v2 = 0u;
  return result;
}

double gfxAddPlugin()
{
  v0 = &gfx_plugin_head;
  do
  {
    v1 = v0;
    v0 = (uint64_t *)*v0;
  }
  while (v0);
  unsigned int v2 = (char *)malloc_type_malloc(0x828uLL, 0xDCD90CA9uLL);
  if (!v2) {
    abort();
  }
  uint64_t *v1 = (uint64_t)v2;
  *(void *)unsigned int v2 = 0;
  v2[8] = 0;
  double result = 0.0;
  *(_OWORD *)(v2 + 1032) = 0u;
  *((_DWORD *)v2 + 262) = 0;
  return result;
}

uint64_t gfxGetSurfaceProperties()
{
  return 0;
}

uint64_t gfxGetNewSurface()
{
  return 0;
}

uint64_t gfxIODataGetSurfaceProperties()
{
  if (gfx_io_data_3) {
    return gfx_io_data_3();
  }
  else {
    return 0;
  }
}

uint64_t gfxIODataGetNewSurface()
{
  if (gfx_io_data_4) {
    return gfx_io_data_4();
  }
  else {
    return 0;
  }
}

void *gfxLibAlloc(size_t a1)
{
  double result = malloc_type_malloc(a1, 0xDCD90CA9uLL);
  if (!result) {
    abort();
  }
  return result;
}

void *gfxLibCalloc(size_t a1, size_t a2)
{
  double result = malloc_type_calloc(a1, a2, 0x72067134uLL);
  if (!result) {
    abort();
  }
  return result;
}

uint64_t *GetShareList()
{
  return &gSharedList;
}

uint64_t InitSharedListOnce()
{
  return pthread_mutex_init(&stru_26ACCC460, 0);
}

void *gfxCreateSharedState(uint64_t a1, int a2, char a3)
{
  uint64_t v6 = (char *)malloc_type_calloc(1uLL, 32 * a2 + 352, 0x72067134uLL);
  if (!v6) {
    goto LABEL_19;
  }
  uint64_t v7 = v6;
  if (a2 >= 1)
  {
    uint64_t v8 = 0;
    unint64_t v9 = v6 + 352;
    while (1)
    {
      uint64_t v10 = a1 + 4 * v8;
      *((_DWORD *)v9 + 6) = *(_DWORD *)v10;
      PluginWithDriverID = gfxGetPluginWithDriverID(*(unsigned __int16 *)(v10 + 1) << 8);
      *((void *)v9 + 1) = PluginWithDriverID;
      if (!PluginWithDriverID) {
        break;
      }
      DeviceWithDeviceID = gfxGetDeviceWithDeviceID(*(_DWORD *)(a1 + 4 * v8) & 0xFFFFFF00);
      *((void *)v9 + 2) = DeviceWithDeviceID;
      if (!DeviceWithDeviceID
        || (*(unsigned int (**)(uint64_t, char *, uint64_t))(*((void *)v9 + 1) + 1144))(DeviceWithDeviceID[3], v9, 4))
      {
        break;
      }
      ++v8;
      v9 += 32;
      if (a2 == v8) {
        goto LABEL_16;
      }
    }
    if (a2 != v8)
    {
      if ((int)v8 >= 1)
      {
        unint64_t v13 = v8 + 1;
        do
        {
          (*(void (**)(void))(v7[4 * (v13 - 2) + 45] + 1152))(v7[4
                                                                                            * (v13 - 2)
                                                                                            + 44]);
          --v13;
        }
        while (v13 > 1);
      }
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (!a2)
  {
LABEL_16:
    *((unsigned char *)v7 + 320) = a2;
    *(void *)((char *)v7 + 308) = 0;
    *(void *)((char *)v7 + 300) = 0;
    *((unsigned char *)v7 + 344) = v7[43] & 0xE0 | (8 * (a3 & 1));
    *((_DWORD *)v7 + 74) = 0;
    *uint64_t v7 = 0;
    *((_DWORD *)v7 + 79) = 0;
    *((_WORD *)v7 + 173) = 0;
    *((_DWORD *)v7 + 85) = 0;
    *(void *)((char *)v7 + 332) = 0;
    *(void *)((char *)v7 + 324) = 0;
    pthread_once(&GetShareList_once, (void (*)(void))InitSharedListOnce);
    pthread_mutex_lock(&stru_26ACCC460);
    unsigned int v14 = malloc_type_malloc(0x10uLL, 0xDCD90CA9uLL);
    if (v14)
    {
      uint64_t v15 = gSharedList;
      *unsigned int v14 = v7;
      v14[1] = v15;
      gSharedList = (uint64_t)v14;
      pthread_mutex_unlock(&stru_26ACCC460);
      return v7;
    }
LABEL_19:
    abort();
  }
LABEL_15:
  free(v7);
  return 0;
}

uint64_t gfxGetPluginCountForShared(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 320);
}

uint64_t gfxGetPluginsForShared(uint64_t a1)
{
  return a1 + 352;
}

uint64_t gfxGetGLDShareGroupForDeviceID(uint64_t a1, int a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 320);
  if (!*(unsigned char *)(a1 + 320)) {
    return 0;
  }
  for (uint64_t i = (_DWORD *)(a1 + 352); i[6] != (a2 & 0xFFFFFF00); i += 8)
  {
    if (!--v2) {
      return 0;
    }
  }
  return *(void *)i;
}

BOOL gfxCompareSharedState(uint64_t a1, uint64_t a2, int a3)
{
  if (*(unsigned __int8 *)(a1 + 320) != a3) {
    return 0;
  }
  if (a3 < 1)
  {
    LODWORD(v3) = 0;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = (unsigned int *)(a1 + 376);
    while (1)
    {
      unsigned int v5 = *v4;
      v4 += 8;
      if ((v5 ^ *(_DWORD *)(a2 + 4 * v3)) > 0xFF) {
        break;
      }
      if (a3 == ++v3)
      {
        LODWORD(v3) = a3;
        return v3 == a3;
      }
    }
  }
  return v3 == a3;
}

uint64_t gfxSetSharedFreeFunc(uint64_t result, unsigned int a2, uint64_t a3)
{
  *(void *)(result + 32 * a2 + 8) = a3;
  return result;
}

uint64_t gfxSetShaderDetachFunc(uint64_t result, uint64_t a2)
{
  *(void *)(result + 328) = a2;
  return result;
}

void gfxDestroySharedState(uint64_t a1)
{
  pthread_once(&GetShareList_once, (void (*)(void))InitSharedListOnce);
  pthread_mutex_lock(&stru_26ACCC460);
  uint64_t v2 = gSharedList;
  if (gSharedList)
  {
    if (*(void *)gSharedList == a1)
    {
      uint64_t v3 = (void *)gSharedList;
      uint64_t v4 = gSharedList;
LABEL_7:
      if ((void *)v4 == v3) {
        unsigned int v5 = &gSharedList;
      }
      else {
        unsigned int v5 = (uint64_t *)(v4 + 8);
      }
      *unsigned int v5 = v3[1];
      free(v3);
    }
    else
    {
      while (1)
      {
        uint64_t v3 = *(void **)(v2 + 8);
        if (!v3) {
          break;
        }
        uint64_t v4 = v2;
        uint64_t v2 = *(void *)(v2 + 8);
        if (*v3 == a1) {
          goto LABEL_7;
        }
      }
    }
  }
  pthread_mutex_unlock(&stru_26ACCC460);
  uint64_t v6 = *(const void **)(a1 + 336);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 336) = 0;
  }
  if (*(unsigned char *)(a1 + 320))
  {
    unint64_t v7 = 0;
    uint64_t v8 = a1 + 360;
    do
    {
      (*(void (**)(void))(*(void *)v8 + 1152))(*(void *)(v8 - 8));
      ++v7;
      v8 += 32;
    }
    while (v7 < *(unsigned __int8 *)(a1 + 320));
  }

  free((void *)a1);
}

void gfxRetainSharedState(os_unfair_lock_s *a1)
{
  uint64_t v2 = a1 + 81;
  os_unfair_lock_lock(a1 + 81);
  ++a1[75]._os_unfair_lock_opaque;

  os_unfair_lock_unlock(v2);
}

void gfxRetainSharedStateAndHash(os_unfair_lock_s *a1, int a2)
{
  uint64_t v4 = a1 + 81;
  os_unfair_lock_lock(a1 + 81);
  ++a1[75]._os_unfair_lock_opaque;
  if (a2) {
    ++a1[78]._os_unfair_lock_opaque;
  }
  uint32_t os_unfair_lock_opaque = a1[77]._os_unfair_lock_opaque;
  a1[77]._uint32_t os_unfair_lock_opaque = os_unfair_lock_opaque + 1;
  if (!os_unfair_lock_opaque)
  {
    for (uint64_t i = 0; i != 72; i += 8)
    {
      unint64_t v7 = malloc_type_calloc(1uLL, 0x200uLL, 0x72067134uLL);
      if (!v7) {
        abort();
      }
      uint64_t v8 = &a1[i];
      *(void *)&v8[8]._uint32_t os_unfair_lock_opaque = 63;
      *(void *)&v8[4]._uint32_t os_unfair_lock_opaque = v7;
      *(void *)&v8[6]._uint32_t os_unfair_lock_opaque = 0;
      *(void *)&v8[2]._uint32_t os_unfair_lock_opaque = 0;
    }
  }

  os_unfair_lock_unlock(v4);
}

void gfxReleaseSharedState(os_unfair_lock_s *a1)
{
  uint64_t v2 = a1 + 81;
  os_unfair_lock_lock(a1 + 81);
  uint32_t os_unfair_lock_opaque = a1[75]._os_unfair_lock_opaque;
  a1[75]._uint32_t os_unfair_lock_opaque = os_unfair_lock_opaque - 1;
  os_unfair_lock_unlock(v2);
  if (os_unfair_lock_opaque == 1)
  {
    gfxDestroySharedState((uint64_t)a1);
  }
}

void gfxReleaseSharedStateAndHash(uint64_t a1, int a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 324);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 324));
  if (a2) {
    --*(_DWORD *)(a1 + 312);
  }
  int v5 = *(_DWORD *)(a1 + 308) - 1;
  *(_DWORD *)(a1 + 308) = v5;
  if (!v5)
  {
    if (*(void *)(a1 + 328))
    {
      unsigned int v6 = 0;
      unsigned int v7 = *(_DWORD *)(a1 + 192);
      do
      {
        for (uint64_t i = *(void **)(*(void *)(a1 + 176) + 8 * v6); i; uint64_t i = (void *)*i)
          (*(void (**)(uint64_t, void *))(a1 + 328))(a1, i);
        ++v6;
      }
      while (v6 <= v7);
    }
    for (uint64_t j = 0; j != 9; ++j)
    {
      uint64_t v10 = 0;
      uint64_t v11 = a1 + 32 * j;
      unint64_t v12 = (void (**)(uint64_t))(v11 + 8);
      unint64_t v13 = (void **)(v11 + 16);
      uint64_t v14 = (*(_DWORD *)(v11 + 32) + 1);
      do
      {
        uint64_t v15 = (uint64_t *)*((void *)*v13 + v10);
        if (v15)
        {
          *((void *)*v13 + v10) = 0;
          do
          {
            uint64_t v16 = (uint64_t *)*v15;
            int v17 = *((_DWORD *)v15 + 5) - 1;
            *((_DWORD *)v15 + 5) = v17;
            if (!v17) {
              (*v12)(a1);
            }
            uint64_t v15 = v16;
          }
          while (v16);
        }
        ++v10;
      }
      while (v10 != v14);
      free(*v13);
      *unint64_t v13 = 0;
      io_registry_entry_t v18 = *(void **)(a1 + 32 * j + 24);
      if (v18)
      {
        do
        {
          v19 = (void *)*v18;
          free(v18);
          io_registry_entry_t v18 = v19;
        }
        while (v19);
      }
    }
  }
  int v20 = *(_DWORD *)(a1 + 300);
  *(_DWORD *)(a1 + 300) = v20 - 1;
  os_unfair_lock_unlock(v4);
  if (v20 == 1)
  {
    gfxDestroySharedState(a1);
  }
}

uint64_t gfxFindGFXTextureForName(uint64_t a1, int a2)
{
  if (!*(void *)(a1 + 80)) {
    return 0;
  }
  int v4 = *(_DWORD *)(a1 + 96);
  int v5 = (os_unfair_lock_s *)(a1 + 324);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 324));
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = *(void *)(a1 + 80) + 8 * v6;
    while (1)
    {
      uint64_t v7 = *(void *)v7;
      if (!v7) {
        break;
      }
      if (*(_DWORD *)(v7 + 16) == a2)
      {
        uint64_t v8 = v7 + 40;
        goto LABEL_9;
      }
    }
    ++v6;
  }
  while (v6 != v4 + 1);
  uint64_t v8 = 0;
LABEL_9:
  os_unfair_lock_unlock(v5);
  return v8;
}

uint64_t gfxFindGFXBufferForName(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 288);
  int v5 = (os_unfair_lock_s *)(a1 + 324);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 324));
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = *(void *)(a1 + 272) + 8 * v6;
    while (1)
    {
      uint64_t v7 = *(void *)v7;
      if (!v7) {
        break;
      }
      if (*(_DWORD *)(v7 + 16) == a2)
      {
        uint64_t v8 = v7 + 40;
        goto LABEL_8;
      }
    }
    ++v6;
  }
  while (v6 != v4 + 1);
  uint64_t v8 = 0;
LABEL_8:
  os_unfair_lock_unlock(v5);
  return v8;
}

uint64_t gfxFindGFXRenderBufferForName(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 64);
  int v5 = (os_unfair_lock_s *)(a1 + 324);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 324));
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = *(void *)(a1 + 48) + 8 * v6;
    while (1)
    {
      uint64_t v7 = *(void *)v7;
      if (!v7) {
        break;
      }
      if (*(_DWORD *)(v7 + 16) == a2)
      {
        uint64_t v8 = v7 + 40;
        goto LABEL_8;
      }
    }
    ++v6;
  }
  while (v6 != v4 + 1);
  uint64_t v8 = 0;
LABEL_8:
  os_unfair_lock_unlock(v5);
  return v8;
}

uint64_t gfxFindGFXSyncForName(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 224);
  int v5 = (os_unfair_lock_s *)(a1 + 324);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 324));
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = *(void *)(a1 + 208) + 8 * v6;
    while (1)
    {
      uint64_t v7 = *(void *)v7;
      if (!v7) {
        break;
      }
      if (*(_DWORD *)(v7 + 16) == a2)
      {
        uint64_t v8 = v7 + 40;
        goto LABEL_8;
      }
    }
    ++v6;
  }
  while (v6 != v4 + 1);
  uint64_t v8 = 0;
LABEL_8:
  os_unfair_lock_unlock(v5);
  return v8;
}

void gfxRetainTextureObject(os_unfair_lock_s *a1, uint64_t a2)
{
  uint64_t v3 = a1 + 81;
  os_unfair_lock_lock(a1 + 81);
  ++*(_DWORD *)(a2 - 20);

  os_unfair_lock_unlock(v3);
}

void gfxReleaseTextureObject(uint64_t a1, uint64_t a2)
{
  int v4 = (os_unfair_lock_s *)(a1 + 324);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 324));
  int v5 = *(_DWORD *)(a2 - 20) - 1;
  *(_DWORD *)(a2 - 20) = v5;
  if (!v5 && *(int *)(a1 + 308) >= 1) {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, a2 - 40);
  }

  os_unfair_lock_unlock(v4);
}

void gfxRetainBufferObject(os_unfair_lock_s *a1, uint64_t a2)
{
  uint64_t v3 = a1 + 81;
  os_unfair_lock_lock(a1 + 81);
  ++*(_DWORD *)(a2 - 20);

  os_unfair_lock_unlock(v3);
}

void gfxReleaseBufferObject(uint64_t a1, uint64_t a2)
{
  int v4 = (os_unfair_lock_s *)(a1 + 324);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 324));
  int v5 = *(_DWORD *)(a2 - 20) - 1;
  *(_DWORD *)(a2 - 20) = v5;
  if (!v5 && *(int *)(a1 + 308) >= 1) {
    (*(void (**)(uint64_t, uint64_t))(a1 + 264))(a1, a2 - 40);
  }

  os_unfair_lock_unlock(v4);
}

void gfxRetainSyncObject(os_unfair_lock_s *a1, uint64_t a2)
{
  uint64_t v3 = a1 + 81;
  os_unfair_lock_lock(a1 + 81);
  ++*(_DWORD *)(a2 - 20);

  os_unfair_lock_unlock(v3);
}

void gfxReleaseSyncObject(uint64_t a1, uint64_t a2)
{
  int v4 = (os_unfair_lock_s *)(a1 + 324);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 324));
  int v5 = *(_DWORD *)(a2 - 20) - 1;
  *(_DWORD *)(a2 - 20) = v5;
  if (!v5 && *(int *)(a1 + 308) >= 1) {
    (*(void (**)(uint64_t, uint64_t))(a1 + 200))(a1, a2 - 40);
  }

  os_unfair_lock_unlock(v4);
}

uint64_t gfxSharedHasFloatRenderer(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 320);
  if (!*(unsigned char *)(a1 + 320)) {
    return 0;
  }
  uint64_t v2 = (int *)(a1 + 376);
  while (1)
  {
    int v3 = *v2;
    v2 += 8;
    if (v3 == gfx_float_device_id) {
      break;
    }
    if (!--v1) {
      return 0;
    }
  }
  return 1;
}

uint64_t gfxGetGFXBufferForGFXTexture(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 528);
  if (v1) {
    return v1 + 40;
  }
  else {
    return 0;
  }
}

double gfxInitializeGLSamplerState(uint64_t a1, unsigned char *a2)
{
  *(_DWORD *)(a1 + 8) = 687941889;
  *(_WORD *)(a1 + 12) = 10497;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 16) = xmmword_210826E60;
  *(void *)&double result = 0x20326012702;
  *(void *)a1 = 0x20326012702;
  *(unsigned char *)(a1 + 14) |= 1u;
  *a2 = 127;
  return result;
}

uint64_t gfxInitializeGLTexturePluginState(uint64_t result)
{
  *(void *)double result = 0;
  *(void *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = 0;
  *(unsigned char *)(result + 20) = -127;
  return result;
}

unsigned char *gfxInitializeGLSamplerPluginState(unsigned char *result)
{
  *double result = 1;
  return result;
}

uint64_t gfxInitializeGLTexture(uint64_t result, int a2, int a3, uint64_t a4)
{
  *(void *)(a4 + 544) = 0;
  *(_OWORD *)(a4 + 528) = 0u;
  *(_WORD *)(a4 + 552) = -31299;
  *(_WORD *)(a4 + 558) = 0;
  *(_WORD *)(a4 + 768) = result;
  *(void *)(a4 + 776) = 1065353216;
  *(_WORD *)(a4 + 774) = 1028;
  *(void *)(a4 + 784) = 0;
  *(_DWORD *)(a4 + 770) = 0;
  *(void *)(a4 + 1024) = 0;
  *(_DWORD *)(a4 + 1016) = 0;
  *(_DWORD *)(a4 + 872) = 0;
  *(void *)(a4 + 864) = 0;
  char v4 = *(unsigned char *)(a4 + 792);
  *(_OWORD *)(a4 + 816) = 0u;
  *(_OWORD *)(a4 + 832) = 0u;
  *(void *)(a4 + 856) = 0;
  *(void *)(a4 + 848) = 0;
  *(void *)(a4 + 800) = a4;
  *(void *)(a4 + 808) = 0;
  *(unsigned char *)(a4 + 792) = v4 & 0xE2 | 0xC;
  *(unsigned char *)(a4 + 979) = a2;
  *(unsigned char *)(a4 + 981) = a3;
  *(_WORD *)(a4 + 960) = -32680;
  *(_DWORD *)(a4 + 920) = 687941889;
  *(_WORD *)(a4 + 924) = 10497;
  *(void *)(a4 + 944) = 0;
  *(void *)(a4 + 952) = 0;
  *(_OWORD *)(a4 + 928) = xmmword_210826E60;
  *(void *)(a4 + 912) = 0x20326012702;
  *(unsigned char *)(a4 + 926) |= 1u;
  *(_DWORD *)(a4 + 554) = 2130706432;
  char v5 = *(unsigned char *)(a4 + 898);
  *(void *)(a4 + 884) = 0x3E800000000;
  *(_DWORD *)(a4 + 900) = 0;
  *(void *)(a4 + 904) = 0;
  *(_WORD *)(a4 + 880) = -31299;
  *(unsigned char *)(a4 + 898) = v5 & 0xF8;
  *(_WORD *)(a4 + 896) = *(_WORD *)(a4 + 896) & 0xF000 | 0x688;
  *(_WORD *)(a4 + 882) = 6409;
  *(_DWORD *)(a4 + 892) = 0;
  if ((result & 0x2000) != 0)
  {
    int v6 = 0;
    __int16 v9 = *(_WORD *)(a4 + 982) & 0xC0FF | 0x500;
    *(_DWORD *)(a4 + 920) = -2127593169;
    *(_WORD *)(a4 + 924) = -32465;
    *(_DWORD *)(a4 + 912) = 637543936;
    char v10 = 1;
LABEL_20:
    *(unsigned char *)(a4 + 557) = v10;
    goto LABEL_21;
  }
  switch(result & 0xF)
  {
    case 0:
      int v6 = 0;
      __int16 v9 = *(_WORD *)(a4 + 982) & 0xC0FF | 0x400;
      break;
    case 1:
      int v6 = 0;
      __int16 v11 = *(_WORD *)(a4 + 982) & 0xC0FF;
      __int16 v12 = 5120;
      goto LABEL_9;
    case 2:
      int v6 = 0;
      __int16 v11 = *(_WORD *)(a4 + 982) & 0xC1FF;
      __int16 v12 = 1280;
LABEL_9:
      __int16 v9 = v11 | v12;
      break;
    case 3:
      int v6 = 0;
      __int16 v9 = *(_WORD *)(a4 + 982) & 0xC0FF | 0x400;
      goto LABEL_17;
    case 4:
      int v6 = 0;
      __int16 v9 = *(_WORD *)(a4 + 982) & 0xC0FF;
      goto LABEL_17;
    case 5:
    case 0xALL:
      int v6 = 0;
      __int16 v7 = *(_WORD *)(a4 + 982) & 0xC0FF;
      __int16 v8 = 9216;
      goto LABEL_16;
    case 6:
      int v6 = 0;
      __int16 v9 = *(_WORD *)(a4 + 982) & 0xC0FF | 0x2000;
      goto LABEL_17;
    case 7:
      __int16 v9 = *(_WORD *)(a4 + 982) & 0xC0FF | 0x100;
      *(_WORD *)(a4 + 982) = v9;
      *(unsigned char *)(a4 + 556) = 127;
      int v6 = 1;
      break;
    case 8:
      int v6 = 0;
      __int16 v7 = *(_WORD *)(a4 + 982) & 0xC1FF;
      __int16 v8 = 1280;
      goto LABEL_16;
    case 9:
      int v6 = 0;
      __int16 v7 = *(_WORD *)(a4 + 982) & 0xC1FF;
      __int16 v8 = 9472;
LABEL_16:
      __int16 v9 = v7 | v8;
LABEL_17:
      *(_WORD *)(a4 + 982) = v9;
      break;
    default:
      int v6 = 0;
      __int16 v9 = *(_WORD *)(a4 + 982);
      break;
  }
  if ((v9 & 0x100) != 0)
  {
    *(_DWORD *)(a4 + 920) = -2127593169;
    *(_WORD *)(a4 + 924) = -32465;
    *(_WORD *)(a4 + 912) = 9729;
    char v10 = 13;
    goto LABEL_20;
  }
LABEL_21:
  *(_WORD *)(a4 + 970) = 1;
  *(unsigned char *)(a4 + 980) = 0;
  *(_WORD *)(a4 + 982) = v9 & 0x3F00 | 0x4000;
  *(void *)(a4 + 962) = 0x1000000000000;
  *(_DWORD *)(a4 + 972) = 0;
  *(unsigned char *)(a4 + 976) = 0;
  *(_WORD *)(a4 + 977) = 1;
  *(void *)(a4 + 760) = 0;
  *(_OWORD *)(a4 + 740) = 0u;
  *(void *)(a4 + 984) = 0;
  *(void *)(a4 + 1000) = 0;
  if (v6) {
    char v13 = -119;
  }
  else {
    char v13 = -127;
  }
  uint64_t v14 = a4 + 96;
  uint64_t v15 = 480;
  uint64_t v16 = (void *)a4;
  *(void *)(a4 + 992) = 0;
  do
  {
    *uint64_t v16 = 0;
    *(void *)uint64_t v14 = 0;
    *(void *)(v14 + 8) = 0;
    *(_DWORD *)(v14 + 16) = 0;
    v16[48] = 0;
    ++v16;
    *(unsigned char *)(v14 + 20) = v13;
    v14 += 24;
    *(unsigned char *)(a4 + v15) = 1;
    v15 += 4;
  }
  while (v15 != 528);
  if (a2 >= 1)
  {
    uint64_t v17 = 0;
    __int16 v18 = *(_WORD *)(a4 + 960);
    uint64_t v19 = a4 + 560;
    do
    {
      for (uint64_t i = 0; i != 30; i += 2)
        *(_WORD *)(v19 + i) = v18;
      ++v17;
      v19 += 30;
    }
    while (v17 != a2);
    for (uint64_t j = 0; j != a2; ++j)
    {
      if (a3 >= 1)
      {
        uint64_t v22 = 0;
        do
        {
          uint64_t v23 = a4 + v22;
          *(_DWORD *)(a4 + v22 + 1039) = 0;
          *(void *)(a4 + v22 + 1044) = 0x1401190800000000;
          *(void *)(v23 + 1056) = 0;
          *(unsigned char *)(v23 + 1043) = 0;
          *(void *)(v23 + 1032) = 0;
          v22 += 32;
        }
        while (32 * a3 != v22);
      }
      a4 += 480;
    }
  }
  return result;
}

uint64_t gfxCreatePluginTexture(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + 320))
  {
    uint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = 0;
    uint64_t v5 = a2 + 768;
    uint64_t v6 = a2 + 912;
    uint64_t v7 = result + 360;
    uint64_t v8 = a2 + 96;
    uint64_t v9 = a2 + 480;
    do
    {
      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)v7 + 1352))(*(void *)(v7 - 8), v2, v5, v8);
      double result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)v7 + 1864))(*(void *)(v7 - 8), v2 + 384, v6, v9);
      ++v4;
      v2 += 8;
      v7 += 32;
      v8 += 24;
      v9 += 4;
    }
    while (v4 < *(unsigned __int8 *)(v3 + 320));
  }
  return result;
}

uint64_t gfxDestroyPluginTexture(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + 320))
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    uint64_t v5 = result + 360;
    do
    {
      if (*(void *)(a2 + 8 * v4))
      {
        double result = (*(uint64_t (**)(void))(*(void *)v5 + 1408))(*(void *)(v5 - 8));
        *(void *)(a2 + 8 * v4) = 0;
      }
      uint64_t v6 = a2 + 8 * v4;
      if (*(void *)(v6 + 384))
      {
        double result = (*(uint64_t (**)(void))(*(void *)v5 + 1872))(*(void *)(v5 - 8));
        *(void *)(v6 + 384) = 0;
      }
      ++v4;
      v5 += 32;
    }
    while (v4 < *(unsigned __int8 *)(v3 + 320));
  }
  return result;
}

uint64_t gfxGetGLDTextureForDeviceID(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 320);
  if (!*(unsigned char *)(a1 + 320)) {
    return 0;
  }
  unint64_t v4 = (int *)(a1 + 376);
  while (1)
  {
    int v5 = *v4;
    v4 += 8;
    if (v5 == (a3 & 0xFFFFFF00)) {
      break;
    }
    a2 += 8;
    if (!--v3) {
      return 0;
    }
  }
  return *(void *)a2;
}

uint64_t gfxPixelBytes(int a1, int a2)
{
  uint64_t result = 0;
  if (a2 > 33634)
  {
    if (a2 > 34233)
    {
      if (a2 > 36192)
      {
        if (a2 != 36193)
        {
          if (a2 == 37882) {
            unsigned int v6 = 4;
          }
          else {
            unsigned int v6 = 0;
          }
          if (a2 == 36269) {
            return 8;
          }
          else {
            return v6;
          }
        }
        return 2 * gfxComponents(a1);
      }
      if ((a2 - 34234) < 2) {
        return 2;
      }
      if (a2 == 35899) {
        return 4;
      }
      int v5 = 35902;
    }
    else
    {
      if ((a2 - 33635) < 4) {
        return 2;
      }
      if ((a2 - 33639) < 2) {
        return 4;
      }
      int v5 = 34042;
    }
    if (a2 != v5) {
      return result;
    }
    return 4;
  }
  if (a2 > 32818)
  {
    if ((a2 - 32819) < 2) {
      return 2;
    }
    if ((a2 - 32821) >= 2)
    {
      int v7 = 33634;
      goto LABEL_35;
    }
    return 4;
  }
  if ((a2 - 5120) > 0xB)
  {
LABEL_34:
    int v7 = 32818;
LABEL_35:
    if (a2 == v7) {
      return 1;
    }
    return result;
  }
  if (((1 << a2) & 0x70) != 0) {
    return 4 * gfxComponents(a1);
  }
  if (((1 << a2) & 0x80C) != 0) {
    return 2 * gfxComponents(a1);
  }
  if (((1 << a2) & 3) == 0) {
    goto LABEL_34;
  }
  uint64_t result = 1;
  char v4 = a1 - 101;
  if ((a1 - 35429) > 0xF)
  {
    if ((a1 - 37883) < 3) {
      return result;
    }
    if (a1 == 37902 || (a1 - 37875) < 6) {
      return 2;
    }
    if ((a1 - 37903) >= 2)
    {
      return gfxComponents(a1);
    }
    return 4;
  }
  if (((1 << v4) & 0xE2E2) != 0) {
    return 2;
  }
  if (((1 << v4) & 0xD0D) == 0) {
    return 4;
  }
  return result;
}

uint64_t gfxComponents(int a1)
{
  uint64_t v1 = 1;
  if (a1 > 35903)
  {
    if (a1 <= 37874)
    {
      if (a1 <= 36243)
      {
        if (a1 == 35904) {
          return 3;
        }
        if (a1 == 35908) {
          return 2;
        }
        int v4 = 35910;
LABEL_30:
        if (a1 == v4) {
          return v1;
        }
      }
      else
      {
        char v2 = a1 + 108;
        if ((a1 - 36244) <= 9)
        {
          if (((1 << v2) & 0x10F) != 0) {
            return v1;
          }
          if (((1 << v2) & 0x50) != 0) {
            return 3;
          }
          if (a1 == 36253) {
            return 2;
          }
        }
      }
      return 4;
    }
    if ((a1 - 37875) > 0x1B || ((1 << (a1 + 13)) & 0x800073F) == 0) {
      return 4;
    }
    return 3;
  }
  if (a1 > 34232)
  {
    if (((a1 - 35429) > 0xF || ((1 << (a1 - 101)) & 0xFCFF) == 0) && a1 != 34233 && a1 != 35359) {
      return 4;
    }
    return 3;
  }
  if (a1 > 32991)
  {
    if ((a1 - 33319) < 2) {
      return 2;
    }
    if (a1 != 32992)
    {
      if (a1 != 34041) {
        return 4;
      }
      return 2;
    }
    return 3;
  }
  switch(a1)
  {
    case 6400:
    case 6401:
    case 6402:
    case 6403:
    case 6404:
    case 6405:
    case 6406:
    case 6409:
      return v1;
    case 6407:
      return 3;
    case 6408:
      return 4;
    case 6410:
      return 2;
    default:
      int v4 = 32841;
      goto LABEL_30;
  }
  return v1;
}

uint64_t gfxTextureLevelBytes(unsigned __int16 *a1)
{
  if (a1[9]) {
    return a1[6] * (unint64_t)gfxPixelBytes(a1[8], a1[9]) * a1[7] * a1[4];
  }
  glgConvertType();
  return glgGetCompressedImageBytes();
}

BOOL gfxAllocateTextureLevel(uint64_t a1, uint64_t a2)
{
  size_t v4 = gfxTextureLevelBytes((unsigned __int16 *)a2);
  if (v4)
  {
    if (*(unsigned __int16 *)(a1 + 880) == 34237)
    {
      int v5 = malloc_type_malloc(v4, 0xDCD90CA9uLL);
      if (v5)
      {
        vm_address_t v6 = (vm_address_t)v5;
        __CFSetLastAllocationEventName();
LABEL_11:
        *(void *)(a2 + 24) = v6;
        return v6 != 0;
      }
    }
    else
    {
      vm_address_t address = 0;
      if (v4 >> 31) {
        int v7 = 1;
      }
      else {
        int v7 = 3;
      }
      *(unsigned char *)(a2 + 11) |= 8u;
      if (!vm_allocate(*MEMORY[0x263EF8960], &address, v4, v7))
      {
        __CFSetLastAllocationEventName();
        vm_address_t v6 = address;
        goto LABEL_11;
      }
    }
    abort();
  }
  vm_address_t v6 = *(void *)(a2 + 24);
  return v6 != 0;
}

uint64_t gfxFreeTextureLevel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)(a3 + 11) & 8) != 0)
  {
    mach_vm_size_t v4 = gfxTextureLevelBytes((unsigned __int16 *)a3);
    mach_vm_deallocate(*MEMORY[0x263EF8960], *(void *)(a3 + 24), v4);
    *(unsigned char *)(a3 + 11) &= ~8u;
  }
  else
  {
    free(*(void **)(a3 + 24));
  }
  *(void *)(a3 + 24) = 0;
  return 1;
}

uint64_t gfxUploadPluginTextureLevel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  if ((*(unsigned char *)(a3 + 11) & 1) != 0
    || *(void *)(a3 + 24)
    || (uint64_t result = gfxAllocateTextureLevel(a2, a3), result))
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32 * a6 + 360)
                                                                                  + 1440))(*(void *)(a1 + 32 * a6 + 352), *(void *)(a2 + 8 * a6), a4, a5, a7);
    ++*(_DWORD *)(a1 + 316);
    if (*(unsigned char *)(a2 + 770)) {
      char v15 = *(unsigned char *)(a3 + 11);
    }
    else {
      char v15 = *(unsigned char *)(a3 + 11) | 0x10;
    }
    *(unsigned char *)(a3 + 11) = v15 & 0xBF;
  }
  else if (*(_DWORD *)(a1 + 296))
  {
    *(_DWORD *)(a1 + 296) = 1285;
  }
  return result;
}

uint64_t gfxReqToBase(uint64_t result)
{
  if ((int)result > 36011)
  {
    if ((int)result > 36974)
    {
      switch((int)result)
      {
        case 37808:
        case 37809:
        case 37810:
        case 37811:
        case 37812:
        case 37813:
        case 37814:
        case 37815:
        case 37816:
        case 37817:
        case 37818:
        case 37819:
        case 37820:
        case 37821:
        case 37840:
        case 37841:
        case 37842:
        case 37843:
        case 37844:
        case 37845:
        case 37846:
        case 37847:
        case 37848:
        case 37849:
        case 37850:
        case 37851:
        case 37852:
        case 37853:
        case 37874:
        case 37881:
        case 37886:
        case 37887:
        case 37888:
        case 37889:
        case 37890:
        case 37891:
        case 37892:
        case 37893:
        case 37894:
        case 37895:
        case 37896:
        case 37897:
        case 37898:
        case 37899:
        case 37900:
        case 37901:
        case 37903:
        case 37904:
          return 6408;
        case 37822:
        case 37823:
        case 37824:
        case 37825:
        case 37826:
        case 37827:
        case 37828:
        case 37829:
        case 37830:
        case 37831:
        case 37832:
        case 37833:
        case 37834:
        case 37835:
        case 37836:
        case 37837:
        case 37838:
        case 37839:
        case 37854:
        case 37855:
        case 37856:
        case 37857:
        case 37858:
        case 37859:
        case 37860:
        case 37861:
        case 37862:
        case 37863:
        case 37864:
        case 37865:
        case 37866:
        case 37867:
        case 37868:
        case 37869:
        case 37870:
        case 37871:
        case 37872:
        case 37873:
        case 37882:
          return result;
        case 37875:
        case 37876:
        case 37877:
        case 37878:
        case 37879:
        case 37880:
        case 37883:
        case 37884:
        case 37885:
        case 37902:
          return 6407;
        default:
          switch((int)result)
          {
            case 37488:
            case 37489:
              return 6403;
            case 37490:
            case 37491:
              return 33319;
            case 37492:
            case 37493:
              return 6407;
            case 37494:
            case 37495:
            case 37496:
            case 37497:
              return 6408;
            default:
              if (result == 36975) {
                return 6408;
              }
              break;
          }
          break;
      }
      return result;
    }
    if ((int)result > 36193)
    {
      switch((int)result)
      {
        case 36194:
        case 36209:
        case 36215:
        case 36221:
        case 36227:
        case 36233:
        case 36239:
          return 6407;
        case 36195:
        case 36196:
        case 36197:
        case 36198:
        case 36199:
        case 36200:
        case 36201:
        case 36202:
        case 36203:
        case 36204:
        case 36205:
        case 36206:
        case 36207:
        case 36244:
        case 36245:
        case 36246:
        case 36247:
        case 36248:
        case 36249:
        case 36250:
        case 36251:
        case 36252:
        case 36253:
        case 36254:
        case 36255:
        case 36256:
        case 36257:
        case 36258:
        case 36259:
        case 36260:
        case 36261:
        case 36262:
        case 36263:
        case 36264:
        case 36265:
        case 36266:
        case 36267:
        case 36268:
        case 36269:
        case 36270:
        case 36271:
        case 36272:
        case 36273:
        case 36274:
        case 36275:
        case 36276:
        case 36277:
        case 36278:
        case 36279:
        case 36280:
        case 36281:
        case 36282:
          return result;
        case 36208:
        case 36214:
        case 36220:
        case 36226:
        case 36232:
        case 36238:
          return 6408;
        case 36210:
        case 36216:
        case 36222:
        case 36228:
        case 36234:
        case 36240:
LABEL_33:
          uint64_t result = 6406;
          break;
        case 36211:
        case 36217:
        case 36223:
        case 36229:
        case 36235:
        case 36241:
LABEL_34:
          uint64_t result = 32841;
          break;
        case 36212:
        case 36218:
        case 36224:
        case 36230:
        case 36236:
        case 36242:
LABEL_36:
          uint64_t result = 6409;
          break;
        case 36213:
        case 36219:
        case 36225:
        case 36231:
        case 36237:
        case 36243:
LABEL_49:
          uint64_t result = 6410;
          break;
        case 36283:
        case 36284:
          return 6403;
        case 36285:
        case 36286:
          return 33319;
        default:
          switch((int)result)
          {
            case 36756:
            case 36760:
              return 6403;
            case 36757:
            case 36761:
              return 33319;
            case 36758:
            case 36762:
              return 6407;
            case 36759:
            case 36763:
              return 6408;
            default:
              return result;
          }
      }
      return result;
    }
    if ((result - 36166) < 4) {
      return 6401;
    }
    if (result != 36012)
    {
      int v2 = 36013;
LABEL_28:
      if (result == v2) {
        return 34041;
      }
      return result;
    }
    return 6402;
  }
  if ((int)result > 34024)
  {
    if ((int)result > 35839)
    {
      switch((int)result)
      {
        case 35898:
        case 35901:
        case 35904:
        case 35905:
        case 35912:
        case 35916:
          return 6407;
        case 35899:
        case 35900:
        case 35902:
        case 35903:
          return result;
        case 35906:
        case 35907:
        case 35913:
        case 35917:
        case 35918:
        case 35919:
          return 6408;
        case 35908:
        case 35909:
        case 35915:
          goto LABEL_49;
        case 35910:
        case 35911:
        case 35914:
          goto LABEL_36;
        default:
          if ((result - 35840) < 2) {
            return 6407;
          }
          if ((result - 35842) >= 2) {
            return result;
          }
          return 6408;
      }
    }
    if ((int)result > 35055)
    {
      uint64_t v1 = (result - 35408);
      if (v1 > 0x28)
      {
LABEL_9:
        int v2 = 35056;
        goto LABEL_28;
      }
      if (((1 << (result - 80)) & 0x1FFFE00033) == 0)
      {
        if (((1 << (result - 80)) & 0xC00000F0C0) == 0)
        {
          if (v1 != 40) {
            goto LABEL_9;
          }
          return 6403;
        }
        return 6408;
      }
      return 6407;
    }
    switch((int)result)
    {
      case 34836:
      case 34842:
        return 6408;
      case 34837:
      case 34843:
        return 6407;
      case 34838:
      case 34844:
        goto LABEL_33;
      case 34839:
      case 34845:
        goto LABEL_34;
      case 34840:
      case 34846:
        goto LABEL_36;
      case 34841:
      case 34847:
        goto LABEL_49;
      default:
        switch((int)result)
        {
          case 34025:
            goto LABEL_33;
          case 34026:
            goto LABEL_36;
          case 34027:
            goto LABEL_49;
          case 34028:
            goto LABEL_34;
          case 34029:
            return 6407;
          case 34030:
            return 6408;
          default:
            if (result == 34871) {
              goto LABEL_49;
            }
            break;
        }
        break;
    }
    return result;
  }
  if ((int)result <= 33188)
  {
    switch((int)result)
    {
      case 32827:
      case 32828:
      case 32829:
      case 32830:
        goto LABEL_33;
      case 32831:
      case 32832:
      case 32833:
      case 32834:
        goto LABEL_36;
      case 32835:
      case 32836:
      case 32837:
      case 32838:
      case 32839:
      case 32840:
        goto LABEL_49;
      case 32841:
      case 32846:
        return result;
      case 32842:
      case 32843:
      case 32844:
      case 32845:
        goto LABEL_34;
      case 32847:
      case 32848:
      case 32849:
      case 32850:
      case 32851:
      case 32852:
        return 6407;
      case 32853:
      case 32854:
      case 32855:
      case 32856:
      case 32857:
      case 32858:
      case 32859:
        return 6408;
      default:
        switch((int)result)
        {
          case 1:
            goto LABEL_36;
          case 2:
            goto LABEL_49;
          case 3:
            return 6407;
          case 4:
            return 6408;
          default:
            int v4 = 10768;
            goto LABEL_51;
        }
    }
  }
  if ((int)result <= 33775)
  {
    if ((result - 33317) <= 0x17)
    {
      int v3 = 1 << (result - 37);
      if ((v3 & 0x3F331) != 0) {
        return 6403;
      }
      if ((v3 & 0xFC0CC2) != 0) {
        return 33319;
      }
    }
    if ((result - 33189) >= 3) {
      return result;
    }
    return 6402;
  }
  if ((result - 33777) < 3) {
    return 6408;
  }
  int v4 = 33776;
LABEL_51:
  if (result == v4) {
    return 6407;
  }
  return result;
}

uint64_t gfxWaitPluginTexture(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + 320))
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    uint64_t v5 = result + 360;
    do
    {
      uint64_t result = (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)v5 + 1344))(*(void *)(v5 - 8), 1, 0, *(void *)(a2 + 8 * v4++));
      v5 += 32;
    }
    while (v4 < *(unsigned __int8 *)(v3 + 320));
  }
  return result;
}

uint64_t gfxWaitTextureOnDevices(uint64_t result, uint64_t a2, unsigned int a3)
{
  unsigned int v3 = *(unsigned __int8 *)(result + 320);
  if (*(unsigned char *)(result + 320))
  {
    uint64_t v5 = result;
    unint64_t v6 = 0;
    uint64_t v7 = a3;
    uint64_t v8 = result + 360;
    do
    {
      if (v7 != v6)
      {
        uint64_t result = (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)v8 + 1344))(*(void *)(v8 - 8), 1, 0, *(void *)(a2 + 8 * v6));
        unsigned int v3 = *(unsigned __int8 *)(v5 + 320);
      }
      ++v6;
      v8 += 32;
    }
    while (v6 < v3);
  }
  return result;
}

uint64_t gfxSynchronizeTexLevelStorage(uint64_t result, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  if (*(void *)(a2 + 536))
  {
    unsigned int v6 = *(unsigned __int8 *)(a2 + 979);
    if (*(unsigned char *)(a2 + 979))
    {
      uint64_t v8 = result;
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      unsigned int v11 = *(unsigned __int8 *)(a2 + 978);
      uint64_t v12 = a2 + 1032;
      uint64_t v19 = a4;
      uint64_t v13 = a3;
      do
      {
        unint64_t v14 = *(unsigned __int8 *)(a2 + 976);
        if (v14 <= v11)
        {
          uint64_t v18 = v9;
          uint64_t v15 = v9 + 32 * v14;
          do
          {
            char v16 = *(unsigned char *)(v12 + v15 + 11);
            if ((v16 & 0x50) == 0x40)
            {
              if (v10 == v13 && v19 == v14)
              {
                *(unsigned char *)(v12 + v15 + 11) = v16 & 0xBF;
              }
              else
              {
                gfxUploadPluginTextureLevel(v8, a2, v12 + v15, v10, v14, a5, 0);
                uint64_t result = gfxModifyPluginTextureLevel(v8, a2, v12 + v15, v10, v14, a5);
                unsigned int v11 = *(unsigned __int8 *)(a2 + 978);
              }
            }
            BOOL v17 = v14++ >= v11;
            v15 += 32;
          }
          while (!v17);
          unsigned int v6 = *(unsigned __int8 *)(a2 + 979);
          uint64_t v9 = v18;
        }
        ++v10;
        v9 += 480;
      }
      while (v10 < v6);
    }
    *(void *)(a2 + 536) = 0;
  }
  return result;
}

uint64_t gfxModifyPluginTextureLevel(uint64_t result, uint64_t a2, uint64_t a3, int a4, char a5, unsigned int a6)
{
  int v6 = 1 << a5;
  if (((1 << a5) & *(unsigned __int16 *)(a2 + 2 * a4 + 984)) != 0 && (*(unsigned char *)(a3 + 11) & 0x10) != 0)
  {
    *(_DWORD *)(a2 + 968) = *(_DWORD *)(a3 + 16);
    *(_WORD *)(a2 + 2 * a4 + 996) |= v6;
  }
  else
  {
    *(_WORD *)(a2 + 2 * a4 + 996) &= ~(_WORD)v6;
  }
  uint64_t v7 = *(unsigned __int8 *)(result + 320);
  if (*(unsigned char *)(result + 320))
  {
    uint64_t v8 = a6;
    uint64_t v9 = a2 + 104;
    do
    {
      if (v8)
      {
        *(unsigned char *)(v9 + 12) |= 4u;
        *(_WORD *)(v9 + 2 * a4) |= v6;
      }
      --v8;
      v9 += 24;
      --v7;
    }
    while (v7);
  }
  return result;
}

uint64_t gfxEvaluateTextureForParameterChange(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7)
{
  int v8 = a6;
  int v9 = a5;
  *(unsigned char *)(a3 + 7) = *(unsigned char *)(a2 + 975);
  *(_WORD *)(a3 + 10) = *(_WORD *)(a2 + 962);
  *(_DWORD *)(a3 + 12) = *(_DWORD *)(a2 + 964);
  uint64_t v14 = *(unsigned __int8 *)(a2 + 979);
  if (*(unsigned char *)(a2 + 979))
  {
    uint64_t v15 = (__int16 *)(a2 + 984);
    char v16 = (_WORD *)(a3 + 16);
    uint64_t v17 = *(unsigned __int8 *)(a2 + 979);
    do
    {
      __int16 v18 = *v15++;
      *v16++ = v18;
      --v17;
    }
    while (v17);
  }
  unsigned int v19 = *(unsigned __int16 *)(a2 + 982);
  int v20 = 128;
  if ((v19 & 0x100) == 0 && a4 <= 14 && (v19 & 0xF) != a4)
  {
    uint64_t v21 = a2 + 1032;
    int v22 = *(unsigned __int16 *)(a2 + 2 * a4 + 560);
    uint64_t v23 = (unsigned __int16 *)(a2 + 1032 + 32 * a4);
    int v24 = v23[2];
    if (v22 == *(unsigned __int16 *)(a2 + 960))
    {
      int v25 = v23[3];
      int v26 = v23[4];
      int v27 = *(unsigned __int16 *)(a2 + 962) >> a4;
      if ((v27 | (v27 == 0)) == v24 && *(unsigned __int8 *)(v21 + 32 * a4 + 10) == v19 >> 15)
      {
        int v28 = (v19 >> 9) & 3;
        int v29 = (v19 >> 13) & 1;
        if (!(v29 | v28))
        {
          if (v27 == v24) {
            return gfxEvaluateTextureCore(a1, a2, a3, -1, -1, a4, v9, v8, a7, *(unsigned __int16 *)(a2 + 960)) | v20;
          }
          goto LABEL_30;
        }
        char v30 = v28 ? a4 : 0;
        int v31 = *(unsigned __int16 *)(a2 + 964) >> v30;
        if ((v31 | (v31 == 0)) == v25)
        {
          char v32 = a4;
          if ((v19 & 0x1800) == 0)
          {
            if (!v28 || !v29)
            {
              BOOL v35 = v31 == v25 && v29 == 0;
              if (v27 == v24) {
                return gfxEvaluateTextureCore(a1, a2, a3, -1, -1, a4, v9, v8, a7, *(unsigned __int16 *)(a2 + 960)) | v20;
              }
              goto LABEL_83;
            }
            char v32 = 0;
          }
          int v33 = *(unsigned __int16 *)(a2 + 966) >> v32;
          if ((v33 | (v33 == 0)) == v26)
          {
            BOOL v35 = v33 == v26 && v29 == 0;
            if (v27 == v24 || v31 == v25) {
              return gfxEvaluateTextureCore(a1, a2, a3, -1, -1, a4, v9, v8, a7, *(unsigned __int16 *)(a2 + 960)) | v20;
            }
LABEL_83:
            if (v35) {
              return gfxEvaluateTextureCore(a1, a2, a3, -1, -1, a4, v9, v8, a7, *(unsigned __int16 *)(a2 + 960)) | v20;
            }
          }
        }
      }
    }
    else
    {
      int v25 = v23[3];
      int v26 = v23[4];
    }
LABEL_30:
    int v20 = 1073741953;
    int v36 = *(unsigned __int8 *)(v21 + 32 * a4 + 10);
    int v37 = (v24 - 2 * v36) << a4;
    *(_WORD *)(a3 + 10) = v37;
    int v38 = (v25 - ((*(unsigned __int16 *)(a2 + 982) >> 9) & 3) * v36) << ((((*(unsigned __int16 *)(a2 + 982) >> 9) & 2) != 0)
                                                                       * a4);
    *(_WORD *)(a3 + 12) = v38;
    int v39 = (v26 - ((*(unsigned __int16 *)(a2 + 982) >> 11) & 3) * v36) << (((*(_WORD *)(a2 + 982) & 0x1000) != 0) * a4);
    *(_WORD *)(a3 + 14) = v39;
    *(unsigned char *)(a3 + 31) = v36;
    *(_WORD *)(a3 + 8) = v22;
    *(unsigned char *)(a3 + 28) = *(unsigned char *)(a2 + 980);
    *(unsigned char *)(a3 + 29) = (*(_WORD *)(a2 + 982) & 0x4000) != 0;
    if ((_WORD)v37)
    {
      unint64_t v40 = (unsigned __int16)v37;
      uint64_t v41 = -1;
      unint64_t v42 = v40;
      do
      {
        ++v41;
        BOOL v43 = v42 > 1;
        v42 >>= 1;
      }
      while (v43);
      *(unsigned char *)(a3 + 4) = v41;
      if ((*(unsigned char *)(a2 + 983) & 6) != 0)
      {
        uint64_t v44 = -1;
        unint64_t v45 = (unsigned __int16)v38;
        if ((_WORD)v38)
        {
          do
          {
            ++v44;
            BOOL v43 = v45 > 1;
            v45 >>= 1;
          }
          while (v43);
        }
        if (v44 > v41) {
          uint64_t v41 = v44;
        }
        *(unsigned char *)(a3 + 5) = v44;
        if ((*(_WORD *)(a2 + 982) & 0x1800) != 0)
        {
          uint64_t v46 = -1;
          unint64_t v47 = (unsigned __int16)v39;
          if ((_WORD)v39)
          {
            do
            {
              ++v46;
              BOOL v43 = v47 > 1;
              v47 >>= 1;
            }
            while (v43);
          }
          if (v46 > v41) {
            uint64_t v41 = v46;
          }
        }
        else
        {
          LOBYTE(v46) = 0;
        }
      }
      else
      {
        LOBYTE(v46) = 0;
        *(unsigned char *)(a3 + 5) = 0;
      }
      *(unsigned char *)(a3 + 6) = v46;
      uint64_t v48 = *(unsigned __int8 *)(a2 + 559) - 1;
      if (v41 < v48) {
        uint64_t v48 = v41;
      }
      if (*(unsigned char *)(a2 + 559)) {
        uint64_t v49 = v48;
      }
      else {
        uint64_t v49 = v41;
      }
      *(unsigned char *)(a3 + 7) = v49;
      if (v14)
      {
        uint64_t v50 = 0;
        uint64_t v51 = *(unsigned __int8 *)(a2 + 981);
        if (v49 >= v51) {
          uint64_t v49 = v51 - 1;
        }
        uint64_t v52 = a2 + 560;
        unsigned int v53 = (unsigned __int8 *)(a2 + 1042);
        do
        {
          uint64_t v54 = a3 + 2 * v50;
          *(_WORD *)(v54 + 16) = 0;
          CFURLRef v55 = (_WORD *)(v54 + 16);
          if ((v49 & 0x8000000000000000) == 0)
          {
            int v56 = 0;
            uint64_t v57 = 0;
            CFStringRef v58 = v53;
            int v59 = (unsigned __int16)v39;
            int v60 = (unsigned __int16)v38;
            unsigned int v61 = v40;
            do
            {
              if (v61 + 2 * (char)v36 == *((unsigned __int16 *)v58 - 3))
              {
                unsigned int v62 = *(unsigned __int16 *)(a2 + 982);
                if (v60 + ((v62 >> 9) & 3) * (char)v36 == *((unsigned __int16 *)v58 - 2)
                  && v59 + ((v62 >> 11) & 3) * (char)v36 == *((unsigned __int16 *)v58 - 1)
                  && *v58 == (char)v36
                  && ((*(unsigned char *)(a1 + 344) & 1) != 0 || *(unsigned __int16 *)(v52 + 2 * v57) == v22))
                {
                  v56 |= 1 << v57;
                  *CFURLRef v55 = v56;
                }
              }
              if (v60 >= 2) {
                int v60 = v60 >> ((*(_WORD *)(a2 + 982) & 0x600) != 0);
              }
              if (v59 >= 2) {
                int v59 = v59 >> ((*(_WORD *)(a2 + 982) & 0x1800) != 0);
              }
              v61 >>= v61 > 1;
              ++v57;
              v58 += 32;
            }
            while (v49 + 1 != v57);
          }
          ++v50;
          v52 += 30;
          v53 += 480;
        }
        while (v50 != v14);
        int v9 = a5;
        int v8 = a6;
      }
    }
    else
    {
      *(_DWORD *)(a3 + 4) = 0;
      if (v14) {
        bzero((void *)(a3 + 16), 2 * v14);
      }
    }
  }
  return gfxEvaluateTextureCore(a1, a2, a3, -1, -1, a4, v9, v8, a7, *(unsigned __int16 *)(a2 + 960)) | v20;
}

uint64_t gfxEvaluateTextureCore(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10)
{
  __int16 v10 = *(_WORD *)(a2 + 768);
  if ((v10 & 0xF) == 2) {
    unsigned __int8 v11 = 77;
  }
  else {
    unsigned __int8 v11 = 127;
  }
  if ((v10 & 0x3000) != 0x1000
    || (*(_WORD *)(a3 + 10) & (unsigned __int16)(*(_WORD *)(a3 + 10) - 1)) != 0
    || (*(_WORD *)(a3 + 12) & (unsigned __int16)(*(_WORD *)(a3 + 12) - 1)) != 0
    || (*(_WORD *)(a3 + 14) & (unsigned __int16)(*(_WORD *)(a3 + 14) - 1)) != 0)
  {
    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = (*(_WORD *)(a2 + 912) & 0xFFFC) == 9984;
    if (*(unsigned char *)(a2 + 558)) {
      BOOL v12 = 1;
    }
  }
  int v13 = *(unsigned __int8 *)(a3 + 7);
  int v14 = v10 & 0xC00;
  if ((*(_WORD *)(a2 + 768) & 0xC00) != 0)
  {
    unint64_t v15 = *(unsigned __int8 *)(a2 + 981);
    if (v15 < 2)
    {
      int v16 = 0;
    }
    else
    {
      int v16 = 0;
      uint64_t v17 = (char *)(a2 + 1075);
      for (uint64_t i = 1; i != v15; ++i)
      {
        char v19 = *v17;
        v17 += 32;
        if ((v19 & 0x10) != 0) {
          int v16 = i;
        }
      }
    }
    if (((*(unsigned __int16 *)(a3 + 2 * a4 + 16) >> a5) & (v16 < a5)) != 0) {
      int v16 = a5;
    }
    if (v16 < a7 && v16 != 0) {
      a7 = v16;
    }
  }
  int v21 = 1;
  if (v13 >= a6)
  {
    uint64_t v25 = *(unsigned __int8 *)(a2 + 979);
    if (a7 >= v13) {
      int v24 = *(unsigned __int8 *)(a3 + 7);
    }
    else {
      int v24 = a7;
    }
    BOOL v23 = a7 >= a6;
    if (a7 < a6) {
      int v24 = a6;
    }
    if (*(unsigned char *)(a2 + 979))
    {
      int v26 = 0;
      int v27 = (unsigned __int16 *)(a3 + 16);
      do
      {
        unsigned int v29 = *v27++;
        unsigned int v28 = v29;
        if ((((-1 << (31 - v24 + a6)) >> ~(_BYTE)v24) & ~v29) != 0) {
          BOOL v23 = 0;
        }
        if (((1 << a6) & v28) == 0) {
          int v21 = 0;
        }
        if (v28 >= 2) {
          int v26 = 1;
        }
        --v25;
      }
      while (v25);
      BOOL v22 = v26 != 0;
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    int v21 = 0;
    BOOL v22 = 0;
    BOOL v23 = 1;
    int v24 = *(unsigned __int8 *)(a3 + 7);
    a6 = v24;
  }
  if (v12 || v22)
  {
    if (v14) {
      BOOL v32 = 1;
    }
    else {
      BOOL v32 = a8 == 0;
    }
    if (v32) {
      int v30 = 0;
    }
    else {
      int v30 = a6;
    }
    if (a8) {
      int v13 = v24;
    }
    int v31 = v13 - v30 + 1;
  }
  else
  {
    int v30 = 0;
    int v24 = 0;
    int v31 = 1;
  }
  if (!v21) {
    v11 &= 0x7Eu;
  }
  if (!(v23 | a9)) {
    v11 &= ~2u;
  }
  BOOL v33 = (a10 - 33341) >= 0xFFFFFFF4 || a10 == 36975;
  unsigned __int8 v34 = v11 & 0x73;
  if (v33) {
    v11 &= 0x73u;
  }
  if ((a10 - 36208) <= 0x23) {
    unsigned __int8 v11 = v34;
  }
  if ((*(unsigned char *)(a1 + 344) & 0x10) == 0
    && ((*(_WORD *)(a3 + 10) & (unsigned __int16)(*(_WORD *)(a3 + 10) - 1)) != 0
     || (*(_WORD *)(a3 + 12) & (unsigned __int16)(*(_WORD *)(a3 + 12) - 1)) != 0))
  {
    v11 &= 0xCDu;
  }
  __int16 v35 = *(_WORD *)(a2 + 982);
  if (a6 == (v35 & 0xF) && v24 == v35 >> 4) {
    unsigned int v36 = 0;
  }
  else {
    unsigned int v36 = 128;
  }
  if (*(unsigned __int8 *)(a2 + 556) == v11) {
    uint64_t result = v36;
  }
  else {
    uint64_t result = v36 | 0x80000000;
  }
  if (v31 != *(unsigned __int8 *)(a2 + 977) || v30 != *(unsigned __int8 *)(a2 + 976)) {
    uint64_t result = result | 5;
  }
  *(unsigned char *)a3 = v30;
  *(unsigned char *)(a3 + 1) = v31;
  *(unsigned char *)(a3 + 2) = a6;
  *(unsigned char *)(a3 + 3) = v24;
  *(unsigned char *)(a3 + 30) = v11;
  return result;
}

uint64_t gfxUpdateTextureForParameterChange(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __int16 v7 = *(_WORD *)(a2 + 982);
  if ((~a4 & 0x40000001) == 0 && (v7 & 0xF) != *(unsigned char *)(a3 + 2))
  {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 979);
    *(_WORD *)(a2 + 962) = *(_WORD *)(a3 + 10);
    *(_DWORD *)(a2 + 964) = *(_DWORD *)(a3 + 12);
    unsigned int v10 = *(unsigned __int8 *)(a3 + 7);
    if ((v7 & 0x100) == 0)
    {
      __int16 v7 = v7 & 0x7FFF | ((*(unsigned char *)(a3 + 31) & 1) << 15);
      *(_WORD *)(a2 + 982) = v7;
      *(unsigned char *)(a2 + 972) = *(unsigned char *)(a3 + 4);
      *(_WORD *)(a2 + 973) = *(_WORD *)(a3 + 5);
      *(unsigned char *)(a2 + 975) = v10;
    }
    uint64_t v11 = *(unsigned __int16 *)(a3 + 8);
    *(_WORD *)(a2 + 960) = v11;
    *(unsigned char *)(a2 + 980) = *(unsigned char *)(a3 + 28);
    *(_WORD *)(a2 + 982) = v7 & 0xBFFF | ((*(unsigned char *)(a3 + 29) & 1) << 14);
    *(_WORD *)(a2 + 772) = gfxReqToBase(v11);
    if (v9)
    {
      uint64_t v12 = 0;
      unsigned int v13 = *(unsigned __int8 *)(a2 + 981);
      if (v13 <= v10) {
        unsigned int v14 = v13 - 1;
      }
      else {
        unsigned int v14 = v10;
      }
      unint64_t v15 = (char *)(a2 + 1043);
      do
      {
        uint64_t v16 = a3 + 2 * v12;
        __int16 v18 = *(_WORD *)(v16 + 16);
        uint64_t v17 = (unsigned __int16 *)(v16 + 16);
        uint64_t v19 = a2 + 2 * v12;
        *(_WORD *)(v19 + 984) = v18;
        *(_WORD *)(v19 + 996) = 0;
        if ((v14 & 0x80000000) == 0)
        {
          int v20 = 0;
          uint64_t v21 = 0;
          BOOL v22 = (_WORD *)(v19 + 996);
          BOOL v23 = v15;
          do
          {
            char v24 = *v23;
            v23 += 32;
            if ((v24 & 0x10) != 0)
            {
              v20 |= *v17 & (1 << v21);
              *BOOL v22 = v20;
            }
            ++v21;
          }
          while (v14 + 1 != v21);
        }
        ++v12;
        v15 += 480;
      }
      while (v12 != v9);
    }
  }

  return gfxUpdateTextureCore(a2, (char *)a3, a4);
}

uint64_t gfxUpdateTextureCore(uint64_t result, char *a2, int a3)
{
  if (a3)
  {
    char v3 = *a2;
    char v4 = a2[1];
    *(unsigned char *)(result + 977) = v4;
    *(unsigned char *)(result + 976) = v3;
    *(unsigned char *)(result + 978) = v3 + v4 - 1;
    if ((a3 & 0x80) == 0)
    {
LABEL_3:
      if ((a3 & 0x80000000) == 0) {
        return result;
      }
LABEL_7:
      *(unsigned char *)(result + 556) = a2[30];
      return result;
    }
  }
  else if ((a3 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  __int16 v5 = *(_WORD *)(result + 982) & 0xFFF0 | a2[2] & 0xF;
  *(_WORD *)(result + 982) = v5;
  *(_WORD *)(result + 982) = v5 & 0xFF0F | (16 * (a2[3] & 0xF));
  if (a3 < 0) {
    goto LABEL_7;
  }
  return result;
}

uint64_t gfxEvaluateTextureForGeometryChange(uint64_t a1, uint64_t a2, uint64_t a3, int a4, unsigned int a5, int a6, int a7, int a8, int a9, int a10, unsigned __int8 a11, char a12)
{
  int v12 = a5;
  int v13 = a4;
  uint64_t v15 = a2;
  unsigned int v16 = *(unsigned __int16 *)(a2 + 982);
  unsigned int v17 = (v16 >> 9) & 3;
  unsigned int v18 = (v16 >> 11) & 3;
  uint64_t v19 = *(unsigned __int8 *)(a2 + 979);
  int v20 = a6 - 2 * a9;
  int v21 = a7 - v17 * a9;
  int v22 = a8 - v18 * a9;
  *(unsigned char *)(a3 + 32) = a4;
  *(unsigned char *)(a3 + 33) = a5;
  if (!a5)
  {
    unsigned int v25 = a6 - 2 * a9;
LABEL_125:
    *(_WORD *)(a3 + 10) = v25;
    *(_WORD *)(a3 + 12) = v21;
    *(_WORD *)(a3 + 14) = v22;
    *(_DWORD *)(a3 + 4) = *(_DWORD *)(v15 + 972);
    *(unsigned char *)(a3 + 31) = a9;
    *(_WORD *)(a3 + 8) = a10;
    *(unsigned char *)(a3 + 28) = a11;
    *(unsigned char *)(a3 + 29) = a12;
    if (v25 == *(unsigned __int16 *)(v15 + 962)
      && v21 == *(unsigned __int16 *)(v15 + 964)
      && v22 == *(unsigned __int16 *)(v15 + 966)
      && (unsigned int v77 = *(unsigned __int16 *)(v15 + 982), a9 == v77 >> 15)
      && *(unsigned __int16 *)(v15 + 960) == a10
      && *(unsigned __int8 *)(v15 + 980) == a11
      && ((v77 >> 14) & 1) == a12)
    {
      if (v19)
      {
        v78 = (__int16 *)(v15 + 984);
        v79 = (_WORD *)(a3 + 16);
        do
        {
          __int16 v80 = *v78++;
          *v79++ = v80;
          --v19;
        }
        while (v19);
      }
      int v68 = 12;
      if (v20)
      {
        uint64_t v81 = a3 + 2 * v13;
        int v82 = *(unsigned __int16 *)(v81 + 16) | (1 << a5);
        *(_WORD *)(v81 + 16) |= 1 << a5;
        if (*(unsigned __int16 *)(v15 + 2 * v13 + 984) == (unsigned __int16)v82) {
          int v68 = 12;
        }
        else {
          int v68 = 1073741836;
        }
      }
    }
    else
    {
      int v68 = 1073741837;
      if ((*(_WORD *)(v15 + 982) & 0x100) != 0)
      {
        if (v25) {
          *(_WORD *)(a3 + 16) = 1;
        }
        else {
          *(_WORD *)(a3 + 16) = 0;
        }
      }
      else if (v25)
      {
        uint64_t v83 = (int)v25;
        uint64_t v84 = -1;
        do
        {
          ++v84;
          BOOL v105 = (unint64_t)v83 > 1;
          v83 >>= 1;
        }
        while (v105);
        *(unsigned char *)(a3 + 4) = v84;
        if (v17)
        {
          if (v21)
          {
            uint64_t v85 = v21;
            uint64_t v86 = -1;
            do
            {
              ++v86;
              BOOL v105 = (unint64_t)v85 > 1;
              v85 >>= 1;
            }
            while (v105);
          }
          else
          {
            uint64_t v86 = -1;
          }
          if (v86 > v84) {
            uint64_t v84 = v86;
          }
          *(unsigned char *)(a3 + 5) = v86;
          if (v18)
          {
            if (v22)
            {
              uint64_t v88 = v22;
              uint64_t v87 = -1;
              do
              {
                ++v87;
                BOOL v105 = (unint64_t)v88 > 1;
                v88 >>= 1;
              }
              while (v105);
            }
            else
            {
              uint64_t v87 = -1;
            }
            if (v87 > v84) {
              uint64_t v84 = v87;
            }
          }
          else
          {
            LOBYTE(v87) = 0;
          }
        }
        else
        {
          LOBYTE(v87) = 0;
          *(unsigned char *)(a3 + 5) = 0;
        }
        *(unsigned char *)(a3 + 6) = v87;
        uint64_t v89 = *(unsigned __int8 *)(v15 + 559) - 1;
        if (v84 < v89) {
          uint64_t v89 = v84;
        }
        if (*(unsigned char *)(v15 + 559)) {
          uint64_t v90 = v89;
        }
        else {
          uint64_t v90 = v84;
        }
        *(unsigned char *)(a3 + 7) = v90;
        if (v19)
        {
          uint64_t v91 = 0;
          uint64_t v92 = *(unsigned __int8 *)(v15 + 981);
          if (v90 >= v92) {
            uint64_t v90 = v92 - 1;
          }
          int v93 = 1 << a5;
          uint64_t v110 = v15;
          int v111 = v13;
          uint64_t v94 = v13;
          uint64_t v95 = v15 + 560;
          v96 = (unsigned __int8 *)(v15 + 1042);
          do
          {
            if (v91 == v94) {
              int v97 = v93;
            }
            else {
              int v97 = 0;
            }
            uint64_t v98 = a3 + 2 * v91;
            *(_WORD *)(v98 + 16) = v97;
            v99 = (_WORD *)(v98 + 16);
            if ((v90 & 0x8000000000000000) == 0)
            {
              uint64_t v100 = 0;
              v101 = v96;
              int v102 = v22;
              int v103 = v21;
              int v104 = v25;
              do
              {
                if (v104 + 2 * a9 == *((unsigned __int16 *)v101 - 3)
                  && v103 + v17 * a9 == *((unsigned __int16 *)v101 - 2)
                  && v102 + v18 * a9 == *((unsigned __int16 *)v101 - 1)
                  && *v101 == a9
                  && ((*(unsigned char *)(a1 + 344) & 1) != 0 || *(unsigned __int16 *)(v95 + 2 * v100) == a10))
                {
                  v97 |= 1 << v100;
                  _WORD *v99 = v97;
                }
                int v104 = v104 >> (v104 > 1);
                if (v17) {
                  BOOL v105 = v103 <= 1;
                }
                else {
                  BOOL v105 = 1;
                }
                char v106 = !v105;
                int v103 = v103 >> v106;
                char v108 = v102 > 1 && v18 != 0;
                int v102 = v102 >> v108;
                ++v100;
                v101 += 32;
              }
              while (v90 + 1 != v100);
            }
            ++v91;
            v95 += 30;
            v96 += 480;
          }
          while (v91 != v19);
          int v12 = a5;
          uint64_t v15 = v110;
          int v13 = v111;
          int v68 = 1073741837;
        }
      }
      else
      {
        *(_DWORD *)(a3 + 4) = 0;
        if (v19) {
          bzero((void *)(a3 + 16), 2 * v19);
        }
      }
    }
    return gfxEvaluateTextureCore(a1, v15, a3, v13, v12, *(_DWORD *)(v15 + 884), *(_DWORD *)(v15 + 888), (*(unsigned __int8 *)(v15 + 898) >> 1) & 1, *(unsigned char *)(v15 + 898) & 1, a10) | v68;
  }
  int v23 = (v16 >> 13) & 1;
  if (*(_DWORD *)(a2 + 884) == a5)
  {
    if (*(unsigned __int16 *)(a2 + 960) == a10)
    {
      unsigned int v24 = *(unsigned __int16 *)(a2 + 982);
      unsigned int v25 = *(unsigned __int16 *)(a2 + 962);
      if ((v24 & 0x100) != 0) {
        goto LABEL_109;
      }
      unsigned int v26 = v25 >> a5;
      if (((v25 >> a5) | (v25 >> a5 == 0)) != v20 || a9 != v24 >> 15) {
        goto LABEL_124;
      }
      if (v23 | v17)
      {
        if (v17) {
          char v27 = a5;
        }
        else {
          char v27 = 0;
        }
        int v28 = *(unsigned __int16 *)(v15 + 964) >> v27;
        if ((v28 | (v28 == 0)) != v21) {
          goto LABEL_124;
        }
        char v29 = a5;
        if (!v18)
        {
          if (!v17 || !v23)
          {
            BOOL v32 = v28 == v21 && v23 == 0;
            if (v26 == v20) {
              goto LABEL_109;
            }
            goto LABEL_123;
          }
          char v29 = 0;
        }
        int v30 = *(unsigned __int16 *)(v15 + 966) >> v29;
        if ((v30 | (v30 == 0)) == v22)
        {
          BOOL v32 = v30 == v22 && v23 == 0;
          if (v26 == v20 || v28 == v21) {
            goto LABEL_109;
          }
LABEL_123:
          if (!v32) {
            goto LABEL_124;
          }
LABEL_109:
          int v21 = *(unsigned __int16 *)(v15 + 964);
          int v22 = *(unsigned __int16 *)(v15 + 966);
          goto LABEL_125;
        }
      }
      else if (v26 == v20)
      {
        goto LABEL_109;
      }
    }
LABEL_124:
    unsigned int v25 = v20 << a5;
    v21 <<= (v17 >> 1) * a5;
    v22 <<= (v18 >> 1) * a5;
    goto LABEL_125;
  }
  LOBYTE(v33) = *(unsigned char *)(a2 + 975);
  *(unsigned char *)(a3 + 7) = v33;
  *(_WORD *)(a3 + 10) = *(_WORD *)(a2 + 962);
  *(_DWORD *)(a3 + 12) = *(_DWORD *)(a2 + 964);
  if ((a5 & 0x80000000) == 0)
  {
    if (v19)
    {
      unsigned __int8 v34 = (__int16 *)(a2 + 984);
      __int16 v35 = (_WORD *)(a3 + 16);
      do
      {
        __int16 v36 = *v34++;
        *v35++ = v36;
        --v19;
      }
      while (v19);
    }
    unsigned int v37 = *(unsigned __int16 *)(a2 + 982);
    if ((v37 & 0x100) != 0)
    {
      if ((*(unsigned char *)(a1 + 344) & 1) == 0)
      {
        LOBYTE(v39) = 1;
LABEL_92:
        uint64_t v69 = a4;
        if (*(unsigned __int16 *)(a2 + 30 * a4 + 2 * a5 + 560) != *(unsigned __int16 *)(a2 + 960) || (v39 & 1) == 0) {
          goto LABEL_100;
        }
LABEL_97:
        uint64_t v70 = a3 + 2 * v69;
        int v71 = (unsigned __int16)(*(_WORD *)(v70 + 16) | (1 << a5));
        *(_WORD *)(v70 + 16) |= 1 << a5;
        goto LABEL_101;
      }
LABEL_96:
      uint64_t v69 = a4;
      goto LABEL_97;
    }
    int v38 = *(unsigned __int16 *)(a2 + 962) >> a5;
    if ((v38 | (v38 == 0)) != v20 || a9 != v37 >> 15)
    {
LABEL_90:
      int v39 = 0;
LABEL_91:
      if ((*(unsigned char *)(a1 + 344) & 1) == 0) {
        goto LABEL_92;
      }
      if (!v39)
      {
        uint64_t v69 = a4;
LABEL_100:
        uint64_t v72 = a3 + 2 * v69;
        int v73 = *(unsigned __int16 *)(v72 + 16);
        int v71 = v73 & ~(1 << a5);
        *(_WORD *)(v72 + 16) = v73 & ~(1 << a5);
LABEL_101:
        if (v71 == *(unsigned __int16 *)(a2 + 2 * v69 + 984)) {
          int v68 = 12;
        }
        else {
          int v68 = 1073741836;
        }
        return gfxEvaluateTextureCore(a1, v15, a3, v13, v12, *(_DWORD *)(v15 + 884), *(_DWORD *)(v15 + 888), (*(unsigned __int8 *)(v15 + 898) >> 1) & 1, *(unsigned char *)(v15 + 898) & 1, a10) | v68;
      }
      goto LABEL_96;
    }
    if (v23 | v17)
    {
      int v39 = 0;
      if (v17) {
        char v40 = a5;
      }
      else {
        char v40 = 0;
      }
      int v41 = *(unsigned __int16 *)(a2 + 964) >> v40;
      if ((v41 | (v41 == 0)) != v21) {
        goto LABEL_91;
      }
      char v42 = a5;
      if (v18)
      {
LABEL_43:
        int v43 = *(unsigned __int16 *)(a2 + 966) >> v42;
        if ((v43 | (v43 == 0)) == v22)
        {
          BOOL v45 = v38 == v20 || v41 == v21;
          int v39 = v43 == v22 && v23 == 0 || v45;
          goto LABEL_91;
        }
        goto LABEL_90;
      }
      if (v17 && v23)
      {
        char v42 = 0;
        goto LABEL_43;
      }
      BOOL v74 = v41 == v21 && v23 == 0 || v38 == v20;
    }
    else
    {
      BOOL v74 = v38 == v20;
    }
    int v39 = v74;
    goto LABEL_91;
  }
  if (v19)
  {
    unint64_t v47 = (__int16 *)(a2 + 984);
    uint64_t v48 = (_WORD *)(a3 + 16);
    do
    {
      __int16 v49 = *v47++;
      *v48++ = v49;
      --v19;
    }
    while (v19);
  }
  if (v20)
  {
    unsigned int v50 = *(unsigned __int16 *)(a2 + 962);
    unsigned int v51 = *(unsigned __int16 *)(a2 + 964);
    unsigned int v52 = *(unsigned __int16 *)(a2 + 966);
    unsigned int v53 = *(unsigned __int16 *)(a2 + 982);
    unsigned int v33 = v33;
    unsigned int v54 = *(unsigned __int8 *)(a2 + 981);
    int v55 = *(unsigned __int8 *)(a2 + 559) - 1;
    if (v33 > (*(unsigned char *)(a2 + 559) - 1))
    {
      *(unsigned char *)(a3 + 7) = *(unsigned char *)(a2 + 559) - 1;
      unsigned int v33 = v55;
    }
    if (v33 >= v54) {
      unsigned int v56 = v54 - 1;
    }
    else {
      unsigned int v56 = v33;
    }
    uint64_t v57 = a3 + 2 * v13;
    *(_WORD *)(v57 + 16) = 0;
    CFStringRef v58 = (_WORD *)(v57 + 16);
    int v59 = 0;
    if ((v56 & 0x80000000) == 0)
    {
      uint64_t v60 = 0;
      unsigned int v61 = v53 >> 15;
      uint64_t v62 = v56 + 1;
      uint64_t v63 = (unsigned __int8 *)(a2 + 480 * v13 + 1042);
      do
      {
        if (v50 + 2 * v61 == *((unsigned __int16 *)v63 - 3)
          && v51 + v61 * v17 == *((unsigned __int16 *)v63 - 2)
          && v52 + v61 * v18 == *((unsigned __int16 *)v63 - 1)
          && v61 == *v63)
        {
          v59 |= (unsigned __int16)(1 << v60);
          *CFStringRef v58 = v59;
        }
        v63 += 32;
        v50 >>= v50 > 1;
        char v65 = v51 > 1 && v17 != 0;
        v51 >>= v65;
        char v67 = v52 > 1 && v18 != 0;
        v52 >>= v67;
        ++v60;
      }
      while (v62 != v60);
    }
    if (v59 == *(unsigned __int16 *)(a2 + 2 * v13 + 984)) {
      int v68 = 12;
    }
    else {
      int v68 = 1073741836;
    }
  }
  else
  {
    *(_WORD *)(a3 + 2 * a4 + 16) = 0;
    int v68 = 12;
  }
  return gfxEvaluateTextureCore(a1, v15, a3, v13, v12, *(_DWORD *)(v15 + 884), *(_DWORD *)(v15 + 888), (*(unsigned __int8 *)(v15 + 898) >> 1) & 1, *(unsigned char *)(v15 + 898) & 1, a10) | v68;
}

uint64_t gfxUpdateTextureForGeometryChange(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = *(char *)(a3 + 32);
  uint64_t v8 = *(char *)(a3 + 33);
  if (*(unsigned char *)(a3 + 33) && *(_DWORD *)(a2 + 884) != v8)
  {
    if ((v8 & 0x80000000) == 0)
    {
      int v9 = 1 << *(unsigned char *)(a3 + 33);
      int v29 = *(unsigned __int16 *)(a3 + 2 * v7 + 16);
      *(_WORD *)(a2 + 2 * v7 + 984) = v29;
      if (((1 << v8) & v29) == 0 || (*(unsigned char *)(a2 + 480 * (int)v7 + 32 * v8 + 1043) & 0x10) == 0)
      {
        uint64_t v30 = a2 + 2 * v7;
        __int16 v31 = *(_WORD *)(v30 + 996) & ~(_WORD)v9;
LABEL_26:
        *(_WORD *)(v30 + 996) = v31;
        goto LABEL_27;
      }
LABEL_25:
      uint64_t v30 = a2 + 2 * v7;
      __int16 v31 = *(_WORD *)(v30 + 996) | v9;
      goto LABEL_26;
    }
    uint64_t v33 = a2 + 2 * v7;
    unsigned int v34 = *(unsigned __int8 *)(a2 + 981);
    int v35 = v34 - 1;
    BOOL v36 = v34 > *(unsigned __int8 *)(a2 + 975);
    uint64_t v37 = a3 + 2 * v7;
    __int16 v40 = *(_WORD *)(v37 + 16);
    int v38 = (unsigned __int16 *)(v37 + 16);
    __int16 v39 = v40;
    if (v36) {
      int v35 = *(unsigned __int8 *)(a2 + 975);
    }
    *(_WORD *)(v33 + 984) = v39;
    int v41 = *(_WORD *)(v33 + 996) & 1;
    *(_WORD *)(v33 + 996) &= 1u;
    if (v35 >= 1)
    {
      char v42 = (_WORD *)(v33 + 996);
      uint64_t v43 = (v35 + 1);
      uint64_t v44 = (char *)(a2 + 480 * (int)v7 + 1075);
      uint64_t v45 = 1;
      do
      {
        char v46 = *v44;
        v44 += 32;
        if ((v46 & 0x10) != 0)
        {
          v41 |= *v38 & (1 << v45);
          _WORD *v42 = v41;
        }
        ++v45;
      }
      while (v43 != v45);
    }
  }
  else
  {
    if ((a4 & 1) == 0)
    {
      int v9 = 1 << *(unsigned char *)(a3 + 33);
      int v10 = *(unsigned __int16 *)(a3 + 2 * v7 + 16);
      uint64_t v11 = a2 + 2 * v7;
      *(_WORD *)(v11 + 984) = v10;
      if (((1 << v8) & v10) == 0 || (*(unsigned char *)(a2 + 480 * (int)v7 + 32 * (int)v8 + 1043) & 0x10) == 0)
      {
        *(_WORD *)(v11 + 996) &= ~(_WORD)v9;
        goto LABEL_27;
      }
      goto LABEL_25;
    }
    uint64_t v12 = *(unsigned __int8 *)(a2 + 979);
    *(_WORD *)(a2 + 962) = *(_WORD *)(a3 + 10);
    *(_DWORD *)(a2 + 964) = *(_DWORD *)(a3 + 12);
    unsigned int v13 = *(unsigned __int8 *)(a3 + 7);
    __int16 v14 = *(_WORD *)(a2 + 982);
    if ((v14 & 0x100) == 0)
    {
      __int16 v14 = v14 & 0x7FFF | ((*(unsigned char *)(a3 + 31) & 1) << 15);
      *(_WORD *)(a2 + 982) = v14;
      *(unsigned char *)(a2 + 972) = *(unsigned char *)(a3 + 4);
      *(_WORD *)(a2 + 973) = *(_WORD *)(a3 + 5);
      *(unsigned char *)(a2 + 975) = v13;
    }
    uint64_t v15 = *(unsigned __int16 *)(a3 + 8);
    *(_WORD *)(a2 + 960) = v15;
    *(unsigned char *)(a2 + 980) = *(unsigned char *)(a3 + 28);
    *(_WORD *)(a2 + 982) = v14 & 0xBFFF | ((*(unsigned char *)(a3 + 29) & 1) << 14);
    *(_WORD *)(a2 + 772) = gfxReqToBase(v15);
    if (v12)
    {
      uint64_t v16 = 0;
      unsigned int v17 = *(unsigned __int8 *)(a2 + 981);
      if (v17 <= v13) {
        unsigned int v18 = v17 - 1;
      }
      else {
        unsigned int v18 = v13;
      }
      uint64_t v19 = (char *)(a2 + 1043);
      do
      {
        uint64_t v20 = a3 + 2 * v16;
        __int16 v22 = *(_WORD *)(v20 + 16);
        int v21 = (unsigned __int16 *)(v20 + 16);
        uint64_t v23 = a2 + 2 * v16;
        *(_WORD *)(v23 + 984) = v22;
        *(_WORD *)(v23 + 996) = 0;
        if ((v18 & 0x80000000) == 0)
        {
          int v24 = 0;
          uint64_t v25 = 0;
          unsigned int v26 = (_WORD *)(v23 + 996);
          char v27 = v19;
          do
          {
            char v28 = *v27;
            v27 += 32;
            if ((v28 & 0x10) != 0)
            {
              v24 |= *v21 & (1 << v25);
              *unsigned int v26 = v24;
            }
            ++v25;
          }
          while (v18 + 1 != v25);
        }
        ++v16;
        v19 += 480;
      }
      while (v16 != v12);
    }
  }
LABEL_27:

  return gfxUpdateTextureCore(a2, (char *)a3, a4);
}

uint64_t gfxUpdatePluginTextureLevelGeometry(uint64_t result, uint64_t a2, int a3, int a4, char a5)
{
  unsigned int v5 = *(unsigned __int8 *)(result + 320);
  if (*(unsigned char *)(result + 320))
  {
    char v6 = a3;
    uint64_t v8 = result;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = a3 & 0x3FFFFFFF;
    int v15 = 1 << a5;
    uint64_t v12 = a2 + 2 * a4 + 104;
    uint64_t v13 = result + 360;
    do
    {
      uint64_t v14 = a2 + v9;
      *(unsigned char *)(a2 + v9 + 116) |= v6;
      if (v6)
      {
        uint64_t result = (*(uint64_t (**)(void, void, uint64_t))(*(void *)v13 + 1368))(*(void *)(v13 - 8), *(void *)(a2 + 8 * v10), v11);
        *(void *)(v14 + 104) = -1;
        *(_DWORD *)(v14 + 112) = -1;
        unsigned int v5 = *(unsigned __int8 *)(v8 + 320);
      }
      else if ((v6 & 4) != 0)
      {
        *(_WORD *)(v12 + v9) |= v15;
      }
      ++v10;
      v13 += 32;
      v9 += 24;
    }
    while (v10 < v5);
  }
  return result;
}

__CFArray *gfxAnnotateTexture(uint64_t a1, uint64_t a2, const void *a3, const void *a4)
{
  v14[8] = *MEMORY[0x263EF8340];
  if ((*(_WORD *)(a2 + 768) & 0xF) == 7) {
    return 0;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (*(unsigned char *)(a1 + 320))
  {
    unint64_t v9 = 0;
    do
    {
      unsigned int v13 = 8;
      (*(void (**)(void, unsigned int *, void *))(*(void *)(a1 + 32 * v9 + 360) + 1448))(*(void *)(a2 + 8 * v9), &v13, v14);
      if (v13)
      {
        for (unint64_t i = 0; i < v13; ++i)
        {
          AnnotateDictionary = CreateAnnotateDictionary(v14[i], a3, a4);
          CFArrayAppendValue(Mutable, AnnotateDictionary);
          CFRelease(AnnotateDictionary);
        }
      }
      ++v9;
    }
    while (v9 < *(unsigned __int8 *)(a1 + 320));
  }
  return Mutable;
}

__CFDictionary *CreateAnnotateDictionary(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t v16 = a1;
  unsigned int v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  char v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFMutableArrayRef v8 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  CFDictionaryAddValue(Mutable, @"Processes", v8);
  CFRelease(v8);
  CFMutableDictionaryRef v9 = CFDictionaryCreateMutable(0, 0, v5, v6);
  CFArrayAppendValue(v8, v9);
  CFRelease(v9);
  pid_t valuePtr = getpid();
  CFNumberRef v10 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v9, @"PID", v10);
  CFRelease(v10);
  if (a2 && a3)
  {
    CFMutableArrayRef v11 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    CFDictionaryAddValue(v9, a2, v11);
    CFRelease(v11);
    CFArrayAppendValue(v11, a3);
  }
  values = CFNumberCreate(0, kCFNumberSInt64Type, &v16);
  CFArrayRef v12 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
  CFDictionaryAddValue(Mutable, @"AllocationIdentifiers", v12);
  CFRelease(v12);
  CFRelease(values);
  return Mutable;
}

__CFArray *gfxAnnotateBuffer(uint64_t a1, uint64_t a2, const void *a3, const void *a4)
{
  v14[2] = *MEMORY[0x263EF8340];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (*(unsigned char *)(a1 + 320))
  {
    unint64_t v9 = 0;
    do
    {
      unsigned int v13 = 0;
      (*(void (**)(void, unsigned int *, void *))(*(void *)(a1 + 32 * v9 + 360) + 1528))(*(void *)(a2 + 8 * v9), &v13, v14);
      if (v13)
      {
        for (unint64_t i = 0; i < v13; ++i)
        {
          AnnotateDictionary = CreateAnnotateDictionary(v14[i], a3, a4);
          CFArrayAppendValue(Mutable, AnnotateDictionary);
          CFRelease(AnnotateDictionary);
        }
      }
      ++v9;
    }
    while (v9 < *(unsigned __int8 *)(a1 + 320));
  }
  return Mutable;
}

__CFArray *gfxGetOGLMemoryAnnotationList()
{
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  ShareList = GetShareList();
  int v2 = (pthread_mutex_t *)(ShareList + 1);
  pthread_mutex_lock((pthread_mutex_t *)(ShareList + 1));
  char v3 = (uint64_t *)*ShareList;
  if (*ShareList)
  {
    do
    {
      uint64_t v4 = *v3;
      unsigned int v5 = (os_unfair_lock_s *)(*v3 + 324);
      os_unfair_lock_lock(v5);
      AnnotateObjectsInHash(Mutable, v4, 2u);
      AnnotateObjectsInHash(Mutable, v4, 1u);
      AnnotateObjectsInHash(Mutable, v4, 8u);
      os_unfair_lock_unlock(v5);
      char v3 = (uint64_t *)v3[1];
    }
    while (v3);
  }
  pthread_mutex_unlock(v2);
  return Mutable;
}

uint64_t gfxAnnotateAddDataSource()
{
  return MEMORY[0x270F3D2B0]();
}

uint64_t gfxAnnotateRemoveDataSource()
{
  return MEMORY[0x270F3D2A8]();
}

void AnnotateObjectsInHash(__CFArray *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v30 = (void *)(a2 + 32 * a3 + 16);
  if (*v30)
  {
    uint64_t v4 = a2;
    unsigned int v5 = 0;
    int v29 = (_DWORD *)(a2 + 32 * a3 + 32);
    unsigned int v6 = a3 - 1;
    uint64_t v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    CFMutableArrayRef v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    while (1)
    {
      uint64_t v9 = *(void *)(*v30 + 8 * v5);
      if (v9) {
        break;
      }
LABEL_270:
      if (++v5 > *v29) {
        return;
      }
    }
    while (1)
    {
      if (v6 >= 2)
      {
        if (a3 == 8)
        {
          Mutable = CFDictionaryCreateMutable(0, 0, v7, v8);
          AnnotateOGLHashObj(v4, v9, Mutable);
          CFDictionaryAddValue(Mutable, @"Type", @"Buffer");
          uint64_t v19 = "NO_USAGE!";
          if ((unsigned __int16)(*(_WORD *)(v9 + 160) + 30496) <= 0xAu) {
            uint64_t v19 = off_26413A5A0[(__int16)(*(_WORD *)(v9 + 160) + 30496)];
          }
          CFStringRef v20 = CFStringCreateWithCString(0, v19, 0x600u);
          CFDictionaryAddValue(Mutable, @"Description", v20);
          CFRelease(v20);
          int v21 = gfxAnnotateBuffer(v4, v9 + 40, @"OpenGLObjects", Mutable);
          goto LABEL_267;
        }
      }
      else
      {
        int v10 = *(_WORD *)(v9 + 808) & 0xF;
        if (v10 != 7)
        {
          Mutable = CFDictionaryCreateMutable(0, 0, v7, v8);
          AnnotateOGLHashObj(v4, v9, Mutable);
          if ((*(_WORD *)(v9 + 808) & 0x2000) != 0) {
            CFArrayRef v12 = @"Renderbuffer";
          }
          else {
            CFArrayRef v12 = @"Texture";
          }
          CFDictionaryAddValue(Mutable, @"Type", v12);
          unsigned int v13 = CFStringCreateMutable(0, 512);
          uint64_t v14 = v13;
          int v15 = "CUBE";
          switch(v10)
          {
            case 0:
              goto LABEL_20;
            case 1:
              CFStringAppendFormat(v13, 0, @"%s", "3D");
              uint64_t v16 = (unsigned __int16 *)(v9 + 1000);
              unsigned int v17 = (unsigned __int16 *)(v9 + 1004);
              unsigned int v18 = (unsigned __int16 *)(v9 + 1006);
              CFStringAppendFormat(v14, 0, @", %d x %d x %d", *(unsigned __int16 *)(v9 + 1002), *(unsigned __int16 *)(v9 + 1004), *(unsigned __int16 *)(v9 + 1006));
              goto LABEL_22;
            case 2:
              int v15 = "RECT";
              goto LABEL_20;
            case 3:
              int v15 = "2D";
              goto LABEL_20;
            case 5:
              int v15 = "2D_ARRAY";
LABEL_20:
              CFStringAppendFormat(v13, 0, @"%s", v15);
              uint64_t v16 = (unsigned __int16 *)(v9 + 1000);
              uint64_t v22 = *(unsigned __int16 *)(v9 + 1002);
              unsigned int v17 = (unsigned __int16 *)(v9 + 1004);
              unsigned int v18 = (unsigned __int16 *)(v9 + 1006);
              goto LABEL_21;
            default:
              CFStringAppendFormat(v13, 0, @"%s", "INVALID");
              uint64_t v16 = (unsigned __int16 *)(v9 + 1000);
              uint64_t v22 = *(unsigned __int16 *)(v9 + 1002);
              unsigned int v17 = (unsigned __int16 *)(v9 + 1004);
              if ((v10 - 8) >= 3)
              {
                if (v10 == 6 || v10 == 4) {
                  CFStringAppendFormat(v14, 0, @", %d", *(unsigned __int16 *)(v9 + 1002));
                }
                unsigned int v18 = (unsigned __int16 *)(v9 + 1006);
                uint64_t v4 = a2;
              }
              else
              {
                unsigned int v18 = (unsigned __int16 *)(v9 + 1006);
                uint64_t v4 = a2;
LABEL_21:
                CFStringAppendFormat(v14, 0, @", %d x %d", v22, *v17, v27);
              }
LABEL_22:
              int v23 = *v16;
              if (v23 <= 0x8D61)
              {
                if (*v16 > 0x85B8u)
                {
                  uint64_t v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
                  if (v23 > 35897)
                  {
                    switch(v23)
                    {
                      case 35898:
                        uint64_t v25 = "R11FG11FB10F";
                        break;
                      case 35899:
                      case 35900:
                      case 35902:
                      case 35903:
                      case 35910:
                      case 35912:
                      case 35913:
                      case 35914:
                      case 35915:
                        goto LABEL_254;
                      case 35901:
                        uint64_t v25 = "RGB9E5";
                        break;
                      case 35904:
                        uint64_t v25 = "SRGB";
                        break;
                      case 35905:
                        uint64_t v25 = "SRGB8";
                        break;
                      case 35906:
                        uint64_t v25 = "SRGB_ALPHA";
                        break;
                      case 35907:
                        uint64_t v25 = "SRGB8_ALPHA8";
                        break;
                      case 35908:
                        uint64_t v25 = "SLUMINANCE_ALPHA";
                        break;
                      case 35909:
                        uint64_t v25 = "SLUMINANCE8_ALPHA8";
                        break;
                      case 35911:
                        uint64_t v25 = "SLUMINANCE8";
                        break;
                      case 35916:
                        uint64_t v25 = "COMPRESSED_SRGB_S3TC_DXT1";
                        break;
                      case 35917:
                        uint64_t v25 = "COMPRESSED_SRGB_ALPHA_S3TC_DXT1";
                        break;
                      case 35918:
                        uint64_t v25 = "COMPRESSED_SRGB_ALPHA_S3TC_DXT3";
                        break;
                      case 35919:
                        uint64_t v25 = "COMPRESSED_SRGB_ALPHA_S3TC_DXT5";
                        break;
                      default:
                        if (v23 == 36012)
                        {
                          uint64_t v25 = "DEPTH32F";
                        }
                        else
                        {
                          if (v23 != 36013) {
                            goto LABEL_254;
                          }
                          uint64_t v25 = "DEPTH32F_STENCIL8";
                        }
                        break;
                    }
                  }
                  else if (v23 <= 34870)
                  {
                    switch(v23)
                    {
                      case 34233:
                        uint64_t v25 = "YCBCR";
                        break;
                      case 34842:
                        uint64_t v25 = "RGBA16F";
                        break;
                      case 34843:
                        uint64_t v25 = "RGB16F";
                        break;
                      default:
LABEL_254:
                        uint64_t v25 = "UNKNOWN";
                        break;
                    }
                  }
                  else
                  {
                    switch(v23)
                    {
                      case 35420:
                        uint64_t v25 = "COMPRESSED_RGBA_ASTC_4x2_APPLE";
                        break;
                      case 35421:
                        uint64_t v25 = "COMPRESSED_RGBA_ASTC_8x4_APPLE";
                        break;
                      case 35422:
                        uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_4x2_APPLE";
                        break;
                      case 35423:
                        uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_8x4_APPLE";
                        break;
                      case 35424:
                      case 35425:
                      case 35426:
                      case 35427:
                      case 35428:
                      case 35445:
                        goto LABEL_254;
                      case 35429:
                        uint64_t v25 = "YCBCR8_420_2PLANE_APPLE";
                        break;
                      case 35430:
                        uint64_t v25 = "YCBCR8_422_1PLANE_APPLE";
                        break;
                      case 35431:
                        uint64_t v25 = "YCBCR8_422_2PLANE_APPLE";
                        break;
                      case 35432:
                        uint64_t v25 = "YCBCR8_444_2PLANE_APPLE";
                        break;
                      case 35433:
                        uint64_t v25 = "YCBCR10_444_1PLANE_APPLE";
                        break;
                      case 35434:
                        uint64_t v25 = "YCBCR10_422_2PLANE_APPLE";
                        break;
                      case 35435:
                        uint64_t v25 = "YCBCR10_420_2PLANE_APPLE";
                        break;
                      case 35436:
                        uint64_t v25 = "YCBCR10_444_2PLANE_APPLE";
                        break;
                      case 35437:
                        uint64_t v25 = "SRGB_YCBCR8_420_2PLANE_APPLE";
                        break;
                      case 35438:
                        uint64_t v25 = "SRGB_YCBCR8_422_1PLANE_APPLE";
                        break;
                      case 35439:
                        uint64_t v25 = "SRGB_YCBCR8_422_2PLANE_APPLE";
                        break;
                      case 35440:
                        uint64_t v25 = "SRGB_YCBCR8_444_2PLANE_APPLE";
                        break;
                      case 35441:
                        uint64_t v25 = "SRGB_YCBCR10_444_1PLANE_APPLE";
                        break;
                      case 35442:
                        uint64_t v25 = "SRGB_YCBCR10_422_2PLANE_APPLE";
                        break;
                      case 35443:
                        uint64_t v25 = "SRGB_YCBCR10_420_2PLANE_APPLE";
                        break;
                      case 35444:
                        uint64_t v25 = "SRGB_YCBCR10_444_2PLANE_APPLE";
                        break;
                      case 35446:
                        uint64_t v25 = "ARGBV16_XR10_APPLE";
                        break;
                      case 35447:
                        uint64_t v25 = "SRGB_ARGBV16_XR10_APPLE";
                        break;
                      case 35448:
                        uint64_t v25 = "SR8_APPLE";
                        break;
                      default:
                        if (v23 == 34871)
                        {
                          uint64_t v25 = "ATI_3DC";
                        }
                        else
                        {
                          if (v23 != 35056) {
                            goto LABEL_254;
                          }
                          uint64_t v25 = "DEPTH24_STENCIL8";
                        }
                        break;
                    }
                  }
                }
                else
                {
                  uint64_t v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
                  if (v23 <= 33190)
                  {
                    if (v23 > 33188)
                    {
                      if (v23 == 33189) {
                        uint64_t v25 = "DEPTH16";
                      }
                      else {
                        uint64_t v25 = "DEPTH24";
                      }
                    }
                    else
                    {
                      switch(v23)
                      {
                        case 32828:
                          uint64_t v25 = "ALPHA8";
                          break;
                        case 32829:
                        case 32831:
                        case 32833:
                        case 32835:
                        case 32836:
                        case 32838:
                        case 32839:
                        case 32841:
                        case 32842:
                        case 32844:
                        case 32846:
                        case 32850:
                        case 32851:
                        case 32853:
                        case 32858:
                          goto LABEL_254;
                        case 32830:
                          uint64_t v25 = "ALPHA16";
                          break;
                        case 32832:
                          uint64_t v25 = "LUM8";
                          break;
                        case 32834:
                          uint64_t v25 = "LUM16";
                          break;
                        case 32837:
                          uint64_t v25 = "L8A8";
                          break;
                        case 32840:
                          uint64_t v25 = "L16A16";
                          break;
                        case 32843:
                          uint64_t v25 = "INT8";
                          break;
                        case 32845:
                          uint64_t v25 = "INT16";
                          break;
                        case 32847:
                          uint64_t v25 = "RGB4";
                          break;
                        case 32848:
                          uint64_t v25 = "RGB5";
                          break;
                        case 32849:
                          uint64_t v25 = "RGB8";
                          break;
                        case 32852:
                          uint64_t v25 = "RGB16";
                          break;
                        case 32854:
                          uint64_t v25 = "RGBA4";
                          break;
                        case 32855:
                          uint64_t v25 = "RGB5A1";
                          break;
                        case 32856:
                          uint64_t v25 = "RGBA8";
                          break;
                        case 32857:
                          uint64_t v25 = "RGB10A2";
                          break;
                        case 32859:
                          uint64_t v25 = "RGBA16";
                          break;
                        default:
                          if (v23 != 10768) {
                            goto LABEL_254;
                          }
                          uint64_t v25 = "RG3B2";
                          break;
                      }
                    }
                  }
                  else
                  {
                    switch(v23)
                    {
                      case 33321:
                        uint64_t v25 = "R8";
                        break;
                      case 33322:
                        uint64_t v25 = "R16";
                        break;
                      case 33323:
                        uint64_t v25 = "RG8";
                        break;
                      case 33324:
                        uint64_t v25 = "RG16";
                        break;
                      case 33325:
                        uint64_t v25 = "R16F";
                        break;
                      case 33326:
                      case 33328:
                        goto LABEL_254;
                      case 33327:
                        uint64_t v25 = "RG16F";
                        break;
                      case 33329:
                        uint64_t v25 = "R8I";
                        break;
                      case 33330:
                        uint64_t v25 = "R8UI";
                        break;
                      case 33331:
                        uint64_t v25 = "R16I";
                        break;
                      case 33332:
                        uint64_t v25 = "R16UI";
                        break;
                      case 33333:
                        uint64_t v25 = "R32I";
                        break;
                      case 33334:
                        uint64_t v25 = "R32UI";
                        break;
                      case 33335:
                        uint64_t v25 = "RG8I";
                        break;
                      case 33336:
                        uint64_t v25 = "RG8UI";
                        break;
                      case 33337:
                        uint64_t v25 = "RG16I";
                        break;
                      case 33338:
                        uint64_t v25 = "RG16UI";
                        break;
                      case 33339:
                        uint64_t v25 = "RG32I";
                        break;
                      case 33340:
                        uint64_t v25 = "RG32UI";
                        break;
                      default:
                        switch(v23)
                        {
                          case 33776:
                            uint64_t v25 = "DXT1";
                            break;
                          case 33777:
                            uint64_t v25 = "DXT1A";
                            break;
                          case 33778:
                            uint64_t v25 = "DXT3";
                            break;
                          case 33779:
                            uint64_t v25 = "DXT5";
                            break;
                          default:
                            if (v23 != 33191) {
                              goto LABEL_254;
                            }
                            uint64_t v25 = "DEPTH32";
                            break;
                        }
                        break;
                    }
                  }
                }
              }
              else if (*v16 > 0x926Fu)
              {
                uint64_t v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
                switch(v23)
                {
                  case 37808:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_4x4_KHR";
                    break;
                  case 37809:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_5x4_KHR";
                    break;
                  case 37810:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_5x5_KHR";
                    break;
                  case 37811:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_6x5_KHR";
                    break;
                  case 37812:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_6x6_KHR";
                    break;
                  case 37813:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_8x5_KHR";
                    break;
                  case 37814:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_8x6_KHR";
                    break;
                  case 37815:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_8x8_KHR";
                    break;
                  case 37816:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_10x5_KHR";
                    break;
                  case 37817:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_10x6_KHR";
                    break;
                  case 37818:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_10x8_KHR";
                    break;
                  case 37819:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_10x10_KHR";
                    break;
                  case 37820:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_12x10_KHR";
                    break;
                  case 37821:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_12x12_KHR";
                    break;
                  case 37822:
                  case 37823:
                  case 37824:
                  case 37825:
                  case 37826:
                  case 37827:
                  case 37828:
                  case 37829:
                  case 37830:
                  case 37831:
                  case 37832:
                  case 37833:
                  case 37834:
                  case 37835:
                  case 37836:
                  case 37837:
                  case 37838:
                  case 37839:
                  case 37854:
                  case 37855:
                  case 37856:
                  case 37857:
                  case 37858:
                  case 37859:
                  case 37860:
                  case 37861:
                  case 37862:
                  case 37863:
                  case 37864:
                  case 37865:
                  case 37866:
                  case 37867:
                  case 37868:
                  case 37869:
                  case 37870:
                  case 37871:
                  case 37872:
                  case 37873:
                  case 37882:
                  case 37902:
                    goto LABEL_254;
                  case 37840:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR";
                    break;
                  case 37841:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR";
                    break;
                  case 37842:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR";
                    break;
                  case 37843:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR";
                    break;
                  case 37844:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR";
                    break;
                  case 37845:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR";
                    break;
                  case 37846:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR";
                    break;
                  case 37847:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR";
                    break;
                  case 37848:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR";
                    break;
                  case 37849:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR";
                    break;
                  case 37850:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR";
                    break;
                  case 37851:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR";
                    break;
                  case 37852:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR";
                    break;
                  case 37853:
                    uint64_t v25 = "COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR";
                    break;
                  case 37874:
                    uint64_t v25 = "XRSRGB10_APPLE";
                    break;
                  case 37875:
                    uint64_t v25 = "YCBCR10_422_2PLANE_PACKED_APPLE";
                    break;
                  case 37876:
                    uint64_t v25 = "YCBCR10_420_2PLANE_PACKED_APPLE";
                    break;
                  case 37877:
                    uint64_t v25 = "YCBCR10_444_2PLANE_PACKED_APPLE";
                    break;
                  case 37878:
                    uint64_t v25 = "SRGB_YCBCR10_422_2PLANE_PACKED_APPLE";
                    break;
                  case 37879:
                    uint64_t v25 = "SRGB_YCBCR10_420_2PLANE_PACKED_APPLE";
                    break;
                  case 37880:
                    uint64_t v25 = "SRGB_YCBCR10_444_2PLANE_PACKED_APPLE";
                    break;
                  case 37881:
                    uint64_t v25 = "XRSRGB10_PLANE_A8_PLANE_APPLE";
                    break;
                  case 37883:
                    uint64_t v25 = "RGB8_420_2PLANE_APPLE";
                    break;
                  case 37884:
                    uint64_t v25 = "RGB8_422_2PLANE_APPLE";
                    break;
                  case 37885:
                    uint64_t v25 = "RGB8_444_2PLANE_APPLE";
                    break;
                  case 37886:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_4x2_LOWPRECISION_APPLE";
                    break;
                  case 37887:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_4x4_LOWPRECISION_APPLE";
                    break;
                  case 37888:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_5x4_LOWPRECISION_APPLE";
                    break;
                  case 37889:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_5x5_LOWPRECISION_APPLE";
                    break;
                  case 37890:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_6x5_LOWPRECISION_APPLE";
                    break;
                  case 37891:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_6x6_LOWPRECISION_APPLE";
                    break;
                  case 37892:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_8x4_LOWPRECISION_APPLE";
                    break;
                  case 37893:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_8x5_LOWPRECISION_APPLE";
                    break;
                  case 37894:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_8x6_LOWPRECISION_APPLE";
                    break;
                  case 37895:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_8x8_LOWPRECISION_APPLE";
                    break;
                  case 37896:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_10x5_LOWPRECISION_APPLE";
                    break;
                  case 37897:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_10x6_LOWPRECISION_APPLE";
                    break;
                  case 37898:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_10x8_LOWPRECISION_APPLE";
                    break;
                  case 37899:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_10x10_LOWPRECISION_APPLE";
                    break;
                  case 37900:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_12x10_LOWPRECISION_APPLE";
                    break;
                  case 37901:
                    uint64_t v25 = "COMPRESSED_RGBA_ASTC_12x12_LOWPRECISION_APPLE";
                    break;
                  case 37903:
                    uint64_t v25 = "YCBCR8A8_444_1PLANE_APPLE";
                    break;
                  case 37904:
                    uint64_t v25 = "CRYCB8A8_444_1PLANE_APPLE";
                    break;
                  default:
                    switch(v23)
                    {
                      case 37488:
                        uint64_t v25 = "ETC2R";
                        break;
                      case 37489:
                        uint64_t v25 = "ETC2RSNORM";
                        break;
                      case 37490:
                        uint64_t v25 = "ETC2RG";
                        break;
                      case 37491:
                        uint64_t v25 = "ETC2RGSNORM";
                        break;
                      case 37492:
                        uint64_t v25 = "ETC2RGB";
                        break;
                      case 37494:
                        uint64_t v25 = "ETC2RGBAPUNCH";
                        break;
                      case 37496:
                        uint64_t v25 = "ETC2RGBA";
                        break;
                      default:
                        goto LABEL_254;
                    }
                    break;
                }
              }
              else
              {
                int v24 = v23 - 36194;
                uint64_t v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
                uint64_t v25 = "RGB565";
                switch(v24)
                {
                  case 0:
                    break;
                  case 1:
                  case 2:
                  case 3:
                  case 4:
                  case 5:
                  case 6:
                  case 7:
                  case 8:
                  case 9:
                  case 10:
                  case 11:
                  case 12:
                  case 13:
                  case 50:
                  case 51:
                  case 52:
                  case 53:
                  case 56:
                  case 57:
                  case 58:
                  case 59:
                  case 60:
                  case 61:
                  case 62:
                  case 63:
                  case 64:
                  case 65:
                  case 66:
                  case 67:
                  case 68:
                  case 69:
                  case 70:
                  case 71:
                  case 72:
                  case 73:
                  case 74:
                  case 75:
                  case 76:
                  case 77:
                  case 78:
                  case 79:
                  case 80:
                  case 81:
                  case 82:
                  case 83:
                  case 84:
                  case 85:
                  case 86:
                  case 87:
                  case 88:
                    goto LABEL_254;
                  case 14:
                    uint64_t v25 = "RGBA32UI";
                    break;
                  case 15:
                    uint64_t v25 = "RGB32UI";
                    break;
                  case 16:
                    uint64_t v25 = "ALPHA32UI";
                    break;
                  case 17:
                    uint64_t v25 = "INT32UI";
                    break;
                  case 18:
                    uint64_t v25 = "LUM32UI";
                    break;
                  case 19:
                    uint64_t v25 = "LA32UI";
                    break;
                  case 20:
                    uint64_t v25 = "RGBA16UI";
                    break;
                  case 21:
                    uint64_t v25 = "RGB16UI";
                    break;
                  case 22:
                    uint64_t v25 = "ALPHA16UI";
                    break;
                  case 23:
                    uint64_t v25 = "INT16UI";
                    break;
                  case 24:
                    uint64_t v25 = "LUM16UI";
                    break;
                  case 25:
                    uint64_t v25 = "LA16UI";
                    break;
                  case 26:
                    uint64_t v25 = "RGBA8UI";
                    break;
                  case 27:
                    uint64_t v25 = "RGB8UI";
                    break;
                  case 28:
                    uint64_t v25 = "ALPHA8UI";
                    break;
                  case 29:
                    uint64_t v25 = "INT8UI";
                    break;
                  case 30:
                    uint64_t v25 = "LUM8UI";
                    break;
                  case 31:
                    uint64_t v25 = "LA8UI";
                    break;
                  case 32:
                    uint64_t v25 = "RGBA32I";
                    break;
                  case 33:
                    uint64_t v25 = "RGB32I";
                    break;
                  case 34:
                    uint64_t v25 = "ALPHA32I";
                    break;
                  case 35:
                    uint64_t v25 = "INT32I";
                    break;
                  case 36:
                    uint64_t v25 = "LUM32I";
                    break;
                  case 37:
                    uint64_t v25 = "LA32I";
                    break;
                  case 38:
                    uint64_t v25 = "RGBA16I";
                    break;
                  case 39:
                    uint64_t v25 = "RGB16I";
                    break;
                  case 40:
                    uint64_t v25 = "ALPHA16I";
                    break;
                  case 41:
                    uint64_t v25 = "INT16I";
                    break;
                  case 42:
                    uint64_t v25 = "LUM16I";
                    break;
                  case 43:
                    uint64_t v25 = "LA16I";
                    break;
                  case 44:
                    uint64_t v25 = "RGBA8I";
                    break;
                  case 45:
                    uint64_t v25 = "RGB8I";
                    break;
                  case 46:
                    uint64_t v25 = "ALPHA8I";
                    break;
                  case 47:
                    uint64_t v25 = "INT8I";
                    break;
                  case 48:
                    uint64_t v25 = "LUM8I";
                    break;
                  case 49:
                    uint64_t v25 = "LA8I";
                    break;
                  case 54:
                    uint64_t v25 = "RGBI";
                    break;
                  case 55:
                    uint64_t v25 = "RGBAI";
                    break;
                  case 89:
                    uint64_t v25 = "RGTC1";
                    break;
                  case 90:
                    uint64_t v25 = "SIGNED_RGTC1";
                    break;
                  case 91:
                    uint64_t v25 = "RGTC2";
                    break;
                  case 92:
                    uint64_t v25 = "SIGNED_RGTC2";
                    break;
                  default:
                    switch("RGB565")
                    {
                      case 0x8F94u:
                        uint64_t v25 = "R8SNORM";
                        break;
                      case 0x8F95u:
                        uint64_t v25 = "RG8SNORM";
                        break;
                      case 0x8F96u:
                        uint64_t v25 = "RGB8SNORM";
                        break;
                      case 0x8F97u:
                        uint64_t v25 = "RGBA8SNORM";
                        break;
                      case 0x8F98u:
                        uint64_t v25 = "R16SNORM";
                        break;
                      case 0x8F99u:
                        uint64_t v25 = "RG16SNORM";
                        break;
                      case 0x8F9Au:
                        uint64_t v25 = "RGB16SNORM";
                        break;
                      case 0x8F9Bu:
                        uint64_t v25 = "RGBA16SNORM";
                        break;
                      default:
                        if ("RGB565" != 36975) {
                          goto LABEL_254;
                        }
                        uint64_t v25 = "RGB10A2UI";
                        break;
                    }
                    break;
                }
              }
              CFStringAppendFormat(v14, 0, @", %s", v25);
              if (*(unsigned __int8 *)(v9 + 1017) >= 2u) {
                CFStringAppendFormat(v14, 0, @", %d mipmap levels", *(unsigned __int8 *)(v9 + 1017));
              }
              if ((*(_WORD *)(v9 + 1022) & 0x2000) != 0)
              {
                if ((*(_WORD *)(v9 + 1022) & 0x600) != 0)
                {
                  if ((*(_WORD *)(v9 + 1022) & 0x1800) != 0) {
                    uint64_t v26 = 0;
                  }
                  else {
                    uint64_t v26 = *v18;
                  }
                }
                else
                {
                  uint64_t v26 = *v17;
                }
                CFStringAppendFormat(v14, 0, @", %d array slices", v26);
              }
              if (*(unsigned char *)(v9 + 1020)) {
                CFStringAppendFormat(v14, 0, @", %d samples", *(unsigned __int8 *)(v9 + 1020));
              }
              CFDictionaryAddValue(Mutable, @"Description", v14);
              CFRelease(v14);
              int v21 = gfxAnnotateTexture(v4, v9 + 40, @"OpenGLObjects", Mutable);
              CFMutableArrayRef v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
              break;
          }
LABEL_267:
          CFRelease(Mutable);
          if (v21)
          {
            v32.length = CFArrayGetCount(v21);
            v32.location = 0;
            CFArrayAppendArray(a1, v21, v32);
            CFRelease(v21);
          }
        }
      }
      uint64_t v9 = *(void *)v9;
      if (!v9) {
        goto LABEL_270;
      }
    }
  }
}

void AnnotateOGLHashObj(uint64_t a1, uint64_t a2, __CFDictionary *a3)
{
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberIntType, (const void *)(a2 + 16));
  CFDictionaryAddValue(a3, @"Name", v6);
  CFRelease(v6);
  CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%p", a1);
  CFDictionaryAddValue(a3, @"Sharegroup", v7);
  CFRelease(v7);
  CFMutableArrayRef v8 = *(const char **)(a2 + 32);
  if (v8)
  {
    CFStringRef v9 = CFStringCreateWithCString(0, v8, 0x600u);
    CFDictionaryAddValue(a3, @"Label", v9);
    CFRelease(v9);
  }
  int v11 = *(_DWORD *)(a2 + 28);
  int v10 = (const void *)(a2 + 28);
  if (v11)
  {
    CFNumberRef v12 = CFNumberCreate(0, kCFNumberIntType, v10);
    CFDictionaryAddValue(a3, @"ResponsiblePID", v12);
    CFRelease(v12);
  }
}

uint64_t gfxWaitSyncObject(uint64_t a1, uint64_t *a2)
{
  LODWORD(v4) = gfxGetPluginCountForShared(a1);
  uint64_t result = gfxGetPluginsForShared(a1);
  if (v4)
  {
    uint64_t v4 = v4;
    CFNumberRef v6 = (uint64_t *)(result + 8);
    CFStringRef v7 = (uint64_t *)(a1 + 352);
    do
    {
      uint64_t v8 = *v6;
      v6 += 4;
      CFStringRef v9 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v8 + 1344);
      uint64_t v11 = *v7;
      v7 += 4;
      uint64_t v10 = v11;
      uint64_t v12 = *a2++;
      uint64_t result = v9(v10, 0, 0, v12);
      --v4;
    }
    while (v4);
  }
  return result;
}

void gfxClearSyncObjectsInHash(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 224);
  uint64_t v5 = (v4 + 1);
  BOOL v6 = v4 == -1;
  CFStringRef v7 = (os_unfair_lock_s *)(a1 + 324);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 324));
  if (!v6)
  {
    uint64_t v8 = 0;
    do
    {
      for (unint64_t i = *(void **)(*(void *)(a1 + 208) + 8 * v8); i; unint64_t i = (void *)*i)
      {
        if (i[18] == a2)
        {
          if (*(unsigned char *)(a1 + 320))
          {
            unint64_t v10 = 0;
            uint64_t v11 = a1 + 360;
            do
            {
              (*(void (**)(void, void))(*(void *)v11 + 1752))(*(void *)(v11 - 8), i[v10++ + 5]);
              v11 += 32;
            }
            while (v10 < *(unsigned __int8 *)(a1 + 320));
          }
          i[18] = 0;
        }
      }
      ++v8;
    }
    while (v8 != v5);
  }

  os_unfair_lock_unlock(v7);
}

uint64_t gfxCreateGLSyncFromCLEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = *(_DWORD **)(a1 + 216);
  if (!v6)
  {
    unint64_t v10 = gfxLibAlloc(0x10uLL);
    *unint64_t v10 = 0;
LABEL_7:
    v10[1] = 0x100000001;
    *(void *)(a1 + 216) = v10;
    uint64_t v8 = 1;
    goto LABEL_8;
  }
  unsigned int v7 = v6[2];
  if (v7 == 2)
  {
    uint64_t v8 = 1;
    int v9 = v6[3] + 1;
    v6[2] = 1;
    v6[3] = v9;
    goto LABEL_8;
  }
  if (v7 > 1)
  {
    unint64_t v10 = gfxLibAlloc(0x10uLL);
    *unint64_t v10 = v6;
    goto LABEL_7;
  }
  while (1)
  {
    int v25 = v6[3];
    uint64_t v8 = v25 + v7;
    unsigned int v26 = v8 + 1;
    if (v8 == -1) {
      break;
    }
    uint64_t v27 = v6;
    BOOL v6 = *(_DWORD **)v6;
    if (!v6 || (unsigned int v7 = v6[2], v26 < v7))
    {
      v27[3] = v25 + 1;
      goto LABEL_8;
    }
    if (v26 == v7)
    {
      v27[3] = v25 + v6[3] + 1;
      *(void *)uint64_t v27 = *(void *)v6;
      gfxLibFree(v6);
      goto LABEL_8;
    }
  }
  uint64_t v8 = 0;
LABEL_8:
  uint64_t v11 = (char *)malloc_type_malloc(0xA8uLL, 0xDCD90CA9uLL);
  if (!v11) {
    abort();
  }
  uint64_t v12 = v11;
  *((_DWORD *)v11 + 4) = v8;
  *(void *)uint64_t v11 = 0;
  *(void *)(v11 + 20) = 0x900000001;
  *((void *)v11 + 4) = 0;
  *((_DWORD *)v11 + 34) = 1;
  *((void *)v11 + 18) = 0;
  *((void *)v11 + 19) = a2;
  *((void *)v11 + 20) = a3;
  *(_OWORD *)(v11 + 40) = 0u;
  *(_OWORD *)(v11 + 56) = 0u;
  *(_OWORD *)(v11 + 72) = 0u;
  *(_OWORD *)(v11 + 88) = 0u;
  *(_OWORD *)(v11 + 104) = 0u;
  *(_OWORD *)(v11 + 120) = 0u;
  uint64_t v13 = *(unsigned int *)(a1 + 224);
  if (v13 <= 0xFFFE && *(_DWORD *)(a1 + 228) > v13)
  {
    uint64_t v14 = *(void **)(a1 + 208);
    int v15 = gfxLibCalloc(1uLL, 16 * v13 + 16);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      int v18 = (2 * v13) | 1;
      do
      {
        uint64_t v19 = (uint64_t **)v14[v17];
        if (v19)
        {
          do
          {
            unsigned int v20 = v19[2] & v18;
            int v21 = *v19;
            const char *v19 = (uint64_t *)v15[v20];
            v15[v20] = v19;
            uint64_t v19 = (uint64_t **)v21;
          }
          while (v21);
        }
        ++v17;
      }
      while (v17 != v13 + 1);
      *(_DWORD *)(a1 + 224) = v18;
      gfxLibFree(v14);
      *(void *)(a1 + 208) = v16;
      LODWORD(v13) = (2 * v13) | 1;
    }
  }
  unsigned int v22 = *((_DWORD *)v12 + 4) & v13;
  uint64_t v23 = *(void *)(a1 + 208);
  *(void *)uint64_t v12 = *(void *)(v23 + 8 * v22);
  *(void *)(v23 + 8 * v22) = v12;
  ++*(_DWORD *)(a1 + 228);
  return v8;
}

uint64_t gfxLinkedOSVersion()
{
  if (gfxLinkedOSVersion_once != -1) {
    dispatch_once(&gfxLinkedOSVersion_once, &__block_literal_global_0);
  }
  return gfxLinkedOSVersion_version;
}

const char *__gfxLinkedOSVersion_block_invoke()
{
  unsigned int program_sdk_version = dyld_get_program_sdk_version();
  if (HIWORD(program_sdk_version) <= 8u)
  {
    if (program_sdk_version >> 19)
    {
      char v1 = 9;
    }
    else if (program_sdk_version >> 8 <= 0x700)
    {
      if (program_sdk_version <= 0x6FFFF)
      {
        if (program_sdk_version <= 0x5FFFF)
        {
          if (program_sdk_version <= 0x4FFFF)
          {
            if (program_sdk_version >> 18)
            {
              char v1 = 4;
            }
            else if (program_sdk_version >> 9 <= 0x180)
            {
              char v1 = 0;
            }
            else
            {
              char v1 = 3;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 6;
        }
      }
      else
      {
        char v1 = 7;
      }
    }
    else
    {
      char v1 = 8;
    }
  }
  else
  {
    char v1 = 10;
  }
  gfxLinkedOSVersion_version = v1;
  uint64_t result = getenv("GL_FORCE_LINKED_OS_VERSION");
  if (result)
  {
    uint64_t result = (const char *)strtoul(result, 0, 0);
    gfxLinkedOSVersion_version = (char)result;
  }
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE45B0](bundle);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x270EE5320](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

uint64_t __CFSetLastAllocationEventName()
{
  return MEMORY[0x270EE57E8]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x270ED7ED0]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x270ED96A8]();
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t glgConvertType()
{
  return MEMORY[0x270EF9DA8]();
}

uint64_t glgGetCompressedImageBytes()
{
  return MEMORY[0x270EF9DD8]();
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x270EDA298](*(void *)&target, address, size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int scandir(const char *a1, dirent ***a2, int (__cdecl *a3)(const dirent *), int (__cdecl *a4)(const dirent **, const dirent **))
{
  return MEMORY[0x270EDB300](a1, a2, a3, a4);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}