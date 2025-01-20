@interface HSTHIDEventGenerator
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (HSTHIDEventGenerator)initWithConfig:(const HSTHIDEventGeneratorConfig *)a3;
- (id).cxx_construct;
- (void)_cancelActiveContacts:(int64_t)a3;
- (void)_handleContactFrame:(id)a3;
- (void)_handleCopyEvent:(id)a3;
- (void)_handleDebugStateEvent:(id)a3;
- (void)_handleGetPropertyEvent:(id)a3;
- (void)_handleHIDEvents:(id)a3;
- (void)_handleResetEvent:(id)a3;
- (void)_handleSetPropertyEvent:(id)a3;
- (void)_handleTouchModeEvent:(id)a3;
- (void)_handleVendorEvent:(id)a3;
- (void)_handleWakeSystemEvent:(id)a3;
- (void)_logContact:(Contact *)a3 ofType:(int)a4 withFrame:(id)a5;
- (void)_saveLastTouchSystemReady:(id)a3;
- (void)handleConsume:(id)a3;
@end

@implementation HSTHIDEventGenerator

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    [(HSTHIDEventGenerator *)self _handleContactFrame:v4];
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      [(HSTHIDEventGenerator *)self _handleTouchModeEvent:v6];
    }
    else
    {
      id v8 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      if (v9)
      {
        [(HSTHIDEventGenerator *)self _handleWakeSystemEvent:v8];
      }
      else
      {
        id v10 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }

        if (v11)
        {
          [(HSTHIDEventGenerator *)self _handleResetEvent:v10];
        }
        else
        {
          v12 = HSUtil::DynamicCast<HSTGetDebugStateEvent>(v10);

          if (v12)
          {
            [(HSTHIDEventGenerator *)self _handleDebugStateEvent:v10];
          }
          else
          {
            v13 = HSUtil::DynamicCast<HSTVendorEvent>(v10);

            if (v13)
            {
              [(HSTHIDEventGenerator *)self _handleVendorEvent:v10];
            }
            else
            {
              v14 = HSUtil::DynamicCast<HSTCopyEvent>(v10);

              if (v14)
              {
                [(HSTHIDEventGenerator *)self _handleCopyEvent:v10];
              }
              else
              {
                v15 = HSUtil::DynamicCast<HSTHIDEvents>(v10);

                if (v15)
                {
                  [(HSTHIDEventGenerator *)self _handleHIDEvents:v10];
                }
                else
                {
                  v16 = HSUtil::DynamicCast<HSTSetPropertyEvent>(v10);

                  if (v16)
                  {
                    [(HSTHIDEventGenerator *)self _handleSetPropertyEvent:v10];
                  }
                  else
                  {
                    v17 = HSUtil::DynamicCast<HSTGetPropertyEvent>(v10);

                    if (v17)
                    {
                      [(HSTHIDEventGenerator *)self _handleGetPropertyEvent:v10];
                    }
                    else
                    {
                      v18.receiver = self;
                      v18.super_class = (Class)HSTHIDEventGenerator;
                      [(HSStage *)&v18 handleConsume:v10];
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_handleSetPropertyEvent:(id)a3
{
  id v4 = (char *)a3;
  id v5 = v4 + 16;
  int v6 = v4[39];
  if (v6 < 0)
  {
    if (*((void *)v4 + 3) != 13) {
      goto LABEL_15;
    }
    id v5 = (void *)*v5;
  }
  else if (v6 != 13)
  {
    goto LABEL_15;
  }
  id v7 = (void *)*v5;
  uint64_t v8 = *(void *)((char *)v5 + 5);
  if (v7 == (void *)0x45656C6261736944 && v8 == 0x73746E657645656CLL)
  {
    v12 = v4;
    id v10 = *((id *)v4 + 5);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    self->_disableEvents = [v11 BOOLValue];
    id v4 = v12;
  }
LABEL_15:
}

- (HSTHIDEventGenerator)initWithConfig:(const HSTHIDEventGeneratorConfig *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HSTHIDEventGenerator;
  id v4 = [(HSStage *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    v4->_config = *a3;
    v4->_touchMode = 1;
    uint64_t v6 = objc_opt_new();
    hidStats = v5->_hidStats;
    v5->_hidStats = (HSTHIDEventStatistics *)v6;

    uint64_t v8 = v5;
  }

  return v5;
}

- (void)_saveLastTouchSystemReady:(id)a3
{
  id v4 = a3;
  id v5 = (id *)v4[1];
  for (i = (id *)v4[2]; v5 != i; ++v5)
  {
    id v7 = *v5;
    id v8 = *v5;
    if ([v8 type] == 1
      && [v8 integerValueForField:0x10000] == (char *)&loc_FF5C + 4
      && [v8 integerValueForField:65537] == (char *)&dword_8 + 1)
    {
      objc_storeStrong((id *)&self->_lastTouchSystemReadyEvent, v7);
      id v9 = [v8 dataValueForField:65540];
      objc_super v10 = MTLoggingPlugin();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = "YES";
        if (!*v9) {
          id v11 = "NO";
        }
        *(_DWORD *)buf = 136446210;
        v13 = v11;
        _os_log_impl(&def_411C8, v10, OS_LOG_TYPE_DEFAULT, "Touch System Ready = %{public}s", buf, 0xCu);
      }
    }
  }
}

- (void)_handleHIDEvents:(id)a3
{
  id v4 = a3;
  if (!self->_disableEvents)
  {
    [(HSTHIDEventGenerator *)self _saveLastTouchSystemReady:v4];
    [(HSTHIDEventStatistics *)self->_hidStats handleHIDEvents:v4];
    v5.receiver = self;
    v5.super_class = (Class)HSTHIDEventGenerator;
    [(HSStage *)&v5 handleConsume:v4];
  }
}

- (void)_logContact:(Contact *)a3 ofType:(int)a4 withFrame:(id)a5
{
  id v8 = a5;
  uint64_t contactID = a3->contactID;
  objc_super v10 = &self->_prevUnmodifiedContacts[contactID];
  contactStateCounts = self->_contactStateCounts;
  if (__PAIR64__(v10->stage, v10->contactID) == __PAIR64__(a3->stage, contactID)
    && (v12 = &self->_prevUnmodifiedContacts[contactID], v12->finger == a3->finger)
    && v12->flags == a3->flags)
  {
    int v13 = contactStateCounts[contactID] + 1;
    contactStateCounts[contactID] = v13;
    HIDWORD(v14) = -286331153 * v13;
    LODWORD(v14) = -286331153 * v13;
    if ((v14 >> 1) <= 0x8888888)
    {
      v15 = MTLoggingPlugin();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v8 frameNumber];
        id v17 = [v8 firmwareTimestamp];
        unsigned int v18 = contactStateCounts[contactID];
        v19 = +[NSString stringWithFormat:@"HSTContact{ID:%u,Stage:%u,Finger:%u,Flags:0x%08llX}", a3->contactID, a3->stage, a3->finger, a3->flags];
        *(_DWORD *)buf = 134219010;
        id v29 = v16;
        __int16 v30 = 2048;
        double v31 = (float)((float)(uint64_t)v17 / 1000000.0);
        __int16 v32 = 1024;
        *(_DWORD *)v33 = v18;
        *(_WORD *)&v33[4] = 2114;
        *(void *)&v33[6] = v19;
        __int16 v34 = 1024;
        int v35 = a4;
        _os_log_impl(&def_411C8, v15, OS_LOG_TYPE_DEFAULT, "[F%llu @%f] Contact seen for %d frames: state %{public}@, type %u", buf, 0x2Cu);
      }
    }
  }
  else
  {
    v20 = MTLoggingPlugin();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v8 frameNumber];
      id v22 = [v8 firmwareTimestamp];
      v23 = +[NSString stringWithFormat:@"HSTContact{ID:%u,Stage:%u,Finger:%u,Flags:0x%08llX}", a3->contactID, a3->stage, a3->finger, a3->flags];
      *(_DWORD *)buf = 134219010;
      int v24 = contactStateCounts[contactID];
      id v29 = v21;
      __int16 v30 = 2048;
      double v31 = (float)((float)(uint64_t)v22 / 1000000.0);
      __int16 v32 = 2114;
      *(void *)v33 = v23;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = a4;
      __int16 v34 = 1024;
      int v35 = v24;
      _os_log_impl(&def_411C8, v20, OS_LOG_TYPE_DEFAULT, "[F%llu @%f] Contact state changed: %{public}@, type %u, previous state count %d", buf, 0x2Cu);
    }
    contactStateCounts[contactID] = 1;
  }
  long long v25 = *(_OWORD *)&a3->contactID;
  long long v26 = *(_OWORD *)&a3->position.x;
  long long v27 = *(_OWORD *)&a3->azimuth;
  *(_OWORD *)&v10->velocity.y = *(_OWORD *)&a3->velocity.y;
  *(_OWORD *)&v10->azimuth = v27;
  *(_OWORD *)&v10->uint64_t contactID = v25;
  *(_OWORD *)&v10->position.x = v26;
}

- (void)_handleContactFrame:(id)a3
{
  v122 = (unsigned __int8 *)a3;
  HSUtil::MachTimeFromNanoseconds((HSUtil *)[v122 hsTimestamp]);
  if (!v122[120]) {
    goto LABEL_19;
  }
  int v3 = v122[113];
  if (v3 == 10)
  {
    if ((self->_touchMode & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_10;
  }
  if (v3 == 9)
  {
    if ((self->_touchMode & 0x100) == 0) {
      goto LABEL_8;
    }
LABEL_10:
    int v4 = 1;
    objc_super v5 = "enabled";
    goto LABEL_11;
  }
  if (v3 == 8 && (self->_touchMode & 0x80) != 0) {
    goto LABEL_10;
  }
LABEL_8:
  int v4 = 2;
  objc_super v5 = "disabled";
LABEL_11:
  uint64_t v6 = MTLoggingPlugin();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *((_DWORD *)v122 + 29);
    buf[0] = 67109376;
    buf[1] = v3;
    LOWORD(buf[2]) = 1024;
    *(_DWORD *)((char *)&buf[2] + 2) = v7;
    _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "Tritium3 frame received: wake reason 0x%02X, gesture recognition time %d ms", (uint8_t *)buf, 0xEu);
  }

  id v8 = (unsigned __int8 *)*((void *)v122 + 6);
  for (i = (unsigned __int8 *)*((void *)v122 + 7); v8 != i; v8 += 64)
  {
    if (v8[1] - 1 <= 3)
    {
      objc_super v10 = MTLoggingPlugin();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *v8;
        buf[0] = 67109378;
        buf[1] = v11;
        LOWORD(buf[2]) = 2082;
        *(void *)((char *)&buf[2] + 2) = v5;
        _os_log_impl(&def_411C8, v10, OS_LOG_TYPE_DEFAULT, "Contact %u is a tritium3 contact, setting contact type to tritium3 %{public}s", (uint8_t *)buf, 0x12u);
      }

      self->_contactTypes[*v8] = v4;
    }
  }
LABEL_19:
  long long v131 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v126 = 0u;
  memset(buf, 0, sizeof(buf));
  unint64_t v12 = *((void *)v122 + 7);
  if (*((void *)v122 + 6) >= v12)
  {
    uint64_t v119 = 0;
    uint64_t v75 = 0;
    unsigned int v74 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    int v116 = 0;
    uint64_t v118 = 0;
    uint64_t v119 = 0;
    uint64_t v117 = 0;
    unint64_t v114 = v12 - 64;
    unint64_t v14 = self;
    do
    {
      id v16 = (unsigned __int8 *)(v12 + v13 - 64);
      unint64_t v15 = *v16;
      if (v15 >= 0x20) {
        __assert_rtn("-[HSTHIDEventGenerator _handleContactFrame:]", "HSTHIDEventGenerator.mm", 332, "c.contactID < Contact::MaxContactCount");
      }
      contactTypes = v14->_contactTypes;
      [(HSTHIDEventGenerator *)v14 _logContact:v12 + v13 - 64 ofType:v14->_contactTypes[v15] withFrame:v122];
      unsigned int v18 = v14;
      contacts = v14->_contacts;
      v20 = &contacts[v15];
      if ((v18->_touchMode & 1) == 0 && contactTypes[v15] != 1)
      {
        if (v20->contactID || (id v21 = &contacts[v15], v21->stage) || v21->finger || contacts[v15].flags)
        {
          id v22 = MTLoggingPlugin();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int v23 = *v16;
            *(_DWORD *)v132 = 67109120;
            *(_DWORD *)&v132[4] = v23;
            _os_log_impl(&def_411C8, v22, OS_LOG_TYPE_DEFAULT, "Contact %u is not tritium3 enabled and the screen is off, setting stage to NotTracking", v132, 8u);
          }
        }
        *(unsigned char *)(v12 + v13 - 63) = 0;
      }
      uint64_t v120 = v12 + v13;
      if (*(unsigned __int8 *)(v12 + v13 - 62) - 1 >= 5)
      {
        if (v20->contactID || (int v24 = &contacts[v15], v24->stage) || v24->finger || contacts[v15].flags)
        {
          long long v25 = MTLoggingPlugin();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = *v16;
            int v27 = *(unsigned __int8 *)(v120 - 62);
            *(_DWORD *)v132 = 67109376;
            *(_DWORD *)&v132[4] = v26;
            LOWORD(v133) = 1024;
            *(_DWORD *)((char *)&v133 + 2) = v27;
            _os_log_impl(&def_411C8, v25, OS_LOG_TYPE_DEFAULT, "Contact %u has an invalid finger id (%d), setting stage to NotTracking", v132, 0xEu);
          }
        }
        *(unsigned char *)(v12 + v13 - 63) = 0;
      }
      v28 = &contacts[v15];
      int stage = v28->stage;
      p_int stage = &v28->stage;
      int v29 = stage;
      unsigned __int8 v32 = stage - 1;
      if ((stage - 1) >= 4u && *(unsigned __int8 *)(v12 + v13 - 63) - 1 > 3
        || contactTypes[v15] == 2)
      {
        if (v20->contactID | v29 || (v33 = &contacts[v15], v33->finger) || v33->flags)
        {
          __int16 v34 = MTLoggingPlugin();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            int v35 = "cType == Tritium3DisabledContact";
            if (*p_stage - 1 >= 4)
            {
              int v35 = "cType == Tritium3DisabledContact";
              if ((*(unsigned char *)(v12 + v13 - 63) - 5) < 0xFCu) {
                int v35 = "!inRange -> !inRange";
              }
            }
            int v36 = *v16;
            *(_DWORD *)v132 = 67109378;
            *(_DWORD *)&v132[4] = v36;
            LOWORD(v133) = 2082;
            *(void *)((char *)&v133 + 2) = v35;
            _os_log_impl(&def_411C8, v34, OS_LOG_TYPE_DEFAULT, "Erasing contact %u, reason: %{public}s", v132, 0x12u);
          }
        }
        int v37 = 0;
        *(_DWORD *)&v20->uint64_t contactID = 0;
        v20->int flags = 0;
        v20->position = 0;
        v20->needsVelocitiesCalculated = 0;
        *(_OWORD *)&v20->velocity.int x = 0u;
        *(_OWORD *)&v20->minorRadius = 0u;
        v20->tilt = 0.0;
        if (*(unsigned __int8 *)(v12 + v13 - 63) - 1 <= 3) {
          int v37 = contactTypes[v15];
        }
        contactTypes[v15] = v37;
        unint64_t v14 = self;
        uint64_t v38 = *((void *)v122 + 7);
        uint64_t v39 = v38 - (v12 + v13);
        if (v38 != v12 + v13) {
          memmove((void *)(v114 + v13), (const void *)(v12 + v13), v38 - (v12 + v13));
        }
        *((void *)v122 + 7) = v114 + v13 + v39;
      }
      else
      {
        uint64_t v115 = v12 + v13;
        int v40 = *(unsigned __int8 *)(v12 + v13 - 63);
        if ((v29 - 3) < 2 != (v40 - 3) < 2) {
          unsigned int v41 = (v32 < 4u) ^ ((v40 - 1) < 4) | 2;
        }
        else {
          unsigned int v41 = (v32 < 4u) ^ ((v40 - 1) < 4);
        }
        if (v32 <= 3u && v40 == 0)
        {
          v43 = MTLoggingPlugin();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            int v44 = *v16;
            *(_DWORD *)v132 = 67109120;
            *(_DWORD *)&v132[4] = v44;
            _os_log_impl(&def_411C8, v43, OS_LOG_TYPE_DEFAULT, "Contact %u transitioned from inRange -> NotTracking, canceling contact", v132, 8u);
          }

          v41 |= 0x80u;
          unsigned __int8 v32 = *p_stage - 1;
        }
        if (v32 <= 3u)
        {
          int v45 = eventFlagsFromContact(&contacts[v15]);
          int v46 = eventFlagsFromContact((const Contact *)(v12 + v13 - 64));
          v47 = &contacts[v15];
          int flags = v47->flags;
          uint64_t v49 = v12 + v13;
          if (v47->finger == *(unsigned __int8 *)(v120 - 62)) {
            int v50 = v41;
          }
          else {
            int v50 = v41 | 0x20;
          }
          int x = v47->position.x;
          int y = v47->position.y;
          int v54 = *(_DWORD *)(v49 - 48);
          int v53 = *(_DWORD *)(v49 - 44);
          if (x == v54 && y == v53) {
            int v56 = v50;
          }
          else {
            int v56 = v50 | 4;
          }
          uint64_t v57 = ((unsigned __int16)*(_DWORD *)(v12 + v13 - 56) ^ (unsigned __int16)flags) & 0x4000;
          if (v45 == v46 && v57 == 0) {
            unsigned int v41 = v56;
          }
          else {
            unsigned int v41 = v56 | 0x40;
          }
        }
        unint64_t v14 = self;
        uint64_t v59 = *v16;
        buf[v59] = v41;
        int v60 = *(unsigned __int8 *)(v115 - 63);
        uint64_t v61 = v118;
        if ((v60 - 3) < 2) {
          uint64_t v61 = v118 + 1;
        }
        uint64_t v62 = v119;
        if ((v60 - 1) < 4) {
          uint64_t v62 = v119 + 1;
        }
        uint64_t v118 = v61;
        uint64_t v119 = v62;
        if ((v60 - 1) >= 4)
        {
          int v70 = 0;
          unsigned __int8 v68 = 0;
          unint64_t v66 = 0;
          unsigned __int8 v64 = 0;
          unsigned __int8 v63 = 0;
          LOBYTE(v60) = 0;
          LOBYTE(v59) = 0;
          long long v71 = 0uLL;
          Position v67 = 0;
          long long v69 = 0uLL;
          int v65 = v113;
        }
        else
        {
          unsigned __int8 v63 = *(unsigned char *)(v120 - 62);
          unsigned __int8 v64 = *(unsigned char *)(v12 + v13 - 61);
          int v65 = *(_DWORD *)(v12 + v13 - 60);
          unint64_t v66 = *(void *)(v12 + v13 - 56);
          Position v67 = *(Position *)(v12 + v13 - 48);
          unsigned __int8 v68 = *(unsigned char *)(v12 + v13 - 40);
          *(_WORD *)v132 = *(_WORD *)(v12 + v13 - 39);
          v132[2] = *(unsigned char *)(v12 + v13 - 37);
          long long v69 = *(_OWORD *)(v12 + v13 - 36);
          int v70 = *(_DWORD *)(v12 + v13 - 20);
          long long v71 = *(_OWORD *)(v12 + v13 - 16);
        }
        v20->uint64_t contactID = v59;
        v20->int stage = v60;
        v20->finger = v63;
        v20->hand = v64;
        *(_DWORD *)(&v20->hand + 1) = v65;
        v20->int flags = v66;
        v20->position = v67;
        v20->needsVelocitiesCalculated = v68;
        *(_WORD *)(&v20->needsVelocitiesCalculated + 1) = *(_WORD *)v132;
        *(&v20->needsVelocitiesCalculated + 3) = v132[2];
        *(_OWORD *)&v20->velocity.int x = v69;
        v20->minorRadius = v70;
        *(_OWORD *)&v20->azimuth = v71;
        int v113 = v65;
        if (*(unsigned __int8 *)(v115 - 63) - 1 > 3) {
          int v72 = 0;
        }
        else {
          int v72 = contactTypes[v15];
        }
        v116 |= v41;
        v117 += v41 >> 7;
        contactTypes[v15] = v72;
      }
      unint64_t v73 = *((void *)v122 + 6);
      v13 -= 64;
    }
    while (v73 < v12 + v13);
    unsigned int v74 = v116 & 0xFFFFFF7F;
    if (v117) {
      v74 |= (v117 == (uint64_t)(*((void *)v122 + 7) - v73) >> 6) << 7;
    }
    uint64_t v75 = v118;
  }
  int v76 = v122[120];
  if (LOBYTE(self->_frameMetadata.tritium.var0.__val_.initialToCurrentFrameDeltaMs)) {
    BOOL v77 = v76 == 0;
  }
  else {
    BOOL v77 = 1;
  }
  if (v77) {
    int v78 = (LOBYTE(self->_frameMetadata.tritium.var0.__val_.initialToCurrentFrameDeltaMs) != 0) ^ (v76 != 0);
  }
  else {
    int v78 = std::operator!=[abi:ne180100]<HSTContactFrameMetadata::Tritium3,HSTContactFrameMetadata::Tritium3>((unsigned __int8 *)&self->_frameMetadata.tritium, v122 + 112);
  }
  if (v78) {
    int v79 = 64;
  }
  else {
    int v79 = 0;
  }
  int v80 = v79 | v74;
  long long v81 = *(_OWORD *)(v122 + 72);
  $7956CE2E3F0166C410E1356377E383A3 v82 = *($7956CE2E3F0166C410E1356377E383A3 *)(v122 + 88);
  long long v83 = *(_OWORD *)(v122 + 104);
  *(optional<HSTContactFrameMetadata::Tritium3> *)((char *)&self->_frameMetadata.tritium + 4) = *(optional<HSTContactFrameMetadata::Tritium3> *)(v122 + 116);
  self->_frameMetadata.image.var0 = v82;
  *(_OWORD *)&self->_frameMetadata.image.__engaged_ = v83;
  *(_OWORD *)&self->_frameMetadata.surfaceSize.var0.__null_state_ = v81;
  v84 = (Contact *)*((void *)v122 + 6);
  v85 = (Contact *)*((void *)v122 + 7);
  if (v84 == v85 || v80 == 0)
  {
    uint64_t v87 = 0;
  }
  else
  {
    if (v119)
    {
      uint64_t v88 = v85 - v84;
    }
    else
    {
      v84 = self->_contacts;
      uint64_t v88 = 32;
    }
    getAveragePositionFromContacts(v84, v88);
    *(void *)v132 = 0xAAAAAAAAAAAAAAAALL;
    LODWORD(zdensity) = v75 != 0;
    HIDWORD(zdensity) = 3;
    *(void *)v132 = IOHIDEventCreateDigitizerEvent();
    v90 = (const Contact *)*((void *)v122 + 6);
    for (j = (const Contact *)*((void *)v122 + 7); v90 != j; ++v90)
    {
      eventFlagsFromContact(v90);
      uint64_t v112 = 0;
      zdensitint y = v90->zdensity;
      DigitizerFingerEventWithQualitint y = (void *)IOHIDEventCreateDigitizerFingerEventWithQuality();
      IOHIDEventSetPhase();
      IOHIDEventAppendEvent();
    }
    IOHIDEventSetIntegerValue();
    if (v122[120])
    {
      unsigned __int8 v124 = v122[113];
      VendorDefinedEvent = (void *)IOHIDEventCreateVendorDefinedEvent();
      IOHIDEventSetPhase();
      IOHIDEventAppendEvent();
    }
    uint64_t v87 = objc_opt_new();
    std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100]((char **)(v87 + 8), (id *)v132);
  }
  v93 = self;
  if ((*((_DWORD *)v122 + 10) & 1) != self->_largeBodyActive)
  {
    self->_largeBodyActive = *((_DWORD *)v122 + 10) & 1;
    if (!v87) {
      uint64_t v87 = objc_opt_new();
    }
    uint64_t ProximtyEvent = IOHIDEventCreateProximtyEvent();
    v95 = (uint64_t **)(v87 + 8);
    v96 = *(uint64_t **)(v87 + 16);
    unint64_t v97 = *(void *)(v87 + 24);
    if ((unint64_t)v96 >= v97)
    {
      uint64_t v99 = v96 - *v95;
      if ((unint64_t)(v99 + 1) >> 61) {
        std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v100 = v97 - (void)*v95;
      uint64_t v101 = v100 >> 2;
      if (v100 >> 2 <= (unint64_t)(v99 + 1)) {
        uint64_t v101 = v99 + 1;
      }
      if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v102 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v102 = v101;
      }
      uint64_t v135 = v87 + 24;
      if (v102) {
        v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSUtil::CoderKey const*>>(v87 + 24, v102);
      }
      else {
        v103 = 0;
      }
      v104 = (uint64_t *)&v103[8 * v99];
      v105 = &v103[8 * v102];
      v134 = v105;
      uint64_t *v104 = ProximtyEvent;
      v98 = v104 + 1;
      *((void *)&v133 + 1) = v104 + 1;
      v107 = *v95;
      v106 = *(uint64_t **)(v87 + 16);
      if (v106 == *v95)
      {
        v109 = *(uint64_t **)(v87 + 16);
      }
      else
      {
        do
        {
          uint64_t v108 = *--v106;
          uint64_t *v106 = 0;
          *--v104 = v108;
        }
        while (v106 != v107);
        v109 = *v95;
        v106 = *(uint64_t **)(v87 + 16);
        v98 = (void *)*((void *)&v133 + 1);
        v105 = v134;
      }
      *v95 = v104;
      *(void *)&long long v133 = v109;
      *(void *)(v87 + 16) = v98;
      *((void *)&v133 + 1) = v106;
      v110 = *(char **)(v87 + 24);
      *(void *)(v87 + 24) = v105;
      v134 = v110;
      *(void *)v132 = v109;
      std::__split_buffer<HIDEvent * {__strong}>::~__split_buffer((uint64_t)v132);
    }
    else
    {
      uint64_t *v96 = ProximtyEvent;
      v98 = v96 + 1;
    }
    *(void *)(v87 + 16) = v98;
    v93 = self;
  }
  v123.receiver = v93;
  v123.super_class = (Class)HSTHIDEventGenerator;
  -[HSStage handleConsume:](&v123, "handleConsume:", v122, *(void *)&zdensity, v112);
  if (v87) {
    [(HSTHIDEventGenerator *)v93 _handleHIDEvents:v87];
  }
}

