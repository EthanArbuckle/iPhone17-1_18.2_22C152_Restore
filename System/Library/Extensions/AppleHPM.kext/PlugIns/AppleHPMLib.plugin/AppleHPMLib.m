uint64_t AppleHPMLibRT13Interface::forceATCRTUpdateModeCIO(AppleHPMLibRT13Interface *this, int a2)
{
  uint64_t v4;
  int v5;
  uint64_t updated;
  uint64_t v7;
  int v8;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;

  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n", "forceATCRTUpdateModeCIO", *((void *)this + 2), *((_DWORD *)this + 10), a2);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *((void *)this + 2);
    v5 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v11 = "forceATCRTUpdateModeCIO";
    v12 = 2048;
    v13 = v4;
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n", buf, 0x22u);
  }
  updated = AppleHPMLibPriv::forceUpdateMode(*((AppleHPMLibPriv **)this + 1), *((void **)this + 2));
  if (updated)
  {
    if (*((unsigned char *)this + 25))
    {
      printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - Forcing CIO + USB2 failed\n\n", "forceATCRTUpdateModeCIO", *((void *)this + 2), *((_DWORD *)this + 10));
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_69F0();
    }
    if (*((unsigned char *)this + 24)) {
      AppleHPMLibRTInterface::triggerSystemPanic(this, "AppleHPMLibRTUpdaterInterface - forcing CIO + USB2 failed\n");
    }
  }
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", "forceATCRTUpdateModeCIO", *((void *)this + 2), *((_DWORD *)this + 10), updated);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *((void *)this + 2);
    v8 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v11 = "forceATCRTUpdateModeCIO";
    v12 = 2048;
    v13 = v7;
    v14 = 1024;
    v15 = v8;
    v16 = 1024;
    v17 = updated;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", buf, 0x22u);
  }
  return updated;
}

uint64_t AppleHPMLibRT13Interface::forceATCRTPower(AppleHPMLibRT13Interface *this, int a2)
{
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n", "forceATCRTPower", *((void *)this + 2), *((_DWORD *)this + 10), a2);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)this + 2);
    int v5 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v11 = "forceATCRTPower";
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n", buf, 0x22u);
  }
  if ((*(unsigned int (**)(AppleHPMLibRT13Interface *, BOOL))(*(void *)this + 40))(this, a2 != 0)) {
    uint64_t v6 = 3758097129;
  }
  else {
    uint64_t v6 = 0;
  }
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", "forceATCRTPower", *((void *)this + 2), *((_DWORD *)this + 10), v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *((void *)this + 2);
    int v8 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v11 = "forceATCRTPower";
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 1024;
    int v15 = v8;
    __int16 v16 = 1024;
    int v17 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", buf, 0x22u);
  }
  return v6;
}

uint64_t AppleHPMLibRT13Interface::forceATCRTUpdateMode(AppleHPMLibRT13Interface *this, uint64_t a2, uint64_t a3)
{
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n", "forceATCRTUpdateMode", *((void *)this + 2), *((_DWORD *)this + 10), a2);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *((void *)this + 2);
    int v7 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    int v15 = "forceATCRTUpdateMode";
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 1024;
    int v21 = a2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n", buf, 0x22u);
  }
  int v8 = (*(uint64_t (**)(AppleHPMLibRT13Interface *, uint64_t, uint64_t))(*(void *)this + 32))(this, a2, a3);
  if (!v8)
  {
    v9 = *(uint64_t (**)(AppleHPMLibRT13Interface *, uint64_t))(*(void *)this + 40);
    if (a2)
    {
      int v8 = v9(this, 65);
      if (!v8)
      {
        usleep(0x186A0u);
        int v8 = (*(uint64_t (**)(AppleHPMLibRT13Interface *, uint64_t))(*(void *)this + 40))(this, 1);
      }
    }
    else
    {
      int v8 = v9(this, 0);
    }
  }
  if (v8) {
    uint64_t v10 = 3758097129;
  }
  else {
    uint64_t v10 = 0;
  }
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", "forceATCRTUpdateMode", *((void *)this + 2), *((_DWORD *)this + 10), v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *((void *)this + 2);
    int v12 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    int v15 = "forceATCRTUpdateMode";
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 1024;
    int v19 = v12;
    __int16 v20 = 1024;
    int v21 = v10;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", buf, 0x22u);
  }
  return v10;
}

