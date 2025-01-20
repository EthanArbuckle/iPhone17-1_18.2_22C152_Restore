@interface ATAudioSessionPropertyManager
- (ATAudioSessionPropertyManager)initWithATAudioSessionClientImpl:(id)a3;
- (int)GetProperty:(unsigned int)a3 size:(unsigned int *)a4 data:(void *)a5;
- (int)SetProperty:(unsigned int)a3 size:(unsigned int)a4 data:(const void *)a5;
@end

@implementation ATAudioSessionPropertyManager

- (void).cxx_destruct
{
}

- (int)SetProperty:(unsigned int)a3 size:(unsigned int)a4 data:(const void *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (kAudioSessionClientLogSubsystem)
  {
    v9 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "ATAudioSessionPropertyManager.mm";
    __int16 v45 = 1024;
    int v46 = 219;
    __int16 v47 = 1024;
    int v48 = v7;
    _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d SetProperty %d on AVAudioSession", buf, 0x18u);
  }

LABEL_8:
  asPropertyInfo::GetPropertyInfo(v41, v7);
  if ((v41[0] & 4) != 0)
  {
    if (v42 != a4)
    {
      int v11 = 561211770;
      if (kAudioSessionClientLogSubsystem)
      {
        v12 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v12) {
          return v11;
        }
      }
      else
      {
        v12 = MEMORY[0x1E4F14500];
        id v20 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "ATAudioSessionPropertyManager.mm";
      __int16 v45 = 1024;
      int v46 = 230;
      __int16 v47 = 1024;
      int v48 = v7;
      v19 = "%25s:%-5d Invalid input size for property %d";
      goto LABEL_30;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->mAsClientImpl);
    v12 = [WeakRetained avas];

    if (!v12)
    {
      int v11 = 560557673;
      goto LABEL_79;
    }
    if (objc_opt_respondsToSelector())
    {
      v14 = (void *)MEMORY[0x1E4F1CA18];
      v15 = [v12 methodSignatureForSelector:v43];
      v16 = [v14 invocationWithMethodSignature:v15];

      if (v16)
      {
        [v16 setSelector:v43];
        [v16 setTarget:v12];
        v39 = &v40;
        id v40 = 0;
        if ((int)v7 <= 1752658801)
        {
          if ((int)v7 > 1668114807)
          {
            if ((int)v7 <= 1684431724)
            {
              if (v7 == 1668114808)
              {
LABEL_63:
                unint64_t v25 = +[ATAudioSessionUtils getCategoryOptionFromPropertyID:v7];
                if (*(_DWORD *)a5) {
                  uint64_t v26 = [v12 categoryOptions] | v25;
                }
                else {
                  uint64_t v26 = [v12 categoryOptions] & ~v25;
                }
                *(void *)buf = v26;
                id v38 = [v12 category];
                [v16 setArgument:&v38 atIndex:2];
                [v16 setArgument:buf atIndex:3];
                [v16 setArgument:&v39 atIndex:4];

                goto LABEL_76;
              }
              int v17 = 1668509803;
              goto LABEL_62;
            }
            if (v7 != 1684431725)
            {
              int v17 = 1685414763;
LABEL_62:
              if (v7 == v17) {
                goto LABEL_63;
              }
LABEL_76:
              [v16 invoke];
              LOBYTE(v38) = 0;
              [v16 getReturnValue:&v38];
              if ((_BYTE)v38)
              {
                int v11 = 0;
              }
              else
              {
                v33 = CALog::LogObjIfEnabled((CALog *)1, kAudioSessionClientLogSubsystem, v31);
                v34 = v33;
                if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315906;
                  *(void *)&buf[4] = "ATAudioSessionPropertyManager.mm";
                  __int16 v45 = 1024;
                  int v46 = 363;
                  __int16 v47 = 1024;
                  int v48 = v7;
                  __int16 v49 = 2112;
                  id v50 = v40;
                  _os_log_impl(&dword_1A3931000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d FAILED to set property %d on AVAudioSession with error %@", buf, 0x22u);
                }

                int v11 = 2003329396;
                if (v39 && [v40 code]) {
                  int v11 = [v40 code];
                }
              }

              goto LABEL_79;
            }
            goto LABEL_68;
          }
          if (v7 == 1633902964)
          {
            uint64_t v29 = *(unsigned int *)a5;
            id v38 = +[ATAudioSessionUtils getAVASCategory:v29];
            if (v38) {
              goto LABEL_69;
            }
            v37 = CALog::LogObjIfEnabled((CALog *)1, kAudioSessionClientLogSubsystem, v30);
            v36 = v37;
            if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&buf[4] = "ATAudioSessionPropertyManager.mm";
              __int16 v45 = 1024;
              int v46 = 282;
              __int16 v47 = 1024;
              int v48 = v29;
              _os_log_impl(&dword_1A3931000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid category %u", buf, 0x18u);
            }
            goto LABEL_94;
          }
          if (v7 != 1634956148)
          {
            int v17 = 1667394677;
            goto LABEL_62;
          }
          goto LABEL_70;
        }
        if ((int)v7 <= 1836016740)
        {
          if (v7 != 1752658802)
          {
            if (v7 == 1768387427 || v7 == 1768907364)
            {
              *(double *)buf = *(float *)a5;
              [v16 setArgument:buf atIndex:2];
              [v16 setArgument:&v39 atIndex:3];
            }
            goto LABEL_76;
          }
        }
        else
        {
          if ((int)v7 <= 1886546286)
          {
            if (v7 != 1836016741)
            {
              if (v7 == 1870033508)
              {
                uint64_t v23 = 1936747378;
                if (!*(_DWORD *)a5) {
                  uint64_t v23 = 0;
                }
                *(void *)buf = v23;
                [v16 setArgument:buf atIndex:2];
                [v16 setArgument:&v39 atIndex:3];
              }
              goto LABEL_76;
            }
LABEL_68:
            uint64_t v27 = *(unsigned int *)a5;
            id v38 = +[ATAudioSessionUtils getAVASMode:v27];
            if (v38)
            {
LABEL_69:
              [v16 setArgument:&v38 atIndex:2];
              [v16 setArgument:&v39 atIndex:3];

              goto LABEL_76;
            }
            v35 = CALog::LogObjIfEnabled((CALog *)1, kAudioSessionClientLogSubsystem, v28);
            v36 = v35;
            if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&buf[4] = "ATAudioSessionPropertyManager.mm";
              __int16 v45 = 1024;
              int v46 = 298;
              __int16 v47 = 1024;
              int v48 = v27;
              _os_log_impl(&dword_1A3931000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid mode %u", buf, 0x18u);
            }
LABEL_94:

            int v11 = -50;
            goto LABEL_79;
          }
          if (v7 == 1886546287)
          {
LABEL_70:
            *(_DWORD *)buf = *(_DWORD *)a5;
            [v16 setArgument:buf atIndex:2];
            [v16 setArgument:&v39 atIndex:3];
            goto LABEL_76;
          }
          if (v7 != 1920166244) {
            goto LABEL_76;
          }
        }
        *(void *)buf = *(void *)a5;
        [v16 setArgument:buf atIndex:2];
        [v16 setArgument:&v39 atIndex:3];
        goto LABEL_76;
      }
      int v11 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        v21 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v21) {
          goto LABEL_79;
        }
      }
      else
      {
        v21 = MEMORY[0x1E4F14500];
        id v24 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "ATAudioSessionPropertyManager.mm";
        __int16 v45 = 1024;
        int v46 = 241;
        __int16 v47 = 1024;
        int v48 = v7;
        _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Error while setting property %d", buf, 0x18u);
      }
    }
    else
    {
      int v11 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        v21 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v21) {
          goto LABEL_79;
        }
      }
      else
      {
        v21 = MEMORY[0x1E4F14500];
        id v22 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "ATAudioSessionPropertyManager.mm";
        __int16 v45 = 1024;
        int v46 = 373;
        __int16 v47 = 1024;
        int v48 = v7;
        _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Un-Supported property request to set: %d on AVAudioSession", buf, 0x18u);
      }
    }

    goto LABEL_79;
  }
  int v11 = 1886681407;
  if (kAudioSessionClientLogSubsystem)
  {
    v12 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v12) {
      return v11;
    }
  }
  else
  {
    v12 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "ATAudioSessionPropertyManager.mm";
    __int16 v45 = 1024;
    int v46 = 226;
    __int16 v47 = 1024;
    int v48 = v7;
    v19 = "%25s:%-5d Invalid property request: property %d is not a write property";
LABEL_30:
    _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_ERROR, v19, buf, 0x18u);
  }
