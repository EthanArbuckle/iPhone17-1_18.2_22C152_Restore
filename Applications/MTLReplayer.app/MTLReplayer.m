void sub_10000459C(void *a1, void *a2)
{
  id v3;
  void *TexturePlane;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  CFDataRef v9;
  void *v10;
  uint64_t v11;
  size_t v12;
  CGDataProvider *v13;
  uint64_t v14;
  size_t v15;
  size_t v16;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v18;
  CGBitmapInfo v19;
  CGImage *v20;
  UIImage *v21;
  void *v22;
  long long v23;
  id v24;
  uint64_t vars8;

  v24 = a2;
  v3 = a1;
  [v3 bytes];
  [v3 length];

  GTHarvesterGetMetadata();
  if (GTHarvesterGetTexturePlaneCount() == 1)
  {
    TexturePlane = (void *)GTHarvesterGetTexturePlane();
    v5 = *TexturePlane - 30;
    v6 = v5 > 0x3E;
    v7 = (1 << v5) & 0x5000000840800001;
    if (v6 || v7 == 0)
    {
      v10 = TexturePlane;
      v9 = (const __CFData *)[objc_alloc((Class)NSData) initWithBytesNoCopy:GTHarvesterGetData() length:TexturePlane[5] freeWhenDone:0];
      v11 = *v10;
      v23 = *(_OWORD *)(v10 + 1);
      v12 = v10[4];
      v13 = CGDataProviderCreateWithCFData(v9);
      v14 = 5;
      v15 = 4;
      switch(v11)
      {
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
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 21:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 56:
        case 57:
        case 58:
        case 59:
        case 61:
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
        case 89:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 106:
        case 107:
        case 108:
        case 109:
        case 111:
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 122:
          goto LABEL_12;
        case 20:
        case 22:
        case 23:
        case 24:
        case 25:
        case 60:
        case 62:
        case 63:
        case 64:
        case 65:
        case 110:
        case 112:
        case 113:
        case 114:
        case 115:
          v14 = 16;
          goto LABEL_17;
        case 40:
        case 41:
        case 43:
          goto LABEL_17;
        case 42:
LABEL_20:
          v16 = 16;
          goto LABEL_26;
        case 53:
        case 54:
        case 55:
        case 103:
        case 104:
        case 105:
        case 123:
        case 124:
        case 125:
          goto LABEL_16;
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
          v14 = 10;
          goto LABEL_17;
        default:
          if (v11 == 252) {
LABEL_16:
          }
            v14 = 32;
          else {
LABEL_12:
          }
            v14 = 8;
LABEL_17:
          v15 = v14;
          v16 = 8;
          if (v11 > 251)
          {
            if ((unint64_t)(v11 - 552) < 2)
            {
LABEL_24:
              v16 = 64;
            }
            else if (v11 != 253)
            {
LABEL_19:
              v16 = 32;
            }
          }
          else
          {
            switch(v11)
            {
              case 1:
              case 10:
              case 11:
              case 12:
              case 13:
              case 14:
                break;
              case 20:
              case 22:
              case 23:
              case 24:
              case 25:
              case 30:
              case 31:
              case 32:
              case 33:
              case 34:
              case 40:
              case 41:
              case 42:
              case 43:
                goto LABEL_20;
              case 103:
              case 104:
              case 105:
              case 110:
              case 112:
              case 113:
              case 114:
              case 115:
                goto LABEL_24;
              case 123:
              case 124:
              case 125:
                v16 = 128;
                break;
              default:
                goto LABEL_19;
            }
          }
LABEL_26:
          if ((unint64_t)(v11 - 10) > 0x3D) {
            goto LABEL_29;
          }
          if (((1 << (v11 - 10)) & 0x200000008009) != 0) {
            goto LABEL_30;
          }
          if (v11 == 71) {
            goto LABEL_32;
          }
LABEL_29:
          if ((unint64_t)(v11 - 252) >= 2)
          {
            if (v11 == 81) {
LABEL_32:
            }
              DeviceRGB = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
            else {
              DeviceRGB = CGColorSpaceCreateDeviceRGB();
            }
          }
          else
          {
LABEL_30:
            DeviceRGB = CGColorSpaceCreateDeviceGray();
          }
          v18 = DeviceRGB;
          v19 = 7;
          switch(v11)
          {
            case 1:
              goto LABEL_49;
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
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 21:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 38:
            case 39:
            case 44:
            case 45:
            case 46:
            case 47:
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 56:
            case 57:
            case 58:
            case 59:
            case 61:
            case 66:
            case 67:
            case 68:
            case 69:
            case 75:
            case 76:
            case 77:
            case 78:
            case 79:
            case 82:
            case 83:
            case 84:
            case 85:
            case 86:
            case 87:
            case 88:
            case 89:
            case 95:
            case 96:
            case 97:
            case 98:
            case 99:
            case 100:
            case 101:
            case 102:
            case 106:
            case 107:
            case 108:
            case 109:
            case 111:
            case 116:
            case 117:
            case 118:
            case 119:
            case 120:
            case 121:
            case 122:
              goto LABEL_35;
            case 20:
            case 22:
            case 23:
            case 24:
            case 40:
            case 60:
            case 62:
            case 63:
            case 64:
              v19 = 4096;
              goto LABEL_49;
            case 25:
            case 65:
              v19 = 4352;
              goto LABEL_49;
            case 41:
            case 42:
              v19 = 4100;
              goto LABEL_49;
            case 43:
            case 110:
            case 112:
            case 113:
            case 114:
              v19 = 4099;
              goto LABEL_49;
            case 53:
            case 54:
            case 103:
            case 104:
              goto LABEL_41;
            case 55:
            case 92:
            case 93:
            case 105:
            case 123:
            case 124:
              v19 = 8448;
              goto LABEL_49;
            case 70:
            case 71:
            case 72:
            case 73:
            case 74:
              v19 = 3;
              goto LABEL_49;
            case 80:
            case 81:
              v19 = 8196;
              goto LABEL_49;
            case 90:
            case 91:
              v19 = 204803;
              goto LABEL_49;
            case 94:
              v19 = 16387;
              goto LABEL_49;
            case 115:
              v19 = 4355;
              goto LABEL_49;
            case 125:
              v19 = 8451;
              goto LABEL_49;
            default:
              if (v11 == 252) {
LABEL_41:
              }
                v19 = 0x2000;
              else {
LABEL_35:
              }
                v19 = 0;
LABEL_49:
              v20 = CGImageCreate(v23, *((size_t *)&v23 + 1), v15, v16, v12, DeviceRGB, v19, v13, 0, 1, kCGRenderingIntentDefault);
              CGColorSpaceRelease(v18);
              CGDataProviderRelease(v13);
              v21 = +[UIImage imageWithCGImage:v20];
              v22 = UIImagePNGRepresentation(v21);

              [v22 writeToURL:v24 atomically:0];
              CGImageRelease(v20);

              break;
          }
          break;
      }
    }
    else
    {
      v9 = [v24 path];
      NSLog(@"SaveTexture Can't handle floating point textures: url:%@", v9);
    }
  }
}