uint64_t AppleHPMLibRT13Interface::execVOUT(AppleHPMLibRT13Interface *this, int a2)
{
  unsigned __int8 v34 = a2;
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. value = 0x%X\n\n", "execVOUT", *((void *)this + 2), *((_DWORD *)this + 10), a2);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)this + 2);
    int v5 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v36 = "execVOUT";
    __int16 v37 = 2048;
    uint64_t v38 = v4;
    __int16 v39 = 1024;
    int v40 = v5;
    __int16 v41 = 1024;
    int v42 = a2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. value = 0x%X\n\n", buf, 0x22u);
  }
  int v33 = 1448039764;
  unsigned __int8 v32 = 0;
  int v6 = AppleHPMLibPriv::IECSAtomicCommand(*((AppleHPMLibPriv **)this + 1), (char *)&dword_0 + 1, &v33, &v34, 0, &v32, 0, 1u, 1u, v25, 1uLL, *((void *)this + 2), 0);
  int v7 = v6;
  if (!v6 && (v32 & 0xF) == 0) {
    goto LABEL_51;
  }
  if (*((unsigned char *)this + 25))
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - first VOUT failed, check if HPM is in DFUf [0x%X], taskRetCode=0x%X\n\n", "execVOUT", *((void *)this + 2), *((_DWORD *)this + 10), v6, v32);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = *((void *)this + 2);
    int v18 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136316162;
    v36 = "execVOUT";
    __int16 v37 = 2048;
    uint64_t v38 = v17;
    __int16 v39 = 1024;
    int v40 = v18;
    __int16 v41 = 1024;
    int v42 = v7;
    __int16 v43 = 1024;
    int v44 = v32;
    _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - first VOUT failed, check if HPM is in DFUf [0x%X], taskRetCode=0x%X\n\n", buf, 0x28u);
  }
  int v31 = 0;
  uint64_t v30 = 4;
  int v9 = AppleHPMLibPriv::iecsRead(*((AppleHPMLibPriv **)this + 1), *((void *)this + 2), 3u, &v31, 4uLL, 0, &v30, v8);
  if (v9)
  {
    if (*((unsigned char *)this + 25))
    {
      printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - Read mode failed [0x%X]\n\n", "execVOUT", *((void *)this + 2), *((_DWORD *)this + 10), v9);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_6BF4();
    }
    uint64_t v10 = 3758097129;
    uint64_t v11 = "AppleHPMLibRTUpdaterInterface - Read mode failed\n";
    goto LABEL_36;
  }
  if (v31 != 1716864580)
  {
    if (*((unsigned char *)this + 25))
    {
      printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - Not in DFUf but still failed VOUT, modeData=0x%x\n\n", "execVOUT", *((void *)this + 2), *((_DWORD *)this + 10), v31);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_6B78();
    }
    uint64_t v10 = 3758097129;
    uint64_t v11 = "AppleHPMLibRTUpdaterInterface - Not in DFUf but still failed VOUT\n";
    goto LABEL_36;
  }
  if (*((unsigned char *)this + 25))
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - pulling HPM out of DFUf...\n\n", "execVOUT", *((void *)this + 2), *((_DWORD *)this + 10));
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_6AFC();
  }
  int v29 = 1145460070;
  char v28 = 0;
  int v12 = AppleHPMLibPriv::IECSAtomicCommand(*((AppleHPMLibPriv **)this + 1), (char *)&dword_0 + 1, &v29, &v28, 0, &v32, 0, 1u, 1u, v26, 1uLL, *((void *)this + 2), 0);
  int v13 = v12;
  if (!v12 && (v32 & 0xF) == 0)
  {
    if (*((unsigned char *)this + 25))
    {
      printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - trying VOUT after cancelling DFUf, value = 0x%X\n\n", "execVOUT", *((void *)this + 2), *((_DWORD *)this + 10), v34);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_6A6C();
    }
    int v19 = AppleHPMLibPriv::IECSAtomicCommand(*((AppleHPMLibPriv **)this + 1), (char *)&dword_0 + 1, &v33, &v34, 0, &v32, 0, 1u, 1u, v27, 1uLL, *((void *)this + 2), 0);
    int v20 = v19;
    if (v19 || (v32 & 0xF) != 0)
    {
      if (*((unsigned char *)this + 25))
      {
        printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - second VOUT failed, status = [0x%X], taskRetCode=0x%X, modeData=0x%x\n\n", "execVOUT", *((void *)this + 2), *((_DWORD *)this + 10), v19, v32, v31);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *((void *)this + 2);
        int v24 = *((_DWORD *)this + 10);
        *(_DWORD *)buf = 136316418;
        v36 = "execVOUT";
        __int16 v37 = 2048;
        uint64_t v38 = v23;
        __int16 v39 = 1024;
        int v40 = v24;
        __int16 v41 = 1024;
        int v42 = v20;
        __int16 v43 = 1024;
        int v44 = v32;
        __int16 v45 = 1024;
        int v46 = v31;
        _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - second VOUT failed, status = [0x%X], taskRetCode=0x%X, modeData=0x%x\n\n", buf, 0x2Eu);
      }
      uint64_t v11 = "AppleHPMLibRTUpdaterInterface - Second VOUT failed\n";
      goto LABEL_35;
    }
LABEL_51:
    uint64_t v10 = 0;
    goto LABEL_37;
  }
  if (*((unsigned char *)this + 25))
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - cancelling DFUf failed [0x%X], taskRetCode=0x%X, modeData=0x%x\n\n", "execVOUT", *((void *)this + 2), *((_DWORD *)this + 10), v12, v32, v31);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = *((void *)this + 2);
    int v22 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136316418;
    v36 = "execVOUT";
    __int16 v37 = 2048;
    uint64_t v38 = v21;
    __int16 v39 = 1024;
    int v40 = v22;
    __int16 v41 = 1024;
    int v42 = v13;
    __int16 v43 = 1024;
    int v44 = v32;
    __int16 v45 = 1024;
    int v46 = v31;
    _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - cancelling DFUf failed [0x%X], taskRetCode=0x%X, modeData=0x%x\n\n", buf, 0x2Eu);
  }
  uint64_t v11 = "AppleHPMLibRTUpdaterInterface - First VOUT failed and cancelling DFUf failed\n";
