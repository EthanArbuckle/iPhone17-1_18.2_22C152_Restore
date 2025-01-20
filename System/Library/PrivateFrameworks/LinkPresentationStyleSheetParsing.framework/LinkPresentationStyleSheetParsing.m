void *sub_254ED60FC()
{
  return &unk_254EFD550;
}

uint64_t sub_254ED6108()
{
  return 10;
}

void *sub_254ED6110()
{
  return &unk_254EFD554;
}

uint64_t sub_254ED611C()
{
  return 13;
}

void *sub_254ED6124()
{
  return &unk_254EFD558;
}

uint64_t sub_254ED6130()
{
  return 12;
}

void *sub_254ED6138()
{
  return &unk_254EFD55C;
}

uint64_t sub_254ED6144()
{
  return 0;
}

void *sub_254ED614C()
{
  return &unk_254EFD560;
}

uint64_t sub_254ED6158()
{
  return 65533;
}

void *sub_254ED6160()
{
  return &unk_254EFD564;
}

uint64_t sub_254ED616C()
{
  return 8;
}

void *sub_254ED6174()
{
  return &unk_254EFD568;
}

uint64_t sub_254ED6180()
{
  return 11;
}

void *sub_254ED6188()
{
  return &unk_254EFD56C;
}

uint64_t sub_254ED6194()
{
  return 14;
}

void *sub_254ED619C()
{
  return &unk_254EFD570;
}

uint64_t sub_254ED61A8()
{
  return 31;
}

void *sub_254ED61B0()
{
  return &unk_254EFD574;
}

uint64_t sub_254ED61BC()
{
  return 127;
}

void *sub_254ED61C4()
{
  return &unk_254EFD578;
}

uint64_t sub_254ED61D0()
{
  return 1114111;
}

uint64_t sub_254ED61D8(int a1)
{
  uint64_t v2 = sub_254EFD1F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_254EFD230();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v20 = a1;
  sub_254EFD240();
  sub_254EFD220();
  v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v12, v9);
  uint64_t v13 = *MEMORY[0x263F8EB00];
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v18(v6, v13, v2);
  LOBYTE(a1) = sub_254EFD1E0();
  v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v6, v2);
  v14(v8, v2);
  if (a1)
  {
    char v15 = 1;
  }
  else
  {
    sub_254EFD240();
    sub_254EFD220();
    v19(v12, v9);
    v18(v6, *MEMORY[0x263F8EAE8], v2);
    char v15 = sub_254EFD1E0();
    v14(v6, v2);
    v14(v8, v2);
  }
  return v15 & 1;
}

uint64_t sub_254ED6464()
{
  uint64_t v0 = sub_254EFD1F0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  v6 = (char *)&v14 - v5;
  uint64_t v7 = sub_254EFD230();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254EFD240();
  sub_254EFD220();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F8EAA0], v0);
  char v11 = sub_254EFD1E0();
  v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v12(v4, v0);
  v12(v6, v0);
  return v11 & 1;
}

uint64_t sub_254ED6648(unsigned int a1)
{
  return sub_254ED61D8(a1) & 1 | (a1 > 0x7F) | (a1 == 95);
}

uint64_t sub_254ED6688(unsigned int a1)
{
  uint64_t v2 = sub_254EFD1F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = sub_254EFD230();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = sub_254ED61D8(a1);
  char v14 = 1;
  if ((v13 & 1) == 0 && a1 <= 0x7F && a1 != 95)
  {
    sub_254EFD240();
    sub_254EFD220();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F8EAA0], v2);
    char v15 = sub_254EFD1E0();
    v16 = *(void (**)(char *, uint64_t))(v3 + 8);
    v16(v6, v2);
    v16(v8, v2);
    char v14 = v15 | (a1 == 45);
  }
  return v14 & 1;
}

BOOL sub_254ED6894(int a1)
{
  return a1 == 10;
}

uint64_t sub_254ED68A0(unsigned int a1)
{
  BOOL v2 = a1 == 127 || a1 - 14 < 0x12;
  if (a1 == 11) {
    BOOL v2 = 1;
  }
  return a1 < 9 || v2;
}

uint64_t sub_254ED68C8()
{
  uint64_t v1 = (uint64_t (**)(void))(*(void *)v0 + 272);
  BOOL v2 = *v1;
  uint64_t result = (*v1)();
  if ((result & 0x100000000) == 0)
  {
    int v4 = result;
    do
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)v0 + 240))();
      if ((result & 1) != 0 || v4 == 41) {
        break;
      }
      uint64_t v6 = sub_254EDC408();
      uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 256))(v6);
      if (*(void *)(v7 + 16))
      {
        int v8 = *(_DWORD *)(v7 + 32);
        swift_bridgeObjectRelease();
        uint64_t v5 = sub_254EDC0B4(v4, v8);
        if (v5) {
          uint64_t v5 = sub_254EDD98C();
        }
      }
      else
      {
        uint64_t v5 = swift_bridgeObjectRelease();
      }
      uint64_t result = ((uint64_t (*)(uint64_t))v2)(v5);
      int v4 = result;
    }
    while ((result & 0x100000000) == 0);
  }
  return result;
}

uint64_t sub_254ED69CC@<X0>(uint64_t a1@<X8>)
{
  BOOL v2 = v1;
  uint64_t v4 = sub_254EDD7F8();
  uint64_t v5 = (uint64_t (**)(uint64_t))(*v1 + 272);
  uint64_t v6 = *v5;
  uint64_t v7 = (*v5)(v4);
  if ((v7 & 0x100000000) == 0)
  {
    LODWORD(v8) = v7;
    while (1)
    {
      uint64_t v10 = *(uint64_t (**)(void))(*v2 + 240);
      if ((v10() & 1) != 0 || v8 == 41) {
        goto LABEL_14;
      }
      swift_getKeyPath();
      char v11 = sub_254EDC080();
      swift_release();
      if (v11) {
        break;
      }
      if (v8 <= 0x28 && ((1 << v8) & 0x18400000000) != 0) {
        goto LABEL_19;
      }
      swift_getKeyPath();
      char v12 = sub_254EDC080();
      swift_release();
      if (v12) {
        goto LABEL_19;
      }
      if (v8 == 92)
      {
        uint64_t v13 = sub_254EDC408();
        uint64_t v14 = (*(uint64_t (**)(uint64_t))(*v2 + 256))(v13);
        if (!*(void *)(v14 + 16))
        {
          swift_bridgeObjectRelease();
LABEL_19:
          swift_bridgeObjectRelease();
          uint64_t result = sub_254ED68C8();
          int64x2_t v18 = (int64x2_t)xmmword_254EFD580;
          uint64_t v17 = 1;
          goto LABEL_20;
        }
        int v15 = *(_DWORD *)(v14 + 32);
        swift_bridgeObjectRelease();
        if (!sub_254EDC0B4(92, v15)) {
          goto LABEL_19;
        }
        sub_254EDD98C();
      }
      sub_254EFD250();
      sub_254EFCCA0();
      uint64_t v9 = swift_bridgeObjectRelease();
      uint64_t v8 = v6(v9);
      if ((v8 & 0x100000000) != 0) {
        goto LABEL_14;
      }
    }
    sub_254EDD7F8();
    uint64_t v19 = sub_254EDC408();
    uint64_t v20 = (*(uint64_t (**)(uint64_t))(*v2 + 256))(v19);
    if (*(void *)(v20 + 16))
    {
      int v21 = *(_DWORD *)(v20 + 32);
      uint64_t v22 = swift_bridgeObjectRelease();
      if (v21 == 41)
      {
LABEL_23:
        uint64_t result = v6(v22);
        uint64_t v17 = 0;
        int64x2_t v18 = vdupq_n_s64(0x5000000000000000uLL);
        v18.i64[0] = 0xE000000000000000;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v22 = swift_bridgeObjectRelease();
    }
    uint64_t v22 = ((uint64_t (*)(uint64_t))v10)(v22);
    if ((v22 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_23;
  }
LABEL_14:
  uint64_t result = (*(uint64_t (**)(void))(*v2 + 240))();
  uint64_t v17 = 0;
  int64x2_t v18 = vdupq_n_s64(0x5000000000000000uLL);
  v18.i64[0] = 0xE000000000000000;
LABEL_20:
  *(void *)a1 = v17;
  *(int64x2_t *)(a1 + 8) = v18;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = 0;
  return result;
}

uint64_t sub_254ED6CC8()
{
  return sub_254EFD240();
}

uint64_t sub_254ED6CD0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_254EFD210();
  *a1 = result & 1;
  return result;
}

uint64_t sub_254ED6D00@<X0>(unsigned int *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_254ED68A0(*a1);
  *a2 = result & 1;
  return result;
}

uint64_t sub_254ED6D30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_254EDE1DC();
  uint64_t v5 = v4;
  uint64_t v6 = sub_254EDC408();
  uint64_t v7 = (uint64_t (**)(uint64_t))(*(void *)v1 + 256);
  uint64_t v8 = *v7;
  uint64_t v9 = (*v7)(v6);
  if (sub_254EFCBD0() == 7107189 && v10 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      if (*(void *)(v9 + 16))
      {
LABEL_12:
        int v17 = *(_DWORD *)(v9 + 32);
        uint64_t result = swift_bridgeObjectRelease();
        if (v17 == 40)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 272))(result);
          goto LABEL_14;
        }
LABEL_16:
        *(void *)a1 = v3;
        *(void *)(a1 + 8) = v5;
        *(_OWORD *)(a1 + 16) = 0u;
        *(_OWORD *)(a1 + 32) = 0u;
        return result;
      }
LABEL_15:
      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_16;
    }
  }
  if (!*(void *)(v9 + 16)) {
    goto LABEL_15;
  }
  if (*(_DWORD *)(v9 + 32) != 40) {
    goto LABEL_12;
  }
  uint64_t v12 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v1 + 272))(v12);
  sub_254EDD7F8();
  uint64_t v13 = sub_254EDC408();
  uint64_t v14 = v8(v13);
  if (!*(void *)(v14 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  int v15 = *(_DWORD *)(v14 + 32);
  uint64_t result = swift_bridgeObjectRelease();
  if (v15 == 34 || v15 == 39)
  {
LABEL_14:
    *(void *)a1 = v3;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = 0x1000000000000000;
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
    return result;
  }
LABEL_18:
  swift_bridgeObjectRelease();

  return sub_254ED69CC(a1);
}

uint64_t sub_254ED6F4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_254EDE360();
  if (!v2)
  {
    uint64_t v7 = result;
    uint64_t v8 = v5;
    uint64_t v9 = v6;
    uint64_t v10 = sub_254EDC9EC();
    uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 264))(v10);
    uint64_t v12 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 216);
    uint64_t v13 = v12(v11);
    BOOL v14 = sub_254EDC1B0(v13);
    uint64_t v15 = swift_bridgeObjectRelease();
    if (v14)
    {
      uint64_t result = sub_254EDE1DC();
      *a1 = v7;
      a1[1] = v8;
      a1[2] = v20 | 0x9000000000000000;
      a1[3] = v9;
      a1[4] = result;
      a1[5] = v16;
      return result;
    }
    uint64_t v17 = v12(v15);
    if (*(void *)(v17 + 16))
    {
      int v18 = *(_DWORD *)(v17 + 32);
      uint64_t result = swift_bridgeObjectRelease();
      if (v18 == 37)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 272))(result);
        unint64_t v19 = v20 | 0x8000000000000000;
LABEL_9:
        *a1 = v7;
        a1[1] = v8;
        a1[2] = v19;
        a1[3] = v9;
        a1[4] = 0;
        a1[5] = 0;
        return result;
      }
    }
    else
    {
      uint64_t result = swift_bridgeObjectRelease();
    }
    unint64_t v19 = v20 | 0x7000000000000000;
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_254ED70C0@<X0>(int a1@<W0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)v2 + 240);
  uint64_t v7 = *(uint64_t (**)(void))(*(void *)v2 + 272);
  char v8 = v6();
  uint64_t result = v7();
  if ((result & 0x100000000) != 0 || (v8 & 1) != 0 || result == a1)
  {
LABEL_22:
    *a2 = 0;
    a2[1] = 0xE000000000000000;
    unint64_t v20 = 0x4000000000000000;
    goto LABEL_23;
  }
  int v10 = result;
  while (!sub_254ED6894(v10))
  {
    if (v10 != 92) {
      goto LABEL_11;
    }
    uint64_t v11 = sub_254EDC408();
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 256))(v11);
    if (v6()) {
      goto LABEL_12;
    }
    if (*(void *)(v12 + 16))
    {
      int v13 = *(_DWORD *)(v12 + 32);
      swift_bridgeObjectRelease();
      uint64_t v14 = sub_254ED6894(v13);
      if (v14)
      {
        uint64_t v15 = v7();
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v14 = swift_bridgeObjectRelease();
    }
    uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 216))(v14);
    if (!*(void *)(v17 + 16)) {
      goto LABEL_12;
    }
    int v18 = *(_DWORD *)(v17 + 32);
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_254EDC0B4(92, v18);
    if (v15)
    {
      sub_254EDD98C();
LABEL_11:
      sub_254EFD250();
      sub_254EFCCA0();
LABEL_12:
      uint64_t v15 = swift_bridgeObjectRelease();
    }
LABEL_13:
    char v16 = ((uint64_t (*)(uint64_t))v6)(v15);
    uint64_t result = v7();
    if ((result & 0x100000000) == 0 && (v16 & 1) == 0)
    {
      int v10 = result;
      if (result != a1) {
        continue;
      }
    }
    goto LABEL_22;
  }
  uint64_t v19 = swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 280))(v19);
  *a2 = 0;
  a2[1] = 0;
  unint64_t v20 = 0xA000000000000000;
LABEL_23:
  a2[2] = v20;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_254ED7310@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v1 + 240))();
  if (result)
  {
    *(_OWORD *)a1 = xmmword_254EFD590;
    unint64_t v4 = 0xA000000000000000;
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)v1 + 272))();
    if ((result & 0x100000000) == 0)
    {
      int v5 = result;
      uint64_t v6 = sub_254EDC9EC();
      (*(void (**)(uint64_t))(*(void *)v1 + 264))(v6);
      sub_254ED8138(v5, (uint64_t)v7);
      sub_254ED85D0(v1, a1);
      return sub_254ED743C((uint64_t)v7);
    }
    *a1 = 0;
    a1[1] = 0;
    unint64_t v4 = 0x1FFFFFFFELL;
  }
  a1[2] = v4;
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  return result;
}

uint64_t sub_254ED743C(uint64_t a1)
{
  return a1;
}

uint64_t dispatch thunk of Tokenizable.tokens.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_254ED74C0()
{
  return 0;
}

uint64_t sub_254ED74E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(v1 + 8);
  LOBYTE(a1) = *(unsigned char *)(v1 + 16);
  if (*(unsigned char *)(v1 + 17) != 1) {
    goto LABEL_6;
  }
  *(unsigned char *)(v1 + 17) = 0;
  if (a1) {
    goto LABEL_17;
  }
  a1 = *(uint64_t **)v1;
  if (v3 < *(void *)(*(void *)v1 + 16))
  {
    uint64_t v4 = v3;
    if ((v3 & 0x8000000000000000) == 0)
    {
LABEL_12:
      int v10 = &a1[6 * v4];
      uint64_t v6 = v10[4];
      uint64_t v9 = v10[5];
      unint64_t v5 = v10[6];
      uint64_t v4 = v10[7];
      uint64_t v7 = v10[8];
      uint64_t v8 = v10[9];
      sub_254ED8078(v6, v9, v5);
      goto LABEL_14;
    }
    __break(1u);
LABEL_6:
    if (a1)
    {
      uint64_t v4 = 0;
      *(void *)(v1 + 8) = 0;
      *(unsigned char *)(v1 + 16) = 0;
      a1 = *(uint64_t **)v1;
      if (*(uint64_t *)(*(void *)v1 + 16) <= 0)
      {
        unint64_t v5 = 0xA000000000000000;
        uint64_t v6 = 21;
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    a1 = *(uint64_t **)v1;
    if (v3 < *(void *)(*(void *)v1 + 16))
    {
      uint64_t v4 = v3 + 1;
      *(void *)(v1 + 8) = v3 + 1;
      *(unsigned char *)(v1 + 16) = 0;
      if (v3 + 1 < a1[2])
      {
        if (v3 > -2) {
          goto LABEL_12;
        }
        while (1)
        {
LABEL_17:
          sub_254EFCFE0();
          __break(1u);
        }
      }
    }
  }
  uint64_t v4 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  unint64_t v5 = 0xA000000000000000;
  uint64_t v6 = 21;
LABEL_14:
  v17[0] = v6;
  v17[1] = v9;
  v17[2] = v5;
  v17[3] = v4;
  v17[4] = v7;
  v17[5] = v8;
  long long v12 = xmmword_254EFD590;
  unint64_t v13 = 0xA000000000000000;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t result = static Token.== infix(_:_:)(v17, &v12);
  if (result)
  {
    uint64_t result = sub_254ED76FC(v6, v9, v5);
    uint64_t v6 = 0;
    uint64_t v9 = 0;
    uint64_t v4 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    unint64_t v5 = 0x1FFFFFFFELL;
  }
  *uint64_t v2 = v6;
  v2[1] = v9;
  v2[2] = v5;
  v2[3] = v4;
  v2[4] = v7;
  v2[5] = v8;
  return result;
}

uint64_t sub_254ED76FC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3 >> 60;
  if ((a3 >> 60) <= 9)
  {
    if (((1 << v3) & 0x1BF) == 0)
    {
      if (v3 != 9) {
        return result;
      }
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_254ED7778()
{
  *(unsigned char *)(v0 + 17) = 1;
}

uint64_t sub_254ED7784()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_254ED77B0()
{
  unint64_t result = qword_269E70E90;
  if (!qword_269E70E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70E90);
  }
  return result;
}

void sub_254ED7804(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
}

uint64_t sub_254ED7818()
{
  return 0;
}

uint64_t sub_254ED7820()
{
  return 2;
}

uint64_t sub_254ED7828()
{
  uint64_t v1 = sub_254ED7A3C(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_254ED7860(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_254ED7DB4(a1, a2, a3, *v3);
}

uint64_t sub_254ED7868()
{
  return sub_254EFCD70();
}

ValueMetadata *type metadata accessor for TokenSequence()
{
  return &type metadata for TokenSequence;
}

uint64_t destroy for TokenSequence.Iterator()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s33LinkPresentationStyleSheetParsing13TokenSequenceV8IteratorVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TokenSequence.Iterator(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TokenSequence.Iterator(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenSequence.Iterator(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 18)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TokenSequence.Iterator(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenSequence.Iterator()
{
  return &type metadata for TokenSequence.Iterator;
}

uint64_t sub_254ED7A3C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v42 = a1 + 32;
  swift_bridgeObjectRetain();
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  v43 = (void *)MEMORY[0x263F8EE78];
  unint64_t v5 = (uint64_t *)(MEMORY[0x263F8EE78] + 32);
  char v6 = 1;
  uint64_t v41 = v1;
  while (1)
  {
    uint64_t v7 = v2;
    if (v2 >= v1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      unint64_t v12 = 0xA000000000000000;
      uint64_t v13 = 21;
    }
    else
    {
      if (v6)
      {
        if (v2) {
          goto LABEL_37;
        }
      }
      else if (v4 >= v2 || v2 < 0)
      {
        goto LABEL_37;
      }
      uint64_t v14 = (uint64_t *)(v42 + 48 * v2);
      uint64_t v15 = *v14;
      uint64_t v16 = v14[1];
      unint64_t v18 = v14[2];
      uint64_t v17 = v14[3];
      uint64_t v19 = v14[4];
      uint64_t v20 = v14[5];
      sub_254ED8078(*v14, v16, v18);
      uint64_t v11 = v20;
      uint64_t v10 = v19;
      uint64_t v9 = v17;
      unint64_t v12 = v18;
      uint64_t v8 = v16;
      uint64_t v13 = v15;
    }
    uint64_t v21 = v13;
    v49[0] = v13;
    v49[1] = v8;
    uint64_t v22 = v8;
    unint64_t v23 = v12;
    v49[2] = v12;
    v49[3] = v9;
    uint64_t v24 = v9;
    uint64_t v25 = v10;
    v49[4] = v10;
    v49[5] = v11;
    uint64_t v26 = v11;
    long long v44 = xmmword_254EFD590;
    unint64_t v45 = 0xA000000000000000;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v46 = 0;
    if (static Token.== infix(_:_:)(v49, &v44)) {
      break;
    }
    if (!v3)
    {
      unint64_t v27 = v43[3];
      if ((uint64_t)((v27 >> 1) + 0x4000000000000000) < 0) {
        goto LABEL_35;
      }
      int64_t v28 = v27 & 0xFFFFFFFFFFFFFFFELL;
      if (v28 <= 1) {
        uint64_t v29 = 1;
      }
      else {
        uint64_t v29 = v28;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E70E98);
      v30 = (void *)swift_allocObject();
      uint64_t v31 = (uint64_t)(_swift_stdlib_malloc_size(v30) - 32) / 48;
      v30[2] = v29;
      v30[3] = 2 * v31;
      unint64_t v32 = (unint64_t)(v30 + 4);
      uint64_t v33 = v43[3] >> 1;
      if (v43[2])
      {
        if (v30 != v43 || v32 >= (unint64_t)&v43[6 * v33 + 4])
        {
          uint64_t v40 = v31;
          memmove(v30 + 4, v43 + 4, 48 * v33);
          unint64_t v32 = (unint64_t)(v30 + 4);
          uint64_t v31 = v40;
        }
        v43[2] = 0;
      }
      unint64_t v5 = (uint64_t *)(v32 + 48 * v33);
      uint64_t v3 = (v31 & 0x7FFFFFFFFFFFFFFFLL) - v33;
      swift_release();
      v43 = v30;
      uint64_t v1 = v41;
    }
    BOOL v35 = __OFSUB__(v3--, 1);
    if (v35)
    {
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    char v6 = 0;
    *unint64_t v5 = v21;
    v5[1] = v22;
    v5[2] = v23;
    v5[3] = v24;
    v5[4] = v25;
    v5[5] = v26;
    v5 += 6;
    if (v7 >= v1) {
      uint64_t v2 = v7;
    }
    else {
      uint64_t v2 = v7 + 1;
    }
    uint64_t v4 = v7;
  }
  sub_254ED76FC(v21, v22, v23);
  swift_bridgeObjectRelease();
  uint64_t result = (uint64_t)v43;
  unint64_t v37 = v43[3];
  if (v37 < 2) {
    return result;
  }
  unint64_t v38 = v37 >> 1;
  BOOL v35 = __OFSUB__(v38, v3);
  uint64_t v39 = v38 - v3;
  if (!v35)
  {
    v43[2] = v39;
    return result;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  uint64_t result = sub_254EFCFE0();
  __break(1u);
  return result;
}

uint64_t sub_254ED7DB4(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4)
{
  if (!a2)
  {
    int64_t v13 = 0;
    a3 = 0;
    BOOL v5 = 1;
LABEL_28:
    *(void *)a1 = a4;
    *(void *)(a1 + 8) = v13;
    *(unsigned char *)(a1 + 16) = v5;
    *(unsigned char *)(a1 + 17) = 0;
    return a3;
  }
  BOOL v5 = a3 == 0;
  if (!a3)
  {
    int64_t v13 = 0;
    goto LABEL_28;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v25 = a3;
    uint64_t v26 = a4;
    uint64_t v24 = a4[2];
    if (v24)
    {
      uint64_t v8 = a4[4];
      uint64_t v7 = a4[5];
      unint64_t v10 = a4[6];
      uint64_t v9 = a4[7];
      uint64_t v11 = a4[8];
      uint64_t v12 = a4[9];
      sub_254ED8078(v8, v7, v10);
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v9 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v8 = 21;
      unint64_t v10 = 0xA000000000000000;
    }
    uint64_t v32 = v8;
    uint64_t v33 = v7;
    unint64_t v34 = v10;
    uint64_t v35 = v9;
    uint64_t v36 = v11;
    uint64_t v37 = v12;
    long long v27 = xmmword_254EFD590;
    unint64_t v28 = 0xA000000000000000;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v29 = 0;
    if (static Token.== infix(_:_:)(&v32, &v27))
    {
      int64_t v13 = 0;
      uint64_t v14 = 0;
LABEL_26:
      sub_254ED76FC(v8, v7, v10);
      BOOL v5 = 0;
      a3 = v14;
    }
    else
    {
      *a2 = v8;
      a2[1] = v7;
      a2[2] = v10;
      a2[3] = v9;
      a2[4] = v11;
      a2[5] = v12;
      a3 = v25;
      if (v25 != 1)
      {
        unint64_t v15 = 0;
        a4 = v26;
        uint64_t v23 = a1;
        uint64_t v16 = a2 + 11;
        uint64_t v14 = 1;
        while (1)
        {
          unint64_t v17 = a4[2];
          if (v15 >= v17) {
            int64_t v13 = v15;
          }
          else {
            int64_t v13 = v15 + 1;
          }
          if (v13 >= v24)
          {
            uint64_t v7 = 0;
            uint64_t v19 = 0;
            uint64_t v20 = 0;
            uint64_t v21 = 0;
            unint64_t v10 = 0xA000000000000000;
            uint64_t v8 = 21;
          }
          else
          {
            if ((uint64_t)v15 >= v13) {
              goto LABEL_31;
            }
            if (v13 >= v17)
            {
              __break(1u);
              goto LABEL_30;
            }
            unint64_t v18 = &v26[6 * v13 + 4];
            uint64_t v8 = *v18;
            uint64_t v7 = v18[1];
            unint64_t v10 = v18[2];
            uint64_t v19 = v18[3];
            uint64_t v20 = v18[4];
            uint64_t v21 = v18[5];
            sub_254ED8078(*v18, v7, v10);
          }
          uint64_t v32 = v8;
          uint64_t v33 = v7;
          unint64_t v34 = v10;
          uint64_t v35 = v19;
          uint64_t v36 = v20;
          uint64_t v37 = v21;
          long long v27 = xmmword_254EFD590;
          unint64_t v28 = 0xA000000000000000;
          uint64_t v30 = 0;
          uint64_t v31 = 0;
          uint64_t v29 = 0;
          if (static Token.== infix(_:_:)(&v32, &v27))
          {
            a1 = v23;
            goto LABEL_26;
          }
          ++v14;
          *(v16 - 5) = v8;
          *(v16 - 4) = v7;
          *(v16 - 3) = v10;
          *(v16 - 2) = v19;
          *(v16 - 1) = v20;
          *uint64_t v16 = v21;
          v16 += 6;
          unint64_t v15 = v13;
          a3 = v25;
          a4 = v26;
          if (v25 == v14)
          {
            BOOL v5 = 0;
            a1 = v23;
            goto LABEL_28;
          }
        }
      }
      int64_t v13 = 0;
      BOOL v5 = 0;
    }
    a4 = v26;
    goto LABEL_28;
  }
LABEL_30:
  __break(1u);
LABEL_31:
  uint64_t result = sub_254EFCFE0();
  __break(1u);
  return result;
}

uint64_t sub_254ED8078(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3 >> 60;
  if ((a3 >> 60) <= 9)
  {
    if (((1 << v3) & 0x1BF) == 0)
    {
      if (v3 != 9) {
        return result;
      }
      swift_bridgeObjectRetain();
    }
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

double sub_254ED8138@<D0>(int a1@<W0>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  char v4 = sub_254EDC080();
  swift_release();
  if (v4)
  {
    char v6 = &type metadata for TokenProducers.Whitespace;
    uint64_t v7 = &off_2703FCCA8;
LABEL_3:
    *(void *)(a2 + 24) = v6;
    *(void *)(a2 + 32) = v7;
  }
  else
  {
    switch(a1)
    {
      case '""':
        char v6 = &type metadata for TokenProducers.QuotationMark;
        uint64_t v7 = &off_2703FCDC8;
        goto LABEL_3;
      case '#':
        char v6 = &type metadata for TokenProducers.NumberSign;
        uint64_t v7 = &off_2703FCC78;
        goto LABEL_3;
      case '$':
        char v6 = &type metadata for TokenProducers.DollarSign;
        uint64_t v7 = &off_2703FCC48;
        goto LABEL_3;
      case '\'':
        char v6 = &type metadata for TokenProducers.Apostrophe;
        uint64_t v7 = &off_2703FCC18;
        goto LABEL_3;
      case '(':
        char v6 = &type metadata for TokenProducers.LeftParenthesis;
        uint64_t v7 = &off_2703FCE28;
        goto LABEL_3;
      case ')':
        char v6 = &type metadata for TokenProducers.RightParenthesis;
        uint64_t v7 = &off_2703FCEB8;
        goto LABEL_3;
      case '*':
        char v6 = &type metadata for TokenProducers.Asterisk;
        uint64_t v7 = &off_2703FD098;
        goto LABEL_3;
      case '+':
        char v6 = &type metadata for TokenProducers.PlusSign;
        uint64_t v7 = &off_2703FD0F8;
        goto LABEL_3;
      case ',':
        char v6 = &type metadata for TokenProducers.Comma;
        uint64_t v7 = &off_2703FCFD8;
        goto LABEL_3;
      case '-':
        char v6 = &type metadata for TokenProducers.HyphenMinus;
        uint64_t v7 = &off_2703FCCD8;
        goto LABEL_3;
      case '.':
        char v6 = &type metadata for TokenProducers.FullStop;
        uint64_t v7 = &off_2703FD0C8;
        goto LABEL_3;
      case '/':
        char v6 = &type metadata for TokenProducers.Solidus;
        uint64_t v7 = &off_2703FD068;
        goto LABEL_3;
      case ':':
        char v6 = &type metadata for TokenProducers.Colon;
        uint64_t v7 = &off_2703FCFA8;
        goto LABEL_3;
      case ';':
        char v6 = &type metadata for TokenProducers.Semicolon;
        uint64_t v7 = &off_2703FD128;
        goto LABEL_3;
      case '<':
        char v6 = &type metadata for TokenProducers.LessThanSign;
        uint64_t v7 = &off_2703FCD68;
        goto LABEL_3;
      case '@':
        char v6 = &type metadata for TokenProducers.CommercialAt;
        uint64_t v7 = &off_2703FCD08;
        goto LABEL_3;
      case 'U':
      case 'u':
        char v6 = &type metadata for TokenProducers.LatinLetterU;
        uint64_t v7 = &off_2703FCD38;
        goto LABEL_3;
      case '[':
        char v6 = &type metadata for TokenProducers.LeftSquareBracket;
        uint64_t v7 = &off_2703FCEE8;
        goto LABEL_3;
      case '\\':
        char v6 = &type metadata for TokenProducers.ReverseSolidus;
        uint64_t v7 = &off_2703FCDF8;
        goto LABEL_3;
      case ']':
        char v6 = &type metadata for TokenProducers.RightSquareBracket;
        uint64_t v7 = &off_2703FCF48;
        goto LABEL_3;
      case '^':
        char v6 = &type metadata for TokenProducers.CircumflexAccent;
        uint64_t v7 = &off_2703FCE58;
        goto LABEL_3;
      case '{':
        char v6 = &type metadata for TokenProducers.LeftCurlyBracket;
        uint64_t v7 = &off_2703FCE88;
        goto LABEL_3;
      case '|':
        char v6 = &type metadata for TokenProducers.VerticalLine;
        uint64_t v7 = &off_2703FCD98;
        goto LABEL_3;
      case '}':
        char v6 = &type metadata for TokenProducers.RightCurlyBracket;
        uint64_t v7 = &off_2703FCF18;
        goto LABEL_3;
      case '~':
        char v6 = &type metadata for TokenProducers.Tilde;
        uint64_t v7 = &off_2703FD038;
        goto LABEL_3;
      default:
        swift_getKeyPath();
        char v8 = sub_254EDC080();
        swift_release();
        if (v8)
        {
          char v6 = &type metadata for TokenProducers.Digit;
          uint64_t v7 = &off_2703FD008;
          goto LABEL_3;
        }
        swift_getKeyPath();
        char v9 = sub_254EDC080();
        swift_release();
        if (v9)
        {
          char v6 = &type metadata for TokenProducers.Name;
          uint64_t v7 = &off_2703FCF78;
          goto LABEL_3;
        }
        *(void *)(a2 + 32) = 0;
        double result = 0.0;
        *(_OWORD *)a2 = 0u;
        *(_OWORD *)(a2 + 16) = 0u;
        break;
    }
  }
  return result;
}

uint64_t sub_254ED85D0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  sub_254ED8694(v3, (uint64_t)v9);
  uint64_t v6 = v10;
  if (v10)
  {
    uint64_t v7 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 8))(a1, v6, v7);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
  else
  {
    uint64_t result = sub_254ED86FC((uint64_t)v9);
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0x1FFFFFFFELL;
    a2[3] = 0;
    a2[4] = 0;
    a2[5] = 0;
  }
  return result;
}

uint64_t sub_254ED8694(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_254ED86FC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70EA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_254ED87F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for Token(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AnyTokenProducer(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

uint64_t initializeWithCopy for AnyTokenProducer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    uint64_t v4 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v3;
    *(void *)(a1 + 32) = v4;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  return a1;
}

uint64_t assignWithCopy for AnyTokenProducer(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 3);
  if (!*(void *)(a1 + 24))
  {
    if (v4)
    {
      *(void *)(a1 + 24) = v4;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
      return a1;
    }
LABEL_7:
    long long v5 = *a2;
    long long v6 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AnyTokenProducer(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyTokenProducer(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyTokenProducer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyTokenProducer()
{
  return &type metadata for AnyTokenProducer;
}

uint64_t sub_254ED8CC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_254ED6464();
  *a1 = result & 1;
  return result;
}

uint64_t sub_254ED8CF4@<X0>(unsigned int *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_254ED6688(*a1);
  *a2 = result & 1;
  return result;
}

ValueMetadata *type metadata accessor for TokenProducers.Whitespace()
{
  return &type metadata for TokenProducers.Whitespace;
}

ValueMetadata *type metadata accessor for TokenProducers.QuotationMark()
{
  return &type metadata for TokenProducers.QuotationMark;
}

ValueMetadata *type metadata accessor for TokenProducers.NumberSign()
{
  return &type metadata for TokenProducers.NumberSign;
}

ValueMetadata *type metadata accessor for TokenProducers.DollarSign()
{
  return &type metadata for TokenProducers.DollarSign;
}

ValueMetadata *type metadata accessor for TokenProducers.Apostrophe()
{
  return &type metadata for TokenProducers.Apostrophe;
}

ValueMetadata *type metadata accessor for TokenProducers.LeftParenthesis()
{
  return &type metadata for TokenProducers.LeftParenthesis;
}

ValueMetadata *type metadata accessor for TokenProducers.RightParenthesis()
{
  return &type metadata for TokenProducers.RightParenthesis;
}

ValueMetadata *type metadata accessor for TokenProducers.Asterisk()
{
  return &type metadata for TokenProducers.Asterisk;
}

ValueMetadata *type metadata accessor for TokenProducers.PlusSign()
{
  return &type metadata for TokenProducers.PlusSign;
}

ValueMetadata *type metadata accessor for TokenProducers.Comma()
{
  return &type metadata for TokenProducers.Comma;
}

ValueMetadata *type metadata accessor for TokenProducers.HyphenMinus()
{
  return &type metadata for TokenProducers.HyphenMinus;
}

ValueMetadata *type metadata accessor for TokenProducers.FullStop()
{
  return &type metadata for TokenProducers.FullStop;
}

ValueMetadata *type metadata accessor for TokenProducers.Solidus()
{
  return &type metadata for TokenProducers.Solidus;
}

ValueMetadata *type metadata accessor for TokenProducers.Colon()
{
  return &type metadata for TokenProducers.Colon;
}

ValueMetadata *type metadata accessor for TokenProducers.Semicolon()
{
  return &type metadata for TokenProducers.Semicolon;
}

ValueMetadata *type metadata accessor for TokenProducers.LessThanSign()
{
  return &type metadata for TokenProducers.LessThanSign;
}

ValueMetadata *type metadata accessor for TokenProducers.CommercialAt()
{
  return &type metadata for TokenProducers.CommercialAt;
}

ValueMetadata *type metadata accessor for TokenProducers.LeftSquareBracket()
{
  return &type metadata for TokenProducers.LeftSquareBracket;
}

ValueMetadata *type metadata accessor for TokenProducers.ReverseSolidus()
{
  return &type metadata for TokenProducers.ReverseSolidus;
}

ValueMetadata *type metadata accessor for TokenProducers.RightSquareBracket()
{
  return &type metadata for TokenProducers.RightSquareBracket;
}

ValueMetadata *type metadata accessor for TokenProducers.CircumflexAccent()
{
  return &type metadata for TokenProducers.CircumflexAccent;
}

ValueMetadata *type metadata accessor for TokenProducers.LeftCurlyBracket()
{
  return &type metadata for TokenProducers.LeftCurlyBracket;
}

ValueMetadata *type metadata accessor for TokenProducers.RightCurlyBracket()
{
  return &type metadata for TokenProducers.RightCurlyBracket;
}

ValueMetadata *type metadata accessor for TokenProducers.LatinLetterU()
{
  return &type metadata for TokenProducers.LatinLetterU;
}

ValueMetadata *type metadata accessor for TokenProducers.VerticalLine()
{
  return &type metadata for TokenProducers.VerticalLine;
}

ValueMetadata *type metadata accessor for TokenProducers.Tilde()
{
  return &type metadata for TokenProducers.Tilde;
}

ValueMetadata *type metadata accessor for TokenProducers.Digit()
{
  return &type metadata for TokenProducers.Digit;
}

ValueMetadata *type metadata accessor for TokenProducers.Name()
{
  return &type metadata for TokenProducers.Name;
}

double sub_254ED8EE4@<D0>(uint64_t a1@<X8>)
{
  sub_254EDD7F8();
  *(void *)&double result = 9;
  *(_OWORD *)a1 = xmmword_254EFD720;
  *(void *)(a1 + 16) = 0xA000000000000000;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  return result;
}

double sub_254ED8F34@<D0>(_OWORD *a1@<X8>)
{
  return sub_254ED9178(34, a1);
}

uint64_t sub_254ED8F50@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v3 = *(uint64_t (**)(void))(*(void *)a1 + 216);
  uint64_t v4 = *(void *)(v3() + 16);
  uint64_t v5 = swift_bridgeObjectRelease();
  if (!v4)
  {
LABEL_4:
    uint64_t v8 = ((uint64_t (*)(uint64_t))v3)(v5);
    BOOL v9 = sub_254EDC0EC(v8);
    swift_bridgeObjectRelease();
    if (!v9)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0x6000000000000000;
      uint64_t result = 35;
      goto LABEL_7;
    }
LABEL_5:
    uint64_t v10 = v3();
    BOOL v11 = sub_254EDC1B0(v10);
    swift_bridgeObjectRelease();
    uint64_t result = sub_254EDE1DC();
    uint64_t v14 = !v11 | 0x3000000000000000;
LABEL_7:
    *a2 = result;
    a2[1] = v13;
    a2[2] = v14;
    a2[3] = 0;
    a2[4] = 0;
    a2[5] = 0;
    return result;
  }
  uint64_t v6 = ((uint64_t (*)(uint64_t))v3)(v5);
  if (*(void *)(v6 + 16))
  {
    unsigned int v7 = *(_DWORD *)(v6 + 32);
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_254ED6688(v7);
    if (v5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_254ED9054@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_254ED8F50(a1, a2);
}

uint64_t sub_254ED907C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 216))(a1);
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  int v5 = *(_DWORD *)(v4 + 32);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 != 61)
  {
LABEL_5:
    unint64_t v7 = 0x6000000000000000;
    uint64_t v8 = 36;
    goto LABEL_6;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272))(result);
  unint64_t v7 = 0xA000000000000000;
  uint64_t v8 = 6;
LABEL_6:
  *a2 = v8;
  a2[1] = 0;
  a2[2] = v7;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_254ED9134@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_254ED907C(a1, a2);
}

double sub_254ED915C@<D0>(_OWORD *a1@<X8>)
{
  return sub_254ED9178(39, a1);
}

double sub_254ED9178@<D0>(int a1@<W3>, _OWORD *a2@<X8>)
{
  sub_254ED70C0(a1, v5);
  long long v3 = v5[1];
  *a2 = v5[0];
  a2[1] = v3;
  double result = *(double *)&v6;
  a2[2] = v6;
  return result;
}

double sub_254ED91D0@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 17;
  *(_OWORD *)a1 = xmmword_254EFD730;
  *(void *)(a1 + 16) = 0xA000000000000000;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  return result;
}

double sub_254ED91EC@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 18;
  *(_OWORD *)a1 = xmmword_254EFD740;
  *(void *)(a1 + 16) = 0xA000000000000000;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_254ED9208@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 216))(a1);
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  int v5 = *(_DWORD *)(v4 + 32);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 != 61)
  {
LABEL_5:
    unint64_t v7 = 0x6000000000000000;
    uint64_t v8 = 42;
    goto LABEL_6;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272))(result);
  unint64_t v7 = 0xA000000000000000;
  uint64_t v8 = 7;
LABEL_6:
  *a2 = v8;
  a2[1] = 0;
  a2[2] = v7;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_254ED92C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_254ED9208(a1, a2);
}

double sub_254ED92E8@<D0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  return sub_254ED9728(a1, a2, (__n128)xmmword_254EFD750);
}

double sub_254ED9308@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 14;
  *(_OWORD *)a1 = xmmword_254EFD760;
  *(void *)(a1 + 16) = 0xA000000000000000;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_254ED9324@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  int v5 = *(uint64_t (**)(void))(*(void *)a1 + 216);
  if (*(void *)(v5() + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_254ED6464();
    if (v6)
    {
      (*(void (**)(void))(*(void *)a1 + 280))();
      uint64_t result = sub_254ED6F4C((uint64_t *)v18);
      if (v2)
      {
        uint64_t result = MEMORY[0x25A2817A0](v2);
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0x1FFFFFFFELL;
        a2[3] = 0;
        a2[4] = 0;
        a2[5] = 0;
        return result;
      }
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = swift_bridgeObjectRelease();
  }
  uint64_t v8 = ((uint64_t (*)(uint64_t))v5)(v6);
  BOOL v9 = sub_254EDC1B0(v8);
  uint64_t v10 = swift_bridgeObjectRelease();
  if (v9)
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 280))(v10);
    uint64_t result = sub_254ED6D30((uint64_t)v18);
LABEL_8:
    long long v11 = v18[1];
    *(_OWORD *)a2 = v18[0];
    *((_OWORD *)a2 + 1) = v11;
    *((_OWORD *)a2 + 2) = v18[2];
    return result;
  }
  uint64_t v12 = ((uint64_t (*)(uint64_t))v5)(v10);
  char v13 = sub_254ED9514(15917, 0xE200000000000000, v12);
  uint64_t result = swift_bridgeObjectRelease();
  if (v13)
  {
    uint64_t v14 = (uint64_t (**)(uint64_t))(*(void *)a1 + 272);
    unint64_t v15 = *v14;
    uint64_t v16 = (*v14)(result);
    uint64_t result = v15(v16);
    *(_OWORD *)a2 = xmmword_254EFD780;
    unint64_t v17 = 0xA000000000000000;
  }
  else
  {
    *(_OWORD *)a2 = xmmword_254EFD770;
    unint64_t v17 = 0x6000000000000000;
  }
  a2[2] = v17;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_254ED9514(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6)
  {
    if (v5)
    {
      int v8 = *(_DWORD *)(a3 + 32);
      uint64_t v15 = a1 & 0x1000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = v6 - 1;
      while (1)
      {
        if ((a2 & 0x1000000000000000) != 0)
        {
          if (v8 != sub_254EFCF10()) {
            goto LABEL_22;
          }
        }
        else
        {
          if ((a2 & 0x2000000000000000) == 0 && !v15) {
            sub_254EFCF60();
          }
          if (v8 != sub_254EFCF70())
          {
LABEL_22:
            swift_bridgeObjectRelease();
            goto LABEL_30;
          }
        }
        v10 += v12;
        if (v11 == v9) {
          break;
        }
        int v8 = *(_DWORD *)(a3 + 4 * v9++ + 36);
        if (v10 >= v5)
        {
          swift_bridgeObjectRelease();
LABEL_17:
          swift_bridgeObjectRelease();
          return 1;
        }
      }
      swift_bridgeObjectRelease();
      if (v10 >= v5) {
        goto LABEL_17;
      }
      if ((a2 & 0x1000000000000000) == 0)
      {
        uint64_t v14 = v15;
        if ((a2 & 0x2000000000000000) == 0)
        {
LABEL_26:
          if (!v14) {
            sub_254EFCF60();
          }
          goto LABEL_28;
        }
        goto LABEL_28;
      }
      goto LABEL_29;
    }
  }
  else if (v5)
  {
    swift_bridgeObjectRetain();
    if ((a2 & 0x1000000000000000) == 0)
    {
      if ((a2 & 0x2000000000000000) == 0)
      {
        uint64_t v14 = a1 & 0x1000000000000000;
        goto LABEL_26;
      }
LABEL_28:
      sub_254EFCF70();
LABEL_30:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_29:
    sub_254EFCF10();
    goto LABEL_30;
  }
  return 1;
}

uint64_t sub_254ED9710@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_254ED9324(a1, a2);
}

double sub_254ED9728@<D0>(uint64_t a1@<X0>, __n128 *a2@<X8>, __n128 a3@<Q0>)
{
  if (!*(void *)((*(uint64_t (**)(uint64_t))(*(void *)a1 + 216))(a1) + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  if ((sub_254ED6464() & 1) == 0)
  {
LABEL_6:
    double result = a3.n128_f64[0];
    *a2 = a3;
    a2[1].n128_u64[0] = 0x6000000000000000;
    a2[1].n128_u64[1] = 0;
    a2[2].n128_u64[0] = 0;
    a2[2].n128_u64[1] = 0;
    return result;
  }
  (*(void (**)(void))(*(void *)a1 + 280))();
  sub_254ED6F4C((uint64_t *)v9);
  if (v3)
  {
    MEMORY[0x25A2817A0](v3);
    a2->n128_u64[0] = 0;
    a2->n128_u64[1] = 0;
    a2[1].n128_u64[0] = 0x1FFFFFFFELL;
    a2[1].n128_u64[1] = 0;
    a2[2].n128_u64[0] = 0;
    a2[2].n128_u64[1] = 0;
  }
  else
  {
    __n128 v7 = (__n128)v9[1];
    *a2 = (__n128)v9[0];
    a2[1] = v7;
    double result = v10.n128_f64[0];
    a2[2] = v10;
  }
  return result;
}

double sub_254ED9830@<D0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  return sub_254ED9728(a1, a2, (__n128)xmmword_254EFD790);
}

uint64_t sub_254ED9850@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 216))(a1);
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  int v5 = *(_DWORD *)(v4 + 32);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 != 42)
  {
LABEL_10:
    *(_OWORD *)a2 = xmmword_254EFD7A0;
    a2[2] = 0x6000000000000000;
    a2[3] = 0;
    a2[4] = 0;
    a2[5] = 0;
    return result;
  }
  __n128 v7 = (uint64_t (**)(uint64_t))(*(void *)a1 + 256);
  int v8 = *v7;
  uint64_t v9 = (*v7)(2);
  if (!*(void *)(v9 + 16))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return sub_254ED7310(a2);
  }
  char v10 = sub_254ED9514(12074, 0xE200000000000000, v9);
  uint64_t v11 = swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    uint64_t v12 = *(void (**)(uint64_t))(*(void *)a1 + 272);
    do
    {
      v12(v11);
      uint64_t v13 = v8(2);
      if (!*(void *)(v13 + 16)) {
        goto LABEL_11;
      }
      char v14 = sub_254ED9514(12074, 0xE200000000000000, v13);
      uint64_t v11 = swift_bridgeObjectRelease();
    }
    while ((v14 & 1) == 0);
  }
  uint64_t v15 = (uint64_t (**)(uint64_t))(*(void *)a1 + 272);
  uint64_t v16 = *v15;
  uint64_t v17 = (*v15)(v11);
  v16(v17);
  return sub_254ED7310(a2);
}

uint64_t sub_254ED9A0C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_254ED9850(a1, a2);
}

double sub_254ED9A24@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 12;
  *(_OWORD *)a1 = xmmword_254EFD7B0;
  *(void *)(a1 + 16) = 0xA000000000000000;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  return result;
}

double sub_254ED9A40@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 13;
  *(_OWORD *)a1 = xmmword_254EFD7C0;
  *(void *)(a1 + 16) = 0xA000000000000000;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_254ED9A5C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 216))(a1);
  char v5 = sub_254ED9514(2960673, 0xE300000000000000, v4);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5)
  {
    __n128 v7 = (uint64_t (**)(uint64_t))(*(void *)a1 + 272);
    int v8 = *v7;
    uint64_t v9 = (*v7)(result);
    uint64_t v10 = v8(v9);
    uint64_t result = v8(v10);
    unint64_t v11 = 0xA000000000000000;
    uint64_t v12 = 10;
  }
  else
  {
    unint64_t v11 = 0x6000000000000000;
    uint64_t v12 = 60;
  }
  *a2 = v12;
  a2[1] = 0;
  a2[2] = v11;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_254ED9B48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 216))(a1);
  BOOL v4 = sub_254EDC1B0(v3);
  swift_bridgeObjectRelease();
  if (v4)
  {
    uint64_t result = sub_254EDE1DC();
    int64x2_t v7 = vdupq_n_s64(0x2000000000000000uLL);
    v7.i64[0] = v6;
  }
  else
  {
    int64x2_t v7 = (int64x2_t)xmmword_254EFD7D0;
    uint64_t result = 64;
  }
  *(void *)a2 = result;
  *(int64x2_t *)(a2 + 8) = v7;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 24) = 0;
  return result;
}

double sub_254ED9BF0@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 15;
  *(_OWORD *)a1 = xmmword_254EFD7E0;
  *(void *)(a1 + 16) = 0xA000000000000000;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  return result;
}

double sub_254ED9C0C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 216))(a1);
  if (*(void *)(v4 + 16))
  {
    int v5 = *(_DWORD *)(v4 + 32);
    swift_bridgeObjectRelease();
    if (sub_254EDC0B4(92, v5))
    {
      (*(void (**)(void))(*(void *)a1 + 280))();
      sub_254ED6D30((uint64_t)v8);
      long long v6 = v8[1];
      *(_OWORD *)a2 = v8[0];
      *(_OWORD *)(a2 + 16) = v6;
      double result = *(double *)&v9;
      *(_OWORD *)(a2 + 32) = v9;
      return result;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  *(void *)&double result = 92;
  *(_OWORD *)a2 = xmmword_254EFD7F0;
  *(void *)(a2 + 16) = 0x6000000000000000;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

double sub_254ED9CE8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_254ED9C0C(a1, a2);
}

double sub_254ED9D10@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 16;
  *(_OWORD *)a1 = xmmword_254EFD800;
  *(void *)(a1 + 16) = 0xA000000000000000;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_254ED9D2C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 216))(a1);
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  int v5 = *(_DWORD *)(v4 + 32);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 != 61)
  {
LABEL_5:
    unint64_t v7 = 0x6000000000000000;
    uint64_t v8 = 94;
    goto LABEL_6;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272))(result);
  unint64_t v7 = 0xA000000000000000;
  uint64_t v8 = 5;
LABEL_6:
  *a2 = v8;
  a2[1] = 0;
  a2[2] = v7;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_254ED9DE4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_254ED9D2C(a1, a2);
}

double sub_254ED9E0C@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 19;
  *(_OWORD *)a1 = xmmword_254EFD810;
  *(void *)(a1 + 16) = 0xA000000000000000;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  return result;
}

double sub_254ED9E28@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 20;
  *(_OWORD *)a1 = xmmword_254EFD820;
  *(void *)(a1 + 16) = 0xA000000000000000;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_254ED9E44@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 280))(a1);
  uint64_t result = sub_254ED6F4C((uint64_t *)v8);
  if (v2)
  {
    uint64_t result = MEMORY[0x25A2817A0](v2);
    long long v5 = xmmword_254EFD830;
    long long v6 = 0uLL;
    long long v7 = 0uLL;
  }
  else
  {
    long long v6 = v8[0];
    long long v5 = v8[1];
    long long v7 = v8[2];
  }
  *a2 = v6;
  a2[1] = v5;
  a2[2] = v7;
  return result;
}

uint64_t sub_254ED9EE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_254EFD230();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  long long v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 216);
  unint64_t v11 = *(void *)(v10(v7) + 16);
  uint64_t v12 = swift_bridgeObjectRelease();
  if (v11 < 2) {
    goto LABEL_11;
  }
  uint64_t v13 = v10(v12);
  if (!*(void *)(v13 + 16))
  {
    uint64_t v12 = swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  int v14 = *(_DWORD *)(v13 + 32);
  uint64_t v12 = swift_bridgeObjectRelease();
  if (v14 != 43)
  {
LABEL_11:
    (*(void (**)(uint64_t))(*(void *)a1 + 280))(v12);
    uint64_t result = sub_254ED6D30((uint64_t)v20);
    long long v19 = v20[1];
    *(_OWORD *)a2 = v20[0];
    *(_OWORD *)(a2 + 16) = v19;
    *(_OWORD *)(a2 + 32) = v20[2];
    return result;
  }
  uint64_t result = v10(v12);
  if (*(void *)(result + 16) < 2uLL)
  {
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  sub_254EFD240();
  char v16 = sub_254EFD200();
  uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  if (v16) {
    goto LABEL_8;
  }
  uint64_t result = v10(v17);
  if (*(void *)(result + 16) < 2uLL)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  int v18 = *(_DWORD *)(result + 36);
  uint64_t v12 = swift_bridgeObjectRelease();
  if (v18 != 63) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t result = sub_254EDEB88();
  if (!v2)
  {
    *(_OWORD *)a2 = xmmword_254EFD840;
    *(void *)(a2 + 16) = 0xA000000000000000;
    *(void *)(a2 + 24) = 0;
    *(void *)(a2 + 32) = 0;
    *(void *)(a2 + 40) = 0;
  }
  return result;
}

uint64_t sub_254EDA11C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_254ED9EE8(a1, a2);
}

double sub_254EDA134@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 280))(a1);
  sub_254ED6D30((uint64_t)v5);
  long long v3 = v5[1];
  *a2 = v5[0];
  a2[1] = v3;
  double result = *(double *)&v6;
  a2[2] = v6;
  return result;
}

uint64_t sub_254EDA1B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)a1 + 216);
  uint64_t v5 = v4();
  if (!*(void *)(v5 + 16))
  {
    uint64_t v7 = swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v11 = ((uint64_t (*)(uint64_t))v4)(v7);
    if (*(void *)(v11 + 16))
    {
      int v12 = *(_DWORD *)(v11 + 32);
      uint64_t result = swift_bridgeObjectRelease();
      if (v12 == 124)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272))(result);
        unint64_t v9 = 0xA000000000000000;
        uint64_t v10 = 8;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t result = swift_bridgeObjectRelease();
    }
    unint64_t v9 = 0x6000000000000000;
    uint64_t v10 = 124;
    goto LABEL_10;
  }
  int v6 = *(_DWORD *)(v5 + 32);
  uint64_t v7 = swift_bridgeObjectRelease();
  if (v6 != 61) {
    goto LABEL_5;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272))(v7);
  unint64_t v9 = 0xA000000000000000;
  uint64_t v10 = 4;
LABEL_10:
  *a2 = v10;
  a2[1] = 0;
  a2[2] = v9;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_254EDA2D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_254EDA1B4(a1, a2);
}

uint64_t sub_254EDA2FC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 216))(a1);
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  int v5 = *(_DWORD *)(v4 + 32);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 != 61)
  {
LABEL_5:
    unint64_t v7 = 0x6000000000000000;
    uint64_t v8 = 126;
    goto LABEL_6;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272))(result);
  unint64_t v7 = 0xA000000000000000;
  uint64_t v8 = 3;
LABEL_6:
  *a2 = v8;
  a2[1] = 0;
  a2[2] = v7;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_254EDA3B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_254EDA2FC(a1, a2);
}

uint64_t Token.Number.hash(into:)()
{
  return sub_254EFD1A0();
}

BOOL static Token.Number.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_254EDA428()
{
  return sub_254EFD1A0();
}

BOOL sub_254EDA458(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t _s33LinkPresentationStyleSheetParsing5TokenO6NumberO9hashValueSivg_0()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EDA4BC()
{
  return sub_254EFD1B0();
}

BOOL _s33LinkPresentationStyleSheetParsing5TokenO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  double v4 = *(double *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)a2;
  uint64_t v9 = *(void *)(a2 + 8);
  unint64_t v11 = *(void *)(a2 + 16);
  double v10 = *(double *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 40);
  uint64_t v67 = *(void *)(a2 + 32);
  switch(v5 >> 60)
  {
    case 1uLL:
      if (v11 >> 60 == 1) {
        goto LABEL_15;
      }
      goto LABEL_53;
    case 2uLL:
      if (v11 >> 60 != 2) {
        goto LABEL_53;
      }
      goto LABEL_15;
    case 3uLL:
      if (v11 >> 60 != 3) {
        goto LABEL_53;
      }
      if (v2 == v8 && v3 == v9)
      {
        uint64_t v13 = *(void *)a1;
        uint64_t v14 = *(void *)(a1 + 8);
        sub_254ED8078(v2, v3, v11);
        sub_254ED8078(v13, v14, v5);
        sub_254ED76FC(v13, v14, v5);
        sub_254ED76FC(v13, v14, v11);
      }
      else
      {
        uint64_t v51 = *(void *)a2;
        uint64_t v52 = *(void *)a1;
        uint64_t v53 = *(void *)(a1 + 8);
        char v60 = sub_254EFD140();
        sub_254ED8078(v51, v9, v11);
        sub_254ED8078(v52, v53, v5);
        sub_254ED76FC(v52, v53, v5);
        sub_254ED76FC(v51, v9, v11);
        BOOL v17 = 0;
        if ((v60 & 1) == 0) {
          return v17;
        }
      }
      return ((v11 ^ v5) & 1) == 0;
    case 4uLL:
      if (v11 >> 60 != 4) {
        goto LABEL_53;
      }
      goto LABEL_15;
    case 5uLL:
      if (v11 >> 60 == 5) {
        goto LABEL_15;
      }
      goto LABEL_53;
    case 6uLL:
      uint64_t v63 = *(void *)(a1 + 8);
      uint64_t v22 = *(void *)a1;
      if (v11 >> 60 != 6) {
        goto LABEL_54;
      }
      uint64_t v23 = *(void *)a2;
      sub_254ED76FC(v2, v3, v5);
      sub_254ED76FC(v23, v9, v11);
      return v22 == v23;
    case 7uLL:
      if (v11 >> 60 != 7) {
        goto LABEL_53;
      }
      goto LABEL_25;
    case 8uLL:
      if (v11 >> 60 != 8) {
        goto LABEL_53;
      }
LABEL_25:
      double v65 = *(double *)(a1 + 24);
      uint64_t v57 = *(void *)(a2 + 16) & 1;
      uint64_t v59 = *(void *)(a1 + 16) & 1;
      if (v2 == v8 && v3 == v9)
      {
        uint64_t v24 = *(void *)a1;
        uint64_t v25 = *(void *)(a1 + 8);
        sub_254ED8078(v2, v3, v11);
        double v26 = v65;
        sub_254ED8078(v24, v25, v5);
        sub_254ED76FC(v24, v25, v5);
        sub_254ED76FC(v24, v25, v11);
        if (v59 != v57) {
          return 0;
        }
        return v26 == v10;
      }
      uint64_t v36 = *(void *)a2;
      uint64_t v37 = *(void *)a1;
      uint64_t v38 = *(void *)(a1 + 8);
      char v56 = sub_254EFD140();
      sub_254ED8078(v36, v9, v11);
      sub_254ED8078(v37, v38, v5);
      sub_254ED76FC(v37, v38, v5);
      sub_254ED76FC(v36, v9, v11);
      BOOL v17 = 0;
      if (v56)
      {
        double v26 = v65;
        if (v59 == v57) {
          return v26 == v10;
        }
      }
      return v17;
    case 9uLL:
      if (v11 >> 60 != 9)
      {
        uint64_t v39 = *(void *)a2;
        uint64_t v40 = *(void *)a1;
        uint64_t v41 = *(void *)(a1 + 8);
        swift_bridgeObjectRetain();
        uint64_t v3 = v41;
        uint64_t v2 = v40;
        uint64_t v8 = v39;
LABEL_53:
        uint64_t v63 = v3;
        uint64_t v22 = v2;
        uint64_t v42 = v8;
        swift_bridgeObjectRetain();
        uint64_t v8 = v42;
        goto LABEL_54;
      }
      uint64_t v62 = *(void *)a2;
      if (v2 != v8 || v3 != v9)
      {
        uint64_t v27 = *(void *)a2;
        double v66 = *(double *)(a1 + 24);
        uint64_t v28 = *(void *)a1;
        uint64_t v29 = *(void *)(a1 + 8);
        char v30 = sub_254EFD140();
        double v4 = v66;
        uint64_t v3 = v29;
        uint64_t v2 = v28;
        uint64_t v8 = v27;
        if ((v30 & 1) == 0) {
          goto LABEL_68;
        }
      }
      if (((v11 ^ v5) & 1) != 0 || v4 != v10)
      {
LABEL_68:
        uint64_t v49 = v2;
        uint64_t v50 = v3;
        sub_254ED8078(v8, v9, v11);
        sub_254ED8078(v49, v50, v5);
        sub_254ED76FC(v49, v50, v5);
        uint64_t v44 = v62;
        uint64_t v45 = v9;
        unint64_t v46 = v11;
        goto LABEL_55;
      }
      uint64_t v64 = v3;
      uint64_t v31 = v2;
      if (v7 == v67 && v6 == v12)
      {
        BOOL v17 = 1;
      }
      else
      {
        uint64_t v54 = v8;
        char v55 = sub_254EFD140();
        uint64_t v8 = v54;
        BOOL v17 = v55;
      }
      sub_254ED8078(v8, v9, v11);
      sub_254ED8078(v31, v64, v5);
      sub_254ED76FC(v31, v64, v5);
      sub_254ED76FC(v62, v9, v11);
      return v17;
    case 0xAuLL:
      uint64_t v32 = *(void *)&v4 | v3;
      uint64_t v63 = *(void *)(a1 + 8);
      if (v5 == 0xA000000000000000 && !(v32 | v2 | v7 | v6))
      {
        uint64_t v22 = *(void *)a1;
        if (v11 >> 60 != 10 || v11 != 0xA000000000000000 || (v67 | *(void *)&v10 | v8 | v9 | v12) != 0) {
          goto LABEL_54;
        }
        sub_254ED76FC(0, 0, 0xA000000000000000);
        uint64_t v35 = 0;
LABEL_209:
        sub_254ED76FC(v35, 0, 0xA000000000000000);
        return 1;
      }
      uint64_t v48 = v32 | v7;
      if (!v6 && v5 == 0xA000000000000000 && v2 == 1 && !v48)
      {
        uint64_t v22 = 1;
        if (v11 >> 60 == 10 && v8 == 1 && !v9 && v11 == 0xA000000000000000 && !(v67 | *(void *)&v10 | v12))
        {
          BOOL v17 = 1;
          sub_254ED76FC(1, 0, 0xA000000000000000);
          sub_254ED76FC(1, 0, 0xA000000000000000);
          return v17;
        }
        goto LABEL_54;
      }
      if (!v6 && v5 == 0xA000000000000000 && v2 == 2 && !v48)
      {
        uint64_t v22 = 2;
        if (v11 >> 60 != 10 || v8 != 2 || v9 || v11 != 0xA000000000000000 || v67 | *(void *)&v10 | v12) {
          goto LABEL_54;
        }
        sub_254ED76FC(2, 0, 0xA000000000000000);
        uint64_t v35 = 2;
        goto LABEL_209;
      }
      if (!v6 && v5 == 0xA000000000000000 && v2 == 3 && !v48)
      {
        uint64_t v22 = 3;
        if (v11 >> 60 != 10 || v8 != 3 || v9 || v11 != 0xA000000000000000 || v67 | *(void *)&v10 | v12) {
          goto LABEL_54;
        }
        sub_254ED76FC(3, 0, 0xA000000000000000);
        uint64_t v35 = 3;
        goto LABEL_209;
      }
      if (!v6 && v5 == 0xA000000000000000 && v2 == 4 && !v48)
      {
        uint64_t v22 = 4;
        if (v11 >> 60 != 10 || v8 != 4 || v9 || v11 != 0xA000000000000000 || v67 | *(void *)&v10 | v12) {
          goto LABEL_54;
        }
        sub_254ED76FC(4, 0, 0xA000000000000000);
        uint64_t v35 = 4;
        goto LABEL_209;
      }
      if (!v6 && v5 == 0xA000000000000000 && v2 == 5 && !v48)
      {
        uint64_t v22 = 5;
        if (v11 >> 60 != 10 || v8 != 5 || v9 || v11 != 0xA000000000000000 || v67 | *(void *)&v10 | v12) {
          goto LABEL_54;
        }
        sub_254ED76FC(5, 0, 0xA000000000000000);
        uint64_t v35 = 5;
        goto LABEL_209;
      }
      if (!v6 && v5 == 0xA000000000000000 && v2 == 6 && !v48)
      {
        uint64_t v22 = 6;
        if (v11 >> 60 != 10 || v8 != 6 || v9 || v11 != 0xA000000000000000 || v67 | *(void *)&v10 | v12) {
          goto LABEL_54;
        }
        sub_254ED76FC(6, 0, 0xA000000000000000);
        uint64_t v35 = 6;
        goto LABEL_209;
      }
      if (!v6 && v5 == 0xA000000000000000 && v2 == 7 && !v48)
      {
        uint64_t v22 = 7;
        if (v11 >> 60 != 10 || v8 != 7 || v9 || v11 != 0xA000000000000000 || v67 | *(void *)&v10 | v12) {
          goto LABEL_54;
        }
        sub_254ED76FC(7, 0, 0xA000000000000000);
        uint64_t v35 = 7;
        goto LABEL_209;
      }
      if (!v6 && v5 == 0xA000000000000000 && v2 == 8 && !v48)
      {
        uint64_t v22 = 8;
        if (v11 >> 60 != 10 || v8 != 8 || v9 || v11 != 0xA000000000000000 || v67 | *(void *)&v10 | v12) {
          goto LABEL_54;
        }
        sub_254ED76FC(8, 0, 0xA000000000000000);
        uint64_t v35 = 8;
        goto LABEL_209;
      }
      if (!v6 && v5 == 0xA000000000000000 && v2 == 9 && !v48)
      {
        uint64_t v22 = 9;
        if (v11 >> 60 != 10 || v8 != 9 || v9 || v11 != 0xA000000000000000 || v67 | *(void *)&v10 | v12) {
          goto LABEL_54;
        }
        sub_254ED76FC(9, 0, 0xA000000000000000);
        uint64_t v35 = 9;
        goto LABEL_209;
      }
      if (!v6 && v5 == 0xA000000000000000 && v2 == 10 && !v48)
      {
        uint64_t v22 = 10;
        if (v11 >> 60 != 10 || v8 != 10 || v9 || v11 != 0xA000000000000000 || v67 | *(void *)&v10 | v12) {
          goto LABEL_54;
        }
        sub_254ED76FC(10, 0, 0xA000000000000000);
        uint64_t v35 = 10;
        goto LABEL_209;
      }
      uint64_t v22 = *(void *)a1;
      if ((v6 || v5 != 0xA000000000000000 || v22 != 11 || v48)
        && (v6 || v5 != 0xA000000000000000 || v22 != 12 || v48)
        && (v6 || v5 != 0xA000000000000000 || v22 != 13 || v48)
        && (v6 || v5 != 0xA000000000000000 || v22 != 14 || v48)
        && (v6 || v5 != 0xA000000000000000 || v22 != 15 || v48)
        && (v6 || v5 != 0xA000000000000000 || v22 != 16 || v48)
        && (v6 || v5 != 0xA000000000000000 || v22 != 17 || v48)
        && (v6 || v5 != 0xA000000000000000 || v22 != 18 || v48)
        && (v6 || v5 != 0xA000000000000000 || v22 != 19 || v48)
        && (v6 || v5 != 0xA000000000000000 || v22 != 20 || v48)
        && v11 >> 60 == 10
        && v8 == 21
        && !v9
        && v11 == 0xA000000000000000
        && !(v67 | *(void *)&v10 | v12))
      {
        sub_254ED76FC(21, 0, 0xA000000000000000);
        uint64_t v35 = 21;
        goto LABEL_209;
      }
LABEL_54:
      uint64_t v43 = v8;
      sub_254ED8078(v8, v9, v11);
      sub_254ED76FC(v22, v63, v5);
      uint64_t v44 = v43;
      uint64_t v45 = v9;
      unint64_t v46 = v11;
LABEL_55:
      sub_254ED76FC(v44, v45, v46);
      return 0;
    default:
      if (v11 >> 60) {
        goto LABEL_53;
      }
LABEL_15:
      unint64_t v15 = *(void *)(a2 + 16);
      unint64_t v58 = *(void *)(a1 + 16);
      uint64_t v16 = *(void *)(a2 + 8);
      if (v2 == v8 && v3 == v9)
      {
        BOOL v17 = 1;
        uint64_t v18 = *(void *)a1;
        uint64_t v19 = *(void *)(a1 + 8);
      }
      else
      {
        uint64_t v20 = *(void *)a2;
        uint64_t v18 = *(void *)a1;
        uint64_t v19 = *(void *)(a1 + 8);
        char v21 = sub_254EFD140();
        uint64_t v8 = v20;
        BOOL v17 = v21;
      }
      uint64_t v61 = v8;
      sub_254ED8078(v8, v16, v15);
      sub_254ED8078(v18, v19, v58);
      sub_254ED76FC(v18, v19, v58);
      sub_254ED76FC(v61, v16, v15);
      return v17;
  }
}

unint64_t sub_254EDB790()
{
  unint64_t result = qword_269E70EA8;
  if (!qword_269E70EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70EA8);
  }
  return result;
}

unint64_t sub_254EDB7E8()
{
  unint64_t result = qword_269E70EB0;
  if (!qword_269E70EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70EB0);
  }
  return result;
}

uint64_t destroy for Token(uint64_t a1)
{
  return sub_254ED76FC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t *initializeWithCopy for Token(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  sub_254ED8078(*a2, v4, v5);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return a1;
}

uint64_t *assignWithCopy for Token(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  sub_254ED8078(*a2, v4, v5);
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  unint64_t v11 = a1[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  sub_254ED76FC(v9, v10, v11);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Token(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  long long v6 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = a2[2];
  sub_254ED76FC(v3, v5, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Token(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 16) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for Token(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 2 * -a2;
      *(void *)(result + 24) = 0;
      *(void *)(result + 32) = 0;
      *(void *)(result + 40) = 0;
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_254EDBA48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16) >> 60;
  if (v1 <= 9) {
    return v1;
  }
  else {
    return (*(_DWORD *)a1 + 10);
  }
}

uint64_t sub_254EDBA64(uint64_t result)
{
  *(void *)(result + 16) &= 0xFFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_254EDBA74(uint64_t result, uint64_t a2)
{
  if (a2 < 0xA)
  {
    *(void *)(result + 16) = *(void *)(result + 16) & 1 | (a2 << 60);
  }
  else
  {
    *(void *)__n128 result = (a2 - 10);
    *(_OWORD *)(result + 8) = xmmword_254EFD580;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 24) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Token()
{
  return &type metadata for Token;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t sub_254EDBAD4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_254EDBADC(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Token.Number()
{
  return &type metadata for Token.Number;
}

uint64_t _s9BaseColorV28ColorComponentRepresentationOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s33LinkPresentationStyleSheetParsing5TokenO8HashTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254EDBC54);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Token.HashType()
{
  return &type metadata for Token.HashType;
}

uint64_t Tokenizer.tokens.getter()
{
  int v2 = *(uint64_t (**)(void))(*(void *)v0 + 120);
  uint64_t result = v2();
  if (!result)
  {
    uint64_t result = sub_254EDBD20();
    if (!v1)
    {
      uint64_t result = ((uint64_t (*)(uint64_t))v2)(result);
      if (!result) {
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t sub_254EDBD20()
{
  sub_254ED7310(&v15);
  int v2 = (char *)MEMORY[0x263F8EE78];
  if (v1) {
    return swift_bridgeObjectRelease();
  }
  while (1)
  {
    unint64_t v4 = v17;
    if (v17 >> 1 == 0xFFFFFFFF) {
      break;
    }
    uint64_t v5 = v15;
    uint64_t v6 = v16;
    uint64_t v7 = v18;
    uint64_t v8 = v19;
    uint64_t v9 = v20;
    sub_254ED8078(v15, v16, v17);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v2 = sub_254EDBF50(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    uint64_t v10 = v2;
    unint64_t v11 = *((void *)v2 + 2);
    uint64_t v12 = v10;
    unint64_t v13 = *((void *)v10 + 3);
    if (v11 >= v13 >> 1) {
      uint64_t v12 = sub_254EDBF50((char *)(v13 > 1), v11 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v11 + 1;
    uint64_t v14 = &v12[48 * v11];
    int v2 = v12;
    *((void *)v14 + 4) = v5;
    *((void *)v14 + 5) = v6;
    *((void *)v14 + 6) = v4;
    *((void *)v14 + 7) = v7;
    *((void *)v14 + 8) = v8;
    *((void *)v14 + 9) = v9;
    if (v4 >> 60 == 10 && v5 == 21 && !v6 && v4 == 0xA000000000000000 && !(v8 | v7 | v9)) {
      break;
    }
    sub_254EDC06C(v5, v6, v4);
    sub_254ED7310(&v15);
  }
  return (*(uint64_t (**)(char *))(*(void *)v0 + 128))(v2);
}

uint64_t sub_254EDBED0()
{
  int v2 = *(uint64_t (**)(void))(**(void **)v0 + 120);
  uint64_t result = v2();
  if (!result)
  {
    uint64_t result = sub_254EDBD20();
    if (!v1)
    {
      uint64_t result = ((uint64_t (*)(uint64_t))v2)(result);
      if (!result) {
        __break(1u);
      }
    }
  }
  return result;
}

char *sub_254EDBF50(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70E98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_254EDC06C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 1 != 0xFFFFFFFF) {
    return sub_254ED76FC(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_254EDC080()
{
  swift_getAtKeyPath();
  return v1;
}

BOOL sub_254EDC0B4(int a1, int a2)
{
  return a1 == 92 && !sub_254ED6894(a2);
}

BOOL sub_254EDC0EC(uint64_t a1)
{
  return *(void *)(a1 + 16) >= 2uLL && *(_DWORD *)(a1 + 32) == 92 && !sub_254ED6894(*(_DWORD *)(a1 + 36));
}

BOOL sub_254EDC130(unsigned int a1, unsigned int a2, int a3)
{
  if (a1 != 45)
  {
    if ((sub_254ED6688(a1) & 1) == 0)
    {
      a3 = a2;
      if (a1 != 92) {
        return 0;
      }
      return !sub_254ED6894(a3);
    }
    return 1;
  }
  if (sub_254ED6688(a2)) {
    return 1;
  }
  if (a2 == 92) {
    return !sub_254ED6894(a3);
  }
  return 0;
}

BOOL sub_254EDC1B0(uint64_t a1)
{
  return *(void *)(a1 + 16) >= 3uLL && sub_254EDC130(*(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 40));
}

uint64_t sub_254EDC1D4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_254EDC20C(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_254EDC254())()
{
  return j__swift_endAccess;
}

uint64_t sub_254EDC2AC()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_254EDC2B8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_254EDC2F0(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 64) = a1;
  return swift_bridgeObjectRelease();
}

BOOL sub_254EDC338()
{
  unint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 24) & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(v1) & 0xF;
  }
  if (!v2) {
    return 1;
  }
  if (*(unsigned char *)(v0 + 56)) {
    return 0;
  }
  return 4 * v2 == *(void *)(v0 + 48) >> 14;
}

uint64_t Tokenizer.__allocating_init(source:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 64) = MEMORY[0x263F8EE78];
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a1;
  *(void *)(result + 32) = a2;
  *(unsigned char *)(result + 40) = 0;
  *(void *)(result + 48) = 0;
  *(unsigned char *)(result + 56) = 1;
  return result;
}

uint64_t Tokenizer.init(source:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 64) = MEMORY[0x263F8EE78];
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  *(unsigned char *)(v2 + 40) = 0;
  *(void *)(v2 + 48) = 0;
  *(unsigned char *)(v2 + 56) = 1;
  return v2;
}

uint64_t sub_254EDC408()
{
  return 1;
}

uint64_t sub_254EDC410(uint64_t result)
{
  if (result < 1)
  {
    __break(1u);
    goto LABEL_24;
  }
  int64_t v2 = result;
  unint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = *(void *)(v1 + 32);
  if (*(unsigned char *)(v1 + 56))
  {
    unint64_t v5 = 15;
  }
  else
  {
    unint64_t v6 = *(void *)(v1 + 48);
    uint64_t v7 = v3 & 0xFFFFFFFFFFFFLL;
    if ((v4 & 0x2000000000000000) != 0) {
      uint64_t v7 = HIBYTE(v4) & 0xF;
    }
    if (v6 >> 14 == 4 * v7) {
      return MEMORY[0x263F8EE78];
    }
    unint64_t v5 = sub_254EDC5C8(v6, *(unsigned __int8 *)(v1 + 40) ^ 1u, v3, v4);
    unint64_t v3 = *(void *)(v1 + 24);
    unint64_t v4 = *(void *)(v1 + 32);
  }
  uint64_t v8 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v8 = v3;
  }
  uint64_t v9 = 7;
  if (((v4 >> 60) & ((v3 & 0x800000000000000) == 0)) != 0) {
    uint64_t v9 = 11;
  }
  int64_t v10 = sub_254EDC7C4(v5, v9 | (v8 << 16), v3, v4);
  if (v10 >= v2) {
    uint64_t v11 = v2;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t result = sub_254EDC5C8(v5, v11, *(void *)(v1 + 24), *(void *)(v1 + 32));
  if (v11 < 1) {
    return MEMORY[0x263F8EE78];
  }
  if ((unint64_t)result >> 14 < v5 >> 14)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_254EFCC30();
  unint64_t v14 = v13;
  unint64_t v16 = v15;
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  unint64_t v19 = sub_254EDD088(v12, v14, v16, v18);
  if (!v19)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v20 = v19;
  char v21 = sub_254EDD71C(v19, 0);
  uint64_t v22 = sub_254EDD29C(v23, (uint64_t)(v21 + 4), v20, v12, v14, v16, v18);
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  if (v22 == v20)
  {
    swift_bridgeObjectRelease();
    return (uint64_t)v21;
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_254EDC5C8(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t result = sub_254EDCCC8(a1, a3, a4);
  if (a2 < 0)
  {
    uint64_t v14 = 0;
    while (1)
    {
      if (result < 0x10000) {
        goto LABEL_38;
      }
      if ((a4 & 0x1000000000000000) == 0) {
        break;
      }
      unint64_t result = sub_254EFCC10();
LABEL_20:
      if (--v14 <= a2) {
        return result;
      }
    }
    unint64_t v15 = result >> 16;
    if ((a4 & 0x2000000000000000) != 0)
    {
      unint64_t v21 = a3;
      uint64_t v22 = a4 & 0xFFFFFFFFFFFFFFLL;
      if ((*((unsigned char *)&v21 + v15 - 1) & 0xC0) == 0x80)
      {
        uint64_t v17 = 0;
        do
          int v19 = *((unsigned char *)&v21 + v15 + v17-- - 2) & 0xC0;
        while (v19 == 128);
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v16 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((a3 & 0x1000000000000000) == 0) {
        uint64_t v16 = sub_254EFCF60();
      }
      if ((*(unsigned char *)(v15 + v16 - 1) & 0xC0) == 0x80)
      {
        uint64_t v17 = 0;
        do
          int v18 = *(unsigned char *)(v16 + v15 - 2 + v17--) & 0xC0;
        while (v18 == 128);
LABEL_33:
        uint64_t v20 = 1 - v17;
LABEL_35:
        unint64_t result = ((v15 - v20) << 16) | 5;
        goto LABEL_20;
      }
    }
    uint64_t v20 = 1;
    goto LABEL_35;
  }
  if (a2)
  {
    if ((a4 & 0x2000000000000000) != 0) {
      unint64_t v8 = HIBYTE(a4) & 0xF;
    }
    else {
      unint64_t v8 = a3 & 0xFFFFFFFFFFFFLL;
    }
    while (1)
    {
      unint64_t v9 = result >> 16;
      if (result >> 16 >= v8) {
        break;
      }
      if ((a4 & 0x1000000000000000) != 0)
      {
        unint64_t result = sub_254EFCC00();
        if (!--a2) {
          return result;
        }
      }
      else
      {
        if ((a4 & 0x2000000000000000) != 0)
        {
          unint64_t v21 = a3;
          uint64_t v22 = a4 & 0xFFFFFFFFFFFFFFLL;
          int v11 = *((unsigned __int8 *)&v21 + v9);
        }
        else
        {
          uint64_t v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0) {
            uint64_t v10 = sub_254EFCF60();
          }
          int v11 = *(unsigned __int8 *)(v10 + v9);
        }
        int v12 = (char)v11;
        unsigned int v13 = __clz(v11 ^ 0xFF) - 24;
        if (v12 >= 0) {
          LOBYTE(v13) = 1;
        }
        unint64_t result = ((v9 + v13) << 16) | 5;
        if (!--a2) {
          return result;
        }
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
  }
  return result;
}

unint64_t sub_254EDC7C4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = sub_254EDCCC8(a1, a3, a4);
  unint64_t result = sub_254EDCCC8(a2, a3, a4);
  unint64_t v9 = result >> 14;
  if (v7 >> 14 >= result >> 14)
  {
    if (v9 >= v7 >> 14) {
      return 0;
    }
    uint64_t v11 = 0;
    while (1)
    {
      if (__OFSUB__(v11--, 1)) {
        goto LABEL_37;
      }
      if ((a4 & 0x1000000000000000) == 0) {
        break;
      }
      unint64_t result = sub_254EFCC10();
      unint64_t v7 = result;
LABEL_18:
      if (v9 >= v7 >> 14) {
        return v11;
      }
    }
    unint64_t v17 = v7 >> 16;
    if ((a4 & 0x2000000000000000) != 0)
    {
      unint64_t v22 = a3;
      uint64_t v23 = a4 & 0xFFFFFFFFFFFFFFLL;
      if ((*((unsigned char *)&v22 + v17 - 1) & 0xC0) == 0x80)
      {
        uint64_t v18 = 0;
        do
          int v20 = *((unsigned char *)&v22 + v17 + v18-- - 2) & 0xC0;
        while (v20 == 128);
        goto LABEL_31;
      }
    }
    else
    {
      unint64_t result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((a3 & 0x1000000000000000) == 0) {
        unint64_t result = sub_254EFCF60();
      }
      if ((*(unsigned char *)(v17 + result - 1) & 0xC0) == 0x80)
      {
        uint64_t v18 = 0;
        do
          int v19 = *(unsigned char *)(result + v17 - 2 + v18--) & 0xC0;
        while (v19 == 128);
LABEL_31:
        uint64_t v21 = 1 - v18;
LABEL_33:
        unint64_t v7 = (v7 - (v21 << 16)) & 0xFFFFFFFFFFFF0000 | 5;
        goto LABEL_18;
      }
    }
    uint64_t v21 = 1;
    goto LABEL_33;
  }
  for (uint64_t i = 0; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    if ((a4 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_254EFCC00();
      unint64_t v7 = result;
    }
    else
    {
      unint64_t v12 = v7 >> 16;
      if ((a4 & 0x2000000000000000) != 0)
      {
        unint64_t v22 = a3;
        uint64_t v23 = a4 & 0xFFFFFFFFFFFFFFLL;
        int v13 = *((unsigned __int8 *)&v22 + v12);
      }
      else
      {
        unint64_t result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if ((a3 & 0x1000000000000000) == 0) {
          unint64_t result = sub_254EFCF60();
        }
        int v13 = *(unsigned __int8 *)(result + v12);
      }
      int v14 = (char)v13;
      unsigned int v15 = __clz(v13 ^ 0xFF) - 24;
      if (v14 >= 0) {
        LOBYTE(v15) = 1;
      }
      unint64_t v7 = ((v12 + v15) << 16) | 5;
    }
    if (v9 <= v7 >> 14) {
      return v11;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_254EDC9EC()
{
  return 3;
}

uint64_t sub_254EDC9F4(uint64_t result)
{
  if (result < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = (*(uint64_t (**)(void))(*v1 + 256))();
    swift_beginAccess();
    v1[8] = v2;
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_254EDCA74()
{
  if (*(unsigned char *)(v0 + 40) == 1)
  {
    if ((*(unsigned char *)(v0 + 56) & 1) == 0)
    {
      unint64_t v1 = *(void *)(v0 + 48);
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)(v0 + 56) & 1) == 0)
  {
    unint64_t v3 = *(void *)(v0 + 24);
    unint64_t v2 = *(void *)(v0 + 32);
    unint64_t v4 = sub_254EDCF78(*(void *)(v0 + 48), v3, v2);
    if ((v2 & 0x1000000000000000) != 0)
    {
      unint64_t v1 = sub_254EFCC00();
    }
    else
    {
      unint64_t v5 = v4 >> 16;
      if ((v2 & 0x2000000000000000) != 0)
      {
        unint64_t v17 = v3;
        uint64_t v18 = v2 & 0xFFFFFFFFFFFFFFLL;
        int v7 = *((unsigned __int8 *)&v17 + v5);
      }
      else
      {
        if ((v3 & 0x1000000000000000) != 0) {
          uint64_t v6 = (v2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        }
        else {
          uint64_t v6 = sub_254EFCF60();
        }
        int v7 = *(unsigned __int8 *)(v6 + v5);
      }
      int v8 = (char)v7;
      unsigned int v9 = __clz(v7 ^ 0xFF) - 24;
      if (v8 >= 0) {
        LOBYTE(v9) = 1;
      }
      unint64_t v1 = ((v5 + v9) << 16) | 5;
    }
    goto LABEL_15;
  }
  unint64_t v1 = 15;
LABEL_15:
  *(void *)(v0 + 48) = v1;
  *(unsigned char *)(v0 + 56) = 0;
LABEL_16:
  unsigned int v10 = 0;
  *(unsigned char *)(v0 + 40) = 0;
  unint64_t v12 = *(void *)(v0 + 24);
  unint64_t v11 = *(void *)(v0 + 32);
  if ((v11 & 0x2000000000000000) != 0) {
    uint64_t v13 = HIBYTE(v11) & 0xF;
  }
  else {
    uint64_t v13 = v12 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v14 = 4 * v13;
  unint64_t v15 = v1 >> 14;
  if (v1 >> 14 < 4 * v13)
  {
    sub_254EDCF78(v1, v12, v11);
    if ((v11 & 0x1000000000000000) != 0)
    {
      unsigned int v10 = sub_254EFCF10();
    }
    else
    {
      if ((v11 & 0x2000000000000000) != 0)
      {
        unint64_t v17 = v12;
        uint64_t v18 = v11 & 0xFFFFFFFFFFFFFFLL;
        swift_bridgeObjectRetain();
      }
      else
      {
        if ((v12 & 0x1000000000000000) == 0) {
          sub_254EFCF60();
        }
        swift_bridgeObjectRetain();
      }
      unsigned int v10 = sub_254EFCF70();
      swift_bridgeObjectRelease();
    }
  }
  LOBYTE(v17) = v15 >= v14;
  return v10 | ((unint64_t)(v15 >= v14) << 32);
}

void sub_254EDCC44()
{
  *(unsigned char *)(v0 + 40) = 1;
}

uint64_t Tokenizer.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Tokenizer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 72, 7);
}

unint64_t sub_254EDCCC8(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16)
  {
    __break(1u);
LABEL_9:
    unint64_t result = sub_254EDCD68(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_254EDCDD8(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_254EDCD68(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    unint64_t result = sub_254EDCEFC(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_254EDCDD8(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v7 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_14;
        }
      }
      else
      {
        unint64_t v12 = result >> 16;
        uint64_t v6 = sub_254EFCF60();
        unint64_t v5 = v12;
        if (v12 == v10) {
          goto LABEL_14;
        }
      }
      if ((*(unsigned char *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          unint64_t v7 = v5 - 1;
          int v8 = *(unsigned char *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      unint64_t v7 = v5;
      return v7 << 16;
    }
    uint64_t v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v9 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v5 != v9)
    {
      return MEMORY[0x270F9E998]();
    }
  }
  return result;
}

uint64_t sub_254EDCEFC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_254EFCD10();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x25A281070](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t sub_254EDCF78(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    unint64_t result = sub_254EDD018(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_254EDCDD8(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_254EDD018(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    unint64_t result = sub_254EDCEFC(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_254EDD088(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = sub_254EDCCC8(a1, a3, a4);
  unint64_t result = sub_254EDCCC8(a2, a3, a4);
  unint64_t v9 = result >> 14;
  if (v7 >> 14 < result >> 14)
  {
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v11 = i + 1;
      if (__OFADD__(i, 1)) {
        break;
      }
      if ((a4 & 0x1000000000000000) != 0)
      {
        unint64_t result = sub_254EFCC00();
        unint64_t v7 = result;
      }
      else
      {
        unint64_t v12 = v7 >> 16;
        if ((a4 & 0x2000000000000000) != 0)
        {
          unint64_t v22 = a3;
          uint64_t v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          int v13 = *((unsigned __int8 *)&v22 + v12);
        }
        else
        {
          unint64_t result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0) {
            unint64_t result = sub_254EFCF60();
          }
          int v13 = *(unsigned __int8 *)(result + v12);
        }
        int v14 = (char)v13;
        unsigned int v15 = __clz(v13 ^ 0xFF) - 24;
        if (v14 >= 0) {
          LOBYTE(v15) = 1;
        }
        unint64_t v7 = ((v12 + v15) << 16) | 5;
      }
      if (v9 <= v7 >> 14) {
        return v11;
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
    return result;
  }
  if (v9 < v7 >> 14)
  {
    uint64_t v11 = 0;
    while (!__OFSUB__(v11--, 1))
    {
      if ((a4 & 0x1000000000000000) != 0)
      {
        unint64_t result = sub_254EFCC10();
        unint64_t v7 = result;
      }
      else
      {
        if ((a4 & 0x2000000000000000) != 0)
        {
          unint64_t v22 = a3;
          uint64_t v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          if ((*((unsigned char *)&v22 + (v7 >> 16) - 1) & 0xC0) == 0x80)
          {
            uint64_t v20 = 0;
            do
              int v21 = *((unsigned char *)&v22 + (v7 >> 16) + v20-- - 2) & 0xC0;
            while (v21 == 128);
            uint64_t v19 = 1 - v20;
          }
          else
          {
            uint64_t v19 = 1;
          }
        }
        else
        {
          unint64_t result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0) {
            unint64_t result = sub_254EFCF60();
          }
          uint64_t v17 = 0;
          do
            int v18 = *(unsigned char *)(result + (v7 >> 16) - 1 + v17--) & 0xC0;
          while (v18 == 128);
          uint64_t v19 = -v17;
        }
        unint64_t v7 = (v7 - (v19 << 16)) & 0xFFFFFFFFFFFF0000 | 5;
      }
      if (v9 >= v7 >> 14) {
        return v11;
      }
    }
    goto LABEL_36;
  }
  return 0;
}

uint64_t sub_254EDD29C(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  if (!a2)
  {
    uint64_t v11 = 0;
    unint64_t v13 = a4;
    goto LABEL_71;
  }
  if (!a3)
  {
    unint64_t v13 = a4;
    uint64_t v11 = 0;
    goto LABEL_71;
  }
  uint64_t v9 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v9) = 1;
  }
  if ((a7 & 0x2000000000000000) != 0) {
    unint64_t v10 = HIBYTE(a7) & 0xF;
  }
  else {
    unint64_t v10 = a6 & 0xFFFFFFFFFFFFLL;
  }
  if (a3 < 0) {
    goto LABEL_76;
  }
  char v55 = a1;
  unint64_t v56 = a5;
  uint64_t v11 = 0;
  unint64_t v12 = a5 >> 14;
  unint64_t v13 = a4;
  uint64_t v14 = 4 << v9;
  unint64_t v15 = a4 >> 14;
  uint64_t v59 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v60 = a7 & 0xFFFFFFFFFFFFFFLL;
  unint64_t v54 = a4;
  unint64_t v57 = a4 >> 14;
  unint64_t v58 = v10;
  do
  {
    unint64_t v19 = v13 >> 14;
    if (v13 >> 14 == v12) {
      goto LABEL_70;
    }
    unint64_t v20 = v13 & 0xC;
    BOOL v21 = (v13 & 1) == 0 || v20 == v14;
    char v22 = v21;
    if (!v21)
    {
      if (v19 >= v15)
      {
        unint64_t v23 = v13;
        if (v19 < v12) {
          goto LABEL_28;
        }
      }
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
      JUMPOUT(0x254EDD6FCLL);
    }
    unint64_t v23 = v13;
    if (v20 == v14)
    {
      uint64_t v44 = a2;
      uint64_t v45 = a3;
      unint64_t v23 = sub_254EDCEFC(v13, a6, a7);
      unint64_t v15 = v57;
      unint64_t v10 = v58;
      a2 = v44;
      a3 = v45;
      unint64_t v19 = v23 >> 14;
      if (v23 >> 14 < v57) {
        goto LABEL_73;
      }
    }
    else if (v19 < v15)
    {
      goto LABEL_73;
    }
    if (v19 >= v12) {
      goto LABEL_73;
    }
    if ((v23 & 1) == 0)
    {
      uint64_t v24 = a2;
      uint64_t v25 = a3;
      unint64_t v26 = sub_254EDCDD8(v23, a6, a7);
      unint64_t v15 = v57;
      unint64_t v10 = v58;
      a2 = v24;
      a3 = v25;
      unint64_t v23 = v26 & 0xFFFFFFFFFFFFFFF2 | 1;
    }
LABEL_28:
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t v36 = a2;
      uint64_t v37 = a3;
      int v38 = sub_254EFCF10();
      unint64_t v15 = v57;
      unint64_t v10 = v58;
      a2 = v36;
      a3 = v37;
      int v29 = v38;
      if ((v22 & 1) == 0) {
        goto LABEL_53;
      }
    }
    else
    {
      unint64_t v27 = v23 >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        unint64_t v61 = a6;
        uint64_t v62 = v60;
        int v29 = *((unsigned __int8 *)&v61 + v27);
        if (*((char *)&v61 + v27) < 0)
        {
          switch(__clz(v29 ^ 0xFF))
          {
            case 0x1Au:
              char v30 = (char *)&v61 + v27;
LABEL_38:
              int v29 = v30[1] & 0x3F | ((v29 & 0x1F) << 6);
              if ((v22 & 1) == 0) {
                goto LABEL_53;
              }
              goto LABEL_48;
            case 0x1Bu:
              uint64_t v31 = (char *)&v61 + v27;
LABEL_43:
              int v29 = ((v29 & 0xF) << 12) | ((v31[1] & 0x3F) << 6) | v31[2] & 0x3F;
              if ((v22 & 1) == 0) {
                goto LABEL_53;
              }
              goto LABEL_48;
            case 0x1Cu:
              uint64_t v32 = (char *)&v61 + v27;
LABEL_46:
              int v29 = ((v29 & 0xF) << 18) | ((v32[1] & 0x3F) << 12) | ((v32[2] & 0x3F) << 6) | v32[3] & 0x3F;
              break;
            default:
              break;
          }
        }
      }
      else
      {
        uint64_t v28 = v59;
        if ((a6 & 0x1000000000000000) == 0)
        {
          uint64_t v53 = a2;
          uint64_t v46 = a3;
          uint64_t v28 = sub_254EFCF60();
          unint64_t v15 = v57;
          unint64_t v10 = v58;
          a2 = v53;
          a3 = v46;
        }
        int v29 = *(unsigned __int8 *)(v28 + v27);
        if (*(char *)(v28 + v27) < 0)
        {
          switch(__clz(v29 ^ 0xFF))
          {
            case 0x1Au:
              char v30 = (char *)(v27 + v28);
              goto LABEL_38;
            case 0x1Bu:
              uint64_t v31 = (char *)(v27 + v28);
              goto LABEL_43;
            case 0x1Cu:
              uint64_t v32 = (char *)(v27 + v28);
              goto LABEL_46;
            default:
              break;
          }
        }
      }
      if ((v22 & 1) == 0)
      {
LABEL_53:
        if (v10 <= v13 >> 16) {
          goto LABEL_74;
        }
        goto LABEL_54;
      }
    }
LABEL_48:
    if (v20 == v14)
    {
      uint64_t v47 = a2;
      uint64_t v48 = a3;
      unint64_t v49 = sub_254EDCEFC(v13, a6, a7);
      unint64_t v15 = v57;
      unint64_t v10 = v58;
      a2 = v47;
      a3 = v48;
      unint64_t v13 = v49;
      if (v58 <= v49 >> 16) {
        goto LABEL_75;
      }
    }
    else if (v10 <= v13 >> 16)
    {
      goto LABEL_75;
    }
    if ((v13 & 1) == 0)
    {
      uint64_t v33 = a2;
      uint64_t v34 = a3;
      unint64_t v35 = sub_254EDCDD8(v13, a6, a7);
      unint64_t v15 = v57;
      unint64_t v10 = v58;
      a2 = v33;
      a3 = v34;
      unint64_t v13 = v13 & 0xC | v35 & 0xFFFFFFFFFFFFFFF3 | 1;
    }
LABEL_54:
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t v16 = a2;
      uint64_t v17 = a3;
      uint64_t v18 = sub_254EFCC00();
      unint64_t v15 = v57;
      unint64_t v10 = v58;
      a2 = v16;
      a3 = v17;
      unint64_t v13 = v18;
    }
    else
    {
      unint64_t v39 = v13 >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        unint64_t v61 = a6;
        uint64_t v62 = v60;
        int v41 = *((unsigned __int8 *)&v61 + v39);
      }
      else
      {
        uint64_t v40 = v59;
        if ((a6 & 0x1000000000000000) == 0)
        {
          uint64_t v50 = a2;
          uint64_t v51 = a3;
          uint64_t v40 = sub_254EFCF60();
          unint64_t v15 = v57;
          unint64_t v10 = v58;
          a2 = v50;
          a3 = v51;
        }
        int v41 = *(unsigned __int8 *)(v40 + v39);
      }
      int v42 = (char)v41;
      unsigned int v43 = __clz(v41 ^ 0xFF) - 24;
      if (v42 >= 0) {
        LOBYTE(v43) = 1;
      }
      unint64_t v13 = ((v39 + v43) << 16) | 5;
    }
    *(_DWORD *)(a2 + 4 * v11++) = v29;
  }
  while (a3 != v11);
  uint64_t v11 = a3;
LABEL_70:
  a1 = v55;
  a5 = v56;
  a4 = v54;
LABEL_71:
  *a1 = a4;
  a1[1] = a5;
  a1[2] = a6;
  a1[3] = a7;
  a1[4] = v13;
  return v11;
}

void *sub_254EDD71C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70EB8);
  uint64_t v4 = (void *)swift_allocObject();
  int64_t v5 = _swift_stdlib_malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 29;
  }
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 2);
  return v4;
}

uint64_t type metadata accessor for Tokenizer()
{
  return self;
}

uint64_t method lookup function for Tokenizer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Tokenizer);
}

uint64_t dispatch thunk of Tokenizer.__allocating_init(source:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

void sub_254EDD7E4()
{
}

uint64_t sub_254EDD7F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_254EFD230();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = *(uint64_t (**)(uint64_t))(*(void *)v0 + 240);
  uint64_t result = v7(v4);
  if ((result & 1) == 0)
  {
    uint64_t v9 = *(uint64_t (**)(void))(*(void *)v0 + 272);
    unint64_t v10 = (uint64_t (**)(char *, uint64_t))(v3 + 8);
    do
    {
      uint64_t result = v9();
      if ((result & 0x100000000) != 0) {
        break;
      }
      sub_254EFD240();
      char v11 = sub_254EFD210();
      uint64_t v12 = (*v10)(v6, v2);
      if ((v11 & 1) == 0) {
        return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 280))(v12);
      }
      uint64_t result = v7(v12);
    }
    while ((result & 1) == 0);
  }
  return result;
}

uint64_t sub_254EDD98C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_254EFD1F0();
  v70 = *(char **)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  unint64_t v7 = (char *)v65 - v6;
  uint64_t v8 = sub_254EFD230();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *v0;
  v68 = *(uint64_t (**)(uint64_t))(*v0 + 272);
  uint64_t v69 = v13 + 272;
  uint64_t result = v68(v10);
  if ((result & 0x100000000) != 0) {
    goto LABEL_96;
  }
  uint64_t v15 = result;
  sub_254EFD240();
  char v16 = sub_254EFD200();
  uint64_t v17 = v12;
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
  uint64_t v19 = v18(v12, v8);
  uint64_t v20 = *v1;
  if ((v16 & 1) == 0)
  {
    uint64_t v38 = v15;
    if (((*(uint64_t (**)(uint64_t))(v20 + 240))(v19) & 1) == 0) {
      return v38;
    }
    return *(unsigned int *)sub_254ED614C();
  }
  double v66 = v7;
  uint64_t v67 = v5;
  v65[0] = v2;
  BOOL v21 = *(uint64_t (**)(uint64_t))(v20 + 256);
  v65[1] = v20 + 256;
  uint64_t v22 = v21(5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70EB8);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_254EFDF00;
  *(_DWORD *)(v23 + 32) = v15;
  uint64_t v73 = v23;
  uint64_t v24 = swift_bridgeObjectRetain();
  sub_254EDEC04(v24);
  uint64_t v71 = v73;
  if (*(void *)(v22 + 16) >= 5uLL) {
    uint64_t v25 = 5;
  }
  else {
    uint64_t v25 = *(void *)(v22 + 16);
  }
  if (v25)
  {
    if (*(void *)(v71 + 16) < 2uLL) {
      goto LABEL_92;
    }
    sub_254EFD240();
    char v26 = sub_254EFD200();
    uint64_t v27 = v18(v12, v8);
    if (v26)
    {
      v68(v27);
      if (v25 != 1)
      {
        if (*(void *)(v71 + 16) < 3uLL) {
          goto LABEL_92;
        }
        sub_254EFD240();
        char v28 = sub_254EFD200();
        uint64_t v29 = v18(v12, v8);
        if (v28)
        {
          v68(v29);
          if (v25 != 2)
          {
            if (*(void *)(v71 + 16) < 4uLL) {
              goto LABEL_92;
            }
            sub_254EFD240();
            char v30 = sub_254EFD200();
            uint64_t v31 = v18(v12, v8);
            if (v30)
            {
              v68(v31);
              if (v25 != 3)
              {
                if (*(void *)(v71 + 16) < 5uLL) {
                  goto LABEL_92;
                }
                sub_254EFD240();
                char v32 = sub_254EFD200();
                uint64_t v33 = v18(v12, v8);
                if (v32)
                {
                  v68(v33);
                  if (v25 != 4)
                  {
                    if (*(void *)(v71 + 16) >= 6uLL)
                    {
                      sub_254EFD240();
                      char v34 = sub_254EFD200();
                      uint64_t v35 = v18(v12, v8);
                      if (v34) {
                        v68(v35);
                      }
                      goto LABEL_22;
                    }
LABEL_92:
                    __break(1u);
                    goto LABEL_93;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_22:
  swift_bridgeObjectRelease();
  if (*(void *)(v21(1) + 16))
  {
    swift_bridgeObjectRelease();
    sub_254EFD240();
    char v36 = sub_254EFD210();
    uint64_t v37 = v18(v12, v8);
    uint64_t v17 = v70;
    uint64_t v22 = (uint64_t)v66;
    uint64_t v25 = (uint64_t)v67;
    if (v36) {
      v68(v37);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = v70;
    uint64_t v22 = (uint64_t)v66;
    uint64_t v25 = (uint64_t)v67;
  }
  uint64_t v73 = 0;
  unint64_t v74 = 0xE000000000000000;
  uint64_t v72 = v71;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70EC8);
  sub_254EDF808();
  uint64_t result = sub_254EFCC20();
  uint64_t v40 = v73;
  uint64_t v39 = v74;
  uint64_t v41 = HIBYTE(v74) & 0xF;
  uint64_t v42 = v73 & 0xFFFFFFFFFFFFLL;
  if ((v74 & 0x2000000000000000) != 0) {
    uint64_t v43 = HIBYTE(v74) & 0xF;
  }
  else {
    uint64_t v43 = v73 & 0xFFFFFFFFFFFFLL;
  }
  if (!v43)
  {
    swift_bridgeObjectRelease();
    goto LABEL_85;
  }
  if ((v74 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_254EDEDE4(v40, v39, 16);
    swift_bridgeObjectRelease_n();
    if ((v38 & 0x100000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_85;
  }
  if ((v74 & 0x2000000000000000) == 0)
  {
    if ((v73 & 0x1000000000000000) != 0)
    {
      uint64_t v44 = (unsigned __int8 *)((v74 & 0xFFFFFFFFFFFFFFFLL) + 32);
LABEL_36:
      uint64_t v45 = sub_254EDEECC(v44, v42, 16);
      LOBYTE(v72) = BYTE4(v45) & 1;
      char v46 = BYTE4(v45) & 1;
      LODWORD(v38) = v45;
      goto LABEL_73;
    }
LABEL_93:
    uint64_t v44 = (unsigned __int8 *)sub_254EFCF60();
    goto LABEL_36;
  }
  v74 &= 0xFFFFFFFFFFFFFFuLL;
  if (v73 == 43)
  {
    if (v41)
    {
      uint64_t v52 = v41 - 1;
      if (v52)
      {
        LODWORD(v38) = 0;
        uint64_t v53 = (unsigned __int8 *)&v73 + 1;
        while (1)
        {
          int v54 = *v53;
          unsigned __int8 v55 = v54 - 48;
          if ((v54 - 48) >= 0xA)
          {
            if ((v54 - 65) < 6)
            {
              unsigned __int8 v55 = v54 - 55;
            }
            else
            {
              if ((v54 - 97) > 5) {
                goto LABEL_72;
              }
              unsigned __int8 v55 = v54 - 87;
            }
          }
          if (v38 >> 28) {
            break;
          }
          LODWORD(v38) = 16 * v38 + v55;
          ++v53;
          if (!--v52)
          {
LABEL_71:
            char v46 = 0;
            goto LABEL_73;
          }
        }
      }
      goto LABEL_72;
    }
  }
  else
  {
    if (v73 != 45)
    {
      if (v41)
      {
        LODWORD(v38) = 0;
        unint64_t v56 = &v73;
        while (1)
        {
          int v57 = *(unsigned __int8 *)v56;
          unsigned __int8 v58 = v57 - 48;
          if ((v57 - 48) >= 0xA)
          {
            if ((v57 - 65) < 6)
            {
              unsigned __int8 v58 = v57 - 55;
            }
            else
            {
              if ((v57 - 97) > 5) {
                goto LABEL_72;
              }
              unsigned __int8 v58 = v57 - 87;
            }
          }
          if (v38 >> 28) {
            break;
          }
          LODWORD(v38) = 16 * v38 + v58;
          unint64_t v56 = (uint64_t *)((char *)v56 + 1);
          if (!--v41) {
            goto LABEL_71;
          }
        }
      }
      goto LABEL_72;
    }
    if (v41)
    {
      uint64_t v47 = v41 - 1;
      if (v47)
      {
        LODWORD(v38) = 0;
        uint64_t v48 = (unsigned __int8 *)&v73 + 1;
        while (1)
        {
          int v49 = *v48;
          unsigned __int8 v50 = v49 - 48;
          if ((v49 - 48) >= 0xA)
          {
            if ((v49 - 65) < 6)
            {
              unsigned __int8 v50 = v49 - 55;
            }
            else
            {
              if ((v49 - 97) > 5) {
                break;
              }
              unsigned __int8 v50 = v49 - 87;
            }
          }
          if (v38 >> 28) {
            break;
          }
          unsigned int v51 = 16 * v38;
          LODWORD(v38) = 16 * v38 - v50;
          if (v51 < v50) {
            break;
          }
          ++v48;
          if (!--v47) {
            goto LABEL_71;
          }
        }
      }
LABEL_72:
      LODWORD(v38) = 0;
      char v46 = 1;
LABEL_73:
      swift_bridgeObjectRelease();
      if ((v46 & 1) == 0)
      {
LABEL_74:
        BOOL v59 = WORD1(v38) > 0x10u || v38 >> 11 == 27;
        char v60 = v59;
        if (v59) {
          uint64_t v38 = 0;
        }
        else {
          uint64_t v38 = v38;
        }
LABEL_86:
        LOBYTE(v73) = v60;
        char v61 = v60;
        swift_bridgeObjectRelease();
        if ((v61 & 1) == 0 && *(_DWORD *)sub_254ED6138() != v38)
        {
          sub_254EFD240();
          sub_254EFD220();
          v18(v12, v8);
          uint64_t v62 = v65[0];
          (*((void (**)(uint64_t, void, void))v17 + 13))(v25, *MEMORY[0x263F8EB48], v65[0]);
          char v63 = sub_254EFD1E0();
          uint64_t v64 = (void (*)(uint64_t, uint64_t))*((void *)v17 + 1);
          v64(v25, v62);
          v64(v22, v62);
          if ((v63 & 1) == 0 && *(_DWORD *)sub_254ED61C4() >= v38) {
            return v38;
          }
        }
        return *(unsigned int *)sub_254ED614C();
      }
LABEL_85:
      uint64_t v38 = 0;
      char v60 = 1;
      goto LABEL_86;
    }
    __break(1u);
  }
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

uint64_t sub_254EDE1DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t (**)(void))(*v0 + 272);
  uint64_t v3 = *v2;
  uint64_t v4 = (*v2)();
  if ((v4 & 0x100000000) != 0) {
    return 0;
  }
  LODWORD(v5) = v4;
  while (1)
  {
    uint64_t v7 = sub_254EDC9EC();
    (*(void (**)(uint64_t))(*v1 + 264))(v7);
    if (sub_254ED6688(v5)) {
      goto LABEL_3;
    }
    uint64_t v8 = (*(uint64_t (**)(void))(*v1 + 216))();
    if (!*(void *)(v8 + 16)) {
      break;
    }
    int v9 = *(_DWORD *)(v8 + 32);
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_254EDC0B4(v5, v9);
    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
    sub_254EDD98C();
LABEL_3:
    sub_254EFD250();
    sub_254EFCCA0();
    uint64_t v6 = swift_bridgeObjectRelease();
    uint64_t v5 = ((uint64_t (*)(uint64_t))v3)(v6);
    if ((v5 & 0x100000000) != 0) {
      return 0;
    }
  }
  uint64_t v10 = swift_bridgeObjectRelease();
LABEL_9:
  (*(void (**)(uint64_t))(*v1 + 280))(v10);
  return 0;
}

uint64_t sub_254EDE360()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_254EDC9EC();
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 264))(v2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)v0 + 216);
  uint64_t v5 = v4(v3);
  if (*(void *)(v5 + 16))
  {
    int v6 = *(_DWORD *)(v5 + 32);
    uint64_t v7 = swift_bridgeObjectRelease();
    if (v6 == 43)
    {
LABEL_7:
      if (((*(uint64_t (**)(uint64_t))(*(void *)v1 + 272))(v7) & 0x100000000) == 0)
      {
        sub_254EFD250();
        sub_254EFCCA0();
        goto LABEL_9;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v7 = swift_bridgeObjectRelease();
  }
  uint64_t v8 = v4(v7);
  if (!*(void *)(v8 + 16))
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  int v9 = *(_DWORD *)(v8 + 32);
  uint64_t v7 = swift_bridgeObjectRelease();
  if (v9 == 45) {
    goto LABEL_7;
  }
LABEL_10:
  uint64_t v10 = sub_254EDC408();
  uint64_t v11 = (uint64_t (**)(uint64_t))(*(void *)v1 + 256);
  uint64_t v12 = *v11;
  if (*(void *)((*v11)(v10) + 16) && (sub_254ED6464() & 1) != 0)
  {
    uint64_t v13 = *(uint64_t (**)(void))(*(void *)v1 + 272);
    do
    {
      if ((v13() & 0x100000000) == 0)
      {
        sub_254EFD250();
        sub_254EFCCA0();
        swift_bridgeObjectRelease();
      }
      uint64_t v14 = sub_254EDC408();
      uint64_t v15 = v12(v14);
      swift_bridgeObjectRelease();
    }
    while (*(void *)(v15 + 16) && (sub_254ED6464() & 1) != 0);
  }
  uint64_t v16 = v12(2);
  swift_bridgeObjectRelease();
  if (*(void *)(v16 + 16) >= 2uLL && *(_DWORD *)(v16 + 32) == 46 && (sub_254ED6464() & 1) != 0)
  {
    uint64_t v17 = (uint64_t (**)(void))(*(void *)v1 + 272);
    uint64_t v18 = *v17;
    uint64_t v19 = (*v17)();
    if ((v19 & 0x100000000) == 0)
    {
      sub_254EFD250();
      sub_254EFCCA0();
      uint64_t v19 = swift_bridgeObjectRelease();
    }
    if ((((uint64_t (*)(uint64_t))v18)(v19) & 0x100000000) == 0)
    {
      sub_254EFD250();
      sub_254EFCCA0();
      swift_bridgeObjectRelease();
    }
    uint64_t v20 = sub_254EDC408();
    uint64_t v21 = v12(v20);
    swift_bridgeObjectRelease();
    if (*(void *)(v21 + 16) && (sub_254ED6464() & 1) != 0)
    {
      do
      {
        if ((v18() & 0x100000000) == 0)
        {
          sub_254EFD250();
          sub_254EFCCA0();
          swift_bridgeObjectRelease();
        }
        uint64_t v22 = sub_254EDC408();
        uint64_t v23 = v12(v22);
        swift_bridgeObjectRelease();
      }
      while (*(void *)(v23 + 16) && (sub_254ED6464() & 1) != 0);
    }
  }
  uint64_t v24 = v12(3);
  uint64_t v25 = swift_bridgeObjectRelease();
  unint64_t v26 = *(void *)(v24 + 16);
  if (v26)
  {
    if ((*(_DWORD *)(v24 + 32) | 0x20) == 0x65)
    {
      if (v26 < 3) {
        goto LABEL_51;
      }
      if (*(_DWORD *)(v24 + 36) != 43) {
        goto LABEL_51;
      }
      uint64_t v25 = sub_254ED6464();
      if ((v25 & 1) == 0) {
        goto LABEL_51;
      }
      uint64_t v27 = (uint64_t (**)(void))(*(void *)v1 + 272);
      char v28 = *v27;
      if (((*v27)() & 0x100000000) == 0)
      {
        sub_254EFD250();
        sub_254EFCCA0();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      if (v26 < 2) {
        goto LABEL_51;
      }
      uint64_t v25 = sub_254ED6464();
      if ((v25 & 1) == 0) {
        goto LABEL_51;
      }
      char v28 = *(uint64_t (**)(void))(*(void *)v1 + 272);
    }
    uint64_t v29 = v28();
    if ((v29 & 0x100000000) == 0)
    {
      sub_254EFD250();
      sub_254EFCCA0();
      uint64_t v29 = swift_bridgeObjectRelease();
    }
    if ((((uint64_t (*)(uint64_t))v28)(v29) & 0x100000000) == 0)
    {
      sub_254EFD250();
      sub_254EFCCA0();
      swift_bridgeObjectRelease();
    }
    uint64_t v30 = sub_254EDC408();
    uint64_t v31 = v12(v30);
    uint64_t v25 = swift_bridgeObjectRelease();
    if (*(void *)(v31 + 16))
    {
      uint64_t v25 = sub_254ED6464();
      if (v25)
      {
        char v32 = *(uint64_t (**)(void))(*(void *)v1 + 272);
        do
        {
          if ((v32() & 0x100000000) == 0)
          {
            sub_254EFD250();
            sub_254EFCCA0();
            swift_bridgeObjectRelease();
          }
          uint64_t v33 = sub_254EDC408();
          uint64_t v34 = v12(v33);
          uint64_t v25 = swift_bridgeObjectRelease();
          if (!*(void *)(v34 + 16)) {
            break;
          }
          uint64_t v25 = sub_254ED6464();
        }
        while ((v25 & 1) != 0);
      }
    }
  }
LABEL_51:
  uint64_t v35 = MEMORY[0x270FA5388](v25);
  MEMORY[0x270FA5388](v35);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_254EDF770();
  swift_allocError();
  *(void *)uint64_t v36 = 0;
  *(void *)(v36 + 8) = 0xE000000000000000;
  *(void *)(v36 + 16) = 0xD000000000000021;
  *(void *)(v36 + 24) = 0x8000000254F03110;
  *(unsigned char *)(v36 + 32) = 1;
  swift_willThrow();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_254EDEB88()
{
  sub_254EDF770();
  swift_allocError();
  *(void *)uint64_t v0 = sub_254EDEBF0;
  *(void *)(v0 + 8) = 0;
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  *(unsigned char *)(v0 + 32) = 2;
  return swift_willThrow();
}

const char *sub_254EDEBF0()
{
  return "consumeUnicodeRange()";
}

uint64_t sub_254EDEC04(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  uint64_t result = (uint64_t)sub_254EDECE8((char *)result, v11, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v7 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = (uint64_t)memcpy((void *)(v3 + 4 * v7 + 32), (const void *)(v6 + 32), 4 * v2);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    *(void *)(v3 + 16) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_254EDECE8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70EB8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_254EDEDE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_254EFCD30();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    int64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_254EDF14C();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    int64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = (unsigned __int8 *)sub_254EFCF60();
  }
LABEL_7:
  int64_t v11 = sub_254EDEECC(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_254EDEECC(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          unint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (v14 < v15) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_254EDF14C()
{
  unint64_t v0 = sub_254EFCD40();
  uint64_t v4 = sub_254EDF1CC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_254EDF1CC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_254EDF324(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_254EDF424(v9, 0);
      unint64_t v12 = sub_254EDF48C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_254EFCF60();
LABEL_4:
        JUMPOUT(0x25A280FD0);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x25A280FD0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x25A280FD0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_254EDF324(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    uint64_t result = sub_254EDCEFC(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    uint64_t result = sub_254EDCEFC(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }

  return sub_254EFCCF0();
}

void *sub_254EDF424(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70ED8);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_254EDF48C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    _OWORD v9[2] = a6;
    void v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_254EDCEFC(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_254EFCD00();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_254EFCF60();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_254EDCEFC(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_254EFCCD0();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_254EDF6A0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

unsigned char *sub_254EDF700@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

unint64_t sub_254EDF770()
{
  unint64_t result = qword_269E70EC0;
  if (!qword_269E70EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70EC0);
  }
  return result;
}

void *sub_254EDF7C4@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

unint64_t sub_254EDF808()
{
  unint64_t result = qword_269E70ED0;
  if (!qword_269E70ED0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E70EC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70ED0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_254EDF8AC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  unint64_t v4 = a1[3];
  unint64_t v44 = a1[4];
  unint64_t v45 = a1[5];
  unint64_t v47 = a1[6];
  uint64_t v6 = a1[8];
  unint64_t v7 = a1[10];
  unint64_t v42 = a1[9];
  uint64_t v43 = a1[7];
  unint64_t v8 = a1[11];
  unint64_t v9 = a1[12];
  uint64_t v10 = a1[13];
  char v11 = *((unsigned char *)a1 + 112);
  nullsub_1(a1);
  if (v11)
  {
    unint64_t v38 = v9;
    unint64_t v39 = v8;
    unint64_t v40 = v7;
    uint64_t v41 = v6;
    *(void *)&long long v49 = v3;
    *((void *)&v49 + 1) = v2;
    unint64_t v50 = v5;
    unint64_t v51 = v4;
    unint64_t v52 = v44;
    unint64_t v53 = v45;
    uint64_t v12 = sub_254EFB31C(&v49);
    uint64_t v14 = v13;
    *(void *)&long long v49 = v47;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70EE0);
    unint64_t v16 = sub_254EDFABC();
    uint64_t v22 = sub_254EFB350((uint64_t)&v49, v15, v16, v17, v18, v19, v20, v21);
    uint64_t v24 = v23;
    sub_254EDFB18(v48, (uint64_t)v55);
    if (v42 >> 1 == 0xFFFFFFFF)
    {
      uint64_t result = sub_254EDFB74((uint64_t)v55);
      uint64_t v26 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      *(void *)&long long v49 = v43;
      *((void *)&v49 + 1) = v41;
      unint64_t v50 = v42;
      unint64_t v51 = v40;
      unint64_t v52 = v39;
      unint64_t v53 = v38;
      uint64_t v54 = v10;
      sub_254ED8078(v43, v41, v42);
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_254EDFBC8((uint64_t *)&v49);
      uint64_t result = sub_254EDFB74((uint64_t)v55);
    }
    *(void *)a2 = v12;
    *(void *)(a2 + 8) = v14;
    *(void *)(a2 + 16) = v22;
    *(void *)(a2 + 24) = v24;
    *(void *)(a2 + 32) = v26;
    *(unsigned char *)(a2 + 40) = 1;
  }
  else
  {
    *(void *)&long long v49 = v3;
    unint64_t v27 = v4;
    sub_254ED8078(v2, v5, v4);
    swift_bridgeObjectRetain();
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70EE0);
    unint64_t v29 = sub_254EDFABC();
    uint64_t v35 = sub_254EFB350((uint64_t)&v49, v28, v29, v30, v31, v32, v33, v34);
    uint64_t v37 = v36;
    *(void *)&long long v49 = v2;
    *((void *)&v49 + 1) = v5;
    unint64_t v50 = v27;
    unint64_t v51 = v44;
    unint64_t v52 = v45;
    unint64_t v53 = v47;
    uint64_t v54 = v43;
    uint64_t result = (uint64_t)sub_254EDFBC8((uint64_t *)&v49);
    *(void *)a2 = v35;
    *(void *)(a2 + 8) = v37;
    *(void *)(a2 + 24) = 0;
    *(void *)(a2 + 32) = 0;
    *(void *)(a2 + 16) = result;
    *(unsigned char *)(a2 + 40) = 0;
  }
  return result;
}

unint64_t sub_254EDFABC()
{
  unint64_t result = qword_269E70EE8;
  if (!qword_269E70EE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E70EE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70EE8);
  }
  return result;
}

uint64_t sub_254EDFB18(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_254EDFB74(uint64_t a1)
{
  return a1;
}

void *sub_254EDFBC8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  unint64_t v4 = a1[2];
  uint64_t v5 = a1[6];
  swift_bridgeObjectRetain();
  sub_254ED76FC(v2, v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v27 = v1;
  uint64_t v6 = sub_254EE004C((void (*)(uint64_t *__return_ptr, void *))sub_254EE0030, (uint64_t)v26, v5);
  swift_bridgeObjectRelease();
  nullsub_1(v6);
  uint64_t v7 = sub_254ED7784();
  uint64_t v9 = v8;
  __int16 v11 = v10;
  swift_bridgeObjectRelease();
  v33[0] = v7;
  v33[1] = v9;
  __int16 v34 = v11 & 0x101;
  uint64_t v12 = sub_254EF88A4((uint64_t)v33);
  nullsub_1(v12);
  uint64_t v13 = v12[2];
  if (v13)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = v12 + 11;
    uint64_t v15 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v17 = *((void *)v14 - 1);
      char v18 = *v14;
      long long v19 = *(_OWORD *)(v14 - 40);
      v30[0] = *(_OWORD *)(v14 - 56);
      v30[1] = v19;
      v30[2] = *(_OWORD *)(v14 - 24);
      uint64_t v31 = v17;
      char v32 = v18;
      sub_254EE02B4((uint64_t)v30, (uint64_t)v28);
      unsigned __int8 v20 = v29;
      if (v29 != 255)
      {
        long long v24 = v28[1];
        long long v25 = v28[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v15 = sub_254EE05CC(0, v15[2] + 1, 1, v15);
        }
        unint64_t v22 = v15[2];
        unint64_t v21 = v15[3];
        if (v22 >= v21 >> 1) {
          uint64_t v15 = sub_254EE05CC((void *)(v21 > 1), v22 + 1, 1, v15);
        }
        v15[2] = v22 + 1;
        unint64_t v16 = &v15[5 * v22];
        *((_OWORD *)v16 + 2) = v25;
        *((_OWORD *)v16 + 3) = v24;
        *((unsigned char *)v16 + 64) = v20;
      }
      v14 += 64;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t *sub_254EDFDDC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  unint64_t v6 = result[2];
  uint64_t v7 = result[3];
  uint64_t v9 = result[4];
  uint64_t v8 = result[5];
  uint64_t v10 = (v6 >> 58) & 3;
  if (v10)
  {
    if (v10 == 1)
    {
      uint64_t v11 = MEMORY[0x263F8EE78];
    }
    else
    {
      uint64_t v23 = a3;
      v22[0] = result[6];
      unint64_t v13 = v6 & 0xF3FFFFFFFFFFFFFFLL;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E70E98);
      uint64_t v14 = swift_allocObject();
      v22[1] = v22;
      *(_OWORD *)(v14 + 16) = xmmword_254EFDF00;
      *(void *)(v14 + 32) = v5;
      *(void *)(v14 + 40) = v4;
      *(void *)(v14 + 48) = v13;
      *(void *)(v14 + 56) = v7;
      *(void *)(v14 + 64) = v9;
      *(void *)(v14 + 72) = v8;
      MEMORY[0x270FA5388](v14);
      v21[2] = a2;
      sub_254ED8078(v5, v4, v13);
      uint64_t v15 = v22[0];
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_254EE004C((void (*)(uint64_t *__return_ptr, void *))sub_254EE0BDC, (uint64_t)v21, v15);
      swift_bridgeObjectRelease();
      uint64_t v24 = v14;
      sub_254EE06EC(v16);
      uint64_t v17 = v24;
      swift_bridgeObjectRetain();
      uint64_t v11 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v11 = (uint64_t)sub_254EDBF50(0, *(void *)(v17 + 16) + 1, 1, (char *)v17);
      }
      unint64_t v19 = *(void *)(v11 + 16);
      unint64_t v18 = *(void *)(v11 + 24);
      if (v19 >= v18 >> 1) {
        uint64_t v11 = (uint64_t)sub_254EDBF50((char *)(v18 > 1), v19 + 1, 1, (char *)v11);
      }
      *(void *)(v11 + 16) = v19 + 1;
      uint64_t v20 = v11 + 48 * v19;
      *(_OWORD *)(v20 + 32) = xmmword_254EFD740;
      *(void *)(v20 + 48) = 0xA000000000000000;
      *(void *)(v20 + 56) = 0;
      *(void *)(v20 + 64) = 0;
      *(void *)(v20 + 72) = 0;
      unint64_t result = (uint64_t *)swift_bridgeObjectRelease();
      a3 = v23;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70E98);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_254EFDF00;
    *(void *)(v11 + 32) = v5;
    *(void *)(v11 + 40) = v4;
    *(void *)(v11 + 48) = v6;
    *(void *)(v11 + 56) = v7;
    *(void *)(v11 + 64) = v9;
    *(void *)(v11 + 72) = v8;
    unint64_t result = (uint64_t *)sub_254ED8078(v5, v4, v6);
  }
  *a3 = v11;
  return result;
}

uint64_t *sub_254EE0030@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_254EDFDDC(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_254EE004C(void (*a1)(uint64_t *__return_ptr, void *), uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (!v3) {
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = (uint64_t *)(a3 + 40);
  unint64_t v6 = (char *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v27 = v3;
    uint64_t v28 = v6;
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    unint64_t v10 = v5[1];
    uint64_t v9 = v5[2];
    uint64_t v11 = v5[3];
    unint64_t v6 = (char *)v5[4];
    uint64_t v12 = v5[5];
    v30[0] = v7;
    v30[1] = v8;
    v30[2] = v10;
    _OWORD v30[3] = v9;
    v30[4] = v11;
    v30[5] = v6;
    v30[6] = v12;
    sub_254EE0AE4(v7, v8, v10);
    a1(&v31, v30);
    if (v29)
    {
      sub_254EE0B60(v7, v8, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v6;
    }
    sub_254EE0B60(v7, v8, v10);
    uint64_t v13 = v31;
    uint64_t v14 = *(void *)(v31 + 16);
    unint64_t v6 = v28;
    int64_t v15 = *((void *)v28 + 2);
    int64_t v16 = v15 + v14;
    if (__OFADD__(v15, v14)) {
      break;
    }
    isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v16 <= *((void *)v28 + 3) >> 1)
    {
      if (*(void *)(v13 + 16)) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v15 <= v16) {
        int64_t v18 = v15 + v14;
      }
      else {
        int64_t v18 = v15;
      }
      unint64_t v6 = sub_254EDBF50(isUniquelyReferenced_nonNull_native, v18, 1, v28);
      if (*(void *)(v13 + 16))
      {
LABEL_15:
        uint64_t v19 = *((void *)v6 + 2);
        if ((*((void *)v6 + 3) >> 1) - v19 < v14) {
          goto LABEL_30;
        }
        unint64_t v20 = (unint64_t)&v6[48 * v19 + 32];
        if (v13 + 32 < v20 + 48 * v14 && v20 < v13 + 32 + 48 * v14) {
          goto LABEL_32;
        }
        swift_arrayInitWithCopy();
        if (v14)
        {
          uint64_t v22 = *((void *)v6 + 2);
          BOOL v23 = __OFADD__(v22, v14);
          uint64_t v24 = v22 + v14;
          if (v23) {
            goto LABEL_31;
          }
          *((void *)v6 + 2) = v24;
        }
        goto LABEL_4;
      }
    }
    if (v14) {
      goto LABEL_29;
    }
LABEL_4:
    v5 += 7;
    swift_bridgeObjectRelease();
    uint64_t v3 = v27 - 1;
    if (v27 == 1)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v6;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  uint64_t result = sub_254EFD000();
  __break(1u);
  return result;
}

uint64_t sub_254EE02B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = sub_254EFCB40();
  uint64_t v5 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 16);
  v38[0] = *(_OWORD *)a1;
  v38[1] = v9;
  v38[2] = *(_OWORD *)(a1 + 32);
  uint64_t v10 = sub_254EFB31C(v38);
  uint64_t v12 = v11;
  *(void *)&v38[0] = v8;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70EE0);
  unint64_t v14 = sub_254EDFABC();
  uint64_t v20 = sub_254EFB350((uint64_t)v38, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v22 = v21;
  sub_254EE0BF4(v10, v12, (uint64_t)v38);
  v35[0] = v20;
  v35[1] = v22;
  sub_254EE0A3C();
  sub_254EE1128((uint64_t)v35, MEMORY[0x263F8D310], (uint64_t)v36);
  if (v2)
  {
    uint64_t v23 = sub_254EFC5C4();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v23, v39);
    MEMORY[0x25A2817B0](v2);
    MEMORY[0x25A2817B0](v2);
    uint64_t v24 = sub_254EFCB20();
    os_log_type_t v25 = sub_254EFCE10();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v33 = v7;
      uint64_t v34 = v5;
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 138412290;
      MEMORY[0x25A2817B0](v2);
      uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&v36[0] = v28;
      sub_254EFCE90();
      *uint64_t v27 = v28;
      uint64_t v29 = v27;
      uint64_t v7 = v33;
      uint64_t v5 = v34;
      MEMORY[0x25A2817A0](v2);
      MEMORY[0x25A2817A0](v2);
      _os_log_impl(&dword_254ED4000, v24, v25, "%@", v26, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F00);
      swift_arrayDestroy();
      MEMORY[0x25A2818B0](v29, -1, -1);
      MEMORY[0x25A2818B0](v26, -1, -1);
    }
    else
    {

      MEMORY[0x25A2817A0](v2);
      MEMORY[0x25A2817A0](v2);
    }
    MEMORY[0x25A2817A0](v2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v39);
    uint64_t result = sub_254EE0A90((uint64_t)v38);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    char v31 = -1;
  }
  else
  {
    uint64_t result = sub_254EE0A90((uint64_t)v38);
    char v31 = v37;
    long long v32 = v36[1];
    *(_OWORD *)a2 = v36[0];
    *(_OWORD *)(a2 + 16) = v32;
  }
  *(unsigned char *)(a2 + 32) = v31;
  return result;
}

void *sub_254EE05CC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E70EF0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_254EE0944(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_254EE06EC(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_254EDBF50(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[48 * v9 + 32];
  if (a1 + 32 < v10 + 48 * v8 && v10 < a1 + 32 + 48 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_254EFD000();
  __break(1u);
  return result;
}

uint64_t sub_254EE084C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_254EFD000();
  __break(1u);
  return result;
}

uint64_t sub_254EE0944(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_254EFD000();
  __break(1u);
  return result;
}

unint64_t sub_254EE0A3C()
{
  unint64_t result = qword_269E70EF8;
  if (!qword_269E70EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70EF8);
  }
  return result;
}

uint64_t sub_254EE0A90(uint64_t a1)
{
  return a1;
}

uint64_t sub_254EE0AE4(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = (a3 >> 58) & 3;
  if (v3 == 2 || v3 == 1)
  {
    sub_254ED8078(result, a2, a3 & 0xF3FFFFFFFFFFFFFFLL);
    return swift_bridgeObjectRetain();
  }
  else if (!v3)
  {
    return sub_254ED8078(result, a2, a3);
  }
  return result;
}

uint64_t sub_254EE0B60(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = (a3 >> 58) & 3;
  if (v3 == 2 || v3 == 1)
  {
    sub_254ED76FC(result, a2, a3 & 0xF3FFFFFFFFFFFFFFLL);
    return swift_bridgeObjectRelease();
  }
  else if (!v3)
  {
    return sub_254ED76FC(result, a2, a3);
  }
  return result;
}

uint64_t sub_254EE0BDC()
{
  return sub_254EE0030();
}

uint64_t sub_254EE0BF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v4 = a1 == 0x726F6C6F63 && a2 == 0xE500000000000000;
  if (v4 || (sub_254EFD140() & 1) != 0)
  {
    uint64_t v7 = swift_bridgeObjectRelease();
    unint64_t v8 = &type metadata for DeclarationParsers.Color;
    uint64_t v9 = &protocol witness table for DeclarationParsers.Color;
LABEL_7:
    uint64_t v14 = v8;
    int64_t v15 = v9;
    nullsub_1(v7);
    return sub_254EE1110(&v13, a3);
  }
  if (a1 == 0xD000000000000010 && a2 == 0x8000000254F03200 || (sub_254EFD140() & 1) != 0)
  {
    uint64_t v7 = swift_bridgeObjectRelease();
    unint64_t v8 = &type metadata for DeclarationParsers.BackgroundColor;
    uint64_t v9 = &protocol witness table for DeclarationParsers.BackgroundColor;
    goto LABEL_7;
  }
  if (a1 == 0x696C612D74786574 && a2 == 0xEA00000000006E67 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    size_t v11 = &type metadata for DeclarationParsers.TextAlign;
    uint64_t v12 = &protocol witness table for DeclarationParsers.TextAlign;
  }
  else if (a1 == 0x7A69732D746E6F66 && a2 == 0xE900000000000065 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    size_t v11 = &type metadata for DeclarationParsers.FontSize;
    uint64_t v12 = &protocol witness table for DeclarationParsers.FontSize;
  }
  else if (a1 == 0x6965772D746E6F66 && a2 == 0xEB00000000746867 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    size_t v11 = &type metadata for DeclarationParsers.FontWeight;
    uint64_t v12 = &protocol witness table for DeclarationParsers.FontWeight;
  }
  else if (a1 == 0x7974732D746E6F66 && a2 == 0xEA0000000000656CLL || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    size_t v11 = &type metadata for DeclarationParsers.FontStyle;
    uint64_t v12 = &protocol witness table for DeclarationParsers.FontStyle;
  }
  else if (a1 == 0x7261762D746E6F66 && a2 == 0xEC000000746E6169 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    size_t v11 = &type metadata for DeclarationParsers.FontVariant;
    uint64_t v12 = &protocol witness table for DeclarationParsers.FontVariant;
  }
  else if (a1 == 0x6D61662D746E6F66 && a2 == 0xEB00000000796C69 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    size_t v11 = &type metadata for DeclarationParsers.FontFamily;
    uint64_t v12 = &protocol witness table for DeclarationParsers.FontFamily;
  }
  else if (a1 == 1953394534 && a2 == 0xE400000000000000 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    size_t v11 = &type metadata for DeclarationParsers.Font;
    uint64_t v12 = &protocol witness table for DeclarationParsers.Font;
  }
  else
  {
    if ((a1 != 0xD000000000000010 || a2 != 0x8000000254F03220) && (sub_254EFD140() & 1) == 0)
    {
      uint64_t v14 = &type metadata for DeclarationParsers.Default;
      int64_t v15 = &off_2703FD378;
      *(void *)&long long v13 = a1;
      *((void *)&v13 + 1) = a2;
      return sub_254EE1110(&v13, a3);
    }
    swift_bridgeObjectRelease();
    size_t v11 = &type metadata for DeclarationParsers.BackgroundImage;
    uint64_t v12 = &protocol witness table for DeclarationParsers.BackgroundImage;
  }
  uint64_t v14 = v11;
  int64_t v15 = v12;
  return sub_254EE1110(&v13, a3);
}

uint64_t sub_254EE1110(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_254EE1128@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v18[2] = a3;
  uint64_t v6 = sub_254EFCB10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254EE12D0(v3, (uint64_t)v20);
  uint64_t v11 = v21;
  uint64_t v10 = v22;
  v18[1] = __swift_project_boxed_opaque_existential_1(v20, v21);
  sub_254EFCB00();
  uint64_t v12 = sub_254EFCEB0();
  uint64_t v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v19[0] = v12;
  v19[1] = v14;
  int64_t v15 = *(void (**)(void *, void, unint64_t, uint64_t, uint64_t))(v10 + 8);
  unint64_t v16 = sub_254EE0A3C();
  v15(v19, MEMORY[0x263F8D310], v16, v11, v10);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
}

uint64_t sub_254EE12D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_254EE1334@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_254EE1128(a1, a2, a3);
}

uint64_t sub_254EE134C(uint64_t a1)
{
  return a1;
}

uint64_t sub_254EE1380@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_254EFCD30();
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = result;
  *(void *)(a3 + 24) = v7;
  *(unsigned char *)(a3 + 32) = 0;
  return result;
}

uint64_t sub_254EE1408@<X0>(uint64_t a1@<X8>)
{
  return sub_254EE1380(*v1, v1[1], a1);
}

uint64_t DeclarationParsers.TextAlign.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v7 = sub_254EE17F4();
  sub_254EE14E8((uint64_t)&type metadata for StyleSheet.TextAlign, a2, (uint64_t)&type metadata for StyleSheet.TextAlign, v7, (uint64_t)&v9);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  if (!v3)
  {
    *(void *)a3 = v9;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *(unsigned char *)(a3 + 32) = 3;
  }
  return result;
}

uint64_t sub_254EE14E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v6 = v5;
  uint64_t v33 = a4;
  uint64_t v28 = a5;
  uint64_t v9 = sub_254EFCE20();
  uint64_t v26 = *(void *)(v9 - 8);
  uint64_t v27 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - v11;
  uint64_t v13 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v10);
  int64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v29 = v6;
  v16(v15, v6, a2);
  uint64_t v31 = sub_254EFCD30();
  unint64_t v32 = v17;
  sub_254EFCD90();
  uint64_t v18 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, a3) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(v28, v12, a3);
  }
  (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v27);
  v16(v15, v29, a2);
  uint64_t v19 = sub_254EFCD30();
  uint64_t v21 = v20;
  uint64_t v31 = 0;
  unint64_t v32 = 0xE000000000000000;
  sub_254EFCF20();
  swift_bridgeObjectRelease();
  uint64_t v31 = 0xD000000000000010;
  unint64_t v32 = 0x8000000254F033B0;
  sub_254EFD280();
  sub_254EFCCA0();
  swift_bridgeObjectRelease();
  sub_254EFCCA0();
  uint64_t v22 = v31;
  unint64_t v23 = v32;
  sub_254EDF770();
  swift_allocError();
  *(void *)uint64_t v24 = v19;
  *(void *)(v24 + 8) = v21;
  *(void *)(v24 + 16) = v22;
  *(void *)(v24 + 24) = v23;
  *(unsigned char *)(v24 + 32) = 0;
  return swift_willThrow();
}

unint64_t sub_254EE17F4()
{
  unint64_t result = qword_269E70F08;
  if (!qword_269E70F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70F08);
  }
  return result;
}

uint64_t sub_254EE1848@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.TextAlign.parse<A>(input:)(a1, a2, a3);
}

double sub_254EE1860(unint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
LABEL_17:
    unint64_t v20 = 0xD000000000000039;
    uint64_t v35 = a2;
    uint64_t v36 = a3;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_254EFCD30();
    uint64_t v23 = v22;
    sub_254EDF770();
    swift_allocError();
    *(void *)uint64_t v24 = v21;
    os_log_type_t v25 = "Could not parse size value: input does not have any unit.";
    goto LABEL_18;
  }
  uint64_t v8 = 4 * v6;
  unint64_t v9 = 15;
  while (sub_254EFCD20() == 46 && v10 == 0xE100000000000000 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    unint64_t v9 = sub_254EFCC70();
    if (v8 == v9 >> 14) {
      goto LABEL_17;
    }
  }
  char v11 = sub_254EFCB80();
  swift_bridgeObjectRelease();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v12 = sub_254EFCD40();
  double v38 = 0.0;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v14 = MEMORY[0x25A280F70](v13);
  uint64_t v16 = v15;
  if ((v15 & 0x1000000000000000) != 0 || !(v15 & 0x2000000000000000 | v14 & 0x1000000000000000))
  {
    sub_254EFCEF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v34[1] = v34;
    MEMORY[0x270FA5388](v14);
    if ((v16 & 0x2000000000000000) != 0)
    {
      uint64_t v35 = v17;
      uint64_t v36 = v16 & 0xFFFFFFFFFFFFFFLL;
      BOOL v28 = (v17 > 0x20u || ((0x100003E01uLL >> v17) & 1) == 0)
         && (uint64_t v27 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
         && *v27 == 0;
      char v37 = v28;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v17 & 0x1000000000000000) != 0)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v19 = v17 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v18 = sub_254EFCF60();
      }
      char v37 = sub_254EDF6A0(v18, v19, (void (*)(uint64_t *__return_ptr))sub_254EDF7C4) & 1;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  if (v37)
  {
    double v3 = v38;
    *a1 = sub_254EE2044(v9, a2, a3);
    a1[1] = v29;
    a1[2] = v30;
    a1[3] = v31;
    return v3;
  }
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_254EFCD30();
  uint64_t v23 = v33;
  sub_254EDF770();
  swift_allocError();
  *(void *)uint64_t v24 = v32;
  unint64_t v20 = 0xD00000000000003ELL;
  os_log_type_t v25 = "Could not parse size value: could not convert input to Double.";
LABEL_18:
  *(void *)(v24 + 8) = v23;
  *(void *)(v24 + 16) = v20;
  *(void *)(v24 + 24) = (unint64_t)(v25 - 32) | 0x8000000000000000;
  *(unsigned char *)(v24 + 32) = 0;
  swift_willThrow();
  return v3;
}

double sub_254EE1C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[2] = v10;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v24 = a2;
  sub_254EFCDE0();
  if (v26)
  {
    unint64_t v12 = 0xD000000000000039;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v24, a3);
    uint64_t v13 = sub_254EFCD30();
    uint64_t v15 = v14;
    sub_254EDF770();
    swift_allocError();
    *(void *)uint64_t v16 = v13;
    uint64_t v17 = "Could not parse size value: input does not have any unit.";
LABEL_6:
    *(void *)(v16 + 8) = v15;
    *(void *)(v16 + 16) = v12;
    *(void *)(v16 + 24) = (unint64_t)(v17 - 32) | 0x8000000000000000;
    *(unsigned char *)(v16 + 32) = 0;
    swift_willThrow();
    return v3;
  }
  v23[0] = v25;
  v23[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F50);
  sub_254EE49C0(&qword_269E70F58, &qword_269E70F50);
  sub_254EFCE00();
  swift_getAssociatedConformanceWitness();
  uint64_t v18 = sub_254EFCDD0();
  if (v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v24, a3);
    uint64_t v20 = sub_254EFCD30();
    uint64_t v15 = v21;
    sub_254EDF770();
    swift_allocError();
    *(void *)uint64_t v16 = v20;
    unint64_t v12 = 0xD00000000000003ELL;
    uint64_t v17 = "Could not parse size value: could not convert input to Double.";
    goto LABEL_6;
  }
  double v3 = *(double *)&v18;
  uint64_t v25 = v23[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F60);
  sub_254EE49C0(&qword_269E70F68, &qword_269E70F60);
  sub_254EFCE00();
  return v3;
}

uint64_t sub_254EE1FC8(void *a1)
{
  if (*a1 == 46 && a1[1] == 0xE100000000000000)
  {
    char v3 = 0;
  }
  else
  {
    char v2 = sub_254EFD140();
    char v3 = 0;
    if ((v2 & 1) == 0) {
      char v3 = sub_254EFCB80() ^ 1;
    }
  }
  return v3 & 1;
}

unint64_t sub_254EE2044(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return sub_254EFCD40();
  }
  __break(1u);
  return result;
}

uint64_t sub_254EE2090@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  char v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v20[-v12];
  unint64_t v14 = sub_254EE232C();
  sub_254EE14E8((uint64_t)&type metadata for StyleSheet.Font.Size.Absolute, a2, (uint64_t)&type metadata for StyleSheet.Font.Size.Absolute, v14, (uint64_t)&v22);
  if (v3)
  {
    MEMORY[0x25A2817A0](v3);
    double v15 = sub_254EE1C50((uint64_t)v11, a1, a2);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v13, v11, AssociatedTypeWitness);
    swift_getAssociatedConformanceWitness();
    unint64_t v16 = sub_254EE2380();
    sub_254EE14E8((uint64_t)&type metadata for StyleSheet.Font.Size.Unit, AssociatedTypeWitness, (uint64_t)&type metadata for StyleSheet.Font.Size.Unit, v16, (uint64_t)&v21);
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v13, AssociatedTypeWitness);
    char v19 = v21;
  }
  else
  {
    *(void *)&double v17 = v22;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
    double v15 = v17;
    char v19 = 0x80;
  }
  *(double *)a3 = v15;
  *(unsigned char *)(a3 + 8) = v19;
  return result;
}

unint64_t sub_254EE232C()
{
  unint64_t result = qword_269E70F10;
  if (!qword_269E70F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70F10);
  }
  return result;
}

unint64_t sub_254EE2380()
{
  unint64_t result = qword_269E70F18;
  if (!qword_269E70F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70F18);
  }
  return result;
}

uint64_t DeclarationParsers.FontSize.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_254EE2090(a1, a2, (uint64_t)&v13);
  if (!v3)
  {
    uint64_t v11 = v13;
    char v12 = v14;
    char v10 = 13;
    char v9 = 3;
    char v8 = 2;
    uint64_t result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v11, &v10, &v9, &v8, 0, (uint64_t)&v13);
    uint64_t v6 = v14;
    uint64_t v7 = v15;
    *(void *)a3 = v13;
    *(void *)(a3 + 8) = v6;
    *(void *)(a3 + 16) = v7;
    *(void *)(a3 + 24) = 0;
    *(unsigned char *)(a3 + 32) = 4;
  }
  return result;
}

uint64_t sub_254EE2470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.FontSize.parse<A>(input:)(a1, a2, a3);
}

uint64_t sub_254EE2488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_254EE2610(a1, a2, (uint64_t (*)(void))sub_254EE24BC, (uint64_t)&type metadata for StyleSheet.Font.Weight, a3);
}

unint64_t sub_254EE24BC()
{
  unint64_t result = qword_269E70F20;
  if (!qword_269E70F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70F20);
  }
  return result;
}

uint64_t DeclarationParsers.FontWeight.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_254EE2610(a1, a2, (uint64_t (*)(void))sub_254EE24BC, (uint64_t)&type metadata for StyleSheet.Font.Weight, (uint64_t)&v13);
  if (!v3)
  {
    uint64_t v11 = 0;
    char v12 = -4;
    char v10 = v13;
    char v9 = 3;
    char v8 = 2;
    uint64_t result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v11, &v10, &v9, &v8, 0, (uint64_t)&v13);
    uint64_t v6 = v14;
    uint64_t v7 = v15;
    *(void *)a3 = v13;
    *(void *)(a3 + 8) = v6;
    *(void *)(a3 + 16) = v7;
    *(void *)(a3 + 24) = 0;
    *(unsigned char *)(a3 + 32) = 4;
  }
  return result;
}

uint64_t sub_254EE25C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.FontWeight.parse<A>(input:)(a1, a2, a3);
}

uint64_t sub_254EE25DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_254EE2610(a1, a2, (uint64_t (*)(void))sub_254EE26B8, (uint64_t)&type metadata for StyleSheet.Font.Style, a3);
}

uint64_t sub_254EE2610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v9 = a3();
  sub_254EE14E8(a4, a2, a4, v9, a5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
}

unint64_t sub_254EE26B8()
{
  unint64_t result = qword_269E70F28;
  if (!qword_269E70F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70F28);
  }
  return result;
}

uint64_t DeclarationParsers.FontStyle.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_254EE2610(a1, a2, (uint64_t (*)(void))sub_254EE26B8, (uint64_t)&type metadata for StyleSheet.Font.Style, (uint64_t)&v13);
  if (!v3)
  {
    uint64_t v11 = 0;
    char v12 = -4;
    char v10 = 13;
    char v9 = v13;
    char v8 = 2;
    uint64_t result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v11, &v10, &v9, &v8, 0, (uint64_t)&v13);
    uint64_t v6 = v14;
    uint64_t v7 = v15;
    *(void *)a3 = v13;
    *(void *)(a3 + 8) = v6;
    *(void *)(a3 + 16) = v7;
    *(void *)(a3 + 24) = 0;
    *(unsigned char *)(a3 + 32) = 4;
  }
  return result;
}

uint64_t sub_254EE27C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.FontStyle.parse<A>(input:)(a1, a2, a3);
}

uint64_t sub_254EE27D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6 = sub_254EE287C();
  sub_254EE14E8((uint64_t)&type metadata for StyleSheet.Font.Variant, a2, (uint64_t)&type metadata for StyleSheet.Font.Variant, v6, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
}

unint64_t sub_254EE287C()
{
  unint64_t result = qword_269E70F30;
  if (!qword_269E70F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70F30);
  }
  return result;
}

uint64_t DeclarationParsers.FontVariant.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_254EE27D8(a1, a2, (uint64_t)&v13);
  if (!v3)
  {
    uint64_t v11 = 0;
    char v12 = -4;
    char v10 = 13;
    char v9 = 3;
    char v8 = v13;
    uint64_t result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v11, &v10, &v9, &v8, 0, (uint64_t)&v13);
    uint64_t v6 = v14;
    uint64_t v7 = v15;
    *(void *)a3 = v13;
    *(void *)(a3 + 8) = v6;
    *(void *)(a3 + 16) = v7;
    *(void *)(a3 + 24) = 0;
    *(unsigned char *)(a3 + 32) = 4;
  }
  return result;
}

uint64_t sub_254EE2968@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.FontVariant.parse<A>(input:)(a1, a2, a3);
}

char *sub_254EE2980()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  char v2 = (char *)&v18 - v1;
  uint64_t v22 = 0;
  unint64_t v23 = 0xE000000000000000;
  sub_254EFCD50();
  swift_getAssociatedConformanceWitness();
  sub_254EFCE80();
  uint64_t v3 = v21;
  if (!v21)
  {
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_24;
  }
  uint64_t v4 = v20;
  uint64_t v5 = (char *)MEMORY[0x263F8EE78];
  do
  {
    char v6 = 1;
    while (1)
    {
      if (v4 == 34 && v3 == 0xE100000000000000 || (sub_254EFD140() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v6 ^= 1u;
        goto LABEL_13;
      }
      if (v6)
      {
        if (sub_254EFCB60())
        {
          swift_bridgeObjectRelease();
          char v6 = 1;
          goto LABEL_13;
        }
        if (v4 == 44 && v3 == 0xE100000000000000 || (sub_254EFD140() & 1) != 0) {
          break;
        }
      }
      MEMORY[0x25A281020](v4, v3);
      swift_bridgeObjectRelease();
LABEL_13:
      sub_254EFCE80();
      uint64_t v4 = v20;
      uint64_t v3 = v21;
      if (!v21) {
        goto LABEL_24;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v7 = v22;
    unint64_t v8 = v23;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v5 = sub_254EE4238(0, *((void *)v5 + 2) + 1, 1, v5);
    }
    unint64_t v10 = *((void *)v5 + 2);
    unint64_t v9 = *((void *)v5 + 3);
    if (v10 >= v9 >> 1) {
      uint64_t v5 = sub_254EE4238((char *)(v9 > 1), v10 + 1, 1, v5);
    }
    *((void *)v5 + 2) = v10 + 1;
    uint64_t v11 = &v5[16 * v10];
    *((void *)v11 + 4) = v7;
    *((void *)v11 + 5) = v8;
    uint64_t v22 = 0;
    unint64_t v23 = 0xE000000000000000;
    sub_254EFCE80();
    uint64_t v4 = v20;
    uint64_t v3 = v21;
  }
  while (v21);
LABEL_24:
  (*(void (**)(char *, uint64_t))(v19 + 8))(v2, AssociatedTypeWitness);
  uint64_t v12 = v22;
  unint64_t v13 = v23;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = sub_254EE4238(0, *((void *)v5 + 2) + 1, 1, v5);
  }
  unint64_t v15 = *((void *)v5 + 2);
  unint64_t v14 = *((void *)v5 + 3);
  if (v15 >= v14 >> 1) {
    uint64_t v5 = sub_254EE4238((char *)(v14 > 1), v15 + 1, 1, v5);
  }
  *((void *)v5 + 2) = v15 + 1;
  unint64_t v16 = &v5[16 * v15];
  *((void *)v16 + 4) = v12;
  *((void *)v16 + 5) = v13;
  return v5;
}

uint64_t DeclarationParsers.FontFamily.parse<A>(input:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = (uint64_t)sub_254EE2980();
  if (!v1)
  {
    uint64_t v9 = 0;
    char v10 = -4;
    char v8 = 13;
    char v7 = 3;
    char v6 = 2;
    uint64_t result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v9, &v8, &v7, &v6, result, (uint64_t)&v11);
    uint64_t v4 = v12;
    uint64_t v5 = v13;
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = v4;
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = 0;
    *(unsigned char *)(a1 + 32) = 4;
  }
  return result;
}

uint64_t sub_254EE2D60@<X0>(uint64_t a1@<X8>)
{
  return DeclarationParsers.FontFamily.parse<A>(input:)(a1);
}

uint64_t sub_254EE2D78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_254EFCB60();
  *a1 = result & 1;
  return result;
}

uint64_t DeclarationParsers.Font.parse<A>(input:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_254EFCD30();
  unint64_t v6 = v5;
  swift_bridgeObjectRetain();
  uint64_t v127 = sub_254EFCD30();
  unint64_t v128 = v7;
  sub_254EE496C();
  sub_254EFCD90();
  uint64_t v8 = LOBYTE(v125);
  if (LOBYTE(v125) == 6)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_254EFCD30();
    uint64_t v11 = v10;
    uint64_t v127 = 0;
    unint64_t v128 = 0xE000000000000000;
    sub_254EFCF20();
    swift_bridgeObjectRelease();
    sub_254EDF770();
    uint64_t v2 = swift_allocError();
    *(void *)uint64_t v12 = v9;
    *(void *)(v12 + 8) = v11;
    *(void *)(v12 + 16) = 0xD000000000000026;
    *(void *)(v12 + 24) = 0x8000000254F03380;
    *(unsigned char *)(v12 + 32) = 0;
    swift_willThrow();
  }
  if (!v2)
  {
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)a1 = v8;
    *(void *)(a1 + 8) = 0x8000000000000000;
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = 0;
    *(unsigned char *)(a1 + 32) = 4;
    return result;
  }
  uint64_t v103 = a1;
  MEMORY[0x25A2817A0](v2);
  swift_bridgeObjectRetain();
  uint64_t v112 = v4;
  unint64_t v13 = sub_254EE2044(0xFuLL, v4, v6);
  unint64_t v15 = v14;
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v17 = v13 >> 14;
  unint64_t v115 = v15 >> 14;
  if (v15 >> 14 < v13 >> 14)
  {
LABEL_109:
    __break(1u);
LABEL_110:
    __break(1u);
LABEL_111:
    __break(1u);
LABEL_112:
    __break(1u);
    return result;
  }
  unint64_t v18 = sub_254EFCE70();
  unint64_t v20 = v19;
  swift_getKeyPath();
  unint64_t v21 = v20 >> 14;
  if (v20 >> 14 == v18 >> 14)
  {
    swift_bridgeObjectRelease();
    swift_release();
    char v22 = 13;
    char v23 = 3;
    char v24 = 2;
    uint64_t v25 = v4;
    goto LABEL_55;
  }
  unint64_t v120 = v13;
  char v108 = 0;
  char v110 = 13;
  char v104 = 2;
  char v106 = 3;
  uint64_t v118 = 1;
  unint64_t v113 = v6;
  do
  {
    sub_254EFCE60();
    char v26 = sub_254EFCB60();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {
      unint64_t v27 = sub_254EFCE30();
      if (v21 == v27 >> 14) {
        break;
      }
      unint64_t v28 = v27;
      while (1)
      {
        sub_254EFCE60();
        char v29 = sub_254EFCB60();
        swift_bridgeObjectRelease();
        if (v29) {
          break;
        }
        unint64_t v28 = sub_254EFCE30();
        if (v21 == v28 >> 14)
        {
          unint64_t v6 = v113;
          goto LABEL_38;
        }
      }
      unint64_t v18 = v28;
      unint64_t v6 = v113;
    }
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    if (v17 > v18 >> 14)
    {
      __break(1u);
LABEL_108:
      __break(1u);
      goto LABEL_109;
    }
    unint64_t v32 = sub_254EFCE70();
    uint64_t v34 = v33;
    uint64_t v35 = v31;
    if (v33 == 0x6C616D726F6ELL && v31 == 0xE600000000000000 && !(v32 >> 16) && v30 >> 16 == 6
      || (sub_254EFD120() & 1) != 0)
    {
      unint64_t v36 = sub_254EFCE30();
      uint64_t result = swift_bridgeObjectRelease();
      char v108 = 1;
      goto LABEL_35;
    }
    if (v106 == 3)
    {
      uint64_t v129 = v34;
      uint64_t v130 = v35;
      sub_254EE433C();
      swift_bridgeObjectRetain_n();
      uint64_t v127 = sub_254EFCD30();
      unint64_t v128 = v37;
      sub_254EE26B8();
      sub_254EFCD90();
      if (LOBYTE(v125) != 3)
      {
        swift_bridgeObjectRelease();
        char v106 = LOBYTE(v125);
        goto LABEL_34;
      }
      uint64_t v129 = v34;
      uint64_t v130 = v35;
      swift_bridgeObjectRetain();
      sub_254EFCD30();
      uint64_t v127 = 0;
      unint64_t v128 = 0xE000000000000000;
      sub_254EFCF20();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if (v104 != 2) {
      goto LABEL_29;
    }
    uint64_t v129 = v34;
    uint64_t v130 = v35;
    sub_254EE433C();
    swift_bridgeObjectRetain_n();
    uint64_t v127 = sub_254EFCD30();
    unint64_t v128 = v38;
    sub_254EE287C();
    sub_254EFCD90();
    if (LOBYTE(v125) == 2)
    {
      uint64_t v129 = v34;
      uint64_t v130 = v35;
      swift_bridgeObjectRetain();
      sub_254EFCD30();
      uint64_t v127 = 0;
      unint64_t v128 = 0xE000000000000000;
      sub_254EFCF20();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_29:
      char v22 = v110;
      if (v110 != 13)
      {
        swift_bridgeObjectRelease();
        char v42 = v108;
        unint64_t v36 = v120;
        uint64_t v25 = v112;
        goto LABEL_43;
      }
      uint64_t v129 = v34;
      uint64_t v130 = v35;
      sub_254EE433C();
      swift_bridgeObjectRetain_n();
      uint64_t v127 = sub_254EFCD30();
      unint64_t v128 = v39;
      sub_254EE24BC();
      sub_254EFCD90();
      char v110 = LOBYTE(v125);
      if (LOBYTE(v125) == 13)
      {
        uint64_t v129 = v34;
        uint64_t v130 = v35;
        swift_bridgeObjectRetain();
        sub_254EFCD30();
        uint64_t v127 = 0;
        unint64_t v128 = 0xE000000000000000;
        sub_254EFCF20();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        char v42 = v108;
        unint64_t v36 = v120;
        uint64_t v25 = v112;
LABEL_40:
        if (v42) {
          char v22 = 0;
        }
        else {
          char v22 = 13;
        }
        goto LABEL_43;
      }
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
    char v104 = LOBYTE(v125);
LABEL_34:
    unint64_t v36 = sub_254EFCE30();
    uint64_t result = swift_bridgeObjectRelease();
LABEL_35:
    if (v118 == 3) {
      goto LABEL_39;
    }
    unint64_t v17 = v36 >> 14;
    if (v115 < v36 >> 14) {
      goto LABEL_108;
    }
    ++v118;
    unint64_t v120 = v36;
    unint64_t v18 = sub_254EFCE70();
    unint64_t v41 = v40;
    swift_getKeyPath();
    unint64_t v21 = v41 >> 14;
  }
  while (v41 >> 14 != v18 >> 14);
LABEL_38:
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v36 = v120;
LABEL_39:
  char v42 = v108;
  char v22 = v110;
  uint64_t v25 = v112;
  if (v110 == 13) {
    goto LABEL_40;
  }
LABEL_43:
  BOOL v43 = (v42 & 1) == 0;
  if (v42) {
    char v23 = 0;
  }
  else {
    char v23 = 3;
  }
  if (v43) {
    char v44 = 2;
  }
  else {
    char v44 = 0;
  }
  if (v106 != 3) {
    char v23 = v106;
  }
  if (v104 == 2) {
    char v24 = v44;
  }
  else {
    char v24 = v104;
  }
  unint64_t v13 = v36;
LABEL_55:
  char v109 = v24;
  char v111 = v22;
  char v116 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  unint64_t v45 = sub_254EE2044(v13, v25, v6);
  unint64_t v47 = v46;
  unint64_t v114 = v6;
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v117 = v47 >> 14;
  if (v47 >> 14 < v45 >> 14) {
    goto LABEL_110;
  }
  unint64_t v48 = sub_254EFCE70();
  unint64_t v50 = v49 >> 14;
  unint64_t v119 = v47;
  if (v49 >> 14 == v48 >> 14)
  {
    unint64_t v51 = 0;
    char v121 = 1;
    goto LABEL_72;
  }
  unint64_t v51 = v48;
  if (sub_254EFCE60() == 47 && v52 == 0xE100000000000000)
  {
LABEL_60:
    swift_bridgeObjectRelease();
    char v121 = 0;
  }
  else
  {
    char v53 = sub_254EFD140();
    swift_bridgeObjectRelease();
    char v121 = 0;
    if ((v53 & 1) == 0)
    {
      unint64_t v54 = sub_254EFCE30();
      if (v50 != v54 >> 14)
      {
        unint64_t v55 = v54;
        while (sub_254EFCE60() != 47 || v56 != 0xE100000000000000)
        {
          char v57 = sub_254EFD140();
          swift_bridgeObjectRelease();
          if (v57) {
            goto LABEL_70;
          }
          unint64_t v55 = sub_254EFCE30();
          if (v50 == v55 >> 14)
          {
            unint64_t v55 = 0;
LABEL_70:
            char v121 = v57 ^ 1;
            unint64_t v51 = v55;
            goto LABEL_71;
          }
        }
        unint64_t v51 = v55;
        unint64_t v47 = v119;
        goto LABEL_60;
      }
      unint64_t v51 = 0;
      char v121 = 1;
    }
LABEL_71:
    unint64_t v47 = v119;
  }
LABEL_72:
  swift_bridgeObjectRelease();
  unint64_t v58 = sub_254EFCE70();
  unint64_t v60 = v59 >> 14;
  if (v59 >> 14 == v58 >> 14)
  {
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v61 = v47;
    unint64_t v62 = v47;
LABEL_78:
    unint64_t v64 = v117;
  }
  else
  {
    unint64_t v61 = v58;
    while (1)
    {
      sub_254EFCE60();
      char v63 = sub_254EFCB60();
      swift_bridgeObjectRelease();
      if (v63) {
        break;
      }
      unint64_t v61 = sub_254EFCE30();
      if (v60 == v61 >> 14)
      {
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v62 = v119;
        unint64_t v61 = v119;
        goto LABEL_78;
      }
    }
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v64 = v61 >> 14;
    unint64_t v62 = v119;
  }
  if (v121) {
    unint64_t v65 = v62;
  }
  else {
    unint64_t v65 = v51;
  }
  if (v64 >= v65 >> 14) {
    unint64_t v66 = v65;
  }
  else {
    unint64_t v66 = v61;
  }
  if (v45 >> 14 > v66 >> 14) {
    goto LABEL_111;
  }
  sub_254EFCE70();
  uint64_t v129 = v67;
  uint64_t v130 = v68;
  sub_254EE433C();
  swift_bridgeObjectRetain();
  uint64_t v69 = sub_254EFCD30();
  unint64_t v71 = v70;
  swift_bridgeObjectRetain();
  uint64_t v127 = sub_254EFCD30();
  unint64_t v128 = v72;
  sub_254EE232C();
  sub_254EFCD90();
  *(void *)&double v73 = LOBYTE(v125);
  if (LOBYTE(v125) != 7)
  {
    uint64_t v79 = 0;
    unint64_t v80 = v114;
    goto LABEL_91;
  }
  swift_bridgeObjectRetain();
  uint64_t v74 = sub_254EFCD30();
  uint64_t v76 = v75;
  uint64_t v127 = 0;
  unint64_t v128 = 0xE000000000000000;
  sub_254EFCF20();
  swift_bridgeObjectRelease();
  sub_254EDF770();
  uint64_t v77 = swift_allocError();
  *(void *)uint64_t v78 = v74;
  *(void *)(v78 + 8) = v76;
  *(void *)(v78 + 16) = 0xD000000000000028;
  *(void *)(v78 + 24) = 0x8000000254F03350;
  *(unsigned char *)(v78 + 32) = 0;
  swift_willThrow();
  uint64_t v79 = v77;
  unint64_t v80 = v114;
  if (!v77)
  {
LABEL_91:
    swift_bridgeObjectRelease();
    char v81 = 0x80;
    goto LABEL_92;
  }
  MEMORY[0x25A2817A0](v77);
  uint64_t v79 = 0;
  double v94 = sub_254EE1860((unint64_t *)&v127, v69, v71);
  swift_bridgeObjectRelease();
  unint64_t v95 = v128;
  uint64_t v97 = v129;
  uint64_t v96 = v130;
  unint64_t v107 = v127;
  swift_bridgeObjectRetain();
  uint64_t v127 = sub_254EFCD30();
  unint64_t v128 = v98;
  sub_254EE2380();
  sub_254EFCD90();
  char v105 = LOBYTE(v125);
  if (LOBYTE(v125) == 4)
  {
    uint64_t v127 = v107;
    unint64_t v128 = v95;
    uint64_t v129 = v97;
    uint64_t v130 = v96;
    swift_bridgeObjectRetain();
    uint64_t v99 = sub_254EFCD30();
    uint64_t v101 = v100;
    uint64_t v127 = 0;
    unint64_t v128 = 0xE000000000000000;
    sub_254EFCF20();
    swift_bridgeObjectRelease();
    sub_254EDF770();
    uint64_t v79 = swift_allocError();
    *(void *)uint64_t v102 = v99;
    *(void *)(v102 + 8) = v101;
    *(void *)(v102 + 16) = 0xD000000000000024;
    *(void *)(v102 + 24) = 0x8000000254F032A0;
    *(unsigned char *)(v102 + 32) = 0;
    swift_willThrow();
  }
  unint64_t v80 = v114;
  if (!v79)
  {
    swift_bridgeObjectRelease();
    double v73 = v94;
    char v81 = v105;
LABEL_92:
    uint64_t v82 = sub_254EFCE30();
    swift_bridgeObjectRelease();
    if (v79) {
      goto LABEL_102;
    }
    char v83 = v81;
    swift_bridgeObjectRelease();
    if (v121) {
      unint64_t v84 = v82;
    }
    else {
      unint64_t v84 = v61;
    }
    unint64_t v85 = sub_254EE2044(v84, v112, v80);
    unint64_t v87 = v86;
    uint64_t result = swift_bridgeObjectRelease();
    if (v87 >> 14 >= v85 >> 14)
    {
      uint64_t v127 = sub_254EFCE70();
      unint64_t v128 = v88;
      uint64_t v129 = v89;
      uint64_t v130 = v90;
      swift_bridgeObjectRetain();
      sub_254EFCD30();
      v91 = sub_254EE4390();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      double v125 = v73;
      char v126 = v83;
      char v124 = v111;
      char v123 = v116;
      char v122 = v109;
      uint64_t result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v125, &v124, &v123, &v122, (uint64_t)v91, (uint64_t)&v127);
      uint64_t v92 = v128;
      uint64_t v93 = v129;
      *(void *)uint64_t v103 = v127;
      *(void *)(v103 + 8) = v92;
      *(void *)(v103 + 16) = v93;
      *(void *)(v103 + 24) = 0;
      *(unsigned char *)(v103 + 32) = 4;
      return result;
    }
    goto LABEL_112;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_102:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_254EE3D0C@<X0>(uint64_t a1@<X8>)
{
  return DeclarationParsers.Font.parse<A>(input:)(a1);
}

uint64_t DeclarationParsers.Color.parse<A>(input:)@<X0>(int8x8_t *a1@<X8>)
{
  uint64_t result = sub_254EE4B24(&v5);
  if (!v1)
  {
    int8x8_t v4 = (int8x8_t)v6;
    *a1 = v5;
    a1[1] = v4;
    a1[2] = 0;
    a1[3] = 0;
    a1[4].i8[0] = 1;
  }
  return result;
}

uint64_t sub_254EE3D74@<X0>(int8x8_t *a1@<X8>)
{
  return DeclarationParsers.Color.parse<A>(input:)(a1);
}

uint64_t DeclarationParsers.BackgroundColor.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v9 = (int8x8_t)0x726170736E617274;
  unint64_t v10 = 0xEB00000000746E65;
  sub_254EE0A3C();
  if (sub_254EFCEE0())
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
    *(_OWORD *)a3 = xmmword_254EFDF20;
  }
  else
  {
    uint64_t result = sub_254EE4B24(&v9);
    if (v3) {
      return result;
    }
    uint64_t v8 = v10;
    *(int8x8_t *)a3 = v9;
    *(void *)(a3 + 8) = v8;
  }
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(unsigned char *)(a3 + 32) = 2;
  return result;
}

uint64_t sub_254EE3E98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.BackgroundColor.parse<A>(input:)(a1, a2, a3);
}

uint64_t DeclarationParsers.BackgroundImage.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v29 = *(void *)(a3 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v25 - v11;
  uint64_t v31 = 1701736302;
  unint64_t v32 = 0xE400000000000000;
  sub_254EE0A3C();
  if (sub_254EFCEE0())
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
    *(_OWORD *)a4 = 0u;
    *((_OWORD *)a4 + 1) = 0u;
LABEL_6:
    *((unsigned char *)a4 + 32) = 5;
    return result;
  }
  char v26 = v10;
  unint64_t v27 = v12;
  unint64_t v28 = a4;
  if (sub_254EFCEC0() & 1) != 0 && (sub_254EFCED0())
  {
    sub_254EFCC60();
    unint64_t v14 = v26;
    sub_254EFCDF0();
    sub_254EFCC60();
    uint64_t v15 = AssociatedTypeWitness;
    swift_getAssociatedConformanceWitness();
    unint64_t v16 = v27;
    sub_254EFCB90();
    uint64_t v17 = v30;
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v14, v16, v15);
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t v18 = sub_254EFCD30();
    uint64_t v20 = v19;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v16, v15);
    a4 = v28;
    *unint64_t v28 = v18;
    a4[1] = v20;
    a4[2] = 0;
    a4[3] = 0;
    goto LABEL_6;
  }
  uint64_t v21 = sub_254EFCD30();
  uint64_t v23 = v22;
  sub_254EDF770();
  swift_allocError();
  *(void *)uint64_t v24 = v21;
  *(void *)(v24 + 8) = v23;
  *(void *)(v24 + 16) = 0xD000000000000058;
  *(void *)(v24 + 24) = 0x8000000254F03240;
  *(unsigned char *)(v24 + 32) = 0;
  return swift_willThrow();
}

uint64_t sub_254EE4220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return DeclarationParsers.BackgroundImage.parse<A>(input:)(a1, a2, a3, a4);
}

char *sub_254EE4238(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F48);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_254EE433C()
{
  unint64_t result = qword_269E70F38;
  if (!qword_269E70F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70F38);
  }
  return result;
}

char *sub_254EE4390()
{
  uint64_t v0 = sub_254EFCCB0();
  if (!v1)
  {
    int8x8_t v4 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_24;
  }
  uint64_t v2 = v0;
  uint64_t v3 = v1;
  int8x8_t v4 = (char *)MEMORY[0x263F8EE78];
  do
  {
    char v5 = 1;
    while (1)
    {
      if (v2 == 34 && v3 == 0xE100000000000000 || (sub_254EFD140() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 ^= 1u;
        goto LABEL_13;
      }
      if (v5)
      {
        if (sub_254EFCB60())
        {
          swift_bridgeObjectRelease();
          char v5 = 1;
          goto LABEL_13;
        }
        if (v2 == 44 && v3 == 0xE100000000000000 || (sub_254EFD140() & 1) != 0) {
          break;
        }
      }
      MEMORY[0x25A281020](v2, v3);
      swift_bridgeObjectRelease();
LABEL_13:
      uint64_t v2 = sub_254EFCCB0();
      uint64_t v3 = v6;
      if (!v6) {
        goto LABEL_24;
      }
    }
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int8x8_t v4 = sub_254EE4238(0, *((void *)v4 + 2) + 1, 1, v4);
    }
    unint64_t v8 = *((void *)v4 + 2);
    unint64_t v7 = *((void *)v4 + 3);
    if (v8 >= v7 >> 1) {
      int8x8_t v4 = sub_254EE4238((char *)(v7 > 1), v8 + 1, 1, v4);
    }
    *((void *)v4 + 2) = v8 + 1;
    uint64_t v9 = &v4[16 * v8];
    *((void *)v9 + 4) = 0;
    *((void *)v9 + 5) = 0xE000000000000000;
    uint64_t v2 = sub_254EFCCB0();
    uint64_t v3 = v10;
  }
  while (v10);
LABEL_24:
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    int8x8_t v4 = sub_254EE4238(0, *((void *)v4 + 2) + 1, 1, v4);
  }
  unint64_t v12 = *((void *)v4 + 2);
  unint64_t v11 = *((void *)v4 + 3);
  if (v12 >= v11 >> 1) {
    int8x8_t v4 = sub_254EE4238((char *)(v11 > 1), v12 + 1, 1, v4);
  }
  *((void *)v4 + 2) = v12 + 1;
  unint64_t v13 = &v4[16 * v12];
  *((void *)v13 + 4) = 0;
  *((void *)v13 + 5) = 0xE000000000000000;
  return v4;
}

uint64_t dispatch thunk of DeclarationParser.parse<A>(input:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t initializeWithCopy for AnyDeclarationParser(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for AnyDeclarationParser(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t assignWithTake for AnyDeclarationParser(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyDeclarationParser(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyDeclarationParser(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyDeclarationParser()
{
  return &type metadata for AnyDeclarationParser;
}

ValueMetadata *type metadata accessor for DeclarationParsers()
{
  return &type metadata for DeclarationParsers;
}

void *initializeBufferWithCopyOfBuffer for DeclarationParsers.Default(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DeclarationParsers.Default()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for DeclarationParsers.Default(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for DeclarationParsers.Default(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeclarationParsers.Default(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeclarationParsers.Default(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeclarationParsers.Default()
{
  return &type metadata for DeclarationParsers.Default;
}

ValueMetadata *type metadata accessor for DeclarationParsers.TextAlign()
{
  return &type metadata for DeclarationParsers.TextAlign;
}

ValueMetadata *type metadata accessor for DeclarationParsers.FontSize()
{
  return &type metadata for DeclarationParsers.FontSize;
}

ValueMetadata *type metadata accessor for DeclarationParsers.FontWeight()
{
  return &type metadata for DeclarationParsers.FontWeight;
}

ValueMetadata *type metadata accessor for DeclarationParsers.FontStyle()
{
  return &type metadata for DeclarationParsers.FontStyle;
}

ValueMetadata *type metadata accessor for DeclarationParsers.FontVariant()
{
  return &type metadata for DeclarationParsers.FontVariant;
}

ValueMetadata *type metadata accessor for DeclarationParsers.FontFamily()
{
  return &type metadata for DeclarationParsers.FontFamily;
}

ValueMetadata *type metadata accessor for DeclarationParsers.Font()
{
  return &type metadata for DeclarationParsers.Font;
}

ValueMetadata *type metadata accessor for DeclarationParsers.Color()
{
  return &type metadata for DeclarationParsers.Color;
}

ValueMetadata *type metadata accessor for DeclarationParsers.BackgroundColor()
{
  return &type metadata for DeclarationParsers.BackgroundColor;
}

ValueMetadata *type metadata accessor for DeclarationParsers.BackgroundImage()
{
  return &type metadata for DeclarationParsers.BackgroundImage;
}

unint64_t sub_254EE496C()
{
  unint64_t result = qword_269E70F40;
  if (!qword_269E70F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70F40);
  }
  return result;
}

uint64_t sub_254EE49C0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_254EE4A08(uint64_t *a1@<X8>)
{
  unint64_t v2 = v1[2];
  if (v2 >> 60 != 10) {
    goto LABEL_24;
  }
  uint64_t v3 = v1[5];
  uint64_t v4 = *v1;
  uint64_t v5 = v1[3] | v1[4] | v1[1];
  unint64_t v6 = 0xA000000000000000;
  if (v3) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v2 == 0xA000000000000000;
  }
  if (!v7 || v4 != 15 || v5 != 0)
  {
    if (!v3 && v2 == 0xA000000000000000 && v4 == 17 && !v5)
    {
      uint64_t v10 = 18;
      goto LABEL_25;
    }
    if (!v3 && v2 == 0xA000000000000000 && v4 == 19 && !v5)
    {
      uint64_t v10 = 20;
      goto LABEL_25;
    }
LABEL_24:
    uint64_t v10 = 0;
    unint64_t v6 = 0x1FFFFFFFELL;
    goto LABEL_25;
  }
  uint64_t v10 = 16;
LABEL_25:
  *a1 = v10;
  a1[1] = 0;
  a1[2] = v6;
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
}

BOOL sub_254EE4AA4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_254EE4AB4()
{
  return sub_254EFD1A0();
}

uint64_t sub_254EE4ADC()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EE4B24@<X0>(int8x8_t *a1@<X8>)
{
  uint64_t v3 = sub_254EFCD30();
  unint64_t v5 = v4;
  if (qword_269E71670 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_269E71678;
  if (*(void *)(qword_269E71678 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_254EE5638(v3, v5);
    if (v8)
    {
      uint64_t v9 = *(void *)(v6 + 56) + 12 * v7;
      __int32 v10 = *(_DWORD *)(v9 + 8);
      int8x8_t v11 = *(int8x8_t *)v9;
      uint64_t result = swift_bridgeObjectRelease_n();
      *a1 = v11;
      a1[1].i32[0] = v10;
      return result;
    }
    swift_bridgeObjectRelease();
  }
  if (sub_254EFCC60() >= 4)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_254EE5100(v3, v5);
    if (v14)
    {
      if (v13 == 35 && v14 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_25:
        swift_bridgeObjectRetain();
        unint64_t v43 = sub_254EE5BA8(1uLL, v3, v5);
        unint64_t v45 = v44;
        unint64_t v47 = v46;
        unint64_t v49 = v48;
        swift_bridgeObjectRelease();
        if ((v45 ^ v43) < 0x4000)
        {
LABEL_28:
          unint64_t v52 = 0xD00000000000002ELL;
          sub_254EE433C();
          swift_bridgeObjectRetain();
          uint64_t v53 = sub_254EFCD30();
          uint64_t v55 = v54;
          sub_254EDF770();
          swift_allocError();
          *(void *)uint64_t v56 = v53;
          char v57 = "Could not parse hex color: invalid hex number.";
LABEL_29:
          *(void *)(v56 + 8) = v55;
          *(void *)(v56 + 16) = v52;
          *(void *)(v56 + 24) = (unint64_t)(v57 - 32) | 0x8000000000000000;
          *(unsigned char *)(v56 + 32) = 0;
          swift_willThrow();
          goto LABEL_37;
        }
        uint64_t v50 = sub_254EE5AD4(v43, v45, v47, v49, 16);
        if ((v50 & 0x10000000000) != 0)
        {
          swift_bridgeObjectRetain();
          uint64_t v51 = sub_254EE59E0(v43, v45, v47, v49, 16);
          swift_bridgeObjectRelease();
          if ((v51 & 0x100000000) != 0) {
            goto LABEL_28;
          }
        }
        else
        {
          LODWORD(v51) = v50;
          if ((v50 & 0x100000000) != 0) {
            goto LABEL_28;
          }
        }
        if (sub_254EFCE50() == 6)
        {
          StyleSheet.Color.init(value:)(v51, a1);
          goto LABEL_37;
        }
        if (sub_254EFCE50() != 3)
        {
          sub_254EE433C();
          swift_bridgeObjectRetain();
          uint64_t v58 = sub_254EFCD30();
          uint64_t v55 = v59;
          sub_254EDF770();
          swift_allocError();
          *(void *)uint64_t v56 = v58;
          unint64_t v52 = 0xD00000000000003BLL;
          char v57 = "Could not parse hex color: hex color must be 3 or 6 digits.";
          goto LABEL_29;
        }
        uint64_t v64 = ((unsigned __int16)(v51 & 0xF00) >> 4) & 0xFFFFFFF0 | (v51 >> 8) & 0xF;
        LODWORD(v65) = v51 & 0xF0 | ((v51 & 0xF0) >> 4);
        LODWORD(v62) = v51 & 0xF | (16 * (v51 & 0xF));
        char v63 = a1;
LABEL_36:
        StyleSheet.Color.init(red:green:blue:)(v64, v65, v62, v63);
        goto LABEL_37;
      }
      char v16 = sub_254EFD140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v16) {
        goto LABEL_25;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_254EFCBD0();
  char v17 = sub_254EE5148();
  swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_254EFCD30();
    uint64_t v41 = v40;
    sub_254EDF770();
    swift_allocError();
    *(void *)uint64_t v42 = v39;
    *(void *)(v42 + 8) = v41;
    *(void *)(v42 + 16) = 0xD000000000000032;
    *(void *)(v42 + 24) = 0x8000000254F033F0;
    *(unsigned char *)(v42 + 32) = 0;
    swift_willThrow();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_254EE5BA8(4uLL, v3, v5);
  unint64_t v20 = v19;
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v21 = v20 >> 14;
  if (v20 >> 14 < v18 >> 14)
  {
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unint64_t v22 = sub_254EFCE70();
  uint64_t v26 = sub_254EE5C58(v22, v23, v24, v25, 44, 2);
  if (v1)
  {
    swift_bridgeObjectRelease();
LABEL_37:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  unint64_t v28 = v26;
  unint64_t v67 = v27;
  uint64_t result = swift_bridgeObjectRelease();
  if (v21 < v28 >> 14) {
    goto LABEL_40;
  }
  unint64_t v29 = sub_254EFCE70();
  unint64_t v33 = sub_254EE5C58(v29, v30, v31, v32, 44, v67 & 1);
  unint64_t v66 = v34;
  uint64_t result = swift_bridgeObjectRelease();
  if (v21 >= v33 >> 14)
  {
    unint64_t v35 = sub_254EFCE70();
    sub_254EE5C58(v35, v36, v37, v38, 41, v66 & 1);
    unint64_t v61 = v60;
    swift_bridgeObjectRelease();
    unint64_t v62 = HIDWORD(v61);
    char v63 = a1;
    uint64_t v64 = HIDWORD(v67);
    unint64_t v65 = HIDWORD(v66);
    goto LABEL_36;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_254EE5100(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2) {
    return sub_254EFCD20();
  }
  else {
    return 0;
  }
}

uint64_t sub_254EE5148()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_254EFCCB0();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      uint64_t v6 = sub_254EFCCB0();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v4 = sub_254EFD140();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      uint64_t v2 = sub_254EFCCB0();
      uint64_t v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_254EFCCB0();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  BOOL v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_254EE52B0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F78);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_254EFE120;
  *(void *)(inited + 32) = 0x6E6F6F72616DLL;
  *(void *)(inited + 40) = 0xE600000000000000;
  StyleSheet.Color.init(value:)(0x800000u, (int8x8_t *)(inited + 48));
  *(void *)(inited + 64) = 6579570;
  *(void *)(inited + 72) = 0xE300000000000000;
  StyleSheet.Color.init(value:)(0xFF0000u, (int8x8_t *)(inited + 80));
  *(void *)(inited + 96) = 0x65676E61726FLL;
  *(void *)(inited + 104) = 0xE600000000000000;
  StyleSheet.Color.init(value:)(0xFFA500u, (int8x8_t *)(inited + 112));
  *(void *)(inited + 128) = 0x776F6C6C6579;
  *(void *)(inited + 136) = 0xE600000000000000;
  StyleSheet.Color.init(value:)(0xFFFF00u, (int8x8_t *)(inited + 144));
  *(void *)(inited + 160) = 0x6576696C6FLL;
  *(void *)(inited + 168) = 0xE500000000000000;
  StyleSheet.Color.init(value:)(0x808000u, (int8x8_t *)(inited + 176));
  *(void *)(inited + 192) = 0x656C70727570;
  *(void *)(inited + 200) = 0xE600000000000000;
  StyleSheet.Color.init(value:)(0x800080u, (int8x8_t *)(inited + 208));
  *(void *)(inited + 224) = 0x61697368637566;
  *(void *)(inited + 232) = 0xE700000000000000;
  StyleSheet.Color.init(value:)(0xFF00FFu, (int8x8_t *)(inited + 240));
  *(void *)(inited + 256) = 0x6574696877;
  *(void *)(inited + 264) = 0xE500000000000000;
  StyleSheet.Color.init(value:)(0xFFFFFFu, (int8x8_t *)(inited + 272));
  *(void *)(inited + 288) = 1701669228;
  *(void *)(inited + 296) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0xFF00u, (int8x8_t *)(inited + 304));
  *(void *)(inited + 320) = 0x6E65657267;
  *(void *)(inited + 328) = 0xE500000000000000;
  StyleSheet.Color.init(value:)(0x8000u, (int8x8_t *)(inited + 336));
  *(void *)(inited + 352) = 2037801326;
  *(void *)(inited + 360) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0x80u, (int8x8_t *)(inited + 368));
  *(void *)(inited + 384) = 1702194274;
  *(void *)(inited + 392) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0xFFu, (int8x8_t *)(inited + 400));
  *(void *)(inited + 416) = 1818322292;
  *(void *)(inited + 424) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0x8080u, (int8x8_t *)(inited + 432));
  *(void *)(inited + 448) = 1635086689;
  *(void *)(inited + 456) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0xFFFFu, (int8x8_t *)(inited + 464));
  *(void *)(inited + 480) = 0x6B63616C62;
  *(void *)(inited + 488) = 0xE500000000000000;
  StyleSheet.Color.init(value:)(0, (int8x8_t *)(inited + 496));
  *(void *)(inited + 512) = 0x7265766C6973;
  *(void *)(inited + 520) = 0xE600000000000000;
  StyleSheet.Color.init(value:)(0xC0C0C0u, (int8x8_t *)(inited + 528));
  *(void *)(inited + 544) = 2036429415;
  *(void *)(inited + 552) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0x808080u, (int8x8_t *)(inited + 560));
  unint64_t result = sub_254EE550C(inited);
  qword_269E71678 = result;
  return result;
}

unint64_t sub_254EE550C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F80);
  uint64_t v2 = (void *)sub_254EFCFF0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  char v4 = (_DWORD *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 3);
    uint64_t v6 = *((void *)v4 - 2);
    uint64_t v7 = *((void *)v4 - 1);
    int v8 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_254EE5638(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    int8x8_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *int8x8_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = v2[7] + 12 * result;
    *(void *)uint64_t v12 = v7;
    *(_DWORD *)(v12 + 8) = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 8;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_254EE5638(uint64_t a1, uint64_t a2)
{
  sub_254EFD190();
  sub_254EFCC50();
  uint64_t v4 = sub_254EFD1B0();

  return sub_254EE581C(a1, a2, v4);
}

unint64_t sub_254EE56B4()
{
  unint64_t result = qword_269E70F70;
  if (!qword_269E70F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70F70);
  }
  return result;
}

ValueMetadata *_s9BaseColorVMa()
{
  return &_s9BaseColorVN;
}

unsigned char *_s9BaseColorV28ColorComponentRepresentationOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254EE57E4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *_s9BaseColorV28ColorComponentRepresentationOMa()
{
  return &_s9BaseColorV28ColorComponentRepresentationON;
}

unint64_t sub_254EE581C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_254EFD140() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_254EFD140() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_254EE5900(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_254EDCF78(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      unsigned int v5 = sub_254EFCF10();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0) {
        sub_254EFCF60();
      }
      unsigned int v5 = sub_254EFCF70();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t sub_254EE59E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_254EE433C();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_254EFCD30();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_254EDF14C();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = (unsigned __int8 *)sub_254EFCF60();
  }
LABEL_7:
  uint64_t v13 = sub_254EDEECC(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13 | ((((unint64_t)v13 >> 32) & 1) << 32);
}

uint64_t sub_254EE5AD4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    LODWORD(result) = 0;
    unsigned __int8 v14 = 0;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v13[0] = a3;
    v13[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v11 = v13;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    unint64_t v11 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    unint64_t v11 = (void *)sub_254EFCF60();
  }
  uint64_t result = sub_254EE6FE4((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    unsigned __int8 v14 = BYTE4(result) & 1;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  return result;
}

unint64_t sub_254EE5BA8(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  uint64_t result = sub_254EFCC80();
  if (v6) {
    uint64_t result = v5;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_14;
  }

  return sub_254EFCD40();
}

uint64_t sub_254EE5C58(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  unint64_t v124 = a2 >> 14;
  if (a2 >> 14 < a1 >> 14)
  {
    __break(1u);
LABEL_82:
    swift_bridgeObjectRelease();
LABEL_83:
    swift_bridgeObjectRelease();
    unint64_t v48 = v6 >> 14;
    if (v6 >> 14 != v124)
    {
      double v28 = 255.0;
      goto LABEL_86;
    }
    goto LABEL_84;
  }
  char v123 = a6;
  uint64_t v122 = a5;
  unint64_t v7 = sub_254EFCE70();
  unint64_t v9 = v8 >> 14;
  unint64_t v10 = v7 >> 14;
  if (v7 >> 14 == v8 >> 14) {
    goto LABEL_8;
  }
  unint64_t v6 = v7;
  sub_254EFCE60();
  char v11 = sub_254EFCB60();
  swift_bridgeObjectRelease();
  if (v11)
  {
    unint64_t v12 = sub_254EFCE30();
    if (v9 == v12 >> 14)
    {
LABEL_8:
      swift_bridgeObjectRelease();
LABEL_9:
      sub_254EE433C();
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_254EFCD30();
      uint64_t v17 = v16;
      sub_254EDF770();
      swift_allocError();
      *(void *)uint64_t v18 = v15;
      *(void *)(v18 + 8) = v17;
      unint64_t v19 = "Could not parse color component: current element is at end or not a digit.";
      unint64_t v20 = 0xD00000000000004ALL;
      goto LABEL_10;
    }
    unint64_t v13 = v12;
    while (1)
    {
      sub_254EFCE60();
      char v14 = sub_254EFCB60();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        break;
      }
      unint64_t v13 = sub_254EFCE30();
      if (v9 == v13 >> 14) {
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v10 = v13 >> 14;
    unint64_t v6 = v13;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (v10 == v124) {
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  if (sub_254EFCE60() == 45 && v22 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v23 = sub_254EFD140();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      char v25 = 0;
      goto LABEL_22;
    }
  }
  unint64_t v24 = sub_254EFCE30();
  if (v124 == v24 >> 14) {
    goto LABEL_9;
  }
  unint64_t v6 = v24;
  char v25 = 1;
LABEL_22:
  char v121 = v25;
  swift_bridgeObjectRetain();
  sub_254EFCE60();
  __int16 v26 = sub_254EFCB50();
  swift_bridgeObjectRelease();
  if ((v26 & 0x100) != 0) {
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  sub_254EFCE60();
  char v27 = sub_254EFCB80();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  if ((v27 & 1) == 0) {
    goto LABEL_9;
  }
  if (v124 == v6 >> 14) {
    goto LABEL_84;
  }
  double v28 = 0.0;
  while (1)
  {
    swift_bridgeObjectRetain();
    unint64_t v30 = sub_254EFCE60();
    unint64_t v31 = v29;
    if (v30 == 2573 && v29 == 0xE200000000000000 || (sub_254EFD140() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      unint64_t v32 = a2;
      goto LABEL_36;
    }
    if ((sub_254EFCB70() & 1) == 0) {
      goto LABEL_65;
    }
    uint64_t result = sub_254EE5900(v30, v31);
    if ((result & 0x100000000) != 0) {
      goto LABEL_182;
    }
    if ((result & 0xFFFFFF80) != 0)
    {
LABEL_65:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_66:
      unint64_t v48 = v6 >> 14;
      if (v6 >> 14 != v124)
      {
LABEL_86:
        if ((v123 & 1) == 0)
        {
LABEL_87:
          if (sub_254EFCE60() == 46 && v60 == 0xE100000000000000)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v62 = sub_254EFD140();
            swift_bridgeObjectRelease();
            if ((v62 & 1) == 0) {
              goto LABEL_136;
            }
          }
          if (v124 >= v48)
          {
            unint64_t v64 = sub_254EFCE70();
            unint64_t v65 = v63 >> 14;
            if (v64 >> 14 == v63 >> 14) {
              goto LABEL_119;
            }
            uint64_t v120 = v63;
            if (sub_254EFCE60() == 37 && v71 == 0xE100000000000000)
            {
              swift_bridgeObjectRelease();
              goto LABEL_119;
            }
            char v72 = sub_254EFD140();
            swift_bridgeObjectRelease();
            if (v72) {
              goto LABEL_119;
            }
            unint64_t v119 = v64 >> 14;
            unint64_t v74 = (unint64_t)sub_254EFCE30() >> 14;
            if (v74 == v65)
            {
LABEL_116:
              unint64_t v74 = v65;
            }
            else
            {
              while (1)
              {
                swift_bridgeObjectRetain();
                uint64_t v75 = sub_254EFCE60();
                uint64_t v77 = v76;
                swift_bridgeObjectRelease();
                if (v75 == 37 && v77 == 0xE100000000000000) {
                  break;
                }
                char v78 = sub_254EFD140();
                swift_bridgeObjectRelease();
                if (v78) {
                  goto LABEL_118;
                }
                unint64_t v74 = (unint64_t)sub_254EFCE30() >> 14;
                if (v74 == v65) {
                  goto LABEL_116;
                }
              }
              swift_bridgeObjectRelease();
            }
LABEL_118:
            if (v74 >= v119)
            {
LABEL_119:
              uint64_t v79 = sub_254EFCE70();
              uint64_t v81 = v80;
              uint64_t v83 = v82;
              uint64_t v85 = v84;
              swift_bridgeObjectRelease();
              uint64_t v120 = sub_254EFCE50();
              double v127 = 0.0;
              MEMORY[0x270FA5388](v120);
              swift_bridgeObjectRetain();
              uint64_t v86 = MEMORY[0x25A280F70](v79, v81, v83, v85);
              uint64_t v88 = v87;
              if ((v87 & 0x1000000000000000) == 0 && v87 & 0x2000000000000000 | v86 & 0x1000000000000000)
              {
                MEMORY[0x270FA5388](v86);
                if ((v88 & 0x2000000000000000) != 0)
                {
                  if v89 < 0x21u && ((0x100003E01uLL >> v89))
                  {
                    BOOL v93 = 0;
                  }
                  else
                  {
                    uint64_t v92 = (unsigned char *)_swift_stdlib_strtod_clocale();
                    if (v92) {
                      BOOL v93 = *v92 == 0;
                    }
                    else {
                      BOOL v93 = 0;
                    }
                  }
                  char v126 = v93;
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  goto LABEL_133;
                }
                if ((v89 & 0x1000000000000000) == 0) {
                  goto LABEL_180;
                }
                uint64_t v90 = (v88 & 0xFFFFFFFFFFFFFFFLL) + 32;
                uint64_t v91 = v89 & 0xFFFFFFFFFFFFLL;
                goto LABEL_124;
              }
              goto LABEL_175;
            }
LABEL_178:
            __break(1u);
            goto LABEL_179;
          }
LABEL_177:
          __break(1u);
          goto LABEL_178;
        }
        swift_bridgeObjectRetain();
        if (sub_254EFCE60() == 46 && v61 == 0xE100000000000000)
        {
          swift_bridgeObjectRelease();
          goto LABEL_101;
        }
        char v66 = sub_254EFD140();
        swift_bridgeObjectRelease();
        if (v66)
        {
LABEL_101:
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRetain();
          if (sub_254EFCE60() == 37 && v67 == 0xE100000000000000)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_101;
          }
          char v73 = sub_254EFD140();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          if ((v73 & 1) == 0) {
            goto LABEL_87;
          }
        }
        sub_254EE433C();
        swift_bridgeObjectRetain();
        uint64_t v68 = sub_254EFCD30();
        uint64_t v70 = v69;
        sub_254EDF770();
        swift_allocError();
        *(void *)uint64_t v18 = v68;
        *(void *)(v18 + 8) = v70;
        unint64_t v19 = "Could not parse color component: number components must be whole numbers.";
        unint64_t v20 = 0xD000000000000049;
LABEL_10:
        *(void *)(v18 + 16) = v20;
        *(void *)(v18 + 24) = (unint64_t)(v19 - 32) | 0x8000000000000000;
LABEL_11:
        *(unsigned char *)(v18 + 32) = 0;
        return swift_willThrow();
      }
LABEL_84:
      sub_254EE433C();
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_254EFCD30();
      uint64_t v59 = v58;
      sub_254EDF770();
      swift_allocError();
      *(void *)uint64_t v18 = v57;
      *(void *)(v18 + 8) = v59;
      *(void *)(v18 + 16) = 0xD000000000000039;
      *(void *)(v18 + 24) = 0x8000000254F03630;
      goto LABEL_11;
    }
    uint64_t result = sub_254EE5900(v30, v31);
    if ((result & 0x100000000) != 0) {
      goto LABEL_183;
    }
    int v33 = result;
    swift_bridgeObjectRelease();
    unint64_t v32 = a2;
    if ((v33 & 0xFFFFFF00) != 0) {
      break;
    }
LABEL_36:
    swift_bridgeObjectRetain();
    sub_254EFCE60();
    char v34 = sub_254EFCB80();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    if ((v34 & 1) == 0) {
      goto LABEL_66;
    }
    uint64_t v35 = sub_254EFCE60();
    uint64_t v37 = v36;
    double v127 = 0.0;
    MEMORY[0x270FA5388](v35);
    if ((v37 & 0x1000000000000000) != 0 || !(v37 & 0x2000000000000000 | v38 & 0x1000000000000000))
    {
      sub_254EFCEF0();
LABEL_52:
      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_55;
    }
    if ((v37 & 0x2000000000000000) == 0)
    {
      if ((v38 & 0x1000000000000000) != 0) {
        uint64_t v39 = (unsigned __int8 *)((v37 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v39 = (unsigned __int8 *)sub_254EFCF60();
      }
      unint64_t v40 = *v39;
      BOOL v42 = (v40 >= 0x21 || ((0x100003E01uLL >> v40) & 1) == 0)
         && (uint64_t v41 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
         && *v41 == 0;
      char v126 = v42;
      goto LABEL_52;
    }
    BOOL v44 = (v38 > 0x20u || ((0x100003E01uLL >> v38) & 1) == 0)
       && (unint64_t v43 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
       && *v43 == 0;
    char v126 = v44;
    uint64_t result = swift_bridgeObjectRelease();
LABEL_55:
    if ((v126 & 1) == 0)
    {
      __break(1u);
LABEL_182:
      __break(1u);
LABEL_183:
      __break(1u);
      goto LABEL_184;
    }
    double v28 = v28 * 10.0 + 0.0;
    unint64_t v6 = sub_254EFCE30();
    unint64_t v45 = v6 >> 14;
    if (v28 >= 255.0)
    {
      if (v124 < v45)
      {
        __break(1u);
        goto LABEL_177;
      }
      unint64_t v46 = sub_254EFCE70();
      uint64_t v120 = v47 >> 14;
      if (v47 >> 14 == v46 >> 14)
      {
        unint64_t v6 = v32;
      }
      else
      {
        unint64_t v49 = v46;
        unint64_t v50 = v47;
        unint64_t v6 = v46;
        do
        {
          unint64_t v51 = v49;
          unint64_t v52 = v50;
          unint64_t v54 = sub_254EFCE60();
          unint64_t v55 = v53;
          if ((v54 != 2573 || v53 != 0xE200000000000000) && (sub_254EFD140() & 1) == 0)
          {
            if ((sub_254EFCB70() & 1) == 0) {
              goto LABEL_82;
            }
            uint64_t result = sub_254EE5900(v54, v55);
            if ((result & 0x100000000) != 0) {
              goto LABEL_187;
            }
            if ((result & 0xFFFFFF80) != 0) {
              goto LABEL_82;
            }
            uint64_t result = sub_254EE5900(v54, v55);
            if ((result & 0x100000000) != 0) {
              goto LABEL_188;
            }
            if ((result & 0xFFFFFF00) != 0) {
              goto LABEL_174;
            }
          }
          char v56 = sub_254EFCB80();
          swift_bridgeObjectRelease();
          if ((v56 & 1) == 0) {
            goto LABEL_83;
          }
          unint64_t v49 = v51;
          unint64_t v50 = v52;
          unint64_t v6 = sub_254EFCE30();
        }
        while (v120 != v6 >> 14);
        unint64_t v6 = v32;
      }
      goto LABEL_83;
    }
    if (v45 == v124) {
      goto LABEL_66;
    }
  }
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  sub_254EFCEF0();
  while (2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_133:
    if ((v126 & 1) == 0 || v120 < 1)
    {
      sub_254EE433C();
      swift_bridgeObjectRetain();
      uint64_t v95 = sub_254EFCD30();
      uint64_t v97 = v96;
      sub_254EDF770();
      swift_allocError();
      *(void *)uint64_t v98 = v95;
      *(void *)(v98 + 8) = v97;
      *(void *)(v98 + 16) = 0xD000000000000043;
      *(void *)(v98 + 24) = 0x8000000254F03590;
      *(unsigned char *)(v98 + 32) = 0;
      swift_willThrow();
      return swift_bridgeObjectRelease();
    }
    unint64_t v6 = sub_254EFCE40();
    swift_bridgeObjectRelease();
    double v28 = v28 + v127;
LABEL_136:
    if (v123 != 2 && (v123 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      if (sub_254EFCE60() == 37 && v94 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v99 = sub_254EFD140();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v99 & 1) == 0)
        {
          sub_254EE433C();
          swift_bridgeObjectRetain();
          uint64_t v113 = sub_254EFCD30();
          uint64_t v115 = v114;
          sub_254EDF770();
          swift_allocError();
          *(void *)uint64_t v18 = v113;
          *(void *)(v18 + 8) = v115;
          unint64_t v19 = "Could not parse color component: unit is percentage but no percent sign.";
          unint64_t v20 = 0xD000000000000048;
          goto LABEL_10;
        }
      }
    }
    if (sub_254EFCE60() == 37 && v100 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
      goto LABEL_147;
    }
    char v101 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if (v101)
    {
LABEL_147:
      if (v28 / 100.0 * 255.0 <= 255.0) {
        double v28 = v28 / 100.0 * 255.0;
      }
      else {
        double v28 = 255.0;
      }
      unint64_t v6 = sub_254EFCE30();
      char v123 = 0;
    }
    else
    {
      char v123 = 1;
    }
    if (v124 < v6 >> 14)
    {
LABEL_179:
      __break(1u);
LABEL_180:
      uint64_t v90 = sub_254EFCF60();
LABEL_124:
      char v126 = sub_254EDF6A0(v90, v91, (void (*)(uint64_t *__return_ptr))sub_254EDF7C4) & 1;
      continue;
    }
    break;
  }
  unint64_t v102 = sub_254EFCE70();
  unint64_t v104 = v103 >> 14;
  unint64_t v105 = v102 >> 14;
  if (v102 >> 14 == v103 >> 14) {
    goto LABEL_159;
  }
  sub_254EFCE60();
  char v106 = sub_254EFCB60();
  swift_bridgeObjectRelease();
  if ((v106 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_164;
  }
  unint64_t v107 = sub_254EFCE30();
  if (v104 == v107 >> 14)
  {
LABEL_159:
    swift_bridgeObjectRelease();
    goto LABEL_160;
  }
  unint64_t v108 = v107;
  while (1)
  {
    sub_254EFCE60();
    char v109 = sub_254EFCB60();
    swift_bridgeObjectRelease();
    if ((v109 & 1) == 0) {
      break;
    }
    unint64_t v108 = sub_254EFCE30();
    if (v104 == v108 >> 14) {
      goto LABEL_159;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v105 = v108 >> 14;
LABEL_164:
  if (v105 == v124) {
    goto LABEL_160;
  }
  swift_bridgeObjectRetain();
  if (sub_254EFCE60() == v122 && v116 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_169;
  }
  char v117 = sub_254EFD140();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v117 & 1) == 0)
  {
LABEL_160:
    sub_254EE433C();
    swift_bridgeObjectRetain();
    uint64_t v110 = sub_254EFCD30();
    uint64_t v112 = v111;
    sub_254EDF770();
    swift_allocError();
    *(void *)uint64_t v18 = v110;
    *(void *)(v18 + 8) = v112;
    unint64_t v19 = "Could not parse color component: expected character to be terminator.";
    unint64_t v20 = 0xD000000000000045;
    goto LABEL_10;
  }
LABEL_169:
  uint64_t result = sub_254EFCE30();
  if (v121) {
    return result;
  }
  double v118 = round(v28);
  if ((~*(void *)&v118 & 0x7FF0000000000000) == 0)
  {
LABEL_184:
    __break(1u);
    goto LABEL_185;
  }
  if (v118 <= -1.0)
  {
LABEL_185:
    __break(1u);
LABEL_186:
    __break(1u);
LABEL_187:
    __break(1u);
LABEL_188:
    __break(1u);
    return result;
  }
  if (v118 >= 4294967300.0) {
    goto LABEL_186;
  }
  return result;
}

uint64_t sub_254EE6FE4(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10 = a2;
  uint64_t v11 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    uint64_t result = sub_254EDCEFC(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v15 = a2 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v16 = HIBYTE(a5) & 0xF;
  }
  if (v16 < a2 >> 16) {
    goto LABEL_104;
  }
  uint64_t result = sub_254EFCCF0();
  int64_t v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    uint64_t result = sub_254EDCEFC(v10, a4, a5);
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    uint64_t result = sub_254EDCEFC(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    uint64_t result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  unint64_t v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v17 < v10 >> 16) {
    goto LABEL_100;
  }
  if (v17 < a3 >> 16)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  uint64_t result = sub_254EFCCF0();
LABEL_21:
  int64_t v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_99;
  }
  if (v18 < v15)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  unint64_t v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11) {
    unint64_t v19 = 0;
  }
  int v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v33 = a6 + 87;
        if (a6 > 10)
        {
          unsigned __int8 v34 = a6 + 55;
        }
        else
        {
          unsigned __int8 v33 = 97;
          unsigned __int8 v34 = 65;
        }
        if (a6 <= 10) {
          unsigned __int8 v35 = a6 + 48;
        }
        else {
          unsigned __int8 v35 = 58;
        }
        if (v19)
        {
          unsigned int v24 = 0;
          uint64_t v36 = v19 + 1;
          uint64_t v37 = result - 1;
          do
          {
            unsigned int v38 = *v36;
            if (v38 < 0x30 || v38 >= v35)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                unsigned int v29 = 0;
                unsigned __int8 v30 = 1;
                if (v38 < 0x61 || v38 >= v33) {
                  return v29 | ((unint64_t)v30 << 32);
                }
                char v39 = -87;
              }
              else
              {
                char v39 = -55;
              }
            }
            else
            {
              char v39 = -48;
            }
            unint64_t v40 = v24 * (unint64_t)a6;
            if ((v40 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_96;
            }
            unsigned __int8 v41 = v38 + v39;
            unsigned int v24 = v40 + v41;
            if (__CFADD__(v40, v41)) {
              goto LABEL_96;
            }
            ++v36;
            --v37;
          }
          while (v37);
LABEL_94:
          unsigned __int8 v30 = 0;
          unsigned int v29 = v24;
          return v29 | ((unint64_t)v30 << 32);
        }
        goto LABEL_95;
      }
      goto LABEL_96;
    }
    goto LABEL_103;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      unsigned __int8 v42 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v43 = a6 + 55;
      }
      else
      {
        unsigned __int8 v42 = 97;
        unsigned __int8 v43 = 65;
      }
      if (a6 <= 10) {
        unsigned __int8 v44 = a6 + 48;
      }
      else {
        unsigned __int8 v44 = 58;
      }
      if (v19)
      {
        unsigned int v24 = 0;
        while (1)
        {
          unsigned int v45 = *v19;
          if (v45 < 0x30 || v45 >= v44)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              unsigned int v29 = 0;
              unsigned __int8 v30 = 1;
              if (v45 < 0x61 || v45 >= v42) {
                return v29 | ((unint64_t)v30 << 32);
              }
              char v46 = -87;
            }
            else
            {
              char v46 = -55;
            }
          }
          else
          {
            char v46 = -48;
          }
          unint64_t v47 = v24 * (unint64_t)a6;
          if ((v47 & 0xFFFFFFFF00000000) != 0) {
            goto LABEL_96;
          }
          unsigned __int8 v48 = v45 + v46;
          unsigned int v24 = v47 + v48;
          if (__CFADD__(v47, v48)) {
            goto LABEL_96;
          }
          ++v19;
          if (!--result) {
            goto LABEL_94;
          }
        }
      }
      goto LABEL_95;
    }
LABEL_96:
    unsigned int v29 = 0;
    unsigned __int8 v30 = 1;
    return v29 | ((unint64_t)v30 << 32);
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v21 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v22 = a6 + 55;
      }
      else
      {
        unsigned __int8 v21 = 97;
        unsigned __int8 v22 = 65;
      }
      if (a6 <= 10) {
        unsigned __int8 v23 = a6 + 48;
      }
      else {
        unsigned __int8 v23 = 58;
      }
      if (v19)
      {
        unsigned int v24 = 0;
        char v25 = v19 + 1;
        uint64_t v26 = result - 1;
        while (1)
        {
          unsigned int v27 = *v25;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              unsigned int v29 = 0;
              unsigned __int8 v30 = 1;
              if (v27 < 0x61 || v27 >= v21) {
                return v29 | ((unint64_t)v30 << 32);
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          unint64_t v31 = v24 * (unint64_t)a6;
          if ((v31 & 0xFFFFFFFF00000000) != 0) {
            goto LABEL_96;
          }
          unsigned __int8 v32 = v27 + v28;
          unsigned int v24 = v31 - v32;
          if (v31 < v32) {
            goto LABEL_96;
          }
          ++v25;
          if (!--v26) {
            goto LABEL_94;
          }
        }
      }
LABEL_95:
      unsigned int v29 = 0;
      unsigned __int8 v30 = 0;
      return v29 | ((unint64_t)v30 << 32);
    }
    goto LABEL_96;
  }
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

unsigned char *sub_254EE740C@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_254EDF700(a1, a2);
}

uint64_t StyleSheet.Color.debugDescription.getter()
{
  return 677537650;
}

uint64_t StyleSheet.Font.Size.debugDescription.getter()
{
  if (*(char *)(v0 + 8) < 0) {
    return StyleSheet.Font.Size.Absolute.rawValue.getter();
  }
  sub_254EFCDC0();
  StyleSheet.Font.Size.Unit.rawValue.getter();
  sub_254EFCCA0();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t StyleSheet.Font.Specified.debugDescription.getter()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 8);
  int v2 = *(unsigned __int8 *)(v0 + 9);
  int v3 = *(unsigned __int8 *)(v0 + 10);
  int v4 = *(unsigned __int8 *)(v0 + 11);
  uint64_t v5 = *(void *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_254EFE1D0;
  unint64_t v7 = (void *)(inited + 32);
  if (v2 == 13)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    *unint64_t v7 = 0;
    *(void *)(inited + 40) = 0;
    *(void *)(inited + 48) = 0;
  }
  else
  {
    unint64_t v9 = sub_254EE24BC();
    *(unsigned char *)unint64_t v7 = v2;
    unint64_t v8 = &type metadata for StyleSheet.Font.Weight;
  }
  *(void *)(inited + 56) = v8;
  *(void *)(inited + 64) = v9;
  *(void *)(inited + 72) = 0x746867696577;
  *(void *)(inited + 80) = 0xE600000000000000;
  unint64_t v10 = (void *)(inited + 88);
  if (v3 == 3)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    *unint64_t v10 = 0;
    *(void *)(inited + 96) = 0;
    *(void *)(inited + 104) = 0;
  }
  else
  {
    unint64_t v12 = sub_254EE26B8();
    *(unsigned char *)unint64_t v10 = v3;
    uint64_t v11 = &type metadata for StyleSheet.Font.Style;
  }
  *(void *)(inited + 112) = v11;
  *(void *)(inited + 120) = v12;
  *(void *)(inited + 128) = 0x656C797473;
  *(void *)(inited + 136) = 0xE500000000000000;
  uint64_t v13 = (void *)(inited + 144);
  if (v4 == 2)
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    *uint64_t v13 = 0;
    *(void *)(inited + 152) = 0;
    *(void *)(inited + 160) = 0;
  }
  else
  {
    unint64_t v15 = sub_254EE287C();
    *(unsigned char *)uint64_t v13 = v4 & 1;
    unint64_t v14 = &type metadata for StyleSheet.Font.Variant;
  }
  *(void *)(inited + 168) = v14;
  *(void *)(inited + 176) = v15;
  *(void *)(inited + 184) = 0x746E6169726176;
  *(void *)(inited + 192) = 0xE700000000000000;
  unint64_t v16 = sub_254EE7928(inited);
  swift_bridgeObjectRelease();
  if (v1 <= 0xFB)
  {
    sub_254EFCCA0();
    sub_254EFCFC0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v16 = sub_254EE4238(0, *((void *)v16 + 2) + 1, 1, v16);
    }
    unint64_t v18 = *((void *)v16 + 2);
    unint64_t v17 = *((void *)v16 + 3);
    if (v18 >= v17 >> 1) {
      unint64_t v16 = sub_254EE4238((char *)(v17 > 1), v18 + 1, 1, v16);
    }
    *((void *)v16 + 2) = v18 + 1;
    unint64_t v19 = &v16[16 * v18];
    *((void *)v19 + 4) = 0;
    *((void *)v19 + 5) = 0xE000000000000000;
  }
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F90);
    sub_254EE8534((unint64_t *)&qword_269E70F98, &qword_269E70F90);
    sub_254EFCBA0();
    sub_254EFCCA0();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v16 = sub_254EE4238(0, *((void *)v16 + 2) + 1, 1, v16);
    }
    unint64_t v21 = *((void *)v16 + 2);
    unint64_t v20 = *((void *)v16 + 3);
    if (v21 >= v20 >> 1) {
      unint64_t v16 = sub_254EE4238((char *)(v20 > 1), v21 + 1, 1, v16);
    }
    *((void *)v16 + 2) = v21 + 1;
    unsigned __int8 v22 = &v16[16 * v21];
    *((void *)v22 + 4) = 0x203A796C696D6166;
    *((void *)v22 + 5) = 0xE800000000000000;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F90);
  sub_254EE8534((unint64_t *)&qword_269E70F98, &qword_269E70F90);
  uint64_t v23 = sub_254EFCBA0();
  swift_bridgeObjectRelease();
  return v23;
}

char *sub_254EE7928(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v2 = swift_bridgeObjectRetain() + 80;
  int v3 = (char *)MEMORY[0x263F8EE78];
  do
  {
    sub_254EE8764(v2 - 48, (uint64_t)&v8);
    if (AssociatedTypeWitness)
    {
      sub_254EE1110(&v8, (uint64_t)v10);
      sub_254EFCCA0();
      sub_254EFCCA0();
      __swift_project_boxed_opaque_existential_1(v10, v10[3]);
      uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v8);
      sub_254EFCD80();
      sub_254EFCFC0();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int v3 = sub_254EE4238(0, *((void *)v3 + 2) + 1, 1, v3);
      }
      unint64_t v5 = *((void *)v3 + 2);
      unint64_t v4 = *((void *)v3 + 3);
      if (v5 >= v4 >> 1) {
        int v3 = sub_254EE4238((char *)(v4 > 1), v5 + 1, 1, v3);
      }
      *((void *)v3 + 2) = v5 + 1;
      unint64_t v6 = &v3[16 * v5];
      *((void *)v6 + 4) = 0;
      *((void *)v6 + 5) = 0xE000000000000000;
    }
    else
    {
      sub_254EE87CC((uint64_t)&v8);
    }
    v2 += 56;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t StyleSheet.Font.debugDescription.getter()
{
  if ((*(void *)(v0 + 8) & 0x8000000000000000) != 0) {
    return StyleSheet.Font.System.rawValue.getter();
  }
  sub_254EFCFC0();
  return 0;
}

uint64_t sub_254EE7BA4()
{
  if ((*(void *)(v0 + 8) & 0x8000000000000000) != 0) {
    return StyleSheet.Font.System.rawValue.getter();
  }
  sub_254EFCFC0();
  return 0;
}

unint64_t StyleSheet.Rule.Declaration.debugDescription.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  switch(*(unsigned char *)(v0 + 32))
  {
    case 1:
    case 3:
      unint64_t v3 = 0;
      sub_254EFCCA0();
      sub_254EFCFC0();
      return v3;
    case 2:
      if ((v1 & 0x100000000) != 0) {
        return 0;
      }
      sub_254EFCF20();
      swift_bridgeObjectRelease();
      unint64_t v3 = 0xD000000000000012;
      StyleSheet.Color.debugDescription.getter();
      sub_254EFCCA0();
      swift_bridgeObjectRelease();
      return v3;
    case 4:
      sub_254EFCCA0();
      sub_254EFCFC0();
      return 0;
    case 5:
      if (!v1) {
        return 0;
      }
      sub_254EFCF20();
      swift_bridgeObjectRelease();
      unint64_t v3 = 0xD000000000000016;
      sub_254EFCBF0();
      sub_254EFCCA0();
      swift_bridgeObjectRelease();
LABEL_9:
      sub_254EFCCA0();
      return v3;
    default:
      sub_254EFCF20();
      swift_bridgeObjectRelease();
      unint64_t v3 = 0x3A64696C61766E69;
      sub_254EFCCA0();
      sub_254EFCCA0();
      sub_254EFCCA0();
      goto LABEL_9;
  }
}

uint64_t StyleSheet.Rule.debugDescription.getter()
{
  if (v0[5]) {
    return 0x656C75722040;
  }
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70FA0);
  sub_254EE8444(&qword_269E70FA8, &qword_269E70FA0, (void (*)(void))sub_254EE8408);
  sub_254EFCBA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_254EFCCA0();
  sub_254EFCCA0();
  swift_bridgeObjectRelease();
  sub_254EFCCA0();
  return v2;
}

unint64_t sub_254EE804C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = StyleSheet.Rule.Declaration.debugDescription.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_254EE8090(void *a1)
{
  unint64_t v1 = a1[1];
  uint64_t v2 = *a1 & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(v1) & 0xF;
  }
  return v2 != 0;
}

uint64_t sub_254EE80B0@<X0>(void *a1@<X8>)
{
  sub_254EFCCA0();
  uint64_t result = sub_254EFCCA0();
  *a1 = 2105376;
  a1[1] = 0xE300000000000000;
  return result;
}

uint64_t StyleSheet.debugDescription.getter()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_254EE81D4(v0);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F90);
  sub_254EE8534((unint64_t *)&qword_269E70F98, &qword_269E70F90);
  uint64_t v1 = sub_254EFCBA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_254EFCCA0();
  return v1;
}

uint64_t sub_254EE81D4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
    sub_254EE8584(0, v1, 0);
    uint64_t v2 = v15;
    uint64_t v4 = a1 + 40;
    do
    {
      if (*(unsigned char *)(v4 + 32))
      {
        unint64_t v5 = 0xE600000000000000;
        uint64_t v6 = 0x656C75722040;
      }
      else
      {
        uint64_t v13 = *(void *)(v4 + 16);
        uint64_t v14 = *(void *)(v4 + 24);
        uint64_t v7 = *(void *)v4;
        uint64_t v8 = *(void *)(v4 + 8);
        uint64_t v6 = *(void *)(v4 - 8);
        sub_254EE85A4(v6, *(void *)v4, v8, v13, v14, 0);
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269E70FA0);
        sub_254EE8444(&qword_269E70FA8, &qword_269E70FA0, (void (*)(void))sub_254EE8408);
        sub_254EFCBA0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_254EFCCA0();
        sub_254EFCCA0();
        swift_bridgeObjectRelease();
        sub_254EFCCA0();
        sub_254EE8600(v6, v7, v8, v13, v14, 0);
        unint64_t v5 = v7;
      }
      unint64_t v10 = *(void *)(v15 + 16);
      unint64_t v9 = *(void *)(v15 + 24);
      if (v10 >= v9 >> 1) {
        sub_254EE8584((char *)(v9 > 1), v10 + 1, 1);
      }
      *(void *)(v15 + 16) = v10 + 1;
      uint64_t v11 = v15 + 16 * v10;
      *(void *)(v11 + 32) = v6;
      *(void *)(v11 + 40) = v5;
      v4 += 48;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_254EE8408()
{
  return sub_254EE8444(&qword_269E70FB0, &qword_269E70FB8, (void (*)(void))sub_254EE84B0);
}

uint64_t sub_254EE8444(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_254EE84B0()
{
  unint64_t result = qword_269E70FC0;
  if (!qword_269E70FC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E70FC8);
    sub_254EE8534(&qword_269E70FD0, &qword_269E70FD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70FC0);
  }
  return result;
}

uint64_t sub_254EE8534(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_254EE8584(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_254EE8660(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_254EE85A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6) {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_254EE8600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  swift_bridgeObjectRelease();
  if (a6) {
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

char *sub_254EE8660(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F48);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_254EE8764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70FE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_254EE87CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70FE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  int64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t StyleSheet.rules.getter()
{
  return swift_bridgeObjectRetain();
}

LinkPresentationStyleSheetParsing::StyleSheet __swiftcall StyleSheet.init(rules:)(LinkPresentationStyleSheetParsing::StyleSheet rules)
{
  v1->rules._rawValue = rules.rules._rawValue;
  return rules;
}

uint64_t static StyleSheet.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_254EE88AC(*a1, *a2);
}

uint64_t sub_254EE88AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t v3 = 0;
  uint64_t v71 = a2 + 32;
  uint64_t v72 = a1 + 32;
  uint64_t v69 = *(void *)(a1 + 16);
  while (1)
  {
    uint64_t v5 = v72 + 48 * v3;
    uint64_t v7 = *(void *)v5;
    uint64_t v6 = *(void *)(v5 + 8);
    uint64_t v8 = *(void *)(v5 + 16);
    uint64_t v9 = *(void *)(v5 + 24);
    char v10 = *(unsigned char *)(v5 + 40);
    uint64_t v11 = v71 + 48 * v3;
    uint64_t v13 = *(void *)v11;
    uint64_t v12 = *(void *)(v11 + 8);
    uint64_t v14 = *(void *)(v11 + 24);
    uint64_t v79 = *(void *)(v5 + 32);
    uint64_t v80 = *(void *)(v11 + 16);
    uint64_t v15 = *(void *)(v11 + 32);
    char v16 = *(unsigned char *)(v11 + 40);
    uint64_t v78 = v6;
    if ((v10 & 1) == 0) {
      break;
    }
    if ((v16 & 1) == 0) {
      goto LABEL_46;
    }
    if (v7 != v13 || v6 != v12)
    {
      uint64_t v18 = *(void *)(v5 + 8);
      if ((sub_254EFD140() & 1) == 0)
      {
        uint64_t v52 = v13;
        uint64_t v53 = v12;
        uint64_t v77 = v13;
        uint64_t v54 = v8;
        uint64_t v55 = v12;
        uint64_t v56 = v80;
        sub_254EE85A4(v52, v53, v80, v14, v15, 1);
        uint64_t v57 = v9;
        uint64_t v58 = v9;
        uint64_t v59 = v14;
        uint64_t v60 = v79;
        sub_254EE85A4(v7, v18, v54, v58, v79, 1);
        uint64_t v61 = v7;
        uint64_t v62 = v18;
        uint64_t v63 = v54;
        uint64_t v64 = v57;
        goto LABEL_59;
      }
    }
    if (v8 != v80 || v9 != v14)
    {
      uint64_t v20 = v9;
      if ((sub_254EFD140() & 1) == 0)
      {
        uint64_t v65 = v13;
        uint64_t v66 = v12;
        uint64_t v77 = v13;
        uint64_t v67 = v8;
        uint64_t v55 = v12;
        uint64_t v56 = v80;
        sub_254EE85A4(v65, v66, v80, v14, v15, 1);
        uint64_t v68 = v9;
        uint64_t v59 = v14;
        uint64_t v60 = v79;
        sub_254EE85A4(v7, v78, v67, v68, v79, 1);
        uint64_t v61 = v7;
        uint64_t v62 = v78;
        uint64_t v63 = v67;
        uint64_t v64 = v20;
LABEL_59:
        sub_254EE8600(v61, v62, v63, v64, v60, 1);
        uint64_t v46 = v77;
        uint64_t v47 = v55;
        uint64_t v48 = v56;
        uint64_t v49 = v59;
        uint64_t v50 = v15;
LABEL_52:
        char v51 = 1;
LABEL_53:
        sub_254EE8600(v46, v47, v48, v49, v50, v51);
        return 0;
      }
    }
    uint64_t v21 = *(void *)(v79 + 16);
    if (v21 != *(void *)(v15 + 16))
    {
      sub_254EE85A4(v13, v12, v80, v14, v15, 1);
      sub_254EE85A4(v7, v78, v8, v9, v79, 1);
      uint64_t v75 = v12;
      uint64_t v76 = v14;
      sub_254EE85A4(v13, v12, v80, v14, v15, 1);
      uint64_t v22 = v7;
      uint64_t v73 = v9;
      sub_254EE85A4(v7, v78, v8, v9, v79, 1);
LABEL_51:
      sub_254EE8600(v22, v78, v8, v73, v79, 1);
      sub_254EE8600(v13, v75, v80, v76, v15, 1);
      sub_254EE8600(v13, v75, v80, v76, v15, 1);
      uint64_t v46 = v22;
      uint64_t v47 = v78;
      uint64_t v48 = v8;
      uint64_t v49 = v73;
      uint64_t v50 = v79;
      goto LABEL_52;
    }
    if (v21)
    {
      sub_254EE85A4(v13, v12, v80, v14, v15, 1);
      sub_254EE85A4(v7, v78, v8, v9, v79, 1);
      if (v79 != v15)
      {
        uint64_t v75 = v12;
        uint64_t v76 = v14;
        sub_254EE85A4(v13, v12, v80, v14, v15, 1);
        uint64_t v22 = v7;
        uint64_t v73 = v9;
        uint64_t result = sub_254EE85A4(v7, v78, v8, v9, v79, 1);
        unint64_t v23 = 0;
        unsigned int v24 = (unsigned char *)(v15 + 64);
        char v25 = (unsigned char *)(v79 + 64);
        while (1)
        {
          char v26 = *v25;
          long long v27 = *((_OWORD *)v25 - 1);
          long long v84 = *((_OWORD *)v25 - 2);
          long long v85 = v27;
          char v86 = v26;
          if (v23 >= *(void *)(v15 + 16)) {
            break;
          }
          char v28 = *v24;
          long long v29 = *((_OWORD *)v24 - 1);
          long long v81 = *((_OWORD *)v24 - 2);
          long long v82 = v29;
          char v83 = v28;
          uint64_t result = _s33LinkPresentationStyleSheetParsing0cD0V4RuleO11DeclarationO2eeoiySbAG_AGtFZ_0((uint64_t)&v84, (uint64_t)&v81);
          if ((result & 1) == 0) {
            goto LABEL_51;
          }
          ++v23;
          v24 += 40;
          v25 += 40;
          if (v21 == v23)
          {
            sub_254EE8600(v22, v78, v8, v73, v79, 1);
            sub_254EE8600(v13, v75, v80, v14, v15, 1);
            sub_254EE8600(v13, v75, v80, v14, v15, 1);
            sub_254EE8600(v22, v78, v8, v73, v79, 1);
            uint64_t v2 = v69;
            goto LABEL_8;
          }
        }
        __break(1u);
        goto LABEL_61;
      }
      sub_254EE8600(v7, v78, v8, v9, v79, 1);
      uint64_t v40 = v13;
      uint64_t v41 = v12;
      uint64_t v42 = v80;
      uint64_t v43 = v14;
      uint64_t v44 = v15;
    }
    else
    {
      sub_254EE85A4(v13, v12, v80, v14, v15, 1);
      sub_254EE85A4(v7, v78, v8, v9, v79, 1);
      sub_254EE8600(v7, v78, v8, v9, v79, 1);
      uint64_t v40 = v13;
      uint64_t v41 = v12;
      uint64_t v42 = v80;
      uint64_t v43 = v14;
      uint64_t v44 = v15;
    }
    sub_254EE8600(v40, v41, v42, v43, v44, 1);
LABEL_8:
    ++v3;
    uint64_t result = 1;
    if (v3 == v2) {
      return result;
    }
  }
  if (v16)
  {
LABEL_46:
    uint64_t v45 = *(void *)(v5 + 8);
    sub_254EE85A4(v13, v12, v80, v14, v15, v10 ^ 1);
    sub_254EE85A4(v7, v45, v8, v9, v79, v10);
    sub_254EE8600(v7, v45, v8, v9, v79, v10);
    uint64_t v46 = v13;
    uint64_t v47 = v12;
    uint64_t v48 = v80;
    uint64_t v49 = v14;
    uint64_t v50 = v15;
    char v51 = v10 ^ 1;
    goto LABEL_53;
  }
  if (v7 != v13 || v6 != v12)
  {
    uint64_t v31 = *(void *)(v5 + 8);
    if ((sub_254EFD140() & 1) == 0)
    {
      sub_254EE85A4(v13, v12, v80, v14, v15, 0);
      sub_254EE85A4(v7, v31, v8, v9, v79, 0);
      sub_254EE8600(v7, v31, v8, v9, v79, 0);
      uint64_t v46 = v13;
      uint64_t v47 = v12;
      uint64_t v48 = v80;
      uint64_t v49 = v14;
      uint64_t v50 = v15;
LABEL_49:
      char v51 = 0;
      goto LABEL_53;
    }
  }
  uint64_t v32 = *(void *)(v8 + 16);
  uint64_t v74 = v9;
  uint64_t v70 = v7;
  if (v32 != *(void *)(v80 + 16))
  {
    sub_254EE85A4(v13, v12, v80, v14, v15, 0);
    sub_254EE85A4(v7, v78, v8, v9, v79, 0);
    sub_254EE85A4(v13, v12, v80, v14, v15, 0);
    sub_254EE85A4(v7, v78, v8, v9, v79, 0);
LABEL_48:
    sub_254EE8600(v70, v78, v8, v74, v79, 0);
    sub_254EE8600(v13, v12, v80, v14, v15, 0);
    sub_254EE8600(v13, v12, v80, v14, v15, 0);
    uint64_t v46 = v70;
    uint64_t v47 = v78;
    uint64_t v48 = v8;
    uint64_t v49 = v74;
    uint64_t v50 = v79;
    goto LABEL_49;
  }
  if (!v32)
  {
    sub_254EE85A4(v13, v12, v80, v14, v15, 0);
    sub_254EE85A4(v7, v78, v8, v9, v79, 0);
    sub_254EE85A4(v13, v12, v80, v14, v15, 0);
    sub_254EE85A4(v7, v78, v8, v9, v79, 0);
LABEL_7:
    sub_254EE8600(v70, v78, v8, v74, v79, 0);
    sub_254EE8600(v13, v12, v80, v14, v15, 0);
    sub_254EE8600(v13, v12, v80, v14, v15, 0);
    sub_254EE8600(v70, v78, v8, v74, v79, 0);
    uint64_t v2 = v69;
    goto LABEL_8;
  }
  sub_254EE85A4(v13, v12, v80, v14, v15, 0);
  sub_254EE85A4(v7, v78, v8, v9, v79, 0);
  sub_254EE85A4(v13, v12, v80, v14, v15, 0);
  uint64_t result = sub_254EE85A4(v7, v78, v8, v9, v79, 0);
  if (v8 == v80) {
    goto LABEL_7;
  }
  unint64_t v33 = 0;
  unsigned __int8 v34 = (unsigned char *)(v80 + 64);
  unsigned __int8 v35 = (unsigned char *)(v8 + 64);
  while (1)
  {
    char v36 = *v35;
    long long v37 = *((_OWORD *)v35 - 1);
    long long v84 = *((_OWORD *)v35 - 2);
    long long v85 = v37;
    char v86 = v36;
    if (v33 >= *(void *)(v80 + 16)) {
      break;
    }
    char v38 = *v34;
    long long v39 = *((_OWORD *)v34 - 1);
    long long v81 = *((_OWORD *)v34 - 2);
    long long v82 = v39;
    char v83 = v38;
    uint64_t result = _s33LinkPresentationStyleSheetParsing0cD0V4RuleO11DeclarationO2eeoiySbAG_AGtFZ_0((uint64_t)&v84, (uint64_t)&v81);
    if ((result & 1) == 0) {
      goto LABEL_48;
    }
    ++v33;
    v34 += 40;
    v35 += 40;
    if (v32 == v33) {
      goto LABEL_7;
    }
  }
LABEL_61:
  __break(1u);
  return result;
}

uint64_t sub_254EE92F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v10 = 1;
    }
    else
    {
      uint64_t v3 = v2 - 1;
      uint64_t v4 = (unsigned char *)(a2 + 64);
      uint64_t v5 = (unsigned char *)(a1 + 64);
      do
      {
        char v6 = *v5;
        long long v7 = *((_OWORD *)v5 - 1);
        v16[0] = *((_OWORD *)v5 - 2);
        v16[1] = v7;
        char v17 = v6;
        char v8 = *v4;
        long long v9 = *((_OWORD *)v4 - 1);
        v14[0] = *((_OWORD *)v4 - 2);
        v14[1] = v9;
        char v15 = v8;
        char v10 = _s33LinkPresentationStyleSheetParsing0cD0V4RuleO11DeclarationO2eeoiySbAG_AGtFZ_0((uint64_t)v16, (uint64_t)v14);
        BOOL v12 = v3-- != 0;
        if ((v10 & 1) == 0) {
          break;
        }
        v4 += 40;
        v5 += 40;
      }
      while (v12);
    }
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_254EE939C(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_254EFD140(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    long long v9 = a2 + 7;
    for (uint64_t i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_254EFD140() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_254EE9468()
{
  return sub_254EFD1A0();
}

uint64_t sub_254EE9494()
{
  return 0x73656C7572;
}

uint64_t sub_254EE94A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x73656C7572 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_254EFD140();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_254EE9538(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_254EE9544(uint64_t a1)
{
  unint64_t v2 = sub_254EE9748();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EE9580(uint64_t a1)
{
  unint64_t v2 = sub_254EE9748();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StyleSheet.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70FE8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254EE9748();
  sub_254EFD1D0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70FF0);
  sub_254EF1EB8(&qword_269E70FF8, &qword_269E70FF0, (void (*)(void))sub_254EE979C);
  sub_254EFD100();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_254EE9748()
{
  unint64_t result = qword_269E71B00;
  if (!qword_269E71B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B00);
  }
  return result;
}

unint64_t sub_254EE979C()
{
  unint64_t result = qword_269E71000;
  if (!qword_269E71000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71000);
  }
  return result;
}

uint64_t StyleSheet.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71008);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254EE9748();
  sub_254EFD1C0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70FF0);
    sub_254EF1EB8(&qword_269E71010, &qword_269E70FF0, (void (*)(void))sub_254EE999C);
    sub_254EFD080();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_254EE999C()
{
  unint64_t result = qword_269E71018;
  if (!qword_269E71018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71018);
  }
  return result;
}

uint64_t sub_254EE99F0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_254EE99F8(uint64_t *a1, uint64_t *a2)
{
  return sub_254EE88AC(*a1, *a2);
}

uint64_t sub_254EE9A04@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return StyleSheet.init(from:)(a1, a2);
}

uint64_t sub_254EE9A1C(void *a1)
{
  return StyleSheet.encode(to:)(a1);
}

BOOL static StyleSheet.Color.== infix(_:_:)(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t sub_254EE9A68(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x7265746E6563;
    }
    else {
      uint64_t v3 = 0x7468676972;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE600000000000000;
    }
    else {
      unint64_t v4 = 0xE500000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x7265746E6563;
      }
      else {
        uint64_t v6 = 0x7468676972;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE600000000000000;
      }
      else {
        unint64_t v7 = 0xE500000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    uint64_t v3 = 1952867692;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1952867692)
  {
LABEL_21:
    char v8 = sub_254EFD140();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_254EE9B64(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E6F6974706163;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E6F6974706163;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1852793705;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1970169197;
      break;
    case 3:
      uint64_t v5 = 0x2D6567617373656DLL;
      unint64_t v3 = 0xEB00000000786F62;
      break;
    case 4:
      uint64_t v5 = 0x61632D6C6C616D73;
      unint64_t v3 = 0xED00006E6F697470;
      break;
    case 5:
      uint64_t v5 = 0x622D737574617473;
      unint64_t v3 = 0xEA00000000007261;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1852793705) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1970169197) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v6 = 0xEB00000000786F62;
      if (v5 != 0x2D6567617373656DLL) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      uint64_t v2 = 0x61632D6C6C616D73;
      unint64_t v6 = 0xED00006E6F697470;
      goto LABEL_15;
    case 5:
      unint64_t v6 = 0xEA00000000007261;
      if (v5 != 0x622D737574617473) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v2) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_254EFD140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_254EE9D80()
{
  uint64_t v0 = StyleSheet.Font.Weight.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == StyleSheet.Font.Weight.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_254EFD140();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_254EE9E18(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x63696C617469;
    }
    else {
      uint64_t v3 = 0x657571696C626FLL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE600000000000000;
    }
    else {
      unint64_t v4 = 0xE700000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x63696C617469;
      }
      else {
        uint64_t v6 = 0x657571696C626FLL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE600000000000000;
      }
      else {
        unint64_t v7 = 0xE700000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE600000000000000;
    uint64_t v3 = 0x6C616D726F6ELL;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE600000000000000;
  if (v3 != 0x6C616D726F6ELL)
  {
LABEL_21:
    char v8 = sub_254EFD140();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_254EE9F24(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x61632D6C6C616D73;
  }
  else {
    uint64_t v3 = 0x6C616D726F6ELL;
  }
  if (v2) {
    unint64_t v4 = 0xE600000000000000;
  }
  else {
    unint64_t v4 = 0xEA00000000007370;
  }
  if (a2) {
    uint64_t v5 = 0x61632D6C6C616D73;
  }
  else {
    uint64_t v5 = 0x6C616D726F6ELL;
  }
  if (a2) {
    unint64_t v6 = 0xEA00000000007370;
  }
  else {
    unint64_t v6 = 0xE600000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_254EFD140();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_254EE9FCC(char a1, char a2)
{
  unint64_t v3 = 0xE100000000000000;
  uint64_t v4 = 37;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xE200000000000000;
      uint64_t v4 = 30832;
      break;
    case 2:
      unint64_t v3 = 0xE200000000000000;
      uint64_t v4 = 28005;
      break;
    case 3:
      unint64_t v3 = 0xE200000000000000;
      uint64_t v4 = 30821;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xE100000000000000;
  uint64_t v6 = 37;
  switch(a2)
  {
    case 1:
      unint64_t v5 = 0xE200000000000000;
      if (v4 == 30832) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v5 = 0xE200000000000000;
      uint64_t v6 = 28005;
      goto LABEL_9;
    case 3:
      unint64_t v5 = 0xE200000000000000;
      if (v4 == 30821) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v4 != v6) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v5) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_254EFD140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_254EEA100(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6C6C616D732D7878;
  unint64_t v3 = 0xE800000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6C6C616D732D7878;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x6C6C616D732D78;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x6C6C616D73;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x6D756964656DLL;
      break;
    case 4:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x656772616CLL;
      break;
    case 5:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x656772616C2D78;
      break;
    case 6:
      uint64_t v5 = 0x656772616C2D7878;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE800000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      if (v5 == 0x6C6C616D732D78) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x6C6C616D73) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x6D756964656DLL) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x656772616CLL) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x656772616C2D78;
      goto LABEL_18;
    case 6:
      if (v5 != 0x656772616C2D7878) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
LABEL_18:
      if (v5 != v2) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_254EFD140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_254EEA330()
{
  return 12383;
}

uint64_t sub_254EEA340(uint64_t a1)
{
  unint64_t v2 = sub_254EF178C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEA37C(uint64_t a1)
{
  unint64_t v2 = sub_254EF178C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EEA3B8(uint64_t a1)
{
  unint64_t v2 = sub_254EF15E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEA3F4(uint64_t a1)
{
  unint64_t v2 = sub_254EF15E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EEA430()
{
  uint64_t result = 0x64696C61766E69;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x726F6C6F63;
      break;
    case 2:
    case 5:
      uint64_t result = 0x756F72676B636162;
      break;
    case 3:
      uint64_t result = 0x67696C4174786574;
      break;
    case 4:
      uint64_t result = 1953394534;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_254EEA4F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254EF5654(a1, a2);
  *a3 = result;
  return result;
}

void sub_254EEA520(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_254EEA52C(uint64_t a1)
{
  unint64_t v2 = sub_254EF1594();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEA568(uint64_t a1)
{
  unint64_t v2 = sub_254EF1594();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EEA5A4(uint64_t a1)
{
  unint64_t v2 = sub_254EF1834();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEA5E0(uint64_t a1)
{
  unint64_t v2 = sub_254EF1834();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EEA61C(uint64_t a1)
{
  unint64_t v2 = sub_254EF163C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEA658(uint64_t a1)
{
  unint64_t v2 = sub_254EF163C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EEA694()
{
  if (*v0) {
    return 0x65756C6176;
  }
  else {
    return 0x79747265706F7270;
  }
}

uint64_t sub_254EEA6CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254EF590C(a1, a2);
  *a3 = result;
  return result;
}

void sub_254EEA6F4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_254EEA700(uint64_t a1)
{
  unint64_t v2 = sub_254EF1888();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEA73C(uint64_t a1)
{
  unint64_t v2 = sub_254EF1888();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EEA778(uint64_t a1)
{
  unint64_t v2 = sub_254EF16E4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEA7B4(uint64_t a1)
{
  unint64_t v2 = sub_254EF16E4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StyleSheet.Rule.Declaration.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71020);
  uint64_t v46 = *(void *)(v3 - 8);
  uint64_t v47 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v44 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71028);
  uint64_t v43 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v42 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71030);
  uint64_t v40 = *(void *)(v6 - 8);
  uint64_t v41 = v6;
  MEMORY[0x270FA5388](v6);
  long long v39 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71038);
  uint64_t v37 = *(void *)(v8 - 8);
  uint64_t v38 = v8;
  MEMORY[0x270FA5388](v8);
  char v36 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71040);
  uint64_t v34 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  BOOL v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71048);
  uint64_t v33 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71050);
  uint64_t v56 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  char v16 = (char *)v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v17 = *(void *)v1;
  uint64_t v49 = *(void *)(v1 + 8);
  unint64_t v50 = v17;
  uint64_t v48 = *(void *)(v1 + 16);
  v32[1] = *(void *)(v1 + 24);
  uint64_t v18 = *(unsigned __int8 *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254EF1594();
  unint64_t v19 = v16;
  sub_254EFD1D0();
  switch(v18)
  {
    case 1:
      unsigned int v23 = v50;
      unint64_t v24 = HIDWORD(v50);
      LOBYTE(v53) = 1;
      sub_254EF1834();
      uint64_t v20 = v52;
      uint64_t v21 = v19;
      sub_254EFD0B0();
      unint64_t v53 = __PAIR64__(v24, v23);
      LODWORD(v54) = v49;
      sub_254EF17E0();
      uint64_t v25 = v35;
      sub_254EFD100();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v25);
      goto LABEL_6;
    case 2:
      LOBYTE(v53) = 2;
      sub_254EF178C();
      long long v27 = v36;
      uint64_t v28 = v52;
      long long v29 = v16;
      sub_254EFD0B0();
      unint64_t v53 = v50;
      LODWORD(v54) = v49;
      BYTE4(v54) = BYTE4(v49) & 1;
      sub_254EF17E0();
      uint64_t v30 = v38;
      sub_254EFD0D0();
      uint64_t v31 = v37;
      goto LABEL_11;
    case 3:
      LOBYTE(v53) = 3;
      sub_254EF16E4();
      long long v27 = v39;
      uint64_t v28 = v52;
      long long v29 = v16;
      sub_254EFD0B0();
      LOBYTE(v53) = v50;
      sub_254EF1738();
      uint64_t v30 = v41;
      sub_254EFD100();
      uint64_t v31 = v40;
      goto LABEL_11;
    case 4:
      LOBYTE(v53) = 4;
      sub_254EF163C();
      long long v27 = v42;
      uint64_t v28 = v52;
      long long v29 = v16;
      sub_254EFD0B0();
      unint64_t v53 = v50;
      uint64_t v54 = v49;
      uint64_t v55 = v48;
      sub_254EF1690();
      uint64_t v30 = v45;
      sub_254EFD100();
      uint64_t v31 = v43;
      goto LABEL_11;
    case 5:
      LOBYTE(v53) = 5;
      sub_254EF15E8();
      long long v27 = v44;
      uint64_t v28 = v52;
      long long v29 = v16;
      sub_254EFD0B0();
      uint64_t v30 = v47;
      sub_254EFD0C0();
      uint64_t v31 = v46;
LABEL_11:
      (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v30);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v29, v28);
      break;
    default:
      LOBYTE(v53) = 0;
      sub_254EF1888();
      uint64_t v20 = v52;
      uint64_t v21 = v16;
      sub_254EFD0B0();
      LOBYTE(v53) = 0;
      uint64_t v22 = v51;
      sub_254EFD0E0();
      if (!v22)
      {
        LOBYTE(v53) = 1;
        sub_254EFD0E0();
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v12);
LABEL_6:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v21, v20);
      break;
  }
  return result;
}

uint64_t StyleSheet.Rule.Declaration.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v79 = a2;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71070);
  uint64_t v77 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  char v83 = (void (**)(char *, char *))((char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71078);
  uint64_t v78 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  long long v82 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71080);
  uint64_t v76 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  long long v81 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71088);
  uint64_t v73 = *(void *)(v6 - 8);
  uint64_t v74 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v80 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71090);
  uint64_t v70 = *(void *)(v8 - 8);
  uint64_t v71 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71098);
  uint64_t v68 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E710A0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = a1[3];
  long long v84 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_254EF1594();
  uint64_t v19 = v88;
  sub_254EFD1C0();
  uint64_t v88 = v19;
  if (v19) {
    goto LABEL_21;
  }
  uint64_t v66 = v13;
  uint64_t v20 = v80;
  uint64_t v65 = v11;
  uint64_t v21 = v81;
  uint64_t v22 = v82;
  unsigned int v23 = v83;
  uint64_t v67 = v15;
  uint64_t v24 = sub_254EFD0A0();
  uint64_t v25 = (char *)v14;
  if (*(void *)(v24 + 16) != 1)
  {
    uint64_t v32 = sub_254EFCF50();
    uint64_t v33 = swift_allocError();
    uint64_t v35 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E710A8);
    *uint64_t v35 = &type metadata for StyleSheet.Rule.Declaration;
    sub_254EFD030();
    sub_254EFCF40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v35, *MEMORY[0x263F8DCB0], v32);
    uint64_t v88 = v33;
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v17, v14);
LABEL_21:
    uint64_t v49 = (uint64_t)v84;
    return __swift_destroy_boxed_opaque_existential_1(v49);
  }
  uint64_t v26 = v67;
  switch(*(unsigned char *)(v24 + 32))
  {
    case 1:
      char v36 = *(unsigned char *)(v24 + 32);
      LOBYTE(v85) = 1;
      sub_254EF1834();
      uint64_t v28 = v25;
      uint64_t v37 = v88;
      sub_254EFD020();
      uint64_t v88 = v37;
      if (v37) {
        goto LABEL_20;
      }
      sub_254EF1984();
      uint64_t v38 = v71;
      uint64_t v39 = v88;
      sub_254EFD080();
      uint64_t v88 = v39;
      if (v39)
      {
        uint64_t v40 = v70;
        goto LABEL_13;
      }
      (*(void (**)(char *, uint64_t))(v70 + 8))(v10, v38);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v26 + 8))(v17, v25);
      uint64_t v62 = 0;
      uint64_t v64 = 0;
      uint64_t v55 = v85;
      uint64_t v57 = v86;
      goto LABEL_31;
    case 2:
      char v36 = *(unsigned char *)(v24 + 32);
      LOBYTE(v85) = 2;
      sub_254EF178C();
      uint64_t v10 = v20;
      uint64_t v28 = v25;
      uint64_t v41 = v88;
      sub_254EFD020();
      uint64_t v88 = v41;
      if (v41) {
        goto LABEL_20;
      }
      sub_254EF1984();
      uint64_t v38 = v74;
      uint64_t v42 = v88;
      sub_254EFD050();
      uint64_t v88 = v42;
      if (!v42)
      {
        (*(void (**)(char *, uint64_t))(v73 + 8))(v10, v38);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, char *))(v26 + 8))(v17, v25);
        uint64_t v62 = 0;
        uint64_t v64 = 0;
        uint64_t v55 = v85;
        uint64_t v59 = 0x100000000;
        if (!BYTE4(v86)) {
          uint64_t v59 = 0;
        }
        uint64_t v57 = v59 | v86;
        goto LABEL_31;
      }
      uint64_t v40 = v73;
LABEL_13:
      (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v38);
      goto LABEL_20;
    case 3:
      char v36 = *(unsigned char *)(v24 + 32);
      LOBYTE(v85) = 3;
      sub_254EF16E4();
      uint64_t v28 = v25;
      uint64_t v43 = v88;
      sub_254EFD020();
      uint64_t v88 = v43;
      if (v43) {
        goto LABEL_20;
      }
      sub_254EF1930();
      uint64_t v44 = v72;
      uint64_t v45 = v88;
      sub_254EFD080();
      uint64_t v88 = v45;
      if (v45)
      {
        (*(void (**)(char *, uint64_t))(v76 + 8))(v21, v44);
        goto LABEL_20;
      }
      (*(void (**)(char *, uint64_t))(v76 + 8))(v21, v44);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v26 + 8))(v17, v25);
      uint64_t v57 = 0;
      uint64_t v62 = 0;
      uint64_t v64 = 0;
      uint64_t v55 = v85;
LABEL_31:
      uint64_t v49 = (uint64_t)v84;
      uint64_t v60 = v79;
      goto LABEL_34;
    case 4:
      long long v81 = (char *)*(unsigned __int8 *)(v24 + 32);
      LOBYTE(v85) = 4;
      sub_254EF163C();
      uint64_t v28 = v25;
      uint64_t v46 = v88;
      sub_254EFD020();
      uint64_t v88 = v46;
      if (v46) {
        goto LABEL_20;
      }
      sub_254EF18DC();
      uint64_t v47 = v75;
      uint64_t v48 = v88;
      sub_254EFD080();
      uint64_t v88 = v48;
      if (!v48)
      {
        (*(void (**)(char *, uint64_t))(v78 + 8))(v22, v47);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, char *))(v26 + 8))(v17, v25);
        uint64_t v64 = 0;
        uint64_t v55 = v85;
        uint64_t v57 = v86;
        uint64_t v62 = v87;
        goto LABEL_33;
      }
      (*(void (**)(char *, uint64_t))(v78 + 8))(v22, v47);
LABEL_20:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v26 + 8))(v17, v28);
      goto LABEL_21;
    case 5:
      long long v81 = (char *)*(unsigned __int8 *)(v24 + 32);
      LOBYTE(v85) = 5;
      sub_254EF15E8();
      uint64_t v51 = v23;
      uint64_t v52 = v88;
      sub_254EFD020();
      uint64_t v88 = v52;
      if (v52)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, char *))(v26 + 8))(v17, v25);
        goto LABEL_21;
      }
      long long v82 = v25;
      uint64_t v53 = v69;
      uint64_t v54 = sub_254EFD040();
      uint64_t v88 = 0;
      uint64_t v55 = v54;
      uint64_t v57 = v61;
      (*(void (**)(void, uint64_t))(v77 + 8))(v51, v53);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v67 + 8))(v17, v82);
      uint64_t v62 = 0;
      uint64_t v64 = 0;
LABEL_33:
      uint64_t v49 = (uint64_t)v84;
      uint64_t v60 = v79;
      char v36 = (char)v81;
LABEL_34:
      *(void *)uint64_t v60 = v55;
      *(void *)(v60 + 8) = v57;
      *(void *)(v60 + 16) = v62;
      *(void *)(v60 + 24) = v64;
      *(unsigned char *)(v60 + 32) = v36;
      break;
    default:
      long long v81 = (char *)*(unsigned __int8 *)(v24 + 32);
      LOBYTE(v85) = 0;
      sub_254EF1888();
      long long v27 = v66;
      uint64_t v28 = v25;
      uint64_t v29 = v88;
      sub_254EFD020();
      uint64_t v88 = v29;
      if (v29) {
        goto LABEL_20;
      }
      long long v82 = v25;
      LOBYTE(v85) = 0;
      uint64_t v30 = v65;
      uint64_t v31 = sub_254EFD060();
      uint64_t v88 = 0;
      uint64_t v55 = v31;
      uint64_t v57 = v56;
      LOBYTE(v85) = 1;
      uint64_t v58 = sub_254EFD060();
      char v83 = (void (**)(char *, char *))(v67 + 8);
      uint64_t v88 = 0;
      uint64_t v62 = v58;
      uint64_t v64 = v63;
      (*(void (**)(char *, uint64_t))(v68 + 8))(v27, v30);
      swift_bridgeObjectRelease();
      (*v83)(v17, v82);
      goto LABEL_33;
  }
  return __swift_destroy_boxed_opaque_existential_1(v49);
}

uint64_t sub_254EEBB48@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return StyleSheet.Rule.Declaration.init(from:)(a1, a2);
}

uint64_t sub_254EEBB60(void *a1)
{
  return StyleSheet.Rule.Declaration.encode(to:)(a1);
}

uint64_t sub_254EEBB7C()
{
  uint64_t v1 = 0x6564756C657270;
  if (*v0 != 1) {
    uint64_t v1 = 0x746172616C636564;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_254EEBBE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254EF59F8(a1, a2);
  *a3 = result;
  return result;
}

void sub_254EEBC0C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_254EEBC18(uint64_t a1)
{
  unint64_t v2 = sub_254EF1DBC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEBC54(uint64_t a1)
{
  unint64_t v2 = sub_254EF1DBC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EEBC90()
{
  if (*v0) {
    return 0x726F7779654B7461;
  }
  else {
    return 0x656966696C617571;
  }
}

uint64_t sub_254EEBCC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254EF5B74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_254EEBCF0(uint64_t a1)
{
  unint64_t v2 = sub_254EF1D68();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEBD2C(uint64_t a1)
{
  unint64_t v2 = sub_254EF1D68();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EEBD68()
{
  if (*v0) {
    return 0x746172616C636564;
  }
  else {
    return 0x726F7463656C6573;
  }
}

uint64_t sub_254EEBDAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254EF5C80(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_254EEBDD4(uint64_t a1)
{
  unint64_t v2 = sub_254EF1E64();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEBE10(uint64_t a1)
{
  unint64_t v2 = sub_254EF1E64();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StyleSheet.Rule.encode(to:)(void *a1)
{
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E710C8);
  uint64_t v23 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v25 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E710D0);
  uint64_t v21 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v22 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E710D8);
  uint64_t v30 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v27 = v1[1];
  uint64_t v28 = v8;
  uint64_t v20 = v1[2];
  uint64_t v9 = v1[4];
  char v10 = *((unsigned char *)v1 + 40);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254EF1D68();
  sub_254EFD1D0();
  if (v10)
  {
    uint64_t v24 = v9;
    uint64_t v11 = v23;
    LOBYTE(v32) = 1;
    sub_254EF1DBC();
    uint64_t v12 = v25;
    sub_254EFD0B0();
    LOBYTE(v32) = 0;
    uint64_t v13 = v26;
    uint64_t v14 = v29;
    sub_254EFD0E0();
    if (!v14)
    {
      LOBYTE(v32) = 1;
      sub_254EFD0E0();
      uint64_t v32 = v24;
      char v31 = 2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E70FD8);
      sub_254EF1EB8(&qword_269E710E0, &qword_269E70FD8, (void (*)(void))sub_254EF1E10);
      sub_254EFD100();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v12, v13);
  }
  else
  {
    uint64_t v15 = v21;
    LOBYTE(v32) = 0;
    sub_254EF1E64();
    uint64_t v16 = v22;
    sub_254EFD0B0();
    LOBYTE(v32) = 0;
    uint64_t v17 = v24;
    uint64_t v18 = v29;
    sub_254EFD0E0();
    if (!v18)
    {
      uint64_t v32 = v20;
      char v31 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E70FD8);
      sub_254EF1EB8(&qword_269E710E0, &qword_269E70FD8, (void (*)(void))sub_254EF1E10);
      sub_254EFD100();
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v17);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v7, v5);
}

uint64_t StyleSheet.Rule.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E710F0);
  uint64_t v44 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E710F8);
  uint64_t v45 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71100);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_254EF1D68();
  uint64_t v13 = v48;
  sub_254EFD1C0();
  if (!v13)
  {
    uint64_t v14 = v46;
    uint64_t v48 = v9;
    uint64_t v15 = sub_254EFD0A0();
    uint64_t v16 = v15;
    if (*(void *)(v15 + 16) == 1)
    {
      int v42 = *(unsigned __int8 *)(v15 + 32);
      if (v42)
      {
        LOBYTE(v50) = 1;
        sub_254EF1DBC();
        uint64_t v17 = v4;
        sub_254EFD020();
        LOBYTE(v50) = 0;
        uint64_t v18 = v14;
        uint64_t v25 = sub_254EFD060();
        uint64_t v27 = v26;
        uint64_t v45 = v16;
        LOBYTE(v50) = 1;
        uint64_t v28 = sub_254EFD060();
        uint64_t v33 = v32;
        uint64_t v38 = v28;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269E70FD8);
        char v49 = 2;
        sub_254EF1EB8(&qword_269E71108, &qword_269E70FD8, (void (*)(void))sub_254EF1F24);
        uint64_t v39 = v17;
        sub_254EFD080();
        uint64_t v40 = v25;
        uint64_t v41 = v27;
        (*(void (**)(char *, uint64_t))(v44 + 8))(v39, v18);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v11, v8);
        uint64_t v34 = v50;
        uint64_t v35 = v38;
      }
      else
      {
        LOBYTE(v50) = 0;
        sub_254EF1E64();
        sub_254EFD020();
        LOBYTE(v50) = 0;
        uint64_t v22 = v5;
        uint64_t v23 = v7;
        uint64_t v29 = sub_254EFD060();
        uint64_t v31 = v30;
        uint64_t v46 = (uint64_t)v11;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269E70FD8);
        char v49 = 1;
        sub_254EF1EB8(&qword_269E71108, &qword_269E70FD8, (void (*)(void))sub_254EF1F24);
        sub_254EFD080();
        uint64_t v40 = v29;
        uint64_t v41 = v31;
        (*(void (**)(char *, uint64_t))(v45 + 8))(v23, v22);
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v46, v8);
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        uint64_t v35 = v50;
      }
      char v36 = v43;
      uint64_t v37 = v41;
      uint64_t *v43 = v40;
      v36[1] = v37;
      _OWORD v36[2] = v35;
      v36[3] = v33;
      v36[4] = v34;
      *((unsigned char *)v36 + 40) = v42;
    }
    else
    {
      uint64_t v19 = sub_254EFCF50();
      swift_allocError();
      uint64_t v21 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E710A8);
      *uint64_t v21 = &type metadata for StyleSheet.Rule;
      sub_254EFD030();
      sub_254EFCF40();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x263F8DCB0], v19);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v11, v8);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
}

uint64_t sub_254EEC970@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return StyleSheet.Rule.init(from:)(a1, a2);
}

uint64_t sub_254EEC988(void *a1)
{
  return StyleSheet.Rule.encode(to:)(a1);
}

LinkPresentationStyleSheetParsing::StyleSheet __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> StyleSheet.init(css:)(Swift::String css)
{
  object = css._object;
  uint64_t countAndFlagsBits = css._countAndFlagsBits;
  uint64_t v5 = v1;
  uint64_t v6 = type metadata accessor for Tokenizer();
  uint64_t v10 = Tokenizer.__allocating_init(source:)(countAndFlagsBits, (uint64_t)object);
  swift_retain();
  TokenParser.init<A>(using:)((uint64_t)&v10, v6, (uint64_t)&protocol witness table for Tokenizer, v9);
  uint64_t v7 = TokenParser.parse()();
  sub_254EDFB74((uint64_t)v9);
  result.rules._rawValue = (void *)swift_release();
  if (!v2) {
    *uint64_t v5 = v7;
  }
  return result;
}

uint64_t StyleSheet.Color.red.getter()
{
  return *v0;
}

uint64_t StyleSheet.Color.green.getter()
{
  return *(unsigned int *)(v0 + 4);
}

uint64_t StyleSheet.Color.blue.getter()
{
  return *(unsigned int *)(v0 + 8);
}

uint64_t StyleSheet.Color.init(red:green:blue:)@<X0>(uint64_t result@<X0>, int a2@<W1>, int a3@<W2>, _DWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

int8x8_t StyleSheet.Color.init(value:)@<D0>(unsigned int a1@<W0>, int8x8_t *a2@<X8>)
{
  int8x8_t result = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a1), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL);
  *a2 = result;
  a2[1].i32[0] = a1;
  return result;
}

uint64_t sub_254EECAA0()
{
  uint64_t v1 = 0x6E65657267;
  if (*v0 != 1) {
    uint64_t v1 = 1702194274;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 6579570;
  }
}

uint64_t sub_254EECAE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254EF5D8C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_254EECB10(uint64_t a1)
{
  unint64_t v2 = sub_254EF1F78();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EECB4C(uint64_t a1)
{
  unint64_t v2 = sub_254EF1F78();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StyleSheet.Color.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71118);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[6] = *(_DWORD *)(v1 + 4);
  void v9[3] = *(_DWORD *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254EF1F78();
  sub_254EFD1D0();
  char v12 = 0;
  sub_254EFD110();
  if (!v2)
  {
    char v11 = 1;
    sub_254EFD110();
    char v10 = 2;
    sub_254EFD110();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t StyleSheet.Color.init(from:)@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71120);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254EF1F78();
  sub_254EFD1C0();
  if (!v2)
  {
    char v16 = 0;
    int v9 = sub_254EFD090();
    char v15 = 1;
    int v11 = sub_254EFD090();
    char v14 = 2;
    int v12 = sub_254EFD090();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

BOOL sub_254EECEF0(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t sub_254EECF20@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return StyleSheet.Color.init(from:)(a1, a2);
}

uint64_t sub_254EECF38(void *a1)
{
  return StyleSheet.Color.encode(to:)(a1);
}

LinkPresentationStyleSheetParsing::StyleSheet::TextAlign_optional __swiftcall StyleSheet.TextAlign.init(rawValue:)(Swift::String rawValue)
{
  return (LinkPresentationStyleSheetParsing::StyleSheet::TextAlign_optional)sub_254EEF430(v1);
}

uint64_t StyleSheet.TextAlign.rawValue.getter()
{
  uint64_t v1 = 0x7265746E6563;
  if (*v0 != 1) {
    uint64_t v1 = 0x7468676972;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1952867692;
  }
}

uint64_t sub_254EECFA8()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EED03C()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EED158()
{
  sub_254EFCC50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_254EED1D8()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EED268()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EED384()
{
  return sub_254EFD1B0();
}

LinkPresentationStyleSheetParsing::StyleSheet::TextAlign_optional sub_254EED49C(Swift::String *a1)
{
  return StyleSheet.TextAlign.init(rawValue:)(*a1);
}

void sub_254EED4A8(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  unint64_t v4 = 0xE600000000000000;
  uint64_t v5 = 0x7265746E6563;
  if (v2 != 1)
  {
    uint64_t v5 = 0x7468676972;
    unint64_t v4 = 0xE500000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1952867692;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_254EED4F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_254EE9A68(*a1, *a2);
}

uint64_t sub_254EED504()
{
  return sub_254EFCDB0();
}

uint64_t sub_254EED564()
{
  return sub_254EFCDA0();
}

void StyleSheet.Font.Specified.size.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(unsigned char *)(a1 + 8) = v2;
}

void StyleSheet.Font.Specified.weight.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 9);
}

void StyleSheet.Font.Specified.style.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 10);
}

void StyleSheet.Font.Specified.variant.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 11);
}

uint64_t StyleSheet.Font.Specified.family.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t StyleSheet.Font.Specified.init(size:weight:style:variant:family:)@<X0>(uint64_t result@<X0>, char *a2@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v6 = *(unsigned char *)(result + 8);
  char v7 = *a2;
  char v8 = *a3;
  char v9 = *a4;
  *(void *)a6 = *(void *)result;
  *(unsigned char *)(a6 + 8) = v6;
  *(unsigned char *)(a6 + 9) = v7;
  *(unsigned char *)(a6 + 10) = v8;
  *(unsigned char *)(a6 + 11) = v9;
  *(void *)(a6 + 16) = a5;
  return result;
}

BOOL sub_254EED628(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_254EED63C()
{
  uint64_t result = 1702521203;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x746867696577;
      break;
    case 2:
      uint64_t result = 0x656C797473;
      break;
    case 3:
      uint64_t result = 0x746E6169726176;
      break;
    case 4:
      uint64_t result = 0x796C696D6166;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_254EED6D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254EF5EBC(a1, a2);
  *a3 = result;
  return result;
}

void sub_254EED6FC(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_254EED708(uint64_t a1)
{
  unint64_t v2 = sub_254EF1FCC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EED744(uint64_t a1)
{
  unint64_t v2 = sub_254EF1FCC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StyleSheet.Font.Specified.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71128);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  char v8 = *((unsigned char *)v1 + 8);
  int v22 = *((unsigned __int8 *)v1 + 9);
  int v9 = *((unsigned __int8 *)v1 + 10);
  int v17 = *((unsigned __int8 *)v1 + 11);
  int v18 = v9;
  uint64_t v16 = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254EF1FCC();
  sub_254EFD1D0();
  uint64_t v20 = v7;
  char v21 = v8;
  char v23 = 0;
  sub_254EF2020();
  uint64_t v10 = v19;
  sub_254EFD0D0();
  if (!v10)
  {
    char v11 = v17;
    char v12 = v18;
    uint64_t v13 = v16;
    LOBYTE(v20) = v22;
    char v23 = 1;
    sub_254EF2074();
    sub_254EFD0D0();
    LOBYTE(v20) = v12;
    char v23 = 2;
    sub_254EF20C8();
    sub_254EFD0D0();
    LOBYTE(v20) = v11;
    char v23 = 3;
    sub_254EF211C();
    sub_254EFD0D0();
    uint64_t v20 = v13;
    char v23 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F90);
    sub_254EF22C0(&qword_269E71150);
    sub_254EFD0D0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t StyleSheet.Font.Specified.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71158);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254EF1FCC();
  sub_254EFD1C0();
  if (!v2)
  {
    char v18 = 0;
    sub_254EF2170();
    sub_254EFD050();
    uint64_t v9 = v15;
    char v10 = v16;
    char v18 = 1;
    sub_254EF21C4();
    sub_254EFD050();
    uint64_t v14 = v9;
    LODWORD(v9) = v15;
    char v18 = 2;
    sub_254EF2218();
    sub_254EFD050();
    int v17 = v9;
    LOBYTE(v9) = v15;
    char v18 = 3;
    sub_254EF226C();
    sub_254EFD050();
    HIDWORD(v13) = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F90);
    char v18 = 4;
    sub_254EF22C0(&qword_269E71180);
    sub_254EFD050();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v12 = v15;
    *(void *)a2 = v14;
    *(unsigned char *)(a2 + 8) = v10;
    *(unsigned char *)(a2 + 9) = v17;
    *(unsigned char *)(a2 + 10) = v9;
    *(unsigned char *)(a2 + 11) = BYTE4(v13);
    *(void *)(a2 + 16) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_254EEDD18@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return StyleSheet.Font.Specified.init(from:)(a1, a2);
}

uint64_t sub_254EEDD30(void *a1)
{
  return StyleSheet.Font.Specified.encode(to:)(a1);
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Weight_optional __swiftcall StyleSheet.Font.Weight.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_254EFD010();
  result.value = swift_bridgeObjectRelease();
  char v5 = 13;
  if (v3 < 0xD) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t StyleSheet.Font.Weight.rawValue.getter()
{
  uint64_t result = 0x6C616D726F6ELL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1684828002;
      break;
    case 2:
      uint64_t result = 0x7265646C6F62;
      break;
    case 3:
      uint64_t result = 0x7265746867696CLL;
      break;
    case 4:
      uint64_t result = 3158065;
      break;
    case 5:
      uint64_t result = 3158066;
      break;
    case 6:
      uint64_t result = 3158067;
      break;
    case 7:
      uint64_t result = 3158068;
      break;
    case 8:
      uint64_t result = 3158069;
      break;
    case 9:
      uint64_t result = 3158070;
      break;
    case 0xA:
      uint64_t result = 3158071;
      break;
    case 0xB:
      uint64_t result = 3158072;
      break;
    case 0xC:
      uint64_t result = 3158073;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_254EEDED8()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EEDF40()
{
  StyleSheet.Font.Weight.rawValue.getter();
  sub_254EFCC50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_254EEDFA4()
{
  return sub_254EFD1B0();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Weight_optional sub_254EEE008(Swift::String *a1)
{
  return StyleSheet.Font.Weight.init(rawValue:)(*a1);
}

uint64_t sub_254EEE014@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = StyleSheet.Font.Weight.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_254EEE03C()
{
  return sub_254EE9D80();
}

uint64_t sub_254EEE048()
{
  return sub_254EFCDB0();
}

uint64_t sub_254EEE0A8()
{
  return sub_254EFCDA0();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Size::Unit_optional __swiftcall StyleSheet.Font.Size.Unit.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_254EFD010();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t StyleSheet.Font.Size.Unit.rawValue.getter()
{
  uint64_t result = 37;
  switch(*v0)
  {
    case 1:
      uint64_t result = 30832;
      break;
    case 2:
      uint64_t result = 28005;
      break;
    case 3:
      uint64_t result = 30821;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_254EEE1B4()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EEE260()
{
  sub_254EFCC50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_254EEE2F4()
{
  return sub_254EFD1B0();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Size::Unit_optional sub_254EEE39C(Swift::String *a1)
{
  return StyleSheet.Font.Size.Unit.init(rawValue:)(*a1);
}

void sub_254EEE3A8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE100000000000000;
  uint64_t v3 = 37;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE200000000000000;
      uint64_t v3 = 30832;
      goto LABEL_3;
    case 2:
      *a1 = 28005;
      a1[1] = 0xE200000000000000;
      break;
    case 3:
      *a1 = 30821;
      a1[1] = 0xE200000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_254EEE414(char *a1, char *a2)
{
  return sub_254EE9FCC(*a1, *a2);
}

uint64_t sub_254EEE420()
{
  return sub_254EFCDB0();
}

uint64_t sub_254EEE480()
{
  return sub_254EFCDA0();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Size::Absolute_optional __swiftcall StyleSheet.Font.Size.Absolute.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_254EFD010();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

uint64_t StyleSheet.Font.Size.Absolute.rawValue.getter()
{
  uint64_t result = 0x6C6C616D732D7878;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6C6C616D732D78;
      break;
    case 2:
      uint64_t result = 0x6C6C616D73;
      break;
    case 3:
      uint64_t result = 0x6D756964656DLL;
      break;
    case 4:
      uint64_t result = 0x656772616CLL;
      break;
    case 5:
      uint64_t result = 0x656772616C2D78;
      break;
    case 6:
      uint64_t result = 0x656772616C2D7878;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_254EEE600()
{
  return sub_254EED268();
}

uint64_t sub_254EEE60C()
{
  sub_254EFCC50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_254EEE714()
{
  return sub_254EED268();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Size::Absolute_optional sub_254EEE71C(Swift::String *a1)
{
  return StyleSheet.Font.Size.Absolute.init(rawValue:)(*a1);
}

void sub_254EEE728(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE800000000000000;
  uint64_t v3 = 0x6C6C616D732D7878;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x6C6C616D732D78;
      goto LABEL_3;
    case 2:
      *a1 = 0x6C6C616D73;
      a1[1] = 0xE500000000000000;
      break;
    case 3:
      *a1 = 0x6D756964656DLL;
      a1[1] = 0xE600000000000000;
      break;
    case 4:
      *a1 = 0x656772616CLL;
      a1[1] = 0xE500000000000000;
      break;
    case 5:
      *a1 = 0x656772616C2D78;
      a1[1] = 0xE700000000000000;
      break;
    case 6:
      *a1 = 0x656772616C2D7878;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_254EEE814(unsigned __int8 *a1, char *a2)
{
  return sub_254EEA100(*a1, *a2);
}

uint64_t sub_254EEE820()
{
  return sub_254EFCDB0();
}

uint64_t sub_254EEE880()
{
  return sub_254EFCDA0();
}

uint64_t static StyleSheet.Font.Size.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v4 = *(double *)a1;
  int v5 = *(char *)(a1 + 8);
  double v6 = *(double *)a2;
  int v7 = *(char *)(a2 + 8);
  if ((v5 & 0x80000000) == 0)
  {
    if ((v7 & 0x80000000) == 0 && v4 == v6) {
      return sub_254EE9FCC(v5, v7);
    }
    return 0;
  }
  if ((v7 & 0x80000000) == 0) {
    return 0;
  }
  return sub_254EEA100(LOBYTE(v4), SLOBYTE(v6));
}

uint64_t sub_254EEE91C(uint64_t a1)
{
  unint64_t v2 = sub_254EF2378();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEE958(uint64_t a1)
{
  unint64_t v2 = sub_254EF2378();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EEE994()
{
  if (*v0) {
    return 0x6574756C6F736261;
  }
  else {
    return 0x6569666963657073;
  }
}

uint64_t sub_254EEE9D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254EF60B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_254EEE9FC(uint64_t a1)
{
  unint64_t v2 = sub_254EF2324();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEEA38(uint64_t a1)
{
  unint64_t v2 = sub_254EF2324();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EEEA74()
{
  if (*v0) {
    return 1953066613;
  }
  else {
    return 0x65756C6176;
  }
}

uint64_t sub_254EEEAA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254EF61B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_254EEEACC(uint64_t a1)
{
  unint64_t v2 = sub_254EF2420();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEEB08(uint64_t a1)
{
  unint64_t v2 = sub_254EF2420();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StyleSheet.Font.Size.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71188);
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v20 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71190);
  uint64_t v23 = *(void *)(v5 - 8);
  uint64_t v24 = v5;
  MEMORY[0x270FA5388](v5);
  int v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71198);
  uint64_t v8 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  char v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  int v12 = *((char *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254EF2324();
  sub_254EFD1D0();
  if (v12 < 0)
  {
    char v32 = 1;
    sub_254EF2378();
    int v17 = v20;
    uint64_t v18 = v26;
    sub_254EFD0B0();
    char v31 = v11;
    sub_254EF23CC();
    uint64_t v19 = v22;
    sub_254EFD100();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v17, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  }
  else
  {
    char v30 = 0;
    sub_254EF2420();
    uint64_t v13 = v26;
    sub_254EFD0B0();
    char v29 = 0;
    uint64_t v15 = v24;
    uint64_t v14 = v25;
    sub_254EFD0F0();
    if (!v14)
    {
      char v28 = v12;
      char v27 = 1;
      sub_254EF2474();
      sub_254EFD100();
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v15);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v13);
  }
}

uint64_t StyleSheet.Font.Size.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  char v27 = a2;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E711B0);
  uint64_t v28 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E711B8);
  uint64_t v29 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E711C0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  char v31 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_254EF2324();
  uint64_t v13 = v32;
  sub_254EFD1C0();
  if (v13) {
    goto LABEL_7;
  }
  uint64_t v14 = v30;
  uint64_t v32 = v9;
  uint64_t v15 = sub_254EFD0A0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v18 = sub_254EFCF50();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E710A8);
    *uint64_t v20 = &type metadata for StyleSheet.Font.Size;
    sub_254EFD030();
    sub_254EFCF40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCB0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v8);
LABEL_7:
    uint64_t v21 = (uint64_t)v31;
    return __swift_destroy_boxed_opaque_existential_1(v21);
  }
  if (*(unsigned char *)(v15 + 32))
  {
    char v38 = 1;
    sub_254EF2378();
    sub_254EFD020();
    sub_254EF24C8();
    sub_254EFD080();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v14);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v8);
    uint64_t v16 = v37;
    char v17 = 0x80;
  }
  else
  {
    char v36 = 0;
    sub_254EF2420();
    sub_254EFD020();
    char v35 = 0;
    sub_254EFD070();
    uint64_t v24 = v23;
    char v33 = 1;
    sub_254EF251C();
    sub_254EFD080();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v8);
    char v17 = v34;
    uint64_t v16 = v24;
  }
  uint64_t v21 = (uint64_t)v31;
  uint64_t v25 = v27;
  *char v27 = v16;
  *((unsigned char *)v25 + 8) = v17;
  return __swift_destroy_boxed_opaque_existential_1(v21);
}

uint64_t sub_254EEF3A8(uint64_t a1, uint64_t a2)
{
  double v4 = *(double *)a1;
  int v5 = *(char *)(a1 + 8);
  double v6 = *(double *)a2;
  int v7 = *(char *)(a2 + 8);
  if ((v5 & 0x80000000) == 0)
  {
    if ((v7 & 0x80000000) == 0 && v4 == v6) {
      return sub_254EE9FCC(v5, v7);
    }
    return 0;
  }
  if ((v7 & 0x80000000) == 0) {
    return 0;
  }
  return sub_254EEA100(LOBYTE(v4), SLOBYTE(v6));
}

uint64_t sub_254EEF3F4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return StyleSheet.Font.Size.init(from:)(a1, a2);
}

uint64_t sub_254EEF40C(void *a1)
{
  return StyleSheet.Font.Size.encode(to:)(a1);
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Style_optional __swiftcall StyleSheet.Font.Style.init(rawValue:)(Swift::String rawValue)
{
  return (LinkPresentationStyleSheetParsing::StyleSheet::Font::Style_optional)sub_254EEF430(v1);
}

uint64_t sub_254EEF430@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_254EFD010();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 3;
  if (v2 < 3) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t StyleSheet.Font.Style.rawValue.getter()
{
  uint64_t v1 = 0x63696C617469;
  if (*v0 != 1) {
    uint64_t v1 = 0x657571696C626FLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6C616D726F6ELL;
  }
}

uint64_t sub_254EEF4DC()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EEF578()
{
  sub_254EFCC50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_254EEF600()
{
  return sub_254EFD1B0();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Style_optional sub_254EEF698(Swift::String *a1)
{
  return StyleSheet.Font.Style.init(rawValue:)(*a1);
}

void sub_254EEF6A4(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE600000000000000;
  unint64_t v4 = 0xE600000000000000;
  uint64_t v5 = 0x63696C617469;
  if (v2 != 1)
  {
    uint64_t v5 = 0x657571696C626FLL;
    unint64_t v4 = 0xE700000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6C616D726F6ELL;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_254EEF6FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_254EE9E18(*a1, *a2);
}

uint64_t sub_254EEF708()
{
  return sub_254EFCDB0();
}

uint64_t sub_254EEF768()
{
  return sub_254EFCDA0();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Variant_optional __swiftcall StyleSheet.Font.Variant.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  uint64_t v3 = sub_254EFD010();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *int v2 = v5;
  return result;
}

uint64_t StyleSheet.Font.Variant.rawValue.getter()
{
  if (*v0) {
    return 0x61632D6C6C616D73;
  }
  else {
    return 0x6C616D726F6ELL;
  }
}

uint64_t sub_254EEF858()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EEF8DC()
{
  sub_254EFCC50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_254EEF94C()
{
  return sub_254EFD1B0();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Variant_optional sub_254EEF9CC(Swift::String *a1)
{
  return StyleSheet.Font.Variant.init(rawValue:)(*a1);
}

void sub_254EEF9D8(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6C616D726F6ELL;
  if (*v1) {
    uint64_t v2 = 0x61632D6C6C616D73;
  }
  unint64_t v3 = 0xE600000000000000;
  if (*v1) {
    unint64_t v3 = 0xEA00000000007370;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_254EEFA18(char *a1, char *a2)
{
  return sub_254EE9F24(*a1, *a2);
}

uint64_t sub_254EEFA24()
{
  return sub_254EFCDB0();
}

uint64_t sub_254EEFA84()
{
  return sub_254EFCDA0();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::System_optional __swiftcall StyleSheet.Font.System.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_254EFD010();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t StyleSheet.Font.System.rawValue.getter()
{
  uint64_t result = 0x6E6F6974706163;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1852793705;
      break;
    case 2:
      uint64_t result = 1970169197;
      break;
    case 3:
      uint64_t result = 0x2D6567617373656DLL;
      break;
    case 4:
      uint64_t result = 0x61632D6C6C616D73;
      break;
    case 5:
      uint64_t result = 0x622D737574617473;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_254EEFC00()
{
  return sub_254EED03C();
}

uint64_t sub_254EEFC08()
{
  sub_254EFCC50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_254EEFD0C()
{
  return sub_254EED384();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::System_optional sub_254EEFD14(Swift::String *a1)
{
  return StyleSheet.Font.System.init(rawValue:)(*a1);
}

void sub_254EEFD20(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x6E6F6974706163;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1852793705;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 1970169197;
      *(void *)(a1 + 8) = 0xE400000000000000;
      break;
    case 3:
      *(void *)a1 = 0x2D6567617373656DLL;
      *(void *)(a1 + 8) = 0xEB00000000786F62;
      break;
    case 4:
      strcpy((char *)a1, "small-caption");
      *(_WORD *)(a1 + 14) = -4864;
      break;
    case 5:
      *(void *)a1 = 0x622D737574617473;
      *(void *)(a1 + 8) = 0xEA00000000007261;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_254EEFE04(unsigned __int8 *a1, char *a2)
{
  return sub_254EE9B64(*a1, *a2);
}

uint64_t sub_254EEFE10()
{
  return sub_254EFCDB0();
}

uint64_t sub_254EEFE70()
{
  return sub_254EFCDA0();
}

uint64_t sub_254EEFEC0()
{
  if (*v0) {
    return 0x6D6574737973;
  }
  else {
    return 0x6569666963657073;
  }
}

uint64_t sub_254EEFEFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254EF6290(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_254EEFF24(uint64_t a1)
{
  unint64_t v2 = sub_254EF2570();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEFF60(uint64_t a1)
{
  unint64_t v2 = sub_254EF2570();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EEFF9C(uint64_t a1)
{
  unint64_t v2 = sub_254EF266C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EEFFD8(uint64_t a1)
{
  unint64_t v2 = sub_254EF266C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_254EF0014()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EF0058()
{
  return sub_254EFD1B0();
}

uint64_t sub_254EF0098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_254EFD140();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_254EF0118(uint64_t a1)
{
  unint64_t v2 = sub_254EF25C4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254EF0154(uint64_t a1)
{
  unint64_t v2 = sub_254EF25C4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StyleSheet.Font.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E711D8);
  uint64_t v17 = *(void *)(v3 - 8);
  uint64_t v18 = v3;
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E711E0);
  uint64_t v20 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E711E8);
  uint64_t v22 = *(void *)(v9 - 8);
  uint64_t v23 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v1[1];
  uint64_t v21 = *v1;
  uint64_t v19 = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254EF2570();
  sub_254EFD1D0();
  if (v12 < 0)
  {
    LOBYTE(v24) = 1;
    sub_254EF25C4();
    uint64_t v15 = v23;
    sub_254EFD0B0();
    LOBYTE(v24) = v21;
    sub_254EF2618();
    uint64_t v16 = v18;
    sub_254EFD100();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v16);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v11, v15);
  }
  else
  {
    LOBYTE(v24) = 0;
    sub_254EF266C();
    uint64_t v13 = v23;
    sub_254EFD0B0();
    uint64_t v24 = v21;
    __int16 v25 = v12;
    char v26 = BYTE2(v12);
    char v27 = BYTE3(v12);
    uint64_t v28 = v19;
    sub_254EF26C0();
    sub_254EFD100();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v11, v13);
  }
}

uint64_t StyleSheet.Font.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __int16 v25 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71200);
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71208);
  uint64_t v26 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E71210);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  uint64_t v29 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_254EF2570();
  uint64_t v14 = v33;
  sub_254EFD1C0();
  if (!v14)
  {
    uint64_t v15 = v28;
    uint64_t v33 = v10;
    uint64_t v16 = sub_254EFD0A0();
    if (*(void *)(v16 + 16) == 1)
    {
      if (*(unsigned char *)(v16 + 32))
      {
        LOBYTE(v30) = 1;
        sub_254EF25C4();
        sub_254EFD020();
        sub_254EF2714();
        sub_254EFD080();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v15);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v9);
        uint64_t v21 = 0;
        uint64_t v22 = v30;
        unint64_t v23 = 0x8000000000000000;
      }
      else
      {
        LOBYTE(v30) = 0;
        sub_254EF266C();
        sub_254EFD020();
        sub_254EF2768();
        sub_254EFD080();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v6);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v9);
        uint64_t v22 = v30;
        unint64_t v23 = v31;
        uint64_t v21 = v32;
      }
      uint64_t v24 = v25;
      *__int16 v25 = v22;
      v24[1] = v23;
      v24[2] = v21;
    }
    else
    {
      uint64_t v17 = sub_254EFCF50();
      swift_allocError();
      uint64_t v19 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E710A8);
      *uint64_t v19 = &type metadata for StyleSheet.Font;
      sub_254EFD030();
      sub_254EFCF40();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCB0], v17);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v9);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
}

uint64_t sub_254EF09C0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return StyleSheet.Font.init(from:)(a1, a2);
}

uint64_t sub_254EF09D8(void *a1)
{
  return StyleSheet.Font.encode(to:)(a1);
}

BOOL _s33LinkPresentationStyleSheetParsing0cD0V4FontO9SpecifiedV2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a1 + 8);
  int v5 = *(unsigned __int8 *)(a1 + 9);
  int v6 = *(unsigned __int8 *)(a1 + 10);
  int v7 = *(unsigned __int8 *)(a1 + 11);
  uint64_t v8 = *(void **)(a1 + 16);
  unsigned int v9 = *(unsigned __int8 *)(a2 + 8);
  int v10 = *(unsigned __int8 *)(a2 + 9);
  int v11 = *(unsigned __int8 *)(a2 + 10);
  int v12 = *(unsigned __int8 *)(a2 + 11);
  uint64_t v13 = *(void **)(a2 + 16);
  if (v4 <= 0xFB)
  {
    if (v9 > 0xFB) {
      return 0;
    }
    double v14 = *(double *)a1;
    double v15 = *(double *)a2;
    if ((v4 & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || (sub_254EEA100(LOBYTE(v14), SLOBYTE(v15)) & 1) == 0) {
        return 0;
      }
    }
    else if ((v9 & 0x80) != 0 || v14 != v15 || (sub_254EE9FCC(v4, v9) & 1) == 0)
    {
      return 0;
    }
  }
  else if (v9 <= 0xFB)
  {
    return 0;
  }
  if (v5 == 13)
  {
    if (v10 != 13) {
      return 0;
    }
  }
  else
  {
    if (v10 == 13) {
      return 0;
    }
    uint64_t v16 = StyleSheet.Font.Weight.rawValue.getter();
    uint64_t v18 = v17;
    if (v16 == StyleSheet.Font.Weight.rawValue.getter() && v18 == v19)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v20 = sub_254EFD140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL result = 0;
      if ((v20 & 1) == 0) {
        return result;
      }
    }
  }
  if (v6 == 3)
  {
    if (v11 != 3) {
      return 0;
    }
  }
  else
  {
    if (v11 == 3) {
      return 0;
    }
    unint64_t v22 = 0xE600000000000000;
    uint64_t v23 = 0x63696C617469;
    if (v6 != 1)
    {
      uint64_t v23 = 0x657571696C626FLL;
      unint64_t v22 = 0xE700000000000000;
    }
    if (v6) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0x6C616D726F6ELL;
    }
    if (v6) {
      unint64_t v25 = v22;
    }
    else {
      unint64_t v25 = 0xE600000000000000;
    }
    unint64_t v26 = 0xE600000000000000;
    uint64_t v27 = 0x63696C617469;
    if (v11 != 1)
    {
      uint64_t v27 = 0x657571696C626FLL;
      unint64_t v26 = 0xE700000000000000;
    }
    if (v11) {
      uint64_t v28 = v27;
    }
    else {
      uint64_t v28 = 0x6C616D726F6ELL;
    }
    if (v11) {
      unint64_t v29 = v26;
    }
    else {
      unint64_t v29 = 0xE600000000000000;
    }
    if (v24 == v28 && v25 == v29)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v30 = sub_254EFD140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL result = 0;
      if ((v30 & 1) == 0) {
        return result;
      }
    }
  }
  if (v7 == 2)
  {
    if (v12 != 2) {
      return 0;
    }
  }
  else
  {
    if (v12 == 2) {
      return 0;
    }
    if (v7) {
      uint64_t v31 = 0x61632D6C6C616D73;
    }
    else {
      uint64_t v31 = 0x6C616D726F6ELL;
    }
    if (v7) {
      unint64_t v32 = 0xEA00000000007370;
    }
    else {
      unint64_t v32 = 0xE600000000000000;
    }
    if (v12) {
      uint64_t v33 = 0x61632D6C6C616D73;
    }
    else {
      uint64_t v33 = 0x6C616D726F6ELL;
    }
    if (v12) {
      unint64_t v34 = 0xEA00000000007370;
    }
    else {
      unint64_t v34 = 0xE600000000000000;
    }
    if (v31 == v33 && v32 == v34)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v35 = sub_254EFD140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL result = 0;
      if ((v35 & 1) == 0) {
        return result;
      }
    }
  }
  if (v8) {
    return v13 && (sub_254EE939C(v8, v13) & 1) != 0;
  }
  return !v13;
}

uint64_t _s33LinkPresentationStyleSheetParsing0cD0V4FontO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = *a2;
  uint64_t v5 = a2[1];
  if (v2 < 0)
  {
    if (v5 < 0)
    {
      char v7 = sub_254EE9B64(*a1, *a2);
      sub_254EF2ED8(v3, v2);
      sub_254EF2ED8(v6, v5);
      return v7 & 1;
    }
LABEL_7:
    sub_254EF2E38(v6, v5);
    sub_254EF2ED8(v3, v2);
    sub_254EF2ED8(v6, v5);
    char v7 = 0;
    return v7 & 1;
  }
  if (v5 < 0)
  {
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  uint64_t v13 = a2[2];
  uint64_t v14 = v3;
  __int16 v15 = v2;
  char v16 = BYTE2(v2);
  char v17 = BYTE3(v2);
  uint64_t v18 = v4;
  uint64_t v9 = v6;
  __int16 v10 = v5;
  char v11 = BYTE2(v5);
  char v12 = BYTE3(v5);
  sub_254EF2E38(v6, v5);
  sub_254EF2E38(v3, v2);
  sub_254EF2E38(v3, v2);
  sub_254EF2E38(v6, v5);
  char v7 = _s33LinkPresentationStyleSheetParsing0cD0V4FontO9SpecifiedV2eeoiySbAG_AGtFZ_0((uint64_t)&v14, (uint64_t)&v9);
  sub_254EF2ED8(v3, v2);
  sub_254EF2ED8(v6, v5);
  sub_254EF2ED8(v6, v5);
  sub_254EF2ED8(v3, v2);
  return v7 & 1;
}

uint64_t _s33LinkPresentationStyleSheetParsing0cD0V4RuleO11DeclarationO2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  char v6 = *(unsigned char *)(a1 + 32);
  uint64_t v7 = *(void *)a2;
  uint64_t v8 = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  int v11 = *(unsigned __int8 *)(a2 + 32);
  switch(v6)
  {
    case 1:
      if (v11 != 1) {
        goto LABEL_47;
      }
      sub_254EF2E5C(*(void *)a1, v3, v5, v4, 1);
      sub_254EF2E5C(v7, v8, v10, v9, 1);
      char v13 = v2 == v7 && v3 == v8;
      return v13 & 1;
    case 2:
      if (v11 != 2) {
        goto LABEL_47;
      }
      sub_254EF2E5C(*(void *)a1, v3, v5, v4, 2);
      sub_254EF2E5C(v7, v8, v10, v9, 2);
      if ((v3 & 0x100000000) != 0)
      {
        if ((v8 & 0x100000000) != 0) {
          goto LABEL_64;
        }
        goto LABEL_49;
      }
      if ((v8 & 0x100000000) != 0
        || v2 != v7
        || __PAIR64__(v3, HIDWORD(v2)) != __PAIR64__(v8, HIDWORD(v7)))
      {
        goto LABEL_49;
      }
      goto LABEL_64;
    case 3:
      if (v11 != 3) {
        goto LABEL_47;
      }
      int v14 = *(void *)a1;
      if (*(void *)a1)
      {
        if (v14 == 1) {
          uint64_t v15 = 0x7265746E6563;
        }
        else {
          uint64_t v15 = 0x7468676972;
        }
        if (v14 == 1) {
          unint64_t v16 = 0xE600000000000000;
        }
        else {
          unint64_t v16 = 0xE500000000000000;
        }
        int v17 = *(void *)a2;
        if (*(void *)a2) {
          goto LABEL_26;
        }
LABEL_66:
        unint64_t v19 = 0xE400000000000000;
        if (v15 != 1952867692) {
          goto LABEL_69;
        }
        goto LABEL_67;
      }
      unint64_t v16 = 0xE400000000000000;
      uint64_t v15 = 1952867692;
      int v17 = *(void *)a2;
      if (!*(void *)a2) {
        goto LABEL_66;
      }
LABEL_26:
      if (v17 == 1) {
        uint64_t v18 = 0x7265746E6563;
      }
      else {
        uint64_t v18 = 0x7468676972;
      }
      if (v17 == 1) {
        unint64_t v19 = 0xE600000000000000;
      }
      else {
        unint64_t v19 = 0xE500000000000000;
      }
      if (v15 != v18) {
        goto LABEL_69;
      }
LABEL_67:
      if (v16 == v19)
      {
        swift_bridgeObjectRelease_n();
        sub_254EF2E5C(v2, v3, v5, v4, 3);
        uint64_t v31 = v7;
        uint64_t v32 = v8;
        uint64_t v33 = v10;
        uint64_t v34 = v9;
        char v35 = 3;
        goto LABEL_75;
      }
LABEL_69:
      char v36 = sub_254EFD140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_254EF2E5C(v2, v3, v5, v4, 3);
      sub_254EF2E5C(v7, v8, v10, v9, 3);
      return v36 & 1;
    case 4:
      if (v11 == 4)
      {
        v38[0] = *(void *)a1;
        v38[1] = v3;
        v38[2] = v5;
        v37[0] = v7;
        v37[1] = v8;
        v37[2] = v10;
        sub_254EF2DBC(v7, v8, v10, v9, 4);
        sub_254EF2DBC(v2, v3, v5, v4, 4);
        sub_254EF2DBC(v7, v8, v10, v9, 4);
        sub_254EF2DBC(v2, v3, v5, v4, 4);
        char v13 = _s33LinkPresentationStyleSheetParsing0cD0V4FontO2eeoiySbAE_AEtFZ_0(v38, v37);
        sub_254EF2E5C(v2, v3, v5, v4, 4);
        sub_254EF2E5C(v7, v8, v10, v9, 4);
        sub_254EF2E5C(v7, v8, v10, v9, 4);
        sub_254EF2E5C(v2, v3, v5, v4, 4);
        return v13 & 1;
      }
      sub_254EF2E38(*(void *)a1, v3);
      goto LABEL_47;
    case 5:
      if (v11 != 5) {
        goto LABEL_46;
      }
      if (v3)
      {
        if (v8)
        {
          uint64_t v20 = *(void *)a1;
          if (v2 != v7 || v3 != v8)
          {
            char v22 = sub_254EFD140();
            sub_254EF2DBC(v7, v8, v10, v9, 5);
            sub_254EF2DBC(v2, v3, v5, v4, 5);
            sub_254EF2E5C(v2, v3, v5, v4, 5);
            sub_254EF2E5C(v7, v8, v10, v9, 5);
            if ((v22 & 1) == 0) {
              goto LABEL_49;
            }
            goto LABEL_64;
          }
          sub_254EF2DBC(v20, v3, v10, v9, 5);
          sub_254EF2DBC(v2, v3, v5, v4, 5);
          sub_254EF2E5C(v2, v3, v5, v4, 5);
          uint64_t v31 = v2;
          uint64_t v32 = v3;
          uint64_t v33 = v10;
          uint64_t v34 = v9;
          char v35 = 5;
LABEL_75:
          sub_254EF2E5C(v31, v32, v33, v34, v35);
          char v13 = 1;
          return v13 & 1;
        }
        sub_254EF2DBC(*(void *)a2, 0, v10, v9, 5);
        sub_254EF2DBC(v2, v3, v5, v4, 5);
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_254EF2DBC(v7, v8, v10, v9, 5);
        sub_254EF2DBC(v2, 0, v5, v4, 5);
        sub_254EF2E5C(v2, 0, v5, v4, 5);
        sub_254EF2E5C(v7, v8, v10, v9, 5);
        if (!v8)
        {
LABEL_64:
          char v13 = 1;
          return v13 & 1;
        }
      }
      sub_254EF2E5C(v2, v3, v5, v4, 5);
      uint64_t v23 = v7;
      uint64_t v24 = v8;
      uint64_t v25 = v10;
      uint64_t v26 = v9;
      char v27 = 5;
LABEL_48:
      sub_254EF2E5C(v23, v24, v25, v26, v27);
LABEL_49:
      char v13 = 0;
      return v13 & 1;
    default:
      if (*(unsigned char *)(a2 + 32))
      {
        swift_bridgeObjectRetain();
LABEL_46:
        swift_bridgeObjectRetain();
LABEL_47:
        sub_254EF2DBC(v7, v8, v10, v9, v11);
        sub_254EF2E5C(v2, v3, v5, v4, v6);
        uint64_t v23 = v7;
        uint64_t v24 = v8;
        uint64_t v25 = v10;
        uint64_t v26 = v9;
        char v27 = v11;
        goto LABEL_48;
      }
      BOOL v29 = v2 == v7 && v3 == v8;
      if (!v29 && (sub_254EFD140() & 1) == 0)
      {
        sub_254EF2DBC(v7, v8, v10, v9, 0);
        sub_254EF2DBC(v2, v3, v5, v4, 0);
        sub_254EF2E5C(v2, v3, v5, v4, 0);
        uint64_t v23 = v7;
        uint64_t v24 = v8;
        uint64_t v25 = v10;
        uint64_t v26 = v9;
        char v27 = 0;
        goto LABEL_48;
      }
      if (v5 == v10 && v4 == v9) {
        char v13 = 1;
      }
      else {
        char v13 = sub_254EFD140();
      }
      sub_254EF2DBC(v7, v8, v10, v9, 0);
      sub_254EF2DBC(v2, v3, v5, v4, 0);
      sub_254EF2E5C(v2, v3, v5, v4, 0);
      sub_254EF2E5C(v7, v8, v10, v9, 0);
      return v13 & 1;
  }
}

unint64_t sub_254EF1594()
{
  unint64_t result = qword_269E71B08;
  if (!qword_269E71B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B08);
  }
  return result;
}

unint64_t sub_254EF15E8()
{
  unint64_t result = qword_269E71B10;
  if (!qword_269E71B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B10);
  }
  return result;
}

unint64_t sub_254EF163C()
{
  unint64_t result = qword_269E71B18;
  if (!qword_269E71B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B18);
  }
  return result;
}

unint64_t sub_254EF1690()
{
  unint64_t result = qword_269E71058;
  if (!qword_269E71058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71058);
  }
  return result;
}

unint64_t sub_254EF16E4()
{
  unint64_t result = qword_269E71B20;
  if (!qword_269E71B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B20);
  }
  return result;
}

unint64_t sub_254EF1738()
{
  unint64_t result = qword_269E71060;
  if (!qword_269E71060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71060);
  }
  return result;
}

unint64_t sub_254EF178C()
{
  unint64_t result = qword_269E71B28;
  if (!qword_269E71B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B28);
  }
  return result;
}

unint64_t sub_254EF17E0()
{
  unint64_t result = qword_269E71068;
  if (!qword_269E71068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71068);
  }
  return result;
}

unint64_t sub_254EF1834()
{
  unint64_t result = qword_269E71B30;
  if (!qword_269E71B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B30);
  }
  return result;
}

unint64_t sub_254EF1888()
{
  unint64_t result = qword_269E71B38;
  if (!qword_269E71B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B38);
  }
  return result;
}

unint64_t sub_254EF18DC()
{
  unint64_t result = qword_269E710B0;
  if (!qword_269E710B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E710B0);
  }
  return result;
}

unint64_t sub_254EF1930()
{
  unint64_t result = qword_269E710B8;
  if (!qword_269E710B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E710B8);
  }
  return result;
}

unint64_t sub_254EF1984()
{
  unint64_t result = qword_269E710C0;
  if (!qword_269E710C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E710C0);
  }
  return result;
}

uint64_t _s33LinkPresentationStyleSheetParsing0cD0V4RuleO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 40);
  uint64_t v9 = *(void *)a2;
  uint64_t v8 = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v11 = *(void *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 32);
  char v13 = *(unsigned char *)(a2 + 40);
  uint64_t v37 = v8;
  if ((v7 & 1) == 0)
  {
    if ((*(unsigned char *)(a2 + 40) & 1) == 0)
    {
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)a1;
      if (v2 == v9 && v3 == v8
        || (v29 = *(void *)a2, v30 = *(void *)(a2 + 8), v31 = sub_254EFD140(), uint64_t v9 = v29, v8 = v30, (v31 & 1) != 0))
      {
        uint64_t v24 = v9;
        sub_254EE85A4(v9, v8, v10, v11, v12, 0);
        sub_254EE85A4(v28, v3, v5, v4, v27, 0);
        char v32 = sub_254EE92F0(v5, v10);
        uint64_t v23 = v27;
        uint64_t v25 = v4;
        char v26 = v32;
        char v7 = 0;
        uint64_t v2 = v28;
        char v13 = 0;
        goto LABEL_22;
      }
      uint64_t v33 = v30;
      uint64_t v24 = v29;
      sub_254EE85A4(v29, v33, v10, v11, v12, 0);
      sub_254EE85A4(v28, v3, v5, v4, v27, 0);
      uint64_t v23 = v27;
      char v7 = 0;
      uint64_t v2 = v28;
      char v13 = 0;
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v36 = *(void *)a2;
    sub_254EE85A4(v9, v8, v10, v11, v12, v13);
    sub_254EE85A4(v2, v3, v5, v4, v6, v7);
    uint64_t v23 = v6;
    uint64_t v24 = v36;
LABEL_12:
    uint64_t v25 = v4;
    char v26 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)(a2 + 40) & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v35 = *(void *)(a1 + 32);
  if (v2 == v9 && v3 == v8
    || (v14 = *(void *)a2, v15 = *(void *)(a2 + 8), v16 = sub_254EFD140(), uint64_t v9 = v14, v8 = v15, (v16 & 1) != 0))
  {
    uint64_t v17 = v5;
    if (v5 == v10 && v4 == v11 || (v18 = v9, v19 = v8, v20 = sub_254EFD140(), uint64_t v9 = v18, v8 = v19, (v20 & 1) != 0))
    {
      char v7 = 1;
      uint64_t v21 = v9;
      sub_254EE85A4(v9, v8, v10, v11, v12, 1);
      sub_254EE85A4(v2, v3, v17, v4, v35, 1);
      char v22 = sub_254EE92F0(v35, v12);
      uint64_t v23 = v35;
      uint64_t v24 = v21;
      uint64_t v25 = v4;
      char v26 = v22;
    }
    else
    {
      char v7 = 1;
      sub_254EE85A4(v18, v8, v10, v11, v12, 1);
      sub_254EE85A4(v2, v3, v17, v4, v35, 1);
      uint64_t v23 = v35;
      uint64_t v24 = v18;
      uint64_t v25 = v4;
      char v26 = 0;
    }
    uint64_t v5 = v17;
  }
  else
  {
    char v7 = 1;
    sub_254EE85A4(v14, v8, v10, v11, v12, 1);
    sub_254EE85A4(v2, v3, v5, v4, v35, 1);
    uint64_t v23 = v35;
    uint64_t v25 = v4;
    char v26 = 0;
    uint64_t v24 = v14;
  }
  char v13 = 1;
LABEL_22:
  sub_254EE8600(v2, v3, v5, v25, v23, v7);
  sub_254EE8600(v24, v37, v10, v11, v12, v13);
  return v26 & 1;
}

unint64_t sub_254EF1D68()
{
  unint64_t result = qword_269E71B40;
  if (!qword_269E71B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B40);
  }
  return result;
}

unint64_t sub_254EF1DBC()
{
  unint64_t result = qword_269E71B48;
  if (!qword_269E71B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B48);
  }
  return result;
}

unint64_t sub_254EF1E10()
{
  unint64_t result = qword_269E710E8;
  if (!qword_269E710E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E710E8);
  }
  return result;
}

unint64_t sub_254EF1E64()
{
  unint64_t result = qword_269E71B50;
  if (!qword_269E71B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B50);
  }
  return result;
}

uint64_t sub_254EF1EB8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_254EF1F24()
{
  unint64_t result = qword_269E71110;
  if (!qword_269E71110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71110);
  }
  return result;
}

unint64_t sub_254EF1F78()
{
  unint64_t result = qword_269E71B58;
  if (!qword_269E71B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B58);
  }
  return result;
}

unint64_t sub_254EF1FCC()
{
  unint64_t result = qword_269E71B60;
  if (!qword_269E71B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B60);
  }
  return result;
}

unint64_t sub_254EF2020()
{
  unint64_t result = qword_269E71130;
  if (!qword_269E71130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71130);
  }
  return result;
}

unint64_t sub_254EF2074()
{
  unint64_t result = qword_269E71138;
  if (!qword_269E71138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71138);
  }
  return result;
}

unint64_t sub_254EF20C8()
{
  unint64_t result = qword_269E71140;
  if (!qword_269E71140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71140);
  }
  return result;
}

unint64_t sub_254EF211C()
{
  unint64_t result = qword_269E71148;
  if (!qword_269E71148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71148);
  }
  return result;
}

unint64_t sub_254EF2170()
{
  unint64_t result = qword_269E71160;
  if (!qword_269E71160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71160);
  }
  return result;
}

unint64_t sub_254EF21C4()
{
  unint64_t result = qword_269E71168;
  if (!qword_269E71168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71168);
  }
  return result;
}

unint64_t sub_254EF2218()
{
  unint64_t result = qword_269E71170;
  if (!qword_269E71170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71170);
  }
  return result;
}

unint64_t sub_254EF226C()
{
  unint64_t result = qword_269E71178;
  if (!qword_269E71178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71178);
  }
  return result;
}

uint64_t sub_254EF22C0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E70F90);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_254EF2324()
{
  unint64_t result = qword_269E71B68;
  if (!qword_269E71B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B68);
  }
  return result;
}

unint64_t sub_254EF2378()
{
  unint64_t result = qword_269E71B70;
  if (!qword_269E71B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B70);
  }
  return result;
}

unint64_t sub_254EF23CC()
{
  unint64_t result = qword_269E711A0;
  if (!qword_269E711A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E711A0);
  }
  return result;
}

unint64_t sub_254EF2420()
{
  unint64_t result = qword_269E71B78;
  if (!qword_269E71B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B78);
  }
  return result;
}

unint64_t sub_254EF2474()
{
  unint64_t result = qword_269E711A8;
  if (!qword_269E711A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E711A8);
  }
  return result;
}

unint64_t sub_254EF24C8()
{
  unint64_t result = qword_269E711C8;
  if (!qword_269E711C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E711C8);
  }
  return result;
}

unint64_t sub_254EF251C()
{
  unint64_t result = qword_269E711D0;
  if (!qword_269E711D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E711D0);
  }
  return result;
}

unint64_t sub_254EF2570()
{
  unint64_t result = qword_269E71B80;
  if (!qword_269E71B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B80);
  }
  return result;
}

unint64_t sub_254EF25C4()
{
  unint64_t result = qword_269E71B88;
  if (!qword_269E71B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71B88);
  }
  return result;
}

unint64_t sub_254EF2618()
{
  unint64_t result = qword_269E711F0;
  if (!qword_269E711F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E711F0);
  }
  return result;
}

unint64_t sub_254EF266C()
{
  unint64_t result = qword_269E71B90[0];
  if (!qword_269E71B90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E71B90);
  }
  return result;
}

unint64_t sub_254EF26C0()
{
  unint64_t result = qword_269E711F8;
  if (!qword_269E711F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E711F8);
  }
  return result;
}

unint64_t sub_254EF2714()
{
  unint64_t result = qword_269E71218;
  if (!qword_269E71218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71218);
  }
  return result;
}

unint64_t sub_254EF2768()
{
  unint64_t result = qword_269E71220;
  if (!qword_269E71220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71220);
  }
  return result;
}

unint64_t sub_254EF27BC(void *a1)
{
  a1[1] = sub_254EF27F4();
  a1[2] = sub_254EF2848();
  unint64_t result = sub_254EF289C();
  a1[3] = result;
  return result;
}

unint64_t sub_254EF27F4()
{
  unint64_t result = qword_269E71228;
  if (!qword_269E71228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71228);
  }
  return result;
}

unint64_t sub_254EF2848()
{
  unint64_t result = qword_269E71230;
  if (!qword_269E71230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71230);
  }
  return result;
}

unint64_t sub_254EF289C()
{
  unint64_t result = qword_269E71238;
  if (!qword_269E71238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71238);
  }
  return result;
}

unint64_t sub_254EF28F4()
{
  unint64_t result = qword_269E71240;
  if (!qword_269E71240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71240);
  }
  return result;
}

unint64_t sub_254EF294C()
{
  unint64_t result = qword_269E71248;
  if (!qword_269E71248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71248);
  }
  return result;
}

unint64_t sub_254EF29A4()
{
  unint64_t result = qword_269E71250;
  if (!qword_269E71250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71250);
  }
  return result;
}

unint64_t sub_254EF29FC()
{
  unint64_t result = qword_269E71258;
  if (!qword_269E71258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71258);
  }
  return result;
}

unint64_t sub_254EF2A54()
{
  unint64_t result = qword_269E71260;
  if (!qword_269E71260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71260);
  }
  return result;
}

unint64_t sub_254EF2AAC()
{
  unint64_t result = qword_269E71268;
  if (!qword_269E71268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71268);
  }
  return result;
}

unint64_t sub_254EF2B04()
{
  unint64_t result = qword_269E71270;
  if (!qword_269E71270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71270);
  }
  return result;
}

uint64_t dispatch thunk of StyleSheetProtocol.rules.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

ValueMetadata *type metadata accessor for StyleSheet()
{
  return &type metadata for StyleSheet;
}

uint64_t destroy for StyleSheet.Rule(uint64_t a1)
{
  return sub_254EE8600(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t initializeWithCopy for StyleSheet.Rule(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_254EE85A4(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for StyleSheet.Rule(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_254EE85A4(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  char v14 = *(unsigned char *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  sub_254EE8600(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StyleSheet.Rule(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = v4;
  sub_254EE8600(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Rule(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Rule(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_254EF2D98(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_254EF2DA0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule()
{
  return &type metadata for StyleSheet.Rule;
}

uint64_t sub_254EF2DBC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 5)
  {
    return swift_bridgeObjectRetain();
  }
  if (a5 != 4)
  {
    if (a5) {
      return result;
    }
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return sub_254EF2E38(result, a2);
}

uint64_t sub_254EF2E38(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for StyleSheet.Rule.Declaration(uint64_t a1)
{
  return sub_254EF2E5C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_254EF2E5C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 5)
  {
    return swift_bridgeObjectRelease();
  }
  if (a5 != 4)
  {
    if (a5) {
      return result;
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return sub_254EF2ED8(result, a2);
}

uint64_t sub_254EF2ED8(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for StyleSheet.Rule.Declaration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_254EF2DBC(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for StyleSheet.Rule.Declaration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_254EF2DBC(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_254EF2E5C(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StyleSheet.Rule.Declaration(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_254EF2E5C(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Rule.Declaration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Rule.Declaration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 251;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_254EF30B0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_254EF30B8(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration()
{
  return &type metadata for StyleSheet.Rule.Declaration;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Color(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Color(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Color()
{
  return &type metadata for StyleSheet.Color;
}

ValueMetadata *type metadata accessor for StyleSheet.TextAlign()
{
  return &type metadata for StyleSheet.TextAlign;
}

uint64_t destroy for StyleSheet.Font(uint64_t *a1)
{
  return sub_254EF2ED8(*a1, a1[1]);
}

uint64_t *_s33LinkPresentationStyleSheetParsing10StyleSheetV4FontOwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  sub_254EF2E38(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

uint64_t *assignWithCopy for StyleSheet.Font(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  sub_254EF2E38(*a2, v4);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_254EF2ED8(v6, v7);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for StyleSheet.Font(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_254EF2ED8(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  HIDWORD(v3) = *(_DWORD *)(a1 + 12);
  LODWORD(v3) = HIDWORD(v3);
  unsigned int v2 = v3 >> 31;
  if (v2 > 0x80000000) {
    int v4 = ~v2;
  }
  else {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Font(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      HIDWORD(v3) = -a2;
      LODWORD(v3) = -a2;
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(v3 >> 1) << 32;
      *(void *)(result + 16) = 0;
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_254EF3304(uint64_t a1)
{
  return *(void *)(a1 + 8) >> 63;
}

uint64_t sub_254EF3310(uint64_t result)
{
  *(void *)(result + 8) &= ~0x8000000000000000;
  return result;
}

uint64_t sub_254EF3320(uint64_t result, int a2)
{
  *(_DWORD *)(result + 12) = a2 << 31;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font()
{
  return &type metadata for StyleSheet.Font;
}

uint64_t destroy for StyleSheet.Font.Specified()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO9SpecifiedVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StyleSheet.Font.Specified(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 9) = *((unsigned char *)a2 + 9);
  *(unsigned char *)(a1 + 10) = *((unsigned char *)a2 + 10);
  *(unsigned char *)(a1 + 11) = *((unsigned char *)a2 + 11);
  *(void *)(a1 + 16) = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for StyleSheet.Font.Specified(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Specified(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Font.Specified(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Specified()
{
  return &type metadata for StyleSheet.Font.Specified;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Weight(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StyleSheet.Font.Weight(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *__n128 result = a2 + 12;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254EF364CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Weight()
{
  return &type metadata for StyleSheet.Font.Weight;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Size(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3F && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 63);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 8) >> 1) & 0x3E | (*(unsigned __int8 *)(a1 + 8) >> 7)) ^ 0x3F;
  if (v3 >= 0x3E) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Font.Size(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3E)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 63;
    if (a3 >= 0x3F) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3F) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(unsigned char *)(result + 8) = 4 * (((-a2 >> 1) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_254EF3740(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8) >> 7;
}

uint64_t sub_254EF374C(uint64_t result)
{
  *(unsigned char *)(result + 8) &= ~0x80u;
  return result;
}

uint64_t sub_254EF375C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = *(unsigned char *)(result + 8) & 3 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size()
{
  return &type metadata for StyleSheet.Font.Size;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Size.Unit(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StyleSheet.Font.Size.Unit(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254EF38DCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size.Unit()
{
  return &type metadata for StyleSheet.Font.Size.Unit;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Size.Absolute(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StyleSheet.Font.Size.Absolute(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254EF3A70);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size.Absolute()
{
  return &type metadata for StyleSheet.Font.Size.Absolute;
}

unsigned char *sub_254EF3AA8(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Style()
{
  return &type metadata for StyleSheet.Font.Style;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Variant()
{
  return &type metadata for StyleSheet.Font.Variant;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.System()
{
  return &type metadata for StyleSheet.Font.System;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.CodingKeys()
{
  return &type metadata for StyleSheet.Font.CodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.SpecifiedCodingKeys()
{
  return &type metadata for StyleSheet.Font.SpecifiedCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.SystemCodingKeys()
{
  return &type metadata for StyleSheet.Font.SystemCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size.CodingKeys()
{
  return &type metadata for StyleSheet.Font.Size.CodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size.SpecifiedCodingKeys()
{
  return &type metadata for StyleSheet.Font.Size.SpecifiedCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size.AbsoluteCodingKeys()
{
  return &type metadata for StyleSheet.Font.Size.AbsoluteCodingKeys;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Specified.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StyleSheet.Font.Specified.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *__n128 result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254EF3CB4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Specified.CodingKeys()
{
  return &type metadata for StyleSheet.Font.Specified.CodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Color.CodingKeys()
{
  return &type metadata for StyleSheet.Color.CodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.CodingKeys()
{
  return &type metadata for StyleSheet.Rule.CodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.QualifiedCodingKeys()
{
  return &type metadata for StyleSheet.Rule.QualifiedCodingKeys;
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV9TextAlignOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s33LinkPresentationStyleSheetParsing10StyleSheetV9TextAlignOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254EF3E78);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.AtKeywordCodingKeys()
{
  return &type metadata for StyleSheet.Rule.AtKeywordCodingKeys;
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO6SystemOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO6SystemOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254EF400CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.CodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.CodingKeys;
}

unsigned char *_s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO7VariantOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254EF4110);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.InvalidCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.InvalidCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.ColorCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.ColorCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.BackgroundColorCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.BackgroundColorCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.TextAlignCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.TextAlignCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.FontCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.FontCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.BackgroundImageCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.BackgroundImageCodingKeys;
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO19SpecifiedCodingKeysOwet_0(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO19SpecifiedCodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x254EF4284);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.CodingKeys()
{
  return &type metadata for StyleSheet.CodingKeys;
}

unint64_t sub_254EF42C0()
{
  unint64_t result = qword_269E73920[0];
  if (!qword_269E73920[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E73920);
  }
  return result;
}

unint64_t sub_254EF4318()
{
  unint64_t result = qword_269E73B30[0];
  if (!qword_269E73B30[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E73B30);
  }
  return result;
}

unint64_t sub_254EF4370()
{
  unint64_t result = qword_269E73D40[0];
  if (!qword_269E73D40[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E73D40);
  }
  return result;
}

unint64_t sub_254EF43C8()
{
  unint64_t result = qword_269E73F50[0];
  if (!qword_269E73F50[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E73F50);
  }
  return result;
}

unint64_t sub_254EF4420()
{
  unint64_t result = qword_269E74160[0];
  if (!qword_269E74160[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E74160);
  }
  return result;
}

unint64_t sub_254EF4478()
{
  unint64_t result = qword_269E74370[0];
  if (!qword_269E74370[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E74370);
  }
  return result;
}

unint64_t sub_254EF44D0()
{
  unint64_t result = qword_269E74580[0];
  if (!qword_269E74580[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E74580);
  }
  return result;
}

unint64_t sub_254EF4528()
{
  unint64_t result = qword_269E74790[0];
  if (!qword_269E74790[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E74790);
  }
  return result;
}

unint64_t sub_254EF4580()
{
  unint64_t result = qword_269E749A0[0];
  if (!qword_269E749A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E749A0);
  }
  return result;
}

unint64_t sub_254EF45D8()
{
  unint64_t result = qword_269E74BB0[0];
  if (!qword_269E74BB0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E74BB0);
  }
  return result;
}

unint64_t sub_254EF4630()
{
  unint64_t result = qword_269E74DC0[0];
  if (!qword_269E74DC0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E74DC0);
  }
  return result;
}

unint64_t sub_254EF4688()
{
  unint64_t result = qword_269E74FD0[0];
  if (!qword_269E74FD0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E74FD0);
  }
  return result;
}

unint64_t sub_254EF46E0()
{
  unint64_t result = qword_269E751E0[0];
  if (!qword_269E751E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E751E0);
  }
  return result;
}

unint64_t sub_254EF4738()
{
  unint64_t result = qword_269E753F0[0];
  if (!qword_269E753F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E753F0);
  }
  return result;
}

unint64_t sub_254EF4790()
{
  unint64_t result = qword_269E75600[0];
  if (!qword_269E75600[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E75600);
  }
  return result;
}

unint64_t sub_254EF47E8()
{
  unint64_t result = qword_269E75810[0];
  if (!qword_269E75810[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E75810);
  }
  return result;
}

unint64_t sub_254EF4840()
{
  unint64_t result = qword_269E75A20[0];
  if (!qword_269E75A20[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E75A20);
  }
  return result;
}

unint64_t sub_254EF4898()
{
  unint64_t result = qword_269E75C30[0];
  if (!qword_269E75C30[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E75C30);
  }
  return result;
}

unint64_t sub_254EF48F0()
{
  unint64_t result = qword_269E75E40[0];
  if (!qword_269E75E40[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E75E40);
  }
  return result;
}

unint64_t sub_254EF4948()
{
  unint64_t result = qword_269E75F50;
  if (!qword_269E75F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E75F50);
  }
  return result;
}

unint64_t sub_254EF49A0()
{
  unint64_t result = qword_269E75F58[0];
  if (!qword_269E75F58[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E75F58);
  }
  return result;
}

unint64_t sub_254EF49F8()
{
  unint64_t result = qword_269E75FE0;
  if (!qword_269E75FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E75FE0);
  }
  return result;
}

unint64_t sub_254EF4A50()
{
  unint64_t result = qword_269E75FE8[0];
  if (!qword_269E75FE8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E75FE8);
  }
  return result;
}

unint64_t sub_254EF4AA8()
{
  unint64_t result = qword_269E76070;
  if (!qword_269E76070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76070);
  }
  return result;
}

unint64_t sub_254EF4B00()
{
  unint64_t result = qword_269E76078;
  if (!qword_269E76078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76078);
  }
  return result;
}

unint64_t sub_254EF4B58()
{
  unint64_t result = qword_269E76100;
  if (!qword_269E76100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76100);
  }
  return result;
}

unint64_t sub_254EF4BB0()
{
  unint64_t result = qword_269E76108[0];
  if (!qword_269E76108[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E76108);
  }
  return result;
}

unint64_t sub_254EF4C08()
{
  unint64_t result = qword_269E76190;
  if (!qword_269E76190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76190);
  }
  return result;
}

unint64_t sub_254EF4C60()
{
  unint64_t result = qword_269E76198[0];
  if (!qword_269E76198[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E76198);
  }
  return result;
}

unint64_t sub_254EF4CB8()
{
  unint64_t result = qword_269E76220;
  if (!qword_269E76220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76220);
  }
  return result;
}

unint64_t sub_254EF4D10()
{
  unint64_t result = qword_269E76228[0];
  if (!qword_269E76228[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E76228);
  }
  return result;
}

unint64_t sub_254EF4D68()
{
  unint64_t result = qword_269E762B0;
  if (!qword_269E762B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E762B0);
  }
  return result;
}

unint64_t sub_254EF4DC0()
{
  unint64_t result = qword_269E762B8[0];
  if (!qword_269E762B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E762B8);
  }
  return result;
}

unint64_t sub_254EF4E18()
{
  unint64_t result = qword_269E76340;
  if (!qword_269E76340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76340);
  }
  return result;
}

unint64_t sub_254EF4E70()
{
  unint64_t result = qword_269E76348[0];
  if (!qword_269E76348[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E76348);
  }
  return result;
}

unint64_t sub_254EF4EC8()
{
  unint64_t result = qword_269E763D0;
  if (!qword_269E763D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E763D0);
  }
  return result;
}

unint64_t sub_254EF4F20()
{
  unint64_t result = qword_269E763D8[0];
  if (!qword_269E763D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E763D8);
  }
  return result;
}

unint64_t sub_254EF4F78()
{
  unint64_t result = qword_269E76460;
  if (!qword_269E76460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76460);
  }
  return result;
}

unint64_t sub_254EF4FD0()
{
  unint64_t result = qword_269E76468[0];
  if (!qword_269E76468[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E76468);
  }
  return result;
}

unint64_t sub_254EF5028()
{
  unint64_t result = qword_269E764F0;
  if (!qword_269E764F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E764F0);
  }
  return result;
}

unint64_t sub_254EF5080()
{
  unint64_t result = qword_269E764F8[0];
  if (!qword_269E764F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E764F8);
  }
  return result;
}

unint64_t sub_254EF50D8()
{
  unint64_t result = qword_269E76580;
  if (!qword_269E76580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76580);
  }
  return result;
}

unint64_t sub_254EF5130()
{
  unint64_t result = qword_269E76588[0];
  if (!qword_269E76588[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E76588);
  }
  return result;
}

unint64_t sub_254EF5188()
{
  unint64_t result = qword_269E76610;
  if (!qword_269E76610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76610);
  }
  return result;
}

unint64_t sub_254EF51E0()
{
  unint64_t result = qword_269E76618[0];
  if (!qword_269E76618[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E76618);
  }
  return result;
}

unint64_t sub_254EF5238()
{
  unint64_t result = qword_269E766A0;
  if (!qword_269E766A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E766A0);
  }
  return result;
}

unint64_t sub_254EF5290()
{
  unint64_t result = qword_269E766A8[0];
  if (!qword_269E766A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E766A8);
  }
  return result;
}

unint64_t sub_254EF52E8()
{
  unint64_t result = qword_269E76730;
  if (!qword_269E76730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76730);
  }
  return result;
}

unint64_t sub_254EF5340()
{
  unint64_t result = qword_269E76738[0];
  if (!qword_269E76738[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E76738);
  }
  return result;
}

unint64_t sub_254EF5398()
{
  unint64_t result = qword_269E767C0;
  if (!qword_269E767C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E767C0);
  }
  return result;
}

unint64_t sub_254EF53F0()
{
  unint64_t result = qword_269E767C8[0];
  if (!qword_269E767C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E767C8);
  }
  return result;
}

unint64_t sub_254EF5448()
{
  unint64_t result = qword_269E76850;
  if (!qword_269E76850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76850);
  }
  return result;
}

unint64_t sub_254EF54A0()
{
  unint64_t result = qword_269E76858[0];
  if (!qword_269E76858[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E76858);
  }
  return result;
}

unint64_t sub_254EF54F8()
{
  unint64_t result = qword_269E768E0;
  if (!qword_269E768E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E768E0);
  }
  return result;
}

unint64_t sub_254EF5550()
{
  unint64_t result = qword_269E768E8[0];
  if (!qword_269E768E8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E768E8);
  }
  return result;
}

unint64_t sub_254EF55A8()
{
  unint64_t result = qword_269E76970;
  if (!qword_269E76970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76970);
  }
  return result;
}

unint64_t sub_254EF5600()
{
  unint64_t result = qword_269E76978[0];
  if (!qword_269E76978[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E76978);
  }
  return result;
}

uint64_t sub_254EF5654(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64696C61766E69 && a2 == 0xE700000000000000;
  if (v2 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F6C6F63 && a2 == 0xE500000000000000 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x756F72676B636162 && a2 == 0xEF726F6C6F43646ELL || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x67696C4174786574 && a2 == 0xE90000000000006ELL || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1953394534 && a2 == 0xE400000000000000 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x756F72676B636162 && a2 == 0xEF6567616D49646ELL)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_254EF590C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x79747265706F7270 && a2 == 0xE800000000000000;
  if (v2 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_254EF59F8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6564756C657270 && a2 == 0xE700000000000000 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746172616C636564 && a2 == 0xEC000000736E6F69)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_254EF5B74(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656966696C617571 && a2 == 0xE900000000000064;
  if (v2 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F7779654B7461 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_254EF5C80(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x726F7463656C6573 && a2 == 0xE800000000000000;
  if (v2 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746172616C636564 && a2 == 0xEC000000736E6F69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_254EF5D8C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 6579570 && a2 == 0xE300000000000000;
  if (v2 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65657267 && a2 == 0xE500000000000000 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1702194274 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_254EF5EBC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702521203 && a2 == 0xE400000000000000;
  if (v2 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746867696577 && a2 == 0xE600000000000000 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C797473 && a2 == 0xE500000000000000 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E6169726176 && a2 == 0xE700000000000000 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x796C696D6166 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_254EF60B4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6569666963657073 && a2 == 0xE900000000000064;
  if (v2 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574756C6F736261 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_254EF61B4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
  if (v2 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_254EF6290(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6569666963657073 && a2 == 0xE900000000000064;
  if (v2 || (sub_254EFD140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D6574737973 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_254EFD140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_254EF6398@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  unint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  *a1 = *v1;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  return sub_254ED8078(v2, v3, v4);
}

uint64_t sub_254EF63B4()
{
  return swift_bridgeObjectRetain();
}

__n128 sub_254EF63BC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(_OWORD *)(a3 + 16) = v3;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a3 + 32) = result;
  *(void *)(a3 + 48) = a2;
  return result;
}

uint64_t sub_254EF63D4()
{
  return *(unsigned __int8 *)(v0 + 56);
}

__n128 sub_254EF63DC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a4 + 32) = result;
  *(void *)(a4 + 48) = a2;
  *(unsigned char *)(a4 + 56) = a3;
  return result;
}

ValueMetadata *_s4NodeOMa()
{
  return &_s4NodeON;
}

uint64_t *_s4NodeO5BlockVwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  unint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  sub_254ED8078(*a2, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *_s4NodeO5BlockVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  unint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  sub_254ED8078(*a2, v5, v6);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  unint64_t v12 = a1[2];
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  sub_254ED76FC(v10, v11, v12);
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s4NodeO5BlockVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_254ED76FC(v4, v5, v6);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s4NodeO5BlockVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 2 * -a2;
      *(void *)(result + 24) = 0;
      *(void *)(result + 32) = 0;
      *(void *)(result + 40) = 0;
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s4NodeO5BlockVMa()
{
  return &_s4NodeO5BlockVN;
}

uint64_t _s4NodeO14ComponentValueOwxx(uint64_t a1)
{
  return sub_254EE0B60(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t *_s4NodeO14ComponentValueOwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  sub_254EE0AE4(*a2, v4, v5);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  return a1;
}

uint64_t *_s4NodeO14ComponentValueOwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  sub_254EE0AE4(*a2, v4, v5);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  unint64_t v12 = a1[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  sub_254EE0B60(v10, v11, v12);
  return a1;
}

uint64_t _s4NodeO14ComponentValueOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 48);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = v3;
  sub_254EE0B60(v4, v6, v5);
  return a1;
}

uint64_t _s4NodeO14ComponentValueOwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 16) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double _s4NodeO14ComponentValueOwst(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 56) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 2 * -a2;
      double result = 0.0;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      return result;
    }
    *(unsigned char *)(a1 + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_254EF6834(uint64_t a1)
{
  return (*(void *)(a1 + 16) >> 58) & 3;
}

uint64_t sub_254EF6840(uint64_t result)
{
  *(void *)(result + 16) &= 0xF3FFFFFFFFFFFFFFLL;
  return result;
}

uint64_t sub_254EF6850(uint64_t result, char a2)
{
  *(void *)(result + 16) = *(void *)(result + 16) & 0xF000000000000001 | ((unint64_t)(a2 & 3) << 58);
  return result;
}

ValueMetadata *_s4NodeO14ComponentValueOMa()
{
  return &_s4NodeO14ComponentValueON;
}

uint64_t sub_254EF6878(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a15)
  {
    sub_254ED8078(a1, a2, a3);
    swift_bridgeObjectRetain();
    return sub_254EF699C(a8, a9, a10);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_254ED8078(a2, a3, a4);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_254EF699C(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 >> 1 != 0xFFFFFFFF)
  {
    sub_254ED8078(result, a2, a3);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t _s4NodeO4RuleOwxx(uint64_t a1)
{
  return sub_254EF6A30(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(unsigned char *)(a1 + 112));
}

uint64_t sub_254EF6A30(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a15)
  {
    sub_254ED76FC(a1, a2, a3);
    swift_bridgeObjectRelease();
    return sub_254EF6B54(a8, a9, a10);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_254ED76FC(a2, a3, a4);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_254EF6B54(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 >> 1 != 0xFFFFFFFF)
  {
    sub_254ED76FC(result, a2, a3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s4NodeO4RuleOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  unint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 88);
  uint64_t v16 = *(void *)(a2 + 96);
  uint64_t v17 = *(void *)(a2 + 104);
  char v18 = *(unsigned char *)(a2 + 112);
  sub_254EF6878(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(unsigned char *)(a1 + 112) = v18;
  return a1;
}

uint64_t _s4NodeO4RuleOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  unint64_t v26 = *(void *)(a2 + 72);
  uint64_t v27 = *(void *)(a2 + 80);
  uint64_t v28 = *(void *)(a2 + 88);
  uint64_t v29 = *(void *)(a2 + 96);
  uint64_t v30 = *(void *)(a2 + 104);
  char v31 = *(unsigned char *)(a2 + 112);
  sub_254EF6878(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v26, v27, v28, v29, v30, v31);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  unint64_t v14 = *(void *)(a1 + 16);
  unint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  uint64_t v22 = *(void *)(a1 + 96);
  uint64_t v23 = *(void *)(a1 + 104);
  char v24 = *(unsigned char *)(a1 + 112);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v26;
  *(void *)(a1 + 80) = v27;
  *(void *)(a1 + 88) = v28;
  *(void *)(a1 + 96) = v29;
  *(void *)(a1 + 104) = v30;
  *(unsigned char *)(a1 + 112) = v31;
  sub_254EF6A30(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((unint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, v23, v24);
  return a1;
}

__n128 __swift_memcpy113_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t _s4NodeO4RuleOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 112);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  unint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 80);
  uint64_t v14 = *(void *)(a1 + 96);
  uint64_t v15 = *(void *)(a1 + 104);
  char v16 = *(unsigned char *)(a1 + 112);
  long long v17 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v17;
  long long v18 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v18;
  long long v19 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v19;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(unsigned char *)(a1 + 112) = v3;
  sub_254EF6A30(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((unint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, v15, v16);
  return a1;
}

uint64_t _s4NodeO4RuleOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 113)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 112);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s4NodeO4RuleOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 112) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 113) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 113) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 112) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_254EF6F08(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 112);
}

uint64_t sub_254EF6F10(uint64_t result, char a2)
{
  *(unsigned char *)(result + 112) = a2 & 1;
  return result;
}

ValueMetadata *_s4NodeO4RuleOMa()
{
  return &_s4NodeO4RuleON;
}

uint64_t _s4NodeO5BlockVwxx_0(uint64_t a1)
{
  sub_254ED76FC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16));

  return swift_bridgeObjectRelease();
}

uint64_t _s4NodeO11DeclarationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  sub_254ED8078(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s4NodeO11DeclarationVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  sub_254ED8078(*(void *)a2, v5, v6);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  unint64_t v12 = *(void *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  sub_254ED76FC(v10, v11, v12);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s4NodeO11DeclarationVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_254ED76FC(v4, v5, v6);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t _s4NodeO11DeclarationVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 16) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t _s4NodeO11DeclarationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 2 * -a2;
      *(void *)(result + 24) = 0;
      *(void *)(result + 32) = 0;
      *(void *)(result + 40) = 0;
      return result;
    }
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s4NodeO11DeclarationVMa()
{
  return &_s4NodeO11DeclarationVN;
}

uint64_t sub_254EF71EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      swift_bridgeObjectRetain();
      uint64_t result = swift_bridgeObjectRetain();
      break;
    case 2:
    case 3:
      uint64_t result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for StyleSheetError(uint64_t a1)
{
  return sub_254EF72A8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_254EF72A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 2:
    case 3:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for StyleSheetError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_254EF71EC(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for StyleSheetError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_254EF71EC(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_254EF72A8(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for StyleSheetError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_254EF72A8(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for StyleSheetError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheetError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)uint64_t result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_254EF7504(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 3u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_254EF751C(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)uint64_t result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheetError()
{
  return &type metadata for StyleSheetError;
}

void *sub_254EF7548(uint64_t a1, char a2)
{
  sub_254ED74E0((uint64_t *)&v57);
  unint64_t v3 = v58;
  if ((unint64_t)v58 >> 1 != 0xFFFFFFFF)
  {
    uint64_t v6 = 0;
    int v4 = (void *)MEMORY[0x263F8EE78];
    uint64_t v7 = *((void *)&v59 + 1);
    uint64_t v8 = v59;
    uint64_t v9 = *((void *)&v58 + 1);
    uint64_t v10 = *((void *)&v57 + 1);
    while (1)
    {
      uint64_t v11 = v57;
      if (v3 >> 60 == 2) {
        break;
      }
      if (v3 >> 60 == 10)
      {
        uint64_t v12 = v9 | v10 | v8;
        if (!v7 && v3 == 0xA000000000000000 && (void)v57 == 9 && !v12) {
          goto LABEL_7;
        }
        if (!v7 && v3 == 0xA000000000000000 && (void)v57 == 10 && !v12
          || !v7 && v3 == 0xA000000000000000 && (void)v57 == 11 && !v12)
        {
          if ((a2 & 1) == 0)
          {
            long long v13 = v4;
            sub_254ED7778();
            sub_254EF8170(a1, (uint64_t)&v57);
            unsigned __int8 v14 = v64;
            if (v64 == 255)
            {
              int v4 = v13;
            }
            else
            {
              long long v54 = v58;
              long long v56 = v57;
              long long v50 = v60;
              long long v52 = v59;
              long long v46 = v62;
              long long v48 = v61;
              long long v44 = v63;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                long long v13 = sub_254EFA750(0, v13[2] + 1, 1, v13);
              }
              unint64_t v29 = v13[2];
              unint64_t v28 = v13[3];
              if (v29 >= v28 >> 1) {
                long long v13 = sub_254EFA750((void *)(v28 > 1), v29 + 1, 1, v13);
              }
              void v13[2] = v29 + 1;
              uint64_t v30 = &v13[15 * v29];
              *((_OWORD *)v30 + 2) = v56;
              *((_OWORD *)v30 + 3) = v54;
              *((_OWORD *)v30 + 4) = v52;
              *((_OWORD *)v30 + 5) = v50;
              *((_OWORD *)v30 + 6) = v48;
              *((_OWORD *)v30 + 7) = v46;
              *((_OWORD *)v30 + 8) = v44;
              char v31 = v14 & 1;
              int v4 = v13;
              *((unsigned char *)v30 + 144) = v31;
            }
          }
          goto LABEL_7;
        }
      }
      uint64_t v55 = v6;
      uint64_t v15 = v57;
      sub_254ED7778();
      sub_254EF8170(a1, (uint64_t)&v57);
      unsigned __int8 v16 = v64;
      if (v64 != 255)
      {
        long long v51 = v58;
        long long v53 = v57;
        long long v47 = v60;
        long long v49 = v59;
        long long v42 = v62;
        long long v45 = v61;
        long long v40 = v63;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          int v4 = sub_254EFA750(0, v4[2] + 1, 1, v4);
        }
        unint64_t v18 = v4[2];
        unint64_t v17 = v4[3];
        long long v19 = v4;
        if (v18 >= v17 >> 1) {
          long long v19 = sub_254EFA750((void *)(v17 > 1), v18 + 1, 1, v4);
        }
        void v19[2] = v18 + 1;
        int v4 = v19;
        long long v20 = &v19[15 * v18];
        *((_OWORD *)v20 + 2) = v53;
        *((_OWORD *)v20 + 3) = v51;
        *((_OWORD *)v20 + 4) = v49;
        *((_OWORD *)v20 + 5) = v47;
        *((_OWORD *)v20 + 6) = v45;
        *((_OWORD *)v20 + 7) = v42;
        *((_OWORD *)v20 + 8) = v40;
        unsigned __int8 v21 = v16 & 1;
LABEL_36:
        *((unsigned char *)v20 + 144) = v21;
        sub_254EDC06C(v15, v10, v3);
        goto LABEL_6;
      }
      sub_254EDC06C(v15, v10, v3);
LABEL_6:
      uint64_t v6 = v55;
LABEL_7:
      sub_254ED74E0((uint64_t *)&v57);
      uint64_t v10 = *((void *)&v57 + 1);
      uint64_t v9 = *((void *)&v58 + 1);
      unint64_t v3 = v58;
      uint64_t v7 = *((void *)&v59 + 1);
      uint64_t v8 = v59;
      if ((unint64_t)v58 >> 1 == 0xFFFFFFFF) {
        return v4;
      }
    }
    sub_254ED7778();
    sub_254EF7A10(a1, (uint64_t)&v57);
    uint64_t v55 = 0;
    uint64_t v15 = v11;
    long long v22 = v57;
    long long v23 = v58;
    long long v24 = v59;
    uint64_t v43 = v60;
    uint64_t v39 = v61;
    uint64_t v41 = *((void *)&v60 + 1);
    uint64_t v37 = v62;
    uint64_t v38 = *((void *)&v61 + 1);
    uint64_t v35 = v63;
    uint64_t v36 = *((void *)&v62 + 1);
    uint64_t v34 = *((void *)&v63 + 1);
    unsigned __int8 v33 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v4 = sub_254EFA750(0, v4[2] + 1, 1, v4);
    }
    unint64_t v26 = v4[2];
    unint64_t v25 = v4[3];
    uint64_t v27 = v4;
    if (v26 >= v25 >> 1) {
      uint64_t v27 = sub_254EFA750((void *)(v25 > 1), v26 + 1, 1, v4);
    }
    v27[2] = v26 + 1;
    int v4 = v27;
    long long v20 = &v27[15 * v26];
    *((_OWORD *)v20 + 2) = v22;
    *((_OWORD *)v20 + 3) = v23;
    *((_OWORD *)v20 + 4) = v24;
    v20[10] = v43;
    v20[11] = v41;
    v20[12] = v39;
    v20[13] = v38;
    unsigned char v20[14] = v37;
    v20[15] = v36;
    v20[16] = v35;
    v20[17] = v34;
    unsigned __int8 v21 = v33;
    goto LABEL_36;
  }
  return (void *)MEMORY[0x263F8EE78];
}

uint64_t sub_254EF7A10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_254ED74E0((uint64_t *)&v65);
  if (*(void *)v66 >> 1 == 0xFFFFFFFFLL)
  {
    sub_254EDF770();
    swift_allocError();
    *(_OWORD *)uint64_t v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(unsigned char *)(v4 + 32) = 4;
    return swift_willThrow();
  }
  else
  {
    unsigned long long v6 = v65;
    uint64_t v7 = *(void *)&v66[8];
    uint64_t v51 = *(void *)&v66[16];
    unint64_t v52 = *(void *)v66;
    uint64_t v53 = *(void *)&v66[24];
    uint64_t result = sub_254ED74E0((uint64_t *)&v65);
    unint64_t v8 = *(void *)v66;
    uint64_t v50 = v7;
    uint64_t v49 = a2;
    if (*(void *)v66 >> 1 == 0xFFFFFFFFLL)
    {
      uint64_t v9 = (void *)MEMORY[0x263F8EE78];
LABEL_38:
      *(_OWORD *)uint64_t v49 = v6;
      *(void *)(v49 + 16) = v52;
      *(void *)(v49 + 24) = v50;
      *(void *)(v49 + 32) = v51;
      *(void *)(v49 + 40) = v53;
      *(void *)(v49 + 48) = v9;
      *(void *)(v49 + 56) = 0;
      *(void *)(v49 + 64) = 0;
      *(void *)(v49 + 72) = 0x1FFFFFFFELL;
      *(_OWORD *)(v49 + 80) = 0u;
      *(_OWORD *)(v49 + 96) = 0u;
      *(unsigned char *)(v49 + 112) = 1;
    }
    else
    {
      uint64_t v10 = *(void *)&v66[16];
      uint64_t v11 = *(void *)&v66[24];
      uint64_t v12 = *(void *)&v66[8];
      uint64_t v13 = *((void *)&v65 + 1);
      sub_254EFA874();
      uint64_t v9 = (void *)MEMORY[0x263F8EE78];
      uint64_t v14 = a1;
      uint64_t v56 = a1;
      while (1)
      {
        uint64_t v15 = v65;
        *((void *)&v65 + 1) = v13;
        *(void *)uint64_t v66 = v8;
        *(void *)&v66[8] = v12;
        *(void *)&v66[16] = v10;
        *(void *)&v66[24] = v11;
        long long v68 = xmmword_254EFD7C0;
        unint64_t v69 = 0xA000000000000000;
        uint64_t v71 = 0;
        long long v70 = 0uLL;
        if (sub_254EFCBB0())
        {
          uint64_t result = sub_254EDC06C(v15, v13, v8);
          goto LABEL_38;
        }
        if (v8 >> 60 == 10 && v15 == 19 && !v13 && v8 == 0xA000000000000000 && !(v10 | v12 | v11)) {
          break;
        }
        uint64_t v72 = v15;
        sub_254ED7778();
        sub_254ED74E0((uint64_t *)&v65);
        unint64_t v16 = *(void *)v66;
        if (*(void *)v66 >> 1 == 0xFFFFFFFFLL)
        {
          sub_254EDF770();
          swift_allocError();
          *(_OWORD *)uint64_t v34 = 0u;
          *(_OWORD *)(v34 + 16) = 0u;
          *(unsigned char *)(v34 + 32) = 4;
          swift_willThrow();
          sub_254EDC06C(v6, *((uint64_t *)&v6 + 1), v52);
          uint64_t v35 = v72;
          uint64_t v36 = v13;
          unint64_t v37 = v8;
LABEL_43:
          sub_254EDC06C(v35, v36, v37);
          return swift_bridgeObjectRelease();
        }
        unsigned long long v17 = v65;
        uint64_t v18 = *(void *)&v66[24];
        uint64_t v57 = v13;
        long long v60 = v65;
        if (*(void *)v66 >> 60 == 1)
        {
          long long v68 = v65;
          unint64_t v69 = *(void *)v66;
          long long v70 = *(_OWORD *)&v66[8];
          uint64_t v71 = *(void *)&v66[24];
          unsigned long long v61 = xmmword_254EFD740;
          unint64_t v62 = 0xA000000000000000;
          uint64_t v64 = 0;
          long long v63 = 0uLL;
          sub_254EFA124(v14, (uint64_t *)&v68, (uint64_t *)&v61, (uint64_t)&v65);
          sub_254EDC06C(v60, *((uint64_t *)&v60 + 1), v16);
          long long v58 = *(_OWORD *)&v66[8];
          long long v60 = v65;
          uint64_t v18 = *(void *)&v66[24];
          uint64_t v20 = v67;
          unint64_t v16 = *(void *)v66 | 0x800000000000000;
        }
        else if (*(void *)v66 >> 60 == 10)
        {
          uint64_t v19 = *(void *)&v66[8] | *((void *)&v65 + 1) | *(void *)&v66[16];
          if (!*(void *)&v66[24] && *(void *)v66 == 0xA000000000000000 && (void)v65 == 15 && !v19
            || !*(void *)&v66[24] && *(void *)v66 == 0xA000000000000000 && (void)v65 == 17 && !v19
            || (uint64_t v20 = 0, v58 = *(_OWORD *)&v66[8], !*(void *)&v66[24])
            && *(void *)v66 == 0xA000000000000000
            && (void)v65 == 19
            && (unsigned long long v17 = v65, !v19))
          {
            long long v55 = v65;
            unsigned long long v61 = v17;
            unint64_t v62 = 0xA000000000000000;
            long long v63 = *(_OWORD *)&v66[8];
            uint64_t v64 = 0;
            uint64_t v59 = *(void *)&v66[8];
            uint64_t v21 = *(void *)&v66[16];
            sub_254EE4A08((uint64_t *)&v68);
            unint64_t v22 = v69;
            if (v69 >> 1 == 0xFFFFFFFF)
            {
              sub_254EDF770();
              swift_allocError();
              *(void *)uint64_t v40 = sub_254EFA5B8;
              *(void *)(v40 + 8) = 0;
              *(void *)(v40 + 16) = 0;
              *(void *)(v40 + 24) = 0;
              *(unsigned char *)(v40 + 32) = 3;
              swift_willThrow();
              sub_254EDC06C(v55, *((uint64_t *)&v55 + 1), 0xA000000000000000);
              sub_254EDC06C(v6, *((uint64_t *)&v6 + 1), v52);
              uint64_t v35 = v72;
              uint64_t v36 = v13;
              unint64_t v37 = v8;
              goto LABEL_43;
            }
            long long v54 = v9;
            uint64_t v24 = *((void *)&v70 + 1);
            uint64_t v23 = v71;
            uint64_t v25 = v70;
            uint64_t v26 = *((void *)&v68 + 1);
            uint64_t v27 = v68;
            long long v68 = v60;
            unint64_t v69 = 0xA000000000000000;
            *(void *)&long long v70 = v59;
            *((void *)&v70 + 1) = v21;
            uint64_t v71 = 0;
            unsigned long long v61 = __PAIR128__(v26, v27);
            unint64_t v62 = v22;
            *(void *)&long long v63 = v25;
            *((void *)&v63 + 1) = v24;
            uint64_t v64 = v23;
            sub_254EFA124(v56, (uint64_t *)&v68, (uint64_t *)&v61, (uint64_t)&v65);
            uint64_t v9 = v54;
            sub_254EDC06C(v27, v26, v22);
            sub_254EDC06C(v55, *((uint64_t *)&v55 + 1), 0xA000000000000000);
            long long v58 = *(_OWORD *)&v66[8];
            long long v60 = v65;
            uint64_t v18 = *(void *)&v66[24];
            uint64_t v20 = v67;
            unint64_t v16 = *(void *)v66 | 0x400000000000000;
          }
        }
        else
        {
          long long v58 = *(_OWORD *)&v66[8];
          uint64_t v20 = 0;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v9 = sub_254EFA624(0, v9[2] + 1, 1, v9);
        }
        unint64_t v29 = v9[2];
        unint64_t v28 = v9[3];
        long long v31 = v58;
        long long v30 = v60;
        if (v29 >= v28 >> 1)
        {
          unsigned __int8 v33 = sub_254EFA624((void *)(v28 > 1), v29 + 1, 1, v9);
          long long v31 = v58;
          long long v30 = v60;
          uint64_t v9 = v33;
        }
        void v9[2] = v29 + 1;
        char v32 = &v9[7 * v29];
        *((_OWORD *)v32 + 2) = v30;
        v32[6] = v16;
        *(_OWORD *)(v32 + 7) = v31;
        v32[9] = v18;
        v32[10] = v20;
        sub_254EDC06C(v72, v57, v8);
        uint64_t v14 = v56;
        uint64_t result = sub_254ED74E0((uint64_t *)&v65);
        uint64_t v13 = *((void *)&v65 + 1);
        uint64_t v12 = *(void *)&v66[8];
        unint64_t v8 = *(void *)v66;
        uint64_t v10 = *(void *)&v66[16];
        uint64_t v11 = *(void *)&v66[24];
        if (*(void *)v66 >> 1 == 0xFFFFFFFFLL) {
          goto LABEL_38;
        }
      }
      unsigned long long v61 = xmmword_254EFD810;
      unint64_t v62 = 0xA000000000000000;
      *(void *)&long long v63 = v12;
      *((void *)&v63 + 1) = v10;
      uint64_t v64 = v11;
      sub_254EE4A08((uint64_t *)&v68);
      unint64_t v38 = v69;
      if (v69 >> 1 == 0xFFFFFFFF)
      {
        sub_254EDF770();
        swift_allocError();
        *(void *)uint64_t v39 = sub_254EFA5B8;
        *(void *)(v39 + 8) = 0;
        *(void *)(v39 + 16) = 0;
        *(void *)(v39 + 24) = 0;
        *(unsigned char *)(v39 + 32) = 3;
        swift_willThrow();
        uint64_t v36 = v6 >> 64;
        uint64_t v35 = v6;
        unint64_t v37 = v52;
        goto LABEL_43;
      }
      uint64_t v42 = *((void *)&v70 + 1);
      uint64_t v41 = v71;
      uint64_t v43 = v70;
      long long v44 = v68;
      long long v68 = xmmword_254EFD810;
      unint64_t v69 = 0xA000000000000000;
      *(void *)&long long v70 = v12;
      *((void *)&v70 + 1) = v10;
      uint64_t v71 = v11;
      unsigned long long v61 = v44;
      unint64_t v62 = v38;
      *(void *)&long long v63 = v43;
      *((void *)&v63 + 1) = v42;
      uint64_t v64 = v41;
      sub_254EFA124(v56, (uint64_t *)&v68, (uint64_t *)&v61, (uint64_t)&v65);
      uint64_t result = sub_254EDC06C(v44, *((uint64_t *)&v44 + 1), v38);
      uint64_t v45 = v67;
      long long v46 = v65;
      long long v47 = *(_OWORD *)v66;
      long long v48 = *(_OWORD *)&v66[16];
      *(_OWORD *)uint64_t v49 = v6;
      *(void *)(v49 + 16) = v52;
      *(void *)(v49 + 24) = v50;
      *(void *)(v49 + 32) = v51;
      *(void *)(v49 + 40) = v53;
      *(void *)(v49 + 48) = v9;
      *(_OWORD *)(v49 + 56) = v46;
      *(_OWORD *)(v49 + 72) = v47;
      *(_OWORD *)(v49 + 88) = v48;
      *(void *)(v49 + 104) = v45;
      *(unsigned char *)(v49 + 112) = 1;
    }
  }
  return result;
}

double sub_254EF8170@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v57 = sub_254EFCB40();
  uint64_t v56 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  long long v55 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = a1;
  sub_254ED74E0((uint64_t *)&v80);
  unint64_t v4 = *(void *)v81;
  if (*(void *)v81 >> 1 == 0xFFFFFFFFLL)
  {
LABEL_2:
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_254EFC5C4();
    uint64_t v6 = v56;
    uint64_t v7 = v55;
    uint64_t v8 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v55, v5, v57);
    uint64_t v9 = sub_254EFCB20();
    os_log_type_t v10 = sub_254EFCE10();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_254ED4000, v9, v10, "Reached unexpected EOF while consuming qualified rule", v11, 2u);
      MEMORY[0x25A2818B0](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v7, v8);
  }
  else
  {
    uint64_t v12 = *(void *)&v81[16];
    uint64_t v69 = *(void *)&v81[24];
    uint64_t v13 = *(void *)&v81[8];
    uint64_t v14 = *((void *)&v80 + 1);
    long long v60 = &v74;
    uint64_t v15 = (void *)MEMORY[0x263F8EE78];
    long long v59 = xmmword_254EFD740;
    while (1)
    {
      if (v4 >> 60 == 10)
      {
        BOOL v16 = (void)v80 == 19 && v14 == 0;
        BOOL v17 = v16 && v4 == 0xA000000000000000;
        if (v17 && (v12 | v13 | v69) == 0) {
          break;
        }
      }
      uint64_t v68 = v80;
      sub_254ED7778();
      sub_254ED74E0((uint64_t *)&v80);
      unint64_t v19 = *(void *)v81;
      if (*(void *)v81 >> 1 == 0xFFFFFFFFLL)
      {
        uint64_t v39 = v68;
        uint64_t v40 = v14;
        unint64_t v41 = v4;
LABEL_46:
        sub_254EDC06C(v39, v40, v41);
        goto LABEL_47;
      }
      uint64_t v65 = v14;
      unsigned long long v20 = v80;
      uint64_t v21 = *(void *)&v81[24];
      uint64_t v64 = v12;
      uint64_t v66 = v13;
      long long v71 = v80;
      if (*(void *)v81 >> 60 == 1)
      {
        long long v76 = v80;
        unint64_t v77 = *(void *)v81;
        long long v78 = *(_OWORD *)&v81[8];
        uint64_t v79 = *(void *)&v81[24];
        unsigned long long v72 = v59;
        unint64_t v73 = 0xA000000000000000;
        char v32 = v60;
        *((void *)v60 + 1) = 0;
        *((void *)v32 + 2) = 0;
        *(void *)char v32 = 0;
        sub_254EFA124(v70, (uint64_t *)&v76, (uint64_t *)&v72, (uint64_t)&v80);
        sub_254EDC06C(v71, *((uint64_t *)&v71 + 1), v19);
        long long v71 = v80;
        long long v67 = *(_OWORD *)&v81[8];
        uint64_t v21 = *(void *)&v81[24];
        uint64_t v25 = v82;
        unint64_t v19 = *(void *)v81 | 0x800000000000000;
      }
      else if (*(void *)v81 >> 60 == 10)
      {
        uint64_t v22 = *((void *)&v80 + 1);
        long long v23 = *(_OWORD *)&v81[8];
        uint64_t v24 = *(void *)&v81[8] | *((void *)&v80 + 1) | *(void *)&v81[16];
        if (!*(void *)&v81[24] && *(void *)v81 == 0xA000000000000000 && (void)v80 == 15 && !v24
          || !*(void *)&v81[24] && *(void *)v81 == 0xA000000000000000 && (void)v80 == 17 && !v24
          || (uint64_t v25 = 0, v67 = *(_OWORD *)&v81[8], !*(void *)&v81[24])
          && *(void *)v81 == 0xA000000000000000
          && (void)v80 == 19
          && (unsigned long long v20 = v71, !v24))
        {
          *(void *)&long long v67 = v80;
          unsigned long long v72 = v20;
          unint64_t v73 = 0xA000000000000000;
          long long v74 = *(_OWORD *)&v81[8];
          uint64_t v75 = 0;
          sub_254EE4A08((uint64_t *)&v76);
          unint64_t v26 = v77;
          if (v77 >> 1 == 0xFFFFFFFF)
          {
            sub_254EDC06C(v67, v22, 0xA000000000000000);
            uint64_t v39 = v68;
            uint64_t v40 = v65;
            unint64_t v41 = v4;
            goto LABEL_46;
          }
          long long v63 = v15;
          uint64_t v62 = v22;
          uint64_t v28 = *((void *)&v78 + 1);
          uint64_t v27 = v79;
          uint64_t v61 = v23;
          uint64_t v29 = v78;
          uint64_t v30 = *((void *)&v76 + 1);
          uint64_t v31 = v76;
          long long v76 = v71;
          unint64_t v77 = 0xA000000000000000;
          long long v78 = v23;
          uint64_t v79 = 0;
          unsigned long long v72 = __PAIR128__(v30, v31);
          unint64_t v73 = v26;
          *(void *)&long long v74 = v29;
          *((void *)&v74 + 1) = v28;
          uint64_t v75 = v27;
          sub_254EFA124(v70, (uint64_t *)&v76, (uint64_t *)&v72, (uint64_t)&v80);
          uint64_t v15 = v63;
          sub_254EDC06C(v31, v30, v26);
          sub_254EDC06C(v67, v62, 0xA000000000000000);
          long long v71 = v80;
          long long v67 = *(_OWORD *)&v81[8];
          uint64_t v21 = *(void *)&v81[24];
          uint64_t v25 = v82;
          unint64_t v19 = *(void *)v81 | 0x400000000000000;
        }
      }
      else
      {
        long long v67 = *(_OWORD *)&v81[8];
        uint64_t v25 = 0;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v15 = sub_254EFA624(0, v15[2] + 1, 1, v15);
      }
      unint64_t v34 = v15[2];
      unint64_t v33 = v15[3];
      long long v35 = v71;
      long long v36 = v67;
      if (v34 >= v33 >> 1)
      {
        unint64_t v38 = sub_254EFA624((void *)(v33 > 1), v34 + 1, 1, v15);
        long long v36 = v67;
        long long v35 = v71;
        uint64_t v15 = v38;
      }
      v15[2] = v34 + 1;
      unint64_t v37 = &v15[7 * v34];
      *((_OWORD *)v37 + 2) = v35;
      v37[6] = v19;
      *(_OWORD *)(v37 + 7) = v36;
      v37[9] = v21;
      v37[10] = v25;
      sub_254EDC06C(v68, v65, v4);
      sub_254ED74E0((uint64_t *)&v80);
      uint64_t v14 = *((void *)&v80 + 1);
      uint64_t v13 = *(void *)&v81[8];
      unint64_t v4 = *(void *)v81;
      uint64_t v12 = *(void *)&v81[16];
      uint64_t v69 = *(void *)&v81[24];
      if (*(void *)v81 >> 1 == 0xFFFFFFFFLL) {
        goto LABEL_2;
      }
    }
    long long v71 = xmmword_254EFD810;
    unsigned long long v72 = xmmword_254EFD810;
    unint64_t v73 = 0xA000000000000000;
    *(void *)&long long v74 = v13;
    *((void *)&v74 + 1) = v12;
    uint64_t v75 = v69;
    sub_254EE4A08((uint64_t *)&v76);
    unint64_t v42 = v77;
    if (v77 >> 1 != 0xFFFFFFFF)
    {
      uint64_t v43 = v13;
      uint64_t v45 = *((void *)&v78 + 1);
      uint64_t v44 = v79;
      uint64_t v46 = v78;
      unsigned long long v47 = v76;
      long long v76 = v71;
      unint64_t v77 = 0xA000000000000000;
      *(void *)&long long v78 = v43;
      *((void *)&v78 + 1) = v12;
      uint64_t v79 = v69;
      unsigned long long v72 = v47;
      unint64_t v73 = v42;
      *(void *)&long long v74 = v46;
      *((void *)&v74 + 1) = v45;
      uint64_t v75 = v44;
      sub_254EFA124(v70, (uint64_t *)&v76, (uint64_t *)&v72, (uint64_t)&v80);
      sub_254EDC06C(v47, *((uint64_t *)&v47 + 1), v42);
      uint64_t v48 = v82;
      long long v49 = v80;
      long long v50 = *(_OWORD *)v81;
      long long v51 = *(_OWORD *)&v81[16];
      uint64_t v52 = v58;
      *(void *)uint64_t v58 = v15;
      *(_OWORD *)(v52 + 8) = v49;
      *(_OWORD *)(v52 + 24) = v50;
      *(_OWORD *)(v52 + 40) = v51;
      *(void *)(v52 + 56) = v48;
      double result = 0.0;
      *(_OWORD *)(v52 + 64) = 0u;
      *(_OWORD *)(v52 + 80) = 0u;
      *(_OWORD *)(v52 + 96) = 0u;
      *(unsigned char *)(v52 + 112) = 0;
      return result;
    }
LABEL_47:
    swift_bridgeObjectRelease();
  }
  double result = 0.0;
  uint64_t v54 = v58;
  *(_OWORD *)(v58 + 80) = 0u;
  *(_OWORD *)(v54 + 96) = 0u;
  *(_OWORD *)(v54 + 48) = 0u;
  *(_OWORD *)(v54 + 64) = 0u;
  *(_OWORD *)(v54 + 16) = 0u;
  *(_OWORD *)(v54 + 32) = 0u;
  *(_OWORD *)uint64_t v54 = 0u;
  *(unsigned char *)(v54 + 112) = -1;
  return result;
}

void *sub_254EF88A4(uint64_t a1)
{
  uint64_t v94 = sub_254EFCB40();
  uint64_t v2 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  unint64_t v4 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = a1;
  sub_254ED74E0((uint64_t *)&v103);
  unint64_t v6 = v104;
  if ((unint64_t)v104 >> 1 == 0xFFFFFFFF) {
    return (void *)MEMORY[0x263F8EE78];
  }
  BOOL v93 = v4;
  uint64_t v83 = 0;
  uint64_t v8 = *((void *)&v105 + 1);
  uint64_t v9 = v105;
  uint64_t v10 = *((void *)&v104 + 1);
  uint64_t v91 = (void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  uint64_t v90 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v11 = *((void *)&v103 + 1);
  uint64_t v88 = (char *)&v103 + 8;
  *(void *)&long long v5 = 136315138;
  long long v87 = v5;
  uint64_t v86 = MEMORY[0x263F8EE58] + 8;
  long long v102 = xmmword_254EFD720;
  long long v82 = xmmword_254EFDF00;
  long long v84 = xmmword_254EFD7C0;
  uint64_t v85 = (void *)MEMORY[0x263F8EE78];
  uint64_t v12 = v94;
  while (1)
  {
    uint64_t v13 = v103;
    unint64_t v14 = v6 >> 60;
    if (v6 >> 60 == 10)
    {
      uint64_t v27 = v10 | v11 | v9;
      if (!v8 && v6 == 0xA000000000000000 && (void)v103 == 9 && v27 == 0) {
        goto LABEL_26;
      }
      if (!v8 && v6 == 0xA000000000000000 && (void)v103 == 13 && !v27) {
        goto LABEL_26;
      }
LABEL_8:
      uint64_t v15 = sub_254EFC5C4();
      BOOL v16 = v93;
      (*v91)(v93, v15, v12);
      sub_254ED8078(v13, v11, v6);
      sub_254ED8078(v13, v11, v6);
      uint64_t v17 = v8;
      uint64_t v18 = sub_254EFCB20();
      os_log_type_t v19 = sub_254EFCE10();
      *(void *)&long long v95 = v18;
      LODWORD(v92) = v19;
      BOOL v20 = os_log_type_enabled(v18, v19);
      uint64_t v100 = v17;
      uint64_t v99 = v9;
      uint64_t v97 = v10;
      uint64_t v101 = v11;
      uint64_t v98 = v13;
      if (v20)
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(void *)&v89[8] = swift_slowAlloc();
        *(void *)&long long v115 = *(void *)&v89[8];
        *(_DWORD *)uint64_t v21 = v87;
        *(void *)uint64_t v89 = v21 + 4;
        *(void *)&long long v103 = v13;
        *((void *)&v103 + 1) = v11;
        *(void *)&long long v104 = v6;
        *((void *)&v104 + 1) = v10;
        *(void *)&long long v105 = v9;
        *((void *)&v105 + 1) = v17;
        sub_254ED8078(v13, v11, v6);
        uint64_t v22 = sub_254EFCBC0();
        *(void *)&long long v103 = sub_254EFA9D8(v22, v23, (uint64_t *)&v115);
        sub_254EFCE90();
        swift_bridgeObjectRelease();
        sub_254EDC06C(v13, v11, v6);
        unint64_t v24 = v6;
        sub_254EDC06C(v13, v11, v6);
        uint64_t v25 = (void *)v95;
        _os_log_impl(&dword_254ED4000, (os_log_t)v95, (os_log_type_t)v92, "Could not parse token while consuming list of declarations: current token %s not of valid type.", v21, 0xCu);
        uint64_t v26 = *(void *)&v89[8];
        swift_arrayDestroy();
        MEMORY[0x25A2818B0](v26, -1, -1);
        MEMORY[0x25A2818B0](v21, -1, -1);

        (*v90)(v93, v94);
      }
      else
      {
        sub_254EDC06C(v13, v11, v6);
        unint64_t v24 = v6;
        sub_254EDC06C(v13, v11, v6);

        (*v90)(v16, v12);
      }
      unint64_t v29 = v24;
      do
      {
        sub_254ED74E0((uint64_t *)&v103);
        unint64_t v30 = v104;
        if ((unint64_t)v104 >> 1 == 0xFFFFFFFF) {
          break;
        }
        uint64_t v31 = *((void *)&v103 + 1);
        uint64_t v32 = v103;
        long long v115 = v102;
        *(void *)&long long v116 = 0xA000000000000000;
        sub_254EFA874();
        uint64_t v117 = 0;
        uint64_t v118 = 0;
        *((void *)&v116 + 1) = 0;
        char v33 = sub_254EFCBB0();
        sub_254EDC06C(v32, v31, v30);
      }
      while ((v33 & 1) == 0);
      sub_254EDC06C(v98, v101, v29);
      uint64_t v12 = v94;
      goto LABEL_26;
    }
    if (v14) {
      break;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70E98);
    uint64_t v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = v82;
    *(void *)(v49 + 32) = v13;
    *(void *)(v49 + 40) = v11;
    *(void *)(v49 + 48) = v6;
    *(void *)(v49 + 56) = v10;
    *(void *)(v49 + 64) = v9;
    *(void *)(v49 + 72) = v8;
    uint64_t v50 = v49;
    uint64_t v98 = v13;
    uint64_t v97 = v10;
    uint64_t v99 = v9;
    uint64_t v100 = v8;
    sub_254ED8078(v13, v11, v6);
    sub_254ED74E0((uint64_t *)&v103);
    unint64_t v51 = v104;
    *(void *)&long long v95 = v50;
    if ((unint64_t)v104 >> 1 != 0xFFFFFFFF)
    {
      uint64_t v53 = *((void *)&v105 + 1);
      uint64_t v52 = v105;
      uint64_t v54 = *((void *)&v104 + 1);
      uint64_t v55 = *((void *)&v103 + 1);
      *(void *)&long long v92 = sub_254EFA874();
      uint64_t v101 = v11;
      while (1)
      {
        uint64_t v56 = v103;
        *((void *)&v103 + 1) = v55;
        *(void *)&long long v104 = v51;
        *((void *)&v104 + 1) = v54;
        *(void *)&long long v105 = v52;
        *((void *)&v105 + 1) = v53;
        long long v115 = v84;
        long long v116 = 0xA000000000000000;
        uint64_t v117 = 0;
        uint64_t v118 = 0;
        if (sub_254EFCBB0()) {
          break;
        }
        uint64_t v57 = (char *)v95;
        unint64_t v59 = *(void *)(v95 + 16);
        unint64_t v58 = *(void *)(v95 + 24);
        if (v59 >= v58 >> 1) {
          uint64_t v57 = sub_254EDBF50((char *)(v58 > 1), v59 + 1, 1, (char *)v95);
        }
        *((void *)v57 + 2) = v59 + 1;
        *(void *)&long long v95 = v57;
        long long v60 = &v57[48 * v59];
        *((void *)v60 + 4) = v56;
        *((void *)v60 + 5) = v55;
        *((void *)v60 + 6) = v51;
        *((void *)v60 + 7) = v54;
        *((void *)v60 + 8) = v52;
        *((void *)v60 + 9) = v53;
        sub_254ED74E0((uint64_t *)&v103);
        uint64_t v55 = *((void *)&v103 + 1);
        uint64_t v54 = *((void *)&v104 + 1);
        unint64_t v51 = v104;
        uint64_t v53 = *((void *)&v105 + 1);
        uint64_t v52 = v105;
        uint64_t v11 = v101;
        if ((unint64_t)v104 >> 1 == 0xFFFFFFFF) {
          goto LABEL_46;
        }
      }
      sub_254EDC06C(v56, v55, v51);
    }
LABEL_46:
    nullsub_1(v95);
    uint64_t v61 = sub_254ED7784();
    uint64_t v63 = v62;
    __int16 v65 = v64;
    swift_bridgeObjectRelease();
    *(void *)&long long v115 = v61;
    *((void *)&v115 + 1) = v63;
    LOWORD(v116) = v65 & 0x101;
    uint64_t v66 = v83;
    sub_254EF95C0(&v115, &v103);
    if (v66)
    {
      sub_254EDC06C(v98, v11, v6);
      MEMORY[0x25A2817A0](v66);
      swift_bridgeObjectRelease();
      uint64_t v83 = 0;
      goto LABEL_48;
    }
    swift_bridgeObjectRelease();
    uint64_t v83 = 0;
    if ((unint64_t)v104 >> 1 == 0xFFFFFFFF)
    {
      uint64_t v46 = v98;
      uint64_t v47 = v11;
      unint64_t v48 = v6;
    }
    else
    {
      long long v95 = v104;
      uint64_t v101 = v11;
      *(_OWORD *)&v89[8] = v103;
      long long v92 = v105;
      uint64_t v67 = v106;
      char v68 = v107;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        uint64_t v85 = sub_254EFA8C8(0, v85[2] + 1, 1, v85);
      }
      unint64_t v71 = v85[2];
      unint64_t v70 = v85[3];
      long long v72 = v95;
      if (v71 >= v70 >> 1)
      {
        uint64_t v75 = sub_254EFA8C8((void *)(v70 > 1), v71 + 1, 1, v85);
        long long v72 = v95;
        uint64_t v85 = v75;
      }
      unint64_t v73 = v85;
      v85[2] = v71 + 1;
      long long v74 = &v73[8 * v71];
      *((_OWORD *)v74 + 2) = *(_OWORD *)&v89[8];
      *((_OWORD *)v74 + 3) = v72;
      *((_OWORD *)v74 + 4) = v92;
      v74[10] = v67;
      *((unsigned char *)v74 + 88) = v68 & 1;
      uint64_t v46 = v98;
      uint64_t v47 = v101;
      unint64_t v48 = v6;
    }
LABEL_37:
    sub_254EDC06C(v46, v47, v48);
LABEL_48:
    uint64_t v12 = v94;
LABEL_26:
    sub_254ED74E0((uint64_t *)&v103);
    uint64_t v11 = *((void *)&v103 + 1);
    uint64_t v10 = *((void *)&v104 + 1);
    unint64_t v6 = v104;
    uint64_t v8 = *((void *)&v105 + 1);
    uint64_t v9 = v105;
    if ((unint64_t)v104 >> 1 == 0xFFFFFFFF) {
      return v85;
    }
  }
  if (v14 != 2) {
    goto LABEL_8;
  }
  uint64_t v100 = v8;
  uint64_t v34 = v83;
  sub_254EF7A10(v96, (uint64_t)&v103);
  uint64_t v83 = v34;
  if (v34)
  {
    MEMORY[0x25A2817A0](v83);
    goto LABEL_59;
  }
  long long v35 = v103;
  *(_OWORD *)uint64_t v89 = v104;
  *(void *)&long long v95 = *((void *)&v105 + 1);
  *(void *)&long long v92 = v105;
  uint64_t v81 = v107;
  unint64_t v36 = v109;
  uint64_t v80 = v108;
  uint64_t v79 = v110;
  uint64_t v78 = v111;
  uint64_t v37 = v113;
  uint64_t v77 = v112;
  if (v114 == 1)
  {
    uint64_t v98 = v13;
    uint64_t v101 = v11;
    uint64_t v99 = v9;
    swift_bridgeObjectRelease();
    long long v115 = v35;
    long long v116 = *(_OWORD *)v89;
    uint64_t v38 = MEMORY[0x263F8EE78];
    uint64_t v117 = v92;
    uint64_t v118 = v95;
    if (v36 >> 1 != 0xFFFFFFFF)
    {
      swift_bridgeObjectRetain();
      sub_254EF6B54(v81, v80, v36);
      uint64_t v38 = v37;
    }
    sub_254EF63DC((uint64_t)&v115, v38, 0, (uint64_t)&v103);
    uint64_t v39 = *((void *)&v103 + 1);
    *(void *)&long long v95 = v103;
    long long v40 = v104;
    long long v41 = v105;
    *(void *)&long long v92 = v106;
    *(_DWORD *)&v89[8] = v107;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v85 = sub_254EFA8C8(0, v85[2] + 1, 1, v85);
    }
    unint64_t v43 = v85[2];
    unint64_t v42 = v85[3];
    if (v43 >= v42 >> 1) {
      uint64_t v85 = sub_254EFA8C8((void *)(v42 > 1), v43 + 1, 1, v85);
    }
    uint64_t v44 = v85;
    v85[2] = v43 + 1;
    uint64_t v45 = &v44[8 * v43];
    v45[4] = v95;
    v45[5] = v39;
    *((_OWORD *)v45 + 3) = v40;
    *((_OWORD *)v45 + 4) = v41;
    v45[10] = v92;
    *((unsigned char *)v45 + 88) = v89[8];
    uint64_t v46 = v98;
    uint64_t v47 = v101;
    unint64_t v48 = v6;
    goto LABEL_37;
  }
  sub_254EF6A30(v103, *((uint64_t *)&v103 + 1), *(unint64_t *)v89, *(unint64_t *)&v89[8], v92, v95, v106, v81, v80, v109, v79, v78, v77, v113, 0);
LABEL_59:
  double result = (void *)sub_254EFCFE0();
  __break(1u);
  return result;
}

void sub_254EF95C0(NSObject *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_254EFCB40();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254ED74E0((uint64_t *)&v55);
  if (*(void *)v56 >> 1 == 0xFFFFFFFFLL)
  {
    sub_254EDF770();
    swift_allocError();
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    *(unsigned char *)(v9 + 32) = 4;
    swift_willThrow();
    return;
  }
  unint64_t v51 = *(void *)v56;
  uint64_t v53 = v8;
  uint64_t v45 = v6;
  uint64_t v52 = v5;
  uint64_t v46 = a2;
  uint64_t v47 = v2;
  long long v48 = v55;
  uint64_t v49 = *(void *)&v56[8];
  long long v50 = *(_OWORD *)&v56[16];
  sub_254ED7778();
  long long v54 = xmmword_254EFD720;
  uint64_t v63 = a1;
  do
  {
    sub_254ED74E0((uint64_t *)&v55);
    unint64_t v10 = *(void *)v56;
    if (*(void *)v56 >> 1 == 0xFFFFFFFFLL) {
      break;
    }
    long long v11 = v55;
    long long v59 = v54;
    unint64_t v60 = 0xA000000000000000;
    long long v62 = 0uLL;
    uint64_t v61 = 0;
    char v12 = static Token.== infix(_:_:)(&v55, &v59);
    sub_254EDC06C(v11, *((uint64_t *)&v11 + 1), v10);
  }
  while ((v12 & 1) != 0);
  sub_254ED74E0((uint64_t *)&v55);
  long long v13 = v55;
  long long v14 = *(_OWORD *)v56;
  long long v15 = *(_OWORD *)&v56[16];
  if (*(void *)v56 >> 1 == 0xFFFFFFFFLL)
  {
    sub_254EDC06C(v55, *((uint64_t *)&v55 + 1), *(unint64_t *)v56);
    sub_254EDC06C(12, 0, 0xA000000000000000);
    sub_254EDC06C(v48, *((uint64_t *)&v48 + 1), v51);
    uint64_t v16 = v52;
LABEL_13:
    uint64_t v24 = sub_254EFC5C4();
    uint64_t v25 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v53, v24, v16);
    sub_254EFAFC8(v13, *((uint64_t *)&v13 + 1), v14);
    uint64_t v26 = sub_254EFCB20();
    os_log_type_t v27 = sub_254EFCE10();
    uint64_t v63 = v26;
    LODWORD(v54) = v27;
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (_DWORD *)swift_slowAlloc();
      unint64_t v51 = swift_slowAlloc();
      *(void *)&long long v59 = v51;
      *((void *)&v50 + 1) = v28;
      *uint64_t v28 = 136315138;
      *(void *)&long long v50 = v28 + 1;
      long long v55 = v13;
      *(_OWORD *)uint64_t v56 = v14;
      *(_OWORD *)&v56[16] = v15;
      sub_254EFAFC8(v13, *((uint64_t *)&v13 + 1), v14);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E71280);
      uint64_t v29 = sub_254EFCBC0();
      *(void *)&long long v55 = sub_254EFA9D8(v29, v30, (uint64_t *)&v59);
      sub_254EFCE90();
      swift_bridgeObjectRelease();
      sub_254EDC06C(v13, *((uint64_t *)&v13 + 1), v14);
      sub_254EDC06C(v13, *((uint64_t *)&v13 + 1), v14);
      uint64_t v31 = v63;
      uint64_t v32 = *((void *)&v50 + 1);
      _os_log_impl(&dword_254ED4000, v63, (os_log_type_t)v54, "Could not consume declaration: current token %s not a colon.", *((uint8_t **)&v50 + 1), 0xCu);
      unint64_t v33 = v51;
      swift_arrayDestroy();
      MEMORY[0x25A2818B0](v33, -1, -1);
      MEMORY[0x25A2818B0](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v25 + 8))(v53, v52);
    }
    else
    {
      sub_254EDC06C(v13, *((uint64_t *)&v13 + 1), v14);
      sub_254EDC06C(v13, *((uint64_t *)&v13 + 1), v14);

      (*(void (**)(char *, uint64_t))(v25 + 8))(v53, v16);
    }
    uint64_t v34 = v46;
    *uint64_t v46 = 0;
    v34[1] = 0;
    void v34[2] = 0x1FFFFFFFELL;
    *(_OWORD *)(v34 + 3) = 0u;
    *(_OWORD *)(v34 + 5) = 0u;
    *((unsigned char *)v34 + 56) = 0;
    return;
  }
  long long v59 = xmmword_254EFD7B0;
  unint64_t v60 = 0xA000000000000000;
  uint64_t v61 = 0;
  long long v62 = 0uLL;
  sub_254ED8078(v55, *((uint64_t *)&v55 + 1), *(unint64_t *)v56);
  sub_254ED8078(v13, *((uint64_t *)&v13 + 1), v14);
  sub_254EFA874();
  char v17 = sub_254EFCBB0();
  sub_254ED76FC(v55, *((uint64_t *)&v55 + 1), *(unint64_t *)v56);
  sub_254EDC06C(v13, *((uint64_t *)&v13 + 1), v14);
  uint64_t v16 = v52;
  if ((v17 & 1) == 0)
  {
    sub_254EDC06C(v48, *((uint64_t *)&v48 + 1), v51);
    goto LABEL_13;
  }
  sub_254EDC06C(v13, *((uint64_t *)&v13 + 1), v14);
  sub_254ED74E0((uint64_t *)&v55);
  uint64_t v18 = *(void *)v56;
  if (*(void *)v56 >> 1 == 0xFFFFFFFFLL)
  {
    os_log_type_t v19 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v35 = *(void *)&v56[24];
    long long v36 = *(_OWORD *)&v56[8];
    os_log_type_t v19 = (void *)MEMORY[0x263F8EE78];
    uint64_t v37 = *((void *)&v55 + 1);
    do
    {
      long long v54 = v36;
      uint64_t v38 = v55;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        os_log_type_t v19 = sub_254EFA624(0, v19[2] + 1, 1, v19);
      }
      unint64_t v40 = v19[2];
      unint64_t v39 = v19[3];
      long long v41 = v54;
      if (v40 >= v39 >> 1)
      {
        unint64_t v43 = sub_254EFA624((void *)(v39 > 1), v40 + 1, 1, v19);
        long long v41 = v54;
        os_log_type_t v19 = v43;
      }
      void v19[2] = v40 + 1;
      unint64_t v42 = &v19[7 * v40];
      v42[4] = v38;
      v42[5] = v37;
      v42[6] = v18;
      v42[9] = v35;
      v42[10] = 0;
      *(_OWORD *)(v42 + 7) = v41;
      sub_254ED74E0((uint64_t *)&v55);
      uint64_t v37 = *((void *)&v55 + 1);
      uint64_t v18 = *(void *)v56;
      long long v36 = *(_OWORD *)&v56[8];
      uint64_t v35 = *(void *)&v56[24];
    }
    while (*(void *)v56 >> 1 != 0xFFFFFFFFLL);
  }
  long long v59 = v48;
  unint64_t v60 = v51;
  uint64_t v61 = v49;
  long long v62 = v50;
  sub_254EF63DC((uint64_t)&v59, (uint64_t)v19, 0, (uint64_t)&v55);
  uint64_t v20 = v57;
  char v21 = v58;
  long long v22 = *(_OWORD *)v56;
  unint64_t v23 = v46;
  *(_OWORD *)uint64_t v46 = v55;
  *((_OWORD *)v23 + 1) = v22;
  *((_OWORD *)v23 + 2) = *(_OWORD *)&v56[16];
  v23[6] = v20;
  *((unsigned char *)v23 + 56) = v21;
}

uint64_t sub_254EF9D18@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v31 = a3;
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  unint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  uint64_t v19 = *a2;
  uint64_t v20 = v5;
  unint64_t v21 = v6;
  uint64_t v22 = v7;
  uint64_t v23 = v8;
  uint64_t v24 = v9;
  sub_254EE4A08(&v25);
  unint64_t v10 = v27;
  if (v27 >> 1 == 0xFFFFFFFF)
  {
    sub_254EDF770();
    swift_allocError();
    *(void *)uint64_t v11 = sub_254EFA5B8;
    *(void *)(v11 + 8) = 0;
    *(void *)(v11 + 16) = 0;
    *(void *)(v11 + 24) = 0;
    *(unsigned char *)(v11 + 32) = 3;
    return swift_willThrow();
  }
  else
  {
    uint64_t v14 = v29;
    uint64_t v13 = v30;
    uint64_t v15 = v28;
    uint64_t v16 = a1;
    uint64_t v18 = v25;
    uint64_t v17 = v26;
    uint64_t v25 = v4;
    uint64_t v26 = v5;
    unint64_t v27 = v6;
    uint64_t v28 = v7;
    uint64_t v29 = v8;
    uint64_t v30 = v9;
    uint64_t v19 = v18;
    uint64_t v20 = v17;
    unint64_t v21 = v10;
    uint64_t v22 = v15;
    uint64_t v23 = v14;
    uint64_t v24 = v13;
    sub_254EFA124(v16, &v25, &v19, v31);
    return sub_254EDC06C(v18, v17, v10);
  }
}

uint64_t sub_254EF9E54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_254ED74E0((uint64_t *)&v27);
  unint64_t v5 = v28;
  if (v28 >> 1 == 0xFFFFFFFF)
  {
    sub_254EDF770();
    swift_allocError();
    *(_OWORD *)uint64_t v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    *(unsigned char *)(v6 + 32) = 4;
    return swift_willThrow();
  }
  long long v7 = v27;
  long long v8 = v29;
  uint64_t v9 = v30;
  if (v28 >> 60 == 1)
  {
    long long v23 = v27;
    unint64_t v24 = v28;
    long long v25 = v29;
    uint64_t v26 = v30;
    long long v19 = xmmword_254EFD740;
    unint64_t v20 = 0xA000000000000000;
    long long v21 = 0uLL;
    uint64_t v22 = 0;
    sub_254EFA124(a1, (uint64_t *)&v23, (uint64_t *)&v19, (uint64_t)&v27);
    uint64_t result = sub_254EDC06C(v7, *((uint64_t *)&v7 + 1), v5);
    uint64_t v12 = v30;
    uint64_t v13 = v31;
    uint64_t v14 = v28 | 0x800000000000000;
  }
  else
  {
    if (v28 >> 60 != 10
      || ((uint64_t v10 = v29 | *((void *)&v27 + 1) | *((void *)&v29 + 1), v30)
       || v28 != 0xA000000000000000
       || (void)v27 != 15
       || v10)
      && (v30 || v28 != 0xA000000000000000 || (void)v27 != 17 || v10)
      && (v30 || v28 != 0xA000000000000000 || (void)v27 != 19 || v10))
    {
      *(void *)a2 = v27;
      *(void *)(a2 + 8) = *((void *)&v7 + 1);
      *(void *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 24) = v8;
      *(void *)(a2 + 40) = v9;
      *(void *)(a2 + 48) = 0;
      return result;
    }
    long long v19 = v27;
    unint64_t v20 = v28;
    long long v21 = v29;
    uint64_t v22 = v30;
    uint64_t v32 = *((void *)&v29 + 1);
    sub_254EE4A08((uint64_t *)&v23);
    if (v24 >> 1 == 0xFFFFFFFF)
    {
      sub_254EDF770();
      swift_allocError();
      *(void *)uint64_t v11 = sub_254EFA5B8;
      *(void *)(v11 + 8) = 0;
      *(void *)(v11 + 16) = 0;
      *(void *)(v11 + 24) = 0;
      *(unsigned char *)(v11 + 32) = 3;
      swift_willThrow();
      return sub_254EDC06C(v7, *((uint64_t *)&v7 + 1), 0xA000000000000000);
    }
    uint64_t v18 = v26;
    long long v17 = v25;
    long long v16 = v23;
    long long v23 = v7;
    unint64_t v24 = 0xA000000000000000;
    *(void *)&long long v25 = v8;
    *((void *)&v25 + 1) = v32;
    uint64_t v26 = 0;
    long long v19 = v16;
    unint64_t v20 = *((void *)&v8 + 1);
    long long v21 = v17;
    uint64_t v22 = v18;
    sub_254EFA124(a1, (uint64_t *)&v23, (uint64_t *)&v19, (uint64_t)&v27);
    sub_254EDC06C(v16, *((uint64_t *)&v16 + 1), *((unint64_t *)&v8 + 1));
    uint64_t result = sub_254EDC06C(v7, *((uint64_t *)&v7 + 1), 0xA000000000000000);
    uint64_t v12 = v30;
    uint64_t v13 = v31;
    uint64_t v14 = v28 | 0x400000000000000;
  }
  long long v15 = v29;
  *(_OWORD *)a2 = v27;
  *(void *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 24) = v15;
  *(void *)(a2 + 40) = v12;
  *(void *)(a2 + 48) = v13;
  return result;
}

double sub_254EFA124@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  unint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  uint64_t v38 = a2[5];
  uint64_t v39 = a2[4];
  uint64_t v45 = a3[1];
  uint64_t v46 = *a3;
  uint64_t v43 = a3[3];
  unint64_t v44 = a3[2];
  uint64_t v10 = a3[5];
  uint64_t v42 = a3[4];
  sub_254ED74E0((uint64_t *)&v51);
  unint64_t v11 = v52;
  if (v52 >> 1 != 0xFFFFFFFF)
  {
    sub_254EFA874();
    unint64_t v40 = (void *)MEMORY[0x263F8EE78];
    uint64_t v33 = v7;
    uint64_t v34 = a4;
    unint64_t v36 = v8;
    uint64_t v37 = v6;
    uint64_t v35 = v9;
    while (1)
    {
      long long v13 = v51;
      unint64_t v52 = v11;
      *(void *)&long long v56 = v46;
      *((void *)&v56 + 1) = v45;
      unint64_t v57 = v44;
      *(void *)&long long v58 = v43;
      *((void *)&v58 + 1) = v42;
      uint64_t v59 = v10;
      char v14 = sub_254EFCBB0();
      sub_254EDC06C(v13, *((uint64_t *)&v13 + 1), v11);
      if (v14)
      {
LABEL_34:
        uint64_t v7 = v33;
        a4 = v34;
        unint64_t v8 = v36;
        uint64_t v6 = v37;
        uint64_t v9 = v35;
        goto LABEL_35;
      }
      sub_254ED7778();
      sub_254ED74E0((uint64_t *)&v51);
      unint64_t v15 = v52;
      if (v52 >> 1 == 0xFFFFFFFF) {
        goto LABEL_6;
      }
      uint64_t v16 = v54;
      long long v41 = v51;
      if (v52 >> 60 != 10)
      {
        uint64_t v7 = v33;
        a4 = v34;
        if (v52 >> 60 == 1)
        {
          long long v56 = v51;
          unint64_t v57 = v52;
          long long v58 = v53;
          uint64_t v59 = v54;
          long long v47 = xmmword_254EFD740;
          unint64_t v48 = 0xA000000000000000;
          uint64_t v50 = 0;
          long long v49 = 0uLL;
          sub_254EFA124(&v51, a1, &v56, &v47);
          sub_254EDC06C(v41, *((uint64_t *)&v41 + 1), v15);
          long long v41 = v51;
          long long v32 = v53;
          uint64_t v16 = v54;
          uint64_t v21 = v55;
          unint64_t v15 = v52 | 0x800000000000000;
        }
        else
        {
          long long v32 = v53;
          uint64_t v21 = 0;
        }
        goto LABEL_28;
      }
      uint64_t v17 = *((void *)&v51 + 1);
      uint64_t v18 = v51;
      long long v19 = v53;
      uint64_t v20 = v53 | *((void *)&v51 + 1) | *((void *)&v53 + 1);
      if (!v54 && v52 == 0xA000000000000000 && (void)v51 == 15 && !v20
        || !v54 && v52 == 0xA000000000000000 && (void)v51 == 17 && !v20
        || !v54 && v52 == 0xA000000000000000 && (void)v51 == 19 && !v20)
      {
        long long v47 = v51;
        unint64_t v48 = 0xA000000000000000;
        long long v49 = v53;
        uint64_t v50 = 0;
        sub_254EE4A08((uint64_t *)&v56);
        unint64_t v12 = v57;
        if (v57 >> 1 != 0xFFFFFFFF)
        {
          uint64_t v22 = v59;
          long long v31 = v58;
          long long v30 = v56;
          long long v56 = v41;
          unint64_t v57 = 0xA000000000000000;
          long long v58 = v19;
          uint64_t v59 = 0;
          long long v47 = v30;
          unint64_t v48 = v12;
          long long v49 = v31;
          uint64_t v50 = v22;
          sub_254EFA124(&v51, a1, &v56, &v47);
          sub_254EDC06C(v30, *((uint64_t *)&v30 + 1), v12);
          sub_254EDC06C(v18, v17, 0xA000000000000000);
          long long v41 = v51;
          long long v32 = v53;
          uint64_t v16 = v54;
          uint64_t v21 = v55;
          unint64_t v15 = v52 | 0x400000000000000;
          goto LABEL_27;
        }
        sub_254EDC06C(v18, v17, 0xA000000000000000);
LABEL_6:
        sub_254ED74E0((uint64_t *)&v51);
        unint64_t v11 = v52;
        if (v52 >> 1 == 0xFFFFFFFF) {
          goto LABEL_34;
        }
      }
      else
      {
        long long v32 = v53;
        uint64_t v21 = 0;
LABEL_27:
        uint64_t v7 = v33;
        a4 = v34;
LABEL_28:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v40 = sub_254EFA624(0, v40[2] + 1, 1, v40);
        }
        unint64_t v24 = v40[2];
        unint64_t v23 = v40[3];
        long long v25 = v41;
        long long v26 = v32;
        if (v24 >= v23 >> 1)
        {
          unint64_t v28 = sub_254EFA624((void *)(v23 > 1), v24 + 1, 1, v40);
          long long v26 = v32;
          long long v25 = v41;
          unint64_t v40 = v28;
        }
        v40[2] = v24 + 1;
        long long v27 = &v40[7 * v24];
        *((_OWORD *)v27 + 2) = v25;
        v27[6] = v15;
        *(_OWORD *)(v27 + 7) = v26;
        v27[9] = v16;
        v27[10] = v21;
        sub_254ED74E0((uint64_t *)&v51);
        unint64_t v11 = v52;
        unint64_t v8 = v36;
        uint64_t v6 = v37;
        uint64_t v9 = v35;
        if (v52 >> 1 == 0xFFFFFFFF) {
          goto LABEL_35;
        }
      }
    }
  }
  unint64_t v40 = (void *)MEMORY[0x263F8EE78];
LABEL_35:
  *(void *)&long long v51 = v7;
  *((void *)&v51 + 1) = v6;
  unint64_t v52 = v8;
  *(void *)&long long v53 = v9;
  *((void *)&v53 + 1) = v39;
  uint64_t v54 = v38;
  sub_254ED8078(v7, v6, v8);
  *(void *)&double result = sub_254EF63BC((uint64_t)&v51, (uint64_t)v40, a4).n128_u64[0];
  return result;
}

unint64_t sub_254EFA5B8()
{
  return 0xD00000000000003DLL;
}

double sub_254EFA5D4@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  long long v3 = a2[1];
  v10[0] = *a2;
  v10[1] = v3;
  void v10[2] = a2[2];
  long long v5 = xmmword_254EFD740;
  unint64_t v6 = 0xA000000000000000;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  return sub_254EFA124(a1, (uint64_t *)v10, (uint64_t *)&v5, a3);
}

void *sub_254EFA624(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E71290);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      _OWORD v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4]) {
          memmove(v12, a4 + 4, 56 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_254EFAFDC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_254EFA750(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E71298);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      _OWORD v10[3] = 2 * ((uint64_t)(v11 - 32) / 120);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[15 * v8 + 4]) {
          memmove(v12, a4 + 4, 120 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_254EFB0D4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_254EFA874()
{
  unint64_t result = qword_269E71278;
  if (!qword_269E71278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E71278);
  }
  return result;
}

void *sub_254EFA8C8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E71288);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 31;
      }
      void v10[2] = v8;
      _OWORD v10[3] = 2 * (v12 >> 6);
      long long v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      long long v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4]) {
          memmove(v13, a4 + 4, v8 << 6);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_254EFB1CC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_254EFA9D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_254EFAAAC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_254EFB2C0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_254EFB2C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_254EFAAAC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_254EFCEA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_254EFAC68(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_254EFCF60();
  if (!v8)
  {
    sub_254EFCFD0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_254EFD000();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_254EFAC68(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_254EFAD00(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_254EFAE78(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_254EFAE78(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_254EFAD00(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_254EDF424(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_254EFCF30();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_254EFCFD0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_254EFCCC0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_254EFD000();
    __break(1u);
LABEL_14:
    uint64_t result = sub_254EFCFD0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_254EFAE78(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70ED8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_254EFD000();
  __break(1u);
  return result;
}

uint64_t sub_254EFAFC8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 1 != 0xFFFFFFFF) {
    return sub_254ED8078(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_254EFAFDC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_254EFD000();
  __break(1u);
  return result;
}

uint64_t sub_254EFB0D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 120 * a1 + 32;
    unint64_t v6 = a3 + 120 * v4;
    if (v5 >= v6 || v5 + 120 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_254EFD000();
  __break(1u);
  return result;
}

uint64_t sub_254EFB1CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 6) + 32;
    unint64_t v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_254EFD000();
  __break(1u);
  return result;
}

uint64_t sub_254EFB2C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_254EFB31C(_OWORD *a1)
{
  long long v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  v3[2] = a1[2];
  return sub_254EFBC68((uint64_t *)v3);
}

uint64_t sub_254EFB350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void v10[2] = sub_254EFB420;
  _OWORD v10[3] = 0;
  void v10[4] = sub_254EFB56C((void (*)(char *, char *))sub_254EFC4E8, (uint64_t)v10, a2, MEMORY[0x263F8D310], MEMORY[0x263F8E628], a3, MEMORY[0x263F8E658], a8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F90);
  sub_254EFC48C();
  uint64_t v8 = sub_254EFCBA0();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_254EFB420(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  long long v2 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 32);
  uint64_t v5 = v1;
  return sub_254EFC1A8((uint64_t *)v4);
}

uint64_t sub_254EFB45C(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v16 = MEMORY[0x263F8EE78];
  sub_254EE8584(0, v2, 0);
  uint64_t v3 = v16;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)(a1 + 80);
    do
    {
      uint64_t v5 = *v4;
      long long v6 = *((_OWORD *)v4 - 2);
      v14[0] = *((_OWORD *)v4 - 3);
      v14[1] = v6;
      _OWORD v14[2] = *((_OWORD *)v4 - 1);
      uint64_t v15 = v5;
      uint64_t v7 = sub_254EFC1A8(v14);
      uint64_t v9 = v8;
      uint64_t v16 = v3;
      unint64_t v11 = *(void *)(v3 + 16);
      unint64_t v10 = *(void *)(v3 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_254EE8584((char *)(v10 > 1), v11 + 1, 1);
        uint64_t v3 = v16;
      }
      *(void *)(v3 + 16) = v11 + 1;
      uint64_t v12 = v3 + 16 * v11;
      *(void *)(v12 + 32) = v7;
      *(void *)(v12 + 40) = v9;
      v4 += 7;
      --v2;
    }
    while (v2);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_254EFB56C(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a5;
  uint64_t v9 = v8;
  uint64_t v58 = a2;
  uint64_t v59 = a4;
  unint64_t v57 = a1;
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v55 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  long long v53 = (char *)&v40 - v13;
  uint64_t v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  long long v41 = (char *)&v40 - v17;
  uint64_t v18 = sub_254EFCE20();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  long long v51 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  unint64_t v23 = (char *)&v40 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  unint64_t v40 = (char *)&v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v50 = *((void *)v15 - 1);
  MEMORY[0x270FA5388](v26);
  unint64_t v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a6;
  unint64_t v52 = v15;
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  long long v30 = (char *)&v40 - v29;
  uint64_t v31 = sub_254EFCD60();
  uint64_t v61 = sub_254EFCFA0();
  uint64_t v56 = sub_254EFCFB0();
  sub_254EFCF80();
  (*(void (**)(char *, uint64_t, void))(v50 + 16))(v28, v48, v52);
  uint64_t v59 = v30;
  uint64_t result = sub_254EFCD50();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    uint64_t v33 = (uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
    uint64_t v34 = (uint64_t (**)(char *, uint64_t))(v54 + 8);
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_254EFCE80();
      uint64_t result = (*v33)(v23, 1, AssociatedTypeWitness);
      if (result == 1) {
        goto LABEL_18;
      }
      v57(v23, v55);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v55, v44);
        return (*v34)(v23, AssociatedTypeWitness);
      }
      uint64_t v9 = 0;
      (*v34)(v23, AssociatedTypeWitness);
      sub_254EFCF90();
      if (!--v31)
      {
        uint64_t v35 = v54;
        unint64_t v36 = v51;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v35 = v54;
  unint64_t v36 = v51;
LABEL_9:
  sub_254EFCE80();
  uint64_t v55 = *(char **)(v35 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v36, 1, AssociatedTypeWitness) == 1)
  {
    uint64_t v37 = v51;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v46);
    return v61;
  }
  else
  {
    unint64_t v52 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    uint64_t v54 = v35 + 32;
    uint64_t v38 = (void (**)(char *, uint64_t))(v35 + 8);
    uint64_t v39 = v41;
    uint64_t v37 = v51;
    while (1)
    {
      v52(v39, v37, AssociatedTypeWitness);
      v57(v39, v53);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v38)(v39, AssociatedTypeWitness);
      sub_254EFCF90();
      sub_254EFCE80();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v37, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_14;
      }
    }
    (*v38)(v39, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v53, v44);
  }
}

uint64_t sub_254EFBC68(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  unint64_t v3 = a1[2];
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  switch(v3 >> 60)
  {
    case 1uLL:
    case 8uLL:
    case 9uLL:
      uint64_t v14 = *a1;
      swift_bridgeObjectRetain();
      goto LABEL_10;
    case 2uLL:
      uint64_t v6 = 64;
      goto LABEL_5;
    case 3uLL:
      uint64_t v6 = 35;
LABEL_5:
      uint64_t v14 = v6;
      goto LABEL_10;
    case 4uLL:
      uint64_t v14 = 34;
      sub_254EFCCA0();
      goto LABEL_10;
    case 5uLL:
      uint64_t v14 = 678195829;
      sub_254EFCCA0();
LABEL_10:
      sub_254EFCCA0();
      uint64_t v1 = v14;
      break;
    case 6uLL:
      uint64_t v1 = sub_254EFD250();
      break;
    case 0xAuLL:
      uint64_t v8 = a1[3];
      if (v3 == 0xA000000000000000 && (v5 | v2 | v1 | v4 | v8) == 0)
      {
        uint64_t v1 = 0xD000000000000012;
      }
      else
      {
        uint64_t v10 = v5 | v2 | v8;
        if (v4 || v3 != 0xA000000000000000 || v1 != 1 || v10)
        {
          if (v4 || v3 != 0xA000000000000000 || v1 != 2 || v10)
          {
            if (v4 || v3 != 0xA000000000000000 || v1 != 3 || v10)
            {
              if (v4 || v3 != 0xA000000000000000 || v1 != 4 || v10)
              {
                if (v4 || v3 != 0xA000000000000000 || v1 != 5 || v10)
                {
                  if (v4 || v3 != 0xA000000000000000 || v1 != 6 || v10)
                  {
                    if (v4 || v3 != 0xA000000000000000 || v1 != 7 || v10)
                    {
                      if (v4 || v3 != 0xA000000000000000 || v1 != 8 || v10)
                      {
                        if (v4 || v3 != 0xA000000000000000 || v1 != 9 || v10)
                        {
                          if (v4 || v3 != 0xA000000000000000 || v1 != 10 || v10)
                          {
                            if (v4 || v3 != 0xA000000000000000 || v1 != 11 || v10)
                            {
                              if (v4 || v3 != 0xA000000000000000 || v1 != 12 || v10)
                              {
                                if (v4 || v3 != 0xA000000000000000 || v1 != 13 || v10)
                                {
                                  if (v4 || v3 != 0xA000000000000000 || v1 != 14 || v10)
                                  {
                                    if (v4 || v3 != 0xA000000000000000 || v1 != 15 || v10)
                                    {
                                      if (v4 || v3 != 0xA000000000000000 || v1 != 16 || v10)
                                      {
                                        if (v4 || v3 != 0xA000000000000000 || v1 != 17 || v10)
                                        {
                                          if (v4 || v3 != 0xA000000000000000 || v1 != 18 || v10)
                                          {
                                            if (v4 || v3 != 0xA000000000000000 || v1 != 19 || v10)
                                            {
                                              BOOL v13 = v1 == 20 && v10 == 0 && v3 == 0xA000000000000000;
                                              if (v4 == 0 && v13) {
                                                uint64_t v1 = 125;
                                              }
                                              else {
                                                uint64_t v1 = 4607813;
                                              }
                                            }
                                            else
                                            {
                                              uint64_t v1 = 123;
                                            }
                                          }
                                          else
                                          {
                                            uint64_t v1 = 41;
                                          }
                                        }
                                        else
                                        {
                                          uint64_t v1 = 40;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t v1 = 93;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v1 = 91;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v1 = 44;
                                  }
                                }
                                else
                                {
                                  uint64_t v1 = 59;
                                }
                              }
                              else
                              {
                                uint64_t v1 = 58;
                              }
                            }
                            else
                            {
                              uint64_t v1 = 4074797;
                            }
                          }
                          else
                          {
                            uint64_t v1 = 757932348;
                          }
                        }
                        else
                        {
                          uint64_t v1 = 32;
                        }
                      }
                      else
                      {
                        uint64_t v1 = 31868;
                      }
                    }
                    else
                    {
                      uint64_t v1 = 15658;
                    }
                  }
                  else
                  {
                    uint64_t v1 = 15652;
                  }
                }
                else
                {
                  uint64_t v1 = 15710;
                }
              }
              else
              {
                uint64_t v1 = 15740;
              }
            }
            else
            {
              uint64_t v1 = 15742;
            }
          }
          else
          {
            uint64_t v1 = 0xD000000000000015;
          }
        }
        else
        {
          uint64_t v1 = 0x6C72752D6461623CLL;
        }
      }
      break;
    default:
      swift_bridgeObjectRetain();
      break;
  }
  return v1;
}

uint64_t sub_254EFC1A8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  unint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = (v3 >> 58) & 3;
  if (v7)
  {
    if (v7 == 1)
    {
      unint64_t v8 = v3 & 0xF3FFFFFFFFFFFFFFLL;
      sub_254EE4A08(&v24);
      unint64_t v9 = v26;
      if (v26 >> 1 == 0xFFFFFFFF) {
        return 0;
      }
      uint64_t v21 = v28;
      uint64_t v22 = v29;
      uint64_t v15 = v24;
      uint64_t v19 = v25;
      uint64_t v20 = v27;
      uint64_t v24 = v2;
      uint64_t v25 = v1;
      unint64_t v26 = v8;
      uint64_t v27 = v4;
      uint64_t v28 = v6;
      uint64_t v29 = v5;
      uint64_t v23 = sub_254EFBC68(&v24);
      uint64_t v17 = v16;
      uint64_t v18 = swift_bridgeObjectRetain();
      uint64_t v24 = sub_254EFB45C(v18);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F90);
      sub_254EFC48C();
      sub_254EFCBA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v24 = v15;
      uint64_t v25 = v19;
      unint64_t v26 = v9;
      uint64_t v27 = v20;
      uint64_t v28 = v21;
      uint64_t v29 = v22;
      sub_254EFBC68(&v24);
      sub_254EDC06C(v15, v19, v9);
      uint64_t v24 = v23;
      uint64_t v25 = v17;
      swift_bridgeObjectRetain();
      sub_254EFCCA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_254EFCCA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = *a1;
      uint64_t v25 = v1;
      unint64_t v26 = v3 & 0xF3FFFFFFFFFFFFFFLL;
      uint64_t v27 = v4;
      uint64_t v28 = v6;
      uint64_t v29 = v5;
      uint64_t v11 = sub_254EFBC68(&v24);
      uint64_t v13 = v12;
      uint64_t v14 = swift_bridgeObjectRetain();
      uint64_t v24 = sub_254EFB45C(v14);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E70F90);
      sub_254EFC48C();
      sub_254EFCBA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v24 = v11;
      uint64_t v25 = v13;
      swift_bridgeObjectRetain();
      sub_254EFCCA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_254EFCCA0();
    }
    swift_bridgeObjectRelease();
    return v24;
  }
  else
  {
    uint64_t v24 = *a1;
    uint64_t v25 = v1;
    unint64_t v26 = v3;
    uint64_t v27 = v4;
    uint64_t v28 = v6;
    uint64_t v29 = v5;
    return sub_254EFBC68(&v24);
  }
}

uint64_t sub_254EFC468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

ValueMetadata *type metadata accessor for AnySerializer()
{
  return &type metadata for AnySerializer;
}

unint64_t sub_254EFC48C()
{
  unint64_t result = qword_269E70F98;
  if (!qword_269E70F98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E70F90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70F98);
  }
  return result;
}

uint64_t sub_254EFC4E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_254EFC528()
{
  uint64_t v0 = sub_254EFCB40();
  __swift_allocate_value_buffer(v0, qword_269E76A88);
  __swift_project_value_buffer(v0, (uint64_t)qword_269E76A88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E712A8);
  sub_254EFCBC0();
  return sub_254EFCB30();
}

uint64_t sub_254EFC5C4()
{
  if (qword_269E76A80 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_254EFCB40();

  return __swift_project_value_buffer(v0, (uint64_t)qword_269E76A88);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_254EFC660@<X0>(uint64_t a1@<X8>)
{
  if (qword_269E76A80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_254EFCB40();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269E76A88);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t TokenParser.init<A>(using:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  a4[3] = a2;
  a4[4] = a3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a4);
  uint64_t v7 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32);

  return v7(boxed_opaque_existential_0, a1, a2);
}

uint64_t TokenParser.parse()()
{
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  if (!v1)
  {
    nullsub_1(v4);
    uint64_t v5 = sub_254ED7784();
    uint64_t v7 = v6;
    __int16 v9 = v8;
    swift_bridgeObjectRelease();
    v35[0] = v5;
    v35[1] = v7;
    __int16 v36 = v9 & 0x101;
    uint64_t v10 = sub_254EF7548((uint64_t)v35, 1);
    sub_254EDFB18((uint64_t)v0, (uint64_t)v34);
    int64_t v11 = v10[2];
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (v11)
    {
      uint64_t v37 = MEMORY[0x263F8EE78];
      sub_254EFC954(0, v11, 0);
      uint64_t v3 = v37;
      uint64_t v12 = v10 + 10;
      do
      {
        long long v13 = *((_OWORD *)v12 - 2);
        v28[0] = *((_OWORD *)v12 - 3);
        v28[1] = v13;
        long long v14 = *(_OWORD *)v12;
        _OWORD v28[2] = *((_OWORD *)v12 - 1);
        v28[3] = v14;
        long long v15 = *((_OWORD *)v12 + 2);
        long long v16 = *((_OWORD *)v12 + 3);
        v28[4] = *((_OWORD *)v12 + 1);
        v28[5] = v15;
        char v17 = *((unsigned char *)v12 + 64);
        v28[6] = v16;
        char v29 = v17;
        sub_254EDF8AC((uint64_t *)v28, (uint64_t)&v30);
        long long v18 = v30;
        long long v19 = v31;
        uint64_t v20 = v32;
        char v21 = v33;
        uint64_t v37 = v3;
        unint64_t v23 = *(void *)(v3 + 16);
        unint64_t v22 = *(void *)(v3 + 24);
        if (v23 >= v22 >> 1)
        {
          long long v26 = v31;
          long long v27 = v30;
          sub_254EFC954((char *)(v22 > 1), v23 + 1, 1);
          long long v19 = v26;
          long long v18 = v27;
          uint64_t v3 = v37;
        }
        *(void *)(v3 + 16) = v23 + 1;
        uint64_t v24 = v3 + 48 * v23;
        *(_OWORD *)(v24 + 32) = v18;
        *(_OWORD *)(v24 + 48) = v19;
        *(void *)(v24 + 64) = v20;
        *(unsigned char *)(v24 + 72) = v21;
        v12 += 15;
        --v11;
      }
      while (v11);
    }
    swift_bridgeObjectRelease();
    sub_254EDFB74((uint64_t)v34);
    swift_bridgeObjectRelease();
  }
  return v3;
}

char *sub_254EFC954(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_254EFC984(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

ValueMetadata *type metadata accessor for TokenParser()
{
  return &type metadata for TokenParser;
}

char *sub_254EFC984(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E712A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_254EFCB00()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_254EFCB10()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_254EFCB20()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_254EFCB30()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_254EFCB40()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_254EFCB50()
{
  return MEMORY[0x270F9D358]();
}

uint64_t sub_254EFCB60()
{
  return MEMORY[0x270F9D380]();
}

uint64_t sub_254EFCB70()
{
  return MEMORY[0x270F9D3A8]();
}

uint64_t sub_254EFCB80()
{
  return MEMORY[0x270F9D3E0]();
}

uint64_t sub_254EFCB90()
{
  return MEMORY[0x270F9D450]();
}

uint64_t sub_254EFCBA0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_254EFCBB0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_254EFCBC0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_254EFCBD0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_254EFCBE0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_254EFCBF0()
{
  return MEMORY[0x270F9D670]();
}

uint64_t sub_254EFCC00()
{
  return MEMORY[0x270F9D678]();
}

uint64_t sub_254EFCC10()
{
  return MEMORY[0x270F9D680]();
}

uint64_t sub_254EFCC20()
{
  return MEMORY[0x270F9D690]();
}

uint64_t sub_254EFCC30()
{
  return MEMORY[0x270F9D6A0]();
}

uint64_t sub_254EFCC40()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_254EFCC50()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_254EFCC60()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_254EFCC70()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_254EFCC80()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_254EFCC90()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_254EFCCA0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_254EFCCB0()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_254EFCCC0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_254EFCCD0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_254EFCCE0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_254EFCCF0()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_254EFCD00()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_254EFCD10()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_254EFCD20()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_254EFCD30()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_254EFCD40()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_254EFCD50()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_254EFCD60()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_254EFCD70()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_254EFCD80()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_254EFCD90()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_254EFCDA0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_254EFCDB0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_254EFCDC0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_254EFCDD0()
{
  return MEMORY[0x270F9DDE0]();
}

uint64_t sub_254EFCDE0()
{
  return MEMORY[0x270F9E0F0]();
}

uint64_t sub_254EFCDF0()
{
  return MEMORY[0x270F9E190]();
}

uint64_t sub_254EFCE00()
{
  return MEMORY[0x270F9E1A8]();
}

uint64_t sub_254EFCE10()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_254EFCE20()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_254EFCE30()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_254EFCE40()
{
  return MEMORY[0x270F9E4B8]();
}

uint64_t sub_254EFCE50()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_254EFCE60()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_254EFCE70()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_254EFCE80()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_254EFCE90()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_254EFCEA0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_254EFCEB0()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_254EFCEC0()
{
  return MEMORY[0x270F9E5A0]();
}

uint64_t sub_254EFCED0()
{
  return MEMORY[0x270F9E5A8]();
}

uint64_t sub_254EFCEE0()
{
  return MEMORY[0x270F9E5B0]();
}

uint64_t sub_254EFCEF0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_254EFCF10()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_254EFCF20()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_254EFCF30()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_254EFCF40()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_254EFCF50()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_254EFCF60()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_254EFCF70()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_254EFCF80()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_254EFCF90()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_254EFCFA0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_254EFCFB0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_254EFCFC0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_254EFCFD0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_254EFCFE0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_254EFCFF0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_254EFD000()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_254EFD010()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_254EFD020()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_254EFD030()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_254EFD040()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_254EFD050()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_254EFD060()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_254EFD070()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_254EFD080()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_254EFD090()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_254EFD0A0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_254EFD0B0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_254EFD0C0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_254EFD0D0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_254EFD0E0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_254EFD0F0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_254EFD100()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_254EFD110()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_254EFD120()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_254EFD130()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_254EFD140()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_254EFD150()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_254EFD160()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_254EFD170()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_254EFD180()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_254EFD190()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_254EFD1A0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_254EFD1B0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_254EFD1C0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_254EFD1D0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_254EFD1E0()
{
  return MEMORY[0x270F9FDE8]();
}

uint64_t sub_254EFD1F0()
{
  return MEMORY[0x270F9FDF0]();
}

uint64_t sub_254EFD200()
{
  return MEMORY[0x270F9FE58]();
}

uint64_t sub_254EFD210()
{
  return MEMORY[0x270F9FE88]();
}

uint64_t sub_254EFD220()
{
  return MEMORY[0x270F9FEA0]();
}

uint64_t sub_254EFD230()
{
  return MEMORY[0x270F9FF30]();
}

uint64_t sub_254EFD240()
{
  return MEMORY[0x270F9FF38]();
}

uint64_t sub_254EFD250()
{
  return MEMORY[0x270F9FF48]();
}

uint64_t sub_254EFD280()
{
  return MEMORY[0x270FA0128]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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