- (void)_handleWakeSystemEvent:(id)a3
{
  int v4 = a3;
  if (!v4)
  {
    unsigned __int8 v63 = +[NSAssertionHandler currentHandler];
    unsigned __int8 v64 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[HSTHIDEventGenerator _handleWakeSystemEvent:]");
    [v63 handleFailureInFunction:v64, @"HSTHIDEventGenerator.mm", 546, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  v66.receiver = self;
  v66.super_class = (Class)HSTHIDEventGenerator;
  [(HSStage *)&v66 handleConsume:v4];
  HSUtil::MachTimeFromNanoseconds((HSUtil *)[v4 hsTimestamp]);
  objc_super v5 = objc_opt_new();
  if (v4[24])
  {
    int v6 = (self->_touchMode >> 4) & 1;
    int v7 = v4[29];
    if (!v4[29]) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v4[29])
  {
    int v6 = 0;
LABEL_8:
    int v7 = (self->_touchMode >> 5) & 1;
    goto LABEL_9;
  }
  if (!v4[40] && !v4[52])
  {
    if ((self->_touchMode & 0x10) != 0)
    {
      uint64_t MotionGestureEvent = IOHIDEventCreateMotionGestureEvent();
      id v22 = (uint64_t **)(v5 + 1);
      int v23 = (uint64_t *)v5[2];
      unint64_t v54 = v5[3];
      if ((unint64_t)v23 < v54) {
        goto LABEL_27;
      }
      uint64_t v55 = v23 - *v22;
      if ((unint64_t)(v55 + 1) >> 61) {
        std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v56 = v54 - (void)*v22;
      uint64_t v57 = v56 >> 2;
      if (v56 >> 2 <= (unint64_t)(v55 + 1)) {
        uint64_t v57 = v55 + 1;
      }
      if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v58 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v58 = v57;
      }
      long long v71 = v5 + 3;
      if (v58) {
        uint64_t v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSUtil::CoderKey const*>>((uint64_t)(v5 + 3), v58);
      }
      else {
        uint64_t v59 = 0;
      }
      __int16 v34 = (uint64_t *)&v59[8 * v55];
      int v35 = &v59[8 * v58];
      int v70 = v35;
      *__int16 v34 = MotionGestureEvent;
      long long v25 = v34 + 1;
      long long v69 = v34 + 1;
      int v60 = *v22;
      int v36 = (uint64_t *)v5[2];
      if (v36 != *v22)
      {
        do
        {
          uint64_t v61 = *--v36;
          *int v36 = 0;
          *--__int16 v34 = v61;
        }
        while (v36 != v60);
        goto LABEL_45;
      }
LABEL_79:
      uint64_t v39 = v36;
      goto LABEL_80;
    }
    goto LABEL_82;
  }
  int v6 = 0;
  int v7 = 0;
LABEL_9:
  if (v4[40]) {
    int v8 = (self->_touchMode >> 6) & 1;
  }
  else {
    int v8 = 0;
  }
  if (v4[52])
  {
    int v9 = (self->_touchMode >> 11) & 1;
    if (v7) {
      goto LABEL_26;
    }
  }
  else
  {
    int v9 = 0;
    if (v7)
    {
LABEL_26:
      uint64_t MotionGestureEvent = IOHIDEventCreateNavigationSwipeEvent();
      id v22 = (uint64_t **)(v5 + 1);
      int v23 = (uint64_t *)v5[2];
      unint64_t v24 = v5[3];
      if ((unint64_t)v23 < v24)
      {
LABEL_27:
        uint64_t *v23 = MotionGestureEvent;
        long long v25 = v23 + 1;
LABEL_81:
        v22[1] = v25;
        goto LABEL_82;
      }
      uint64_t v29 = v23 - *v22;
      if ((unint64_t)(v29 + 1) >> 61) {
        std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v30 = v24 - (void)*v22;
      uint64_t v31 = v30 >> 2;
      if (v30 >> 2 <= (unint64_t)(v29 + 1)) {
        uint64_t v31 = v29 + 1;
      }
      if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v32 = v31;
      }
      long long v71 = v5 + 3;
      if (v32) {
        v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSUtil::CoderKey const*>>((uint64_t)(v5 + 3), v32);
      }
      else {
        v33 = 0;
      }
      __int16 v34 = (uint64_t *)&v33[8 * v29];
      int v35 = &v33[8 * v32];
      int v70 = v35;
      *__int16 v34 = MotionGestureEvent;
      long long v25 = v34 + 1;
      long long v69 = v34 + 1;
      int v37 = *v22;
      int v36 = (uint64_t *)v5[2];
      if (v36 != *v22)
      {
        do
        {
          uint64_t v38 = *--v36;
          *int v36 = 0;
          *--__int16 v34 = v38;
        }
        while (v36 != v37);
LABEL_45:
        uint64_t v39 = *v22;
        int v36 = v22[1];
        long long v25 = v69;
        int v35 = v70;
LABEL_80:
        *id v22 = v34;
        unsigned __int8 v68 = v39;
        v22[1] = v25;
        long long v69 = v36;
        uint64_t v62 = v22[2];
        v22[2] = (uint64_t *)v35;
        int v70 = (char *)v62;
        Position v67 = v39;
        std::__split_buffer<HIDEvent * {__strong}>::~__split_buffer((uint64_t)&v67);
        goto LABEL_81;
      }
      goto LABEL_79;
    }
  }
  if (v6)
  {
    objc_super v10 = (void *)IOHIDEventCreateMotionGestureEvent();
    uint64_t v65 = 0;
    DigitizerEvent = (void *)IOHIDEventCreateDigitizerEvent();
    IOHIDEventAppendEvent();
    unint64_t v12 = (char **)(v5 + 1);
    id v13 = v10;
    unint64_t v14 = (char *)v5[2];
    unint64_t v15 = v5[3];
    if ((unint64_t)v14 >= v15)
    {
      uint64_t v16 = (v14 - *v12) >> 3;
      if ((unint64_t)(v16 + 1) >> 61) {
        std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v17 = v15 - (void)*v12;
      uint64_t v18 = v17 >> 2;
      if (v17 >> 2 <= (unint64_t)(v16 + 1)) {
        uint64_t v18 = v16 + 1;
      }
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v19 = v18;
      }
      long long v71 = v5 + 3;
      if (v19) {
        v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSUtil::CoderKey const*>>((uint64_t)(v5 + 3), v19);
      }
      else {
        v20 = 0;
      }
      int v45 = &v20[8 * v16];
      int v46 = &v20[8 * v19];
      int v70 = v46;
      *(void *)int v45 = v13;
      v28 = v45 + 8;
      long long v69 = (uint64_t *)(v45 + 8);
      v48 = *v12;
      v47 = (char *)v5[2];
      if (v47 != *v12)
      {
        do
        {
          uint64_t v49 = *((void *)v47 - 1);
          v47 -= 8;
          *(void *)v47 = 0;
          *((void *)v45 - 1) = v49;
          v45 -= 8;
        }
        while (v47 != v48);
LABEL_61:
        v52 = *v12;
        v47 = v12[1];
        v28 = (char *)v69;
        int v46 = v70;
LABEL_63:
        Contact *v12 = v45;
        unsigned __int8 v68 = (uint64_t *)v52;
        v12[1] = v28;
        long long v69 = (uint64_t *)v47;
        int v53 = v12[2];
        v12[2] = v46;
        int v70 = v53;
        Position v67 = (uint64_t *)v52;
        std::__split_buffer<HIDEvent * {__strong}>::~__split_buffer((uint64_t)&v67);
        goto LABEL_64;
      }
      goto LABEL_62;
    }
    goto LABEL_30;
  }
  if ((v8 | v9) == 1)
  {
    int v26 = (void *)IOHIDEventCreateMotionGestureEvent();
    uint64_t v65 = 0;
    DigitizerEvent = (void *)IOHIDEventCreateDigitizerEvent();
    IOHIDEventAppendEvent();
    unint64_t v12 = (char **)(v5 + 1);
    id v13 = v26;
    unint64_t v14 = (char *)v5[2];
    unint64_t v27 = v5[3];
    if ((unint64_t)v14 >= v27)
    {
      uint64_t v40 = (v14 - *v12) >> 3;
      if ((unint64_t)(v40 + 1) >> 61) {
        std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v41 = v27 - (void)*v12;
      uint64_t v42 = v41 >> 2;
      if (v41 >> 2 <= (unint64_t)(v40 + 1)) {
        uint64_t v42 = v40 + 1;
      }
      if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v43 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v43 = v42;
      }
      long long v71 = v5 + 3;
      if (v43) {
        int v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSUtil::CoderKey const*>>((uint64_t)(v5 + 3), v43);
      }
      else {
        int v44 = 0;
      }
      int v45 = &v44[8 * v40];
      int v46 = &v44[8 * v43];
      int v70 = v46;
      *(void *)int v45 = v13;
      v28 = v45 + 8;
      long long v69 = (uint64_t *)(v45 + 8);
      int v50 = *v12;
      v47 = (char *)v5[2];
      if (v47 != *v12)
      {
        do
        {
          uint64_t v51 = *((void *)v47 - 1);
          v47 -= 8;
          *(void *)v47 = 0;
          *((void *)v45 - 1) = v51;
          v45 -= 8;
        }
        while (v47 != v50);
        goto LABEL_61;
      }
LABEL_62:
      v52 = v47;
      goto LABEL_63;
    }
LABEL_30:
    *(void *)unint64_t v14 = v13;
    v28 = v14 + 8;
LABEL_64:
    v12[1] = v28;
  }
LABEL_82:
  -[HSTHIDEventGenerator _handleHIDEvents:](self, "_handleHIDEvents:", v5, v65);
}

- (void)_handleDebugStateEvent:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int v7 = +[NSAssertionHandler currentHandler];
    int v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[HSTHIDEventGenerator _handleDebugStateEvent:]");
    [v7 handleFailureInFunction:v8, @"HSTHIDEventGenerator.mm", 608, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  *((unsigned char *)v4 + 16) = 1;
  v9[0] = @"Stage";
  v9[1] = @"Generation Stats";
  v10[0] = @"HIDEventGenerator";
  objc_super v5 = [(HSTHIDEventStatistics *)self->_hidStats stats];
  v10[1] = v5;
  int v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  [*((id *)v4 + 3) addObject:v6];
}

- (void)_cancelActiveContacts:(int64_t)a3
{
  objc_super v5 = (void **)objc_opt_new();
  [v5 hsSetTimestamp:a3];
  uint64_t v6 = 0;
  uint64_t v31 = self;
  contacts = self->_contacts;
  do
  {
    int v8 = &contacts[v6];
    int contactID = v8->contactID;
    int stage = v8->stage;
    long long v11 = *(_OWORD *)((char *)&v8->position.x + 2);
    long long v34 = *(_OWORD *)&v8->finger;
    long long v35 = v11;
    v36[0] = *(_OWORD *)((char *)&v8->velocity.y + 2);
    *(_OWORD *)((char *)v36 + 14) = *(_OWORD *)&v8->azimuth;
    if ((stage - 1) <= 3)
    {
      unint64_t v12 = MTLoggingPlugin();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v33 = contactID;
        _os_log_impl(&def_411C8, v12, OS_LOG_TYPE_DEFAULT, "Canceling contact %u, setting stage to NotTracking", buf, 8u);
      }

      id v13 = v5 + 6;
      unint64_t v14 = (char *)v5[7];
      unint64_t v15 = (char *)v5[8];
      if (v14 >= v15)
      {
        uint64_t v18 = (v14 - (unsigned char *)*v13) >> 6;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 58) {
          std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v20 = v15 - (unsigned char *)*v13;
        if (v20 >> 5 > v19) {
          unint64_t v19 = v20 >> 5;
        }
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFC0) {
          unint64_t v21 = 0x3FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v19;
        }
        if (v21) {
          id v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSTPipeline::Contact>>((uint64_t)(v5 + 8), v21);
        }
        else {
          id v22 = 0;
        }
        int v23 = &v22[64 * v18];
        char *v23 = contactID;
        v23[1] = 0;
        long long v24 = v35;
        *(_OWORD *)(v23 + 2) = v34;
        *(_OWORD *)(v23 + 18) = v24;
        *(_OWORD *)(v23 + 34) = v36[0];
        *((_OWORD *)v23 + 3) = *(_OWORD *)((char *)v36 + 14);
        int v26 = (char *)*v13;
        long long v25 = (char *)v5[7];
        unint64_t v27 = v23;
        if (v25 != *v13)
        {
          do
          {
            long long v28 = *((_OWORD *)v25 - 4);
            long long v29 = *((_OWORD *)v25 - 3);
            long long v30 = *((_OWORD *)v25 - 1);
            *((_OWORD *)v27 - 2) = *((_OWORD *)v25 - 2);
            *((_OWORD *)v27 - 1) = v30;
            *((_OWORD *)v27 - 4) = v28;
            *((_OWORD *)v27 - 3) = v29;
            v27 -= 64;
            v25 -= 64;
          }
          while (v25 != v26);
          long long v25 = (char *)*v13;
        }
        uint64_t v17 = v23 + 64;
        const char *v13 = v27;
        v5[7] = v23 + 64;
        v5[8] = &v22[64 * v21];
        if (v25) {
          operator delete(v25);
        }
      }
      else
      {
        char *v14 = contactID;
        v14[1] = 0;
        long long v16 = v35;
        *(_OWORD *)(v14 + 2) = v34;
        *(_OWORD *)(v14 + 18) = v16;
        *(_OWORD *)(v14 + 34) = v36[0];
        *((_OWORD *)v14 + 3) = *(_OWORD *)((char *)v36 + 14);
        uint64_t v17 = v14 + 64;
      }
      v5[7] = v17;
    }
    ++v6;
  }
  while (v6 != 32);
  if (v5[6] != v5[7]) {
    [(HSTHIDEventGenerator *)v31 _handleContactFrame:v5];
  }
}