LABEL_35:
  uint64_t v10 = 3758097129;
LABEL_36:
  AppleHPMLibRTInterface::triggerSystemPanic(this, v11);
LABEL_37:
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", "execVOUT", *((void *)this + 2), *((_DWORD *)this + 10), v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *((void *)this + 2);
    int v15 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v36 = "execVOUT";
    __int16 v37 = 2048;
    uint64_t v38 = v14;
    __int16 v39 = 1024;
    int v40 = v15;
    __int16 v41 = 1024;
    int v42 = v10;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", buf, 0x22u);
  }
  return v10;
}

uint64_t AppleHPMLibRT13InterfaceA3::forceATCRTUpdateMode(AppleHPMLibRT13InterfaceA3 *this, uint64_t a2, uint64_t a3)
{
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n", "forceATCRTUpdateMode", *((void *)this + 2), *((_DWORD *)this + 10), a2);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *((void *)this + 2);
    int v7 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    int v15 = "forceATCRTUpdateMode";
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 1024;
    int v21 = a2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n", buf, 0x22u);
  }
  buf[0] = 0;
  unsigned int v8 = AppleHPMLibRT13InterfaceA3::inADFU(this, (BOOL *)buf);
  if (buf[0]) {
    unsigned int v9 = -536870184;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  if (!v8 && !buf[0]) {
    uint64_t v10 = AppleHPMLibRT13Interface::forceATCRTUpdateMode(this, a2, a3);
  }
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", "forceATCRTUpdateMode", *((void *)this + 2), *((_DWORD *)this + 10), v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *((void *)this + 2);
    int v12 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    int v15 = "forceATCRTUpdateMode";
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 1024;
    int v19 = v12;
    __int16 v20 = 1024;
    int v21 = v10;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", buf, 0x22u);
  }
  return v10;
}

uint64_t AppleHPMLibRT13InterfaceA3::inADFU(AppleHPMLibRT13InterfaceA3 *this, BOOL *a2)
{
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry\n\n", "inADFU", *((void *)this + 2), *((_DWORD *)this + 10));
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *((void *)this + 2);
    int v6 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "inADFU";
    __int16 v15 = 2048;
    uint64_t v16 = v5;
    __int16 v17 = 1024;
    int v18 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry\n\n", buf, 0x1Cu);
  }
  int v12 = 0;
  uint64_t v11 = 4;
  if (a2)
  {
    uint64_t v7 = AppleHPMLibPriv::iecsRead(*((AppleHPMLibPriv **)this + 1), *((void *)this + 2), 3u, &v12, 4uLL, 0, &v11, v4);
    if (!v7)
    {
      if (v12 == 1430668353)
      {
        if (*((unsigned char *)this + 25))
        {
          printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - HPM in ADFU\n\n", "inADFU", *((void *)this + 2), *((_DWORD *)this + 10));
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_6D04();
        }
        uint64_t v7 = 0;
        *a2 = 1;
      }
      else
      {
        if (*((unsigned char *)this + 25))
        {
          printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - HPM is NOT in ADFU, modeData=0x%x\n\n", "inADFU", *((void *)this + 2), *((_DWORD *)this + 10), v12);
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_6D80();
        }
        uint64_t v7 = 0;
        *a2 = 0;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v7 = 3758097090;
  }
  if (*((unsigned char *)this + 25))
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - check for in ADFU failed [0x%X]\n\n", "inADFU", *((void *)this + 2), *((_DWORD *)this + 10), v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_6C70();
  }
  AppleHPMLibRTInterface::triggerSystemPanic(this, "AppleHPMLibRTUpdaterInterface - Check for in ADFU failed\n");
LABEL_17:
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", "inADFU", *((void *)this + 2), *((_DWORD *)this + 10), v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *((void *)this + 2);
    int v9 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = "inADFU";
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 1024;
    int v18 = v9;
    __int16 v19 = 1024;
    int v20 = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", buf, 0x22u);
  }
  return v7;
}