uint64_t start(int a1, uint64_t a2)
{
  if (off_100012240 == &_os_log_default)
  {
    os_log_t v6 = os_log_create("com.apple.gputools.MTLReplayer", (const char *)&unk_10000A943);
    v7 = off_100012240;
    off_100012240 = v6;

    qword_100012278 = (uint64_t)malloc_type_calloc(0, 0x20uLL, 0x8004018A671A6uLL);
    v8 = +[NSUserDefaults standardUserDefaults];
    unsigned int v9 = [v8 BOOLForKey:@"GPUToolsPerfLogging"];

    if (v9)
    {
      os_log_t v10 = os_log_create("com.apple.gputools.MTLReplayer", (const char *)&unk_10000A943);
      v11 = off_100012238;
      off_100012238 = v10;
    }
  }
  else
  {
    v5 = sub_100006DD4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "Log already initialized, did you call GTCoreLogInit twice?";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "warning: %s", (uint8_t *)&buf, 0xCu);
    }
  }
  v12 = off_100012238;
  if (os_signpost_enabled((os_log_t)off_100012238))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Replayer-1-serial", "MTLReplayer main() inited!", (uint8_t *)&buf, 2u);
  }
  if (dword_100012268++) {
    goto LABEL_10;
  }
  if (byte_100012250++)
  {
LABEL_15:
    *(void *)&long long buf = 0;
    if (!sub_100006A94((uint64_t **)&buf, 0)) {
      *(void *)(buf + 80) = "apr_initialize";
    }
    goto LABEL_10;
  }
  qword_100012258 = 0;
  vm_address_t v25 = sub_100006740(0xC8uLL);
  if (!v25)
  {
LABEL_29:
    byte_100012250 = 0;
    goto LABEL_10;
  }
  *(_OWORD *)vm_address_t v25 = 0u;
  *(_OWORD *)(v25 + 16) = 0u;
  *(void *)(v25 + 192) = 0;
  *(_OWORD *)(v25 + 160) = 0u;
  *(_OWORD *)(v25 + 176) = 0u;
  *(_OWORD *)(v25 + 128) = 0u;
  *(_OWORD *)(v25 + 144) = 0u;
  *(_OWORD *)(v25 + 96) = 0u;
  *(_OWORD *)(v25 + 112) = 0u;
  *(_OWORD *)(v25 + 64) = 0u;
  *(_OWORD *)(v25 + 80) = 0u;
  *(_OWORD *)(v25 + 32) = 0u;
  *(_OWORD *)(v25 + 48) = 0u;
  qword_100012258 = v25;
  *(int64x2_t *)(v25 + 8) = vdupq_n_s64(0x8000uLL);
  if (sub_100006A94((uint64_t **)&qword_100012260, (unint64_t *)v25))
  {
    uint64_t v26 = 0;
    vm_address_t v27 = qword_100012258;
    do
    {
      vm_address_t v28 = v27 + 8 * v26;
      vm_address_t v31 = *(void *)(v28 + 40);
      v30 = (vm_address_t *)(v28 + 40);
      vm_address_t v29 = v31;
      if (v31)
      {
        do
        {
          vm_address_t *v30 = *(void *)v29;
          vm_deallocate(mach_task_self_, v29, ((*(_DWORD *)(v29 + 16) << 12) + 4096));
          vm_address_t v29 = *v30;
        }
        while (*v30);
      }
      ++v26;
    }
    while (v26 != 20);
    vm_deallocate(mach_task_self_, v27, 0xC8uLL);
    qword_100012258 = 0;
    goto LABEL_29;
  }
  uint64_t v51 = qword_100012260;
  *(void *)(qword_100012260 + 80) = "apr_global_pool";
  if (qword_100012248)
  {
LABEL_118:
    *(void *)&long long buf = 0;
    if (sub_100006D30(&buf, v51)) {
      goto LABEL_10;
    }
    uint64_t v55 = qword_100012258;
    uint64_t v56 = qword_100012260;
    *(void *)(qword_100012258 + 24) = buf;
    *(void *)(v55 + 32) = v56;
    goto LABEL_15;
  }
  uint64_t v52 = sub_100006B94(v51, 0x38uLL);
  qword_100012248 = v52;
  v53 = *(void **)(v51 + 40);
  if (v53) {
    *(void *)(v51 + 40) = *v53;
  }
  else {
    v53 = (void *)sub_100006B94(v51, 0x20uLL);
  }
  uint64_t v54 = 0;
  v53[1] = v52;
  v53[2] = sub_1000068D8;
  v53[3] = sub_100006D28;
  void *v53 = *(void *)(v51 + 32);
  *(void *)(v51 + 32) = v53;
  while (!sub_100006D30((void *)(qword_100012248 + v54), v51))
  {
    v54 += 8;
    if (v54 == 56)
    {
      uint64_t v51 = qword_100012260;
      goto LABEL_118;
    }
  }
