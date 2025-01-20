@interface AURIOCallbackReceiver
@end

@implementation AURIOCallbackReceiver

void __AURIOCallbackReceiver_IOFormatsChanged_block_invoke(uint64_t a1)
{
  mach_msg_return_t v11;
  mach_msg_return_t v12;
  int v13;
  int v14;
  NSObject *v15;
  uint64_t Element;
  uint64_t v17;
  void *v18;
  unsigned int **v19;
  const AudioChannelLayout *v20;
  CAAudioChannelLayout *v21;
  CAAudioChannelLayout *v22;
  NSObject **v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  int v29;
  AudioStreamBasicDescription *v30;
  uint64_t v31;
  AudioStreamBasicDescription *v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;
  unsigned char v38[32];
  atomic_uint *v39;
  char v40;
  uint64_t v41;
  void *v42;
  void *v43;
  CAAudioChannelLayout *v44;
  void (*v45)(CAAudioChannelLayout *);
  CAAudioChannelLayout *v46;
  void (*v47)(CAAudioChannelLayout *);
  void v48[2];
  int v49;
  char v50;
  void v51[2];
  int v52;
  char v53;
  AudioStreamBasicDescription v54;
  AudioStreamBasicDescription v55;
  void v56[2];
  char v57;
  uint64_t *v58;
  int *v59;
  void **v60;
  int *v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  int v65;
  unsigned char msg[116];
  long long v67;
  long long v68;
  long long v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x263EF8340];
  uint64_t v2 = gRIOMutex;
  if (gRIOMutex) {
    (*(void (**)(uint64_t))(*(void *)gRIOMutex + 16))(gRIOMutex);
  }
  ResolvedOpaqueRef<TOpaqueRef<AURemoteIO>>::ResolvedOpaqueRef((uint64_t)v38, *(_DWORD *)(a1 + 32));
  if (v41)
  {
    uint64_t v3 = *(void *)(v41 + 16);
    int v4 = *(_DWORD *)(a1 + 36);
    uint64_t v5 = *(void *)(v3 + 472);
    if (v5) {
      (*(void (**)(void))(*(void *)v5 + 16))(*(void *)(v3 + 472));
    }
    v57 = 1;
    v56[0] = &unk_26CBAE560;
    v56[1] = 1024;
    v58 = &v62;
    v59 = &v63;
    v60 = (void **)&v64;
    v61 = &v65;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v51[1] = 0;
    v51[0] = &unk_26CBB18C8;
    v52 = 0;
    v53 = 1;
    v48[1] = 0;
    v48[0] = &unk_26CBB18C8;
    v49 = 0;
    v50 = 1;
    RIOServer::GetServerPort((const char **)gRIOServer);
    int ServerPort = RIOServer::GetServerPort((const char **)gRIOServer);
    int v7 = *(_DWORD *)(v3 + 712);
    v8 = v60;
    v9 = v61;
    v70 = 0;
    v69 = 0u;
    v68 = 0u;
    v67 = 0u;
    memset(&msg[4], 0, 112);
    *(void *)&msg[24] = *MEMORY[0x263EF80C8];
    *(_DWORD *)&msg[32] = v7;
    mach_port_t reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = 5395;
    *(_DWORD *)&msg[8] = ServerPort;
    *(void *)&msg[16] = 0x157C600000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      mach_port_t reply_port = *(_DWORD *)&msg[12];
    }
    v11 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0xACu, reply_port, *MEMORY[0x263EFC0D0], 0);
    v12 = v11;
    if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (!v11)
      {
        if (*(_DWORD *)&msg[20] == 88106
          && (*(_DWORD *)msg & 0x80000000) != 0
          && *(_DWORD *)&msg[24] == 3
          && *(_DWORD *)&msg[4] == 164
          && !*(_DWORD *)&msg[8]
          && msg[39] == 1
          && *(unsigned __int16 *)&msg[54] << 16 == 1114112
          && *(unsigned __int16 *)&msg[66] << 16 == 1114112)
        {
          v13 = *(_DWORD *)&msg[40];
          if (*(_DWORD *)&msg[40] == DWORD2(v69))
          {
            v55 = *(AudioStreamBasicDescription *)&msg[76];
            *(void *)&v54.mBitsPerChannel = v69;
            *(_OWORD *)&v54.mSampleRate = v67;
            *(_OWORD *)&v54.mBytesPerPacket = v68;
            *v8 = *(void **)&msg[28];
            int *v9 = v13;
            v52 = *(_DWORD *)&msg[44];
            v49 = *(_DWORD *)&msg[56];
            goto LABEL_30;
          }
        }
LABEL_29:
        mach_msg_destroy((mach_msg_header_t *)msg);
LABEL_30:
        v14 = _CheckRPCError("IOFormatsChanged");
        if (v14)
        {
          if (kRIOClientSubsystem)
          {
            v15 = *(NSObject **)kRIOClientSubsystem;
            if (!*(void *)kRIOClientSubsystem)
            {
LABEL_97:
              SharableMemoryBlock::MachClientToken::~MachClientToken((SharableMemoryBlock::MachClientToken *)v48);
              SharableMemoryBlock::MachClientToken::~MachClientToken((SharableMemoryBlock::MachClientToken *)v51);
              MIGVariableLengthRefs::~MIGVariableLengthRefs((MIGVariableLengthRefs *)v56);
              if (v5) {
                (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
              }
              goto LABEL_99;
            }
          }
          else
          {
            v15 = &_os_log_internal;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)msg = 136315650;
            *(void *)&msg[4] = "AURemoteIO.cpp";
            *(_WORD *)&msg[12] = 1024;
            *(_DWORD *)&msg[14] = 1736;
            *(_WORD *)&msg[18] = 1024;
            *(_DWORD *)&msg[20] = v14;
            _os_log_impl(&dword_21B9BB000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d error %d from GetCurrentFormats", msg, 0x18u);
          }
          goto LABEL_97;
        }
        AUConverterRTMutex::lock((atomic_ullong *)(v3 + 528));
        Element = ausdk::AUScope::SafeGetElement((ausdk::AUScope *)(v3 + 128), 0);
        v17 = ausdk::AUScope::SafeGetElement((ausdk::AUScope *)(v3 + 80), 1u);
        v46 = 0;
        v47 = (void (*)(CAAudioChannelLayout *))MEMORY[0x263EF88C0];
        v44 = 0;
        v45 = (void (*)(CAAudioChannelLayout *))MEMORY[0x263EF88C0];
        if (*v60) {
          v18 = *v60;
        }
        else {
          v18 = v58;
        }
        v19 = (unsigned int **)&v61;
        if (!*v60) {
          v19 = (unsigned int **)&v59;
        }
        AURIOClientMessageReader::ParseLayouts(v18, **v19, (uint64_t *)&v46, (uint64_t *)&v44);
        v21 = v46;
        if (v46) {
          HIDWORD(v37) = !CAAudioChannelLayout::AreLayoutsEquivalent((const AudioChannelLayout *)v46, *(const AudioChannelLayout **)(Element + 120), v20);
        }
        else {
          HIDWORD(v37) = 0;
        }
        v22 = v44;
        v36 = v4;
        if (v44) {
          LODWORD(v37) = !CAAudioChannelLayout::AreLayoutsEquivalent((const AudioChannelLayout *)v44, *(const AudioChannelLayout **)(v17 + 120), v20);
        }
        else {
          LODWORD(v37) = 0;
        }
        v23 = (NSObject **)kRIOClientSubsystem;
        if (kRIOClientSubsystem)
        {
          v24 = *(NSObject **)kRIOClientSubsystem;
          if (!*(void *)kRIOClientSubsystem)
          {
LABEL_70:
            v29 = *(_DWORD *)(v3 + 612) & ~*(_DWORD *)(v3 + 1012);
            if ((v29 & 2) != 0) {
              v30 = &v55;
            }
            else {
              v30 = 0;
            }
            if ((v29 & 2) != 0) {
              v31 = (uint64_t)v21;
            }
            else {
              v31 = 0;
            }
            if (v29) {
              v32 = &v54;
            }
            else {
              v32 = 0;
            }
            if (v29) {
              v33 = (uint64_t)v22;
            }
            else {
              v33 = 0;
            }
            AURemoteIO::ChangeHardwareFormats((unsigned char *)v3, v30, v32, v31, v33, (int *)(v3 + 616), (uint64_t)v51, (uint64_t)v48);
            AUConverterBase::SetupAllConverters((AUConverterBase *)v3, 0);
            AUIOHelper::Initialize((AUIOHelper *)(v3 + 800));
            RIOServer::GetServerPort((const char **)gRIOServer);
            v34 = RIOServer::GetServerPort((const char **)gRIOServer);
            v35 = *(_DWORD *)(v3 + 712);
            *(void *)&msg[24] = *MEMORY[0x263EF80C8];
            *(_DWORD *)&msg[32] = v35;
            *(_DWORD *)&msg[36] = v36;
            *(void *)msg = 19;
            *(_DWORD *)&msg[20] = 88011;
            *(_DWORD *)&msg[16] = 0;
            *(_DWORD *)&msg[8] = v34;
            *(_DWORD *)&msg[12] = 0;
            if (MEMORY[0x263EF8B00]) {
              voucher_mach_msg_set((mach_msg_header_t *)msg);
            }
            if (mach_msg((mach_msg_header_t *)msg, 17, 0x28u, 0, 0, *MEMORY[0x263EFC0D0], 0) == 268435460)
            {
              if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
                mach_port_deallocate(*MEMORY[0x263EF8960], *(mach_port_name_t *)&msg[12]);
              }
              mach_msg_destroy((mach_msg_header_t *)msg);
            }
            _CheckRPCError("IOFormatsChanged");
            if (HIDWORD(v37)) {
              (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)v3 + 432))(v3, 19, 2, 0);
            }
            if (v37) {
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v3 + 432))(v3, 19, 1, 1);
            }
            v44 = 0;
            if (v22) {
              v45(v22);
            }
            v46 = 0;
            if (v21) {
              v47(v21);
            }
            AUConverterRTMutex::unlock((atomic_ullong *)(v3 + 528));
            goto LABEL_97;
          }
        }
        else
        {
          v24 = &_os_log_internal;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          CAFormatter::CAFormatter((CAFormatter *)&v43, &v55);
          v25 = v43;
          CAFormatter::CAFormatter((CAFormatter *)&v42, &v54);
          *(_DWORD *)msg = 136316162;
          *(void *)&msg[4] = "AURemoteIO.cpp";
          *(_WORD *)&msg[12] = 1024;
          *(_DWORD *)&msg[14] = 1759;
          *(_WORD *)&msg[18] = 2048;
          *(void *)&msg[20] = v3;
          *(_WORD *)&msg[28] = 2080;
          *(void *)&msg[30] = v25;
          *(_WORD *)&msg[38] = 2080;
          *(void *)&msg[40] = v42;
          _os_log_impl(&dword_21B9BB000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d AURemoteIO(%p)::IOFormatsChanged:\n  output: %s\n  input:  %s", msg, 0x30u);
          if (v42) {
            free(v42);
          }
          if (v43) {
            free(v43);
          }
          v23 = (NSObject **)kRIOClientSubsystem;
        }
        if (v23)
        {
          v26 = *v23;
          if (!*v23) {
            goto LABEL_70;
          }
        }
        else
        {
          v26 = &_os_log_internal;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          if (v37) {
            v27 = "changed";
          }
          else {
            v27 = "unchanged";
          }
          MEMORY[0x21D4971B0](&v43, v21);
          v28 = v43;
          MEMORY[0x21D4971B0](&v42, v22);
          *(_DWORD *)msg = 136316418;
          *(void *)&msg[4] = "AURemoteIO.cpp";
          *(_WORD *)&msg[12] = 1024;
          *(_DWORD *)&msg[14] = 1763;
          *(_WORD *)&msg[18] = 2048;
          *(void *)&msg[20] = v3;
          *(_WORD *)&msg[28] = 2080;
          *(void *)&msg[30] = v27;
          *(_WORD *)&msg[38] = 2080;
          *(void *)&msg[40] = v28;
          *(_WORD *)&msg[48] = 2080;
          *(void *)&msg[50] = v42;
          _os_log_impl(&dword_21B9BB000, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d AURemoteIO(%p)::IOFormatsChanged: layout (%s)\n  output: %s\n  input:  %s", msg, 0x3Au);
          if (v42) {
            free(v42);
          }
          if (v43) {
            free(v43);
          }
        }
        goto LABEL_70;
      }
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    if (v12 != 268435460) {
      goto LABEL_30;
    }
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x263EF8960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_29;
  }