uint64_t AppleHPMLibRT13InterfaceA3::forceATCRTPower(AppleHPMLibRT13InterfaceA3 *this, int a2)
{
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n", "forceATCRTPower", *((void *)this + 2), *((_DWORD *)this + 10), a2);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)this + 2);
    int v5 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = "forceATCRTPower";
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    __int16 v17 = 1024;
    int v18 = v5;
    __int16 v19 = 1024;
    int v20 = a2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n", buf, 0x22u);
  }
  BOOL v12 = 0;
  unsigned int v6 = AppleHPMLibRT13InterfaceA3::inADFU(this, &v12);
  if (v12) {
    unsigned int v7 = -536870184;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v7;
  }
  if (!v6 && !v12) {
    uint64_t v8 = AppleHPMLibRT13Interface::forceATCRTPower(this, a2);
  }
  if (*((unsigned char *)this + 25) && (*((unsigned char *)this + 32) & 2) != 0)
  {
    printf("AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", "forceATCRTPower", *((void *)this + 2), *((_DWORD *)this + 10), v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *((void *)this + 2);
    int v10 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = "forceATCRTPower";
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 1024;
    int v18 = v10;
    __int16 v19 = 1024;
    int v20 = v8;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n", buf, 0x22u);
  }
  return v8;
}

void sub_51A4()
{
}

void sub_51BC()
{
}

void sub_51F8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_5228(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

void sub_525C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void AppleHPMLibRTInterface::AppleHPMLibRTInterface(AppleHPMLibRTInterface *this, void **a2, uint64_t a3, int a4)
{
  *((_DWORD *)this + 10) = a4;
  int v5 = (_DWORD *)((char *)this + 40);
  *((unsigned char *)this + 24) = 0;
  unsigned int v6 = (unsigned __int8 *)this + 24;
  uint64_t v7 = (uint64_t)*a2;
  *(void *)this = &off_8208;
  *((void *)this + 1) = v7;
  *((void *)this + 2) = a3;
  uint64_t v8 = (void *)((char *)this + 16);
  *((unsigned char *)this + 25) = os_parse_boot_arg_string();
  if (os_parse_boot_arg_int()) {
    *unsigned int v6 = 0;
  }
  if ((os_parse_boot_arg_int() & 1) == 0) {
    *((void *)this + 4) = 1;
  }
  if (*((unsigned char *)this + 25))
  {
    printf("AppleHPMLibRTInterface::%s@0x%llx RID%u - AppleHPMLibRTUpdater - panic debug enabled:%u\n\n", "AppleHPMLibRTInterface", *v8, *v5, *v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_6E04();
  }
}

void AppleHPMLibRTInterface::triggerSystemPanic(AppleHPMLibRTInterface *this, const char *a2)
{
  if (*((unsigned char *)this + 24))
  {
    int v3 = reboot_np(3072, a2);
    if (v3)
    {
      if (*((unsigned char *)this + 25))
      {
        printf("AppleHPMLibRTInterface::%s@0x%llx RID%u - Failed to trigger system panic: %u\n", "triggerSystemPanic", *((void *)this + 2), *((_DWORD *)this + 10), v3);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_6EA8();
      }
    }
  }
}

uint64_t AppleHPMLibPriv::queryInterfaceStatic(AppleHPMLibPriv *this, void *a2, CFUUIDBytes a3, void **a4)
{
  uint64_t v4 = *(void **)&a3.byte8;
  uint64_t v5 = *((void *)this + 1);
  CFUUIDRef v6 = CFUUIDCreateFromUUIDBytes(0, *(CFUUIDBytes *)&a2);
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v6, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v6, v8)))
  {
    uint64_t v9 = 0;
    *uint64_t v4 = v5 + 8;
    uint64_t v10 = *(void *)(v5 + 16);
  }
  else
  {
    CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes(0, 0xC1u, 0x3Au, 0xCDu, 0xD9u, 0x20u, 0x9Eu, 0x4Bu, 1u, 0xB7u, 0xBEu, 0xE0u, 0x5Cu, 0xD8u, 0x83u, 0xC7u, 0xB1u);
    if (!CFEqual(v6, v12))
    {
      CFUUIDRef v13 = CFUUIDGetConstantUUIDWithBytes(0, 0xACu, 0xE8u, 0x66u, 0xD8u, 0xAu, 0xE1u, 0x47u, 0x9Eu, 0xBAu, 0xEEu, 0x22u, 0xB7u, 0x69u, 9u, 0xAu, 0xA3u);
      if (!CFEqual(v6, v13))
      {
        CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xCFu, 0xCAu, 0x49u, 0xA5u, 0xEFu, 0xB5u, 0x47u, 0x6Bu, 0xA2u, 0xF0u, 0x21u, 9u, 0x86u, 0x1Cu, 0xAAu, 4u);
        if (!CFEqual(v6, v14))
        {
          CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xCFu, 0x8Bu, 0xE9u, 0xB3u, 9u, 0x9Au, 0x43u, 0x5Au, 0xAAu, 0x49u, 0x56u, 0x35u, 0x12u, 0x21u, 0xFAu, 0x78u);
          if (!CFEqual(v6, v15))
          {
            *uint64_t v4 = 0;
            uint64_t v9 = 2147483652;
            goto LABEL_5;
          }
        }
      }
    }
    uint64_t v9 = 0;
    *uint64_t v4 = v5 + 24;
    uint64_t v10 = *(void *)(v5 + 32);
  }
  ++*(_DWORD *)(v10 + 48);
LABEL_5:
  CFRelease(v6);
  return v9;
}