LABEL_10:
  v57 = 0;
  sub_100006A94(&v57, 0);
  GTMTLReplayController_init();
  if (a1 >= 2 && (uint64_t v14 = a2 + 8, !strcmp("-CLI", *(const char **)(a2 + 8))))
  {
    *(void *)(a2 + 8) = *(void *)a2;
    if (a1 > 2)
    {
      int v32 = a1 - 1;
      long long v78 = xmmword_10000C3C8;
      long long v79 = unk_10000C3D8;
      long long v80 = xmmword_10000C3E8;
      long long v81 = unk_10000C3F8;
      long long v74 = xmmword_10000C388;
      long long v75 = unk_10000C398;
      long long v76 = xmmword_10000C3A8;
      long long v77 = unk_10000C3B8;
      long long buf = xmmword_10000C348;
      long long v71 = *(_OWORD *)algn_10000C358;
      long long v72 = xmmword_10000C368;
      long long v73 = *(_OWORD *)&off_10000C378;
      if (v32 != 2)
      {
        int v33 = 2;
        while (1)
        {
          uint64_t v34 = 0;
          uint64_t v35 = v33;
          v36 = *(const char **)(v14 + 8 * v33);
          v37 = (const char **)&off_10000C408;
          while (strcmp(v36, *v37))
          {
            ++v34;
            v37 += 2;
            if (v34 == 61)
            {
LABEL_36:
              v38 = +[NSString stringWithFormat:@"Unknown token: %s", v36];
              v39 = __stdoutp;
              if (g_runningInCI) {
                v40 = "#CI_ERROR# ";
              }
              else {
                v40 = (const char *)&unk_10000A943;
              }
              id v41 = v38;
              fprintf(v39, "%s%s %u: %s\n", v40, "void ParseArguments(GTMTLReplayCLIOptions *, int, const char **)", 451, (const char *)[v41 UTF8String]);
              id v42 = v41;
              [v42 UTF8String];
              GTMTLReplay_handleError();

              goto LABEL_99;
            }
          }
          switch(LODWORD((&off_10000C408)[2 * v34 + 1]))
          {
            case 1:
              int v43 = DWORD2(v81) | 0x8000;
              goto LABEL_98;
            case 2:
            case 0x17:
              goto LABEL_99;
            case 3:
            case 0x1F:
              int v43 = DWORD2(v81) | 0x200;
              goto LABEL_98;
            case 4:
              ++v33;
              *((void *)&buf + 1) = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 5:
              ++v33;
              *(void *)&long long buf = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 6:
              ++v33;
              int v44 = atoi(*(const char **)(v14 + 8 * (v35 + 1)));
              if (v44 <= 1) {
                int v45 = 1;
              }
              else {
                int v45 = v44;
              }
              DWORD2(v71) = v45;
              goto LABEL_99;
            case 7:
              BYTE4(v72) = 1;
              goto LABEL_99;
            case 8:
              int v43 = DWORD2(v81) | 0x100;
              goto LABEL_98;
            case 9:
              ++v33;
              *(void *)&long long v71 = atoi(*(const char **)(v14 + 8 * (v35 + 1)));
              goto LABEL_99;
            case 0xA:
              ++v33;
              HIDWORD(v71) = atoi(*(const char **)(v14 + 8 * (v35 + 1)));
              goto LABEL_99;
            case 0xB:
              ++v33;
              LODWORD(v72) = atoi(*(const char **)(v14 + 8 * (v35 + 1)));
              goto LABEL_99;
            case 0xC:
              BYTE5(v72) = 1;
              goto LABEL_99;
            case 0xD:
              ++v33;
              *((void *)&v72 + 1) = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0xE:
              ++v33;
              *(void *)&long long v73 = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0xF:
              ++v33;
              sscanf(*(const char **)(v14 + 8 * (v35 + 1)), "%llu:%llu", (char *)&v80 + 8, &v81);
              goto LABEL_99;
            case 0x10:
              int v43 = DWORD2(v81) | 1;
              goto LABEL_98;
            case 0x11:
              int v43 = DWORD2(v81) | 2;
              goto LABEL_98;
            case 0x12:
              int v43 = DWORD2(v81) | 4;
              goto LABEL_98;
            case 0x13:
              ++v33;
              HIDWORD(v79) = atoi(*(const char **)(v14 + 8 * (v35 + 1)));
              goto LABEL_99;
            case 0x14:
              ++v33;
              LODWORD(v80) = atoi(*(const char **)(v14 + 8 * (v35 + 1)));
              goto LABEL_99;
            case 0x15:
              int v43 = DWORD2(v81) | 8;
              goto LABEL_98;
            case 0x16:
              int v43 = DWORD2(v81) | 0x40;
              goto LABEL_98;
            case 0x18:
              ++v33;
              *((void *)&v74 + 1) = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0x19:
              int v46 = DWORD2(v81) | 0x800;
              goto LABEL_69;
            case 0x1A:
              int v43 = DWORD2(v81) | 0x80;
              goto LABEL_98;
            case 0x1B:
              int v46 = DWORD2(v81) | 0x100;
LABEL_69:
              DWORD2(v81) = v46;
              ++v33;
              *(void *)&long long v76 = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0x1C:
              DWORD2(v81) |= 0x2000u;
              ++v33;
              *((void *)&v76 + 1) = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0x1D:
              ++v33;
              *(void *)&long long v77 = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0x1E:
              ++v33;
              *((void *)&v77 + 1) = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0x20:
              ++v33;
              *((void *)&v73 + 1) = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0x21:
              ++v33;
              *(void *)&long long v74 = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0x22:
              int v43 = DWORD2(v81) | 0x1000;
              goto LABEL_98;
            case 0x23:
              DWORD2(v81) |= 0x80u;
              ++v33;
              *(void *)&long long v75 = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0x24:
              DWORD2(v81) |= 0x4000u;
              ++v33;
              *(void *)&long long v78 = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0x25:
              int v43 = DWORD2(v81) | 0x10000;
              goto LABEL_98;
            case 0x26:
              int v43 = DWORD2(v81) | 0x20000;
              goto LABEL_98;
            case 0x27:
              g_runningInCI = 1;
              goto LABEL_99;
            case 0x28:
              g_runningValidationCI = 1;
              goto LABEL_99;
            case 0x29:
              ++v33;
              goto LABEL_99;
            case 0x2A:
              int v43 = DWORD2(v81) | 0x40000;
              goto LABEL_98;
            case 0x2B:
              int v43 = DWORD2(v81) | 0x10;
              goto LABEL_98;
            case 0x2C:
              int v43 = DWORD2(v81) | 0x80000;
              goto LABEL_98;
            case 0x2D:
              int v43 = DWORD2(v81) | 0x100000;
              goto LABEL_98;
            case 0x2E:
              int v43 = DWORD2(v81) | 0x200000;
              goto LABEL_98;
            case 0x30:
              DWORD2(v81) |= 0x400000u;
              uint64_t v47 = v33 + 1;
              v48 = *(const char **)(v14 + 8 * v47);
              if (!v48 || *v48 == 45)
              {
                DWORD1(v80) = -1;
                goto LABEL_99;
              }
              if (!strcmp(*(const char **)(v14 + 8 * v47), "max"))
              {
                int v50 = 2;
LABEL_107:
                DWORD1(v80) = v50;
                goto LABEL_108;
              }
              if (!strcmp(v48, "med"))
              {
                int v50 = 1;
                goto LABEL_107;
              }
              if (!strcmp(v48, "min")) {
                DWORD1(v80) = 0;
              }
              else {
                DWORD1(v80) = atoi(v48);
              }
LABEL_108:
              ++v33;
LABEL_99:
              if (++v33 >= v32) {
                goto LABEL_31;
              }
              break;
            case 0x31:
              DWORD2(v81) |= 0x1000000u;
              ++v33;
              *((void *)&v78 + 1) = *(void *)(v14 + 8 * (v35 + 1));
              goto LABEL_99;
            case 0x32:
              int v49 = DWORD2(v81) | 0x2000000;
              goto LABEL_94;
            case 0x33:
              int v49 = DWORD2(v81) | 0x4000000;
LABEL_94:
              DWORD2(v81) = v49;
              DWORD2(v79) = atoi(*(const char **)(v14 + 8 * v33 + 8));
              v33 += 2;
              *(void *)&long long v79 = *(void *)(v14 + 8 * (v35 + 2));
              goto LABEL_99;
            case 0x34:
              int v43 = DWORD2(v81) | 0x800000;
              goto LABEL_98;
            case 0x35:
              int v43 = DWORD2(v81) | 0x20;
LABEL_98:
              DWORD2(v81) = v43;
              goto LABEL_99;
            default:
              goto LABEL_36;
          }
        }
      }
LABEL_31:
      long long v66 = v78;
      long long v67 = v79;
      long long v68 = v80;
      long long v69 = v81;
      long long v62 = v74;
      long long v63 = v75;
      long long v64 = v76;
      long long v65 = v77;
      long long v58 = buf;
      long long v59 = v71;
      long long v60 = v72;
      long long v61 = v73;
      uint64_t v17 = GTMTLReplay_CLI();
    }
    else
    {
      v20 = +[NSString stringWithFormat:@"Invalid command-line arguments (usage: MTLReplayer archivePath [options])"];
      v21 = __stdoutp;
      if (g_runningInCI) {
        v22 = "#CI_ERROR# ";
      }
      else {
        v22 = (const char *)&unk_10000A943;
      }
      id v23 = v20;
      fprintf(v21, "%s%s %u: %s\n", v22, "int GTMTLReplayCLI_main(int, const char **)", 462, (const char *)[v23 UTF8String]);
      id v24 = v23;
      [v24 UTF8String];
      uint64_t v17 = 1;
      GTMTLReplay_handleError();
    }
  }
  else
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = UIApplicationMain(a1, (char **)a2, 0, v16);
  }
  return v17;
}