- (void)_handleResetEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HSTHIDEventGenerator;
  [(HSStage *)&v7 handleConsume:v4];
  objc_super v5 = MTLoggingPlugin();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEFAULT, "Reset event received, canceling active contacts", v6, 2u);
  }

  -[HSTHIDEventGenerator _cancelActiveContacts:](self, "_cancelActiveContacts:", [v4 hsTimestamp]);
}

- (void)_handleTouchModeEvent:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HSTHIDEventGenerator;
  [(HSStage *)&v6 handleConsume:v4];
  unsigned __int16 v5 = (unsigned __int16)[v4 touchMode];
  self->_touchMode = v5;
  if ((v5 & 1) == 0) {
    -[HSTHIDEventGenerator _cancelActiveContacts:](self, "_cancelActiveContacts:", [v4 hsTimestamp]);
  }
}

- (void)_handleVendorEvent:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    long long v25 = +[NSAssertionHandler currentHandler];
    int v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[HSTHIDEventGenerator _handleVendorEvent:]");
    [v25 handleFailureInFunction:v26, @"HSTHIDEventGenerator.mm", 662, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)HSTHIDEventGenerator;
  [(HSStage *)&v27 handleConsume:v4];
  HSUtil::MachTimeFromNanoseconds((HSUtil *)[v4 hsTimestamp]);
  unsigned __int16 v5 = objc_opt_new();
  [v4 type];
  id v6 = [v4 data];
  [v6 bytes];
  objc_super v7 = [v4 data];
  [v7 length];
  uint64_t VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
  int v9 = (uint64_t **)(v5 + 1);
  unint64_t v10 = v5[3];
  long long v11 = (uint64_t *)v5[2];
  if ((unint64_t)v11 >= v10)
  {
    uint64_t v13 = v11 - *v9;
    if ((unint64_t)(v13 + 1) >> 61) {
      std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v10 - (void)*v9;
    uint64_t v15 = v14 >> 2;
    if (v14 >> 2 <= (unint64_t)(v13 + 1)) {
      uint64_t v15 = v13 + 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    uint64_t v31 = v5 + 3;
    if (v16) {
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSUtil::CoderKey const*>>((uint64_t)(v5 + 3), v16);
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = (uint64_t *)&v17[8 * v13];
    unint64_t v19 = &v17[8 * v16];
    long long v30 = v19;
    *uint64_t v18 = VendorDefinedEvent;
    unint64_t v12 = v18 + 1;
    long long v29 = v18 + 1;
    unint64_t v21 = *v9;
    uint64_t v20 = (uint64_t *)v5[2];
    if (v20 == *v9)
    {
      int v23 = (uint64_t *)v5[2];
    }
    else
    {
      do
      {
        uint64_t v22 = *--v20;
        uint64_t *v20 = 0;
        *--uint64_t v18 = v22;
      }
      while (v20 != v21);
      int v23 = *v9;
      uint64_t v20 = (uint64_t *)v5[2];
      unint64_t v12 = v29;
      unint64_t v19 = v30;
    }
    *int v9 = v18;
    v28[1] = v23;
    v5[2] = v12;
    long long v29 = v20;
    long long v24 = (char *)v5[3];
    v5[3] = v19;
    long long v30 = v24;
    v28[0] = v23;
    std::__split_buffer<HIDEvent * {__strong}>::~__split_buffer((uint64_t)v28);
  }
  else
  {
    *long long v11 = VendorDefinedEvent;
    unint64_t v12 = v11 + 1;
  }
  v5[2] = v12;

  [(HSTHIDEventGenerator *)self _handleHIDEvents:v5];
}

- (void)_handleCopyEvent:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    long long v11 = +[NSAssertionHandler currentHandler];
    unint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[HSTHIDEventGenerator _handleCopyEvent:]");
    [v11 handleFailureInFunction:v12, @"HSTHIDEventGenerator.mm", 677, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HSTHIDEventGenerator;
  [(HSStage *)&v13 handleConsume:v4];
  unsigned __int16 v5 = [v4 matching];
  int IntegerValue = IOHIDEventGetIntegerValue();

  objc_super v7 = [v4 matching];
  int v8 = IOHIDEventGetIntegerValue();

  if ([v4 type] == 1 && IntegerValue == 65376 && v8 == 9)
  {
    [v4 setResult:self->_lastTouchSystemReadyEvent];
  }
  else
  {
    int v9 = MTLoggingPlugin();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v10 = [v4 type];
      *(_DWORD *)buf = 67109632;
      unsigned int v15 = v10;
      __int16 v16 = 1024;
      int v17 = IntegerValue;
      __int16 v18 = 1024;
      int v19 = v8;
      _os_log_debug_impl(&def_411C8, v9, OS_LOG_TYPE_DEBUG, "Unsuported copyEvent match event: type=%x, usagePage=%x, usage=%x", buf, 0x14u);
    }
  }
}

- (void)_handleGetPropertyEvent:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = v4 + 2;
  int v6 = *((char *)v4 + 39);
  if (v6 < 0)
  {
    if (v4[3] != 13) {
      goto LABEL_12;
    }
    unsigned __int16 v5 = (void *)*v5;
  }
  else if (v6 != 13)
  {
    goto LABEL_12;
  }
  objc_super v7 = (void *)*v5;
  uint64_t v8 = *(void *)((char *)v5 + 5);
  if (v7 == (void *)0x45656C6261736944 && v8 == 0x73746E657645656CLL)
  {
    unint64_t v12 = v4;
    uint64_t v10 = +[NSNumber numberWithBool:self->_disableEvents];
    long long v11 = (void *)v12[5];
    v12[5] = v10;

    id v4 = v12;
  }
LABEL_12:
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  HSUtil::Encoder::encodeCodable<HSTHIDEventGeneratorConfig>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)102,(char)105,(char)103>::Key, &self->_config);
  HSUtil::Encoder::encodeCodable<HSTContactFrameMetadata>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)102,(char)114,(char)97,(char)109,(char)101,(char)77,(char)101,(char)116,(char)97,(char)100,(char)97,(char)116,(char)97>::Key, &self->_frameMetadata);
  HSUtil::Encoder::encodeBool((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)108,(char)97,(char)114,(char)103,(char)101,(char)66,(char)111,(char)100,(char)121,(char)65,(char)99,(char)116,(char)105,(char)118,(char)101>::Key, self->_largeBodyActive);
  HSUtil::Encoder::encodeBool((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)100,(char)105,(char)115,(char)97,(char)98,(char)108,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116,(char)115>::Key, self->_disableEvents);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)77,(char)111,(char)100,(char)101>::Key, self->_touchMode);
  HSUtil::Encoder::encodeArrayStart((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)115>::Key, 4u);
  uint64_t v5 = 0;
  contacts = self->_contacts;
  int v7 = *(_DWORD *)a3;
  for (i = (HSTPipeline::Contact *)contacts; contacts[v5].stage && v7 == 0; i = (HSTPipeline::Contact *)&contacts[v5])
  {
    int v10 = HSTPipeline::Contact::encode(i, (HSUtil::Encoder *)a3);
    int v7 = *(_DWORD *)a3;
    if (*(_DWORD *)a3 || v10 != 0) {
      break;
    }
    int v7 = 10;
    *(_DWORD *)a3 = 10;
    if (++v5 == 32) {
      return 1;
    }
LABEL_16:
    ;
  }
  if (++v5 != 32) {
    goto LABEL_16;
  }
  if (!v7)
  {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
    if (!*(_DWORD *)a3) {
      HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
    }
  }
  return 1;
}