uint64_t AppleHPMLibPriv::addRefStatic(AppleHPMLibPriv *this, void *a2)
{
  uint64_t v2 = *((void *)this + 1);
  uint64_t result = (*(_DWORD *)(v2 + 48) + 1);
  *(_DWORD *)(v2 + 48) = result;
  return result;
}

uint64_t AppleHPMLibPriv::releaseStatic(AppleHPMLibPriv *this, void *a2)
{
  uint64_t v2 = (unsigned int *)*((void *)this + 1);
  uint64_t v3 = v2[12];
  v2[12] = v3 - 1;
  if (v2) {
    BOOL v4 = v3 == 1;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    (*(void (**)(unsigned int *, void *))(*(void *)v2 + 8))(v2, a2);
  }
  return v3;
}

uint64_t AppleHPMLibPriv::probeStatic(AppleHPMLibPriv *this, void *a2, io_object_t object, unsigned int a4, int *a5)
{
  if (object && IOObjectConformsTo(object, "AppleHPM")) {
    return 0;
  }
  else {
    return 3758097090;
  }
}

uint64_t AppleHPMLibPriv::startStatic(AppleHPMLibPriv *this, void *a2, io_service_t service)
{
  uint64_t v3 = (io_connect_t *)*((void *)this + 1);
  v3[13] = service;
  unsigned int v4 = IOServiceOpen(service, mach_task_self_, 0x2Au, v3 + 14);
  if (v3[14]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 3758097088;
  }
  if (!v5) {
    AppleHPMLibPriv::getRID((AppleHPMLibPriv *)v3);
  }
  return v5;
}

uint64_t AppleHPMLibPriv::stopStatic(AppleHPMLibPriv *this, void *a2)
{
  uint64_t v2 = *((void *)this + 1);
  io_connect_t v3 = *(_DWORD *)(v2 + 56);
  if (v3)
  {
    IOServiceClose(v3);
    *(_DWORD *)(v2 + 56) = 0;
  }
  return 0;
}

uint64_t AppleHPMLibPriv::iecsRead(AppleHPMLibPriv *this, uint64_t a2, unsigned int a3, void *a4, vm_size_t size, unsigned int a6, void *a7, unint64_t *a8)
{
  uint64_t v8 = 3758097084;
  uint64_t v9 = *((void *)this + 1);
  int v10 = *(_DWORD *)(v9 + 56);
  vm_address_t address = 0;
  if (!v10) {
    return v8;
  }
  uint64_t v17 = vm_allocate(mach_task_self_, &address, size, 1);
  if (!address) {
    return 3758097086;
  }
  input[0] = a2;
  input[1] = a3;
  input[2] = size;
  input[3] = address;
  input[4] = a6;
  uint32_t outputCnt = 1;
  __chkstk_darwin(v17);
  uint64_t v20 = 0;
  uint64_t v18 = IOConnectCallScalarMethod(*(_DWORD *)(v9 + 56), 0, input, 5u, &v20, &outputCnt);
  uint64_t v8 = v18;
  if (!a7 || v18)
  {
    if (v18) {
      goto LABEL_9;
    }
  }
  else
  {
    *a7 = v20;
  }
  memmove(a4, (const void *)address, size);
LABEL_9:
  if (address) {
    vm_deallocate(mach_task_self_, address, size);
  }
  return v8;
}

uint64_t AppleHPMLibPriv::iecsWrite(AppleHPMLibPriv *this, uint64_t a2, unsigned int a3, const void *a4, vm_size_t size, unsigned int a6)
{
  uint64_t v6 = 3758097084;
  uint64_t v7 = *((void *)this + 1);
  int v8 = *(_DWORD *)(v7 + 56);
  vm_address_t address = 0;
  if (v8)
  {
    vm_allocate(mach_task_self_, &address, size, 1);
    if (address)
    {
      memmove((void *)address, a4, size);
      input[0] = a2;
      input[1] = a3;
      input[2] = size;
      input[3] = address;
      input[4] = a6;
      uint32_t outputCnt = 0;
      uint64_t v6 = IOConnectCallScalarMethod(*(_DWORD *)(v7 + 56), 1u, input, 5u, 0, &outputCnt);
      if (address) {
        vm_deallocate(mach_task_self_, address, size);
      }
    }
    else
    {
      return 3758097086;
    }
  }
  return v6;
}

uint64_t AppleHPMLibPriv::iecsCommand(AppleHPMLibPriv *this, uint64_t a2, unsigned int a3, unsigned int a4)
{
  mach_port_t v4 = *(_DWORD *)(*((void *)this + 1) + 56);
  if (!v4) {
    return 3758097084;
  }
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  uint32_t outputCnt = 0;
  return IOConnectCallScalarMethod(v4, 2u, input, 3u, 0, &outputCnt);
}