id sub_1000063D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOrientation:*(void *)(a1 + 40)];
}

id sub_1000063E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsUpdateOfSupportedInterfaceOrientations];
}

id sub_100006634(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDevice:*(void *)(a1 + 40)];
}

vm_address_t sub_100006740(memory_object_size_t a1)
{
  kern_return_t memory_entry_64;
  mach_error_t v3;
  NSObject *v4;
  char *v5;
  const char *v6;
  kern_return_t v7;
  mach_error_t v8;
  char *v10;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v15;
  __int16 v16;
  char *v17;

  address = 0;
  object_handle = 0;
  size = a1;
  memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, 0, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    v3 = memory_entry_64;
    v4 = sub_100006DD4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = mach_error_string(v3);
      *(_DWORD *)long long buf = 67109378;
      v15 = v3;
      v16 = 2080;
      uint64_t v17 = v5;
      os_log_t v6 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
    }
  }
  else
  {
    v7 = vm_map(mach_task_self_, &address, a1, 0, 1, object_handle, 0, 0, 3, 3, 1u);
    if (!v7)
    {
      mach_port_deallocate(mach_task_self_, object_handle);
      return address;
    }
    v8 = v7;
    v4 = sub_100006DD4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      os_log_t v10 = mach_error_string(v8);
      *(_DWORD *)long long buf = 67109378;
      v15 = v8;
      v16 = 2080;
      uint64_t v17 = v10;
      os_log_t v6 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_10;
    }
  }
  return 0;
}