LABEL_79:

  return v11;
}

- (int)GetProperty:(unsigned int)a3 size:(unsigned int *)a4 data:(void *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (kAudioSessionClientLogSubsystem)
  {
    v9 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v41 = "ATAudioSessionPropertyManager.mm";
    __int16 v42 = 1024;
    aSelector[0] = 60;
    LOWORD(aSelector[1]) = 1024;
    *(_DWORD *)((char *)&aSelector[1] + 2) = v7;
    _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d GetProperty %d from AVAudioSession", buf, 0x18u);
  }

LABEL_8:
  asPropertyInfo::GetPropertyInfo((char *)buf, v7);
  if ((buf[0] & 2) != 0)
  {
    if (*a4 != v41)
    {
      int v12 = 561211770;
      if (kAudioSessionClientLogSubsystem)
      {
        v13 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v13) {
          return v12;
        }
      }
      else
      {
        v13 = MEMORY[0x1E4F14500];
        id v19 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      int v34 = 136315650;
      v35 = "ATAudioSessionPropertyManager.mm";
      __int16 v36 = 1024;
      int v37 = 71;
      __int16 v38 = 1024;
      int v39 = v7;
      id v18 = "%25s:%-5d Invalid input size for property %d";
      goto LABEL_33;
    }
    if (*(void *)((char *)aSelector + 2))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->mAsClientImpl);
      v15 = [WeakRetained avas];

      if (!v15)
      {
        v13 = 0;
        int v12 = 560557673;
        goto LABEL_34;
      }
      v16 = NSStringFromSelector(*(SEL *)((char *)aSelector + 2));
      v13 = [v15 valueForKey:v16];
    }
    else
    {
      v13 = 0;
    }
    int v12 = 0;
    if ((int)v7 > 1684431724)
    {
      if ((int)v7 <= 1836016740)
      {
        if ((int)v7 <= 1768382837)
        {
          if ((int)v7 <= 1685414762)
          {
            if (v7 != 1684431725)
            {
              if (v7 != 1685288051) {
                goto LABEL_34;
              }
              goto LABEL_92;
            }
            goto LABEL_89;
          }
          if (v7 != 1685414763)
          {
            if (v7 != 1752658802) {
              goto LABEL_34;
            }
            goto LABEL_91;
          }
LABEL_85:
          unint64_t v28 = +[ATAudioSessionUtils getCategoryOptionFromPropertyID:v7];
          int v12 = 0;
          *(_DWORD *)a5 = ([v13 unsignedLongValue] & v28) != 0;
          goto LABEL_34;
        }
        if ((int)v7 <= 1768907363)
        {
          if (v7 != 1768382838)
          {
            int v21 = 1768387427;
LABEL_69:
            if (v7 != v21) {
              goto LABEL_34;
            }
LABEL_70:
            [v13 floatValue];
            int v12 = 0;
            *(_DWORD *)a5 = v25;
            goto LABEL_34;
          }
          goto LABEL_74;
        }
        if (v7 == 1768907364) {
          goto LABEL_70;
        }
        int v22 = 1769173603;
LABEL_80:
        if (v7 != v22) {
          goto LABEL_34;
        }
        int v12 = 0;
        uint64_t v27 = &unk_1EF73FE90;
LABEL_93:
        *(void *)a5 = v27;
        goto LABEL_34;
      }
      if ((int)v7 <= 1919907187)
      {
        if ((int)v7 <= 1869899889)
        {
          if (v7 == 1836016741)
          {
LABEL_89:
            if (*a4 == v41)
            {
              unsigned int v26 = +[ATAudioSessionUtils getAudioSessionMode:v13];
              goto LABEL_103;
            }
            v31 = CALog::LogObjIfEnabled((CALog *)1, kAudioSessionClientLogSubsystem, v11);
            v32 = v31;
            if (v31 && os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              int v34 = 136315650;
              v35 = "ATAudioSessionPropertyManager.mm";
              __int16 v36 = 1024;
              int v37 = 109;
              __int16 v38 = 1024;
              int v39 = v7;
              _os_log_impl(&dword_1A3931000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid input size for property %d", (uint8_t *)&v34, 0x18u);
            }
LABEL_107:

            int v12 = 561211770;
            goto LABEL_34;
          }
          int v22 = 1868854132;
          goto LABEL_80;
        }
        if (v7 != 1869899890)
        {
          if (v7 != 1886546287) {
            goto LABEL_34;
          }
          goto LABEL_73;
        }
LABEL_74:
        unsigned int v26 = [v13 BOOLValue];
        goto LABEL_103;
      }
      if ((int)v7 > 1936876402)
      {
        if (v7 != 1936876403)
        {
          if (v7 == 1954115685)
          {
            id v29 = objc_loadWeakRetained((id *)&self->mAsClientImpl);
            *(_DWORD *)a5 = [v29 interruptionType];

            int v12 = 0;
          }
          goto LABEL_34;
        }
LABEL_92:
        int v12 = 0;
        uint64_t v27 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_93;
      }
      if (v7 == 1919907188)
      {
        id v24 = v13;
        v13 = v24;
      }
      else
      {
        if (v7 != 1920166244) {
          goto LABEL_34;
        }
        id v24 = [v13 longLongValue];
      }
LABEL_96:
      int v12 = 0;
      *(void *)a5 = v24;
      goto LABEL_34;
    }
    if ((int)v7 <= 1667788642)
    {
      if ((int)v7 <= 1634956147)
      {
        if (v7 == 1633902964)
        {
          if (*a4 == v41)
          {
            unsigned int v26 = +[ATAudioSessionUtils getAudioSessionCategory:v13];
            goto LABEL_103;
          }
          v33 = CALog::LogObjIfEnabled((CALog *)1, kAudioSessionClientLogSubsystem, v11);
          v32 = v33;
          if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            int v34 = 136315650;
            v35 = "ATAudioSessionPropertyManager.mm";
            __int16 v36 = 1024;
            int v37 = 100;
            __int16 v38 = 1024;
            int v39 = 1633902964;
            _os_log_impl(&dword_1A3931000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid input size for property %d", (uint8_t *)&v34, 0x18u);
          }
          goto LABEL_107;
        }
        if (v7 != 1633907830 && v7 != 1634296182) {
          goto LABEL_34;
        }
        goto LABEL_74;
      }
      if ((int)v7 > 1667785315)
      {
        if (v7 == 1667785316) {
          goto LABEL_70;
        }
        if (v7 != 1667787107) {
          goto LABEL_34;
        }
        goto LABEL_73;
      }
      if (v7 == 1634956148)
      {
LABEL_73:
        unsigned int v26 = [v13 unsignedIntValue];
LABEL_103:
        int v12 = 0;
        *(_DWORD *)a5 = v26;
        goto LABEL_34;
      }
      int v23 = 1667394677;
    }
    else
    {
      if ((int)v7 <= 1668114807)
      {
        if ((int)v7 > 1667789681)
        {
          if (v7 == 1667789682)
          {
LABEL_91:
            [v13 doubleValue];
            int v12 = 0;
            *(void *)a5 = v30;
            goto LABEL_34;
          }
          int v21 = 1667853428;
          goto LABEL_69;
        }
        if (v7 != 1667788643)
        {
          int v21 = 1667788662;
          goto LABEL_69;
        }
        goto LABEL_73;
      }
      if ((int)v7 <= 1668440433)
      {
        if (v7 == 1668114808) {
          goto LABEL_85;
        }
        int v21 = 1668246644;
        goto LABEL_69;
      }
      if (v7 == 1668440434)
      {
        id v24 = +[ATAudioSessionUtils getRouteDescriptionFromAVASRouteDescription:v13];
        goto LABEL_96;
      }
      int v23 = 1668509803;
    }
    if (v7 != v23) {
      goto LABEL_34;
    }
    goto LABEL_85;
  }
  int v12 = 1886681407;
  if (kAudioSessionClientLogSubsystem)
  {
    v13 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v13) {
      return v12;
    }
  }
  else
  {
    v13 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v34 = 136315650;
    v35 = "ATAudioSessionPropertyManager.mm";
    __int16 v36 = 1024;
    int v37 = 67;
    __int16 v38 = 1024;
    int v39 = v7;
    id v18 = "%25s:%-5d Invalid property request: property %d is not a read property";
LABEL_33:
    _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v34, 0x18u);
  }