uint64_t AppleHPMLibPriv::sendVDM(uint64_t a1, uint64_t a2, unsigned int a3, const void *a4, vm_size_t size, unsigned int a6)
{
  uint64_t v6 = 3758097084;
  uint64_t v7 = *(void *)(a1 + 8);
  int v8 = *(_DWORD *)(v7 + 56);
  vm_address_t address = 0;
  if (v8)
  {
    vm_allocate(mach_task_self_, &address, size, 1);
    if (address)
    {
      memmove((void *)address, a4, size);
      input[0] = a2;
      input[1] = a3;
      input[2] = size;
      uint64_t input[3] = address;
      input[4] = a6;
      uint32_t outputCnt = 0;
      uint64_t v6 = IOConnectCallScalarMethod(*(_DWORD *)(v7 + 56), 3u, input, 5u, 0, &outputCnt);
      if (address) {
        vm_deallocate(mach_task_self_, address, size);
      }
    }
    else
    {
      return 3758097086;
    }
  }
  return v6;
}

uint64_t AppleHPMLibPriv::receiveVDM(uint64_t a1, uint64_t a2, void *a3, vm_size_t size, unsigned int a5, _DWORD *a6, unsigned char *a7, void *a8)
{
  uint64_t v8 = 3758097084;
  uint64_t v9 = *(void *)(a1 + 8);
  int v10 = *(_DWORD *)(v9 + 56);
  vm_address_t address = 0;
  if (v10)
  {
    uint64_t v18 = vm_allocate(mach_task_self_, &address, size, 1);
    if (address)
    {
      input[0] = a2;
      input[1] = size;
      input[2] = address;
      uint64_t input[3] = a5;
      uint32_t outputCnt = 3;
      __chkstk_darwin(v18);
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v8 = IOConnectCallScalarMethod(*(_DWORD *)(v9 + 56), 4u, input, 4u, &v20, &outputCnt);
      if (!v8)
      {
        if (a8) {
          *a8 = v20;
        }
        if (a7) {
          *a7 = v21;
        }
        if (a6) {
          *a6 = v22;
        }
        memmove(a3, (const void *)address, size);
      }
      if (address) {
        vm_deallocate(mach_task_self_, address, size);
      }
    }
    else
    {
      return 3758097086;
    }
  }
  return v8;
}

uint64_t AppleHPMLibPriv::receiveVDMAttention(uint64_t a1, uint64_t a2, void *a3, vm_size_t size, unsigned int a5, _DWORD *a6, unsigned char *a7, void *a8)
{
  uint64_t v8 = 3758097084;
  uint64_t v9 = *(void *)(a1 + 8);
  int v10 = *(_DWORD *)(v9 + 56);
  vm_address_t address = 0;
  if (v10)
  {
    uint64_t v18 = vm_allocate(mach_task_self_, &address, size, 1);
    if (address)
    {
      input[0] = a2;
      input[1] = size;
      input[2] = address;
      uint64_t input[3] = a5;
      uint32_t outputCnt = 3;
      __chkstk_darwin(v18);
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v8 = IOConnectCallScalarMethod(*(_DWORD *)(v9 + 56), 5u, input, 4u, &v20, &outputCnt);
      if (!v8)
      {
        if (a8) {
          *a8 = v20;
        }
        if (a7) {
          *a7 = v21;
        }
        if (a6) {
          *a6 = v22;
        }
        memmove(a3, (const void *)address, size);
      }
      if (address) {
        vm_deallocate(mach_task_self_, address, size);
      }
    }
    else
    {
      return 3758097086;
    }
  }
  return v8;
}

uint64_t AppleHPMLibPriv::forceMode(AppleHPMLibPriv *this, void *a2)
{
  if (!*(_DWORD *)(*((void *)this + 1) + 56)) {
    return 3758097084;
  }
  __chkstk_darwin(this);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  uint32_t outputCnt = 0;
  return IOConnectCallScalarMethod(*(_DWORD *)(v6 + 56), 7u, v8, 4u, 0, &outputCnt);
}

uint64_t AppleHPMLibPriv::forceUpdateMode(AppleHPMLibPriv *this, void *a2)
{
  if (!*(_DWORD *)(*((void *)this + 1) + 56)) {
    return 3758097084;
  }
  __chkstk_darwin();
  v6[0] = v2;
  v6[1] = v3;
  uint32_t outputCnt = 0;
  return IOConnectCallScalarMethod(*(_DWORD *)(v4 + 56), 8u, v6, 2u, 0, &outputCnt);
}