uint64_t sub_1000068D8(uint64_t a1)
{
  if (qword_100012248 == a1) {
    qword_100012248 = 0;
  }
  return 0;
}

void *sub_1000068F4(unint64_t *a1, unint64_t a2)
{
  v2 = 0;
  unint64_t v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  unint64_t v4 = 0x2000;
  if (v3 > 0x2000) {
    unint64_t v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  }
  if (v3 >= a2) {
    memory_object_size_t v5 = v4;
  }
  else {
    memory_object_size_t v5 = 0;
  }
  if (v3 < a2) {
    return v2;
  }
  unint64_t v7 = *a1;
  if (*a1)
  {
    unint64_t v8 = a1[3];
    if (v8)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v8 + 8));
      unint64_t v7 = *a1;
    }
    unsigned int v9 = a1 + 6;
    v2 = (void *)a1[6];
    BOOL v10 = v2 == 0;
    BOOL v11 = v7 > 1;
    if (!v2 && v7 >= 2)
    {
      unint64_t v12 = 2;
      do
      {
        v13 = (void *)v9[1];
        ++v9;
        v2 = v13;
        BOOL v10 = v13 == 0;
        BOOL v11 = v12 < v7;
        if (v13) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v12 >= v7;
        }
        ++v12;
      }
      while (!v14);
    }
    if (!v10)
    {
      uint64_t v21 = *v2;
      *unsigned int v9 = *v2;
      if (v21) {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        v22 = v9 - 1;
        do
        {
          if (*v22--) {
            BOOL v24 = 1;
          }
          else {
            BOOL v24 = v7 == 1;
          }
          --v7;
        }
        while (!v24);
        *a1 = v7;
      }
      uint64_t v19 = (*((_DWORD *)v2 + 4) + 1);
LABEL_40:
      unint64_t v25 = a1[2] + v19;
      if (v25 >= a1[1]) {
        unint64_t v25 = a1[1];
      }
      a1[2] = v25;
      unint64_t v26 = a1[3];
      if (v26) {
        pthread_mutex_unlock((pthread_mutex_t *)(v26 + 8));
      }
      goto LABEL_44;
    }
  }
  else
  {
    v2 = a1 + 5;
    if (!a1[5]) {
      goto LABEL_27;
    }
    unint64_t v16 = a1[3];
    if (v16) {
      pthread_mutex_lock((pthread_mutex_t *)(v16 + 8));
    }
    while (1)
    {
      uint64_t v17 = v2;
      v2 = (void *)*v2;
      if (!v2) {
        break;
      }
      int v18 = *((_DWORD *)v2 + 4);
      if (v18)
      {
        *uint64_t v17 = *v2;
        uint64_t v19 = (v18 + 1);
        goto LABEL_40;
      }
    }
  }
  unint64_t v15 = a1[3];
  if (v15) {
    pthread_mutex_unlock((pthread_mutex_t *)(v15 + 8));
  }