LABEL_99:
  if (v40 && v39) {
    atomic_fetch_add(v39, 0xFFFFFFFF);
  }
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
}

void __AURIOCallbackReceiver_SessionDeactivated_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  ResolvedOpaqueRef<TOpaqueRef<AURemoteIO>>::ResolvedOpaqueRef((uint64_t)v10, *(_DWORD *)(a1 + 32));
  if (!v13) {
    goto LABEL_29;
  }
  uint64_t v1 = *(void *)(v13 + 16);
  uint64_t v2 = *(void *)(v1 + 472);
  if (v2) {
    (*(void (**)(void))(*(void *)v2 + 16))(*(void *)(v1 + 472));
  }
  int v3 = *(unsigned __int8 *)(v1 + 1300);
  *(unsigned char *)(v1 + 1300) = 0;
  if (!v3)
  {
    if (kRIOClientSubsystem)
    {
      uint64_t v5 = *(NSObject **)kRIOClientSubsystem;
      if (!*(void *)kRIOClientSubsystem) {
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v5 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315650;
    v15 = "AURemoteIO.cpp";
    __int16 v16 = 1024;
    int v17 = 2406;
    __int16 v18 = 2048;
    uint64_t v19 = v1;
    v6 = "%25s:%-5d AURemoteIO@%p: Pending stop was cancelled";
    int v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_17;
  }
  if ((int)*MEMORY[0x263EFC0D8] <= 0 && (*(_DWORD *)(v1 + 560) - 6) <= 0xFFFFFFFB)
  {
    if (*(unsigned char *)(v1 + 558))
    {
      if (kRIOClientSubsystem)
      {
        int v4 = *(NSObject **)kRIOClientSubsystem;
        if (!*(void *)kRIOClientSubsystem)
        {
LABEL_26:
          (*(void (**)(uint64_t))(*(void *)v1 + 448))(v1);
          goto LABEL_27;
        }
      }
      else
      {
        int v4 = &_os_log_internal;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v15 = "AURemoteIO.cpp";
        __int16 v16 = 1024;
        int v17 = 2411;
        __int16 v18 = 2048;
        uint64_t v19 = v1;
        _os_log_impl(&dword_21B9BB000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AURemoteIO@%p: Session interrupted, will stop iounit", buf, 0x1Cu);
      }
      goto LABEL_26;
    }
    if (kRIOClientSubsystem)
    {
      if (*(unsigned char *)(kRIOClientSubsystem + 8))
      {
        v9 = *(NSObject **)kRIOClientSubsystem;
        if (*(void *)kRIOClientSubsystem)
        {
          if (os_log_type_enabled(*(os_log_t *)kRIOClientSubsystem, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v15 = "AURemoteIO.cpp";
            __int16 v16 = 1024;
            int v17 = 2414;
            __int16 v18 = 2048;
            uint64_t v19 = v1;
            v6 = "%25s:%-5d AURemoteIO@%p: Session interrupted, iounit not running, nothing to do";
            int v7 = v9;
            os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
LABEL_17:
            _os_log_impl(&dword_21B9BB000, v7, v8, v6, buf, 0x1Cu);
          }
        }
      }
    }
  }
LABEL_27:
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
LABEL_29:
  if (v12)
  {
    if (v11) {
      atomic_fetch_add(v11, 0xFFFFFFFF);
    }
  }
}

@end