uint64_t AppleHPMLibPriv::IECSAtomicCommand(AppleHPMLibPriv *this, void *a2, _DWORD *a3, const void *a4, _DWORD *a5, void *a6, _DWORD *a7, unsigned int a8, unsigned __int16 a9, unsigned __int16 a10, unint64_t a11, unint64_t a12, unsigned int a13)
{
  uint64_t v13 = *((void *)this + 1);
  int v14 = *(_DWORD *)(v13 + 56);
  vm_address_t address = 0;
  if (!v14)
  {
    size_t v19 = 0;
    vm_address_t v32 = 0;
    vm_address_t v33 = 0;
    vm_address_t v30 = 0;
    vm_address_t v31 = 0;
    uint64_t v20 = 3758097084;
    goto LABEL_37;
  }
  unsigned int v28 = a2;
  vm_allocate(mach_task_self_, &address, 4uLL, 1);
  size_t v19 = 0;
  if (address) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = 3758097086;
  }
  vm_address_t v33 = 0;
  if (a8 && address)
  {
    size_t v19 = a8;
    vm_allocate(mach_task_self_, &v33, a8, 1);
    if (v33) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = 3758097086;
    }
  }
  vm_address_t v32 = 0;
  if (a5 && !v20)
  {
    vm_allocate(mach_task_self_, &v32, 4uLL, 1);
    if (v32) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = 3758097086;
    }
  }
  size_t v21 = 0;
  vm_address_t v31 = 0;
  if (a9 && !v20)
  {
    vm_allocate(mach_task_self_, &v31, a9, 1);
    if (v31) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = 3758097086;
    }
    size_t v21 = a9;
  }
  vm_address_t v30 = 0;
  if (!a7 || v20)
  {
    size_t v22 = v21;
    if (v20) {
      goto LABEL_37;
    }
  }
  else
  {
    size_t v22 = v21;
    vm_allocate(mach_task_self_, &v30, 4uLL, 1);
    if (!v30)
    {
      uint64_t v20 = 3758097086;
      goto LABEL_37;
    }
  }
  *(_DWORD *)vm_address_t address = *a3;
  if (v33) {
    memmove((void *)v33, a4, v19);
  }
  vm_address_t v23 = v32;
  if (v32)
  {
    *(_DWORD *)vm_address_t v32 = *a5;
    vm_address_t v23 = v32;
  }
  input[0] = v28;
  input[1] = address;
  input[2] = v33;
  uint64_t input[3] = v23;
  uint64_t input[4] = v31;
  uint64_t input[5] = v30;
  input[6] = a8;
  input[7] = a9;
  input[8] = a11;
  input[9] = a12;
  input[10] = a13;
  uint32_t outputCnt = 0;
  uint64_t v20 = IOConnectCallScalarMethod(*(_DWORD *)(v13 + 56), 9u, input, 0xBu, 0, &outputCnt);
  BOOL v24 = v20 == 0;
  if (!v20 && v30)
  {
    *a7 = *(_DWORD *)v30;
    BOOL v24 = 1;
  }
  if (v24 && v31) {
    memmove(a6, (const void *)v31, v22);
  }
LABEL_37:
  if (address)
  {
    vm_deallocate(mach_task_self_, address, 4uLL);
    vm_address_t address = 0;
  }
  if (v33)
  {
    vm_deallocate(mach_task_self_, v33, v19);
    vm_address_t v33 = 0;
  }
  if (v32)
  {
    vm_deallocate(mach_task_self_, v32, 4uLL);
    vm_address_t v32 = 0;
  }
  if (v31)
  {
    vm_deallocate(mach_task_self_, v31, 4uLL);
    vm_address_t v31 = 0;
  }
  if (v30) {
    vm_deallocate(mach_task_self_, v30, 4uLL);
  }
  return v20;
}

uint64_t AppleHPMLibPriv::EnableOptions(AppleHPMLibPriv *this, void *a2)
{
  if (!*(_DWORD *)(*((void *)this + 1) + 56)) {
    return 3758097084;
  }
  __chkstk_darwin(this);
  v6[0] = v2;
  v6[1] = v3;
  uint32_t outputCnt = 0;
  return IOConnectCallScalarMethod(*(_DWORD *)(v4 + 56), 0xAu, v6, 2u, 0, &outputCnt);
}

uint64_t AppleHPMLibPriv::forceATCRTUpdateMode(AppleHPMLibPriv *this, void *a2)
{
  unsigned int v3 = this;
  if (*(_DWORD *)(*((void *)this + 1) + 56)) {
    operator new();
  }
  return 3758097084;
}

void sub_6584()
{
}

uint64_t AppleHPMLibPriv::forceATCRTPower(AppleHPMLibPriv *this, void *a2)
{
  unsigned int v3 = this;
  if (*(_DWORD *)(*((void *)this + 1) + 56)) {
    operator new();
  }
  return 3758097084;
}

void sub_66A0()
{
}

uint64_t AppleHPMLibFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x12u, 0xA1u, 0xDCu, 0xCFu, 0xCFu, 0x7Au, 0x47u, 0x75u, 0xBEu, 0xE5u, 0x9Cu, 0x43u, 0x19u, 0xF4u, 0xCDu, 0x2Bu);
  uint64_t v4 = (AppleHPMLibPriv *)CFEqual(a2, v3);
  if (v4)
  {
    AppleHPMLibPriv::alloc(v4);
  }
  return 0;
}

void AppleHPMLibPriv::alloc(AppleHPMLibPriv *this)
{
}

void sub_67B0()
{
}