LABEL_27:
  vm_address_t v20 = sub_100006740(v5);
  v2 = (void *)v20;
  if (v20)
  {
    *(_DWORD *)(v20 + 16) = 1;
    *(void *)(v20 + 32) = v20 + v5;
LABEL_44:
    void *v2 = 0;
    v2[3] = v2 + 5;
  }
  return v2;
}

uint64_t sub_100006A94(uint64_t **a1, unint64_t *a2)
{
  v2 = a2;
  *a1 = 0;
  uint64_t v4 = qword_100012260;
  if (qword_100012260)
  {
    memory_object_size_t v5 = *(void (**)(uint64_t))(qword_100012260 + 64);
    if (a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  memory_object_size_t v5 = 0;
  if (!a2) {
LABEL_3:
  }
    v2 = *(unint64_t **)(qword_100012260 + 48);
LABEL_4:
  os_log_t v6 = sub_1000068F4(v2, 0x1FD8uLL);
  if (v6)
  {
    *os_log_t v6 = v6;
    v6[1] = v6;
    unint64_t v7 = (uint64_t *)v6[3];
    v6[3] = v7 + 15;
    v7[12] = (uint64_t)v6;
    v7[13] = (uint64_t)(v7 + 15);
    v7[14] = 0;
    v7[6] = (uint64_t)v2;
    v7[7] = 0;
    v7[4] = 0;
    v7[5] = 0;
    v7[10] = 0;
    v7[11] = (uint64_t)v6;
    v7[8] = (uint64_t)v5;
    v7[9] = 0;
    uint64_t *v7 = v4;
    v7[1] = 0;
    if (v4)
    {
      uint64_t v8 = *(void *)(*(void *)(v4 + 48) + 24);
      if (v8) {
        pthread_mutex_lock((pthread_mutex_t *)(v8 + 8));
      }
      uint64_t v11 = *(void *)(v4 + 8);
      BOOL v10 = (uint64_t **)(v4 + 8);
      uint64_t v9 = v11;
      v7[2] = v11;
      if (v11) {
        *(void *)(v9 + 24) = v7 + 2;
      }
      *BOOL v10 = v7;
      v7[3] = (uint64_t)v10;
      if (v8) {
        pthread_mutex_unlock((pthread_mutex_t *)(v8 + 8));
      }
    }
    else
    {
      v7[2] = 0;
      v7[3] = 0;
    }
    uint64_t v12 = 0;
    *a1 = v7;
  }
  else
  {
    uint64_t v12 = 12;
    if (v5) {
      v5(12);
    }
  }
  return v12;
}

uint64_t sub_100006B94(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v3 < a2)
  {
LABEL_2:
    uint64_t v4 = *(void (**)(uint64_t))(a1 + 64);
    if (v4) {
      v4(12);
    }
    return 0;
  }
  os_log_t v6 = *(void **)(a1 + 88);
  uint64_t result = v6[3];
  if (v3 <= v6[4] - result)
  {
    v6[3] = result + v3;
    return result;
  }
  unint64_t v7 = (void *)*v6;
  if (v3 <= *(void *)(*v6 + 32) - *(void *)(*v6 + 24))
  {
    *(void *)v7[1] = *v7;
    *(void *)(*v7 + 8) = v7[1];
  }
  else
  {
    unint64_t v7 = sub_1000068F4(*(unint64_t **)(a1 + 48), (a2 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (!v7) {
      goto LABEL_2;
    }
  }
  *((_DWORD *)v7 + 5) = 0;
  uint64_t result = v7[3];
  v7[3] = result + v3;
  uint64_t v8 = (void *)v6[1];
  v7[1] = v8;
  void *v8 = v7;
  void *v7 = v6;
  v6[1] = v7;
  *(void *)(a1 + 88) = v7;
  unint64_t v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20))
  {
    BOOL v10 = (uint64_t *)*v6;
    do
      BOOL v10 = (uint64_t *)*v10;
    while (*((_DWORD *)v10 + 5) > v9);
    void *v7 = *v6;
    *(void *)(*v6 + 8) = v6[1];
    uint64_t v11 = (void *)v10[1];
    v6[1] = v11;
    void *v11 = v6;
    *os_log_t v6 = v10;
    v10[1] = (uint64_t)v6;
  }
  return result;
}

void *sub_100006CBC(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v7 = (uint64_t)result;
    uint64_t result = (void *)result[5];
    if (result) {
      *(void *)(v7 + 40) = *result;
    }
    else {
      uint64_t result = (void *)sub_100006B94(v7, 0x20uLL);
    }
    result[2] = a3;
    result[3] = a4;
    *uint64_t result = *(void *)(v7 + 32);
    result[1] = a2;
    *(void *)(v7 + 32) = result;
  }
  return result;
}

