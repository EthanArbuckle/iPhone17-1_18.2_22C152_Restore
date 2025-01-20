uint64_t sub_244DE67F0(uint64_t a1)
{
  sub_244DE6818(a1);
  return a1;
}

double sub_244DE6818(uint64_t a1)
{
  v2 = *(void (*****)(void))(a1 + 8);
  if (v2)
  {
    sub_244DE686C(*(void *)(a1 + 8));
    sub_244DE6D7C(v2 + 21, 0);
    j__free(v2);
    *(void *)(a1 + 8) = 0;
  }
  *(void *)(a1 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  return result;
}

uint64_t sub_244DE686C(uint64_t result)
{
  if (atomic_load((unsigned int *)(result + 184))) {
    sub_244E2BC98();
  }
  uint64_t v2 = result;
  if (!*(unsigned char *)(result + 188))
  {
    *(unsigned char *)(result + 188) = 1;
    v3 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_INFO, "Shutting down the System State, this will teardown the CHIP Stack", v30, 2u);
    }
    if (sub_244CC4E58(3u)) {
      sub_244CC4DE0(9u, 3);
    }
    if (*(void *)(v2 + 176) && *(unsigned char *)(v2 + 189))
    {
      v4 = sub_2446D634C();
      sub_244E1C838((uint64_t)v4);
    }
    v5 = *(void (****)(void))(v2 + 152);
    if (v5)
    {
      uint64_t v6 = *(void *)(v2 + 72);
      if (!v6 || (sub_244DA1B70(v6, *(void *)(v2 + 152)), (v5 = *(void (****)(void))(v2 + 152)) != 0))
      {
        (**v5)(v5);
        j__free(v5);
      }
      *(void *)(v2 + 152) = 0;
    }
    uint64_t v7 = *(void *)(v2 + 80);
    if (v7)
    {
      sub_244DDC948(v7);
      v8 = *(void (****)(void))(v2 + 80);
      if (v8)
      {
        (**v8)(*(void *)(v2 + 80));
        j__free(v8);
      }
      *(void *)(v2 + 80) = 0;
    }
    uint64_t v9 = *(void *)(v2 + 88);
    if (v9)
    {
      sub_244CD1A90(v9);
      v10 = *(void **)(v2 + 88);
      if (v10)
      {
        (*(void (**)(void))(*(void *)v10 + 40))(*(void *)(v2 + 88));
        j__free(v10);
      }
      *(void *)(v2 + 88) = 0;
    }
    if (*(void *)(v2 + 96))
    {
      sub_244DBAA44();
      v11 = *(void (****)(void))(v2 + 96);
      if (v11)
      {
        (**v11)(*(void *)(v2 + 96));
        j__free(v11);
      }
      *(void *)(v2 + 96) = 0;
    }
    uint64_t v12 = *(void *)(v2 + 40);
    if (v12) {
      sub_244D88980(v12);
    }
    v13 = *(void **)(v2 + 104);
    if (v13)
    {
      (*(void (**)(void))(*(void *)v13 + 40))(*(void *)(v2 + 104));
      j__free(v13);
      *(void *)(v2 + 104) = 0;
    }
    v14 = *(void **)(v2 + 112);
    if (v14)
    {
      (*(void (**)(void))(*(void *)v14 + 16))(*(void *)(v2 + 112));
      j__free(v14);
      *(void *)(v2 + 112) = 0;
    }
    v15 = sub_244DB12A8();
    (*(void (**)(uint64_t *))(*v15 + 32))(v15);
    v16 = (int *)sub_244DBE094();
    sub_244DBE1B8(v16);
    uint64_t v17 = *(void *)(v2 + 32);
    if (v17)
    {
      sub_244D8EEA4(*(void *)(v2 + 32));
      sub_244DE892C((void *)(v17 + 24));
      v18 = *(void (****)(void))(v2 + 32);
      if (v18)
      {
        (**v18)(*(void *)(v2 + 32));
        j__free(v18);
      }
      *(void *)(v2 + 32) = 0;
    }
    uint64_t v19 = *(void *)(v2 + 56);
    if (v19) {
      sub_244D66004(v19);
    }
    uint64_t v20 = *(void *)(v2 + 40);
    if (v20) {
      sub_244D88778(v20);
    }
    *(_OWORD *)uint64_t v2 = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    v21 = *(void (****)(void))(v2 + 64);
    if (v21)
    {
      (**v21)(*(void *)(v2 + 64));
      j__free(v21);
      *(void *)(v2 + 64) = 0;
    }
    v22 = *(void (****)(void))(v2 + 56);
    if (v22)
    {
      (**v22)(*(void *)(v2 + 56));
      j__free(v22);
      *(void *)(v2 + 56) = 0;
    }
    v23 = *(void (****)(void))(v2 + 48);
    if (v23)
    {
      (**v23)(*(void *)(v2 + 48));
      j__free(v23);
      *(void *)(v2 + 48) = 0;
    }
    v24 = *(void (****)(void))(v2 + 40);
    if (v24)
    {
      (**v24)(*(void *)(v2 + 40));
      j__free(v24);
      *(void *)(v2 + 40) = 0;
    }
    v25 = *(void (****)(void))(v2 + 136);
    if (v25)
    {
      (**v25)(*(void *)(v2 + 136));
      j__free(v25);
      *(void *)(v2 + 136) = 0;
    }
    v26 = *(void (****)(void))(v2 + 128);
    if (v26)
    {
      (**v26)(*(void *)(v2 + 128));
      j__free(v26);
      *(void *)(v2 + 128) = 0;
    }
    uint64_t v27 = *(void *)(v2 + 176);
    if (v27)
    {
      sub_244DA1A2C(v27);
      v28 = *(void **)(v2 + 176);
      if (v28)
      {
        sub_2446D80B8((uint64_t)v28 + 2432);
        for (uint64_t i = 2280; i != -152; i -= 152)
          sub_2446D80B8((uint64_t)v28 + i);
        j__free(v28);
      }
      *(void *)(v2 + 176) = 0;
      *(void *)(v2 + 72) = 0;
    }
    if (qword_26B0D43B0 != -1) {
      dispatch_once_f(&qword_26B0D43B0, &byte_26B0D4370, (dispatch_function_t)sub_2446D7DB8);
    }
    double result = sub_244D77024();
    byte_26B0D4370 = 0;
  }
  return result;
}

void sub_244DE6D7C(void (****a1)(void), void (***a2)(void))
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    (**v2)(v2);
    j__free(v2);
  }
}

void *sub_244DE6DEC(void *a1)
{
  *a1 = &unk_26F959470;
  a1[3] = &unk_26F9594C8;
  sub_244DE7B7C(a1 + 22);
  a1[13] = &unk_26F959540;
  a1[15] = &unk_26F9595D0;
  uint64_t v2 = (_WORD *)a1[21];
  if (v2) {
    sub_244CC8A0C(v2);
  }
  a1[21] = 0;
  sub_244DB97A8(a1 + 13);
  sub_244DB6B44(a1 + 9);
  sub_244DB6B44(a1 + 5);
  return a1;
}

void sub_244DE6EC8(void *a1)
{
  *a1 = &unk_26F959470;
  a1[3] = &unk_26F9594C8;
  sub_244DE7B7C(a1 + 22);
  a1[13] = &unk_26F959540;
  a1[15] = &unk_26F9595D0;
  uint64_t v2 = (_WORD *)a1[21];
  if (v2) {
    sub_244CC8A0C(v2);
  }
  a1[21] = 0;
  sub_244DB97A8(a1 + 13);
  sub_244DB6B44(a1 + 9);
  sub_244DB6B44(a1 + 5);

  JUMPOUT(0x245695FA0);
}

void *sub_244DE6FC4(void *a1)
{
  *a1 = &unk_26F9594C8;
  sub_244DE7B7C(a1 + 19);
  a1[10] = &unk_26F959540;
  a1[12] = &unk_26F9595D0;
  uint64_t v2 = (_WORD *)a1[18];
  if (v2) {
    sub_244CC8A0C(v2);
  }
  a1[18] = 0;
  sub_244DB97A8(a1 + 10);
  sub_244DB6B44(a1 + 6);
  sub_244DB6B44(a1 + 2);
  return a1;
}

void sub_244DE707C(void *a1)
{
  *a1 = &unk_26F9594C8;
  sub_244DE7B7C(a1 + 19);
  a1[10] = &unk_26F959540;
  a1[12] = &unk_26F9595D0;
  uint64_t v2 = (_WORD *)a1[18];
  if (v2) {
    sub_244CC8A0C(v2);
  }
  a1[18] = 0;
  sub_244DB97A8(a1 + 10);
  sub_244DB6B44(a1 + 6);
  sub_244DB6B44(a1 + 2);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244DE7158(void *a1, uint64_t a2)
{
  if ((*(uint64_t (**)(void))(a1[2] + 24))()) {
    return 1;
  }

  return sub_244DE7FEC(a1, a2);
}

uint64_t sub_244DE71D0(void *a1, uint64_t a2)
{
  (*(void (**)(void))(a1[2] + 48))();

  return sub_244DE8454(a1, a2);
}

uint64_t sub_244DE7230(void *a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(a1[2] + 56))();

  return sub_244DE8500(a1, a2, a3);
}

uint64_t sub_244DE72A8(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)a1 = &unk_26F957EE0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 32) = &unk_26F957EE0;
  *(void *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 96) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = a1 + 128;
  *(void *)(a1 + 120) = 1;
  *(void *)(a1 + 64) = &unk_26F959540;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = &unk_26F9595D0;
  *(void *)(a1 + 88) = 0;
  sub_244DE759C(a1 + 136);
  return a1;
}

void *sub_244DE7374(void *a1)
{
  *a1 = &unk_26F959540;
  a1[2] = &unk_26F9595D0;
  uint64_t v2 = (_WORD *)a1[8];
  if (v2) {
    sub_244CC8A0C(v2);
  }
  a1[8] = 0;

  return sub_244DB97A8(a1);
}

void sub_244DE73F4(void *a1)
{
  *a1 = &unk_26F959540;
  a1[2] = &unk_26F9595D0;
  uint64_t v2 = (_WORD *)a1[8];
  if (v2) {
    sub_244CC8A0C(v2);
  }
  a1[8] = 0;
  sub_244DB97A8(a1);

  JUMPOUT(0x245695FA0);
}

void *sub_244DE7488(void *a1)
{
  uint64_t v2 = a1 - 2;
  *(a1 - 2) = &unk_26F959540;
  *a1 = &unk_26F9595D0;
  v3 = (_WORD *)a1[6];
  if (v3) {
    sub_244CC8A0C(v3);
  }
  a1[6] = 0;

  return sub_244DB97A8(v2);
}

void sub_244DE7508(void *a1)
{
  uint64_t v2 = a1 - 2;
  *(a1 - 2) = &unk_26F959540;
  *a1 = &unk_26F9595D0;
  v3 = (_WORD *)a1[6];
  if (v3) {
    sub_244CC8A0C(v3);
  }
  a1[6] = 0;
  sub_244DB97A8(v2);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244DE759C(uint64_t a1)
{
  uint64_t v2 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 0;
  *(void *)(a1 + 28) = 0x271000000000;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = a1 + 72;
  *(void *)(a1 + 56) = 4;
  *(void *)(a1 + 64) = a1 + 360;
  *(void *)a1 = &unk_26F959638;
  do
  {
    uint64_t v3 = a1 + v2;
    *(_OWORD *)(v3 + 80) = xmmword_268EC34EC;
    *(unsigned char *)(v3 + 96) = 0;
    *(_WORD *)(v3 + 98) = 5540;
    *(void *)(v3 + 128) = 0;
    *(void *)(v3 + 108) = 0;
    *(void *)(v3 + 100) = 0;
    *(_DWORD *)(v3 + 116) = 0;
    *(_DWORD *)(v3 + 136) = 327705;
    v2 += 72;
  }
  while (v2 != 288);
  *(void *)(a1 + 360) = &unk_26F9596B0;
  sub_244CC60AC((void *)(a1 + 368), a1 + 424, a1 + 416, 4, 40);
  for (uint64_t i = 0; i != 288; i += 72)
  {
    uint64_t v5 = a1 + i;
    long long v6 = xmmword_268EC34EC;
    *(void *)(v5 + 72) = 0;
    *(_OWORD *)(v5 + 80) = v6;
    *(unsigned char *)(v5 + 96) = 0;
    *(_WORD *)(v5 + 98) = 5540;
    *(_DWORD *)(v5 + 100) = 0;
    *(void *)(v5 + 104) = 0;
    uint64_t v7 = *(_WORD **)(a1 + i + 112);
    if (v7) {
      sub_244CC8A0C(v7);
    }
    *(void *)(v5 + 112) = 0;
    *(void *)(v5 + 128) = 0;
  }
  return a1;
}

void sub_244DE7718(void *a1)
{
  sub_244DE7B7C(a1);

  JUMPOUT(0x245695FA0);
}

void *sub_244DE7750(void *a1)
{
  *a1 = &unk_26F9596B0;
  sub_244DE79F8(a1 + 1);
  return a1;
}

void sub_244DE7794(void *a1)
{
  *a1 = &unk_26F9596B0;
  sub_244DE79F8(a1 + 1);

  JUMPOUT(0x245695FA0);
}

__n128 sub_244DE77F8(uint64_t a1, __n128 *a2, unint64_t *a3)
{
  uint64_t v5 = (unint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  long long v6 = (__n128 *)sub_244CC6124(v5);
  if (v6)
  {
    __n128 result = *a2;
    v6[1].n128_u32[0] = a2[1].n128_u32[0];
    *long long v6 = result;
    v6[1].n128_u32[1] = a2[1].n128_u32[1];
    v6[1].n128_u64[1] = a2[1].n128_u64[1];
    v6[2].n128_u64[0] = *a3;
    *a3 = 0;
  }
  return result;
}

unint64_t sub_244DE7874(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);

  return sub_244DE7AEC(v3, a2);
}

uint64_t sub_244DE78CC(uint64_t a1)
{
  v1 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);

  return sub_244CC627C(v1, (uint64_t)v1, (uint64_t (*)(uint64_t, uint64_t))sub_244DE7B40);
}

uint64_t sub_244DE7928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  unint64_t v3 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  v7[0] = &v5;
  v7[1] = &v6;
  return sub_244CC627C(v3, (uint64_t)v7, (uint64_t (*)(uint64_t, uint64_t))sub_244DE7B5C);
}

uint64_t sub_244DE7990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  unint64_t v3 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  v7[0] = &v5;
  v7[1] = &v6;
  return sub_244CC627C(v3, (uint64_t)v7, (uint64_t (*)(uint64_t, uint64_t))sub_244DE7B6C);
}

uint64_t *sub_244DE79F8(uint64_t *result)
{
  if (*result) {
    sub_244E2BD38(result);
  }
  return result;
}

uint64_t sub_244DE7A18(uint64_t *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *a1;
    *(_DWORD *)buf = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_ERROR, "BitMapObjectPool: %lu allocated", buf, 0xCu);
  }
  uint64_t result = sub_244CC4E58(1u);
  if (result) {
    return sub_244CC4DE0(0x1Bu, 1);
  }
  return result;
}

unint64_t sub_244DE7AEC(unint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)result;
    v4 = *(_WORD **)(a2 + 32);
    if (v4) {
      sub_244CC8A0C(v4);
    }
    *(void *)(a2 + 32) = 0;
    return sub_244CC61CC(v3, a2);
  }
  return result;
}

uint64_t sub_244DE7B40(unint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t sub_244DE7B5C(uint64_t a1)
{
  return (**(uint64_t (***)(void))a1)(**(void **)(a1 + 8));
}

uint64_t sub_244DE7B6C(uint64_t a1)
{
  return (**(uint64_t (***)(void))a1)(**(void **)(a1 + 8));
}

void *sub_244DE7B7C(void *a1)
{
  *a1 = &unk_26F959638;
  uint64_t v2 = (void *)(*(uint64_t (**)(void *))(a1[45] + 56))(a1 + 45);
  sub_244CC627C(v2, (uint64_t)v2, (uint64_t (*)(uint64_t, uint64_t))sub_244DE7B40);
  a1[45] = &unk_26F9596B0;
  sub_244DE79F8(a1 + 46);
  for (uint64_t i = 41; i != 5; i -= 9)
  {
    v4 = (_WORD *)a1[i];
    if (v4) {
      sub_244CC8A0C(v4);
    }
    a1[i] = 0;
  }

  return sub_244DB76E0(a1);
}

void sub_244DE7C54(uint64_t a1@<X0>, uint64_t a2@<X1>, _WORD **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = a1 + 16;
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 16) + 24))(a1 + 16))
  {
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, _WORD **))(*(void *)v8 + 16);
    v9(v8, a2, a3);
  }
  else
  {
    sub_244DE7D34(a1, a2, a3, a4);
  }
}

void sub_244DE7D34(uint64_t a1@<X0>, uint64_t a2@<X1>, _WORD **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = a1 + 48;
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 48) + 24))(a1 + 48))
  {
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, _WORD **))(*(void *)v8 + 16);
    v9(v8, a2, a3);
  }
  else
  {
    sub_244DE7E14(a1, a2, a3, a4);
  }
}

void sub_244DE7E14(uint64_t a1@<X0>, uint64_t a2@<X1>, _WORD **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = a1 + 80;
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 80) + 24))(a1 + 80))
  {
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, _WORD **))(*(void *)v8 + 16);
    v9(v8, a2, a3);
  }
  else
  {
    sub_244DE7EF4(a1, a2, a3, a4);
  }
}

void sub_244DE7EF4(uint64_t a1@<X0>, uint64_t a2@<X1>, _WORD **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 152;
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 152) + 24))(a1 + 152))
  {
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, _WORD **))(*(void *)v7 + 16);
    v8(v7, a2, a3);
  }
  else
  {
    uint64_t v9 = *a3;
    *a3 = 0;
    *(_DWORD *)a4 = 12;
    *(void *)(a4 + 8) = "src/transport/raw/Tuple.h";
    *(_DWORD *)(a4 + 16) = 273;
    if (v9)
    {
      sub_244CC8A0C(v9);
    }
  }
}

uint64_t sub_244DE7FEC(void *a1, uint64_t a2)
{
  if (((*(uint64_t (**)(void))(a1[6] + 24))() & 1) != 0
    || ((*(uint64_t (**)(void *, uint64_t))(a1[10] + 24))(a1 + 10, a2) & 1) != 0)
  {
    return 1;
  }
  uint64_t v5 = *(uint64_t (**)(void *, uint64_t))(a1[19] + 24);

  return v5(a1 + 19, a2);
}

uint64_t sub_244DE80B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = a1 + 16;
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 16) + 24))(a1 + 16))
  {
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 40);
    return v11(v10, a2, a3, a4);
  }
  else
  {
    return sub_244DE819C(a1, a2, a3, a4, a5);
  }
}

uint64_t sub_244DE819C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = a1 + 48;
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 48) + 24))(a1 + 48))
  {
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 40);
    return v11(v10, a2, a3, a4);
  }
  else
  {
    return sub_244DE8288(a1, a2, a3, a4, a5);
  }
}

uint64_t sub_244DE8288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = a1 + 80;
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 80) + 24))(a1 + 80))
  {
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 40);
    return v11(v10, a2, a3, a4);
  }
  else
  {
    return sub_244DE8374(a1, a2, a3, a4, a5);
  }
}

uint64_t sub_244DE8374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 152;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 152) + 24))(a1 + 152);
  if (result)
  {
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v9 + 40);
    return v11(v9, a2, a3, a4);
  }
  else
  {
    *(_DWORD *)a5 = 12;
    *(void *)(a5 + 8) = "src/transport/raw/Tuple.h";
    *(_DWORD *)(a5 + 16) = 181;
  }
  return result;
}

uint64_t sub_244DE8454(void *a1, uint64_t a2)
{
  (*(void (**)(void))(a1[6] + 48))();
  (*(void (**)(void *, uint64_t))(a1[10] + 48))(a1 + 10, a2);
  v4 = *(uint64_t (**)(void *, uint64_t))(a1[19] + 48);

  return v4(a1 + 19, a2);
}

uint64_t sub_244DE8500(void *a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(a1[6] + 56))();
  (*(void (**)(void *, uint64_t, uint64_t))(a1[10] + 56))(a1 + 10, a2, a3);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(a1[19] + 56);

  return v6(a1 + 19, a2, a3);
}

uint64_t sub_244DE85C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = a1 + 16;
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 16) + 32))(a1 + 16))
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v8 + 64);
    return v9(v8, a2, a3);
  }
  else
  {
    return sub_244DE86A0(a1, a2, a3, a4);
  }
}

uint64_t sub_244DE86A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = a1 + 48;
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 48) + 32))(a1 + 48))
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v8 + 64);
    return v9(v8, a2, a3);
  }
  else
  {
    return sub_244DE8780(a1, a2, a3, a4);
  }
}

uint64_t sub_244DE8780@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = a1 + 80;
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 80) + 32))(a1 + 80))
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v8 + 64);
    return v9(v8, a2, a3);
  }
  else
  {
    return sub_244DE8860(a1, a2, a3, a4);
  }
}

uint64_t sub_244DE8860@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 152;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 152) + 32))(a1 + 152);
  if (result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 64);
    return v9(v7, a2, a3);
  }
  else
  {
    *(_DWORD *)a4 = 12;
    *(void *)(a4 + 8) = "src/transport/raw/Tuple.h";
    *(_DWORD *)(a4 + 16) = 303;
  }
  return result;
}

uint64_t sub_244DE892C(void *a1)
{
  (*(void (**)(void))(a1[2] + 72))();
  (*(void (**)(void))(a1[6] + 72))();
  (*(void (**)(void))(a1[10] + 72))();
  uint64_t v2 = *(uint64_t (**)(void *))(a1[19] + 72);

  return v2(a1 + 19);
}

uint64_t sub_244DE89F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  long long v14 = 0uLL;
  uint64_t v15 = 0;
  uint64_t result = sub_244DB6BEC(a1 + 16, a3, (uint64_t)&v14);
  if (v14)
  {
    *(_OWORD *)a7 = v14;
    *(void *)(a7 + 16) = v15;
  }
  else
  {
    *(void *)(a1 + 24) = a2;
    return sub_244DE8A94(a1, a2, a4, a5, a6, a7);
  }
  return result;
}

uint64_t sub_244DE8A94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  uint64_t result = sub_244DB6BEC(a1 + 48, a3, (uint64_t)&v12);
  if (v12)
  {
    *(_OWORD *)a6 = v12;
    *(void *)(a6 + 16) = v13;
  }
  else
  {
    *(void *)(a1 + 56) = a2;
    return sub_244DE8B2C(a1, a2, a4, a5, a6);
  }
  return result;
}

uint64_t sub_244DE8B2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  uint64_t result = sub_244DB9A14(a1 + 80, a3, (uint64_t)&v11);
  if (v11)
  {
    *(_OWORD *)a5 = v11;
    uint64_t v10 = v12;
  }
  else
  {
    *(void *)(a1 + 88) = a2;
    long long v13 = 0uLL;
    uint64_t v14 = 0;
    uint64_t result = sub_244DB79EC(a1 + 152, a4, (uint64_t)&v13);
    if (!v13)
    {
      *(void *)(a1 + 160) = a2;
      *(_DWORD *)a5 = 0;
      *(void *)(a5 + 8) = "src/transport/raw/Tuple.h";
      *(_DWORD *)(a5 + 16) = 339;
      return result;
    }
    *(_OWORD *)a5 = v13;
    uint64_t v10 = v14;
  }
  *(void *)(a5 + 16) = v10;
  return result;
}

void sub_244DE8BEC(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 45;
  *(void *)(a1 + 8) = "src/messaging/ExchangeDelegate.h";
  *(_DWORD *)(a1 + 16) = 172;
}

void sub_244DE8C0C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2446D80B8((uint64_t)a2 + 2432);
    for (uint64_t i = 2280; i != -152; i -= 152)
      sub_2446D80B8((uint64_t)a2 + i);
    j__free(a2);
  }
}

void sub_244DE8C68()
{
}

uint64_t sub_244DE8C7C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5) {
    (*(void (**)(void *__return_ptr))(*(void *)v5 + 208))(v7);
  }
  return sub_244DE8CF0(a1, a3);
}

uint64_t sub_244DE8CE8(uint64_t a1, uint64_t a2, int a3)
{
  return sub_244DE8CF0(a1, a3);
}

uint64_t sub_244DE8CF0(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    long long v6 = 0uLL;
    uint64_t v7 = 0;
    uint64_t result = (uint64_t)(*(void *(**)(long long *__return_ptr))(*(void *)result + 40))(&v6);
    if (v6)
    {
      v4 = sub_244CC8484(9u, "Controller");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_OWORD *)buf = v6;
        *(void *)&buf[16] = v7;
        uint64_t v5 = sub_244CB7B34((const char **)buf, 1);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = a2;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v5;
        _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_ERROR, "Warning, failed to delete session resumption state for fabric index 0x%x: %s", buf, 0x12u);
      }
      uint64_t result = sub_244CC4E58(1u);
      if (result)
      {
        *(_OWORD *)buf = v6;
        *(void *)&buf[16] = v7;
        sub_244CB7B34((const char **)buf, 1);
        return sub_244CC4DE0(9u, 1);
      }
    }
  }
  return result;
}

uint64_t sub_244DE8E44(uint64_t a1)
{
  *(void *)a1 = &unk_26F953870;
  *(void *)(a1 + 8) = &unk_26F9538D8;
  *(void *)(a1 + 16) = &unk_26F953910;
  *(void *)(a1 + 24) = 0;
  uint64_t v2 = a1 + 64;
  *(_OWORD *)(a1 + 32) = 0u;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 64) = &unk_26F959788;
  *(void *)(a1 + 72) = &unk_26F959748;
  *(void *)(a1 + 80) = &unk_26F959818;
  *(void *)(a1 + 88) = 0;
  sub_244DE9034(a1 + 96);
  *(void *)(a1 + 64) = &unk_26F9539B8;
  *(void *)(a1 + 72) = &unk_26F953A58;
  *(void *)(a1 + 80) = &unk_26F953A98;
  *(void *)(a1 + 96) = &unk_26F953AD8;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(v2 + 200) = 0u;
  *(void *)(a1 + 280) = 0;
  nullsub_13(a1 + 288, v3);
  *(void *)(a1 + 408) = &unk_26F954540;
  *(void *)(a1 + 488) = 0;
  *(_OWORD *)(a1 + 528) = xmmword_244EC4090;
  *(_WORD *)(a1 + 560) = 0;
  *(unsigned char *)(a1 + 562) = 0;
  *(_OWORD *)(a1 + 568) = 0u;
  *(void *)(a1 + 632) = 0;
  *(_OWORD *)(a1 + 640) = 0u;
  *(unsigned char *)(a1 + 656) = 0;
  *(void *)(a1 + 664) = 0;
  *(_OWORD *)(a1 + 672) = 0u;
  *(_DWORD *)(a1 + 688) = 0;
  *(_OWORD *)(a1 + 760) = 0u;
  *(_OWORD *)(a1 + 776) = 0u;
  *(void *)(a1 + 816) = 0;
  *(_OWORD *)(a1 + 800) = 0u;
  return a1;
}

uint64_t sub_244DE9034(uint64_t a1)
{
  *(void *)a1 = &unk_26F953EA0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 16) = &unk_26F959858;
  *(void *)(a1 + 56) = a1;
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  *(void *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 96) = 0;
  *(void *)(a1 + 112) = sub_244D6A0B8();
  *(_DWORD *)(a1 + 120) = v2;
  *(unsigned char *)(a1 + 124) = 0;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 132) = 0;
  *(_WORD *)(a1 + 140) = 1;
  *(unsigned char *)(a1 + 144) = 0;
  return a1;
}

void *sub_244DE90D0(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v9[0] = a4;
  v9[1] = a5;
  uint64_t v7 = a6;
  uint64_t v8 = a3;
  return sub_244DE92D4((unint64_t *)(a1 + 8), a2, &v8, v9, &v7);
}

void sub_244DE9108(uint64_t a1, void *a2)
{
}

uint64_t sub_244DE9110(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  v7[0] = a2;
  v7[1] = a3;
  char v6 = a4;
  uint64_t v5 = 0;
  v8[0] = v7;
  v8[1] = &v6;
  v8[2] = &v5;
  sub_244CC6478((void *)(a1 + 24), (uint64_t)v8, (unsigned int (*)(uint64_t))sub_244DE96A8);
  return v5;
}

uint64_t sub_244DE916C(uint64_t a1, char a2)
{
  char v3 = a2;
  v4[0] = &v3;
  v4[1] = a1;
  return sub_244CC6478((void *)(a1 + 24), (uint64_t)v4, (unsigned int (*)(uint64_t))sub_244DE96F8);
}

uint64_t sub_244DE91B0(uint64_t a1)
{
  uint64_t v2 = a1;
  return sub_244CC6478((void *)(a1 + 24), (uint64_t)&v2, (unsigned int (*)(uint64_t))sub_244DE974C);
}

void *sub_244DE91EC(void *a1)
{
  *a1 = &unk_26F959890;
  sub_244CC6478(a1 + 3, (uint64_t)(a1 + 1), (unsigned int (*)(uint64_t))sub_244DE978C);
  sub_244D8D5D4(a1 + 1);
  return a1;
}

void sub_244DE9250(void *a1)
{
  *a1 = &unk_26F959890;
  sub_244CC6478(a1 + 3, (uint64_t)(a1 + 1), (unsigned int (*)(uint64_t))sub_244DE978C);
  sub_244D8D5D4(a1 + 1);

  JUMPOUT(0x245695FA0);
}

void *sub_244DE92D4(unint64_t *a1, long long *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10 = sub_244CC4D84(0x238uLL);
  long long v11 = v10;
  if (v10)
  {
    sub_244DE938C((uint64_t)v10, a2, *a3, *a4, a4[1], *a5);
    uint64_t v12 = sub_244CC4D84(0x18uLL);
    if (v12)
    {
      *uint64_t v12 = v11;
      v12[1] = a1 + 2;
      v12[2] = 0;
      v12[2] = a1[4];
      *(void *)(a1[4] + 8) = v12;
      a1[4] = (unint64_t)v12;
      unint64_t v13 = a1[1];
      unint64_t v14 = *a1 + 1;
      *a1 = v14;
      if (v14 > v13) {
        a1[1] = v14;
      }
    }
    else
    {
      return 0;
    }
  }
  return v11;
}

uint64_t sub_244DE938C(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v10 = 0;
  uint64_t v11 = a1 + 8;
  *(void *)a1 = &unk_26F958628;
  *(_OWORD *)(a1 + 16) = 0u;
  uint64_t v12 = (_OWORD *)(a1 + 16);
  *(void *)(a1 + 8) = &unk_26F958680;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(unsigned char *)(a1 + 64) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 80) = 0;
  *(unsigned char *)(a1 + 104) = 0;
  *(_OWORD *)(a1 + 112) = xmmword_268EC34EC;
  *(unsigned char *)(a1 + 128) = 1;
  *(_WORD *)(a1 + 130) = 5540;
  *(_DWORD *)(a1 + 132) = 0;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = &unk_26F956F80;
  *(unsigned char *)(a1 + 168) = 0;
  *(void *)(a1 + 184) = a1 + 184;
  *(void *)(a1 + 192) = a1 + 184;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 232) = 0;
  *(void *)(a1 + 240) = 0;
  *(void *)(a1 + 216) = &unk_26F959900;
  *(void *)(a1 + 224) = 0;
  do
  {
    uint64_t v13 = a1 + v10;
    *(void *)(v13 + 248) = 0;
    *(void *)(v13 + 256) = 0;
    *(unsigned char *)(v13 + 264) = 1;
    *(_WORD *)(v13 + 266) = 5540;
    *(_DWORD *)(v13 + 268) = 0;
    *(void *)(v13 + 272) = 0;
    *(void *)(v13 + 280) = sub_244D6A0B8();
    *(_DWORD *)(v13 + 288) = v14;
    *(_WORD *)(v13 + 292) = 0;
    *(unsigned char *)(v13 + 294) = 0;
    v10 += 48;
  }
  while (v10 != 240);
  *(_WORD *)(a1 + 488) = 0;
  *(void *)(a1 + 496) = 0;
  *(void *)(a1 + 504) = 0;
  *(void *)(a1 + 512) = 0xAFC8000000C8;
  *(void *)(a1 + 528) = 0;
  *(unsigned char *)(a1 + 536) = 0;
  *(void *)(a1 + 552) = a1 + 544;
  *(void *)(a1 + 544) = a1 + 544;
  *(void *)(a1 + 560) = 0;
  long long v15 = *a2;
  long long v16 = a2[2];
  v12[1] = a2[1];
  v12[2] = v16;
  *uint64_t v12 = v15;
  int v17 = *((unsigned __int8 *)a2 + 48);
  *(unsigned char *)(a1 + 64) = v17;
  if (v17)
  {
    uint64_t v18 = *(void *)((char *)a2 + 52);
    *(_DWORD *)(a1 + 76) = *((_DWORD *)a2 + 15);
    *(void *)(a1 + 68) = v18;
  }
  char v19 = 0;
  v20.i64[0] = *((void *)a2 + 3);
  v20.i64[1] = *(void *)a2;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqzq_s64(v20), (int32x4_t)vceqzq_s64(*((int64x2_t *)a2 + 2))))) & 1) == 0
    && a3
    && a6)
  {
    *(void *)(a1 + 80) = a3;
    *(void *)(a1 + 96) = a4;
    *(unsigned char *)(a1 + 104) = a5;
    *(void *)(a1 + 208) = a6;
    char v19 = 1;
    *(void *)(a1 + 240) = v11;
  }
  *(unsigned char *)(a1 + 528) = v19;
  return a1;
}

void sub_244DE95AC(uint64_t a1)
{
  sub_24479DFF4((void *)(a1 + 8));

  JUMPOUT(0x245695FA0);
}

void sub_244DE95F8(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4 = sub_244CC6450((void *)(a1 + 16), (uint64_t)a2);
    if (!v4) {
      sub_244E2867C();
    }
    uint64_t v5 = v4;
    void *v4 = 0;
    (*(void (**)(void *))(*(void *)a2 + 40))(a2);
    j__free(a2);
    if (*(void *)(a1 + 40))
    {
      *(unsigned char *)(a1 + 48) = 1;
    }
    else
    {
      *(void *)(v5[1] + 16) = v5[2];
      *(void *)(v5[2] + 8) = v5[1];
      j__free(v5);
    }
    --*(void *)a1;
  }
}

uint64_t sub_244DE96A8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 96) != **(void **)a1
    || *(unsigned __int8 *)(*(void *)a1 + 8) != *(unsigned __int8 *)(a2 + 104)
    || **(unsigned __int8 **)(a1 + 8) != *(unsigned __int8 *)(a2 + 529))
  {
    return 0;
  }
  **(void **)(a1 + 16) = a2;
  return 1;
}

uint64_t sub_244DE96F8(unsigned __int8 **a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 104) == **a1) {
    (*(void (**)(unsigned __int8 *))(*(void *)a1[1] + 8))(a1[1]);
  }
  return 0;
}

uint64_t sub_244DE974C(void *a1)
{
  return 0;
}

uint64_t sub_244DE978C(uint64_t a1, void *a2)
{
  return 0;
}

char *sub_244DE97A8(uint64_t a1)
{
  return sub_244DE98A0((unint64_t *)(a1 + 8));
}

void sub_244DE97B0(uint64_t a1, uint64_t a2)
{
}

void *sub_244DE97B8(void *a1)
{
  *a1 = &unk_26F959960;
  sub_244CC6478(a1 + 3, (uint64_t)(a1 + 1), (unsigned int (*)(uint64_t))sub_244DE9B20);
  sub_244D8D5D4(a1 + 1);
  return a1;
}

void sub_244DE981C(void *a1)
{
  *a1 = &unk_26F959960;
  sub_244CC6478(a1 + 3, (uint64_t)(a1 + 1), (unsigned int (*)(uint64_t))sub_244DE9B20);
  sub_244D8D5D4(a1 + 1);

  JUMPOUT(0x245695FA0);
}

char *sub_244DE98A0(unint64_t *a1)
{
  uint64_t v2 = (char *)sub_244CC4D84(0x2E0uLL);
  char v3 = v2;
  if (v2)
  {
    bzero(v2 + 32, 0x2C0uLL);
    *(void *)char v3 = &unk_26F959788;
    *((void *)v3 + 1) = &unk_26F959748;
    *((void *)v3 + 2) = &unk_26F959818;
    *((void *)v3 + 3) = 0;
    sub_244DE9034((uint64_t)(v3 + 32));
    *(void *)char v3 = &unk_26F9539B8;
    *((void *)v3 + 1) = &unk_26F953A58;
    *((void *)v3 + 2) = &unk_26F953A98;
    *((void *)v3 + 4) = &unk_26F953AD8;
    *(_OWORD *)(v3 + 184) = 0u;
    *(_OWORD *)(v3 + 200) = 0u;
    *((void *)v3 + 27) = 0;
    nullsub_13(v3 + 224, v4);
    *((void *)v3 + 43) = &unk_26F954540;
    *((void *)v3 + 53) = 0;
    *((_OWORD *)v3 + 29) = xmmword_244EC4090;
    *((_WORD *)v3 + 248) = 0;
    v3[498] = 0;
    *((void *)v3 + 63) = 0;
    *((void *)v3 + 64) = 0;
    *((void *)v3 + 71) = 0;
    *((void *)v3 + 73) = 0;
    *((void *)v3 + 72) = 0;
    v3[592] = 0;
    *((void *)v3 + 75) = 0;
    *((void *)v3 + 77) = 0;
    *((void *)v3 + 76) = 0;
    *((_DWORD *)v3 + 156) = 0;
    *(_OWORD *)(v3 + 696) = 0u;
    *(_OWORD *)(v3 + 712) = 0u;
    uint64_t v5 = sub_244CC4D84(0x18uLL);
    if (v5)
    {
      *uint64_t v5 = v3;
      v5[1] = a1 + 2;
      v5[2] = 0;
      v5[2] = a1[4];
      *(void *)(a1[4] + 8) = v5;
      a1[4] = (unint64_t)v5;
      unint64_t v6 = a1[1];
      unint64_t v7 = *a1 + 1;
      *a1 = v7;
      if (v7 > v6) {
        a1[1] = v7;
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

void sub_244DE9A94(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = sub_244CC6450((void *)(a1 + 16), a2);
    if (!v4) {
      sub_244E2867C();
    }
    uint64_t v5 = v4;
    void *v4 = 0;
    unint64_t v6 = (void *)sub_244CD1E44(a2);
    j__free(v6);
    if (*(void *)(a1 + 40))
    {
      *(unsigned char *)(a1 + 48) = 1;
    }
    else
    {
      *(void *)(v5[1] + 16) = v5[2];
      *(void *)(v5[2] + 8) = v5[1];
      j__free(v5);
    }
    --*(void *)a1;
  }
}

uint64_t sub_244DE9B20(uint64_t a1, uint64_t a2)
{
  return 0;
}

void *sub_244DE9B3C(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = 0;
  a1[4] = a2[8];
  a1[5] = a2[11];
  a1[6] = a2[12];
  a1[7] = a2[13];
  a1[8] = a2[14];
  a1[9] = a2[3];
  a1[10] = a2[15];
  a1[11] = a2[16];
  a1[12] = a2[17];
  a1[13] = a2[18];
  a1[14] = a2[19];
  a1[15] = a2[5];
  a1[16] = a2[21];
  a1[17] = a2[22];
  a1[18] = a2[6];
  a1[19] = a2[20];
  a1[20] = 0;
  uint64_t v3 = a2[9];
  a2[9] = 0;
  a1[21] = v3;
  a1[22] = 0;
  *(void *)((char *)a1 + 182) = 0;
  if (!v3) {
    uint64_t v3 = a2[7];
  }
  a1[20] = v3;
  a1[3] = a2[4];
  if (!sub_244DE9C2C(a1)) {
    sub_244E2BDDC();
  }
  return a1;
}

BOOL sub_244DE9C2C(void *a1)
{
  return *a1
      && a1[2]
      && a1[4]
      && a1[5]
      && a1[6]
      && a1[7]
      && a1[8]
      && a1[9]
      && a1[12]
      && a1[13]
      && a1[14]
      && a1[15]
      && a1[17]
      && a1[16]
      && a1[18]
      && a1[20]
      && a1[10] != 0;
}

void sub_244DE9CC4(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, __n128 *a4@<X8>)
{
  if (!*(unsigned char *)(a1 + 2000))
  {
    a4->n128_u32[0] = 3;
    a4->n128_u64[1] = (unint64_t)"src/controller/CommissioneeDeviceProxy.cpp";
    int v8 = 46;
LABEL_9:
    a4[1].n128_u32[0] = v8;
    return;
  }
  if (!a2)
  {
    int v8 = 47;
    a4->n128_u32[0] = 47;
    a4->n128_u64[1] = (unint64_t)"src/controller/CommissioneeDeviceProxy.cpp";
    goto LABEL_9;
  }
  sub_24479DD24(a1 + 1976, (uint64_t)v11);
  unint64_t v7 = (uint64_t *)sub_2446F7170(v11);
  v9[0] = *(unsigned char *)a3;
  if (v9[0]) {
    int v10 = *(_DWORD *)(a3 + 4);
  }
  sub_244DBBC64(a2, v7, (uint64_t)v9, a4);
  if (v11[0]) {
    (*(void (**)(uint64_t))(*(void *)v12 + 32))(v12);
  }
}

uint64_t sub_244DE9DAC(uint64_t result)
{
  *(_DWORD *)(result + 72) = 0;
  return result;
}

uint64_t sub_244DE9DB4(uint64_t result)
{
  *(_DWORD *)(result + 56) = 0;
  return result;
}

void sub_244DE9DBC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 72) == 2)
  {
    if (*(unsigned char *)(a1 + 2000))
    {
      uint64_t v2 = (uint64_t *)sub_2446F7170((unsigned char *)(a1 + 2000));
      uint64_t v3 = (void *)sub_244D879D8(*v2);
      sub_244D8588C(v3);
    }
    *(_DWORD *)(a1 + 72) = 0;
    sub_244CDE0F4(a1 + 80);
  }
}

void sub_244DE9E28(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (void *)(a1 + 1976);
  sub_24479DD24(a1 + 1976, a2);
  sub_244D87ED0(v3);
  *(_DWORD *)(a1 + 72) = 0;

  sub_244CDE0F4(a1 + 80);
}

uint64_t sub_244DE9E74@<X0>(uint64_t result@<X0>, long long *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  long long v5 = *a2;
  *(_DWORD *)(result + 56) = *((_DWORD *)a2 + 4);
  *(_OWORD *)(result + 40) = v5;
  *(_DWORD *)(result + 60) = *((_DWORD *)a2 + 5);
  *(void *)(result + 64) = *((void *)a2 + 3);
  uint64_t v6 = *a3;
  *(_WORD *)(result + 216) = *((_WORD *)a3 + 4);
  *(void *)(result + 208) = v6;
  if (*(unsigned char *)(result + 2000))
  {
    sub_24479DD24(result + 1976, (uint64_t)v12);
    int v8 = (uint64_t *)sub_2446F7170(v12);
    uint64_t result = sub_244D879D8(*v8);
    uint64_t v9 = result;
    if (v12[0]) {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 32))(v13);
    }
    long long v10 = *a2;
    *(_DWORD *)(v9 + 112) = *((_DWORD *)a2 + 4);
    *(_OWORD *)(v9 + 96) = v10;
    *(_DWORD *)(v9 + 116) = *((_DWORD *)a2 + 5);
    *(void *)(v9 + 120) = *((void *)a2 + 3);
    int v11 = 99;
  }
  else
  {
    int v11 = 93;
  }
  *(_DWORD *)a4 = 0;
  *(void *)(a4 + 8) = "src/controller/CommissioneeDeviceProxy.cpp";
  *(_DWORD *)(a4 + 16) = v11;
  return result;
}

uint64_t sub_244DE9F70@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  if (*(_DWORD *)(result + 72) == 1)
  {
    uint64_t v5 = result;
    uint64_t result = sub_244D879D8(*a2);
    if (*(unsigned char *)(result + 57) == 1)
    {
      uint64_t result = sub_244D88328((void *)(v5 + 1976), a2);
      if (result)
      {
        *(_DWORD *)(v5 + 72) = 2;
        *(_DWORD *)a3 = 0;
        *(void *)(a3 + 8) = "src/controller/CommissioneeDeviceProxy.cpp";
        int v6 = 114;
      }
      else
      {
        *(_DWORD *)(v5 + 72) = 0;
        *(_DWORD *)a3 = 172;
        *(void *)(a3 + 8) = "src/controller/CommissioneeDeviceProxy.cpp";
        int v6 = 110;
      }
    }
    else
    {
      *(_DWORD *)a3 = 47;
      *(void *)(a3 + 8) = "src/controller/CommissioneeDeviceProxy.cpp";
      int v6 = 105;
    }
  }
  else
  {
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 8) = "src/controller/CommissioneeDeviceProxy.cpp";
    int v6 = 104;
  }
  *(_DWORD *)(a3 + 16) = v6;
  return result;
}

void *sub_244DEA048(void *a1)
{
  *a1 = &unk_26F9599B8;
  a1[2] = &unk_26F959A20;
  uint64_t v2 = (uint64_t)(a1 + 247);
  sub_24479DD24((uint64_t)(a1 + 247), (uint64_t)v6);
  if (v6[0])
  {
    uint64_t v3 = (uint64_t *)sub_24479DC08(v6);
    uint64_t v4 = (void *)sub_244D879D8(*v3);
    sub_244D8588C(v4);
    if (v6[0]) {
      (*(void (**)(uint64_t))(*(void *)v7 + 32))(v7);
    }
  }
  sub_244D87E54(v2);
  sub_244CDE284(a1 + 10);
  return a1;
}

void *sub_244DEA120(uint64_t a1)
{
  return sub_244DEA048((void *)(a1 - 16));
}

void sub_244DEA128(void *a1)
{
  sub_244DEA048(a1);

  JUMPOUT(0x245695FA0);
}

void sub_244DEA160(uint64_t a1)
{
  sub_244DEA048((void *)(a1 - 16));

  JUMPOUT(0x245695FA0);
}

void sub_244DEA19C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  a6[1] = 0;
  a6[2] = 0;
  *a6 = 0;
  sub_244D93D70(a2, a3, a4, a5, &v10, &v9, a6);
  if (!*(_DWORD *)a6)
  {
    uint64_t v8 = v10;
    *(void *)(a1 + 24) = v9;
    *(void *)(a1 + 32) = v8;
    *(_DWORD *)a6 = 0;
    a6[1] = "src/controller/CommissioneeDeviceProxy.cpp";
    *((_DWORD *)a6 + 4) = 132;
  }
}

uint64_t sub_244DEA220(uint64_t a1)
{
  return *(void *)(a1 + 1968);
}

unsigned char *sub_244DEA228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24479DD24(a1 + 1976, a2);
}

BOOL sub_244DEA230(uint64_t a1)
{
  return *(_DWORD *)(a1 + 72) == 2;
}

const char *sub_244DEA240(unsigned int a1)
{
  if (a1 > 0x27) {
    return "???";
  }
  else {
    return (&off_2651A9C18)[(char)a1];
  }
}

const char *sub_244DEA268(unsigned int a1)
{
  if (a1 > 0x24) {
    return "core_commissioning_stage_unknown";
  }
  else {
    return (&off_2651A9D58)[(char)a1];
  }
}

void *sub_244DEA290(void *a1)
{
  *a1 = &unk_26F959A98;
  sub_244DECACC(a1 + 12);
  return a1;
}

void *sub_244DEA2D4(void *a1)
{
  *a1 = &unk_26F959A98;
  sub_244DECACC(a1 + 12);
  return a1;
}

void sub_244DEA318(void *a1)
{
  *a1 = &unk_26F959A98;
  sub_244DECACC(a1 + 12);

  JUMPOUT(0x245695FA0);
}

void sub_244DEA37C(char *__s1@<X2>, uint64_t a2@<X0>, uint64_t a3@<X1>, int a4@<W3>, int a5@<W4>, unsigned char *a6@<X5>, uint64_t a7@<X8>)
{
  if (!*(void *)(a2 + 56))
  {
    *(_DWORD *)v22 = 2;
    v24 = "core_setup_code_pairer_pair_dev";
    int v25 = 3;
    char v26 = 3;
    sub_244D7E78C((uint64_t)v22);
    *(_DWORD *)a7 = 3;
    *(void *)(a7 + 8) = "src/controller/SetUpCodePairer.cpp";
    int v17 = 73;
LABEL_13:
    *(_DWORD *)(a7 + 16) = v17;
    return;
  }
  if (!a3)
  {
    *(_DWORD *)v22 = 2;
    v24 = "core_setup_code_pairer_pair_dev";
    int v25 = 47;
    char v26 = 3;
    sub_244D7E78C((uint64_t)v22);
    *(_DWORD *)a7 = 47;
    *(void *)(a7 + 8) = "src/controller/SetUpCodePairer.cpp";
    int v17 = 74;
    goto LABEL_13;
  }
  v22[0] = 0;
  WORD1(v24) = 0;
  BYTE4(v24) = 0;
  int v25 = 0;
  *(_DWORD *)&v22[2] = 0;
  __int16 v23 = 0;
  uint64_t v27 = v28;
  v28[0] = 0;
  v30[0] = 0;
  v30[1] = 0;
  v28[1] = 0;
  v29 = v30;
  int v14 = strncmp(__s1, "MT:", 3uLL);
  *(void *)(a7 + 8) = 0;
  *(void *)(a7 + 16) = 0;
  *(void *)a7 = 0;
  if (v14)
  {
    sub_244D70AC0(__p, __s1);
    long long v15 = sub_244BDD958(&v34, (long long *)__p);
    sub_244D7FE48((uint64_t)v15, (uint64_t)v22, a7);
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v34.__r_.__value_.__l.__data_);
    }
    if (v32 < 0) {
      operator delete(__p[0]);
    }
    if (*(_DWORD *)a7) {
      goto LABEL_34;
    }
    if ((sub_244D8235C(v22, 0) & 1) == 0)
    {
      int v16 = 56;
LABEL_24:
      *(_DWORD *)a7 = 47;
      *(void *)(a7 + 8) = "src/controller/SetUpCodePairer.cpp";
      goto LABEL_33;
    }
  }
  else
  {
    sub_244D70AC0(&v33, __s1);
    std::string v34 = v33;
    memset(&v33, 0, sizeof(v33));
    sub_244D81AF8((uint64_t)&v34, (uint64_t)v22, (void *)a7);
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v34.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v33.__r_.__value_.__l.__data_);
    }
    if (*(_DWORD *)a7) {
      goto LABEL_34;
    }
    if ((sub_244D82274(v22, 0) & 1) == 0)
    {
      int v16 = 51;
      goto LABEL_24;
    }
  }
  *(_DWORD *)a7 = 0;
  *(void *)(a7 + 8) = "src/controller/SetUpCodePairer.cpp";
  *(_DWORD *)(a7 + 16) = 59;
  if (*a6)
  {
    if (a5 == 2)
    {
      LODWORD(v34.__r_.__value_.__l.__data_) = 2;
      v34.__r_.__value_.__l.__size_ = (std::string::size_type)"core_setup_code_pairer_pair_dev";
      LODWORD(v34.__r_.__value_.__r.__words[2]) = 47;
      v34.__r_.__value_.__s.__data_[20] = 3;
      sub_244D7E78C((uint64_t)&v34);
      *(_DWORD *)a7 = 47;
      *(void *)(a7 + 8) = "src/controller/SetUpCodePairer.cpp";
      int v16 = 82;
LABEL_33:
      *(_DWORD *)(a7 + 16) = v16;
      goto LABEL_34;
    }
    int v18 = v25;
    if (*(void *)(a2 + 64) == a3
      && *(_DWORD *)(a2 + 72) == v25
      && *(unsigned __int8 *)(a2 + 76) == a4
      && *(unsigned __int8 *)(a2 + 77) == a5)
    {
      char v19 = sub_244DEA830(a6);
      sub_244DEA78C(a2, (uint64_t)v19);
      *(_DWORD *)a7 = 0;
      *(void *)(a7 + 8) = "src/controller/SetUpCodePairer.cpp";
      int v16 = 87;
      goto LABEL_33;
    }
  }
  else
  {
    int v18 = v25;
  }
  *(unsigned char *)(a2 + 76) = a4;
  *(unsigned char *)(a2 + 77) = a5;
  *(void *)(a2 + 64) = a3;
  *(_DWORD *)(a2 + 72) = v18;
  sub_244DEA854(a2);
  if (*a6)
  {
    int64x2_t v20 = sub_244DEA830(a6);
    sub_244DEA78C(a2, (uint64_t)v20);
    *(_DWORD *)a7 = 0;
    *(void *)(a7 + 8) = "src/controller/SetUpCodePairer.cpp";
    int v16 = 101;
    goto LABEL_33;
  }
  *(void *)a7 = 0;
  *(void *)(a7 + 8) = 0;
  *(void *)(a7 + 16) = 0;
  sub_244DEA944(a2, (uint64_t)v22, (void *)a7);
  int v21 = *(_DWORD *)a7;
  if (*(_DWORD *)a7)
  {
    LODWORD(v34.__r_.__value_.__l.__data_) = 2;
    v34.__r_.__value_.__l.__size_ = (std::string::size_type)"core_setup_code_pairer_pair_dev";
    LODWORD(v34.__r_.__value_.__r.__words[2]) = v21;
    v34.__r_.__value_.__s.__data_[20] = 3;
  }
  else
  {
    *(void *)a7 = 0;
    *(void *)(a7 + 8) = 0;
    *(void *)(a7 + 16) = 0;
    (*(void (**)(void, uint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))(**(void **)(a2 + 56)
                                                                                               + 40))(*(void *)(a2 + 56), 30000, sub_244DEAAEC, a2);
    if (*(_DWORD *)a7) {
      goto LABEL_34;
    }
    LODWORD(v34.__r_.__value_.__l.__data_) = 0;
    v34.__r_.__value_.__l.__size_ = (std::string::size_type)"core_setup_code_pairer_pair_dev";
    v34.__r_.__value_.__s.__data_[20] = 0;
  }
  sub_244D7E78C((uint64_t)&v34);
LABEL_34:
  sub_2447E6298((uint64_t)&v29, v30[0]);
  sub_2447E6298((uint64_t)&v27, v28[0]);
}

uint64_t sub_244DEA78C(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 77) == 1)
  {
    sub_244DEB21C(a1, (uint64_t)v5);
    LODWORD(v5[0]) = 0;
    sub_244DEBFD4((void *)(a1 + 96), (const char *)a2, (int *)v5);
  }
  else
  {
    for (v5[0] = 0; v5[0] < *(void *)(a2 + 8); ++v5[0])
      sub_244DEC0E4((void *)(a1 + 96), (const char *)a2, v5);
  }
  return sub_244DEB328(a1);
}

unsigned char *sub_244DEA830(unsigned char *a1)
{
  if (!*a1) {
    sub_244E2232C();
  }
  return a1 + 8;
}

uint64_t sub_244DEA854(uint64_t a1)
{
  sub_244DEB128(a1, (uint64_t)v8);
  sub_244DEB21C(a1, (uint64_t)v8);
  *(_DWORD *)(a1 + 88) = 0;
  uint64_t v2 = *(void ***)(a1 + 104);
  uint64_t v3 = *(void *)(a1 + 112);
  *(void *)(a1 + 136) = 0;
  unint64_t v4 = v3 - (void)v2;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v5 = *(void *)(a1 + 112);
      uint64_t v2 = (void **)(*(void *)(a1 + 104) + 8);
      *(void *)(a1 + 104) = v2;
      unint64_t v4 = v5 - (void)v2;
    }
    while (v4 > 0x10);
  }
  if (v4 >> 3 == 1)
  {
    uint64_t v6 = 8;
    goto LABEL_7;
  }
  if (v4 >> 3 == 2)
  {
    uint64_t v6 = 17;
LABEL_7:
    *(void *)(a1 + 128) = v6;
  }
  *(unsigned char *)(a1 + 144) = 0;
  *(_DWORD *)(a1 + 392) = 0;
  *(void *)(a1 + 400) = "src/controller/SetUpCodePairer.cpp";
  *(_DWORD *)(a1 + 408) = 559;
  return (*(uint64_t (**)(void, uint64_t (*)(uint64_t, uint64_t), uint64_t))(**(void **)(a1 + 56)
                                                                                              + 72))(*(void *)(a1 + 56), sub_244DEAAEC, a1);
}

void sub_244DEA944(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = (unsigned char *)(a2 + 7);
  int v7 = *(unsigned __int8 *)(a2 + 7);
  if (*(unsigned char *)(a1 + 77) != 2)
  {
    BOOL v9 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)(a2 + 7) && (*sub_244BDC0F4((unsigned char *)(a2 + 7)) & 2) == 0) {
    goto LABEL_7;
  }
  sub_244DEAE64(a1, a2, v15);
  uint64_t v8 = v15[0];
  if (v7)
  {
    if (!LODWORD(v15[0]))
    {
      BOOL v9 = 1;
LABEL_11:
      sub_244BDC0F4(v6);
      if ((*sub_244BDC0F4(v6) & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_12;
    }
    if (LODWORD(v15[0]) != 108)
    {
LABEL_27:
      uint64_t v13 = v15[1];
      uint64_t v14 = v15[2];
      *a3 = v8;
      a3[1] = v13;
      a3[2] = v14;
      return;
    }
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  BOOL v9 = LODWORD(v15[0]) == 0;
LABEL_12:
  uint64_t v10 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15[0]) = 0;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "WiFi-PAF: has RendezvousInformationFlag::kWiFiPAF", (uint8_t *)v15, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  BOOL v9 = v9;
LABEL_17:
  sub_244DEAFBC(a1, a2, v15);
  uint64_t v8 = v15[0];
  if (v7) {
    BOOL v11 = LODWORD(v15[0]) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    goto LABEL_27;
  }
  if (LODWORD(v15[0])) {
    int v12 = v9;
  }
  else {
    int v12 = 1;
  }
  if (v12 == 1) {
    *(_DWORD *)a3 = 0;
  }
  else {
    *(_DWORD *)a3 = 108;
  }
  a3[1] = "src/controller/SetUpCodePairer.cpp";
  *((_DWORD *)a3 + 4) = 159;
}

uint64_t sub_244DEAAEC(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_ERROR, "Discovery timed out", buf, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(9u, 1);
  }
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  sub_244DEB128(a2, (uint64_t)&v28);
  if (v28)
  {
    unint64_t v4 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      long long v26 = v28;
      uint64_t v27 = v29;
      uint64_t v5 = sub_244CB7B34((const char **)&v26, 1);
      *(_DWORD *)buf = 136315650;
      *(void *)v31 = v5;
      *(_WORD *)&v31[8] = 2080;
      *(void *)&v31[10] = "src/controller/SetUpCodePairer.cpp";
      __int16 v32 = 1024;
      int v33 = 687;
      _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_ERROR, "%s at %s:%d", buf, 0x1Cu);
    }
    if (sub_244CC4E58(1u))
    {
      long long v24 = v28;
      uint64_t v25 = v29;
      sub_244CB7B34((const char **)&v24, 1);
      sub_244CC4DE0(0, 1);
    }
  }
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  uint64_t result = (uint64_t)sub_244DEB21C(a2, (uint64_t)&v28);
  if (v28)
  {
    int v7 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v22 = v28;
      uint64_t v23 = v29;
      uint64_t v8 = sub_244CB7B34((const char **)&v22, 1);
      *(_DWORD *)buf = 136315650;
      *(void *)v31 = v8;
      *(_WORD *)&v31[8] = 2080;
      *(void *)&v31[10] = "src/controller/SetUpCodePairer.cpp";
      __int16 v32 = 1024;
      int v33 = 688;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "%s at %s:%d", buf, 0x1Cu);
    }
    uint64_t result = sub_244CC4E58(1u);
    if (result)
    {
      long long v20 = v28;
      uint64_t v21 = v29;
      sub_244CB7B34((const char **)&v20, 1);
      uint64_t result = sub_244CC4DE0(0, 1);
    }
  }
  *(unsigned char *)(a2 + 90) = 0;
  if (!*(unsigned char *)(a2 + 384) && !*(void *)(a2 + 136))
  {
    int v9 = *(_DWORD *)(a2 + 392);
    int v10 = *(_DWORD *)(a2 + 396);
    if (v9) {
      int v11 = *(_DWORD *)(a2 + 392);
    }
    else {
      int v11 = 50;
    }
    int v12 = *(_DWORD *)(a2 + 412);
    if (v9) {
      uint64_t v13 = *(const char **)(a2 + 400);
    }
    else {
      uint64_t v13 = "src/controller/SetUpCodePairer.cpp";
    }
    if (v9) {
      int v14 = *(_DWORD *)(a2 + 408);
    }
    else {
      int v14 = 698;
    }
    *(_DWORD *)buf = 1;
    *(void *)&v31[4] = "core_setup_code_pairer_pair_dev";
    *(_DWORD *)&v31[12] = v11;
    v31[16] = 3;
    sub_244D7E78C((uint64_t)buf);
    uint64_t v15 = *(void *)(a2 + 48);
    v16[0] = v11;
    v16[1] = v10;
    int v17 = v13;
    int v18 = v14;
    int v19 = v12;
    return (*(uint64_t (**)(uint64_t, _DWORD *))(*(void *)v15 + 48))(v15, v16);
  }
  return result;
}

uint64_t sub_244DEAE64@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (*(void *)(result + 8))
  {
    uint64_t v5 = result;
    uint64_t v6 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "Starting commissioning discovery over BLE", v7, 2u);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    *(unsigned char *)(v5 + 88) = 1;
    a3[1] = 0;
    a3[2] = 0;
    *a3 = 0;
    uint64_t result = sub_244CBB9C4(*(void *)(v5 + 8), a2 + 10, v5, (uint64_t)sub_244DEB0F0, (uint64_t)sub_244DEB0F4, (uint64_t)a3);
    if (*(_DWORD *)a3) {
      *(unsigned char *)(v5 + 88) = 0;
    }
  }
  else
  {
    *(_DWORD *)a3 = 108;
    a3[1] = "src/controller/SetUpCodePairer.cpp";
    *((_DWORD *)a3 + 4) = 169;
  }
  return result;
}

void sub_244DEAF7C(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 108;
  *(void *)(a1 + 8) = "src/controller/SetUpCodePairer.cpp";
  *(_DWORD *)(a1 + 16) = 254;
}

void sub_244DEAF9C(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 108;
  *(void *)(a1 + 8) = "src/controller/SetUpCodePairer.cpp";
  *(_DWORD *)(a1 + 16) = 278;
}

void sub_244DEAFBC(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "Starting commissioning discovery over DNS-SD", buf, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  int v7 = (unsigned char *)(a1 + 16);
  if (*(unsigned char *)(a2 + 12))
  {
    *int v7 = 1;
    if (*(unsigned char *)(a2 + 12)) {
      unsigned __int8 v8 = *(_WORD *)(a2 + 10);
    }
    else {
      unsigned __int8 v8 = HIBYTE(*(_WORD *)(a2 + 10));
    }
    unsigned int v9 = v8;
  }
  else
  {
    *int v7 = 2;
    unsigned int v9 = sub_244BDC1A4((unsigned char *)(a2 + 10));
  }
  *(void *)(a1 + 24) = v9;
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 2);
  *(_WORD *)(a1 + 42) = *(_WORD *)(a2 + 4);
  *(unsigned char *)(a1 + 89) = 1;
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  uint64_t v10 = *(void *)(a1 + 48);
  long long v11 = *(_OWORD *)v7;
  uint64_t v12 = *(void *)(a1 + 32);
  sub_244DF89BC(v10, (uint64_t)&v11, a3);
  if (*(_DWORD *)a3) {
    *(unsigned char *)(a1 + 89) = 0;
  }
}

uint64_t sub_244DEB0F4(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return sub_244DEB9F8(a1, (int *)&v3);
}

uint64_t sub_244DEB128@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (!*(unsigned char *)(result + 88))
  {
    *(_DWORD *)a2 = 0;
    *(void *)(a2 + 8) = "src/controller/SetUpCodePairer.cpp";
    int v5 = 198;
LABEL_10:
    *(_DWORD *)(a2 + 16) = v5;
    return result;
  }
  uint64_t v3 = result;
  *(unsigned char *)(result + 88) = 0;
  if (!*(void *)(result + 8))
  {
    *(_DWORD *)a2 = 108;
    *(void *)(a2 + 8) = "src/controller/SetUpCodePairer.cpp";
    int v5 = 203;
    goto LABEL_10;
  }
  uint64_t v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_INFO, "Stopping commissioning discovery over BLE", v6, 2u);
  }
  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(9u, 3);
  }
  return sub_244CBB8A8(*(void *)(v3 + 8), a2);
}

void *sub_244DEB21C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_INFO, "Stopping commissioning discovery over DNS-SD", v6, 2u);
  }
  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(9u, 3);
  }
  *(unsigned char *)(a1 + 89) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  uint64_t result = sub_244DF8A28(*(void *)(a1 + 48), (uint64_t)v6);
  *(_DWORD *)a2 = 0;
  *(void *)(a2 + 8) = "src/controller/SetUpCodePairer.cpp";
  *(_DWORD *)(a2 + 16) = 249;
  return result;
}

uint64_t sub_244DEB2E8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(result + 90) = 0;
  *(_DWORD *)a2 = 0;
  *(void *)(a2 + 8) = "src/controller/SetUpCodePairer.cpp";
  *(_DWORD *)(a2 + 16) = 260;
  return result;
}

uint64_t sub_244DEB308@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(result + 91) = 0;
  *(_DWORD *)a2 = 0;
  *(void *)(a2 + 8) = "src/controller/SetUpCodePairer.cpp";
  *(_DWORD *)(a2 + 16) = 285;
  return result;
}

uint64_t sub_244DEB328(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 384)) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 136);
  if (!v3) {
    return 0;
  }
  uint64_t v30 = a1 + 152;
  uint64_t v31 = a1 + 96;
  uint64_t v28 = a1 + 296;
  uint64_t v29 = a1 + 312;
  while (1)
  {
    unint64_t v4 = *(void *)(a1 + 128);
    uint64_t v5 = *(void *)(*(void *)(a1 + 104) + 8 * (v4 / 0x11));
    uint64_t v6 = (long long *)(v5 + 232 * (v4 % 0x11));
    int v7 = *((_DWORD *)v6 + 4);
    long long v43 = *v6;
    int v44 = v7;
    int v45 = *((_DWORD *)v6 + 5);
    uint64_t v46 = *((void *)v6 + 3);
    long long v8 = v6[5];
    long long v9 = v6[6];
    long long v10 = v6[7];
    *(_OWORD *)&v52[12] = *(long long *)((char *)v6 + 124);
    long long v51 = v9;
    *(_OWORD *)v52 = v10;
    long long v50 = v8;
    long long v11 = v6[2];
    long long v12 = v6[4];
    long long v48 = v6[3];
    long long v49 = v12;
    long long v47 = v11;
    unsigned __int8 v53 = *((unsigned char *)v6 + 140);
    if (v53)
    {
      uint64_t v13 = *((void *)v6 + 18);
      int v55 = *((_DWORD *)v6 + 38);
      uint64_t v54 = v13;
    }
    long long v14 = v6[10];
    uint64_t v57 = *((void *)v6 + 22);
    long long v56 = v14;
    uint64_t v15 = v5 + 232 * (v4 % 0x11);
    long long v16 = *(_OWORD *)(v15 + 184);
    long long v17 = *(_OWORD *)(v15 + 200);
    *(_OWORD *)&v59[9] = *(_OWORD *)(v15 + 209);
    long long v58 = v16;
    *(_OWORD *)v59 = v17;
    int v60 = *(_DWORD *)(v15 + 228);
    *(void *)(a1 + 128) = v4 + 1;
    *(void *)(a1 + 136) = v3 - 1;
    sub_244DECBC4(v31, 1);
    LODWORD(v47) = *(_DWORD *)(a1 + 72);
    *(_OWORD *)buf = v43;
    *(_DWORD *)&uint8_t buf[16] = v44;
    *(_DWORD *)&buf[20] = v45;
    uint64_t v41 = v46;
    sub_244CDC098((uint64_t)buf, __str, 0x4CuLL);
    int v18 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = __str;
      _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_DEFAULT, "Attempting PASE connection to %s", buf, 0xCu);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    sub_244DEB7B0(a1);
    if (v44 == 1)
    {
      int v19 = v45;
      *(_DWORD *)(v30 + 16) = v44;
      *(unsigned char *)(a1 + 144) = 1;
      *(_OWORD *)uint64_t v30 = v43;
      *(_DWORD *)(a1 + 172) = v19;
      *(void *)(a1 + 176) = v46;
      long long v20 = *(_OWORD *)v52;
      *(_OWORD *)(a1 + 248) = v51;
      *(_OWORD *)(a1 + 264) = v20;
      *(_OWORD *)(a1 + 276) = *(_OWORD *)&v52[12];
      long long v21 = v48;
      *(_OWORD *)(a1 + 184) = v47;
      *(_OWORD *)(a1 + 200) = v21;
      long long v22 = v50;
      *(_OWORD *)(a1 + 216) = v49;
      *(_OWORD *)(a1 + 232) = v22;
      int v23 = v53;
      *(unsigned char *)(a1 + 292) = v53;
      if (v23)
      {
        *(void *)uint64_t v28 = v54;
        *(_DWORD *)(v28 + 8) = v55;
      }
      *(_OWORD *)uint64_t v29 = v56;
      *(void *)(v29 + 16) = v57;
      long long v24 = *(_OWORD *)v59;
      *(_OWORD *)(a1 + 336) = v58;
      *(_OWORD *)(a1 + 352) = v24;
      *(_OWORD *)(a1 + 361) = *(_OWORD *)&v59[9];
      *(_DWORD *)(a1 + 380) = v60;
    }
    if (*(unsigned char *)(a1 + 76)) {
      ((void (*)(unsigned char *__return_ptr, void, void, long long *))loc_244DF0F64)(buf, *(void *)(a1 + 48), *(void *)(a1 + 64), &v43);
    }
    else {
      sub_244DF0DAC(*(void *)(a1 + 48), *(void *)(a1 + 64), (uint64_t)&v43, buf);
    }
    int v25 = *(_DWORD *)buf;
    long long v38 = *(_OWORD *)&buf[4];
    int v39 = *(_DWORD *)&buf[20];
    if (!*(_DWORD *)buf) {
      break;
    }
    long long v26 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v35 = v25;
      long long v36 = v38;
      int v37 = v39;
      uint64_t v27 = sub_244CB7B34((const char **)&v35, 1);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "src/controller/SetUpCodePairer.cpp";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v41) = 332;
      _os_log_impl(&dword_2446BD000, v26, OS_LOG_TYPE_ERROR, "%s at %s:%d", buf, 0x1Cu);
    }
    if (sub_244CC4E58(1u))
    {
      int v32 = v25;
      long long v33 = v38;
      int v34 = v39;
      sub_244CB7B34((const char **)&v32, 1);
      sub_244CC4DE0(0, 1);
    }
    sub_244DEB7F4(a1);
    uint64_t v3 = *(void *)(a1 + 136);
    if (!v3) {
      return 0;
    }
  }
  return 1;
}

uint64_t sub_244DEB7B0(uint64_t result)
{
  if (*(unsigned char *)(result + 384)) {
    sub_244E2BF24();
  }
  *(unsigned char *)(result + 384) = 1;
  uint64_t v1 = *(void *)(result + 48);
  uint64_t v2 = *(void *)(v1 + 4320);
  if (v2 == result) {
    sub_244E2BE7C();
  }
  *(void *)(result + 80) = v2;
  *(void *)(v1 + 4320) = result;
  return result;
}

uint64_t sub_244DEB7F4(uint64_t result)
{
  if (!*(unsigned char *)(result + 384)) {
    sub_244E2BFCC();
  }
  *(unsigned char *)(result + 384) = 0;
  *(void *)(*(void *)(result + 48) + 4320) = *(void *)(result + 80);
  *(void *)(result + 80) = 0;
  return result;
}

uint64_t sub_244DEB828(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = a2;
  uint64_t v3 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "Discovered device to be commissioned over BLE", v5, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  *(unsigned char *)(a1 + 88) = 0;
  sub_244DEB8D4(a1 + 96, &v6);
  return sub_244DEB328(a1);
}

unint64_t sub_244DEB8D4(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    sub_244DECC24((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (void *)(v5 + 8 * (v4 / 0x11));
  uint64_t v7 = *v6 + 232 * (v4 % 0x11);
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0;
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 3944;
  }
  uint64_t v8 = *a2;
  *(unsigned char *)(v7 - 192) = 0;
  *(_WORD *)(v7 - 93) = 0;
  *(_DWORD *)(v7 - 200) = 0;
  *(unsigned char *)(v7 - 196) = 0;
  *(_DWORD *)(v7 - 4) = 0;
  *(_OWORD *)(v7 - 72) = 0u;
  *(_OWORD *)(v7 - 56) = 0u;
  *(_OWORD *)(v7 - 40) = 0u;
  *(_OWORD *)(v7 - 24) = 0u;
  *(unsigned char *)(v7 - 8) = 0;
  *(void *)(v7 - 232) = 0;
  *(void *)(v7 - 224) = 0;
  *(unsigned char *)(v7 - 216) = 2;
  *(_WORD *)(v7 - 214) = 5540;
  *(_DWORD *)(v7 - 212) = 0;
  *(void *)(v7 - 208) = 0;
  *(void *)(v7 - 64) = v8;
  int64x2_t v9 = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_244EC4470);
  *(int64x2_t *)(a1 + 32) = v9;
  uint64_t v10 = *(void *)(a1 + 8);
  if (*(void *)(a1 + 16) == v10) {
    return 0;
  }
  else {
    return *(void *)(v10 + 8 * (v9.i64[0] / 0x11uLL)) + 232 * (v9.i64[0] % 0x11uLL);
  }
}

uint64_t sub_244DEB9F8(uint64_t a1, int *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_OWORD *)buf = *(_OWORD *)a2;
    *(void *)&uint8_t buf[16] = *((void *)a2 + 2);
    uint64_t v5 = sub_244CB7B34((const char **)buf, 1);
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_ERROR, "Commissioning discovery over BLE failed: %s", buf, 0xCu);
  }
  uint64_t result = sub_244CC4E58(1u);
  if (result)
  {
    *(_OWORD *)buf = *(_OWORD *)a2;
    *(void *)&uint8_t buf[16] = *((void *)a2 + 2);
    sub_244CB7B34((const char **)buf, 1);
    uint64_t result = sub_244CC4DE0(9u, 1);
  }
  *(unsigned char *)(a1 + 88) = 0;
  int v7 = *a2;
  long long v18 = *(_OWORD *)(a2 + 1);
  int v19 = a2[5];
  if (v7)
  {
    uint64_t v8 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = v7;
      long long v14 = v18;
      int v15 = v19;
      int64x2_t v9 = sub_244CB7B34((const char **)&v13, 1);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "src/controller/SetUpCodePairer.cpp";
      *(_WORD *)&buf[22] = 1024;
      int v17 = 376;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "%s at %s:%d", buf, 0x1Cu);
    }
    uint64_t result = sub_244CC4E58(1u);
    if (result)
    {
      int v10 = v7;
      long long v11 = v18;
      int v12 = v19;
      sub_244CB7B34((const char **)&v10, 1);
      return sub_244CC4DE0(0, 1);
    }
  }
  return result;
}

BOOL sub_244DEBC08(int a1)
{
  return a1 != 0;
}

BOOL sub_244DEBC14(uint64_t a1, void *a2)
{
  if (*a2) {
    return 0;
  }
  uint64_t v3 = sub_244C98F4C(a2);
  if (*((unsigned char *)v3 + 188))
  {
    if (*(_WORD *)(a1 + 40) && *((_WORD *)v3 + 91) && *(unsigned __int16 *)(a1 + 40) != *((unsigned __int16 *)v3 + 91))
    {
      unint64_t v4 = sub_244CC8484(9u, "Controller");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Discovered device does not match our vendor id.", buf, 2u);
      }
      BOOL result = sub_244CC4E58(2u);
      if (result)
      {
LABEL_20:
        uint64_t v8 = 2;
LABEL_21:
        sub_244CC4DE0(9u, v8);
        return 0;
      }
    }
    else if (*(_WORD *)(a1 + 42) {
           && *((_WORD *)v3 + 92)
    }
           && *(unsigned __int16 *)(a1 + 42) != *((unsigned __int16 *)v3 + 92))
    {
      uint64_t v6 = sub_244CC8484(9u, "Controller");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v17 = 0;
        _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "Discovered device does not match our product id.", v17, 2u);
      }
      BOOL result = sub_244CC4E58(2u);
      if (result) {
        goto LABEL_20;
      }
    }
    else
    {
      int v9 = *(unsigned __int8 *)(a1 + 16);
      if (*(unsigned char *)(a1 + 16))
      {
        if (v9 == 1)
        {
          uint64_t v10 = *((unsigned char *)v3 + 181) & 0xF;
        }
        else
        {
          if (v9 != 2)
          {
            int v12 = sub_244CC8484(9u, "Controller");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)int v15 = 0;
              _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "Unknown filter type; all matches will fail",
                v15,
                2u);
            }
            BOOL result = sub_244CC4E58(1u);
            if (result)
            {
              uint64_t v8 = 1;
              goto LABEL_21;
            }
            return result;
          }
          uint64_t v10 = *((unsigned __int16 *)v3 + 90);
        }
        if (*(void *)(a1 + 24) == v10) {
          return 1;
        }
        int v13 = sub_244CC8484(9u, "Controller");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v14 = 0;
          _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_DEFAULT, "Discovered device does not match our discriminator.", v14, 2u);
        }
        BOOL result = sub_244CC4E58(2u);
        if (result) {
          goto LABEL_20;
        }
      }
      else
      {
        long long v11 = sub_244CC8484(9u, "Controller");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long v16 = 0;
          _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_INFO, "Filter type none; all matches will fail", v16, 2u);
        }
        BOOL result = sub_244CC4E58(3u);
        if (result)
        {
          uint64_t v8 = 3;
          goto LABEL_21;
        }
      }
    }
  }
  else
  {
    int v7 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v19 = 0;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Discovered device does not have an open commissioning window.", v19, 2u);
    }
    BOOL result = sub_244CC4E58(2u);
    if (result) {
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t sub_244DEBF1C(uint64_t a1, void *a2)
{
  uint64_t result = sub_244DEBC14(a1, a2);
  if (result)
  {
    uint64_t v5 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "Discovered device to be commissioned over DNS-SD", v7, 2u);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    uint64_t v6 = sub_244C98F4C(a2);
    return sub_244DEA78C(a1, (uint64_t)v6);
  }
  return result;
}

uint64_t sub_244DEBFD4(void *a1, const char *a2, int *a3)
{
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v8 = 2 * (v7 - v6) + ((v7 - v6) >> 3) - 1;
  if (v7 == v6) {
    uint64_t v8 = 0;
  }
  if (v8 == a1[5] + a1[4])
  {
    sub_244DED230(a1);
    uint64_t v6 = a1[1];
    uint64_t v7 = a1[2];
  }
  if (v7 == v6)
  {
    uint64_t v10 = 0;
  }
  else
  {
    unint64_t v9 = a1[5] + a1[4];
    uint64_t v10 = *(void *)(v6 + 8 * (v9 / 0x11)) + 232 * (v9 % 0x11);
  }
  sub_244DEC8C8(v10, a2, *a3);
  uint64_t v11 = a1[4];
  uint64_t v12 = a1[5] + 1;
  a1[5] = v12;
  unint64_t v13 = v11 + v12;
  uint64_t v14 = a1[1];
  int v15 = (void *)(v14 + 8 * (v13 / 0x11));
  uint64_t v16 = *v15 + 232 * (v13 % 0x11);
  if (a1[2] == v14) {
    uint64_t v16 = 0;
  }
  if (v16 == *v15) {
    uint64_t v16 = *(v15 - 1) + 3944;
  }
  return v16 - 232;
}

uint64_t sub_244DEC0E4(void *a1, const char *a2, uint64_t *a3)
{
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v8 = 2 * (v7 - v6) + ((v7 - v6) >> 3) - 1;
  if (v7 == v6) {
    uint64_t v8 = 0;
  }
  if (v8 == a1[5] + a1[4])
  {
    sub_244DED230(a1);
    uint64_t v6 = a1[1];
    uint64_t v7 = a1[2];
  }
  if (v7 == v6)
  {
    uint64_t v10 = 0;
  }
  else
  {
    unint64_t v9 = a1[5] + a1[4];
    uint64_t v10 = *(void *)(v6 + 8 * (v9 / 0x11)) + 232 * (v9 % 0x11);
  }
  sub_244DEC8C8(v10, a2, *a3);
  uint64_t v11 = a1[4];
  uint64_t v12 = a1[5] + 1;
  a1[5] = v12;
  unint64_t v13 = v11 + v12;
  uint64_t v14 = a1[1];
  int v15 = (void *)(v14 + 8 * (v13 / 0x11));
  uint64_t v16 = *v15 + 232 * (v13 % 0x11);
  if (a1[2] == v14) {
    uint64_t v16 = 0;
  }
  if (v16 == *v15) {
    uint64_t v16 = *(v15 - 1) + 3944;
  }
  return v16 - 232;
}

uint64_t sub_244DEC1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (!v2 || a2 && v2 != a2) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 384)) {
    sub_244DEB7F4(a1);
  }
  sub_244DEA854(a1);
  *(void *)(a1 + 64) = 0;
  return 1;
}

uint64_t sub_244DEC250(uint64_t a1)
{
  if (sub_244DEB328(a1))
  {
    uint64_t v2 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_DEFAULT, "Trying connection to commissionee over different transport", buf, 2u);
    }
    if (!sub_244CC4E58(2u)) {
      return 1;
    }
    goto LABEL_16;
  }
  uint64_t v3 = 0;
  uint64_t v4 = a1 + 88;
  do
  {
    int v5 = *(unsigned __int8 *)(v4 + v3);
    if (*(unsigned char *)(v4 + v3)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v3 == 3;
    }
    ++v3;
  }
  while (!v6);
  if (!v5) {
    return 0;
  }
  uint64_t v7 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v9 = 0;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Waiting to discover commissionees that match our filters", v9, 2u);
  }
  if (sub_244CC4E58(2u)) {
LABEL_16:
  }
    sub_244CC4DE0(9u, 2);
  return 1;
}

BOOL sub_244DEC374(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = a1 + 88;
  do
  {
    int v3 = *(unsigned __int8 *)(v2 + v1);
    if (*(unsigned char *)(v2 + v1)) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = v1 == 3;
    }
    ++v1;
  }
  while (!v4);
  return v3 != 0;
}

uint64_t sub_244DEC39C(uint64_t a1, int a2)
{
  if (a2 != 1) {
    goto LABEL_18;
  }
  if (!*(void *)(a1 + 136))
  {
    uint64_t v4 = 0;
    uint64_t v5 = a1 + 88;
    do
    {
      int v6 = *(unsigned __int8 *)(v5 + v4);
      if (*(unsigned char *)(v5 + v4)) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v4 == 3;
      }
      ++v4;
    }
    while (!v7);
    if (v6)
    {
      uint64_t v8 = sub_244CC8484(9u, "Controller");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring SecurePairingFailed status for now; we are waiting to see if we discover more devices",
          v10,
          2u);
      }
      uint64_t result = sub_244CC4E58(2u);
      if (result) {
        return sub_244CC4DE0(9u, 2);
      }
      return result;
    }
LABEL_18:
    uint64_t result = *(void *)(a1 + 80);
    if (result)
    {
      unint64_t v9 = *(uint64_t (**)(void))(*(void *)result + 16);
      return v9();
    }
    return result;
  }
  uint64_t v2 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_DEFAULT, "Ignoring SecurePairingFailed status for now; we have more discovered devices to try",
      buf,
      2u);
  }
  uint64_t result = sub_244CC4E58(2u);
  if (result) {
    return sub_244CC4DE0(9u, 2);
  }
  return result;
}

uint64_t sub_244DEC504(uint64_t a1, long long *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 80);
  sub_244DEB7F4(a1);
  if (*(_DWORD *)a2 == 50)
  {
    if (*(unsigned char *)(a1 + 144))
    {
      BOOL v7 = sub_244B8D808((unsigned char *)(a1 + 144));
      long long v15 = 0uLL;
      uint64_t v16 = 0;
      uint64_t v8 = sub_244DB12A8();
      int v14 = *((_DWORD *)v7 + 57);
      (*(void (**)(long long *__return_ptr))(*v8 + 80))(&v15);
      if (v15)
      {
        if (v15 != 45)
        {
          unint64_t v9 = sub_244CC8484(9u, "Controller");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_OWORD *)buf = v15;
            uint64_t v20 = v16;
            uint64_t v10 = sub_244CB7B34((const char **)buf, 1);
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v10;
            _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "Error when verifying the validity of an address: %s", buf, 0xCu);
          }
          if (sub_244CC4E58(1u))
          {
            *(_OWORD *)buf = v15;
            uint64_t v20 = v16;
            sub_244CB7B34((const char **)buf, 1);
            sub_244CC4DE0(9u, 1);
          }
        }
      }
    }
  }
  else if (!*(_DWORD *)a2)
  {
    uint64_t v5 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "PASE session established with commissionee. Stopping discovery.", buf, 2u);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    sub_244DEA854(a1);
    *(void *)(a1 + 64) = 0;
    *(_DWORD *)buf = 1;
    *(void *)&buf[8] = "core_setup_code_pairer_pair_dev";
    LODWORD(v20) = *(_DWORD *)a2;
    BYTE4(v20) = 3;
    uint64_t result = sub_244D7E78C((uint64_t)buf);
    if (v4)
    {
      long long v17 = *a2;
      uint64_t v18 = *((void *)a2 + 2);
      return (*(uint64_t (**)(uint64_t, long long *))(*(void *)v4 + 24))(v4, &v17);
    }
    return result;
  }
  *(unsigned char *)(a1 + 144) = 0;
  uint64_t result = sub_244DEC250(a1);
  if (result)
  {
    long long v11 = *a2;
    *(void *)(a1 + 408) = *((void *)a2 + 2);
    *(_OWORD *)(a1 + 392) = v11;
  }
  else
  {
    *(_DWORD *)buf = 1;
    *(void *)&buf[8] = "core_setup_code_pairer_pair_dev";
    LODWORD(v20) = *(_DWORD *)a2;
    BYTE4(v20) = 3;
    uint64_t result = sub_244D7E78C((uint64_t)buf);
    if (v4)
    {
      long long v12 = *a2;
      uint64_t v13 = *((void *)a2 + 2);
      return (*(uint64_t (**)(uint64_t, long long *))(*(void *)v4 + 24))(v4, &v12);
    }
  }
  return result;
}

uint64_t sub_244DEC810(uint64_t a1, long long *a2)
{
  uint64_t result = *(void *)(a1 + 80);
  if (result)
  {
    long long v3 = *a2;
    uint64_t v4 = *((void *)a2 + 2);
    return (*(uint64_t (**)(uint64_t, long long *))(*(void *)result + 32))(result, &v3);
  }
  return result;
}

uint64_t sub_244DEC86C(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t result = *(void *)(a1 + 80);
  if (result)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return (*(uint64_t (**)(uint64_t, uint64_t, long long *))(*(void *)result + 40))(result, a2, &v4);
  }
  return result;
}

uint64_t sub_244DEC8C8(uint64_t a1, const char *a2, uint64_t a3)
{
  *(_OWORD *)a1 = xmmword_268EC34EC;
  *(unsigned char *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 18) = 5540;
  *(unsigned char *)(a1 + 40) = 0;
  *(_WORD *)(a1 + 139) = 0;
  *(void *)(a1 + 28) = 0;
  *(void *)(a1 + 20) = 0;
  *(unsigned char *)(a1 + 36) = 0;
  *(_DWORD *)(a1 + 228) = 0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(unsigned char *)(a1 + 224) = 0;
  *(_DWORD *)(a1 + 228) = *(_DWORD *)a2;
  strncpy((char *)(a1 + 184), a2 + 98, 0x29uLL);
  *(unsigned char *)(a1 + 224) = 0;
  int v6 = (int *)&a2[16 * a3];
  __int16 v7 = *((_WORD *)a2 + 48);
  BOOL v8 = sub_244CBEE00(v6 + 4);
  int v9 = *(_DWORD *)a2;
  if (!v8) {
    int v9 = 0;
  }
  *(_OWORD *)a1 = *((_OWORD *)v6 + 1);
  *(unsigned char *)(a1 + 16) = 1;
  *(_WORD *)(a1 + 18) = v7;
  *(_DWORD *)(a1 + 20) = v9;
  *(void *)(a1 + 24) = 0;
  if (a2[148]) {
    sub_244DEC9B8(a1, *((_DWORD *)a2 + 36));
  }
  if (a2[156]) {
    sub_244DECA14(a1, *((_DWORD *)a2 + 38));
  }
  return a1;
}

uint64_t sub_244DEC9B8(uint64_t a1, int a2)
{
  long long v4 = (unsigned char *)(a1 + 140);
  if (!*(unsigned char *)(a1 + 140))
  {
    uint64_t v5 = sub_244D6A0B8();
    *(unsigned char *)(a1 + 140) = 1;
    *(void *)(a1 + 144) = v5;
    *(_DWORD *)(a1 + 152) = v6;
  }
  *(_DWORD *)sub_244CD44AC(v4) = a2;
  return a1;
}

uint64_t sub_244DECA14(uint64_t a1, int a2)
{
  long long v4 = (unsigned char *)(a1 + 140);
  if (!*(unsigned char *)(a1 + 140))
  {
    uint64_t v5 = sub_244D6A0B8();
    *(unsigned char *)(a1 + 140) = 1;
    *(void *)(a1 + 144) = v5;
    *(_DWORD *)(a1 + 152) = v6;
  }
  *((_DWORD *)sub_244CD44AC(v4) + 1) = a2;
  return a1;
}

uint64_t sub_244DECA74(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)(result + 40) = 0;
  *(_WORD *)(result + 139) = 0;
  *(_DWORD *)(result + 32) = 0;
  *(unsigned char *)(result + 36) = 0;
  *(_DWORD *)(result + 228) = 0;
  *(_OWORD *)(result + 160) = 0u;
  *(_OWORD *)(result + 176) = 0u;
  *(_OWORD *)(result + 192) = 0u;
  *(_OWORD *)(result + 208) = 0u;
  *(unsigned char *)(result + 224) = 0;
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(unsigned char *)(result + 16) = 2;
  *(_WORD *)(result + 18) = 5540;
  *(_DWORD *)(result + 20) = 0;
  uint64_t v3 = 176;
  if (a3) {
    uint64_t v3 = 168;
  }
  *(void *)(result + 24) = 0;
  *(void *)(result + v3) = a2;
  return result;
}

uint64_t sub_244DECACC(void *a1)
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
    uint64_t v6 = 8;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 17;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    __int16 v7 = *v2++;
    operator delete(v7);
  }

  return sub_244DECB74((uint64_t)a1);
}

uint64_t sub_244DECB74(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_244DECBC4(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x11) {
    a2 = 1;
  }
  if (v2 < 0x22) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 17;
  }
  return v4 ^ 1u;
}

void sub_244DECC24(void **a1)
{
  unint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  if (v3 == v2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 2 * (v3 - v2) + ((v3 - v2) >> 3) - 1;
  }
  unint64_t v5 = (char *)a1[4];
  if (v4 - (unint64_t)&v5[(void)a1[5]] < 0x11)
  {
    unint64_t v6 = (v3 - v2) >> 3;
    uint64_t v7 = (uint64_t)(a1 + 3);
    BOOL v8 = a1[3];
    int v9 = *a1;
    uint64_t v10 = v8 - (unsigned char *)*a1;
    if (v6 >= v10 >> 3)
    {
      if (v8 == v9) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      uint64_t v46 = a1 + 3;
      __p = sub_244CAC704(v7, v11);
      long long v43 = (char *)__p;
      int v44 = (char *)__p;
      int v45 = (char *)__p + 8 * v12;
      uint64_t v41 = operator new(0xF68uLL);
      sub_244DED118(&__p, &v41);
      uint64_t v13 = (char *)a1[1];
      int v14 = v44;
      if (v13 == a1[2])
      {
        long long v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (unsigned char *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1;
              }
              else {
                unint64_t v23 = (v14 - (unsigned char *)__p) >> 2;
              }
              long long v24 = (char *)sub_244CAC704((uint64_t)v46, v23);
              long long v26 = v43;
              int v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                int v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v28 = 8 * (v27 >> 3);
                uint64_t v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)uint64_t v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              uint64_t v31 = __p;
              __p = v24;
              long long v43 = &v24[8 * (v23 >> 2)];
              int v44 = v14;
              int v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                int v14 = v44;
              }
            }
            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              uint64_t v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                int v14 = v43;
              }
              long long v22 = &v14[-8 * (v19 >> 1)];
              int v14 = &v20[v21];
              long long v43 = v22;
              int v44 = &v20[v21];
            }
          }
          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)int v14 = v32;
          int v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        long long v33 = (char *)a1[1];
      }
      long long v36 = *a1;
      int v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      __p = v36;
      long long v43 = v33;
      long long v38 = (char *)a1[3];
      int v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      uint64_t v40 = v14 - v37;
      int v44 = v13;
      int v45 = v38;
      if (v40 != 8) {
        uint64_t v40 = (uint64_t)a1[4] + 17;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        int v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      }
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      if (v2 == v9)
      {
        __p = operator new(0xF68uLL);
        sub_244DED000(a1, &__p);
        int v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        __p = operator new(0xF68uLL);
      }
      sub_244DECEE0((uint64_t)a1, &__p);
      uint64_t v35 = (unsigned char *)a1[2] - (unsigned char *)a1[1];
      if (v35 != 8) {
        uint64_t v35 = (uint64_t)a1[4] + 17;
      }
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v5 + 17;
    __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    sub_244DECEE0((uint64_t)a1, &__p);
  }
}

void sub_244DECEE0(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    BOOL v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      int v14 = (char *)sub_244CAC704(v6, v12);
      unint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v16 = *(uint64_t **)(a1 + 8);
      BOOL v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        BOOL v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      long long v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        unint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      unint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    unint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_244DED000(void *a1, void *a2)
{
  unint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)sub_244CAC704(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      long long v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        uint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)uint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      BOOL v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void sub_244DED118(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    unint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      BOOL v17 = (char *)sub_244CAC704(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      uint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_244DED230(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x11;
  unint64_t v4 = v2 - 17;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    BOOL v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_29:
      *(void *)BOOL v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v29 = 1;
      }
      else {
        unint64_t v29 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v30 = (char *)sub_244CAC704(v5, v29);
      uint64_t v31 = &v30[8 * (v29 >> 2)];
      long long v33 = &v30[8 * v32];
      int v34 = (uint64_t *)a1[1];
      BOOL v8 = v31;
      uint64_t v35 = a1[2] - (void)v34;
      if (v35)
      {
        BOOL v8 = &v31[v35 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v36 = 8 * (v35 >> 3);
        int v37 = &v30[8 * (v29 >> 2)];
        do
        {
          uint64_t v38 = *v34++;
          *(void *)int v37 = v38;
          v37 += 8;
          v36 -= 8;
        }
        while (v36);
      }
      goto LABEL_26;
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
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    BOOL v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_29;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0xF68uLL);
      sub_244DED000(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0xF68uLL);
    sub_244DECEE0((uint64_t)a1, &v54);
    uint64_t v40 = (void *)a1[1];
    BOOL v8 = (char *)a1[2];
    uint64_t v41 = *v40;
    uint64_t v9 = (char *)(v40 + 1);
    uint64_t v10 = v41;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_29;
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
      uint64_t v30 = (char *)sub_244CAC704((uint64_t)(a1 + 3), v46);
      uint64_t v31 = &v30[8 * (v46 >> 2)];
      long long v33 = &v30[8 * v47];
      long long v48 = (uint64_t *)a1[1];
      BOOL v8 = v31;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        BOOL v8 = &v31[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        long long v51 = &v30[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)long long v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_26:
      int v39 = (char *)*a1;
      *a1 = v30;
      a1[1] = v31;
      a1[2] = v8;
      a1[3] = v33;
      if (v39)
      {
        operator delete(v39);
        BOOL v8 = (char *)a1[2];
      }
      goto LABEL_29;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  long long v56 = a1 + 3;
  *(void *)&long long v54 = sub_244CAC704((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  unsigned __int8 v53 = operator new(0xF68uLL);
  sub_244DED118(&v54, &v53);
  uint64_t v27 = (char *)a1[2];
  if (v27 == (char *)a1[1])
  {
    uint64_t v28 = (char *)a1[2];
  }
  else
  {
    do
    {
      v27 -= 8;
      sub_244DED4F8((uint64_t)&v54, v27);
    }
    while (v27 != (char *)a1[1]);
    uint64_t v28 = (char *)a1[2];
  }
  v42 = (char *)*a1;
  long long v43 = v54;
  long long v44 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  uint64_t v45 = a1[3];
  *(_OWORD *)a1 = v43;
  *((_OWORD *)a1 + 1) = v44;
  *(void *)&long long v55 = v28;
  *((void *)&v55 + 1) = v45;
  if (v28 != v27) {
    *(void *)&long long v55 = &v28[(v27 - v28 + 7) & 0xFFFFFFFFFFFFFFF8];
  }
  if (v42) {
    operator delete(v42);
  }
}

void sub_244DED4F8(uint64_t a1, void *a2)
{
  unint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_244CAC704(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      uint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        uint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        unint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

uint64_t sub_244DED614(uint64_t a1)
{
  *(void *)a1 = &unk_26F959340;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = sub_244DB12A8();
  *(void *)(a1 + 24) = 0;
  *(void *)a1 = &unk_26F959B40;
  *(_DWORD *)(a1 + 36) = 256;
  uint64_t v2 = 40;
  do
  {
    uint64_t v3 = a1 + v2;
    *(_DWORD *)uint64_t v3 = 0;
    *(void *)(v3 + 8) = 0;
    *(unsigned char *)(v3 + 144) = 0;
    *(unsigned char *)(v3 + 148) = 0;
    *(unsigned char *)(v3 + 152) = 0;
    *(unsigned char *)(v3 + 156) = 0;
    *(unsigned char *)(v3 + 160) = 0;
    *(unsigned char *)(v3 + 162) = 0;
    *(_OWORD *)(v3 + 96) = 0u;
    *(_OWORD *)(v3 + 112) = 0u;
    *(_OWORD *)(v3 + 127) = 0u;
    sub_244DB4A8C(a1 + v2);
    *(_OWORD *)(v3 + 168) = 0u;
    unint64_t v4 = (_OWORD *)(a1 + v2 + 168);
    *(_OWORD *)((char *)v4 + 235) = 0u;
    v4[13] = 0u;
    v4[14] = 0u;
    v4[11] = 0u;
    v4[12] = 0u;
    v4[9] = 0u;
    v4[10] = 0u;
    v4[7] = 0u;
    v4[8] = 0u;
    v4[5] = 0u;
    v4[6] = 0u;
    v4[3] = 0u;
    v4[4] = 0u;
    v2 += 424;
    v4[1] = 0u;
    void v4[2] = 0u;
  }
  while (v4 + 16 != (_OWORD *)(a1 + 4280));
  *(void *)(a1 + 4280) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  return a1;
}

void sub_244DED710(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  sub_244D6A434("src/controller/CHIPDeviceController.cpp", 104);
  if (!*(_DWORD *)(a1 + 32))
  {
    uint64_t v8 = *(void **)a2;
    if (*(void *)a2)
    {
      if (*v8)
      {
        if (v8[2])
        {
          if (v8[3])
          {
            if (v8[4])
            {
              *a3 = 0;
              a3[1] = 0;
              a3[2] = 0;
              sub_244DB12E4((void *)(a1 + 16), (uint64_t)a3);
              if (*(_DWORD *)a3) {
                return;
              }
              uint64_t v9 = *(void *)(a1 + 24);
              if (v9) {
                *(void *)(v9 + 8) = a1;
              }
              *(void *)(a1 + 8) = *(void *)(a2 + 8);
              *(_WORD *)(a1 + 4296) = *(_WORD *)(a2 + 94);
              if (*(void *)(a2 + 24) || *(void *)(a2 + 48) || *(void *)(a2 + 80))
              {
                *a3 = 0;
                a3[1] = 0;
                a3[2] = 0;
                sub_244DEDAE0(a1, (unsigned char *)a2, (uint64_t)a3);
                if (*(_DWORD *)a3) {
                  return;
                }
                goto LABEL_15;
              }
              if (!*(unsigned char *)(a2 + 92))
              {
LABEL_15:
                *(void *)(a1 + 4280) = sub_244DE6714(*(void *)a2);
                *(_DWORD *)(a1 + 32) = 1;
                *(unsigned char *)(a1 + 37) = *(unsigned char *)(a2 + 90);
                *(unsigned char *)(a1 + 38) = *(unsigned char *)(a2 + 91);
                if (*(unsigned char *)(a1 + 36))
                {
                  uint64_t v10 = sub_244CC8484(9u, "Controller");
                  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
                  {
                    int v11 = *(unsigned __int8 *)(a1 + 36);
                    uint64_t v12 = sub_244B94EE0(a1);
                    if (v12) {
                      int v13 = *(_DWORD *)(v12 + 12);
                    }
                    else {
                      int v13 = 0;
                    }
                    uint64_t v16 = sub_244B94EE0(a1);
                    if (v16) {
                      int v17 = *(_DWORD *)(v16 + 8);
                    }
                    else {
                      int v17 = 0;
                    }
                    uint64_t v18 = sub_244B94EE0(a1);
                    if (v18) {
                      int v19 = *(_DWORD *)(v18 + 20);
                    }
                    else {
                      int v19 = 0;
                    }
                    uint64_t v20 = sub_244B94EE0(a1);
                    if (v20) {
                      int v21 = *(_DWORD *)(v20 + 16);
                    }
                    else {
                      int v21 = 0;
                    }
                    *(_DWORD *)buf = 67110144;
                    int v24 = v11;
                    __int16 v25 = 1024;
                    int v26 = v13;
                    __int16 v27 = 1024;
                    int v28 = v17;
                    __int16 v29 = 1024;
                    int v30 = v19;
                    __int16 v31 = 1024;
                    int v32 = v21;
                    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "Joined the fabric at index %d. Fabric ID is 0x%08X%08X (Compressed Fabric ID: %08X%08X)", buf, 0x20u);
                  }
                  if (sub_244CC4E58(2u))
                  {
                    sub_244B94EE0(a1);
                    sub_244B94EE0(a1);
                    sub_244B94EE0(a1);
                    sub_244B94EE0(a1);
                    sub_244CC4DE0(9u, 2);
                  }
                }
                int v7 = 0;
                int v6 = 155;
                goto LABEL_25;
              }
              uint64_t v14 = *(void *)(*(void *)a2 + 72);
              if (*(unsigned char *)(v14 + 2642))
              {
                uint64_t v15 = sub_24479DC2C((unsigned char *)(a2 + 92));
                if (sub_244D9EA90(v14, *v15))
                {
                  *(unsigned char *)(a1 + 36) = *sub_24479DC2C((unsigned char *)(a2 + 92));
                  goto LABEL_15;
                }
                unint64_t v22 = sub_244CC8484(9u, "Controller");
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_ERROR, "There is no fabric corresponding to the given fabricIndex", buf, 2u);
                }
                if (sub_244CC4E58(1u)) {
                  sub_244CC4DE0(9u, 1);
                }
                int v6 = 137;
              }
              else
              {
                int v6 = 129;
              }
            }
            else
            {
              int v6 = 116;
            }
          }
          else
          {
            int v6 = 113;
          }
        }
        else
        {
          int v6 = 110;
        }
      }
      else
      {
        int v6 = 109;
      }
    }
    else
    {
      int v6 = 107;
    }
    int v7 = 47;
    goto LABEL_25;
  }
  int v6 = 106;
  int v7 = 3;
LABEL_25:
  *(_DWORD *)a3 = v7;
  a3[1] = "src/controller/CHIPDeviceController.cpp";
  *((_DWORD *)a3 + 4) = v6;
}

void sub_244DEDAE0(uint64_t a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  memset(v55, 0, 24);
  v55[3] = &unk_26F954540;
  long long v56 = 0u;
  long long v57 = 0u;
  __int16 v58 = 0;
  int v59 = 16842751;
  uint64_t v60 = 0;
  sub_2446D80B8((uint64_t)v55);
  uint64_t v47 = 0;
  long long v48 = &unk_244EC2D00;
  uint64_t v46 = 0;
  __int16 v7 = *((_WORD *)a2 + 47);
  uint64_t v8 = *((void *)a2 + 3);
  int v9 = a2[32];
  uint64_t v10 = sub_244CC4D84(0x190uLL);
  if (v10)
  {
    int v11 = v10;
    uint64_t v12 = sub_244CC4D84(0x190uLL);
    if (!v12)
    {
      *(_DWORD *)a3 = 11;
      *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
      *(_DWORD *)(a3 + 16) = 186;
LABEL_11:
      j__free(v11);
      goto LABEL_12;
    }
    int v13 = v12;
    uint64_t v14 = sub_244CC4D84(0x190uLL);
    if (!v14)
    {
      *(_DWORD *)a3 = 11;
      *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
      *(_DWORD *)(a3 + 16) = 187;
      goto LABEL_10;
    }
    uint64_t v15 = v14;
    sub_24479476C(&v44, (uint64_t)v11, 400);
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    sub_244D95190(*((void *)a2 + 9), *((void *)a2 + 10), (uint64_t)&v44, a3);
    if (*(_DWORD *)a3
      || (*(void *)a3 = 0,
          *(void *)(a3 + 8) = 0,
          *(void *)(a3 + 16) = 0,
          sub_2446C1098(&v49, v44, v45),
          sub_244D93C10((uint64_t)&v49, &v48, (void *)a3),
          *(_DWORD *)a3))
    {
LABEL_6:
      j__free(v15);
LABEL_10:
      j__free(v13);
      goto LABEL_11;
    }
    uint64_t v49 = &unk_26F954540;
    long long v50 = *v48;
    long long v17 = v48[2];
    long long v16 = v48[3];
    char v18 = *((unsigned char *)v48 + 64);
    long long v51 = v48[1];
    char v54 = v18;
    long long v53 = v16;
    long long v52 = v17;
    long long v43 = 0uLL;
    if (*((void *)a2 + 8))
    {
      sub_24479476C(buf, (uint64_t)v13, 400);
      long long v43 = *(_OWORD *)buf;
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      sub_244D95190(*((void *)a2 + 7), *((void *)a2 + 8), (uint64_t)&v43, a3);
      if (*(_DWORD *)a3) {
        goto LABEL_6;
      }
    }
    else
    {
      int v19 = sub_244CC8484(9u, "Controller");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_DEFAULT, "Intermediate CA is not needed", buf, 2u);
      }
      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(9u, 2);
      }
    }
    sub_24479476C(&v41, (uint64_t)v15, 400);
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    sub_244D95190(*((void *)a2 + 5), *((void *)a2 + 6), (uint64_t)&v41, a3);
    if (*(_DWORD *)a3) {
      goto LABEL_6;
    }
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    sub_2446C1098(buf, v41, v42);
    sub_244D93CC0((uint64_t)buf, &v46, &v47, (void *)a3);
    if (*(_DWORD *)a3) {
      goto LABEL_6;
    }
    uint64_t v20 = *(void *)(*(void *)a2 + 72);
    if (a2[88]) {
      int v21 = sub_244D9EA08(*(void *)(*(void *)a2 + 72), (uint64_t)&v49, v47, v46);
    }
    else {
      int v21 = sub_244D9E84C(*(void *)(*(void *)a2 + 72), (uint64_t)&v49, v47);
    }
    uint64_t v34 = v20;
    if (v21) {
      uint64_t v22 = *((unsigned __int8 *)v21 + 137);
    }
    else {
      uint64_t v22 = 0;
    }
    unsigned __int8 v40 = v22;
    char v23 = a2[89];
    if (a2[88]) {
      *(_WORD *)(v34 + 2644) |= 0x40u;
    }
    unsigned __int8 v24 = v23 ^ 1;
    if (v8)
    {
      if (v21)
      {
        sub_2446C1098(v37, v41, v42);
        sub_2446C1098(v36, v43, *((uint64_t *)&v43 + 1));
        uint64_t v25 = v22;
        int v26 = (void *)v34;
        sub_244DA3204(v34, v25, (uint64_t)v37, (uint64_t)v36, v8, v9 != 0, v24, buf);
LABEL_33:
        uint64_t v27 = *(void *)buf;
        int v28 = *(const char **)&buf[8];
        uint64_t v3 = v39;
        goto LABEL_34;
      }
      sub_2446C1098(v37, v44, v45);
      int v26 = (void *)v34;
      sub_244DA26F4((unsigned __int8 *)v34, (uint64_t)buf);
      uint64_t v27 = *(void *)buf;
      if (!*(_DWORD *)buf)
      {
        sub_2446C1098(v37, v41, v42);
        sub_2446C1098(v36, v43, *((uint64_t *)&v43 + 1));
        int v26 = (void *)v34;
        sub_244DA2B84(v34, (uint64_t)v37, (uint64_t)v36, v7, v8, v9 != 0, v24, &v40, (uint64_t)buf);
        goto LABEL_33;
      }
    }
    else
    {
      if (v21)
      {
        if ((sub_244DA23A4(v34, v22) & 1) == 0)
        {
          *(_DWORD *)a3 = 16;
          *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
          int v32 = 287;
          goto LABEL_49;
        }
        uint64_t v33 = v40;
        sub_2446C1098(v37, v41, v42);
        sub_2446C1098(v36, v43, *((uint64_t *)&v43 + 1));
        sub_244DA3204(v34, v33, (uint64_t)v37, (uint64_t)v36, 0, 0, v24, buf);
        uint64_t v27 = *(void *)buf;
        int v28 = *(const char **)&buf[8];
        uint64_t v3 = v39;
        int v26 = (void *)v34;
LABEL_34:
        if (!v27)
        {
LABEL_35:
          sub_244DA3634(v26, (uint64_t)buf);
          uint64_t v29 = *(void *)&buf[8];
          int v30 = *(_DWORD *)buf;
          uint64_t v31 = v39;
          *(void *)a3 = *(void *)buf;
          *(void *)(a3 + 8) = v29;
          *(void *)(a3 + 16) = v31;
          if (v30) {
            goto LABEL_6;
          }
          if (v40)
          {
            *(unsigned char *)(a1 + 36) = v40;
            *(unsigned char *)(a1 + 39) = v24;
            *(_DWORD *)a3 = 0;
            *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
            int v32 = 329;
          }
          else
          {
            *(_DWORD *)a3 = 172;
            *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
            int v32 = 325;
          }
LABEL_49:
          *(_DWORD *)(a3 + 16) = v32;
          goto LABEL_6;
        }
LABEL_46:
        uint64_t v35 = v27;
        sub_244DA0B38((uint64_t)v26);
        *(void *)a3 = v35;
        *(void *)(a3 + 8) = v28;
        *(void *)(a3 + 16) = v3;
        goto LABEL_6;
      }
      sub_2446C1098(v37, v44, v45);
      int v26 = (void *)v34;
      sub_244DA26F4((unsigned __int8 *)v34, (uint64_t)buf);
      uint64_t v27 = *(void *)buf;
      if (!*(_DWORD *)buf)
      {
        sub_2446C1098(v37, v41, v42);
        sub_2446C1098(v36, v43, *((uint64_t *)&v43 + 1));
        sub_244DA2B84(v34, (uint64_t)v37, (uint64_t)v36, v7, 0, 0, v24, &v40, (uint64_t)buf);
        uint64_t v27 = *(void *)buf;
        if (!*(_DWORD *)buf)
        {
          if (sub_244DA23A4(v34, v40)) {
            goto LABEL_35;
          }
          LODWORD(v3) = 307;
          uint64_t v27 = 0x1000000010;
          int v28 = "src/controller/CHIPDeviceController.cpp";
          goto LABEL_46;
        }
      }
    }
    int v28 = *(const char **)&buf[8];
    uint64_t v3 = v39;
    goto LABEL_46;
  }
  *(_DWORD *)a3 = 11;
  *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
  *(_DWORD *)(a3 + 16) = 185;
LABEL_12:
  sub_2446D80B8((uint64_t)v55);
}

__n128 sub_244DEE144@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 36))
  {
    *(_DWORD *)a6 = 172;
    *(void *)(a6 + 8) = "src/controller/CHIPDeviceController.cpp";
    int v17 = 336;
LABEL_10:
    *(_DWORD *)(a6 + 16) = v17;
    return result;
  }
  uint64_t v8 = *(void *)(a1 + 4280);
  if (!v8)
  {
    *(_DWORD *)a6 = 172;
    *(void *)(a6 + 8) = "src/controller/CHIPDeviceController.cpp";
    int v17 = 337;
    goto LABEL_10;
  }
  int v13 = *(void **)(v8 + 72);
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  int v35 = 0;
  uint64_t v36 = 0;
  int v33 = 0;
  uint64_t v34 = 0;
  *(void *)(a6 + 8) = 0;
  *(void *)(a6 + 16) = 0;
  *(void *)a6 = 0;
  sub_244D93CC0(a2, &v37, &v38, (void *)a6);
  if (*(_DWORD *)a6) {
    return result;
  }
  *(void *)a6 = 0;
  *(void *)(a6 + 8) = 0;
  *(void *)(a6 + 16) = 0;
  sub_244D9F2C8((uint64_t)v13, *(unsigned __int8 *)(a1 + 36), (uint64_t)&v35, (void *)a6);
  if (*(_DWORD *)a6) {
    return result;
  }
  *(void *)a6 = 0;
  *(void *)(a6 + 8) = 0;
  *(void *)(a6 + 16) = 0;
  sub_244D93E48(a2, (uint64_t)&v33, (void *)a6);
  if (*(_DWORD *)a6) {
    return result;
  }
  uint64_t v15 = (void *)sub_244B94EE0(a1);
  BOOL v16 = *v15 != v37 || !sub_244B2B7E8((uint64_t)&v35, (uint64_t)&v33);
  if (a4)
  {
    uint64_t v18 = *(unsigned __int8 *)(a1 + 36);
    int v19 = *(unsigned __int8 *)(a1 + 39);
    uint64_t v20 = (uint64_t)v13;
    uint64_t v21 = a2;
    uint64_t v22 = a3;
    uint64_t v23 = a4;
    char v24 = a5;
    goto LABEL_17;
  }
  if ((sub_244DA23A4((uint64_t)v13, *(unsigned __int8 *)(a1 + 36)) & 1) == 0)
  {
    *(_DWORD *)a6 = 16;
    *(void *)(a6 + 8) = "src/controller/CHIPDeviceController.cpp";
    int v17 = 361;
    goto LABEL_10;
  }
  uint64_t v18 = *(unsigned __int8 *)(a1 + 36);
  int v19 = *(unsigned __int8 *)(a1 + 39);
  uint64_t v20 = (uint64_t)v13;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = 0;
  char v24 = 0;
LABEL_17:
  sub_244DA3204(v20, v18, v21, v22, v23, v24, v19, &v30);
  int v25 = v30;
  __n128 v39 = v31;
  int v40 = v32;
  int v26 = (__n128 *)(a6 + 4);
  if (v30)
  {
    sub_244DA0B38((uint64_t)v13);
    *(_DWORD *)a6 = v25;
    result.n128_u64[0] = v39.n128_u64[0];
    *int v26 = v39;
    *(_DWORD *)(a6 + 20) = v40;
    return result;
  }
  sub_244DA3634(v13, (uint64_t)&v30);
  int v27 = v30;
  int v28 = v32;
  int v40 = v32;
  __n128 result = v31;
  __n128 v39 = v31;
  *(_DWORD *)a6 = v30;
  *int v26 = result;
  *(_DWORD *)(a6 + 20) = v28;
  if (!v27)
  {
    if (v16) {
      sub_244D89DEC(*(void *)(*(void *)(a1 + 4280) + 40), *(unsigned __int8 *)(a1 + 36));
    }
    uint64_t v29 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_2446BD000, v29, OS_LOG_TYPE_DEFAULT, "Controller NOC chain has updated", (uint8_t *)&v30, 2u);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    *(_DWORD *)a6 = 0;
    *(void *)(a6 + 8) = "src/controller/CHIPDeviceController.cpp";
    int v17 = 383;
    goto LABEL_10;
  }
  return result;
}

void sub_244DEE434(uint64_t a1)
{
  sub_244D6A434("src/controller/CHIPDeviceController.cpp", 388);
  if (*(_DWORD *)(a1 + 32))
  {
    uint64_t v2 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_INFO, "Shutting down the controller", v5, 2u);
    }
    if (sub_244CC4E58(3u)) {
      sub_244CC4DE0(9u, 3);
    }
    *(_DWORD *)(a1 + 32) = 0;
    if (*(unsigned char *)(a1 + 36))
    {
      uint64_t v3 = sub_244DBE094();
      sub_244DBEB1C(v3, *(unsigned char *)(a1 + 36));
      sub_244DBADCC(*(void *)(*(void *)(a1 + 4280) + 96));
      uint64_t v4 = *(void *)(*(void *)(a1 + 4280) + 80);
      v5[0] = *(unsigned char *)(a1 + 36);
      sub_244CC6478((void *)(v4 + 56), (uint64_t)v5, (unsigned int (*)(uint64_t))sub_244E04128);
      sub_244D89DEC(*(void *)(*(void *)(a1 + 4280) + 40), *(unsigned __int8 *)(a1 + 36));
      if (*(unsigned char *)(a1 + 38))
      {
        sub_244DA0608(*(void *)(*(void *)(a1 + 4280) + 72), *(unsigned __int8 *)(a1 + 36), (uint64_t)v5);
      }
      else if (*(unsigned char *)(a1 + 37))
      {
        sub_244DA192C(*(void *)(*(void *)(a1 + 4280) + 72), *(unsigned __int8 *)(a1 + 36));
      }
    }
    sub_244DE6754(*(void *)(a1 + 4280));
    *(void *)(a1 + 4280) = 0;
    sub_244DB13A4(a1 + 16);
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t sub_244DEE590@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, __int16 *a4@<X3>, void *a5@<X8>)
{
  if (*(_DWORD *)(result + 32) == 1)
  {
    long long v12 = xmmword_268EC34EC;
    char v13 = 0;
    __int16 v14 = 5540;
    int v15 = 0;
    uint64_t v16 = 0;
    a5[1] = 0;
    a5[2] = 0;
    *a5 = 0;
    uint64_t v8 = *(void *)(*(void *)(result + 4280) + 96);
    uint64_t v9 = *(unsigned __int8 *)(result + 36);
    v11[0] = a2;
    v11[1] = v9;
    __n128 result = sub_244DBAE1C(v8, v11, (uint64_t)&v12, 0, a5);
    if (*(_DWORD *)a5) {
      return result;
    }
    *a3 = v12;
    *a4 = v14;
    *(_DWORD *)a5 = 0;
    a5[1] = "src/controller/CHIPDeviceController.cpp";
    int v10 = 439;
  }
  else
  {
    *(_DWORD *)a5 = 3;
    a5[1] = "src/controller/CHIPDeviceController.cpp";
    int v10 = 434;
  }
  *((_DWORD *)a5 + 4) = v10;
  return result;
}

uint64_t sub_244DEE674@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  if (*(_DWORD *)(result + 32) == 1)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    uint64_t v5 = *(void *)(*(void *)(result + 4280) + 96);
    uint64_t v6 = *(unsigned __int8 *)(result + 36);
    v9[0] = a2;
    v9[1] = v6;
    __n128 result = sub_244DBAE1C(v5, v9, a3, 0, a4);
    if (*(_DWORD *)a4) {
      return result;
    }
    int v7 = 0;
    int v8 = 447;
  }
  else
  {
    int v8 = 444;
    int v7 = 3;
  }
  *(_DWORD *)a4 = v7;
  a4[1] = "src/controller/CHIPDeviceController.cpp";
  *((_DWORD *)a4 + 4) = v8;
  return result;
}

void sub_244DEE704(uint64_t a1@<X1>, int a2@<W2>, uint64_t *a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  int v6 = a2;
  a5[1] = 0;
  a5[2] = 0;
  *a5 = 0;
  sub_244CDE6C0(a4, a1, a3, 0, &v6, a5);
  if (!*(_DWORD *)a5)
  {
    *(_DWORD *)a5 = 0;
    a5[1] = "src/controller/CHIPDeviceController.cpp";
    *((_DWORD *)a5 + 4) = 455;
  }
}

uint64_t sub_244DEE76C(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 4280) + 40);
}

uint64_t sub_244DEE77C(uint64_t a1)
{
  uint64_t v2 = (unsigned char *)(a1 + 9106);
  uint64_t v3 = (unsigned char *)(a1 + 4872);
  uint64_t v4 = a1 + 4344;
  uint64_t v5 = sub_244DED614(a1);
  *(void *)uint64_t v5 = &unk_26F959B80;
  *(void *)(v5 + 4304) = &unk_26F959BD8;
  *(void *)(v5 + 4312) = &unk_26F959C80;
  *(void *)(v5 + 4320) = 0;
  *(_OWORD *)(v5 + 4328) = 0u;
  *(_WORD *)(v5 + 4344) = 1;
  *(void *)(v5 + 4376) = 0;
  *(_OWORD *)(v5 + 4449) = 0u;
  *(_OWORD *)(v5 + 4440) = 0u;
  *(_OWORD *)(v5 + 4408) = 0u;
  *(_OWORD *)(v5 + 4424) = 0u;
  *(void *)(v5 + 4448) = v5 + 4432;
  *(void *)(v5 + 4440) = v5 + 4432;
  *(_OWORD *)(v5 + 4472) = xmmword_268EC34EC;
  *(unsigned char *)(v4 + 144) = 0;
  *(_WORD *)(v5 + 4490) = 5540;
  *(unsigned char *)(v4 + 168) = 0;
  *(_WORD *)(v5 + 4611) = 0;
  *(unsigned char *)(v5 + 4508) = 0;
  *(_OWORD *)(v5 + 4492) = 0u;
  *(void *)(v5 + 4648) = 0;
  *(_OWORD *)(v5 + 4632) = 0u;
  *(void *)(v5 + 4664) = v5 + 4656;
  *(void *)(v5 + 4656) = v5 + 4656;
  *(void *)(v5 + 4672) = 0;
  *(void *)(v5 + 4680) = v5;
  *(void *)(v5 + 4688) = sub_244DEEA44;
  *(void *)(v5 + 4704) = v5 + 4696;
  *(void *)(v5 + 4696) = v5 + 4696;
  *(void *)(v5 + 4712) = 0;
  *(void *)(v5 + 4720) = v5;
  *(void *)(v5 + 4728) = sub_244DEECA8;
  *(void *)(v5 + 4744) = v5 + 4736;
  *(void *)(v5 + 4736) = v5 + 4736;
  *(void *)(v5 + 4752) = 0;
  *(void *)(v5 + 4760) = v5;
  *(void *)(v5 + 4768) = sub_244DEEF20;
  *(void *)(v5 + 4784) = v5 + 4776;
  *(void *)(v5 + 4776) = v5 + 4776;
  *(void *)(v5 + 4792) = 0;
  *(void *)(v5 + 4800) = v5;
  *(void *)(v5 + 4808) = sub_244DEF158;
  *(void *)(v5 + 4824) = v5 + 4816;
  *(void *)(v5 + 4816) = v5 + 4816;
  *(void *)(v5 + 4832) = 0;
  *(void *)(v5 + 4840) = v5;
  *(void *)(v5 + 4848) = sub_244DEF760;
  *(void *)(v5 + 4856) = &unk_26F959A98;
  *(void *)(v5 + 4864) = 0;
  unsigned char *v3 = 0;
  *(_DWORD *)(v5 + 4896) = 0;
  *(_OWORD *)(v5 + 4880) = 0u;
  *(void *)(v5 + 4904) = v5;
  *(void *)(v5 + 4925) = 0;
  *(_OWORD *)(v5 + 4912) = 0u;
  v3[61] = 2;
  v3[368] = 0;
  *(_DWORD *)(v5 + 5248) = 0;
  *(_DWORD *)(v5 + 4944) = 0;
  *(void *)(v5 + 4936) = 0;
  *(unsigned char *)(v5 + 5000) = 0;
  *(_OWORD *)(v5 + 4968) = 0u;
  *(_OWORD *)(v5 + 4984) = 0u;
  *(_OWORD *)(v5 + 4952) = 0u;
  *(void *)(v5 + 5256) = "src/controller/SetUpCodePairer.h";
  *(_DWORD *)(a1 + 5264) = 221;
  sub_244DE0F14(v5 + 5272);
  *(_OWORD *)(a1 + 9064) = 0u;
  *(_DWORD *)(a1 + 9080) = 0;
  *(void *)(a1 + 9088) = "src/controller/CommissioningDelegate.h";
  *(_DWORD *)(a1 + 9096) = 116;
  *(unsigned char *)(a1 + 9104) = 0;
  *uint64_t v2 = 0;
  v2[4] = 0;
  v2[6] = 0;
  *(_OWORD *)(a1 + 9120) = 0u;
  *(_OWORD *)(a1 + 9144) = 0u;
  return a1;
}

void sub_244DEEA44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  LODWORD(v16) = 1;
  int v17 = "core_dcm_operational_setup";
  int v18 = 0;
  char v19 = 3;
  sub_244D7E78C((uint64_t)&v16);
  if ((*(unsigned char *)(a1 + 4344) & 0xFE) != 0x1E) {
    sub_244E2C114();
  }
  uint64_t v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 4328) + 24))(*(void *)(a1 + 4328));
  if (v6 != (*(uint64_t (**)(void))(*(void *)*a3 + 48))()) {
    sub_244E2C074();
  }
  sub_244DF34EC(a1);
  uint64_t v16 = -1;
  char v21 = 0;
  sub_244E042A4((uint64_t)v9, a2, a3);
  v11.n128_u64[0] = (unint64_t)&unk_26F9593F8;
  v11.n128_u64[1] = v9[1];
  uint64_t v12 = v9[2];
  sub_244D88108(v13, v10);
  *(_OWORD *)&v13[40] = *(_OWORD *)&v10[40];
  sub_244DF9A44((uint64_t)&v16, &v11);
  v11.n128_u64[0] = (unint64_t)&unk_26F9593F8;
  sub_244D87F44(v13);
  v9[0] = &unk_26F9593F8;
  sub_244D87F44(v10);
  LODWORD(v7) = 0;
  *((void *)&v7 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v8 = 2107;
  sub_244E04164((uint64_t)v14, (uint64_t)&v16);
  v15[72] = v21;
  sub_244DF2F10(a1, &v7, (uint64_t)v14);
  if (v14[0] == 4)
  {
    v14[1] = &unk_26F9593F8;
    sub_244D87F44(v15);
  }
  if (v16 == 4)
  {
    int v17 = (const char *)&unk_26F9593F8;
    sub_244D87F44(&v20);
  }
}

void sub_244DEECA8(uint64_t a1, void *a2, int *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(_DWORD *)buf = 1;
  *(void *)&buf[8] = "core_dcm_operational_setup";
  LODWORD(v15) = *a3;
  BYTE4(v15) = 3;
  sub_244D7E78C((uint64_t)buf);
  if ((*(unsigned char *)(a1 + 4344) & 0xFE) != 0x1E) {
    sub_244E2C254();
  }
  if ((*(uint64_t (**)(void))(**(void **)(a1 + 4328) + 24))(*(void *)(a1 + 4328)) != *a2) {
    sub_244E2C1B4();
  }
  sub_244DF34EC(a1);
  int v6 = *a3;
  long long v7 = sub_244CC8484(9u, "Controller");
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)buf = *(_OWORD *)a3;
      uint64_t v15 = *((void *)a3 + 2);
      uint64_t v9 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_DEFAULT, "Device connection failed. Error %s", buf, 0xCu);
    }
    if (sub_244CC4E58(2u))
    {
      *(_OWORD *)buf = *(_OWORD *)a3;
      uint64_t v15 = *((void *)a3 + 2);
      sub_244CB7B34((const char **)buf, 1);
      sub_244CC4DE0(9u, 2);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "Device connection failed without a valid error code.", buf, 2u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    *a3 = 172;
    *((void *)a3 + 1) = "src/controller/CHIPDeviceController.cpp";
    a3[4] = 2128;
  }
  long long v10 = *(_OWORD *)a3;
  uint64_t v11 = *((void *)a3 + 2);
  v12[0] = -1;
  v13[72] = 0;
  sub_244DF2F10(a1, &v10, (uint64_t)v12);
  if (v12[0] == 4)
  {
    v12[1] = &unk_26F9593F8;
    sub_244D87F44(v13);
  }
}

uint64_t sub_244DEEF20(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned __int16 a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v8 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    unint64_t v9 = *a2;
    unint64_t v10 = HIDWORD(*a2);
    int v11 = *((unsigned __int8 *)a2 + 8);
    *(_OWORD *)buf = *(_OWORD *)a3;
    *(void *)uint64_t v20 = *(void *)(a3 + 16);
    uint64_t v12 = sub_244CB7B34((const char **)buf, 1);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v9;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)uint64_t v20 = v11;
    *(_WORD *)&v20[4] = 2080;
    *(void *)&v20[6] = v12;
    __int16 v21 = 1024;
    int v22 = a4;
    _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "Session establishment failed for <%08X%08X, %d>, error: %s.  Next retry expected to get a response to Sigma1 or fail within %d seconds", buf, 0x24u);
  }
  if (sub_244CC4E58(1u))
  {
    *(_OWORD *)buf = *(_OWORD *)a3;
    *(void *)uint64_t v20 = *(void *)(a3 + 16);
    sub_244CB7B34((const char **)buf, 1);
    sub_244CC4DE0(9u, 1);
  }
  if ((*(unsigned char *)(a1 + 4344) & 0xFE) != 0x1E) {
    sub_244E2C394();
  }
  uint64_t v13 = (*(uint64_t (**)(void))(**(void **)(a1 + 4328) + 24))(*(void *)(a1 + 4328));
  if (v13 != *a2) {
    sub_244E2C2F4();
  }
  uint64_t result = sub_244DF0570(a1, v13);
  if (result)
  {
    unsigned __int16 v15 = a4 + 60;
    if (a4 > 0xFFC3u) {
      unsigned __int16 v15 = -1;
    }
    unsigned int v16 = *(unsigned __int8 *)(a1 + 4344);
    v17[0] = 1;
    int v18 = 30000;
    return sub_244DF5808(a1, result, v16, v15, v17, (uint64_t)sub_244DF9AF0, (void (*)(uint64_t, long long *))sub_244DF9BC4, 1);
  }
  return result;
}

void sub_244DEF158(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  int v6 = sub_244D7DFA0();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "OnDeviceAttestationInformationVerification";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  if (*(unsigned char *)(a1 + 4344) != 13)
  {
    if (!*(void *)(a1 + 4328))
    {
      __int16 v14 = sub_244CC8484(9u, "Controller");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "Device attestation verification result received when we're not commissioning a device", buf, 2u);
      }
      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(9u, 1);
      }
      goto LABEL_41;
    }
    uint64_t v8 = (*(uint64_t (**)(void))(**(void **)(a1 + 9064) + 24))(*(void *)(a1 + 9064));
    uint64_t v9 = *(void *)(v8 + 584);
    if (!*(unsigned char *)(v8 + 570) || (unint64_t v10 = sub_244DF4D78((unsigned char *)(v8 + 570)), v11 = (unsigned __int16)*v10, !*v10))
    {
      int v11 = a3;
      if (!a3)
      {
        if (v9 && (*(unsigned int (**)(uint64_t))(*(void *)v9 + 32))(v9))
        {
          sub_244DF4D9C(a1, a2, 0);
          goto LABEL_41;
        }
        int v18 = sub_244CC8484(9u, "Controller");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_DEFAULT, "Successfully validated 'Attestation Information' command received from the device.", buf, 2u);
        }
        if (sub_244CC4E58(2u)) {
          sub_244CC4DE0(9u, 2);
        }
        LODWORD(v19) = 0;
        *((void *)&v19 + 1) = "src/controller/CHIPDeviceController.cpp";
        int v20 = 1344;
        v27[0] = -1;
        v28[72] = 0;
        sub_244DF2F10(a1, &v19, (uint64_t)v27);
        if (v27[0] == 4)
        {
          v27[1] = &unk_26F9593F8;
          unsigned int v16 = (uint64_t *)v28;
          goto LABEL_40;
        }
        goto LABEL_41;
      }
    }
    char v39 = 0;
    *(_WORD *)&buf[8] = v11;
    *(void *)buf = 6;
    uint64_t v12 = sub_244CC8484(9u, "Controller");
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v11 == 0xFFFF)
    {
      if (v13)
      {
        *(_WORD *)__n128 v31 = 0;
        _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "Failed in verifying 'Attestation Information' command received from the device due to default DeviceAttestationVerifier Class not being overridden by a real implementation.", v31, 2u);
      }
      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(9u, 1);
      }
      LODWORD(v23) = 45;
      *((void *)&v23 + 1) = "src/controller/CHIPDeviceController.cpp";
      int v24 = 1313;
      unsigned __int16 v15 = v33;
      sub_244E04164((uint64_t)v33, (uint64_t)buf);
      char v34 = v39;
      sub_244DF2F10(a1, &v23, (uint64_t)v33);
      if (v33[0] == 4)
      {
        v33[1] = &unk_26F9593F8;
LABEL_37:
        sub_244D87F44(v15 + 4);
      }
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)__n128 v31 = 67109120;
        int v32 = v11;
        _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "Failed in verifying 'Attestation Information' command received from the device: err %hu. Look at AttestationVerificationResult enum to understand the errors", v31, 8u);
      }
      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(9u, 1);
      }
      if (v9)
      {
        sub_244DF4D9C(a1, a2, v11);
        goto LABEL_38;
      }
      LODWORD(v21) = 172;
      *((void *)&v21 + 1) = "src/controller/CHIPDeviceController.cpp";
      int v22 = 1332;
      unsigned __int16 v15 = v29;
      sub_244E04164((uint64_t)v29, (uint64_t)buf);
      char v30 = v39;
      sub_244DF2F10(a1, &v21, (uint64_t)v29);
      if (v29[0] == 4)
      {
        v29[1] = &unk_26F9593F8;
        goto LABEL_37;
      }
    }
LABEL_38:
    if (*(void *)buf != 4) {
      goto LABEL_41;
    }
    goto LABEL_39;
  }
  char v39 = 0;
  *(_WORD *)&buf[8] = a3;
  *(void *)buf = 6;
  if (a3) {
    int v7 = 172;
  }
  else {
    int v7 = 0;
  }
  LODWORD(v25) = v7;
  *((void *)&v25 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v26 = 1283;
  sub_244E04164((uint64_t)v35, (uint64_t)buf);
  v36[72] = v39;
  sub_244DF2F10(a1, &v25, (uint64_t)v35);
  if (v35[0] == 4)
  {
    v35[1] = &unk_26F9593F8;
    sub_244D87F44(v36);
  }
  if (*(void *)buf == 4)
  {
LABEL_39:
    *(void *)&buf[8] = &unk_26F9593F8;
    unsigned int v16 = &v38;
LABEL_40:
    sub_244D87F44(v16);
  }
LABEL_41:
  int v17 = sub_244D7DFA0();
  if (os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "OnDeviceAttestationInformationVerification";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DEF760(uint64_t a1, long long *a2, long long *a3, long long *a4, long long *a5, unsigned char *a6, unsigned char *a7)
{
  v44[2] = *MEMORY[0x263EF8340];
  __int16 v14 = sub_244D7DFA0();
  if (os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "OnDeviceNOCChainGeneration";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  v44[0] = 0;
  v44[1] = 0;
  if (!*(_DWORD *)a2 && !*a6)
  {
    unsigned __int16 v15 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "Did not have an IPK from the OperationalCredentialsIssuer! Cannot commission.", buf, 2u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    *(_DWORD *)a2 = 47;
    *((void *)a2 + 1) = "src/controller/CHIPDeviceController.cpp";
    *((_DWORD *)a2 + 4) = 1600;
  }
  unsigned int v16 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    long long v35 = *a2;
    uint64_t v36 = *((void *)a2 + 2);
    int v17 = sub_244CB7B34((const char **)&v35, 1);
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v17;
    _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_DEFAULT, "Received callback from the CA for NOC Chain generation. Status %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    long long v33 = *a2;
    uint64_t v34 = *((void *)a2 + 2);
    sub_244CB7B34((const char **)&v33, 1);
    sub_244CC4DE0(9u, 2);
  }
  if (!*(_DWORD *)a2)
  {
    if (*(_DWORD *)(a1 + 32) == 1) {
      goto LABEL_21;
    }
    *(_DWORD *)a2 = 3;
    *((void *)a2 + 1) = "src/controller/CHIPDeviceController.cpp";
    *((_DWORD *)a2 + 4) = 1606;
  }
  int v18 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    long long v31 = *a2;
    uint64_t v32 = *((void *)a2 + 2);
    long long v19 = sub_244CB7B34((const char **)&v31, 1);
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v19;
    _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_ERROR, "Failed in generating device's operational credentials. Error %s", buf, 0xCu);
  }
  if (sub_244CC4E58(1u))
  {
    long long v29 = *a2;
    uint64_t v30 = *((void *)a2 + 2);
    sub_244CB7B34((const char **)&v29, 1);
    sub_244CC4DE0(9u, 1);
  }
LABEL_21:
  char v43 = 0;
  long long v25 = *a4;
  long long v26 = *a3;
  long long v24 = *a5;
  if (*a6) {
    int v20 = *(void **)sub_244CD3130(a6);
  }
  else {
    int v20 = v44;
  }
  if (*a7)
  {
    long long v21 = (uint64_t *)sub_24479DC08(a7);
LABEL_27:
    uint64_t v22 = *v21;
    goto LABEL_28;
  }
  long long v21 = (uint64_t *)sub_244B94EE0(a1);
  if (v21) {
    goto LABEL_27;
  }
  uint64_t v22 = 0;
LABEL_28:
  *(_OWORD *)&buf[8] = v26;
  v40[0] = v25;
  v40[1] = v24;
  uint64_t v41 = v20;
  uint64_t v42 = v22;
  *(void *)buf = 3;
  long long v27 = *a2;
  uint64_t v28 = *((void *)a2 + 2);
  sub_244E04164((uint64_t)v37, (uint64_t)buf);
  v38[72] = v43;
  sub_244DF2F10(a1, &v27, (uint64_t)v37);
  if (v37[0] == 4)
  {
    v37[1] = &unk_26F9593F8;
    sub_244D87F44(v38);
  }
  if (*(void *)buf == 4)
  {
    *(void *)&buf[8] = &unk_26F9593F8;
    sub_244D87F44((char *)v40 + 8);
  }
  long long v23 = sub_244D7DFA0();
  if (os_signpost_enabled(v23))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "OnDeviceNOCChainGeneration";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

uint64_t sub_244DEFC28(uint64_t a1)
{
  *(void *)a1 = &unk_26F959B80;
  *(void *)(a1 + 4304) = &unk_26F959BD8;
  *(void *)(a1 + 4312) = &unk_26F959C80;
  sub_244E043B8((uint64_t *)(a1 + 9144), 0);
  sub_244DF347C((void (****)(void))(a1 + 9128), 0);
  sub_244E04348((void (****)(void))(a1 + 9120), 0);
  sub_244DE1068(a1 + 5272);
  sub_244DEA2D4((void *)(a1 + 4856));
  uint64_t v2 = *(void (**)(uint64_t))(a1 + 4832);
  if (v2)
  {
    *(void *)(a1 + 4832) = 0;
    v2(a1 + 4816);
  }
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 4792);
  if (v3)
  {
    *(void *)(a1 + 4792) = 0;
    v3(a1 + 4776);
  }
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 4752);
  if (v4)
  {
    *(void *)(a1 + 4752) = 0;
    v4(a1 + 4736);
  }
  uint64_t v5 = *(void (**)(uint64_t))(a1 + 4712);
  if (v5)
  {
    *(void *)(a1 + 4712) = 0;
    v5(a1 + 4696);
  }
  int v6 = *(void (**)(uint64_t))(a1 + 4672);
  if (v6)
  {
    *(void *)(a1 + 4672) = 0;
    v6(a1 + 4656);
  }
  sub_244D69770((uint64_t *)(a1 + 4416));
  sub_2447E6D14((void *)(a1 + 4384));
  sub_2447E6D14((void *)(a1 + 4352));
  *(void *)a1 = &unk_26F959340;
  sub_244DB13A4(a1 + 16);
  return a1;
}

uint64_t sub_244DEFDBC(uint64_t a1)
{
  return sub_244DEFC28(a1 - 4304);
}

uint64_t sub_244DEFDC8(uint64_t a1)
{
  return sub_244DEFC28(a1 - 4312);
}

void sub_244DEFDD4(uint64_t a1)
{
  sub_244DEFC28(a1);

  JUMPOUT(0x245695FA0);
}

void sub_244DEFE0C(uint64_t a1)
{
  sub_244DEFC28(a1 - 4304);

  JUMPOUT(0x245695FA0);
}

void sub_244DEFE4C(uint64_t a1)
{
  sub_244DEFC28(a1 - 4312);

  JUMPOUT(0x245695FA0);
}

void sub_244DEFE8C(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *(void *)(a2 + 16);
  if (!v4)
  {
    int v13 = 484;
    goto LABEL_10;
  }
  a1[536] = v4;
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  long long v7 = *(_OWORD *)(a2 + 48);
  v18[2] = *(_OWORD *)(a2 + 32);
  v18[3] = v7;
  *(_OWORD *)long long v19 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)&v19[12] = *(_OWORD *)(a2 + 76);
  long long v8 = *(_OWORD *)(a2 + 16);
  v18[0] = *(_OWORD *)a2;
  v18[1] = v8;
  if (*(unsigned char *)(a2 + 92)) {
    char v21 = *(unsigned char *)(a2 + 93);
  }
  __int16 v22 = *(_WORD *)(a2 + 94);
  sub_244DED710((uint64_t)a1, (uint64_t)v18, a3);
  if (!*(_DWORD *)a3)
  {
    a1[540] = *(void *)(a2 + 96);
    uint64_t v9 = *(void *)(a2 + 112);
    a1[1144] = v9;
    if (v9)
    {
LABEL_6:
      int v10 = 0;
      int v11 = *(void **)(a2 + 104);
      if (!v11) {
        int v11 = a1 + 659;
      }
      a1[1133] = v11;
      uint64_t v12 = (void *)a1[535];
      a1[614] = *v12;
      a1[608] = v12[3];
      int v13 = 543;
      goto LABEL_11;
    }
    uint64_t v14 = sub_244DB0DC8();
    a1[1144] = v14;
    unsigned __int16 v15 = sub_244CC8484(9u, "Controller");
    unsigned int v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v17 = 0;
        _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_DEFAULT, "*** Missing DeviceAttestationVerifier configuration at DeviceCommissioner init: using global default, consider passing one in CommissionerInitParams.", v17, 2u);
      }
      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(9u, 2);
      }
      goto LABEL_6;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v17 = 0;
      _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_ERROR, "Missing DeviceAttestationVerifier configuration at DeviceCommissioner init and none set with Credentials::SetDeviceAttestationVerifier()!", v17, 2u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    int v13 = 500;
LABEL_10:
    int v10 = 47;
LABEL_11:
    *(_DWORD *)a3 = v10;
    a3[1] = "src/controller/CHIPDeviceController.cpp";
    *((_DWORD *)a3 + 4) = v13;
  }
}

void sub_244DF0074(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 32))
  {
    uint64_t v2 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_INFO, "Shutting down the commissioner", buf, 2u);
    }
    if (sub_244CC4E58(3u)) {
      sub_244CC4DE0(9u, 3);
    }
    sub_244DEC1F4(a1 + 4856, 0);
    uint64_t v3 = *(void *)(a1 + 4336);
    if (v3 && *(_DWORD *)(v3 + 72) == 1)
    {
      uint64_t v4 = sub_244CC8484(9u, "Controller");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_INFO, "Setup in progress, stopping setup before shutting down", buf, 2u);
      }
      if (sub_244CC4E58(3u)) {
        sub_244CC4DE0(9u, 3);
      }
      int v5 = 2;
      int v6 = "src/controller/CHIPDeviceController.cpp";
      int v7 = 559;
      (*(void (**)(uint64_t, int *))(*(void *)a1 + 48))(a1, &v5);
    }
    sub_244DF0214(a1);
    *(void *)buf = a1;
    sub_244CC6478((void *)(a1 + 4432), (uint64_t)buf, (unsigned int (*)(uint64_t))sub_244E04458);
    sub_244DEE434(a1);
  }
}

void sub_244DF0214(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 9128))
  {
    uint64_t v2 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = sub_244DEA240(*(unsigned __int8 *)(a1 + 4344));
      *(_DWORD *)buf = 136315138;
      int v13 = v3;
      _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_INFO, "Cancelling read request for step '%s'", buf, 0xCu);
    }
    if (sub_244CC4E58(3u))
    {
      sub_244DEA240(*(unsigned __int8 *)(a1 + 4344));
      sub_244CC4DE0(9u, 3);
    }
    sub_244DF347C((void (****)(void))(a1 + 9128), 0);
  }
  if (*(void *)(a1 + 4376))
  {
    uint64_t v4 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = sub_244DEA240(*(unsigned __int8 *)(a1 + 4344));
      *(_DWORD *)buf = 136315138;
      int v13 = v5;
      _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_INFO, "Cancelling command invocation for step '%s'", buf, 0xCu);
    }
    if (sub_244CC4E58(3u))
    {
      sub_244DEA240(*(unsigned __int8 *)(a1 + 4344));
      sub_244CC4DE0(9u, 3);
    }
    uint64_t v6 = *(void *)(a1 + 4376);
    if (!v6) {
      goto LABEL_28;
    }
    (*(void (**)(uint64_t))(*(void *)v6 + 48))(v6);
    sub_244E04718((void *)(a1 + 4352));
  }
  if (!*(void *)(a1 + 4408)) {
    goto LABEL_21;
  }
  int v7 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    long long v8 = sub_244DEA240(*(unsigned __int8 *)(a1 + 4344));
    *(_DWORD *)buf = 136315138;
    int v13 = v8;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_INFO, "Cancelling write request for step '%s'", buf, 0xCu);
  }
  if (sub_244CC4E58(3u))
  {
    sub_244DEA240(*(unsigned __int8 *)(a1 + 4344));
    sub_244CC4DE0(9u, 3);
  }
  uint64_t v9 = *(void *)(a1 + 4408);
  if (!v9) {
LABEL_28:
  }
    sub_244E04700();
  (*(void (**)(uint64_t))(*(void *)v9 + 48))(v9);
  sub_244E04718((void *)(a1 + 4384));
LABEL_21:
  if (*(void *)(a1 + 4672))
  {
    int v10 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = sub_244DEA240(*(unsigned __int8 *)(a1 + 4344));
      *(_DWORD *)buf = 136315138;
      int v13 = v11;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_INFO, "Cancelling CASE setup for step '%s'", buf, 0xCu);
    }
    if (sub_244CC4E58(3u))
    {
      sub_244DEA240(*(unsigned __int8 *)(a1 + 4344));
      sub_244CC4DE0(9u, 3);
    }
    sub_244DF34EC(a1);
  }
}

uint64_t sub_244DF0570(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v8 = a2;
  uint64_t v3 = sub_244D7DFA0();
  if (os_signpost_enabled(v3))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FindCommissioneeDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  uint64_t v7 = 0;
  *(void *)buf = &v8;
  *(void *)&buf[8] = &v7;
  sub_244CC6478((void *)(a1 + 4432), (uint64_t)buf, (unsigned int (*)(uint64_t))sub_244E04478);
  uint64_t v4 = v7;
  int v5 = sub_244D7DFA0();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FindCommissioneeDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  return v4;
}

uint64_t sub_244DF06E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0;
  v4[0] = a2;
  v4[1] = &v3;
  sub_244CC6478((void *)(a1 + 4432), (uint64_t)v4, (unsigned int (*)(uint64_t))sub_244E044E8);
  return v3;
}

void sub_244DF0730(void *a1, uint64_t a2)
{
  if (*(void *)(a1[535] + 24) && *(unsigned char *)(a2 + 56) == 2)
  {
    uint64_t v4 = sub_244CC8484(0x22u, "Discovery");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Closing all BLE connections", v5, 2u);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0x22u, 2);
    }
    sub_244CBB7C4();
  }
  if (a1[542] == a2) {
    a1[542] = 0;
  }
  if (a1[541] == a2) {
    a1[541] = 0;
  }
  sub_244DF0820((uint64_t)(a1 + 552), (void (***)(void))a2);
}

void sub_244DF0820(uint64_t a1, void (***a2)(void))
{
  if (a2)
  {
    uint64_t v4 = sub_244CC6450((void *)(a1 + 16), (uint64_t)a2);
    if (!v4) {
      sub_244E2867C();
    }
    int v5 = v4;
    void *v4 = 0;
    (**a2)(a2);
    j__free(a2);
    if (*(void *)(a1 + 40))
    {
      *(unsigned char *)(a1 + 48) = 1;
    }
    else
    {
      *(void *)(v5[1] + 16) = v5[2];
      *(void *)(v5[2] + 8) = v5[1];
      j__free(v5);
    }
    --*(void *)a1;
  }
}

uint64_t sub_244DF08D0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  if (!a3)
  {
    int v7 = 648;
LABEL_6:
    int v6 = 47;
    goto LABEL_7;
  }
  uint64_t result = sub_244DF0570(result, a2);
  if (!result)
  {
    int v7 = 651;
    goto LABEL_6;
  }
  int v6 = 0;
  *a3 = result;
  int v7 = 655;
LABEL_7:
  *(_DWORD *)a4 = v6;
  *(void *)(a4 + 8) = "src/controller/CHIPDeviceController.cpp";
  *(_DWORD *)(a4 + 16) = v7;
  return result;
}

void sub_244DF0934(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v14 = sub_244D7DFA0();
  if (os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v34 = "DeviceCommissioner";
    __int16 v35 = 2080;
    uint64_t v36 = "PairDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  uint64_t v15 = *(void *)(a1 + 9064);
  if (v15)
  {
    *a7 = 0;
    a7[1] = 0;
    a7[2] = 0;
    (*(void (**)(uint64_t, uint64_t))(*(void *)v15 + 16))(v15, a4);
    if (!*(_DWORD *)a7)
    {
      v22[0] = *(unsigned char *)a6;
      if (v22[0])
      {
        int v23 = *(_DWORD *)(a6 + 8);
        long long v16 = *(_OWORD *)(a6 + 128);
        long long v30 = *(_OWORD *)(a6 + 112);
        long long v31 = v16;
        v32[0] = *(_OWORD *)(a6 + 144);
        *(_OWORD *)((char *)v32 + 11) = *(_OWORD *)(a6 + 155);
        long long v17 = *(_OWORD *)(a6 + 64);
        long long v26 = *(_OWORD *)(a6 + 48);
        long long v27 = v17;
        long long v18 = *(_OWORD *)(a6 + 96);
        long long v28 = *(_OWORD *)(a6 + 80);
        long long v29 = v18;
        long long v19 = *(_OWORD *)(a6 + 32);
        long long v24 = *(_OWORD *)(a6 + 16);
        long long v25 = v19;
      }
      sub_244DEA37C(a3, a1 + 4856, a2, 0, a5, v22, (uint64_t)a7);
    }
  }
  else
  {
    int v20 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v20, OS_LOG_TYPE_ERROR, "No default commissioner is specified", buf, 2u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    *(_DWORD *)a7 = 3;
    a7[1] = "src/controller/CHIPDeviceController.cpp";
    *((_DWORD *)a7 + 4) = 666;
  }
  char v21 = sub_244D7DFA0();
  if (os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v34 = "DeviceCommissioner";
    __int16 v35 = 2080;
    uint64_t v36 = "PairDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF0BDC(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v12 = sub_244D7DFA0();
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 136315394;
    long long v30 = "DeviceCommissioner";
    __int16 v31 = 2080;
    uint64_t v32 = "PairDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  v18[0] = *(unsigned char *)a5;
  if (v18[0])
  {
    int v19 = *(_DWORD *)(a5 + 8);
    long long v13 = *(_OWORD *)(a5 + 128);
    long long v26 = *(_OWORD *)(a5 + 112);
    long long v27 = v13;
    v28[0] = *(_OWORD *)(a5 + 144);
    *(_OWORD *)((char *)v28 + 11) = *(_OWORD *)(a5 + 155);
    long long v14 = *(_OWORD *)(a5 + 64);
    long long v22 = *(_OWORD *)(a5 + 48);
    long long v23 = v14;
    long long v15 = *(_OWORD *)(a5 + 96);
    long long v24 = *(_OWORD *)(a5 + 80);
    long long v25 = v15;
    long long v16 = *(_OWORD *)(a5 + 32);
    long long v20 = *(_OWORD *)(a5 + 16);
    long long v21 = v16;
  }
  sub_244DEA37C(a3, a1 + 4856, a2, 0, a4, v18, a6);
  long long v17 = sub_244D7DFA0();
  if (os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 136315394;
    long long v30 = "DeviceCommissioner";
    __int16 v31 = 2080;
    uint64_t v32 = "PairDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF0DAC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v8 = sub_244D7DFA0();
  if (os_signpost_enabled(v8))
  {
    int v11 = 136315394;
    *(void *)uint64_t v12 = "DeviceCommissioner";
    *(_WORD *)&unsigned char v12[8] = 2080;
    *(void *)&v12[10] = "PairDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", (uint8_t *)&v11, 0x16u);
  }
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  ((void (*)(uint64_t, uint64_t, uint64_t))loc_244DF0F64)(a1, a2, a3);
  int v9 = *(_DWORD *)a4;
  if (*(_DWORD *)a4
    || (*a4 = 0, a4[1] = 0, a4[2] = 0, sub_244DF17D4(a1, a2, (uint64_t)a4), (int v9 = *(_DWORD *)a4) != 0))
  {
    int v11 = 2;
    *(void *)&void v12[4] = "core_dcm_commission_device";
    *(_DWORD *)&v12[12] = v9;
    v12[16] = 3;
    sub_244D7E78C((uint64_t)&v11);
  }
  uint64_t v10 = sub_244D7DFA0();
  if (os_signpost_enabled(v10))
  {
    int v11 = 136315394;
    *(void *)uint64_t v12 = "DeviceCommissioner";
    *(_WORD *)&unsigned char v12[8] = 2080;
    *(void *)&v12[10] = "PairDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", (uint8_t *)&v11, 0x16u);
  }
}

void sub_244DF17D4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v6 = sub_244D7DFA0();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)long long v21 = "DeviceCommissioner";
    *(_WORD *)&v21[8] = 2080;
    *(void *)&v21[10] = "Commission";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  if (!*(void *)(a1 + 9064))
  {
    int v11 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_ERROR, "No default commissioner is specified", buf, 2u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    int v10 = 969;
    goto LABEL_36;
  }
  uint64_t v7 = sub_244DF0570(a1, a2);
  if (!v7
    || (uint64_t v8 = (_DWORD *)v7, ((*(uint64_t (**)(uint64_t))(*(void *)v7 + 72))(v7) & 1) == 0) && v8[18] != 1)
  {
    uint64_t v12 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)long long v21 = HIDWORD(a2);
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = a2;
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "Invalid device for commissioning %08X%08X", buf, 0xEu);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    int v10 = 976;
    goto LABEL_36;
  }
  if (((*(uint64_t (**)(_DWORD *))(*(void *)v8 + 72))(v8) & 1) == 0 && v8 != *(_DWORD **)(a1 + 4336))
  {
    int v9 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)long long v21 = HIDWORD(a2);
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = a2;
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "Device is not connected and not being paired %08X%08X", buf, 0xEu);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    int v10 = 982;
LABEL_36:
    int v17 = 3;
    goto LABEL_37;
  }
  uint64_t v13 = (unsigned __int8 *)(a1 + 4344);
  int v14 = *(unsigned __int8 *)(a1 + 4344);
  long long v15 = sub_244CC8484(9u, "Controller");
  long long v16 = v15;
  if (v14 != 1)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v18 = sub_244DEA240(*v13);
      *(_DWORD *)buf = 136315138;
      *(void *)long long v21 = v18;
      _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_ERROR, "Commissioning already in progress (stage '%s') - not restarting", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      sub_244DEA240(*v13);
      sub_244CC4DE0(9u, 1);
    }
    int v10 = 989;
    goto LABEL_36;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)long long v21 = HIDWORD(a2);
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = a2;
    _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_DEFAULT, "Commission called for node ID 0x%08X%08X", buf, 0xEu);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  (*(void (**)(void, void))(**(void **)(a1 + 9064) + 32))(*(void *)(a1 + 9064), *(void *)(a1 + 4288));
  if ((*(unsigned int (**)(_DWORD *))(*(void *)v8 + 72))(v8))
  {
    *(_DWORD *)buf = 0;
    *(void *)&v21[4] = "core_dcm_commission_device";
    v21[16] = 0;
    sub_244D7E78C((uint64_t)buf);
    (*(void (**)(uint8_t *__return_ptr))(**(void **)(a1 + 9064) + 40))(buf);
    int v17 = 0;
  }
  else
  {
    int v17 = 0;
    *(unsigned char *)(a1 + 4345) = 1;
  }
  int v10 = 1004;
LABEL_37:
  *(_DWORD *)a3 = v17;
  *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
  *(_DWORD *)(a3 + 16) = v10;
  int v19 = sub_244D7DFA0();
  if (os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)long long v21 = "DeviceCommissioner";
    *(_WORD *)&v21[8] = 2080;
    *(void *)&v21[10] = "Commission";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF1D34(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v8 = sub_244D7DFA0();
  if (os_signpost_enabled(v8))
  {
    int v11 = 136315394;
    *(void *)uint64_t v12 = "DeviceCommissioner";
    *(_WORD *)&unsigned char v12[8] = 2080;
    *(void *)&v12[10] = "PairDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", (uint8_t *)&v11, 0x16u);
  }
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  ((void (*)(uint64_t, uint64_t, uint64_t))loc_244DF0F64)(a1, a2, a3);
  int v9 = *(_DWORD *)a4;
  if (*(_DWORD *)a4 || (*a4 = 0, a4[1] = 0, a4[2] = 0, sub_244DF1EFC(a1, a2, a4), (int v9 = *(_DWORD *)a4) != 0))
  {
    int v11 = 2;
    *(void *)&void v12[4] = "core_dcm_commission_device";
    *(_DWORD *)&v12[12] = v9;
    v12[16] = 3;
    sub_244D7E78C((uint64_t)&v11);
  }
  int v10 = sub_244D7DFA0();
  if (os_signpost_enabled(v10))
  {
    int v11 = 136315394;
    *(void *)uint64_t v12 = "DeviceCommissioner";
    *(_WORD *)&unsigned char v12[8] = 2080;
    *(void *)&v12[10] = "PairDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", (uint8_t *)&v11, 0x16u);
  }
}

void sub_244DF1EFC(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 9064);
  if (v5)
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    (*(void (**)(void *__return_ptr))(*(void *)v5 + 16))(a3);
    int v7 = *(_DWORD *)a3;
    if (*(_DWORD *)a3
      || (*a3 = 0, a3[1] = 0, a3[2] = 0, sub_244DF17D4(a1, a2, (uint64_t)a3), (int v7 = *(_DWORD *)a3) != 0))
    {
      int v9 = 2;
      int v10 = "core_dcm_commission_device";
      int v11 = v7;
      char v12 = 3;
      sub_244D7E78C((uint64_t)&v9);
    }
  }
  else
  {
    uint64_t v8 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "No default commissioner is specified", (uint8_t *)&v9, 2u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    *(_DWORD *)a3 = 3;
    a3[1] = "src/controller/CHIPDeviceController.cpp";
    *((_DWORD *)a3 + 4) = 954;
  }
}

void sub_244DF2048(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  char v12 = sub_244D7DFA0();
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 136315394;
    long long v30 = "DeviceCommissioner";
    __int16 v31 = 2080;
    uint64_t v32 = "EstablishPASEConnection";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  v18[0] = *(unsigned char *)a5;
  if (v18[0])
  {
    int v19 = *(_DWORD *)(a5 + 8);
    long long v13 = *(_OWORD *)(a5 + 128);
    long long v26 = *(_OWORD *)(a5 + 112);
    long long v27 = v13;
    v28[0] = *(_OWORD *)(a5 + 144);
    *(_OWORD *)((char *)v28 + 11) = *(_OWORD *)(a5 + 155);
    long long v14 = *(_OWORD *)(a5 + 64);
    long long v22 = *(_OWORD *)(a5 + 48);
    long long v23 = v14;
    long long v15 = *(_OWORD *)(a5 + 96);
    long long v24 = *(_OWORD *)(a5 + 80);
    long long v25 = v15;
    long long v16 = *(_OWORD *)(a5 + 32);
    long long v20 = *(_OWORD *)(a5 + 16);
    long long v21 = v16;
  }
  sub_244DEA37C(a3, a1 + 4856, a2, 1, a4, v18, a6);
  int v17 = sub_244D7DFA0();
  if (os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 136315394;
    long long v30 = "DeviceCommissioner";
    __int16 v31 = 2080;
    uint64_t v32 = "EstablishPASEConnection";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void *sub_244DF2218(unint64_t *a1)
{
  uint64_t v2 = sub_244CC4D84(0x7E8uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    sub_244E04528((uint64_t)v2);
    uint64_t v4 = sub_244CC4D84(0x18uLL);
    if (v4)
    {
      void *v4 = v3;
      v4[1] = a1 + 2;
      void v4[2] = 0;
      void v4[2] = a1[4];
      *(void *)(a1[4] + 8) = v4;
      a1[4] = (unint64_t)v4;
      unint64_t v5 = a1[1];
      unint64_t v6 = *a1 + 1;
      *a1 = v6;
      if (v6 > v5) {
        a1[1] = v6;
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t sub_244DF22A0(uint64_t a1)
{
  uint64_t result = sub_244D6A0B8();
  int v4 = *(unsigned __int8 *)(a1 + 140);
  uint64_t v3 = (unsigned char *)(a1 + 140);
  if (v4) {
    return *(void *)sub_2446DC5A0(v3);
  }
  return result;
}

uint64_t sub_244DF22E4(uint64_t result, uint64_t a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(unsigned char **)(result + 4336);
  if (v2 && v2[56] == 2)
  {
    uint64_t v4 = result;
    uint64_t v5 = result + 4488;
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v2 + 24))(*(void *)(result + 4336));
    long long v26 = *(_OWORD *)(v4 + 4472);
    int v7 = *(_DWORD *)(v4 + 4492);
    int v27 = *(_DWORD *)(v4 + 4488);
    int v28 = v7;
    uint64_t v29 = *(void *)(v4 + 4496);
    long long v8 = *(_OWORD *)(v4 + 4584);
    long long v34 = *(_OWORD *)(v4 + 4568);
    *(_OWORD *)__int16 v35 = v8;
    *(_OWORD *)&v35[12] = *(_OWORD *)(v4 + 4596);
    long long v9 = *(_OWORD *)(v4 + 4520);
    long long v30 = *(_OWORD *)(v4 + 4504);
    long long v31 = v9;
    long long v10 = *(_OWORD *)(v4 + 4552);
    long long v32 = *(_OWORD *)(v4 + 4536);
    long long v33 = v10;
    if (*(unsigned char *)(v5 + 124))
    {
      uint64_t v37 = *(void *)(v4 + 4616);
      int v38 = *(_DWORD *)(v4 + 4624);
    }
    long long v39 = *(_OWORD *)(v4 + 4632);
    uint64_t v11 = *(void *)(v4 + 4648);
    *((void *)&v39 + 1) = a2;
    uint64_t v40 = v11;
    *(_OWORD *)(v4 + 4472) = xmmword_268EC34EC;
    *(_WORD *)uint64_t v5 = 0;
    *(_WORD *)(v4 + 4490) = 5540;
    *(void *)(v4 + 4648) = 0;
    *(void *)(v4 + 4632) = 0;
    *(void *)(v4 + 4640) = 0;
    *(_OWORD *)(v4 + 4492) = 0u;
    *(_OWORD *)(v4 + 4508) = 0u;
    *(_OWORD *)(v4 + 4524) = 0u;
    *(_OWORD *)(v4 + 4540) = 0u;
    *(_OWORD *)(v4 + 4556) = 0u;
    *(_OWORD *)(v4 + 4572) = 0u;
    *(_OWORD *)(v4 + 4588) = 0u;
    *(_OWORD *)(v4 + 4597) = 0u;
    sub_244DF0730((void *)v4, (uint64_t)v2);
    long long v18 = 0uLL;
    uint64_t v19 = 0;
    uint64_t result = (uint64_t)((uint64_t (*)(long long *__return_ptr, uint64_t, uint64_t, long long *))loc_244DF0F64)(&v18, v4, v6, &v26);
    if (v18)
    {
      char v12 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        long long v16 = v18;
        uint64_t v17 = v19;
        long long v13 = sub_244CB7B34((const char **)&v16, 1);
        *(_DWORD *)buf = 136315650;
        long long v21 = v13;
        __int16 v22 = 2080;
        long long v23 = "src/controller/CHIPDeviceController.cpp";
        __int16 v24 = 1024;
        int v25 = 888;
        _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "%s at %s:%d", buf, 0x1Cu);
      }
      uint64_t result = sub_244CC4E58(1u);
      if (result)
      {
        long long v14 = v18;
        uint64_t v15 = v19;
        sub_244CB7B34((const char **)&v14, 1);
        return sub_244CC4DE0(0, 1);
      }
    }
  }
  return result;
}

void *sub_244DF2560(void *result, long long *a2)
{
  uint64_t v3 = result[542];
  if (v3 && *(unsigned char *)(v3 + 56) == 2)
  {
    uint64_t v4 = result;
    uint64_t v5 = result + 561;
    sub_244DF0730(result, v3);
    *(_OWORD *)(v4 + 559) = xmmword_268EC34EC;
    *uint64_t v5 = 0;
    *((_WORD *)v4 + 2245) = 5540;
    v4[579] = 0;
    v4[581] = 0;
    v4[580] = 0;
    *(_OWORD *)((char *)v4 + 4492) = 0u;
    *(_OWORD *)((char *)v4 + 4508) = 0u;
    *(_OWORD *)((char *)v4 + 4524) = 0u;
    *(_OWORD *)((char *)v4 + 4540) = 0u;
    *(_OWORD *)((char *)v4 + 4556) = 0u;
    *(_OWORD *)((char *)v4 + 4572) = 0u;
    *(_OWORD *)((char *)v4 + 4588) = 0u;
    *(_OWORD *)((char *)v4 + 4597) = 0u;
    uint64_t result = (void *)v4[540];
    if (result)
    {
      long long v6 = *a2;
      uint64_t v7 = *((void *)a2 + 2);
      return (void *)(*(uint64_t (**)(void *, long long *))(*result + 24))(result, &v6);
    }
  }
  return result;
}

unint64_t sub_244DF2648(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = sub_244CC8484(0x22u, "Discovery");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_ERROR, "Get RendezvousParameters::GetSetupDiscriminator() called without discriminator in params (inconsistent).", v4, 2u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0x22u, 1);
    }
  }
  return *(unsigned int *)(a1 + 36) | ((unint64_t)*(unsigned __int16 *)(a1 + 40) << 32);
}

void sub_244DF26EC(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  long long v8 = sub_244D7DFA0();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "continueCommissioningDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  if (!*(void *)(a1 + 9064))
  {
    uint64_t v11 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_ERROR, "No default commissioner is specified", buf, 2u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    int v10 = 1016;
    goto LABEL_16;
  }
  if (!a2 || *(void *)(a1 + 4328) != a2)
  {
    long long v9 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a2;
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "Invalid device for commissioning %p", buf, 0xCu);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    int v10 = 1022;
LABEL_16:
    int v12 = 3;
    goto LABEL_17;
  }
  uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
  uint64_t v15 = sub_244DF0570(a1, v14);
  if (!v15)
  {
    long long v20 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v20, OS_LOG_TYPE_ERROR, "Couldn't find commissionee device", buf, 2u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    int v10 = 1028;
    goto LABEL_16;
  }
  uint64_t v16 = v15;
  if (!(*(unsigned int (**)(uint64_t))(*(void *)v15 + 72))(v15) || v16 != *(void *)(a1 + 4328))
  {
    uint64_t v17 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      unint64_t v18 = (unint64_t)(*(uint64_t (**)(uint64_t))(*(void *)v16 + 24))(v16) >> 32;
      int v19 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 24))(v16);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v19;
      _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_ERROR, "Invalid device for commissioning after attestation failure: 0x%08X%08X", buf, 0xEu);
    }
    if (sub_244CC4E58(1u))
    {
      (*(uint64_t (**)(uint64_t))(*(void *)v16 + 24))(v16);
      (*(void (**)(uint64_t))(*(void *)v16 + 24))(v16);
      sub_244CC4DE0(9u, 1);
    }
    int v10 = 1034;
    goto LABEL_16;
  }
  int v21 = *(unsigned __int8 *)(a1 + 4344);
  __int16 v22 = sub_244CC8484(9u, "Controller");
  if (v21 != 14)
  {
    int v28 = v22;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v28, OS_LOG_TYPE_ERROR, "Commissioning is not attestation verification phase", buf, 2u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    int v10 = 1040;
    goto LABEL_16;
  }
  log = v22;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v23 = (unint64_t)(*(uint64_t (**)(uint64_t))(*(void *)v16 + 24))(v16) >> 32;
    int v24 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 24))(v16);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v23;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v24;
    _os_log_impl(&dword_2446BD000, log, OS_LOG_TYPE_DEFAULT, "Continuing commissioning after attestation failure for device ID 0x%08X%08X", buf, 0xEu);
  }
  if (sub_244CC4E58(2u))
  {
    (*(uint64_t (**)(uint64_t))(*(void *)v16 + 24))(v16);
    (*(void (**)(uint64_t))(*(void *)v16 + 24))(v16);
    sub_244CC4DE0(9u, 2);
  }
  int v25 = sub_244CC8484(9u, "Controller");
  long long v26 = v25;
  if (a3)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl(&dword_2446BD000, v26, OS_LOG_TYPE_ERROR, "Client selected error: %u for failed 'Attestation Information' for device", buf, 8u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
    char v40 = 0;
    *(_WORD *)&buf[8] = a3;
    *(void *)buf = 6;
    LODWORD(v32) = 172;
    *((void *)&v32 + 1) = "src/controller/CHIPDeviceController.cpp";
    int v33 = 1053;
    sub_244E04164((uint64_t)v36, (uint64_t)buf);
    v37[72] = v40;
    sub_244DF2F10(a1, &v32, (uint64_t)v36);
    if (v36[0] == 4)
    {
      v36[1] = &unk_26F9593F8;
      sub_244D87F44(v37);
    }
    if (*(void *)buf != 4) {
      goto LABEL_59;
    }
    *(void *)&buf[8] = &unk_26F9593F8;
    int v27 = &v39;
  }
  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v26, OS_LOG_TYPE_DEFAULT, "Overriding attestation failure per client and continuing commissioning", buf, 2u);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    LODWORD(v30) = 0;
    *((void *)&v30 + 1) = "src/controller/CHIPDeviceController.cpp";
    int v31 = 1058;
    v34[0] = -1;
    v35[72] = 0;
    sub_244DF2F10(a1, &v30, (uint64_t)v34);
    if (v34[0] != 4) {
      goto LABEL_59;
    }
    v34[1] = &unk_26F9593F8;
    int v27 = (uint64_t *)v35;
  }
  sub_244D87F44(v27);
LABEL_59:
  int v12 = 0;
  int v10 = 1060;
LABEL_17:
  *(_DWORD *)a4 = v12;
  *(void *)(a4 + 8) = "src/controller/CHIPDeviceController.cpp";
  *(_DWORD *)(a4 + 16) = v10;
  long long v13 = sub_244D7DFA0();
  if (os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "continueCommissioningDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF2F10(uint64_t a1, long long *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v6 = sub_244D7DFA0();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "CommissioningStageComplete";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  uint64_t v7 = (unsigned char *)(a1 + 4344);
  long long v8 = sub_244DEA268(*(unsigned __int8 *)(a1 + 4344));
  *(_DWORD *)buf = 1;
  *(void *)&buf[8] = v8;
  *(_DWORD *)&uint8_t buf[16] = *(_DWORD *)a2;
  buf[20] = 3;
  sub_244D7E78C((uint64_t)buf);
  uint64_t v9 = *(void *)(a1 + 4328);
  if (!v9) {
    sub_244E2C434();
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 24))(v9);
  uint64_t v11 = *(void *)(a1 + 4328);
  *(void *)(a1 + 4328) = 0;
  sub_244E04718((void *)(a1 + 4352));
  sub_244E04718((void *)(a1 + 4384));
  uint64_t v12 = *(void *)(a1 + 4320);
  if (v12)
  {
    uint64_t v13 = sub_244B94EE0(a1);
    if (v13) {
      uint64_t v14 = *(void *)(v13 + 16);
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = *v7;
    long long v23 = *a2;
    uint64_t v24 = *((void *)a2 + 2);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, long long *))(*(void *)v12 + 64))(v12, v10, v14, v15, &v23);
  }
  if (*(void *)(a1 + 9072))
  {
    *(unsigned char *)(a3 + 104) = *v7;
    long long v21 = 0uLL;
    uint64_t v22 = 0;
    uint64_t v16 = *(void *)(a1 + 9072);
    long long v19 = *a2;
    uint64_t v20 = *((void *)a2 + 2);
    sub_244E04164((uint64_t)v31, a3);
    v32[72] = *(unsigned char *)(a3 + 104);
    (*(void (**)(long long *__return_ptr, uint64_t, long long *, void *))(*(void *)v16 + 48))(&v21, v16, &v19, v31);
    if (v31[0] == 4)
    {
      v31[1] = &unk_26F9593F8;
      sub_244D87F44(v32);
    }
    if (v21 && *v7 != 34)
    {
      char v28 = 0;
      char v29 = 0;
      char v30 = 0;
      *(_OWORD *)buf = v21;
      *(void *)&uint8_t buf[16] = v22;
      char v17 = *(unsigned char *)(a3 + 104);
      char v26 = 1;
      char v27 = v17;
      *uint64_t v7 = 34;
      *(void *)(a1 + 4328) = v11;
      sub_244DF8CA4(a1, v11, v10, (long long *)buf);
    }
  }
  unint64_t v18 = sub_244D7DFA0();
  if (os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "CommissioningStageComplete";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF326C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 32) == 1)
  {
    if (a2)
    {
      long long v6 = sub_244CC8484(9u, "Controller");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v15 = HIDWORD(a2);
        __int16 v16 = 1024;
        int v17 = a2;
        _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "StopPairing called for node ID 0x%08X%08X", buf, 0xEu);
      }
      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(9u, 2);
      }
      if (sub_244DEC1F4(a1 + 4856, a2))
      {
        int v7 = 0;
        *(unsigned char *)(a1 + 4345) = 0;
        int v8 = 1074;
      }
      else
      {
        uint64_t v9 = sub_244DF0570(a1, a2);
        if (v9)
        {
          if (*(void *)(a1 + 4328) == v9)
          {
            sub_244DF0214(a1);
            LODWORD(v10) = 116;
            *((void *)&v10 + 1) = "src/controller/CHIPDeviceController.cpp";
            int v11 = 1084;
            v12[0] = -1;
            v13[72] = 0;
            sub_244DF2F10(a1, &v10, (uint64_t)v12);
            if (v12[0] == 4)
            {
              v12[1] = &unk_26F9593F8;
              sub_244D87F44(v13);
            }
          }
          else
          {
            sub_244DF0730((void *)a1, v9);
          }
          int v7 = 0;
          int v8 = 1090;
        }
        else
        {
          int v8 = 1079;
          int v7 = 51;
        }
      }
    }
    else
    {
      int v8 = 1066;
      int v7 = 47;
    }
  }
  else
  {
    int v8 = 1065;
    int v7 = 3;
  }
  *(_DWORD *)a3 = v7;
  *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
  *(_DWORD *)(a3 + 16) = v8;
}

void sub_244DF347C(void (****a1)(void), void (***a2)(void))
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    (**v2)(v2);
    j__free(v2);
  }
}

uint64_t sub_244DF34EC(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(uint64_t (**)(uint64_t))(result + 4672);
  if (v2)
  {
    *(void *)(result + 4672) = 0;
    uint64_t result = v2(result + 4656);
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v1 + 4712);
  if (v3)
  {
    *(void *)(v1 + 4712) = 0;
    uint64_t result = v3(v1 + 4696);
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v1 + 4752);
  if (v4)
  {
    *(void *)(v1 + 4752) = 0;
    return v4(v1 + 4736);
  }
  return result;
}

void sub_244DF356C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v6 = sub_244D7DFA0();
  if (os_signpost_enabled(v6))
  {
    int v8 = 136315394;
    uint64_t v9 = "DeviceCommissioner";
    __int16 v10 = 2080;
    int v11 = "UnpairDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", (uint8_t *)&v8, 0x16u);
  }
  if (*(_DWORD *)(a1 + 32) == 1)
  {
    sub_244E194E4(a1, a2, (void *)a3);
  }
  else
  {
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
    *(_DWORD *)(a3 + 16) = 1131;
  }
  int v7 = sub_244D7DFA0();
  if (os_signpost_enabled(v7))
  {
    int v8 = 136315394;
    uint64_t v9 = "DeviceCommissioner";
    __int16 v10 = 2080;
    int v11 = "UnpairDevice";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", (uint8_t *)&v8, 0x16u);
  }
}

void *sub_244DF36F0(void *result, long long *a2)
{
  uint64_t v3 = result[542];
  if (v3)
  {
    uint64_t v4 = result;
    sub_244DF0730(result, v3);
    uint64_t result = (void *)v4[540];
    if (result)
    {
      long long v5 = *a2;
      uint64_t v6 = *((void *)a2 + 2);
      return (void *)(*(uint64_t (**)(void *, long long *))(*result + 24))(result, &v5);
    }
  }
  return result;
}

void *sub_244DF3768(void *a1, int *a2)
{
  int v8 = 1;
  uint64_t v9 = "core_dcm_pase_session";
  int v10 = *a2;
  char v11 = 3;
  sub_244D7E78C((uint64_t)&v8);
  uint64_t v4 = a1[540];
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 16))(v4, 1);
  }
  long long v6 = *(_OWORD *)a2;
  uint64_t v7 = *((void *)a2 + 2);
  return sub_244DF36F0(a1, &v6);
}

void *sub_244DF380C(uint64_t a1, int *a2)
{
  return sub_244DF3768((void *)(a1 - 4312), a2);
}

void *sub_244DF3818(uint64_t a1, uint64_t *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 4336);
  *(void *)(a1 + 4336) = 0;
  if (v3)
  {
    long long v18 = 0uLL;
    uint64_t v19 = 0;
    sub_244DE9F70(v3, a2, (uint64_t)&v18);
    int v4 = v18;
    long long v5 = sub_244CC8484(9u, "Controller");
    long long v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        long long v16 = v18;
        uint64_t v17 = v19;
        uint64_t v7 = sub_244CB7B34((const char **)&v16, 1);
        *(_DWORD *)buf = 136315138;
        *(void *)uint64_t v24 = v7;
        _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "Failed in setting up secure channel: err %s", buf, 0xCu);
      }
      if (sub_244CC4E58(1u))
      {
        long long v14 = v18;
        uint64_t v15 = v19;
        sub_244CB7B34((const char **)&v14, 1);
        sub_244CC4DE0(9u, 1);
      }
      long long v12 = v18;
      uint64_t v13 = v19;
      return (void *)(*(uint64_t (**)(uint64_t, long long *))(*(void *)a1 + 48))(a1, &v12);
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_INFO, "Remote device completed SPAKE2+ handshake", buf, 2u);
      }
      if (sub_244CC4E58(3u)) {
        sub_244CC4DE0(9u, 3);
      }
      *(_DWORD *)buf = 1;
      *(void *)&v24[4] = "core_dcm_pase_session";
      int v25 = 0;
      char v26 = 3;
      sub_244D7E78C((uint64_t)buf);
      uint64_t result = *(void **)(a1 + 4320);
      if (result)
      {
        int v9 = 0;
        int v10 = "src/controller/CHIPDeviceController.cpp";
        int v11 = 1187;
        uint64_t result = (void *)(*(uint64_t (**)(void *, int *))(*result + 24))(result, &v9);
      }
      if (*(unsigned char *)(a1 + 4345))
      {
        *(unsigned char *)(a1 + 4345) = 0;
        *(_DWORD *)buf = 0;
        *(void *)&v24[4] = "core_dcm_commission_device";
        char v26 = 0;
        sub_244D7E78C((uint64_t)buf);
        return (*(void *(**)(uint8_t *__return_ptr))(**(void **)(a1 + 9064) + 40))(buf);
      }
    }
  }
  else
  {
    int v20 = 51;
    long long v21 = "src/controller/CHIPDeviceController.cpp";
    int v22 = 1172;
    return (void *)(*(uint64_t (**)(uint64_t, int *))(*(void *)a1 + 48))(a1, &v20);
  }
  return result;
}

void *sub_244DF3AF8(uint64_t a1, uint64_t *a2)
{
  return sub_244DF3818(a1 - 4312, a2);
}

void sub_244DF3B04(uint64_t a1@<X0>, uint64_t a2@<X1>, uint8_t a3@<W2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v10 = sub_244D7DFA0();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 136315394;
    long long v16 = "DeviceCommissioner";
    __int16 v17 = 2080;
    long long v18 = "SendCertificateChainRequestCommand";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  int v11 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    long long v16 = (const char *)a2;
    _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_INFO, "Sending Certificate Chain request to %p device", buf, 0xCu);
  }
  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(9u, 3);
  }
  if (a2)
  {
    buf[0] = a3;
    v13[0] = *(unsigned char *)a4;
    if (v13[0]) {
      int v14 = *(_DWORD *)(a4 + 4);
    }
    sub_244DF3D50(a1, a2, (uint64_t)buf, (uint64_t)sub_244DF3F28, (uint64_t)sub_244DF4198, 0, (uint64_t)v13, 0, a5);
  }
  else
  {
    a5->n128_u32[0] = 47;
    a5->n128_u64[1] = (unint64_t)"src/controller/CHIPDeviceController.cpp";
    a5[1].n128_u32[0] = 1204;
  }
  long long v12 = sub_244D7DFA0();
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 136315394;
    long long v16 = "DeviceCommissioner";
    __int16 v17 = 2080;
    long long v18 = "SendCertificateChainRequestCommand";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void *sub_244DF3D50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  void v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  uint64_t v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F959EB8;
  v27[1] = v17;
  v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F959F48;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  int v20 = (void *)(a1 + 4352);
  if (a8) {
    int v20 = 0;
  }
  sub_244E047A0(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E05818(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void sub_244DF3F28(uint64_t a1, _OWORD *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v4 = sub_244D7DFA0();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "OnCertificateChainResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  long long v5 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "Received certificate chain from the device", buf, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  char v13 = 0;
  *(_OWORD *)&buf[8] = *a2;
  *(void *)buf = 0;
  LODWORD(v7) = 0;
  *((void *)&v7 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v8 = 1230;
  sub_244E04164((uint64_t)v9, (uint64_t)buf);
  v10[72] = v13;
  sub_244DF2F10(a1, &v7, (uint64_t)v9);
  if (v9[0] == 4)
  {
    v9[1] = &unk_26F9593F8;
    sub_244D87F44(v10);
  }
  if (*(void *)buf == 4)
  {
    *(void *)&buf[8] = &unk_26F9593F8;
    sub_244D87F44(&v12);
  }
  long long v6 = sub_244D7DFA0();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "OnCertificateChainResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF4198(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v4 = sub_244D7DFA0();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnCertificateChainFailureResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  long long v5 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = *(_OWORD *)a2;
    uint64_t v13 = *(void *)(a2 + 16);
    long long v6 = sub_244CB7B34((const char **)&v12, 1);
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = v6;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "Device failed to receive the Certificate Chain request Response: %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    long long v10 = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
    sub_244CB7B34((const char **)&v10, 1);
    sub_244CC4DE0(9u, 2);
  }
  long long v8 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a2 + 16);
  v14[0] = -1;
  v15[72] = 0;
  sub_244DF2F10(a1, &v8, (uint64_t)v14);
  if (v14[0] == 4)
  {
    v14[1] = &unk_26F9593F8;
    sub_244D87F44(v15);
  }
  long long v7 = sub_244D7DFA0();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnCertificateChainFailureResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF43F4(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v10 = sub_244D7DFA0();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "SendAttestationRequestCommand";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  uint64_t v11 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a2;
    _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_INFO, "Sending Attestation request to %p device", buf, 0xCu);
  }
  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(9u, 3);
  }
  if (!a2)
  {
    a5->n128_u32[0] = 47;
    a5->n128_u64[1] = (unint64_t)"src/controller/CHIPDeviceController.cpp";
    int v13 = 1238;
LABEL_17:
    a5[1].n128_u32[0] = v13;
    goto LABEL_18;
  }
  *(_OWORD *)buf = *a3;
  a5->n128_u64[1] = 0;
  a5[1].n128_u64[0] = 0;
  a5->n128_u64[0] = 0;
  v16[0] = *(unsigned char *)a4;
  if (v16[0]) {
    int v17 = *(_DWORD *)(a4 + 4);
  }
  sub_244DF46D0(a1, a2, (uint64_t)buf, (uint64_t)sub_244DF48A8, (uint64_t)sub_244DF4B1C, 0, (uint64_t)v16, 0, a5);
  if (!a5->n128_u32[0])
  {
    long long v12 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_INFO, "Sent Attestation request, waiting for the Attestation Information", v15, 2u);
    }
    if (sub_244CC4E58(3u)) {
      sub_244CC4DE0(9u, 3);
    }
    a5->n128_u32[0] = 0;
    a5->n128_u64[1] = (unint64_t)"src/controller/CHIPDeviceController.cpp";
    int v13 = 1246;
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v14 = sub_244D7DFA0();
  if (os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "SendAttestationRequestCommand";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void *sub_244DF46D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  void v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  uint64_t v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95A158;
  v27[1] = v17;
  v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95A1E8;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E0589C(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E06358(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void sub_244DF48A8(uint64_t a1, _OWORD *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = sub_244D7DFA0();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "OnAttestationResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  long long v5 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "Received Attestation Information from the device", buf, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  char v14 = 0;
  long long v6 = a2[1];
  *(_OWORD *)&buf[8] = *a2;
  long long v13 = v6;
  *(void *)buf = 1;
  LODWORD(v8) = 0;
  *((void *)&v8 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v9 = 1266;
  sub_244E04164((uint64_t)v10, (uint64_t)buf);
  v11[72] = v14;
  sub_244DF2F10(a1, &v8, (uint64_t)v10);
  if (v10[0] == 4)
  {
    v10[1] = &unk_26F9593F8;
    sub_244D87F44(v11);
  }
  if (*(void *)buf == 4)
  {
    *(void *)&buf[8] = &unk_26F9593F8;
    sub_244D87F44((char *)&v13 + 8);
  }
  long long v7 = sub_244D7DFA0();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "OnAttestationResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF4B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v4 = sub_244D7DFA0();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnAttestationFailureResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  long long v5 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = *(_OWORD *)a2;
    uint64_t v13 = *(void *)(a2 + 16);
    long long v6 = sub_244CB7B34((const char **)&v12, 1);
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = v6;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "Device failed to receive the Attestation Information Response: %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    long long v10 = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
    sub_244CB7B34((const char **)&v10, 1);
    sub_244CC4DE0(9u, 2);
  }
  long long v8 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a2 + 16);
  v14[0] = -1;
  v15[72] = 0;
  sub_244DF2F10(a1, &v8, (uint64_t)v14);
  if (v14[0] == 4)
  {
    v14[1] = &unk_26F9593F8;
    sub_244D87F44(v15);
  }
  long long v7 = sub_244D7DFA0();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnAttestationFailureResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

unsigned char *sub_244DF4D78(unsigned char *a1)
{
  if (!*a1) {
    sub_244E22468();
  }
  return a1 + 2;
}

void sub_244DF4D9C(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v5 = (unsigned __int8 *)(a1 + 4344);
  *(_WORD *)(a1 + 9136) = a3;
  uint64_t v6 = *(void *)((*(uint64_t (**)(void))(**(void **)(a1 + 9064) + 24))(*(void *)(a1 + 9064)) + 584);
  long long v7 = sub_244CC4D84(0x38uLL);
  uint64_t v8 = (uint64_t)v7;
  if (v7) {
    sub_244DB0F00((uint64_t)v7, a2);
  }
  sub_244E043B8((uint64_t *)(a1 + 9144), v8);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v6 + 16))(&v18, v6);
  int v9 = v18;
  long long v10 = sub_244CC8484(9u, "Controller");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      WORD2(v18) = 0;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "Proceeding without changing fail-safe timer value as delegate has not set it", (uint8_t *)&v18 + 4, 2u);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    goto LABEL_14;
  }
  if (v11)
  {
    int v12 = *(unsigned __int16 *)sub_2447A4DF0(&v18);
    HIDWORD(v18) = 67109120;
    int v19 = v12;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "Changing fail-safe timer to %u seconds to handle DA failure", (uint8_t *)&v18 + 4, 8u);
  }
  if (sub_244CC4E58(2u))
  {
    sub_2447A4DF0(&v18);
    sub_244CC4DE0(9u, 2);
  }
  uint64_t v13 = *(void *)(a1 + 4328);
  unsigned int v14 = *v5;
  unsigned int v15 = *(unsigned __int16 *)sub_2447A4DF0(&v18);
  v16[0] = 1;
  int v17 = 30000;
  if (!sub_244DF5808(a1, v13, v14, v15, v16, (uint64_t)sub_244DF4FE4, sub_244DF52E0, 0)) {
LABEL_14:
  }
    sub_244DF508C(a1);
}

void sub_244DF4FE4(uint64_t a1)
{
  uint64_t v2 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_DEFAULT, "Successfully extended fail-safe timer to handle DA failure", v3, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  sub_244E04718((void *)(a1 + 4352));
  sub_244DF508C(a1);
}

void sub_244DF508C(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 4328))
  {
    uint64_t v2 = *(void *)((*(uint64_t (**)(void))(**(void **)(a1 + 9064) + 24))(*(void *)(a1 + 9064)) + 584);
    uint64_t v3 = sub_244CC8484(9u, "Controller");
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "Device attestation completed, delegating continuation to client", buf, 2u);
      }
      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(9u, 2);
      }
      (*(void (**)(uint64_t, uint64_t, void, void, void))(*(void *)v2 + 24))(v2, a1, *(void *)(a1 + 4328), *(void *)(a1 + 9144), *(unsigned __int16 *)(a1 + 9136));
    }
    else
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "Device attestation failed and no delegate set, failing commissioning", buf, 2u);
      }
      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(9u, 2);
      }
      char v12 = 0;
      LOWORD(v10) = *(_WORD *)(a1 + 9136);
      *(void *)buf = 6;
      LODWORD(v5) = 172;
      *((void *)&v5 + 1) = "src/controller/CHIPDeviceController.cpp";
      int v6 = 1384;
      sub_244E04164((uint64_t)v7, (uint64_t)buf);
      v8[72] = v12;
      sub_244DF2F10(a1, &v5, (uint64_t)v7);
      if (v7[0] == 4)
      {
        v7[1] = &unk_26F9593F8;
        sub_244D87F44(v8);
      }
      if (*(void *)buf == 4)
      {
        long long v10 = &unk_26F9593F8;
        sub_244D87F44(&v11);
      }
    }
  }
}

void sub_244DF52E0(uint64_t a1, long long *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = *a2;
    uint64_t v11 = *((void *)a2 + 2);
    long long v5 = sub_244CB7B34((const char **)&v10, 1);
    LODWORD(buf[0]) = 136315138;
    *(void *)((char *)buf + 4) = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Failed to extend fail-safe timer to handle attestation failure %s", (uint8_t *)buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    long long v8 = *a2;
    uint64_t v9 = *((void *)a2 + 2);
    sub_244CB7B34((const char **)&v8, 1);
    sub_244CC4DE0(9u, 2);
  }
  char v16 = 0;
  WORD4(buf[0]) = *(_WORD *)(a1 + 9136);
  *(void *)&buf[0] = 6;
  LODWORD(v6) = 172;
  *((void *)&v6 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v7 = 1395;
  sub_244E04164((uint64_t)v12, (uint64_t)buf);
  v13[72] = v16;
  sub_244DF2F10(a1, &v6, (uint64_t)v12);
  if (v12[0] == 4)
  {
    v12[1] = &unk_26F9593F8;
    sub_244D87F44(v13);
  }
  if (*(void *)&buf[0] == 4)
  {
    *((void *)&buf[0] + 1) = &unk_26F9593F8;
    sub_244D87F44(&v15);
  }
}

void sub_244DF54BC(uint64_t a1, unsigned int *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    int v8 = 1403;
    unsigned int v7 = 47;
    goto LABEL_11;
  }
  if (*(unsigned char *)(a1 + 4344) != 22)
  {
    int v8 = 1404;
LABEL_10:
    unsigned int v7 = 3;
    goto LABEL_11;
  }
  uint64_t v3 = *(void *)(a1 + 4328);
  if (!v3)
  {
    int v8 = 1405;
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)(a1 + 4320);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 24))(v3);
    (*(void (**)(uint64_t, uint64_t, void, void))(*(void *)v4 + 112))(v4, v6, *(unsigned __int8 *)(a1 + 36), *a2);
  }
  unsigned int v7 = 0;
  int v8 = 1401;
LABEL_11:
  v14[0] = -1;
  char v16 = 0;
  *(void *)&long long v9 = v7;
  *((void *)&v9 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v10 = v8;
  int v11 = 0;
  sub_244E04164((uint64_t)v12, (uint64_t)v14);
  v13[72] = v16;
  sub_244DF2F10(a1, &v9, (uint64_t)v12);
  if (v12[0] == 4)
  {
    v12[1] = &unk_26F9593F8;
    sub_244D87F44(v13);
  }
  if (v14[0] == 4)
  {
    v14[1] = &unk_26F9593F8;
    sub_244D87F44(&v15);
  }
}

void sub_244DF5674(uint64_t a1, unsigned int *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 4344) == 33)
    {
      uint64_t v3 = *(void *)(a1 + 4328);
      if (v3)
      {
        uint64_t v4 = *(void *)(a1 + 4320);
        if (v4)
        {
          uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 24))(v3);
          (*(void (**)(uint64_t, uint64_t, void, void))(*(void *)v4 + 120))(v4, v6, *(unsigned __int8 *)(a1 + 36), *a2);
        }
      }
    }
  }
  v11[0] = -1;
  char v13 = 0;
  LODWORD(v7) = 0;
  *((void *)&v7 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v8 = 1437;
  sub_244E04164((uint64_t)v9, (uint64_t)v11);
  v10[72] = v13;
  sub_244DF2F10(a1, &v7, (uint64_t)v9);
  if (v9[0] == 4)
  {
    v9[1] = &unk_26F9593F8;
    sub_244D87F44(v10);
  }
  if (v11[0] == 4)
  {
    v11[1] = &unk_26F9593F8;
    sub_244D87F44(&v12);
  }
}

BOOL sub_244DF5808(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, char *a5, uint64_t a6, void (*a7)(uint64_t, long long *), int a8)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v15 = (*((uint64_t (**)(_UNKNOWN **))*off_268EBD1B0 + 2))(off_268EBD1B0);
  unint64_t v16 = v15 + 1000 * a4;
  unint64_t v17 = *(void *)(a2 + 8);
  if (v16 < v17)
  {
    uint64_t v20 = v15;
    long long v21 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = (unsigned __int16)(((((unint64_t)(*(void *)(a2 + 8) - v20) >> 3)
                                             * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = a4;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v22;
      _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_DEFAULT, "Skipping arming failsafe: new time (%u seconds from now) before old time (%u seconds from now)", buf, 0xEu);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
  }
  else
  {
    __int16 v29 = a4;
    uint64_t v30 = a3;
    uint64_t v18 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a4;
      _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_DEFAULT, "Arming failsafe (%u seconds)", buf, 8u);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    memset(buf, 0, sizeof(buf));
    uint64_t v32 = 0;
    v27[0] = *a5;
    if (v27[0]) {
      int v28 = *((_DWORD *)a5 + 1);
    }
    sub_244DF5AB8(a1, a2, (uint64_t)&v29, a6, (uint64_t)a7, 0, (uint64_t)v27, a8, (__n128 *)buf);
    if (*(_DWORD *)buf)
    {
      if (a8) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = a1;
      }
      long long v25 = *(_OWORD *)buf;
      uint64_t v26 = v32;
      a7(v19, &v25);
    }
    else
    {
      *(void *)(a2 + 8) = v16;
    }
  }
  return v16 >= v17;
}

void *sub_244DF5AB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  uint64_t v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95A3F8;
  v27[1] = v17;
  v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95A488;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E063DC(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E092BC(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void sub_244DF5C90(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_244D7DFA0();
  if (os_signpost_enabled(v6))
  {
    int v11 = 136315394;
    uint64_t v12 = "DeviceCommissioner";
    __int16 v13 = 2080;
    uint64_t v14 = "ValidateAttestationInfo";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", (uint8_t *)&v11, 0x16u);
  }
  if (*(_DWORD *)(a1 + 32) == 1)
  {
    uint64_t v7 = *(void *)(a1 + 9152);
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 16))(v7, a2, a1 + 4776);
      int v8 = 0;
      int v9 = 1517;
      goto LABEL_9;
    }
    int v9 = 1511;
  }
  else
  {
    int v9 = 1510;
  }
  int v8 = 3;
LABEL_9:
  *(_DWORD *)a3 = v8;
  *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
  *(_DWORD *)(a3 + 16) = v9;
  int v10 = sub_244D7DFA0();
  if (os_signpost_enabled(v10))
  {
    int v11 = 136315394;
    uint64_t v12 = "DeviceCommissioner";
    __int16 v13 = 2080;
    uint64_t v14 = "ValidateAttestationInfo";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", (uint8_t *)&v11, 0x16u);
  }
}

void sub_244DF5E4C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_244D7DFA0();
  if (os_signpost_enabled(v6))
  {
    int v11 = 136315394;
    uint64_t v12 = "DeviceCommissioner";
    __int16 v13 = 2080;
    uint64_t v14 = "CheckForRevokedDACChain";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", (uint8_t *)&v11, 0x16u);
  }
  if (*(_DWORD *)(a1 + 32) == 1)
  {
    uint64_t v7 = *(void *)(a1 + 9152);
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 48))(v7, a2, a1 + 4776);
      int v8 = 0;
      int v9 = 1529;
      goto LABEL_9;
    }
    int v9 = 1525;
  }
  else
  {
    int v9 = 1524;
  }
  int v8 = 3;
LABEL_9:
  *(_DWORD *)a3 = v8;
  *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
  *(_DWORD *)(a3 + 16) = v9;
  int v10 = sub_244D7DFA0();
  if (os_signpost_enabled(v10))
  {
    int v11 = 136315394;
    uint64_t v12 = "DeviceCommissioner";
    __int16 v13 = 2080;
    uint64_t v14 = "CheckForRevokedDACChain";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", (uint8_t *)&v11, 0x16u);
  }
}

void sub_244DF6008(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v14 = sub_244D7DFA0();
  if (os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    __int16 v22 = 2080;
    long long v23 = "ValidateCSR";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  if (*(_DWORD *)(a1 + 32) != 1)
  {
    *(_DWORD *)a7 = 3;
    *(void *)(a7 + 8) = "src/controller/CHIPDeviceController.cpp";
    int v16 = 1536;
LABEL_11:
    *(_DWORD *)(a7 + 16) = v16;
    goto LABEL_12;
  }
  if (!*(void *)(a1 + 9152))
  {
    *(_DWORD *)a7 = 3;
    *(void *)(a7 + 8) = "src/controller/CHIPDeviceController.cpp";
    int v16 = 1537;
    goto LABEL_11;
  }
  *(void *)buf = &unk_26F954540;
  *(void *)(a7 + 8) = 0;
  *(void *)(a7 + 16) = 0;
  *(void *)a7 = 0;
  sub_244CEF4D0(a5, (uint64_t)buf, a7);
  if (!*(_DWORD *)a7)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v18, a2);
    uint64_t v15 = (uint64_t *)sub_2446F7170(&v18);
    v20[0] = sub_244D879D8(*v15) + 216;
    v20[1] = 16;
    if ((_BYTE)v18) {
      (*(void (**)(uint64_t))(*(void *)v19 + 32))(v19);
    }
    (*(void (**)(void, uint64_t, void *, uint64_t, unsigned char *, uint64_t))(**(void **)(a1 + 9152) + 40))(*(void *)(a1 + 9152), a3, v20, a4, buf, a6);
  }
LABEL_12:
  uint64_t v17 = sub_244D7DFA0();
  if (os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    __int16 v22 = 2080;
    long long v23 = "ValidateCSR";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF62B8(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v10 = sub_244D7DFA0();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "SendOperationalCertificateSigningRequestCommand";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  int v11 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a2;
    _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_INFO, "Sending CSR request to %p device", buf, 0xCu);
  }
  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(9u, 3);
  }
  if (!a2)
  {
    a5->n128_u32[0] = 47;
    a5->n128_u64[1] = (unint64_t)"src/controller/CHIPDeviceController.cpp";
    int v13 = 1556;
LABEL_17:
    a5[1].n128_u32[0] = v13;
    goto LABEL_18;
  }
  uint8_t buf[16] = 0;
  *(_OWORD *)buf = *a3;
  a5->n128_u64[1] = 0;
  a5[1].n128_u64[0] = 0;
  a5->n128_u64[0] = 0;
  v16[0] = *(unsigned char *)a4;
  if (v16[0]) {
    int v17 = *(_DWORD *)(a4 + 4);
  }
  sub_244DF6598(a1, a2, (uint64_t)buf, (uint64_t)sub_244DF6770, (uint64_t)sub_244DF69E4, 0, (uint64_t)v16, 0, a5);
  if (!a5->n128_u32[0])
  {
    uint64_t v12 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_INFO, "Sent CSR request, waiting for the CSR", v15, 2u);
    }
    if (sub_244CC4E58(3u)) {
      sub_244CC4DE0(9u, 3);
    }
    a5->n128_u32[0] = 0;
    a5->n128_u64[1] = (unint64_t)"src/controller/CHIPDeviceController.cpp";
    int v13 = 1564;
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v14 = sub_244D7DFA0();
  if (os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "SendOperationalCertificateSigningRequestCommand";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void *sub_244DF6598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  uint64_t v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95A698;
  v27[1] = v17;
  v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95A728;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E06E98(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E07954(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void sub_244DF6770(uint64_t a1, _OWORD *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_244D7DFA0();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "OnOperationalCertificateSigningRequest";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  long long v5 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "Received certificate signing request from the device", buf, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  char v14 = 0;
  long long v6 = a2[1];
  *(_OWORD *)&uint8_t buf[8] = *a2;
  long long v13 = v6;
  *(void *)buf = 2;
  LODWORD(v8) = 0;
  *((void *)&v8 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v9 = 1584;
  sub_244E04164((uint64_t)v10, (uint64_t)buf);
  v11[72] = v14;
  sub_244DF2F10(a1, &v8, (uint64_t)v10);
  if (v10[0] == 4)
  {
    v10[1] = &unk_26F9593F8;
    sub_244D87F44(v11);
  }
  if (*(void *)buf == 4)
  {
    *(void *)&uint8_t buf[8] = &unk_26F9593F8;
    sub_244D87F44((char *)&v13 + 8);
  }
  uint64_t v7 = sub_244D7DFA0();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "OnOperationalCertificateSigningRequest";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF69E4(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_244D7DFA0();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnCSRFailureResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  long long v5 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = *(_OWORD *)a2;
    uint64_t v13 = *(void *)(a2 + 16);
    long long v6 = sub_244CB7B34((const char **)&v12, 1);
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = v6;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "Device failed to receive the CSR request Response: %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    long long v10 = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
    sub_244CB7B34((const char **)&v10, 1);
    sub_244CC4DE0(9u, 2);
  }
  long long v8 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a2 + 16);
  v14[0] = -1;
  v15[72] = 0;
  sub_244DF2F10(a1, &v8, (uint64_t)v14);
  if (v14[0] == 4)
  {
    v14[1] = &unk_26F9593F8;
    sub_244D87F44(v15);
  }
  uint64_t v7 = sub_244D7DFA0();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnCSRFailureResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF6C40(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v10 = sub_244D7DFA0();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "IssueNOCChain";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  if (*(_DWORD *)(a1 + 32) == 1)
  {
    uint64_t v11 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *(unsigned __int8 *)(a1 + 36);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_DEFAULT, "Getting certificate chain for the device on fabric idx %u", buf, 8u);
    }
    if (sub_244CC4E58(2u))
    {
      uint64_t v18 = *(unsigned __int8 *)(a1 + 36);
      sub_244CC4DE0(9u, 2);
    }
    (*(void (**)(void, uint64_t))(**(void **)(a1 + 4288) + 24))(*(void *)(a1 + 4288), a3);
    if (*(unsigned char *)(a1 + 36))
    {
      uint64_t v13 = *(void *)(a1 + 4288);
      uint64_t v14 = sub_244B94EE0(a1);
      if (v14) {
        uint64_t v15 = *(void *)(v14 + 8);
      }
      else {
        uint64_t v15 = 0;
      }
      (*(void (**)(uint64_t, uint64_t))(*(void *)v13 + 32))(v13, v15);
    }
    uint64_t v16 = *(void *)(a1 + 4288);
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    v20[0] = 0;
    v20[1] = 0;
    v19[0] = 0;
    v19[1] = 0;
    (*(void (**)(uint64_t, uint64_t, unsigned char *, void *, void *, void *, void *, uint64_t, uint64_t))(*(void *)v16 + 16))(v16, a2, buf, v22, v21, v20, v19, a4, v18);
  }
  else
  {
    *(_DWORD *)a5 = 3;
    *(void *)(a5 + 8) = "src/controller/CHIPDeviceController.cpp";
    *(_DWORD *)(a5 + 16) = 1624;
  }
  uint64_t v17 = sub_244D7DFA0();
  if (os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "IssueNOCChain";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF6F18(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v16 = sub_244D7DFA0();
  if (os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    __int16 v29 = 2080;
    uint64_t v30 = "ProcessOpCSR";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  if (*(_DWORD *)(a1 + 32) == 1)
  {
    uint64_t v17 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_DEFAULT, "Getting certificate chain for the device from the issuer", buf, 2u);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    *(void *)buf = &unk_26F954540;
    a8[1] = 0;
    a8[2] = 0;
    *a8 = 0;
    sub_244CEF4D0(a5, (uint64_t)buf, (uint64_t)a8);
    if (!*(_DWORD *)a8)
    {
      (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v25, a2);
      uint64_t v18 = (uint64_t *)sub_2446F7170(&v25);
      v27[0] = sub_244D879D8(*v18) + 216;
      v27[1] = 16;
      if ((_BYTE)v25) {
        (*(void (**)(uint64_t))(*(void *)v26 + 32))(v26);
      }
      uint64_t v19 = *(void *)(a1 + 4288);
      uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
      (*(void (**)(uint64_t, uint64_t))(*(void *)v19 + 24))(v19, v20);
      if (*(unsigned char *)(a1 + 36))
      {
        uint64_t v21 = *(void *)(a1 + 4288);
        uint64_t v22 = sub_244B94EE0(a1);
        if (v22) {
          uint64_t v23 = *(void *)(v22 + 8);
        }
        else {
          uint64_t v23 = 0;
        }
        (*(void (**)(uint64_t, uint64_t))(*(void *)v21 + 32))(v21, v23);
      }
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, void *, uint64_t *, uint64_t, uint64_t))(**(void **)(a1 + 4288) + 16))(*(void *)(a1 + 4288), a3, a7, a4, v27, a5, a6, a1 + 4816);
    }
  }
  else
  {
    *(_DWORD *)a8 = 3;
    a8[1] = "src/controller/CHIPDeviceController.cpp";
    *((_DWORD *)a8 + 4) = 1646;
  }
  uint64_t v24 = sub_244D7DFA0();
  if (os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    __int16 v29 = 2080;
    uint64_t v30 = "ProcessOpCSR";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF72C8(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, __n128 *a8@<X8>)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v16 = sub_244D7DFA0();
  if (os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "SendOperationalCertificate";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  if (!a2)
  {
    a8->n128_u32[0] = 47;
    a8->n128_u64[1] = (unint64_t)"src/controller/CHIPDeviceController.cpp";
    int v18 = 1675;
LABEL_15:
    a8[1].n128_u32[0] = v18;
    goto LABEL_16;
  }
  *(_OWORD *)buf = *a3;
  uint8_t buf[16] = *(unsigned char *)a4;
  if (buf[16]) {
    long long v24 = *(_OWORD *)(a4 + 8);
  }
  uint64_t v25 = a5;
  uint64_t v26 = 16;
  uint64_t v27 = a6;
  __int16 v28 = *(_WORD *)(a1 + 4296);
  a8->n128_u64[1] = 0;
  a8[1].n128_u64[0] = 0;
  a8->n128_u64[0] = 0;
  v21[0] = *(unsigned char *)a7;
  if (v21[0]) {
    int v22 = *(_DWORD *)(a7 + 4);
  }
  sub_244DF7570(a1, a2, (uint64_t)buf, (uint64_t)sub_244DF7748, (uint64_t)sub_244DF7B70, 0, (uint64_t)v21, 0, a8);
  if (!a8->n128_u32[0])
  {
    uint64_t v17 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_DEFAULT, "Sent operational certificate to the device", v20, 2u);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    a8->n128_u32[0] = 0;
    a8->n128_u64[1] = (unint64_t)"src/controller/CHIPDeviceController.cpp";
    int v18 = 1689;
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v19 = sub_244D7DFA0();
  if (os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "SendOperationalCertificate";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void *sub_244DF7570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  uint64_t v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95A938;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95A9C8;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E079D8(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E08494(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void sub_244DF7748(uint64_t a1, unsigned char *a2)
{
  long long v5 = buf;
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v6 = sub_244D7DFA0();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)__int16 v28 = "DeviceCommissioner";
    *(_WORD *)&v28[8] = 2080;
    *(void *)&v28[10] = "OnOperationalCertificateAddResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  uint64_t v7 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *a2;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)__int16 v28 = v8;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Device returned status %d on receiving the NOC", buf, 8u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  if (*(_DWORD *)(a1 + 32) == 1)
  {
    uint64_t v9 = *(const char **)(a1 + 4328);
    if (v9)
    {
      int v10 = 197;
      uint64_t v11 = "src/controller/CHIPDeviceController.cpp";
      int v12 = 1700;
      switch(*a2)
      {
        case 0:
          sub_244DF7E14(a1, v9, (uint64_t)buf);
          int v10 = *(_DWORD *)buf;
          if (!*(_DWORD *)buf) {
            goto LABEL_20;
          }
          LODWORD(v5) = *(_DWORD *)v28;
          uint64_t v11 = *(const char **)&v28[4];
          int v12 = *(_DWORD *)&v28[12];
          int v2 = *(_DWORD *)&v28[16];
          break;
        case 1:
          break;
        case 2:
          int v10 = 92;
          int v12 = 1702;
          break;
        case 3:
          int v10 = 80;
          int v12 = 1704;
          break;
        case 4:
          int v10 = 3;
          int v12 = 1706;
          break;
        case 5:
          int v10 = 11;
          int v12 = 1708;
          break;
        case 6:
          int v10 = 120;
          int v12 = 1710;
          break;
        case 7:
          int v10 = 86;
          int v12 = 1719;
          break;
        case 9:
          int v10 = 126;
          int v12 = 1712;
          break;
        case 0xA:
          int v10 = 47;
          int v12 = 1714;
          break;
        case 0xB:
          int v10 = 113;
          int v12 = 1716;
          break;
        default:
          int v10 = 86;
          uint64_t v11 = "src/controller/CHIPDeviceController.cpp";
          int v12 = 1722;
          break;
      }
    }
    else
    {
      int v10 = 3;
      uint64_t v11 = "src/controller/CHIPDeviceController.cpp";
      int v12 = 1744;
    }
  }
  else
  {
    int v10 = 3;
    uint64_t v11 = "src/controller/CHIPDeviceController.cpp";
    int v12 = 1742;
  }
  uint64_t v13 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = (const char *)__PAIR64__(v5, v10);
    v22[1] = v11;
    int v23 = v12;
    int v24 = v2;
    uint64_t v14 = sub_244CB7B34(v22, 1);
    *(_DWORD *)buf = 136315138;
    *(void *)__int16 v28 = v14;
    _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_DEFAULT, "Add NOC failed with error %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    v19[0] = (const char *)__PAIR64__(v5, v10);
    v19[1] = v11;
    int v20 = v12;
    int v21 = v2;
    sub_244CB7B34(v19, 1);
    sub_244CC4DE0(9u, 2);
  }
  *(void *)&long long v16 = __PAIR64__(v5, v10);
  *((void *)&v16 + 1) = v11;
  int v17 = v12;
  int v18 = v2;
  v25[0] = -1;
  v26[72] = 0;
  sub_244DF2F10(a1, &v16, (uint64_t)v25);
  if (v25[0] == 4)
  {
    v25[1] = &unk_26F9593F8;
    sub_244D87F44(v26);
  }
LABEL_20:
  uint64_t v15 = sub_244D7DFA0();
  if (os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)__int16 v28 = "DeviceCommissioner";
    *(_WORD *)&v28[8] = 2080;
    *(void *)&v28[10] = "OnOperationalCertificateAddResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF7B70(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_244D7DFA0();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnAddNOCFailureResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  long long v5 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = *(_OWORD *)a2;
    uint64_t v13 = *(void *)(a2 + 16);
    long long v6 = sub_244CB7B34((const char **)&v12, 1);
    *(_DWORD *)buf = 136315138;
    int v17 = v6;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "Device failed to receive the operational certificate Response: %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    long long v10 = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
    sub_244CB7B34((const char **)&v10, 1);
    sub_244CC4DE0(9u, 2);
  }
  long long v8 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a2 + 16);
  v14[0] = -1;
  v15[72] = 0;
  sub_244DF2F10(a1, &v8, (uint64_t)v14);
  if (v14[0] == 4)
  {
    v14[1] = &unk_26F9593F8;
    sub_244D87F44(v15);
  }
  uint64_t v7 = sub_244D7DFA0();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnAddNOCFailureResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

uint64_t sub_244DF7DCC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (result > 0xB)
  {
    int v3 = 1722;
    int v2 = 86;
  }
  else
  {
    int v2 = dword_244ED5708[(char)result];
    int v3 = dword_244ED5738[(char)result];
  }
  *(_DWORD *)a2 = v2;
  *(void *)(a2 + 8) = "src/controller/CHIPDeviceController.cpp";
  *(_DWORD *)(a2 + 16) = v3;
  return result;
}

void sub_244DF7E14(uint64_t a1@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v6 = sub_244D7DFA0();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnOperationalCredentialsProvisioningCompletion";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  uint64_t v7 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int v17 = a2;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Operational credentials provisioned on device %p", buf, 0xCu);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  if (a2)
  {
    uint64_t v8 = *(void *)(a1 + 4320);
    if (v8) {
      (*(void (**)(uint64_t, void))(*(void *)v8 + 16))(v8, 0);
    }
    LODWORD(v12) = 0;
    *((void *)&v12 + 1) = "src/controller/CHIPDeviceController.cpp";
    int v13 = 1803;
    v14[0] = -1;
    v15[72] = 0;
    sub_244DF2F10(a1, &v12, (uint64_t)v14);
    if (v14[0] == 4)
    {
      v14[1] = &unk_26F9593F8;
      sub_244D87F44(v15);
    }
    int v9 = 0;
    int v10 = 1805;
  }
  else
  {
    int v10 = 1797;
    int v9 = 47;
  }
  *(_DWORD *)a3 = v9;
  *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
  *(_DWORD *)(a3 + 16) = v10;
  uint64_t v11 = sub_244D7DFA0();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnOperationalCredentialsProvisioningCompletion";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF80A0(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v10 = sub_244D7DFA0();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "SendTrustedRootCertificate";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  if (!a2)
  {
    a5->n128_u32[0] = 47;
    a5->n128_u64[1] = (unint64_t)"src/controller/CHIPDeviceController.cpp";
    int v13 = 1763;
LABEL_17:
    a5[1].n128_u32[0] = v13;
    goto LABEL_18;
  }
  uint64_t v11 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_DEFAULT, "Sending root certificate to the device", buf, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  *(_OWORD *)buf = *a3;
  a5->n128_u64[1] = 0;
  a5[1].n128_u64[0] = 0;
  a5->n128_u64[0] = 0;
  v16[0] = *(unsigned char *)a4;
  if (v16[0]) {
    int v17 = *(_DWORD *)(a4 + 4);
  }
  sub_244DF836C(a1, a2, (uint64_t)buf, (uint64_t)sub_244DF8544, (uint64_t)sub_244DF8754, 0, (uint64_t)v16, 0, a5);
  if (!a5->n128_u32[0])
  {
    long long v12 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_DEFAULT, "Sent root certificate to the device", v15, 2u);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    a5->n128_u32[0] = 0;
    a5->n128_u64[1] = (unint64_t)"src/controller/CHIPDeviceController.cpp";
    int v13 = 1774;
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v14 = sub_244D7DFA0();
  if (os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "DeviceCommissioner";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "SendTrustedRootCertificate";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void *sub_244DF836C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  uint64_t v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95ABD8;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95AC68;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E08518(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E08F6C(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void sub_244DF8544(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = sub_244D7DFA0();
  if (os_signpost_enabled(v2))
  {
    *(_DWORD *)buf = 136315394;
    int v10 = "DeviceCommissioner";
    __int16 v11 = 2080;
    long long v12 = "OnRootCertSuccessResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  int v3 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "Device confirmed that it has received the root certificate", buf, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  LODWORD(v5) = 0;
  *((void *)&v5 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v6 = 1782;
  v7[0] = -1;
  v8[72] = 0;
  sub_244DF2F10(a1, &v5, (uint64_t)v7);
  if (v7[0] == 4)
  {
    v7[1] = &unk_26F9593F8;
    sub_244D87F44(v8);
  }
  uint64_t v4 = sub_244D7DFA0();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 136315394;
    int v10 = "DeviceCommissioner";
    __int16 v11 = 2080;
    long long v12 = "OnRootCertSuccessResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF8754(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_244D7DFA0();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnRootCertFailureResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
  long long v5 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = *(_OWORD *)a2;
    uint64_t v13 = *(void *)(a2 + 16);
    int v6 = sub_244CB7B34((const char **)&v12, 1);
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = v6;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "Device failed to receive the root certificate Response: %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    long long v10 = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
    sub_244CB7B34((const char **)&v10, 1);
    sub_244CC4DE0(9u, 2);
  }
  long long v8 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a2 + 16);
  v14[0] = -1;
  v15[72] = 0;
  sub_244DF2F10(a1, &v8, (uint64_t)v14);
  if (v14[0] == 4)
  {
    v14[1] = &unk_26F9593F8;
    sub_244D87F44(v15);
  }
  uint64_t v7 = sub_244D7DFA0();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "DeviceCommissioner";
    __int16 v18 = 2080;
    uint64_t v19 = "OnRootCertFailureResponse";
    _os_signpost_emit_with_name_impl(&dword_2446BD000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "com.csa.matter.signpost", "%s-%s", buf, 0x16u);
  }
}

void sub_244DF89B0()
{
}

void sub_244DF89BC(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  sub_244DE09BC(a1, (uint64_t)a3);
  if (!*(_DWORD *)a3)
  {
    long long v6 = *(_OWORD *)a2;
    uint64_t v7 = *(void *)(a2 + 16);
    sub_244DB1420((uint64_t *)(a1 + 16), &v6, (uint64_t)a3);
  }
}

void *sub_244DF8A28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_244DB15AC((void *)(a1 + 16), a2);
}

uint64_t sub_244DF8A34(uint64_t a1, void *a2)
{
  sub_244DE0530(a1, a2);

  return sub_244DEBF1C(a1 + 4856, a2);
}

void sub_244DF8A78(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  LODWORD(v1) = 0;
  *((void *)&v1 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v2 = 1881;
  v3[0] = -1;
  v4[72] = 0;
  sub_244DF2F10(a1, &v1, (uint64_t)v3);
  if (v3[0] == 4)
  {
    v3[1] = &unk_26F9593F8;
    sub_244D87F44(v4);
  }
}

void sub_244DF8B30(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
    uint64_t v5 = sub_244CB7B34((const char **)&v10, 1);
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Received failure response %s\n", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    long long v8 = *(_OWORD *)a2;
    uint64_t v9 = *(void *)(a2 + 16);
    sub_244CB7B34((const char **)&v8, 1);
    sub_244CC4DE0(9u, 2);
  }
  long long v6 = *(_OWORD *)a2;
  uint64_t v7 = *(void *)(a2 + 16);
  v12[0] = -1;
  v13[72] = 0;
  sub_244DF2F10(a1, &v6, (uint64_t)v12);
  if (v12[0] == 4)
  {
    v12[1] = &unk_26F9593F8;
    sub_244D87F44(v13);
  }
}

void *sub_244DF8CA4(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v7 = a1 + 9104;
  long long v8 = (long long *)(a1 + 9080);
  long long v9 = *a4;
  *(void *)(a1 + 9096) = *((void *)a4 + 2);
  *(_OWORD *)(a1 + 9080) = v9;
  long long v10 = (char *)a4 + 24;
  int v11 = *((unsigned __int8 *)a4 + 24);
  *(unsigned char *)uint64_t v7 = v11;
  if (v11) {
    *(unsigned char *)(v7 + 1) = *((unsigned char *)a4 + 25);
  }
  int v12 = *((unsigned __int8 *)a4 + 26);
  *(unsigned char *)(v7 + 2) = v12;
  if (v12) {
    *(_WORD *)(v7 + 4) = *((_WORD *)a4 + 14);
  }
  int v13 = *((unsigned __int8 *)a4 + 30);
  *(unsigned char *)(v7 + 6) = v13;
  if (v13) {
    *(unsigned char *)(v7 + 7) = *((unsigned char *)a4 + 31);
  }
  int v14 = *((unsigned __int8 *)a4 + 32);
  *(unsigned char *)(v7 + 8) = v14;
  if (v14) {
    *(unsigned char *)(v7 + 9) = *((unsigned char *)a4 + 33);
  }
  if (*(_DWORD *)a4 == 116)
  {
    uint64_t v17 = sub_244DF0570(a1, a3);
    if (v17 == a2)
    {
      __int16 v18 = v45;
      sub_244DE9E28(a2, (uint64_t)v45);
    }
    else
    {
      __int16 v18 = v44;
      (*(void (**)(void *__return_ptr, uint64_t))(*(void *)a2 + 48))(v44, a2);
    }
    int v22 = (uint64_t *)sub_2446F7170(v18);
    buf.n128_u64[1] = 0;
    uint64_t v55 = 0;
    buf.n128_u64[0] = (unint64_t)&unk_26F956F80;
    char v56 = 0;
    sub_244D88328(&buf, v22);
    if (v17 == a2)
    {
      if (v45[0])
      {
        uint64_t v23 = v46;
        goto LABEL_38;
      }
    }
    else if (LOBYTE(v44[0]))
    {
      uint64_t v23 = v44[1];
LABEL_38:
      (*(void (**)(uint64_t))(*(void *)v23 + 32))(v23);
    }
    v43[0] = 0;
    v43[1] = 0;
    sub_244D88108(&v41, &buf);
    sub_244D88108(v40, &buf);
    uint64_t v24 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v59.n128_u32[0] = 134217984;
      *(unint64_t *)((char *)v59.n128_u64 + 4) = a2;
      _os_log_impl(&dword_2446BD000, v24, OS_LOG_TYPE_DEFAULT, "Disarming failsafe on device %p in background", (uint8_t *)&v59, 0xCu);
    }
    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(9u, 2);
    }
    __n128 v38 = 0uLL;
    uint64_t v39 = 0;
    uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
    sub_24479DD24((uint64_t)&buf, (uint64_t)&v59);
    uint64_t v26 = (uint64_t *)sub_2446F7170(&v59);
    sub_244D88108(v37, &v41);
    uint64_t v27 = operator new(0x30uLL);
    *uint64_t v27 = &unk_26F95ACE8;
    sub_244D88194(v27 + 1, v37);
    v53[3] = v27;
    sub_244D88108(v36, v40);
    __int16 v28 = operator new(0x30uLL);
    void *v28 = &unk_26F95AD68;
    sub_244D88194(v28 + 1, v36);
    v52[3] = v28;
    v35[0] = 0;
    sub_244DF9690(v25, v26, 0, (uint64_t)v43, (uint64_t)v53, (uint64_t)v52, (uint64_t)v35, &v38);
    sub_2447E6794(v52);
    sub_244D87F44(v36);
    sub_244E092BC(v53);
    sub_244D87F44(v37);
    if (v59.n128_u8[0]) {
      (*(void (**)(unint64_t))(*(void *)v59.n128_u64[1] + 32))(v59.n128_u64[1]);
    }
    if (v38.n128_u32[0])
    {
      uint64_t v29 = sub_244CC8484(9u, "Controller");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        __n128 v59 = v38;
        uint64_t v60 = v39;
        uint64_t v30 = sub_244CB7B34((const char **)&v59, 1);
        v59.n128_u32[0] = 136315138;
        *(unint64_t *)((char *)v59.n128_u64 + 4) = (unint64_t)v30;
        _os_log_impl(&dword_2446BD000, v29, OS_LOG_TYPE_ERROR, "Failed to send command to disarm fail-safe: %s", (uint8_t *)&v59, 0xCu);
      }
      if (sub_244CC4E58(1u))
      {
        __n128 v59 = v38;
        uint64_t v60 = v39;
        sub_244CB7B34((const char **)&v59, 1);
        sub_244CC4DE0(9u, 1);
      }
    }
    sub_244DF976C(a1);
    sub_244D87F44(v40);
    sub_244D87F44(&v41);
    return (void *)sub_244D87F44(&buf);
  }
  if (!*(_DWORD *)a4)
  {
    int v47 = 0;
    long long v48 = "src/controller/CHIPDeviceController.cpp";
    int v49 = 1926;
    v57[0] = -1;
    v58[72] = 0;
    sub_244DF2F10(a1, &v47, v57);
    if (v57[0] == 4)
    {
      v57[1] = &unk_26F9593F8;
      sub_244D87F44(v58);
    }
    uint64_t v15 = sub_244DF0570(a1, a3);
    if (v15) {
      sub_244DF0730((void *)a1, v15);
    }
    return (void *)sub_244DF93DC(a1, a3, v8);
  }
  if (*v10 && *sub_244DE2AC4(v10) >= 0x17u)
  {
    int v32 = 0;
    uint64_t v33 = "src/controller/CHIPDeviceController.cpp";
    int v34 = 1970;
    v50[0] = -1;
    v51[72] = 0;
    sub_244DF2F10(a1, &v32, v50);
    if (v50[0] == 4)
    {
      v50[1] = &unk_26F9593F8;
      sub_244D87F44(v51);
    }
    return (void *)sub_244DF93DC(a1, a3, v8);
  }
  uint64_t v19 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    buf.n128_u32[0] = 134217984;
    *(unint64_t *)((char *)buf.n128_u64 + 4) = a2;
    _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_DEFAULT, "Disarming failsafe on device %p", (uint8_t *)&buf, 0xCu);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  v40[0] = 0;
  v40[1] = 0;
  __n128 v41 = 0uLL;
  uint64_t v42 = 0;
  v31[0] = 0;
  uint64_t result = sub_244DF5AB8(a1, a2, (uint64_t)v40, (uint64_t)sub_244DF9894, (uint64_t)sub_244DF992C, 0, (uint64_t)v31, 0, &v41);
  if (v41.n128_u32[0])
  {
    uint64_t v20 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __n128 buf = v41;
      uint64_t v55 = v42;
      int v21 = sub_244CB7B34((const char **)&buf, 1);
      buf.n128_u32[0] = 136315138;
      *(unint64_t *)((char *)buf.n128_u64 + 4) = (unint64_t)v21;
      _os_log_impl(&dword_2446BD000, v20, OS_LOG_TYPE_ERROR, "Failed to send command to disarm fail-safe: %s", (uint8_t *)&buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      __n128 buf = v41;
      uint64_t v55 = v42;
      sub_244CB7B34((const char **)&buf, 1);
      sub_244CC4DE0(9u, 1);
    }
    return (void *)sub_244DF976C(a1);
  }
  return result;
}

uint64_t sub_244DF93DC(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *(_DWORD *)__n128 buf = 1;
  *(void *)&uint8_t buf[8] = "core_dcm_commission_device";
  LODWORD(v20) = *(_DWORD *)a3;
  BYTE4(v20) = 3;
  sub_244D7E78C((uint64_t)buf);
  long long v6 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)a3)
    {
      *(_OWORD *)__n128 buf = *a3;
      uint64_t v20 = (char *)*((void *)a3 + 2);
      uint64_t v7 = sub_244CB7B34((const char **)buf, 1);
    }
    else
    {
      uint64_t v7 = "success";
    }
    *(_DWORD *)__n128 buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = HIDWORD(a2);
    *(_WORD *)&uint8_t buf[8] = 1024;
    *(_DWORD *)&buf[10] = a2;
    *(_WORD *)&buf[14] = 2080;
    uint64_t v20 = v7;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "Commissioning complete for node ID 0x%08X%08X: %s", buf, 0x18u);
  }
  if (sub_244CC4E58(2u))
  {
    if (*(_DWORD *)a3)
    {
      *(_OWORD *)__n128 buf = *a3;
      uint64_t v20 = (char *)*((void *)a3 + 2);
      sub_244CB7B34((const char **)buf, 1);
    }
    sub_244CC4DE0(9u, 2);
  }
  *(unsigned char *)(a1 + 4344) = 1;
  uint64_t result = *(void *)(a1 + 4320);
  if (result)
  {
    long long v17 = *a3;
    uint64_t v18 = *((void *)a3 + 2);
    (*(void (**)(uint64_t, uint64_t, long long *))(*(void *)result + 40))(result, a2, &v17);
    uint64_t v9 = sub_244B94EE0(a1);
    if (v9) {
      uint64_t v10 = *(void *)(v9 + 16);
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(void *)(a1 + 4320);
    if (*(_DWORD *)a3)
    {
      long long v15 = *a3;
      uint64_t v16 = *((void *)a3 + 2);
      if (*((unsigned char *)a3 + 24)) {
        uint64_t v12 = *sub_244DE2AC4((unsigned char *)a3 + 24);
      }
      else {
        uint64_t v12 = 0;
      }
      v13[0] = *((unsigned char *)a3 + 26);
      if (v13[0]) {
        __int16 v14 = *((_WORD *)a3 + 14);
      }
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, long long *, uint64_t, unsigned char *))(*(void *)v11 + 56))(v11, a2, v10, &v15, v12, v13);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v11 + 48))(v11, a2, v10);
    }
  }
  return result;
}

void *sub_244DF9690@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, __n128 *a8@<X8>)
{
  _OWORD v18[4] = *MEMORY[0x263EF8340];
  sub_244E0672C((uint64_t)v18, a5);
  sub_2447EBBBC((uint64_t)v17, a6);
  v16[0] = 0;
  sub_244E063DC(a1, a2, a3, a4, (uint64_t)v18, (uint64_t)v17, v16, a7, a8, 0);
  sub_2447E6794(v17);
  return sub_244E092BC(v18);
}

uint64_t sub_244DF976C(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = *(void *)(a1 + 4328);
  if (result)
  {
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)result + 24))(result);
    int v5 = 0;
    long long v6 = "src/controller/CHIPDeviceController.cpp";
    int v7 = 2014;
    v8[0] = -1;
    v9[72] = 0;
    sub_244DF2F10(a1, &v5, v8);
    if (v8[0] == 4)
    {
      v8[1] = &unk_26F9593F8;
      sub_244D87F44(v9);
    }
    uint64_t v4 = sub_244DF0570(a1, v3);
    if (v4) {
      sub_244DF0730((void *)a1, v4);
    }
    return sub_244DF93DC(a1, v3, (long long *)(a1 + 9080));
  }
  return result;
}

uint64_t sub_244DF9894(uint64_t a1)
{
  int v2 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_DEFAULT, "Failsafe disarmed", v4, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  return sub_244DF976C(a1);
}

uint64_t sub_244DF992C(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_OWORD *)__n128 buf = *(_OWORD *)a2;
    uint64_t v8 = *(void *)(a2 + 16);
    int v5 = sub_244CB7B34((const char **)buf, 1);
    *(_DWORD *)__n128 buf = 136315138;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring failure to disarm failsafe: %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    *(_OWORD *)__n128 buf = *(_OWORD *)a2;
    uint64_t v8 = *(void *)(a2 + 16);
    sub_244CB7B34((const char **)buf, 1);
    sub_244CC4DE0(9u, 2);
  }
  return sub_244DF976C(a1);
}

__n128 sub_244DF9A44(uint64_t a1, __n128 *a2)
{
  if (*(void *)a1 == 4)
  {
    *(void *)(a1 + 8) = &unk_26F9593F8;
    sub_244D87F44(a1 + 32);
  }
  *(void *)(a1 + 8) = &unk_26F958210;
  unint64_t v4 = a2->n128_u64[1];
  *(void *)(a1 + 8) = &unk_26F9593F8;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = a2[1].n128_u64[0];
  sub_244D88194(a1 + 32, &a2[1].n128_i8[8]);
  __n128 result = a2[4];
  *(__n128 *)(a1 + 72) = result;
  *(void *)a1 = 4;
  return result;
}

uint64_t sub_244DF9AF0(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *a2;
    *(_DWORD *)__n128 buf = 67109120;
    int v7 = v4;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "Status of extending fail-safe for CASE retry: %u", buf, 8u);
  }
  uint64_t result = sub_244CC4E58(2u);
  if (result) {
    return sub_244CC4DE0(9u, 2);
  }
  return result;
}

uint64_t sub_244DF9BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_OWORD *)__n128 buf = *(_OWORD *)a2;
    uint64_t v7 = *(void *)(a2 + 16);
    int v4 = sub_244CB7B34((const char **)buf, 1);
    *(_DWORD *)__n128 buf = 136315138;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_ERROR, "Failed to extend fail-safe for CASE retry: %s", buf, 0xCu);
  }
  uint64_t result = sub_244CC4E58(1u);
  if (result)
  {
    *(_OWORD *)__n128 buf = *(_OWORD *)a2;
    uint64_t v7 = *(void *)(a2 + 16);
    sub_244CB7B34((const char **)buf, 1);
    return sub_244CC4DE0(9u, 1);
  }
  return result;
}

void sub_244DF9CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!a2 || *(void *)(a1 + 9128) != a2) {
    sub_244E2C564();
  }
  sub_244DF347C((void (****)(void))(a1 + 9128), 0);
  int v3 = *(unsigned __int8 *)(a1 + 4344);
  if (v3 == 3)
  {
    sub_244DF9E04(a1);
  }
  else
  {
    if (v3 != 2) {
      sub_244E2C604();
    }
    LODWORD(v4) = 0;
    *((void *)&v4 + 1) = "src/controller/CHIPDeviceController.cpp";
    int v5 = 2202;
    v6[0] = -1;
    v7[72] = 0;
    sub_244DF2F10(a1, &v4, (uint64_t)v6);
    if (v6[0] == 4)
    {
      v6[1] = &unk_26F9593F8;
      sub_244D87F44(v7);
    }
  }
}

void sub_244DF9E04(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *(_WORD *)uint64_t v8 = -1;
  *(_WORD *)&void v8[4] = -1;
  *(_WORD *)&v8[8] = -1;
  *(void *)&v8[12] = 0;
  *(void *)&v8[18] = 0;
  *(_WORD *)&v8[26] = 514;
  LODWORD(v9) = 0;
  WORD2(v9) = 257;
  *((void *)&v9 + 1) = 0;
  LOBYTE(v10) = 1;
  WORD4(v10) = 0;
  HIDWORD(v10) = 0;
  LODWORD(v11) = 0;
  WORD2(v11) = 0;
  DWORD2(v11) = 0;
  long long v12 = 0uLL;
  sub_244DFA068(a1, (uint64_t)v8, (uint64_t)v15);
  long long v18 = *(_OWORD *)&v15[4];
  int v2 = *(_DWORD *)v15;
  int v19 = *(_DWORD *)&v15[20];
  if (*(_DWORD *)v15)
  {
    int v3 = *(void (****)(void))(a1 + 9120);
    *(void *)(a1 + 9120) = 0;
  }
  else
  {
    sub_244DFABE0(a1, (uint64_t)v8, (uint64_t)v15);
    long long v18 = *(_OWORD *)&v15[4];
    int v2 = *(_DWORD *)v15;
    int v19 = *(_DWORD *)&v15[20];
    int v3 = *(void (****)(void))(a1 + 9120);
    *(void *)(a1 + 9120) = 0;
    uint64_t v4 = *(void *)(a1 + 4320);
    if (v4 && !v2)
    {
      (*(void (**)(uint64_t, unsigned char *))(*(void *)v4 + 72))(v4, v8);
      int v2 = 0;
    }
  }
  v16[1] = v9;
  _DWORD v16[2] = v10;
  v16[3] = v11;
  unsigned __int8 v16[4] = v12;
  *(_OWORD *)&uint8_t v15[8] = *(_OWORD *)v8;
  char v17 = 0;
  v16[0] = *(_OWORD *)&v8[16];
  *(void *)long long v15 = 5;
  int v5 = v2;
  int v7 = v19;
  long long v6 = v18;
  sub_244E04164((uint64_t)v13, (uint64_t)v15);
  v14[72] = v17;
  sub_244DF2F10(a1, (long long *)&v5, (uint64_t)v13);
  if (v13[0] == 4)
  {
    v13[1] = &unk_26F9593F8;
    sub_244D87F44(v14);
  }
  if (*(void *)v15 == 4)
  {
    *(void *)&uint8_t v15[8] = &unk_26F9593F8;
    sub_244D87F44((char *)v16 + 8);
  }
  if (v3)
  {
    (**v3)(v3);
    j__free(v3);
  }
}

void sub_244DFA05C(uint64_t a1, uint64_t a2)
{
}

void sub_244DFA068(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  *(_OWORD *)a3 = xmmword_2651A9E80;
  *(void *)(a3 + 16) = 2246;
  v61[0] = 0;
  uint64_t v6 = *(void *)(a1 + 9120);
  *(_WORD *)__n128 buf = 0;
  *(void *)&uint8_t buf[4] = 0x100000030;
  _OWORD buf[2] = 0;
  sub_244E09650(v6, (uint64_t)buf, v61, &v59);
  if (v59)
  {
    int v7 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)__n128 buf = v59;
      uint64_t v66 = v60;
      uint64_t v8 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "Failed to read BasicCommissioningInfo: %s", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      *(_OWORD *)__n128 buf = v59;
      uint64_t v66 = v60;
      sub_244CB7B34((const char **)buf, 1);
      sub_244CC4DE0(9u, 1);
    }
    *(_OWORD *)a3 = v59;
    *(void *)(a3 + 16) = v60;
  }
  else
  {
    *(_WORD *)(a2 + 24) = v61[0];
  }
  uint64_t v9 = *(void *)(a1 + 9120);
  *(_WORD *)v63 = 0;
  uint64_t v64 = 0x200000030;
  v63[2] = 0;
  sub_244E096F8(v9, (uint64_t)v63, (unsigned char *)(a2 + 26), buf);
  long long v59 = *(_OWORD *)buf;
  uint64_t v60 = v66;
  if (*(_DWORD *)buf)
  {
    long long v10 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)__n128 buf = v59;
      uint64_t v66 = v60;
      long long v11 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "Failed to read RegulatoryConfig: %s", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      *(_OWORD *)__n128 buf = v59;
      uint64_t v66 = v60;
      sub_244CB7B34((const char **)buf, 1);
      sub_244CC4DE0(9u, 1);
    }
    *(_OWORD *)a3 = v59;
    *(void *)(a3 + 16) = v60;
  }
  uint64_t v12 = *(void *)(a1 + 9120);
  *(_WORD *)v63 = 0;
  uint64_t v64 = 0x300000030;
  v63[2] = 0;
  sub_244E097A0(v12, (uint64_t)v63, (unsigned char *)(a2 + 27), buf);
  long long v59 = *(_OWORD *)buf;
  uint64_t v60 = v66;
  if (*(_DWORD *)buf)
  {
    int v13 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)__n128 buf = v59;
      uint64_t v66 = v60;
      __int16 v14 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_ERROR, "Failed to read LocationCapability: %s", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      *(_OWORD *)__n128 buf = v59;
      uint64_t v66 = v60;
      sub_244CB7B34((const char **)buf, 1);
      sub_244CC4DE0(9u, 1);
    }
    *(_OWORD *)a3 = v59;
    *(void *)(a3 + 16) = v60;
  }
  uint64_t v15 = *(void *)(a1 + 9120);
  *(_WORD *)v63 = 0;
  uint64_t v64 = 48;
  v63[2] = 0;
  sub_244E09848(v15, (uint64_t)v63, (void *)(a2 + 16), buf);
  long long v59 = *(_OWORD *)buf;
  uint64_t v60 = v66;
  if (*(_DWORD *)buf)
  {
    uint64_t v16 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)__n128 buf = v59;
      uint64_t v66 = v60;
      char v17 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_ERROR, "Failed to read Breadcrumb: %s", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      *(_OWORD *)__n128 buf = v59;
      uint64_t v66 = v60;
      sub_244CB7B34((const char **)buf, 1);
      sub_244CC4DE0(9u, 1);
    }
    *(_OWORD *)a3 = v59;
    *(void *)(a3 + 16) = v60;
  }
  uint64_t v18 = *(void *)(a1 + 9120);
  *(_WORD *)v63 = 0;
  uint64_t v64 = 0x200000028;
  v63[2] = 0;
  sub_244E098F0(v18, (uint64_t)v63, (_WORD *)(a2 + 12), (uint64_t)buf);
  long long v59 = *(_OWORD *)buf;
  uint64_t v60 = v66;
  if (*(_DWORD *)buf) {
    int v19 = &v59;
  }
  else {
    int v19 = (long long *)a3;
  }
  uint64_t v20 = *((void *)v19 + 2);
  *(_OWORD *)a3 = *v19;
  *(void *)(a3 + 16) = v20;
  uint64_t v21 = *(void *)(a1 + 9120);
  *(_WORD *)v63 = 0;
  uint64_t v64 = 0x400000028;
  v63[2] = 0;
  sub_244E099BC(v21, (uint64_t)v63, (_WORD *)(a2 + 14), buf);
  long long v59 = *(_OWORD *)buf;
  uint64_t v60 = v66;
  if (*(_DWORD *)buf) {
    int v22 = &v59;
  }
  else {
    int v22 = (long long *)a3;
  }
  uint64_t v23 = *((void *)v22 + 2);
  *(_OWORD *)a3 = *v22;
  *(void *)(a3 + 16) = v23;
  uint64_t v24 = *((void *)v22 + 2);
  *(_OWORD *)a3 = *v22;
  *(void *)(a3 + 16) = v24;
  uint64_t v25 = *(void *)(a1 + 9120);
  uint64_t v26 = *(void **)(v25 + 16);
  uint64_t v55 = a3;
  char v56 = (void *)(v25 + 24);
  __int16 v58 = (__int16 *)a2;
  if (v26 != (void *)(v25 + 24))
  {
    while (1)
    {
      uint64_t v27 = (void *)v26[5];
      if (v27 != v26 + 6) {
        break;
      }
LABEL_78:
      __n128 v41 = (void *)v26[1];
      if (v41)
      {
        do
        {
          uint64_t v42 = v41;
          __n128 v41 = (void *)*v41;
        }
        while (v41);
      }
      else
      {
        do
        {
          uint64_t v42 = (void *)v26[2];
          BOOL v38 = *v42 == (void)v26;
          uint64_t v26 = v42;
        }
        while (!v38);
      }
      uint64_t v26 = v42;
      if (v42 == v56)
      {
        uint64_t v25 = *(void *)(a1 + 9120);
        uint64_t v26 = *(void **)(v25 + 16);
        goto LABEL_85;
      }
    }
    while (1)
    {
      if (*((_DWORD *)v27 + 8) == 49)
      {
        __int16 v28 = (void *)v27[5];
        if (v28 != v27 + 6) {
          break;
        }
      }
LABEL_72:
      uint64_t v39 = (void *)v27[1];
      if (v39)
      {
        do
        {
          char v40 = v39;
          uint64_t v39 = (void *)*v39;
        }
        while (v39);
      }
      else
      {
        do
        {
          char v40 = (void *)v27[2];
          BOOL v38 = *v40 == (void)v27;
          uint64_t v27 = v40;
        }
        while (!v38);
      }
      uint64_t v27 = v40;
      if (v40 == v26 + 6) {
        goto LABEL_78;
      }
    }
    while (1)
    {
      int v29 = *((_DWORD *)v28 + 8);
      LOWORD(v61[0]) = *((_WORD *)v26 + 16);
      v61[1] = 49;
      v61[2] = v29;
      BYTE2(v61[0]) = 0;
      if (v29 == 65532)
      {
        sub_244CB3988((uint64_t)buf);
        sub_244CAF3C0(*(void *)(a1 + 9120), (unsigned __int16 *)v61, (uint64_t)buf, v63);
        if (!*(_DWORD *)v63)
        {
          int v62 = 0;
          sub_244E09A64((uint64_t)buf, &v62, v63);
          if (!*(_DWORD *)v63)
          {
            char v30 = v62;
            if (v62)
            {
              int v34 = sub_244CC8484(9u, "Controller");
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v63 = 67109120;
                LODWORD(v64) = LOWORD(v61[0]);
                _os_log_impl(&dword_2446BD000, v34, OS_LOG_TYPE_DEFAULT, "----- NetworkCommissioning Features: has WiFi. endpointid = %u", v63, 8u);
              }
              if (sub_244CC4E58(2u)) {
                sub_244CC4DE0(9u, 2);
              }
              __int16 v33 = v61[0];
              a2 = (uint64_t)v58;
              goto LABEL_55;
            }
            if ((v62 & 2) != 0)
            {
              __int16 v35 = sub_244CC8484(9u, "Controller");
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v63 = 67109120;
                LODWORD(v64) = LOWORD(v61[0]);
                _os_log_impl(&dword_2446BD000, v35, OS_LOG_TYPE_DEFAULT, "----- NetworkCommissioning Features: has Thread. endpointid = %u", v63, 8u);
              }
              if (sub_244CC4E58(2u)) {
                sub_244CC4DE0(9u, 2);
              }
              a2 = (uint64_t)v58;
              v58[2] = v61[0];
              goto LABEL_66;
            }
            uint64_t v31 = sub_244CC8484(9u, "Controller");
            BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
            if ((v30 & 4) != 0)
            {
              if (v32)
              {
                *(_DWORD *)v63 = 67109120;
                LODWORD(v64) = LOWORD(v61[0]);
                _os_log_impl(&dword_2446BD000, v31, OS_LOG_TYPE_DEFAULT, "----- NetworkCommissioning Features: has Ethernet. endpointid = %u", v63, 8u);
              }
              if (sub_244CC4E58(2u)) {
                sub_244CC4DE0(9u, 2);
              }
              a2 = (uint64_t)v58;
              v58[4] = v61[0];
              goto LABEL_66;
            }
            if (v32)
            {
              *(_WORD *)v63 = 0;
              _os_log_impl(&dword_2446BD000, v31, OS_LOG_TYPE_DEFAULT, "----- NetworkCommissioning Features: no features.", v63, 2u);
            }
            if (sub_244CC4E58(2u)) {
              sub_244CC4DE0(9u, 2);
            }
            a2 = (uint64_t)v58;
            if (v58[2] == -1) {
              v58[2] = v61[0];
            }
            if (*v58 == -1)
            {
              __int16 v33 = v61[0];
LABEL_55:
              *(_WORD *)a2 = v33;
            }
          }
        }
      }
LABEL_66:
      uint64_t v36 = (void *)v28[1];
      if (v36)
      {
        do
        {
          uint64_t v37 = v36;
          uint64_t v36 = (void *)*v36;
        }
        while (v36);
      }
      else
      {
        do
        {
          uint64_t v37 = (void *)v28[2];
          BOOL v38 = *v37 == (void)v28;
          __int16 v28 = v37;
        }
        while (!v38);
      }
      __int16 v28 = v37;
      if (v37 == v27 + 6) {
        goto LABEL_72;
      }
    }
  }
LABEL_85:
  *(void *)&long long v59 = 0;
  *((void *)&v59 + 1) = "src/app/ClusterStateCache.h";
  uint64_t v60 = 419;
  long long v57 = (void *)(v25 + 24);
  if (v26 == (void *)(v25 + 24))
  {
LABEL_117:
    *(_DWORD *)__n128 buf = 0;
    *(void *)&uint8_t buf[8] = "src/app/ClusterStateCache.h";
    LODWORD(v66) = 419;
    goto LABEL_119;
  }
  while (1)
  {
    char v43 = (void *)v26[5];
    if (v43 != v26 + 6) {
      break;
    }
LABEL_111:
    long long v50 = (void *)v26[1];
    if (v50)
    {
      do
      {
        long long v51 = v50;
        long long v50 = (void *)*v50;
      }
      while (v50);
    }
    else
    {
      do
      {
        long long v51 = (void *)v26[2];
        BOOL v38 = *v51 == (void)v26;
        uint64_t v26 = v51;
      }
      while (!v38);
    }
    uint64_t v26 = v51;
    a2 = (uint64_t)v58;
    if (v51 == v57) {
      goto LABEL_117;
    }
  }
  while (1)
  {
    if (*((_DWORD *)v43 + 8) == 49)
    {
      uint64_t v44 = (void *)v43[5];
      if (v44 != v43 + 6) {
        break;
      }
    }
LABEL_105:
    long long v48 = (void *)v43[1];
    if (v48)
    {
      do
      {
        int v49 = v48;
        long long v48 = (void *)*v48;
      }
      while (v48);
    }
    else
    {
      do
      {
        int v49 = (void *)v43[2];
        BOOL v38 = *v49 == (void)v43;
        char v43 = v49;
      }
      while (!v38);
    }
    char v43 = v49;
    if (v49 == v26 + 6) {
      goto LABEL_111;
    }
  }
  while (1)
  {
    int v45 = *((_DWORD *)v44 + 8);
    *(_WORD *)v63 = *((_WORD *)v26 + 16);
    LODWORD(v64) = 49;
    HIDWORD(v64) = v45;
    v63[2] = 0;
    uint64_t v66 = 0;
    memset(buf, 0, sizeof(buf));
    if (v45 == 3) {
      break;
    }
    *(void *)&uint8_t buf[8] = "src/controller/CHIPDeviceController.cpp";
    LODWORD(v66) = 2360;
LABEL_99:
    uint64_t v46 = (void *)v44[1];
    if (v46)
    {
      do
      {
        int v47 = v46;
        uint64_t v46 = (void *)*v46;
      }
      while (v46);
    }
    else
    {
      do
      {
        int v47 = (void *)v44[2];
        BOOL v38 = *v47 == (void)v44;
        uint64_t v44 = v47;
      }
      while (!v38);
    }
    uint64_t v44 = v47;
    if (v47 == v43 + 6) {
      goto LABEL_105;
    }
  }
  LOBYTE(v61[0]) = 0;
  uint64_t v66 = 0;
  memset(buf, 0, sizeof(buf));
  sub_244E09ACC(*(void *)(a1 + 9120), (uint64_t)v63, v61, buf);
  if (!*(_DWORD *)buf)
  {
    if (*(unsigned __int16 *)v63 == (unsigned __int16)*v58)
    {
      *((unsigned char *)v58 + 2) = v61[0];
    }
    else if (*(unsigned __int16 *)v63 == (unsigned __int16)v58[2])
    {
      *((unsigned char *)v58 + 6) = v61[0];
    }
    else if (*(unsigned __int16 *)v63 == (unsigned __int16)v58[4])
    {
      *((unsigned char *)v58 + 10) = v61[0];
    }
    *(_DWORD *)__n128 buf = 0;
    *(void *)&uint8_t buf[8] = "src/controller/CHIPDeviceController.cpp";
    LODWORD(v66) = 2376;
    goto LABEL_99;
  }
  a2 = (uint64_t)v58;
LABEL_119:
  long long v59 = *(_OWORD *)buf;
  uint64_t v60 = v66;
  long long v52 = &v59;
  if (!*(_DWORD *)buf) {
    long long v52 = (long long *)v55;
  }
  uint64_t v53 = *((void *)v52 + 2);
  *(_OWORD *)uint64_t v55 = *v52;
  *(void *)(v55 + 16) = v53;
  sub_244DFAD74(a1, a2);
  if (*(_DWORD *)v55)
  {
    char v54 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl(&dword_2446BD000, v54, OS_LOG_TYPE_ERROR, "Error parsing commissioning information", buf, 2u);
    }
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(9u, 1);
    }
  }
}

void sub_244DFABE0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(_OWORD *)a3 = xmmword_2651A9E98;
  *(void *)(a3 + 16) = 2452;
  uint64_t v6 = *(void *)(a1 + 9120);
  int v7 = (unsigned char *)(a2 + 48);
  __int16 v10 = 0;
  uint64_t v12 = 0x400000030;
  char v11 = 0;
  sub_244E09EC0(v6, (uint64_t)&v10, (char *)(a2 + 48), buf);
  if (*(_DWORD *)buf)
  {
    uint64_t v8 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)__n128 buf = xmmword_2651A9E98;
      uint64_t v14 = 2452;
      uint64_t v9 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "Failed to read SupportsConcurrentConnection: %s", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      *(_OWORD *)__n128 buf = xmmword_2651A9E98;
      uint64_t v14 = 2452;
      sub_244CB7B34((const char **)buf, 1);
      sub_244CC4DE0(9u, 1);
    }
    *int v7 = 1;
  }
  sub_244DFAF0C(a1, a2, a3);
  if (!*(_DWORD *)a3) {
    sub_244DFB508(a1, a2, a3);
  }
}

void sub_244DFAD74(uint64_t a1, uint64_t a2)
{
  int v15 = 0;
  uint64_t v4 = *(void *)(a1 + 9120);
  LOWORD(v13) = 0;
  uint64_t v14 = 0xFFFC00000038;
  BYTE2(v13) = 0;
  sub_244E09B74(v4, (uint64_t)&v13, &v15, v10);
  if (LODWORD(v10[0]))
  {
    *(_DWORD *)(a2 + 32) = 0;
  }
  else
  {
    *(unsigned char *)(a2 + 32) = 1;
    char v5 = v15;
    *(unsigned char *)(a2 + 33) = v15 & 1;
    *(unsigned char *)(a2 + 34) = (v5 & 2) != 0;
    *(unsigned char *)(a2 + 35) = (v5 & 8) != 0;
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 9120);
      LOWORD(v13) = 0;
      uint64_t v14 = 0xA00000038;
      BYTE2(v13) = 0;
      sub_244E09C20(v6, (uint64_t)&v13, (unsigned char *)(a2 + 36), v10);
      if (LODWORD(v10[0])) {
        *(unsigned char *)(a2 + 33) = 0;
      }
      uint64_t v7 = *(void *)(a1 + 9120);
      LOWORD(v13) = 0;
      uint64_t v14 = 0xB00000038;
      BYTE2(v13) = 0;
      sub_244E09CC8(v7, (uint64_t)&v13, (unsigned char *)(a2 + 37), v10);
      if (LODWORD(v10[0])) {
        *(unsigned char *)(a2 + 33) = 0;
      }
    }
    if (*(unsigned char *)(a2 + 34))
    {
      LOBYTE(v10[0]) = 0;
      char v11 = 0;
      uint64_t v8 = *(void *)(a1 + 9120);
      __int16 v16 = 0;
      uint64_t v18 = 0x400000038;
      char v17 = 0;
      sub_244E09D70(v8, (uint64_t)&v16, (uint64_t)v10, &v13);
      if (!v13 && v11 && v10[1]) {
        *(unsigned char *)(a2 + 34) = 0;
      }
    }
    if (*(unsigned char *)(a2 + 35))
    {
      LOBYTE(v10[0]) = 0;
      char v12 = 0;
      uint64_t v9 = *(void *)(a1 + 9120);
      __int16 v16 = 0;
      uint64_t v18 = 0x300000038;
      char v17 = 0;
      sub_244E09E18(v9, (uint64_t)&v16, (uint64_t)v10, &v13);
      if (!v13)
      {
        if (v12) {
          *(unsigned char *)(a2 + 35) = 0;
        }
      }
    }
  }
}

uint64_t sub_244DFAF0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  *(_OWORD *)a3 = xmmword_2651A9EB0;
  *(void *)(a3 + 16) = 2477;
  uint64_t v4 = *(void *)(a1 + 9120);
  char v5 = *(void **)(v4 + 16);
  int v29 = (void *)(v4 + 24);
  if (v5 != (void *)(v4 + 24))
  {
    while (1)
    {
      uint64_t v6 = (void *)v5[5];
      char v30 = v5 + 6;
      if (v6 != v5 + 6) {
        break;
      }
LABEL_55:
      uint64_t v26 = (void *)v5[1];
      if (v26)
      {
        do
        {
          uint64_t v27 = v26;
          uint64_t v26 = (void *)*v26;
        }
        while (v26);
      }
      else
      {
        do
        {
          uint64_t v27 = (void *)v5[2];
          BOOL v23 = *v27 == (void)v5;
          char v5 = v27;
        }
        while (!v23);
      }
      char v5 = v27;
      if (v27 == v29) {
        goto LABEL_61;
      }
    }
    BOOL v32 = v5;
    while (1)
    {
      if (*((_DWORD *)v6 + 8) == 62)
      {
        uint64_t v7 = (void *)v6[5];
        uint64_t v8 = v6 + 6;
        if (v7 != v6 + 6) {
          break;
        }
      }
LABEL_49:
      uint64_t v24 = (void *)v6[1];
      if (v24)
      {
        do
        {
          uint64_t v25 = v24;
          uint64_t v24 = (void *)*v24;
        }
        while (v24);
      }
      else
      {
        do
        {
          uint64_t v25 = (void *)v6[2];
          BOOL v23 = *v25 == (void)v6;
          uint64_t v6 = v25;
        }
        while (!v23);
      }
      uint64_t v6 = v25;
      if (v25 == v30) {
        goto LABEL_55;
      }
    }
    while (1)
    {
      int v9 = *((_DWORD *)v7 + 8);
      __int16 v36 = *((_WORD *)v5 + 16);
      int v38 = 62;
      int v39 = v9;
      char v37 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      uint64_t v33 = 0;
      if (v9 == 1)
      {
        sub_244CB3988((uint64_t)v47);
        uint8_t v48 = 0;
        sub_244CB39B8((uint64_t)v47, 0, 0);
        uint64_t v33 = 0;
        int v34 = 0;
        uint64_t v35 = 0;
        sub_244E09F68(*(void *)(a1 + 9120), (uint64_t)&v36, (uint64_t)v47, &v33);
        if (v33) {
          break;
        }
        buf[0] = v48;
        if (v48) {
          buf[1] = v49;
        }
        sub_244BC1D44((uint64_t)&v42, (uint64_t)v47, buf);
        if (sub_244BC1B90((uint64_t)&v42))
        {
          while (1)
          {
            __int16 v10 = sub_244CC8484(9u, "Controller");
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__n128 buf = 67110144;
              *(_DWORD *)&uint8_t buf[4] = v44;
              *(_WORD *)long long v52 = 1024;
              *(_DWORD *)&v52[2] = HIDWORD(v45);
              *(_WORD *)&v52[6] = 1024;
              *(_DWORD *)&v52[8] = v45;
              *(_WORD *)&v52[12] = 1024;
              *(_DWORD *)&v52[14] = HIDWORD(v46);
              *(_WORD *)&v52[18] = 1024;
              *(_DWORD *)&v52[20] = v46;
              _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "DeviceCommissioner::OnDone - fabric.vendorId=0x%04X fabric.fabricId=0x%08X%08X fabric.nodeId=0x%08X%08X", buf, 0x20u);
            }
            if (sub_244CC4E58(2u)) {
              sub_244CC4DE0(9u, 2);
            }
            uint64_t v11 = sub_244B94EE0(a1);
            if (v11) {
              uint64_t v12 = *(void *)(v11 + 8);
            }
            else {
              uint64_t v12 = 0;
            }
            if (v12 != v45) {
              goto LABEL_33;
            }
            int v13 = sub_244CC8484(9u, "Controller");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__n128 buf = 0;
              _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_DEFAULT, "DeviceCommissioner::OnDone - found a matching fabric id", buf, 2u);
            }
            if (sub_244CC4E58(2u)) {
              sub_244CC4DE0(9u, 2);
            }
            int v14 = v43;
            if (v43 != 65) {
              break;
            }
            sub_2446CD4B0(&v41, v42);
            *(void *)__n128 buf = &unk_26F954540;
            *(_OWORD *)long long v52 = *(_OWORD *)v41;
            long long v16 = *(_OWORD *)(v41 + 32);
            long long v15 = *(_OWORD *)(v41 + 48);
            long long v17 = *(_OWORD *)(v41 + 16);
            char v55 = *(unsigned char *)(v41 + 64);
            long long v53 = v16;
            long long v54 = v15;
            *(_OWORD *)&v52[16] = v17;
            v50[0] = &unk_26F954540;
            sub_244E03FB8(a1, (uint64_t)v50, (uint64_t)v40);
            if (!*(_DWORD *)v40)
            {
              if (sub_244B9221C((uint64_t)v50, (uint64_t)buf))
              {
                uint64_t v20 = sub_244CC8484(9u, "Controller");
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)char v40 = 0;
                  _os_log_impl(&dword_2446BD000, v20, OS_LOG_TYPE_DEFAULT, "DeviceCommissioner::OnDone - fabric root keys match", v40, 2u);
                }
                if (sub_244CC4E58(2u)) {
                  sub_244CC4DE0(9u, 2);
                }
                *(void *)(a2 + 40) = v46;
              }
              goto LABEL_33;
            }
            uint64_t v18 = sub_244CC8484(9u, "Controller");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)char v40 = 0;
              _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_ERROR, "DeviceCommissioner::OnDone - error reading commissioner root public key", v40, 2u);
            }
            if (sub_244CC4E58(1u)) {
              goto LABEL_32;
            }
LABEL_33:
            if (!sub_244BC1B90((uint64_t)&v42)) {
              goto LABEL_42;
            }
          }
          int v19 = sub_244CC8484(9u, "Controller");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__n128 buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = v14;
            *(_WORD *)long long v52 = 1024;
            *(_DWORD *)&v52[2] = 65;
            _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_ERROR, "DeviceCommissioner::OnDone - fabric root key size mismatch %u != %u", buf, 0xEu);
          }
          if (!sub_244CC4E58(1u)) {
            goto LABEL_33;
          }
LABEL_32:
          sub_244CC4DE0(9u, 1);
          goto LABEL_33;
        }
LABEL_42:
        LODWORD(v33) = 0;
        int v34 = "src/controller/CHIPDeviceController.cpp";
        LODWORD(v35) = 2529;
        char v5 = v32;
        uint64_t v8 = v6 + 6;
      }
      else
      {
        int v34 = "src/controller/CHIPDeviceController.cpp";
        LODWORD(v35) = 2532;
      }
      uint64_t v21 = (void *)v7[1];
      if (v21)
      {
        do
        {
          int v22 = v21;
          uint64_t v21 = (void *)*v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          int v22 = (void *)v7[2];
          BOOL v23 = *v22 == (void)v7;
          uint64_t v7 = v22;
        }
        while (!v23);
      }
      uint64_t v7 = v22;
      if (v22 == v8) {
        goto LABEL_49;
      }
    }
  }
LABEL_61:
  uint64_t result = *(void *)(a1 + 4320);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(*(void *)result + 80))(result, *(void *)(a2 + 40));
  }
  return result;
}

void sub_244DFB508(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  unsigned int v46 = 0;
  uint64_t v6 = *(void *)(a1 + 9120);
  unsigned __int16 v47 = 0;
  uint64_t v49 = 0xFFFC00000046;
  char v48 = 0;
  sub_244E0A010(v6, (uint64_t)&v47, &v46, &buf);
  int v8 = buf;
  int v7 = DWORD1(buf);
  int v9 = (const char *)*((void *)&buf + 1);
  int v11 = v51;
  int v10 = HIDWORD(v51);
  if (!buf)
  {
    unsigned int v17 = v46;
    *(unsigned char *)(a2 + 56) = (v46 & 4) != 0;
    *(unsigned char *)(a2 + 57) = v17 & 1;
    int v18 = (v17 >> 1) & 1;
    goto LABEL_8;
  }
  if (buf == 16)
  {
    int v18 = 0;
    *(unsigned char *)(a2 + 56) = 0;
    int v11 = 2564;
    int v9 = "src/controller/CHIPDeviceController.cpp";
LABEL_8:
    *(_DWORD *)a3 = 0;
    *(_DWORD *)(a3 + 4) = v7;
    *(void *)(a3 + 8) = v9;
    *(_DWORD *)(a3 + 16) = v11;
    *(_DWORD *)(a3 + 20) = v10;
    *(void *)(a2 + 80) = 0;
    *(_DWORD *)(a2 + 72) = 0;
    *(void *)(a2 + 88) = 0;
    if (v18)
    {
      uint64_t v19 = *(void *)(a1 + 9120);
      unsigned __int16 v47 = 0;
      uint64_t v49 = 0x600000046;
      char v48 = 0;
      sub_244E0A0BC(v19, (uint64_t)&v47, (_DWORD *)(a2 + 72), &buf);
      if (buf)
      {
        uint64_t v20 = *((void *)&buf + 1);
        uint64_t v44 = buf;
        unint64_t v21 = v51;
        int v22 = sub_244CC8484(9u, "Controller");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_ERROR, "IcdManagement.UserActiveModeTriggerHint expected, but failed to read.", (uint8_t *)&buf, 2u);
        }
        if (!sub_244CC4E58(1u)) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      if ((*(_DWORD *)(a2 + 72) & 0x1AEE4) != 0)
      {
        uint64_t v23 = *(void *)(a1 + 9120);
        unsigned __int16 v47 = 0;
        uint64_t v49 = 0x700000046;
        char v48 = 0;
        sub_244E0A164(v23, (uint64_t)&v47, (_OWORD *)(a2 + 80), &buf);
        if (buf)
        {
          uint64_t v20 = *((void *)&buf + 1);
          uint64_t v44 = buf;
          unint64_t v21 = v51;
          uint64_t v24 = sub_244CC8484(9u, "Controller");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_2446BD000, v24, OS_LOG_TYPE_ERROR, "IcdManagement.UserActiveModeTriggerInstruction expected for given active mode trigger hint, but failed to read.", (uint8_t *)&buf, 2u);
          }
          if (!sub_244CC4E58(1u)) {
            goto LABEL_14;
          }
LABEL_13:
          sub_244CC4DE0(9u, 1);
LABEL_14:
          *(void *)a3 = v44;
          *(void *)(a3 + 8) = v20;
          *(void *)(a3 + 16) = v21;
          return;
        }
      }
    }
    if (v8)
    {
LABEL_23:
      *(_DWORD *)(a2 + 60) = 0;
      *(_DWORD *)(a2 + 64) = 0;
      *(_WORD *)(a2 + 68) = 0;
      *(_DWORD *)a3 = 0;
      *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
      *(_DWORD *)(a3 + 16) = 2629;
      return;
    }
    uint64_t v25 = *(void *)(a1 + 9120);
    unsigned __int16 v47 = 0;
    uint64_t v49 = 70;
    char v48 = 0;
    sub_244E0A20C(v25, (uint64_t)&v47, (_DWORD *)(a2 + 60), &buf);
    unsigned int v26 = buf;
    if (buf)
    {
      unsigned int v27 = DWORD1(buf);
      uint64_t v28 = *((void *)&buf + 1);
      unsigned int v29 = v51;
      unsigned int v30 = HIDWORD(v51);
      uint64_t v31 = sub_244CC8484(9u, "Controller");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(void *)&long long buf = __PAIR64__(v27, v26);
        *((void *)&buf + 1) = v28;
        unint64_t v51 = __PAIR64__(v30, v29);
        BOOL v32 = sub_244CB7B34((const char **)&buf, 1);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v32;
        _os_log_impl(&dword_2446BD000, v31, OS_LOG_TYPE_ERROR, "IcdManagement.IdleModeDuration expected, but failed to read: %s", (uint8_t *)&buf, 0xCu);
      }
      if (!sub_244CC4E58(1u)) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v33 = *(void *)(a1 + 9120);
      unsigned __int16 v47 = 0;
      uint64_t v49 = 0x100000046;
      char v48 = 0;
      sub_244E0A2B4(v33, (uint64_t)&v47, (_DWORD *)(a2 + 64), &buf);
      unsigned int v26 = buf;
      if (!buf)
      {
        uint64_t v39 = *(void *)(a1 + 9120);
        unsigned __int16 v47 = 0;
        uint64_t v49 = 0x200000046;
        char v48 = 0;
        sub_244E0A35C(v39, (uint64_t)&v47, (_WORD *)(a2 + 68), &buf);
        unsigned int v40 = buf;
        unsigned int v41 = DWORD1(buf);
        uint64_t v28 = *((void *)&buf + 1);
        unsigned int v29 = v51;
        unsigned int v30 = HIDWORD(v51);
        if (buf)
        {
          uint64_t v42 = sub_244CC8484(9u, "Controller");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(void *)&long long buf = __PAIR64__(v41, v40);
            *((void *)&buf + 1) = v28;
            unint64_t v51 = __PAIR64__(v30, v29);
            uint64_t v43 = sub_244CB7B34((const char **)&buf, 1);
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = v43;
            _os_log_impl(&dword_2446BD000, v42, OS_LOG_TYPE_ERROR, "IcdManagement.ActiveModeThreshold expected, but failed to read: %s", (uint8_t *)&buf, 0xCu);
          }
          if (sub_244CC4E58(1u))
          {
            *(void *)&long long buf = __PAIR64__(v41, v40);
            *((void *)&buf + 1) = v28;
            unint64_t v51 = __PAIR64__(v30, v29);
            sub_244CB7B34((const char **)&buf, 1);
            sub_244CC4DE0(9u, 1);
          }
        }
        *(_DWORD *)a3 = v40;
        *(_DWORD *)(a3 + 4) = v41;
        goto LABEL_37;
      }
      unsigned int v27 = DWORD1(buf);
      uint64_t v28 = *((void *)&buf + 1);
      unsigned int v29 = v51;
      unsigned int v30 = HIDWORD(v51);
      int v34 = sub_244CC8484(9u, "Controller");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(void *)&long long buf = __PAIR64__(v27, v26);
        *((void *)&buf + 1) = v28;
        unint64_t v51 = __PAIR64__(v30, v29);
        uint64_t v35 = sub_244CB7B34((const char **)&buf, 1);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v35;
        _os_log_impl(&dword_2446BD000, v34, OS_LOG_TYPE_ERROR, "IcdManagement.ActiveModeDuration expected, but failed to read: %s", (uint8_t *)&buf, 0xCu);
      }
      if (!sub_244CC4E58(1u))
      {
LABEL_36:
        *(_DWORD *)a3 = v26;
        *(_DWORD *)(a3 + 4) = v27;
LABEL_37:
        *(void *)(a3 + 8) = v28;
        *(_DWORD *)(a3 + 16) = v29;
        *(_DWORD *)(a3 + 20) = v30;
        return;
      }
    }
    *(void *)&long long buf = __PAIR64__(v27, v26);
    *((void *)&buf + 1) = v28;
    unint64_t v51 = __PAIR64__(v30, v29);
    sub_244CB7B34((const char **)&buf, 1);
    sub_244CC4DE0(9u, 1);
    goto LABEL_36;
  }
  if (buf != 202)
  {
    *(_DWORD *)a3 = buf;
    *(_DWORD *)(a3 + 4) = v7;
    *(void *)(a3 + 8) = v9;
    *(_DWORD *)(a3 + 16) = v11;
    *(_DWORD *)(a3 + 20) = v10;
    return;
  }
  *(_WORD *)uint64_t v45 = 0;
  uint64_t v12 = *(void *)(a1 + 9120);
  unsigned __int16 v47 = 0;
  uint64_t v49 = 0xFFFC00000046;
  char v48 = 0;
  sub_244CAF4C0(v12, &v47, v45, (uint64_t)&buf);
  int v13 = DWORD1(buf);
  uint64_t v14 = *((void *)&buf + 1);
  int v16 = v51;
  int v15 = HIDWORD(v51);
  if (buf)
  {
    *(_DWORD *)a3 = buf;
    *(_DWORD *)(a3 + 4) = v13;
    *(void *)(a3 + 8) = v14;
    *(_DWORD *)(a3 + 16) = v16;
    *(_DWORD *)(a3 + 20) = v15;
    return;
  }
  if (v45[0] == 195)
  {
    *(unsigned char *)(a2 + 56) = 0;
    *(_DWORD *)a3 = 0;
    *(_DWORD *)(a3 + 4) = v13;
    *(void *)(a3 + 8) = v14;
    *(_DWORD *)(a3 + 16) = v16;
    *(_DWORD *)(a3 + 20) = v15;
LABEL_40:
    *(_DWORD *)(a2 + 72) = 0;
    *(void *)(a2 + 80) = 0;
    *(void *)(a2 + 88) = 0;
    goto LABEL_23;
  }
  sub_244CCF6E8(v45, (uint64_t)&buf);
  uint64_t v36 = *((void *)&buf + 1);
  int v37 = buf;
  unint64_t v38 = v51;
  *(void *)a3 = buf;
  *(void *)(a3 + 8) = v36;
  *(void *)(a3 + 16) = v38;
  if (!v37) {
    goto LABEL_40;
  }
}

void sub_244DFBB1C(uint64_t a1, unsigned char *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v15 = -1;
  char v18 = 0;
  uint64_t v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *a2;
    *(_DWORD *)long long buf = 67109120;
    int v14 = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Received ArmFailSafe response errorCode=%u", buf, 8u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  if (*a2)
  {
    LOBYTE(v16) = *a2;
    uint64_t v15 = 7;
    int v6 = 2667;
    unsigned int v7 = 172;
  }
  else
  {
    unsigned int v7 = 0;
    int v6 = 2662;
  }
  *(void *)&long long v8 = v7;
  *((void *)&v8 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v9 = v6;
  int v10 = 0;
  sub_244E04164((uint64_t)v11, (uint64_t)&v15);
  v12[72] = v18;
  sub_244DF2F10(a1, &v8, (uint64_t)v11);
  if (v11[0] == 4)
  {
    v11[1] = &unk_26F9593F8;
    sub_244D87F44(v12);
  }
  if (v15 == 4)
  {
    int v16 = &unk_26F9593F8;
    sub_244D87F44(&v17);
  }
}

void sub_244DFBCD8(uint64_t a1, unsigned char *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v15 = -1;
  char v18 = 0;
  uint64_t v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *a2;
    *(_DWORD *)long long buf = 67109120;
    int v14 = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Received SetRegulatoryConfig response errorCode=%u", buf, 8u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  if (*a2)
  {
    LOBYTE(v16) = *a2;
    uint64_t v15 = 7;
    int v6 = 2684;
    unsigned int v7 = 172;
  }
  else
  {
    unsigned int v7 = 0;
    int v6 = 2679;
  }
  *(void *)&long long v8 = v7;
  *((void *)&v8 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v9 = v6;
  int v10 = 0;
  sub_244E04164((uint64_t)v11, (uint64_t)&v15);
  v12[72] = v18;
  sub_244DF2F10(a1, &v8, (uint64_t)v11);
  if (v11[0] == 4)
  {
    v11[1] = &unk_26F9593F8;
    sub_244D87F44(v12);
  }
  if (v15 == 4)
  {
    int v16 = &unk_26F9593F8;
    sub_244D87F44(&v17);
  }
}

void sub_244DFBE94(uint64_t a1, unsigned char *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  LOBYTE(v6) = *a2;
  uint64_t v5 = 9;
  sub_244E04164((uint64_t)v3, (uint64_t)&v5);
  v4[72] = v8;
  sub_244DF2F10(a1, &xmmword_2651A9EC8, (uint64_t)v3);
  if (v3[0] == 4)
  {
    v3[1] = &unk_26F9593F8;
    sub_244D87F44(v4);
  }
  if (v5 == 4)
  {
    int v6 = &unk_26F9593F8;
    sub_244D87F44(&v7);
  }
}

void sub_244DFBFA0(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  LODWORD(v1) = 0;
  *((void *)&v1 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v2 = 2707;
  v3[0] = -1;
  v4[72] = 0;
  sub_244DF2F10(a1, &v1, (uint64_t)v3);
  if (v3[0] == 4)
  {
    v3[1] = &unk_26F9593F8;
    sub_244D87F44(v4);
  }
}

uint64_t sub_244DFC058(uint64_t a1, long long *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_OWORD *)long long buf = *a2;
    uint64_t v14 = *((void *)a2 + 2);
    uint64_t v5 = sub_244CB7B34((const char **)buf, 1);
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Received ScanNetworks failure response %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    *(_OWORD *)long long buf = *a2;
    uint64_t v14 = *((void *)a2 + 2);
    sub_244CB7B34((const char **)buf, 1);
    sub_244CC4DE0(9u, 2);
  }
  LODWORD(v9) = 0;
  *((void *)&v9 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v10 = 2718;
  v11[0] = -1;
  v12[72] = 0;
  sub_244DF2F10(a1, &v9, (uint64_t)v11);
  if (v11[0] == 4)
  {
    v11[1] = &unk_26F9593F8;
    sub_244D87F44(v12);
  }
  uint64_t result = *(void *)(a1 + 4320);
  if (result)
  {
    long long v7 = *a2;
    uint64_t v8 = *((void *)a2 + 2);
    return (*(uint64_t (**)(uint64_t, long long *))(*(void *)result + 96))(result, &v7);
  }
  return result;
}

uint64_t sub_244DFC214(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *a2;
    if (a2[8])
    {
      int v6 = *(void **)sub_2446D18A4(a2 + 8);
      long long v7 = sub_2446D18A4(a2 + 8);
      sub_244D821CC(__p, v6, *((void *)v7 + 1));
      if (v15 >= 0) {
        uint64_t v8 = __p;
      }
      else {
        uint64_t v8 = (void **)__p[0];
      }
      *(_DWORD *)long long buf = 67109378;
      int v19 = v5;
      __int16 v20 = 2080;
      unint64_t v21 = (const char *)v8;
      _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Received ScanNetwork response, networkingStatus=%u debugText=%s", buf, 0x12u);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      *(_DWORD *)long long buf = 67109378;
      int v19 = v5;
      __int16 v20 = 2080;
      unint64_t v21 = "none provided";
      _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Received ScanNetwork response, networkingStatus=%u debugText=%s", buf, 0x12u);
    }
  }
  if (sub_244CC4E58(2u))
  {
    if (a2[8])
    {
      long long v9 = *(void **)sub_2446D18A4(a2 + 8);
      int v10 = sub_2446D18A4(a2 + 8);
      sub_244D821CC(__p, v9, *((void *)v10 + 1));
      sub_244CC4DE0(9u, 2);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      sub_244CC4DE0(9u, 2);
    }
  }
  LODWORD(v12) = 0;
  *((void *)&v12 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v13 = 2738;
  v16[0] = -1;
  v17[72] = 0;
  sub_244DF2F10(a1, &v12, (uint64_t)v16);
  if (v16[0] == 4)
  {
    v16[1] = &unk_26F9593F8;
    sub_244D87F44(v17);
  }
  uint64_t result = *(void *)(a1 + 4320);
  if (result) {
    return (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)result + 88))(result, a2);
  }
  return result;
}

void sub_244DFC4C8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 4344) == 36)
  {
    LODWORD(v5) = 0;
    *((void *)&v5 + 1) = "src/controller/CHIPDeviceController.cpp";
    int v6 = 2751;
    v7[0] = -1;
    v8[72] = 0;
    sub_244DF2F10(a1, &v5, (uint64_t)v7);
    if (v7[0] == 4)
    {
      v7[1] = &unk_26F9593F8;
      sub_244D87F44(v8);
    }
    int v3 = 0;
    int v4 = 2753;
  }
  else
  {
    int v4 = 2748;
    int v3 = 3;
  }
  *(_DWORD *)a2 = v3;
  *(void *)(a2 + 8) = "src/controller/CHIPDeviceController.cpp";
  *(_DWORD *)(a2 + 16) = v4;
}

void sub_244DFC5BC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 4344) == 21)
  {
    LODWORD(v5) = 0;
    *((void *)&v5 + 1) = "src/controller/CHIPDeviceController.cpp";
    int v6 = 2761;
    v7[0] = -1;
    v8[72] = 0;
    sub_244DF2F10(a1, &v5, (uint64_t)v7);
    if (v7[0] == 4)
    {
      v7[1] = &unk_26F9593F8;
      sub_244D87F44(v8);
    }
    int v3 = 0;
    int v4 = 2763;
  }
  else
  {
    int v4 = 2758;
    int v3 = 3;
  }
  *(_DWORD *)a2 = v3;
  *(void *)(a2 + 8) = "src/controller/CHIPDeviceController.cpp";
  *(_DWORD *)(a2 + 16) = v4;
}

void sub_244DFC6B0(uint64_t a1, unsigned char *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v15 = -1;
  char v18 = 0;
  int v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *a2;
    *(_DWORD *)long long buf = 67109120;
    int v14 = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Received NetworkConfig response, networkingStatus=%u", buf, 8u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  if (*a2)
  {
    LOBYTE(v16) = *a2;
    uint64_t v15 = 8;
    int v6 = 2775;
    unsigned int v7 = 172;
  }
  else
  {
    unsigned int v7 = 0;
    int v6 = 2770;
  }
  *(void *)&long long v8 = v7;
  *((void *)&v8 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v9 = v6;
  int v10 = 0;
  sub_244E04164((uint64_t)v11, (uint64_t)&v15);
  v12[72] = v18;
  sub_244DF2F10(a1, &v8, (uint64_t)v11);
  if (v11[0] == 4)
  {
    v11[1] = &unk_26F9593F8;
    sub_244D87F44(v12);
  }
  if (v15 == 4)
  {
    int v16 = &unk_26F9593F8;
    sub_244D87F44(&v17);
  }
}

void sub_244DFC86C(uint64_t a1, unsigned char *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v15 = -1;
  char v18 = 0;
  int v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *a2;
    *(_DWORD *)long long buf = 67109120;
    int v14 = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Received ConnectNetwork response, networkingStatus=%u", buf, 8u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  if (*a2)
  {
    LOBYTE(v16) = *a2;
    uint64_t v15 = 8;
    int v6 = 2791;
    unsigned int v7 = 172;
  }
  else
  {
    unsigned int v7 = 0;
    int v6 = 2786;
  }
  *(void *)&long long v8 = v7;
  *((void *)&v8 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v9 = v6;
  int v10 = 0;
  sub_244E04164((uint64_t)v11, (uint64_t)&v15);
  v12[72] = v18;
  sub_244DF2F10(a1, &v8, (uint64_t)v11);
  if (v11[0] == 4)
  {
    v11[1] = &unk_26F9593F8;
    sub_244D87F44(v12);
  }
  if (v15 == 4)
  {
    int v16 = &unk_26F9593F8;
    sub_244D87F44(&v17);
  }
}

void sub_244DFCA28(uint64_t a1, unsigned char *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v15 = -1;
  char v18 = 0;
  int v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *a2;
    *(_DWORD *)long long buf = 67109120;
    int v14 = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Received CommissioningComplete response, errorCode=%u", buf, 8u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  if (*a2)
  {
    LOBYTE(v16) = *a2;
    uint64_t v15 = 7;
    int v6 = 2807;
    unsigned int v7 = 172;
  }
  else
  {
    unsigned int v7 = 0;
    int v6 = 2802;
  }
  *(void *)&long long v8 = v7;
  *((void *)&v8 + 1) = "src/controller/CHIPDeviceController.cpp";
  int v9 = v6;
  int v10 = 0;
  sub_244E04164((uint64_t)v11, (uint64_t)&v15);
  v12[72] = v18;
  sub_244DF2F10(a1, &v8, (uint64_t)v11);
  if (v11[0] == 4)
  {
    v11[1] = &unk_26F9593F8;
    sub_244D87F44(v12);
  }
  if (v15 == 4)
  {
    int v16 = &unk_26F9593F8;
    sub_244D87F44(&v17);
  }
}

uint64_t sub_244DFCBE4(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 9128)) {
    sub_244E2C6A4();
  }
  int v10 = sub_244DBE094();
  (*(void (**)(uint8_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(buf, a2);
  int v11 = (uint64_t *)sub_2446F7170(buf);
  v23[1] = 0;
  v23[2] = 0;
  v23[0] = &unk_26F956F80;
  char v24 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  char v28 = 0;
  uint64_t v29 = 0;
  char v30 = 0;
  __int16 v31 = 1;
  sub_244D88328(v23, v11);
  if (buf[0]) {
    (*(void (**)(void))(**(void **)&buf[8] + 32))(*(void *)&buf[8]);
  }
  LOBYTE(v31) = 0;
  if (*a3) {
    LODWORD(v29) = *(_DWORD *)sub_244CD44AC(a3);
  }
  *(void *)&long long v26 = a4;
  *((void *)&v26 + 1) = a5;
  long long v12 = *(void (****)(void))(a1 + 9120);
  *(void *)(a1 + 9120) = 0;
  uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  int v14 = (void (***)(void))sub_244CC4D84(0x160uLL);
  uint64_t v15 = v14;
  if (v14) {
    sub_244DCD620(v14, v10, v13, v12 + 22, 0);
  }
  __n128 v21 = 0uLL;
  uint64_t v22 = 0;
  sub_244DCE078((uint64_t)v15, (uint64_t)v23, &v21);
  if (v21.n128_u32[0])
  {
    int v16 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(__n128 *)long long buf = v21;
      uint64_t v35 = v22;
      uint64_t v17 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_ERROR, "Failed to send read request: %s", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      *(__n128 *)long long buf = v21;
      uint64_t v35 = v22;
      sub_244CB7B34((const char **)buf, 1);
      sub_244CC4DE0(9u, 1);
    }
    __n128 v19 = v21;
    uint64_t v20 = v22;
    v32[0] = -1;
    v33[72] = 0;
    sub_244DF2F10(a1, (long long *)&v19, (uint64_t)v32);
    if (v32[0] == 4)
    {
      v32[1] = &unk_26F9593F8;
      sub_244D87F44(v33);
    }
    if (v15)
    {
      (**v15)(v15);
      j__free(v15);
    }
    if (v12)
    {
      (**v12)(v12);
      j__free(v12);
    }
  }
  else
  {
    sub_244E04348((void (****)(void))(a1 + 9120), v12);
    sub_244DF347C((void (****)(void))(a1 + 9128), v15);
  }
  return sub_244D87F44(v23);
}

void *sub_244E021DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95AF28;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95AFA8;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E0A404(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E08F6C(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void *sub_244E023B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95B1B8;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95B248;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E0AACC(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E0B584(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void *sub_244E0258C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95B408;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95B488;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E0B608(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E08F6C(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void *sub_244E02764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95B648;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95B6C8;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E0BCD0(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E08F6C(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void *sub_244E0293C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95B8D8;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95B968;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E0C398(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E0CE5C(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void *sub_244E02B14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95BB78;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95BC08;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E0CEE0(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E0D99C(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

BOOL sub_244E02CEC(uint64_t a1, unsigned char *a2)
{
  if (a2[416]) {
    BOOL v2 = a2[440] == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || a2[152] == 0 || a2[488] == 0) {
    return 1;
  }
  return !a2[464] || a2[528] == 0 || a2[532] == 0;
}

void *sub_244E02D3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95BDC8;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95BE48;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E0DA20(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E08F6C(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void *sub_244E02F14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95C058;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95C0E8;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E0E0E8(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E0EBB0(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void *sub_244E030EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95C2A8;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95C328;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  uint64_t v20 = (void *)(a1 + 4352);
  if (a8) {
    uint64_t v20 = 0;
  }
  sub_244E0EC34(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E0EBB0(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void sub_244E032C4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
  if (sub_244DF0570(a1, v8) == a2)
  {
    buf[0] = *(unsigned char *)a3;
    if (buf[0])
    {
      *(_WORD *)&_OWORD buf[2] = *(_WORD *)(a3 + 2);
      uint64_t v13 = (__int16 *)sub_2446D1880(buf);
    }
    else
    {
      uint64_t v13 = &word_244EC45E0;
    }
    int v14 = (unsigned __int16)*v13;
    unsigned int v15 = v14 + (unsigned __int16)(sub_244CDBC48(a2 + 208) / 0x3E8);
    if (v15 >= 0xFFFF) {
      unsigned int v16 = 0xFFFF;
    }
    else {
      unsigned int v16 = v15;
    }
    v19[0] = 1;
    int v20 = 30000;
    if (!sub_244DF5808(a1, a2, a4, v16, v19, (uint64_t)sub_244DFBB1C, (void (*)(uint64_t, long long *))sub_244DF8B30, 0))
    {
      LODWORD(v17) = 0;
      *((void *)&v17 + 1) = "src/controller/CHIPDeviceController.cpp";
      int v18 = 3657;
      v23[0] = -1;
      char v24 = 0;
      sub_244DF2F10(a1, &v17, (uint64_t)v23);
      if (v23[0] == 4)
      {
        long long v12 = v23;
        goto LABEL_17;
      }
    }
  }
  else
  {
    int v9 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v10 = (unint64_t)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2) >> 32;
      int v11 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
      *(_DWORD *)long long buf = 67109376;
      int v28 = v10;
      __int16 v29 = 1024;
      int v30 = v11;
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "Trying to extend fail-safe for an unknown commissionee with device id %08X%08X", buf, 0xEu);
    }
    if (sub_244CC4E58(1u))
    {
      (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
      (*(void (**)(uint64_t))(*(void *)a2 + 24))(a2);
      sub_244CC4DE0(9u, 1);
    }
    LODWORD(v21) = 3;
    *((void *)&v21 + 1) = "src/controller/CHIPDeviceController.cpp";
    int v22 = 3635;
    v25[0] = -1;
    char v26 = 0;
    sub_244DF2F10(a1, &v21, (uint64_t)v25);
    if (v25[0] == 4)
    {
      long long v12 = v25;
LABEL_17:
      v12[1] = &unk_26F9593F8;
      sub_244D87F44(v12 + 4);
    }
  }
}

void *sub_244E035F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95C538;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95C5C8;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  int v20 = (void *)(a1 + 4352);
  if (a8) {
    int v20 = 0;
  }
  sub_244E0F2FC(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E0FDB8(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void *sub_244E037CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95C7D8;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95C868;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  int v20 = (void *)(a1 + 4352);
  if (a8) {
    int v20 = 0;
  }
  sub_244E0FE3C(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E108F4(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void *sub_244E039A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95CA28;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95CAA8;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  int v20 = (void *)(a1 + 4352);
  if (a8) {
    int v20 = 0;
  }
  sub_244E10978(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E0EBB0(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void *sub_244E03B7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95CCB8;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95CD48;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  int v20 = (void *)(a1 + 4352);
  if (a8) {
    int v20 = 0;
  }
  sub_244E11038(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E11AF0(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

void *sub_244E03D54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int16 a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, __n128 *a9@<X8>)
{
  char v27[4] = *MEMORY[0x263EF8340];
  if (a8)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    if (*(void *)(a1 + 4376)) {
      sub_244E2C4D4();
    }
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a2 + 48))(&v24, a2);
  __n128 v19 = (uint64_t *)sub_2446F7170(&v24);
  v27[0] = &unk_26F95CF58;
  v27[1] = v17;
  void v27[2] = a4;
  v27[3] = v27;
  v26[0] = &unk_26F95CFE8;
  v26[1] = v17;
  v26[2] = a5;
  v26[3] = v26;
  v23[0] = 0;
  int v20 = (void *)(a1 + 4352);
  if (a8) {
    int v20 = 0;
  }
  sub_244E11B74(v18, v19, a6, a3, (uint64_t)v27, (uint64_t)v26, v23, a7, a9, v20);
  sub_2447E6794(v26);
  uint64_t result = sub_244E12630(v27);
  if ((_BYTE)v24) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 32))(v25);
  }
  return result;
}

uint64_t sub_244E03F2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_244B94EE0(a1);
  if (result)
  {
    if (*(void *)(a2 + 8) == 8)
    {
      int v6 = 0;
      **(void **)a2 = bswap64(*(void *)(result + 16));
      int v7 = 101;
      uint64_t v8 = "src/credentials/FabricTable.h";
    }
    else
    {
      int v7 = 99;
      uint64_t v8 = "src/credentials/FabricTable.h";
      int v6 = 47;
    }
  }
  else
  {
    int v7 = 3676;
    uint64_t v8 = "src/controller/CHIPDeviceController.cpp";
    int v6 = 113;
  }
  *(_DWORD *)a3 = v6;
  *(void *)(a3 + 8) = v8;
  *(_DWORD *)(a3 + 16) = v7;
  return result;
}

void sub_244E03FB8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 4280);
  if (v3 && (uint64_t v4 = *(void *)(v3 + 72)) != 0)
  {
    sub_244D9F140(v4, *(unsigned __int8 *)(a1 + 36), a2, a3);
  }
  else
  {
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 8) = "src/controller/CHIPDeviceController.cpp";
    *(_DWORD *)(a3 + 16) = 3683;
  }
}

void *sub_244E03FF8(void *a1)
{
  *a1 = &unk_26F959340;
  sub_244DB13A4((uint64_t)(a1 + 2));
  return a1;
}

void sub_244E0403C(void *a1)
{
  *a1 = &unk_26F959340;
  sub_244DB13A4((uint64_t)(a1 + 2));

  JUMPOUT(0x245695FA0);
}

void *sub_244E040A0@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  if (*((_DWORD *)result + 8) == 1)
  {
    uint64_t v7 = *(void *)(result[535] + 96);
    char v8 = *((unsigned char *)result + 36);
    uint64_t v11 = a2;
    char v12 = v8;
    uint64_t result = sub_244DBAA8C(v7, &v11, a3, a4, 1, 0, a5);
    int v9 = 0;
    int v10 = 257;
  }
  else
  {
    int v10 = 251;
    int v9 = 3;
  }
  *(_DWORD *)a6 = v9;
  *(void *)(a6 + 8) = "src/controller/CHIPDeviceController.h";
  *(_DWORD *)(a6 + 16) = v10;
  return result;
}

uint64_t sub_244E04128(unsigned __int8 *a1, uint64_t a2)
{
  if (sub_244DDC280(a2, *a1)) {
    sub_244DDC300(a2);
  }
  return 0;
}

uint64_t sub_244E04164(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = (_OWORD *)(a1 + 8);
  uint64_t v4 = (_OWORD *)(a2 + 8);
  switch(*(void *)a2)
  {
    case 0:
      _OWORD *v3 = *v4;
      break;
    case 1:
    case 2:
      long long v5 = *v4;
      long long v6 = *(_OWORD *)(a2 + 24);
      goto LABEL_5;
    case 3:
      long long v5 = *v4;
      long long v6 = *(_OWORD *)(a2 + 24);
      long long v7 = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 56) = v7;
LABEL_5:
      _OWORD *v3 = v5;
      *(_OWORD *)(a1 + 24) = v6;
      break;
    case 4:
      *(void *)(a1 + 8) = &unk_26F958210;
      uint64_t v9 = *(void *)(a2 + 16);
      *(void *)(a1 + 8) = &unk_26F9593F8;
      *(void *)(a1 + 16) = v9;
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      sub_244D88108(a1 + 32, a2 + 32);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      break;
    case 5:
      long long v10 = *(_OWORD *)(a2 + 24);
      _OWORD *v3 = *v4;
      *(_OWORD *)(a1 + 24) = v10;
      long long v11 = *(_OWORD *)(a2 + 40);
      long long v12 = *(_OWORD *)(a2 + 56);
      long long v13 = *(_OWORD *)(a2 + 88);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 88) = v13;
      *(_OWORD *)(a1 + 40) = v11;
      *(_OWORD *)(a1 + 56) = v12;
      break;
    case 6:
      *(_WORD *)uint64_t v3 = *(_WORD *)v4;
      break;
    default:
      if ((unint64_t)(*(void *)a2 - 7) <= 2) {
        *(unsigned char *)uint64_t v3 = *(unsigned char *)v4;
      }
      break;
  }
  return a1;
}

uint64_t sub_244E042A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  *(void *)a1 = &unk_26F9593F8;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_26F956F80;
  *(unsigned char *)(a1 + 48) = 0;
  sub_244D88328((void *)(a1 + 24), a3);
  *(void *)(a1 + 64) = (*(uint64_t (**)(void))(*(void *)*a3 + 48))();
  *(void *)(a1 + 72) = v5;
  return a1;
}

void sub_244E04348(void (****a1)(void), void (***a2)(void))
{
  BOOL v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    (**v2)(v2);
    j__free(v2);
  }
}

void sub_244E043B8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)sub_244E043F8(v3);
    j__free(v4);
  }
}

uint64_t sub_244E043F8(uint64_t a1)
{
  *(void *)(a1 + 40) = 0;
  BOOL v2 = *(void **)(a1 + 32);
  if (v2)
  {
    j__free(v2);
    *(void *)(a1 + 32) = 0;
  }
  *(void *)(a1 + 24) = 0;
  uint64_t v3 = *(void **)(a1 + 16);
  if (v3)
  {
    j__free(v3);
    *(void *)(a1 + 16) = 0;
  }
  *(void *)(a1 + 8) = 0;
  if (*(void *)a1)
  {
    j__free(*(void **)a1);
    *(void *)a1 = 0;
  }
  return a1;
}

uint64_t sub_244E04458(void **a1, uint64_t a2)
{
  return 0;
}

uint64_t sub_244E04478(void **a1, uint64_t a2)
{
  if ((*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2) != **a1) {
    return 0;
  }
  *a1[1] = a2;
  return 1;
}

BOOL sub_244E044E8(uint64_t a1, uint64_t a2)
{
  BOOL result = sub_244D8DC7C(a2 + 40, *(void *)a1);
  if (result)
  {
    **(void **)(a1 + 8) = a2;
    return 1;
  }
  return result;
}

uint64_t sub_244E04528(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  *(void *)a1 = &unk_26F9599B8;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = &unk_26F959A20;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = xmmword_268EC34EC;
  *(unsigned char *)(a1 + 56) = 1;
  *(_WORD *)(a1 + 58) = 5540;
  *(_OWORD *)(a1 + 60) = 0u;
  *(void *)(a1 + 80) = &unk_26F959788;
  *(void *)(a1 + 88) = &unk_26F959748;
  sub_244DE9034(a1 + 96);
  *(void *)(a1 + 80) = &unk_26F953D10;
  *(void *)(a1 + 88) = &unk_26F953DA0;
  *(void *)(a1 + 96) = &unk_26F953DE0;
  *(unsigned char *)(a1 + 244) = 0;
  sub_244CE4E94(a1 + 248, 32, 65, 0x20uLL);
  *(void *)(a1 + 248) = &unk_26F954388;
  nullsub_13(a1 + 488, v3);
  bzero((void *)(a1 + 608), 0x400uLL);
  *(unsigned char *)(a1 + 1736) = 0;
  nullsub_13(a1 + 1776, v4);
  *(_DWORD *)(a1 + 1896) = 0;
  *(_WORD *)(a1 + 1900) = 0;
  *(void *)(a1 + 1904) = 0;
  *(void *)(a1 + 1944) = 32;
  *(unsigned char *)(a1 + 1952) = 0;
  *(_OWORD *)(a1 + 1984) = 0u;
  *(unsigned char *)(a1 + 2000) = 0;
  *(_OWORD *)(a1 + 1960) = 0u;
  *(void *)(a1 + 1976) = &unk_26F959858;
  *(void *)(a1 + 2016) = v2;
  return a1;
}

void *sub_244E04700()
{
  std::__libcpp_verbose_abort("bad_function_call was thrown in -fno-exceptions mode");
  return sub_244E04718(v0);
}

void *sub_244E04718(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  a1[3] = 0;
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

void sub_244E047A0(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x20000003ELL;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E04AF0((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E04B88((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E05818(v37);
  v34[0] = &unk_26F959D78;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E04A90(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F959E38;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E055F0((uint64_t)v37, v22);
}

void sub_244E04A90(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F959DF8;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E04AF0(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E04B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F959D28;
  sub_244E04AF0(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E04BF8(void *a1)
{
  return a1;
}

void sub_244E04C34(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E05818(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E04C90(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    long long v17 = 0uLL;
    uint64_t v6 = 0x8E0000008ELL;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 62 && *(_DWORD *)(a3 + 8) == 3)
      {
        sub_2448088A0(&v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, long long *))(*(void *)v13 + 48))(v13, a3, a4, &v17);
          }
          goto LABEL_17;
        }
        long long v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E04DAC(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    long long v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

uint64_t sub_244E04DAC(uint64_t result, uint64_t a2, long long *a3)
{
  if (!*(unsigned char *)(result + 104))
  {
    *(unsigned char *)(result + 104) = 1;
    long long v5 = *a3;
    uint64_t v6 = *((void *)a3 + 2);
    uint64_t v3 = *(void *)(result + 64);
    if (v3)
    {
      return (*(uint64_t (**)(uint64_t, long long *))(*(void *)v3 + 48))(v3, &v5);
    }
    else
    {
      uint64_t v4 = sub_244E04700();
      return sub_244E04E1C(v4);
    }
  }
  return result;
}

uint64_t sub_244E04E1C(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 104))
  {
    LODWORD(v5) = 33;
    *((void *)&v5 + 1) = "src/controller/TypedCommandCallback.h";
    int v6 = 84;
    sub_244E04DAC(a1, a2, &v5);
  }
  return sub_2447E689C(a1 + 72, a2);
}

void *sub_244E04E88(void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    long long v5 = (void *)a2[3];
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
        BOOL result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        BOOL result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      BOOL result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
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

void *sub_244E050F0(uint64_t a1)
{
  BOOL result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *BOOL result = &unk_26F959D78;
  result[1] = v3;
  return result;
}

uint64_t sub_244E05138(uint64_t result, void *a2)
{
  *a2 = &unk_26F959D78;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E05168(uint64_t a1, void *a2)
{
}

uint64_t sub_244E05170(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F959DD8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E051B0()
{
  return &unk_26F959DD8;
}

void sub_244E051BC(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E05818(v4 + 1);
    j__free(v4);
  }
}

void sub_244E0522C()
{
}

double sub_244E05240@<D0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24480869C(*(unsigned char **)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E05248(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F959E38;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E05294(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F959E38;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E052C4(uint64_t a1)
{
}

uint64_t sub_244E052CC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F959E98)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0530C()
{
  return &unk_26F959E98;
}

void sub_244E05318(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E05818(v4 + 1);
    j__free(v4);
  }
}

void *sub_244E05388(void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    long long v5 = (void *)a2[3];
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

void sub_244E055F0(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E05818(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E05644(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F959EB8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E05690(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F959EB8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E056C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E056CC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F959F28)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0570C()
{
  return &unk_26F959F28;
}

__n128 sub_244E05718(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F959F48;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E05764(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F959F48;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E05794(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E057CC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F959FA8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0580C()
{
  return &unk_26F959FA8;
}

void *sub_244E05818(void *a1)
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

void sub_244E0589C(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 62;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E05BEC((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E05C84((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E06358(v37);
  v34[0] = &unk_26F95A018;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E05B8C(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95A0D8;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E06130((uint64_t)v37, v22);
}

void sub_244E05B8C(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95A098;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E05BEC(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E05C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F959FC8;
  sub_244E05BEC(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E05CF4(void *a1)
{
  return a1;
}

void sub_244E05D30(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E06358(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E05D8C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    memset(v17, 0, sizeof(v17));
    uint64_t v6 = 0x8E0000008ELL;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 62 && *(_DWORD *)(a3 + 8) == 1)
      {
        sub_244808548(v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _OWORD *))(*(void *)v13 + 48))(v13, a3, a4, v17);
          }
          goto LABEL_17;
        }
        long long v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E05EAC(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    long long v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E05EAC(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95A018;
  result[1] = v3;
  return result;
}

uint64_t sub_244E05EF4(uint64_t result, void *a2)
{
  *a2 = &unk_26F95A018;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E05F24(uint64_t a1, void *a2)
{
}

uint64_t sub_244E05F2C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A078)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E05F6C()
{
  return &unk_26F95A078;
}

void sub_244E05F78(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E06358(v4 + 1);
    j__free(v4);
  }
}

double sub_244E05FE8@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2448013A8(*(void *)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E05FF0(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A0D8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0603C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A0D8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E0606C(uint64_t a1)
{
}

uint64_t sub_244E06074(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A138)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E060B4()
{
  return &unk_26F95A138;
}

void sub_244E060C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E06358(v4 + 1);
    j__free(v4);
  }
}

void sub_244E06130(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E06358(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E06184(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A158;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E061D0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A158;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E06200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E0620C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A1C8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0624C()
{
  return &unk_26F95A1C8;
}

__n128 sub_244E06258(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A1E8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E062A4(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A1E8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E062D4(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E0630C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A248)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0634C()
{
  return &unk_26F95A248;
}

void *sub_244E06358(void *a1)
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

void sub_244E063DC(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 48;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E0672C((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E067C4((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E092BC(v37);
  v34[0] = &unk_26F95A2B8;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E066CC(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95A378;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E06C70((uint64_t)v37, v22);
}

void sub_244E066CC(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95A338;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E0672C(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E067C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95A268;
  sub_244E0672C(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E06834(void *a1)
{
  return a1;
}

void sub_244E06870(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E092BC(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E068CC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    v17[0] = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v6 = 0x8E0000008ELL;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 48 && *(_DWORD *)(a3 + 8) == 1)
      {
        sub_2447FCCC8((uint64_t)v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned char *))(*(void *)v13 + 48))(v13, a3, a4, v17);
          }
          goto LABEL_17;
        }
        long long v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E069EC(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    long long v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E069EC(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95A2B8;
  result[1] = v3;
  return result;
}

uint64_t sub_244E06A34(uint64_t result, void *a2)
{
  *a2 = &unk_26F95A2B8;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E06A64(uint64_t a1, void *a2)
{
}

uint64_t sub_244E06A6C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A318)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E06AAC()
{
  return &unk_26F95A318;
}

void sub_244E06AB8(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E092BC(v4 + 1);
    j__free(v4);
  }
}

double sub_244E06B28@<D0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_2447FC938(a1, a2, a3);
}

__n128 sub_244E06B30(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A378;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E06B7C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A378;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E06BAC(uint64_t a1)
{
}

uint64_t sub_244E06BB4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A3D8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E06BF4()
{
  return &unk_26F95A3D8;
}

void sub_244E06C00(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E092BC(v4 + 1);
    j__free(v4);
  }
}

void sub_244E06C70(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E092BC(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E06CC4(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A3F8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E06D10(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A3F8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E06D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E06D4C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A468)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E06D8C()
{
  return &unk_26F95A468;
}

__n128 sub_244E06D98(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A488;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E06DE4(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A488;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E06E14(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E06E4C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A4E8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E06E8C()
{
  return &unk_26F95A4E8;
}

void sub_244E06E98(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x40000003ELL;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E071E8((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E07280((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E07954(v37);
  v34[0] = &unk_26F95A558;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E07188(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95A618;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E0772C((uint64_t)v37, v22);
}

void sub_244E07188(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95A5D8;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E071E8(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E07280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95A508;
  sub_244E071E8(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E072F0(void *a1)
{
  return a1;
}

void sub_244E0732C(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E07954(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E07388(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    memset(v17, 0, sizeof(v17));
    uint64_t v6 = 0x8E0000008ELL;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 62 && *(_DWORD *)(a3 + 8) == 5)
      {
        sub_244808C30(v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _OWORD *))(*(void *)v13 + 48))(v13, a3, a4, v17);
          }
          goto LABEL_17;
        }
        long long v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E074A8(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    long long v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E074A8(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95A558;
  result[1] = v3;
  return result;
}

uint64_t sub_244E074F0(uint64_t result, void *a2)
{
  *a2 = &unk_26F95A558;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E07520(uint64_t a1, void *a2)
{
}

uint64_t sub_244E07528(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A5B8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E07568()
{
  return &unk_26F95A5B8;
}

void sub_244E07574(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E07954(v4 + 1);
    j__free(v4);
  }
}

double sub_244E075E4@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2448089C8(*(void *)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E075EC(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A618;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E07638(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A618;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E07668(uint64_t a1)
{
}

uint64_t sub_244E07670(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A678)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E076B0()
{
  return &unk_26F95A678;
}

void sub_244E076BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E07954(v4 + 1);
    j__free(v4);
  }
}

void sub_244E0772C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E07954(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E07780(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A698;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E077CC(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A698;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E077FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E07808(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A708)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E07848()
{
  return &unk_26F95A708;
}

__n128 sub_244E07854(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A728;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E078A0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A728;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E078D0(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E07908(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A788)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E07948()
{
  return &unk_26F95A788;
}

void *sub_244E07954(void *a1)
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

void sub_244E079D8(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x60000003ELL;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E07D28((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E07DC0((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E08494(v37);
  v34[0] = &unk_26F95A7F8;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E07CC8(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95A8B8;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E0826C((uint64_t)v37, v22);
}

void sub_244E07CC8(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95A878;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E07D28(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E07DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95A7A8;
  sub_244E07D28(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E07E30(void *a1)
{
  return a1;
}

void sub_244E07E6C(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E08494(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E07EC8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    __int16 v17 = 0;
    char v18 = 0;
    uint64_t v6 = 0x8E0000008ELL;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 62 && *(_DWORD *)(a3 + 8) == 8)
      {
        sub_244809374((uint64_t)&v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(*(void *)v13 + 48))(v13, a3, a4, &v17);
          }
          goto LABEL_17;
        }
        long long v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E07FE8(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    long long v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E07FE8(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95A7F8;
  result[1] = v3;
  return result;
}

uint64_t sub_244E08030(uint64_t result, void *a2)
{
  *a2 = &unk_26F95A7F8;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E08060(uint64_t a1, void *a2)
{
}

uint64_t sub_244E08068(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A858)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E080A8()
{
  return &unk_26F95A858;
}

void sub_244E080B4(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E08494(v4 + 1);
    j__free(v4);
  }
}

double sub_244E08124@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_244808D84(*(void *)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E0812C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A8B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E08178(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A8B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E081A8(uint64_t a1)
{
}

uint64_t sub_244E081B0(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A918)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E081F0()
{
  return &unk_26F95A918;
}

void sub_244E081FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E08494(v4 + 1);
    j__free(v4);
  }
}

void sub_244E0826C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E08494(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E082C0(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A938;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0830C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A938;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0833C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E08348(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95A9A8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E08388()
{
  return &unk_26F95A9A8;
}

__n128 sub_244E08394(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95A9C8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E083E0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95A9C8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E08410(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E08448(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95AA28)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E08488()
{
  return &unk_26F95AA28;
}

void *sub_244E08494(void *a1)
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

void sub_244E08518(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0xB0000003ELL;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E08868((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E08900((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E08F6C(v37);
  v34[0] = &unk_26F95AA98;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E08808(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95AB58;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E08D44((uint64_t)v37, v22);
}

void sub_244E08808(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95AB18;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E08868(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E08900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95AA48;
  sub_244E08868(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E08970(void *a1)
{
  return a1;
}

void sub_244E089AC(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E08F6C(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E08A08(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    *(unsigned char *)(result + 104) = 1;
    if (a5)
    {
      int v9 = 142;
      long long v10 = "src/controller/TypedCommandCallback.h";
      int v11 = 164;
      uint64_t v5 = *(void *)(result + 64);
      if (v5) {
        return (*(uint64_t (**)(uint64_t, int *))(*(void *)v5 + 48))(v5, &v9);
      }
      goto LABEL_8;
    }
    uint64_t v6 = *(void *)(result + 32);
    if (!v6)
    {
LABEL_8:
      char v7 = sub_244E04700();
      return sub_244E08AC8(v7);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(*(void *)v6 + 48))(v6, a3, a4, &v8);
  }
  return result;
}

void *sub_244E08AC8(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95AA98;
  result[1] = v3;
  return result;
}

uint64_t sub_244E08B10(uint64_t result, void *a2)
{
  *a2 = &unk_26F95AA98;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E08B40(uint64_t a1, void *a2)
{
}

uint64_t sub_244E08B48(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95AAF8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E08B88()
{
  return &unk_26F95AAF8;
}

void sub_244E08B94(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E08F6C(v4 + 1);
    j__free(v4);
  }
}

__n128 sub_244E08C04(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95AB58;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E08C50(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95AB58;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E08C80(uint64_t a1)
{
}

uint64_t sub_244E08C88(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95ABB8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E08CC8()
{
  return &unk_26F95ABB8;
}

void sub_244E08CD4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E08F6C(v4 + 1);
    j__free(v4);
  }
}

void sub_244E08D44(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E08F6C(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E08D98(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95ABD8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E08DE4(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95ABD8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E08E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E08E20(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95AC48)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E08E60()
{
  return &unk_26F95AC48;
}

__n128 sub_244E08E6C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95AC68;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E08EB8(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95AC68;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E08EE8(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E08F20(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95ACC8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E08F60()
{
  return &unk_26F95ACC8;
}

void *sub_244E08F6C(void *a1)
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

void *sub_244E08FF0(void *a1)
{
  *a1 = &unk_26F95ACE8;
  sub_244D87F44(a1 + 1);
  return a1;
}

void sub_244E09034(void *a1)
{
  *a1 = &unk_26F95ACE8;
  sub_244D87F44(a1 + 1);

  JUMPOUT(0x245695FA0);
}

void *sub_244E09098(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  uint64_t v2 = operator new(0x30uLL);
  *uint64_t v2 = &unk_26F95ACE8;
  sub_244D88108(v2 + 1, v1);
  return v2;
}

uint64_t sub_244E090EC(uint64_t a1, void *a2)
{
  *a2 = &unk_26F95ACE8;
  return sub_244D88108(a2 + 1, a1 + 8);
}

uint64_t sub_244E09118(uint64_t a1)
{
  return sub_244D87F44(a1 + 8);
}

void sub_244E09120(char *a1)
{
  sub_244D87F44(a1 + 8);

  operator delete(a1);
}

unsigned char *sub_244E0915C(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  uint64_t v2 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_DEFAULT, "Failsafe disarmed", v4, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  sub_24479DD24(v1, (uint64_t)v4);
  __n128 result = sub_244E0927C(v4);
  if (v4[0]) {
    return (unsigned char *)(*(uint64_t (**)(uint64_t))(*(void *)v5 + 32))(v5);
  }
  return result;
}

uint64_t sub_244E09230(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95AD48)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E09270()
{
  return &unk_26F95AD48;
}

unsigned char *sub_244E0927C(unsigned char *result)
{
  if (*result)
  {
    uint64_t v1 = (uint64_t *)sub_2446F7170(result);
    uint64_t v2 = (void *)sub_244D879D8(*v1);
    return (unsigned char *)sub_244D8588C(v2);
  }
  return result;
}

void *sub_244E092BC(void *a1)
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

void *sub_244E09340(void *a1)
{
  *a1 = &unk_26F95AD68;
  sub_244D87F44(a1 + 1);
  return a1;
}

void sub_244E09384(void *a1)
{
  *a1 = &unk_26F95AD68;
  sub_244D87F44(a1 + 1);

  JUMPOUT(0x245695FA0);
}

void *sub_244E093E8(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  uint64_t v2 = operator new(0x30uLL);
  *uint64_t v2 = &unk_26F95AD68;
  sub_244D88108(v2 + 1, v1);
  return v2;
}

uint64_t sub_244E0943C(uint64_t a1, void *a2)
{
  *a2 = &unk_26F95AD68;
  return sub_244D88108(a2 + 1, a1 + 8);
}

uint64_t sub_244E09468(uint64_t a1)
{
  return sub_244D87F44(a1 + 8);
}

void sub_244E09470(char *a1)
{
  sub_244D87F44(a1 + 8);

  operator delete(a1);
}

unsigned char *sub_244E094AC(uint64_t a1, long long *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 8;
  long long v6 = *a2;
  uint64_t v7 = *((void *)a2 + 2);
  long long v3 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_OWORD *)long long buf = v6;
    uint64_t v9 = v7;
    uint64_t v4 = sub_244CB7B34((const char **)buf, 1);
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring failure to disarm failsafe: %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    *(_OWORD *)long long buf = v6;
    uint64_t v9 = v7;
    sub_244CB7B34((const char **)buf, 1);
    sub_244CC4DE0(9u, 2);
  }
  sub_24479DD24(v2, (uint64_t)buf);
  __n128 result = sub_244E0927C(buf);
  if (buf[0]) {
    return (unsigned char *)(*(uint64_t (**)(void))(**(void **)&buf[8] + 32))(*(void *)&buf[8]);
  }
  return result;
}

uint64_t sub_244E09604(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95ADC8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E09644()
{
  return &unk_26F95ADC8;
}

double sub_244E09650@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X2>, void *a4@<X8>)
{
  double result = sub_244CB3988((uint64_t)v10);
  if (*(_DWORD *)(a2 + 4) == 48 && *(_DWORD *)(a2 + 8) == 1)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v10, a4);
    if (!*(_DWORD *)a4) {
      return sub_2447FC828(a3, (uint64_t)v10, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
  return result;
}

void sub_244E096F8(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 48 && *(_DWORD *)(a2 + 8) == 2)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_2447F5F24((uint64_t)v9, a3, a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E097A0(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 48 && *(_DWORD *)(a2 + 8) == 3)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_2447F5F24((uint64_t)v9, a3, a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E09848(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 48 && *(_DWORD *)(a2 + 8) == 0)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB3EFC((uint64_t)v9, a3, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E098F0(uint64_t a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X2>, uint64_t a4@<X8>)
{
  sub_244CB3988((uint64_t)v12);
  if (*(_DWORD *)(a2 + 4) != 40 || *(_DWORD *)(a2 + 8) != 2)
  {
    int v9 = 169;
    uint64_t v10 = "src/app/ClusterStateCache.h";
    int v11 = 142;
LABEL_6:
    *(_DWORD *)a4 = v11;
    *(void *)(a4 + 8) = v10;
    *(_DWORD *)(a4 + 16) = v9;
    return;
  }
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v12, (void *)a4);
  if (!*(_DWORD *)a4)
  {
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
    sub_24484B11C((uint64_t)v12, a3, (void *)a4);
    if (!*(_DWORD *)a4)
    {
      int v11 = 0;
      int v9 = 61;
      uint64_t v10 = "src/app/data-model/Decode.h";
      goto LABEL_6;
    }
  }
}

void sub_244E099BC(uint64_t a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 40 && *(_DWORD *)(a2 + 8) == 4)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB3F40((uint64_t)v9, a3, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

uint64_t sub_244E09A64@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, void *a3@<X8>)
{
  int v6 = 0;
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  uint64_t result = sub_244CB3FB0(a1, &v6, (uint64_t)a3);
  if (!*(_DWORD *)a3)
  {
    *a2 = v6;
    *(_DWORD *)a3 = 0;
    a3[1] = "src/lib/core/TLVReader.h";
    *((_DWORD *)a3 + 4) = 534;
  }
  return result;
}

void sub_244E09ACC(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 49 && *(_DWORD *)(a2 + 8) == 3)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB3E8C((uint64_t)v9, a3, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E09B74(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 56 && *(_DWORD *)(a2 + 8) == 65532)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB3FB0((uint64_t)v9, a3, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E09C20(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 56 && *(_DWORD *)(a2 + 8) == 10)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB3E8C((uint64_t)v9, a3, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E09CC8(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 56 && *(_DWORD *)(a2 + 8) == 11)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB3E8C((uint64_t)v9, a3, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E09D70(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 56 && *(_DWORD *)(a2 + 8) == 4)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244803C58((uint64_t)v9, a3, a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E09E18(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 56 && *(_DWORD *)(a2 + 8) == 3)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244806260((uint64_t)v9, a3, a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E09EC0(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 48 && *(_DWORD *)(a2 + 8) == 4)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB3C0C((uint64_t)v9, a3, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E09F68(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 62 && *(_DWORD *)(a2 + 8) == 1)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_24484B03C(a3, (uint64_t)v9, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E0A010(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 70 && *(_DWORD *)(a2 + 8) == 65532)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB3FB0((uint64_t)v9, a3, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E0A0BC(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 70 && *(_DWORD *)(a2 + 8) == 6)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_24484B2E8((uint64_t)v9, a3, a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E0A164(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 70 && *(_DWORD *)(a2 + 8) == 7)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB41F0((uint64_t)v9, a3, a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E0A20C(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 70 && *(_DWORD *)(a2 + 8) == 0)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB3FB0((uint64_t)v9, a3, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E0A2B4(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 70 && *(_DWORD *)(a2 + 8) == 1)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB3FB0((uint64_t)v9, a3, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E0A35C(uint64_t a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X2>, void *a4@<X8>)
{
  sub_244CB3988((uint64_t)v9);
  if (*(_DWORD *)(a2 + 4) == 70 && *(_DWORD *)(a2 + 8) == 2)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    sub_244CAF3C0(a1, (unsigned __int16 *)a2, (uint64_t)v9, a4);
    if (!*(_DWORD *)a4) {
      sub_244CB3F40((uint64_t)v9, a3, (uint64_t)a4);
    }
  }
  else
  {
    *(_DWORD *)a4 = 142;
    a4[1] = "src/app/ClusterStateCache.h";
    *((_DWORD *)a4 + 4) = 169;
  }
}

void sub_244E0A404(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 56;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E08868((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E08900((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E08F6C(v37);
  v34[0] = &unk_26F95ADE8;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E0A6F4(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95AEA8;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E08D44((uint64_t)v37, v22);
}

void sub_244E0A6F4(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95AE68;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

void *sub_244E0A754(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26F95ADE8;
  result[1] = v3;
  return result;
}

uint64_t sub_244E0A79C(uint64_t result, void *a2)
{
  *a2 = &unk_26F95ADE8;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E0A7CC(uint64_t a1, void *a2)
{
}

uint64_t sub_244E0A7D4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95AE48)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0A814()
{
  return &unk_26F95AE48;
}

double sub_244E0A820@<D0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_244805310(*(void *)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E0A828(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95AEA8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0A874(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95AEA8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E0A8A4(uint64_t a1)
{
}

uint64_t sub_244E0A8AC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95AF08)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0A8EC()
{
  return &unk_26F95AF08;
}

__n128 sub_244E0A8F8(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95AF28;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0A944(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95AF28;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0A974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E0A980(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95AF88)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0A9C0()
{
  return &unk_26F95AF88;
}

__n128 sub_244E0A9CC(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95AFA8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0AA18(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95AFA8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0AA48(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E0AA80(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B008)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0AAC0()
{
  return &unk_26F95B008;
}

void sub_244E0AACC(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x200000038;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E0AE1C((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E0AEB4((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E0B584(v37);
  v34[0] = &unk_26F95B078;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E0ADBC(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95B138;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E0B35C((uint64_t)v37, v22);
}

void sub_244E0ADBC(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95B0F8;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E0AE1C(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E0AEB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95B028;
  sub_244E0AE1C(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E0AF24(void *a1)
{
  return a1;
}

void sub_244E0AF60(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E0B584(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E0AFBC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    char v17 = 0;
    uint64_t v6 = 0x8E0000008ELL;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 56 && *(_DWORD *)(a3 + 8) == 3)
      {
        sub_244805B34(&v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(*(void *)v13 + 48))(v13, a3, a4, &v17);
          }
          goto LABEL_17;
        }
        uint64_t v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E0B0D8(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    uint64_t v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E0B0D8(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95B078;
  result[1] = v3;
  return result;
}

uint64_t sub_244E0B120(uint64_t result, void *a2)
{
  *a2 = &unk_26F95B078;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E0B150(uint64_t a1, void *a2)
{
}

uint64_t sub_244E0B158(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B0D8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0B198()
{
  return &unk_26F95B0D8;
}

void sub_244E0B1A4(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E0B584(v4 + 1);
    j__free(v4);
  }
}

double sub_244E0B214@<D0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2448057C0(*(uint64_t **)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E0B21C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B138;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0B268(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B138;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E0B298(uint64_t a1)
{
}

uint64_t sub_244E0B2A0(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B198)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0B2E0()
{
  return &unk_26F95B198;
}

void sub_244E0B2EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E0B584(v4 + 1);
    j__free(v4);
  }
}

void sub_244E0B35C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E0B584(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E0B3B0(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B1B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0B3FC(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B1B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0B42C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E0B438(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B228)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0B478()
{
  return &unk_26F95B228;
}

__n128 sub_244E0B484(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B248;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0B4D0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B248;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0B500(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E0B538(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B2A8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0B578()
{
  return &unk_26F95B2A8;
}

void *sub_244E0B584(void *a1)
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

void sub_244E0B608(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x400000038;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E08868((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E08900((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E08F6C(v37);
  v34[0] = &unk_26F95B2C8;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E0B8F8(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95B388;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E08D44((uint64_t)v37, v22);
}

void sub_244E0B8F8(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95B348;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

void *sub_244E0B958(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95B2C8;
  result[1] = v3;
  return result;
}

uint64_t sub_244E0B9A0(uint64_t result, void *a2)
{
  *a2 = &unk_26F95B2C8;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E0B9D0(uint64_t a1, void *a2)
{
}

uint64_t sub_244E0B9D8(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B328)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0BA18()
{
  return &unk_26F95B328;
}

double sub_244E0BA24@<D0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_244805C0C(*(uint64_t **)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E0BA2C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B388;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0BA78(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B388;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E0BAA8(uint64_t a1)
{
}

uint64_t sub_244E0BAB0(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B3E8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0BAF0()
{
  return &unk_26F95B3E8;
}

__n128 sub_244E0BAFC(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B408;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0BB48(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B408;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0BB78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E0BB84(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B468)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0BBC4()
{
  return &unk_26F95B468;
}

__n128 sub_244E0BBD0(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B488;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0BC1C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B488;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0BC4C(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E0BC84(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B4E8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0BCC4()
{
  return &unk_26F95B4E8;
}

void sub_244E0BCD0(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x500000038;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E08868((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E08900((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E08F6C(v37);
  v34[0] = &unk_26F95B508;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E0BFC0(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95B5C8;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E08D44((uint64_t)v37, v22);
}

void sub_244E0BFC0(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95B588;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

void *sub_244E0C020(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95B508;
  result[1] = v3;
  return result;
}

uint64_t sub_244E0C068(uint64_t result, void *a2)
{
  *a2 = &unk_26F95B508;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E0C098(uint64_t a1, void *a2)
{
}

uint64_t sub_244E0C0A0(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B568)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0C0E0()
{
  return &unk_26F95B568;
}

double sub_244E0C0EC@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_244805E98(*(void *)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E0C0F4(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B5C8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0C140(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B5C8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E0C170(uint64_t a1)
{
}

uint64_t sub_244E0C178(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B628)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0C1B8()
{
  return &unk_26F95B628;
}

__n128 sub_244E0C1C4(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B648;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0C210(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B648;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0C240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E0C24C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B6A8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0C28C()
{
  return &unk_26F95B6A8;
}

__n128 sub_244E0C298(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B6C8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0C2E4(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B6C8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0C314(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E0C34C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B728)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0C38C()
{
  return &unk_26F95B728;
}

void sub_244E0C398(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 49;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E0C6E8((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E0C780((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E0CE5C(v37);
  v34[0] = &unk_26F95B798;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E0C688(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95B858;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E0CC34((uint64_t)v37, v22);
}

void sub_244E0C688(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95B818;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E0C6E8(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E0C780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95B748;
  sub_244E0C6E8(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E0C7F0(void *a1)
{
  return a1;
}

void sub_244E0C82C(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E0CE5C(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E0C888(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    v17[0] = 0;
    unsigned char v17[8] = 0;
    v17[32] = 0;
    uint64_t v6 = 0x8E0000008ELL;
    v17[120] = 0;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 49 && *(_DWORD *)(a3 + 8) == 1)
      {
        sub_2447FE5C0((uint64_t)v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned char *))(*(void *)v13 + 48))(v13, a3, a4, v17);
          }
          goto LABEL_17;
        }
        uint64_t v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E0C9B0(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    uint64_t v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E0C9B0(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95B798;
  result[1] = v3;
  return result;
}

uint64_t sub_244E0C9F8(uint64_t result, void *a2)
{
  *a2 = &unk_26F95B798;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E0CA28(uint64_t a1, void *a2)
{
}

uint64_t sub_244E0CA30(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B7F8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0CA70()
{
  return &unk_26F95B7F8;
}

void sub_244E0CA7C(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E0CE5C(v4 + 1);
    j__free(v4);
  }
}

double sub_244E0CAEC@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2447FE1B4(*(unsigned char **)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E0CAF4(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B858;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0CB40(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B858;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E0CB70(uint64_t a1)
{
}

uint64_t sub_244E0CB78(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B8B8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0CBB8()
{
  return &unk_26F95B8B8;
}

void sub_244E0CBC4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E0CE5C(v4 + 1);
    j__free(v4);
  }
}

void sub_244E0CC34(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E0CE5C(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E0CC88(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B8D8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0CCD4(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B8D8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0CD04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E0CD10(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B948)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0CD50()
{
  return &unk_26F95B948;
}

__n128 sub_244E0CD5C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95B968;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0CDA8(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95B968;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0CDD8(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E0CE10(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95B9C8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0CE50()
{
  return &unk_26F95B9C8;
}

void *sub_244E0CE5C(void *a1)
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

void sub_244E0CEE0(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x200000030;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E0D230((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E0D2C8((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E0D99C(v37);
  v34[0] = &unk_26F95BA38;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E0D1D0(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95BAF8;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E0D774((uint64_t)v37, v22);
}

void sub_244E0D1D0(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95BAB8;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E0D230(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E0D2C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95B9E8;
  sub_244E0D230(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E0D338(void *a1)
{
  return a1;
}

void sub_244E0D374(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E0D99C(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E0D3D0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    v17[0] = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v6 = 0x8E0000008ELL;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 48 && *(_DWORD *)(a3 + 8) == 3)
      {
        sub_2447FD08C((uint64_t)v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned char *))(*(void *)v13 + 48))(v13, a3, a4, v17);
          }
          goto LABEL_17;
        }
        uint64_t v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E0D4F0(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    uint64_t v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E0D4F0(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95BA38;
  result[1] = v3;
  return result;
}

uint64_t sub_244E0D538(uint64_t result, void *a2)
{
  *a2 = &unk_26F95BA38;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E0D568(uint64_t a1, void *a2)
{
}

uint64_t sub_244E0D570(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95BA98)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0D5B0()
{
  return &unk_26F95BA98;
}

void sub_244E0D5BC(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E0D99C(v4 + 1);
    j__free(v4);
  }
}

double sub_244E0D62C@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2447FCE3C(*(void *)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E0D634(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95BAF8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0D680(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95BAF8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E0D6B0(uint64_t a1)
{
}

uint64_t sub_244E0D6B8(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95BB58)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0D6F8()
{
  return &unk_26F95BB58;
}

void sub_244E0D704(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E0D99C(v4 + 1);
    j__free(v4);
  }
}

void sub_244E0D774(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E0D99C(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E0D7C8(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95BB78;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0D814(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95BB78;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0D844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E0D850(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95BBE8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0D890()
{
  return &unk_26F95BBE8;
}

__n128 sub_244E0D89C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95BC08;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0D8E8(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95BC08;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0D918(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E0D950(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95BC68)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0D990()
{
  return &unk_26F95BC68;
}

void *sub_244E0D99C(void *a1)
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

void sub_244E0DA20(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x100000038;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E08868((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E08900((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E08F6C(v37);
  v34[0] = &unk_26F95BC88;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E0DD10(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95BD48;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E08D44((uint64_t)v37, v22);
}

void sub_244E0DD10(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95BD08;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

void *sub_244E0DD70(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95BC88;
  result[1] = v3;
  return result;
}

uint64_t sub_244E0DDB8(uint64_t result, void *a2)
{
  *a2 = &unk_26F95BC88;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E0DDE8(uint64_t a1, void *a2)
{
}

uint64_t sub_244E0DDF0(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95BCE8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0DE30()
{
  return &unk_26F95BCE8;
}

double sub_244E0DE3C@<D0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_244805570(*(void *)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E0DE44(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95BD48;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0DE90(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95BD48;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E0DEC0(uint64_t a1)
{
}

uint64_t sub_244E0DEC8(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95BDA8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0DF08()
{
  return &unk_26F95BDA8;
}

__n128 sub_244E0DF14(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95BDC8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0DF60(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95BDC8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0DF90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E0DF9C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95BE28)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0DFDC()
{
  return &unk_26F95BE28;
}

__n128 sub_244E0DFE8(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95BE48;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0E034(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95BE48;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0E064(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E0E09C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95BEA8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0E0DC()
{
  return &unk_26F95BEA8;
}

void sub_244E0E0E8(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x200000031;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E0E438((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E0E4D0((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E0EBB0(v37);
  v34[0] = &unk_26F95BF18;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E0E3D8(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95BFD8;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E0E988((uint64_t)v37, v22);
}

void sub_244E0E3D8(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95BF98;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E0E438(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E0E4D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95BEC8;
  sub_244E0E438(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E0E540(void *a1)
{
  return a1;
}

void sub_244E0E57C(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E0EBB0(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E0E5D8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    v17[0] = 0;
    unsigned char v17[8] = 0;
    v17[32] = 0;
    v17[40] = 0;
    uint64_t v6 = 0x8E0000008ELL;
    v17[64] = 0;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 49 && *(_DWORD *)(a3 + 8) == 5)
      {
        sub_2447FF108((uint64_t)v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned char *))(*(void *)v13 + 48))(v13, a3, a4, v17);
          }
          goto LABEL_17;
        }
        uint64_t v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E0E704(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    uint64_t v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E0E704(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95BF18;
  result[1] = v3;
  return result;
}

uint64_t sub_244E0E74C(uint64_t result, void *a2)
{
  *a2 = &unk_26F95BF18;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E0E77C(uint64_t a1, void *a2)
{
}

uint64_t sub_244E0E784(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95BF78)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0E7C4()
{
  return &unk_26F95BF78;
}

void sub_244E0E7D0(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E0EBB0(v4 + 1);
    j__free(v4);
  }
}

double sub_244E0E840@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2447FE814(*(void *)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E0E848(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95BFD8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0E894(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95BFD8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E0E8C4(uint64_t a1)
{
}

uint64_t sub_244E0E8CC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C038)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0E90C()
{
  return &unk_26F95C038;
}

void sub_244E0E918(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E0EBB0(v4 + 1);
    j__free(v4);
  }
}

void sub_244E0E988(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E0EBB0(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E0E9DC(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C058;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0EA28(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C058;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0EA58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E0EA64(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C0C8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0EAA4()
{
  return &unk_26F95C0C8;
}

__n128 sub_244E0EAB0(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C0E8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0EAFC(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C0E8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0EB2C(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E0EB64(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C148)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0EBA4()
{
  return &unk_26F95C148;
}

void *sub_244E0EBB0(void *a1)
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

void sub_244E0EC34(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x300000031;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E0E438((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E0E4D0((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E0EBB0(v37);
  v34[0] = &unk_26F95C168;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E0EF24(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95C228;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E0E988((uint64_t)v37, v22);
}

void sub_244E0EF24(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95C1E8;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

void *sub_244E0EF84(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95C168;
  result[1] = v3;
  return result;
}

uint64_t sub_244E0EFCC(uint64_t result, void *a2)
{
  *a2 = &unk_26F95C168;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E0EFFC(uint64_t a1, void *a2)
{
}

uint64_t sub_244E0F004(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C1C8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0F044()
{
  return &unk_26F95C1C8;
}

double sub_244E0F050@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2447FEBC8(*(void *)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E0F058(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C228;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0F0A4(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C228;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E0F0D4(uint64_t a1)
{
}

uint64_t sub_244E0F0DC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C288)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0F11C()
{
  return &unk_26F95C288;
}

__n128 sub_244E0F128(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C2A8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0F174(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C2A8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0F1A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E0F1B0(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C308)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0F1F0()
{
  return &unk_26F95C308;
}

__n128 sub_244E0F1FC(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C328;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0F248(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C328;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0F278(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E0F2B0(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C388)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0F2F0()
{
  return &unk_26F95C388;
}

void sub_244E0F2FC(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x600000031;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E0F64C((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E0F6E4((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E0FDB8(v37);
  v34[0] = &unk_26F95C3F8;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E0F5EC(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95C4B8;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E0FB90((uint64_t)v37, v22);
}

void sub_244E0F5EC(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95C478;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E0F64C(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E0F6E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95C3A8;
  sub_244E0F64C(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E0F754(void *a1)
{
  return a1;
}

void sub_244E0F790(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E0FDB8(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E0F7EC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    v17[0] = 0;
    unsigned char v17[8] = 0;
    v17[32] = 0;
    uint64_t v6 = 0x8E0000008ELL;
    v17[36] = 0;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 49 && *(_DWORD *)(a3 + 8) == 7)
      {
        sub_2447FF528((uint64_t)v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned char *))(*(void *)v13 + 48))(v13, a3, a4, v17);
          }
          goto LABEL_17;
        }
        uint64_t v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E0F914(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    uint64_t v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E0F914(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95C3F8;
  result[1] = v3;
  return result;
}

uint64_t sub_244E0F95C(uint64_t result, void *a2)
{
  *a2 = &unk_26F95C3F8;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E0F98C(uint64_t a1, void *a2)
{
}

uint64_t sub_244E0F994(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C458)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0F9D4()
{
  return &unk_26F95C458;
}

void sub_244E0F9E0(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E0FDB8(v4 + 1);
    j__free(v4);
  }
}

__n128 sub_244E0FA50(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C4B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0FA9C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C4B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E0FACC(uint64_t a1)
{
}

uint64_t sub_244E0FAD4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C518)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0FB14()
{
  return &unk_26F95C518;
}

void sub_244E0FB20(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E0FDB8(v4 + 1);
    j__free(v4);
  }
}

void sub_244E0FB90(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E0FDB8(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E0FBE4(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C538;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0FC30(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C538;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0FC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E0FC6C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C5A8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0FCAC()
{
  return &unk_26F95C5A8;
}

__n128 sub_244E0FCB8(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C5C8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E0FD04(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C5C8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E0FD34(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E0FD6C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C628)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E0FDAC()
{
  return &unk_26F95C628;
}

void *sub_244E0FDB8(void *a1)
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

void sub_244E0FE3C(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 70;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E1018C((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E10224((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E108F4(v37);
  v34[0] = &unk_26F95C698;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E1012C(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95C758;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E106CC((uint64_t)v37, v22);
}

void sub_244E1012C(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95C718;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E1018C(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E10224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95C648;
  sub_244E1018C(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E10294(void *a1)
{
  return a1;
}

void sub_244E102D0(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E108F4(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E1032C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    int v17 = 0;
    uint64_t v6 = 0x8E0000008ELL;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 70 && *(_DWORD *)(a3 + 8) == 1)
      {
        sub_24480B788(&v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(*(void *)v13 + 48))(v13, a3, a4, &v17);
          }
          goto LABEL_17;
        }
        uint64_t v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E10448(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    uint64_t v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E10448(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95C698;
  result[1] = v3;
  return result;
}

uint64_t sub_244E10490(uint64_t result, void *a2)
{
  *a2 = &unk_26F95C698;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E104C0(uint64_t a1, void *a2)
{
}

uint64_t sub_244E104C8(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C6F8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E10508()
{
  return &unk_26F95C6F8;
}

void sub_244E10514(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E108F4(v4 + 1);
    j__free(v4);
  }
}

double sub_244E10584@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24480B364(*(void *)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E1058C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C758;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E105D8(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C758;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E10608(uint64_t a1)
{
}

uint64_t sub_244E10610(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C7B8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E10650()
{
  return &unk_26F95C7B8;
}

void sub_244E1065C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E108F4(v4 + 1);
    j__free(v4);
  }
}

void sub_244E106CC(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E108F4(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E10720(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C7D8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E1076C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C7D8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E1079C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E107A8(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C848)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E107E8()
{
  return &unk_26F95C848;
}

__n128 sub_244E107F4(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C868;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E10840(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C868;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E10870(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E108A8(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C8C8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E108E8()
{
  return &unk_26F95C8C8;
}

void *sub_244E108F4(void *a1)
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

void sub_244E10978(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x400000031;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E0E438((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E0E4D0((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E0EBB0(v37);
  v34[0] = &unk_26F95C8E8;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E10C68(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95C9A8;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E0E988((uint64_t)v37, v22);
}

void sub_244E10C68(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95C968;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

void *sub_244E10CC8(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95C8E8;
  result[1] = v3;
  return result;
}

uint64_t sub_244E10D10(uint64_t result, void *a2)
{
  *a2 = &unk_26F95C8E8;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E10D40(uint64_t a1, void *a2)
{
}

uint64_t sub_244E10D48(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95C948)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E10D88()
{
  return &unk_26F95C948;
}

__n128 sub_244E10D94(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95C9A8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E10DE0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95C9A8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E10E10(uint64_t a1)
{
}

uint64_t sub_244E10E18(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95CA08)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E10E58()
{
  return &unk_26F95CA08;
}

__n128 sub_244E10E64(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95CA28;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E10EB0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95CA28;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E10EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E10EEC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95CA88)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E10F2C()
{
  return &unk_26F95CA88;
}

__n128 sub_244E10F38(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95CAA8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E10F84(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95CAA8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E10FB4(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E10FEC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95CB08)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1102C()
{
  return &unk_26F95CB08;
}

void sub_244E11038(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x300000046;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E11388((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E11420((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E11AF0(v37);
  v34[0] = &unk_26F95CB78;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E11328(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95CC38;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E118C8((uint64_t)v37, v22);
}

void sub_244E11328(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95CBF8;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E11388(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E11420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95CB28;
  sub_244E11388(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E11490(void *a1)
{
  return a1;
}

void sub_244E114CC(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E11AF0(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E11528(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    int v17 = 0;
    uint64_t v6 = 0x8E0000008ELL;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 70 && *(_DWORD *)(a3 + 8) == 4)
      {
        sub_24480BB58(&v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(*(void *)v13 + 48))(v13, a3, a4, &v17);
          }
          goto LABEL_17;
        }
        uint64_t v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E11644(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    uint64_t v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E11644(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95CB78;
  result[1] = v3;
  return result;
}

uint64_t sub_244E1168C(uint64_t result, void *a2)
{
  *a2 = &unk_26F95CB78;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E116BC(uint64_t a1, void *a2)
{
}

uint64_t sub_244E116C4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95CBD8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E11704()
{
  return &unk_26F95CBD8;
}

void sub_244E11710(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E11AF0(v4 + 1);
    j__free(v4);
  }
}

double sub_244E11780@<D0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_24480B6A4(a1, a2, a3);
}

__n128 sub_244E11788(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95CC38;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E117D4(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95CC38;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E11804(uint64_t a1)
{
}

uint64_t sub_244E1180C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95CC98)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1184C()
{
  return &unk_26F95CC98;
}

void sub_244E11858(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E11AF0(v4 + 1);
    j__free(v4);
  }
}

void sub_244E118C8(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E11AF0(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E1191C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95CCB8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E11968(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95CCB8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E11998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E119A4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95CD28)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E119E4()
{
  return &unk_26F95CD28;
}

__n128 sub_244E119F0(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95CD48;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E11A3C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95CD48;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E11A6C(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E11AA4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95CDA8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E11AE4()
{
  return &unk_26F95CDA8;
}

void *sub_244E11AF0(void *a1)
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

void sub_244E11B74(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0x400000030;
  char v33 = 1;
  long long v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  int v22 = v21;
  sub_244E11EC4((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E11F5C((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E12630(v37);
  v34[0] = &unk_26F95CE18;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  char v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E11E64(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95CED8;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  long long v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E12408((uint64_t)v37, v22);
}

void sub_244E11E64(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95CE98;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

uint64_t sub_244E11EC4(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E11F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26F95CDC8;
  sub_244E11EC4(a1 + 8, a2);
  sub_2447EBBBC(a1 + 40, a3);
  sub_2447E58FC(a1 + 72, a4);
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void *sub_244E11FCC(void *a1)
{
  return a1;
}

void sub_244E12008(void *a1)
{
  sub_2447E6FA8(a1 + 9);
  sub_2447E6794(a1 + 5);
  sub_244E12630(a1 + 1);

  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E12064(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    *(unsigned char *)(result + 104) = 1;
    v17[0] = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v6 = 0x8E0000008ELL;
    if (a5)
    {
      if (*(_DWORD *)(a3 + 4) == 48 && *(_DWORD *)(a3 + 8) == 5)
      {
        sub_2447FD19C((uint64_t)v17, a5, (uint64_t)v16);
        uint64_t v6 = v16[0];
        if (!LODWORD(v16[0]))
        {
          uint64_t v13 = *(void *)(v5 + 32);
          if (v13) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned char *))(*(void *)v13 + 48))(v13, a3, a4, v17);
          }
          goto LABEL_17;
        }
        uint64_t v10 = (const char *)v16[1];
        uint64_t v9 = v16[2];
LABEL_12:
        v15[0] = v6;
        v15[1] = v10;
        v15[2] = v9;
        uint64_t v12 = *(void *)(v5 + 64);
        if (v12) {
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)v12 + 48))(v12, v15);
        }
LABEL_17:
        int v14 = sub_244E04700();
        return sub_244E12184(v14);
      }
      uint64_t v9 = 0x7F0000007FLL;
    }
    else
    {
      uint64_t v9 = 0x7800000078;
    }
    uint64_t v10 = "src/controller/TypedCommandCallback.h";
    goto LABEL_12;
  }
  return result;
}

void *sub_244E12184(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95CE18;
  result[1] = v3;
  return result;
}

uint64_t sub_244E121CC(uint64_t result, void *a2)
{
  *a2 = &unk_26F95CE18;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E121FC(uint64_t a1, void *a2)
{
}

uint64_t sub_244E12204(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95CE78)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E12244()
{
  return &unk_26F95CE78;
}

void sub_244E12250(void **a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = (void *)sub_244DBB640(*a2);
    j__free(v3);
  }
  uint64_t v4 = *a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E12630(v4 + 1);
    j__free(v4);
  }
}

double sub_244E122C0@<D0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_2447F187C(a1, a2, a3);
}

__n128 sub_244E122C8(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95CED8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E12314(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95CED8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E12344(uint64_t a1)
{
}

uint64_t sub_244E1234C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95CF38)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1238C()
{
  return &unk_26F95CF38;
}

void sub_244E12398(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)sub_244DBB640(v2);
    j__free(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    sub_2447E6FA8(v4 + 9);
    sub_2447E6794(v4 + 5);
    sub_244E12630(v4 + 1);
    j__free(v4);
  }
}

void sub_244E12408(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2447E6FA8(a2 + 9);
    sub_2447E6794(a2 + 5);
    sub_244E12630(a2 + 1);
    j__free(a2);
  }
}

__n128 sub_244E1245C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95CF58;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E124A8(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95CF58;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E124D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E124E4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95CFC8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E12524()
{
  return &unk_26F95CFC8;
}

__n128 sub_244E12530(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95CFE8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E1257C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95CFE8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E125AC(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E125E4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D048)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E12624()
{
  return &unk_26F95D048;
}

void *sub_244E12630(void *a1)
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

uint64_t sub_244E126DC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  if (*(unsigned char *)(result + 8))
  {
    *(_DWORD *)a5 = 3;
    *(void *)(a5 + 8) = "src/controller/CommissioningWindowOpener.cpp";
    *(_DWORD *)(a5 + 16) = 41;
  }
  else
  {
    char v8 = (void *)result;
    memset(v17, 0, sizeof(v17));
    long long v19 = 0u;
    uint64_t v18 = &v19;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    int v20 = &v21;
    uint64_t v10 = (void *)(result + 72);
    uint64_t v9 = *(char **)(result + 72);
    *(void *)(result + 40) = 0;
    *(void *)(result + 50) = *(void *)&v17[10];
    *(_WORD *)(result + 58) = 0;
    int v11 = (void *)(result + 64);
    sub_2447E6298(result + 64, v9);
    uint64_t v12 = v19;
    *(v10 - 1) = v18;
    void *v10 = v12;
    uint64_t v13 = *((void *)&v19 + 1);
    v10[1] = *((void *)&v19 + 1);
    if (v13)
    {
      *(void *)(v12 + 16) = v10;
      uint64_t v18 = &v19;
      long long v19 = 0uLL;
    }
    else
    {
      *int v11 = v10;
    }
    int v14 = v8 + 12;
    sub_2447E6298((uint64_t)(v8 + 11), (char *)v8[12]);
    uint64_t v15 = v21;
    v8[11] = v20;
    v8[12] = v15;
    uint64_t v16 = v22;
    v8[13] = v22;
    if (v16)
    {
      *(void *)(v15 + 16) = v14;
      uint64_t v15 = 0;
      int v20 = &v21;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
    }
    else
    {
      v8[11] = v14;
    }
    sub_2447E6298((uint64_t)&v20, (char *)v15);
    sub_2447E6298((uint64_t)&v18, (char *)v19);
    *((unsigned char *)v8 + 132) = 0;
    void v8[3] = 0;
    void v8[4] = a4;
    void v8[2] = 0;
    v8[15] = a2;
    *((_WORD *)v8 + 65) = a3;
    *((unsigned char *)v8 + 8) = 3;
    return (*(uint64_t (**)(void, uint64_t, void *, void *, void))(*(void *)*v8 + 40))(*v8, a2, v8 + 36, v8 + 41, 0);
  }
  return result;
}

uint64_t sub_244E12888(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(_DWORD *)(a1 + 3) = *(int *)((char *)a2 + 3);
  *(_DWORD *)a1 = v4;
  int v5 = *((unsigned __int8 *)a2 + 7);
  *(unsigned char *)(a1 + 7) = v5;
  if (v5)
  {
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    *((unsigned char *)a2 + 7) = 0;
  }
  uint64_t v6 = *(void *)((char *)a2 + 10);
  *(_WORD *)(a1 + 18) = *((_WORD *)a2 + 9);
  *(void *)(a1 + 10) = v6;
  sub_244E14894(a1 + 24, (void *)a2 + 3);
  sub_244E14894(a1 + 48, (void *)a2 + 6);
  return a1;
}

void sub_244E12900(void *a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, int a4@<W3>, __int16 a5@<W4>, char *a6@<X5>, char *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v13 = a2;
  WORD1(v14) = a3;
  DWORD1(v14) = a4;
  BYTE8(v14) = 1;
  WORD5(v14) = a5;
  char v11 = *a6;
  if (*a6) {
    LODWORD(v15) = *((_DWORD *)a6 + 1);
  }
  BYTE12(v14) = v11;
  char v12 = *a7;
  if (*a7) {
    long long v16 = *(_OWORD *)(a7 + 8);
  }
  BYTE8(v15) = v12;
  LOBYTE(v17) = a11;
  *((void *)&v17 + 1) = a8;
  sub_244E12984(a1, (uint64_t)&v13, a10, a9);
}

void sub_244E12984(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*((unsigned char *)a1 + 8))
  {
    *(_DWORD *)a4 = 3;
    *(void *)(a4 + 8) = "src/controller/CommissioningWindowOpener.cpp";
    int v5 = 78;
LABEL_3:
    *(_DWORD *)(a4 + 16) = v5;
    return;
  }
  if (!*(void *)a2)
  {
    *(_DWORD *)a4 = 47;
    *(void *)(a4 + 8) = "src/controller/CommissioningWindowOpener.cpp";
    int v5 = 79;
    goto LABEL_3;
  }
  if (!*(unsigned char *)(a2 + 16))
  {
    *(_DWORD *)a4 = 47;
    *(void *)(a4 + 8) = "src/controller/CommissioningWindowOpener.cpp";
    int v5 = 80;
    goto LABEL_3;
  }
  if ((*(_DWORD *)(a2 + 12) - 1000) >= 0x182B9)
  {
    *(_DWORD *)a4 = 47;
    *(void *)(a4 + 8) = "src/controller/CommissioningWindowOpener.cpp";
    int v5 = 83;
    goto LABEL_3;
  }
  uint64_t v9 = (unsigned char *)(a2 + 32);
  if (*(unsigned char *)(a2 + 32)
    && (*((void *)sub_2446D18A4((unsigned char *)(a2 + 32)) + 1) < 0x10uLL
     || *((void *)sub_2446D18A4((unsigned char *)(a2 + 32)) + 1) >= 0x21uLL))
  {
    *(_DWORD *)a4 = 47;
    *(void *)(a4 + 8) = "src/controller/CommissioningWindowOpener.cpp";
    int v5 = 87;
    goto LABEL_3;
  }
  uint64_t v20 = 0;
  long long v22 = 0u;
  long long v19 = 0u;
  uint64_t v21 = &v22;
  v24[0] = 0;
  v24[1] = 0;
  int v23 = v24;
  sub_244E12888((uint64_t)(a1 + 5), (int *)&v19);
  sub_2447DD2CC((uint64_t)&v19);
  if (*(unsigned char *)(a2 + 20))
  {
    uint64_t v10 = (unsigned int *)sub_2446F12CC((unsigned char *)(a2 + 20));
    if (!sub_244D82360(*v10))
    {
      *(_DWORD *)a4 = 47;
      *(void *)(a4 + 8) = "src/controller/CommissioningWindowOpener.cpp";
      int v5 = 93;
      goto LABEL_3;
    }
    *((unsigned char *)a1 + 132) = 2;
    *((_DWORD *)a1 + 14) = *(_DWORD *)sub_2446F12CC((unsigned char *)(a2 + 20));
  }
  else
  {
    *((unsigned char *)a1 + 132) = 1;
  }
  *((unsigned char *)a1 + 40) = 0;
  char v11 = sub_2446D1880((unsigned char *)(a2 + 16));
  sub_244B93A14((uint64_t)(a1 + 14), *(unsigned __int16 *)v11);
  *((unsigned char *)a1 + 52) = *((unsigned char *)a1 + 114);
  *((_WORD *)a1 + 25) = *((_WORD *)a1 + 56);
  *(_WORD *)((char *)a1 + 47) = 1025;
  if (*v9)
  {
    char v12 = *(const void **)sub_2446D18A4((unsigned char *)(a2 + 32));
    uint64_t v13 = sub_2446D18A4((unsigned char *)(a2 + 32));
    memcpy((char *)a1 + 236, v12, *((void *)v13 + 1));
    long long v14 = sub_2446D18A4((unsigned char *)(a2 + 32));
    sub_2446C1098(&v19, (uint64_t)a1 + 236, *((void *)v14 + 1));
    *((_OWORD *)a1 + 17) = v19;
  }
  else
  {
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
    sub_244CECD5C((char *)a1 + 236, 0x20uLL, a4);
    if (*(_DWORD *)a4) {
      return;
    }
    a1[34] = (char *)a1 + 236;
    a1[35] = 32;
  }
  uint64_t v15 = *(unsigned int *)(a2 + 12);
  *((_DWORD *)a1 + 58) = v15;
  BOOL v16 = *(unsigned char *)(a2 + 20) == 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  *(void *)a4 = 0;
  sub_244CDE6C0((uint64_t)a1 + 133, v15, a1 + 34, v16, (int *)a1 + 14, (void *)a4);
  if (!*(_DWORD *)a4)
  {
    sub_244E12CD4(a3, (int *)a1 + 10);
    a1[2] = *(void *)(a2 + 64);
    a1[3] = 0;
    a1[4] = 0;
    uint64_t v17 = sub_244E12D58((uint64_t *)a2);
    a1[15] = v17;
    *((_WORD *)a1 + 65) = *(_WORD *)(a2 + 10);
    *((_WORD *)a1 + 64) = *(_WORD *)(a2 + 8);
    if (*(unsigned char *)(a2 + 56)) {
      char v18 = 1;
    }
    else {
      char v18 = 3;
    }
    *((unsigned char *)a1 + 8) = v18;
    (*(void (**)(void, uint64_t, void *, void *, void))(*(void *)*a1 + 40))(*a1, v17, a1 + 36, a1 + 41, 0);
  }
}

uint64_t sub_244E12CD4(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(_DWORD *)(a1 + 3) = *(int *)((char *)a2 + 3);
  *(_DWORD *)a1 = v4;
  int v5 = *((unsigned __int8 *)a2 + 7);
  *(unsigned char *)(a1 + 7) = v5;
  if (v5) {
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  }
  uint64_t v6 = *(void *)((char *)a2 + 10);
  *(_WORD *)(a1 + 18) = *((_WORD *)a2 + 9);
  *(void *)(a1 + 10) = v6;
  if ((int *)a1 != a2)
  {
    sub_244BDDA80((uint64_t **)(a1 + 24), *((const std::string ***)a2 + 3), (const std::string **)a2 + 4);
    sub_244BDDDA0((uint64_t **)(a1 + 48), *((const std::string ***)a2 + 6), (const std::string **)a2 + 7);
  }
  return a1;
}

uint64_t sub_244E12D58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (!result) {
    sub_244E2C928();
  }
  return result;
}

uint64_t sub_244E12D78@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(unsigned char *)(result + 8))
  {
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 8) = "src/controller/CommissioningWindowOpener.cpp";
    int v4 = 145;
LABEL_3:
    *(_DWORD *)(a3 + 16) = v4;
    return result;
  }
  if (!*(void *)a2)
  {
    *(_DWORD *)a3 = 47;
    *(void *)(a3 + 8) = "src/controller/CommissioningWindowOpener.cpp";
    int v4 = 146;
    goto LABEL_3;
  }
  if (!*(unsigned char *)(a2 + 16))
  {
    *(_DWORD *)a3 = 47;
    *(void *)(a3 + 8) = "src/controller/CommissioningWindowOpener.cpp";
    int v4 = 147;
    goto LABEL_3;
  }
  if ((*(_DWORD *)(a2 + 12) - 1000) >= 0x182B9)
  {
    *(_DWORD *)a3 = 47;
    *(void *)(a3 + 8) = "src/controller/CommissioningWindowOpener.cpp";
    int v4 = 150;
    goto LABEL_3;
  }
  uint64_t v6 = (void *)result;
  uint64_t result = (uint64_t)sub_2446D18A4((unsigned char *)(a2 + 24));
  if (*(void *)(result + 8) < 0x10uLL
    || (uint64_t result = (uint64_t)sub_2446D18A4((unsigned char *)(a2 + 24)), *(void *)(result + 8) >= 0x21uLL))
  {
    *(_DWORD *)a3 = 47;
    *(void *)(a3 + 8) = "src/controller/CommissioningWindowOpener.cpp";
    int v4 = 153;
    goto LABEL_3;
  }
  char v7 = *(const void **)sub_2446D18A4((unsigned char *)(a2 + 24));
  char v8 = sub_2446D18A4((unsigned char *)(a2 + 24));
  memcpy((char *)v6 + 236, v7, *((void *)v8 + 1));
  uint64_t v9 = sub_2446D18A4((unsigned char *)(a2 + 24));
  sub_2446C1098(&v11, (uint64_t)v6 + 236, *((void *)v9 + 1));
  *((_OWORD *)v6 + 17) = v11;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  long long v11 = *(_OWORD *)sub_2446D18A4((unsigned char *)(a2 + 48));
  uint64_t result = sub_244CE6468((uint64_t)v6 + 133, (uint64_t)&v11, a3);
  if (!*(_DWORD *)a3)
  {
    v6[3] = *(void *)(a2 + 72);
    void v6[4] = 0;
    v6[2] = 0;
    v6[15] = sub_244E12D58((uint64_t *)a2);
    *((_WORD *)v6 + 65) = *(_WORD *)(a2 + 10);
    *((_DWORD *)v6 + 58) = *(_DWORD *)(a2 + 12);
    *((unsigned char *)v6 + 132) = 2;
    uint64_t v10 = sub_2446D1880((unsigned char *)(a2 + 16));
    sub_244B93A14((uint64_t)(v6 + 14), *(unsigned __int16 *)v10);
    *((_WORD *)v6 + 64) = *(_WORD *)(a2 + 8);
    *((unsigned char *)v6 + 8) = 3;
    return (*(uint64_t (**)(void, void, void *, void *, void))(*(void *)*v6 + 40))(*v6, v6[15], v6 + 36, v6 + 41, 0);
  }
  return result;
}

uint64_t sub_244E12FC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, __n128 *a4@<X8>)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  char v8 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 120);
    LODWORD(buf) = 67109376;
    DWORD1(buf) = HIDWORD(v9);
    WORD4(buf) = 1024;
    *(_DWORD *)((char *)&buf + 10) = v9;
    _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_DEFAULT, "OpenCommissioningWindow for device ID 0x%08X%08X", (uint8_t *)&buf, 0xEu);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  __int16 v10 = *(_WORD *)(a1 + 128);
  v20[0] = &unk_26F945B38;
  v20[1] = a2;
  v21[1] = 0;
  void v21[2] = 0;
  v21[0] = &unk_26F956F80;
  char v22 = 0;
  sub_244D88328(v21, a3);
  __int16 v23 = v10;
  char v24 = 0;
  if (*(unsigned char *)(a1 + 132))
  {
    char v31 = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long buf = 0u;
    long long v26 = 0u;
    p_long long buf = &buf;
    uint64_t v19 = 97;
    a4->n128_u64[1] = 0;
    a4[1].n128_u64[0] = 0;
    a4->n128_u64[0] = 0;
    sub_244CE63D8(a1 + 133, &p_buf, (uint64_t)a4);
    if (a4->n128_u32[0]) {
      goto LABEL_11;
    }
    v15[0] = 0;
    v15[1] = 0;
    __int16 v16 = 0;
    memset(v17, 0, sizeof(v17));
    __int16 v14 = *(_WORD *)(a1 + 130);
    sub_2446C1098(v15, (uint64_t)p_buf, v19);
    __int16 v16 = sub_244BDC1A4((unsigned char *)(a1 + 112));
    *(_DWORD *)uint64_t v17 = *(_DWORD *)(a1 + 232);
    *(_OWORD *)&void v17[4] = *(_OWORD *)(a1 + 272);
    a4->n128_u64[1] = 0;
    a4[1].n128_u64[0] = 0;
    a4->n128_u64[0] = 0;
    v12[0] = 1;
    __int16 v13 = 10000;
    sub_244E1329C((uint64_t)v20, (uint64_t)&v14, a1, (uint64_t)sub_244E133EC, (uint64_t)sub_244E13908, v12, a4);
  }
  else
  {
    __int16 v14 = *(_WORD *)(a1 + 130);
    a4->n128_u64[1] = 0;
    a4[1].n128_u64[0] = 0;
    a4->n128_u64[0] = 0;
    LOBYTE(buf) = 1;
    WORD1(buf) = 10000;
    sub_244E13AE0((uint64_t)v20, (uint64_t)&v14, a1, (uint64_t)sub_244E133EC, (uint64_t)sub_244E13908, (unsigned __int8 *)&buf, a4);
  }
  if (!a4->n128_u32[0])
  {
    a4->n128_u32[0] = 0;
    a4->n128_u64[1] = (unint64_t)"src/controller/CommissioningWindowOpener.cpp";
    a4[1].n128_u32[0] = 204;
  }
LABEL_11:
  v20[0] = &unk_26F945B38;
  return sub_244D87F44(v21);
}

void *sub_244E1329C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unsigned __int8 *a6@<X5>, __n128 *a7@<X8>)
{
  unsigned char v21[4] = *MEMORY[0x263EF8340];
  uint64_t v14 = *(void *)(a1 + 8);
  sub_24479DD24(a1 + 16, (uint64_t)v18);
  uint64_t v15 = (uint64_t *)sub_2446F7170(v18);
  __int16 v16 = *(_WORD *)(a1 + 56);
  v21[0] = &unk_26F95D1A8;
  v21[1] = a3;
  void v21[2] = a4;
  void v21[3] = v21;
  v20[0] = &unk_26F95D228;
  v20[1] = a3;
  void v20[2] = a5;
  v20[3] = v20;
  sub_244E14958(v14, v15, v16, a2, (uint64_t)v21, (uint64_t)v20, a6, a1 + 60, a7, 0);
  sub_2447E6794(v20);
  uint64_t result = sub_244E08F6C(v21);
  if (v18[0]) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v19 + 32))(v19);
  }
  return result;
}

void sub_244E133EC(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_DEFAULT, "Successfully opened pairing window on the device", buf, 2u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  *(unsigned char *)(a1 + 8) = 0;
  if (*(void *)(a1 + 16))
  {
    v54[0] = (const char *)buf;
    v54[1] = (const char *)129;
    long long v52 = 0uLL;
    int v4 = (_DWORD *)(a1 + 40);
    int v3 = *(_DWORD *)(a1 + 40);
    uint64_t v53 = 0;
    *(_DWORD *)uint64_t v56 = v3;
    *(_DWORD *)&v56[3] = *(_DWORD *)(a1 + 43);
    v56[7] = *(unsigned char *)(a1 + 47);
    if (v56[7]) {
      v56[8] = *(unsigned char *)(a1 + 48);
    }
    int v5 = (uint64_t *)(a1 + 50);
    *(void *)&v56[10] = *(void *)(a1 + 50);
    *(_WORD *)&v56[18] = *(_WORD *)(a1 + 58);
    *(_WORD *)&v56[20] = 0;
    sub_244D7F2F0((uint64_t)v56, v54, (uint64_t)&v52);
    int v6 = v52;
    char v7 = sub_244CC8484(9u, "Controller");
    char v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_OWORD *)uint64_t v56 = v52;
        *(void *)&v56[16] = v53;
        uint64_t v9 = sub_244CB7B34((const char **)v56, 1);
        *(_DWORD *)uint64_t v56 = 136315138;
        *(void *)&v56[4] = v9;
        _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "Unable to generate manual code for setup payload: %s", v56, 0xCu);
      }
      if (sub_244CC4E58(1u))
      {
        *(_OWORD *)uint64_t v56 = v52;
        *(void *)&v56[16] = v53;
        sub_244CB7B34((const char **)v56, 1);
        uint64_t v10 = 1;
LABEL_19:
        sub_244CC4DE0(9u, v10);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v56 = 136315138;
        *(void *)&v56[4] = buf;
        _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_DEFAULT, "Manual pairing code: [%s]", v56, 0xCu);
      }
      if (sub_244CC4E58(2u))
      {
        uint64_t v10 = 2;
        goto LABEL_19;
      }
    }
    v51[0] = (uint64_t)buf;
    v51[1] = 129;
    *(_DWORD *)unsigned int v46 = *v4;
    *(_DWORD *)&v46[3] = *(_DWORD *)(a1 + 43);
    if (*(unsigned char *)(a1 + 47)) {
      char v48 = *(unsigned char *)(a1 + 48);
    }
    uint64_t v49 = *v5;
    __int16 v50 = *(_WORD *)(a1 + 58);
    sub_244D80C08(v46, v51, (uint64_t)v56);
    long long v52 = *(_OWORD *)v56;
    uint64_t v53 = *(void *)&v56[16];
    int v15 = *(_DWORD *)v56;
    __int16 v16 = sub_244CC8484(9u, "Controller");
    uint64_t v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_OWORD *)uint64_t v56 = v52;
        *(void *)&v56[16] = v53;
        char v18 = sub_244CB7B34((const char **)v56, 1);
        *(_DWORD *)uint64_t v56 = 136315138;
        *(void *)&v56[4] = v18;
        _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_ERROR, "Unable to generate QR code for setup payload: %s", v56, 0xCu);
      }
      if (!sub_244CC4E58(1u)) {
        goto LABEL_32;
      }
      *(_OWORD *)uint64_t v56 = v52;
      *(void *)&v56[16] = v53;
      sub_244CB7B34((const char **)v56, 1);
      uint64_t v19 = 1;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v56 = 136315138;
        *(void *)&v56[4] = buf;
        _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_DEFAULT, "SetupQRCode: [%s]", v56, 0xCu);
      }
      if (!sub_244CC4E58(2u)) {
        goto LABEL_32;
      }
      uint64_t v19 = 2;
    }
    sub_244CC4DE0(9u, v19);
LABEL_32:
    uint64_t v20 = *(void *)(a1 + 16);
    uint64_t v21 = *(void *)(v20 + 24);
    char v22 = *(void (**)(uint64_t, uint64_t, int *, unsigned char *))(v20 + 32);
    uint64_t v23 = *(void *)(a1 + 120);
    int v43 = 0;
    uint64_t v44 = "src/controller/CommissioningWindowOpener.cpp";
    int v45 = 275;
    *(_DWORD *)int v34 = *v4;
    *(_DWORD *)&v34[3] = *(_DWORD *)(a1 + 43);
    if (*(unsigned char *)(a1 + 47)) {
      char v36 = *(unsigned char *)(a1 + 48);
    }
    uint64_t v37 = *v5;
    __int16 v38 = *(_WORD *)(a1 + 58);
    v40[0] = 0;
    v40[1] = 0;
    uint64_t v39 = v40;
    sub_2447E5E90((uint64_t *)&v39, *(unsigned __int8 **)(a1 + 64), (unsigned __int8 *)(a1 + 72));
    v42[0] = 0;
    v42[1] = 0;
    unsigned int v41 = v42;
    sub_2447E6354((uint64_t *)&v41, *(unsigned __int8 **)(a1 + 88), (unsigned __int8 *)(a1 + 96));
    v22(v21, v23, &v43, v34);
    sub_2447E6298((uint64_t)&v41, v42[0]);
    sub_2447E6298((uint64_t)&v39, v40[0]);
    return;
  }
  uint64_t v11 = *(void *)(a1 + 24);
  if (v11)
  {
    uint64_t v12 = *(void *)(v11 + 24);
    __int16 v13 = *(void (**)(uint64_t, uint64_t, int *))(v11 + 32);
    uint64_t v14 = *(void *)(a1 + 120);
    int v31 = 0;
    uint64_t v32 = "src/controller/CommissioningWindowOpener.cpp";
    int v33 = 282;
    v13(v12, v14, &v31);
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24)
    {
      uint64_t v25 = *(void *)(v24 + 24);
      long long v26 = *(void (**)(uint64_t, uint64_t, int *))(v24 + 32);
      uint64_t v27 = *(void *)(a1 + 120);
      int v28 = 0;
      long long v29 = "src/controller/CommissioningWindowOpener.cpp";
      int v30 = 288;
      v26(v25, v27, &v28);
    }
  }
}

void sub_244E13908(uint64_t a1, long long *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_OWORD *)long long buf = *a2;
    uint64_t v31 = *((void *)a2 + 2);
    int v5 = sub_244CB7B34((const char **)buf, 1);
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_ERROR, "Failed to open pairing window on the device. Status %s", buf, 0xCu);
  }
  if (sub_244CC4E58(1u))
  {
    *(_OWORD *)long long buf = *a2;
    uint64_t v31 = *((void *)a2 + 2);
    sub_244CB7B34((const char **)buf, 1);
    sub_244CC4DE0(9u, 1);
  }
  *(unsigned char *)(a1 + 8) = 0;
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    uint64_t v7 = *(void *)(v6 + 24);
    char v8 = *(void (**)(uint64_t, uint64_t, long long *, long long *))(v6 + 32);
    uint64_t v9 = *(void *)(a1 + 120);
    long long v28 = *a2;
    uint64_t v29 = *((void *)a2 + 2);
    long long v22 = 0u;
    uint64_t v23 = 0;
    long long v25 = 0u;
    uint64_t v24 = &v25;
    v27[0] = 0;
    v27[1] = 0;
    long long v26 = v27;
    v8(v7, v9, &v28, &v22);
    sub_2447E6298((uint64_t)&v26, v27[0]);
    sub_2447E6298((uint64_t)&v24, (char *)v25);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 24);
    if (v10)
    {
      uint64_t v11 = *(void *)(v10 + 24);
      uint64_t v12 = *(void (**)(uint64_t, uint64_t, long long *))(v10 + 32);
      uint64_t v13 = *(void *)(a1 + 120);
      long long v20 = *a2;
      uint64_t v21 = *((void *)a2 + 2);
      v12(v11, v13, &v20);
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14)
      {
        uint64_t v15 = *(void *)(v14 + 24);
        __int16 v16 = *(void (**)(uint64_t, uint64_t, long long *))(v14 + 32);
        uint64_t v17 = *(void *)(a1 + 120);
        long long v18 = *a2;
        uint64_t v19 = *((void *)a2 + 2);
        v16(v15, v17, &v18);
      }
    }
  }
}

void *sub_244E13AE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unsigned __int8 *a6@<X5>, __n128 *a7@<X8>)
{
  unsigned char v21[4] = *MEMORY[0x263EF8340];
  uint64_t v14 = *(void *)(a1 + 8);
  sub_24479DD24(a1 + 16, (uint64_t)v18);
  uint64_t v15 = (uint64_t *)sub_2446F7170(v18);
  __int16 v16 = *(_WORD *)(a1 + 56);
  v21[0] = &unk_26F95D3E8;
  v21[1] = a3;
  void v21[2] = a4;
  void v21[3] = v21;
  v20[0] = &unk_26F95D468;
  v20[1] = a3;
  void v20[2] = a5;
  v20[3] = v20;
  sub_244E15048(v14, v15, v16, a2, (uint64_t)v21, (uint64_t)v20, a6, a1 + 60, a7, 0);
  sub_2447E6794(v20);
  uint64_t result = sub_244E08F6C(v21);
  if (v18[0]) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v19 + 32))(v19);
  }
  return result;
}

void sub_244E13C30(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a2;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Received PID for the device. Value %d", buf, 8u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  *(_WORD *)(a1 + 44) = a2;
  *(unsigned char *)(a1 + 8) = 3;
  memset(buf, 0, sizeof(buf));
  uint64_t v8 = 0;
  (*(void (**)(uint8_t *__return_ptr))(**(void **)a1 + 40))(buf);
  if (*(_DWORD *)buf)
  {
    long long v5 = *(_OWORD *)buf;
    uint64_t v6 = v8;
    sub_244E13908(a1, &v5);
  }
}

void sub_244E13D80(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a2;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Received VID for the device. Value %d", buf, 8u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(9u, 2);
  }
  *(_WORD *)(a1 + 42) = a2;
  *(unsigned char *)(a1 + 8) = 2;
  memset(buf, 0, sizeof(buf));
  uint64_t v8 = 0;
  (*(void (**)(uint8_t *__return_ptr))(**(void **)a1 + 40))(buf);
  if (*(_DWORD *)buf)
  {
    long long v5 = *(_OWORD *)buf;
    uint64_t v6 = v8;
    sub_244E13908(a1, &v5);
  }
}

void sub_244E13ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_OWORD *)long long buf = *(_OWORD *)a2;
    uint64_t v9 = *(void *)(a2 + 16);
    long long v5 = sub_244CB7B34((const char **)buf, 1);
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Failed to read VID/PID for the device. error %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    *(_OWORD *)long long buf = *(_OWORD *)a2;
    uint64_t v9 = *(void *)(a2 + 16);
    sub_244CB7B34((const char **)buf, 1);
    sub_244CC4DE0(9u, 2);
  }
  long long v6 = *(_OWORD *)a2;
  uint64_t v7 = *(void *)(a2 + 16);
  sub_244E13908(a1, &v6);
}

void sub_244E13FFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  LODWORD(v3) = 352;
  uint64_t v5 = 0x300000003;
  long long v6 = "src/controller/CommissioningWindowOpener.cpp";
  uint64_t v7 = "Just got a connected device; how can we be done?";
  switch(*(unsigned char *)(a1 + 8))
  {
    case 0:
      goto LABEL_6;
    case 1:
      *(void *)long long buf = &unk_26F945B38;
      *(void *)&uint8_t buf[8] = a2;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      *(void *)&uint8_t buf[16] = &unk_26F956F80;
      char v21 = 0;
      sub_244D88328(&buf[16], a3);
      __int16 v22 = 0;
      char v23 = 0;
      sub_244E15738((uint64_t)buf, a1, 40, 2, (uint64_t)sub_244E13D80, (uint64_t)sub_244E13ED0, 1, (uint64_t)&v15);
      uint64_t v10 = v15;
      long long v6 = v16;
      uint64_t v3 = v17;
      *(void *)long long buf = &unk_26F945B38;
      sub_244D87F44(&buf[16]);
      uint64_t v5 = v10;
      uint64_t v7 = "Could not read VID for opening commissioning window";
      goto LABEL_5;
    case 2:
      *(void *)long long buf = &unk_26F945B38;
      *(void *)&uint8_t buf[8] = a2;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      *(void *)&uint8_t buf[16] = &unk_26F956F80;
      char v21 = 0;
      sub_244D88328(&buf[16], a3);
      __int16 v22 = 0;
      char v23 = 0;
      sub_244E17430((uint64_t)buf, a1, 40, 4, (uint64_t)sub_244E13C30, (uint64_t)sub_244E13ED0, 1, (uint64_t)&v15);
      uint64_t v11 = v15;
      long long v6 = v16;
      uint64_t v3 = v17;
      *(void *)long long buf = &unk_26F945B38;
      sub_244D87F44(&buf[16]);
      uint64_t v5 = v11;
      uint64_t v7 = "Could not read PID for opening commissioning window";
      goto LABEL_5;
    case 3:
      sub_244E12FC0(a1, a2, a3, (__n128 *)buf);
      uint64_t v5 = *(void *)buf;
      long long v6 = *(const char **)&buf[8];
      uint64_t v7 = "Could not connect to open commissioning window";
      uint64_t v3 = *(void *)&buf[16];
LABEL_5:
      if (v5)
      {
LABEL_6:
        uint64_t v12 = v5;
        uint64_t v8 = sub_244CC8484(9u, "Controller");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(void *)long long buf = v12;
          *(void *)&uint8_t buf[8] = v6;
          *(void *)&uint8_t buf[16] = v3;
          uint64_t v9 = sub_244CB7B34((const char **)buf, 1);
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = v7;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "%s: %s", buf, 0x16u);
        }
        if (sub_244CC4E58(1u))
        {
          *(void *)long long buf = v12;
          *(void *)&uint8_t buf[8] = v6;
          *(void *)&uint8_t buf[16] = v3;
          sub_244CB7B34((const char **)buf, 1);
          sub_244CC4DE0(9u, 1);
        }
        *(void *)&long long v13 = v12;
        *((void *)&v13 + 1) = v6;
        uint64_t v14 = v3;
        sub_244E13908(a1, &v13);
      }
      break;
    default:
      return;
  }
}

void sub_244E1434C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v3 = *(_OWORD *)a3;
  uint64_t v4 = *(void *)(a3 + 16);
  sub_244E13908(a1, &v3);
}

void *sub_244E14380(uint64_t a1, uint64_t a2)
{
  uint64_t result = (void *)sub_2447E6634(a1, a2);
  result[46] = result + 46;
  result[47] = result + 46;
  result[48] = 0;
  result[49] = result;
  result[50] = sub_244E143CC;
  result[51] = result + 51;
  result[52] = result + 51;
  result[53] = 0;
  result[54] = result;
  result[55] = sub_244E14480;
  return result;
}

uint64_t sub_244E143CC(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void (**)(uint64_t))(result + 424);
    if (v2)
    {
      *(void *)(result + 424) = 0;
      v2(result + 408);
    }
    long long v3 = *(void (**)(uint64_t))(v1 + 384);
    if (v3)
    {
      *(void *)(v1 + 384) = 0;
      v3(v1 + 368);
    }
    uint64_t v4 = *(void (**)(uint64_t))(v1 + 344);
    if (v4)
    {
      *(void *)(v1 + 344) = 0;
      v4(v1 + 328);
    }
    uint64_t v5 = *(void (**)(uint64_t))(v1 + 304);
    if (v5)
    {
      *(void *)(v1 + 304) = 0;
      v5(v1 + 288);
    }
    sub_2447E6298(v1 + 88, *(char **)(v1 + 96));
    sub_2447E6298(v1 + 64, *(char **)(v1 + 72));
    JUMPOUT(0x245695FA0);
  }
  return result;
}

uint64_t sub_244E14480(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void (**)(uint64_t))(result + 424);
    if (v2)
    {
      *(void *)(result + 424) = 0;
      v2(result + 408);
    }
    long long v3 = *(void (**)(uint64_t))(v1 + 384);
    if (v3)
    {
      *(void *)(v1 + 384) = 0;
      v3(v1 + 368);
    }
    uint64_t v4 = *(void (**)(uint64_t))(v1 + 344);
    if (v4)
    {
      *(void *)(v1 + 344) = 0;
      v4(v1 + 328);
    }
    uint64_t v5 = *(void (**)(uint64_t))(v1 + 304);
    if (v5)
    {
      *(void *)(v1 + 304) = 0;
      v5(v1 + 288);
    }
    sub_2447E6298(v1 + 88, *(char **)(v1 + 96));
    sub_2447E6298(v1 + 64, *(char **)(v1 + 72));
    JUMPOUT(0x245695FA0);
  }
  return result;
}

uint64_t sub_244E14534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, void *a4@<X8>)
{
  uint64_t result = (uint64_t)operator new(0x1C0uLL, MEMORY[0x263F8C180]);
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = (void *)sub_2447E6634(result, a1);
    uint64_t v11 = v10 + 46;
    v10[46] = v10 + 46;
    v10[47] = v10 + 46;
    v10[48] = 0;
    v10[49] = v10;
    uint64_t v12 = v10 + 51;
    v10[50] = sub_244E143CC;
    v10[51] = v10 + 51;
    v10[52] = v10 + 51;
    v10[53] = 0;
    v10[54] = v10;
    v10[55] = sub_244E14480;
    a4[1] = 0;
    a4[2] = 0;
    *a4 = 0;
    uint64_t result = sub_244E126DC((uint64_t)v10, a2, a3, (uint64_t)(v10 + 51), (uint64_t)a4);
    if (*(_DWORD *)a4)
    {
      long long v13 = *(void (**)(void *))(v9 + 424);
      if (v13)
      {
        *(void *)(v9 + 424) = 0;
        v13(v12);
      }
      uint64_t v14 = *(void (**)(void *))(v9 + 384);
      if (v14)
      {
        *(void *)(v9 + 384) = 0;
        v14(v11);
      }
      uint64_t v15 = *(void (**)(uint64_t))(v9 + 344);
      if (v15)
      {
        *(void *)(v9 + 344) = 0;
        v15(v9 + 328);
      }
      __int16 v16 = *(void (**)(uint64_t))(v9 + 304);
      if (v16)
      {
        *(void *)(v9 + 304) = 0;
        v16(v9 + 288);
      }
      sub_2447E6298(v9 + 88, *(char **)(v9 + 96));
      sub_2447E6298(v9 + 64, *(char **)(v9 + 72));
      JUMPOUT(0x245695FA0);
    }
  }
  else
  {
    *(_DWORD *)a4 = 11;
    a4[1] = "src/controller/CommissioningWindowOpener.cpp";
    *((_DWORD *)a4 + 4) = 384;
  }
  return result;
}

void sub_244E146A4(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, int a4@<W3>, __int16 a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, char a10)
{
  long long v18 = (char *)operator new(0x1C0uLL, MEMORY[0x263F8C180]);
  if (v18)
  {
    uint64_t v19 = v18;
    __int16 v27 = a5;
    uint64_t v20 = (void *)sub_2447E6634((uint64_t)v18, a1);
    uint64_t v21 = (uint64_t)(v20 + 46);
    v20[46] = v20 + 46;
    v20[47] = v20 + 46;
    v20[48] = 0;
    v20[49] = v20;
    __int16 v22 = v20 + 51;
    v20[50] = sub_244E143CC;
    v20[51] = v20 + 51;
    v20[52] = v20 + 51;
    v20[53] = 0;
    v20[54] = v20;
    v20[55] = sub_244E14480;
    a9[1] = 0;
    a9[2] = 0;
    *a9 = 0;
    v31[0] = *(unsigned char *)a6;
    if (v31[0]) {
      int v32 = *(_DWORD *)(a6 + 4);
    }
    v29[0] = *(unsigned char *)a7;
    if (v29[0]) {
      long long v30 = *(_OWORD *)(a7 + 8);
    }
    sub_244E12900(v19, a2, a3, a4, v27, v31, v29, v21, (uint64_t)a9, a8, a10);
    if (*(_DWORD *)a9)
    {
      char v23 = (void (*)(void *))*((void *)v19 + 53);
      if (v23)
      {
        *((void *)v19 + 53) = 0;
        v23(v22);
      }
      uint64_t v24 = (void (*)(uint64_t))*((void *)v19 + 48);
      if (v24)
      {
        *((void *)v19 + 48) = 0;
        v24(v21);
      }
      long long v25 = (void (*)(char *))*((void *)v19 + 43);
      if (v25)
      {
        *((void *)v19 + 43) = 0;
        v25(v19 + 328);
      }
      long long v26 = (void (*)(char *))*((void *)v19 + 38);
      if (v26)
      {
        *((void *)v19 + 38) = 0;
        v26(v19 + 288);
      }
      sub_2447E6298((uint64_t)(v19 + 88), *((char **)v19 + 12));
      sub_2447E6298((uint64_t)(v19 + 64), *((char **)v19 + 9));
      JUMPOUT(0x245695FA0);
    }
  }
  else
  {
    *(_DWORD *)a9 = 11;
    a9[1] = "src/controller/CommissioningWindowOpener.cpp";
    *((_DWORD *)a9 + 4) = 406;
  }
}

void sub_244E14894(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(a1 + 8);
  sub_2447E6298(a1, *(char **)(a1 + 8));
  *(void *)a1 = *a2;
  uint64_t v5 = a2 + 1;
  uint64_t v6 = a2[1];
  void *v4 = v6;
  uint64_t v7 = a2[2];
  *(void *)(a1 + 16) = v7;
  if (v7)
  {
    *(void *)(v6 + 16) = v4;
    *a2 = v5;
    *uint64_t v5 = 0;
    a2[2] = 0;
  }
  else
  {
    *(void *)a1 = v4;
  }
}

uint64_t sub_244E14900(uint64_t a1)
{
  sub_2447E6298(*(void *)a1, *(char **)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    for (uint64_t i = *(void *)(v2 + 16); i; uint64_t i = *(void *)(i + 16))
    {
      uint64_t v2 = i;
      *(void *)(a1 + 8) = i;
    }
    sub_2447E6298(*(void *)a1, (char *)v2);
  }
  return a1;
}

void sub_244E14958(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v36[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v30[0] = a3;
  v30[1] = 0;
  uint64_t v31 = 60;
  char v32 = 1;
  uint64_t v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v27 = 11;
LABEL_15:
    a9->n128_u32[0] = v27;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  __int16 v22 = v21;
  sub_244E08868((uint64_t)v36, a5);
  sub_2447EBBBC((uint64_t)v35, a6);
  v34[3] = 0;
  sub_244E08900((uint64_t)v22, (uint64_t)v36, (uint64_t)v35, (uint64_t)v34);
  sub_2447E6FA8(v34);
  sub_2447E6794(v35);
  sub_244E08F6C(v36);
  v33[0] = &unk_26F95D068;
  v33[1] = v22;
  v33[3] = v33;
  sub_2447E5888(v22 + 9, (uint64_t)v33);
  sub_2447E6FA8(v33);
  int v23 = *a7;
  uint64_t v24 = (__n128 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_17;
  }
  long long v25 = v24;
  sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  LOBYTE(v36[0]) = *a7;
  if (LOBYTE(v36[0])) {
    WORD1(v36[0]) = *((_WORD *)a7 + 1);
  }
  BYTE4(v36[0]) = 0;
  sub_244E14D30(v25, (uint64_t)v30, a4, v36, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v28[0] = *(unsigned char *)a8;
    if (v28[0]) {
      int v29 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64((unsigned __int8 *)v25, a2, (uint64_t)v28, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v36[0] = &unk_26F95D128;
        v36[1] = v22;
        void v36[2] = v25;
        v36[3] = v36;
        sub_244E05388(v36, a10);
        sub_2447E6D14(v36);
      }
      int v27 = 0;
      int v20 = 109;
      goto LABEL_15;
    }
  }
  long long v26 = (void *)sub_244DBB640(v25);
  j__free(v26);
LABEL_17:
  v36[0] = 0;
  sub_244E08D44((uint64_t)v36, v22);
}

void *sub_244E14C64(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26F95D068;
  result[1] = v3;
  return result;
}

uint64_t sub_244E14CAC(uint64_t result, void *a2)
{
  *a2 = &unk_26F95D068;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E14CDC(uint64_t a1, void *a2)
{
}

uint64_t sub_244E14CE4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D0C8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E14D24()
{
  return &unk_26F95D0C8;
}

void sub_244E14D30(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X3>, __n128 *a5@<X8>)
{
  if (*a4)
  {
    v5[0] = &unk_26F95D0E8;
    v5[1] = a3;
    sub_244DBD6B0(a1, a2, (uint64_t)v5, (uint64_t)a4, a5);
  }
  else
  {
    a5->n128_u32[0] = 47;
    a5->n128_u64[1] = (unint64_t)"src/app/CommandSender.h";
    a5[1].n128_u32[0] = 424;
  }
}

double sub_244E14D9C@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_244807600(*(void *)(a1 + 8), a2, a3, a4);
}

__n128 sub_244E14DA4(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95D128;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E14DF0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95D128;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E14E20(uint64_t a1)
{
}

uint64_t sub_244E14E28(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D188)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E14E68()
{
  return &unk_26F95D188;
}

__n128 sub_244E14E74(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95D1A8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E14EC0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95D1A8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E14EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E14EFC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D208)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E14F3C()
{
  return &unk_26F95D208;
}

__n128 sub_244E14F48(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95D228;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E14F94(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95D228;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E14FC4(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E14FFC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D288)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1503C()
{
  return &unk_26F95D288;
}

void sub_244E15048(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v36[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v30[0] = a3;
  v30[1] = 0;
  uint64_t v31 = 0x10000003CLL;
  char v32 = 1;
  uint64_t v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v27 = 11;
LABEL_15:
    a9->n128_u32[0] = v27;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  __int16 v22 = v21;
  sub_244E08868((uint64_t)v36, a5);
  sub_2447EBBBC((uint64_t)v35, a6);
  v34[3] = 0;
  sub_244E08900((uint64_t)v22, (uint64_t)v36, (uint64_t)v35, (uint64_t)v34);
  sub_2447E6FA8(v34);
  sub_2447E6794(v35);
  sub_244E08F6C(v36);
  v33[0] = &unk_26F95D2A8;
  v33[1] = v22;
  v33[3] = v33;
  sub_2447E5888(v22 + 9, (uint64_t)v33);
  sub_2447E6FA8(v33);
  int v23 = *a7;
  uint64_t v24 = (__n128 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_17;
  }
  long long v25 = v24;
  sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  LOBYTE(v36[0]) = *a7;
  if (LOBYTE(v36[0])) {
    WORD1(v36[0]) = *((_WORD *)a7 + 1);
  }
  BYTE4(v36[0]) = 0;
  sub_244E15420(v25, (uint64_t)v30, a4, v36, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v28[0] = *(unsigned char *)a8;
    if (v28[0]) {
      int v29 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64((unsigned __int8 *)v25, a2, (uint64_t)v28, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v36[0] = &unk_26F95D368;
        v36[1] = v22;
        void v36[2] = v25;
        v36[3] = v36;
        sub_244E05388(v36, a10);
        sub_2447E6D14(v36);
      }
      int v27 = 0;
      int v20 = 109;
      goto LABEL_15;
    }
  }
  long long v26 = (void *)sub_244DBB640(v25);
  j__free(v26);
LABEL_17:
  v36[0] = 0;
  sub_244E08D44((uint64_t)v36, v22);
}

void *sub_244E15354(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95D2A8;
  result[1] = v3;
  return result;
}

uint64_t sub_244E1539C(uint64_t result, void *a2)
{
  *a2 = &unk_26F95D2A8;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E153CC(uint64_t a1, void *a2)
{
}

uint64_t sub_244E153D4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D308)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E15414()
{
  return &unk_26F95D308;
}

void sub_244E15420(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X3>, __n128 *a5@<X8>)
{
  if (*a4)
  {
    v5[0] = &unk_26F95D328;
    v5[1] = a3;
    sub_244DBD6B0(a1, a2, (uint64_t)v5, (uint64_t)a4, a5);
  }
  else
  {
    a5->n128_u32[0] = 47;
    a5->n128_u64[1] = (unint64_t)"src/app/CommandSender.h";
    a5[1].n128_u32[0] = 424;
  }
}

double sub_244E1548C@<D0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_2447F0410(a1, a2, a3);
}

__n128 sub_244E15494(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95D368;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E154E0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95D368;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E15510(uint64_t a1)
{
}

uint64_t sub_244E15518(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D3C8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E15558()
{
  return &unk_26F95D3C8;
}

__n128 sub_244E15564(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95D3E8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E155B0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95D3E8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E155E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E155EC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D448)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1562C()
{
  return &unk_26F95D448;
}

__n128 sub_244E15638(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95D468;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E15684(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95D468;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E156B4(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E156EC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D4C8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1572C()
{
  return &unk_26F95D4C8;
}

void *sub_244E15738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  unsigned __int8 v23[4] = *MEMORY[0x263EF8340];
  uint64_t v16 = *(void *)(a1 + 8);
  sub_24479DD24(a1 + 16, (uint64_t)v20);
  uint64_t v17 = (uint64_t *)sub_2446F7170(v20);
  __int16 v18 = *(_WORD *)(a1 + 56);
  v23[0] = &unk_26F95D620;
  v23[1] = a2;
  v23[2] = a5;
  void v23[3] = v23;
  v22[0] = &unk_26F95D6B0;
  v22[1] = a2;
  void v22[2] = a6;
  v22[3] = v22;
  sub_244E15890(v16, v17, v18, a3, a4, (uint64_t)v23, (uint64_t)v22, a7, a8);
  sub_244E17328(v22);
  __n128 result = sub_244E173AC(v23);
  if (v20[0]) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v21 + 32))(v21);
  }
  return result;
}

uint64_t sub_244E15890@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>)
{
  v24[5] = *MEMORY[0x263EF8340];
  sub_244E15D64((uint64_t)v19, a2);
  sub_244E159A4(v20, a6);
  sub_244E15A18(v21, a7);
  v19[113] = a8;
  v18[0] = 0;
  sub_244E15A8C(a1, a3, a4, a5, (uint64_t)v19, v18, a9);
  sub_2447E6D14(v24);
  sub_244E16FB4(v23);
  sub_244E17038(v22);
  sub_244E17328(v21);
  sub_244E173AC(v20);
  return sub_244D87F44(v19);
}

void *sub_244E159A4(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  sub_244E15DF0((uint64_t)v4, a2);
  sub_244E15E88(v4, a1);
  sub_244E173AC(v4);
  return a1;
}

void *sub_244E15A18(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  sub_244E160F0((uint64_t)v4, a2);
  sub_244E16188(v4, a1);
  sub_244E17328(v4);
  return a1;
}

void sub_244E15A8C(uint64_t a1@<X0>, __int16 a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, unsigned char *a6@<X5>, uint64_t a7@<X8>)
{
  char v31[4] = *MEMORY[0x263EF8340];
  int v28 = a4;
  int v29 = a3;
  uint64_t v14 = sub_244DBE094();
  __n128 v26 = (__n128)xmmword_2651A9EF8;
  uint64_t v27 = 57;
  uint64_t v15 = sub_244CC4D84(0xCuLL);
  if (!v15)
  {
    *(_DWORD *)a7 = 11;
    *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
    *(_DWORD *)(a7 + 16) = 60;
    return;
  }
  uint64_t v16 = v15;
  _DWORD *v15 = a3;
  v15[1] = a4;
  *((_WORD *)v15 + 4) = a2;
  *((_WORD *)v15 + 5) = -1;
  *(void *)(a5 + 56) = v15;
  *(void *)(a5 + 64) = 1;
  if (*a6)
  {
    uint64_t v17 = sub_2446F12CC(a6);
    __int16 v18 = sub_244CC4D84(0x10uLL);
    if (!v18)
    {
      *(_DWORD *)a7 = 11;
      *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
      *(_DWORD *)(a7 + 16) = 67;
LABEL_22:
      j__free(v16);
      return;
    }
    uint64_t v19 = v18;
    int v20 = *(_DWORD *)v17;
    *__int16 v18 = a3;
    *((unsigned char *)v18 + 4) = 1;
    v18[2] = v20;
    *((_WORD *)v18 + 6) = a2;
    *(void *)(a5 + 72) = v18;
    *(void *)(a5 + 80) = 1;
  }
  else
  {
    uint64_t v19 = 0;
  }
  sub_2447E97A8((uint64_t)v31, a5 + 248);
  sub_2447E97A8((uint64_t)v30, (uint64_t)v31);
  uint64_t v21 = sub_244E163F0(&v29, &v28, a5 + 120, a5 + 152, (uint64_t)v30, a5 + 184, a5 + 216);
  if (!v21)
  {
    *(_DWORD *)a7 = 11;
    *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
    *(_DWORD *)(a7 + 16) = 83;
    goto LABEL_19;
  }
  uint64_t v22 = (uint64_t)v21;
  int v23 = (void (***)(void))sub_244CC4D84(0x160uLL);
  if (!v23)
  {
    *(_DWORD *)a7 = 11;
    *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
    *(_DWORD *)(a7 + 16) = 87;
LABEL_17:
    long long v25 = (void *)sub_244E167E8(v22);
    j__free(v25);
    goto LABEL_19;
  }
  uint64_t v24 = v23;
  if (*(unsigned char *)(sub_244DCD620(v23, v14, a1, v22 + 176, *(unsigned __int8 *)(a5 + 280)) + 80) == 1)
  {
    sub_244DD0EB4((uint64_t)v24, a5, &v26);
    uint64_t v19 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    sub_244DCE078((uint64_t)v24, a5, &v26);
  }
  *(__n128 *)a7 = v26;
  *(void *)(a7 + 16) = v27;
  if (*(_DWORD *)a7)
  {
    (**v24)(v24);
    j__free(v24);
    goto LABEL_17;
  }
  sub_244DF347C((void (****)(void))(v22 + 240), v24);
  *(__n128 *)a7 = v26;
  *(void *)(a7 + 16) = v27;
LABEL_19:
  sub_2447E6D14(v30);
  sub_2447E6D14(v31);
  if (v19) {
    j__free(v19);
  }
  if (v16) {
    goto LABEL_22;
  }
}

uint64_t sub_244E15D64(uint64_t a1, uint64_t *a2)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_26F956F80;
  *(unsigned char *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(unsigned char *)(a1 + 88) = 0;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = 0;
  *(_WORD *)(a1 + 113) = 1;
  sub_244D88328((void *)a1, a2);
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 240) = 0;
  *(void *)(a1 + 272) = 0;
  *(unsigned char *)(a1 + 280) = 0;
  *(unsigned char *)(a1 + 112) = 0;
  return a1;
}

uint64_t sub_244E15DF0(uint64_t a1, uint64_t a2)
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

void *sub_244E15E88(void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    uint64_t v5 = (void *)a2[3];
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

uint64_t sub_244E160F0(uint64_t a1, uint64_t a2)
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

void *sub_244E16188(void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    uint64_t v5 = (void *)a2[3];
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

void *sub_244E163F0(int *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void v26[4] = *MEMORY[0x263EF8340];
  uint64_t v14 = sub_244CC4D84(0x100uLL);
  if (v14)
  {
    int v15 = *a1;
    int v16 = *a2;
    sub_244E15DF0((uint64_t)v26, a3);
    sub_244E160F0((uint64_t)v25, a4);
    sub_2447E97A8((uint64_t)v22, a5);
    uint64_t v17 = operator new(0x28uLL);
    __int16 v18 = v17;
    *uint64_t v17 = &unk_26F95D4E8;
    if (v23)
    {
      if (v23 == v22)
      {
        void v17[4] = v17 + 1;
        (*(void (**)(void *))(v22[0] + 24))(v22);
      }
      else
      {
        void v17[4] = v23;
        int v23 = 0;
      }
    }
    else
    {
      void v17[4] = 0;
    }
    void v24[3] = v18;
    sub_244E16888((uint64_t)v21, a6);
    sub_244E16920((uint64_t)v20, a7);
    sub_244E169B8((uint64_t)v14, v15, v16, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v21, (uint64_t)v20);
    sub_244E16FB4(v20);
    sub_244E17038(v21);
    sub_244E170BC(v24);
    sub_2447E6D14(v22);
    sub_244E17328(v25);
    sub_244E173AC(v26);
  }
  return v14;
}

void *sub_244E165B0(void *a1)
{
  *a1 = &unk_26F95D4E8;
  sub_2447E6D14(a1 + 1);
  return a1;
}

void sub_244E165F4(void *a1)
{
  *a1 = &unk_26F95D4E8;
  sub_2447E6D14(a1 + 1);

  JUMPOUT(0x245695FA0);
}

void *sub_244E16658(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  uint64_t v2 = operator new(0x28uLL);
  *uint64_t v2 = &unk_26F95D4E8;
  sub_2447E97A8((uint64_t)(v2 + 1), v1);
  return v2;
}

uint64_t sub_244E166AC(uint64_t a1, void *a2)
{
  *a2 = &unk_26F95D4E8;
  return sub_2447E97A8((uint64_t)(a2 + 1), a1 + 8);
}

void *sub_244E166D8(uint64_t a1)
{
  return sub_2447E6D14((void *)(a1 + 8));
}

void sub_244E166E0(void *a1)
{
  sub_2447E6D14(a1 + 1);

  operator delete(a1);
}

void sub_244E1671C(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_244E16724(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D558)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E16764()
{
  return &unk_26F95D558;
}

void sub_244E16770(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 48))(v3);
  }
  if (v2)
  {
    uint64_t v4 = (void *)sub_244E167E8(v2);
    j__free(v4);
  }
}

uint64_t sub_244E167E8(uint64_t a1)
{
  uint64_t v2 = (void (****)(void))(a1 + 240);
  sub_244DF347C((void (****)(void))(a1 + 240), 0);
  sub_244DF347C(v2, 0);
  *(void *)(a1 + 176) = &unk_26F953058;
  uint64_t v4 = (void **)(a1 + 208);
  sub_244CAC658(&v4);
  sub_244E16FB4((void *)(a1 + 144));
  sub_244E17038((void *)(a1 + 112));
  sub_244E170BC((void *)(a1 + 80));
  sub_244E17328((void *)(a1 + 48));
  sub_244E173AC((void *)(a1 + 16));
  return a1;
}

uint64_t sub_244E16888(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E16920(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E169B8(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = &unk_26F95D578;
  *(_DWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 12) = a3;
  sub_244E15DF0(a1 + 16, a4);
  sub_244E160F0(a1 + 48, a5);
  sub_244E16DCC(a1 + 80, a6);
  sub_244E16888(a1 + 112, a7);
  sub_244E16920(a1 + 144, a8);
  *(void *)(a1 + 176) = &unk_26F953058;
  *(_WORD *)(a1 + 184) = 0;
  *(unsigned char *)(a1 + 186) = 0;
  *(unsigned char *)(a1 + 200) = 0;
  *(void *)(a1 + 188) = 0;
  *(_DWORD *)(a1 + 195) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 0;
  *(void *)(a1 + 224) = 0;
  *(void *)(a1 + 232) = a1;
  *(void *)(a1 + 240) = 0;
  *(unsigned char *)(a1 + 248) = 0;
  return a1;
}

void sub_244E16A9C(uint64_t a1)
{
  sub_244E167E8(a1);

  JUMPOUT(0x245695FA0);
}

unsigned __int8 *sub_244E16AD4(unsigned __int8 *result, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v5 = result;
  if (!result[248] || *(unsigned char *)(*((void *)result + 30) + 80))
  {
    result[248] = 1;
    __int16 v9 = 0;
    if (*(unsigned __int8 *)(a2 + 14) >= 2u) {
      sub_244E2CA70();
    }
    if (*a4)
    {
      __n128 result = sub_244CCF6E8(a4, (uint64_t)v8);
      if (!LODWORD(v8[0])) {
        return result;
      }
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    if (*(_DWORD *)(a2 + 4) != *((_DWORD *)result + 2)) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    if (*(_DWORD *)(a2 + 8) != *((_DWORD *)result + 3)) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    if (!a3) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    memset(v8, 0, sizeof(v8));
    sub_24484B11C(a3, &v9, v8);
    if (LODWORD(v8[0])) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    uint64_t v6 = *((void *)v5 + 5);
    if (v6)
    {
      return (unsigned __int8 *)(*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(*(void *)v6 + 48))(v6, a2, &v9);
    }
    else
    {
      uint64_t v7 = sub_244E04700();
      return (unsigned __int8 *)sub_244E16C14(v7);
    }
  }
  return result;
}

uint64_t sub_244E16C14(uint64_t result, int a2)
{
  if (*(void *)(result + 136)) {
    return sub_244E16EB8(result + 112, *(void *)(result + 240), a2);
  }
  return result;
}

uint64_t sub_244E16C34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, void *a4@<X8>)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  long long v14 = *a3;
  uint64_t v15 = *((void *)a3 + 2);
  uint64_t result = sub_244DD17BC(a2, (uint64_t)&v14, (uint64_t)a4);
  if (!*(_DWORD *)a4)
  {
    if (*(void *)(a1 + 168))
    {
      uint64_t v9 = a1 + 144;
      uint64_t v10 = *(void *)(a1 + 240);
      long long v12 = *a3;
      uint64_t v13 = *((void *)a3 + 2);
      int v11 = sub_244DCDA88(a2);
      uint64_t result = sub_244E16F0C(v9, v10, (uint64_t)&v12, v11);
    }
    *(_DWORD *)a4 = 0;
    a4[1] = "src/controller/TypedReadCallback.h";
    *((_DWORD *)a4 + 4) = 146;
  }
  return result;
}

uint64_t sub_244E16CFC(uint64_t result)
{
  if (!*(unsigned char *)(result + 248) || *(unsigned char *)(*(void *)(result + 240) + 80))
  {
    *(unsigned char *)(result + 248) = 1;
    return sub_244E16E64(result + 48, 0);
  }
  return result;
}

void *sub_244E16D54(uint64_t a1)
{
  return sub_244E16F60(a1 + 80, a1);
}

void sub_244E16D60(uint64_t a1, void *a2)
{
  if (a2[8] != 1 || (uint64_t v3 = (void *)a2[7]) == 0) {
    sub_244E2CB14();
  }
  j__free(v3);
  if (a2[10] == 1)
  {
    uint64_t v4 = (void *)a2[9];
    if (v4)
    {
      j__free(v4);
    }
  }
}

uint64_t sub_244E16DCC(uint64_t a1, uint64_t a2)
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

uint64_t sub_244E16E64(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v5);
  }
  uint64_t v4 = sub_244E04700();
  return sub_244E16EB8(v4);
}

uint64_t sub_244E16EB8(uint64_t a1, uint64_t a2, int a3)
{
  int v6 = a3;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, int *))(*(void *)v3 + 48))(v3, a2, &v6);
  }
  uint64_t v5 = sub_244E04700();
  return sub_244E16F0C(v5);
}

uint64_t sub_244E16F0C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v7 = a4;
  uint64_t v4 = *(void *)(a1 + 24);
  if (v4) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(*(void *)v4 + 48))(v4, a2, a3, &v7);
  }
  int v6 = sub_244E04700();
  return sub_244E16F60(v6);
}

void *sub_244E16F60(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2) {
    return (void *)(*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v5);
  }
  uint64_t v4 = sub_244E04700();
  return sub_244E16FB4(v4);
}

void *sub_244E16FB4(void *a1)
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

void *sub_244E17038(void *a1)
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

void *sub_244E170BC(void *a1)
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

__n128 sub_244E17140(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95D620;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E1718C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95D620;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E171BC(uint64_t result, uint64_t a2, unsigned __int16 *a3)
{
  uint64_t v3 = *(uint64_t (**)(void, void))(result + 16);
  if (v3) {
    return v3(*(void *)(result + 8), *a3);
  }
  return result;
}

uint64_t sub_244E171D4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D690)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E17214()
{
  return &unk_26F95D690;
}

__n128 sub_244E17220(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95D6B0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E1726C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95D6B0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E1729C(uint64_t result, uint64_t a2, long long *a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, long long *))(result + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(result + 8);
    long long v5 = *a3;
    uint64_t v6 = *((void *)a3 + 2);
    return v3(v4, &v5);
  }
  return result;
}

uint64_t sub_244E172DC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D720)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1731C()
{
  return &unk_26F95D720;
}

void *sub_244E17328(void *a1)
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

void *sub_244E173AC(void *a1)
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

void *sub_244E17430@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  void v23[4] = *MEMORY[0x263EF8340];
  uint64_t v16 = *(void *)(a1 + 8);
  sub_24479DD24(a1 + 16, (uint64_t)v20);
  uint64_t v17 = (uint64_t *)sub_2446F7170(v20);
  __int16 v18 = *(_WORD *)(a1 + 56);
  v23[0] = &unk_26F95D878;
  v23[1] = a2;
  v23[2] = a5;
  void v23[3] = v23;
  v22[0] = &unk_26F95D908;
  v22[1] = a2;
  void v22[2] = a6;
  void v22[3] = v22;
  sub_244E17588(v16, v17, v18, a3, a4, (uint64_t)v23, (uint64_t)v22, a7, a8);
  sub_244E17328(v22);
  __n128 result = sub_244E18738(v23);
  if (v20[0]) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v21 + 32))(v21);
  }
  return result;
}

uint64_t sub_244E17588@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>)
{
  v24[5] = *MEMORY[0x263EF8340];
  sub_244E15D64((uint64_t)v19, a2);
  sub_244E1769C(v20, a6);
  sub_244E15A18(v21, a7);
  v19[113] = a8;
  v18[0] = 0;
  sub_244E17710(a1, a3, a4, a5, (uint64_t)v19, v18, a9);
  sub_2447E6D14(v24);
  sub_244E16FB4(v23);
  sub_244E17038(v22);
  sub_244E17328(v21);
  sub_244E18738(v20);
  return sub_244D87F44(v19);
}

void *sub_244E1769C(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  sub_244E179E8((uint64_t)v4, a2);
  sub_244E17A80(v4, a1);
  sub_244E18738(v4);
  return a1;
}

void sub_244E17710(uint64_t a1@<X0>, __int16 a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, unsigned char *a6@<X5>, uint64_t a7@<X8>)
{
  char v31[4] = *MEMORY[0x263EF8340];
  int v28 = a4;
  int v29 = a3;
  long long v14 = sub_244DBE094();
  __n128 v26 = (__n128)xmmword_2651A9EF8;
  uint64_t v27 = 57;
  uint64_t v15 = sub_244CC4D84(0xCuLL);
  if (!v15)
  {
    *(_DWORD *)a7 = 11;
    *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
    *(_DWORD *)(a7 + 16) = 60;
    return;
  }
  uint64_t v16 = v15;
  _DWORD *v15 = a3;
  v15[1] = a4;
  *((_WORD *)v15 + 4) = a2;
  *((_WORD *)v15 + 5) = -1;
  *(void *)(a5 + 56) = v15;
  *(void *)(a5 + 64) = 1;
  if (*a6)
  {
    uint64_t v17 = sub_2446F12CC(a6);
    __int16 v18 = sub_244CC4D84(0x10uLL);
    if (!v18)
    {
      *(_DWORD *)a7 = 11;
      *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
      *(_DWORD *)(a7 + 16) = 67;
LABEL_22:
      j__free(v16);
      return;
    }
    uint64_t v19 = v18;
    int v20 = *(_DWORD *)v17;
    *__int16 v18 = a3;
    *((unsigned char *)v18 + 4) = 1;
    v18[2] = v20;
    *((_WORD *)v18 + 6) = a2;
    *(void *)(a5 + 72) = v18;
    *(void *)(a5 + 80) = 1;
  }
  else
  {
    uint64_t v19 = 0;
  }
  sub_2447E97A8((uint64_t)v31, a5 + 248);
  sub_2447E97A8((uint64_t)v30, (uint64_t)v31);
  uint64_t v21 = sub_244E17CE8(&v29, &v28, a5 + 120, a5 + 152, (uint64_t)v30, a5 + 184, a5 + 216);
  if (!v21)
  {
    *(_DWORD *)a7 = 11;
    *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
    *(_DWORD *)(a7 + 16) = 83;
    goto LABEL_19;
  }
  uint64_t v22 = (uint64_t)v21;
  int v23 = (void (***)(void))sub_244CC4D84(0x160uLL);
  if (!v23)
  {
    *(_DWORD *)a7 = 11;
    *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
    *(_DWORD *)(a7 + 16) = 87;
LABEL_17:
    long long v25 = (void *)sub_244E180E0(v22);
    j__free(v25);
    goto LABEL_19;
  }
  uint64_t v24 = v23;
  if (*(unsigned char *)(sub_244DCD620(v23, v14, a1, v22 + 176, *(unsigned __int8 *)(a5 + 280)) + 80) == 1)
  {
    sub_244DD0EB4((uint64_t)v24, a5, &v26);
    uint64_t v19 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    sub_244DCE078((uint64_t)v24, a5, &v26);
  }
  *(__n128 *)a7 = v26;
  *(void *)(a7 + 16) = v27;
  if (*(_DWORD *)a7)
  {
    (**v24)(v24);
    j__free(v24);
    goto LABEL_17;
  }
  sub_244DF347C((void (****)(void))(v22 + 240), v24);
  *(__n128 *)a7 = v26;
  *(void *)(a7 + 16) = v27;
LABEL_19:
  sub_2447E6D14(v30);
  sub_2447E6D14(v31);
  if (v19) {
    j__free(v19);
  }
  if (v16) {
    goto LABEL_22;
  }
}

uint64_t sub_244E179E8(uint64_t a1, uint64_t a2)
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

void *sub_244E17A80(void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    long long v5 = (void *)a2[3];
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

void *sub_244E17CE8(int *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void v26[4] = *MEMORY[0x263EF8340];
  long long v14 = sub_244CC4D84(0x100uLL);
  if (v14)
  {
    int v15 = *a1;
    int v16 = *a2;
    sub_244E179E8((uint64_t)v26, a3);
    sub_244E160F0((uint64_t)v25, a4);
    sub_2447E97A8((uint64_t)v22, a5);
    uint64_t v17 = operator new(0x28uLL);
    __int16 v18 = v17;
    *uint64_t v17 = &unk_26F95D740;
    if (v23)
    {
      if (v23 == v22)
      {
        void v17[4] = v17 + 1;
        (*(void (**)(void *))(v22[0] + 24))(v22);
      }
      else
      {
        void v17[4] = v23;
        int v23 = 0;
      }
    }
    else
    {
      void v17[4] = 0;
    }
    void v24[3] = v18;
    sub_244E16888((uint64_t)v21, a6);
    sub_244E16920((uint64_t)v20, a7);
    sub_244E18180((uint64_t)v14, v15, v16, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v21, (uint64_t)v20);
    sub_244E16FB4(v20);
    sub_244E17038(v21);
    sub_244E184CC(v24);
    sub_2447E6D14(v22);
    sub_244E17328(v25);
    sub_244E18738(v26);
  }
  return v14;
}

void *sub_244E17EA8(void *a1)
{
  *a1 = &unk_26F95D740;
  sub_2447E6D14(a1 + 1);
  return a1;
}

void sub_244E17EEC(void *a1)
{
  *a1 = &unk_26F95D740;
  sub_2447E6D14(a1 + 1);

  JUMPOUT(0x245695FA0);
}

void *sub_244E17F50(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  uint64_t v2 = operator new(0x28uLL);
  *uint64_t v2 = &unk_26F95D740;
  sub_2447E97A8((uint64_t)(v2 + 1), v1);
  return v2;
}

uint64_t sub_244E17FA4(uint64_t a1, void *a2)
{
  *a2 = &unk_26F95D740;
  return sub_2447E97A8((uint64_t)(a2 + 1), a1 + 8);
}

void *sub_244E17FD0(uint64_t a1)
{
  return sub_2447E6D14((void *)(a1 + 8));
}

void sub_244E17FD8(void *a1)
{
  sub_2447E6D14(a1 + 1);

  operator delete(a1);
}

void sub_244E18014(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_244E1801C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D7B0)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1805C()
{
  return &unk_26F95D7B0;
}

void sub_244E18068(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 48))(v3);
  }
  if (v2)
  {
    uint64_t v4 = (void *)sub_244E180E0(v2);
    j__free(v4);
  }
}

uint64_t sub_244E180E0(uint64_t a1)
{
  uint64_t v2 = (void (****)(void))(a1 + 240);
  sub_244DF347C((void (****)(void))(a1 + 240), 0);
  sub_244DF347C(v2, 0);
  *(void *)(a1 + 176) = &unk_26F953058;
  uint64_t v4 = (void **)(a1 + 208);
  sub_244CAC658(&v4);
  sub_244E16FB4((void *)(a1 + 144));
  sub_244E17038((void *)(a1 + 112));
  sub_244E184CC((void *)(a1 + 80));
  sub_244E17328((void *)(a1 + 48));
  sub_244E18738((void *)(a1 + 16));
  return a1;
}

uint64_t sub_244E18180(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = &unk_26F95D7D0;
  *(_DWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 12) = a3;
  sub_244E179E8(a1 + 16, a4);
  sub_244E160F0(a1 + 48, a5);
  sub_244E183E0(a1 + 80, a6);
  sub_244E16888(a1 + 112, a7);
  sub_244E16920(a1 + 144, a8);
  *(void *)(a1 + 176) = &unk_26F953058;
  *(_WORD *)(a1 + 184) = 0;
  *(unsigned char *)(a1 + 186) = 0;
  *(unsigned char *)(a1 + 200) = 0;
  *(void *)(a1 + 188) = 0;
  *(_DWORD *)(a1 + 195) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 0;
  *(void *)(a1 + 224) = 0;
  *(void *)(a1 + 232) = a1;
  *(void *)(a1 + 240) = 0;
  *(unsigned char *)(a1 + 248) = 0;
  return a1;
}

void sub_244E18264(uint64_t a1)
{
  sub_244E180E0(a1);

  JUMPOUT(0x245695FA0);
}

unsigned __int8 *sub_244E1829C(unsigned __int8 *result, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  long long v5 = result;
  if (!result[248] || *(unsigned char *)(*((void *)result + 30) + 80))
  {
    result[248] = 1;
    __int16 v9 = 0;
    if (*(unsigned __int8 *)(a2 + 14) >= 2u) {
      sub_244E2CA70();
    }
    if (*a4)
    {
      __n128 result = sub_244CCF6E8(a4, (uint64_t)&v8);
      if (!v8) {
        return result;
      }
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    if (*(_DWORD *)(a2 + 4) != *((_DWORD *)result + 2)) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    if (*(_DWORD *)(a2 + 8) != *((_DWORD *)result + 3)) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    if (!a3) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    sub_244CB3F40(a3, &v9, (uint64_t)&v8);
    if (v8) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    uint64_t v6 = *((void *)v5 + 5);
    if (v6)
    {
      return (unsigned __int8 *)(*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(*(void *)v6 + 48))(v6, a2, &v9);
    }
    else
    {
      int v7 = sub_244E04700();
      return (unsigned __int8 *)sub_244E183D4(v7);
    }
  }
  return result;
}

void *sub_244E183D4(uint64_t a1)
{
  return sub_244E18478(a1 + 80, a1);
}

uint64_t sub_244E183E0(uint64_t a1, uint64_t a2)
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

void *sub_244E18478(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2) {
    return (void *)(*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v5);
  }
  uint64_t v4 = sub_244E04700();
  return sub_244E184CC(v4);
}

void *sub_244E184CC(void *a1)
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

__n128 sub_244E18550(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95D878;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E1859C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95D878;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E185CC(uint64_t result, uint64_t a2, unsigned __int16 *a3)
{
  uint64_t v3 = *(uint64_t (**)(void, void))(result + 16);
  if (v3) {
    return v3(*(void *)(result + 8), *a3);
  }
  return result;
}

uint64_t sub_244E185E4(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D8E8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E18624()
{
  return &unk_26F95D8E8;
}

__n128 sub_244E18630(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95D908;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E1867C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95D908;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E186AC(uint64_t result, uint64_t a2, long long *a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, long long *))(result + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(result + 8);
    long long v5 = *a3;
    uint64_t v6 = *((void *)a3 + 2);
    return v3(v4, &v5);
  }
  return result;
}

uint64_t sub_244E186EC(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D968)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1872C()
{
  return &unk_26F95D968;
}

void *sub_244E18738(void *a1)
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

uint64_t sub_244E187BC(void *a1, uint64_t a2, uint64_t a3)
{
  a1[11] = a3;
  a1[12] = a2;
  *((unsigned char *)a1 + 105) = 1;
  return (*(uint64_t (**)(void))(*(void *)*a1 + 40))(*a1);
}

uint64_t sub_244E18800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  v7[0] = &unk_26F945B38;
  v7[1] = a2;
  v8[1] = 0;
  void v8[2] = 0;
  v8[0] = &unk_26F956F80;
  char v9 = 0;
  sub_244D88328(v8, a3);
  __int16 v10 = 0;
  char v11 = 0;
  sub_244E19680((uint64_t)v7, a1, 62, 5, (uint64_t)sub_244E188DC, (uint64_t)sub_244E189E8, 1, a4);
  v7[0] = &unk_26F945B38;
  return sub_244D87F44(v8);
}

uint64_t sub_244E188DC(unsigned char *a1, char a2)
{
  if (a1)
  {
    a1[104] = a2;
    a1[105] = 2;
    memset(buf, 0, sizeof(buf));
    uint64_t v8 = 0;
    uint64_t result = (uint64_t)(*(void *(**)(uint8_t *__return_ptr))(**(void **)a1 + 40))(buf);
    if (*(_DWORD *)buf)
    {
      long long v5 = *(_OWORD *)buf;
      uint64_t v6 = v8;
      return sub_244E190CC((uint64_t)a1, (int *)&v5);
    }
  }
  else
  {
    uint64_t v4 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Success Read Current Fabric index callback with null context. Ignoring", buf, 2u);
    }
    uint64_t result = sub_244CC4E58(2u);
    if (result) {
      return sub_244CC4DE0(9u, 2);
    }
  }
  return result;
}

uint64_t sub_244E189E8(uint64_t a1, long long *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_OWORD *)long long buf = *a2;
    uint64_t v11 = *((void *)a2 + 2);
    long long v5 = sub_244CB7B34((const char **)buf, 1);
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "OnReadAttributeFailure %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    *(_OWORD *)long long buf = *a2;
    uint64_t v11 = *((void *)a2 + 2);
    sub_244CB7B34((const char **)buf, 1);
    sub_244CC4DE0(9u, 2);
  }
  if (a1)
  {
    long long v8 = *a2;
    uint64_t v9 = *((void *)a2 + 2);
    return sub_244E190CC(a1, (int *)&v8);
  }
  else
  {
    int v7 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Read Attribute failure callback with null context. Ignoring", buf, 2u);
    }
    uint64_t result = sub_244CC4E58(2u);
    if (result) {
      return sub_244CC4DE0(9u, 2);
    }
  }
  return result;
}

uint64_t sub_244E18B84@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, __n128 *a4@<X8>)
{
  if (*(unsigned char *)(result + 104))
  {
    uint64_t v5 = result;
    char v11 = *(unsigned char *)(result + 104);
    v6[0] = &unk_26F945B38;
    v6[1] = a2;
    v7[1] = 0;
    void v7[2] = 0;
    v7[0] = &unk_26F956F80;
    char v8 = 0;
    sub_244D88328(v7, a3);
    __int16 v9 = 0;
    char v10 = 0;
    v12[0] = 0;
    sub_244E1AA78((uint64_t)v6, (uint64_t)&v11, v5, (uint64_t)sub_244E18C8C, (uint64_t)sub_244E18D40, v12, a4);
    v6[0] = &unk_26F945B38;
    return sub_244D87F44(v7);
  }
  else
  {
    a4->n128_u32[0] = 113;
    a4->n128_u64[1] = (unint64_t)"src/controller/CurrentFabricRemover.cpp";
    a4[1].n128_u32[0] = 51;
  }
  return result;
}

uint64_t sub_244E18C8C(uint64_t a1)
{
  if (a1)
  {
    int v3 = 0;
    uint64_t v4 = "src/controller/CurrentFabricRemover.cpp";
    int v5 = 133;
    return sub_244E190CC(a1, &v3);
  }
  else
  {
    uint64_t v2 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_DEFAULT, "Success Remove Fabric command callback with null context. Ignoring", buf, 2u);
    }
    uint64_t result = sub_244CC4E58(2u);
    if (result) {
      return sub_244CC4DE0(9u, 2);
    }
  }
  return result;
}

uint64_t sub_244E18D40(uint64_t a1, long long *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_OWORD *)long long buf = *a2;
    uint64_t v11 = *((void *)a2 + 2);
    int v5 = sub_244CB7B34((const char **)buf, 1);
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "OnCommandFailure %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    *(_OWORD *)long long buf = *a2;
    uint64_t v11 = *((void *)a2 + 2);
    sub_244CB7B34((const char **)buf, 1);
    sub_244CC4DE0(9u, 2);
  }
  if (a1)
  {
    long long v8 = *a2;
    uint64_t v9 = *((void *)a2 + 2);
    return sub_244E190CC(a1, (int *)&v8);
  }
  else
  {
    int v7 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Send command failure callback with null context. Ignoring", buf, 2u);
    }
    uint64_t result = sub_244CC4E58(2u);
    if (result) {
      return sub_244CC4DE0(9u, 2);
    }
  }
  return result;
}

uint64_t sub_244E18EDC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v6 = *(unsigned __int8 *)(a1 + 105);
    if (v6 == 2)
    {
      uint64_t result = sub_244E18B84(a1, a2, a3, &buf);
    }
    else
    {
      if (v6 != 1)
      {
        int v9 = 3;
        char v10 = "src/controller/CurrentFabricRemover.cpp";
        int v11 = 80;
LABEL_13:
        uint64_t v12 = sub_244CC8484(9u, "Controller");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          buf.n128_u64[0] = __PAIR64__(v3, v9);
          buf.n128_u64[1] = (unint64_t)v10;
          int v19 = v11;
          int v20 = v4;
          uint64_t v13 = sub_244CB7B34((const char **)&buf, 1);
          buf.n128_u32[0] = 136315138;
          *(unint64_t *)((char *)buf.n128_u64 + 4) = (unint64_t)v13;
          _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "Current Fabric Remover failure : %s", (uint8_t *)&buf, 0xCu);
        }
        if (sub_244CC4E58(1u))
        {
          buf.n128_u64[0] = __PAIR64__(v3, v9);
          buf.n128_u64[1] = (unint64_t)v10;
          int v19 = v11;
          int v20 = v4;
          sub_244CB7B34((const char **)&buf, 1);
          sub_244CC4DE0(9u, 1);
        }
        v14[0] = v9;
        v14[1] = v3;
        int v15 = v10;
        int v16 = v11;
        int v17 = v4;
        return sub_244E190CC(a1, v14);
      }
      uint64_t result = sub_244E18800(a1, a2, a3, (uint64_t)&buf);
    }
    int v9 = buf.n128_u32[0];
    int v3 = buf.n128_i32[1];
    char v10 = (const char *)buf.n128_u64[1];
    int v11 = v19;
    int v4 = v20;
    if (!buf.n128_u32[0]) {
      return result;
    }
    goto LABEL_13;
  }
  long long v8 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    buf.n128_u16[0] = 0;
    _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_DEFAULT, "Device connected callback with null context. Ignoring", (uint8_t *)&buf, 2u);
  }
  uint64_t result = sub_244CC4E58(2u);
  if (result) {
    return sub_244CC4DE0(9u, 2);
  }
  return result;
}

uint64_t sub_244E190CC(uint64_t a1, int *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v4 = *a2;
  int v5 = sub_244CC8484(9u, "Controller");
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)__n128 buf = *(_OWORD *)a2;
      uint64_t v17 = *((void *)a2 + 2);
      int v7 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "Remove Current Fabric Failed : %s", buf, 0xCu);
    }
    uint64_t result = sub_244CC4E58(1u);
    if (result)
    {
      *(_OWORD *)__n128 buf = *(_OWORD *)a2;
      uint64_t v17 = *((void *)a2 + 2);
      sub_244CB7B34((const char **)buf, 1);
      uint64_t v9 = 1;
LABEL_10:
      uint64_t result = sub_244CC4DE0(9u, v9);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "Remove Current Fabric succeeded.", buf, 2u);
    }
    uint64_t result = sub_244CC4E58(2u);
    if (result)
    {
      uint64_t v9 = 2;
      goto LABEL_10;
    }
  }
  *(unsigned char *)(a1 + 105) = 0;
  uint64_t v10 = *(void *)(a1 + 88);
  if (v10)
  {
    uint64_t v11 = *(void *)(v10 + 24);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, long long *))(v10 + 32);
    uint64_t v13 = *(void *)(a1 + 96);
    long long v14 = *(_OWORD *)a2;
    uint64_t v15 = *((void *)a2 + 2);
    return v12(v11, v13, &v14);
  }
  return result;
}

uint64_t sub_244E19264(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = sub_244CC8484(9u, "Controller");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_OWORD *)__n128 buf = *a3;
    uint64_t v12 = *((void *)a3 + 2);
    int v6 = sub_244CB7B34((const char **)buf, 1);
    *(_DWORD *)__n128 buf = 136315138;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "OnDeviceConnectionFailureFn: %s", buf, 0xCu);
  }
  if (sub_244CC4E58(2u))
  {
    *(_OWORD *)__n128 buf = *a3;
    uint64_t v12 = *((void *)a3 + 2);
    sub_244CB7B34((const char **)buf, 1);
    sub_244CC4DE0(9u, 2);
  }
  if (a1)
  {
    long long v9 = *a3;
    uint64_t v10 = *((void *)a3 + 2);
    return sub_244E190CC(a1, (int *)&v9);
  }
  else
  {
    long long v8 = sub_244CC8484(9u, "Controller");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_DEFAULT, "Device connected failure callback with null context. Ignoring", buf, 2u);
    }
    uint64_t result = sub_244CC4E58(2u);
    if (result) {
      return sub_244CC4DE0(9u, 2);
    }
  }
  return result;
}

uint64_t sub_244E19400(uint64_t result, uint64_t a2)
{
  *(void *)uint64_t result = a2;
  *(void *)(result + 8) = result + 8;
  *(void *)(result + 16) = result + 8;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = result;
  *(void *)(result + 40) = sub_244E18EDC;
  *(void *)(result + 48) = result + 48;
  *(void *)(result + 56) = result + 48;
  *(void *)(result + 64) = 0;
  *(void *)(result + 72) = result;
  *(void *)(result + 80) = sub_244E19264;
  *(_WORD *)(result + 104) = 0;
  *(void *)(result + 112) = result + 112;
  *(void *)(result + 120) = result + 112;
  *(void *)(result + 128) = 0;
  *(void *)(result + 136) = result;
  *(void *)(result + 144) = sub_244E1945C;
  return result;
}

uint64_t sub_244E1945C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void (**)(uint64_t))(result + 128);
    if (v2)
    {
      *(void *)(result + 128) = 0;
      v2(result + 112);
    }
    int v3 = *(void (**)(uint64_t))(v1 + 64);
    if (v3)
    {
      *(void *)(v1 + 64) = 0;
      v3(v1 + 48);
    }
    int v4 = *(void (**)(uint64_t))(v1 + 24);
    if (v4)
    {
      *(void *)(v1 + 24) = 0;
      v4(v1 + 8);
    }
    JUMPOUT(0x245695FA0);
  }
  return result;
}

void *sub_244E194E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t result = operator new(0x98uLL, MEMORY[0x263F8C180]);
  if (result)
  {
    int v7 = result;
    long long v8 = (char *)(result + 1);
    *uint64_t result = a1;
    result[1] = result + 1;
    result[2] = result + 1;
    result[3] = 0;
    long long v9 = (char *)(result + 6);
    result[4] = result;
    result[5] = sub_244E18EDC;
    result[6] = result + 6;
    result[7] = result + 6;
    result[8] = 0;
    result[9] = result;
    result[10] = sub_244E19264;
    *((unsigned char *)result + 104) = 0;
    uint64_t v10 = (char *)(result + 14);
    result[14] = result + 14;
    result[15] = result + 14;
    result[16] = 0;
    result[17] = result;
    result[18] = sub_244E1945C;
    a3[1] = 0;
    a3[2] = 0;
    *a3 = 0;
    result[11] = result + 14;
    result[12] = a2;
    *((unsigned char *)result + 105) = 1;
    uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, void *, void *, void))(*(void *)a1 + 40))(a1, a2, result + 1, result + 6, 0);
    if (*(_DWORD *)a3)
    {
      uint64_t v11 = (void (*)(char *))v7[16];
      if (v11)
      {
        uint8_t v7[16] = 0;
        v11(v10);
      }
      uint64_t v12 = (void (*)(char *))v7[8];
      if (v12)
      {
        v7[8] = 0;
        v12(v9);
      }
      uint64_t v13 = (void (*)(char *))v7[3];
      if (v13)
      {
        void v7[3] = 0;
        v13(v8);
      }
      JUMPOUT(0x245695FA0);
    }
  }
  else
  {
    *(_DWORD *)a3 = 11;
    a3[1] = "src/controller/CurrentFabricRemover.cpp";
    *((_DWORD *)a3 + 4) = 174;
  }
  return result;
}

void *sub_244E19680@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  void v23[4] = *MEMORY[0x263EF8340];
  uint64_t v16 = *(void *)(a1 + 8);
  sub_24479DD24(a1 + 16, (uint64_t)v20);
  uint64_t v17 = (uint64_t *)sub_2446F7170(v20);
  __int16 v18 = *(_WORD *)(a1 + 56);
  v23[0] = &unk_26F95DAC0;
  v23[1] = a2;
  v23[2] = a5;
  void v23[3] = v23;
  v22[0] = &unk_26F95DB50;
  v22[1] = a2;
  void v22[2] = a6;
  void v22[3] = v22;
  sub_244E197D8(v16, v17, v18, a3, a4, (uint64_t)v23, (uint64_t)v22, a7, a8);
  sub_244E17328(v22);
  uint64_t result = sub_244E1A9F4(v23);
  if (v20[0]) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v21 + 32))(v21);
  }
  return result;
}

uint64_t sub_244E197D8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>)
{
  v24[5] = *MEMORY[0x263EF8340];
  sub_244E15D64((uint64_t)v19, a2);
  sub_244E198EC(v20, a6);
  sub_244E15A18(v21, a7);
  v19[113] = a8;
  v18[0] = 0;
  sub_244E19960(a1, a3, a4, a5, (uint64_t)v19, v18, a9);
  sub_2447E6D14(v24);
  sub_244E16FB4(v23);
  sub_244E17038(v22);
  sub_244E17328(v21);
  sub_244E1A9F4(v20);
  return sub_244D87F44(v19);
}

void *sub_244E198EC(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  sub_244E19C38((uint64_t)v4, a2);
  sub_244E19CD0(v4, a1);
  sub_244E1A9F4(v4);
  return a1;
}

void sub_244E19960(uint64_t a1@<X0>, __int16 a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, unsigned char *a6@<X5>, uint64_t a7@<X8>)
{
  char v31[4] = *MEMORY[0x263EF8340];
  int v28 = a4;
  int v29 = a3;
  long long v14 = sub_244DBE094();
  __n128 v26 = (__n128)xmmword_2651A9F10;
  uint64_t v27 = 57;
  uint64_t v15 = sub_244CC4D84(0xCuLL);
  if (!v15)
  {
    *(_DWORD *)a7 = 11;
    *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
    *(_DWORD *)(a7 + 16) = 60;
    return;
  }
  uint64_t v16 = v15;
  _DWORD *v15 = a3;
  v15[1] = a4;
  *((_WORD *)v15 + 4) = a2;
  *((_WORD *)v15 + 5) = -1;
  *(void *)(a5 + 56) = v15;
  *(void *)(a5 + 64) = 1;
  if (*a6)
  {
    uint64_t v17 = sub_2446F12CC(a6);
    __int16 v18 = sub_244CC4D84(0x10uLL);
    if (!v18)
    {
      *(_DWORD *)a7 = 11;
      *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
      *(_DWORD *)(a7 + 16) = 67;
LABEL_22:
      j__free(v16);
      return;
    }
    int v19 = v18;
    int v20 = *(_DWORD *)v17;
    *__int16 v18 = a3;
    *((unsigned char *)v18 + 4) = 1;
    v18[2] = v20;
    *((_WORD *)v18 + 6) = a2;
    *(void *)(a5 + 72) = v18;
    *(void *)(a5 + 80) = 1;
  }
  else
  {
    int v19 = 0;
  }
  sub_2447E97A8((uint64_t)v31, a5 + 248);
  sub_2447E97A8((uint64_t)v30, (uint64_t)v31);
  uint64_t v21 = sub_244E19F38(&v29, &v28, a5 + 120, a5 + 152, (uint64_t)v30, a5 + 184, a5 + 216);
  if (!v21)
  {
    *(_DWORD *)a7 = 11;
    *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
    *(_DWORD *)(a7 + 16) = 83;
    goto LABEL_19;
  }
  uint64_t v22 = (uint64_t)v21;
  int v23 = (void (***)(void))sub_244CC4D84(0x160uLL);
  if (!v23)
  {
    *(_DWORD *)a7 = 11;
    *(void *)(a7 + 8) = "src/controller/ReadInteraction.h";
    *(_DWORD *)(a7 + 16) = 87;
LABEL_17:
    long long v25 = (void *)sub_244E1A330(v22);
    j__free(v25);
    goto LABEL_19;
  }
  uint64_t v24 = v23;
  if (*(unsigned char *)(sub_244DCD620(v23, v14, a1, v22 + 176, *(unsigned __int8 *)(a5 + 280)) + 80) == 1)
  {
    sub_244DD0EB4((uint64_t)v24, a5, &v26);
    int v19 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    sub_244DCE078((uint64_t)v24, a5, &v26);
  }
  *(__n128 *)a7 = v26;
  *(void *)(a7 + 16) = v27;
  if (*(_DWORD *)a7)
  {
    (**v24)(v24);
    j__free(v24);
    goto LABEL_17;
  }
  sub_244DF347C((void (****)(void))(v22 + 240), v24);
  *(__n128 *)a7 = v26;
  *(void *)(a7 + 16) = v27;
LABEL_19:
  sub_2447E6D14(v30);
  sub_2447E6D14(v31);
  if (v19) {
    j__free(v19);
  }
  if (v16) {
    goto LABEL_22;
  }
}

uint64_t sub_244E19C38(uint64_t a1, uint64_t a2)
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

void *sub_244E19CD0(void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    int v4 = (void *)result[3];
    int v5 = (void *)a2[3];
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
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
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

void *sub_244E19F38(int *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void v26[4] = *MEMORY[0x263EF8340];
  long long v14 = sub_244CC4D84(0x100uLL);
  if (v14)
  {
    int v15 = *a1;
    int v16 = *a2;
    sub_244E19C38((uint64_t)v26, a3);
    sub_244E160F0((uint64_t)v25, a4);
    sub_2447E97A8((uint64_t)v22, a5);
    uint64_t v17 = operator new(0x28uLL);
    __int16 v18 = v17;
    *uint64_t v17 = &unk_26F95D988;
    if (v23)
    {
      if (v23 == v22)
      {
        void v17[4] = v17 + 1;
        (*(void (**)(void *))(v22[0] + 24))(v22);
      }
      else
      {
        void v17[4] = v23;
        int v23 = 0;
      }
    }
    else
    {
      void v17[4] = 0;
    }
    void v24[3] = v18;
    sub_244E16888((uint64_t)v21, a6);
    sub_244E16920((uint64_t)v20, a7);
    sub_244E1A3D0((uint64_t)v14, v15, v16, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v21, (uint64_t)v20);
    sub_244E16FB4(v20);
    sub_244E17038(v21);
    sub_244E1A788(v24);
    sub_2447E6D14(v22);
    sub_244E17328(v25);
    sub_244E1A9F4(v26);
  }
  return v14;
}

void *sub_244E1A0F8(void *a1)
{
  *a1 = &unk_26F95D988;
  sub_2447E6D14(a1 + 1);
  return a1;
}

void sub_244E1A13C(void *a1)
{
  *a1 = &unk_26F95D988;
  sub_2447E6D14(a1 + 1);

  JUMPOUT(0x245695FA0);
}

void *sub_244E1A1A0(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  uint64_t v2 = operator new(0x28uLL);
  *uint64_t v2 = &unk_26F95D988;
  sub_2447E97A8((uint64_t)(v2 + 1), v1);
  return v2;
}

uint64_t sub_244E1A1F4(uint64_t a1, void *a2)
{
  *a2 = &unk_26F95D988;
  return sub_2447E97A8((uint64_t)(a2 + 1), a1 + 8);
}

void *sub_244E1A220(uint64_t a1)
{
  return sub_2447E6D14((void *)(a1 + 8));
}

void sub_244E1A228(void *a1)
{
  sub_2447E6D14(a1 + 1);

  operator delete(a1);
}

void sub_244E1A264(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_244E1A26C(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95D9F8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1A2AC()
{
  return &unk_26F95D9F8;
}

void sub_244E1A2B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 48))(v3);
  }
  if (v2)
  {
    int v4 = (void *)sub_244E1A330(v2);
    j__free(v4);
  }
}

uint64_t sub_244E1A330(uint64_t a1)
{
  uint64_t v2 = (void (****)(void))(a1 + 240);
  sub_244DF347C((void (****)(void))(a1 + 240), 0);
  sub_244DF347C(v2, 0);
  *(void *)(a1 + 176) = &unk_26F953058;
  int v4 = (void **)(a1 + 208);
  sub_244CAC658(&v4);
  sub_244E16FB4((void *)(a1 + 144));
  sub_244E17038((void *)(a1 + 112));
  sub_244E1A788((void *)(a1 + 80));
  sub_244E17328((void *)(a1 + 48));
  sub_244E1A9F4((void *)(a1 + 16));
  return a1;
}

uint64_t sub_244E1A3D0(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = &unk_26F95DA18;
  *(_DWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 12) = a3;
  sub_244E19C38(a1 + 16, a4);
  sub_244E160F0(a1 + 48, a5);
  sub_244E1A69C(a1 + 80, a6);
  sub_244E16888(a1 + 112, a7);
  sub_244E16920(a1 + 144, a8);
  *(void *)(a1 + 176) = &unk_26F953058;
  *(_WORD *)(a1 + 184) = 0;
  *(unsigned char *)(a1 + 186) = 0;
  *(unsigned char *)(a1 + 200) = 0;
  *(void *)(a1 + 188) = 0;
  *(_DWORD *)(a1 + 195) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 0;
  *(void *)(a1 + 224) = 0;
  *(void *)(a1 + 232) = a1;
  *(void *)(a1 + 240) = 0;
  *(unsigned char *)(a1 + 248) = 0;
  return a1;
}

void sub_244E1A4B4(uint64_t a1)
{
  sub_244E1A330(a1);

  JUMPOUT(0x245695FA0);
}

unsigned __int8 *sub_244E1A4EC(unsigned __int8 *result, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  int v5 = result;
  if (!result[248] || *(unsigned char *)(*((void *)result + 30) + 80))
  {
    result[248] = 1;
    char v9 = 0;
    if (*(unsigned __int8 *)(a2 + 14) >= 2u) {
      sub_244E2CBB8();
    }
    if (*a4)
    {
      uint64_t result = sub_244CCF6E8(a4, (uint64_t)&v8);
      if (!v8) {
        return result;
      }
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    if (*(_DWORD *)(a2 + 4) != *((_DWORD *)result + 2)) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    if (*(_DWORD *)(a2 + 8) != *((_DWORD *)result + 3)) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    if (!a3) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    sub_244CB3E8C(a3, &v9, (uint64_t)&v8);
    if (v8) {
      return (unsigned __int8 *)sub_244E16E64((uint64_t)(v5 + 48), a2);
    }
    uint64_t v6 = *((void *)v5 + 5);
    if (v6)
    {
      return (unsigned __int8 *)(*(uint64_t (**)(uint64_t, uint64_t, char *))(*(void *)v6 + 48))(v6, a2, &v9);
    }
    else
    {
      int v7 = sub_244E04700();
      return (unsigned __int8 *)sub_244E1A624(v7);
    }
  }
  return result;
}

void *sub_244E1A624(uint64_t a1)
{
  return sub_244E1A734(a1 + 80, a1);
}

void sub_244E1A630(uint64_t a1, void *a2)
{
  if (a2[8] != 1 || (uint64_t v3 = (void *)a2[7]) == 0) {
    sub_244E2CC60();
  }
  j__free(v3);
  if (a2[10] == 1)
  {
    int v4 = (void *)a2[9];
    if (v4)
    {
      j__free(v4);
    }
  }
}

uint64_t sub_244E1A69C(uint64_t a1, uint64_t a2)
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

void *sub_244E1A734(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2) {
    return (void *)(*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v5);
  }
  int v4 = sub_244E04700();
  return sub_244E1A788(v4);
}

void *sub_244E1A788(void *a1)
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

__n128 sub_244E1A80C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95DAC0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E1A858(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95DAC0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E1A888(uint64_t result, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3 = *(uint64_t (**)(void, void))(result + 16);
  if (v3) {
    return v3(*(void *)(result + 8), *a3);
  }
  return result;
}

uint64_t sub_244E1A8A0(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95DB30)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1A8E0()
{
  return &unk_26F95DB30;
}

__n128 sub_244E1A8EC(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95DB50;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E1A938(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95DB50;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E1A968(uint64_t result, uint64_t a2, long long *a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, long long *))(result + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(result + 8);
    long long v5 = *a3;
    uint64_t v6 = *((void *)a3 + 2);
    return v3(v4, &v5);
  }
  return result;
}

uint64_t sub_244E1A9A8(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95DBB0)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1A9E8()
{
  return &unk_26F95DBB0;
}

void *sub_244E1A9F4(void *a1)
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

void *sub_244E1AA78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unsigned __int8 *a6@<X5>, __n128 *a7@<X8>)
{
  void v21[4] = *MEMORY[0x263EF8340];
  uint64_t v14 = *(void *)(a1 + 8);
  sub_24479DD24(a1 + 16, (uint64_t)v18);
  int v15 = (uint64_t *)sub_2446F7170(v18);
  __int16 v16 = *(_WORD *)(a1 + 56);
  v21[0] = &unk_26F95DD10;
  v21[1] = a3;
  void v21[2] = a4;
  void v21[3] = v21;
  v20[0] = &unk_26F95DD90;
  v20[1] = a3;
  void v20[2] = a5;
  v20[3] = v20;
  sub_244E1ABC8(v14, v15, v16, a2, (uint64_t)v21, (uint64_t)v20, a6, a1 + 60, a7, 0);
  sub_2447E6794(v20);
  __n128 result = sub_244E08494(v21);
  if (v18[0]) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v19 + 32))(v19);
  }
  return result;
}

void sub_244E1ABC8(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned __int8 *a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, void *a10)
{
  void v37[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = *a2;
  if ((*(unsigned int (**)(uint64_t))(*(void *)*a2 + 16))(*a2) == 3
    || (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 4)
  {
    a9->n128_u32[0] = 47;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    int v20 = 62;
LABEL_4:
    a9[1].n128_u32[0] = v20;
    return;
  }
  v31[0] = a3;
  v31[1] = 0;
  uint64_t v32 = 0xA0000003ELL;
  char v33 = 1;
  uint64_t v21 = sub_244CC4D84(0x70uLL);
  if (!v21)
  {
    int v20 = 71;
    int v28 = 11;
LABEL_13:
    a9->n128_u32[0] = v28;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    goto LABEL_4;
  }
  uint64_t v22 = v21;
  sub_244E07D28((uint64_t)v37, a5);
  sub_2447EBBBC((uint64_t)v36, a6);
  v35[3] = 0;
  sub_244E07DC0((uint64_t)v22, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
  sub_2447E6FA8(v35);
  sub_2447E6794(v36);
  sub_244E08494(v37);
  v34[0] = &unk_26F95DBD0;
  v34[1] = v22;
  v34[3] = v34;
  sub_2447E5888(v22 + 9, (uint64_t)v34);
  sub_2447E6FA8(v34);
  int v23 = *a7;
  uint64_t v24 = (unsigned __int8 *)sub_244CC4D84(0x198uLL);
  if (!v24)
  {
    a9->n128_u32[0] = 11;
    a9->n128_u64[1] = (unint64_t)"src/controller/InvokeInteraction.h";
    a9[1].n128_u32[0] = 86;
    goto LABEL_15;
  }
  long long v25 = v24;
  __n128 v26 = (__n128 *)sub_244DBB440(v24, v22, a1, v23 != 0, 0, 0);
  a9->n128_u64[0] = 0;
  a9->n128_u64[1] = 0;
  a9[1].n128_u64[0] = 0;
  sub_244E1AEB8(v26, (uint64_t)v31, a4, (uint64_t)a7, a9);
  if (!a9->n128_u32[0])
  {
    a9->n128_u64[0] = 0;
    a9->n128_u64[1] = 0;
    a9[1].n128_u64[0] = 0;
    v29[0] = *(unsigned char *)a8;
    if (v29[0]) {
      int v30 = *(_DWORD *)(a8 + 4);
    }
    sub_244DBBC64(v25, a2, (uint64_t)v29, a9);
    if (!a9->n128_u32[0])
    {
      if (a10)
      {
        v37[0] = &unk_26F95DC90;
        v37[1] = v22;
        void v37[2] = v25;
        v37[3] = v37;
        sub_244E05388(v37, a10);
        sub_2447E6D14(v37);
      }
      int v28 = 0;
      int v20 = 109;
      goto LABEL_13;
    }
  }
  uint64_t v27 = (void *)sub_244DBB640(v25);
  j__free(v27);
LABEL_15:
  v37[0] = 0;
  sub_244E0826C((uint64_t)v37, v22);
}

void sub_244E1AEB8(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __n128 *a5@<X8>)
{
  v5[0] = *(unsigned char *)a4;
  if (v5[0]) {
    __int16 v6 = *(_WORD *)(a4 + 2);
  }
  char v7 = 0;
  v8[0] = &unk_26F95DC50;
  v8[1] = a3;
  sub_244DBD6B0(a1, a2, (uint64_t)v8, (uint64_t)v5, a5);
}

void *sub_244E1AF18(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26F95DBD0;
  result[1] = v3;
  return result;
}

uint64_t sub_244E1AF60(uint64_t result, void *a2)
{
  *a2 = &unk_26F95DBD0;
  a2[1] = *(void *)(result + 8);
  return result;
}

void sub_244E1AF90(uint64_t a1, void *a2)
{
}

uint64_t sub_244E1AF98(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95DC30)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1AFD8()
{
  return &unk_26F95DC30;
}

double sub_244E1AFE4@<D0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_2448096EC(a1, a2, a3);
}

__n128 sub_244E1AFEC(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95DC90;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E1B038(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95DC90;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_244E1B068(uint64_t a1)
{
}

uint64_t sub_244E1B070(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95DCF0)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1B0B0()
{
  return &unk_26F95DCF0;
}

__n128 sub_244E1B0BC(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95DD10;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E1B108(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95DD10;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E1B138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a4);
}

uint64_t sub_244E1B144(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95DD70)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1B184()
{
  return &unk_26F95DD70;
}

__n128 sub_244E1B190(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26F95DD90;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_244E1B1DC(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26F95DD90;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_244E1B20C(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(void, long long *))(a1 + 16))(*(void *)(a1 + 8), &v3);
}

uint64_t sub_244E1B244(uint64_t a1, uint64_t a2)
{
  if (sub_2447E82E4(a2, (uint64_t)&unk_26F95DDF0)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *sub_244E1B284()
{
  return &unk_26F95DDF0;
}

BOOL sub_244E1B290(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    sub_244E2CD08();
  }
  return *(unsigned char *)(v1 + 2642) != 0;
}

uint64_t sub_244E1B2BC()
{
  v0 = *(uint64_t (**)(void))(*sub_244DB1018() + 72);

  return v0();
}

unsigned char *sub_244E1B32C@<X0>(unsigned char *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  long long v3 = result;
  int v5 = *a2;
  if (!*a2)
  {
    result[40] = 0;
LABEL_7:
    int v7 = 145;
    goto LABEL_8;
  }
  __n128 result = sub_2446D1880(a2);
  if (*(unsigned __int16 *)result <= 0xFFFu)
  {
    int v5 = *a2;
    v3[40] = v5;
    if (v5)
    {
      int v5 = 0;
      *((_WORD *)v3 + 21) = *((_WORD *)a2 + 1);
    }
    goto LABEL_7;
  }
  int v7 = 142;
  int v5 = 47;
LABEL_8:
  *(_DWORD *)a3 = v5;
  *(void *)(a3 + 8) = "src/app/server/Dnssd.cpp";
  *(_DWORD *)(a3 + 16) = v7;
  return result;
}

char *sub_244E1B3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v6 = sub_244D6A5F4();
  __n128 result = (char *)((char *(*)(uint8_t *__return_ptr))**v6)(v12);
  if (*(_DWORD *)v12)
  {
    uint64_t v8 = 0;
    char v9 = (char *)(a1 + 8);
    while (!v9[v8])
    {
      if (++v8 == 6)
      {
        uint64_t v10 = sub_244CC8484(0x22u, "Discovery");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "Failed to get primary mac address of device. Generating a random one.", v12, 2u);
        }
        if (sub_244CC4E58(1u)) {
          sub_244CC4DE0(0x22u, 1);
        }
        __n128 result = sub_244CECD5C(v9, 6uLL, (uint64_t)v12);
        break;
      }
    }
    if (a3 != 6) {
      sub_244E2CDB0();
    }
    int v11 = *(_DWORD *)v9;
    *(_WORD *)(a2 + 4) = *((_WORD *)v9 + 2);
    *(_DWORD *)a2 = v11;
  }
  return result;
}

uint64_t sub_244E1B4E0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(result + 16);
  if (!v3)
  {
    *(_DWORD *)a2 = 3;
    *(void *)(a2 + 8) = "src/app/server/Dnssd.cpp";
    int v19 = 191;
    goto LABEL_33;
  }
  uint64_t v4 = result;
  __n128 result = (uint64_t)sub_2446D8144(*(void **)(result + 16), (uint64_t)v24);
  if (v25 == v26 || (v26 == 16 ? (v5 = v25 == 16) : (v5 = 0), v5 ? (BOOL v6 = v24[0] == v3) : (BOOL v6 = 0), v6))
  {
LABEL_31:
    *(_DWORD *)a2 = 0;
    *(void *)(a2 + 8) = "src/app/server/Dnssd.cpp";
    int v19 = 228;
LABEL_33:
    *(_DWORD *)(a2 + 16) = v19;
    return result;
  }
LABEL_10:
  __n128 result = sub_2446D26A0(v24);
  if (!*(unsigned char *)(result + 141)) {
    goto LABEL_22;
  }
  int v7 = (void *)result;
  sub_244E1B3BC(v4, (uint64_t)v23, 6);
  memset(__dst, 0, sizeof(__dst));
  uint64_t v8 = v7[2];
  *(void *)&long long v28 = *v7;
  *((void *)&v28 + 1) = v8;
  sub_2446C1098(&v21, (uint64_t)v23, 6);
  if (v22 >= 8) {
    size_t v9 = 8;
  }
  else {
    size_t v9 = v22;
  }
  *(void *)&__dst[15] = v9;
  memcpy(__dst, v21, v9);
  __int16 v10 = *(_WORD *)(v4 + 32);
  int v11 = *(_DWORD *)(v4 + 36);
  sub_244D6A044((uint64_t)v20);
  if (v20[0])
  {
    uint64_t v12 = sub_2446DC5A0(v20);
    uint64_t v13 = *(void *)v12;
    int v14 = *((_DWORD *)v12 + 2);
    uint64_t v15 = 0x100000000;
  }
  else
  {
    int v14 = 0;
    uint64_t v15 = 0;
    uint64_t v13 = 0;
  }
  *(void *)&__dst[23] = v13;
  __dst[35] = BYTE4(v15);
  *(_DWORD *)&__dst[31] = v15 | v14;
  v29[0] = v10;
  int v30 = v11;
  char v31 = 1;
  *(_OWORD *)&v33[10] = *(_OWORD *)&__dst[26];
  long long v32 = *(_OWORD *)__dst;
  *(_OWORD *)char v33 = *(_OWORD *)&__dst[16];
  long long v34 = v28;
  *(_WORD *)&v33[23] = 6;
  __int16 v16 = sub_244DB1018();
  uint64_t v17 = sub_244CC8484(0x22u, "Discovery");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__dst = 67109888;
    *(_DWORD *)&__dst[4] = HIDWORD(v34);
    *(_WORD *)&__dst[8] = 1024;
    *(_DWORD *)&__dst[10] = DWORD2(v34);
    *(_WORD *)&__dst[14] = 1024;
    *(_DWORD *)&__dst[16] = DWORD1(v34);
    *(_WORD *)&__dst[20] = 1024;
    *(_DWORD *)&__dst[22] = v34;
    _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_DEFAULT, "Advertise operational node %08X%08X-%08X%08X", __dst, 0x1Au);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0x22u, 2);
  }
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  __n128 result = (*(uint64_t (**)(uint64_t *, _WORD *))(*v16 + 48))(v16, v29);
  if (!*(_DWORD *)a2)
  {
LABEL_22:
    unint64_t v18 = v25;
    while (1)
    {
      if (v18 < v26) {
        uint64_t v25 = ++v18;
      }
      if (v18 == v26) {
        goto LABEL_31;
      }
      if (*(unsigned char *)(v24[0] + 152 * v18 + 137)
        && (unint64_t)(*(void *)(v24[0] + 152 * v18) - 1) < 0xFFFFFFEFFFFFFFFFLL)
      {
        if (v26 != 16 || v18 != 16 || v24[0] != v3) {
          goto LABEL_10;
        }
        goto LABEL_31;
      }
    }
  }
  return result;
}

uint64_t sub_244E1B818@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, void *a4@<X8>)
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  memset(&v62[8], 0, 7);
  *(void *)&v64[1] = 0;
  *(_DWORD *)&v64[8] = 0;
  *(_DWORD *)__n128 buf = 0;
  buf[10] = 0;
  *(_WORD *)((char *)&v72 + 1) = 0;
  HIBYTE(v72) = 0;
  __int16 v74 = 0;
  char v75 = 0;
  memset(v78, 0, sizeof(v78));
  *(_WORD *)v79 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  memset(v85, 0, 21);
  LOBYTE(v87) = 0;
  memset(v86, 0, sizeof(v86));
  *(_DWORD *)&buf[3] = 0;
  *(_DWORD *)&buf[6] = 0;
  uint64_t v7 = 34;
  if (a2) {
    uint64_t v7 = 32;
  }
  int v8 = *(_DWORD *)(a1 + 36);
  v59[0] = *(_WORD *)(a1 + v7);
  int v60 = v8;
  char v61 = 1;
  *(void *)int v62 = 0;
  size_t v63 = 0;
  v64[0] = 0;
  char v65 = 0;
  __int16 v67 = *(_WORD *)&buf[4];
  int v66 = *(_DWORD *)buf;
  int v68 = 0;
  uint8_t v69 = buf[10];
  LOBYTE(v72) = 0;
  uint64_t v71 = 0;
  char v73 = 0;
  __int16 v76 = 0;
  char v77 = 0;
  v79[2] = 0;
  v85[21] = 0;
  *(_WORD *)((char *)&v87 + 1) = 0;
  HIBYTE(v87) = 0;
  HIBYTE(v68) = a2 ^ 1;
  int v70 = a3;
  sub_244E1B3BC(a1, (uint64_t)v44, 6);
  sub_2446C1098(&v42, (uint64_t)v44, 6);
  if (v43 >= 8) {
    size_t v9 = 8;
  }
  else {
    size_t v9 = v43;
  }
  size_t v63 = v9;
  memcpy(v62, v42, v9);
  __int16 v41 = 0;
  int v40 = 0;
  uint64_t v10 = sub_244D6A1B4();
  (*(void (**)(uint8_t *__return_ptr))(*(void *)v10 + 24))(buf);
  if (*(_DWORD *)buf)
  {
    int v11 = sub_244CC8484(0x22u, "Discovery");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_INFO, "Vendor ID not known", buf, 2u);
    }
    if (sub_244CC4E58(3u)) {
      sub_244CC4DE0(0x22u, 3);
    }
  }
  else
  {
    BYTE2(v71) = 1;
    LOWORD(v71) = v41;
  }
  uint64_t v12 = sub_244D6A1B4();
  (*(void (**)(uint8_t *__return_ptr))(*(void *)v12 + 40))(buf);
  if (*(_DWORD *)buf)
  {
    uint64_t v13 = sub_244CC8484(0x22u, "Discovery");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_INFO, "Product ID not known", buf, 2u);
    }
    if (sub_244CC4E58(3u)) {
      sub_244CC4DE0(0x22u, 3);
    }
  }
  else
  {
    BYTE6(v71) = 1;
    WORD2(v71) = v41;
  }
  int v14 = sub_244D6A5F4();
  if (((unsigned int (*)(uint64_t (***)()))(*v14)[30])(v14))
  {
    uint64_t v15 = sub_244D6A5F4();
    ((void (*)(uint8_t *__return_ptr))(*v15)[31])(buf);
    if (!*(_DWORD *)buf)
    {
      char v73 = 1;
      int v72 = v40;
    }
  }
  __int16 v16 = sub_244D6A5F4();
  if (((unsigned int (*)(uint64_t (***)()))(*v16)[32])(v16))
  {
    uint64_t v17 = sub_244D6A5F4();
    ((void (*)(uint8_t *__return_ptr))(*v17)[33])(buf);
    if (!*(_DWORD *)buf)
    {
      strncpy(&v78[1], __src, 0x21uLL);
      *(_WORD *)&v79[1] = 256;
    }
  }
  sub_244D6A044((uint64_t)buf);
  if (buf[0])
  {
    unint64_t v18 = sub_2446DC5A0(buf);
    uint64_t v19 = *(void *)v18;
    int v20 = *((_DWORD *)v18 + 2);
    uint64_t v21 = 0x100000000;
  }
  else
  {
    int v20 = 0;
    uint64_t v21 = 0;
    uint64_t v19 = 0;
  }
  *(void *)uint64_t v64 = v19;
  char v65 = BYTE4(v21);
  *(_DWORD *)&v64[8] = v21 | v20;
  if (!a2) {
    goto LABEL_59;
  }
  __int16 v39 = 0;
  a4[1] = 0;
  a4[2] = 0;
  *a4 = 0;
  uint64_t v22 = sub_244D6A180();
  (*(void (**)(uint64_t, __int16 *))(*(void *)v22 + 16))(v22, &v39);
  if (*(_DWORD *)a4)
  {
    int v23 = sub_244CC8484(0x22u, "Discovery");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)__n128 buf = *(_OWORD *)a4;
      uint64_t v58 = a4[2];
      uint64_t v24 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl(&dword_2446BD000, v23, OS_LOG_TYPE_ERROR, "Setup discriminator read error (%s)! Critical error, will not be commissionable.", buf, 0xCu);
    }
    uint64_t result = sub_244CC4E58(1u);
    if (result)
    {
      *(_OWORD *)__n128 buf = *(_OWORD *)a4;
      uint64_t v58 = a4[2];
      sub_244CB7B34((const char **)buf, 1);
      return sub_244CC4DE0(0x22u, 1);
    }
    return result;
  }
  if (*(unsigned char *)(a1 + 40)) {
    unint64_t v26 = (__int16 *)sub_2446D1880((unsigned char *)(a1 + 40));
  }
  else {
    unint64_t v26 = &v39;
  }
  __int16 v39 = *v26;
  LOBYTE(v68) = HIBYTE(v39) & 0xF;
  *(_WORD *)((char *)&v68 + 1) = v39;
  if (sub_244E1B290(a1))
  {
    uint64_t v27 = sub_244D6A5F4();
    ((void (*)(uint8_t *__return_ptr))(*v27)[36])(buf);
    if (*(_DWORD *)buf)
    {
      long long v28 = sub_244CC8484(0x22u, "Discovery");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__n128 buf = 0;
        _os_log_impl(&dword_2446BD000, v28, OS_LOG_TYPE_INFO, "DNS-SD Pairing Hint not set", buf, 2u);
      }
      if (sub_244CC4E58(3u)) {
        sub_244CC4DE0(0x22u, 3);
      }
    }
    else
    {
      char v77 = 1;
      __int16 v76 = v41;
    }
    char v31 = sub_244D6A5F4();
    ((void (*)(uint64_t *__return_ptr))(*v31)[37])(&v45);
    if (v45)
    {
      long long v32 = sub_244CC8484(0x22u, "Discovery");
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
        goto LABEL_56;
      }
      LOWORD(v45) = 0;
      goto LABEL_55;
    }
  }
  else
  {
    int v29 = sub_244D6A5F4();
    ((void (*)(uint8_t *__return_ptr))(*v29)[34])(buf);
    if (*(_DWORD *)buf)
    {
      int v30 = sub_244CC8484(0x22u, "Discovery");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__n128 buf = 0;
        _os_log_impl(&dword_2446BD000, v30, OS_LOG_TYPE_INFO, "DNS-SD Pairing Hint not set", buf, 2u);
      }
      if (sub_244CC4E58(3u)) {
        sub_244CC4DE0(0x22u, 3);
      }
    }
    else
    {
      char v77 = 1;
      __int16 v76 = v41;
    }
    char v33 = sub_244D6A5F4();
    ((void (*)(uint64_t *__return_ptr))(*v33)[35])(&v45);
    if (v45)
    {
      long long v32 = sub_244CC8484(0x22u, "Discovery");
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
        goto LABEL_56;
      }
      LOWORD(v45) = 0;
LABEL_55:
      _os_log_impl(&dword_2446BD000, v32, OS_LOG_TYPE_INFO, "DNS-SD Pairing Instruction not set", (uint8_t *)&v45, 2u);
LABEL_56:
      if (sub_244CC4E58(3u)) {
        sub_244CC4DE0(0x22u, 3);
      }
      goto LABEL_59;
    }
  }
  strncpy(v86, (const char *)buf, 0x81uLL);
  LOWORD(v87) = 256;
LABEL_59:
  long long v34 = sub_244DB1018();
  uint64_t v35 = sub_244CC8484(0x22u, "Discovery");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    if ((v71 & 0xFF0000) != 0) {
      int v36 = (unsigned __int16)v71;
    }
    else {
      int v36 = 0;
    }
    if ((v71 & 0xFF000000000000) != 0) {
      int v37 = WORD2(v71);
    }
    else {
      int v37 = 0;
    }
    char v38 = BYTE2(v87);
    if (HIWORD(v87) <= 0x100u) {
      char v38 = 0;
    }
    LODWORD(v45) = 67110400;
    HIDWORD(v45) = v36;
    __int16 v46 = 1024;
    int v47 = v37;
    __int16 v48 = 1024;
    int v49 = *(unsigned __int16 *)((char *)&v68 + 1);
    __int16 v50 = 1024;
    int v51 = v68;
    __int16 v52 = 1024;
    int v53 = v70;
    __int16 v54 = 1024;
    BOOL v55 = v38 != 0;
    _os_log_impl(&dword_2446BD000, v35, OS_LOG_TYPE_DEFAULT, "Advertise commission parameter vendorID=%u productID=%u discriminator=%04u/%02u cm=%u cp=%u", (uint8_t *)&v45, 0x26u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0x22u, 2);
  }
  return (*(uint64_t (**)(uint64_t *, _WORD *))(*v34 + 56))(v34, v59);
}

uint64_t sub_244E1C1F0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_244E1B818(a1, 0, 0, a2);
}

uint64_t sub_244E1C1FC@<X0>(uint64_t a1@<X0>, int a2@<W1>, void *a3@<X8>)
{
  return sub_244E1B818(a1, 1, a2, a3);
}

uint64_t sub_244E1C208(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (****)(void))(a1 + 24);
  if (v2) {
    int v3 = (**v2)(v2);
  }
  else {
    int v3 = 0;
  }

  return sub_244E1C274(a1, v3);
}

uint64_t sub_244E1C274(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_244CC8484(0x22u, "Discovery");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__n128 buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a2;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Updating services using commissioning mode %d", buf, 8u);
  }
  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0x22u, 2);
  }
  if (qword_26B0D43B0 != -1) {
    dispatch_once_f(&qword_26B0D43B0, &byte_26B0D4370, (dispatch_function_t)sub_2446D7DB8);
  }
  sub_244D77228(&qword_26B0D4380, (uint64_t)sub_244E1CA1C, 0, (uint64_t)buf);
  long long v20 = 0uLL;
  uint64_t v21 = 0;
  BOOL v5 = sub_244DB1018();
  BOOL v6 = sub_244D6C5A4();
  (*(void (**)(long long *__return_ptr, uint64_t *, uint64_t *))(*v5 + 16))(&v20, v5, v6);
  if (v20)
  {
    uint64_t v7 = sub_244CC8484(0x22u, "Discovery");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)__n128 buf = v20;
      uint64_t v23 = v21;
      int v8 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "Failed to initialize advertiser: %s", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      *(_OWORD *)__n128 buf = v20;
      uint64_t v23 = v21;
      sub_244CB7B34((const char **)buf, 1);
      sub_244CC4DE0(0x22u, 1);
    }
  }
  size_t v9 = sub_244DB1018();
  (*(void (**)(uint8_t *__return_ptr))(*v9 + 40))(buf);
  long long v20 = *(_OWORD *)buf;
  uint64_t v21 = v23;
  if (*(_DWORD *)buf)
  {
    uint64_t v10 = sub_244CC8484(0x22u, "Discovery");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)__n128 buf = v20;
      uint64_t v23 = v21;
      int v11 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "Failed to remove advertised services: %s", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      *(_OWORD *)__n128 buf = v20;
      uint64_t v23 = v21;
      sub_244CB7B34((const char **)buf, 1);
      sub_244CC4DE0(0x22u, 1);
    }
  }
  sub_244E1B4E0(a1, (uint64_t)buf);
  long long v20 = *(_OWORD *)buf;
  uint64_t v21 = v23;
  if (*(_DWORD *)buf)
  {
    uint64_t v12 = sub_244CC8484(0x22u, "Discovery");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)__n128 buf = v20;
      uint64_t v23 = v21;
      uint64_t v13 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "Failed to advertise operational node: %s", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      *(_OWORD *)__n128 buf = v20;
      uint64_t v23 = v21;
      sub_244CB7B34((const char **)buf, 1);
      sub_244CC4DE0(0x22u, 1);
    }
  }
  if (a2)
  {
    sub_244E1B818(a1, 1, a2, buf);
    long long v20 = *(_OWORD *)buf;
    uint64_t v21 = v23;
    if (*(_DWORD *)buf)
    {
      int v14 = sub_244CC8484(0x22u, "Discovery");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_OWORD *)__n128 buf = v20;
        uint64_t v23 = v21;
        uint64_t v15 = sub_244CB7B34((const char **)buf, 1);
        *(_DWORD *)__n128 buf = 136315138;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "Failed to advertise commissionable node: %s", buf, 0xCu);
      }
      if (sub_244CC4E58(1u))
      {
        *(_OWORD *)__n128 buf = v20;
        uint64_t v23 = v21;
        sub_244CB7B34((const char **)buf, 1);
        sub_244CC4DE0(0x22u, 1);
      }
    }
  }
  __int16 v16 = sub_244DB1018();
  uint64_t result = (uint64_t)(*(void *(**)(uint8_t *__return_ptr))(*v16 + 64))(buf);
  long long v20 = *(_OWORD *)buf;
  uint64_t v21 = v23;
  if (*(_DWORD *)buf)
  {
    unint64_t v18 = sub_244CC8484(0x22u, "Discovery");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)__n128 buf = v20;
      uint64_t v23 = v21;
      uint64_t v19 = sub_244CB7B34((const char **)buf, 1);
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_ERROR, "Failed to finalize service update: %s", buf, 0xCu);
    }
    uint64_t result = sub_244CC4E58(1u);
    if (result)
    {
      *(_OWORD *)__n128 buf = v20;
      uint64_t v23 = v21;
      sub_244CB7B34((const char **)buf, 1);
      return sub_244CC4DE0(0x22u, 1);
    }
  }
  return result;
}

uint64_t sub_244E1C838(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(void *)(a1 + 16) = 0;
  if (qword_26B0D43B0 != -1) {
    dispatch_once_f(&qword_26B0D43B0, &byte_26B0D4370, (dispatch_function_t)sub_2446D7DB8);
  }
  sub_244D772D8((void **)&qword_26B0D4380, (uint64_t)sub_244E1CA1C, 0);
  uint64_t v1 = sub_244DB1018();
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*v1 + 24))(v1);
  if (result)
  {
    long long v7 = 0uLL;
    uint64_t v8 = 0;
    int v3 = sub_244DB1018();
    (*(void (**)(long long *__return_ptr))(*v3 + 40))(&v7);
    if (v7)
    {
      uint64_t v4 = sub_244CC8484(0x22u, "Discovery");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_OWORD *)__n128 buf = v7;
        uint64_t v10 = v8;
        BOOL v5 = sub_244CB7B34((const char **)buf, 1);
        *(_DWORD *)__n128 buf = 136315138;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_ERROR, "Failed to remove advertised services: %s", buf, 0xCu);
      }
      if (sub_244CC4E58(1u))
      {
        *(_OWORD *)__n128 buf = v7;
        uint64_t v10 = v8;
        sub_244CB7B34((const char **)buf, 1);
        sub_244CC4DE0(0x22u, 1);
      }
    }
    BOOL v6 = sub_244DB1018();
    return (*(uint64_t (**)(uint64_t *))(*v6 + 32))(v6);
  }
  return result;
}

_WORD *sub_244E1CA1C(_WORD *result)
{
  if ((*result & 0xFFFE) == 0x8012)
  {
    uint64_t v1 = sub_2446D634C();
    return (_WORD *)sub_244E1C208((uint64_t)v1);
  }
  return result;
}

void *sub_244E1CA64(void *result)
{
  *uint64_t result = &unk_26F95DE10;
  return result;
}

void sub_244E1CA84(void *a1)
{
  *a1 = &unk_26F95DE10;
  JUMPOUT(0x245695FA0);
}

uint64_t sub_244E1CAB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v24[0] = 0;
  v26[0] = 0;
  v20[0] = 0;
  v22[0] = 0;
  int v34 = *(_DWORD *)(a2 + 96);
  uint64_t v35 = 0xFFFF0000FFFFLL;
  __int16 v36 = -1;
  v37[1] = 0;
  v37[0] = 0;
  int v38 = 0;
  unint64_t v5 = *(void *)(a2 + 8);
  if (!v5 || !*(void *)(a2 + 24) || !*(void *)(a2 + 40) || !*(void *)(a2 + 56) || !*(void *)(a2 + 72))
  {
    uint64_t v6 = 800;
    return (*(uint64_t (**)(void, uint64_t, uint64_t))(a3 + 32))(*(void *)(a3 + 24), a2, v6);
  }
  uint64_t v6 = 800;
  if (v5 <= 0x384 && a3 && *(void *)(a2 + 88))
  {
    sub_244CF0514(a2 + 64, v24, (uint64_t)buf);
    if (*(_DWORD *)buf)
    {
      uint64_t v6 = 303;
      return (*(uint64_t (**)(void, uint64_t, uint64_t))(a3 + 32))(*(void *)(a3 + 24), a2, v6);
    }
    sub_244CF0514(a2 + 48, v20, (uint64_t)buf);
    if (*(_DWORD *)buf)
    {
LABEL_14:
      uint64_t v6 = 203;
      return (*(uint64_t (**)(void, uint64_t, uint64_t))(a3 + 32))(*(void *)(a3 + 24), a2, v6);
    }
    uint64_t v6 = 305;
    if (v20[0])
    {
      if (v20[0] == v24[0] && v21 == v25)
      {
        if (!v26[0] || v22[0] && v23 != v27)
        {
          uint64_t v6 = 306;
          return (*(uint64_t (**)(void, uint64_t, uint64_t))(a3 + 32))(*(void *)(a3 + 24), a2, v6);
        }
        *(void *)__n128 buf = &unk_26F954540;
        uint64_t v33 = 0;
        sub_244CEF4D0((uint64_t *)(a2 + 64), (uint64_t)buf, (uint64_t)&v19);
        if (v19)
        {
          uint64_t v6 = 303;
LABEL_28:
          sub_244CED784(__dst, 64);
          return (*(uint64_t (**)(void, uint64_t, uint64_t))(a3 + 32))(*(void *)(a3 + 24), a2, v6);
        }
        size_t v9 = *(void *)(a2 + 40);
        if (v9 > 0x40)
        {
          uint64_t v6 = 503;
          goto LABEL_28;
        }
        uint64_t v33 = *(void *)(a2 + 40);
        memcpy(__dst, *(const void **)(a2 + 32), v9);
        sub_244DB0C80((uint64_t)buf, a2, a2 + 16, (uint64_t)__dst, &v19);
        if (v19)
        {
          uint64_t v6 = 500;
          goto LABEL_28;
        }
        sub_244CED784(__dst, 64);
        __dst[0] = (uint64_t)v37;
        __dst[1] = 20;
        sub_244CEFE08((uint64_t *)(a2 + 48), __dst, (uint64_t)buf);
        if (*(_DWORD *)buf) {
          goto LABEL_14;
        }
        uint64_t v10 = sub_244CC8484(0x1Bu, "Support");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__n128 buf = 0;
          _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "PartialDACVerifier::CheckPAA skipping vid-scoped PAA check - PAARootStore disabled", buf, 2u);
        }
        if (sub_244CC4E58(2u)) {
          sub_244CC4DE0(0x1Bu, 2);
        }
        sub_244CEFBC8((uint64_t *)(a2 + 64), (uint64_t)buf);
        if (*(_DWORD *)buf)
        {
          uint64_t v6 = 300;
        }
        else
        {
          uint64_t v11 = sub_244CC8484(0x1Bu, "Support");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__n128 buf = 0;
            _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_DEFAULT, "PartialDACVerifier::CheckCertChain skipping cert chain check - PAARootStore disabled", buf, 2u);
          }
          if (sub_244CC4E58(2u)) {
            sub_244CC4DE0(0x1Bu, 2);
          }
          long long v19 = 0uLL;
          long long __s1 = 0uLL;
          int v17 = 0;
          v16[0] = 0;
          v16[1] = 0;
          uint64_t v29 = 0;
          v30[0] = 0;
          *(_DWORD *)((char *)v30 + 7) = 0;
          sub_244CB3988((uint64_t)v31);
          unsigned char v31[18] = 21;
          long long v15 = 0uLL;
          LOWORD(v35) = *(_WORD *)sub_2447A4DF0(v24);
          WORD1(v35) = *(_WORD *)sub_2447A4DF0(v26);
          WORD2(v35) = *(_WORD *)sub_2447A4DF0(v20);
          __int16 v12 = v22[0];
          if (v22[0]) {
            __int16 v12 = *(_WORD *)sub_2446D1880(v22);
          }
          HIWORD(v35) = v12;
          __int16 v36 = -1;
          uint64_t v13 = sub_244CC8484(0x1Bu, "Support");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(__dst[0]) = 0;
            _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_DEFAULT, "PartialDACVerifier::VerifyAttestationInformation skipping PAA subject key id extraction - PAARootStore disabled", (uint8_t *)__dst, 2u);
          }
          if (sub_244CC4E58(2u)) {
            sub_244CC4DE0(0x1Bu, 2);
          }
          sub_244D9C03C(a2, &v19, &__s1, &v17, (uint64_t)v16, (uint64_t)buf, (uint64_t)__dst);
          if (LODWORD(__dst[0]))
          {
            uint64_t v6 = 501;
          }
          else if (*((void *)&__s1 + 1) == *(void *)(a2 + 88) {
                 && (!*((void *)&__s1 + 1)
          }
                  || !memcmp((const void *)__s1, *(const void **)(a2 + 80), *((size_t *)&__s1 + 1))))
          {
            int v14 = sub_244CC8484(0x1Bu, "Support");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(__dst[0]) = 0;
              _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_DEFAULT, "PartialDACVerifier::VerifyAttestationInformation skipping CD signature check - LocalCSAStore disabled", (uint8_t *)__dst, 2u);
            }
            if (sub_244CC4E58(2u)) {
              sub_244CC4DE0(0x1Bu, 2);
            }
            sub_244D9BC0C((uint64_t *)&v19, &v15, __dst);
            if (LODWORD(__dst[0])) {
              uint64_t v6 = 105;
            }
            else {
              uint64_t v6 = (*(uint64_t (**)(uint64_t, long long *, void *, int *))(*(void *)a1 + 32))(a1, &v15, v16, &v34);
            }
          }
          else
          {
            uint64_t v6 = 502;
          }
        }
      }
    }
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(a3 + 32))(*(void *)(a3 + 24), a2, v6);
}

void sub_244E1D020()
{
}

uint64_t sub_244E1D034(uint64_t a1)
{
  return a1 + 16;
}

void sub_244E1D03C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  v33[0] = 0;
  v35[0] = 0;
  v29[0] = 0;
  v31[0] = 0;
  v26[0] = 0;
  char v28 = 0;
  unint64_t v5 = *(void *)(a2 + 8);
  if (!v5 || !*(void *)(a2 + 24) || !*(void *)(a2 + 40) || !*(void *)(a2 + 72))
  {
    uint64_t v6 = 0;
    uint64_t v7 = 800;
    goto LABEL_12;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 800;
  if (v5 > 0x384 || !a3 || !*(void *)(a2 + 88)) {
    goto LABEL_12;
  }
  if (!*(void *)(a2 + 56))
  {
    uint64_t v6 = 0;
    uint64_t v7 = 207;
    goto LABEL_12;
  }
  sub_244CEF084((uint64_t *)(a2 + 48), 1, (uint64_t)v39);
  if (LODWORD(v39[0]))
  {
LABEL_10:
    uint64_t v6 = 0;
    uint64_t v7 = 203;
    goto LABEL_12;
  }
  sub_244CEF084((uint64_t *)(a2 + 64), 2, (uint64_t)v39);
  if (LODWORD(v39[0]) || (sub_244CF0514(a2 + 64, v33, (uint64_t)v39), LODWORD(v39[0])))
  {
    uint64_t v6 = 0;
    uint64_t v7 = 303;
    goto LABEL_12;
  }
  sub_244CF0514(a2 + 48, v29, (uint64_t)v39);
  if (LODWORD(v39[0])) {
    goto LABEL_10;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 305;
  if (!v29[0] || v29[0] != v33[0]) {
    goto LABEL_12;
  }
  if (v30 != v34)
  {
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  if (!v35[0] || v31[0] && v32 != v36)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 306;
    goto LABEL_12;
  }
  v39[0] = &unk_26F954540;
  uint64_t v50 = 0;
  sub_244CEF4D0((uint64_t *)(a2 + 64), (uint64_t)v39, (uint64_t)&p_dst);
  if (p_dst)
  {
    uint64_t v9 = 303;
LABEL_34:
    sub_244CED784(&__dst, 64);
    uint64_t v6 = 0;
    uint64_t v7 = v9;
    goto LABEL_12;
  }
  size_t v10 = *(void *)(a2 + 40);
  if (v10 > 0x40)
  {
    uint64_t v9 = 503;
    goto LABEL_34;
  }
  uint64_t v50 = *(void *)(a2 + 40);
  memcpy(&__dst, *(const void **)(a2 + 32), v10);
  sub_244DB0C80((uint64_t)v39, a2, a2 + 16, (uint64_t)&__dst, &p_dst);
  if (p_dst)
  {
    uint64_t v9 = 500;
    goto LABEL_34;
  }
  sub_244CED784(&__dst, 64);
  p_dst = &__dst;
  uint64_t v25 = 20;
  sub_244CEFE08((uint64_t *)(a2 + 48), (uint64_t *)&p_dst, (uint64_t)v39);
  if (LODWORD(v39[0])) {
    goto LABEL_10;
  }
  uint64_t v6 = sub_244CC4D84(0x258uLL);
  if (!v6)
  {
    uint64_t v7 = 700;
    goto LABEL_12;
  }
  sub_24479476C(&v37, (uint64_t)v6, 600);
  uint64_t v11 = a1[79];
  sub_2446C1098(&v23, (uint64_t)p_dst, v25);
  (*(void (**)(void *__return_ptr, uint64_t, long long *, uint64_t *))(*(void *)v11 + 16))(v39, v11, &v23, &v37);
  if (LODWORD(v39[0]))
  {
    if (LODWORD(v39[0]) != 45
      || (sub_244E1E408(),
          sub_2446C1098(&v23, (uint64_t)p_dst, v25),
          sub_244E1D628((uint64_t)&qword_268EC31D8, (uint64_t)&v23, (uint64_t)&v37, (uint64_t)v39),
          LODWORD(v39[0])))
    {
      uint64_t v7 = 101;
      goto LABEL_12;
    }
  }
  sub_2446C1098(&v23, v37, v38);
  sub_244CF0514((uint64_t)&v23, v26, (uint64_t)v39);
  if (LODWORD(v39[0])) {
    goto LABEL_43;
  }
  if (!v26[0] || v26[0] == v29[0] && v27 == v30)
  {
    if (v28)
    {
LABEL_43:
      uint64_t v7 = 105;
      goto LABEL_12;
    }
    sub_244CEFBC8((uint64_t *)(a2 + 64), (uint64_t)v39);
    if (LODWORD(v39[0]))
    {
      uint64_t v7 = 300;
    }
    else
    {
      int v22 = 0;
      sub_244CEF65C(v37, v38, *(void *)(a2 + 48), *(void *)(a2 + 56), *(void *)(a2 + 64), *(void *)(a2 + 72), &v22, (uint64_t)v39);
      if (LODWORD(v39[0]))
      {
        uint64_t v12 = sub_244E1D814(v22);
      }
      else
      {
        long long v23 = 0uLL;
        long long __s1 = 0uLL;
        int v20 = 0;
        v19[0] = 0;
        v19[1] = 0;
        v39[1] = 0;
        v40[0] = 0;
        *(_DWORD *)((char *)v40 + 7) = 0;
        sub_244CB3988((uint64_t)v41);
        v41[18] = 21;
        v18[0] = 0;
        v18[1] = 0;
        int __dst = *(_DWORD *)(a2 + 96);
        __int16 v43 = *(_WORD *)sub_2447A4DF0(v33);
        __int16 v44 = *(_WORD *)sub_2447A4DF0(v35);
        __int16 v45 = *(_WORD *)sub_2447A4DF0(v29);
        __int16 v13 = v31[0];
        if (v31[0]) {
          __int16 v13 = *(_WORD *)sub_2446D1880(v31);
        }
        __int16 v46 = v13;
        if (v26[0]) {
          __int16 v14 = *(_WORD *)sub_2446D1880(v26);
        }
        else {
          __int16 v14 = -1;
        }
        __int16 v47 = v14;
        v48[1] = 0;
        v48[0] = 0;
        int v49 = 0;
        __int16 v16 = v48;
        uint64_t v17 = 20;
        sub_2446C1098(v15, v37, v38);
        sub_244CEFCC4(v15, (uint64_t *)&v16, (uint64_t)&p_dst);
        uint64_t v12 = 105;
        if (!p_dst && v17 == 20)
        {
          sub_244D9C03C(a2, &v23, &__s1, &v20, (uint64_t)v19, (uint64_t)v39, (uint64_t)&p_dst);
          if (p_dst)
          {
            uint64_t v12 = 501;
          }
          else if (*((void *)&__s1 + 1) == *(void *)(a2 + 88) {
                 && (!*((void *)&__s1 + 1)
          }
                  || !memcmp((const void *)__s1, *(const void **)(a2 + 80), *((size_t *)&__s1 + 1))))
          {
            uint64_t v12 = (*(uint64_t (**)(void *, long long *, void *))(*a1 + 24))(a1, &v23, v18);
            if (!v12) {
              uint64_t v12 = (*(uint64_t (**)(void *, void *, void *, int *))(*a1 + 32))(a1, v18, v19, &__dst);
            }
          }
          else
          {
            uint64_t v12 = 502;
          }
        }
      }
      uint64_t v7 = v12;
    }
  }
  else
  {
    uint64_t v7 = 205;
  }
LABEL_12:
  (*(void (**)(void, uint64_t, uint64_t))(a3 + 32))(*(void *)(a3 + 24), a2, v7);
  if (v6) {
    j__free(v6);
  }
}

void sub_244E1D628(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a2 + 8);
  if (v5) {
    BOOL v6 = *(void *)a2 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    *(_DWORD *)a4 = 47;
    *(void *)(a4 + 8) = "src/credentials/attestation_verifier/DeviceAttestationVerifier.h";
    int v7 = 234;
  }
  else if (v5 == 20)
  {
    __n[0] = 0;
    __n[1] = 0;
    if (*(void *)(a1 + 16))
    {
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      __int16 v13 = "src/credentials/attestation_verifier/DeviceAttestationVerifier.h";
      while (1)
      {
        v21[0] = 0;
        v21[1] = 0;
        int v22 = 0;
        *(_OWORD *)__n = *(_OWORD *)(*(void *)(a1 + 8) + v11);
        unint64_t v18 = v21;
        uint64_t v19 = 20;
        sub_244CEFCC4((uint64_t *)__n, (uint64_t *)&v18, (uint64_t)__s2);
        if (LODWORD(__s2[0]))
        {
          int v7 = 246;
          int v15 = 172;
          goto LABEL_21;
        }
        sub_2446C1098(__s2, (uint64_t)v18, v19);
        __int16 v14 = *(void **)(a2 + 8);
        if (v14 == __s2[1] && (!v14 || !memcmp(*(const void **)a2, __s2[0], (size_t)v14))) {
          break;
        }
        ++v12;
        v11 += 16;
        if (v12 >= *(void *)(a1 + 16)) {
          goto LABEL_15;
        }
      }
      unint64_t v16 = __n[1];
      if (*(void *)(a3 + 8) >= __n[1])
      {
        memcpy(*(void **)a3, (const void *)__n[0], __n[1]);
        sub_2446C1548(a3, v16);
        int v15 = 0;
        int v7 = 380;
        __int16 v13 = "src/lib/support/Span.h";
      }
      else
      {
        int v7 = 375;
        __int16 v13 = "src/lib/support/Span.h";
        int v15 = 25;
      }
LABEL_21:
      *(_DWORD *)a4 = v15;
      *(void *)(a4 + 8) = v13;
    }
    else
    {
LABEL_15:
      *(_DWORD *)a4 = 74;
      *(void *)(a4 + 8) = "src/credentials/attestation_verifier/DeviceAttestationVerifier.h";
      int v7 = 255;
    }
  }
  else
  {
    *(_DWORD *)a4 = 47;
    *(void *)(a4 + 8) = "src/credentials/attestation_verifier/DeviceAttestationVerifier.h";
    int v7 = 235;
  }
  *(_DWORD *)(a4 + 16) = v7;
}

uint64_t sub_244E1D814(int a1)
{
  if (a1 <= 299)
  {
    if (a1 > 199)
    {
      if (a1 == 200)
      {
        return 203;
      }
      else
      {
        if (a1 != 201) {
          return 900;
        }
        return 204;
      }
    }
    else if (a1 == 100)
    {
      return 105;
    }
    else
    {
      if (a1 != 101) {
        return 900;
      }
      return 106;
    }
  }
  else if (a1 <= 399)
  {
    if (a1 == 300)
    {
      return 303;
    }
    else
    {
      if (a1 != 301) {
        return 900;
      }
      return 304;
    }
  }
  else if (a1 == 400)
  {
    return 301;
  }
  else
  {
    if (a1 != 500) {
      return 900;
    }
    return 700;
  }
}

uint64_t sub_244E1D8B8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v11 = 0uLL;
  sub_244D9B8E8(a2, &v11, v12);
  if (v12[0].n128_u32[0]) {
    return 600;
  }
  v12[0].n128_u64[0] = (unint64_t)&unk_26F954540;
  memset(v10, 0, sizeof(v10));
  sub_244E1DA08((void *)(a1 + 16), (uint64_t)&v11, (uint64_t)v12, (uint64_t)v10);
  if (LODWORD(v10[0])) {
    return 601;
  }
  if (*((void *)&v11 + 1) == 20)
  {
    BOOL v7 = *(void *)v11 == 0xA9FAAC593382FA62 && *(void *)(v11 + 8) == 0xF5DD0A14FA1C3E96;
    BOOL v8 = v7 && *(_DWORD *)(v11 + 16) == 1618080516;
    if (v8 && !*(unsigned char *)(a1 + 8)) {
      return 601;
    }
  }
  sub_244D9AA74(a2, (uint64_t)v12, a3, &v9);
  if (v9.n128_u32[0]) {
    return 602;
  }
  else {
    return 0;
  }
}

void *sub_244E1DA08@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  BOOL v6 = result;
  uint64_t v8 = 0;
  __n128 v9 = *(void **)a2;
  do
  {
    if (*(void *)(a2 + 8) == 20)
    {
      size_t v10 = *(uint64_t **)((char *)&off_2651A9F28 + v8);
      uint64_t v11 = *v10;
      uint64_t v12 = v10[1];
      uint64_t v13 = *((unsigned int *)v10 + 4);
      BOOL v14 = *v9 == v11 && v9[1] == v12;
      if (v14 && *((_DWORD *)v9 + 4) == v13)
      {
        int v19 = 0;
        uint64_t v20 = *(uint64_t *)((char *)&off_2651A9F28 + v8 + 8);
        *(_OWORD *)(a3 + 8) = *(_OWORD *)v20;
        long long v21 = *(_OWORD *)(v20 + 16);
        long long v22 = *(_OWORD *)(v20 + 32);
        long long v23 = *(_OWORD *)(v20 + 48);
        *(unsigned char *)(a3 + 72) = *(unsigned char *)(v20 + 64);
        *(_OWORD *)(a3 + 56) = v23;
        *(_OWORD *)(a3 + 40) = v22;
        *(_OWORD *)(a3 + 24) = v21;
        int v18 = 675;
        goto LABEL_20;
      }
    }
    v8 += 16;
  }
  while (v8 != 96);
  if (result[76])
  {
    unint64_t v16 = 0;
    uint64_t v17 = result + 7;
    while (1)
    {
      uint64_t result = sub_2446C1098(&__s2, (uint64_t)(v17 - 6), *(v17 - 2));
      if (*(void *)(a2 + 8) == __n)
      {
        if (!__n) {
          break;
        }
        uint64_t result = (void *)memcmp(*(const void **)a2, __s2, __n);
        if (!result) {
          break;
        }
      }
      ++v16;
      v17 += 15;
      if (v16 >= v6[76]) {
        goto LABEL_17;
      }
    }
    int v19 = 0;
    *(_OWORD *)(a3 + 8) = *(_OWORD *)v17;
    long long v24 = *((_OWORD *)v17 + 1);
    long long v25 = *((_OWORD *)v17 + 2);
    long long v26 = *((_OWORD *)v17 + 3);
    *(unsigned char *)(a3 + 72) = *((unsigned char *)v17 + 64);
    *(_OWORD *)(a3 + 56) = v26;
    *(_OWORD *)(a3 + 40) = v25;
    *(_OWORD *)(a3 + 24) = v24;
    int v18 = 686;
  }
  else
  {
LABEL_17:
    int v18 = 691;
    int v19 = 16;
  }
LABEL_20:
  *(_DWORD *)a4 = v19;
  *(void *)(a4 + 8) = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
  *(_DWORD *)(a4 + 16) = v18;
  return result;
}

BOOL sub_244E1DB70(uint64_t a1, void *a2)
{
  if (a2[1] != 20) {
    return 0;
  }
  return *(void *)*a2 == 0xA9FAAC593382FA62
      && *(void *)(*a2 + 8) == 0xF5DD0A14FA1C3E96
      && *(_DWORD *)(*a2 + 16) == 1618080516;
}

uint64_t sub_244E1DBCC(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v12 = 4294901760;
  char v13 = 0;
  int v14 = 0;
  unsigned __int8 v15 = 0;
  unsigned __int16 v16 = -1;
  uint64_t v17 = 0;
  uint64_t v19 = 0;
  uint64_t v18 = 0;
  sub_244CB3988((uint64_t)v11);
  sub_244D9988C(a2, (uint64_t)&v12, (uint64_t)v10);
  if (LODWORD(v10[0])) {
    return 603;
  }
  uint64_t result = 501;
  if ((unsigned __int16)v12 == 1 && v15 <= 2u)
  {
    if (WORD1(v12) != *a4) {
      return 604;
    }
    if (sub_244D99EF0((uint64_t)v11, (uint64_t)a2, a4[1]))
    {
      int v7 = a4[2];
      int v8 = a4[4];
      if (BYTE2(v17))
      {
        uint64_t result = 604;
        if (v7 != v16 || v8 != v16) {
          return result;
        }
        int v9 = a4[3];
        if (v9 == (unsigned __int16)v17 && (!a4[5] || a4[5] == v9))
        {
LABEL_21:
          if (BYTE3(v17)
            && (v10[0] = a4 + 7, v10[1] = 20, !sub_244D9A0E8((uint64_t)v11, (uint64_t)a2, (uint64_t)v10)))
          {
            return 606;
          }
          else
          {
            return 0;
          }
        }
      }
      else
      {
        uint64_t result = 604;
        if (v7 != WORD1(v12) || v8 != WORD1(v12)) {
          return result;
        }
        if (sub_244D99EF0((uint64_t)v11, (uint64_t)a2, a4[3])
          && (!a4[5] || sub_244D99EF0((uint64_t)v11, (uint64_t)a2, a4[5])))
        {
          goto LABEL_21;
        }
      }
    }
    return 605;
  }
  return result;
}

void sub_244E1DD88(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X5>, void *a6@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7) {
    BOOL v8 = *(void *)(a2 + 8) == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || !*(void *)(a3 + 8) || (uint64_t v11 = a5[1]) == 0)
  {
    *(_DWORD *)a6 = 47;
    a6[1] = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
    int v18 = 581;
    goto LABEL_24;
  }
  if (v7 >= 0x385)
  {
    *(_DWORD *)a6 = 47;
    a6[1] = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
    int v18 = 583;
    goto LABEL_24;
  }
  if (v11 != 32)
  {
    *(_DWORD *)a6 = 47;
    a6[1] = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
    int v18 = 584;
    goto LABEL_24;
  }
  long long v27 = 0uLL;
  long long v26 = 0uLL;
  v25[0] = 0;
  v25[1] = 0;
  v24[0] = 0;
  v24[1] = 0;
  v23[0] = 0;
  v23[1] = 0;
  a6[1] = 0;
  a6[2] = 0;
  *a6 = 0;
  sub_244D9C950(a1, &v27, &v26, v25, v24, v23, (uint64_t)a6);
  if (*(_DWORD *)a6) {
    return;
  }
  if (*((void *)&v26 + 1) != 32)
  {
    *(_DWORD *)a6 = 47;
    a6[1] = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
    int v18 = 594;
    goto LABEL_24;
  }
  if (a5[1] == 32)
  {
    BOOL v15 = *(void *)v26 == *(void *)*a5 && *(void *)(v26 + 8) == *(void *)(*a5 + 8);
    BOOL v16 = v15 && *(void *)(v26 + 16) == *(void *)(*a5 + 16);
    if (v16 && *(void *)(v26 + 24) == *(void *)(*a5 + 24))
    {
      uint64_t v29 = 0;
      a6[1] = 0;
      a6[2] = 0;
      *a6 = 0;
      size_t v19 = *(void *)(a3 + 8);
      uint64_t v20 = "src/crypto/CHIPCryptoPAL.h";
      if (v19 > 0x40)
      {
        int v22 = 289;
        int v21 = 47;
      }
      else
      {
        uint64_t v29 = *(void *)(a3 + 8);
        a6[1] = "src/crypto/CHIPCryptoPAL.h";
        *((_DWORD *)a6 + 4) = 291;
        memcpy(__dst, *(const void **)a3, v19);
        a6[1] = 0;
        a6[2] = 0;
        *a6 = 0;
        sub_244DB0C80(a4, a1, a2, (uint64_t)__dst, a6);
        if (*(_DWORD *)a6)
        {
LABEL_34:
          sub_244CED784(__dst, 64);
          return;
        }
        int v21 = 0;
        int v22 = 607;
        uint64_t v20 = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
      }
      *(_DWORD *)a6 = v21;
      a6[1] = v20;
      *((_DWORD *)a6 + 4) = v22;
      goto LABEL_34;
    }
  }
  *(_DWORD *)a6 = 47;
  a6[1] = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
  int v18 = 597;
LABEL_24:
  *((_DWORD *)a6 + 4) = v18;
}

uint64_t sub_244E1DFF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 640);
  if (v3) {
    return (*(uint64_t (**)(void))(*(void *)v3 + 16))();
  }
  else {
    return (*(uint64_t (**)(void, uint64_t, void))(a3 + 32))(*(void *)(a3 + 24), a2, 0);
  }
}

void *sub_244E1E02C@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5 = *(void *)(a2 + 8);
  if (v5 > 0x20)
  {
    int v8 = 630;
LABEL_7:
    int v9 = 47;
    goto LABEL_9;
  }
  if (!v5)
  {
    int v8 = 631;
    goto LABEL_7;
  }
  BOOL v6 = result;
  uint64_t v7 = result[76];
  if (v7 == 5)
  {
    int v8 = 632;
    int v9 = 11;
  }
  else
  {
    uint64_t v11 = (char *)&result[15 * v7];
    *((void *)v11 + 5) = v5;
    uint64_t result = memcpy(v11 + 8, *(const void **)a2, *(void *)(a2 + 8));
    int v9 = 0;
    *(_OWORD *)(v11 + 56) = *(_OWORD *)(a3 + 8);
    long long v12 = *(_OWORD *)(a3 + 24);
    long long v13 = *(_OWORD *)(a3 + 40);
    long long v14 = *(_OWORD *)(a3 + 56);
    v11[120] = *(unsigned char *)(a3 + 72);
    *(_OWORD *)(v11 + 104) = v14;
    *(_OWORD *)(v11 + 88) = v13;
    *(_OWORD *)(v11 + 72) = v12;
    ++v6[76];
    int v8 = 641;
  }
LABEL_9:
  *(_DWORD *)a4 = v9;
  *(void *)(a4 + 8) = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
  *(_DWORD *)(a4 + 16) = v8;
  return result;
}

void sub_244E1E104(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12[1] = 0;
  v12[0] = 0;
  int v13 = 0;
  int v9 = v12;
  uint64_t v10 = 20;
  v11[0] = &unk_26F954540;
  sub_244CEFCC4(a2, (uint64_t *)&v9, (uint64_t)v8);
  if (!LODWORD(v8[0]))
  {
    sub_244CEF4D0(a2, (uint64_t)v11, (uint64_t)v8);
    if (LODWORD(v8[0]))
    {
      *(_DWORD *)a3 = 47;
      *(void *)(a3 + 8) = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
      int v6 = 651;
      goto LABEL_12;
    }
    sub_2446C1098(v8, (uint64_t)v9, v10);
    if ((*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 40))(a1, v8))
    {
LABEL_6:
      sub_2446C1098(v8, (uint64_t)v9, v10);
      (*(void (**)(uint64_t, void *, void *))(*(void *)a1 + 16))(a1, v8, v11);
      return;
    }
    int v7 = 0;
    sub_244CEF65C((uint64_t)&unk_244ED8BC6, 517, 0, 0, *a2, a2[1], &v7, (uint64_t)v8);
    if (LODWORD(v8[0]))
    {
      int v6 = 660;
    }
    else
    {
      if (!v7) {
        goto LABEL_6;
      }
      int v6 = 661;
    }
    *(_DWORD *)a3 = 47;
    *(void *)(a3 + 8) = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
    goto LABEL_12;
  }
  *(_DWORD *)a3 = 47;
  *(void *)(a3 + 8) = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
  int v6 = 650;
LABEL_12:
  *(_DWORD *)(a3 + 16) = v6;
}

uint64_t *sub_244E1E2E4()
{
  return &qword_268EC31D8;
}

uint64_t *sub_244E1E304(uint64_t a1, uint64_t a2)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_268EC3480, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_268EC3480))
  {
    byte_268EC3200 = 1;
    qword_268EC31F8[0] = (uint64_t)&unk_26F95DF38;
    qword_268EC3208 = (uint64_t)&unk_26F95DED0;
    uint64_t v3 = 8u;
    do
    {
      qword_268EC31F8[v3] = (uint64_t)&unk_26F954540;
      v3 += 15;
    }
    while (v3 != 83);
    qword_268EC3468 = 0;
    unk_268EC3470 = a1;
    qword_268EC3478 = a2;
    __cxa_guard_release(&qword_268EC3480);
  }
  return qword_268EC31F8;
}

void sub_244E1E3F4()
{
}

void sub_244E1E408()
{
  if (!byte_268EC31F0)
  {
    byte_268EC31F0 = 1;
    v0 = *sub_244E1E488();
    uint64_t v1 = sub_244E1E488()[1];
    qword_268EC31E0 = (uint64_t)v0;
    unk_268EC31E8 = v1;
    qword_268EC31D8 = (uint64_t)&unk_26F95DFA0;
  }
}

void sub_244E1E474()
{
}

_UNKNOWN ***sub_244E1E488()
{
  return &off_2651A9FA8;
}

void sub_244E1E494()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    uint64_t v2 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/lib/support/Span.h";
    __int16 v3 = 1024;
    int v4 = 54;
    __int16 v5 = 2080;
    int v6 = "databuf != nullptr || datalen == 0";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E1E574()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E1E644()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E1E714()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E1E7EC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    sub_2446D0790();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E1E8A4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2446D1B14();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1E944()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1EA04()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1EAC4()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1EB84()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1EC44()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_2446D1B14();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1ECEC()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_2446D0790();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1ED94(uint64_t a1)
{
  sub_24479DDA0(a1);
  int v2 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v2)) {
    sub_2446C1570(&dword_2446BD000, v3, v4, "VerifyOrDie failure at %s:%d: %s", v5, v6, v7, v8, v9, v10, v11, v12, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1EE60()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_2447A0160();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1EF08()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1EFC0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F068()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F110()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F1B8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F260()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F308()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F3B0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F458()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F500()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F5A8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F650()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F6F8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F7A0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F848()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F8F0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1F998()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1FA40()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1FAE8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1FB90()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A4AB0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1FC38()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1FCF0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1FDA8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E1FE60()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    sub_2447A0160();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E1FF18()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E1FFE8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E200B8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E20170()
{
  int v1 = sub_244CC8484(0x1Du, "Zcl");
  if (sub_2446D1B54(v1))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "Attribute persistence needs a persistence provider", v2, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Du, 1);
  }
  abort();
}

void sub_244E201E8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E202B8()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/lib/core/Optional.h";
    __int16 v3 = 1024;
    int v4 = 208;
    __int16 v5 = 2080;
    int v6 = "HasValue()";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E203A0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E20470()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E20540()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E20610()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E206CC()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E20788()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E20844()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E20908()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E209C4()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E20A80()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/clusters/descriptor/descriptor.cpp";
    __int16 v3 = 1024;
    int v4 = 212;
    __int16 v5 = 2080;
    int v6 = "aPath.mClusterId == Descriptor::Id";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E20B60()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E20C20()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E20CE0()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E20DA0()
{
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E20E60(_DWORD *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = sub_244CC8484(0xDu, "DataManagement");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = HIWORD(*a1);
    int v4 = (unsigned __int16)*a1;
    *(_DWORD *)__n128 buf = 67109376;
    int v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_ERROR, "Unexpected global attribute: 0x%04X_%04X", buf, 0xEu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xDu, 1);
  }
  abort();
}

void sub_244E20F28()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    sub_2446D1B14();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E20FE0()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/lib/support/Variant.h";
    __int16 v3 = 1024;
    int v4 = 224;
    __int16 v5 = 2080;
    int v6 = "(mTypeId == VariantInternal::TupleIndexOfType<T, std::tuple<Ts...>>::value)";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E210C0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E21190()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E21260()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E21330()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/lib/core/Optional.h";
    __int16 v3 = 1024;
    int v4 = 201;
    __int16 v5 = 2080;
    int v6 = "HasValue()";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E213F8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2149C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2153C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E215DC()
{
  v0 = sub_244CC8484(0xDu, "DataManagement");
  if (sub_2446D1B54(v0)) {
    sub_244CA296C(&dword_2446BD000, v1, v2, "Incoming exchange context should not be null", v3, v4, v5, v6, 0);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xDu, 1);
  }
  abort();
}

void sub_244E21644()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E216E4()
{
  v0 = sub_244CC8484(0xDu, "DataManagement");
  if (sub_2446D1B54(v0)) {
    sub_244CA296C(&dword_2446BD000, v1, v2, "state should be ReadyForInvokeResponses", v3, v4, v5, v6, 0);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xDu, 1);
  }
  abort();
}

void sub_244E2174C(uint64_t a1)
{
  sub_24479DDA0(a1);
  uint64_t v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E217F0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E21890()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E21930()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E219D0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E21A70()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E21B10()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E21BB0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/lib/support/Span.h";
    __int16 v3 = 1024;
    int v4 = 154;
    __int16 v5 = 2080;
    int v6 = "new_size <= size()";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E21C78()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E21D30()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E21DE8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E21E88()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E21F28()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E21FC8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2206C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2210C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E221B4()
{
  v0 = sub_244CC8484(0xDu, "DataManagement");
  if (sub_2446D1B54(v0)) {
    sub_244CA296C(&dword_2446BD000, v1, v2, "OnMessageReceived should not be called on GroupExchangeContext", v3, v4, v5, v6, 0);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xDu, 1);
  }
  abort();
}

void sub_244E2221C()
{
  v0 = sub_244CC8484(0xDu, "DataManagement");
  if (sub_2446D1B54(v0)) {
    sub_244CA296C(&dword_2446BD000, v1, v2, "Incoming exchange context should be same as the initial request.", v3, v4, v5, v6, 0);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xDu, 1);
  }
  abort();
}

void sub_244E22284()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2232C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2447A0160();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E223BC(uint64_t a1)
{
  sub_24479DDA0(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E22468()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2446D1B14();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E224F8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/lib/core/Optional.h";
    __int16 v3 = 1024;
    int v4 = 208;
    __int16 v5 = 2080;
    int v6 = "HasValue()";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E225C4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E22668()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2270C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E227B0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CB24CC();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E22840()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E228E8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E22990()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E22A38()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E22AE0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E22B88()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E22C40()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E22CF8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    sub_2446D0790();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E22D98()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E22E50()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E22F08()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E22FC0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E23068()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E23110()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E231B8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E23260()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E23318()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E233D0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E23488()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/lib/core/ReferenceCounted.h";
    __int16 v3 = 1024;
    int v4 = 70;
    __int16 v5 = 2080;
    int v6 = "mRefCount != 0";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E23550()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E235F0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E23690()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E23730()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E237D0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E23870()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E23910()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E239B0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/system/SystemClock.cpp";
    __int16 v3 = 1024;
    int v4 = 85;
    __int16 v5 = 2080;
    int v6 = "newTimestamp.count() >= prevTimestamp";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E23A78()
{
  v0 = sub_244CC8484(0x19u, "chipSystemLayer");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_244CA296C(&dword_2446BD000, v1, v2, "SystemPacketBuffer::Free: aPacket->ref = 0", v3, v4, v5, v6, 0);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC93E4();
  }
  abort();
}

void sub_244E23AE0()
{
  v0 = sub_244CC8484(0x19u, "chipSystemLayer");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_244CA296C(&dword_2446BD000, v1, v2, "buffer chain too large", v3, v4, v5, v6, 0);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC93E4();
  }
  abort();
}

void sub_244E23B48(uint64_t a1)
{
  uint64_t v2 = sub_244CC8484(0x19u, "chipSystemLayer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 134217984;
    uint64_t v4 = a1;
    _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_ERROR, "next buffer %p is not exclusive to this chain", buf, 0xCu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC93E4();
  }
  abort();
}

void sub_244E23BD4()
{
  v0 = sub_244CC8484(0x19u, "chipSystemLayer");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_244CA296C(&dword_2446BD000, v1, v2, "packet buffer refcount overflow", v3, v4, v5, v6, 0);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC93E4();
  }
  abort();
}

void sub_244E23C3C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E23CF4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E23DAC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E23E64()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E23F1C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E23FC4()
{
  int v1 = sub_244CC8484(0x1Fu, "DeviceLayer");
  if (sub_2446D1B54(v1))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "Re-entry into HandleEvents from a timer callback?", v2, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Fu, 1);
  }
  abort();
}

void sub_244E2403C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E240E4(uint64_t *a1)
{
  sub_244CCB584(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24190()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24238()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E242F0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24390()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24430()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E244D0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24570()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24610()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E246B0()
{
  int v1 = sub_244CC8484(0xBu, "SecureChannel");
  if (sub_2446D1B54(v1))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "Bad internal state.", v2, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xBu, 1);
  }
  abort();
}

void sub_244E24728()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E247C8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24868()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24908()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E249A8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24A4C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24AEC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24B8C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24C2C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24CD0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24D70()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24E18()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24EBC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E24F60(uint64_t a1)
{
  sub_24479DDA0(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25008()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E250AC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E25164()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E2521C(uint64_t a1)
{
  sub_24479DDA0(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E252D8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2537C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25420()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E254C4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_2446D0790();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25554()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E255F8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E256A0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25748()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E257F0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25898()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/lib/support/Span.h";
    __int16 v3 = 1024;
    int v4 = 54;
    __int16 v5 = 2080;
    int v6 = "databuf != nullptr || datalen == 0";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E25960()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25A08()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25AB0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CF0C28();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25B40()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/messaging/EphemeralExchangeDispatch.h";
    __int16 v3 = 1024;
    int v4 = 48;
    __int16 v5 = 2080;
    int v6 = "false";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E25C08()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25CA8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25D48()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25DE8(uint64_t a1)
{
  sub_24479DDA0(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25E8C(uint64_t a1)
{
  sub_24479DDA0(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25F30(uint64_t a1)
{
  sub_24479DDA0(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E25FD4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E26074()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E26114(uint64_t *a1)
{
  sub_244D677C4(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E261C0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E26268()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E26308()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E263A8(uint64_t *a1)
{
  sub_244CCB584(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2644C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E264EC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/platform/CommissionableDataProvider.cpp";
    __int16 v3 = 1024;
    int v4 = 32;
    __int16 v5 = 2080;
    int v6 = "gCommissionableDataProvider != nullptr";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E265B4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/platform/DeviceInstanceInfoProvider.cpp";
    __int16 v3 = 1024;
    int v4 = 32;
    __int16 v5 = 2080;
    int v6 = "gDeviceInstanceInfoProvider != nullptr";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E2667C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E26734()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244D6D098();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E267C4(uint64_t *a1)
{
  sub_244CCB584(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244D6D070();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E26858()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244D6D0C0();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E268E8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E269A0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/lib/support/IntrusiveList.h";
    __int16 v3 = 1024;
    int v4 = 88;
    __int16 v5 = 2080;
    int v6 = "!IsInList()";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E26A68()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E26B20()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E26BD8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E26C90()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E26D38()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/lib/support/SetupDiscriminator.h";
    __int16 v3 = 1024;
    int v4 = 45;
    __int16 v5 = 2080;
    int v6 = "discriminator == (discriminator & kShortMask)";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E26E00()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E26EA8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E26F50()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/lib/support/SetupDiscriminator.h";
    __int16 v3 = 1024;
    int v4 = 52;
    __int16 v5 = 2080;
    int v6 = "discriminator == (discriminator & kLongMask)";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E27018()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E270B8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27158()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E271F8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27298()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27338()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E273D8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27478()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27518()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E275B8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27658()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E27708()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E277B8()
{
  v0 = sub_244CC8484(0xBu, "SecureChannel");
  if (sub_2446D1B54(v0)) {
    sub_244CA296C(&dword_2446BD000, v1, v2, "We couldn't find any session to evict at all, something's wrong!", v3, v4, v5, v6, 0);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xBu, 1);
  }
  abort();
}

void sub_244E27820()
{
  v0 = sub_244CC8484(0xBu, "SecureChannel");
  if (sub_2446D1B54(v0)) {
    sub_244CA296C(&dword_2446BD000, v1, v2, "EvictAndAllocate isn't re-entrant, yet someone called us while we're already running", v3, v4, v5, v6, 0);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xBu, 1);
  }
  abort();
}

void sub_244E27888()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2792C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E279CC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27A6C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27B0C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27BAC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27C4C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27CEC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27D8C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27E2C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27ECC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E27F6C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2800C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E280AC()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_268EBE0D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(qword_268EBE0D0))
  {
    qword_268EBE0B0 = sub_244D6A0B8();
    dword_268EBE0B8 = v1;
    byte_268EBE0BC = 0;
    byte_268EBE0C0 = 0;
    byte_268EBE0C4 = 0;
    word_268EBE0CC = 1;
    __cxa_guard_release(qword_268EBE0D0);
  }
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v3 = "src/transport/GroupSession.h";
    __int16 v4 = 1024;
    int v5 = 66;
    __int16 v6 = 2080;
    uint64_t v7 = "false";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E281CC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/transport/GroupSession.h";
    __int16 v3 = 1024;
    int v4 = 74;
    __int16 v5 = 2080;
    __int16 v6 = "false";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E28294()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/transport/GroupSession.h";
    __int16 v3 = 1024;
    int v4 = 81;
    __int16 v5 = 2080;
    __int16 v6 = "false";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E2835C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E283FC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2849C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2853C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E285DC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2867C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E28720(uint64_t *a1)
{
  sub_244CCB584(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E287C8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2886C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2890C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E289AC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E28A4C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E28AEC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E28B8C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E28C2C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E28CCC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244D94E14();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E28D5C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E28E04()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244D94E3C();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E28E94()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E28F3C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E28FF4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E290AC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2914C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E291EC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2928C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E29344()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E293EC(uint64_t *a1)
{
  sub_2446D845C(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244D6D070();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29480()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    sub_2446D1B14();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E29520()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/transport/raw/UDP.cpp";
    __int16 v3 = 1024;
    int v4 = 85;
    __int16 v5 = 2080;
    int v6 = "mUDPEndPoint != nullptr";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E295E8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__n128 buf = 136315650;
    int v2 = "src/transport/raw/TCP.cpp";
    __int16 v3 = 1024;
    int v4 = 482;
    __int16 v5 = 2080;
    int v6 = "activeConnection != nullptr";
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E296B0()
{
  int v1 = sub_244CC8484(0xDu, "DataManagement");
  if (sub_2446D1B54(v1))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl(&dword_2446BD000, v0, OS_LOG_TYPE_ERROR, "Failed to get required resources by evicting existing subscriptions.", v2, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xDu, 1);
  }
  abort();
}

void sub_244E29728()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E297C8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29868()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29908()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E299A8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29A48()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29AE8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29B88()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29C28()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29CC8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29D68()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29E08()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29EA8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29F48()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E29FE8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A090()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A130()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A1D0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A270()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A310()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A3B0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A450()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A4F0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A590()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A630()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A6D0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A770()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A810()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A8B0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A950()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2A9F0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2AA90()
{
  v0 = sub_244CC8484(0xDu, "DataManagement");
  if (sub_2446D1B54(v0)) {
    sub_244CA296C(&dword_2446BD000, v1, v2, "CommandResponseSender can only be set in idle state", v3, v4, v5, v6, 0);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xDu, 1);
  }
  abort();
}

void sub_244E2AAF8()
{
  v0 = sub_244CC8484(0xDu, "DataManagement");
  if (sub_2446D1B54(v0)) {
    sub_244CA296C(&dword_2446BD000, v1, v2, "state should be Idle", v3, v4, v5, v6, 0);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xDu, 1);
  }
  abort();
}

void sub_244E2AB60()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2AC00()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2ACA0(uint64_t *a1)
{
  int v2 = sub_244CC8484(0xDu, "DataManagement");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *a1;
    *(_DWORD *)__n128 buf = 67109120;
    int v5 = v3;
    _os_log_impl(&dword_2446BD000, v2, OS_LOG_TYPE_ERROR, "CommandHandlerImpl::Close() called with %u unfinished async work items", buf, 8u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0xDu, 1);
  }
  abort();
}

void sub_244E2AD3C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2ADDC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2AE7C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2AF1C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2AFBC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B05C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B0FC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B19C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B23C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B2DC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B37C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B41C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B4C0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B564()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B608()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E2B6C0(uint64_t *a1)
{
  sub_244CCB584(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

void sub_244E2B77C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B824()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B8CC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2B974()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2BA18()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2BAB8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2BB58()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2BBF8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2BC98()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2BD38(uint64_t *a1)
{
  sub_244DE7A18(a1);
  int v1 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v1))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2BDDC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2BE7C()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2BF24()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2BFCC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C074()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C114()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C1B4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C254()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C2F4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C394()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C434()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C4D4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244E126B4();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C564()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C604()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C6A4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C744()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C7E4()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244CA2958();
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C884()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C928()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2C9CC()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2CA70()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2CB14()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0))
  {
    sub_244B95090();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2CBB8()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2CC60()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2CD08()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2CDB0()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2CE58()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (sub_2446D1B54(v0)) {
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  }
  if (sub_244CC4E58(1u)) {
    sub_2446D1B3C();
  }
  abort();
}

void sub_244E2CF00()
{
  v0 = sub_244CC8484(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    sub_2447A0160();
    sub_2446C1570(&dword_2446BD000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0x1Bu, 1);
  }
  abort();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x270ED7A80](bytes, count);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x270ED7BB0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x270ED7BC0](sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x270ED7BD0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, *(void *)&protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceReconfirmRecord(DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata)
{
  return MEMORY[0x270ED7BE8](*(void *)&flags, *(void *)&interfaceIndex, fullname, rrtype, rrclass, rdlen, rdata);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return MEMORY[0x270ED7C00](sdRef, *(void *)&flags, *(void *)&interfaceIndex, name, regtype, domain, host, port);
}

DNSServiceErrorType DNSServiceRegisterRecord(DNSServiceRef sdRef, DNSRecordRef *RecordRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata, uint32_t ttl, DNSServiceRegisterRecordReply callBack, void *context)
{
  return MEMORY[0x270ED7C08](sdRef, RecordRef, *(void *)&flags, *(void *)&interfaceIndex, fullname, rrtype, rrclass, rdlen);
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return MEMORY[0x270ED7C10](sdRef, *(void *)&flags, *(void *)&interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x270ED7C18](service, queue);
}

DNSServiceErrorType DNSServiceUpdateRecord(DNSServiceRef sdRef, DNSRecordRef recordRef, DNSServiceFlags flags, uint16_t rdlen, const void *rdata, uint32_t ttl)
{
  return MEMORY[0x270ED7C20](sdRef, recordRef, *(void *)&flags, rdlen, rdata, *(void *)&ttl);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x270ED7CA8](txtRecord);
}

uint16_t TXTRecordGetCount(uint16_t txtLen, const void *txtRecord)
{
  return MEMORY[0x270ED7CB0](txtLen, txtRecord);
}

DNSServiceErrorType TXTRecordGetItemAtIndex(uint16_t txtLen, const void *txtRecord, uint16_t itemIndex, uint16_t keyBufLen, char *key, uint8_t *valueLen, const void **value)
{
  return MEMORY[0x270ED7CB8](txtLen, txtRecord, itemIndex, keyBufLen, key, valueLen, value);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x270ED7CC0](txtRecord);
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x270ED7CD0](txtRecord, key, valueSize, value);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
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

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
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

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

void std::locale::~locale(std::locale *this)
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E30](retstr, __val);
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

void operator delete()
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

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x270ED7DA8](*(void *)&a1, a2, *(void *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x270ED7E48]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

uint64_t __udivti3()
{
  return MEMORY[0x270ED7F10]();
}

uint64_t __umodti3()
{
  return MEMORY[0x270ED7F28]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED8478](*(void *)&a1, a2, a3);
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x270ED86D8](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x270ED8798](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_activate(dispatch_object_t object)
{
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

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
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

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9CD0](*(void *)&a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9D88](*(void *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x270ED9D90](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

void if_freenameindex(if_nameindex *a1)
{
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x270ED9E70](*(void *)&a1, a2);
}

if_nameindex *if_nameindex(void)
{
  return (if_nameindex *)MEMORY[0x270ED9E78]();
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x270ED9E80](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x270ED9EC8](*(void *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

int listen(int a1, int a2)
{
  return MEMORY[0x270EDA078](*(void *)&a1, *(void *)&a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
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

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x270EF7BA8](endpoint, parameters);
}

void nw_connection_set_path_changed_handler(nw_connection_t connection, nw_connection_path_event_handler_t handler)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x270EF8368](interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x270EF8380](interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x270EF83A0](interface);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x270EF8560](configure_dtls, configure_udp);
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x270EF8A08]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

void nw_release(void *obj)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x270EDAC38](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  return MEMORY[0x270EDADF0](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
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

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB190](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x270EDB1A0](*(void *)&a1, a2, *(void *)&a3);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x270EDB328](*(void *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB3B0](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x270EDB3B8](*(void *)&a1, a2, *(void *)&a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int settimeofday(const timeval *a1, const timezone *a2)
{
  return MEMORY[0x270EDB448](a1, a2);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x270EDB480](*(void *)&a1, *(void *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

void srand(unsigned int a1)
{
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x270EDB6D0](__str, __sep, __lasts);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}