LABEL_34:

  return v12;
}

- (ATAudioSessionPropertyManager)initWithATAudioSessionClientImpl:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "ATAudioSessionPropertyManager.mm";
    __int16 v15 = 1024;
    int v16 = 40;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Creating ATAudioSessionPropertyManager", buf, 0x12u);
  }

LABEL_8:
  v12.receiver = self;
  v12.super_class = (Class)ATAudioSessionPropertyManager;
  uint64_t v7 = [(ATAudioSessionPropertyManager *)&v12 init];
  v8 = v7;
  if (!v7)
  {
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  if (!v4)
  {
    if (kAudioSessionClientLogSubsystem)
    {
      v9 = (ATAudioSessionPropertyManager *)*(id *)kAudioSessionClientLogSubsystem;
      if (!v9) {
        goto LABEL_19;
      }
    }
    else
    {
      v9 = (ATAudioSessionPropertyManager *)MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "ATAudioSessionPropertyManager.mm";
      __int16 v15 = 1024;
      int v16 = 46;
      _os_log_impl(&dword_1A3931000, &v9->super, OS_LOG_TYPE_ERROR, "%25s:%-5d Passing nil ATAudioSessionClientImpl", buf, 0x12u);
    }

    goto LABEL_18;
  }
  objc_storeWeak((id *)&v7->mAsClientImpl, v4);
  v9 = v8;
LABEL_19:

  return v9;
}

@end