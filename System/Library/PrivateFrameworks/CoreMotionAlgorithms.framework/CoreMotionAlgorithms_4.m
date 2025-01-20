uint64_t sub_227C813A8(uint64_t result)
{
  *(void *)result = &unk_26DC28800;
  *(_DWORD *)(result + 128) = 0;
  return result;
}

void sub_227C813D0(PB::Base *a1)
{
  PB::Base::~Base(a1);

  JUMPOUT(0x22A6850E0);
}

uint64_t sub_227C81408(uint64_t result, uint64_t a2)
{
  *(void *)result = &unk_26DC28800;
  *(_DWORD *)(result + 128) = 0;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x40) != 0)
  {
    uint64_t v4 = *(void *)(a2 + 56);
    int v3 = 64;
    *(_DWORD *)(result + 128) = 64;
    *(void *)(result + 56) = v4;
    int v2 = *(_DWORD *)(a2 + 128);
    if ((v2 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v3 = 0;
  if ((v2 & 0x20) != 0)
  {
LABEL_5:
    uint64_t v5 = *(void *)(a2 + 48);
    v3 |= 0x20u;
    *(_DWORD *)(result + 128) = v3;
    *(void *)(result + 48) = v5;
    int v2 = *(_DWORD *)(a2 + 128);
  }
LABEL_6:
  if ((v2 & 0x100) != 0)
  {
    uint64_t v6 = *(void *)(a2 + 72);
    v3 |= 0x100u;
    *(_DWORD *)(result + 128) = v3;
    *(void *)(result + 72) = v6;
    int v2 = *(_DWORD *)(a2 + 128);
    if ((v2 & 0x100000) == 0)
    {
LABEL_8:
      if ((v2 & 0x800) == 0) {
        goto LABEL_9;
      }
      goto LABEL_29;
    }
  }
  else if ((v2 & 0x100000) == 0)
  {
    goto LABEL_8;
  }
  char v7 = *(unsigned char *)(a2 + 124);
  v3 |= 0x100000u;
  *(_DWORD *)(result + 128) = v3;
  *(unsigned char *)(result + 124) = v7;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x800) == 0)
  {
LABEL_9:
    if ((v2 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v8 = *(void *)(a2 + 96);
  v3 |= 0x800u;
  *(_DWORD *)(result + 128) = v3;
  *(void *)(result + 96) = v8;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x400) == 0)
  {
LABEL_10:
    if ((v2 & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v9 = *(void *)(a2 + 88);
  v3 |= 0x400u;
  *(_DWORD *)(result + 128) = v3;
  *(void *)(result + 88) = v9;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x2000) == 0)
  {
LABEL_11:
    if ((v2 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  int v10 = *(_DWORD *)(a2 + 108);
  v3 |= 0x2000u;
  *(_DWORD *)(result + 128) = v3;
  *(_DWORD *)(result + 108) = v10;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x1000) == 0)
  {
LABEL_12:
    if ((v2 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  int v11 = *(_DWORD *)(a2 + 104);
  v3 |= 0x1000u;
  *(_DWORD *)(result + 128) = v3;
  *(_DWORD *)(result + 104) = v11;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 2) == 0)
  {
LABEL_13:
    if ((v2 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v12 = *(void *)(a2 + 16);
  v3 |= 2u;
  *(_DWORD *)(result + 128) = v3;
  *(void *)(result + 16) = v12;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 8) == 0)
  {
LABEL_14:
    if ((v2 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v13 = *(void *)(a2 + 32);
  v3 |= 8u;
  *(_DWORD *)(result + 128) = v3;
  *(void *)(result + 32) = v13;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 4) == 0)
  {
LABEL_15:
    if ((v2 & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v14 = *(void *)(a2 + 24);
  v3 |= 4u;
  *(_DWORD *)(result + 128) = v3;
  *(void *)(result + 24) = v14;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x80000) == 0)
  {
LABEL_16:
    if ((v2 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  char v15 = *(unsigned char *)(a2 + 123);
  v3 |= 0x80000u;
  *(_DWORD *)(result + 128) = v3;
  *(unsigned char *)(result + 123) = v15;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x10) == 0)
  {
LABEL_17:
    if ((v2 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v16 = *(void *)(a2 + 40);
  v3 |= 0x10u;
  *(_DWORD *)(result + 128) = v3;
  *(void *)(result + 40) = v16;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x200) == 0)
  {
LABEL_18:
    if ((v2 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v17 = *(void *)(a2 + 80);
  v3 |= 0x200u;
  *(_DWORD *)(result + 128) = v3;
  *(void *)(result + 80) = v17;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x80) == 0)
  {
LABEL_19:
    if ((v2 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v18 = *(void *)(a2 + 64);
  v3 |= 0x80u;
  *(_DWORD *)(result + 128) = v3;
  *(void *)(result + 64) = v18;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 1) == 0)
  {
LABEL_20:
    if ((v2 & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v19 = *(void *)(a2 + 8);
  v3 |= 1u;
  *(_DWORD *)(result + 128) = v3;
  *(void *)(result + 8) = v19;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x200000) == 0)
  {
LABEL_21:
    if ((v2 & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_42;
  }
LABEL_41:
  char v20 = *(unsigned char *)(a2 + 125);
  v3 |= 0x200000u;
  *(_DWORD *)(result + 128) = v3;
  *(unsigned char *)(result + 125) = v20;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x20000) == 0)
  {
LABEL_22:
    if ((v2 & 0x8000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_43;
  }
LABEL_42:
  char v21 = *(unsigned char *)(a2 + 121);
  v3 |= 0x20000u;
  *(_DWORD *)(result + 128) = v3;
  *(unsigned char *)(result + 121) = v21;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x8000) == 0)
  {
LABEL_23:
    if ((v2 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_44;
  }
LABEL_43:
  int v22 = *(_DWORD *)(a2 + 116);
  v3 |= 0x8000u;
  *(_DWORD *)(result + 128) = v3;
  *(_DWORD *)(result + 116) = v22;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x10000) == 0)
  {
LABEL_24:
    if ((v2 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_45;
  }
LABEL_44:
  char v23 = *(unsigned char *)(a2 + 120);
  v3 |= 0x10000u;
  *(_DWORD *)(result + 128) = v3;
  *(unsigned char *)(result + 120) = v23;
  int v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x40000) == 0)
  {
LABEL_25:
    if ((v2 & 0x4000) == 0) {
      return result;
    }
LABEL_46:
    int v25 = *(_DWORD *)(a2 + 112);
    *(_DWORD *)(result + 128) = v3 | 0x4000;
    *(_DWORD *)(result + 112) = v25;
    return result;
  }
LABEL_45:
  char v24 = *(unsigned char *)(a2 + 122);
  v3 |= 0x40000u;
  *(_DWORD *)(result + 128) = v3;
  *(unsigned char *)(result + 122) = v24;
  if ((*(_DWORD *)(a2 + 128) & 0x4000) != 0) {
    goto LABEL_46;
  }
  return result;
}

uint64_t sub_227C8169C(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x1000) != 0)
  {
    PB::TextFormatter::format(this, "activityType");
    int v5 = *(_DWORD *)(a1 + 128);
    if ((v5 & 0x2000) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "activityTypeWithoutOverride");
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  PB::TextFormatter::format(this, "currentCadence", *(double *)(a1 + 8));
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  PB::TextFormatter::format(this, "currentPace", *(double *)(a1 + 16));
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x4000) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  PB::TextFormatter::format(this, "elevationSource");
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  PB::TextFormatter::format(this, "eta", *(double *)(a1 + 24));
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  PB::TextFormatter::format(this, "grade", *(double *)(a1 + 32));
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x8000) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  PB::TextFormatter::format(this, "gradeOnsetCounter");
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  PB::TextFormatter::format(this, "horizSpeed", *(double *)(a1 + 40));
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x10000) == 0)
  {
LABEL_11:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  PB::TextFormatter::format(this, "isArmConstrainedStateValid");
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x20000) == 0)
  {
LABEL_12:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  PB::TextFormatter::format(this, "isGradeOnsetEscalated");
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x40000) == 0)
  {
LABEL_13:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  PB::TextFormatter::format(this, "isRunning");
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x80000) == 0)
  {
LABEL_14:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  PB::TextFormatter::format(this, "isValid");
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x100000) == 0)
  {
LABEL_15:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  PB::TextFormatter::format(this, "isWeightSet");
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x200000) == 0)
  {
LABEL_16:
    if ((v5 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  PB::TextFormatter::format(this, "isWorkoutSelected");
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x20) == 0)
  {
LABEL_17:
    if ((v5 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  PB::TextFormatter::format(this, "powerWattage", *(double *)(a1 + 48));
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x40) == 0)
  {
LABEL_18:
    if ((v5 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 56));
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x80) == 0)
  {
LABEL_19:
    if ((v5 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  PB::TextFormatter::format(this, "userHeight", *(double *)(a1 + 64));
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x100) == 0)
  {
LABEL_20:
    if ((v5 & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  PB::TextFormatter::format(this, "userWeight", *(double *)(a1 + 72));
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x200) == 0)
  {
LABEL_21:
    if ((v5 & 0x400) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  PB::TextFormatter::format(this, "verticalSpeed", *(double *)(a1 + 80));
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x400) == 0)
  {
LABEL_22:
    if ((v5 & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_47:
  PB::TextFormatter::format(this, "wLoad", *(double *)(a1 + 88));
  if ((*(_DWORD *)(a1 + 128) & 0x800) != 0) {
LABEL_23:
  }
    PB::TextFormatter::format(this, "workrateMETs", *(double *)(a1 + 96));
LABEL_24:

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_227C819A0(uint64_t a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (2)
    {
      uint64_t v8 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        char v15 = 0;
        unsigned int v16 = 0;
        unint64_t v11 = 0;
        if (v2 > v3) {
          unint64_t v3 = v2;
        }
        while (v3 != v2)
        {
          unint64_t v17 = v2 + 1;
          char v18 = *(unsigned char *)(v8 + v2);
          *((void *)this + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0) {
            goto LABEL_20;
          }
          v15 += 7;
          unint64_t v2 = v17;
          if (v16++ >= 9)
          {
LABEL_19:
            unint64_t v11 = 0;
            goto LABEL_20;
          }
        }
        int v4 = 1;
        *((unsigned char *)this + 24) = 1;
      }
      else
      {
        char v9 = 0;
        unsigned int v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          unint64_t v12 = v2 + 1;
          *((void *)this + 1) = v2 + 1;
          char v13 = *(unsigned char *)(v8 + v2);
          v11 |= (unint64_t)(v13 & 0x7F) << v9;
          if ((v13 & 0x80) == 0) {
            break;
          }
          v9 += 7;
          unint64_t v2 = v12;
          BOOL v14 = v10++ > 8;
          if (v14) {
            goto LABEL_19;
          }
        }
LABEL_20:
        if ((v11 & 7) != 4)
        {
          switch((v11 >> 3))
          {
            case 1u:
              *(_DWORD *)(a1 + 128) |= 0x40u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 56) = *(void *)(*(void *)this + v2);
              goto LABEL_141;
            case 2u:
              *(_DWORD *)(a1 + 128) |= 0x20u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 48) = *(void *)(*(void *)this + v2);
              goto LABEL_141;
            case 3u:
              *(_DWORD *)(a1 + 128) |= 0x100u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 72) = *(void *)(*(void *)this + v2);
              goto LABEL_141;
            case 4u:
              *(_DWORD *)(a1 + 128) |= 0x100000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v22 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v21 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v22 = v21 != 0;
              }
              *(unsigned char *)(a1 + 124) = v22;
              goto LABEL_162;
            case 5u:
              *(_DWORD *)(a1 + 128) |= 0x800u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 96) = *(void *)(*(void *)this + v2);
              goto LABEL_141;
            case 6u:
              *(_DWORD *)(a1 + 128) |= 0x400u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 88) = *(void *)(*(void *)this + v2);
              goto LABEL_141;
            case 7u:
              *(_DWORD *)(a1 + 128) |= 0x2000u;
              unint64_t v23 = *((void *)this + 1);
              unint64_t v2 = *((void *)this + 2);
              uint64_t v24 = *(void *)this;
              if (v23 > 0xFFFFFFFFFFFFFFF5 || v23 + 10 > v2)
              {
                char v57 = 0;
                unsigned int v58 = 0;
                uint64_t v27 = 0;
                if (v2 <= v23) {
                  unint64_t v2 = *((void *)this + 1);
                }
                while (1)
                {
                  if (v2 == v23)
                  {
                    LODWORD(v27) = 0;
                    *((unsigned char *)this + 24) = 1;
                    goto LABEL_146;
                  }
                  unint64_t v59 = v23++;
                  char v60 = *(unsigned char *)(v24 + v59);
                  *((void *)this + 1) = v23;
                  v27 |= (unint64_t)(v60 & 0x7F) << v57;
                  if ((v60 & 0x80) == 0) {
                    break;
                  }
                  v57 += 7;
                  BOOL v14 = v58++ > 8;
                  if (v14)
                  {
                    LODWORD(v27) = 0;
LABEL_145:
                    unint64_t v2 = v59 + 1;
                    goto LABEL_146;
                  }
                }
                if (*((unsigned char *)this + 24)) {
                  LODWORD(v27) = 0;
                }
                goto LABEL_145;
              }
              char v25 = 0;
              unsigned int v26 = 0;
              uint64_t v27 = 0;
              do
              {
                unint64_t v2 = v23 + 1;
                *((void *)this + 1) = v23 + 1;
                char v28 = *(unsigned char *)(v24 + v23);
                v27 |= (unint64_t)(v28 & 0x7F) << v25;
                if ((v28 & 0x80) == 0) {
                  goto LABEL_146;
                }
                v25 += 7;
                unint64_t v23 = v2;
                BOOL v14 = v26++ > 8;
              }
              while (!v14);
              LODWORD(v27) = 0;
LABEL_146:
              *(_DWORD *)(a1 + 108) = v27;
              goto LABEL_162;
            case 8u:
              *(_DWORD *)(a1 + 128) |= 0x1000u;
              unint64_t v29 = *((void *)this + 1);
              unint64_t v2 = *((void *)this + 2);
              uint64_t v30 = *(void *)this;
              if (v29 > 0xFFFFFFFFFFFFFFF5 || v29 + 10 > v2)
              {
                char v61 = 0;
                unsigned int v62 = 0;
                uint64_t v33 = 0;
                if (v2 <= v29) {
                  unint64_t v2 = *((void *)this + 1);
                }
                while (1)
                {
                  if (v2 == v29)
                  {
                    LODWORD(v33) = 0;
                    *((unsigned char *)this + 24) = 1;
                    goto LABEL_151;
                  }
                  unint64_t v63 = v29++;
                  char v64 = *(unsigned char *)(v30 + v63);
                  *((void *)this + 1) = v29;
                  v33 |= (unint64_t)(v64 & 0x7F) << v61;
                  if ((v64 & 0x80) == 0) {
                    break;
                  }
                  v61 += 7;
                  BOOL v14 = v62++ > 8;
                  if (v14)
                  {
                    LODWORD(v33) = 0;
LABEL_150:
                    unint64_t v2 = v63 + 1;
                    goto LABEL_151;
                  }
                }
                if (*((unsigned char *)this + 24)) {
                  LODWORD(v33) = 0;
                }
                goto LABEL_150;
              }
              char v31 = 0;
              unsigned int v32 = 0;
              uint64_t v33 = 0;
              do
              {
                unint64_t v2 = v29 + 1;
                *((void *)this + 1) = v29 + 1;
                char v34 = *(unsigned char *)(v30 + v29);
                v33 |= (unint64_t)(v34 & 0x7F) << v31;
                if ((v34 & 0x80) == 0) {
                  goto LABEL_151;
                }
                v31 += 7;
                unint64_t v29 = v2;
                BOOL v14 = v32++ > 8;
              }
              while (!v14);
              LODWORD(v33) = 0;
LABEL_151:
              *(_DWORD *)(a1 + 104) = v33;
              goto LABEL_162;
            case 9u:
              *(_DWORD *)(a1 + 128) |= 2u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 16) = *(void *)(*(void *)this + v2);
              goto LABEL_141;
            case 0xAu:
              *(_DWORD *)(a1 + 128) |= 8u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 32) = *(void *)(*(void *)this + v2);
              goto LABEL_141;
            case 0xBu:
              *(_DWORD *)(a1 + 128) |= 4u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 24) = *(void *)(*(void *)this + v2);
              goto LABEL_141;
            case 0xCu:
              *(_DWORD *)(a1 + 128) |= 0x80000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v36 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v35 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v36 = v35 != 0;
              }
              *(unsigned char *)(a1 + 123) = v36;
              goto LABEL_162;
            case 0xDu:
              *(_DWORD *)(a1 + 128) |= 0x10u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 40) = *(void *)(*(void *)this + v2);
              goto LABEL_141;
            case 0xEu:
              *(_DWORD *)(a1 + 128) |= 0x200u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 80) = *(void *)(*(void *)this + v2);
              goto LABEL_141;
            case 0xFu:
              *(_DWORD *)(a1 + 128) |= 0x80u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 64) = *(void *)(*(void *)this + v2);
              goto LABEL_141;
            case 0x10u:
              *(_DWORD *)(a1 + 128) |= 1u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((void *)this + 2))
              {
                *(void *)(a1 + 8) = *(void *)(*(void *)this + v2);
LABEL_141:
                unint64_t v2 = *((void *)this + 1) + 8;
                *((void *)this + 1) = v2;
              }
              else
              {
LABEL_77:
                *((unsigned char *)this + 24) = 1;
              }
              goto LABEL_162;
            case 0x11u:
              *(_DWORD *)(a1 + 128) |= 0x200000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v38 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v37 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v38 = v37 != 0;
              }
              *(unsigned char *)(a1 + 125) = v38;
              goto LABEL_162;
            case 0x12u:
              *(_DWORD *)(a1 + 128) |= 0x20000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v40 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v39 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v40 = v39 != 0;
              }
              *(unsigned char *)(a1 + 121) = v40;
              goto LABEL_162;
            case 0x13u:
              *(_DWORD *)(a1 + 128) |= 0x8000u;
              unint64_t v41 = *((void *)this + 1);
              unint64_t v2 = *((void *)this + 2);
              uint64_t v42 = *(void *)this;
              if (v41 > 0xFFFFFFFFFFFFFFF5 || v41 + 10 > v2)
              {
                char v65 = 0;
                unsigned int v66 = 0;
                uint64_t v45 = 0;
                if (v2 <= v41) {
                  unint64_t v2 = *((void *)this + 1);
                }
                while (1)
                {
                  if (v2 == v41)
                  {
                    LODWORD(v45) = 0;
                    *((unsigned char *)this + 24) = 1;
                    goto LABEL_156;
                  }
                  unint64_t v67 = v41++;
                  char v68 = *(unsigned char *)(v42 + v67);
                  *((void *)this + 1) = v41;
                  v45 |= (unint64_t)(v68 & 0x7F) << v65;
                  if ((v68 & 0x80) == 0) {
                    break;
                  }
                  v65 += 7;
                  BOOL v14 = v66++ > 8;
                  if (v14)
                  {
                    LODWORD(v45) = 0;
LABEL_155:
                    unint64_t v2 = v67 + 1;
                    goto LABEL_156;
                  }
                }
                if (*((unsigned char *)this + 24)) {
                  LODWORD(v45) = 0;
                }
                goto LABEL_155;
              }
              char v43 = 0;
              unsigned int v44 = 0;
              uint64_t v45 = 0;
              do
              {
                unint64_t v2 = v41 + 1;
                *((void *)this + 1) = v41 + 1;
                char v46 = *(unsigned char *)(v42 + v41);
                v45 |= (unint64_t)(v46 & 0x7F) << v43;
                if ((v46 & 0x80) == 0) {
                  goto LABEL_156;
                }
                v43 += 7;
                unint64_t v41 = v2;
                BOOL v14 = v44++ > 8;
              }
              while (!v14);
              LODWORD(v45) = 0;
LABEL_156:
              *(_DWORD *)(a1 + 116) = v45;
              goto LABEL_162;
            case 0x14u:
              *(_DWORD *)(a1 + 128) |= 0x10000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v48 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v47 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v48 = v47 != 0;
              }
              *(unsigned char *)(a1 + 120) = v48;
              goto LABEL_162;
            case 0x15u:
              *(_DWORD *)(a1 + 128) |= 0x40000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v50 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v49 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v50 = v49 != 0;
              }
              *(unsigned char *)(a1 + 122) = v50;
              goto LABEL_162;
            case 0x16u:
              *(_DWORD *)(a1 + 128) |= 0x4000u;
              unint64_t v51 = *((void *)this + 1);
              unint64_t v2 = *((void *)this + 2);
              uint64_t v52 = *(void *)this;
              if (v51 > 0xFFFFFFFFFFFFFFF5 || v51 + 10 > v2)
              {
                char v69 = 0;
                unsigned int v70 = 0;
                uint64_t v55 = 0;
                if (v2 <= v51) {
                  unint64_t v2 = *((void *)this + 1);
                }
                while (1)
                {
                  if (v2 == v51)
                  {
                    LODWORD(v55) = 0;
                    *((unsigned char *)this + 24) = 1;
                    goto LABEL_161;
                  }
                  unint64_t v71 = v51++;
                  char v72 = *(unsigned char *)(v52 + v71);
                  *((void *)this + 1) = v51;
                  v55 |= (unint64_t)(v72 & 0x7F) << v69;
                  if ((v72 & 0x80) == 0) {
                    break;
                  }
                  v69 += 7;
                  BOOL v14 = v70++ > 8;
                  if (v14)
                  {
                    LODWORD(v55) = 0;
LABEL_160:
                    unint64_t v2 = v71 + 1;
                    goto LABEL_161;
                  }
                }
                if (*((unsigned char *)this + 24)) {
                  LODWORD(v55) = 0;
                }
                goto LABEL_160;
              }
              char v53 = 0;
              unsigned int v54 = 0;
              uint64_t v55 = 0;
              do
              {
                unint64_t v2 = v51 + 1;
                *((void *)this + 1) = v51 + 1;
                char v56 = *(unsigned char *)(v52 + v51);
                v55 |= (unint64_t)(v56 & 0x7F) << v53;
                if ((v56 & 0x80) == 0) {
                  goto LABEL_161;
                }
                v53 += 7;
                unint64_t v51 = v2;
                BOOL v14 = v54++ > 8;
              }
              while (!v14);
              LODWORD(v55) = 0;
LABEL_161:
              *(_DWORD *)(a1 + 112) = v55;
LABEL_162:
              unint64_t v3 = *((void *)this + 2);
              int v4 = *((unsigned __int8 *)this + 24);
              if (v2 >= v3 || v4 != 0) {
                return v4 == 0;
              }
              continue;
            default:
              uint64_t result = PB::Reader::skip(this);
              if (!result) {
                return result;
              }
              unint64_t v2 = *((void *)this + 1);
              goto LABEL_162;
          }
        }
        int v4 = 0;
      }
      break;
    }
  }
  return v4 == 0;
}

uint64_t sub_227C82368(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 128);
  if ((v4 & 0x40) != 0)
  {
    uint64_t result = PB::Writer::write(this, *(double *)(result + 56));
    int v4 = *(_DWORD *)(v3 + 128);
    if ((v4 & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((v4 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 48));
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x100) == 0)
  {
LABEL_4:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 72));
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x100000) == 0)
  {
LABEL_5:
    if ((v4 & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t result = PB::Writer::write(this);
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x800) == 0)
  {
LABEL_6:
    if ((v4 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 96));
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x400) == 0)
  {
LABEL_7:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 88));
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x2000) == 0)
  {
LABEL_8:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t result = PB::Writer::writeVarInt(this);
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x1000) == 0)
  {
LABEL_9:
    if ((v4 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t result = PB::Writer::writeVarInt(this);
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 2) == 0)
  {
LABEL_10:
    if ((v4 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 16));
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 8) == 0)
  {
LABEL_11:
    if ((v4 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 32));
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 4) == 0)
  {
LABEL_12:
    if ((v4 & 0x80000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 24));
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x80000) == 0)
  {
LABEL_13:
    if ((v4 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t result = PB::Writer::write(this);
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x10) == 0)
  {
LABEL_14:
    if ((v4 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 40));
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x200) == 0)
  {
LABEL_15:
    if ((v4 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 80));
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x80) == 0)
  {
LABEL_16:
    if ((v4 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 64));
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 1) == 0)
  {
LABEL_17:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 8));
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x200000) == 0)
  {
LABEL_18:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t result = PB::Writer::write(this);
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x20000) == 0)
  {
LABEL_19:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t result = PB::Writer::write(this);
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x8000) == 0)
  {
LABEL_20:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t result = PB::Writer::writeVarInt(this);
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x10000) == 0)
  {
LABEL_21:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_22;
    }
LABEL_44:
    uint64_t result = PB::Writer::write(this);
    if ((*(_DWORD *)(v3 + 128) & 0x4000) == 0) {
      return result;
    }
    goto LABEL_45;
  }
LABEL_43:
  uint64_t result = PB::Writer::write(this);
  int v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x40000) != 0) {
    goto LABEL_44;
  }
LABEL_22:
  if ((v4 & 0x4000) == 0) {
    return result;
  }
LABEL_45:

  return PB::Writer::writeVarInt(this);
}

uint64_t sub_227C82608(uint64_t result)
{
  *(void *)uint64_t result = &unk_26DC28838;
  *(_DWORD *)(result + 48) = 0;
  return result;
}

void sub_227C82630(PB::Base *a1)
{
  PB::Base::~Base(a1);

  JUMPOUT(0x22A6850E0);
}

double sub_227C82668(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26DC28838;
  *(_DWORD *)(a1 + 48) = 0;
  char v2 = *(unsigned char *)(a2 + 48);
  if ((v2 & 8) != 0)
  {
    double result = *(double *)(a2 + 32);
    char v3 = 8;
    *(unsigned char *)(a1 + 48) = 8;
    *(double *)(a1 + 32) = result;
    char v2 = *(unsigned char *)(a2 + 48);
    if ((v2 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v3 = 0;
  if ((*(unsigned char *)(a2 + 48) & 0x10) != 0)
  {
LABEL_5:
    double result = *(double *)(a2 + 40);
    v3 |= 0x10u;
    *(unsigned char *)(a1 + 48) = v3;
    *(double *)(a1 + 40) = result;
    char v2 = *(unsigned char *)(a2 + 48);
  }
LABEL_6:
  if (v2)
  {
    double result = *(double *)(a2 + 8);
    v3 |= 1u;
    *(unsigned char *)(a1 + 48) = v3;
    *(double *)(a1 + 8) = result;
    char v2 = *(unsigned char *)(a2 + 48);
    if ((v2 & 2) == 0)
    {
LABEL_8:
      if ((v2 & 4) == 0) {
        return result;
      }
LABEL_12:
      double result = *(double *)(a2 + 24);
      *(unsigned char *)(a1 + 48) = v3 | 4;
      *(double *)(a1 + 24) = result;
      return result;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_8;
  }
  double result = *(double *)(a2 + 16);
  v3 |= 2u;
  *(unsigned char *)(a1 + 48) = v3;
  *(double *)(a1 + 16) = result;
  if ((*(unsigned char *)(a2 + 48) & 4) != 0) {
    goto LABEL_12;
  }
  return result;
}

uint64_t sub_227C82720(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  char v5 = *(unsigned char *)(a1 + 48);
  if (v5)
  {
    PB::TextFormatter::format(this, "primaryAxisX", *(double *)(a1 + 8));
    char v5 = *(unsigned char *)(a1 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)(a1 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "primaryAxisY", *(double *)(a1 + 16));
  char v5 = *(unsigned char *)(a1 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PB::TextFormatter::format(this, "primaryAxisZ", *(double *)(a1 + 24));
  char v5 = *(unsigned char *)(a1 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 32));
  if ((*(unsigned char *)(a1 + 48) & 0x10) != 0) {
LABEL_6:
  }
    PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 40));
LABEL_7:

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_227C82804(uint64_t a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)this + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        if (v10++ > 8) {
          goto LABEL_19;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 48) |= 8u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_38;
          }
          *(void *)(a1 + 32) = *(void *)(*(void *)this + v2);
          goto LABEL_40;
        case 2u:
          *(unsigned char *)(a1 + 48) |= 0x10u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_38;
          }
          *(void *)(a1 + 40) = *(void *)(*(void *)this + v2);
          goto LABEL_40;
        case 3u:
          *(unsigned char *)(a1 + 48) |= 1u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_38;
          }
          *(void *)(a1 + 8) = *(void *)(*(void *)this + v2);
          goto LABEL_40;
        case 4u:
          *(unsigned char *)(a1 + 48) |= 2u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_38;
          }
          *(void *)(a1 + 16) = *(void *)(*(void *)this + v2);
          goto LABEL_40;
        case 5u:
          *(unsigned char *)(a1 + 48) |= 4u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((void *)this + 2))
          {
            *(void *)(a1 + 24) = *(void *)(*(void *)this + v2);
LABEL_40:
            unint64_t v2 = *((void *)this + 1) + 8;
            *((void *)this + 1) = v2;
          }
          else
          {
LABEL_38:
            *((unsigned char *)this + 24) = 1;
          }
          break;
        default:
          uint64_t result = PB::Reader::skip(this);
          if (!result) {
            return result;
          }
          unint64_t v2 = *((void *)this + 1);
          break;
      }
      unint64_t v3 = *((void *)this + 2);
      int v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((unsigned char *)this + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        unint64_t v11 = 0;
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_227C82AB8(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  char v4 = *(unsigned char *)(result + 48);
  if ((v4 & 8) != 0)
  {
    uint64_t result = PB::Writer::write(this, *(double *)(result + 32));
    char v4 = *(unsigned char *)(v3 + 48);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)(result + 48) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 40));
  char v4 = *(unsigned char *)(v3 + 48);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t result = PB::Writer::write(this, *(double *)(v3 + 16));
    if ((*(unsigned char *)(v3 + 48) & 4) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 8));
  char v4 = *(unsigned char *)(v3 + 48);
  if ((v4 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((v4 & 4) == 0) {
    return result;
  }
LABEL_11:
  double v5 = *(double *)(v3 + 24);

  return PB::Writer::write(this, v5);
}

uint64_t sub_227C82B7C(uint64_t result)
{
  *(void *)uint64_t result = &unk_26DC28870;
  *(_DWORD *)(result + 188) = 0;
  return result;
}

void sub_227C82BA4(PB::Base *a1)
{
  PB::Base::~Base(a1);

  JUMPOUT(0x22A6850E0);
}

uint64_t sub_227C82BDC(uint64_t result, uint64_t a2)
{
  *(void *)uint64_t result = &unk_26DC28870;
  *(_DWORD *)(result + 188) = 0;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x80000) != 0)
  {
    uint64_t v4 = *(void *)(a2 + 160);
    int v3 = 0x80000;
    *(_DWORD *)(result + 188) = 0x80000;
    *(void *)(result + 160) = v4;
    int v2 = *(_DWORD *)(a2 + 188);
    if ((v2 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v3 = 0;
  if ((v2 & 0x80) != 0)
  {
LABEL_5:
    uint64_t v5 = *(void *)(a2 + 64);
    v3 |= 0x80u;
    *(_DWORD *)(result + 188) = v3;
    *(void *)(result + 64) = v5;
    int v2 = *(_DWORD *)(a2 + 188);
  }
LABEL_6:
  if ((v2 & 0x40000) != 0)
  {
    uint64_t v6 = *(void *)(a2 + 152);
    v3 |= 0x40000u;
    *(_DWORD *)(result + 188) = v3;
    *(void *)(result + 152) = v6;
    int v2 = *(_DWORD *)(a2 + 188);
    if ((v2 & 0x8000000) == 0)
    {
LABEL_8:
      if ((v2 & 0x20000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_35;
    }
  }
  else if ((v2 & 0x8000000) == 0)
  {
    goto LABEL_8;
  }
  char v7 = *(unsigned char *)(a2 + 184);
  v3 |= 0x8000000u;
  *(_DWORD *)(result + 188) = v3;
  *(unsigned char *)(result + 184) = v7;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x20000) == 0)
  {
LABEL_9:
    if ((v2 & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v8 = *(void *)(a2 + 144);
  v3 |= 0x20000u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 144) = v8;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x10000) == 0)
  {
LABEL_10:
    if ((v2 & 0x2000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v9 = *(void *)(a2 + 136);
  v3 |= 0x10000u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 136) = v9;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x2000000) == 0)
  {
LABEL_11:
    if ((v2 & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  char v10 = *(unsigned char *)(a2 + 182);
  v3 |= 0x2000000u;
  *(_DWORD *)(result + 188) = v3;
  *(unsigned char *)(result + 182) = v10;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x4000000) == 0)
  {
LABEL_12:
    if ((v2 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  char v11 = *(unsigned char *)(a2 + 183);
  v3 |= 0x4000000u;
  *(_DWORD *)(result + 188) = v3;
  *(unsigned char *)(result + 183) = v11;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x40) == 0)
  {
LABEL_13:
    if ((v2 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v12 = *(void *)(a2 + 56);
  v3 |= 0x40u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 56) = v12;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 8) == 0)
  {
LABEL_14:
    if ((v2 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v13 = *(void *)(a2 + 32);
  v3 |= 8u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 32) = v13;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x20) == 0)
  {
LABEL_15:
    if ((v2 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v14 = *(void *)(a2 + 48);
  v3 |= 0x20u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 48) = v14;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x10) == 0)
  {
LABEL_16:
    if ((v2 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v15 = *(void *)(a2 + 40);
  v3 |= 0x10u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 40) = v15;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 1) == 0)
  {
LABEL_17:
    if ((v2 & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v16 = *(void *)(a2 + 8);
  v3 |= 1u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 8) = v16;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 2) == 0)
  {
LABEL_18:
    if ((v2 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v17 = *(void *)(a2 + 16);
  v3 |= 2u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 16) = v17;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x8000) == 0)
  {
LABEL_19:
    if ((v2 & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v18 = *(void *)(a2 + 128);
  v3 |= 0x8000u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 128) = v18;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x4000) == 0)
  {
LABEL_20:
    if ((v2 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v19 = *(void *)(a2 + 120);
  v3 |= 0x4000u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 120) = v19;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x100) == 0)
  {
LABEL_21:
    if ((v2 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v20 = *(void *)(a2 + 72);
  v3 |= 0x100u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 72) = v20;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x200) == 0)
  {
LABEL_22:
    if ((v2 & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v21 = *(void *)(a2 + 80);
  v3 |= 0x200u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 80) = v21;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 4) == 0)
  {
LABEL_23:
    if ((v2 & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v22 = *(void *)(a2 + 24);
  v3 |= 4u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 24) = v22;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x400000) == 0)
  {
LABEL_24:
    if ((v2 & 0x100000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_51;
  }
LABEL_50:
  int v23 = *(_DWORD *)(a2 + 176);
  v3 |= 0x400000u;
  *(_DWORD *)(result + 188) = v3;
  *(_DWORD *)(result + 176) = v23;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x100000) == 0)
  {
LABEL_25:
    if ((v2 & 0x200000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_52;
  }
LABEL_51:
  int v24 = *(_DWORD *)(a2 + 168);
  v3 |= 0x100000u;
  *(_DWORD *)(result + 188) = v3;
  *(_DWORD *)(result + 168) = v24;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x200000) == 0)
  {
LABEL_26:
    if ((v2 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_53;
  }
LABEL_52:
  int v25 = *(_DWORD *)(a2 + 172);
  v3 |= 0x200000u;
  *(_DWORD *)(result + 188) = v3;
  *(_DWORD *)(result + 172) = v25;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x800000) == 0)
  {
LABEL_27:
    if ((v2 & 0x1000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_54;
  }
LABEL_53:
  char v26 = *(unsigned char *)(a2 + 180);
  v3 |= 0x800000u;
  *(_DWORD *)(result + 188) = v3;
  *(unsigned char *)(result + 180) = v26;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x1000) == 0)
  {
LABEL_28:
    if ((v2 & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v27 = *(void *)(a2 + 104);
  v3 |= 0x1000u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 104) = v27;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x2000) == 0)
  {
LABEL_29:
    if ((v2 & 0x400) == 0) {
      goto LABEL_30;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v28 = *(void *)(a2 + 112);
  v3 |= 0x2000u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 112) = v28;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x400) == 0)
  {
LABEL_30:
    if ((v2 & 0x800) == 0) {
      goto LABEL_31;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v29 = *(void *)(a2 + 88);
  v3 |= 0x400u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 88) = v29;
  int v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x800) == 0)
  {
LABEL_31:
    if ((v2 & 0x1000000) == 0) {
      return result;
    }
LABEL_58:
    char v31 = *(unsigned char *)(a2 + 181);
    *(_DWORD *)(result + 188) = v3 | 0x1000000;
    *(unsigned char *)(result + 181) = v31;
    return result;
  }
LABEL_57:
  uint64_t v30 = *(void *)(a2 + 96);
  v3 |= 0x800u;
  *(_DWORD *)(result + 188) = v3;
  *(void *)(result + 96) = v30;
  if ((*(_DWORD *)(a2 + 188) & 0x1000000) != 0) {
    goto LABEL_58;
  }
  return result;
}

uint64_t sub_227C82F18(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  int v5 = *(_DWORD *)(a1 + 188);
  if (v5)
  {
    PB::TextFormatter::format(this, "algDelay", *(double *)(a1 + 8));
    int v5 = *(_DWORD *)(a1 + 188);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "biasFactor", *(double *)(a1 + 16));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  PB::TextFormatter::format(this, "deltaCalibratedPedometerDistance", *(double *)(a1 + 24));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  PB::TextFormatter::format(this, "deltaOdometerDistance", *(double *)(a1 + 32));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  PB::TextFormatter::format(this, "deltaOdometerTime", *(double *)(a1 + 40));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  PB::TextFormatter::format(this, "deltaPedometerTime", *(double *)(a1 + 48));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  PB::TextFormatter::format(this, "deltaRawPedometerDistance", *(double *)(a1 + 56));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  PB::TextFormatter::format(this, "endTime", *(double *)(a1 + 64));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x100000) == 0)
  {
LABEL_10:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  PB::TextFormatter::format(this, "gestureState");
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x200000) == 0)
  {
LABEL_11:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  PB::TextFormatter::format(this, "gestureType");
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x800000) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  PB::TextFormatter::format(this, "interruptFlag");
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  PB::TextFormatter::format(this, "isTrackRunOdometer");
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  PB::TextFormatter::format(this, "isValidOdometerSpeed");
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  PB::TextFormatter::format(this, "isValidPedometerSpeed");
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  PB::TextFormatter::format(this, "isValidRunningSpeed");
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x100) == 0)
  {
LABEL_17:
    if ((v5 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  PB::TextFormatter::format(this, "kalmanEpsOdometer", *(double *)(a1 + 72));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x200) == 0)
  {
LABEL_18:
    if ((v5 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  PB::TextFormatter::format(this, "kalmanEpsPedometer", *(double *)(a1 + 80));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x400) == 0)
  {
LABEL_19:
    if ((v5 & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  PB::TextFormatter::format(this, "kalmanGainOdometer", *(double *)(a1 + 88));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x800) == 0)
  {
LABEL_20:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  PB::TextFormatter::format(this, "kalmanGainPedometer", *(double *)(a1 + 96));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x1000) == 0)
  {
LABEL_21:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  PB::TextFormatter::format(this, "kalmanMeasurementNoiseOdometer", *(double *)(a1 + 104));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x2000) == 0)
  {
LABEL_22:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  PB::TextFormatter::format(this, "kalmanMeasurementNoisePedometer", *(double *)(a1 + 112));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x4000) == 0)
  {
LABEL_23:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  PB::TextFormatter::format(this, "kalmanProcessNoise", *(double *)(a1 + 120));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x8000) == 0)
  {
LABEL_24:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  PB::TextFormatter::format(this, "kalmanStateCovariance", *(double *)(a1 + 128));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x400000) == 0)
  {
LABEL_25:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  PB::TextFormatter::format(this, "odometerQuality");
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x10000) == 0)
  {
LABEL_26:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  PB::TextFormatter::format(this, "odometerSpeed", *(double *)(a1 + 136));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x20000) == 0)
  {
LABEL_27:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  PB::TextFormatter::format(this, "pedometerSpeed", *(double *)(a1 + 144));
  int v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x40000) == 0)
  {
LABEL_28:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_59:
  PB::TextFormatter::format(this, "runningSpeed", *(double *)(a1 + 152));
  if ((*(_DWORD *)(a1 + 188) & 0x80000) != 0) {
LABEL_29:
  }
    PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 160));
LABEL_30:

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_227C832DC(uint64_t a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (2)
    {
      uint64_t v8 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        char v15 = 0;
        unsigned int v16 = 0;
        unint64_t v11 = 0;
        if (v2 > v3) {
          unint64_t v3 = v2;
        }
        while (v3 != v2)
        {
          unint64_t v17 = v2 + 1;
          char v18 = *(unsigned char *)(v8 + v2);
          *((void *)this + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0) {
            goto LABEL_20;
          }
          v15 += 7;
          unint64_t v2 = v17;
          if (v16++ >= 9)
          {
LABEL_19:
            unint64_t v11 = 0;
            goto LABEL_20;
          }
        }
        int v4 = 1;
        *((unsigned char *)this + 24) = 1;
      }
      else
      {
        char v9 = 0;
        unsigned int v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          unint64_t v12 = v2 + 1;
          *((void *)this + 1) = v2 + 1;
          char v13 = *(unsigned char *)(v8 + v2);
          v11 |= (unint64_t)(v13 & 0x7F) << v9;
          if ((v13 & 0x80) == 0) {
            break;
          }
          v9 += 7;
          unint64_t v2 = v12;
          BOOL v14 = v10++ > 8;
          if (v14) {
            goto LABEL_19;
          }
        }
LABEL_20:
        if ((v11 & 7) != 4)
        {
          switch((v11 >> 3))
          {
            case 1u:
              *(_DWORD *)(a1 + 188) |= 0x80000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 160) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 2u:
              *(_DWORD *)(a1 + 188) |= 0x80u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 64) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 3u:
              *(_DWORD *)(a1 + 188) |= 0x40000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 152) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 4u:
              *(_DWORD *)(a1 + 188) |= 0x8000000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v22 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v21 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v22 = v21 != 0;
              }
              *(unsigned char *)(a1 + 184) = v22;
              goto LABEL_148;
            case 5u:
              *(_DWORD *)(a1 + 188) |= 0x20000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 144) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 6u:
              *(_DWORD *)(a1 + 188) |= 0x10000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 136) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 7u:
              *(_DWORD *)(a1 + 188) |= 0x2000000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v24 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v23 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v24 = v23 != 0;
              }
              *(unsigned char *)(a1 + 182) = v24;
              goto LABEL_148;
            case 8u:
              *(_DWORD *)(a1 + 188) |= 0x4000000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v26 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v25 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v26 = v25 != 0;
              }
              *(unsigned char *)(a1 + 183) = v26;
              goto LABEL_148;
            case 9u:
              *(_DWORD *)(a1 + 188) |= 0x40u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 56) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0xAu:
              *(_DWORD *)(a1 + 188) |= 8u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 32) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0xBu:
              *(_DWORD *)(a1 + 188) |= 0x20u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 48) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0xCu:
              *(_DWORD *)(a1 + 188) |= 0x10u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 40) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0xDu:
              *(_DWORD *)(a1 + 188) |= 1u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 8) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0xEu:
              *(_DWORD *)(a1 + 188) |= 2u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 16) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0xFu:
              *(_DWORD *)(a1 + 188) |= 0x8000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 128) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0x10u:
              *(_DWORD *)(a1 + 188) |= 0x4000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 120) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0x11u:
              *(_DWORD *)(a1 + 188) |= 0x100u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 72) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0x12u:
              *(_DWORD *)(a1 + 188) |= 0x200u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 80) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0x13u:
              *(_DWORD *)(a1 + 188) |= 4u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 24) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0x14u:
              *(_DWORD *)(a1 + 188) |= 0x400000u;
              unint64_t v27 = *((void *)this + 1);
              unint64_t v2 = *((void *)this + 2);
              uint64_t v28 = *(void *)this;
              if (v27 > 0xFFFFFFFFFFFFFFF5 || v27 + 10 > v2)
              {
                char v49 = 0;
                unsigned int v50 = 0;
                uint64_t v31 = 0;
                if (v2 <= v27) {
                  unint64_t v2 = *((void *)this + 1);
                }
                while (1)
                {
                  if (v2 == v27)
                  {
                    LODWORD(v31) = 0;
                    *((unsigned char *)this + 24) = 1;
                    goto LABEL_157;
                  }
                  unint64_t v51 = v27++;
                  char v52 = *(unsigned char *)(v28 + v51);
                  *((void *)this + 1) = v27;
                  v31 |= (unint64_t)(v52 & 0x7F) << v49;
                  if ((v52 & 0x80) == 0) {
                    break;
                  }
                  v49 += 7;
                  BOOL v14 = v50++ > 8;
                  if (v14)
                  {
                    LODWORD(v31) = 0;
LABEL_156:
                    unint64_t v2 = v51 + 1;
                    goto LABEL_157;
                  }
                }
                if (*((unsigned char *)this + 24)) {
                  LODWORD(v31) = 0;
                }
                goto LABEL_156;
              }
              char v29 = 0;
              unsigned int v30 = 0;
              uint64_t v31 = 0;
              do
              {
                unint64_t v2 = v27 + 1;
                *((void *)this + 1) = v27 + 1;
                char v32 = *(unsigned char *)(v28 + v27);
                v31 |= (unint64_t)(v32 & 0x7F) << v29;
                if ((v32 & 0x80) == 0) {
                  goto LABEL_157;
                }
                v29 += 7;
                unint64_t v27 = v2;
                BOOL v14 = v30++ > 8;
              }
              while (!v14);
              LODWORD(v31) = 0;
LABEL_157:
              *(_DWORD *)(a1 + 176) = v31;
              goto LABEL_148;
            case 0x15u:
              *(_DWORD *)(a1 + 188) |= 0x100000u;
              unint64_t v33 = *((void *)this + 1);
              unint64_t v2 = *((void *)this + 2);
              uint64_t v34 = *(void *)this;
              if (v33 > 0xFFFFFFFFFFFFFFF5 || v33 + 10 > v2)
              {
                char v53 = 0;
                unsigned int v54 = 0;
                uint64_t v37 = 0;
                if (v2 <= v33) {
                  unint64_t v2 = *((void *)this + 1);
                }
                while (1)
                {
                  if (v2 == v33)
                  {
                    LODWORD(v37) = 0;
                    *((unsigned char *)this + 24) = 1;
                    goto LABEL_162;
                  }
                  unint64_t v55 = v33++;
                  char v56 = *(unsigned char *)(v34 + v55);
                  *((void *)this + 1) = v33;
                  v37 |= (unint64_t)(v56 & 0x7F) << v53;
                  if ((v56 & 0x80) == 0) {
                    break;
                  }
                  v53 += 7;
                  BOOL v14 = v54++ > 8;
                  if (v14)
                  {
                    LODWORD(v37) = 0;
LABEL_161:
                    unint64_t v2 = v55 + 1;
                    goto LABEL_162;
                  }
                }
                if (*((unsigned char *)this + 24)) {
                  LODWORD(v37) = 0;
                }
                goto LABEL_161;
              }
              char v35 = 0;
              unsigned int v36 = 0;
              uint64_t v37 = 0;
              do
              {
                unint64_t v2 = v33 + 1;
                *((void *)this + 1) = v33 + 1;
                char v38 = *(unsigned char *)(v34 + v33);
                v37 |= (unint64_t)(v38 & 0x7F) << v35;
                if ((v38 & 0x80) == 0) {
                  goto LABEL_162;
                }
                v35 += 7;
                unint64_t v33 = v2;
                BOOL v14 = v36++ > 8;
              }
              while (!v14);
              LODWORD(v37) = 0;
LABEL_162:
              *(_DWORD *)(a1 + 168) = v37;
              goto LABEL_148;
            case 0x16u:
              *(_DWORD *)(a1 + 188) |= 0x200000u;
              unint64_t v39 = *((void *)this + 1);
              unint64_t v2 = *((void *)this + 2);
              uint64_t v40 = *(void *)this;
              if (v39 > 0xFFFFFFFFFFFFFFF5 || v39 + 10 > v2)
              {
                char v57 = 0;
                unsigned int v58 = 0;
                uint64_t v43 = 0;
                if (v2 <= v39) {
                  unint64_t v2 = *((void *)this + 1);
                }
                while (1)
                {
                  if (v2 == v39)
                  {
                    LODWORD(v43) = 0;
                    *((unsigned char *)this + 24) = 1;
                    goto LABEL_167;
                  }
                  unint64_t v59 = v39++;
                  char v60 = *(unsigned char *)(v40 + v59);
                  *((void *)this + 1) = v39;
                  v43 |= (unint64_t)(v60 & 0x7F) << v57;
                  if ((v60 & 0x80) == 0) {
                    break;
                  }
                  v57 += 7;
                  BOOL v14 = v58++ > 8;
                  if (v14)
                  {
                    LODWORD(v43) = 0;
LABEL_166:
                    unint64_t v2 = v59 + 1;
                    goto LABEL_167;
                  }
                }
                if (*((unsigned char *)this + 24)) {
                  LODWORD(v43) = 0;
                }
                goto LABEL_166;
              }
              char v41 = 0;
              unsigned int v42 = 0;
              uint64_t v43 = 0;
              do
              {
                unint64_t v2 = v39 + 1;
                *((void *)this + 1) = v39 + 1;
                char v44 = *(unsigned char *)(v40 + v39);
                v43 |= (unint64_t)(v44 & 0x7F) << v41;
                if ((v44 & 0x80) == 0) {
                  goto LABEL_167;
                }
                v41 += 7;
                unint64_t v39 = v2;
                BOOL v14 = v42++ > 8;
              }
              while (!v14);
              LODWORD(v43) = 0;
LABEL_167:
              *(_DWORD *)(a1 + 172) = v43;
LABEL_148:
              unint64_t v3 = *((void *)this + 2);
              int v4 = *((unsigned __int8 *)this + 24);
              if (v2 >= v3 || v4 != 0) {
                return v4 == 0;
              }
              continue;
            case 0x17u:
              *(_DWORD *)(a1 + 188) |= 0x800000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v46 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v45 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v46 = v45 != 0;
              }
              *(unsigned char *)(a1 + 180) = v46;
              goto LABEL_148;
            case 0x18u:
              *(_DWORD *)(a1 + 188) |= 0x1000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 104) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0x19u:
              *(_DWORD *)(a1 + 188) |= 0x2000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 112) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0x1Au:
              *(_DWORD *)(a1 + 188) |= 0x400u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_112;
              }
              *(void *)(a1 + 88) = *(void *)(*(void *)this + v2);
              goto LABEL_147;
            case 0x1Bu:
              *(_DWORD *)(a1 + 188) |= 0x800u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((void *)this + 2))
              {
                *(void *)(a1 + 96) = *(void *)(*(void *)this + v2);
LABEL_147:
                unint64_t v2 = *((void *)this + 1) + 8;
                *((void *)this + 1) = v2;
              }
              else
              {
LABEL_112:
                *((unsigned char *)this + 24) = 1;
              }
              goto LABEL_148;
            case 0x1Cu:
              *(_DWORD *)(a1 + 188) |= 0x1000000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v48 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v47 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v48 = v47 != 0;
              }
              *(unsigned char *)(a1 + 181) = v48;
              goto LABEL_148;
            default:
              uint64_t result = PB::Reader::skip(this);
              if (!result) {
                return result;
              }
              unint64_t v2 = *((void *)this + 1);
              goto LABEL_148;
          }
        }
        int v4 = 0;
      }
      break;
    }
  }
  return v4 == 0;
}

uint64_t sub_227C83D64(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 188);
  if ((v4 & 0x80000) != 0)
  {
    uint64_t result = PB::Writer::write(this, *(double *)(result + 160));
    int v4 = *(_DWORD *)(v3 + 188);
    if ((v4 & 0x80) == 0)
    {
LABEL_3:
      if ((v4 & 0x40000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((v4 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 64));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x40000) == 0)
  {
LABEL_4:
    if ((v4 & 0x8000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 152));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x8000000) == 0)
  {
LABEL_5:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t result = PB::Writer::write(this);
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x20000) == 0)
  {
LABEL_6:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 144));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x10000) == 0)
  {
LABEL_7:
    if ((v4 & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 136));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x2000000) == 0)
  {
LABEL_8:
    if ((v4 & 0x4000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t result = PB::Writer::write(this);
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x4000000) == 0)
  {
LABEL_9:
    if ((v4 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t result = PB::Writer::write(this);
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x40) == 0)
  {
LABEL_10:
    if ((v4 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 56));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 8) == 0)
  {
LABEL_11:
    if ((v4 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 32));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x20) == 0)
  {
LABEL_12:
    if ((v4 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 48));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x10) == 0)
  {
LABEL_13:
    if ((v4 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 40));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 1) == 0)
  {
LABEL_14:
    if ((v4 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 8));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 2) == 0)
  {
LABEL_15:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 16));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x8000) == 0)
  {
LABEL_16:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 128));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x4000) == 0)
  {
LABEL_17:
    if ((v4 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 120));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x100) == 0)
  {
LABEL_18:
    if ((v4 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 72));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x200) == 0)
  {
LABEL_19:
    if ((v4 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 80));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 4) == 0)
  {
LABEL_20:
    if ((v4 & 0x400000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 24));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x400000) == 0)
  {
LABEL_21:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t result = PB::Writer::writeVarInt(this);
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x100000) == 0)
  {
LABEL_22:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t result = PB::Writer::writeVarInt(this);
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x200000) == 0)
  {
LABEL_23:
    if ((v4 & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t result = PB::Writer::writeVarInt(this);
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x800000) == 0)
  {
LABEL_24:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t result = PB::Writer::write(this);
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x1000) == 0)
  {
LABEL_25:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 104));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x2000) == 0)
  {
LABEL_26:
    if ((v4 & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 112));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x400) == 0)
  {
LABEL_27:
    if ((v4 & 0x800) == 0) {
      goto LABEL_28;
    }
LABEL_56:
    uint64_t result = PB::Writer::write(this, *(double *)(v3 + 96));
    if ((*(_DWORD *)(v3 + 188) & 0x1000000) == 0) {
      return result;
    }
    goto LABEL_57;
  }
LABEL_55:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 88));
  int v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x800) != 0) {
    goto LABEL_56;
  }
LABEL_28:
  if ((v4 & 0x1000000) == 0) {
    return result;
  }
LABEL_57:

  return PB::Writer::write(this);
}

uint64_t sub_227C840AC(uint64_t result)
{
  *(void *)uint64_t result = &unk_26DC288A8;
  *(_DWORD *)(result + 136) = 0;
  return result;
}

void sub_227C840D4(PB::Base *a1)
{
  PB::Base::~Base(a1);

  JUMPOUT(0x22A6850E0);
}

double sub_227C8410C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26DC288A8;
  *(_DWORD *)(a1 + 136) = 0;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 4) != 0)
  {
    double result = *(double *)(a2 + 24);
    int v3 = 4;
    *(_DWORD *)(a1 + 136) = 4;
    *(double *)(a1 + 24) = result;
    int v2 = *(_DWORD *)(a2 + 136);
    if ((v2 & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v3 = 0;
  if ((v2 & 0x200) != 0)
  {
LABEL_5:
    double result = *(double *)(a2 + 80);
    v3 |= 0x200u;
    *(_DWORD *)(a1 + 136) = v3;
    *(double *)(a1 + 80) = result;
    int v2 = *(_DWORD *)(a2 + 136);
  }
LABEL_6:
  if ((v2 & 0x4000) != 0)
  {
    double result = *(double *)(a2 + 120);
    v3 |= 0x4000u;
    *(_DWORD *)(a1 + 136) = v3;
    *(double *)(a1 + 120) = result;
    int v2 = *(_DWORD *)(a2 + 136);
    if ((v2 & 0x400) == 0)
    {
LABEL_8:
      if ((v2 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_24;
    }
  }
  else if ((v2 & 0x400) == 0)
  {
    goto LABEL_8;
  }
  double result = *(double *)(a2 + 88);
  v3 |= 0x400u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 88) = result;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x10) == 0)
  {
LABEL_9:
    if ((v2 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  double result = *(double *)(a2 + 40);
  v3 |= 0x10u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 40) = result;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x20) == 0)
  {
LABEL_10:
    if ((v2 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  double result = *(double *)(a2 + 48);
  v3 |= 0x20u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 48) = result;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x80) == 0)
  {
LABEL_11:
    if ((v2 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  double result = *(double *)(a2 + 64);
  v3 |= 0x80u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 64) = result;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x40) == 0)
  {
LABEL_12:
    if ((v2 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  double result = *(double *)(a2 + 56);
  v3 |= 0x40u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 56) = result;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 8) == 0)
  {
LABEL_13:
    if ((v2 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  double result = *(double *)(a2 + 32);
  v3 |= 8u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 32) = result;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x1000) == 0)
  {
LABEL_14:
    if ((v2 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  double result = *(double *)(a2 + 104);
  v3 |= 0x1000u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 104) = result;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x800) == 0)
  {
LABEL_15:
    if ((v2 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  double result = *(double *)(a2 + 96);
  v3 |= 0x800u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 96) = result;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x2000) == 0)
  {
LABEL_16:
    if ((v2 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  double result = *(double *)(a2 + 112);
  v3 |= 0x2000u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 112) = result;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 1) == 0)
  {
LABEL_17:
    if ((v2 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }
LABEL_32:
  double result = *(double *)(a2 + 8);
  v3 |= 1u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 8) = result;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x8000) == 0)
  {
LABEL_18:
    if ((v2 & 0x10000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_34;
  }
LABEL_33:
  int v5 = *(_DWORD *)(a2 + 128);
  v3 |= 0x8000u;
  *(_DWORD *)(a1 + 136) = v3;
  *(_DWORD *)(a1 + 128) = v5;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x10000) == 0)
  {
LABEL_19:
    if ((v2 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_35;
  }
LABEL_34:
  char v6 = *(unsigned char *)(a2 + 132);
  v3 |= 0x10000u;
  *(_DWORD *)(a1 + 136) = v3;
  *(unsigned char *)(a1 + 132) = v6;
  int v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x100) == 0)
  {
LABEL_20:
    if ((v2 & 2) == 0) {
      return result;
    }
LABEL_36:
    double result = *(double *)(a2 + 16);
    *(_DWORD *)(a1 + 136) = v3 | 2;
    *(double *)(a1 + 16) = result;
    return result;
  }
LABEL_35:
  double result = *(double *)(a2 + 72);
  v3 |= 0x100u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 72) = result;
  if ((*(_DWORD *)(a2 + 136) & 2) != 0) {
    goto LABEL_36;
  }
  return result;
}

uint64_t sub_227C84314(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x8000) != 0)
  {
    PB::TextFormatter::format(this, "algorithmType");
    int v5 = *(_DWORD *)(a1 + 136);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "alpha", *(double *)(a1 + 8));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PB::TextFormatter::format(this, "cadence", *(double *)(a1 + 16));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PB::TextFormatter::format(this, "formBasedStartTime", *(double *)(a1 + 24));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PB::TextFormatter::format(this, "grade", *(double *)(a1 + 32));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PB::TextFormatter::format(this, "heightCM", *(double *)(a1 + 40));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PB::TextFormatter::format(this, "horizontalAccelMagnitudeMeanSqrt", *(double *)(a1 + 48));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x10000) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PB::TextFormatter::format(this, "isValid");
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  PB::TextFormatter::format(this, "rotationRateGravityProjectionMax", *(double *)(a1 + 56));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  PB::TextFormatter::format(this, "rotationRateMagnitudeMin", *(double *)(a1 + 64));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  PB::TextFormatter::format(this, "speed", *(double *)(a1 + 72));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  PB::TextFormatter::format(this, "speedBasedStartTime", *(double *)(a1 + 80));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  PB::TextFormatter::format(this, "strideLength", *(double *)(a1 + 88));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x800) == 0)
  {
LABEL_15:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  PB::TextFormatter::format(this, "strideLengthFormBasedCalibrated", *(double *)(a1 + 96));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x1000) == 0)
  {
LABEL_16:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  PB::TextFormatter::format(this, "strideLengthFormBasedUncalibrated", *(double *)(a1 + 104));
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x2000) == 0)
  {
LABEL_17:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  PB::TextFormatter::format(this, "strideLengthSpeedBased", *(double *)(a1 + 112));
  if ((*(_DWORD *)(a1 + 136) & 0x4000) != 0) {
LABEL_18:
  }
    PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 120));
LABEL_19:

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_227C84578(uint64_t a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (2)
    {
      uint64_t v8 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        char v15 = 0;
        unsigned int v16 = 0;
        unint64_t v11 = 0;
        if (v2 > v3) {
          unint64_t v3 = v2;
        }
        while (v3 != v2)
        {
          unint64_t v17 = v2 + 1;
          char v18 = *(unsigned char *)(v8 + v2);
          *((void *)this + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0) {
            goto LABEL_20;
          }
          v15 += 7;
          unint64_t v2 = v17;
          if (v16++ >= 9)
          {
LABEL_19:
            unint64_t v11 = 0;
            goto LABEL_20;
          }
        }
        int v4 = 1;
        *((unsigned char *)this + 24) = 1;
      }
      else
      {
        char v9 = 0;
        unsigned int v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          unint64_t v12 = v2 + 1;
          *((void *)this + 1) = v2 + 1;
          char v13 = *(unsigned char *)(v8 + v2);
          v11 |= (unint64_t)(v13 & 0x7F) << v9;
          if ((v13 & 0x80) == 0) {
            break;
          }
          v9 += 7;
          unint64_t v2 = v12;
          BOOL v14 = v10++ > 8;
          if (v14) {
            goto LABEL_19;
          }
        }
LABEL_20:
        if ((v11 & 7) != 4)
        {
          switch((v11 >> 3))
          {
            case 1u:
              *(_DWORD *)(a1 + 136) |= 4u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 24) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 2u:
              *(_DWORD *)(a1 + 136) |= 0x200u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 80) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 3u:
              *(_DWORD *)(a1 + 136) |= 0x4000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 120) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 4u:
              *(_DWORD *)(a1 + 136) |= 0x400u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 88) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 5u:
              *(_DWORD *)(a1 + 136) |= 0x10u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 40) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 6u:
              *(_DWORD *)(a1 + 136) |= 0x20u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 48) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 7u:
              *(_DWORD *)(a1 + 136) |= 0x80u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 64) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 8u:
              *(_DWORD *)(a1 + 136) |= 0x40u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 56) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 9u:
              *(_DWORD *)(a1 + 136) |= 8u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 32) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 0xAu:
              *(_DWORD *)(a1 + 136) |= 0x1000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 104) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 0xBu:
              *(_DWORD *)(a1 + 136) |= 0x800u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 96) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 0xCu:
              *(_DWORD *)(a1 + 136) |= 0x2000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 112) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 0xDu:
              *(_DWORD *)(a1 + 136) |= 1u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 8) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 0xEu:
              *(_DWORD *)(a1 + 136) |= 0x8000u;
              unint64_t v21 = *((void *)this + 1);
              unint64_t v2 = *((void *)this + 2);
              uint64_t v22 = *(void *)this;
              if (v21 > 0xFFFFFFFFFFFFFFF5 || v21 + 10 > v2)
              {
                char v29 = 0;
                unsigned int v30 = 0;
                uint64_t v25 = 0;
                if (v2 <= v21) {
                  unint64_t v2 = *((void *)this + 1);
                }
                while (1)
                {
                  if (v2 == v21)
                  {
                    LODWORD(v25) = 0;
                    *((unsigned char *)this + 24) = 1;
                    goto LABEL_93;
                  }
                  unint64_t v31 = v21++;
                  char v32 = *(unsigned char *)(v22 + v31);
                  *((void *)this + 1) = v21;
                  v25 |= (unint64_t)(v32 & 0x7F) << v29;
                  if ((v32 & 0x80) == 0) {
                    break;
                  }
                  v29 += 7;
                  BOOL v14 = v30++ > 8;
                  if (v14)
                  {
                    LODWORD(v25) = 0;
LABEL_92:
                    unint64_t v2 = v31 + 1;
                    goto LABEL_93;
                  }
                }
                if (*((unsigned char *)this + 24)) {
                  LODWORD(v25) = 0;
                }
                goto LABEL_92;
              }
              char v23 = 0;
              unsigned int v24 = 0;
              uint64_t v25 = 0;
              do
              {
                unint64_t v2 = v21 + 1;
                *((void *)this + 1) = v21 + 1;
                char v26 = *(unsigned char *)(v22 + v21);
                v25 |= (unint64_t)(v26 & 0x7F) << v23;
                if ((v26 & 0x80) == 0) {
                  goto LABEL_93;
                }
                v23 += 7;
                unint64_t v21 = v2;
                BOOL v14 = v24++ > 8;
              }
              while (!v14);
              LODWORD(v25) = 0;
LABEL_93:
              *(_DWORD *)(a1 + 128) = v25;
LABEL_94:
              unint64_t v3 = *((void *)this + 2);
              int v4 = *((unsigned __int8 *)this + 24);
              if (v2 >= v3 || v4 != 0) {
                return v4 == 0;
              }
              continue;
            case 0xFu:
              *(_DWORD *)(a1 + 136) |= 0x10000u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 >= *((void *)this + 2))
              {
                BOOL v28 = 0;
                *((unsigned char *)this + 24) = 1;
              }
              else
              {
                int v27 = *(unsigned __int8 *)(*(void *)this + v2++);
                *((void *)this + 1) = v2;
                BOOL v28 = v27 != 0;
              }
              *(unsigned char *)(a1 + 132) = v28;
              goto LABEL_94;
            case 0x10u:
              *(_DWORD *)(a1 + 136) |= 0x100u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
                goto LABEL_77;
              }
              *(void *)(a1 + 72) = *(void *)(*(void *)this + v2);
              goto LABEL_88;
            case 0x11u:
              *(_DWORD *)(a1 + 136) |= 2u;
              unint64_t v2 = *((void *)this + 1);
              if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((void *)this + 2))
              {
                *(void *)(a1 + 16) = *(void *)(*(void *)this + v2);
LABEL_88:
                unint64_t v2 = *((void *)this + 1) + 8;
                *((void *)this + 1) = v2;
              }
              else
              {
LABEL_77:
                *((unsigned char *)this + 24) = 1;
              }
              goto LABEL_94;
            default:
              uint64_t result = PB::Reader::skip(this);
              if (!result) {
                return result;
              }
              unint64_t v2 = *((void *)this + 1);
              goto LABEL_94;
          }
        }
        int v4 = 0;
      }
      break;
    }
  }
  return v4 == 0;
}

uint64_t sub_227C84BBC(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 136);
  if ((v4 & 4) != 0)
  {
    uint64_t result = PB::Writer::write(this, *(double *)(result + 24));
    int v4 = *(_DWORD *)(v3 + 136);
    if ((v4 & 0x200) == 0)
    {
LABEL_3:
      if ((v4 & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((v4 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 80));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x4000) == 0)
  {
LABEL_4:
    if ((v4 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 120));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x400) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 88));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 40));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 48));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x80) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 64));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 56));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 8) == 0)
  {
LABEL_10:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 32));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x1000) == 0)
  {
LABEL_11:
    if ((v4 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 104));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x800) == 0)
  {
LABEL_12:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 96));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x2000) == 0)
  {
LABEL_13:
    if ((v4 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 112));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 1) == 0)
  {
LABEL_14:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 8));
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x8000) == 0)
  {
LABEL_15:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t result = PB::Writer::writeVarInt(this);
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x10000) == 0)
  {
LABEL_16:
    if ((v4 & 0x100) == 0) {
      goto LABEL_17;
    }
LABEL_34:
    uint64_t result = PB::Writer::write(this, *(double *)(v3 + 72));
    if ((*(_DWORD *)(v3 + 136) & 2) == 0) {
      return result;
    }
    goto LABEL_35;
  }
LABEL_33:
  uint64_t result = PB::Writer::write(this);
  int v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x100) != 0) {
    goto LABEL_34;
  }
LABEL_17:
  if ((v4 & 2) == 0) {
    return result;
  }
LABEL_35:
  double v5 = *(double *)(v3 + 16);

  return PB::Writer::write(this, v5);
}

uint64_t sub_227C84DD0(uint64_t result)
{
  *(void *)uint64_t result = &unk_26DC288E0;
  *(_DWORD *)(result + 40) = 0;
  return result;
}

void sub_227C84DF8(PB::Base *a1)
{
  PB::Base::~Base(a1);

  JUMPOUT(0x22A6850E0);
}

double sub_227C84E30(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26DC288E0;
  *(_DWORD *)(a1 + 40) = 0;
  char v2 = *(unsigned char *)(a2 + 40);
  if ((v2 & 4) != 0)
  {
    double result = *(double *)(a2 + 24);
    char v3 = 4;
    *(unsigned char *)(a1 + 40) = 4;
    *(double *)(a1 + 24) = result;
    char v2 = *(unsigned char *)(a2 + 40);
    if ((v2 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v3 = 0;
  if ((*(unsigned char *)(a2 + 40) & 8) != 0)
  {
LABEL_5:
    double result = *(double *)(a2 + 32);
    v3 |= 8u;
    *(unsigned char *)(a1 + 40) = v3;
    *(double *)(a1 + 32) = result;
    char v2 = *(unsigned char *)(a2 + 40);
  }
LABEL_6:
  if ((v2 & 1) == 0)
  {
    if ((v2 & 2) == 0) {
      return result;
    }
LABEL_10:
    double result = *(double *)(a2 + 16);
    *(unsigned char *)(a1 + 40) = v3 | 2;
    *(double *)(a1 + 16) = result;
    return result;
  }
  double result = *(double *)(a2 + 8);
  v3 |= 1u;
  *(unsigned char *)(a1 + 40) = v3;
  *(double *)(a1 + 8) = result;
  if ((*(unsigned char *)(a2 + 40) & 2) != 0) {
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_227C84ECC(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  char v5 = *(unsigned char *)(a1 + 40);
  if (v5)
  {
    PB::TextFormatter::format(this, "displacement", *(double *)(a1 + 8));
    char v5 = *(unsigned char *)(a1 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)(a1 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "endTime", *(double *)(a1 + 16));
  char v5 = *(unsigned char *)(a1 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 24));
  if ((*(unsigned char *)(a1 + 40) & 8) != 0) {
LABEL_5:
  }
    PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 32));
LABEL_6:

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_227C84F90(uint64_t a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)this + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        if (v10++ > 8) {
          goto LABEL_19;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 40) |= 4u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_35;
          }
          *(void *)(a1 + 24) = *(void *)(*(void *)this + v2);
          goto LABEL_37;
        case 2u:
          *(unsigned char *)(a1 + 40) |= 8u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_35;
          }
          *(void *)(a1 + 32) = *(void *)(*(void *)this + v2);
          goto LABEL_37;
        case 3u:
          *(unsigned char *)(a1 + 40) |= 1u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_35;
          }
          *(void *)(a1 + 8) = *(void *)(*(void *)this + v2);
          goto LABEL_37;
        case 4u:
          *(unsigned char *)(a1 + 40) |= 2u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((void *)this + 2))
          {
            *(void *)(a1 + 16) = *(void *)(*(void *)this + v2);
LABEL_37:
            unint64_t v2 = *((void *)this + 1) + 8;
            *((void *)this + 1) = v2;
          }
          else
          {
LABEL_35:
            *((unsigned char *)this + 24) = 1;
          }
          break;
        default:
          uint64_t result = PB::Reader::skip(this);
          if (!result) {
            return result;
          }
          unint64_t v2 = *((void *)this + 1);
          break;
      }
      unint64_t v3 = *((void *)this + 2);
      int v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((unsigned char *)this + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        unint64_t v11 = 0;
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_227C85208(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  char v4 = *(unsigned char *)(result + 40);
  if ((v4 & 4) != 0)
  {
    uint64_t result = PB::Writer::write(this, *(double *)(result + 24));
    char v4 = *(unsigned char *)(v3 + 40);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t result = PB::Writer::write(this, *(double *)(v3 + 8));
      if ((*(unsigned char *)(v3 + 40) & 2) == 0) {
        return result;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)(result + 40) & 8) == 0)
  {
    goto LABEL_3;
  }
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 32));
  char v4 = *(unsigned char *)(v3 + 40);
  if (v4) {
    goto LABEL_8;
  }
LABEL_4:
  if ((v4 & 2) == 0) {
    return result;
  }
LABEL_9:
  double v5 = *(double *)(v3 + 16);

  return PB::Writer::write(this, v5);
}

uint64_t sub_227C852B0(uint64_t result)
{
  *(void *)uint64_t result = &unk_26DC28918;
  *(_DWORD *)(result + 212) = 0;
  return result;
}

void sub_227C852D8(PB::Base *a1)
{
  PB::Base::~Base(a1);

  JUMPOUT(0x22A6850E0);
}

uint64_t sub_227C85310(uint64_t result, uint64_t a2)
{
  *(void *)uint64_t result = &unk_26DC28918;
  *(_DWORD *)(result + 212) = 0;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x40000) != 0)
  {
    uint64_t v4 = *(void *)(a2 + 152);
    int v3 = 0x40000;
    *(_DWORD *)(result + 212) = 0x40000;
    *(void *)(result + 152) = v4;
    int v2 = *(_DWORD *)(a2 + 212);
    if ((v2 & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v3 = 0;
  if ((v2 & 0x4000) != 0)
  {
LABEL_5:
    uint64_t v5 = *(void *)(a2 + 120);
    v3 |= 0x4000u;
    *(_DWORD *)(result + 212) = v3;
    *(void *)(result + 120) = v5;
    int v2 = *(_DWORD *)(a2 + 212);
  }
LABEL_6:
  if ((v2 & 0x400) != 0)
  {
    uint64_t v6 = *(void *)(a2 + 88);
    v3 |= 0x400u;
    *(_DWORD *)(result + 212) = v3;
    *(void *)(result + 88) = v6;
    int v2 = *(_DWORD *)(a2 + 212);
    if ((v2 & 0x800) == 0)
    {
LABEL_8:
      if ((v2 & 0x1000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_33;
    }
  }
  else if ((v2 & 0x800) == 0)
  {
    goto LABEL_8;
  }
  uint64_t v7 = *(void *)(a2 + 96);
  v3 |= 0x800u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 96) = v7;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x1000) == 0)
  {
LABEL_9:
    if ((v2 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v8 = *(void *)(a2 + 104);
  v3 |= 0x1000u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 104) = v8;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 2) == 0)
  {
LABEL_10:
    if ((v2 & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v9 = *(void *)(a2 + 16);
  v3 |= 2u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 16) = v9;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x1000000) == 0)
  {
LABEL_11:
    if ((v2 & 0x200000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v10 = *(void *)(a2 + 200);
  v3 |= 0x1000000u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 200) = v10;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x200000) == 0)
  {
LABEL_12:
    if ((v2 & 0x100000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v11 = *(void *)(a2 + 176);
  v3 |= 0x200000u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 176) = v11;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x100000) == 0)
  {
LABEL_13:
    if ((v2 & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v12 = *(void *)(a2 + 168);
  v3 |= 0x100000u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 168) = v12;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x20000) == 0)
  {
LABEL_14:
    if ((v2 & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v13 = *(void *)(a2 + 144);
  v3 |= 0x20000u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 144) = v13;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x8000) == 0)
  {
LABEL_15:
    if ((v2 & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v14 = *(void *)(a2 + 128);
  v3 |= 0x8000u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 128) = v14;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x200) == 0)
  {
LABEL_16:
    if ((v2 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v15 = *(void *)(a2 + 80);
  v3 |= 0x200u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 80) = v15;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x40) == 0)
  {
LABEL_17:
    if ((v2 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v16 = *(void *)(a2 + 56);
  v3 |= 0x40u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 56) = v16;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x20) == 0)
  {
LABEL_18:
    if ((v2 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v17 = *(void *)(a2 + 48);
  v3 |= 0x20u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 48) = v17;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 8) == 0)
  {
LABEL_19:
    if ((v2 & 0x800000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v18 = *(void *)(a2 + 32);
  v3 |= 8u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 32) = v18;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x800000) == 0)
  {
LABEL_20:
    if ((v2 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v19 = *(void *)(a2 + 192);
  v3 |= 0x800000u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 192) = v19;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x10) == 0)
  {
LABEL_21:
    if ((v2 & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v20 = *(void *)(a2 + 40);
  v3 |= 0x10u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 40) = v20;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x2000) == 0)
  {
LABEL_22:
    if ((v2 & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v21 = *(void *)(a2 + 112);
  v3 |= 0x2000u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 112) = v21;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x100) == 0)
  {
LABEL_23:
    if ((v2 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v22 = *(void *)(a2 + 72);
  v3 |= 0x100u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 72) = v22;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x10000) == 0)
  {
LABEL_24:
    if ((v2 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v23 = *(void *)(a2 + 136);
  v3 |= 0x10000u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 136) = v23;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x80) == 0)
  {
LABEL_25:
    if ((v2 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v24 = *(void *)(a2 + 64);
  v3 |= 0x80u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 64) = v24;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 4) == 0)
  {
LABEL_26:
    if ((v2 & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v25 = *(void *)(a2 + 24);
  v3 |= 4u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 24) = v25;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 1) == 0)
  {
LABEL_27:
    if ((v2 & 0x400000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v26 = *(void *)(a2 + 8);
  v3 |= 1u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 8) = v26;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x400000) == 0)
  {
LABEL_28:
    if ((v2 & 0x80000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v27 = *(void *)(a2 + 184);
  v3 |= 0x400000u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 184) = v27;
  int v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x80000) == 0)
  {
LABEL_29:
    if ((v2 & 0x2000000) == 0) {
      return result;
    }
LABEL_54:
    char v29 = *(unsigned char *)(a2 + 208);
    *(_DWORD *)(result + 212) = v3 | 0x2000000;
    *(unsigned char *)(result + 208) = v29;
    return result;
  }
LABEL_53:
  uint64_t v28 = *(void *)(a2 + 160);
  v3 |= 0x80000u;
  *(_DWORD *)(result + 212) = v3;
  *(void *)(result + 160) = v28;
  if ((*(_DWORD *)(a2 + 212) & 0x2000000) != 0) {
    goto LABEL_54;
  }
  return result;
}

uint64_t sub_227C85614(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  int v5 = *(_DWORD *)(a1 + 212);
  if (v5)
  {
    PB::TextFormatter::format(this, "centerOfMassAccelZAmplitudeBackwards", *(double *)(a1 + 8));
    int v5 = *(_DWORD *)(a1 + 212);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "height", *(double *)(a1 + 16));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  PB::TextFormatter::format(this, "integratedAngleYg", *(double *)(a1 + 24));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  PB::TextFormatter::format(this, "integratedAngleYgBackwards", *(double *)(a1 + 32));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  PB::TextFormatter::format(this, "integratedCenterOfAccelZMaxBackwards", *(double *)(a1 + 40));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_37;
  }
LABEL_36:
  PB::TextFormatter::format(this, "integratedRotationAxisWZ", *(double *)(a1 + 48));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  PB::TextFormatter::format(this, "integratedRotationAxisWZForwards", *(double *)(a1 + 56));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  PB::TextFormatter::format(this, "integratedRotationRateYBackwards", *(double *)(a1 + 64));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  PB::TextFormatter::format(this, "integratedUserAccelTForwards", *(double *)(a1 + 72));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  PB::TextFormatter::format(this, "integratedUserAccelY", *(double *)(a1 + 80));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  PB::TextFormatter::format(this, "integratedVelocityZ", *(double *)(a1 + 88));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  PB::TextFormatter::format(this, "integratedVelocityZBackwards", *(double *)(a1 + 96));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  PB::TextFormatter::format(this, "integratedVelocityZForwards", *(double *)(a1 + 104));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  PB::TextFormatter::format(this, "isValidPeak");
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x2000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  PB::TextFormatter::format(this, "medianCadence", *(double *)(a1 + 112));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x4000) == 0)
  {
LABEL_17:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  PB::TextFormatter::format(this, "peakTime", *(double *)(a1 + 120));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x8000) == 0)
  {
LABEL_18:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  PB::TextFormatter::format(this, "rotationAxisWTAmplitudeXForwards", *(double *)(a1 + 128));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x10000) == 0)
  {
LABEL_19:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  PB::TextFormatter::format(this, "rotationRateMaxZForwards", *(double *)(a1 + 136));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x20000) == 0)
  {
LABEL_20:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  PB::TextFormatter::format(this, "rotationTMaxZForwards", *(double *)(a1 + 144));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x40000) == 0)
  {
LABEL_21:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 152));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x80000) == 0)
  {
LABEL_22:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  PB::TextFormatter::format(this, "strideLengthCadence", *(double *)(a1 + 160));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x100000) == 0)
  {
LABEL_23:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  PB::TextFormatter::format(this, "swingAccelAmplitudeYBackwards", *(double *)(a1 + 168));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x200000) == 0)
  {
LABEL_24:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  PB::TextFormatter::format(this, "swingAccelMeanXBackwards", *(double *)(a1 + 176));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x400000) == 0)
  {
LABEL_25:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  PB::TextFormatter::format(this, "swingAccelTZMean", *(double *)(a1 + 184));
  int v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x800000) == 0)
  {
LABEL_26:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_55:
  PB::TextFormatter::format(this, "userAccelTMeanXBackards", *(double *)(a1 + 192));
  if ((*(_DWORD *)(a1 + 212) & 0x1000000) != 0) {
LABEL_27:
  }
    PB::TextFormatter::format(this, "weight", *(double *)(a1 + 200));
LABEL_28:

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_227C85998(uint64_t a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)this + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        if (v10++ > 8) {
          goto LABEL_19;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *(_DWORD *)(a1 + 212) |= 0x40000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 152) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 2u:
          *(_DWORD *)(a1 + 212) |= 0x4000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 120) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 3u:
          *(_DWORD *)(a1 + 212) |= 0x400u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 88) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 4u:
          *(_DWORD *)(a1 + 212) |= 0x800u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 96) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 5u:
          *(_DWORD *)(a1 + 212) |= 0x1000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 104) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 6u:
          *(_DWORD *)(a1 + 212) |= 2u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 16) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 7u:
          *(_DWORD *)(a1 + 212) |= 0x1000000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 200) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 8u:
          *(_DWORD *)(a1 + 212) |= 0x200000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 176) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 9u:
          *(_DWORD *)(a1 + 212) |= 0x100000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 168) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0xAu:
          *(_DWORD *)(a1 + 212) |= 0x20000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 144) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0xBu:
          *(_DWORD *)(a1 + 212) |= 0x8000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 128) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0xCu:
          *(_DWORD *)(a1 + 212) |= 0x200u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 80) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0xDu:
          *(_DWORD *)(a1 + 212) |= 0x40u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 56) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0xEu:
          *(_DWORD *)(a1 + 212) |= 0x20u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 48) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0xFu:
          *(_DWORD *)(a1 + 212) |= 8u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 32) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0x10u:
          *(_DWORD *)(a1 + 212) |= 0x800000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 192) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0x11u:
          *(_DWORD *)(a1 + 212) |= 0x10u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 40) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0x12u:
          *(_DWORD *)(a1 + 212) |= 0x2000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 112) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0x13u:
          *(_DWORD *)(a1 + 212) |= 0x100u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 72) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0x14u:
          *(_DWORD *)(a1 + 212) |= 0x10000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 136) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0x15u:
          *(_DWORD *)(a1 + 212) |= 0x80u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 64) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0x16u:
          *(_DWORD *)(a1 + 212) |= 4u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 24) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0x17u:
          *(_DWORD *)(a1 + 212) |= 1u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 8) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0x18u:
          *(_DWORD *)(a1 + 212) |= 0x400000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2)) {
            goto LABEL_100;
          }
          *(void *)(a1 + 184) = *(void *)(*(void *)this + v2);
          goto LABEL_104;
        case 0x19u:
          *(_DWORD *)(a1 + 212) |= 0x80000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((void *)this + 2))
          {
LABEL_100:
            *((unsigned char *)this + 24) = 1;
          }
          else
          {
            *(void *)(a1 + 160) = *(void *)(*(void *)this + v2);
LABEL_104:
            unint64_t v2 = *((void *)this + 1) + 8;
            *((void *)this + 1) = v2;
          }
          break;
        case 0x1Au:
          *(_DWORD *)(a1 + 212) |= 0x2000000u;
          unint64_t v2 = *((void *)this + 1);
          if (v2 >= *((void *)this + 2))
          {
            BOOL v21 = 0;
            *((unsigned char *)this + 24) = 1;
          }
          else
          {
            int v20 = *(unsigned __int8 *)(*(void *)this + v2++);
            *((void *)this + 1) = v2;
            BOOL v21 = v20 != 0;
          }
          *(unsigned char *)(a1 + 208) = v21;
          break;
        default:
          uint64_t result = PB::Reader::skip(this);
          if (!result) {
            return result;
          }
          unint64_t v2 = *((void *)this + 1);
          break;
      }
      unint64_t v3 = *((void *)this + 2);
      int v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((unsigned char *)this + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        unint64_t v11 = 0;
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_227C86140(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 212);
  if ((v4 & 0x40000) != 0)
  {
    uint64_t result = PB::Writer::write(this, *(double *)(result + 152));
    int v4 = *(_DWORD *)(v3 + 212);
    if ((v4 & 0x4000) == 0)
    {
LABEL_3:
      if ((v4 & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((v4 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 120));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x400) == 0)
  {
LABEL_4:
    if ((v4 & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 88));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x800) == 0)
  {
LABEL_5:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 96));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x1000) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 104));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 2) == 0)
  {
LABEL_7:
    if ((v4 & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 16));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 200));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x200000) == 0)
  {
LABEL_9:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 176));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x100000) == 0)
  {
LABEL_10:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 168));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x20000) == 0)
  {
LABEL_11:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 144));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x8000) == 0)
  {
LABEL_12:
    if ((v4 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 128));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x200) == 0)
  {
LABEL_13:
    if ((v4 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 80));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x40) == 0)
  {
LABEL_14:
    if ((v4 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 56));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x20) == 0)
  {
LABEL_15:
    if ((v4 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 48));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 8) == 0)
  {
LABEL_16:
    if ((v4 & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 32));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x800000) == 0)
  {
LABEL_17:
    if ((v4 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 192));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x10) == 0)
  {
LABEL_18:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 40));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x2000) == 0)
  {
LABEL_19:
    if ((v4 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 112));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x100) == 0)
  {
LABEL_20:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 72));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x10000) == 0)
  {
LABEL_21:
    if ((v4 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 136));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x80) == 0)
  {
LABEL_22:
    if ((v4 & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 64));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 4) == 0)
  {
LABEL_23:
    if ((v4 & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 24));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 1) == 0)
  {
LABEL_24:
    if ((v4 & 0x400000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 8));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x400000) == 0)
  {
LABEL_25:
    if ((v4 & 0x80000) == 0) {
      goto LABEL_26;
    }
LABEL_52:
    uint64_t result = PB::Writer::write(this, *(double *)(v3 + 160));
    if ((*(_DWORD *)(v3 + 212) & 0x2000000) == 0) {
      return result;
    }
    goto LABEL_53;
  }
LABEL_51:
  uint64_t result = PB::Writer::write(this, *(double *)(v3 + 184));
  int v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x80000) != 0) {
    goto LABEL_52;
  }
LABEL_26:
  if ((v4 & 0x2000000) == 0) {
    return result;
  }
LABEL_53:

  return PB::Writer::write(this);
}

uint64_t sub_227C86450(uint64_t *a1, void *a2)
{
  uint64_t result = sub_227C864C8((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_227C864C8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v8 = (void *)(a7 - 8);
    char v9 = (void *)(a7 - 8);
    do
    {
      uint64_t v10 = *--a3;
      *a3 = 0;
      *v9-- = v10;
      *((void *)&v16 + 1) = v8;
      v7 -= 8;
      uint64_t v8 = v9;
    }
    while (a3 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  sub_227C86560((uint64_t)v13);
  return v11;
}

uint64_t sub_227C86560(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_227B8BD38((void *)a1);
  }
  return a1;
}

float sub_227C86598(float *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v3 = *(_OWORD *)(a2 + 32);
  v8[0] = *(_OWORD *)(a2 + 16);
  v8[1] = v3;
  long long v4 = *(_OWORD *)(a2 + 64);
  v8[2] = *(_OWORD *)(a2 + 48);
  v8[3] = v4;
  v8[4] = *(_OWORD *)(a2 + 80);
  int v9 = *(_DWORD *)(a2 + 96);
  sub_227CA17FC((float *)v8, word_227CC57A4, 21);
  sub_227CA1820((float *)v8, v12, (uint64_t)&unk_227CC57CE, 1, 21, 0xAuLL);
  sub_227CA1820(v12, v11, (uint64_t)&unk_227CC5986, 1, 10, 0xAuLL);
  sub_227CA1820(v11, v10, (uint64_t)&unk_227CC5A62, 1, 10, 0xAuLL);
  sub_227CA1820(v10, &v7, (uint64_t)&unk_227CC5B3E, 0, 10, 1uLL);
  float v5 = v7;
  if (v7 <= 0.15) {
    float v5 = 0.0;
  }
  *a1 = fminf(v5, 3.5);
  sub_227CA1820((float *)v8, v12, (uint64_t)&unk_227CC5778, 0, 21, 1uLL);
  float result = fminf(fmaxf(v12[0] + (float)(v7 * -0.19324), 0.0225), 12.25);
  a1[1] = result;
  return result;
}

float sub_227C87074(int a1, unint64_t a2, float a3)
{
  float result = a3 / (float)((float)((float)a1 * 0.25) / (float)(int)(a2 >> 1));
  if (result > (float)((int)a2 - 1)) {
    return (float)((int)a2 - 1);
  }
  return result;
}

uint64_t sub_227C870A4(uint64_t a1)
{
  *(void *)(a1 + 144) = a1 + 152;
  *(void *)(a1 + 8) = 256;
  *(_DWORD *)a1 = 8;
  int32x2_t v2 = (int32x2_t)0x100000000;
  uint64_t v3 = 152;
  float64x2_t v11 = (float64x2_t)vdupq_n_s64(0x3F80000000000000uLL);
  float64x2_t v12 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
  do
  {
    int32x2_t v4 = vneg_s32(v2);
    v5.i64[0] = v4.i32[0];
    v5.i64[1] = v4.i32[1];
    float32x2_t v6 = vcvt_f32_f64(vmulq_f64(vmulq_f64(vcvtq_f64_s64(v5), v12), v11));
    float v13 = v6.f32[0];
    __float2 v7 = __sincosf_stret(v6.f32[1]);
    __float2 v8 = __sincosf_stret(v13);
    v14.val[1] = (float32x2_t)__PAIR64__(LODWORD(v7.__sinval), LODWORD(v8.__sinval));
    v14.val[0] = (float32x2_t)__PAIR64__(LODWORD(v7.__cosval), LODWORD(v8.__cosval));
    int v9 = (float *)(a1 + v3);
    vst2_f32(v9, v14);
    int32x2_t v2 = vadd_s32(v2, (int32x2_t)0x200000002);
    v3 += 16;
  }
  while (v3 != 2200);
  sub_227C87198(256, (int *)(a1 + 16));
  return a1;
}

uint64_t sub_227C87198(uint64_t result, int *a2)
{
  float v2 = sqrtf((float)(int)result);
  int v3 = 4;
  do
  {
    while ((int)result % v3)
    {
      int v4 = v3 + 2;
      if (v3 == 2) {
        int v4 = 3;
      }
      if (v3 == 4) {
        int v3 = 2;
      }
      else {
        int v3 = v4;
      }
      if (v2 < (float)v3) {
        int v3 = result;
      }
    }
    float result = ((int)result / v3);
    *a2 = v3;
    a2[1] = result;
    a2 += 2;
  }
  while ((int)result > 1);
  return result;
}

void sub_227C871F4(uint64_t a1, _DWORD *a2, unsigned __int16 *a3)
{
  v14[255] = *MEMORY[0x263EF8340];
  int64x2_t v5 = (int *)(a1 + 8);
  bzero(&v13, 8 * *(int *)(a1 + 8));
  sub_227C872D8(&v13, a3, 0, 1, 1u, v5 + 2, (uint64_t)v5);
  *a2 = 0;
  unint64_t v6 = *v5;
  if ((int)v6 >= 4)
  {
    unint64_t v7 = v6 >> 1;
    float v8 = (float)(int)v6;
    int v9 = (float *)(a2 + 1);
    uint64_t v10 = (float32x2_t *)v14;
    unint64_t v11 = v7 - 1;
    do
    {
      float32x2_t v12 = *v10++;
      *v9++ = sqrtf(vaddv_f32(vmul_f32(v12, v12)) / v8);
      --v11;
    }
    while (v11);
  }
}

void sub_227C872D8(float *a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, unsigned int a5, int *a6, uint64_t a7)
{
  int v9 = a1;
  uint64_t v77 = *MEMORY[0x263EF8340];
  int v10 = a6[1];
  uint64_t v11 = v10 * *a6;
  int v72 = *a6;
  if (v10 == 1)
  {
    int v12 = a4 * a5;
    uint64_t v13 = 8 * v11;
    float32x2x2_t v14 = a1;
    do
    {
      *float32x2x2_t v14 = *(float *)sub_227C8764C(a2, (int)a3);
      v14 += 2;
      LODWORD(a3) = a3 + v12;
      v13 -= 8;
    }
    while (v13);
  }
  else
  {
    unint64_t v15 = 0;
    long long v16 = a6 + 2;
    uint64_t v17 = *a6 * a4;
    int v18 = a4 * a5;
    uint64_t v19 = 8 * v11;
    do
    {
      sub_227C872D8(&v9[v15 / 4], a2, a3, v17, a5, v16, a7);
      a3 = (a3 + v18);
      v15 += 8 * v10;
    }
    while (v19 != v15);
  }
  if (v72 == 2)
  {
    char v60 = (float *)(*(void *)(a7 + 136) + 4);
    uint64_t v61 = 2 * v10;
    do
    {
      unsigned int v62 = &v9[v61];
      float v63 = *(v60 - 1);
      float v64 = v9[v61];
      float v65 = v9[v61 + 1];
      float v66 = (float)(v64 * v63) - (float)(v65 * *v60);
      float v67 = (float)(v63 * v65) + (float)(v64 * *v60);
      float v68 = v9[1] - v67;
      *unsigned int v62 = *v9 - v66;
      v62[1] = v68;
      float v69 = v67 + v9[1];
      *int v9 = v66 + *v9;
      v9[1] = v69;
      v9 += 2;
      v60 += 2 * a4;
      --v10;
    }
    while (v10);
  }
  else
  {
    uint64_t v20 = v10;
    if (v72 == 4)
    {
      uint64_t v21 = 2 * v10;
      uint64_t v22 = v9 + 1;
      uint64_t v23 = (float *)(*(void *)(a7 + 136) + 4);
      uint64_t v24 = 4 * v10;
      int v25 = *(_DWORD *)(a7 + 4);
      uint64_t v26 = 6 * v10;
      uint64_t v27 = v23;
      uint64_t v28 = v23;
      do
      {
        char v29 = &v22[v21];
        float v30 = *(v23 - 1);
        float v31 = v22[v21 - 1];
        float v32 = v22[2 * v10];
        float v33 = (float)(v31 * v30) - (float)(v32 * *v23);
        float v34 = (float)(v30 * v32) + (float)(v31 * *v23);
        char v35 = &v22[v24];
        float v36 = *(v27 - 1);
        float v37 = v22[v24 - 1];
        float v38 = v22[4 * v10];
        float v39 = (float)(v37 * v36) - (float)(v38 * *v27);
        float v40 = (float)(v36 * v38) + (float)(v37 * *v27);
        char v41 = &v22[v26];
        float v42 = *(v28 - 1);
        float v43 = v22[v26 - 1];
        float v44 = v22[6 * v10];
        float v45 = (float)(v43 * v42) - (float)(v44 * *v28);
        float v46 = (float)(v42 * v44) + (float)(v43 * *v28);
        float v47 = *(v22 - 1);
        float v48 = v47 - v39;
        float v49 = *v22 - v40;
        float v50 = v39 + v47;
        float v51 = v40 + *v22;
        *(v22 - 1) = v50;
        *uint64_t v22 = v51;
        float v52 = v34 + v46;
        float v53 = v33 - v45;
        float v54 = v34 - v46;
        *(v35 - 1) = v50 - (float)(v33 + v45);
        *char v35 = v51 - v52;
        float v55 = v52 + *v22;
        *(v22 - 1) = (float)(v33 + v45) + *(v22 - 1);
        *uint64_t v22 = v55;
        if (v25)
        {
          float v56 = v48 + v54;
          float v57 = v49 - v53;
          float v58 = v48 - v54;
          float v59 = v49 + v53;
        }
        else
        {
          float v58 = v48 + v54;
          float v59 = v49 - v53;
          float v56 = v48 - v54;
          float v57 = v49 + v53;
        }
        v22[2 * v10] = v59;
        v22[6 * v10] = v57;
        v22 += 2;
        v28 += 6 * a4;
        *(v29 - 1) = v58;
        v27 += 4 * a4;
        v23 += 2 * a4;
        *(v41 - 1) = v56;
        --v20;
      }
      while (v20);
    }
    else
    {
      if (qword_2681B9AA0 != -1) {
        dispatch_once(&qword_2681B9AA0, &unk_26DC29468);
      }
      unsigned int v70 = qword_2681B9AA8;
      if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v76 = v72;
        _os_log_impl(&dword_227B19000, v70, OS_LOG_TYPE_FAULT, "Error in FFT,p,%d", buf, 8u);
      }
    }
  }
}

os_log_t sub_227C8761C()
{
  os_log_t result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_2681B9AA8 = (uint64_t)result;
  return result;
}

uint64_t sub_227C8764C(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29468);
    }
    unint64_t v7 = qword_2681B9AA8;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  unint64_t v5 = *a1 + a2;
  if (v5 >= v4) {
    unint64_t v4 = v4;
  }
  else {
    unint64_t v4 = 0;
  }
  return (uint64_t)&a1[2 * (v5 - v4) + 4];
}

uint64_t sub_227C87764(uint64_t a1)
{
  uint64_t v2 = 0;
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + 16) = 0x10000000000;
  *(_DWORD *)(a1 + 12) = 1031798784;
  *(unsigned char *)(a1 + 1048) = 1;
  *(void *)(a1 + 1064) = 0x10000000000;
  *(_DWORD *)(a1 + 1060) = 1031798784;
  *(unsigned char *)(a1 + 2096) = 1;
  *(void *)(a1 + 2112) = 0x10000000000;
  *(_DWORD *)(a1 + 2108) = 1031798784;
  *(unsigned char *)(a1 + 3144) = 1;
  *(void *)(a1 + 3160) = 0x10000000000;
  *(_DWORD *)(a1 + 3156) = 1031798784;
  *(unsigned char *)(a1 + 4192) = 1;
  *(void *)(a1 + 4208) = 0x10000000000;
  *(_DWORD *)(a1 + 4204) = 1031798784;
  *(unsigned char *)(a1 + 5240) = 1;
  *(void *)(a1 + 5256) = 0x10000000000;
  *(unsigned char *)(a1 + 6288) = 1;
  *(_DWORD *)(a1 + 5252) = 1031798784;
  *(void *)(a1 + 6304) = 0x10000000000;
  *(_DWORD *)(a1 + 6300) = 1031798784;
  *(unsigned char *)(a1 + 7336) = 1;
  *(void *)(a1 + 7352) = 0x10000000000;
  *(_DWORD *)(a1 + 7348) = 1031798784;
  *(unsigned char *)(a1 + 8384) = 1;
  *(void *)(a1 + 8400) = 0x10000000000;
  *(_DWORD *)(a1 + 8396) = 1031798784;
  *(unsigned char *)(a1 + 9432) = 1;
  *(void *)(a1 + 9448) = 0x10000000000;
  *(_DWORD *)(a1 + 9444) = 1031798784;
  *(unsigned char *)(a1 + 10480) = 1;
  *(void *)(a1 + 10496) = 0x10000000000;
  *(_DWORD *)(a1 + 10492) = 1031798784;
  *(unsigned char *)(a1 + 11528) = 1;
  *(void *)(a1 + 11544) = 0x10000000000;
  *(unsigned char *)(a1 + 12576) = 1;
  *(_DWORD *)(a1 + 11540) = 1031798784;
  *(void *)(a1 + 12592) = 0x10000000000;
  *(_DWORD *)(a1 + 12588) = 1031798784;
  *(unsigned char *)(a1 + 13624) = 1;
  *(void *)(a1 + 13640) = 0x10000000000;
  *(_DWORD *)(a1 + 13636) = 1031798784;
  *(unsigned char *)(a1 + 14672) = 1;
  *(void *)(a1 + 14688) = 0x10000000000;
  *(_DWORD *)(a1 + 14684) = 1031798784;
  *(void *)(a1 + 15720) = 0x10000000000;
  *(void *)(a1 + 19824) = 0;
  *(void *)(a1 + 19832) = 0x7F00000000;
  *(_OWORD *)(a1 + 20096) = 0u;
  *(_OWORD *)(a1 + 20112) = 0u;
  *(void *)(a1 + 20128) = 0;
  *(_DWORD *)(a1 + 20136) = 1065353216;
  *(void *)(a1 + 20140) = 0;
  *(void *)(a1 + 20148) = 0;
  *(_DWORD *)(a1 + 20156) = 1065353216;
  *(unsigned char *)(a1 + 20160) = 0;
  uint64_t v3 = a1 + 20184;
  *(void *)(a1 + 20164) = 0;
  *(void *)(a1 + 20172) = 0;
  *(void *)(a1 + 20184) = 2;
  uint64_t v4 = 20236;
  *(void *)(a1 + 20192) = 0;
  do
  {
    *(_DWORD *)(a1 + v4) = dword_227CC5BC4[v2++];
    v4 -= 4;
  }
  while (v2 != 5);
  uint64_t v5 = 0;
  *(float *)(a1 + 20224) = -*(float *)(a1 + 20224);
  *(float *)(a1 + 20232) = -*(float *)(a1 + 20232);
  *(_OWORD *)(a1 + 20240) = *(_OWORD *)(a1 + 20220);
  *(_OWORD *)(a1 + 20256) = xmmword_227CC5BB0;
  uint64_t v6 = 20308;
  do
  {
    *(_DWORD *)(a1 + v6) = dword_227CC5BC4[v5++];
    v6 -= 4;
  }
  while (v5 != 5);
  *(float *)(a1 + 20296) = -*(float *)(a1 + 20296);
  *(float *)(a1 + 20304) = -*(float *)(a1 + 20304);
  *(_OWORD *)(a1 + 20312) = *(_OWORD *)(a1 + 20292);
  sub_227CA4A94((uint64_t *)(a1 + 20328), (uint64_t)&off_264830490);
  sub_227CA4A94((uint64_t *)(a1 + 20392), (uint64_t)&off_264830490);
  sub_227CA4A94((uint64_t *)(a1 + 20456), (uint64_t)&off_264830490);
  uint64_t v7 = 0;
  char v8 = 1;
  do
  {
    char v9 = v8;
    unint64_t v10 = (float *)(v3 + 72 * v7);
    uint64_t v11 = 4;
    do
    {
      sub_227C89E78(v10, 0.0);
      --v11;
    }
    while (v11);
    char v8 = 0;
    uint64_t v7 = 1;
  }
  while ((v9 & 1) != 0);
  return a1;
}

unsigned __int16 *sub_227C87A10(unsigned __int16 *result, unsigned __int16 *a2)
{
  unint64_t v2 = *((unsigned int *)result + 1);
  unint64_t v3 = *result + (unint64_t)result[1];
  if (v3 >= v2) {
    uint64_t v4 = *((unsigned int *)result + 1);
  }
  else {
    uint64_t v4 = 0;
  }
  result[v3 - v4 + 4] = *a2;
  unsigned int v5 = result[1];
  if (v2 <= v5)
  {
    unint64_t v6 = *result + 1;
    if (v6 < v2) {
      LOWORD(v2) = 0;
    }
    *os_log_t result = v6 - v2;
  }
  else
  {
    result[1] = v5 + 1;
  }
  return result;
}

uint64_t sub_227C87A6C(uint64_t a1)
{
  v1 = (unsigned __int16 *)(a1 + 19834);
  if (*(_DWORD *)(a1 + 19836) != *(unsigned __int16 *)(a1 + 19834)) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 19824);
  if (*(_WORD *)(a1 + 19834))
  {
    unint64_t v3 = 0;
    uint64_t v4 = (unsigned __int16 *)(a1 + 19832);
    do
      v2 -= *(unsigned __int16 *)sub_227C87AEC(v4, v3++);
    while (v3 < *v1);
  }
  return v2;
}

uint64_t sub_227C87AEC(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29488);
    }
    uint64_t v7 = qword_2681B9AA8;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  unint64_t v5 = *a1 + a2;
  if (v5 >= v4) {
    unint64_t v4 = v4;
  }
  else {
    unint64_t v4 = 0;
  }
  return (uint64_t)&a1[v5 - v4 + 4];
}

BOOL sub_227C87C04(uint64_t a1)
{
  return *(_DWORD *)(a1 + 20) == *(unsigned __int16 *)(a1 + 18)
      && *(_DWORD *)(a1 + 1068) == *(unsigned __int16 *)(a1 + 1066)
      && *(_DWORD *)(a1 + 2116) == *(unsigned __int16 *)(a1 + 2114)
      && *(_DWORD *)(a1 + 3164) == *(unsigned __int16 *)(a1 + 3162)
      && *(_DWORD *)(a1 + 4212) == *(unsigned __int16 *)(a1 + 4210)
      && *(_DWORD *)(a1 + 5260) == *(unsigned __int16 *)(a1 + 5258)
      && *(_DWORD *)(a1 + 6308) == *(unsigned __int16 *)(a1 + 6306)
      && *(_DWORD *)(a1 + 7356) == *(unsigned __int16 *)(a1 + 7354)
      && *(_DWORD *)(a1 + 8404) == *(unsigned __int16 *)(a1 + 8402)
      && *(_DWORD *)(a1 + 9452) == *(unsigned __int16 *)(a1 + 9450)
      && *(_DWORD *)(a1 + 10500) == *(unsigned __int16 *)(a1 + 10498)
      && *(_DWORD *)(a1 + 11548) == *(unsigned __int16 *)(a1 + 11546)
      && *(_DWORD *)(a1 + 15724) == *(unsigned __int16 *)(a1 + 15722)
      && *(_DWORD *)(a1 + 19836) == *(unsigned __int16 *)(a1 + 19834);
}

unsigned __int16 *sub_227C87D00(uint64_t a1, uint64_t a2)
{
  float v4 = sub_227CA4F74((float *)a2, *(float *)(a2 + 28), *(float *)(a2 + 32), *(float *)(a2 + 36));
  int v6 = v5;
  int v8 = v7;
  float v9 = sub_227CA4F74((float *)a2, *(float *)(a2 + 16), *(float *)(a2 + 20), *(float *)(a2 + 24));
  uint64_t v12 = *(unsigned __int16 *)(a1 + 16);
  uint64_t v13 = *(unsigned __int16 *)(a1 + 18);
  unint64_t v14 = *(unsigned int *)(a1 + 20);
  if (v12 + v13 >= v14) {
    uint64_t v15 = *(unsigned int *)(a1 + 20);
  }
  else {
    uint64_t v15 = 0;
  }
  *(float *)(a1 + 16 + 4 * (v12 + v13 - v15) + 8) = v9;
  if (v14 <= v13)
  {
    unint64_t v16 = v12 + 1;
    if (v16 < v14) {
      LOWORD(v14) = 0;
    }
    *(_WORD *)(a1 + 16) = v16 - v14;
  }
  else
  {
    *(_WORD *)(a1 + 18) = v13 + 1;
  }
  *(unsigned char *)a1 = 1;
  uint64_t v17 = *(unsigned __int16 *)(a1 + 1066);
  unint64_t v18 = *(unsigned int *)(a1 + 1068);
  uint64_t v19 = *(unsigned __int16 *)(a1 + 1064);
  if (v19 + v17 >= v18) {
    uint64_t v20 = *(unsigned int *)(a1 + 1068);
  }
  else {
    uint64_t v20 = 0;
  }
  *(_DWORD *)(a1 + 1064 + 4 * (v19 + v17 - v20) + 8) = v10;
  if (v18 <= v17)
  {
    if (v19 + 1 < v18) {
      LOWORD(v18) = 0;
    }
    *(_WORD *)(a1 + 1064) = v19 + 1 - v18;
  }
  else
  {
    *(_WORD *)(a1 + 1066) = v17 + 1;
  }
  *(unsigned char *)(a1 + 1048) = 1;
  uint64_t v21 = *(unsigned __int16 *)(a1 + 2114);
  unint64_t v22 = *(unsigned int *)(a1 + 2116);
  uint64_t v23 = *(unsigned __int16 *)(a1 + 2112);
  if (v23 + v21 >= v22) {
    uint64_t v24 = *(unsigned int *)(a1 + 2116);
  }
  else {
    uint64_t v24 = 0;
  }
  *(_DWORD *)(a1 + 2112 + 4 * (v23 + v21 - v24) + 8) = v11;
  if (v22 <= v21)
  {
    if (v23 + 1 < v22) {
      LOWORD(v22) = 0;
    }
    *(_WORD *)(a1 + 2112) = v23 + 1 - v22;
  }
  else
  {
    *(_WORD *)(a1 + 2114) = v21 + 1;
  }
  *(unsigned char *)(a1 + 2096) = 1;
  uint64_t v25 = *(unsigned __int16 *)(a1 + 3162);
  unint64_t v26 = *(unsigned int *)(a1 + 3164);
  uint64_t v27 = *(unsigned __int16 *)(a1 + 3160);
  if (v27 + v25 >= v26) {
    uint64_t v28 = *(unsigned int *)(a1 + 3164);
  }
  else {
    uint64_t v28 = 0;
  }
  *(_DWORD *)(a1 + 3160 + 4 * (v27 + v25 - v28) + 8) = *(_DWORD *)(a2 + 16);
  if (v26 <= v25)
  {
    if (v27 + 1 < v26) {
      LOWORD(v26) = 0;
    }
    *(_WORD *)(a1 + 3160) = v27 + 1 - v26;
  }
  else
  {
    *(_WORD *)(a1 + 3162) = v25 + 1;
  }
  *(unsigned char *)(a1 + 3144) = 1;
  uint64_t v29 = *(unsigned __int16 *)(a1 + 4210);
  unint64_t v30 = *(unsigned int *)(a1 + 4212);
  uint64_t v31 = *(unsigned __int16 *)(a1 + 4208);
  if (v31 + v29 >= v30) {
    uint64_t v32 = *(unsigned int *)(a1 + 4212);
  }
  else {
    uint64_t v32 = 0;
  }
  *(_DWORD *)(a1 + 4208 + 4 * (v31 + v29 - v32) + 8) = *(_DWORD *)(a2 + 20);
  if (v30 <= v29)
  {
    if (v31 + 1 < v30) {
      LOWORD(v30) = 0;
    }
    *(_WORD *)(a1 + 4208) = v31 + 1 - v30;
  }
  else
  {
    *(_WORD *)(a1 + 4210) = v29 + 1;
  }
  *(unsigned char *)(a1 + 4192) = 1;
  uint64_t v33 = *(unsigned __int16 *)(a1 + 5258);
  unint64_t v34 = *(unsigned int *)(a1 + 5260);
  uint64_t v35 = *(unsigned __int16 *)(a1 + 5256);
  if (v35 + v33 >= v34) {
    uint64_t v36 = *(unsigned int *)(a1 + 5260);
  }
  else {
    uint64_t v36 = 0;
  }
  *(_DWORD *)(a1 + 5256 + 4 * (v35 + v33 - v36) + 8) = *(_DWORD *)(a2 + 24);
  if (v34 <= v33)
  {
    if (v35 + 1 < v34) {
      LOWORD(v34) = 0;
    }
    *(_WORD *)(a1 + 5256) = v35 + 1 - v34;
  }
  else
  {
    *(_WORD *)(a1 + 5258) = v33 + 1;
  }
  *(unsigned char *)(a1 + 5240) = 1;
  uint64_t v37 = *(unsigned __int16 *)(a1 + 6306);
  unint64_t v38 = *(unsigned int *)(a1 + 6308);
  uint64_t v39 = *(unsigned __int16 *)(a1 + 6304);
  if (v39 + v37 >= v38) {
    uint64_t v40 = *(unsigned int *)(a1 + 6308);
  }
  else {
    uint64_t v40 = 0;
  }
  *(float *)(a1 + 6304 + 4 * (v39 + v37 - v40) + 8) = v4;
  if (v38 <= v37)
  {
    if (v39 + 1 < v38) {
      LOWORD(v38) = 0;
    }
    *(_WORD *)(a1 + 6304) = v39 + 1 - v38;
  }
  else
  {
    *(_WORD *)(a1 + 6306) = v37 + 1;
  }
  *(unsigned char *)(a1 + 6288) = 1;
  uint64_t v41 = *(unsigned __int16 *)(a1 + 7354);
  unint64_t v42 = *(unsigned int *)(a1 + 7356);
  uint64_t v43 = *(unsigned __int16 *)(a1 + 7352);
  if (v43 + v41 >= v42) {
    uint64_t v44 = *(unsigned int *)(a1 + 7356);
  }
  else {
    uint64_t v44 = 0;
  }
  *(_DWORD *)(a1 + 7352 + 4 * (v43 + v41 - v44) + 8) = v6;
  if (v42 <= v41)
  {
    if (v43 + 1 < v42) {
      LOWORD(v42) = 0;
    }
    *(_WORD *)(a1 + 7352) = v43 + 1 - v42;
  }
  else
  {
    *(_WORD *)(a1 + 7354) = v41 + 1;
  }
  *(unsigned char *)(a1 + 7336) = 1;
  uint64_t v45 = *(unsigned __int16 *)(a1 + 8402);
  unint64_t v46 = *(unsigned int *)(a1 + 8404);
  uint64_t v47 = *(unsigned __int16 *)(a1 + 8400);
  if (v47 + v45 >= v46) {
    uint64_t v48 = *(unsigned int *)(a1 + 8404);
  }
  else {
    uint64_t v48 = 0;
  }
  *(_DWORD *)(a1 + 4 * (v47 + v45 - v48) + 8408) = v8;
  if (v46 <= v45)
  {
    if (v47 + 1 < v46) {
      LOWORD(v46) = 0;
    }
    *(_WORD *)(a1 + 8400) = v47 + 1 - v46;
  }
  else
  {
    *(_WORD *)(a1 + 8402) = v45 + 1;
  }
  *(unsigned char *)(a1 + 8384) = 1;
  uint64_t v49 = *(unsigned __int16 *)(a1 + 9450);
  unint64_t v50 = *(unsigned int *)(a1 + 9452);
  uint64_t v51 = *(unsigned __int16 *)(a1 + 9448);
  if (v51 + v49 >= v50) {
    uint64_t v52 = *(unsigned int *)(a1 + 9452);
  }
  else {
    uint64_t v52 = 0;
  }
  *(_DWORD *)(a1 + 4 * (v51 + v49 - v52) + 9456) = *(_DWORD *)(a2 + 28);
  if (v50 <= v49)
  {
    if (v51 + 1 < v50) {
      LOWORD(v50) = 0;
    }
    *(_WORD *)(a1 + 9448) = v51 + 1 - v50;
  }
  else
  {
    *(_WORD *)(a1 + 9450) = v49 + 1;
  }
  *(unsigned char *)(a1 + 9432) = 1;
  uint64_t v53 = *(unsigned __int16 *)(a1 + 10498);
  unint64_t v54 = *(unsigned int *)(a1 + 10500);
  uint64_t v55 = *(unsigned __int16 *)(a1 + 10496);
  if (v55 + v53 >= v54) {
    uint64_t v56 = *(unsigned int *)(a1 + 10500);
  }
  else {
    uint64_t v56 = 0;
  }
  *(_DWORD *)(a1 + 4 * (v55 + v53 - v56) + 10504) = *(_DWORD *)(a2 + 32);
  if (v54 <= v53)
  {
    if (v55 + 1 < v54) {
      LOWORD(v54) = 0;
    }
    *(_WORD *)(a1 + 10496) = v55 + 1 - v54;
  }
  else
  {
    *(_WORD *)(a1 + 10498) = v53 + 1;
  }
  *(unsigned char *)(a1 + 10480) = 1;
  uint64_t v57 = *(unsigned __int16 *)(a1 + 11546);
  unint64_t v58 = *(unsigned int *)(a1 + 11548);
  uint64_t v59 = *(unsigned __int16 *)(a1 + 11544);
  if (v59 + v57 >= v58) {
    uint64_t v60 = *(unsigned int *)(a1 + 11548);
  }
  else {
    uint64_t v60 = 0;
  }
  *(_DWORD *)(a1 + 4 * (v59 + v57 - v60) + 11552) = *(_DWORD *)(a2 + 36);
  if (v58 <= v57)
  {
    if (v59 + 1 < v58) {
      LOWORD(v58) = 0;
    }
    *(_WORD *)(a1 + 11544) = v59 + 1 - v58;
  }
  else
  {
    *(_WORD *)(a1 + 11546) = v57 + 1;
  }
  *(unsigned char *)(a1 + 11528) = 1;
  os_log_t result = sub_227C88228((unsigned __int16 *)(a1 + 15720), (_OWORD *)a2);
  uint64_t v62 = *(void *)(a2 + 40);
  uint64_t v63 = *(void *)(a1 + 19824);
  if (v63)
  {
    unint64_t v64 = v62 - v63;
    if (v64 >> 16) {
      LOWORD(v64) = 10000;
    }
    unsigned __int16 v65 = v64;
    os_log_t result = sub_227C87A10((unsigned __int16 *)(a1 + 19832), &v65);
  }
  *(void *)(a1 + 19824) = v62;
  return result;
}

unsigned __int16 *sub_227C88228(unsigned __int16 *result, _OWORD *a2)
{
  unint64_t v2 = *((unsigned int *)result + 1);
  unint64_t v3 = *result + (unint64_t)result[1];
  if (v3 < v2) {
    unint64_t v2 = 0;
  }
  *(_OWORD *)&result[8 * (v3 - v2) + 4] = *a2;
  unsigned int v4 = result[1];
  unint64_t v5 = *((unsigned int *)result + 1);
  if (v5 <= v4)
  {
    unint64_t v6 = *result + 1;
    if (v6 < v5) {
      LOWORD(v5) = 0;
    }
    *os_log_t result = v6 - v5;
  }
  else
  {
    result[1] = v4 + 1;
  }
  return result;
}

float sub_227C88288(uint64_t a1, int a2, float *a3, int a4)
{
  if (sub_227C87C04(a1))
  {
    if (a2)
    {
      sub_227C88380((unsigned __int16 *)a1, a3);
      sub_227C8857C((unsigned __int16 *)a1, a3);
      if (*(_DWORD *)(a1 + 12596) == *(unsigned __int16 *)(a1 + 12594)
        && *(_DWORD *)(a1 + 13644) == *(unsigned __int16 *)(a1 + 13642)
        && *(_DWORD *)(a1 + 14692) == *(unsigned __int16 *)(a1 + 14690))
      {
        sub_227C88834((unsigned __int16 *)a1, a3);
      }
    }
    else if (!a4)
    {
      return result;
    }
    sub_227C88AE8();
    return sub_227C88FC4();
  }
  return result;
}

float sub_227C88380(unsigned __int16 *a1, float *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  sub_227C871F0((uint64_t)v23);
  sub_227C871F4((uint64_t)v23, v26, a1 + 1580);
  sub_227C871F0((uint64_t)v23);
  sub_227C871F4((uint64_t)v23, v25, a1 + 2104);
  sub_227C871F0((uint64_t)v23);
  sub_227C871F4((uint64_t)v23, v24, a1 + 2628);
  float v4 = 0.0;
  for (uint64_t i = 2; i != 127; ++i)
    float v4 = v4 + *(float *)&v26[i];
  float v6 = 0.0;
  for (uint64_t j = 2; j != 127; ++j)
    float v6 = v6 + *(float *)&v25[j];
  float v8 = 0.0;
  for (uint64_t k = 2; k != 127; ++k)
    float v8 = v8 + *(float *)&v24[k];
  float v10 = 0.0;
  for (uint64_t m = 3; m != 11; ++m)
    float v10 = v10 + *(float *)&v26[m];
  float v12 = 0.0;
  for (uint64_t n = 3; n != 11; ++n)
    float v12 = v12 + *(float *)&v25[n];
  float v14 = 0.0;
  for (iuint64_t i = 3; ii != 11; ++ii)
    float v14 = v14 + *(float *)&v24[ii];
  float v16 = 0.0;
  for (juint64_t j = 2; jj != 13; ++jj)
    float v16 = v16 + *(float *)&v26[jj];
  float v18 = 0.0;
  for (kuint64_t k = 2; kk != 13; ++kk)
    float v18 = v18 + *(float *)&v25[kk];
  float v20 = 0.0;
  for (muint64_t m = 2; mm != 13; ++mm)
    float v20 = v20 + *(float *)&v24[mm];
  float result = (float)(v4 + v6) + v8;
  *a2 = (float)((float)(v16 + v18) + v20) / result;
  a2[15] = result;
  a2[2] = (float)((float)(v10 + v12) + v14) / result;
  return result;
}

float sub_227C8857C(unsigned __int16 *a1, float *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  sub_227C871F0((uint64_t)v32);
  sub_227C871F4((uint64_t)v32, v35, a1 + 4724);
  sub_227C871F0((uint64_t)v32);
  sub_227C871F4((uint64_t)v32, v34, a1 + 5248);
  sub_227C871F0((uint64_t)v32);
  sub_227C871F4((uint64_t)v32, v33, a1 + 5772);
  float v4 = 0.0;
  for (uint64_t i = 2; i != 127; ++i)
    float v4 = v4 + *(float *)&v35[i];
  float v6 = 0.0;
  for (uint64_t j = 2; j != 127; ++j)
    float v6 = v6 + *(float *)&v34[j];
  float v8 = 0.0;
  for (uint64_t k = 2; k != 127; ++k)
    float v8 = v8 + *(float *)&v33[k];
  float v10 = 0.0;
  for (uint64_t m = 3; m != 11; ++m)
    float v10 = v10 + *(float *)&v35[m];
  float v12 = 0.0;
  for (uint64_t n = 3; n != 11; ++n)
    float v12 = v12 + *(float *)&v34[n];
  float v14 = 0.0;
  for (iuint64_t i = 3; ii != 11; ++ii)
    float v14 = v14 + *(float *)&v33[ii];
  float v16 = 0.0;
  for (juint64_t j = 2; jj != 13; ++jj)
    float v16 = v16 + *(float *)&v35[jj];
  float v18 = 0.0;
  for (kuint64_t k = 2; kk != 13; ++kk)
    float v18 = v18 + *(float *)&v34[kk];
  float v20 = 0.0;
  for (muint64_t m = 2; mm != 13; ++mm)
    float v20 = v20 + *(float *)&v33[mm];
  float v22 = 0.0;
  do
    float v22 = v22 + *(float *)&v35[mm++];
  while (mm != 39);
  float v23 = 0.0;
  do
    float v23 = v23 + *(float *)&v35[mm++];
  while (mm != 64);
  float v24 = 0.0;
  for (nuint64_t n = 39; nn != 64; ++nn)
    float v24 = v24 + *(float *)&v34[nn];
  float v26 = 0.0;
  for (uint64_t i1 = 39; i1 != 64; ++i1)
    float v26 = v26 + *(float *)&v33[i1];
  float v28 = 0.0;
  for (uint64_t i2 = 89; i2 != 127; ++i2)
    float v28 = v28 + *(float *)&v35[i2];
  float result = (float)(v4 + v6) + v8;
  float v31 = (float)(v10 + v12) + v14;
  a2[16] = result;
  a2[20] = (float)((float)(v16 + v18) + v20) / result;
  a2[21] = (float)((float)(v23 + v24) + v26) / result;
  a2[7] = v31 / result;
  a2[8] = v31;
  a2[29] = v28;
  a2[32] = v22;
  a2[43] = v31 / result;
  a2[48] = v28;
  a2[53] = v22;
  return result;
}

void sub_227C88834(unsigned __int16 *a1, float *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v31[0] = 0x300000000;
  sub_227C871F0((uint64_t)v35);
  sub_227C871F4((uint64_t)v35, v34, a1 + 6296);
  sub_227C871F0((uint64_t)v35);
  sub_227C871F4((uint64_t)v35, v33, a1 + 6820);
  sub_227C871F0((uint64_t)v35);
  sub_227C871F4((uint64_t)v35, v32, a1 + 7344);
  for (unint64_t i = 0; i != 128; ++i)
  {
    float v6 = (float)(v34[i] + v33[i]) + v32[i];
    unsigned int v7 = WORD1(v31[0]);
    unint64_t v8 = HIDWORD(v31[0]);
    uint64_t v9 = LOWORD(v31[0]);
    unint64_t v10 = LOWORD(v31[0]) + (unint64_t)WORD1(v31[0]);
    if (v10 >= HIDWORD(v31[0])) {
      uint64_t v11 = HIDWORD(v31[0]);
    }
    else {
      uint64_t v11 = 0;
    }
    *((float *)&v31[1] + v10 - v11) = v6;
    if (v8 <= v7)
    {
      if (v9 + 1 < v8) {
        LOWORD(v8) = 0;
      }
      LOWORD(v31[0]) = v9 + 1 - v8;
    }
    else
    {
      WORD1(v31[0]) = v7 + 1;
    }
    if (i >= 2)
    {
      *(void *)unint64_t v30 = 0x300000000;
      sub_227C896B0((uint64_t)v30, (uint64_t)v31);
      float v6 = sub_227C897E4(v30);
    }
    v35[i] = v6;
  }
  unsigned __int8 v12 = 0;
  uint64_t v13 = 0;
  float v14 = -3.4028e38;
  do
  {
    if (v35[v13] > v14)
    {
      unsigned __int8 v12 = v13;
      float v14 = v35[v13];
    }
    ++v13;
  }
  while (v13 != 128);
  float v15 = 0.0;
  float v17 = sub_227C894F0(0.0, 50.0, 100.0, v4, (uint64_t)v35);
  for (uint64_t j = 0; j != 127; ++j)
    float v15 = v15 + v35[j];
  for (uint64_t k = 0; k != 10; ++k)
  {
    float v20 = (float)(5 * k);
    float v21 = (float)(5 * k + 5);
    signed int v22 = vcvtps_s32_f32(v20 / 0.3937);
    int v23 = vcvtps_s32_f32(v21 / 0.3937);
    if (v23 >= 128) {
      int v23 = 128;
    }
    float v24 = 0.0;
    if (v23 > v22)
    {
      uint64_t v25 = v23 - (uint64_t)v22;
      float v26 = &v35[v22];
      do
      {
        float v27 = *v26++;
        float v24 = v24 + v27;
        --v25;
      }
      while (v25);
    }
    float v28 = &a2[3 * k];
    v28[59] = v24;
    v28[60] = v24 / v15;
    v28[61] = sub_227C894F0(v20, v21, 100.0, v16, (uint64_t)v35);
  }
  float v29 = (double)v12 * 0.390625;
  a2[55] = v14;
  a2[56] = v29;
  a2[57] = v17;
  a2[58] = v15;
}

float sub_227C88AE8()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  unsigned int v7 = (unsigned __int16 *)v0;
  uint64_t v48 = *MEMORY[0x263EF8340];
  sub_227C871F0((uint64_t)v47);
  sub_227C871F4((uint64_t)v47, v46, v7 + 8);
  sub_227C871F0((uint64_t)v47);
  sub_227C871F4((uint64_t)v47, v45, v7 + 532);
  sub_227C871F0((uint64_t)v47);
  sub_227C871F4((uint64_t)v47, v44, v7 + 1056);
  if (v6)
  {
    float v8 = 0.0;
    for (uint64_t i = 2; i != 127; ++i)
      float v8 = v8 + *(float *)&v46[i];
    float v10 = 0.0;
    for (uint64_t j = 2; j != 127; ++j)
      float v10 = v10 + *(float *)&v45[j];
    float v12 = 0.0;
    for (uint64_t k = 2; k != 127; ++k)
      float v12 = v12 + *(float *)&v44[k];
    uint64_t v14 = 0;
    float v15 = 0.0;
    do
    {
      float v15 = v15 + *(float *)&v44[v14 + 3];
      ++v14;
    }
    while (v14 != 8);
    float v16 = v8 + v10;
    float v17 = 0.0;
    for (uint64_t m = 2; m != 13; ++m)
      float v17 = v17 + *(float *)&v46[m];
    float v19 = 0.0;
    for (uint64_t n = 2; n != 13; ++n)
      float v19 = v19 + *(float *)&v45[n];
    float v21 = 0.0;
    for (iuint64_t i = 2; ii != 13; ++ii)
      float v21 = v21 + *(float *)&v44[ii];
    uint64_t v23 = 0;
    float v24 = v17 + v19;
    float v25 = 0.0;
    float v26 = v24 / v16;
    do
    {
      float v25 = v25 + *(float *)&v46[v23 + 13];
      ++v23;
    }
    while (v23 != 26);
    uint64_t v27 = 0;
    float v28 = 0.0;
    float v29 = v15 / v12;
    do
    {
      float v28 = v28 + *(float *)&v45[v27 + 13];
      ++v27;
    }
    while (v27 != 26);
    v4[13] = v16;
    v4[9] = v21 / v12;
    v4[17] = v29;
    v4[18] = v26;
    float v30 = (float)(v25 + v28) / v16;
    v4[30] = v30;
    v4[49] = v30;
    v4[51] = v26;
  }
  for (juint64_t j = 0; jj != 128; jj += 4)
  {
    *(float32x4_t *)&v47[jj] = vaddq_f32(vmulq_f32(*(float32x4_t *)&v46[jj], *(float32x4_t *)&v46[jj]), vmulq_f32(*(float32x4_t *)&v45[jj], *(float32x4_t *)&v45[jj]));
    *(float32x4_t *)&v43[jj * 4] = vmulq_f32(*(float32x4_t *)&v44[jj], *(float32x4_t *)&v44[jj]);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9BA8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9BA8))
  {
    qword_2681B9BA0 = vcvtas_u32_f32(sub_227C87074(100, 0x80uLL, 0.5));
    __cxa_guard_release(&qword_2681B9BA8);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9BB8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9BB8))
  {
    qword_2681B9BB0 = vcvtas_u32_f32(sub_227C87074(100, 0x80uLL, 3.5));
    __cxa_guard_release(&qword_2681B9BB8);
  }
  unint64_t v32 = qword_2681B9BA0;
  unint64_t v33 = qword_2681B9BB0;
  if (qword_2681B9BA0 <= (unint64_t)qword_2681B9BB0)
  {
    float v35 = 0.0;
    unint64_t v36 = qword_2681B9BA0;
    do
      float v35 = v35 + v47[v36++];
    while (v36 <= qword_2681B9BB0);
    v2[17] = sqrtf(v35);
    float v34 = 0.0;
    do
      float v34 = v34 + *(float *)&v43[4 * v32++];
    while (v32 <= v33);
  }
  else
  {
    v2[17] = 0.0;
    float v34 = 0.0;
  }
  v2[19] = sqrtf(v34);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9BC8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9BC8))
  {
    qword_2681B9BC0 = (unint64_t)(float)(roundf(sub_227C87074(100, 0x80uLL, 3.5)) + 1.0);
    __cxa_guard_release(&qword_2681B9BC8);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9BD8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9BD8))
  {
    qword_2681B9BD0 = vcvtas_u32_f32(sub_227C87074(100, 0x80uLL, 20.0));
    __cxa_guard_release(&qword_2681B9BD8);
  }
  unint64_t v37 = qword_2681B9BC0;
  unint64_t v38 = qword_2681B9BD0;
  if (qword_2681B9BC0 <= (unint64_t)qword_2681B9BD0)
  {
    float v40 = 0.0;
    unint64_t v41 = qword_2681B9BC0;
    do
      float v40 = v40 + v47[v41++];
    while (v41 <= qword_2681B9BD0);
    v2[18] = sqrtf(v40);
    float v39 = 0.0;
    do
      float v39 = v39 + *(float *)&v43[4 * v37++];
    while (v37 <= v38);
  }
  else
  {
    v2[18] = 0.0;
    float v39 = 0.0;
  }
  float result = sqrtf(v39);
  v2[20] = result;
  return result;
}

void sub_227C88F74(_Unwind_Exception *a1)
{
}

float sub_227C88FC4()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  unsigned int v7 = (unsigned __int16 *)v0;
  uint64_t v50 = *MEMORY[0x263EF8340];
  sub_227C871F0((uint64_t)v49);
  sub_227C871F4((uint64_t)v49, v48, v7 + 3152);
  sub_227C871F0((uint64_t)v49);
  sub_227C871F4((uint64_t)v49, v47, v7 + 3676);
  sub_227C871F0((uint64_t)v49);
  sub_227C871F4((uint64_t)v49, v46, v7 + 4200);
  if (v6)
  {
    float v8 = 0.0;
    for (uint64_t i = 2; i != 127; ++i)
      float v8 = v8 + *(float *)&v48[i];
    float v10 = 0.0;
    for (uint64_t j = 2; j != 127; ++j)
      float v10 = v10 + *(float *)&v47[j];
    float v12 = 0.0;
    for (uint64_t k = 2; k != 127; ++k)
      float v12 = v12 + *(float *)&v46[k];
    uint64_t v14 = 0;
    float v15 = 0.0;
    do
    {
      float v15 = v15 + *(float *)&v48[v14 + 3];
      ++v14;
    }
    while (v14 != 8);
    uint64_t v16 = 0;
    float v17 = 0.0;
    do
    {
      float v17 = v17 + *(float *)&v47[v16 + 3];
      ++v16;
    }
    while (v16 != 8);
    uint64_t v18 = 0;
    float v19 = 0.0;
    do
    {
      float v19 = v19 + *(float *)&v46[v18 + 3];
      ++v18;
    }
    while (v18 != 8);
    float v20 = v15 + v17;
    float v21 = 0.0;
    uint64_t v22 = 2;
    float v23 = v19 / v12;
    do
      float v21 = v21 + *(float *)&v48[v22++];
    while (v22 != 13);
    float v24 = v8 + v10;
    float v25 = 0.0;
    for (uint64_t m = 2; m != 13; ++m)
      float v25 = v25 + *(float *)&v47[m];
    float v27 = 0.0;
    for (uint64_t n = 2; n != 13; ++n)
      float v27 = v27 + *(float *)&v46[n];
    uint64_t v29 = 0;
    float v30 = v21 + v25;
    float v31 = 0.0;
    do
    {
      float v31 = v31 + *(float *)&v46[v29 + 89];
      ++v29;
    }
    while (v29 != 38);
    float v32 = v19 / v20;
    v4[19] = v24;
    v4[6] = v20 / v24;
    v4[3] = v12;
    v4[10] = v23;
    v4[11] = v30 / v24;
    v4[33] = v27;
    v4[31] = v31;
    v4[26] = v32;
    v4[38] = v27;
    v4[39] = v31;
    v4[40] = (float)(v12 - v27) - v31;
    v4[45] = v32;
    v4[52] = v31;
    v4[54] = v27;
  }
  for (iuint64_t i = 0; ii != 128; ii += 4)
  {
    *(float32x4_t *)&v49[ii] = vaddq_f32(vmulq_f32(*(float32x4_t *)&v48[ii], *(float32x4_t *)&v48[ii]), vmulq_f32(*(float32x4_t *)&v47[ii], *(float32x4_t *)&v47[ii]));
    *(float32x4_t *)&v45[ii * 4] = vmulq_f32(*(float32x4_t *)&v46[ii], *(float32x4_t *)&v46[ii]);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9BE8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9BE8))
  {
    qword_2681B9BE0 = vcvtas_u32_f32(sub_227C87074(100, 0x80uLL, 0.5));
    __cxa_guard_release(&qword_2681B9BE8);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9BF8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9BF8))
  {
    qword_2681B9BF0 = vcvtas_u32_f32(sub_227C87074(100, 0x80uLL, 3.5));
    __cxa_guard_release(&qword_2681B9BF8);
  }
  unint64_t v34 = qword_2681B9BE0;
  unint64_t v35 = qword_2681B9BF0;
  if (qword_2681B9BE0 <= (unint64_t)qword_2681B9BF0)
  {
    float v37 = 0.0;
    unint64_t v38 = qword_2681B9BE0;
    do
      float v37 = v37 + v49[v38++];
    while (v38 <= qword_2681B9BF0);
    v2[21] = sqrtf(v37);
    float v36 = 0.0;
    do
      float v36 = v36 + *(float *)&v45[4 * v34++];
    while (v34 <= v35);
  }
  else
  {
    v2[21] = 0.0;
    float v36 = 0.0;
  }
  v2[23] = sqrtf(v36);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9C08, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9C08))
  {
    qword_2681B9C00 = (unint64_t)(float)(roundf(sub_227C87074(100, 0x80uLL, 3.5)) + 1.0);
    __cxa_guard_release(&qword_2681B9C08);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9C18, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9C18))
  {
    qword_2681B9C10 = vcvtas_u32_f32(sub_227C87074(100, 0x80uLL, 20.0));
    __cxa_guard_release(&qword_2681B9C18);
  }
  unint64_t v39 = qword_2681B9C00;
  unint64_t v40 = qword_2681B9C10;
  if (qword_2681B9C00 <= (unint64_t)qword_2681B9C10)
  {
    float v42 = 0.0;
    unint64_t v43 = qword_2681B9C00;
    do
      float v42 = v42 + v49[v43++];
    while (v43 <= qword_2681B9C10);
    v2[22] = sqrtf(v42);
    float v41 = 0.0;
    do
      float v41 = v41 + *(float *)&v45[4 * v39++];
    while (v39 <= v40);
  }
  else
  {
    v2[22] = 0.0;
    float v41 = 0.0;
  }
  float result = sqrtf(v41);
  v2[24] = result;
  return result;
}

void sub_227C894A0(_Unwind_Exception *a1)
{
}

float sub_227C894F0(float a1, float a2, float a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  float v5 = (float)(a3 * 0.5) / 127.0;
  unsigned int v6 = vcvtps_s32_f32(a1 / v5);
  memset(v18, 0, sizeof(v18));
  unsigned int v7 = vcvtps_s32_f32(a2 / v5);
  float v8 = 0.0;
  if (v6 < v7)
  {
    unint64_t v9 = (int)v6;
    unint64_t v10 = (int)v7;
    float v11 = 0.0;
    unint64_t v12 = (int)v6;
    do
    {
      float v13 = *(float *)(a5 + 4 * v12) * *(float *)(a5 + 4 * v12);
      *((float *)v18 + v12) = v13;
      float v11 = v11 + v13;
      ++v12;
    }
    while (v12 < v10);
    float v8 = 0.0;
    if (v11 != 0.0 && v6 < v10)
    {
      unint64_t v15 = (int)v6;
      do
      {
        *((float *)v18 + v15) = *((float *)v18 + v15) / v11;
        ++v15;
      }
      while (v15 < v10);
      if (v6 < v10)
      {
        float v8 = 0.0;
        do
        {
          float v16 = *((float *)v18 + v9);
          if (v16 != 0.0) {
            float v8 = v8 - (float)(v16 * logf(*((float *)v18 + v9)));
          }
          ++v9;
        }
        while (v9 < v10);
      }
    }
  }
  return v8;
}

unsigned __int16 *sub_227C8965C(unsigned __int16 *result, _DWORD *a2)
{
  uint64_t v2 = result[1];
  unint64_t v3 = *((unsigned int *)result + 1);
  uint64_t v4 = *result;
  if (v4 + v2 >= v3) {
    uint64_t v5 = *((unsigned int *)result + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  *(_DWORD *)&result[2 * (v4 + v2 - v5) + 4] = *a2;
  if (v3 <= v2)
  {
    if (v4 + 1 < v3) {
      LOWORD(v3) = 0;
    }
    *float result = v4 + 1 - v3;
  }
  else
  {
    result[1] = v2 + 1;
  }
  return result;
}

void sub_227C896B0(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(_DWORD *)a1 = 0;
  if (*(_DWORD *)(a2 + 4) != *(_DWORD *)(a1 + 4))
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29488);
    }
    unsigned int v6 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = *(unsigned int *)(a1 + 4);
      uint64_t v8 = *(unsigned int *)(a2 + 4);
      int v9 = 134218240;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      _os_log_impl(&dword_227B19000, v6, OS_LOG_TYPE_FAULT, "Assertion failed: rhs.capacity() == capacity(), file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 70,capacity,%zu,%zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (*(_WORD *)(a2 + 2))
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = (_DWORD *)sub_227C8764C((unsigned __int16 *)a2, v4);
      sub_227C8965C((unsigned __int16 *)a1, v5);
      ++v4;
    }
    while (v4 < *(unsigned __int16 *)(a2 + 2));
  }
}

float sub_227C897E4(unsigned __int16 *a1)
{
  unsigned int v1 = a1[1];
  if (!a1[1]) {
    return 0.0;
  }
  if (v1 == 1) {
    return *(float *)sub_227C8764C(a1, 0);
  }
  double v4 = sub_227C89F18(a1, v1 >> 1);
  float v3 = *(float *)&v4;
  if ((v1 & 1) == 0)
  {
    double v5 = sub_227C89F18(a1, (v1 >> 1) - 1);
    return (float)(v3 + *(float *)&v5) * 0.5;
  }
  return v3;
}

BOOL sub_227C89874(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 20096) + 1;
  *(void *)(a1 + 20096) = v1;
  if ((v1 & 3) != 0) {
    return 0;
  }
  BOOL result = sub_227C87C04(a1);
  if (result)
  {
    *(void *)(a1 + 20096) = 0;
    return 1;
  }
  return result;
}

void sub_227C898C0(uint64_t a1, float *a2)
{
  *(void *)a2 = *(void *)(a1 + 19824);
  uint64_t v4 = sub_227C87A6C(a1);
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  float v9 = 0.0;
  float v10 = 0.0;
  float v11 = 0.0;
  *((void *)a2 + 1) = v4;
  float v12 = 0.0;
  float v13 = 0.0;
  float v71 = 0.0;
  float v72 = 0.0;
  uint64_t v60 = (unsigned __int16 *)(a1 + 6304);
  float v73 = 0.0;
  float v74 = 0.0;
  unint64_t v58 = a2;
  uint64_t v59 = (unsigned __int16 *)(a1 + 7352);
  uint64_t v14 = (unsigned __int16 *)(a1 + 8400);
  float v75 = 0.0;
  float v76 = 0.0;
  float v15 = 0.0;
  float v16 = (unsigned __int16 *)(a1 + 16);
  float v17 = (unsigned __int16 *)(a1 + 1064);
  uint64_t v18 = (unsigned __int16 *)(a1 + 2112);
  uint64_t v19 = (unsigned __int16 *)(a1 + 15720);
  unint64_t v20 = 1;
  float v21 = 0.0;
  float v22 = 0.0;
  float v23 = 0.0;
  float v24 = 0.0;
  float v25 = 0.0;
  float v26 = 0.0;
  do
  {
    float v67 = v22;
    float v68 = v12;
    float v69 = v10;
    float v70 = v15;
    float v66 = *(float *)sub_227C8764C(v60, v5);
    float v65 = *(float *)sub_227C8764C(v59, v5);
    float v64 = *(float *)sub_227C8764C(v14, v5);
    float v63 = *(float *)sub_227C8764C(v16, v5);
    float v62 = *(float *)sub_227C8764C(v17, v5);
    float v61 = *(float *)sub_227C8764C(v18, v5);
    float v27 = (float *)sub_227C89D30(v19, v5);
    float v28 = sub_227CA4D2C(v27);
    ++v8;
    __float2 v29 = __sincosf_stret(v28);
    float v75 = v75 + v29.__cosval;
    float v76 = v76 + v29.__sinval;
    float v30 = (float *)sub_227C89D30(v19, v5);
    float v31 = sub_227CA4D70(v30);
    ++v7;
    __float2 v32 = __sincosf_stret(v31);
    float v73 = v73 + v32.__cosval;
    float v74 = v74 + v32.__sinval;
    unint64_t v33 = (float *)sub_227C89D30(v19, v5);
    float v34 = sub_227CA4D88(v33);
    ++v6;
    __float2 v35 = __sincosf_stret(v34);
    float v71 = v71 + v35.__cosval;
    float v72 = v72 + v35.__sinval;
    float v36 = v66 - v9;
    float v9 = v9 + (float)((float)(v66 - v9) / (float)v20);
    float v10 = v69 + (float)(v36 * (float)(v66 - v9));
    float v37 = v65 - v11;
    float v11 = v11 + (float)((float)(v65 - v11) / (float)v20);
    float v12 = v68 + (float)(v37 * (float)(v65 - v11));
    float v38 = v64 - v13;
    float v13 = v13 + (float)((float)(v64 - v13) / (float)v20);
    float v26 = v26 + (float)(v38 * (float)(v64 - v13));
    float v39 = v63 - v25;
    float v25 = v25 + (float)((float)(v63 - v25) / (float)v20);
    float v24 = v24 + (float)(v39 * (float)(v63 - v25));
    float v40 = v62 - v23;
    float v23 = v23 + (float)((float)(v62 - v23) / (float)v20);
    float v22 = v67 + (float)(v40 * (float)(v62 - v23));
    float v41 = v61 - v21;
    float v21 = v21 + (float)((float)(v61 - v21) / (float)v20);
    float v15 = v70 + (float)(v41 * (float)(v61 - v21));
    v5 += 5;
    ++v20;
  }
  while (v5 != 260);
  v58[4] = sqrtf((float)(v11 * v11) + (float)(v9 * v9));
  v58[5] = v13;
  v58[6] = sqrtf((float)(v10 / 51.0) + (float)(v12 / 51.0));
  v58[7] = sqrtf(v26 / 51.0);
  v58[8] = sqrtf((float)(v25 * v25) + (float)(v23 * v23));
  v58[9] = v21;
  v58[10] = sqrtf((float)(v24 / 51.0) + (float)(v22 / 51.0));
  v58[11] = sqrtf(v15 / 51.0);
  if (v7)
  {
    v58[12] = atan2f(v74, v73);
    float v42 = 0.0;
    float v44 = v75;
    float v43 = v76;
    if (v7 != 1)
    {
      float v45 = logf(fmaxf((float)((float)(v73 * v73) + (float)(v74 * v74)) / (float)(unint64_t)(v7 * v7), 0.00000011921));
      float v46 = -v45;
      BOOL v47 = v45 < 0.0;
      float v48 = 0.0;
      if (v47) {
        float v48 = v46;
      }
      float v42 = sqrtf(v48);
    }
  }
  else
  {
    v58[12] = 0.0;
    float v42 = 0.0;
    float v44 = v75;
    float v43 = v76;
  }
  v58[14] = v42;
  if (v8)
  {
    float v49 = atan2f(v43, v44);
    if (v49 <= 0.0) {
      float v49 = -v49;
    }
    v58[13] = v49;
    float v50 = 0.0;
    if (v8 != 1)
    {
      float v51 = logf(fmaxf((float)((float)(v44 * v44) + (float)(v43 * v43)) / (float)(unint64_t)(v8 * v8), 0.00000011921));
      float v52 = -v51;
      BOOL v47 = v51 < 0.0;
      float v53 = 0.0;
      if (v47) {
        float v53 = v52;
      }
      float v50 = sqrtf(v53);
    }
  }
  else
  {
    v58[13] = -0.0;
    float v50 = 0.0;
  }
  v58[15] = v50;
  float v54 = 0.0;
  if (v6 >= 2)
  {
    float v55 = logf(fmaxf((float)((float)(v71 * v71) + (float)(v72 * v72)) / (float)(v6 * v6), 0.00000011921));
    float v56 = -v55;
    BOOL v47 = v55 < 0.0;
    float v57 = 0.0;
    if (v47) {
      float v57 = v56;
    }
    float v54 = sqrtf(v57);
  }
  v58[16] = v54;
}

uint64_t sub_227C89D30(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29488);
    }
    uint64_t v7 = qword_2681B9AA8;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  unint64_t v5 = *a1 + a2;
  if (v5 >= v4) {
    unint64_t v4 = v4;
  }
  else {
    unint64_t v4 = 0;
  }
  return (uint64_t)&a1[8 * (v5 - v4) + 4];
}

os_log_t sub_227C89E48()
{
  os_log_t result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_2681B9AA8 = (uint64_t)result;
  return result;
}

BOOL sub_227C89E78(float *a1, float a2)
{
  uint64_t v2 = *(void *)a1;
  if (*(void *)a1)
  {
    uint64_t v3 = *((void *)a1 + 1);
    if ((unint64_t)(v3 + 1) <= 4) {
      uint64_t v4 = v3 + 1;
    }
    else {
      uint64_t v4 = 0;
    }
    a1[v4 + 4] = a2;
    if ((unint64_t)(v4 + 1) <= 4) {
      uint64_t v5 = v4 + 1;
    }
    else {
      uint64_t v5 = 0;
    }
    *(void *)a1 = v2 - 1;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = *((void *)a1 + 1);
    if ((unint64_t)(v7 + 1) <= 4) {
      uint64_t v8 = v7 + 1;
    }
    else {
      uint64_t v8 = 0;
    }
    a1[v8 + 4] = a2;
    a2 = 0.0;
    do
    {
      a2 = a2 + (float)(a1[v6 + 13 - v8] * a1[v6 + 4]);
      ++v6;
    }
    while (v6 != 5);
    if ((unint64_t)(v8 + 1) <= 4) {
      uint64_t v5 = v8 + 1;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  *((void *)a1 + 1) = v5;
  a1[v5 + 4] = a2;
  return v2 == 0;
}

double sub_227C89F18(unsigned __int16 *a1, int a2)
{
  unint64_t v2 = a1[1];
  if (v2 <= a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29488);
    }
    uint64_t v4 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_227B19000, v4, OS_LOG_TYPE_DEBUG, "Get Nth, attempting to access invalid element", v5, 2u);
    }
    return 0.0;
  }
  else
  {
    *(float *)&double result = sub_227C89FE0(a1, 0, v2 - 1, a2);
  }
  return result;
}

float sub_227C89FE0(unsigned __int16 *a1, int a2, int a3, int a4)
{
  float v4 = 0.0;
  if (a2 <= a3)
  {
    int v6 = a3;
    int v7 = a2;
    while (1)
    {
      int v9 = sub_227C8A070(a1, v7, v6);
      if (v9 == a4) {
        break;
      }
      if (v9 > a4) {
        int v6 = v9 - 1;
      }
      else {
        int v7 = v9 + 1;
      }
      if (v7 > v6) {
        return v4;
      }
    }
    return *(float *)sub_227C8764C(a1, a4);
  }
  return v4;
}

uint64_t sub_227C8A070(unsigned __int16 *a1, int a2, int a3)
{
  LODWORD(v4) = a2;
  int v6 = (float *)sub_227C8764C(a1, a3);
  int v7 = v4 - 1;
  if ((int)v4 < a3)
  {
    float v8 = *v6;
    unint64_t v4 = (int)v4;
    do
    {
      if (*(float *)sub_227C8764C(a1, v4) <= v8) {
        sub_227C8A114(a1, ++v7, v4);
      }
      ++v4;
    }
    while (a3 != v4);
  }
  uint64_t v9 = (v7 + 1);
  sub_227C8A114(a1, v9, a3);
  return v9;
}

_DWORD *sub_227C8A114(unsigned __int16 *a1, int a2, int a3)
{
  unint64_t v5 = a2;
  int v6 = *(_DWORD *)sub_227C8764C(a1, a2);
  int v7 = *(_DWORD *)sub_227C8764C(a1, a3);
  *(_DWORD *)sub_227C8764C(a1, v5) = v7;
  double result = (_DWORD *)sub_227C8764C(a1, a3);
  *double result = v6;
  return result;
}

float sub_227C8A18C(uint64_t a1, unint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29488);
    }
    unint64_t v5 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v6 = 134218240;
      unint64_t v7 = a2;
      __int16 v8 = 2048;
      uint64_t v9 = 2;
      _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: i < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMVector.h, line 271,invalid index %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * a2);
}

uint64_t sub_227C8A280(uint64_t a1, unint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29488);
    }
    unint64_t v5 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v6 = 134218240;
      unint64_t v7 = a2;
      __int16 v8 = 2048;
      uint64_t v9 = 2;
      _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: i < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMVector.h, line 277,invalid index %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return a1 + 4 * a2;
}

uint64_t sub_227C8A374(uint64_t result, uint64_t a2, float a3, float a4, float a5, float a6, float a7)
{
  uint64_t v7 = 0;
  char v8 = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  v17[0] = a3 * 1000.0;
  v17[1] = a4 * 1000.0;
  v17[2] = a5 * 1000.0;
  uint64_t v9 = result + 308;
  uint64_t v10 = (float *)(result + 388);
  do
  {
    float v11 = v17[v7];
    float v12 = *(float *)(v9 + v7 * 4) - v11;
    if (v12 <= 0.0) {
      float v12 = -v12;
    }
    *(float *)(v9 + v7 * 4) = v11;
    float v13 = *(v10 - 13);
    *(v10 - 14) = v12 + *(v10 - 14);
    ++*((_DWORD *)v10 - 15);
    if (v13 > v12) {
      *(v10 - 13) = v12;
    }
    if (*(v10 - 12) < v12) {
      *(v10 - 12) = v12;
    }
    ++*((_DWORD *)v10 - 3);
    float v14 = *(v10 - 1);
    *(v10 - 2) = v11 + *(v10 - 2);
    if (v14 > v11) {
      *(v10 - 1) = v11;
    }
    if (*v10 < v11) {
      *uint64_t v10 = v11;
    }
    v8 |= v12 > 0.000001;
    ++v7;
    v10 += 4;
  }
  while (v7 != 3);
  ++*(_DWORD *)(result + 424);
  *(float *)(result + 428) = *(float *)(result + 428) + a6;
  if (*(float *)(result + 432) > a6) {
    *(float *)(result + 432) = a6;
  }
  if (*(float *)(result + 436) < a6) {
    *(float *)(result + 436) = a6;
  }
  ++*(_DWORD *)(result + 440);
  *(float *)(result + 444) = *(float *)(result + 444) + a7;
  if (*(float *)(result + 448) > a7) {
    *(float *)(result + 448) = a7;
  }
  if (*(float *)(result + 452) < a7) {
    *(float *)(result + 452) = a7;
  }
  if (v8)
  {
    unint64_t v15 = a2 - *(void *)(result + 320);
    *(void *)(result + 320) = a2;
    float v16 = (float)v15;
    ++*(_DWORD *)(result + 456);
    *(float *)(result + 460) = *(float *)(result + 460) + (float)v15;
    if (*(float *)(result + 464) > (float)v15) {
      *(float *)(result + 464) = v16;
    }
    if (*(float *)(result + 468) < v16) {
      *(float *)(result + 468) = v16;
    }
  }
  return result;
}

uint64_t sub_227C8A550@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = 0;
  *(_OWORD *)(a2 + 464) = 0u;
  *(_OWORD *)(a2 + 480) = 0u;
  uint64_t v3 = (float *)(result + 428);
  *(_OWORD *)(a2 + 432) = 0u;
  *(_OWORD *)(a2 + 448) = 0u;
  *(_OWORD *)(a2 + 400) = 0u;
  *(_OWORD *)(a2 + 416) = 0u;
  *(_OWORD *)(a2 + 368) = 0u;
  *(_OWORD *)(a2 + 384) = 0u;
  *(_OWORD *)(a2 + 336) = 0u;
  *(_OWORD *)(a2 + 352) = 0u;
  *(_OWORD *)(a2 + 304) = 0u;
  *(_OWORD *)(a2 + 320) = 0u;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  uint64_t v4 = a2 + 32;
  int v5 = *(_DWORD *)(result + 432);
  int v6 = *(_DWORD *)(result + 436);
  int v7 = *(_DWORD *)(result + 424);
  int v8 = *(_DWORD *)(result + 448);
  int v9 = *(_DWORD *)(result + 452);
  int v10 = *(_DWORD *)(result + 440);
  unint64_t v11 = (unint64_t)*(float *)(result + 464);
  unint64_t v12 = (unint64_t)*(float *)(result + 468);
  int v13 = *(_DWORD *)(result + 456);
  do
  {
    uint64_t v14 = result + v2;
    *(_DWORD *)(v4 - 20) = *(_DWORD *)(result + v2 + 384);
    *(_DWORD *)(v4 - 12) = *(_DWORD *)(result + v2 + 388);
    int v15 = *(_DWORD *)(result + v2 + 376);
    float v16 = 0.0;
    float v17 = 0.0;
    if (v15) {
      float v17 = *(float *)(v14 + 380) / (float)v15;
    }
    *(float *)(v4 - 16) = v17;
    *(_DWORD *)(v4 - 32) = *(_DWORD *)(v14 + 336);
    *(_DWORD *)(v4 - 24) = *(_DWORD *)(v14 + 340);
    int v18 = *(_DWORD *)(v14 + 328);
    if (v18) {
      float v16 = *(float *)(result + v2 + 332) / (float)v18;
    }
    *(float *)(v4 - 28) = v16;
    *(_DWORD *)(v4 - 8) = v5;
    float v19 = 0.0;
    float v20 = 0.0;
    *(_DWORD *)uint64_t v4 = v6;
    if (v7) {
      float v20 = *v3 / (float)v7;
    }
    *(float *)(v4 - 4) = v20;
    *(_DWORD *)(v4 + 4) = v8;
    *(_DWORD *)(v4 + 12) = v9;
    if (v10) {
      float v19 = *(float *)(result + 444) / (float)v10;
    }
    *(float *)(v4 + 8) = v19;
    *(void *)(v4 + 16) = v11;
    *(void *)(v4 + 32) = v12;
    if (v13) {
      float v21 = *(float *)(result + 460) / (float)v13;
    }
    else {
      float v21 = 0.0;
    }
    *(void *)(v4 + 24) = (unint64_t)v21;
    v2 += 16;
    v4 += 72;
  }
  while (v2 != 48);
  uint64_t v22 = 0;
  uint64_t v23 = result + 164;
  uint64_t v24 = a2 + 216;
  do
  {
    *(_DWORD *)(v24 + v22) = *(_DWORD *)(v23 - 88);
    int v25 = *(_DWORD *)(v23 - 96);
    float v26 = 0.0;
    float v27 = 0.0;
    if (v25) {
      float v27 = *(float *)(v23 - 92) / (float)v25;
    }
    uint64_t v28 = v24 + v22;
    int v29 = *(_DWORD *)(v23 - 84);
    *(float *)(v28 + 4) = v27;
    *(_DWORD *)(v28 + 8) = v29;
    *(_DWORD *)(v28 + 12) = *(_DWORD *)(v23 - 40);
    int v30 = *(_DWORD *)(v23 - 48);
    if (v30) {
      float v26 = *(float *)(v23 - 44) / (float)v30;
    }
    int v31 = *(_DWORD *)(v23 - 36);
    *(float *)(v28 + 16) = v26;
    *(_DWORD *)(v28 + 20) = v31;
    *(_DWORD *)(v28 + 24) = *(_DWORD *)(v23 + 8);
    float v32 = 0.0;
    float v33 = 0.0;
    if (*(_DWORD *)v23) {
      float v33 = *(float *)(v23 + 4) / (float)*(int *)v23;
    }
    uint64_t v34 = v24 + v22;
    int v35 = *(_DWORD *)(v23 + 12);
    *(float *)(v34 + 28) = v33;
    *(_DWORD *)(v34 + 32) = v35;
    *(_DWORD *)(v34 + 36) = *(_DWORD *)(v23 + 56);
    int v36 = *(_DWORD *)(v23 + 48);
    if (v36) {
      float v32 = *(float *)(v23 + 52) / (float)v36;
    }
    int v37 = *(_DWORD *)(v23 + 60);
    *(float *)(v34 + 40) = v32;
    *(_DWORD *)(v34 + 44) = v37;
    *(_DWORD *)(v34 + 48) = *(_DWORD *)(v23 + 104);
    int v38 = *(_DWORD *)(v23 + 96);
    if (v38) {
      float v39 = *(float *)(v23 + 100) / (float)v38;
    }
    else {
      float v39 = 0.0;
    }
    uint64_t v40 = v24 + v22;
    int v41 = *(_DWORD *)(v23 + 108);
    *(float *)(v40 + 52) = v39;
    *(_DWORD *)(v40 + 56) = v41;
    v22 += 60;
    v23 += 16;
  }
  while (v22 != 180);
  *(void *)(a2 + 400) = (unint64_t)*(float *)(result + 60);
  int v42 = *(_DWORD *)(result + 52);
  if (v42) {
    unint64_t v43 = (unint64_t)(float)(*(float *)(result + 56) / (float)v42);
  }
  else {
    unint64_t v43 = 0;
  }
  unint64_t v44 = (unint64_t)*(float *)(result + 64);
  *(void *)(a2 + 408) = v43;
  *(void *)(a2 + 416) = v44;
  *(void *)(a2 + 424) = (unint64_t)*(float *)(result + 44);
  int v45 = *(_DWORD *)(result + 36);
  if (v45) {
    unint64_t v46 = (unint64_t)(float)(*(float *)(result + 40) / (float)v45);
  }
  else {
    unint64_t v46 = 0;
  }
  unint64_t v47 = (unint64_t)*(float *)(result + 48);
  *(void *)(a2 + 432) = v46;
  *(void *)(a2 + 440) = v47;
  *(void *)(a2 + 448) = (unint64_t)*(float *)(result + 28);
  int v48 = *(_DWORD *)(result + 20);
  if (v48) {
    unint64_t v49 = (unint64_t)(float)(*(float *)(result + 24) / (float)v48);
  }
  else {
    unint64_t v49 = 0;
  }
  unint64_t v50 = (unint64_t)*(float *)(result + 32);
  *(void *)(a2 + 456) = v49;
  *(void *)(a2 + 464) = v50;
  *(void *)(a2 + 472) = (unint64_t)*(float *)(result + 12);
  int v51 = *(_DWORD *)(result + 4);
  if (v51) {
    unint64_t v52 = (unint64_t)(float)(*(float *)(result + 8) / (float)v51);
  }
  else {
    unint64_t v52 = 0;
  }
  uint64_t v53 = 0;
  unint64_t v54 = (unint64_t)*(float *)(result + 16);
  *(void *)(a2 + 480) = v52;
  *(void *)(a2 + 488) = v54;
  *(void *)(result + 436) = 4286578687;
  *(void *)(result + 452) = 4286578687;
  *(_DWORD *)(result + 4) = 0;
  *(void *)(result + 8) = 0x7F7FFFFF00000000;
  *(void *)(result + 16) = 4286578687;
  *(void *)(result + 24) = 0x7F7FFFFF00000000;
  *(void *)(result + 32) = 4286578687;
  *(void *)(result + 40) = 0x7F7FFFFF00000000;
  *(void *)(result + 48) = 4286578687;
  *(void *)(result + 56) = 0x7F7FFFFF00000000;
  *(_DWORD *)(result + 64) = -8388609;
  *(_DWORD *)(result + 424) = 0;
  *(void *)uint64_t v3 = 0x7F7FFFFF00000000;
  *(void *)(result + 444) = 0x7F7FFFFF00000000;
  *(void *)(result + 460) = 0x7F7FFFFF00000000;
  *(_DWORD *)(result + 468) = -8388609;
  do
  {
    float v55 = (_DWORD *)(result + v53);
    v55[94] = 0;
    *(void *)(result + v53 + 380) = 0x7F7FFFFF00000000;
    v55[97] = -8388609;
    v55[82] = 0;
    *(void *)(result + v53 + 332) = 0x7F7FFFFF00000000;
    v55[85] = -8388609;
    v53 += 16;
  }
  while (v53 != 48);
  for (uint64_t i = 0; i != 48; i += 16)
  {
    uint64_t v57 = result + i;
    *(_DWORD *)(v57 + 68) = 0;
    *(void *)(v57 + 72) = 0x7F7FFFFF00000000;
    *(_DWORD *)(v57 + 80) = -8388609;
    *(_DWORD *)(v57 + 116) = 0;
    *(void *)(v57 + 120) = 0x7F7FFFFF00000000;
    *(_DWORD *)(v57 + 128) = -8388609;
    *(_DWORD *)(v57 + 164) = 0;
    *(void *)(v57 + 168) = 0x7F7FFFFF00000000;
    *(_DWORD *)(v57 + 176) = -8388609;
    *(_DWORD *)(v57 + 212) = 0;
    *(void *)(v57 + 216) = 0x7F7FFFFF00000000;
    *(_DWORD *)(v57 + 224) = -8388609;
    *(_DWORD *)(v57 + 260) = 0;
    *(void *)(v57 + 264) = 0x7F7FFFFF00000000;
    *(_DWORD *)(v57 + 272) = -8388609;
  }
  return result;
}

float sub_227C8A958(uint64_t a1, _OWORD *a2, uint64_t a3, float a4, float a5)
{
  *(unsigned char *)a1 = 1;
  if ((_OWORD *)(a1 + 4) != a2) {
    *(_OWORD *)(a1 + 4) = *a2;
  }
  unint64_t v8 = 0;
  *(void *)(a1 + 24) = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  int v13 = 0;
  do
  {
    *(_DWORD *)sub_227C8B55C((uint64_t)&v11, v8, v8) = 1065353216;
    ++v8;
  }
  while (v8 != 3);
  for (uint64_t i = 0; i != 36; i += 4)
    *(float *)((char *)&v11 + i) = (float)(a5 * a5) * *(float *)((char *)&v11 + i);
  v14[0] = v11;
  v14[1] = v12;
  int v15 = v13;
  sub_227C8AA38(a1 + 32, (uint64_t)v14);
  float result = a4 * a4;
  *(float *)(a1 + 56) = a4 * a4;
  *(float *)(a1 + 60) = a4 * a4;
  *(float *)(a1 + 64) = a4 * a4;
  return result;
}

BOOL sub_227C8AA38(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL result = sub_227C8C9F4(a2);
  if (result)
  {
    unint64_t v5 = 3;
    unint64_t v6 = 2;
    while (1)
    {
      unint64_t v7 = v6;
      float v8 = sub_227C8CA98(a2, v6, v6);
      unint64_t v9 = v5;
      unint64_t v10 = v5 - 2;
      if (v5 <= 2)
      {
        do
        {
          float v11 = *(float *)sub_227C8CC28(a1 + 12, v7, v9);
          float v12 = *(float *)sub_227C8CC28(a1 + 12, v7, v9);
          float v8 = v8 + (float)((float)-(float)(v11 * v12) * *(float *)sub_227C8CDB8(a1, v9++));
        }
        while (v9 != 3);
      }
      *(float *)sub_227C8CDB8(a1, v7) = v8;
      if (*(float *)sub_227C8CDB8(a1, v7) <= 0.0) {
        break;
      }
      if (v7)
      {
        do
        {
          unint64_t v13 = v10;
          float v14 = sub_227C8CA98(a2, v10, v7);
          unint64_t v15 = v5;
          if (v5 <= 2)
          {
            do
            {
              float v16 = *(float *)sub_227C8CC28(a1 + 12, v13, v15);
              float v17 = *(float *)sub_227C8CC28(a1 + 12, v7, v15);
              float v14 = v14 + (float)((float)-(float)(v16 * v17) * *(float *)sub_227C8CDB8(a1, v15++));
            }
            while (v15 != 3);
          }
          float v18 = v14 / *(float *)sub_227C8CDB8(a1, v7);
          *(float *)sub_227C8CC28(a1 + 12, v13, v7) = v18;
          unint64_t v10 = v13 - 1;
        }
        while (v13);
      }
      unint64_t v6 = v7 - 1;
      unint64_t v5 = v7;
      if (!v7) {
        return 1;
      }
    }
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    float v19 = qword_2681B9AA8;
    BOOL result = os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_DEBUG);
    if (result)
    {
      int v20 = 134217984;
      unint64_t v21 = v7;
      _os_log_impl(&dword_227B19000, v19, OS_LOG_TYPE_DEBUG, "D(%zu) <= 0 non-positive definite matrix!", (uint8_t *)&v20, 0xCu);
      return 0;
    }
  }
  return result;
}

double sub_227C8AC98(uint64_t a1)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 4) = 0;
  *(void *)(a1 + 12) = 0x3F80000000000000;
  double result = 0.0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  return result;
}

void sub_227C8ACBC(float32x2_t *a1, float32x2_t *a2, unint64_t a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a1->i8[0])
  {
    float32x2_t v5 = a1[3];
    if (a3 > *(void *)&v5)
    {
      if (*(void *)&v5 + 1000000 >= a3)
      {
        float v9 = (double)(a3 - v5.i32[0]) / 1000000.0;
        float v12 = v9;
        sub_227C8AEDC((uint64_t)a1, a2, v9);
        sub_227C8AF50((float *)a2, (uint64_t)buf);
        sub_227C8AFC0((uint64_t)buf, (uint64_t)v19, v12);
        unint64_t v10 = 0;
        int v18 = 0;
        memset(v17, 0, sizeof(v17));
        do
        {
          *(_DWORD *)sub_227C8B55C((uint64_t)v17, v10, v10) = 1065353216;
          ++v10;
        }
        while (v10 != 3);
        float v11 = a1[8].f32[0] * v12;
        float32x2_t v15 = vmul_n_f32(a1[7], v12);
        float v16 = v11;
        sub_227C8B114((uint64_t)&a1[4], (uint64_t)v19, (uint64_t)v17, (uint64_t)&v15);
        if (sub_227C8B4FC((uint64_t)&a1[4]) < 0.000000060923)
        {
          sub_227C8D23C((uint64_t)&a1[4], 0, 0, (uint64_t)v13);
          v13[0] = v13[0] + 0.000000030462;
          float v14 = v14 + 0.000000030462;
          sub_227C8AA38((uint64_t)&a1[4], (uint64_t)v13);
        }
        a1[3] = (float32x2_t)a3;
      }
      else
      {
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC294A8);
        }
        unint64_t v6 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
        {
          float32x2_t v7 = a1[3];
          *(_DWORD *)buf = 134218240;
          unint64_t v21 = a3;
          __int16 v22 = 2048;
          float32x2_t v23 = v7;
          _os_log_impl(&dword_227B19000, v6, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollMEKF]:[propagate] Requested propagation time: %llu us cannot be 1s ahead of the last state timestamp: %llu us. Rejecting request.", buf, 0x16u);
        }
      }
    }
  }
}

double sub_227C8AEDC(uint64_t a1, float32x2_t *a2, float a3)
{
  float v4 = a2[1].f32[0] * a3;
  float32x2_t v10 = vmul_n_f32(*a2, a3);
  float v11 = v4;
  *(double *)v5.i64 = sub_227CA4FB4(&v9, (float *)&v10);
  unint64_t v6 = (float32x4_t *)(a1 + 4);
  double result = sub_227CA4C0C((uint64_t)&v9, v6->f32, &v8, v5);
  if (v6 != &v8)
  {
    double result = *(double *)v8.i64;
    *unint64_t v6 = v8;
  }
  return result;
}

double sub_227C8AF50@<D0>(float *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2 = 0;
  float v4 = a1[1];
  float v3 = a1[2];
  float v5 = *a1;
  float v6 = -*a1;
  LODWORD(v9) = 0;
  *((float *)&v9 + 1) = v3;
  *((float *)&v9 + 2) = -v4;
  *((float *)&v9 + 3) = -v3;
  LODWORD(v10) = 0;
  *(void *)((char *)&v10 + 4) = __PAIR64__(LODWORD(v4), LODWORD(v5));
  *((float *)&v10 + 3) = v6;
  int v11 = 0;
  do
  {
    *(float *)((char *)&v9 + v2) = -*(float *)((char *)&v9 + v2);
    v2 += 4;
  }
  while (v2 != 36);
  double result = *(double *)&v9;
  long long v8 = v10;
  *(_OWORD *)a2 = v9;
  *(_OWORD *)(a2 + 16) = v8;
  *(_DWORD *)(a2 + 32) = v11;
  return result;
}

void sub_227C8AFC0(uint64_t a1@<X1>, uint64_t a2@<X8>, float a3@<S0>)
{
  unint64_t v6 = 0;
  *(_DWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  do
  {
    *(_DWORD *)sub_227C8B55C(a2, v6, v6) = 1065353216;
    ++v6;
  }
  while (v6 != 3);
  uint64_t v7 = 0;
  long long v8 = *(_OWORD *)(a1 + 16);
  long long v15 = *(_OWORD *)a1;
  long long v16 = v8;
  int v17 = *(_DWORD *)(a1 + 32);
  do
  {
    *(float *)((char *)&v15 + v7) = *(float *)((char *)&v15 + v7) * a3;
    v7 += 4;
  }
  while (v7 != 36);
  unint64_t v9 = 0;
  long long v18 = v15;
  long long v19 = v16;
  int v20 = v17;
  do
  {
    *(float *)(a2 + 4 * v9) = sub_227C8D350((uint64_t)&v18, v9) + *(float *)(a2 + 4 * v9);
    ++v9;
  }
  while (v9 != 9);
  float v10 = (float)(a3 * 0.5) * a3;
  sub_227C8B6EC(a1, a1, (uint64_t)v13);
  for (uint64_t i = 0; i != 36; i += 4)
    *(float *)((char *)v13 + i) = v10 * *(float *)((char *)v13 + i);
  unint64_t v12 = 0;
  long long v18 = v13[0];
  long long v19 = v13[1];
  int v20 = v14;
  do
  {
    *(float *)(a2 + 4 * v12) = sub_227C8D350((uint64_t)&v18, v12) + *(float *)(a2 + 4 * v12);
    ++v12;
  }
  while (v12 != 9);
}

void sub_227C8B114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = 0;
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v9 = a1 + 12;
  do
  {
    for (uint64_t i = 2; i; uint64_t i = v11 - 1)
    {
      unint64_t v11 = i;
      for (unint64_t j = 0; j != v11; ++j)
      {
        float v13 = *(float *)sub_227C8B55C(a2, v8, j);
        float v14 = *(float *)sub_227C8CC28(v9, j, v11);
        long long v15 = (float *)sub_227C8B55C(a2, v8, v11);
        *long long v15 = *v15 + (float)(v13 * v14);
      }
    }
    ++v8;
  }
  while (v8 != 3);
  for (uint64_t k = 2; ; uint64_t k = v18 - 1)
  {
    unint64_t v17 = 0;
    unint64_t v18 = k;
    v46[k] = 0.0;
    float v19 = 0.0;
    do
    {
      float v20 = *(float *)sub_227C8B55C(a2, v18, v17);
      float v21 = v20 * *(float *)sub_227C8B55C(a2, v18, v17);
      float v19 = v19 + (float)(v21 * *(float *)sub_227C8CDB8(a1, v17));
      v46[v18] = v19;
      ++v17;
    }
    while (v17 != 3);
    for (unint64_t m = 0; m != 3; ++m)
    {
      float v23 = *(float *)sub_227C8B55C(a3, v18, m);
      float v24 = v23 * *(float *)sub_227C8B55C(a3, v18, m);
      float v19 = v19 + (float)(v24 * sub_227C8C710(a4, m));
      v46[v18] = v19;
    }
    if (v19 <= 0.0) {
      break;
    }
    if (!v18)
    {
      for (unint64_t n = 0; n != 3; ++n)
      {
        float v42 = v46[n];
        *(float *)sub_227C8CDB8(a1, n) = v42;
      }
      return;
    }
    for (iuint64_t i = 0; ii != v18; ++ii)
    {
      unint64_t v26 = 0;
      float v27 = 0.0;
      do
      {
        float v28 = *(float *)sub_227C8B55C(a2, ii, v26);
        float v29 = v28 * *(float *)sub_227C8CDB8(a1, v26);
        float v27 = v27 + (float)(v29 * *(float *)sub_227C8B55C(a2, v18, v26++));
      }
      while (v26 != 3);
      for (junint64_t j = 0; jj != 3; ++jj)
      {
        float v31 = *(float *)sub_227C8B55C(a3, ii, jj);
        float v32 = v31 * sub_227C8C710(a4, jj);
        float v27 = v27 + (float)(v32 * *(float *)sub_227C8B55C(a3, v18, jj));
      }
      unint64_t v33 = 0;
      *(float *)sub_227C8CC28(v9, ii, v18) = v27 / v19;
      do
      {
        float v34 = *(float *)sub_227C8CC28(v9, ii, v18);
        float v35 = *(float *)sub_227C8B55C(a2, v18, v33);
        int v36 = (float *)sub_227C8B55C(a2, ii, v33);
        *int v36 = *v36 - (float)(v34 * v35);
        ++v33;
      }
      while (v33 != 3);
      for (kuint64_t k = 0; kk != 3; ++kk)
      {
        float v38 = *(float *)sub_227C8CC28(v9, ii, v18);
        float v39 = *(float *)sub_227C8B55C(a3, v18, kk);
        uint64_t v40 = (float *)sub_227C8B55C(a3, ii, kk);
        *uint64_t v40 = *v40 - (float)(v38 * v39);
      }
    }
  }
  if (qword_2681B9AA0 != -1) {
    dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
  }
  unint64_t v43 = qword_2681B9AA8;
  if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_DEBUG))
  {
    int v44 = 134217984;
    unint64_t v45 = v18;
    _os_log_impl(&dword_227B19000, v43, OS_LOG_TYPE_DEBUG, "D[%zu] <= 0, matrix ! positive definite", (uint8_t *)&v44, 0xCu);
  }
}

float sub_227C8B4FC(uint64_t a1)
{
  float v2 = sub_227C8CEDC(a1, 0, 0);
  for (unint64_t i = 1; i != 3; ++i)
    float v2 = v2 + sub_227C8CEDC(a1, i, i);
  return v2;
}

uint64_t sub_227C8B55C(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    uint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (3 * a3 + a2);
}

float *sub_227C8B6EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  for (unint64_t i = 0; i != 3; ++i)
  {
    for (unint64_t j = 0; j != 3; ++j)
    {
      float v8 = sub_227C8CA98(a1, i, 0);
      float v9 = v8 * sub_227C8CA98(a2, 0, j);
      *(float *)sub_227C8B55C(a3, i, j) = v9;
      for (unint64_t k = 1; k != 3; ++k)
      {
        float v11 = sub_227C8CA98(a1, i, k);
        float v12 = sub_227C8CA98(a2, k, j);
        double result = (float *)sub_227C8B55C(a3, i, j);
        *double result = *result + (float)(v11 * v12);
      }
    }
  }
  return result;
}

void sub_227C8B7DC(uint64_t a1, float *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 24) == a4)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9C30, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_2681B9C30))
    {
      qword_2681B9C20 = 0x3F80000000000000;
      dword_2681B9C28 = 0;
      __cxa_guard_release(&qword_2681B9C30);
    }
    float v8 = (float32x4_t *)(a1 + 4);
    float v9 = sub_227CA4ED8((float *)(a1 + 4), *(float *)&qword_2681B9C20, *((float *)&qword_2681B9C20 + 1), *(float *)&dword_2681B9C28);
    float v11 = v10;
    float v13 = v12;
    uint64_t v14 = 0;
    LODWORD(v48) = 0;
    *((float *)&v48 + 1) = v12;
    *((float *)&v48 + 2) = -v10;
    *((float *)&v48 + 3) = -v12;
    LODWORD(v49) = 0;
    *(void *)((char *)&v49 + 4) = __PAIR64__(LODWORD(v10), LODWORD(v9));
    *((float *)&v49 + 3) = -v9;
    int v50 = 0;
    do
    {
      *(float *)((char *)&v48 + v14) = *(float *)((char *)&v48 + v14) + *(float *)((char *)&v48 + v14);
      v14 += 4;
    }
    while (v14 != 36);
    *(_OWORD *)buf = v48;
    *(_OWORD *)&buf[16] = v49;
    int v52 = v50;
    *(float *)&uint64_t v46 = sub_227C966E0(a2) - v9;
    *((float *)&v46 + 1) = v15 - v11;
    float v47 = v16 - v13;
    sub_227C967E0(a2, (uint64_t)v45);
    v38.i32[0] = sub_227C8BD80(a3);
    *(uint64_t *)((char *)v38.i64 + 4) = __PAIR64__(v18, v17);
    v38.i32[3] = v19;
    sub_227C8BC98((uint64_t)v45, (uint64_t)&v38, (uint64_t)v42);
    sub_227C8BE00((uint64_t)v45, (uint64_t)v39);
    sub_227C8BBB8((uint64_t)v42, (uint64_t)v39, (uint64_t)v43);
    sub_227CA4EC8((float *)(a1 + 4), v42);
    sub_227C8B6EC((uint64_t)v42, (uint64_t)v43, (uint64_t)v39);
    sub_227C8BE94((uint64_t)v42, (uint64_t)&v38);
    sub_227C8B6EC((uint64_t)v39, (uint64_t)&v38, (uint64_t)v40);
    unint64_t v20 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    int v35 = 0;
    do
    {
      *(_DWORD *)sub_227C8B55C((uint64_t)&v33, v20, v20) = 1065353216;
      ++v20;
    }
    while (v20 != 3);
    for (uint64_t i = 0; i != 36; i += 4)
      *(float *)((char *)&v33 + i) = *(float *)((char *)&v33 + i) * 0.01;
    unint64_t v22 = 0;
    v36[0] = v33;
    v36[1] = v34;
    int v37 = v35;
    do
    {
      *((float *)v40 + v22) = sub_227C8D350((uint64_t)v36, v22) + *((float *)v40 + v22);
      ++v22;
    }
    while (v22 != 9);
    v43[0] = v40[0];
    v43[1] = v40[1];
    int v44 = v41;
    LODWORD(v36[0]) = sub_227C8BF10((uint64_t)v43);
    *(void *)((char *)v36 + 4) = __PAIR64__(v24, v23);
    if (sub_227C8BF7C(a1, (uint64_t)buf, &v46, (uint64_t)v43, a4))
    {
      sub_227C8C1D8((float *)(a1 + 32), (uint64_t)buf, (uint64_t)v36, (uint64_t)&v46);
      float v28 = (float)((float)(v13 * v25) + (float)(v11 * v26)) + (float)(v9 * v27);
      v32[0] = v27 - (float)(v9 * v28);
      v32[1] = v26 - (float)(v11 * v28);
      v32[2] = v25 - (float)(v13 * v28);
      *(double *)v29.i64 = sub_227CA4FB4(v39, v32);
      sub_227CA4C0C((uint64_t)v39, v8->f32, &v38, v29);
      if (v8 != &v38) {
        *float v8 = v38;
      }
    }
  }
  else
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC294A8);
    }
    int v30 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = *(void *)(a1 + 24);
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = a4;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_227B19000, v30, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollMEKF]:[ringMeasurementUpdate] Measurement timestamp: %llu us must match the state timestamp: %llu us", buf, 0x16u);
    }
  }
}

float *sub_227C8BBB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  for (unint64_t i = 0; i != 3; ++i)
  {
    for (unint64_t j = 0; j != 3; ++j)
    {
      float v8 = sub_227C8D5D0(a1, i, 0);
      float v9 = v8 * sub_227C8DC08(a2, 0, j);
      *(float *)sub_227C8B55C(a3, i, j) = v9;
      float v10 = sub_227C8D5D0(a1, i, 1uLL);
      float v11 = sub_227C8DC08(a2, 1uLL, j);
      double result = (float *)sub_227C8B55C(a3, i, j);
      *double result = *result + (float)(v10 * v11);
    }
  }
  return result;
}

float *sub_227C8BC98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  for (unint64_t i = 0; i != 3; ++i)
  {
    unint64_t v7 = 0;
    char v8 = 1;
    do
    {
      char v9 = v8;
      float v10 = sub_227C8D5D0(a1, i, 0);
      float v11 = v10 * sub_227C8D760(a2, 0, v7);
      *(float *)sub_227C8D8EC(a3, i, v7) = v11;
      float v12 = sub_227C8D5D0(a1, i, 1uLL);
      float v13 = sub_227C8D760(a2, 1uLL, v7);
      double result = (float *)sub_227C8D8EC(a3, i, v7);
      char v8 = 0;
      *double result = *result + (float)(v12 * v13);
      unint64_t v7 = 1;
    }
    while ((v9 & 1) != 0);
  }
  return result;
}

float sub_227C8BD80(uint64_t a1)
{
  v5[0] = 0;
  v5[1] = 0;
  float v2 = sub_227C8A18C(a1, 0);
  *(float *)sub_227C8D444((uint64_t)v5, 0, 0) = v2;
  float v3 = sub_227C8A18C(a1, 1uLL);
  *(float *)sub_227C8D444((uint64_t)v5, 1uLL, 1uLL) = v3;
  return *(float *)v5;
}

float *sub_227C8BE00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  for (unint64_t i = 0; i != 3; ++i)
  {
    float v5 = sub_227C8D5D0(a1, i, 0);
    *(float *)sub_227C8DA7C(a2, 0, i) = v5;
    float v6 = sub_227C8D5D0(a1, i, 1uLL);
    double result = (float *)sub_227C8DA7C(a2, 1uLL, i);
    *double result = v6;
  }
  return result;
}

float *sub_227C8BE94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  for (unint64_t i = 0; i != 3; ++i)
  {
    for (unint64_t j = 0; j != 3; ++j)
    {
      float v6 = sub_227C8CA98(a1, i, j);
      double result = (float *)sub_227C8B55C(a2, j, i);
      *double result = v6;
    }
  }
  return result;
}

float sub_227C8BF10(uint64_t a1)
{
  for (unint64_t i = 0; i != 3; ++i)
  {
    float v3 = sub_227C8CA98(a1, i, i);
    *(float *)sub_227C8DD94((uint64_t)&v5, i) = v3;
  }
  return v5;
}

BOOL sub_227C8BF7C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  sub_227C8D23C(a1 + 32, 0, 0, (uint64_t)v26);
  sub_227C8B6EC(a2, (uint64_t)v26, (uint64_t)buf);
  sub_227C8BE94(a2, (uint64_t)&v24);
  sub_227C8B6EC((uint64_t)buf, (uint64_t)&v24, (uint64_t)v27);
  for (unint64_t i = 0; i != 9; ++i)
    *((float *)v27 + i) = sub_227C8D350(a4, i) + *((float *)v27 + i);
  v29[0] = v27[0];
  v29[1] = v27[1];
  int v30 = v28;
  char v23 = 0;
  sub_227C8C52C((float *)v29, &v23, (uint64_t)v26);
  if (!v23) {
    return 0;
  }
  int v10 = *((_DWORD *)a3 + 2);
  uint64_t v24 = *a3;
  int v25 = v10;
  v22[0] = sub_227C8C954((uint64_t)&v24);
  v22[1] = v11;
  v22[2] = v12;
  *(_DWORD *)buf = sub_227C8C880(v22, (uint64_t)v26);
  double v32 = COERCE_DOUBLE(__PAIR64__(v14, v13));
  float v15 = sub_227C8C804((float *)buf, (float *)&v24);
  BOOL v16 = v15 < 16.266;
  if (v15 >= 16.266)
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC294A8);
    }
    unsigned int v17 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
    {
      double v18 = *(float *)a3;
      double v19 = *((float *)a3 + 1);
      double v20 = *((float *)a3 + 2);
      *(_DWORD *)buf = 134219264;
      double v32 = (float)((float)a5 * 0.000001);
      __int16 v33 = 2048;
      double v34 = v15;
      __int16 v35 = 2048;
      uint64_t v36 = 0x40304425A0000000;
      __int16 v37 = 2048;
      double v38 = v18;
      __int16 v39 = 2048;
      double v40 = v19;
      __int16 v41 = 2048;
      double v42 = v20;
      _os_log_impl(&dword_227B19000, v17, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMABarrelRollMEKF]:[checkNIS] Measurement rejected by NIS check.t: %.6f s, NIS score: %.6f,  NIS Threshold: %.6f, r: %.6f %.6f %.6f", buf, 0x3Eu);
    }
  }
  return v16;
}

void sub_227C8C1D8(float *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = 0;
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v33 = 0;
  int v34 = 0;
  uint64_t v8 = (uint64_t)(a1 + 3);
  while (2)
  {
    unint64_t v9 = 0;
    uint64_t v10 = -1;
    do
    {
      float v11 = sub_227C8CA98(a2, v7, v9);
      unint64_t v12 = v10;
      if (v9)
      {
        do
        {
          float v13 = sub_227C8CA98(a2, v7, v12);
          float v11 = v11 + (float)(v13 * *(float *)sub_227C8CC28(v8, v12--, v9));
        }
        while (v12 != -1);
      }
      v38[v9] = v11;
      v37[v9] = v11 * *(float *)sub_227C8CDB8((uint64_t)a1, v9);
      ++v9;
      ++v10;
    }
    while (v9 != 3);
    float v14 = sub_227C8C710(a3, v7);
    float v15 = v14 + (float)(v38[0] * v37[0]);
    if (v15 <= 0.0)
    {
      if (qword_2681B9AA0 != -1) {
        dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
      }
      uint64_t v31 = qword_2681B9AA8;
      if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v36 = v7;
LABEL_20:
        _os_log_impl(&dword_227B19000, v31, OS_LOG_TYPE_DEBUG, "%zu: alpha <= 0, matrix ! positive definite", buf, 0xCu);
      }
    }
    else
    {
      float v16 = 1.0 / v15;
      *a1 = *a1 * (float)((float)(1.0 / v15) * sub_227C8C710(a3, v7));
      for (unint64_t i = 1; i != 3; ++i)
      {
        float v18 = v38[i];
        float v19 = v15 + (float)(v18 * v37[i]);
        if (v19 <= 0.0)
        {
          if (qword_2681B9AA0 != -1) {
            dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
          }
          uint64_t v31 = qword_2681B9AA8;
          if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v36 = v7;
            goto LABEL_20;
          }
          return;
        }
        float v20 = -(float)(v18 * v16);
        float v16 = 1.0 / v19;
        float v21 = (float *)sub_227C8CDB8((uint64_t)a1, i);
        unint64_t v22 = 0;
        *float v21 = (float)(v15 * (float)(1.0 / v19)) * *v21;
        do
        {
          float v23 = *(float *)sub_227C8CC28(v8, v22, i);
          float v24 = v37[v22];
          int v25 = (float *)sub_227C8CC28(v8, v22, i);
          float v26 = v37[i];
          *int v25 = v23 + (float)(v24 * v20);
          v37[v22++] = v24 + (float)(v26 * v23);
        }
        while (i != v22);
        float v15 = v19;
      }
      unint64_t v27 = 0;
      float v28 = v16 * sub_227C8C710(a4, v7);
      do
      {
        float v29 = v37[v27];
        int v30 = (float *)sub_227C8DD94((uint64_t)&v33, v27);
        *int v30 = *v30 + (float)(v28 * v29);
        ++v27;
      }
      while (v27 != 3);
      if (++v7 != 3) {
        continue;
      }
    }
    break;
  }
}

float *sub_227C8C52C@<X0>(float *a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X8>)
{
  float v6 = sub_227C8DE88(a1);
  if (fabsf(v6) >= 0.000000001)
  {
    uint64_t v25 = a3;
    unint64_t v9 = 0;
    *a2 = 1;
    do
    {
      unint64_t v10 = 0;
      unint64_t v11 = v9;
      if (v9) {
        unint64_t v12 = (int)v9 - 1;
      }
      else {
        unint64_t v12 = 2;
      }
      unint64_t v13 = v9 + 1;
      unint64_t v26 = v13;
      if (v13 == 3) {
        unint64_t v14 = 0;
      }
      else {
        unint64_t v14 = v13;
      }
      uint64_t v15 = 0xFFFFFFFF00000000;
      do
      {
        if (v10) {
          unint64_t v16 = v15 >> 32;
        }
        else {
          unint64_t v16 = 2;
        }
        unint64_t v17 = v10 + 1;
        if (v10 == 2) {
          unint64_t v18 = 0;
        }
        else {
          unint64_t v18 = v10 + 1;
        }
        float v19 = sub_227C8CA98((uint64_t)a1, v12, v16);
        float v20 = sub_227C8CA98((uint64_t)a1, v14, v18);
        float v21 = sub_227C8CA98((uint64_t)a1, v14, v16);
        float v22 = (float)(v19 * v20) - (float)(v21 * sub_227C8CA98((uint64_t)a1, v12, v18));
        double result = (float *)sub_227C8B55C((uint64_t)v30, v10, v11);
        *double result = v22;
        v15 += 0x100000000;
        ++v10;
      }
      while (v17 != 3);
      unint64_t v9 = v26;
    }
    while (v26 != 3);
    uint64_t v23 = 0;
    long long v27 = v30[0];
    long long v28 = v30[1];
    int v29 = v31;
    do
    {
      *(float *)((char *)&v27 + v23) = *(float *)((char *)&v27 + v23) / v6;
      v23 += 4;
    }
    while (v23 != 36);
    long long v24 = v28;
    *(_OWORD *)uint64_t v25 = v27;
    *(_OWORD *)(v25 + 16) = v24;
    *(_DWORD *)(v25 + 32) = v29;
  }
  else
  {
    unint64_t v7 = 0;
    *a2 = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    do
    {
      double result = (float *)sub_227C8B55C(a3, v7, v7);
      *double result = 1.0;
      ++v7;
    }
    while (v7 != 3);
  }
  return result;
}

float sub_227C8C710(uint64_t a1, unint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    float v5 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v6 = 134218240;
      unint64_t v7 = a2;
      __int16 v8 = 2048;
      uint64_t v9 = 3;
      _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: i < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMVector.h, line 271,invalid index %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * a2);
}

float sub_227C8C804(float *a1, float *a2)
{
  float v4 = *a1 * *a2;
  for (unint64_t i = 1; i != 3; ++i)
  {
    float v6 = sub_227C8E1E4((uint64_t)a1, 0, i);
    float v4 = v4 + (float)(v6 * sub_227C8DED0((uint64_t)a2, i, 0));
  }
  return v4;
}

float sub_227C8C880(float *a1, uint64_t a2)
{
  for (unint64_t i = 0; i != 3; ++i)
  {
    float v5 = *a1;
    float v6 = v5 * sub_227C8CA98(a2, 0, i);
    *(float *)sub_227C8E05C((uint64_t)&v12, 0, i) = v6;
    for (unint64_t j = 1; j != 3; ++j)
    {
      float v8 = sub_227C8E1E4((uint64_t)a1, 0, j);
      float v9 = sub_227C8CA98(a2, j, i);
      uint64_t v10 = (float *)sub_227C8E05C((uint64_t)&v12, 0, i);
      *uint64_t v10 = *v10 + (float)(v8 * v9);
    }
  }
  return v12;
}

float sub_227C8C954(uint64_t a1)
{
  for (unint64_t i = 0; i != 3; ++i)
  {
    float v3 = sub_227C8DED0(a1, i, 0);
    *(float *)sub_227C8E05C((uint64_t)&v5, 0, i) = v3;
  }
  return v5;
}

os_log_t sub_227C8C9C4()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_2681B9A78 = (uint64_t)result;
  return result;
}

BOOL sub_227C8C9F4(uint64_t a1)
{
  unint64_t v2 = 0;
  char v3 = 1;
LABEL_2:
  char v4 = v3;
  unint64_t v5 = v2 + 1;
  while (1)
  {
    float v6 = sub_227C8CA98(a1, v2, v5);
    float v7 = v6 - sub_227C8CA98(a1, v5, v2);
    if (v7 <= 0.0) {
      float v7 = -v7;
    }
    if (v7 > 1.0e-16) {
      return v7 <= 1.0e-16;
    }
    if (++v5 == 3)
    {
      char v3 = 0;
      unint64_t v2 = 1;
      if (v4) {
        goto LABEL_2;
      }
      return v7 <= 1.0e-16;
    }
  }
}

float sub_227C8CA98(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    float v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    float v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (3 * a3 + a2));
}

uint64_t sub_227C8CC28(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    float v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 237,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 <= a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    float v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = a2;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col > row, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 238,invalid element %zu <= %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a2 + (((a3 - 1) * a3) >> 1));
}

uint64_t sub_227C8CDB8(uint64_t a1, unint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v5 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v6 = 134218240;
      unint64_t v7 = a2;
      __int16 v8 = 2048;
      uint64_t v9 = 3;
      _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: row < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 191,invalid row %zu > %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return a1 + 4 * a2;
}

os_log_t sub_227C8CEAC()
{
  os_log_t result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_2681B9AA8 = (uint64_t)result;
  return result;
}

float sub_227C8CEDC(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 <= a3) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = a2;
  }
  float v4 = 0.0;
  if (v3 <= 2)
  {
    uint64_t v8 = a1 + 12;
    do
    {
      float v9 = 1.0;
      float v10 = 1.0;
      if (a3 != v3)
      {
        float v10 = 0.0;
        if (v3 > a3) {
          float v10 = sub_227C8CFB8(v8, a3, v3);
        }
      }
      if (a2 != v3)
      {
        float v9 = 0.0;
        if (v3 > a2) {
          float v9 = sub_227C8CFB8(v8, a2, v3);
        }
      }
      float v4 = v4 + (float)((float)(v9 * sub_227C8D148(a1, v3++)) * v10);
    }
    while (v3 != 3);
  }
  return v4;
}

float sub_227C8CFB8(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 231,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 <= a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    uint64_t v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = a2;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col > row, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 232,invalid element %zu <= %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a2 + (((a3 - 1) * a3) >> 1)));
}

float sub_227C8D148(uint64_t a1, unint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v5 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v6 = 134218240;
      unint64_t v7 = a2;
      __int16 v8 = 2048;
      uint64_t v9 = 3;
      _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: row < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 186,invalid row %zu > %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * a2);
}

float *sub_227C8D23C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (a3 | a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    uint64_t v12 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_227B19000, v12, OS_LOG_TYPE_FAULT, "Assertion failed: i0 < N-Ni+1 && j0 < N-Nj+1, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 302,indices exceed factored matrix size.", v13, 2u);
    }
  }
  for (unint64_t i = 0; i != 3; ++i)
  {
    for (unint64_t j = 0; j != 3; ++j)
    {
      float v10 = sub_227C8CEDC(a1, i + a2, a3 + j);
      os_log_t result = (float *)sub_227C8B55C(a4, i, j);
      *os_log_t result = v10;
    }
  }
  return result;
}

float sub_227C8D350(uint64_t a1, unint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2 >= 9)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v5 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v6 = 134218240;
      unint64_t v7 = a2;
      __int16 v8 = 2048;
      uint64_t v9 = 9;
      _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: ldx < M*N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 84,invalid element %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * a2);
}

uint64_t sub_227C8D444(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a2 + 2 * a3);
}

float sub_227C8D5D0(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (3 * a3 + a2));
}

float sub_227C8D760(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a2 + 2 * a3));
}

uint64_t sub_227C8D8EC(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (3 * a3 + a2);
}

uint64_t sub_227C8DA7C(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a2 + 2 * a3);
}

float sub_227C8DC08(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a2 + 2 * a3));
}

uint64_t sub_227C8DD94(uint64_t a1, unint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v5 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v6 = 134218240;
      unint64_t v7 = a2;
      __int16 v8 = 2048;
      uint64_t v9 = 3;
      _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: i < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMVector.h, line 277,invalid index %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return a1 + 4 * a2;
}

float sub_227C8DE88(float *a1)
{
  return (float)((float)((float)((float)((float)((float)(a1[3] * a1[7]) * a1[2]) + (float)((float)(*a1 * a1[4]) * a1[8]))
                               + (float)((float)(a1[6] * a1[1]) * a1[5]))
                       + (float)((float)-(float)(*a1 * a1[7]) * a1[5]))
               + (float)((float)-(float)(a1[3] * a1[1]) * a1[8]))
       + (float)((float)-(float)(a1[6] * a1[4]) * a1[2]);
}

float sub_227C8DED0(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (3 * a3 + a2));
}

uint64_t sub_227C8E05C(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a3 + a2);
}

float sub_227C8E1E4(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    unint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC294C8);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 3;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a3 + a2));
}

uint64_t sub_227C8E36C(int a1, uint32_t __upper_bound)
{
  return arc4random_uniform(__upper_bound);
}

void sub_227C8E37C()
{
}

float sub_227C8E390(float *a1)
{
  float v1 = 1.57079633 - sub_227C8E418(a1);
  fmod(v2 + 1.57079633 + 3.14159265, 6.28318531);
  return v1;
}

float sub_227C8E418(float *a1)
{
  sub_227CA4EC8(a1, v3);
  float v1 = asinf(v3[7]);
  atan2f(v3[6], v3[8]);
  atan2f(v3[1], v3[4]);
  return v1;
}

uint64_t sub_227C8E478(uint64_t result)
{
  *(void *)os_log_t result = 0;
  *(void *)(result + 8) = 0;
  *(unsigned char *)(result + 16) = 0;
  return result;
}

double sub_227C8E484@<D0>(int *a1@<X0>, float32x4_t *a2@<X8>)
{
  int v2 = *a1;
  uint64_t v4 = 0;
  int v5 = v2;
  return sub_227CA4FB4(a2, (float *)&v4);
}

void sub_227C8E4B8(uint64_t a1, unint64_t a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (a2 >= v4)
    {
      int v5 = (float *)(a1 + 4);
      float v6 = 0.0;
      if ((float)(*(float *)(a1 + 4) + 0.0) < 0.27416)
      {
        int v9 = 1065353216;
        int v10 = 1065353216;
        if (v4)
        {
          float v7 = (double)(a2 - v4) * 0.000001;
          float v6 = v7 * 0.0000030462;
        }
        float v8 = v6;
        sub_227C8E560(v5, (uint64_t)&v10, (uint64_t)&v9, &v8);
      }
      *(void *)(a1 + 8) = a2;
    }
  }
}

void sub_227C8E560(float *a1, uint64_t a2, uint64_t a3, float *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  float v8 = *(float *)sub_227C8F03C(a2, 0, 0);
  float v9 = (float)((float)(v8 * *(float *)sub_227C8F03C(a2, 0, 0)) * *a1) + 0.0;
  float v10 = *(float *)sub_227C8F03C(a3, 0, 0);
  float v11 = v9 + (float)((float)(v10 * *(float *)sub_227C8F03C(a3, 0, 0)) * *a4);
  if (v11 <= 0.0)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    uint64_t v12 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134217984;
      uint64_t v14 = 0;
      _os_log_impl(&dword_227B19000, v12, OS_LOG_TYPE_DEBUG, "D[%zu] <= 0, matrix ! positive definite", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    *a1 = v11;
  }
}

void sub_227C8E6C0(uint64_t a1, float *a2, float *a3, float32x2_t *a4, float32x2_t *a5, unint64_t a6)
{
  unint64_t v6 = *(void *)(a1 + 8);
  if (a6 >= v6)
  {
    if (v6) {
      BOOL v8 = (a6 - v6) > 0xF4240;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8)
    {
      sub_227C9672C((uint64_t)v11, a2, a3, a4, a5);
      if (*(unsigned char *)(a1 + 16))
      {
        sub_227C8E4B8(a1, a6);
        sub_227C8E7C0((float *)a1, v11, a3);
      }
      else
      {
        sub_227C8E75C(a1, v11, a6);
      }
    }
  }
}

uint64_t sub_227C8E75C(uint64_t result, float *a2, uint64_t a3)
{
  if (!*(unsigned char *)(result + 16))
  {
    uint64_t v4 = result;
    sub_227C96780(a2);
    *(_DWORD *)uint64_t v4 = v5;
    int v6 = 1022986982;
    os_log_t result = sub_227C8E968(v4 + 4, (uint64_t)&v6);
    *(void *)(v4 + 8) = a3;
    *(unsigned char *)(v4 + 16) = 1;
  }
  return result;
}

void sub_227C8E7C0(float *a1, float *a2, _DWORD *a3)
{
  float v6 = sub_227C96730(a2, *a1);
  float v8 = v7;
  *(float *)uint64_t v43 = v6;
  *(float *)&v43[1] = v7;
  __float2 v9 = __sincosf_stret(*a1);
  v42[0] = -v9.__sinval;
  v42[1] = -v9.__cosval;
  v42[2] = v9.__cosval;
  v42[3] = -v9.__sinval;
  v41[0] = sub_227C8EA7C((uint64_t)v42, a2);
  v41[1] = v10;
  int v11 = a3[1];
  v40[0] = *a3;
  v40[1] = 0;
  _OWORD v40[2] = 0;
  v40[3] = v11;
  v33.f32[0] = a1[1] + 0.0;
  float v34 = sub_227C8ECC0((uint64_t)v41, (float *)&v33);
  float v35 = v12;
  float v38 = sub_227C8ED4C((uint64_t)v41);
  float v39 = v13;
  float v14 = sub_227C8EB98((uint64_t)&v34, (uint64_t)&v38);
  float v18 = sub_227C8EB2C((uint64_t)v40, v14, v15, v16, v17);
  float v22 = (float)(v18 * v21) - (float)(v20 * v19);
  if (fabsf(v22) >= 0.000001)
  {
    float v34 = v21 / v22;
    float v35 = (float)-v19 / v22;
    float v36 = (float)-v20 / v22;
    float v37 = v18 / v22;
    float v38 = v6;
    float v39 = v8;
    v33.i32[0] = sub_227C8ED4C((uint64_t)&v38);
    v33.i32[1] = v23;
    float v24 = sub_227C8EDCC((float *)&v33, (uint64_t)&v34);
    if ((float)((float)(v38 * v24) + (float)(v25 * v39)) < 16.266)
    {
      float32x2_t v33 = *(float32x2_t *)a3;
      float v26 = sub_227C8EE84(a1 + 1, (uint64_t)v41, (uint64_t)&v33, (uint64_t)v43);
      if (fabsf(v26) > 0.17453)
      {
        __asm { FMOV            V1.2S, #16.0 }
        float32x2_t v32 = vmul_f32(v33, _D1);
        float v26 = sub_227C8EE84(a1 + 1, (uint64_t)v41, (uint64_t)&v32, (uint64_t)v43);
      }
      *a1 = v26 + *a1;
    }
  }
}

BOOL sub_227C8E968(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  float v3 = sub_227C8F2B0(a2, 0, 0);
  *(float *)sub_227C8F1C0(a1, 0) = v3;
  float v4 = *(float *)sub_227C8F1C0(a1, 0);
  if (v4 <= 0.0)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    int v5 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134217984;
      uint64_t v8 = 0;
      _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_DEBUG, "D(%zu) <= 0 non-positive definite matrix!", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 > 0.0;
}

float sub_227C8EA7C(uint64_t a1, float *a2)
{
  unint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    float v7 = sub_227C8D760(a1, v4, 0) * *a2;
    *(float *)sub_227C8A280((uint64_t)&v12, v4) = v7;
    float v8 = sub_227C8D760(a1, v4, 1uLL);
    float v9 = a2[1];
    int v10 = (float *)sub_227C8A280((uint64_t)&v12, v4);
    char v5 = 0;
    *int v10 = *v10 + (float)(v8 * v9);
    unint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  return v12;
}

float sub_227C8EB2C(uint64_t a1, float a2, float a3, float a4, float a5)
{
  unint64_t v6 = 0;
  *(float *)float v8 = a2;
  *(float *)&v8[1] = a3;
  *(float *)&v8[2] = a4;
  *(float *)&v8[3] = a5;
  do
  {
    *(float *)&v8[v6] = sub_227C8FA54(a1, v6) + *(float *)&v8[v6];
    ++v6;
  }
  while (v6 != 4);
  return *(float *)v8;
}

float sub_227C8EB98(uint64_t a1, uint64_t a2)
{
  float v4 = sub_227C8F434(a1, 0, 0);
  float v5 = v4 * sub_227C8F8CC(a2, 0, 0);
  *(float *)sub_227C8D444((uint64_t)&v13, 0, 0) = v5;
  float v6 = sub_227C8F434(a1, 0, 0);
  float v7 = v6 * sub_227C8F8CC(a2, 0, 1uLL);
  *(float *)sub_227C8D444((uint64_t)&v13, 0, 1uLL) = v7;
  float v8 = sub_227C8F434(a1, 1uLL, 0);
  float v9 = v8 * sub_227C8F8CC(a2, 0, 0);
  *(float *)sub_227C8D444((uint64_t)&v13, 1uLL, 0) = v9;
  float v10 = sub_227C8F434(a1, 1uLL, 0);
  float v11 = v10 * sub_227C8F8CC(a2, 0, 1uLL);
  *(float *)sub_227C8D444((uint64_t)&v13, 1uLL, 1uLL) = v11;
  return v13;
}

float sub_227C8ECC0(uint64_t a1, float *a2)
{
  float v4 = sub_227C8F434(a1, 0, 0) * *a2;
  *(float *)sub_227C8F5BC((uint64_t)&v7, 0, 0) = v4;
  float v5 = sub_227C8F434(a1, 1uLL, 0) * *a2;
  *(float *)sub_227C8F5BC((uint64_t)&v7, 1uLL, 0) = v5;
  return v7;
}

float sub_227C8ED4C(uint64_t a1)
{
  float v2 = sub_227C8F434(a1, 0, 0);
  *(float *)sub_227C8F744((uint64_t)&v5, 0, 0) = v2;
  float v3 = sub_227C8F434(a1, 1uLL, 0);
  *(float *)sub_227C8F744((uint64_t)&v5, 0, 1uLL) = v3;
  return v5;
}

float sub_227C8EDCC(float *a1, uint64_t a2)
{
  unint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    float v7 = *a1;
    float v8 = v7 * sub_227C8D760(a2, 0, v4);
    *(float *)sub_227C8F744((uint64_t)&v13, 0, v4) = v8;
    float v9 = a1[1];
    float v10 = sub_227C8D760(a2, 1uLL, v4);
    float v11 = (float *)sub_227C8F744((uint64_t)&v13, 0, v4);
    char v5 = 0;
    *float v11 = *v11 + (float)(v9 * v10);
    unint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  return v13;
}

float sub_227C8EE84(float *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = 0;
  uint64_t v21 = *MEMORY[0x263EF8340];
  float v9 = 0.0;
  char v10 = 1;
  while (1)
  {
    char v11 = v10;
    float v12 = sub_227C8F434(a2, v8, 0);
    float v13 = v12 * *a1;
    float v14 = sub_227C8A18C(a3, v8) + (float)(v12 * v13);
    if (v14 <= 0.0) {
      break;
    }
    float v15 = 1.0 / v14;
    *a1 = *a1 * (float)((float)(1.0 / v14) * sub_227C8A18C(a3, v8));
    float v16 = sub_227C8A18C(a4, v8);
    char v10 = 0;
    float v9 = v9 + (float)((float)(v15 * v16) * v13);
    unint64_t v8 = 1;
    if ((v11 & 1) == 0) {
      return v9;
    }
  }
  if (qword_2681B9AA0 != -1) {
    dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
  }
  float v17 = qword_2681B9AA8;
  float v9 = 0.0;
  if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134217984;
    unint64_t v20 = v8;
    _os_log_impl(&dword_227B19000, v17, OS_LOG_TYPE_DEBUG, "%zu: alpha <= 0, matrix ! positive definite", (uint8_t *)&v19, 0xCu);
  }
  return v9;
}

os_log_t sub_227C8F00C()
{
  os_log_t result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_2681B9AA8 = (uint64_t)result;
  return result;
}

uint64_t sub_227C8F03C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    float v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      uint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    unint64_t v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      uint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a3 + a2);
}

uint64_t sub_227C8F1C0(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    char v5 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v6 = 134218240;
      uint64_t v7 = a2;
      __int16 v8 = 2048;
      uint64_t v9 = 1;
      _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: row < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 191,invalid row %zu > %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return a1 + 4 * a2;
}

float sub_227C8F2B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    uint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      uint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      uint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a3 + a2));
}

float sub_227C8F434(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    uint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a2 + 2 * a3));
}

uint64_t sub_227C8F5BC(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    uint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a2 + 2 * a3);
}

uint64_t sub_227C8F744(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    uint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a3 + a2);
}

float sub_227C8F8CC(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    uint64_t v7 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    __int16 v8 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      uint64_t v12 = 2;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a3 + a2));
}

float sub_227C8FA54(uint64_t a1, unint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2 >= 4)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29540);
    }
    char v5 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      int v6 = 134218240;
      unint64_t v7 = a2;
      __int16 v8 = 2048;
      uint64_t v9 = 4;
      _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: ldx < M*N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 84,invalid element %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * a2);
}

uint64_t sub_227C8FB48(uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  sub_227C91E38(a1 + 8);
  *(unsigned char *)(a1 + 9920) = 0;
  *(_OWORD *)(a1 + 9904) = 0u;
  *(_OWORD *)(a1 + 9888) = 0u;
  *(_OWORD *)(a1 + 9928) = 0u;
  *(_OWORD *)(a1 + 9944) = 0u;
  *(void *)(a1 + 9960) = 0xFF7FFFFF7F7FFFFFLL;
  *(void *)(a1 + 9968) = 0;
  *(void *)(a1 + 9976) = 0xFF7FFFFF7F7FFFFFLL;
  *(void *)(a1 + 9984) = 0;
  *(void *)(a1 + 9992) = 0xFF7FFFFF7F7FFFFFLL;
  *(unsigned char *)(a1 + 10000) = 0;
  *(_OWORD *)(a1 + 10008) = 0u;
  *(_DWORD *)(a1 + 10024) = 0;
  sub_227C92240(a1 + 10032);
  if (qword_2681B9A70 != -1) {
    dispatch_once(&qword_2681B9A70, &unk_26DC29560);
  }
  float v2 = qword_2681B9A78;
  if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_227B19000, v2, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService] Created CMABarrelRollService.", v4, 2u);
  }
  return a1;
}

void sub_227C8FC4C(_Unwind_Exception *a1)
{
  sub_227C8FC60(v1);
  _Unwind_Resume(a1);
}

void *sub_227C8FC60(void *a1)
{
  return a1;
}

void sub_227C8FCD0(uint64_t a1)
{
  sub_227C97F58((unsigned __int16 *)(a1 + 8));
  *(unsigned char *)(a1 + 9920) = 0;
  *(void *)(a1 + 9888) = 0;
  *(void *)(a1 + 9904) = 0;
  *(void *)(a1 + 9896) = 0;
  *(_OWORD *)(a1 + 9928) = 0u;
  *(_OWORD *)(a1 + 9944) = 0u;
  *(void *)(a1 + 9960) = 0xFF7FFFFF7F7FFFFFLL;
  *(void *)(a1 + 9968) = 0;
  *(void *)(a1 + 9976) = 0xFF7FFFFF7F7FFFFFLL;
  *(void *)(a1 + 9984) = 0;
  *(void *)(a1 + 9992) = 0xFF7FFFFF7F7FFFFFLL;
  if (qword_2681B9A70 != -1) {
    dispatch_once(&qword_2681B9A70, &unk_26DC29560);
  }
  float v2 = qword_2681B9A78;
  if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float v3 = 0;
    _os_log_impl(&dword_227B19000, v2, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[reset] Reset CMABarrelRollService.", v3, 2u);
  }
}

void sub_227C8FDA8(uint64_t a1, unint64_t a2, int a3, int a4, float a5, float a6)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (!*(unsigned char *)(a1 + 9920))
    {
LABEL_9:
      BOOL v15 = sub_227C984B8((unsigned __int16 *)(a1 + 8), a2, a3, a4, a5, a6);
      if (!*(void *)(a1 + 9936))
      {
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC29560);
        }
        float v16 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
        {
          sub_227C92464((uint64_t)v49, (void *)(a1 + 5568));
          double v17 = sub_227C905CC(v49);
          float v18 = *(float *)&v17;
          sub_227C92464((uint64_t)v48, (void *)(a1 + 4256));
          double v19 = sub_227C905CC(v48);
          uint64_t v20 = *(unsigned __int16 *)(a1 + 4354);
          uint64_t v21 = *(unsigned __int16 *)(a1 + 3042);
          *(_DWORD *)buf = 134351104;
          *(void *)int v51 = a2;
          *(_WORD *)&v51[8] = 1026;
          *(_DWORD *)&v51[10] = a3;
          *(_WORD *)&v51[14] = 2050;
          *(double *)&v51[16] = (float)(a5 * 57.296);
          __int16 v52 = 2050;
          double v53 = (float)(a6 * 57.296);
          __int16 v54 = 2050;
          double v55 = (float)(v18 * 57.296);
          __int16 v56 = 2050;
          double v57 = (float)(*(float *)&v19 * 57.296);
          __int16 v58 = 2050;
          uint64_t v59 = v20;
          __int16 v60 = 2050;
          uint64_t v61 = v21;
          __int16 v62 = 1026;
          int v63 = v15;
          _os_log_impl(&dword_227B19000, v16, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[updateRingSensor] Received first ring sensor input, timestamp: %{public}llu us, touching: %{public}d, altitude: %{public}.3f deg, azimuth: %{public}.3f deg, wAuxNorm: %{public}.3f dps, wSrcNorm: %{public}.3f dps, numAuxDM6:%{public}zu, numSrcDM6:%{public}zu, feedRing: %{public}d", buf, 0x54u);
          sub_227C923BC(v48);
          sub_227C923BC(v49);
        }
        *(void *)(a1 + 9936) = a2;
      }
      if (*(void *)(a1 + 9944)) {
        BOOL v22 = 0;
      }
      else {
        BOOL v22 = v15;
      }
      if (v22)
      {
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC29560);
        }
        __int32 v23 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
        {
          sub_227C92464((uint64_t)v47, (void *)(a1 + 5568));
          double v24 = sub_227C905CC(v47);
          float v25 = *(float *)&v24;
          sub_227C92464((uint64_t)v46, (void *)(a1 + 4256));
          double v26 = sub_227C905CC(v46);
          uint64_t v27 = *(unsigned __int16 *)(a1 + 4354);
          uint64_t v28 = *(unsigned __int16 *)(a1 + 3042);
          *(_DWORD *)buf = 134351104;
          *(void *)int v51 = a2;
          *(_WORD *)&v51[8] = 1026;
          *(_DWORD *)&v51[10] = a3;
          *(_WORD *)&v51[14] = 2050;
          *(double *)&v51[16] = (float)(a5 * 57.296);
          __int16 v52 = 2050;
          double v53 = (float)(a6 * 57.296);
          __int16 v54 = 2050;
          double v55 = (float)(v25 * 57.296);
          __int16 v56 = 2050;
          double v57 = (float)(*(float *)&v26 * 57.296);
          __int16 v58 = 2050;
          uint64_t v59 = v27;
          __int16 v60 = 2050;
          uint64_t v61 = v28;
          __int16 v62 = 1026;
          int v63 = 1;
          _os_log_impl(&dword_227B19000, v23, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[updateRingSensor] Consumed first ring sensor input, timestamp: %{public}llu us, touching: %{public}d, altitude: %{public}.3f deg, azimuth: %{public}.3f deg, wAuxNorm: %{public}.3f dps, wSrcNorm: %{public}.3f dps, numAuxDM6:%{public}zu, numSrcDM6:%{public}zu, feedRing: %{public}d", buf, 0x54u);
          sub_227C923BC(v46);
          sub_227C923BC(v47);
        }
        *(void *)(a1 + 9944) = a2;
      }
      uint64_t v29 = *(void *)(a1 + 9888);
      if (v29)
      {
        unsigned int v30 = a2 - v29;
        float v31 = (double)v30 * 0.000001;
        ++*(_DWORD *)(a1 + 9952);
        *(float *)(a1 + 9956) = *(float *)(a1 + 9956) + v31;
        if (*(float *)(a1 + 9960) > v31) {
          *(float *)(a1 + 9960) = v31;
        }
        if (*(float *)(a1 + 9964) < v31) {
          *(float *)(a1 + 9964) = v31;
        }
        float v32 = (float)v30;
        ++*(_DWORD *)(a1 + 10036);
        *(float *)(a1 + 10040) = *(float *)(a1 + 10040) + (float)v30;
        if (*(float *)(a1 + 10044) > (float)v30) {
          *(float *)(a1 + 10044) = v32;
        }
        if (*(float *)(a1 + 10048) < v32) {
          *(float *)(a1 + 10048) = v32;
        }
        uint64_t v33 = a3 ^ 1u;
        *(_DWORD *)(a1 + 10032) = v33;
        uint64_t v34 = a1 + 10032 + 16 * v33;
        float v35 = a6 * 57.296;
        float v37 = *(float *)(v34 + 76);
        float v36 = (float *)(v34 + 76);
        ++*((_DWORD *)v36 - 2);
        *(v36 - 1) = (float)(a6 * 57.296) + *(v36 - 1);
        if (v37 > (float)(a6 * 57.296)) {
          *float v36 = v35;
        }
        uint64_t v38 = a1 + 16 * v33;
        if (*(float *)(v38 + 10112) < v35) {
          *(float *)(v38 + 10112) = v35;
        }
        float v39 = a5 * 57.296;
        ++*(_DWORD *)(v38 + 10148);
        *(float *)(v38 + 10152) = (float)(a5 * 57.296) + *(float *)(v38 + 10152);
        if (*(float *)(v38 + 10156) > (float)(a5 * 57.296)) {
          *(float *)(v38 + 10156) = v39;
        }
        uint64_t v40 = a1 + 16 * v33;
        if (*(float *)(v40 + 10160) < v39) {
          *(float *)(v40 + 10160) = v39;
        }
      }
      *(void *)(a1 + 9888) = a2;
      float v41 = (float)a2 - (float)*(unint64_t *)(a1 + 9896);
      if (v41 <= 0.0) {
        float v41 = 1.0;
      }
      ++*(_DWORD *)(a1 + 10084);
      *(float *)(a1 + 10088) = *(float *)(a1 + 10088) + v41;
      if (*(float *)(a1 + 10092) > v41) {
        *(float *)(a1 + 10092) = v41;
      }
      if (*(float *)(a1 + 10096) < v41) {
        *(float *)(a1 + 10096) = v41;
      }
      sub_227C90650(a1, a2);
      return;
    }
    unint64_t v12 = *(void *)(a1 + 9888);
    if (a2 > v12)
    {
      int v13 = a2 - v12;
      if ((a2 - v12) >= 0x11E1A301)
      {
        sub_227C8FCD0(a1);
        sub_227C904C8((int *)a1, 2, a2);
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC29560);
        }
        float v14 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67240448;
          *(_DWORD *)int v51 = v13;
          *(_WORD *)&v51[4] = 2050;
          *(void *)&v51[6] = a2;
          _os_log_impl(&dword_227B19000, v14, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateRingSensor] Reset due to large ring sensor timestamp gap. Time gap:%{public}u us, timestamp: %{public}llu us.", buf, 0x12u);
        }
      }
      goto LABEL_9;
    }
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29560);
    }
    int v44 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      uint64_t v45 = *(void *)(a1 + 9888);
      *(_DWORD *)buf = 134349312;
      *(void *)int v51 = a2;
      *(_WORD *)&v51[8] = 2050;
      *(void *)&v51[10] = v45;
      _os_log_impl(&dword_227B19000, v44, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateRingSensor] Ring sensor timestamps must be monotonically increasing. Input: %{public}llu us, previous: %{public}llu us.", buf, 0x16u);
    }
  }
  else
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29560);
    }
    double v42 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = *(void *)(a1 + 9888);
      *(_DWORD *)buf = 134349312;
      *(void *)int v51 = 0;
      *(_WORD *)&v51[8] = 2050;
      *(void *)&v51[10] = v43;
      _os_log_impl(&dword_227B19000, v42, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateRingSensor] Reset due to unexpected zero ring sensor timestamp. Input: %{public}llu us, previous: %{public}llu us.", buf, 0x16u);
    }
    sub_227C8FCD0(a1);
    sub_227C904C8((int *)a1, 5, 0);
  }
}

void sub_227C90480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
}

void sub_227C904C8(int *a1, int a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*a1 != a2)
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29560);
    }
    int v6 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *a1;
      v8[0] = 67240704;
      v8[1] = v7;
      __int16 v9 = 1026;
      int v10 = a2;
      __int16 v11 = 2050;
      uint64_t v12 = a3;
      _os_log_impl(&dword_227B19000, v6, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[setTrackingStatus] Status changed from: %{public}d to %{public}d, timestamp: %{public}llu us .", (uint8_t *)v8, 0x18u);
    }
    *a1 = a2;
  }
}

double sub_227C905CC(void *a1)
{
  unint64_t v1 = a1[5];
  if (!v1) {
    return 0.0;
  }
  uint64_t v2 = a1[1];
  double result = 0.0;
  if (a1[2] != v2)
  {
    unint64_t v4 = a1[4];
    char v5 = (float **)(v2 + 8 * (v4 >> 10));
    int v6 = *v5;
    int v7 = &(*v5)[v4 & 0x3FF];
    uint64_t v8 = *(void *)(v2 + (((v4 + v1) >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * ((v4 + v1) & 0x3FF);
    while (v7 != (float *)v8)
    {
      float v9 = *v7++;
      float v10 = v9;
      if ((char *)v7 - (char *)v6 == 4096)
      {
        __int16 v11 = v5[1];
        ++v5;
        int v6 = v11;
        int v7 = v11;
      }
      *(float *)&double result = *(float *)&result + v10;
    }
  }
  *(float *)&double result = *(float *)&result / (float)v1;
  return result;
}

void sub_227C90650(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = (unsigned char *)(a1 + 6184);
  if (!*(unsigned char *)(a1 + 9920) && *v2)
  {
    *(unsigned char *)(a1 + 9920) = 1;
    *(void *)(a1 + 9928) = a2;
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29560);
    }
    unint64_t v4 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 9928);
      int v6 = v2[744];
      uint64_t v7 = *(unsigned __int16 *)(a1 + 10);
      uint64_t v8 = *(unsigned __int16 *)(a1 + 4354);
      uint64_t v9 = *(unsigned __int16 *)(a1 + 3042);
      sub_227C92464((uint64_t)v18, (void *)(a1 + 5568));
      double v10 = sub_227C905CC(v18);
      float v11 = *(float *)&v10;
      sub_227C92464((uint64_t)v17, (void *)(a1 + 4256));
      double v12 = sub_227C905CC(v17);
      *(_DWORD *)buf = 134350592;
      uint64_t v20 = v5;
      __int16 v21 = 1026;
      int v22 = v6;
      __int16 v23 = 2050;
      uint64_t v24 = v7;
      __int16 v25 = 2050;
      uint64_t v26 = v8;
      __int16 v27 = 2050;
      uint64_t v28 = v9;
      __int16 v29 = 2050;
      double v30 = (float)(v11 * 57.296);
      __int16 v31 = 2050;
      double v32 = (float)(*(float *)&v12 * 57.296);
      _os_log_impl(&dword_227B19000, v4, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[checkSessionStarted] BarrelRoll session start timestamp: %{public}llu microseconds, initialized during no-trust: %{public}d, numRingSensor: %{public}zu, numAuxDM6: %{public}zu, numSrcDM6: %{public}zu, wAuxNorm: %{public}f dps, wSrcNorm: %{public}f dps", buf, 0x44u);
      sub_227C923BC(v17);
      sub_227C923BC(v18);
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29560);
      }
    }
    uint64_t v13 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 9928) - *(void *)(a1 + 9944);
      *(_DWORD *)buf = 134349056;
      uint64_t v20 = v14;
      _os_log_impl(&dword_227B19000, v13, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[checkSessionStarted] Time elapsed between first consumed ring sensor and session start: %{public}llu microseconds.", buf, 0xCu);
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29560);
      }
    }
    BOOL v15 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 9944) - *(void *)(a1 + 9936);
      *(_DWORD *)buf = 134349056;
      uint64_t v20 = v16;
      _os_log_impl(&dword_227B19000, v15, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[checkSessionStarted] Time elapsed between first consumed ring sensor and first ring sensor: %{public}llu microseconds.", buf, 0xCu);
    }
  }
}

void sub_227C90900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
}

void sub_227C9092C(uint64_t a1, unint64_t a2, float *a3, float32x4_t a4, float a5)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (a2)
  {
    float v7 = a4.f32[0];
    if (!*(unsigned char *)(a1 + 9920))
    {
LABEL_9:
      sub_227C90DDC(a3, &v29, a4);
      sub_227CA4C8C(&v29, (float32x4_t *)buf);
      sub_227C99BB0(a1 + 8, a2, (float32x4_t *)buf, v7, a5);
      uint64_t v13 = *(void *)(a1 + 9896);
      if (v13) {
        goto LABEL_15;
      }
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29560);
      }
      uint64_t v14 = qword_2681B9A78;
      if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134350336;
        *(void *)__int16 v31 = a2;
        *(_WORD *)&v31[8] = 2050;
        *(double *)&v31[10] = (float)(v7 * 57.296);
        __int16 v32 = 2050;
        double v33 = v29.f32[0];
        __int16 v34 = 2050;
        double v35 = v29.f32[1];
        __int16 v36 = 2050;
        double v37 = v29.f32[2];
        __int16 v38 = 2050;
        double v39 = v29.f32[3];
        _os_log_impl(&dword_227B19000, v14, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[updateAuxDM] Received first aux DM6 input, timestamp: %{public}llu us, wNorm: %{public}.3f dps, q_p_ip: %{public}.3f %{public}.3f %{public}.3f %{public}.3f", buf, 0x3Eu);
      }
      uint64_t v13 = *(void *)(a1 + 9896);
      if (v13)
      {
LABEL_15:
        unsigned int v15 = a2 - v13;
        float v16 = (double)v15 * 0.000001;
        ++*(_DWORD *)(a1 + 9984);
        *(float *)(a1 + 9988) = *(float *)(a1 + 9988) + v16;
        if (*(float *)(a1 + 9992) > v16) {
          *(float *)(a1 + 9992) = v16;
        }
        if (*(float *)(a1 + 9996) < v16) {
          *(float *)(a1 + 9996) = v16;
        }
        float v17 = (float)v15;
        ++*(_DWORD *)(a1 + 10068);
        *(float *)(a1 + 10072) = *(float *)(a1 + 10072) + (float)v15;
        if (*(float *)(a1 + 10076) > (float)v15) {
          *(float *)(a1 + 10076) = v17;
        }
        if (*(float *)(a1 + 10080) < v17) {
          *(float *)(a1 + 10080) = v17;
        }
        uint64_t v18 = *(unsigned int *)(a1 + 10032);
        uint64_t v19 = a1 + 10032 + 16 * v18;
        float v20 = v7 * 57.296;
        float v22 = *(float *)(v19 + 220);
        __int16 v21 = (float *)(v19 + 220);
        ++*((_DWORD *)v21 - 2);
        *(v21 - 1) = (float)(v7 * 57.296) + *(v21 - 1);
        if (v22 > (float)(v7 * 57.296)) {
          *__int16 v21 = v20;
        }
        uint64_t v23 = a1 + 16 * v18;
        if (*(float *)(v23 + 10256) < v20) {
          *(float *)(v23 + 10256) = v20;
        }
        ++*(_DWORD *)(v23 + 10292);
        *(float *)(v23 + 10296) = *(float *)(v23 + 10296) + a5;
        if (*(float *)(v23 + 10300) > a5) {
          *(float *)(v23 + 10300) = a5;
        }
        uint64_t v24 = a1 + 16 * v18;
        if (*(float *)(v24 + 10304) < a5) {
          *(float *)(v24 + 10304) = a5;
        }
      }
      *(void *)(a1 + 9896) = a2;
      return;
    }
    unint64_t v10 = *(void *)(a1 + 9896);
    if (a2 > v10)
    {
      int v11 = a2 - v10;
      if ((a2 - v10) >= 0x186A1)
      {
        sub_227C8FCD0(a1);
        sub_227C904C8((int *)a1, 3, a2);
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC29560);
        }
        double v12 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67240448;
          *(_DWORD *)__int16 v31 = v11;
          *(_WORD *)&v31[4] = 2050;
          *(void *)&v31[6] = a2;
          _os_log_impl(&dword_227B19000, v12, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateAuxDM] Reset due to large aux DM6 timestamp gap. Time gap:%{public}u us, timestamp: %{public}llu us.", buf, 0x12u);
        }
      }
      goto LABEL_9;
    }
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29560);
    }
    __int16 v27 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = *(void *)(a1 + 9896);
      *(_DWORD *)buf = 134349312;
      *(void *)__int16 v31 = a2;
      *(_WORD *)&v31[8] = 2050;
      *(void *)&v31[10] = v28;
      _os_log_impl(&dword_227B19000, v27, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateAuxDM] Aux DM6 timestamps must be monotonically increasing. Input: %{public}llu us, previous: %{public}llu us.", buf, 0x16u);
    }
  }
  else
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29560);
    }
    __int16 v25 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *(void *)(a1 + 9896);
      *(_DWORD *)buf = 134349312;
      *(void *)__int16 v31 = 0;
      *(_WORD *)&v31[8] = 2050;
      *(void *)&v31[10] = v26;
      _os_log_impl(&dword_227B19000, v25, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateAuxDM] Reset due to unexpected zero Aux DM6 timestamp. Input: %{public}llu us, previous: %{public}llu us.", buf, 0x16u);
    }
    sub_227C8FCD0(a1);
    sub_227C904C8((int *)a1, 6, 0);
  }
}

double sub_227C90DDC@<D0>(float *a1@<X0>, float32x4_t *a2@<X8>, float32x4_t a3@<Q0>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9C48, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9C48))
  {
    qword_2681B9C38 = 0x3FC90FDB00000000;
    dword_2681B9C40 = 0;
    __cxa_guard_release(&qword_2681B9C48);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9C60, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9C60))
  {
    qword_2681B9C50 = 3217625051;
    dword_2681B9C58 = 0;
    __cxa_guard_release(&qword_2681B9C60);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9C78, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9C78))
  {
    sub_227CA4FB4(&v8, (float *)&qword_2681B9C50);
    *(double *)v6.i64 = sub_227CA4FB4(&v7, (float *)&qword_2681B9C38);
    sub_227CA4C0C((uint64_t)&v8, v7.f32, &xmmword_2681B9C68, v6);
    __cxa_guard_release(&qword_2681B9C78);
  }
  return sub_227CA4C0C((uint64_t)&xmmword_2681B9C68, a1, a2, a3);
}

void sub_227C90F10(_Unwind_Exception *a1)
{
}

void sub_227C90F2C(uint64_t a1, unint64_t a2, uint64_t a3, float a4, float a5)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29560);
    }
    double v33 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = *(void *)(a1 + 9904);
      int v46 = 134349312;
      *(void *)float v47 = 0;
      *(_WORD *)&v47[8] = 2050;
      *(void *)&v47[10] = v34;
      _os_log_impl(&dword_227B19000, v33, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateSrcDM] Reset due to unexpected zero Src DM6 timestamp. Input: %{public}llu us, previous: %{public}llu us.", (uint8_t *)&v46, 0x16u);
    }
    sub_227C8FCD0(a1);
    double v35 = (int *)a1;
    int v36 = 7;
    uint64_t v37 = 0;
    goto LABEL_48;
  }
  unint64_t v7 = *(void *)(a1 + 9904);
  if (a2 > v7)
  {
    int v11 = (unsigned char *)(a1 + 6184);
    if (v7) {
      unsigned int v12 = a2 - v7;
    }
    else {
      unsigned int v12 = 0;
    }
    if (v12 >= 0x186A1)
    {
      sub_227C8FCD0(a1);
      sub_227C904C8((int *)a1, 4, a2);
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29560);
      }
      uint64_t v13 = qword_2681B9A78;
      if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
      {
        int v46 = 67240448;
        *(_DWORD *)float v47 = v12;
        *(_WORD *)&v47[4] = 2050;
        *(void *)&void v47[6] = a2;
        _os_log_impl(&dword_227B19000, v13, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollSession]:[updateSrcDM] Reset due to large Src DM6 timestamp gap. Time gap:%{public}u us, timestamp: %{public}llu us.", (uint8_t *)&v46, 0x12u);
      }
    }
    if (!*(unsigned char *)(a1 + 9920)) {
      goto LABEL_16;
    }
    unint64_t v14 = *(void *)(a1 + 9896);
    if (a2 > v14 && (int v15 = a2 - v14, (a2 - v14) >= 0x30D41))
    {
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29560);
      }
      uint64_t v40 = qword_2681B9A78;
      if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
      {
        uint64_t v41 = *(void *)(a1 + 9896);
        double v42 = *(double *)(a1 + 9888);
        int v46 = 134350080;
        *(void *)float v47 = a2;
        *(_WORD *)&v47[8] = 2050;
        *(void *)&v47[10] = v41;
        __int16 v48 = 2050;
        double v49 = v42;
        __int16 v50 = 1026;
        *(_DWORD *)int v51 = v15;
        *(_WORD *)&v51[4] = 1026;
        *(_DWORD *)&v51[6] = 200000;
        _os_log_impl(&dword_227B19000, v40, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateSrcDM] Reset due to large gap between the latest source and aux sample. Aux is too far in the past, likely due to a gap.Latest src timestamp: %{public}llu us, latest aux timestamp: %{public}llu us, latest ring sensor timestamp: %{public}llu us, src-to-aux-delta:%{public}u us, threshold:%{public}u us.", (uint8_t *)&v46, 0x2Cu);
      }
      sub_227C8FCD0(a1);
      double v35 = (int *)a1;
      int v36 = 3;
    }
    else
    {
      unint64_t v16 = *(void *)(a1 + 9888);
      if (a2 <= v16 || (int v17 = a2 - v16, (a2 - v16) < 0x11E1A301))
      {
LABEL_16:
        sub_227C9A8F8((unsigned __int16 *)(a1 + 8), a2, (_OWORD *)a3, a4, a5);
        if (!*(void *)(a1 + 9904))
        {
          if (qword_2681B9A70 != -1) {
            dispatch_once(&qword_2681B9A70, &unk_26DC29560);
          }
          uint64_t v18 = qword_2681B9A78;
          if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
          {
            double v19 = *(float *)a3;
            double v20 = *(float *)(a3 + 4);
            double v21 = *(float *)(a3 + 8);
            double v22 = *(float *)(a3 + 12);
            int v46 = 134350336;
            *(void *)float v47 = a2;
            *(_WORD *)&v47[8] = 2050;
            *(double *)&v47[10] = (float)(a4 * 57.296);
            __int16 v48 = 2050;
            double v49 = v19;
            __int16 v50 = 2050;
            *(double *)int v51 = v20;
            *(_WORD *)&v51[8] = 2050;
            double v52 = v21;
            __int16 v53 = 2050;
            double v54 = v22;
            _os_log_impl(&dword_227B19000, v18, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[updateSrcDM] Received first src DM6 input, timestamp: %{public}llu us, wNorm: %{public}.3f dps, q_s_is: %{public}.3f %{public}.3f %{public}.3f %{public}.3f", (uint8_t *)&v46, 0x3Eu);
          }
        }
        if (*(void *)(a1 + 9888) + 16666 < a2) {
          *(_DWORD *)(a1 + 10032) = 2;
        }
        uint64_t v23 = *(void *)(a1 + 9904);
        if (v23)
        {
          unsigned int v24 = a2 - v23;
          float v25 = (double)v24 * 0.000001;
          ++*(_DWORD *)(a1 + 9968);
          *(float *)(a1 + 9972) = *(float *)(a1 + 9972) + v25;
          if (*(float *)(a1 + 9976) > v25) {
            *(float *)(a1 + 9976) = v25;
          }
          if (*(float *)(a1 + 9980) < v25) {
            *(float *)(a1 + 9980) = v25;
          }
          float v26 = (float)v24;
          ++*(_DWORD *)(a1 + 10052);
          *(float *)(a1 + 10056) = *(float *)(a1 + 10056) + (float)v24;
          if (*(float *)(a1 + 10060) > (float)v24) {
            *(float *)(a1 + 10060) = v26;
          }
          if (*(float *)(a1 + 10064) < v26) {
            *(float *)(a1 + 10064) = v26;
          }
          uint64_t v27 = *(unsigned int *)(a1 + 10032);
          uint64_t v28 = a1 + 10032 + 16 * v27;
          float v29 = a4 * 57.296;
          float v31 = *(float *)(v28 + 172);
          double v30 = (float *)(v28 + 172);
          ++*((_DWORD *)v30 - 2);
          *(v30 - 1) = (float)(a4 * 57.296) + *(v30 - 1);
          if (v31 > (float)(a4 * 57.296)) {
            *double v30 = v29;
          }
          uint64_t v32 = a1 + 16 * v27;
          if (*(float *)(v32 + 10208) < v29) {
            *(float *)(v32 + 10208) = v29;
          }
        }
        *(void *)(a1 + 9904) = a2;
        sub_227C90650(a1, a2);
        if (*(_DWORD *)a1 != 1 && *v11) {
          sub_227C904C8((int *)a1, 1, a2);
        }
        if (*(unsigned char *)(a1 + 10000))
        {
          if (!*(void *)(a1 + 10008)) {
            *(void *)(a1 + 10008) = a2;
          }
        }
        sub_227C915AC((int *)a1, a2);
        return;
      }
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29560);
      }
      uint64_t v43 = qword_2681B9A78;
      if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = *(void *)(a1 + 9888);
        double v45 = *(double *)(a1 + 9896);
        int v46 = 134350080;
        *(void *)float v47 = a2;
        *(_WORD *)&v47[8] = 2050;
        *(void *)&v47[10] = v44;
        __int16 v48 = 2050;
        double v49 = v45;
        __int16 v50 = 1026;
        *(_DWORD *)int v51 = v17;
        *(_WORD *)&v51[4] = 1026;
        *(_DWORD *)&v51[6] = 300000000;
        _os_log_impl(&dword_227B19000, v43, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[updateSrcDM] Reset due to large gap between the latest source and ring sample. Ring is too far in the past, likely due to pencil being away from screen.Latest src timestamp: %{public}llu us, latest ring sensor timestamp: %{public}llu us, latest aux timestamp: %{public}llu us, src-to-ring-delta:%{public}u us, threshold:%{public}u us.", (uint8_t *)&v46, 0x2Cu);
      }
      sub_227C8FCD0(a1);
      double v35 = (int *)a1;
      int v36 = 2;
    }
    uint64_t v37 = a2;
LABEL_48:
    sub_227C904C8(v35, v36, v37);
    return;
  }
  if (qword_2681B9A70 != -1) {
    dispatch_once(&qword_2681B9A70, &unk_26DC29560);
  }
  __int16 v38 = qword_2681B9A78;
  if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
  {
    uint64_t v39 = *(void *)(a1 + 9904);
    int v46 = 134349312;
    *(void *)float v47 = a2;
    *(_WORD *)&v47[8] = 2050;
    *(void *)&v47[10] = v39;
    _os_log_impl(&dword_227B19000, v38, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateSrcDM] Src DM6 timestamps must be monotonically increasing. Input: %{public}llu us, previous: %{public}llu us.", (uint8_t *)&v46, 0x16u);
  }
}

void sub_227C915AC(int *a1, unint64_t a2)
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  unint64_t v2 = a2 - *((void *)a1 + 1239);
  if (v2 >= 0x4C4B40)
  {
    int v5 = *a1;
    if (*a1 == 1 || v5 != a1[2506])
    {
      float32x4_t v6 = (unsigned __int8 *)(a1 + 1732);
      *((void *)a1 + 1239) = a2;
      a1[2506] = v5;
      sub_227C9D380((uint64_t)(a1 + 2), (float32x4_t *)buf);
      sub_227CA4C6C((float32x2_t *)buf, &v62, v7);
      float v8 = sub_227C8E390(v62.f32);
      float v10 = v9;
      float v12 = v11;
      double v13 = -1.0;
      double v14 = -1.0;
      if (*((unsigned char *)a1 + 9920))
      {
        float v15 = (double)(a2 - *((void *)a1 + 1241)) * 0.000001;
        double v14 = v15;
      }
      unint64_t v16 = *((void *)a1 + 1251);
      if (a2 > v16 && v16)
      {
        float v17 = (double)(a2 - v16) * 0.000001;
        double v13 = v17;
      }
      unint64_t v18 = *((void *)a1 + 1236);
      unint64_t v19 = *((void *)a1 + 1237);
      double v20 = -1.0;
      double v21 = -1.0;
      BOOL v22 = v18 > v19;
      unint64_t v23 = v18 - v19;
      if (v22)
      {
        float v24 = (double)v23 * 0.001;
        double v21 = v24;
      }
      unint64_t v25 = *((void *)a1 + 1238);
      BOOL v26 = v25 >= v19;
      unint64_t v27 = v25 - v19;
      if (v27 != 0 && v26)
      {
        float v28 = (double)v27 * 0.001;
        double v20 = v28;
      }
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29560);
      }
      float v29 = qword_2681B9A78;
      if (!os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      int v30 = a1[2488];
      float v31 = *((float *)a1 + 2489);
      if (v30 && (float v32 = v31 / (float)v30, v32 >= 0.000001))
      {
        int v33 = (int)(float)(1.0 / v32);
      }
      else
      {
        int v33 = 0;
        if (!v30)
        {
          double v34 = 0.0;
LABEL_24:
          int v35 = a1[2492];
          float v36 = *((float *)a1 + 2493);
          if (v35 && (float v37 = v36 / (float)v35, v37 >= 0.000001)) {
            int v38 = (int)(float)(1.0 / v37);
          }
          else {
            int v38 = 0;
          }
          if (v35) {
            double v39 = (float)((float)(v36 / (float)v35) * 1000.0);
          }
          else {
            double v39 = 0.0;
          }
          float v40 = *((float *)a1 + 2490) * 1000.0;
          int v41 = a1[2496];
          float v42 = *((float *)a1 + 2497);
          float v43 = *((float *)a1 + 2495) * 1000.0;
          if (v41 && (float v44 = v42 / (float)v41, v44 >= 0.000001)) {
            int v45 = (int)(float)(1.0 / v44);
          }
          else {
            int v45 = 0;
          }
          int v46 = *a1;
          int v47 = *((unsigned __int8 *)a1 + 9920);
          int v48 = *((unsigned __int8 *)a1 + 10000);
          uint64_t v49 = *((void *)a1 + 1251);
          int v50 = *v6;
          uint64_t v51 = *((void *)a1 + 1236);
          double v52 = v31;
          double v53 = (float)(*((float *)a1 + 2491) * 1000.0);
          double v54 = v36;
          double v55 = (float)(*((float *)a1 + 2494) * 1000.0);
          double v56 = v42;
          double v57 = (float)(*((float *)a1 + 2498) * 1000.0);
          double v58 = (float)(*((float *)a1 + 2499) * 1000.0);
          if (v41) {
            double v59 = (float)((float)(v42 / (float)v41) * 1000.0);
          }
          else {
            double v59 = 0.0;
          }
          uint64_t v60 = *((void *)a1 + 1238);
          uint64_t v61 = *((void *)a1 + 1237);
          *(_DWORD *)buf = 134359040;
          unint64_t v64 = a2;
          __int16 v65 = 1026;
          int v66 = v46;
          __int16 v67 = 2050;
          unint64_t v68 = v2;
          __int16 v69 = 1026;
          int v70 = v47;
          __int16 v71 = 1026;
          int v72 = v48;
          __int16 v73 = 2050;
          uint64_t v74 = v49;
          __int16 v75 = 2050;
          double v76 = v14;
          __int16 v77 = 2050;
          double v78 = v13;
          __int16 v79 = 1026;
          int v80 = v50;
          __int16 v81 = 2050;
          uint64_t v82 = v51;
          __int16 v83 = 2050;
          double v84 = v62.f32[0];
          __int16 v85 = 2050;
          double v86 = v62.f32[1];
          __int16 v87 = 2050;
          double v88 = v62.f32[2];
          __int16 v89 = 2050;
          double v90 = v62.f32[3];
          __int16 v91 = 2050;
          double v92 = (float)(v12 * 57.296);
          __int16 v93 = 2050;
          double v94 = (float)(v10 * 57.296);
          __int16 v95 = 2050;
          double v96 = (float)(v8 * 57.296);
          __int16 v97 = 1026;
          int v98 = v33;
          __int16 v99 = 2050;
          double v100 = v52;
          __int16 v101 = 1026;
          int v102 = v30;
          __int16 v103 = 2050;
          double v104 = v40;
          __int16 v105 = 2050;
          double v106 = v53;
          __int16 v107 = 2050;
          double v108 = v34;
          __int16 v109 = 1026;
          int v110 = v38;
          __int16 v111 = 2050;
          double v112 = v54;
          __int16 v113 = 1026;
          int v114 = v35;
          __int16 v115 = 2050;
          double v116 = v55;
          __int16 v117 = 2050;
          double v118 = v43;
          __int16 v119 = 2050;
          double v120 = v39;
          __int16 v121 = 1026;
          int v122 = v45;
          __int16 v123 = 2050;
          double v124 = v56;
          __int16 v125 = 1026;
          int v126 = v41;
          __int16 v127 = 2050;
          double v128 = v57;
          __int16 v129 = 2050;
          double v130 = v58;
          __int16 v131 = 2050;
          double v132 = v59;
          __int16 v133 = 2050;
          uint64_t v134 = v51;
          __int16 v135 = 2050;
          uint64_t v136 = v60;
          __int16 v137 = 2050;
          uint64_t v138 = v61;
          __int16 v139 = 2050;
          double v140 = v21;
          __int16 v141 = 2050;
          double v142 = v20;
          _os_log_impl(&dword_227B19000, v29, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[periodicSysDiagnoseLog] { timestamp: %{public}llu us, trackingStatus: %{public}d, sinceLastLog: %{public}llu us, fSessionStarted: %{public}d, HID started flag: %{public}d , HID start timestamp: %{public}llu us, durationSinceSessionStart: %{public}.1f s, durationSinceHIDStart: %{public}.1f s }, { initialized during no-trust: %{public}d, }, { Latest estimate: timestamp: %{public}llu us, Q_SP: %{public}.3f %{public}.3f %{public}.3f %{public}.3f, roll: %{public}.1f deg, azimuth: %{public}.1f deg, altitude: %{public}.1f deg } { Ring: avgNumSamplesPerSecond: %{public}u, over: %{public}.1f s, num samples: %{public}d, sample period min/max/avg: %{public}.1f/%{public}.1f/%{public}.1f ms }, { Src : avgNumSamplesPerSecond: %{public}u, over: %{public}.1f s, num samples: %{public}d, sample period min/max/avg: %{public}.1f/%{public}.1f/%{public}.1f ms }, { Aux : avgNumSamplesPerSecond: %{public}u, over: %{public}.1f s, num samples: %{public}d, sample period min/max/avg: %{public}.1f/%{public}.1f/%{public}.1f ms }, { Latest timestamp ring / src / aux: %{public}llu us / %{public}llu us/ %{public}llu us }, { Aux-to-Ring Delay: %{public}.1f ms, Aux-to-Src Delay: %{public}.1f ms  }", buf, 0x16Au);
LABEL_39:
          *((void *)a1 + 1244) = 0;
          *((void *)a1 + 1245) = 0xFF7FFFFF7F7FFFFFLL;
          *((void *)a1 + 1246) = 0;
          *((void *)a1 + 1247) = 0xFF7FFFFF7F7FFFFFLL;
          *((void *)a1 + 1248) = 0;
          *((void *)a1 + 1249) = 0xFF7FFFFF7F7FFFFFLL;
          return;
        }
      }
      double v34 = (float)((float)(v31 / (float)v30) * 1000.0);
      goto LABEL_24;
    }
  }
}

void sub_227C91AE4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 10000))
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29560);
    }
    uint64_t v2 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 9904);
      uint64_t v4 = *(void *)(a1 + 10008);
      int v11 = 134349312;
      uint64_t v12 = v3;
      __int16 v13 = 2050;
      uint64_t v14 = v4;
      int v5 = "[BarrelRoll]:[CMABarrelRollService]:[informStartPencilFusionUpdates] Called hidStartedPencilFusionUpdates whe"
           "n the start flag was already true. Latest src timestamp: %{public}llu us, HID start timestamp: %{public}llu";
      float32x4_t v6 = v2;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_227B19000, v6, v7, v5, (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(a1 + 10000) = 1;
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29560);
    }
    uint64_t v8 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 9904);
      uint64_t v10 = *(void *)(a1 + 10008);
      int v11 = 134349312;
      uint64_t v12 = v9;
      __int16 v13 = 2050;
      uint64_t v14 = v10;
      int v5 = "[BarrelRoll]:[CMABarrelRollService]:[informStartPencilFusionUpdates] HID started pencil fusion updates.  Late"
           "st src timestamp: %{public}llu us, fTimeStampHIDStartedPencilFusionUpdates: %{public}llu";
      float32x4_t v6 = v8;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }
}

void sub_227C91C5C(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 10000))
  {
    *(unsigned char *)(a1 + 10000) = 0;
    unint64_t v2 = *(void *)(a1 + 9904);
    *(void *)(a1 + 10016) = v2;
    unint64_t v3 = *(void *)(a1 + 10008);
    double v4 = -1.0;
    BOOL v5 = v2 > v3;
    unint64_t v6 = v2 - v3;
    if (v5)
    {
      float v7 = (double)v6 * 0.000001;
      double v4 = v7;
    }
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29560);
    }
    uint64_t v8 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 9904);
      uint64_t v10 = *(void *)(a1 + 10008);
      uint64_t v11 = *(void *)(a1 + 10016);
      int v20 = 134349824;
      double v21 = v4;
      __int16 v22 = 2050;
      uint64_t v23 = v9;
      __int16 v24 = 2050;
      uint64_t v25 = v10;
      __int16 v26 = 2050;
      uint64_t v27 = v11;
      uint64_t v12 = "[BarrelRoll]:[CMABarrelRollService]:[informStopPencilFusionUpdates] HID stopped pencil fusion updates. Sessi"
            "on duration: %{public}.1f s. Latest src timestamp: %{public}llu us, HID start timestamp: %{public}llu, HID s"
            "top timestamp: %{public}llu .";
      __int16 v13 = v8;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 42;
LABEL_13:
      _os_log_impl(&dword_227B19000, v13, v14, v12, (uint8_t *)&v20, v15);
    }
  }
  else
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29560);
    }
    uint64_t v16 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      double v17 = *(double *)(a1 + 9904);
      uint64_t v18 = *(void *)(a1 + 10008);
      uint64_t v19 = *(void *)(a1 + 10016);
      int v20 = 134349568;
      double v21 = v17;
      __int16 v22 = 2050;
      uint64_t v23 = v18;
      __int16 v24 = 2050;
      uint64_t v25 = v19;
      uint64_t v12 = "[BarrelRoll]:[CMABarrelRollService]:[informStopPencilFusionUpdates] Called hidStoppedPencilFusionUpdates whe"
            "n the start flag was already false. Latest src timestamp: %{public}llu us, HID start timestamp: %{public}llu"
            ", HID stop timestamp: %{public}llu .";
      __int16 v13 = v16;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 32;
      goto LABEL_13;
    }
  }
}

uint64_t sub_227C91E2C(uint64_t a1, uint64_t a2, float a3, float a4, float a5, float a6, float a7)
{
  return sub_227C8A374(a1 + 10032, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_227C91E38(uint64_t a1)
{
  *(void *)a1 = 0x7800000000;
  *(void *)(a1 + 968) = 0x7800000000;
  *(void *)(a1 + 1936) = 0x7800000000;
  *(void *)(a1 + 2904) = 0x7800000000;
  *(void *)(a1 + 3032) = 0x3200000000;
  *(void *)(a1 + 3440) = 0x3200000000;
  *(_OWORD *)(a1 + 4248) = 0u;
  *(_OWORD *)(a1 + 4264) = 0u;
  *(_OWORD *)(a1 + 4280) = 0u;
  *(_OWORD *)(a1 + 4296) = 0u;
  *(_OWORD *)(a1 + 4312) = 0u;
  *(_OWORD *)(a1 + 4328) = 0u;
  *(void *)(a1 + 4344) = 0x3200000000;
  *(void *)(a1 + 4752) = 0x3200000000;
  *(_OWORD *)(a1 + 5560) = 0u;
  *(_OWORD *)(a1 + 5576) = 0u;
  *(_OWORD *)(a1 + 5592) = 0u;
  *(_OWORD *)(a1 + 5608) = 0u;
  *(_OWORD *)(a1 + 5624) = 0u;
  *(_OWORD *)(a1 + 5640) = 0u;
  *(void *)(a1 + 5656) = 0x7800000000;
  *(_OWORD *)(a1 + 6144) = 0u;
  *(unsigned char *)(a1 + 6168) = 1;
  *(void *)(a1 + 6160) = 0x3F80000000000000;
  sub_227C91FDC(a1 + 6176);
  *(void *)(a1 + 6696) = 0;
  *(unsigned char *)(a1 + 6704) = 0;
  *(void *)(a1 + 6708) = 0;
  *(void *)(a1 + 6716) = 0x3F80000000000000;
  *(void *)(a1 + 6728) = 0;
  *(void *)(a1 + 6776) = 0;
  *(void *)(a1 + 6784) = 0x3F80000000000000;
  *(void *)(a1 + 6792) = 0;
  *(unsigned char *)(a1 + 6800) = 0;
  *(void *)(a1 + 6804) = 0;
  *(void *)(a1 + 6812) = 0x3F80000000000000;
  *(void *)(a1 + 6824) = 0;
  *(void *)(a1 + 6872) = 0;
  *(void *)(a1 + 6880) = 0x3F80000000000000;
  *(void *)(a1 + 6896) = 0;
  *(void *)(a1 + 6904) = 0x3F80000000000000;
  *(_WORD *)(a1 + 6920) = 0;
  *(_OWORD *)(a1 + 6924) = xmmword_227CC5D20;
  sub_227CA506C((float32x4_t *)(a1 + 6924), (float32x4_t)xmmword_227CC5D20);
  *(void *)(a1 + 6944) = 0;
  *(unsigned char *)(a1 + 6952) = 0;
  *(_DWORD *)(a1 + 6968) = 0;
  *(void *)(a1 + 6976) = 0x7800000000;
  *(void *)(a1 + 7944) = 0x7800000000;
  *(_DWORD *)(a1 + 9872) = 0;
  *(_WORD *)(a1 + 9876) = 0;
  return a1;
}

void sub_227C91F88(_Unwind_Exception *a1)
{
  sub_227C92120(v1 + 834);
  sub_227C921A4(v4);
  sub_227C923BC(v1 + 701);
  sub_227C923BC(v3);
  sub_227C923BC(v1 + 537);
  sub_227C923BC(v2);
  _Unwind_Resume(a1);
}

uint64_t sub_227C91FDC(uint64_t a1)
{
  *(unsigned char *)a1 = 0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_DWORD *)(a1 + 136) = 1065353216;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = xmmword_227CC5D30;
  *(_OWORD *)(a1 + 208) = xmmword_227CC5D40;
  *(void *)(a1 + 224) = 0x7F7FFFFF00000000;
  *(_DWORD *)(a1 + 232) = -8388609;
  *(_DWORD *)(a1 + 292) = 0;
  *(void *)(a1 + 282) = 0;
  *(_OWORD *)(a1 + 268) = 0u;
  *(_OWORD *)(a1 + 252) = 0u;
  *(_OWORD *)(a1 + 236) = 0u;
  *(unsigned char *)(a1 + 296) = 0;
  sub_227C94460(a1 + 304, 120);
  *(void *)(a1 + 456) = 0;
  *(unsigned char *)(a1 + 464) = 0;
  *(unsigned char *)(a1 + 472) = 0;
  *(void *)(a1 + 476) = 0;
  *(void *)(a1 + 484) = 0x3F80000000000000;
  return a1;
}

void sub_227C920A8(_Unwind_Exception *a1)
{
  sub_227C920D4(v2);
  sub_227C923BC((void *)(v1 + 72));
  sub_227C923BC((void *)(v1 + 24));
  _Unwind_Resume(a1);
}

uint64_t sub_227C920D4(uint64_t a1)
{
  sub_227C923BC((void *)(a1 + 96));
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  unint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
  return a1;
}

void *sub_227C92120(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *sub_227C921A4(void *a1)
{
  uint64_t v2 = (void *)a1[53];
  if (v2)
  {
    a1[54] = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)a1[50];
  if (v3)
  {
    a1[51] = v3;
    operator delete(v3);
  }
  double v4 = (void *)a1[47];
  if (v4)
  {
    a1[48] = v4;
    operator delete(v4);
  }
  BOOL v5 = (void *)a1[40];
  if (v5)
  {
    a1[41] = v5;
    operator delete(v5);
  }
  sub_227C923BC(a1 + 30);
  unint64_t v6 = (void *)a1[21];
  if (v6)
  {
    a1[22] = v6;
    operator delete(v6);
  }
  float v7 = (void *)a1[18];
  if (v7)
  {
    a1[19] = v7;
    operator delete(v7);
  }
  sub_227C923BC(a1 + 9);
  sub_227C923BC(a1 + 3);
  return a1;
}

uint64_t sub_227C92240(uint64_t result)
{
  *(_DWORD *)double result = 0;
  *(void *)(result + 4) = 0;
  *(void *)(result + 12) = 0xFF7FFFFF7F7FFFFFLL;
  *(void *)(result + 20) = 0;
  *(void *)(result + 28) = 0xFF7FFFFF7F7FFFFFLL;
  *(void *)(result + 36) = 0;
  *(void *)(result + 44) = 0xFF7FFFFF7F7FFFFFLL;
  *(void *)(result + 52) = 0;
  *(void *)(result + 60) = 0xFF7FFFFF7F7FFFFFLL;
  uint64_t v1 = 68;
  do
  {
    uint64_t v2 = (void *)(result + v1);
    *uint64_t v2 = 0;
    v2[1] = 0xFF7FFFFF7F7FFFFFLL;
    v1 += 16;
  }
  while (v2 + 2 != (void *)(result + 116));
  uint64_t v3 = 116;
  do
  {
    double v4 = (void *)(result + v3);
    *double v4 = 0;
    v4[1] = 0xFF7FFFFF7F7FFFFFLL;
    v3 += 16;
  }
  while (v4 + 2 != (void *)(result + 164));
  uint64_t v5 = 164;
  do
  {
    unint64_t v6 = (void *)(result + v5);
    *unint64_t v6 = 0;
    v6[1] = 0xFF7FFFFF7F7FFFFFLL;
    v5 += 16;
  }
  while (v6 + 2 != (void *)(result + 212));
  uint64_t v7 = 212;
  do
  {
    uint64_t v8 = (void *)(result + v7);
    *uint64_t v8 = 0;
    v8[1] = 0xFF7FFFFF7F7FFFFFLL;
    v7 += 16;
  }
  while (v8 + 2 != (void *)(result + 260));
  uint64_t v9 = 260;
  do
  {
    uint64_t v10 = (void *)(result + v9);
    *uint64_t v10 = 0;
    v10[1] = 0xFF7FFFFF7F7FFFFFLL;
    v9 += 16;
  }
  while (v10 + 2 != (void *)(result + 308));
  *(_DWORD *)(result + 308) = 0;
  *(void *)(result + 312) = 0;
  uint64_t v11 = 328;
  do
  {
    uint64_t v12 = (void *)(result + v11);
    *uint64_t v12 = 0;
    v12[1] = 0xFF7FFFFF7F7FFFFFLL;
    v11 += 16;
  }
  while (v12 + 2 != (void *)(result + 376));
  uint64_t v13 = 376;
  do
  {
    os_log_type_t v14 = (void *)(result + v13);
    *os_log_type_t v14 = 0;
    v14[1] = 0xFF7FFFFF7F7FFFFFLL;
    v13 += 16;
  }
  while (v14 + 2 != (void *)(result + 424));
  *(void *)(result + 424) = 0;
  *(void *)(result + 432) = 0xFF7FFFFF7F7FFFFFLL;
  *(void *)(result + 440) = 0;
  *(void *)(result + 448) = 0xFF7FFFFF7F7FFFFFLL;
  *(void *)(result + 456) = 0;
  *(void *)(result + 464) = 0xFF7FFFFF7F7FFFFFLL;
  return result;
}

os_log_t sub_227C9238C()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_2681B9A78 = (uint64_t)result;
  return result;
}

uint64_t sub_227C923BC(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 512;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 1024;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    uint64_t v7 = *v2++;
    operator delete(v7);
  }

  return sub_227BE1228((uint64_t)a1);
}

uint64_t sub_227C92464(uint64_t a1, void *a2)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  unint64_t v4 = a2[4];
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = (char **)(v5 + 8 * (v4 >> 10));
  if (v6 == v5)
  {
    uint64_t v8 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = (char *)(v5 + 8 * ((a2[5] + v4) >> 10));
  }
  else
  {
    uint64_t v8 = &(*v7)[4 * (v4 & 0x3FF)];
    unint64_t v9 = a2[5] + v4;
    uint64_t v10 = (char *)(v5 + 8 * (v9 >> 10));
    uint64_t v11 = (char *)(*(void *)v10 + 4 * (v9 & 0x3FF));
  }
  sub_227C92510((void *)a1, v7, v8, v10, v11);
  return a1;
}

void sub_227C924FC(_Unwind_Exception *a1)
{
  sub_227BE1228(v1);
  _Unwind_Resume(a1);
}

void *sub_227C92510(void *a1, char **a2, char *a3, char *a4, char *a5)
{
  if (a5 == a3) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = ((uint64_t)&a5[-*(void *)a4] >> 2) + ((a4 - (char *)a2) << 7) - ((a3 - *a2) >> 2);
  }
  return sub_227C92544(a1, a2, a3, v5);
}

void *sub_227C92544(void *a1, char **a2, char *a3, unint64_t a4)
{
  uint64_t v8 = a1[1];
  uint64_t v9 = a1[2];
  if (v9 == v8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = ((v9 - v8) << 7) - 1;
  }
  unint64_t v11 = a1[5] + a1[4];
  unint64_t v12 = v10 - v11;
  if (a4 > v12)
  {
    sub_227C9267C(a1, a4 - v12);
    uint64_t v8 = a1[1];
    uint64_t v9 = a1[2];
    unint64_t v11 = a1[4] + a1[5];
  }
  uint64_t v13 = (void *)(v8 + 8 * (v11 >> 10));
  if (v9 == v8) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = *v13 + 4 * (v11 & 0x3FF);
  }
  v24[0] = v8 + 8 * (v11 >> 10);
  v24[1] = v14;
  os_log_t result = sub_227C92C08((uint64_t)v24, a4);
  if (v14 != v16)
  {
    uint64_t v17 = a1[5];
    do
    {
      if (v13 == result) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = *v13 + 4096;
      }
      if (v14 == v18)
      {
        uint64_t v18 = v14;
      }
      else
      {
        uint64_t v19 = *a2;
        int v20 = (_DWORD *)v14;
        do
        {
          int v21 = *(_DWORD *)a3;
          a3 += 4;
          *v20++ = v21;
          if (a3 - v19 == 4096)
          {
            __int16 v22 = a2[1];
            ++a2;
            uint64_t v19 = v22;
            a3 = v22;
          }
        }
        while (v20 != (_DWORD *)v18);
      }
      v17 += (v18 - v14) >> 2;
      if (v13 == result) {
        break;
      }
      uint64_t v23 = v13[1];
      ++v13;
      uint64_t v14 = v23;
    }
    while (v23 != v16);
    a1[5] = v17;
  }
  return result;
}

void sub_227C9267C(void *a1, unint64_t a2)
{
  uint64_t v3 = (char *)a1[2];
  uint64_t v4 = (uint64_t)&v3[-a1[1]];
  if (v4) {
    unint64_t v5 = a2;
  }
  else {
    unint64_t v5 = a2 + 1;
  }
  if ((v5 & 0x3FF) != 0) {
    unint64_t v6 = (v5 >> 10) + 1;
  }
  else {
    unint64_t v6 = v5 >> 10;
  }
  unint64_t v7 = a1[4];
  if (v6 >= v7 >> 10) {
    unint64_t v8 = v7 >> 10;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v6 <= v7 >> 10)
  {
    for (a1[4] = v7 - (v8 << 10); v8; --v8)
    {
      uint64_t v16 = (void *)a1[1];
      uint64_t v19 = *v16;
      uint64_t v17 = (char *)(v16 + 1);
      uint64_t v18 = v19;
      a1[1] = v17;
      if (v3 == (char *)a1[3])
      {
        uint64_t v20 = (uint64_t)&v17[-*a1];
        if ((unint64_t)v17 <= *a1)
        {
          if (v3 == (char *)*a1) {
            unint64_t v28 = 1;
          }
          else {
            unint64_t v28 = (uint64_t)&v3[-*a1] >> 2;
          }
          float v29 = (char *)sub_227B8B8B4((uint64_t)(a1 + 3), v28);
          float v31 = &v29[8 * (v28 >> 2)];
          float v32 = (uint64_t *)a1[1];
          uint64_t v3 = v31;
          uint64_t v33 = a1[2] - (void)v32;
          if (v33)
          {
            uint64_t v3 = &v31[v33 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v34 = 8 * (v33 >> 3);
            int v35 = &v29[8 * (v28 >> 2)];
            do
            {
              uint64_t v36 = *v32++;
              *(void *)int v35 = v36;
              v35 += 8;
              v34 -= 8;
            }
            while (v34);
          }
          float v37 = (char *)*a1;
          *a1 = v29;
          a1[1] = v31;
          a1[2] = v3;
          a1[3] = &v29[8 * v30];
          if (v37)
          {
            operator delete(v37);
            uint64_t v3 = (char *)a1[2];
          }
        }
        else
        {
          uint64_t v21 = v20 >> 3;
          BOOL v22 = v20 >> 3 < -1;
          uint64_t v23 = (v20 >> 3) + 2;
          if (v22) {
            uint64_t v24 = v23;
          }
          else {
            uint64_t v24 = v21 + 1;
          }
          uint64_t v25 = &v17[-8 * (v24 >> 1)];
          int64_t v26 = v3 - v17;
          if (v3 != v17)
          {
            memmove(&v17[-8 * (v24 >> 1)], v17, v3 - v17);
            uint64_t v3 = (char *)a1[1];
          }
          uint64_t v27 = &v3[-8 * (v24 >> 1)];
          uint64_t v3 = &v25[v26];
          a1[1] = v27;
          a1[2] = &v25[v26];
        }
      }
      *(void *)uint64_t v3 = v18;
      uint64_t v3 = (char *)(a1[2] + 8);
      a1[2] = v3;
    }
  }
  else
  {
    unint64_t v9 = v6 - v8;
    uint64_t v10 = a1[3] - *a1;
    if (v6 - v8 <= (v10 >> 3) - (v4 >> 3))
    {
      if (v9)
      {
        while (a1[3] != a1[2])
        {
          __p[0] = operator new(0x1000uLL);
          sub_227BE08D0(a1, __p);
          --v6;
          if (!--v9) {
            goto LABEL_75;
          }
        }
        for (uint64_t i = 0; i != v9; ++i)
        {
          __p[0] = operator new(0x1000uLL);
          sub_227BE09E8((uint64_t)a1, __p);
          if (a1[2] - a1[1] == 8) {
            uint64_t v64 = 1023;
          }
          else {
            uint64_t v64 = 1024;
          }
          uint64_t v65 = v64 + a1[4];
          a1[4] = v65;
        }
        unint64_t v8 = v6;
      }
      else
      {
LABEL_75:
        uint64_t v65 = a1[4];
      }
      a1[4] = v65 - (v8 << 10);
      if (v8)
      {
        int v66 = (char *)a1[2];
        do
        {
          __int16 v67 = (void *)a1[1];
          uint64_t v70 = *v67;
          unint64_t v68 = (char *)(v67 + 1);
          uint64_t v69 = v70;
          a1[1] = v68;
          if (v66 == (char *)a1[3])
          {
            uint64_t v71 = (uint64_t)&v68[-*a1];
            if ((unint64_t)v68 <= *a1)
            {
              if (v66 == (char *)*a1) {
                unint64_t v78 = 1;
              }
              else {
                unint64_t v78 = (uint64_t)&v66[-*a1] >> 2;
              }
              __int16 v79 = (char *)sub_227B8B8B4((uint64_t)(a1 + 3), v78);
              __int16 v81 = &v79[8 * (v78 >> 2)];
              uint64_t v82 = (uint64_t *)a1[1];
              int v66 = v81;
              uint64_t v83 = a1[2] - (void)v82;
              if (v83)
              {
                int v66 = &v81[v83 & 0xFFFFFFFFFFFFFFF8];
                uint64_t v84 = 8 * (v83 >> 3);
                __int16 v85 = &v79[8 * (v78 >> 2)];
                do
                {
                  uint64_t v86 = *v82++;
                  *(void *)__int16 v85 = v86;
                  v85 += 8;
                  v84 -= 8;
                }
                while (v84);
              }
              __int16 v87 = (char *)*a1;
              *a1 = v79;
              a1[1] = v81;
              a1[2] = v66;
              a1[3] = &v79[8 * v80];
              if (v87)
              {
                operator delete(v87);
                int v66 = (char *)a1[2];
              }
            }
            else
            {
              uint64_t v72 = v71 >> 3;
              BOOL v22 = v71 >> 3 < -1;
              uint64_t v73 = (v71 >> 3) + 2;
              if (v22) {
                uint64_t v74 = v73;
              }
              else {
                uint64_t v74 = v72 + 1;
              }
              __int16 v75 = &v68[-8 * (v74 >> 1)];
              int64_t v76 = v66 - v68;
              if (v66 != v68)
              {
                memmove(&v68[-8 * (v74 >> 1)], v68, v66 - v68);
                int v66 = (char *)a1[1];
              }
              __int16 v77 = &v66[-8 * (v74 >> 1)];
              int v66 = &v75[v76];
              a1[1] = v77;
              a1[2] = &v75[v76];
            }
          }
          *(void *)int v66 = v69;
          int v66 = (char *)(a1[2] + 8);
          a1[2] = v66;
          --v8;
        }
        while (v8);
      }
    }
    else
    {
      uint64_t v11 = v4 >> 3;
      unint64_t v12 = v10 >> 2;
      if (v12 <= v9 + v11) {
        unint64_t v13 = v9 + v11;
      }
      else {
        unint64_t v13 = v12;
      }
      unint64_t v14 = v11 - v8;
      __int16 v91 = a1 + 3;
      if (v13) {
        uint32_t v15 = (char *)sub_227B8B8B4((uint64_t)(a1 + 3), v13);
      }
      else {
        uint32_t v15 = 0;
      }
      uint64_t v38 = v8 << 10;
      __p[0] = v15;
      __p[1] = &v15[8 * v14];
      *(void **)&long long v90 = __p[1];
      *((void *)&v90 + 1) = &v15[8 * v13];
      do
      {
        double v88 = operator new(0x1000uLL);
        sub_227BE0B08(__p, &v88);
        --v9;
      }
      while (v9);
      if (v8)
      {
        double v39 = (void *)a1[1];
        float v40 = (char *)v90;
        do
        {
          if (v40 == *((char **)&v90 + 1))
          {
            int64_t v41 = (char *)__p[1] - (char *)__p[0];
            if (__p[1] <= __p[0])
            {
              if (v40 == __p[0]) {
                unint64_t v48 = 1;
              }
              else {
                unint64_t v48 = (v40 - (char *)__p[0]) >> 2;
              }
              uint64_t v49 = (char *)sub_227B8B8B4((uint64_t)v91, v48);
              uint64_t v51 = (uint64_t *)__p[1];
              float v40 = &v49[8 * (v48 >> 2)];
              uint64_t v52 = v90 - (unint64_t)__p[1];
              if ((void *)v90 != __p[1])
              {
                float v40 = &v49[8 * (v48 >> 2) + (v52 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v53 = 8 * (v52 >> 3);
                double v54 = &v49[8 * (v48 >> 2)];
                do
                {
                  uint64_t v55 = *v51++;
                  *(void *)double v54 = v55;
                  v54 += 8;
                  v53 -= 8;
                }
                while (v53);
              }
              double v56 = __p[0];
              __p[0] = v49;
              __p[1] = &v49[8 * (v48 >> 2)];
              *(void *)&long long v90 = v40;
              *((void *)&v90 + 1) = &v49[8 * v50];
              if (v56)
              {
                operator delete(v56);
                float v40 = (char *)v90;
              }
            }
            else
            {
              uint64_t v42 = v41 >> 3;
              BOOL v22 = v41 >> 3 < -1;
              uint64_t v43 = (v41 >> 3) + 2;
              if (v22) {
                uint64_t v44 = v43;
              }
              else {
                uint64_t v44 = v42 + 1;
              }
              int v45 = (char *)__p[1] - 8 * (v44 >> 1);
              int64_t v46 = v40 - (char *)__p[1];
              if (v40 != __p[1])
              {
                memmove((char *)__p[1] - 8 * (v44 >> 1), __p[1], v40 - (char *)__p[1]);
                float v40 = (char *)__p[1];
              }
              int v47 = &v40[-8 * (v44 >> 1)];
              float v40 = &v45[v46];
              __p[1] = v47;
              *(void *)&long long v90 = &v45[v46];
            }
          }
          *(void *)float v40 = *v39;
          float v40 = (char *)(v90 + 8);
          *(void *)&long long v90 = v90 + 8;
          double v39 = (void *)(a1[1] + 8);
          a1[1] = v39;
          --v8;
        }
        while (v8);
      }
      double v57 = (void *)a1[2];
      uint64_t v58 = -7 - (void)v57;
      while (v57 != (void *)a1[1])
      {
        --v57;
        v58 += 8;
        sub_227BE0C20((uint64_t)__p, v57);
      }
      double v59 = (char *)*a1;
      long long v60 = *(_OWORD *)__p;
      long long v61 = v90;
      __p[0] = *(void **)a1;
      __p[1] = v57;
      long long v62 = *((_OWORD *)a1 + 1);
      *(_OWORD *)a1 = v60;
      *((_OWORD *)a1 + 1) = v61;
      long long v90 = v62;
      a1[4] -= v38;
      if (v57 != (void *)v62) {
        *(void *)&long long v90 = v62 + (-(v62 + v58) & 0xFFFFFFFFFFFFFFF8);
      }
      if (v59) {
        operator delete(v59);
      }
    }
  }
}

void sub_227C92B94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_227C92C08(uint64_t a1, uint64_t a2)
{
  os_log_t result = *(void **)a1;
  if (a2)
  {
    uint64_t v4 = a2 + ((uint64_t)(*(void *)(a1 + 8) - *result) >> 2);
    if (v4 < 1) {
      result -= (unint64_t)(1023 - v4) >> 10;
    }
    else {
      result += (unint64_t)v4 >> 10;
    }
  }
  return result;
}

BOOL sub_227C92C6C(uint64_t a1, uint64_t a2)
{
  double v4 = *(double *)(a1 + 8);
  double v5 = *(double *)a2;
  if (v4 > 0.0 && v5 < v4 + *(double *)(a1 + 16)) {
    return 0;
  }
  *(double *)(a1 + 16) = v5;
  float32x4_t v7 = *(float32x4_t *)(a2 + 24);
  v8[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a2 + 8)), (float64x2_t)v7);
  sub_227CA506C(v8, v7);
  v8[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a2 + 40)), *(float64x2_t *)(a2 + 56));
  float32x2_t v9 = vcvt_f32_f64(*(float64x2_t *)(a2 + 72));
  unint64_t v10 = (unint64_t)(*(double *)a2 * 1000000.0);
  __int16 v11 = 0;
  uint64_t v12 = 0;
  return sub_227C92D2C(a1, (uint64_t)v8);
}

BOOL sub_227C92D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  sub_227CA48B4(0x2B7304A0u, 1, 1, 0, 0, 0);
  sub_227C87D00(a1 + 40, a2);
  BOOL v4 = sub_227C89874(a1 + 40);
  sub_227C88288(a1 + 40, 0, v26, v4);
  if (v4)
  {
    sub_227C898C0(a1 + 40, v25);
    sub_227C86598((float *)(a1 + 20560), (uint64_t)v25);
    sub_227C972F4(a1 + 20568, a1 + 15760, a1 + 8424);
    float v6 = v5;
    float v7 = sub_227C97580((float *)(a1 + 20568), (unsigned __int16 *)(a1 + 15760));
    *(unsigned char *)(a1 + 20600) = 0;
    float v8 = v7;
    if (v7 < 0.61087)
    {
      *(unsigned char *)(a1 + 20600) = 1;
      float v9 = *(float *)(a1 + 20560) + 0.04;
      __float2 v10 = __sincosf_stret(v6);
      float v11 = v10.__sinval * v9;
      float v12 = sinf(v8);
      float v13 = -(float)(v12 * (float)(v10.__sinval * v9));
      if ((float)(v12 * (float)(v10.__sinval * v9)) > 0.0) {
        float v13 = v12 * v11;
      }
      float v14 = v12 * (float)(v10.__cosval * v9);
      float v15 = -v14;
      if (v14 > 0.0) {
        float v15 = v14;
      }
      if (v13 >= 0.5 || v15 >= 0.5) {
        *(unsigned char *)(a1 + 20600) = 0;
      }
      *(float *)(a1 + 32) = (float)(v13 * 0.5655) + 0.2407;
      *(float *)(a1 + 36) = (float)(v15 * 0.6527) + 0.2277;
      *(float *)(a1 + 24) = v10.__cosval * v9;
      *(float *)(a1 + 28) = v11;
      double v17 = (double)*(unint64_t *)(a2 + 40);
      if (qword_2681B9A60 != -1) {
        dispatch_once(&qword_2681B9A60, &unk_26DC29580);
      }
      double v18 = v17 * 0.000000999999997;
      uint64_t v19 = qword_2681B9A68;
      if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_DEFAULT))
      {
        double v20 = *(float *)(a1 + 24);
        double v21 = *(float *)(a1 + 28);
        *(_DWORD *)buf = 134349824;
        *(double *)&uint8_t buf[4] = v18;
        *(_WORD *)unint64_t v28 = 2050;
        *(double *)&v28[2] = v6;
        *(_WORD *)&v28[10] = 2050;
        *(double *)&v28[12] = v20;
        __int16 v29 = 2050;
        double v30 = v21;
        _os_log_impl(&dword_227B19000, v19, OS_LOG_TYPE_DEFAULT, "CMPrecisionFindingVelocityEstimator,timestamp,%{public}f,directionOfTravel,%{public}f,velocityX,%{public}f,velocityY,%{public}f", buf, 0x2Au);
      }
      *(void *)&v28[12] = 0;
      *(double *)buf = v18;
      *(float *)&buf[8] = v6;
      *(void *)&long long v22 = *(void *)(a1 + 20560);
      *((void *)&v22 + 1) = *(void *)(a1 + 24);
      *(_OWORD *)unint64_t v28 = v22;
      sub_227CA2C0C((uint64_t *)buf);
    }
    uint64_t v23 = 1;
  }
  else
  {
    uint64_t v23 = 0;
  }
  sub_227CA48B4(0x2B7304A0u, 2, 1, v23, 0, 0);
  return v4;
}

os_log_t sub_227C93030()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "PrecisionFinding");
  qword_2681B9A68 = (uint64_t)result;
  return result;
}

size_t sub_227C93060(char *__source)
{
  return strlcpy(byte_2681BAFD0, __source, 0x100uLL);
}

uint64_t sub_227C93074(uint64_t a1, float a2, float a3, float a4, float a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (sub_227C9347C(0, (int *)&unk_2681B9AB0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0))
  {
    if (qword_2681B9A90 != -1) {
      dispatch_once(&qword_2681B9A90, &unk_26DC295A0);
    }
    __float2 v10 = qword_2681B9A98;
    if (!os_log_type_enabled((os_log_t)qword_2681B9A98, OS_LOG_TYPE_DEBUG)) {
      return 0xFFFFFFFFLL;
    }
    *(_WORD *)buf = 0;
    float v11 = "WMM initialization encountered an error";
LABEL_11:
    _os_log_impl(&dword_227B19000, v10, OS_LOG_TYPE_DEBUG, v11, buf, 2u);
    return 0xFFFFFFFFLL;
  }
  dword_2681B9C80 = LODWORD(a2);
  dword_2681B9C84 = LODWORD(a3);
  *(float *)&dword_2681B9C88 = a4 / 1000.0;
  dword_2681B9C8C = LODWORD(a5);
  if (sub_227C9347C(1, 0, (float *)&dword_2681B9C90, (float *)&dword_2681B9C94, (float *)&dword_2681B9C98, &flt_2681B9C9C, a4 / 1000.0, a2, a3, a5))
  {
    if (qword_2681B9A90 != -1) {
      dispatch_once(&qword_2681B9A90, &unk_26DC295A0);
    }
    __float2 v10 = qword_2681B9A98;
    if (!os_log_type_enabled((os_log_t)qword_2681B9A98, OS_LOG_TYPE_DEBUG)) {
      return 0xFFFFFFFFLL;
    }
    *(_WORD *)buf = 0;
    float v11 = "WMM evaluation encountered an error";
    goto LABEL_11;
  }
  dword_2681B9CA0 = dword_2681B9C90;
  dword_2681B9CA4 = dword_2681B9C94;
  dword_2681B9CA8 = dword_2681B9C98;
  *(float *)&dword_2681B9C8C = *(float *)&dword_2681B9C8C + 1.0;
  sub_227C9347C(1, 0, (float *)&dword_2681B9C90, (float *)&dword_2681B9C94, (float *)&dword_2681B9C98, &flt_2681B9C9C, *(float *)&dword_2681B9C88, *(float *)&dword_2681B9C80, *(float *)&dword_2681B9C84, *(float *)&dword_2681B9C8C);
  float v13 = *(float *)&dword_2681B9CA8;
  float v14 = *(float *)&dword_2681B9CA0;
  __float2 v15 = __sincosf_stret(*(float *)&dword_2681B9CA0 * 0.017453);
  int v16 = dword_2681B9CA4;
  __float2 v17 = __sincosf_stret(*(float *)&dword_2681B9CA4 * 0.017453);
  if ((float)(v13 * v17.__cosval) < 100.0)
  {
    float v14 = log(-1.0);
    dword_2681B9CA0 = LODWORD(v14);
  }
  if (90.0 - fabsf(*(float *)&dword_2681B9C80) <= 0.001)
  {
    float v14 = log(-1.0);
    dword_2681B9CA0 = LODWORD(v14);
    float v18 = v14;
    float v19 = v14;
  }
  else
  {
    float v18 = v13 * (float)(v15.__cosval * v17.__cosval);
    float v19 = v13 * (float)(v15.__sinval * v17.__cosval);
  }
  uint64_t result = 0;
  *(float *)a1 = v18 / 1000.0;
  *(float *)(a1 + 4) = v19 / 1000.0;
  *(float *)(a1 + 8) = (float)(v13 * v17.__sinval) / 1000.0;
  *(float *)(a1 + 12) = v13 / 1000.0;
  *(float *)(a1 + 16) = (float)(v13 * v17.__cosval) / 1000.0;
  *(float *)(a1 + 20) = v14;
  *(_DWORD *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_227C9347C(int a1, int *a2, float *a3, float *a4, float *a5, float *a6, float a7, float a8, float a9, float a10)
{
  uint64_t v175 = *MEMORY[0x263EF8340];
  if (a1 == 1)
  {
    float v16 = a10 - *(float *)&dword_2681BADAC;
    __float2 v17 = (float *)&unk_2681BA000;
    float v18 = *(float *)&dword_2681BADC0;
    if (*(float *)&dword_2681BADC0 < 0.0 && v16 < 0.0)
    {
      if (qword_2681B9A90 != -1) {
        dispatch_once(&qword_2681B9A90, &unk_26DC295A0);
      }
      uint64_t v19 = qword_2681B9A98;
      uint64_t v20 = 1;
      if (os_log_type_enabled((os_log_t)qword_2681B9A98, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349312;
        double v172 = a10;
        __int16 v173 = 2050;
        double v174 = *(float *)&dword_2681BADAC;
        uint64_t v21 = "supplied date (%{public}f) outside valid range (epoch=%{public}f)";
        long long v22 = v19;
LABEL_42:
        uint32_t v65 = 22;
LABEL_112:
        _os_log_impl(&dword_227B19000, v22, OS_LOG_TYPE_INFO, v21, buf, v65);
        return v20;
      }
      return v20;
    }
    __float2 v47 = __sincosf_stret(a9 * 0.017453);
    float sinval = v47.__sinval;
    float cosval = v47.__cosval;
    uint64_t v50 = (float *)&unk_2681BA000;
    BOOL v51 = *(float *)&dword_2681BADC8 != a8 || *(float *)&dword_2681BADC4 != a7;
    dword_2681BA9F0 = LODWORD(v47.__sinval);
    dword_2681BAA24 = LODWORD(v47.__cosval);
    uint64_t v52 = (float *)&unk_2681BA000;
    uint64_t v53 = (float *)&unk_2681BA000;
    if (v51)
    {
      __float2 v54 = __sincosf_stret(a8 * 0.017453);
      __float2 v17 = (float *)&unk_2681BA000;
      uint64_t v50 = (float *)&unk_2681BA000;
      float v55 = sqrtf(*(float *)&dword_2681BAD98 - (float)(*(float *)&dword_2681BADA0 * (float)(v54.__sinval * v54.__sinval)));
      float v56 = (float)(*(float *)&dword_2681BAD98 + (float)(v55 * a7))
          / (float)((float)(v55 * a7) + *(float *)&dword_2681BAD9C);
      *(float *)&dword_2681BADD0 = v54.__sinval
                                 / sqrtf((float)(v54.__sinval * v54.__sinval)+ (float)((float)(v56 * v56) * (float)(v54.__cosval * v54.__cosval)));
      *(float *)&int v57 = sqrt(1.0 - (float)(*(float *)&dword_2681BADD0 * *(float *)&dword_2681BADD0));
      dword_2681BADD4 = v57;
      float v58 = (float)(a7 * a7)
          + (float)(v55 * a7) * 2.0
          + (float)((float)(*(float *)&dword_2681BADA4
                          - (float)(*(float *)&dword_2681BADA8 * (float)(v54.__sinval * v54.__sinval)))
                  / (float)(v55 * v55));
      dword_2681BADD8 = sqrtf(v58);
      float v59 = sqrtf((float)((float)(v54.__sinval * v54.__sinval) * *(float *)&dword_2681BAD9C)+ (float)(*(float *)&dword_2681BAD98 * (float)(v54.__cosval * v54.__cosval)));
      *(float *)&dword_2681BADDC = (float)(v59 + a7) / *(float *)&dword_2681BADD8;
      *(float *)&dword_2681BADE0 = (float)(v54.__sinval * (float)(v54.__cosval * *(float *)&dword_2681BADA0))
                                 / (float)(v59 * *(float *)&dword_2681BADD8);
    }
    uint64_t v60 = dword_2681B9CAC;
    if (*(float *)&dword_2681BADCC != a9)
    {
      if (dword_2681B9CAC >= 2)
      {
        int v61 = dword_2681B9CAC + 1;
        uint64_t v67 = dword_2681B9CAC - 1;
        unint64_t v68 = (float *)&dword_2681BAA28;
        float v69 = v47.__sinval;
        uint64_t v70 = (float *)&dword_2681BA9F4;
        do
        {
          float v71 = *(float *)&dword_2681BAA24;
          float v72 = (float)(*(float *)&dword_2681BAA24 * sinval) + (float)(v69 * cosval);
          *v70++ = v72;
          float v69 = *(float *)&dword_2681BA9F0;
          float cosval = (float)(v71 * cosval) - (float)(*(float *)&dword_2681BA9F0 * sinval);
          *v68++ = cosval;
          float sinval = v72;
          --v67;
        }
        while (v67);
      }
      else
      {
        int v61 = 2;
      }
      dword_2681B9CB4 = v61;
    }
    float v73 = *(float *)&dword_2681BADD4;
    if ((int)v60 >= 1)
    {
      v158 = a3;
      v159 = a6;
      uint64_t v74 = 0;
      __int16 v75 = (float *)&unk_2681BA204;
      int64_t v76 = (float *)&unk_2681BA230;
      __int16 v77 = (float *)&unk_2681B9CBC;
      unint64_t v78 = (float *)&unk_2681B9CE8;
      __int16 v79 = (float *)&unk_2681B9F60;
      uint64_t v80 = (float *)&unk_2681B9F8C;
      __int16 v81 = &dword_2681BA74C;
      int v82 = -1;
      int v83 = 3;
      float v84 = *(float *)&dword_2681BAD94 / *(float *)&dword_2681BADD8;
      float v85 = v84 * v84;
      uint64_t v86 = &dword_2681BA4A8;
      v170 = (float *)&unk_2681BAAF4;
      float v87 = *(float *)&dword_2681BADD0;
      float v88 = -*(float *)&dword_2681BADD4;
      float v89 = *(float *)dword_2681BAA20;
      int v90 = dword_2681BAABC;
      unint64_t v91 = 1;
      float v92 = *(float *)&dword_2681BA9EC;
      float v93 = 0.0;
      double v94 = flt_2681BAA88;
      __int16 v95 = &dword_2681BAABC;
      double v96 = &dword_2681BA9EC;
      float v97 = 0.0;
      float v98 = 0.0;
      float v99 = 0.0;
      uint64_t v162 = v60 + 1;
      BOOL v168 = v51;
      while (1)
      {
        uint64_t v100 = 0;
        int64_t v101 = 0;
        int v166 = v82;
        float v102 = -(float)(v84 * v85);
        float v85 = v84 * v85;
        unint64_t v163 = v91 + 1;
        __int16 v103 = &dword_2681BA748[v91];
        float v104 = flt_2681BAA54[v91];
        int64_t v105 = v91 - 2;
        v169 = &dword_2681BA4A4[v82];
        double v106 = v103 - 1;
        unint64_t v107 = v91 - 1;
        double v108 = (float *)((char *)&unk_2681BAAF0 + 4 * v91 + 52);
        int v109 = v83;
        uint64_t v110 = 13 * (int)v91 - 13;
        uint64_t v111 = 13 * (int)v91;
        double v112 = &dword_2681BA4A4[13 * v91];
        __int16 v113 = (float *)&v112[v91 - 14];
        int v114 = v86;
        uint64_t v115 = 13 * (v91 - 1);
        double v116 = (float *)&v112[v91];
        uint64_t v167 = v74;
        uint64_t v117 = v74 + 1;
        v164 = v114;
        double v118 = (float *)v114;
        int v165 = v109;
        do
        {
          if (v51)
          {
            if (v117 == v101)
            {
              *(float *)&v103[v111] = v73 * *(float *)&v106[v110];
              *double v116 = (float)(v87 * *(float *)&v106[v115]) + (float)(v73 * *v113);
            }
            else
            {
              if (v91 == 1 && !v101)
              {
                *(float *)&dword_2681BA74C = v87 * *(float *)dword_2681BA748;
                *(float *)&dword_2681BA4A8 = (float)(*(float *)dword_2681BA748 * v88)
                                           + (float)(v87 * *(float *)&dword_2681BA4A4[v107]);
                if (v18 == a10)
                {
LABEL_64:
                  float v119 = v85 * *(float *)&v81[v100];
LABEL_65:
                  float v126 = flt_2681BA200[v91];
                  float v124 = v126 * v89;
                  float v125 = v126 * v92;
                  goto LABEL_66;
                }
LABEL_57:
                v75[v100] = v77[v100] + (float)(v16 * v79[v100]);
                if (!v101) {
                  goto LABEL_64;
                }
                v76[v101] = v78[v101] + (float)(v16 * v80[v101]);
                float v119 = v85 * *(float *)&v103[v100];
                goto LABEL_60;
              }
              if (v91 >= 2)
              {
                unint64_t v130 = v107;
                __int16 v131 = v95;
                double v132 = v80;
                __int16 v133 = v78;
                uint64_t v134 = v94;
                __int16 v135 = v81;
                uint64_t v136 = v116;
                uint64_t v137 = v115;
                uint64_t v138 = v113;
                uint64_t v139 = v111;
                uint64_t v140 = v110;
                __int16 v141 = v108;
                double v142 = v96;
                if (v101 <= v105)
                {
                  v144 = v103 - 2;
                  float v145 = *(float *)&v169[v100];
                  uint64_t v143 = v100;
                }
                else
                {
                  uint64_t v143 = v100;
                  v144 = v103 - 2;
                  v103[v100 - 2] = 0;
                  v169[v100] = 0;
                  float v145 = 0.0;
                }
                float v146 = *(float *)&v106[v143];
                float v147 = v170[v100];
                *(float *)&v103[v143] = (float)(v87 * v146) - (float)(v147 * *(float *)&v144[v143]);
                *double v118 = (float)((float)(v146 * v88) + (float)(v87 * *(v118 - 1))) - (float)(v147 * v145);
                double v96 = v142;
                double v108 = v141;
                uint64_t v110 = v140;
                uint64_t v111 = v139;
                __int16 v113 = v138;
                uint64_t v115 = v137;
                double v116 = v136;
                __int16 v81 = v135;
                double v94 = v134;
                unint64_t v78 = v133;
                uint64_t v80 = v132;
                __int16 v95 = v131;
                unint64_t v107 = v130;
                BOOL v51 = v168;
              }
            }
          }
          if (v18 != a10) {
            goto LABEL_57;
          }
          float v119 = v85 * *(float *)&v103[v100];
          if (!v101) {
            goto LABEL_65;
          }
LABEL_60:
          float v120 = v75[v100];
          float v121 = *(float *)&dword_2681BAA20[v101];
          float v122 = v76[v101];
          float v123 = *(float *)&v96[v101];
          float v124 = (float)(v122 * v123) + (float)(v120 * v121);
          float v125 = (float)(v120 * v123) - (float)(v122 * v121);
LABEL_66:
          float v127 = *v118;
          float v128 = v125 * v94[v101];
          if (v101 == 1 && v73 == 0.0)
          {
            if (v91 == 1)
            {
              v95[1] = v90;
              float v129 = *((float *)v95 + 1);
            }
            else
            {
              float v129 = (float)(v87 * *(float *)&v95[v107]) - (float)(*v108 * *(float *)&v95[v105]);
              *(float *)&v95[v91] = v129;
            }
            float v99 = v99 + (float)(v128 * (float)(v85 * v129));
          }
          float v93 = v93 + (float)((float)(v124 * v102) * v127);
          float v97 = v97 + (float)(v128 * v119);
          float v98 = v98 + (float)((float)(v124 * v104) * v119);
          ++v101;
          v100 += 13;
          --v109;
          v118 += 13;
        }
        while (v109 > 1);
        ++v81;
        int v82 = v166 + 1;
        int v83 = v165 + 1;
        ++v91;
        uint64_t v86 = v164 + 1;
        ++v170;
        ++v75;
        ++v79;
        ++v77;
        v76 += 13;
        v78 += 13;
        v80 += 13;
        uint64_t v74 = v167 + 1;
        int v148 = v162;
        if (v163 == v162)
        {
          dword_2681B9CB4 = v101;
          a3 = v158;
          a6 = v159;
          __float2 v17 = (float *)&unk_2681BA000;
          uint64_t v50 = (float *)&unk_2681BA000;
          uint64_t v52 = (float *)&unk_2681BA000;
          uint64_t v53 = (float *)&unk_2681BA000;
          goto LABEL_82;
        }
      }
    }
    int v148 = 1;
    float v98 = 0.0;
    float v93 = 0.0;
    float v99 = 0.0;
    float v97 = 0.0;
LABEL_82:
    dword_2681B9CB0 = v148;
    if (v73 == 0.0) {
      float v149 = v99;
    }
    else {
      float v149 = v97 / v73;
    }
    float v150 = v52[887];
    float v151 = v53[888];
    float v152 = (float)-(float)(v98 * v151) - (float)(v93 * v150);
    float v153 = (float)(v93 * v151) - (float)(v98 * v150);
    float v154 = sqrtf((float)(v149 * v149) + (float)(v152 * v152));
    *a5 = sqrtf((float)(v153 * v153) + (float)(v154 * v154));
    *a3 = atan2f(v149, v152) / 0.017453;
    *a4 = atan2f(v153, v154) / 0.017453;
    *a6 = -999.0;
    if (fabsf(a8) >= 55.0)
    {
      float v155 = -999.0;
      if (a9 >= 0.0 && a8 > 0.0)
      {
        float v155 = *a3 - a9;
        *a6 = v155;
      }
      float v156 = fabsf(a9);
      if (a8 > 0.0 && a9 < 0.0)
      {
        float v155 = v156 + *a3;
        *a6 = v155;
      }
      if (a9 >= 0.0 && a8 < 0.0)
      {
        float v155 = *a3 + a9;
        *a6 = v155;
      }
      if (a8 < 0.0 && a9 < 0.0)
      {
        float v155 = *a3 - v156;
        *a6 = v155;
      }
      if (v155 > 180.0)
      {
        float v155 = v155 + -360.0;
LABEL_101:
        if (v155 < -180.0) {
          float v155 = v155 + 360.0;
        }
        *a6 = v155;
        goto LABEL_104;
      }
      if (v155 < -180.0) {
        goto LABEL_101;
      }
    }
LABEL_104:
    uint64_t v20 = 0;
    v17[880] = a10;
    v50[881] = a7;
    dword_2681BADC8 = LODWORD(a8);
    dword_2681BADCC = LODWORD(a9);
    return v20;
  }
  uint64_t v24 = fopen(byte_2681BAFD0, "r");
  if (v24)
  {
    uint64_t v25 = v24;
    dword_2681B9CAC = *a2;
    dword_2681BA9EC = 0;
    dword_2681BAABC = 1065353216;
    dword_2681BA748[0] = 1065353216;
    dword_2681BAA20[0] = 1065353216;
    dword_2681BA4A4[0] = 0;
    dword_2681BAD94 = 1170676122;
    dword_2681BAD98 = 1276849967;
    dword_2681BAD9C = 1276781883;
    dword_2681BADA0 = 1216674304;
    dword_2681BADA4 = 1488725079;
    dword_2681BADA8 = 1436593536;
    dword_2681B9CB8[0] = 0;
    dword_2681B9F5C[0] = 0;
    if (fgets(byte_2681BADE4, 80, v24))
    {
      sscanf(byte_2681BADE4, "%f", &dword_2681BADAC);
      if (fgets(byte_2681BADE4, 80, v25))
      {
        uint64_t v26 = 0;
        do
        {
          do
          {
            if (!byte_2681BADE4[v26]) {
              break;
            }
            *((unsigned char *)&dword_2681BAE35 + v26) = byte_2681BADE4[v26];
            ++v26;
            *((unsigned char *)&dword_2681BAE35 + v26) = 0;
          }
          while (v26 != 4);
          if (!(dword_2681BAE35 ^ 0x39393939 | byte_2681BAE39)) {
            break;
          }
          sscanf(byte_2681BADE4, "%d%d%f%f%f%f", &dword_2681B9CB0, &dword_2681B9CB4, &dword_2681BADB0, &dword_2681BADB4, &dword_2681BADB8, &dword_2681BADBC);
          unsigned int v27 = dword_2681B9CB4;
          if (dword_2681B9CB4 > 0xC
            || (uint64_t v28 = dword_2681B9CB0, dword_2681B9CB0 > 12)
            || dword_2681B9CB0 < 0)
          {
            fclose(v25);
            if (qword_2681B9A90 != -1) {
              dispatch_once(&qword_2681B9A90, &unk_26DC295A0);
            }
            uint64_t v66 = qword_2681B9A98;
            uint64_t v20 = 1;
            if (os_log_type_enabled((os_log_t)qword_2681B9A98, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              uint64_t v21 = "geomagnetic data file appears to have invalid dimensions";
              goto LABEL_111;
            }
            return v20;
          }
          if (dword_2681B9CB4 <= dword_2681B9CB0)
          {
            dword_2681B9CB8[13 * dword_2681B9CB4 + dword_2681B9CB0] = dword_2681BADB0;
            dword_2681B9F5C[13 * v27 + v28] = dword_2681BADB8;
            if (v27)
            {
              unsigned int v29 = v27 - 1;
              dword_2681B9CB8[13 * v28 + v29] = dword_2681BADB4;
              dword_2681B9F5C[13 * v28 + v29] = dword_2681BADBC;
            }
          }
          double v30 = fgets(byte_2681BADE4, 80, v25);
          uint64_t v26 = 0;
        }
        while (v30);
      }
      dword_2681BA748[0] = 1065353216;
      if (dword_2681B9CAC < 1)
      {
        LODWORD(v32) = 1;
      }
      else
      {
        int v31 = 0;
        uint64_t v32 = dword_2681B9CAC + 1;
        uint64_t v33 = (float *)&unk_2681B9F60;
        uint64_t v34 = (float *)&unk_2681B9CBC;
        int v35 = (float *)&unk_2681BAAF4;
        uint64_t v36 = 1;
        do
        {
          uint64_t v37 = 0;
          int v38 = 0;
          double v39 = (float *)&dword_2681BA748[v36];
          int v40 = 2 * v36 - 1;
          *double v39 = (float)(*(v39 - 1) * (float)v40) / (float)(int)v36;
          uint64_t v41 = v36 + 1;
          float v42 = (float)(v40 * (2 * v36 - 3));
          int v43 = 2;
          int v44 = v31;
          do
          {
            v35[v37] = (float)((v31 + v38) * v44) / v42;
            if (v37)
            {
              float v45 = v39[(int)v37 - 13] * sqrtf((float)(v43 * (v44 + 2)) / (float)(v31 + v38 + 1));
              v39[(int)v37] = v45;
              *(float *)&dword_2681B9CB8[13 * v36 + (v38 - 1)] = *(float *)&dword_2681B9CB8[13 * v36 + (v38 - 1)]
                                                                             * v45;
              *(float *)&dword_2681B9F5C[13 * v36 + (v38 - 1)] = v45
                                                                             * *(float *)&dword_2681B9F5C[13 * v36 + (v38 - 1)];
              int v43 = 1;
            }
            float v46 = v39[v37];
            v34[v37] = v46 * v34[v37];
            v33[v37] = v46 * v33[v37];
            ++v38;
            v37 += 13;
            --v44;
          }
          while (v44 + 3 > 1);
          flt_2681BAA54[v36] = (float)(int)v41;
          flt_2681BAA88[v36] = (float)(int)v36;
          ++v31;
          ++v33;
          ++v34;
          ++v35;
          ++v36;
        }
        while (v41 != v32);
        dword_2681B9CB4 = v38;
      }
      dword_2681B9CB0 = v32;
      dword_2681BAB28 = 0;
      dword_2681BADCC = -998637568;
      dword_2681BADC8 = -998637568;
      dword_2681BADC4 = -998637568;
      dword_2681BADC0 = -998637568;
      fclose(v25);
      return 0;
    }
    else
    {
      fclose(v25);
      if (qword_2681B9A90 != -1) {
        dispatch_once(&qword_2681B9A90, &unk_26DC295A0);
      }
      uint64_t v66 = qword_2681B9A98;
      uint64_t v20 = 1;
      if (os_log_type_enabled((os_log_t)qword_2681B9A98, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v21 = "geomagnetic data file appears to be empty";
LABEL_111:
        long long v22 = v66;
        uint32_t v65 = 2;
        goto LABEL_112;
      }
    }
  }
  else
  {
    if (qword_2681B9A90 != -1) {
      dispatch_once(&qword_2681B9A90, &unk_26DC295A0);
    }
    uint64_t v62 = qword_2681B9A98;
    uint64_t v20 = 1;
    if (os_log_type_enabled((os_log_t)qword_2681B9A98, OS_LOG_TYPE_INFO))
    {
      int v63 = __error();
      uint64_t v64 = strerror(*v63);
      *(_DWORD *)buf = 136315394;
      double v172 = COERCE_DOUBLE(byte_2681BAFD0);
      __int16 v173 = 2082;
      double v174 = *(double *)&v64;
      uint64_t v21 = "could not open geomagnetic data file %s (%{public}s)";
      long long v22 = v62;
      goto LABEL_42;
    }
  }
  return v20;
}

os_log_t sub_227C94308()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "Compass");
  qword_2681B9A98 = (uint64_t)result;
  return result;
}

uint64_t sub_227C94338(uint64_t a1, unint64_t a2)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 16) = 0;
  uint64_t v3 = (void **)(a1 + 16);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 48) = 0;
  sub_227C95680((unint64_t *)(a1 + 56), a2);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = *(void *)(a1 + 16);
  sub_227C945F8(v3, *(void *)a1);
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 40) = 0;
  return a1;
}

void sub_227C943A4(_Unwind_Exception *a1)
{
  sub_227C9440C(v3);
  float v5 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(a1);
}

void sub_227C943D0(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = *(void *)(a1 + 16);
  sub_227C945F8((void **)(a1 + 16), *(void *)a1);
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 40) = 0;
}

void *sub_227C9440C(void *a1)
{
  uint64_t v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[5];
  if (v3)
  {
    a1[6] = v3;
    operator delete(v3);
  }
  BOOL v4 = (void *)a1[2];
  if (v4)
  {
    a1[3] = v4;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_227C94464(uint64_t a1, float *a2, float *a3, float32x2_t *a4, float32x2_t *a5)
{
  uint64_t result = sub_227C94498((uint64_t *)(a1 + 16), a2, a3, a4, a5);
  ++*(void *)(a1 + 8);
  return result;
}

uint64_t sub_227C94498(uint64_t *a1, float *a2, float *a3, float32x2_t *a4, float32x2_t *a5)
{
  unint64_t v12 = a1[2];
  uint64_t v10 = (uint64_t)(a1 + 2);
  unint64_t v11 = v12;
  unint64_t v13 = *(void *)(v10 - 8);
  if (v13 >= v12)
  {
    uint64_t v15 = (uint64_t)(v13 - *a1) >> 5;
    if ((unint64_t)(v15 + 1) >> 59) {
      sub_227B8B89C();
    }
    uint64_t v16 = v11 - *a1;
    uint64_t v17 = v16 >> 4;
    if (v16 >> 4 <= (unint64_t)(v15 + 1)) {
      uint64_t v17 = v15 + 1;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v18 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v17;
    }
    if (v18)
    {
      uint64_t v19 = (char *)sub_227C95848(v10, v18);
      uint64_t v21 = v20;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v21 = 0;
    }
    uint64_t v22 = sub_227C9672C((uint64_t)&v19[32 * v15], a2, a3, a4, a5);
    uint64_t v14 = v22 + 32;
    uint64_t v24 = (char *)*a1;
    uint64_t v23 = (char *)a1[1];
    if (v23 != (char *)*a1)
    {
      do
      {
        long long v25 = *((_OWORD *)v23 - 1);
        *(_OWORD *)(v22 - 32) = *((_OWORD *)v23 - 2);
        *(_OWORD *)(v22 - 16) = v25;
        v22 -= 32;
        v23 -= 32;
      }
      while (v23 != v24);
      uint64_t v23 = (char *)*a1;
    }
    *a1 = v22;
    a1[1] = v14;
    a1[2] = (uint64_t)&v19[32 * v21];
    if (v23) {
      operator delete(v23);
    }
  }
  else
  {
    sub_227C9672C(*(void *)(v10 - 8), a2, a3, a4, a5);
    uint64_t v14 = v13 + 32;
    a1[1] = v13 + 32;
  }
  a1[1] = v14;
  return v14 - 32;
}

void sub_227C945D4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_227C945F8(void **a1, unint64_t a2)
{
  BOOL v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 5)
  {
    if (a2 >> 59) {
      sub_227B8B89C();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    float v6 = (char *)sub_227C95848(v3, a2);
    float v7 = &v6[v5 & 0xFFFFFFFFFFFFFFE0];
    float v9 = &v6[32 * v8];
    unint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 32;
        v10 -= 32;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_227C946A8(uint64_t a1)
{
  *(float *)(a1 + 40) = sub_227C946E4(a1);
  *(float *)(a1 + 44) = sub_227C9479C(a1);
  *(unsigned char *)(a1 + 48) = 1;
}

float sub_227C946E4(uint64_t a1)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v1 = *(float **)(a1 + 16);
  uint64_t v2 = *(float **)(a1 + 24);
  while (v1 != v2)
  {
    sub_227C96780(v1);
    int v7 = v3;
    sub_227C94D3C(v8, (float *)&v7);
    v1 += 8;
  }
  sub_227C92464((uint64_t)v6, v8);
  float v4 = sub_227C94DC4(v6);
  sub_227C923BC(v6);
  sub_227C923BC(v8);
  return v4;
}

void sub_227C94774(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  sub_227C923BC((uint64_t *)va);
  sub_227C923BC((uint64_t *)va1);
  _Unwind_Resume(a1);
}

float sub_227C9479C(uint64_t a1)
{
  if (*(void *)(a1 + 8))
  {
    unint64_t v2 = 0;
    int v3 = 0;
    float v4 = 0.0;
    uint64_t v5 = 16;
    do
    {
      uint64_t v6 = (float *)(*(void *)(a1 + 16) + v5);
      long long v13 = *(_OWORD *)v6;
      v12[0] = sub_227C96730(v6 - 4, *(float *)(a1 + 40));
      v12[1] = v7;
      float v8 = sub_227C8EA7C((uint64_t)&v13, v12);
      float v4 = v4 + (float)((float)(v9 * v9) + (float)(v8 * v8));
      v3 += 2;
      ++v2;
      v5 += 32;
    }
    while (*(void *)(a1 + 8) > v2);
    float v10 = v4 / (float)v3;
  }
  else
  {
    float v10 = NAN;
  }
  return sqrtf(v10);
}

void sub_227C94854(uint64_t a1, float a2)
{
  *(float *)(a1 + 40) = (float)(sub_227C946E4(a1) + a2) * 0.5;
  *(float *)(a1 + 44) = sub_227C9479C(a1);
  *(unsigned char *)(a1 + 48) = 1;
}

float sub_227C948A8(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 48))
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC295C0);
    }
    uint64_t v12 = qword_2681B9A78;
    float v6 = 0.0;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      long long v13 = "[BarrelRoll]:[CMAPencilDMYawAlignmentSolver]:[iterate] Reject iterate request before initialization.";
      uint64_t v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl(&dword_227B19000, v14, v15, v13, buf, 2u);
    }
    return v6;
  }
  if (a2 >= 50) {
    int v2 = 50;
  }
  else {
    int v2 = a2;
  }
  if (v2 < 0) {
    return 0.0;
  }
  int v4 = *(_DWORD *)(a1 + 40);
  uint64_t v18 = 0;
  float v5 = 0.01;
  float v6 = 0.0;
  if (sub_227C94C50(a1, (float *)&v18 + 1, (float *)&v18, 0.01))
  {
    int v7 = 0;
    int v8 = v2 + 1;
    while (1)
    {
      *(float *)(a1 + 40) = *((float *)&v18 + 1) + *(float *)(a1 + 40);
      float v6 = sub_227C9479C(a1);
      float v9 = *(float *)(a1 + 44);
      if ((float)(v6 - v9) <= 0.0)
      {
        if (fabsf(v6 - v9) < (float)(fabsf(v9) * 0.001))
        {
          if (qword_2681B9A70 != -1) {
            dispatch_once(&qword_2681B9A70, &unk_26DC295C0);
          }
          uint64_t v17 = qword_2681B9A78;
          if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            long long v13 = "[BarrelRoll]:[CMAPencilDMYawAlignmentSolver]:[iterate] Converged!";
            goto LABEL_38;
          }
          return v6;
        }
        *(float *)(a1 + 44) = v6;
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC295C0);
        }
        float v5 = fmaxf(v5 * 0.5, 0.00000001);
        unint64_t v11 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v20 = v5;
          _os_log_impl(&dword_227B19000, v11, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAPencilDMYawAlignmentSolver]:[iterate] Accept (lambda = %.6f)", buf, 0xCu);
        }
        int v7 = 0;
      }
      else
      {
        *(_DWORD *)(a1 + 40) = v4;
        *(float *)(a1 + 44) = sub_227C9479C(a1);
        if (v7 >= 3)
        {
          if (qword_2681B9A70 != -1) {
            dispatch_once(&qword_2681B9A70, &unk_26DC295C0);
          }
          uint64_t v17 = qword_2681B9A78;
          if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            long long v13 = "[BarrelRoll]:[CMAPencilDMYawAlignmentSolver]:[iterate] Max rollbacks exceeded, exiting!";
LABEL_38:
            uint64_t v14 = v17;
            os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
            goto LABEL_27;
          }
          return v6;
        }
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC295C0);
        }
        float v5 = v5 * 5.0;
        ++v7;
        float v10 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v20 = v5;
          _os_log_impl(&dword_227B19000, v10, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAPencilDMYawAlignmentSolver]:[iterate] Rollback (lambda = %.6f)", buf, 0xCu);
        }
      }
      if (--v8)
      {
        int v4 = *(_DWORD *)(a1 + 40);
        uint64_t v18 = 0;
        if (sub_227C94C50(a1, (float *)&v18 + 1, (float *)&v18, v5)) {
          continue;
        }
      }
      return v6;
    }
  }
  return v6;
}

uint64_t sub_227C94C50(uint64_t a1, float *a2, float *a3, float a4)
{
  int v8 = (unint64_t *)(a1 + 56);
  sub_227C94F14((void *)(a1 + 56));
  __float2 v9 = __sincosf_stret(*(float *)(a1 + 40));
  v19[0] = -v9.__sinval;
  v19[1] = -v9.__cosval;
  v19[2] = v9.__cosval;
  v19[3] = -v9.__sinval;
  if (*(void *)(a1 + 8))
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = *(void *)(a1 + 16) + v10;
      long long v18 = *(_OWORD *)(v12 + 16);
      v17[0] = sub_227C8EA7C((uint64_t)v19, (float *)v12);
      v17[1] = v13;
      v16[0] = sub_227C96730((float *)(*(void *)(a1 + 16) + v10), *(float *)(a1 + 40));
      v16[1] = v14;
      sub_227C94FD8(v8, v16, v17, (uint64_t)&v18);
      ++v11;
      v10 += 32;
    }
    while (*(void *)(a1 + 8) > v11);
  }
  return sub_227C95204(v8, a2, a3, a4);
}

float sub_227C94D3C(void *a1, float *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 7) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    sub_227C95880(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }
  float result = *a2;
  *(float *)(*(void *)(v5 + ((v8 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v8 & 0x3FF)) = *a2;
  a1[5] = v7 + 1;
  return result;
}

float sub_227C94DC4(void *a1)
{
  unint64_t v1 = a1[5];
  if (!v1) {
    return 0.0;
  }
  if (v1 == 1)
  {
    unint64_t v3 = a1[4];
  }
  else
  {
    uint64_t v5 = v1 >> 1;
    unint64_t v6 = a1[4];
    uint64_t v7 = a1[1];
    unint64_t v8 = (float **)(v7 + 8 * (v6 >> 10));
    if (a1[2] == v7) {
      __float2 v9 = 0;
    }
    else {
      __float2 v9 = &(*v8)[a1[4] & 0x3FFLL];
    }
    v18[0] = v7 + 8 * (v6 >> 10);
    v18[1] = v9;
    unint64_t v11 = (float **)sub_227C92C08((uint64_t)v18, v5);
    uint64_t v12 = a1[5];
    unint64_t v13 = a1[4] + v12;
    uint64_t v14 = a1[1];
    os_log_type_t v15 = (float **)(v14 + 8 * (v13 >> 10));
    if (a1[2] == v14) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = &(*v15)[v13 & 0x3FF];
    }
    if (v10 != v16)
    {
      sub_227C95B98(v8, v9, v11, v10, v15, v16);
      uint64_t v12 = a1[5];
    }
    if ((v12 & 1) == 0)
    {
      unint64_t v17 = a1[4] + v5;
      return (float)(*(float *)(*(void *)(a1[1] + (((v17 - 1) >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * ((v17 - 1) & 0x3FF))
                   + *(float *)(*(void *)(a1[1] + ((v17 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v17 & 0x3FF)))
           * 0.5;
    }
    unint64_t v3 = a1[4] + v5;
  }
  return *(float *)(*(void *)(a1[1] + ((v3 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v3 & 0x3FF));
}

void sub_227C94F14(void *a1)
{
  a1[1] = 0;
  int v2 = (void *)a1[2];
  uint64_t v3 = a1[3] - (void)v2;
  if (v3 >= 1) {
    bzero(v2, 4 * (((unint64_t)v3 >> 2) - ((unint64_t)v3 > 3)) + 4);
  }
  uint64_t v4 = (void *)a1[5];
  uint64_t v5 = a1[6] - (void)v4;
  if (v5 >= 1) {
    bzero(v4, 4 * (((unint64_t)v5 >> 2) - ((unint64_t)v5 > 3)) + 4);
  }
  unint64_t v6 = (void *)a1[8];
  uint64_t v7 = a1[9] - (void)v6;
  if (v7 >= 1)
  {
    bzero(v6, 8 * (((unint64_t)v7 >> 3) - ((unint64_t)v7 > 7)) + 8);
  }
}

void sub_227C94FD8(unint64_t *a1, float *a2, float *a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t v5 = a1[1];
  if (v5 <= *a1)
  {
    if (v5 == *a1 - 1)
    {
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC295C0);
      }
      uint64_t v12 = qword_2681B9A78;
      BOOL v13 = os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG);
      unint64_t v5 = a1[1];
      if (v13)
      {
        unint64_t v14 = *a1;
        *(_DWORD *)buf = 134218240;
        unint64_t v25 = v5;
        __int16 v26 = 2048;
        unint64_t v27 = v14;
        _os_log_impl(&dword_227B19000, v12, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAMEstimator1DConstant]:[add] Adding last sample. Number of added inputs: %lu, initial allocation: %lu.", buf, 0x16u);
        unint64_t v5 = a1[1];
      }
    }
    *(void *)(a1[8] + 8 * v5) = 2 * v5;
    *(_DWORD *)buf = sub_227C8EA7C(a4, a3);
    LODWORD(v25) = v15;
    float v16 = sub_227C8EA7C(a4, a2);
    unint64_t v17 = 0;
    *(float *)uint64_t v23 = v16;
    v23[1] = v18;
    char v19 = 1;
    do
    {
      char v20 = v19;
      *(float *)(a1[2] + 4 * (*(void *)(a1[8] + 8 * a1[1]) + v17)) = sub_227C8A18C((uint64_t)buf, v17);
      float v21 = sub_227C8A18C((uint64_t)v23, v17);
      char v19 = 0;
      unint64_t v22 = a1[1];
      *(float *)(a1[5] + 4 * (*(void *)(a1[8] + 8 * v22) + v17)) = v21;
      unint64_t v17 = 1;
    }
    while ((v20 & 1) != 0);
    a1[1] = v22 + 1;
  }
  else
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC295C0);
    }
    unint64_t v6 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = *a1;
      unint64_t v7 = a1[1];
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = v7;
      __int16 v26 = 2048;
      unint64_t v27 = v8;
      _os_log_impl(&dword_227B19000, v6, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMAMEstimator1DConstant]:[add] Number of added inputs: %lu exceeded the initial allocation: %lu . Will NOT add this sample.", buf, 0x16u);
    }
  }
}

uint64_t sub_227C95204(void *a1, float *a2, float *a3, float a4)
{
  unint64_t v5 = a1[1];
  if (v5)
  {
    *(_DWORD *)uint64_t v52 = 1065353216;
    sub_227C95740(buf, v5, v52);
    unsigned int v9 = 0;
    *a2 = 0.0;
    float v10 = 0.0;
    float v11 = 3.4028e38;
    while (1)
    {
      if (v9 > 0x63)
      {
LABEL_42:
        uint64_t v42 = 1;
        goto LABEL_53;
      }
      if (!sub_227C961E8(a1, buf, a2, a3, a4)) {
        break;
      }
      unint64_t v12 = 2 * a1[1];
      LODWORD(v51[0]) = 0;
      sub_227C95740(v52, v12, v51);
      unint64_t v13 = 2 * a1[1];
      if (v13)
      {
        unint64_t v14 = (float *)a1[5];
        int v15 = (float *)a1[2];
        uint64_t v16 = 2 * a1[1];
        unint64_t v17 = *(float **)v52;
        do
        {
          float v18 = *v14++;
          float v19 = v18;
          float v20 = *v15++;
          *v17++ = v19 - (float)(v20 * *a2);
          --v16;
        }
        while (v16);
      }
      LODWORD(__p) = 0;
      sub_227C95740(v51, v13, &__p);
      unint64_t v21 = a1[1];
      uint64_t v22 = 2 * v21;
      if (2 * v21)
      {
        uint64_t v23 = (float *)a1[5];
        uint64_t v24 = (float *)a1[2];
        unint64_t v25 = (float *)v51[0];
        do
        {
          float v26 = *v23++;
          float v27 = v26;
          float v28 = *v24++;
          *v25++ = v27 - (float)(v28 * v10);
          --v22;
        }
        while (v22);
      }
      float v47 = 0.0;
      sub_227C95740(&__p, v21, &v47);
      unint64_t v30 = a1[1];
      if (v30)
      {
        unint64_t v31 = 0;
        uint64_t v32 = a1[8];
        float v33 = 0.0;
        do
        {
          unint64_t v34 = *(void *)(v32 + 8 * v31);
          float v35 = 0.0;
          if (v34 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            unint64_t v36 = 0;
            do
            {
              int v37 = *((_DWORD *)v51[0] + v34);
              *(_DWORD *)sub_227C8A280((uint64_t)&v47, v36) = v37;
              int v38 = *(_DWORD *)(*(void *)v52 + 4 * v34);
              *(_DWORD *)sub_227C8A280((uint64_t)v46, v36++) = v38;
              float v35 = v35 + (float)(*(float *)(*(void *)v52 + 4 * v34) * *(float *)(*(void *)v52 + 4 * v34));
              ++v34;
              uint64_t v32 = a1[8];
            }
            while (v34 < *(void *)(v32 + 8 * v31) + 2);
            float v29 = v47;
            unint64_t v30 = a1[1];
          }
          if (v29 <= 0.0) {
            float v29 = -v29;
          }
          float v39 = v48;
          if (v48 <= 0.0) {
            float v39 = -v48;
          }
          if (v39 > v29) {
            float v29 = v39;
          }
          if (v29 <= 1.345) {
            float v40 = 1.0;
          }
          else {
            float v40 = 1.345 / v29;
          }
          *((float *)__p + v31) = v40;
          float v29 = *(float *)(*(void *)buf + 4 * v31);
          float v33 = v33 + (float)(v29 * v35);
          ++v31;
        }
        while (v30 > v31);
      }
      else
      {
        float v33 = 0.0;
      }
      if ((float)(v33 - v11) <= 0.0)
      {
        sub_227B8BA68((char *)buf, (char *)__p, (uint64_t)v50, (v50 - (unsigned char *)__p) >> 2);
        if (fabsf(v33 - v11) >= (float)(fabsf(v11) * 0.00001))
        {
          float v10 = *a2;
          ++v9;
          char v41 = 1;
        }
        else
        {
          char v41 = 0;
        }
        float v11 = v33;
      }
      else
      {
        char v41 = 0;
        *a2 = v10;
      }
      if (__p)
      {
        uint64_t v50 = __p;
        operator delete(__p);
      }
      if (v51[0])
      {
        v51[1] = v51[0];
        operator delete(v51[0]);
      }
      if (*(void *)v52)
      {
        uint64_t v53 = *(float **)v52;
        operator delete(*(void **)v52);
      }
      if ((v41 & 1) == 0) {
        goto LABEL_42;
      }
    }
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC295C0);
    }
    int v44 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v52 = 0;
      _os_log_impl(&dword_227B19000, v44, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMAMEstimator1DConstant]:[solve] Ill conditioned. Exiting solver.", v52, 2u);
    }
    uint64_t v42 = 0;
LABEL_53:
    if (*(void *)buf)
    {
      float v55 = *(void **)buf;
      operator delete(*(void **)buf);
    }
  }
  else
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC295C0);
    }
    int v43 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227B19000, v43, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMAMEstimator1DConstant]:[solve] Called solve before adding any constraints. Aborting and returning false.", buf, 2u);
    }
    return 0;
  }
  return v42;
}

void sub_227C955EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24)
{
  if (__p) {
    operator delete(__p);
  }
  if (a16) {
    operator delete(a16);
  }
  if (a19) {
    operator delete(a19);
  }
  if (a23) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

os_log_t sub_227C95650()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_2681B9A78 = (uint64_t)result;
  return result;
}

unint64_t *sub_227C95680(unint64_t *a1, unint64_t a2)
{
  *a1 = a2;
  a1[1] = 0;
  unint64_t v4 = 2 * a2;
  LODWORD(v6) = 0;
  sub_227C95740(a1 + 2, 2 * a2, &v6);
  LODWORD(v6) = 0;
  sub_227C95740(a1 + 5, v4, &v6);
  uint64_t v6 = 0;
  sub_227C957C4(a1 + 8, a2, &v6);
  return a1;
}

void sub_227C9570C(_Unwind_Exception *exception_object)
{
  unint64_t v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 48) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

void *sub_227C95740(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_227B8BB74(a1, a2);
    uint64_t v6 = (_DWORD *)a1[1];
    unint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_227C957A8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_227C957C4(void *a1, unint64_t a2, void *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_227B8B858(a1, a2);
    uint64_t v6 = (void *)a1[1];
    unint64_t v7 = &v6[a2];
    uint64_t v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_227C9582C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_227C95848(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_227B8B97C();
  }
  return operator new(32 * a2);
}

void sub_227C95880(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x400;
  unint64_t v4 = v2 - 1024;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    unsigned int v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)uint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)sub_227B8B8B4(v5, v33);
      float v35 = &v34[8 * (v33 >> 2)];
      int v37 = &v34[8 * v36];
      int v38 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        uint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        char v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)char v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    float v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      unsigned int v9 = (char *)a1[1];
    }
    uint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      sub_227BE08D0(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    sub_227BE09E8((uint64_t)a1, &v54);
    int v44 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    unsigned int v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)sub_227B8B8B4((uint64_t)(a1 + 3), v46);
      float v35 = &v34[8 * (v46 >> 2)];
      int v37 = &v34[8 * v47];
      float v48 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        uint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        BOOL v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)BOOL v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      int v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        uint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  float v56 = a1 + 3;
  *(void *)&long long v54 = sub_227B8B8B4((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0x1000uLL);
  sub_227BE0B08(&v54, &v53);
  float v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_227BE0C20((uint64_t)&v54, v27);
  }
  float v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_227C95B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

float **sub_227C95B98(float **result, float *a2, float **a3, float *a4, float **a5, float *a6)
{
  uint64_t v70 = result;
  float v71 = a2;
  if (a6 != a4)
  {
    uint64_t v6 = a6;
    uint64_t v10 = a2;
    do
    {
      if (v6 == v10) {
        break;
      }
      uint64_t v11 = *a5;
      uint64_t v12 = v6 - *a5 + (((char *)a5 - (char *)result) << 7) - (v10 - *result);
      if ((unint64_t)v12 < 2) {
        break;
      }
      if (v12 == 3)
      {
        uint32_t v65 = v10 + 1;
        uint64_t v66 = v70;
        if ((char *)(v10 + 1) - (char *)*v70 == 4096)
        {
          uint64_t v66 = v70 + 1;
          uint32_t v65 = v70[1];
        }
        if (v6 == v11)
        {
          uint64_t v67 = (uint64_t)*--a5;
          uint64_t v6 = (float *)(v67 + 4096);
        }
        return (float **)sub_227C960B0((uint64_t)v70, v10, (uint64_t)v66, v65, (uint64_t)a5, v6 - 1);
      }
      if (v12 == 2)
      {
        if (v6 == v11) {
          uint64_t v6 = *(a5 - 1) + 1024;
        }
        float v68 = *(v6 - 1);
        if (v68 < *v10)
        {
          float v69 = *a2;
          *a2 = v68;
          *(v6 - 1) = v69;
        }
        return result;
      }
      if (v12 <= 7) {
        return sub_227C96138(v70, a2, a5, v6);
      }
      BOOL v14 = sub_227C92C08((uint64_t)&v70, (unint64_t)v12 >> 1);
      uint64_t v15 = v13;
      uint64_t v16 = a5;
      uint64_t v17 = (uint64_t)v6;
      if (v6 == *a5)
      {
        uint64_t v16 = a5 - 1;
        uint64_t v17 = (uint64_t)(*(a5 - 1) + 1024);
      }
      uint64_t v18 = (float *)(v17 - 4);
      int v19 = sub_227C960B0((uint64_t)v70, v71, (uint64_t)v14, v13, (uint64_t)v16, (float *)(v17 - 4));
      os_log_t result = v70;
      a2 = v71;
      float v20 = *v71;
      if (*v71 < *v15)
      {
LABEL_17:
        uint64_t v23 = a2 + 1;
        uint64_t v24 = *result;
        unint64_t v25 = *result;
        uint64_t v26 = result;
        if ((char *)(a2 + 1) - (char *)*result == 4096)
        {
          uint64_t v26 = result + 1;
          unint64_t v25 = result[1];
          uint64_t v23 = v25;
        }
        if (v26 < v16 || v26 == v16 && v23 < v18)
        {
          while (1)
          {
            float v27 = *v15;
            while (1)
            {
              float v28 = *v23;
              if (*v23 >= v27) {
                break;
              }
              if ((char *)++v23 - (char *)v25 == 4096)
              {
                float v29 = v26[1];
                ++v26;
                unint64_t v25 = v29;
                uint64_t v23 = v29;
              }
            }
            long long v30 = *v16;
            do
            {
              if (v18 == v30)
              {
                long long v31 = *--v16;
                long long v30 = v31;
                uint64_t v18 = v31 + 1024;
              }
              float v32 = *--v18;
              float v33 = v32;
            }
            while (v32 >= v27);
            if (v26 >= v16 && (v26 != v16 || v23 >= v18)) {
              break;
            }
            BOOL v34 = v15 == v23;
            *v23++ = v33;
            *uint64_t v18 = v28;
            ++v19;
            if (v34) {
              uint64_t v15 = v18;
            }
            if ((char *)v23 - (char *)v25 == 4096)
            {
              float v35 = v26[1];
              ++v26;
              unint64_t v25 = v35;
              uint64_t v23 = v35;
            }
          }
        }
        if (v23 != v15)
        {
          int v36 = *(_DWORD *)v23;
          if (*v15 < *v23)
          {
            *uint64_t v23 = *v15;
            *(_DWORD *)uint64_t v15 = v36;
            ++v19;
          }
        }
        if (v23 == a4) {
          return result;
        }
        if (!v19)
        {
          if (v26 > a3 || (int v37 = v25, v38 = v23, v39 = v26, v23 > a4) && (int v37 = v25, v38 = v23, v39 = v26, v26 == a3))
          {
            uint64_t v40 = a2;
            char v41 = result;
            while (1)
            {
              uint64_t v42 = v40 + 1;
              if ((char *)(v40 + 1) - (char *)v24 == 4096)
              {
                int v43 = v41[1];
                ++v41;
                uint64_t v24 = v43;
                uint64_t v42 = v43;
              }
              if (v42 == v23) {
                break;
              }
              BOOL v44 = *v42 < *v40;
              uint64_t v40 = v42;
              if (v44) {
                goto LABEL_42;
              }
            }
          }
          else
          {
            while (1)
            {
              uint64_t v45 = v38 + 1;
              if ((char *)(v38 + 1) - (char *)v37 == 4096)
              {
                unint64_t v46 = v39[1];
                ++v39;
                int v37 = v46;
                uint64_t v45 = v46;
              }
              if (v45 == v6) {
                break;
              }
              BOOL v44 = *v45 < *v38;
              int v38 = v45;
              if (v44) {
                goto LABEL_42;
              }
            }
          }
          return result;
        }
LABEL_42:
        if (v26 <= a3)
        {
          if (v23 > a4 && v26 == a3)
          {
            uint64_t v10 = a2;
            uint64_t v6 = v23;
            a5 = a3;
          }
          else
          {
            a2 = v23 + 1;
            if ((char *)(v23 + 1) - (char *)v25 == 4096)
            {
              int v63 = v26[1];
              ++v26;
              a2 = v63;
            }
            uint64_t v70 = v26;
            float v71 = a2;
            os_log_t result = v26;
            uint64_t v10 = a2;
          }
        }
        else
        {
          uint64_t v10 = a2;
          uint64_t v6 = v23;
          a5 = v26;
        }
      }
      else
      {
        uint64_t v21 = *v16;
        while (1)
        {
          if (v18 == v21)
          {
            unint64_t v22 = *--v16;
            uint64_t v21 = v22;
            uint64_t v18 = v22 + 1024;
          }
          if (v71 == --v18) {
            break;
          }
          if (*v18 < *v15)
          {
            *float v71 = *v18;
            *uint64_t v18 = v20;
            ++v19;
            goto LABEL_17;
          }
        }
        uint64_t v10 = v71 + 1;
        uint64_t v47 = *v70;
        if ((char *)(v71 + 1) - (char *)*v70 == 4096)
        {
          os_log_t result = v70 + 1;
          uint64_t v47 = v70[1];
          uint64_t v10 = v47;
        }
        float v48 = *a5;
        uint64_t v49 = a5;
        uint64_t v50 = v6;
        if (v6 == *a5)
        {
          uint64_t v49 = a5 - 1;
          float v48 = *(a5 - 1);
          uint64_t v50 = v48 + 1024;
        }
        float v52 = *(v50 - 1);
        BOOL v51 = v50 - 1;
        float v53 = v52;
        if (v20 >= v52)
        {
          while (v10 != v51)
          {
            float v61 = *v10;
            if (v20 < *v10)
            {
              *v10++ = v53;
              *BOOL v51 = v61;
              if ((char *)v10 - (char *)v47 == 4096)
              {
                uint64_t v64 = result[1];
                ++result;
                uint64_t v47 = v64;
                uint64_t v10 = v64;
              }
              goto LABEL_68;
            }
            if ((char *)++v10 - (char *)v47 == 4096)
            {
              uint64_t v62 = result[1];
              ++result;
              uint64_t v47 = v62;
              uint64_t v10 = v62;
            }
          }
          return result;
        }
LABEL_68:
        if (v10 == v51) {
          return result;
        }
        while (1)
        {
          float v54 = *a2;
          while (1)
          {
            float v55 = *v10;
            if (v54 < *v10) {
              break;
            }
            if ((char *)++v10 - (char *)v47 == 4096)
            {
              float v56 = result[1];
              ++result;
              uint64_t v47 = v56;
              uint64_t v10 = v56;
            }
          }
          do
          {
            if (v51 == v48)
            {
              int v57 = *--v49;
              float v48 = v57;
              BOOL v51 = v57 + 1024;
            }
            float v58 = *--v51;
            float v59 = v58;
          }
          while (v54 < v58);
          if (result >= v49 && (result != v49 || v10 >= v51)) {
            break;
          }
          *v10++ = v59;
          *BOOL v51 = v55;
          if ((char *)v10 - (char *)v47 == 4096)
          {
            uint64_t v60 = result[1];
            ++result;
            uint64_t v47 = v60;
            uint64_t v10 = v60;
          }
        }
        if (result > a3 || v10 > a4 && result == a3) {
          return result;
        }
        uint64_t v70 = result;
        float v71 = v10;
        a2 = v10;
      }
    }
    while (v6 != a4);
  }
  return result;
}

uint64_t sub_227C960B0(uint64_t a1, float *a2, uint64_t a3, float *a4, uint64_t a5, float *a6)
{
  float v6 = *a4;
  float v7 = *a2;
  float v8 = *a6;
  if (*a4 < *a2)
  {
    if (v8 < v6)
    {
      *a2 = v8;
      *a6 = v7;
      return 1;
    }
    *a2 = v6;
    *a4 = v7;
    if (*a6 >= v7) {
      return 1;
    }
    *a4 = *a6;
    *a6 = v7;
    return 2;
  }
  if (v8 < v6)
  {
    *a4 = v8;
    *a6 = v6;
    float v9 = *a2;
    if (*a4 >= *a2) {
      return 1;
    }
    *a2 = *a4;
    *a4 = v9;
    return 2;
  }
  return 0;
}

float **sub_227C96138(float **result, float *a2, float **a3, float *a4)
{
  uint64_t v4 = (uint64_t)a4;
  if (*a3 == a4) {
    uint64_t v4 = (uint64_t)(*(a3 - 1) + 1024);
  }
  uint64_t v5 = (float *)(v4 - 4);
  while (a2 != v5)
  {
    if (a2 == a4)
    {
      float v7 = a4;
    }
    else
    {
      float v6 = *result;
      float v7 = a2;
      float v8 = a2;
      float v9 = result;
      while (1)
      {
        if ((char *)++v8 - (char *)v6 == 4096)
        {
          uint64_t v10 = v9[1];
          ++v9;
          float v6 = v10;
          float v8 = v10;
        }
        if (v8 == a4) {
          break;
        }
        if (*v8 < *v7) {
          float v7 = v8;
        }
      }
    }
    if (v7 != a2)
    {
      float v11 = *a2;
      *a2 = *v7;
      *float v7 = v11;
    }
    if ((char *)++a2 - (char *)*result == 4096)
    {
      uint64_t v12 = result[1];
      ++result;
      a2 = v12;
    }
  }
  return result;
}

BOOL sub_227C961E8(void *a1, void *a2, float *a3, float *a4, float a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v7 = a1[1];
  if (v7)
  {
    uint64_t v8 = 0;
    float v9 = 0.0;
    float v10 = 0.0;
    do
    {
      unint64_t v11 = *(void *)(a1[8] + 8 * v8);
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        unint64_t v12 = v11 + 2;
        float v13 = *(float *)(*a2 + 4 * v8);
        do
        {
          float v14 = *(float *)(a1[2] + 4 * v11);
          float v10 = v10 + (float)((float)(v13 * v14) * v14);
          float v9 = v9 + (float)((float)(v13 * v14) * *(float *)(a1[5] + 4 * v11++));
        }
        while (v11 < v12);
      }
      ++v8;
    }
    while (v8 != v7);
  }
  else
  {
    float v10 = 0.0;
    float v9 = 0.0;
  }
  float v15 = v10 + a5;
  if ((float)(v10 + a5) < 0.000000001)
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC295C0);
    }
    uint64_t v17 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      int v19 = 134218240;
      double v20 = v15;
      __int16 v21 = 2048;
      uint64_t v22 = 0x3E112E0BE0000000;
      _os_log_impl(&dword_227B19000, v17, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMAMEstimator1DConstant]:[normal_solve] Information matrix: %f below min valid value: %f. Will not proceed with this solve step.", (uint8_t *)&v19, 0x16u);
    }
    *a4 = 0.0;
    float v16 = 0.0;
  }
  else
  {
    *a4 = v15;
    float v16 = v9 / v15;
  }
  BOOL result = v15 >= 0.000000001;
  *a3 = v16;
  return result;
}

uint64_t sub_227C96384(uint64_t a1, float *a2, float *a3, float32x2_t *a4, float32x2_t *a5)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  float v9 = a2[1];
  __float2 v10 = __sincosf_stret(*a2);
  __float2 v12 = __sincosf_stret(v9);
  v11.f32[0] = v12.__sinval;
  sub_227CA4C6C(a4, (float32x4_t *)buf, v11);
  v13.f32[0] = sub_227CA4ED8((float *)buf, v10.__sinval * v12.__cosval, v10.__sinval * v12.__sinval, v10.__cosval);
  uint64_t v15 = 0;
  *(_DWORD *)buf = v13.i32[0];
  *(void *)&double v46 = LODWORD(v14);
  float v16 = 0.0;
  do
  {
    float v16 = v16 + (float)(*(float *)&buf[v15] * *(float *)&buf[v15]);
    v15 += 4;
  }
  while (v15 != 12);
  if (sqrtf(v16) > 0.00000011921)
  {
    uint64_t v17 = 0;
    float v18 = 0.0;
    do
    {
      float v18 = v18 + (float)(*(float *)&buf[v17] * *(float *)&buf[v17]);
      v17 += 4;
    }
    while (v17 != 12);
    float v19 = sqrtf(v18);
    v13.f32[0] = v13.f32[0] / v19;
    float v14 = v14 / v19;
  }
  *(_DWORD *)a1 = v13.i32[0];
  *(float *)(a1 + 4) = v14;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681BAE50, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681BAE50))
  {
    qword_2681BAE40 = 0x3F80000000000000;
    dword_2681BAE48 = 0;
    __cxa_guard_release(&qword_2681BAE50);
  }
  sub_227CA4C6C(a5, (float32x4_t *)buf, v13);
  float v20 = sub_227CA4ED8((float *)buf, *(float *)&qword_2681BAE40, *((float *)&qword_2681BAE40 + 1), *(float *)&dword_2681BAE48);
  uint64_t v22 = 0;
  *(float *)buf = v20;
  *(void *)&double v46 = LODWORD(v21);
  float v23 = 0.0;
  do
  {
    float v23 = v23 + (float)(*(float *)&buf[v22] * *(float *)&buf[v22]);
    v22 += 4;
  }
  while (v22 != 12);
  if (sqrtf(v23) > 0.00000011921)
  {
    uint64_t v24 = 0;
    float v25 = 0.0;
    do
    {
      float v25 = v25 + (float)(*(float *)&buf[v24] * *(float *)&buf[v24]);
      v24 += 4;
    }
    while (v24 != 12);
    float v26 = sqrtf(v25);
    float v20 = v20 / v26;
    float v21 = v21 / v26;
  }
  unint64_t v27 = 0;
  *(float *)(a1 + 8) = v20;
  *(float *)(a1 + 12) = v21;
  char v28 = 1;
  char v29 = 1;
  do
  {
    char v30 = v28;
    if (sub_227C8A18C((uint64_t)a3, v27) >= 0.000000001)
    {
      float v31 = sqrtf(1.0 / sub_227C8A18C((uint64_t)a3, v27));
    }
    else
    {
      if (v29) {
        char v29 = 0;
      }
      float v31 = 0.000000001;
    }
    float v32 = (float *)sub_227C8A280((uint64_t)v44, v27);
    char v28 = 0;
    *float v32 = v31;
    unint64_t v27 = 1;
  }
  while ((v30 & 1) != 0);
  *(float *)(a1 + 16) = sub_227C8BD80((uint64_t)v44);
  *(_DWORD *)(a1 + 20) = v33;
  *(_DWORD *)(a1 + 24) = v34;
  *(_DWORD *)(a1 + 28) = v35;
  if ((v29 & 1) == 0)
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC295E0);
    }
    int v36 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      double v37 = *(float *)a1;
      double v38 = *(float *)(a1 + 4);
      double v39 = *(float *)(a1 + 8);
      double v40 = *(float *)(a1 + 12);
      double v41 = *a3;
      double v42 = a3[1];
      *(_DWORD *)buf = 134219264;
      double v46 = v37;
      __int16 v47 = 2048;
      double v48 = v38;
      __int16 v49 = 2048;
      double v50 = v39;
      __int16 v51 = 2048;
      double v52 = v40;
      __int16 v53 = 2048;
      double v54 = v41;
      __int16 v55 = 2048;
      double v56 = v42;
      _os_log_impl(&dword_227B19000, v36, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMAPencilDMYawAlignmentMeasurement]:[CMAPencilDMYawAlignmentMeasurement] Failed measurement covariance Cholesky decomposition. f_eY_IS_xy: %.6f %.6f, f_eY_IP_xy: %.6f %.6f, ringMeasCovRad2: %.6f %.6f", buf, 0x3Eu);
    }
  }
  return a1;
}

float sub_227C966E0(float *a1)
{
  float v1 = a1[1];
  float sinval = __sincosf_stret(*a1).__sinval;
  return sinval * __sincosf_stret(v1).__cosval;
}

float sub_227C96730(float *a1, float a2)
{
  __float2 v3 = __sincosf_stret(a2);
  v5[0] = LODWORD(v3.__cosval);
  *(float *)&v5[1] = -v3.__sinval;
  __float2 v6 = v3;
  return a1[2] - sub_227C8EA7C((uint64_t)v5, a1);
}

void sub_227C96780(float *a1)
{
  float v1 = (float)((float)(a1[1] * a1[3]) + 0.0) + (float)(*a1 * a1[2]);
  if (v1 > 1.0) {
    float v1 = 1.0;
  }
  if (v1 < -1.0) {
    float v1 = -1.0;
  }
  acosf(v1);
}

float sub_227C967E0@<S0>(float *a1@<X0>, uint64_t a2@<X8>)
{
  float v3 = a1[1];
  __float2 v4 = __sincosf_stret(*a1);
  __float2 v5 = __sincosf_stret(v3);
  float result = -(float)(v5.__sinval * v4.__sinval);
  *(float *)a2 = v4.__cosval * v5.__cosval;
  *(float *)(a2 + 4) = v4.__cosval * v5.__sinval;
  *(float *)(a2 + 8) = -v4.__sinval;
  *(float *)(a2 + 12) = result;
  *(float *)(a2 + 16) = v4.__sinval * v5.__cosval;
  *(_DWORD *)(a2 + 20) = 0;
  return result;
}

os_log_t sub_227C9684C()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_2681B9A78 = (uint64_t)result;
  return result;
}

uint64_t sub_227C9687C(uint64_t a1)
{
  *(_DWORD *)a1 = 0x1000000;
  *(unsigned char *)(a1 + 4) = 0;
  *(void *)(a1 + 8) = 0xBF80000000000000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0x3F80000000000000;
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 168) = 0x3F80000000000000;
  sub_227CA19B8(a1 + 176);
  *(_DWORD *)a1 = 0x1000000;
  *(unsigned char *)(a1 + 4) = 0;
  *(void *)(a1 + 8) = 0xBF80000000000000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0x3F80000000000000;
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 168) = 0x3F80000000000000;
  sub_227CA1A14(v2);
  return a1;
}

void sub_227C9691C(_Unwind_Exception *a1)
{
  void *v1 = &unk_26DC29610;
  _Unwind_Resume(a1);
}

double sub_227C9693C(uint64_t a1)
{
  *(_DWORD *)a1 = 0x1000000;
  *(unsigned char *)(a1 + 4) = 0;
  *(void *)(a1 + 8) = 0xBF80000000000000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 168) = 0x3F80000000000000;
  *(void *)(a1 + 152) = 0x3F80000000000000;
  return sub_227CA1A14(a1 + 176);
}

void *sub_227C9697C(void *result)
{
  *os_log_t result = &unk_26DC29610;
  return result;
}

void sub_227C969A0(uint64_t a1, uint64_t a2, float a3, double a4)
{
  uint64_t v7 = (unint64_t)(a4 * 1000000.0);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 32) = v8;
  long long v9 = *(_OWORD *)(a2 + 32);
  long long v10 = *(_OWORD *)(a2 + 64);
  uint64_t v11 = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 80) = v10;
  *(_OWORD *)(a1 + 48) = v9;
  *(void *)(a1 + 96) = v11;
  *(void *)(a1 + 104) = v7;
  unsigned int v12 = *(_DWORD *)(a2 + 44);
  float v13 = *(float *)(a2 + 48);
  float v14 = *(float *)(a2 + 52);
  unint64_t v37 = __PAIR64__(LODWORD(v13), v12);
  float v38 = v14;
  LODWORD(v9) = *(_DWORD *)(a2 + 64);
  uint64_t v35 = *(void *)(a2 + 56);
  int v36 = v9;
  int8x16_t v15 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)a2), *(float64x2_t *)(a2 + 16));
  float32x4_t v34 = (float32x4_t)vextq_s8(v15, v15, 4uLL);
  *(void *)&double v16 = sub_227CA506C(&v34, v34).u64[0];
  uint64_t v17 = (float32x4_t *)(a1 + 144);
  if ((float32x4_t *)(a1 + 144) != &v34)
  {
    HIDWORD(v16) = v34.i32[1];
    *uint64_t v17 = v34;
  }
  int v18 = *(_DWORD *)(a1 + 84);
  *(unsigned char *)a1 = v18 > 0;
  if (v18 >= 1)
  {
    int v19 = *(unsigned __int8 *)(a2 + 72);
    *(unsigned char *)(a1 + 1) = v19;
    if (*(unsigned char *)(a1 + 2))
    {
      char v20 = (float)(unint64_t)(v7 - *(void *)(a1 + 136)) < 60000000.0;
      if (*(unsigned char *)(a1 + 3)) {
        *(unsigned char *)(a1 + 3) = 0;
      }
    }
    else
    {
      char v20 = *(unsigned char *)(a1 + 3);
      if (v20)
      {
        *(float32x4_t *)(a1 + 160) = *v17;
LABEL_17:
        sub_227CA1A4C(a1 + 176, (uint64_t)&v37, (__n128 *)(a1 + 160), v7);
        *(void *)(a1 + 112) = v7;
        *(void *)(a1 + 120) = v37;
        *(float *)(a1 + 128) = v38;
        double v32 = *(float *)(a1 + 168);
        *(double *)(a1 + 16) = *(float *)(a1 + 172);
        *(float64x2_t *)(a1 + 24) = vcvtq_f64_f32(*(float32x2_t *)(a1 + 160));
        *(double *)(a1 + 40) = v32;
        sub_227CA5210((float *)(a1 + 160));
        *(_DWORD *)(a1 + 92) = v33;
        *(unsigned char *)(a1 + 88) = *(unsigned char *)(a1 + 1);
        *(unsigned char *)(a1 + 96) = *(unsigned char *)(a1 + 2);
        *(unsigned char *)(a1 + 97) = *(unsigned char *)(a1 + 4);
        *(unsigned char *)(a1 + 4) = 0;
        *(float *)(a1 + 12) = a3;
        return;
      }
    }
    if (!v19 || (v20 & 1) != 0)
    {
      LODWORD(v16) = v12;
      sub_227C96CCC((float32x2_t *)a1, v16, v13, v14);
      sub_227CA5210((float *)(a1 + 160));
      float v22 = v21;
      sub_227CA5210((float *)(a1 + 144));
      sub_227C96D80((float32x4_t *)a1, v22 - v23);
      *(unsigned char *)(a1 + 1) = 0;
    }
    else
    {
      sub_227C96C00((float32x4_t *)a1, (float *)&v35);
    }
    if (!*(unsigned char *)(a1 + 2))
    {
      sub_227CA5210((float *)(a1 + 160));
      float v25 = v24;
      sub_227CA5210((float *)(a1 + 144));
      float v27 = v25 - v26;
      sub_227CA5210((float *)(a1 + 160));
      float v29 = v28;
      sub_227CA5210((float *)(a1 + 144));
      float v31 = v29 - v30;
      if (v27 < 0.0) {
        float v31 = -v31;
      }
      *(unsigned char *)(a1 + 3) = v31 < 0.1;
    }
    goto LABEL_17;
  }
}

void sub_227C96C00(float32x4_t *a1, float *a2)
{
  float v4 = sub_227CA4DCC(a1[10].f32);
  uint64_t v5 = 0;
  uint64_t v17 = *(void *)a2;
  float v18 = a2[2];
  float v8 = (float)((float)(v6 * a2[2]) + (float)(a2[1] * v7)) + (float)(*a2 * v4);
  float v9 = v4 * v8;
  float v10 = v7 * v8;
  float v11 = v6 * v8;
  float v12 = *(float *)&v17 - v9;
  float v13 = *((float *)&v17 + 1) - v10;
  *(float *)&uint64_t v17 = v12;
  *((float *)&v17 + 1) = *((float *)&v17 + 1) - v10;
  float v14 = v18 - v11;
  float v18 = v18 - v11;
  float v15 = 0.0;
  do
  {
    float v15 = v15 + (float)(*(float *)((char *)&v17 + v5) * *(float *)((char *)&v17 + v5));
    v5 += 4;
  }
  while (v5 != 12);
  float v16 = sqrtf(v15);
  *(float *)&uint64_t v17 = v12 / v16;
  *((float *)&v17 + 1) = v13 / v16;
  float v18 = v14 / v16;
  sub_227C96E1C(a1, (float *)&v17);
  a1->i8[2] = 0;
}

double sub_227C96CCC(float32x2_t *a1, double result, float a3, float a4)
{
  float v4 = (double)(unint64_t)(*(void *)&a1[13] - *(void *)&a1[14]) * 0.000001;
  if (v4 <= 0.1)
  {
    float v6 = v4 * 0.5;
    float v7 = v6 * (float)(a4 + a1[16].f32[0]);
    *((float *)&result + 1) = a3;
    float32x2_t v12 = vmul_n_f32(vadd_f32(*(float32x2_t *)&result, a1[15]), v6);
    float v13 = v7;
    *(double *)v8.i64 = sub_227CA4FB4(&v11, (float *)&v12);
    float v9 = (float32x4_t *)&a1[20];
    os_log_t result = sub_227CA4C0C((uint64_t)&v11, v9->f32, &v10, v8);
    if (v9 != &v10)
    {
      os_log_t result = *(double *)v10.i64;
      *float v9 = v10;
    }
  }
  return result;
}

void sub_227C96D80(float32x4_t *a1, float a2)
{
  f32 = a1[9].f32;
  v10[0] = (float)(a2 * 0.017453) * sub_227CA4DCC(a1[9].f32);
  v10[1] = (float)(a2 * 0.017453) * v5;
  v10[2] = (float)(a2 * 0.017453) * v6;
  *(double *)v7.i64 = sub_227CA4FB4(&v9, v10);
  sub_227CA4C0C((uint64_t)&v9, f32, &v8, v7);
  if (&a1[10] != &v8) {
    a1[10] = v8;
  }
}

void sub_227C96E1C(float32x4_t *a1, float *a2)
{
  sub_227CA4F64(a1[10].f32, v7);
  float v4 = sub_227C970F8((uint64_t)v7, a2);
  float v6 = atan2f(v5, v4);
  sub_227C971C0(a1, v6);
}

uint64_t sub_227C96E78(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_227CA1B5C(a1 + 176, a2, a3, a4, *(float *)(a1 + 8));
  if (result)
  {
    uint64_t result = sub_227C96EC8(a1, v6, (float *)(a1 + 8200));
    *(unsigned char *)(a1 + 2) |= result;
  }
  *(unsigned char *)(a1 + 4) = result;
  return result;
}

uint64_t sub_227C96EC8(uint64_t a1, uint64_t a2, float *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (qword_2681B9AA0 != -1) {
    dispatch_once(&qword_2681B9AA0, &unk_26DC29630);
  }
  float v5 = qword_2681B9AA8;
  if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_DEBUG))
  {
    double v6 = *a3;
    double v7 = a3[1];
    double v8 = a3[2];
    double v9 = a3[3];
    *(_DWORD *)float v18 = 134218752;
    *(double *)&v18[4] = v6;
    *(_WORD *)&v18[12] = 2048;
    *(double *)&v18[14] = v7;
    __int16 v19 = 2048;
    double v20 = v8;
    __int16 v21 = 2048;
    double v22 = v9;
    _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_DEBUG, "visual localization,measurement,%f,%f,%f,%f", v18, 0x2Au);
  }
  *(_OWORD *)float v18 = *(_OWORD *)(a1 + 160);
  sub_227CA5210(a3);
  float v11 = v10;
  sub_227CA5210((float *)v18);
  float v13 = v11 - v12;
  if (v13 < 0.0) {
    float v13 = -v13;
  }
  if (v13 > 30.0 && *(_DWORD *)(a1 + 84) == 5) {
    return 0;
  }
  *(void *)(a1 + 136) = *(void *)(a1 + 104);
  sub_227CA5210(a3);
  float v16 = v15;
  sub_227CA5210((float *)v18);
  sub_227C97050((float32x4_t *)a1, v16 - v17);
  return 1;
}

void sub_227C97050(float32x4_t *a1, float a2)
{
  float v3 = -a2;
  if (a2 >= 0.0) {
    float v3 = a2;
  }
  if (v3 >= 0.00000011921)
  {
    v11[0] = (float)(a2 * 0.017453) * sub_227CA4DCC(a1[9].f32);
    v11[1] = (float)(a2 * 0.017453) * v5;
    v11[2] = (float)(a2 * 0.017453) * v6;
    *(double *)v7.i64 = sub_227CA4FB4(&v10, v11);
    double v8 = a1 + 10;
    sub_227CA4C0C((uint64_t)&v10, v8->f32, &v9, v7);
    if (v8 != &v9) {
      *double v8 = v9;
    }
  }
}

float sub_227C970F8(uint64_t a1, float *a2)
{
  for (unint64_t i = 0; i != 3; ++i)
  {
    float v5 = sub_227C8CA98(a1, i, 0) * *a2;
    *(float *)sub_227C8DD94((uint64_t)&v11, i) = v5;
    for (unint64_t j = 1; j != 3; ++j)
    {
      float v7 = sub_227C8CA98(a1, i, j);
      float v8 = sub_227C8C710((uint64_t)a2, j);
      float32x4_t v9 = (float *)sub_227C8DD94((uint64_t)&v11, i);
      *float32x4_t v9 = *v9 + (float)(v7 * v8);
    }
  }
  return v11;
}

void sub_227C971C0(float32x4_t *a1, float a2)
{
  float v4 = sub_227CA4DCC(a1[9].f32);
  uint64_t v5 = 0;
  float v6 = v4 * a2;
  float v8 = v7 * a2;
  float v10 = v9 * a2;
  float v16 = v6;
  float v17 = v8;
  float v18 = v10;
  float v11 = 0.0;
  do
  {
    float v11 = v11 + (float)(*(float *)((char *)&v16 + v5) * *(float *)((char *)&v16 + v5));
    v5 += 4;
  }
  while (v5 != 12);
  if (sqrtf(v11) > 0.00000011921)
  {
    float v16 = v6 * 0.01;
    float v17 = v8 * 0.01;
    float v18 = v10 * 0.01;
  }
  *(double *)v12.i64 = sub_227CA4FB4(&v15, &v16);
  float v13 = a1 + 10;
  sub_227CA4C0C((uint64_t)&v15, v13->f32, &v14, v12);
  if (v13 != &v14) {
    *float v13 = v14;
  }
}

void sub_227C97294(void *a1)
{
  *a1 = &unk_26DC29610;
  JUMPOUT(0x22A6850E0);
}

os_log_t sub_227C972C4()
{
  os_log_t result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_2681B9AA8 = (uint64_t)result;
  return result;
}

void sub_227C972F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 12))
  {
    BOOL v5 = sub_227C973A0(a1, a3);
    if (!v5 && *(_DWORD *)(a2 + 4) == *(unsigned __int16 *)(a2 + 2))
    {
      if (sub_227C97448(v5, (unsigned __int16 *)a2))
      {
        float v6 = (float *)sub_227C89D30((unsigned __int16 *)a2, 0xFFuLL);
        float v7 = sub_227CA4F74(v6, *(float *)a1, *(float *)(a1 + 4), *(float *)(a1 + 8));
        atan2f(v8, v7);
      }
    }
  }
}

BOOL sub_227C973A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (unsigned __int16 *)(a2 + 16);
  float v3 = 0.0;
  unint64_t v4 = 255;
  unint64_t v5 = 1;
  float v6 = 0.0;
  do
  {
    float v7 = *(float *)sub_227C8764C(v2, v4) * -9.8067;
    float v8 = v7 - v6;
    float v6 = v6 + (float)((float)(v7 - v6) / (float)v5);
    float v3 = v3 + (float)(v8 * (float)(v7 - v6));
    --v4;
    ++v5;
  }
  while (v4 != 155);
  return (float)(v3 / 99.0) < 0.18;
}

uint64_t sub_227C97448(uint64_t a1, unsigned __int16 *a2)
{
  if (!a2[1]) {
    return 1;
  }
  unint64_t v3 = 0;
  do
  {
    unint64_t v4 = (float *)sub_227C89D30(a2, v3);
    float v5 = sub_227CA4DCC(v4);
    float v7 = v6;
    float v8 = v5 * v5;
    float v10 = v9 * v9;
    float v11 = atan2f(sqrtf((float)(v9 * v9) + (float)(v6 * v6)), v5);
    float v12 = atan2f(sqrtf(v8 + v10), v7);
    BOOL v13 = v11 >= 1.309;
    if (v11 > 1.9199) {
      BOOL v13 = 0;
    }
    uint64_t result = v12 >= 1.5708 && v13;
    if ((result & 1) == 0) {
      break;
    }
    ++v3;
  }
  while (v3 < a2[1]);
  return result;
}

double sub_227C97528(uint64_t a1, long long *a2)
{
  if (!*(unsigned char *)(a1 + 12)
    || *(_DWORD *)(a1 + 24) != *((_DWORD *)a2 + 2)
    || (int v2 = *(_DWORD *)(a1 + 28), v2 != *((_DWORD *)a2 + 3)))
  {
    long long v3 = *a2;
    *(_OWORD *)(a1 + 16) = *a2;
    *(unsigned char *)(a1 + 12) = 1;
    int v2 = *(_DWORD *)(a1 + 28);
  }
  if (v2 == 1)
  {
    *(void *)&long long v3 = 0xBF80000000000000;
    *(void *)a1 = 0xBF80000000000000;
    *(_DWORD *)(a1 + 8) = 0;
  }
  return *(double *)&v3;
}

float sub_227C97580(float *a1, unsigned __int16 *a2)
{
  if (a2[1])
  {
    unint64_t v4 = 0;
    float v5 = 0.0;
    float v6 = 0.0;
    do
    {
      float v7 = (float *)sub_227C89D30(a2, v4);
      float v8 = sub_227CA4F74(v7, *a1, a1[1], a1[2]);
      float v10 = atan2f(v9, v8);
      __float2 v11 = __sincosf_stret(v10);
      float v5 = v5 + v11.__cosval;
      float v6 = v6 + v11.__sinval;
      ++v4;
      unint64_t v12 = a2[1];
    }
    while (v4 < v12);
    float v13 = (float)v12;
  }
  else
  {
    float v6 = 0.0;
    float v5 = 0.0;
    float v13 = 0.0;
  }
  return (float)((float)((float)(sqrtf(1.0 - (float)(sqrtf((float)(v6 * v6) + (float)(v5 * v5)) / v13)) * 57.296)
                       * 0.5228)
               + 14.06)
       * 0.017453;
}

double sub_227C9766C(uint64_t a1)
{
  *(unsigned char *)a1 = 0;
  *(unsigned char *)(a1 + 4) = 1;
  *(void *)(a1 + 20) = 0xA00000000;
  *(_DWORD *)(a1 + 16) = 1031798784;
  *(unsigned char *)(a1 + 72) = 1;
  *(void *)(a1 + 104) = 0xA00000000;
  *(void *)(a1 + 96) = 0x3FB0000000000000;
  *(unsigned char *)(a1 + 192) = 1;
  *(void *)(a1 + 196) = 0xA00000000;
  *(unsigned char *)(a1 + 195) = 1;
  *(_DWORD *)(a1 + 220) = 0;
  *(void *)&double result = 1036182680;
  *(void *)(a1 + 224) = 1036182680;
  *(unsigned char *)(a1 + 232) = 0;
  *(_DWORD *)(a1 + 236) = 0;
  return result;
}

double sub_227C976C4@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  double v2 = *(double *)(a1 + 8);
  *(void *)a2 = *(void *)a1;
  float v3 = v2;
  *(float *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 12) = 0;
  double result = -0.00781250572;
  *(void *)(a2 + 16) = 0xBF800000C47A0000;
  *(_WORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_227C976F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(unsigned __int16 *)(a1 + 20);
  uint64_t v8 = *(unsigned __int16 *)(a1 + 22);
  unint64_t v9 = *(unsigned int *)(a1 + 24);
  if (v7 + v8 >= v9) {
    uint64_t v10 = *(unsigned int *)(a1 + 24);
  }
  else {
    uint64_t v10 = 0;
  }
  float v6 = *(double *)(a2 + 8);
  *(float *)(a1 + 20 + 4 * (v7 + v8 - v10) + 8) = v6;
  if (v9 <= v8)
  {
    unint64_t v11 = v7 + 1;
    if (v11 < v9) {
      LOWORD(v9) = 0;
    }
    *(_WORD *)(a1 + 20) = v11 - v9;
  }
  else
  {
    *(_WORD *)(a1 + 22) = v8 + 1;
  }
  *(unsigned char *)(a1 + 4) = 1;
  sub_227C97CA4((unsigned __int16 *)(a1 + 104), (void *)a2);
  *(unsigned char *)(a1 + 72) = 1;
  uint64_t v12 = *(unsigned __int16 *)(a1 + 198);
  unint64_t v13 = *(unsigned int *)(a1 + 200);
  uint64_t v14 = a1 + 204;
  uint64_t v15 = *(unsigned __int16 *)(a1 + 196);
  if (v15 + v12 >= v13) {
    uint64_t v16 = *(unsigned int *)(a1 + 200);
  }
  else {
    uint64_t v16 = 0;
  }
  *(unsigned char *)(v14 + v15 + v12 - v16) = 0;
  if (v13 <= v12)
  {
    if (v15 + 1 < v13) {
      LOWORD(v13) = 0;
    }
    *(_WORD *)(a1 + 196) = v15 + 1 - v13;
  }
  else
  {
    *(_WORD *)(a1 + 198) = v12 + 1;
  }
  *(unsigned char *)(a1 + 192) = 1;
  float v17 = *(double *)(a2 + 8);
  float v30 = v17;
  uint64_t result = sub_227C97924(a1 + 220, &v30);
  LOWORD(v19) = *(_WORD *)(a1 + 22);
  double v20 = (double)v19;
  uint64_t v21 = *(unsigned __int16 *)(a1 + 106);
  double v22 = 0.0;
  if (*(_WORD *)(a1 + 106))
  {
    uint64_t result = sub_227C97CF8((unsigned __int16 *)(a1 + 104), v21 - 1);
    double v23 = *(double *)result;
    LODWORD(v21) = *(unsigned __int16 *)(a1 + 106);
    if (*(_WORD *)(a1 + 106))
    {
      uint64_t result = sub_227C97CF8((unsigned __int16 *)(a1 + 104), 0);
      double v22 = *(double *)result;
      LODWORD(v21) = *(unsigned __int16 *)(a1 + 106);
    }
  }
  else
  {
    double v23 = 0.0;
  }
  float v24 = v20 / fmax(v23 - v22, 0.100000001);
  *(float *)(a3 + 20) = v24;
  if (*(_DWORD *)(a1 + 108) == v21 && v24 >= 5.0)
  {
    sub_227C97974(a1, a3);
    uint64_t v25 = *(unsigned __int16 *)(a1 + 198);
    unint64_t v26 = *(unsigned int *)(a1 + 200);
    uint64_t v27 = *(unsigned __int16 *)(a1 + 196);
    if (v27 + v25 >= v26) {
      uint64_t v28 = *(unsigned int *)(a1 + 200);
    }
    else {
      uint64_t v28 = 0;
    }
    *(unsigned char *)(v14 + v27 + v25 - v28) = *(unsigned char *)(a3 + 24) ^ 1;
    if (v26 <= v25)
    {
      if (v27 + 1 < v26) {
        LOWORD(v26) = 0;
      }
      *(_WORD *)(a1 + 196) = v27 + 1 - v26;
    }
    else
    {
      *(_WORD *)(a1 + 198) = v25 + 1;
    }
    uint64_t result = 1;
    *(unsigned char *)(a1 + 192) = 1;
    if (!*(unsigned char *)a1) {
      uint64_t result = sub_227C97AB8((unsigned __int16 *)a1);
    }
    *(unsigned char *)a1 = result;
    if (*(unsigned char *)(a3 + 24)) {
      char v29 = 0;
    }
    else {
      char v29 = result;
    }
    *(unsigned char *)(a3 + 25) = v29;
  }
  return result;
}

uint64_t sub_227C97924(uint64_t result, float *a2)
{
  int v2 = *(_DWORD *)result;
  int v3 = *(_DWORD *)result + 1;
  *(_DWORD *)uint64_t result = v3;
  if (v2 > 2) {
    float v4 = *(float *)(result + 8) - (float)(*(float *)(result + 4) * (float)(*(float *)(result + 8) - *a2));
  }
  else {
    float v4 = (float)(1.0 / (float)v3) * (float)(*a2 + (float)(*(float *)(result + 8) * (float)v2));
  }
  *(float *)(result + 8) = v4;
  return result;
}

double *sub_227C97974(uint64_t a1, uint64_t a2)
{
  char v3 = 0;
  unint64_t v4 = 0;
  uint64_t v17 = *MEMORY[0x263EF8340];
  float v5 = (unsigned __int16 *)(a1 + 20);
  float v6 = (unsigned __int16 *)(a1 + 104);
  for (unint64_t i = 1; i != 10; ++i)
  {
    v16[i] = 1;
    float v8 = *(float *)sub_227C8764C(v5, i);
    float v9 = v8 - *(float *)sub_227C8764C(v5, v4);
    double v10 = *(double *)sub_227C97CF8(v6, i);
    uint64_t result = (double *)sub_227C97CF8(v6, v4);
    float v12 = v10 - *result;
    float v13 = v9 / v12;
    BOOL v14 = v12 <= 0.0;
    float v15 = 40.0;
    if (!v14) {
      float v15 = v13;
    }
    if (v15 < 4.0 && v9 < 0.4)
    {
      v16[i] = 0;
      unint64_t v4 = i;
      ++v3;
    }
  }
  *(unsigned char *)(a2 + 12) = v3;
  *(unsigned char *)(a2 + 24) = v16[9];
  return result;
}

BOOL sub_227C97AB8(unsigned __int16 *a1)
{
  unsigned __int8 v2 = 0;
  char v3 = a1 + 98;
  unint64_t v4 = a1 + 52;
  BOOL v5 = 1;
  unint64_t v6 = 9;
  for (unint64_t i = 1; i != 11; ++i)
  {
    v2 += *(unsigned char *)sub_227C97E40(v3, v6);
    if (v2 >= 5u)
    {
      double v8 = a1[53] ? *(double *)sub_227C97CF8(v4, a1[53] - 1) : 0.0;
      if (v8 - *(double *)sub_227C97CF8(v4, v6) < 1.0) {
        break;
      }
    }
    BOOL v5 = i < 0xA;
    --v6;
  }
  return v5;
}

uint64_t sub_227C97B90(uint64_t a1, unsigned int a2, float a3)
{
  if (a3 <= 0.01) {
    return 0;
  }
  if (a3 >= 25.0)
  {
    *(_DWORD *)(a1 + 236) = 0;
    goto LABEL_7;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 236) + 1;
  *(_DWORD *)(a1 + 236) = v3;
  if (v3 <= 2)
  {
LABEL_7:
    BOOL v4 = *(unsigned char *)(a1 + 232) != 0;
    goto LABEL_8;
  }
  BOOL v4 = 1;
LABEL_8:
  *(unsigned char *)(a1 + 232) = v4;
  int v6 = a3 < 25.0 || !v4;
  return v6 | a2;
}

float sub_227C97BF8(uint64_t a1, double a2)
{
  float v2 = a2 - *(float *)(a1 + 228);
  float v3 = -v2;
  if (v2 > 0.0) {
    float v3 = a2 - *(float *)(a1 + 228);
  }
  double v4 = 0.0;
  if (v3 > 0.2) {
    double v4 = (float)((float)((float)(v3 + -0.2) * v2) / v3);
  }
  return v4 / a2;
}

uint64_t sub_227C97C4C(double a1, float a2, uint64_t a3, int a4)
{
  BOOL v4 = a1 > 2.0;
  if (a2 <= 0.0) {
    a2 = -a2;
  }
  if (a2 > 2.0) {
    BOOL v4 = 1;
  }
  unsigned int v5 = v4 & (a4 ^ 1);
  if (a1 > 15.0) {
    return 1;
  }
  else {
    return v5;
  }
}

uint64_t sub_227C97C88(uint64_t result)
{
  *(_DWORD *)(result + 20) = 0;
  *(_DWORD *)(result + 104) = 0;
  *(_DWORD *)(result + 196) = 0;
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 232) = 0;
  *(_DWORD *)(result + 236) = 0;
  return result;
}

unsigned __int16 *sub_227C97CA4(unsigned __int16 *result, void *a2)
{
  uint64_t v2 = result[1];
  unint64_t v3 = *((unsigned int *)result + 1);
  uint64_t v4 = *result;
  if (v4 + v2 >= v3) {
    uint64_t v5 = *((unsigned int *)result + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  *(void *)&result[4 * (v4 + v2 - v5) + 4] = *a2;
  if (v3 <= v2)
  {
    if (v4 + 1 < v3) {
      LOWORD(v3) = 0;
    }
    *uint64_t result = v4 + 1 - v3;
  }
  else
  {
    result[1] = v2 + 1;
  }
  return result;
}

uint64_t sub_227C97CF8(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29650);
    }
    uint64_t v7 = qword_2681B9AA8;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  unint64_t v5 = *a1 + a2;
  if (v5 >= v4) {
    unint64_t v4 = v4;
  }
  else {
    unint64_t v4 = 0;
  }
  return (uint64_t)&a1[4 * (v5 - v4) + 4];
}

os_log_t sub_227C97E10()
{
  os_log_t result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_2681B9AA8 = (uint64_t)result;
  return result;
}

uint64_t sub_227C97E40(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29650);
    }
    uint64_t v7 = qword_2681B9AA8;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  unint64_t v5 = *a1 + a2;
  if (v5 >= v4) {
    unint64_t v4 = v4;
  }
  else {
    unint64_t v4 = 0;
  }
  return (uint64_t)a1 + v5 - v4 + 8;
}

double sub_227C97F58(unsigned __int16 *a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 3084;
  if (qword_2681B9A70 != -1) {
    dispatch_once(&qword_2681B9A70, &unk_26DC29670);
  }
  unint64_t v3 = qword_2681B9A78;
  if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[1517];
    if (a1[1517])
    {
      unint64_t v5 = v4 + a1[1516] - 1;
      unint64_t v6 = *((unsigned int *)a1 + 759);
      if (v5 < v6) {
        unint64_t v6 = 0;
      }
      uint64_t v7 = *(void *)&a1[4 * (v5 - v6) + 1520];
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v8 = a1[2173];
    if (a1[2173])
    {
      unint64_t v9 = v8 + a1[2172] - 1;
      unint64_t v10 = *((unsigned int *)a1 + 1087);
      if (v9 < v10) {
        unint64_t v10 = 0;
      }
      uint64_t v11 = *(void *)&a1[4 * (v9 - v10) + 2176];
    }
    else
    {
      uint64_t v11 = 0;
    }
    int v12 = v2[752];
    int v13 = v2[8];
    uint64_t v14 = a1[1];
    if (a1[1])
    {
      unint64_t v15 = v14 + *a1 - 1;
      unint64_t v16 = *((unsigned int *)a1 + 1);
      if (v15 < v16) {
        unint64_t v16 = 0;
      }
      uint64_t v17 = *(void *)&a1[4 * (v15 - v16) + 4];
    }
    else
    {
      uint64_t v17 = 0;
    }
    uint64_t v18 = *((void *)a1 + 861);
    v36[0] = 67111168;
    v36[1] = v12;
    __int16 v37 = 1024;
    int v38 = v13;
    __int16 v39 = 2048;
    uint64_t v40 = v7;
    __int16 v41 = 2048;
    uint64_t v42 = v4;
    __int16 v43 = 2048;
    uint64_t v44 = v11;
    __int16 v45 = 2048;
    uint64_t v46 = v8;
    __int16 v47 = 2048;
    uint64_t v48 = v17;
    __int16 v49 = 2048;
    uint64_t v50 = v14;
    __int16 v51 = 2048;
    uint64_t v52 = v18;
    _os_log_impl(&dword_227B19000, v3, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[reset] Reset CMABarrelRoll. Stats before reset: fBoolInitDuringNoTrust: %d, initializedDMYawAlignment:%d, last src timestamp %llu us, num src samples: %zu, last aux timestamp %llu us, num aux samples: %zu, last ring timestamp %llu us, num ring samples: %zu, fCurrentEstimateTimeMicroSeconds: %llu", (uint8_t *)v36, 0x54u);
  }
  sub_227C98304((uint64_t)a1);
  *((void *)a1 + 859) = 0;
  *((void *)a1 + 860) = 0x3F80000000000000;
  v2[752] = 0;
  *((_DWORD *)a1 + 758) = 0;
  *((_DWORD *)a1 + 860) = 0;
  unint64_t v19 = (void **)*((void *)a1 + 532);
  uint64_t v20 = *((void *)a1 + 533);
  *((void *)a1 + 536) = 0;
  unint64_t v21 = v20 - (void)v19;
  if (v21 >= 0x11)
  {
    do
    {
      operator delete(*v19);
      unint64_t v19 = (void **)(*((void *)a1 + 532) + 8);
      *((void *)a1 + 532) = v19;
      unint64_t v21 = *((void *)a1 + 533) - (void)v19;
    }
    while (v21 > 0x10);
  }
  if (v21 >> 3 == 1)
  {
    uint64_t v22 = 512;
  }
  else
  {
    if (v21 >> 3 != 2) {
      goto LABEL_27;
    }
    uint64_t v22 = 1024;
  }
  *((void *)a1 + 535) = v22;
LABEL_27:
  double v23 = (void **)*((void *)a1 + 538);
  uint64_t v24 = *((void *)a1 + 539);
  *((void *)a1 + 542) = 0;
  unint64_t v25 = v24 - (void)v23;
  if (v25 >= 0x11)
  {
    do
    {
      operator delete(*v23);
      double v23 = (void **)(*((void *)a1 + 538) + 8);
      *((void *)a1 + 538) = v23;
      unint64_t v25 = *((void *)a1 + 539) - (void)v23;
    }
    while (v25 > 0x10);
  }
  if (v25 >> 3 == 1)
  {
    uint64_t v26 = 512;
  }
  else
  {
    if (v25 >> 3 != 2) {
      goto LABEL_34;
    }
    uint64_t v26 = 1024;
  }
  *((void *)a1 + 541) = v26;
LABEL_34:
  *((_DWORD *)a1 + 1086) = 0;
  *((_DWORD *)a1 + 1188) = 0;
  uint64_t v27 = (void **)*((void *)a1 + 696);
  uint64_t v28 = *((void *)a1 + 697);
  *((void *)a1 + 700) = 0;
  unint64_t v29 = v28 - (void)v27;
  if (v29 >= 0x11)
  {
    do
    {
      operator delete(*v27);
      uint64_t v27 = (void **)(*((void *)a1 + 696) + 8);
      *((void *)a1 + 696) = v27;
      unint64_t v29 = *((void *)a1 + 697) - (void)v27;
    }
    while (v29 > 0x10);
  }
  if (v29 >> 3 == 1)
  {
    uint64_t v30 = 512;
  }
  else
  {
    if (v29 >> 3 != 2) {
      goto LABEL_41;
    }
    uint64_t v30 = 1024;
  }
  *((void *)a1 + 699) = v30;
LABEL_41:
  float v31 = (void **)*((void *)a1 + 702);
  uint64_t v32 = *((void *)a1 + 703);
  *((void *)a1 + 706) = 0;
  unint64_t v33 = v32 - (void)v31;
  if (v33 >= 0x11)
  {
    do
    {
      operator delete(*v31);
      float v31 = (void **)(*((void *)a1 + 702) + 8);
      *((void *)a1 + 702) = v31;
      unint64_t v33 = *((void *)a1 + 703) - (void)v31;
    }
    while (v33 > 0x10);
  }
  if (v33 >> 3 == 1)
  {
    uint64_t v34 = 512;
    goto LABEL_47;
  }
  if (v33 >> 3 == 2)
  {
    uint64_t v34 = 1024;
LABEL_47:
    *((void *)a1 + 705) = v34;
  }
  *((_DWORD *)a1 + 1414) = 0;
  double result = 0.0;
  *((_OWORD *)a1 + 384) = 0u;
  *((void *)a1 + 770) = 0x3F80000000000000;
  *uint64_t v2 = 1;
  v2[753] = 0;
  *(void *)(a1 + 3462) = 0;
  *(void *)(a1 + 3466) = 0x3F80000000000000;
  return result;
}

double sub_227C98304(uint64_t a1)
{
  uint64_t v2 = a1 + 6952;
  *(_DWORD *)a1 = 0;
  *(_DWORD *)(a1 + 968) = 0;
  *(_DWORD *)(a1 + 1936) = 0;
  *(_DWORD *)(a1 + 2904) = 0;
  sub_227CA0F14((unsigned __int8 *)(a1 + 6176));
  *(void *)(a1 + 6792) = 0;
  sub_227C8AC98(a1 + 6704);
  *(void *)(a1 + 6776) = 0;
  *(void *)(a1 + 6784) = 0x3F80000000000000;
  sub_227C8AC98(a1 + 6800);
  *(void *)(a1 + 6944) = 0;
  *(unsigned char *)uint64_t v2 = 0;
  *(void *)(a1 + 6960) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 6888) = 0u;
  *(void *)(a1 + 6904) = 0x3F80000000000000;
  *(void *)(a1 + 6912) = 0;
  *(_DWORD *)(a1 + 6976) = 0;
  *(_DWORD *)(a1 + 7944) = 0;
  *(_DWORD *)(a1 + 9872) = 0;
  *(_WORD *)(v2 + 2924) = 0;
  *(_DWORD *)(a1 + 6968) = 0;
  return result;
}

void sub_227C983AC(uint64_t a1, uint64_t a2)
{
  sub_227C98444((void *)(a1 + 6672), a2);
  if (qword_2681B9A70 != -1) {
    dispatch_once(&qword_2681B9A70, &unk_26DC29670);
  }
  uint64_t v2 = qword_2681B9A78;
  if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_227B19000, v2, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[registerCorrectedUpdateCallbackFn] Registered corrected update callback.", v3, 2u);
  }
}

void *sub_227C98444(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  sub_227C9D584((uint64_t)v4, a2);
  sub_227C9D61C(v4, a1);
  sub_227C92120(v4);
  return a1;
}

BOOL sub_227C984B8(unsigned __int16 *a1, unint64_t a2, int a3, int a4, float a5, float a6)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  if (!a1[1]) {
    goto LABEL_5;
  }
  int v12 = a1 + 4;
  unint64_t v13 = a1[1] + (unint64_t)*a1 - 1;
  unint64_t v14 = *((unsigned int *)a1 + 1);
  if (v13 < v14) {
    unint64_t v14 = 0;
  }
  if (*(void *)&v12[4 * (v13 - v14)] >= a2)
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29670);
    }
    uint64_t v27 = qword_2681B9A78;
    BOOL result = os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR);
    if (result)
    {
      unint64_t v29 = *a1 + (unint64_t)a1[1] - 1;
      unint64_t v30 = *((unsigned int *)a1 + 1);
      if (v29 < v30) {
        unint64_t v30 = 0;
      }
      uint64_t v31 = *(void *)&v12[4 * (v29 - v30)];
      *(float *)buf = 3.8521e-34;
      *(void *)uint64_t v53 = a2;
      *(_WORD *)&v53[8] = 2048;
      *(void *)&v53[10] = v31;
      _os_log_impl(&dword_227B19000, v27, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[feedRingSensor] Ring sensor timestamp must be greater than the last value. Input: %llu us, last: %llu us", buf, 0x16u);
      return 0;
    }
  }
  else
  {
LABEL_5:
    unint64_t v15 = a1 + 3088;
    if (!*((unsigned char *)a1 + 6176) && !*((void *)a1 + 868))
    {
      *((void *)a1 + 868) = a2;
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29670);
      }
      unint64_t v16 = qword_2681B9A78;
      if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *((void *)a1 + 868);
        *(float *)buf = 3.852e-34;
        *(void *)uint64_t v53 = v17;
        _os_log_impl(&dword_227B19000, v16, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedRingSensor] Received initial ring sensor timestamp : %llu", buf, 0xCu);
      }
    }
    sub_227C92464((uint64_t)v51, (void *)a1 + 695);
    double v18 = sub_227C905CC(v51);
    float v19 = *(float *)&v18;
    sub_227C923BC(v51);
    sub_227C92464((uint64_t)v50, (void *)a1 + 701);
    double v20 = sub_227C905CC(v50);
    float v21 = *(float *)&v20;
    sub_227C923BC(v50);
    sub_227C92464((uint64_t)v49, (void *)a1 + 531);
    double v22 = sub_227C905CC(v49);
    float v23 = *(float *)&v22;
    sub_227C923BC(v49);
    sub_227C92464((uint64_t)v48, (void *)a1 + 537);
    double v24 = sub_227C905CC(v48);
    float v25 = *(float *)&v24;
    sub_227C923BC(v48);
    if (*v15 || a3)
    {
      *((unsigned char *)a1 + 6952) = 0;
    }
    else
    {
      BOOL v26 = 0;
      if (v19 < 6.2832 && v21 < 0.5 && v23 < 0.5236 && v25 < 0.25) {
        BOOL v26 = *((void *)a1 + 700) >= 2uLL && *((void *)a1 + 536) > 1uLL;
      }
      unsigned int v32 = a2 - *((_DWORD *)a1 + 1736);
      int v33 = !v26;
      if (v32 < 0x7A121) {
        int v34 = v33;
      }
      else {
        int v34 = 0;
      }
      if (*((unsigned __int8 *)a1 + 6952) != v34)
      {
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC29670);
        }
        uint64_t v35 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
        {
          int v36 = *((unsigned __int8 *)a1 + 6952);
          *(float *)buf = 1.5285e-36;
          *(_DWORD *)uint64_t v53 = v36;
          *(_WORD *)&v53[4] = 2050;
          *(void *)&v53[6] = a2;
          *(_WORD *)&v53[14] = 2050;
          *(double *)&v53[16] = (float)(v19 * 57.296);
          __int16 v54 = 2050;
          double v55 = v21;
          __int16 v56 = 2050;
          double v57 = (float)(v23 * 57.296);
          __int16 v58 = 2050;
          double v59 = v25;
          __int16 v60 = 1026;
          unsigned int v61 = v32;
          _os_log_impl(&dword_227B19000, v35, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedRingSensor] Setting fBlockInitializationDueToHighDynamicMotion to %{public}d, timestamp: %{public}llu us, avgOmegaAuxNorm: %{public}.3f dps, avgUserAccelAuxNorm: %{public}.3f g, avgOmegaSrcNorm: %{public}.3f dps, avgUserAccelSrcNorm: %{public}.3f g, timeElapsedMicroSeconds: %{public}u", buf, 0x40u);
        }
        *((unsigned char *)a1 + 6952) = v34;
      }
    }
    if (*((unsigned char *)a1 + 6920) && *((unsigned char *)a1 + 6472))
    {
      sub_227C98304((uint64_t)a1);
      *((unsigned char *)a1 + 6920) = 0;
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29670);
      }
      __int16 v37 = qword_2681B9A78;
      if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
      {
        *(float *)buf = 3.852e-34;
        *(void *)uint64_t v53 = a2;
        _os_log_impl(&dword_227B19000, v37, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedRingSensor] Received ring sensor trust state=True after initializing during no-trust, reinitializing. Ring sensor timestamp: %llu", buf, 0xCu);
      }
    }
    if ((a3 & a4) != 0) {
      float v38 = 4.0;
    }
    else {
      float v38 = 32.0;
    }
    uint64_t v39 = a1[1];
    unint64_t v40 = *((unsigned int *)a1 + 1);
    uint64_t v41 = *a1;
    if (v41 + v39 >= v40) {
      uint64_t v42 = *((unsigned int *)a1 + 1);
    }
    else {
      uint64_t v42 = 0;
    }
    *(void *)&a1[4 * (v41 + v39 - v42) + 4] = a2;
    if (v40 <= v39)
    {
      if (v41 + 1 < v40) {
        LOWORD(v40) = 0;
      }
      *a1 = v41 + 1 - v40;
    }
    else
    {
      a1[1] = v39 + 1;
    }
    *(float *)buf = a5;
    *(float *)uint64_t v53 = a6;
    sub_227C98AF0(a1 + 484, buf);
    *(float *)buf = v38 * sub_227C98B50((uint64_t)a1);
    *(float *)uint64_t v53 = v38 * v43;
    sub_227C98AF0(a1 + 968, buf);
    uint64_t v44 = a1[1453];
    unint64_t v45 = *((unsigned int *)a1 + 727);
    uint64_t v46 = a1[1452];
    if (v46 + v44 >= v45) {
      uint64_t v47 = *((unsigned int *)a1 + 727);
    }
    else {
      uint64_t v47 = 0;
    }
    *((unsigned char *)a1 + v46 + v44 - v47 + 2912) = a4;
    if (v45 <= v44)
    {
      if (v46 + 1 < v45) {
        LOWORD(v45) = 0;
      }
      a1[1452] = v46 + 1 - v45;
    }
    else
    {
      a1[1453] = v44 + 1;
    }
    if (!*v15) {
      sub_227C98C70(a1);
    }
    sub_227C99068(a1);
    *((unsigned char *)a1 + 6968) = a3;
    return 1;
  }
  return result;
}

void sub_227C98A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unsigned __int16 *sub_227C98A9C(unsigned __int16 *result, void *a2)
{
  uint64_t v2 = result[1];
  unint64_t v3 = *((unsigned int *)result + 1);
  uint64_t v4 = *result;
  if (v4 + v2 >= v3) {
    uint64_t v5 = *((unsigned int *)result + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  *(void *)&result[4 * (v4 + v2 - v5) + 4] = *a2;
  if (v3 <= v2)
  {
    if (v4 + 1 < v3) {
      LOWORD(v3) = 0;
    }
    *BOOL result = v4 + 1 - v3;
  }
  else
  {
    result[1] = v2 + 1;
  }
  return result;
}

unsigned __int16 *sub_227C98AF0(unsigned __int16 *result, void *a2)
{
  unint64_t v2 = *((unsigned int *)result + 1);
  unint64_t v3 = *result + (unint64_t)result[1];
  if (v3 < v2) {
    unint64_t v2 = 0;
  }
  *(void *)&result[4 * (v3 - v2) + 4] = *a2;
  unsigned int v4 = result[1];
  unint64_t v5 = *((unsigned int *)result + 1);
  if (v5 <= v4)
  {
    unint64_t v6 = *result + 1;
    if (v6 < v5) {
      LOWORD(v5) = 0;
    }
    *BOOL result = v6 - v5;
  }
  else
  {
    result[1] = v4 + 1;
  }
  return result;
}

float sub_227C98B50(uint64_t a1)
{
  if (*(void *)(a1 + 5600) == 16)
  {
    sub_227C92464((uint64_t)v2, (void *)(a1 + 5560));
    sub_227C905CC(v2);
    sub_227C923BC(v2);
  }
  return 0.0027416;
}

void sub_227C98C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_227C98C70(unsigned __int16 *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v2 = (unsigned __int8 *)(a1 + 3088);
  if (*((unsigned char *)a1 + 6176) || !*((unsigned char *)a1 + 6952))
  {
    if (a1[1])
    {
      if (*((void *)a1 + 700))
      {
        sub_227C92464((uint64_t)v25, (void *)a1 + 695);
        double v3 = sub_227C905CC(v25);
        BOOL v4 = *(float *)&v3 > 2.0944;
        sub_227C923BC(v25);
      }
      else
      {
        BOOL v4 = 0;
      }
      if (*((void *)a1 + 536))
      {
        sub_227C92464((uint64_t)v24, (void *)a1 + 531);
        double v5 = sub_227C905CC(v24);
        BOOL v6 = *(float *)&v5 > 0.5236;
        sub_227C923BC(v24);
      }
      else
      {
        BOOL v6 = 0;
      }
      if (!*v2 || !v4 && !v6)
      {
        sub_227C9B2C4((uint64_t)a1, v21);
        int v7 = *v2;
        sub_227CA0134(v2, a1, a1 + 484, a1 + 968, a1 + 1720, a1 + 2376, a1 + 1452, (uint64_t)(a1 + 2828), (uint64_t)v21, v22, __p);
        int v8 = *v2;
        if ((v7 != 0) != (*v2 != 0))
        {
          if (qword_2681B9A70 != -1) {
            dispatch_once(&qword_2681B9A70, &unk_26DC29670);
          }
          unint64_t v9 = qword_2681B9A78;
          if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v10 = *a1 + (unint64_t)a1[1] - 1;
            unint64_t v11 = *((unsigned int *)a1 + 1);
            if (v10 < v11) {
              unint64_t v11 = 0;
            }
            uint64_t v12 = *(void *)&a1[4 * (v10 - v11) + 4];
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)uint64_t v27 = v7;
            *(_WORD *)&v27[4] = 1024;
            *(_DWORD *)&v27[6] = v8;
            __int16 v28 = 2048;
            uint64_t v29 = v12;
            _os_log_impl(&dword_227B19000, v9, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[updateDMInertialYaw] DM yaw alignment state changed from: %d to %d, latest ring sensor timestamp: %llu", buf, 0x18u);
          }
          if (v8)
          {
            if (qword_2681B9A70 != -1) {
              dispatch_once(&qword_2681B9A70, &unk_26DC29670);
            }
            unint64_t v13 = qword_2681B9A78;
            if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v14 = *a1 + (unint64_t)a1[1] - 1;
              unint64_t v15 = *((unsigned int *)a1 + 1);
              if (v14 < v15) {
                unint64_t v15 = 0;
              }
              uint64_t v16 = *(void *)&a1[4 * (v14 - v15) + 4];
              *(_DWORD *)buf = 134217984;
              *(void *)uint64_t v27 = v16;
              _os_log_impl(&dword_227B19000, v13, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[updateDMInertialYaw] Initialized DM yaw alignment state, latest ring sensor timestamp: %llu", buf, 0xCu);
            }
            if (!(v2[744] | v2[296]))
            {
              v2[744] = 1;
              if (qword_2681B9A70 != -1) {
                dispatch_once(&qword_2681B9A70, &unk_26DC29670);
              }
              uint64_t v17 = qword_2681B9A78;
              if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
              {
                unint64_t v18 = *a1 + (unint64_t)a1[1] - 1;
                unint64_t v19 = *((unsigned int *)a1 + 1);
                if (v18 < v19) {
                  unint64_t v19 = 0;
                }
                uint64_t v20 = *(void *)&a1[4 * (v18 - v19) + 4];
                *(_DWORD *)buf = 134217984;
                *(void *)uint64_t v27 = v20;
                _os_log_impl(&dword_227B19000, v17, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedRingSensor] Setting fBoolInitDuringNoTrust=True, latest ring sensor timestamp: %llu", buf, 0xCu);
              }
            }
          }
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (v22[0])
        {
          v22[1] = v22[0];
          operator delete(v22[0]);
        }
        if (v21[0])
        {
          v21[1] = v21[0];
          operator delete(v21[0]);
        }
      }
    }
  }
}

void sub_227C99030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_227C9BF0C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_227C99068(unsigned __int16 *a1)
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a1 + 6176))
  {
    if (a1[1517] >= 3u)
    {
      uint64_t v105 = (uint64_t)(a1 + 3088);
      unint64_t v123 = 0;
      if (sub_227C9CE98(a1, v124, &v123, (float *)&v121))
      {
        unint64_t v2 = a1 + 2176;
        unint64_t v3 = a1[1517] - 1;
        do
        {
          unint64_t v4 = v3;
          if (!v3) {
            break;
          }
          unint64_t v5 = *(void *)sub_227C9B9E4(a1 + 1516, v3);
          unint64_t v6 = a1[2172] + (unint64_t)a1[2173] - 1;
          unint64_t v7 = *((unsigned int *)a1 + 1087);
          if (v6 < v7) {
            unint64_t v7 = 0;
          }
          unint64_t v8 = *(void *)&v2[4 * (v6 - v7)];
          unint64_t v3 = v4 - 1;
        }
        while (v5 > v8);
        uint64_t v9 = *(void *)sub_227C9B9E4(a1 + 1516, v4);
        unint64_t v10 = a1[2172] + (unint64_t)a1[2173] - 1;
        unint64_t v11 = *((unsigned int *)a1 + 1087);
        if (v10 < v11) {
          unint64_t v11 = 0;
        }
        if (v9 != *(void *)&v2[4 * (v10 - v11)])
        {
          if (qword_2681B9A70 != -1) {
            dispatch_once(&qword_2681B9A70, &unk_26DC29670);
          }
          uint64_t v12 = qword_2681B9A78;
          if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
          {
            unint64_t v13 = a1[2172] + (unint64_t)a1[2173] - 1;
            unint64_t v14 = *((unsigned int *)a1 + 1087);
            if (v13 < v14) {
              unint64_t v14 = 0;
            }
            uint64_t v15 = *(void *)&v2[4 * (v13 - v14)];
            uint64_t v16 = *(void *)sub_227C9B9E4(a1 + 1516, v4);
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v15;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v16;
            _os_log_impl(&dword_227B19000, v12, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[updateCurrentEstimate] Timestamp mismatch error. Latest aux timestamp: %llu us, corresponding src timestamp: %llu us", buf, 0x16u);
          }
        }
        uint64_t v17 = (float32x2_t *)sub_227C89D30(a1 + 1720, v4);
        sub_227CA4C6C(v17, &v120, v18);
        unint64_t v19 = a1[2376] + (unint64_t)a1[2377] - 1;
        unint64_t v20 = *((unsigned int *)a1 + 1189);
        if (v19 < v20) {
          unint64_t v20 = 0;
        }
        long long v119 = *(_OWORD *)&a1[8 * (v19 - v20) + 2380];
        float32x4_t v21 = sub_227CA1258(v105, &v118);
        *(double *)v22.i64 = sub_227CA4C0C((uint64_t)&v119, v118.f32, &v116, v21);
        *(double *)v23.i64 = sub_227CA4C0C((uint64_t)&v116, v120.f32, (float32x4_t *)buf, v22);
        sub_227CA4C6C((float32x2_t *)buf, &v117, v23);
        uint64_t v24 = *(void *)sub_227C9B9E4(a1 + 1516, v4);
        double v106 = (float32x2_t *)(a1 + 3400);
        sub_227C8AC98((uint64_t)(a1 + 3400));
        sub_227C9BF60((uint64_t)a1);
        sub_227C8A958((uint64_t)(a1 + 3400), a1 + 3354, v24, 0.017453, 0.05236);
        v116.i64[0] = 0;
        v116.i64[1] = 0x3F80000000000000;
        v115.i64[0] = 0;
        v115.i64[1] = 0x3F80000000000000;
        if (a1[1517] && a1[2173])
        {
          unint64_t v25 = a1[1517] + (unint64_t)a1[1516] - 1;
          unint64_t v26 = *((unsigned int *)a1 + 759);
          if (v25 < v26) {
            unint64_t v26 = 0;
          }
          int v27 = *(_DWORD *)&a1[4 * (v25 - v26) + 1520];
          int v28 = *((_DWORD *)a1 + 1736);
          if (*((void *)a1 + 700) < 5uLL)
          {
            BOOL v30 = 1;
          }
          else
          {
            sub_227C92464((uint64_t)v112, (void *)a1 + 695);
            double v29 = sub_227C905CC(v112);
            BOOL v30 = *(float *)&v29 >= 0.087266;
            sub_227C923BC(v112);
          }
          if (*((void *)a1 + 536) < 5uLL)
          {
            BOOL v32 = 1;
          }
          else
          {
            sub_227C92464((uint64_t)v111, (void *)a1 + 531);
            double v31 = sub_227C905CC(v111);
            BOOL v32 = *(float *)&v31 >= 0.087266;
            sub_227C923BC(v111);
          }
          unint64_t v33 = v4 + 1;
          uint64_t v34 = *((void *)a1 + 700);
          if (v34) {
            float v35 = *(float *)(*(void *)(*((void *)a1 + 696)
          }
                                       + (((unint64_t)(v34 + *((void *)a1 + 699) - 1) >> 7) & 0x1FFFFFFFFFFFFF8))
                           + 4 * ((v34 + *((void *)a1 + 699) - 1) & 0x3FF));
          else {
            float v35 = 0.0;
          }
          float v103 = v35;
          if (v33 >= a1[1517])
          {
            unint64_t v48 = 0;
          }
          else
          {
            unint64_t v36 = 0;
            char v37 = (v27 - v28) > 0x4C4B3F || v30;
            char v104 = v37 | v32;
            __asm { FMOV            V2.2S, #0.75 }
            float32x2_t v43 = vmul_f32(v121, _D2);
            float v44 = v122 * 0.75;
            do
            {
              unint64_t v45 = (float32x2_t *)sub_227C89D30(a1 + 1720, v33);
              sub_227CA4C6C(v45, (float32x4_t *)buf, v46);
              float32x4_t v120 = *(float32x4_t *)buf;
              unint64_t v47 = 0;
              unint64_t v48 = *(void *)sub_227C9B9E4(a1 + 1516, v33);
              float32x2_t v109 = v43;
              float v110 = v44;
              do
              {
                float v49 = *(float *)sub_227C8DD94((uint64_t)&v109, v47);
                uint64_t v50 = (float *)sub_227C8DD94((uint64_t)&v109, v47);
                if (v49 <= 2.0944)
                {
                  if (*v50 < -2.0944) {
                    *(_DWORD *)sub_227C8DD94((uint64_t)&v109, v47) = -1073345902;
                  }
                }
                else
                {
                  *uint64_t v50 = 2.0944;
                }
                ++v47;
              }
              while (v47 != 3);
              unint64_t v51 = a1[2172] + (unint64_t)a1[2173] - 1;
              unint64_t v52 = *((unsigned int *)a1 + 1087);
              if (v51 < v52) {
                unint64_t v52 = 0;
              }
              float v53 = (float)(v48 - *(void *)&v2[4 * (v51 - v52)]) * 0.000001;
              *(float32x2_t *)v107.f32 = vmul_n_f32(v109, v53);
              v107.f32[2] = v110 * v53;
              *(double *)v54.i64 = sub_227CA4FB4(&v108, v107.f32);
              unint64_t v55 = a1[2376] + (unint64_t)a1[2377] - 1;
              unint64_t v56 = *((unsigned int *)a1 + 1189);
              if (v55 < v56) {
                unint64_t v56 = 0;
              }
              sub_227CA4C0C((uint64_t)&v108, (float *)&a1[8 * (v55 - v56) + 2380], (float32x4_t *)buf, v54);
              long long v119 = *(_OWORD *)buf;
              *(double *)v57.i64 = sub_227CA4C0C((uint64_t)&v119, v118.f32, &v107, *(float32x4_t *)buf);
              *(double *)v58.i64 = sub_227CA4C0C((uint64_t)&v107, v120.f32, &v108, v57);
              sub_227CA4C6C((float32x2_t *)&v108, (float32x4_t *)buf, v58);
              float32x4_t v116 = *(float32x4_t *)buf;
              *(double *)v59.i64 = sub_227CA4C6C((float32x2_t *)&v117, &v108, *(float32x4_t *)buf);
              sub_227CA4C0C((uint64_t)&v116, v108.f32, (float32x4_t *)buf, v59);
              float32x4_t v115 = *(float32x4_t *)buf;
              float v60 = (float)(v48 - v24) * 0.000001;
              if (v60 >= 0.0000001)
              {
                v113.f32[0] = sub_227CA50D0(&v115) / v60;
                v113.f32[1] = v61 / v60;
                float v114 = v62 / v60;
                if ((v104 & 1) == 0)
                {
                  float v114 = 0.0;
                  float32x2_t v113 = 0;
                }
                sub_227C8ACBC(v106, &v113, v48);
                float32x4_t v117 = v116;
                unint64_t v63 = a1[1];
                while (v36 < v63)
                {
                  uint64_t v64 = (void *)sub_227C9B9E4(a1, v36);
                  unint64_t v63 = a1[1];
                  if (v48 == *v64) {
                    break;
                  }
                  ++v36;
                }
                if (v36 != v63 && *(void *)sub_227C9B9E4(a1, v36) == v48)
                {
                  uint32_t v65 = (float *)sub_227C9B9E4(a1 + 484, v36);
                  if (*v65 > 0.17453)
                  {
                    uint64_t v67 = v65;
                    v66.f32[0] = *v65;
                    sub_227CA4C6C((float32x2_t *)(a1 + 3354), (float32x4_t *)buf, v66);
                    sub_227C8E390((float *)buf);
                    float v69 = fmodf((float)(v68 - v67[1]) + 3.1416, 6.2832);
                    if (v69 < 0.0) {
                      float v69 = v69 + 6.2832;
                    }
                    float v70 = fabsf(v69 + -3.1416);
                    if (*(unsigned char *)(v105 + 296) || v70 > 0.7854)
                    {
                      float v71 = v70 <= 0.7854 ? 1.0 : 0.1;
                      float v72 = (float *)sub_227C9B9E4(a1 + 968, v36);
                      uint64_t v73 = 0;
                      float v74 = 0.0;
                      do
                      {
                        float v74 = v74 + (float)(v113.f32[v73] * v113.f32[v73]);
                        ++v73;
                      }
                      while (v73 != 3);
                      if (sqrtf(v74) < 0.87266 && v103 < 0.87266)
                      {
                        uint64_t v75 = 0;
                        float v76 = v71 * v72[1];
                        float v77 = 0.0;
                        do
                        {
                          float v77 = v77 + (float)(v113.f32[v75] * v113.f32[v75]);
                          ++v75;
                        }
                        while (v75 != 3);
                        float v78 = sqrtf(v77);
                        BOOL v79 = v103 <= 0.5236 && v78 <= 0.5236;
                        float v80 = 1.0;
                        if (!v79) {
                          float v80 = 9.0;
                        }
                        *(float *)buf = (float)(v71 * *v72) * v80;
                        *(float *)&uint8_t buf[4] = v76 * v80;
                        sub_227C8B7DC((uint64_t)v106, v67, (uint64_t)buf, v48);
                      }
                    }
                  }
                }
                ++v33;
                uint64_t v24 = v48;
              }
            }
            while (v33 < a1[1517]);
          }
          unint64_t v81 = *a1 + (unint64_t)a1[1] - 1;
          unint64_t v82 = *((unsigned int *)a1 + 1);
          if (v81 < v82) {
            unint64_t v82 = 0;
          }
          unint64_t v83 = *(void *)&a1[4 * (v81 - v82) + 4];
          if (v83 > v48 && (v83 - v48) >> 5 <= 0xC34)
          {
            sub_227C8ACBC(v106, &v113, v83);
            if (*(unsigned char *)(v105 + 296))
            {
              unint64_t v84 = a1[484] + (unint64_t)a1[485] - 1;
              unint64_t v85 = *((unsigned int *)a1 + 243);
              if (v84 < v85) {
                unint64_t v85 = 0;
              }
              uint64_t v86 = (uint64_t)&a1[4 * (v84 - v85) + 484];
              float v88 = *(float *)(v86 + 8);
              float v87 = (float *)(v86 + 8);
              if (v88 > 0.17453)
              {
                uint64_t v89 = 0;
                unint64_t v90 = a1[968] + (unint64_t)a1[969] - 1;
                unint64_t v91 = *((unsigned int *)a1 + 485);
                if (v90 < v91) {
                  unint64_t v91 = 0;
                }
                float v92 = 0.0;
                do
                {
                  float v92 = v92 + (float)(v113.f32[v89] * v113.f32[v89]);
                  ++v89;
                }
                while (v89 != 3);
                if (sqrtf(v92) < 0.87266 && v103 < 0.87266)
                {
                  uint64_t v93 = 0;
                  float v94 = 0.0;
                  do
                  {
                    float v94 = v94 + (float)(v113.f32[v93] * v113.f32[v93]);
                    ++v93;
                  }
                  while (v93 != 3);
                  float v95 = sqrtf(v94);
                  BOOL v96 = v103 <= 0.5236 && v95 <= 0.5236;
                  float v97 = 1.0;
                  if (!v96) {
                    float v97 = 9.0;
                  }
                  *(float32x2_t *)buf = vmul_n_f32(*(float32x2_t *)&a1[4 * (v90 - v91) + 972], v97);
                  sub_227C8B7DC((uint64_t)v106, v87, (uint64_t)buf, v83);
                }
              }
            }
            unint64_t v48 = v83;
          }
          *((void *)a1 + 861) = v48;
          *(_OWORD *)(a1 + 3436) = *(_OWORD *)(a1 + 3402);
          sub_227C98A9C(a1 + 3488, (void *)a1 + 861);
          sub_227C88228(a1 + 3972, a1 + 3436);
          if (!*(unsigned char *)(v105 + 745))
          {
            sub_227CA4C6C((float32x2_t *)a1 + 859, (float32x4_t *)buf, v98);
            sub_227C8E390((float *)buf);
            float v100 = v99;
            v108.i32[0] = 0;
            v108.f32[1] = -v99;
            v108.i32[2] = 0;
            sub_227CA4FB4((float32x4_t *)buf, v108.f32);
            if (a1 + 3462 != (unsigned __int16 *)buf) {
              *(_OWORD *)(a1 + 3462) = *(_OWORD *)buf;
            }
            *(unsigned char *)(v105 + 745) = 1;
            if (qword_2681B9A70 != -1) {
              dispatch_once(&qword_2681B9A70, &unk_26DC29670);
            }
            int64_t v101 = qword_2681B9A78;
            if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v102 = *((void *)a1 + 861);
              *(_DWORD *)buf = 134218240;
              *(double *)&uint8_t buf[4] = (float)(v100 * 57.296);
              *(_WORD *)&unsigned char buf[12] = 2048;
              *(void *)&buf[14] = v102;
              _os_log_impl(&dword_227B19000, v101, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[updateCurrentEstimate] Initial roll angle recorded: %.1f deg, timestamp: %llu us", buf, 0x16u);
            }
          }
        }
      }
    }
  }
}

void sub_227C99B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
}

void sub_227C99BB0(uint64_t a1, unint64_t a2, float32x4_t *a3, float a4, float a5)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  float v32 = a5;
  float v33 = a4;
  if (!*(_WORD *)(a1 + 4346)) {
    goto LABEL_45;
  }
  uint64_t v8 = a1 + 4352;
  unint64_t v9 = *(unsigned __int16 *)(a1 + 4346) + (unint64_t)*(unsigned __int16 *)(a1 + 4344) - 1;
  unint64_t v10 = *(unsigned int *)(a1 + 4348);
  if (v9 < v10) {
    unint64_t v10 = 0;
  }
  if (*(void *)(v8 + 8 * (v9 - v10)) >= a2)
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29670);
    }
    unint64_t v11 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
    {
      unint64_t v12 = *(unsigned __int16 *)(a1 + 4344) + (unint64_t)*(unsigned __int16 *)(a1 + 4346) - 1;
      unint64_t v13 = *(unsigned int *)(a1 + 4348);
      if (v12 < v13) {
        unint64_t v13 = 0;
      }
      uint64_t v14 = *(void *)(v8 + 8 * (v12 - v13));
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = a2;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_227B19000, v11, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[feedAuxDM] AuxDM timestamp must be greater than the last value. Input: %llu us, last: %llu us", buf, 0x16u);
    }
  }
  else
  {
LABEL_45:
    if (*(unsigned char *)(a1 + 6168))
    {
      *(void *)(a1 + 6144) = a2;
      sub_227CA4C8C(a3, (float32x4_t *)buf);
      if ((unsigned char *)(a1 + 6152) != buf) {
        *(_OWORD *)(a1 + 6152) = *(_OWORD *)buf;
      }
      *(unsigned char *)(a1 + 6168) = 0;
    }
    else
    {
      unint64_t v15 = *(void *)(a1 + 6144);
      if (v15 + 1000000 >= a2)
      {
        sub_227C99F94((unsigned __int16 *)(a1 + 3032), v15, a2, (char **)buf);
        uint64_t v17 = *(unint64_t **)buf;
        for (unint64_t i = *(unint64_t **)&buf[8]; v17 != i; ++v17)
        {
          unint64_t v19 = *v17;
          sub_227C9A190(*(void *)(a1 + 6144), a2, (float32x2_t *)(a1 + 6152), (uint64_t)a3, *v17, &v31, v16);
          uint64_t v20 = *(unsigned __int16 *)(a1 + 4346);
          unint64_t v21 = *(unsigned int *)(a1 + 4348);
          uint64_t v22 = *(unsigned __int16 *)(a1 + 4344);
          if (v22 + v20 >= v21) {
            uint64_t v23 = *(unsigned int *)(a1 + 4348);
          }
          else {
            uint64_t v23 = 0;
          }
          *(void *)(a1 + 4352 + 8 * (v22 + v20 - v23)) = v19;
          if (v21 <= v20)
          {
            if (v22 + 1 < v21) {
              LOWORD(v21) = 0;
            }
            *(_WORD *)(a1 + 4344) = v22 + 1 - v21;
          }
          else
          {
            *(_WORD *)(a1 + 4346) = v20 + 1;
          }
          sub_227C88228((unsigned __int16 *)(a1 + 4752), &v31);
          if (*(unsigned char *)(a1 + 6176)) {
            sub_227C9A298(a1);
          }
        }
        if (*(_WORD *)(a1 + 4346))
        {
          unint64_t v24 = *(unsigned __int16 *)(a1 + 4346) + (unint64_t)*(unsigned __int16 *)(a1 + 4344) - 1;
          unint64_t v25 = *(unsigned int *)(a1 + 4348);
          if (v24 < v25) {
            unint64_t v25 = 0;
          }
          *(void *)(a1 + 6144) = *(void *)(a1 + 4344 + 8 * (v24 - v25) + 8);
          unint64_t v26 = *(unsigned __int16 *)(a1 + 4752) + (unint64_t)*(unsigned __int16 *)(a1 + 4754) - 1;
          unint64_t v27 = *(unsigned int *)(a1 + 4756);
          if (v26 < v27) {
            unint64_t v27 = 0;
          }
          int v28 = (_OWORD *)(a1 + 4752 + 16 * (v26 - v27) + 8);
          if ((_OWORD *)(a1 + 6152) != v28) {
            *(_OWORD *)(a1 + 6152) = *v28;
          }
        }
        if (*(void *)(a1 + 5600) == 16)
        {
          uint64_t v29 = *(void *)(a1 + 5592);
          *(void *)(a1 + 5600) = 15;
          *(void *)(a1 + 5592) = v29 + 1;
          sub_227C9D888(a1 + 5560, 1);
        }
        sub_227C94D3C((void *)(a1 + 5560), &v33);
        if (*(void *)(a1 + 5648) == 16)
        {
          uint64_t v30 = *(void *)(a1 + 5640);
          *(void *)(a1 + 5648) = 15;
          *(void *)(a1 + 5640) = v30 + 1;
          sub_227C9D888(a1 + 5608, 1);
        }
        sub_227C94D3C((void *)(a1 + 5608), &v32);
        if (*(void *)buf)
        {
          *(void *)&uint8_t buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }
      }
      else
      {
        *(void *)(a1 + 6144) = a2;
        sub_227CA4C8C(a3, (float32x4_t *)buf);
        if ((unsigned char *)(a1 + 6152) != buf) {
          *(_OWORD *)(a1 + 6152) = *(_OWORD *)buf;
        }
      }
    }
  }
}

void sub_227C99F6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_227C99F94(unsigned __int16 *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, char **a4@<X8>)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  uint64_t v5 = a1[1];
  if (a1[1])
  {
    uint64_t v8 = a1 + 4;
    uint64_t v9 = *a1;
    unint64_t v10 = v5 + v9 - 1;
    unint64_t v11 = *((unsigned int *)a1 + 1);
    if (v10 < v11) {
      unint64_t v11 = 0;
    }
    if (*(void *)&v8[4 * (v10 - v11)] >= a2 && *(void *)&v8[4 * v9] < a3)
    {
      unint64_t v13 = v5 - 1;
      do
      {
        unint64_t v14 = v13;
        if (!v13) {
          break;
        }
        unint64_t v15 = (unint64_t *)sub_227C9B9E4(a1, v13);
        unint64_t v13 = v14 - 1;
      }
      while (*v15 >= a3);
      if (*(void *)sub_227C9B9E4(a1, v14) > a2)
      {
        unint64_t v16 = v14 + 1;
        while (1)
        {
          unint64_t v17 = v16 - 1;
          if (v16 == 1) {
            break;
          }
          float32x4_t v18 = (unint64_t *)sub_227C9B9E4(a1, v16 - 2);
          unint64_t v16 = v17;
          if (*v18 <= a2)
          {
            if (v17 > v14) {
              return;
            }
            goto LABEL_14;
          }
        }
        do
        {
LABEL_14:
          unint64_t v19 = (void *)sub_227C9B9E4(a1, v17);
          uint64_t v20 = v19;
          uint64_t v22 = a4[1];
          unint64_t v21 = (unint64_t)a4[2];
          if ((unint64_t)v22 >= v21)
          {
            unint64_t v24 = *a4;
            uint64_t v25 = (v22 - *a4) >> 3;
            unint64_t v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 61) {
              sub_227B8B89C();
            }
            uint64_t v27 = v21 - (void)v24;
            if (v27 >> 2 > v26) {
              unint64_t v26 = v27 >> 2;
            }
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v28 = v26;
            }
            if (v28)
            {
              uint64_t v29 = (char *)sub_227B8B8B4((uint64_t)(a4 + 2), v28);
              unint64_t v24 = *a4;
              uint64_t v22 = a4[1];
            }
            else
            {
              uint64_t v29 = 0;
            }
            uint64_t v30 = &v29[8 * v25];
            *(void *)uint64_t v30 = *v20;
            uint64_t v23 = v30 + 8;
            while (v22 != v24)
            {
              uint64_t v31 = *((void *)v22 - 1);
              v22 -= 8;
              *((void *)v30 - 1) = v31;
              v30 -= 8;
            }
            *a4 = v30;
            a4[1] = v23;
            a4[2] = &v29[8 * v28];
            if (v24) {
              operator delete(v24);
            }
          }
          else
          {
            *(void *)uint64_t v22 = *v19;
            uint64_t v23 = v22 + 8;
          }
          a4[1] = v23;
          ++v17;
        }
        while (v17 <= v14);
      }
    }
  }
}

void sub_227C9A170(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

double sub_227C9A190@<D0>(unint64_t a1@<X0>, unint64_t a2@<X1>, float32x2_t *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, float32x4_t *a6@<X8>, float32x4_t a7@<Q0>)
{
  if (a2 >= a1 && (int v8 = a5, v9 = a1, a5 >= a1))
  {
    int v12 = a2;
    *(double *)v13.i64 = sub_227CA4C6C(a3, &v25, a7);
    sub_227CA4C0C(a4, v25.f32, &v26, v13);
    sub_227CA4C8C(&v26, &v27);
    float v14 = sub_227CA50D0(&v27);
    float v15 = (double)(v12 - v9) * 0.000001;
    float v16 = v14 / v15;
    float v18 = v17 / v15;
    float v20 = v19 / v15;
    float v21 = (double)(v8 - v9) * 0.000001;
    v24[0] = v16 * v21;
    v24[1] = v18 * v21;
    void v24[2] = v20 * v21;
    *(double *)v22.i64 = sub_227CA4FB4(&v25, v24);
    sub_227CA4C0C((uint64_t)&v25, (float *)a3, &v26, v22);
    a7.i64[0] = sub_227CA4C8C(&v26, a6).u64[0];
  }
  else
  {
    a6->i64[0] = 0;
    a6->i64[1] = 0x3F80000000000000;
  }
  return *(double *)a7.i64;
}

void sub_227C9A298(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (*(_WORD *)(a1 + 2))
  {
    uint64_t v2 = a1 + 6921;
    if (*(unsigned char *)(a1 + 6921))
    {
      uint64_t v3 = a1 + 4352;
      unint64_t v4 = *(unsigned __int16 *)(a1 + 4344) + (unint64_t)*(unsigned __int16 *)(a1 + 4346) - 1;
      unint64_t v5 = *(unsigned int *)(a1 + 4348);
      if (v4 < v5) {
        unint64_t v5 = 0;
      }
      uint64_t v6 = *(void *)(v3 + 8 * (v4 - v5));
      unint64_t v7 = *(unsigned __int16 *)(a1 + 2) - 1;
      while (v7)
      {
        int v8 = (void *)sub_227C9B9E4((unsigned __int16 *)a1, v7--);
        if (*v8 == v6)
        {
          unint64_t v9 = *(unsigned __int16 *)(a1 + 3034) - 1;
          do
          {
            unint64_t v10 = v9;
            if (!v9) {
              break;
            }
            unint64_t v11 = (void *)sub_227C9B9E4((unsigned __int16 *)(a1 + 3032), v9);
            unint64_t v9 = v10 - 1;
          }
          while (*v11 != v6);
          if (*(void *)sub_227C9B9E4((unsigned __int16 *)(a1 + 3032), v10) != v6)
          {
            if (qword_2681B9A70 != -1) {
              dispatch_once(&qword_2681B9A70, &unk_26DC29670);
            }
            int v12 = qword_2681B9A78;
            if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
            {
              uint64_t v13 = *(void *)sub_227C9B9E4((unsigned __int16 *)(a1 + 3032), v10);
              *(_DWORD *)buf = 134218496;
              uint64_t v45 = v6;
              __int16 v46 = 2048;
              uint64_t v47 = v13;
              __int16 v48 = 2048;
              unint64_t v49 = v10;
              _os_log_impl(&dword_227B19000, v12, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[feedAuxDM] Expected exact source vs aux timestamp, not finding one should not have been possible. fBufAuxDM6TimestampMicroSeconds.back(): %llu, fBufSrcDM6TimestampMicroSeconds[indSrc]: %llu, indSrc: %lu", buf, 0x20u);
            }
          }
          float v14 = (float32x2_t *)sub_227C89D30((unsigned __int16 *)(a1 + 3440), v10);
          sub_227CA4C6C(v14, (float32x4_t *)buf, v15);
          float32x4_t v16 = sub_227CA1258(a1 + 6176, &v43);
          unint64_t v17 = *(unsigned __int16 *)(a1 + 4752) + (unint64_t)*(unsigned __int16 *)(a1 + 4754) - 1;
          unint64_t v18 = *(unsigned int *)(a1 + 4756);
          if (v17 < v18) {
            unint64_t v18 = 0;
          }
          *(double *)v19.i64 = sub_227CA4C0C(a1 + 4752 + 16 * (v17 - v18) + 8, v43.f32, &v40, v16);
          *(double *)v20.i64 = sub_227CA4C0C((uint64_t)&v40, (float *)buf, &v41, v19);
          *(double *)v21.i64 = sub_227CA4C6C((float32x2_t *)&v41, &v42, v20);
          *(double *)v22.i64 = sub_227CA4C6C((float32x2_t *)(a1 + 6924), &v40, v21);
          sub_227CA4C0C((uint64_t)&v42, v40.f32, &v41, v22);
          float32x4_t v42 = v41;
          unint64_t v23 = *(unsigned __int16 *)(a1 + 4344) + (unint64_t)*(unsigned __int16 *)(a1 + 4346) - 1;
          unint64_t v24 = *(unsigned int *)(a1 + 4348);
          if (v23 < v24) {
            unint64_t v24 = 0;
          }
          unint64_t v25 = *(void *)(v3 + 8 * (v23 - v24));
          sub_227C9A66C(a1, (float32x2_t *)&v42, v25, v41);
          unint64_t v26 = *(void *)(a1 + 6888);
          float32x4_t v27 = (float32x4_t *)(a1 + 6872);
          sub_227CA4CC4((float32x2_t *)&v42, a1 + 6872, &v41, v28);
          float v29 = sub_227CA50D0(&v41);
          uint64_t v30 = 0;
          v40.i64[0] = __PAIR64__(v31, LODWORD(v29));
          v40.i32[2] = v32;
          float v33 = 0.0;
          do
          {
            float v33 = v33 + (float)(v40.f32[v30] * v40.f32[v30]);
            ++v30;
          }
          while (v30 != 3);
          if (v26 <= v25) {
            unint64_t v34 = v25 - v26;
          }
          else {
            unint64_t v34 = v26 - v25;
          }
          if (&v42 != v27 && v34 <= 0x7A11F && sqrtf(v33) < 0.017453) {
            float32x4_t v42 = *v27;
          }
          if ((float32x4_t *)(a1 + 6896) != &v42) {
            *(float32x4_t *)(a1 + 6896) = v42;
          }
          *(void *)(a1 + 6912) = v25;
          LODWORD(v35) = *(unsigned __int16 *)(a1 + 6978);
          if (*(_WORD *)(a1 + 6978) && *(unsigned char *)(v2 + 2955))
          {
            while (1)
            {
              BOOL v36 = __OFSUB__(v35, 1);
              unint64_t v35 = (v35 - 1);
              if (((v35 & 0x80000000) != 0) != v36) {
                break;
              }
              if (*(void *)sub_227C9B9E4((unsigned __int16 *)(a1 + 6976), v35) == v25)
              {
                uint64_t v37 = sub_227C89D30((unsigned __int16 *)(a1 + 7944), v35);
                *(double *)v39.i64 = sub_227CA4C6C((float32x2_t *)(a1 + 6924), &v40, v38);
                sub_227CA4C0C(v37, v40.f32, &v41, v39);
                float32x4_t v42 = v41;
                break;
              }
            }
          }
          if (*(void *)(a1 + 6696)) {
            sub_227C9A8A4(a1 + 6672, v25);
          }
          return;
        }
      }
    }
  }
}

void sub_227C9A66C(uint64_t a1, float32x2_t *a2, unint64_t a3, float32x4_t a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1 + 6921;
  if (!*(unsigned char *)(a1 + 6921)) {
    goto LABEL_10;
  }
  unint64_t v6 = *(void *)(a1 + 6888);
  if (!v6) {
    goto LABEL_10;
  }
  unint64_t v8 = v6 - a3;
  if (v6 < a3) {
    goto LABEL_10;
  }
  unint64_t v9 = *(void *)(a1 + 6944);
  if (a3 <= v9) {
    goto LABEL_10;
  }
  *(double *)a4.i64 = (double)(a3 - v9) * 0.000001;
  a4.f32[0] = *(double *)a4.i64;
  if (a4.f32[0] < 5.0) {
    goto LABEL_10;
  }
  if (v8 >= 0x30D41) {
    goto LABEL_10;
  }
  *(double *)v11.i64 = sub_227CA4C6C((float32x2_t *)(a1 + 6924), (float32x4_t *)buf, a4);
  *(double *)v12.i64 = sub_227CA4C0C(a1 + 6872, (float *)buf, &v25, v11);
  sub_227CA4CC4(a2, (uint64_t)&v25, (float32x4_t *)buf, v12);
  float v13 = sub_227CA50D0((float32x4_t *)buf);
  uint64_t v14 = 0;
  *(float *)unint64_t v24 = v13;
  v24[1] = v15;
  void v24[2] = v16;
  float v17 = 0.0;
  do
  {
    float v17 = v17 + (float)(*(float *)&v24[v14] * *(float *)&v24[v14]);
    ++v14;
  }
  while (v14 != 3);
  float v18 = sqrtf(v17);
  if (v18 < 0.087266)
  {
LABEL_10:
    *(void *)(a1 + 6960) = 0;
LABEL_11:
    *(unsigned char *)(v5 + 48) = 0;
    return;
  }
  unint64_t v19 = *(void *)(a1 + 6960);
  if (!v19)
  {
    *(void *)(a1 + 6960) = a3;
    goto LABEL_11;
  }
  BOOL v20 = a3 >= v19;
  unint64_t v21 = a3 - v19;
  if (v20) {
    unint64_t v22 = v21;
  }
  else {
    unint64_t v22 = 0;
  }
  if (v22 >= 0x4C4B40 && !*(unsigned char *)(v5 + 48))
  {
    *(unsigned char *)(v5 + 48) = 1;
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29670);
    }
    unint64_t v23 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349824;
      unint64_t v27 = a3;
      __int16 v28 = 2050;
      unint64_t v29 = v22;
      __int16 v30 = 2050;
      unint64_t v31 = v8;
      __int16 v32 = 2050;
      double v33 = (float)(v18 * 57.296);
      _os_log_impl(&dword_227B19000, v23, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[checkPersistentCorrectedVsCurrentRollDelta] Detected persistent large difference between corrected vs. current roll estimate. Timestamp: %{public}llu us, sustained duration: %{public}llu us durationSinceLastCurrentUpdate: %{public}llu us, rollDelta: %{public}.3f deg", buf, 0x2Au);
    }
  }
}

uint64_t sub_227C9A8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    sub_227C9D918();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

void sub_227C9A8F8(unsigned __int16 *a1, unint64_t a2, _OWORD *a3, float a4, float a5)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  unint64_t v8 = a1 + 3084;
  float v72 = a5;
  float v73 = a4;
  uint64_t v9 = a1[1517];
  uint64_t v10 = a1[1516];
  if (!a1[1517])
  {
    unint64_t v21 = 0;
    goto LABEL_63;
  }
  float32x4_t v11 = a1 + 1520;
  unint64_t v12 = v9 + v10 - 1;
  unint64_t v13 = *((unsigned int *)a1 + 759);
  if (v12 < v13) {
    unint64_t v13 = 0;
  }
  unint64_t v14 = *(void *)&v11[4 * (v12 - v13)];
  if (v14 < a2)
  {
    sub_227C9B008(a1, v14, a2, (char **)buf);
    int v15 = *(unint64_t **)buf;
    int v16 = *(unint64_t **)&buf[8];
    if (*(void *)buf == *(void *)&buf[8]) {
      goto LABEL_55;
    }
    uint64_t v17 = a1[1517];
    if (**(void **)buf - v14 > 0x9C3) {
      goto LABEL_39;
    }
    if (a1[1517])
    {
      unint64_t v18 = v17 + a1[1516] - 1;
      unint64_t v19 = *((unsigned int *)a1 + 759);
      if (v18 < v19) {
        unint64_t v19 = 0;
      }
      uint64_t v20 = *(void *)&v11[4 * (v18 - v19)];
    }
    else
    {
      uint64_t v20 = 0;
    }
    uint64_t v26 = a1[2173];
    if (a1[2173])
    {
      unint64_t v27 = v26 + a1[2172] - 1;
      unint64_t v28 = *((unsigned int *)a1 + 1087);
      if (v27 < v28) {
        unint64_t v28 = 0;
      }
      uint64_t v29 = *(void *)&a1[4 * (v27 - v28) + 2176];
      if (!a1[1517])
      {
LABEL_27:
        if (v26 && (_WORD)v17 && v29 == v20)
        {
          unsigned __int16 v30 = v26 - 1;
          a1[2173] = v30;
          unsigned __int16 v31 = a1[2377];
          if (v31) {
            a1[2377] = --v31;
          }
          if (v30)
          {
            unint64_t v32 = a1[2172] + (unint64_t)v30 - 1;
            unint64_t v33 = *((unsigned int *)a1 + 1087);
            if (v32 < v33) {
              unint64_t v33 = 0;
            }
            *((void *)a1 + 768) = *(void *)&a1[4 * (v32 - v33) + 2176];
            unint64_t v34 = a1[2376] + (unint64_t)v31 - 1;
            unint64_t v35 = *((unsigned int *)a1 + 1189);
            if (v34 < v35) {
              unint64_t v35 = 0;
            }
            BOOL v36 = &a1[8 * (v34 - v35) + 2380];
            if (a1 + 3076 != v36) {
              *(_OWORD *)(a1 + 3076) = *(_OWORD *)v36;
            }
          }
          else
          {
            *unint64_t v8 = 1;
          }
LABEL_40:
          unint64_t v37 = a1[1516] + (unint64_t)(unsigned __int16)v17 - 1;
          unint64_t v38 = *((unsigned int *)a1 + 759);
          if (v37 < v38) {
            unint64_t v38 = 0;
          }
          unint64_t v39 = *(void *)&v11[4 * (v37 - v38)];
          unint64_t v40 = a1[1720] + (unint64_t)a1[1721] - 1;
          unint64_t v41 = *((unsigned int *)a1 + 861);
          if (v40 < v41) {
            unint64_t v41 = 0;
          }
          float32x4_t v42 = *(float32x4_t *)&a1[8 * (v40 - v41) + 1724];
          float32x4_t v71 = v42;
          do
          {
            unint64_t v43 = *v15;
            sub_227C9A190(v39, a2, (float32x2_t *)&v71, (uint64_t)a3, *v15, &v70, v42);
            uint64_t v44 = a1[1517];
            unint64_t v45 = *((unsigned int *)a1 + 759);
            uint64_t v46 = a1[1516];
            if (v46 + v44 >= v45) {
              uint64_t v47 = *((unsigned int *)a1 + 759);
            }
            else {
              uint64_t v47 = 0;
            }
            *(void *)&v11[4 * (v46 + v44 - v47)] = v43;
            if (v45 <= v44)
            {
              if (v46 + 1 < v45) {
                LOWORD(v45) = 0;
              }
              a1[1516] = v46 + 1 - v45;
            }
            else
            {
              a1[1517] = v44 + 1;
            }
            sub_227C88228(a1 + 1720, &v70);
            ++v15;
          }
          while (v15 != v16);
          int v15 = *(unint64_t **)buf;
LABEL_55:
          if (!v15) {
            goto LABEL_57;
          }
          goto LABEL_56;
        }
LABEL_39:
        if (!(_WORD)v17)
        {
LABEL_56:
          *(void *)&uint8_t buf[8] = v15;
          operator delete(v15);
LABEL_57:
          uint64_t v9 = a1[1517];
          uint64_t v10 = a1[1516];
          if (a1[1517])
          {
            unint64_t v48 = v9 + v10 - 1;
            unint64_t v49 = *((unsigned int *)a1 + 759);
            if (v48 < v49) {
              unint64_t v49 = 0;
            }
            unint64_t v21 = *(void *)&v11[4 * (v48 - v49)];
            if (v21 + 2500 >= a2)
            {
LABEL_73:
              if (*((void *)a1 + 768) > (unint64_t)(*((void *)a1 + 849) + 10000))
              {
                sub_227C98C70(a1);
                sub_227C9BF60((uint64_t)a1);
              }
              if (*((void *)a1 + 536) == 16)
              {
                uint64_t v55 = *((void *)a1 + 535);
                *((void *)a1 + 536) = 15;
                *((void *)a1 + 535) = v55 + 1;
                sub_227C9D888((uint64_t)(a1 + 2124), 1);
              }
              sub_227C94D3C((void *)a1 + 531, &v73);
              if (*((void *)a1 + 542) == 16)
              {
                uint64_t v56 = *((void *)a1 + 541);
                *((void *)a1 + 542) = 15;
                *((void *)a1 + 541) = v56 + 1;
                sub_227C9D888((uint64_t)(a1 + 2148), 1);
              }
              sub_227C94D3C((void *)a1 + 537, &v72);
              unint64_t v57 = *((void *)a1 + 868);
              float v58 = (double)(a2 - v57) * 0.000001;
              if (a2 <= v57) {
                float v58 = 0.0;
              }
              *((float *)a1 + 2468) = v58;
              if (!a1[1]) {
                goto LABEL_88;
              }
              unint64_t v59 = a1[1] + (unint64_t)*a1 - 1;
              unint64_t v60 = *((unsigned int *)a1 + 1);
              if (v59 < v60) {
                unint64_t v60 = 0;
              }
              unint64_t v61 = *(void *)&a1[4 * (v59 - v60) + 4];
              if (v61)
              {
                unsigned int v62 = v61 - v21;
                if (v61 <= v21) {
                  unsigned int v62 = v21 - v61;
                }
                BOOL v63 = v62 > 0x124F7;
                v8[802] = v62 < 0x124F8;
              }
              else
              {
LABEL_88:
                v8[802] = 0;
                BOOL v63 = 1;
              }
              if (v8[800]) {
                int v64 = v63;
              }
              else {
                int v64 = 1;
              }
              v8[3709] = v64;
              if (*((void *)a1 + 700))
              {
                sub_227C92464((uint64_t)v69, (void *)a1 + 695);
                double v65 = sub_227C905CC(v69);
                float v66 = *(float *)&v65;
                sub_227C923BC(v69);
                if (!v8[3709])
                {
LABEL_103:
                  if (v64)
                  {
                    if (v8[801])
                    {
                      sub_227C9B204((uint64_t)a1);
                      v8[801] = 0;
                      *((void *)a1 + 870) = 0;
                    }
                  }
                  return;
                }
              }
              else
              {
                float v66 = 0.0;
                if (!v64) {
                  goto LABEL_103;
                }
              }
              if (v8[3708] && v66 < 0.7854 && *((float *)a1 + 2468) > 5.0)
              {
                sub_227C9B204((uint64_t)a1);
                v8[3708] = 0;
                v8[801] = 0;
                *((void *)a1 + 870) = 0;
                if (qword_2681B9A70 != -1) {
                  dispatch_once(&qword_2681B9A70, &unk_26DC29670);
                }
                uint64_t v67 = qword_2681B9A78;
                if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
                {
                  double v68 = *((float *)a1 + 2468);
                  *(_DWORD *)buf = 134349312;
                  *(void *)&uint8_t buf[4] = a2;
                  *(_WORD *)&unsigned char buf[12] = 2050;
                  *(double *)&buf[14] = v68;
                  _os_log_impl(&dword_227B19000, v67, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedSrcDM] Performed soft reset on the first hover-or-out opportunity. Timestamp: %{public}llu us, durationFromSessionStartSeconds: %{public}.3f s", buf, 0x16u);
                }
              }
              goto LABEL_103;
            }
          }
          else
          {
            unint64_t v21 = 0;
          }
LABEL_63:
          unint64_t v50 = *((unsigned int *)a1 + 759);
          unint64_t v51 = v10 + (unint64_t)v9;
          if (v51 >= v50) {
            uint64_t v52 = *((unsigned int *)a1 + 759);
          }
          else {
            uint64_t v52 = 0;
          }
          *(void *)&a1[4 * (v51 - v52) + 1520] = a2;
          if (v50 <= v9)
          {
            __int16 v53 = v10 + 1;
            if ((unint64_t)v10 + 1 >= v50) {
              __int16 v54 = v50;
            }
            else {
              __int16 v54 = 0;
            }
            a1[1516] = v53 - v54;
          }
          else
          {
            a1[1517] = v9 + 1;
          }
          sub_227C88228(a1 + 1720, a3);
          goto LABEL_73;
        }
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v29 = 0;
      if (!a1[1517]) {
        goto LABEL_27;
      }
    }
    LOWORD(v17) = v17 - 1;
    a1[1517] = v17;
    if (a1[1721]) {
      --a1[1721];
    }
    goto LABEL_27;
  }
  if (qword_2681B9A70 != -1) {
    dispatch_once(&qword_2681B9A70, &unk_26DC29670);
  }
  unint64_t v22 = qword_2681B9A78;
  if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
  {
    unint64_t v23 = a1[1516] + (unint64_t)a1[1517] - 1;
    unint64_t v24 = *((unsigned int *)a1 + 759);
    if (v23 < v24) {
      unint64_t v24 = 0;
    }
    uint64_t v25 = *(void *)&v11[4 * (v23 - v24)];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = a2;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v25;
    _os_log_impl(&dword_227B19000, v22, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[feedSrcDM] SrcDM timestamp must be greater than the last value. Input: %llu us, last: %llu us", buf, 0x16u);
  }
}

void sub_227C9AFD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
}

void sub_227C9B008(unsigned __int16 *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, char **a4@<X8>)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  uint64_t v5 = a1[1];
  if (a1[1])
  {
    unint64_t v8 = a1 + 4;
    uint64_t v9 = *a1;
    unint64_t v10 = v5 + v9 - 1;
    unint64_t v11 = *((unsigned int *)a1 + 1);
    if (v10 < v11) {
      unint64_t v11 = 0;
    }
    if (*(void *)&v8[4 * (v10 - v11)] >= a2 && *(void *)&v8[4 * v9] < a3)
    {
      unint64_t v13 = v5 - 1;
      do
      {
        unint64_t v14 = v13;
        if (!v13) {
          break;
        }
        int v15 = (unint64_t *)sub_227C9B9E4(a1, v13);
        unint64_t v13 = v14 - 1;
      }
      while (*v15 >= a3);
      if (*(void *)sub_227C9B9E4(a1, v14) > a2)
      {
        unint64_t v16 = v14 + 1;
        while (1)
        {
          unint64_t v17 = v16 - 1;
          if (v16 == 1) {
            break;
          }
          unint64_t v18 = (unint64_t *)sub_227C9B9E4(a1, v16 - 2);
          unint64_t v16 = v17;
          if (*v18 <= a2)
          {
            if (v17 > v14) {
              return;
            }
            goto LABEL_14;
          }
        }
        do
        {
LABEL_14:
          unint64_t v19 = (void *)sub_227C9B9E4(a1, v17);
          uint64_t v20 = v19;
          unint64_t v22 = a4[1];
          unint64_t v21 = (unint64_t)a4[2];
          if ((unint64_t)v22 >= v21)
          {
            unint64_t v24 = *a4;
            uint64_t v25 = (v22 - *a4) >> 3;
            unint64_t v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 61) {
              sub_227B8B89C();
            }
            uint64_t v27 = v21 - (void)v24;
            if (v27 >> 2 > v26) {
              unint64_t v26 = v27 >> 2;
            }
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v28 = v26;
            }
            if (v28)
            {
              uint64_t v29 = (char *)sub_227B8B8B4((uint64_t)(a4 + 2), v28);
              unint64_t v24 = *a4;
              unint64_t v22 = a4[1];
            }
            else
            {
              uint64_t v29 = 0;
            }
            unsigned __int16 v30 = &v29[8 * v25];
            *(void *)unsigned __int16 v30 = *v20;
            unint64_t v23 = v30 + 8;
            while (v22 != v24)
            {
              uint64_t v31 = *((void *)v22 - 1);
              v22 -= 8;
              *((void *)v30 - 1) = v31;
              v30 -= 8;
            }
            *a4 = v30;
            a4[1] = v23;
            a4[2] = &v29[8 * v28];
            if (v24) {
              operator delete(v24);
            }
          }
          else
          {
            *(void *)unint64_t v22 = *v19;
            unint64_t v23 = v22 + 8;
          }
          a4[1] = v23;
          ++v17;
        }
        while (v17 <= v14);
      }
    }
  }
}

void sub_227C9B1E4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_227C9B204(uint64_t result)
{
  uint64_t v1 = (unsigned char *)(result + 6704);
  if (*(unsigned char *)(result + 6921))
  {
    uint64_t v2 = result;
    unint64_t v3 = *(void *)(result + 6912);
    if (v3)
    {
      if (*v1)
      {
        unint64_t v4 = *(void *)(result + 6728);
        if (v4 <= v3) {
          unsigned int v5 = v3 - v4;
        }
        else {
          unsigned int v5 = v4 - v3;
        }
        if (v5 <= 0x30D40)
        {
          *(double *)v6.i64 = sub_227C8AC98(result + 6704);
          sub_227CA4C0C(v2 + 6896, (float *)(v2 + 6924), &v7, v6);
          sub_227C8A958((uint64_t)v1, &v7, *(void *)(v2 + 6912), 0.0017453, 0.017453);
          BOOL result = sub_227C9FFDC(v2 + 6176);
          *(void *)(v2 + 6792) = *(void *)(v2 + 6912);
        }
      }
    }
  }
  return result;
}

void sub_227C9B2C4(uint64_t a1@<X0>, void *a2@<X8>)
{
  unint64_t v83 = 0;
  unint64_t v84 = 0;
  unint64_t v85 = 0;
  float v80 = 0;
  unint64_t v81 = 0;
  unint64_t v82 = 0;
  float v77 = 0;
  float v78 = 0;
  BOOL v79 = 0;
  __p = 0;
  uint64_t v75 = 0;
  float v76 = 0;
  sub_227C9B93C(&__p, *(unsigned __int16 *)(a1 + 2));
  if (*(_WORD *)(a1 + 2))
  {
    unint64_t v4 = 0;
    do
    {
      unsigned int v5 = (void *)sub_227C9B9E4((unsigned __int16 *)a1, v4);
      float32x4_t v6 = v5;
      float32x4_t v7 = v75;
      if (v75 >= v76)
      {
        uint64_t v9 = (char *)__p;
        uint64_t v10 = (v75 - (unsigned char *)__p) >> 3;
        unint64_t v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61) {
          sub_227B8B89C();
        }
        uint64_t v12 = v76 - (unsigned char *)__p;
        if ((v76 - (unsigned char *)__p) >> 2 > v11) {
          unint64_t v11 = v12 >> 2;
        }
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v11;
        }
        if (v13)
        {
          unint64_t v14 = (char *)sub_227B8B8B4((uint64_t)&v76, v13);
          uint64_t v9 = (char *)__p;
          float32x4_t v7 = v75;
        }
        else
        {
          unint64_t v14 = 0;
        }
        int v15 = &v14[8 * v10];
        *(void *)int v15 = *v6;
        unint64_t v8 = v15 + 8;
        while (v7 != v9)
        {
          uint64_t v16 = *((void *)v7 - 1);
          v7 -= 8;
          *((void *)v15 - 1) = v16;
          v15 -= 8;
        }
        __p = v15;
        uint64_t v75 = v8;
        float v76 = &v14[8 * v13];
        if (v9) {
          operator delete(v9);
        }
      }
      else
      {
        *(void *)uint64_t v75 = *v5;
        unint64_t v8 = v7 + 8;
      }
      uint64_t v75 = v8;
      ++v4;
    }
    while (v4 < *(unsigned __int16 *)(a1 + 2));
  }
  float32x4_t v71 = 0;
  float v72 = 0;
  float v73 = 0;
  sub_227C9B93C(&v71, *(unsigned __int16 *)(a1 + 3034));
  if (*(_WORD *)(a1 + 3034))
  {
    unint64_t v17 = 0;
    do
    {
      unint64_t v18 = (void *)sub_227C9B9E4((unsigned __int16 *)(a1 + 3032), v17);
      unint64_t v19 = v18;
      uint64_t v20 = v72;
      if (v72 >= v73)
      {
        unint64_t v22 = (char *)v71;
        uint64_t v23 = (v72 - (unsigned char *)v71) >> 3;
        unint64_t v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 61) {
          sub_227B8B89C();
        }
        uint64_t v25 = v73 - (unsigned char *)v71;
        if ((v73 - (unsigned char *)v71) >> 2 > v24) {
          unint64_t v24 = v25 >> 2;
        }
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v24;
        }
        if (v26)
        {
          uint64_t v27 = (char *)sub_227B8B8B4((uint64_t)&v73, v26);
          unint64_t v22 = (char *)v71;
          uint64_t v20 = v72;
        }
        else
        {
          uint64_t v27 = 0;
        }
        unint64_t v28 = &v27[8 * v23];
        *(void *)unint64_t v28 = *v19;
        unint64_t v21 = v28 + 8;
        while (v20 != v22)
        {
          uint64_t v29 = *((void *)v20 - 1);
          v20 -= 8;
          *((void *)v28 - 1) = v29;
          v28 -= 8;
        }
        float32x4_t v71 = v28;
        float v72 = v21;
        float v73 = &v27[8 * v26];
        if (v22) {
          operator delete(v22);
        }
      }
      else
      {
        *(void *)float v72 = *v18;
        unint64_t v21 = v20 + 8;
      }
      float v72 = v21;
      ++v17;
    }
    while (v17 < *(unsigned __int16 *)(a1 + 3034));
  }
  sub_227C9BAFC((uint64_t **)&v71, (uint64_t **)&__p, &v67);
  if (v67 != v68)
  {
    unint64_t v30 = *(unsigned __int16 *)(a1 + 4344) + (unint64_t)*(unsigned __int16 *)(a1 + 4346) - 1;
    unint64_t v31 = *(unsigned int *)(a1 + 4348);
    if (v30 < v31) {
      unint64_t v31 = 0;
    }
    if (*(void *)(a1 + 4344 + 8 * (v30 - v31) + 8) >= *((void *)v71 + *(void *)v67) && *(_WORD *)(a1 + 4346))
    {
      unint64_t v32 = 0;
      unint64_t v33 = 0;
      do
      {
        if (v32 >= (v68 - (unsigned char *)v67) >> 3) {
          break;
        }
        unint64_t v34 = (void *)sub_227C9B9E4((unsigned __int16 *)(a1 + 4344), v33);
        if (*v34 == *((void *)v71 + *((void *)v67 + v32)))
        {
          unint64_t v35 = v78;
          if (v78 >= v79)
          {
            unint64_t v37 = (char *)v77;
            uint64_t v38 = (v78 - (unsigned char *)v77) >> 3;
            unint64_t v39 = v38 + 1;
            if ((unint64_t)(v38 + 1) >> 61) {
              goto LABEL_115;
            }
            uint64_t v40 = v79 - (unsigned char *)v77;
            if ((v79 - (unsigned char *)v77) >> 2 > v39) {
              unint64_t v39 = v40 >> 2;
            }
            if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v41 = v39;
            }
            if (v41)
            {
              float32x4_t v42 = (char *)sub_227B8B8B4((uint64_t)&v79, v41);
              unint64_t v37 = (char *)v77;
              unint64_t v35 = v78;
            }
            else
            {
              float32x4_t v42 = 0;
            }
            unint64_t v43 = (unint64_t *)&v42[8 * v38];
            *unint64_t v43 = v33;
            BOOL v36 = (char *)(v43 + 1);
            while (v35 != v37)
            {
              unint64_t v44 = *((void *)v35 - 1);
              v35 -= 8;
              *--unint64_t v43 = v44;
            }
            float v77 = v43;
            float v78 = v36;
            BOOL v79 = &v42[8 * v41];
            if (v37) {
              operator delete(v37);
            }
          }
          else
          {
            *(void *)float v78 = v33;
            BOOL v36 = v35 + 8;
          }
          float v78 = v36;
          unint64_t v45 = v67;
          uint64_t v46 = v81;
          if (v81 >= v82)
          {
            unint64_t v48 = (char *)v80;
            uint64_t v49 = (v81 - (unsigned char *)v80) >> 3;
            unint64_t v50 = v49 + 1;
            if ((unint64_t)(v49 + 1) >> 61) {
              goto LABEL_115;
            }
            uint64_t v51 = v82 - (unsigned char *)v80;
            if ((v82 - (unsigned char *)v80) >> 2 > v50) {
              unint64_t v50 = v51 >> 2;
            }
            if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v52 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v52 = v50;
            }
            if (v52)
            {
              __int16 v53 = (char *)sub_227B8B8B4((uint64_t)&v82, v52);
              unint64_t v48 = (char *)v80;
              uint64_t v46 = v81;
            }
            else
            {
              __int16 v53 = 0;
            }
            __int16 v54 = &v53[8 * v49];
            *(void *)__int16 v54 = v45[v32];
            uint64_t v47 = v54 + 8;
            while (v46 != v48)
            {
              uint64_t v55 = *((void *)v46 - 1);
              v46 -= 8;
              *((void *)v54 - 1) = v55;
              v54 -= 8;
            }
            float v80 = v54;
            unint64_t v81 = v47;
            unint64_t v82 = &v53[8 * v52];
            if (v48) {
              operator delete(v48);
            }
          }
          else
          {
            *(void *)unint64_t v81 = *((void *)v67 + v32);
            uint64_t v47 = v46 + 8;
          }
          unint64_t v81 = v47;
          uint64_t v56 = v69;
          unint64_t v57 = v84;
          if (v84 >= v85)
          {
            unint64_t v59 = v83;
            uint64_t v60 = (v84 - v83) >> 3;
            unint64_t v61 = v60 + 1;
            if ((unint64_t)(v60 + 1) >> 61) {
LABEL_115:
            }
              sub_227B8B89C();
            uint64_t v62 = v85 - v83;
            if ((v85 - v83) >> 2 > v61) {
              unint64_t v61 = v62 >> 2;
            }
            if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v63 = v61;
            }
            if (v63)
            {
              int v64 = (char *)sub_227B8B8B4((uint64_t)&v85, v63);
              unint64_t v59 = v83;
              unint64_t v57 = v84;
            }
            else
            {
              int v64 = 0;
            }
            double v65 = &v64[8 * v60];
            *(void *)double v65 = v56[v32];
            float v58 = v65 + 8;
            while (v57 != v59)
            {
              uint64_t v66 = *((void *)v57 - 1);
              v57 -= 8;
              *((void *)v65 - 1) = v66;
              v65 -= 8;
            }
            unint64_t v83 = v65;
            unint64_t v84 = v58;
            unint64_t v85 = &v64[8 * v63];
            if (v59) {
              operator delete(v59);
            }
          }
          else
          {
            *(void *)unint64_t v84 = *((void *)v69 + v32);
            float v58 = v57 + 8;
          }
          unint64_t v84 = v58;
          ++v32;
        }
        ++v33;
      }
      while (v33 < *(unsigned __int16 *)(a1 + 4346));
    }
  }
  sub_227C9D448(a2, (uint64_t)&v83, (uint64_t)&v80, (uint64_t)&v77);
  if (v69)
  {
    float32x4_t v70 = v69;
    operator delete(v69);
  }
  if (v67)
  {
    double v68 = v67;
    operator delete(v67);
  }
  if (v71)
  {
    float v72 = (char *)v71;
    operator delete(v71);
  }
  if (__p)
  {
    uint64_t v75 = (char *)__p;
    operator delete(__p);
  }
  if (v77)
  {
    float v78 = (char *)v77;
    operator delete(v77);
  }
  if (v80)
  {
    unint64_t v81 = (char *)v80;
    operator delete(v80);
  }
  if (v83)
  {
    unint64_t v84 = v83;
    operator delete(v83);
  }
}

void sub_227C9B8AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27)
{
  sub_227C9BEC8((uint64_t)&a11);
  if (__p)
  {
    a18 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a20)
  {
    a21 = (uint64_t)a20;
    operator delete(a20);
  }
  if (a23)
  {
    a24 = (uint64_t)a23;
    operator delete(a23);
  }
  if (a26)
  {
    a27 = (uint64_t)a26;
    operator delete(a26);
  }
  uint64_t v29 = *(void **)(v27 - 112);
  if (v29)
  {
    *(void *)(v27 - 104) = v29;
    operator delete(v29);
  }
  _Unwind_Resume(a1);
}

void sub_227C9B93C(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_227B8B89C();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    float32x4_t v6 = (char *)sub_227B8B8B4(v3, a2);
    float32x4_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    uint64_t v10 = (char *)*a1;
    unint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

uint64_t sub_227C9B9E4(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29690);
    }
    float32x4_t v7 = qword_2681B9AA8;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  unint64_t v5 = *a1 + a2;
  if (v5 >= v4) {
    unint64_t v4 = v4;
  }
  else {
    unint64_t v4 = 0;
  }
  return (uint64_t)&a1[4 * (v5 - v4) + 4];
}

void sub_227C9BAFC(uint64_t **a1@<X0>, uint64_t **a2@<X1>, void *a3@<X8>)
{
  __p[0] = 0;
  __p[1] = 0;
  unint64_t v52 = 0;
  v49[0] = 0;
  v49[1] = 0;
  unint64_t v50 = 0;
  float32x4_t v6 = *a1;
  float32x4_t v7 = a1[1];
  if (v6 == v7 || (BOOL v8 = *a2, v9 = a2[1], *a2 == v9))
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    a3[3] = 0;
    __p[1] = 0;
    unint64_t v52 = 0;
    __p[0] = 0;
    a3[4] = 0;
    a3[5] = 0;
    goto LABEL_58;
  }
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  sub_227C9D9A0(v6, v7, v8, v9, (uint64_t)&v46, &v53);
  unint64_t v10 = v46;
  if (v46 == v47)
  {
    *(_OWORD *)a3 = *(_OWORD *)__p;
    a3[2] = v52;
    __p[1] = 0;
    unint64_t v52 = 0;
    __p[0] = 0;
    *(_OWORD *)(a3 + 3) = *(_OWORD *)v49;
    a3[5] = v50;
    v49[0] = 0;
    v49[1] = 0;
    unint64_t v50 = 0;
    if (!v10) {
      goto LABEL_58;
    }
    goto LABEL_56;
  }
  unint64_t v11 = (v47 - v46) >> 3;
  unint64_t v44 = *a2;
  unint64_t v45 = a2[1];
  uint64_t v12 = (char *)a1[1] - (char *)*a1;
  if (v12)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    unsigned int v15 = 0;
    int v16 = 0;
    unint64_t v17 = v12 >> 3;
    do
    {
      if ((*a1)[v14] == *(void *)&v46[8 * v13])
      {
        unint64_t v18 = (char *)__p[1];
        if (__p[1] >= v52)
        {
          uint64_t v20 = (char *)__p[0];
          int64_t v21 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 61) {
            sub_227B8B89C();
          }
          uint64_t v23 = v52 - (char *)__p[0];
          if ((v52 - (char *)__p[0]) >> 2 > v22) {
            unint64_t v22 = v23 >> 2;
          }
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v22;
          }
          if (v24)
          {
            uint64_t v25 = (char *)sub_227B8B8B4((uint64_t)&v52, v24);
            uint64_t v20 = (char *)__p[0];
            unint64_t v18 = (char *)__p[1];
          }
          else
          {
            uint64_t v25 = 0;
          }
          unint64_t v26 = (unint64_t *)&v25[8 * v21];
          *unint64_t v26 = v14;
          unint64_t v19 = v26 + 1;
          while (v18 != v20)
          {
            unint64_t v27 = *((void *)v18 - 1);
            v18 -= 8;
            *--unint64_t v26 = v27;
          }
          __p[0] = v26;
          __p[1] = v19;
          unint64_t v52 = &v25[8 * v24];
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          *(void *)__p[1] = v14;
          unint64_t v19 = v18 + 8;
        }
        __p[1] = v19;
        ++v15;
      }
      unint64_t v14 = (v16 + 1);
      uint64_t v13 = v15;
      BOOL v28 = v17 > v14 && v11 > v15;
      ++v16;
    }
    while (v28);
  }
  if (v45 != v44)
  {
    uint64_t v29 = 0;
    unint64_t v30 = 0;
    unsigned int v31 = 0;
    int v32 = 0;
    do
    {
      if ((*a2)[v30] == *(void *)&v46[8 * v29])
      {
        unint64_t v33 = (char *)v49[1];
        if (v49[1] >= v50)
        {
          unint64_t v35 = (char *)v49[0];
          int64_t v36 = ((char *)v49[1] - (char *)v49[0]) >> 3;
          unint64_t v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 61) {
            sub_227B8B89C();
          }
          uint64_t v38 = v50 - (char *)v49[0];
          if ((v50 - (char *)v49[0]) >> 2 > v37) {
            unint64_t v37 = v38 >> 2;
          }
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v39 = v37;
          }
          if (v39)
          {
            uint64_t v40 = (char *)sub_227B8B8B4((uint64_t)&v50, v39);
            unint64_t v35 = (char *)v49[0];
            unint64_t v33 = (char *)v49[1];
          }
          else
          {
            uint64_t v40 = 0;
          }
          unint64_t v41 = (unint64_t *)&v40[8 * v36];
          *unint64_t v41 = v30;
          unint64_t v34 = v41 + 1;
          while (v33 != v35)
          {
            unint64_t v42 = *((void *)v33 - 1);
            v33 -= 8;
            *--unint64_t v41 = v42;
          }
          v49[0] = v41;
          v49[1] = v34;
          unint64_t v50 = &v40[8 * v39];
          if (v35) {
            operator delete(v35);
          }
        }
        else
        {
          *(void *)v49[1] = v30;
          unint64_t v34 = v33 + 8;
        }
        v49[1] = v34;
        ++v31;
      }
      unint64_t v30 = (v32 + 1);
      uint64_t v29 = v31;
      BOOL v43 = v45 - v44 > v30 && v11 > v31;
      ++v32;
    }
    while (v43);
  }
  *(_OWORD *)a3 = *(_OWORD *)__p;
  a3[2] = v52;
  __p[1] = 0;
  unint64_t v52 = 0;
  __p[0] = 0;
  *(_OWORD *)(a3 + 3) = *(_OWORD *)v49;
  a3[5] = v50;
  v49[0] = 0;
  v49[1] = 0;
  unint64_t v50 = 0;
  unint64_t v10 = v46;
  if (v46)
  {
LABEL_56:
    uint64_t v47 = v10;
    operator delete(v10);
    if (v49[0])
    {
      v49[1] = v49[0];
      operator delete(v49[0]);
    }
  }
LABEL_58:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_227C9BE7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  if (__p) {
    operator delete(__p);
  }
  if (a15) {
    operator delete(a15);
  }
  if (a19) {
    operator delete(a19);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_227C9BEC8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
  return a1;
}

uint64_t sub_227C9BF0C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 24);
  if (v3)
  {
    *(void *)(a1 + 32) = v3;
    operator delete(v3);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
  }
  return a1;
}

void sub_227C9BF60(uint64_t a1)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  sub_227C9C79C((unsigned __int16 *)a1, (uint64_t)v91);
  if (v91[0])
  {
    uint64_t v2 = v94;
    uint64_t v76 = v92;
    *(void *)&long long v90 = 0;
    *((void *)&v90 + 1) = 0x3F80000000000000;
    *(void *)&long long v89 = 0;
    *((void *)&v89 + 1) = 0x3F80000000000000;
    v88.i64[0] = 0;
    v88.i64[1] = 0x3F80000000000000;
    v87.i64[0] = 0;
    v87.i64[1] = 0x3F80000000000000;
    if (*(_WORD *)(a1 + 3034))
    {
      if (*(_WORD *)(a1 + 4346))
      {
        unint64_t v3 = *(unsigned __int16 *)(a1 + 3034) + (unint64_t)*(unsigned __int16 *)(a1 + 3032) - 1;
        unint64_t v4 = *(unsigned int *)(a1 + 3036);
        if (v3 < v4) {
          unint64_t v4 = 0;
        }
        int v5 = *(_DWORD *)(a1 + 3032 + 8 * (v3 - v4) + 8);
        int v6 = *(_DWORD *)(a1 + 6944);
        if (*(void *)(a1 + 5600) < 5uLL)
        {
          BOOL v8 = 1;
        }
        else
        {
          sub_227C92464((uint64_t)v84, (void *)(a1 + 5560));
          double v7 = sub_227C905CC(v84);
          BOOL v8 = *(float *)&v7 >= 0.087266;
          sub_227C923BC(v84);
        }
        if (*(void *)(a1 + 4288) < 5uLL)
        {
          BOOL v10 = 1;
        }
        else
        {
          sub_227C92464((uint64_t)v83, (void *)(a1 + 4248));
          double v9 = sub_227C905CC(v83);
          BOOL v10 = *(float *)&v9 >= 0.087266;
          sub_227C923BC(v83);
        }
        uint64_t v11 = v2 + 1;
        if (v2 + 1 != v76)
        {
          uint64_t v12 = 0;
          unint64_t v13 = v11 - v76;
          float v77 = (unsigned __int16 *)(a1 + 4344);
          float v78 = (unsigned __int16 *)(a1 + 3032);
          BOOL v69 = (v5 - v6) > 0x4C4B3F;
          uint64_t v75 = (unsigned __int16 *)(a1 + 3440);
          uint64_t v79 = a1 + 6176;
          unint64_t v14 = (float32x2_t *)(a1 + 6704);
          unsigned int v15 = (float32x2_t *)(a1 + 6776);
          char v16 = v69 || v8;
          char v72 = v16 | v10;
          float32x4_t v71 = (unsigned __int16 *)(a1 + 968);
          uint64_t v74 = v93;
          if (v13 <= 1) {
            unint64_t v13 = 1;
          }
          unint64_t v73 = v13;
          while (1)
          {
            unint64_t v17 = v14;
            unint64_t v18 = v15;
            unint64_t v19 = v76 + v12;
            unint64_t v20 = v74 + v12;
            unint64_t v21 = *(void *)sub_227C9B9E4(v77, v76 + v12);
            uint64_t v22 = *(void *)sub_227C9B9E4(v77, v76 + v12);
            if (v22 != *(void *)sub_227C9B9E4(v78, v74 + v12))
            {
              if (qword_2681B9A70 != -1) {
                dispatch_once(&qword_2681B9A70, &unk_26DC29670);
              }
              uint64_t v23 = qword_2681B9A78;
              if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_ERROR))
              {
                uint64_t v24 = *(void *)sub_227C9B9E4(v77, v19);
                uint64_t v25 = *(void *)sub_227C9B9E4(v78, v20);
                *(_DWORD *)buf = 134218240;
                *(void *)&uint8_t buf[4] = v24;
                *(_WORD *)&unsigned char buf[12] = 2048;
                *(void *)&buf[14] = v25;
                _os_log_impl(&dword_227B19000, v23, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[feedSrcDM] aux timestamp: %llu us does not match the src timestamp: %llu", buf, 0x16u);
              }
            }
            unint64_t v26 = (float32x2_t *)sub_227C89D30(v75, v20);
            sub_227CA4C6C(v26, (float32x4_t *)buf, v27);
            long long v90 = *(_OWORD *)buf;
            BOOL v28 = (long long *)sub_227C89D30((unsigned __int16 *)(a1 + 4752), v19);
            if (&v89 != v28) {
              long long v89 = *v28;
            }
            float32x4_t v29 = sub_227CA1258(v79, (float32x4_t *)buf);
            *(double *)v30.i64 = sub_227CA4C0C((uint64_t)&v89, (float *)buf, &v80, v29);
            *(double *)v31.i64 = sub_227CA4C0C((uint64_t)&v80, (float *)&v90, &v81, v30);
            sub_227CA4C6C((float32x2_t *)&v81, &v82, v31);
            float32x4_t v88 = v82;
            unint64_t v14 = v17;
            if (!v17->i8[0]) {
              break;
            }
            unsigned int v15 = v18;
            *(double *)v32.i64 = sub_227CA4C6C(v18, &v81, v82);
            sub_227CA4C0C((uint64_t)&v88, v81.f32, &v82, v32);
            float32x4_t v87 = v82;
            float v33 = (float)(v21 - *(void *)(a1 + 6792)) * 0.000001;
            if (v33 >= 0.0000001)
            {
              v85.f32[0] = sub_227CA50D0(&v87) / v33;
              v85.f32[1] = v34 / v33;
              float v86 = v35 / v33;
              if ((v72 & 1) == 0)
              {
                float v86 = 0.0;
                float32x2_t v85 = 0;
              }
              sub_227C8ACBC(v17, &v85, v21);
              sub_227CA110C(v79, v21);
              uint64_t v36 = 0;
              float v37 = 0.0;
              do
              {
                float v37 = v37 + (float)(v85.f32[v36] * v85.f32[v36]);
                ++v36;
              }
              while (v36 != 3);
              float v38 = sqrtf(v37);
              uint64_t v39 = *(unsigned __int16 *)(a1 + 5658);
              unint64_t v40 = *(unsigned int *)(a1 + 5660);
              uint64_t v41 = *(unsigned __int16 *)(a1 + 5656);
              if (v41 + v39 >= v40) {
                uint64_t v42 = *(unsigned int *)(a1 + 5660);
              }
              else {
                uint64_t v42 = 0;
              }
              *(float *)(a1 + 5664 + 4 * (v41 + v39 - v42)) = v38;
              if (v40 <= v39)
              {
                if (v41 + 1 < v40) {
                  LOWORD(v40) = 0;
                }
                *(_WORD *)(a1 + 5656) = v41 + 1 - v40;
              }
              else
              {
                *(_WORD *)(a1 + 5658) = v39 + 1;
              }
              if (v95)
              {
                BOOL v43 = (int *)__p;
                unint64_t v44 = *((int *)__p + v12);
                if (v44 == -1)
                {
                  BOOL v55 = 0;
                }
                else
                {
                  unint64_t v45 = (float *)sub_227C9B9E4(v71, v44);
                  sub_227CA4C6C((float32x2_t *)(a1 + 6708), &v82, v46);
                  float v47 = sub_227C8E390(v82.f32);
                  float v49 = fmodf((float)(v48 - v45[1]) + 3.1416, 6.2832);
                  if (v49 < 0.0) {
                    float v49 = v49 + 6.2832;
                  }
                  float v50 = fabsf(v49 + -3.1416);
                  float v51 = *v45;
                  float v52 = fmodf((float)(v47 - *v45) + 3.1416, 6.2832);
                  if (v52 < 0.0) {
                    float v52 = v52 + 6.2832;
                  }
                  float v53 = fabsf(v52 + -3.1416);
                  BOOL v54 = v51 > 0.17453;
                  if (v50 <= 0.7854) {
                    BOOL v54 = 0;
                  }
                  BOOL v55 = v53 < 0.17453 && v54;
                }
                if (*(unsigned char *)(a1 + 6472) || v55)
                {
                  unint64_t v56 = v43[v12];
                  if (v56 != -1)
                  {
                    unint64_t v57 = (float *)sub_227C9B9E4(v71, v43[v12]);
                    if (*v57 > 0.17453)
                    {
                      float v58 = v57;
                      unint64_t v59 = (float32x2_t *)sub_227C9B9E4((unsigned __int16 *)(a1 + 1936), v56);
                      float v60 = 9.0;
                      if (v55) {
                        float v60 = 1.0;
                      }
                      *(float32x2_t *)v82.f32 = vmul_n_f32(*v59, v60);
                      unint64_t v61 = (float32x2_t *)sub_227C89D30(v75, v20);
                      sub_227CA1114(v79, v58, v82.f32, v61, (float32x2_t *)&v89, v21);
                      uint64_t v62 = *(void *)(a1 + 5600);
                      float v63 = 0.0;
                      float v64 = 0.0;
                      if (v62) {
                        float v64 = *(float *)(*(void *)(*(void *)(a1 + 5568)
                      }
                                                   + (((unint64_t)(v62 + *(void *)(a1 + 5592) - 1) >> 7) & 0x1FFFFFFFFFFFFF8))
                                       + 4 * ((v62 + *(void *)(a1 + 5592) - 1) & 0x3FF));
                      for (uint64_t i = 0; i != 3; ++i)
                        float v63 = v63 + (float)(v85.f32[i] * v85.f32[i]);
                      if (sqrtf(v63) < 0.87266 && v64 < 0.87266)
                      {
                        uint64_t v66 = 0;
                        float v67 = 0.0;
                        do
                        {
                          float v67 = v67 + (float)(v85.f32[v66] * v85.f32[v66]);
                          ++v66;
                        }
                        while (v66 != 3);
                        float v68 = sqrtf(v67);
                        BOOL v69 = v64 <= 0.5236 && v68 <= 0.5236;
                        float v70 = 9.0;
                        if (v69) {
                          float v70 = 1.0;
                        }
                        *(float32x2_t *)v81.f32 = vmul_n_f32(*(float32x2_t *)v82.f32, v70);
                        sub_227C8B7DC((uint64_t)v17, v58, (uint64_t)&v81, v21);
                      }
                    }
                  }
                }
              }
              goto LABEL_77;
            }
LABEL_80:
            if (++v12 == v73) {
              goto LABEL_13;
            }
          }
          sub_227C8AC98((uint64_t)v17);
          sub_227C8A958((uint64_t)v17, &v88, v21, 0.0017453, 0.017453);
LABEL_77:
          unsigned int v15 = v18;
          if (v18 != (float32x2_t *)&v88) {
            *(float32x4_t *)v18->f32 = v88;
          }
          *(void *)(a1 + 6792) = v21;
          unint64_t v14 = v17;
          goto LABEL_80;
        }
      }
    }
  }
LABEL_13:
  if (__p) {
    operator delete(__p);
  }
}

void sub_227C9C734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_227C9C79C(unsigned __int16 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(unsigned char *)a2 = 0;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(unsigned char *)(a2 + 40) = 0;
  if (!*((unsigned char *)a1 + 6176) || !a1[2173] || !a1[1517]) {
    return;
  }
  unint64_t v4 = a1 + 2176;
  unint64_t v5 = a1[2173] + (unint64_t)a1[2172] - 1;
  unint64_t v6 = *((unsigned int *)a1 + 1087);
  if (v5 < v6) {
    unint64_t v6 = 0;
  }
  unint64_t v7 = *(void *)&v4[4 * (v5 - v6)];
  uint64_t v8 = a1[1516];
  if (v7 < *(void *)&a1[4 * v8 + 1520]) {
    return;
  }
  unint64_t v9 = *((void *)a1 + 849);
  if (v7 <= v9) {
    return;
  }
  unint64_t v10 = a1[1517] + v8 - 1;
  unint64_t v11 = *((unsigned int *)a1 + 759);
  if (v10 < v11) {
    unint64_t v11 = 0;
  }
  if (*(void *)&a1[4 * (v10 - v11) + 1520] <= v9) {
    return;
  }
  unint64_t v12 = 0;
  unint64_t v13 = a1 + 2172;
  do
  {
    unint64_t v14 = (void *)sub_227C9B9E4(a1 + 1516, v12);
    unint64_t v15 = a1[1517];
    if (*v14 >= *(void *)&v4[4 * a1[2172]]) {
      break;
    }
    ++v12;
  }
  while (v12 < v15);
  if (v12 == v15) {
    return;
  }
  LODWORD(v16) = a1[2173];
  if (a1[2173])
  {
    unint64_t v17 = 0;
    do
    {
      unint64_t v18 = *(void *)sub_227C9B9E4(a1 + 2172, v17);
      unint64_t v19 = (unint64_t *)sub_227C9B9E4(a1 + 1516, v12);
      unint64_t v16 = a1[2173];
      if (v18 >= *v19) {
        break;
      }
      ++v17;
    }
    while (v17 < v16);
  }
  else
  {
    unint64_t v17 = 0;
  }
  if (v17 == v16) {
    return;
  }
  uint64_t v20 = *(void *)sub_227C9B9E4(a1 + 2172, v17);
  if (v20 != *(void *)sub_227C9B9E4(a1 + 1516, v12))
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29670);
    }
    uint64_t v23 = qword_2681B9A78;
    if (!os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG)) {
      return;
    }
    goto LABEL_32;
  }
  unint64_t v21 = a1[2173];
  if (v17 < v21)
  {
    while (v12 < a1[1517])
    {
      uint64_t v22 = (void *)sub_227C9B9E4(a1 + 2172, v17);
      unint64_t v21 = a1[2173];
      if (*v22 > *((void *)a1 + 849)) {
        break;
      }
      ++v17;
      ++v12;
      if (v17 >= v21) {
        break;
      }
    }
    unint64_t v21 = v21;
  }
  if (v17 == v21 || v12 == a1[1517]) {
    return;
  }
  uint64_t v27 = *(void *)sub_227C9B9E4(a1 + 2172, v17);
  if (v27 != *(void *)sub_227C9B9E4(a1 + 1516, v12))
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29670);
    }
    uint64_t v23 = qword_2681B9A78;
    if (!os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG)) {
      return;
    }
LABEL_32:
    uint64_t v24 = *(void *)sub_227C9B9E4(a1 + 1516, v12);
    unint64_t v25 = *(void *)sub_227C9B9E4(v13, v17);
    *(_DWORD *)buf = 134218752;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v24;
    *(_WORD *)&unsigned char buf[22] = 2048;
    unint64_t v53 = v17;
    __int16 v54 = 2048;
    unint64_t v55 = v25;
    unint64_t v26 = "[BarrelRoll]:[CMABarrelRoll]:[getPastMEKFUpdateIndices] Unexpected timestamp mismatch.indSrc: %zu, src: %llu, "
          "indAux: %zu, aux: %llu";
    goto LABEL_33;
  }
  unint64_t v28 = v17;
  unint64_t v29 = v12;
  if (v17 < a1[2173])
  {
    unint64_t v29 = v12;
    unint64_t v28 = v17;
    while (v29 < a1[1517])
    {
      uint64_t v30 = *(void *)sub_227C9B9E4(a1 + 2172, v28);
      if (v30 != *(void *)sub_227C9B9E4(a1 + 1516, v29)) {
        break;
      }
      ++v28;
      ++v29;
      if (v28 >= a1[2173]) {
        goto LABEL_51;
      }
    }
  }
  if (v28 && v29)
  {
LABEL_51:
    unint64_t v31 = v28 - 1;
    unint64_t v32 = v29 - 1;
    unint64_t v33 = v31 - v17;
    if (v31 < v17 || v32 < v12)
    {
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29670);
      }
      uint64_t v23 = qword_2681B9A78;
      if (!os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      *(_DWORD *)buf = 134218752;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v17;
      *(_WORD *)&unsigned char buf[22] = 2048;
      unint64_t v53 = v32;
      __int16 v54 = 2048;
      unint64_t v55 = v12;
      unint64_t v26 = "[BarrelRoll]:[CMABarrelRoll]:[getPastMEKFUpdateIndices] Unexpected index order.lastAuxInd: %zu, firstAuxInd:"
            " %zu, lastSrcInd: %zu, firstSrcInd: %zu";
    }
    else
    {
      if (v33 == v32 - v12)
      {
        *(unsigned char *)a2 = 1;
        *(void *)(a2 + 8) = v17;
        *(void *)(a2 + 16) = v12;
        *(void *)(a2 + 24) = v31;
        *(void *)(a2 + 32) = v32;
        if (a1[1])
        {
          unint64_t v34 = *(void *)sub_227C9B9E4(a1 + 2172, v17);
          float v35 = a1 + 4;
          unint64_t v36 = *a1 + (unint64_t)a1[1] - 1;
          unint64_t v37 = *((unsigned int *)a1 + 1);
          if (v36 < v37) {
            unint64_t v37 = 0;
          }
          if (v34 <= *(void *)&v35[4 * (v36 - v37)]
            && *(void *)sub_227C9B9E4(a1 + 2172, v31) >= *(void *)&v35[4 * *a1]
            && a1[1])
          {
            unint64_t v38 = 0;
            do
            {
              unint64_t v39 = *(void *)sub_227C9B9E4(a1, v38);
              unint64_t v40 = (unint64_t *)sub_227C9B9E4(a1 + 1516, v12);
              unint64_t v41 = a1[1];
              if (v39 >= *v40) {
                break;
              }
              ++v38;
            }
            while (v38 < v41);
            if (v38 != v41)
            {
              int v42 = v38;
              int v51 = -1;
              sub_227C9DB3C(buf, v33 + 1, &v51);
              BOOL v43 = *(_DWORD **)buf;
              *(void *)(a2 + 48) = *(void *)buf;
              unint64_t v44 = *(_DWORD **)&buf[8];
              *(_OWORD *)(a2 + 56) = *(_OWORD *)&buf[8];
              if (v44 != v43)
              {
                unint64_t v45 = v44 - v43;
                if (v45 <= 1) {
                  unint64_t v45 = 1;
                }
                unint64_t v46 = v45 - 1;
                do
                {
                  unint64_t v47 = v46;
                  uint64_t v48 = *(void *)sub_227C9B9E4(a1 + 1516, v12);
                  uint64_t v49 = v42;
                  if (v48 == *(void *)sub_227C9B9E4(a1, v42))
                  {
                    *BOOL v43 = v42++;
                    uint64_t v49 = v42;
                  }
                  else
                  {
                    unint64_t v50 = *(void *)sub_227C9B9E4(a1 + 1516, v12);
                    if (v50 > *(void *)sub_227C9B9E4(a1, v42)) {
                      break;
                    }
                  }
                  if (v49 == a1[1]) {
                    break;
                  }
                  unint64_t v46 = v47 - 1;
                  ++v12;
                  ++v43;
                }
                while (v47);
              }
              *(unsigned char *)(a2 + 40) = 1;
            }
          }
        }
        return;
      }
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29670);
      }
      uint64_t v23 = qword_2681B9A78;
      if (!os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      *(_DWORD *)buf = 134218752;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v17;
      *(_WORD *)&unsigned char buf[22] = 2048;
      unint64_t v53 = v32;
      __int16 v54 = 2048;
      unint64_t v55 = v12;
      unint64_t v26 = "[BarrelRoll]:[CMABarrelRoll]:[getPastMEKFUpdateIndices] Unexpected index delta.lastAuxInd: %zu, firstAuxInd:"
            " %zu, lastSrcInd: %zu, firstSrcInd: %zu";
    }
LABEL_33:
    _os_log_impl(&dword_227B19000, v23, OS_LOG_TYPE_DEBUG, v26, buf, 0x2Au);
  }
}

uint64_t sub_227C9CE98(unsigned __int16 *a1, float *a2, unint64_t *a3, float *a4)
{
  unint64_t v4 = a1[2173];
  unint64_t v5 = v4 - 3;
  if (v4 < 3) {
    return 0;
  }
  unint64_t v10 = a1 + 2172;
  unint64_t v11 = v4 - 1;
  uint64_t v12 = *(void *)sub_227C9B9E4(a1 + 2172, v4 - 1);
  unint64_t v13 = v4 - 2;
  uint64_t v14 = *(void *)sub_227C9B9E4(v10, v13);
  float v15 = (double)(v12 - v14) * 0.000001;
  if (v15 < 0.0000001) {
    return 0;
  }
  unint64_t v16 = a1 + 2376;
  uint64_t v17 = sub_227C89D30(v16, v11);
  unint64_t v18 = (float32x2_t *)sub_227C89D30(v16, v13);
  *(double *)v20.i64 = sub_227CA4C6C(v18, &v42, v19);
  sub_227CA4C0C(v17, v42.f32, &v43, v20);
  float v21 = sub_227CA50D0(&v43);
  float v23 = v22;
  float v25 = v24;
  uint64_t v26 = *(void *)sub_227C9B9E4(v10, v5);
  float v27 = (double)(v14 - v26) * 0.000001;
  if (v27 < 0.0000001) {
    return 0;
  }
  float v28 = v25 / v15;
  float v29 = v23 / v15;
  float v30 = v21 / v15;
  uint64_t v31 = sub_227C89D30(v16, v13);
  unint64_t v32 = (float32x2_t *)sub_227C89D30(v16, v5);
  *(double *)v34.i64 = sub_227CA4C6C(v32, &v42, v33);
  sub_227CA4C0C(v31, v42.f32, &v43, v34);
  float v35 = sub_227CA50D0(&v43) / v27;
  float v37 = v36 / v27;
  float v39 = v38 / v27;
  float v40 = (double)(v12 - v26) * 0.000001;
  *a2 = (float)(v30 - v35) / v40;
  a2[1] = (float)(v29 - v37) / v40;
  a2[2] = (float)(v28 - v39) / v40;
  *a3 = (unint64_t)(v14 + v12) >> 1;
  *a4 = (float)(v30 + v35) * 0.5;
  a4[1] = (float)(v29 + v37) * 0.5;
  a4[2] = (float)(v28 + v39) * 0.5;
  return 1;
}

void sub_227C9D0A8(unsigned __int16 *a1, float32x2_t *a2, float32x4_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v4 = (char *)a1 + 6971;
  if (a1[1])
  {
    unint64_t v5 = a1[1] + (unint64_t)*a1 - 1;
    unint64_t v6 = *((unsigned int *)a1 + 1);
    if (v5 < v6) {
      unint64_t v6 = 0;
    }
    double v7 = *(double *)&a1[4 * (v5 - v6) + 4];
  }
  else
  {
    double v7 = 0.0;
  }
  unint64_t v8 = *((void *)a1 + 868);
  *(double *)a3.i64 = (double)(LODWORD(v7) - v8) * 0.000001;
  a3.f32[0] = *(double *)a3.i64;
  float v9 = 0.0;
  if (*(void *)&v7 <= v8) {
    float v10 = 0.0;
  }
  else {
    float v10 = a3.f32[0];
  }
  a3.i32[0] = 15.0;
  if (v10 <= 15.0)
  {
    sub_227CA4CC4(a2, (uint64_t)(a1 + 3448), (float32x4_t *)buf, a3);
    float v11 = sub_227CA50D0((float32x4_t *)buf);
    uint64_t v12 = 0;
    *(float *)float32x4_t v19 = v11;
    v19[1] = v13;
    v19[2] = v14;
    do
    {
      float v9 = v9 + (float)(*(float *)&v19[v12] * *(float *)&v19[v12]);
      ++v12;
    }
    while (v12 != 3);
    float v15 = sqrtf(v9);
    if (v10 > 0.2 && v10 < 5.0)
    {
      if (v15 > 0.087266 && !*v4)
      {
        *unint64_t v4 = 1;
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC29670);
        }
        uint64_t v17 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349312;
          double v21 = v10;
          __int16 v22 = 2050;
          double v23 = (float)(v15 * 57.296);
          _os_log_impl(&dword_227B19000, v17, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[checkPencilDM6InitAnomaly] Detected cold start init anomaly. deltaFromSessionStartSeconds: %{public}.3f s, rollDeltaWillAndDidUpdateRad: %{public}.3f deg", buf, 0x16u);
        }
      }
    }
    else
    {
      *unint64_t v4 = 0;
      if (v10 < 15.0 && v15 > 0.087266) {
        sub_227C9FFDC((uint64_t)(a1 + 3088));
      }
    }
    if (*v4 && !v4[2905])
    {
      v4[2905] = 1;
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29670);
      }
      unint64_t v18 = qword_2681B9A78;
      if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349568;
        double v21 = v7;
        __int16 v22 = 2050;
        double v23 = v10;
        __int16 v24 = 2050;
        double v25 = (float)(v15 * 57.296);
        _os_log_impl(&dword_227B19000, v18, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedSrcDM] Will perform soft reset on the first hover-or-out opportunity. Timestamp: %{public}llu us, durationFromSessionStartSeconds: %{public}.3f s,  rollDeltaWillAndDidUpdateRad: %{public}.3f deg", buf, 0x20u);
      }
    }
  }
  else
  {
    *unint64_t v4 = 0;
  }
}

void sub_227C9D380(uint64_t a1@<X0>, float32x4_t *a2@<X8>)
{
  if (*(unsigned char *)(a1 + 6921))
  {
    float32x4_t v4 = *(float32x4_t *)(a1 + 6872);
    *a2 = v4;
    *(double *)v5.i64 = sub_227CA4C6C((float32x2_t *)(a1 + 6924), &v7, v4);
    *(double *)v6.i64 = sub_227CA4C0C((uint64_t)a2, v7.f32, &v8, v5);
    if (&v8 != a2)
    {
      float32x4_t v6 = v8;
      *a2 = v8;
    }
    sub_227C9D0A8((unsigned __int16 *)a1, (float32x2_t *)a2, v6);
  }
  else
  {
    a2->i64[0] = 0;
    a2->i64[1] = 0x3F80000000000000;
  }
}

os_log_t sub_227C9D418()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_2681B9A78 = (uint64_t)result;
  return result;
}

void *sub_227C9D448(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  sub_227C9D508(a1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  sub_227C9D508(a1 + 3, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 3);
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = 0;
  sub_227C9D508(a1 + 6, *(const void **)a4, *(void *)(a4 + 8), (uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3);
  return a1;
}

void sub_227C9D4D4(_Unwind_Exception *exception_object)
{
  float32x4_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v4;
    operator delete(v4);
  }
  float32x4_t v5 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

void *sub_227C9D508(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    float32x4_t v6 = result;
    os_log_t result = sub_227B8B858(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      os_log_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_227C9D568(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_227C9D584(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *sub_227C9D61C(void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    float32x4_t v4 = (void *)result[3];
    float32x4_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        os_log_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        os_log_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      os_log_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_227C9D87C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_227B1AEE0(a1);
}

uint64_t sub_227C9D888(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x400) {
    a2 = 1;
  }
  if (v2 < 0x800) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 1024;
  }
  return v4 ^ 1u;
}

os_log_t sub_227C9D8E8()
{
  os_log_t result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_2681B9AA8 = (uint64_t)result;
  return result;
}

void sub_227C9D918()
{
  exceptiounint64_t n = __cxa_allocate_exception(8uLL);
  *exceptiounint64_t n = &unk_26DC296D8;
  __cxa_throw(exception, (struct type_info *)&unk_26DC296B0, (void (*)(void *))std::exception::~exception);
}

void sub_227C9D968(std::exception *a1)
{
  std::exception::~exception(a1);

  JUMPOUT(0x22A6850E0);
}

uint64_t *sub_227C9D9A0@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t **a6@<X8>)
{
  uint64_t v11 = a5;
  if (result != a2)
  {
    float v9 = a3;
    if (a3 != a4)
    {
      float v10 = result;
      do
      {
        if (*v10 >= (unint64_t)*v9)
        {
          if (*v9 >= (unint64_t)*v10) {
            os_log_t result = sub_227C9DA4C(&v11, v10++);
          }
          ++v9;
        }
        else
        {
          ++v10;
        }
      }
      while (v10 != a2 && v9 != a4);
      a5 = v11;
    }
  }
  *a6 = a2;
  a6[1] = a4;
  a6[2] = (uint64_t *)a5;
  return result;
}

uint64_t *sub_227C9DA4C(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  float32x4_t v5 = *(void **)(*a1 + 8);
  float32x4_t v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    size_t v8 = *(void **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      sub_227B8B89C();
    }
    uint64_t v11 = *v6 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      int v13 = (char *)sub_227B8B8B4((uint64_t)v6, v12);
      size_t v8 = *(void **)v4;
      float32x4_t v5 = *(void **)(v4 + 8);
    }
    else
    {
      int v13 = 0;
    }
    int v14 = &v13[8 * v9];
    float v15 = &v13[8 * v12];
    *(void *)int v14 = *a2;
    uint64_t v7 = v14 + 8;
    while (v5 != v8)
    {
      uint64_t v16 = *--v5;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *float32x4_t v5 = *a2;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

void *sub_227C9DB3C(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_227B8BB74(a1, a2);
    float32x4_t v6 = (_DWORD *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_227C9DBA4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

float sub_227C9DBC0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x263EFF910], a2, a3, a4);
  uint64_t v8 = objc_msgSend_currentCalendar(MEMORY[0x263EFF8F0], v5, v6, v7);
  unint64_t v10 = objc_msgSend_components_fromDate_(v8, v9, 252, v4);
  id v14 = (id)objc_msgSend_copy(v10, v11, v12, v13);
  objc_msgSend_setDay_(v14, v15, 1, v16);
  objc_msgSend_setMonth_(v14, v17, 1, v18);
  id v19 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v22 = (id)objc_msgSend_initWithCalendarIdentifier_(v19, v20, *MEMORY[0x263EFF3F8], v21);
  uint64_t v25 = objc_msgSend_dateFromComponents_(v22, v23, (uint64_t)v14, v24);
  float v27 = objc_msgSend_components_fromDate_toDate_options_(v22, v26, 16, v25, v4, 0);
  double v31 = (double)objc_msgSend_year(v10, v28, v29, v30);
  double v35 = fabs((double)(objc_msgSend_day(v27, v32, v33, v34) + 1));
  return v35 / dbl_227CC5EA0[(objc_msgSend_year(v10, v36, v37, v38) & 3) == 0] + v31;
}

void sub_227C9DCC4(uint64_t a1)
{
  *(_OWORD *)(a1 + 48) = xmmword_227CC5D30;
  *(_OWORD *)(a1 + 64) = xmmword_227CC5D40;
  *(_OWORD *)(a1 + 80) = xmmword_227CC5EB0;
  unint64_t v2 = *(void ***)(a1 + 104);
  uint64_t v3 = *(void *)(a1 + 112);
  *(void *)(a1 + 136) = 0;
  unint64_t v4 = v3 - (void)v2;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v5 = *(void *)(a1 + 112);
      unint64_t v2 = (void **)(*(void *)(a1 + 104) + 8);
      *(void *)(a1 + 104) = v2;
      unint64_t v4 = v5 - (void)v2;
    }
    while (v4 > 0x10);
  }
  if (v4 >> 3 == 1)
  {
    uint64_t v6 = 512;
    goto LABEL_7;
  }
  if (v4 >> 3 == 2)
  {
    uint64_t v6 = 1024;
LABEL_7:
    *(void *)(a1 + 128) = v6;
  }
  *(unsigned char *)(a1 + 144) = 1;
}

void sub_227C9DD64(uint64_t a1, unint64_t a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, unsigned __int16 *a6, uint64_t a7, unint64_t **a8, void *a9, void *a10)
{
  unint64_t v10 = *a8;
  uint64_t v11 = a8[1];
  if (*a8 == v11) {
    return;
  }
  if (*(_WORD *)(a7 + 2)) {
    BOOL v20 = *(_DWORD *)(a7 + 4) == *(unsigned __int16 *)(a7 + 2);
  }
  else {
    BOOL v20 = 0;
  }
  if (v20)
  {
    unint64_t v22 = 0;
    float v23 = 0.0;
    do
    {
      float v23 = v23 + *(float *)sub_227C8764C((unsigned __int16 *)a7, v22++);
      unint64_t v24 = *(unsigned __int16 *)(a7 + 2);
    }
    while (v22 < v24);
    unint64_t v10 = *a8;
    uint64_t v11 = a8[1];
    float v25 = v23 / (float)v24;
    BOOL v21 = v25 > 0.05236;
    *(float *)(a1 + 148) = v25;
  }
  else
  {
    BOOL v21 = 0;
  }
  if ((unint64_t)((char *)v11 - (char *)v10) < 0x40)
  {
    char v26 = 2;
LABEL_25:
    *(unsigned char *)(a1 + 145) = v26;
    sub_227C9DFC0(a1, 0, a2);
    return;
  }
  while (v10 != v11)
  {
    if (!*(unsigned char *)sub_227C97E40(a6, *v10))
    {
      char v26 = 3;
      goto LABEL_25;
    }
    ++v10;
  }
  if (!v21)
  {
    char v26 = 4;
    goto LABEL_25;
  }
  sub_227C9E0D8(a1, a3, a4, a5, a8, a9, a10);
  if ((float)(*(float *)(a1 + 52) - *(float *)(a1 + 48)) < 0.0034907
    || (v27.f32[0] = *(float *)(a1 + 64) - *(float *)(a1 + 60), v27.f32[0] < 0.0034907))
  {
    char v26 = 5;
    goto LABEL_25;
  }
  sub_227C9E590(a1, a3, (uint64_t *)a8, (uint64_t)v28, v27);
  if (sub_227C9E6C4(a1, v28))
  {
    *(unsigned char *)(a1 + 145) = 1;
    sub_227C9DFC0(a1, 1, a2);
    if (*(void *)(a1 + 136) == 16)
    {
      ++*(void *)(a1 + 128);
      *(void *)(a1 + 136) = 15;
      sub_227C9D888(a1 + 96, 1);
    }
    sub_227C94D3C((void *)(a1 + 96), &v29);
  }
  else
  {
    *(unsigned char *)(a1 + 145) = 6;
    sub_227C9DFC0(a1, 0, a2);
  }
}

void sub_227C9DFC0(uint64_t a1, int a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(unsigned __int8 *)(a1 + 144) != a2)
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC296F0);
    }
    uint64_t v6 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *(unsigned __int8 *)(a1 + 144);
      v8[0] = 67109632;
      v8[1] = v7;
      __int16 v9 = 1024;
      int v10 = a2;
      __int16 v11 = 2048;
      double v12 = (float)((float)a3 * 0.000001);
      _os_log_impl(&dword_227B19000, v6, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAPencilRingSensorTrustModel]:[setTrustPencilBool] Changed fTrustPencilRingSensorBool from %d to %d, t: %.6f s", (uint8_t *)v8, 0x18u);
    }
    *(unsigned char *)(a1 + 144) = a2;
  }
}

float sub_227C9E0D8(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, void *a5, void *a6, void *a7)
{
  *(_OWORD *)(a1 + 48) = xmmword_227CC5D30;
  *(_OWORD *)(a1 + 64) = xmmword_227CC5D40;
  *(_OWORD *)(a1 + 80) = xmmword_227CC5EB0;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681BAE68, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681BAE68))
  {
    qword_2681BAE58 = 0x3F80000000000000;
    dword_2681BAE60 = 0;
    __cxa_guard_release(&qword_2681BAE68);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681BAE80, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681BAE80))
  {
    qword_2681BAE70 = 0;
    dword_2681BAE78 = 1065353216;
    __cxa_guard_release(&qword_2681BAE80);
  }
  *(void *)(a1 + 8) = *(void *)a1;
  sub_227C9E81C((void **)a1, (uint64_t)(a5[1] - *a5) >> 3);
  *(void *)(a1 + 32) = *(void *)(a1 + 24);
  unint64_t v57 = (void **)(a1 + 24);
  sub_227C9E81C((void **)(a1 + 24), (uint64_t)(a5[1] - *a5) >> 3);
  if (a5[1] == *a5)
  {
    unint64_t v55 = 0;
    float v50 = *(float *)(a1 + 80);
    float v51 = *(float *)(a1 + 92);
    float v52 = *(float *)(a1 + 56);
    float v54 = *(float *)(a1 + 68);
  }
  else
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = (float32x2_t *)sub_227C89D30(a3, *(void *)(*a6 + 8 * v12));
      uint64_t v14 = sub_227C89D30(a4, *(void *)(*a7 + 8 * v12));
      *(double *)v16.i64 = sub_227CA4C6C(v13, &v60, v15);
      *(double *)v17.i64 = sub_227CA4C0C(v14, v60.f32, &v61, v16);
      sub_227CA4C6C((float32x2_t *)&v61, &v60, v17);
      float v18 = sub_227CA4ED8(v60.f32, *(float *)&qword_2681BAE58, *((float *)&qword_2681BAE58 + 1), *(float *)&dword_2681BAE60);
      float v20 = v19;
      float v22 = acosf(fmaxf(fminf((float)((float)(v21 * *(float *)&dword_2681BAE78) + (float)(v19 * *((float *)&qword_2681BAE70 + 1)))+ (float)(v18 * *(float *)&qword_2681BAE70), 1.0), -1.0));
      float v23 = v22;
      float v25 = *(float **)(a1 + 8);
      unint64_t v24 = *(void *)(a1 + 16);
      if ((unint64_t)v25 >= v24)
      {
        float32x4_t v27 = *(float **)a1;
        uint64_t v28 = ((uint64_t)v25 - *(void *)a1) >> 2;
        unint64_t v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 62) {
          sub_227B8B89C();
        }
        uint64_t v30 = v24 - (void)v27;
        if (v30 >> 1 > v29) {
          unint64_t v29 = v30 >> 1;
        }
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v31 = v29;
        }
        if (v31)
        {
          unint64_t v32 = (char *)sub_227B8BBB8(a1 + 16, v31);
          float32x4_t v27 = *(float **)a1;
          float v25 = *(float **)(a1 + 8);
        }
        else
        {
          unint64_t v32 = 0;
        }
        uint64_t v33 = (float *)&v32[4 * v28];
        *uint64_t v33 = v23;
        char v26 = v33 + 1;
        while (v25 != v27)
        {
          int v34 = *((_DWORD *)v25-- - 1);
          *((_DWORD *)v33-- - 1) = v34;
        }
        *(void *)a1 = v33;
        *(void *)(a1 + 8) = v26;
        *(void *)(a1 + 16) = &v32[4 * v31];
        if (v27) {
          operator delete(v27);
        }
      }
      else
      {
        *float v25 = v22;
        char v26 = v25 + 1;
      }
      *(void *)(a1 + 8) = v26;
      float v35 = atan2f(v20, v18);
      float v36 = v35;
      uint64_t v38 = *(float **)(a1 + 32);
      unint64_t v37 = *(void *)(a1 + 40);
      if ((unint64_t)v38 >= v37)
      {
        float v40 = (float *)*v57;
        uint64_t v41 = ((char *)v38 - (unsigned char *)*v57) >> 2;
        unint64_t v42 = v41 + 1;
        if ((unint64_t)(v41 + 1) >> 62) {
          sub_227B8B89C();
        }
        uint64_t v43 = v37 - (void)v40;
        if (v43 >> 1 > v42) {
          unint64_t v42 = v43 >> 1;
        }
        if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v44 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v44 = v42;
        }
        if (v44)
        {
          unint64_t v45 = (char *)sub_227B8BBB8(a1 + 40, v44);
          float v40 = *(float **)(a1 + 24);
          uint64_t v38 = *(float **)(a1 + 32);
        }
        else
        {
          unint64_t v45 = 0;
        }
        unint64_t v46 = (float *)&v45[4 * v41];
        *unint64_t v46 = v36;
        float v39 = v46 + 1;
        while (v38 != v40)
        {
          int v47 = *((_DWORD *)v38-- - 1);
          *((_DWORD *)v46-- - 1) = v47;
        }
        *(void *)(a1 + 24) = v46;
        *(void *)(a1 + 32) = v39;
        *(void *)(a1 + 40) = &v45[4 * v44];
        if (v40) {
          operator delete(v40);
        }
      }
      else
      {
        *uint64_t v38 = v35;
        float v39 = v38 + 1;
      }
      *(void *)(a1 + 32) = v39;
      float v48 = *(float *)sub_227C9B9E4(a2, *(void *)(*a5 + 8 * v12));
      float v49 = *(float *)(sub_227C9B9E4(a2, *(void *)(*a5 + 8 * v12)) + 4);
      float v50 = v23 + *(float *)(a1 + 80);
      *(float *)(a1 + 80) = v50;
      float v51 = v36 + *(float *)(a1 + 92);
      *(float *)(a1 + 92) = v51;
      float v52 = v48 + *(float *)(a1 + 56);
      *(float *)(a1 + 56) = v52;
      float v53 = *(float *)(a1 + 72);
      float v54 = v49 + *(float *)(a1 + 68);
      *(float *)(a1 + 68) = v54;
      if (v23 < v53) {
        *(float *)(a1 + 72) = v23;
      }
      if (v36 < *(float *)(a1 + 84)) {
        *(float *)(a1 + 84) = v36;
      }
      if (v48 < *(float *)(a1 + 48)) {
        *(float *)(a1 + 48) = v48;
      }
      if (v49 < *(float *)(a1 + 60)) {
        *(float *)(a1 + 60) = v49;
      }
      if (v23 > *(float *)(a1 + 76)) {
        *(float *)(a1 + 76) = v23;
      }
      if (v36 > *(float *)(a1 + 88)) {
        *(float *)(a1 + 88) = v36;
      }
      if (v48 > *(float *)(a1 + 52)) {
        *(float *)(a1 + 52) = v48;
      }
      if (v49 > *(float *)(a1 + 64)) {
        *(float *)(a1 + 64) = v49;
      }
      ++v12;
      unint64_t v55 = (uint64_t)(a5[1] - *a5) >> 3;
    }
    while (v55 > v12);
  }
  *(float *)(a1 + 80) = v50 / (float)v55;
  *(float *)(a1 + 92) = v51 / (float)v55;
  *(float *)(a1 + 56) = v52 / (float)v55;
  float result = v54 / (float)v55;
  *(float *)(a1 + 68) = result;
  return result;
}

float32x4_t sub_227C9E590@<Q0>(uint64_t a1@<X0>, unsigned __int16 *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>, float32x4_t a5@<Q1>)
{
  float v7 = *(float *)(a1 + 84);
  float v6 = *(float *)(a1 + 88);
  float v9 = *(float *)(a1 + 60);
  float v8 = *(float *)(a1 + 64);
  uint64_t v10 = *a3;
  if (a3[1] == *a3)
  {
    unint64_t v17 = 0;
    float32x4_t v15 = 0uLL;
  }
  else
  {
    unint64_t v14 = 0;
    float32x4_t v15 = 0uLL;
    do
    {
      float32x4_t v19 = v15;
      float v16 = *(float *)sub_227C9B9E4(a2, *(void *)(v10 + 8 * v14));
      a5.f32[0] = *(float *)(*(void *)(a1 + 24) + 4 * v14)
                - *(float *)(sub_227C9B9E4(a2, *(void *)(*a3 + 8 * v14)) + 4);
      a5.f32[1] = a5.f32[0] - (float)(*(float *)(a1 + 92) - *(float *)(a1 + 68));
      a5.f32[2] = *(float *)(*(void *)a1 + 4 * v14) - v16;
      a5.f32[3] = a5.f32[2] - (float)(*(float *)(a1 + 80) - *(float *)(a1 + 56));
      float32x4_t v15 = vmlaq_f32(v19, a5, a5);
      ++v14;
      uint64_t v10 = *a3;
      unint64_t v17 = (a3[1] - *a3) >> 3;
    }
    while (v17 > v14);
  }
  a5.f32[0] = (float)v17;
  *(float *)a4 = vabds_f32(v8 - v9, v6 - v7);
  float32x4_t result = vsqrtq_f32(vdivq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)a5.f32, 0)));
  *(float32x4_t *)(a4 + 4) = result;
  return result;
}

uint64_t sub_227C9E6C4(uint64_t a1, float *a2)
{
  if (*(unsigned char *)(a1 + 144)) {
    float v3 = 1.0;
  }
  else {
    float v3 = *(float *)"fff?";
  }
  if (*(void *)(a1 + 136))
  {
    sub_227C92464((uint64_t)v15, (void *)(a1 + 96));
    float v4 = fminf(sub_227C94DC4(v15), 0.087266);
    sub_227C923BC(v15);
  }
  else
  {
    float v4 = 0.17453;
  }
  double v5 = v3;
  double v6 = v3 * *(double *)"";
  BOOL v7 = a2[3] >= (float)(v3 * v4) || v6 <= a2[4];
  double v8 = *a2;
  double v9 = a2[2];
  if (!v7 && v5 * 0.043633231 > v8 && v6 > v9) {
    return 1;
  }
  double v12 = v5 * 0.00872664619;
  BOOL v13 = v5 * 0.0872664619 > a2[4];
  double v14 = v5 * 0.00349065848;
  if (v12 <= v8) {
    BOOL v13 = 0;
  }
  return v14 > v9 && v13;
}

void sub_227C9E808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_227C9E81C(void **a1, unint64_t a2)
{
  float v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_227B8B89C();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    double v6 = (char *)sub_227B8BBB8(v3, a2);
    BOOL v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    double v9 = &v6[4 * v8];
    uint64_t v10 = (char *)*a1;
    __int16 v11 = (char *)a1[1];
    double v12 = v7;
    if (v11 != *a1)
    {
      double v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

os_log_t sub_227C9E8C4()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_2681B9A78 = (uint64_t)result;
  return result;
}

uint64_t sub_227C9E8F4(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 16) = 0;
  int v4 = 0;
  sub_227C9FCD4(a1 + 32, (void (*)(uint64_t, uint64_t, void))sub_227C9E9C4, (uint64_t)&v4, 0x2710uLL);
  *(void *)(a1 + 88) = v2;
  *(void *)(a1 + 96) = a1 + 56;
  *(void *)(a1 + 104) = 10000;
  *(unsigned char *)(a1 + 112) = 1;
  *(void *)(a1 + 124) = 0;
  *(void *)(a1 + 116) = 0;
  *(void *)(a1 + 132) = 0x4120000000000000;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_DWORD *)(a1 + 176) = 0;
  *(unsigned char *)(a1 + 180) = 1;
  *(void *)(a1 + 184) = 1;
  *(_OWORD *)(a1 + 192) = xmmword_227CC5EF0;
  *(_DWORD *)(a1 + 208) = 0;
  sub_227C9EB4C(a1);
  return a1;
}

void sub_227C9E9B0(_Unwind_Exception *a1)
{
  sub_227C9BEC8(v1);
  _Unwind_Resume(a1);
}

void sub_227C9E9C4(void *a1, float *a2, unint64_t a3)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681BAE90, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681BAE90))
  {
    *(float *)&int v22 = 6.28318531 / (double)a3;
    dword_2681BAE88 = v22;
    __cxa_guard_release(&qword_2681BAE90);
  }
  if (a3)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      float v8 = *(float *)&dword_2681BAE88;
      float v9 = *a2;
      sub_227C9FB24();
      float v11 = v9 + (float)(v10 * 0.5);
      if (sub_227C9FBDC() >= 0.4)
      {
        sub_227C9FB24();
        float v13 = v11;
        if (v11 >= (float)(v14 * 0.5))
        {
          sub_227C9FB24();
          float v13 = v15 * 0.5;
        }
      }
      else
      {
        float v12 = fminf(v11, 5.0);
        float v13 = v12 + (float)((float)(v12 * -2.0) * sub_227C9FBDC());
      }
      float v16 = v8 * (float)v7;
      unint64_t v17 = (float *)(*a1 + v6);
      float v17[2] = v13;
      float v18 = sqrtf((float)(v11 * v11) - (float)(v13 * v13));
      __float2 v19 = __sincosf_stret(v16);
      *unint64_t v17 = v19.__cosval * v18;
      v17[1] = v19.__sinval * v18;
      sub_227C9FB24();
      *(float *)(*a1 + v6 + 12) = v20 * 0.5;
      sub_227C9FB24();
      *(float *)(*a1 + v6 + 16) = v21 * 0.5;
      ++v7;
      v6 += 20;
    }
    while (a3 != v7);
  }
}

void sub_227C9EB4C(uint64_t a1)
{
  sub_227CA48B4(0x2B73049Cu, 1, 1, 0, 0, 0);
  *(_DWORD *)sub_227C8A280((uint64_t)&v18, 0) = 0;
  *(_DWORD *)sub_227C8A280((uint64_t)&v18, 1uLL) = 0;
  if (*(void *)(a1 + 104))
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      int v4 = *(_DWORD *)(**(void **)(a1 + 88) + v2);
      *(_DWORD *)sub_227C8A280((uint64_t)&v16, 0) = v4;
      int v5 = *(_DWORD *)(**(void **)(a1 + 88) + v2 + 4);
      *(_DWORD *)sub_227C8A280((uint64_t)&v16, 1uLL) = v5;
      float v7 = v16;
      float v6 = v17;
      float v8 = sqrtf((float)(v7 * v7) + (float)(v6 * v6));
      if (v8 > 0.00000011921)
      {
        float v7 = v16 / v8;
        float v6 = v17 / v8;
      }
      float v16 = v7;
      float v17 = v6;
      float v9 = *(float *)sub_227C8A280((uint64_t)&v16, 0);
      float v10 = (float *)sub_227C8A280((uint64_t)&v18, 0);
      *float v10 = v9 + *v10;
      float v11 = *(float *)sub_227C8A280((uint64_t)&v16, 1uLL);
      float v12 = (float *)sub_227C8A280((uint64_t)&v18, 1uLL);
      *float v12 = v11 + *v12;
      ++v3;
      unint64_t v13 = *(void *)(a1 + 104);
      v2 += 20;
    }
    while (v3 < v13);
    float v14 = (float)v13;
  }
  else
  {
    float v14 = 0.0;
  }
  float v15 = sqrtf((float)(v18 * v18) + (float)(v19 * v19)) / v14;
  *(float *)(a1 + 136) = sqrtf((float)(1.0 - v15) + (float)(1.0 - v15));
  sub_227CA48B4(0x2B73049Cu, 2, 1, 0, 0, 0);
}

void sub_227C9ECFC(uint64_t a1, unint64_t a2)
{
  int v4 = 0;
  sub_227C9ED58(a1 + 32, (void (*)(uint64_t, uint64_t, void))sub_227C9E9C4, (uint64_t)&v4, a2);
  *(void *)(a1 + 104) = a2;
  sub_227C9EB4C(a1);
}

void sub_227C9ED58(uint64_t a1, void (*a2)(uint64_t, uint64_t, void), uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    *(void *)(a1 + 48) = a4;
    float v8 = *(void **)a1;
    if (v8)
    {
      *(void *)(a1 + 8) = v8;
      operator delete(v8);
    }
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    sub_227C9FD34((void **)a1, a4);
    float v9 = *(void **)(a1 + 24);
    if (v9)
    {
      *(void *)(a1 + 32) = v9;
      operator delete(v9);
    }
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
    sub_227C9FE20((void **)(a1 + 24), a4);
    a2(a1, a3, *(void *)(a1 + 48));
    sub_227C9FEC8(a1);
  }
  else
  {
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29710);
    }
    float v10 = qword_2681B9A88;
    if (os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)float v11 = 0;
      _os_log_impl(&dword_227B19000, v10, OS_LOG_TYPE_FAULT, "Number of particles must be nonzero", v11, 2u);
    }
  }
}

void sub_227C9EE94(uint64_t a1, float32x2_t *a2, double a3)
{
  double v4 = *(double *)(a1 + 144);
  if (v4 <= 0.0)
  {
    float v6 = 0.0;
  }
  else
  {
    float v5 = a3 - v4;
    float v6 = v5;
  }
  float32x2_t v7 = *a2;
  float32x2_t v8 = vadd_f32(*(float32x2_t *)(a1 + 160), vmul_n_f32(*a2, v6));
  *(float32x2_t *)(a1 + 152) = *a2;
  *(float32x2_t *)(a1 + 160) = v8;
  v8.f32[0] = v6 + *(float *)(a1 + 168);
  *(_DWORD *)(a1 + 168) = v8.i32[0];
  *(double *)(a1 + 144) = a3;
  if (v8.f32[0] <= 0.25)
  {
    if (*(unsigned char *)(a1 + 112))
    {
      float v9 = v6;
      sub_227C9F038((void *)(a1 + 32), (uint64_t)&v10);
      float v6 = v9;
      *(_OWORD *)(a1 + 116) = v10;
      *(_DWORD *)(a1 + 132) = v11;
    }
    *(float *)&long long v10 = v6;
    *(void *)((char *)&v10 + 4) = *(void *)(a1 + 152);
    BYTE12(v10) = 0;
    uint64_t v11 = 0;
    sub_227C9F09C((float32x2_t *)(a1 + 116), (uint64_t)&v10);
  }
  else
  {
    sub_227C9EF80((float32x2_t *)a1, -1.0, *(double *)&v7);
    sub_227C9F038((void *)(a1 + 32), (uint64_t)&v10);
    *(_OWORD *)(a1 + 116) = v10;
    *(_DWORD *)(a1 + 132) = v11;
  }
  *(unsigned char *)(a1 + 112) = 0;
}

float32_t sub_227C9EF80(float32x2_t *a1, float a2, double a3)
{
  LODWORD(a3) = a1[21].i32[0];
  if (*(float *)&a3 > 0.0)
  {
    __int32 v7 = a1[21].i32[0];
    float32x2_t v8 = vdiv_f32(a1[20], (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0));
    char v9 = 1;
    float v10 = a1[22].f32[0] - a1[21].f32[1];
    float v11 = a2;
    if (a1[10])
    {
      uint64_t v4 = 0;
      unint64_t v5 = 0;
      do
      {
        sub_227C9F09C((float32x2_t *)(*(void *)&a1[4] + v4), (uint64_t)&v7);
        ++v5;
        v4 += 20;
      }
      while (v5 < *(void *)&a1[10]);
    }
    sub_227C9EB4C((uint64_t)a1);
  }
  sub_227C9F898((uint64_t)a1);
  a1[21].i32[0] = 0;
  a1[20] = 0;
  float32_t result = a1[22].f32[0];
  a1[21].f32[1] = result;
  return result;
}

void *sub_227C9F038@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  uint64_t v4 = result[6];
  do
  {
    if (v4)
    {
      unint64_t v5 = (double *)result[3];
      float v6 = *(float *)(a2 + 4 * v3);
      __int32 v7 = (float *)(*result + v2);
      uint64_t v8 = v4;
      do
      {
        float v9 = *v7;
        v7 += 5;
        double v10 = v9;
        double v11 = *v5++;
        float v6 = v6 + v10 * v11;
        --v8;
      }
      while (v8);
      *(float *)(a2 + 4 * v3) = v6;
    }
    ++v3;
    v2 += 4;
  }
  while (v3 != 5);
  return result;
}

void sub_227C9F09C(float32x2_t *a1, uint64_t a2)
{
  float v2 = *(float *)a2;
  if (*(float *)a2 != 0.0)
  {
    unint64_t v5 = *(void *)(a2 + 4);
    unint64_t v30 = v5;
    if (*(unsigned char *)(a2 + 12))
    {
      float v6 = sqrtf(0.002 / v2);
      sub_227C9FB24();
      float v8 = v7;
      float v9 = (float *)sub_227C8A280((uint64_t)&v30, 0);
      *float v9 = *v9 + (float)((float)(v6 * 4.0) * v8);
      sub_227C9FB24();
      float v11 = v10;
      float v12 = (float *)sub_227C8A280((uint64_t)&v30, 1uLL);
      *float v12 = *v12 + (float)((float)(v6 * 4.0) * v11);
      sub_227C9FB24();
      float v14 = v6 * v13;
      float v15 = sub_227C9FBDC();
      float v16 = -1.0;
      if (v15 >= 0.005) {
        float v16 = 1.0;
      }
      float v2 = *(float *)a2;
      float v18 = *((float *)&v30 + 1);
      float v17 = *(float *)&v30;
    }
    else
    {
      float v18 = *((float *)&v5 + 1);
      float v17 = *(float *)&v5;
      float v14 = 0.0;
      float v16 = 1.0;
    }
    *(float *)&unsigned int v19 = v2 * v17;
    *(float *)&unsigned int v20 = v2 * v18;
    float v22 = a1[1].f32[0];
    float v21 = a1[1].f32[1];
    float v23 = a1->f32[1];
    float32_t v24 = (float)(v2 * v21) + *(float *)&v19 * 0.5 * v2 + a1->f32[0];
    a1->f32[0] = v24;
    float v25 = a1[2].f32[0];
    double v26 = (float)(v25 * *(float *)a2) + *(float *)&v20 * 0.5 * *(float *)a2;
    unint64_t v30 = __PAIR64__(v20, v19);
    *(float *)&double v26 = v26 + v23;
    a1->i32[1] = LODWORD(v26);
    a1[1].f32[0] = v16 * (float)((float)(v14 * v2) + (float)(v22 + *(float *)(a2 + 16)));
    a1[1].f32[1] = *(float *)&v19 + v21;
    a1[2].f32[0] = v25 + *(float *)&v20;
    if (*(float *)(a2 + 20) > 0.0 && sub_227C9FBDC() < 0.05)
    {
      float v27 = sqrtf((float)(a1->f32[0] * a1->f32[0]) + (float)(a1->f32[1] * a1->f32[1]));
      sub_227C9FB24();
      float v29 = (float)((float)(*(float *)(a2 + 20) + (float)(v28 * 0.1)) * (float)(*(float *)(a2 + 20) + (float)(v28 * 0.1)))
          - (float)(a1[1].f32[0] * a1[1].f32[0]);
      if (v29 < 0.0) {
        float v29 = 0.0;
      }
      *a1 = vmul_n_f32(*a1, sqrtf(v29) / v27);
    }
  }
}

uint64_t sub_227C9F2A0(uint64_t result, float a2)
{
  if (*(unsigned char *)(result + 180))
  {
    *(float *)(result + 172) = a2;
    *(unsigned char *)(result + 180) = 0;
  }
  *(float *)(result + 176) = a2;
  return result;
}

void sub_227C9F2B8(uint64_t a1, int a2, float a3, double a4, float a5)
{
  *(float *)a1 = a3;
  *(float *)(a1 + 4) = a5;
  if (a2)
  {
    sub_227C9ED58(a1 + 32, (void (*)(uint64_t, uint64_t, void))sub_227C9E9C4, a1, *(void *)(a1 + 104));
    sub_227C9EB4C(a1);
    *(_DWORD *)(a1 + 168) = 0;
    *(void *)(a1 + 160) = 0;
    *(_DWORD *)(a1 + 172) = *(_DWORD *)(a1 + 176);
  }

  sub_227C9F340(a1, 0, a4);
}

void sub_227C9F340(uint64_t a1, int a2, double a3)
{
  if (a2 <= 2)
  {
    double v4 = *(double *)(a1 + 144);
    float v5 = a3 - v4;
    BOOL v6 = v4 <= 0.0;
    double v7 = 0.0;
    if (!v6) {
      *(float *)&double v7 = v5;
    }
    *(float32x2_t *)(a1 + 160) = vadd_f32(*(float32x2_t *)(a1 + 160), vmul_n_f32(*(float32x2_t *)(a1 + 152), *(float *)&v7));
    *(float *)&double v7 = *(float *)&v7 + *(float *)(a1 + 168);
    *(_DWORD *)(a1 + 168) = LODWORD(v7);
    *(double *)(a1 + 144) = a3;
    if (a2 == 2)
    {
      sub_227C9F450((void *)(a1 + 32), (float (*)(uint64_t, uint64_t))sub_227C9F73C, a1 + 8);
    }
    else if (a2 == 1)
    {
      sub_227C9F450((void *)(a1 + 32), (float (*)(uint64_t, uint64_t))sub_227C9F67C, a1 + 24);
    }
    else
    {
      if (a2) {
        return;
      }
      sub_227C9EF80((float32x2_t *)a1, *(float *)a1, v7);
      sub_227C9F450((void *)(a1 + 32), (float (*)(uint64_t, uint64_t))sub_227C9F540, a1);
    }
    sub_227C9F7EC(a1);
    *(unsigned char *)(a1 + 112) = 1;
    sub_227C9F898(a1);
  }
}

double sub_227C9F450(void *a1, float (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  if (!a1[6]) {
    goto LABEL_9;
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  double v8 = 0.0;
  do
  {
    float v9 = a2(*a1 + v6, a3);
    uint64_t v10 = a1[3];
    double v11 = *(double *)(v10 + 8 * v7) * (float)(v9 + 0.0);
    *(double *)(v10 + 8 * v7) = v11;
    double v8 = v8 + v11;
    ++v7;
    unint64_t v12 = a1[6];
    v6 += 20;
  }
  while (v7 < v12);
  double result = 0.000001;
  if (v8 > 0.000001)
  {
    if (v12)
    {
      float v14 = (double *)a1[3];
      do
      {
        double result = *v14 / v8;
        *v14++ = result;
        --v12;
      }
      while (v12);
    }
  }
  else
  {
LABEL_9:
    return sub_227C9FEC8((uint64_t)a1);
  }
  return result;
}

float sub_227C9F540(float *a1, float *a2)
{
  float v2 = a2[1];
  float v3 = (float)(*a2 - sqrtf((float)((float)(*a1 * *a1) + (float)(a1[1] * a1[1])) + (float)(a1[2] * a1[2]))) / *a2;
  if (v2 <= -0.125)
  {
    unint64_t v12 = (float *)&unk_227CC5F1C;
  }
  else
  {
    if (v2 < 0.275)
    {
      uint64_t v4 = 0;
      float v5 = (float *)&unk_227CC5F1C;
      uint64_t v6 = (float *)&unk_227CC62FC;
      float v7 = 0.0;
      do
      {
        float v8 = **(float **)((char *)&off_264830648 + v4);
        if (v2 > v8)
        {
          float v9 = **(float **)((char *)&off_264830648 + v4 + 8);
          if (v2 <= v9)
          {
            float v5 = *(float **)((char *)&off_264830648 + v4);
            uint64_t v6 = *(float **)((char *)&off_264830648 + v4 + 8);
            float v7 = (float)(v2 - v8) / (float)(v9 - v8);
          }
        }
        v4 += 8;
      }
      while (v4 != 32);
      float v10 = sub_227C9FC60(v5, v3);
      return (float)(v7 * sub_227C9FC60(v6, v3)) + (float)((float)(1.0 - v7) * v10);
    }
    unint64_t v12 = (float *)&unk_227CC62FC;
  }

  return sub_227C9FC60(v12, v3);
}

float sub_227C9F67C(uint64_t a1, float *a2)
{
  float v2 = (float *)&unk_2681BA000;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681BAEA0, memory_order_acquire) & 1) == 0)
  {
    float v8 = a2;
    uint64_t v9 = a1;
    int v6 = __cxa_guard_acquire(&qword_2681BAEA0);
    float v2 = (float *)&unk_2681BA000;
    int v7 = v6;
    a2 = v8;
    a1 = v9;
    if (v7)
    {
      dword_2681BAE98 = 1032971806;
      __cxa_guard_release(&qword_2681BAEA0);
      float v2 = (float *)&unk_2681BA000;
      a2 = v8;
      a1 = v9;
    }
  }
  float v3 = sqrtf((float)(*(float *)(a1 + 12) * *(float *)(a1 + 12)) + (float)(*(float *)(a1 + 16) * *(float *)(a1 + 16)));
  float v4 = v2[934];
  return v4 * expf((float)((float)((float)(v3 - *a2) * (float)(v3 - *a2)) * -0.5) / 31.36);
}

float sub_227C9F73C(uint64_t a1, float *a2)
{
  float v2 = (float)(a2[2] * a2[2]) * 50.0;
  float v3 = (float)(a2[3] * a2[3]) * 50.0;
  float v4 = (float)(v2 * v3) + -0.0001;
  float v5 = a2[1] - *(float *)(a1 + 16);
  float v6 = 1.0 / (sqrtf(v4) * 6.28318531);
  return expf((float)((float)(v5* (float)((float)((float)(v2 / v4) * v5)+ (float)((float)(0.01 / v4) * (float)(*a2 - *(float *)(a1 + 12)))))+ (float)((float)(*a2 - *(float *)(a1 + 12))* (float)((float)((float)(0.01 / v4) * v5)+ (float)((float)(v3 / v4) * (float)(*a2 - *(float *)(a1 + 12))))))* -0.5)* v6;
}

void sub_227C9F7EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 184);
  *(void *)(a1 + 184) = v1 + 1;
  if (0xAAAAAAAAAAAAAAABLL * v1 <= 0x5555555555555555)
  {
    *(void *)(a1 + 184) = 1;
    sub_227CA48B4(0x2B730488u, 1, 1, 0, 0, 0);
    sub_227C9F9CC(a1 + 32);
    sub_227CA48B4(0x2B730488u, 2, 1, 0, 0, 0);
  }
}

void sub_227C9F898(uint64_t a1)
{
  sub_227CA48B4(0x2B730498u, 1, 1, 0, 0, 0);
  unint64_t v2 = *(void *)(a1 + 104);
  if (v2)
  {
    unsigned int v3 = 0;
    float v4 = **(double ***)(a1 + 96);
    float v5 = (float *)(**(void **)(a1 + 88) + 8);
    float v6 = 0.0;
    uint64_t v7 = *(void *)(a1 + 104);
    float v8 = 0.0;
    float v9 = 0.0;
    float v10 = 0.0;
    do
    {
      float v11 = *(v5 - 2);
      float v12 = *(v5 - 1);
      float v13 = *v5;
      v5 += 5;
      float v14 = v13;
      float v15 = -v13;
      if (v13 > 0.0) {
        float v15 = v14;
      }
      float v16 = (float)(v11 * v11) + (float)(v12 * v12);
      float v17 = sqrtf(v16);
      float v18 = sqrtf(v16 + (float)(v14 * v14));
      double v19 = *v4++;
      float v20 = v19;
      float v6 = v6 + (float)(v20 * v15);
      float v8 = v8 + (float)(v20 * v17);
      float v9 = v9 + (float)(v20 * v18);
      if (v15 <= 1.8) {
        float v21 = -0.0;
      }
      else {
        float v21 = v20;
      }
      float v10 = v10 + v21;
      if (v15 > 1.8) {
        ++v3;
      }
      --v7;
    }
    while (v7);
    float v22 = (float)v3;
  }
  else
  {
    float v10 = 0.0;
    float v22 = 0.0;
    float v9 = 0.0;
    float v8 = 0.0;
    float v6 = 0.0;
  }
  *(float *)(a1 + 208) = v10;
  *(float *)(a1 + 192) = v6;
  *(float *)(a1 + 196) = v8;
  *(float *)(a1 + 200) = v9;
  *(float *)(a1 + 204) = v22 / (float)v2;

  sub_227CA48B4(0x2B730498u, 2, 1, 0, 0, 0);
}

void sub_227C9F9CC(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 48);
  float v3 = sub_227C9FBDC();
  unint64_t v4 = *(void *)(a1 + 48);
  double v5 = **(double **)(a1 + 24);
  float v6 = *(char **)a1;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  sub_227C9FD34((void **)a1, v4);
  unint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    float v10 = v3 / (float)v4;
    do
    {
      unint64_t v11 = v7 - 1;
      if (v5 >= v10 || v8 >= v11)
      {
        unint64_t v13 = v8;
      }
      else
      {
        do
        {
          unint64_t v13 = v8 + 1;
          double v5 = v5 + *(double *)(*(void *)(a1 + 24) + 8 + 8 * v8);
          BOOL v14 = v5 >= v10 || v13 >= v11;
          ++v8;
        }
        while (!v14);
      }
      float v15 = &v6[20 * v13];
      uint64_t v16 = *(void *)a1 + 20 * v9++;
      long long v17 = *(_OWORD *)v15;
      *(_DWORD *)(v16 + 16) = *((_DWORD *)v15 + 4);
      *(_OWORD *)uint64_t v16 = v17;
      float v10 = (float)(1.0 / (float)v2) + v10;
      unint64_t v7 = *(void *)(a1 + 48);
      BOOL v18 = v9 >= v7 || v13 >= v7;
      unint64_t v8 = v13;
    }
    while (!v18);
    sub_227C9FEC8(a1);
  }
  else
  {
    sub_227C9FEC8(a1);
    if (!v6) {
      return;
    }
  }

  operator delete(v6);
}

void sub_227C9FB0C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_227C9FB24()
{
  if (byte_2681B9AB8)
  {
    byte_2681B9AB8 = 0;
  }
  else
  {
    do
    {
      float v0 = (float)(sub_227C9FBDC() * 2.0) + -1.0;
      float v1 = (float)(sub_227C9FBDC() * 2.0) + -1.0;
      float v2 = (float)(v1 * v1) + (float)(v0 * v0);
    }
    while (v2 >= 1.0);
    if (v2 != 0.0)
    {
      *(float *)&dword_2681B9ABC = v1 * sqrtf((float)(logf((float)(v1 * v1) + (float)(v0 * v0)) * -2.0) / v2);
      byte_2681B9AB8 = 1;
    }
  }
}

float sub_227C9FBDC()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9AC0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681B9AC0))
  {
    __cxa_atexit((void (*)(void *))nullsub_7, &off_26B651430, &dword_227B19000);
    __cxa_guard_release(&qword_2681B9AC0);
  }
  return (float)sub_227C8E36C((int)&off_26B651430, 0x7FFFFFFFu) * 4.6566e-10;
}

float sub_227C9FC60(float *a1, float a2)
{
  if (a1[2] > a2 || a1[31] < a2) {
    return a1[1];
  }
  float v3 = a1 + 32;
  uint64_t v4 = 0x3FFFFFFFFFFFFFE3;
  while (1)
  {
    float v5 = v3[v4];
    if (v5 > a2)
    {
      float v6 = v3[v4 - 1];
      if (v6 < a2) {
        break;
      }
    }
    if (!(++v4 * 4)) {
      return 0.0;
    }
  }
  return a1[v4 + 61] + (float)((float)((float)(a1[v4 + 62] - a1[v4 + 61]) / (float)(v5 - v6)) * (float)(a2 - v6));
}

uint64_t sub_227C9FCD4(uint64_t a1, void (*a2)(uint64_t, uint64_t, void), uint64_t a3, unint64_t a4)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 48) = 1;
  sub_227C9ED58(a1, a2, a3, a4);
  return a1;
}

void sub_227C9FD10(_Unwind_Exception *a1)
{
  float v3 = *(void **)(v1 + 24);
  if (v3)
  {
    *(void *)(v1 + 32) = v3;
    operator delete(v3);
  }
  sub_227CAB6E8(v1);
  _Unwind_Resume(a1);
}

void sub_227C9FD34(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - (unsigned char *)*a1) >> 2) < a2)
  {
    if (a2 >= 0xCCCCCCCCCCCCCCDLL) {
      sub_227B8B89C();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 20;
    float v6 = (char *)sub_227C9FF94(v3, a2);
    unint64_t v7 = &v6[20 * v5];
    unint64_t v9 = &v6[20 * v8];
    unint64_t v11 = (char *)*a1;
    float v10 = (char *)a1[1];
    float v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 20);
        *((_DWORD *)v12 - 1) = *((_DWORD *)v10 - 1);
        *(_OWORD *)(v12 - 20) = v13;
        v12 -= 20;
        v10 -= 20;
      }
      while (v10 != v11);
      float v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_227C9FE20(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_227B8B89C();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    float v6 = (char *)sub_227B8B8B4(v3, a2);
    unint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v9 = &v6[8 * v8];
    float v10 = (char *)*a1;
    unint64_t v11 = (char *)a1[1];
    float v12 = v7;
    if (v11 != *a1)
    {
      float v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

double sub_227C9FEC8(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681B9AD0, memory_order_acquire) & 1) == 0)
  {
    uint64_t v5 = a1;
    int v4 = __cxa_guard_acquire(&qword_2681B9AD0);
    a1 = v5;
    if (v4)
    {
      *(double *)&qword_2681B9AC8 = (float)(1.0 / (float)*(unint64_t *)(v5 + 48));
      __cxa_guard_release(&qword_2681B9AD0);
      a1 = v5;
    }
  }
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    float v2 = *(void **)(a1 + 24);
    do
    {
      double result = *(double *)&qword_2681B9AC8;
      *v2++ = qword_2681B9AC8;
      --v1;
    }
    while (v1);
  }
  return result;
}

os_log_t sub_227C9FF64()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "Motion");
  qword_2681B9A88 = (uint64_t)result;
  return result;
}

void *sub_227C9FF94(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xCCCCCCCCCCCCCCDLL) {
    sub_227B8B97C();
  }
  return operator new(20 * a2);
}

uint64_t sub_227C9FFDC(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 472))
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29730);
    }
    float v2 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_INFO))
    {
      float v3 = sub_227CA50D0((float32x4_t *)(a1 + 124));
      uint64_t v4 = 0;
      *(float *)unint64_t v11 = v3;
      v11[1] = v5;
      v11[2] = v6;
      float v7 = 0.0;
      do
      {
        float v7 = v7 + (float)(*(float *)&v11[v4] * *(float *)&v11[v4]);
        ++v4;
      }
      while (v4 != 3);
      float v8 = *(float *)(a1 + 448) * 57.296;
      uint64_t v9 = *(void *)(a1 + 456);
      *(_DWORD *)buf = 134349568;
      double v13 = (float)(sqrtf(v7) * 57.296);
      __int16 v14 = 2050;
      double v15 = v8;
      __int16 v16 = 2050;
      uint64_t v17 = v9;
      _os_log_impl(&dword_227B19000, v2, OS_LOG_TYPE_INFO, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[softReset] Enter soft reset. fDMYawAlignmentQ_IP_IS.angle: %{public}.1f deg, fDMYawAlignmentMEKF angle: %{public}.1f deg, timestamp: %{public}llu", buf, 0x20u);
    }
  }
  *(_OWORD *)(a1 + 476) = *(_OWORD *)(a1 + 124);
  *(unsigned char *)(a1 + 472) = 1;
  return sub_227C8E478(a1 + 448);
}

void sub_227CA0134(unsigned __int8 *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, unsigned __int16 *a6, unsigned __int16 *a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  if (*a1)
  {
    uint64_t v17 = *(void *)(a9 + 8);
    if (*(void *)a9 == v17) {
      unint64_t v18 = 0;
    }
    else {
      unint64_t v18 = *(void *)sub_227C9B9E4(a2, *(void *)(v17 - 8));
    }
    sub_227C9DD64((uint64_t)(a1 + 144), v18, a3, a5, a6, a7, a8, (unint64_t **)a9, a10, a11);
  }
  int v19 = a1[288];
  a1[296] = v19;
  if (v19 || !*a1)
  {
    float v20 = *(unint64_t **)a9;
    if (*(void *)a9 != *(void *)(a9 + 8))
    {
      unint64_t v21 = 0;
      do
      {
        float v22 = (float *)sub_227C9B9E4(a3, v20[v21]);
        if (*a1 && *v22 < 0.17453) {
          return;
        }
        ++v21;
        float v20 = *(unint64_t **)a9;
        uint64_t v23 = *(void *)(a9 + 8);
      }
      while (v21 < (v23 - *(void *)a9) >> 3);
      float32_t v24 = (_DWORD *)sub_227C9B9E4(a2, *(void *)(v23 - 8));
      if (!*a1
        || ((*v24 - *((_DWORD *)a1 + 2)) <= 0x4C4B40 ? (unsigned int v25 = 200000) : (unsigned int v25 = 5000000),
            v25 < *v24 - *((_DWORD *)a1 + 4)))
      {
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC29730);
        }
        double v26 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
        {
          int v27 = *a1;
          uint64_t v28 = (uint64_t)(*(void *)(a9 + 8) - *(void *)a9) >> 3;
          uint64_t v29 = a3[1];
          uint64_t v30 = a6[1];
          uint64_t v31 = *a2;
          uint64_t v32 = *(void *)&a2[4 * v31 + 4];
          unint64_t v33 = v31 + a2[1] - 1;
          unint64_t v34 = *((unsigned int *)a2 + 1);
          if (v33 < v34) {
            unint64_t v34 = 0;
          }
          uint64_t v35 = *(void *)&a2[4 * (v33 - v34) + 4];
          uint64_t v36 = a5[1];
          *(_DWORD *)buf = 67110656;
          *(_DWORD *)&uint8_t buf[4] = v27;
          *(_WORD *)&uint8_t buf[8] = 2048;
          *(void *)&buf[10] = v28;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = v29;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v30;
          __int16 v76 = 2048;
          uint64_t v77 = v36;
          __int16 v78 = 2048;
          uint64_t v79 = v32;
          __int16 v80 = 2048;
          uint64_t v81 = v35;
          _os_log_impl(&dword_227B19000, v26, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[updateDMInertialYaw] Starting north alignment. fBoolInitializedDMYawAlignment: %d, numMatchedSensorData: %zu, numRingSensor: %zu, numAuxDM: %zu, numSrcDM: %zu, first/last ring timestamp entry in buffer: %llu %llu us", buf, 0x44u);
        }
        sub_227C943D0((uint64_t)(a1 + 304));
        unint64_t v37 = *(unint64_t **)a9;
        if (*(void *)(a9 + 8) != *(void *)a9)
        {
          unint64_t v38 = 0;
          do
          {
            float v39 = (float *)sub_227C9B9E4(a3, v37[v38]);
            float v40 = (float *)sub_227C9B9E4(a4, *(void *)(*(void *)a9 + 8 * v38));
            uint64_t v41 = (float32x2_t *)sub_227C89D30(a5, *(void *)(*a10 + 8 * v38));
            unint64_t v42 = (float32x2_t *)sub_227C89D30(a6, *(void *)(*a11 + 8 * v38));
            sub_227C94464((uint64_t)(a1 + 304), v39, v40, v41, v42);
            ++v38;
            unint64_t v37 = *(unint64_t **)a9;
          }
          while (v38 < (uint64_t)(*(void *)(a9 + 8) - *(void *)a9) >> 3);
        }
        if (*a1) {
          sub_227C94854((uint64_t)(a1 + 304), *((float *)a1 + 30));
        }
        else {
          sub_227C946A8((uint64_t)(a1 + 304));
        }
        sub_227C948A8((uint64_t)(a1 + 304), 50);
        float v44 = fmodf(*((float *)a1 + 86) + 3.1416, 6.2832);
        if (v44 < 0.0) {
          float v44 = v44 + 6.2832;
        }
        float v45 = v44 + -3.1416;
        float v74 = v44 + -3.1416;
        sub_227CA0864(*((float *)a1 + 30), v43, a3, a5, a6, (uint64_t *)a9, a10, a11);
        float v47 = v46;
        sub_227CA0864(v45, v48, a3, a5, a6, (uint64_t *)a9, a10, a11);
        if (!*a1 || v47 >= v49)
        {
          if (*((void *)a1 + 8) == 64)
          {
            ++*((void *)a1 + 7);
            *((void *)a1 + 8) = 63;
            sub_227C9D888((uint64_t)(a1 + 24), 1);
          }
          sub_227C92464((uint64_t)v73, (void *)a1 + 3);
          float v50 = sub_227C94DC4(v73);
          float v51 = fmodf(v50 + 3.1416, 6.2832);
          if (v51 < 0.0) {
            float v51 = v51 + 6.2832;
          }
          float v52 = v51 + -3.1416;
          sub_227C923BC(v73);
          if (vabds_f32(v52, v45) <= 3.14159265) {
            goto LABEL_47;
          }
          if (v52 <= 0.0 || v45 >= 0.0)
          {
            if (v52 >= 0.0 || v45 <= 0.0)
            {
LABEL_47:
              unint64_t v55 = (uint64_t *)sub_227C9B9E4(a2, *(void *)(*(void *)(a9 + 8) - 8));
              if ((sub_227CA09DC(a1, *v55, v45) & 1) == 0)
              {
                sub_227C94D3C((void *)a1 + 3, &v74);
                uint64_t v56 = (uint64_t *)sub_227C9B9E4(a2, *(void *)(*(void *)(a9 + 8) - 8));
                uint64_t v57 = *v56;
                *((void *)a1 + 2) = *v56;
                if (!*((void *)a1 + 1)) {
                  *((void *)a1 + 1) = v57;
                }
                sub_227C92464((uint64_t)v72, (void *)a1 + 3);
                float v58 = sub_227C94DC4(v72);
                float v59 = fmodf(v58 + 3.1416, 6.2832);
                if (v59 < 0.0) {
                  float v59 = v59 + 6.2832;
                }
                *((float *)a1 + 30) = v59 + -3.1416;
                sub_227C923BC(v72);
                int v60 = *((_DWORD *)a1 + 30);
                uint64_t v70 = 0;
                int v71 = v60;
                sub_227CA4FB4((float32x4_t *)buf, (float *)&v70);
                if (a1 + 124 != buf) {
                  *(_OWORD *)(a1 + 124) = *(_OWORD *)buf;
                }
                uint64_t v61 = qword_2681B9A70;
                if (!*a1)
                {
                  if (qword_2681B9A70 != -1) {
                    dispatch_once(&qword_2681B9A70, &unk_26DC29730);
                  }
                  uint64_t v62 = qword_2681B9A78;
                  if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
                  {
                    double v63 = (double)*((unint64_t *)a1 + 2) * 0.000001;
                    double v64 = (float)(*((float *)a1 + 30) * 57.296);
                    *(_DWORD *)buf = 134218240;
                    *(double *)&uint8_t buf[4] = v63;
                    *(_WORD *)&unsigned char buf[12] = 2048;
                    *(double *)&buf[14] = v64;
                    _os_log_impl(&dword_227B19000, v62, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[updateDMInertialYaw] Initialized DM north alignment, t: %.6f s, angle: %.6f deg", buf, 0x16u);
                    uint64_t v61 = qword_2681B9A70;
                  }
                  else
                  {
                    uint64_t v61 = -1;
                  }
                  *a1 = 1;
                }
                if (v61 != -1) {
                  dispatch_once(&qword_2681B9A70, &unk_26DC29730);
                }
                double v65 = qword_2681B9A78;
                if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
                {
                  double v66 = (double)*((unint64_t *)a1 + 2) * 0.000001;
                  double v67 = (float)(*((float *)a1 + 30) * 57.296);
                  *(_DWORD *)buf = 134218496;
                  *(double *)&uint8_t buf[4] = v66;
                  *(_WORD *)&unsigned char buf[12] = 2048;
                  *(double *)&buf[14] = (float)(v74 * 57.296);
                  *(_WORD *)&unsigned char buf[22] = 2048;
                  *(double *)&unsigned char buf[24] = v67;
                  _os_log_impl(&dword_227B19000, v65, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[updateDMInertialYaw] Updated DM north alignment, t: %.6f s, new angle: %.6f deg, median angle: %.6f deg", buf, 0x20u);
                }
              }
              return;
            }
            double v53 = v45;
            double v54 = -6.28318531;
          }
          else
          {
            double v53 = v45;
            double v54 = 6.28318531;
          }
          float v45 = v53 + v54;
          float v74 = v45;
          goto LABEL_47;
        }
      }
    }
  }
}

void sub_227CA083C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  sub_227C923BC(va);
  _Unwind_Resume(a1);
}

void sub_227CA0864(float a1, uint64_t a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, uint64_t *a6, void *a7, void *a8)
{
  if (*a6 != a6[1])
  {
    uint64_t v30 = 0;
    float v31 = a1;
    sub_227CA4FB4(&v29, (float *)&v30);
    uint64_t v14 = *a6;
    if (a6[1] != *a6)
    {
      unint64_t v15 = 0;
      float v16 = 0.0;
      do
      {
        unint64_t v17 = *(void *)(v14 + 8 * v15);
        unint64_t v18 = *(void *)(*a7 + 8 * v15);
        uint64_t v19 = sub_227C89D30(a5, *(void *)(*a8 + 8 * v15));
        float v20 = (float32x2_t *)sub_227C89D30(a4, v18);
        *(double *)v22.i64 = sub_227CA4C0C(v19, v29.f32, &v34, v21);
        *(double *)v23.i64 = sub_227CA4C6C(v20, &v32, v22);
        *(double *)v24.i64 = sub_227CA4C0C((uint64_t)&v34, v32.f32, &v33, v23);
        sub_227CA4C6C((float32x2_t *)&v33, &v32, v24);
        float v25 = sub_227CA4ED8(v32.f32, 0.0, 1.0, 0.0);
        float v27 = atan2f(v26, v25);
        uint64_t v28 = sub_227C9B9E4(a3, v17);
        float v16 = v16 + (float)((float)(*(float *)(v28 + 4) - v27) * (float)(*(float *)(v28 + 4) - v27));
        ++v15;
        uint64_t v14 = *a6;
      }
      while ((a6[1] - *a6) >> 3 > v15);
    }
  }
}

uint64_t sub_227CA09DC(void *a1, uint64_t a2, float a3)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  float v49 = a3;
  if (!a1[8]) {
    return 0;
  }
  int v6 = a1 + 3;
  float v7 = a1 + 9;
  if (a1[14] == 16)
  {
    ++a1[13];
    a1[14] = 15;
    sub_227C9D888((uint64_t)(a1 + 9), 1);
  }
  sub_227C92464((uint64_t)v48, v6);
  float v8 = sub_227C94DC4(v48);
  float v9 = fmodf(v8 + 3.1416, 6.2832);
  if (v9 < 0.0) {
    float v9 = v9 + 6.2832;
  }
  float v10 = v9 + -3.1416;
  sub_227C923BC(v48);
  float v11 = vabds_f32(v10, a3);
  float v12 = fabsf(v10) * 0.15;
  if (v12 > 0.2618) {
    float v12 = 0.2618;
  }
  if (v11 < v12)
  {
    double v13 = (void **)a1[10];
    uint64_t v14 = a1[11];
    a1[14] = 0;
    unint64_t v15 = v14 - (void)v13;
    if (v15 >= 0x11)
    {
      do
      {
        operator delete(*v13);
        uint64_t v16 = a1[11];
        double v13 = (void **)(a1[10] + 8);
        a1[10] = v13;
        unint64_t v15 = v16 - (void)v13;
      }
      while (v15 > 0x10);
    }
    if (v15 >> 3 == 1)
    {
      uint64_t v17 = 512;
      goto LABEL_39;
    }
    if (v15 >> 3 == 2)
    {
      uint64_t v17 = 1024;
LABEL_39:
      uint64_t result = 0;
      a1[13] = v17;
      return result;
    }
    return 0;
  }
  if (v11 <= 1.5708)
  {
    if (!a1[14])
    {
      sub_227C94D3C(v7, &v49);
      return 1;
    }
    sub_227C92464((uint64_t)v47, v7);
    float v23 = sub_227C94DC4(v47);
    float v24 = fmodf(v23 + 3.1416, 6.2832);
    if (v24 < 0.0) {
      float v24 = v24 + 6.2832;
    }
    float v25 = v24 + -3.1416;
    sub_227C923BC(v47);
    float v26 = fmodf((float)(v49 - v25) + 3.1416, 6.2832);
    if (v26 < 0.0) {
      float v26 = v26 + 6.2832;
    }
    float v27 = fabsf(v26 + -3.1416);
    float v28 = fabsf(v25) * 0.15;
    if (v28 > 0.2618) {
      float v28 = 0.2618;
    }
    unint64_t v29 = a1[13];
    uint64_t v30 = (void **)a1[10];
    float v31 = (void **)a1[11];
    float32x4_t v32 = &v30[v29 >> 10];
    float32x4_t v33 = *v32;
    float32x4_t v34 = (float *)((char *)*v32 + 4 * (v29 & 0x3FF));
    float v35 = *v34;
    unint64_t v36 = (char *)v31 - (char *)v30;
    if (v31 == v30
      || (uint64_t v37 = *(uint64_t *)((char *)v30 + (((a1[14] + v29) >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * ((a1[14] + v29) & 0x3FF),
          v34 == (float *)v37))
    {
      float v38 = *v34;
    }
    else
    {
      float v38 = *v34;
      do
      {
        float v39 = *v34++;
        float v40 = v39;
        if (v39 > v35) {
          float v35 = v40;
        }
        if (v40 < v38) {
          float v38 = v40;
        }
        if ((char *)v34 - v33 == 4096)
        {
          uint64_t v41 = (float *)v32[1];
          ++v32;
          float32x4_t v33 = v41;
          float32x4_t v34 = v41;
        }
      }
      while (v34 != (float *)v37);
    }
    if (v27 <= v28 && (float)(v35 - v38) <= 0.34907)
    {
      sub_227C94D3C(v7, &v49);
      unint64_t v43 = 8;
      if (v11 > 1.0472) {
        unint64_t v43 = 2;
      }
      if (a1[14] <= v43) {
        return 1;
      }
      sub_227CA0E9C(v6);
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29730);
      }
      float v44 = qword_2681B9A78;
      if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        double v51 = (float)(v11 * 57.296);
        __int16 v52 = 2048;
        double v53 = (float)(v49 * 57.296);
        __int16 v54 = 2048;
        double v55 = (float)(v10 * 57.296);
        __int16 v56 = 2048;
        uint64_t v57 = a2;
        _os_log_impl(&dword_227B19000, v44, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[updateDMInertialYaw] Reset median buffer. Large delta between new angle and median: %.1f deg, new angle: %.1f deg, old median: %.1f deg, timestamp: %llu", buf, 0x2Au);
      }
      sub_227CA0E9C(v7);
      return 0;
    }
    a1[14] = 0;
    if (v36 >= 0x11)
    {
      do
      {
        operator delete(*v30);
        uint64_t v45 = a1[11];
        uint64_t v30 = (void **)(a1[10] + 8);
        a1[10] = v30;
        unint64_t v36 = v45 - (void)v30;
      }
      while (v36 > 0x10);
    }
    if (v36 >> 3 == 1)
    {
      uint64_t v46 = 512;
    }
    else
    {
      if (v36 >> 3 != 2)
      {
LABEL_62:
        sub_227C94D3C(v7, &v49);
        return 1;
      }
      uint64_t v46 = 1024;
    }
    a1[13] = v46;
    goto LABEL_62;
  }
  unint64_t v18 = (void **)a1[10];
  uint64_t v19 = a1[11];
  a1[14] = 0;
  unint64_t v20 = v19 - (void)v18;
  if (v20 >= 0x11)
  {
    do
    {
      operator delete(*v18);
      uint64_t v21 = a1[11];
      unint64_t v18 = (void **)(a1[10] + 8);
      a1[10] = v18;
      unint64_t v20 = v21 - (void)v18;
    }
    while (v20 > 0x10);
  }
  if (v20 >> 3 == 1)
  {
    uint64_t v22 = 512;
    goto LABEL_54;
  }
  if (v20 >> 3 == 2)
  {
    uint64_t v22 = 1024;
LABEL_54:
    a1[13] = v22;
  }
  return 1;
}

void sub_227CA0E74(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227C923BC(va);
  _Unwind_Resume(a1);
}

void sub_227CA0E9C(void *a1)
{
  float v2 = (void **)a1[1];
  uint64_t v3 = a1[2];
  a1[5] = 0;
  unint64_t v4 = v3 - (void)v2;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v5 = a1[2];
      float v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = v5 - (void)v2;
    }
    while (v4 > 0x10);
  }
  if (v4 >> 3 == 1)
  {
    uint64_t v6 = 512;
  }
  else
  {
    if (v4 >> 3 != 2) {
      return;
    }
    uint64_t v6 = 1024;
  }
  a1[4] = v6;
}

uint64_t sub_227CA0F14(unsigned __int8 *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (qword_2681B9A70 != -1) {
    dispatch_once(&qword_2681B9A70, &unk_26DC29730);
  }
  float v2 = qword_2681B9A78;
  if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
  {
    int v3 = *a1;
    uint64_t v4 = *((void *)a1 + 1);
    uint64_t v5 = *((void *)a1 + 2);
    double v6 = (float)(*((float *)a1 + 30) * 57.296);
    int v7 = a1[296];
    v19[0] = 67110144;
    v19[1] = v3;
    __int16 v20 = 2048;
    uint64_t v21 = v4;
    __int16 v22 = 2048;
    uint64_t v23 = v5;
    __int16 v24 = 2048;
    double v25 = v6;
    __int16 v26 = 1024;
    int v27 = v7;
    _os_log_impl(&dword_227B19000, v2, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[reset] Resetting. Values before reset: fBoolInitializedDMYawAlignment: %d, fFirstDMYawAlignmentUpdateTimeMicroSeconds: %llu us, fLatestDMYawAlignmentUpdateTimeMicroSeconds: %llu us, fDMYawAlignmentAngle: %.1f deg, fBoolTrustPencilRingSensor: %d", (uint8_t *)v19, 0x2Cu);
  }
  *a1 = 0;
  *((void *)a1 + 1) = 0;
  *((void *)a1 + 2) = 0;
  float v8 = (void **)*((void *)a1 + 4);
  uint64_t v9 = *((void *)a1 + 5);
  *((void *)a1 + 8) = 0;
  unint64_t v10 = v9 - (void)v8;
  if (v10 >= 0x11)
  {
    do
    {
      operator delete(*v8);
      uint64_t v11 = *((void *)a1 + 5);
      float v8 = (void **)(*((void *)a1 + 4) + 8);
      *((void *)a1 + 4) = v8;
      unint64_t v10 = v11 - (void)v8;
    }
    while (v10 > 0x10);
  }
  if (v10 >> 3 == 1)
  {
    uint64_t v12 = 512;
  }
  else
  {
    if (v10 >> 3 != 2) {
      goto LABEL_12;
    }
    uint64_t v12 = 1024;
  }
  *((void *)a1 + 7) = v12;
LABEL_12:
  double v13 = (void **)*((void *)a1 + 10);
  uint64_t v14 = *((void *)a1 + 11);
  *((void *)a1 + 14) = 0;
  unint64_t v15 = v14 - (void)v13;
  if (v15 >= 0x11)
  {
    do
    {
      operator delete(*v13);
      uint64_t v16 = *((void *)a1 + 11);
      double v13 = (void **)(*((void *)a1 + 10) + 8);
      *((void *)a1 + 10) = v13;
      unint64_t v15 = v16 - (void)v13;
    }
    while (v15 > 0x10);
  }
  if (v15 >> 3 == 1)
  {
    uint64_t v17 = 512;
    goto LABEL_18;
  }
  if (v15 >> 3 == 2)
  {
    uint64_t v17 = 1024;
LABEL_18:
    *((void *)a1 + 13) = v17;
  }
  *((void *)a1 + 15) = 0;
  *((void *)a1 + 16) = 0;
  *((_DWORD *)a1 + 34) = 1065353216;
  sub_227C9DCC4((uint64_t)(a1 + 144));
  a1[296] = 1;
  sub_227C943D0((uint64_t)(a1 + 304));
  return sub_227C8E478((uint64_t)(a1 + 448));
}

void sub_227CA110C(uint64_t a1, unint64_t a2)
{
}

void sub_227CA1114(uint64_t a1, float *a2, float *a3, float32x2_t *a4, float32x2_t *a5, unint64_t a6)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  sub_227C8E6C0(a1 + 448, a2, a3, a4, a5, a6);
  if (*(unsigned char *)(a1 + 472))
  {
    *(unsigned char *)(a1 + 472) = 0;
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29730);
    }
    int v7 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_INFO))
    {
      float v8 = sub_227CA50D0((float32x4_t *)(a1 + 124));
      uint64_t v9 = 0;
      *(float *)unint64_t v15 = v8;
      v15[1] = v10;
      v15[2] = v11;
      float v12 = 0.0;
      do
      {
        float v12 = v12 + (float)(*(float *)&v15[v9] * *(float *)&v15[v9]);
        ++v9;
      }
      while (v9 != 3);
      float v13 = *(float *)(a1 + 448);
      uint64_t v14 = *(void *)(a1 + 456);
      *(_DWORD *)buf = 134218496;
      double v17 = (float)(sqrtf(v12) * 57.296);
      __int16 v18 = 2048;
      double v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_INFO, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[feedMEKF] Exit soft reset. fDMYawAlignmentQ_IP_IS.angle: %.1f deg, fDMYawAlignmentMEKF angle: %.1f deg, timestamp: %llu", buf, 0x20u);
    }
  }
}

float32x4_t sub_227CA1258@<Q0>(uint64_t a1@<X0>, float32x4_t *a2@<X8>)
{
  if (*(unsigned char *)(a1 + 472))
  {
    float32x4_t result = *(float32x4_t *)(a1 + 476);
    *a2 = result;
  }
  else
  {
    if (*(unsigned char *)(a1 + 464))
    {
      *(double *)result.i64 = sub_227C8E484((int *)(a1 + 448), a2);
    }
    else
    {
      float32x4_t result = *(float32x4_t *)(a1 + 124);
      *a2 = result;
    }
    if ((float32x4_t *)(a1 + 124) != a2)
    {
      float32x4_t result = *a2;
      *(float32x4_t *)(a1 + 124) = *a2;
    }
  }
  return result;
}

os_log_t sub_227CA12C8()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_2681B9A78 = (uint64_t)result;
  return result;
}

uint64_t sub_227CA12F8(uint64_t result)
{
  *(unsigned char *)(result + 24) = 0;
  return result;
}

uint64_t sub_227CA1300(uint64_t result, double a2, double a3, double a4)
{
  if (*(unsigned char *)(result + 24))
  {
    double v4 = *(double *)(result + 8) + a3 - *(double *)(result + 16);
    double v5 = v4 / (v4 + a4);
    *(double *)os_log_t result = *(double *)result + v5 * (a2 - *(double *)result);
    *(double *)(result + 8) = v4 * (1.0 - v5);
    *(double *)(result + 16) = a3;
  }
  else
  {
    *(double *)os_log_t result = a2;
    *(double *)(result + 8) = a4;
    *(double *)(result + 16) = a3;
    *(unsigned char *)(result + 24) = 1;
  }
  return result;
}

double sub_227CA1354(double *a1, double *a2, double *a3)
{
  double v4 = a2[2];
  double v3 = a2[3];
  double v5 = a3[2];
  double v6 = a3[3];
  double v7 = *a2;
  double v8 = *a3;
  a1[1] = v3 * v5 + *a2 * a3[1] - v4 * v6 + a2[1] * *a3;
  double v9 = a3[1];
  double v10 = a2[1];
  a1[2] = v7 * v5 - v3 * v9 + v10 * v6 + v4 * v8;
  double v11 = a2[2];
  double v12 = a3[2];
  a1[3] = v11 * v9 - v10 * v12 + v7 * v6 + v3 * v8;
  double result = -(v11 * v12) - v10 * v9 - a2[3] * a3[3] + v7 * v8;
  *a1 = result;
  return result;
}

void sub_227CA13D0(uint64_t a1, float a2, double a3)
{
  if (a3 >= 0.0)
  {
    v23[4] = v8;
    v23[5] = v7;
    v23[6] = v6;
    v23[7] = v5;
    v23[10] = v3;
    v23[11] = v4;
    double v11 = *(double *)(a1 + 16);
    double v12 = *(double *)(a1 + 24) + *(double *)(a1 + 24);
    double v13 = *(double *)(a1 + 8);
    float v14 = v13 * v12 - *(double *)a1 * (v11 + v11);
    float v15 = (v13 + v13) * *(double *)a1 + v11 * v12;
    float v16 = 1.0 - v13 * (v13 + v13) - v11 * (v11 + v11);
    __double2 v17 = __sincos_stret(a2 * -0.5 * *(double *)"");
    v23[0] = v17.__cosval;
    v23[1] = v17.__sinval * v14;
    _DWORD v23[2] = v17.__sinval * v15;
    v23[3] = v17.__sinval * v16;
    sub_227CA1354((double *)v22, v23, (double *)a1);
    long long v18 = v22[1];
    *(_OWORD *)a1 = v22[0];
    *(_OWORD *)(a1 + 16) = v18;
    float v19 = *(float *)(a1 + 76);
    if (v19 >= 0.0)
    {
      float v20 = v19 + a2;
      *(float *)(a1 + 76) = v20;
      float v21 = 360.0;
      if (v20 >= 360.0)
      {
        float v21 = -360.0;
      }
      else if (v20 >= 0.0)
      {
        return;
      }
      *(float *)(a1 + 76) = v20 + v21;
    }
  }
}

void sub_227CA14E8(uint64_t a1, float a2, double a3)
{
}

void sub_227CA14F0(uint64_t a1, char *a2, char *a3)
{
  sub_227B8D46C(&v6, a2);
  sub_227B8DC70(a3, "/tmp/", 1048576000, 86400, 50, "msl", 2, 300, (uint64_t)&v5);
  sub_227B8D564(a1);
}

void sub_227CA15C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_227B8CAB0((uint64_t)&a9);
  if (*(char *)(v9 - 17) < 0) {
    operator delete(*(void **)(v9 - 40));
  }
  _Unwind_Resume(a1);
}

uint64_t sub_227CA15F4()
{
  if (qword_2681BAEA8 != -1) {
    dispatch_once(&qword_2681BAEA8, &unk_26DC29770);
  }
  return qword_2681BB0D0;
}

void sub_227CA1638(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  double v4 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], a2, a3, a4);
  uint64_t v8 = objc_msgSend_processName(v4, v5, v6, v7);
  objc_msgSend_stringWithFormat_(NSString, v9, @"%s.%@", v10, "com.apple.CoreMotionAlgorithms.Msl", v8);
  objc_msgSend_stringWithFormat_(NSString, v11, @"CoreMotionAlgorithms-%@", v12, v8);
  operator new();
}

void sub_227CA16FC(_Unwind_Exception *a1)
{
  MEMORY[0x22A6850E0](v1, 0x10A1C4096F084F8);
  _Unwind_Resume(a1);
}

void sub_227CA1724(uint64_t a1)
{
  sub_227B8D95C(a1);

  JUMPOUT(0x22A6850E0);
}

void sub_227CA175C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 3616))
  {
    uint64_t v4 = sub_227CA15F4();
    sub_227B8DA98(v4, a1);
  }
  else
  {
    sub_227BF1130((uint64_t)v5, a1);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v7 |= 1u;
    CFAbsoluteTime v6 = Current;
    uint64_t v3 = sub_227CA15F4();
    sub_227B8DA98(v3, (uint64_t)v5);
    sub_227BE6EB4((PB::Base *)v5);
  }
}

void sub_227CA17E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

float *sub_227CA17FC(float *result, __int16 *a2, uint64_t a3)
{
  for (; a3; --a3)
  {
    __int16 v3 = *a2++;
    _H0 = v3;
    __asm { FCVT            S0, H0 }
    *double result = *result * _S0;
    ++result;
  }
  return result;
}

void sub_227CA1820(float *a1, float *a2, uint64_t a3, int a4, uint64_t a5, unint64_t a6)
{
  if (!a6) {
    return;
  }
  unint64_t v6 = a6;
  uint64_t v12 = 0;
  uint64_t v13 = a5 + 1;
  float v14 = (_WORD *)(a3 + 2);
  uint64_t v15 = 2 * a5 + 2;
  do
  {
    _H0 = *(_WORD *)(a3 + 2 * v12 * v13);
    __asm { FCVT            S0, H0 }
    a2[v12] = _S0;
    uint64_t v22 = v14;
    uint64_t v23 = a1;
    for (uint64_t i = a5; i; --i)
    {
      float v25 = *v23++;
      float v26 = v25;
      LOWORD(v25) = *v22++;
      _H2 = LOWORD(v25);
      __asm { FCVT            S2, H2 }
      _S0 = _S0 + (float)(v26 * _S2);
      a2[v12] = _S0;
    }
    if (a4 == 1)
    {
      if (_S0 < 0.0) {
        _S0 = 0.0;
      }
    }
    else
    {
      if (a4 != 2) {
        goto LABEL_11;
      }
      _S0 = 1.0 / (float)(expf(-_S0) + 1.0);
    }
    a2[v12] = _S0;
LABEL_11:
    ++v12;
    float v14 = (_WORD *)((char *)v14 + v15);
  }
  while (v12 != v6);
  if (a4 == 3)
  {
    unint64_t v29 = a2;
    if (v6 >= 2)
    {
      uint64_t v30 = a2 + 1;
      float v31 = *a2;
      uint64_t v32 = 4 * v6 - 4;
      unint64_t v29 = a2;
      float32x4_t v33 = a2 + 1;
      do
      {
        float v34 = *v33++;
        float v35 = v34;
        if (v31 < v34)
        {
          float v31 = v35;
          unint64_t v29 = v30;
        }
        uint64_t v30 = v33;
        v32 -= 4;
      }
      while (v32);
    }
    float v36 = *v29;
    float v37 = 0.0;
    float v38 = a2;
    unint64_t v39 = v6;
    do
    {
      float v40 = expf(*v38 - v36);
      *v38++ = v40;
      float v37 = v37 + v40;
      --v39;
    }
    while (v39);
    float v41 = 1.0;
    if (v37 > 0.0000001) {
      float v41 = v37;
    }
    do
    {
      *a2 = *a2 / v41;
      ++a2;
      --v6;
    }
    while (v6);
  }
}

double sub_227CA19B8(uint64_t a1)
{
  *(void *)a1 = &unk_26DC29610;
  *(void *)(a1 + 8) = 0x19000000000;
  *(void *)(a1 + 4816) = 0x19000000000;
  *(void *)(a1 + 8024) = 0;
  *(_DWORD *)(a1 + 8032) = 0;
  *(void *)(a1 + 8036) = 0xBF8000003F800000;
  double result = 0.0;
  *(_OWORD *)(a1 + 8048) = 0u;
  *(void *)(a1 + 8064) = 0x3F80000000000000;
  return result;
}

double sub_227CA1A14(uint64_t a1)
{
  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 4816) = 0;
  *(void *)(a1 + 8024) = 0;
  *(_DWORD *)(a1 + 8032) = 0;
  *(void *)(a1 + 8036) = 0xBF8000003F800000;
  double result = 0.0;
  *(_OWORD *)(a1 + 8048) = 0u;
  *(void *)(a1 + 8064) = 0x3F80000000000000;
  return result;
}

__n128 sub_227CA1A4C(uint64_t a1, uint64_t a2, __n128 *a3, uint64_t a4)
{
  sub_227CA1AF0((unsigned __int16 *)(a1 + 8), a2);
  uint64_t v8 = *(unsigned __int16 *)(a1 + 4818);
  unint64_t v9 = *(unsigned int *)(a1 + 4820);
  uint64_t v10 = *(unsigned __int16 *)(a1 + 4816);
  if (v10 + v8 >= v9) {
    uint64_t v11 = *(unsigned int *)(a1 + 4820);
  }
  else {
    uint64_t v11 = 0;
  }
  *(void *)(a1 + 4816 + 8 * (v10 + v8 - v11) + 8) = a4;
  if (v9 <= v8)
  {
    if (v10 + 1 < v9) {
      LOWORD(v9) = 0;
    }
    *(_WORD *)(a1 + 4816) = v10 + 1 - v9;
  }
  else
  {
    *(_WORD *)(a1 + 4818) = v8 + 1;
  }
  if ((__n128 *)(a1 + 8056) != a3)
  {
    __n128 result = *a3;
    *(__n128 *)(a1 + 8056) = *a3;
  }
  return result;
}

unsigned __int16 *sub_227CA1AF0(unsigned __int16 *result, uint64_t a2)
{
  unint64_t v2 = *((unsigned int *)result + 1);
  unint64_t v3 = *result + (unint64_t)result[1];
  if (v3 < v2) {
    unint64_t v2 = 0;
  }
  uint64_t v4 = &result[6 * (v3 - v2)];
  int v5 = *(_DWORD *)(a2 + 8);
  *((void *)v4 + 1) = *(void *)a2;
  *((_DWORD *)v4 + 4) = v5;
  unsigned int v6 = result[1];
  unint64_t v7 = *((unsigned int *)result + 1);
  if (v7 <= v6)
  {
    unint64_t v8 = *result + 1;
    if (v8 < v7) {
      LOWORD(v7) = 0;
    }
    *__n128 result = v8 - v7;
  }
  else
  {
    result[1] = v6 + 1;
  }
  return result;
}

BOOL sub_227CA1B5C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, float a5)
{
  if (!a2) {
    return 0;
  }
  objc_msgSend_transform(a2, (const char *)a2, a3, a4);
  double v141 = 0.0;
  double v142 = 0.0;
  uint64_t v140 = 0;
  sub_227CA2F20(&v142, &v141, (double *)&v140, v149, v150, v151);
  __double2 v8 = __sincos_stret(a5 * 3.14159265 / -180.0);
  double sinval = v8.__sinval;
  __asm { FMOV            V0.2D, #1.0 }
  float64x2_t v113 = _Q0;
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_2681BAF20, memory_order_acquire) & 1) == 0)
  {
    int v101 = __cxa_guard_acquire(qword_2681BAF20);
    double sinval = v8.__sinval;
    if (v101)
    {
      xmmword_2681BAEC0 = xmmword_227CC6470;
      *(_OWORD *)algn_2681BAED0 = 0u;
      xmmword_2681BAEE0 = xmmword_227CC6480;
      unk_2681BAEF0 = 0u;
      xmmword_2681BAF00 = 0uLL;
      xmmword_2681BAF10 = (__int128)v113;
      __cxa_guard_release(qword_2681BAF20);
      double sinval = v8.__sinval;
    }
  }
  double v112 = -sinval;
  __double2 v15 = __sincos_stret(v142 * 3.14159265 / 180.0);
  v14.f64[0] = v15.__sinval;
  float64x2_t v111 = v14;
  __double2 v23 = __sincos_stret(v141 * 3.14159265 / 180.0);
  v20.f64[0] = v23.__cosval;
  v19.f64[0] = v23.__sinval;
  long long v25 = v143;
  long long v24 = v144;
  long long v27 = v145;
  long long v26 = v146;
  long long v29 = v147;
  long long v28 = v148;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681BAFA0, memory_order_acquire) & 1) == 0)
  {
    long long v109 = v24;
    float64x2_t v110 = v20;
    long long v107 = v28;
    long long v108 = v26;
    long long v105 = v27;
    long long v106 = v25;
    long long v104 = v29;
    int v102 = __cxa_guard_acquire(&qword_2681BAFA0);
    long long v29 = v104;
    long long v27 = v105;
    long long v25 = v106;
    long long v28 = v107;
    long long v26 = v108;
    long long v24 = v109;
    v20.f64[0] = v110.f64[0];
    v19.f64[0] = v23.__sinval;
    if (v102)
    {
      xmmword_2681BAF40 = 0uLL;
      __asm { FMOV            V0.2D, #-1.0 }
      xmmword_2681BAF50 = _Q0;
      xmmword_2681BAF60 = xmmword_227CC6470;
      xmmword_2681BAF70 = 0u;
      xmmword_2681BAF80 = xmmword_227CC6490;
      unk_2681BAF90 = 0u;
      __cxa_guard_release(&qword_2681BAFA0);
      long long v29 = v104;
      long long v27 = v105;
      long long v25 = v106;
      long long v28 = v107;
      long long v26 = v108;
      long long v24 = v109;
      v20.f64[0] = v110.f64[0];
      v19.f64[0] = v23.__sinval;
    }
  }
  uint64_t v30 = 0;
  v31.f64[0] = -v19.f64[0];
  int64x2_t v138 = 0u;
  *(_OWORD *)uint64_t v139 = 0u;
  double v32 = -(v19.f64[0] * v111.f64[0]);
  v19.f64[0] = v15.__cosval * v19.f64[0];
  float64x2_t v136 = 0u;
  float64x2_t v137 = 0u;
  int64x2_t v134 = 0u;
  long long v135 = 0u;
  v121[2] = xmmword_2681BAEE0;
  v121[3] = unk_2681BAEF0;
  v121[4] = xmmword_2681BAF00;
  v121[5] = xmmword_2681BAF10;
  v121[0] = xmmword_2681BAEC0;
  v121[1] = *(_OWORD *)algn_2681BAED0;
  v33.f64[0] = v8.__cosval;
  v33.f64[1] = v112;
  v22.f64[0] = 0.0;
  do
  {
    float64x2_t v35 = (float64x2_t)v121[v30];
    float64x2_t v34 = (float64x2_t)v121[v30 + 1];
    float v36 = (float64x2_t *)((char *)&v122 + v30 * 16);
    *float v36 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v33, v35.f64[0]), (float64x2_t)v8, v35, 1), (float64x2_t)0, v34.f64[0]);
    v36[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v22, v35), v22, v35, 1), v113, v34);
    v30 += 2;
  }
  while (v30 != 6);
  uint64_t v37 = 0;
  v120[0] = v25;
  v120[1] = v24;
  v120[2] = v27;
  v120[3] = v26;
  v120[4] = v29;
  v120[5] = v28;
  v20.f64[1] = v32;
  v22.f64[1] = v15.__cosval;
  do
  {
    float64x2_t v39 = (float64x2_t)v120[v37];
    float64x2_t v38 = (float64x2_t)v120[v37 + 1];
    v21.f64[0] = v15.__cosval * v20.f64[0];
    float64x2_t v40 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v21, v39), v19, v39, 1), v38, v111);
    float v41 = &v120[v37 + 6];
    v31.f64[1] = -(v20.f64[0] * v111.f64[0]);
    *float v41 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v31, v39.f64[0]), v20, v39, 1), v22, v38.f64[0]);
    v41[1] = v40;
    v37 += 2;
  }
  while (v37 != 6);
  uint64_t v42 = 0;
  float64x2_t v43 = v122;
  float64x2_t v44 = v124;
  float64x2_t v45 = v126;
  v38.f64[0] = v123;
  v39.f64[0] = v125;
  v40.f64[0] = v127;
  *(void *)&v43.f64[1] = vextq_s8((int8x16_t)v43, (int8x16_t)v43, 8uLL).u64[0];
  *(void *)&v44.f64[1] = vextq_s8((int8x16_t)v44, (int8x16_t)v44, 8uLL).u64[0];
  *(void *)&v45.f64[1] = vextq_s8((int8x16_t)v45, (int8x16_t)v45, 8uLL).u64[0];
  do
  {
    float64x2_t v47 = (float64x2_t)v120[v42 + 6];
    float64x2_t v46 = (float64x2_t)v120[v42 + 7];
    uint64_t v48 = (float64x2_t *)((char *)&v128 + v42 * 16);
    *uint64_t v48 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v43, v47.f64[0]), v44, v47, 1), v45, v46.f64[0]);
    v48[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v38, v47), v39, v47, 1), v46, v40);
    v42 += 2;
  }
  while (v42 != 6);
  uint64_t v49 = 0;
  v119[2] = xmmword_2681BAF60;
  v119[3] = xmmword_2681BAF70;
  v119[4] = xmmword_2681BAF80;
  v119[5] = unk_2681BAF90;
  v119[0] = xmmword_2681BAF40;
  v119[1] = xmmword_2681BAF50;
  float64x2_t v50 = v128;
  float64x2_t v51 = v130;
  float64x2_t v52 = v132;
  v38.f64[0] = v129;
  v39.f64[0] = v131;
  v40.f64[0] = v133;
  *(void *)&v50.f64[1] = vextq_s8((int8x16_t)v50, (int8x16_t)v50, 8uLL).u64[0];
  *(void *)&v51.f64[1] = vextq_s8((int8x16_t)v51, (int8x16_t)v51, 8uLL).u64[0];
  *(void *)&v52.f64[1] = vextq_s8((int8x16_t)v52, (int8x16_t)v52, 8uLL).u64[0];
  do
  {
    float64x2_t v54 = (float64x2_t)v119[v49];
    float64x2_t v53 = (float64x2_t)v119[v49 + 1];
    double v55 = (float64x2_t *)&v134.i8[v49 * 16];
    *double v55 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v50, v54.f64[0]), v51, v54, 1), v52, v53.f64[0]);
    v55[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v38, v54), v39, v54, 1), v53, v40);
    v49 += 2;
  }
  while (v49 != 6);
  double v56 = *(double *)v134.i64 + v136.f64[1] + v139[0];
  if (v56 >= 0.0)
  {
    double v72 = sqrt(v56 + 1.0);
    double v73 = v72 + v72;
    double v76 = 1.0 / v73 * vsubq_f64(v137, (float64x2_t)vdupq_laneq_s64(v138, 1)).f64[0];
    double v77 = (*(double *)v138.i64 - *(double *)&v135) * (1.0 / v73);
    double v78 = 1.0 / v73 * vsubq_f64((float64x2_t)vdupq_laneq_s64(v134, 1), v136).f64[0];
    double v79 = v73 * 0.25;
  }
  else if (*(double *)v134.i64 < v136.f64[1] || *(double *)v134.i64 < v139[0])
  {
    double v58 = sqrt(1.0 - *(double *)v134.i64 - v136.f64[1] + v139[0]);
    double v59 = v58 + v58;
    double v60 = 1.0 / v59;
    double v61 = (*(double *)&v135 + *(double *)v138.i64) * (1.0 / v59);
    double v62 = vaddq_f64(v137, (float64x2_t)vdupq_laneq_s64(v138, 1)).f64[0];
    double v63 = 1.0 / v59 * v62;
    float64x2_t v64 = (float64x2_t)vdupq_laneq_s64(v134, 1);
    double v65 = v59 * 0.25;
    double v66 = v60 * vsubq_f64(v64, v136).f64[0];
    double v67 = sqrt(v136.f64[1] + 1.0 - *(double *)v134.i64 - v139[0]);
    double v68 = v67 + v67;
    double v69 = 1.0 / v68 * vaddq_f64(v64, v136).f64[0];
    double v70 = 1.0 / v68 * v62;
    if (v136.f64[1] >= v139[0]) {
      double v76 = v69;
    }
    else {
      double v76 = v61;
    }
    if (v136.f64[1] >= v139[0]) {
      double v77 = v68 * 0.25;
    }
    else {
      double v77 = v63;
    }
    if (v136.f64[1] >= v139[0]) {
      double v78 = v70;
    }
    else {
      double v78 = v65;
    }
    if (v136.f64[1] >= v139[0]) {
      double v79 = (*(double *)v138.i64 - *(double *)&v135) * (1.0 / v68);
    }
    else {
      double v79 = v66;
    }
  }
  else
  {
    double v74 = sqrt(*(double *)v134.i64 + 1.0 - v136.f64[1] - v139[0]);
    double v75 = v74 + v74;
    double v76 = v75 * 0.25;
    double v77 = 1.0 / v75 * vaddq_f64((float64x2_t)vdupq_laneq_s64(v134, 1), v136).f64[0];
    double v78 = (*(double *)&v135 + *(double *)v138.i64) * (1.0 / v75);
    double v79 = 1.0 / v75 * vsubq_f64(v137, (float64x2_t)vdupq_laneq_s64(v138, 1)).f64[0];
  }
  objc_msgSend_timestamp(a2, v16, v17, v18, v104, v105, v106, v107, v108, v109, *(_OWORD *)&v110);
  *(double *)v81.i64 = v80 * 1000000.0;
  unint64_t v82 = (unint64_t)*(double *)v81.i64;
  v81.f32[0] = v76;
  *(float *)&unsigned int v83 = v77;
  *(float *)&unsigned int v84 = v78;
  v118.i64[0] = __PAIR64__(v83, v81.u32[0]);
  v81.f32[0] = v79;
  v118.i64[1] = __PAIR64__(v81.u32[0], v84);
  sub_227CA506C(&v118, v81);
  float32x4_t v117 = v118;
  unint64_t v88 = *(unsigned __int16 *)(a1 + 4818);
  unint64_t v89 = *(unsigned int *)(a1 + 4820);
  uint64_t v90 = *(unsigned __int16 *)(a1 + 4816);
  if (v89 == v88 && *(void *)(a1 + 4824 + 8 * v90) < v82)
  {
    unint64_t v91 = v88 + v90 - 1;
    uint64_t v92 = v91 >= v88 ? *(unsigned __int16 *)(a1 + 4818) : 0;
    if (*(void *)(a1 + 4824 + 8 * (v91 - v92)) > v82)
    {
      if (v88 >= 2)
      {
        unint64_t v93 = 1;
        unint64_t v94 = v82;
        do
        {
          if (v94 >= *(void *)sub_227C9B9E4((unsigned __int16 *)(a1 + 4816), v93 - 1)
            && v94 < *(void *)sub_227C9B9E4((unsigned __int16 *)(a1 + 4816), v93))
          {
            float v114 = (float)(*(void *)sub_227C9B9E4((unsigned __int16 *)(a1 + 4816), v93) - v94) * 0.000001;
            char v95 = (float32x2_t *)sub_227CA2310((unsigned __int16 *)(a1 + 8), v93 - 1);
            BOOL v96 = (float32x2_t *)sub_227CA2310((unsigned __int16 *)(a1 + 8), v93);
            float32_t v97 = v114 * (float)((float)(v95[1].f32[0] + v96[1].f32[0]) * 0.5);
            *(float32x2_t *)v115.f32 = vmul_n_f32(vmul_f32(vadd_f32(*v95, *v96), (float32x2_t)0x3F0000003F000000), v114);
            v115.f32[2] = v97;
            *(double *)v98.i64 = sub_227CA4FB4(&v116, v115.f32);
            sub_227CA4C0C((uint64_t)&v116, v117.f32, &v115, v98);
            float32x4_t v117 = v115;
            unint64_t v94 = *(void *)sub_227C9B9E4((unsigned __int16 *)(a1 + 4816), v93);
          }
          ++v93;
        }
        while (v93 < *(unsigned __int16 *)(a1 + 4818));
      }
LABEL_48:
      if ((float32x4_t *)(a1 + 8024) != &v117) {
        *(float32x4_t *)(a1 + 8024) = v117;
      }
      *(_DWORD *)(a1 + 8040) = 989432550;
      *(void *)(a1 + 8048) = v82;
      objc_msgSend_confidence(a2, v85, v86, v87);
      return v100 >= 0.85;
    }
  }
  unint64_t v99 = v88 + v90 - 1;
  if (v99 < v89) {
    unint64_t v89 = 0;
  }
  if (*(void *)(a1 + 8 * (v99 - v89) + 4824) == v82) {
    goto LABEL_48;
  }
  if ((float32x4_t *)(a1 + 8024) != &v117) {
    *(float32x4_t *)(a1 + 8024) = v118;
  }
  BOOL result = 0;
  *(_DWORD *)(a1 + 8040) = 989432550;
  *(void *)(a1 + 8048) = v82;
  return result;
}

os_log_t sub_227CA22E0()
{
  os_log_t result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_2681B9AA8 = (uint64_t)result;
  return result;
}

uint64_t sub_227CA2310(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC297A8);
    }
    unint64_t v7 = qword_2681B9AA8;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  unint64_t v5 = *a1 + a2;
  if (v5 >= v4) {
    unint64_t v4 = v4;
  }
  else {
    unint64_t v4 = 0;
  }
  return (uint64_t)&a1[6 * (v5 - v4) + 4];
}

uint64_t sub_227CA242C(float *a1)
{
  sub_227BE19AC(v14);
  sub_227C04548((uint64_t)v14);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v16 |= 1u;
  *(CFAbsoluteTime *)&v14[77] = Current;
  uint64_t v3 = v15;
  uint64_t v4 = *(void *)a1;
  *(unsigned char *)(v15 + 40) |= 2u;
  *(void *)(v3 + 16) = v4;
  uint64_t v5 = v15;
  double v6 = a1[2];
  *(unsigned char *)(v15 + 40) |= 1u;
  *(double *)(v5 + 8) = v6;
  uint64_t v7 = v15;
  int v8 = *((char *)a1 + 12);
  *(unsigned char *)(v15 + 40) |= 4u;
  *(_DWORD *)(v7 + 24) = v8;
  uint64_t v9 = v15;
  *(float *)&double v6 = a1[4];
  *(unsigned char *)(v15 + 40) |= 0x10u;
  *(_DWORD *)(v9 + 32) = LODWORD(v6);
  uint64_t v10 = v15;
  *(float *)&double v6 = a1[5];
  *(unsigned char *)(v15 + 40) |= 8u;
  *(_DWORD *)(v10 + 28) = LODWORD(v6);
  uint64_t v11 = v15;
  LOBYTE(v8) = *((unsigned char *)a1 + 24);
  *(unsigned char *)(v15 + 40) |= 0x20u;
  *(unsigned char *)(v11 + 36) = v8;
  uint64_t v12 = v15;
  LOBYTE(v8) = *((unsigned char *)a1 + 25);
  *(unsigned char *)(v15 + 40) |= 0x40u;
  *(unsigned char *)(v12 + 37) = v8;
  sub_227CA175C((uint64_t)v14);
  return sub_227BE6EB4((PB::Base *)v14);
}

void sub_227CA2534(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_227CA2548(uint64_t a1, float *a2, double a3)
{
  sub_227BE19AC(v31);
  sub_227C04428((uint64_t)v31);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v33 |= 1u;
  *(CFAbsoluteTime *)&v31[77] = Current;
  uint64_t v7 = v32;
  *(_WORD *)(v32 + 92) |= 0x40u;
  *(double *)(v7 + 56) = a3;
  uint64_t v8 = v32;
  double v9 = *(float *)(a1 + 12);
  *(_WORD *)(v32 + 92) |= 1u;
  *(double *)(v8 + 8) = v9;
  uint64_t v10 = v32;
  double v11 = *(float *)(a1 + 16);
  *(_WORD *)(v32 + 92) |= 2u;
  *(double *)(v10 + 16) = v11;
  uint64_t v12 = v32;
  double v13 = a2[2];
  *(_WORD *)(v32 + 92) |= 4u;
  *(double *)(v12 + 24) = v13;
  uint64_t v14 = v32;
  double v15 = a2[3];
  *(_WORD *)(v32 + 92) |= 8u;
  *(double *)(v14 + 32) = v15;
  uint64_t v16 = v32;
  double v17 = a2[4];
  *(_WORD *)(v32 + 92) |= 0x10u;
  *(double *)(v16 + 40) = v17;
  uint64_t v18 = v32;
  double v19 = a2[5];
  *(_WORD *)(v32 + 92) |= 0x20u;
  *(double *)(v18 + 48) = v19;
  uint64_t v20 = v32;
  double v21 = a2[6];
  *(_WORD *)(v32 + 92) |= 0x80u;
  *(double *)(v20 + 64) = v21;
  uint64_t v22 = v32;
  double v23 = a2[7];
  *(_WORD *)(v32 + 92) |= 0x100u;
  *(double *)(v22 + 72) = v23;
  uint64_t v24 = v32;
  char v25 = *(unsigned char *)(a1 + 20);
  *(_WORD *)(v32 + 92) |= 0x800u;
  *(unsigned char *)(v24 + 88) = v25;
  uint64_t v26 = v32;
  int v27 = *(_DWORD *)(a1 + 24);
  *(_WORD *)(v32 + 92) |= 0x400u;
  *(_DWORD *)(v26 + 84) = v27;
  uint64_t v28 = v32;
  LODWORD(v23) = *(_DWORD *)(a1 + 8);
  *(_WORD *)(v32 + 92) |= 0x200u;
  *(_DWORD *)(v28 + 80) = LODWORD(v23);
  uint64_t v29 = v32;
  LOBYTE(v27) = *(unsigned char *)(a1 + 28);
  *(_WORD *)(v32 + 92) |= 0x1000u;
  *(unsigned char *)(v29 + 89) = v27;
  sub_227CA175C((uint64_t)v31);
  return sub_227BE6EB4((PB::Base *)v31);
}

void sub_227CA2710(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_227CA2724()
{
  sub_227BE19AC(v5);
  sub_227C04668((uint64_t)v5);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v7 |= 1u;
  *(CFAbsoluteTime *)&v5[77] = Current;
  uint64_t v1 = v6;
  double v2 = sub_227C40864();
  *(unsigned char *)(v1 + 20) |= 1u;
  *(double *)(v1 + 8) = v2;
  uint64_t v3 = v6;
  *(unsigned char *)(v6 + 20) |= 2u;
  *(unsigned char *)(v3 + 16) = 1;
  sub_227CA175C((uint64_t)v5);
  return sub_227BE6EB4((PB::Base *)v5);
}

void sub_227CA27AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_227CA27C0(double *a1)
{
  sub_227CA48B4(0x2B7304A4u, 1, 1, 0, 0, 0);
  sub_227BE19AC(v20);
  sub_227C04278((uint64_t)v20);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v22 |= 1u;
  *(CFAbsoluteTime *)&v20[77] = Current;
  uint64_t v3 = v21;
  double v4 = *a1;
  *(_DWORD *)(v21 + 124) |= 0x10u;
  *(double *)(v3 + 40) = v4;
  uint64_t v5 = v21;
  uint64_t v6 = *((void *)a1 + 1);
  *(_DWORD *)(v21 + 124) |= 2u;
  *(void *)(v5 + 16) = v6;
  uint64_t v7 = v21;
  uint64_t v8 = *((void *)a1 + 2);
  *(_DWORD *)(v21 + 124) |= 4u;
  *(void *)(v7 + 24) = v8;
  uint64_t v9 = v21;
  uint64_t v10 = *((void *)a1 + 3);
  *(_DWORD *)(v21 + 124) |= 8u;
  *(void *)(v9 + 32) = v10;
  uint64_t v11 = v21;
  uint64_t v12 = *((void *)a1 + 4);
  *(_DWORD *)(v21 + 124) |= 1u;
  *(void *)(v11 + 8) = v12;
  uint64_t v13 = v21;
  *(float *)&uint64_t v12 = a1[8];
  *(_DWORD *)(v21 + 124) |= 0x40000u;
  *(_DWORD *)(v13 + 100) = v12;
  uint64_t v14 = v21;
  *(float *)&uint64_t v12 = a1[9];
  *(_DWORD *)(v21 + 124) |= 0x80000u;
  *(_DWORD *)(v14 + 104) = v12;
  uint64_t v15 = v21;
  *(float *)&uint64_t v12 = a1[10];
  *(_DWORD *)(v21 + 124) |= 0x100000u;
  *(_DWORD *)(v15 + 108) = v12;
  uint64_t v16 = v21;
  *(float *)&uint64_t v12 = a1[5];
  *(_DWORD *)(v21 + 124) |= 0x2000u;
  *(_DWORD *)(v16 + 80) = v12;
  uint64_t v17 = v21;
  *(float *)&uint64_t v12 = a1[6];
  *(_DWORD *)(v21 + 124) |= 0x4000u;
  *(_DWORD *)(v17 + 84) = v12;
  uint64_t v18 = v21;
  *(float *)&uint64_t v12 = a1[7];
  *(_DWORD *)(v21 + 124) |= 0x8000u;
  *(_DWORD *)(v18 + 88) = v12;
  sub_227CA175C((uint64_t)v20);
  sub_227CA48B4(0x2B7304A4u, 2, 1, 0, 0, 0);
  return sub_227BE6EB4((PB::Base *)v20);
}

void sub_227CA297C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_227CA2990(uint64_t *a1)
{
  sub_227BE19AC(v8);
  sub_227C045D8((uint64_t)v8);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v10 |= 1u;
  *(CFAbsoluteTime *)&v8[77] = Current;
  uint64_t v3 = v9;
  uint64_t v4 = *a1;
  *(unsigned char *)(v9 + 20) |= 1u;
  *(void *)(v3 + 8) = v4;
  uint64_t v5 = v9;
  int v6 = *((_DWORD *)a1 + 2);
  *(unsigned char *)(v9 + 20) |= 2u;
  *(_DWORD *)(v5 + 16) = v6;
  sub_227CA175C((uint64_t)v8);
  return sub_227BE6EB4((PB::Base *)v8);
}

void sub_227CA2A1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_227CA2A30(double *a1)
{
  sub_227CA48B4(0x2B7304A8u, 1, 1, 0, 0, 0);
  sub_227BE19AC(v14);
  sub_227C04398((uint64_t)v14);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v16 |= 1u;
  *(CFAbsoluteTime *)&v14[77] = Current;
  uint64_t v3 = v15;
  double v4 = *a1;
  *(unsigned char *)(v15 + 56) |= 8u;
  *(double *)(v3 + 32) = v4;
  uint64_t v5 = v15;
  uint64_t v6 = *((void *)a1 + 1);
  *(unsigned char *)(v15 + 56) |= 0x10u;
  *(void *)(v5 + 40) = v6;
  uint64_t v7 = v15;
  unint64_t v8 = (unint64_t)a1[2];
  *(unsigned char *)(v15 + 56) |= 2u;
  *(void *)(v7 + 16) = v8;
  uint64_t v9 = v15;
  uint64_t v10 = *((void *)a1 + 3);
  *(unsigned char *)(v15 + 56) |= 0x20u;
  *(void *)(v9 + 48) = v10;
  uint64_t v11 = v15;
  uint64_t v12 = *((unsigned __int16 *)a1 + 16);
  *(unsigned char *)(v15 + 56) |= 1u;
  *(void *)(v11 + 8) = v12;
  sub_227CA175C((uint64_t)v14);
  sub_227CA48B4(0x2B7304A8u, 2, 1, 0, 0, 0);
  return sub_227BE6EB4((PB::Base *)v14);
}

void sub_227CA2B48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_227CA2B5C(uint64_t a1)
{
  sub_227BE19AC(v8);
  sub_227C04308((uint64_t)v8);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v10 |= 1u;
  *(CFAbsoluteTime *)&v8[77] = Current;
  BOOL v3 = *(_DWORD *)(a1 + 8) != 1;
  uint64_t v4 = v9;
  *(unsigned char *)(v9 + 16) |= 2u;
  *(_DWORD *)(v4 + 12) = v3;
  BOOL v5 = *(_DWORD *)(a1 + 12) != 1;
  uint64_t v6 = v9;
  *(unsigned char *)(v9 + 16) |= 1u;
  *(_DWORD *)(v6 + 8) = v5;
  sub_227CA175C((uint64_t)v8);
  return sub_227BE6EB4((PB::Base *)v8);
}

void sub_227CA2BF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_227CA2C0C(uint64_t *a1)
{
  sub_227BE19AC(v11);
  sub_227C044B8((uint64_t)v11);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v13 |= 1u;
  *(CFAbsoluteTime *)&v11[77] = Current;
  uint64_t v3 = v12;
  uint64_t v4 = *a1;
  *(unsigned char *)(v12 + 44) |= 1u;
  *(void *)(v3 + 8) = v4;
  uint64_t v5 = v12;
  LODWORD(v4) = *((_DWORD *)a1 + 2);
  *(unsigned char *)(v12 + 44) |= 2u;
  *(_DWORD *)(v5 + 16) = v4;
  uint64_t v6 = v12;
  LODWORD(v4) = *((_DWORD *)a1 + 3);
  *(unsigned char *)(v12 + 44) |= 0x10u;
  *(_DWORD *)(v6 + 28) = v4;
  uint64_t v7 = v12;
  LODWORD(v4) = *((_DWORD *)a1 + 4);
  *(unsigned char *)(v12 + 44) |= 0x20u;
  *(_DWORD *)(v7 + 32) = v4;
  uint64_t v8 = v12;
  LODWORD(v4) = *((_DWORD *)a1 + 5);
  *(unsigned char *)(v12 + 44) |= 0x40u;
  *(_DWORD *)(v8 + 36) = v4;
  uint64_t v9 = v12;
  LODWORD(v4) = *((_DWORD *)a1 + 6);
  *(unsigned char *)(v12 + 44) |= 0x80u;
  *(_DWORD *)(v9 + 40) = v4;
  sub_227CA175C((uint64_t)v11);
  return sub_227BE6EB4((PB::Base *)v11);
}

void sub_227CA2CF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_227CA2D0C(void *a1)
{
  sub_227BE19AC(v10);
  sub_227C04788((uint64_t)v10);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v13 |= 1u;
  CFAbsoluteTime v12 = Current;
  uint64_t v3 = v11;
  uint64_t v4 = a1[2];
  *(unsigned char *)(v11 + 40) |= 4u;
  *(void *)(v3 + 24) = v4;
  uint64_t v5 = v11;
  uint64_t v6 = a1[3];
  *(unsigned char *)(v11 + 40) |= 2u;
  *(void *)(v5 + 16) = v6;
  uint64_t v7 = v11;
  uint64_t v8 = a1[1];
  *(unsigned char *)(v11 + 40) |= 1u;
  *(void *)(v7 + 8) = v8;
  sub_227CA175C((uint64_t)v10);
  return sub_227BE6EB4((PB::Base *)v10);
}

void sub_227CA2DB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_227CA2DC4(float *a1)
{
  sub_227BE19AC(v22);
  sub_227C046F8((uint64_t)v22);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v24 |= 1u;
  *(CFAbsoluteTime *)&v22[77] = Current;
  uint64_t v3 = v23;
  uint64_t v4 = *(void *)a1;
  *(_WORD *)(v23 + 60) |= 0x10u;
  *(void *)(v3 + 40) = v4;
  uint64_t v5 = v23;
  double v6 = a1[2];
  *(_WORD *)(v23 + 60) |= 2u;
  *(double *)(v5 + 16) = v6;
  uint64_t v7 = v23;
  double v8 = a1[3];
  *(_WORD *)(v23 + 60) |= 0x20u;
  *(double *)(v7 + 48) = v8;
  uint64_t v9 = v23;
  double v10 = a1[4];
  *(_WORD *)(v23 + 60) |= 8u;
  *(double *)(v9 + 32) = v10;
  uint64_t v11 = v23;
  double v12 = a1[5];
  *(_WORD *)(v23 + 60) |= 1u;
  *(double *)(v11 + 8) = v12;
  uint64_t v13 = v23;
  double v14 = a1[6];
  *(_WORD *)(v23 + 60) |= 4u;
  *(double *)(v13 + 24) = v14;
  uint64_t v15 = v23;
  char v16 = *((unsigned char *)a1 + 28);
  *(_WORD *)(v23 + 60) |= 0x100u;
  *(unsigned char *)(v15 + 58) = v16;
  uint64_t v17 = v23;
  char v18 = *((unsigned char *)a1 + 29);
  *(_WORD *)(v23 + 60) |= 0x40u;
  *(unsigned char *)(v17 + 56) = v18;
  uint64_t v19 = v23;
  char v20 = *((unsigned char *)a1 + 30);
  *(_WORD *)(v23 + 60) |= 0x80u;
  *(unsigned char *)(v19 + 57) = v20;
  sub_227CA175C((uint64_t)v22);
  return sub_227BE6EB4((PB::Base *)v22);
}

void sub_227CA2F0C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

void sub_227CA2F20(double *a1, long double *a2, double *a3, long double a4, long double a5, long double a6)
{
  double v9 = sqrt(a5 * a5 + a4 * a4);
  *a2 = atan2(a5, a4) / 0.0174532925;
  double v10 = v9 * 0.99330562;
  double v11 = 0.0;
  double v12 = 1.57079633;
  if (v9 * 0.99330562 != 0.0)
  {
    long double __y = a6;
    unsigned int v13 = 0;
    double v12 = 0.0;
    double v14 = 0.0;
    do
    {
      double v15 = v12;
      double v12 = atan2(__y, v10);
      __double2 v16 = __sincos_stret(v12);
      double v17 = 6378137.0 / sqrt(v16.__sinval * -0.00669437999 * v16.__sinval + 1.0);
      double v11 = v9 / v16.__cosval - v17;
      if (vabdd_f64(v15, v12) >= 0.000001)
      {
        if (v13 > 8) {
          goto LABEL_13;
        }
      }
      else if (vabdd_f64(v14, v11) < 0.001 || v13 >= 9)
      {
        goto LABEL_13;
      }
      ++v13;
      double v10 = v9 * (v17 / (v11 + v17) * -0.00669437999 + 1.0);
      double v14 = v9 / v16.__cosval - v17;
    }
    while (v10 != 0.0);
    double v12 = 1.57079633;
  }
LABEL_13:
  *a1 = v12 / 0.0174532925;
  *a3 = v11;
}

uint64_t sub_227CA3094(uint64_t a1)
{
  *(void *)a1 = 0xBFF0000000000000;
  uint64_t v2 = a1 + 21164;
  *(void *)(a1 + 8) = 3212836864;
  *(_DWORD *)(a1 + 16) = 1127481344;
  uint64_t v3 = a1 + 20672;
  *(unsigned char *)(a1 + 20) = 0;
  *(_DWORD *)(a1 + 24) = 2;
  *(unsigned char *)(a1 + 28) = 0;
  *(void *)(a1 + 32) = 0xBFF0000000000000;
  *(_DWORD *)(a1 + 40) = 1127481344;
  *(void *)(a1 + 52) = 0;
  *(void *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 60) = 0;
  *(void *)(a1 + 64) = 0xBFF0000000000000;
  *(_OWORD *)(a1 + 72) = xmmword_227CC6500;
  *(_DWORD *)(a1 + 88) = 0;
  *(_DWORD *)(a1 + 91) = 0;
  *(void *)(a1 + 96) = &unk_26DC29818;
  *(void *)(a1 + 104) = 0x3F8374BC6A7EF9DBLL;
  *(void *)(a1 + 112) = 0;
  *(int32x4_t *)(a1 + 120) = vdupq_n_s32(0x7FC00000u);
  sub_227C87A0C(a1 + 136);
  *(_OWORD *)(a1 + 20656) = xmmword_227CC6510;
  *(_DWORD *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 4) = 0;
  *(void *)(a1 + 20680) = 0xBFF0000000000000;
  *(unsigned char *)(a1 + 20696) = 0;
  *(void *)(a1 + 20688) = 0;
  sub_227C9766C(a1 + 20704);
  sub_227C9ECF8(a1 + 20944);
  *(unsigned char *)(v3 + 488) = 0;
  *(unsigned char *)uint64_t v2 = 1;
  *(_DWORD *)(v2 + 20) = 4;
  *(void *)(a1 + 21176) = 0;
  *(unsigned char *)(v2 + 40) = 1;
  *(_DWORD *)(v2 + 60) = 4;
  *(void *)(a1 + 21216) = 0;
  *(void *)(a1 + 21248) = 0xBFF0000000000000;
  *(void *)(a1 + 21256) = 0;
  *(_DWORD *)(a1 + 21263) = 0;
  *(void *)(a1 + 21272) = 10000;
  *(unsigned char *)(v2 + 116) = 0;
  *(void *)(a1 + 21288) = 0xC12E848000000000;
  *(_DWORD *)(v2 + 132) = -1082130432;
  *(void *)(a1 + 21304) = 0xC12E848000000000;
  *(unsigned char *)(v2 + 148) = 0;
  *(unsigned char *)(v2 + 188) = 0;
  *(void *)(a1 + 21360) = 0;
  *(void *)(a1 + 21376) = 0;
  *(void *)(a1 + 21368) = 0;
  *(unsigned char *)(a1 + 21384) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(a1 + 21392) = _Q0;
  __asm { FMOV            V0.2S, #-1.0 }
  *(void *)(a1 + 21408) = _Q0;
  *(_WORD *)(v2 + 252) = 0;
  *(unsigned char *)(v2 + 254) = 0;
  *(int64x2_t *)(a1 + 21424) = vdupq_n_s64(0xC12E848000000000);
  *(_WORD *)(v2 + 276) = 0;
  *(void *)(v2 + 280) = 0x42C80000BF800000;
  *(_DWORD *)(v2 + 288) = 0;
  *(unsigned char *)(v2 + 292) = 0;
  *(void *)(a1 + 21464) = &unk_26DC29818;
  *(void *)(a1 + 21480) = 0;
  *(void *)(a1 + 21472) = 0x3FDFF7CED916872BLL;
  sub_227CA32C8(a1);
  return a1;
}

void sub_227CA32B4(_Unwind_Exception *a1)
{
  sub_227BD6BE4(v1);
  _Unwind_Resume(a1);
}

double sub_227CA32C8(uint64_t a1)
{
  uint64_t v2 = a1 + 21266;
  sub_227C97C88(a1 + 20704);
  *(_OWORD *)(a1 + 21312) = xmmword_227CC6520;
  *(unsigned char *)uint64_t v2 = 0;
  *(void *)(a1 + 8) = 3212836864;
  *(_DWORD *)(a1 + 16) = 1127481344;
  sub_227C9ECFC(a1 + 20944, *(void *)(a1 + 21272));
  *(unsigned char *)(a1 + 20) = 0;
  *(_DWORD *)(a1 + 24) = 2;
  sub_227CA12F8(a1 + 21360);
  __asm { FMOV            V0.2S, #-1.0 }
  *(void *)(a1 + 21408) = _D0;
  *(_WORD *)(v2 + 150) = 0;
  *(unsigned char *)(v2 + 152) = 0;
  *(int64x2_t *)(a1 + 21424) = vdupq_n_s64(0xC12E848000000000);
  *(_WORD *)(v2 + 174) = 0;
  double result = 5.27765832e13;
  *(void *)(v2 + 178) = 0x42C80000BF800000;
  *(_DWORD *)(v2 + 186) = 0;
  return result;
}

void sub_227CA3384(uint64_t a1, unint64_t a2)
{
  *(void *)(a1 + 21272) = a2;
}

void sub_227CA33B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 21080;
  sub_227CA48B4(0x2B7304ACu, 1, 1, 0, 0, 0);
  *(void *)a1 = *(void *)a2;
  if (*(unsigned char *)(v4 + 185) && *(unsigned char *)(v4 + 186))
  {
    float32x4_t v5 = *(float32x4_t *)(a2 + 24);
    float32x4_t v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a2 + 8)), (float64x2_t)v5);
    sub_227CA506C(&v12, v5);
    float v6 = *(double *)(a2 + 80);
    float32x2_t v10 = vmul_f32(vcvt_f32_f64(*(float64x2_t *)(a2 + 64)), (float32x2_t)vdup_n_s32(0xC11CE80A));
    float v11 = v6 * -9.8067;
    sub_227CA4F18(v12.f32, (uint64_t)&v10);
    sub_227C9EE94(a1 + 20944, &v10, *(double *)a2);
    if (sub_227C92C6C(a1 + 96, a2)) {
      sub_227CA3588(a1, *(double *)a2);
    }
    *(void *)(a1 + 32) = *(void *)a2;
    *(_OWORD *)(a1 + 44) = *(_OWORD *)(a1 + 21060);
    *(_DWORD *)(a1 + 60) = *(_DWORD *)(a1 + 21076);
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(v4 + 64);
    float v7 = sub_227CA3720(a1, v12.f32);
    float v8 = (float)(*(float *)v4 + *(float *)v4) * 57.296;
    *(float *)(a1 + 12) = v7;
    *(float *)(a1 + 16) = v8;
    *(float *)(a1 + 40) = v8;
    sub_227CA37D8(a1, *(double *)a2);
    sub_227CA3960(a1, *(double *)a2);
    sub_227CA48B4(0x2B7304ACu, 2, 1, 0, 0, 0);
  }
  else
  {
    sub_227C92C6C(a1 + 96, a2);
    if (*(unsigned char *)(v4 + 304))
    {
      float v9 = *(double *)(a1 + 21360);
      *(float *)(a1 + 8) = v9;
      *(unsigned char *)(a1 + 28) = 1;
      if (*(double *)a1 - *(double *)(a1 + 21376) > 2.0) {
        *(unsigned char *)(a1 + 28) = 0;
      }
    }
  }
}

void sub_227CA3588(uint64_t a1, double a2)
{
  uint64_t v4 = (float *)(a1 + 20952);
  float v5 = *(float *)(a1 + 8);
  float v6 = *(float *)(a1 + 20656) + 0.04;
  if (v6 > 1.3 && v5 >= 3.0 && v5 < 5.0) {
    float v6 = 1.3;
  }
  if (v6 > 0.6 && v5 < 3.0) {
    float v10 = 0.6;
  }
  else {
    float v10 = v6;
  }
  if (*(unsigned char *)(a1 + 20696))
  {
    float v11 = atan2f(*(float *)(a1 + 124), *(float *)(a1 + 120));
    __float2 v12 = __sincosf_stret(v11);
    uint64_t v13 = *(void *)(a1 + 128);
    sub_227CA48B4(0x2B73048Cu, 1, 1, 0, 0, 0);
    *uint64_t v4 = v10 * v12.__cosval;
    v4[1] = v10 * v12.__sinval;
    *(void *)(a1 + 20960) = v13;
    sub_227C9F340(a1 + 20944, 2, a2);
    sub_227CA48B4(0x2B73048Cu, 2, 1, 0, 0, 0);
    *(double *)(a1 + 21304) = a2;
  }
  else
  {
    sub_227CA48B4(0x2B730490u, 1, 1, 0, 0, 0);
    v4[4] = v10;
    sub_227C9F340(a1 + 20944, 1, a2);
    sub_227CA48B4(0x2B730490u, 2, 1, 0, 0, 0);
  }
}

float sub_227CA3720(uint64_t a1, float *a2)
{
  uint64_t v3 = 0;
  float v10 = 0.0;
  float32x2_t v4 = vneg_f32(*(float32x2_t *)(a1 + 44));
  float32x2_t v9 = v4;
  int32x2_t v5 = 0;
  do
  {
    *(float *)v5.i32 = *(float *)v5.i32 + (float)(v9.f32[v3] * v9.f32[v3]);
    ++v3;
  }
  while (v3 != 3);
  *(float *)v5.i32 = sqrtf(*(float *)v5.i32);
  float32x2_t v9 = vdiv_f32(v4, (float32x2_t)vdup_lane_s32(v5, 0));
  float v10 = 0.0 / *(float *)v5.i32;
  sub_227CA4E7C(a2, (uint64_t)&v9);
  float v7 = v9.f32[1];
  float v6 = v9.f32[0];
  if (*(_DWORD *)(a1 + 21260) == 1)
  {
    float v7 = -v9.f32[1];
    float v6 = -v9.f32[0];
  }
  return atan2f(v6, v7) * 57.296;
}

void sub_227CA37D8(uint64_t a1, double a2)
{
  uint64_t v3 = a1 + 21160;
  double v4 = a2 - *(double *)(a1 + 21312);
  BOOL v5 = v4 > 3.0;
  if (a2 - *(double *)(a1 + 21304) <= 3.0) {
    BOOL v5 = 0;
  }
  if (v4 > 5.0 && *(float *)(a1 + 8) > 15.0 || v4 > 10.0 || v5)
  {
    if (*(unsigned char *)(a1 + 21384))
    {
      float v9 = *(double *)(a1 + 21360);
      *(float *)(a1 + 8) = v9;
      *(unsigned char *)(a1 + 28) = 1;
      if (*(double *)a1 - *(double *)(a1 + 21376) > 2.0) {
        *(unsigned char *)(a1 + 28) = 0;
      }
    }
  }
  int v10 = *(unsigned __int8 *)(a1 + 20);
  float v11 = *(float *)(a1 + 16);
  if (!sub_227CA4240(a1))
  {
    if (v10)
    {
      sub_227CA42B0(a1, v4 > 10.0, v11 > 120.0, v11 < 100.0);
    }
    else
    {
      float v12 = *(float *)(a1 + 8);
      float v13 = v12 - *(float *)(v3 + 136);
      if (v13 <= 0.0) {
        float v13 = -v13;
      }
      if (v4 >= 0.5 || v11 >= 100.0 || v12 < 2.0 || v13 <= 0.5)
      {
        int v17 = *(_DWORD *)(a1 + 24);
      }
      else
      {
        int v17 = 0;
        *(unsigned char *)uint64_t v3 = 1;
      }
      *(_DWORD *)(a1 + 24) = v17;
      *(unsigned char *)(a1 + 20) = v17 == 0;
    }
  }
}

uint64_t sub_227CA3960(uint64_t result, double a2)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  uint64_t v2 = result + 21148;
  if (!*(unsigned char *)(result + 21416)) {
    return result;
  }
  uint64_t v3 = result;
  BOOL v4 = !*(unsigned char *)(result + 21417) && *(unsigned char *)(result + 28) && *(float *)(result + 8) < 8.0
    || *(unsigned char *)(result + 21417) != 0;
  *(unsigned char *)(result + 21417) = v4;
  BOOL v5 = (float *)(result + 80);
  float v6 = *(float *)(result + 80);
  BOOL v8 = vabds_f32(v6, *(float *)(result + 21408)) > 1.7 || *(unsigned char *)(result + 21418) != 0;
  *(unsigned char *)(result + 21418) = v8;
  float v9 = *(float *)v2;
  BOOL v10 = *(float *)v2 <= 0.9;
  BOOL v11 = *(float *)v2 > 0.9;
  *(unsigned char *)(result + 21456) = v11;
  if (v10)
  {
    BOOL v13 = 0;
    *(double *)(result + 21424) = a2;
    double v12 = a2 - a2;
    *(void *)(result + 21444) = 0x42C80000BF800000;
    float v15 = -1.0;
    float v14 = 100.0;
  }
  else
  {
    double v12 = a2 - *(double *)(result + 21424);
    BOOL v13 = v12 > 4.5;
    if (*(unsigned char *)(result + 28))
    {
      float v14 = *(float *)(result + 8);
      float v15 = *(float *)(result + 21444);
      if (v14 > v15) {
        float v15 = *(float *)(result + 8);
      }
      *(float *)(result + 21444) = v15;
      if (v14 >= *(float *)(result + 21448)) {
        float v14 = *(float *)(result + 21448);
      }
      *(float *)(result + 21448) = v14;
    }
    else
    {
      float v15 = *(float *)(result + 21444);
      float v14 = *(float *)(result + 21448);
    }
  }
  float v16 = v15 - v14;
  char v17 = !v4;
  if (!*(unsigned char *)(result + 21160)) {
    char v17 = 1;
  }
  if ((v17 & 1) != 0 || v8 || !v13 || v16 <= 0.5 || *(unsigned char *)(result + 21441))
  {
    char v18 = *(unsigned char *)(result + 21440);
    if (!v18)
    {
      double v19 = a2;
      goto LABEL_31;
    }
  }
  else
  {
    *(unsigned char *)(result + 21440) = 1;
  }
  double v19 = *(double *)(result + 21432);
  char v18 = 1;
LABEL_31:
  char v20 = (float *)(result + 64);
  *(double *)(result + 21432) = v19;
  double v21 = a2 - v19;
  if (v9 > 0.9) {
    BOOL v5 = (float *)(result + 21452);
  }
  float v22 = *v5;
  *(float *)(result + 21452) = *v5;
  float v23 = vabds_f32(v22, v6);
  if (v21 > 10.0 || v23 > 1.0)
  {
    char v18 = 0;
    *(_WORD *)(result + 21440) = 256;
  }
  int32x2_t v24 = vrev64_s32(*(int32x2_t *)(result + 21136));
  *(void *)(result + 64) = *(void *)(result + 32);
  *(int32x2_t *)(result + 72) = v24;
  *(_DWORD *)(result + 80) = *(_DWORD *)(result + 21412);
  *(float *)(result + 84) = v9;
  *(_DWORD *)(result + 88) = *(_DWORD *)(result + 21152);
  *(unsigned char *)(result + 92) = *(unsigned char *)(result + 20);
  *(unsigned char *)(result + 93) = v11;
  *(unsigned char *)(result + 94) = v18;
  double v25 = *(double *)(result + 21472);
  if (v25 <= 0.0 || v25 + *(double *)(result + 21480) <= a2)
  {
    *(double *)(result + 21480) = a2;
    if (qword_2681B9A60 != -1) {
      dispatch_once(&qword_2681B9A60, &unk_26DC297C8);
    }
    uint64_t v26 = qword_2681B9A68;
    if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(v3 + 64);
      double v28 = *(float *)(v3 + 72);
      double v29 = *(float *)(v3 + 76);
      double v30 = *(float *)(v3 + 80);
      int v31 = *(unsigned __int8 *)(v3 + 92);
      double v32 = *(float *)(v3 + 84);
      double v33 = *(float *)(v3 + 88);
      int v34 = *(unsigned __int8 *)(v3 + 93);
      int v35 = *(unsigned __int8 *)(v3 + 94);
      int v36 = *(unsigned __int8 *)(v2 + 269);
      int v37 = *(unsigned __int8 *)(v2 + 270);
      int v38 = *(unsigned __int8 *)(v2 + 293);
      int v39 = 134353920;
      uint64_t v40 = v27;
      __int16 v41 = 2050;
      double v42 = v28;
      __int16 v43 = 2050;
      double v44 = v29;
      __int16 v45 = 2050;
      double v46 = v30;
      __int16 v47 = 2050;
      double v48 = v32;
      __int16 v49 = 2050;
      double v50 = v33;
      __int16 v51 = 1026;
      int v52 = v31;
      __int16 v53 = 1026;
      int v54 = v34;
      __int16 v55 = 1026;
      int v56 = v35;
      __int16 v57 = 1026;
      int v58 = v36;
      __int16 v59 = 1026;
      int v60 = v37;
      __int16 v61 = 2050;
      double v62 = v12;
      __int16 v63 = 1026;
      BOOL v64 = v13;
      __int16 v65 = 2050;
      double v66 = v16;
      __int16 v67 = 1026;
      BOOL v68 = v16 > 0.5;
      __int16 v69 = 2050;
      double v70 = v21;
      __int16 v71 = 1026;
      BOOL v72 = v21 > 10.0;
      __int16 v73 = 2050;
      double v74 = v23;
      __int16 v75 = 1026;
      BOOL v76 = v23 > 1.0;
      __int16 v77 = 1026;
      int v78 = v38;
      _os_log_impl(&dword_227B19000, v26, OS_LOG_TYPE_DEFAULT, "CMPrecisionFindingPositionEstimator::fVerticalState,timestamp,%{public}f,horizontalDistance,%{public}f,verticalDistance,%{public}f,relativeAltitude,%{public}f,fractionAboveThreshold,%{public}f,likelihoodAboveThreshold,%{public}f,isConverged,%{public}d,isAboveBelow,%{public}d,isAboveBelowMessageShowing,%{public}d,wasInMediumRange,%{public}d,wasLevelChanged,%{public}d,timeElapsedSinceAboveBelowFractionHigh,%{public}f,isAboveBelowFractionConsistentlyHigh,%{public}d,distanceChangeSinceAboveBelowFractionHigh,%{public}f,isDistanceChangedEnoughForAboveBelowMessage,%{public}d,timeElapsedSinceAboveBelowMessageShown,%{public}f,aboveBelowMessageShownLongerThanThreshold,%{public}d,elevationChangeSinceAboveBelowMessageShown,%{public}f,isChangingLevelWhileAboveBelowMessageShowing,%{public}d,wasAboveBelowMessageShown,%{public}d", (uint8_t *)&v39, 0xA2u);
    }
  }
  return sub_227CA2DC4(v20);
}

double sub_227CA3D50(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 8);
  if (result > 0.00999999978)
  {
    uint64_t v5 = a1 + 21144;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = a1 + 20704;
    sub_227C976C4(a2, (uint64_t)&v19);
    sub_227CA48B4(0x2B7304B0u, 1, 1, 0, 0, 0);
    if (*(unsigned char *)(v5 + 121)
      && (float v7 = *(double *)(a2 + 8), (sub_227C97B90(v6, *(unsigned __int8 *)(v5 + 16), v7) & 1) != 0))
    {
      sub_227C976F0(v6, a2, (uint64_t)&v19);
      if (BYTE9(v20))
      {
        if (*(unsigned char *)(v5 + 122))
        {
          double v8 = *(double *)(a2 + 8);
        }
        else
        {
          if (qword_2681B9A60 != -1) {
            dispatch_once(&qword_2681B9A60, &unk_26DC297C8);
          }
          float v9 = qword_2681B9A68;
          if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)char v18 = 0;
            _os_log_impl(&dword_227B19000, v9, OS_LOG_TYPE_DEFAULT, "Particle filter successfully initialized.", v18, 2u);
          }
          *(unsigned char *)(v5 + 122) = 1;
          double v8 = *(double *)(a2 + 8);
          float v10 = v8;
          *(float *)(v5 + 152) = v10;
        }
        LODWORD(v20) = sub_227C97BF8(v6, v8);
        float v11 = *(double *)(a2 + 8) - *(double *)(a1 + 21320);
        int v12 = sub_227C97C4C(*(double *)a2 - *(double *)(a1 + 21312), v11, v6, *(unsigned __int8 *)(v5 + 16));
        float v13 = *(double *)(a2 + 8);
        sub_227C9F2B8(a1 + 20944, v12, v13, *(double *)a2, *(float *)&v20);
        float v14 = *(float *)v5;
        *(_DWORD *)(a1 + 8) = *(_DWORD *)v5;
        *(unsigned char *)(a1 + 28) = 1;
        sub_227CA1300(a1 + 21360, v14, *(double *)a2, 0.0001);
        *(void *)a1 = *(void *)a2;
        int v15 = *(unsigned __int8 *)(v5 + 208);
        uint64_t v16 = *(void *)(a2 + 32);
        long long v17 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)(a1 + 21312) = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 21328) = v17;
        *(void *)(a1 + 21344) = v16;
        if (!v15) {
          *(unsigned char *)(v5 + 208) = 1;
        }
      }
      else
      {
        sub_227CA3FA8(a1, (double *)a2);
      }
      sub_227CA242C((float *)&v19);
      sub_227CA48B4(0x2B7304B0u, 2, 1, 0, 0, 0);
    }
    else
    {
      sub_227CA242C((float *)&v19);
      sub_227CA3FA8(a1, (double *)a2);
    }
    *(void *)(a1 + 21392) = *(void *)(a2 + 8);
    double result = *(double *)a2;
    *(void *)(a1 + 21400) = *(void *)a2;
  }
  return result;
}

double sub_227CA3FA8(uint64_t a1, double *a2)
{
  double result = a2[1];
  if (result <= 65.0)
  {
    double v7 = *(double *)(a1 + 21392);
    if (v7 >= 0.0)
    {
      double v8 = *(double *)(a1 + 21400);
      if (v8 >= 0.0)
      {
        BOOL v4 = (double *)(a1 + 21360);
        double v5 = *a2;
        if (*(unsigned char *)(a1 + 21384))
        {
          double v9 = v5 - *(double *)(a1 + 21376);
          if (v9 <= 0.0) {
            double v10 = 1000000.0;
          }
          else {
            double v10 = (result - *v4) / v9;
          }
          if (v10 * v10 <= 0.5 || v10 <= 0.0) {
            double v6 = 0.5;
          }
          else {
            double v6 = v10 * v10;
          }
          goto LABEL_4;
        }
        double v11 = v5 - v8;
        if (result < v7) {
          double v7 = a2[1];
        }
        if (v11 < 1.5) {
          double result = v7;
        }
        if (result <= 65.0)
        {
          double v6 = 1.0;
          goto LABEL_4;
        }
      }
    }
  }
  else if (*(unsigned char *)(a1 + 21384))
  {
    BOOL v4 = (double *)(a1 + 21360);
    double result = *(double *)(a1 + 21360);
    double v5 = *a2;
    double v6 = 1000000.0;
LABEL_4:
    sub_227CA1300((uint64_t)v4, result, v5, v6);
  }
  return result;
}

unsigned __int16 *sub_227CA4084(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (unsigned char *)(a1 + 21164);
  sub_227CA44C8((unsigned __int16 *)(a1 + 21180), (_DWORD *)(a2 + 8));
  *BOOL v4 = 1;
  unsigned int v6 = *(double *)a2;
  double result = sub_227CA44C8((unsigned __int16 *)(a1 + 21220), &v6);
  v4[40] = 1;
  return result;
}

double sub_227CA40F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 21256;
  if (!*(unsigned char *)(a1 + 21265)
    || *(_DWORD *)v4 != *(_DWORD *)(a2 + 8)
    || *(_DWORD *)(a1 + 21260) != *(_DWORD *)(a2 + 12))
  {
    if (qword_2681B9A60 != -1) {
      dispatch_once(&qword_2681B9A60, &unk_26DC297C8);
    }
    double v5 = qword_2681B9A68;
    if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_227B19000, v5, OS_LOG_TYPE_DEFAULT, "Wrist and crown successfully initialized.", v7, 2u);
    }
    *(_OWORD *)(a1 + 21248) = *(_OWORD *)a2;
    *(unsigned char *)(v4 + 9) = 1;
    return sub_227C97528(a1 + 20664, (long long *)a2);
  }
  return result;
}

float sub_227CA41E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (float *)(a1 + 21408);
  float v4 = *(double *)(a2 + 16);
  if (!*(unsigned char *)(a1 + 21416))
  {
    *uint64_t v3 = v4;
    *(unsigned char *)(a1 + 21416) = 1;
  }
  sub_227C9F2A0(a1 + 20944, v4);
  float result = *(double *)(a2 + 16);
  v3[1] = result;
  return result;
}

BOOL sub_227CA4240(uint64_t a1)
{
  BOOL v2 = sub_227CA4358(a1);
  if (v2)
  {
    *(unsigned char *)(a1 + 20) = 0;
    *(_DWORD *)(a1 + 24) = 4;
    *(unsigned char *)(a1 + 21264) = 1;
  }
  else if (*(unsigned char *)(a1 + 21264))
  {
    sub_227CA32C8(a1);
    *(unsigned char *)(a1 + 21264) = 0;
  }
  return v2;
}

float sub_227CA42B0(uint64_t a1, int a2, int a3, int a4)
{
  float v4 = (float *)(a1 + 8);
  float v5 = *(float *)(a1 + 8);
  unsigned int v6 = (unsigned char *)(a1 + 21280);
  BOOL v7 = (a3 & 1) != 0 || *v6 != 0;
  int v9 = v7 & (a4 ^ 1);
  BOOL v8 = v9 == 0;
  *unsigned int v6 = v9;
  uint64_t v10 = 32;
  if (!v8) {
    uint64_t v10 = 21288;
  }
  double v11 = *(double *)(a1 + v10);
  *(double *)(a1 + 21288) = v11;
  if (a3 && *(double *)(a1 + 32) - v11 > 1.5) {
    int v12 = 2;
  }
  else {
    int v12 = *(_DWORD *)(a1 + 24);
  }
  if (v5 < 1.75) {
    int v12 = 1;
  }
  if (a2) {
    int v12 = 3;
  }
  *(_DWORD *)(a1 + 24) = v12;
  *(unsigned char *)(a1 + 20) = v12 == 0;
  if (!v12) {
    float v4 = (float *)(a1 + 21296);
  }
  float result = *v4;
  *(float *)(a1 + 21296) = *v4;
  return result;
}

BOOL sub_227CA4358(uint64_t a1)
{
  uint64_t v1 = (_WORD *)(a1 + 21222);
  uint64_t v2 = *(unsigned __int16 *)(a1 + 21222);
  if (*(_DWORD *)(a1 + 21224) != v2) {
    return 0;
  }
  if (*(_WORD *)(a1 + 21222))
  {
    int v4 = *(_DWORD *)sub_227CA4520((unsigned __int16 *)(a1 + 21220), v2 - 1);
    LODWORD(v2) = (unsigned __int16)*v1;
    if (*v1) {
      LODWORD(v2) = *(_DWORD *)sub_227CA4520((unsigned __int16 *)(a1 + 21220), 0);
    }
  }
  else
  {
    int v4 = 0;
  }
  if ((v4 - v2) > 2) {
    return 0;
  }
  float v5 = (unsigned __int16 *)(a1 + 21180);
  unsigned int v6 = (_DWORD *)sub_227CA4520(v5, 0);
  if (CLMotionActivity::indexToActivityType((CLMotionActivity *)(*v6 - 1)) - 1 < 2) {
    return 0;
  }
  unint64_t v8 = 0;
  do
  {
    unint64_t v9 = v8;
    if (v8 == 3) {
      break;
    }
    ++v8;
    uint64_t v10 = (_DWORD *)sub_227CA4520(v5, v9 + 1);
  }
  while (CLMotionActivity::indexToActivityType((CLMotionActivity *)(*v10 - 1)) - 1 > 1);
  return v9 > 2;
}

os_log_t sub_227CA4454()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "PrecisionFinding");
  qword_2681B9A68 = (uint64_t)result;
  return result;
}

os_log_t sub_227CA4484()
{
  os_log_t result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_2681B9AA8 = (uint64_t)result;
  return result;
}

void sub_227CA44B4()
{
}

unsigned __int16 *sub_227CA44C8(unsigned __int16 *result, _DWORD *a2)
{
  uint64_t v2 = result[1];
  unint64_t v3 = *((unsigned int *)result + 1);
  uint64_t v4 = *result;
  if (v4 + v2 < v3) {
    unint64_t v3 = 0;
  }
  *(_DWORD *)&result[2 * (v4 + v2 - v3) + 4] = *a2;
  unint64_t v5 = *((unsigned int *)result + 1);
  if (v5 <= v2)
  {
    __int16 v6 = v4 + 1;
    if (v4 + 1 >= v5) {
      __int16 v7 = *((_DWORD *)result + 1);
    }
    else {
      __int16 v7 = 0;
    }
    *os_log_t result = v6 - v7;
  }
  else
  {
    result[1] = v2 + 1;
  }
  return result;
}

uint64_t sub_227CA4520(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC297E8);
    }
    __int16 v7 = qword_2681B9AA8;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      int v9 = 134218240;
      unint64_t v10 = a2;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  unint64_t v5 = *a1 + a2;
  if (v5 >= v4) {
    unint64_t v4 = v4;
  }
  else {
    unint64_t v4 = 0;
  }
  return (uint64_t)&a1[2 * (v5 - v4) + 4];
}

void sub_227CA48B4(unsigned int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_2681BAFB0 != -1) {
    dispatch_once(&qword_2681BAFB0, &unk_26DC29838);
  }
  if (byte_2681BAFA8)
  {
    unsigned int v12 = a1 | 1;
    if (a2 != 1) {
      unsigned int v12 = a1;
    }
    if (a2 == 2) {
      uint64_t v13 = a1 | 2;
    }
    else {
      uint64_t v13 = v12;
    }
    MEMORY[0x270ED9F50](v13, a3, a4, a5, a6);
  }
}

uint64_t sub_227CA4978(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, a3, a4);
  uint64_t result = objc_msgSend_BOOLForKey_(v4, v5, @"LogAriadneSignposts", v6);
  byte_2681BAFA8 = result;
  return result;
}

uint64_t *sub_227CA4A94(uint64_t *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *a1 = a2;
  *((_DWORD *)a1 + 2) = 0;
  *(uint64_t *)((char *)a1 + 12) = 0x500000000;
  a1[5] = 0x400000000;
  if (!a2 || *(unsigned __int8 *)(a2 + 16) >= 5u)
  {
    if (qword_2681B9AA0 != -1) {
      dispatch_once(&qword_2681B9AA0, &unk_26DC29858);
    }
    unint64_t v4 = qword_2681B9AA8;
    if (os_log_type_enabled((os_log_t)qword_2681B9AA8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = *a1;
      int v6 = *(unsigned __int8 *)(*a1 + 16);
      int v7 = 134218496;
      uint64_t v8 = v5;
      __int16 v9 = 1024;
      int v10 = v6;
      __int16 v11 = 1024;
      int v12 = 4;
      _os_log_impl(&dword_227B19000, v4, OS_LOG_TYPE_FAULT, "Assertion failed: (fIirFilterParams != __null) && (fIirFilterParams->filterOrder <= kMaxFilterOrder), file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMIirFilter.cpp, line 17,IirFilterParams,%p,filterOrder,%d,maxFilterOrder,%d.", (uint8_t *)&v7, 0x18u);
    }
  }
  *((_DWORD *)a1 + 3) = 0;
  *((_DWORD *)a1 + 10) = 0;
  return a1;
}

os_log_t sub_227CA4BBC()
{
  os_log_t result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_2681B9AA8 = (uint64_t)result;
  return result;
}

double sub_227CA4C0C@<D0>(uint64_t a1@<X0>, float *a2@<X1>, float32x4_t *a3@<X8>, float32x4_t a4@<Q0>)
{
  float v4 = *(float *)(a1 + 8);
  a4.i32[0] = *(_DWORD *)(a1 + 12);
  float v5 = a2[1];
  float v6 = *(float *)(a1 + 4);
  float v7 = a2[2];
  float v8 = a2[3];
  float32_t v9 = (float)((float)((float)(v4 * v5) + (float)(a4.f32[0] * *a2)) - (float)(v6 * v7)) + (float)(*(float *)a1 * v8);
  float32_t v10 = (float)((float)((float)(a4.f32[0] * v5) - (float)(v4 * *a2)) + (float)(*(float *)a1 * v7)) + (float)(v6 * v8);
  float32_t v11 = (float)((float)((float)(v6 * *a2) - (float)(*(float *)a1 * v5)) + (float)(a4.f32[0] * v7)) + (float)(v4 * v8);
  float v12 = (float)((float)-(float)(v6 * v5) - (float)(*(float *)a1 * *a2)) - (float)(v4 * v7);
  a3->f32[0] = v9;
  a3->f32[1] = v10;
  a4.f32[0] = v12 + (float)(a4.f32[0] * v8);
  a3->f32[2] = v11;
  a3->i32[3] = a4.i32[0];
  *(void *)&double result = sub_227CA506C(a3, a4).u64[0];
  return result;
}

double sub_227CA4C6C@<D0>(float32x2_t *a1@<X0>, float32x4_t *a2@<X8>, float32x4_t a3@<Q0>)
{
  __int32 v3 = a1[1].i32[1];
  a3.f32[0] = -a1[1].f32[0];
  *(float32x2_t *)a2->f32 = vneg_f32(*a1);
  a2->i32[2] = a3.i32[0];
  a2->i32[3] = v3;
  *(void *)&double result = sub_227CA506C(a2, a3).u64[0];
  return result;
}

float32x4_t sub_227CA4C8C@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  if (a1->f32[3] >= 0.0)
  {
    float32x4_t result = *a1;
    *a2 = *a1;
  }
  else
  {
    float32x4_t v2 = vnegq_f32(*a1);
    *a2 = v2;
    result.i64[0] = sub_227CA506C(a2, v2).u64[0];
  }
  return result;
}

double sub_227CA4CC4@<D0>(float32x2_t *a1@<X0>, uint64_t a2@<X1>, float32x4_t *a3@<X8>, float32x4_t a4@<Q0>)
{
  __int32 v6 = a1[1].i32[1];
  a4.f32[0] = -a1[1].f32[0];
  *(float32x2_t *)v9.f32 = vneg_f32(*a1);
  v9.i64[1] = __PAIR64__(v6, a4.u32[0]);
  float32x4_t v7 = sub_227CA506C(&v9, a4);
  sub_227CA4C0C(a2, v9.f32, &v10, v7);
  *(void *)&double result = sub_227CA4C8C(&v10, a3).u64[0];
  return result;
}

float sub_227CA4D2C(float *a1)
{
  float v1 = a1[1];
  float v2 = (float)(*a1 * a1[2]) - (float)(a1[3] * v1);
  return -atan2f(v2 + v2, (float)((float)((float)(v1 * v1) + (float)(*a1 * *a1)) * -2.0) + 1.0);
}

float sub_227CA4D70(float *a1)
{
  return asinf((float)((float)(*a1 * a1[3]) + (float)(a1[1] * a1[2]))+ (float)((float)(*a1 * a1[3]) + (float)(a1[1] * a1[2])));
}

float sub_227CA4D88(float *a1)
{
  float v1 = a1[2];
  float v2 = (float)(*a1 * a1[1]) - (float)(a1[3] * v1);
  return -atan2f(v2 + v2, (float)((float)((float)(v1 * v1) + (float)(*a1 * *a1)) * -2.0) + 1.0);
}

float sub_227CA4DCC(float *a1)
{
  uint64_t v1 = 0;
  float v2 = a1[2];
  float v3 = a1[3];
  float v4 = a1[1];
  float result = (float)((float)(v3 * v4) - (float)(*a1 * v2)) + (float)((float)(v3 * v4) - (float)(*a1 * v2));
  float v6 = (float)-(float)(v3 * *a1) - (float)(v4 * v2);
  float v7 = (float)((float)((float)(v4 * v4) + (float)(*a1 * *a1)) * 2.0) + -1.0;
  *(float *)float32_t v11 = result;
  *(float *)&v11[1] = v6 + v6;
  *(float *)&v11[2] = v7;
  float v8 = 0.0;
  do
  {
    float v8 = v8 + (float)(*(float *)&v11[v1] * *(float *)&v11[v1]);
    ++v1;
  }
  while (v1 != 3);
  if (sqrtf(v8) > 0.00000011921)
  {
    uint64_t v9 = 0;
    float v10 = 0.0;
    do
    {
      float v10 = v10 + (float)(*(float *)&v11[v9] * *(float *)&v11[v9]);
      ++v9;
    }
    while (v9 != 3);
    return result / sqrtf(v10);
  }
  return result;
}

void sub_227CA4E7C(float *a1, uint64_t a2)
{
  sub_227CA5190(v5, a1, 1.0);
  *(float *)a2 = sub_227C970F8((uint64_t)v5, (float *)a2);
  *(_DWORD *)(a2 + 4) = v3;
  *(_DWORD *)(a2 + 8) = v4;
}

float sub_227CA4EC8@<S0>(float *a1@<X0>, float *a2@<X8>)
{
  return sub_227CA5190(a2, a1, 1.0);
}

float sub_227CA4ED8(float *a1, float a2, float a3, float a4)
{
  v5[0] = a2;
  v5[1] = a3;
  _DWORD v5[2] = a4;
  sub_227CA5190(v6, a1, 1.0);
  return sub_227C970F8((uint64_t)v6, v5);
}

void sub_227CA4F18(float *a1, uint64_t a2)
{
  sub_227CA5190(v5, a1, -1.0);
  *(float *)a2 = sub_227C970F8((uint64_t)v5, (float *)a2);
  *(_DWORD *)(a2 + 4) = v3;
  *(_DWORD *)(a2 + 8) = v4;
}

float sub_227CA4F64@<S0>(float *a1@<X0>, float *a2@<X8>)
{
  return sub_227CA5190(a2, a1, -1.0);
}

float sub_227CA4F74(float *a1, float a2, float a3, float a4)
{
  v5[0] = a2;
  v5[1] = a3;
  _DWORD v5[2] = a4;
  sub_227CA5190(v6, a1, -1.0);
  return sub_227C970F8((uint64_t)v6, v5);
}

double sub_227CA4FB4(float32x4_t *a1, float *a2)
{
  uint64_t v4 = 0;
  float v5 = 0.0;
  do
  {
    float v5 = v5 + (float)(a2[v4] * a2[v4]);
    ++v4;
  }
  while (v4 != 3);
  float v6 = sqrtf(v5);
  float v7 = 0.5;
  float v8 = v6 * 0.5;
  if ((float)(v6 * 0.5) > 0.0) {
    float v7 = (float)(sinf(v6 * 0.5) / v8) * 0.5;
  }
  a1->f32[0] = v7 * *a2;
  a1->f32[1] = v7 * a2[1];
  a1->f32[2] = v7 * a2[2];
  v9.f32[0] = cosf(v8);
  a1->i32[3] = v9.i32[0];

  *(void *)&double result = sub_227CA506C(a1, v9).u64[0];
  return result;
}

float32x4_t sub_227CA506C(float32x4_t *a1, float32x4_t result)
{
  result.f32[0] = sqrtf((float)((float)((float)(a1->f32[1] * a1->f32[1]) + (float)(a1->f32[0] * a1->f32[0]))+ (float)(a1->f32[2] * a1->f32[2]))+ (float)(a1->f32[3] * a1->f32[3]));
  float v2 = result.f32[0] + -1.0;
  if ((float)(result.f32[0] + -1.0) <= 0.0) {
    float v2 = -(float)(result.f32[0] + -1.0);
  }
  if (v2 >= 0.00000011921)
  {
    if (result.f32[0] == 0.0)
    {
      a1->i64[0] = 0;
      a1->i64[1] = 0x3F80000000000000;
    }
    else
    {
      double result = vdivq_f32(*a1, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)result.f32, 0));
      *a1 = result;
    }
  }
  return result;
}

float sub_227CA50D0(float32x4_t *a1)
{
  float32x4_t v8 = *a1;
  sub_227CA4C8C(&v8, &v7);
  uint64_t v1 = 0;
  float32x4_t v8 = v7;
  float v2 = v7.f32[0];
  float v3 = 0.0;
  do
  {
    float v3 = v3 + (float)(v7.f32[v1] * v7.f32[v1]);
    ++v1;
  }
  while (v1 != 3);
  float v4 = sqrtf(v3);
  if (v4 >= 0.00000011921)
  {
    float v5 = atan2f(v4, v8.f32[3]);
    return v2 * (float)((float)(v5 + v5) / v4);
  }
  return v2;
}

float sub_227CA5190(float *a1, float *a2, float a3)
{
  float v4 = a2[2];
  float v3 = a2[3];
  float v5 = v3 + v3;
  float v6 = *a2;
  float v7 = a2[1];
  float v8 = v7 + v7;
  float v9 = v3 * (float)(v3 + v3);
  float v10 = (float)((float)(v7 + v7) * v7) + -1.0;
  float v11 = (float)((float)(v4 + v4) * v4) + -1.0;
  float v12 = (float)(v6 + v6) * v7;
  float v13 = (float)(v6 + v6) * v4;
  float v14 = v3 * (float)(v6 + v6);
  float v15 = v8 * v4;
  float v16 = v3 * v8;
  float v17 = v5 * v4;
  float v18 = v9 + (float)((float)((float)(v6 + v6) * v6) + -1.0);
  float v19 = v12 - (float)(v17 * a3);
  float v20 = v13 + (float)(v16 * a3);
  float v21 = v12 + (float)(v17 * a3);
  float v22 = v9 + v10;
  float v23 = v15 - (float)(v14 * a3);
  float v24 = v13 - (float)(v16 * a3);
  float result = v15 + (float)(v14 * a3);
  *a1 = v18;
  a1[1] = v19;
  a1[2] = v20;
  a1[3] = v21;
  a1[4] = v22;
  a1[5] = v23;
  a1[6] = v24;
  a1[7] = result;
  a1[8] = v9 + v11;
  return result;
}

void sub_227CA5210(float *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2681BAFC0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2681BAFC0))
  {
    dword_2681BAFB8 = 1043452116;
    __cxa_guard_release(&qword_2681BAFC0);
  }
  float v4 = sub_227CA4DCC(a1);
  uint64_t v5 = 0;
  float v6 = sqrtf((float)(v2 * v2) + (float)(v4 * v4));
  float v7 = -1.0;
  if (v3 > v6) {
    float v7 = 1.0;
  }
  uint64_t v22 = 0x3F80000000000000;
  int v23 = 0;
  float v8 = (float)(v3 * -0.0) + (float)(v2 * v7);
  float v9 = 0.0;
  float v10 = (float)(v3 * 0.0) - (float)(v4 * v7);
  float v11 = (float)(v2 * -0.0) + (float)(v4 * 0.0);
  v21[0] = v8;
  v21[1] = v10;
  v21[2] = v11;
  do
  {
    float v9 = v9 + (float)(v21[v5] * v21[v5]);
    ++v5;
  }
  while (v5 != 3);
  float v12 = sqrtf(v9);
  if (v12 <= *(float *)&dword_2681BAFB8)
  {
    float v15 = 1.0;
    float v16 = 0.0;
    float v14 = 0.0;
  }
  else
  {
    float v13 = (float)-atan2f(v6, v3 * v7) / v12;
    v24[0] = v8 * v13;
    v24[1] = v10 * v13;
    void v24[2] = v11 * v13;
    sub_227CA4FB4(&v20, v24);
    sub_227CA5190(v24, v20.f32, -1.0);
    float v14 = sub_227C970F8((uint64_t)v24, (float *)&v22);
  }
  float v17 = sub_227CA4F74(a1, v14, v15, v16);
  for (float i = atan2f(-v18, v17) * 57.296; i < 0.0; float i = i + 360.0)
    ;
  for (; i >= 360.0; float i = i + -360.0)
    ;
}

void sub_227CA54AC(_Unwind_Exception *a1)
{
  MEMORY[0x22A6850E0](v1, 0x1080C4086865149);
  _Unwind_Resume(a1);
}

void sub_227CA5684(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CA5750(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CA5824(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CA5954(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CA5BE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CA5FCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

os_log_t sub_227CA60E4()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "Motion");
  qword_2681B9A88 = (uint64_t)result;
  return result;
}

void sub_227CA6280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

void sub_227CA6458(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_isRunning(*(void **)(a1 + 32), a2, a3, a4)) {
    objc_msgSend_stopPencilFusionUpdates(*(void **)(a1 + 32), v5, v6, v7);
  }
  objc_msgSend_setHandlerQueue_(*(void **)(a1 + 32), v5, *(void *)(a1 + 40), v7);
  id v11 = (id)objc_msgSend_copy(*(void **)(a1 + 48), v8, v9, v10);
  objc_msgSend_setHandler_(*(void **)(a1 + 32), v12, (uint64_t)v11, v13);
  objc_msgSend_setRunning_(*(void **)(a1 + 32), v14, 1, v15);
  objc_msgSend_setCurrentEstimationUpdateIndex_(*(void **)(a1 + 32), v16, 0, v17);
  uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);

  sub_227C91AE4(v18);
}

void sub_227CA65D4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_isRunning(*(void **)(a1 + 32), a2, a3, a4))
  {
    float v8 = objc_msgSend_estimations(*(void **)(a1 + 32), v5, v6, v7);
    objc_msgSend_removeAllObjects(v8, v9, v10, v11);
    objc_msgSend_setRunning_(*(void **)(a1 + 32), v12, 0, v13);
    objc_msgSend_setHandler_(*(void **)(a1 + 32), v14, 0, v15);
    objc_msgSend_setHandlerQueue_(*(void **)(a1 + 32), v16, 0, v17);
    objc_msgSend_sendPencilStatistics(*(void **)(a1 + 32), v18, v19, v20);
    sub_227C91C5C(*(void *)(*(void *)(a1 + 32) + 8));
    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
    sub_227C8FCD0(v21);
  }
}

void sub_227CA67EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_227CA6804(uint64_t a1, uint64_t a2)
{
}

void sub_227CA6814(uint64_t a1)
{
}

id sub_227CA6820(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_estimations(*(void **)(a1 + 32), a2, a3, a4);
  id result = (id)objc_msgSend_lastObject(v5, v6, v7, v8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t sub_227CA6A7C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend_isRunning(*(void **)(a1 + 48), a2, a3, a4);
  if (result)
  {
    if (objc_msgSend_mslEnabled(*(void **)(a1 + 48), v6, v7, v8))
    {
      LODWORD(v12) = *(_DWORD *)(a1 + 64);
      LODWORD(v13) = *(_DWORD *)(a1 + 68);
      LODWORD(v14) = *(_DWORD *)(a1 + 72);
      LODWORD(v15) = *(_DWORD *)(a1 + 76);
      LODWORD(v16) = *(_DWORD *)(a1 + 80);
      objc_msgSend_logTouchAltitudeAngle_altitudeAngleConfidence_azimuthAngle_azimuthAngleConfidence_position_positionConfidence_timestamp_(*(void **)(a1 + 48), v9, v10, v11, v12, v13, v14, v15, *(double *)(a1 + 32), v16, *(double *)(a1 + 56));
    }
    sub_227C8FDA8(*(void *)(*(void *)(a1 + 48) + 8), (unint64_t)(*(double *)(a1 + 56) * 1000000.0), fabsf(*(float *)(a1 + 40)) < 0.000001, *(float *)(a1 + 68) > 0.5, *(float *)(a1 + 64), *(float *)(a1 + 72));
    sub_227C9D380(*(void *)(*(void *)(a1 + 48) + 8) + 8, &v93);
    v17.f32[0] = -v93.f32[2];
    *(float32x2_t *)v92.f32 = vneg_f32(*(float32x2_t *)v93.f32);
    v92.f32[2] = -v93.f32[2];
    v92.i32[3] = v93.i32[3];
    sub_227CA506C(&v92, v17);
    float v18 = sub_227C8E390(v92.f32);
    int v20 = v19;
    int v22 = v21;
    int v23 = objc_opt_new();
    *(float *)&double v24 = v18;
    objc_msgSend_setAltitudeAngle_(v23, v25, v26, v27, v24);
    LODWORD(v28) = v20;
    objc_msgSend_setAzimuthAngle_(v23, v29, v30, v31, v28);
    LODWORD(v32) = v22;
    objc_msgSend_setRollAngle_(v23, v33, v34, v35, v32);
    objc_msgSend_setPosition_(v23, v36, v37, v38, *(double *)(a1 + 32));
    int v39 = NSNumber;
    uint64_t v40 = *(void *)(a1 + 48);
    uint64_t v41 = *(void *)(v40 + 32);
    *(void *)(v40 + 32) = v41 + 1;
    uint64_t v44 = objc_msgSend_numberWithUnsignedLongLong_(v39, v42, v41, v43);
    objc_msgSend_setEstimationUpdateIndex_(v23, v45, v44, v46);
    objc_msgSend_setEstimated_(v23, v47, 1, v48);
    objc_msgSend_setTimestamp_(v23, v49, v50, v51, *(double *)(a1 + 56));
    __int16 v55 = objc_msgSend_estimations(*(void **)(a1 + 48), v52, v53, v54);
    objc_msgSend_addObject_(v55, v56, (uint64_t)v23, v57);
    __int16 v61 = objc_msgSend_estimations(*(void **)(a1 + 48), v58, v59, v60);
    if ((unint64_t)objc_msgSend_count(v61, v62, v63, v64) >= 0x19)
    {
      do
      {
        BOOL v68 = objc_msgSend_estimations(*(void **)(a1 + 48), v65, v66, v67);
        objc_msgSend_removeObjectAtIndex_(v68, v69, 0, v70);
        double v74 = objc_msgSend_estimations(*(void **)(a1 + 48), v71, v72, v73);
      }
      while ((unint64_t)objc_msgSend_count(v74, v75, v76, v77) > 0x18);
    }

    uint64_t result = objc_msgSend_mslEnabled(*(void **)(a1 + 48), v78, v79, v80);
    if (result)
    {
      unsigned int v84 = *(void **)(a1 + 48);
      float32x2_t v85 = objc_msgSend_estimations(v84, v81, v82, v83);
      uint64_t Object = objc_msgSend_lastObject(v85, v86, v87, v88);
      return objc_msgSend_logPencilFusionResult_(v84, v90, Object, v91);
    }
  }
  return result;
}

uint64_t sub_227CA71DC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend_isRunning(*(void **)(a1 + 96), a2, a3, a4);
  if (result)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 96) + 8);
    unint64_t v7 = *(void *)(a1 + 135);
    float32x4_t v15 = *(float32x4_t *)(a1 + 32);
    sub_227CA506C(&v15, v15);
    float32x4_t v8 = vmulq_f32(*(float32x4_t *)(a1 + 48), *(float32x4_t *)(a1 + 48));
    float32x4_t v9 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1)));
    float32x4_t v10 = vmulq_f32(*(float32x4_t *)(a1 + 64), *(float32x4_t *)(a1 + 64));
    v9.f32[0] = sqrtf(v9.f32[0]);
    sub_227C9092C(v6, v7, v15.f32, v9, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).f32[0]));
    sub_227C91E2C(*(void *)(*(void *)(a1 + 96) + 8), *(void *)(a1 + 135), *(float *)(a1 + 80), *(float *)(a1 + 84), *(float *)(a1 + 88), *(float *)(a1 + 120), *(float *)(a1 + 124));
    uint64_t result = objc_msgSend_mslEnabled(*(void **)(a1 + 96), v11, v12, v13);
    if (result) {
      return objc_msgSend_logPencilDeviceMotionQuaternion_rotationRate_acceleration_gyroBias_temperatureGyroBias_temperatureGyro_status_sensorTime_timestamp_(*(void **)(a1 + 96), v14, (int)*(float *)(a1 + 120), (int)*(float *)(a1 + 124), *(unsigned __int16 *)(a1 + 128), *(void *)(a1 + 104), *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 112));
    }
  }
  return result;
}

uint64_t sub_227CA74C0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend_isRunning(*(void **)(a1 + 80), a2, a3, a4);
  if (result)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
    unint64_t v7 = (unint64_t)(*(double *)(a1 + 88) * 1000000.0);
    float32x4_t v16 = *(float32x4_t *)(a1 + 32);
    sub_227CA506C(&v16, v16);
    float32x4_t v8 = vmulq_f32(*(float32x4_t *)(a1 + 48), *(float32x4_t *)(a1 + 48));
    float32x4_t v9 = vmulq_f32(*(float32x4_t *)(a1 + 64), *(float32x4_t *)(a1 + 64));
    sub_227C90F2C(v6, v7, (uint64_t)&v16, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0]), sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0]));
    uint64_t result = objc_msgSend_mslEnabled(*(void **)(a1 + 80), v10, v11, v12);
    if (result) {
      return objc_msgSend_logHostDeviceMotionQuaternion_rotationRate_acceleration_timestamp_(*(void **)(a1 + 80), v13, v14, v15, *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 88));
    }
  }
  return result;
}

uint64_t sub_227CA7A34(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  float v4 = *(uint64_t (**)(void))(objc_msgSend_handler(*(void **)(a1 + 32), a2, a3, a4) + 16);

  return v4();
}

void sub_227CA7F9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

void sub_227CA8170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

void sub_227CA8CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

void sub_227CA8E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_227BE6EB4((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_227CA92CC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v62[16] = *MEMORY[0x263EF8340];
  v61[0] = @"Axis";
  v62[0] = objc_msgSend_numberWithInt_(NSNumber, a2, *(unsigned int *)(a1 + 104), a4);
  v61[1] = @"MinDeltaGyroBias";
  LODWORD(v5) = *(_DWORD *)(a1 + 32);
  v62[1] = objc_msgSend_numberWithFloat_(NSNumber, v6, v7, v8, v5);
  v61[2] = @"MeanDeltaGyroBias";
  LODWORD(v9) = *(_DWORD *)(a1 + 36);
  v62[2] = objc_msgSend_numberWithFloat_(NSNumber, v10, v11, v12, v9);
  v61[3] = @"MaxDeltaGyroBias";
  LODWORD(v13) = *(_DWORD *)(a1 + 40);
  v62[3] = objc_msgSend_numberWithFloat_(NSNumber, v14, v15, v16, v13);
  v61[4] = @"MinGyroBias";
  LODWORD(v17) = *(_DWORD *)(a1 + 44);
  v62[4] = objc_msgSend_numberWithFloat_(NSNumber, v18, v19, v20, v17);
  v61[5] = @"MeanGyroBias";
  LODWORD(v21) = *(_DWORD *)(a1 + 48);
  v62[5] = objc_msgSend_numberWithFloat_(NSNumber, v22, v23, v24, v21);
  v61[6] = @"MaxGyroBias";
  LODWORD(v25) = *(_DWORD *)(a1 + 52);
  v62[6] = objc_msgSend_numberWithFloat_(NSNumber, v26, v27, v28, v25);
  v61[7] = @"MinGyroBiasTemperature";
  LODWORD(v29) = *(_DWORD *)(a1 + 56);
  v62[7] = objc_msgSend_numberWithFloat_(NSNumber, v30, v31, v32, v29);
  v61[8] = @"MeanGyroBiasTemperature";
  LODWORD(v33) = *(_DWORD *)(a1 + 60);
  v62[8] = objc_msgSend_numberWithFloat_(NSNumber, v34, v35, v36, v33);
  v61[9] = @"MaxGyroBiasTemperature";
  LODWORD(v37) = *(_DWORD *)(a1 + 64);
  v62[9] = objc_msgSend_numberWithFloat_(NSNumber, v38, v39, v40, v37);
  v61[10] = @"MinGyroTemperature";
  LODWORD(v41) = *(_DWORD *)(a1 + 68);
  v62[10] = objc_msgSend_numberWithFloat_(NSNumber, v42, v43, v44, v41);
  v61[11] = @"MeanGyroTemperature";
  LODWORD(v45) = *(_DWORD *)(a1 + 72);
  v62[11] = objc_msgSend_numberWithFloat_(NSNumber, v46, v47, v48, v45);
  v61[12] = @"MaxGyroTemperature";
  LODWORD(v49) = *(_DWORD *)(a1 + 76);
  v62[12] = objc_msgSend_numberWithFloat_(NSNumber, v50, v51, v52, v49);
  v61[13] = @"MinTimeBetweenGyroBiasUpdates";
  v62[13] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v53, *(void *)(a1 + 80), v54);
  v61[14] = @"MeanTimeBetweenGyroBiasUpdates";
  v62[14] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v55, *(void *)(a1 + 88), v56);
  v61[15] = @"MaxTimeBetweenGyroBiasUpdates";
  v62[15] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v57, *(void *)(a1 + 96), v58);
  return objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v59, (uint64_t)v62, (uint64_t)v61, 16);
}

uint64_t sub_227CA9594(unsigned int *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v68[16] = *MEMORY[0x263EF8340];
  v67[0] = @"ContactCondition";
  v68[0] = objc_msgSend_numberWithInt_(NSNumber, a2, a1[8], a4);
  v67[1] = @"MinAzimuth";
  LODWORD(v5) = a1[9];
  v68[1] = objc_msgSend_numberWithFloat_(NSNumber, v6, v7, v8, v5);
  v67[2] = @"MeanAzimuth";
  LODWORD(v9) = a1[10];
  v68[2] = objc_msgSend_numberWithFloat_(NSNumber, v10, v11, v12, v9);
  v67[3] = @"MaxAzimuth";
  LODWORD(v13) = a1[11];
  v68[3] = objc_msgSend_numberWithFloat_(NSNumber, v14, v15, v16, v13);
  v67[4] = @"MinTilt";
  LODWORD(v17) = a1[12];
  v68[4] = objc_msgSend_numberWithFloat_(NSNumber, v18, v19, v20, v17);
  v67[5] = @"MeanTilt";
  LODWORD(v21) = a1[13];
  v68[5] = objc_msgSend_numberWithFloat_(NSNumber, v22, v23, v24, v21);
  v67[6] = @"MaxTilt";
  LODWORD(v25) = a1[14];
  v68[6] = objc_msgSend_numberWithFloat_(NSNumber, v26, v27, v28, v25);
  v67[7] = @"MinGyroNorm";
  LODWORD(v29) = a1[15];
  v68[7] = objc_msgSend_numberWithFloat_(NSNumber, v30, v31, v32, v29);
  v67[8] = @"MeanGyroNorm";
  LODWORD(v33) = a1[16];
  v68[8] = objc_msgSend_numberWithFloat_(NSNumber, v34, v35, v36, v33);
  v67[9] = @"MaxGyroNorm";
  LODWORD(v37) = a1[17];
  v68[9] = objc_msgSend_numberWithFloat_(NSNumber, v38, v39, v40, v37);
  v67[10] = @"MinGyroShaftAxisNorm";
  LODWORD(v41) = a1[18];
  v68[10] = objc_msgSend_numberWithFloat_(NSNumber, v42, v43, v44, v41);
  v67[11] = @"MeanGyroShaftAxisNorm";
  LODWORD(v45) = a1[19];
  v68[11] = objc_msgSend_numberWithFloat_(NSNumber, v46, v47, v48, v45);
  v67[12] = @"MaxGyroShaftAxisNorm";
  LODWORD(v49) = a1[20];
  v68[12] = objc_msgSend_numberWithFloat_(NSNumber, v50, v51, v52, v49);
  v67[13] = @"MinUserAccelNorm";
  LODWORD(v53) = a1[21];
  v68[13] = objc_msgSend_numberWithFloat_(NSNumber, v54, v55, v56, v53);
  v67[14] = @"MeanUserAccelNorm";
  LODWORD(v57) = a1[22];
  v68[14] = objc_msgSend_numberWithFloat_(NSNumber, v58, v59, v60, v57);
  v67[15] = @"MaxUserAccelNorm";
  LODWORD(v61) = a1[23];
  v68[15] = objc_msgSend_numberWithFloat_(NSNumber, v62, v63, v64, v61);
  return objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v65, (uint64_t)v68, (uint64_t)v67, 16);
}

uint64_t sub_227CA9854(uint64_t *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned __int16 v30[12] = *MEMORY[0x263EF8340];
  v29[0] = @"MinAuxToRingSensorLatency";
  v30[0] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, a1[4], a4);
  v29[1] = @"MeanAuxToRingSensorLatency";
  v30[1] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v5, a1[5], v6);
  _OWORD v29[2] = @"MaxAuxToRingSensorLatency";
  _OWORD v30[2] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v7, a1[6], v8);
  v29[3] = @"MinPencilIMUSamplePeriod";
  v30[3] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v9, a1[7], v10);
  v29[4] = @"MeanPencilIMUSamplePeriod";
  v30[4] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v11, a1[8], v12);
  v29[5] = @"MaxPencilIMUSamplePeriod";
  v30[5] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v13, a1[9], v14);
  v29[6] = @"MinSourceIMUSamplePeriod";
  v30[6] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v15, a1[10], v16);
  v29[7] = @"MeanSourceIMUSamplePeriod";
  v30[7] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v17, a1[11], v18);
  v29[8] = @"MaxSourceIMUSamplePeriod";
  v30[8] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v19, a1[12], v20);
  v29[9] = @"MinRingSensorSamplePeriod";
  v30[9] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v21, a1[13], v22);
  v29[10] = @"MeanRingSensorSamplePeriod";
  v30[10] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v23, a1[14], v24);
  v29[11] = @"MaxRingSensorSamplePeriod";
  v30[11] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v25, a1[15], v26);
  return objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)v30, (uint64_t)v29, 12);
}

os_log_t sub_227CA9AC4()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_2681B9A78 = (uint64_t)result;
  return result;
}

void sub_227CA9AF4(void *a1)
{
  sub_227C92120(a1 + 835);
  sub_227C921A4(a1 + 773);
  sub_227C923BC(a1 + 702);
  sub_227C923BC(a1 + 696);
  sub_227C923BC(a1 + 538);
  sub_227C923BC(a1 + 532);

  JUMPOUT(0x22A6850E0);
}

uint64_t sub_227CA9B80(uint64_t a1)
{
  return a1;
}

void sub_227CA9BAC(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 8));

  JUMPOUT(0x22A6850E0);
}

id *sub_227CA9BF8(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 8);
  float v2 = (id *)operator new(0x10uLL);
  *float v2 = &unk_26DC298C8;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

void sub_227CA9C4C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26DC298C8;
  objc_copyWeak((id *)(a2 + 8), (id *)(a1 + 8));
}

void sub_227CA9C78(uint64_t a1)
{
}

void sub_227CA9C80(id *a1)
{
  objc_destroyWeak(a1 + 1);

  operator delete(a1);
}

void sub_227CA9CBC(uint64_t a1, unint64_t *a2, long long *a3)
{
  float v3 = (id *)(a1 + 8);
  unint64_t v4 = *a2;
  long long v9 = *a3;
  double v5 = (void *)MEMORY[0x22A685640](a1, a2);
  Weaunint64_t k = objc_loadWeak(v3);
  objc_msgSend_updateEstimationsWithRealValuesWithQuaternion_timestamp_(Weak, v7, (uint64_t)&v9, v8, (double)v4 * 0.000001);
}

uint64_t sub_227CA9D28(uint64_t a1, uint64_t a2)
{
  if (sub_227BD4E88(a2, (uint64_t)&unk_26DC29938)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_227CA9D68()
{
  return &unk_26DC29938;
}

void sub_227CAA394(uint64_t a1)
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  uint64_t v3 = 4;
  switch(*(_DWORD *)(a1 + 72))
  {
    case 0:
      uint64_t v3 = 1;
      goto LABEL_7;
    case 1:
      goto LABEL_6;
    case 2:
      uint64_t v3 = 5;
      goto LABEL_6;
    case 3:
      uint64_t v3 = 6;
      goto LABEL_6;
    case 4:
      uint64_t v3 = 2;
LABEL_6:
      if (*(unsigned char *)(a1 + 68)) {
        goto LABEL_40;
      }
LABEL_7:
      unint64_t v4 = objc_opt_new();
      uint64_t v7 = v4;
      if (*(unsigned char *)(a1 + 68)) {
        objc_msgSend_setConvergenceStatus_(v4, v5, 2, v6);
      }
      else {
        objc_msgSend_setConvergenceStatus_(v4, v5, 1, v6);
      }
      objc_msgSend_setRevokeReason_(v7, v8, v3, v9);
      objc_msgSend_setDistance_(v7, v10, v11, v12, *(float *)(a1 + 56));
      objc_msgSend_setHorizontalAngle_(v7, v13, v14, v15, *(float *)(a1 + 60));
      objc_msgSend_setHorizontalAngleAccuracy_(v7, v16, v17, v18, *(float *)(a1 + 64));
      if (*(unsigned char *)(a1 + 76))
      {
        uint64_t v22 = objc_msgSend_numberWithDouble_(NSNumber, v19, v20, v21, *(float *)(a1 + 56));
        objc_msgSend_setHorizontalDistanceNumber_(v7, v23, v22, v24);
      }
      else
      {
        objc_msgSend_setHorizontalDistanceNumber_(v7, v19, 0, v21);
      }
      uint64_t v28 = objc_msgSend_numberWithDouble_(NSNumber, v25, v26, v27, *(float *)(a1 + 60));
      objc_msgSend_setHorizontalAngleNumber_(v7, v29, v28, v30);
      uint64_t v34 = objc_msgSend_numberWithDouble_(NSNumber, v31, v32, v33, *(float *)(a1 + 64));
      objc_msgSend_setHorizontalAngleAccuracyNumber_(v7, v35, v34, v36);
      uint64_t v40 = objc_msgSend_numberWithDouble_(NSNumber, v37, v38, v39, *(float *)(a1 + 64));
      objc_msgSend_setHorizontalAngleUncertaintyNumber_(v7, v41, v40, v42);
      uint64_t v45 = *(void *)(a1 + 32);
      float v46 = *(float *)(v45 + 92);
      int v47 = *(unsigned char *)(v45 + 102) & 1;
      if (*(unsigned char *)(v45 + 102)) {
        objc_msgSend_setVerticalState_(v7, v43, 2, v44);
      }
      else {
        objc_msgSend_setVerticalState_(v7, v43, 1, v44);
      }
      uint64_t v51 = objc_msgSend_delegate(*(void **)(a1 + 32), v48, v49, v50);
      objc_msgSend_didUpdatePreciseDevicePosition_withError_(v51, v52, (uint64_t)v7, 0);
      uint64_t v56 = objc_msgSend_analyticsManager(*(void **)(a1 + 32), v53, v54, v55);
      objc_msgSend_feedRevokeReason_(v56, v57, *(unsigned int *)(a1 + 72), v58);
      float v59 = *(float *)(a1 + 92);
      float v60 = *(float *)(a1 + 100);
      float v106 = *(float *)(a1 + 96);
      uint64_t v107 = *(void *)(a1 + 104);
      uint64_t v64 = objc_msgSend_analyticsManager(*(void **)(a1 + 32), v61, v62, v63);
      double v65 = v60;
      objc_msgSend_feedEstimatedHeight_(v64, v66, v67, v68, v65);
      uint64_t v72 = objc_msgSend_analyticsManager(*(void **)(a1 + 32), v69, v70, v71);
      objc_msgSend_feedFractionAboveThreshold_(v72, v73, v74, v75, v46);
      long long v76 = *(_OWORD *)(a1 + 64);
      v109[0] = *(_OWORD *)(a1 + 48);
      v109[1] = v76;
      long long v77 = *(_OWORD *)(a1 + 96);
      v108[0] = *(_OWORD *)(a1 + 80);
      v108[1] = v77;
      objc_msgSend_timestamp(*(void **)(a1 + 40), v78, v79, v80);
      sub_227CA2548((uint64_t)v109, (float *)v108, v81);
      if (*(float *)(a1 + 60) > 0.0
        || (v99.i32[0] = *(_DWORD *)(a1 + 64),
            v99.f32[1] = v106,
            v99.i64[1] = v107,
            (vmaxv_u16((uint16x4_t)vmovn_s32(vcgtzq_f32(v99))) & 1) != 0)
        || v59 > 0.0)
      {
        uint64_t v85 = *(void *)(a1 + 32);
        objc_msgSend_timestamp(*(void **)(a1 + 40), v82, v83, v84);
        unint64_t v87 = (unint64_t)(v86 * 1000000.0);
        uint64_t v88 = *(void *)(v85 + 21528);
        if (v88 && *(void *)(v85 + 21536) + v88 > v87)
        {
          os_log_type_t v89 = OS_LOG_TYPE_INFO;
        }
        else
        {
          os_log_type_t v89 = OS_LOG_TYPE_DEFAULT;
          *(void *)(v85 + 21536) = v87;
        }
        if (qword_2681B9A60 != -1) {
          dispatch_once(&qword_2681B9A60, &unk_26DC29948);
        }
        uint64_t v90 = qword_2681B9A68;
        if (os_log_type_enabled((os_log_t)qword_2681B9A68, v89))
        {
          objc_msgSend_timestamp(*(void **)(a1 + 40), v91, v92, v93);
          double v94 = *(float *)(a1 + 60);
          double v95 = *(float *)(a1 + 64);
          int v96 = *(unsigned __int8 *)(a1 + 68);
          int v97 = *(_DWORD *)(a1 + 72);
          *(_DWORD *)buf = 134351616;
          *(void *)float64x2_t v111 = v98;
          *(_WORD *)&v111[8] = 2050;
          *(double *)&v111[10] = v94;
          *(_WORD *)&v111[18] = 2050;
          *(double *)&v111[20] = v95;
          *(_WORD *)&v111[28] = 2050;
          *(double *)&v111[30] = v59;
          __int16 v112 = 2050;
          double v113 = v106;
          __int16 v114 = 2050;
          double v115 = v65;
          __int16 v116 = 2050;
          double v117 = *(float *)&v107;
          __int16 v118 = 2050;
          double v119 = *((float *)&v107 + 1);
          __int16 v120 = 1026;
          int v121 = v96;
          __int16 v122 = 1026;
          int v123 = v97;
          __int16 v124 = 1026;
          int v125 = v47;
          _os_log_impl(&dword_227B19000, v90, v89, "CMAPrecisionFindingManager,timestamp,%{public}f,horizontalAngle,%{public}f,horizontalAngleUncertainty,%{public}f,positionX,%{public}f,positionY,%{public}f,positionZ,%{public}f,velocityX,%{public}f,velocityY,%{public}f,isConverged,%{public}d,revokeReason,%{public}d,verticalState,%{public}d", buf, 0x64u);
        }
      }

      return;
    default:
      if (!*(unsigned char *)(a1 + 68))
      {
        if (qword_2681B9A60 != -1) {
          dispatch_once(&qword_2681B9A60, &unk_26DC29948);
        }
        float v100 = qword_2681B9A68;
        if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)float64x2_t v111 = 0;
          *(_WORD *)&v111[4] = 2082;
          *(void *)&void v111[6] = &unk_227CB7C2E;
          *(_WORD *)&v111[14] = 2082;
          *(void *)&v111[16] = "assert";
          *(_WORD *)&v111[24] = 2081;
          *(void *)&v111[26] = "!estimatorPosition.isConverged && revokeReason != CMAPositionRevokeReasonUnknown";
          _os_log_impl(&dword_227B19000, v100, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"If not converged, there must be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          if (qword_2681B9A60 != -1) {
            dispatch_once(&qword_2681B9A60, &unk_26DC29948);
          }
        }
        int v101 = qword_2681B9A68;
        if (os_signpost_enabled((os_log_t)qword_2681B9A68))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)float64x2_t v111 = 0;
          *(_WORD *)&v111[4] = 2082;
          *(void *)&void v111[6] = &unk_227CB7C2E;
          *(_WORD *)&v111[14] = 2082;
          *(void *)&v111[16] = "assert";
          *(_WORD *)&v111[24] = 2081;
          *(void *)&v111[26] = "!estimatorPosition.isConverged && revokeReason != CMAPositionRevokeReasonUnknown";
          _os_signpost_emit_with_name_impl(&dword_227B19000, v101, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "If not converged, there must be a revoke reason", "{\"msg%{public}.0s\":\"If not converged, there must be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          if (qword_2681B9A60 != -1) {
            dispatch_once(&qword_2681B9A60, &unk_26DC29948);
          }
        }
        int v102 = qword_2681B9A68;
        if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)float64x2_t v111 = 0;
          *(_WORD *)&v111[4] = 2082;
          *(void *)&void v111[6] = &unk_227CB7C2E;
          *(_WORD *)&v111[14] = 2082;
          *(void *)&v111[16] = "assert";
          *(_WORD *)&v111[24] = 2081;
          *(void *)&v111[26] = "!estimatorPosition.isConverged && revokeReason != CMAPositionRevokeReasonUnknown";
          _os_log_impl(&dword_227B19000, v102, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"If not converged, there must be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }
        while (1)
        {
          abort_report_np();
LABEL_50:
          dispatch_once(&qword_2681B9A60, &unk_26DC29948);
LABEL_41:
          float v103 = qword_2681B9A68;
          if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 68289539;
            *(_DWORD *)float64x2_t v111 = 0;
            *(_WORD *)&v111[4] = 2082;
            *(void *)&void v111[6] = &unk_227CB7C2E;
            *(_WORD *)&v111[14] = 2082;
            *(void *)&v111[16] = "assert";
            *(_WORD *)&v111[24] = 2081;
            *(void *)&v111[26] = "revokeReason == CMAPositionRevokeReasonNotRevoked";
            _os_log_impl(&dword_227B19000, v103, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"If converged, there must not be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
            if (*(void *)(v1 + 2656) != -1) {
              dispatch_once(&qword_2681B9A60, &unk_26DC29948);
            }
          }
          long long v104 = qword_2681B9A68;
          if (os_signpost_enabled((os_log_t)qword_2681B9A68))
          {
            *(_DWORD *)buf = 68289539;
            *(_DWORD *)float64x2_t v111 = 0;
            *(_WORD *)&v111[4] = 2082;
            *(void *)&void v111[6] = &unk_227CB7C2E;
            *(_WORD *)&v111[14] = 2082;
            *(void *)&v111[16] = "assert";
            *(_WORD *)&v111[24] = 2081;
            *(void *)&v111[26] = "revokeReason == CMAPositionRevokeReasonNotRevoked";
            _os_signpost_emit_with_name_impl(&dword_227B19000, v104, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "If converged, there must not be a revoke reason", "{\"msg%{public}.0s\":\"If converged, there must not be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
            if (*(void *)(v1 + 2656) != -1) {
              dispatch_once(&qword_2681B9A60, &unk_26DC29948);
            }
          }
          long long v105 = qword_2681B9A68;
          if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 68289539;
            *(_DWORD *)float64x2_t v111 = 0;
            *(_WORD *)&v111[4] = 2082;
            *(void *)&void v111[6] = &unk_227CB7C2E;
            *(_WORD *)&v111[14] = 2082;
            *(void *)&v111[16] = "assert";
            *(_WORD *)&v111[24] = 2081;
            *(void *)&v111[26] = "revokeReason == CMAPositionRevokeReasonNotRevoked";
            _os_log_impl(&dword_227B19000, v105, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"If converged, there must not be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          }
        }
      }
LABEL_40:
      unint64_t v1 = 0x2681B9000uLL;
      if (qword_2681B9A60 == -1) {
        goto LABEL_41;
      }
      goto LABEL_50;
  }
}

void sub_227CAB13C(uint64_t a1)
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v6 = objc_msgSend_analyticsManager(*(void **)(a1 + 32), v3, v4, v5);
  uint64_t v10 = objc_msgSend_analyticsDictionary(v6, v7, v8, v9);
  id v18 = (id)objc_msgSend_initWithDictionary_(v2, v11, v10, v12);
  uint64_t v16 = objc_msgSend_delegate(*(void **)(a1 + 32), v13, v14, v15);
  objc_msgSend_didUpdateAnalytics_withError_(v16, v17, (uint64_t)v18, 0);
}

os_log_t sub_227CAB328()
{
  os_log_t result = os_log_create("com.apple.locationd.Motion", "PrecisionFinding");
  qword_2681B9A68 = (uint64_t)result;
  return result;
}

void sub_227CAB358()
{
  exceptiounint64_t n = __cxa_allocate_exception(8uLL);
  *exceptiounint64_t n = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

void sub_227CAB3A4()
{
}

void sub_227CAB3B8(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_227B19000, a2, OS_LOG_TYPE_DEBUG, "MSL config updated from user defaults %@", (uint8_t *)&v3, 0xCu);
}

void sub_227CAB434(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_227B19000, a2, OS_LOG_TYPE_FAULT, "fUserDefaults returned nil for domain: %@", (uint8_t *)&v3, 0xCu);
}

void sub_227CAB4B0(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_debug_impl(&dword_227B19000, log, OS_LOG_TYPE_DEBUG, "[MSLManager] Logging is not enabled.", v1, 2u);
}

void sub_227CAB4F4(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_debug_impl(&dword_227B19000, log, OS_LOG_TYPE_DEBUG, "[MSLManager] Logging Msl item.", v1, 2u);
}

void sub_227CAB538()
{
  __assert_rtn("setFlushTimeoutSeconds_block_invoke", "MSLWriter.cpp", 56, "(fFd == -1) && (\"Writer::setFlushTimeout() must be called before ::open().\")");
}

void sub_227CAB564(uint64_t a1, void *a2, os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(char *)(a1 + 39) < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136446210;
  uint64_t v4 = a2;
  _os_log_error_impl(&dword_227B19000, log, OS_LOG_TYPE_ERROR, "Unable to create directory at path: %{public}s", (uint8_t *)&v3, 0xCu);
}

uint64_t sub_227CAB5EC(os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  int v3 = "assert";
  __int16 v4 = 2080;
  uint64_t v5 = "fValid";
  __int16 v6 = 2080;
  uint64_t v7 = "On call to writeItem client should check if the logger was opened";
  _os_log_fault_impl(&dword_227B19000, log, OS_LOG_TYPE_FAULT, "Event: %s\n Condition: %s\n Message: %s", (uint8_t *)&v2, 0x20u);
  if (qword_2681B9B80 == -1) {
    return 1;
  }
  dispatch_once(&qword_2681B9B80, &unk_26DC24530);
  return 0;
}

uint64_t sub_227CAB6C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void sub_227CAB6E8(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t CLMotionActivity::indexToActivityType(CLMotionActivity *this)
{
  return MEMORY[0x270EE84E8](this);
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x270F587A0](this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return MEMORY[0x270F587A8]();
}

{
  return MEMORY[0x270F587B0]();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x270F587B8](this, a2);
}

{
  return MEMORY[0x270F587D0](this, a2);
}

{
  return MEMORY[0x270F587D8](this, a2);
}

{
  return MEMORY[0x270F587E0](this, a2);
}

{
  return MEMORY[0x270F587E8](this, a2);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  return MEMORY[0x270F587C0](this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, float a3)
{
  return MEMORY[0x270F587C8](this, a2, a3);
}

void PB::Base::~Base(PB::Base *this)
{
}

uint64_t PB::Data::Data()
{
  return MEMORY[0x270F58808]();
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x270F58810]();
}

uint64_t PB::Reader::read()
{
  return MEMORY[0x270F58818]();
}

{
  return MEMORY[0x270F58820]();
}

uint64_t PB::Reader::skip(PB::Reader *this)
{
  return MEMORY[0x270F58828](this);
}

uint64_t PB::Reader::placeMark()
{
  return MEMORY[0x270F58830]();
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this)
{
  return MEMORY[0x270F58840](this);
}

{
  return MEMORY[0x270F58848](this);
}

{
  return MEMORY[0x270F58850](this);
}

{
  return MEMORY[0x270F58858](this);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2)
{
  return MEMORY[0x270F58860](this, a2);
}

uint64_t PB::Writer::write()
{
  return MEMORY[0x270F58868]();
}

{
  return MEMORY[0x270F58870]();
}

uint64_t PB::Writer::write(PB::Writer *this)
{
  return MEMORY[0x270F58878](this);
}

uint64_t PB::Writer::write(PB::Writer *this, double a2)
{
  return MEMORY[0x270F58880](this, a2);
}

uint64_t PB::Writer::write(PB::Writer *this, float a2)
{
  return MEMORY[0x270F58888](this, a2);
}

uint64_t PB::Writer::writeSInt(PB::Writer *this)
{
  return MEMORY[0x270F58890](this);
}

{
  return MEMORY[0x270F58898](this);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x270F588A0](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x270F982D8](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

uint64_t std::time_put<char,std::ostreambuf_iterator<char>>::put()
{
  return MEMORY[0x270F98308]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x270F98440](this, *(void *)&__ecode);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F98568](this, __c);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987E0]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x270F98890](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x270F98A00](retstr, __s);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return MEMORY[0x270F98C30](__t);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__float cosval = v2;
  result.__double sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__float cosval = v2;
  result.__double sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B8](strm, *(void *)&level, version, *(void *)&stream_size);
}

int deflateReset(z_streamp strm)
{
  return MEMORY[0x270F9C6C0](strm);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

void dispatch_io_barrier(dispatch_io_t channel, dispatch_block_t barrier)
{
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x270ED9390](type, *(void *)&fd, queue, cleanup_handler);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int fsync(int a1)
{
  return MEMORY[0x270ED9B10](*(void *)&a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}