- (BOOL)handleHSDecode:(void *)a3
{
  v5.var0 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&v5.var1 = 0xAAAAAAAAAAAAAAAALL;
  CoderKey v24 = v5;
  CoderKey v25 = v5;
  CoderKey v22 = v5;
  CoderKey v23 = v5;
  CoderKey v21 = v5;
  HSUtil::Decoder::decodeMap((unint64_t *)a3, (uint64_t)&v21);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEventGenerator.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTHIDEventGenerator handleHSDecode:].cold.8();
    }
LABEL_19:
    BOOL v6 = 0;
    goto LABEL_20;
  }
  HSUtil::Decoder::decodeCodable<HSTHIDEventGeneratorConfig>(&v21, (CoderKey *)HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)102,(char)105,(char)103>::Key, &self->_config);
  if (LODWORD(v21.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEventGenerator.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTHIDEventGenerator handleHSDecode:].cold.7();
    }
    goto LABEL_19;
  }
  HSUtil::Decoder::decodeCodable<HSTContactFrameMetadata>(&v21, (CoderKey *)HSUtil::CoderKey::Literal<(char)102,(char)114,(char)97,(char)109,(char)101,(char)77,(char)101,(char)116,(char)97,(char)100,(char)97,(char)116,(char)97>::Key, &self->_frameMetadata);
  if (LODWORD(v21.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEventGenerator.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTHIDEventGenerator handleHSDecode:].cold.6();
    }
    goto LABEL_19;
  }
  self->_largeBodyActive = HSUtil::Decoder::decodeBool((HSUtil::Decoder *)&v21, (const CoderKey *)HSUtil::CoderKey::Literal<(char)108,(char)97,(char)114,(char)103,(char)101,(char)66,(char)111,(char)100,(char)121,(char)65,(char)99,(char)116,(char)105,(char)118,(char)101>::Key);
  if (LODWORD(v21.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEventGenerator.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTHIDEventGenerator handleHSDecode:].cold.5();
    }
    goto LABEL_19;
  }
  self->_disableEvents = HSUtil::Decoder::decodeBool((HSUtil::Decoder *)&v21, (const CoderKey *)HSUtil::CoderKey::Literal<(char)100,(char)105,(char)115,(char)97,(char)98,(char)108,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116,(char)115>::Key);
  if (LODWORD(v21.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEventGenerator.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTHIDEventGenerator handleHSDecode:].cold.4();
    }
    goto LABEL_19;
  }
  self->_touchMode = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v21, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)77,(char)111,(char)100,(char)101>::Key);
  if (LODWORD(v21.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEventGenerator.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTHIDEventGenerator handleHSDecode:]();
    }
    goto LABEL_19;
  }
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v19 = v9;
  long long v20 = v9;
  long long v17 = v9;
  long long v18 = v9;
  long long v16 = v9;
  HSUtil::Decoder::decodeArray(&v21, (CoderKey *)HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)115>::Key, (uint64_t)&v16);
  if (LODWORD(v21.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEventGenerator.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTHIDEventGenerator handleHSDecode:]();
    }
  }
  else
  {
    uint64_t v10 = 0;
    contacts = self->_contacts;
    do
    {
      unint64_t v12 = &contacts[v10];
      memset(__b, 0, 23);
      long long v26 = 0uLL;
      char v27 = 0;
      *(void *)&v12->int contactID = 0;
      v12->needsVelocitiesCalculated = 0;
      *(_OWORD *)&v12->int flags = v26;
      long long v13 = __b[0];
      *(void *)&v12->majorRadius = *(void *)((char *)__b + 15);
      *(void *)&v12->azimuth = 0;
      *(_OWORD *)(&v12->needsVelocitiesCalculated + 1) = v13;
      *(void *)&v12->zdensitint y = 0;
      ++v10;
    }
    while (v10 != 32);
    uint64_t v14 = 0;
    while (1)
    {
      HSUtil::Decoder::decodeCodable<HSTPipeline::Contact>((int *)&v16, (HSTPipeline::Contact *)&contacts[v14]);
      if (v16) {
        break;
      }
      if (++v14 == 32) {
        goto LABEL_36;
      }
    }
    if (v16 == 3)
    {
LABEL_36:
      BOOL v6 = 1;
      goto LABEL_37;
    }
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEventGenerator.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTHIDEventGenerator handleHSDecode:]();
    }
  }
  BOOL v6 = 0;
