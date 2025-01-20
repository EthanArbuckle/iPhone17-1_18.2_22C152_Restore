unint64_t sub_24C70BC30(uint64_t a1, void *lpsrc)
{
  uint64_t vars8;

  if (!__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26FEDBFE8, (const struct __class_type_info *)&unk_26FEDBCF0, 0))sub_24C7080C0(); {
  return sub_24C70BCB8(a1, (uint64_t)lpsrc);
  }
}

unint64_t sub_24C70BCB8(uint64_t a1, uint64_t a2)
{
  if (a2 == a1)
  {
    sub_24C716A34((uint64_t)v45, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 1671);
    v4 = sub_24C716A4C(v45, "CHECK failed: (&from) != (this): ");
    sub_24C716B88((uint64_t)&v44, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v45);
  }
  sub_24C71AF7C(a1 + 16, a2 + 16);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v5)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v8 = *(void *)(a1 + 8);
    if (v8) {
      v9 = (std::string *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      v9 = (std::string *)sub_24C7078BC((unint64_t *)(a1 + 8));
    }
    int v10 = *(char *)(v6 + 31);
    if (v10 >= 0) {
      v11 = (const std::string::value_type *)v7;
    }
    else {
      v11 = *(const std::string::value_type **)(v6 + 8);
    }
    if (v10 >= 0) {
      std::string::size_type v12 = *(unsigned __int8 *)(v6 + 31);
    }
    else {
      std::string::size_type v12 = *(void *)(v6 + 16);
    }
    std::string::append(v9, v11, v12);
  }
  sub_24C7112AC(a1 + 56, a2 + 56);
  sub_24C7112AC(a1 + 80, a2 + 80);
  sub_24C7112AC(a1 + 104, a2 + 104);
  unint64_t result = sub_24C7112AC(a1 + 128, a2 + 128);
  unsigned int v14 = *(_DWORD *)(a2 + 40);
  if (!(_BYTE)v14) {
    goto LABEL_47;
  }
  if (v14)
  {
    v15 = (long long *)(*(void *)(a2 + 152) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 1u;
    uint64_t v16 = *(void *)(a1 + 8);
    v17 = (void *)(v16 & 0xFFFFFFFFFFFFFFFELL);
    if (v16) {
      v17 = (void *)*v17;
    }
    unint64_t result = sub_24C715858((uint64_t *)(a1 + 152), v15, (uint64_t)v17);
    if ((v14 & 2) == 0)
    {
LABEL_16:
      if ((v14 & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_29;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_16;
  }
  v18 = (long long *)(*(void *)(a2 + 160) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 2u;
  uint64_t v19 = *(void *)(a1 + 8);
  v20 = (void *)(v19 & 0xFFFFFFFFFFFFFFFELL);
  if (v19) {
    v20 = (void *)*v20;
  }
  unint64_t result = sub_24C715858((uint64_t *)(a1 + 160), v18, (uint64_t)v20);
  if ((v14 & 4) == 0)
  {
LABEL_17:
    if ((v14 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_32;
  }
LABEL_29:
  v21 = (long long *)(*(void *)(a2 + 168) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 4u;
  uint64_t v22 = *(void *)(a1 + 8);
  v23 = (void *)(v22 & 0xFFFFFFFFFFFFFFFELL);
  if (v22) {
    v23 = (void *)*v23;
  }
  unint64_t result = sub_24C715858((uint64_t *)(a1 + 168), v21, (uint64_t)v23);
  if ((v14 & 8) == 0)
  {
LABEL_18:
    if ((v14 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_32:
  v24 = (long long *)(*(void *)(a2 + 176) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 8u;
  uint64_t v25 = *(void *)(a1 + 8);
  v26 = (void *)(v25 & 0xFFFFFFFFFFFFFFFELL);
  if (v25) {
    v26 = (void *)*v26;
  }
  unint64_t result = sub_24C715880((uint64_t *)(a1 + 176), v24, (uint64_t)v26);
  if ((v14 & 0x10) == 0)
  {
LABEL_19:
    if ((v14 & 0x20) == 0) {
      goto LABEL_20;
    }
LABEL_38:
    v30 = (long long *)(*(void *)(a2 + 192) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 0x20u;
    uint64_t v31 = *(void *)(a1 + 8);
    v32 = (void *)(v31 & 0xFFFFFFFFFFFFFFFELL);
    if (v31) {
      v32 = (void *)*v32;
    }
    unint64_t result = sub_24C715880((uint64_t *)(a1 + 192), v30, (uint64_t)v32);
    if ((v14 & 0x40) == 0)
    {
LABEL_21:
      if ((v14 & 0x80) == 0) {
        goto LABEL_47;
      }
      goto LABEL_44;
    }
    goto LABEL_41;
  }
LABEL_35:
  v27 = (long long *)(*(void *)(a2 + 184) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 0x10u;
  uint64_t v28 = *(void *)(a1 + 8);
  v29 = (void *)(v28 & 0xFFFFFFFFFFFFFFFELL);
  if (v28) {
    v29 = (void *)*v29;
  }
  unint64_t result = sub_24C715880((uint64_t *)(a1 + 184), v27, (uint64_t)v29);
  if ((v14 & 0x20) != 0) {
    goto LABEL_38;
  }
LABEL_20:
  if ((v14 & 0x40) == 0) {
    goto LABEL_21;
  }
LABEL_41:
  v33 = (long long *)(*(void *)(a2 + 200) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 0x40u;
  uint64_t v34 = *(void *)(a1 + 8);
  v35 = (void *)(v34 & 0xFFFFFFFFFFFFFFFELL);
  if (v34) {
    v35 = (void *)*v35;
  }
  unint64_t result = sub_24C715880((uint64_t *)(a1 + 200), v33, (uint64_t)v35);
  if ((v14 & 0x80) != 0)
  {
LABEL_44:
    v36 = (long long *)(*(void *)(a2 + 208) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 0x80u;
    uint64_t v37 = *(void *)(a1 + 8);
    v38 = (void *)(v37 & 0xFFFFFFFFFFFFFFFELL);
    if (v37) {
      v38 = (void *)*v38;
    }
    unint64_t result = sub_24C715880((uint64_t *)(a1 + 208), v36, (uint64_t)v38);
  }
LABEL_47:
  if ((v14 & 0xFF00) == 0) {
    goto LABEL_58;
  }
  if ((v14 & 0x100) != 0)
  {
    v41 = (long long *)(*(void *)(a2 + 216) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 0x100u;
    uint64_t v42 = *(void *)(a1 + 8);
    v43 = (void *)(v42 & 0xFFFFFFFFFFFFFFFELL);
    if (v42) {
      v43 = (void *)*v43;
    }
    unint64_t result = sub_24C715858((uint64_t *)(a1 + 216), v41, (uint64_t)v43);
    if ((v14 & 0x200) == 0)
    {
LABEL_50:
      if ((v14 & 0x400) == 0) {
        goto LABEL_51;
      }
      goto LABEL_97;
    }
  }
  else if ((v14 & 0x200) == 0)
  {
    goto LABEL_50;
  }
  *(_DWORD *)(a1 + 224) = *(_DWORD *)(a2 + 224);
  if ((v14 & 0x400) == 0)
  {
LABEL_51:
    if ((v14 & 0x800) == 0) {
      goto LABEL_52;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(a1 + 228) = *(_DWORD *)(a2 + 228);
  if ((v14 & 0x800) == 0)
  {
LABEL_52:
    if ((v14 & 0x1000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  if ((v14 & 0x1000) == 0)
  {
LABEL_53:
    if ((v14 & 0x2000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(_DWORD *)(a1 + 240) = *(_DWORD *)(a2 + 240);
  if ((v14 & 0x2000) == 0)
  {
LABEL_54:
    if ((v14 & 0x4000) == 0) {
      goto LABEL_55;
    }
LABEL_101:
    *(unsigned char *)(a1 + 245) = *(unsigned char *)(a2 + 245);
    if ((v14 & 0x8000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
LABEL_100:
  *(unsigned char *)(a1 + 244) = *(unsigned char *)(a2 + 244);
  if ((v14 & 0x4000) != 0) {
    goto LABEL_101;
  }
LABEL_55:
  if ((v14 & 0x8000) != 0) {
LABEL_56:
  }
    *(unsigned char *)(a1 + 246) = *(unsigned char *)(a2 + 246);
LABEL_57:
  *(_DWORD *)(a1 + 40) |= v14;
LABEL_58:
  if ((v14 & 0xFF0000) == 0) {
    goto LABEL_69;
  }
  if ((v14 & 0x10000) != 0)
  {
    *(unsigned char *)(a1 + 247) = *(unsigned char *)(a2 + 247);
    if ((v14 & 0x20000) == 0)
    {
LABEL_61:
      if ((v14 & 0x40000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_105;
    }
  }
  else if ((v14 & 0x20000) == 0)
  {
    goto LABEL_61;
  }
  *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
  if ((v14 & 0x40000) == 0)
  {
LABEL_62:
    if ((v14 & 0x80000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(unsigned char *)(a1 + 249) = *(unsigned char *)(a2 + 249);
  if ((v14 & 0x80000) == 0)
  {
LABEL_63:
    if ((v14 & 0x100000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(unsigned char *)(a1 + 250) = *(unsigned char *)(a2 + 250);
  if ((v14 & 0x100000) == 0)
  {
LABEL_64:
    if ((v14 & 0x200000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(_DWORD *)(a1 + 252) = *(_DWORD *)(a2 + 252);
  if ((v14 & 0x200000) == 0)
  {
LABEL_65:
    if ((v14 & 0x400000) == 0) {
      goto LABEL_66;
    }
LABEL_109:
    *(void *)(a1 + 264) = *(void *)(a2 + 264);
    if ((v14 & 0x800000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_108:
  *(_DWORD *)(a1 + 256) = *(_DWORD *)(a2 + 256);
  if ((v14 & 0x400000) != 0) {
    goto LABEL_109;
  }
LABEL_66:
  if ((v14 & 0x800000) != 0) {
LABEL_67:
  }
    *(_DWORD *)(a1 + 272) = *(_DWORD *)(a2 + 272);
LABEL_68:
  *(_DWORD *)(a1 + 40) |= v14;
LABEL_69:
  if (!HIBYTE(v14)) {
    goto LABEL_79;
  }
  if ((v14 & 0x1000000) != 0)
  {
    *(_DWORD *)(a1 + 276) = *(_DWORD *)(a2 + 276);
    if ((v14 & 0x2000000) == 0)
    {
LABEL_72:
      if ((v14 & 0x4000000) == 0) {
        goto LABEL_73;
      }
      goto LABEL_121;
    }
  }
  else if ((v14 & 0x2000000) == 0)
  {
    goto LABEL_72;
  }
  *(_DWORD *)(a1 + 280) = *(_DWORD *)(a2 + 280);
  if ((v14 & 0x4000000) == 0)
  {
LABEL_73:
    if ((v14 & 0x8000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_122;
  }
LABEL_121:
  *(_DWORD *)(a1 + 284) = *(_DWORD *)(a2 + 284);
  if ((v14 & 0x8000000) == 0)
  {
LABEL_74:
    if ((v14 & 0x10000000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_123;
  }
LABEL_122:
  *(_DWORD *)(a1 + 288) = *(_DWORD *)(a2 + 288);
  if ((v14 & 0x10000000) == 0)
  {
LABEL_75:
    if ((v14 & 0x20000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_124;
  }
LABEL_123:
  *(_DWORD *)(a1 + 292) = *(_DWORD *)(a2 + 292);
  if ((v14 & 0x20000000) == 0)
  {
LABEL_76:
    if ((v14 & 0x40000000) == 0) {
      goto LABEL_77;
    }
LABEL_125:
    *(_DWORD *)(a1 + 300) = *(_DWORD *)(a2 + 300);
    if ((v14 & 0x80000000) == 0) {
      goto LABEL_78;
    }
LABEL_126:
    *(_DWORD *)(a1 + 304) = *(_DWORD *)(a2 + 304);
    goto LABEL_78;
  }
LABEL_124:
  *(_DWORD *)(a1 + 296) = *(_DWORD *)(a2 + 296);
  if ((v14 & 0x40000000) != 0) {
    goto LABEL_125;
  }
LABEL_77:
  if ((v14 & 0x80000000) != 0) {
    goto LABEL_126;
  }
LABEL_78:
  *(_DWORD *)(a1 + 40) |= v14;
LABEL_79:
  int v39 = *(_DWORD *)(a2 + 44);
  if (!(_BYTE)v39) {
    goto LABEL_90;
  }
  if (v39)
  {
    *(unsigned char *)(a1 + 308) = *(unsigned char *)(a2 + 308);
    if ((v39 & 2) == 0)
    {
LABEL_82:
      if ((v39 & 4) == 0) {
        goto LABEL_83;
      }
      goto LABEL_113;
    }
  }
  else if ((v39 & 2) == 0)
  {
    goto LABEL_82;
  }
  *(unsigned char *)(a1 + 309) = *(unsigned char *)(a2 + 309);
  if ((v39 & 4) == 0)
  {
LABEL_83:
    if ((v39 & 8) == 0) {
      goto LABEL_84;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(unsigned char *)(a1 + 310) = *(unsigned char *)(a2 + 310);
  if ((v39 & 8) == 0)
  {
LABEL_84:
    if ((v39 & 0x10) == 0) {
      goto LABEL_85;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(unsigned char *)(a1 + 311) = *(unsigned char *)(a2 + 311);
  if ((v39 & 0x10) == 0)
  {
LABEL_85:
    if ((v39 & 0x20) == 0) {
      goto LABEL_86;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
  if ((v39 & 0x20) == 0)
  {
LABEL_86:
    if ((v39 & 0x40) == 0) {
      goto LABEL_87;
    }
LABEL_117:
    *(_DWORD *)(a1 + 316) = *(_DWORD *)(a2 + 316);
    if ((v39 & 0x80) == 0) {
      goto LABEL_89;
    }
    goto LABEL_88;
  }
LABEL_116:
  *(unsigned char *)(a1 + 313) = *(unsigned char *)(a2 + 313);
  if ((v39 & 0x40) != 0) {
    goto LABEL_117;
  }
LABEL_87:
  if ((v39 & 0x80) != 0) {
LABEL_88:
  }
    *(_DWORD *)(a1 + 320) = *(_DWORD *)(a2 + 320);
LABEL_89:
  *(_DWORD *)(a1 + 44) |= v39;
LABEL_90:
  if ((v39 & 0x100) != 0)
  {
    int v40 = *(_DWORD *)(a2 + 324);
    *(_DWORD *)(a1 + 44) |= 0x100u;
    *(_DWORD *)(a1 + 324) = v40;
  }
  return result;
}

void sub_24C70C214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C70C22C(uint64_t a1)
{
  return sub_24C71C40C(a1 + 16);
}

void *sub_24C70C234@<X0>(void *a1@<X8>)
{
  return sub_24C6698FC(a1, "sentencepiece.TrainerSpec");
}

uint64_t sub_24C70C244(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26FEDC648;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = &unk_26FEDC6E8;
  sub_24C717054(a1 + 24, a2);
  *(void *)(a1 + 48) = 0;
  if (atomic_load_explicit(dword_26BADA7F0, memory_order_acquire)) {
    sub_24C722260(dword_26BADA7F0);
  }
  *(void *)(a1 + 56) = &qword_2697ED438;
  *(void *)(a1 + 64) = &qword_2697ED438;
  *(void *)(a1 + 72) = &qword_2697ED438;
  *(_DWORD *)(a1 + 80) = 16843008;
  return a1;
}

void sub_24C70C2F0(_Unwind_Exception *a1)
{
  sub_24C717134(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24C70C304(uint64_t a1)
{
  return a1;
}

uint64_t *sub_24C70C340(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  v3 = (void *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  if ((v2 & 1) == 0)
  {
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (*v3)
  {
LABEL_3:
    sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 1972);
    v4 = sub_24C716A4C(v15, "CHECK failed: GetArena() == nullptr: ");
    sub_24C716B88((uint64_t)&v14, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v15);
  }
LABEL_4:
  if (*(uint64_t **)(a1 + 56) != &qword_2697ED438)
  {
    uint64_t v5 = sub_24C7076A8((uint64_t *)(a1 + 56));
    uint64_t v6 = v5;
    if (*(char *)(v5 + 23) < 0) {
      operator delete(*(void **)v5);
    }
    MEMORY[0x2532F8960](v6, 0x1012C40EC159624);
  }
  unint64_t result = (uint64_t *)(a1 + 64);
  if (*(uint64_t **)(a1 + 64) != &qword_2697ED438)
  {
    uint64_t v8 = sub_24C7076A8(result);
    uint64_t v9 = v8;
    if (*(char *)(v8 + 23) < 0) {
      operator delete(*(void **)v8);
    }
    unint64_t result = (uint64_t *)MEMORY[0x2532F8960](v9, 0x1012C40EC159624);
  }
  v11 = *(uint64_t **)(a1 + 72);
  int v10 = (uint64_t *)(a1 + 72);
  if (v11 != &qword_2697ED438)
  {
    uint64_t v12 = sub_24C7076A8(v10);
    uint64_t v13 = v12;
    if (*(char *)(v12 + 23) < 0) {
      operator delete(*(void **)v12);
    }
    return (uint64_t *)MEMORY[0x2532F8960](v13, 0x1012C40EC159624);
  }
  return result;
}

void sub_24C70C490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C70C4AC(uint64_t a1)
{
  return sub_24C70C304(a1 - 16);
}

void sub_24C70C4B4(uint64_t a1)
{
  sub_24C70C304(a1);
  JUMPOUT(0x2532F8960);
}

void sub_24C70C4EC(uint64_t a1)
{
  sub_24C70C304(a1 - 16);
  JUMPOUT(0x2532F8960);
}

unsigned __int8 *sub_24C70C528(uint64_t a1)
{
  unint64_t result = sub_24C71AEDC((unsigned __int8 *)(a1 + 24));
  int v3 = *(_DWORD *)(a1 + 48);
  if ((v3 & 7) != 0)
  {
    if ((v3 & 1) == 0)
    {
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
LABEL_10:
      unint64_t v5 = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)(v5 + 23) < 0)
      {
        **(unsigned char **)unint64_t v5 = 0;
        *(void *)(v5 + 8) = 0;
        if ((v3 & 4) == 0) {
          goto LABEL_17;
        }
      }
      else
      {
        *(unsigned char *)unint64_t v5 = 0;
        *(unsigned char *)(v5 + 23) = 0;
        if ((v3 & 4) == 0) {
          goto LABEL_17;
        }
      }
      goto LABEL_14;
    }
    unint64_t v4 = *(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v4 + 23) < 0)
    {
      **(unsigned char **)unint64_t v4 = 0;
      *(void *)(v4 + 8) = 0;
      if ((v3 & 2) != 0) {
        goto LABEL_10;
      }
    }
    else
    {
      *(unsigned char *)unint64_t v4 = 0;
      *(unsigned char *)(v4 + 23) = 0;
      if ((v3 & 2) != 0) {
        goto LABEL_10;
      }
    }
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_17;
    }
LABEL_14:
    unint64_t v6 = *(void *)(a1 + 72) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v6 + 23) < 0)
    {
      **(unsigned char **)unint64_t v6 = 0;
      *(void *)(v6 + 8) = 0;
    }
    else
    {
      *(unsigned char *)unint64_t v6 = 0;
      *(unsigned char *)(v6 + 23) = 0;
    }
  }
LABEL_17:
  if ((v3 & 0x78) != 0) {
    *(_DWORD *)(a1 + 80) = 16843008;
  }
  *(_DWORD *)(a1 + 48) = 0;
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v8 + 31) < 0)
    {
      **(unsigned char **)(v8 + 8) = 0;
      *(void *)(v8 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v8 + 8) = 0;
      *(unsigned char *)(v8 + 31) = 0;
    }
  }
  return result;
}

uint64_t sub_24C70C638(uint64_t a1, uint64_t a2, int32x2_t *a3)
{
  *(void *)uint64_t v42 = a2;
  int v5 = 0;
  if ((sub_24C70777C((uint64_t)a3, (char **)v42, a3[11].i32[1]) & 1) == 0)
  {
    uint64_t v7 = (void *)(a1 + 8);
    while (1)
    {
      unint64_t v8 = (char *)(*(void *)v42 + 1);
      unsigned int v9 = **(unsigned char **)v42;
      if ((char)**(unsigned char **)v42 < 0)
      {
        unsigned int v10 = v9 + (*v8 << 7);
        unsigned int v9 = v10 - 128;
        if (*v8 < 0)
        {
          uint64_t v17 = sub_24C723D18(*(uint64_t *)v42, v10 - 128);
          *(void *)uint64_t v42 = v17;
          if (!v17) {
            goto LABEL_67;
          }
          unint64_t v8 = (char *)v17;
          unsigned int v9 = v18;
          goto LABEL_8;
        }
        unint64_t v8 = (char *)(*(void *)v42 + 2);
      }
      *(void *)uint64_t v42 = v8;
LABEL_8:
      switch(v9 >> 3)
      {
        case 1u:
          if (v9 != 10) {
            goto LABEL_48;
          }
          *(_DWORD *)(a1 + 48) |= 1u;
          uint64_t v11 = *(void *)(a1 + 8);
          uint64_t v12 = (void *)(v11 & 0xFFFFFFFFFFFFFFFELL);
          if (v11) {
            uint64_t v12 = (void *)*v12;
          }
          uint64_t v13 = (uint64_t *)(a1 + 56);
          goto LABEL_44;
        case 2u:
          if (v9 != 18) {
            goto LABEL_48;
          }
          *(_DWORD *)(a1 + 48) |= 2u;
          uint64_t v19 = *(void *)(a1 + 8);
          uint64_t v12 = (void *)(v19 & 0xFFFFFFFFFFFFFFFELL);
          if (v19) {
            uint64_t v12 = (void *)*v12;
          }
          uint64_t v13 = (uint64_t *)(a1 + 64);
          goto LABEL_44;
        case 3u:
          if (v9 != 24) {
            goto LABEL_48;
          }
          v5 |= 0x10u;
          v20 = v8 + 1;
          uint64_t v21 = *v8;
          if ((*v8 & 0x80000000) == 0) {
            goto LABEL_29;
          }
          int v22 = *v20;
          uint64_t v21 = v21 + (v22 << 7) - 128;
          if (v22 < 0)
          {
            uint64_t v36 = sub_24C723CD0((uint64_t)v8, v21);
            *(void *)uint64_t v42 = v36;
            *(unsigned char *)(a1 + 81) = v37 != 0;
            if (!v36) {
              goto LABEL_67;
            }
          }
          else
          {
            v20 = v8 + 2;
LABEL_29:
            *(void *)uint64_t v42 = v20;
            *(unsigned char *)(a1 + 81) = v21 != 0;
          }
          goto LABEL_46;
        case 4u:
          if (v9 != 32) {
            goto LABEL_48;
          }
          v5 |= 0x20u;
          v23 = v8 + 1;
          uint64_t v24 = *v8;
          if ((*v8 & 0x80000000) == 0) {
            goto LABEL_34;
          }
          int v25 = *v23;
          uint64_t v24 = v24 + (v25 << 7) - 128;
          if (v25 < 0)
          {
            uint64_t v38 = sub_24C723CD0((uint64_t)v8, v24);
            *(void *)uint64_t v42 = v38;
            *(unsigned char *)(a1 + 82) = v39 != 0;
            if (!v38) {
              goto LABEL_67;
            }
          }
          else
          {
            v23 = v8 + 2;
LABEL_34:
            *(void *)uint64_t v42 = v23;
            *(unsigned char *)(a1 + 82) = v24 != 0;
          }
          goto LABEL_46;
        case 5u:
          if (v9 != 40) {
            goto LABEL_48;
          }
          v5 |= 0x40u;
          v26 = v8 + 1;
          uint64_t v27 = *v8;
          if ((*v8 & 0x80000000) == 0) {
            goto LABEL_39;
          }
          int v28 = *v26;
          uint64_t v27 = v27 + (v28 << 7) - 128;
          if (v28 < 0)
          {
            uint64_t v40 = sub_24C723CD0((uint64_t)v8, v27);
            *(void *)uint64_t v42 = v40;
            *(unsigned char *)(a1 + 83) = v41 != 0;
            if (!v40) {
              goto LABEL_67;
            }
          }
          else
          {
            v26 = v8 + 2;
LABEL_39:
            *(void *)uint64_t v42 = v26;
            *(unsigned char *)(a1 + 83) = v27 != 0;
          }
          goto LABEL_46;
        case 6u:
          if (v9 != 50) {
            goto LABEL_48;
          }
          *(_DWORD *)(a1 + 48) |= 4u;
          uint64_t v29 = *(void *)(a1 + 8);
          uint64_t v12 = (void *)(v29 & 0xFFFFFFFFFFFFFFFELL);
          if (v29) {
            uint64_t v12 = (void *)*v12;
          }
          uint64_t v13 = (uint64_t *)(a1 + 72);
LABEL_44:
          v30 = (std::string *)sub_24C715890(v13, (uint64_t)v12);
          uint64_t v31 = (void *)sub_24C723DCC(v30, *(char **)v42, (uint64_t)a3);
          goto LABEL_45;
        default:
          if (v9 >> 3 == 200 && v9 == 64)
          {
            v5 |= 8u;
            char v14 = v8 + 1;
            uint64_t v15 = *v8;
            if ((*v8 & 0x80000000) == 0) {
              goto LABEL_18;
            }
            int v16 = *v14;
            uint64_t v15 = v15 + (v16 << 7) - 128;
            if ((v16 & 0x80000000) == 0)
            {
              char v14 = v8 + 2;
LABEL_18:
              *(void *)uint64_t v42 = v14;
              *(unsigned char *)(a1 + 80) = v15 != 0;
              goto LABEL_46;
            }
            uint64_t v34 = sub_24C723CD0((uint64_t)v8, v15);
            *(void *)uint64_t v42 = v34;
            *(unsigned char *)(a1 + 80) = v35 != 0;
            if (!v34) {
              goto LABEL_67;
            }
          }
          else
          {
LABEL_48:
            if (v9) {
              BOOL v32 = (v9 & 7) == 4;
            }
            else {
              BOOL v32 = 1;
            }
            if (v32)
            {
              a3[10].i32[0] = v9 - 1;
              goto LABEL_2;
            }
            if (v9 < 0x648)
            {
              if (*v7)
              {
                v33 = (std::string *)((*v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
              }
              else
              {
                v33 = (std::string *)sub_24C7078BC((unint64_t *)(a1 + 8));
                unint64_t v8 = *(char **)v42;
              }
              uint64_t v31 = sub_24C724288(v9, v33, v8, a3);
            }
            else
            {
              uint64_t v31 = sub_24C71C7AC((uint64_t *)(a1 + 24), v9, (unsigned __int8 *)v8, (uint64_t)&unk_2697ED650, (unint64_t *)(a1 + 8), a3);
            }
LABEL_45:
            *(void *)uint64_t v42 = v31;
            if (!v31)
            {
LABEL_67:
              *(void *)uint64_t v42 = 0;
              goto LABEL_2;
            }
          }
LABEL_46:
          if (sub_24C70777C((uint64_t)a3, (char **)v42, a3[11].i32[1])) {
            goto LABEL_2;
          }
          break;
      }
    }
  }
LABEL_2:
  *(_DWORD *)(a1 + 48) |= v5;
  return *(void *)v42;
}

char *sub_24C70CA5C(uint64_t a1, char *a2, unint64_t *a3)
{
  unint64_t v4 = a2;
  int v6 = *(_DWORD *)(a1 + 48);
  if (v6)
  {
    unint64_t v4 = sub_24C70589C(a3, 1, (const void **)(*(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL), a2);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  unint64_t v4 = sub_24C70589C(a3, 2, (const void **)(*(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL), v4);
  if ((v6 & 0x10) == 0)
  {
LABEL_4:
    if ((v6 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_11:
  if (*a3 <= (unint64_t)v4) {
    unint64_t v4 = sub_24C715FA8((uint64_t)a3, v4);
  }
  char v7 = *(unsigned char *)(a1 + 81);
  char *v4 = 24;
  v4[1] = v7;
  v4 += 2;
  if ((v6 & 0x20) == 0)
  {
LABEL_5:
    if ((v6 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_14:
  if (*a3 <= (unint64_t)v4) {
    unint64_t v4 = sub_24C715FA8((uint64_t)a3, v4);
  }
  char v8 = *(unsigned char *)(a1 + 82);
  char *v4 = 32;
  v4[1] = v8;
  v4 += 2;
  if ((v6 & 0x40) == 0)
  {
LABEL_6:
    if ((v6 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_17:
  if (*a3 <= (unint64_t)v4) {
    unint64_t v4 = sub_24C715FA8((uint64_t)a3, v4);
  }
  char v9 = *(unsigned char *)(a1 + 83);
  char *v4 = 40;
  v4[1] = v9;
  v4 += 2;
  if ((v6 & 4) == 0)
  {
LABEL_7:
    if ((v6 & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
LABEL_20:
  unint64_t v4 = sub_24C70589C(a3, 6, (const void **)(*(void *)(a1 + 72) & 0xFFFFFFFFFFFFFFFELL), v4);
  if ((v6 & 8) == 0) {
    goto LABEL_24;
  }
LABEL_21:
  if (*a3 <= (unint64_t)v4) {
    unint64_t v4 = sub_24C715FA8((uint64_t)a3, v4);
  }
  char v10 = *(unsigned char *)(a1 + 80);
  *(_WORD *)unint64_t v4 = 3264;
  v4[2] = v10;
  v4 += 3;
LABEL_24:
  uint64_t v11 = sub_24C71D5A4(a1 + 24, 201, 0x20000000, v4, (uint64_t *)a3);
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(a1 + 8);
  if ((v13 & 1) == 0) {
    return v12;
  }
  unint64_t v15 = v13 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v15 + 31) < 0)
  {
    int v16 = *(void **)(v15 + 8);
    uint64_t v17 = *(void *)(v15 + 16);
  }
  else
  {
    int v16 = (void *)(v15 + 8);
    LODWORD(v17) = *(unsigned __int8 *)(v15 + 31);
  }
  if ((uint64_t)(*a3 - (void)v11) >= (int)v17)
  {
    uint64_t v18 = (int)v17;
    memcpy(v11, v16, (int)v17);
    v12 += v18;
    return v12;
  }
  return sub_24C7160BC((uint64_t *)a3, (char *)v16, v17, (unint64_t)v11);
}

uint64_t sub_24C70CC70(uint64_t a1)
{
  uint64_t result = sub_24C7202D8(a1 + 24);
  int v3 = *(_DWORD *)(a1 + 48);
  if ((v3 & 0x7F) == 0) {
    goto LABEL_17;
  }
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0) {
      goto LABEL_4;
    }
LABEL_22:
    unint64_t v12 = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v13 = *(unsigned __int8 *)(v12 + 23);
    uint64_t v14 = *(void *)(v12 + 8);
    if ((v13 & 0x80u) == 0) {
      uint64_t v14 = v13;
    }
    result += v14 + ((9 * (__clz(v14 | 1) ^ 0x1F) + 73) >> 6) + 1;
    if ((v3 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  unint64_t v9 = *(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v10 = *(unsigned __int8 *)(v9 + 23);
  uint64_t v11 = *(void *)(v9 + 8);
  if ((v10 & 0x80u) == 0) {
    uint64_t v11 = v10;
  }
  result += v11 + ((9 * (__clz(v11 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v3 & 2) != 0) {
    goto LABEL_22;
  }
LABEL_4:
  if ((v3 & 4) != 0)
  {
LABEL_5:
    unint64_t v4 = *(void *)(a1 + 72) & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v5 = *(unsigned __int8 *)(v4 + 23);
    uint64_t v6 = *(void *)(v4 + 8);
    if ((v5 & 0x80u) == 0) {
      uint64_t v6 = v5;
    }
    result += v6 + ((9 * (__clz(v6 | 1) ^ 0x1F) + 73) >> 6) + 1;
  }
LABEL_8:
  uint64_t v7 = result + 3;
  if ((v3 & 8) == 0) {
    uint64_t v7 = result;
  }
  if ((v3 & 0x10) != 0) {
    v7 += 2;
  }
  if ((v3 & 0x20) != 0) {
    v7 += 2;
  }
  if ((v3 & 0x40) != 0) {
    uint64_t result = v7 + 2;
  }
  else {
    uint64_t result = v7;
  }
LABEL_17:
  uint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    unint64_t v15 = v8 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v15 + 31) < 0) {
      uint64_t v16 = *(void *)(v15 + 16);
    }
    else {
      uint64_t v16 = *(unsigned __int8 *)(v15 + 31);
    }
    result += v16;
  }
  *(_DWORD *)(a1 + 52) = result;
  return result;
}

void sub_24C70CDD8(uint64_t a1, void *lpsrc)
{
  if (!__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26FEDBFE8, (const struct __class_type_info *)&unk_26FEDBD40, 0))sub_24C7080C0(); {
  sub_24C70CE60(a1, (uint64_t)lpsrc);
  }
}

void sub_24C70CE60(uint64_t a1, uint64_t a2)
{
  if (a2 == a1)
  {
    sub_24C716A34((uint64_t)v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2246);
    unint64_t v4 = sub_24C716A4C(v24, "CHECK failed: (&from) != (this): ");
    sub_24C716B88((uint64_t)&v23, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v24);
  }
  sub_24C71AF7C(a1 + 24, a2 + 24);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v5)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v8 = *(void *)(a1 + 8);
    if (v8) {
      unint64_t v9 = (std::string *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      unint64_t v9 = (std::string *)sub_24C7078BC((unint64_t *)(a1 + 8));
    }
    int v10 = *(char *)(v6 + 31);
    if (v10 >= 0) {
      uint64_t v11 = (const std::string::value_type *)v7;
    }
    else {
      uint64_t v11 = *(const std::string::value_type **)(v6 + 8);
    }
    if (v10 >= 0) {
      std::string::size_type v12 = *(unsigned __int8 *)(v6 + 31);
    }
    else {
      std::string::size_type v12 = *(void *)(v6 + 16);
    }
    std::string::append(v9, v11, v12);
  }
  int v13 = *(_DWORD *)(a2 + 48);
  if ((v13 & 0x7F) != 0)
  {
    if (v13)
    {
      uint64_t v14 = (long long *)(*(void *)(a2 + 56) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(a1 + 48) |= 1u;
      uint64_t v15 = *(void *)(a1 + 8);
      uint64_t v16 = (void *)(v15 & 0xFFFFFFFFFFFFFFFELL);
      if (v15) {
        uint64_t v16 = (void *)*v16;
      }
      sub_24C715858((uint64_t *)(a1 + 56), v14, (uint64_t)v16);
      if ((v13 & 2) == 0)
      {
LABEL_16:
        if ((v13 & 4) == 0) {
          goto LABEL_17;
        }
        goto LABEL_30;
      }
    }
    else if ((v13 & 2) == 0)
    {
      goto LABEL_16;
    }
    uint64_t v17 = (long long *)(*(void *)(a2 + 64) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 48) |= 2u;
    uint64_t v18 = *(void *)(a1 + 8);
    uint64_t v19 = (void *)(v18 & 0xFFFFFFFFFFFFFFFELL);
    if (v18) {
      uint64_t v19 = (void *)*v19;
    }
    sub_24C715858((uint64_t *)(a1 + 64), v17, (uint64_t)v19);
    if ((v13 & 4) == 0)
    {
LABEL_17:
      if ((v13 & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_33;
    }
LABEL_30:
    v20 = (long long *)(*(void *)(a2 + 72) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 48) |= 4u;
    uint64_t v21 = *(void *)(a1 + 8);
    int v22 = (void *)(v21 & 0xFFFFFFFFFFFFFFFELL);
    if (v21) {
      int v22 = (void *)*v22;
    }
    sub_24C715858((uint64_t *)(a1 + 72), v20, (uint64_t)v22);
    if ((v13 & 8) == 0)
    {
LABEL_18:
      if ((v13 & 0x10) == 0) {
        goto LABEL_19;
      }
      goto LABEL_34;
    }
LABEL_33:
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    if ((v13 & 0x10) == 0)
    {
LABEL_19:
      if ((v13 & 0x20) == 0) {
        goto LABEL_20;
      }
      goto LABEL_35;
    }
LABEL_34:
    *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
    if ((v13 & 0x20) == 0)
    {
LABEL_20:
      if ((v13 & 0x40) == 0)
      {
LABEL_22:
        *(_DWORD *)(a1 + 48) |= v13;
        return;
      }
LABEL_21:
      *(unsigned char *)(a1 + 83) = *(unsigned char *)(a2 + 83);
      goto LABEL_22;
    }
LABEL_35:
    *(unsigned char *)(a1 + 82) = *(unsigned char *)(a2 + 82);
    if ((v13 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
}

void sub_24C70D02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C70D044(uint64_t a1)
{
  return sub_24C71C40C(a1 + 24);
}

void *sub_24C70D04C@<X0>(void *a1@<X8>)
{
  return sub_24C6698FC(a1, "sentencepiece.NormalizerSpec");
}

void *sub_24C70D05C(void *a1, uint64_t a2)
{
  *a1 = &unk_26FEDC7A8;
  a1[1] = a2;
  a1[2] = 0;
  if (atomic_load_explicit(dword_26BADA808, memory_order_acquire)) {
    sub_24C722260(dword_26BADA808);
  }
  a1[3] = &qword_2697ED438;
  a1[4] = &qword_2697ED438;
  return a1;
}

uint64_t sub_24C70D0CC(uint64_t a1)
{
  return a1;
}

uint64_t *sub_24C70D100(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = (void *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  if ((v2 & 1) == 0)
  {
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (*v3)
  {
LABEL_3:
    sub_24C716A34((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2362);
    unint64_t v4 = sub_24C716A4C(v13, "CHECK failed: GetArena() == nullptr: ");
    sub_24C716B88((uint64_t)&v12, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v13);
  }
LABEL_4:
  uint64_t result = (uint64_t *)(a1 + 24);
  if (*(uint64_t **)(a1 + 24) != &qword_2697ED438)
  {
    uint64_t v6 = sub_24C7076A8(result);
    uint64_t v7 = v6;
    if (*(char *)(v6 + 23) < 0) {
      operator delete(*(void **)v6);
    }
    uint64_t result = (uint64_t *)MEMORY[0x2532F8960](v7, 0x1012C40EC159624);
  }
  unint64_t v9 = *(uint64_t **)(a1 + 32);
  uint64_t v8 = (uint64_t *)(a1 + 32);
  if (v9 != &qword_2697ED438)
  {
    uint64_t v10 = sub_24C7076A8(v8);
    uint64_t v11 = v10;
    if (*(char *)(v10 + 23) < 0) {
      operator delete(*(void **)v10);
    }
    return (uint64_t *)MEMORY[0x2532F8960](v11, 0x1012C40EC159624);
  }
  return result;
}

void sub_24C70D210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C70D22C(uint64_t a1)
{
  sub_24C70D0CC(a1);
  JUMPOUT(0x2532F8960);
}

uint64_t sub_24C70D264(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 16);
  if ((v1 & 3) != 0)
  {
    if (v1)
    {
      unint64_t v2 = *(void *)(result + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)(v2 + 23) < 0)
      {
        **(unsigned char **)unint64_t v2 = 0;
        *(void *)(v2 + 8) = 0;
        if ((v1 & 2) == 0) {
          goto LABEL_11;
        }
        goto LABEL_6;
      }
      *(unsigned char *)unint64_t v2 = 0;
      *(unsigned char *)(v2 + 23) = 0;
    }
    if ((v1 & 2) == 0) {
      goto LABEL_11;
    }
LABEL_6:
    unint64_t v3 = *(void *)(result + 32) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v3 + 23) < 0)
    {
      **(unsigned char **)unint64_t v3 = 0;
      *(void *)(v3 + 8) = 0;
    }
    else
    {
      *(unsigned char *)unint64_t v3 = 0;
      *(unsigned char *)(v3 + 23) = 0;
    }
  }
LABEL_11:
  *(_DWORD *)(result + 16) = 0;
  uint64_t v4 = *(void *)(result + 8);
  if (v4)
  {
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v5 + 31) < 0)
    {
      **(unsigned char **)(v5 + 8) = 0;
      *(void *)(v5 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v5 + 8) = 0;
      *(unsigned char *)(v5 + 31) = 0;
    }
  }
  return result;
}

uint64_t sub_24C70D300(uint64_t a1, uint64_t a2, int32x2_t *a3)
{
  *(void *)uint64_t v21 = a2;
  if ((sub_24C70777C((uint64_t)a3, (char **)v21, a3[11].i32[1]) & 1) == 0)
  {
    uint64_t v6 = (void *)(a1 + 8);
    while (1)
    {
      uint64_t v7 = (char *)(*(void *)v21 + 1);
      unsigned int v8 = **(unsigned char **)v21;
      if (((char)**(unsigned char **)v21 & 0x80000000) == 0) {
        goto LABEL_7;
      }
      unsigned int v9 = v8 + (*v7 << 7);
      unsigned int v8 = v9 - 128;
      if ((*v7 & 0x80000000) == 0) {
        break;
      }
      uint64_t v19 = sub_24C723D18(*(uint64_t *)v21, v9 - 128);
      *(void *)uint64_t v21 = v19;
      if (!v19)
      {
LABEL_35:
        *(void *)uint64_t v21 = 0;
        return *(void *)v21;
      }
      uint64_t v7 = (char *)v19;
      unsigned int v8 = v20;
LABEL_8:
      if (v8 >> 3 == 2)
      {
        if (v8 == 18)
        {
          *(_DWORD *)(a1 + 16) |= 2u;
          uint64_t v14 = *(void *)(a1 + 8);
          uint64_t v15 = (void *)(v14 & 0xFFFFFFFFFFFFFFFELL);
          if (v14) {
            uint64_t v15 = (void *)*v15;
          }
          uint64_t v16 = (uint64_t *)(a1 + 32);
          goto LABEL_27;
        }
      }
      else if (v8 >> 3 == 1 && v8 == 10)
      {
        *(_DWORD *)(a1 + 16) |= 1u;
        uint64_t v17 = *(void *)(a1 + 8);
        uint64_t v15 = (void *)(v17 & 0xFFFFFFFFFFFFFFFELL);
        if (v17) {
          uint64_t v15 = (void *)*v15;
        }
        uint64_t v16 = (uint64_t *)(a1 + 24);
LABEL_27:
        uint64_t v18 = (std::string *)sub_24C715890(v16, (uint64_t)v15);
        int v13 = (void *)sub_24C723DCC(v18, *(char **)v21, (uint64_t)a3);
        goto LABEL_28;
      }
      if (v8) {
        BOOL v11 = (v8 & 7) == 4;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
        a3[10].i32[0] = v8 - 1;
        return *(void *)v21;
      }
      if (*v6)
      {
        char v12 = (std::string *)((*v6 & 0xFFFFFFFFFFFFFFFELL) + 8);
      }
      else
      {
        char v12 = (std::string *)sub_24C7078BC((unint64_t *)(a1 + 8));
        uint64_t v7 = *(char **)v21;
      }
      int v13 = sub_24C724288(v8, v12, v7, a3);
LABEL_28:
      *(void *)uint64_t v21 = v13;
      if (!v13) {
        goto LABEL_35;
      }
      if (sub_24C70777C((uint64_t)a3, (char **)v21, a3[11].i32[1])) {
        return *(void *)v21;
      }
    }
    uint64_t v7 = (char *)(*(void *)v21 + 2);
LABEL_7:
    *(void *)uint64_t v21 = v7;
    goto LABEL_8;
  }
  return *(void *)v21;
}

char *sub_24C70D4AC(uint64_t a1, char *__dst, unint64_t *a3)
{
  uint64_t v4 = __dst;
  int v6 = *(_DWORD *)(a1 + 16);
  if (v6) {
    uint64_t v4 = sub_24C70589C(a3, 1, (const void **)(*(void *)(a1 + 24) & 0xFFFFFFFFFFFFFFFELL), __dst);
  }
  if ((v6 & 2) != 0) {
    uint64_t v4 = sub_24C70589C(a3, 2, (const void **)(*(void *)(a1 + 32) & 0xFFFFFFFFFFFFFFFELL), v4);
  }
  uint64_t v7 = *(void *)(a1 + 8);
  if ((v7 & 1) == 0) {
    return v4;
  }
  unint64_t v9 = v7 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v9 + 31) < 0)
  {
    uint64_t v10 = *(void **)(v9 + 8);
    uint64_t v11 = *(void *)(v9 + 16);
  }
  else
  {
    uint64_t v10 = (void *)(v9 + 8);
    LODWORD(v11) = *(unsigned __int8 *)(v9 + 31);
  }
  if ((uint64_t)(*a3 - (void)v4) >= (int)v11)
  {
    uint64_t v12 = (int)v11;
    memcpy(v4, v10, (int)v11);
    v4 += v12;
    return v4;
  }
  return sub_24C7160BC((uint64_t *)a3, (char *)v10, v11, (unint64_t)v4);
}

uint64_t sub_24C70D598(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  if ((v1 & 3) == 0)
  {
    uint64_t v2 = 0;
    goto LABEL_12;
  }
  if ((v1 & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((v1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  unint64_t v3 = *(void *)(a1 + 24) & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v4 = *(unsigned __int8 *)(v3 + 23);
  uint64_t v5 = *(void *)(v3 + 8);
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = v4;
  }
  uint64_t v2 = v5 + ((9 * (__clz(v5 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v1 & 2) != 0)
  {
LABEL_9:
    unint64_t v6 = *(void *)(a1 + 32) & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v7 = *(unsigned __int8 *)(v6 + 23);
    uint64_t v8 = *(void *)(v6 + 8);
    if ((v7 & 0x80u) == 0) {
      uint64_t v8 = v7;
    }
    v2 += v8 + ((9 * (__clz(v8 | 1) ^ 0x1F) + 73) >> 6) + 1;
  }
LABEL_12:
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    unint64_t v11 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v11 + 31) < 0) {
      uint64_t v12 = *(void *)(v11 + 16);
    }
    else {
      uint64_t v12 = *(unsigned __int8 *)(v11 + 31);
    }
    v2 += v12;
  }
  *(_DWORD *)(a1 + 20) = v2;
  return v2;
}

unint64_t sub_24C70D670(unint64_t a1, void *lpsrc)
{
  if (!__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26FEDBFE8, (const struct __class_type_info *)&unk_26FEDBDA0, 0))sub_24C7080C0(); {
  return sub_24C70D6F8(a1, (uint64_t)lpsrc);
  }
}

unint64_t sub_24C70D6F8(unint64_t result, uint64_t a2)
{
  unint64_t v3 = result;
  if (a2 == result)
  {
    sub_24C716A34((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2516);
    uint64_t v4 = sub_24C716A4C(v21, "CHECK failed: (&from) != (this): ");
    sub_24C716B88((uint64_t)&v20, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = sub_24C716B90((uint64_t)v21);
  }
  uint64_t v5 = *(void *)(a2 + 8);
  if (v5)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v8 = *(void *)(v3 + 8);
    if (v8) {
      uint64_t v9 = (std::string *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v9 = (std::string *)sub_24C7078BC((unint64_t *)(v3 + 8));
    }
    int v10 = *(char *)(v6 + 31);
    if (v10 >= 0) {
      unint64_t v11 = (const std::string::value_type *)v7;
    }
    else {
      unint64_t v11 = *(const std::string::value_type **)(v6 + 8);
    }
    if (v10 >= 0) {
      std::string::size_type v12 = *(unsigned __int8 *)(v6 + 31);
    }
    else {
      std::string::size_type v12 = *(void *)(v6 + 16);
    }
    uint64_t result = (unint64_t)std::string::append(v9, v11, v12);
  }
  int v13 = *(_DWORD *)(a2 + 16);
  if ((v13 & 3) != 0)
  {
    if (v13)
    {
      uint64_t v14 = (long long *)(*(void *)(a2 + 24) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(v3 + 16) |= 1u;
      uint64_t v15 = *(void *)(v3 + 8);
      uint64_t v16 = (void *)(v15 & 0xFFFFFFFFFFFFFFFELL);
      if (v15) {
        uint64_t v16 = (void *)*v16;
      }
      uint64_t result = sub_24C715858((uint64_t *)(v3 + 24), v14, (uint64_t)v16);
    }
    if ((v13 & 2) != 0)
    {
      uint64_t v17 = (long long *)(*(void *)(a2 + 32) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(v3 + 16) |= 2u;
      uint64_t v18 = *(void *)(v3 + 8);
      uint64_t v19 = (void *)(v18 & 0xFFFFFFFFFFFFFFFELL);
      if (v18) {
        uint64_t v19 = (void *)*v19;
      }
      return sub_24C715858((uint64_t *)(v3 + 32), v17, (uint64_t)v19);
    }
  }
  return result;
}

void sub_24C70D82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C70D844()
{
  return 1;
}

void *sub_24C70D84C@<X0>(void *a1@<X8>)
{
  return sub_24C6698FC(a1, "sentencepiece.SelfTestData.Sample");
}

uint64_t sub_24C70D85C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26FEDC4D8;
  *(void *)(a1 + 8) = a2;
  sub_24C717054(a1 + 16, a2);
  *(void *)(a1 + 40) = a2;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 64) = 0;
  if (atomic_load_explicit(dword_26BADA820, memory_order_acquire)) {
    sub_24C722260(dword_26BADA820);
  }
  return a1;
}

void sub_24C70D8E4(_Unwind_Exception *a1)
{
  sub_24C7114D4(v2);
  sub_24C717134(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24C70D900(uint64_t a1)
{
  unint64_t v3 = (uint64_t *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = (void *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  if (v2)
  {
    if (!*v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2589);
    uint64_t v5 = sub_24C716A4C(v8, "CHECK failed: GetArena() == nullptr: ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
LABEL_4:
  sub_24C70511C(v3);
  sub_24C7114D4((uint64_t *)(a1 + 40));
  sub_24C717134(a1 + 16);
  return a1;
}

void sub_24C70D9A0(void *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  sub_24C669A24(a1);
}

void sub_24C70D9C4(uint64_t a1)
{
  sub_24C70D900(a1);
  JUMPOUT(0x2532F8960);
}

uint64_t sub_24C70D9FC(uint64_t a1)
{
  sub_24C71AEDC((unsigned __int8 *)(a1 + 16));
  uint64_t result = sub_24C71114C(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v4 + 31) < 0)
    {
      **(unsigned char **)(v4 + 8) = 0;
      *(void *)(v4 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v4 + 8) = 0;
      *(unsigned char *)(v4 + 31) = 0;
    }
  }
  return result;
}

char *sub_24C70DA58(uint64_t a1, char *a2, int32x2_t *a3)
{
  char v23 = a2;
  if ((sub_24C70777C((uint64_t)a3, &v23, a3[11].i32[1]) & 1) == 0)
  {
    uint64_t v5 = (void *)(a1 + 8);
    while (1)
    {
      unint64_t v6 = v23 + 1;
      unsigned int v7 = *v23;
      if ((*v23 & 0x80000000) == 0) {
        goto LABEL_6;
      }
      unsigned int v8 = v7 + (*v6 << 7);
      unsigned int v7 = v8 - 128;
      if ((*v6 & 0x80000000) == 0) {
        break;
      }
      char v20 = (char *)sub_24C723D18((uint64_t)v23, v8 - 128);
      char v23 = v20;
      if (!v20) {
        return 0;
      }
      unint64_t v6 = v20;
      unsigned int v7 = v21;
LABEL_7:
      if (v7 == 10)
      {
        unint64_t v11 = v6 - 1;
        while (1)
        {
          std::string::size_type v12 = (unsigned __int8 *)(v11 + 1);
          char v23 = v11 + 1;
          int v13 = *(int **)(a1 + 56);
          if (!v13) {
            break;
          }
          uint64_t v14 = *(int *)(a1 + 48);
          int v15 = *v13;
          if ((int)v14 >= *v13)
          {
            if (v15 == *(_DWORD *)(a1 + 52))
            {
LABEL_20:
              sub_24C729108(a1 + 40, v15 + 1);
              int v13 = *(int **)(a1 + 56);
              int v15 = *v13;
            }
            *int v13 = v15 + 1;
            uint64_t v16 = sub_24C71028C(*(void *)(a1 + 40));
            uint64_t v17 = *(void *)(a1 + 56);
            uint64_t v18 = *(int *)(a1 + 48);
            *(_DWORD *)(a1 + 48) = v18 + 1;
            *(void *)(v17 + 8 * v18 + 8) = v16;
            std::string::size_type v12 = (unsigned __int8 *)v23;
            goto LABEL_22;
          }
          *(_DWORD *)(a1 + 48) = v14 + 1;
          uint64_t v16 = *(void **)&v13[2 * v14 + 2];
LABEL_22:
          unint64_t v11 = (char *)sub_24C70DC70(a3, (uint64_t)v16, v12);
          char v23 = v11;
          if (!v11) {
            return 0;
          }
          if (*(void *)a3 <= (unint64_t)v11 || *v11 != 10) {
            goto LABEL_30;
          }
        }
        int v15 = *(_DWORD *)(a1 + 52);
        goto LABEL_20;
      }
      if (v7) {
        BOOL v9 = (v7 & 7) == 4;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9)
      {
        a3[10].i32[0] = v7 - 1;
        return v23;
      }
      if (v7 < 0x640)
      {
        if (*v5)
        {
          uint64_t v19 = (std::string *)((*v5 & 0xFFFFFFFFFFFFFFFELL) + 8);
        }
        else
        {
          uint64_t v19 = (std::string *)sub_24C7078BC((unint64_t *)(a1 + 8));
          unint64_t v6 = v23;
        }
        int v10 = sub_24C724288(v7, v19, v6, a3);
      }
      else
      {
        int v10 = sub_24C71C7AC((uint64_t *)(a1 + 16), v7, (unsigned __int8 *)v6, (uint64_t)&unk_2697ED608, (unint64_t *)(a1 + 8), a3);
      }
      char v23 = (char *)v10;
      if (!v10) {
        return 0;
      }
LABEL_30:
      if (sub_24C70777C((uint64_t)a3, &v23, a3[11].i32[1])) {
        return v23;
      }
    }
    unint64_t v6 = v23 + 2;
LABEL_6:
    char v23 = v6;
    goto LABEL_7;
  }
  return v23;
}

uint64_t sub_24C70DC70(int32x2_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  int v6 = (char)*a3;
  unsigned int v7 = *a3;
  if (v6 < 0)
  {
    uint64_t result = sub_24C723D5C((uint64_t)a3, v7);
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    unsigned int v7 = v10;
  }
  else
  {
    uint64_t v8 = (uint64_t)(a3 + 1);
  }
  int v11 = sub_24C707BE8((uint64_t)a1, v8, v7);
  int v12 = a1[11].i32[0];
  BOOL v13 = __OFSUB__(v12--, 1);
  a1[11].i32[0] = v12;
  if (v12 < 0 != v13) {
    return 0;
  }
  int v14 = v11;
  uint64_t result = sub_24C70D300(a2, v8, a1);
  if (!result) {
    return result;
  }
  ++a1[11].i32[0];
  if (a1[10].i32[0]) {
    return 0;
  }
  int v15 = a1[3].i32[1] + v14;
  a1[3].i32[1] = v15;
  *a1 = (int32x2_t)(*(void *)&a1[1] + (v15 & (v15 >> 31)));
  return result;
}

char *sub_24C70DD38(uint64_t a1, char *a2, unint64_t *a3)
{
  int v6 = *(_DWORD *)(a1 + 48);
  if (v6)
  {
    for (int i = 0; i != v6; ++i)
    {
      if (*a3 <= (unint64_t)a2) {
        a2 = sub_24C715FA8((uint64_t)a3, a2);
      }
      uint64_t v8 = sub_24C710EC8(a1 + 40, i);
      *a2 = 10;
      unsigned int v9 = *(_DWORD *)(v8 + 20);
      if (v9 > 0x7F)
      {
        a2[1] = v9 | 0x80;
        unsigned int v11 = v9 >> 7;
        if (v9 >> 14)
        {
          unsigned int v10 = a2 + 3;
          do
          {
            *(v10 - 1) = v11 | 0x80;
            unsigned int v12 = v11 >> 7;
            ++v10;
            unsigned int v13 = v11 >> 14;
            v11 >>= 7;
          }
          while (v13);
          *(v10 - 1) = v12;
        }
        else
        {
          a2[2] = v11;
          unsigned int v10 = a2 + 3;
        }
      }
      else
      {
        a2[1] = v9;
        unsigned int v10 = a2 + 2;
      }
      a2 = sub_24C70D4AC(v8, v10, a3);
    }
  }
  int v14 = sub_24C71D5A4(a1 + 16, 200, 0x20000000, a2, (uint64_t *)a3);
  int v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if ((v16 & 1) == 0) {
    return v15;
  }
  unint64_t v18 = v16 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v18 + 31) < 0)
  {
    uint64_t v19 = *(void **)(v18 + 8);
    uint64_t v20 = *(void *)(v18 + 16);
  }
  else
  {
    uint64_t v19 = (void *)(v18 + 8);
    LODWORD(v20) = *(unsigned __int8 *)(v18 + 31);
  }
  if ((uint64_t)(*a3 - (void)v14) >= (int)v20)
  {
    uint64_t v21 = (int)v20;
    memcpy(v14, v19, (int)v20);
    v15 += v21;
    return v15;
  }
  return sub_24C7160BC((uint64_t *)a3, (char *)v19, v20, (unint64_t)v14);
}

uint64_t sub_24C70DED0(uint64_t a1)
{
  uint64_t v2 = sub_24C7202D8(a1 + 16);
  uint64_t v3 = *(int *)(a1 + 48);
  uint64_t v4 = v2 + v3;
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    int v6 = (uint64_t *)(v5 + 8);
  }
  else {
    int v6 = 0;
  }
  if (v3)
  {
    uint64_t v7 = 8 * v3;
    do
    {
      uint64_t v8 = *v6++;
      uint64_t v9 = sub_24C70D598(v8);
      v4 += v9 + ((9 * (__clz(v9 | 1) ^ 0x1F) + 73) >> 6);
      v7 -= 8;
    }
    while (v7);
  }
  uint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v12 + 31) < 0) {
      uint64_t v13 = *(void *)(v12 + 16);
    }
    else {
      uint64_t v13 = *(unsigned __int8 *)(v12 + 31);
    }
    v4 += v13;
  }
  *(_DWORD *)(a1 + 64) = v4;
  return v4;
}

unint64_t sub_24C70DF80(uint64_t a1, void *lpsrc)
{
  if (!__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26FEDBFE8, (const struct __class_type_info *)&unk_26FEDBD08, 0))sub_24C7080C0(); {
  return sub_24C70E008(a1, (uint64_t)lpsrc);
  }
}

unint64_t sub_24C70E008(uint64_t a1, uint64_t a2)
{
  if (a2 == a1)
  {
    sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2724);
    uint64_t v4 = sub_24C716A4C(v15, "CHECK failed: (&from) != (this): ");
    sub_24C716B88((uint64_t)&v14, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v15);
  }
  sub_24C71AF7C(a1 + 16, a2 + 16);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v5)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v8 = *(void *)(a1 + 8);
    if (v8) {
      uint64_t v9 = (std::string *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v9 = (std::string *)sub_24C7078BC((unint64_t *)(a1 + 8));
    }
    int v10 = *(char *)(v6 + 31);
    if (v10 >= 0) {
      unsigned int v11 = (const std::string::value_type *)v7;
    }
    else {
      unsigned int v11 = *(const std::string::value_type **)(v6 + 8);
    }
    if (v10 >= 0) {
      std::string::size_type v12 = *(unsigned __int8 *)(v6 + 31);
    }
    else {
      std::string::size_type v12 = *(void *)(v6 + 16);
    }
    std::string::append(v9, v11, v12);
  }
  return sub_24C711590(a1 + 40, a2 + 40);
}

void sub_24C70E0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C70E0F8(uint64_t a1)
{
  return sub_24C71C40C(a1 + 16);
}

void *sub_24C70E100@<X0>(void *a1@<X8>)
{
  return sub_24C6698FC(a1, "sentencepiece.SelfTestData");
}

void *sub_24C70E110(void *a1, uint64_t a2)
{
  *a1 = &unk_26FEDCBE0;
  a1[1] = a2;
  sub_24C717054((uint64_t)(a1 + 2), a2);
  a1[5] = 0;
  if (atomic_load_explicit(dword_26BADA7A0, memory_order_acquire)) {
    sub_24C722260(dword_26BADA7A0);
  }
  a1[6] = &qword_2697ED438;
  a1[7] = 0x100000000;
  return a1;
}

void sub_24C70E190(_Unwind_Exception *a1)
{
  sub_24C717134(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24C70E1A4(uint64_t a1)
{
  return a1;
}

uint64_t sub_24C70E1E0(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 8);
  uint64_t v3 = (void *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  if ((v2 & 1) == 0)
  {
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (*v3)
  {
LABEL_3:
    sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2813);
    uint64_t v4 = sub_24C716A4C(v10, "CHECK failed: GetArena() == nullptr: ");
    sub_24C716B88((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = sub_24C716B90((uint64_t)v10);
  }
LABEL_4:
  unint64_t v6 = *(uint64_t **)(v1 + 48);
  uint64_t v5 = (uint64_t *)(v1 + 48);
  if (v6 != &qword_2697ED438)
  {
    uint64_t v7 = sub_24C7076A8(v5);
    uint64_t v8 = v7;
    if (*(char *)(v7 + 23) < 0) {
      operator delete(*(void **)v7);
    }
    return MEMORY[0x2532F8960](v8, 0x1012C40EC159624);
  }
  return result;
}

void sub_24C70E2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C70E2C4(uint64_t a1)
{
  sub_24C70E1A4(a1);
  JUMPOUT(0x2532F8960);
}

unsigned __int8 *sub_24C70E2FC(uint64_t a1)
{
  uint64_t result = sub_24C71AEDC((unsigned __int8 *)(a1 + 16));
  int v3 = *(_DWORD *)(a1 + 40);
  if (v3)
  {
    unint64_t v4 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v4 + 23) < 0)
    {
      **(unsigned char **)unint64_t v4 = 0;
      *(void *)(v4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)unint64_t v4 = 0;
      *(unsigned char *)(v4 + 23) = 0;
    }
  }
  if ((v3 & 6) != 0) {
    *(void *)(a1 + 56) = 0x100000000;
  }
  *(_DWORD *)(a1 + 40) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  if (v5)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v6 + 31) < 0)
    {
      **(unsigned char **)(v6 + 8) = 0;
      *(void *)(v6 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v6 + 8) = 0;
      *(unsigned char *)(v6 + 31) = 0;
    }
  }
  return result;
}

uint64_t sub_24C70E394(uint64_t a1, uint64_t a2, int32x2_t *a3)
{
  *(void *)uint64_t v27 = a2;
  int v5 = 0;
  if ((sub_24C70777C((uint64_t)a3, (char **)v27, a3[11].i32[1]) & 1) == 0)
  {
    uint64_t v7 = (void *)(a1 + 8);
    while (1)
    {
      uint64_t v8 = (char *)(*(void *)v27 + 1);
      unsigned int v9 = **(unsigned char **)v27;
      if (((char)**(unsigned char **)v27 & 0x80000000) == 0) {
        goto LABEL_7;
      }
      unsigned int v10 = v9 + (*v8 << 7);
      unsigned int v9 = v10 - 128;
      if ((*v8 & 0x80000000) == 0) {
        break;
      }
      uint64_t v22 = sub_24C723D18(*(uint64_t *)v27, v10 - 128);
      *(void *)uint64_t v27 = v22;
      if (!v22) {
        goto LABEL_48;
      }
      uint64_t v8 = (char *)v22;
      unsigned int v9 = v23;
LABEL_8:
      unsigned int v11 = v9 >> 3;
      if (v9 >> 3 == 3)
      {
        if (v9 == 24)
        {
          int v15 = v8 + 1;
          unint64_t v16 = *v8;
          if ((*v8 & 0x80000000) == 0) {
            goto LABEL_24;
          }
          int v17 = *v15;
          int v18 = v16 + (v17 << 7);
          unint64_t v16 = (v18 - 128);
          if (v17 < 0)
          {
            *(void *)uint64_t v27 = sub_24C723CD0((uint64_t)v8, (v18 - 128));
            if (!*(void *)v27)
            {
LABEL_48:
              *(void *)uint64_t v27 = 0;
              goto LABEL_2;
            }
            unint64_t v16 = v25;
          }
          else
          {
            int v15 = v8 + 2;
LABEL_24:
            *(void *)uint64_t v27 = v15;
          }
          if ((v16 - 1) > 5)
          {
            if (*v7) {
              v26 = (std::string *)((*v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
            }
            else {
              v26 = (std::string *)sub_24C7078BC((unint64_t *)(a1 + 8));
            }
            sub_24C723BBC(3, v16, v26);
          }
          else
          {
            *(_DWORD *)(a1 + 40) |= 4u;
            *(_DWORD *)(a1 + 60) = v16;
          }
          goto LABEL_38;
        }
      }
      else if (v11 == 2)
      {
        if (v9 == 21)
        {
          v5 |= 2u;
          *(_DWORD *)(a1 + 56) = *(_DWORD *)v8;
          *(void *)uint64_t v27 = v8 + 4;
          goto LABEL_38;
        }
      }
      else if (v11 == 1 && v9 == 10)
      {
        *(_DWORD *)(a1 + 40) |= 1u;
        uint64_t v19 = *(void *)(a1 + 8);
        uint64_t v20 = (void *)(v19 & 0xFFFFFFFFFFFFFFFELL);
        if (v19) {
          uint64_t v20 = (void *)*v20;
        }
        uint64_t v21 = (std::string *)sub_24C715890((uint64_t *)(a1 + 48), (uint64_t)v20);
        char v14 = (void *)sub_24C723DCC(v21, *(char **)v27, (uint64_t)a3);
        goto LABEL_37;
      }
      if (v9) {
        BOOL v13 = (v9 & 7) == 4;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {
        a3[10].i32[0] = v9 - 1;
        goto LABEL_2;
      }
      if (v9 < 0x640)
      {
        if (*v7)
        {
          uint64_t v24 = (std::string *)((*v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
        }
        else
        {
          uint64_t v24 = (std::string *)sub_24C7078BC((unint64_t *)(a1 + 8));
          uint64_t v8 = *(char **)v27;
        }
        char v14 = sub_24C724288(v9, v24, v8, a3);
      }
      else
      {
        char v14 = sub_24C71C7AC((uint64_t *)(a1 + 16), v9, (unsigned __int8 *)v8, (uint64_t)qword_2697ED6D0, (unint64_t *)(a1 + 8), a3);
      }
LABEL_37:
      *(void *)uint64_t v27 = v14;
      if (!v14) {
        goto LABEL_48;
      }
LABEL_38:
      if (sub_24C70777C((uint64_t)a3, (char **)v27, a3[11].i32[1])) {
        goto LABEL_2;
      }
    }
    uint64_t v8 = (char *)(*(void *)v27 + 2);
LABEL_7:
    *(void *)uint64_t v27 = v8;
    goto LABEL_8;
  }
LABEL_2:
  *(_DWORD *)(a1 + 40) |= v5;
  return *(void *)v27;
}

char *sub_24C70E61C(uint64_t a1, char *a2, unint64_t *a3)
{
  unint64_t v4 = a2;
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6)
  {
    unint64_t v4 = sub_24C70589C(a3, 1, (const void **)(*(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL), a2);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_18;
      }
      goto LABEL_9;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  if (*a3 <= (unint64_t)v4) {
    unint64_t v4 = sub_24C715FA8((uint64_t)a3, v4);
  }
  int v7 = *(_DWORD *)(a1 + 56);
  char *v4 = 21;
  *(_DWORD *)(v4 + 1) = v7;
  v4 += 5;
  if ((v6 & 4) != 0)
  {
LABEL_9:
    if (*a3 <= (unint64_t)v4) {
      unint64_t v4 = sub_24C715FA8((uint64_t)a3, v4);
    }
    unint64_t v8 = *(int *)(a1 + 60);
    char *v4 = 24;
    if (v8 > 0x7F)
    {
      v4[1] = v8 | 0x80;
      unint64_t v9 = v8 >> 7;
      if (v8 >> 14)
      {
        v4 += 3;
        do
        {
          *(v4 - 1) = v9 | 0x80;
          unint64_t v10 = v9 >> 7;
          ++v4;
          unint64_t v11 = v9 >> 14;
          v9 >>= 7;
        }
        while (v11);
        *(v4 - 1) = v10;
      }
      else
      {
        v4[2] = v9;
        v4 += 3;
      }
    }
    else
    {
      v4[1] = v8;
      v4 += 2;
    }
  }
LABEL_18:
  std::string::size_type v12 = sub_24C71D5A4(a1 + 16, 200, 0x20000000, v4, (uint64_t *)a3);
  BOOL v13 = v12;
  uint64_t v14 = *(void *)(a1 + 8);
  if ((v14 & 1) == 0) {
    return v13;
  }
  unint64_t v16 = v14 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v16 + 31) < 0)
  {
    int v17 = *(void **)(v16 + 8);
    uint64_t v18 = *(void *)(v16 + 16);
  }
  else
  {
    int v17 = (void *)(v16 + 8);
    LODWORD(v18) = *(unsigned __int8 *)(v16 + 31);
  }
  if ((uint64_t)(*a3 - (void)v12) >= (int)v18)
  {
    uint64_t v19 = (int)v18;
    memcpy(v12, v17, (int)v18);
    v13 += v19;
    return v13;
  }
  return sub_24C7160BC((uint64_t *)a3, (char *)v17, v18, (unint64_t)v12);
}

uint64_t sub_24C70E7C8(uint64_t a1)
{
  uint64_t result = sub_24C7202D8(a1 + 16);
  int v3 = *(_DWORD *)(a1 + 40);
  if ((v3 & 7) != 0)
  {
    if (v3)
    {
      unint64_t v4 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v5 = *(unsigned __int8 *)(v4 + 23);
      uint64_t v6 = *(void *)(v4 + 8);
      if ((v5 & 0x80u) == 0) {
        uint64_t v6 = v5;
      }
      result += v6 + ((9 * (__clz(v6 | 1) ^ 0x1F) + 73) >> 6) + 1;
    }
    if ((v3 & 2) != 0) {
      result += 5;
    }
    if ((v3 & 4) != 0)
    {
      int v7 = *(_DWORD *)(a1 + 60);
      if (v7 < 0) {
        uint64_t v8 = 11;
      }
      else {
        uint64_t v8 = ((9 * (__clz(v7 | 1) ^ 0x1F) + 73) >> 6) + 1;
      }
      result += v8;
    }
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v10 + 31) < 0) {
      uint64_t v11 = *(void *)(v10 + 16);
    }
    else {
      uint64_t v11 = *(unsigned __int8 *)(v10 + 31);
    }
    result += v11;
  }
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

void sub_24C70E8AC(uint64_t a1, void *lpsrc)
{
  if (!__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26FEDBFE8, (const struct __class_type_info *)&unk_26FEDBDF8, 0))sub_24C7080C0(); {
  sub_24C70E934(a1, (uint64_t)lpsrc);
  }
}

void sub_24C70E934(uint64_t a1, uint64_t a2)
{
  if (a2 == a1)
  {
    sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3001);
    unint64_t v4 = sub_24C716A4C(v18, "CHECK failed: (&from) != (this): ");
    sub_24C716B88((uint64_t)&v17, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v18);
  }
  sub_24C71AF7C(a1 + 16, a2 + 16);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v5)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v8 = *(void *)(a1 + 8);
    if (v8) {
      uint64_t v9 = (std::string *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v9 = (std::string *)sub_24C7078BC((unint64_t *)(a1 + 8));
    }
    int v10 = *(char *)(v6 + 31);
    if (v10 >= 0) {
      uint64_t v11 = (const std::string::value_type *)v7;
    }
    else {
      uint64_t v11 = *(const std::string::value_type **)(v6 + 8);
    }
    if (v10 >= 0) {
      std::string::size_type v12 = *(unsigned __int8 *)(v6 + 31);
    }
    else {
      std::string::size_type v12 = *(void *)(v6 + 16);
    }
    std::string::append(v9, v11, v12);
  }
  int v13 = *(_DWORD *)(a2 + 40);
  if ((v13 & 7) != 0)
  {
    if (v13)
    {
      uint64_t v14 = (long long *)(*(void *)(a2 + 48) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(a1 + 40) |= 1u;
      uint64_t v15 = *(void *)(a1 + 8);
      unint64_t v16 = (void *)(v15 & 0xFFFFFFFFFFFFFFFELL);
      if (v15) {
        unint64_t v16 = (void *)*v16;
      }
      sub_24C715858((uint64_t *)(a1 + 48), v14, (uint64_t)v16);
      if ((v13 & 2) == 0)
      {
LABEL_16:
        if ((v13 & 4) == 0)
        {
LABEL_18:
          *(_DWORD *)(a1 + 40) |= v13;
          return;
        }
LABEL_17:
        *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
        goto LABEL_18;
      }
    }
    else if ((v13 & 2) == 0)
    {
      goto LABEL_16;
    }
    *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
    if ((v13 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
}

void sub_24C70EA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C70EA88(uint64_t a1)
{
  return sub_24C71C40C(a1 + 16);
}

void *sub_24C70EA90@<X0>(void *a1@<X8>)
{
  return sub_24C6698FC(a1, "sentencepiece.ModelProto.SentencePiece");
}

uint64_t sub_24C70EAA0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26FEDC208;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = &unk_26FEDC320;
  sub_24C717054(a1 + 24, a2);
  *(void *)(a1 + 56) = a2;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  if (atomic_load_explicit(dword_26BADA7B8, memory_order_acquire)) {
    sub_24C722260(dword_26BADA7B8);
  }
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  return a1;
}

void sub_24C70EB50(_Unwind_Exception *a1)
{
  sub_24C711740(v2);
  sub_24C717134(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24C70EB70(uint64_t a1)
{
  return a1;
}

uint64_t sub_24C70EBB4(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 8);
  int v3 = (void *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  if ((v2 & 1) == 0)
  {
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (*v3)
  {
LABEL_3:
    sub_24C716A34((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3145);
    unint64_t v4 = sub_24C716A4C(v13, "CHECK failed: GetArena() == nullptr: ");
    sub_24C716B88((uint64_t)&v12, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = sub_24C716B90((uint64_t)v13);
  }
LABEL_4:
  if ((_UNKNOWN *)v1 != &unk_2697ED450)
  {
    uint64_t v5 = *(uint64_t **)(v1 + 80);
    if (v5)
    {
      unint64_t v6 = sub_24C70850C(v5);
      MEMORY[0x2532F8960](v6, 0x10A1C4074230EEALL);
    }
    uint64_t v7 = *(void *)(v1 + 88);
    if (v7)
    {
      uint64_t v8 = sub_24C70C304(v7);
      MEMORY[0x2532F8960](v8, 0x10A1C402CDD3876);
    }
    uint64_t v9 = *(void *)(v1 + 96);
    if (v9)
    {
      uint64_t v10 = sub_24C70D900(v9);
      MEMORY[0x2532F8960](v10, 0x10A1C4075D007F8);
    }
    uint64_t result = *(void *)(v1 + 104);
    if (result)
    {
      uint64_t v11 = sub_24C70C304(result);
      return MEMORY[0x2532F8960](v11, 0x10A1C402CDD3876);
    }
  }
  return result;
}

void sub_24C70ECC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C70ECE0(uint64_t a1)
{
  return sub_24C70EB70(a1 - 16);
}

void sub_24C70ECE8(uint64_t a1)
{
  sub_24C70EB70(a1);
  JUMPOUT(0x2532F8960);
}

void sub_24C70ED20(uint64_t a1)
{
  sub_24C70EB70(a1 - 16);
  JUMPOUT(0x2532F8960);
}

uint64_t sub_24C70ED5C(uint64_t a1)
{
  sub_24C71AEDC((unsigned __int8 *)(a1 + 24));
  uint64_t result = (uint64_t)sub_24C7111FC((unsigned __int8 *)(a1 + 56));
  int v3 = *(_DWORD *)(a1 + 48);
  if ((v3 & 0xF) != 0)
  {
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 80);
      if (!v4)
      {
        sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3178);
        uint64_t v5 = sub_24C716A4C(v15, "CHECK failed: trainer_spec_ != nullptr: ");
        sub_24C716B88((uint64_t)&v14, (const char **)&v5->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)v15);
        uint64_t v4 = *(void *)(a1 + 80);
      }
      uint64_t result = sub_24C708878(v4);
    }
    if ((v3 & 2) != 0)
    {
      uint64_t v6 = *(void *)(a1 + 88);
      if (!v6)
      {
        sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3182);
        uint64_t v7 = sub_24C716A4C(v15, "CHECK failed: normalizer_spec_ != nullptr: ");
        sub_24C716B88((uint64_t)&v14, (const char **)&v7->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)v15);
        uint64_t v6 = *(void *)(a1 + 88);
      }
      uint64_t result = (uint64_t)sub_24C70C528(v6);
    }
    if ((v3 & 4) != 0)
    {
      uint64_t v8 = *(void *)(a1 + 96);
      if (!v8)
      {
        sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3186);
        uint64_t v9 = sub_24C716A4C(v15, "CHECK failed: self_test_data_ != nullptr: ");
        sub_24C716B88((uint64_t)&v14, (const char **)&v9->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)v15);
        uint64_t v8 = *(void *)(a1 + 96);
      }
      uint64_t result = sub_24C70D9FC(v8);
    }
    if ((v3 & 8) != 0)
    {
      uint64_t v10 = *(void *)(a1 + 104);
      if (!v10)
      {
        sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3190);
        uint64_t v11 = sub_24C716A4C(v15, "CHECK failed: denormalizer_spec_ != nullptr: ");
        sub_24C716B88((uint64_t)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)v15);
        uint64_t v10 = *(void *)(a1 + 104);
      }
      uint64_t result = (uint64_t)sub_24C70C528(v10);
    }
  }
  *(_DWORD *)(a1 + 48) = 0;
  uint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v13 + 31) < 0)
    {
      **(unsigned char **)(v13 + 8) = 0;
      *(void *)(v13 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v13 + 8) = 0;
      *(unsigned char *)(v13 + 31) = 0;
    }
  }
  return result;
}

void sub_24C70EF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_24C70EF40(uint64_t a1, char *a2, int32x2_t *a3)
{
  v30 = a2;
  if ((sub_24C70777C((uint64_t)a3, &v30, a3[11].i32[1]) & 1) == 0)
  {
    uint64_t v6 = (void *)(a1 + 8);
    while (2)
    {
      uint64_t v7 = v30 + 1;
      unsigned int v8 = *v30;
      if (*v30 < 0)
      {
        unsigned int v9 = v8 + (*v7 << 7);
        unsigned int v8 = v9 - 128;
        if (*v7 < 0)
        {
          uint64_t v27 = (char *)sub_24C723D18((uint64_t)v30, v9 - 128);
          v30 = v27;
          if (!v27) {
            return 0;
          }
          uint64_t v7 = v27;
          unsigned int v8 = v28;
LABEL_8:
          switch(v8 >> 3)
          {
            case 1u:
              if (v8 != 10) {
                goto LABEL_49;
              }
              uint64_t v10 = v7 - 1;
              break;
            case 2u:
              if (v8 != 18) {
                goto LABEL_49;
              }
              *(_DWORD *)(a1 + 48) |= 1u;
              uint64_t v18 = *(void *)(a1 + 80);
              if (!v18)
              {
                uint64_t v19 = (void *)(*v6 & 0xFFFFFFFFFFFFFFFELL);
                if (*v6) {
                  uint64_t v19 = (void *)*v19;
                }
                uint64_t v18 = sub_24C7100EC((uint64_t)v19);
                *(void *)(a1 + 80) = v18;
                uint64_t v7 = v30;
              }
              uint64_t v20 = (char *)sub_24C70F3A0(a3, v18, (unsigned __int8 *)v7);
              goto LABEL_46;
            case 3u:
              if (v8 != 26) {
                goto LABEL_49;
              }
              *(_DWORD *)(a1 + 48) |= 2u;
              uint64_t v21 = *(void *)(a1 + 88);
              if (v21) {
                goto LABEL_45;
              }
              uint64_t v22 = (void *)(*v6 & 0xFFFFFFFFFFFFFFFELL);
              if (*v6) {
                uint64_t v22 = (void *)*v22;
              }
              uint64_t v21 = sub_24C7101BC((uint64_t)v22);
              *(void *)(a1 + 88) = v21;
              goto LABEL_44;
            case 4u:
              if (v8 != 34) {
                goto LABEL_49;
              }
              *(_DWORD *)(a1 + 48) |= 4u;
              uint64_t v23 = *(void *)(a1 + 96);
              if (!v23)
              {
                uint64_t v24 = (void *)(*v6 & 0xFFFFFFFFFFFFFFFELL);
                if (*v6) {
                  uint64_t v24 = (void *)*v24;
                }
                uint64_t v23 = sub_24C71035C((uint64_t)v24);
                *(void *)(a1 + 96) = v23;
                uint64_t v7 = v30;
              }
              uint64_t v20 = (char *)sub_24C70F530(a3, v23, v7);
              goto LABEL_46;
            case 5u:
              if (v8 != 42) {
                goto LABEL_49;
              }
              *(_DWORD *)(a1 + 48) |= 8u;
              uint64_t v21 = *(void *)(a1 + 104);
              if (v21) {
                goto LABEL_45;
              }
              unint64_t v25 = (void *)(*v6 & 0xFFFFFFFFFFFFFFFELL);
              if (*v6) {
                unint64_t v25 = (void *)*v25;
              }
              uint64_t v21 = sub_24C7101BC((uint64_t)v25);
              *(void *)(a1 + 104) = v21;
LABEL_44:
              uint64_t v7 = v30;
LABEL_45:
              uint64_t v20 = (char *)sub_24C70F468(a3, v21, (unsigned __int8 *)v7);
              goto LABEL_46;
            default:
LABEL_49:
              if (v8) {
                BOOL v26 = (v8 & 7) == 4;
              }
              else {
                BOOL v26 = 1;
              }
              if (v26)
              {
                a3[10].i32[0] = v8 - 1;
                return v30;
              }
              if (v8 < 0x640)
              {
                if (*v6)
                {
                  uint64_t v29 = (std::string *)((*v6 & 0xFFFFFFFFFFFFFFFELL) + 8);
                }
                else
                {
                  uint64_t v29 = (std::string *)sub_24C7078BC((unint64_t *)(a1 + 8));
                  uint64_t v7 = v30;
                }
                uint64_t v20 = (char *)sub_24C724288(v8, v29, v7, a3);
              }
              else
              {
                uint64_t v20 = (char *)sub_24C71C7AC((uint64_t *)(a1 + 24), v8, (unsigned __int8 *)v7, (uint64_t)&unk_2697ED450, (unint64_t *)(a1 + 8), a3);
              }
LABEL_46:
              v30 = v20;
              if (!v20) {
                return 0;
              }
LABEL_47:
              if (sub_24C70777C((uint64_t)a3, &v30, a3[11].i32[1])) {
                return v30;
              }
              continue;
          }
          while (1)
          {
            uint64_t v11 = (unsigned __int8 *)(v10 + 1);
            v30 = v10 + 1;
            uint64_t v12 = *(int **)(a1 + 72);
            if (!v12) {
              break;
            }
            uint64_t v13 = *(int *)(a1 + 64);
            int v14 = *v12;
            if ((int)v13 >= *v12)
            {
              if (v14 == *(_DWORD *)(a1 + 68))
              {
LABEL_16:
                sub_24C729108(a1 + 56, v14 + 1);
                uint64_t v12 = *(int **)(a1 + 72);
                int v14 = *v12;
              }
              *uint64_t v12 = v14 + 1;
              uint64_t v15 = sub_24C71042C(*(void *)(a1 + 56));
              uint64_t v16 = *(void *)(a1 + 72);
              uint64_t v17 = *(int *)(a1 + 64);
              *(_DWORD *)(a1 + 64) = v17 + 1;
              *(void *)(v16 + 8 * v17 + 8) = v15;
              uint64_t v11 = (unsigned __int8 *)v30;
              goto LABEL_18;
            }
            *(_DWORD *)(a1 + 64) = v13 + 1;
            uint64_t v15 = *(void **)&v12[2 * v13 + 2];
LABEL_18:
            uint64_t v10 = (char *)sub_24C70F2D8(a3, (uint64_t)v15, v11);
            v30 = v10;
            if (!v10) {
              return 0;
            }
            if (*(void *)a3 <= (unint64_t)v10 || *v10 != 10) {
              goto LABEL_47;
            }
          }
          int v14 = *(_DWORD *)(a1 + 68);
          goto LABEL_16;
        }
        uint64_t v7 = v30 + 2;
      }
      break;
    }
    v30 = v7;
    goto LABEL_8;
  }
  return v30;
}

uint64_t sub_24C70F2D8(int32x2_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  int v6 = (char)*a3;
  unsigned int v7 = *a3;
  if (v6 < 0)
  {
    uint64_t result = sub_24C723D5C((uint64_t)a3, v7);
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    unsigned int v7 = v10;
  }
  else
  {
    uint64_t v8 = (uint64_t)(a3 + 1);
  }
  int v11 = sub_24C707BE8((uint64_t)a1, v8, v7);
  int v12 = a1[11].i32[0];
  BOOL v13 = __OFSUB__(v12--, 1);
  a1[11].i32[0] = v12;
  if (v12 < 0 != v13) {
    return 0;
  }
  int v14 = v11;
  uint64_t result = sub_24C70E394(a2, v8, a1);
  if (!result) {
    return result;
  }
  ++a1[11].i32[0];
  if (a1[10].i32[0]) {
    return 0;
  }
  int v15 = a1[3].i32[1] + v14;
  a1[3].i32[1] = v15;
  *a1 = (int32x2_t)(*(void *)&a1[1] + (v15 & (v15 >> 31)));
  return result;
}

uint64_t sub_24C70F3A0(int32x2_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  int v6 = (char)*a3;
  unsigned int v7 = *a3;
  if (v6 < 0)
  {
    uint64_t result = sub_24C723D5C((uint64_t)a3, v7);
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    unsigned int v7 = v10;
  }
  else
  {
    uint64_t v8 = (uint64_t)(a3 + 1);
  }
  int v11 = sub_24C707BE8((uint64_t)a1, v8, v7);
  int v12 = a1[11].i32[0];
  BOOL v13 = __OFSUB__(v12--, 1);
  a1[11].i32[0] = v12;
  if (v12 < 0 != v13) {
    return 0;
  }
  int v14 = v11;
  uint64_t result = (uint64_t)sub_24C708B40(a2, v8, a1);
  if (!result) {
    return result;
  }
  ++a1[11].i32[0];
  if (a1[10].i32[0]) {
    return 0;
  }
  int v15 = a1[3].i32[1] + v14;
  a1[3].i32[1] = v15;
  *a1 = (int32x2_t)(*(void *)&a1[1] + (v15 & (v15 >> 31)));
  return result;
}

uint64_t sub_24C70F468(int32x2_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  int v6 = (char)*a3;
  unsigned int v7 = *a3;
  if (v6 < 0)
  {
    uint64_t result = sub_24C723D5C((uint64_t)a3, v7);
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    unsigned int v7 = v10;
  }
  else
  {
    uint64_t v8 = (uint64_t)(a3 + 1);
  }
  int v11 = sub_24C707BE8((uint64_t)a1, v8, v7);
  int v12 = a1[11].i32[0];
  BOOL v13 = __OFSUB__(v12--, 1);
  a1[11].i32[0] = v12;
  if (v12 < 0 != v13) {
    return 0;
  }
  int v14 = v11;
  uint64_t result = sub_24C70C638(a2, v8, a1);
  if (!result) {
    return result;
  }
  ++a1[11].i32[0];
  if (a1[10].i32[0]) {
    return 0;
  }
  int v15 = a1[3].i32[1] + v14;
  a1[3].i32[1] = v15;
  *a1 = (int32x2_t)(*(void *)&a1[1] + (v15 & (v15 >> 31)));
  return result;
}

uint64_t sub_24C70F530(int32x2_t *a1, uint64_t a2, char *a3)
{
  int v6 = *a3;
  unsigned int v7 = *a3;
  if (v6 < 0)
  {
    uint64_t result = sub_24C723D5C((uint64_t)a3, v7);
    if (!result) {
      return result;
    }
    uint64_t v8 = (char *)result;
    unsigned int v7 = v10;
  }
  else
  {
    uint64_t v8 = a3 + 1;
  }
  int v11 = sub_24C707BE8((uint64_t)a1, (int)v8, v7);
  int v12 = a1[11].i32[0];
  BOOL v13 = __OFSUB__(v12--, 1);
  a1[11].i32[0] = v12;
  if (v12 < 0 != v13) {
    return 0;
  }
  int v14 = v11;
  uint64_t result = (uint64_t)sub_24C70DA58(a2, v8, a1);
  if (!result) {
    return result;
  }
  ++a1[11].i32[0];
  if (a1[10].i32[0]) {
    return 0;
  }
  int v15 = a1[3].i32[1] + v14;
  a1[3].i32[1] = v15;
  *a1 = (int32x2_t)(*(void *)&a1[1] + (v15 & (v15 >> 31)));
  return result;
}

char *sub_24C70F5F8(uint64_t a1, char *a2, unint64_t *a3)
{
  int v6 = *(_DWORD *)(a1 + 64);
  if (v6)
  {
    for (int i = 0; i != v6; ++i)
    {
      if (*a3 <= (unint64_t)a2) {
        a2 = sub_24C715FA8((uint64_t)a3, a2);
      }
      uint64_t v8 = sub_24C6E3FB8(a1 + 56, i);
      *a2 = 10;
      unsigned int v9 = *(_DWORD *)(v8 + 44);
      if (v9 > 0x7F)
      {
        a2[1] = v9 | 0x80;
        unsigned int v11 = v9 >> 7;
        if (v9 >> 14)
        {
          unsigned int v10 = a2 + 3;
          do
          {
            *(v10 - 1) = v11 | 0x80;
            unsigned int v12 = v11 >> 7;
            ++v10;
            unsigned int v13 = v11 >> 14;
            v11 >>= 7;
          }
          while (v13);
          *(v10 - 1) = v12;
        }
        else
        {
          a2[2] = v11;
          unsigned int v10 = a2 + 3;
        }
      }
      else
      {
        a2[1] = v9;
        unsigned int v10 = a2 + 2;
      }
      a2 = sub_24C70E61C(v8, v10, a3);
    }
  }
  int v14 = *(_DWORD *)(a1 + 48);
  if (v14)
  {
    if (*a3 <= (unint64_t)a2) {
      a2 = sub_24C715FA8((uint64_t)a3, a2);
    }
    uint64_t v15 = *(void *)(a1 + 80);
    *a2 = 18;
    unsigned int v16 = *(_DWORD *)(v15 + 48);
    if (v16 > 0x7F)
    {
      a2[1] = v16 | 0x80;
      unsigned int v18 = v16 >> 7;
      if (v16 >> 14)
      {
        uint64_t v17 = a2 + 3;
        do
        {
          *(v17 - 1) = v18 | 0x80;
          unsigned int v19 = v18 >> 7;
          ++v17;
          unsigned int v20 = v18 >> 14;
          v18 >>= 7;
        }
        while (v20);
        *(v17 - 1) = v19;
      }
      else
      {
        a2[2] = v18;
        uint64_t v17 = a2 + 3;
      }
    }
    else
    {
      a2[1] = v16;
      uint64_t v17 = a2 + 2;
    }
    a2 = sub_24C70A1B8(v15, v17, (uint64_t *)a3);
    if ((v14 & 2) == 0)
    {
LABEL_15:
      if ((v14 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_38;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_15;
  }
  if (*a3 <= (unint64_t)a2) {
    a2 = sub_24C715FA8((uint64_t)a3, a2);
  }
  uint64_t v21 = *(void *)(a1 + 88);
  *a2 = 26;
  unsigned int v22 = *(_DWORD *)(v21 + 52);
  if (v22 > 0x7F)
  {
    a2[1] = v22 | 0x80;
    unsigned int v24 = v22 >> 7;
    if (v22 >> 14)
    {
      uint64_t v23 = a2 + 3;
      do
      {
        *(v23 - 1) = v24 | 0x80;
        unsigned int v25 = v24 >> 7;
        ++v23;
        unsigned int v26 = v24 >> 14;
        v24 >>= 7;
      }
      while (v26);
      *(v23 - 1) = v25;
    }
    else
    {
      a2[2] = v24;
      uint64_t v23 = a2 + 3;
    }
  }
  else
  {
    a2[1] = v22;
    uint64_t v23 = a2 + 2;
  }
  a2 = sub_24C70CA5C(v21, v23, a3);
  if ((v14 & 4) == 0)
  {
LABEL_16:
    if ((v14 & 8) == 0) {
      goto LABEL_58;
    }
    goto LABEL_48;
  }
LABEL_38:
  if (*a3 <= (unint64_t)a2) {
    a2 = sub_24C715FA8((uint64_t)a3, a2);
  }
  uint64_t v27 = *(void *)(a1 + 96);
  *a2 = 34;
  unsigned int v28 = *(_DWORD *)(v27 + 64);
  if (v28 > 0x7F)
  {
    a2[1] = v28 | 0x80;
    unsigned int v30 = v28 >> 7;
    if (v28 >> 14)
    {
      uint64_t v29 = a2 + 3;
      do
      {
        *(v29 - 1) = v30 | 0x80;
        unsigned int v31 = v30 >> 7;
        ++v29;
        unsigned int v32 = v30 >> 14;
        v30 >>= 7;
      }
      while (v32);
      *(v29 - 1) = v31;
    }
    else
    {
      a2[2] = v30;
      uint64_t v29 = a2 + 3;
    }
  }
  else
  {
    a2[1] = v28;
    uint64_t v29 = a2 + 2;
  }
  a2 = sub_24C70DD38(v27, v29, a3);
  if ((v14 & 8) != 0)
  {
LABEL_48:
    if (*a3 <= (unint64_t)a2) {
      a2 = sub_24C715FA8((uint64_t)a3, a2);
    }
    uint64_t v33 = *(void *)(a1 + 104);
    *a2 = 42;
    unsigned int v34 = *(_DWORD *)(v33 + 52);
    if (v34 > 0x7F)
    {
      a2[1] = v34 | 0x80;
      unsigned int v36 = v34 >> 7;
      if (v34 >> 14)
      {
        uint64_t v35 = a2 + 3;
        do
        {
          *(v35 - 1) = v36 | 0x80;
          unsigned int v37 = v36 >> 7;
          ++v35;
          unsigned int v38 = v36 >> 14;
          v36 >>= 7;
        }
        while (v38);
        *(v35 - 1) = v37;
      }
      else
      {
        a2[2] = v36;
        uint64_t v35 = a2 + 3;
      }
    }
    else
    {
      a2[1] = v34;
      uint64_t v35 = a2 + 2;
    }
    a2 = sub_24C70CA5C(v33, v35, a3);
  }
LABEL_58:
  uint64_t v39 = sub_24C71D5A4(a1 + 24, 200, 0x20000000, a2, (uint64_t *)a3);
  uint64_t v40 = v39;
  uint64_t v41 = *(void *)(a1 + 8);
  if ((v41 & 1) == 0) {
    return v40;
  }
  unint64_t v43 = v41 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v43 + 31) < 0)
  {
    char v44 = *(void **)(v43 + 8);
    uint64_t v45 = *(void *)(v43 + 16);
  }
  else
  {
    char v44 = (void *)(v43 + 8);
    LODWORD(v45) = *(unsigned __int8 *)(v43 + 31);
  }
  if ((uint64_t)(*a3 - (void)v39) >= (int)v45)
  {
    uint64_t v46 = (int)v45;
    memcpy(v39, v44, (int)v45);
    v40 += v46;
    return v40;
  }
  return sub_24C7160BC((uint64_t *)a3, (char *)v44, v45, (unint64_t)v39);
}

uint64_t sub_24C70FA04(uint64_t a1)
{
  uint64_t v2 = sub_24C7202D8(a1 + 24);
  uint64_t v3 = *(int *)(a1 + 64);
  uint64_t v4 = v2 + v3;
  uint64_t v5 = *(void *)(a1 + 72);
  if (v5) {
    int v6 = (uint64_t *)(v5 + 8);
  }
  else {
    int v6 = 0;
  }
  if (v3)
  {
    uint64_t v7 = 8 * v3;
    do
    {
      uint64_t v8 = *v6++;
      uint64_t v9 = sub_24C70E7C8(v8);
      v4 += v9 + ((9 * (__clz(v9 | 1) ^ 0x1F) + 73) >> 6);
      v7 -= 8;
    }
    while (v7);
  }
  int v10 = *(_DWORD *)(a1 + 48);
  if ((v10 & 0xF) == 0) {
    goto LABEL_13;
  }
  if ((v10 & 1) == 0)
  {
    if ((v10 & 2) == 0) {
      goto LABEL_10;
    }
LABEL_16:
    uint64_t v15 = sub_24C70CC70(*(void *)(a1 + 88));
    v4 += v15 + ((9 * (__clz(v15 | 1) ^ 0x1F) + 73) >> 6) + 1;
    if ((v10 & 4) == 0)
    {
LABEL_11:
      if ((v10 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    goto LABEL_17;
  }
  uint64_t v14 = sub_24C70B380(*(void *)(a1 + 80));
  v4 += v14 + ((9 * (__clz(v14 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v10 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_10:
  if ((v10 & 4) == 0) {
    goto LABEL_11;
  }
LABEL_17:
  uint64_t v16 = sub_24C70DED0(*(void *)(a1 + 96));
  v4 += v16 + ((9 * (__clz(v16 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v10 & 8) != 0)
  {
LABEL_12:
    uint64_t v11 = sub_24C70CC70(*(void *)(a1 + 104));
    v4 += v11 + ((9 * (__clz(v11 | 1) ^ 0x1F) + 73) >> 6) + 1;
  }
LABEL_13:
  uint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    unint64_t v17 = v12 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v17 + 31) < 0) {
      uint64_t v18 = *(void *)(v17 + 16);
    }
    else {
      uint64_t v18 = *(unsigned __int8 *)(v17 + 31);
    }
    v4 += v18;
  }
  *(_DWORD *)(a1 + 52) = v4;
  return v4;
}

void sub_24C70FB90(uint64_t a1, void *lpsrc)
{
  if (!__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26FEDBFE8, (const struct __class_type_info *)&unk_26FEDBC80, 0))sub_24C7080C0(); {
  sub_24C70FC18(a1, (uint64_t)lpsrc);
  }
}

void sub_24C70FC18(uint64_t a1, uint64_t a2)
{
  if (a2 == a1)
  {
    sub_24C716A34((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3397);
    uint64_t v4 = sub_24C716A4C(v27, "CHECK failed: (&from) != (this): ");
    sub_24C716B88((uint64_t)&v26, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v27);
  }
  sub_24C71AF7C(a1 + 24, a2 + 24);
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v6 = *(void *)(a2 + 8);
  if (v6)
  {
    unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFFELL) + 8;
    if (*v5) {
      uint64_t v9 = (std::string *)((*v5 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v9 = (std::string *)sub_24C7078BC((unint64_t *)(a1 + 8));
    }
    int v10 = *(char *)(v7 + 31);
    if (v10 >= 0) {
      uint64_t v11 = (const std::string::value_type *)v8;
    }
    else {
      uint64_t v11 = *(const std::string::value_type **)(v7 + 8);
    }
    if (v10 >= 0) {
      std::string::size_type v12 = *(unsigned __int8 *)(v7 + 31);
    }
    else {
      std::string::size_type v12 = *(void *)(v7 + 16);
    }
    std::string::append(v9, v11, v12);
  }
  sub_24C7117FC(a1 + 56, a2 + 56);
  int v13 = *(_DWORD *)(a2 + 48);
  if ((v13 & 0xF) != 0)
  {
    if (v13)
    {
      *(_DWORD *)(a1 + 48) |= 1u;
      uint64_t v14 = *(void *)(a1 + 80);
      if (!v14)
      {
        uint64_t v15 = (void *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
        if (*v5) {
          uint64_t v15 = (void *)*v15;
        }
        uint64_t v14 = sub_24C7100EC((uint64_t)v15);
        *(void *)(a1 + 80) = v14;
      }
      if (*(void *)(a2 + 80)) {
        uint64_t v16 = *(void **)(a2 + 80);
      }
      else {
        uint64_t v16 = &unk_2697ED4C0;
      }
      sub_24C70BCB8(v14, (uint64_t)v16);
    }
    if ((v13 & 2) != 0)
    {
      *(_DWORD *)(a1 + 48) |= 2u;
      uint64_t v17 = *(void *)(a1 + 88);
      if (!v17)
      {
        uint64_t v18 = (void *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
        if (*v5) {
          uint64_t v18 = (void *)*v18;
        }
        uint64_t v17 = sub_24C7101BC((uint64_t)v18);
        *(void *)(a1 + 88) = v17;
      }
      if (*(void *)(a2 + 88)) {
        unsigned int v19 = *(void **)(a2 + 88);
      }
      else {
        unsigned int v19 = &unk_2697ED650;
      }
      sub_24C70CE60(v17, (uint64_t)v19);
      if ((v13 & 4) == 0)
      {
LABEL_25:
        if ((v13 & 8) == 0) {
          return;
        }
        goto LABEL_43;
      }
    }
    else if ((v13 & 4) == 0)
    {
      goto LABEL_25;
    }
    *(_DWORD *)(a1 + 48) |= 4u;
    uint64_t v20 = *(void *)(a1 + 96);
    if (!v20)
    {
      uint64_t v21 = (void *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
      if (*v5) {
        uint64_t v21 = (void *)*v21;
      }
      uint64_t v20 = sub_24C71035C((uint64_t)v21);
      *(void *)(a1 + 96) = v20;
    }
    if (*(void *)(a2 + 96)) {
      unsigned int v22 = *(void **)(a2 + 96);
    }
    else {
      unsigned int v22 = &unk_2697ED608;
    }
    sub_24C70E008(v20, (uint64_t)v22);
    if ((v13 & 8) != 0)
    {
LABEL_43:
      *(_DWORD *)(a1 + 48) |= 8u;
      uint64_t v23 = *(void *)(a1 + 104);
      if (!v23)
      {
        unsigned int v24 = (void *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
        if (*v5) {
          unsigned int v24 = (void *)*v24;
        }
        uint64_t v23 = sub_24C7101BC((uint64_t)v24);
        *(void *)(a1 + 104) = v23;
      }
      if (*(void *)(a2 + 104)) {
        unsigned int v25 = *(void **)(a2 + 104);
      }
      else {
        unsigned int v25 = &unk_2697ED650;
      }
      sub_24C70CE60(v23, (uint64_t)v25);
    }
  }
}

void sub_24C70FE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C70FE54(uint64_t a1, uint64_t a2)
{
  if (a2 != a1)
  {
    sub_24C70ED5C(a1);
    sub_24C70FC18(a1, a2);
  }
}

uint64_t sub_24C70FEA0(uint64_t a1)
{
  uint64_t result = sub_24C71C40C(a1 + 24);
  if (!result) {
    return result;
  }
  uint64_t result = sub_24C710084(a1 + 56);
  if (!result) {
    return result;
  }
  int v3 = *(_DWORD *)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 80);
    if (!v4)
    {
      sub_24C716A34((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.h", 4741);
      uint64_t v5 = sub_24C716A4C(v13, "CHECK failed: !value || trainer_spec_ != nullptr: ");
      sub_24C716B88((uint64_t)&v12, (const char **)&v5->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v13);
      uint64_t v4 = *(void *)(a1 + 80);
    }
    uint64_t result = sub_24C71C40C(v4 + 16);
    if (!result) {
      return result;
    }
    int v3 = *(_DWORD *)(a1 + 48);
  }
  if ((v3 & 2) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 88);
    if (!v6)
    {
      sub_24C716A34((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.h", 4824);
      unint64_t v7 = sub_24C716A4C(v13, "CHECK failed: !value || normalizer_spec_ != nullptr: ");
      sub_24C716B88((uint64_t)&v12, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v13);
      uint64_t v6 = *(void *)(a1 + 88);
    }
    uint64_t result = sub_24C71C40C(v6 + 24);
    if (!result) {
      return result;
    }
    int v3 = *(_DWORD *)(a1 + 48);
  }
  if ((v3 & 4) == 0)
  {
LABEL_18:
    if ((v3 & 8) == 0) {
      return 1;
    }
    uint64_t v10 = *(void *)(a1 + 104);
    if (!v10)
    {
      sub_24C716A34((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.h", 4990);
      uint64_t v11 = sub_24C716A4C(v13, "CHECK failed: !value || denormalizer_spec_ != nullptr: ");
      sub_24C716B88((uint64_t)&v12, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v13);
      uint64_t v10 = *(void *)(a1 + 104);
    }
    uint64_t result = sub_24C71C40C(v10 + 24);
    if (result) {
      return 1;
    }
    return result;
  }
  uint64_t v8 = *(void *)(a1 + 96);
  if (!v8)
  {
    sub_24C716A34((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.h", 4907);
    uint64_t v9 = sub_24C716A4C(v13, "CHECK failed: !value || self_test_data_ != nullptr: ");
    sub_24C716B88((uint64_t)&v12, (const char **)&v9->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v13);
    uint64_t v8 = *(void *)(a1 + 96);
  }
  uint64_t result = sub_24C71C40C(v8 + 16);
  if (result)
  {
    int v3 = *(_DWORD *)(a1 + 48);
    goto LABEL_18;
  }
  return result;
}

void sub_24C710054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sub_24C710084(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 8);
  do
  {
    int v3 = v2;
    BOOL v4 = __OFSUB__(v2--, 1);
    if (v2 < 0 != v4) {
      break;
    }
    uint64_t v5 = sub_24C6E3FB8(a1, v2);
  }
  while ((sub_24C71C40C(v5 + 16) & 1) != 0);
  return v3 < 1;
}

void *sub_24C7100DC@<X0>(void *a1@<X8>)
{
  return sub_24C6698FC(a1, "sentencepiece.ModelProto");
}

uint64_t sub_24C7100EC(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_26FEDBCF0, 328);
  }
  uint64_t v2 = sub_24C7153A0(a1, 328);
  sub_24C70839C(v2, a1);
  return v2;
}

void sub_24C710198(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0x10A1C4074230EEALL);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7101BC(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_26FEDBD40, 88);
  }
  uint64_t v2 = sub_24C7153A0(a1, 88);
  sub_24C70C244(v2, a1);
  return v2;
}

void sub_24C710268(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0x10A1C402CDD3876);
  _Unwind_Resume(a1);
}

void *sub_24C71028C(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_26FEDBDA0, 40);
  }
  uint64_t v2 = (void *)sub_24C7153A0(a1, 40);
  sub_24C70D05C(v2, a1);
  return v2;
}

void sub_24C710338(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0x1081C400F7E8713);
  _Unwind_Resume(a1);
}

uint64_t sub_24C71035C(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_26FEDBD08, 72);
  }
  uint64_t v2 = sub_24C7153A0(a1, 72);
  sub_24C70D85C(v2, a1);
  return v2;
}

void sub_24C710408(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0x10A1C4075D007F8);
  _Unwind_Resume(a1);
}

void *sub_24C71042C(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_26FEDBDF8, 64);
  }
  uint64_t v2 = (void *)sub_24C7153A0(a1, 64);
  sub_24C70E110(v2, a1);
  return v2;
}

void sub_24C7104D8(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0x10A1C40F497E4DALL);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7104FC(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_26FEDBC80, 112);
  }
  uint64_t v2 = sub_24C7153A0(a1, 112);
  sub_24C70EAA0(v2, a1);
  return v2;
}

void sub_24C7105A8(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0x10A1C4047CE62CFLL);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7105CC()
{
  return sub_24C7100EC(0);
}

uint64_t sub_24C7105D4(uint64_t a1, uint64_t a2)
{
  return sub_24C7100EC(a2);
}

uint64_t sub_24C7105DC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t sub_24C7105E4()
{
  return sub_24C7101BC(0);
}

uint64_t sub_24C7105EC(uint64_t a1, uint64_t a2)
{
  return sub_24C7101BC(a2);
}

uint64_t sub_24C7105F4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 52);
}

uint64_t sub_24C7105FC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80);
}

uint64_t sub_24C710604(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 81);
}

uint64_t sub_24C71060C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 82);
}

uint64_t sub_24C710614(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 83);
}

uint64_t sub_24C71061C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 65);
}

uint64_t sub_24C710624(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 66);
}

uint64_t sub_24C71062C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 67);
}

uint64_t sub_24C710634(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 64);
}

void *sub_24C71063C()
{
  return sub_24C71028C(0);
}

void *sub_24C710644(uint64_t a1, uint64_t a2)
{
  return sub_24C71028C(a2);
}

uint64_t sub_24C71064C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t sub_24C710654()
{
  return sub_24C71035C(0);
}

uint64_t sub_24C71065C(uint64_t a1, uint64_t a2)
{
  return sub_24C71035C(a2);
}

uint64_t sub_24C710664(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

void *sub_24C71066C()
{
  return sub_24C71042C(0);
}

void *sub_24C710674(uint64_t a1, uint64_t a2)
{
  return sub_24C71042C(a2);
}

uint64_t sub_24C71067C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t sub_24C710684()
{
  return sub_24C7104FC(0);
}

uint64_t sub_24C71068C(uint64_t a1, uint64_t a2)
{
  return sub_24C7104FC(a2);
}

uint64_t sub_24C710694(uint64_t a1)
{
  return *(unsigned int *)(a1 + 52);
}

uint64_t sub_24C71069C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

char *sub_24C7106A4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 80);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  uint64_t v2 = v1[22];
  if (v2)
  {
    uint64_t result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_2697ECF00, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_24C7154F4(&off_2697ECEE8);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

char *sub_24C710710(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 80);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  uint64_t v2 = v1[23];
  if (v2)
  {
    uint64_t result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_2697ECF40, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_24C7154F4(&off_2697ECF28);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

char *sub_24C71077C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 80);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  uint64_t v2 = v1[24];
  if (v2)
  {
    uint64_t result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_2697ECF68, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_24C7154F4(&off_2697ECF50);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

char *sub_24C7107E8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 80);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  uint64_t v2 = v1[25];
  if (v2)
  {
    uint64_t result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_2697ECF88, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_24C7154F4(&off_2697ECF70);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

char *sub_24C710854(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 80);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  uint64_t v2 = v1[26];
  if (v2)
  {
    uint64_t result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_2697ECF20, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_24C7154F4(&off_2697ECF08);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

uint64_t sub_24C7108C0(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 **)(a1 + 80);
  if (!v1) {
    uint64_t v1 = (unsigned __int8 *)&unk_2697ED4C0;
  }
  return v1[248];
}

uint64_t sub_24C7108DC(uint64_t a1)
{
  uint64_t v1 = (unsigned __int8 *)&unk_2697ED4C0;
  if (*(void *)(a1 + 80)) {
    uint64_t v1 = *(unsigned __int8 **)(a1 + 80);
  }
  return (v1[40] >> 3) & 1;
}

char *sub_24C7108FC(uint64_t a1, int a2)
{
  uint64_t result = (char *)(*(void *)(sub_24C6E3FB8(a1 + 56, a2) + 48) & 0xFFFFFFFFFFFFFFFELL);
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

float sub_24C710934(uint64_t a1, int a2)
{
  return *(float *)(sub_24C6E3FB8(a1 + 56, a2) + 56);
}

BOOL sub_24C710954(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 56, a2) + 60) == 1;
}

BOOL sub_24C71097C(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 56, a2) + 60) == 2;
}

BOOL sub_24C7109A4(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 56, a2) + 60) == 3;
}

BOOL sub_24C7109CC(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 56, a2) + 60) == 5;
}

BOOL sub_24C7109F4(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 56, a2) + 60) == 4;
}

BOOL sub_24C710A1C(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 56, a2) + 60) == 6;
}

char *sub_24C710A44(uint64_t a1)
{
  uint64_t v1 = *(char **)(a1 + 88);
  if (!v1) {
    uint64_t v1 = (char *)&unk_2697ED650;
  }
  return v1 + 16;
}

char *sub_24C710A60(uint64_t a1)
{
  uint64_t v1 = *(char **)(a1 + 104);
  if (!v1) {
    uint64_t v1 = (char *)&unk_2697ED650;
  }
  return v1 + 16;
}

uint64_t sub_24C710A7C(uint64_t a1)
{
  uint64_t v1 = *(_DWORD **)(a1 + 80);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  int v2 = v1[68];
  unsigned int v3 = v2 - 2;
  unsigned int v4 = v2 - 1;
  if (v3 >= 3) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t sub_24C710AA8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

char *sub_24C710AB0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 64);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  uint64_t v2 = v1[22];
  if (v2)
  {
    uint64_t result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_2697ECF00, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_24C7154F4(&off_2697ECEE8);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

char *sub_24C710B1C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 64);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  uint64_t v2 = v1[23];
  if (v2)
  {
    uint64_t result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_2697ECF40, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_24C7154F4(&off_2697ECF28);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

char *sub_24C710B88(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 64);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  uint64_t v2 = v1[24];
  if (v2)
  {
    uint64_t result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_2697ECF68, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_24C7154F4(&off_2697ECF50);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

char *sub_24C710BF4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 64);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  uint64_t v2 = v1[25];
  if (v2)
  {
    uint64_t result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_2697ECF88, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_24C7154F4(&off_2697ECF70);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

char *sub_24C710C60(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 64);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  uint64_t v2 = v1[26];
  if (v2)
  {
    uint64_t result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_2697ECF20, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_24C7154F4(&off_2697ECF08);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

uint64_t sub_24C710CCC(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 **)(a1 + 64);
  if (!v1) {
    uint64_t v1 = (unsigned __int8 *)&unk_2697ED4C0;
  }
  return v1[248];
}

uint64_t sub_24C710CE8(uint64_t a1)
{
  uint64_t v1 = (unsigned __int8 *)&unk_2697ED4C0;
  if (*(void *)(a1 + 64)) {
    uint64_t v1 = *(unsigned __int8 **)(a1 + 64);
  }
  return (v1[40] >> 3) & 1;
}

uint64_t sub_24C710D08(uint64_t a1)
{
  uint64_t v1 = *(_DWORD **)(a1 + 64);
  if (!v1) {
    uint64_t v1 = &unk_2697ED4C0;
  }
  int v2 = v1[68];
  unsigned int v3 = v2 - 2;
  unsigned int v4 = v2 - 1;
  if (v3 >= 3) {
    return 0;
  }
  else {
    return v4;
  }
}

char *sub_24C710D34(uint64_t a1, int a2)
{
  uint64_t result = (char *)(*(void *)(sub_24C6E3FB8(a1 + 40, a2) + 48) & 0xFFFFFFFFFFFFFFFELL);
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

float sub_24C710D6C(uint64_t a1, int a2)
{
  return *(float *)(sub_24C6E3FB8(a1 + 40, a2) + 56);
}

BOOL sub_24C710D8C(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 40, a2) + 60) == 1;
}

BOOL sub_24C710DB4(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 40, a2) + 60) == 2;
}

BOOL sub_24C710DDC(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 40, a2) + 60) == 3;
}

BOOL sub_24C710E04(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 40, a2) + 60) == 5;
}

BOOL sub_24C710E2C(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 40, a2) + 60) == 4;
}

BOOL sub_24C710E54(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_24C6E3FB8(a1 + 40, a2) + 60) == 6;
}

char *sub_24C710E7C(uint64_t a1)
{
  uint64_t v1 = *(char **)(a1 + 72);
  if (!v1) {
    uint64_t v1 = (char *)&unk_2697ED650;
  }
  return v1 + 16;
}

char *sub_24C710E98(uint64_t a1)
{
  uint64_t v1 = *(char **)(a1 + 88);
  if (!v1) {
    uint64_t v1 = (char *)&unk_2697ED650;
  }
  return v1 + 16;
}

void sub_24C710EB4(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

uint64_t sub_24C710EC8(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1705);
    unsigned int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1706);
    uint64_t v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return *(void *)(*(void *)(a1 + 16) + 8 * a2 + 8);
}

void sub_24C710F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C710FA8(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  if ((v1 & 0x80000000) != 0)
  {
    sub_24C716A34((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1780);
    unsigned int v4 = sub_24C716A4C(v6, "CHECK failed: (n) >= (0): ");
    sub_24C716B88((uint64_t)&v5, (const char **)&v4->__r_.__value_.__l.__data_);
    return sub_24C716B90((uint64_t)v6);
  }
  else if (v1)
  {
    uint64_t v2 = *(void *)(result + 16) + 8;
    do
    {
      uint64_t v3 = *(void *)v2;
      if (*(char *)(*(void *)v2 + 23) < 0)
      {
        **(unsigned char **)uint64_t v3 = 0;
        *(void *)(v3 + 8) = 0;
      }
      else
      {
        *(unsigned char *)uint64_t v3 = 0;
        *(unsigned char *)(v3 + 23) = 0;
      }
      v2 += 8;
      --v1;
    }
    while (v1);
    *(_DWORD *)(result + 8) = 0;
  }
  return result;
}

void sub_24C711054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C71106C(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1705);
    unsigned int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1706);
    char v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return *(void *)(*(void *)(a1 + 16) + 8 * a2 + 8);
}

void sub_24C71112C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C71114C(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  if ((v1 & 0x80000000) != 0)
  {
    sub_24C716A34((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1780);
    char v5 = sub_24C716A4C(v7, "CHECK failed: (n) >= (0): ");
    sub_24C716B88((uint64_t)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    return sub_24C716B90((uint64_t)v7);
  }
  else if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = (uint64_t *)(*(void *)(result + 16) + 8);
    do
    {
      uint64_t v4 = *v3++;
      uint64_t result = sub_24C70D264(v4);
      --v1;
    }
    while (v1);
    *(_DWORD *)(v2 + 8) = 0;
  }
  return result;
}

void sub_24C7111E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C7111FC(unsigned __int8 *result)
{
  uint64_t v1 = *((unsigned int *)result + 2);
  if ((v1 & 0x80000000) != 0)
  {
    sub_24C716A34((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1780);
    char v5 = sub_24C716A4C(v7, "CHECK failed: (n) >= (0): ");
    sub_24C716B88((uint64_t)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    return (unsigned __int8 *)sub_24C716B90((uint64_t)v7);
  }
  else if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = (uint64_t *)(*((void *)result + 2) + 8);
    do
    {
      uint64_t v4 = *v3++;
      uint64_t result = sub_24C70E2FC(v4);
      --v1;
    }
    while (v1);
    *((_DWORD *)v2 + 2) = 0;
  }
  return result;
}

void sub_24C711294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7112AC(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  if (a2 == result)
  {
    sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1799);
    uint64_t v4 = sub_24C716A4C(v11, "CHECK failed: (&other) != (this): ");
    sub_24C716B88((uint64_t)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = sub_24C716B90((uint64_t)v11);
  }
  unsigned int v5 = *(_DWORD *)(a2 + 8);
  if (v5)
  {
    char v6 = (const std::string **)(*(void *)(a2 + 16) + 8);
    char v7 = (std::string **)sub_24C72911C((uint64_t *)v3, v5);
    uint64_t result = (uint64_t)sub_24C71139C((std::string *)v3, v7, v6, v5, **(_DWORD **)(v3 + 16) - *(_DWORD *)(v3 + 8));
    signed int v8 = *(_DWORD *)(v3 + 8) + v5;
    *(_DWORD *)(v3 + 8) = v8;
    uint64_t v9 = *(signed int **)(v3 + 16);
    if (*v9 < v8) {
      signed int *v9 = v8;
    }
  }
  return result;
}

void sub_24C711384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

std::string *sub_24C71139C(std::string *result, std::string **a2, const std::string **a3, unsigned int a4, unsigned int a5)
{
  uint64_t v9 = (std::string::__raw *)result;
  if ((int)a5 >= (int)a4) {
    uint64_t v10 = a4;
  }
  else {
    uint64_t v10 = a5;
  }
  if ((int)v10 >= 1)
  {
    uint64_t v11 = a3;
    char v12 = a2;
    do
    {
      uint64_t v14 = *v11++;
      int v13 = v14;
      uint64_t v15 = *v12++;
      uint64_t result = std::string::operator=(v15, v13);
      --v10;
    }
    while (v10);
  }
  BOOL v16 = __OFSUB__(a4, a5);
  int v17 = a4 - a5;
  if (!((v17 < 0) ^ v16 | (v17 == 0)))
  {
    std::string::size_type v18 = v9->__words[0];
    unsigned int v19 = &a3[a5];
    uint64_t v20 = &a2[a5];
    do
    {
      uint64_t v21 = *v19;
      if (!v18) {
        operator new();
      }
      if (*(unsigned char *)(v18 + 24)) {
        (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v18 + 32) + 32) + 40))(*(void *)(*(void *)(v18 + 32) + 32), &unk_26FEDC168, 24);
      }
      unsigned int v22 = (std::string *)sub_24C7150A4((void *)v18, 0x18uLL, (uint64_t)sub_24C710EB4);
      v22->__r_.__value_.__r.__words[0] = 0;
      v22->__r_.__value_.__l.__size_ = 0;
      v22->__r_.__value_.__r.__words[2] = 0;
      uint64_t result = std::string::operator=(v22, v21);
      *v20++ = v22;
      ++v19;
      --v17;
    }
    while (v17);
  }
  return result;
}

uint64_t *sub_24C7114D4(uint64_t *a1)
{
  sub_24C711510(a1);
  return sub_24C707BB4(a1);
}

void sub_24C711510(void *a1)
{
  uint64_t v2 = (uint64_t *)a1[2];
  if (v2 && !*a1)
  {
    uint64_t v3 = v2 + 1;
    uint64_t v4 = *(unsigned int *)v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3)
        {
          uint64_t v5 = sub_24C70D0CC(*v3);
          MEMORY[0x2532F8960](v5, 0x1081C400F7E8713);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (uint64_t *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

unint64_t sub_24C711590(unint64_t result, uint64_t a2)
{
  unint64_t v3 = result;
  if (a2 == result)
  {
    sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1799);
    uint64_t v4 = sub_24C716A4C(v11, "CHECK failed: (&other) != (this): ");
    sub_24C716B88((uint64_t)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = sub_24C716B90((uint64_t)v11);
  }
  unsigned int v5 = *(_DWORD *)(a2 + 8);
  if (v5)
  {
    char v6 = (uint64_t *)(*(void *)(a2 + 16) + 8);
    char v7 = (unint64_t *)sub_24C72911C((uint64_t *)v3, v5);
    uint64_t result = sub_24C711680(v3, v7, v6, v5, **(_DWORD **)(v3 + 16) - *(_DWORD *)(v3 + 8));
    signed int v8 = *(_DWORD *)(v3 + 8) + v5;
    *(_DWORD *)(v3 + 8) = v8;
    uint64_t v9 = *(signed int **)(v3 + 16);
    if (*v9 < v8) {
      signed int *v9 = v8;
    }
  }
  return result;
}

void sub_24C711668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t sub_24C711680(unint64_t result, unint64_t *a2, uint64_t *a3, unsigned int a4, unsigned int a5)
{
  uint64_t v9 = (uint64_t *)result;
  if ((int)a5 >= (int)a4) {
    uint64_t v10 = a4;
  }
  else {
    uint64_t v10 = a5;
  }
  if ((int)v10 >= 1)
  {
    uint64_t v11 = a3;
    char v12 = a2;
    do
    {
      uint64_t v14 = *v11++;
      uint64_t v13 = v14;
      unint64_t v15 = *v12++;
      uint64_t result = sub_24C711730(v13, v15);
      --v10;
    }
    while (v10);
  }
  BOOL v16 = __OFSUB__(a4, a5);
  int v17 = a4 - a5;
  if (!((v17 < 0) ^ v16 | (v17 == 0)))
  {
    uint64_t v18 = *v9;
    unsigned int v19 = &a3[a5];
    uint64_t v20 = &a2[a5];
    do
    {
      uint64_t v21 = *v19++;
      unsigned int v22 = sub_24C71028C(v18);
      uint64_t result = sub_24C711730(v21, (unint64_t)v22);
      *v20++ = (unint64_t)v22;
      --v17;
    }
    while (v17);
  }
  return result;
}

unint64_t sub_24C711730(uint64_t a1, unint64_t a2)
{
  return sub_24C70D6F8(a2, a1);
}

uint64_t *sub_24C711740(uint64_t *a1)
{
  sub_24C71177C(a1);
  return sub_24C707BB4(a1);
}

void sub_24C71177C(void *a1)
{
  uint64_t v2 = (uint64_t *)a1[2];
  if (v2 && !*a1)
  {
    unint64_t v3 = v2 + 1;
    uint64_t v4 = *(unsigned int *)v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3)
        {
          uint64_t v5 = sub_24C70E1A4(*v3);
          MEMORY[0x2532F8960](v5, 0x10A1C40F497E4DALL);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (uint64_t *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

void sub_24C7117FC(uint64_t a1, uint64_t a2)
{
  if (a2 == a1)
  {
    sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1799);
    uint64_t v4 = sub_24C716A4C(v11, "CHECK failed: (&other) != (this): ");
    sub_24C716B88((uint64_t)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v11);
  }
  unsigned int v5 = *(_DWORD *)(a2 + 8);
  if (v5)
  {
    char v6 = (uint64_t *)(*(void *)(a2 + 16) + 8);
    char v7 = (uint64_t *)sub_24C72911C((uint64_t *)a1, v5);
    sub_24C7118EC((uint64_t *)a1, v7, v6, v5, **(_DWORD **)(a1 + 16) - *(_DWORD *)(a1 + 8));
    signed int v8 = *(_DWORD *)(a1 + 8) + v5;
    *(_DWORD *)(a1 + 8) = v8;
    uint64_t v9 = *(signed int **)(a1 + 16);
    if (*v9 < v8) {
      signed int *v9 = v8;
    }
  }
}

void sub_24C7118D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C7118EC(uint64_t *a1, uint64_t *a2, uint64_t *a3, unsigned int a4, unsigned int a5)
{
  if ((int)a5 >= (int)a4) {
    uint64_t v10 = a4;
  }
  else {
    uint64_t v10 = a5;
  }
  if ((int)v10 >= 1)
  {
    uint64_t v11 = a3;
    char v12 = a2;
    do
    {
      uint64_t v14 = *v11++;
      uint64_t v13 = v14;
      uint64_t v15 = *v12++;
      sub_24C71199C(v13, v15);
      --v10;
    }
    while (v10);
  }
  BOOL v16 = __OFSUB__(a4, a5);
  int v17 = a4 - a5;
  if (!((v17 < 0) ^ v16 | (v17 == 0)))
  {
    uint64_t v18 = *a1;
    unsigned int v19 = &a3[a5];
    uint64_t v20 = &a2[a5];
    do
    {
      uint64_t v21 = *v19++;
      unsigned int v22 = sub_24C71042C(v18);
      sub_24C71199C(v21, (uint64_t)v22);
      *v20++ = (uint64_t)v22;
      --v17;
    }
    while (v17);
  }
}

void sub_24C71199C(uint64_t a1, uint64_t a2)
{
}

void sub_24C7119AC()
{
}

void sub_24C7119F4()
{
}

void sub_24C711A50(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0xA1C409BE6959DLL);
  _Unwind_Resume(a1);
}

void *sub_24C711A74(void *a1, const char *a2, uint64_t a3)
{
  *a1 = &unk_26FEDC3D8;
  char v6 = a1 + 1;
  sub_24C714634(a1 + 1);
  if (a3) {
    operator new();
  }
  char v7 = (void *)MEMORY[0x263F8C0E8];
  a1[2] = MEMORY[0x263F8C0E8];
  if ((*((unsigned char *)v7 + *(void *)(*v7 - 24) + 32) & 5) != 0)
  {
    unsigned int v15 = 5;
    sub_24C6E3D44((uint64_t)v16);
    sub_24C689D44(v16, (uint64_t)"\"", 1);
    size_t v8 = strlen(a2);
    sub_24C689D44(v16, (uint64_t)a2, v8);
    sub_24C689D44(v16, (uint64_t)"\": ", 3);
    uint64_t v9 = __error();
    sub_24C712788(*v9);
    if ((v14 & 0x80u) == 0) {
      uint64_t v10 = __p;
    }
    else {
      uint64_t v10 = (void **)__p[0];
    }
    if ((v14 & 0x80u) == 0) {
      uint64_t v11 = v14;
    }
    else {
      uint64_t v11 = (uint64_t)__p[1];
    }
    sub_24C689D44(v16, (uint64_t)v10, v11);
    sub_24C6E15D0(&v15, (uint64_t)&v19);
    sub_24C71485C(v6, &v19);
    sub_24C71463C(&v19);
    if ((char)v14 < 0) {
      operator delete(__p[0]);
    }
    v16[0] = *MEMORY[0x263F8C2C8];
    *(void *)((char *)v16 + *(void *)(v16[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
    v16[1] = MEMORY[0x263F8C318] + 16;
    if (v17 < 0) {
      operator delete((void *)v16[9]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x2532F88A0](&v18);
  }
  return a1;
}

void sub_24C711CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  sub_24C71463C((uint64_t *)(v16 - 56));
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_24C6E1660((uint64_t)&a15);
  sub_24C71463C(v15);
  _Unwind_Resume(a1);
}

void sub_24C711D64(void *a1)
{
  sub_24C711FA8(a1);
  JUMPOUT(0x2532F8960);
}

uint64_t sub_24C711D9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24C714858(a2, a1 + 8);
}

BOOL sub_24C711DA8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)(a1 + 16);
  std::ios_base::getloc((const std::ios_base *)((char *)v3 + *(void *)(*v3 - 24)));
  uint64_t v4 = std::locale::use_facet(&v8, MEMORY[0x263F8C108]);
  unsigned __int8 v5 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 10);
  std::locale::~locale(&v8);
  char v6 = sub_24C71202C(v3, a2, v5);
  return (*((unsigned char *)v6 + *(void *)(*v6 - 24) + 32) & 5) == 0;
}

void sub_24C711E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

BOOL sub_24C711E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  unint64_t v3 = (void *)MEMORY[0x263F8C0E8];
  if (v2 == (void *)MEMORY[0x263F8C0E8])
  {
    if ((int)sub_24C712578() <= 2)
    {
      char v11 = 0;
      uint64_t v4 = sub_24C689D44(MEMORY[0x263F8C0F8], (uint64_t)"filesystem.cc", 13);
      sub_24C689D44(v4, (uint64_t)"(", 1);
      unsigned __int8 v5 = (void *)std::ostream::operator<<();
      char v6 = sub_24C689D44(v5, (uint64_t)") ", 2);
      char v7 = sub_24C689D44(v6, (uint64_t)"LOG(", 4);
      std::locale v8 = sub_24C689D44(v7, (uint64_t)"ERROR", 5);
      uint64_t v9 = sub_24C689D44(v8, (uint64_t)") ", 2);
      sub_24C689D44(v9, (uint64_t)"ReadAll is not supported for stdin.", 35);
      sub_24C6E3EDC(&v11);
    }
  }
  else
  {
    sub_24C71221C(a2, *(void **)((char *)v2 + *(void *)(*v2 - 24) + 40), 0);
  }
  return v2 != v3;
}

void sub_24C711F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
}

void *sub_24C711FA8(void *a1)
{
  *a1 = &unk_26FEDC3D8;
  uint64_t v2 = a1[2];
  if (v2 != MEMORY[0x263F8C0E8] && v2 != 0) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  sub_24C71463C(a1 + 1);
  return a1;
}

void *sub_24C71202C(void *a1, uint64_t a2, unsigned __int8 a3)
{
  MEMORY[0x2532F8640](&v11, a1, 1);
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    char v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    std::locale v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_24C71218C(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x24C71214CLL);
  }
  __cxa_rethrow();
}

void sub_24C712208(_Unwind_Exception *a1)
{
}

void sub_24C71221C(uint64_t a1, void *a2, void *a3)
{
  sub_24C71229C(&__p, a2, a3);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  MEMORY[0x2532F8570](a1, p_p, size);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_24C712280(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_24C71229C(std::string *a1, void *a2, void *a3)
{
  char v11 = a3;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  a1->__r_.__value_.__r.__words[0] = 0;
  while (1)
  {
    if (a2)
    {
      if (a2[3] == a2[4])
      {
        int v6 = (*(uint64_t (**)(void *))(*a2 + 72))(a2);
        int v5 = v6 == -1;
        if (v6 == -1) {
          a2 = 0;
        }
      }
      else
      {
        int v5 = 0;
      }
    }
    else
    {
      int v5 = 1;
    }
    BOOL result = sub_24C7123FC(&v11);
    if (v5 == result) {
      break;
    }
    std::locale v8 = (std::string::value_type *)a2[3];
    if (v8 == (std::string::value_type *)a2[4]) {
      std::string::value_type v9 = (*(uint64_t (**)(void *))(*a2 + 72))(a2);
    }
    else {
      std::string::value_type v9 = *v8;
    }
    std::string::push_back(a1, v9);
    uint64_t v10 = a2[3];
    if (v10 == a2[4]) {
      (*(void (**)(void *))(*a2 + 80))(a2);
    }
    else {
      a2[3] = v10 + 1;
    }
  }
  return result;
}

void sub_24C7123CC(void *a1)
{
  __cxa_begin_catch(a1);
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  __cxa_rethrow();
}

void sub_24C7123E8(_Unwind_Exception *a1)
{
}

BOOL sub_24C7123FC(void **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    if (v2[3] != v2[4]) {
      return 0;
    }
    if ((*(unsigned int (**)(void *))(*v2 + 72))(v2) != -1) {
      return *a1 == 0;
    }
    *a1 = 0;
  }
  return 1;
}

uint64_t sub_24C71247C()
{
  unsigned int v0 = atomic_load(&dword_2697ED250);
  if (v0 != -1) {
    return atomic_load(&dword_2697ED250);
  }
  sub_24C712504(&v3);
  uint64_t v1 = MEMORY[0x2532F8760](&v3);
  std::random_device::~random_device(&v3);
  return v1;
}

void sub_24C7124DC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, std::random_device a11, std::random_device a12)
{
  std::random_device::~random_device(&a11);
  __cxa_begin_catch(a1);
  atomic_load(v12);
  __cxa_end_catch();
  JUMPOUT(0x24C7124C8);
}

std::random_device *sub_24C712504(std::random_device *a1)
{
  sub_24C6698FC(&__token, "/dev/urandom");
  std::random_device::random_device(a1, &__token);
  if (SHIBYTE(__token.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__token.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_24C71255C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_24C712578()
{
  return atomic_load((unsigned int *)&unk_2697ED400);
}

uint64_t sub_24C712588(unsigned __int8 *a1, uint64_t a2, uint64_t *a3)
{
  int v3 = (char)*a1;
  if ((v3 & 0x80000000) == 0)
  {
    *a3 = 1;
    return *a1;
  }
  unint64_t v5 = a2 - (void)a1;
  if ((unint64_t)(a2 - (void)a1) >= 2)
  {
    if ((v3 & 0xE0) == 0xC0)
    {
      char v6 = a1[1];
      if (v6 <= -65)
      {
        uint64_t result = v6 & 0x3F | ((v3 & 0x1F) << 6);
        if (result >= 0x80)
        {
          uint64_t v7 = 2;
LABEL_8:
          *a3 = v7;
          return result;
        }
      }
    }
    else if (v5 >= 3)
    {
      if ((v3 & 0xF0) == 0xE0)
      {
        int v8 = (char)a1[1];
        if (v8 <= -65)
        {
          char v9 = a1[2];
          if (v9 <= -65)
          {
            uint64_t result = v9 & 0x3F | ((v8 & 0x3F) << 6) & 0xFFF | ((v3 & 0xF) << 12);
            if (result >= 0x800
              && (((v3 & 0xF) << 12) - 57344 < 0x102000u || result >> 11 <= 0x1A))
            {
              uint64_t v7 = 3;
              goto LABEL_8;
            }
          }
        }
      }
      else if (v5 >= 4 && (v3 & 0xF8) == 0xF0)
      {
        int v10 = (char)a1[1];
        if (v10 <= -65)
        {
          int v11 = (char)a1[2];
          if (v11 <= -65)
          {
            char v12 = a1[3];
            if (v12 <= -65)
            {
              int v13 = ((v3 & 7) << 18) | ((v10 & 0x3F) << 12);
              uint64_t result = v12 & 0x3F | ((v11 & 0x3F) << 6) | v13;
              if (result >= 0x10000 && (v13 - 57344) < 0x102000)
              {
                uint64_t v7 = 4;
                goto LABEL_8;
              }
            }
          }
        }
      }
    }
  }
  *a3 = 1;
  return 65533;
}

uint64_t sub_24C7126D0()
{
  unsigned int v0 = off_26BADA8D0;
  if ((*(unsigned char *)off_26BADA8D0(&off_26BADA8D0) & 1) == 0)
  {
    sub_24C71247C();
    uint64_t v2 = (_DWORD *)off_26BADA8B8(&off_26BADA8B8);
    *uint64_t v2 = v4;
    do
    {
      uint64_t v5 = v3(&off_26BADA8B8);
      *(_DWORD *)(v5 + 4 * v7) = v6;
    }
    while (v7 != 623);
    *(void *)(v3(&off_26BADA8B8) + 2496) = 0;
    *(unsigned char *)v0(&off_26BADA8D0) = 1;
  }
  return off_26BADA8B8(&off_26BADA8B8);
}

uint64_t sub_24C712788(int a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  strerror_r(a1, __strerrbuf, 0x3FFuLL);
  sub_24C6E3D44((uint64_t)v4);
  size_t v1 = strlen(__strerrbuf);
  uint64_t v2 = sub_24C689D44(v4, (uint64_t)__strerrbuf, v1);
  sub_24C689D44(v2, (uint64_t)" Error #", 8);
  std::ostream::operator<<();
  std::stringbuf::str();
  v4[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v4 + *(void *)(v4[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v4[1] = MEMORY[0x263F8C318] + 16;
  if (v5 < 0) {
    operator delete((void *)v4[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x2532F88A0](&v6);
}

void sub_24C712918(_Unwind_Exception *exception_object)
{
}

unint64_t sub_24C712934(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    sub_24C712BC4();
  }
  return (a1 + a2 - 1) / a2 * a2;
}

void sub_24C71295C(std::string *this)
{
  LOBYTE(size) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
  }
  if ((size & 3) != 0)
  {
    do
    {
      std::string::push_back(this, 0);
      LOBYTE(v3) = *((unsigned char *)&this->__r_.__value_.__s + 23);
      if ((v3 & 0x80u) != 0) {
        std::string::size_type v3 = this->__r_.__value_.__l.__size_;
      }
    }
    while ((v3 & 3) != 0);
  }
}

void *sub_24C7129C0@<X0>(void *a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  unint64_t v4 = a1[1];
  BOOL v5 = v4 >= a2;
  unint64_t v6 = v4 - a2;
  if (v5)
  {
    *a1 += a2;
    a1[1] = v6;
    return sub_24C714634(a3);
  }
  else
  {
    unsigned int v9 = 13;
    uint64_t v7 = (void *)sub_24C6E3D44((uint64_t)v10);
    sub_24C689D44(v7, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/util.cc", 63);
    sub_24C689D44(v10, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_24C689D44(v10, (uint64_t)") [", 3);
    sub_24C689D44(v10, (uint64_t)"string.size() >= size", 21);
    sub_24C689D44(v10, (uint64_t)"] ", 2);
    sub_24C6E15D0(&v9, (uint64_t)a3);
    v10[0] = *MEMORY[0x263F8C2C8];
    *(void *)((char *)v10 + *(void *)(v10[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
    v10[1] = MEMORY[0x263F8C318] + 16;
    if (v11 < 0) {
      operator delete((void *)v10[9]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    return (void *)MEMORY[0x2532F88A0](&v12);
  }
}

void sub_24C712BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_24C712BC4()
{
}

uint64_t sub_24C712BF0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)sub_24C7000C8(a1);
  void *v4 = &unk_26FEDCD60;
  v4[1] = a2 + 16;
  sub_24C6E1E64((uint64_t)v4);
  return a1;
}

void sub_24C712C40(_Unwind_Exception *a1)
{
  sub_24C6E1860(v1);
  _Unwind_Resume(a1);
}

void *sub_24C712C58(uint64_t a1, uint64_t a2, _DWORD *a3, unint64_t a4)
{
  uint64_t result = (void *)sub_24C6E0978(a1, a2, a3, a4);
  *uint64_t result = &unk_26FEDCD60;
  return result;
}

void sub_24C712C90(void *a1)
{
  sub_24C6E1860(a1);
  JUMPOUT(0x2532F8960);
}

void sub_24C712CC8(uint64_t *a1@<X0>, unsigned char *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>, float a5@<S0>)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  (*(void (**)(void **__return_ptr))(*a1 + 16))(&v66);
  if (v66)
  {
    sub_24C71463C((uint64_t *)&v66);
LABEL_3:
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    return;
  }
  sub_24C71463C((uint64_t *)&v66);
  if (!a3) {
    goto LABEL_3;
  }
  v76 = 0;
  v77 = 0;
  uint64_t v78 = 0;
  std::string __p = 0;
  v74 = 0;
  v75 = 0;
  if (a3 >> 59) {
    sub_24C667470();
  }
  int v8 = 0;
  std::string __p = operator new(32 * a3);
  v74 = (char *)__p;
  v75 = (char *)__p + 32 * a3;
  memset(v71, 0, sizeof(v71));
  int v72 = 1065353216;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v69 = 0;
  uint64_t v70 = 256;
  v65[0] = (uint64_t)a1;
  v65[1] = (uint64_t)&v66;
  v65[2] = (uint64_t)&__p;
  v65[3] = (uint64_t)&v76;
  v65[4] = (uint64_t)v71;
  v66 = &unk_26FEDCFA0;
  do
  {
    long long v81 = 0uLL;
    int v9 = sub_24C6E9560(a1[2], a2, a3, (BOOL *)&v80 + 8);
    *(void *)&long long v81 = a2;
    *((void *)&v81 + 1) = v9;
    a3 -= v9;
    if (a3) {
      int v10 = v8 + 1;
    }
    else {
      int v10 = -1;
    }
    LODWORD(v80) = v8 - 1;
    DWORD1(v80) = v10;
    char v11 = v74;
    if (v74 >= v75)
    {
      unsigned __int8 v14 = (char *)__p;
      uint64_t v15 = (v74 - (unsigned char *)__p) >> 5;
      unint64_t v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 59) {
        sub_24C667470();
      }
      uint64_t v17 = v75 - (unsigned char *)__p;
      if ((v75 - (unsigned char *)__p) >> 4 > v16) {
        unint64_t v16 = v17 >> 4;
      }
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v18 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v16;
      }
      if (v18)
      {
        if (v18 >> 59) {
          sub_24C66DB48();
        }
        uint64_t v19 = (char *)operator new(32 * v18);
      }
      else
      {
        uint64_t v19 = 0;
      }
      long long v20 = v81;
      uint64_t v21 = &v19[32 * v15];
      *(_OWORD *)uint64_t v21 = v80;
      *((_OWORD *)v21 + 1) = v20;
      unsigned int v22 = v21;
      if (v11 != v14)
      {
        do
        {
          long long v23 = *((_OWORD *)v11 - 1);
          *((_OWORD *)v22 - 2) = *((_OWORD *)v11 - 2);
          *((_OWORD *)v22 - 1) = v23;
          v22 -= 32;
          v11 -= 32;
        }
        while (v11 != v14);
        char v11 = v14;
      }
      unsigned int v24 = &v19[32 * v18];
      int v13 = v21 + 32;
      std::string __p = v22;
      v74 = v21 + 32;
      v75 = v24;
      if (v11) {
        operator delete(v11);
      }
    }
    else
    {
      long long v12 = v81;
      *(_OWORD *)v74 = v80;
      *((_OWORD *)v11 + 1) = v12;
      int v13 = v11 + 32;
    }
    a2 += v9;
    ++v8;
    v74 = v13;
  }
  while (a3);
  if (__p == v13)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
  }
  else
  {
    if ((unint64_t)(v13 - (unsigned char *)__p) >= 0x21)
    {
      unint64_t v25 = 1;
      do
      {
        sub_24C71342C(v65, v25 - 1, v25);
        ++v25;
      }
      while (v25 < (v74 - (unsigned char *)__p) >> 5);
    }
    char v26 = (int **)v76;
    uint64_t v27 = v77;
    if (v76 != v77)
    {
      uint64_t v28 = 0;
      do
      {
        uint64_t v29 = *v26;
        if (v27 - (char *)v26 >= 9)
        {
          uint64_t v30 = 0;
          uint64_t v31 = (v27 - (char *)v26) >> 3;
          unsigned int v32 = v26;
          do
          {
            uint64_t v33 = v32;
            v32 += v30 + 1;
            uint64_t v34 = 2 * v30;
            uint64_t v30 = (2 * v30) | 1;
            uint64_t v35 = v34 + 2;
            if (v35 < v31)
            {
              unsigned int v36 = v32[1];
              float v37 = *((float *)*v32 + 2);
              float v38 = *((float *)v36 + 2);
              if (v37 < v38 || v37 == v38 && **v32 > *v36)
              {
                ++v32;
                uint64_t v30 = v35;
              }
            }
            std::string *v33 = *v32;
          }
          while (v30 <= (uint64_t)((unint64_t)(v31 - 2) >> 1));
          uint64_t v39 = (int **)(v27 - 8);
          if (v32 == v39)
          {
            void *v32 = v29;
          }
          else
          {
            void *v32 = *v39;
            *uint64_t v39 = v29;
            sub_24C7139A0((uint64_t)v26, (uint64_t)(v32 + 1), v32 + 1 - v26);
          }
        }
        v77 -= 8;
        int v40 = *v29;
        uint64_t v41 = *v29;
        uint64_t v42 = __p;
        uint64_t v43 = *((void *)__p + 4 * v41 + 3);
        if (!v43) {
          goto LABEL_58;
        }
        uint64_t v44 = v29[1];
        uint64_t v45 = *((void *)__p + 4 * v44 + 3);
        if (!v45) {
          goto LABEL_58;
        }
        uint64_t v46 = v45 + v43;
        if (v46 != *((void *)v29 + 2)) {
          goto LABEL_58;
        }
        if (a5 > 0.0)
        {
          if (a5 >= 1.0) {
            goto LABEL_58;
          }
          if (!v28) {
            uint64_t v28 = sub_24C7126D0();
          }
          unsigned int v47 = sub_24C6FC31C(v28);
          if (((double)v47 + (double)sub_24C6FC31C(v28) * 4294967300.0) * 5.42101086e-20 + 0.0 < a5) {
            goto LABEL_58;
          }
          uint64_t v42 = __p;
          int v40 = *v29;
          uint64_t v44 = v29[1];
          uint64_t v41 = *v29;
          uint64_t v46 = *((void *)__p + 4 * v44 + 3) + *((void *)__p + 4 * v41 + 3);
        }
        v48 = (char *)&v42[8 * v41];
        v49 = (char *)&v42[8 * v44];
        *((void *)v48 + 3) = v46;
        *((_DWORD *)v48 + 1) = *((_DWORD *)v49 + 1);
        uint64_t v50 = *((unsigned int *)v49 + 1);
        if ((v50 & 0x80000000) == 0) {
          v42[8 * v50] = v40;
        }
        *((void *)v49 + 2) = "";
        *((void *)v49 + 3) = 0;
        sub_24C71342C(v65, *((_DWORD *)__p + 8 * v41), v40);
        sub_24C71342C(v65, *v29, *((_DWORD *)__p + 8 * *v29 + 1));
LABEL_58:
        char v26 = (int **)v76;
        uint64_t v27 = v77;
      }
      while (v76 != v77);
    }
    v79[3] = 0;
    v51 = operator new(0x20uLL);
    void *v51 = &unk_26FEDD430;
    v51[1] = a1;
    v51[2] = v79;
    v51[3] = v71;
    *((void *)&v81 + 1) = v51;
    sub_24C714278(&v80, v79);
    sub_24C713D10(&v80);
    int v52 = 0;
    v53 = (void *)MEMORY[0x263F8C0F8];
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    do
    {
      if (v52 < 0)
      {
        LOBYTE(v80) = 1;
        v54 = sub_24C689D44(v53, (uint64_t)"bpe_model.cc", 12);
        sub_24C689D44(v54, (uint64_t)"(", 1);
        v55 = (void *)std::ostream::operator<<();
        v56 = sub_24C689D44(v55, (uint64_t)") [", 3);
        v57 = sub_24C689D44(v56, (uint64_t)"(index) >= (0)", 14);
        sub_24C689D44(v57, (uint64_t)"] ", 2);
        sub_24C6E3EDC(&v80);
      }
      v58 = __p;
      if (v52 >= (int)((unint64_t)(v74 - (unsigned char *)__p) >> 5))
      {
        LOBYTE(v80) = 1;
        v59 = sub_24C689D44(v53, (uint64_t)"bpe_model.cc", 12);
        sub_24C689D44(v59, (uint64_t)"(", 1);
        v60 = (void *)std::ostream::operator<<();
        v61 = sub_24C689D44(v60, (uint64_t)") [", 3);
        v62 = sub_24C689D44(v61, (uint64_t)"(index) < (static_cast<int>(symbols.size()))", 44);
        sub_24C689D44(v62, (uint64_t)"] ", 2);
        sub_24C6E3EDC(&v80);
        v58 = __p;
      }
      sub_24C71387C((uint64_t)v79, v58[4 * v52 + 2], v58[4 * v52 + 3], (uint64_t)a4);
      int v52 = *((_DWORD *)__p + 8 * v52 + 1);
    }
    while (v52 != -1);
    sub_24C713D10(v79);
  }
  sub_24C7138D8(&v66);
  sub_24C6A3918((uint64_t)v71);
  if (__p)
  {
    v74 = (char *)__p;
    operator delete(__p);
  }
  if (v76)
  {
    v77 = (char *)v76;
    operator delete(v76);
  }
}

void sub_24C713390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,void *a32,uint64_t a33)
{
  sub_24C713D10((void *)(v33 - 200));
  sub_24C7138D8(&a16);
  sub_24C6A3918((uint64_t)&a23);
  if (__p)
  {
    a30 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a32)
  {
    a33 = (uint64_t)a32;
    operator delete(a32);
  }
  _Unwind_Resume(a1);
}

__n128 sub_24C71342C(uint64_t *a1, int a2, int a3)
{
  if (a2 != -1 && a3 != -1)
  {
    uint64_t v4 = a2;
    uint64_t v5 = *(void *)a1[2];
    if (!*(unsigned char *)(v5 + 32 * a2 + 8))
    {
      uint64_t v6 = a3;
      uint64_t v7 = v5 + 32 * a3;
      if (!*(unsigned char *)(v7 + 8))
      {
        uint64_t v8 = *a1;
        uint64_t v9 = v5 + 32 * a2;
        int v10 = *(unsigned char **)(v9 + 16);
        uint64_t v11 = *(void *)(v7 + 24) + *(void *)(v9 + 24);
        v47[0] = v10;
        v47[1] = v11;
        long long v12 = *(unsigned int **)(v8 + 40);
        unsigned int v13 = *v12;
        if (v11)
        {
          uint64_t v14 = 0;
          uint64_t v15 = v11;
          while (1)
          {
            int v16 = *v10++;
            v14 ^= (v13 >> 10 << ((v13 >> 6) & 8)) ^ v16;
            unsigned int v13 = v12[v14];
            if ((v13 & 0x800000FF) != v16) {
              break;
            }
            if (!--v15) {
              goto LABEL_17;
            }
          }
        }
        else
        {
          int v17 = *v10;
          if (*v10)
          {
            uint64_t v14 = 0;
            unint64_t v18 = v10 + 1;
            while (1)
            {
              v14 ^= (v13 >> 10 << ((v13 >> 6) & 8)) ^ v17;
              unsigned int v13 = v12[v14];
              if ((v13 & 0x800000FF) != v17) {
                break;
              }
              int v19 = *v18++;
              int v17 = v19;
              if (!v19) {
                goto LABEL_17;
              }
            }
          }
          else
          {
            uint64_t v14 = 0;
LABEL_17:
            if ((v13 & 0x100) != 0)
            {
              unsigned int v20 = v12[v14 ^ (v13 >> 10 << ((v13 >> 6) & 8))];
              uint64_t v21 = (void *)a1[1];
              uint64_t v22 = v21[5];
              unint64_t v23 = v21[6];
              unint64_t v24 = v21[4];
              if (v24 >= v23)
              {
                unint64_t v24 = 0;
                ++v22;
                v21[4] = 0;
                v21[5] = v22;
              }
              uint64_t v25 = v21[1];
              if (v22 == (v21[2] - v25) >> 3)
              {
                is_mul_ok(v23, 0x18uLL);
                operator new[]();
              }
              uint64_t v26 = *(void *)(v25 + 8 * v22) + 24 * v24;
              v21[4] = v24 + 1;
              *(_DWORD *)uint64_t v26 = a2;
              *(_DWORD *)(v26 + 4) = a3;
              unsigned int v44 = v20 & 0x7FFFFFFF;
              *(float *)(v26 + 8) = (*(float (**)(uint64_t))(*(void *)v8 + 136))(v8);
              *(void *)(v26 + 16) = v11;
              uint64_t v27 = (uint64_t *)a1[3];
              uint64_t v29 = (void *)v27[1];
              unint64_t v28 = v27[2];
              if ((unint64_t)v29 >= v28)
              {
                uint64_t v32 = *v27;
                uint64_t v33 = ((uint64_t)v29 - *v27) >> 3;
                unint64_t v34 = v33 + 1;
                if ((unint64_t)(v33 + 1) >> 61) {
                  sub_24C667470();
                }
                uint64_t v35 = v28 - v32;
                if (v35 >> 2 > v34) {
                  unint64_t v34 = v35 >> 2;
                }
                if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v36 = v34;
                }
                if (v36)
                {
                  if (v36 >> 61) {
                    sub_24C66DB48();
                  }
                  float v37 = (char *)operator new(8 * v36);
                }
                else
                {
                  float v37 = 0;
                }
                float v38 = (uint64_t *)&v37[8 * v33];
                uint64_t *v38 = v26;
                uint64_t v30 = (uint64_t)(v38 + 1);
                if (v29 == (void *)v32)
                {
                  uint64_t v31 = v44;
                }
                else
                {
                  uint64_t v31 = v44;
                  do
                  {
                    uint64_t v39 = *--v29;
                    *--float v38 = v39;
                  }
                  while (v29 != (void *)v32);
                  uint64_t v29 = (void *)*v27;
                }
                uint64_t *v27 = (uint64_t)v38;
                v27[1] = v30;
                std::string v27[2] = (uint64_t)&v37[8 * v36];
                if (v29) {
                  operator delete(v29);
                }
              }
              else
              {
                void *v29 = v26;
                uint64_t v30 = (uint64_t)(v29 + 1);
                uint64_t v31 = v44;
              }
              v27[1] = v30;
              sub_24C7139A0(*v27, v30, (v30 - *v27) >> 3);
              if ((*(unsigned int (**)(void, uint64_t))(**(void **)(v8 + 8) + 128))(*(void *)(v8 + 8), v31))
              {
                uint64_t v41 = *(void *)a1[2];
                __n128 v45 = *(__n128 *)(v41 + 32 * v4 + 16);
                __n128 v46 = *(__n128 *)(v41 + 32 * v6 + 16);
                uint64_t v42 = a1[4];
                v48 = v47;
                uint64_t v43 = (__n128 *)sub_24C713A38(v42, (uint64_t)v47, (uint64_t)&unk_24C72FF38, &v48);
                __n128 result = v45;
                v43[2] = v45;
                v43[3] = v46;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_24C71387C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7[0] = a2;
  v7[1] = a3;
  uint64_t v6 = a4;
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4) {
    sub_24C66DAC0();
  }
  return (*(uint64_t (**)(uint64_t, void *, uint64_t *))(*(void *)v4 + 48))(v4, v7, &v6);
}

void *sub_24C7138D8(void *a1)
{
  *a1 = &unk_26FEDCFA0;
  uint64_t v2 = (void *)a1[1];
  std::string::size_type v3 = (void *)a1[2];
  if (v2 != v3)
  {
    do
    {
      if (*v2) {
        MEMORY[0x2532F8930](*v2, 0x1000C801E56706BLL);
      }
      ++v2;
    }
    while (v2 != v3);
    uint64_t v2 = (void *)a1[1];
  }
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_24C713968(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)a1 + 56))(0.0);
}

uint64_t sub_24C713990()
{
  return 1;
}

uint64_t sub_24C713998()
{
  return 0;
}

uint64_t sub_24C7139A0(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 - 2;
  if (a3 >= 2)
  {
    unint64_t v4 = v3 >> 1;
    uint64_t v5 = result + 8 * (v3 >> 1);
    uint64_t v6 = *(_DWORD **)v5;
    uint64_t v7 = *(void *)(a2 - 8);
    float v8 = *(float *)(*(void *)v5 + 8);
    float v9 = *(float *)(v7 + 8);
    if (v8 < v9 || v8 == v9 && *v6 > *(_DWORD *)v7)
    {
      *(void *)(a2 - 8) = v6;
      if (v3 >= 2)
      {
        while (1)
        {
          unint64_t v11 = v4 - 1;
          unint64_t v4 = (v4 - 1) >> 1;
          uint64_t v10 = result + 8 * v4;
          long long v12 = *(_DWORD **)v10;
          float v13 = *(float *)(*(void *)v10 + 8);
          if (v13 >= v9 && (v13 != v9 || *v12 <= *(_DWORD *)v7)) {
            break;
          }
          *(void *)uint64_t v5 = v12;
          uint64_t v5 = result + 8 * v4;
          if (v11 <= 1) {
            goto LABEL_11;
          }
        }
      }
      uint64_t v10 = v5;
LABEL_11:
      *(void *)uint64_t v10 = v7;
    }
  }
  return result;
}

void *sub_24C713A38(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD **a4)
{
  float v8 = (void *)(a1 + 24);
  unint64_t v9 = sub_24C713CB0(a1 + 24, *(uint64_t **)a2, *(void *)(a2 + 8));
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    uint64_t v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      uint64_t v15 = *v14;
      if (*v14)
      {
        uint64_t v18 = a2;
        int v16 = *(uint64_t **)a2;
        size_t v17 = *(void *)(v18 + 8);
        do
        {
          unint64_t v19 = *((void *)v15 + 1);
          if (v19 == v10)
          {
            if (*((void *)v15 + 3) == v17 && !memcmp(*((const void **)v15 + 2), v16, v17)) {
              return v15;
            }
          }
          else
          {
            if (v13 > 1)
            {
              if (v19 >= v11) {
                v19 %= v11;
              }
            }
            else
            {
              v19 &= v11 - 1;
            }
            if (v19 != v4) {
              break;
            }
          }
          uint64_t v15 = *(void **)v15;
        }
        while (v15);
      }
    }
  }
  uint64_t v15 = operator new(0x40uLL);
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = v10;
  *((_OWORD *)v15 + 1) = **a4;
  *((_OWORD *)v15 + 2) = 0u;
  *((_OWORD *)v15 + 3) = 0u;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    sub_24C6E440C(a1, v25);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v26 = *(void *)a1;
  uint64_t v27 = *(void **)(*(void *)a1 + 8 * v4);
  if (v27)
  {
    *(void *)uint64_t v15 = *v27;
LABEL_40:
    void *v27 = v15;
    goto LABEL_41;
  }
  *(void *)uint64_t v15 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v15;
  *(void *)(v26 + 8 * v4) = a1 + 16;
  if (*(void *)v15)
  {
    unint64_t v28 = *(void *)(*(void *)v15 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v28 >= v11) {
        v28 %= v11;
      }
    }
    else
    {
      v28 &= v11 - 1;
    }
    uint64_t v27 = (void *)(*(void *)a1 + 8 * v28);
    goto LABEL_40;
  }
LABEL_41:
  ++*v8;
  return v15;
}

void sub_24C713C9C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unint64_t sub_24C713CB0(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  return sub_24C66F398((uint64_t)&v4, a2, a3);
}

void sub_24C713CD8(void *a1)
{
  sub_24C7138D8(a1);
  JUMPOUT(0x2532F8960);
}

void *sub_24C713D10(void *a1)
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

void sub_24C713D98()
{
}

__n128 sub_24C713DAC(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26FEDD430;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 sub_24C713E00(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26FEDD430;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_24C713E38(uint64_t a1, void *a2, void ***a3)
{
  uint64_t v4 = a2[1];
  uint64_t v5 = *a3;
  *(void *)&long long v33 = *a2;
  *((void *)&v33 + 1) = v4;
  uint64_t v6 = *(void ***)(a1 + 8);
  uint64_t v7 = ((uint64_t (*)(void **, void, uint64_t))(*v6)[14])(v6, v33, v4);
  if (v7 == -1 || ((*(uint64_t (**)(void *, uint64_t))(*v6[1] + 128))(v6[1], v7) & 1) == 0)
  {
    unint64_t v10 = (char *)v5[2];
    unint64_t v11 = (char *)v5[1];
    if (v11 >= v10)
    {
      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((v11 - (unsigned char *)*v5) >> 3);
      unint64_t v14 = v13 + 1;
      if (v13 + 1 <= 0xAAAAAAAAAAAAAAALL)
      {
        unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v10 - (unsigned char *)*v5) >> 3);
        if (2 * v15 > v14) {
          unint64_t v14 = 2 * v15;
        }
        if (v15 >= 0x555555555555555) {
          unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v16 = v14;
        }
        size_t v17 = (char *)sub_24C6E4854((uint64_t)(v5 + 2), v16);
        uint64_t v18 = &v17[24 * v13];
        float v20 = &v17[24 * v19];
        *(_OWORD *)uint64_t v18 = v33;
        *((_DWORD *)v18 + 4) = v7;
        uint8x8_t v12 = v18 + 24;
        BOOL v22 = (char *)*v5;
        float v21 = (char *)v5[1];
        if (v21 == *v5) {
          goto LABEL_16;
        }
        do
        {
          long long v23 = *(_OWORD *)(v21 - 24);
          *((void *)v18 - 1) = *((void *)v21 - 1);
          *(_OWORD *)(v18 - 24) = v23;
          v18 -= 24;
          v21 -= 24;
        }
        while (v21 != v22);
        goto LABEL_15;
      }
LABEL_30:
      sub_24C667470();
    }
  }
  else
  {
    float v8 = sub_24C714110(*(void **)(a1 + 24), (uint64_t)&v33);
    if (v8)
    {
      unint64_t v9 = (uint64_t *)v8;
      sub_24C71387C(*(void *)(a1 + 16), v9[4], v9[5], (uint64_t)v5);
      sub_24C71387C(*(void *)(a1 + 16), v9[6], v9[7], (uint64_t)v5);
      return;
    }
    unint64_t v24 = (char *)v5[2];
    unint64_t v11 = (char *)v5[1];
    if (v11 >= v24)
    {
      unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((v11 - (unsigned char *)*v5) >> 3);
      unint64_t v26 = v25 + 1;
      if (v25 + 1 <= 0xAAAAAAAAAAAAAAALL)
      {
        unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (unsigned char *)*v5) >> 3);
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x555555555555555) {
          unint64_t v28 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v28 = v26;
        }
        uint64_t v29 = (char *)sub_24C6E4854((uint64_t)(v5 + 2), v28);
        uint64_t v18 = &v29[24 * v25];
        float v20 = &v29[24 * v30];
        *(_OWORD *)uint64_t v18 = v33;
        *((_DWORD *)v18 + 4) = v7;
        uint8x8_t v12 = v18 + 24;
        uint64_t v31 = (char *)*v5;
        float v21 = (char *)v5[1];
        if (v21 == *v5) {
          goto LABEL_16;
        }
        do
        {
          long long v32 = *(_OWORD *)(v21 - 24);
          *((void *)v18 - 1) = *((void *)v21 - 1);
          *(_OWORD *)(v18 - 24) = v32;
          v18 -= 24;
          v21 -= 24;
        }
        while (v21 != v31);
LABEL_15:
        float v21 = (char *)*v5;
LABEL_16:
        *uint64_t v5 = v18;
        v5[1] = v12;
        v5[2] = v20;
        if (v21) {
          operator delete(v21);
        }
        goto LABEL_18;
      }
      goto LABEL_30;
    }
  }
  *(_OWORD *)unint64_t v11 = v33;
  *((_DWORD *)v11 + 4) = v7;
  uint8x8_t v12 = v11 + 24;
LABEL_18:
  v5[1] = v12;
}

uint64_t sub_24C7140C4(uint64_t a1, uint64_t a2)
{
  if (sub_24C714228(a2, (uint64_t)&unk_26FEDC1E8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_24C714104()
{
  return &unk_26FEDC1E8;
}

uint64_t **sub_24C714110(void *a1, uint64_t a2)
{
  unint64_t v4 = sub_24C713CB0((uint64_t)(a1 + 3), *(uint64_t **)a2, *(void *)(a2 + 8));
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  unint64_t v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  unint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v14 = a2;
    uint8x8_t v12 = *(uint64_t **)a2;
    size_t v13 = *(void *)(v14 + 8);
    do
    {
      unint64_t v15 = (unint64_t)v11[1];
      if (v15 == v6)
      {
        if (v11[3] == (uint64_t *)v13 && !memcmp(v11[2], v12, v13)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v15 >= *(void *)&v5) {
            v15 %= *(void *)&v5;
          }
        }
        else
        {
          v15 &= *(void *)&v5 - 1;
        }
        if (v15 != v9) {
          return 0;
        }
      }
      unint64_t v11 = (uint64_t **)*v11;
    }
    while (v11);
  }
  return v11;
}

BOOL sub_24C714228(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *sub_24C714278(void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    unint64_t v4 = (void *)result[3];
    int8x8_t v5 = (void *)a2[3];
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
        __n128 result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
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

void sub_24C7144D8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_24C669A24(a1);
}

void sub_24C7144E4()
{
  if (!dword_2697ED808)
  {
    unsigned int v0 = sub_24C714530(MEMORY[0x263F8C0F8], "Program terminated with an unrecoverable error.");
    size_t v1 = sub_24C714578(v0);
    sub_24C714630(v1);
    exit(-1);
  }
  dword_2697ED808 = 2;
}

void *sub_24C714530(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  return sub_24C689D44(a1, (uint64_t)__s, v4);
}

void *sub_24C714578(void *a1)
{
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  uint64_t v2 = std::locale::use_facet(&v4, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_24C71461C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void *sub_24C714634(void *result)
{
  *__n128 result = 0;
  return result;
}

uint64_t *sub_24C71463C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2) {
    sub_24C714A44((uint64_t)a1, v2);
  }
  return a1;
}

void sub_24C714674()
{
}

void sub_24C714780(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *v1;
  *size_t v1 = 0;
  if (v3) {
    sub_24C714A44((uint64_t)v1, v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_24C7147A4(void *result, void *a2)
{
  if (*a2) {
    operator new();
  }
  *__n128 result = 0;
  return result;
}

void sub_24C714834(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0x1012C40849EBCB1);
  _Unwind_Resume(a1);
}

void sub_24C71485C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  if (*a1 != *a2)
  {
    if (*a2) {
      operator new();
    }
    *a1 = 0;
    if (v3)
    {
      sub_24C714A44((uint64_t)a1, v3);
    }
  }
}

void sub_24C714920(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0x1012C40849EBCB1);
  _Unwind_Resume(a1);
}

const char *sub_24C714944(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (!*a1) {
    return "";
  }
  __n128 result = (const char *)(v1 + 8);
  if (*(char *)(v1 + 31) < 0) {
    return *(const char **)result;
  }
  return result;
}

std::string *sub_24C714970@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v3 = *(_DWORD **)a1;
  if (*(void *)a1)
  {
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    unsigned int v5 = *v3 - 1;
    if (v5 < 0x10) {
      MEMORY[0x2532F8560](a2, off_2652E8280[v5]);
    }
    std::string::append(a2, ": ");
    int v6 = *(char *)(*(void *)a1 + 31);
    if (v6 >= 0) {
      uint8x8_t v7 = (const std::string::value_type *)(*(void *)a1 + 8);
    }
    else {
      uint8x8_t v7 = *(const std::string::value_type **)(*(void *)a1 + 8);
    }
    if (v6 >= 0) {
      std::string::size_type v8 = *(unsigned __int8 *)(*(void *)a1 + 31);
    }
    else {
      std::string::size_type v8 = *(void *)(*(void *)a1 + 16);
    }
    return std::string::append(a2, v7, v8);
  }
  else
  {
    return (std::string *)sub_24C6698FC(a2, "OK");
  }
}

void sub_24C714A28(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_24C714A44(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(char *)(a2 + 31) < 0) {
      operator delete(*(void **)(a2 + 8));
    }
    JUMPOUT(0x2532F8960);
  }
}

void *sub_24C714AA0()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2697ED410, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2697ED410))
  {
    operator new();
  }
  unsigned int v0 = (pthread_key_t *)qword_2697ED408;
  return sub_24C714B70(v0);
}

void sub_24C714B38(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0x1000C4000313F17);
  __cxa_guard_abort(&qword_2697ED410);
  _Unwind_Resume(a1);
}

void *sub_24C714B70(pthread_key_t *a1)
{
  uint64_t v2 = pthread_getspecific(*a1);
  if (!v2)
  {
    uint64_t v2 = operator new(0x40uLL, (std::align_val_t)0x40uLL);
    *(_OWORD *)uint64_t v2 = xmmword_24C730FB0;
    v2[2] = 0;
    pthread_setspecific(*a1, v2);
  }
  return v2;
}

uint64_t sub_24C714BDC(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 16) < a2)
  {
    sub_24C716A34((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/arena_impl.h", 111);
    std::locale v4 = sub_24C716A4C(v7, "CHECK failed: n <= size_: ");
    sub_24C716B88((uint64_t)&v6, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v7);
  }
  return a1 + a2;
}

void sub_24C714C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_24C714C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = v6 + 72;
  if (v6 + 72 > *(void *)(a1 + 16))
  {
    sub_24C716A34((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/arena.cc", 398);
    std::string::size_type v8 = sub_24C716A4C(v13, "CHECK failed: (pos + ArenaImpl::kSerialArenaSize) <= (b->size()): ");
    sub_24C716B88((uint64_t)&v12, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v13);
  }
  unint64_t v9 = (void *)sub_24C714BDC(a1, v6);
  *(void *)(a1 + 8) = v7;
  void *v9 = a3;
  v9[1] = a2;
  v9[2] = a1;
  v9[5] = sub_24C714BDC(a1, v7);
  uint64_t v10 = sub_24C714BDC(a1, *(void *)(a1 + 16));
  v9[3] = 0;
  v9[7] = 0;
  v9[8] = 0;
  v9[6] = v10;
  return v9;
}

void sub_24C714D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C714D88(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_24C714DA4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (a2 == -1)
  {
    if (v5) {
      unint64_t v7 = *(void *)v5;
    }
    else {
      unint64_t v7 = 256;
    }
  }
  else
  {
    if (v5) {
      unint64_t v6 = *(void *)(v5 + 8);
    }
    else {
      unint64_t v6 = 0x2000;
    }
    if (v6 >= 2 * a2) {
      unint64_t v7 = 2 * a2;
    }
    else {
      unint64_t v7 = v6;
    }
  }
  if (a3 >= 0xFFFFFFFFFFFFFFE8)
  {
    sub_24C716A34((uint64_t)v12, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/arena.cc", 245);
    std::string::size_type v8 = sub_24C716A4C(v12, "CHECK failed: (min_bytes) <= (std::numeric_limits<size_t>::max() - kBlockHeaderSize): ");
    sub_24C716B88((uint64_t)&v11, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v12);
    uint64_t v5 = *(void *)(a1 + 32);
  }
  if (v7 <= a3 + 24) {
    size_t v9 = a3 + 24;
  }
  else {
    size_t v9 = v7;
  }
  if (v5) {
    __n128 result = (void *)(*(uint64_t (**)(size_t))(v5 + 16))(v9);
  }
  else {
    __n128 result = operator new(v9);
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 16), v9, memory_order_relaxed);
  return result;
}

void sub_24C714E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_24C714EA8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a1) {
    uint64_t v6 = *(void *)(a1 + 16);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = (uint64_t *)sub_24C714DA4(a3, v6, a2);
  return sub_24C715438(v7, v8, a1, 0, 0);
}

void *sub_24C714F04(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  __n128 result = (void *)a1[3];
  do
  {
    if (result)
    {
      if ((unint64_t)(2 * *result) >= 0x40) {
        uint64_t v7 = 64;
      }
      else {
        uint64_t v7 = 2 * *result;
      }
    }
    else
    {
      uint64_t v7 = 8;
    }
    __n128 result = (void *)sub_24C714F9C(a1, (16 * (_WORD)v7 + 23) & 0xFF0);
    uint64_t v8 = a1[3];
    *__n128 result = v7;
    result[1] = v8;
    a1[3] = (uint64_t)result;
    a1[7] = (uint64_t)(result + 2);
    a1[8] = (uint64_t)&result[2 * v7 + 2];
  }
  while (!(16 * v7));
  result[2] = a2;
  result[3] = a3;
  a1[7] = (uint64_t)(result + 4);
  return result;
}

unint64_t sub_24C714F9C(uint64_t *a1, unint64_t a2)
{
  if (((a2 + 7) & 0xFFFFFFFFFFFFFFF8) != a2)
  {
    sub_24C716A34((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/arena_impl.h", 159);
    std::locale v4 = sub_24C716A4C(v9, "CHECK failed: (internal::AlignUpTo8(n)) == (n): ");
    sub_24C716B88((uint64_t)&v8, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v9);
  }
  unint64_t result = a1[5];
  unint64_t v6 = a1[6];
  if (v6 < result)
  {
    sub_24C716A34((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/arena_impl.h", 160);
    uint64_t v7 = sub_24C716A4C(v9, "CHECK failed: (limit_) >= (ptr_): ");
    sub_24C716B88((uint64_t)&v8, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v9);
    unint64_t result = a1[5];
    unint64_t v6 = a1[6];
  }
  if (v6 - result < a2) {
    return sub_24C715324(a1, a2);
  }
  a1[5] = result + a2;
  return result;
}

void sub_24C715084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t sub_24C7150A4(void *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24C714AA0();
  if (v6[1] == a1[3])
  {
    explicit = (uint64_t *)v6[2];
    goto LABEL_3;
  }
  size_t v9 = sub_24C714AA0();
  explicit = (uint64_t *)atomic_load_explicit(a1 + 1, memory_order_acquire);
  if (explicit && (void *)explicit[1] == v9)
  {
LABEL_3:
    return sub_24C715150(explicit, a2, a3);
  }
  return sub_24C7151B0(a1, a2, a3);
}

unint64_t sub_24C715150(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v5 = sub_24C714F9C(a1, a2);
  unint64_t v6 = v5;
  uint64_t v7 = (unint64_t *)a1[7];
  if (v7 == (unint64_t *)a1[8])
  {
    sub_24C714F04(a1, v5, a3);
  }
  else
  {
    *uint64_t v7 = v5;
    v7[1] = a3;
    a1[7] = (uint64_t)(v7 + 2);
  }
  return v6;
}

unint64_t sub_24C7151B0(void *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24C714AA0();
  uint64_t v7 = (uint64_t *)sub_24C71525C(a1, (uint64_t)v6);
  return sub_24C715150(v7, a2, a3);
}

unint64_t sub_24C715214(void *a1, unint64_t a2)
{
  std::locale v4 = sub_24C714AA0();
  unint64_t v5 = (uint64_t *)sub_24C71525C(a1, (uint64_t)v4);
  return sub_24C714F9C(v5, a2);
}

unint64_t sub_24C71525C(void *a1, uint64_t a2)
{
  unint64_t explicit = atomic_load_explicit(a1, memory_order_acquire);
  if (explicit)
  {
    while (*(void *)(explicit + 8) != a2)
    {
      unint64_t explicit = *(void *)(explicit + 32);
      if (!explicit) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    unint64_t v5 = sub_24C714DA4((uint64_t)a1, -1, 0x48uLL);
    *(_OWORD *)unint64_t v5 = xmmword_24C730FC0;
    v5[2] = v6;
    uint64_t v7 = sub_24C714C88((uint64_t)v5, a2, (uint64_t)a1);
    unint64_t explicit = (unint64_t)v7;
    atomic_ullong v8 = *a1;
    v7[4] = *a1;
    atomic_ullong v9 = v8;
    atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v9, (unint64_t)v7, memory_order_release, memory_order_relaxed);
    if (v9 != v8)
    {
      atomic_ullong v10 = v9;
      do
      {
        v7[4] = v9;
        atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v10, (unint64_t)v7, memory_order_release, memory_order_relaxed);
        BOOL v11 = v10 == v9;
        atomic_ullong v9 = v10;
      }
      while (!v11);
    }
  }
  sub_24C714AA0()[2] = explicit;
  uint64_t v12 = a1[3];
  sub_24C714AA0()[1] = v12;
  atomic_store(explicit, a1 + 1);
  return explicit;
}

uint64_t sub_24C715324(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  *(void *)(v4 + 8) = *(void *)(v4 + 16) - a1[6] + a1[5];
  unint64_t v5 = sub_24C714EA8(v4, a2, *a1);
  a1[2] = (uint64_t)v5;
  a1[5] = sub_24C714BDC((uint64_t)v5, v5[1]);
  a1[6] = sub_24C714BDC(a1[2], *(void *)(a1[2] + 16));
  return sub_24C714F9C(a1, a2);
}

unint64_t sub_24C7153A4(void *a1, unint64_t a2)
{
  uint64_t v4 = sub_24C714AA0();
  if (v4[1] == a1[3])
  {
    unint64_t explicit = (uint64_t *)v4[2];
    goto LABEL_3;
  }
  uint64_t v7 = sub_24C714AA0();
  unint64_t explicit = (uint64_t *)atomic_load_explicit(a1 + 1, memory_order_acquire);
  if (explicit && (void *)explicit[1] == v7)
  {
LABEL_3:
    return sub_24C714F9C(explicit, a2);
  }
  return sub_24C715214(a1, a2);
}

uint64_t *sub_24C715438(uint64_t *a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  uint64_t v6 = 2;
  if (!a5) {
    uint64_t v6 = 0;
  }
  *a1 = v6 | a4 | a3;
  a1[1] = 24;
  a1[2] = a2;
  if ((a3 & 3) != 0)
  {
    sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/arena_impl.h", 107);
    uint64_t v7 = sub_24C716A4C(v10, "CHECK failed: (reinterpret_cast<uintptr_t>(next) & 3) == (0u): ");
    sub_24C716B88((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v10);
  }
  return a1;
}

void sub_24C7154CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7154E4(uint64_t result)
{
  if (result) {
    JUMPOUT(0x2532F8950);
  }
  return result;
}

unint64_t sub_24C7154F4(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2697ED2A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2697ED2A8))
  {
    __cxa_atexit((void (*)(void *))std::mutex::~mutex, &stru_2697ECFD8, &dword_24C664000);
    __cxa_guard_release(&qword_2697ED2A8);
  }
  std::mutex::lock(&stru_2697ECFD8);
  unint64_t explicit = atomic_load_explicit(a1 + 3, memory_order_acquire);
  if (!explicit)
  {
    sub_24C6E9D30(a1, (void *)*a1, a1[1]);
    atomic_store((unint64_t)a1, a1 + 3);
    unint64_t explicit = (unint64_t)a1;
  }
  std::mutex::unlock(&stru_2697ECFD8);
  return explicit;
}

unint64_t sub_24C7155B0(uint64_t *a1, uint64_t a2, long long *a3, uint64_t a4)
{
  if (*a1 != a2)
  {
    sub_24C7076A8(a1);
    JUMPOUT(0x2532F8570);
  }
  if (!a4) {
    operator new();
  }
  if (*(unsigned char *)(a4 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a4 + 32) + 32) + 40))(*(void *)(*(void *)(a4 + 32) + 32), &unk_26FEDC168, 24);
  }
  unint64_t result = sub_24C7150A4((void *)a4, 0x18uLL, (uint64_t)sub_24C710EB4);
  unint64_t v8 = result;
  if (*((char *)a3 + 23) < 0)
  {
    unint64_t result = (unint64_t)sub_24C66E0A8((unsigned char *)result, *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v9 = *a3;
    *(void *)(result + 16) = *((void *)a3 + 2);
    *(_OWORD *)unint64_t result = v9;
  }
  *a1 = v8;
  return result;
}

void sub_24C715708(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

void sub_24C71572C(uint64_t *a1, uint64_t a2, long long *a3, uint64_t a4)
{
  if (*a1 == a2)
  {
    if (!a4) {
      operator new();
    }
    if (*(unsigned char *)(a4 + 24))
    {
      uint64_t v11 = a4;
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a4 + 32) + 32) + 40))(*(void *)(*(void *)(a4 + 32) + 32), &unk_26FEDC168, 24);
      a4 = v11;
    }
    unint64_t v9 = sub_24C7150A4((void *)a4, 0x18uLL, (uint64_t)sub_24C710EB4);
    uint64_t v10 = *((void *)a3 + 2);
    *(_OWORD *)unint64_t v9 = *a3;
    *(void *)(v9 + 16) = v10;
    *((void *)a3 + 1) = 0;
    *((void *)a3 + 2) = 0;
    *(void *)a3 = 0;
    *a1 = v9;
  }
  else
  {
    uint64_t v6 = sub_24C7076A8(a1);
    uint64_t v7 = v6;
    if (*(char *)(v6 + 23) < 0) {
      operator delete(*(void **)v6);
    }
    long long v8 = *a3;
    *(void *)(v7 + 16) = *((void *)a3 + 2);
    *(_OWORD *)uint64_t v7 = v8;
    *((unsigned char *)a3 + 23) = 0;
    *(unsigned char *)a3 = 0;
  }
}

unint64_t sub_24C715858(uint64_t *a1, long long *a2, uint64_t a3)
{
  return sub_24C7155B0(a1, (uint64_t)&qword_2697ED438, a2, a3);
}

void sub_24C71586C(uint64_t *a1, long long *a2, uint64_t a3)
{
}

unint64_t sub_24C715880(uint64_t *a1, long long *a2, uint64_t a3)
{
  return sub_24C7155B0(a1, 0, a2, a3);
}

uint64_t *sub_24C715890(uint64_t *a1, uint64_t a2)
{
  if ((uint64_t *)*a1 == &qword_2697ED438) {
    return sub_24C7158AC((uint64_t **)a1, a2);
  }
  else {
    return (uint64_t *)sub_24C7076A8(a1);
  }
}

uint64_t *sub_24C7158AC(uint64_t **a1, uint64_t a2)
{
  if (*a1 != &qword_2697ED438)
  {
    sub_24C716A34((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/arenastring.cc", 147);
    uint64_t v4 = sub_24C716A4C(v7, "CHECK failed: IsDefault(default_value): ");
    sub_24C716B88((uint64_t)&v6, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v7);
  }
  if (!a2) {
    operator new();
  }
  if (*(unsigned char *)(a2 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a2 + 32) + 32) + 40))(*(void *)(*(void *)(a2 + 32) + 32), &unk_26FEDC168, 24);
  }
  unint64_t result = (uint64_t *)sub_24C7150A4((void *)a2, 0x18uLL, (uint64_t)sub_24C710EB4);
  *unint64_t result = 0;
  result[1] = 0;
  result[2] = 0;
  *a1 = result;
  return result;
}

void sub_24C7159B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t sub_24C7159CC(uint64_t *a1, void *a2, uint64_t a3)
{
  if (*a1) {
    return sub_24C7076A8(a1);
  }
  else {
    return sub_24C7159E8((unint64_t *)a1, a3, a2);
  }
}

unint64_t sub_24C7159E8(unint64_t *a1, uint64_t a2, void *a3)
{
  if (*a1)
  {
    sub_24C716A34((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/arenastring.cc", 147);
    char v6 = sub_24C716A4C(v13, "CHECK failed: IsDefault(default_value): ");
    sub_24C716B88((uint64_t)&v12, (const char **)&v6->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v13);
  }
  unint64_t explicit = atomic_load_explicit(a3 + 3, memory_order_acquire);
  if (explicit)
  {
    if (a2) {
      goto LABEL_5;
    }
LABEL_10:
    operator new();
  }
  unint64_t explicit = sub_24C7154F4(a3);
  if (!a2) {
    goto LABEL_10;
  }
LABEL_5:
  if (*(unsigned char *)(a2 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a2 + 32) + 32) + 40))(*(void *)(*(void *)(a2 + 32) + 32), &unk_26FEDC168, 24);
  }
  unint64_t v8 = sub_24C7150A4((void *)a2, 0x18uLL, (uint64_t)sub_24C710EB4);
  unint64_t v9 = v8;
  if (*(char *)(explicit + 23) < 0)
  {
    sub_24C66E0A8((unsigned char *)v8, *(void **)explicit, *(void *)(explicit + 8));
  }
  else
  {
    long long v10 = *(_OWORD *)explicit;
    *(void *)(v8 + 16) = *(void *)(explicit + 16);
    *(_OWORD *)unint64_t v8 = v10;
  }
  *a1 = v9;
  return v9;
}

void sub_24C715B4C(_Unwind_Exception *a1)
{
  MEMORY[0x2532F8960](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

std::string *sub_24C715B84(std::string *result, void *a2)
{
  if (result->__r_.__value_.__r.__words[0])
  {
    uint64_t v3 = (std::string *)sub_24C7076A8((uint64_t *)result);
    unint64_t explicit = (const std::string *)atomic_load_explicit(a2 + 3, memory_order_acquire);
    if (!explicit) {
      unint64_t explicit = (const std::string *)sub_24C7154F4(a2);
    }
    return std::string::operator=(v3, explicit);
  }
  return result;
}

int64_t sub_24C715BF0(uint64_t a1, char *a2)
{
  while (1)
  {
    unint64_t v5 = *(char **)a1;
    uint64_t v4 = *(void **)(a1 + 8);
    if (!v4)
    {
      int64_t v10 = v5 - a2;
      int64_t v9 = v10 + 16;
      *(void *)(a1 + 8) = a2;
      if (((v10 + 16) & 0x80000000) == 0) {
        return v9;
      }
      goto LABEL_12;
    }
    int v6 = a2 - v5;
    if (a2 <= v5) {
      break;
    }
    if (*(unsigned char *)(a1 + 56))
    {
      sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 685);
      uint64_t v7 = sub_24C716A4C(v15, "CHECK failed: !had_error_: ");
      sub_24C716B88((uint64_t)&v14, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v15);
    }
    if (v6 >= 17)
    {
      sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 686);
      unint64_t v8 = sub_24C716A4C(v15, "CHECK failed: overrun <= kSlopBytes: ");
      sub_24C716B88((uint64_t)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v15);
    }
    a2 = &sub_24C715D88((char **)a1)[v6];
    if (*(unsigned char *)(a1 + 56)) {
      return 0;
    }
  }
  memcpy(v4, (const void *)(a1 + 16), (size_t)&a2[-a1 - 16]);
  uint64_t v11 = *(char **)a1;
  *(void *)(a1 + 8) += &a2[-a1 - 16];
  int64_t v9 = v11 - a2;
  if (((v11 - a2) & 0x80000000) == 0) {
    return v9;
  }
LABEL_12:
  sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 700);
  char v12 = sub_24C716A4C(v15, "CHECK failed: s >= 0: ");
  sub_24C716B88((uint64_t)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
  sub_24C716B90((uint64_t)v15);
  return v9;
}

void sub_24C715D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_24C715D88(char **a1)
{
  if (*((unsigned char *)a1 + 56))
  {
    sub_24C716A34((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 788);
    uint64_t v2 = sub_24C716A4C(v13, "CHECK failed: !had_error_: ");
    sub_24C716B88((uint64_t)&v12, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v13);
  }
  if (a1[6])
  {
    uint64_t v3 = (char *)(a1 + 2);
    unint64_t v5 = *a1;
    uint64_t v4 = a1[1];
    if (v4)
    {
      memcpy(v4, a1 + 2, v5 - v3);
      int v12 = 0;
      do
      {
        v13[0].__r_.__value_.__r.__words[0] = 0;
        if (((*(uint64_t (**)(char *, std::string *, int *))(*(void *)a1[6] + 16))(a1[6], v13, &v12) & 1) == 0)
        {
          *((unsigned char *)a1 + 56) = 1;
          goto LABEL_14;
        }
        uint64_t v6 = v12;
      }
      while (!v12);
      unint64_t v5 = (char *)v13[0].__r_.__value_.__r.__words[0];
      if (v12 >= 17)
      {
        *(_OWORD *)v13[0].__r_.__value_.__l.__data_ = *(_OWORD *)*a1;
        *a1 = &v5[v6 - 16];
        a1[1] = 0;
        return v5;
      }
      if (v12 <= 0)
      {
        std::string::size_type v10 = v13[0].__r_.__value_.__r.__words[0];
        sub_24C716A34((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 810);
        int64_t v9 = sub_24C716A4C(v13, "CHECK failed: size > 0: ");
        sub_24C716B88((uint64_t)&v11, (const char **)&v9->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)v13);
        LODWORD(v6) = v12;
        unint64_t v5 = (char *)v10;
      }
      *(_OWORD *)uint64_t v3 = *(_OWORD *)*a1;
      uint64_t v7 = &v3[(int)v6];
    }
    else
    {
      *(_OWORD *)uint64_t v3 = *(_OWORD *)v5;
      uint64_t v7 = (char *)(a1 + 4);
    }
    *a1 = v7;
    a1[1] = v5;
  }
  else
  {
    *((unsigned char *)a1 + 56) = 1;
    uint64_t v3 = (char *)(a1 + 2);
LABEL_14:
    *a1 = (char *)(a1 + 4);
  }
  return v3;
}

void sub_24C715F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_24C715F40(uint64_t a1, char *a2)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    int64_t v3 = sub_24C715BF0(a1, a2);
    if (v3) {
      (*(void (**)(void, int64_t))(**(void **)(a1 + 48) + 24))(*(void *)(a1 + 48), v3);
    }
    a2 = (char *)(a1 + 16);
    *(void *)a1 = a1 + 16;
    *(void *)(a1 + 8) = a1 + 16;
  }
  return a2;
}

char *sub_24C715FA8(uint64_t a1, char *a2)
{
  while (!*(unsigned char *)(a1 + 56))
  {
    int64_t v3 = &a2[-*(void *)a1];
    if ((v3 & 0x80000000) != 0)
    {
      sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 829);
      unint64_t v5 = sub_24C716A4C(v8, "CHECK failed: overrun >= 0: ");
      sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
      goto LABEL_6;
    }
    if (v3 > 0x10)
    {
      sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 830);
      uint64_t v4 = sub_24C716A4C(v8, "CHECK failed: overrun <= kSlopBytes: ");
      sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
LABEL_6:
      sub_24C716B90((uint64_t)v8);
    }
    a2 = &sub_24C715D88((char **)a1)[(int)v3];
    if ((unint64_t)a2 < *(void *)a1) {
      return a2;
    }
  }
  return (char *)(a1 + 16);
}

void sub_24C71609C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_24C7160BC(uint64_t *a1, char *a2, int a3, unint64_t a4)
{
  uint64_t v4 = (char *)a4;
  for (int i = sub_24C716160(a1, a4); a3 > i; int i = sub_24C716160(a1, (unint64_t)v4))
  {
    memcpy(v4, a2, i);
    a3 -= i;
    a2 += i;
    uint64_t v4 = sub_24C715FA8((uint64_t)a1, &v4[i]);
  }
  memcpy(v4, a2, a3);
  return &v4[a3];
}

uint64_t sub_24C716160(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1 + 16 < a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/io/coded_stream.h", 838);
    unint64_t v5 = sub_24C716A4C(v8, "CHECK failed: ptr <= end_ + kSlopBytes: ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
    uint64_t v3 = *a1;
  }
  return v3 - a2 + 16;
}

void sub_24C7161E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_24C7161FC(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  if (sub_24C716160((uint64_t *)a1, (unint64_t)a4) <= (int)a3)
  {
    unint64_t v8 = sub_24C715F40(a1, a4);
    if (((*(uint64_t (**)(void, void *, uint64_t))(**(void **)(a1 + 48) + 40))(*(void *)(a1 + 48), a2, a3) & 1) == 0)
    {
      *(unsigned char *)(a1 + 56) = 1;
      unint64_t v8 = (char *)(a1 + 16);
      *(void *)a1 = a1 + 32;
    }
    return v8;
  }
  if (*(void *)a1 - (void)a4 >= (int)a3)
  {
    memcpy(a4, a2, (int)a3);
    return &a4[(int)a3];
  }
  return sub_24C7160BC((uint64_t *)a1, (char *)a2, a3, (unint64_t)a4);
}

char *sub_24C716304(unint64_t *a1, int a2, void **a3, char *a4)
{
  uint64_t v4 = a4;
  unint64_t v8 = *a1;
  if (*a1 <= (unint64_t)a4)
  {
    uint64_t v4 = sub_24C715FA8((uint64_t)a1, a4);
    unint64_t v8 = *a1;
  }
  if (*((char *)a3 + 23) >= 0) {
    uint64_t v9 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    uint64_t v9 = *((unsigned int *)a3 + 2);
  }
  if (v8 <= (unint64_t)v4)
  {
    sub_24C716A34((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/io/coded_stream.h", 858);
    std::string::size_type v10 = sub_24C716A4C(v23, "CHECK failed: ptr < end_: ");
    sub_24C716B88((uint64_t)&v22, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v23);
  }
  unsigned int v11 = (8 * a2) | 2;
  if (v11 > 0x7F)
  {
    char *v4 = (8 * a2) | 0x82;
    unsigned int v13 = (8 * a2) >> 7;
    if (v11 >> 14)
    {
      int v12 = v4 + 2;
      do
      {
        *(v12 - 1) = v13 | 0x80;
        unsigned int v14 = v13 >> 7;
        ++v12;
        unsigned int v15 = v13 >> 14;
        v13 >>= 7;
      }
      while (v15);
      *(v12 - 1) = v14;
    }
    else
    {
      v4[1] = v13;
      int v12 = v4 + 2;
    }
  }
  else
  {
    char *v4 = v11;
    int v12 = v4 + 1;
  }
  if (v9 >= 0x80)
  {
    unsigned int v20 = v9;
    do
    {
      *v12++ = v20 | 0x80;
      unsigned int v16 = v20 >> 7;
      unsigned int v21 = v20 >> 14;
      v20 >>= 7;
    }
    while (v21);
  }
  else
  {
    LOBYTE(v16) = v9;
  }
  *int v12 = v16;
  size_t v17 = v12 + 1;
  if (*((char *)a3 + 23) >= 0) {
    uint64_t v18 = a3;
  }
  else {
    uint64_t v18 = *a3;
  }
  return sub_24C71648C((uint64_t)a1, v18, v9, v17);
}

void sub_24C716474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_24C71648C(uint64_t a1, void *a2, uint64_t a3, char *__dst)
{
  if (*(unsigned char *)(a1 + 57))
  {
    return sub_24C7161FC(a1, a2, a3, __dst);
  }
  else if (*(void *)a1 - (void)__dst < (int)a3)
  {
    return sub_24C7160BC((uint64_t *)a1, (char *)a2, a3, (unint64_t)__dst);
  }
  else
  {
    uint64_t v6 = (int)a3;
    memcpy(__dst, a2, (int)a3);
    return &__dst[v6];
  }
}

char *sub_24C716518(uint64_t *a1, int a2, uint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  unint64_t v8 = *a1;
  if (*a1 <= (unint64_t)a4)
  {
    uint64_t v4 = sub_24C715FA8((uint64_t)a1, a4);
    unint64_t v8 = *a1;
  }
  if (*(char *)(a3 + 23) >= 0) {
    LODWORD(v9) = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    uint64_t v9 = *(void *)(a3 + 8);
  }
  if (v8 <= (unint64_t)v4)
  {
    sub_24C716A34((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/io/coded_stream.h", 858);
    std::string::size_type v10 = sub_24C716A4C(v23, "CHECK failed: ptr < end_: ");
    sub_24C716B88((uint64_t)&v22, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v23);
  }
  unsigned int v11 = (8 * a2) | 2;
  if (v11 > 0x7F)
  {
    char *v4 = (8 * a2) | 0x82;
    unsigned int v13 = (8 * a2) >> 7;
    if (v11 >> 14)
    {
      int v12 = v4 + 2;
      do
      {
        *(v12 - 1) = v13 | 0x80;
        unsigned int v14 = v13 >> 7;
        ++v12;
        unsigned int v15 = v13 >> 14;
        v13 >>= 7;
      }
      while (v15);
      *(v12 - 1) = v14;
    }
    else
    {
      v4[1] = v13;
      int v12 = v4 + 2;
    }
  }
  else
  {
    char *v4 = v11;
    int v12 = v4 + 1;
  }
  if (v9 >= 0x80)
  {
    unsigned int v20 = v9;
    do
    {
      *v12++ = v20 | 0x80;
      unsigned int v16 = v20 >> 7;
      unsigned int v21 = v20 >> 14;
      v20 >>= 7;
    }
    while (v21);
  }
  else
  {
    LOBYTE(v16) = v9;
  }
  *int v12 = v16;
  size_t v17 = v12 + 1;
  if (*(char *)(a3 + 23) >= 0) {
    uint64_t v18 = (char *)a3;
  }
  else {
    uint64_t v18 = *(char **)a3;
  }
  if (*a1 - (uint64_t)v17 < (int)v9) {
    return sub_24C7160BC(a1, v18, v9, (unint64_t)v17);
  }
  memcpy(v17, v18, (int)v9);
  return &v17[(int)v9];
}

void sub_24C7166B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C7166C8(int a1, int a2, const std::string::value_type *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a2 > 3014000)
  {
    LODWORD(v20) = 3;
    unsigned int v21 = "/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/common.cc";
    int v22 = 76;
    memset(&v23, 0, sizeof(v23));
    std::string::append(&v23, "This program requires version ");
    sub_24C716ABC(a2, &v17);
    if ((v19 & 0x80u) == 0) {
      uint64_t v6 = (const std::string::value_type *)&v17;
    }
    else {
      uint64_t v6 = (const std::string::value_type *)v17;
    }
    if ((v19 & 0x80u) == 0) {
      std::string::size_type v7 = v19;
    }
    else {
      std::string::size_type v7 = v18;
    }
    std::string::append(&v23, v6, v7);
    std::string::append(&v23, " of the Protocol Buffer runtime library, but the installed version is ");
    snprintf(__str, 0x80uLL, "%d.%d.%d", 3, 14, 0);
    char v25 = 0;
    sub_24C6698FC(&__p, __str);
    if ((v16 & 0x80u) == 0) {
      p_p = (const std::string::value_type *)&__p;
    }
    else {
      p_p = (const std::string::value_type *)__p;
    }
    if ((v16 & 0x80u) == 0) {
      std::string::size_type v9 = v16;
    }
    else {
      std::string::size_type v9 = v15;
    }
    std::string::append(&v23, p_p, v9);
    std::string::append(&v23, ".  Please update your library.  If you compiled the program yourself, make sure that your headers are from the same version of Protocol Buffers as your link-time library.  (Version verification failed in \"");
    std::string::append(&v23, a3);
    std::string::append(&v23, "\".)");
    sub_24C716D44(&v20);
    if ((char)v16 < 0) {
      operator delete(__p);
    }
    if ((char)v19 < 0) {
      operator delete(v17);
    }
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v23.__r_.__value_.__l.__data_);
    }
  }
  if (a1 < 3014000)
  {
    LODWORD(v20) = 3;
    unsigned int v21 = "/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/common.cc";
    int v22 = 87;
    memset(&v23, 0, sizeof(v23));
    std::string::append(&v23, "This program was compiled against version ");
    sub_24C716ABC(a1, &v17);
    if ((v19 & 0x80u) == 0) {
      std::string::size_type v10 = (const std::string::value_type *)&v17;
    }
    else {
      std::string::size_type v10 = (const std::string::value_type *)v17;
    }
    if ((v19 & 0x80u) == 0) {
      std::string::size_type v11 = v19;
    }
    else {
      std::string::size_type v11 = v18;
    }
    std::string::append(&v23, v10, v11);
    std::string::append(&v23, " of the Protocol Buffer runtime library, which is not compatible with the installed version (");
    snprintf(__str, 0x80uLL, "%d.%d.%d", 3, 14, 0);
    char v25 = 0;
    sub_24C6698FC(&__p, __str);
    if ((v16 & 0x80u) == 0) {
      int v12 = (const std::string::value_type *)&__p;
    }
    else {
      int v12 = (const std::string::value_type *)__p;
    }
    if ((v16 & 0x80u) == 0) {
      std::string::size_type v13 = v16;
    }
    else {
      std::string::size_type v13 = v15;
    }
    std::string::append(&v23, v12, v13);
    std::string::append(&v23, ").  Contact the program author for an update.  If you compiled the program yourself, make sure that your headers are from the same version of Protocol Buffers as your link-time library.  (Version verification failed in \"");
    std::string::append(&v23, a3);
    std::string::append(&v23, "\".)");
    sub_24C716D44(&v20);
    if ((char)v16 < 0) {
      operator delete(__p);
    }
    if ((char)v19 < 0) {
      operator delete(v17);
    }
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v23.__r_.__value_.__l.__data_);
    }
  }
}

void sub_24C7169C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_24C716A34(uint64_t result, int a2, uint64_t a3, int a4)
{
  *(_DWORD *)unint64_t result = a2;
  *(void *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(void *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  *(void *)(result + 24) = 0;
  return result;
}

std::string *sub_24C716A4C(std::string *a1, const std::string::value_type *a2)
{
  return a1;
}

std::string *sub_24C716A78(std::string *a1, const std::string::value_type *a2)
{
  uint64_t v3 = a1 + 1;
  std::string::size_type v4 = *((void *)a2 + 1);
  if (a2[23] >= 0)
  {
    std::string::size_type v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(const std::string::value_type **)a2;
    std::string::size_type v5 = v4;
  }
  std::string::append(v3, a2, v5);
  return a1;
}

void *sub_24C716ABC@<X0>(int a1@<W0>, void *a2@<X8>)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%d.%d.%d", a1 / 1000000, a1 / 1000 % 1000, a1 % 1000);
  char __str[127] = 0;
  return sub_24C6698FC(a2, __str);
}

const char **sub_24C716B88(uint64_t a1, const char **a2)
{
  return sub_24C716D44(a2);
}

uint64_t sub_24C716B90(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  return a1;
}

uint64_t sub_24C716BC4(uint64_t result, const char *a2, int a3, uint64_t a4)
{
  if ((result & 0x80000000) == 0)
  {
    std::string::size_type v4 = (FILE **)MEMORY[0x263EF8348];
    if (*(char *)(a4 + 23) >= 0) {
      uint64_t v5 = (const char *)a4;
    }
    else {
      uint64_t v5 = *(const char **)a4;
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "[libprotobuf %s %s:%d] %s\n", off_2652E8300[result], a2, a3, v5);
    uint64_t v6 = *v4;
    return fflush(v6);
  }
  return result;
}

std::string *sub_24C716C44(std::string *a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%d", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

std::string *sub_24C716CC4(std::string *a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%lu", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

const char **sub_24C716D44(const char **result)
{
  uint64_t v1 = result;
  if (*(_DWORD *)result == 3)
  {
    uint64_t v2 = 3;
  }
  else
  {
    int v3 = atomic_load((unsigned int *)&unk_2697ED418);
    if (v3 > 0) {
      goto LABEL_6;
    }
    uint64_t v2 = *(unsigned int *)result;
  }
  unint64_t result = (const char **)off_26BADA778(v2, v1[1], *((_DWORD *)v1 + 4), (uint64_t)(v1 + 3));
LABEL_6:
  if (*(_DWORD *)v1 == 3)
  {
    exception = __cxa_allocate_exception(0x30uLL);
    sub_24C716E04(exception, v1[1], *((unsigned int *)v1 + 4), v1 + 3);
    __cxa_throw(exception, (struct type_info *)&unk_26FEDC068, (void (*)(void *))sub_24C716E08);
  }
  return result;
}

void sub_24C716DF0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_24C716E0C(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26FEDD3E0;
  if (SHIBYTE(this[5].__vftable) < 0) {
    operator delete(this[3].__vftable);
  }
  std::exception::~exception(this);
}

void sub_24C716E6C(std::exception *a1)
{
  sub_24C716E0C(a1);
  JUMPOUT(0x2532F8960);
}

uint64_t sub_24C716EA4(uint64_t a1)
{
  uint64_t result = a1 + 24;
  if (*(char *)(a1 + 47) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t sub_24C716EC0(uint64_t a1, uint64_t a2, int a3, long long *a4)
{
  *(void *)a1 = &unk_26FEDD3E0;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  uint64_t v5 = a1 + 24;
  if (*((char *)a4 + 23) < 0)
  {
    sub_24C66E0A8((unsigned char *)v5, *(void **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v6 = *a4;
    *(void *)(v5 + 16) = *((void *)a4 + 2);
    *(_OWORD *)uint64_t v5 = v6;
  }
  return a1;
}

void sub_24C716F2C(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24C716F40(uint64_t a1, int a2, _OWORD *a3)
{
  if (qword_2697ED420)
  {
    int8x8_t v3 = *(int8x8_t *)(qword_2697ED420 + 8);
    if (v3)
    {
      unint64_t v4 = *(void *)(a1 + 8);
      unint64_t v5 = 0x9DDFEA08EB382D69 * (((8 * v4) + 8) ^ HIDWORD(v4));
      unint64_t v6 = 0x9DDFEA08EB382D69 * (HIDWORD(v4) ^ (v5 >> 47) ^ v5);
      unint64_t v7 = (0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47))) ^ a2;
      uint8x8_t v8 = (uint8x8_t)vcnt_s8(v3);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        unint64_t v9 = v7;
        if (v7 >= *(void *)&v3) {
          unint64_t v9 = v7 % *(void *)&v3;
        }
      }
      else
      {
        unint64_t v9 = (*(void *)&v3 - 1) & v7;
      }
      std::string::size_type v10 = *(uint64_t ***)(*(void *)qword_2697ED420 + 8 * v9);
      if (v10)
      {
        for (int i = *v10; i; int i = (uint64_t *)*i)
        {
          unint64_t v12 = i[1];
          if (v7 == v12)
          {
            if (i[2] == v4 && *((_DWORD *)i + 6) == a2)
            {
              long long v14 = *((_OWORD *)i + 3);
              *a3 = *((_OWORD *)i + 2);
              a3[1] = v14;
              return 1;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v12 >= *(void *)&v3) {
                v12 %= *(void *)&v3;
              }
            }
            else
            {
              v12 &= *(void *)&v3 - 1;
            }
            if (v12 != v9) {
              return 0;
            }
          }
        }
      }
    }
  }
  return 0;
}

uint64_t sub_24C717054(uint64_t result, uint64_t a2)
{
  *(void *)uint64_t result = a2;
  *(_DWORD *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t sub_24C717064(uint64_t a1)
{
  if (!*(void *)a1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
    {
      sub_24C72136C(*(unsigned __int8 **)v2, (unsigned __int8 *)(v2 + 8));
    }
    else if (*(_WORD *)(a1 + 10))
    {
      uint64_t v3 = 32 * *(unsigned __int16 *)(a1 + 10);
      unint64_t v4 = (unsigned __int8 *)(v2 + 8);
      do
      {
        sub_24C7210B0(v4);
        v4 += 32;
        v3 -= 32;
      }
      while (v3);
    }
    uint64_t v5 = *(void *)(a1 + 16);
    if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
    {
      if (v5)
      {
        uint64_t v7 = *(void *)(a1 + 16);
        sub_24C6822A0(v5, *(void **)(v5 + 8));
        MEMORY[0x2532F8960](v7, 0x1020C4062D53EE8);
      }
    }
    else if (v5)
    {
      MEMORY[0x2532F8930](v5, 0x1062C802AB6010CLL);
    }
  }
  return a1;
}

unsigned __int8 *sub_24C717138(unsigned __int8 *result)
{
  uint64_t v1 = result;
  if (result[9])
  {
    uint64_t v2 = result[8];
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v3 = sub_24C716A4C(v10, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v9, (const char **)&v3->__r_.__value_.__l.__data_);
      uint64_t result = (unsigned __int8 *)sub_24C716B90((uint64_t)v10);
    }
    switch(v2)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
        **(_DWORD **)uint64_t v1 = 0;
        break;
      case 9:
      case 12:
        uint64_t result = (unsigned __int8 *)sub_24C710FA8(*(void *)v1);
        break;
      case 10:
      case 11:
        uint64_t result = (unsigned __int8 *)sub_24C721B74(*(void *)v1);
        break;
      default:
        return result;
    }
  }
  else if ((result[10] & 1) == 0)
  {
    uint64_t v4 = result[8];
    if ((v4 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v5 = sub_24C716A4C(v10, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v9, (const char **)&v5->__r_.__value_.__l.__data_);
      uint64_t result = (unsigned __int8 *)sub_24C716B90((uint64_t)v10);
    }
    int v6 = dword_24C731340[v4];
    if (v6 == 10)
    {
      uint64_t v8 = **(void **)v1;
      if ((v1[10] & 0x10) != 0) {
        uint64_t result = (unsigned __int8 *)(*(uint64_t (**)(void))(v8 + 112))();
      }
      else {
        uint64_t result = (unsigned __int8 *)(*(uint64_t (**)(void))(v8 + 40))();
      }
    }
    else if (v6 == 9)
    {
      uint64_t v7 = *(void *)v1;
      if (*(char *)(*(void *)v1 + 23) < 0)
      {
        **(unsigned char **)uint64_t v7 = 0;
        *(void *)(v7 + 8) = 0;
      }
      else
      {
        *(unsigned char *)uint64_t v7 = 0;
        *(unsigned char *)(v7 + 23) = 0;
      }
    }
    v1[10] = v1[10] & 0xF0 | 1;
  }
  return result;
}

void sub_24C71730C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C717354(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t result = (uint64_t)sub_24C71C2C0(a1, a2);
  uint64_t v9 = result;
  *(void *)(result + 16) = a5;
  if (v10)
  {
    *(unsigned char *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v11 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[a3] != 1)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      unint64_t v12 = sub_24C716A4C(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT32): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    *(unsigned char *)(v9 + 9) = 0;
  }
  else
  {
    if (*(unsigned char *)(result + 9))
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      std::string::size_type v13 = sub_24C716A4C(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    uint64_t v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v15 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[v14] != 1)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      unsigned __int8 v16 = sub_24C716A4C(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT32): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
  }
  *(unsigned char *)(v9 + 10) &= 0xF0u;
  *(_DWORD *)uint64_t v9 = a4;
  return result;
}

void sub_24C717534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C71756C(uint64_t *a1, uint64_t a2, int a3, int a4, int a5, uint64_t *a6)
{
  std::string::size_type v11 = sub_24C71C2C0((uint64_t)a1, a2);
  unint64_t v12 = v11;
  std::string v11[2] = a6;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[a3] != 1)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      std::string::size_type v15 = sub_24C716A4C(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT32): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *a1;
    if (!*a1) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v16 + 32) + 32) + 40))(*(void *)(*(void *)(v16 + 32) + 32), &unk_26FEDC028, 16);
    }
    char v17 = (uint64_t *)sub_24C7150A4((void *)v16, 0x10uLL, (uint64_t)sub_24C7213DC);
    uint64_t *v17 = 0;
    v17[1] = v16;
    *unint64_t v12 = v17;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      std::string::size_type v18 = sub_24C716A4C(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unsigned int v20 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[v19] != 1)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      unsigned int v21 = sub_24C716A4C(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT32): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      int v22 = sub_24C716A4C(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
  }
  std::string v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    sub_24C726A10(v23, v24 + 1);
    uint64_t result = sub_24C726EB0((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
  }
  else
  {
    uint64_t result = sub_24C726EB0((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_24C717870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7178B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = (uint64_t)sub_24C71C2C0(a1, a2);
  uint64_t v9 = result;
  *(void *)(result + 16) = a5;
  if (v10)
  {
    *(unsigned char *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v11 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[a3] != 2)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      unint64_t v12 = sub_24C716A4C(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT64): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    *(unsigned char *)(v9 + 9) = 0;
  }
  else
  {
    if (*(unsigned char *)(result + 9))
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      char v13 = sub_24C716A4C(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    uint64_t v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v15 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[v14] != 2)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      uint64_t v16 = sub_24C716A4C(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT64): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
  }
  *(unsigned char *)(v9 + 10) &= 0xF0u;
  *(void *)uint64_t v9 = a4;
  return result;
}

void sub_24C717A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C717AC8(uint64_t *a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t *a6)
{
  std::string::size_type v11 = sub_24C71C2C0((uint64_t)a1, a2);
  unint64_t v12 = v11;
  std::string v11[2] = a6;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[a3] != 2)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      std::string::size_type v15 = sub_24C716A4C(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT64): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *a1;
    if (!*a1) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v16 + 32) + 32) + 40))(*(void *)(*(void *)(v16 + 32) + 32), &unk_26FEDC048, 16);
    }
    char v17 = (uint64_t *)sub_24C7150A4((void *)v16, 0x10uLL, (uint64_t)sub_24C7213E0);
    uint64_t *v17 = 0;
    v17[1] = v16;
    *unint64_t v12 = v17;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      std::string::size_type v18 = sub_24C716A4C(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unsigned int v20 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[v19] != 2)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      unsigned int v21 = sub_24C716A4C(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT64): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      int v22 = sub_24C716A4C(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
  }
  std::string v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    sub_24C7276C8(v23, v24 + 1);
    uint64_t result = sub_24C727B68((uint64_t)v23);
    *(void *)(result + 8 * v24) = a5;
  }
  else
  {
    uint64_t result = sub_24C727B68((uint64_t)v23);
    *(void *)(result + 8 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_24C717DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C717E0C(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t result = (uint64_t)sub_24C71C2C0(a1, a2);
  uint64_t v9 = result;
  *(void *)(result + 16) = a5;
  if (v10)
  {
    *(unsigned char *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v11 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[a3] != 3)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      unint64_t v12 = sub_24C716A4C(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    *(unsigned char *)(v9 + 9) = 0;
  }
  else
  {
    if (*(unsigned char *)(result + 9))
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      char v13 = sub_24C716A4C(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    uint64_t v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v15 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[v14] != 3)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      uint64_t v16 = sub_24C716A4C(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
  }
  *(unsigned char *)(v9 + 10) &= 0xF0u;
  *(_DWORD *)uint64_t v9 = a4;
  return result;
}

void sub_24C717FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C718024(uint64_t *a1, uint64_t a2, int a3, int a4, int a5, uint64_t *a6)
{
  std::string::size_type v11 = sub_24C71C2C0((uint64_t)a1, a2);
  unint64_t v12 = v11;
  std::string v11[2] = a6;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[a3] != 3)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      std::string::size_type v15 = sub_24C716A4C(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *a1;
    if (!*a1) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v16 + 32) + 32) + 40))(*(void *)(*(void *)(v16 + 32) + 32), &unk_26FEDC038, 16);
    }
    char v17 = (uint64_t *)sub_24C7150A4((void *)v16, 0x10uLL, (uint64_t)sub_24C7213E4);
    uint64_t *v17 = 0;
    v17[1] = v16;
    *unint64_t v12 = v17;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      std::string::size_type v18 = sub_24C716A4C(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unsigned int v20 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[v19] != 3)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      unsigned int v21 = sub_24C716A4C(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      int v22 = sub_24C716A4C(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
  }
  std::string v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    sub_24C72706C(v23, v24 + 1);
    uint64_t result = sub_24C72750C((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
  }
  else
  {
    uint64_t result = sub_24C72750C((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_24C718328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C718368(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = (uint64_t)sub_24C71C2C0(a1, a2);
  uint64_t v9 = result;
  *(void *)(result + 16) = a5;
  if (v10)
  {
    *(unsigned char *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v11 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[a3] != 4)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      unint64_t v12 = sub_24C716A4C(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    *(unsigned char *)(v9 + 9) = 0;
  }
  else
  {
    if (*(unsigned char *)(result + 9))
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      char v13 = sub_24C716A4C(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    uint64_t v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v15 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[v14] != 4)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      uint64_t v16 = sub_24C716A4C(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
  }
  *(unsigned char *)(v9 + 10) &= 0xF0u;
  *(void *)uint64_t v9 = a4;
  return result;
}

void sub_24C718548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C718580(uint64_t *a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t *a6)
{
  std::string::size_type v11 = sub_24C71C2C0((uint64_t)a1, a2);
  unint64_t v12 = v11;
  std::string v11[2] = a6;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[a3] != 4)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      std::string::size_type v15 = sub_24C716A4C(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *a1;
    if (!*a1) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v16 + 32) + 32) + 40))(*(void *)(*(void *)(v16 + 32) + 32), &unk_26FEDC058, 16);
    }
    char v17 = (uint64_t *)sub_24C7150A4((void *)v16, 0x10uLL, (uint64_t)sub_24C7213E8);
    uint64_t *v17 = 0;
    v17[1] = v16;
    *unint64_t v12 = v17;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      std::string::size_type v18 = sub_24C716A4C(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unsigned int v20 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[v19] != 4)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      unsigned int v21 = sub_24C716A4C(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      int v22 = sub_24C716A4C(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
  }
  std::string v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    sub_24C727D24(v23, v24 + 1);
    uint64_t result = sub_24C7281C4((uint64_t)v23);
    *(void *)(result + 8 * v24) = a5;
  }
  else
  {
    uint64_t result = sub_24C7281C4((uint64_t)v23);
    *(void *)(result + 8 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_24C718884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7188C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, float a5)
{
  uint64_t result = (uint64_t)sub_24C71C2C0(a1, a2);
  uint64_t v9 = result;
  *(void *)(result + 16) = a4;
  if (v10)
  {
    *(unsigned char *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v11 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[a3] != 6)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      unint64_t v12 = sub_24C716A4C(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    *(unsigned char *)(v9 + 9) = 0;
  }
  else
  {
    if (*(unsigned char *)(result + 9))
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      char v13 = sub_24C716A4C(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    uint64_t v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v15 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[v14] != 6)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      uint64_t v16 = sub_24C716A4C(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
  }
  *(unsigned char *)(v9 + 10) &= 0xF0u;
  *(float *)uint64_t v9 = a5;
  return result;
}

void sub_24C718AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C718AE4(uint64_t *a1, uint64_t a2, int a3, int a4, uint64_t *a5, float a6)
{
  std::string::size_type v11 = sub_24C71C2C0((uint64_t)a1, a2);
  unint64_t v12 = v11;
  std::string v11[2] = a5;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[a3] != 6)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      std::string::size_type v15 = sub_24C716A4C(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *a1;
    if (!*a1) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v16 + 32) + 32) + 40))(*(void *)(*(void *)(v16 + 32) + 32), &unk_26FEDC018, 16);
    }
    char v17 = (uint64_t *)sub_24C7150A4((void *)v16, 0x10uLL, (uint64_t)sub_24C7213EC);
    uint64_t *v17 = 0;
    v17[1] = v16;
    *unint64_t v12 = v17;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      std::string::size_type v18 = sub_24C716A4C(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unsigned int v20 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[v19] != 6)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      unsigned int v21 = sub_24C716A4C(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      int v22 = sub_24C716A4C(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
  }
  std::string v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    sub_24C728380(v23, v24 + 1);
    uint64_t result = sub_24C728820((uint64_t)v23);
    *(float *)(result + 4 * v24) = a6;
  }
  else
  {
    uint64_t result = sub_24C728820((uint64_t)v23);
    *(float *)(result + 4 * v24) = a6;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_24C718DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C718E30(uint64_t a1, uint64_t a2, int a3, uint64_t a4, double a5)
{
  uint64_t result = (uint64_t)sub_24C71C2C0(a1, a2);
  uint64_t v9 = result;
  *(void *)(result + 16) = a4;
  if (v10)
  {
    *(unsigned char *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v11 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[a3] != 5)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      unint64_t v12 = sub_24C716A4C(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    *(unsigned char *)(v9 + 9) = 0;
  }
  else
  {
    if (*(unsigned char *)(result + 9))
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      char v13 = sub_24C716A4C(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    uint64_t v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v15 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[v14] != 5)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      uint64_t v16 = sub_24C716A4C(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
  }
  *(unsigned char *)(v9 + 10) &= 0xF0u;
  *(double *)uint64_t v9 = a5;
  return result;
}

void sub_24C719018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C719050(uint64_t *a1, uint64_t a2, int a3, int a4, uint64_t *a5, double a6)
{
  std::string::size_type v11 = sub_24C71C2C0((uint64_t)a1, a2);
  unint64_t v12 = v11;
  std::string v11[2] = a5;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[a3] != 5)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      std::string::size_type v15 = sub_24C716A4C(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *a1;
    if (!*a1) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v16 + 32) + 32) + 40))(*(void *)(*(void *)(v16 + 32) + 32), &unk_26FEDC008, 16);
    }
    char v17 = (uint64_t *)sub_24C7150A4((void *)v16, 0x10uLL, (uint64_t)sub_24C7213F0);
    uint64_t *v17 = 0;
    v17[1] = v16;
    *unint64_t v12 = v17;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      std::string::size_type v18 = sub_24C716A4C(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unsigned int v20 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[v19] != 5)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      unsigned int v21 = sub_24C716A4C(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      int v22 = sub_24C716A4C(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
  }
  std::string v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    sub_24C7289DC(v23, v24 + 1);
    uint64_t result = sub_24C728E7C((uint64_t)v23);
    *(double *)(result + 8 * v24) = a6;
  }
  else
  {
    uint64_t result = sub_24C728E7C((uint64_t)v23);
    *(double *)(result + 8 * v24) = a6;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_24C71935C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C71939C(uint64_t a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  uint64_t result = (uint64_t)sub_24C71C2C0(a1, a2);
  uint64_t v9 = (unsigned char *)result;
  *(void *)(result + 16) = a5;
  if (v10)
  {
    *(unsigned char *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v11 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[a3] != 7)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      unint64_t v12 = sub_24C716A4C(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    v9[9] = 0;
  }
  else
  {
    if (*(unsigned char *)(result + 9))
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      char v13 = sub_24C716A4C(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    uint64_t v14 = v9[8];
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      std::string::size_type v15 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[v14] != 7)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      uint64_t v16 = sub_24C716A4C(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
  }
  v9[10] &= 0xF0u;
  unsigned char *v9 = a4;
  return result;
}

void sub_24C71957C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7195B4(uint64_t *a1, uint64_t a2, int a3, int a4, char a5, uint64_t *a6)
{
  std::string::size_type v11 = sub_24C71C2C0((uint64_t)a1, a2);
  unint64_t v12 = v11;
  std::string v11[2] = a6;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[a3] != 7)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      std::string::size_type v15 = sub_24C716A4C(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *a1;
    if (!*a1) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v16 + 32) + 32) + 40))(*(void *)(*(void *)(v16 + 32) + 32), &unk_26FEDBFF8, 16);
    }
    char v17 = (uint64_t *)sub_24C7150A4((void *)v16, 0x10uLL, (uint64_t)sub_24C7213F4);
    uint64_t *v17 = 0;
    v17[1] = v16;
    *unint64_t v12 = v17;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      std::string::size_type v18 = sub_24C716A4C(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unsigned int v20 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[v19] != 7)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      unsigned int v21 = sub_24C716A4C(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      int v22 = sub_24C716A4C(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
  }
  std::string v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    sub_24C7263BC(v23, v24 + 1);
    uint64_t result = sub_24C726858((uint64_t)v23);
    *(unsigned char *)(result + v24) = a5;
  }
  else
  {
    uint64_t result = sub_24C726858((uint64_t)v23);
    *(unsigned char *)(result + v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_24C7198B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_24C7198F8(uint64_t *a1, uint64_t a2, int a3, char a4, uint64_t *a5)
{
  uint64_t v9 = sub_24C71C2C0((uint64_t)a1, a2);
  char v10 = v9;
  std::string v9[2] = a5;
  if (v11)
  {
    *((unsigned char *)v9 + 9) = 1;
    *((unsigned char *)v9 + 8) = a3;
    *((unsigned char *)v9 + 11) = a4;
    switch(a3)
    {
      case 1:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_26FEDC008, 16);
        }
        char v13 = sub_24C7213F0;
        goto LABEL_31;
      case 2:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_26FEDC018, 16);
        }
        char v13 = sub_24C7213EC;
        goto LABEL_31;
      case 3:
      case 16:
      case 18:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_26FEDC048, 16);
        }
        char v13 = sub_24C7213E0;
        goto LABEL_31;
      case 4:
      case 6:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_26FEDC058, 16);
        }
        char v13 = sub_24C7213E8;
        goto LABEL_31;
      case 5:
      case 14:
      case 15:
      case 17:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_26FEDC028, 16);
        }
        char v13 = sub_24C7213DC;
        goto LABEL_31;
      case 7:
      case 13:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_26FEDC038, 16);
        }
        char v13 = sub_24C7213E4;
        goto LABEL_31;
      case 8:
        uint64_t v12 = *a1;
        if (!v12) {
LABEL_32:
        }
          operator new();
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_26FEDBFF8, 16);
        }
        char v13 = sub_24C7213F4;
LABEL_31:
        uint64_t v14 = (uint64_t *)sub_24C7150A4((void *)v12, 0x10uLL, (uint64_t)v13);
        *uint64_t v14 = 0;
        v14[1] = v12;
        goto LABEL_43;
      case 9:
      case 12:
        uint64_t v15 = *a1;
        if (!v15) {
          goto LABEL_42;
        }
        if (*(unsigned char *)(v15 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v15 + 32) + 32) + 40))(*(void *)(*(void *)(v15 + 32) + 32), &unk_26FEDC0A8, 24);
        }
        uint64_t v16 = (uint64_t *(*)(uint64_t *))sub_24C7213F8;
        goto LABEL_41;
      case 10:
      case 11:
        uint64_t v15 = *a1;
        if (!v15) {
LABEL_42:
        }
          operator new();
        if (*(unsigned char *)(v15 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v15 + 32) + 32) + 40))(*(void *)(*(void *)(v15 + 32) + 32), &unk_26FEDC080, 24);
        }
        uint64_t v16 = sub_24C7213FC;
LABEL_41:
        uint64_t v14 = (uint64_t *)sub_24C7150A4((void *)v15, 0x18uLL, (uint64_t)v16);
        v14[2] = 0;
        *uint64_t v14 = v15;
        v14[1] = 0;
LABEL_43:
        *char v10 = v14;
        break;
      default:
        return *v10;
    }
  }
  return *v10;
}

uint64_t sub_24C719D6C(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t result = (uint64_t)sub_24C71C2C0(a1, a2);
  uint64_t v9 = result;
  *(void *)(result + 16) = a5;
  if (v10)
  {
    *(unsigned char *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      char v11 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[a3] != 8)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 460);
      uint64_t v12 = sub_24C716A4C(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    *(unsigned char *)(v9 + 9) = 0;
  }
  else
  {
    if (*(unsigned char *)(result + 9))
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 463);
      char v13 = sub_24C716A4C(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    uint64_t v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v15 = sub_24C716A4C(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
    if (dword_24C731340[v14] != 8)
    {
      sub_24C716A34((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 463);
      uint64_t v16 = sub_24C716A4C(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      sub_24C716B88((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      uint64_t result = sub_24C716B90((uint64_t)v18);
    }
  }
  *(unsigned char *)(v9 + 10) &= 0xF0u;
  *(_DWORD *)uint64_t v9 = a4;
  return result;
}

void sub_24C719F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C719F84(uint64_t *a1, uint64_t a2, int a3, int a4, int a5, uint64_t *a6)
{
  char v11 = sub_24C71C2C0((uint64_t)a1, a2);
  uint64_t v12 = v11;
  std::string v11[2] = a6;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[a3] != 8)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 488);
      uint64_t v15 = sub_24C716A4C(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *a1;
    if (!*a1) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v16 + 32) + 32) + 40))(*(void *)(*(void *)(v16 + 32) + 32), &unk_26FEDC028, 16);
    }
    char v17 = (uint64_t *)sub_24C7150A4((void *)v16, 0x10uLL, (uint64_t)sub_24C7213DC);
    uint64_t *v17 = 0;
    v17[1] = v16;
    *uint64_t v12 = v17;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 494);
      std::string::size_type v18 = sub_24C716A4C(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unsigned int v20 = sub_24C716A4C(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (dword_24C731340[v19] != 8)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 494);
      unsigned int v21 = sub_24C716A4C(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_24C716A34((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 495);
      int v22 = sub_24C716A4C(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_24C716B88((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v28);
    }
  }
  std::string v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    sub_24C726A10(v23, v24 + 1);
    uint64_t result = sub_24C726EB0((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
  }
  else
  {
    uint64_t result = sub_24C726EB0((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_24C71A288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C71A2C8(uint64_t *a1, uint64_t a2, int a3, uint64_t *a4)
{
  uint64_t v7 = sub_24C71C2C0((uint64_t)a1, a2);
  uint64_t v8 = (unsigned __int8 *)v7;
  std::string v7[2] = a4;
  if (v9)
  {
    *((unsigned char *)v7 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      char v10 = sub_24C716A4C(v20, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v19, (const char **)&v10->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v20);
    }
    if (dword_24C731340[a3] != 9)
    {
      sub_24C716A34((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 520);
      char v11 = sub_24C716A4C(v20, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_STRING): ");
      sub_24C716B88((uint64_t)&v19, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v20);
    }
    v8[9] = 0;
    uint64_t v12 = *a1;
    if (!v12) {
      operator new();
    }
    if (*(unsigned char *)(v12 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_26FEDC168, 24);
    }
    char v13 = (void *)sub_24C7150A4((void *)v12, 0x18uLL, (uint64_t)sub_24C710EB4);
    *char v13 = 0;
    v13[1] = 0;
    std::string v13[2] = 0;
    *(void *)uint64_t v8 = v13;
  }
  else
  {
    if (*((unsigned char *)v7 + 9))
    {
      sub_24C716A34((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 524);
      uint64_t v14 = sub_24C716A4C(v20, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_24C716B88((uint64_t)&v19, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v20);
    }
    uint64_t v15 = v8[8];
    if ((v15 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v16 = sub_24C716A4C(v20, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v19, (const char **)&v16->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v20);
    }
    if (dword_24C731340[v15] != 9)
    {
      sub_24C716A34((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 524);
      char v17 = sub_24C716A4C(v20, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_STRING): ");
      sub_24C716B88((uint64_t)&v19, (const char **)&v17->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v20);
    }
  }
  v8[10] &= 0xF0u;
  return *(void *)v8;
}

void sub_24C71A538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_24C71A570(uint64_t *a1, uint64_t a2, int a3, uint64_t *a4)
{
  uint64_t v7 = sub_24C71C2C0((uint64_t)a1, a2);
  uint64_t v8 = v7;
  std::string v7[2] = a4;
  if (v9)
  {
    *((unsigned char *)v7 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      char v10 = sub_24C716A4C(v27, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v26, (const char **)&v10->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v27);
    }
    if (dword_24C731340[a3] != 9)
    {
      sub_24C716A34((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 550);
      char v11 = sub_24C716A4C(v27, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_STRING): ");
      sub_24C716B88((uint64_t)&v26, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v27);
    }
    *((unsigned char *)v8 + 9) = 1;
    *((unsigned char *)v8 + 11) = 0;
    uint64_t v12 = *a1;
    if (!v12) {
      operator new();
    }
    if (*(unsigned char *)(v12 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_26FEDC0A8, 24);
    }
    char v13 = (uint64_t *)sub_24C7150A4((void *)v12, 0x18uLL, (uint64_t)sub_24C7213F8);
    std::string v13[2] = 0;
    *char v13 = v12;
    v13[1] = 0;
    *uint64_t v8 = v13;
  }
  else
  {
    if (!*((unsigned char *)v7 + 9))
    {
      sub_24C716A34((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 556);
      uint64_t v14 = sub_24C716A4C(v27, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_24C716B88((uint64_t)&v26, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v27);
    }
    uint64_t v15 = *((unsigned __int8 *)v8 + 8);
    if ((v15 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v16 = sub_24C716A4C(v27, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v26, (const char **)&v16->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v27);
    }
    if (dword_24C731340[v15] != 9)
    {
      sub_24C716A34((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 556);
      char v17 = sub_24C716A4C(v27, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_STRING): ");
      sub_24C716B88((uint64_t)&v26, (const char **)&v17->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v27);
    }
  }
  uint64_t v18 = (uint64_t)*v8;
  char v19 = *(int **)(v18 + 16);
  if (!v19)
  {
    int v21 = *(_DWORD *)(v18 + 12);
LABEL_22:
    sub_24C729108(v18, v21 + 1);
    char v19 = *(int **)(v18 + 16);
    int v21 = *v19;
    goto LABEL_23;
  }
  uint64_t v20 = *(int *)(v18 + 8);
  int v21 = *v19;
  if ((int)v20 < *v19)
  {
    *(_DWORD *)(v18 + 8) = v20 + 1;
    return *(void **)&v19[2 * v20 + 2];
  }
  if (v21 == *(_DWORD *)(v18 + 12)) {
    goto LABEL_22;
  }
LABEL_23:
  *char v19 = v21 + 1;
  uint64_t v23 = *(void *)v18;
  if (!*(void *)v18) {
    operator new();
  }
  if (*(unsigned char *)(v23 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v23 + 32) + 32) + 40))(*(void *)(*(void *)(v23 + 32) + 32), &unk_26FEDC168, 24);
  }
  uint64_t result = (void *)sub_24C7150A4((void *)v23, 0x18uLL, (uint64_t)sub_24C710EB4);
  *uint64_t result = 0;
  result[1] = 0;
  result[2] = 0;
  uint64_t v24 = *(void *)(v18 + 16);
  uint64_t v25 = *(int *)(v18 + 8);
  *(_DWORD *)(v18 + 8) = v25 + 1;
  *(void *)(v24 + 8 * v25 + 8) = result;
  return result;
}

void sub_24C71A8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C71A920(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  char v9 = sub_24C71C2C0((uint64_t)a1, a2);
  char v10 = v9;
  std::string v9[2] = a5;
  if (v11)
  {
    *((unsigned char *)v9 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v12 = sub_24C716A4C(v21, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v20, (const char **)&v12->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v21);
    }
    if (dword_24C731340[a3] != 10)
    {
      sub_24C716A34((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 591);
      char v13 = sub_24C716A4C(v21, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      sub_24C716B88((uint64_t)&v20, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v21);
    }
    *((unsigned char *)v10 + 9) = 0;
    *((unsigned char *)v10 + 10) &= 0xFu;
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a4 + 32))(a4, *a1);
    *char v10 = (uint64_t *)result;
    *((unsigned char *)v10 + 10) &= 0xF0u;
  }
  else
  {
    if (*((unsigned char *)v9 + 9))
    {
      sub_24C716A34((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 598);
      uint64_t v15 = sub_24C716A4C(v21, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_24C716B88((uint64_t)&v20, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v21);
    }
    uint64_t v16 = *((unsigned __int8 *)v10 + 8);
    if ((v16 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      char v17 = sub_24C716A4C(v21, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v20, (const char **)&v17->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v21);
    }
    if (dword_24C731340[v16] != 10)
    {
      sub_24C716A34((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 598);
      uint64_t v18 = sub_24C716A4C(v21, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      sub_24C716B88((uint64_t)&v20, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v21);
    }
    char v19 = *((unsigned char *)v10 + 10);
    *((unsigned char *)v10 + 10) = v19 & 0xF0;
    uint64_t result = (uint64_t)*v10;
    if ((v19 & 0x10) != 0) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 32))(result, a4);
    }
  }
  return result;
}

void sub_24C71AB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C71ABB8(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  char v9 = sub_24C71C2C0((uint64_t)a1, a2);
  char v10 = (unsigned __int8 *)v9;
  std::string v9[2] = a5;
  if (v11)
  {
    *((unsigned char *)v9 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v12 = sub_24C716A4C(v26, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v25, (const char **)&v12->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v26);
    }
    if (dword_24C731340[a3] != 10)
    {
      sub_24C716A34((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 762);
      char v13 = sub_24C716A4C(v26, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      sub_24C716B88((uint64_t)&v25, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v26);
    }
    v10[9] = 1;
    uint64_t v14 = *a1;
    if (!*a1) {
      operator new();
    }
    if (*(unsigned char *)(v14 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v14 + 32) + 32) + 40))(*(void *)(*(void *)(v14 + 32) + 32), &unk_26FEDC080, 24);
    }
    uint64_t v15 = (void *)sub_24C7150A4((void *)v14, 0x18uLL, (uint64_t)sub_24C7213FC);
    std::string v15[2] = 0;
    void *v15 = v14;
    v15[1] = 0;
    *(void *)char v10 = v15;
  }
  else
  {
    if (!*((unsigned char *)v9 + 9))
    {
      sub_24C716A34((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 767);
      uint64_t v16 = sub_24C716A4C(v26, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_24C716B88((uint64_t)&v25, (const char **)&v16->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v26);
    }
    uint64_t v17 = v10[8];
    if ((v17 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v18 = sub_24C716A4C(v26, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v25, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v26);
    }
    if (dword_24C731340[v17] != 10)
    {
      sub_24C716A34((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 767);
      char v19 = sub_24C716A4C(v26, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      sub_24C716B88((uint64_t)&v25, (const char **)&v19->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v26);
    }
  }
  uint64_t v20 = *(void *)v10;
  int v21 = *(_DWORD **)(*(void *)v10 + 16);
  if (!v21
    || (uint64_t v22 = *(int *)(v20 + 8), (int)v22 >= *v21)
    || (*(_DWORD *)(v20 + 8) = v22 + 1, (uint64_t v23 = *(void *)&v21[2 * v22 + 2]) == 0))
  {
    uint64_t v23 = (*(uint64_t (**)(uint64_t, void))(*(void *)a4 + 32))(a4, *a1);
    sub_24C721514(*(void *)v10, v23);
  }
  return v23;
}

void sub_24C71AEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C71AEDC(unsigned __int8 *result)
{
  uint64_t v1 = (void *)*((void *)result + 2);
  if (*((unsigned __int16 *)result + 4) >= 0x101u)
  {
    int v6 = (unsigned __int8 *)*v1;
    uint64_t v4 = (unsigned __int8 *)(v1 + 1);
    uint64_t v5 = v6;
    if (v6 != v4)
    {
      do
      {
        uint64_t result = sub_24C717138(v5 + 40);
        uint64_t v7 = (unsigned __int8 *)*((void *)v5 + 1);
        if (v7)
        {
          do
          {
            uint64_t v8 = v7;
            uint64_t v7 = *(unsigned __int8 **)v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            uint64_t v8 = (unsigned __int8 *)*((void *)v5 + 2);
            BOOL v9 = *(void *)v8 == (void)v5;
            uint64_t v5 = v8;
          }
          while (!v9);
        }
        uint64_t v5 = v8;
      }
      while (v8 != v4);
    }
  }
  else if (*((_WORD *)result + 5))
  {
    uint64_t v2 = 32 * *((unsigned __int16 *)result + 5);
    uint64_t v3 = (unsigned __int8 *)(v1 + 1);
    do
    {
      uint64_t result = sub_24C717138(v3);
      v3 += 32;
      v2 -= 32;
    }
    while (v2);
  }
  return result;
}

void sub_24C71AF7C(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a1 + 8) <= 0x100u)
  {
    unsigned int v4 = *(unsigned __int16 *)(a2 + 8);
    uint64_t v5 = *(char **)(a1 + 16);
    uint64_t v6 = *(unsigned __int16 *)(a1 + 10);
    uint64_t v7 = &v5[32 * v6];
    uint64_t v8 = *(void *)(a2 + 16);
    if (v4 > 0x100)
    {
      unint64_t v14 = sub_24C71B2D4(v5, v7, *(void **)v8, (void *)(v8 + 8));
    }
    else
    {
      uint64_t v9 = *(unsigned __int16 *)(a2 + 10);
      uint64_t v10 = v8 + 32 * v9;
      BOOL v12 = v6 == 0;
      uint64_t v11 = 0;
      BOOL v12 = v12 || v9 == 0;
      if (!v12)
      {
        do
        {
          if (*(_DWORD *)v5 == *(_DWORD *)v8) {
            char v13 = v5 + 32;
          }
          else {
            char v13 = v5;
          }
          if (*(_DWORD *)v5 < *(_DWORD *)v8)
          {
            v5 += 32;
          }
          else
          {
            v8 += 32;
            uint64_t v5 = v13;
          }
          ++v11;
        }
        while (v5 != v7 && v8 != v10);
      }
      unint64_t v14 = v11 + ((v10 - v8) >> 5) + ((v7 - v5) >> 5);
    }
    sub_24C71B0AC((void *)a1, v14);
  }
  uint64_t v15 = *(int **)(a2 + 16);
  if (*(unsigned __int16 *)(a2 + 8) >= 0x101u)
  {
    char v19 = *(void **)v15;
    sub_24C721648(v19, (void *)v15 + 1, (uint64_t *)a1);
  }
  else if (*(_WORD *)(a2 + 10))
  {
    uint64_t v16 = &v15[8 * *(unsigned __int16 *)(a2 + 10)];
    do
    {
      uint64_t v17 = v15 + 2;
      unsigned int v18 = *v15;
      v15 += 8;
      sub_24C71B3DC((uint64_t *)a1, v18, v17);
    }
    while (v15 != v16);
  }
}

void *sub_24C71B0AC(void *result, unint64_t a2)
{
  unint64_t v2 = *((unsigned __int16 *)result + 4);
  if (v2 <= 0x100 && v2 < a2)
  {
    unsigned int v4 = result;
    do
    {
      if ((_WORD)v2) {
        LOWORD(v2) = 4 * v2;
      }
      else {
        LOWORD(v2) = 1;
      }
    }
    while ((unsigned __int16)v2 < a2);
    uint64_t v5 = (char *)result[2];
    uint64_t v6 = *((unsigned __int16 *)result + 5);
    uint64_t v7 = (uint64_t *)*result;
    if ((unsigned __int16)v2 < 0x101u)
    {
      size_t v8 = 32 * (unsigned __int16)v2;
      if (v7)
      {
        if (v7[3])
        {
          (*(void (**)(void, void *, size_t))(**(void **)(v7[4] + 32) + 40))(*(void *)(v7[4] + 32), &unk_26FEDC0D0, v8);
          size_t v8 = 32 * (unsigned __int16)v2;
        }
        uint64_t result = (void *)sub_24C7153A0(v7, v8);
      }
      else
      {
        uint64_t result = operator new[](v8);
      }
      uint64_t v9 = (uint64_t **)result;
      if (v6) {
        uint64_t result = memmove(result, v5, 32 * v6);
      }
    }
    else
    {
      if (!v7) {
        operator new();
      }
      if (v7[3]) {
        (*(void (**)(void, void *, uint64_t))(**(void **)(v7[4] + 32) + 40))(*(void *)(v7[4] + 32), &unk_26FEDC1D8, 24);
      }
      uint64_t result = (void *)sub_24C7150A4(v7, 0x18uLL, (uint64_t)sub_24C721D8C);
      uint64_t v9 = (uint64_t **)result;
      result[1] = 0;
      uint64_t v10 = result + 1;
      result[2] = 0;
      *uint64_t result = result + 1;
      if (v6)
      {
        uint64_t v11 = &v5[32 * v6];
        BOOL v12 = v5;
        do
        {
          int v15 = *(_DWORD *)v12;
          long long v13 = *(_OWORD *)(v12 + 8);
          uint64_t v17 = *((void *)v12 + 3);
          long long v16 = v13;
          uint64_t result = sub_24C721D94(v9, v10, &v15, &v15);
          uint64_t v10 = result;
          v12 += 32;
        }
        while (v12 != v11);
      }
    }
    if (*v4) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v5 == 0;
    }
    if (!v14) {
      uint64_t result = (void *)MEMORY[0x2532F8930](v5, 0x1062C802AB6010CLL);
    }
    *((_WORD *)v4 + 4) = v2;
    v4[2] = v9;
    if ((unsigned __int16)v2 >= 0x101u) {
      *((_WORD *)v4 + 5) = 0;
    }
  }
  return result;
}

uint64_t sub_24C71B2D4(char *a1, char *a2, void *a3, void *a4)
{
  uint64_t v4 = 0;
  if (a1 != a2 && a3 != a4)
  {
    uint64_t v4 = 0;
    do
    {
      int v5 = *((_DWORD *)a3 + 8);
      if (*(_DWORD *)a1 >= v5)
      {
        if (*(_DWORD *)a1 == v5)
        {
          a1 += 32;
          uint64_t v6 = (void *)a3[1];
          if (v6)
          {
            do
            {
              a3 = v6;
              uint64_t v6 = (void *)*v6;
            }
            while (v6);
          }
          else
          {
            do
            {
              uint64_t v7 = a3;
              a3 = (void *)a3[2];
            }
            while ((void *)*a3 != v7);
          }
        }
        else
        {
          size_t v8 = (void *)a3[1];
          if (v8)
          {
            do
            {
              a3 = v8;
              size_t v8 = (void *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              uint64_t v9 = a3;
              a3 = (void *)a3[2];
            }
            while ((void *)*a3 != v9);
          }
        }
      }
      else
      {
        a1 += 32;
      }
      ++v4;
    }
    while (a1 != a2 && a3 != a4);
  }
  if (a3 == a4)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = (void *)a3[1];
      if (v11)
      {
        do
        {
          BOOL v12 = v11;
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          BOOL v12 = (void *)a3[2];
          BOOL v13 = *v12 == (void)a3;
          a3 = v12;
        }
        while (!v13);
      }
      ++v10;
      a3 = v12;
    }
    while (v12 != a4);
  }
  return v4 + ((a2 - a1) >> 5) + v10;
}

void sub_24C71B3DC(uint64_t *a1, uint64_t a2, void *a3)
{
  if (!*((unsigned char *)a3 + 9))
  {
    if (*((unsigned char *)a3 + 10)) {
      return;
    }
    uint64_t v11 = *((unsigned __int8 *)a3 + 8);
    if ((v11 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      BOOL v12 = sub_24C716A4C(v63, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v62, (const char **)&v12->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v63);
    }
    switch(v11)
    {
      case 1:
        sub_24C718E30((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), a3[2], *(double *)a3);
        return;
      case 2:
        sub_24C7188C4((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), a3[2], *(float *)a3);
        return;
      case 3:
      case 16:
      case 18:
        sub_24C7178B0((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *a3, a3[2]);
        return;
      case 4:
      case 6:
        sub_24C718368((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *a3, a3[2]);
        return;
      case 5:
      case 15:
      case 17:
        sub_24C717354((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, a3[2]);
        return;
      case 7:
      case 13:
        sub_24C717E0C((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, a3[2]);
        return;
      case 8:
        sub_24C71939C((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(unsigned char *)a3, a3[2]);
        return;
      case 9:
      case 12:
        int v36 = *((unsigned __int8 *)a3 + 8);
        double v37 = *(double *)a3;
        if (*(char *)(*a3 + 23) < 0)
        {
          sub_24C66E0A8(__p, **(void ***)&v37, *(void *)(*(void *)&v37 + 8));
        }
        else
        {
          long long v38 = **(_OWORD **)&v37;
          uint64_t v61 = *(void *)(*(void *)&v37 + 16);
          *(_OWORD *)std::string __p = v38;
        }
        sub_24C71C1A0(a1, a2, v36, (__n128 *)__p, (uint64_t *)a3[2]);
        if (SHIBYTE(v61) < 0) {
          operator delete(__p[0]);
        }
        return;
      case 10:
      case 11:
        uint64_t v39 = (uint64_t *)a3[2];
        int v40 = sub_24C71C2C0((uint64_t)a1, a2);
        uint64_t v41 = v40;
        v40[2] = v39;
        if (v42)
        {
          *((unsigned char *)v40 + 8) = *((unsigned char *)a3 + 8);
          *((unsigned char *)v40 + 11) = *((unsigned char *)a3 + 11);
          *((unsigned char *)v40 + 9) = 0;
          char v43 = *((unsigned char *)v40 + 10) & 0xF;
          if ((*((unsigned char *)a3 + 10) & 0x10) == 0)
          {
            *((unsigned char *)v40 + 10) = v43;
            uint64_t v44 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, *a1);
            void *v41 = v44;
LABEL_120:
            (*(void (**)(uint64_t, void))(*(void *)v44 + 64))(v44, *a3);
            goto LABEL_126;
          }
          *((unsigned char *)v40 + 10) = v43 | 0x10;
          uint64_t v59 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 16))(*a3, *a1);
          void *v41 = v59;
          (*(void (**)(uint64_t, void))(*(void *)v59 + 104))(v59, *a3);
        }
        else
        {
          if (*((unsigned __int8 *)v40 + 8) != *((unsigned __int8 *)a3 + 8))
          {
            sub_24C716A34((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1026);
            v53 = sub_24C716A4C(v63, "CHECK failed: (extension->type) == (other_extension.type): ");
            sub_24C716B88((uint64_t)&v62, (const char **)&v53->__r_.__value_.__l.__data_);
            sub_24C716B90((uint64_t)v63);
          }
          if (*((unsigned __int8 *)v41 + 11) != *((unsigned __int8 *)a3 + 11))
          {
            sub_24C716A34((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1027);
            v54 = sub_24C716A4C(v63, "CHECK failed: (extension->is_packed) == (other_extension.is_packed): ");
            sub_24C716B88((uint64_t)&v62, (const char **)&v54->__r_.__value_.__l.__data_);
            sub_24C716B90((uint64_t)v63);
          }
          if (*((unsigned char *)v41 + 9))
          {
            sub_24C716A34((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1028);
            v55 = sub_24C716A4C(v63, "CHECK failed: !extension->is_repeated: ");
            sub_24C716B88((uint64_t)&v62, (const char **)&v55->__r_.__value_.__l.__data_);
            sub_24C716B90((uint64_t)v63);
          }
          v56 = (uint64_t *)*v41;
          double v57 = *(double *)a3;
          if ((*((unsigned char *)a3 + 10) & 0x10) != 0)
          {
            if ((*((unsigned char *)v41 + 10) & 0x10) != 0)
            {
              (*(void (**)(void, double))(*v56 + 104))(*v41, COERCE_DOUBLE(*(void *)&v57));
              goto LABEL_126;
            }
            double v57 = COERCE_DOUBLE((*(uint64_t (**)(void, void))(**(void **)&v57 + 24))(*a3, *v41));
            uint64_t v58 = *v56;
          }
          else
          {
            uint64_t v58 = *v56;
            if ((*((unsigned char *)v41 + 10) & 0x10) != 0)
            {
              uint64_t v44 = (*(uint64_t (**)(void, double))(v58 + 32))(*v41, COERCE_DOUBLE(*(void *)&v57));
              goto LABEL_120;
            }
          }
          (*(void (**)(uint64_t *, double))(v58 + 64))(v56, COERCE_DOUBLE(*(void *)&v57));
        }
LABEL_126:
        *((unsigned char *)v41 + 10) &= 0xF0u;
        return;
      case 14:
        sub_24C719D6C((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, a3[2]);
        return;
      default:
        return;
    }
  }
  uint64_t v6 = (uint64_t *)a3[2];
  uint64_t v7 = sub_24C71C2C0((uint64_t)a1, a2);
  size_t v8 = (uint64_t *)v7;
  std::string v7[2] = v6;
  uint64_t v10 = v9;
  if (v9)
  {
    *((unsigned char *)v7 + 8) = *((unsigned char *)a3 + 8);
    *((unsigned char *)v7 + 11) = *((unsigned char *)a3 + 11);
    *((unsigned char *)v7 + 9) = 1;
  }
  else
  {
    if (*((unsigned __int8 *)v7 + 8) != *((unsigned __int8 *)a3 + 8))
    {
      sub_24C716A34((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 931);
      BOOL v13 = sub_24C716A4C(v63, "CHECK failed: (extension->type) == (other_extension.type): ");
      sub_24C716B88((uint64_t)&v62, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v63);
    }
    if (*((unsigned __int8 *)v8 + 11) != *((unsigned __int8 *)a3 + 11))
    {
      sub_24C716A34((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 932);
      BOOL v14 = sub_24C716A4C(v63, "CHECK failed: (extension->is_packed) == (other_extension.is_packed): ");
      sub_24C716B88((uint64_t)&v62, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v63);
    }
    if (!*((unsigned char *)v8 + 9))
    {
      sub_24C716A34((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 933);
      int v15 = sub_24C716A4C(v63, "CHECK failed: extension->is_repeated: ");
      sub_24C716B88((uint64_t)&v62, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v63);
    }
  }
  uint64_t v16 = *((unsigned __int8 *)a3 + 8);
  if ((v16 - 19) <= 0xFFFFFFED)
  {
    sub_24C716A34((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    uint64_t v17 = sub_24C716A4C(v63, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    sub_24C716B88((uint64_t)&v62, (const char **)&v17->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v63);
  }
  switch(v16)
  {
    case 1:
      if (v10)
      {
        uint64_t v26 = *a1;
        if (!v26) {
          operator new();
        }
        if (*(unsigned char *)(v26 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v26 + 32) + 32) + 40))(*(void *)(*(void *)(v26 + 32) + 32), &unk_26FEDC008, 16);
        }
        unint64_t v27 = sub_24C7150A4((void *)v26, 0x10uLL, (uint64_t)sub_24C7213F0);
        *(void *)unint64_t v27 = 0;
        *(void *)(v27 + 8) = v26;
        *size_t v8 = v27;
      }
      else
      {
        unint64_t v27 = *v8;
      }
      sub_24C728F08((int *)v27, (int *)*a3);
      break;
    case 2:
      if (v10)
      {
        uint64_t v28 = *a1;
        if (!v28) {
          operator new();
        }
        if (*(unsigned char *)(v28 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v28 + 32) + 32) + 40))(*(void *)(*(void *)(v28 + 32) + 32), &unk_26FEDC018, 16);
        }
        unint64_t v29 = sub_24C7150A4((void *)v28, 0x10uLL, (uint64_t)sub_24C7213EC);
        *(void *)unint64_t v29 = 0;
        *(void *)(v29 + 8) = v28;
        *size_t v8 = v29;
      }
      else
      {
        unint64_t v29 = *v8;
      }
      sub_24C7288AC((int *)v29, (int *)*a3);
      break;
    case 3:
    case 16:
    case 18:
      if (v10)
      {
        uint64_t v20 = *a1;
        if (!v20) {
          operator new();
        }
        if (*(unsigned char *)(v20 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v20 + 32) + 32) + 40))(*(void *)(*(void *)(v20 + 32) + 32), &unk_26FEDC048, 16);
        }
        unint64_t v21 = sub_24C7150A4((void *)v20, 0x10uLL, (uint64_t)sub_24C7213E0);
        *(void *)unint64_t v21 = 0;
        *(void *)(v21 + 8) = v20;
        *size_t v8 = v21;
      }
      else
      {
        unint64_t v21 = *v8;
      }
      sub_24C727BF4((int *)v21, (int *)*a3);
      break;
    case 4:
    case 6:
      if (v10)
      {
        uint64_t v24 = *a1;
        if (!v24) {
          operator new();
        }
        if (*(unsigned char *)(v24 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v24 + 32) + 32) + 40))(*(void *)(*(void *)(v24 + 32) + 32), &unk_26FEDC058, 16);
        }
        unint64_t v25 = sub_24C7150A4((void *)v24, 0x10uLL, (uint64_t)sub_24C7213E8);
        *(void *)unint64_t v25 = 0;
        *(void *)(v25 + 8) = v24;
        *size_t v8 = v25;
      }
      else
      {
        unint64_t v25 = *v8;
      }
      sub_24C728250((int *)v25, (int *)*a3);
      break;
    case 5:
    case 14:
    case 15:
    case 17:
      if (v10)
      {
        uint64_t v18 = *a1;
        if (!v18) {
          operator new();
        }
        if (*(unsigned char *)(v18 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v18 + 32) + 32) + 40))(*(void *)(*(void *)(v18 + 32) + 32), &unk_26FEDC028, 16);
        }
        unint64_t v19 = sub_24C7150A4((void *)v18, 0x10uLL, (uint64_t)sub_24C7213DC);
        *(void *)unint64_t v19 = 0;
        *(void *)(v19 + 8) = v18;
        *size_t v8 = v19;
      }
      else
      {
        unint64_t v19 = *v8;
      }
      sub_24C726F3C((int *)v19, (int *)*a3);
      break;
    case 7:
    case 13:
      if (v10)
      {
        uint64_t v22 = *a1;
        if (!v22) {
          operator new();
        }
        if (*(unsigned char *)(v22 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v22 + 32) + 32) + 40))(*(void *)(*(void *)(v22 + 32) + 32), &unk_26FEDC038, 16);
        }
        unint64_t v23 = sub_24C7150A4((void *)v22, 0x10uLL, (uint64_t)sub_24C7213E4);
        *(void *)unint64_t v23 = 0;
        *(void *)(v23 + 8) = v22;
        *size_t v8 = v23;
      }
      else
      {
        unint64_t v23 = *v8;
      }
      sub_24C727598((int *)v23, (int *)*a3);
      break;
    case 8:
      if (v10)
      {
        uint64_t v30 = *a1;
        if (!v30) {
          operator new();
        }
        if (*(unsigned char *)(v30 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v30 + 32) + 32) + 40))(*(void *)(*(void *)(v30 + 32) + 32), &unk_26FEDBFF8, 16);
        }
        unint64_t v31 = sub_24C7150A4((void *)v30, 0x10uLL, (uint64_t)sub_24C7213F4);
        *(void *)unint64_t v31 = 0;
        *(void *)(v31 + 8) = v30;
        *size_t v8 = v31;
      }
      else
      {
        unint64_t v31 = *v8;
      }
      sub_24C7268E4((int *)v31, (int *)*a3);
      break;
    case 9:
    case 12:
      if (v10)
      {
        uint64_t v32 = *a1;
        if (!v32) {
          operator new();
        }
        if (*(unsigned char *)(v32 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v32 + 32) + 32) + 40))(*(void *)(*(void *)(v32 + 32) + 32), &unk_26FEDC0A8, 24);
        }
        long long v33 = (void *)sub_24C7150A4((void *)v32, 0x18uLL, (uint64_t)sub_24C7213F8);
        v33[2] = 0;
        void *v33 = v32;
        v33[1] = 0;
        *size_t v8 = (uint64_t)v33;
      }
      else
      {
        long long v33 = (void *)*v8;
      }
      sub_24C7112AC((uint64_t)v33, *a3);
      break;
    case 10:
    case 11:
      if (v10)
      {
        uint64_t v34 = *a1;
        if (!*a1) {
          operator new();
        }
        if (*(unsigned char *)(v34 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v34 + 32) + 32) + 40))(*(void *)(*(void *)(v34 + 32) + 32), &unk_26FEDC080, 24);
        }
        uint64_t v35 = (void *)sub_24C7150A4((void *)v34, 0x18uLL, (uint64_t)sub_24C7213FC);
        v35[2] = 0;
        void *v35 = v34;
        v35[1] = 0;
        *size_t v8 = (uint64_t)v35;
      }
      double v45 = *(double *)a3;
      if (*(int *)(*(void *)&v45 + 8) >= 1)
      {
        int v46 = 0;
        do
        {
          uint64_t v47 = sub_24C721434(*(uint64_t *)&v45, v46);
          uint64_t v48 = v47;
          uint64_t v49 = *v8;
          uint64_t v50 = *(_DWORD **)(*v8 + 16);
          if (!v50
            || (uint64_t v51 = *(int *)(v49 + 8), (int)v51 >= *v50)
            || (*(_DWORD *)(v49 + 8) = v51 + 1, (uint64_t v52 = *(void *)&v50[2 * v51 + 2]) == 0))
          {
            uint64_t v52 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v47 + 32))(v47, *a1);
            sub_24C721514(*v8, v52);
          }
          (*(void (**)(uint64_t, uint64_t))(*(void *)v52 + 64))(v52, v48);
          ++v46;
        }
        while (v46 < *(_DWORD *)(*(void *)&v45 + 8));
      }
      break;
    default:
      return;
  }
}

void sub_24C71C0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
}

__n128 sub_24C71C1A0(uint64_t *a1, uint64_t a2, int a3, __n128 *a4, uint64_t *a5)
{
  uint64_t v6 = sub_24C71A2C8(a1, a2, a3, a5);
  uint64_t v7 = (__n128 *)v6;
  if (*(char *)(v6 + 23) < 0) {
    operator delete(*(void **)v6);
  }
  __n128 result = *a4;
  v7[1].n128_u64[0] = a4[1].n128_u64[0];
  *uint64_t v7 = result;
  a4[1].n128_u8[7] = 0;
  a4->n128_u8[0] = 0;
  return result;
}

uint64_t sub_24C71C1F4(uint64_t result, uint64_t a2)
{
  uint64_t v3 = (unsigned __int8 *)result;
  if (*(void *)result == *(void *)a2)
  {
    __int16 v4 = *(_WORD *)(result + 8);
    *(_WORD *)(result + 8) = *(_WORD *)(a2 + 8);
    *(_WORD *)(a2 + 8) = v4;
    __int16 v5 = *(_WORD *)(result + 10);
    *(_WORD *)(result + 10) = *(_WORD *)(a2 + 10);
    *(_WORD *)(a2 + 10) = v5;
    uint64_t v6 = *(void *)(result + 16);
    *(void *)(result + 16) = *(void *)(a2 + 16);
    *(void *)(a2 + 16) = v6;
  }
  else
  {
    uint64_t v7 = 0;
    int v8 = 0;
    uint64_t v9 = 0;
    sub_24C71AF7C((uint64_t)&v7, a2);
    sub_24C71AEDC((unsigned __int8 *)a2);
    sub_24C71AF7C(a2, (uint64_t)v3);
    sub_24C71AEDC(v3);
    sub_24C71AF7C((uint64_t)v3, (uint64_t)&v7);
    return sub_24C717064((uint64_t)&v7);
  }
  return result;
}

void sub_24C71C2AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_24C717064((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t **sub_24C71C2C0(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int16 *)(a1 + 8);
  __int16 v4 = *(uint64_t ***)(a1 + 16);
  if (v3 >= 0x101)
  {
    *((void *)&v14 + 1) = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    LODWORD(v14) = a2;
    return sub_24C721CD0(v4, (int *)&v14, &v14) + 5;
  }
  uint64_t v6 = *(unsigned __int16 *)(a1 + 10);
  uint64_t v7 = &v4[4 * v6];
  if (!*(_WORD *)(a1 + 10))
  {
    if (!*(_WORD *)(a1 + 8)) {
      goto LABEL_18;
    }
    LOWORD(v6) = 0;
LABEL_17:
    *(_WORD *)(a1 + 10) = v6 + 1;
    *(_DWORD *)uint64_t v7 = a2;
    v7[1] = 0;
    __n128 result = v7 + 1;
    std::string v7[2] = 0;
    v7[3] = 0;
    return result;
  }
  unint64_t v8 = *(unsigned __int16 *)(a1 + 10);
  do
  {
    unint64_t v9 = v8 >> 1;
    uint64_t v10 = (int *)&v4[4 * (v8 >> 1)];
    int v12 = *v10;
    uint64_t v11 = (uint64_t **)(v10 + 8);
    v8 += ~(v8 >> 1);
    if (v12 < (int)a2) {
      __int16 v4 = v11;
    }
    else {
      unint64_t v8 = v9;
    }
  }
  while (v8);
  if (v4 != v7)
  {
    if (*(_DWORD *)v4 == a2) {
      return v4 + 1;
    }
    if (v6 < v3)
    {
      memmove(v4 + 4, v4, (char *)v7 - (char *)v4);
      LOWORD(v6) = *(_WORD *)(a1 + 10);
      uint64_t v7 = v4;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (v6 < v3) {
    goto LABEL_17;
  }
LABEL_18:
  sub_24C71B0AC((void *)a1, v6 + 1);
  return (uint64_t **)sub_24C71C2C0(a1, a2);
}

uint64_t sub_24C71C40C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
  {
    unint64_t v8 = (unsigned __int8 *)*v1;
    uint64_t v7 = (unsigned __int8 *)(v1 + 1);
    uint64_t v6 = v8;
    if (v8 == v7)
    {
      return 1;
    }
    else
    {
      do
      {
        uint64_t v4 = sub_24C71C4E0(v6 + 40);
        if (!v4) {
          break;
        }
        unint64_t v9 = (unsigned __int8 *)*((void *)v6 + 1);
        if (v9)
        {
          do
          {
            uint64_t v10 = v9;
            unint64_t v9 = *(unsigned __int8 **)v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            uint64_t v10 = (unsigned __int8 *)*((void *)v6 + 2);
            BOOL v11 = *(void *)v10 == (void)v6;
            uint64_t v6 = v10;
          }
          while (!v11);
        }
        uint64_t v6 = v10;
      }
      while (v10 != v7);
    }
  }
  else
  {
    while (1)
    {
      uint64_t v3 = *(void *)(a1 + 16) + 32 * *(unsigned __int16 *)(a1 + 10);
      uint64_t v4 = v1 == (void *)v3;
      if (v1 == (void *)v3) {
        break;
      }
      __int16 v5 = (unsigned __int8 *)(v1 + 1);
      if (!sub_24C71C4E0(v5)) {
        break;
      }
      uint64_t v1 = v5 + 24;
      if (*(unsigned __int16 *)(a1 + 8) > 0x100u) {
        sub_24C721FC4();
      }
    }
  }
  return v4;
}

uint64_t sub_24C71C4E0(unsigned __int8 *a1)
{
  uint64_t v2 = a1[8];
  if ((v2 - 19) <= 0xFFFFFFED)
  {
    sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    uint64_t v3 = sub_24C716A4C(v10, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    sub_24C716B88((uint64_t)&v9, (const char **)&v3->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v10);
  }
  if (dword_24C731340[v2] != 10) {
    return 1;
  }
  if (a1[9])
  {
    uint64_t v4 = *(void *)a1;
    if (*(int *)(*(void *)a1 + 8) >= 1)
    {
      int v5 = 0;
      while (1)
      {
        uint64_t v6 = sub_24C721434(v4, v5);
        if (((*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6) & 1) == 0) {
          break;
        }
        ++v5;
        uint64_t v4 = *(void *)a1;
        if (v5 >= *(_DWORD *)(*(void *)a1 + 8)) {
          return 1;
        }
      }
      return 0;
    }
    return 1;
  }
  if (a1[10]) {
    return 1;
  }
  uint64_t v7 = **(void **)a1;
  if ((a1[10] & 0x10) != 0) {
    return ((*(uint64_t (**)(void))(v7 + 72))() & 1) != 0;
  }
  uint64_t result = (*(uint64_t (**)(void))(v7 + 48))();
  if (result) {
    return 1;
  }
  return result;
}

void sub_24C71C638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C71C650(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5, unsigned char *a6)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int8 *))(*(void *)a4 + 16))(a4, a3, a5);
  if (result)
  {
    uint64_t v10 = *a5;
    if ((v10 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      BOOL v11 = sub_24C716A4C(v15, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v15);
    }
    unsigned int v12 = dword_24C73138C[v10];
    *a6 = 0;
    if (a2 == 2 && a5[1])
    {
      if (v12 > 5)
      {
        sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 82);
        BOOL v13 = sub_24C716A4C(v15, "can't reach here.");
        sub_24C716B88((uint64_t)&v14, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)v15);
      }
      else
      {
        uint64_t result = 1;
        if (((1 << v12) & 0x1C) == 0)
        {
          *a6 = 1;
          return result;
        }
      }
    }
    return v12 == a2;
  }
  return result;
}

void sub_24C71C78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C71C7AC(uint64_t *a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4, unint64_t *a5, int32x2_t *a6)
{
  unsigned int v9 = a2;
  v16[0] = &unk_26FEDD408;
  v16[1] = a4;
  uint64_t v11 = a2 >> 3;
  unsigned __int8 v15 = 0;
  if (sub_24C71C650((uint64_t)a1, a2 & 7, a2 >> 3, (uint64_t)v16, v14, &v15)) {
    return sub_24C71C88C(a1, v11, v15, (uint64_t)v14, a5, a3, a6);
  }
  if (*a5) {
    BOOL v13 = (std::string *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
  }
  else {
    BOOL v13 = (std::string *)sub_24C7078BC(a5);
  }
  return sub_24C724288(v9, v13, (char *)a3, a6);
}

unsigned __int8 *sub_24C71C88C(uint64_t *a1, uint64_t a2, int a3, uint64_t a4, unint64_t *a5, unsigned __int8 *a6, int32x2_t *a7)
{
  unint64_t v8 = a6;
  uint64_t v11 = a2;
  unsigned int v12 = a1;
  if (a3)
  {
    switch(*(unsigned char *)a4)
    {
      case 1:
        uint64_t v30 = sub_24C7198F8(a1, a2, 1, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_24C724120(v30, v8, a7);
        break;
      case 2:
        unint64_t v31 = sub_24C7198F8(a1, a2, 2, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_24C7240A4(v31, v8, a7);
        break;
      case 3:
        uint64_t v32 = sub_24C7198F8(a1, a2, 3, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_24C723E64((int *)v32, v8, (uint64_t)a7);
        break;
      case 4:
        long long v33 = sub_24C7198F8(a1, a2, 4, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_24C723E74((int *)v33, v8, (uint64_t)a7);
        break;
      case 5:
        uint64_t v16 = sub_24C7198F8(a1, a2, 5, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_24C723E44((int *)v16, v8, (uint64_t)a7);
        break;
      case 6:
        uint64_t v34 = sub_24C7198F8(a1, a2, 6, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_24C723FAC(v34, v8, a7);
        break;
      case 7:
        uint64_t v35 = sub_24C7198F8(a1, a2, 7, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_24C723EB4(v35, v8, a7);
        break;
      case 8:
        int v36 = sub_24C7198F8(a1, a2, 8, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_24C723EA4((int *)v36, v8, (uint64_t)a7);
        break;
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
        sub_24C716A34((uint64_t)&v89, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/extension_set_inl.h", 79);
        BOOL v13 = sub_24C716A4C(&v89, "Non-primitive types can't be packed.");
        sub_24C716B88((uint64_t)&v88, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v89);
        goto LABEL_169;
      case 0xD:
        uint64_t v18 = sub_24C7198F8(a1, a2, 13, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_24C723E54((int *)v18, v8, (uint64_t)a7);
        break;
      case 0xE:
        v89.__r_.__value_.__r.__words[0] = (std::string::size_type)sub_24C7198F8(a1, a2, 14, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        *(_OWORD *)&v89.__r_.__value_.__r.__words[1] = *(_OWORD *)(a4 + 8);
        v90 = a5;
        int v91 = v11;
        unint64_t v8 = (unsigned __int8 *)sub_24C721738((uint64_t)a7, (char *)v8, (uint64_t)&v89);
        goto LABEL_169;
      case 0xF:
        unint64_t v19 = sub_24C7198F8(a1, a2, 15, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_24C723F30(v19, v8, a7);
        break;
      case 0x10:
        double v37 = sub_24C7198F8(a1, a2, 16, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_24C724028(v37, v8, a7);
        break;
      case 0x11:
        uint64_t v20 = sub_24C7198F8(a1, a2, 17, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_24C723E84((int *)v20, v8, (uint64_t)a7);
        break;
      case 0x12:
        long long v38 = sub_24C7198F8(a1, a2, 18, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_24C723E94((int *)v38, v8, (uint64_t)a7);
        break;
      default:
        goto LABEL_169;
    }
  }
  else
  {
    switch(*(unsigned char *)a4)
    {
      case 1:
        unint64_t v8 = a6 + 8;
        double v39 = *(double *)a6;
        if (*(unsigned char *)(a4 + 1)) {
          sub_24C719050(a1, a2, 1, *(unsigned __int8 *)(a4 + 2), *(uint64_t **)(a4 + 24), v39);
        }
        else {
          sub_24C718E30((uint64_t)a1, a2, 1, *(void *)(a4 + 24), v39);
        }
        goto LABEL_169;
      case 2:
        unint64_t v8 = a6 + 4;
        float v40 = *(float *)a6;
        if (*(unsigned char *)(a4 + 1)) {
          sub_24C718AE4(a1, a2, 2, *(unsigned __int8 *)(a4 + 2), *(uint64_t **)(a4 + 24), v40);
        }
        else {
          sub_24C7188C4((uint64_t)a1, a2, 2, *(void *)(a4 + 24), v40);
        }
        goto LABEL_169;
      case 3:
        uint64_t v41 = *a6;
        if ((char)*a6 < 0)
        {
          int v67 = v41 + (a6[1] << 7);
          uint64_t v41 = (v67 - 128);
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_24C723CD0((uint64_t)a6, (v67 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            uint64_t v41 = v84;
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v54 = *(unsigned __int8 *)(a4 + 2);
          v55 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v56 = 3;
          goto LABEL_166;
        }
        uint64_t v79 = *(void *)(a4 + 24);
        a1 = v12;
        a2 = v11;
        int v80 = 3;
        goto LABEL_168;
      case 4:
        uint64_t v42 = *a6;
        if ((char)*a6 < 0)
        {
          int v68 = v42 + (a6[1] << 7);
          uint64_t v42 = (v68 - 128);
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_24C723CD0((uint64_t)a6, (v68 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            uint64_t v42 = v85;
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v43 = *(unsigned __int8 *)(a4 + 2);
          uint64_t v44 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v45 = 4;
          goto LABEL_147;
        }
        uint64_t v69 = *(void *)(a4 + 24);
        a1 = v12;
        a2 = v11;
        int v70 = 4;
        goto LABEL_149;
      case 5:
        int v21 = *a6;
        if ((char)*a6 < 0)
        {
          int v63 = v21 + (a6[1] << 7);
          int v21 = v63 - 128;
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_24C723CD0((uint64_t)a6, (v63 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            int v21 = v81;
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v26 = *(unsigned __int8 *)(a4 + 2);
          unint64_t v27 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v28 = 5;
          goto LABEL_134;
        }
        uint64_t v65 = *(void *)(a4 + 24);
        a1 = v12;
        a2 = v11;
        int v66 = 5;
        int v82 = v21;
        goto LABEL_137;
      case 6:
        unint64_t v8 = a6 + 8;
        uint64_t v42 = *(void *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v43 = *(unsigned __int8 *)(a4 + 2);
          uint64_t v44 = *(uint64_t **)(a4 + 24);
          int v45 = 6;
LABEL_147:
          sub_24C718580(a1, a2, v45, v43, v42, v44);
        }
        else
        {
          uint64_t v69 = *(void *)(a4 + 24);
          int v70 = 6;
LABEL_149:
          sub_24C718368((uint64_t)a1, a2, v70, v42, v69);
        }
        goto LABEL_169;
      case 7:
        unint64_t v8 = a6 + 4;
        int v25 = *(_DWORD *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v46 = *(unsigned __int8 *)(a4 + 2);
          uint64_t v47 = *(uint64_t **)(a4 + 24);
          int v48 = 7;
          goto LABEL_128;
        }
        uint64_t v71 = *(void *)(a4 + 24);
        int v72 = 7;
        int v73 = *(_DWORD *)a6;
        goto LABEL_130;
      case 8:
        uint64_t v49 = *a6;
        if ((char)*a6 < 0)
        {
          uint64_t v49 = v49 + (a6[1] << 7) - 128;
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_24C723CD0((uint64_t)a6, v49);
            if (!v8) {
              goto LABEL_169;
            }
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if (*(unsigned char *)(a4 + 1)) {
          sub_24C7195B4(v12, v11, 8, *(unsigned __int8 *)(a4 + 2), v49 != 0, *(uint64_t **)(a4 + 24));
        }
        else {
          sub_24C71939C((uint64_t)v12, v11, 8, v49 != 0, *(void *)(a4 + 24));
        }
        goto LABEL_169;
      case 9:
      case 0xC:
        char v14 = *(uint64_t **)(a4 + 24);
        if (*(unsigned char *)(a4 + 1)) {
          uint64_t v15 = (uint64_t)sub_24C71A570(a1, a2, 9, v14);
        }
        else {
          uint64_t v15 = sub_24C71A2C8(a1, a2, 9, v14);
        }
        uint64_t v58 = (std::string *)v15;
        int v59 = *v8;
        if ((char)*v8 < 0)
        {
          uint64_t v61 = sub_24C723D5C((uint64_t)v8, *v8);
          if (!v61)
          {
LABEL_113:
            unint64_t v8 = 0;
            goto LABEL_169;
          }
          v60 = (std::string::value_type *)v61;
          int v59 = v62;
        }
        else
        {
          v60 = (std::string::value_type *)(v8 + 1);
        }
        return (unsigned __int8 *)sub_24C7216CC((uint64_t)a7, v60, v59, v58);
      case 0xA:
        uint64_t v50 = *(void *)(a4 + 8);
        uint64_t v51 = *(uint64_t **)(a4 + 24);
        if (*(unsigned char *)(a4 + 1)) {
          uint64_t v52 = sub_24C71ABB8(a1, a2, 10, v50, v51);
        }
        else {
          uint64_t v52 = sub_24C71A920(a1, a2, 10, v50, v51);
        }
        int v74 = a7[11].i32[0];
        BOOL v75 = __OFSUB__(v74--, 1);
        a7[11].i32[0] = v74;
        if (v74 < 0 != v75) {
          goto LABEL_113;
        }
        ++a7[11].i32[1];
        uint64_t v76 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, int32x2_t *))(*(void *)v52 + 88))(v52, v8, a7);
        a7[11] = vadd_s32(a7[11], (int32x2_t)0xFFFFFFFF00000001);
        __int32 v77 = a7[10].i32[0];
        a7[10].i32[0] = 0;
        if (v77 == ((8 * v11) | 3)) {
          unint64_t v8 = (unsigned __int8 *)v76;
        }
        else {
          unint64_t v8 = 0;
        }
        goto LABEL_169;
      case 0xB:
        uint64_t v22 = *(void *)(a4 + 8);
        unint64_t v23 = *(uint64_t **)(a4 + 24);
        if (*(unsigned char *)(a4 + 1)) {
          uint64_t v24 = sub_24C71ABB8(a1, a2, 11, v22, v23);
        }
        else {
          uint64_t v24 = sub_24C71A920(a1, a2, 11, v22, v23);
        }
        return (unsigned __int8 *)sub_24C723AD0(a7, v24, v8);
      case 0xD:
        int v25 = *a6;
        if ((char)*a6 < 0)
        {
          int v64 = v25 + (a6[1] << 7);
          int v25 = v64 - 128;
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_24C723CD0((uint64_t)a6, (v64 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            int v25 = v83;
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v46 = *(unsigned __int8 *)(a4 + 2);
          uint64_t v47 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v48 = 13;
LABEL_128:
          sub_24C718024(a1, a2, v48, v46, v25, v47);
        }
        else
        {
          uint64_t v71 = *(void *)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v72 = 13;
          int v73 = v25;
LABEL_130:
          sub_24C717E0C((uint64_t)a1, a2, v72, v73, v71);
        }
        goto LABEL_169;
      case 0xE:
        unint64_t v53 = *a6;
        if ((char)*a6 < 0)
        {
          int v78 = v53 + (a6[1] << 7);
          unint64_t v53 = (v78 - 128);
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_24C723CD0((uint64_t)a6, (v78 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            unint64_t v53 = v86;
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if ((*(uint64_t (**)(void, unint64_t))(a4 + 8))(*(void *)(a4 + 16), v53))
        {
          if (*(unsigned char *)(a4 + 1)) {
            sub_24C719F84(v12, v11, 14, *(unsigned __int8 *)(a4 + 2), v53, *(uint64_t **)(a4 + 24));
          }
          else {
            sub_24C719D6C((uint64_t)v12, v11, 14, v53, *(void *)(a4 + 24));
          }
        }
        else
        {
          if (*a5) {
            v87 = (std::string *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
          }
          else {
            v87 = (std::string *)sub_24C7078BC(a5);
          }
          sub_24C723BBC(v11, v53, v87);
        }
        goto LABEL_169;
      case 0xF:
        unint64_t v8 = a6 + 4;
        int v21 = *(_DWORD *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v26 = *(unsigned __int8 *)(a4 + 2);
          unint64_t v27 = *(uint64_t **)(a4 + 24);
          int v28 = 15;
          goto LABEL_134;
        }
        uint64_t v65 = *(void *)(a4 + 24);
        int v66 = 15;
        goto LABEL_136;
      case 0x10:
        unint64_t v8 = a6 + 8;
        uint64_t v41 = *(void *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v54 = *(unsigned __int8 *)(a4 + 2);
          v55 = *(uint64_t **)(a4 + 24);
          int v56 = 16;
          goto LABEL_166;
        }
        uint64_t v79 = *(void *)(a4 + 24);
        int v80 = 16;
        goto LABEL_168;
      case 0x11:
        LODWORD(v29) = *a6;
        if ((char)*a6 < 0)
        {
          uint64_t v29 = v29 + (a6[1] << 7) - 128;
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_24C723CD0((uint64_t)a6, v29);
            if (!v8) {
              goto LABEL_169;
            }
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        int v21 = -(v29 & 1) ^ (v29 >> 1);
        if (*(unsigned char *)(a4 + 1))
        {
          int v26 = *(unsigned __int8 *)(a4 + 2);
          unint64_t v27 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v28 = 17;
LABEL_134:
          sub_24C71756C(a1, a2, v28, v26, v21, v27);
        }
        else
        {
          uint64_t v65 = *(void *)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v66 = 17;
LABEL_136:
          int v82 = v21;
LABEL_137:
          sub_24C717354((uint64_t)a1, a2, v66, v82, v65);
        }
        goto LABEL_169;
      case 0x12:
        unint64_t v57 = *a6;
        if ((char)*a6 < 0)
        {
          unint64_t v57 = v57 + (a6[1] << 7) - 128;
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_24C723CD0((uint64_t)a6, v57);
            if (!v8) {
              goto LABEL_169;
            }
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        uint64_t v41 = -(uint64_t)(v57 & 1) ^ (v57 >> 1);
        if (*(unsigned char *)(a4 + 1))
        {
          int v54 = *(unsigned __int8 *)(a4 + 2);
          v55 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v56 = 18;
LABEL_166:
          sub_24C717AC8(a1, a2, v56, v54, v41, v55);
        }
        else
        {
          uint64_t v79 = *(void *)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v80 = 18;
LABEL_168:
          sub_24C7178B0((uint64_t)a1, a2, v80, v41, v79);
        }
LABEL_169:
        uint64_t result = v8;
        break;
      default:
        goto LABEL_169;
    }
  }
  return result;
}

void sub_24C71D4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_24C71D5A4(uint64_t a1, signed int a2, int a3, char *a4, uint64_t *a5)
{
  uint64_t v7 = *(unsigned int **)(a1 + 16);
  if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
  {
    uint64_t v18 = *((void *)v7 + 1);
    uint64_t v17 = v7 + 2;
    uint64_t v16 = v18;
    if (v18)
    {
      unint64_t v19 = v17;
      do
      {
        int v20 = *(_DWORD *)(v16 + 32);
        BOOL v21 = v20 < a2;
        if (v20 >= a2) {
          uint64_t v22 = (uint64_t *)v16;
        }
        else {
          uint64_t v22 = (uint64_t *)(v16 + 8);
        }
        if (!v21) {
          unint64_t v19 = (void *)v16;
        }
        uint64_t v16 = *v22;
      }
      while (*v22);
      if (v19 != (void *)v17)
      {
        do
        {
          uint64_t v23 = *((unsigned int *)v19 + 8);
          if ((int)v23 >= a3) {
            break;
          }
          a4 = sub_24C71D6D4((unsigned char *)v19 + 40, v23, a4, a5);
          uint64_t v24 = (unsigned int *)v19[1];
          if (v24)
          {
            do
            {
              int v25 = v24;
              uint64_t v24 = *(unsigned int **)v24;
            }
            while (v24);
          }
          else
          {
            do
            {
              int v25 = (unsigned int *)v19[2];
              BOOL v26 = *(void *)v25 == (void)v19;
              unint64_t v19 = v25;
            }
            while (!v26);
          }
          unint64_t v19 = v25;
        }
        while (v25 != v17);
      }
    }
  }
  else
  {
    unint64_t v8 = *(unsigned __int16 *)(a1 + 10);
    if (*(_WORD *)(a1 + 10))
    {
      unsigned int v9 = &v7[8 * v8];
      do
      {
        unint64_t v10 = v8 >> 1;
        uint64_t v11 = &v7[8 * (v8 >> 1)];
        signed int v13 = *v11;
        unsigned int v12 = v11 + 8;
        v8 += ~(v8 >> 1);
        if (v13 < a2) {
          uint64_t v7 = v12;
        }
        else {
          unint64_t v8 = v10;
        }
      }
      while (v8);
      while (v7 != v9)
      {
        uint64_t v14 = *v7;
        if ((int)v14 >= a3) {
          break;
        }
        a4 = sub_24C71D6D4((unsigned char *)v7 + 8, v14, a4, a5);
        v7 += 8;
      }
    }
  }
  return a4;
}

char *sub_24C71D6D4(unsigned char *a1, uint64_t a2, char *a3, uint64_t *a4)
{
  int v5 = a3;
  if (a1[9])
  {
    if (a1[11])
    {
      if (*((_DWORD *)a1 + 3))
      {
        if (*a4 <= (unint64_t)a3) {
          int v5 = sub_24C715FA8((uint64_t)a4, a3);
        }
        unsigned int v8 = (8 * a2) | 2;
        if (v8 > 0x7F)
        {
          *int v5 = (8 * a2) | 0x82;
          unsigned int v32 = (8 * a2) >> 7;
          if (v8 >> 14)
          {
            unsigned int v9 = v5 + 2;
            do
            {
              *(v9 - 1) = v32 | 0x80;
              unsigned int v33 = v32 >> 7;
              ++v9;
              unsigned int v34 = v32 >> 14;
              v32 >>= 7;
            }
            while (v34);
            *(v9 - 1) = v33;
          }
          else
          {
            v5[1] = v32;
            unsigned int v9 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v8;
          unsigned int v9 = v5 + 1;
        }
        unint64_t v35 = *((int *)a1 + 3);
        if (v35 > 0x7F)
        {
          unsigned char *v9 = v35 | 0x80;
          unint64_t v36 = v35 >> 7;
          if (v35 >> 14)
          {
            int v5 = v9 + 2;
            do
            {
              *(v5 - 1) = v36 | 0x80;
              unint64_t v37 = v36 >> 7;
              ++v5;
              unint64_t v38 = v36 >> 14;
              v36 >>= 7;
            }
            while (v38);
            *(v5 - 1) = v37;
          }
          else
          {
            v9[1] = v36;
            int v5 = v9 + 2;
          }
        }
        else
        {
          unsigned char *v9 = v35;
          int v5 = v9 + 1;
        }
        int v39 = a1[8];
        if ((v39 - 19) <= 0xFFFFFFED)
        {
          sub_24C716A34((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
          float v40 = sub_24C716A4C(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
          sub_24C716B88((uint64_t)&v431, (const char **)&v40->__r_.__value_.__l.__data_);
          sub_24C716B90((uint64_t)v432);
        }
        switch(v39)
        {
          case 1:
            int v63 = *(int **)a1;
            if (**(int **)a1 >= 1)
            {
              int v64 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  int v63 = *(int **)a1;
                }
                *(void *)int v5 = *(void *)sub_24C728D50(v63, v64);
                v5 += 8;
                ++v64;
                int v63 = *(int **)a1;
              }
              while (v64 < **(_DWORD **)a1);
            }
            break;
          case 2:
            uint64_t v65 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v66 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  uint64_t v65 = *(_DWORD **)a1;
                }
                *(_DWORD *)int v5 = *(_DWORD *)sub_24C7286F4(v65, v66);
                v5 += 4;
                ++v66;
                uint64_t v65 = *(_DWORD **)a1;
              }
              while (v66 < **(_DWORD **)a1);
            }
            break;
          case 3:
            int v67 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v68 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  int v67 = *(_DWORD **)a1;
                }
                unint64_t v69 = *(void *)sub_24C727A3C(v67, v68);
                if (v69 > 0x7F)
                {
                  *int v5 = v69 | 0x80;
                  unint64_t v70 = v69 >> 7;
                  if (v69 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v70 | 0x80;
                      unint64_t v71 = v70 >> 7;
                      ++v5;
                      unint64_t v72 = v70 >> 14;
                      v70 >>= 7;
                    }
                    while (v72);
                    *(v5 - 1) = v71;
                  }
                  else
                  {
                    v5[1] = v70;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v69;
                }
                ++v68;
                int v67 = *(_DWORD **)a1;
              }
              while (v68 < **(_DWORD **)a1);
            }
            break;
          case 4:
            int v73 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v74 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  int v73 = *(_DWORD **)a1;
                }
                unint64_t v75 = *(void *)sub_24C728098(v73, v74);
                if (v75 > 0x7F)
                {
                  *int v5 = v75 | 0x80;
                  unint64_t v76 = v75 >> 7;
                  if (v75 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v76 | 0x80;
                      unint64_t v77 = v76 >> 7;
                      ++v5;
                      unint64_t v78 = v76 >> 14;
                      v76 >>= 7;
                    }
                    while (v78);
                    *(v5 - 1) = v77;
                  }
                  else
                  {
                    v5[1] = v76;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v75;
                }
                ++v74;
                int v73 = *(_DWORD **)a1;
              }
              while (v74 < **(_DWORD **)a1);
            }
            break;
          case 5:
            uint64_t v42 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v43 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  uint64_t v42 = *(_DWORD **)a1;
                }
                unint64_t v44 = *(int *)sub_24C726D84(v42, v43);
                if (v44 > 0x7F)
                {
                  *int v5 = v44 | 0x80;
                  unint64_t v45 = v44 >> 7;
                  if (v44 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v45 | 0x80;
                      unint64_t v46 = v45 >> 7;
                      ++v5;
                      unint64_t v47 = v45 >> 14;
                      v45 >>= 7;
                    }
                    while (v47);
                    *(v5 - 1) = v46;
                  }
                  else
                  {
                    v5[1] = v45;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v44;
                }
                ++v43;
                uint64_t v42 = *(_DWORD **)a1;
              }
              while (v43 < **(_DWORD **)a1);
            }
            break;
          case 6:
            uint64_t v79 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v80 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  uint64_t v79 = *(_DWORD **)a1;
                }
                *(void *)int v5 = *(void *)sub_24C728098(v79, v80);
                v5 += 8;
                ++v80;
                uint64_t v79 = *(_DWORD **)a1;
              }
              while (v80 < **(_DWORD **)a1);
            }
            break;
          case 7:
            int v81 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v82 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  int v81 = *(_DWORD **)a1;
                }
                *(_DWORD *)int v5 = *(_DWORD *)sub_24C7273E0(v81, v82);
                v5 += 4;
                ++v82;
                int v81 = *(_DWORD **)a1;
              }
              while (v82 < **(_DWORD **)a1);
            }
            break;
          case 8:
            int v83 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v84 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  int v83 = *(_DWORD **)a1;
                }
                *v5++ = *(unsigned char *)sub_24C72672C(v83, v84++);
                int v83 = *(_DWORD **)a1;
              }
              while (v84 < **(_DWORD **)a1);
            }
            break;
          case 9:
          case 10:
          case 11:
          case 12:
            sub_24C716A34((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1966);
            uint64_t v41 = sub_24C716A4C(v432, "Non-primitive types can't be packed.");
            sub_24C716B88((uint64_t)&v431, (const char **)&v41->__r_.__value_.__l.__data_);
            sub_24C716B90((uint64_t)v432);
            break;
          case 13:
            int v48 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v49 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  int v48 = *(_DWORD **)a1;
                }
                unsigned int v50 = *(_DWORD *)sub_24C7273E0(v48, v49);
                if (v50 > 0x7F)
                {
                  *int v5 = v50 | 0x80;
                  unsigned int v51 = v50 >> 7;
                  if (v50 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v51 | 0x80;
                      unsigned int v52 = v51 >> 7;
                      ++v5;
                      unsigned int v53 = v51 >> 14;
                      v51 >>= 7;
                    }
                    while (v53);
                    *(v5 - 1) = v52;
                  }
                  else
                  {
                    v5[1] = v51;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v50;
                }
                ++v49;
                int v48 = *(_DWORD **)a1;
              }
              while (v49 < **(_DWORD **)a1);
            }
            break;
          case 14:
            uint64_t v85 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v86 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  uint64_t v85 = *(_DWORD **)a1;
                }
                unint64_t v87 = *(int *)sub_24C726D84(v85, v86);
                if (v87 > 0x7F)
                {
                  *int v5 = v87 | 0x80;
                  unint64_t v88 = v87 >> 7;
                  if (v87 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v88 | 0x80;
                      unint64_t v89 = v88 >> 7;
                      ++v5;
                      unint64_t v90 = v88 >> 14;
                      v88 >>= 7;
                    }
                    while (v90);
                    *(v5 - 1) = v89;
                  }
                  else
                  {
                    v5[1] = v88;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v87;
                }
                ++v86;
                uint64_t v85 = *(_DWORD **)a1;
              }
              while (v86 < **(_DWORD **)a1);
            }
            break;
          case 15:
            int v54 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v55 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  int v54 = *(_DWORD **)a1;
                }
                *(_DWORD *)int v5 = *(_DWORD *)sub_24C726D84(v54, v55);
                v5 += 4;
                ++v55;
                int v54 = *(_DWORD **)a1;
              }
              while (v55 < **(_DWORD **)a1);
            }
            break;
          case 16:
            int v91 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v92 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  int v91 = *(_DWORD **)a1;
                }
                *(void *)int v5 = *(void *)sub_24C727A3C(v91, v92);
                v5 += 8;
                ++v92;
                int v91 = *(_DWORD **)a1;
              }
              while (v92 < **(_DWORD **)a1);
            }
            break;
          case 17:
            int v56 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v57 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  int v56 = *(_DWORD **)a1;
                }
                uint64_t v58 = (int *)sub_24C726D84(v56, v57);
                unsigned int v59 = (2 * *v58) ^ (*v58 >> 31);
                if (v59 > 0x7F)
                {
                  *int v5 = v59 | 0x80;
                  unsigned int v60 = v59 >> 7;
                  if (v59 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v60 | 0x80;
                      unsigned int v61 = v60 >> 7;
                      ++v5;
                      unsigned int v62 = v60 >> 14;
                      v60 >>= 7;
                    }
                    while (v62);
                    *(v5 - 1) = v61;
                  }
                  else
                  {
                    v5[1] = v60;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v59;
                }
                ++v57;
                int v56 = *(_DWORD **)a1;
              }
              while (v57 < **(_DWORD **)a1);
            }
            break;
          case 18:
            v93 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v94 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_24C715FA8((uint64_t)a4, v5);
                  v93 = *(_DWORD **)a1;
                }
                v95 = (uint64_t *)sub_24C727A3C(v93, v94);
                unint64_t v96 = (2 * *v95) ^ (*v95 >> 63);
                if (v96 > 0x7F)
                {
                  *int v5 = v96 | 0x80;
                  unint64_t v97 = v96 >> 7;
                  if (v96 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v97 | 0x80;
                      unint64_t v98 = v97 >> 7;
                      ++v5;
                      unint64_t v99 = v97 >> 14;
                      v97 >>= 7;
                    }
                    while (v99);
                    *(v5 - 1) = v98;
                  }
                  else
                  {
                    v5[1] = v97;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v96;
                }
                ++v94;
                v93 = *(_DWORD **)a1;
              }
              while (v94 < **(_DWORD **)a1);
            }
            break;
          default:
            return v5;
        }
      }
      return v5;
    }
    int v18 = a1[8];
    if ((v18 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unint64_t v19 = sub_24C716A4C(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v431, (const char **)&v19->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v432);
    }
    switch(v18)
    {
      case 1:
        int v20 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v21 = 0;
          unsigned int v22 = 8 * a2;
          unsigned int v23 = (8 * a2) | 1;
          char v24 = (8 * a2) | 0x81;
          unsigned int v25 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v26 = v22 >> 7;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              int v20 = *(_DWORD **)a1;
            }
            uint64_t v27 = *(void *)sub_24C728D50(v20, v21);
            if (v23 > 0x7F)
            {
              *int v5 = v24;
              if (v23 >= 0x4000)
              {
                int v28 = v5 + 2;
                unsigned int v29 = v25;
                do
                {
                  *((unsigned char *)v28 - 1) = v29 | 0x80;
                  unsigned int v30 = v29 >> 7;
                  int v28 = (void *)((char *)v28 + 1);
                  unsigned int v31 = v29 >> 14;
                  v29 >>= 7;
                }
                while (v31);
                *((unsigned char *)v28 - 1) = v30;
              }
              else
              {
                v5[1] = v26;
                int v28 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v23;
              int v28 = v5 + 1;
            }
            *int v28 = v27;
            int v5 = (char *)(v28 + 1);
            ++v21;
            int v20 = *(_DWORD **)a1;
          }
          while (v21 < **(_DWORD **)a1);
        }
        return v5;
      case 2:
        v100 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v101 = 0;
          unsigned int v102 = (8 * a2) | 5;
          unsigned int v103 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v104 = (8 * a2) >> 7;
          char v105 = (8 * a2) | 0x85;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v100 = *(_DWORD **)a1;
            }
            int v106 = *(_DWORD *)sub_24C7286F4(v100, v101);
            if (v102 > 0x7F)
            {
              *int v5 = v105;
              if (v102 >= 0x4000)
              {
                v107 = v5 + 2;
                unsigned int v108 = v103;
                do
                {
                  *((unsigned char *)v107 - 1) = v108 | 0x80;
                  unsigned int v109 = v108 >> 7;
                  v107 = (_DWORD *)((char *)v107 + 1);
                  unsigned int v110 = v108 >> 14;
                  v108 >>= 7;
                }
                while (v110);
                *((unsigned char *)v107 - 1) = v109;
              }
              else
              {
                v5[1] = v104;
                v107 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v102;
              v107 = v5 + 1;
            }
            _DWORD *v107 = v106;
            int v5 = (char *)(v107 + 1);
            ++v101;
            v100 = *(_DWORD **)a1;
          }
          while (v101 < **(_DWORD **)a1);
        }
        return v5;
      case 3:
        v111 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v112 = 0;
          unsigned int v113 = 8 * a2;
          char v114 = (8 * a2) | 0x80;
          unsigned int v115 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v111 = *(_DWORD **)a1;
            }
            unint64_t v116 = *(void *)sub_24C727A3C(v111, v112);
            if (v113 > 0x7F)
            {
              *int v5 = v114;
              if (v113 >= 0x4000)
              {
                v117 = v5 + 2;
                unsigned int v118 = v115;
                do
                {
                  *(v117 - 1) = v118 | 0x80;
                  unsigned int v119 = v118 >> 7;
                  ++v117;
                  unsigned int v120 = v118 >> 14;
                  v118 >>= 7;
                }
                while (v120);
                *(v117 - 1) = v119;
              }
              else
              {
                v5[1] = v113 >> 7;
                v117 = v5 + 2;
              }
            }
            else
            {
              v117 = v5 + 1;
              *int v5 = v113;
            }
            if (v116 > 0x7F)
            {
              unsigned char *v117 = v116 | 0x80;
              unint64_t v121 = v116 >> 7;
              if (v116 >> 14)
              {
                int v5 = v117 + 2;
                do
                {
                  *(v5 - 1) = v121 | 0x80;
                  unint64_t v122 = v121 >> 7;
                  ++v5;
                  unint64_t v123 = v121 >> 14;
                  v121 >>= 7;
                }
                while (v123);
                *(v5 - 1) = v122;
              }
              else
              {
                v117[1] = v121;
                int v5 = v117 + 2;
              }
            }
            else
            {
              unsigned char *v117 = v116;
              int v5 = v117 + 1;
            }
            ++v112;
            v111 = *(_DWORD **)a1;
          }
          while (v112 < **(_DWORD **)a1);
        }
        return v5;
      case 4:
        v124 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v125 = 0;
          unsigned int v126 = 8 * a2;
          char v127 = (8 * a2) | 0x80;
          unsigned int v128 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v124 = *(_DWORD **)a1;
            }
            unint64_t v129 = *(void *)sub_24C728098(v124, v125);
            if (v126 > 0x7F)
            {
              *int v5 = v127;
              if (v126 >= 0x4000)
              {
                v130 = v5 + 2;
                unsigned int v131 = v128;
                do
                {
                  *(v130 - 1) = v131 | 0x80;
                  unsigned int v132 = v131 >> 7;
                  ++v130;
                  unsigned int v133 = v131 >> 14;
                  v131 >>= 7;
                }
                while (v133);
                *(v130 - 1) = v132;
              }
              else
              {
                v5[1] = v126 >> 7;
                v130 = v5 + 2;
              }
            }
            else
            {
              v130 = v5 + 1;
              *int v5 = v126;
            }
            if (v129 > 0x7F)
            {
              unsigned char *v130 = v129 | 0x80;
              unint64_t v134 = v129 >> 7;
              if (v129 >> 14)
              {
                int v5 = v130 + 2;
                do
                {
                  *(v5 - 1) = v134 | 0x80;
                  unint64_t v135 = v134 >> 7;
                  ++v5;
                  unint64_t v136 = v134 >> 14;
                  v134 >>= 7;
                }
                while (v136);
                *(v5 - 1) = v135;
              }
              else
              {
                v130[1] = v134;
                int v5 = v130 + 2;
              }
            }
            else
            {
              unsigned char *v130 = v129;
              int v5 = v130 + 1;
            }
            ++v125;
            v124 = *(_DWORD **)a1;
          }
          while (v125 < **(_DWORD **)a1);
        }
        return v5;
      case 5:
        v137 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v138 = 0;
          unsigned int v139 = 8 * a2;
          char v140 = (8 * a2) | 0x80;
          unsigned int v141 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v137 = *(_DWORD **)a1;
            }
            unint64_t v142 = *(int *)sub_24C726D84(v137, v138);
            if (v139 > 0x7F)
            {
              *int v5 = v140;
              if (v139 >= 0x4000)
              {
                v143 = v5 + 2;
                unsigned int v144 = v141;
                do
                {
                  *(v143 - 1) = v144 | 0x80;
                  unsigned int v145 = v144 >> 7;
                  ++v143;
                  unsigned int v146 = v144 >> 14;
                  v144 >>= 7;
                }
                while (v146);
                *(v143 - 1) = v145;
              }
              else
              {
                v5[1] = v139 >> 7;
                v143 = v5 + 2;
              }
            }
            else
            {
              v143 = v5 + 1;
              *int v5 = v139;
            }
            if (v142 > 0x7F)
            {
              unsigned char *v143 = v142 | 0x80;
              unint64_t v147 = v142 >> 7;
              if (v142 >> 14)
              {
                int v5 = v143 + 2;
                do
                {
                  *(v5 - 1) = v147 | 0x80;
                  unint64_t v148 = v147 >> 7;
                  ++v5;
                  unint64_t v149 = v147 >> 14;
                  v147 >>= 7;
                }
                while (v149);
                *(v5 - 1) = v148;
              }
              else
              {
                v143[1] = v147;
                int v5 = v143 + 2;
              }
            }
            else
            {
              unsigned char *v143 = v142;
              int v5 = v143 + 1;
            }
            ++v138;
            v137 = *(_DWORD **)a1;
          }
          while (v138 < **(_DWORD **)a1);
        }
        return v5;
      case 6:
        v150 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v151 = 0;
          unsigned int v152 = 8 * a2;
          unsigned int v153 = (8 * a2) | 1;
          char v154 = (8 * a2) | 0x81;
          unsigned int v155 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v156 = v152 >> 7;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v150 = *(_DWORD **)a1;
            }
            uint64_t v157 = *(void *)sub_24C728098(v150, v151);
            if (v153 > 0x7F)
            {
              *int v5 = v154;
              if (v153 >= 0x4000)
              {
                v158 = v5 + 2;
                unsigned int v159 = v155;
                do
                {
                  *((unsigned char *)v158 - 1) = v159 | 0x80;
                  unsigned int v160 = v159 >> 7;
                  v158 = (void *)((char *)v158 + 1);
                  unsigned int v161 = v159 >> 14;
                  v159 >>= 7;
                }
                while (v161);
                *((unsigned char *)v158 - 1) = v160;
              }
              else
              {
                v5[1] = v156;
                v158 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v153;
              v158 = v5 + 1;
            }
            void *v158 = v157;
            int v5 = (char *)(v158 + 1);
            ++v151;
            v150 = *(_DWORD **)a1;
          }
          while (v151 < **(_DWORD **)a1);
        }
        return v5;
      case 7:
        v162 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v163 = 0;
          unsigned int v164 = (8 * a2) | 5;
          unsigned int v165 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v166 = (8 * a2) >> 7;
          char v167 = (8 * a2) | 0x85;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v162 = *(_DWORD **)a1;
            }
            int v168 = *(_DWORD *)sub_24C7273E0(v162, v163);
            if (v164 > 0x7F)
            {
              *int v5 = v167;
              if (v164 >= 0x4000)
              {
                v169 = v5 + 2;
                unsigned int v170 = v165;
                do
                {
                  *((unsigned char *)v169 - 1) = v170 | 0x80;
                  unsigned int v171 = v170 >> 7;
                  v169 = (_DWORD *)((char *)v169 + 1);
                  unsigned int v172 = v170 >> 14;
                  v170 >>= 7;
                }
                while (v172);
                *((unsigned char *)v169 - 1) = v171;
              }
              else
              {
                v5[1] = v166;
                v169 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v164;
              v169 = v5 + 1;
            }
            _DWORD *v169 = v168;
            int v5 = (char *)(v169 + 1);
            ++v163;
            v162 = *(_DWORD **)a1;
          }
          while (v163 < **(_DWORD **)a1);
        }
        return v5;
      case 8:
        v173 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v174 = 0;
          unsigned int v175 = 8 * a2;
          char v176 = (8 * a2) | 0x80;
          unsigned int v177 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v173 = *(_DWORD **)a1;
            }
            char v178 = *(unsigned char *)sub_24C72672C(v173, v174);
            if (v175 > 0x7F)
            {
              *int v5 = v176;
              if (v175 >= 0x4000)
              {
                v179 = v5 + 2;
                unsigned int v180 = v177;
                do
                {
                  *(v179 - 1) = v180 | 0x80;
                  unsigned int v181 = v180 >> 7;
                  ++v179;
                  unsigned int v182 = v180 >> 14;
                  v180 >>= 7;
                }
                while (v182);
                *(v179 - 1) = v181;
              }
              else
              {
                v5[1] = v175 >> 7;
                v179 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v175;
              v179 = v5 + 1;
            }
            unsigned char *v179 = v178;
            int v5 = v179 + 1;
            ++v174;
            v173 = *(_DWORD **)a1;
          }
          while (v174 < **(_DWORD **)a1);
        }
        return v5;
      case 9:
        uint64_t v183 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) < 1) {
          return v5;
        }
        int v184 = 0;
        unsigned int v185 = 8 * a2;
        uint64_t v186 = 4;
        if (((a2 >> 25) & 0xF) != 0) {
          uint64_t v186 = 5;
        }
        unsigned int v187 = (8 * a2) | 2;
        uint64_t v188 = 1;
        if (v185 >= 0x80) {
          uint64_t v188 = 2;
        }
        if (v185 < 0x200000) {
          uint64_t v186 = 3;
        }
        if (v185 >= 0x4000) {
          uint64_t v189 = v186;
        }
        else {
          uint64_t v189 = v188;
        }
        unsigned int v429 = v185 >> 7;
        while (1)
        {
          if (*a4 <= (unint64_t)v5)
          {
            int v5 = sub_24C715FA8((uint64_t)a4, v5);
            uint64_t v183 = *(void *)a1;
          }
          uint64_t v190 = sub_24C71106C(v183, v184);
          if (*(char *)(v190 + 23) < 0)
          {
            int64_t v191 = *(void *)(v190 + 8);
            if (v191 > 127) {
              goto LABEL_326;
            }
          }
          else
          {
            int64_t v191 = *(unsigned __int8 *)(v190 + 23);
          }
          if ((uint64_t)(*a4 + ~(unint64_t)&v5[v189] + 16) >= v191)
          {
            if (v187 > 0x7F)
            {
              *int v5 = (8 * a2) | 0x82;
              if (v187 >= 0x4000)
              {
                v192 = v5 + 2;
                unsigned int v193 = (a2 >> 4) & 0x1FFFFFF;
                do
                {
                  *(v192 - 1) = v193 | 0x80;
                  unsigned int v194 = v193 >> 7;
                  ++v192;
                  unsigned int v195 = v193 >> 14;
                  v193 >>= 7;
                }
                while (v195);
                *(v192 - 1) = v194;
              }
              else
              {
                v5[1] = v429;
                v192 = v5 + 2;
              }
            }
            else
            {
              v192 = v5 + 1;
              *int v5 = v187;
            }
            unsigned char *v192 = v191;
            v196 = v192 + 1;
            if (*(char *)(v190 + 23) >= 0) {
              v197 = (const void *)v190;
            }
            else {
              v197 = *(const void **)v190;
            }
            memcpy(v196, v197, v191);
            int v5 = &v196[v191];
            goto LABEL_324;
          }
LABEL_326:
          int v5 = sub_24C716518(a4, a2, v190, v5);
LABEL_324:
          ++v184;
          uint64_t v183 = *(void *)a1;
          if (v184 >= *(_DWORD *)(*(void *)a1 + 8)) {
            return v5;
          }
        }
      case 10:
        uint64_t v198 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) >= 1)
        {
          int v199 = 0;
          unsigned int v200 = (8 * a2) | 3;
          char v201 = (8 * a2) | 0x83;
          unsigned int v202 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v203 = (8 * a2) | 4;
          unsigned int v204 = (8 * a2) >> 7;
          char v205 = (8 * a2) | 0x84;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              uint64_t v198 = *(void *)a1;
            }
            uint64_t v206 = sub_24C721434(v198, v199);
            if (v200 > 0x7F)
            {
              *int v5 = v201;
              if (v200 >= 0x4000)
              {
                v207 = v5 + 2;
                unsigned int v208 = v202;
                do
                {
                  *(v207 - 1) = v208 | 0x80;
                  unsigned int v209 = v208 >> 7;
                  ++v207;
                  unsigned int v210 = v208 >> 14;
                  v208 >>= 7;
                }
                while (v210);
                *(v207 - 1) = v209;
              }
              else
              {
                v5[1] = v204;
                v207 = v5 + 2;
              }
            }
            else
            {
              v207 = v5 + 1;
              *int v5 = v200;
            }
            v211 = (char *)(*(uint64_t (**)(uint64_t, char *, uint64_t *))(*(void *)v206 + 96))(v206, v207, a4);
            if (*a4 <= (unint64_t)v211) {
              v211 = sub_24C715FA8((uint64_t)a4, v211);
            }
            if (v203 > 0x7F)
            {
              char *v211 = v205;
              if (v203 >= 0x4000)
              {
                int v5 = v211 + 2;
                unsigned int v212 = v202;
                do
                {
                  *(v5 - 1) = v212 | 0x80;
                  unsigned int v213 = v212 >> 7;
                  ++v5;
                  unsigned int v214 = v212 >> 14;
                  v212 >>= 7;
                }
                while (v214);
                *(v5 - 1) = v213;
              }
              else
              {
                v211[1] = v204;
                int v5 = v211 + 2;
              }
            }
            else
            {
              int v5 = v211 + 1;
              char *v211 = v203;
            }
            ++v199;
            uint64_t v198 = *(void *)a1;
          }
          while (v199 < *(_DWORD *)(*(void *)a1 + 8));
        }
        return v5;
      case 11:
        uint64_t v215 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) >= 1)
        {
          int v216 = 0;
          unsigned int v217 = (8 * a2) | 2;
          unsigned int v218 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v219 = (8 * a2) >> 7;
          char v220 = (8 * a2) | 0x82;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              uint64_t v215 = *(void *)a1;
            }
            uint64_t v221 = sub_24C721434(v215, v216);
            uint64_t v222 = v221;
            if (v217 > 0x7F)
            {
              *int v5 = v220;
              if (v217 >= 0x4000)
              {
                v223 = v5 + 2;
                unsigned int v224 = v218;
                do
                {
                  *(v223 - 1) = v224 | 0x80;
                  unsigned int v225 = v224 >> 7;
                  ++v223;
                  unsigned int v226 = v224 >> 14;
                  v224 >>= 7;
                }
                while (v226);
                *(v223 - 1) = v225;
              }
              else
              {
                v5[1] = v219;
                v223 = v5 + 2;
              }
            }
            else
            {
              v223 = v5 + 1;
              *int v5 = v217;
            }
            unsigned int v227 = (*(uint64_t (**)(uint64_t))(*(void *)v221 + 80))(v221);
            if (v227 > 0x7F)
            {
              unsigned char *v223 = v227 | 0x80;
              unsigned int v229 = v227 >> 7;
              if (v227 >> 14)
              {
                v228 = v223 + 2;
                do
                {
                  *(v228 - 1) = v229 | 0x80;
                  unsigned int v230 = v229 >> 7;
                  ++v228;
                  unsigned int v231 = v229 >> 14;
                  v229 >>= 7;
                }
                while (v231);
                *(v228 - 1) = v230;
              }
              else
              {
                v223[1] = v229;
                v228 = v223 + 2;
              }
            }
            else
            {
              unsigned char *v223 = v227;
              v228 = v223 + 1;
            }
            int v5 = (char *)(*(uint64_t (**)(uint64_t, unsigned char *, uint64_t *))(*(void *)v222 + 96))(v222, v228, a4);
            ++v216;
            uint64_t v215 = *(void *)a1;
          }
          while (v216 < *(_DWORD *)(*(void *)a1 + 8));
        }
        return v5;
      case 12:
        uint64_t v232 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) < 1) {
          return v5;
        }
        int v233 = 0;
        unsigned int v234 = 8 * a2;
        uint64_t v235 = 4;
        if (((a2 >> 25) & 0xF) != 0) {
          uint64_t v235 = 5;
        }
        unsigned int v236 = (8 * a2) | 2;
        uint64_t v237 = 1;
        if (v234 >= 0x80) {
          uint64_t v237 = 2;
        }
        if (v234 < 0x200000) {
          uint64_t v235 = 3;
        }
        if (v234 >= 0x4000) {
          uint64_t v238 = v235;
        }
        else {
          uint64_t v238 = v237;
        }
        unsigned int v430 = v234 >> 7;
        break;
      case 13:
        v247 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v248 = 0;
          unsigned int v249 = 8 * a2;
          char v250 = (8 * a2) | 0x80;
          unsigned int v251 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v247 = *(_DWORD **)a1;
            }
            unsigned int v252 = *(_DWORD *)sub_24C7273E0(v247, v248);
            if (v249 > 0x7F)
            {
              *int v5 = v250;
              if (v249 >= 0x4000)
              {
                v253 = v5 + 2;
                unsigned int v254 = v251;
                do
                {
                  *(v253 - 1) = v254 | 0x80;
                  unsigned int v255 = v254 >> 7;
                  ++v253;
                  unsigned int v256 = v254 >> 14;
                  v254 >>= 7;
                }
                while (v256);
                *(v253 - 1) = v255;
              }
              else
              {
                v5[1] = v249 >> 7;
                v253 = v5 + 2;
              }
            }
            else
            {
              v253 = v5 + 1;
              *int v5 = v249;
            }
            if (v252 > 0x7F)
            {
              unsigned char *v253 = v252 | 0x80;
              unsigned int v257 = v252 >> 7;
              if (v252 >> 14)
              {
                int v5 = v253 + 2;
                do
                {
                  *(v5 - 1) = v257 | 0x80;
                  unsigned int v258 = v257 >> 7;
                  ++v5;
                  unsigned int v259 = v257 >> 14;
                  v257 >>= 7;
                }
                while (v259);
                *(v5 - 1) = v258;
              }
              else
              {
                v253[1] = v257;
                int v5 = v253 + 2;
              }
            }
            else
            {
              unsigned char *v253 = v252;
              int v5 = v253 + 1;
            }
            ++v248;
            v247 = *(_DWORD **)a1;
          }
          while (v248 < **(_DWORD **)a1);
        }
        return v5;
      case 14:
        v260 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v261 = 0;
          unsigned int v262 = 8 * a2;
          char v263 = (8 * a2) | 0x80;
          unsigned int v264 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v260 = *(_DWORD **)a1;
            }
            unint64_t v265 = *(int *)sub_24C726D84(v260, v261);
            if (v262 > 0x7F)
            {
              *int v5 = v263;
              if (v262 >= 0x4000)
              {
                v266 = v5 + 2;
                unsigned int v267 = v264;
                do
                {
                  *(v266 - 1) = v267 | 0x80;
                  unsigned int v268 = v267 >> 7;
                  ++v266;
                  unsigned int v269 = v267 >> 14;
                  v267 >>= 7;
                }
                while (v269);
                *(v266 - 1) = v268;
              }
              else
              {
                v5[1] = v262 >> 7;
                v266 = v5 + 2;
              }
            }
            else
            {
              v266 = v5 + 1;
              *int v5 = v262;
            }
            if (v265 > 0x7F)
            {
              unsigned char *v266 = v265 | 0x80;
              unint64_t v270 = v265 >> 7;
              if (v265 >> 14)
              {
                int v5 = v266 + 2;
                do
                {
                  *(v5 - 1) = v270 | 0x80;
                  unint64_t v271 = v270 >> 7;
                  ++v5;
                  unint64_t v272 = v270 >> 14;
                  v270 >>= 7;
                }
                while (v272);
                *(v5 - 1) = v271;
              }
              else
              {
                v266[1] = v270;
                int v5 = v266 + 2;
              }
            }
            else
            {
              unsigned char *v266 = v265;
              int v5 = v266 + 1;
            }
            ++v261;
            v260 = *(_DWORD **)a1;
          }
          while (v261 < **(_DWORD **)a1);
        }
        return v5;
      case 15:
        v273 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v274 = 0;
          unsigned int v275 = (8 * a2) | 5;
          unsigned int v276 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v277 = (8 * a2) >> 7;
          char v278 = (8 * a2) | 0x85;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v273 = *(_DWORD **)a1;
            }
            int v279 = *(_DWORD *)sub_24C726D84(v273, v274);
            if (v275 > 0x7F)
            {
              *int v5 = v278;
              if (v275 >= 0x4000)
              {
                v280 = v5 + 2;
                unsigned int v281 = v276;
                do
                {
                  *((unsigned char *)v280 - 1) = v281 | 0x80;
                  unsigned int v282 = v281 >> 7;
                  v280 = (_DWORD *)((char *)v280 + 1);
                  unsigned int v283 = v281 >> 14;
                  v281 >>= 7;
                }
                while (v283);
                *((unsigned char *)v280 - 1) = v282;
              }
              else
              {
                v5[1] = v277;
                v280 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v275;
              v280 = v5 + 1;
            }
            _DWORD *v280 = v279;
            int v5 = (char *)(v280 + 1);
            ++v274;
            v273 = *(_DWORD **)a1;
          }
          while (v274 < **(_DWORD **)a1);
        }
        return v5;
      case 16:
        v284 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v285 = 0;
          unsigned int v286 = 8 * a2;
          unsigned int v287 = (8 * a2) | 1;
          char v288 = (8 * a2) | 0x81;
          unsigned int v289 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v290 = v286 >> 7;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v284 = *(_DWORD **)a1;
            }
            uint64_t v291 = *(void *)sub_24C727A3C(v284, v285);
            if (v287 > 0x7F)
            {
              *int v5 = v288;
              if (v287 >= 0x4000)
              {
                v292 = v5 + 2;
                unsigned int v293 = v289;
                do
                {
                  *((unsigned char *)v292 - 1) = v293 | 0x80;
                  unsigned int v294 = v293 >> 7;
                  v292 = (void *)((char *)v292 + 1);
                  unsigned int v295 = v293 >> 14;
                  v293 >>= 7;
                }
                while (v295);
                *((unsigned char *)v292 - 1) = v294;
              }
              else
              {
                v5[1] = v290;
                v292 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v287;
              v292 = v5 + 1;
            }
            void *v292 = v291;
            int v5 = (char *)(v292 + 1);
            ++v285;
            v284 = *(_DWORD **)a1;
          }
          while (v285 < **(_DWORD **)a1);
        }
        return v5;
      case 17:
        v296 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v297 = 0;
          unsigned int v298 = 8 * a2;
          char v299 = (8 * a2) | 0x80;
          unsigned int v300 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v296 = *(_DWORD **)a1;
            }
            int v301 = *(_DWORD *)sub_24C726D84(v296, v297);
            if (v298 > 0x7F)
            {
              *int v5 = v299;
              if (v298 >= 0x4000)
              {
                v302 = v5 + 2;
                unsigned int v303 = v300;
                do
                {
                  *(v302 - 1) = v303 | 0x80;
                  unsigned int v304 = v303 >> 7;
                  ++v302;
                  unsigned int v305 = v303 >> 14;
                  v303 >>= 7;
                }
                while (v305);
                *(v302 - 1) = v304;
              }
              else
              {
                v5[1] = v298 >> 7;
                v302 = v5 + 2;
              }
            }
            else
            {
              v302 = v5 + 1;
              *int v5 = v298;
            }
            unsigned int v306 = (2 * v301) ^ (v301 >> 31);
            if (v306 > 0x7F)
            {
              unsigned char *v302 = v306 | 0x80;
              unsigned int v307 = v306 >> 7;
              if (v306 >> 14)
              {
                int v5 = v302 + 2;
                do
                {
                  *(v5 - 1) = v307 | 0x80;
                  unsigned int v308 = v307 >> 7;
                  ++v5;
                  unsigned int v309 = v307 >> 14;
                  v307 >>= 7;
                }
                while (v309);
                *(v5 - 1) = v308;
              }
              else
              {
                v302[1] = v307;
                int v5 = v302 + 2;
              }
            }
            else
            {
              unsigned char *v302 = v306;
              int v5 = v302 + 1;
            }
            ++v297;
            v296 = *(_DWORD **)a1;
          }
          while (v297 < **(_DWORD **)a1);
        }
        return v5;
      case 18:
        v310 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v311 = 0;
          unsigned int v312 = 8 * a2;
          char v313 = (8 * a2) | 0x80;
          unsigned int v314 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_24C715FA8((uint64_t)a4, v5);
              v310 = *(_DWORD **)a1;
            }
            uint64_t v315 = *(void *)sub_24C727A3C(v310, v311);
            if (v312 > 0x7F)
            {
              *int v5 = v313;
              if (v312 >= 0x4000)
              {
                v316 = v5 + 2;
                unsigned int v317 = v314;
                do
                {
                  *(v316 - 1) = v317 | 0x80;
                  unsigned int v318 = v317 >> 7;
                  ++v316;
                  unsigned int v319 = v317 >> 14;
                  v317 >>= 7;
                }
                while (v319);
                *(v316 - 1) = v318;
              }
              else
              {
                v5[1] = v312 >> 7;
                v316 = v5 + 2;
              }
            }
            else
            {
              v316 = v5 + 1;
              *int v5 = v312;
            }
            unint64_t v320 = (2 * v315) ^ (v315 >> 63);
            if (v320 > 0x7F)
            {
              unsigned char *v316 = v320 | 0x80;
              unint64_t v321 = v320 >> 7;
              if (v320 >> 14)
              {
                int v5 = v316 + 2;
                do
                {
                  *(v5 - 1) = v321 | 0x80;
                  unint64_t v322 = v321 >> 7;
                  ++v5;
                  unint64_t v323 = v321 >> 14;
                  v321 >>= 7;
                }
                while (v323);
                *(v5 - 1) = v322;
              }
              else
              {
                v316[1] = v321;
                int v5 = v316 + 2;
              }
            }
            else
            {
              unsigned char *v316 = v320;
              int v5 = v316 + 1;
            }
            ++v311;
            v310 = *(_DWORD **)a1;
          }
          while (v311 < **(_DWORD **)a1);
        }
        return v5;
      default:
        return v5;
    }
    while (1)
    {
      if (*a4 <= (unint64_t)v5)
      {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
        uint64_t v232 = *(void *)a1;
      }
      uint64_t v239 = sub_24C71106C(v232, v233);
      if (*(char *)(v239 + 23) < 0)
      {
        int64_t v240 = *(void *)(v239 + 8);
        if (v240 > 127) {
          goto LABEL_399;
        }
      }
      else
      {
        int64_t v240 = *(unsigned __int8 *)(v239 + 23);
      }
      if ((uint64_t)(*a4 + ~(unint64_t)&v5[v238] + 16) >= v240)
      {
        if (v236 > 0x7F)
        {
          *int v5 = (8 * a2) | 0x82;
          if (v236 >= 0x4000)
          {
            v241 = v5 + 2;
            unsigned int v242 = (a2 >> 4) & 0x1FFFFFF;
            do
            {
              *(v241 - 1) = v242 | 0x80;
              unsigned int v243 = v242 >> 7;
              ++v241;
              unsigned int v244 = v242 >> 14;
              v242 >>= 7;
            }
            while (v244);
            *(v241 - 1) = v243;
          }
          else
          {
            v5[1] = v430;
            v241 = v5 + 2;
          }
        }
        else
        {
          v241 = v5 + 1;
          *int v5 = v236;
        }
        unsigned char *v241 = v240;
        v245 = v241 + 1;
        if (*(char *)(v239 + 23) >= 0) {
          v246 = (const void *)v239;
        }
        else {
          v246 = *(const void **)v239;
        }
        memcpy(v245, v246, v240);
        int v5 = &v245[v240];
        goto LABEL_397;
      }
LABEL_399:
      int v5 = sub_24C716518(a4, a2, v239, v5);
LABEL_397:
      ++v233;
      uint64_t v232 = *(void *)a1;
      if (v233 >= *(_DWORD *)(*(void *)a1 + 8)) {
        return v5;
      }
    }
  }
  if (a1[10]) {
    return v5;
  }
  int v10 = a1[8];
  if ((v10 - 19) <= 0xFFFFFFED)
  {
    sub_24C716A34((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    uint64_t v11 = sub_24C716A4C(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    sub_24C716B88((uint64_t)&v431, (const char **)&v11->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v432);
  }
  switch(v10)
  {
    case 1:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      uint64_t v12 = *(void *)a1;
      unsigned int v13 = (8 * a2) | 1;
      if (v13 <= 0x7F) {
        goto LABEL_575;
      }
      *int v5 = (8 * a2) | 0x81;
      unsigned int v14 = (8 * a2) >> 7;
      if (!(v13 >> 14)) {
        goto LABEL_602;
      }
      uint64_t v15 = v5 + 2;
      do
      {
        *((unsigned char *)v15 - 1) = v14 | 0x80;
        unsigned int v16 = v14 >> 7;
        uint64_t v15 = (void *)((char *)v15 + 1);
        unsigned int v17 = v14 >> 14;
        v14 >>= 7;
      }
      while (v17);
      goto LABEL_693;
    case 2:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      int v324 = *(_DWORD *)a1;
      unsigned int v325 = (8 * a2) | 5;
      if (v325 <= 0x7F) {
        goto LABEL_571;
      }
      *int v5 = (8 * a2) | 0x85;
      unsigned int v326 = (8 * a2) >> 7;
      if (!(v325 >> 14)) {
        goto LABEL_600;
      }
      v327 = v5 + 2;
      do
      {
        *((unsigned char *)v327 - 1) = v326 | 0x80;
        unsigned int v328 = v326 >> 7;
        v327 = (_DWORD *)((char *)v327 + 1);
        unsigned int v329 = v326 >> 14;
        v326 >>= 7;
      }
      while (v329);
      goto LABEL_689;
    case 3:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      unint64_t v330 = *(void *)a1;
      unsigned int v331 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v331 | 0x80;
        unsigned int v355 = v331 >> 7;
        if (v331 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v355 | 0x80;
            unsigned int v380 = v355 >> 7;
            ++v332;
            unsigned int v381 = v355 >> 14;
            v355 >>= 7;
          }
          while (v381);
          *(v332 - 1) = v380;
        }
        else
        {
          v5[1] = v355;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v331;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F) {
        goto LABEL_684;
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14)) {
        goto LABEL_686;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v384 = v382 >> 14;
        v382 >>= 7;
      }
      while (v384);
      goto LABEL_718;
    case 4:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      unint64_t v330 = *(void *)a1;
      unsigned int v333 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v333 | 0x80;
        unsigned int v356 = v333 >> 7;
        if (v333 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v356 | 0x80;
            unsigned int v385 = v356 >> 7;
            ++v332;
            unsigned int v386 = v356 >> 14;
            v356 >>= 7;
          }
          while (v386);
          *(v332 - 1) = v385;
        }
        else
        {
          v5[1] = v356;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v333;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F) {
        goto LABEL_684;
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14)) {
        goto LABEL_686;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v387 = v382 >> 14;
        v382 >>= 7;
      }
      while (v387);
      goto LABEL_718;
    case 5:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      unint64_t v330 = *(int *)a1;
      unsigned int v334 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v334 | 0x80;
        unsigned int v357 = v334 >> 7;
        if (v334 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v357 | 0x80;
            unsigned int v388 = v357 >> 7;
            ++v332;
            unsigned int v389 = v357 >> 14;
            v357 >>= 7;
          }
          while (v389);
          *(v332 - 1) = v388;
        }
        else
        {
          v5[1] = v357;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v334;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F) {
        goto LABEL_684;
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14)) {
        goto LABEL_686;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v390 = v382 >> 14;
        v382 >>= 7;
      }
      while (v390);
      goto LABEL_718;
    case 6:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      uint64_t v12 = *(void *)a1;
      unsigned int v13 = (8 * a2) | 1;
      if (v13 <= 0x7F) {
        goto LABEL_575;
      }
      *int v5 = (8 * a2) | 0x81;
      unsigned int v14 = (8 * a2) >> 7;
      if (!(v13 >> 14)) {
        goto LABEL_602;
      }
      uint64_t v15 = v5 + 2;
      do
      {
        *((unsigned char *)v15 - 1) = v14 | 0x80;
        unsigned int v16 = v14 >> 7;
        uint64_t v15 = (void *)((char *)v15 + 1);
        unsigned int v335 = v14 >> 14;
        v14 >>= 7;
      }
      while (v335);
      goto LABEL_693;
    case 7:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      int v324 = *(_DWORD *)a1;
      unsigned int v325 = (8 * a2) | 5;
      if (v325 <= 0x7F) {
        goto LABEL_571;
      }
      *int v5 = (8 * a2) | 0x85;
      unsigned int v326 = (8 * a2) >> 7;
      if (!(v325 >> 14)) {
        goto LABEL_600;
      }
      v327 = v5 + 2;
      do
      {
        *((unsigned char *)v327 - 1) = v326 | 0x80;
        unsigned int v328 = v326 >> 7;
        v327 = (_DWORD *)((char *)v327 + 1);
        unsigned int v336 = v326 >> 14;
        v326 >>= 7;
      }
      while (v336);
      goto LABEL_689;
    case 8:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      LOBYTE(v337) = *a1;
      unsigned int v338 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v338 | 0x80;
        unsigned int v358 = v338 >> 7;
        if (v338 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v358 | 0x80;
            unsigned int v391 = v358 >> 7;
            ++v332;
            unsigned int v392 = v358 >> 14;
            v358 >>= 7;
          }
          while (v392);
          *(v332 - 1) = v391;
        }
        else
        {
          v5[1] = v358;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v338;
        v332 = v5 + 1;
      }
      goto LABEL_677;
    case 9:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      v339 = *(void **)a1;
      if (*(char *)(*(void *)a1 + 23) < 0)
      {
        int64_t v340 = v339[1];
        if (v340 > 127) {
          return sub_24C716518(a4, a2, (uint64_t)v339, v5);
        }
      }
      else
      {
        int64_t v340 = *(unsigned __int8 *)(*(void *)a1 + 23);
      }
      unsigned int v364 = 8 * a2;
      uint64_t v365 = 1;
      uint64_t v366 = 2;
      uint64_t v367 = 3;
      uint64_t v368 = 4;
      if ((8 * a2) >> 28) {
        uint64_t v368 = 5;
      }
      if (v364 >= 0x200000) {
        uint64_t v367 = v368;
      }
      if (v364 >= 0x4000) {
        uint64_t v366 = v367;
      }
      if (v364 >= 0x80) {
        uint64_t v365 = v366;
      }
      if ((uint64_t)(*a4 + ~(unint64_t)&v5[v365] + 16) < v340) {
        return sub_24C716518(a4, a2, (uint64_t)v339, v5);
      }
      unsigned int v369 = v364 | 2;
      if ((v364 | 2) <= 0x7F) {
        goto LABEL_633;
      }
      *int v5 = v364 | 0x82;
      unsigned int v370 = v364 >> 7;
      if (!(v369 >> 14)) {
        goto LABEL_635;
      }
      v371 = v5 + 2;
      do
      {
        *(v371 - 1) = v370 | 0x80;
        unsigned int v372 = v370 >> 7;
        ++v371;
        unsigned int v373 = v370 >> 14;
        v370 >>= 7;
      }
      while (v373);
      goto LABEL_727;
    case 10:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      uint64_t v341 = *(void *)a1;
      unsigned int v342 = 8 * a2;
      unsigned int v343 = (8 * a2) | 3;
      unsigned int v344 = (8 * a2) >> 7;
      if (v343 > 0x7F)
      {
        *int v5 = (8 * a2) | 0x83;
        if (v343 >> 14)
        {
          v345 = v5 + 2;
          unsigned int v393 = v342 >> 7;
          do
          {
            *(v345 - 1) = v393 | 0x80;
            unsigned int v394 = v393 >> 7;
            ++v345;
            unsigned int v395 = v393 >> 14;
            v393 >>= 7;
          }
          while (v395);
          *(v345 - 1) = v394;
        }
        else
        {
          v5[1] = v344;
          v345 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v343;
        v345 = v5 + 1;
      }
      v332 = (char *)(*(uint64_t (**)(uint64_t, char *, uint64_t *))(*(void *)v341 + 96))(v341, v345, a4);
      if (*a4 <= (unint64_t)v332) {
        v332 = sub_24C715FA8((uint64_t)a4, v332);
      }
      unsigned int v337 = v342 | 4;
      if ((v342 | 4) <= 0x7F) {
        goto LABEL_677;
      }
      char *v332 = v342 | 0x84;
      if (!(v337 >> 14))
      {
        v332[1] = v344;
        return v332 + 2;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v344 | 0x80;
        unsigned int v411 = v344 >> 7;
        ++v5;
        unsigned int v412 = v344 >> 14;
        v344 >>= 7;
      }
      while (v412);
      goto LABEL_715;
    case 11:
      if ((a1[10] & 0x10) != 0) {
        return (char *)(*(uint64_t (**)(void, uint64_t, char *, uint64_t *))(**(void **)a1 + 136))(*(void *)a1, a2, v5, a4);
      }
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      uint64_t v346 = *(void *)a1;
      unsigned int v347 = (8 * a2) | 2;
      if (v347 > 0x7F)
      {
        *int v5 = (8 * a2) | 0x82;
        unsigned int v379 = (8 * a2) >> 7;
        if (v347 >> 14)
        {
          v348 = v5 + 2;
          do
          {
            *(v348 - 1) = v379 | 0x80;
            unsigned int v421 = v379 >> 7;
            ++v348;
            unsigned int v422 = v379 >> 14;
            v379 >>= 7;
          }
          while (v422);
          *(v348 - 1) = v421;
        }
        else
        {
          v5[1] = v379;
          v348 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v347;
        v348 = v5 + 1;
      }
      unsigned int v423 = (*(uint64_t (**)(uint64_t))(*(void *)v346 + 80))(v346);
      if (v423 > 0x7F)
      {
        unsigned char *v348 = v423 | 0x80;
        unsigned int v425 = v423 >> 7;
        if (v423 >> 14)
        {
          v424 = v348 + 2;
          do
          {
            *(v424 - 1) = v425 | 0x80;
            unsigned int v426 = v425 >> 7;
            ++v424;
            unsigned int v427 = v425 >> 14;
            v425 >>= 7;
          }
          while (v427);
          *(v424 - 1) = v426;
        }
        else
        {
          v348[1] = v425;
          v424 = v348 + 2;
        }
      }
      else
      {
        unsigned char *v348 = v423;
        v424 = v348 + 1;
      }
      return (char *)(*(uint64_t (**)(uint64_t, unsigned char *, uint64_t *))(*(void *)v346 + 96))(v346, v424, a4);
    case 12:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      v339 = *(void **)a1;
      if (*(char *)(*(void *)a1 + 23) < 0)
      {
        int64_t v340 = v339[1];
        if (v340 > 127) {
          return sub_24C716518(a4, a2, (uint64_t)v339, v5);
        }
      }
      else
      {
        int64_t v340 = *(unsigned __int8 *)(*(void *)a1 + 23);
      }
      unsigned int v374 = 8 * a2;
      uint64_t v375 = 1;
      uint64_t v376 = 2;
      uint64_t v377 = 3;
      uint64_t v378 = 4;
      if ((8 * a2) >> 28) {
        uint64_t v378 = 5;
      }
      if (v374 >= 0x200000) {
        uint64_t v377 = v378;
      }
      if (v374 >= 0x4000) {
        uint64_t v376 = v377;
      }
      if (v374 >= 0x80) {
        uint64_t v375 = v376;
      }
      if ((uint64_t)(*a4 + ~(unint64_t)&v5[v375] + 16) < v340) {
        return sub_24C716518(a4, a2, (uint64_t)v339, v5);
      }
      unsigned int v369 = v374 | 2;
      if ((v374 | 2) > 0x7F)
      {
        *int v5 = v374 | 0x82;
        unsigned int v370 = v374 >> 7;
        if (v369 >> 14)
        {
          v371 = v5 + 2;
          do
          {
            *(v371 - 1) = v370 | 0x80;
            unsigned int v372 = v370 >> 7;
            ++v371;
            unsigned int v419 = v370 >> 14;
            v370 >>= 7;
          }
          while (v419);
LABEL_727:
          *(v371 - 1) = v372;
        }
        else
        {
LABEL_635:
          v5[1] = v370;
          v371 = v5 + 2;
        }
      }
      else
      {
LABEL_633:
        *int v5 = v369;
        v371 = v5 + 1;
      }
      unsigned char *v371 = v340;
      v420 = v371 + 1;
      if (*((char *)v339 + 23) < 0) {
        v339 = (void *)*v339;
      }
      memcpy(v420, v339, v340);
      return &v420[v340];
    case 13:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      unsigned int v337 = *(_DWORD *)a1;
      unsigned int v349 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v349 | 0x80;
        unsigned int v360 = v349 >> 7;
        if (v349 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v360 | 0x80;
            unsigned int v396 = v360 >> 7;
            ++v332;
            unsigned int v397 = v360 >> 14;
            v360 >>= 7;
          }
          while (v397);
          *(v332 - 1) = v396;
        }
        else
        {
          v5[1] = v360;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v349;
        v332 = v5 + 1;
      }
      if (v337 <= 0x7F)
      {
LABEL_677:
        char *v332 = v337;
        return v332 + 1;
      }
      char *v332 = v337 | 0x80;
      unsigned int v398 = v337 >> 7;
      if (!(v337 >> 14))
      {
        v332[1] = v398;
        return v332 + 2;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v398 | 0x80;
        unsigned int v411 = v398 >> 7;
        ++v5;
        unsigned int v413 = v398 >> 14;
        v398 >>= 7;
      }
      while (v413);
LABEL_715:
      *(v5 - 1) = v411;
      return v5;
    case 14:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      unint64_t v330 = *(int *)a1;
      unsigned int v350 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v350 | 0x80;
        unsigned int v361 = v350 >> 7;
        if (v350 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v361 | 0x80;
            unsigned int v399 = v361 >> 7;
            ++v332;
            unsigned int v400 = v361 >> 14;
            v361 >>= 7;
          }
          while (v400);
          *(v332 - 1) = v399;
        }
        else
        {
          v5[1] = v361;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v350;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F)
      {
LABEL_684:
        char *v332 = v330;
        return v332 + 1;
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14))
      {
LABEL_686:
        v332[1] = v382;
        return v332 + 2;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v414 = v382 >> 14;
        v382 >>= 7;
      }
      while (v414);
LABEL_718:
      *(v5 - 1) = v383;
      return v5;
    case 15:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      int v324 = *(_DWORD *)a1;
      unsigned int v325 = (8 * a2) | 5;
      if (v325 > 0x7F)
      {
        *int v5 = (8 * a2) | 0x85;
        unsigned int v326 = (8 * a2) >> 7;
        if (v325 >> 14)
        {
          v327 = v5 + 2;
          do
          {
            *((unsigned char *)v327 - 1) = v326 | 0x80;
            unsigned int v328 = v326 >> 7;
            v327 = (_DWORD *)((char *)v327 + 1);
            unsigned int v401 = v326 >> 14;
            v326 >>= 7;
          }
          while (v401);
LABEL_689:
          *((unsigned char *)v327 - 1) = v328;
        }
        else
        {
LABEL_600:
          v5[1] = v326;
          v327 = v5 + 2;
        }
      }
      else
      {
LABEL_571:
        *int v5 = v325;
        v327 = v5 + 1;
      }
      _DWORD *v327 = v324;
      return (char *)(v327 + 1);
    case 16:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      uint64_t v12 = *(void *)a1;
      unsigned int v13 = (8 * a2) | 1;
      if (v13 > 0x7F)
      {
        *int v5 = (8 * a2) | 0x81;
        unsigned int v14 = (8 * a2) >> 7;
        if (v13 >> 14)
        {
          uint64_t v15 = v5 + 2;
          do
          {
            *((unsigned char *)v15 - 1) = v14 | 0x80;
            unsigned int v16 = v14 >> 7;
            uint64_t v15 = (void *)((char *)v15 + 1);
            unsigned int v402 = v14 >> 14;
            v14 >>= 7;
          }
          while (v402);
LABEL_693:
          *((unsigned char *)v15 - 1) = v16;
        }
        else
        {
LABEL_602:
          v5[1] = v14;
          uint64_t v15 = v5 + 2;
        }
      }
      else
      {
LABEL_575:
        *int v5 = v13;
        uint64_t v15 = v5 + 1;
      }
      void *v15 = v12;
      return (char *)(v15 + 1);
    case 17:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      int v351 = *(_DWORD *)a1;
      unsigned int v352 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v352 | 0x80;
        unsigned int v362 = v352 >> 7;
        if (v352 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v362 | 0x80;
            unsigned int v403 = v362 >> 7;
            ++v332;
            unsigned int v404 = v362 >> 14;
            v362 >>= 7;
          }
          while (v404);
          *(v332 - 1) = v403;
        }
        else
        {
          v5[1] = v362;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v352;
        v332 = v5 + 1;
      }
      unsigned int v405 = (2 * v351) ^ (v351 >> 31);
      if (v405 <= 0x7F)
      {
        char *v332 = v405;
        return v332 + 1;
      }
      char *v332 = v405 | 0x80;
      unsigned int v406 = v405 >> 7;
      if (!(v405 >> 14))
      {
        v332[1] = v406;
        return v332 + 2;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v406 | 0x80;
        unsigned int v415 = v406 >> 7;
        ++v5;
        unsigned int v416 = v406 >> 14;
        v406 >>= 7;
      }
      while (v416);
      *(v5 - 1) = v415;
      return v5;
    case 18:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_24C715FA8((uint64_t)a4, v5);
      }
      uint64_t v353 = *(void *)a1;
      unsigned int v354 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v354 | 0x80;
        unsigned int v363 = v354 >> 7;
        if (v354 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v363 | 0x80;
            unsigned int v407 = v363 >> 7;
            ++v332;
            unsigned int v408 = v363 >> 14;
            v363 >>= 7;
          }
          while (v408);
          *(v332 - 1) = v407;
        }
        else
        {
          v5[1] = v363;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v354;
        v332 = v5 + 1;
      }
      unint64_t v409 = (2 * v353) ^ (v353 >> 63);
      if (v409 > 0x7F)
      {
        char *v332 = v409 | 0x80;
        unint64_t v410 = v409 >> 7;
        if (v409 >> 14)
        {
          int v5 = v332 + 2;
          do
          {
            *(v5 - 1) = v410 | 0x80;
            unint64_t v417 = v410 >> 7;
            ++v5;
            unint64_t v418 = v410 >> 14;
            v410 >>= 7;
          }
          while (v418);
          *(v5 - 1) = v417;
        }
        else
        {
          v332[1] = v410;
          return v332 + 2;
        }
      }
      else
      {
        char *v332 = v409;
        return v332 + 1;
      }
      return v5;
    default:
      return v5;
  }
}

void sub_24C7201D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7202D8(uint64_t a1)
{
  uint64_t v1 = *(int **)(a1 + 16);
  if (*(unsigned __int16 *)(a1 + 8) < 0x101u)
  {
    if (*(_WORD *)(a1 + 10))
    {
      uint64_t v2 = 0;
      uint64_t v3 = &v1[8 * *(unsigned __int16 *)(a1 + 10)];
      do
      {
        uint64_t v4 = (_DWORD **)(v1 + 2);
        int v5 = *v1;
        v1 += 8;
        v2 += sub_24C72039C(v4, v5);
      }
      while (v1 != v3);
      return v2;
    }
    return 0;
  }
  unsigned int v8 = *(int **)v1;
  uint64_t v6 = v1 + 2;
  uint64_t v7 = v8;
  if (v8 == v6) {
    return 0;
  }
  uint64_t v2 = 0;
  do
  {
    unint64_t v9 = sub_24C72039C((_DWORD **)v7 + 5, v7[8]);
    int v10 = (int *)*((void *)v7 + 1);
    if (v10)
    {
      do
      {
        uint64_t v11 = v10;
        int v10 = *(int **)v10;
      }
      while (v10);
    }
    else
    {
      do
      {
        uint64_t v11 = (int *)*((void *)v7 + 2);
        BOOL v12 = *(void *)v11 == (void)v7;
        uint64_t v7 = v11;
      }
      while (!v12);
    }
    v2 += v9;
    uint64_t v7 = v11;
  }
  while (v11 != v6);
  return v2;
}

unint64_t sub_24C72039C(_DWORD **a1, int a2)
{
  if (*((unsigned char *)a1 + 9))
  {
    int v4 = *((unsigned __int8 *)a1 + 8);
    unsigned __int8 v5 = v4 - 19;
    if (*((unsigned char *)a1 + 11))
    {
      if ((v4 - 19) <= 0xEDu)
      {
        sub_24C716A34((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        uint64_t v6 = sub_24C716A4C(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        sub_24C716B88((uint64_t)&v101, (const char **)&v6->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)v102);
      }
      switch(v4)
      {
        case 1:
        case 6:
        case 16:
          uint64_t v21 = 8 * **a1;
          goto LABEL_63;
        case 2:
        case 7:
        case 15:
          uint64_t v21 = 4 * **a1;
          goto LABEL_63;
        case 3:
          uint64_t v27 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v28 = 0;
          do
          {
            v21 += (9 * (__clz(*(void *)sub_24C727A3C(v27, v28++) | 1) ^ 0x3F) + 73) >> 6;
            uint64_t v27 = *a1;
          }
          while (v28 < **a1);
          goto LABEL_63;
        case 4:
          unsigned int v29 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v30 = 0;
          do
          {
            v21 += (9 * (__clz(*(void *)sub_24C728098(v29, v30++) | 1) ^ 0x3F) + 73) >> 6;
            unsigned int v29 = *a1;
          }
          while (v30 < **a1);
          goto LABEL_63;
        case 5:
          unsigned int v31 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v32 = 0;
          do
          {
            unsigned int v33 = (int *)sub_24C726D84(v31, v32);
            uint64_t v34 = (9 * (__clz(*v33 | 1) ^ 0x1F) + 73) >> 6;
            if (*v33 >= 0) {
              uint64_t v35 = v34;
            }
            else {
              uint64_t v35 = 10;
            }
            v21 += v35;
            ++v32;
            unsigned int v31 = *a1;
          }
          while (v32 < **a1);
          goto LABEL_63;
        case 8:
          uint64_t v21 = **a1;
          goto LABEL_63;
        case 9:
        case 10:
        case 11:
        case 12:
          sub_24C716A34((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1599);
          uint64_t v7 = sub_24C716A4C(v102, "Non-primitive types can't be packed.");
          sub_24C716B88((uint64_t)&v101, (const char **)&v7->__r_.__value_.__l.__data_);
          sub_24C716B90((uint64_t)v102);
          goto LABEL_7;
        case 13:
          unsigned int v22 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v23 = 0;
          do
          {
            v21 += (9 * (__clz(*(_DWORD *)sub_24C7273E0(v22, v23++) | 1) ^ 0x1F) + 73) >> 6;
            unsigned int v22 = *a1;
          }
          while (v23 < **a1);
          goto LABEL_63;
        case 14:
          unint64_t v36 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v37 = 0;
          do
          {
            unint64_t v38 = (int *)sub_24C726D84(v36, v37);
            uint64_t v39 = (9 * (__clz(*v38 | 1) ^ 0x1F) + 73) >> 6;
            if (*v38 >= 0) {
              uint64_t v40 = v39;
            }
            else {
              uint64_t v40 = 10;
            }
            v21 += v40;
            ++v37;
            unint64_t v36 = *a1;
          }
          while (v37 < **a1);
          goto LABEL_63;
        case 17:
          char v24 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v25 = 0;
          do
          {
            unsigned int v26 = (int *)sub_24C726D84(v24, v25);
            v21 += (9 * (__clz((2 * *v26) ^ (*v26 >> 31) | 1) ^ 0x1F) + 73) >> 6;
            ++v25;
            char v24 = *a1;
          }
          while (v25 < **a1);
          goto LABEL_63;
        case 18:
          uint64_t v41 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v42 = 0;
          do
          {
            int v43 = (uint64_t *)sub_24C727A3C(v41, v42);
            v21 += (9 * (__clz((2 * *v43) ^ (*v43 >> 63) | 1) ^ 0x3F) + 73) >> 6;
            ++v42;
            uint64_t v41 = *a1;
          }
          while (v42 < **a1);
LABEL_63:
          *((_DWORD *)a1 + 3) = v21;
          unint64_t v44 = v21 + ((9 * (__clz((8 * a2) | 3) ^ 0x1F) + 73) >> 6) + ((9 * (__clz(v21 | 1) ^ 0x1F) + 73) >> 6);
          if (v21) {
            unint64_t v8 = v44;
          }
          else {
            unint64_t v8 = 0;
          }
          break;
        default:
LABEL_7:
          unint64_t v8 = 0;
          *((_DWORD *)a1 + 3) = 0;
          break;
      }
    }
    else
    {
      if ((v4 - 19) > 0xEDu)
      {
        int v14 = *((unsigned __int8 *)a1 + 8);
      }
      else
      {
        sub_24C716A34((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        unsigned int v13 = sub_24C716A4C(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        sub_24C716B88((uint64_t)&v101, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)v102);
        int v14 = *((unsigned __int8 *)a1 + 8);
        unsigned __int8 v5 = v14 - 19;
      }
      char v15 = v4 == 10;
      if (v5 <= 0xEDu)
      {
        sub_24C716A34((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        unsigned int v16 = sub_24C716A4C(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        sub_24C716B88((uint64_t)&v101, (const char **)&v16->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)v102);
      }
      unint64_t v17 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << v15;
      switch(v14)
      {
        case 1:
        case 6:
        case 16:
          unsigned int v18 = v17 + 8;
          goto LABEL_27;
        case 2:
        case 7:
        case 15:
          unsigned int v18 = v17 + 4;
LABEL_27:
          unint64_t v8 = v18 * (unint64_t)**a1;
          break;
        case 3:
          unsigned int v50 = *a1;
          int v51 = **a1;
          unint64_t v8 = v17 * (unint64_t)v51;
          if (v51 >= 1)
          {
            int v52 = 0;
            do
            {
              v8 += (9 * (__clz(*(void *)sub_24C727A3C(v50, v52++) | 1) ^ 0x3F) + 73) >> 6;
              unsigned int v50 = *a1;
            }
            while (v52 < **a1);
          }
          break;
        case 4:
          unsigned int v53 = *a1;
          int v54 = **a1;
          unint64_t v8 = v17 * (unint64_t)v54;
          if (v54 >= 1)
          {
            int v55 = 0;
            do
            {
              v8 += (9 * (__clz(*(void *)sub_24C728098(v53, v55++) | 1) ^ 0x3F) + 73) >> 6;
              unsigned int v53 = *a1;
            }
            while (v55 < **a1);
          }
          break;
        case 5:
          int v56 = *a1;
          int v57 = **a1;
          unint64_t v8 = v17 * (unint64_t)v57;
          if (v57 >= 1)
          {
            int v58 = 0;
            do
            {
              unsigned int v59 = (int *)sub_24C726D84(v56, v58);
              uint64_t v60 = (9 * (__clz(*v59 | 1) ^ 0x1F) + 73) >> 6;
              if (*v59 >= 0) {
                uint64_t v61 = v60;
              }
              else {
                uint64_t v61 = 10;
              }
              v8 += v61;
              ++v58;
              int v56 = *a1;
            }
            while (v58 < **a1);
          }
          break;
        case 8:
          unint64_t v8 = **a1 + **a1 * (unint64_t)v17;
          break;
        case 9:
          unsigned int v62 = *a1;
          int v63 = (*a1)[2];
          unint64_t v8 = v17 * (unint64_t)v63;
          if (v63 >= 1)
          {
            int v64 = 0;
            do
            {
              uint64_t v65 = sub_24C71106C((uint64_t)v62, v64);
              uint64_t v66 = *(unsigned __int8 *)(v65 + 23);
              if ((v66 & 0x80u) != 0) {
                uint64_t v66 = *(void *)(v65 + 8);
              }
              v8 += v66 + ((9 * (__clz(v66 | 1) ^ 0x1F) + 73) >> 6);
              ++v64;
              unsigned int v62 = *a1;
            }
            while (v64 < (*a1)[2]);
          }
          break;
        case 10:
          int v67 = *a1;
          int v68 = (*a1)[2];
          unint64_t v8 = v17 * (unint64_t)v68;
          if (v68 >= 1)
          {
            int v69 = 0;
            do
            {
              uint64_t v70 = sub_24C721434((uint64_t)v67, v69);
              v8 += (*(uint64_t (**)(uint64_t))(*(void *)v70 + 72))(v70);
              ++v69;
              int v67 = *a1;
            }
            while (v69 < (*a1)[2]);
          }
          break;
        case 11:
          unint64_t v71 = *a1;
          int v72 = (*a1)[2];
          unint64_t v8 = v17 * (unint64_t)v72;
          if (v72 >= 1)
          {
            int v73 = 0;
            do
            {
              uint64_t v74 = sub_24C721434((uint64_t)v71, v73);
              uint64_t v75 = (*(uint64_t (**)(uint64_t))(*(void *)v74 + 72))(v74);
              v8 += v75 + ((9 * (__clz(v75 | 1) ^ 0x1F) + 73) >> 6);
              ++v73;
              unint64_t v71 = *a1;
            }
            while (v73 < (*a1)[2]);
          }
          break;
        case 12:
          unint64_t v76 = *a1;
          int v77 = (*a1)[2];
          unint64_t v8 = v17 * (unint64_t)v77;
          if (v77 >= 1)
          {
            int v78 = 0;
            do
            {
              uint64_t v79 = sub_24C71106C((uint64_t)v76, v78);
              uint64_t v80 = *(unsigned __int8 *)(v79 + 23);
              if ((v80 & 0x80u) != 0) {
                uint64_t v80 = *(void *)(v79 + 8);
              }
              v8 += v80 + ((9 * (__clz(v80 | 1) ^ 0x1F) + 73) >> 6);
              ++v78;
              unint64_t v76 = *a1;
            }
            while (v78 < (*a1)[2]);
          }
          break;
        case 13:
          int v81 = *a1;
          int v82 = **a1;
          unint64_t v8 = v17 * (unint64_t)v82;
          if (v82 >= 1)
          {
            int v83 = 0;
            do
            {
              v8 += (9 * (__clz(*(_DWORD *)sub_24C7273E0(v81, v83++) | 1) ^ 0x1F) + 73) >> 6;
              int v81 = *a1;
            }
            while (v83 < **a1);
          }
          break;
        case 14:
          int v84 = *a1;
          int v85 = **a1;
          unint64_t v8 = v17 * (unint64_t)v85;
          if (v85 >= 1)
          {
            int v86 = 0;
            do
            {
              unint64_t v87 = (int *)sub_24C726D84(v84, v86);
              uint64_t v88 = (9 * (__clz(*v87 | 1) ^ 0x1F) + 73) >> 6;
              if (*v87 >= 0) {
                uint64_t v89 = v88;
              }
              else {
                uint64_t v89 = 10;
              }
              v8 += v89;
              ++v86;
              int v84 = *a1;
            }
            while (v86 < **a1);
          }
          break;
        case 17:
          unint64_t v90 = *a1;
          int v91 = **a1;
          unint64_t v8 = v17 * (unint64_t)v91;
          if (v91 >= 1)
          {
            int v92 = 0;
            do
            {
              v93 = (int *)sub_24C726D84(v90, v92);
              v8 += (9 * (__clz((2 * *v93) ^ (*v93 >> 31) | 1) ^ 0x1F) + 73) >> 6;
              ++v92;
              unint64_t v90 = *a1;
            }
            while (v92 < **a1);
          }
          break;
        case 18:
          int v94 = *a1;
          int v95 = **a1;
          unint64_t v8 = v17 * (unint64_t)v95;
          if (v95 >= 1)
          {
            int v96 = 0;
            do
            {
              unint64_t v97 = (uint64_t *)sub_24C727A3C(v94, v96);
              v8 += (9 * (__clz((2 * *v97) ^ (*v97 >> 63) | 1) ^ 0x3F) + 73) >> 6;
              ++v96;
              int v94 = *a1;
            }
            while (v96 < **a1);
          }
          break;
        default:
          return 0;
      }
    }
  }
  else if (*((unsigned char *)a1 + 10))
  {
    return 0;
  }
  else
  {
    int v9 = *((unsigned __int8 *)a1 + 8);
    unsigned __int8 v10 = v9 - 19;
    if ((v9 - 19) > 0xEDu)
    {
      int v12 = *((unsigned __int8 *)a1 + 8);
    }
    else
    {
      sub_24C716A34((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v11 = sub_24C716A4C(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v101, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v102);
      int v12 = *((unsigned __int8 *)a1 + 8);
      unsigned __int8 v10 = v12 - 19;
    }
    char v19 = v9 == 10;
    if (v10 <= 0xEDu)
    {
      sub_24C716A34((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      int v20 = sub_24C716A4C(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v101, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v102);
    }
    unint64_t v8 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << v19;
    switch(v12)
    {
      case 1:
      case 6:
      case 16:
        v8 += 8;
        return v8;
      case 2:
      case 7:
      case 15:
        v8 += 4;
        return v8;
      case 3:
      case 4:
        unint64_t v46 = (unint64_t)*a1;
        goto LABEL_138;
      case 5:
      case 14:
        uint64_t v47 = (9 * (__clz(*(_DWORD *)a1 | 1) ^ 0x1F) + 73) >> 6;
        if (*(int *)a1 >= 0) {
          uint64_t v48 = v47;
        }
        else {
          uint64_t v48 = 10;
        }
        v8 += v48;
        return v8;
      case 8:
        return ++v8;
      case 9:
      case 12:
        uint64_t v49 = *((void *)*a1 + 1);
        if (*((char *)*a1 + 23) >= 0) {
          uint64_t v49 = *((unsigned __int8 *)*a1 + 23);
        }
        v8 += v49 + ((9 * (__clz(v49 | 1) ^ 0x1F) + 73) >> 6);
        return v8;
      case 10:
        v8 += (*(uint64_t (**)(void))(*(void *)*a1 + 72))();
        return v8;
      case 11:
        uint64_t v98 = *(void *)*a1;
        if ((*((unsigned char *)a1 + 10) & 0x10) != 0) {
          uint64_t v99 = (*(uint64_t (**)(void))(v98 + 88))();
        }
        else {
          uint64_t v99 = (*(uint64_t (**)(void))(v98 + 72))();
        }
        v8 += v99 + ((9 * (__clz(v99 | 1) ^ 0x1F) + 73) >> 6);
        return v8;
      case 13:
        int v100 = *(_DWORD *)a1;
        goto LABEL_136;
      case 17:
        int v100 = (2 * *(_DWORD *)a1) ^ (*(int *)a1 >> 31);
LABEL_136:
        v8 += (9 * (__clz(v100 | 1) ^ 0x1F) + 73) >> 6;
        break;
      case 18:
        unint64_t v46 = (2 * (void)*a1) ^ ((uint64_t)*a1 >> 63);
LABEL_138:
        v8 += (9 * (__clz(v46 | 1) ^ 0x3F) + 73) >> 6;
        break;
      default:
        return v8;
    }
  }
  return v8;
}

void sub_24C720F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C7210B0(unsigned __int8 *result)
{
  uint64_t v1 = result;
  uint64_t v2 = result[8];
  if (result[9])
  {
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v3 = sub_24C716A4C(v11, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v10, (const char **)&v3->__r_.__value_.__l.__data_);
      uint64_t result = (unsigned __int8 *)sub_24C716B90((uint64_t)v11);
    }
    switch(v2)
    {
      case 1:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_24C728E78();
          goto LABEL_32;
        }
        break;
      case 2:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_24C72881C();
          goto LABEL_32;
        }
        break;
      case 3:
      case 16:
      case 18:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_24C727B64();
          goto LABEL_32;
        }
        break;
      case 4:
      case 6:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_24C7281C0();
          goto LABEL_32;
        }
        break;
      case 5:
      case 14:
      case 15:
      case 17:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_24C726EAC();
          goto LABEL_32;
        }
        break;
      case 7:
      case 13:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_24C727508();
          goto LABEL_32;
        }
        break;
      case 8:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_24C726854();
LABEL_32:
          uint64_t v8 = 0x1080C4057E67DB5;
          return (unsigned __int8 *)MEMORY[0x2532F8960](v4, v8);
        }
        break;
      case 9:
      case 12:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_24C729104();
          goto LABEL_37;
        }
        break;
      case 10:
      case 11:
        int v9 = *(unsigned __int8 **)v1;
        if (v9)
        {
          sub_24C721C44(v9);
          int v4 = sub_24C707BB4((uint64_t *)v9);
LABEL_37:
          uint64_t v8 = 0x1020C4014030ADELL;
          return (unsigned __int8 *)MEMORY[0x2532F8960](v4, v8);
        }
        break;
      default:
        return result;
    }
  }
  else
  {
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unsigned __int8 v5 = sub_24C716A4C(v11, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_24C716B88((uint64_t)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
      uint64_t result = (unsigned __int8 *)sub_24C716B90((uint64_t)v11);
    }
    int v6 = dword_24C731340[v2];
    if (v6 == 10)
    {
      uint64_t result = *(unsigned __int8 **)v1;
      if ((v1[10] & 0x10) != 0)
      {
        if (!result) {
          return result;
        }
      }
      else if (!result)
      {
        return result;
      }
      return (unsigned __int8 *)(*(uint64_t (**)(unsigned __int8 *))(*(void *)result + 8))(result);
    }
    if (v6 == 9)
    {
      uint64_t v7 = *(unsigned __int8 **)v1;
      if (v7)
      {
        if ((char)v7[23] < 0) {
          operator delete(*(void **)v7);
        }
        int v4 = (uint64_t *)v7;
        uint64_t v8 = 0x1012C40EC159624;
        return (unsigned __int8 *)MEMORY[0x2532F8960](v4, v8);
      }
    }
  }
  return result;
}

void sub_24C721310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C721358()
{
}

unsigned __int8 *sub_24C72136C(unsigned __int8 *result, unsigned __int8 *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    do
    {
      uint64_t result = sub_24C7210B0(v3 + 40);
      int v4 = (unsigned __int8 *)*((void *)v3 + 1);
      if (v4)
      {
        do
        {
          unsigned __int8 v5 = v4;
          int v4 = *(unsigned __int8 **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          unsigned __int8 v5 = (unsigned __int8 *)*((void *)v3 + 2);
          BOOL v6 = *(void *)v5 == (void)v3;
          uint64_t v3 = v5;
        }
        while (!v6);
      }
      uint64_t v3 = v5;
    }
    while (v5 != a2);
  }
  return result;
}

uint64_t *sub_24C7213FC(uint64_t *a1)
{
  sub_24C721C44(a1);
  return sub_24C707BB4(a1);
}

uint64_t sub_24C721434(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1705);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1706);
    unsigned __int8 v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return *(void *)(*(void *)(a1 + 16) + 8 * a2 + 8);
}

void sub_24C7214F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C721514(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(int **)(result + 16);
  if (!v2) {
    return sub_24C721568(result, a2);
  }
  uint64_t v3 = *v2;
  if ((int)v3 >= *(_DWORD *)(result + 12)) {
    return sub_24C721568(result, a2);
  }
  int v4 = v2 + 2;
  uint64_t v5 = *(int *)(result + 8);
  if ((int)v5 < (int)v3) {
    *(void *)&v4[2 * v3] = *(void *)&v4[2 * v5];
  }
  *(void *)&v4[2 * v5] = a2;
  *(_DWORD *)(result + 8) = v5 + 1;
  ++**(_DWORD **)(result + 16);
  return result;
}

uint64_t sub_24C721568(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  int v4 = *(int **)(result + 16);
  if (!v4)
  {
    int v5 = *(_DWORD *)(result + 12);
    goto LABEL_11;
  }
  int v5 = *(_DWORD *)(result + 8);
  int v6 = *(_DWORD *)(result + 12);
  if (v5 == v6)
  {
LABEL_11:
    uint64_t result = sub_24C729108(result, v5 + 1);
    goto LABEL_12;
  }
  uint64_t v7 = *v4;
  if (v7 != v6)
  {
    if (v5 >= (int)v7)
    {
      int v9 = v7 + 1;
      goto LABEL_13;
    }
    *(void *)&v4[2 * v7 + 2] = *(void *)&v4[2 * v5 + 2];
LABEL_12:
    int v4 = *(int **)(v3 + 16);
    int v9 = *v4 + 1;
LABEL_13:
    int *v4 = v9;
    goto LABEL_14;
  }
  uint64_t result = *(void *)&v4[2 * v5 + 2];
  if (result) {
    BOOL v8 = *(void *)v3 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
    int v4 = *(int **)(v3 + 16);
  }
LABEL_14:
  uint64_t v10 = *(int *)(v3 + 8);
  *(_DWORD *)(v3 + 8) = v10 + 1;
  *(void *)&v4[2 * v10 + 2] = a2;
  return result;
}

uint64_t *sub_24C721648(void *a1, void *a2, uint64_t *a3)
{
  if (a1 != a2)
  {
    int v5 = a1;
    do
    {
      sub_24C71B3DC(a3, *((unsigned int *)v5 + 8), v5 + 5);
      int v6 = (void *)v5[1];
      if (v6)
      {
        do
        {
          uint64_t v7 = v6;
          int v6 = (void *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          uint64_t v7 = (void *)v5[2];
          BOOL v8 = *v7 == (void)v5;
          int v5 = v7;
        }
        while (!v8);
      }
      int v5 = v7;
    }
    while (v7 != a2);
  }
  return a3;
}

const std::string::value_type *sub_24C7216CC(uint64_t a1, std::string::value_type *__s, int a3, std::string *a4)
{
  if (*(void *)(a1 + 8) - (void)__s + 16 >= a3)
  {
    uint64_t v6 = a3;
    MEMORY[0x2532F8570](a4, __s, a3);
    return &__s[v6];
  }
  else
  {
    return sub_24C7237E0(a1, __s, a3, a4);
  }
}

char *sub_24C721738(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v15 = (unint64_t)&result[v5];
    long long v16 = *(_OWORD *)(a3 + 16);
    v19[0] = *(_OWORD *)a3;
    v19[1] = v16;
    uint64_t v20 = *(void *)(a3 + 32);
    uint64_t result = sub_24C721994(result, v15, (unsigned int **)v19);
    if ((char *)v15 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      long long v10 = *(_OWORD *)(a3 + 16);
      v24[0] = *(_OWORD *)a3;
      v24[1] = v10;
      uint64_t v25 = *(void *)(a3 + 32);
      uint64_t result = sub_24C721994(result, v8, (unsigned int **)v24);
      if (!result) {
        break;
      }
      signed int v11 = result - *(void *)(a1 + 8);
      if (v11 >= 0x11)
      {
        sub_24C716A34((uint64_t)&v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v12 = sub_24C716A4C(&v26, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_24C716B88((uint64_t)&v23, (const char **)&v12->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v26);
      }
      int v13 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v27 = 0;
        v26.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v26.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        uint64_t v22 = *(void *)(a3 + 32);
        long long v17 = *(_OWORD *)(a3 + 16);
        v21[0] = *(_OWORD *)a3;
        v21[1] = v17;
        unsigned int v18 = (std::string *)sub_24C721994((char *)&v26 + v11, (unint64_t)&v26 + v13, (unsigned int **)v21);
        uint64_t result = 0;
        if (v18 && v18 == (std::string *)((char *)&v26 + v13)) {
          return (char *)(*(void *)(a1 + 8) + v13);
        }
        return result;
      }
      int v5 = v5 - v9 - v11;
      if (v5 <= 0)
      {
        sub_24C716A34((uint64_t)&v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        int v14 = sub_24C716A4C(&v26, "CHECK failed: (size) > (0): ");
        sub_24C716B88((uint64_t)&v23, (const char **)&v14->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v26);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      result += v11;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_24C72196C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

char *sub_24C721994(char *a1, unint64_t a2, unsigned int **a3)
{
  uint64_t v3 = a1;
  while ((unint64_t)v3 < a2)
  {
    unint64_t v6 = *v3;
    if (*v3 < 0)
    {
      int v7 = v6 + (v3[1] << 7);
      unint64_t v6 = (v7 - 128);
      if (v3[1] < 0)
      {
        uint64_t v3 = (char *)sub_24C723CD0((uint64_t)v3, (v7 - 128));
        if (!v3) {
          return v3;
        }
        unint64_t v6 = v8;
      }
      else
      {
        v3 += 2;
      }
    }
    else
    {
      ++v3;
    }
    if (((unsigned int (*)(unsigned int *, unint64_t))a3[1])(a3[2], v6))
    {
      int v9 = (int *)*a3;
      uint64_t v10 = **a3;
      if (v10 == (*a3)[1])
      {
        int v11 = v10 + 1;
        sub_24C726A10((int *)*a3, v10 + 1);
        *(_DWORD *)(sub_24C726EB0((uint64_t)v9) + 4 * v10) = v6;
      }
      else
      {
        *(_DWORD *)(sub_24C726EB0((uint64_t)*a3) + 4 * v10) = v6;
        int v11 = v10 + 1;
      }
      int *v9 = v11;
    }
    else
    {
      int v12 = *((_DWORD *)a3 + 8);
      int v13 = (unint64_t *)a3[3];
      if (*v13) {
        int v14 = (std::string *)((*v13 & 0xFFFFFFFFFFFFFFFELL) + 8);
      }
      else {
        int v14 = (std::string *)sub_24C7078BC(v13);
      }
      sub_24C723BBC(v12, v6, v14);
    }
  }
  return v3;
}

char *sub_24C721AC0(uint64_t a1, char *__src, int64_t __n)
{
  *(_DWORD *)(a1 + 84) = 0;
  if (__n >= 17)
  {
    *(_DWORD *)(a1 + 28) = 16;
    unint64_t v6 = &__src[__n - 16];
    *(void *)a1 = v6;
    *(void *)(a1 + 8) = v6;
    *(void *)(a1 + 16) = a1 + 40;
    if (*(void *)(a1 + 72) != 1) {
      return __src;
    }
    uint64_t v7 = 2;
    unint64_t v8 = __src;
    goto LABEL_6;
  }
  unint64_t v8 = (char *)(a1 + 40);
  memcpy((void *)(a1 + 40), __src, __n);
  *(_DWORD *)(a1 + 28) = 0;
  *(void *)a1 = &v8[__n];
  *(void *)(a1 + 8) = &v8[__n];
  *(void *)(a1 + 16) = 0;
  if (*(void *)(a1 + 72) == 1)
  {
    uint64_t v7 = __src - v8;
LABEL_6:
    *(void *)(a1 + 72) = v7;
  }
  return v8;
}

uint64_t sub_24C721B74(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  if ((v1 & 0x80000000) != 0)
  {
    sub_24C716A34((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1780);
    int v5 = sub_24C716A4C(v7, "CHECK failed: (n) >= (0): ");
    sub_24C716B88((uint64_t)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    return sub_24C716B90((uint64_t)v7);
  }
  else if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = (uint64_t *)(*(void *)(result + 16) + 8);
    do
    {
      uint64_t v4 = *v3++;
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4);
      --v1;
    }
    while (v1);
    *(_DWORD *)(v2 + 8) = 0;
  }
  return result;
}

void sub_24C721C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C721C44(void *a1)
{
  uint64_t v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    uint64_t v3 = v2 + 2;
    uint64_t v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3) {
          (*(void (**)(void))(*(void *)*v3 + 8))(*v3);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

uint64_t **sub_24C721CD0(uint64_t **a1, int *a2, _OWORD *a3)
{
  char v6 = a1 + 1;
  int v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        int v5 = *v8;
        char v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      int v5 = v8[1];
      if (!v5)
      {
        char v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x40uLL);
    long long v11 = a3[1];
    *((_OWORD *)v10 + 2) = *a3;
    *((_OWORD *)v10 + 3) = v11;
    sub_24C6E4EB4(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void sub_24C721D8C(uint64_t a1)
{
}

uint64_t *sub_24C721D94(uint64_t **a1, uint64_t *a2, int *a3, _OWORD *a4)
{
  char v6 = sub_24C721E1C(a1, a2, &v12, &v11, a3);
  int v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    unint64_t v8 = (uint64_t **)v6;
    int v7 = (uint64_t *)operator new(0x40uLL);
    long long v9 = a4[1];
    *((_OWORD *)v7 + 2) = *a4;
    *((_OWORD *)v7 + 3) = v9;
    sub_24C6E4EB4(a1, (uint64_t)v12, v8, v7);
  }
  return v7;
}

uint64_t *sub_24C721E1C(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  int v5 = a1 + 1;
  if (a1 + 1 == a2 || (int v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    unint64_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      long long v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        long long v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      int v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        int v13 = v10;
      }
      while (v14);
    }
    int v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          long long v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          int v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        int v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      long long v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    int v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      int v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    char v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      char v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          int v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        int v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void sub_24C721FC4()
{
}

uint64_t sub_24C721FF0(uint64_t (***a1)(void))
{
  return (**a1)(a1);
}

void sub_24C722014(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_24C722028()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2697ED298, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2697ED298))
  {
    qword_2697ED438 = 0;
    unk_2697ED440 = 0;
    qword_2697ED448 = 0;
    sub_24C722C0C((uint64_t)sub_24C722014, (uint64_t)&qword_2697ED438);
    atomic_store(1u, byte_2697ED710);
    __cxa_guard_release(&qword_2697ED298);
  }
}

void sub_24C7220BC(_Unwind_Exception *a1)
{
}

uint64_t sub_24C7220D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 64))(v4, a1);
  (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 64))(a1, a2);
  (*(void (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 64))(a2, v4);
  int v5 = *(uint64_t (**)(uint64_t))(*(void *)v4 + 8);
  return v5(v4);
}

void sub_24C72222C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_24C722260(_DWORD *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2697ED290, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2697ED290))
  {
    __cxa_atexit((void (*)(void *))std::mutex::~mutex, &stru_2697ECF90, &dword_24C664000);
    __cxa_guard_release(&qword_2697ED290);
  }
  pthread_t v2 = pthread_self();
  uint64_t v3 = (uint64_t)v2;
  if (qword_2697ED428)
  {
    if (v2 && v2 == (pthread_t)qword_2697ED428) {
      goto LABEL_5;
    }
  }
  else if (!v2)
  {
LABEL_5:
    if (*a1 != 1)
    {
      sub_24C716A34((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/generated_message_util.cc", 785);
      uint64_t v4 = sub_24C716A4C(v6, "CHECK failed: (scc->visit_status.load(std::memory_order_relaxed)) == (SCCInfoBase::kRunning): ");
      sub_24C716B88((uint64_t)&v5, (const char **)&v4->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v6);
    }
    return;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)byte_2697ED710, memory_order_acquire) & 1) == 0) {
    sub_24C722028();
  }
  std::mutex::lock(&stru_2697ECF90);
  qword_2697ED428 = v3;
  sub_24C7223CC(a1);
  qword_2697ED428 = 0;
  std::mutex::unlock(&stru_2697ECF90);
}

void sub_24C7223B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

_DWORD *sub_24C7223CC(_DWORD *result)
{
  if (*result == -1)
  {
    uint64_t v1 = (uint64_t (**)(void))result;
    *uint64_t result = 1;
    pthread_t v2 = result + 6;
    int v3 = result[1];
    if (v3 >= 1)
    {
      for (uint64_t i = 0; i < v3; ++i)
      {
        if (*(void *)&v2[2 * i])
        {
          sub_24C7223CC();
          int v3 = *((_DWORD *)v1 + 1);
        }
      }
    }
    uint64_t v5 = v3;
    int v6 = *((_DWORD *)v1 + 2);
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      unint64_t v8 = &v2[2 * v5];
      do
      {
        if (**(void **)&v8[2 * v7])
        {
          sub_24C7223CC();
          int v6 = *((_DWORD *)v1 + 2);
        }
        ++v7;
      }
      while (v7 < v6);
    }
    uint64_t result = (_DWORD *)v1[2]();
    atomic_store(0, (unsigned int *)v1);
  }
  return result;
}

uint64_t sub_24C72247C(char *__src, int64_t __n, uint64_t a3, char a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v13 = 0x7FFFFFFF00000000;
  int v14 = dword_2697ED254;
  unsigned int v15 = 0x80000000;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  int v6 = sub_24C721AC0((uint64_t)v9, __src, __n);
  if ((*(uint64_t (**)(uint64_t, char *, unsigned char *))(*(void *)a3 + 88))(a3, v6, v9)) {
    BOOL v7 = v13 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if (a4 & 2) != 0 || ((*(uint64_t (**)(uint64_t))(*(void *)a3 + 48))(a3)) {
      return 1;
    }
    sub_24C7225A8(a3);
  }
  return 0;
}

void *sub_24C722598@<X0>(void *a1@<X8>)
{
  return sub_24C6698FC(a1, "(cannot determine missing fields for lite message)");
}

uint64_t sub_24C7225A8(uint64_t a1)
{
  sub_24C716A34((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 133);
  sub_24C72265C("parse", a1, &__p);
  pthread_t v2 = sub_24C716A78(v6, (const std::string::value_type *)&__p);
  sub_24C716B88((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return sub_24C716B90((uint64_t)v6);
}

void sub_24C72262C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_24C716B90((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_24C72265C(const std::string::value_type *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::append(a3, "Can't ");
  std::string::append(a3, a1);
  std::string::append(a3, " message of type \"");
  (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a2 + 16))(&__p, a2);
  if ((v12 & 0x80u) == 0) {
    p_p = (const std::string::value_type *)&__p;
  }
  else {
    p_p = (const std::string::value_type *)__p;
  }
  if ((v12 & 0x80u) == 0) {
    std::string::size_type v7 = v12;
  }
  else {
    std::string::size_type v7 = v11;
  }
  std::string::append(a3, p_p, v7);
  if ((char)v12 < 0) {
    operator delete(__p);
  }
  std::string::append(a3, "\" because it is missing required fields: ");
  (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a2 + 56))(&__p, a2);
  if ((v12 & 0x80u) == 0) {
    unint64_t v8 = (const std::string::value_type *)&__p;
  }
  else {
    unint64_t v8 = (const std::string::value_type *)__p;
  }
  if ((v12 & 0x80u) == 0) {
    std::string::size_type v9 = v12;
  }
  else {
    std::string::size_type v9 = v11;
  }
  std::string::append(a3, v8, v9);
  if ((char)v12 < 0) {
    operator delete(__p);
  }
}

void sub_24C722798(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_24C7227D8(uint64_t a1, char *a2, unsigned int a3)
{
  if ((a3 & 0x80000000) != 0) {
    sub_24C722EE0();
  }
  int64_t v5 = a3;
  (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
  return sub_24C72247C(a2, v5, a1, 1);
}

BOOL sub_24C722854(uint64_t a1, std::string *a2)
{
  if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1) & 1) == 0)
  {
    sub_24C716A34((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 449);
    char v4 = sub_24C716A4C(v9, "CHECK failed: IsInitialized(): ");
    sub_24C72265C("serialize", a1, &__p);
    int64_t v5 = sub_24C716A78(v4, (const std::string::value_type *)&__p);
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    sub_24C716B90((uint64_t)v9);
  }
  return sub_24C722960(a1, a2);
}

void sub_24C72292C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_24C716B90((uint64_t)&a16);
  _Unwind_Resume(a1);
}

BOOL sub_24C722960(uint64_t a1, std::string *a2)
{
  pthread_t v2 = a2;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type size = a2->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  }
  unint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 72))(a1);
  uint64_t v6 = v5;
  unint64_t v7 = v5 >> 31;
  if (v5 >> 31)
  {
    sub_24C716A34((uint64_t)v16, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 457);
    (*(void (**)(std::string *__return_ptr, uint64_t))(*(void *)a1 + 16))(__p, a1);
    long long v10 = sub_24C716A78(v16, (const std::string::value_type *)__p);
    std::string::size_type v11 = sub_24C716A4C(v10, " exceeded maximum protobuf size of 2GB: ");
    unsigned __int8 v12 = sub_24C716CC4(v11, v6);
    sub_24C716B88((uint64_t)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    std::string::size_type v9 = v16;
    goto LABEL_12;
  }
  std::string::resize(v2, v5 + size, 0);
  if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0) {
    pthread_t v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
  }
  *(_OWORD *)&v16[0].__r_.__value_.__l.__data_ = (unint64_t)v2 + size + v6;
  uint64_t v17 = 0;
  __int16 v18 = 0;
  char v19 = byte_2697ED80C & 1;
  if (v16[0].__r_.__value_.__r.__words[0] != (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1))
  {
    sub_24C716A34((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 360);
    unint64_t v8 = sub_24C716A4C(__p, "CHECK failed: target + size == res: ");
    sub_24C716B88((uint64_t)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
    std::string::size_type v9 = __p;
LABEL_12:
    sub_24C716B90((uint64_t)v9);
  }
  return v7 == 0;
}

void sub_24C722B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

BOOL sub_24C722B9C@<W0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  BOOL result = sub_24C722854(a1, (std::string *)a2);
  if (!result)
  {
    if (*(char *)(a2 + 23) < 0)
    {
      **(unsigned char **)a2 = 0;
      *(void *)(a2 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a2 = 0;
      *(unsigned char *)(a2 + 23) = 0;
    }
  }
  return result;
}

void sub_24C722BF0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_24C722C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24C722D40();
  std::mutex::lock((std::mutex *)(v4 + 24));
  unint64_t v5 = *(void **)(v4 + 8);
  unint64_t v6 = *(void *)(v4 + 16);
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = ((uint64_t)v5 - *(void *)v4) >> 4;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 60) {
      sub_24C667470();
    }
    uint64_t v10 = v6 - *(void *)v4;
    if (v10 >> 3 > v9) {
      unint64_t v9 = v10 >> 3;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      unsigned __int8 v12 = (char *)sub_24C6E515C(v4 + 16, v11);
    }
    else {
      unsigned __int8 v12 = 0;
    }
    uint64_t v13 = &v12[16 * v8];
    char v14 = &v12[16 * v11];
    *(void *)uint64_t v13 = a1;
    *((void *)v13 + 1) = a2;
    unint64_t v7 = v13 + 16;
    uint64_t v16 = *(char **)v4;
    uint64_t v15 = *(char **)(v4 + 8);
    if (v15 != *(char **)v4)
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v15 - 1);
        v13 -= 16;
        v15 -= 16;
      }
      while (v15 != v16);
      uint64_t v15 = *(char **)v4;
    }
    *(void *)uint64_t v4 = v13;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v14;
    if (v15) {
      operator delete(v15);
    }
  }
  else
  {
    *unint64_t v5 = a1;
    v5[1] = a2;
    unint64_t v7 = v5 + 2;
  }
  *(void *)(v4 + 8) = v7;
  std::mutex::unlock((std::mutex *)(v4 + 24));
}

void sub_24C722D2C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24C722D40()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2697ECF48, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2697ECF48))
  {
    operator new();
  }
  return qword_2697ECFD0;
}

void sub_24C722DD0(_Unwind_Exception *a1)
{
}

void sub_24C722DE8()
{
  if ((byte_2697ED430 & 1) == 0)
  {
    uint64_t v0 = sub_24C722D40();
    if (v0)
    {
      uint64_t v1 = sub_24C722E38(v0);
      MEMORY[0x2532F8960](v1, 0x1020C40A0054943);
    }
    byte_2697ED430 = 1;
  }
}

uint64_t sub_24C722E38(uint64_t a1)
{
  pthread_t v2 = *(void **)a1;
  int v3 = *(void **)(a1 + 8);
  uint64_t v4 = v3 - 2;
  if (*(void **)a1 != v3 && v4 > v2)
  {
    do
    {
      unint64_t v6 = (void (*)(void))*v2;
      *pthread_t v2 = *v4;
      void *v4 = v6;
      uint64_t v7 = v2[1];
      v2[1] = v4[1];
      v4[1] = v7;
      v2 += 2;
      v4 -= 2;
    }
    while (v2 < v4);
    pthread_t v2 = *(void **)a1;
    int v3 = *(void **)(a1 + 8);
  }
  while (v2 != v3)
  {
    ((void (*)(void))*v2)(v2[1]);
    v2 += 2;
  }
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  uint64_t v8 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v8;
    operator delete(v8);
  }
  return a1;
}

void sub_24C722EE0()
{
  __assert_rtn("StringPiece", "stringpiece.h", 229, "len >= 0");
}

_OWORD *sub_24C722F0C(uint64_t a1)
{
  if (*(int *)(a1 + 28) <= 16)
  {
    sub_24C716A34((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 158);
    pthread_t v2 = sub_24C716A4C(v7, "CHECK failed: limit_ > kSlopBytes: ");
    sub_24C716B88((uint64_t)&v6, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v7);
  }
  BOOL result = sub_24C722FD4(a1, 0, -1);
  uint64_t v4 = *(void *)(a1 + 8);
  if (result)
  {
    int v5 = *(_DWORD *)(a1 + 28) + result - v4;
    *(_DWORD *)(a1 + 28) = v5;
    v4 += v5 & (v5 >> 31);
  }
  else
  {
    *(_DWORD *)(a1 + 80) = 1;
  }
  *(void *)a1 = v4;
  return result;
}

void sub_24C722FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

_OWORD *sub_24C722FD4(uint64_t a1, unsigned int a2, int a3)
{
  int v3 = *(_OWORD **)(a1 + 16);
  if (!v3) {
    return v3;
  }
  uint64_t v5 = a1 + 40;
  if (v3 != (_OWORD *)(a1 + 40))
  {
    int v6 = *(_DWORD *)(a1 + 24);
    if (v6 <= 16)
    {
      sub_24C716A34((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 105);
      uint64_t v7 = sub_24C716A4C(v33, "CHECK failed: size_ > kSlopBytes: ");
      sub_24C716B88((uint64_t)&__src, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v33);
      int v3 = *(_OWORD **)(a1 + 16);
      int v6 = *(_DWORD *)(a1 + 24);
    }
    *(void *)(a1 + 8) = (char *)v3 + v6 - 16;
    *(void *)(a1 + 16) = v5;
    if (*(void *)(a1 + 72) == 1) {
      *(void *)(a1 + 72) = 2;
    }
    return v3;
  }
  _OWORD *v3 = *(_OWORD *)*(void *)(a1 + 8);
  if (*(int *)(a1 + 84) < 1) {
    goto LABEL_46;
  }
  int v8 = a3;
  if (a3 < 0) {
    goto LABEL_39;
  }
  if ((a2 & 0x80000000) != 0)
  {
    sub_24C716A34((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 53);
    unint64_t v11 = sub_24C716A4C(v33, "CHECK failed: overrun >= 0: ");
    sub_24C716B88((uint64_t)&__src, (const char **)&v11->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v33);
LABEL_14:
    unint64_t v12 = a1 + 56;
    uint64_t v13 = (unsigned __int8 *)v3 + (int)a2;
    char v14 = v13;
    while (2)
    {
      int v15 = (char)*v14++;
      int v16 = v15;
      if (v15 < 0)
      {
        int v16 = v16 + (*v14 << 7) - 128;
        if ((char)*v14 < 0)
        {
          char v14 = v13 + 3;
          uint64_t v20 = -21;
          while (1)
          {
            v16 += (*(v14 - 1) - 1) << (v20 + 35);
            if (((char)*(v14 - 1) & 0x80000000) == 0) {
              break;
            }
            ++v14;
            v20 += 7;
            if (!v20) {
              goto LABEL_39;
            }
          }
        }
        else
        {
          char v14 = v13 + 2;
        }
      }
      if ((unint64_t)v14 <= v12)
      {
        if (!v16) {
          goto LABEL_46;
        }
        switch(v16 & 7)
        {
          case 0:
            v33[0].__r_.__value_.__r.__words[0] = 0;
            char v14 = sub_24C724414((char *)v14, v33);
            if (!v14) {
              goto LABEL_39;
            }
            goto LABEL_38;
          case 1:
            v14 += 8;
            goto LABEL_38;
          case 2:
            int v18 = *v14;
            if ((char)*v14 < 0)
            {
              uint64_t v19 = sub_24C723D5C((uint64_t)v14, v18);
              if (!v19) {
                goto LABEL_39;
              }
            }
            else
            {
              uint64_t v19 = (uint64_t)(v14 + 1);
            }
            if ((uint64_t)(v12 - v19) < v18) {
              goto LABEL_39;
            }
            char v14 = (unsigned __int8 *)(v19 + v18);
LABEL_38:
            uint64_t v13 = v14;
            if ((unint64_t)v14 >= v12) {
              goto LABEL_39;
            }
            continue;
          case 3:
            ++v8;
            goto LABEL_38;
          case 4:
            BOOL v17 = __OFSUB__(v8--, 1);
            if (v8 < 0 != v17) {
              goto LABEL_46;
            }
            goto LABEL_38;
          case 5:
            v14 += 4;
            goto LABEL_38;
          default:
            goto LABEL_39;
        }
      }
      goto LABEL_39;
    }
  }
  if (a2 >= 0x11)
  {
    sub_24C716A34((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 54);
    uint64_t v10 = sub_24C716A4C(v33, "CHECK failed: overrun <= kSlopBytes: ");
    sub_24C716B88((uint64_t)&__src, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v33);
    goto LABEL_39;
  }
  if (a2 != 16) {
    goto LABEL_14;
  }
LABEL_39:
  __src = 0;
  if (!(*(unsigned int (**)(void, void **, uint64_t))(**(void **)(a1 + 32) + 16))(*(void *)(a1 + 32), &__src, a1 + 24))
  {
LABEL_45:
    *(_DWORD *)(a1 + 84) = 0;
LABEL_46:
    if (*(void *)(a1 + 72) == 2) {
      *(void *)(a1 + 72) = *(void *)(a1 + 8) - (void)v3;
    }
    *(void *)(a1 + 8) = a1 + 56;
    *(void *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 24) = 0;
    return v3;
  }
  while (1)
  {
    size_t v21 = *(unsigned int *)(a1 + 24);
    *(_DWORD *)(a1 + 84) -= v21;
    if ((int)v21 >= 17)
    {
      unint64_t v27 = *(void *)(a1 + 72);
      std::string v26 = (void *)(a1 + 72);
      unint64_t v25 = v27;
      uint64_t v28 = (char *)(v26 - 2);
      unsigned int v29 = __src;
      *((_OWORD *)v26 - 1) = *(_OWORD *)__src;
      *(v26 - 7) = v29;
      goto LABEL_52;
    }
    if ((int)v21 >= 1) {
      break;
    }
    if (v21)
    {
      sub_24C716A34((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 137);
      int v22 = sub_24C716A4C(v33, "CHECK failed: size_ == 0: ");
      char v23 = sub_24C716C44(v22, *(_DWORD *)(a1 + 24));
      sub_24C716B88((uint64_t)&v31, (const char **)&v23->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v33);
    }
    if (((*(uint64_t (**)(void, void **, uint64_t))(**(void **)(a1 + 32) + 16))(*(void *)(a1 + 32), &__src, a1 + 24) & 1) == 0)goto LABEL_45; {
  }
    }
  memcpy((void *)(a1 + 56), __src, v21);
  unint64_t v30 = *(void *)(a1 + 72);
  std::string v26 = (void *)(a1 + 72);
  unint64_t v25 = v30;
  uint64_t v28 = (char *)v3 + v21;
  *(v26 - 7) = v3;
LABEL_52:
  *(v26 - 8) = v28;
  if (v25 > 1) {
    void *v26 = 1;
  }
  return v3;
}

void sub_24C7233B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_24C723400(uint64_t a1, signed int a2, int a3)
{
  int v3 = *(_DWORD *)(a1 + 28);
  if (v3 < a2) {
    return 0;
  }
  signed int v5 = a2;
  if (v3 == a2)
  {
    sub_24C716A34((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 175);
    uint64_t v7 = sub_24C716A4C(v19, "CHECK failed: overrun != limit_: ");
    sub_24C716B88((uint64_t)&v18, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v19);
    int v3 = *(_DWORD *)(a1 + 28);
  }
  if (v3 <= v5)
  {
    sub_24C716A34((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 176);
    int v8 = sub_24C716A4C(v19, "CHECK failed: overrun < limit_: ");
    sub_24C716B88((uint64_t)&v18, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v19);
    int v3 = *(_DWORD *)(a1 + 28);
  }
  if (*(void *)a1 != *(void *)(a1 + 8) + (v3 & (v3 >> 31)))
  {
    sub_24C716A34((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 181);
    unint64_t v9 = sub_24C716A4C(v19, "CHECK failed: limit_end_ == buffer_end_ + (std::min)(0, limit_): ");
    sub_24C716B88((uint64_t)&v18, (const char **)&v9->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v19);
    int v3 = *(_DWORD *)(a1 + 28);
  }
  if (v3 <= 0)
  {
    sub_24C716A34((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 183);
    uint64_t v10 = sub_24C716A4C(v19, "CHECK failed: limit_ > 0: ");
    sub_24C716B88((uint64_t)&v18, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v19);
  }
  if (*(void *)a1 != *(void *)(a1 + 8))
  {
    sub_24C716A34((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 184);
    unint64_t v11 = sub_24C716A4C(v19, "CHECK failed: limit_end_ == buffer_end_: ");
    sub_24C716B88((uint64_t)&v18, (const char **)&v11->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v19);
  }
  while (1)
  {
    if (v5 < 0)
    {
      sub_24C716A34((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 188);
      unint64_t v12 = sub_24C716A4C(v19, "CHECK failed: overrun >= 0: ");
      sub_24C716B88((uint64_t)&v18, (const char **)&v12->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v19);
    }
    uint64_t v13 = sub_24C722FD4(a1, v5, a3);
    if (!v13) {
      break;
    }
    uint64_t v14 = *(void *)(a1 + 8);
    int v15 = *(_DWORD *)(a1 + 28) + v13 - v14;
    *(_DWORD *)(a1 + 28) = v15;
    BOOL result = (char *)v13 + v5;
    signed int v5 = result - v14;
    if ((int)result - (int)v14 < 0)
    {
      *(void *)a1 = v14 + (v15 & (v15 >> 31));
      return result;
    }
  }
  if (v5) {
    return 0;
  }
  if (*(int *)(a1 + 28) <= 0)
  {
    sub_24C716A34((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 193);
    BOOL v17 = sub_24C716A4C(v19, "CHECK failed: limit_ > 0: ");
    sub_24C716B88((uint64_t)&v18, (const char **)&v17->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v19);
  }
  BOOL result = *(char **)(a1 + 8);
  *(void *)a1 = result;
  *(_DWORD *)(a1 + 80) = 1;
  return result;
}

void sub_24C7236B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

_OWORD *sub_24C7236F8(uint64_t a1, int a2, int a3)
{
  int v5 = *(_DWORD *)(a1 + 8) - a2 + 16;
  while (1)
  {
    BOOL v6 = __OFSUB__(a3, v5);
    a3 -= v5;
    if ((a3 < 0) ^ v6 | (a3 == 0))
    {
      sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      uint64_t v7 = sub_24C716A4C(v10, "CHECK failed: size > chunk_size: ");
      sub_24C716B88((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v10);
    }
    if (!*(void *)(a1 + 16) || *(int *)(a1 + 28) < 17) {
      break;
    }
    BOOL result = sub_24C722F0C(a1);
    if (!result) {
      return result;
    }
    int v5 = *(_DWORD *)(a1 + 8) - result;
    if (a3 <= v5) {
      return (_OWORD *)((char *)result + a3 + 16);
    }
  }
  return 0;
}

void sub_24C7237C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

const std::string::value_type *sub_24C7237E0(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  int v5 = a3;
  BOOL v6 = __s;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0;
  }
  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    *((unsigned char *)&this->__r_.__value_.__s + 23) = 0;
  }
  uint64_t v8 = *(void *)(a1 + 8);
  if (v8 - (uint64_t)__s + *(int *)(a1 + 28) >= a3)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
    }
    else {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    }
    if (a3 >= 50000000) {
      int v10 = 50000000;
    }
    else {
      int v10 = a3;
    }
    std::string::reserve(this, size + v10);
    uint64_t v8 = *(void *)(a1 + 8);
  }
  int v11 = v8 - v6 + 16;
  while (1)
  {
    BOOL v12 = __OFSUB__(v5, v11);
    v5 -= v11;
    if ((v5 < 0) ^ v12 | (v5 == 0))
    {
      sub_24C716A34((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      uint64_t v13 = sub_24C716A4C(v16, "CHECK failed: size > chunk_size: ");
      sub_24C716B88((uint64_t)&v15, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v16);
    }
    if (!*(void *)(a1 + 16)) {
      break;
    }
    std::string::append(this, v6, v11);
    if (*(int *)(a1 + 28) < 17) {
      break;
    }
    BOOL result = (const std::string::value_type *)sub_24C722F0C(a1);
    if (!result) {
      return result;
    }
    BOOL v6 = result + 16;
    int v11 = *(_DWORD *)(a1 + 8) - result;
    if (v5 <= v11)
    {
      std::string::append(this, v6, v5);
      return &v6[v5];
    }
  }
  return 0;
}

void sub_24C723950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

const std::string::value_type *sub_24C723968(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  int v5 = a3;
  BOOL v6 = __s;
  uint64_t v8 = *(void *)(a1 + 8);
  if (v8 - (uint64_t)__s + *(int *)(a1 + 28) >= a3)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
    }
    else {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    }
    if (a3 >= 50000000) {
      int v10 = 50000000;
    }
    else {
      int v10 = a3;
    }
    std::string::reserve(this, size + v10);
    uint64_t v8 = *(void *)(a1 + 8);
  }
  int v11 = v8 - v6 + 16;
  while (1)
  {
    BOOL v12 = __OFSUB__(v5, v11);
    v5 -= v11;
    if ((v5 < 0) ^ v12 | (v5 == 0))
    {
      sub_24C716A34((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      uint64_t v13 = sub_24C716A4C(v16, "CHECK failed: size > chunk_size: ");
      sub_24C716B88((uint64_t)&v15, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v16);
    }
    if (!*(void *)(a1 + 16)) {
      break;
    }
    std::string::append(this, v6, v11);
    if (*(int *)(a1 + 28) < 17) {
      break;
    }
    BOOL result = (const std::string::value_type *)sub_24C722F0C(a1);
    if (!result) {
      return result;
    }
    BOOL v6 = result + 16;
    int v11 = *(_DWORD *)(a1 + 8) - result;
    if (v5 <= v11)
    {
      std::string::append(this, v6, v5);
      return &v6[v5];
    }
  }
  return 0;
}

void sub_24C723AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C723AD4(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  int v6 = (char)*a3;
  unsigned int v7 = *a3;
  if (v6 < 0)
  {
    uint64_t result = sub_24C723D5C((uint64_t)a3, v7);
    if (!result) {
      return result;
    }
    uint64_t v8 = (char *)result;
    unsigned int v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(a3 + 1);
  }
  int v11 = sub_24C707BE8(a1, (int)v8, v7);
  int v12 = *(_DWORD *)(a1 + 88);
  BOOL v13 = __OFSUB__(v12--, 1);
  *(_DWORD *)(a1 + 88) = v12;
  if (v12 < 0 != v13) {
    return 0;
  }
  int v14 = v11;
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)a2 + 88))(a2, v8, a1);
  if (!result) {
    return result;
  }
  ++*(_DWORD *)(a1 + 88);
  if (*(_DWORD *)(a1 + 80)) {
    return 0;
  }
  int v15 = *(_DWORD *)(a1 + 28) + v14;
  *(_DWORD *)(a1 + 28) = v15;
  *(void *)a1 = *(void *)(a1 + 8) + (v15 & (v15 >> 31));
  return result;
}

void sub_24C723BBC(int a1, unint64_t a2, std::string *this)
{
  unint64_t v5 = (8 * a1);
  if (v5 < 0x80)
  {
    LOBYTE(v6) = 8 * a1;
  }
  else
  {
    do
    {
      std::string::push_back(this, v5 | 0x80);
      unint64_t v6 = v5 >> 7;
      unint64_t v7 = v5 >> 14;
      v5 >>= 7;
    }
    while (v7);
  }
  std::string::push_back(this, v6);
  if (a2 < 0x80)
  {
    LOBYTE(v8) = a2;
  }
  else
  {
    do
    {
      std::string::push_back(this, a2 | 0x80);
      unint64_t v8 = a2 >> 7;
      unint64_t v9 = a2 >> 14;
      a2 >>= 7;
    }
    while (v9);
  }
  std::string::push_back(this, v8);
}

uint64_t sub_24C723C68(uint64_t a1, int a2)
{
  uint64_t result = a1 + 3;
  uint64_t v4 = -21;
  while (1)
  {
    a2 += (*(unsigned __int8 *)(result - 1) - 1) << (v4 + 35);
    if ((*(char *)(result - 1) & 0x80000000) == 0) {
      break;
    }
    ++result;
    v4 += 7;
    if (!v4)
    {
      while (*(char *)(a1 + v4 + 5) < 0)
      {
        uint64_t result = 0;
        if (++v4 == 5) {
          return result;
        }
      }
      return a1 + v4 + 6;
    }
  }
  return result;
}

uint64_t sub_24C723CD0(uint64_t a1, uint64_t a2)
{
  a2 = a2;
  uint64_t result = a1 + 3;
  uint64_t v4 = (char *)(a1 + 2);
  uint64_t v5 = 14;
  while (1)
  {
    int v6 = *v4++;
    a2 += (v6 - 1) << v5;
    if ((v6 & 0x80000000) == 0) {
      break;
    }
    ++result;
    v5 += 7;
    if (v5 == 70) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24C723D18(uint64_t a1, int a2)
{
  uint64_t result = a1 + 3;
  uint64_t v4 = (char *)(a1 + 2);
  uint64_t v5 = -21;
  while (1)
  {
    int v6 = *v4++;
    a2 += (v6 - 1) << (v5 + 35);
    if ((v6 & 0x80000000) == 0) {
      break;
    }
    ++result;
    v5 += 7;
    if (!v5) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24C723D5C(uint64_t a1, int a2)
{
  uint64_t result = a1 + 2;
  uint64_t v4 = -21;
  while (1)
  {
    a2 += (*(unsigned __int8 *)(result - 1) - 1) << (v4 + 28);
    if ((*(char *)(result - 1) & 0x80000000) == 0) {
      break;
    }
    ++result;
    v4 += 7;
    if (!v4)
    {
      unsigned int v5 = *(unsigned __int8 *)(a1 + 4);
      uint64_t v6 = a1 + 5;
      if (a2 + (v5 << 28) - 0x10000000 > 0x7FFFFFEF) {
        uint64_t v6 = 0;
      }
      if (v5 <= 7) {
        return v6;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

const std::string::value_type *sub_24C723DCC(std::string *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (const std::string::value_type *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = (std::string::value_type *)result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_24C7216CC(a3, v6, v5, a1);
}

unsigned __int8 *sub_24C723E44(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_24C724488(a3, a2, a1);
}

unsigned __int8 *sub_24C723E54(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_24C72475C(a3, a2, a1);
}

unsigned __int8 *sub_24C723E64(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_24C724A30(a3, a2, a1);
}

unsigned __int8 *sub_24C723E74(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_24C724D04(a3, a2, a1);
}

unsigned __int8 *sub_24C723E84(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_24C724FD8(a3, a2, a1);
}

unsigned __int8 *sub_24C723E94(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_24C7252B8(a3, a2, a1);
}

unsigned __int8 *sub_24C723EA4(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_24C725598(a3, a2, a1);
}

char *sub_24C723EB8(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_24C725874(a3, v6, v5, a1);
}

char *sub_24C723F34(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_24C72597C(a3, v6, v5, a1);
}

char *sub_24C723FB0(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_24C725A84(a3, v6, v5, a1);
}

char *sub_24C72402C(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_24C725B8C(a3, v6, v5, a1);
}

char *sub_24C7240A8(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_24C725C94(a3, v6, v5, a1);
}

char *sub_24C724124(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_24C725D9C(a3, v6, v5, a1);
}

char *sub_24C72419C(uint64_t a1, char *a2, uint64_t a3)
{
  unsigned int v10 = a2;
  while (1)
  {
    if (sub_24C70777C(a3, &v10, *(_DWORD *)(a3 + 92))) {
      return v10;
    }
    int v5 = v10 + 1;
    unsigned int v6 = *v10;
    if (*v10 < 0)
    {
      unsigned int v6 = v6 + (*v5 << 7) - 128;
      if (*v5 < 0)
      {
        int v5 = v10 + 3;
        uint64_t v8 = -21;
        while (1)
        {
          v6 += (*(v5 - 1) - 1) << (v8 + 35);
          if ((*(v5 - 1) & 0x80000000) == 0) {
            break;
          }
          ++v5;
          v8 += 7;
          if (!v8) {
            return 0;
          }
        }
      }
      else
      {
        int v5 = v10 + 2;
      }
    }
    unsigned int v10 = v5;
    if (!v6 || (v6 & 7) == 4) {
      break;
    }
    unsigned int v10 = (char *)sub_24C7242B4(v6, a1);
    if (!v10) {
      return 0;
    }
  }
  *(_DWORD *)(a3 + 80) = v6 - 1;
  return v5;
}

unsigned __int8 *sub_24C724288(unsigned int a1, std::string *a2, char *a3, int32x2_t *a4)
{
  int v5 = a2;
  return sub_24C7242B4(a1, &v5, a3, a4);
}

unsigned __int8 *sub_24C7242B4(unint64_t a1, std::string **a2, char *a3, int32x2_t *a4)
{
  unint64_t v4 = a1 >> 3;
  if (!(a1 >> 3)) {
    return 0;
  }
  int v5 = (unsigned __int8 *)a3;
  switch(a1 & 7)
  {
    case 0uLL:
      v11[0].__r_.__value_.__r.__words[0] = 0;
      int v5 = sub_24C724414(a3, v11);
      if (v5) {
        sub_24C725EA4(a2, v4, v11[0].__r_.__value_.__r.__words[0]);
      }
      return v5;
    case 1uLL:
      int v5 = (unsigned __int8 *)(a3 + 8);
      sub_24C725F6C((std::string *)a2, v4, *(void *)a3);
      return v5;
    case 2uLL:
      uint64_t v8 = (unsigned __int8 *)sub_24C726028(a2, v4, a3, (uint64_t)a4);
      goto LABEL_10;
    case 3uLL:
      uint64_t v8 = (unsigned __int8 *)sub_24C726194(a2, v4, a3, a4);
LABEL_10:
      int v5 = v8;
      break;
    case 4uLL:
      sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 758);
      unint64_t v7 = sub_24C716A4C(v11, "Can't happen");
      sub_24C716B88((uint64_t)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v11);
      break;
    case 5uLL:
      int v5 = (unsigned __int8 *)(a3 + 4);
      sub_24C7262C0((std::string *)a2, v4, *(_DWORD *)a3);
      break;
    default:
      return 0;
  }
  return v5;
}

void sub_24C7243E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C724414(char *a1, void *a2)
{
  uint64_t v2 = *a1;
  if (*a1 < 0)
  {
    int v4 = a1[1];
    uint64_t v5 = (v2 + (v4 << 7) - 128);
    if ((v4 & 0x80) != 0)
    {
      uint64_t result = (unsigned __int8 *)(a1 + 3);
      uint64_t v6 = 14;
      while (1)
      {
        v5 += (*(result - 1) - 1) << v6;
        if (((char)*(result - 1) & 0x80000000) == 0) {
          break;
        }
        ++result;
        v6 += 7;
        if (v6 == 70)
        {
          uint64_t result = 0;
          uint64_t v5 = 0;
          break;
        }
      }
      *a2 = v5;
    }
    else
    {
      *a2 = v5;
      return (unsigned __int8 *)(a1 + 2);
    }
  }
  else
  {
    *a2 = v2;
    return (unsigned __int8 *)(a1 + 1);
  }
  return result;
}

unsigned __int8 *sub_24C724488(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_24C7246AC(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_24C7246AC(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_24C716A4C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_24C7246AC((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_24C716A4C(&v18, "CHECK failed: (size) > (0): ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_24C724684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C7246AC(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_24C724414((char *)i, &v10);
    if (!i) {
      break;
    }
    int v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_24C726A10(a3, v7 + 1);
      *(_DWORD *)(sub_24C726EB0((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(sub_24C726EB0((uint64_t)a3) + 4 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_24C72475C(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_24C724980(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_24C724980(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_24C716A4C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_24C724980((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_24C716A4C(&v18, "CHECK failed: (size) > (0): ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_24C724958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C724980(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_24C724414((char *)i, &v10);
    if (!i) {
      break;
    }
    int v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_24C72706C(a3, v7 + 1);
      *(_DWORD *)(sub_24C72750C((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(sub_24C72750C((uint64_t)a3) + 4 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_24C724A30(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_24C724C54(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_24C724C54(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_24C716A4C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_24C724C54((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_24C716A4C(&v18, "CHECK failed: (size) > (0): ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_24C724C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C724C54(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_24C724414((char *)i, &v10);
    if (!i) {
      break;
    }
    uint64_t v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_24C7276C8(a3, v7 + 1);
      *(void *)(sub_24C727B68((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(void *)(sub_24C727B68((uint64_t)a3) + 8 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_24C724D04(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_24C724F28(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_24C724F28(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_24C716A4C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_24C724F28((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_24C716A4C(&v18, "CHECK failed: (size) > (0): ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_24C724F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C724F28(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_24C724414((char *)i, &v10);
    if (!i) {
      break;
    }
    uint64_t v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_24C727D24(a3, v7 + 1);
      *(void *)(sub_24C7281C4((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(void *)(sub_24C7281C4((uint64_t)a3) + 8 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_24C724FD8(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_24C7251FC(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_24C7251FC(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_24C716A4C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_24C7251FC((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_24C716A4C(&v18, "CHECK failed: (size) > (0): ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_24C7251D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C7251FC(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_24C724414((char *)i, &v10);
    if (!i) {
      break;
    }
    int v6 = -(v10 & 1) ^ (v10 >> 1);
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_24C726A10(a3, v7 + 1);
      *(_DWORD *)(sub_24C726EB0((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(sub_24C726EB0((uint64_t)a3) + 4 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_24C7252B8(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_24C7254DC(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_24C7254DC(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_24C716A4C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_24C7254DC((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_24C716A4C(&v18, "CHECK failed: (size) > (0): ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_24C7254B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C7254DC(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    unint64_t v10 = 0;
    uint64_t i = sub_24C724414((char *)i, &v10);
    if (!i) {
      break;
    }
    unint64_t v6 = -(uint64_t)(v10 & 1) ^ (v10 >> 1);
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_24C7276C8(a3, v7 + 1);
      *(void *)(sub_24C727B68((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(void *)(sub_24C727B68((uint64_t)a3) + 8 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_24C725598(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_24C723D5C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_24C7257BC(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_24C7257BC(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_24C716A4C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_24C7257BC((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_24C716A34((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_24C716A4C(&v18, "CHECK failed: (size) > (0): ");
        sub_24C716B88((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_24C716B90((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_24C725794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_24C7257BC(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_24C724414((char *)i, &v10);
    if (!i) {
      break;
    }
    BOOL v6 = v10 != 0;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_24C7263BC(a3, v7 + 1);
      *(unsigned char *)(sub_24C726858((uint64_t)a3) + v7) = v6;
    }
    else
    {
      *(unsigned char *)(sub_24C726858((uint64_t)a3) + v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

char *sub_24C725874(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_24C72706C(a4, *a4 + (v5 >> 2));
    int v11 = (void *)sub_24C727240((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC)) {
      return &v6[v5 & 0xFFFFFFFC];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_24C72706C(a4, *a4 + (v7 >> 2));
      int v9 = (void *)sub_24C727240((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFFC;
      BOOL v6 = &result[-(v7 & 3) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 3));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

char *sub_24C72597C(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_24C726A10(a4, *a4 + (v5 >> 2));
    int v11 = (void *)sub_24C726BE4((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC)) {
      return &v6[v5 & 0xFFFFFFFC];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_24C726A10(a4, *a4 + (v7 >> 2));
      int v9 = (void *)sub_24C726BE4((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFFC;
      BOOL v6 = &result[-(v7 & 3) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 3));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

char *sub_24C725A84(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_24C727D24(a4, *a4 + (v5 >> 3));
    int v11 = (void *)sub_24C727EF8((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8)) {
      return &v6[v5 & 0xFFFFFFF8];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_24C727D24(a4, *a4 + (v7 >> 3));
      int v9 = (void *)sub_24C727EF8((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFF8;
      BOOL v6 = &result[-(v7 & 7) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 7));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

char *sub_24C725B8C(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_24C7276C8(a4, *a4 + (v5 >> 3));
    int v11 = (void *)sub_24C72789C((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8)) {
      return &v6[v5 & 0xFFFFFFF8];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_24C7276C8(a4, *a4 + (v7 >> 3));
      int v9 = (void *)sub_24C72789C((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFF8;
      BOOL v6 = &result[-(v7 & 7) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 7));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

char *sub_24C725C94(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_24C728380(a4, *a4 + (v5 >> 2));
    int v11 = (void *)sub_24C728554((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC)) {
      return &v6[v5 & 0xFFFFFFFC];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_24C728380(a4, *a4 + (v7 >> 2));
      int v9 = (void *)sub_24C728554((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFFC;
      BOOL v6 = &result[-(v7 & 3) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 3));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

char *sub_24C725D9C(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_24C7289DC(a4, *a4 + (v5 >> 3));
    int v11 = (void *)sub_24C728BB0((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8)) {
      return &v6[v5 & 0xFFFFFFF8];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_24C7289DC(a4, *a4 + (v7 >> 3));
      int v9 = (void *)sub_24C728BB0((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_24C722F0C(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFF8;
      BOOL v6 = &result[-(v7 & 7) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 7));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

void sub_24C725EA4(std::string **a1, int a2, unint64_t a3)
{
  int v3 = *a1;
  if (*a1)
  {
    unint64_t v6 = (8 * a2);
    if (v6 < 0x80)
    {
      LOBYTE(v7) = 8 * a2;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        unint64_t v7 = v6 >> 7;
        unint64_t v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    int v9 = *a1;
    if (a3 < 0x80)
    {
      LOBYTE(v10) = a3;
    }
    else
    {
      do
      {
        std::string::push_back(v9, a3 | 0x80);
        unint64_t v10 = a3 >> 7;
        unint64_t v11 = a3 >> 14;
        a3 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v9, v10);
  }
}

std::string *sub_24C725F6C(std::string *result, int a2, uint64_t a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  int v3 = (std::string *)result->__r_.__value_.__r.__words[0];
  if (result->__r_.__value_.__r.__words[0])
  {
    int v5 = (std::string **)result;
    unint64_t v6 = (8 * a2) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 1;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        unint64_t v7 = v6 >> 7;
        unint64_t v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    v9[0] = a3;
    return std::string::append(*v5, (const std::string::value_type *)v9, 8uLL);
  }
  return result;
}

const std::string::value_type *sub_24C726028(std::string **a1, int a2, char *a3, uint64_t a4)
{
  int v7 = *a3;
  if (*a3 < 0)
  {
    uint64_t result = (const std::string::value_type *)sub_24C723D5C((uint64_t)a3, *a3);
    if (!result) {
      return result;
    }
    unint64_t v8 = (std::string::value_type *)result;
    int v7 = v10;
  }
  else
  {
    unint64_t v8 = a3 + 1;
  }
  unint64_t v11 = *a1;
  if (*a1)
  {
    unint64_t v12 = (8 * a2) | 2u;
    if (v12 < 0x80)
    {
      LOBYTE(v13) = v12;
    }
    else
    {
      do
      {
        std::string::push_back(v11, v12 | 0x80);
        unint64_t v13 = v12 >> 7;
        unint64_t v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
    }
    std::string::push_back(v11, v13);
    unint64_t v15 = v7;
    BOOL v16 = *a1;
    if (v7 < 0x80)
    {
      LOBYTE(v17) = v7;
    }
    else
    {
      do
      {
        std::string::push_back(v16, v15 | 0x80);
        unint64_t v17 = v15 >> 7;
        unint64_t v18 = v15 >> 14;
        v15 >>= 7;
      }
      while (v18);
    }
    std::string::push_back(v16, v17);
    __int16 v19 = *a1;
    return sub_24C726350(a4, v8, v7, v19);
  }
  else if (*(void *)(a4 + 8) - (void)v8 + 16 >= v7)
  {
    return &v8[v7];
  }
  else
  {
    return (const std::string::value_type *)sub_24C7236F8(a4, (int)v8, v7);
  }
}

char *sub_24C726194(std::string **a1, int a2, char *a3, int32x2_t *a4)
{
  int v7 = *a1;
  int v8 = 8 * a2;
  if (*a1)
  {
    unint64_t v9 = v8 | 3u;
    if (v9 < 0x80)
    {
      LOBYTE(v10) = v8 | 3;
    }
    else
    {
      do
      {
        std::string::push_back(v7, v9 | 0x80);
        unint64_t v10 = v9 >> 7;
        unint64_t v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v7, v10);
  }
  int v12 = a4[11].i32[0];
  BOOL v13 = __OFSUB__(v12--, 1);
  a4[11].i32[0] = v12;
  if (v12 < 0 != v13) {
    return 0;
  }
  ++a4[11].i32[1];
  unint64_t v14 = sub_24C72419C((uint64_t)a1, a3, (uint64_t)a4);
  a4[11] = vadd_s32(a4[11], (int32x2_t)0xFFFFFFFF00000001);
  __int32 v15 = a4[10].i32[0];
  a4[10].i32[0] = 0;
  if (v15 != (v8 | 3) || v14 == 0) {
    return 0;
  }
  unint64_t v17 = v14;
  unint64_t v18 = *a1;
  if (v18)
  {
    unint64_t v19 = v8 | 4u;
    if (v19 < 0x80)
    {
      LOBYTE(v20) = v8 | 4;
    }
    else
    {
      do
      {
        std::string::push_back(v18, v19 | 0x80);
        unint64_t v20 = v19 >> 7;
        unint64_t v21 = v19 >> 14;
        v19 >>= 7;
      }
      while (v21);
    }
    std::string::push_back(v18, v20);
  }
  return v17;
}

std::string *sub_24C7262C0(std::string *result, int a2, int a3)
{
  int v3 = (std::string *)result->__r_.__value_.__r.__words[0];
  if (result->__r_.__value_.__r.__words[0])
  {
    int v5 = (std::string **)result;
    unint64_t v6 = (8 * a2) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 5;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        unint64_t v7 = v6 >> 7;
        unint64_t v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    *(_DWORD *)__s = a3;
    return std::string::append(*v5, __s, 4uLL);
  }
  return result;
}

const std::string::value_type *sub_24C726350(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  if (*(void *)(a1 + 8) - (void)__s + 16 >= a3)
  {
    uint64_t v6 = a3;
    std::string::append(this, __s, a3);
    return &__s[v6];
  }
  else
  {
    return sub_24C723968(a1, __s, a3, this);
  }
}

void sub_24C7263BC(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_24C726858((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_24C716A34((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_24C716A4C(v15, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_24C716B88((uint64_t)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_24C716B90((uint64_t)v15);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_24C726858((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  if (v6)
  {
    uint64_t v11 = (v9 + 15) & 0x1FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v11);
    }
    int v12 = (void *)sub_24C7153A0(v6, v11);
  }
  else
  {
    int v12 = operator new(v9 + 8);
  }
  *int v12 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v12 + 1;
  sub_24C726858((uint64_t)a1);
  if (*a1 >= 1)
  {
    BOOL v13 = (void *)sub_24C726858((uint64_t)a1);
    memcpy(v13, v5 + 1, *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_24C726574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C72658C(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_24C716A4C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_24C716C44(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_24C716A4C(v6, ", ");
    unint64_t v8 = sub_24C716C44(v7, *(_DWORD *)a1);
    sub_24C716B88((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_24C726634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C72664C(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C726858((uint64_t)a1) + a2;
}

void sub_24C72670C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C72672C(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C726858((uint64_t)a1) + a2;
}

void sub_24C7267EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C72680C(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_24C726858(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_24C726858(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_24C716A34((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_24C716A4C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_24C716B88((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_24C7268CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_24C7268E4(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_24C716A4C(v10, "CHECK failed: (&other) != (this): ");
    sub_24C716B88((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_24C716B90((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_24C7263BC(v3, *v3 + *a2);
    sub_24C72658C((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_24C72664C(v3, v5);
    if (*a2 <= 0)
    {
      sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_24C716A4C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_24C716B88((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_24C726858((uint64_t)a2);
    return (int *)memcpy(v6, v8, *a2);
  }
  return result;
}

void sub_24C7269F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C726A10(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_24C726EB0((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_24C716A34((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_24C716A4C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_24C716B88((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_24C716B90((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_24C726EB0((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 4 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0x7FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_24C7153A0(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_24C726EB0((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_24C726EB0((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_24C726BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C726BE4(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_24C716A4C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_24C716C44(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_24C716A4C(v6, ", ");
    unint64_t v8 = sub_24C716C44(v7, *(_DWORD *)a1);
    sub_24C716B88((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_24C726C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C726CA4(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C726EB0((uint64_t)a1) + 4 * a2;
}

void sub_24C726D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C726D84(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C726EB0((uint64_t)a1) + 4 * a2;
}

void sub_24C726E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C726E64(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_24C726EB0(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_24C726EB0(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_24C716A34((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_24C716A4C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_24C716B88((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_24C726F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_24C726F3C(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_24C716A4C(v10, "CHECK failed: (&other) != (this): ");
    sub_24C716B88((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_24C716B90((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_24C726A10(v3, *v3 + *a2);
    sub_24C726BE4((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_24C726CA4(v3, v5);
    if (*a2 <= 0)
    {
      sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_24C716A4C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_24C716B88((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_24C726EB0((uint64_t)a2);
    return (int *)memcpy(v6, v8, 4 * *a2);
  }
  return result;
}

void sub_24C72704C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C72706C(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_24C72750C((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_24C716A34((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_24C716A4C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_24C716B88((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_24C716B90((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_24C72750C((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 4 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0x7FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_24C7153A0(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_24C72750C((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_24C72750C((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_24C727228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C727240(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_24C716A4C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_24C716C44(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_24C716A4C(v6, ", ");
    unint64_t v8 = sub_24C716C44(v7, *(_DWORD *)a1);
    sub_24C716B88((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_24C7272E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C727300(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C72750C((uint64_t)a1) + 4 * a2;
}

void sub_24C7273C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7273E0(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C72750C((uint64_t)a1) + 4 * a2;
}

void sub_24C7274A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7274C0(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_24C72750C(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_24C72750C(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_24C716A34((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_24C716A4C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_24C716B88((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_24C727580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_24C727598(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_24C716A4C(v10, "CHECK failed: (&other) != (this): ");
    sub_24C716B88((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_24C716B90((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_24C72706C(v3, *v3 + *a2);
    sub_24C727240((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_24C727300(v3, v5);
    if (*a2 <= 0)
    {
      sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_24C716A4C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_24C716B88((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_24C72750C((uint64_t)a2);
    return (int *)memcpy(v6, v8, 4 * *a2);
  }
  return result;
}

void sub_24C7276A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C7276C8(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_24C727B68((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_24C716A34((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_24C716A4C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_24C716B88((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_24C716B90((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_24C727B68((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 8 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0xFFFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_24C7153A0(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_24C727B68((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_24C727B68((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_24C727884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C72789C(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_24C716A4C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_24C716C44(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_24C716A4C(v6, ", ");
    unint64_t v8 = sub_24C716C44(v7, *(_DWORD *)a1);
    sub_24C716B88((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_24C727944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C72795C(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C727B68((uint64_t)a1) + 8 * a2;
}

void sub_24C727A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C727A3C(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C727B68((uint64_t)a1) + 8 * a2;
}

void sub_24C727AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C727B1C(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_24C727B68(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_24C727B68(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_24C716A34((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_24C716A4C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_24C716B88((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_24C727BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_24C727BF4(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_24C716A4C(v10, "CHECK failed: (&other) != (this): ");
    sub_24C716B88((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_24C716B90((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_24C7276C8(v3, *v3 + *a2);
    sub_24C72789C((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_24C72795C(v3, v5);
    if (*a2 <= 0)
    {
      sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_24C716A4C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_24C716B88((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_24C727B68((uint64_t)a2);
    return (int *)memcpy(v6, v8, 8 * *a2);
  }
  return result;
}

void sub_24C727D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C727D24(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_24C7281C4((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_24C716A34((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_24C716A4C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_24C716B88((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_24C716B90((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_24C7281C4((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 8 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0xFFFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_24C7153A0(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_24C7281C4((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_24C7281C4((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_24C727EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C727EF8(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_24C716A4C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_24C716C44(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_24C716A4C(v6, ", ");
    unint64_t v8 = sub_24C716C44(v7, *(_DWORD *)a1);
    sub_24C716B88((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_24C727FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C727FB8(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C7281C4((uint64_t)a1) + 8 * a2;
}

void sub_24C728078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C728098(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C7281C4((uint64_t)a1) + 8 * a2;
}

void sub_24C728158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C728178(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_24C7281C4(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_24C7281C4(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_24C716A34((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_24C716A4C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_24C716B88((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_24C728238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_24C728250(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_24C716A4C(v10, "CHECK failed: (&other) != (this): ");
    sub_24C716B88((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_24C716B90((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_24C727D24(v3, *v3 + *a2);
    sub_24C727EF8((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_24C727FB8(v3, v5);
    if (*a2 <= 0)
    {
      sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_24C716A4C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_24C716B88((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_24C7281C4((uint64_t)a2);
    return (int *)memcpy(v6, v8, 8 * *a2);
  }
  return result;
}

void sub_24C728360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C728380(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_24C728820((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_24C716A34((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_24C716A4C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_24C716B88((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_24C716B90((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_24C728820((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 4 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0x7FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_24C7153A0(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_24C728820((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_24C728820((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_24C72853C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C728554(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_24C716A4C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_24C716C44(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_24C716A4C(v6, ", ");
    unint64_t v8 = sub_24C716C44(v7, *(_DWORD *)a1);
    sub_24C716B88((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_24C7285FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C728614(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C728820((uint64_t)a1) + 4 * a2;
}

void sub_24C7286D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7286F4(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C728820((uint64_t)a1) + 4 * a2;
}

void sub_24C7287B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C7287D4(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_24C728820(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_24C728820(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_24C716A34((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_24C716A4C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_24C716B88((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_24C728894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_24C7288AC(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_24C716A4C(v10, "CHECK failed: (&other) != (this): ");
    sub_24C716B88((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_24C716B90((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_24C728380(v3, *v3 + *a2);
    sub_24C728554((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_24C728614(v3, v5);
    if (*a2 <= 0)
    {
      sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_24C716A4C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_24C716B88((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_24C728820((uint64_t)a2);
    return (int *)memcpy(v6, v8, 4 * *a2);
  }
  return result;
}

void sub_24C7289BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24C7289DC(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_24C728E7C((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_24C716A34((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_24C716A4C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_24C716B88((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_24C716B90((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_24C728E7C((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 8 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0xFFFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_24C7153A0(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_24C728E7C((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_24C728E7C((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_24C728B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C728BB0(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_24C716A34((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_24C716A4C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_24C716C44(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_24C716A4C(v6, ", ");
    unint64_t v8 = sub_24C716C44(v7, *(_DWORD *)a1);
    sub_24C716B88((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_24C728C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C728C70(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C728E7C((uint64_t)a1) + 8 * a2;
}

void sub_24C728D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C728D50(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_24C716A4C(v8, "CHECK failed: (index) >= (0): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_24C716A34((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_24C716A4C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_24C716B88((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v8);
  }
  return sub_24C728E7C((uint64_t)a1) + 8 * a2;
}

void sub_24C728E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24C728E30(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_24C728E7C(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_24C728E7C(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_24C716A34((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_24C716A4C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_24C716B88((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_24C716B90((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_24C728EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_24C728F08(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_24C716A4C(v10, "CHECK failed: (&other) != (this): ");
    sub_24C716B88((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_24C716B90((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_24C7289DC(v3, *v3 + *a2);
    sub_24C728BB0((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_24C728C70(v3, v5);
    if (*a2 <= 0)
    {
      sub_24C716A34((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_24C716A4C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_24C716B88((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_24C716B90((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_24C728E7C((uint64_t)a2);
    return (int *)memcpy(v6, v8, 8 * *a2);
  }
  return result;
}

void sub_24C729018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_24C716B90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_24C729038(uint64_t *a1)
{
  sub_24C729074(a1);
  return sub_24C707BB4(a1);
}

void sub_24C729074(void *a1)
{
  uint64_t v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    int v3 = (uint64_t *)(v2 + 2);
    uint64_t v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        uint64_t v5 = *v3;
        if (*v3)
        {
          if (*(char *)(v5 + 23) < 0) {
            operator delete(*(void **)v5);
          }
          MEMORY[0x2532F8960](v5, 0x1012C40EC159624);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

uint64_t sub_24C729108(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 8);
  BOOL v3 = __OFSUB__(a2, v2);
  int v4 = a2 - v2;
  if (!((v4 < 0) ^ v3 | (v4 == 0))) {
    return sub_24C72911C((uint64_t *)result, v4);
  }
  return result;
}

uint64_t sub_24C72911C(uint64_t *a1, int a2)
{
  int v2 = *((_DWORD *)a1 + 2);
  int v3 = *((_DWORD *)a1 + 3);
  int v4 = v2 + a2;
  uint64_t v5 = (unsigned int *)a1[2];
  if (v3 < v2 + a2)
  {
    uint64_t v7 = *a1;
    int v8 = 2 * v3;
    if (2 * v3 <= v4) {
      int v8 = v4;
    }
    if (v8 <= 4) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = v8;
    }
    uint64_t v10 = 8 * v9;
    if (v7)
    {
      uint64_t v11 = (v10 + 15) & 0x7FFFFFFF8;
      if (*(unsigned char *)(v7 + 24)) {
        (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v7 + 32) + 32) + 40))(*(void *)(*(void *)(v7 + 32) + 32), MEMORY[0x263F8C238], v11);
      }
      uint64_t v12 = (unsigned int *)sub_24C7153A0(v7, v11);
    }
    else
    {
      uint64_t v12 = (unsigned int *)operator new(v10 + 8);
    }
    a1[2] = (uint64_t)v12;
    *((_DWORD *)a1 + 3) = v9;
    if (v5 && (uint64_t v13 = *v5, (int)v13 >= 1))
    {
      memcpy(v12 + 2, v5 + 2, 8 * v13);
      uint64_t v12 = (unsigned int *)a1[2];
      *uint64_t v12 = *v5;
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      *uint64_t v12 = 0;
      if (!v7)
      {
LABEL_17:
        operator delete(v5);
        uint64_t v12 = (unsigned int *)a1[2];
      }
    }
    int v2 = *((_DWORD *)a1 + 2);
    uint64_t v5 = v12;
  }
  return (uint64_t)&v5[2 * v2 + 2];
}

uint64_t sub_24C729248(uint64_t a1, _DWORD *a2, unint64_t a3)
{
  *(void *)a1 = &unk_26FEDC828;
  *(void *)(a1 + 16) = &unk_26FEDCC80;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = &unk_26FEDCC80;
  *(_DWORD *)(a1 + 40) = 0;
  uint64_t v6 = (uint64_t *)(a1 + 88);
  sub_24C714634((void *)(a1 + 88));
  sub_24C729340(a1, a2, a3, &v8);
  sub_24C71485C(v6, &v8);
  sub_24C71463C(&v8);
  return a1;
}

void sub_24C72931C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_24C71463C((uint64_t *)va);
  sub_24C71463C(v2);
  _Unwind_Resume(a1);
}

void *sub_24C729340@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v13 = a2;
  unint64_t v14 = a3;
  int v12 = 0;
  uint64_t result = sub_24C6E135C(a2, a3, &v12, a4);
  if (!*a4)
  {
    sub_24C71463C(a4);
    uint64_t result = sub_24C7129C0(&v13, 4uLL, a4);
    if (!*a4)
    {
      sub_24C71463C(a4);
      *(_DWORD *)(a1 + 8) = v12;
      int v11 = 0;
      uint64_t result = sub_24C6E135C(v13, v14, &v11, a4);
      if (!*a4)
      {
        sub_24C71463C(a4);
        uint64_t result = sub_24C7129C0(&v13, 4uLL, a4);
        if (!*a4)
        {
          sub_24C71463C(a4);
          *(_DWORD *)(a1 + 24) = v11;
          int v10 = 0;
          uint64_t result = sub_24C6E135C(v13, v14, &v10, a4);
          if (!*a4)
          {
            sub_24C71463C(a4);
            uint64_t result = sub_24C7129C0(&v13, 4uLL, a4);
            if (!*a4)
            {
              sub_24C71463C(a4);
              int v7 = v10;
              *(_DWORD *)(a1 + 48) = 0;
              *(_DWORD *)(a1 + 40) = v7;
              uint64_t result = sub_24C6E1160(v13, v14, (_DWORD *)(a1 + 48), a4);
              if (!*a4)
              {
                sub_24C71463C(a4);
                uint64_t result = sub_24C7129C0(&v13, 4uLL, a4);
                if (!*a4)
                {
                  sub_24C71463C(a4);
                  *(void *)(a1 + 56) = v13;
                  unint64_t v8 = sub_24C712934(*(int *)(a1 + 48), 4uLL);
                  uint64_t result = sub_24C7129C0(&v13, v8, a4);
                  if (!*a4)
                  {
                    sub_24C71463C(a4);
                    *(void *)(a1 + 64) = v13;
                    uint64_t result = sub_24C7129C0(&v13, 4 * *(int *)(a1 + 48), a4);
                    if (!*a4)
                    {
                      sub_24C71463C(a4);
                      *(void *)(a1 + 72) = v13;
                      uint64_t result = sub_24C7129C0(&v13, 4 * *(int *)(a1 + 48) + 20, a4);
                      if (!*a4)
                      {
                        unsigned int v9 = sub_24C71463C(a4);
                        *(void *)(a1 + 80) = v13;
                        return sub_24C714634(v9);
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
  return result;
}

void sub_24C729540()
{
}

uint64_t sub_24C729554(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) & 1;
}

uint64_t sub_24C729560(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 1) & 1;
}

uint64_t sub_24C72956C(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 2) & 1;
}

uint64_t sub_24C729578(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 3) & 1;
}

void *sub_24C729584(void *a1)
{
  *a1 = &unk_26FEDC828;
  sub_24C71463C(a1 + 11);
  return a1;
}

void sub_24C7295C8(void *a1)
{
  *a1 = &unk_26FEDC828;
  sub_24C71463C(a1 + 11);
  JUMPOUT(0x2532F8960);
}

uint64_t sub_24C72962C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

const char *sub_24C729634(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + **(unsigned int **)(a1 + 72));
  strlen(v1);
  return v1;
}

const char *sub_24C72966C(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 4));
  strlen(v1);
  return v1;
}

const char *sub_24C7296A4(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 8));
  strlen(v1);
  return v1;
}

const char *sub_24C7296DC(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 12));
  strlen(v1);
  return v1;
}

const char *sub_24C729714(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 16));
  strlen(v1);
  return v1;
}

uint64_t sub_24C72974C(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) & 1;
}

uint64_t sub_24C729758(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 1) & 1;
}

uint64_t sub_24C729764(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) >> 30;
}

const char *sub_24C729770(uint64_t a1, int a2)
{
  int v2 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 4 * (a2 + 5)));
  strlen(v2);
  return v2;
}

float sub_24C7297AC(uint64_t a1, int a2)
{
  return *(float *)(*(void *)(a1 + 64) + 4 * a2);
}

BOOL sub_24C7297B8(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 1;
}

BOOL sub_24C7297CC(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 2;
}

BOOL sub_24C7297E0(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 3;
}

BOOL sub_24C7297F4(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 4;
}

BOOL sub_24C729808(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 5;
}

BOOL sub_24C72981C(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 6;
}

uint64_t sub_24C729830(uint64_t a1)
{
  return a1 + 16;
}

uint64_t sub_24C729838(uint64_t a1)
{
  return a1 + 32;
}

void sub_24C729840(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_24C72989C(void **a1, void **a2, void **a3)
{
  uint64_t v5 = (void **)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      if (*((char *)v5 - 1) < 0) {
        operator delete(*(v5 - 3));
      }
      v5 -= 3;
    }
    while (v5 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void sub_24C729904(uint64_t *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *((char *)a1 + 23);
  int v3 = (uint64_t *)*a1;
  uint64_t status_string = espresso_get_status_string();
  if (v2 >= 0) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = v3;
  }
  int v6 = 136315394;
  int v7 = v5;
  __int16 v8 = 2080;
  uint64_t v9 = status_string;
  _os_log_error_impl(&dword_24C664000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Encountered an error during: %s\n -> Espresso Error: %s", (uint8_t *)&v6, 0x16u);
}

void sub_24C7299BC(void **a1)
{
  if (*((char *)a1 + 23) < 0) {
    sub_24C67498C(a1);
  }
}

void sub_24C7299CC(void **__p)
{
  do
  {
    int v2 = (void **)*__p;
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
    operator delete(__p);
    std::string __p = v2;
  }
  while (v2);
}

void sub_24C729A10(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_24C664000, log, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
}

void sub_24C729A58(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_24C664000, a2, OS_LOG_TYPE_ERROR, "CSU exception: %s", (uint8_t *)&v4, 0xCu);
}

void sub_24C729B04(void **a1, char *a2, void **a3)
{
  uint64_t v5 = (char *)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    __int16 v8 = v5;
    do
    {
      uint64_t v10 = (void *)*((void *)v8 - 3);
      v8 -= 24;
      uint64_t v9 = v10;
      if (v10)
      {
        *((void *)v5 - 2) = v9;
        operator delete(v9);
      }
      uint64_t v5 = v8;
    }
    while (v8 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void sub_24C729B7C(void **a1, uint64_t a2)
{
  int v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v5 = *(void ***)(a2 + 32);
    uint64_t v6 = *a1;
    if (v5 != v2)
    {
      do
      {
        if (*((char *)v5 - 1) < 0) {
          operator delete(*(v5 - 3));
        }
        v5 -= 3;
      }
      while (v5 != v2);
      uint64_t v6 = *a1;
    }
    *(void *)(a2 + 32) = v2;
    operator delete(v6);
  }
}

void sub_24C729C04(void **a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  __int16 v8 = (void **)*a1;
  if (*a1)
  {
    int v11 = *(void ***)(a2 + 32);
    int v12 = *a1;
    if (v11 != v8)
    {
      do
      {
        if (*((char *)v11 - 1) < 0) {
          operator delete(*(v11 - 3));
        }
        v11 -= 3;
      }
      while (v11 != v8);
      int v12 = *a1;
    }
    *(void *)(a2 + 32) = v8;
    operator delete(v12);
  }
  *(void *)a5 = a3;
  *(_DWORD *)(a5 + 8) = a4;
}

void sub_24C729C94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C729CCC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C729D04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C729D3C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_24C664000, log, OS_LOG_TYPE_ERROR, "Non FP32 or FP16 datatype encountered!", buf, 2u);
}

void sub_24C729D7C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_24C664000, log, OS_LOG_TYPE_ERROR, "Not a valid context length! setting e5Function default main_ctx_77", v1, 2u);
}

void sub_24C729DC0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_24C664000, log, OS_LOG_TYPE_ERROR, "Not supported for EspressoV1 Text Encoder SPI, using default", v1, 2u);
}

void sub_24C729E0C()
{
  sub_24C69F1B8();
  sub_24C6888C0(&dword_24C664000, v0, v1, "Bridge model failed to generate output", v2, v3, v4, v5, v6);
}

void sub_24C729E40()
{
  sub_24C69F1B8();
  sub_24C6888C0(&dword_24C664000, v0, v1, "Bridge model failed to set input features", v2, v3, v4, v5, v6);
}

void sub_24C729E74()
{
  sub_24C69F1B8();
  sub_24C6888C0(&dword_24C664000, v0, v1, "Found bridge output to be null", v2, v3, v4, v5, v6);
}

void sub_24C729EA8()
{
  sub_24C69F1B8();
  sub_24C6888C0(&dword_24C664000, v0, v1, "Decoder model failed to generate output", v2, v3, v4, v5, v6);
}

void sub_24C729EDC()
{
  sub_24C69F1B8();
  sub_24C6888C0(&dword_24C664000, v0, v1, "Decoder model failed to set input features", v2, v3, v4, v5, v6);
}

void sub_24C729F10()
{
  sub_24C69F1B8();
  sub_24C6888C0(&dword_24C664000, v0, v1, "Found encoder buffer to be null", v2, v3, v4, v5, v6);
}

void sub_24C729F44(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_24C664000, a2, OS_LOG_TYPE_DEBUG, "All beams contain finished sequences. Exiting beam search loop early after %d steps", (uint8_t *)v2, 8u);
}

void sub_24C729FBC(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_24C664000, log, OS_LOG_TYPE_DEBUG, "Problem with model execution. Exiting beam search.", buf, 2u);
}

void sub_24C729FFC()
{
  sub_24C69F1B8();
  _os_log_debug_impl(&dword_24C664000, v0, OS_LOG_TYPE_DEBUG, "Did not post process captions! No handler present.", v1, 2u);
}

void sub_24C72A03C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)sub_24C69F1C4(a1, a2);
  if (!v7)
  {
    __int16 v8 = v6;
    do
    {
      uint64_t v9 = *(std::__shared_weak_count **)(v4 - 8);
      if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
      uint64_t v10 = *(void **)(v4 - 40);
      if (v10)
      {
        *(void *)(v4 - 32) = v10;
        operator delete(v10);
      }
      v4 -= 48;
    }
    while (v4 != v2);
    uint64_t v5 = *v8;
  }
  void *v3 = v2;
  operator delete(v5);
}

void sub_24C72A0F0(void **a1, void **a2, void **a3)
{
  uint64_t v5 = (void **)*a1;
  uint8_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      if (*((char *)v5 - 1) < 0) {
        operator delete(*(v5 - 3));
      }
      v5 -= 3;
    }
    while (v5 != a2);
    uint8_t v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void sub_24C72A164(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24C664000, a2, OS_LOG_TYPE_ERROR, "End CSUVideoCaptioner init with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_24C72A1DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C72A254(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C72A2CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C72A344(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_24C664000, a2, OS_LOG_TYPE_DEBUG, "Loaded gender option set to %d", (uint8_t *)v3, 8u);
}

void sub_24C72A3C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C72A438(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C72A4B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C72A528(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C72A5A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C72A618(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24C72A684(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_24C664000, log, OS_LOG_TYPE_ERROR, "?? CPU not found for network execution ??", v1, 2u);
}

void sub_24C72A6C8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_24C664000, log, OS_LOG_TYPE_ERROR, "Greedy search not implemented!", v1, 2u);
}

void sub_24C72A70C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_24C664000, log, OS_LOG_TYPE_DEBUG, "Did not post process captions! No handler present.", v1, 2u);
}

void sub_24C72A750(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_24C664000, log, OS_LOG_TYPE_ERROR, "Please specify sequence shape!", v1, 2u);
}

uint64_t sub_24C72A794(uint64_t *a1, void **a2, void *a3)
{
  uint8_t v6 = (void **)a1[11];
  if (v6)
  {
    do
    {
      char v7 = (void **)*v6;
      if (*((char *)v6 + 39) < 0) {
        operator delete(v6[2]);
      }
      operator delete(v6);
      uint8_t v6 = v7;
    }
    while (v7);
  }
  __int16 v8 = *a2;
  *a2 = 0;
  if (v8) {
    operator delete(v8);
  }
  uint64_t v9 = *a1;
  if (!*a1) {
    return 1;
  }
  uint64_t v10 = a1[1];
  uint64_t v11 = *a1;
  if (v10 != v9)
  {
    do
    {
      if (*(char *)(v10 - 1) < 0) {
        operator delete(*(void **)(v10 - 24));
      }
      v10 -= 24;
    }
    while (v10 != v9);
    uint64_t v11 = *a1;
  }
  uint64_t result = 0;
  *a3 = v11;
  a1[1] = v9;
  return result;
}

void sub_24C72A854(uint64_t a1)
{
  sub_24C6CD6C8(a1);
  if (!v2)
  {
    sub_24C6CD6B8();
    (*(void (**)(void))(v3 + 16))();
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_24C72A8A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_24C664000, log, OS_LOG_TYPE_DEBUG, "Found gender token, reporting error multiple-gender-words", v1, 2u);
}

void sub_24C72A8E4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_24C664000, log, OS_LOG_TYPE_DEBUG, "Empty trigger tokens", buf, 2u);
}

void sub_24C72A924(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_24C664000, log, OS_LOG_TYPE_DEBUG, "Found trigger tokens, reporting error: Found-exclude-gender-trigger", v1, 2u);
}

uint64_t sub_24C72A968()
{
  return MEMORY[0x270EEE918]();
}

uint64_t sub_24C72A978()
{
  return MEMORY[0x270EEE928]();
}

uint64_t sub_24C72A988()
{
  return MEMORY[0x270EEE948]();
}

uint64_t sub_24C72A998()
{
  return MEMORY[0x270EEF828]();
}

uint64_t sub_24C72A9A8()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_24C72A9B8()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_24C72A9C8()
{
  return MEMORY[0x270F4B870]();
}

uint64_t sub_24C72A9D8()
{
  return MEMORY[0x270F4B880]();
}

uint64_t sub_24C72A9E8()
{
  return MEMORY[0x270F4BB48]();
}

uint64_t sub_24C72A9F8()
{
  return MEMORY[0x270F4BBF8]();
}

uint64_t sub_24C72AA08()
{
  return MEMORY[0x270F4BC08]();
}

uint64_t sub_24C72AA18()
{
  return MEMORY[0x270F4BCD0]();
}

uint64_t sub_24C72AA28()
{
  return MEMORY[0x270F4BD38]();
}

uint64_t sub_24C72AA38()
{
  return MEMORY[0x270F4BD40]();
}

uint64_t sub_24C72AA48()
{
  return MEMORY[0x270F4BE28]();
}

uint64_t sub_24C72AA58()
{
  return MEMORY[0x270F4BE38]();
}

uint64_t sub_24C72AA68()
{
  return MEMORY[0x270F4BE58]();
}

uint64_t sub_24C72AA78()
{
  return MEMORY[0x270F4BE78]();
}

uint64_t sub_24C72AA88()
{
  return MEMORY[0x270F4BF80]();
}

uint64_t sub_24C72AA98()
{
  return MEMORY[0x270F4C118]();
}

uint64_t sub_24C72AAA8()
{
  return MEMORY[0x270F4C128]();
}

uint64_t sub_24C72AAB8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24C72AAC8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24C72AAD8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24C72AAE8()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_24C72AAF8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24C72AB08()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24C72AB18()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24C72AB28()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24C72AB38()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24C72AB48()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24C72AB58()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24C72AB68()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24C72AB78()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24C72AB88()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24C72AB98()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24C72ABA8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24C72ABB8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24C72ABC8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24C72ABD8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24C72ABE8()
{
  return MEMORY[0x270F9FB48]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1D0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSArray *MLAllComputeDevices(void)
{
  return (NSArray *)MEMORY[0x270EE7970]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

void NSLog(NSString *format, ...)
{
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x270F98200](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98288](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98298](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F982A0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::logic_error::~logic_error(std::logic_error *this)
{
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x270F983C8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B8](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x270F983D0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983C0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

{
  MEMORY[0x270F983E8](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x270F98678]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x270F98690]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x270F98698]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986E8]();
}

{
  return MEMORY[0x270F986F0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
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
  return MEMORY[0x270F98788]();
}

{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x270F98838](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x270F98848](this);
}

uint64_t std::ifstream::open()
{
  return MEMORY[0x270F98868]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x270F98878]();
}

{
  return MEMORY[0x270F98880]();
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

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x270F98E00](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E18](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p, std::align_val_t a2)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void bzero(void *a1, size_t a2)
{
}

uint64_t c_network_get_input_names()
{
  return MEMORY[0x270F27AD0]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t espresso_buffer_get_rank()
{
  return MEMORY[0x270F27EC0]();
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x270F27EC8]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x270F27ED8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_get_output_blob_name()
{
  return MEMORY[0x270F27F60]();
}

uint64_t espresso_get_status_string()
{
  return MEMORY[0x270F27F68]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x270F27F98]();
}

uint64_t espresso_network_bind_input_vimagebuffer_argb8()
{
  return MEMORY[0x270F27FC0]();
}

uint64_t espresso_network_bind_input_vimagebuffer_bgra8()
{
  return MEMORY[0x270F27FC8]();
}

uint64_t espresso_network_bind_input_vimagebuffer_planar8()
{
  return MEMORY[0x270F27FD8]();
}

uint64_t espresso_network_bind_input_vimagebuffer_rgba8()
{
  return MEMORY[0x270F27FE8]();
}

uint64_t espresso_network_change_input_blob_shapes_seq_rank()
{
  return MEMORY[0x270F28000]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x270F28010]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x270F28030]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x270F28038]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x270F28080]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x270F280A8]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x270F280B8]();
}

uint64_t espresso_plan_share_intermediate_buffer()
{
  return MEMORY[0x270F280C0]();
}

uint64_t espresso_set_image_preprocessing_params()
{
  return MEMORY[0x270F280D8]();
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

long double expm1(long double __x)
{
  MEMORY[0x270ED9878](__x);
  return result;
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x270EDA028](*(void *)&__e, __x);
  return result;
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x270EDA090]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float log1pf(float a1)
{
  MEMORY[0x270EDA0C8](a1);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x270EDA848](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

void srand(unsigned int a1)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x270EDB6A8](a1, a2);
  return result;
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6E8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vthrsc(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}