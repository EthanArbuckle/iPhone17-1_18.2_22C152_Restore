uint64_t sub_248150D48()
{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_248150E3C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_248150F30()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24815102C, 0, 0);
}

uint64_t sub_24815102C()
{
  uint64_t v1 = *(void *)(v0 + 1800) + *(int *)(v0 + 100);
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 0);
  uint64_t v2 = *(void *)(v0 + 1280);
  uint64_t v3 = *(void *)(v0 + 1288);
  long long v11 = *(_OWORD *)(v0 + 1304);
  long long v12 = *(_OWORD *)(v0 + 1264);
  uint64_t v4 = *(void *)(v0 + 1320);
  uint64_t v5 = 0x10000;
  if (!*(unsigned char *)(v0 + 1298)) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = *(unsigned __int16 *)(v0 + 1296) | (unint64_t)v5;
  uint64_t v7 = 0x1000000;
  if (!*(unsigned char *)(v0 + 1299)) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v6 | v7;
  sub_247F98958(*(void **)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64), *(void **)(v1 + 72), *(unsigned char *)(v1 + 80));
  *(_OWORD *)uint64_t v1 = v12;
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  *(void *)(v1 + 32) = v8;
  *(_OWORD *)(v1 + 40) = v11;
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 72) = 0;
  *(void *)(v1 + 56) = v4;
  *(unsigned char *)(v1 + 80) = 0;
  v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_248151168()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248151264, 0, 0);
}

uint64_t sub_248151264()
{
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 0);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2481512F0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2481513E4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2481514E0, 0, 0);
}

uint64_t sub_2481514E0()
{
  uint64_t v1 = *(void *)(v0 + 1800) + *(int *)(v0 + 100);
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 2);
  uint64_t v2 = *(void *)(v0 + 816);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 824);
  long long v9 = *(_OWORD *)(v0 + 832);
  long long v10 = *(_OWORD *)(v0 + 800);
  long long v8 = *(_OWORD *)(v0 + 848);
  uint64_t v4 = *(void *)(v0 + 864);
  uint64_t v5 = *(void *)(v0 + 872);
  sub_247F98958(*(void **)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64), *(void **)(v1 + 72), *(unsigned char *)(v1 + 80));
  *(_OWORD *)uint64_t v1 = v10;
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  *(_OWORD *)(v1 + 32) = v9;
  *(_OWORD *)(v1 + 48) = v8;
  *(void *)(v1 + 64) = v4;
  *(void *)(v1 + 72) = v5;
  *(unsigned char *)(v1 + 80) = 2;
  unint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_2481515FC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2481516F8, 0, 0);
}

uint64_t sub_2481516F8()
{
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 2);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248151788()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248151884, 0, 0);
}

uint64_t sub_248151884()
{
  uint64_t v1 = *(void *)(v0 + 1800) + *(int *)(v0 + 100);
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 3);
  uint64_t v2 = *(void *)(v0 + 1056);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 1064);
  long long v9 = *(_OWORD *)(v0 + 1072);
  long long v10 = *(_OWORD *)(v0 + 1040);
  long long v8 = *(_OWORD *)(v0 + 1088);
  uint64_t v4 = *(void *)(v0 + 1104);
  uint64_t v5 = *(void *)(v0 + 1112);
  sub_247F98958(*(void **)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64), *(void **)(v1 + 72), *(unsigned char *)(v1 + 80));
  *(_OWORD *)uint64_t v1 = v10;
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  *(_OWORD *)(v1 + 32) = v9;
  *(_OWORD *)(v1 + 48) = v8;
  *(void *)(v1 + 64) = v4;
  *(void *)(v1 + 72) = v5;
  *(unsigned char *)(v1 + 80) = 3;
  unint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_2481519A0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248151A9C, 0, 0);
}

uint64_t sub_248151A9C()
{
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 3);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248151B2C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_248151C20()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248151D1C, 0, 0);
}

uint64_t sub_248151D1C()
{
  uint64_t v1 = *(void *)(v0 + 1800) + *(int *)(v0 + 100);
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 5);
  long long v5 = *(_OWORD *)(v0 + 1448);
  long long v6 = *(_OWORD *)(v0 + 1432);
  uint64_t v2 = *(void *)(v0 + 1464);
  sub_247F98958(*(void **)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64), *(void **)(v1 + 72), *(unsigned char *)(v1 + 80));
  *(_OWORD *)uint64_t v1 = v6;
  *(_OWORD *)(v1 + 16) = v5;
  *(void *)(v1 + 32) = v2;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(void *)(v1 + 72) = 0;
  *(unsigned char *)(v1 + 80) = 5;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_248151E20()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248151F1C, 0, 0);
}

uint64_t sub_248151F1C()
{
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 5);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248151FAC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2481520A0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24815219C, 0, 0);
}

uint64_t sub_24815219C()
{
  uint64_t v1 = *(void *)(v0 + 1800) + *(int *)(v0 + 100);
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 7);
  long long v6 = *(_OWORD *)(v0 + 1608);
  uint64_t v2 = *(void *)(v0 + 1624);
  uint64_t v3 = *(void *)(v0 + 1632);
  sub_247F98958(*(void **)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64), *(void **)(v1 + 72), *(unsigned char *)(v1 + 80));
  *(_OWORD *)uint64_t v1 = v6;
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(unsigned char *)(v1 + 80) = 7;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24815229C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248152398, 0, 0);
}

uint64_t sub_248152398()
{
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 7);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248152428()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248152524, 0, 0);
}

uint64_t sub_248152524()
{
  uint64_t v1 = *(void *)(v0 + 1800) + *(int *)(v0 + 100);
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 8);
  long long v6 = *(_OWORD *)(v0 + 1544);
  uint64_t v2 = *(void *)(v0 + 1560);
  uint64_t v3 = *(void *)(v0 + 1568);
  sub_247F98958(*(void **)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64), *(void **)(v1 + 72), *(unsigned char *)(v1 + 80));
  *(_OWORD *)uint64_t v1 = v6;
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(unsigned char *)(v1 + 80) = 8;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_248152624()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248152720, 0, 0);
}

uint64_t sub_248152720()
{
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 8);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2481527B0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2481528AC, 0, 0);
}

uint64_t sub_2481528AC()
{
  uint64_t v1 = *(void *)(v0 + 1800) + *(int *)(v0 + 100);
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 9);
  long long v6 = *(_OWORD *)(v0 + 1704);
  uint64_t v2 = *(void *)(v0 + 1720);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 1728);
  sub_247F98958(*(void **)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64), *(void **)(v1 + 72), *(unsigned char *)(v1 + 80));
  *(_OWORD *)uint64_t v1 = v6;
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(unsigned char *)(v1 + 80) = 9;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2481529AC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248152AA8, 0, 0);
}

uint64_t sub_248152AA8()
{
  sub_247F98958(*(void **)(v0 + 2184), *(void **)(v0 + 2192), *(void **)(v0 + 2200), *(void **)(v0 + 2208), *(void *)(v0 + 2216), *(void **)(v0 + 2224), *(void *)(v0 + 2232), *(void *)(v0 + 2240), *(void **)(v0 + 2248), *(void **)(v0 + 2256), 9);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248152B38()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248152C34, 0, 0);
}

uint64_t sub_248152C34()
{
  uint64_t v14 = *(void *)(v0 + 2320);
  uint64_t v1 = *(void *)(v0 + 2312);
  uint64_t v2 = *(void *)(v0 + 2304);
  uint64_t v3 = *(void *)(v0 + 2296);
  uint64_t v4 = *(void *)(v0 + 2288);
  uint64_t v5 = *(void *)(v0 + 2280);
  v22 = *(void **)(v0 + 2256);
  v21 = *(void **)(v0 + 2248);
  uint64_t v26 = *(void *)(v0 + 2240);
  uint64_t v25 = *(void *)(v0 + 2232);
  v24 = *(void **)(v0 + 2224);
  uint64_t v23 = *(void *)(v0 + 2216);
  v20 = *(void **)(v0 + 2208);
  v19 = *(void **)(v0 + 2200);
  uint64_t v6 = *(void *)(v0 + 1800) + *(int *)(v0 + 100);
  v18 = *(void **)(v0 + 2192);
  v17 = *(void **)(v0 + 2184);
  char v7 = *(unsigned char *)(v0 + 98);
  sub_247F98958(*(void **)(v0 + 2328), *(void **)(v0 + 2336), *(void **)(v0 + 2344), *(void **)(v0 + 2352), *(void *)(v0 + 2360), *(void **)(v0 + 2368), *(void *)(v0 + 2376), *(void *)(v0 + 2384), *(void **)(v0 + 2392), *(void **)(v0 + 2400), *(unsigned char *)(v0 + 99));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247FA98D8(v5, v4, v3, v2, v1, v14, v7);
  long long v15 = *(_OWORD *)(v0 + 472);
  long long v16 = *(_OWORD *)(v0 + 456);
  long long v12 = *(_OWORD *)(v0 + 504);
  long long v13 = *(_OWORD *)(v0 + 488);
  uint64_t v8 = *(void *)(v0 + 520);
  uint64_t v9 = *(void *)(v0 + 528);
  LOBYTE(v3) = *(unsigned char *)(v0 + 536);
  sub_247F98958(*(void **)v6, *(void **)(v6 + 8), *(void **)(v6 + 16), *(void **)(v6 + 24), *(void *)(v6 + 32), *(void **)(v6 + 40), *(void *)(v6 + 48), *(void *)(v6 + 56), *(void **)(v6 + 64), *(void **)(v6 + 72), *(unsigned char *)(v6 + 80));
  sub_247F98958(v17, v18, v19, v20, v23, v24, v25, v26, v21, v22, 10);
  *(_OWORD *)uint64_t v6 = v16;
  *(_OWORD *)(v6 + 16) = v15;
  *(_OWORD *)(v6 + 32) = v13;
  *(_OWORD *)(v6 + 48) = v12;
  *(void *)(v6 + 64) = v8;
  *(void *)(v6 + 72) = v9;
  *(unsigned char *)(v6 + 80) = v3;
  long long v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_248152E44()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248152F40, 0, 0);
}

uint64_t sub_248152F40()
{
  uint64_t v15 = *(void *)(v0 + 2320);
  uint64_t v11 = *(void *)(v0 + 2312);
  uint64_t v1 = *(void *)(v0 + 2304);
  uint64_t v2 = *(void *)(v0 + 2296);
  uint64_t v3 = *(void *)(v0 + 2288);
  uint64_t v4 = *(void *)(v0 + 2280);
  uint64_t v14 = *(void **)(v0 + 2256);
  long long v13 = *(void **)(v0 + 2248);
  uint64_t v19 = *(void *)(v0 + 2240);
  uint64_t v18 = *(void *)(v0 + 2232);
  v17 = *(void **)(v0 + 2224);
  uint64_t v16 = *(void *)(v0 + 2216);
  long long v12 = *(void **)(v0 + 2208);
  long long v10 = *(void **)(v0 + 2200);
  uint64_t v5 = *(void **)(v0 + 2192);
  uint64_t v6 = *(void **)(v0 + 2184);
  char v7 = *(unsigned char *)(v0 + 98);
  sub_247F98958(*(void **)(v0 + 2328), *(void **)(v0 + 2336), *(void **)(v0 + 2344), *(void **)(v0 + 2352), *(void *)(v0 + 2360), *(void **)(v0 + 2368), *(void *)(v0 + 2376), *(void *)(v0 + 2384), *(void **)(v0 + 2392), *(void **)(v0 + 2400), *(unsigned char *)(v0 + 99));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247FA98D8(v4, v3, v2, v1, v11, v15, v7);
  sub_247F98958(v6, v5, v10, v12, v16, v17, v18, v19, v13, v14, 10);
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_2481530C4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2481531C0, 0, 0);
}

uint64_t sub_2481531C0()
{
  uint64_t v16 = *(void **)(v0 + 2256);
  uint64_t v1 = *(void **)(v0 + 2248);
  uint64_t v20 = *(void *)(v0 + 2240);
  uint64_t v19 = *(void *)(v0 + 2232);
  uint64_t v18 = *(void **)(v0 + 2224);
  uint64_t v17 = *(void *)(v0 + 2216);
  uint64_t v2 = *(void **)(v0 + 2208);
  uint64_t v3 = *(void **)(v0 + 2200);
  uint64_t v4 = *(void **)(v0 + 2192);
  uint64_t v5 = *(void *)(v0 + 1800) + *(int *)(v0 + 100);
  uint64_t v6 = *(void **)(v0 + 2184);
  sub_247F98958(*(void **)(v0 + 2408), *(void **)(v0 + 2416), *(void **)(v0 + 2424), *(void **)(v0 + 2432), *(void *)(v0 + 2440), *(void **)(v0 + 2448), *(void *)(v0 + 2456), *(void *)(v0 + 2464), *(void **)(v0 + 2472), *(void **)(v0 + 2480), *(unsigned char *)(v0 + 186));
  long long v14 = *(_OWORD *)(v0 + 296);
  long long v15 = *(_OWORD *)(v0 + 280);
  long long v12 = *(_OWORD *)(v0 + 328);
  long long v13 = *(_OWORD *)(v0 + 312);
  uint64_t v7 = *(void *)(v0 + 344);
  uint64_t v8 = *(void *)(v0 + 352);
  char v9 = *(unsigned char *)(v0 + 360);
  sub_247F98958(*(void **)v5, *(void **)(v5 + 8), *(void **)(v5 + 16), *(void **)(v5 + 24), *(void *)(v5 + 32), *(void **)(v5 + 40), *(void *)(v5 + 48), *(void *)(v5 + 56), *(void **)(v5 + 64), *(void **)(v5 + 72), *(unsigned char *)(v5 + 80));
  sub_247F98958(v6, v4, v3, v2, v17, v18, v19, v20, v1, v16, 11);
  *(_OWORD *)uint64_t v5 = v15;
  *(_OWORD *)(v5 + 16) = v14;
  *(_OWORD *)(v5 + 32) = v13;
  *(_OWORD *)(v5 + 48) = v12;
  *(void *)(v5 + 64) = v7;
  *(void *)(v5 + 72) = v8;
  *(unsigned char *)(v5 + 80) = v9;
  long long v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_248153358()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248153454, 0, 0);
}

uint64_t sub_248153454()
{
  uint64_t v1 = *(void **)(v0 + 2256);
  uint64_t v2 = *(void **)(v0 + 2248);
  uint64_t v12 = *(void *)(v0 + 2240);
  uint64_t v3 = *(void *)(v0 + 2232);
  uint64_t v4 = *(void **)(v0 + 2224);
  uint64_t v5 = *(void *)(v0 + 2216);
  uint64_t v6 = *(void **)(v0 + 2208);
  uint64_t v7 = *(void **)(v0 + 2200);
  uint64_t v8 = *(void **)(v0 + 2192);
  char v9 = *(void **)(v0 + 2184);
  sub_247F98958(*(void **)(v0 + 2408), *(void **)(v0 + 2416), *(void **)(v0 + 2424), *(void **)(v0 + 2432), *(void *)(v0 + 2440), *(void **)(v0 + 2448), *(void *)(v0 + 2456), *(void *)(v0 + 2464), *(void **)(v0 + 2472), *(void **)(v0 + 2480), *(unsigned char *)(v0 + 186));
  sub_247F98958(v9, v8, v7, v6, v5, v4, v3, v12, v2, v1, 11);
  long long v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_248153560(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 32) = &unk_2692DC568;
  *(void *)(a2 + 40) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationModel.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationModel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationModel.modify())()
{
  return nullsub_1;
}

uint64_t sub_248153658(uint64_t a1, const void *a2, uint64_t a3)
{
  v3[90] = a3;
  v3[89] = a1;
  v3[91] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC1F8);
  v3[92] = swift_task_alloc();
  memcpy(v3 + 2, a2, 0x2B8uLL);
  return MEMORY[0x270FA2498](sub_24815370C, 0, 0);
}

uint64_t sub_24815370C()
{
  uint64_t v1 = (unsigned char *)v0[92];
  sub_2481285A0(v0[90], (uint64_t)&v1[*(int *)(v0[91] + 28)], (uint64_t (*)(void))type metadata accessor for AuthenticationModel);
  *uint64_t v1 = 1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[93] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2481537E0;
  uint64_t v3 = v0[92];
  uint64_t v4 = v0[89];
  return static AutomaticSetupModelExchange._receiveModelUpdate(_:_:)(v4, (uint64_t)(v0 + 2), v3);
}

uint64_t sub_2481537E0()
{
  uint64_t v1 = *(void *)(*v0 + 736);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  sub_247FB33D4(v1, &qword_2692DC1F8);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t AutomaticSetupModelExchange.processAuthenticationModel.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processAuthenticationModel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processAuthenticationModel.modify())()
{
  return nullsub_1;
}

uint64_t sub_248153988(const void *a1, uint64_t a2)
{
  v2[89] = a2;
  v2[90] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC208);
  v2[91] = swift_task_alloc();
  type metadata accessor for SignInModel();
  v2[92] = swift_task_alloc();
  memcpy(v2 + 2, a1, 0x2B8uLL);
  return MEMORY[0x270FA2498](sub_248153A64, 0, 0);
}

uint64_t sub_248153A64()
{
  uint64_t v1 = (unsigned char *)v0[91];
  sub_2481285A0(v0[89], (uint64_t)&v1[*(int *)(v0[90] + 28)], (uint64_t (*)(void))type metadata accessor for SignInModel);
  *uint64_t v1 = 0;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[93] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_248153B34;
  uint64_t v3 = v0[92];
  uint64_t v4 = v0[91];
  return static AutomaticSetupModelExchange._receiveModelUpdate(_:_:)(v3, (uint64_t)(v0 + 2), v4);
}

uint64_t sub_248153B34()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 736);
  uint64_t v2 = *(void *)(*(void *)v0 + 728);
  swift_task_dealloc();
  sub_247FB33D4(v2, &qword_2692DC208);
  sub_24815D444(v1, (uint64_t (*)(void))type metadata accessor for SignInModel);
  return MEMORY[0x270FA2498](sub_248153C84, 0, 0);
}

uint64_t sub_248153C84()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248153D2C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(char **)(v0 + 24);
  char v3 = *v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC208);
  sub_2481285A0((uint64_t)&v1[*(int *)(v4 + 28)], v2, (uint64_t (*)(void))type metadata accessor for SignInModel);
  uint64_t v5 = *(int *)(type metadata accessor for SignInModel() + 64);
  *(_DWORD *)(v0 + 184) = v5;
  uint64_t v6 = (uint64_t *)(v2 + v5);
  uint64_t v7 = *v6;
  *(void *)(v0 + 112) = *v6;
  uint64_t v8 = v6[1];
  *(void *)(v0 + 120) = v8;
  uint64_t v9 = v6[2];
  *(void *)(v0 + 128) = v9;
  uint64_t v10 = v6[3];
  *(void *)(v0 + 136) = v10;
  switch(v8)
  {
    case 0:
      if ((v3 & 1) == 0)
      {
        uint64_t v27 = (uint64_t (*)(void))(*(void *)(v0 + 32) + **(int **)(v0 + 32));
        uint64_t v12 = (void *)swift_task_alloc();
        *(void *)(v0 + 144) = v12;
        *uint64_t v12 = v0;
        v12[1] = sub_248154190;
        goto LABEL_17;
      }
      goto LABEL_9;
    case 1:
      if ((v3 & 1) == 0)
      {
        uint64_t v27 = (uint64_t (*)(void))(*(void *)(v0 + 48) + **(int **)(v0 + 48));
        v24 = (void *)swift_task_alloc();
        *(void *)(v0 + 152) = v24;
        void *v24 = v0;
        v24[1] = sub_248154284;
        goto LABEL_17;
      }
LABEL_9:
      uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
      return v13();
    case 2:
      if ((v3 & 1) == 0)
      {
        uint64_t v27 = (uint64_t (*)(void))(*(void *)(v0 + 96) + **(int **)(v0 + 96));
        uint64_t v11 = (void *)swift_task_alloc();
        *(void *)(v0 + 176) = v11;
        *uint64_t v11 = v0;
        v11[1] = sub_248154648;
LABEL_17:
        return v27();
      }
      goto LABEL_9;
  }
  char v15 = *((unsigned char *)v6 + 32);
  if (v3)
  {
    uint64_t v16 = v15 & 1;
    v28 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 80)
                                                                              + **(int **)(v0 + 80));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v17;
    void *v17 = v0;
    v17[1] = sub_248154378;
    uint64_t v18 = v7;
    uint64_t v19 = v8;
    uint64_t v20 = v9;
    uint64_t v21 = v10;
    uint64_t v22 = v16;
    uint64_t v23 = v28;
  }
  else
  {
    uint64_t v25 = v15 & 1;
    v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 64)
                                                                              + **(int **)(v0 + 64));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v26 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v26;
    *uint64_t v26 = v0;
    v26[1] = sub_24815451C;
    uint64_t v18 = v7;
    uint64_t v19 = v8;
    uint64_t v20 = v9;
    uint64_t v21 = v10;
    uint64_t v22 = v25;
    uint64_t v23 = v29;
  }
  return v23(v18, v19, v20, v21, v22);
}

uint64_t sub_248154190()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_248154284()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_248154378(char a1)
{
  *(unsigned char *)(*(void *)v1 + 188) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248154478, 0, 0);
}

uint64_t sub_248154478()
{
  char v1 = *(unsigned char *)(v0 + 188);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  long long v7 = *(_OWORD *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 16) + *(int *)(v0 + 184);
  sub_2480F9234(*(void *)v4, *(void *)(v4 + 8));
  *(_OWORD *)uint64_t v4 = v7;
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  *(unsigned char *)(v4 + 32) = v1;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24815451C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_248154648()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24815473C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 64) = &unk_2692DC548;
  *(void *)(a2 + 72) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveSignInModel.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveSignInModel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveSignInModel.modify())()
{
  return nullsub_1;
}

uint64_t sub_248154834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a3;
  *(void *)(v3 + 32) = type metadata accessor for SignInModel();
  *(void *)(v3 + 40) = swift_task_alloc();
  *(void *)(v3 + 48) = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC208);
  *(void *)(v3 + 56) = swift_task_alloc();
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(a2 + 664);
  return MEMORY[0x270FA2498](sub_24815490C, 0, 0);
}

uint64_t sub_24815490C()
{
  uint64_t v1 = *(unsigned char **)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v4 = (uint64_t)&v1[*(int *)(*(void *)(v0 + 48) + 28)];
  sub_2481285A0(*(void *)(v0 + 24), v4, (uint64_t (*)(void))type metadata accessor for SignInModel);
  *uint64_t v1 = 1;
  sub_2481285A0(v4, v2, (uint64_t (*)(void))type metadata accessor for SignInModel);
  uint64_t v5 = *(int *)(v3 + 64);
  *(_DWORD *)(v0 + 120) = v5;
  uint64_t v6 = (uint64_t *)(v2 + v5);
  unint64_t v7 = v6[1];
  *(void *)(v0 + 80) = v7;
  if (v7 > 2)
  {
    uint64_t v11 = *(int **)(v0 + 64);
    uint64_t v12 = v6[3];
    *(void *)(v0 + 88) = v12;
    uint64_t v13 = v6[2];
    *(void *)(v0 + 96) = v13;
    uint64_t v14 = *v6;
    *(void *)(v0 + 104) = *v6;
    uint64_t v15 = v6[4] & 1;
    uint64_t v17 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))((char *)v11 + *v11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_248154B10;
    return v17(v14, v7, v13, v12, v15);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 56);
    sub_24815D3E0(*(void *)(v0 + 40), *(void *)(v0 + 16));
    sub_247FB33D4(v8, &qword_2692DC208);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_248154B10(char a1)
{
  *(unsigned char *)(*(void *)v1 + 124) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248154C10, 0, 0);
}

uint64_t sub_248154C10()
{
  char v1 = *(unsigned char *)(v0 + 124);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 40) + *(int *)(v0 + 120);
  sub_2480F9234(*(void *)v6, *(void *)(v6 + 8));
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = v5;
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = v4;
  *(unsigned char *)(v6 + 32) = v1;
  uint64_t v7 = *(void *)(v0 + 56);
  sub_24815D3E0(*(void *)(v0 + 40), *(void *)(v0 + 16));
  sub_247FB33D4(v7, &qword_2692DC208);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t AutomaticSetupModelExchange.processSignInModel.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processSignInModel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processSignInModel.modify())()
{
  return nullsub_1;
}

uint64_t sub_248154D68(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 96) = &unk_2692DC530;
  *(void *)(a2 + 104) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveInitial.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveInitial.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveInitial.modify())()
{
  return nullsub_1;
}

uint64_t sub_248154E60(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 112) = &unk_2692DC520;
  *(void *)(a2 + 120) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveFinished.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveFinished.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveFinished.modify())()
{
  return nullsub_1;
}

uint64_t sub_248154F58(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 128) = &unk_2692DC508;
  *(void *)(a2 + 136) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveSetupError.getter()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveSetupError.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveSetupError.modify())()
{
  return nullsub_1;
}

uint64_t sub_248155050(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 144) = &unk_2692DC4E8;
  *(void *)(a2 + 152) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveDismiss.getter()
{
  uint64_t v1 = *(void *)(v0 + 144);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveDismiss.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveDismiss.modify())()
{
  return nullsub_1;
}

void *AutomaticSetupModelExchange.queue.getter()
{
  uint64_t v1 = *(void **)(v0 + 160);
  id v2 = v1;
  return v1;
}

void AutomaticSetupModelExchange.queue.setter(uint64_t a1)
{
  *(void *)(v1 + 160) = a1;
}

uint64_t (*AutomaticSetupModelExchange.queue.modify())()
{
  return nullsub_1;
}

uint64_t AutomaticSetupModelExchange.receiveModelUpdate(_:with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9520);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = &v20[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  memcpy(v20, v4, sizeof(v20));
  uint64_t v14 = sub_2481753D0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  sub_2481581D0(a1, (uint64_t)&v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8]);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 728) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  memcpy(v16 + 4, v20, 0x2B8uLL);
  sub_24815823C((uint64_t)&v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8], (uint64_t)v16 + v15);
  uint64_t v17 = (void *)((char *)v16 + ((v10 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  void *v17 = a2;
  v17[1] = a3;
  sub_247FFC498((uint64_t)v20);
  swift_retain();
  sub_247FFC0C4((uint64_t)v13, (uint64_t)&unk_2692DC218, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_2481553B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[92] = a7;
  v7[91] = a6;
  v7[90] = a5;
  v7[89] = a4;
  v7[93] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9840);
  v7[94] = swift_task_alloc();
  v7[95] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D6FD0);
  v7[96] = swift_task_alloc();
  type metadata accessor for SetupModel();
  v7[97] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2481554BC, 0, 0);
}

uint64_t sub_2481554BC()
{
  uint64_t v1 = *(unsigned char **)(v0 + 768);
  uint64_t v2 = *(void *)(v0 + 760);
  uint64_t v3 = *(void *)(v0 + 720);
  memcpy((void *)(v0 + 16), *(const void **)(v0 + 712), 0x2B8uLL);
  char v4 = *(unsigned char *)(v3 + 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
  sub_2481285A0(v3 + *(int *)(v5 + 32), (uint64_t)&v1[*(int *)(v2 + 28)], (uint64_t (*)(void))type metadata accessor for SetupModel);
  *uint64_t v1 = v4;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 784) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2481555C0;
  uint64_t v7 = *(void *)(v0 + 776);
  uint64_t v8 = *(void *)(v0 + 768);
  return sub_24814BE08(v7, v8);
}

uint64_t sub_2481555C0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 768);
  swift_task_dealloc();
  sub_247FB33D4(v1, &qword_2692D6FD0);
  return MEMORY[0x270FA2498](sub_2481556E0, 0, 0);
}

uint64_t sub_2481556E0()
{
  uint64_t v1 = (uint64_t *)v0[90];
  if (*((unsigned char *)v1 + 8) == 1)
  {
    uint64_t v2 = (void *)v0[94];
    uint64_t v3 = (void (*)(void *))v0[91];
    uint64_t v4 = *v1;
    sub_2481285A0(v0[97], (uint64_t)v2 + *(int *)(v0[93] + 32), (uint64_t (*)(void))type metadata accessor for SetupModel);
    uint64_t v5 = sub_24814B9E4(&qword_2692D9830);
    *uint64_t v2 = v4;
    v2[1] = v5;
    v3(v2);
    sub_247FB33D4((uint64_t)v2, &qword_2692D9840);
  }
  sub_24815D444(v0[97], (uint64_t (*)(void))type metadata accessor for SetupModel);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_248155800(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 168) = &unk_2692DC4C8;
  *(void *)(a2 + 176) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveDiscoveryStateDiscovered.getter()
{
  uint64_t v1 = *(void *)(v0 + 168);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveDiscoveryStateDiscovered.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 168) = a1;
  *(void *)(v2 + 176) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveDiscoveryStateDiscovered.modify())()
{
  return nullsub_1;
}

uint64_t sub_2481558F8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a2;
  *(unsigned char *)(v2 + 64) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(a2 + 24);
  *(void *)(v2 + 56) = *(void *)(a2 + 40);
  *(unsigned char *)(v2 + 65) = *(unsigned char *)(a2 + 48);
  return MEMORY[0x270FA2498](sub_248155940, 0, 0);
}

uint64_t sub_248155940()
{
  int v1 = *(char *)(v0 + 65);
  if (v1 < 0) {
    char v2 = 1;
  }
  else {
    char v2 = *(unsigned char *)(v0 + 64);
  }
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v7 = *(void *)(v0 + 16);
  *(void *)uint64_t v7 = *(void *)(v0 + 24);
  *(void *)(v7 + 8) = v6;
  *(unsigned char *)(v7 + 16) = v2;
  *(void *)(v7 + 24) = v5;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v3;
  *(unsigned char *)(v7 + 48) = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_247FE4250(v5, v4, v3, v1);
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t AutomaticSetupModelExchange.processDiscoveryStateDiscovered.getter()
{
  uint64_t v1 = *(void *)(v0 + 184);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processDiscoveryStateDiscovered.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 184) = a1;
  *(void *)(v2 + 192) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processDiscoveryStateDiscovered.modify())()
{
  return nullsub_1;
}

uint64_t sub_248155A84(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 200) = &unk_2692DC4A8;
  *(void *)(a2 + 208) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveDiscoveryStateDiscovering.getter()
{
  uint64_t v1 = *(void *)(v0 + 200);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveDiscoveryStateDiscovering.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 200) = a1;
  *(void *)(v2 + 208) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveDiscoveryStateDiscovering.modify())()
{
  return nullsub_1;
}

uint64_t sub_248155B7C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 48) = *(unsigned char *)a2;
  *(unsigned char *)(v2 + 49) = *(unsigned char *)(a2 + 1);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a2 + 8);
  *(void *)(v2 + 40) = *(void *)(a2 + 24);
  *(unsigned char *)(v2 + 50) = *(unsigned char *)(a2 + 32);
  return MEMORY[0x270FA2498](sub_248155BC4, 0, 0);
}

uint64_t sub_248155BC4()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 50);
  switch(v1 >> 5)
  {
    case 1u:
      char v2 = *(unsigned char *)(v0 + 49);
      break;
    case 3u:
      char v2 = *(unsigned char *)(v0 + 49);
      swift_retain();
      break;
    case 4u:
      char v2 = *(unsigned char *)(v0 + 48);
      break;
    default:
      char v2 = *(unsigned char *)(v0 + 49);
      swift_bridgeObjectRetain();
      break;
  }
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 16);
  long long v5 = *(_OWORD *)(v0 + 24);
  *(unsigned char *)uint64_t v4 = *(unsigned char *)(v0 + 48);
  *(unsigned char *)(v4 + 1) = v2;
  *(_OWORD *)(v4 + 8) = v5;
  *(void *)(v4 + 24) = v3;
  *(unsigned char *)(v4 + 32) = v1;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t AutomaticSetupModelExchange.processDiscoveryStateDiscovering.getter()
{
  uint64_t v1 = *(void *)(v0 + 216);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processDiscoveryStateDiscovering.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 216) = a1;
  *(void *)(v2 + 224) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processDiscoveryStateDiscovering.modify())()
{
  return nullsub_1;
}

uint64_t sub_248155D30(uint64_t a1, int *a2)
{
  long long v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_247FD79D0;
  return v5();
}

uint64_t sub_248155DFC(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 232) = &unk_2692DC490;
  *(void *)(a2 + 240) = v5;
  return result;
}

uint64_t sub_248155E6C(int *a1)
{
  uint64_t v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_247FD79D0;
  return v4();
}

uint64_t AutomaticSetupModelExchange.receiveDiscoveryStatePaired.getter()
{
  uint64_t v1 = *(void *)(v0 + 232);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveDiscoveryStatePaired.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 232) = a1;
  *(void *)(v2 + 240) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveDiscoveryStatePaired.modify())()
{
  return nullsub_1;
}

uint64_t sub_248155FC0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 248) = &unk_2692DC480;
  *(void *)(a2 + 256) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateInitial.getter()
{
  uint64_t v1 = *(void *)(v0 + 248);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateInitial.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 248) = a1;
  *(void *)(v2 + 256) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateInitial.modify())()
{
  return nullsub_1;
}

uint64_t sub_2481560B8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 264) = &unk_2692DC470;
  *(void *)(a2 + 272) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateSRP.getter()
{
  uint64_t v1 = *(void *)(v0 + 264);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateSRP.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 264) = a1;
  *(void *)(v2 + 272) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateSRP.modify())()
{
  return nullsub_1;
}

uint64_t sub_2481561B0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 280) = &unk_2692DC460;
  *(void *)(a2 + 288) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateDismissSecondFactor.getter()
{
  uint64_t v1 = *(void *)(v0 + 280);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateDismissSecondFactor.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 280) = a1;
  *(void *)(v2 + 288) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateDismissSecondFactor.modify())()
{
  return nullsub_1;
}

uint64_t sub_2481562A8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 296) = &unk_2692DC450;
  *(void *)(a2 + 304) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateDismissBasicLoginUI.getter()
{
  uint64_t v1 = *(void *)(v0 + 296);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateDismissBasicLoginUI.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 296) = a1;
  *(void *)(v2 + 304) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateDismissBasicLoginUI.modify())()
{
  return nullsub_1;
}

uint64_t sub_2481563A0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 312) = &unk_2692DC440;
  *(void *)(a2 + 320) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateDismissServerProvidedUI.getter()
{
  uint64_t v1 = *(void *)(v0 + 312);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateDismissServerProvidedUI.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 312) = a1;
  *(void *)(v2 + 320) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateDismissServerProvidedUI.modify())()
{
  return nullsub_1;
}

uint64_t sub_248156498(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 328) = &unk_2692DC428;
  *(void *)(a2 + 336) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateBasicLogin.getter()
{
  uint64_t v1 = *(void *)(v0 + 328);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateBasicLogin.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 328) = a1;
  *(void *)(v2 + 336) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateBasicLogin.modify())()
{
  return nullsub_1;
}

uint64_t sub_248156590(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a2;
  *(void *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 40) = v3;
  *(_WORD *)(v2 + 80) = *(_WORD *)(a2 + 32);
  *(unsigned char *)(v2 + 82) = *(unsigned char *)(a2 + 34);
  *(unsigned char *)(v2 + 83) = *(unsigned char *)(a2 + 35);
  *(_OWORD *)(v2 + 56) = *(_OWORD *)(a2 + 40);
  *(void *)(v2 + 72) = *(void *)(a2 + 56);
  return MEMORY[0x270FA2498](sub_2481565E4, 0, 0);
}

uint64_t sub_2481565E4()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void **)(v0 + 72);
  char v3 = *(unsigned char *)(v0 + 83);
  char v4 = *(unsigned char *)(v0 + 82);
  __int16 v5 = *(_WORD *)(v0 + 80);
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v7 = *(void **)(v0 + 56);
  uint64_t v8 = *(void *)(v0 + 16);
  long long v9 = *(_OWORD *)(v0 + 32);
  *(void *)uint64_t v8 = *(void *)(v0 + 24);
  *(_OWORD *)(v8 + 8) = v9;
  *(void *)(v8 + 24) = v6;
  *(_WORD *)(v8 + 32) = v5;
  *(unsigned char *)(v8 + 34) = v4;
  *(unsigned char *)(v8 + 35) = v3;
  *(void *)(v8 + 40) = v7;
  *(void *)(v8 + 48) = v1;
  *(void *)(v8 + 56) = v2;
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v10 = v7;
  swift_bridgeObjectRetain();
  id v11 = v2;
  return v13();
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateBasicLogin.getter()
{
  uint64_t v1 = *(void *)(v0 + 344);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateBasicLogin.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 344) = a1;
  *(void *)(v2 + 352) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processAuthenticationStateBasicLogin.modify())()
{
  return nullsub_1;
}

uint64_t sub_248156738(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 360) = &unk_2692DC408;
  *(void *)(a2 + 368) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateSecondFactor.getter()
{
  uint64_t v1 = *(void *)(v0 + 360);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateSecondFactor.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 360) = a1;
  *(void *)(v2 + 368) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateSecondFactor.modify())()
{
  return nullsub_1;
}

uint64_t sub_248156830(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a2;
  *(void *)(v2 + 40) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 96) = *(unsigned char *)(a2 + 24);
  long long v3 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v2 + 64) = v3;
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a2 + 64);
  return MEMORY[0x270FA2498](sub_248156878, 0, 0);
}

uint64_t sub_248156878()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = *(void **)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  char v7 = *(unsigned char *)(v0 + 96);
  uint64_t v8 = *(void *)(v0 + 40);
  uint64_t v9 = *(void *)(v0 + 16);
  long long v10 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)uint64_t v9 = v10;
  *(void *)(v9 + 16) = v8;
  *(unsigned char *)(v9 + 24) = v7;
  *(void *)(v9 + 32) = v6;
  *(void *)(v9 + 40) = v5;
  *(void *)(v9 + 48) = v4;
  *(void *)(v9 + 56) = v3;
  *(void *)(v9 + 64) = v1;
  *(void *)(v9 + 72) = v2;
  id v11 = (id)v10;
  sub_247F98864(v6, v5, v4, v3, v1);
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  id v12 = v2;
  return v14();
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateSecondFactor.getter()
{
  uint64_t v1 = *(void *)(v0 + 376);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateSecondFactor.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 376) = a1;
  *(void *)(v2 + 384) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processAuthenticationStateSecondFactor.modify())()
{
  return nullsub_1;
}

uint64_t sub_2481569D0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 392) = &unk_2692DC3E8;
  *(void *)(a2 + 400) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateSecondFactorAlert.getter()
{
  uint64_t v1 = *(void *)(v0 + 392);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateSecondFactorAlert.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 392) = a1;
  *(void *)(v2 + 400) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateSecondFactorAlert.modify())()
{
  return nullsub_1;
}

uint64_t sub_248156AC8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a2;
  *(void *)(v2 + 40) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 96) = *(unsigned char *)(a2 + 24);
  long long v3 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v2 + 64) = v3;
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a2 + 64);
  return MEMORY[0x270FA2498](sub_24815D4A4, 0, 0);
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateSecondFactorAlert.getter()
{
  uint64_t v1 = *(void *)(v0 + 408);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateSecondFactorAlert.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 408) = a1;
  *(void *)(v2 + 416) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processAuthenticationStateSecondFactorAlert.modify())()
{
  return nullsub_1;
}

uint64_t sub_248156B98(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 424) = &unk_2692DC3C8;
  *(void *)(a2 + 432) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateServerRedirect.getter()
{
  uint64_t v1 = *(void *)(v0 + 424);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateServerRedirect.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 424) = a1;
  *(void *)(v2 + 432) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateServerRedirect.modify())()
{
  return nullsub_1;
}

uint64_t sub_248156C90(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a2;
  *(_OWORD *)(v2 + 40) = v3;
  *(void *)(v2 + 56) = *(void *)(a2 + 32);
  return MEMORY[0x270FA2498](sub_248156CC4, 0, 0);
}

uint64_t sub_248156CC4()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = (void *)v0[7];
  uint64_t v4 = (void *)v0[4];
  long long v3 = (void *)v0[5];
  uint64_t v6 = (void *)v0[2];
  uint64_t v5 = (void *)v0[3];
  *uint64_t v6 = v5;
  v6[1] = v4;
  v6[2] = v3;
  v6[3] = v1;
  v6[4] = v2;
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  id v7 = v5;
  id v8 = v4;
  id v9 = v3;
  id v10 = v1;
  id v11 = v2;
  return v13();
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateServerRedirect.getter()
{
  uint64_t v1 = *(void *)(v0 + 440);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateServerRedirect.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 440) = a1;
  *(void *)(v2 + 448) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processAuthenticationStateServerRedirect.modify())()
{
  return nullsub_1;
}

uint64_t sub_248156DE8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 456) = &unk_2692DC3A8;
  *(void *)(a2 + 464) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateNativeRecovery.getter()
{
  uint64_t v1 = *(void *)(v0 + 456);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateNativeRecovery.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 456) = a1;
  *(void *)(v2 + 464) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateNativeRecovery.modify())()
{
  return nullsub_1;
}

uint64_t sub_248156EE0(uint64_t a1, _OWORD *a2)
{
  *(void *)(v2 + 16) = a1;
  long long v3 = a2[1];
  *(_OWORD *)(v2 + 24) = *a2;
  *(_OWORD *)(v2 + 40) = v3;
  return MEMORY[0x270FA2498](sub_24815D594, 0, 0);
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateNativeRecovery.getter()
{
  uint64_t v1 = *(void *)(v0 + 472);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateNativeRecovery.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 472) = a1;
  *(void *)(v2 + 480) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processAuthenticationStateNativeRecovery.modify())()
{
  return nullsub_1;
}

uint64_t sub_248156F94(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 488) = &unk_2692DC388;
  *(void *)(a2 + 496) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateFidoChallenge.getter()
{
  uint64_t v1 = *(void *)(v0 + 488);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateFidoChallenge.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 488) = a1;
  *(void *)(v2 + 496) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateFidoChallenge.modify())()
{
  return nullsub_1;
}

uint64_t sub_24815708C(uint64_t a1, _OWORD *a2)
{
  *(void *)(v2 + 16) = a1;
  long long v3 = a2[1];
  *(_OWORD *)(v2 + 24) = *a2;
  *(_OWORD *)(v2 + 40) = v3;
  return MEMORY[0x270FA2498](sub_2481570B8, 0, 0);
}

uint64_t sub_2481570B8()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v2 = (void *)v0[6];
  long long v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)v0[2];
  *uint64_t v5 = v3;
  v5[1] = v4;
  v5[2] = v1;
  v5[3] = v2;
  id v11 = (uint64_t (*)(void))v0[1];
  id v6 = v3;
  id v7 = v4;
  id v8 = v1;
  id v9 = v2;
  return v11();
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateFidoChallenge.getter()
{
  uint64_t v1 = *(void *)(v0 + 504);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateFidoChallenge.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 504) = a1;
  *(void *)(v2 + 512) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processAuthenticationStateFidoChallenge.modify())()
{
  return nullsub_1;
}

uint64_t sub_2481571CC(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 520) = &unk_2692DC368;
  *(void *)(a2 + 528) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateKeepUsing.getter()
{
  uint64_t v1 = *(void *)(v0 + 520);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateKeepUsing.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 520) = a1;
  *(void *)(v2 + 528) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateKeepUsing.modify())()
{
  return nullsub_1;
}

uint64_t sub_2481572D0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a2;
  *(void *)(v2 + 40) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 48) = *(unsigned char *)(a2 + 24);
  return MEMORY[0x270FA2498](sub_248157308, 0, 0);
}

uint64_t sub_248157308()
{
  char v1 = *(unsigned char *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 16);
  long long v4 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)uint64_t v3 = v4;
  *(void *)(v3 + 16) = v2;
  *(unsigned char *)(v3 + 24) = v1;
  id v7 = *(uint64_t (**)(void))(v0 + 8);
  id v5 = (id)v4;
  swift_bridgeObjectRetain();
  return v7();
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateKeepUsing.getter()
{
  uint64_t v1 = *(void *)(v0 + 536);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateKeepUsing.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 536) = a1;
  *(void *)(v2 + 544) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processAuthenticationStateKeepUsing.modify())()
{
  return nullsub_1;
}

uint64_t sub_248157424(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 552) = &unk_2692DC348;
  *(void *)(a2 + 560) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateAlert.getter()
{
  uint64_t v1 = *(void *)(v0 + 552);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateAlert.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 552) = a1;
  *(void *)(v2 + 560) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateAlert.modify())()
{
  return nullsub_1;
}

uint64_t sub_248157528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v3 + 24) = *(_OWORD *)a3;
  *(_OWORD *)(v3 + 40) = v4;
  long long v5 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(a3 + 32);
  *(void *)(v3 + 16) = a1;
  *(_OWORD *)(v3 + 72) = v5;
  *(_OWORD *)(v3 + 88) = *(_OWORD *)(a3 + 64);
  *(unsigned char *)(v3 + 104) = *(unsigned char *)(a3 + 80);
  return MEMORY[0x270FA2498](sub_248157570, 0, 0);
}

uint64_t sub_248157570()
{
  char v1 = *(unsigned char *)(v0 + 104);
  uint64_t v3 = *(void **)(v0 + 88);
  uint64_t v2 = *(void **)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 72);
  long long v5 = *(void **)(v0 + 80);
  id v6 = *(void **)(v0 + 56);
  id v7 = *(void **)(v0 + 64);
  uint64_t v8 = *(void **)(v0 + 40);
  id v9 = *(void **)(v0 + 48);
  id v10 = *(void **)(v0 + 24);
  id v11 = *(void **)(v0 + 32);
  uint64_t v12 = *(void *)(v0 + 16);
  *(void *)uint64_t v12 = v10;
  *(void *)(v12 + 8) = v11;
  *(void *)(v12 + 16) = v8;
  *(void *)(v12 + 24) = v9;
  *(void *)(v12 + 32) = v6;
  *(void *)(v12 + 40) = v7;
  *(void *)(v12 + 48) = v4;
  *(void *)(v12 + 56) = v5;
  *(void *)(v12 + 64) = v3;
  *(void *)(v12 + 72) = v2;
  *(unsigned char *)(v12 + 80) = v1;
  sub_247F986A0(v10, v11, v8, v9, v6, v7, v4, v5, v3, v2, v1);
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateAlert.getter()
{
  uint64_t v1 = *(void *)(v0 + 568);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateAlert.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 568) = a1;
  *(void *)(v2 + 576) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processAuthenticationStateAlert.modify())()
{
  return nullsub_1;
}

uint64_t sub_248157698(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 584) = &unk_2692DC328;
  *(void *)(a2 + 592) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateLoading.getter()
{
  uint64_t v1 = *(void *)(v0 + 584);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveAuthenticationStateLoading.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 584) = a1;
  *(void *)(v2 + 592) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveAuthenticationStateLoading.modify())()
{
  return nullsub_1;
}

uint64_t sub_24815779C(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a2;
  *(_OWORD *)(v2 + 40) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v2 + 56) = *(_OWORD *)(a2 + 32);
  *(void *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 72) = v4;
  *(_OWORD *)(v2 + 88) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(v2 + 104) = *(unsigned char *)(a2 + 80);
  return MEMORY[0x270FA2498](sub_24815D590, 0, 0);
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateLoading.getter()
{
  uint64_t v1 = *(void *)(v0 + 600);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processAuthenticationStateLoading.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 600) = a1;
  *(void *)(v2 + 608) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processAuthenticationStateLoading.modify())()
{
  return nullsub_1;
}

uint64_t sub_248157874(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 616) = &unk_2692DC310;
  *(void *)(a2 + 624) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveSignInStateInitial.getter()
{
  uint64_t v1 = *(void *)(v0 + 616);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveSignInStateInitial.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 616) = a1;
  *(void *)(v2 + 624) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveSignInStateInitial.modify())()
{
  return nullsub_1;
}

uint64_t sub_248157978(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 632) = &unk_2692DC300;
  *(void *)(a2 + 640) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveSignInStateSigningIn.getter()
{
  uint64_t v1 = *(void *)(v0 + 632);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveSignInStateSigningIn.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 632) = a1;
  *(void *)(v2 + 640) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveSignInStateSigningIn.modify())()
{
  return nullsub_1;
}

uint64_t sub_248157A7C(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned __int8 *a4, int *a5)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  uint64_t v8 = *a3;
  uint64_t v9 = a3[1];
  uint64_t v10 = *a4;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)a5 + *a5);
  id v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *id v11 = v5;
  v11[1] = sub_247FD79D0;
  return v13(v6, v7, v8, v9, v10);
}

uint64_t sub_248157B7C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 648) = &unk_2692DC2E8;
  *(void *)(a2 + 656) = v5;
  return result;
}

uint64_t sub_248157BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int *a6)
{
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 40) = a4;
  *(unsigned char *)(v6 + 56) = a5;
  uint64_t v9 = (uint64_t (*)(void))((char *)a6 + *a6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v6 + 48) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_247FCD270;
  return v9();
}

uint64_t AutomaticSetupModelExchange.receiveSignInStateAlert.getter()
{
  uint64_t v1 = *(void *)(v0 + 648);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveSignInStateAlert.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 648) = a1;
  *(void *)(v2 + 656) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveSignInStateAlert.modify())()
{
  return nullsub_1;
}

uint64_t sub_248157D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24815D3D0(*(uint64_t (**)(uint64_t))(v5 + 8), v5, a5);
}

uint64_t sub_248157DBC(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned __int8 *a4, int *a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  uint64_t v8 = *a3;
  uint64_t v9 = a3[1];
  uint64_t v10 = *a4;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)a5 + *a5);
  id v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v11;
  *id v11 = v5;
  v11[1] = sub_247FBF45C;
  return v13(v6, v7, v8, v9, v10);
}

uint64_t sub_248157EC0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 664) = &unk_2692DC2C8;
  *(void *)(a2 + 672) = v5;
  return result;
}

uint64_t sub_248157F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int *a6)
{
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 40) = a4;
  *(unsigned char *)(v6 + 56) = a5;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)a6 + *a6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v6 + 48) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_248158048;
  return v9(v6 + 57, v6 + 16, v6 + 32, v6 + 56);
}

uint64_t sub_248158048()
{
  uint64_t v1 = *v0;
  uint64_t v5 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 57);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(v2);
}

uint64_t AutomaticSetupModelExchange.processSignInStateAlert.getter()
{
  uint64_t v1 = *(void *)(v0 + 664);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.processSignInStateAlert.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 664) = a1;
  *(void *)(v2 + 672) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.processSignInStateAlert.modify())()
{
  return nullsub_1;
}

uint64_t sub_2481581D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24815823C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2481582A4(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 728) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + 32;
  uint64_t v9 = v1 + v5;
  uint64_t v10 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_247FD79D0;
  return sub_2481553B8(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_2481583E4(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 680) = &unk_2692DC2A8;
  *(void *)(a2 + 688) = v5;
  return result;
}

uint64_t AutomaticSetupModelExchange.receiveSignInStateFinished.getter()
{
  uint64_t v1 = *(void *)(v0 + 680);
  swift_retain();
  return v1;
}

uint64_t AutomaticSetupModelExchange.receiveSignInStateFinished.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 680) = a1;
  *(void *)(v2 + 688) = a2;
  return result;
}

uint64_t (*AutomaticSetupModelExchange.receiveSignInStateFinished.modify())()
{
  return nullsub_1;
}

uint64_t sub_2481584E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9520);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = &v20[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  memcpy(v20, v4, sizeof(v20));
  uint64_t v14 = sub_2481753D0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  sub_2481581D0(a1, (uint64_t)&v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8]);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 728) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  memcpy(v16 + 4, v20, 0x2B8uLL);
  sub_24815823C((uint64_t)&v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8], (uint64_t)v16 + v15);
  uint64_t v17 = (void *)((char *)v16 + ((v10 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  void *v17 = a2;
  v17[1] = a3;
  sub_247FFC498((uint64_t)v20);
  swift_retain();
  sub_247FFC0C4((uint64_t)v13, (uint64_t)&unk_2692DC5A0, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_2481586E4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC598;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158754@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_248158760(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_2481587A4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC578;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158814@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_248158820(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 48) = v4;
  *(void *)(a2 + 56) = v3;
  return result;
}

uint64_t sub_248158864@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC558;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_2481588D4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_2481588E0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 80) = v4;
  *(void *)(a2 + 88) = v3;
  return result;
}

uint64_t sub_248158924@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC538;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158994@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v3 = *(void *)(a1 + 120);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC528;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158A04@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 128);
  uint64_t v3 = *(void *)(a1 + 136);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC518;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158A74@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 144);
  uint64_t v3 = *(void *)(a1 + 152);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC4F8;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158AE4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 168);
  uint64_t v3 = *(void *)(a1 + 176);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC4D8;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158B54@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 184);
  uint64_t v3 = *(void *)(a1 + 192);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_248158B60(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 184) = v4;
  *(void *)(a2 + 192) = v3;
  return result;
}

uint64_t sub_248158BA4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 200);
  uint64_t v3 = *(void *)(a1 + 208);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC4B8;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158C14@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 216);
  uint64_t v3 = *(void *)(a1 + 224);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_248158C20(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 216) = v4;
  *(void *)(a2 + 224) = v3;
  return result;
}

uint64_t sub_248158C64@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 232);
  uint64_t v3 = *(void *)(a1 + 240);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC498;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158CD4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 248);
  uint64_t v3 = *(void *)(a1 + 256);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC488;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158D44@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 264);
  uint64_t v3 = *(void *)(a1 + 272);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC478;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158DB4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 280);
  uint64_t v3 = *(void *)(a1 + 288);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC468;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158E24@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 296);
  uint64_t v3 = *(void *)(a1 + 304);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC458;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158E94@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 312);
  uint64_t v3 = *(void *)(a1 + 320);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC448;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158F04@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 328);
  uint64_t v3 = *(void *)(a1 + 336);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC438;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248158F74@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 344);
  uint64_t v3 = *(void *)(a1 + 352);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_248158F80(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 344) = v4;
  *(void *)(a2 + 352) = v3;
  return result;
}

uint64_t sub_248158FC4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 360);
  uint64_t v3 = *(void *)(a1 + 368);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC418;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248159034@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 376);
  uint64_t v3 = *(void *)(a1 + 384);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_248159040(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 376) = v4;
  *(void *)(a2 + 384) = v3;
  return result;
}

uint64_t sub_248159084@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 392);
  uint64_t v3 = *(void *)(a1 + 400);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC3F8;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_2481590F4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 408);
  uint64_t v3 = *(void *)(a1 + 416);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_248159100(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 408) = v4;
  *(void *)(a2 + 416) = v3;
  return result;
}

uint64_t sub_248159144@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 424);
  uint64_t v3 = *(void *)(a1 + 432);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC3D8;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_2481591B4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 440);
  uint64_t v3 = *(void *)(a1 + 448);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_2481591C0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 440) = v4;
  *(void *)(a2 + 448) = v3;
  return result;
}

uint64_t sub_248159204@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 456);
  uint64_t v3 = *(void *)(a1 + 464);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC3B8;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248159274@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 472);
  uint64_t v3 = *(void *)(a1 + 480);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_248159280(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 472) = v4;
  *(void *)(a2 + 480) = v3;
  return result;
}

uint64_t sub_2481592C4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 488);
  uint64_t v3 = *(void *)(a1 + 496);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_2692DC398;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248159334@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 504);
  uint64_t v3 = *(void *)(a1 + 512);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_248159340(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 504) = v4;
  *(void *)(a2 + 512) = v3;
  return result;
}

uint64_t sub_248159384@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 520);
  uint64_t v4 = *(void *)(a1 + 528);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  *a2 = &unk_2692DC378;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_2481593F8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 536);
  uint64_t v3 = *(void *)(a1 + 544);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_248159408(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 536) = v4;
  *(void *)(a2 + 544) = v3;
  return result;
}

uint64_t sub_248159450@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 552);
  uint64_t v4 = *(void *)(a1 + 560);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  *a2 = &unk_2692DC358;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_2481594C4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 568);
  uint64_t v3 = *(void *)(a1 + 576);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_2481594D4(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 568) = v4;
  *(void *)(a2 + 576) = v3;
  return result;
}

uint64_t sub_24815951C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 584);
  uint64_t v4 = *(void *)(a1 + 592);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  *a2 = &unk_2692DC338;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248159590@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 600);
  uint64_t v3 = *(void *)(a1 + 608);
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_2481595A0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 600) = v4;
  *(void *)(a2 + 608) = v3;
  return result;
}

uint64_t sub_2481595E8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 616);
  uint64_t v4 = *(void *)(a1 + 624);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  *a2 = &unk_2692DC318;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_24815965C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 632);
  uint64_t v4 = *(void *)(a1 + 640);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  *a2 = &unk_2692DC308;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_2481596D0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 648);
  uint64_t v4 = *(void *)(a1 + 656);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  *a2 = &unk_2692DC2F8;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_248159744@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 664);
  uint64_t v4 = *(void *)(a1 + 672);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  *a2 = &unk_2692DC2D8;
  a2[1] = v5;
  return swift_retain();
}

uint64_t sub_2481597B8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 680);
  uint64_t v4 = *(void *)(a1 + 688);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  *a2 = &unk_2692DC2B8;
  a2[1] = v5;
  return swift_retain();
}

uint64_t destroy for AutomaticSetupModelExchange(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AutomaticSetupModelExchange(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  uint64_t v3 = *(void *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = v3;
  long long v17 = *(_OWORD *)(a2 + 160);
  long long v4 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = v17;
  *(_OWORD *)(a1 + 176) = v4;
  long long v5 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v5;
  long long v6 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v6;
  long long v7 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v7;
  long long v8 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 304) = v8;
  long long v9 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 336) = v9;
  long long v10 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 368) = v10;
  long long v11 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 400) = v11;
  long long v12 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v12;
  long long v13 = *(_OWORD *)(a2 + 464);
  *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 464) = v13;
  long long v21 = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 496) = v21;
  long long v18 = *(_OWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 512) = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 528) = v18;
  long long v19 = *(_OWORD *)(a2 + 560);
  *(_OWORD *)(a1 + 544) = *(_OWORD *)(a2 + 544);
  *(_OWORD *)(a1 + 560) = v19;
  long long v20 = *(_OWORD *)(a2 + 592);
  *(_OWORD *)(a1 + 576) = *(_OWORD *)(a2 + 576);
  *(_OWORD *)(a1 + 592) = v20;
  long long v22 = *(_OWORD *)(a2 + 624);
  *(_OWORD *)(a1 + 608) = *(_OWORD *)(a2 + 608);
  *(_OWORD *)(a1 + 624) = v22;
  long long v23 = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 640) = *(_OWORD *)(a2 + 640);
  *(_OWORD *)(a1 + 656) = v23;
  uint64_t v14 = *(void *)(a2 + 688);
  *(_OWORD *)(a1 + 672) = *(_OWORD *)(a2 + 672);
  *(void *)(a1 + 688) = v14;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v15 = (id)v17;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AutomaticSetupModelExchange(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_retain();
  swift_release();
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_retain();
  swift_release();
  uint64_t v12 = a2[17];
  a1[16] = a2[16];
  a1[17] = v12;
  swift_retain();
  swift_release();
  uint64_t v13 = a2[19];
  a1[18] = a2[18];
  a1[19] = v13;
  swift_retain();
  swift_release();
  uint64_t v14 = (void *)a1[20];
  id v15 = (void *)a2[20];
  a1[20] = v15;
  id v16 = v15;

  uint64_t v17 = a2[22];
  a1[21] = a2[21];
  a1[22] = v17;
  swift_retain();
  swift_release();
  uint64_t v18 = a2[24];
  a1[23] = a2[23];
  a1[24] = v18;
  swift_retain();
  swift_release();
  uint64_t v19 = a2[26];
  a1[25] = a2[25];
  a1[26] = v19;
  swift_retain();
  swift_release();
  uint64_t v20 = a2[28];
  a1[27] = a2[27];
  a1[28] = v20;
  swift_retain();
  swift_release();
  uint64_t v21 = a2[30];
  a1[29] = a2[29];
  a1[30] = v21;
  swift_retain();
  swift_release();
  uint64_t v22 = a2[32];
  a1[31] = a2[31];
  a1[32] = v22;
  swift_retain();
  swift_release();
  uint64_t v23 = a2[34];
  a1[33] = a2[33];
  a1[34] = v23;
  swift_retain();
  swift_release();
  uint64_t v24 = a2[36];
  a1[35] = a2[35];
  a1[36] = v24;
  swift_retain();
  swift_release();
  uint64_t v25 = a2[38];
  a1[37] = a2[37];
  a1[38] = v25;
  swift_retain();
  swift_release();
  uint64_t v26 = a2[40];
  a1[39] = a2[39];
  a1[40] = v26;
  swift_retain();
  swift_release();
  uint64_t v27 = a2[42];
  a1[41] = a2[41];
  a1[42] = v27;
  swift_retain();
  swift_release();
  uint64_t v28 = a2[44];
  a1[43] = a2[43];
  a1[44] = v28;
  swift_retain();
  swift_release();
  uint64_t v29 = a2[46];
  a1[45] = a2[45];
  a1[46] = v29;
  swift_retain();
  swift_release();
  uint64_t v30 = a2[48];
  a1[47] = a2[47];
  a1[48] = v30;
  swift_retain();
  swift_release();
  uint64_t v31 = a2[50];
  a1[49] = a2[49];
  a1[50] = v31;
  swift_retain();
  swift_release();
  uint64_t v32 = a2[52];
  a1[51] = a2[51];
  a1[52] = v32;
  swift_retain();
  swift_release();
  uint64_t v33 = a2[54];
  a1[53] = a2[53];
  a1[54] = v33;
  swift_retain();
  swift_release();
  uint64_t v34 = a2[56];
  a1[55] = a2[55];
  a1[56] = v34;
  swift_retain();
  swift_release();
  uint64_t v35 = a2[58];
  a1[57] = a2[57];
  a1[58] = v35;
  swift_retain();
  swift_release();
  uint64_t v36 = a2[60];
  a1[59] = a2[59];
  a1[60] = v36;
  swift_retain();
  swift_release();
  uint64_t v37 = a2[62];
  a1[61] = a2[61];
  a1[62] = v37;
  swift_retain();
  swift_release();
  uint64_t v38 = a2[64];
  a1[63] = a2[63];
  a1[64] = v38;
  swift_retain();
  swift_release();
  uint64_t v39 = a2[66];
  a1[65] = a2[65];
  a1[66] = v39;
  swift_retain();
  swift_release();
  uint64_t v40 = a2[68];
  a1[67] = a2[67];
  a1[68] = v40;
  swift_retain();
  swift_release();
  uint64_t v41 = a2[70];
  a1[69] = a2[69];
  a1[70] = v41;
  swift_retain();
  swift_release();
  uint64_t v42 = a2[72];
  a1[71] = a2[71];
  a1[72] = v42;
  swift_retain();
  swift_release();
  uint64_t v43 = a2[74];
  a1[73] = a2[73];
  a1[74] = v43;
  swift_retain();
  swift_release();
  uint64_t v44 = a2[76];
  a1[75] = a2[75];
  a1[76] = v44;
  swift_retain();
  swift_release();
  uint64_t v45 = a2[78];
  a1[77] = a2[77];
  a1[78] = v45;
  swift_retain();
  swift_release();
  uint64_t v46 = a2[80];
  a1[79] = a2[79];
  a1[80] = v46;
  swift_retain();
  swift_release();
  uint64_t v47 = a2[82];
  a1[81] = a2[81];
  a1[82] = v47;
  swift_retain();
  swift_release();
  uint64_t v48 = a2[84];
  a1[83] = a2[83];
  a1[84] = v48;
  swift_retain();
  swift_release();
  uint64_t v49 = a2[86];
  a1[85] = a2[85];
  a1[86] = v49;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy696_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x2B8uLL);
}

uint64_t assignWithTake for AutomaticSetupModelExchange(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (_OWORD *)(a1 + 264);
  uint64_t v5 = (_OWORD *)(a2 + 264);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_release();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_release();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_release();
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  swift_release();
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  swift_release();
  uint64_t v6 = *(void **)(a1 + 160);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);

  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  swift_release();
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  swift_release();
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  swift_release();
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  swift_release();
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  swift_release();
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  swift_release();
  *uint64_t v4 = *v5;
  swift_release();
  v4[1] = v5[1];
  swift_release();
  v4[2] = v5[2];
  swift_release();
  v4[3] = v5[3];
  swift_release();
  v4[4] = v5[4];
  swift_release();
  v4[5] = v5[5];
  swift_release();
  v4[6] = v5[6];
  swift_release();
  v4[7] = v5[7];
  swift_release();
  v4[8] = v5[8];
  swift_release();
  v4[9] = v5[9];
  swift_release();
  v4[10] = v5[10];
  swift_release();
  v4[11] = v5[11];
  swift_release();
  v4[12] = v5[12];
  swift_release();
  v4[13] = v5[13];
  swift_release();
  v4[14] = v5[14];
  swift_release();
  v4[15] = v5[15];
  swift_release();
  v4[16] = v5[16];
  swift_release();
  v4[17] = v5[17];
  swift_release();
  v4[18] = v5[18];
  swift_release();
  v4[19] = v5[19];
  swift_release();
  v4[20] = v5[20];
  swift_release();
  v4[21] = v5[21];
  swift_release();
  v4[22] = v5[22];
  swift_release();
  v4[23] = v5[23];
  swift_release();
  v4[24] = v5[24];
  swift_release();
  v4[25] = v5[25];
  swift_release();
  v4[26] = v5[26];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AutomaticSetupModelExchange(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 696)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AutomaticSetupModelExchange(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 696) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 696) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutomaticSetupModelExchange()
{
  return &type metadata for AutomaticSetupModelExchange;
}

uint64_t sub_24815A664()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24815A700(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = ~v5;
  if (v5 > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v5 + 1) & (unint64_t)~v5) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v5 + 16) & v6));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + v5 + 1) & v6, ((unint64_t)a2 + v5 + 1) & v6);
  }
  return v3;
}

uint64_t sub_24815A7E4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
}

unsigned char *sub_24815A820(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 16))((unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

unsigned char *sub_24815A890(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 24))((unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

unsigned char *sub_24815A900(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))((unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

unsigned char *sub_24815A970(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 40))((unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t sub_24815A9E0(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0xFE) {
    unsigned int v7 = 254;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 1) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)&a1[v9];
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)&a1[v9];
      if (!*(_WORD *)&a1[v9]) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if (v5 > 0xFE) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((unint64_t)&a1[v6 + 1] & ~v6);
      }
      unsigned int v15 = *a1;
      BOOL v16 = v15 >= 2;
      int v17 = (v15 + 2147483646) & 0x7FFFFFFF;
      if (v16) {
        return (v17 + 1);
      }
      else {
        return 0;
      }
    }
  }
  int v11 = a1[v9];
  if (!a1[v9]) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *(unsigned __int16 *)a1;
        break;
      case 3:
        LODWORD(v9) = *(unsigned __int16 *)a1 | (a1[2] << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_24815AB88(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0xFE) {
    unsigned int v8 = 254;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 1) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x24815ADE0);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v7 > 0xFE)
        {
          unint64_t v18 = (unint64_t)&a1[v9 + 1] & ~v9;
          uint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(v18);
        }
        else
        {
          *a1 = a2 + 1;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for AutomaticSetupModelExchange.InternalUpdate()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24815AE20()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24815AE58()
{
  uint64_t v2 = *(int **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_247FD79D0;
  uint64_t v4 = (uint64_t (*)(int *))((char *)&dword_2692DC2A0 + dword_2692DC2A0);
  return v4(v2);
}

uint64_t sub_24815AF04(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unsigned int v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unsigned int v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC2B0 + dword_2692DC2B0);
  return v6(a1, v4);
}

uint64_t sub_24815AFBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unsigned int v12 = *(int **)(v5 + 16);
  int v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *int v13 = v6;
  v13[1] = sub_247FD77CC;
  unsigned int v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char, int *))((char *)&dword_2692DC2C0
                                                                                + dword_2692DC2C0);
  return v14(a1, a2, a3, a4, a5, v12);
}

uint64_t sub_24815B0A0(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned __int8 *a4)
{
  size_t v10 = *(int **)(v4 + 16);
  BOOL v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *BOOL v11 = v5;
  v11[1] = sub_247FD79D0;
  unsigned int v12 = (uint64_t (*)(uint64_t, uint64_t *, uint64_t *, unsigned __int8 *, int *))((char *)&dword_2692DC2D0
                                                                                        + dword_2692DC2D0);
  return v12(a1, a2, a3, a4, v10);
}

uint64_t sub_24815B180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unsigned int v12 = *(int **)(v5 + 16);
  int v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *int v13 = v6;
  v13[1] = sub_247FD79D0;
  uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char, int *))((char *)&dword_2692DC2E0
                                                                                + dword_2692DC2E0);
  return v14(a1, a2, a3, a4, a5, v12);
}

uint64_t sub_24815B264(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned __int8 *a4)
{
  size_t v10 = *(int **)(v4 + 16);
  BOOL v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *BOOL v11 = v5;
  v11[1] = sub_247FD79D0;
  unsigned int v12 = (uint64_t (*)(uint64_t, uint64_t *, uint64_t *, unsigned __int8 *, int *))((char *)&dword_2692DC2F0
                                                                                        + dword_2692DC2F0);
  return v12(a1, a2, a3, a4, v10);
}

uint64_t sub_24815B344(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC320 + dword_2692DC320);
  return v6(a1, v4);
}

uint64_t sub_24815B3F8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC330 + dword_2692DC330);
  return v8(a1, a2, v6);
}

uint64_t sub_24815B4C0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC340 + dword_2692DC340);
  return v8(a1, a2, v6);
}

uint64_t sub_24815B584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(int **)(v3 + 16);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_247FD79D0;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2692DC350 + dword_2692DC350);
  return v10(a1, a2, a3, v8);
}

uint64_t sub_24815B654(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC360 + dword_2692DC360);
  return v6(a1, v4);
}

uint64_t sub_24815B708(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC370 + dword_2692DC370);
  return v8(a1, a2, v6);
}

uint64_t sub_24815B7D0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC380 + dword_2692DC380);
  return v6(a1, v4);
}

uint64_t sub_24815B884(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC390 + dword_2692DC390);
  return v8(a1, a2, v6);
}

uint64_t sub_24815B94C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC3A0 + dword_2692DC3A0);
  return v6(a1, v4);
}

uint64_t sub_24815BA00(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC3B0 + dword_2692DC3B0);
  return v8(a1, a2, v6);
}

uint64_t sub_24815BAC8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC3C0 + dword_2692DC3C0);
  return v6(a1, v4);
}

uint64_t sub_24815BB7C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC3D0 + dword_2692DC3D0);
  return v8(a1, a2, v6);
}

uint64_t sub_24815BC44(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC3E0 + dword_2692DC3E0);
  return v6(a1, v4);
}

uint64_t sub_24815BCF8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC3F0 + dword_2692DC3F0);
  return v8(a1, a2, v6);
}

uint64_t sub_24815BDC0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC400 + dword_2692DC400);
  return v6(a1, v4);
}

uint64_t sub_24815BE74(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC410 + dword_2692DC410);
  return v8(a1, a2, v6);
}

uint64_t sub_24815BF3C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC420 + dword_2692DC420);
  return v6(a1, v4);
}

uint64_t sub_24815BFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC430 + dword_2692DC430);
  return v8(a1, a2, v6);
}

uint64_t sub_24815C0B8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC4A0 + dword_2692DC4A0);
  return v6(a1, v4);
}

uint64_t sub_24815C16C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC4B0 + dword_2692DC4B0);
  return v8(a1, a2, v6);
}

uint64_t sub_24815C234(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC4C0 + dword_2692DC4C0);
  return v6(a1, v4);
}

uint64_t sub_24815C2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FCB950;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC4D0 + dword_2692DC4D0);
  return v8(a1, a2, v6);
}

uint64_t sub_24815C3B0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247FD79D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692DC4E0 + dword_2692DC4E0);
  return v6(a1, v4);
}

uint64_t sub_24815C464(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC4F0 + dword_2692DC4F0);
  return v8(a1, a2, v6);
}

uint64_t sub_24815C52C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC500 + dword_2692DC500);
  return v8(a1, a2, v6);
}

uint64_t sub_24815C5F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(int **)(v3 + 16);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_247FD79D0;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2692DC510 + dword_2692DC510);
  return v10(a1, a2, a3, v8);
}

uint64_t sub_24815C6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC4F0 + dword_2692DC4F0);
  return v8(a1, a2, v6);
}

uint64_t sub_24815C788(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC4F0 + dword_2692DC4F0);
  return v8(a1, a2, v6);
}

uint64_t sub_24815C850(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC540 + dword_2692DC540);
  return v8(a1, a2, v6);
}

uint64_t sub_24815C914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(int **)(v3 + 16);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_247FD79D0;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2692DC550 + dword_2692DC550);
  return v10(a1, a2, a3, v8);
}

uint64_t sub_24815C9E4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC560 + dword_2692DC560);
  return v8(a1, a2, v6);
}

uint64_t sub_24815CAA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(int **)(v3 + 16);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_247FD79D0;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2692DC570 + dword_2692DC570);
  return v10(a1, a2, a3, v8);
}

uint64_t sub_24815CB78(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_247FD79D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692DC580 + dword_2692DC580);
  return v8(a1, a2, v6);
}

uint64_t sub_24815CC3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(int **)(v3 + 16);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_247FD79D0;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2692DC590 + dword_2692DC590);
  return v10(a1, a2, a3, v8);
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
  uint64_t v23 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v21 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v22 = (v23 + 728) & ~v23;
  uint64_t v2 = v0 + v22 + *(int *)(v1 + 32);
  sub_247FE51A0(*(void **)(v2 + 8), *(id *)(v2 + 16), *(void *)(v2 + 24), *(unsigned int *)(v2 + 32) | ((unint64_t)*(unsigned __int16 *)(v2 + 36) << 32));
  unsigned int v3 = *(unsigned __int8 *)(v2 + 88);
  if (v3 <= 0xF9) {
    sub_247FA98EC(*(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64), *(void *)(v2 + 72), *(void *)(v2 + 80), v3);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247FE51C8(*(void *)(v2 + 168), *(void *)(v2 + 176), *(void *)(v2 + 184), *(void *)(v2 + 192), *(void *)(v2 + 200), *(void *)(v2 + 208), *(unsigned __int8 *)(v2 + 216));
  if (*(void *)(v2 + 232))
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for SetupModel();
  uint64_t v5 = v2 + *(int *)(v4 + 32);
  uint64_t v6 = type metadata accessor for IdMSAccount();
  unsigned int v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);
  if (!v7(v5, 1, v6))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = v5 + *(int *)(v6 + 20);
    uint64_t v9 = sub_248174700();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
    uint64_t v10 = v5 + *(int *)(v6 + 24);
    sub_247FAC1EC(*(void *)v10, *(void *)(v10 + 8), *(void *)(v10 + 16), *(void *)(v10 + 24), *(void *)(v10 + 32), *(void *)(v10 + 40), *(void *)(v10 + 48), *(void *)(v10 + 56), *(void *)(v10 + 64), *(unsigned char *)(v10 + 72));
    swift_bridgeObjectRelease();
  }
  BOOL v11 = (int *)type metadata accessor for AuthenticationModel();
  if (*(void *)(v5 + v11[5] + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = v5 + v11[10];
  sub_247F98958(*(void **)v12, *(void **)(v12 + 8), *(void **)(v12 + 16), *(void **)(v12 + 24), *(void *)(v12 + 32), *(void **)(v12 + 40), *(void *)(v12 + 48), *(void *)(v12 + 56), *(void **)(v12 + 64), *(void **)(v12 + 72), *(unsigned char *)(v12 + 80));
  if (*(void *)(v5 + v11[11])) {
    swift_release();
  }
  uint64_t v13 = v2 + *(int *)(v4 + 36);
  if (!v7(v13, 1, v6))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = v13 + *(int *)(v6 + 20);
    uint64_t v15 = sub_248174700();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
    uint64_t v16 = v13 + *(int *)(v6 + 24);
    sub_247FAC1EC(*(void *)v16, *(void *)(v16 + 8), *(void *)(v16 + 16), *(void *)(v16 + 24), *(void *)(v16 + 32), *(void *)(v16 + 40), *(void *)(v16 + 48), *(void *)(v16 + 56), *(void *)(v16 + 64), *(unsigned char *)(v16 + 72));
    swift_bridgeObjectRelease();
  }
  int v17 = (int *)type metadata accessor for SignInModel();
  unint64_t v18 = (void *)(v13 + v17[5]);
  if (v18[1])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v19 = v18[11];
    if (v19 >> 60 != 15) {
      sub_247FB6CCC(v18[10], v19);
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v13 + v17[10] + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  sub_247FE52C4(*(void *)(v13 + v17[13]), *(void *)(v13 + v17[13] + 8), *(unsigned char *)(v13 + v17[13] + 16));
  swift_bridgeObjectRelease();
  if (*(void *)(v13 + v17[16] + 8) >= 3uLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v21 + v22 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v23 | 7);
}

uint64_t sub_24815D368(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_24815D3D0(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_24815D3E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SignInModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24815D444(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24815D598(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v32 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v33 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v35 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v7 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v34 = v3;
      unint64_t v8 = v7 | (v3 << 6);
      goto LABEL_25;
    }
    int64_t v9 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v9 >= v33) {
      return 1;
    }
    unint64_t v10 = *(void *)(v32 + 8 * v9);
    int64_t v11 = v3 + 1;
    if (!v10)
    {
      int64_t v11 = v3 + 2;
      if (v3 + 2 >= v33) {
        return 1;
      }
      unint64_t v10 = *(void *)(v32 + 8 * v11);
      if (!v10)
      {
        int64_t v11 = v3 + 3;
        if (v3 + 3 >= v33) {
          return 1;
        }
        unint64_t v10 = *(void *)(v32 + 8 * v11);
        if (!v10) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v6 = (v10 - 1) & v10;
    int64_t v34 = v11;
    unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
LABEL_25:
    uint64_t v13 = result;
    uint64_t v14 = *(void **)(*(void *)(result + 48) + 8 * v8);
    sub_248175160();
    sub_248175E50();
    id v15 = v14;
    sub_2481751A0();
    uint64_t v16 = sub_248175EC0();
    swift_bridgeObjectRelease();
    uint64_t v17 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v18 = v16 & ~v17;
    if (((*(void *)(v35 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      goto LABEL_40;
    }
    uint64_t v19 = sub_248175160();
    uint64_t v21 = v20;
    if (v19 == sub_248175160() && v21 == v22)
    {
LABEL_7:
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v24 = sub_248175CE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0)
      {
        uint64_t v25 = ~v17;
        while (1)
        {
          unint64_t v18 = (v18 + 1) & v25;
          if (((*(void *)(v35 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
            break;
          }
          uint64_t v26 = sub_248175160();
          uint64_t v28 = v27;
          if (v26 == sub_248175160() && v28 == v29) {
            goto LABEL_7;
          }
          char v31 = sub_248175CE0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v31) {
            goto LABEL_8;
          }
        }
LABEL_40:

        return 0;
      }
    }
LABEL_8:

    uint64_t result = v13;
    int64_t v3 = v34;
  }
  uint64_t v12 = v3 + 4;
  if (v3 + 4 >= v33) {
    return 1;
  }
  unint64_t v10 = *(void *)(v32 + 8 * v12);
  if (v10)
  {
    int64_t v11 = v3 + 4;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v11 >= v33) {
      return 1;
    }
    unint64_t v10 = *(void *)(v32 + 8 * v11);
    ++v12;
    if (v10) {
      goto LABEL_24;
    }
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_24815D8AC(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t v2 = a2;
  if (*(void *)(a1 + 16) == *(void *)(a2 + 16))
  {
    int64_t v3 = 0;
    uint64_t v4 = a1 + 56;
    uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(a1 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v36 = a2 + 56;
    uint64_t v29 = a1 + 56;
    uint64_t v30 = a1;
    int64_t v28 = v8;
    if (v7) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v12 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_53;
    }
    if (v12 < v8)
    {
      unint64_t v13 = *(void *)(v4 + 8 * v12);
      ++v3;
      if (v13) {
        goto LABEL_21;
      }
      int64_t v3 = v12 + 1;
      if (v12 + 1 < v8)
      {
        unint64_t v13 = *(void *)(v4 + 8 * v3);
        if (v13) {
          goto LABEL_21;
        }
        int64_t v3 = v12 + 2;
        if (v12 + 2 < v8)
        {
          unint64_t v13 = *(void *)(v4 + 8 * v3);
          if (v13) {
            goto LABEL_21;
          }
          int64_t v14 = v12 + 3;
          if (v14 < v8)
          {
            unint64_t v13 = *(void *)(v4 + 8 * v14);
            if (v13)
            {
              int64_t v3 = v14;
LABEL_21:
              uint64_t v10 = (v13 - 1) & v13;
              unint64_t v11 = __clz(__rbit64(v13)) + (v3 << 6);
              while (1)
              {
                uint64_t v15 = *(void *)(a1 + 48) + 96 * v11;
                uint64_t v17 = *(void *)v15;
                uint64_t v16 = *(void *)(v15 + 8);
                unint64_t v18 = *(void *)(v15 + 80);
                int v34 = *(unsigned __int8 *)(v15 + 88);
                sub_248175E50();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                sub_247FEFB98(v18);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                sub_2481751A0();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                unint64_t v31 = v10;
                int64_t v32 = v3;
                switch(v18)
                {
                  case 0uLL:
                  case 1uLL:
                  case 2uLL:
                  case 3uLL:
                    sub_248175E70();
                    break;
                  default:
                    sub_248175E70();
                    swift_bridgeObjectRetain();
                    sub_247FDE2AC((uint64_t)v37, v18);
                    sub_247FEFBA8(v18);
                    break;
                }
                sub_248175E80();
                uint64_t v19 = sub_248175EC0();
                uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
                unint64_t v21 = v19 & ~v20;
                if (((*(void *)(v36 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
                  break;
                }
                uint64_t v35 = ~v20;
                while (2)
                {
                  uint64_t v23 = *(void *)(v2 + 48) + 96 * v21;
                  unint64_t v22 = *(void *)(v23 + 80);
                  int v24 = *(unsigned __int8 *)(v23 + 88);
                  BOOL v25 = *(void *)v23 == v17 && *(void *)(v23 + 8) == v16;
                  if (!v25 && (sub_248175CE0() & 1) == 0) {
                    goto LABEL_30;
                  }
                  switch(v22)
                  {
                    case 0uLL:
                      if (v18) {
                        goto LABEL_28;
                      }
                      goto LABEL_45;
                    case 1uLL:
                      if (v18 == 1) {
                        goto LABEL_45;
                      }
                      goto LABEL_28;
                    case 2uLL:
                      if (v18 == 2) {
                        goto LABEL_45;
                      }
                      goto LABEL_28;
                    case 3uLL:
                      if (v18 != 3) {
                        goto LABEL_28;
                      }
LABEL_45:
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      sub_247FEFB98(v22);
                      sub_247FEFBA8(v22);
                      sub_247FEFBA8(v22);
                      goto LABEL_46;
                    default:
                      if (v18 < 4)
                      {
LABEL_28:
                        sub_247FEFB98(v18);
                        sub_247FEFB98(v22);
                        sub_247FEFBA8(v22);
                        unint64_t v22 = v18;
LABEL_29:
                        sub_247FEFBA8(v22);
LABEL_30:
                        unint64_t v21 = (v21 + 1) & v35;
                        if (((*(void *)(v36 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
                          goto LABEL_50;
                        }
                        continue;
                      }
                      sub_247FEFB98(v18);
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      sub_247FEFB98(v22);
                      sub_247FEFB98(v22);
                      char v26 = sub_24815D598(v22, v18);
                      sub_247FEFBA8(v22);
                      sub_247FEFBA8(v18);
                      if ((v26 & 1) == 0)
                      {
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        uint64_t v2 = a2;
                        goto LABEL_29;
                      }
LABEL_46:
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      sub_247FEFBA8(v22);
                      uint64_t v2 = a2;
                      if (v24 != v34) {
                        goto LABEL_30;
                      }
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      sub_247FEFBA8(v18);
                      uint64_t v4 = v29;
                      a1 = v30;
                      int64_t v8 = v28;
                      unint64_t v7 = v31;
                      int64_t v3 = v32;
                      if (!v31) {
                        goto LABEL_8;
                      }
LABEL_7:
                      unint64_t v9 = __clz(__rbit64(v7));
                      uint64_t v10 = (v7 - 1) & v7;
                      unint64_t v11 = v9 | (v3 << 6);
                      break;
                  }
                  break;
                }
              }
LABEL_50:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_247FEFBA8(v18);
              return 0;
            }
            while (1)
            {
              int64_t v3 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                break;
              }
              if (v3 >= v8) {
                return 1;
              }
              unint64_t v13 = *(void *)(v4 + 8 * v3);
              ++v14;
              if (v13) {
                goto LABEL_21;
              }
            }
LABEL_53:
            __break(1u);
            JUMPOUT(0x24815DE38);
          }
        }
      }
    }
    return 1;
  }
  return 0;
}

uint64_t sub_24815DE58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for IdMSAccount();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  unint64_t v7 = &v137[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = &v137[-v9];
  MEMORY[0x270FA5388](v8);
  unint64_t v13 = &v137[-v12];
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) == *(void *)(a2 + 16))
  {
    int64_t v14 = 0;
    uint64_t v15 = a1 + 56;
    uint64_t v16 = 1 << *(unsigned char *)(a1 + 32);
    if (v16 < 64) {
      uint64_t v17 = ~(-1 << v16);
    }
    else {
      uint64_t v17 = -1;
    }
    unint64_t v18 = v17 & *(void *)(a1 + 56);
    int64_t v19 = (unint64_t)(v16 + 63) >> 6;
    uint64_t v161 = a2 + 56;
    uint64_t v164 = a2;
    uint64_t v143 = a1;
    v163 = v4;
    uint64_t v142 = v11;
    v162 = v10;
    v141 = v13;
    uint64_t v140 = a1 + 56;
    int64_t v139 = v19;
    v160 = v7;
    if (v18) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_94;
    }
    if (v21 < v19)
    {
      unint64_t v22 = *(void *)(v15 + 8 * v21);
      int64_t v23 = v14 + 1;
      if (v22) {
        goto LABEL_21;
      }
      int64_t v23 = v14 + 2;
      if (v14 + 2 < v19)
      {
        unint64_t v22 = *(void *)(v15 + 8 * v23);
        if (v22) {
          goto LABEL_21;
        }
        int64_t v23 = v14 + 3;
        if (v14 + 3 < v19)
        {
          unint64_t v22 = *(void *)(v15 + 8 * v23);
          if (v22) {
            goto LABEL_21;
          }
          uint64_t v24 = v14 + 4;
          if (v14 + 4 < v19)
          {
            unint64_t v22 = *(void *)(v15 + 8 * v24);
            if (v22)
            {
              int64_t v23 = v14 + 4;
LABEL_21:
              uint64_t v144 = (v22 - 1) & v22;
              int64_t v145 = v23;
              unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
              while (1)
              {
                uint64_t v25 = *(void *)(a1 + 48);
                uint64_t v165 = *(void *)(v11 + 72);
                sub_2481713F4(v25 + v165 * v20, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for IdMSAccount);
                sub_24817145C((uint64_t)v13, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for IdMSAccount);
                sub_248175E50();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                sub_2481751A0();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                char v26 = (char *)v10 + v4[5];
                sub_248174700();
                sub_2481714C4(&qword_2692D5898, MEMORY[0x263F06A30]);
                v167 = v26;
                sub_2481750B0();
                uint64_t v27 = (char *)v10 + v4[6];
                uint64_t v28 = *(void *)v27;
                uint64_t v29 = *((void *)v27 + 1);
                uint64_t v30 = *((void *)v27 + 2);
                uint64_t v31 = *((void *)v27 + 3);
                uint64_t v33 = *((void *)v27 + 4);
                uint64_t v32 = *((void *)v27 + 5);
                uint64_t v35 = *((void *)v27 + 6);
                uint64_t v34 = *((void *)v27 + 7);
                uint64_t v36 = *((void *)v27 + 8);
                v159 = v27;
                switch(v27[72])
                {
                  case 1:
                    unint64_t v166 = v36;
                    sub_248175E70();
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    sub_2481751A0();
                    sub_248175E80();
                    if (v31)
                    {
                      swift_bridgeObjectRetain();
                      sub_2481751A0();
                      swift_bridgeObjectRelease();
                      sub_247FAC1EC(v28, v29, v30, v31, v33, v32, v35, v34, v166, 1);
                    }
                    else
                    {
                      sub_247FAC1EC(v28, v29, v30, 0, v33, v32, v35, v34, v166, 1);
                    }
                    break;
                  case 2:
                    unint64_t v166 = v35;
                    uint64_t v37 = v36;
                    sub_248175E70();
                    swift_bridgeObjectRetain();
                    sub_2481751A0();
                    sub_247FAC1EC(v28, v29, v30, v31, v33, v32, v166, v34, v37, 2);
                    break;
                  case 3:
                    sub_248175E70();
                    break;
                  default:
                    unint64_t v166 = v36;
                    sub_248175E70();
                    swift_bridgeObjectRetain();
                    sub_2481751A0();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRetain();
                    sub_2481751A0();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRetain_n();
                    swift_bridgeObjectRetain();
                    sub_2481751A0();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRetain();
                    sub_2481751A0();
                    swift_bridgeObjectRelease();
                    sub_248175EB0();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    break;
                }
                uint64_t v38 = v165;
                uint64_t v4 = v163;
                uint64_t v10 = v162;
                uint64_t v149 = v163[7];
                uint64_t v39 = *(void *)((char *)v162 + v149);
                swift_bridgeObjectRetain();
                sub_247FDE2AC((uint64_t)v168, v39);
                swift_bridgeObjectRelease();
                uint64_t v40 = sub_248175EC0();
                uint64_t v41 = v164;
                uint64_t v42 = -1 << *(unsigned char *)(v164 + 32);
                unint64_t v43 = v40 & ~v42;
                uint64_t v44 = v161;
                if (((*(void *)(v161 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43) & 1) == 0) {
                  break;
                }
                uint64_t v45 = ~v42;
                uint64_t v158 = ~v42;
                while (2)
                {
                  sub_2481713F4(*(void *)(v41 + 48) + v43 * v38, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for IdMSAccount);
                  BOOL v48 = *v7 == *v10 && v7[1] == v10[1];
                  if (!v48 && (sub_248175CE0() & 1) == 0 || (sub_2481746E0() & 1) == 0) {
                    goto LABEL_34;
                  }
                  unint64_t v166 = v43;
                  uint64_t v49 = (char *)v7 + v4[6];
                  uint64_t v51 = *(void *)v49;
                  uint64_t v50 = *((void *)v49 + 1);
                  uint64_t v52 = *((void *)v49 + 2);
                  uint64_t v53 = *((void *)v49 + 3);
                  uint64_t v54 = *((void *)v49 + 4);
                  uint64_t v55 = *((void *)v49 + 5);
                  uint64_t v56 = *((void *)v49 + 6);
                  uint64_t v57 = *((void *)v49 + 7);
                  uint64_t v58 = *((void *)v49 + 8);
                  uint64_t v59 = v49[72];
                  uint64_t v61 = *(void *)v159;
                  uint64_t v60 = *((void *)v159 + 1);
                  uint64_t v63 = *((void *)v159 + 2);
                  uint64_t v62 = *((void *)v159 + 3);
                  uint64_t v65 = *((void *)v159 + 4);
                  uint64_t v64 = *((void *)v159 + 5);
                  uint64_t v66 = *((void *)v159 + 6);
                  uint64_t v67 = *((void *)v159 + 7);
                  uint64_t v68 = *((void *)v159 + 8);
                  int v69 = v159[72];
                  v168[0] = v51;
                  v168[1] = v50;
                  v168[2] = v52;
                  v168[3] = v53;
                  v168[4] = v54;
                  v168[5] = v55;
                  v168[6] = v56;
                  v168[7] = v57;
                  v168[8] = v58;
                  char v169 = v59;
                  uint64_t v170 = v61;
                  uint64_t v171 = v60;
                  uint64_t v172 = v63;
                  uint64_t v173 = v62;
                  uint64_t v174 = v65;
                  uint64_t v175 = v64;
                  uint64_t v176 = v66;
                  uint64_t v177 = v67;
                  uint64_t v178 = v68;
                  char v179 = v69;
                  switch(v59)
                  {
                    case 1:
                      if (v69 != 1) {
                        goto LABEL_70;
                      }
                      uint64_t v152 = v68;
                      uint64_t v157 = v62;
                      uint64_t v154 = v66;
                      uint64_t v156 = v65;
                      uint64_t v153 = v67;
                      uint64_t v155 = v64;
                      if (v51 != v61 || v50 != v60)
                      {
                        uint64_t v92 = v50;
                        uint64_t v93 = v61;
                        uint64_t v151 = v52;
                        uint64_t v150 = v53;
                        uint64_t v94 = v54;
                        uint64_t v95 = v57;
                        uint64_t v96 = v56;
                        uint64_t v97 = v55;
                        char v98 = sub_248175CE0();
                        uint64_t v50 = v92;
                        uint64_t v52 = v151;
                        uint64_t v53 = v150;
                        uint64_t v54 = v94;
                        uint64_t v55 = v97;
                        uint64_t v56 = v96;
                        uint64_t v57 = v95;
                        uint64_t v61 = v93;
                        if ((v98 & 1) == 0)
                        {
                          sub_247FABF8C(v51, v92, v151, v150, v94, v97, v56, v95, v58, 1);
                          char v136 = 1;
                          uint64_t v135 = v152;
                          uint64_t v109 = v93;
LABEL_79:
                          uint64_t v110 = v60;
                          uint64_t v111 = v63;
                          uint64_t v112 = v157;
                          uint64_t v113 = v156;
                          uint64_t v114 = v155;
                          uint64_t v115 = v154;
                          uint64_t v116 = v153;
LABEL_71:
                          sub_247FABF8C(v109, v110, v111, v112, v113, v114, v115, v116, v135, v136);
                          sub_24801C154((uint64_t)v168);
                          uint64_t v41 = v164;
                          uint64_t v4 = v163;
                          uint64_t v10 = v162;
                          uint64_t v44 = v161;
                          uint64_t v38 = v165;
                          uint64_t v45 = v158;
                          unint64_t v7 = v160;
LABEL_72:
                          unint64_t v43 = v166;
                          goto LABEL_34;
                        }
                      }
                      unint64_t v7 = v160;
                      if (!v53)
                      {
                        sub_247FABF8C(v51, v50, v52, 0, v54, v55, v56, v57, v58, 1);
                        uint64_t v46 = v157;
                        sub_247FABF8C(v61, v60, v63, v157, v156, v155, v154, v153, v152, 1);
                        swift_bridgeObjectRetain();
                        sub_24801C154((uint64_t)v168);
                        uint64_t v47 = v46;
                        uint64_t v41 = v164;
                        uint64_t v4 = v163;
                        uint64_t v10 = v162;
                        uint64_t v38 = v165;
                        unint64_t v43 = v166;
                        if (!v47) {
                          goto LABEL_87;
                        }
                        swift_bridgeObjectRelease();
LABEL_33:
                        uint64_t v44 = v161;
                        uint64_t v45 = v158;
LABEL_34:
                        sub_24817150C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for IdMSAccount);
                        unint64_t v43 = (v43 + 1) & v45;
                        if (((*(void *)(v44 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43) & 1) == 0) {
                          goto LABEL_91;
                        }
                        continue;
                      }
                      uint64_t v99 = v157;
                      if (!v157)
                      {
                        sub_247FABF8C(v51, v50, v52, v53, v54, v55, v56, v57, v58, 1);
                        sub_247FABF8C(v61, v60, v63, 0, v156, v155, v154, v153, v152, 1);
LABEL_81:
                        sub_24801C154((uint64_t)v168);
LABEL_82:
                        uint64_t v41 = v164;
                        uint64_t v4 = v163;
                        uint64_t v10 = v162;
                        uint64_t v44 = v161;
                        uint64_t v38 = v165;
                        uint64_t v45 = v158;
                        goto LABEL_72;
                      }
                      uint64_t v150 = v61;
                      if (v52 != v63 || v53 != v157)
                      {
                        uint64_t v146 = v50;
                        uint64_t v128 = v52;
                        uint64_t v129 = v53;
                        uint64_t v130 = v54;
                        uint64_t v148 = v57;
                        uint64_t v147 = v56;
                        uint64_t v131 = v55;
                        int v138 = sub_248175CE0();
                        sub_247FABF8C(v51, v146, v128, v129, v130, v131, v147, v148, v58, 1);
                        sub_247FABF8C(v150, v60, v63, v99, v156, v155, v154, v153, v152, 1);
                        sub_24801C154((uint64_t)v168);
                        uint64_t v41 = v164;
                        uint64_t v4 = v163;
                        uint64_t v10 = v162;
                        uint64_t v38 = v165;
                        unint64_t v43 = v166;
                        if (v138) {
                          goto LABEL_87;
                        }
                        goto LABEL_33;
                      }
                      uint64_t v100 = v51;
                      uint64_t v101 = v52;
                      uint64_t v102 = v53;
                      sub_247FABF8C(v100, v50, v52, v53, v54, v55, v56, v57, v58, 1);
                      sub_247FABF8C(v150, v60, v101, v102, v156, v155, v154, v153, v152, 1);
LABEL_73:
                      sub_24801C154((uint64_t)v168);
                      uint64_t v41 = v164;
                      uint64_t v4 = v163;
                      uint64_t v10 = v162;
                      uint64_t v38 = v165;
                      unint64_t v7 = v160;
                      unint64_t v43 = v166;
LABEL_87:
                      char v132 = sub_24815D598(*(void *)((char *)v7 + v4[7]), *(void *)((char *)v10 + v149));
                      uint64_t v44 = v161;
                      uint64_t v45 = v158;
                      if ((v132 & 1) == 0) {
                        goto LABEL_34;
                      }
                      sub_24817150C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for IdMSAccount);
                      sub_24817150C((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for IdMSAccount);
                      a1 = v143;
                      uint64_t v11 = v142;
                      unint64_t v13 = v141;
                      uint64_t v15 = v140;
                      int64_t v19 = v139;
                      int64_t v14 = v145;
                      unint64_t v18 = v144;
                      if (!v144) {
                        goto LABEL_8;
                      }
LABEL_7:
                      uint64_t v144 = (v18 - 1) & v18;
                      int64_t v145 = v14;
                      unint64_t v20 = __clz(__rbit64(v18)) | (v14 << 6);
                      break;
                    case 2:
                      if (v69 != 2) {
                        goto LABEL_70;
                      }
                      uint64_t v152 = v68;
                      uint64_t v157 = v62;
                      uint64_t v154 = v66;
                      uint64_t v156 = v65;
                      uint64_t v153 = v67;
                      uint64_t v155 = v64;
                      if (v51 == v61 && v50 == v60)
                      {
                        uint64_t v103 = v50;
                        sub_247FABF8C(v51, v50, v52, v53, v54, v55, v56, v57, v58, 2);
                        sub_247FABF8C(v51, v103, v63, v157, v156, v155, v154, v153, v152, 2);
                        goto LABEL_73;
                      }
                      uint64_t v117 = v50;
                      uint64_t v118 = v61;
                      uint64_t v119 = v52;
                      uint64_t v120 = v53;
                      uint64_t v121 = v54;
                      uint64_t v148 = v57;
                      uint64_t v147 = v56;
                      uint64_t v122 = v55;
                      LODWORD(v150) = sub_248175CE0();
                      sub_247FABF8C(v51, v117, v119, v120, v121, v122, v147, v148, v58, 2);
                      sub_247FABF8C(v118, v60, v63, v157, v156, v155, v154, v153, v152, 2);
                      sub_24801C154((uint64_t)v168);
                      uint64_t v41 = v164;
                      uint64_t v4 = v163;
                      uint64_t v10 = v162;
                      uint64_t v38 = v165;
                      unint64_t v7 = v160;
                      unint64_t v43 = v166;
                      if (v150) {
                        goto LABEL_87;
                      }
                      goto LABEL_33;
                    case 3:
                      if (v69 != 3 || v60 | v61 | v63 | v62 | v65 | v64 | v66 | v67 | v68) {
                        goto LABEL_70;
                      }
                      goto LABEL_73;
                    default:
                      if (v69)
                      {
LABEL_70:
                        uint64_t v134 = v58;
                        uint64_t v104 = v64;
                        uint64_t v105 = v63;
                        uint64_t v106 = v68;
                        uint64_t v107 = v51;
                        uint64_t v108 = v62;
                        sub_247FABF8C(v107, v50, v52, v53, v54, v55, v56, v57, v134, v59);
                        char v136 = v69;
                        uint64_t v135 = v106;
                        uint64_t v109 = v61;
                        uint64_t v110 = v60;
                        uint64_t v111 = v105;
                        uint64_t v112 = v108;
                        uint64_t v113 = v65;
                        uint64_t v114 = v104;
                        uint64_t v115 = v66;
                        uint64_t v116 = v67;
                        goto LABEL_71;
                      }
                      uint64_t v152 = v68;
                      uint64_t v157 = v62;
                      uint64_t v154 = v66;
                      uint64_t v156 = v65;
                      uint64_t v153 = v67;
                      uint64_t v155 = v64;
                      uint64_t v150 = v61;
                      uint64_t v151 = v52;
                      if (v51 != v61 || v50 != v60)
                      {
                        uint64_t v70 = v50;
                        uint64_t v71 = v53;
                        uint64_t v72 = v54;
                        uint64_t v73 = v57;
                        uint64_t v74 = v56;
                        uint64_t v75 = v55;
                        char v76 = sub_248175CE0();
                        uint64_t v50 = v70;
                        uint64_t v52 = v151;
                        uint64_t v53 = v71;
                        uint64_t v54 = v72;
                        uint64_t v55 = v75;
                        uint64_t v56 = v74;
                        uint64_t v57 = v73;
                        if ((v76 & 1) == 0)
                        {
                          sub_247FABF8C(v51, v70, v151, v71, v72, v75, v74, v73, v58, 0);
                          char v136 = 0;
                          uint64_t v135 = v152;
                          uint64_t v109 = v150;
                          goto LABEL_79;
                        }
                      }
                      unint64_t v7 = v160;
                      uint64_t v146 = v50;
                      if (v52 != v63 || v53 != v157)
                      {
                        uint64_t v77 = v53;
                        uint64_t v78 = v54;
                        uint64_t v79 = v57;
                        uint64_t v80 = v56;
                        uint64_t v81 = v55;
                        char v82 = sub_248175CE0();
                        uint64_t v50 = v146;
                        uint64_t v52 = v151;
                        uint64_t v53 = v77;
                        uint64_t v54 = v78;
                        uint64_t v55 = v81;
                        uint64_t v56 = v80;
                        uint64_t v57 = v79;
                        if ((v82 & 1) == 0) {
                          goto LABEL_77;
                        }
                      }
                      if (v54 != v156 || v55 != v155)
                      {
                        uint64_t v83 = v53;
                        uint64_t v84 = v54;
                        uint64_t v85 = v57;
                        uint64_t v86 = v56;
                        uint64_t v87 = v55;
                        char v88 = sub_248175CE0();
                        uint64_t v50 = v146;
                        uint64_t v52 = v151;
                        uint64_t v53 = v83;
                        uint64_t v54 = v84;
                        uint64_t v55 = v87;
                        uint64_t v56 = v86;
                        uint64_t v57 = v85;
                        if ((v88 & 1) == 0)
                        {
LABEL_77:
                          sub_247FABF8C(v51, v50, v52, v53, v54, v55, v56, v57, v58, 0);
                          sub_247FABF8C(v150, v60, v63, v157, v156, v155, v154, v153, v152, 0);
                          goto LABEL_81;
                        }
                      }
                      if (v56 == v154 && v57 == v153)
                      {
                        uint64_t v89 = v56;
                        uint64_t v90 = v57;
                        sub_247FABF8C(v51, v50, v52, v53, v54, v55, v56, v57, v58, 0);
                        uint64_t v91 = v152;
                        sub_247FABF8C(v150, v60, v63, v157, v156, v155, v89, v90, v152, 0);
                        sub_24801C154((uint64_t)v168);
                      }
                      else
                      {
                        uint64_t v123 = v52;
                        uint64_t v124 = v153;
                        uint64_t v125 = v53;
                        uint64_t v126 = v54;
                        uint64_t v148 = v57;
                        uint64_t v147 = v56;
                        uint64_t v127 = v55;
                        int v138 = sub_248175CE0();
                        sub_247FABF8C(v51, v146, v123, v125, v126, v127, v147, v148, v58, 0);
                        uint64_t v91 = v152;
                        sub_247FABF8C(v150, v60, v63, v157, v156, v155, v154, v124, v152, 0);
                        sub_24801C154((uint64_t)v168);
                        if ((v138 & 1) == 0) {
                          goto LABEL_82;
                        }
                      }
                      uint64_t v41 = v164;
                      uint64_t v4 = v163;
                      uint64_t v10 = v162;
                      uint64_t v38 = v165;
                      unint64_t v43 = v166;
                      if (v58 == v91) {
                        goto LABEL_87;
                      }
                      goto LABEL_33;
                  }
                  break;
                }
              }
LABEL_91:
              sub_24817150C((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for IdMSAccount);
              return 0;
            }
            while (1)
            {
              int64_t v23 = v24 + 1;
              if (__OFADD__(v24, 1)) {
                break;
              }
              if (v23 >= v19) {
                return 1;
              }
              unint64_t v22 = *(void *)(v15 + 8 * v23);
              ++v24;
              if (v22) {
                goto LABEL_21;
              }
            }
LABEL_94:
            __break(1u);
            JUMPOUT(0x24815F1B4);
          }
        }
      }
    }
    return 1;
  }
  return 0;
}

uint64_t static SetupError.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v85 = *(void *)(a1 + 40);
  uint64_t v86 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v87 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  int v11 = *(unsigned __int8 *)(a2 + 48);
  switch(*(unsigned char *)(a1 + 48))
  {
    case 1:
      if (v11 != 1) {
        goto LABEL_46;
      }
      uint64_t v81 = *(void *)(a2 + 16);
      uint64_t v75 = *(void *)(a2 + 32);
      uint64_t v20 = *(void *)(a1 + 32);
      sub_247FA9804(v6, v7, v81, v87, v9, v10, 1);
      sub_247FA9804(v3, v2, v4, v86, v20, v85, 1);
      char v78 = sub_24815D598(v3, v6);
      sub_247FA98EC(v3, v2, v4, v86, v20, v85, 1);
      sub_247FA98EC(v6, v7, v81, v87, v75, v10, 1);
      return v78 & 1;
    case 2:
      if (v11 != 2) {
        goto LABEL_46;
      }
      uint64_t v95 = *(void *)a1;
      uint64_t v96 = v2;
      uint64_t v97 = v4;
      uint64_t v98 = v86;
      uint64_t v99 = v5;
      uint64_t v100 = v85;
      uint64_t v88 = v6;
      uint64_t v89 = v7;
      uint64_t v90 = v8;
      uint64_t v91 = v87;
      uint64_t v92 = v9;
      uint64_t v93 = v10;
      uint64_t v76 = v9;
      uint64_t v22 = v9;
      uint64_t v79 = v5;
      char v23 = _s12AppleIDSetup15UserProfileInfoV2eeoiySbAC_ACtFZ_0(&v95, &v88);
      uint64_t v24 = v8;
      uint64_t v82 = v8;
      char v19 = v23;
      sub_247FA9804(v6, v7, v24, v87, v22, v10, 2);
      sub_247FA9804(v3, v2, v4, v86, v79, v85, 2);
      sub_247FA98EC(v3, v2, v4, v86, v79, v85, 2);
      sub_247FA98EC(v6, v7, v82, v87, v76, v10, 2);
      return v19 & 1;
    case 3:
      if (v11 != 3) {
        goto LABEL_46;
      }
      uint64_t v60 = *(void *)(v3 + 24);
      uint64_t v61 = *(void *)(v3 + 32);
      uint64_t v62 = *(void *)(v3 + 40);
      uint64_t v63 = *(void *)(v3 + 48);
      uint64_t v64 = *(void *)(v3 + 56);
      char v25 = *(unsigned char *)(v3 + 64);
      uint64_t v68 = *(void *)(v3 + 72);
      uint64_t v69 = *(void *)(v3 + 80);
      uint64_t v70 = *(void *)(v3 + 88);
      uint64_t v71 = *(void *)(v3 + 96);
      uint64_t v72 = *(void *)(v3 + 104);
      uint64_t v73 = *(void *)(v3 + 112);
      char v74 = *(unsigned char *)(v3 + 120);
      uint64_t v57 = *(void *)(v6 + 24);
      uint64_t v58 = *(void *)(v6 + 16);
      uint64_t v55 = *(void *)(v6 + 40);
      uint64_t v56 = *(void *)(v6 + 32);
      uint64_t v53 = *(void *)(v6 + 56);
      uint64_t v54 = *(void *)(v6 + 48);
      char v26 = *(unsigned char *)(v6 + 64);
      uint64_t v49 = *(void *)(v6 + 72);
      uint64_t v52 = *(void *)(v6 + 80);
      uint64_t v51 = *(void *)(v6 + 88);
      uint64_t v50 = *(void *)(v6 + 96);
      uint64_t v67 = *(void *)(v6 + 104);
      uint64_t v66 = *(void *)(v6 + 112);
      char v65 = *(unsigned char *)(v6 + 120);
      uint64_t v95 = *(void *)(v3 + 16);
      uint64_t v59 = v95;
      uint64_t v96 = v60;
      uint64_t v97 = v61;
      uint64_t v98 = v62;
      uint64_t v99 = v63;
      uint64_t v100 = v64;
      char v101 = v25;
      uint64_t v88 = v58;
      uint64_t v89 = v57;
      uint64_t v90 = v56;
      uint64_t v91 = v55;
      uint64_t v92 = v54;
      uint64_t v93 = v53;
      char v94 = v26;
      uint64_t v27 = v5;
      uint64_t v77 = v9;
      sub_247FA9804(v6, v7, v8, v87, v9, v10, 3);
      sub_247FA9804(v3, v2, v4, v86, v27, v85, 3);
      sub_247FA9804(v95, v60, v61, v62, v63, v64, v25);
      sub_247FA9804(v58, v57, v56, v55, v54, v53, v26);
      sub_247FA9804(v68, v69, v70, v71, v72, v73, v74);
      sub_247FA9804(v49, v52, v51, v50, v67, v66, v65);
      if (static SetupError.== infix(_:_:)(&v95, &v88))
      {
        uint64_t v95 = v68;
        uint64_t v96 = v69;
        uint64_t v97 = v70;
        uint64_t v98 = v71;
        uint64_t v99 = v72;
        uint64_t v100 = v73;
        char v101 = v74;
        uint64_t v88 = v49;
        uint64_t v89 = v52;
        uint64_t v90 = v51;
        uint64_t v91 = v50;
        uint64_t v92 = v67;
        uint64_t v93 = v66;
        char v94 = v65;
        uint64_t v83 = v8;
        char v19 = static SetupError.== infix(_:_:)(&v95, &v88);
        sub_247FA98EC(v58, v57, v56, v55, v54, v53, v26);
        sub_247FA98EC(v59, v60, v61, v62, v63, v64, v25);
        sub_247FA98EC(v49, v52, v51, v50, v67, v66, v65);
        sub_247FA98EC(v68, v69, v70, v71, v72, v73, v74);
        sub_247FA98EC(v3, v2, v4, v86, v27, v85, 3);
        sub_247FA98EC(v6, v7, v83, v87, v77, v10, 3);
        return v19 & 1;
      }
      sub_247FA98EC(v49, v52, v51, v50, v67, v66, v65);
      sub_247FA98EC(v68, v69, v70, v71, v72, v73, v74);
      sub_247FA98EC(v58, v57, v56, v55, v54, v53, v26);
      sub_247FA98EC(v59, v60, v61, v62, v63, v64, v25);
      sub_247FA98EC(v3, v2, v4, v86, v27, v85, 3);
      uint64_t v32 = v6;
      uint64_t v33 = v7;
      uint64_t v34 = v8;
      uint64_t v35 = v87;
      uint64_t v37 = v10;
      uint64_t v36 = v77;
      char v38 = 3;
      goto LABEL_47;
    case 4:
      if (!(v4 | v2 | v3 | v86 | v5 | v85))
      {
        if (v11 != 4 || v8 | v7 | v6 | v87 | v9 | v10) {
          goto LABEL_46;
        }
        uint64_t v30 = *(void *)(a2 + 32);
        sub_247FA98EC(0, 0, 0, v86, v5, v85, 4);
        uint64_t v31 = 0;
LABEL_45:
        sub_247FA98EC(v31, 0, 0, v87, v30, v10, 4);
        char v19 = 1;
        return v19 & 1;
      }
      uint64_t v28 = v4 | v2 | v86 | v5 | v85;
      if (v3 != 1 || v28)
      {
        if (v3 != 2 || v28)
        {
          if (v3 != 3 || v28)
          {
            if (v11 != 4 || v6 != 4 || v8 | v7 | v87 | v9 | v10) {
              goto LABEL_46;
            }
            uint64_t v30 = *(void *)(a2 + 32);
            sub_247FA98EC(4, 0, 0, v86, v5, v85, 4);
            uint64_t v31 = 4;
          }
          else
          {
            if (v11 != 4 || v6 != 3 || v8 | v7 | v87 | v9 | v10) {
              goto LABEL_46;
            }
            uint64_t v30 = *(void *)(a2 + 32);
            sub_247FA98EC(3, 0, 0, v86, v5, v85, 4);
            uint64_t v31 = 3;
          }
        }
        else
        {
          if (v11 != 4 || v6 != 2 || v8 | v7 | v87 | v9 | v10) {
            goto LABEL_46;
          }
          uint64_t v30 = *(void *)(a2 + 32);
          sub_247FA98EC(2, 0, 0, v86, v5, v85, 4);
          uint64_t v31 = 2;
        }
        goto LABEL_45;
      }
      if (v11 == 4 && v6 == 1 && !(v8 | v7 | v87 | v9 | v10))
      {
        char v19 = 1;
        uint64_t v29 = *(void *)(a2 + 32);
        sub_247FA98EC(1, 0, 0, v86, v5, v85, 4);
        sub_247FA98EC(1, 0, 0, v87, v29, v10, 4);
        return v19 & 1;
      }
LABEL_46:
      uint64_t v41 = *(void *)(a1 + 32);
      uint64_t v80 = *(void *)a2;
      uint64_t v84 = *(void *)(a2 + 16);
      uint64_t v42 = *(void *)(a2 + 32);
      char v43 = *(unsigned char *)(a1 + 48);
      char v44 = *(unsigned char *)(a2 + 48);
      sub_247FA9804(*(void *)a2, v7, v84, v87, v9, v10, v11);
      sub_247FA9804(v3, v2, v4, v86, v41, v85, v43);
      sub_247FA98EC(v3, v2, v4, v86, v41, v85, v43);
      uint64_t v32 = v80;
      uint64_t v33 = v7;
      uint64_t v34 = v84;
      uint64_t v35 = v87;
      uint64_t v36 = v42;
      uint64_t v37 = v10;
      char v38 = v44;
LABEL_47:
      sub_247FA98EC(v32, v33, v34, v35, v36, v37, v38);
      char v19 = 0;
      return v19 & 1;
    default:
      if (*(unsigned char *)(a2 + 48)) {
        goto LABEL_46;
      }
      if (v3 != v6 || v2 != v7)
      {
        uint64_t v12 = *(void *)(a2 + 16);
        uint64_t v13 = *(void *)(a2 + 32);
        uint64_t v48 = *(void *)(a1 + 8);
        uint64_t v14 = *(void *)a1;
        uint64_t v15 = *(void *)(a1 + 32);
        char v16 = sub_248175CE0();
        uint64_t v5 = v15;
        uint64_t v3 = v14;
        uint64_t v2 = v48;
        uint64_t v9 = v13;
        uint64_t v8 = v12;
        if ((v16 & 1) == 0) {
          goto LABEL_34;
        }
      }
      if (v4 != v8)
      {
LABEL_34:
        uint64_t v39 = v9;
        uint64_t v40 = v5;
        sub_247FA9804(v6, v7, v8, v87, v9, v10, 0);
        sub_247FA9804(v3, v2, v4, v86, v40, v85, 0);
        sub_247FA98EC(v3, v2, v4, v86, v40, v85, 0);
        uint64_t v32 = v6;
        uint64_t v33 = v7;
        uint64_t v34 = v8;
        uint64_t v35 = v87;
        uint64_t v36 = v39;
        uint64_t v37 = v10;
        char v38 = 0;
        goto LABEL_47;
      }
      if (v86 == v87 && v5 == v9)
      {
        uint64_t v17 = v3;
        uint64_t v18 = v5;
        char v19 = 1;
      }
      else
      {
        uint64_t v17 = v3;
        uint64_t v18 = v5;
        uint64_t v45 = v9;
        char v46 = sub_248175CE0();
        uint64_t v9 = v45;
        char v19 = v46;
      }
      uint64_t v47 = v9;
      sub_247FA9804(v6, v7, v4, v87, v9, v10, 0);
      sub_247FA9804(v17, v2, v4, v86, v18, v85, 0);
      sub_247FA98EC(v17, v2, v4, v86, v18, v85, 0);
      sub_247FA98EC(v6, v7, v4, v87, v47, v10, 0);
      return v19 & 1;
  }
}

void sub_24815FBAC(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  int v4 = *(unsigned __int8 *)(v1 + 48);
  if (v4 != 1)
  {
    uint64_t v6 = *(void *)(v1 + 8);
    uint64_t v5 = *(void *)(v1 + 16);
    uint64_t v8 = *(void *)(v1 + 24);
    uint64_t v7 = *(void *)(v1 + 32);
    uint64_t v9 = *(void *)(v1 + 40);
    if (v4 == 4)
    {
      uint64_t v10 = v5 | v6 | v8 | v7 | v9;
      if (v3 == 1 && v10 == 0)
      {
        uint64_t v13 = 1;
        goto LABEL_25;
      }
      if (v3 == 2 && v10 == 0)
      {
        uint64_t v13 = 2;
        goto LABEL_25;
      }
      if (v3 == 4 && !v10)
      {
        uint64_t v13 = 3;
LABEL_25:
        *(void *)a1 = v13;
        *(_OWORD *)(a1 + 8) = 0u;
        *(_OWORD *)(a1 + 24) = 0u;
        char v19 = 4;
LABEL_26:
        *(unsigned char *)(a1 + 40) = v19;
        return;
      }
    }
    if (qword_26B13B728 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_248174B90();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B13B730);
    sub_247FA9804(v3, v6, v5, v8, v7, v9, v4);
    sub_247FA9804(v3, v6, v5, v8, v7, v9, v4);
    uint64_t v15 = sub_248174B70();
    os_log_type_t v16 = sub_2481755C0();
    if (os_log_type_enabled(v15, v16))
    {
      os_log_type_t type = v16;
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      int64_t v21 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      sub_247FE1388();
      swift_allocError();
      *(void *)uint64_t v18 = v3;
      *(void *)(v18 + 8) = v6;
      *(void *)(v18 + 16) = v5;
      *(void *)(v18 + 24) = v8;
      *(void *)(v18 + 32) = v7;
      *(void *)(v18 + 40) = v9;
      *(unsigned char *)(v18 + 48) = v4;
      sub_247FA9804(v3, v6, v5, v8, v7, v9, v4);
      uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
      sub_248175730();
      void *v21 = v22;
      sub_247FA98EC(v3, v6, v5, v8, v7, v9, v4);
      sub_247FA98EC(v3, v6, v5, v8, v7, v9, v4);
      _os_log_impl(&dword_247F93000, v15, type, "Could not convert SetupError: %@ into RepairError", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692D96F0);
      swift_arrayDestroy();
      MEMORY[0x24C574E00](v21, -1, -1);
      MEMORY[0x24C574E00](v17, -1, -1);
    }
    else
    {
      sub_247FA98EC(v3, v6, v5, v8, v7, v9, v4);
      sub_247FA98EC(v3, v6, v5, v8, v7, v9, v4);
    }

    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    char v19 = -1;
    goto LABEL_26;
  }
  *(void *)a1 = v3;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(unsigned char *)(a1 + 40) = 2;
  swift_bridgeObjectRetain();
}

uint64_t MachSetupMessage.hash(into:)(long long *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9840);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SetupModel();
  MEMORY[0x270FA5388](v9);
  int v11 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for MachSetupMessage();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (void *)((char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2481713F4(v1, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v19 = *v14;
      *(void *)&long long v72 = v14[1];
      uint64_t v20 = v14[2];
      *(void *)&long long v71 = v14[3];
      uint64_t v21 = v14[4];
      uint64_t v22 = v14[5];
      uint64_t v23 = v14[6];
      uint64_t v24 = v14[7];
      uint64_t v26 = v14[8];
      uint64_t v25 = v14[9];
      sub_248175E70();
      *(void *)&long long v73 = v19;
      *((void *)&v73 + 1) = v72;
      *(void *)&long long v74 = v20;
      *((void *)&v74 + 1) = v71;
      *(void *)&long long v75 = v21;
      *((void *)&v75 + 1) = v22;
      *(void *)&long long v76 = v23;
      *((void *)&v76 + 1) = v24;
      *(void *)&long long v77 = v26;
      *((void *)&v77 + 1) = v25;
      SetupReport.hash(into:)((uint64_t)a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_247FF6BFC(v22, v23);
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 2u:
      sub_247FE06A4((uint64_t)v14, (uint64_t)v8, &qword_2692D9830);
      sub_248175E70();
      sub_248175EB0();
      sub_248175E80();
      uint64_t v28 = &v8[*(int *)(v6 + 32)];
      sub_248175E70();
      uint64_t v29 = *((void *)v28 + 3);
      int v30 = *((_DWORD *)v28 + 8);
      __int16 v31 = *((_WORD *)v28 + 18);
      long long v73 = *(_OWORD *)(v28 + 8);
      *(void *)&long long v74 = v29;
      WORD6(v74) = v31;
      DWORD2(v74) = v30;
      SetupModel.RemoteRole.hash(into:)();
      char v32 = v28[88];
      switch(v32)
      {
        case -6:
        case -5:
        case -4:
        case -3:
        case -2:
        case -1:
          sub_248175E70();
          break;
        default:
          uint64_t v54 = *((void *)v28 + 9);
          uint64_t v53 = *((void *)v28 + 10);
          long long v72 = *(_OWORD *)(v28 + 56);
          long long v71 = *(_OWORD *)(v28 + 40);
          sub_248175E70();
          long long v73 = v71;
          long long v74 = v72;
          *(void *)&long long v75 = v54;
          *((void *)&v75 + 1) = v53;
          LOBYTE(v76) = v32;
          SetupError.hash(into:)((uint64_t)a1);
          break;
      }
      long long v55 = *((_OWORD *)v28 + 15);
      long long v81 = *((_OWORD *)v28 + 14);
      long long v82 = v55;
      long long v56 = *((_OWORD *)v28 + 17);
      long long v83 = *((_OWORD *)v28 + 16);
      long long v84 = v56;
      long long v57 = *((_OWORD *)v28 + 11);
      long long v77 = *((_OWORD *)v28 + 10);
      long long v78 = v57;
      long long v58 = *((_OWORD *)v28 + 13);
      long long v79 = *((_OWORD *)v28 + 12);
      long long v80 = v58;
      long long v59 = *((_OWORD *)v28 + 7);
      long long v73 = *((_OWORD *)v28 + 6);
      long long v74 = v59;
      long long v60 = *((_OWORD *)v28 + 9);
      long long v75 = *((_OWORD *)v28 + 8);
      long long v76 = v60;
      DiscoveryModel.hash(into:)(a1);
      AuthenticationModel.hash(into:)((uint64_t)a1);
      SignInModel.hash(into:)((uint64_t)a1);
      *(void *)&long long v73 = *(void *)&v8[*(int *)(v6 + 36)];
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5C00);
      sub_247FEFBB8();
      sub_2481750B0();
      uint64_t v61 = &qword_2692D9830;
      uint64_t v62 = (uint64_t)v8;
      goto LABEL_17;
    case 3u:
      sub_247FE06A4((uint64_t)v14, (uint64_t)v5, &qword_2692D9840);
      sub_248175E70();
      sub_248175EB0();
      sub_248175EB0();
      uint64_t v33 = &v5[*(int *)(v3 + 32)];
      sub_248175E70();
      uint64_t v34 = *((void *)v33 + 3);
      int v35 = *((_DWORD *)v33 + 8);
      __int16 v36 = *((_WORD *)v33 + 18);
      long long v73 = *(_OWORD *)(v33 + 8);
      *(void *)&long long v74 = v34;
      WORD6(v74) = v36;
      DWORD2(v74) = v35;
      SetupModel.RemoteRole.hash(into:)();
      char v37 = v33[88];
      switch(v37)
      {
        case -6:
        case -5:
        case -4:
        case -3:
        case -2:
        case -1:
          sub_248175E70();
          break;
        default:
          uint64_t v64 = *((void *)v33 + 9);
          uint64_t v63 = *((void *)v33 + 10);
          long long v72 = *(_OWORD *)(v33 + 56);
          long long v71 = *(_OWORD *)(v33 + 40);
          sub_248175E70();
          long long v73 = v71;
          long long v74 = v72;
          *(void *)&long long v75 = v64;
          *((void *)&v75 + 1) = v63;
          LOBYTE(v76) = v37;
          SetupError.hash(into:)((uint64_t)a1);
          break;
      }
      long long v65 = *((_OWORD *)v33 + 15);
      long long v81 = *((_OWORD *)v33 + 14);
      long long v82 = v65;
      long long v66 = *((_OWORD *)v33 + 17);
      long long v83 = *((_OWORD *)v33 + 16);
      long long v84 = v66;
      long long v67 = *((_OWORD *)v33 + 11);
      long long v77 = *((_OWORD *)v33 + 10);
      long long v78 = v67;
      long long v68 = *((_OWORD *)v33 + 13);
      long long v79 = *((_OWORD *)v33 + 12);
      long long v80 = v68;
      long long v69 = *((_OWORD *)v33 + 7);
      long long v73 = *((_OWORD *)v33 + 6);
      long long v74 = v69;
      long long v70 = *((_OWORD *)v33 + 9);
      long long v75 = *((_OWORD *)v33 + 8);
      long long v76 = v70;
      DiscoveryModel.hash(into:)(a1);
      AuthenticationModel.hash(into:)((uint64_t)a1);
      SignInModel.hash(into:)((uint64_t)a1);
      uint64_t v61 = &qword_2692D9840;
      uint64_t v62 = (uint64_t)v5;
LABEL_17:
      uint64_t result = sub_247FB33D4(v62, v61);
      break;
    case 4u:
      uint64_t v38 = *v14;
      uint64_t v39 = v14[1];
      uint64_t v40 = v14[2];
      uint64_t v41 = v14[3];
      uint64_t v42 = v14[4];
      uint64_t v43 = v14[5];
      char v44 = *((unsigned char *)v14 + 48);
      sub_248175E70();
      *(void *)&long long v73 = v38;
      *((void *)&v73 + 1) = v39;
      *(void *)&long long v74 = v40;
      *((void *)&v74 + 1) = v41;
      *(void *)&long long v75 = v42;
      *((void *)&v75 + 1) = v43;
      LOBYTE(v76) = v44;
      SetupError.hash(into:)((uint64_t)a1);
      uint64_t result = sub_247FA98EC(v38, v39, v40, v41, v42, v43, v44);
      break;
    case 5u:
      uint64_t result = sub_248175E70();
      break;
    default:
      sub_24817145C((uint64_t)v14, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for SetupModel);
      sub_248175E70();
      sub_248175E70();
      uint64_t v15 = *((void *)v11 + 3);
      int v16 = *((_DWORD *)v11 + 8);
      __int16 v17 = *((_WORD *)v11 + 18);
      long long v73 = *(_OWORD *)(v11 + 8);
      *(void *)&long long v74 = v15;
      WORD6(v74) = v17;
      DWORD2(v74) = v16;
      SetupModel.RemoteRole.hash(into:)();
      char v18 = v11[88];
      switch(v18)
      {
        case -6:
        case -5:
        case -4:
        case -3:
        case -2:
        case -1:
          sub_248175E70();
          break;
        default:
          uint64_t v46 = *((void *)v11 + 9);
          uint64_t v45 = *((void *)v11 + 10);
          long long v72 = *(_OWORD *)(v11 + 56);
          long long v71 = *(_OWORD *)(v11 + 40);
          sub_248175E70();
          long long v73 = v71;
          long long v74 = v72;
          *(void *)&long long v75 = v46;
          *((void *)&v75 + 1) = v45;
          LOBYTE(v76) = v18;
          SetupError.hash(into:)((uint64_t)a1);
          break;
      }
      long long v47 = *((_OWORD *)v11 + 15);
      long long v81 = *((_OWORD *)v11 + 14);
      long long v82 = v47;
      long long v48 = *((_OWORD *)v11 + 17);
      long long v83 = *((_OWORD *)v11 + 16);
      long long v84 = v48;
      long long v49 = *((_OWORD *)v11 + 11);
      long long v77 = *((_OWORD *)v11 + 10);
      long long v78 = v49;
      long long v50 = *((_OWORD *)v11 + 13);
      long long v79 = *((_OWORD *)v11 + 12);
      long long v80 = v50;
      long long v51 = *((_OWORD *)v11 + 7);
      long long v73 = *((_OWORD *)v11 + 6);
      long long v74 = v51;
      long long v52 = *((_OWORD *)v11 + 9);
      long long v75 = *((_OWORD *)v11 + 8);
      long long v76 = v52;
      DiscoveryModel.hash(into:)(a1);
      AuthenticationModel.hash(into:)((uint64_t)a1);
      SignInModel.hash(into:)((uint64_t)a1);
      uint64_t result = sub_24817150C((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for SetupModel);
      break;
  }
  return result;
}

unint64_t sub_248160A54(char a1)
{
  unint64_t result = 0x7075746573;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x74726F706572;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD000000000000018;
      break;
    case 4:
      unint64_t result = 0x74706965636572;
      break;
    case 5:
      unint64_t result = 0x6572756C696166;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_248160B24()
{
  return sub_248160A54(*v0);
}

uint64_t sub_248160B2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_248170D64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_248160B54(uint64_t a1)
{
  unint64_t v2 = sub_24816625C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248160B90(uint64_t a1)
{
  unint64_t v2 = sub_24816625C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_248160BCC(uint64_t a1)
{
  unint64_t v2 = sub_248166358();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248160C08(uint64_t a1)
{
  unint64_t v2 = sub_248166358();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_248160C44(uint64_t a1)
{
  unint64_t v2 = sub_248166450();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248160C80(uint64_t a1)
{
  unint64_t v2 = sub_248166450();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_248160CBC(uint64_t a1)
{
  unint64_t v2 = sub_2481662B0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248160CF8(uint64_t a1)
{
  unint64_t v2 = sub_2481662B0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_248160D34(uint64_t a1)
{
  unint64_t v2 = sub_248166304();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248160D70(uint64_t a1)
{
  unint64_t v2 = sub_248166304();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_248160DAC(uint64_t a1)
{
  unint64_t v2 = sub_248166548();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248160DE8(uint64_t a1)
{
  unint64_t v2 = sub_248166548();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_248160E24(uint64_t a1)
{
  unint64_t v2 = sub_24816659C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248160E60(uint64_t a1)
{
  unint64_t v2 = sub_24816659C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MachSetupMessage.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC5C0);
  uint64_t v77 = *(void *)(v2 - 8);
  uint64_t v78 = v2;
  MEMORY[0x270FA5388](v2);
  long long v76 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC5C8);
  uint64_t v72 = *(void *)(v4 - 8);
  uint64_t v73 = v4;
  MEMORY[0x270FA5388](v4);
  long long v70 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC5D0);
  uint64_t v74 = *(void *)(v6 - 8);
  uint64_t v75 = v6;
  MEMORY[0x270FA5388](v6);
  long long v71 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9840);
  MEMORY[0x270FA5388](v67);
  uint64_t v69 = (uint64_t)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC5D8);
  uint64_t v66 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  long long v65 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
  MEMORY[0x270FA5388](v61);
  uint64_t v64 = (uint64_t)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC5E0);
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  long long v60 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC5E8);
  uint64_t v58 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for SetupModel();
  MEMORY[0x270FA5388](v14);
  int v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for MachSetupMessage();
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (uint64_t *)((char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC5F0);
  uint64_t v80 = *(void *)(v92 - 8);
  MEMORY[0x270FA5388](v92);
  uint64_t v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24816625C();
  long long v79 = v21;
  sub_248175F60();
  sub_2481713F4(v81, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v26 = *v19;
      uint64_t v27 = (char *)v19[1];
      uint64_t v81 = v19[2];
      uint64_t v28 = v19[4];
      uint64_t v75 = v19[3];
      long long v76 = v27;
      uint64_t v77 = v28;
      uint64_t v78 = v26;
      uint64_t v29 = v19[5];
      uint64_t v30 = v19[6];
      uint64_t v32 = v19[7];
      uint64_t v31 = v19[8];
      uint64_t v33 = v19[9];
      LOBYTE(v82) = 1;
      sub_248166548();
      uint64_t v34 = v60;
      int v35 = v79;
      sub_248175B50();
      uint64_t v82 = v78;
      long long v83 = v76;
      uint64_t v84 = v81;
      uint64_t v85 = v75;
      uint64_t v86 = v28;
      uint64_t v87 = v29;
      uint64_t v88 = v30;
      uint64_t v89 = v32;
      uint64_t v90 = v31;
      uint64_t v91 = v33;
      sub_2480F7214();
      uint64_t v36 = v63;
      sub_248175BE0();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v34, v36);
      (*(void (**)(char *, uint64_t))(v80 + 8))(v35, v92);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_247FF6BFC(v29, v30);
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 2u:
      uint64_t v37 = v64;
      sub_247FE06A4((uint64_t)v19, v64, &qword_2692D9830);
      LOBYTE(v82) = 2;
      sub_248166450();
      uint64_t v38 = v65;
      uint64_t v39 = v92;
      uint64_t v40 = v79;
      sub_248175B50();
      sub_2481664A4();
      uint64_t v41 = v68;
      sub_248175BE0();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v38, v41);
      uint64_t v42 = &qword_2692D9830;
      goto LABEL_6;
    case 3u:
      uint64_t v37 = v69;
      sub_247FE06A4((uint64_t)v19, v69, &qword_2692D9840);
      LOBYTE(v82) = 3;
      sub_248166358();
      uint64_t v43 = v71;
      uint64_t v39 = v92;
      uint64_t v40 = v79;
      sub_248175B50();
      sub_2481663AC();
      uint64_t v44 = v75;
      sub_248175BE0();
      (*(void (**)(char *, uint64_t))(v74 + 8))(v43, v44);
      uint64_t v42 = &qword_2692D9840;
LABEL_6:
      sub_247FB33D4(v37, v42);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v40, v39);
      break;
    case 4u:
      uint64_t v45 = *v19;
      uint64_t v46 = v19[1];
      uint64_t v47 = v19[3];
      uint64_t v73 = v19[2];
      uint64_t v49 = v19[4];
      uint64_t v48 = v19[5];
      int v50 = *((unsigned __int8 *)v19 + 48);
      LOBYTE(v82) = 5;
      sub_2481662B0();
      long long v51 = v76;
      long long v52 = v79;
      sub_248175B50();
      uint64_t v81 = v45;
      uint64_t v82 = v45;
      uint64_t v75 = v46;
      long long v83 = (char *)v46;
      uint64_t v53 = v73;
      uint64_t v84 = v73;
      uint64_t v85 = v47;
      uint64_t v86 = v49;
      uint64_t v87 = v48;
      LODWORD(v74) = v50;
      LOBYTE(v88) = v50;
      sub_247FAAAEC();
      uint64_t v54 = v78;
      sub_248175BE0();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v51, v54);
      (*(void (**)(char *, uint64_t))(v80 + 8))(v52, v92);
      uint64_t result = sub_247FA98EC(v81, v75, v53, v47, v49, v48, v74);
      break;
    case 5u:
      LOBYTE(v82) = 4;
      sub_248166304();
      long long v55 = v70;
      uint64_t v56 = v92;
      long long v57 = v79;
      sub_248175B50();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v55, v73);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v57, v56);
      break;
    default:
      sub_24817145C((uint64_t)v19, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for SetupModel);
      LOBYTE(v82) = 0;
      sub_24816659C();
      uint64_t v22 = v92;
      uint64_t v23 = v79;
      sub_248175B50();
      sub_2481714C4(&qword_2692DB5F0, (void (*)(uint64_t))type metadata accessor for SetupModel);
      uint64_t v24 = v59;
      sub_248175BE0();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v13, v24);
      sub_24817150C((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for SetupModel);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v23, v22);
      break;
  }
  return result;
}

uint64_t MachSetupMessage.hashValue.getter()
{
  sub_248175E50();
  MachSetupMessage.hash(into:)(v1);
  return sub_248175EC0();
}

uint64_t MachSetupMessage.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v101 = a2;
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC640);
  uint64_t v90 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  uint64_t v97 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC648);
  uint64_t v87 = *(void *)(v100 - 8);
  MEMORY[0x270FA5388](v100);
  uint64_t v95 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC650);
  uint64_t v89 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  uint64_t v96 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC658);
  uint64_t v86 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  char v94 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC660);
  uint64_t v84 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v92 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC668);
  uint64_t v82 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v93 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC670);
  uint64_t v98 = *(void *)(v9 - 8);
  uint64_t v99 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = type metadata accessor for MachSetupMessage();
  uint64_t v12 = MEMORY[0x270FA5388](v102);
  uint64_t v80 = (_OWORD *)((char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  int v16 = (char *)&v74 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v74 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v74 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v74 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v74 - v26;
  uint64_t v28 = a1[3];
  uint64_t v103 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v28);
  sub_24816625C();
  uint64_t v29 = v107;
  sub_248175F20();
  if (v29) {
    goto LABEL_17;
  }
  uint64_t v75 = v25;
  long long v76 = v19;
  uint64_t v107 = v22;
  uint64_t v77 = v16;
  uint64_t v30 = v100;
  uint64_t v79 = 0;
  uint64_t v31 = v102;
  uint64_t v78 = v27;
  uint64_t v32 = v101;
  uint64_t v33 = v99;
  uint64_t v34 = sub_248175B30();
  if (*(void *)(v34 + 16) != 1)
  {
    uint64_t v44 = v11;
    uint64_t v45 = sub_2481758A0();
    swift_allocError();
    uint64_t v47 = v46;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D52B0);
    *uint64_t v47 = v31;
    sub_248175A60();
    sub_248175880();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v45 - 8) + 104))(v47, *MEMORY[0x263F8DCB0], v45);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v98 + 8))(v44, v33);
LABEL_17:
    uint64_t v42 = (uint64_t)v103;
    return __swift_destroy_boxed_opaque_existential_1(v42);
  }
  uint64_t v35 = (uint64_t)v107;
  switch(*(unsigned char *)(v34 + 32))
  {
    case 1:
      uint64_t v36 = v32;
      v104[0] = 1;
      sub_248166548();
      uint64_t v48 = v92;
      uint64_t v49 = v79;
      sub_248175A50();
      if (v49) {
        goto LABEL_16;
      }
      sub_2480F7370();
      int v50 = v48;
      uint64_t v51 = v81;
      sub_248175AF0();
      (*(void (**)(char *, uint64_t))(v84 + 8))(v50, v51);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v98 + 8))(v11, v33);
      uint64_t v52 = v106;
      *(void *)uint64_t v35 = *(void *)v104;
      *(_OWORD *)(v35 + 8) = *(_OWORD *)&v104[8];
      *(_OWORD *)(v35 + 24) = *(_OWORD *)&v104[24];
      *(_OWORD *)(v35 + 40) = *(_OWORD *)&v104[40];
      *(_OWORD *)(v35 + 56) = v105;
      *(void *)(v35 + 72) = v52;
      goto LABEL_20;
    case 2:
      uint64_t v36 = v32;
      v104[0] = 2;
      sub_248166450();
      uint64_t v53 = v94;
      uint64_t v54 = v79;
      sub_248175A50();
      if (v54) {
        goto LABEL_16;
      }
      uint64_t v107 = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
      sub_248166694();
      uint64_t v35 = (uint64_t)v76;
      uint64_t v55 = v85;
      sub_248175AF0();
      uint64_t v56 = v98;
      (*(void (**)(char *, uint64_t))(v86 + 8))(v53, v55);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v107, v33);
      goto LABEL_20;
    case 3:
      uint64_t v36 = v32;
      v104[0] = 3;
      sub_248166358();
      long long v57 = v96;
      uint64_t v58 = v79;
      sub_248175A50();
      if (v58) {
        goto LABEL_16;
      }
      uint64_t v59 = v57;
      long long v60 = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9840);
      sub_2481665F0();
      uint64_t v35 = (uint64_t)v77;
      uint64_t v61 = v88;
      sub_248175AF0();
      uint64_t v62 = v98;
      (*(void (**)(char *, uint64_t))(v89 + 8))(v59, v61);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v60, v33);
LABEL_20:
      swift_storeEnumTagMultiPayload();
      uint64_t v73 = v35;
      goto LABEL_21;
    case 4:
      uint64_t v36 = v32;
      v104[0] = 4;
      sub_248166304();
      uint64_t v63 = v95;
      uint64_t v64 = v79;
      sub_248175A50();
      if (v64) {
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v87 + 8))(v63, v30);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v98 + 8))(v11, v33);
      uint64_t v43 = (uint64_t)v78;
      swift_storeEnumTagMultiPayload();
      goto LABEL_22;
    case 5:
      uint64_t v36 = v32;
      v104[0] = 5;
      sub_2481662B0();
      long long v65 = v97;
      uint64_t v66 = v79;
      sub_248175A50();
      if (v66) {
        goto LABEL_16;
      }
      sub_247FAAB40();
      uint64_t v68 = v91;
      sub_248175AF0();
      uint64_t v69 = v98;
      (*(void (**)(char *, uint64_t))(v90 + 8))(v65, v68);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v11, v33);
      char v70 = v104[48];
      long long v71 = *(_OWORD *)&v104[16];
      uint64_t v72 = v80;
      *uint64_t v80 = *(_OWORD *)v104;
      v72[1] = v71;
      v72[2] = *(_OWORD *)&v104[32];
      *((unsigned char *)v72 + 48) = v70;
      swift_storeEnumTagMultiPayload();
      uint64_t v73 = (uint64_t)v72;
LABEL_21:
      uint64_t v43 = (uint64_t)v78;
      sub_24817145C(v73, (uint64_t)v78, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
LABEL_22:
      uint64_t v42 = (uint64_t)v103;
      goto LABEL_23;
    default:
      uint64_t v36 = v32;
      v104[0] = 0;
      sub_24816659C();
      uint64_t v37 = v93;
      uint64_t v38 = v79;
      sub_248175A50();
      if (v38)
      {
LABEL_16:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v98 + 8))(v11, v33);
        goto LABEL_17;
      }
      type metadata accessor for SetupModel();
      uint64_t v39 = v37;
      uint64_t v107 = v11;
      sub_2481714C4(&qword_2692DB608, (void (*)(uint64_t))type metadata accessor for SetupModel);
      uint64_t v40 = (uint64_t)v75;
      uint64_t v41 = v83;
      sub_248175AF0();
      (*(void (**)(char *, uint64_t))(v82 + 8))(v39, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v98 + 8))(v107, v33);
      uint64_t v42 = (uint64_t)v103;
      swift_storeEnumTagMultiPayload();
      uint64_t v43 = (uint64_t)v78;
      sub_24817145C(v40, (uint64_t)v78, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
LABEL_23:
      sub_24817145C(v43, v36, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v42);
}

uint64_t sub_24816278C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MachSetupMessage.init(from:)(a1, a2);
}

uint64_t sub_2481627A4(void *a1)
{
  return MachSetupMessage.encode(to:)(a1);
}

uint64_t sub_2481627C0()
{
  sub_248175E50();
  MachSetupMessage.hash(into:)(v1);
  return sub_248175EC0();
}

uint64_t sub_248162804()
{
  sub_248175E50();
  MachSetupMessage.hash(into:)(v1);
  return sub_248175EC0();
}

uint64_t SetupError.hash(into:)(uint64_t a1)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 40);
  switch(*(unsigned char *)(v1 + 48))
  {
    case 1:
      sub_248175E70();
      return sub_247FDE2AC(a1, v2);
    case 2:
      sub_248175E70();
      swift_bridgeObjectRetain();
      sub_2481751A0();
      swift_bridgeObjectRelease();
      if (!v3)
      {
        sub_248175E80();
        if (v4) {
          goto LABEL_10;
        }
        return sub_248175E80();
      }
      sub_248175E80();
      swift_bridgeObjectRetain();
      sub_2481751A0();
      swift_bridgeObjectRelease();
      if (!v4) {
        return sub_248175E80();
      }
LABEL_10:
      sub_248175E80();
      swift_bridgeObjectRetain();
      sub_2481751A0();
      return swift_bridgeObjectRelease();
    case 3:
      uint64_t v7 = *(void *)(v2 + 24);
      uint64_t v8 = *(void *)(v2 + 32);
      uint64_t v9 = *(void *)(v2 + 40);
      uint64_t v10 = *(void *)(v2 + 48);
      uint64_t v11 = *(void *)(v2 + 56);
      uint64_t v12 = *(void *)(v2 + 80);
      uint64_t v19 = *(void *)(v2 + 72);
      uint64_t v20 = *(void *)(v2 + 16);
      uint64_t v17 = *(void *)(v2 + 104);
      uint64_t v18 = *(void *)(v2 + 88);
      uint64_t v15 = *(void *)(v2 + 112);
      uint64_t v16 = *(void *)(v2 + 96);
      char v13 = *(unsigned char *)(v2 + 64);
      char v14 = *(unsigned char *)(v2 + 120);
      sub_248175E70();
      sub_247FA9804(v20, v7, v8, v9, v10, v11, v13);
      sub_247FA9804(v19, v12, v18, v16, v17, v15, v14);
      SetupError.hash(into:)(a1);
      SetupError.hash(into:)(a1);
      sub_247FA98EC(v20, v7, v8, v9, v10, v11, v13);
      return sub_247FA98EC(v19, v12, v18, v16, v17, v15, v14);
    case 4:
      return sub_248175E70();
    default:
      sub_248175E70();
      sub_2481751A0();
      sub_248175E70();
      return sub_2481751A0();
  }
}

unint64_t sub_248162C00(char a1)
{
  unint64_t result = 0x6E776F6E6B6E75;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C6C65636E6163;
      break;
    case 2:
      unint64_t result = 0x636E614372657375;
      break;
    case 3:
      unint64_t result = 0x70696B5372657375;
      break;
    case 4:
      unint64_t result = 0x636972656E6567;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 8:
      unint64_t result = 0x64657473656ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_248162D3C(uint64_t a1)
{
  unint64_t v2 = sub_248166834();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248162D78(uint64_t a1)
{
  unint64_t v2 = sub_248166834();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_248162DB4(uint64_t a1)
{
  unint64_t v2 = sub_2481669D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248162DF0(uint64_t a1)
{
  unint64_t v2 = sub_2481669D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_248162E2C()
{
  return sub_248162C00(*v0);
}

uint64_t sub_248162E34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_248170FCC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_248162E5C(uint64_t a1)
{
  unint64_t v2 = sub_248166738();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248162E98(uint64_t a1)
{
  unint64_t v2 = sub_248166738();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_248162ED4(uint64_t a1)
{
  unint64_t v2 = sub_2481667E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248162F10(uint64_t a1)
{
  unint64_t v2 = sub_2481667E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_248162F4C(uint64_t a1)
{
  unint64_t v2 = sub_2481668DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248162F88(uint64_t a1)
{
  unint64_t v2 = sub_2481668DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_248162FC4(uint64_t a1)
{
  unint64_t v2 = sub_248166888();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248163000(uint64_t a1)
{
  unint64_t v2 = sub_248166888();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24816303C(uint64_t a1)
{
  unint64_t v2 = sub_24816678C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248163078(uint64_t a1)
{
  unint64_t v2 = sub_24816678C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2481630B4(uint64_t a1)
{
  unint64_t v2 = sub_248166A2C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2481630F0(uint64_t a1)
{
  unint64_t v2 = sub_248166A2C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24816312C(uint64_t a1)
{
  unint64_t v2 = sub_248166984();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248163168(uint64_t a1)
{
  unint64_t v2 = sub_248166984();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2481631A4(uint64_t a1)
{
  unint64_t v2 = sub_248166930();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2481631E0(uint64_t a1)
{
  unint64_t v2 = sub_248166930();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SetupError.encode(to:)(void *a1)
{
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC688);
  uint64_t v87 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v96 = (char *)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC690);
  uint64_t v89 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  uint64_t v94 = (uint64_t)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC698);
  uint64_t v77 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  long long v76 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC6A0);
  uint64_t v88 = *(void *)(v92 - 8);
  MEMORY[0x270FA5388](v92);
  uint64_t v90 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC6A8);
  uint64_t v86 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  uint64_t v91 = (uint64_t)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC6B0);
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v73 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC6B8);
  uint64_t v80 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v79 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC6C0);
  uint64_t v83 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v82 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC6C8);
  uint64_t v85 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v13 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC6D0);
  uint64_t v102 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  uint64_t v15 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)v1;
  uint64_t v16 = *(void *)(v1 + 8);
  uint64_t v100 = *(void *)(v1 + 16);
  uint64_t v101 = v16;
  uint64_t v18 = *(void *)(v1 + 24);
  uint64_t v19 = *(void *)(v1 + 40);
  uint64_t v98 = *(void *)(v1 + 32);
  uint64_t v99 = v18;
  uint64_t v20 = *(unsigned __int8 *)(v1 + 48);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_248166738();
  uint64_t v104 = v15;
  sub_248175F60();
  switch(v20)
  {
    case 1:
      LOBYTE(v106) = 5;
      sub_248166888();
      uint64_t v26 = v90;
      uint64_t v28 = v104;
      uint64_t v27 = v105;
      sub_248175B50();
      uint64_t v106 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692D67D8);
      sub_247FE1044();
      uint64_t v29 = v92;
      sub_248175BE0();
      (*(void (**)(char *, uint64_t))(v88 + 8))(v26, v29);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v102 + 8))(v28, v27);
      break;
    case 2:
      LOBYTE(v106) = 7;
      sub_2481667E0();
      uint64_t v31 = v94;
      uint64_t v23 = v104;
      uint64_t v22 = v105;
      sub_248175B50();
      uint64_t v106 = v17;
      uint64_t v107 = v101;
      uint64_t v108 = v100;
      uint64_t v109 = v99;
      uint64_t v110 = v98;
      uint64_t v111 = v19;
      sub_248018A10();
      uint64_t v32 = v95;
      sub_248175BE0();
      (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v31, v32);
      goto LABEL_7;
    case 3:
      uint64_t v33 = *(void *)(v17 + 24);
      uint64_t v91 = *(void *)(v17 + 16);
      uint64_t v90 = (char *)v33;
      uint64_t v34 = *(void *)(v17 + 40);
      uint64_t v99 = *(void *)(v17 + 32);
      uint64_t v100 = v34;
      uint64_t v35 = *(void *)(v17 + 56);
      uint64_t v101 = *(void *)(v17 + 48);
      int v36 = *(unsigned __int8 *)(v17 + 64);
      uint64_t v37 = *(void *)(v17 + 72);
      uint64_t v38 = *(void *)(v17 + 80);
      uint64_t v40 = *(void *)(v17 + 88);
      uint64_t v39 = *(void *)(v17 + 96);
      uint64_t v42 = *(void *)(v17 + 104);
      uint64_t v41 = *(void *)(v17 + 112);
      int v43 = *(unsigned __int8 *)(v17 + 120);
      LOBYTE(v106) = 8;
      int v44 = v36;
      sub_247FA9804(v91, v33, v99, v34, v101, v35, v36);
      uint64_t v92 = v37;
      uint64_t v93 = v38;
      uint64_t v94 = v40;
      uint64_t v95 = v39;
      uint64_t v98 = v42;
      uint64_t v88 = v41;
      LODWORD(v89) = v43;
      sub_247FA9804(v37, v38, v40, v39, v42, v41, v43);
      sub_24816678C();
      uint64_t v45 = v96;
      uint64_t v46 = v104;
      uint64_t v47 = v105;
      sub_248175B50();
      uint64_t v48 = v91;
      uint64_t v106 = v91;
      uint64_t v49 = v90;
      uint64_t v107 = (uint64_t)v90;
      uint64_t v108 = v99;
      uint64_t v109 = v100;
      uint64_t v110 = v101;
      uint64_t v111 = v35;
      uint64_t v85 = v35;
      LODWORD(v86) = v44;
      char v112 = v44;
      char v113 = 0;
      sub_247FAAAEC();
      uint64_t v50 = v97;
      uint64_t v51 = v103;
      sub_248175BE0();
      if (v51)
      {
        sub_247FA98EC(v92, v93, v94, v95, v98, v88, v89);
        (*(void (**)(char *, uint64_t))(v87 + 8))(v45, v50);
        (*(void (**)(char *, uint64_t))(v102 + 8))(v46, v47);
        uint64_t v52 = v48;
        uint64_t v53 = (uint64_t)v49;
        uint64_t v54 = v99;
        uint64_t v55 = v100;
        uint64_t v56 = v101;
        uint64_t v57 = v85;
        char v58 = v86;
      }
      else
      {
        uint64_t v63 = v48;
        uint64_t v64 = (uint64_t)v49;
        uint64_t v106 = v92;
        uint64_t v107 = v93;
        uint64_t v108 = v94;
        uint64_t v109 = v95;
        uint64_t v65 = v88;
        uint64_t v110 = v98;
        uint64_t v111 = v88;
        char v66 = v89;
        char v112 = v89;
        char v113 = 1;
        sub_248175BE0();
        sub_247FA98EC(v63, v64, v99, v100, v101, v85, v86);
        (*(void (**)(char *, uint64_t))(v87 + 8))(v45, v50);
        (*(void (**)(char *, uint64_t))(v102 + 8))(v104, v105);
        uint64_t v52 = v92;
        uint64_t v53 = v93;
        uint64_t v54 = v94;
        uint64_t v55 = v95;
        uint64_t v56 = v98;
        uint64_t v57 = v65;
        char v58 = v66;
      }
      uint64_t result = sub_247FA98EC(v52, v53, v54, v55, v56, v57, v58);
      break;
    case 4:
      if (v100 | v101 | v17 | v99 | v98 | v19)
      {
        uint64_t v59 = v100 | v101 | v99 | v98 | v19;
        if (v17 != 1 || v59)
        {
          if (v17 != 2 || v59)
          {
            uint64_t v62 = v104;
            uint64_t v61 = v105;
            if (v17 != 3 || v59)
            {
              LOBYTE(v106) = 6;
              sub_248166834();
              long long v71 = v76;
              sub_248175B50();
              (*(void (**)(char *, uint64_t))(v77 + 8))(v71, v78);
            }
            else
            {
              LOBYTE(v106) = 3;
              sub_248166930();
              char v70 = v73;
              sub_248175B50();
              (*(void (**)(char *, uint64_t))(v74 + 8))(v70, v75);
            }
          }
          else
          {
            LOBYTE(v106) = 2;
            sub_248166984();
            uint64_t v69 = v79;
            uint64_t v62 = v104;
            uint64_t v61 = v105;
            sub_248175B50();
            (*(void (**)(char *, uint64_t))(v80 + 8))(v69, v81);
          }
        }
        else
        {
          LOBYTE(v106) = 1;
          sub_2481669D8();
          long long v60 = v82;
          uint64_t v62 = v104;
          uint64_t v61 = v105;
          sub_248175B50();
          (*(void (**)(char *, uint64_t))(v83 + 8))(v60, v84);
        }
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v102 + 8))(v62, v61);
      }
      else
      {
        LOBYTE(v106) = 0;
        sub_248166A2C();
        uint64_t v67 = v104;
        uint64_t v68 = v105;
        sub_248175B50();
        (*(void (**)(char *, uint64_t))(v85 + 8))(v13, v11);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v102 + 8))(v67, v68);
      }
      break;
    default:
      LOBYTE(v106) = 4;
      sub_2481668DC();
      uint64_t v21 = v91;
      uint64_t v23 = v104;
      uint64_t v22 = v105;
      sub_248175B50();
      LOBYTE(v106) = 0;
      uint64_t v24 = v93;
      uint64_t v25 = v103;
      sub_248175BB0();
      if (!v25)
      {
        LOBYTE(v106) = 1;
        sub_248175BD0();
        LOBYTE(v106) = 2;
        sub_248175BB0();
      }
      (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v21, v24);
LABEL_7:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v102 + 8))(v23, v22);
      break;
  }
  return result;
}

uint64_t SetupError.hashValue.getter()
{
  char v1 = *((unsigned char *)v0 + 48);
  long long v2 = v0[1];
  long long v5 = *v0;
  long long v6 = v2;
  long long v7 = v0[2];
  char v8 = v1;
  sub_248175E50();
  SetupError.hash(into:)((uint64_t)v4);
  return sub_248175EC0();
}

uint64_t SetupError.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v109 = a2;
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC728);
  uint64_t v93 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  uint64_t v115 = (void (**)(char *, uint64_t))((char *)&v84 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC730);
  uint64_t v114 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  uint64_t v108 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC738);
  uint64_t v101 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  uint64_t v106 = (char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC740);
  uint64_t v91 = *(void *)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  uint64_t v107 = (char *)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC748);
  uint64_t v92 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  char v113 = (char *)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC750);
  uint64_t v100 = *(void *)(v98 - 8);
  MEMORY[0x270FA5388](v98);
  uint64_t v111 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC758);
  uint64_t v97 = *(void *)(v96 - 8);
  MEMORY[0x270FA5388](v96);
  uint64_t v110 = (char *)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC760);
  uint64_t v95 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC768);
  uint64_t v94 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC770);
  uint64_t v16 = *(void *)(v112 - 8);
  MEMORY[0x270FA5388](v112);
  uint64_t v18 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = a1[3];
  uint64_t v116 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_248166738();
  uint64_t v20 = v122;
  sub_248175F20();
  uint64_t v122 = v20;
  if (v20)
  {
LABEL_23:
    uint64_t v60 = (uint64_t)v116;
    return __swift_destroy_boxed_opaque_existential_1(v60);
  }
  uint64_t v88 = v15;
  uint64_t v86 = v13;
  uint64_t v89 = v12;
  uint64_t v87 = v10;
  uint64_t v22 = v110;
  uint64_t v21 = v111;
  uint64_t v23 = v113;
  uint64_t v24 = v114;
  uint64_t v25 = (char *)v115;
  uint64_t v90 = v16;
  uint64_t v26 = v112;
  uint64_t v27 = sub_248175B30();
  uint64_t v28 = v27;
  if (*(void *)(v27 + 16) != 1)
  {
    uint64_t v37 = sub_2481758A0();
    uint64_t v38 = swift_allocError();
    uint64_t v40 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D52B0);
    *uint64_t v40 = &type metadata for SetupError;
    sub_248175A60();
    sub_248175880();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v40, *MEMORY[0x263F8DCB0], v37);
    uint64_t v122 = v38;
    swift_willThrow();
    swift_bridgeObjectRelease();
    uint64_t v41 = *(void (**)(char *, uint64_t))(v90 + 8);
    uint64_t v42 = v18;
LABEL_21:
    uint64_t v59 = v26;
LABEL_22:
    v41(v42, v59);
    goto LABEL_23;
  }
  uint64_t v85 = v18;
  switch(*(unsigned char *)(v27 + 32))
  {
    case 1:
      LOBYTE(v117) = 1;
      sub_2481669D8();
      int v43 = v89;
      uint64_t v30 = v85;
      uint64_t v44 = v122;
      sub_248175A50();
      uint64_t v122 = v44;
      if (v44) {
        goto LABEL_20;
      }
      (*(void (**)(char *, uint64_t))(v95 + 8))(v43, v87);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v30, v26);
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      long long v36 = 0uLL;
      char v45 = 4;
      uint64_t v32 = 1;
      goto LABEL_33;
    case 2:
      LOBYTE(v117) = 2;
      sub_248166984();
      uint64_t v30 = v85;
      uint64_t v46 = v122;
      sub_248175A50();
      uint64_t v122 = v46;
      if (v46) {
        goto LABEL_20;
      }
      (*(void (**)(char *, uint64_t))(v97 + 8))(v22, v96);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v30, v26);
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      long long v36 = 0uLL;
      char v45 = 4;
      uint64_t v32 = 2;
      goto LABEL_33;
    case 3:
      LOBYTE(v117) = 3;
      sub_248166930();
      uint64_t v30 = v85;
      uint64_t v47 = v122;
      sub_248175A50();
      uint64_t v122 = v47;
      if (v47) {
        goto LABEL_20;
      }
      (*(void (**)(char *, uint64_t))(v100 + 8))(v21, v98);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v30, v26);
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      long long v36 = 0uLL;
      char v45 = 4;
      uint64_t v32 = 3;
      goto LABEL_33;
    case 4:
      LOBYTE(v117) = 4;
      sub_2481668DC();
      uint64_t v48 = v23;
      uint64_t v49 = v26;
      uint64_t v50 = v85;
      uint64_t v51 = v122;
      sub_248175A50();
      uint64_t v122 = v51;
      if (v51)
      {
        swift_bridgeObjectRelease();
        uint64_t v41 = *(void (**)(char *, uint64_t))(v90 + 8);
        uint64_t v42 = v50;
        goto LABEL_30;
      }
      uint64_t v114 = v28;
      LOBYTE(v117) = 0;
      uint64_t v68 = v99;
      uint64_t v69 = sub_248175AC0();
      uint64_t v122 = 0;
      uint64_t v32 = v69;
      uint64_t v33 = v76;
      LOBYTE(v117) = 1;
      uint64_t v77 = v48;
      uint64_t v78 = sub_248175AE0();
      uint64_t v122 = 0;
      uint64_t v79 = v92;
      uint64_t v34 = v78;
      uint64_t v115 = (void (**)(char *, uint64_t))(v90 + 8);
      LOBYTE(v117) = 2;
      uint64_t v80 = sub_248175AC0();
      uint64_t v111 = v81;
      uint64_t v82 = v68;
      uint64_t v83 = (void (**)(char *, uint64_t))(v79 + 8);
      uint64_t v122 = 0;
      uint64_t v35 = v80;
      (*v83)(v77, v82);
      swift_bridgeObjectRelease();
      (*v115)(v85, v26);
      char v45 = 0;
      long long v36 = (unint64_t)v111;
      goto LABEL_33;
    case 5:
      LOBYTE(v117) = 5;
      sub_248166888();
      uint64_t v52 = v107;
      uint64_t v49 = v26;
      uint64_t v53 = v85;
      uint64_t v54 = v122;
      sub_248175A50();
      uint64_t v122 = v54;
      if (v54) {
        goto LABEL_18;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692D67D8);
      sub_247FE12E4();
      uint64_t v55 = v103;
      uint64_t v56 = v122;
      sub_248175AF0();
      uint64_t v122 = v56;
      if (!v56)
      {
        (*(void (**)(char *, uint64_t))(v91 + 8))(v52, v55);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v90 + 8))(v53, v26);
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        uint64_t v35 = 0;
        uint64_t v32 = v117;
        long long v36 = 0uLL;
        char v45 = 1;
        goto LABEL_33;
      }
      (*(void (**)(char *, uint64_t))(v91 + 8))(v52, v55);
LABEL_18:
      swift_bridgeObjectRelease();
      uint64_t v41 = *(void (**)(char *, uint64_t))(v90 + 8);
      uint64_t v42 = v53;
      goto LABEL_30;
    case 6:
      LOBYTE(v117) = 6;
      sub_248166834();
      uint64_t v57 = v106;
      uint64_t v30 = v85;
      uint64_t v58 = v122;
      sub_248175A50();
      uint64_t v122 = v58;
      if (v58) {
        goto LABEL_20;
      }
      (*(void (**)(char *, uint64_t))(v101 + 8))(v57, v102);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v30, v26);
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      long long v36 = 0uLL;
      uint64_t v32 = 4;
      goto LABEL_32;
    case 7:
      uint64_t v62 = v24;
      LOBYTE(v117) = 7;
      sub_2481667E0();
      uint64_t v63 = v108;
      uint64_t v49 = v26;
      uint64_t v64 = v85;
      uint64_t v65 = v122;
      sub_248175A50();
      uint64_t v122 = v65;
      if (v65)
      {
        swift_bridgeObjectRelease();
        uint64_t v41 = *(void (**)(char *, uint64_t))(v90 + 8);
        uint64_t v42 = v64;
LABEL_30:
        uint64_t v59 = v49;
        goto LABEL_22;
      }
      sub_2480189BC();
      uint64_t v71 = v104;
      uint64_t v72 = v122;
      sub_248175AF0();
      uint64_t v73 = v90;
      uint64_t v122 = v72;
      if (v72)
      {
        (*(void (**)(char *, uint64_t))(v62 + 8))(v63, v71);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v73 + 8))(v64, v49);
        goto LABEL_23;
      }
      (*(void (**)(char *, uint64_t))(v62 + 8))(v63, v71);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v64, v49);
      uint64_t v32 = v117;
      uint64_t v33 = v118;
      uint64_t v34 = v119;
      uint64_t v35 = v120;
      char v45 = 2;
      long long v36 = v121;
      goto LABEL_33;
    case 8:
      uint64_t v114 = v27;
      LOBYTE(v117) = 8;
      sub_24816678C();
      char v66 = v85;
      uint64_t v67 = v122;
      sub_248175A50();
      uint64_t v122 = v67;
      if (v67)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v90 + 8))(v66, v26);
        goto LABEL_23;
      }
      uint64_t v32 = swift_allocObject();
      LOBYTE(v117) = 0;
      sub_247FAAB40();
      uint64_t v74 = v105;
      uint64_t v75 = v122;
      sub_248175AF0();
      uint64_t v122 = v75;
      if (v75)
      {
        (*(void (**)(char *, uint64_t))(v93 + 8))(v25, v74);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v90 + 8))(v66, v26);
        swift_deallocUninitializedObject();
        goto LABEL_23;
      }
      LOBYTE(v117) = 1;
      sub_248175AF0();
      uint64_t v122 = 0;
      (*(void (**)(char *, uint64_t))(v93 + 8))(v25, v74);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v66, v26);
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      long long v36 = 0uLL;
      char v45 = 3;
      goto LABEL_33;
    default:
      LOBYTE(v117) = 0;
      sub_248166A2C();
      uint64_t v29 = v88;
      uint64_t v30 = v85;
      uint64_t v31 = v122;
      sub_248175A50();
      uint64_t v122 = v31;
      if (v31)
      {
LABEL_20:
        swift_bridgeObjectRelease();
        uint64_t v41 = *(void (**)(char *, uint64_t))(v90 + 8);
        uint64_t v42 = v30;
        goto LABEL_21;
      }
      (*(void (**)(char *, uint64_t))(v94 + 8))(v29, v86);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v30, v26);
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      long long v36 = 0uLL;
LABEL_32:
      char v45 = 4;
LABEL_33:
      uint64_t v60 = (uint64_t)v116;
      char v70 = v109;
      *uint64_t v109 = v32;
      v70[1] = v33;
      v70[2] = v34;
      v70[3] = v35;
      *((_OWORD *)v70 + 2) = v36;
      *((unsigned char *)v70 + 48) = v45;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v60);
}

uint64_t sub_248165108(uint64_t a1)
{
  unint64_t v2 = sub_2481713A0();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_248165144(uint64_t a1)
{
  unint64_t v2 = sub_2481713A0();
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_248165180@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return SetupError.init(from:)(a1, a2);
}

uint64_t sub_248165198(void *a1)
{
  return SetupError.encode(to:)(a1);
}

uint64_t sub_2481651B4()
{
  char v1 = *((unsigned char *)v0 + 48);
  long long v2 = v0[1];
  long long v5 = *v0;
  long long v6 = v2;
  long long v7 = v0[2];
  char v8 = v1;
  sub_248175E50();
  SetupError.hash(into:)((uint64_t)v4);
  return sub_248175EC0();
}

uint64_t sub_248165214()
{
  char v1 = *((unsigned char *)v0 + 48);
  long long v2 = v0[1];
  long long v5 = *v0;
  long long v6 = v2;
  long long v7 = v0[2];
  char v8 = v1;
  sub_248175E50();
  SetupError.hash(into:)((uint64_t)v4);
  return sub_248175EC0();
}

uint64_t static SetupError.errorDomain.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_2692DC5B0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static SetupError.errorDomain.setter(uint64_t a1, char *a2)
{
  qword_2692DC5B0 = a1;
  off_2692DC5B8 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SetupError.errorDomain.modify())()
{
  return j__swift_endAccess;
}

uint64_t SetupError.errorCode.getter()
{
  uint64_t v1 = *v0;
  uint64_t result = 1004;
  switch(*((unsigned char *)v0 + 48))
  {
    case 1:
      uint64_t result = 1005;
      break;
    case 2:
      uint64_t result = 1007;
      break;
    case 3:
      uint64_t result = 1008;
      break;
    case 4:
      uint64_t v3 = v0[3];
      uint64_t v4 = v0[4] | v0[5];
      uint64_t v5 = v0[2] | v0[1];
      if (v4 | v1 | v3 | v5)
      {
        uint64_t v6 = v4 | v3 | v5;
        if (v1 == 1 && v6 == 0)
        {
          uint64_t result = 1001;
        }
        else if (v1 != 2 || v6)
        {
          if (v6) {
            BOOL v8 = 0;
          }
          else {
            BOOL v8 = v1 == 3;
          }
          if (v8) {
            uint64_t result = 1003;
          }
          else {
            uint64_t result = 1006;
          }
        }
        else
        {
          uint64_t result = 1002;
        }
      }
      else
      {
        uint64_t result = 1000;
      }
      break;
    default:
      return result;
  }
  return result;
}

unint64_t SetupError.errorUserInfo.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D6860);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24817B010;
  *(void *)(inited + 32) = sub_248175160();
  *(void *)(inited + 40) = v1;
  unint64_t v2 = SetupError.description.getter();
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v2;
  *(void *)(inited + 56) = v3;
  return sub_247FB4638(inited);
}

unint64_t SetupError.description.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  unint64_t result = 0xD00000000000002ALL;
  switch(*((unsigned char *)v0 + 48))
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD00000000000004CLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      uint64_t v6 = v0[4] | v0[5];
      if (v4 | v2 | v1 | v3 | v6)
      {
        uint64_t v7 = v4 | v2 | v3 | v6;
        if (v1 != 1 || v7)
        {
          if (v1 != 2 || v7)
          {
            if (v1 == 3 && v7 == 0) {
              unint64_t result = 0xD000000000000025;
            }
            else {
              unint64_t result = 0xD000000000000035;
            }
          }
          else
          {
            unint64_t result = 0xD00000000000002ELL;
          }
        }
        else
        {
          unint64_t result = 0xD000000000000014;
        }
      }
      else
      {
        unint64_t result = 0x6E776F6E6B6E55;
      }
      break;
    default:
      sub_248175850();
      sub_2481751D0();
      sub_2481751D0();
      sub_2481751D0();
      sub_248175C30();
      sub_2481751D0();
      swift_bridgeObjectRelease();
      sub_2481751D0();
      sub_2481751D0();
      sub_2481751D0();
      unint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_248165750()
{
  swift_beginAccess();
  uint64_t v0 = qword_2692DC5B0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_2481657A4()
{
  uint64_t v1 = *v0;
  uint64_t result = 1004;
  switch(*((unsigned char *)v0 + 48))
  {
    case 1:
      uint64_t result = 1005;
      break;
    case 2:
      uint64_t result = 1007;
      break;
    case 3:
      uint64_t result = 1008;
      break;
    case 4:
      uint64_t v3 = v0[3];
      uint64_t v4 = v0[4] | v0[5];
      uint64_t v5 = v0[2] | v0[1];
      if (v4 | v1 | v3 | v5)
      {
        uint64_t v6 = v4 | v3 | v5;
        if (v1 == 1 && v6 == 0)
        {
          uint64_t result = 1001;
        }
        else if (v1 != 2 || v6)
        {
          if (v6) {
            BOOL v8 = 0;
          }
          else {
            BOOL v8 = v1 == 3;
          }
          if (v8) {
            uint64_t result = 1003;
          }
          else {
            uint64_t result = 1006;
          }
        }
        else
        {
          uint64_t result = 1002;
        }
      }
      else
      {
        uint64_t result = 1000;
      }
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_248165870()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D6860);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24817B010;
  *(void *)(inited + 32) = sub_248175160();
  *(void *)(inited + 40) = v1;
  unint64_t v2 = SetupError.description.getter();
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v2;
  *(void *)(inited + 56) = v3;
  return sub_247FB4638(inited);
}

uint64_t _s12AppleIDSetup16MachSetupMessageO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = a2;
  uint64_t v71 = a1;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9840);
  MEMORY[0x270FA5388](v67);
  char v70 = (unsigned __int8 *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
  MEMORY[0x270FA5388](v68);
  uint64_t v69 = (uint64_t)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SetupModel();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (unsigned __int8 *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for MachSetupMessage();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (unsigned __int8 *)&v65 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v65 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (uint64_t *)((char *)&v65 - v18);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (unsigned __int8 *)&v65 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692DC928);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = (char *)&v65 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = (uint64_t)&v25[*(int *)(v23 + 56)];
  sub_2481713F4(v71, (uint64_t)v25, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
  sub_2481713F4(v72, v26, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2481713F4((uint64_t)v25, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
      uint64_t v38 = *v19;
      uint64_t v39 = v19[2];
      uint64_t v40 = v19[4];
      uint64_t v71 = v19[5];
      uint64_t v42 = v19[6];
      uint64_t v41 = v19[7];
      uint64_t v43 = v19[8];
      uint64_t v72 = v19[9];
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v44 = v19[3];
        uint64_t v45 = v19[1];
        uint64_t v47 = *(void *)v26;
        uint64_t v46 = *(void *)(v26 + 8);
        uint64_t v48 = v41;
        uint64_t v69 = v41;
        uint64_t v50 = *(void *)(v26 + 32);
        uint64_t v49 = *(void *)(v26 + 40);
        uint64_t v51 = v43;
        char v70 = (unsigned __int8 *)v43;
        uint64_t v52 = v42;
        uint64_t v68 = v42;
        uint64_t v53 = *(void *)(v26 + 48);
        uint64_t v54 = *(void *)(v26 + 56);
        uint64_t v55 = *(void *)(v26 + 64);
        uint64_t v66 = *(void *)(v26 + 72);
        uint64_t v82 = v38;
        uint64_t v83 = v45;
        uint64_t v67 = v39;
        uint64_t v84 = v39;
        uint64_t v85 = v44;
        uint64_t v86 = v40;
        uint64_t v87 = v71;
        uint64_t v88 = v52;
        uint64_t v89 = v48;
        uint64_t v90 = v51;
        uint64_t v91 = v72;
        uint64_t v73 = v47;
        uint64_t v74 = v46;
        long long v65 = *(_OWORD *)(v26 + 16);
        long long v75 = v65;
        uint64_t v76 = v50;
        uint64_t v77 = v49;
        uint64_t v78 = v53;
        uint64_t v79 = v54;
        uint64_t v80 = v55;
        uint64_t v81 = v66;
        char v37 = _s12AppleIDSetup11SetupReportV2eeoiySbAC_ACtFZ_0(&v82, &v73);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_247FF6BFC(v49, v53);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_247FF6BFC(v71, v68);
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_247FF6BFC(v71, v42);
      swift_bridgeObjectRelease();
      goto LABEL_27;
    case 2u:
      sub_2481713F4((uint64_t)v25, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
      if (swift_getEnumCaseMultiPayload() != 2)
      {
        uint64_t v60 = &qword_2692D9830;
        uint64_t v61 = (uint64_t)v16;
        goto LABEL_26;
      }
      uint64_t v56 = v69;
      sub_247FE06A4(v26, v69, &qword_2692D9830);
      if (*(void *)v16 == *(void *)v56
        && v16[8] == *(unsigned char *)(v56 + 8)
        && (_s12AppleIDSetup10SetupModelV2eeoiySbAC_ACtFZ_0((unsigned __int8 *)&v16[*(int *)(v68 + 32)], (unsigned __int8 *)(v56 + *(int *)(v68 + 32))) & 1) != 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5C00);
        if (sub_248174A20())
        {
          uint64_t v57 = &qword_2692D9830;
          sub_247FB33D4(v56, &qword_2692D9830);
          uint64_t v58 = (uint64_t)v16;
          goto LABEL_19;
        }
      }
      uint64_t v62 = &qword_2692D9830;
      sub_247FB33D4(v56, &qword_2692D9830);
      uint64_t v63 = (uint64_t)v16;
      goto LABEL_30;
    case 3u:
      sub_2481713F4((uint64_t)v25, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
      if (swift_getEnumCaseMultiPayload() != 3)
      {
        uint64_t v60 = &qword_2692D9840;
        uint64_t v61 = (uint64_t)v13;
LABEL_26:
        sub_247FB33D4(v61, v60);
        goto LABEL_27;
      }
      uint64_t v59 = v70;
      sub_247FE06A4(v26, (uint64_t)v70, &qword_2692D9840);
      if (*(void *)v13 == *(void *)v59
        && *((void *)v13 + 1) == *((void *)v59 + 1)
        && (_s12AppleIDSetup10SetupModelV2eeoiySbAC_ACtFZ_0(&v13[*(int *)(v67 + 32)], &v59[*(int *)(v67 + 32)]) & 1) != 0)
      {
        uint64_t v57 = &qword_2692D9840;
        sub_247FB33D4((uint64_t)v59, &qword_2692D9840);
        uint64_t v58 = (uint64_t)v13;
LABEL_19:
        sub_247FB33D4(v58, v57);
LABEL_21:
        sub_24817150C((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
        char v37 = 1;
        return v37 & 1;
      }
      uint64_t v62 = &qword_2692D9840;
      sub_247FB33D4((uint64_t)v59, &qword_2692D9840);
      uint64_t v63 = (uint64_t)v13;
LABEL_30:
      sub_247FB33D4(v63, v62);
      sub_24817150C((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
      goto LABEL_31;
    case 4u:
      sub_2481713F4((uint64_t)v25, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
      uint64_t v27 = *(void *)v10;
      uint64_t v28 = *((void *)v10 + 1);
      uint64_t v30 = *((void *)v10 + 2);
      uint64_t v29 = *((void *)v10 + 3);
      uint64_t v32 = *((void *)v10 + 4);
      uint64_t v31 = *((void *)v10 + 5);
      int v33 = v10[48];
      if (swift_getEnumCaseMultiPayload() == 4)
      {
        uint64_t v34 = *(void *)v26;
        uint64_t v71 = *(void *)(v26 + 8);
        char v70 = *(unsigned __int8 **)(v26 + 16);
        uint64_t v69 = *(void *)(v26 + 24);
        uint64_t v68 = *(void *)(v26 + 32);
        uint64_t v67 = *(void *)(v26 + 40);
        char v35 = *(unsigned char *)(v26 + 48);
        uint64_t v82 = v27;
        uint64_t v83 = v28;
        uint64_t v84 = v30;
        uint64_t v85 = v29;
        uint64_t v86 = v32;
        uint64_t v87 = v31;
        LOBYTE(v88) = v33;
        uint64_t v73 = v34;
        uint64_t v74 = v71;
        *(void *)&long long v75 = v70;
        *((void *)&v75 + 1) = v69;
        uint64_t v76 = v68;
        uint64_t v77 = v67;
        LOBYTE(v78) = v35;
        char v36 = static SetupError.== infix(_:_:)((uint64_t)&v82, (uint64_t)&v73);
        LODWORD(v72) = v33;
        char v37 = v36;
        sub_247FA98EC(v34, v71, (uint64_t)v70, v69, v68, v67, v35);
        sub_247FA98EC(v27, v28, v30, v29, v32, v31, v72);
        goto LABEL_33;
      }
      sub_247FA98EC(v27, v28, v30, v29, v32, v31, v33);
      goto LABEL_27;
    case 5u:
      if (swift_getEnumCaseMultiPayload() == 5) {
        goto LABEL_21;
      }
      goto LABEL_27;
    default:
      sub_2481713F4((uint64_t)v25, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
      if (swift_getEnumCaseMultiPayload())
      {
        sub_24817150C((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for SetupModel);
LABEL_27:
        sub_247FB33D4((uint64_t)v25, &qword_2692DC928);
LABEL_31:
        char v37 = 0;
      }
      else
      {
        sub_24817145C(v26, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for SetupModel);
        char v37 = _s12AppleIDSetup10SetupModelV2eeoiySbAC_ACtFZ_0(v21, v6);
        sub_24817150C((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for SetupModel);
        sub_24817150C((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for SetupModel);
LABEL_33:
        sub_24817150C((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
      }
      return v37 & 1;
  }
}

uint64_t type metadata accessor for MachSetupMessage()
{
  uint64_t result = qword_2692DC798;
  if (!qword_2692DC798) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24816625C()
{
  unint64_t result = qword_2692DC5F8;
  if (!qword_2692DC5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC5F8);
  }
  return result;
}

unint64_t sub_2481662B0()
{
  unint64_t result = qword_2692DC600;
  if (!qword_2692DC600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC600);
  }
  return result;
}

unint64_t sub_248166304()
{
  unint64_t result = qword_2692DC608;
  if (!qword_2692DC608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC608);
  }
  return result;
}

unint64_t sub_248166358()
{
  unint64_t result = qword_2692DC610;
  if (!qword_2692DC610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC610);
  }
  return result;
}

unint64_t sub_2481663AC()
{
  unint64_t result = qword_2692DC618;
  if (!qword_2692DC618)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692D9840);
    sub_2481714C4(&qword_2692DB5F0, (void (*)(uint64_t))type metadata accessor for SetupModel);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC618);
  }
  return result;
}

unint64_t sub_248166450()
{
  unint64_t result = qword_2692DC620;
  if (!qword_2692DC620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC620);
  }
  return result;
}

unint64_t sub_2481664A4()
{
  unint64_t result = qword_2692DC628;
  if (!qword_2692DC628)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692D9830);
    sub_2481714C4(&qword_2692DB5F0, (void (*)(uint64_t))type metadata accessor for SetupModel);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC628);
  }
  return result;
}

unint64_t sub_248166548()
{
  unint64_t result = qword_2692DC630;
  if (!qword_2692DC630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC630);
  }
  return result;
}

unint64_t sub_24816659C()
{
  unint64_t result = qword_2692DC638;
  if (!qword_2692DC638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC638);
  }
  return result;
}

unint64_t sub_2481665F0()
{
  unint64_t result = qword_2692DC678;
  if (!qword_2692DC678)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692D9840);
    sub_2481714C4(&qword_2692DB608, (void (*)(uint64_t))type metadata accessor for SetupModel);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC678);
  }
  return result;
}

unint64_t sub_248166694()
{
  unint64_t result = qword_2692DC680;
  if (!qword_2692DC680)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692D9830);
    sub_2481714C4(&qword_2692DB608, (void (*)(uint64_t))type metadata accessor for SetupModel);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC680);
  }
  return result;
}

unint64_t sub_248166738()
{
  unint64_t result = qword_2692DC6D8;
  if (!qword_2692DC6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC6D8);
  }
  return result;
}

unint64_t sub_24816678C()
{
  unint64_t result = qword_2692DC6E0;
  if (!qword_2692DC6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC6E0);
  }
  return result;
}

unint64_t sub_2481667E0()
{
  unint64_t result = qword_2692DC6E8;
  if (!qword_2692DC6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC6E8);
  }
  return result;
}

unint64_t sub_248166834()
{
  unint64_t result = qword_2692DC6F0;
  if (!qword_2692DC6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC6F0);
  }
  return result;
}

unint64_t sub_248166888()
{
  unint64_t result = qword_2692DC6F8;
  if (!qword_2692DC6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC6F8);
  }
  return result;
}

unint64_t sub_2481668DC()
{
  unint64_t result = qword_2692DC700;
  if (!qword_2692DC700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC700);
  }
  return result;
}

unint64_t sub_248166930()
{
  unint64_t result = qword_2692DC708;
  if (!qword_2692DC708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC708);
  }
  return result;
}

unint64_t sub_248166984()
{
  unint64_t result = qword_2692DC710;
  if (!qword_2692DC710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC710);
  }
  return result;
}

unint64_t sub_2481669D8()
{
  unint64_t result = qword_2692DC718;
  if (!qword_2692DC718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC718);
  }
  return result;
}

unint64_t sub_248166A2C()
{
  unint64_t result = qword_2692DC720;
  if (!qword_2692DC720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC720);
  }
  return result;
}

uint64_t sub_248166A80()
{
  sub_247FA98EC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(unsigned char *)(v0 + 64));
  sub_247FA98EC(*(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96), *(void *)(v0 + 104), *(void *)(v0 + 112), *(unsigned char *)(v0 + 120));
  return MEMORY[0x270FA0238](v0, 121, 7);
}

uint64_t sub_248166AD8(void *a1)
{
  a1[1] = sub_2481714C4(&qword_2692D9848, (void (*)(uint64_t))type metadata accessor for MachSetupMessage);
  a1[2] = sub_2481714C4(&qword_2692D9850, (void (*)(uint64_t))type metadata accessor for MachSetupMessage);
  uint64_t result = sub_2481714C4(&qword_2692DC778, (void (*)(uint64_t))type metadata accessor for MachSetupMessage);
  a1[3] = result;
  return result;
}

uint64_t sub_248166B84()
{
  return sub_2481714C4(&qword_2692DC780, (void (*)(uint64_t))type metadata accessor for MachSetupMessage);
}

unint64_t sub_248166BCC(void *a1)
{
  a1[1] = sub_247FAAB40();
  a1[2] = sub_247FAAAEC();
  unint64_t result = sub_248166C04();
  a1[3] = result;
  return result;
}

unint64_t sub_248166C04()
{
  unint64_t result = qword_2692DC788;
  if (!qword_2692DC788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC788);
  }
  return result;
}

unint64_t sub_248166C5C()
{
  unint64_t result = qword_2692DC790;
  if (!qword_2692DC790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC790);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for MachSetupMessage(char *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *(unsigned char *)v3;
        uint64_t v7 = (void *)v3[1];
        uint64_t v8 = (void *)v3[2];
        uint64_t v9 = v3[3];
        uint64_t v10 = *((unsigned __int16 *)v3 + 18);
        uint64_t v11 = *((unsigned int *)v3 + 8);
        sub_247FE4184(v7, v8, v9, v11 | (v10 << 32));
        *((void *)a1 + 1) = v7;
        *((void *)a1 + 2) = v8;
        *((void *)a1 + 3) = v9;
        *((_WORD *)a1 + 18) = v10;
        *((_DWORD *)a1 + 8) = v11;
        unsigned int v12 = *((unsigned __int8 *)v3 + 88);
        if (v12 <= 0xF9)
        {
          uint64_t v49 = v3[5];
          uint64_t v50 = v3[6];
          uint64_t v51 = v3;
          uint64_t v52 = v3[7];
          uint64_t v53 = v3[8];
          uint64_t v54 = v51[9];
          uint64_t v55 = v51[10];
          sub_247FA9804(v49, v50, v52, v53, v54, v55, v12);
          *((void *)a1 + 5) = v49;
          *((void *)a1 + 6) = v50;
          *((void *)a1 + 7) = v52;
          *((void *)a1 + 8) = v53;
          uint64_t v3 = v51;
          *((void *)a1 + 9) = v54;
          *((void *)a1 + 10) = v55;
          a1[88] = v12;
        }
        else
        {
          long long v13 = *(_OWORD *)(v3 + 7);
          *(_OWORD *)(a1 + 40) = *(_OWORD *)(v3 + 5);
          *(_OWORD *)(a1 + 56) = v13;
          *(_OWORD *)(a1 + 72) = *(_OWORD *)(v3 + 9);
          a1[88] = *((unsigned char *)v3 + 88);
        }
        v537 = (unsigned __int16 *)v3;
        a1[96] = *((unsigned char *)v3 + 96);
        a1[97] = *((unsigned char *)v3 + 97);
        uint64_t v56 = v3[14];
        *((void *)a1 + 13) = v3[13];
        *((void *)a1 + 14) = v56;
        uint64_t v57 = v3[16];
        *((void *)a1 + 15) = v3[15];
        *((void *)a1 + 16) = v57;
        *((void *)a1 + 17) = v3[17];
        *((_WORD *)a1 + 72) = *((_WORD *)v3 + 72);
        uint64_t v58 = v3[20];
        *((void *)a1 + 19) = v3[19];
        *((void *)a1 + 20) = v58;
        uint64_t v59 = v3[21];
        uint64_t v60 = v3[22];
        uint64_t v61 = v3[23];
        uint64_t v62 = *((void *)v537 + 24);
        uint64_t v63 = *((void *)v537 + 25);
        uint64_t v64 = *((void *)v537 + 26);
        unsigned int v65 = *((unsigned __int8 *)v537 + 216);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247FE41AC(v59, v60, v61, v62, v63, v64, v65);
        *((void *)a1 + 21) = v59;
        *((void *)a1 + 22) = v60;
        *((void *)a1 + 23) = v61;
        *((void *)a1 + 24) = v62;
        *((void *)a1 + 25) = v63;
        *((void *)a1 + 26) = v64;
        a1[216] = v65;
        uint64_t v66 = *((void *)v537 + 29);
        if (v66)
        {
          *((void *)a1 + 28) = *((void *)v537 + 28);
          *((void *)a1 + 29) = v66;
          uint64_t v67 = *((void *)v537 + 31);
          *((void *)a1 + 30) = *((void *)v537 + 30);
          *((void *)a1 + 31) = v67;
          swift_bridgeObjectRetain();
          swift_retain();
          swift_retain();
        }
        else
        {
          long long v103 = *((_OWORD *)v537 + 15);
          *((_OWORD *)a1 + 14) = *((_OWORD *)v537 + 14);
          *((_OWORD *)a1 + 15) = v103;
        }
        uint64_t v104 = *((void *)v537 + 33);
        *((void *)a1 + 32) = *((void *)v537 + 32);
        *((void *)a1 + 33) = v104;
        uint64_t v105 = *((void *)v537 + 35);
        *((void *)a1 + 34) = *((void *)v537 + 34);
        *((void *)a1 + 35) = v105;
        uint64_t v511 = type metadata accessor for SetupModel();
        uint64_t v106 = *(int *)(v511 + 32);
        uint64_t v107 = &a1[v106];
        uint64_t v108 = (void *)((char *)v537 + v106);
        uint64_t v109 = type metadata accessor for IdMSAccount();
        uint64_t v472 = *(void *)(v109 - 8);
        uint64_t v110 = *(unsigned int (**)(char *, uint64_t, int *))(v472 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v505 = v110;
        v519 = v107;
        v530 = (int *)v109;
        v535 = a1;
        if (v110((char *)v108, 1, (int *)v109))
        {
          uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v107, v108, *(void *)(*(void *)(v111 - 8) + 64));
        }
        else
        {
          uint64_t v130 = v108[1];
          *(void *)uint64_t v107 = *v108;
          *((void *)v107 + 1) = v130;
          uint64_t v131 = v108[3];
          *((void *)v107 + 2) = v108[2];
          *((void *)v107 + 3) = v131;
          uint64_t v132 = v108[5];
          *((void *)v107 + 4) = v108[4];
          *((void *)v107 + 5) = v132;
          uint64_t v133 = v108[7];
          *((void *)v107 + 6) = v108[6];
          *((void *)v107 + 7) = v133;
          uint64_t v134 = v108[9];
          *((void *)v107 + 8) = v108[8];
          *((void *)v107 + 9) = v134;
          uint64_t v135 = *(int *)(v109 + 20);
          v495 = (char *)v108 + v135;
          v499 = &v107[v135];
          uint64_t v136 = sub_248174700();
          v137 = *(void (**)(char *, char *, uint64_t))(*(void *)(v136 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v137(v499, v495, v136);
          uint64_t v138 = *(int *)(v109 + 24);
          int64_t v139 = &v107[v138];
          uint64_t v140 = (char *)v108 + v138;
          uint64_t v141 = *(void *)v140;
          uint64_t v142 = *((void *)v140 + 1);
          uint64_t v143 = *((void *)v140 + 2);
          uint64_t v144 = *((void *)v140 + 3);
          uint64_t v145 = *((void *)v140 + 4);
          uint64_t v146 = *((void *)v140 + 5);
          uint64_t v147 = *((void *)v140 + 6);
          uint64_t v496 = *((void *)v140 + 7);
          uint64_t v500 = *((void *)v140 + 8);
          char v148 = v140[72];
          sub_247FABF8C(*(void *)v140, v142, v143, v144, v145, v146, v147, v496, v500, v148);
          *(void *)int64_t v139 = v141;
          *((void *)v139 + 1) = v142;
          *((void *)v139 + 2) = v143;
          *((void *)v139 + 3) = v144;
          *((void *)v139 + 4) = v145;
          *((void *)v139 + 5) = v146;
          *((void *)v139 + 6) = v147;
          *((void *)v139 + 7) = v496;
          *((void *)v139 + 8) = v500;
          v139[72] = v148;
          uint64_t v107 = v519;
          *(void *)&v519[v530[7]] = *(void *)((char *)v108 + v530[7]);
          uint64_t v149 = *(void (**)(char *, void, uint64_t, int *))(v472 + 56);
          swift_bridgeObjectRetain();
          v149(v519, 0, 1, v530);
        }
        uint64_t v150 = (int *)type metadata accessor for AuthenticationModel();
        uint64_t v151 = v150[5];
        uint64_t v152 = &v107[v151];
        uint64_t v153 = (void *)((char *)v108 + v151);
        uint64_t v154 = v153[1];
        if (v154)
        {
          *(void *)uint64_t v152 = *v153;
          *((void *)v152 + 1) = v154;
          uint64_t v155 = v153[3];
          *((void *)v152 + 2) = v153[2];
          *((void *)v152 + 3) = v155;
          uint64_t v156 = v153[5];
          *((void *)v152 + 4) = v153[4];
          *((void *)v152 + 5) = v156;
          uint64_t v157 = v153[7];
          *((void *)v152 + 6) = v153[6];
          *((void *)v152 + 7) = v157;
          uint64_t v158 = v153[9];
          *((void *)v152 + 8) = v153[8];
          *((void *)v152 + 9) = v158;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v212 = *((_OWORD *)v153 + 3);
          *((_OWORD *)v152 + 2) = *((_OWORD *)v153 + 2);
          *((_OWORD *)v152 + 3) = v212;
          *((_OWORD *)v152 + 4) = *((_OWORD *)v153 + 4);
          long long v213 = *((_OWORD *)v153 + 1);
          *(_OWORD *)uint64_t v152 = *(_OWORD *)v153;
          *((_OWORD *)v152 + 1) = v213;
        }
        v107[v150[6]] = *((unsigned char *)v108 + v150[6]);
        uint64_t v214 = v150[7];
        v215 = &v107[v214];
        v216 = (void *)((char *)v108 + v214);
        uint64_t v217 = v216[1];
        *(void *)v215 = *v216;
        *((void *)v215 + 1) = v217;
        *(void *)&v107[v150[8]] = *(void *)((char *)v108 + v150[8]);
        v107[v150[9]] = *((unsigned char *)v108 + v150[9]);
        uint64_t v218 = v150[10];
        v219 = &v107[v218];
        v220 = (char *)v108 + v218;
        v221 = (void *)*((void *)v220 + 1);
        v491 = *(void **)v220;
        v498 = v150;
        v222 = (void *)*((void *)v220 + 2);
        v223 = (void *)*((void *)v220 + 3);
        v503 = v108;
        v224 = (void *)*((void *)v220 + 4);
        uint64_t v225 = *((void *)v220 + 6);
        v478 = (void *)*((void *)v220 + 5);
        v484 = (void *)*((void *)v220 + 7);
        v226 = (void *)*((void *)v220 + 8);
        v227 = (void *)*((void *)v220 + 9);
        char v228 = v220[80];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247F986A0(v491, v221, v222, v223, v224, v478, v225, v484, v226, v227, v228);
        *(void *)v219 = v491;
        *((void *)v219 + 1) = v221;
        *((void *)v219 + 2) = v222;
        *((void *)v219 + 3) = v223;
        *((void *)v219 + 4) = v224;
        *((void *)v219 + 5) = v478;
        *((void *)v219 + 6) = v225;
        *((void *)v219 + 7) = v484;
        *((void *)v219 + 8) = v226;
        *((void *)v219 + 9) = v227;
        v219[80] = v228;
        uint64_t v229 = v498[11];
        v230 = &v519[v229];
        v231 = (void *)((char *)v503 + v229);
        if (*v231)
        {
          uint64_t v232 = v231[1];
          *(void *)v230 = *v231;
          *((void *)v230 + 1) = v232;
          swift_retain();
        }
        else
        {
          *(_OWORD *)v230 = *(_OWORD *)v231;
        }
        uint64_t v272 = *(int *)(v511 + 36);
        v273 = &v535[v272];
        v274 = (void *)((char *)v537 + v272);
        if (v505((char *)v537 + v272, 1, v530))
        {
          uint64_t v275 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v273, v274, *(void *)(*(void *)(v275 - 8) + 64));
        }
        else
        {
          uint64_t v284 = v274[1];
          *(void *)v273 = *v274;
          *((void *)v273 + 1) = v284;
          uint64_t v285 = v274[3];
          *((void *)v273 + 2) = v274[2];
          *((void *)v273 + 3) = v285;
          uint64_t v286 = v274[5];
          *((void *)v273 + 4) = v274[4];
          *((void *)v273 + 5) = v286;
          uint64_t v287 = v274[7];
          *((void *)v273 + 6) = v274[6];
          *((void *)v273 + 7) = v287;
          uint64_t v288 = v274[9];
          *((void *)v273 + 8) = v274[8];
          *((void *)v273 + 9) = v288;
          uint64_t v289 = v530[5];
          v540 = &v273[v289];
          v523 = (char *)v274 + v289;
          uint64_t v290 = sub_248174700();
          v513 = *(void (**)(char *, char *, uint64_t))(*(void *)(v290 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v513(v540, v523, v290);
          uint64_t v291 = v530[6];
          v292 = &v273[v291];
          v293 = (char *)v274 + v291;
          uint64_t v294 = *((void *)v293 + 1);
          uint64_t v514 = *(void *)v293;
          uint64_t v295 = *((void *)v293 + 2);
          uint64_t v296 = *((void *)v293 + 3);
          uint64_t v297 = *((void *)v293 + 4);
          uint64_t v298 = *((void *)v293 + 5);
          uint64_t v299 = *((void *)v293 + 6);
          uint64_t v300 = *((void *)v293 + 7);
          uint64_t v524 = *((void *)v293 + 8);
          LOBYTE(v540) = v293[72];
          sub_247FABF8C(*(void *)v293, v294, v295, v296, v297, v298, v299, v300, v524, (char)v540);
          *(void *)v292 = v514;
          *((void *)v292 + 1) = v294;
          *((void *)v292 + 2) = v295;
          *((void *)v292 + 3) = v296;
          *((void *)v292 + 4) = v297;
          *((void *)v292 + 5) = v298;
          *((void *)v292 + 6) = v299;
          *((void *)v292 + 7) = v300;
          *((void *)v292 + 8) = v524;
          v292[72] = (char)v540;
          *(void *)&v273[v530[7]] = *(void *)((char *)v274 + v530[7]);
          v301 = *(void (**)(char *, void, uint64_t, int *))(v472 + 56);
          swift_bridgeObjectRetain();
          v301(v273, 0, 1, v530);
        }
        v302 = (int *)type metadata accessor for SignInModel();
        uint64_t v303 = v302[5];
        v304 = &v273[v303];
        v305 = (void *)((char *)v274 + v303);
        uint64_t v306 = v305[1];
        if (v306)
        {
          *(void *)v304 = *v305;
          *((void *)v304 + 1) = v306;
          uint64_t v307 = v305[3];
          *((void *)v304 + 2) = v305[2];
          *((void *)v304 + 3) = v307;
          uint64_t v308 = v305[5];
          *((void *)v304 + 4) = v305[4];
          *((void *)v304 + 5) = v308;
          uint64_t v309 = v305[7];
          *((void *)v304 + 6) = v305[6];
          *((void *)v304 + 7) = v309;
          uint64_t v310 = v305[9];
          *((void *)v304 + 8) = v305[8];
          *((void *)v304 + 9) = v310;
          v311 = v305 + 10;
          unint64_t v312 = v305[11];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v312 >> 60 == 15)
          {
            *((_OWORD *)v304 + 5) = *(_OWORD *)v311;
          }
          else
          {
            uint64_t v380 = *v311;
            sub_247FB6C20(*v311, v312);
            *((void *)v304 + 10) = v380;
            *((void *)v304 + 11) = v312;
          }
        }
        else
        {
          long long v371 = *((_OWORD *)v305 + 3);
          *((_OWORD *)v304 + 2) = *((_OWORD *)v305 + 2);
          *((_OWORD *)v304 + 3) = v371;
          long long v372 = *((_OWORD *)v305 + 5);
          *((_OWORD *)v304 + 4) = *((_OWORD *)v305 + 4);
          *((_OWORD *)v304 + 5) = v372;
          long long v373 = *((_OWORD *)v305 + 1);
          *(_OWORD *)v304 = *(_OWORD *)v305;
          *((_OWORD *)v304 + 1) = v373;
        }
        *(void *)&v273[v302[6]] = *(void *)((char *)v274 + v302[6]);
        *(void *)&v273[v302[7]] = *(void *)((char *)v274 + v302[7]);
        v273[v302[8]] = *((unsigned char *)v274 + v302[8]);
        v273[v302[9]] = *((unsigned char *)v274 + v302[9]);
        uint64_t v381 = v302[10];
        v382 = &v273[v381];
        v383 = (void *)((char *)v274 + v381);
        uint64_t v384 = *(void *)((char *)v274 + v381 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v384)
        {
          *(void *)v382 = *v383;
          *((void *)v382 + 1) = v384;
          uint64_t v385 = v383[2];
          uint64_t v386 = v383[3];
          *((void *)v382 + 2) = v385;
          *((void *)v382 + 3) = v386;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v387 = *((_OWORD *)v383 + 1);
          *(_OWORD *)v382 = *(_OWORD *)v383;
          *((_OWORD *)v382 + 1) = v387;
        }
        uint64_t v388 = v302[11];
        v389 = &v273[v388];
        v390 = (void *)((char *)v274 + v388);
        uint64_t v391 = v390[1];
        *(void *)v389 = *v390;
        *((void *)v389 + 1) = v391;
        uint64_t v392 = v302[12];
        v393 = *(void **)((char *)v274 + v392);
        *(void *)&v273[v392] = v393;
        uint64_t v394 = v302[13];
        v395 = &v273[v394];
        v396 = (char *)v274 + v394;
        uint64_t v397 = *(void *)v396;
        uint64_t v398 = *((void *)v396 + 1);
        char v399 = v396[16];
        swift_bridgeObjectRetain();
        id v400 = v393;
        sub_247FE42A8(v397, v398, v399);
        *(void *)v395 = v397;
        *((void *)v395 + 1) = v398;
        v395[16] = v399;
        uint64_t v401 = v302[14];
        v402 = &v273[v401];
        v403 = (void *)((char *)v274 + v401);
        uint64_t v404 = v403[1];
        *(void *)v402 = *v403;
        *((void *)v402 + 1) = v404;
        v273[v302[15]] = *((unsigned char *)v274 + v302[15]);
        uint64_t v405 = v302[16];
        v406 = &v273[v405];
        v407 = (char *)v274 + v405;
        unint64_t v408 = *(void *)((char *)v274 + v405 + 8);
        swift_bridgeObjectRetain();
        if (v408 >= 3) {
          goto LABEL_83;
        }
        long long v409 = *((_OWORD *)v407 + 1);
        *(_OWORD *)v406 = *(_OWORD *)v407;
        *((_OWORD *)v406 + 1) = v409;
        v406[32] = v407[32];
        goto LABEL_84;
      case 1u:
        uint64_t v16 = v3[1];
        *(void *)a1 = *v3;
        *((void *)a1 + 1) = v16;
        uint64_t v17 = v3[3];
        *((void *)a1 + 2) = v3[2];
        *((void *)a1 + 3) = v17;
        *((void *)a1 + 4) = v3[4];
        uint64_t v18 = v3[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v18)
        {
          *((void *)a1 + 5) = v3[5];
          *((void *)a1 + 6) = v18;
          uint64_t v19 = v3[8];
          *((void *)a1 + 7) = v3[7];
          *((void *)a1 + 8) = v19;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v102 = *(_OWORD *)(v3 + 7);
          *(_OWORD *)(a1 + 40) = *(_OWORD *)(v3 + 5);
          *(_OWORD *)(a1 + 56) = v102;
        }
        *((void *)a1 + 9) = v3[9];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        *(void *)a1 = *v3;
        a1[8] = *((unsigned char *)v3 + 8);
        uint64_t v470 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
        uint64_t v20 = *(int *)(v470 + 32);
        v534 = a1;
        uint64_t v21 = &a1[v20];
        uint64_t v22 = (char *)v3 + v20;
        a1[v20] = *((unsigned char *)v3 + v20);
        uint64_t v23 = *(void **)((char *)v3 + v20 + 8);
        uint64_t v24 = *(void **)((char *)v3 + v20 + 16);
        uint64_t v25 = *(uint64_t *)((char *)v3 + v20 + 24);
        uint64_t v26 = *(unsigned __int16 *)((char *)v3 + v20 + 36);
        uint64_t v27 = *(unsigned int *)((char *)v3 + v20 + 32);
        sub_247FE4184(v23, v24, v25, v27 | (v26 << 32));
        *((void *)v21 + 1) = v23;
        *((void *)v21 + 2) = v24;
        *((void *)v21 + 3) = v25;
        *((_WORD *)v21 + 18) = v26;
        *((_DWORD *)v21 + 8) = v27;
        unsigned int v28 = v22[88];
        v536 = (unsigned __int16 *)v3;
        if (v28 <= 0xF9)
        {
          uint64_t v68 = *((void *)v22 + 5);
          uint64_t v69 = *((void *)v22 + 6);
          uint64_t v70 = *((void *)v22 + 7);
          uint64_t v71 = *((void *)v22 + 8);
          uint64_t v73 = *((void *)v22 + 9);
          uint64_t v72 = *((void *)v22 + 10);
          sub_247FA9804(v68, v69, v70, v71, v73, v72, v28);
          *((void *)v21 + 5) = v68;
          *((void *)v21 + 6) = v69;
          *((void *)v21 + 7) = v70;
          *((void *)v21 + 8) = v71;
          *((void *)v21 + 9) = v73;
          *((void *)v21 + 10) = v72;
          v21[88] = v28;
        }
        else
        {
          long long v29 = *(_OWORD *)(v22 + 56);
          *(_OWORD *)(v21 + 40) = *(_OWORD *)(v22 + 40);
          *(_OWORD *)(v21 + 56) = v29;
          *(_OWORD *)(v21 + 72) = *(_OWORD *)(v22 + 72);
          v21[88] = v22[88];
        }
        v21[96] = v22[96];
        v21[97] = v22[97];
        uint64_t v74 = *((void *)v22 + 14);
        *((void *)v21 + 13) = *((void *)v22 + 13);
        *((void *)v21 + 14) = v74;
        uint64_t v75 = *((void *)v22 + 16);
        *((void *)v21 + 15) = *((void *)v22 + 15);
        *((void *)v21 + 16) = v75;
        *((void *)v21 + 17) = *((void *)v22 + 17);
        *((_WORD *)v21 + 72) = *((_WORD *)v22 + 72);
        uint64_t v76 = *((void *)v22 + 20);
        *((void *)v21 + 19) = *((void *)v22 + 19);
        *((void *)v21 + 20) = v76;
        uint64_t v77 = *((void *)v22 + 21);
        uint64_t v78 = *((void *)v22 + 22);
        uint64_t v79 = *((void *)v22 + 23);
        uint64_t v80 = *((void *)v22 + 24);
        uint64_t v81 = *((void *)v22 + 25);
        uint64_t v82 = *((void *)v22 + 26);
        unsigned int v529 = v22[216];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247FE41AC(v77, v78, v79, v80, v81, v82, v529);
        *((void *)v21 + 21) = v77;
        *((void *)v21 + 22) = v78;
        *((void *)v21 + 23) = v79;
        *((void *)v21 + 24) = v80;
        *((void *)v21 + 25) = v81;
        *((void *)v21 + 26) = v82;
        v21[216] = v529;
        uint64_t v83 = *((void *)v22 + 29);
        if (v83)
        {
          *((void *)v21 + 28) = *((void *)v22 + 28);
          *((void *)v21 + 29) = v83;
          uint64_t v84 = *((void *)v22 + 31);
          *((void *)v21 + 30) = *((void *)v22 + 30);
          *((void *)v21 + 31) = v84;
          swift_bridgeObjectRetain();
          swift_retain();
          swift_retain();
        }
        else
        {
          long long v112 = *((_OWORD *)v22 + 15);
          *((_OWORD *)v21 + 14) = *((_OWORD *)v22 + 14);
          *((_OWORD *)v21 + 15) = v112;
        }
        uint64_t v113 = *((void *)v22 + 33);
        *((void *)v21 + 32) = *((void *)v22 + 32);
        *((void *)v21 + 33) = v113;
        uint64_t v114 = *((void *)v22 + 35);
        *((void *)v21 + 34) = *((void *)v22 + 34);
        *((void *)v21 + 35) = v114;
        uint64_t v506 = type metadata accessor for SetupModel();
        uint64_t v115 = *(int *)(v506 + 32);
        uint64_t v116 = &v21[v115];
        uint64_t v117 = &v22[v115];
        uint64_t v118 = (int *)type metadata accessor for IdMSAccount();
        uint64_t v469 = *((void *)v118 - 1);
        uint64_t v119 = *(unsigned int (**)(char *, uint64_t, int *))(v469 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v494 = v119;
        v509 = v118;
        v512 = v116;
        v531 = v117;
        if (v119(v117, 1, v118))
        {
          uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v116, v117, *(void *)(*(void *)(v120 - 8) + 64));
        }
        else
        {
          uint64_t v159 = *((void *)v117 + 1);
          *(void *)uint64_t v116 = *(void *)v117;
          *((void *)v116 + 1) = v159;
          uint64_t v160 = *((void *)v117 + 3);
          *((void *)v116 + 2) = *((void *)v117 + 2);
          *((void *)v116 + 3) = v160;
          uint64_t v161 = *((void *)v117 + 5);
          *((void *)v116 + 4) = *((void *)v117 + 4);
          *((void *)v116 + 5) = v161;
          uint64_t v162 = *((void *)v117 + 7);
          *((void *)v116 + 6) = *((void *)v117 + 6);
          *((void *)v116 + 7) = v162;
          uint64_t v163 = *((void *)v117 + 8);
          uint64_t v164 = *((void *)v117 + 9);
          *((void *)v116 + 8) = v163;
          *((void *)v116 + 9) = v164;
          uint64_t v165 = v118[5];
          v521 = &v116[v165];
          v487 = &v531[v165];
          uint64_t v166 = sub_248174700();
          v481 = *(void (**)(char *, char *, uint64_t))(*(void *)(v166 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v481(v521, v487, v166);
          uint64_t v167 = v118[6];
          v168 = &v116[v167];
          char v169 = &v531[v167];
          uint64_t v170 = *(void *)v169;
          uint64_t v171 = *((void *)v169 + 1);
          uint64_t v173 = *((void *)v169 + 2);
          uint64_t v172 = *((void *)v169 + 3);
          uint64_t v174 = *((void *)v169 + 4);
          uint64_t v175 = *((void *)v169 + 5);
          uint64_t v476 = *((void *)v169 + 7);
          uint64_t v482 = *((void *)v169 + 6);
          uint64_t v488 = *((void *)v169 + 8);
          LOBYTE(v521) = v169[72];
          sub_247FABF8C(*(void *)v169, v171, v173, v172, v174, v175, v482, v476, v488, (char)v521);
          *(void *)v168 = v170;
          *((void *)v168 + 1) = v171;
          *((void *)v168 + 2) = v173;
          *((void *)v168 + 3) = v172;
          *((void *)v168 + 4) = v174;
          *((void *)v168 + 5) = v175;
          uint64_t v117 = v531;
          *((void *)v168 + 6) = v482;
          *((void *)v168 + 7) = v476;
          *((void *)v168 + 8) = v488;
          v168[72] = (char)v521;
          uint64_t v116 = v512;
          *(void *)&v512[v118[7]] = *(void *)&v531[v118[7]];
          uint64_t v176 = *(void (**)(char *, void, uint64_t, int *))(v469 + 56);
          swift_bridgeObjectRetain();
          v176(v512, 0, 1, v118);
        }
        uint64_t v177 = (int *)type metadata accessor for AuthenticationModel();
        uint64_t v178 = v177[5];
        char v179 = &v116[v178];
        v180 = &v117[v178];
        uint64_t v181 = *((void *)v180 + 1);
        if (v181)
        {
          *(void *)char v179 = *(void *)v180;
          *((void *)v179 + 1) = v181;
          uint64_t v182 = *((void *)v180 + 3);
          *((void *)v179 + 2) = *((void *)v180 + 2);
          *((void *)v179 + 3) = v182;
          uint64_t v183 = *((void *)v180 + 5);
          *((void *)v179 + 4) = *((void *)v180 + 4);
          *((void *)v179 + 5) = v183;
          uint64_t v184 = *((void *)v180 + 7);
          *((void *)v179 + 6) = *((void *)v180 + 6);
          *((void *)v179 + 7) = v184;
          uint64_t v185 = *((void *)v180 + 9);
          *((void *)v179 + 8) = *((void *)v180 + 8);
          *((void *)v179 + 9) = v185;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v233 = *((_OWORD *)v180 + 3);
          *((_OWORD *)v179 + 2) = *((_OWORD *)v180 + 2);
          *((_OWORD *)v179 + 3) = v233;
          *((_OWORD *)v179 + 4) = *((_OWORD *)v180 + 4);
          long long v234 = *((_OWORD *)v180 + 1);
          *(_OWORD *)char v179 = *(_OWORD *)v180;
          *((_OWORD *)v179 + 1) = v234;
        }
        v116[v177[6]] = v117[v177[6]];
        uint64_t v235 = v177[7];
        v236 = &v116[v235];
        v237 = &v117[v235];
        uint64_t v238 = *((void *)v237 + 1);
        *(void *)v236 = *(void *)v237;
        *((void *)v236 + 1) = v238;
        *(void *)&v116[v177[8]] = *(void *)&v117[v177[8]];
        v116[v177[9]] = v117[v177[9]];
        uint64_t v239 = v177[10];
        v240 = &v116[v239];
        v241 = &v117[v239];
        v242 = (void *)*((void *)v241 + 1);
        v485 = *(void **)v241;
        v492 = v177;
        v243 = (void *)*((void *)v241 + 2);
        v244 = (void *)*((void *)v241 + 3);
        v522 = (void *)*((void *)v241 + 4);
        uint64_t v474 = *((void *)v241 + 6);
        v479 = (void *)*((void *)v241 + 5);
        v245 = (void *)*((void *)v241 + 8);
        v473 = (void *)*((void *)v241 + 7);
        v246 = (void *)*((void *)v241 + 9);
        char v247 = v241[80];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247F986A0(v485, v242, v243, v244, v522, v479, v474, v473, v245, v246, v247);
        *(void *)v240 = v485;
        *((void *)v240 + 1) = v242;
        *((void *)v240 + 2) = v243;
        *((void *)v240 + 3) = v244;
        *((void *)v240 + 4) = v522;
        *((void *)v240 + 5) = v479;
        *((void *)v240 + 6) = v474;
        *((void *)v240 + 7) = v473;
        *((void *)v240 + 8) = v245;
        *((void *)v240 + 9) = v246;
        v240[80] = v247;
        uint64_t v248 = v492[11];
        v249 = &v512[v248];
        v250 = &v531[v248];
        if (*(void *)v250)
        {
          uint64_t v251 = *((void *)v250 + 1);
          *(void *)v249 = *(void *)v250;
          *((void *)v249 + 1) = v251;
          swift_retain();
        }
        else
        {
          *(_OWORD *)v249 = *(_OWORD *)v250;
        }
        uint64_t v276 = *(int *)(v506 + 36);
        v277 = &v21[v276];
        v278 = &v22[v276];
        if (v494(&v22[v276], 1, v509))
        {
          uint64_t v279 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v277, v278, *(void *)(*(void *)(v279 - 8) + 64));
        }
        else
        {
          uint64_t v313 = *((void *)v278 + 1);
          *(void *)v277 = *(void *)v278;
          *((void *)v277 + 1) = v313;
          uint64_t v314 = *((void *)v278 + 3);
          *((void *)v277 + 2) = *((void *)v278 + 2);
          *((void *)v277 + 3) = v314;
          uint64_t v315 = *((void *)v278 + 5);
          *((void *)v277 + 4) = *((void *)v278 + 4);
          *((void *)v277 + 5) = v315;
          uint64_t v316 = *((void *)v278 + 7);
          *((void *)v277 + 6) = *((void *)v278 + 6);
          *((void *)v277 + 7) = v316;
          uint64_t v317 = *((void *)v278 + 9);
          *((void *)v277 + 8) = *((void *)v278 + 8);
          *((void *)v277 + 9) = v317;
          uint64_t v318 = v509[5];
          v525 = &v278[v318];
          v533 = &v277[v318];
          uint64_t v319 = sub_248174700();
          v515 = *(void (**)(char *, char *, uint64_t))(*(void *)(v319 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v515(v533, v525, v319);
          uint64_t v320 = v509[6];
          v321 = &v277[v320];
          v322 = &v278[v320];
          uint64_t v323 = *(void *)v322;
          uint64_t v324 = *((void *)v322 + 1);
          uint64_t v325 = *((void *)v322 + 2);
          uint64_t v326 = *((void *)v322 + 3);
          uint64_t v327 = *((void *)v322 + 4);
          uint64_t v328 = *((void *)v322 + 5);
          uint64_t v329 = *((void *)v322 + 6);
          uint64_t v516 = *((void *)v322 + 7);
          uint64_t v526 = *((void *)v322 + 8);
          LOBYTE(v533) = v322[72];
          sub_247FABF8C(*(void *)v322, v324, v325, v326, v327, v328, v329, v516, v526, (char)v533);
          *(void *)v321 = v323;
          *((void *)v321 + 1) = v324;
          *((void *)v321 + 2) = v325;
          *((void *)v321 + 3) = v326;
          *((void *)v321 + 4) = v327;
          *((void *)v321 + 5) = v328;
          *((void *)v321 + 6) = v329;
          *((void *)v321 + 7) = v516;
          *((void *)v321 + 8) = v526;
          v321[72] = (char)v533;
          *(void *)&v277[v509[7]] = *(void *)&v278[v509[7]];
          v330 = *(void (**)(char *, void, uint64_t, int *))(v469 + 56);
          swift_bridgeObjectRetain();
          v330(v277, 0, 1, v509);
        }
        v331 = (int *)type metadata accessor for SignInModel();
        uint64_t v332 = v331[5];
        v333 = &v277[v332];
        v334 = &v278[v332];
        uint64_t v335 = *((void *)v334 + 1);
        if (v335)
        {
          *(void *)v333 = *(void *)v334;
          *((void *)v333 + 1) = v335;
          uint64_t v336 = *((void *)v334 + 3);
          *((void *)v333 + 2) = *((void *)v334 + 2);
          *((void *)v333 + 3) = v336;
          uint64_t v337 = *((void *)v334 + 5);
          *((void *)v333 + 4) = *((void *)v334 + 4);
          *((void *)v333 + 5) = v337;
          uint64_t v338 = *((void *)v334 + 7);
          *((void *)v333 + 6) = *((void *)v334 + 6);
          *((void *)v333 + 7) = v338;
          uint64_t v339 = *((void *)v334 + 9);
          *((void *)v333 + 8) = *((void *)v334 + 8);
          *((void *)v333 + 9) = v339;
          v340 = (uint64_t *)(v334 + 80);
          unint64_t v341 = *((void *)v334 + 11);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v341 >> 60 == 15)
          {
            *((_OWORD *)v333 + 5) = *(_OWORD *)v340;
          }
          else
          {
            uint64_t v411 = *v340;
            sub_247FB6C20(*v340, v341);
            *((void *)v333 + 10) = v411;
            *((void *)v333 + 11) = v341;
          }
        }
        else
        {
          long long v374 = *((_OWORD *)v334 + 3);
          *((_OWORD *)v333 + 2) = *((_OWORD *)v334 + 2);
          *((_OWORD *)v333 + 3) = v374;
          long long v375 = *((_OWORD *)v334 + 5);
          *((_OWORD *)v333 + 4) = *((_OWORD *)v334 + 4);
          *((_OWORD *)v333 + 5) = v375;
          long long v376 = *((_OWORD *)v334 + 1);
          *(_OWORD *)v333 = *(_OWORD *)v334;
          *((_OWORD *)v333 + 1) = v376;
        }
        *(void *)&v277[v331[6]] = *(void *)&v278[v331[6]];
        *(void *)&v277[v331[7]] = *(void *)&v278[v331[7]];
        v277[v331[8]] = v278[v331[8]];
        v277[v331[9]] = v278[v331[9]];
        uint64_t v412 = v331[10];
        v413 = &v277[v412];
        v414 = &v278[v412];
        uint64_t v415 = *(void *)&v278[v412 + 8];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v415)
        {
          *(void *)v413 = *(void *)v414;
          *((void *)v413 + 1) = v415;
          uint64_t v416 = *((void *)v414 + 2);
          uint64_t v417 = *((void *)v414 + 3);
          *((void *)v413 + 2) = v416;
          *((void *)v413 + 3) = v417;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v418 = *((_OWORD *)v414 + 1);
          *(_OWORD *)v413 = *(_OWORD *)v414;
          *((_OWORD *)v413 + 1) = v418;
        }
        uint64_t v419 = v331[11];
        v420 = &v277[v419];
        v421 = &v278[v419];
        uint64_t v422 = *((void *)v421 + 1);
        *(void *)v420 = *(void *)v421;
        *((void *)v420 + 1) = v422;
        uint64_t v423 = v331[12];
        v424 = *(void **)&v278[v423];
        *(void *)&v277[v423] = v424;
        uint64_t v425 = v331[13];
        v426 = &v277[v425];
        v427 = &v278[v425];
        uint64_t v428 = *(void *)v427;
        uint64_t v429 = *((void *)v427 + 1);
        char v430 = v427[16];
        swift_bridgeObjectRetain();
        id v431 = v424;
        sub_247FE42A8(v428, v429, v430);
        *(void *)v426 = v428;
        *((void *)v426 + 1) = v429;
        v426[16] = v430;
        uint64_t v432 = v331[14];
        v433 = &v277[v432];
        v434 = &v278[v432];
        uint64_t v435 = *((void *)v434 + 1);
        *(void *)v433 = *(void *)v434;
        *((void *)v433 + 1) = v435;
        v277[v331[15]] = v278[v331[15]];
        uint64_t v436 = v331[16];
        v437 = &v277[v436];
        v438 = &v278[v436];
        unint64_t v439 = *(void *)&v278[v436 + 8];
        swift_bridgeObjectRetain();
        if (v439 >= 3)
        {
          *(void *)v437 = *(void *)v438;
          *((void *)v437 + 1) = v439;
          uint64_t v441 = *((void *)v438 + 3);
          *((void *)v437 + 2) = *((void *)v438 + 2);
          *((void *)v437 + 3) = v441;
          v437[32] = v438[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v440 = *((_OWORD *)v438 + 1);
          *(_OWORD *)v437 = *(_OWORD *)v438;
          *((_OWORD *)v437 + 1) = v440;
          v437[32] = v438[32];
        }
        a1 = v534;
        *(void *)&v534[*(int *)(v470 + 36)] = *(void *)((char *)v536 + *(int *)(v470 + 36));
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)v3;
        uint64_t v30 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692D9840) + 32);
        v535 = a1;
        uint64_t v31 = &a1[v30];
        uint64_t v32 = (char *)v3 + v30;
        a1[v30] = *((unsigned char *)v3 + v30);
        int v33 = *(void **)((char *)v3 + v30 + 8);
        uint64_t v34 = *(void **)((char *)v3 + v30 + 16);
        uint64_t v35 = *(uint64_t *)((char *)v3 + v30 + 24);
        uint64_t v36 = *(unsigned __int16 *)((char *)v3 + v30 + 36);
        uint64_t v37 = *(unsigned int *)((char *)v3 + v30 + 32);
        sub_247FE4184(v33, v34, v35, v37 | (v36 << 32));
        *((void *)v31 + 1) = v33;
        *((void *)v31 + 2) = v34;
        *((void *)v31 + 3) = v35;
        *((_WORD *)v31 + 18) = v36;
        *((_DWORD *)v31 + 8) = v37;
        unsigned int v38 = v32[88];
        if (v38 <= 0xF9)
        {
          uint64_t v85 = *((void *)v32 + 5);
          uint64_t v86 = *((void *)v32 + 6);
          uint64_t v88 = *((void *)v32 + 7);
          uint64_t v87 = *((void *)v32 + 8);
          uint64_t v89 = *((void *)v32 + 9);
          uint64_t v90 = *((void *)v32 + 10);
          sub_247FA9804(v85, v86, v88, v87, v89, v90, v38);
          *((void *)v31 + 5) = v85;
          *((void *)v31 + 6) = v86;
          *((void *)v31 + 7) = v88;
          *((void *)v31 + 8) = v87;
          *((void *)v31 + 9) = v89;
          *((void *)v31 + 10) = v90;
          v31[88] = v38;
        }
        else
        {
          long long v39 = *(_OWORD *)(v32 + 56);
          *(_OWORD *)(v31 + 40) = *(_OWORD *)(v32 + 40);
          *(_OWORD *)(v31 + 56) = v39;
          *(_OWORD *)(v31 + 72) = *(_OWORD *)(v32 + 72);
          v31[88] = v32[88];
        }
        v31[96] = v32[96];
        v31[97] = v32[97];
        uint64_t v91 = *((void *)v32 + 14);
        *((void *)v31 + 13) = *((void *)v32 + 13);
        *((void *)v31 + 14) = v91;
        uint64_t v92 = *((void *)v32 + 16);
        *((void *)v31 + 15) = *((void *)v32 + 15);
        *((void *)v31 + 16) = v92;
        *((void *)v31 + 17) = *((void *)v32 + 17);
        *((_WORD *)v31 + 72) = *((_WORD *)v32 + 72);
        uint64_t v93 = *((void *)v32 + 20);
        *((void *)v31 + 19) = *((void *)v32 + 19);
        *((void *)v31 + 20) = v93;
        uint64_t v94 = *((void *)v32 + 21);
        uint64_t v538 = *((void *)v32 + 22);
        uint64_t v95 = *((void *)v32 + 23);
        uint64_t v96 = *((void *)v32 + 24);
        uint64_t v97 = *((void *)v32 + 25);
        uint64_t v98 = *((void *)v32 + 26);
        unsigned int v99 = v32[216];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247FE41AC(v94, v538, v95, v96, v97, v98, v99);
        *((void *)v31 + 21) = v94;
        *((void *)v31 + 22) = v538;
        *((void *)v31 + 23) = v95;
        *((void *)v31 + 24) = v96;
        *((void *)v31 + 25) = v97;
        *((void *)v31 + 26) = v98;
        v31[216] = v99;
        uint64_t v100 = *((void *)v32 + 29);
        if (v100)
        {
          *((void *)v31 + 28) = *((void *)v32 + 28);
          *((void *)v31 + 29) = v100;
          uint64_t v101 = *((void *)v32 + 31);
          *((void *)v31 + 30) = *((void *)v32 + 30);
          *((void *)v31 + 31) = v101;
          swift_bridgeObjectRetain();
          swift_retain();
          swift_retain();
        }
        else
        {
          long long v121 = *((_OWORD *)v32 + 15);
          *((_OWORD *)v31 + 14) = *((_OWORD *)v32 + 14);
          *((_OWORD *)v31 + 15) = v121;
        }
        uint64_t v122 = *((void *)v32 + 33);
        *((void *)v31 + 32) = *((void *)v32 + 32);
        *((void *)v31 + 33) = v122;
        uint64_t v123 = *((void *)v32 + 35);
        *((void *)v31 + 34) = *((void *)v32 + 34);
        *((void *)v31 + 35) = v123;
        uint64_t v520 = type metadata accessor for SetupModel();
        uint64_t v124 = *(int *)(v520 + 32);
        uint64_t v125 = &v31[v124];
        uint64_t v126 = &v32[v124];
        uint64_t v127 = (int *)type metadata accessor for IdMSAccount();
        uint64_t v471 = *((void *)v127 - 1);
        uint64_t v128 = *(unsigned int (**)(char *, uint64_t, int *))(v471 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v510 = v128;
        v532 = v127;
        v539 = v126;
        if (v128(v126, 1, v127))
        {
          uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v125, v126, *(void *)(*(void *)(v129 - 8) + 64));
        }
        else
        {
          uint64_t v186 = *((void *)v126 + 1);
          *(void *)uint64_t v125 = *(void *)v126;
          *((void *)v125 + 1) = v186;
          uint64_t v187 = *((void *)v126 + 3);
          *((void *)v125 + 2) = *((void *)v126 + 2);
          *((void *)v125 + 3) = v187;
          uint64_t v188 = *((void *)v126 + 5);
          *((void *)v125 + 4) = *((void *)v126 + 4);
          *((void *)v125 + 5) = v188;
          uint64_t v189 = *((void *)v126 + 7);
          *((void *)v125 + 6) = *((void *)v126 + 6);
          *((void *)v125 + 7) = v189;
          uint64_t v190 = *((void *)v126 + 8);
          uint64_t v191 = *((void *)v126 + 9);
          *((void *)v125 + 8) = v190;
          *((void *)v125 + 9) = v191;
          uint64_t v192 = v127[5];
          v507 = &v125[v192];
          v501 = &v539[v192];
          uint64_t v193 = sub_248174700();
          v489 = *(void (**)(char *, char *, uint64_t))(*(void *)(v193 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v489(v507, v501, v193);
          uint64_t v194 = v127[6];
          v195 = &v125[v194];
          v196 = &v539[v194];
          uint64_t v197 = *((void *)v196 + 1);
          uint64_t v198 = *((void *)v196 + 2);
          uint64_t v199 = *((void *)v196 + 3);
          uint64_t v200 = *((void *)v196 + 5);
          uint64_t v483 = *((void *)v196 + 4);
          uint64_t v490 = *(void *)v196;
          uint64_t v201 = *((void *)v196 + 6);
          uint64_t v477 = *((void *)v196 + 7);
          uint64_t v502 = *((void *)v196 + 8);
          LOBYTE(v507) = v196[72];
          sub_247FABF8C(*(void *)v196, v197, v198, v199, v483, v200, v201, v477, v502, (char)v507);
          *(void *)v195 = v490;
          *((void *)v195 + 1) = v197;
          *((void *)v195 + 2) = v198;
          *((void *)v195 + 3) = v199;
          *((void *)v195 + 4) = v483;
          *((void *)v195 + 5) = v200;
          uint64_t v126 = v539;
          *((void *)v195 + 6) = v201;
          *((void *)v195 + 7) = v477;
          *((void *)v195 + 8) = v502;
          v195[72] = (char)v507;
          *(void *)&v125[v127[7]] = *(void *)&v539[v127[7]];
          v202 = *(void (**)(char *, void, uint64_t, int *))(v471 + 56);
          swift_bridgeObjectRetain();
          v202(v125, 0, 1, v127);
        }
        v203 = (int *)type metadata accessor for AuthenticationModel();
        uint64_t v204 = v203[5];
        v205 = &v125[v204];
        v206 = &v126[v204];
        uint64_t v207 = *((void *)v206 + 1);
        v497 = v31;
        if (v207)
        {
          *(void *)v205 = *(void *)v206;
          *((void *)v205 + 1) = v207;
          uint64_t v208 = *((void *)v206 + 3);
          *((void *)v205 + 2) = *((void *)v206 + 2);
          *((void *)v205 + 3) = v208;
          uint64_t v209 = *((void *)v206 + 5);
          *((void *)v205 + 4) = *((void *)v206 + 4);
          *((void *)v205 + 5) = v209;
          uint64_t v210 = *((void *)v206 + 7);
          *((void *)v205 + 6) = *((void *)v206 + 6);
          *((void *)v205 + 7) = v210;
          uint64_t v211 = *((void *)v206 + 9);
          *((void *)v205 + 8) = *((void *)v206 + 8);
          *((void *)v205 + 9) = v211;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v252 = *((_OWORD *)v206 + 3);
          *((_OWORD *)v205 + 2) = *((_OWORD *)v206 + 2);
          *((_OWORD *)v205 + 3) = v252;
          *((_OWORD *)v205 + 4) = *((_OWORD *)v206 + 4);
          long long v253 = *((_OWORD *)v206 + 1);
          *(_OWORD *)v205 = *(_OWORD *)v206;
          *((_OWORD *)v205 + 1) = v253;
        }
        v125[v203[6]] = v126[v203[6]];
        uint64_t v254 = v203[7];
        v255 = &v125[v254];
        v256 = &v126[v254];
        uint64_t v257 = *((void *)v256 + 1);
        *(void *)v255 = *(void *)v256;
        *((void *)v255 + 1) = v257;
        *(void *)&v125[v203[8]] = *(void *)&v126[v203[8]];
        v125[v203[9]] = v126[v203[9]];
        uint64_t v258 = v203[10];
        v259 = &v125[v258];
        v260 = &v126[v258];
        v261 = (void *)*((void *)v260 + 1);
        v262 = (void *)*((void *)v260 + 2);
        v504 = v203;
        v508 = v125;
        v480 = (void *)*((void *)v260 + 3);
        v264 = (void *)*((void *)v260 + 4);
        v263 = (void *)*((void *)v260 + 5);
        uint64_t v486 = *((void *)v260 + 6);
        v493 = *(void **)v260;
        v265 = (void *)*((void *)v260 + 8);
        v475 = (void *)*((void *)v260 + 7);
        v266 = (void *)*((void *)v260 + 9);
        char v267 = v260[80];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247F986A0(v493, v261, v262, v480, v264, v263, v486, v475, v265, v266, v267);
        *(void *)v259 = v493;
        *((void *)v259 + 1) = v261;
        *((void *)v259 + 2) = v262;
        *((void *)v259 + 3) = v480;
        *((void *)v259 + 4) = v264;
        *((void *)v259 + 5) = v263;
        *((void *)v259 + 6) = v486;
        *((void *)v259 + 7) = v475;
        *((void *)v259 + 8) = v265;
        *((void *)v259 + 9) = v266;
        v259[80] = v267;
        uint64_t v268 = v504[11];
        v269 = (void *)((char *)v508 + v268);
        v270 = &v539[v268];
        if (*(void *)v270)
        {
          uint64_t v271 = *((void *)v270 + 1);
          void *v269 = *(void *)v270;
          v269[1] = v271;
          swift_retain();
        }
        else
        {
          *(_OWORD *)v269 = *(_OWORD *)v270;
        }
        uint64_t v280 = *(int *)(v520 + 36);
        v281 = &v497[v280];
        v282 = &v32[v280];
        if (v510(&v32[v280], 1, v532))
        {
          uint64_t v283 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v281, v282, *(void *)(*(void *)(v283 - 8) + 64));
        }
        else
        {
          uint64_t v342 = *((void *)v282 + 1);
          *(void *)v281 = *(void *)v282;
          *((void *)v281 + 1) = v342;
          uint64_t v343 = *((void *)v282 + 3);
          *((void *)v281 + 2) = *((void *)v282 + 2);
          *((void *)v281 + 3) = v343;
          uint64_t v344 = *((void *)v282 + 5);
          *((void *)v281 + 4) = *((void *)v282 + 4);
          *((void *)v281 + 5) = v344;
          uint64_t v345 = *((void *)v282 + 7);
          *((void *)v281 + 6) = *((void *)v282 + 6);
          *((void *)v281 + 7) = v345;
          uint64_t v346 = *((void *)v282 + 9);
          *((void *)v281 + 8) = *((void *)v282 + 8);
          *((void *)v281 + 9) = v346;
          uint64_t v347 = v532[5];
          v541 = &v281[v347];
          v527 = &v282[v347];
          uint64_t v348 = sub_248174700();
          v517 = *(void (**)(char *, char *, uint64_t))(*(void *)(v348 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v517(v541, v527, v348);
          uint64_t v349 = v532[6];
          v350 = &v281[v349];
          v351 = &v282[v349];
          uint64_t v352 = *((void *)v351 + 1);
          uint64_t v518 = *(void *)v351;
          uint64_t v353 = *((void *)v351 + 2);
          uint64_t v354 = *((void *)v351 + 3);
          uint64_t v355 = *((void *)v351 + 4);
          uint64_t v356 = *((void *)v351 + 5);
          uint64_t v357 = *((void *)v351 + 6);
          uint64_t v358 = *((void *)v351 + 7);
          uint64_t v528 = *((void *)v351 + 8);
          LOBYTE(v541) = v351[72];
          sub_247FABF8C(*(void *)v351, v352, v353, v354, v355, v356, v357, v358, v528, (char)v541);
          *(void *)v350 = v518;
          *((void *)v350 + 1) = v352;
          *((void *)v350 + 2) = v353;
          *((void *)v350 + 3) = v354;
          *((void *)v350 + 4) = v355;
          *((void *)v350 + 5) = v356;
          *((void *)v350 + 6) = v357;
          *((void *)v350 + 7) = v358;
          *((void *)v350 + 8) = v528;
          v350[72] = (char)v541;
          *(void *)&v281[v532[7]] = *(void *)&v282[v532[7]];
          v359 = *(void (**)(char *, void, uint64_t, int *))(v471 + 56);
          swift_bridgeObjectRetain();
          v359(v281, 0, 1, v532);
        }
        v360 = (int *)type metadata accessor for SignInModel();
        uint64_t v361 = v360[5];
        v362 = &v281[v361];
        v363 = &v282[v361];
        uint64_t v364 = *((void *)v363 + 1);
        if (v364)
        {
          *(void *)v362 = *(void *)v363;
          *((void *)v362 + 1) = v364;
          uint64_t v365 = *((void *)v363 + 3);
          *((void *)v362 + 2) = *((void *)v363 + 2);
          *((void *)v362 + 3) = v365;
          uint64_t v366 = *((void *)v363 + 5);
          *((void *)v362 + 4) = *((void *)v363 + 4);
          *((void *)v362 + 5) = v366;
          uint64_t v367 = *((void *)v363 + 7);
          *((void *)v362 + 6) = *((void *)v363 + 6);
          *((void *)v362 + 7) = v367;
          uint64_t v368 = *((void *)v363 + 9);
          *((void *)v362 + 8) = *((void *)v363 + 8);
          *((void *)v362 + 9) = v368;
          v369 = (uint64_t *)(v363 + 80);
          unint64_t v370 = *((void *)v363 + 11);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v370 >> 60 == 15)
          {
            *((_OWORD *)v362 + 5) = *(_OWORD *)v369;
          }
          else
          {
            uint64_t v442 = *v369;
            sub_247FB6C20(*v369, v370);
            *((void *)v362 + 10) = v442;
            *((void *)v362 + 11) = v370;
          }
        }
        else
        {
          long long v377 = *((_OWORD *)v363 + 3);
          *((_OWORD *)v362 + 2) = *((_OWORD *)v363 + 2);
          *((_OWORD *)v362 + 3) = v377;
          long long v378 = *((_OWORD *)v363 + 5);
          *((_OWORD *)v362 + 4) = *((_OWORD *)v363 + 4);
          *((_OWORD *)v362 + 5) = v378;
          long long v379 = *((_OWORD *)v363 + 1);
          *(_OWORD *)v362 = *(_OWORD *)v363;
          *((_OWORD *)v362 + 1) = v379;
        }
        *(void *)&v281[v360[6]] = *(void *)&v282[v360[6]];
        *(void *)&v281[v360[7]] = *(void *)&v282[v360[7]];
        v281[v360[8]] = v282[v360[8]];
        v281[v360[9]] = v282[v360[9]];
        uint64_t v443 = v360[10];
        v444 = &v281[v443];
        v445 = &v282[v443];
        uint64_t v446 = *(void *)&v282[v443 + 8];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v446)
        {
          *(void *)v444 = *(void *)v445;
          *((void *)v444 + 1) = v446;
          uint64_t v447 = *((void *)v445 + 2);
          uint64_t v448 = *((void *)v445 + 3);
          *((void *)v444 + 2) = v447;
          *((void *)v444 + 3) = v448;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v449 = *((_OWORD *)v445 + 1);
          *(_OWORD *)v444 = *(_OWORD *)v445;
          *((_OWORD *)v444 + 1) = v449;
        }
        uint64_t v450 = v360[11];
        v451 = &v281[v450];
        v452 = &v282[v450];
        uint64_t v453 = *((void *)v452 + 1);
        *(void *)v451 = *(void *)v452;
        *((void *)v451 + 1) = v453;
        uint64_t v454 = v360[12];
        v455 = *(void **)&v282[v454];
        *(void *)&v281[v454] = v455;
        uint64_t v456 = v360[13];
        v457 = &v281[v456];
        v458 = &v282[v456];
        uint64_t v459 = *(void *)v458;
        uint64_t v460 = *((void *)v458 + 1);
        char v461 = v458[16];
        swift_bridgeObjectRetain();
        id v462 = v455;
        sub_247FE42A8(v459, v460, v461);
        *(void *)v457 = v459;
        *((void *)v457 + 1) = v460;
        v457[16] = v461;
        uint64_t v463 = v360[14];
        v464 = &v281[v463];
        v465 = &v282[v463];
        uint64_t v466 = *((void *)v465 + 1);
        *(void *)v464 = *(void *)v465;
        *((void *)v464 + 1) = v466;
        v281[v360[15]] = v282[v360[15]];
        uint64_t v467 = v360[16];
        v406 = &v281[v467];
        v407 = &v282[v467];
        unint64_t v408 = *(void *)&v282[v467 + 8];
        swift_bridgeObjectRetain();
        if (v408 >= 3)
        {
LABEL_83:
          *(void *)v406 = *(void *)v407;
          *((void *)v406 + 1) = v408;
          uint64_t v410 = *((void *)v407 + 3);
          *((void *)v406 + 2) = *((void *)v407 + 2);
          *((void *)v406 + 3) = v410;
          v406[32] = v407[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v468 = *((_OWORD *)v407 + 1);
          *(_OWORD *)v406 = *(_OWORD *)v407;
          *((_OWORD *)v406 + 1) = v468;
          v406[32] = v407[32];
        }
LABEL_84:
        a1 = v535;
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v40 = *v3;
        uint64_t v41 = v3[1];
        uint64_t v42 = v3[2];
        uint64_t v43 = v3[3];
        uint64_t v44 = v3[4];
        uint64_t v45 = v3[5];
        uint64_t v46 = (unsigned __int16 *)v3;
        uint64_t v47 = (uint64_t *)a1;
        char v48 = *((unsigned char *)v46 + 48);
        sub_247FA9804(v40, v41, v42, v43, v44, v45, v48);
        *uint64_t v47 = v40;
        v47[1] = v41;
        v47[2] = v42;
        v47[3] = v43;
        v47[4] = v44;
        v47[5] = v45;
        *((unsigned char *)v47 + 48) = v48;
        a1 = (char *)v47;
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, v3, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

unint64_t destroy for MachSetupMessage(uint64_t a1)
{
  unint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      sub_247FE51A0(*(void **)(a1 + 8), *(id *)(a1 + 16), *(void *)(a1 + 24), *(unsigned int *)(a1 + 32) | ((unint64_t)*(unsigned __int16 *)(a1 + 36) << 32));
      unsigned int v3 = *(unsigned __int8 *)(a1 + 88);
      if (v3 <= 0xF9) {
        sub_247FA98EC(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), v3);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_247FE51C8(*(void *)(a1 + 168), *(void *)(a1 + 176), *(void *)(a1 + 184), *(void *)(a1 + 192), *(void *)(a1 + 200), *(void *)(a1 + 208), *(unsigned __int8 *)(a1 + 216));
      if (*(void *)(a1 + 232))
      {
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v4 = type metadata accessor for SetupModel();
      uint64_t v5 = a1 + *(int *)(v4 + 32);
      uint64_t v6 = type metadata accessor for IdMSAccount();
      uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);
      if (!v7(v5, 1, v6))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v8 = v5 + *(int *)(v6 + 20);
        uint64_t v9 = sub_248174700();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
        uint64_t v10 = v5 + *(int *)(v6 + 24);
        sub_247FAC1EC(*(void *)v10, *(void *)(v10 + 8), *(void *)(v10 + 16), *(void *)(v10 + 24), *(void *)(v10 + 32), *(void *)(v10 + 40), *(void *)(v10 + 48), *(void *)(v10 + 56), *(void *)(v10 + 64), *(unsigned char *)(v10 + 72));
        swift_bridgeObjectRelease();
      }
      uint64_t v11 = (int *)type metadata accessor for AuthenticationModel();
      if (*(void *)(v5 + v11[5] + 8))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v12 = v5 + v11[10];
      sub_247F98958(*(void **)v12, *(void **)(v12 + 8), *(void **)(v12 + 16), *(void **)(v12 + 24), *(void *)(v12 + 32), *(void **)(v12 + 40), *(void *)(v12 + 48), *(void *)(v12 + 56), *(void **)(v12 + 64), *(void **)(v12 + 72), *(unsigned char *)(v12 + 80));
      if (*(void *)(v5 + v11[11])) {
        swift_release();
      }
      uint64_t v13 = a1 + *(int *)(v4 + 36);
      if (!v7(v13, 1, v6))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v14 = v13 + *(int *)(v6 + 20);
        uint64_t v15 = sub_248174700();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
        uint64_t v16 = v13 + *(int *)(v6 + 24);
        sub_247FAC1EC(*(void *)v16, *(void *)(v16 + 8), *(void *)(v16 + 16), *(void *)(v16 + 24), *(void *)(v16 + 32), *(void *)(v16 + 40), *(void *)(v16 + 48), *(void *)(v16 + 56), *(void *)(v16 + 64), *(unsigned char *)(v16 + 72));
        swift_bridgeObjectRelease();
      }
      uint64_t v17 = (int *)type metadata accessor for SignInModel();
      uint64_t v18 = (void *)(v13 + v17[5]);
      if (v18[1])
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v19 = v18[11];
        if (v19 >> 60 != 15) {
          sub_247FB6CCC(v18[10], v19);
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v13 + v17[10] + 8))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();

      sub_247FE52C4(*(void *)(v13 + v17[13]), *(void *)(v13 + v17[13] + 8), *(unsigned char *)(v13 + v17[13] + 16));
      swift_bridgeObjectRelease();
      uint64_t v20 = v13 + v17[16];
      goto LABEL_63;
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(a1 + 48))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      goto LABEL_69;
    case 2:
      uint64_t v21 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830) + 32);
      sub_247FE51A0(*(void **)(v21 + 8), *(id *)(v21 + 16), *(void *)(v21 + 24), *(unsigned int *)(v21 + 32) | ((unint64_t)*(unsigned __int16 *)(v21 + 36) << 32));
      unsigned int v22 = *(unsigned __int8 *)(v21 + 88);
      if (v22 <= 0xF9) {
        sub_247FA98EC(*(void *)(v21 + 40), *(void *)(v21 + 48), *(void *)(v21 + 56), *(void *)(v21 + 64), *(void *)(v21 + 72), *(void *)(v21 + 80), v22);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_247FE51C8(*(void *)(v21 + 168), *(void *)(v21 + 176), *(void *)(v21 + 184), *(void *)(v21 + 192), *(void *)(v21 + 200), *(void *)(v21 + 208), *(unsigned __int8 *)(v21 + 216));
      if (*(void *)(v21 + 232))
      {
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v23 = type metadata accessor for SetupModel();
      uint64_t v24 = v21 + *(int *)(v23 + 32);
      uint64_t v25 = type metadata accessor for IdMSAccount();
      uint64_t v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48);
      if (!v26(v24, 1, v25))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v27 = v24 + *(int *)(v25 + 20);
        uint64_t v28 = sub_248174700();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8))(v27, v28);
        uint64_t v29 = v24 + *(int *)(v25 + 24);
        sub_247FAC1EC(*(void *)v29, *(void *)(v29 + 8), *(void *)(v29 + 16), *(void *)(v29 + 24), *(void *)(v29 + 32), *(void *)(v29 + 40), *(void *)(v29 + 48), *(void *)(v29 + 56), *(void *)(v29 + 64), *(unsigned char *)(v29 + 72));
        swift_bridgeObjectRelease();
      }
      uint64_t v30 = (int *)type metadata accessor for AuthenticationModel();
      if (*(void *)(v24 + v30[5] + 8))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v31 = v24 + v30[10];
      sub_247F98958(*(void **)v31, *(void **)(v31 + 8), *(void **)(v31 + 16), *(void **)(v31 + 24), *(void *)(v31 + 32), *(void **)(v31 + 40), *(void *)(v31 + 48), *(void *)(v31 + 56), *(void **)(v31 + 64), *(void **)(v31 + 72), *(unsigned char *)(v31 + 80));
      if (*(void *)(v24 + v30[11])) {
        swift_release();
      }
      uint64_t v32 = v21 + *(int *)(v23 + 36);
      if (!v26(v32, 1, v25))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v33 = v32 + *(int *)(v25 + 20);
        uint64_t v34 = sub_248174700();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(v33, v34);
        uint64_t v35 = v32 + *(int *)(v25 + 24);
        sub_247FAC1EC(*(void *)v35, *(void *)(v35 + 8), *(void *)(v35 + 16), *(void *)(v35 + 24), *(void *)(v35 + 32), *(void *)(v35 + 40), *(void *)(v35 + 48), *(void *)(v35 + 56), *(void *)(v35 + 64), *(unsigned char *)(v35 + 72));
        swift_bridgeObjectRelease();
      }
      uint64_t v36 = (int *)type metadata accessor for SignInModel();
      uint64_t v37 = (void *)(v32 + v36[5]);
      if (v37[1])
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v38 = v37[11];
        if (v38 >> 60 != 15) {
          sub_247FB6CCC(v37[10], v38);
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v32 + v36[10] + 8))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();

      sub_247FE52C4(*(void *)(v32 + v36[13]), *(void *)(v32 + v36[13] + 8), *(unsigned char *)(v32 + v36[13] + 16));
      swift_bridgeObjectRelease();
      if (*(void *)(v32 + v36[16] + 8) >= 3uLL)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      return swift_release();
    case 3:
      uint64_t v39 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692D9840) + 32);
      sub_247FE51A0(*(void **)(v39 + 8), *(id *)(v39 + 16), *(void *)(v39 + 24), *(unsigned int *)(v39 + 32) | ((unint64_t)*(unsigned __int16 *)(v39 + 36) << 32));
      unsigned int v40 = *(unsigned __int8 *)(v39 + 88);
      if (v40 <= 0xF9) {
        sub_247FA98EC(*(void *)(v39 + 40), *(void *)(v39 + 48), *(void *)(v39 + 56), *(void *)(v39 + 64), *(void *)(v39 + 72), *(void *)(v39 + 80), v40);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_247FE51C8(*(void *)(v39 + 168), *(void *)(v39 + 176), *(void *)(v39 + 184), *(void *)(v39 + 192), *(void *)(v39 + 200), *(void *)(v39 + 208), *(unsigned __int8 *)(v39 + 216));
      if (*(void *)(v39 + 232))
      {
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v41 = type metadata accessor for SetupModel();
      uint64_t v42 = v39 + *(int *)(v41 + 32);
      uint64_t v43 = type metadata accessor for IdMSAccount();
      uint64_t v44 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 48);
      if (!v44(v42, 1, v43))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v45 = v42 + *(int *)(v43 + 20);
        uint64_t v46 = sub_248174700();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v46 - 8) + 8))(v45, v46);
        uint64_t v47 = v42 + *(int *)(v43 + 24);
        sub_247FAC1EC(*(void *)v47, *(void *)(v47 + 8), *(void *)(v47 + 16), *(void *)(v47 + 24), *(void *)(v47 + 32), *(void *)(v47 + 40), *(void *)(v47 + 48), *(void *)(v47 + 56), *(void *)(v47 + 64), *(unsigned char *)(v47 + 72));
        swift_bridgeObjectRelease();
      }
      char v48 = (int *)type metadata accessor for AuthenticationModel();
      if (*(void *)(v42 + v48[5] + 8))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v49 = v42 + v48[10];
      sub_247F98958(*(void **)v49, *(void **)(v49 + 8), *(void **)(v49 + 16), *(void **)(v49 + 24), *(void *)(v49 + 32), *(void **)(v49 + 40), *(void *)(v49 + 48), *(void *)(v49 + 56), *(void **)(v49 + 64), *(void **)(v49 + 72), *(unsigned char *)(v49 + 80));
      if (*(void *)(v42 + v48[11])) {
        swift_release();
      }
      uint64_t v50 = v39 + *(int *)(v41 + 36);
      if (!v44(v50, 1, v43))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v51 = v50 + *(int *)(v43 + 20);
        uint64_t v52 = sub_248174700();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v52 - 8) + 8))(v51, v52);
        uint64_t v53 = v50 + *(int *)(v43 + 24);
        sub_247FAC1EC(*(void *)v53, *(void *)(v53 + 8), *(void *)(v53 + 16), *(void *)(v53 + 24), *(void *)(v53 + 32), *(void *)(v53 + 40), *(void *)(v53 + 48), *(void *)(v53 + 56), *(void *)(v53 + 64), *(unsigned char *)(v53 + 72));
        swift_bridgeObjectRelease();
      }
      uint64_t v54 = (int *)type metadata accessor for SignInModel();
      uint64_t v55 = (void *)(v50 + v54[5]);
      if (v55[1])
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v56 = v55[11];
        if (v56 >> 60 != 15) {
          sub_247FB6CCC(v55[10], v56);
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v50 + v54[10] + 8))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();

      sub_247FE52C4(*(void *)(v50 + v54[13]), *(void *)(v50 + v54[13] + 8), *(unsigned char *)(v50 + v54[13] + 16));
      swift_bridgeObjectRelease();
      uint64_t v20 = v50 + v54[16];
LABEL_63:
      unint64_t result = *(void *)(v20 + 8);
      if (result < 3) {
        return result;
      }
      swift_bridgeObjectRelease();
LABEL_69:
      return swift_bridgeObjectRelease();
    case 4:
      uint64_t v57 = *(void *)a1;
      uint64_t v58 = *(void *)(a1 + 8);
      uint64_t v59 = *(void *)(a1 + 16);
      uint64_t v60 = *(void *)(a1 + 24);
      uint64_t v61 = *(void *)(a1 + 32);
      uint64_t v62 = *(void *)(a1 + 40);
      char v63 = *(unsigned char *)(a1 + 48);
      return sub_247FA98EC(v57, v58, v59, v60, v61, v62, v63);
    default:
      return result;
  }
}

char *initializeWithCopy for MachSetupMessage(char *a1, unsigned __int16 *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      *a1 = *(unsigned char *)a2;
      uint64_t v6 = (void *)*((void *)a2 + 1);
      uint64_t v7 = (void *)*((void *)a2 + 2);
      uint64_t v8 = *((void *)a2 + 3);
      uint64_t v9 = a2[18];
      uint64_t v10 = *((unsigned int *)a2 + 8);
      sub_247FE4184(v6, v7, v8, v10 | (v9 << 32));
      *((void *)a1 + 1) = v6;
      *((void *)a1 + 2) = v7;
      *((void *)a1 + 3) = v8;
      *((_WORD *)a1 + 18) = v9;
      *((_DWORD *)a1 + 8) = v10;
      unsigned int v11 = *((unsigned __int8 *)a2 + 88);
      if (v11 <= 0xF9)
      {
        uint64_t v45 = *((void *)a2 + 5);
        uint64_t v46 = *((void *)a2 + 6);
        uint64_t v47 = a2;
        uint64_t v48 = *((void *)a2 + 7);
        uint64_t v49 = *((void *)v47 + 8);
        uint64_t v50 = *((void *)v47 + 9);
        uint64_t v51 = *((void *)v47 + 10);
        sub_247FA9804(v45, v46, v48, v49, v50, v51, v11);
        *((void *)a1 + 5) = v45;
        *((void *)a1 + 6) = v46;
        *((void *)a1 + 7) = v48;
        *((void *)a1 + 8) = v49;
        a2 = v47;
        *((void *)a1 + 9) = v50;
        *((void *)a1 + 10) = v51;
        a1[88] = v11;
      }
      else
      {
        long long v12 = *(_OWORD *)(a2 + 28);
        *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 20);
        *(_OWORD *)(a1 + 56) = v12;
        *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 36);
        a1[88] = *((unsigned char *)a2 + 88);
      }
      v540 = a2;
      a1[96] = *((unsigned char *)a2 + 96);
      a1[97] = *((unsigned char *)a2 + 97);
      uint64_t v52 = *((void *)a2 + 14);
      *((void *)a1 + 13) = *((void *)a2 + 13);
      *((void *)a1 + 14) = v52;
      uint64_t v53 = *((void *)a2 + 16);
      *((void *)a1 + 15) = *((void *)a2 + 15);
      *((void *)a1 + 16) = v53;
      *((void *)a1 + 17) = *((void *)a2 + 17);
      *((_WORD *)a1 + 72) = a2[72];
      uint64_t v54 = *((void *)a2 + 20);
      *((void *)a1 + 19) = *((void *)a2 + 19);
      *((void *)a1 + 20) = v54;
      uint64_t v55 = *((void *)a2 + 21);
      uint64_t v56 = *((void *)a2 + 22);
      uint64_t v57 = *((void *)v540 + 23);
      uint64_t v58 = *((void *)v540 + 24);
      uint64_t v59 = *((void *)v540 + 25);
      uint64_t v60 = *((void *)v540 + 26);
      unsigned int v61 = *((unsigned __int8 *)v540 + 216);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_247FE41AC(v55, v56, v57, v58, v59, v60, v61);
      *((void *)a1 + 21) = v55;
      *((void *)a1 + 22) = v56;
      *((void *)a1 + 23) = v57;
      *((void *)a1 + 24) = v58;
      *((void *)a1 + 25) = v59;
      *((void *)a1 + 26) = v60;
      a1[216] = v61;
      uint64_t v62 = *((void *)v540 + 29);
      if (v62)
      {
        *((void *)a1 + 28) = *((void *)v540 + 28);
        *((void *)a1 + 29) = v62;
        uint64_t v63 = *((void *)v540 + 31);
        *((void *)a1 + 30) = *((void *)v540 + 30);
        *((void *)a1 + 31) = v63;
        swift_bridgeObjectRetain();
        swift_retain();
        swift_retain();
      }
      else
      {
        long long v99 = *((_OWORD *)v540 + 15);
        *((_OWORD *)a1 + 14) = *((_OWORD *)v540 + 14);
        *((_OWORD *)a1 + 15) = v99;
      }
      uint64_t v100 = *((void *)v540 + 33);
      *((void *)a1 + 32) = *((void *)v540 + 32);
      *((void *)a1 + 33) = v100;
      uint64_t v101 = *((void *)v540 + 35);
      *((void *)a1 + 34) = *((void *)v540 + 34);
      *((void *)a1 + 35) = v101;
      uint64_t v516 = type metadata accessor for SetupModel();
      uint64_t v102 = *(int *)(v516 + 32);
      long long v103 = &a1[v102];
      uint64_t v104 = (void *)((char *)v540 + v102);
      uint64_t v105 = type metadata accessor for IdMSAccount();
      uint64_t v473 = *(void *)(v105 - 8);
      uint64_t v106 = *(unsigned int (**)(char *, uint64_t, int *))(v473 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v509 = v106;
      uint64_t v524 = v103;
      v532 = (int *)v105;
      uint64_t v538 = a1;
      if (v106((char *)v104, 1, (int *)v105))
      {
        uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v103, v104, *(void *)(*(void *)(v107 - 8) + 64));
      }
      else
      {
        uint64_t v126 = v104[1];
        *(void *)long long v103 = *v104;
        *((void *)v103 + 1) = v126;
        uint64_t v127 = v104[3];
        *((void *)v103 + 2) = v104[2];
        *((void *)v103 + 3) = v127;
        uint64_t v128 = v104[5];
        *((void *)v103 + 4) = v104[4];
        *((void *)v103 + 5) = v128;
        uint64_t v129 = v104[7];
        *((void *)v103 + 6) = v104[6];
        *((void *)v103 + 7) = v129;
        uint64_t v130 = v104[9];
        *((void *)v103 + 8) = v104[8];
        *((void *)v103 + 9) = v130;
        uint64_t v131 = *(int *)(v105 + 20);
        v494 = (char *)v104 + v131;
        v501 = &v103[v131];
        uint64_t v132 = sub_248174700();
        uint64_t v133 = *(void (**)(char *, char *, uint64_t))(*(void *)(v132 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v133(v501, v494, v132);
        uint64_t v134 = *(int *)(v105 + 24);
        uint64_t v135 = &v103[v134];
        uint64_t v136 = (char *)v104 + v134;
        uint64_t v137 = *(void *)v136;
        uint64_t v138 = *((void *)v136 + 1);
        uint64_t v139 = *((void *)v136 + 2);
        uint64_t v140 = *((void *)v136 + 3);
        uint64_t v141 = *((void *)v136 + 4);
        uint64_t v142 = *((void *)v136 + 5);
        uint64_t v143 = *((void *)v136 + 6);
        uint64_t v495 = *((void *)v136 + 7);
        uint64_t v502 = *((void *)v136 + 8);
        char v144 = v136[72];
        sub_247FABF8C(*(void *)v136, v138, v139, v140, v141, v142, v143, v495, v502, v144);
        *(void *)uint64_t v135 = v137;
        *((void *)v135 + 1) = v138;
        *((void *)v135 + 2) = v139;
        *((void *)v135 + 3) = v140;
        *((void *)v135 + 4) = v141;
        *((void *)v135 + 5) = v142;
        *((void *)v135 + 6) = v143;
        *((void *)v135 + 7) = v495;
        *((void *)v135 + 8) = v502;
        v135[72] = v144;
        long long v103 = v524;
        *(void *)&v524[v532[7]] = *(void *)((char *)v104 + v532[7]);
        uint64_t v145 = *(void (**)(char *, void, uint64_t, int *))(v473 + 56);
        swift_bridgeObjectRetain();
        v145(v524, 0, 1, v532);
      }
      uint64_t v146 = (int *)type metadata accessor for AuthenticationModel();
      uint64_t v147 = v146[5];
      char v148 = &v103[v147];
      uint64_t v149 = (void *)((char *)v104 + v147);
      uint64_t v150 = v149[1];
      if (v150)
      {
        *(void *)char v148 = *v149;
        *((void *)v148 + 1) = v150;
        uint64_t v151 = v149[3];
        *((void *)v148 + 2) = v149[2];
        *((void *)v148 + 3) = v151;
        uint64_t v152 = v149[5];
        *((void *)v148 + 4) = v149[4];
        *((void *)v148 + 5) = v152;
        uint64_t v153 = v149[7];
        *((void *)v148 + 6) = v149[6];
        *((void *)v148 + 7) = v153;
        uint64_t v154 = v149[9];
        *((void *)v148 + 8) = v149[8];
        *((void *)v148 + 9) = v154;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v207 = *((_OWORD *)v149 + 3);
        *((_OWORD *)v148 + 2) = *((_OWORD *)v149 + 2);
        *((_OWORD *)v148 + 3) = v207;
        *((_OWORD *)v148 + 4) = *((_OWORD *)v149 + 4);
        long long v208 = *((_OWORD *)v149 + 1);
        *(_OWORD *)char v148 = *(_OWORD *)v149;
        *((_OWORD *)v148 + 1) = v208;
      }
      v103[v146[6]] = *((unsigned char *)v104 + v146[6]);
      uint64_t v209 = v146[7];
      uint64_t v210 = &v103[v209];
      uint64_t v211 = (void *)((char *)v104 + v209);
      uint64_t v212 = v211[1];
      *(void *)uint64_t v210 = *v211;
      *((void *)v210 + 1) = v212;
      *(void *)&v103[v146[8]] = *(void *)((char *)v104 + v146[8]);
      v103[v146[9]] = *((unsigned char *)v104 + v146[9]);
      uint64_t v213 = v146[10];
      uint64_t v214 = &v103[v213];
      v215 = (char *)v104 + v213;
      v216 = (void *)*((void *)v215 + 1);
      v492 = *(void **)v215;
      v499 = v146;
      uint64_t v217 = (void *)*((void *)v215 + 2);
      uint64_t v218 = (void *)*((void *)v215 + 3);
      uint64_t v506 = v104;
      v219 = (void *)*((void *)v215 + 4);
      uint64_t v220 = *((void *)v215 + 6);
      v480 = (void *)*((void *)v215 + 5);
      uint64_t v486 = (void *)*((void *)v215 + 7);
      v221 = (void *)*((void *)v215 + 8);
      v222 = (void *)*((void *)v215 + 9);
      char v223 = v215[80];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_247F986A0(v492, v216, v217, v218, v219, v480, v220, v486, v221, v222, v223);
      *(void *)uint64_t v214 = v492;
      *((void *)v214 + 1) = v216;
      *((void *)v214 + 2) = v217;
      *((void *)v214 + 3) = v218;
      *((void *)v214 + 4) = v219;
      *((void *)v214 + 5) = v480;
      *((void *)v214 + 6) = v220;
      *((void *)v214 + 7) = v486;
      *((void *)v214 + 8) = v221;
      *((void *)v214 + 9) = v222;
      v214[80] = v223;
      uint64_t v224 = v499[11];
      uint64_t v225 = &v524[v224];
      v226 = (void *)((char *)v506 + v224);
      if (*v226)
      {
        uint64_t v227 = v226[1];
        *(void *)uint64_t v225 = *v226;
        *((void *)v225 + 1) = v227;
        swift_retain();
      }
      else
      {
        *(_OWORD *)uint64_t v225 = *(_OWORD *)v226;
      }
      uint64_t v268 = *(int *)(v516 + 36);
      v269 = &v538[v268];
      v270 = (void *)((char *)v540 + v268);
      if (v509((char *)v540 + v268, 1, v532))
      {
        uint64_t v271 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v269, v270, *(void *)(*(void *)(v271 - 8) + 64));
      }
      else
      {
        uint64_t v280 = v270[1];
        *(void *)v269 = *v270;
        *((void *)v269 + 1) = v280;
        uint64_t v281 = v270[3];
        *((void *)v269 + 2) = v270[2];
        *((void *)v269 + 3) = v281;
        uint64_t v282 = v270[5];
        *((void *)v269 + 4) = v270[4];
        *((void *)v269 + 5) = v282;
        uint64_t v283 = v270[7];
        *((void *)v269 + 6) = v270[6];
        *((void *)v269 + 7) = v283;
        uint64_t v284 = v270[9];
        *((void *)v269 + 8) = v270[8];
        *((void *)v269 + 9) = v284;
        uint64_t v285 = v532[5];
        v543 = &v269[v285];
        v527 = (char *)v270 + v285;
        uint64_t v286 = sub_248174700();
        uint64_t v518 = *(void (**)(char *, char *, uint64_t))(*(void *)(v286 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v518(v543, v527, v286);
        uint64_t v287 = v532[6];
        uint64_t v288 = &v269[v287];
        uint64_t v289 = (char *)v270 + v287;
        uint64_t v290 = *((void *)v289 + 1);
        uint64_t v519 = *(void *)v289;
        uint64_t v291 = *((void *)v289 + 2);
        uint64_t v292 = *((void *)v289 + 3);
        uint64_t v293 = *((void *)v289 + 4);
        uint64_t v294 = *((void *)v289 + 5);
        uint64_t v295 = *((void *)v289 + 6);
        uint64_t v296 = *((void *)v289 + 7);
        uint64_t v528 = *((void *)v289 + 8);
        LOBYTE(v543) = v289[72];
        sub_247FABF8C(*(void *)v289, v290, v291, v292, v293, v294, v295, v296, v528, (char)v543);
        *(void *)uint64_t v288 = v519;
        *((void *)v288 + 1) = v290;
        *((void *)v288 + 2) = v291;
        *((void *)v288 + 3) = v292;
        *((void *)v288 + 4) = v293;
        *((void *)v288 + 5) = v294;
        *((void *)v288 + 6) = v295;
        *((void *)v288 + 7) = v296;
        *((void *)v288 + 8) = v528;
        v288[72] = (char)v543;
        *(void *)&v269[v532[7]] = *(void *)((char *)v270 + v532[7]);
        uint64_t v297 = *(void (**)(char *, void, uint64_t, int *))(v473 + 56);
        swift_bridgeObjectRetain();
        v297(v269, 0, 1, v532);
      }
      uint64_t v298 = (int *)type metadata accessor for SignInModel();
      uint64_t v299 = v298[5];
      uint64_t v300 = &v269[v299];
      v301 = (void *)((char *)v270 + v299);
      uint64_t v302 = v301[1];
      if (v302)
      {
        *(void *)uint64_t v300 = *v301;
        *((void *)v300 + 1) = v302;
        uint64_t v303 = v301[3];
        *((void *)v300 + 2) = v301[2];
        *((void *)v300 + 3) = v303;
        uint64_t v304 = v301[5];
        *((void *)v300 + 4) = v301[4];
        *((void *)v300 + 5) = v304;
        uint64_t v305 = v301[7];
        *((void *)v300 + 6) = v301[6];
        *((void *)v300 + 7) = v305;
        uint64_t v306 = v301[9];
        *((void *)v300 + 8) = v301[8];
        *((void *)v300 + 9) = v306;
        uint64_t v307 = v301 + 10;
        unint64_t v308 = v301[11];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v308 >> 60 == 15)
        {
          *((_OWORD *)v300 + 5) = *(_OWORD *)v307;
        }
        else
        {
          uint64_t v376 = *v307;
          sub_247FB6C20(*v307, v308);
          *((void *)v300 + 10) = v376;
          *((void *)v300 + 11) = v308;
        }
      }
      else
      {
        long long v367 = *((_OWORD *)v301 + 3);
        *((_OWORD *)v300 + 2) = *((_OWORD *)v301 + 2);
        *((_OWORD *)v300 + 3) = v367;
        long long v368 = *((_OWORD *)v301 + 5);
        *((_OWORD *)v300 + 4) = *((_OWORD *)v301 + 4);
        *((_OWORD *)v300 + 5) = v368;
        long long v369 = *((_OWORD *)v301 + 1);
        *(_OWORD *)uint64_t v300 = *(_OWORD *)v301;
        *((_OWORD *)v300 + 1) = v369;
      }
      *(void *)&v269[v298[6]] = *(void *)((char *)v270 + v298[6]);
      *(void *)&v269[v298[7]] = *(void *)((char *)v270 + v298[7]);
      v269[v298[8]] = *((unsigned char *)v270 + v298[8]);
      v269[v298[9]] = *((unsigned char *)v270 + v298[9]);
      uint64_t v377 = v298[10];
      long long v378 = &v269[v377];
      long long v379 = (void *)((char *)v270 + v377);
      uint64_t v380 = *(void *)((char *)v270 + v377 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v380)
      {
        *(void *)long long v378 = *v379;
        *((void *)v378 + 1) = v380;
        uint64_t v381 = v379[2];
        uint64_t v382 = v379[3];
        *((void *)v378 + 2) = v381;
        *((void *)v378 + 3) = v382;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v383 = *((_OWORD *)v379 + 1);
        *(_OWORD *)long long v378 = *(_OWORD *)v379;
        *((_OWORD *)v378 + 1) = v383;
      }
      uint64_t v384 = v298[11];
      uint64_t v385 = &v269[v384];
      uint64_t v386 = (void *)((char *)v270 + v384);
      uint64_t v387 = v386[1];
      *(void *)uint64_t v385 = *v386;
      *((void *)v385 + 1) = v387;
      uint64_t v388 = v298[12];
      v389 = *(void **)((char *)v270 + v388);
      *(void *)&v269[v388] = v389;
      uint64_t v390 = v298[13];
      uint64_t v391 = &v269[v390];
      uint64_t v392 = (char *)v270 + v390;
      uint64_t v393 = *(void *)v392;
      uint64_t v394 = *((void *)v392 + 1);
      char v395 = v392[16];
      swift_bridgeObjectRetain();
      id v396 = v389;
      sub_247FE42A8(v393, v394, v395);
      *(void *)uint64_t v391 = v393;
      *((void *)v391 + 1) = v394;
      v391[16] = v395;
      uint64_t v397 = v298[14];
      uint64_t v398 = &v269[v397];
      char v399 = (void *)((char *)v270 + v397);
      uint64_t v400 = v399[1];
      *(void *)uint64_t v398 = *v399;
      *((void *)v398 + 1) = v400;
      v269[v298[15]] = *((unsigned char *)v270 + v298[15]);
      uint64_t v401 = v298[16];
      v402 = &v269[v401];
      v403 = (char *)v270 + v401;
      unint64_t v404 = *(void *)((char *)v270 + v401 + 8);
      swift_bridgeObjectRetain();
      if (v404 >= 3)
      {
        *(void *)v402 = *(void *)v403;
        *((void *)v402 + 1) = v404;
        uint64_t v406 = *((void *)v403 + 3);
        *((void *)v402 + 2) = *((void *)v403 + 2);
        *((void *)v402 + 3) = v406;
        v402[32] = v403[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v405 = *((_OWORD *)v403 + 1);
        *(_OWORD *)v402 = *(_OWORD *)v403;
        *((_OWORD *)v402 + 1) = v405;
        v402[32] = v403[32];
      }
      a1 = v538;
      goto LABEL_98;
    case 1u:
      uint64_t v13 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v13;
      uint64_t v14 = *((void *)a2 + 3);
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *((void *)a1 + 3) = v14;
      *((void *)a1 + 4) = *((void *)a2 + 4);
      uint64_t v15 = *((void *)a2 + 6);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v15)
      {
        *((void *)a1 + 5) = *((void *)a2 + 5);
        *((void *)a1 + 6) = v15;
        uint64_t v16 = *((void *)a2 + 8);
        *((void *)a1 + 7) = *((void *)a2 + 7);
        *((void *)a1 + 8) = v16;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v98 = *(_OWORD *)(a2 + 28);
        *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 20);
        *(_OWORD *)(a1 + 56) = v98;
      }
      *((void *)a1 + 9) = *((void *)a2 + 9);
      swift_bridgeObjectRetain();
      goto LABEL_98;
    case 2u:
      *(void *)a1 = *(void *)a2;
      a1[8] = *((unsigned char *)a2 + 8);
      uint64_t v471 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
      uint64_t v17 = *(int *)(v471 + 32);
      v536 = a1;
      v539 = a2;
      uint64_t v18 = &a1[v17];
      unint64_t v19 = (char *)a2 + v17;
      a1[v17] = *((unsigned char *)a2 + v17);
      uint64_t v20 = *(void *)((char *)a2 + v17 + 8);
      uint64_t v21 = *(void *)((char *)a2 + v17 + 16);
      uint64_t v22 = *(void *)((char *)a2 + v17 + 24);
      uint64_t v23 = *(unsigned __int16 *)((char *)a2 + v17 + 36);
      uint64_t v24 = *(unsigned int *)((char *)a2 + v17 + 32);
      sub_247FE4184(*((id *)v19 + 1), *((id *)v19 + 2), *((void *)v19 + 3), v24 | (v23 << 32));
      *((void *)v18 + 1) = v20;
      *((void *)v18 + 2) = v21;
      *((void *)v18 + 3) = v22;
      *((_WORD *)v18 + 18) = v23;
      *((_DWORD *)v18 + 8) = v24;
      unsigned int v25 = v19[88];
      if (v25 <= 0xF9)
      {
        uint64_t v64 = *((void *)v19 + 5);
        uint64_t v65 = *((void *)v19 + 6);
        uint64_t v66 = *((void *)v19 + 7);
        uint64_t v67 = *((void *)v19 + 8);
        uint64_t v68 = *((void *)v19 + 9);
        uint64_t v69 = *((void *)v19 + 10);
        sub_247FA9804(v64, v65, v66, v67, v68, v69, v25);
        *((void *)v18 + 5) = v64;
        *((void *)v18 + 6) = v65;
        *((void *)v18 + 7) = v66;
        *((void *)v18 + 8) = v67;
        *((void *)v18 + 9) = v68;
        *((void *)v18 + 10) = v69;
        v18[88] = v25;
      }
      else
      {
        long long v26 = *(_OWORD *)(v19 + 56);
        *(_OWORD *)(v18 + 40) = *(_OWORD *)(v19 + 40);
        *(_OWORD *)(v18 + 56) = v26;
        *(_OWORD *)(v18 + 72) = *(_OWORD *)(v19 + 72);
        v18[88] = v19[88];
      }
      v18[96] = v19[96];
      v18[97] = v19[97];
      uint64_t v70 = *((void *)v19 + 14);
      *((void *)v18 + 13) = *((void *)v19 + 13);
      *((void *)v18 + 14) = v70;
      uint64_t v71 = *((void *)v19 + 16);
      *((void *)v18 + 15) = *((void *)v19 + 15);
      *((void *)v18 + 16) = v71;
      *((void *)v18 + 17) = *((void *)v19 + 17);
      *((_WORD *)v18 + 72) = *((_WORD *)v19 + 72);
      uint64_t v72 = *((void *)v19 + 20);
      *((void *)v18 + 19) = *((void *)v19 + 19);
      *((void *)v18 + 20) = v72;
      uint64_t v73 = *((void *)v19 + 21);
      uint64_t v74 = *((void *)v19 + 22);
      uint64_t v75 = *((void *)v19 + 24);
      uint64_t v531 = *((void *)v19 + 23);
      uint64_t v76 = *((void *)v19 + 25);
      uint64_t v77 = *((void *)v19 + 26);
      unsigned int v78 = v19[216];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_247FE41AC(v73, v74, v531, v75, v76, v77, v78);
      *((void *)v18 + 21) = v73;
      *((void *)v18 + 22) = v74;
      *((void *)v18 + 23) = v531;
      *((void *)v18 + 24) = v75;
      *((void *)v18 + 25) = v76;
      *((void *)v18 + 26) = v77;
      v18[216] = v78;
      uint64_t v79 = *((void *)v19 + 29);
      if (v79)
      {
        *((void *)v18 + 28) = *((void *)v19 + 28);
        *((void *)v18 + 29) = v79;
        uint64_t v80 = *((void *)v19 + 31);
        *((void *)v18 + 30) = *((void *)v19 + 30);
        *((void *)v18 + 31) = v80;
        swift_bridgeObjectRetain();
        swift_retain();
        swift_retain();
      }
      else
      {
        long long v108 = *((_OWORD *)v19 + 15);
        *((_OWORD *)v18 + 14) = *((_OWORD *)v19 + 14);
        *((_OWORD *)v18 + 15) = v108;
      }
      uint64_t v109 = *((void *)v19 + 33);
      *((void *)v18 + 32) = *((void *)v19 + 32);
      *((void *)v18 + 33) = v109;
      uint64_t v110 = *((void *)v19 + 35);
      *((void *)v18 + 34) = *((void *)v19 + 34);
      *((void *)v18 + 35) = v110;
      uint64_t v517 = type metadata accessor for SetupModel();
      uint64_t v111 = *(int *)(v517 + 32);
      long long v112 = &v18[v111];
      uint64_t v113 = &v19[v111];
      uint64_t v114 = (int *)type metadata accessor for IdMSAccount();
      uint64_t v470 = *((void *)v114 - 1);
      uint64_t v115 = *(unsigned int (**)(char *, uint64_t, int *))(v470 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v510 = v115;
      v525 = v114;
      v533 = v113;
      if (v115(v113, 1, v114))
      {
        uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v112, v113, *(void *)(*(void *)(v116 - 8) + 64));
      }
      else
      {
        uint64_t v155 = *((void *)v113 + 1);
        *(void *)long long v112 = *(void *)v113;
        *((void *)v112 + 1) = v155;
        uint64_t v156 = *((void *)v113 + 3);
        *((void *)v112 + 2) = *((void *)v113 + 2);
        *((void *)v112 + 3) = v156;
        uint64_t v157 = *((void *)v113 + 5);
        *((void *)v112 + 4) = *((void *)v113 + 4);
        *((void *)v112 + 5) = v157;
        uint64_t v158 = *((void *)v113 + 7);
        *((void *)v112 + 6) = *((void *)v113 + 6);
        *((void *)v112 + 7) = v158;
        uint64_t v159 = *((void *)v113 + 8);
        uint64_t v160 = *((void *)v113 + 9);
        *((void *)v112 + 8) = v159;
        *((void *)v112 + 9) = v160;
        uint64_t v161 = v114[5];
        v503 = &v112[v161];
        uint64_t v496 = &v533[v161];
        uint64_t v162 = sub_248174700();
        uint64_t v483 = *(void (**)(char *, char *, uint64_t))(*(void *)(v162 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v483(v503, v496, v162);
        uint64_t v163 = v114[6];
        uint64_t v164 = &v112[v163];
        uint64_t v165 = &v533[v163];
        uint64_t v166 = *((void *)v165 + 1);
        uint64_t v167 = *((void *)v165 + 3);
        uint64_t v478 = *((void *)v165 + 2);
        uint64_t v484 = *(void *)v165;
        uint64_t v168 = *((void *)v165 + 5);
        uint64_t v475 = *((void *)v165 + 4);
        uint64_t v170 = *((void *)v165 + 6);
        uint64_t v169 = *((void *)v165 + 7);
        uint64_t v497 = *((void *)v165 + 8);
        LOBYTE(v503) = v165[72];
        sub_247FABF8C(*(void *)v165, v166, v478, v167, v475, v168, v170, v169, v497, (char)v503);
        *(void *)uint64_t v164 = v484;
        *((void *)v164 + 1) = v166;
        *((void *)v164 + 2) = v478;
        *((void *)v164 + 3) = v167;
        *((void *)v164 + 4) = v475;
        *((void *)v164 + 5) = v168;
        *((void *)v164 + 6) = v170;
        *((void *)v164 + 7) = v169;
        uint64_t v113 = v533;
        *((void *)v164 + 8) = v497;
        v164[72] = (char)v503;
        *(void *)&v112[v114[7]] = *(void *)&v533[v114[7]];
        uint64_t v171 = *(void (**)(char *, void, uint64_t, int *))(v470 + 56);
        swift_bridgeObjectRetain();
        v171(v112, 0, 1, v114);
      }
      uint64_t v172 = (int *)type metadata accessor for AuthenticationModel();
      uint64_t v173 = v172[5];
      uint64_t v174 = &v112[v173];
      uint64_t v175 = &v113[v173];
      uint64_t v176 = *((void *)v175 + 1);
      v489 = v18;
      if (v176)
      {
        *(void *)uint64_t v174 = *(void *)v175;
        *((void *)v174 + 1) = v176;
        uint64_t v177 = *((void *)v175 + 3);
        *((void *)v174 + 2) = *((void *)v175 + 2);
        *((void *)v174 + 3) = v177;
        uint64_t v178 = *((void *)v175 + 5);
        *((void *)v174 + 4) = *((void *)v175 + 4);
        *((void *)v174 + 5) = v178;
        uint64_t v179 = *((void *)v175 + 7);
        *((void *)v174 + 6) = *((void *)v175 + 6);
        *((void *)v174 + 7) = v179;
        uint64_t v180 = *((void *)v175 + 9);
        *((void *)v174 + 8) = *((void *)v175 + 8);
        *((void *)v174 + 9) = v180;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v228 = *((_OWORD *)v175 + 3);
        *((_OWORD *)v174 + 2) = *((_OWORD *)v175 + 2);
        *((_OWORD *)v174 + 3) = v228;
        *((_OWORD *)v174 + 4) = *((_OWORD *)v175 + 4);
        long long v229 = *((_OWORD *)v175 + 1);
        *(_OWORD *)uint64_t v174 = *(_OWORD *)v175;
        *((_OWORD *)v174 + 1) = v229;
      }
      v112[v172[6]] = v113[v172[6]];
      uint64_t v230 = v172[7];
      v231 = &v112[v230];
      uint64_t v232 = &v113[v230];
      uint64_t v233 = *((void *)v232 + 1);
      *(void *)v231 = *(void *)v232;
      *((void *)v231 + 1) = v233;
      *(void *)&v112[v172[8]] = *(void *)&v113[v172[8]];
      v112[v172[9]] = v113[v172[9]];
      uint64_t v234 = v172[10];
      uint64_t v235 = &v112[v234];
      v236 = &v113[v234];
      v237 = (void *)*((void *)v236 + 1);
      uint64_t v500 = v172;
      v507 = v112;
      uint64_t v238 = (void *)*((void *)v236 + 2);
      uint64_t v239 = (void *)*((void *)v236 + 3);
      v240 = (void *)*((void *)v236 + 5);
      v481 = (void *)*((void *)v236 + 4);
      v487 = *(void **)v236;
      v241 = (void *)*((void *)v236 + 8);
      uint64_t v474 = (void *)*((void *)v236 + 7);
      uint64_t v476 = *((void *)v236 + 6);
      v242 = (void *)*((void *)v236 + 9);
      char v243 = v236[80];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_247F986A0(v487, v237, v238, v239, v481, v240, v476, v474, v241, v242, v243);
      *(void *)uint64_t v235 = v487;
      *((void *)v235 + 1) = v237;
      *((void *)v235 + 2) = v238;
      *((void *)v235 + 3) = v239;
      *((void *)v235 + 4) = v481;
      *((void *)v235 + 5) = v240;
      *((void *)v235 + 6) = v476;
      *((void *)v235 + 7) = v474;
      *((void *)v235 + 8) = v241;
      *((void *)v235 + 9) = v242;
      v235[80] = v243;
      uint64_t v244 = v500[11];
      v245 = (void *)((char *)v507 + v244);
      v246 = &v533[v244];
      if (*(void *)v246)
      {
        uint64_t v247 = *((void *)v246 + 1);
        void *v245 = *(void *)v246;
        v245[1] = v247;
        swift_retain();
      }
      else
      {
        *(_OWORD *)v245 = *(_OWORD *)v246;
      }
      uint64_t v272 = *(int *)(v517 + 36);
      v273 = &v489[v272];
      v274 = &v19[v272];
      if (v510(&v19[v272], 1, v525))
      {
        uint64_t v275 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v273, v274, *(void *)(*(void *)(v275 - 8) + 64));
      }
      else
      {
        uint64_t v309 = *((void *)v274 + 1);
        *(void *)v273 = *(void *)v274;
        *((void *)v273 + 1) = v309;
        uint64_t v310 = *((void *)v274 + 3);
        *((void *)v273 + 2) = *((void *)v274 + 2);
        *((void *)v273 + 3) = v310;
        uint64_t v311 = *((void *)v274 + 5);
        *((void *)v273 + 4) = *((void *)v274 + 4);
        *((void *)v273 + 5) = v311;
        uint64_t v312 = *((void *)v274 + 7);
        *((void *)v273 + 6) = *((void *)v274 + 6);
        *((void *)v273 + 7) = v312;
        uint64_t v313 = *((void *)v274 + 9);
        *((void *)v273 + 8) = *((void *)v274 + 8);
        *((void *)v273 + 9) = v313;
        uint64_t v314 = v525[5];
        v535 = &v273[v314];
        uint64_t v520 = &v274[v314];
        uint64_t v315 = sub_248174700();
        uint64_t v514 = *(void (**)(char *, char *, uint64_t))(*(void *)(v315 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v514(v535, v520, v315);
        uint64_t v316 = v525[6];
        uint64_t v317 = &v273[v316];
        uint64_t v318 = &v274[v316];
        uint64_t v319 = *((void *)v318 + 1);
        uint64_t v320 = *((void *)v318 + 2);
        uint64_t v321 = *((void *)v318 + 3);
        uint64_t v322 = *((void *)v318 + 4);
        uint64_t v323 = *((void *)v318 + 5);
        uint64_t v324 = *((void *)v318 + 6);
        uint64_t v325 = *((void *)v318 + 7);
        uint64_t v515 = *(void *)v318;
        uint64_t v521 = *((void *)v318 + 8);
        LOBYTE(v535) = v318[72];
        sub_247FABF8C(*(void *)v318, v319, v320, v321, v322, v323, v324, v325, v521, (char)v535);
        *(void *)uint64_t v317 = v515;
        *((void *)v317 + 1) = v319;
        *((void *)v317 + 2) = v320;
        *((void *)v317 + 3) = v321;
        *((void *)v317 + 4) = v322;
        *((void *)v317 + 5) = v323;
        *((void *)v317 + 6) = v324;
        *((void *)v317 + 7) = v325;
        *((void *)v317 + 8) = v521;
        v317[72] = (char)v535;
        *(void *)&v273[v525[7]] = *(void *)&v274[v525[7]];
        uint64_t v326 = *(void (**)(char *, void, uint64_t, int *))(v470 + 56);
        swift_bridgeObjectRetain();
        v326(v273, 0, 1, v525);
      }
      uint64_t v327 = (int *)type metadata accessor for SignInModel();
      uint64_t v328 = v327[5];
      uint64_t v329 = &v273[v328];
      v330 = &v274[v328];
      uint64_t v331 = *((void *)v330 + 1);
      if (v331)
      {
        *(void *)uint64_t v329 = *(void *)v330;
        *((void *)v329 + 1) = v331;
        uint64_t v332 = *((void *)v330 + 3);
        *((void *)v329 + 2) = *((void *)v330 + 2);
        *((void *)v329 + 3) = v332;
        uint64_t v333 = *((void *)v330 + 5);
        *((void *)v329 + 4) = *((void *)v330 + 4);
        *((void *)v329 + 5) = v333;
        uint64_t v334 = *((void *)v330 + 7);
        *((void *)v329 + 6) = *((void *)v330 + 6);
        *((void *)v329 + 7) = v334;
        uint64_t v335 = *((void *)v330 + 9);
        *((void *)v329 + 8) = *((void *)v330 + 8);
        *((void *)v329 + 9) = v335;
        uint64_t v336 = (uint64_t *)(v330 + 80);
        unint64_t v337 = *((void *)v330 + 11);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v337 >> 60 == 15)
        {
          *((_OWORD *)v329 + 5) = *(_OWORD *)v336;
        }
        else
        {
          uint64_t v407 = *v336;
          sub_247FB6C20(*v336, v337);
          *((void *)v329 + 10) = v407;
          *((void *)v329 + 11) = v337;
        }
      }
      else
      {
        long long v370 = *((_OWORD *)v330 + 3);
        *((_OWORD *)v329 + 2) = *((_OWORD *)v330 + 2);
        *((_OWORD *)v329 + 3) = v370;
        long long v371 = *((_OWORD *)v330 + 5);
        *((_OWORD *)v329 + 4) = *((_OWORD *)v330 + 4);
        *((_OWORD *)v329 + 5) = v371;
        long long v372 = *((_OWORD *)v330 + 1);
        *(_OWORD *)uint64_t v329 = *(_OWORD *)v330;
        *((_OWORD *)v329 + 1) = v372;
      }
      *(void *)&v273[v327[6]] = *(void *)&v274[v327[6]];
      *(void *)&v273[v327[7]] = *(void *)&v274[v327[7]];
      v273[v327[8]] = v274[v327[8]];
      v273[v327[9]] = v274[v327[9]];
      uint64_t v408 = v327[10];
      long long v409 = &v273[v408];
      uint64_t v410 = &v274[v408];
      uint64_t v411 = *(void *)&v274[v408 + 8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v411)
      {
        *(void *)long long v409 = *(void *)v410;
        *((void *)v409 + 1) = v411;
        uint64_t v412 = *((void *)v410 + 2);
        uint64_t v413 = *((void *)v410 + 3);
        *((void *)v409 + 2) = v412;
        *((void *)v409 + 3) = v413;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v414 = *((_OWORD *)v410 + 1);
        *(_OWORD *)long long v409 = *(_OWORD *)v410;
        *((_OWORD *)v409 + 1) = v414;
      }
      uint64_t v415 = v327[11];
      uint64_t v416 = &v273[v415];
      uint64_t v417 = &v274[v415];
      uint64_t v418 = *((void *)v417 + 1);
      *(void *)uint64_t v416 = *(void *)v417;
      *((void *)v416 + 1) = v418;
      uint64_t v419 = v327[12];
      v420 = *(void **)&v274[v419];
      *(void *)&v273[v419] = v420;
      uint64_t v421 = v327[13];
      uint64_t v422 = &v273[v421];
      uint64_t v423 = &v274[v421];
      uint64_t v424 = *(void *)v423;
      uint64_t v425 = *((void *)v423 + 1);
      char v426 = v423[16];
      swift_bridgeObjectRetain();
      id v427 = v420;
      sub_247FE42A8(v424, v425, v426);
      *(void *)uint64_t v422 = v424;
      *((void *)v422 + 1) = v425;
      v422[16] = v426;
      uint64_t v428 = v327[14];
      uint64_t v429 = &v273[v428];
      char v430 = &v274[v428];
      uint64_t v431 = *((void *)v430 + 1);
      *(void *)uint64_t v429 = *(void *)v430;
      *((void *)v429 + 1) = v431;
      v273[v327[15]] = v274[v327[15]];
      uint64_t v432 = v327[16];
      v433 = &v273[v432];
      v434 = &v274[v432];
      unint64_t v435 = *(void *)&v274[v432 + 8];
      swift_bridgeObjectRetain();
      if (v435 >= 3)
      {
        *(void *)v433 = *(void *)v434;
        *((void *)v433 + 1) = v435;
        uint64_t v437 = *((void *)v434 + 3);
        *((void *)v433 + 2) = *((void *)v434 + 2);
        *((void *)v433 + 3) = v437;
        v433[32] = v434[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v436 = *((_OWORD *)v434 + 1);
        *(_OWORD *)v433 = *(_OWORD *)v434;
        *((_OWORD *)v433 + 1) = v436;
        v433[32] = v434[32];
      }
      a1 = v536;
      *(void *)&v536[*(int *)(v471 + 36)] = *(void *)((char *)v539 + *(int *)(v471 + 36));
      swift_retain();
      goto LABEL_98;
    case 3u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v27 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692D9840) + 32);
      v537 = a1;
      uint64_t v28 = &a1[v27];
      uint64_t v29 = (char *)a2 + v27;
      a1[v27] = *((unsigned char *)a2 + v27);
      uint64_t v30 = *(void **)((char *)a2 + v27 + 8);
      uint64_t v31 = *(void **)((char *)a2 + v27 + 16);
      uint64_t v32 = *(void *)((char *)a2 + v27 + 24);
      uint64_t v33 = *(unsigned __int16 *)((char *)a2 + v27 + 36);
      uint64_t v34 = *(unsigned int *)((char *)a2 + v27 + 32);
      sub_247FE4184(v30, v31, v32, v34 | (v33 << 32));
      *((void *)v28 + 1) = v30;
      *((void *)v28 + 2) = v31;
      *((void *)v28 + 3) = v32;
      *((_WORD *)v28 + 18) = v33;
      *((_DWORD *)v28 + 8) = v34;
      unsigned int v35 = v29[88];
      if (v35 <= 0xF9)
      {
        uint64_t v81 = *((void *)v29 + 5);
        uint64_t v82 = *((void *)v29 + 6);
        uint64_t v84 = *((void *)v29 + 7);
        uint64_t v83 = *((void *)v29 + 8);
        uint64_t v85 = *((void *)v29 + 9);
        uint64_t v86 = *((void *)v29 + 10);
        sub_247FA9804(v81, v82, v84, v83, v85, v86, v35);
        *((void *)v28 + 5) = v81;
        *((void *)v28 + 6) = v82;
        *((void *)v28 + 7) = v84;
        *((void *)v28 + 8) = v83;
        *((void *)v28 + 9) = v85;
        *((void *)v28 + 10) = v86;
        v28[88] = v35;
      }
      else
      {
        long long v36 = *(_OWORD *)(v29 + 56);
        *(_OWORD *)(v28 + 40) = *(_OWORD *)(v29 + 40);
        *(_OWORD *)(v28 + 56) = v36;
        *(_OWORD *)(v28 + 72) = *(_OWORD *)(v29 + 72);
        v28[88] = v29[88];
      }
      v28[96] = v29[96];
      v28[97] = v29[97];
      uint64_t v87 = *((void *)v29 + 14);
      *((void *)v28 + 13) = *((void *)v29 + 13);
      *((void *)v28 + 14) = v87;
      uint64_t v88 = *((void *)v29 + 16);
      *((void *)v28 + 15) = *((void *)v29 + 15);
      *((void *)v28 + 16) = v88;
      *((void *)v28 + 17) = *((void *)v29 + 17);
      *((_WORD *)v28 + 72) = *((_WORD *)v29 + 72);
      uint64_t v89 = *((void *)v29 + 20);
      *((void *)v28 + 19) = *((void *)v29 + 19);
      *((void *)v28 + 20) = v89;
      uint64_t v90 = *((void *)v29 + 21);
      uint64_t v541 = *((void *)v29 + 22);
      uint64_t v91 = *((void *)v29 + 23);
      uint64_t v92 = *((void *)v29 + 24);
      uint64_t v93 = *((void *)v29 + 25);
      uint64_t v94 = *((void *)v29 + 26);
      unsigned int v95 = v29[216];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_247FE41AC(v90, v541, v91, v92, v93, v94, v95);
      *((void *)v28 + 21) = v90;
      *((void *)v28 + 22) = v541;
      *((void *)v28 + 23) = v91;
      *((void *)v28 + 24) = v92;
      *((void *)v28 + 25) = v93;
      *((void *)v28 + 26) = v94;
      v28[216] = v95;
      uint64_t v96 = *((void *)v29 + 29);
      if (v96)
      {
        *((void *)v28 + 28) = *((void *)v29 + 28);
        *((void *)v28 + 29) = v96;
        uint64_t v97 = *((void *)v29 + 31);
        *((void *)v28 + 30) = *((void *)v29 + 30);
        *((void *)v28 + 31) = v97;
        swift_bridgeObjectRetain();
        swift_retain();
        swift_retain();
      }
      else
      {
        long long v117 = *((_OWORD *)v29 + 15);
        *((_OWORD *)v28 + 14) = *((_OWORD *)v29 + 14);
        *((_OWORD *)v28 + 15) = v117;
      }
      uint64_t v118 = *((void *)v29 + 33);
      *((void *)v28 + 32) = *((void *)v29 + 32);
      *((void *)v28 + 33) = v118;
      uint64_t v119 = *((void *)v29 + 35);
      *((void *)v28 + 34) = *((void *)v29 + 34);
      *((void *)v28 + 35) = v119;
      uint64_t v526 = type metadata accessor for SetupModel();
      uint64_t v120 = *(int *)(v526 + 32);
      long long v121 = &v28[v120];
      uint64_t v122 = &v29[v120];
      uint64_t v123 = (int *)type metadata accessor for IdMSAccount();
      uint64_t v472 = *((void *)v123 - 1);
      uint64_t v124 = *(unsigned int (**)(char *, uint64_t, int *))(v472 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v513 = v124;
      v534 = v123;
      v542 = v122;
      if (v124(v122, 1, v123))
      {
        uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v121, v122, *(void *)(*(void *)(v125 - 8) + 64));
      }
      else
      {
        uint64_t v181 = *((void *)v122 + 1);
        *(void *)long long v121 = *(void *)v122;
        *((void *)v121 + 1) = v181;
        uint64_t v182 = *((void *)v122 + 3);
        *((void *)v121 + 2) = *((void *)v122 + 2);
        *((void *)v121 + 3) = v182;
        uint64_t v183 = *((void *)v122 + 5);
        *((void *)v121 + 4) = *((void *)v122 + 4);
        *((void *)v121 + 5) = v183;
        uint64_t v184 = *((void *)v122 + 7);
        *((void *)v121 + 6) = *((void *)v122 + 6);
        *((void *)v121 + 7) = v184;
        uint64_t v185 = *((void *)v122 + 8);
        uint64_t v186 = *((void *)v122 + 9);
        *((void *)v121 + 8) = v185;
        *((void *)v121 + 9) = v186;
        uint64_t v187 = v123[5];
        uint64_t v511 = &v121[v187];
        v504 = &v542[v187];
        uint64_t v188 = sub_248174700();
        uint64_t v490 = *(void (**)(char *, char *, uint64_t))(*(void *)(v188 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v490(v511, v504, v188);
        uint64_t v189 = v123[6];
        uint64_t v190 = &v121[v189];
        uint64_t v191 = &v542[v189];
        uint64_t v192 = *((void *)v191 + 1);
        uint64_t v193 = *((void *)v191 + 2);
        uint64_t v194 = *((void *)v191 + 3);
        uint64_t v195 = *((void *)v191 + 5);
        uint64_t v485 = *((void *)v191 + 4);
        uint64_t v491 = *(void *)v191;
        uint64_t v196 = *((void *)v191 + 6);
        uint64_t v479 = *((void *)v191 + 7);
        uint64_t v505 = *((void *)v191 + 8);
        LOBYTE(v511) = v191[72];
        sub_247FABF8C(*(void *)v191, v192, v193, v194, v485, v195, v196, v479, v505, (char)v511);
        *(void *)uint64_t v190 = v491;
        *((void *)v190 + 1) = v192;
        *((void *)v190 + 2) = v193;
        *((void *)v190 + 3) = v194;
        *((void *)v190 + 4) = v485;
        *((void *)v190 + 5) = v195;
        uint64_t v122 = v542;
        *((void *)v190 + 6) = v196;
        *((void *)v190 + 7) = v479;
        *((void *)v190 + 8) = v505;
        v190[72] = (char)v511;
        *(void *)&v121[v123[7]] = *(void *)&v542[v123[7]];
        uint64_t v197 = *(void (**)(char *, void, uint64_t, int *))(v472 + 56);
        swift_bridgeObjectRetain();
        v197(v121, 0, 1, v123);
      }
      uint64_t v198 = (int *)type metadata accessor for AuthenticationModel();
      uint64_t v199 = v198[5];
      uint64_t v200 = &v121[v199];
      uint64_t v201 = &v122[v199];
      uint64_t v202 = *((void *)v201 + 1);
      v498 = v28;
      if (v202)
      {
        *(void *)uint64_t v200 = *(void *)v201;
        *((void *)v200 + 1) = v202;
        uint64_t v203 = *((void *)v201 + 3);
        *((void *)v200 + 2) = *((void *)v201 + 2);
        *((void *)v200 + 3) = v203;
        uint64_t v204 = *((void *)v201 + 5);
        *((void *)v200 + 4) = *((void *)v201 + 4);
        *((void *)v200 + 5) = v204;
        uint64_t v205 = *((void *)v201 + 7);
        *((void *)v200 + 6) = *((void *)v201 + 6);
        *((void *)v200 + 7) = v205;
        uint64_t v206 = *((void *)v201 + 9);
        *((void *)v200 + 8) = *((void *)v201 + 8);
        *((void *)v200 + 9) = v206;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v248 = *((_OWORD *)v201 + 3);
        *((_OWORD *)v200 + 2) = *((_OWORD *)v201 + 2);
        *((_OWORD *)v200 + 3) = v248;
        *((_OWORD *)v200 + 4) = *((_OWORD *)v201 + 4);
        long long v249 = *((_OWORD *)v201 + 1);
        *(_OWORD *)uint64_t v200 = *(_OWORD *)v201;
        *((_OWORD *)v200 + 1) = v249;
      }
      v121[v198[6]] = v122[v198[6]];
      uint64_t v250 = v198[7];
      uint64_t v251 = &v121[v250];
      long long v252 = &v122[v250];
      uint64_t v253 = *((void *)v252 + 1);
      *(void *)uint64_t v251 = *(void *)v252;
      *((void *)v251 + 1) = v253;
      *(void *)&v121[v198[8]] = *(void *)&v122[v198[8]];
      v121[v198[9]] = v122[v198[9]];
      uint64_t v254 = v198[10];
      v255 = &v121[v254];
      v256 = &v122[v254];
      uint64_t v257 = (void *)*((void *)v256 + 1);
      uint64_t v258 = (void *)*((void *)v256 + 2);
      v508 = v198;
      v512 = v121;
      uint64_t v482 = (void *)*((void *)v256 + 3);
      v260 = (void *)*((void *)v256 + 4);
      v259 = (void *)*((void *)v256 + 5);
      uint64_t v488 = *((void *)v256 + 6);
      v493 = *(void **)v256;
      v261 = (void *)*((void *)v256 + 8);
      uint64_t v477 = (void *)*((void *)v256 + 7);
      v262 = (void *)*((void *)v256 + 9);
      char v263 = v256[80];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_247F986A0(v493, v257, v258, v482, v260, v259, v488, v477, v261, v262, v263);
      *(void *)v255 = v493;
      *((void *)v255 + 1) = v257;
      *((void *)v255 + 2) = v258;
      *((void *)v255 + 3) = v482;
      *((void *)v255 + 4) = v260;
      *((void *)v255 + 5) = v259;
      *((void *)v255 + 6) = v488;
      *((void *)v255 + 7) = v477;
      *((void *)v255 + 8) = v261;
      *((void *)v255 + 9) = v262;
      v255[80] = v263;
      uint64_t v264 = v508[11];
      v265 = (void *)((char *)v512 + v264);
      v266 = &v542[v264];
      if (*(void *)v266)
      {
        uint64_t v267 = *((void *)v266 + 1);
        void *v265 = *(void *)v266;
        v265[1] = v267;
        swift_retain();
      }
      else
      {
        *(_OWORD *)v265 = *(_OWORD *)v266;
      }
      uint64_t v276 = *(int *)(v526 + 36);
      v277 = &v498[v276];
      v278 = &v29[v276];
      if (v513(&v29[v276], 1, v534))
      {
        uint64_t v279 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v277, v278, *(void *)(*(void *)(v279 - 8) + 64));
      }
      else
      {
        uint64_t v338 = *((void *)v278 + 1);
        *(void *)v277 = *(void *)v278;
        *((void *)v277 + 1) = v338;
        uint64_t v339 = *((void *)v278 + 3);
        *((void *)v277 + 2) = *((void *)v278 + 2);
        *((void *)v277 + 3) = v339;
        uint64_t v340 = *((void *)v278 + 5);
        *((void *)v277 + 4) = *((void *)v278 + 4);
        *((void *)v277 + 5) = v340;
        uint64_t v341 = *((void *)v278 + 7);
        *((void *)v277 + 6) = *((void *)v278 + 6);
        *((void *)v277 + 7) = v341;
        uint64_t v342 = *((void *)v278 + 9);
        *((void *)v277 + 8) = *((void *)v278 + 8);
        *((void *)v277 + 9) = v342;
        uint64_t v343 = v534[5];
        v544 = &v277[v343];
        unsigned int v529 = &v278[v343];
        uint64_t v344 = sub_248174700();
        v522 = *(void (**)(char *, char *, uint64_t))(*(void *)(v344 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v522(v544, v529, v344);
        uint64_t v345 = v534[6];
        uint64_t v346 = &v277[v345];
        uint64_t v347 = &v278[v345];
        uint64_t v348 = *((void *)v347 + 1);
        uint64_t v523 = *(void *)v347;
        uint64_t v349 = *((void *)v347 + 2);
        uint64_t v350 = *((void *)v347 + 3);
        uint64_t v351 = *((void *)v347 + 4);
        uint64_t v352 = *((void *)v347 + 5);
        uint64_t v353 = *((void *)v347 + 6);
        uint64_t v354 = *((void *)v347 + 7);
        uint64_t v530 = *((void *)v347 + 8);
        LOBYTE(v544) = v347[72];
        sub_247FABF8C(*(void *)v347, v348, v349, v350, v351, v352, v353, v354, v530, (char)v544);
        *(void *)uint64_t v346 = v523;
        *((void *)v346 + 1) = v348;
        *((void *)v346 + 2) = v349;
        *((void *)v346 + 3) = v350;
        *((void *)v346 + 4) = v351;
        *((void *)v346 + 5) = v352;
        *((void *)v346 + 6) = v353;
        *((void *)v346 + 7) = v354;
        *((void *)v346 + 8) = v530;
        v346[72] = (char)v544;
        *(void *)&v277[v534[7]] = *(void *)&v278[v534[7]];
        uint64_t v355 = *(void (**)(char *, void, uint64_t, int *))(v472 + 56);
        swift_bridgeObjectRetain();
        v355(v277, 0, 1, v534);
      }
      uint64_t v356 = (int *)type metadata accessor for SignInModel();
      uint64_t v357 = v356[5];
      uint64_t v358 = &v277[v357];
      v359 = &v278[v357];
      uint64_t v360 = *((void *)v359 + 1);
      if (v360)
      {
        *(void *)uint64_t v358 = *(void *)v359;
        *((void *)v358 + 1) = v360;
        uint64_t v361 = *((void *)v359 + 3);
        *((void *)v358 + 2) = *((void *)v359 + 2);
        *((void *)v358 + 3) = v361;
        uint64_t v362 = *((void *)v359 + 5);
        *((void *)v358 + 4) = *((void *)v359 + 4);
        *((void *)v358 + 5) = v362;
        uint64_t v363 = *((void *)v359 + 7);
        *((void *)v358 + 6) = *((void *)v359 + 6);
        *((void *)v358 + 7) = v363;
        uint64_t v364 = *((void *)v359 + 9);
        *((void *)v358 + 8) = *((void *)v359 + 8);
        *((void *)v358 + 9) = v364;
        uint64_t v365 = (uint64_t *)(v359 + 80);
        unint64_t v366 = *((void *)v359 + 11);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v366 >> 60 == 15)
        {
          *((_OWORD *)v358 + 5) = *(_OWORD *)v365;
        }
        else
        {
          uint64_t v438 = *v365;
          sub_247FB6C20(*v365, v366);
          *((void *)v358 + 10) = v438;
          *((void *)v358 + 11) = v366;
        }
      }
      else
      {
        long long v373 = *((_OWORD *)v359 + 3);
        *((_OWORD *)v358 + 2) = *((_OWORD *)v359 + 2);
        *((_OWORD *)v358 + 3) = v373;
        long long v374 = *((_OWORD *)v359 + 5);
        *((_OWORD *)v358 + 4) = *((_OWORD *)v359 + 4);
        *((_OWORD *)v358 + 5) = v374;
        long long v375 = *((_OWORD *)v359 + 1);
        *(_OWORD *)uint64_t v358 = *(_OWORD *)v359;
        *((_OWORD *)v358 + 1) = v375;
      }
      *(void *)&v277[v356[6]] = *(void *)&v278[v356[6]];
      *(void *)&v277[v356[7]] = *(void *)&v278[v356[7]];
      v277[v356[8]] = v278[v356[8]];
      v277[v356[9]] = v278[v356[9]];
      uint64_t v439 = v356[10];
      long long v440 = &v277[v439];
      uint64_t v441 = &v278[v439];
      uint64_t v442 = *(void *)&v278[v439 + 8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v442)
      {
        *(void *)long long v440 = *(void *)v441;
        *((void *)v440 + 1) = v442;
        uint64_t v443 = *((void *)v441 + 2);
        uint64_t v444 = *((void *)v441 + 3);
        *((void *)v440 + 2) = v443;
        *((void *)v440 + 3) = v444;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v445 = *((_OWORD *)v441 + 1);
        *(_OWORD *)long long v440 = *(_OWORD *)v441;
        *((_OWORD *)v440 + 1) = v445;
      }
      uint64_t v446 = v356[11];
      uint64_t v447 = &v277[v446];
      uint64_t v448 = &v278[v446];
      uint64_t v449 = *((void *)v448 + 1);
      *(void *)uint64_t v447 = *(void *)v448;
      *((void *)v447 + 1) = v449;
      uint64_t v450 = v356[12];
      v451 = *(void **)&v278[v450];
      *(void *)&v277[v450] = v451;
      uint64_t v452 = v356[13];
      uint64_t v453 = &v277[v452];
      uint64_t v454 = &v278[v452];
      uint64_t v455 = *(void *)v454;
      uint64_t v456 = *((void *)v454 + 1);
      char v457 = v454[16];
      swift_bridgeObjectRetain();
      id v458 = v451;
      sub_247FE42A8(v455, v456, v457);
      *(void *)uint64_t v453 = v455;
      *((void *)v453 + 1) = v456;
      v453[16] = v457;
      uint64_t v459 = v356[14];
      uint64_t v460 = &v277[v459];
      char v461 = &v278[v459];
      uint64_t v462 = *((void *)v461 + 1);
      *(void *)uint64_t v460 = *(void *)v461;
      *((void *)v460 + 1) = v462;
      v277[v356[15]] = v278[v356[15]];
      uint64_t v463 = v356[16];
      v464 = &v277[v463];
      v465 = &v278[v463];
      unint64_t v466 = *(void *)&v278[v463 + 8];
      swift_bridgeObjectRetain();
      if (v466 >= 3)
      {
        *(void *)v464 = *(void *)v465;
        *((void *)v464 + 1) = v466;
        uint64_t v468 = *((void *)v465 + 3);
        *((void *)v464 + 2) = *((void *)v465 + 2);
        *((void *)v464 + 3) = v468;
        v464[32] = v465[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v467 = *((_OWORD *)v465 + 1);
        *(_OWORD *)v464 = *(_OWORD *)v465;
        *((_OWORD *)v464 + 1) = v467;
        v464[32] = v465[32];
      }
      a1 = v537;
      goto LABEL_98;
    case 4u:
      uint64_t v37 = *(void *)a2;
      uint64_t v38 = *((void *)a2 + 1);
      uint64_t v39 = (uint64_t *)a1;
      uint64_t v40 = *((void *)a2 + 2);
      uint64_t v41 = *((void *)a2 + 3);
      uint64_t v42 = *((void *)a2 + 4);
      uint64_t v43 = *((void *)a2 + 5);
      char v44 = *((unsigned char *)a2 + 48);
      sub_247FA9804(v37, v38, v40, v41, v42, v43, v44);
      *uint64_t v39 = v37;
      v39[1] = v38;
      v39[2] = v40;
      v39[3] = v41;
      a1 = (char *)v39;
      v39[4] = v42;
      v39[5] = v43;
      *((unsigned char *)v39 + 48) = v44;
LABEL_98:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

char *assignWithCopy for MachSetupMessage(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v3 = (char *)a1;
  if ((void *)a1 != a2)
  {
    sub_24817150C(a1, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
    uint64_t v453 = v3;
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *unsigned int v3 = *(unsigned char *)a2;
        uint64_t v6 = (void *)a2[1];
        uint64_t v7 = (void *)a2[2];
        uint64_t v8 = a2[3];
        uint64_t v9 = *((unsigned __int16 *)a2 + 18);
        uint64_t v10 = *((unsigned int *)a2 + 8);
        sub_247FE4184(v6, v7, v8, v10 | (v9 << 32));
        *((void *)v3 + 1) = v6;
        *((void *)v3 + 2) = v7;
        *((void *)v3 + 3) = v8;
        *((_WORD *)v3 + 18) = v9;
        *((_DWORD *)v3 + 8) = v10;
        unsigned int v11 = *((unsigned __int8 *)a2 + 88);
        if (v11 <= 0xF9)
        {
          uint64_t v47 = a2[5];
          uint64_t v48 = a2[6];
          uint64_t v49 = a2[7];
          uint64_t v50 = a2[8];
          uint64_t v51 = a2[9];
          uint64_t v52 = a2[10];
          sub_247FA9804(v47, v48, v49, v50, v51, v52, v11);
          *((void *)v453 + 5) = v47;
          *((void *)v453 + 6) = v48;
          *((void *)v453 + 7) = v49;
          *((void *)v453 + 8) = v50;
          *((void *)v453 + 9) = v51;
          *((void *)v453 + 10) = v52;
          unsigned int v3 = v453;
          v453[88] = v11;
        }
        else
        {
          long long v12 = *(_OWORD *)(a2 + 5);
          long long v13 = *(_OWORD *)(a2 + 7);
          long long v14 = *(_OWORD *)(a2 + 9);
          v3[88] = *((unsigned char *)a2 + 88);
          *(_OWORD *)(v3 + 56) = v13;
          *(_OWORD *)(v3 + 72) = v14;
          *(_OWORD *)(v3 + 40) = v12;
        }
        v3[96] = *((unsigned char *)a2 + 96);
        v3[97] = *((unsigned char *)a2 + 97);
        *((void *)v3 + 13) = a2[13];
        *((void *)v3 + 14) = a2[14];
        *((void *)v3 + 15) = a2[15];
        *((void *)v3 + 16) = a2[16];
        uint64_t v53 = a2[17];
        v3[144] = *((unsigned char *)a2 + 144);
        *((void *)v3 + 17) = v53;
        v3[145] = *((unsigned char *)a2 + 145);
        *((void *)v3 + 19) = a2[19];
        *((void *)v3 + 20) = a2[20];
        uint64_t v54 = a2[21];
        uint64_t v55 = a2[22];
        uint64_t v56 = a2[23];
        uint64_t v57 = a2[24];
        uint64_t v59 = a2[25];
        uint64_t v58 = a2[26];
        unsigned int v60 = *((unsigned __int8 *)a2 + 216);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247FE41AC(v54, v55, v56, v57, v59, v58, v60);
        *((void *)v453 + 21) = v54;
        *((void *)v453 + 22) = v55;
        *((void *)v453 + 23) = v56;
        *((void *)v453 + 24) = v57;
        *((void *)v453 + 25) = v59;
        *((void *)v453 + 26) = v58;
        v453[216] = v60;
        if (a2[29])
        {
          *((void *)v453 + 28) = a2[28];
          *((void *)v453 + 29) = a2[29];
          *((void *)v453 + 30) = a2[30];
          *((void *)v453 + 31) = a2[31];
          swift_bridgeObjectRetain();
          swift_retain();
          swift_retain();
        }
        else
        {
          long long v87 = *((_OWORD *)a2 + 15);
          *((_OWORD *)v453 + 14) = *((_OWORD *)a2 + 14);
          *((_OWORD *)v453 + 15) = v87;
        }
        *((void *)v453 + 32) = a2[32];
        *((void *)v453 + 33) = a2[33];
        *((void *)v453 + 34) = a2[34];
        *((void *)v453 + 35) = a2[35];
        uint64_t v88 = type metadata accessor for SetupModel();
        uint64_t v89 = *(int *)(v88 + 32);
        uint64_t v90 = &v453[v89];
        uint64_t v91 = (void *)((char *)a2 + v89);
        uint64_t v92 = type metadata accessor for IdMSAccount();
        uint64_t v93 = *(void *)(v92 - 8);
        uint64_t v94 = *(unsigned int (**)(void *, uint64_t, int *))(v93 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v441 = (int *)v92;
        uint64_t v381 = v93;
        uint64_t v382 = v94;
        uint64_t v384 = v88;
        uint64_t v446 = v91;
        if (v94(v91, 1, (int *)v92))
        {
          uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v90, v91, *(void *)(*(void *)(v95 - 8) + 64));
        }
        else
        {
          *(void *)uint64_t v90 = *v91;
          *((void *)v90 + 1) = v91[1];
          *((void *)v90 + 2) = v91[2];
          *((void *)v90 + 3) = v91[3];
          *((void *)v90 + 4) = v91[4];
          *((void *)v90 + 5) = v91[5];
          *((void *)v90 + 6) = v91[6];
          *((void *)v90 + 7) = v91[7];
          *((void *)v90 + 8) = v91[8];
          *((void *)v90 + 9) = v91[9];
          uint64_t v110 = *(int *)(v92 + 20);
          uint64_t v432 = &v90[v110];
          v420 = (char *)v91 + v110;
          uint64_t v111 = sub_248174700();
          long long v112 = *(void (**)(char *, char *, uint64_t))(*(void *)(v111 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v112(v432, v420, v111);
          uint64_t v113 = v441[6];
          uint64_t v114 = &v90[v113];
          uint64_t v115 = (char *)v91 + v113;
          uint64_t v116 = *(void *)v115;
          uint64_t v117 = *((void *)v115 + 1);
          uint64_t v118 = *((void *)v115 + 2);
          uint64_t v119 = *((void *)v115 + 3);
          uint64_t v120 = *((void *)v115 + 4);
          uint64_t v121 = *((void *)v115 + 5);
          uint64_t v122 = *((void *)v115 + 6);
          uint64_t v415 = *((void *)v115 + 7);
          uint64_t v421 = *((void *)v115 + 8);
          LOBYTE(v432) = v115[72];
          sub_247FABF8C(*(void *)v115, v117, v118, v119, v120, v121, v122, v415, v421, (char)v432);
          *(void *)uint64_t v114 = v116;
          *((void *)v114 + 1) = v117;
          *((void *)v114 + 2) = v118;
          *((void *)v114 + 3) = v119;
          *((void *)v114 + 4) = v120;
          *((void *)v114 + 5) = v121;
          *((void *)v114 + 6) = v122;
          uint64_t v91 = v446;
          *((void *)v114 + 7) = v415;
          *((void *)v114 + 8) = v421;
          v114[72] = (char)v432;
          *(void *)&v90[v441[7]] = *(void *)((char *)v446 + v441[7]);
          uint64_t v123 = *(void (**)(char *, void, uint64_t, int *))(v381 + 56);
          swift_bridgeObjectRetain();
          v123(v90, 0, 1, v441);
        }
        uint64_t v124 = (int *)type metadata accessor for AuthenticationModel();
        uint64_t v125 = v124[5];
        uint64_t v126 = &v90[v125];
        uint64_t v127 = (void *)((char *)v91 + v125);
        if (v127[1])
        {
          *(void *)uint64_t v126 = *v127;
          *((void *)v126 + 1) = v127[1];
          *((void *)v126 + 2) = v127[2];
          *((void *)v126 + 3) = v127[3];
          *((void *)v126 + 4) = v127[4];
          *((void *)v126 + 5) = v127[5];
          *((void *)v126 + 6) = v127[6];
          *((void *)v126 + 7) = v127[7];
          *((void *)v126 + 8) = v127[8];
          *((void *)v126 + 9) = v127[9];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          *(_OWORD *)uint64_t v126 = *(_OWORD *)v127;
          long long v158 = *((_OWORD *)v127 + 1);
          long long v159 = *((_OWORD *)v127 + 2);
          long long v160 = *((_OWORD *)v127 + 4);
          *((_OWORD *)v126 + 3) = *((_OWORD *)v127 + 3);
          *((_OWORD *)v126 + 4) = v160;
          *((_OWORD *)v126 + 1) = v158;
          *((_OWORD *)v126 + 2) = v159;
        }
        v90[v124[6]] = *((unsigned char *)v91 + v124[6]);
        uint64_t v161 = v124[7];
        uint64_t v162 = &v90[v161];
        uint64_t v163 = (void *)((char *)v91 + v161);
        *(void *)uint64_t v162 = *v163;
        *((void *)v162 + 1) = v163[1];
        *(void *)&v90[v124[8]] = *(void *)((char *)v91 + v124[8]);
        v90[v124[9]] = *((unsigned char *)v91 + v124[9]);
        uint64_t v164 = v124[10];
        uint64_t v165 = &v90[v164];
        uint64_t v166 = (char *)v91 + v164;
        uint64_t v406 = (void *)*((void *)v166 + 1);
        uint64_t v411 = *(void **)v166;
        uint64_t v417 = v124;
        uint64_t v422 = v90;
        uint64_t v167 = (void *)*((void *)v166 + 2);
        uint64_t v400 = (void *)*((void *)v166 + 3);
        uint64_t v169 = (void *)*((void *)v166 + 4);
        uint64_t v168 = (void *)*((void *)v166 + 5);
        uint64_t v170 = *((void *)v166 + 6);
        v433 = (void *)*((void *)v166 + 7);
        uint64_t v172 = (void *)*((void *)v166 + 8);
        uint64_t v171 = (void *)*((void *)v166 + 9);
        char v173 = v166[80];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247F986A0(v411, v406, v167, v400, v169, v168, v170, v433, v172, v171, v173);
        *(void *)uint64_t v165 = v411;
        *((void *)v165 + 1) = v406;
        *((void *)v165 + 2) = v167;
        *((void *)v165 + 3) = v400;
        *((void *)v165 + 4) = v169;
        *((void *)v165 + 5) = v168;
        *((void *)v165 + 6) = v170;
        *((void *)v165 + 7) = v433;
        *((void *)v165 + 8) = v172;
        *((void *)v165 + 9) = v171;
        v165[80] = v173;
        uint64_t v174 = v417[11];
        uint64_t v175 = (void *)((char *)v422 + v174);
        uint64_t v176 = (void *)((char *)v446 + v174);
        if (*v176)
        {
          uint64_t v177 = v176[1];
          *uint64_t v175 = *v176;
          v175[1] = v177;
          swift_retain();
        }
        else
        {
          *(_OWORD *)uint64_t v175 = *(_OWORD *)v176;
        }
        unsigned int v3 = v453;
        uint64_t v217 = *(int *)(v384 + 36);
        uint64_t v218 = &v453[v217];
        v219 = (void *)((char *)a2 + v217);
        if (v382(v219, 1, v441))
        {
          uint64_t v220 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v218, v219, *(void *)(*(void *)(v220 - 8) + 64));
        }
        else
        {
          *(void *)uint64_t v218 = *v219;
          *((void *)v218 + 1) = v219[1];
          *((void *)v218 + 2) = v219[2];
          *((void *)v218 + 3) = v219[3];
          *((void *)v218 + 4) = v219[4];
          *((void *)v218 + 5) = v219[5];
          *((void *)v218 + 6) = v219[6];
          *((void *)v218 + 7) = v219[7];
          *((void *)v218 + 8) = v219[8];
          *((void *)v218 + 9) = v219[9];
          uint64_t v230 = v441[5];
          uint64_t v449 = &v218[v230];
          v434 = (char *)v219 + v230;
          uint64_t v231 = sub_248174700();
          char v426 = *(void (**)(char *, char *, uint64_t))(*(void *)(v231 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v426(v449, v434, v231);
          uint64_t v232 = v441[6];
          uint64_t v233 = &v218[v232];
          uint64_t v234 = (char *)v219 + v232;
          uint64_t v235 = *((void *)v234 + 1);
          uint64_t v236 = *((void *)v234 + 2);
          uint64_t v237 = *((void *)v234 + 3);
          uint64_t v238 = *((void *)v234 + 4);
          uint64_t v239 = *((void *)v234 + 5);
          uint64_t v240 = *((void *)v234 + 6);
          uint64_t v241 = *((void *)v234 + 7);
          uint64_t v427 = *(void *)v234;
          uint64_t v435 = *((void *)v234 + 8);
          LOBYTE(v449) = v234[72];
          sub_247FABF8C(*(void *)v234, v235, v236, v237, v238, v239, v240, v241, v435, (char)v449);
          *(void *)uint64_t v233 = v427;
          *((void *)v233 + 1) = v235;
          *((void *)v233 + 2) = v236;
          *((void *)v233 + 3) = v237;
          *((void *)v233 + 4) = v238;
          *((void *)v233 + 5) = v239;
          *((void *)v233 + 6) = v240;
          *((void *)v233 + 7) = v241;
          unsigned int v3 = v453;
          *((void *)v233 + 8) = v435;
          v233[72] = (char)v449;
          *(void *)&v218[v441[7]] = *(void *)((char *)v219 + v441[7]);
          v242 = *(void (**)(char *, void, uint64_t, int *))(v381 + 56);
          swift_bridgeObjectRetain();
          v242(v218, 0, 1, v441);
        }
        char v243 = (int *)type metadata accessor for SignInModel();
        uint64_t v244 = v243[5];
        v245 = &v218[v244];
        v246 = (void *)((char *)v219 + v244);
        if (v246[1])
        {
          *(void *)v245 = *v246;
          *((void *)v245 + 1) = v246[1];
          *((void *)v245 + 2) = v246[2];
          *((void *)v245 + 3) = v246[3];
          *((void *)v245 + 4) = v246[4];
          *((void *)v245 + 5) = v246[5];
          *((void *)v245 + 6) = v246[6];
          *((void *)v245 + 7) = v246[7];
          *((void *)v245 + 8) = v246[8];
          *((void *)v245 + 9) = v246[9];
          uint64_t v247 = v246 + 10;
          unint64_t v248 = v246[11];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v248 >> 60 == 15)
          {
            *((_OWORD *)v245 + 5) = *(_OWORD *)v247;
          }
          else
          {
            uint64_t v298 = *v247;
            sub_247FB6C20(*v247, v248);
            *((void *)v245 + 10) = v298;
            *((void *)v245 + 11) = v248;
          }
          unsigned int v3 = v453;
        }
        else
        {
          long long v286 = *((_OWORD *)v246 + 1);
          *(_OWORD *)v245 = *(_OWORD *)v246;
          *((_OWORD *)v245 + 1) = v286;
          long long v287 = *((_OWORD *)v246 + 2);
          long long v288 = *((_OWORD *)v246 + 3);
          long long v289 = *((_OWORD *)v246 + 5);
          *((_OWORD *)v245 + 4) = *((_OWORD *)v246 + 4);
          *((_OWORD *)v245 + 5) = v289;
          *((_OWORD *)v245 + 2) = v287;
          *((_OWORD *)v245 + 3) = v288;
        }
        *(void *)&v218[v243[6]] = *(void *)((char *)v219 + v243[6]);
        *(void *)&v218[v243[7]] = *(void *)((char *)v219 + v243[7]);
        v218[v243[8]] = *((unsigned char *)v219 + v243[8]);
        v218[v243[9]] = *((unsigned char *)v219 + v243[9]);
        uint64_t v299 = v243[10];
        uint64_t v300 = &v218[v299];
        v301 = (void *)((char *)v219 + v299);
        uint64_t v302 = *(void *)((char *)v219 + v299 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v302)
        {
          *(void *)uint64_t v300 = *v301;
          *((void *)v300 + 1) = v301[1];
          *((void *)v300 + 2) = v301[2];
          *((void *)v300 + 3) = v301[3];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v303 = *((_OWORD *)v301 + 1);
          *(_OWORD *)uint64_t v300 = *(_OWORD *)v301;
          *((_OWORD *)v300 + 1) = v303;
        }
        uint64_t v304 = v243[11];
        uint64_t v305 = &v218[v304];
        uint64_t v306 = (void *)((char *)v219 + v304);
        *(void *)uint64_t v305 = *v306;
        *((void *)v305 + 1) = v306[1];
        uint64_t v307 = v243[12];
        unint64_t v308 = *(void **)((char *)v219 + v307);
        *(void *)&v218[v307] = v308;
        uint64_t v309 = v243[13];
        uint64_t v310 = &v218[v309];
        uint64_t v311 = (char *)v219 + v309;
        uint64_t v312 = *(void *)v311;
        uint64_t v313 = *((void *)v311 + 1);
        char v314 = v311[16];
        swift_bridgeObjectRetain();
        id v315 = v308;
        sub_247FE42A8(v312, v313, v314);
        *(void *)uint64_t v310 = v312;
        *((void *)v310 + 1) = v313;
        v310[16] = v314;
        uint64_t v316 = v243[14];
        uint64_t v317 = &v218[v316];
        uint64_t v318 = (void *)((char *)v219 + v316);
        *(void *)uint64_t v317 = *v318;
        *((void *)v317 + 1) = v318[1];
        v218[v243[15]] = *((unsigned char *)v219 + v243[15]);
        uint64_t v319 = v243[16];
        uint64_t v320 = &v218[v319];
        uint64_t v321 = (char *)v219 + v319;
        unint64_t v322 = *((void *)v321 + 1);
        swift_bridgeObjectRetain();
        if (v322 >= 3) {
          goto LABEL_97;
        }
        long long v323 = *(_OWORD *)v321;
        long long v324 = *((_OWORD *)v321 + 1);
        v320[32] = v321[32];
        *(_OWORD *)uint64_t v320 = v323;
        *((_OWORD *)v320 + 1) = v324;
        goto LABEL_98;
      case 1u:
        *(void *)unsigned int v3 = *a2;
        *((void *)v3 + 1) = a2[1];
        *((void *)v3 + 2) = a2[2];
        *((void *)v3 + 3) = a2[3];
        *((void *)v3 + 4) = a2[4];
        uint64_t v15 = a2[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v15)
        {
          *((void *)v3 + 5) = a2[5];
          *((void *)v3 + 6) = a2[6];
          *((void *)v3 + 7) = a2[7];
          *((void *)v3 + 8) = a2[8];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v86 = *(_OWORD *)(a2 + 7);
          *(_OWORD *)(v3 + 40) = *(_OWORD *)(a2 + 5);
          *(_OWORD *)(v3 + 56) = v86;
        }
        *((void *)v3 + 9) = a2[9];
        swift_bridgeObjectRetain();
        goto LABEL_98;
      case 2u:
        *(void *)unsigned int v3 = *a2;
        v3[8] = *((unsigned char *)a2 + 8);
        uint64_t v379 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
        uint64_t v16 = *(int *)(v379 + 32);
        uint64_t v17 = &v3[v16];
        uint64_t v18 = (char *)a2 + v16;
        v3[v16] = *((unsigned char *)a2 + v16);
        unint64_t v19 = *(void **)((char *)a2 + v16 + 8);
        uint64_t v20 = *(void **)((char *)a2 + v16 + 16);
        uint64_t v21 = *(void *)((char *)a2 + v16 + 24);
        uint64_t v22 = *(unsigned __int16 *)((char *)a2 + v16 + 36);
        uint64_t v23 = *(unsigned int *)((char *)a2 + v16 + 32);
        sub_247FE4184(v19, v20, v21, v23 | (v22 << 32));
        *((void *)v17 + 1) = v19;
        *((void *)v17 + 2) = v20;
        *((void *)v17 + 3) = v21;
        *((_WORD *)v17 + 18) = v22;
        *((_DWORD *)v17 + 8) = v23;
        unsigned int v24 = v18[88];
        if (v24 <= 0xF9)
        {
          uint64_t v61 = *((void *)v18 + 5);
          uint64_t v62 = *((void *)v18 + 6);
          uint64_t v64 = *((void *)v18 + 7);
          uint64_t v63 = *((void *)v18 + 8);
          uint64_t v66 = *((void *)v18 + 9);
          uint64_t v65 = *((void *)v18 + 10);
          sub_247FA9804(v61, v62, v64, v63, v66, v65, v18[88]);
          *((void *)v17 + 5) = v61;
          *((void *)v17 + 6) = v62;
          *((void *)v17 + 7) = v64;
          *((void *)v17 + 8) = v63;
          *((void *)v17 + 9) = v66;
          *((void *)v17 + 10) = v65;
          v17[88] = v24;
        }
        else
        {
          long long v25 = *(_OWORD *)(v18 + 40);
          long long v26 = *(_OWORD *)(v18 + 56);
          long long v27 = *(_OWORD *)(v18 + 72);
          v17[88] = v18[88];
          *(_OWORD *)(v17 + 56) = v26;
          *(_OWORD *)(v17 + 72) = v27;
          *(_OWORD *)(v17 + 40) = v25;
        }
        v17[96] = v18[96];
        v17[97] = v18[97];
        *((void *)v17 + 13) = *((void *)v18 + 13);
        *((void *)v17 + 14) = *((void *)v18 + 14);
        *((void *)v17 + 15) = *((void *)v18 + 15);
        *((void *)v17 + 16) = *((void *)v18 + 16);
        uint64_t v67 = *((void *)v18 + 17);
        v17[144] = v18[144];
        *((void *)v17 + 17) = v67;
        v17[145] = v18[145];
        *((void *)v17 + 19) = *((void *)v18 + 19);
        *((void *)v17 + 20) = *((void *)v18 + 20);
        uint64_t v68 = *((void *)v18 + 21);
        uint64_t v444 = *((void *)v18 + 22);
        uint64_t v69 = *((void *)v18 + 23);
        uint64_t v70 = *((void *)v18 + 24);
        uint64_t v71 = *((void *)v18 + 25);
        uint64_t v72 = *((void *)v18 + 26);
        unsigned int v440 = v18[216];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247FE41AC(v68, v444, v69, v70, v71, v72, v440);
        *((void *)v17 + 21) = v68;
        *((void *)v17 + 22) = v444;
        *((void *)v17 + 23) = v69;
        *((void *)v17 + 24) = v70;
        *((void *)v17 + 25) = v71;
        *((void *)v17 + 26) = v72;
        v17[216] = v440;
        if (*((void *)v18 + 29))
        {
          *((void *)v17 + 28) = *((void *)v18 + 28);
          *((void *)v17 + 29) = *((void *)v18 + 29);
          *((void *)v17 + 30) = *((void *)v18 + 30);
          *((void *)v17 + 31) = *((void *)v18 + 31);
          swift_bridgeObjectRetain();
          swift_retain();
          swift_retain();
        }
        else
        {
          long long v96 = *((_OWORD *)v18 + 15);
          *((_OWORD *)v17 + 14) = *((_OWORD *)v18 + 14);
          *((_OWORD *)v17 + 15) = v96;
        }
        *((void *)v17 + 32) = *((void *)v18 + 32);
        *((void *)v17 + 33) = *((void *)v18 + 33);
        *((void *)v17 + 34) = *((void *)v18 + 34);
        *((void *)v17 + 35) = *((void *)v18 + 35);
        uint64_t v430 = type metadata accessor for SetupModel();
        uint64_t v97 = *(int *)(v430 + 32);
        long long v98 = &v17[v97];
        long long v99 = &v18[v97];
        uint64_t v100 = (int *)type metadata accessor for IdMSAccount();
        uint64_t v378 = *((void *)v100 - 1);
        uint64_t v101 = *(unsigned int (**)(char *, uint64_t, int *))(v378 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        long long v414 = v101;
        uint64_t v442 = v100;
        uint64_t v447 = v98;
        if (v101(v99, 1, v100))
        {
          uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v98, v99, *(void *)(*(void *)(v102 - 8) + 64));
        }
        else
        {
          *(void *)long long v98 = *(void *)v99;
          *((void *)v98 + 1) = *((void *)v99 + 1);
          *((void *)v98 + 2) = *((void *)v99 + 2);
          *((void *)v98 + 3) = *((void *)v99 + 3);
          *((void *)v98 + 4) = *((void *)v99 + 4);
          *((void *)v98 + 5) = *((void *)v99 + 5);
          *((void *)v98 + 6) = *((void *)v99 + 6);
          *((void *)v98 + 7) = *((void *)v99 + 7);
          *((void *)v98 + 8) = *((void *)v99 + 8);
          *((void *)v98 + 9) = *((void *)v99 + 9);
          uint64_t v128 = v100[5];
          v403 = &v99[v128];
          uint64_t v408 = &v98[v128];
          uint64_t v129 = sub_248174700();
          uint64_t v392 = *(void (**)(char *, char *, uint64_t))(*(void *)(v129 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v392(v408, v403, v129);
          uint64_t v130 = v100[6];
          uint64_t v131 = &v98[v130];
          uint64_t v132 = &v99[v130];
          uint64_t v133 = *((void *)v132 + 1);
          uint64_t v134 = *((void *)v132 + 2);
          uint64_t v135 = *((void *)v132 + 3);
          uint64_t v136 = *((void *)v132 + 5);
          uint64_t v393 = *((void *)v132 + 4);
          uint64_t v397 = *(void *)v132;
          uint64_t v385 = *((void *)v132 + 7);
          uint64_t v388 = *((void *)v132 + 6);
          uint64_t v404 = *((void *)v132 + 8);
          LOBYTE(v408) = v132[72];
          sub_247FABF8C(*(void *)v132, v133, v134, v135, v393, v136, v388, v385, v404, (char)v408);
          *(void *)uint64_t v131 = v397;
          *((void *)v131 + 1) = v133;
          *((void *)v131 + 2) = v134;
          *((void *)v131 + 3) = v135;
          *((void *)v131 + 4) = v393;
          *((void *)v131 + 5) = v136;
          long long v98 = v447;
          *((void *)v131 + 6) = v388;
          *((void *)v131 + 7) = v385;
          *((void *)v131 + 8) = v404;
          v131[72] = (char)v408;
          *(void *)&v447[v100[7]] = *(void *)&v99[v100[7]];
          uint64_t v137 = *(void (**)(char *, void, uint64_t, int *))(v378 + 56);
          swift_bridgeObjectRetain();
          v137(v447, 0, 1, v100);
        }
        uint64_t v138 = v99;
        uint64_t v139 = (int *)type metadata accessor for AuthenticationModel();
        uint64_t v140 = v139[5];
        uint64_t v141 = &v98[v140];
        uint64_t v142 = (void *)((char *)v138 + v140);
        uint64_t v425 = a2;
        if (v142[1])
        {
          *(void *)uint64_t v141 = *v142;
          *((void *)v141 + 1) = v142[1];
          *((void *)v141 + 2) = v142[2];
          *((void *)v141 + 3) = v142[3];
          *((void *)v141 + 4) = v142[4];
          *((void *)v141 + 5) = v142[5];
          *((void *)v141 + 6) = v142[6];
          *((void *)v141 + 7) = v142[7];
          *((void *)v141 + 8) = v142[8];
          *((void *)v141 + 9) = v142[9];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          *(_OWORD *)uint64_t v141 = *(_OWORD *)v142;
          long long v178 = *((_OWORD *)v142 + 1);
          long long v179 = *((_OWORD *)v142 + 2);
          long long v180 = *((_OWORD *)v142 + 4);
          *((_OWORD *)v141 + 3) = *((_OWORD *)v142 + 3);
          *((_OWORD *)v141 + 4) = v180;
          *((_OWORD *)v141 + 1) = v178;
          *((_OWORD *)v141 + 2) = v179;
        }
        v98[v139[6]] = *((unsigned char *)v138 + v139[6]);
        uint64_t v181 = v139[7];
        uint64_t v182 = &v98[v181];
        uint64_t v183 = (void *)((char *)v138 + v181);
        *(void *)uint64_t v182 = *v183;
        *((void *)v182 + 1) = v183[1];
        *(void *)&v98[v139[8]] = *(void *)((char *)v138 + v139[8]);
        v98[v139[9]] = *((unsigned char *)v138 + v139[9]);
        uint64_t v184 = v139[10];
        uint64_t v185 = &v98[v184];
        uint64_t v186 = (char *)v138 + v184;
        uint64_t v187 = (void *)*((void *)v186 + 1);
        uint64_t v188 = (void *)*((void *)v186 + 2);
        char v395 = (void *)*((void *)v186 + 3);
        uint64_t v401 = *(void **)v186;
        uint64_t v407 = v139;
        uint64_t v412 = v138;
        uint64_t v189 = (void *)*((void *)v186 + 4);
        uint64_t v386 = *((void *)v186 + 6);
        uint64_t v390 = (void *)*((void *)v186 + 5);
        uint64_t v190 = (void *)*((void *)v186 + 8);
        long long v383 = (void *)*((void *)v186 + 7);
        uint64_t v191 = (void *)*((void *)v186 + 9);
        char v192 = v186[80];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247F986A0(v401, v187, v188, v395, v189, v390, v386, v383, v190, v191, v192);
        *(void *)uint64_t v185 = v401;
        *((void *)v185 + 1) = v187;
        *((void *)v185 + 2) = v188;
        *((void *)v185 + 3) = v395;
        *((void *)v185 + 4) = v189;
        *((void *)v185 + 5) = v390;
        *((void *)v185 + 6) = v386;
        *((void *)v185 + 7) = v383;
        *((void *)v185 + 8) = v190;
        *((void *)v185 + 9) = v191;
        v185[80] = v192;
        uint64_t v193 = v407[11];
        uint64_t v194 = &v447[v193];
        uint64_t v195 = (void *)((char *)v412 + v193);
        if (*v195)
        {
          uint64_t v196 = v195[1];
          *(void *)uint64_t v194 = *v195;
          *((void *)v194 + 1) = v196;
          swift_retain();
        }
        else
        {
          *(_OWORD *)uint64_t v194 = *(_OWORD *)v195;
        }
        uint64_t v221 = *(int *)(v430 + 36);
        v222 = &v17[v221];
        char v223 = &v18[v221];
        uint64_t v224 = v425;
        if (v414(&v18[v221], 1, v442))
        {
          uint64_t v225 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v222, v223, *(void *)(*(void *)(v225 - 8) + 64));
        }
        else
        {
          *(void *)v222 = *(void *)v223;
          *((void *)v222 + 1) = *((void *)v223 + 1);
          *((void *)v222 + 2) = *((void *)v223 + 2);
          *((void *)v222 + 3) = *((void *)v223 + 3);
          *((void *)v222 + 4) = *((void *)v223 + 4);
          *((void *)v222 + 5) = *((void *)v223 + 5);
          *((void *)v222 + 6) = *((void *)v223 + 6);
          *((void *)v222 + 7) = *((void *)v223 + 7);
          *((void *)v222 + 8) = *((void *)v223 + 8);
          *((void *)v222 + 9) = *((void *)v223 + 9);
          uint64_t v249 = v442[5];
          uint64_t v450 = &v222[v249];
          long long v436 = &v223[v249];
          uint64_t v250 = sub_248174700();
          uint64_t v423 = *(void (**)(char *, char *, uint64_t))(*(void *)(v250 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v423(v450, v436, v250);
          uint64_t v251 = v442[6];
          long long v252 = &v222[v251];
          uint64_t v253 = &v223[v251];
          uint64_t v254 = *((void *)v253 + 1);
          uint64_t v255 = *((void *)v253 + 2);
          uint64_t v256 = *((void *)v253 + 3);
          uint64_t v257 = *((void *)v253 + 4);
          uint64_t v258 = *((void *)v253 + 5);
          uint64_t v259 = *((void *)v253 + 6);
          uint64_t v424 = *((void *)v253 + 7);
          uint64_t v437 = *((void *)v253 + 8);
          LOBYTE(v450) = v253[72];
          uint64_t v260 = *(void *)v253;
          sub_247FABF8C(*(void *)v253, v254, v255, v256, v257, v258, v259, v424, v437, (char)v450);
          *(void *)long long v252 = v260;
          *((void *)v252 + 1) = v254;
          *((void *)v252 + 2) = v255;
          *((void *)v252 + 3) = v256;
          *((void *)v252 + 4) = v257;
          *((void *)v252 + 5) = v258;
          *((void *)v252 + 6) = v259;
          *((void *)v252 + 7) = v424;
          uint64_t v224 = v425;
          *((void *)v252 + 8) = v437;
          v252[72] = (char)v450;
          *(void *)&v222[v442[7]] = *(void *)&v223[v442[7]];
          v261 = *(void (**)(char *, void, uint64_t, int *))(v378 + 56);
          swift_bridgeObjectRetain();
          v261(v222, 0, 1, v442);
        }
        v262 = (int *)type metadata accessor for SignInModel();
        uint64_t v263 = v262[5];
        uint64_t v264 = &v222[v263];
        v265 = &v223[v263];
        if (*((void *)v265 + 1))
        {
          *(void *)uint64_t v264 = *(void *)v265;
          *((void *)v264 + 1) = *((void *)v265 + 1);
          *((void *)v264 + 2) = *((void *)v265 + 2);
          *((void *)v264 + 3) = *((void *)v265 + 3);
          *((void *)v264 + 4) = *((void *)v265 + 4);
          *((void *)v264 + 5) = *((void *)v265 + 5);
          *((void *)v264 + 6) = *((void *)v265 + 6);
          *((void *)v264 + 7) = *((void *)v265 + 7);
          *((void *)v264 + 8) = *((void *)v265 + 8);
          *((void *)v264 + 9) = *((void *)v265 + 9);
          v451 = (uint64_t *)(v265 + 80);
          unint64_t v266 = *((void *)v265 + 11);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v266 >> 60 == 15)
          {
            *((_OWORD *)v264 + 5) = *(_OWORD *)v451;
          }
          else
          {
            uint64_t v325 = *v451;
            sub_247FB6C20(*v451, v266);
            *((void *)v264 + 10) = v325;
            *((void *)v264 + 11) = v266;
          }
        }
        else
        {
          long long v290 = *((_OWORD *)v265 + 1);
          *(_OWORD *)uint64_t v264 = *(_OWORD *)v265;
          *((_OWORD *)v264 + 1) = v290;
          long long v291 = *((_OWORD *)v265 + 2);
          long long v292 = *((_OWORD *)v265 + 3);
          long long v293 = *((_OWORD *)v265 + 5);
          *((_OWORD *)v264 + 4) = *((_OWORD *)v265 + 4);
          *((_OWORD *)v264 + 5) = v293;
          *((_OWORD *)v264 + 2) = v291;
          *((_OWORD *)v264 + 3) = v292;
        }
        *(void *)&v222[v262[6]] = *(void *)&v223[v262[6]];
        *(void *)&v222[v262[7]] = *(void *)&v223[v262[7]];
        v222[v262[8]] = v223[v262[8]];
        v222[v262[9]] = v223[v262[9]];
        uint64_t v326 = v262[10];
        uint64_t v327 = &v222[v326];
        uint64_t v328 = &v223[v326];
        uint64_t v329 = *(void *)&v223[v326 + 8];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v329)
        {
          *(void *)uint64_t v327 = *(void *)v328;
          *((void *)v327 + 1) = *((void *)v328 + 1);
          *((void *)v327 + 2) = *((void *)v328 + 2);
          *((void *)v327 + 3) = *((void *)v328 + 3);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v330 = *((_OWORD *)v328 + 1);
          *(_OWORD *)uint64_t v327 = *(_OWORD *)v328;
          *((_OWORD *)v327 + 1) = v330;
        }
        uint64_t v331 = v262[11];
        uint64_t v332 = &v222[v331];
        uint64_t v333 = &v223[v331];
        *(void *)uint64_t v332 = *(void *)v333;
        *((void *)v332 + 1) = *((void *)v333 + 1);
        uint64_t v334 = v262[12];
        uint64_t v335 = *(void **)&v223[v334];
        *(void *)&v222[v334] = v335;
        uint64_t v336 = v262[13];
        unint64_t v337 = &v222[v336];
        uint64_t v338 = &v223[v336];
        uint64_t v339 = *(void *)v338;
        uint64_t v340 = *((void *)v338 + 1);
        char v341 = v338[16];
        swift_bridgeObjectRetain();
        id v342 = v335;
        sub_247FE42A8(v339, v340, v341);
        *(void *)unint64_t v337 = v339;
        *((void *)v337 + 1) = v340;
        v337[16] = v341;
        uint64_t v343 = v262[14];
        uint64_t v344 = &v222[v343];
        uint64_t v345 = &v223[v343];
        *(void *)uint64_t v344 = *(void *)v345;
        *((void *)v344 + 1) = *((void *)v345 + 1);
        v222[v262[15]] = v223[v262[15]];
        uint64_t v346 = v262[16];
        uint64_t v347 = &v222[v346];
        uint64_t v348 = &v223[v346];
        unint64_t v349 = *(void *)&v223[v346 + 8];
        swift_bridgeObjectRetain();
        if (v349 >= 3)
        {
          *(void *)uint64_t v347 = *(void *)v348;
          *((void *)v347 + 1) = *((void *)v348 + 1);
          *((void *)v347 + 2) = *((void *)v348 + 2);
          *((void *)v347 + 3) = *((void *)v348 + 3);
          v347[32] = v348[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v350 = *(_OWORD *)v348;
          long long v351 = *((_OWORD *)v348 + 1);
          v347[32] = v348[32];
          *(_OWORD *)uint64_t v347 = v350;
          *((_OWORD *)v347 + 1) = v351;
        }
        unsigned int v3 = v453;
        *(void *)&v453[*(int *)(v379 + 36)] = *(void *)((char *)v224 + *(int *)(v379 + 36));
        swift_retain();
        goto LABEL_98;
      case 3u:
        *(void *)unsigned int v3 = *a2;
        *((void *)v3 + 1) = a2[1];
        uint64_t v28 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692D9840) + 32);
        uint64_t v29 = &v3[v28];
        uint64_t v30 = (char *)a2 + v28;
        *uint64_t v29 = *((unsigned char *)a2 + v28);
        uint64_t v31 = *(void *)((char *)a2 + v28 + 8);
        uint64_t v32 = *(void *)((char *)a2 + v28 + 16);
        uint64_t v33 = *(void *)((char *)a2 + v28 + 24);
        uint64_t v34 = *((unsigned __int16 *)v30 + 18);
        uint64_t v35 = *((unsigned int *)v30 + 8);
        sub_247FE4184(*((id *)v30 + 1), *((id *)v30 + 2), *((void *)v30 + 3), v35 | (v34 << 32));
        *((void *)v29 + 1) = v31;
        *((void *)v29 + 2) = v32;
        *((void *)v29 + 3) = v33;
        *((_WORD *)v29 + 18) = v34;
        *((_DWORD *)v29 + 8) = v35;
        unsigned int v36 = v30[88];
        if (v36 <= 0xF9)
        {
          uint64_t v73 = *((void *)v30 + 5);
          uint64_t v74 = *((void *)v30 + 6);
          uint64_t v76 = *((void *)v30 + 7);
          uint64_t v75 = *((void *)v30 + 8);
          uint64_t v77 = *((void *)v30 + 9);
          uint64_t v78 = *((void *)v30 + 10);
          sub_247FA9804(v73, v74, v76, v75, v77, v78, v36);
          *((void *)v29 + 5) = v73;
          *((void *)v29 + 6) = v74;
          *((void *)v29 + 7) = v76;
          *((void *)v29 + 8) = v75;
          *((void *)v29 + 9) = v77;
          *((void *)v29 + 10) = v78;
          v29[88] = v36;
        }
        else
        {
          long long v37 = *(_OWORD *)(v30 + 40);
          long long v38 = *(_OWORD *)(v30 + 56);
          long long v39 = *(_OWORD *)(v30 + 72);
          v29[88] = v30[88];
          *(_OWORD *)(v29 + 56) = v38;
          *(_OWORD *)(v29 + 72) = v39;
          *(_OWORD *)(v29 + 40) = v37;
        }
        v29[96] = v30[96];
        v29[97] = v30[97];
        *((void *)v29 + 13) = *((void *)v30 + 13);
        *((void *)v29 + 14) = *((void *)v30 + 14);
        *((void *)v29 + 15) = *((void *)v30 + 15);
        *((void *)v29 + 16) = *((void *)v30 + 16);
        uint64_t v79 = *((void *)v30 + 17);
        v29[144] = v30[144];
        *((void *)v29 + 17) = v79;
        v29[145] = v30[145];
        *((void *)v29 + 19) = *((void *)v30 + 19);
        *((void *)v29 + 20) = *((void *)v30 + 20);
        uint64_t v80 = *((void *)v30 + 21);
        uint64_t v445 = *((void *)v30 + 22);
        uint64_t v81 = *((void *)v30 + 23);
        uint64_t v82 = *((void *)v30 + 24);
        uint64_t v83 = *((void *)v30 + 25);
        uint64_t v84 = *((void *)v30 + 26);
        unsigned int v85 = v30[216];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247FE41AC(v80, v445, v81, v82, v83, v84, v85);
        *((void *)v29 + 21) = v80;
        *((void *)v29 + 22) = v445;
        *((void *)v29 + 23) = v81;
        *((void *)v29 + 24) = v82;
        *((void *)v29 + 25) = v83;
        *((void *)v29 + 26) = v84;
        v29[216] = v85;
        if (*((void *)v30 + 29))
        {
          *((void *)v29 + 28) = *((void *)v30 + 28);
          *((void *)v29 + 29) = *((void *)v30 + 29);
          *((void *)v29 + 30) = *((void *)v30 + 30);
          *((void *)v29 + 31) = *((void *)v30 + 31);
          swift_bridgeObjectRetain();
          swift_retain();
          swift_retain();
        }
        else
        {
          long long v103 = *((_OWORD *)v30 + 15);
          *((_OWORD *)v29 + 14) = *((_OWORD *)v30 + 14);
          *((_OWORD *)v29 + 15) = v103;
        }
        *((void *)v29 + 32) = *((void *)v30 + 32);
        *((void *)v29 + 33) = *((void *)v30 + 33);
        *((void *)v29 + 34) = *((void *)v30 + 34);
        *((void *)v29 + 35) = *((void *)v30 + 35);
        uint64_t v431 = type metadata accessor for SetupModel();
        uint64_t v104 = *(int *)(v431 + 32);
        uint64_t v105 = &v29[v104];
        uint64_t v106 = &v30[v104];
        uint64_t v107 = (int *)type metadata accessor for IdMSAccount();
        uint64_t v380 = *((void *)v107 - 1);
        long long v108 = *(unsigned int (**)(char *, uint64_t, int *))(v380 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v419 = v108;
        uint64_t v443 = v107;
        uint64_t v448 = v106;
        if (v108(v106, 1, v107))
        {
          uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v105, v106, *(void *)(*(void *)(v109 - 8) + 64));
        }
        else
        {
          *(void *)uint64_t v105 = *(void *)v106;
          *((void *)v105 + 1) = *((void *)v106 + 1);
          *((void *)v105 + 2) = *((void *)v106 + 2);
          *((void *)v105 + 3) = *((void *)v106 + 3);
          *((void *)v105 + 4) = *((void *)v106 + 4);
          *((void *)v105 + 5) = *((void *)v106 + 5);
          *((void *)v105 + 6) = *((void *)v106 + 6);
          *((void *)v105 + 7) = *((void *)v106 + 7);
          *((void *)v105 + 8) = *((void *)v106 + 8);
          *((void *)v105 + 9) = *((void *)v106 + 9);
          uint64_t v143 = v107[5];
          uint64_t v416 = &v105[v143];
          long long v409 = &v106[v143];
          uint64_t v144 = sub_248174700();
          uint64_t v398 = *(void (**)(char *, char *, uint64_t))(*(void *)(v144 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v398(v416, v409, v144);
          uint64_t v145 = v107[6];
          uint64_t v146 = &v105[v145];
          uint64_t v147 = &v106[v145];
          uint64_t v148 = *((void *)v147 + 1);
          uint64_t v149 = *((void *)v147 + 2);
          uint64_t v150 = *((void *)v147 + 3);
          uint64_t v151 = *((void *)v147 + 5);
          uint64_t v394 = *((void *)v147 + 4);
          uint64_t v399 = *(void *)v147;
          uint64_t v152 = *((void *)v147 + 6);
          uint64_t v389 = *((void *)v147 + 7);
          uint64_t v410 = *((void *)v147 + 8);
          LOBYTE(v416) = v147[72];
          sub_247FABF8C(*(void *)v147, v148, v149, v150, v394, v151, v152, v389, v410, (char)v416);
          *(void *)uint64_t v146 = v399;
          *((void *)v146 + 1) = v148;
          *((void *)v146 + 2) = v149;
          *((void *)v146 + 3) = v150;
          *((void *)v146 + 4) = v394;
          *((void *)v146 + 5) = v151;
          uint64_t v106 = v448;
          *((void *)v146 + 6) = v152;
          *((void *)v146 + 7) = v389;
          *((void *)v146 + 8) = v410;
          v146[72] = (char)v416;
          *(void *)&v105[v107[7]] = *(void *)&v448[v107[7]];
          uint64_t v153 = *(void (**)(char *, void, uint64_t, int *))(v380 + 56);
          swift_bridgeObjectRetain();
          v153(v105, 0, 1, v107);
        }
        uint64_t v154 = (int *)type metadata accessor for AuthenticationModel();
        uint64_t v155 = v154[5];
        uint64_t v156 = &v105[v155];
        uint64_t v157 = &v106[v155];
        long long v405 = v29;
        if (*((void *)v157 + 1))
        {
          *(void *)uint64_t v156 = *(void *)v157;
          *((void *)v156 + 1) = *((void *)v157 + 1);
          *((void *)v156 + 2) = *((void *)v157 + 2);
          *((void *)v156 + 3) = *((void *)v157 + 3);
          *((void *)v156 + 4) = *((void *)v157 + 4);
          *((void *)v156 + 5) = *((void *)v157 + 5);
          *((void *)v156 + 6) = *((void *)v157 + 6);
          *((void *)v156 + 7) = *((void *)v157 + 7);
          *((void *)v156 + 8) = *((void *)v157 + 8);
          *((void *)v156 + 9) = *((void *)v157 + 9);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          *(_OWORD *)uint64_t v156 = *(_OWORD *)v157;
          long long v197 = *((_OWORD *)v157 + 1);
          long long v198 = *((_OWORD *)v157 + 2);
          long long v199 = *((_OWORD *)v157 + 4);
          *((_OWORD *)v156 + 3) = *((_OWORD *)v157 + 3);
          *((_OWORD *)v156 + 4) = v199;
          *((_OWORD *)v156 + 1) = v197;
          *((_OWORD *)v156 + 2) = v198;
        }
        v105[v154[6]] = v106[v154[6]];
        uint64_t v200 = v154[7];
        uint64_t v201 = &v105[v200];
        uint64_t v202 = &v106[v200];
        *(void *)uint64_t v201 = *(void *)v202;
        *((void *)v201 + 1) = *((void *)v202 + 1);
        *(void *)&v105[v154[8]] = *(void *)&v106[v154[8]];
        v105[v154[9]] = v106[v154[9]];
        uint64_t v203 = v154[10];
        uint64_t v204 = &v105[v203];
        uint64_t v205 = &v106[v203];
        uint64_t v206 = (void *)*((void *)v205 + 1);
        long long v207 = (void *)*((void *)v205 + 2);
        uint64_t v413 = v154;
        uint64_t v418 = v105;
        uint64_t v209 = (void *)*((void *)v205 + 4);
        long long v208 = (void *)*((void *)v205 + 5);
        uint64_t v396 = *((void *)v205 + 6);
        v402 = *(void **)v205;
        uint64_t v210 = (void *)*((void *)v205 + 8);
        uint64_t v387 = (void *)*((void *)v205 + 7);
        uint64_t v391 = (void *)*((void *)v205 + 3);
        uint64_t v211 = (void *)*((void *)v205 + 9);
        char v212 = v205[80];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247F986A0(v402, v206, v207, v391, v209, v208, v396, v387, v210, v211, v212);
        *(void *)uint64_t v204 = v402;
        *((void *)v204 + 1) = v206;
        *((void *)v204 + 2) = v207;
        *((void *)v204 + 3) = v391;
        *((void *)v204 + 4) = v209;
        *((void *)v204 + 5) = v208;
        *((void *)v204 + 6) = v396;
        *((void *)v204 + 7) = v387;
        *((void *)v204 + 8) = v210;
        *((void *)v204 + 9) = v211;
        v204[80] = v212;
        uint64_t v213 = v413[11];
        uint64_t v214 = (void *)((char *)v418 + v213);
        v215 = &v448[v213];
        if (*(void *)v215)
        {
          uint64_t v216 = *((void *)v215 + 1);
          *uint64_t v214 = *(void *)v215;
          v214[1] = v216;
          swift_retain();
        }
        else
        {
          *(_OWORD *)uint64_t v214 = *(_OWORD *)v215;
        }
        uint64_t v226 = *(int *)(v431 + 36);
        uint64_t v227 = &v405[v226];
        long long v228 = &v30[v226];
        if (v419(&v30[v226], 1, v443))
        {
          uint64_t v229 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v227, v228, *(void *)(*(void *)(v229 - 8) + 64));
        }
        else
        {
          *(void *)uint64_t v227 = *(void *)v228;
          *((void *)v227 + 1) = *((void *)v228 + 1);
          *((void *)v227 + 2) = *((void *)v228 + 2);
          *((void *)v227 + 3) = *((void *)v228 + 3);
          *((void *)v227 + 4) = *((void *)v228 + 4);
          *((void *)v227 + 5) = *((void *)v228 + 5);
          *((void *)v227 + 6) = *((void *)v228 + 6);
          *((void *)v227 + 7) = *((void *)v228 + 7);
          *((void *)v227 + 8) = *((void *)v228 + 8);
          *((void *)v227 + 9) = *((void *)v228 + 9);
          uint64_t v267 = v443[5];
          uint64_t v452 = &v227[v267];
          uint64_t v438 = &v228[v267];
          uint64_t v268 = sub_248174700();
          uint64_t v428 = *(void (**)(char *, char *, uint64_t))(*(void *)(v268 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v428(v452, v438, v268);
          uint64_t v269 = v443[6];
          v270 = &v227[v269];
          uint64_t v271 = &v228[v269];
          uint64_t v272 = *((void *)v271 + 1);
          uint64_t v273 = *((void *)v271 + 2);
          uint64_t v274 = *((void *)v271 + 3);
          uint64_t v275 = *((void *)v271 + 4);
          uint64_t v276 = *((void *)v271 + 5);
          uint64_t v277 = *((void *)v271 + 6);
          uint64_t v278 = *((void *)v271 + 7);
          uint64_t v429 = *(void *)v271;
          uint64_t v439 = *((void *)v271 + 8);
          LOBYTE(v452) = v271[72];
          sub_247FABF8C(*(void *)v271, v272, v273, v274, v275, v276, v277, v278, v439, (char)v452);
          *(void *)v270 = v429;
          *((void *)v270 + 1) = v272;
          *((void *)v270 + 2) = v273;
          *((void *)v270 + 3) = v274;
          *((void *)v270 + 4) = v275;
          *((void *)v270 + 5) = v276;
          *((void *)v270 + 6) = v277;
          *((void *)v270 + 7) = v278;
          *((void *)v270 + 8) = v439;
          v270[72] = (char)v452;
          *(void *)&v227[v443[7]] = *(void *)&v228[v443[7]];
          uint64_t v279 = *(void (**)(char *, void, uint64_t, int *))(v380 + 56);
          swift_bridgeObjectRetain();
          v279(v227, 0, 1, v443);
        }
        uint64_t v280 = (int *)type metadata accessor for SignInModel();
        uint64_t v281 = v280[5];
        uint64_t v282 = &v227[v281];
        uint64_t v283 = &v228[v281];
        if (*((void *)v283 + 1))
        {
          *(void *)uint64_t v282 = *(void *)v283;
          *((void *)v282 + 1) = *((void *)v283 + 1);
          *((void *)v282 + 2) = *((void *)v283 + 2);
          *((void *)v282 + 3) = *((void *)v283 + 3);
          *((void *)v282 + 4) = *((void *)v283 + 4);
          *((void *)v282 + 5) = *((void *)v283 + 5);
          *((void *)v282 + 6) = *((void *)v283 + 6);
          *((void *)v282 + 7) = *((void *)v283 + 7);
          *((void *)v282 + 8) = *((void *)v283 + 8);
          *((void *)v282 + 9) = *((void *)v283 + 9);
          uint64_t v284 = (uint64_t *)(v283 + 80);
          unint64_t v285 = *((void *)v283 + 11);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v285 >> 60 == 15)
          {
            *((_OWORD *)v282 + 5) = *(_OWORD *)v284;
          }
          else
          {
            uint64_t v352 = *v284;
            sub_247FB6C20(*v284, v285);
            *((void *)v282 + 10) = v352;
            *((void *)v282 + 11) = v285;
          }
        }
        else
        {
          long long v294 = *((_OWORD *)v283 + 1);
          *(_OWORD *)uint64_t v282 = *(_OWORD *)v283;
          *((_OWORD *)v282 + 1) = v294;
          long long v295 = *((_OWORD *)v283 + 2);
          long long v296 = *((_OWORD *)v283 + 3);
          long long v297 = *((_OWORD *)v283 + 5);
          *((_OWORD *)v282 + 4) = *((_OWORD *)v283 + 4);
          *((_OWORD *)v282 + 5) = v297;
          *((_OWORD *)v282 + 2) = v295;
          *((_OWORD *)v282 + 3) = v296;
        }
        *(void *)&v227[v280[6]] = *(void *)&v228[v280[6]];
        *(void *)&v227[v280[7]] = *(void *)&v228[v280[7]];
        v227[v280[8]] = v228[v280[8]];
        v227[v280[9]] = v228[v280[9]];
        uint64_t v353 = v280[10];
        uint64_t v354 = &v227[v353];
        uint64_t v355 = &v228[v353];
        uint64_t v356 = *(void *)&v228[v353 + 8];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unsigned int v3 = v453;
        if (v356)
        {
          *(void *)uint64_t v354 = *(void *)v355;
          *((void *)v354 + 1) = *((void *)v355 + 1);
          *((void *)v354 + 2) = *((void *)v355 + 2);
          *((void *)v354 + 3) = *((void *)v355 + 3);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v357 = *((_OWORD *)v355 + 1);
          *(_OWORD *)uint64_t v354 = *(_OWORD *)v355;
          *((_OWORD *)v354 + 1) = v357;
        }
        uint64_t v358 = v280[11];
        v359 = &v227[v358];
        uint64_t v360 = &v228[v358];
        *(void *)v359 = *(void *)v360;
        *((void *)v359 + 1) = *((void *)v360 + 1);
        uint64_t v361 = v280[12];
        uint64_t v362 = *(void **)&v228[v361];
        *(void *)&v227[v361] = v362;
        uint64_t v363 = v280[13];
        uint64_t v364 = &v227[v363];
        uint64_t v365 = &v228[v363];
        uint64_t v366 = *(void *)v365;
        uint64_t v367 = *((void *)v365 + 1);
        char v368 = v365[16];
        swift_bridgeObjectRetain();
        id v369 = v362;
        sub_247FE42A8(v366, v367, v368);
        *(void *)uint64_t v364 = v366;
        *((void *)v364 + 1) = v367;
        v364[16] = v368;
        uint64_t v370 = v280[14];
        long long v371 = &v227[v370];
        long long v372 = &v228[v370];
        *(void *)long long v371 = *(void *)v372;
        *((void *)v371 + 1) = *((void *)v372 + 1);
        v227[v280[15]] = v228[v280[15]];
        uint64_t v373 = v280[16];
        uint64_t v320 = &v227[v373];
        uint64_t v321 = &v228[v373];
        unint64_t v374 = *(void *)&v228[v373 + 8];
        swift_bridgeObjectRetain();
        if (v374 >= 3)
        {
LABEL_97:
          *(void *)uint64_t v320 = *(void *)v321;
          *((void *)v320 + 1) = *((void *)v321 + 1);
          *((void *)v320 + 2) = *((void *)v321 + 2);
          *((void *)v320 + 3) = *((void *)v321 + 3);
          v320[32] = v321[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v375 = *(_OWORD *)v321;
          long long v376 = *((_OWORD *)v321 + 1);
          v320[32] = v321[32];
          *(_OWORD *)uint64_t v320 = v375;
          *((_OWORD *)v320 + 1) = v376;
        }
        goto LABEL_98;
      case 4u:
        uint64_t v40 = *a2;
        uint64_t v41 = a2[1];
        uint64_t v42 = a2[2];
        uint64_t v43 = a2[3];
        uint64_t v44 = a2[4];
        uint64_t v45 = a2[5];
        char v46 = *((unsigned char *)a2 + 48);
        sub_247FA9804(v40, v41, v42, v43, v44, v45, v46);
        *(void *)unsigned int v3 = v40;
        *((void *)v3 + 1) = v41;
        *((void *)v3 + 2) = v42;
        *((void *)v3 + 3) = v43;
        *((void *)v3 + 4) = v44;
        *((void *)v3 + 5) = v45;
        v3[48] = v46;
LABEL_98:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v3, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return v3;
}

char *initializeWithTake for MachSetupMessage(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692D9840) + 32);
      long long v25 = &a1[v24];
      long long v26 = &a2[v24];
      *long long v25 = a2[v24];
      *(_OWORD *)(v25 + 22) = *(_OWORD *)&a2[v24 + 22];
      *(_OWORD *)(v25 + 8) = *(_OWORD *)&a2[v24 + 8];
      v25[88] = a2[v24 + 88];
      *(_OWORD *)(v25 + 72) = *(_OWORD *)&a2[v24 + 72];
      *(_OWORD *)(v25 + 56) = *(_OWORD *)&a2[v24 + 56];
      *(_OWORD *)(v25 + 40) = *(_OWORD *)&a2[v24 + 40];
      long long v27 = *(_OWORD *)&a2[v24 + 96];
      long long v28 = *(_OWORD *)&a2[v24 + 112];
      long long v29 = *(_OWORD *)&a2[v24 + 144];
      *((_OWORD *)v25 + 8) = *(_OWORD *)&a2[v24 + 128];
      *((_OWORD *)v25 + 9) = v29;
      *((_OWORD *)v25 + 6) = v27;
      *((_OWORD *)v25 + 7) = v28;
      long long v30 = *(_OWORD *)&a2[v24 + 160];
      long long v31 = *(_OWORD *)&a2[v24 + 176];
      long long v32 = *(_OWORD *)&a2[v24 + 208];
      *((_OWORD *)v25 + 12) = *(_OWORD *)&a2[v24 + 192];
      *((_OWORD *)v25 + 13) = v32;
      *((_OWORD *)v25 + 10) = v30;
      *((_OWORD *)v25 + 11) = v31;
      long long v33 = *(_OWORD *)&a2[v24 + 224];
      long long v34 = *(_OWORD *)&a2[v24 + 240];
      long long v35 = *(_OWORD *)&a2[v24 + 272];
      *((_OWORD *)v25 + 16) = *(_OWORD *)&a2[v24 + 256];
      *((_OWORD *)v25 + 17) = v35;
      *((_OWORD *)v25 + 14) = v33;
      *((_OWORD *)v25 + 15) = v34;
      uint64_t v36 = type metadata accessor for SetupModel();
      uint64_t v37 = *(int *)(v36 + 32);
      long long v38 = &v25[v37];
      long long v39 = &v26[v37];
      uint64_t v40 = (int *)type metadata accessor for IdMSAccount();
      uint64_t v41 = *((void *)v40 - 1);
      uint64_t v258 = *(unsigned int (**)(char *, uint64_t, int *))(v41 + 48);
      if (v258(v39, 1, v40))
      {
        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v38, v39, *(void *)(*(void *)(v42 - 8) + 64));
      }
      else
      {
        long long v92 = *((_OWORD *)v39 + 3);
        *((_OWORD *)v38 + 2) = *((_OWORD *)v39 + 2);
        *((_OWORD *)v38 + 3) = v92;
        *((_OWORD *)v38 + 4) = *((_OWORD *)v39 + 4);
        long long v93 = *((_OWORD *)v39 + 1);
        *(_OWORD *)long long v38 = *(_OWORD *)v39;
        *((_OWORD *)v38 + 1) = v93;
        uint64_t v94 = v40[5];
        uint64_t v257 = v41;
        uint64_t v95 = &v38[v94];
        long long v96 = &v39[v94];
        uint64_t v97 = sub_248174700();
        long long v98 = v95;
        uint64_t v41 = v257;
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v97 - 8) + 32))(v98, v96, v97);
        uint64_t v99 = v40[6];
        uint64_t v100 = &v38[v99];
        uint64_t v101 = &v39[v99];
        long long v102 = *((_OWORD *)v101 + 3);
        *((_OWORD *)v100 + 2) = *((_OWORD *)v101 + 2);
        *((_OWORD *)v100 + 3) = v102;
        *(_OWORD *)(v100 + 57) = *(_OWORD *)(v101 + 57);
        long long v103 = *((_OWORD *)v101 + 1);
        *(_OWORD *)uint64_t v100 = *(_OWORD *)v101;
        *((_OWORD *)v100 + 1) = v103;
        *(void *)&v38[v40[7]] = *(void *)&v39[v40[7]];
        (*(void (**)(char *, void, uint64_t, int *))(v257 + 56))(v38, 0, 1, v40);
      }
      uint64_t v104 = (int *)type metadata accessor for AuthenticationModel();
      uint64_t v105 = v104[5];
      uint64_t v106 = &v38[v105];
      uint64_t v107 = &v39[v105];
      long long v108 = *((_OWORD *)v107 + 3);
      *((_OWORD *)v106 + 2) = *((_OWORD *)v107 + 2);
      *((_OWORD *)v106 + 3) = v108;
      *((_OWORD *)v106 + 4) = *((_OWORD *)v107 + 4);
      long long v109 = *((_OWORD *)v107 + 1);
      *(_OWORD *)uint64_t v106 = *(_OWORD *)v107;
      *((_OWORD *)v106 + 1) = v109;
      v38[v104[6]] = v39[v104[6]];
      *(_OWORD *)&v38[v104[7]] = *(_OWORD *)&v39[v104[7]];
      *(void *)&v38[v104[8]] = *(void *)&v39[v104[8]];
      v38[v104[9]] = v39[v104[9]];
      uint64_t v110 = v104[10];
      uint64_t v111 = &v38[v110];
      long long v112 = &v39[v110];
      long long v113 = *((_OWORD *)v112 + 1);
      *(_OWORD *)uint64_t v111 = *(_OWORD *)v112;
      *((_OWORD *)v111 + 1) = v113;
      v111[80] = v112[80];
      long long v114 = *((_OWORD *)v112 + 4);
      long long v115 = *((_OWORD *)v112 + 2);
      *((_OWORD *)v111 + 3) = *((_OWORD *)v112 + 3);
      *((_OWORD *)v111 + 4) = v114;
      *((_OWORD *)v111 + 2) = v115;
      uint64_t v116 = v104[11];
      uint64_t v117 = &v38[v116];
      uint64_t v118 = &v39[v116];
      uint64_t v119 = *(void *)v118;
      if (*(void *)v118)
      {
        uint64_t v120 = *((void *)v118 + 1);
        *(void *)uint64_t v117 = v119;
        *((void *)v117 + 1) = v120;
      }
      else
      {
        *(_OWORD *)uint64_t v117 = *(_OWORD *)v118;
      }
      uint64_t v155 = *(int *)(v36 + 36);
      uint64_t v156 = &v25[v155];
      uint64_t v157 = &v26[v155];
      if (v258(&v26[v155], 1, v40))
      {
        uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v156, v157, *(void *)(*(void *)(v158 - 8) + 64));
      }
      else
      {
        long long v192 = *((_OWORD *)v157 + 3);
        *((_OWORD *)v156 + 2) = *((_OWORD *)v157 + 2);
        *((_OWORD *)v156 + 3) = v192;
        *((_OWORD *)v156 + 4) = *((_OWORD *)v157 + 4);
        long long v193 = *((_OWORD *)v157 + 1);
        *(_OWORD *)uint64_t v156 = *(_OWORD *)v157;
        *((_OWORD *)v156 + 1) = v193;
        uint64_t v194 = v40[5];
        uint64_t v195 = &v156[v194];
        uint64_t v196 = v41;
        long long v197 = &v157[v194];
        uint64_t v198 = sub_248174700();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v198 - 8) + 32))(v195, v197, v198);
        uint64_t v199 = v40[6];
        uint64_t v200 = &v156[v199];
        uint64_t v201 = &v157[v199];
        long long v202 = *((_OWORD *)v201 + 3);
        *((_OWORD *)v200 + 2) = *((_OWORD *)v201 + 2);
        *((_OWORD *)v200 + 3) = v202;
        *(_OWORD *)(v200 + 57) = *(_OWORD *)(v201 + 57);
        long long v203 = *((_OWORD *)v201 + 1);
        *(_OWORD *)uint64_t v200 = *(_OWORD *)v201;
        *((_OWORD *)v200 + 1) = v203;
        *(void *)&v156[v40[7]] = *(void *)&v157[v40[7]];
        (*(void (**)(char *, void, uint64_t, int *))(v196 + 56))(v156, 0, 1, v40);
      }
      uint64_t v204 = (int *)type metadata accessor for SignInModel();
      uint64_t v205 = v204[5];
      uint64_t v206 = &v156[v205];
      long long v207 = &v157[v205];
      long long v208 = *((_OWORD *)v207 + 3);
      *((_OWORD *)v206 + 2) = *((_OWORD *)v207 + 2);
      *((_OWORD *)v206 + 3) = v208;
      long long v209 = *((_OWORD *)v207 + 5);
      *((_OWORD *)v206 + 4) = *((_OWORD *)v207 + 4);
      *((_OWORD *)v206 + 5) = v209;
      long long v210 = *((_OWORD *)v207 + 1);
      *(_OWORD *)uint64_t v206 = *(_OWORD *)v207;
      *((_OWORD *)v206 + 1) = v210;
      *(void *)&v156[v204[6]] = *(void *)&v157[v204[6]];
      *(void *)&v156[v204[7]] = *(void *)&v157[v204[7]];
      v156[v204[8]] = v157[v204[8]];
      v156[v204[9]] = v157[v204[9]];
      uint64_t v211 = v204[10];
      char v212 = &v156[v211];
      uint64_t v213 = &v157[v211];
      long long v214 = *((_OWORD *)v213 + 1);
      *(_OWORD *)char v212 = *(_OWORD *)v213;
      *((_OWORD *)v212 + 1) = v214;
      *(_OWORD *)&v156[v204[11]] = *(_OWORD *)&v157[v204[11]];
      *(void *)&v156[v204[12]] = *(void *)&v157[v204[12]];
      uint64_t v215 = v204[13];
      uint64_t v216 = &v156[v215];
      uint64_t v217 = &v157[v215];
      v216[16] = v217[16];
      *(_OWORD *)uint64_t v216 = *(_OWORD *)v217;
      *(_OWORD *)&v156[v204[14]] = *(_OWORD *)&v157[v204[14]];
      v156[v204[15]] = v157[v204[15]];
      uint64_t v218 = v204[16];
      v219 = &v156[v218];
      uint64_t v220 = &v157[v218];
      long long v221 = *((_OWORD *)v220 + 1);
      *(_OWORD *)v219 = *(_OWORD *)v220;
      *((_OWORD *)v219 + 1) = v221;
      v219[32] = v220[32];
      goto LABEL_35;
    case 2:
      *(void *)a1 = *(void *)a2;
      a1[8] = a2[8];
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
      uint64_t v44 = *(int *)(v43 + 32);
      uint64_t v45 = &a1[v44];
      char v46 = &a2[v44];
      *uint64_t v45 = a2[v44];
      *(_OWORD *)(v45 + 22) = *(_OWORD *)&a2[v44 + 22];
      *(_OWORD *)(v45 + 8) = *(_OWORD *)&a2[v44 + 8];
      v45[88] = a2[v44 + 88];
      *(_OWORD *)(v45 + 72) = *(_OWORD *)&a2[v44 + 72];
      *(_OWORD *)(v45 + 56) = *(_OWORD *)&a2[v44 + 56];
      *(_OWORD *)(v45 + 40) = *(_OWORD *)&a2[v44 + 40];
      long long v47 = *(_OWORD *)&a2[v44 + 96];
      long long v48 = *(_OWORD *)&a2[v44 + 112];
      long long v49 = *(_OWORD *)&a2[v44 + 144];
      *((_OWORD *)v45 + 8) = *(_OWORD *)&a2[v44 + 128];
      *((_OWORD *)v45 + 9) = v49;
      *((_OWORD *)v45 + 6) = v47;
      *((_OWORD *)v45 + 7) = v48;
      long long v50 = *(_OWORD *)&a2[v44 + 160];
      long long v51 = *(_OWORD *)&a2[v44 + 176];
      long long v52 = *(_OWORD *)&a2[v44 + 208];
      *((_OWORD *)v45 + 12) = *(_OWORD *)&a2[v44 + 192];
      *((_OWORD *)v45 + 13) = v52;
      *((_OWORD *)v45 + 10) = v50;
      *((_OWORD *)v45 + 11) = v51;
      long long v53 = *(_OWORD *)&a2[v44 + 224];
      long long v54 = *(_OWORD *)&a2[v44 + 240];
      long long v55 = *(_OWORD *)&a2[v44 + 272];
      *((_OWORD *)v45 + 16) = *(_OWORD *)&a2[v44 + 256];
      *((_OWORD *)v45 + 17) = v55;
      *((_OWORD *)v45 + 14) = v53;
      *((_OWORD *)v45 + 15) = v54;
      uint64_t v56 = type metadata accessor for SetupModel();
      uint64_t v57 = *(int *)(v56 + 32);
      uint64_t v58 = &v45[v57];
      uint64_t v59 = &v46[v57];
      unsigned int v60 = (int *)type metadata accessor for IdMSAccount();
      uint64_t v254 = *((void *)v60 - 1);
      uint64_t v255 = *(unsigned int (**)(char *, uint64_t, int *))(v254 + 48);
      if (v255(v59, 1, v60))
      {
        uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v58, v59, *(void *)(*(void *)(v61 - 8) + 64));
      }
      else
      {
        long long v121 = *((_OWORD *)v59 + 3);
        *((_OWORD *)v58 + 2) = *((_OWORD *)v59 + 2);
        *((_OWORD *)v58 + 3) = v121;
        *((_OWORD *)v58 + 4) = *((_OWORD *)v59 + 4);
        long long v122 = *((_OWORD *)v59 + 1);
        *(_OWORD *)uint64_t v58 = *(_OWORD *)v59;
        *((_OWORD *)v58 + 1) = v122;
        uint64_t v123 = v60[5];
        uint64_t v252 = v56;
        uint64_t v253 = v43;
        uint64_t v124 = &v58[v123];
        uint64_t v125 = &v59[v123];
        uint64_t v126 = sub_248174700();
        uint64_t v127 = v124;
        uint64_t v128 = v125;
        uint64_t v56 = v252;
        uint64_t v43 = v253;
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v126 - 8) + 32))(v127, v128, v126);
        uint64_t v129 = v60[6];
        uint64_t v130 = &v58[v129];
        uint64_t v131 = &v59[v129];
        long long v132 = *((_OWORD *)v131 + 3);
        *((_OWORD *)v130 + 2) = *((_OWORD *)v131 + 2);
        *((_OWORD *)v130 + 3) = v132;
        *(_OWORD *)(v130 + 57) = *(_OWORD *)(v131 + 57);
        long long v133 = *((_OWORD *)v131 + 1);
        *(_OWORD *)uint64_t v130 = *(_OWORD *)v131;
        *((_OWORD *)v130 + 1) = v133;
        *(void *)&v58[v60[7]] = *(void *)&v59[v60[7]];
        (*(void (**)(char *, void, uint64_t, int *))(v254 + 56))(v58, 0, 1, v60);
      }
      uint64_t v134 = (int *)type metadata accessor for AuthenticationModel();
      uint64_t v135 = v134[5];
      uint64_t v136 = &v58[v135];
      uint64_t v137 = &v59[v135];
      long long v138 = *((_OWORD *)v137 + 3);
      *((_OWORD *)v136 + 2) = *((_OWORD *)v137 + 2);
      *((_OWORD *)v136 + 3) = v138;
      *((_OWORD *)v136 + 4) = *((_OWORD *)v137 + 4);
      long long v139 = *((_OWORD *)v137 + 1);
      *(_OWORD *)uint64_t v136 = *(_OWORD *)v137;
      *((_OWORD *)v136 + 1) = v139;
      v58[v134[6]] = v59[v134[6]];
      *(_OWORD *)&v58[v134[7]] = *(_OWORD *)&v59[v134[7]];
      *(void *)&v58[v134[8]] = *(void *)&v59[v134[8]];
      v58[v134[9]] = v59[v134[9]];
      uint64_t v140 = v134[10];
      uint64_t v141 = &v58[v140];
      uint64_t v142 = &v59[v140];
      long long v143 = *((_OWORD *)v142 + 1);
      *(_OWORD *)uint64_t v141 = *(_OWORD *)v142;
      *((_OWORD *)v141 + 1) = v143;
      v141[80] = v142[80];
      long long v144 = *((_OWORD *)v142 + 4);
      long long v145 = *((_OWORD *)v142 + 2);
      *((_OWORD *)v141 + 3) = *((_OWORD *)v142 + 3);
      *((_OWORD *)v141 + 4) = v144;
      *((_OWORD *)v141 + 2) = v145;
      uint64_t v146 = v134[11];
      uint64_t v147 = &v58[v146];
      uint64_t v148 = &v59[v146];
      uint64_t v149 = *(void *)v148;
      if (*(void *)v148)
      {
        uint64_t v150 = *((void *)v148 + 1);
        *(void *)uint64_t v147 = v149;
        *((void *)v147 + 1) = v150;
      }
      else
      {
        *(_OWORD *)uint64_t v147 = *(_OWORD *)v148;
      }
      uint64_t v159 = *(int *)(v56 + 36);
      long long v160 = &v45[v159];
      uint64_t v161 = &v46[v159];
      if (v255(&v46[v159], 1, v60))
      {
        uint64_t v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v160, v161, *(void *)(*(void *)(v162 - 8) + 64));
      }
      else
      {
        long long v222 = *((_OWORD *)v161 + 3);
        *((_OWORD *)v160 + 2) = *((_OWORD *)v161 + 2);
        *((_OWORD *)v160 + 3) = v222;
        *((_OWORD *)v160 + 4) = *((_OWORD *)v161 + 4);
        long long v223 = *((_OWORD *)v161 + 1);
        *(_OWORD *)long long v160 = *(_OWORD *)v161;
        *((_OWORD *)v160 + 1) = v223;
        uint64_t v224 = v60[5];
        uint64_t v225 = &v160[v224];
        uint64_t v226 = &v161[v224];
        uint64_t v227 = sub_248174700();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v227 - 8) + 32))(v225, v226, v227);
        uint64_t v228 = v60[6];
        uint64_t v229 = &v160[v228];
        uint64_t v230 = &v161[v228];
        long long v231 = *((_OWORD *)v230 + 3);
        *((_OWORD *)v229 + 2) = *((_OWORD *)v230 + 2);
        *((_OWORD *)v229 + 3) = v231;
        *(_OWORD *)(v229 + 57) = *(_OWORD *)(v230 + 57);
        long long v232 = *((_OWORD *)v230 + 1);
        *(_OWORD *)uint64_t v229 = *(_OWORD *)v230;
        *((_OWORD *)v229 + 1) = v232;
        *(void *)&v160[v60[7]] = *(void *)&v161[v60[7]];
        (*(void (**)(char *, void, uint64_t, int *))(v254 + 56))(v160, 0, 1, v60);
      }
      uint64_t v233 = (int *)type metadata accessor for SignInModel();
      uint64_t v234 = v233[5];
      uint64_t v235 = &v160[v234];
      uint64_t v236 = &v161[v234];
      long long v237 = *((_OWORD *)v236 + 3);
      *((_OWORD *)v235 + 2) = *((_OWORD *)v236 + 2);
      *((_OWORD *)v235 + 3) = v237;
      long long v238 = *((_OWORD *)v236 + 5);
      *((_OWORD *)v235 + 4) = *((_OWORD *)v236 + 4);
      *((_OWORD *)v235 + 5) = v238;
      long long v239 = *((_OWORD *)v236 + 1);
      *(_OWORD *)uint64_t v235 = *(_OWORD *)v236;
      *((_OWORD *)v235 + 1) = v239;
      *(void *)&v160[v233[6]] = *(void *)&v161[v233[6]];
      *(void *)&v160[v233[7]] = *(void *)&v161[v233[7]];
      v160[v233[8]] = v161[v233[8]];
      v160[v233[9]] = v161[v233[9]];
      uint64_t v240 = v233[10];
      uint64_t v241 = &v160[v240];
      v242 = &v161[v240];
      long long v243 = *((_OWORD *)v242 + 1);
      *(_OWORD *)uint64_t v241 = *(_OWORD *)v242;
      *((_OWORD *)v241 + 1) = v243;
      *(_OWORD *)&v160[v233[11]] = *(_OWORD *)&v161[v233[11]];
      *(void *)&v160[v233[12]] = *(void *)&v161[v233[12]];
      uint64_t v244 = v233[13];
      v245 = &v160[v244];
      v246 = &v161[v244];
      v245[16] = v246[16];
      *(_OWORD *)v245 = *(_OWORD *)v246;
      *(_OWORD *)&v160[v233[14]] = *(_OWORD *)&v161[v233[14]];
      v160[v233[15]] = v161[v233[15]];
      uint64_t v247 = v233[16];
      unint64_t v248 = &v160[v247];
      uint64_t v249 = &v161[v247];
      long long v250 = *((_OWORD *)v249 + 1);
      *(_OWORD *)unint64_t v248 = *(_OWORD *)v249;
      *((_OWORD *)v248 + 1) = v250;
      v248[32] = v249[32];
      *(void *)&a1[*(int *)(v43 + 36)] = *(void *)&a2[*(int *)(v43 + 36)];
      goto LABEL_35;
    case 0:
      *a1 = *a2;
      *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a1 + 22) = *(_OWORD *)(a2 + 22);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      a1[88] = a2[88];
      long long v7 = *((_OWORD *)a2 + 6);
      long long v8 = *((_OWORD *)a2 + 7);
      long long v9 = *((_OWORD *)a2 + 9);
      *((_OWORD *)a1 + 8) = *((_OWORD *)a2 + 8);
      *((_OWORD *)a1 + 9) = v9;
      *((_OWORD *)a1 + 6) = v7;
      *((_OWORD *)a1 + 7) = v8;
      long long v10 = *((_OWORD *)a2 + 10);
      long long v11 = *((_OWORD *)a2 + 11);
      long long v12 = *((_OWORD *)a2 + 13);
      *((_OWORD *)a1 + 12) = *((_OWORD *)a2 + 12);
      *((_OWORD *)a1 + 13) = v12;
      *((_OWORD *)a1 + 10) = v10;
      *((_OWORD *)a1 + 11) = v11;
      long long v13 = *((_OWORD *)a2 + 14);
      long long v14 = *((_OWORD *)a2 + 15);
      long long v15 = *((_OWORD *)a2 + 17);
      *((_OWORD *)a1 + 16) = *((_OWORD *)a2 + 16);
      *((_OWORD *)a1 + 17) = v15;
      *((_OWORD *)a1 + 14) = v13;
      *((_OWORD *)a1 + 15) = v14;
      uint64_t v16 = type metadata accessor for SetupModel();
      uint64_t v17 = *(int *)(v16 + 32);
      uint64_t v18 = &a1[v17];
      unint64_t v19 = &a2[v17];
      uint64_t v20 = (int *)type metadata accessor for IdMSAccount();
      uint64_t v21 = *((void *)v20 - 1);
      uint64_t v22 = *(unsigned int (**)(void, void, void))(v21 + 48);
      if (v22(v19, 1, v20))
      {
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
      }
      else
      {
        long long v62 = *((_OWORD *)v19 + 3);
        *((_OWORD *)v18 + 2) = *((_OWORD *)v19 + 2);
        *((_OWORD *)v18 + 3) = v62;
        *((_OWORD *)v18 + 4) = *((_OWORD *)v19 + 4);
        long long v63 = *((_OWORD *)v19 + 1);
        *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
        *((_OWORD *)v18 + 1) = v63;
        uint64_t v64 = v20[5];
        uint64_t v256 = v22;
        uint64_t v65 = &v18[v64];
        uint64_t v66 = v21;
        uint64_t v67 = &v19[v64];
        uint64_t v68 = sub_248174700();
        uint64_t v69 = v67;
        uint64_t v21 = v66;
        uint64_t v22 = v256;
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 32))(v65, v69, v68);
        uint64_t v70 = v20[6];
        uint64_t v71 = &v18[v70];
        uint64_t v72 = &v19[v70];
        long long v73 = *((_OWORD *)v72 + 3);
        *((_OWORD *)v71 + 2) = *((_OWORD *)v72 + 2);
        *((_OWORD *)v71 + 3) = v73;
        *(_OWORD *)(v71 + 57) = *(_OWORD *)(v72 + 57);
        long long v74 = *((_OWORD *)v72 + 1);
        *(_OWORD *)uint64_t v71 = *(_OWORD *)v72;
        *((_OWORD *)v71 + 1) = v74;
        *(void *)&v18[v20[7]] = *(void *)&v19[v20[7]];
        (*(void (**)(char *, void, uint64_t, int *))(v21 + 56))(v18, 0, 1, v20);
      }
      uint64_t v75 = (int *)type metadata accessor for AuthenticationModel();
      uint64_t v76 = v75[5];
      uint64_t v77 = &v18[v76];
      uint64_t v78 = &v19[v76];
      long long v79 = *((_OWORD *)v78 + 3);
      *((_OWORD *)v77 + 2) = *((_OWORD *)v78 + 2);
      *((_OWORD *)v77 + 3) = v79;
      *((_OWORD *)v77 + 4) = *((_OWORD *)v78 + 4);
      long long v80 = *((_OWORD *)v78 + 1);
      *(_OWORD *)uint64_t v77 = *(_OWORD *)v78;
      *((_OWORD *)v77 + 1) = v80;
      v18[v75[6]] = v19[v75[6]];
      *(_OWORD *)&v18[v75[7]] = *(_OWORD *)&v19[v75[7]];
      *(void *)&v18[v75[8]] = *(void *)&v19[v75[8]];
      v18[v75[9]] = v19[v75[9]];
      uint64_t v81 = v75[10];
      uint64_t v82 = &v18[v81];
      uint64_t v83 = &v19[v81];
      long long v84 = *((_OWORD *)v83 + 1);
      *(_OWORD *)uint64_t v82 = *(_OWORD *)v83;
      *((_OWORD *)v82 + 1) = v84;
      v82[80] = v83[80];
      long long v85 = *((_OWORD *)v83 + 4);
      long long v86 = *((_OWORD *)v83 + 2);
      *((_OWORD *)v82 + 3) = *((_OWORD *)v83 + 3);
      *((_OWORD *)v82 + 4) = v85;
      *((_OWORD *)v82 + 2) = v86;
      uint64_t v87 = v75[11];
      uint64_t v88 = &v18[v87];
      uint64_t v89 = &v19[v87];
      uint64_t v90 = *(void *)v89;
      if (*(void *)v89)
      {
        uint64_t v91 = *((void *)v89 + 1);
        *(void *)uint64_t v88 = v90;
        *((void *)v88 + 1) = v91;
      }
      else
      {
        *(_OWORD *)uint64_t v88 = *(_OWORD *)v89;
      }
      uint64_t v151 = *(int *)(v16 + 36);
      uint64_t v152 = &a1[v151];
      uint64_t v153 = &a2[v151];
      if (v22(v153, 1, v20))
      {
        uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
        memcpy(v152, v153, *(void *)(*(void *)(v154 - 8) + 64));
      }
      else
      {
        long long v163 = *((_OWORD *)v153 + 3);
        *((_OWORD *)v152 + 2) = *((_OWORD *)v153 + 2);
        *((_OWORD *)v152 + 3) = v163;
        *((_OWORD *)v152 + 4) = *((_OWORD *)v153 + 4);
        long long v164 = *((_OWORD *)v153 + 1);
        *(_OWORD *)uint64_t v152 = *(_OWORD *)v153;
        *((_OWORD *)v152 + 1) = v164;
        uint64_t v165 = v20[5];
        uint64_t v166 = &v152[v165];
        uint64_t v167 = &v153[v165];
        uint64_t v168 = sub_248174700();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v168 - 8) + 32))(v166, v167, v168);
        uint64_t v169 = v20[6];
        uint64_t v170 = &v152[v169];
        uint64_t v171 = &v153[v169];
        long long v172 = *((_OWORD *)v171 + 3);
        *((_OWORD *)v170 + 2) = *((_OWORD *)v171 + 2);
        *((_OWORD *)v170 + 3) = v172;
        *(_OWORD *)(v170 + 57) = *(_OWORD *)(v171 + 57);
        long long v173 = *((_OWORD *)v171 + 1);
        *(_OWORD *)uint64_t v170 = *(_OWORD *)v171;
        *((_OWORD *)v170 + 1) = v173;
        *(void *)&v152[v20[7]] = *(void *)&v153[v20[7]];
        (*(void (**)(char *, void, uint64_t, int *))(v21 + 56))(v152, 0, 1, v20);
      }
      uint64_t v174 = (int *)type metadata accessor for SignInModel();
      uint64_t v175 = v174[5];
      uint64_t v176 = &v152[v175];
      uint64_t v177 = &v153[v175];
      long long v178 = *((_OWORD *)v177 + 3);
      *((_OWORD *)v176 + 2) = *((_OWORD *)v177 + 2);
      *((_OWORD *)v176 + 3) = v178;
      long long v179 = *((_OWORD *)v177 + 5);
      *((_OWORD *)v176 + 4) = *((_OWORD *)v177 + 4);
      *((_OWORD *)v176 + 5) = v179;
      long long v180 = *((_OWORD *)v177 + 1);
      *(_OWORD *)uint64_t v176 = *(_OWORD *)v177;
      *((_OWORD *)v176 + 1) = v180;
      *(void *)&v152[v174[6]] = *(void *)&v153[v174[6]];
      *(void *)&v152[v174[7]] = *(void *)&v153[v174[7]];
      v152[v174[8]] = v153[v174[8]];
      v152[v174[9]] = v153[v174[9]];
      uint64_t v181 = v174[10];
      uint64_t v182 = &v152[v181];
      uint64_t v183 = &v153[v181];
      long long v184 = *((_OWORD *)v183 + 1);
      *(_OWORD *)uint64_t v182 = *(_OWORD *)v183;
      *((_OWORD *)v182 + 1) = v184;
      *(_OWORD *)&v152[v174[11]] = *(_OWORD *)&v153[v174[11]];
      *(void *)&v152[v174[12]] = *(void *)&v153[v174[12]];
      uint64_t v185 = v174[13];
      uint64_t v186 = &v152[v185];
      uint64_t v187 = &v153[v185];
      v186[16] = v187[16];
      *(_OWORD *)uint64_t v186 = *(_OWORD *)v187;
      *(_OWORD *)&v152[v174[14]] = *(_OWORD *)&v153[v174[14]];
      v152[v174[15]] = v153[v174[15]];
      uint64_t v188 = v174[16];
      uint64_t v189 = &v152[v188];
      uint64_t v190 = &v153[v188];
      long long v191 = *((_OWORD *)v190 + 1);
      *(_OWORD *)uint64_t v189 = *(_OWORD *)v190;
      *((_OWORD *)v189 + 1) = v191;
      v189[32] = v190[32];
LABEL_35:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *assignWithTake for MachSetupMessage(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24817150C((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for MachSetupMessage);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 3:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692D9840) + 32);
        long long v25 = &a1[v24];
        long long v26 = &a2[v24];
        *long long v25 = a2[v24];
        *(_OWORD *)(v25 + 22) = *(_OWORD *)&a2[v24 + 22];
        *(_OWORD *)(v25 + 8) = *(_OWORD *)&a2[v24 + 8];
        v25[88] = a2[v24 + 88];
        *(_OWORD *)(v25 + 72) = *(_OWORD *)&a2[v24 + 72];
        *(_OWORD *)(v25 + 56) = *(_OWORD *)&a2[v24 + 56];
        *(_OWORD *)(v25 + 40) = *(_OWORD *)&a2[v24 + 40];
        long long v27 = *(_OWORD *)&a2[v24 + 96];
        long long v28 = *(_OWORD *)&a2[v24 + 112];
        long long v29 = *(_OWORD *)&a2[v24 + 144];
        *((_OWORD *)v25 + 8) = *(_OWORD *)&a2[v24 + 128];
        *((_OWORD *)v25 + 9) = v29;
        *((_OWORD *)v25 + 6) = v27;
        *((_OWORD *)v25 + 7) = v28;
        long long v30 = *(_OWORD *)&a2[v24 + 160];
        long long v31 = *(_OWORD *)&a2[v24 + 176];
        long long v32 = *(_OWORD *)&a2[v24 + 208];
        *((_OWORD *)v25 + 12) = *(_OWORD *)&a2[v24 + 192];
        *((_OWORD *)v25 + 13) = v32;
        *((_OWORD *)v25 + 10) = v30;
        *((_OWORD *)v25 + 11) = v31;
        long long v33 = *(_OWORD *)&a2[v24 + 224];
        long long v34 = *(_OWORD *)&a2[v24 + 240];
        long long v35 = *(_OWORD *)&a2[v24 + 272];
        *((_OWORD *)v25 + 16) = *(_OWORD *)&a2[v24 + 256];
        *((_OWORD *)v25 + 17) = v35;
        *((_OWORD *)v25 + 14) = v33;
        *((_OWORD *)v25 + 15) = v34;
        uint64_t v36 = type metadata accessor for SetupModel();
        uint64_t v37 = *(int *)(v36 + 32);
        long long v38 = &v25[v37];
        long long v39 = &v26[v37];
        uint64_t v40 = (int *)type metadata accessor for IdMSAccount();
        uint64_t v41 = *((void *)v40 - 1);
        uint64_t v258 = *(unsigned int (**)(char *, uint64_t, int *))(v41 + 48);
        if (v258(v39, 1, v40))
        {
          uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v38, v39, *(void *)(*(void *)(v42 - 8) + 64));
        }
        else
        {
          long long v62 = *((_OWORD *)v39 + 3);
          *((_OWORD *)v38 + 2) = *((_OWORD *)v39 + 2);
          *((_OWORD *)v38 + 3) = v62;
          *((_OWORD *)v38 + 4) = *((_OWORD *)v39 + 4);
          long long v63 = *((_OWORD *)v39 + 1);
          *(_OWORD *)long long v38 = *(_OWORD *)v39;
          *((_OWORD *)v38 + 1) = v63;
          uint64_t v64 = v40[5];
          uint64_t v256 = v41;
          uint64_t v65 = &v38[v64];
          uint64_t v66 = &v39[v64];
          uint64_t v67 = sub_248174700();
          uint64_t v68 = v65;
          uint64_t v41 = v256;
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 32))(v68, v66, v67);
          uint64_t v69 = v40[6];
          uint64_t v70 = &v38[v69];
          uint64_t v71 = &v39[v69];
          long long v72 = *((_OWORD *)v71 + 3);
          *((_OWORD *)v70 + 2) = *((_OWORD *)v71 + 2);
          *((_OWORD *)v70 + 3) = v72;
          *(_OWORD *)(v70 + 57) = *(_OWORD *)(v71 + 57);
          long long v73 = *((_OWORD *)v71 + 1);
          *(_OWORD *)uint64_t v70 = *(_OWORD *)v71;
          *((_OWORD *)v70 + 1) = v73;
          *(void *)&v38[v40[7]] = *(void *)&v39[v40[7]];
          (*(void (**)(char *, void, uint64_t, int *))(v256 + 56))(v38, 0, 1, v40);
        }
        long long v74 = (int *)type metadata accessor for AuthenticationModel();
        uint64_t v75 = v74[5];
        uint64_t v76 = &v38[v75];
        uint64_t v77 = &v39[v75];
        long long v78 = *((_OWORD *)v77 + 3);
        *((_OWORD *)v76 + 2) = *((_OWORD *)v77 + 2);
        *((_OWORD *)v76 + 3) = v78;
        *((_OWORD *)v76 + 4) = *((_OWORD *)v77 + 4);
        long long v79 = *((_OWORD *)v77 + 1);
        *(_OWORD *)uint64_t v76 = *(_OWORD *)v77;
        *((_OWORD *)v76 + 1) = v79;
        v38[v74[6]] = v39[v74[6]];
        *(_OWORD *)&v38[v74[7]] = *(_OWORD *)&v39[v74[7]];
        *(void *)&v38[v74[8]] = *(void *)&v39[v74[8]];
        v38[v74[9]] = v39[v74[9]];
        uint64_t v80 = v74[10];
        uint64_t v81 = &v38[v80];
        uint64_t v82 = &v39[v80];
        long long v83 = *((_OWORD *)v82 + 1);
        *(_OWORD *)uint64_t v81 = *(_OWORD *)v82;
        *((_OWORD *)v81 + 1) = v83;
        v81[80] = v82[80];
        long long v84 = *((_OWORD *)v82 + 4);
        long long v85 = *((_OWORD *)v82 + 2);
        *((_OWORD *)v81 + 3) = *((_OWORD *)v82 + 3);
        *((_OWORD *)v81 + 4) = v84;
        *((_OWORD *)v81 + 2) = v85;
        uint64_t v86 = v74[11];
        uint64_t v87 = &v38[v86];
        uint64_t v88 = &v39[v86];
        uint64_t v89 = *(void *)v88;
        if (*(void *)v88)
        {
          uint64_t v90 = *((void *)v88 + 1);
          *(void *)uint64_t v87 = v89;
          *((void *)v87 + 1) = v90;
        }
        else
        {
          *(_OWORD *)uint64_t v87 = *(_OWORD *)v88;
        }
        uint64_t v121 = *(int *)(v36 + 36);
        long long v122 = &v25[v121];
        uint64_t v123 = &v26[v121];
        if (v258(&v26[v121], 1, v40))
        {
          uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v122, v123, *(void *)(*(void *)(v124 - 8) + 64));
        }
        else
        {
          long long v129 = *((_OWORD *)v123 + 3);
          *((_OWORD *)v122 + 2) = *((_OWORD *)v123 + 2);
          *((_OWORD *)v122 + 3) = v129;
          *((_OWORD *)v122 + 4) = *((_OWORD *)v123 + 4);
          long long v130 = *((_OWORD *)v123 + 1);
          *(_OWORD *)long long v122 = *(_OWORD *)v123;
          *((_OWORD *)v122 + 1) = v130;
          uint64_t v131 = v40[5];
          long long v132 = &v122[v131];
          uint64_t v133 = v41;
          uint64_t v134 = &v123[v131];
          uint64_t v135 = sub_248174700();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v135 - 8) + 32))(v132, v134, v135);
          uint64_t v136 = v40[6];
          uint64_t v137 = &v122[v136];
          long long v138 = &v123[v136];
          long long v139 = *((_OWORD *)v138 + 3);
          *((_OWORD *)v137 + 2) = *((_OWORD *)v138 + 2);
          *((_OWORD *)v137 + 3) = v139;
          *(_OWORD *)(v137 + 57) = *(_OWORD *)(v138 + 57);
          long long v140 = *((_OWORD *)v138 + 1);
          *(_OWORD *)uint64_t v137 = *(_OWORD *)v138;
          *((_OWORD *)v137 + 1) = v140;
          *(void *)&v122[v40[7]] = *(void *)&v123[v40[7]];
          (*(void (**)(char *, void, uint64_t, int *))(v133 + 56))(v122, 0, 1, v40);
        }
        uint64_t v141 = (int *)type metadata accessor for SignInModel();
        uint64_t v142 = v141[5];
        long long v143 = &v122[v142];
        long long v144 = &v123[v142];
        long long v145 = *((_OWORD *)v144 + 3);
        *((_OWORD *)v143 + 2) = *((_OWORD *)v144 + 2);
        *((_OWORD *)v143 + 3) = v145;
        long long v146 = *((_OWORD *)v144 + 5);
        *((_OWORD *)v143 + 4) = *((_OWORD *)v144 + 4);
        *((_OWORD *)v143 + 5) = v146;
        long long v147 = *((_OWORD *)v144 + 1);
        *(_OWORD *)long long v143 = *(_OWORD *)v144;
        *((_OWORD *)v143 + 1) = v147;
        *(void *)&v122[v141[6]] = *(void *)&v123[v141[6]];
        *(void *)&v122[v141[7]] = *(void *)&v123[v141[7]];
        v122[v141[8]] = v123[v141[8]];
        v122[v141[9]] = v123[v141[9]];
        uint64_t v148 = v141[10];
        uint64_t v149 = &v122[v148];
        uint64_t v150 = &v123[v148];
        long long v151 = *((_OWORD *)v150 + 1);
        *(_OWORD *)uint64_t v149 = *(_OWORD *)v150;
        *((_OWORD *)v149 + 1) = v151;
        *(_OWORD *)&v122[v141[11]] = *(_OWORD *)&v123[v141[11]];
        *(void *)&v122[v141[12]] = *(void *)&v123[v141[12]];
        uint64_t v152 = v141[13];
        uint64_t v153 = &v122[v152];
        uint64_t v154 = &v123[v152];
        v153[16] = v154[16];
        *(_OWORD *)uint64_t v153 = *(_OWORD *)v154;
        *(_OWORD *)&v122[v141[14]] = *(_OWORD *)&v123[v141[14]];
        v122[v141[15]] = v123[v141[15]];
        uint64_t v155 = v141[16];
        uint64_t v156 = &v122[v155];
        uint64_t v157 = &v123[v155];
        long long v158 = *((_OWORD *)v157 + 1);
        *(_OWORD *)uint64_t v156 = *(_OWORD *)v157;
        *((_OWORD *)v156 + 1) = v158;
        v156[32] = v157[32];
        goto LABEL_36;
      case 2:
        *(void *)a1 = *(void *)a2;
        a1[8] = a2[8];
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9830);
        uint64_t v44 = *(int *)(v43 + 32);
        uint64_t v45 = &a1[v44];
        char v46 = &a2[v44];
        *uint64_t v45 = a2[v44];
        *(_OWORD *)(v45 + 22) = *(_OWORD *)&a2[v44 + 22];
        *(_OWORD *)(v45 + 8) = *(_OWORD *)&a2[v44 + 8];
        v45[88] = a2[v44 + 88];
        *(_OWORD *)(v45 + 72) = *(_OWORD *)&a2[v44 + 72];
        *(_OWORD *)(v45 + 56) = *(_OWORD *)&a2[v44 + 56];
        *(_OWORD *)(v45 + 40) = *(_OWORD *)&a2[v44 + 40];
        long long v47 = *(_OWORD *)&a2[v44 + 96];
        long long v48 = *(_OWORD *)&a2[v44 + 112];
        long long v49 = *(_OWORD *)&a2[v44 + 144];
        *((_OWORD *)v45 + 8) = *(_OWORD *)&a2[v44 + 128];
        *((_OWORD *)v45 + 9) = v49;
        *((_OWORD *)v45 + 6) = v47;
        *((_OWORD *)v45 + 7) = v48;
        long long v50 = *(_OWORD *)&a2[v44 + 160];
        long long v51 = *(_OWORD *)&a2[v44 + 176];
        long long v52 = *(_OWORD *)&a2[v44 + 208];
        *((_OWORD *)v45 + 12) = *(_OWORD *)&a2[v44 + 192];
        *((_OWORD *)v45 + 13) = v52;
        *((_OWORD *)v45 + 10) = v50;
        *((_OWORD *)v45 + 11) = v51;
        long long v53 = *(_OWORD *)&a2[v44 + 224];
        long long v54 = *(_OWORD *)&a2[v44 + 240];
        long long v55 = *(_OWORD *)&a2[v44 + 272];
        *((_OWORD *)v45 + 16) = *(_OWORD *)&a2[v44 + 256];
        *((_OWORD *)v45 + 17) = v55;
        *((_OWORD *)v45 + 14) = v53;
        *((_OWORD *)v45 + 15) = v54;
        uint64_t v56 = type metadata accessor for SetupModel();
        uint64_t v57 = *(int *)(v56 + 32);
        uint64_t v58 = &v45[v57];
        uint64_t v59 = &v46[v57];
        unsigned int v60 = (int *)type metadata accessor for IdMSAccount();
        uint64_t v254 = *((void *)v60 - 1);
        uint64_t v255 = *(unsigned int (**)(char *, uint64_t, int *))(v254 + 48);
        if (v255(v59, 1, v60))
        {
          uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v58, v59, *(void *)(*(void *)(v61 - 8) + 64));
        }
        else
        {
          long long v91 = *((_OWORD *)v59 + 3);
          *((_OWORD *)v58 + 2) = *((_OWORD *)v59 + 2);
          *((_OWORD *)v58 + 3) = v91;
          *((_OWORD *)v58 + 4) = *((_OWORD *)v59 + 4);
          long long v92 = *((_OWORD *)v59 + 1);
          *(_OWORD *)uint64_t v58 = *(_OWORD *)v59;
          *((_OWORD *)v58 + 1) = v92;
          uint64_t v93 = v60[5];
          uint64_t v252 = v56;
          uint64_t v253 = v43;
          uint64_t v94 = &v58[v93];
          uint64_t v95 = &v59[v93];
          uint64_t v96 = sub_248174700();
          uint64_t v97 = v94;
          long long v98 = v95;
          uint64_t v56 = v252;
          uint64_t v43 = v253;
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v96 - 8) + 32))(v97, v98, v96);
          uint64_t v99 = v60[6];
          uint64_t v100 = &v58[v99];
          uint64_t v101 = &v59[v99];
          long long v102 = *((_OWORD *)v101 + 3);
          *((_OWORD *)v100 + 2) = *((_OWORD *)v101 + 2);
          *((_OWORD *)v100 + 3) = v102;
          *(_OWORD *)(v100 + 57) = *(_OWORD *)(v101 + 57);
          long long v103 = *((_OWORD *)v101 + 1);
          *(_OWORD *)uint64_t v100 = *(_OWORD *)v101;
          *((_OWORD *)v100 + 1) = v103;
          *(void *)&v58[v60[7]] = *(void *)&v59[v60[7]];
          (*(void (**)(char *, void, uint64_t, int *))(v254 + 56))(v58, 0, 1, v60);
        }
        uint64_t v104 = (int *)type metadata accessor for AuthenticationModel();
        uint64_t v105 = v104[5];
        uint64_t v106 = &v58[v105];
        uint64_t v107 = &v59[v105];
        long long v108 = *((_OWORD *)v107 + 3);
        *((_OWORD *)v106 + 2) = *((_OWORD *)v107 + 2);
        *((_OWORD *)v106 + 3) = v108;
        *((_OWORD *)v106 + 4) = *((_OWORD *)v107 + 4);
        long long v109 = *((_OWORD *)v107 + 1);
        *(_OWORD *)uint64_t v106 = *(_OWORD *)v107;
        *((_OWORD *)v106 + 1) = v109;
        v58[v104[6]] = v59[v104[6]];
        *(_OWORD *)&v58[v104[7]] = *(_OWORD *)&v59[v104[7]];
        *(void *)&v58[v104[8]] = *(void *)&v59[v104[8]];
        v58[v104[9]] = v59[v104[9]];
        uint64_t v110 = v104[10];
        uint64_t v111 = &v58[v110];
        long long v112 = &v59[v110];
        long long v113 = *((_OWORD *)v112 + 1);
        *(_OWORD *)uint64_t v111 = *(_OWORD *)v112;
        *((_OWORD *)v111 + 1) = v113;
        v111[80] = v112[80];
        long long v114 = *((_OWORD *)v112 + 4);
        long long v115 = *((_OWORD *)v112 + 2);
        *((_OWORD *)v111 + 3) = *((_OWORD *)v112 + 3);
        *((_OWORD *)v111 + 4) = v114;
        *((_OWORD *)v111 + 2) = v115;
        uint64_t v116 = v104[11];
        uint64_t v117 = &v58[v116];
        uint64_t v118 = &v59[v116];
        uint64_t v119 = *(void *)v118;
        if (*(void *)v118)
        {
          uint64_t v120 = *((void *)v118 + 1);
          *(void *)uint64_t v117 = v119;
          *((void *)v117 + 1) = v120;
        }
        else
        {
          *(_OWORD *)uint64_t v117 = *(_OWORD *)v118;
        }
        uint64_t v125 = *(int *)(v56 + 36);
        uint64_t v126 = &v45[v125];
        uint64_t v127 = &v46[v125];
        if (v255(&v46[v125], 1, v60))
        {
          uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v126, v127, *(void *)(*(void *)(v128 - 8) + 64));
        }
        else
        {
          long long v159 = *((_OWORD *)v127 + 3);
          *((_OWORD *)v126 + 2) = *((_OWORD *)v127 + 2);
          *((_OWORD *)v126 + 3) = v159;
          *((_OWORD *)v126 + 4) = *((_OWORD *)v127 + 4);
          long long v160 = *((_OWORD *)v127 + 1);
          *(_OWORD *)uint64_t v126 = *(_OWORD *)v127;
          *((_OWORD *)v126 + 1) = v160;
          uint64_t v161 = v60[5];
          uint64_t v162 = &v126[v161];
          long long v163 = &v127[v161];
          uint64_t v164 = sub_248174700();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v164 - 8) + 32))(v162, v163, v164);
          uint64_t v165 = v60[6];
          uint64_t v166 = &v126[v165];
          uint64_t v167 = &v127[v165];
          long long v168 = *((_OWORD *)v167 + 3);
          *((_OWORD *)v166 + 2) = *((_OWORD *)v167 + 2);
          *((_OWORD *)v166 + 3) = v168;
          *(_OWORD *)(v166 + 57) = *(_OWORD *)(v167 + 57);
          long long v169 = *((_OWORD *)v167 + 1);
          *(_OWORD *)uint64_t v166 = *(_OWORD *)v167;
          *((_OWORD *)v166 + 1) = v169;
          *(void *)&v126[v60[7]] = *(void *)&v127[v60[7]];
          (*(void (**)(char *, void, uint64_t, int *))(v254 + 56))(v126, 0, 1, v60);
        }
        uint64_t v170 = (int *)type metadata accessor for SignInModel();
        uint64_t v171 = v170[5];
        long long v172 = &v126[v171];
        long long v173 = &v127[v171];
        long long v174 = *((_OWORD *)v173 + 3);
        *((_OWORD *)v172 + 2) = *((_OWORD *)v173 + 2);
        *((_OWORD *)v172 + 3) = v174;
        long long v175 = *((_OWORD *)v173 + 5);
        *((_OWORD *)v172 + 4) = *((_OWORD *)v173 + 4);
        *((_OWORD *)v172 + 5) = v175;
        long long v176 = *((_OWORD *)v173 + 1);
        *(_OWORD *)long long v172 = *(_OWORD *)v173;
        *((_OWORD *)v172 + 1) = v176;
        *(void *)&v126[v170[6]] = *(void *)&v127[v170[6]];
        *(void *)&v126[v170[7]] = *(void *)&v127[v170[7]];
        v126[v170[8]] = v127[v170[8]];
        v126[v170[9]] = v127[v170[9]];
        uint64_t v177 = v170[10];
        long long v178 = &v126[v177];
        long long v179 = &v127[v177];
        long long v180 = *((_OWORD *)v179 + 1);
        *(_OWORD *)long long v178 = *(_OWORD *)v179;
        *((_OWORD *)v178 + 1) = v180;
        *(_OWORD *)&v126[v170[11]] = *(_OWORD *)&v127[v170[11]];
        *(void *)&v126[v170[12]] = *(void *)&v127[v170[12]];
        uint64_t v181 = v170[13];
        uint64_t v182 = &v126[v181];
        uint64_t v183 = &v127[v181];
        v182[16] = v183[16];
        *(_OWORD *)uint64_t v182 = *(_OWORD *)v183;
        *(_OWORD *)&v126[v170[14]] = *(_OWORD *)&v127[v170[14]];
        v126[v170[15]] = v127[v170[15]];
        uint64_t v184 = v170[16];
        uint64_t v185 = &v126[v184];
        uint64_t v186 = &v127[v184];
        long long v187 = *((_OWORD *)v186 + 1);
        *(_OWORD *)uint64_t v185 = *(_OWORD *)v186;
        *((_OWORD *)v185 + 1) = v187;
        v185[32] = v186[32];
        *(void *)&a1[*(int *)(v43 + 36)] = *(void *)&a2[*(int *)(v43 + 36)];
        goto LABEL_36;
      case 0:
        *a1 = *a2;
        *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
        *(_OWORD *)(a1 + 22) = *(_OWORD *)(a2 + 22);
        *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
        *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
        *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
        a1[88] = a2[88];
        long long v7 = *((_OWORD *)a2 + 6);
        long long v8 = *((_OWORD *)a2 + 7);
        long long v9 = *((_OWORD *)a2 + 9);
        *((_OWORD *)a1 + 8) = *((_OWORD *)a2 + 8);
        *((_OWORD *)a1 + 9) = v9;
        *((_OWORD *)a1 + 6) = v7;
        *((_OWORD *)a1 + 7) = v8;
        long long v10 = *((_OWORD *)a2 + 10);
        long long v11 = *((_OWORD *)a2 + 11);
        long long v12 = *((_OWORD *)a2 + 13);
        *((_OWORD *)a1 + 12) = *((_OWORD *)a2 + 12);
        *((_OWORD *)a1 + 13) = v12;
        *((_OWORD *)a1 + 10) = v10;
        *((_OWORD *)a1 + 11) = v11;
        long long v13 = *((_OWORD *)a2 + 14);
        long long v14 = *((_OWORD *)a2 + 15);
        long long v15 = *((_OWORD *)a2 + 17);
        *((_OWORD *)a1 + 16) = *((_OWORD *)a2 + 16);
        *((_OWORD *)a1 + 17) = v15;
        *((_OWORD *)a1 + 14) = v13;
        *((_OWORD *)a1 + 15) = v14;
        uint64_t v16 = type metadata accessor for SetupModel();
        uint64_t v17 = *(int *)(v16 + 32);
        uint64_t v18 = &a1[v17];
        unint64_t v19 = &a2[v17];
        uint64_t v20 = (int *)type metadata accessor for IdMSAccount();
        uint64_t v21 = *((void *)v20 - 1);
        uint64_t v22 = *(unsigned int (**)(void, void, void))(v21 + 48);
        if (v22(v19, 1, v20))
        {
          uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
        }
        else
        {
          long long v188 = *((_OWORD *)v19 + 3);
          *((_OWORD *)v18 + 2) = *((_OWORD *)v19 + 2);
          *((_OWORD *)v18 + 3) = v188;
          *((_OWORD *)v18 + 4) = *((_OWORD *)v19 + 4);
          long long v189 = *((_OWORD *)v19 + 1);
          *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
          *((_OWORD *)v18 + 1) = v189;
          uint64_t v190 = v20[5];
          uint64_t v257 = v22;
          long long v191 = &v18[v190];
          uint64_t v192 = v21;
          long long v193 = &v19[v190];
          uint64_t v194 = sub_248174700();
          uint64_t v195 = v193;
          uint64_t v21 = v192;
          uint64_t v22 = v257;
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v194 - 8) + 32))(v191, v195, v194);
          uint64_t v196 = v20[6];
          long long v197 = &v18[v196];
          uint64_t v198 = &v19[v196];
          long long v199 = *((_OWORD *)v198 + 3);
          *((_OWORD *)v197 + 2) = *((_OWORD *)v198 + 2);
          *((_OWORD *)v197 + 3) = v199;
          *(_OWORD *)(v197 + 57) = *(_OWORD *)(v198 + 57);
          long long v200 = *((_OWORD *)v198 + 1);
          *(_OWORD *)long long v197 = *(_OWORD *)v198;
          *((_OWORD *)v197 + 1) = v200;
          *(void *)&v18[v20[7]] = *(void *)&v19[v20[7]];
          (*(void (**)(char *, void, uint64_t, int *))(v21 + 56))(v18, 0, 1, v20);
        }
        uint64_t v201 = (int *)type metadata accessor for AuthenticationModel();
        uint64_t v202 = v201[5];
        long long v203 = &v18[v202];
        uint64_t v204 = &v19[v202];
        long long v205 = *((_OWORD *)v204 + 3);
        *((_OWORD *)v203 + 2) = *((_OWORD *)v204 + 2);
        *((_OWORD *)v203 + 3) = v205;
        *((_OWORD *)v203 + 4) = *((_OWORD *)v204 + 4);
        long long v206 = *((_OWORD *)v204 + 1);
        *(_OWORD *)long long v203 = *(_OWORD *)v204;
        *((_OWORD *)v203 + 1) = v206;
        v18[v201[6]] = v19[v201[6]];
        *(_OWORD *)&v18[v201[7]] = *(_OWORD *)&v19[v201[7]];
        *(void *)&v18[v201[8]] = *(void *)&v19[v201[8]];
        v18[v201[9]] = v19[v201[9]];
        uint64_t v207 = v201[10];
        long long v208 = &v18[v207];
        long long v209 = &v19[v207];
        long long v210 = *((_OWORD *)v209 + 1);
        *(_OWORD *)long long v208 = *(_OWORD *)v209;
        *((_OWORD *)v208 + 1) = v210;
        v208[80] = v209[80];
        long long v211 = *((_OWORD *)v209 + 4);
        long long v212 = *((_OWORD *)v209 + 2);
        *((_OWORD *)v208 + 3) = *((_OWORD *)v209 + 3);
        *((_OWORD *)v208 + 4) = v211;
        *((_OWORD *)v208 + 2) = v212;
        uint64_t v213 = v201[11];
        long long v214 = &v18[v213];
        uint64_t v215 = &v19[v213];
        uint64_t v216 = *(void *)v215;
        if (*(void *)v215)
        {
          uint64_t v217 = *((void *)v215 + 1);
          *(void *)long long v214 = v216;
          *((void *)v214 + 1) = v217;
        }
        else
        {
          *(_OWORD *)long long v214 = *(_OWORD *)v215;
        }
        uint64_t v218 = *(int *)(v16 + 36);
        v219 = &a1[v218];
        uint64_t v220 = &a2[v218];
        if (v22(v220, 1, v20))
        {
          uint64_t v221 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D5080);
          memcpy(v219, v220, *(void *)(*(void *)(v221 - 8) + 64));
        }
        else
        {
          long long v222 = *((_OWORD *)v220 + 3);
          *((_OWORD *)v219 + 2) = *((_OWORD *)v220 + 2);
          *((_OWORD *)v219 + 3) = v222;
          *((_OWORD *)v219 + 4) = *((_OWORD *)v220 + 4);
          long long v223 = *((_OWORD *)v220 + 1);
          *(_OWORD *)v219 = *(_OWORD *)v220;
          *((_OWORD *)v219 + 1) = v223;
          uint64_t v224 = v20[5];
          uint64_t v225 = &v219[v224];
          uint64_t v226 = &v220[v224];
          uint64_t v227 = sub_248174700();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v227 - 8) + 32))(v225, v226, v227);
          uint64_t v228 = v20[6];
          uint64_t v229 = &v219[v228];
          uint64_t v230 = &v220[v228];
          long long v231 = *((_OWORD *)v230 + 3);
          *((_OWORD *)v229 + 2) = *((_OWORD *)v230 + 2);
          *((_OWORD *)v229 + 3) = v231;
          *(_OWORD *)(v229 + 57) = *(_OWORD *)(v230 + 57);
          long long v232 = *((_OWORD *)v230 + 1);
          *(_OWORD *)uint64_t v229 = *(_OWORD *)v230;
          *((_OWORD *)v229 + 1) = v232;
          *(void *)&v219[v20[7]] = *(void *)&v220[v20[7]];
          (*(void (**)(char *, void, uint64_t, int *))(v21 + 56))(v219, 0, 1, v20);
        }
        uint64_t v233 = (int *)type metadata accessor for SignInModel();
        uint64_t v234 = v233[5];
        uint64_t v235 = &v219[v234];
        uint64_t v236 = &v220[v234];
        long long v237 = *((_OWORD *)v236 + 3);
        *((_OWORD *)v235 + 2) = *((_OWORD *)v236 + 2);
        *((_OWORD *)v235 + 3) = v237;
        long long v238 = *((_OWORD *)v236 + 5);
        *((_OWORD *)v235 + 4) = *((_OWORD *)v236 + 4);
        *((_OWORD *)v235 + 5) = v238;
        long long v239 = *((_OWORD *)v236 + 1);
        *(_OWORD *)uint64_t v235 = *(_OWORD *)v236;
        *((_OWORD *)v235 + 1) = v239;
        *(void *)&v219[v233[6]] = *(void *)&v220[v233[6]];
        *(void *)&v219[v233[7]] = *(void *)&v220[v233[7]];
        v219[v233[8]] = v220[v233[8]];
        v219[v233[9]] = v220[v233[9]];
        uint64_t v240 = v233[10];
        uint64_t v241 = &v219[v240];
        v242 = &v220[v240];
        long long v243 = *((_OWORD *)v242 + 1);
        *(_OWORD *)uint64_t v241 = *(_OWORD *)v242;
        *((_OWORD *)v241 + 1) = v243;
        *(_OWORD *)&v219[v233[11]] = *(_OWORD *)&v220[v233[11]];
        *(void *)&v219[v233[12]] = *(void *)&v220[v233[12]];
        uint64_t v244 = v233[13];
        v245 = &v219[v244];
        v246 = &v220[v244];
        v245[16] = v246[16];
        *(_OWORD *)v245 = *(_OWORD *)v246;
        *(_OWORD *)&v219[v233[14]] = *(_OWORD *)&v220[v233[14]];
        v219[v233[15]] = v220[v233[15]];
        uint64_t v247 = v233[16];
        unint64_t v248 = &v219[v247];
        uint64_t v249 = &v220[v247];
        long long v250 = *((_OWORD *)v249 + 1);
        *(_OWORD *)unint64_t v248 = *(_OWORD *)v249;
        *((_OWORD *)v248 + 1) = v250;
        v248[32] = v249[32];
LABEL_36:
        swift_storeEnumTagMultiPayload();
        return a1;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void sub_24816F434()
{
  type metadata accessor for SetupModel();
  if (v0 <= 0x3F)
  {
    sub_24816F57C(319, &qword_2692DC7A8, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for _Coordinated.ValueUpdate);
    if (v1 <= 0x3F)
    {
      sub_24816F57C(319, &qword_2692DC7B0, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for _Coordinated.ValueUpdate.Response);
      if (v2 <= 0x3F) {
        swift_initEnumMetadataMultiPayload();
      }
    }
  }
}

void sub_24816F57C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for SetupModel();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t destroy for SetupError(uint64_t a1)
{
  return sub_247FA98EC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
}

uint64_t initializeWithCopy for SetupError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_247FA9804(*(void *)a2, v4, v5, v6, v7, v8, v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for SetupError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_247FA9804(*(void *)a2, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  char v16 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_247FA98EC(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

uint64_t assignWithTake for SetupError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v3;
  sub_247FA98EC(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for SetupError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SetupError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)unint64_t result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 48) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24816F7F4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 48) <= 3u) {
    return *(unsigned __int8 *)(a1 + 48);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_24816F80C(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)unint64_t result = a2 - 4;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)(result + 40) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SetupError()
{
  return &type metadata for SetupError;
}

unsigned char *storeEnumTagSinglePayload for SetupError.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x24816F910);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SetupError.CodingKeys()
{
  return &type metadata for SetupError.CodingKeys;
}

ValueMetadata *type metadata accessor for SetupError.UnknownCodingKeys()
{
  return &type metadata for SetupError.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for SetupError.CancelledCodingKeys()
{
  return &type metadata for SetupError.CancelledCodingKeys;
}

ValueMetadata *type metadata accessor for SetupError.UserCancelledCodingKeys()
{
  return &type metadata for SetupError.UserCancelledCodingKeys;
}

ValueMetadata *type metadata accessor for SetupError.UserSkippedCodingKeys()
{
  return &type metadata for SetupError.UserSkippedCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for SetupError.GenericCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x24816FA54);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SetupError.GenericCodingKeys()
{
  return &type metadata for SetupError.GenericCodingKeys;
}

ValueMetadata *type metadata accessor for SetupError.MissingRequiredAccountsCodingKeys()
{
  return &type metadata for SetupError.MissingRequiredAccountsCodingKeys;
}

ValueMetadata *type metadata accessor for SetupError.BleClientInterceptedCodingKeys()
{
  return &type metadata for SetupError.BleClientInterceptedCodingKeys;
}

ValueMetadata *type metadata accessor for SetupError.ExistingUserProfileCodingKeys()
{
  return &type metadata for SetupError.ExistingUserProfileCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for SetupError.NestedCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24816FB8CLL);
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

ValueMetadata *type metadata accessor for SetupError.NestedCodingKeys()
{
  return &type metadata for SetupError.NestedCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for MachSetupMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x24816FC90);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MachSetupMessage.CodingKeys()
{
  return &type metadata for MachSetupMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for MachSetupMessage.SetupCodingKeys()
{
  return &type metadata for MachSetupMessage.SetupCodingKeys;
}

ValueMetadata *type metadata accessor for MachSetupMessage.ReportCodingKeys()
{
  return &type metadata for MachSetupMessage.ReportCodingKeys;
}

ValueMetadata *type metadata accessor for MachSetupMessage.CoordinatedModelUpdateCodingKeys()
{
  return &type metadata for MachSetupMessage.CoordinatedModelUpdateCodingKeys;
}

ValueMetadata *type metadata accessor for MachSetupMessage.CoordinatedModelResponseCodingKeys()
{
  return &type metadata for MachSetupMessage.CoordinatedModelResponseCodingKeys;
}

ValueMetadata *type metadata accessor for MachSetupMessage.ReceiptCodingKeys()
{
  return &type metadata for MachSetupMessage.ReceiptCodingKeys;
}

unsigned char *_s12AppleIDSetup10SetupErrorO33MissingRequiredAccountsCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24816FDB4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MachSetupMessage.FailureCodingKeys()
{
  return &type metadata for MachSetupMessage.FailureCodingKeys;
}

unint64_t sub_24816FDF0()
{
  unint64_t result = qword_2692DC7B8;
  if (!qword_2692DC7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC7B8);
  }
  return result;
}

unint64_t sub_24816FE48()
{
  unint64_t result = qword_2692DC7C0;
  if (!qword_2692DC7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC7C0);
  }
  return result;
}

unint64_t sub_24816FEA0()
{
  unint64_t result = qword_2692DC7C8;
  if (!qword_2692DC7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC7C8);
  }
  return result;
}

unint64_t sub_24816FEF8()
{
  unint64_t result = qword_2692DC7D0;
  if (!qword_2692DC7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC7D0);
  }
  return result;
}

unint64_t sub_24816FF50()
{
  unint64_t result = qword_2692DC7D8;
  if (!qword_2692DC7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC7D8);
  }
  return result;
}

unint64_t sub_24816FFA8()
{
  unint64_t result = qword_2692DC7E0;
  if (!qword_2692DC7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC7E0);
  }
  return result;
}

unint64_t sub_248170000()
{
  unint64_t result = qword_2692DC7E8;
  if (!qword_2692DC7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC7E8);
  }
  return result;
}

unint64_t sub_248170058()
{
  unint64_t result = qword_2692DC7F0;
  if (!qword_2692DC7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC7F0);
  }
  return result;
}

unint64_t sub_2481700B0()
{
  unint64_t result = qword_2692DC7F8;
  if (!qword_2692DC7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC7F8);
  }
  return result;
}

unint64_t sub_248170108()
{
  unint64_t result = qword_2692DC800;
  if (!qword_2692DC800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC800);
  }
  return result;
}

unint64_t sub_248170160()
{
  unint64_t result = qword_2692DC808;
  if (!qword_2692DC808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC808);
  }
  return result;
}

unint64_t sub_2481701B8()
{
  unint64_t result = qword_2692DC810;
  if (!qword_2692DC810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC810);
  }
  return result;
}

unint64_t sub_248170210()
{
  unint64_t result = qword_2692DC818;
  if (!qword_2692DC818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC818);
  }
  return result;
}

unint64_t sub_248170268()
{
  unint64_t result = qword_2692DC820;
  if (!qword_2692DC820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC820);
  }
  return result;
}

unint64_t sub_2481702C0()
{
  unint64_t result = qword_2692DC828;
  if (!qword_2692DC828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC828);
  }
  return result;
}

unint64_t sub_248170318()
{
  unint64_t result = qword_2692DC830;
  if (!qword_2692DC830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC830);
  }
  return result;
}

unint64_t sub_248170370()
{
  unint64_t result = qword_2692DC838;
  if (!qword_2692DC838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC838);
  }
  return result;
}

unint64_t sub_2481703C8()
{
  unint64_t result = qword_2692DC840;
  if (!qword_2692DC840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC840);
  }
  return result;
}

unint64_t sub_248170420()
{
  unint64_t result = qword_2692DC848;
  if (!qword_2692DC848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC848);
  }
  return result;
}

unint64_t sub_248170478()
{
  unint64_t result = qword_2692DC850;
  if (!qword_2692DC850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC850);
  }
  return result;
}

unint64_t sub_2481704D0()
{
  unint64_t result = qword_2692DC858;
  if (!qword_2692DC858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC858);
  }
  return result;
}

unint64_t sub_248170528()
{
  unint64_t result = qword_2692DC860;
  if (!qword_2692DC860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC860);
  }
  return result;
}

unint64_t sub_248170580()
{
  unint64_t result = qword_2692DC868;
  if (!qword_2692DC868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC868);
  }
  return result;
}

unint64_t sub_2481705D8()
{
  unint64_t result = qword_2692DC870;
  if (!qword_2692DC870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC870);
  }
  return result;
}

unint64_t sub_248170630()
{
  unint64_t result = qword_2692DC878;
  if (!qword_2692DC878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC878);
  }
  return result;
}

unint64_t sub_248170688()
{
  unint64_t result = qword_2692DC880;
  if (!qword_2692DC880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC880);
  }
  return result;
}

unint64_t sub_2481706E0()
{
  unint64_t result = qword_2692DC888;
  if (!qword_2692DC888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC888);
  }
  return result;
}

unint64_t sub_248170738()
{
  unint64_t result = qword_2692DC890;
  if (!qword_2692DC890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC890);
  }
  return result;
}

unint64_t sub_248170790()
{
  unint64_t result = qword_2692DC898;
  if (!qword_2692DC898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC898);
  }
  return result;
}

unint64_t sub_2481707E8()
{
  unint64_t result = qword_2692DC8A0;
  if (!qword_2692DC8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8A0);
  }
  return result;
}

unint64_t sub_248170840()
{
  unint64_t result = qword_2692DC8A8;
  if (!qword_2692DC8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8A8);
  }
  return result;
}

unint64_t sub_248170898()
{
  unint64_t result = qword_2692DC8B0;
  if (!qword_2692DC8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8B0);
  }
  return result;
}

unint64_t sub_2481708F0()
{
  unint64_t result = qword_2692DC8B8;
  if (!qword_2692DC8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8B8);
  }
  return result;
}

unint64_t sub_248170948()
{
  unint64_t result = qword_2692DC8C0;
  if (!qword_2692DC8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8C0);
  }
  return result;
}

unint64_t sub_2481709A0()
{
  unint64_t result = qword_2692DC8C8;
  if (!qword_2692DC8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8C8);
  }
  return result;
}

unint64_t sub_2481709F8()
{
  unint64_t result = qword_2692DC8D0;
  if (!qword_2692DC8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8D0);
  }
  return result;
}

unint64_t sub_248170A50()
{
  unint64_t result = qword_2692DC8D8;
  if (!qword_2692DC8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8D8);
  }
  return result;
}

unint64_t sub_248170AA8()
{
  unint64_t result = qword_2692DC8E0;
  if (!qword_2692DC8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8E0);
  }
  return result;
}

unint64_t sub_248170B00()
{
  unint64_t result = qword_2692DC8E8;
  if (!qword_2692DC8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8E8);
  }
  return result;
}

unint64_t sub_248170B58()
{
  unint64_t result = qword_2692DC8F0;
  if (!qword_2692DC8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8F0);
  }
  return result;
}

unint64_t sub_248170BB0()
{
  unint64_t result = qword_2692DC8F8;
  if (!qword_2692DC8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC8F8);
  }
  return result;
}

unint64_t sub_248170C08()
{
  unint64_t result = qword_2692DC900;
  if (!qword_2692DC900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC900);
  }
  return result;
}

unint64_t sub_248170C60()
{
  unint64_t result = qword_2692DC908;
  if (!qword_2692DC908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC908);
  }
  return result;
}

unint64_t sub_248170CB8()
{
  unint64_t result = qword_2692DC910;
  if (!qword_2692DC910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC910);
  }
  return result;
}

unint64_t sub_248170D10()
{
  unint64_t result = qword_2692DC918;
  if (!qword_2692DC918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC918);
  }
  return result;
}

uint64_t sub_248170D64(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7075746573 && a2 == 0xE500000000000000;
  if (v2 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74726F706572 && a2 == 0xE600000000000000 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000248190BC0 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000248190BE0 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x74706965636572 && a2 == 0xE700000000000000 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_248175CE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_248170FCC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v2 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C6C65636E6163 && a2 == 0xE900000000000064 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x636E614372657375 && a2 == 0xED000064656C6C65 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x70696B5372657375 && a2 == 0xEB00000000646570 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x636972656E6567 && a2 == 0xE700000000000000 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000248190C00 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000248190C20 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000248193680 || (sub_248175CE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x64657473656ELL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = sub_248175CE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

unint64_t sub_2481713A0()
{
  unint64_t result = qword_2692DC920;
  if (!qword_2692DC920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692DC920);
  }
  return result;
}

uint64_t sub_2481713F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24817145C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2481714C4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24817150C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t AISSetupAnalyticsEvent.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AISSetupAnalyticsEvent.init()();
  return v0;
}

uint64_t sub_2481715A4()
{
  uint64_t v1 = v0;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D73E0);
  uint64_t v2 = MEMORY[0x270FA5388](v51);
  uint64_t v50 = (uint64_t)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v6 = (char *)&v45 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v45 - v7;
  uint64_t v9 = sub_248174850();
  long long v10 = *(void **)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v48 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v45 - v13;
  unint64_t v15 = sub_247FB4894(MEMORY[0x263F8EE78]);
  uint64_t v16 = v1 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_startDate;
  swift_beginAccess();
  uint64_t v49 = v16;
  sub_24801D250(v16, (uint64_t)v8);
  uint64_t v17 = (unsigned int (*)(char *, uint64_t, uint64_t))v10[6];
  if (v17(v8, 1, v9) == 1)
  {
    char v6 = v8;
    goto LABEL_5;
  }
  unint64_t v46 = v15;
  uint64_t v18 = (void (*)(char *, char *, uint64_t))v10[4];
  v18(v14, v8, v9);
  uint64_t v47 = v1;
  uint64_t v19 = v1 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_endDate;
  swift_beginAccess();
  sub_24801D250(v19, (uint64_t)v6);
  if (v17(v6, 1, v9) != 1)
  {
    long long v39 = v48;
    v18(v48, v6, v9);
    uint64_t result = sub_248174800();
    if ((~*(void *)&v40 & 0x7FF0000000000000) != 0)
    {
      if (v40 > -9.22337204e18)
      {
        if (v40 < 9.22337204e18)
        {
          id v41 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, (uint64_t)v40);
          uint64_t v42 = v46;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v53 = v42;
          sub_247FB7E94((uint64_t)v41, 0x6E6F697461727564, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
          unint64_t v15 = v53;
          swift_bridgeObjectRelease();
          uint64_t v44 = (void (*)(char *, uint64_t))v10[1];
          v44(v39, v9);
          v44(v14, v9);
          uint64_t v1 = v47;
          if (!*(void *)(v47 + 24)) {
            goto LABEL_12;
          }
          goto LABEL_11;
        }
LABEL_22:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_22;
  }
  ((void (*)(char *, uint64_t))v10[1])(v14, v9);
  unint64_t v15 = v46;
  uint64_t v1 = v47;
LABEL_5:
  sub_2480F30EC((uint64_t)v6);
  if (qword_26B13B728 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_248174B90();
  __swift_project_value_buffer(v20, (uint64_t)qword_26B13B730);
  swift_retain_n();
  uint64_t v21 = sub_248174B70();
  os_log_type_t v22 = sub_2481755F0();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    unint64_t v24 = v15;
    uint64_t v25 = swift_slowAlloc();
    unint64_t v54 = v25;
    *(_DWORD *)uint64_t v23 = 136315394;
    uint64_t v26 = v50;
    sub_24801D250(v49, v50);
    uint64_t v27 = sub_248175190();
    uint64_t v53 = sub_247FB6D24(v27, v28, (uint64_t *)&v54);
    sub_248175730();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2080;
    uint64_t v29 = v1 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_endDate;
    swift_beginAccess();
    sub_24801D250(v29, v26);
    uint64_t v30 = sub_248175190();
    uint64_t v52 = sub_247FB6D24(v30, v31, (uint64_t *)&v54);
    sub_248175730();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247F93000, v21, v22, "Unable to calculate duration for AISSetupAnalyticsEvent \nstartDate: (%s) \nendDate: (%s)", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    uint64_t v32 = v25;
    unint64_t v15 = v24;
    MEMORY[0x24C574E00](v32, -1, -1);
    MEMORY[0x24C574E00](v23, -1, -1);

    if (!*(void *)(v1 + 24)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  swift_release_n();
  if (*(void *)(v1 + 24))
  {
LABEL_11:
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_248175130();
    char v34 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v54 = v15;
    sub_247FB7E94(v33, 0x43746E756F636361, 0xEC0000007373616CLL, v34);
    unint64_t v15 = v54;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_12:
  int v35 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_didSucceed);
  if (v35 != 2)
  {
    id v36 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v35 & 1);
    char v37 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v54 = v15;
    sub_247FB7E94((uint64_t)v36, 0x6563637553646964, 0xEA00000000006465, v37);
    unint64_t v15 = v54;
    swift_bridgeObjectRelease();
  }
  return v15;
}

uint64_t _s12AppleIDSetup22AISSetupAnalyticsEventC4nameSSvg_0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_name);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AISSetupAnalyticsEvent.init()()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  uint64_t v1 = v0 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_startDate;
  uint64_t v2 = sub_248174850();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
  v3(v0 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_endDate, 1, 1, v2);
  *(unsigned char *)(v0 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_didSucceed) = 0;
  uint64_t v4 = OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_analytics;
  type metadata accessor for AISAnalytics();
  *(void *)(v0 + v4) = swift_initStaticObject();
  uint64_t v5 = (void *)(v0 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_name);
  *uint64_t v5 = 0xD00000000000001CLL;
  v5[1] = 0x8000000248192060;
  return v0;
}

uint64_t sub_248171D54(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D73E0);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_248174850();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for IdMSAccount();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a1 + 24);
  uint64_t v15 = *(void *)(a1 + 32);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_didSucceed) = 1;
  if (v15)
  {
    uint64_t v59 = v7;
    unsigned int v60 = v6;
    uint64_t v58 = v10;
    uint64_t v16 = self;
    swift_bridgeObjectRetain();
    id v17 = objc_msgSend(v16, sel_sharedInstance);
    uint64_t v18 = (void *)sub_248175130();
    id v19 = objc_msgSend(v17, sel_authKitAccountWithAltDSID_, v18);

    if (v19)
    {
      ACAccount.into(with:)(v17, v13);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();

      id v30 = [v16 (SEL)0x265238A25];
      uint64_t v31 = *((void *)v13 + 1);
      uint64_t v32 = *((void *)v13 + 2);
      uint64_t v33 = *((void *)v13 + 9);
      v61[0] = *(void *)v13;
      v61[1] = v31;
      v61[2] = v32;
      long long v34 = *(_OWORD *)(v13 + 40);
      long long v62 = *(_OWORD *)(v13 + 24);
      long long v63 = v34;
      long long v64 = *(_OWORD *)(v13 + 56);
      uint64_t v65 = v33;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v57 = v30;
      id v49 = sub_248017AA0(v61, v30);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_248172530(v49);
      uint64_t v50 = v58;
      sub_248174840();
      uint64_t v51 = v59;
      uint64_t v52 = (uint64_t)v60;
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v60, v50, v59);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v52, 0, 1, v51);
      uint64_t v53 = v2 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_endDate;
      swift_beginAccess();
      sub_24809F780(v52, v53);
      swift_endAccess();
      uint64_t v54 = swift_retain();
      sub_24809F8B8(v54);

      swift_release();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v50, v51);
      return sub_2480162C4((uint64_t)v13);
    }
    else
    {
      sub_248017F18();
      unint64_t v28 = (void *)swift_allocError();
      *(void *)uint64_t v29 = v14;
      *(void *)(v29 + 8) = v15;
      *(unsigned char *)(v29 + 16) = 1;
      swift_bridgeObjectRetain();
      swift_willThrow();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();

      if (qword_2692D4D70 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_248174B90();
      __swift_project_value_buffer(v35, (uint64_t)qword_2692D6A78);
      id v36 = v28;
      id v37 = v28;
      long long v38 = sub_248174B70();
      os_log_type_t v39 = sub_2481755D0();
      if (os_log_type_enabled(v38, v39))
      {
        double v40 = (uint8_t *)swift_slowAlloc();
        id v41 = (void *)swift_slowAlloc();
        *(_DWORD *)double v40 = 138412290;
        id v42 = v28;
        uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
        v61[0] = v43;
        sub_248175730();
        *id v41 = v43;

        _os_log_impl(&dword_247F93000, v38, v39, "Missing account class found for the account: %@", v40, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2692D96F0);
        swift_arrayDestroy();
        MEMORY[0x24C574E00](v41, -1, -1);
        MEMORY[0x24C574E00](v40, -1, -1);
      }
      else
      {
      }
      uint64_t v45 = v58;
      uint64_t v44 = v59;

      sub_248174840();
      uint64_t v46 = (uint64_t)v60;
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v60, v45, v44);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v46, 0, 1, v44);
      uint64_t v47 = v2 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_endDate;
      swift_beginAccess();
      sub_24809F780(v46, v47);
      swift_endAccess();
      uint64_t v48 = swift_retain();
      sub_24809F8B8(v48);
      swift_release();

      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v45, v44);
    }
  }
  else
  {
    if (qword_2692D4D70 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_248174B90();
    __swift_project_value_buffer(v20, (uint64_t)qword_2692D6A78);
    uint64_t v21 = sub_248174B70();
    os_log_type_t v22 = sub_2481755D0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = v6;
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl(&dword_247F93000, v21, v22, "Setup report is missing altDSID. Ending analytics event with missing account class.", v24, 2u);
      uint64_t v25 = v24;
      char v6 = v23;
      MEMORY[0x24C574E00](v25, -1, -1);
    }

    sub_248174840();
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    uint64_t v26 = v2 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_endDate;
    swift_beginAccess();
    sub_24809F780((uint64_t)v6, v26);
    swift_endAccess();
    uint64_t v27 = swift_retain();
    sub_24809F8B8(v27);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

id sub_248172530(void *a1)
{
  uint64_t v2 = v1;
  if (objc_msgSend(a1, sel_isNull))
  {
    if (qword_2692D4D70 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_248174B90();
    __swift_project_value_buffer(v4, (uint64_t)qword_2692D6A78);
    id v5 = a1;
    char v6 = sub_248174B70();
    os_log_type_t v7 = sub_2481755D0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = (void *)swift_slowAlloc();
      id v16 = v5;
      *(_DWORD *)uint64_t v8 = 138412290;
      id v9 = v5;
      sub_248175730();
      *uint64_t v15 = v5;

      _os_log_impl(&dword_247F93000, v6, v7, "Missing account class found for the account %@", v8, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692D96F0);
      swift_arrayDestroy();
      MEMORY[0x24C574E00](v15, -1, -1);
      MEMORY[0x24C574E00](v8, -1, -1);
    }
    else
    {
    }
  }
  id result = objc_msgSend(a1, sel_aa_accountClass, v15, v16);
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = sub_248175160();
    uint64_t v14 = v13;

    *(void *)(v2 + 16) = v12;
    *(void *)(v2 + 24) = v14;
    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t AISSetupAnalyticsEvent.deinit()
{
  swift_bridgeObjectRelease();
  sub_2480F30EC(v0 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_startDate);
  sub_2480F30EC(v0 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_endDate);
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AISSetupAnalyticsEvent.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_2480F30EC(v0 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_startDate);
  sub_2480F30EC(v0 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_endDate);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24817282C()
{
  return sub_2481715A4();
}

uint64_t sub_248172850()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC12AppleIDSetup22AISSetupAnalyticsEvent_name);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_248172890()
{
  return type metadata accessor for AISSetupAnalyticsEvent();
}

uint64_t type metadata accessor for AISSetupAnalyticsEvent()
{
  uint64_t result = qword_2692DC948;
  if (!qword_2692DC948) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2481728E4()
{
  sub_2480F3D04();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AISSetupAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AISSetupAnalyticsEvent);
}

uint64_t dispatch thunk of AISSetupAnalyticsEvent.payload.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of AISSetupAnalyticsEvent.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of AISSetupAnalyticsEvent.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_248172A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2481759A0();
  id v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_248172A88(uint64_t a1)
{
  uint64_t v2 = sub_2481759A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_248172AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2481759A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_248172B50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2481759A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_248172BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2481759A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_248172C18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2481759A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_248172C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_248172C90);
}

uint64_t sub_248172C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2481759A0();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_248172CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_248172D10);
}

uint64_t sub_248172D10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2481759A0();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CodingUserInfoKeyNotFound()
{
  uint64_t result = qword_2692DC958;
  if (!qword_2692DC958) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_248172DCC()
{
  uint64_t result = sub_2481759A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_248172E58()
{
  uint64_t v0 = sub_248175EE0();
  sub_248175F10();
  return v0;
}

uint64_t sub_248172EA0@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D52B0);
  *a2 = a1;
  swift_bridgeObjectRetain();
  sub_248175850();
  swift_bridgeObjectRelease();
  sub_248175FB0();
  sub_2481751D0();
  swift_bridgeObjectRelease();
  sub_2481751D0();
  sub_2481751D0();
  sub_248175880();
  uint64_t v4 = *MEMORY[0x263F8DCB0];
  uint64_t v5 = sub_2481758A0();
  char v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);
  return v6(a2, v4, v5);
}

uint64_t sub_248173000()
{
  return 0;
}

uint64_t DefaultObjcArchiver.encoder.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247FF649C(v1 + OBJC_IVAR____TtC12AppleIDSetup19DefaultObjcArchiver_encoder, a1);
}

id DefaultObjcArchiver.__allocating_init(requiringSecureCoding:backing:)(char a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  sub_247FF649C(a2, (uint64_t)v5 + OBJC_IVAR____TtC12AppleIDSetup19DefaultObjcArchiver_encoder);
  v8.receiver = v5;
  v8.super_class = v2;
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  objc_msgSend(v6, sel_setRequiresSecureCoding_, a1 & 1);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v6;
}

id DefaultObjcArchiver.init(requiringSecureCoding:backing:)(char a1, uint64_t a2)
{
  sub_247FF649C(a2, (uint64_t)v2 + OBJC_IVAR____TtC12AppleIDSetup19DefaultObjcArchiver_encoder);
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for DefaultObjcArchiver();
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  objc_msgSend(v5, sel_setRequiresSecureCoding_, a1 & 1);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v5;
}

uint64_t type metadata accessor for DefaultObjcArchiver()
{
  return self;
}

uint64_t static DefaultObjcArchiver.archivedData<A>(for:backing:)(uint64_t a1, uint64_t a2)
{
  sub_247FF649C(a2, (uint64_t)v10);
  uint64_t v3 = (objc_class *)type metadata accessor for DefaultObjcArchiver();
  id v4 = objc_allocWithZone(v3);
  sub_247FF649C((uint64_t)v10, (uint64_t)v4 + OBJC_IVAR____TtC12AppleIDSetup19DefaultObjcArchiver_encoder);
  v9.receiver = v4;
  v9.super_class = v3;
  id v5 = objc_msgSendSuper2(&v9, sel_init);
  objc_msgSend(v5, sel_setRequiresSecureCoding_, 1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  objc_msgSend(v5, sel_setOutputFormat_, 200);
  objc_msgSend(v5, sel_encodeObject_forKey_, a1, *MEMORY[0x263F081D0]);
  objc_msgSend(v5, sel_finishEncoding);
  id v6 = objc_msgSend(v5, sel_encodedData);
  uint64_t v7 = sub_2481747D0();

  return v7;
}

uint64_t sub_248173304(uint64_t a1)
{
  sub_247FBB338(a1, (uint64_t)v26, (uint64_t *)&unk_26B13BED0);
  if (v27)
  {
    sub_248173658();
    if (swift_dynamicCast())
    {
      uint64_t v3 = (void *)v24[0];
      sub_247FF649C((uint64_t)v1 + OBJC_IVAR____TtC12AppleIDSetup19DefaultObjcArchiver_encoder, (uint64_t)v26);
      sub_247FF649C((uint64_t)v26, (uint64_t)v24);
      id v4 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(qword_2692D9278);
      id v5 = objc_allocWithZone(v4);
      id v6 = (void *)MEMORY[0x263F8EED0];
      uint64_t v7 = (void **)((char *)v5 + *(void *)((*MEMORY[0x263F8EED0] & *v5) + 0x68));
      *uint64_t v7 = 0;
      objc_super v8 = (char *)v5 + *(void *)((*v6 & *v5) + 0x70);
      *(void *)objc_super v8 = 0;
      v8[8] = 1;
      sub_247FBB338((uint64_t)v24, (uint64_t)v5 + *(void *)((*v6 & *v5) + 0x60), &qword_2692D9268);
      swift_beginAccess();
      objc_super v9 = *v7;
      *uint64_t v7 = v3;
      id v10 = v3;
      uint64_t v11 = v5;

      swift_beginAccess();
      *(void *)objc_super v8 = 0;
      v8[8] = 1;

      v23.receiver = v11;
      v23.super_class = v4;
      id v12 = objc_msgSendSuper2(&v23, sel_init);

      sub_247FB33D4((uint64_t)v24, &qword_2692D9268);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      uint64_t v27 = v4;

      v26[0] = v12;
      goto LABEL_6;
    }
  }
  else
  {
    sub_247FB33D4((uint64_t)v26, (uint64_t *)&unk_26B13BED0);
  }
  sub_247FBB338(a1, (uint64_t)v26, (uint64_t *)&unk_26B13BED0);
LABEL_6:
  sub_247FBB338((uint64_t)v26, (uint64_t)v24, (uint64_t *)&unk_26B13BED0);
  uint64_t v13 = v25;
  if (v25)
  {
    uint64_t v14 = __swift_project_boxed_opaque_existential_1(v24, v25);
    uint64_t v15 = *(void *)(v13 - 8);
    MEMORY[0x270FA5388](v14);
    id v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v15 + 16))(v17);
    uint64_t v18 = sub_248175CD0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v19 = (void *)sub_248175130();
  uint64_t v20 = (objc_class *)type metadata accessor for DefaultObjcArchiver();
  v28.receiver = v1;
  v28.super_class = v20;
  objc_msgSendSuper2(&v28, sel_encodeObject_forKey_, v18, v19);
  swift_unknownObjectRelease();

  return sub_247FB33D4((uint64_t)v26, (uint64_t *)&unk_26B13BED0);
}

unint64_t sub_248173658()
{
  unint64_t result = qword_2692DC970;
  if (!qword_2692DC970)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2692DC970);
  }
  return result;
}

id DefaultObjcArchiver.__allocating_init(requiringSecureCoding:)(char a1)
{
  id v3 = objc_allocWithZone(v1);
  return objc_msgSend(v3, sel_initRequiringSecureCoding_, a1 & 1);
}

void DefaultObjcArchiver.init(requiringSecureCoding:)()
{
}

id DefaultObjcArchiver.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void DefaultObjcArchiver.init()()
{
}

id DefaultObjcArchiver.__allocating_init(forWritingWith:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initForWritingWithMutableData_, a1);

  return v3;
}

void DefaultObjcArchiver.init(forWritingWith:)()
{
}

id DefaultObjcArchiver.__deallocating_deinit()
{
  return sub_24817422C(type metadata accessor for DefaultObjcArchiver);
}

uint64_t sub_248173964@<X0>(uint64_t a1@<X8>)
{
  return sub_247FF649C(*v1 + OBJC_IVAR____TtC12AppleIDSetup19DefaultObjcArchiver_encoder, a1);
}

uint64_t sub_248173990(uint64_t a1, uint64_t a2)
{
  return static DefaultObjcArchiver.archivedData<A>(for:backing:)(a1, a2);
}

uint64_t DefaultObjcUnarchiver.decoder.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247FF649C(v1 + OBJC_IVAR____TtC12AppleIDSetup21DefaultObjcUnarchiver_decoder, a1);
}

id DefaultObjcUnarchiver.__allocating_init(forReadingFrom:backing:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_2481742CC(a1, a2, a3);
  sub_247FB6CCC(a1, a2);
  return v8;
}

id DefaultObjcUnarchiver.init(forReadingFrom:backing:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v5 = sub_2481742CC(a1, a2, a3);
  sub_247FB6CCC(a1, a2);
  return v5;
}

uint64_t static DefaultObjcUnarchiver.unarchivedObject<A>(ofType:from:backing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_247FF649C(a4, (uint64_t)v12);
  id v9 = objc_allocWithZone((Class)type metadata accessor for DefaultObjcUnarchiver());
  sub_247FB6C20(a2, a3);
  id v10 = sub_2481742CC(a2, a3, (uint64_t)v12);
  sub_247FB6CCC(a2, a3);
  if (!v5)
  {
    objc_msgSend(v10, sel_setRequiresSecureCoding_, 1);
    objc_msgSend(v10, sel_setDecodingFailurePolicy_, 1);
    sub_248175160();
    a5 = sub_2481756A0();
    swift_bridgeObjectRelease();
  }
  return a5;
}

void sub_248173BB0(uint64_t a1@<X8>)
{
  id v3 = (void *)sub_248175130();
  v18.receiver = v1;
  v18.super_class = (Class)type metadata accessor for DefaultObjcUnarchiver();
  id v4 = objc_msgSendSuper2(&v18, sel_decodeObjectForKey_, v3);

  if (v4)
  {
    sub_248175760();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  sub_2481743F0((uint64_t)&v16, (uint64_t)v19);
  sub_247FBB338((uint64_t)v19, (uint64_t)&v16, (uint64_t *)&unk_26B13BED0);
  if (!*((void *)&v17 + 1))
  {
    sub_247FB33D4((uint64_t)&v16, (uint64_t *)&unk_26B13BED0);
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_2692D9278);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    sub_2481743F0((uint64_t)v19, a1);
    return;
  }
  uint64_t v5 = OBJC_IVAR____TtC12AppleIDSetup21DefaultObjcUnarchiver_decoder;
  id v6 = (void *)MEMORY[0x263F8EED0];
  id v7 = (char *)v14 + *(void *)((*MEMORY[0x263F8EED0] & *v14) + 0x70);
  swift_beginAccess();
  if (v7[8])
  {
    sub_247FB33D4((uint64_t)v19, (uint64_t *)&unk_26B13BED0);

    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  else
  {
    id v8 = &v1[v5];
    uint64_t v15 = *(void *)v7;
    unint64_t v9 = sub_248173658();
    id v10 = static NSXPCListenerEndpoint.developedUnarchive(from:backing:)(&v15, v8);
    uint64_t v11 = (void **)((char *)v14 + *(void *)((*v6 & *v14) + 0x68));
    swift_beginAccess();
    id v12 = *v11;
    *uint64_t v11 = v10;

    *(void *)id v7 = 0;
    v7[8] = 1;
    *(void *)(a1 + 24) = v9;
    uint64_t v13 = v10;

    *(void *)a1 = v13;
    sub_247FB33D4((uint64_t)v19, (uint64_t *)&unk_26B13BED0);
  }
}

id DefaultObjcUnarchiver.__allocating_init(forReadingFrom:)(uint64_t a1, unint64_t a2)
{
  id v3 = v2;
  v12[1] = *(id *)MEMORY[0x263EF8340];
  id v6 = objc_allocWithZone(v3);
  id v7 = (void *)sub_2481747C0();
  v12[0] = 0;
  id v8 = objc_msgSend(v6, sel_initForReadingFromData_error_, v7, v12);

  if (v8)
  {
    id v9 = v12[0];
  }
  else
  {
    id v10 = v12[0];
    sub_248174730();

    swift_willThrow();
  }
  sub_247FB6CCC(a1, a2);
  return v8;
}

void DefaultObjcUnarchiver.init(forReadingFrom:)()
{
}

void DefaultObjcUnarchiver.init()()
{
}

id DefaultObjcUnarchiver.__allocating_init(forReadingWith:)(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = (void *)sub_2481747C0();
  id v7 = objc_msgSend(v5, sel_initForReadingWithData_, v6);
  sub_247FB6CCC(a1, a2);

  return v7;
}

void DefaultObjcUnarchiver.init(forReadingWith:)()
{
}

id DefaultObjcUnarchiver.__deallocating_deinit()
{
  return sub_24817422C(type metadata accessor for DefaultObjcUnarchiver);
}

id sub_24817422C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_248174288@<X0>(uint64_t a1@<X8>)
{
  return sub_247FF649C(*v1 + OBJC_IVAR____TtC12AppleIDSetup21DefaultObjcUnarchiver_decoder, a1);
}

uint64_t sub_2481742B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  return static DefaultObjcUnarchiver.unarchivedObject<A>(ofType:from:backing:)(a1, a2, a3, a4, a5);
}

id sub_2481742CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  sub_247FF649C(a3, (uint64_t)v3 + OBJC_IVAR____TtC12AppleIDSetup21DefaultObjcUnarchiver_decoder);
  id v5 = (void *)sub_2481747C0();
  v11[0] = 0;
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for DefaultObjcUnarchiver();
  id v6 = objc_msgSendSuper2(&v10, sel_initForReadingFromData_error_, v5, v11);

  if (v6)
  {
    id v7 = v11[0];
  }
  else
  {
    id v8 = v11[0];
    sub_248174730();

    swift_willThrow();
  }
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v6;
}

uint64_t type metadata accessor for DefaultObjcUnarchiver()
{
  return self;
}

uint64_t sub_2481743F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B13BED0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t method lookup function for DefaultObjcArchiver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DefaultObjcArchiver);
}

uint64_t dispatch thunk of DefaultObjcArchiver.__allocating_init(requiringSecureCoding:backing:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for DefaultObjcUnarchiver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DefaultObjcUnarchiver);
}

uint64_t dispatch thunk of DefaultObjcUnarchiver.__allocating_init(forReadingFrom:backing:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_248174550()
{
  return MEMORY[0x270EED980]();
}

uint64_t sub_248174560()
{
  return MEMORY[0x270EEDA20]();
}

uint64_t sub_248174570()
{
  return MEMORY[0x270EEDA90]();
}

uint64_t sub_248174580()
{
  return MEMORY[0x270EEDAA0]();
}

uint64_t sub_248174590()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_2481745A0()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_2481745B0()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_2481745C0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_2481745D0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2481745E0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2481745F0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_248174600()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_248174610()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_248174620()
{
  return MEMORY[0x270EEE440]();
}

uint64_t sub_248174640()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_248174650()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_248174660()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_248174670()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_248174680()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_248174690()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2481746A0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2481746B0()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_2481746C0()
{
  return MEMORY[0x270EEF388]();
}

uint64_t sub_2481746D0()
{
  return MEMORY[0x270EEF3E0]();
}

uint64_t sub_2481746E0()
{
  return MEMORY[0x270EEF408]();
}

uint64_t sub_2481746F0()
{
  return MEMORY[0x270EEF450]();
}

uint64_t sub_248174700()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_248174710()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_248174720()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_248174730()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_248174740()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_248174750()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_248174760()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_248174770()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_248174780()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_248174790()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2481747A0()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_2481747B0()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_2481747C0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2481747D0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2481747E0()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_2481747F0()
{
  return MEMORY[0x270EF0290]();
}

uint64_t sub_248174800()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_248174810()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_248174820()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_248174830()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_248174840()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_248174850()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_248174860()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_248174870()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_248174880()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_248174890()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2481748A0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2481748B0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2481748C0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2481748D0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_2481748E0()
{
  return MEMORY[0x270EF0ED0]();
}

uint64_t sub_2481748F0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_248174900()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_248174910()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_248174920()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_248174930()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_248174940()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_248174950()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_248174960()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_248174970()
{
  return MEMORY[0x270F284F8]();
}

uint64_t sub_248174980()
{
  return MEMORY[0x270F28500]();
}

uint64_t sub_248174990()
{
  return MEMORY[0x270F28508]();
}

uint64_t sub_2481749A0()
{
  return MEMORY[0x270F28510]();
}

uint64_t sub_2481749B0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2481749D0()
{
  return MEMORY[0x270F08370]();
}

uint64_t sub_2481749E0()
{
  return MEMORY[0x270F08378]();
}

uint64_t sub_2481749F0()
{
  return MEMORY[0x270F08380]();
}

uint64_t sub_248174A00()
{
  return MEMORY[0x270F08388]();
}

uint64_t sub_248174A10()
{
  return MEMORY[0x270F08390]();
}

uint64_t sub_248174A20()
{
  return MEMORY[0x270F08398]();
}

uint64_t sub_248174A30()
{
  return MEMORY[0x270F083A0]();
}

uint64_t sub_248174A40()
{
  return MEMORY[0x270F083A8]();
}

uint64_t sub_248174A50()
{
  return MEMORY[0x270F083B8]();
}

uint64_t sub_248174A60()
{
  return MEMORY[0x270F083C0]();
}

uint64_t sub_248174A70()
{
  return MEMORY[0x270F18140]();
}

uint64_t sub_248174A80()
{
  return MEMORY[0x270F18160]();
}

uint64_t sub_248174A90()
{
  return MEMORY[0x270F18168]();
}

uint64_t sub_248174AA0()
{
  return MEMORY[0x270F18188]();
}

uint64_t sub_248174AB0()
{
  return MEMORY[0x270F18190]();
}

uint64_t sub_248174AC0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_248174AD0()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_248174AE0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_248174AF0()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_248174B00()
{
  return MEMORY[0x270FA2D68]();
}

uint64_t sub_248174B10()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_248174B20()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_248174B30()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_248174B40()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_248174B50()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_248174B60()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_248174B70()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_248174B80()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_248174B90()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_248174BA0()
{
  return MEMORY[0x270FA1A18]();
}

uint64_t sub_248174BB0()
{
  return MEMORY[0x270FA1A20]();
}

uint64_t sub_248174BC0()
{
  return MEMORY[0x270FA1A88]();
}

uint64_t sub_248174BD0()
{
  return MEMORY[0x270FA1AB0]();
}

uint64_t sub_248174BE0()
{
  return MEMORY[0x270FA1AC0]();
}

uint64_t sub_248174BF0()
{
  return MEMORY[0x270FA1AF0]();
}

uint64_t sub_248174C00()
{
  return MEMORY[0x270FA1B00]();
}

uint64_t sub_248174C10()
{
  return MEMORY[0x270FA1B10]();
}

uint64_t sub_248174C20()
{
  return MEMORY[0x270FA1B18]();
}

uint64_t sub_248174C30()
{
  return MEMORY[0x270FA1B20]();
}

uint64_t sub_248174C40()
{
  return MEMORY[0x270FA1B30]();
}

uint64_t sub_248174C50()
{
  return MEMORY[0x270FA1B48]();
}

uint64_t sub_248174C60()
{
  return MEMORY[0x270FA1B58]();
}

uint64_t sub_248174C70()
{
  return MEMORY[0x270FA1B70]();
}

uint64_t sub_248174C80()
{
  return MEMORY[0x270FA1B90]();
}

uint64_t sub_248174C90()
{
  return MEMORY[0x270FA1BA0]();
}

uint64_t sub_248174CA0()
{
  return MEMORY[0x270FA1C88]();
}

uint64_t sub_248174CB0()
{
  return MEMORY[0x270FA1CB0]();
}

uint64_t sub_248174CC0()
{
  return MEMORY[0x270FA1D68]();
}

uint64_t sub_248174CD0()
{
  return MEMORY[0x270FA1D78]();
}

uint64_t sub_248174CE0()
{
  return MEMORY[0x270FA1D98]();
}

uint64_t sub_248174CF0()
{
  return MEMORY[0x270FA1DA0]();
}

uint64_t sub_248174D00()
{
  return MEMORY[0x270FA1DB0]();
}

uint64_t sub_248174D10()
{
  return MEMORY[0x270FA1DD0]();
}

uint64_t sub_248174D20()
{
  return MEMORY[0x270FA1DD8]();
}

uint64_t sub_248174D30()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_248174D40()
{
  return MEMORY[0x270FA09B8]();
}

uint64_t sub_248174D50()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_248174D60()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_248174D70()
{
  return MEMORY[0x270FA0A38]();
}

uint64_t sub_248174D80()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_248174D90()
{
  return MEMORY[0x270EEA998]();
}

uint64_t sub_248174DA0()
{
  return MEMORY[0x270EEA9B0]();
}

uint64_t sub_248174DB0()
{
  return MEMORY[0x270EEA9C0]();
}

uint64_t sub_248174DC0()
{
  return MEMORY[0x270EEA9E8]();
}

uint64_t sub_248174DD0()
{
  return MEMORY[0x270EEA9F8]();
}

uint64_t sub_248174DE0()
{
  return MEMORY[0x270EEAA00]();
}

uint64_t sub_248174DF0()
{
  return MEMORY[0x270EEAA10]();
}

uint64_t sub_248174E00()
{
  return MEMORY[0x270EEAA18]();
}

uint64_t sub_248174E10()
{
  return MEMORY[0x270EEAA20]();
}

uint64_t sub_248174E20()
{
  return MEMORY[0x270EEAA30]();
}

uint64_t sub_248174E30()
{
  return MEMORY[0x270EEAA38]();
}

uint64_t sub_248174E40()
{
  return MEMORY[0x270EEAA40]();
}

uint64_t sub_248174E50()
{
  return MEMORY[0x270EEAA48]();
}

uint64_t sub_248174E60()
{
  return MEMORY[0x270EEAA50]();
}

uint64_t sub_248174E70()
{
  return MEMORY[0x270EEAA58]();
}

uint64_t sub_248174E80()
{
  return MEMORY[0x270EEAA60]();
}

uint64_t sub_248174E90()
{
  return MEMORY[0x270EEAA68]();
}

uint64_t sub_248174EA0()
{
  return MEMORY[0x270EEAA70]();
}

uint64_t sub_248174EB0()
{
  return MEMORY[0x270EEAAD8]();
}

uint64_t sub_248174EC0()
{
  return MEMORY[0x270EEAAE8]();
}

uint64_t sub_248174ED0()
{
  return MEMORY[0x270EEAAF0]();
}

uint64_t sub_248174EE0()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_248174EF0()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t _s9CryptoKit13SecureEnclaveO4P256O7SigningO10PrivateKeyV12AppleIDSetupE17rawRepresentation10Foundation4DataVvg_0()
{
  return MEMORY[0x270EEAB78]();
}

uint64_t sub_248174F10()
{
  return MEMORY[0x270EEAB80]();
}

uint64_t sub_248174F20()
{
  return MEMORY[0x270EEABA8]();
}

uint64_t sub_248174F30()
{
  return MEMORY[0x270EEABB0]();
}

uint64_t sub_248174F40()
{
  return MEMORY[0x270EEABC0]();
}

uint64_t sub_248174F50()
{
  return MEMORY[0x270EEAC28]();
}

uint64_t sub_248174F60()
{
  return MEMORY[0x270EEAE90]();
}

uint64_t sub_248174F70()
{
  return MEMORY[0x270EEAE98]();
}

uint64_t sub_248174F80()
{
  return MEMORY[0x270EEAFB0]();
}

uint64_t sub_248174F90()
{
  return MEMORY[0x270EEAFB8]();
}

uint64_t sub_248174FA0()
{
  return MEMORY[0x270EEAFD0]();
}

uint64_t sub_248174FB0()
{
  return MEMORY[0x270EEAFD8]();
}

uint64_t sub_248174FC0()
{
  return MEMORY[0x270EEAFE0]();
}

uint64_t sub_248174FD0()
{
  return MEMORY[0x270EEAFE8]();
}

uint64_t sub_248174FE0()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_248174FF0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_248175000()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_248175010()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_248175020()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_248175030()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_248175040()
{
  return MEMORY[0x270F9D120]();
}

uint64_t sub_248175050()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_248175060()
{
  return MEMORY[0x270F9D1E8]();
}

uint64_t sub_248175080()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_248175090()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_2481750A0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2481750B0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2481750C0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2481750D0()
{
  return MEMORY[0x270F9D4A0]();
}

uint64_t sub_2481750E0()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t sub_2481750F0()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t sub_248175100()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_248175110()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_248175120()
{
  return MEMORY[0x270EF1968]();
}

uint64_t sub_248175130()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_248175140()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_248175150()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_248175160()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_248175170()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_248175180()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_248175190()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2481751A0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2481751B0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2481751C0()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_2481751D0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2481751E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2481751F0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_248175200()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_248175210()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_248175220()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_248175230()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_248175240()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_248175250()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_248175260()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_248175270()
{
  return MEMORY[0x270F9DAC8]();
}

uint64_t sub_2481752B0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2481752C0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_2481752D0()
{
  return MEMORY[0x270F9DB48]();
}

uint64_t sub_2481752E0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2481752F0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_248175300()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_248175310()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_248175320()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_248175330()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_248175340()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_248175350()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_248175360()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_248175370()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_248175390()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2481753A0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2481753B0()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t sub_2481753C0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2481753D0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2481753E0()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t sub_2481753F0()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_248175400()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t sub_248175410()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_248175420()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_248175430()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_248175440()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_248175460()
{
  return MEMORY[0x270FA1F78]();
}

uint64_t sub_248175470()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_248175480()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_2481754A0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2481754C0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_2481754D0()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_2481754F0()
{
  return MEMORY[0x270FA2060]();
}

uint64_t sub_248175500()
{
  return MEMORY[0x270FA2070]();
}

uint64_t sub_248175510()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_248175520()
{
  return MEMORY[0x270EF1CB8]();
}

uint64_t sub_248175530()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_248175540()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_248175550()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_248175560()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_248175570()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_248175580()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_248175590()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_2481755A0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_2481755B0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2481755C0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2481755D0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2481755E0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2481755F0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_248175600()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_248175610()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_248175620()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_248175630()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_248175640()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_248175650()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_248175660()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_248175670()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_248175680()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_248175690()
{
  return MEMORY[0x270EF2120]();
}

uint64_t sub_2481756A0()
{
  return MEMORY[0x270EF2138]();
}

uint64_t sub_2481756B0()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_2481756C0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2481756D0()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_2481756E0()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_2481756F0()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_248175700()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_248175710()
{
  return MEMORY[0x270F9E3D0]();
}

uint64_t sub_248175720()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_248175730()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_248175740()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_248175750()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_248175760()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_248175770()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_248175780()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_2481757A0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2481757B0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2481757C0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2481757D0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_2481757E0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_2481757F0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_248175800()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_248175810()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_248175820()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_248175830()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_248175840()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_248175850()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_248175860()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_248175870()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_248175880()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_248175890()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_2481758A0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2481758B0()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_2481758C0()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_2481758D0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2481758F0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_248175900()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_248175910()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_248175920()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_248175930()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_248175940()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_248175950()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_248175960()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_248175970()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_248175980()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_248175990()
{
  return MEMORY[0x270FA1DE8]();
}

uint64_t sub_2481759A0()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_2481759B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2481759C0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2481759D0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2481759E0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2481759F0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_248175A00()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_248175A10()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_248175A30()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_248175A50()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_248175A60()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_248175A70()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_248175A80()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_248175A90()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_248175AA0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_248175AB0()
{
  return MEMORY[0x270F9F2C8]();
}

uint64_t sub_248175AC0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_248175AD0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_248175AE0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_248175AF0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_248175B00()
{
  return MEMORY[0x270F9F340]();
}

uint64_t sub_248175B10()
{
  return MEMORY[0x270F9F348]();
}

uint64_t sub_248175B20()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_248175B30()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_248175B40()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_248175B50()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_248175B60()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_248175B70()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_248175B80()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_248175B90()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_248175BA0()
{
  return MEMORY[0x270F9F400]();
}

uint64_t sub_248175BB0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_248175BC0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_248175BD0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_248175BE0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_248175BF0()
{
  return MEMORY[0x270F9F480]();
}

uint64_t sub_248175C00()
{
  return MEMORY[0x270F9F488]();
}

uint64_t sub_248175C10()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_248175C20()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_248175C30()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_248175C50()
{
  return MEMORY[0x270F9F570]();
}

uint64_t sub_248175C60()
{
  return MEMORY[0x270F9F588]();
}

uint64_t sub_248175C70()
{
  return MEMORY[0x270F9F590]();
}

uint64_t sub_248175C80()
{
  return MEMORY[0x270F9F650]();
}

uint64_t sub_248175C90()
{
  return MEMORY[0x270F9F668]();
}

uint64_t sub_248175CA0()
{
  return MEMORY[0x270F9F670]();
}

uint64_t sub_248175CB0()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_248175CC0()
{
  return MEMORY[0x270F24B10]();
}

uint64_t sub_248175CD0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_248175CE0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_248175CF0()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_248175D00()
{
  return MEMORY[0x270F9F858]();
}

uint64_t sub_248175D10()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_248175D20()
{
  return MEMORY[0x270F9F8F0]();
}

uint64_t sub_248175D50()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_248175D60()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_248175D70()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_248175D80()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_248175D90()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_248175DE0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_248175DF0()
{
  return MEMORY[0x270F24B20]();
}

uint64_t sub_248175E00()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_248175E10()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_248175E20()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_248175E30()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_248175E40()
{
  return MEMORY[0x270F9FC20]();
}

uint64_t sub_248175E50()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_248175E60()
{
  return MEMORY[0x270F9FC50]();
}

uint64_t sub_248175E70()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_248175E80()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_248175E90()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_248175EA0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_248175EB0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_248175EC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_248175ED0()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_248175EE0()
{
  return MEMORY[0x270F9FD50]();
}

uint64_t sub_248175EF0()
{
  return MEMORY[0x270F9FD58]();
}

uint64_t sub_248175F00()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_248175F10()
{
  return MEMORY[0x270F9FD68]();
}

uint64_t sub_248175F20()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_248175F30()
{
  return MEMORY[0x270F9FD80]();
}

uint64_t sub_248175F40()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_248175F50()
{
  return MEMORY[0x270F9FD90]();
}

uint64_t sub_248175F60()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_248175F70()
{
  return MEMORY[0x270F9FF78]();
}

uint64_t sub_248175F80()
{
  return MEMORY[0x270F9FFB8]();
}

uint64_t sub_248175FB0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

uint64_t GestaltProductTypeStringToDeviceClass()
{
  return MEMORY[0x270F241A8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x270F960F0]();
}

uint64_t NSErrorToOSStatus()
{
  return MEMORY[0x270F244B0]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x270EFD650](allocator, protection, flags, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getFunctionTypeMetadata()
{
  return MEMORY[0x270FA0380]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x270FA0390]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}