LABEL_37:
  if ((void)v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v18);
  }
  unsigned int v15 = (void *)v17;
  *(void *)&long long v17 = 0;
  if (v15)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v15);
    operator delete();
  }
LABEL_20:
  if (v23.var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v23.var0);
  }
  var0 = v22.var0;
  v22.var0 = 0;
  if (var0)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](var0);
    operator delete();
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTouchSystemReadyEvent, 0);

  objc_storeStrong((id *)&self->_hidStats, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((unsigned char *)self + 128) = 0;
  *((unsigned char *)self + 136) = 0;
  *((unsigned char *)self + 144) = 0;
  *((unsigned char *)self + 160) = 0;
  *((unsigned char *)self + 168) = 0;
  *((unsigned char *)self + 176) = 0;
  *((unsigned char *)self + 180) = 0;
  *((unsigned char *)self + 184) = 0;
  uint64_t v2 = 200;
  uint64_t v3 = 32;
  do
  {
    id v4 = (char *)self + v2;
    *((void *)v4 + 7) = 0;
    *((_DWORD *)v4 + 13) = 0;
    *(_DWORD *)id v4 = 0;
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    v4[24] = 0;
    *(void *)(v4 + 36) = 0;
    *(void *)(v4 + 28) = 0;
    v2 += 64;
    *((_DWORD *)v4 + 11) = 0;
    --v3;
  }
  while (v3);
  uint64_t v5 = 2376;
  uint64_t v6 = 32;
  do
  {
    int v7 = (char *)self + v5;
    *((void *)v7 + 7) = 0;
    *((_DWORD *)v7 + 13) = 0;
    *(_DWORD *)int v7 = 0;
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = 0;
    v7[24] = 0;
    *(void *)(v7 + 36) = 0;
    *(void *)(v7 + 28) = 0;
    v5 += 64;
    *((_DWORD *)v7 + 11) = 0;
    --v6;
  }
  while (v6);
  return self;
}

- (void)handleHSDecode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end