uint64_t sub_100006D28()
{
  return 0;
}

uint64_t sub_100006D30(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100006B94(a2, 0x48uLL);
  memory_object_size_t v5 = (void **)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 56) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 8) = 0u;
  }
  *(void *)uint64_t v4 = a2;
  uint64_t result = pthread_mutex_init((pthread_mutex_t *)(v4 + 8), 0);
  if (!result)
  {
    sub_100006CBC(*v5, (uint64_t)v5, (uint64_t)sub_100006DCC, (uint64_t)sub_100006D28);
    uint64_t result = 0;
    *a1 = v5;
  }
  return result;
}

uint64_t sub_100006DCC(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

id sub_100006DD4()
{
  v0 = off_100012240;
  if (off_100012240 == &_os_log_default)
  {
    if (qword_100012270 != -1) {
      dispatch_once(&qword_100012270, &stru_10000C870);
    }
    v0 = off_100012240;
  }

  return v0;
}

void sub_100006E44(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead", v1, 2u);
  }
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return _CGColorSpaceCreateDeviceGray();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return _CGDataProviderCreateWithCFData(data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return _CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, bitmapInfo, provider, decode, shouldInterpolate, intent);
}

void CGImageRelease(CGImageRef image)
{
}

uint64_t GTHarvesterGetData()
{
  return _GTHarvesterGetData();
}