void AppleHPMLibPriv::AppleHPMLibPriv(AppleHPMLibPriv *this)
{
  *((_DWORD *)this + 15) = 0xFFFF;
  *((_DWORD *)this + 12) = 0;
  *(void *)this = off_8238;
  *((void *)this + 1) = &AppleHPMLibPriv::sIOCFPlugInVTable;
  *((void *)this + 2) = this;
  *((void *)this + 3) = &AppleHPMLibPriv::sAppleHPMLibVTable;
  *((void *)this + 4) = this;
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes(0, 0x70u, 0xFFu, 0x44u, 0x3Eu, 0x8Au, 0xCFu, 0x43u, 0xACu, 0xB7u, 0x93u, 0xE7u, 0x91u, 0x1Cu, 0x1Cu, 0xCu, 0xD5u);
  *((void *)this + 5) = v2;
  CFRetain(v2);
  CFPlugInAddInstanceForFactory(*((CFUUIDRef *)this + 5));
}

void AppleHPMLibPriv::~AppleHPMLibPriv(CFUUIDRef *this)
{
  *this = (CFUUIDRef)off_8238;
  CFPlugInRemoveInstanceForFactory(this[5]);
  CFRelease(this[5]);
}

{
  uint64_t vars8;

  AppleHPMLibPriv::~AppleHPMLibPriv(this);

  operator delete();
}

void sub_68E8(void *a1)
{
}

uint64_t AppleHPMLibPriv::getRID(AppleHPMLibPriv *this)
{
  uint64_t v2 = 3758097136;
  io_registry_entry_t v3 = *((_DWORD *)this + 13);
  if (v3)
  {
    io_registry_entry_t parent = 0;
    if (!IORegistryEntryGetParentEntry(v3, "IOService", &parent))
    {
      CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(parent, @"rid", kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        CFDataRef v5 = CFProperty;
        if (CFDataGetLength(CFProperty) <= 4)
        {
          v8.location = 0;
          v8.length = 4;
          CFDataGetBytes(v5, v8, (UInt8 *)this + 60);
          uint64_t v2 = 0;
        }
        else
        {
          uint64_t v2 = 3758097084;
        }
        CFRelease(v5);
      }
    }
  }
  return v2;
}

void sub_69F0()
{
  sub_51F8(__stack_chk_guard);
  sub_5208();
  sub_525C(&dword_0, &_os_log_default, v0, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - Forcing CIO + USB2 failed\n\n", v1, v2, v3, v4, 2u);
}

void sub_6A6C()
{
  sub_51F8(__stack_chk_guard);
  sub_5244();
  sub_5228(&dword_0, &_os_log_default, v0, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - trying VOUT after cancelling DFUf, value = 0x%X\n\n", v1, v2, v3, v4, 2u);
}

void sub_6AFC()
{
  sub_51F8(__stack_chk_guard);
  sub_5208();
  sub_525C(&dword_0, &_os_log_default, v0, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - pulling HPM out of DFUf...\n\n", v1, v2, v3, v4, 2u);
}

void sub_6B78()
{
  sub_51F8(__stack_chk_guard);
  sub_51D0();
  sub_5228(&dword_0, &_os_log_default, v0, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - Not in DFUf but still failed VOUT, modeData=0x%x\n\n", v1, v2, v3, v4, 2u);
}

void sub_6BF4()
{
  sub_51F8(__stack_chk_guard);
  sub_51D0();
  sub_5228(&dword_0, &_os_log_default, v0, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - Read mode failed [0x%X]\n\n", v1, v2, v3, v4, 2u);
}

void sub_6C70()
{
  sub_5244();
  sub_5228(&dword_0, &_os_log_default, v0, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - check for in ADFU failed [0x%X]\n\n", v1, v2, v3, v4, 2u);
}

void sub_6D04()
{
  sub_51F8(__stack_chk_guard);
  sub_5208();
  sub_525C(&dword_0, &_os_log_default, v0, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - HPM in ADFU\n\n", v1, v2, v3, v4, 2u);
}

void sub_6D80()
{
  sub_51F8(__stack_chk_guard);
  sub_51D0();
  sub_5228(&dword_0, &_os_log_default, v0, "AppleHPMLibRT13Interface::%s@0x%llx RID%u - HPM is NOT in ADFU, modeData=0x%x\n\n", v1, v2, v3, v4, 2u);
}

void sub_6E04()
{
  int v1 = 136315906;
  uint64_t v2 = "AppleHPMLibRTInterface";
  __int16 v3 = 2048;
  sub_5244();
  int v4 = v0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "AppleHPMLibRTInterface::%s@0x%llx RID%u - AppleHPMLibRTUpdater - panic debug enabled:%u\n\n", (uint8_t *)&v1, 0x22u);
}

void sub_6EA8()
{
  int v1 = 136315906;
  uint64_t v2 = "triggerSystemPanic";
  __int16 v3 = 2048;
  sub_5244();
  int v4 = v0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "AppleHPMLibRTInterface::%s@0x%llx RID%u - Failed to trigger system panic: %u\n", (uint8_t *)&v1, 0x22u);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return _os_parse_boot_arg_int();
}

uint64_t os_parse_boot_arg_string()
{
  return _os_parse_boot_arg_string();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int reboot_np(int howto, const char *message)
{
  return _reboot_np(howto, message);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}