uint64_t GTHarvesterGetMetadata()
{
  return _GTHarvesterGetMetadata();
}

uint64_t GTHarvesterGetTexturePlane()
{
  return _GTHarvesterGetTexturePlane();
}

uint64_t GTHarvesterGetTexturePlaneCount()
{
  return _GTHarvesterGetTexturePlaneCount();
}

uint64_t GTMTLReplayClient_createNewTransport()
{
  return _GTMTLReplayClient_createNewTransport();
}

uint64_t GTMTLReplayClient_createOldTransport()
{
  return _GTMTLReplayClient_createOldTransport();
}

uint64_t GTMTLReplayClient_setDisplayDelegate()
{
  return _GTMTLReplayClient_setDisplayDelegate();
}

uint64_t GTMTLReplayController_init()
{
  return _GTMTLReplayController_init();
}

uint64_t GTMTLReplay_CLI()
{
  return _GTMTLReplay_CLI();
}

uint64_t GTMTLReplay_handleError()
{
  return _GTMTLReplay_handleError();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return _mach_make_memory_entry_64(target_task, size, offset, permission, object_handle, parent_entry);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return _vm_map(target_task, address, size, mask, flags, object, offset, copy, cur_protection, max_protection, inheritance);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__applicationDidFinishLaunching(void *a1, const char *a2, ...)
{
  return [a1 _applicationDidFinishLaunching];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 colorPixelFormat];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commands(void *a1, const char *a2, ...)
{
  return [a1 commands];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_contentsScale(void *a1, const char *a2, ...)
{
  return [a1 contentsScale];
}

id objc_msgSend_currentDrawable(void *a1, const char *a2, ...)
{
  return [a1 currentDrawable];
}

id objc_msgSend_currentRenderPassDescriptor(void *a1, const char *a2, ...)
{
  return [a1 currentRenderPassDescriptor];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_draw(void *a1, const char *a2, ...)
{
  return [a1 draw];
}

id objc_msgSend_drawableSize(void *a1, const char *a2, ...)
{
  return [a1 drawableSize];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return [a1 loadView];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_newCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 newCommandQueue];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:atomically:];
}