uint64_t PinnedContentDaemonStore.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t vars8;

  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t type metadata accessor for PinnedContentDarwinNotificationPoster()
{
  return self;
}

uint64_t sub_250D421CC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = type metadata accessor for PinnedContentDarwinNotificationPoster();
  v13 = &protocol witness table for PinnedContentDarwinNotificationPoster;
  *(void *)&long long v11 = a2;
  *(void *)(a3 + 16) = a1;
  id v6 = a1;
  sub_250D5DD60();
  id v7 = objc_allocWithZone(MEMORY[0x263F43218]);
  v8 = (void *)sub_250D5DFF0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_initWithCategory_domainName_profile_, 100, v8, v6);

  *(void *)(a3 + 24) = v9;
  sub_250D437DC(&v11, a3 + 32);
  return a3;
}

uint64_t sub_250D423F0()
{
  sub_250D5E420();
  sub_250D5E060();
  swift_bridgeObjectRelease();
  sub_250D5E060();
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_profileIdentifier);
  id v2 = objc_msgSend(v1, sel_description);
  sub_250D5E010();

  sub_250D5E060();
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_250D5E060();
  MEMORY[0x253387450](v3);
  sub_250D5E060();
  swift_bridgeObjectRelease();
  return 91;
}

_WORD *sub_250D4250C()
{
  uint64_t v2 = sub_250D5DFA0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v66 = v2;
  uint64_t v67 = v3;
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v6 = (_WORD *)((char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  id v9 = (char *)v62 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)v62 - v11;
  MEMORY[0x270FA5388](v10);
  v14 = (char *)v62 - v13;
  uint64_t v15 = sub_250D5E140();
  if (!v1)
  {
    unint64_t v18 = v16;
    if (v16 >> 60 == 15)
    {
      if (sub_250D51234())
      {
        sub_250D57080();
        v19 = (void *)sub_250D5E1E0();
        sub_250D55FDC(v19);
        uint64_t v49 = v0[7];
        uint64_t v50 = v0[8];
        __swift_project_boxed_opaque_existential_1(v0 + 4, v49);
        (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v50);
        sub_250D5DF80();
        swift_retain_n();
        id v6 = v19;
        v51 = sub_250D5DF90();
        os_log_type_t v52 = sub_250D5E110();
        if (os_log_type_enabled(v51, v52))
        {
          uint64_t v54 = swift_slowAlloc();
          uint64_t v65 = swift_slowAlloc();
          uint64_t v70 = v65;
          *(_DWORD *)uint64_t v54 = 136315394;
          uint64_t v55 = sub_250D423F0();
          uint64_t v68 = sub_250D42E30(v55, v56, &v70);
          sub_250D5E250();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v54 + 12) = 2080;
          uint64_t v68 = sub_250D5E1D0();
          uint64_t v69 = v57;
          sub_250D5E3A0();
          id v58 = (id)HKSensitiveLogItem();
          swift_unknownObjectRelease();
          sub_250D5E270();
          swift_unknownObjectRelease();
          uint64_t v59 = sub_250D5E030();
          uint64_t v68 = sub_250D42E30(v59, v60, &v70);
          sub_250D5E250();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_250D3F000, v51, v52, "%s: Legacy store contains content but cloud store does not; migrated and persisted legacy content: %s",
            (uint8_t *)v54,
            0x16u);
          uint64_t v61 = v65;
          swift_arrayDestroy();
          MEMORY[0x253388320](v61, -1, -1);
          MEMORY[0x253388320](v54, -1, -1);
        }
        else
        {

          swift_release_n();
        }
        (*(void (**)(char *, uint64_t))(v67 + 8))(v9, v66);
      }
      else
      {
        sub_250D5DF80();
        swift_retain_n();
        v43 = sub_250D5DF90();
        os_log_type_t v44 = sub_250D5E110();
        if (os_log_type_enabled(v43, v44))
        {
          v45 = (uint8_t *)swift_slowAlloc();
          uint64_t v46 = swift_slowAlloc();
          uint64_t v68 = v46;
          *(_DWORD *)v45 = 136315138;
          uint64_t v65 = (uint64_t)(v45 + 4);
          uint64_t v47 = sub_250D423F0();
          uint64_t v70 = sub_250D42E30(v47, v48, &v68);
          sub_250D5E250();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_250D3F000, v43, v44, "%s: No local state; returning nil", v45, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x253388320](v46, -1, -1);
          MEMORY[0x253388320](v45, -1, -1);
        }
        else
        {

          swift_release_n();
        }
        (*(void (**)(_WORD *, uint64_t))(v67 + 8))(v6, v66);
        return 0;
      }
    }
    else
    {
      uint64_t v20 = v15;
      id v21 = objc_allocWithZone(MEMORY[0x263F431A0]);
      sub_250D43784(v20, v18);
      v22 = (void *)sub_250D5DE00();
      sub_250D4311C(v20, v18);
      id v6 = objc_msgSend(v21, sel_initWithData_, v22);

      if (v6)
      {
        sub_250D5DF80();
        swift_retain_n();
        v23 = v6;
        v24 = sub_250D5DF90();
        os_log_type_t v25 = sub_250D5E110();
        int v26 = v25;
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v27 = swift_slowAlloc();
          os_log_t v64 = v24;
          uint64_t v28 = v27;
          uint64_t v65 = swift_slowAlloc();
          uint64_t v68 = v65;
          *(_DWORD *)uint64_t v28 = 136315394;
          v62[1] = v28 + 4;
          int v63 = v26;
          uint64_t v29 = sub_250D423F0();
          uint64_t v70 = sub_250D42E30(v29, v30, &v68);
          v62[2] = &v71;
          sub_250D5E250();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v28 + 12) = 2080;
          uint64_t v31 = sub_250D5E1D0();
          uint64_t v70 = sub_250D42E30(v31, v32, &v68);
          sub_250D5E250();

          swift_bridgeObjectRelease();
          os_log_t v33 = v64;
          _os_log_impl(&dword_250D3F000, v64, (os_log_type_t)v63, "%s: Fetched content from local store: %s", (uint8_t *)v28, 0x16u);
          uint64_t v34 = v65;
          swift_arrayDestroy();
          MEMORY[0x253388320](v34, -1, -1);
          MEMORY[0x253388320](v28, -1, -1);

          sub_250D4311C(v20, v18);
        }
        else
        {
          sub_250D4311C(v20, v18);

          swift_release_n();
        }
        (*(void (**)(char *, uint64_t))(v67 + 8))(v14, v66);
      }
      else
      {
        sub_250D5DF80();
        swift_retain_n();
        v35 = sub_250D5DF90();
        os_log_type_t v36 = sub_250D5E100();
        if (os_log_type_enabled(v35, v36))
        {
          id v6 = (_WORD *)swift_slowAlloc();
          uint64_t v65 = swift_slowAlloc();
          uint64_t v70 = v65;
          *(_DWORD *)id v6 = 136315394;
          uint64_t v37 = sub_250D423F0();
          uint64_t v68 = sub_250D42E30(v37, v38, &v70);
          sub_250D5E250();
          swift_release_n();
          swift_bridgeObjectRelease();
          v6[6] = 2080;
          uint64_t v68 = 0;
          uint64_t v69 = 0;
          uint64_t v39 = sub_250D5E030();
          uint64_t v68 = sub_250D42E30(v39, v40, &v70);
          sub_250D5E250();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_250D3F000, v35, v36, "%s: Error decoding persisted state: %s", (uint8_t *)v6, 0x16u);
          uint64_t v41 = v65;
          swift_arrayDestroy();
          MEMORY[0x253388320](v41, -1, -1);
          MEMORY[0x253388320](v6, -1, -1);
        }
        else
        {

          swift_release_n();
        }
        (*(void (**)(char *, uint64_t))(v67 + 8))(v12, v66);
        sub_250D52780();
        swift_allocError();
        void *v42 = 0;
        v42[1] = 0;
        swift_willThrow();
        sub_250D4311C(v20, v18);
      }
    }
  }
  return v6;
}

uint64_t sub_250D42E30(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_250D42F60(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_250D42F04((uint64_t)v12, *a3);
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
      sub_250D42F04((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_250D42F04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_250D42F60(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_250D5E260();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_250D53854(a5, a6);
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
  uint64_t v8 = sub_250D5E2E0();
  if (!v8)
  {
    sub_250D5E330();
    __break(1u);
LABEL_17:
    uint64_t result = sub_250D5E360();
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

uint64_t sub_250D4311C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_250D43130(a1, a2);
  }
  return a1;
}

uint64_t sub_250D43130(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

void sub_250D43188(uint64_t a1, uint64_t a2, void (*a3)(void, void *), uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v11 = sub_250D5DFA0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v17 = (char *)v57 - v16;
  swift_bridgeObjectRetain();
  if (sub_250D5DD90())
  {
    sub_250D52780();
    os_log_t v33 = (void *)swift_allocError();
    *uint64_t v34 = a1;
    v34[1] = a2;
    swift_bridgeObjectRetain();
    a3(0, v33);
  }
  else
  {
    sub_250D5DF80();
    unint64_t v18 = sub_250D5DF90();
    os_log_type_t v19 = sub_250D5E110();
    BOOL v20 = os_log_type_enabled(v18, v19);
    os_log_t v64 = v15;
    uint64_t v61 = ObjectType;
    if (v20)
    {
      uint64_t v62 = v11;
      uint64_t v60 = a4;
      uint64_t v21 = swift_slowAlloc();
      int v63 = a3;
      v22 = (uint8_t *)v21;
      uint64_t v23 = swift_slowAlloc();
      v66[0] = v23;
      *(_DWORD *)v22 = 136315138;
      uint64_t v24 = sub_250D5E420();
      uint64_t v65 = sub_250D42E30(v24, v25, v66);
      sub_250D5E250();
      uint64_t v11 = v62;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250D3F000, v18, v19, "[%s] pinned content being fetched remotely", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253388320](v23, -1, -1);
      int v26 = v22;
      a3 = v63;
      MEMORY[0x253388320](v26, -1, -1);
    }

    uint64_t v27 = *(void (**)(char *, uint64_t))(v12 + 8);
    v27(v17, v11);
    id v28 = objc_msgSend(v5, sel_client);
    id v29 = objc_msgSend(v28, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    uint64_t v30 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    uint64_t inited = swift_initStackObject();
    sub_250D421CC(v29, v30, inited);
    id v32 = sub_250D4384C();
    swift_release();
    v35 = (void *)sub_250D5E170();
    os_log_type_t v36 = v64;
    sub_250D5DF80();
    id v37 = v35;
    unint64_t v38 = sub_250D5DF90();
    os_log_type_t v39 = sub_250D5E110();
    int v40 = v39;
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v42 = swift_slowAlloc();
      uint64_t v60 = v12;
      uint64_t v43 = v42;
      uint64_t v59 = swift_slowAlloc();
      v66[0] = v59;
      *(_DWORD *)uint64_t v43 = 136315394;
      int v63 = a3;
      uint64_t v44 = sub_250D5E420();
      LODWORD(v61) = v40;
      uint64_t v65 = sub_250D42E30(v44, v45, v66);
      os_log_t v58 = v38;
      sub_250D5E250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v57[1] = v43 + 14;
      id v46 = v37;
      id v47 = objc_msgSend(v46, sel_description);
      uint64_t v62 = v11;
      id v48 = v47;
      uint64_t v49 = sub_250D5E010();
      unint64_t v51 = v50;

      uint64_t v65 = sub_250D42E30(v49, v51, v66);
      sub_250D5E250();

      a3 = v63;
      swift_bridgeObjectRelease();
      os_log_t v52 = v58;
      _os_log_impl(&dword_250D3F000, v58, (os_log_type_t)v61, "[%s] pinned content state fetched remotely: %s", (uint8_t *)v43, 0x16u);
      uint64_t v53 = v59;
      swift_arrayDestroy();
      MEMORY[0x253388320](v53, -1, -1);
      MEMORY[0x253388320](v43, -1, -1);

      uint64_t v54 = v64;
      uint64_t v55 = v62;
    }
    else
    {

      uint64_t v54 = v36;
      uint64_t v55 = v11;
    }
    v27(v54, v55);
    id v56 = v37;
    a3(v37, 0);
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_250D43784(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_250D437DC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t PinnedContentDarwinNotificationPoster.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for PinnedContentTaskServer()
{
  return self;
}

uint64_t type metadata accessor for PinnedContentDaemonStore()
{
  return self;
}

id sub_250D4384C()
{
  uint64_t v2 = sub_250D5DFA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250D4250C();
  if (!v0)
  {
    id v1 = v6;
    if (!v6)
    {
      uint64_t v8 = (void *)sub_250D5780C();
      sub_250D5DF80();
      swift_retain_n();
      id v1 = v8;
      uint64_t v9 = sub_250D5DF90();
      os_log_type_t v10 = sub_250D5E110();
      int v11 = v10;
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v12 = swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        uint64_t v24 = v22;
        *(_DWORD *)uint64_t v12 = 136315394;
        v19[1] = v12 + 4;
        os_log_t v21 = v9;
        uint64_t v13 = sub_250D423F0();
        uint64_t v23 = sub_250D42E30(v13, v14, &v24);
        int v20 = v11;
        sub_250D5E250();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v12 + 12) = 2080;
        uint64_t v15 = sub_250D5E1D0();
        uint64_t v23 = sub_250D42E30(v15, v16, &v24);
        sub_250D5E250();

        swift_bridgeObjectRelease();
        os_log_t v17 = v21;
        _os_log_impl(&dword_250D3F000, v21, (os_log_type_t)v20, "%s: No persisted pinned content, returning default state: %s", (uint8_t *)v12, 0x16u);
        uint64_t v18 = v22;
        swift_arrayDestroy();
        MEMORY[0x253388320](v18, -1, -1);
        MEMORY[0x253388320](v12, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  return v1;
}

void sub_250D43B00(uint64_t a1, uint64_t a2)
{
  sub_250D43B08(a1, a2, *(void *)(v2 + 16));
}

void sub_250D43B08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_250D5DDC0();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

void sub_250D44E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_250D45B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_250D470D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_250D47A64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_250D493F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_250D4981C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_250D4A930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_250D4C1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id HDHealthAppNotificationManager.__allocating_init(profile:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  sub_250D5E010();
  id v4 = objc_allocWithZone(MEMORY[0x263F1DFB0]);
  uint64_t v5 = (void *)sub_250D5DFF0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithBundleIdentifier_, v5);

  id v7 = objc_msgSend(v3, sel_initWithProfile_userNotificationCenter_, a1, v6);
  return v7;
}

id HDHealthAppNotificationManager.init(profile:)(void *a1)
{
  sub_250D5E010();
  id v3 = objc_allocWithZone(MEMORY[0x263F1DFB0]);
  id v4 = (void *)sub_250D5DFF0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_initWithBundleIdentifier_, v4);

  id v6 = objc_msgSend(v1, sel_initWithProfile_userNotificationCenter_, a1, v5);
  return v6;
}

id HDHealthAppNotificationManager.__allocating_init(profile:userNotificationCenter:)(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = objc_allocWithZone(MEMORY[0x263F433B8]);
  id v7 = (char *)v5;
  id v8 = objc_msgSend(v6, sel_initWithProfile_, a1);
  *(void *)&v7[OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_summarySharingEntryManager] = v8;
  *(void *)&v7[OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter] = a2;
  id v9 = a2;

  v12.receiver = v7;
  v12.super_class = v2;
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

id HDHealthAppNotificationManager.init(profile:userNotificationCenter:)(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(MEMORY[0x263F433B8]);
  id v6 = v2;
  id v7 = objc_msgSend(v5, sel_initWithProfile_, a1);
  *(void *)&v6[OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_summarySharingEntryManager] = v7;
  *(void *)&v6[OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter] = a2;
  id v8 = a2;

  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for HDHealthAppNotificationManager();
  id v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

uint64_t type metadata accessor for HDHealthAppNotificationManager()
{
  return self;
}

uint64_t sub_250D4F9C4()
{
  v14[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_summarySharingEntryManager);
  v14[0] = 0;
  id v3 = objc_msgSend(v2, sel_fetchSharingEntriesWithError_, v14);
  id v4 = v14[0];
  if (v3)
  {
    id v5 = v3;
    sub_250D4FB44();
    unint64_t v6 = sub_250D5E090();
    id v7 = v4;

    unint64_t v8 = sub_250D4FFEC(v6);
    swift_bridgeObjectRelease();
    id v9 = (void *)sub_250D5015C(v8);
    uint64_t result = swift_bridgeObjectRelease();
    if (!v1)
    {
      objc_super v11 = (void *)sub_250D5DFF0();
      id v12 = objc_msgSend(self, sel_requestWithIdentifier_content_trigger_, v11, v9, 0);

      return (uint64_t)v12;
    }
  }
  else
  {
    id v13 = v14[0];
    sub_250D5DDD0();

    return swift_willThrow();
  }
  return result;
}

unint64_t sub_250D4FB44()
{
  unint64_t result = qword_269B02930;
  if (!qword_269B02930)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B02930);
  }
  return result;
}

void sub_250D4FC20(uint64_t a1, uint64_t a2)
{
  sub_250D511E4(0, (unint64_t *)&qword_26B205C78, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_250D5FC30;
  *(void *)(v5 + 32) = a1;
  *(void *)(v5 + 40) = a2;
  uint64_t v6 = OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter;
  id v7 = *(void **)(v2 + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter);
  swift_bridgeObjectRetain();
  id v8 = v7;
  id v9 = (void *)sub_250D5E080();
  objc_msgSend(v8, sel_removePendingNotificationRequestsWithIdentifiers_, v9);

  id v10 = *(id *)(v2 + v6);
  id v11 = (id)sub_250D5E080();
  objc_msgSend(v10, sel_removeDeliveredNotificationsWithIdentifiers_, v11);
  swift_bridgeObjectRelease();
}

void sub_250D4FDAC()
{
  uint64_t v1 = OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter;
  id v2 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter));
  id v3 = (void *)sub_250D5E080();
  objc_msgSend(v2, sel_removePendingNotificationRequestsWithIdentifiers_, v3);

  id v4 = *(id *)(v0 + v1);
  id v5 = (id)sub_250D5E080();
  objc_msgSend(v4, sel_removeDeliveredNotificationsWithIdentifiers_, v5);
}

id HDHealthAppNotificationManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HDHealthAppNotificationManager.init()()
{
}

id HDHealthAppNotificationManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDHealthAppNotificationManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250D4FFEC(unint64_t a1)
{
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_250D5E340();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x2533879B0](i, a1);
      }
      else {
        id v5 = *(id *)(a1 + 8 * i + 32);
      }
      uint64_t v6 = v5;
      if (objc_msgSend(v5, sel_direction) || objc_msgSend(v6, sel_status) && objc_msgSend(v6, sel_status) != (id)1)
      {
      }
      else
      {
        sub_250D5E2F0();
        sub_250D5E310();
        sub_250D5E320();
        sub_250D5E300();
      }
    }
    swift_bridgeObjectRelease();
    return v7;
  }
  return result;
}

uint64_t sub_250D5015C(unint64_t a1)
{
  uint64_t v3 = sub_250D5DF30();
  uint64_t v82 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v81 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250D5DE50();
  MEMORY[0x270FA5388](v5 - 8);
  v77 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_250D5DF70();
  uint64_t v79 = *(void *)(v7 - 8);
  uint64_t v80 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v76 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v78 = (char *)&v70 - v10;
  sub_250D50F64(0, &qword_269B02938, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  unint64_t v14 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v70 - v15;
  uint64_t v17 = sub_250D5DE70();
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v18 = sub_250D5DFE0();
  MEMORY[0x270FA5388](v18 - 8);
  id v83 = v14;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_250D5E340();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v19 < 1)
  {
    sub_250D50F10();
    swift_allocError();
    *int v26 = 0xD00000000000001ALL;
    v26[1] = 0x8000000250D60A70;
    swift_willThrow();
    return (uint64_t)v16;
  }
  uint64_t v73 = v3;
  v74 = v16;
  uint64_t v75 = v1;
  unint64_t v16 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F1DEF0]), sel_init);
  sub_250D5DFD0();
  if (qword_269B02910 != -1) {
    swift_once();
  }
  id v20 = (id)qword_269B02E10;
  sub_250D5DE60();
  sub_250D5E020();
  os_log_t v21 = (void *)sub_250D5DFF0();
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setTitle_, v21);

  sub_250D5DFD0();
  id v22 = (id)qword_269B02E10;
  sub_250D5DE60();
  sub_250D5E020();
  uint64_t v23 = (void *)sub_250D5DFF0();
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setSubtitle_, v23);

  if (v19 != 1)
  {
    sub_250D5DFD0();
    if (qword_269B02918 != -1) {
      swift_once();
    }
    uint64_t v27 = (void *)qword_269B02E10;
    swift_bridgeObjectRetain();
    id v28 = v27;
    sub_250D5DE60();
    sub_250D5E020();
    sub_250D50F64(0, &qword_269B02948, (uint64_t (*)(uint64_t))sub_250D50FC8, MEMORY[0x263F8E0F8]);
    uint64_t v29 = swift_allocObject();
    uint64_t v30 = MEMORY[0x263F8D6C8];
    *(_OWORD *)(v29 + 16) = xmmword_250D5FC30;
    uint64_t v31 = MEMORY[0x263F8D750];
    *(void *)(v29 + 56) = v30;
    *(void *)(v29 + 64) = v31;
    *(void *)(v29 + 32) = v19;
    sub_250D5E000();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F42A28]), sel_init);
    id v33 = objc_msgSend(v32, sel_URLForSharingOverview);
    id v34 = v83;
    if (v33)
    {
      v35 = v33;
      sub_250D5DDE0();

      uint64_t v36 = sub_250D5DDF0();
      (*(void (**)(id, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v34, 0, 1, v36);
    }
    else
    {

      uint64_t v49 = sub_250D5DDF0();
      (*(void (**)(id, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v34, 1, 1, v49);
    }
    uint64_t v50 = (uint64_t)v74;
    sub_250D51020((uint64_t)v34, (uint64_t)v74);
    goto LABEL_34;
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_250D5E340();
    uint64_t v24 = result;
  }
  else
  {
    uint64_t v24 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  if (!v24)
  {
    swift_bridgeObjectRelease();
    sub_250D50F10();
    swift_allocError();
    void *v51 = 0xD00000000000001ELL;
    v51[1] = 0x8000000250D60B90;
    swift_willThrow();

    return (uint64_t)v16;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v37 = (id)MEMORY[0x2533879B0](0, a1);
LABEL_19:
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    id v39 = objc_msgSend(v38, sel_CNContactIdentifier);
    if (v39
      && (v39,
          (id v40 = objc_msgSend(v38, sel_CNContactIdentifier)) != 0))
    {
      uint64_t v41 = v40;
      uint64_t v42 = sub_250D5E010();
      unint64_t v44 = v43;

      swift_bridgeObjectRelease();
      uint64_t v45 = HIBYTE(v44) & 0xF;
      if ((v44 & 0x2000000000000000) == 0) {
        uint64_t v45 = v42 & 0xFFFFFFFFFFFFLL;
      }
      BOOL v84 = v45 != 0;
    }
    else
    {
      BOOL v84 = 0;
    }
    id v46 = objc_msgSend(v38, sel_firstName);
    if (v46)
    {
      id v47 = v46;
      uint64_t v71 = sub_250D5E010();
      uint64_t v72 = v48;
    }
    else
    {
      uint64_t v71 = 0;
      uint64_t v72 = 0;
    }
    id v52 = objc_msgSend(v38, sel_lastName);
    if (v52)
    {
      uint64_t v53 = v52;
      sub_250D5E010();
    }
    sub_250D5DF50();
    id v54 = objc_msgSend(v38, sel_primaryContactIdentifier);
    id v83 = v38;
    id v55 = v54;
    sub_250D5E010();

    uint64_t v56 = sub_250D5DF40();
    uint64_t v58 = v57;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_250D5DFD0();
    id v59 = (id)qword_269B02E10;
    sub_250D5DE60();
    sub_250D5E020();
    sub_250D50F64(0, &qword_269B02948, (uint64_t (*)(uint64_t))sub_250D50FC8, MEMORY[0x263F8E0F8]);
    uint64_t v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_250D5FC30;
    *(void *)(v60 + 56) = MEMORY[0x263F8D310];
    *(void *)(v60 + 64) = sub_250D51140();
    *(void *)(v60 + 32) = v56;
    *(void *)(v60 + 40) = v58;
    sub_250D5E000();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v61 = v83;
    id v62 = objc_msgSend(v83, sel_UUID);
    sub_250D5DE40();

    int v63 = v78;
    sub_250D5DF60();
    uint64_t v65 = v79;
    uint64_t v64 = v80;
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v76, v63, v80);
    uint64_t v66 = v81;
    sub_250D5DF10();
    uint64_t v50 = (uint64_t)v74;
    sub_250D5DF20();

    (*(void (**)(char *, uint64_t))(v82 + 8))(v66, v73);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v63, v64);
LABEL_34:
    uint64_t v67 = (void *)sub_250D5DFF0();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_setBody_, v67);

    sub_250D5DF00();
    uint64_t v68 = (void *)sub_250D5DEF0();
    objc_msgSend(v16, sel_setSound_, v68);

    MEMORY[0x2533875C0](11, v50);
    uint64_t v69 = (void *)sub_250D5DFB0();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_setUserInfo_, v69);

    sub_250D510B4(v50);
    return (uint64_t)v16;
  }
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v37 = *(id *)(a1 + 32);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t method lookup function for HDHealthAppNotificationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HDHealthAppNotificationManager);
}

uint64_t dispatch thunk of HDHealthAppNotificationManager.__allocating_init(profile:userNotificationCenter:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of HDHealthAppNotificationManager.createSharingReminderNotification()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HDHealthAppNotificationManager.removeNotification(identifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HDHealthAppNotificationManager.removeNotifications(identifiers:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

void *initializeBufferWithCopyOfBuffer for HDHealthAppNotificationManager.NotificationError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HDHealthAppNotificationManager.NotificationError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for HDHealthAppNotificationManager.NotificationError(void *a1, void *a2)
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

void *assignWithTake for HDHealthAppNotificationManager.NotificationError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HDHealthAppNotificationManager.NotificationError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HDHealthAppNotificationManager.NotificationError(uint64_t result, int a2, int a3)
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

uint64_t sub_250D50EF4()
{
  return 0;
}

ValueMetadata *type metadata accessor for HDHealthAppNotificationManager.NotificationError()
{
  return &type metadata for HDHealthAppNotificationManager.NotificationError;
}

unint64_t sub_250D50F10()
{
  unint64_t result = qword_269B02940;
  if (!qword_269B02940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B02940);
  }
  return result;
}

void sub_250D50F64(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_250D50FC8()
{
  unint64_t result = qword_269B02950;
  if (!qword_269B02950)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269B02950);
  }
  return result;
}

uint64_t sub_250D51020(uint64_t a1, uint64_t a2)
{
  sub_250D50F64(0, &qword_269B02938, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_250D510B4(uint64_t a1)
{
  sub_250D50F64(0, &qword_269B02938, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_250D51140()
{
  unint64_t result = qword_269B02958;
  if (!qword_269B02958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B02958);
  }
  return result;
}

void type metadata accessor for HKWheelchairUse(uint64_t a1)
{
}

void type metadata accessor for HDCloudSyncStateResult(uint64_t a1)
{
}

void sub_250D511E4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

id sub_250D51234()
{
  sub_250D5DD10();
  uint64_t v2 = HDEntityCategoryForKeyValueCategory();
  sub_250D5DCF0();
  uint64_t v3 = *(void **)(v0 + 16);
  id v4 = objc_allocWithZone(MEMORY[0x263F43218]);
  id v5 = v3;
  uint64_t v6 = (void *)sub_250D5DFF0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithCategory_domainName_profile_, v2, v6, v5);

  sub_250D5DCE0();
  sub_250D5E130();
  if (v1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (v10)
    {
      sub_250D514CC(v9, v11);
      v9[0] = sub_250D5DD00();
      swift_bridgeObjectRetain();
      sub_250D517F0(v9);
      swift_bridgeObjectRelease();

      id v7 = (id)v9[0];
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    }
    else
    {

      sub_250D51448((uint64_t)v9);
      return 0;
    }
  }
  return v7;
}

id PinnedContentDaemonStore.makeLegacyFavoritesKVD()()
{
  sub_250D5DD10();
  uint64_t v1 = HDEntityCategoryForKeyValueCategory();
  sub_250D5DCF0();
  uint64_t v2 = *(void **)(v0 + 16);
  id v3 = objc_allocWithZone(MEMORY[0x263F43218]);
  id v4 = v2;
  id v5 = (void *)sub_250D5DFF0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithCategory_domainName_profile_, v1, v5, v4);

  return v6;
}

uint64_t sub_250D51448(uint64_t a1)
{
  sub_250D5254C(0, (unint64_t *)&qword_26B205CA0, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_250D514CC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_250D514DC(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_250D5254C(0, (unint64_t *)&qword_26B205C78, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_250D5E360();
  __break(1u);
  return result;
}

uint64_t sub_250D51668(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_250D5254C(0, (unint64_t *)&unk_269B02980, MEMORY[0x263F429D8], MEMORY[0x263F8E0F8]);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  size_t v15 = 32 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_250D5E360();
  __break(1u);
  return result;
}

uint64_t sub_250D517F0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_250D5247C(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_250D5185C(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_250D5185C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_250D5E370();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_250D51F48(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  uint64_t v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      int64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_118:
      v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_250D52018((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v97 = sub_250D52468((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          v100 = &v97[16 * v96 + 32];
          *(void *)v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_250D5E0A0();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  int64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    unint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_250D5E390();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    os_log_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_250D5E390()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_250D522B4(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      int64_t v11 = sub_250D522B4((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v42 = v11 + 32;
    unint64_t v43 = &v11[16 * v41 + 32];
    *(void *)unint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          uint64_t v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        id v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        uint64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        v85 = v11;
        v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        v88 = v42;
        unint64_t v89 = v44;
        v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_250D52018((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        int64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        uint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      id v33 = (void *)(v10 + 16 * v9);
      do
      {
        id v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        unint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_250D5E390() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)unint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      uint64_t v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  uint64_t result = sub_250D5E330();
  __break(1u);
  return result;
}

uint64_t sub_250D51F48(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_250D5E390(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_250D52018(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_250D5E390() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    unint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_250D5E390() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }
LABEL_50:
    sub_250D523AC((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_250D5E360();
  __break(1u);
  return result;
}

char *sub_250D522B4(char *result, int64_t a2, char a3, char *a4)
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
    sub_250D52490();
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_250D523AC(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_250D5E360();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_250D52468(uint64_t a1)
{
  return sub_250D522B4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_250D5247C(uint64_t a1)
{
  return sub_250D514DC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_250D52490()
{
  if (!qword_269B02970)
  {
    sub_250D524E8();
    unint64_t v0 = sub_250D5E380();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B02970);
    }
  }
}

void sub_250D524E8()
{
  if (!qword_269B02978)
  {
    unint64_t v0 = sub_250D5E0E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B02978);
    }
  }
}

void sub_250D5254C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

id PinnedContentTaskServer.__allocating_init(uuid:configuration:client:delegate:)(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  uint64_t v10 = (void *)sub_250D5DE30();
  id v11 = objc_msgSend(v9, sel_initWithUUID_configuration_client_delegate_, v10, a2, a3, a4);

  swift_unknownObjectRelease();
  uint64_t v12 = sub_250D5DE50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  return v11;
}

id PinnedContentTaskServer.init(uuid:configuration:client:delegate:)(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  unint64_t v5 = v4;
  uint64_t v10 = (void *)sub_250D5DE30();
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for PinnedContentTaskServer();
  id v11 = objc_msgSendSuper2(&v14, sel_initWithUUID_configuration_client_delegate_, v10, a2, a3, a4);

  swift_unknownObjectRelease();
  uint64_t v12 = sub_250D5DE50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  return v11;
}

unint64_t sub_250D52780()
{
  unint64_t result = qword_269B02990;
  if (!qword_269B02990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B02990);
  }
  return result;
}

void sub_250D527D4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(void *, void *))
{
  swift_bridgeObjectRetain();
  if (sub_250D5DD90())
  {
    sub_250D52780();
    uint64_t v18 = (void *)swift_allocError();
    void *v19 = a3;
    v19[1] = a4;
    swift_bridgeObjectRetain();
    a6(0, v18);
  }
  else
  {
    id v13 = objc_msgSend(v6, sel_client);
    id v14 = objc_msgSend(v13, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    uint64_t v15 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    uint64_t inited = swift_initStackObject();
    sub_250D421CC(v14, v15, inited);
    if (a5) {
      id v17 = objc_msgSend(a5, sel_integerValue);
    }
    else {
      id v17 = 0;
    }
    id v20 = sub_250D551B4(a1, a2, (uint64_t)v17, a5 == 0);
    swift_release();
    uint64_t v21 = (void *)sub_250D5E170();
    id v22 = v21;
    a6(v21, 0);
  }
}

void sub_250D52ABC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void *, void *))
{
  swift_bridgeObjectRetain();
  if (sub_250D5DD90())
  {
    sub_250D52780();
    uint64_t v16 = (void *)swift_allocError();
    void *v17 = a3;
    v17[1] = a4;
    swift_bridgeObjectRetain();
    a5(0, v16);
  }
  else
  {
    id v11 = objc_msgSend(v5, sel_client);
    id v12 = objc_msgSend(v11, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    uint64_t v13 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    uint64_t inited = swift_initStackObject();
    sub_250D421CC(v12, v13, inited);
    id v15 = sub_250D5557C(a1, a2);
    swift_release();
    uint64_t v18 = (void *)sub_250D5E170();
    id v19 = v18;
    a5(v18, 0);
  }
}

void sub_250D52D58(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(void *, void *))
{
  swift_bridgeObjectRetain();
  if (sub_250D5DD90())
  {
    sub_250D52780();
    uint64_t v18 = (void *)swift_allocError();
    void *v19 = a3;
    v19[1] = a4;
    swift_bridgeObjectRetain();
    a6(0, v18);
  }
  else
  {
    id v13 = objc_msgSend(v6, sel_client);
    id v14 = objc_msgSend(v13, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    uint64_t v15 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    uint64_t inited = swift_initStackObject();
    sub_250D421CC(v14, v15, inited);
    id v17 = sub_250D558E4(a1, a2, (uint64_t)objc_msgSend(a5, sel_integerValue));
    swift_release();
    id v20 = (void *)sub_250D5E170();
    id v21 = v20;
    a6(v20, 0);
  }
}

void sub_250D53028(uint64_t a1, uint64_t a2, void (*a3)(void *, void *))
{
  swift_bridgeObjectRetain();
  if (sub_250D5DD90())
  {
    sub_250D52780();
    id v12 = (void *)swift_allocError();
    *id v13 = a1;
    v13[1] = a2;
    swift_bridgeObjectRetain();
    a3(0, v12);
  }
  else
  {
    id v7 = objc_msgSend(v3, sel_client);
    id v8 = objc_msgSend(v7, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    uint64_t v9 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    uint64_t inited = swift_initStackObject();
    sub_250D421CC(v8, v9, inited);
    id v11 = sub_250D55C84();
    swift_release();
    id v14 = (void *)sub_250D5E170();
    id v15 = v14;
    a3(v14, 0);
  }
}

uint64_t sub_250D5327C(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, void *))
{
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = a1;
    uint64_t v8 = sub_250D5E340();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (v8)
  {
    uint64_t v37 = MEMORY[0x263F8EE78];
    uint64_t result = sub_250D53C14(0, v8 & ~(v8 >> 63), 0);
    if (v8 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v34 = a2;
    uint64_t v35 = a4;
    uint64_t v9 = v37;
    if ((v7 & 0xC000000000000001) != 0)
    {
      uint64_t v11 = 0;
      do
      {
        MEMORY[0x2533879B0](v11, v7);
        uint64_t v12 = sub_250D5DDA0();
        uint64_t v14 = v13;
        uint64_t v16 = v15;
        char v18 = v17;
        swift_unknownObjectRelease();
        unint64_t v20 = *(void *)(v37 + 16);
        unint64_t v19 = *(void *)(v37 + 24);
        if (v20 >= v19 >> 1) {
          sub_250D53C14(v19 > 1, v20 + 1, 1);
        }
        ++v11;
        *(void *)(v37 + 16) = v20 + 1;
        unint64_t v21 = v37 + 32 * v20;
        *(void *)(v21 + 32) = v12;
        *(void *)(v21 + 40) = v14;
        *(void *)(v21 + 48) = v16;
        *(unsigned char *)(v21 + 56) = v18 & 1;
        unint64_t v7 = a1;
      }
      while (v8 != v11);
    }
    else
    {
      id v22 = (id *)(v7 + 32);
      do
      {
        id v23 = *v22;
        uint64_t v24 = sub_250D5DDA0();
        uint64_t v26 = v25;
        uint64_t v28 = v27;
        char v30 = v29;

        unint64_t v32 = *(void *)(v37 + 16);
        unint64_t v31 = *(void *)(v37 + 24);
        if (v32 >= v31 >> 1) {
          sub_250D53C14(v31 > 1, v32 + 1, 1);
        }
        *(void *)(v37 + 16) = v32 + 1;
        unint64_t v33 = v37 + 32 * v32;
        *(void *)(v33 + 32) = v24;
        *(void *)(v33 + 40) = v26;
        *(void *)(v33 + 48) = v28;
        *(unsigned char *)(v33 + 56) = v30 & 1;
        ++v22;
        --v8;
      }
      while (v8);
    }
    a4 = v35;
    a2 = v34;
  }
  sub_250D53578(v9, a2, a3, a4);
  return swift_bridgeObjectRelease();
}

void sub_250D53578(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, void *))
{
  swift_bridgeObjectRetain();
  if (sub_250D5DD90())
  {
    sub_250D52780();
    uint64_t v16 = (void *)swift_allocError();
    void *v17 = a2;
    v17[1] = a3;
    swift_bridgeObjectRetain();
    a4(0, v16);
  }
  else
  {
    id v9 = objc_msgSend(v4, sel_client);
    id v10 = objc_msgSend(v9, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    uint64_t v11 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    uint64_t inited = swift_initStackObject();
    uint64_t v13 = (void *)sub_250D421CC(v10, v11, inited);
    uint64_t v14 = MEMORY[0x270FA5388](v13);
    v23[8] = a1;
    v23[2] = MEMORY[0x270FA5388](v14);
    v23[3] = sub_250D54BA8;
    v23[4] = v15;
    id v18 = sub_250D56564((uint64_t)sub_250D54BC0, (uint64_t)v23);
    uint64_t v19 = v13[7];
    uint64_t v20 = v13[8];
    __swift_project_boxed_opaque_existential_1(v13 + 4, v19);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v20);
    unint64_t v21 = (void *)sub_250D5E170();
    id v22 = v21;
    a4(v21, 0);
    swift_release();
  }
}

id PinnedContentTaskServer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinnedContentTaskServer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250D53854(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_250D538EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_250D53AC8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_250D53AC8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_250D538EC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_250D53A64(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_250D5E2C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_250D5E330();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_250D5E070();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_250D5E360();
    __break(1u);
LABEL_14:
    uint64_t result = sub_250D5E330();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_250D53A64(uint64_t a1, uint64_t a2)
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
  sub_250D54B50();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_250D53AC8(char a1, int64_t a2, char a3, char *a4)
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
    sub_250D54B50();
    id v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_250D5E360();
  __break(1u);
  return result;
}

uint64_t sub_250D53C14(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250D51668(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t method lookup function for PinnedContentTaskServer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PinnedContentTaskServer);
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_fetchPinnedContent(inDomain:withCompletion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x50))();
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_pinContent(withIdentifier:inDomain:atIndex:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_unpinContent(withIdentifier:inDomain:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_movePinnedContent(withIdentifier:inDomain:toIndex:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_unpinAllContent(inDomain:withCompletion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_applyDifferences(with:inDomain:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

void sub_250D53D84(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  swift_bridgeObjectRetain();
  if (sub_250D5DD90())
  {
    sub_250D52780();
    uint64_t v19 = (void *)swift_allocError();
    *uint64_t v20 = a3;
    v20[1] = a4;
    swift_bridgeObjectRetain();
    unint64_t v21 = (void *)sub_250D5DDC0();
    (*(void (**)(uint64_t, void, void *))(a7 + 16))(a7, 0, v21);
  }
  else
  {
    id v14 = objc_msgSend(a6, sel_client);
    id v15 = objc_msgSend(v14, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    uint64_t v16 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    uint64_t inited = swift_initStackObject();
    sub_250D421CC(v15, v16, inited);
    if (a5) {
      id v18 = objc_msgSend(a5, sel_integerValue);
    }
    else {
      id v18 = 0;
    }
    id v22 = sub_250D551B4(a1, a2, (uint64_t)v18, a5 == 0);
    swift_release();
    id v23 = (void *)sub_250D5E170();
    (*(void (**)(uint64_t, void *, void))(a7 + 16))(a7, v23, 0);
  }
}

void sub_250D53FAC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  swift_bridgeObjectRetain();
  if (sub_250D5DD90())
  {
    sub_250D52780();
    char v17 = (void *)swift_allocError();
    *id v18 = a3;
    v18[1] = a4;
    swift_bridgeObjectRetain();
    uint64_t v19 = (void *)sub_250D5DDC0();
    (*(void (**)(uint64_t, void, void *))(a6 + 16))(a6, 0, v19);
  }
  else
  {
    id v12 = objc_msgSend(a5, sel_client);
    id v13 = objc_msgSend(v12, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    uint64_t v14 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    uint64_t inited = swift_initStackObject();
    sub_250D421CC(v13, v14, inited);
    id v16 = sub_250D5557C(a1, a2);
    swift_release();
    uint64_t v20 = (void *)sub_250D5E170();
    (*(void (**)(uint64_t, void *, void))(a6 + 16))(a6, v20, 0);
  }
}

void sub_250D5419C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  swift_bridgeObjectRetain();
  if (sub_250D5DD90())
  {
    sub_250D52780();
    uint64_t v19 = (void *)swift_allocError();
    *uint64_t v20 = a3;
    v20[1] = a4;
    swift_bridgeObjectRetain();
    unint64_t v21 = (void *)sub_250D5DDC0();
    (*(void (**)(uint64_t, void, void *))(a7 + 16))(a7, 0, v21);
  }
  else
  {
    id v14 = objc_msgSend(a6, sel_client);
    id v15 = objc_msgSend(v14, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    uint64_t v16 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    uint64_t inited = swift_initStackObject();
    sub_250D421CC(v15, v16, inited);
    id v18 = sub_250D558E4(a1, a2, (uint64_t)objc_msgSend(a5, sel_integerValue));
    swift_release();
    id v22 = (void *)sub_250D5E170();
    (*(void (**)(uint64_t, void *, void))(a7 + 16))(a7, v22, 0);
  }
}

void sub_250D543B0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  swift_bridgeObjectRetain();
  if (sub_250D5DD90())
  {
    sub_250D52780();
    id v13 = (void *)swift_allocError();
    void *v14 = a1;
    v14[1] = a2;
    swift_bridgeObjectRetain();
    id v15 = (void *)sub_250D5DDC0();
    (*(void (**)(uint64_t, void, void *))(a4 + 16))(a4, 0, v15);
  }
  else
  {
    id v8 = objc_msgSend(a3, sel_client);
    id v9 = objc_msgSend(v8, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    uint64_t v10 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    uint64_t inited = swift_initStackObject();
    sub_250D421CC(v9, v10, inited);
    id v12 = sub_250D55C84();
    swift_release();
    uint64_t v16 = (void *)sub_250D5E170();
    (*(void (**)(uint64_t, void *, void))(a4 + 16))(a4, v16, 0);
  }
}

void sub_250D54584(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  swift_bridgeObjectRetain();
  if (sub_250D5DD90())
  {
    sub_250D52780();
    char v17 = (void *)swift_allocError();
    *id v18 = a2;
    v18[1] = a3;
    swift_bridgeObjectRetain();
    uint64_t v19 = (void *)sub_250D5DDC0();
    (*(void (**)(uint64_t, void, void *))(a5 + 16))(a5, 0, v19);
  }
  else
  {
    id v10 = objc_msgSend(a4, sel_client);
    id v11 = objc_msgSend(v10, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    uint64_t v12 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    uint64_t inited = swift_initStackObject();
    id v14 = (void *)sub_250D421CC(v11, v12, inited);
    uint64_t v15 = MEMORY[0x270FA5388](v14);
    v24[8] = a1;
    v24[2] = MEMORY[0x270FA5388](v15);
    v24[3] = sub_250D54A98;
    v24[4] = v16;
    id v20 = sub_250D56564((uint64_t)sub_250D54AB4, (uint64_t)v24);
    uint64_t v21 = v14[7];
    uint64_t v22 = v14[8];
    __swift_project_boxed_opaque_existential_1(v14 + 4, v21);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v22);
    id v23 = (void *)sub_250D5E170();
    (*(void (**)(uint64_t, void *, void))(a5 + 16))(a5, v23, 0);
    swift_release();
  }
}

void sub_250D54840(unint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *aBlock)
{
  size_t v5 = aBlock;
  unint64_t v9 = a1;
  if (a1 >> 62)
  {
    _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_250D5E340();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    _Block_copy(aBlock);
  }
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (v10)
  {
    uint64_t v41 = MEMORY[0x263F8EE78];
    sub_250D53C14(0, v10 & ~(v10 >> 63), 0);
    if (v10 < 0)
    {
      __break(1u);
      return;
    }
    uint64_t v37 = a2;
    uint64_t v38 = a3;
    BOOL v39 = a4;
    unint64_t v40 = v5;
    uint64_t v11 = v41;
    if ((v9 & 0xC000000000000001) != 0)
    {
      uint64_t v12 = 0;
      do
      {
        unint64_t v13 = v9;
        MEMORY[0x2533879B0](v12, v9);
        uint64_t v14 = sub_250D5DDA0();
        uint64_t v16 = v15;
        uint64_t v18 = v17;
        char v20 = v19;
        swift_unknownObjectRelease();
        unint64_t v22 = *(void *)(v41 + 16);
        unint64_t v21 = *(void *)(v41 + 24);
        if (v22 >= v21 >> 1) {
          sub_250D53C14(v21 > 1, v22 + 1, 1);
        }
        ++v12;
        *(void *)(v41 + 16) = v22 + 1;
        unint64_t v23 = v41 + 32 * v22;
        *(void *)(v23 + 32) = v14;
        *(void *)(v23 + 40) = v16;
        *(void *)(v23 + 48) = v18;
        *(unsigned char *)(v23 + 56) = v20 & 1;
        unint64_t v9 = v13;
      }
      while (v10 != v12);
    }
    else
    {
      uint64_t v24 = (id *)(v9 + 32);
      do
      {
        uint64_t v25 = v10;
        id v26 = *v24;
        uint64_t v27 = sub_250D5DDA0();
        uint64_t v29 = v28;
        uint64_t v31 = v30;
        char v33 = v32;

        unint64_t v35 = *(void *)(v41 + 16);
        unint64_t v34 = *(void *)(v41 + 24);
        if (v35 >= v34 >> 1) {
          sub_250D53C14(v34 > 1, v35 + 1, 1);
        }
        *(void *)(v41 + 16) = v35 + 1;
        unint64_t v36 = v41 + 32 * v35;
        *(void *)(v36 + 32) = v27;
        *(void *)(v36 + 40) = v29;
        *(void *)(v36 + 48) = v31;
        *(unsigned char *)(v36 + 56) = v33 & 1;
        ++v24;
        --v10;
      }
      while (v25 != 1);
    }
    a4 = v39;
    size_t v5 = v40;
    a2 = v37;
    a3 = v38;
  }
  _Block_copy(v5);
  sub_250D54584(v11, a2, a3, a4, (uint64_t)v5);
  _Block_release(v5);
  swift_bridgeObjectRelease();
  _Block_release(v5);
}

uint64_t sub_250D54A98(uint64_t a1)
{
  return sub_250D56418(a1, *(void *)(v1 + 16));
}

id sub_250D54AB4@<X0>(void *a1@<X8>)
{
  return sub_250D56B5C(*(void *)(v1 + 16), *(void (**)(void))(v1 + 24), a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_250D54B18()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_250D54B50()
{
  if (!qword_26B205C80)
  {
    unint64_t v0 = sub_250D5E380();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B205C80);
    }
  }
}

uint64_t sub_250D54BA8(uint64_t a1)
{
  return sub_250D54A98(a1);
}

id sub_250D54BC0@<X0>(void *a1@<X8>)
{
  return sub_250D54AB4(a1);
}

uint64_t PinnedContentDaemonStore.__allocating_init(profile:domain:notificationPoster:)(void *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1(a2, v5);
  MEMORY[0x270FA5388](v7);
  unint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  uint64_t v11 = sub_250D56F34(a1, (uint64_t)v9, v4, v5, v6);
  __swift_destroy_boxed_opaque_existential_0(a2);
  return v11;
}

uint64_t PinnedContentDarwinNotificationPoster.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t PinnedContentDarwinNotificationPoster.init()()
{
  return v0;
}

uint64_t sub_250D54CFC()
{
  sub_250D5DD80();
  uint64_t v0 = sub_250D5E040();
  swift_bridgeObjectRelease();
  notify_post((const char *)(v0 + 32));
  return swift_release();
}

uint64_t PinnedContentDarwinNotificationPoster.deinit()
{
  return v0;
}

id PinnedContentDaemonStore.profile.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t PinnedContentDaemonStore.init(profile:domain:notificationPoster:)(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1(a2, v5);
  MEMORY[0x270FA5388](v7);
  unint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  uint64_t v11 = sub_250D56F34(a1, (uint64_t)v9, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_0(a2);
  return v11;
}

id sub_250D54E58(void *a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = sub_250D5DFA0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D5DF80();
  swift_retain_n();
  id v10 = a1;
  uint64_t v11 = sub_250D5DF90();
  os_log_type_t v12 = sub_250D5E110();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v33 = v7;
    uint64_t v14 = v13;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v36 = v31;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v32 = v6;
    uint64_t v15 = sub_250D423F0();
    uint64_t v17 = sub_250D42E30(v15, v16, &v36);
    uint64_t v34 = v2;
    uint64_t v35 = v17;
    sub_250D5E250();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v18 = sub_250D5E1D0();
    uint64_t v35 = sub_250D42E30(v18, v19, &v36);
    uint64_t v3 = v34;
    sub_250D5E250();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250D3F000, v11, v12, "%s: Merging local state with other=%s", (uint8_t *)v14, 0x16u);
    uint64_t v20 = v31;
    swift_arrayDestroy();
    MEMORY[0x253388320](v20, -1, -1);
    MEMORY[0x253388320](v14, -1, -1);

    uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v9, v32);
  }
  else
  {

    swift_release_n();
    uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  *(&v30 - 2) = (uint64_t)v10;
  MEMORY[0x270FA5388](v22);
  *(&v30 - 4) = (uint64_t)v4;
  *(&v30 - 3) = (uint64_t)sub_250D570C0;
  *(&v30 - 2) = v23;
  uint64_t v24 = v3;
  id v25 = sub_250D56564((uint64_t)sub_250D54AB4, (uint64_t)(&v30 - 6));
  if (!v24)
  {
    id v26 = v4 + 4;
    uint64_t v28 = v4[7];
    uint64_t v27 = v4[8];
    __swift_project_boxed_opaque_existential_1(v26, v28);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v27);
  }
  return v25;
}

id sub_250D551B4(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  uint64_t v42 = a1;
  uint64_t v11 = sub_250D5DFA0();
  uint64_t v40 = *(void *)(v11 - 8);
  uint64_t v41 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = &v35[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_250D5DF80();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_250D5DF90();
  os_log_type_t v15 = sub_250D5E110();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v38 = v5;
    uint64_t v18 = v17;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v45 = v37;
    *(_DWORD *)uint64_t v18 = 136315650;
    int v39 = a4;
    int v36 = v16;
    uint64_t v19 = sub_250D423F0();
    uint64_t v43 = sub_250D42E30(v19, v20, &v45);
    sub_250D5E250();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_250D42E30(v42, a2, &v45);
    sub_250D5E250();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 22) = 2080;
    uint64_t v43 = a3;
    char v44 = v39 & 1;
    sub_250D57120();
    uint64_t v21 = sub_250D5E030();
    uint64_t v43 = sub_250D42E30(v21, v22, &v45);
    LOBYTE(a4) = v39;
    sub_250D5E250();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250D3F000, v14, (os_log_type_t)v36, "%s: Pinning content with identifier=%s at index=%s", (uint8_t *)v18, 0x20u);
    uint64_t v23 = v37;
    swift_arrayDestroy();
    MEMORY[0x253388320](v23, -1, -1);
    uint64_t v24 = v18;
    uint64_t v6 = v38;
    MEMORY[0x253388320](v24, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v25 = (*(uint64_t (**)(unsigned char *, uint64_t))(v40 + 8))(v13, v41);
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  *(void *)&v35[-32] = v27;
  *(void *)&v35[-24] = a2;
  *(void *)&v35[-16] = v28;
  v35[-8] = a4 & 1;
  MEMORY[0x270FA5388](v26);
  *(void *)&v35[-32] = v7;
  *(void *)&v35[-24] = sub_250D570EC;
  *(void *)&v35[-16] = v29;
  id v30 = sub_250D56564((uint64_t)sub_250D54BC0, (uint64_t)&v35[-48]);
  if (!v6)
  {
    uint64_t v31 = v7 + 4;
    uint64_t v33 = v7[7];
    uint64_t v32 = v7[8];
    __swift_project_boxed_opaque_existential_1(v31, v33);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v33, v32);
  }
  return v30;
}

id sub_250D5557C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v8 = sub_250D5DFA0();
  uint64_t v34 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v10 = &v29[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_250D5DF80();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_250D5DF90();
  os_log_type_t v12 = sub_250D5E110();
  int v13 = v12;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v33 = v3;
    uint64_t v15 = v14;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v36 = v31;
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v32 = v8;
    int v30 = v13;
    uint64_t v16 = sub_250D423F0();
    uint64_t v35 = sub_250D42E30(v16, v17, &v36);
    sub_250D5E250();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_250D42E30(a1, a2, &v36);
    sub_250D5E250();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_250D3F000, v11, (os_log_type_t)v30, "%s: Unpinning content with identifier=%s", (uint8_t *)v15, 0x16u);
    uint64_t v18 = v31;
    swift_arrayDestroy();
    MEMORY[0x253388320](v18, -1, -1);
    uint64_t v19 = v15;
    uint64_t v4 = v33;
    MEMORY[0x253388320](v19, -1, -1);

    uint64_t v20 = (*(uint64_t (**)(unsigned char *, uint64_t))(v34 + 8))(v10, v32);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    uint64_t v20 = (*(uint64_t (**)(unsigned char *, uint64_t))(v34 + 8))(v10, v8);
  }
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  *(void *)&v29[-16] = v22;
  *(void *)&v29[-8] = a2;
  MEMORY[0x270FA5388](v21);
  *(void *)&v29[-32] = v5;
  *(void *)&v29[-24] = sub_250D57178;
  *(void *)&v29[-16] = v23;
  id v24 = sub_250D56564((uint64_t)sub_250D54BC0, (uint64_t)&v29[-48]);
  if (!v4)
  {
    uint64_t v25 = v5 + 4;
    uint64_t v27 = v5[7];
    uint64_t v26 = v5[8];
    __swift_project_boxed_opaque_existential_1(v25, v27);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v26);
  }
  return v24;
}

id sub_250D558E4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v10 = sub_250D5DFA0();
  uint64_t v37 = *(void *)(v10 - 8);
  uint64_t v38 = v10;
  MEMORY[0x270FA5388](v10);
  os_log_type_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D5DF80();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  int v13 = sub_250D5DF90();
  os_log_type_t v14 = sub_250D5E110();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v35 = v4;
    uint64_t v16 = v15;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v40 = v34;
    *(_DWORD *)uint64_t v16 = 136315650;
    uint64_t v36 = a1;
    uint64_t v17 = sub_250D423F0();
    uint64_t v39 = sub_250D42E30(v17, v18, &v40);
    uint64_t v33 = a3;
    sub_250D5E250();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_250D42E30(v36, a2, &v40);
    sub_250D5E250();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 22) = 2048;
    uint64_t v39 = v33;
    sub_250D5E250();
    _os_log_impl(&dword_250D3F000, v13, v14, "%s: Moving content with identifier=%s to index=%ld", (uint8_t *)v16, 0x20u);
    uint64_t v19 = v34;
    swift_arrayDestroy();
    MEMORY[0x253388320](v19, -1, -1);
    uint64_t v20 = v16;
    uint64_t v5 = v35;
    MEMORY[0x253388320](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v12, v38);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  *(&v32 - 4) = v23;
  *(&v32 - 3) = a2;
  *(&v32 - 2) = v24;
  MEMORY[0x270FA5388](v22);
  *(&v32 - 4) = (uint64_t)v6;
  *(&v32 - 3) = (uint64_t)sub_250D571A4;
  *(&v32 - 2) = v25;
  uint64_t v26 = v5;
  id v27 = sub_250D56564((uint64_t)sub_250D54BC0, (uint64_t)(&v32 - 6));
  if (!v26)
  {
    uint64_t v28 = v6 + 4;
    uint64_t v30 = v6[7];
    uint64_t v29 = v6[8];
    __swift_project_boxed_opaque_existential_1(v28, v30);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v29);
  }
  return v27;
}

id sub_250D55C84()
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_250D5DFA0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D5DF80();
  swift_retain_n();
  uint64_t v7 = sub_250D5DF90();
  os_log_type_t v8 = sub_250D5E110();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v23 = v1;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v25 = v11;
    uint64_t v21 = v4;
    uint64_t v22 = v3;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v12 = sub_250D423F0();
    uint64_t v24 = sub_250D42E30(v12, v13, &v25);
    sub_250D5E250();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250D3F000, v7, v8, "%s: Unpinning all content", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253388320](v11, -1, -1);
    os_log_type_t v14 = v10;
    uint64_t v2 = v23;
    MEMORY[0x253388320](v14, -1, -1);

    uint64_t v15 = (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v6, v22);
  }
  else
  {

    swift_release_n();
    uint64_t v15 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  MEMORY[0x270FA5388](v15);
  *(&v21 - 4) = (uint64_t)v0;
  *(&v21 - 3) = (uint64_t)sub_250D55F54;
  *(&v21 - 2) = 0;
  uint64_t v16 = v2;
  id v17 = sub_250D56564((uint64_t)sub_250D54BC0, (uint64_t)(&v21 - 6));
  if (!v16)
  {
    uint64_t v19 = v0[7];
    uint64_t v18 = v0[8];
    __swift_project_boxed_opaque_existential_1(v0 + 4, v19);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v18);
  }
  return v17;
}

uint64_t sub_250D55F54()
{
  return sub_250D5E1C0();
}

id sub_250D55F78(void *a1)
{
  id result = sub_250D55FDC(a1);
  if (!v2)
  {
    uint64_t v4 = v1[7];
    uint64_t v5 = v1[8];
    __swift_project_boxed_opaque_existential_1(v1 + 4, v4);
    return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  }
  return result;
}

id sub_250D55FDC(void *a1)
{
  v32[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_250D5DFA0();
  uint64_t v30 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D5DF80();
  swift_retain_n();
  id v7 = a1;
  os_log_type_t v8 = sub_250D5DF90();
  os_log_type_t v9 = sub_250D5E110();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v29 = v2;
    uint64_t v11 = v10;
    id v27 = (void *)swift_slowAlloc();
    v32[0] = v27;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v28 = v4;
    uint64_t v12 = sub_250D423F0();
    uint64_t v31 = sub_250D42E30(v12, v13, (uint64_t *)v32);
    sub_250D5E250();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v14 = sub_250D5E1D0();
    uint64_t v31 = sub_250D42E30(v14, v15, (uint64_t *)v32);
    sub_250D5E250();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250D3F000, v8, v9, "%s: Setting state to %s", (uint8_t *)v11, 0x16u);
    uint64_t v16 = v27;
    swift_arrayDestroy();
    MEMORY[0x253388320](v16, -1, -1);
    MEMORY[0x253388320](v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v28);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v4);
  }
  id v17 = *(void **)(v1 + 24);
  id v18 = objc_msgSend(v7, sel_data);
  if (v18)
  {
    uint64_t v19 = sub_250D5DE20();
    unint64_t v21 = v20;

    id v18 = (id)sub_250D5DE00();
    sub_250D43130(v19, v21);
  }
  uint64_t v22 = (void *)sub_250D5DFF0();
  v32[0] = 0;
  unsigned __int8 v23 = objc_msgSend(v17, sel_setData_forKey_error_, v18, v22, v32);

  if (v23) {
    return v32[0];
  }
  id v25 = v32[0];
  sub_250D5DDD0();

  return (id)swift_willThrow();
}

id sub_250D56364(uint64_t a1)
{
  uint64_t v9 = a1;
  v7[4] = &v8;
  id v3 = sub_250D56564((uint64_t)sub_250D54BC0, (uint64_t)v7);
  if (!v2)
  {
    uint64_t v4 = v1[7];
    uint64_t v5 = v1[8];
    __swift_project_boxed_opaque_existential_1(v1 + 4, v4);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  }
  return v3;
}

uint64_t sub_250D56418(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (!v3) {
    return sub_250D5E1F0();
  }
  swift_bridgeObjectRetain();
  for (uint64_t i = (unsigned char *)(a2 + 56); ; i += 32)
  {
    uint64_t v6 = *((void *)i - 3);
    if (*i == 1) {
      break;
    }
    sub_250D5E1A0();
    if (v2) {
      return swift_bridgeObjectRelease();
    }
LABEL_4:
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return sub_250D5E1F0();
    }
  }
  uint64_t v7 = *((void *)i - 2);
  uint64_t v8 = *((void *)i - 1);
  sub_250D57700(*((void *)i - 3), v7, v8, 1);
  swift_bridgeObjectRetain();
  sub_250D5E180();
  if (!v2)
  {
    sub_250D57710(v6, v7, v8, 1);
    sub_250D57710(v6, v7, v8, 1);
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  sub_250D57710(v6, v7, v8, 1);
  return sub_250D57710(v6, v7, v8, 1);
}

id sub_250D56564(uint64_t a1, uint64_t a2)
{
  v36[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_250D5DFA0();
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v29 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36[0] = 0;
  id v8 = objc_msgSend(*(id *)(v2 + 16), sel_database);
  id v9 = objc_msgSend(self, sel_contextForWritingProtectedData);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v36;
  v10[3] = a1;
  v10[4] = a2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_250D57730;
  *(void *)(v11 + 24) = v10;
  uint64_t v34 = sub_250D5774C;
  uint64_t v35 = v11;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v32 = sub_250D56A74;
  uint64_t v33 = &block_descriptor;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  *(void *)&long long aBlock = 0;
  unsigned int v13 = objc_msgSend(v8, sel_performTransactionWithContext_error_block_inaccessibilityHandler_, v9, &aBlock, v12, 0);
  _Block_release(v12);

  id v14 = (id)aBlock;
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v12) {
    __break(1u);
  }
  if (!v13)
  {
    sub_250D5DDD0();

LABEL_10:
    swift_willThrow();
    id v25 = (void *)v36[0];
    swift_release();

    return v14;
  }
  id v14 = (id)v36[0];
  if (!v36[0])
  {
    sub_250D5DF80();
    swift_retain_n();
    id v14 = v7;
    unint64_t v15 = sub_250D5DF90();
    os_log_type_t v16 = sub_250D5E100();
    id v17 = &off_250D5F000;
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v30 = v19;
      *(_DWORD *)uint64_t v18 = 136315394;
      uint64_t v20 = sub_250D423F0();
      *(void *)&long long aBlock = sub_250D42E30(v20, v21, &v30);
      sub_250D5E250();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      long long aBlock = xmmword_250D5FD60;
      uint64_t v22 = sub_250D5E030();
      id v14 = (id)v23;
      *(void *)&long long aBlock = sub_250D42E30(v22, v23, &v30);
      id v17 = &off_250D5F000;
      sub_250D5E250();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250D3F000, v15, v16, "%s: No output returned during write operation: %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253388320](v19, -1, -1);
      MEMORY[0x253388320](v18, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v29);
    sub_250D52780();
    swift_allocError();
    _OWORD *v24 = *((_OWORD *)v17 + 214);
    goto LABEL_10;
  }
  swift_release();
  return v14;
}

uint64_t sub_250D569EC(uint64_t a1, uint64_t a2, void **a3, void (*a4)(void **__return_ptr))
{
  a4(&v7);
  uint64_t v5 = *a3;
  *a3 = v7;

  return 1;
}

uint64_t sub_250D56A74(uint64_t a1, void *a2)
{
  uint64_t v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  char v4 = v2();

  return v4 & 1;
}

id sub_250D56AC0(uint64_t a1, uint64_t a2)
{
  v8[3] = a1;
  v8[4] = a2;
  id v4 = sub_250D56564((uint64_t)sub_250D54BC0, (uint64_t)v8);
  if (!v3)
  {
    uint64_t v5 = v2[7];
    uint64_t v6 = v2[8];
    __swift_project_boxed_opaque_existential_1(v2 + 4, v5);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  }
  return v4;
}

id sub_250D56B5C@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, void *a3@<X8>)
{
  uint64_t v7 = sub_250D5DFA0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = sub_250D4384C();
  if (!v3)
  {
    uint64_t v12 = result;
    uint64_t v30 = v10;
    uint64_t v31 = a1;
    uint64_t v28 = v7;
    uint64_t v29 = v8;
    a2();
    sub_250D55FDC(v12);
    unsigned int v13 = v30;
    sub_250D5DF80();
    swift_retain_n();
    id v14 = v12;
    unint64_t v15 = sub_250D5DF90();
    os_log_type_t v16 = sub_250D5E110();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v33 = v27;
      *(_DWORD *)uint64_t v18 = 136315394;
      uint64_t v25 = v18 + 4;
      os_log_t v26 = v15;
      uint64_t v19 = sub_250D423F0();
      uint64_t v32 = sub_250D42E30(v19, v20, &v33);
      sub_250D5E250();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v21 = sub_250D5E1D0();
      uint64_t v32 = sub_250D42E30(v21, v22, &v33);
      sub_250D5E250();

      swift_bridgeObjectRelease();
      os_log_t v23 = v26;
      _os_log_impl(&dword_250D3F000, v26, v16, "%s: Mutation complete, new state=%s", (uint8_t *)v18, 0x16u);
      uint64_t v24 = v27;
      swift_arrayDestroy();
      MEMORY[0x253388320](v24, -1, -1);
      MEMORY[0x253388320](v18, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    id result = (id)(*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v13, v28);
    *a3 = v14;
  }
  return result;
}

unint64_t PinnedContentDaemonStore.Failure.debugDescription.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (!v1) {
    return 0xD000000000000021;
  }
  if (v1 == 1) {
    return 0xD00000000000002FLL;
  }
  sub_250D5E2B0();
  swift_bridgeObjectRelease();
  sub_250D5E060();
  sub_250D5E060();
  return 0xD000000000000017;
}

uint64_t PinnedContentDaemonStore.deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  return v0;
}

uint64_t sub_250D56F34(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  *(void *)(a3 + 16) = a1;
  id v10 = a1;
  sub_250D5DD60();
  id v11 = objc_allocWithZone(MEMORY[0x263F43218]);
  uint64_t v12 = (void *)sub_250D5DFF0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithCategory_domainName_profile_, 100, v12, v10);

  *(void *)(a3 + 24) = v13;
  sub_250D437DC(&v15, a3 + 32);
  return a3;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_250D57080()
{
  unint64_t result = qword_26B205C60;
  if (!qword_26B205C60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B205C60);
  }
  return result;
}

uint64_t sub_250D570C0()
{
  return sub_250D5E210();
}

uint64_t sub_250D570EC()
{
  return sub_250D5E180();
}

void sub_250D57120()
{
  if (!qword_269B02A60)
  {
    unint64_t v0 = sub_250D5E240();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B02A60);
    }
  }
}

uint64_t sub_250D57178()
{
  return sub_250D5E1B0();
}

uint64_t sub_250D571A4()
{
  return sub_250D5E190();
}

uint64_t dispatch thunk of PinnedContentDarwinNotificationPosting.postPinnedContentUpdatedDarwinNotification(domain:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t method lookup function for PinnedContentDarwinNotificationPoster(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PinnedContentDarwinNotificationPoster);
}

uint64_t dispatch thunk of PinnedContentDarwinNotificationPoster.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of PinnedContentDarwinNotificationPoster.postPinnedContentUpdatedDarwinNotification(domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t method lookup function for PinnedContentDaemonStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PinnedContentDaemonStore);
}

uint64_t dispatch thunk of PinnedContentDaemonStore.__allocating_init(profile:domain:notificationPoster:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.fetchPersistedPinnedContentState()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.fetchPersistedOrDefaultPinnedContentState()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.mergeState(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.pinContentWithIdentifier(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)v4 + 144))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of PinnedContentDaemonStore.unpinContentWithIdentifier(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.movePinnedContentWithIdentifier(_:to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.unpinAllContentInDomain()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.setPinnedContentState(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.applyDifferences(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.mutateState(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

unint64_t destroy for PinnedContentDaemonStore.Failure(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s21HealthAppHealthDaemon24PinnedContentDaemonStoreC7FailureOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for PinnedContentDaemonStore.Failure(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PinnedContentDaemonStore.Failure(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PinnedContentDaemonStore.Failure(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PinnedContentDaemonStore.Failure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_250D576B8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_250D576D0(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for PinnedContentDaemonStore.Failure()
{
  return &type metadata for PinnedContentDaemonStore.Failure;
}

uint64_t sub_250D57700(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_250D57710(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_250D57720()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_250D57730(uint64_t a1, uint64_t a2)
{
  return sub_250D569EC(a1, a2, *(void ***)(v2 + 16), *(void (**)(void **__return_ptr))(v2 + 24));
}

uint64_t sub_250D5773C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_250D5774C()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t PinnedContentDaemonStore.makeDefaultState()()
{
  return sub_250D5780C();
}

uint64_t sub_250D5780C()
{
  uint64_t v2 = v0;
  os_log_t v69 = *v0;
  uint64_t v3 = sub_250D5DFA0();
  uint64_t v70 = *(void *)(v3 - 8);
  uint64_t v71 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v65 - v7;
  if (objc_msgSend(self, sel_hasPairedWatch))
  {
    id v9 = objc_msgSend(self, sel_activitySummaryType);
    uint64_t v10 = sub_250D5E0F0();
    uint64_t v12 = v11;

    id v13 = sub_250D581E0(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v15 = v13[2];
    unint64_t v14 = v13[3];
    if (v15 >= v14 >> 1) {
      id v13 = sub_250D581E0((void *)(v14 > 1), v15 + 1, 1, v13);
    }
    v13[2] = v15 + 1;
    uint64_t v16 = &v13[2 * v15];
    v16[4] = v10;
    v16[5] = v12;
  }
  else
  {
    id v13 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v17 = v2[2];
  id v18 = sub_250D58058();
  if (v1)
  {
    sub_250D5DF80();
    swift_retain();
    id v19 = v1;
    swift_retain();
    id v20 = v1;
    uint64_t v21 = sub_250D5DF90();
    os_log_type_t v22 = sub_250D5E100();
    int v23 = v22;
    uint64_t v68 = v21;
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v66 = v17;
      os_log_t v26 = (void *)v25;
      uint64_t v67 = swift_slowAlloc();
      uint64_t v73 = v67;
      *(_DWORD *)uint64_t v24 = 136315650;
      uint64_t v27 = sub_250D5E420();
      LODWORD(v69) = v23;
      uint64_t v72 = sub_250D42E30(v27, v28, (uint64_t *)&v73);
      sub_250D5E250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2112;
      id v29 = objc_msgSend(v66, sel_profileIdentifier);
      uint64_t v72 = (uint64_t)v29;
      sub_250D5E250();
      *os_log_t v26 = v29;
      swift_release_n();
      *(_WORD *)(v24 + 22) = 2080;
      uint64_t v72 = (uint64_t)v1;
      id v30 = v1;
      sub_250D582EC();
      uint64_t v31 = sub_250D5E030();
      uint64_t v72 = sub_250D42E30(v31, v32, (uint64_t *)&v73);
      sub_250D5E250();
      swift_bridgeObjectRelease();

      uint64_t v33 = v68;
      _os_log_impl(&dword_250D3F000, v68, (os_log_type_t)v69, "[%s]_%@: Unable to fetch wheelchair use: %s", (uint8_t *)v24, 0x20u);
      sub_250D58344();
      swift_arrayDestroy();
      MEMORY[0x253388320](v26, -1, -1);
      uint64_t v34 = v67;
      swift_arrayDestroy();
      MEMORY[0x253388320](v34, -1, -1);
      MEMORY[0x253388320](v24, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v70 + 8))(v6, v71);
    sub_250D584F8(0, &qword_26B205C50);
    uint64_t v37 = (void *)MEMORY[0x253387800]((id)*MEMORY[0x263F09EF8]);
    uint64_t v38 = sub_250D5E0F0();
    uint64_t v40 = v39;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v13 = sub_250D581E0(0, v13[2] + 1, 1, v13);
    }
    unint64_t v42 = v13[2];
    unint64_t v41 = v13[3];
    if (v42 >= v41 >> 1) {
      id v13 = sub_250D581E0((void *)(v41 > 1), v42 + 1, 1, v13);
    }
    v13[2] = v42 + 1;
    uint64_t v43 = &v13[2 * v42];
    v43[4] = v38;
    v43[5] = v40;

    goto LABEL_29;
  }
  uint64_t v35 = (uint64_t)v18;
  if ((unint64_t)v18 < 2) {
    goto LABEL_23;
  }
  if (v18 != (id)2)
  {
    sub_250D5DF80();
    swift_retain_n();
    char v44 = sub_250D5DF90();
    os_log_type_t v45 = sub_250D5E100();
    int v46 = v45;
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v48 = swift_slowAlloc();
      uint64_t v66 = (void *)swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      uint64_t v73 = v68;
      *(_DWORD *)uint64_t v48 = 136315650;
      uint64_t v65 = v48 + 4;
      uint64_t v49 = sub_250D5E420();
      os_log_t v69 = v44;
      uint64_t v72 = sub_250D42E30(v49, v50, (uint64_t *)&v73);
      LODWORD(v67) = v46;
      sub_250D5E250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v48 + 12) = 2112;
      id v51 = objc_msgSend(v17, sel_profileIdentifier);
      uint64_t v72 = (uint64_t)v51;
      sub_250D5E250();
      uint64_t v52 = v66;
      *uint64_t v66 = v51;
      swift_release_n();
      *(_WORD *)(v48 + 22) = 2080;
      uint64_t v72 = v35;
      type metadata accessor for HKWheelchairUse(0);
      uint64_t v53 = sub_250D5E030();
      uint64_t v72 = sub_250D42E30(v53, v54, (uint64_t *)&v73);
      sub_250D5E250();
      swift_bridgeObjectRelease();
      os_log_t v55 = v69;
      _os_log_impl(&dword_250D3F000, v69, (os_log_type_t)v67, "[%s]_%@: Unknown wheelchair status: %s", (uint8_t *)v48, 0x20u);
      sub_250D58344();
      swift_arrayDestroy();
      MEMORY[0x253388320](v52, -1, -1);
      unint64_t v56 = v68;
      swift_arrayDestroy();
      MEMORY[0x253388320](v56, -1, -1);
      MEMORY[0x253388320](v48, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v70 + 8))(v8, v71);
LABEL_23:
    sub_250D584F8(0, &qword_26B205C50);
    uint64_t v36 = (id *)MEMORY[0x263F09EF8];
    goto LABEL_24;
  }
  sub_250D584F8(0, &qword_26B205C50);
  uint64_t v36 = (id *)MEMORY[0x263F09EA0];
LABEL_24:
  uint64_t v57 = (void *)MEMORY[0x253387800](*v36);
  uint64_t v58 = sub_250D5E0F0();
  uint64_t v60 = v59;

  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v13 = sub_250D581E0(0, v13[2] + 1, 1, v13);
  }
  unint64_t v62 = v13[2];
  unint64_t v61 = v13[3];
  if (v62 >= v61 >> 1) {
    id v13 = sub_250D581E0((void *)(v61 > 1), v62 + 1, 1, v13);
  }
  v13[2] = v62 + 1;
  uint64_t v63 = &v13[2 * v62];
  v63[4] = v58;
  v63[5] = v60;
LABEL_29:
  sub_250D584F8(0, (unint64_t *)&qword_26B205C60);
  return sub_250D5E1E0();
}

id sub_250D58058()
{
  v8[4] = *(id *)MEMORY[0x263EF8340];
  id v1 = objc_msgSend(v0, sel_userCharacteristicsManager);
  sub_250D584F8(0, &qword_26B205C58);
  uint64_t v2 = (void *)MEMORY[0x253387840]((id)*MEMORY[0x263F09478]);
  v8[0] = 0;
  id v3 = objc_msgSend(v1, sel_userCharacteristicForType_error_, v2, v8);

  if (v3)
  {
    id v4 = v8[0];
    sub_250D5E270();
    swift_unknownObjectRelease();
    sub_250D584F8(0, &qword_269B02A68);
    if (swift_dynamicCast())
    {
      id v5 = objc_msgSend(v7, sel_integerValue);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    id v5 = v8[0];
    sub_250D5DDD0();

    swift_willThrow();
  }
  return v5;
}

void *sub_250D581E0(void *result, int64_t a2, char a3, void *a4)
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
      sub_250D583AC();
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_250D58404(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_250D582EC()
{
  unint64_t result = qword_26B205C90;
  if (!qword_26B205C90)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B205C90);
  }
  return result;
}

void sub_250D58344()
{
  if (!qword_26B205C70)
  {
    sub_250D584F8(255, &qword_26B205C68);
    unint64_t v0 = sub_250D5E240();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B205C70);
    }
  }
}

void sub_250D583AC()
{
  if (!qword_26B205C78)
  {
    unint64_t v0 = sub_250D5E380();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B205C78);
    }
  }
}

uint64_t sub_250D58404(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_250D5E360();
  __break(1u);
  return result;
}

uint64_t sub_250D584F8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

id PinnedContentDaemonStore.setModel(_:)(void *a1)
{
  id result = sub_250D55FDC(a1);
  if (!v2)
  {
    uint64_t v4 = v1[7];
    uint64_t v5 = v1[8];
    __swift_project_boxed_opaque_existential_1(v1 + 4, v4);
    return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  }
  return result;
}

_WORD *PinnedContentDaemonStore.fetchLocallyPersistedData()()
{
  return sub_250D4250C();
}

id sub_250D585B0(void *a1)
{
  id v3 = (void *)*v1;
  id result = sub_250D55FDC(a1);
  if (!v2)
  {
    uint64_t v5 = v3[7];
    uint64_t v6 = v3[8];
    __swift_project_boxed_opaque_existential_1(v3 + 4, v5);
    return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  }
  return result;
}

_WORD *sub_250D58618()
{
  return sub_250D4250C();
}

id sub_250D5863C()
{
  return objc_msgSend(v0, sel_epoch);
}

id sub_250D5864C(uint64_t a1)
{
  return objc_msgSend(v1, sel_setEpoch_, a1);
}

id (*sub_250D58660(void *a1))(uint64_t a1)
{
  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_epoch);
  return sub_250D586B4;
}

id sub_250D586B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setEpoch_, *(void *)a1);
}

uint64_t sub_250D586CC()
{
  return sub_250D5E210();
}

uint64_t sub_250D586E4()
{
  return sub_250D5E200();
}

uint64_t PinnedContentSyncStateUpdaterDelegate.__allocating_init(profile:pinnedContentDomain:notificationPoster:maxDataSizeInBytes:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1(a2, v7);
  MEMORY[0x270FA5388](v9);
  int64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  uint64_t v13 = sub_250D58C20(a1, (uint64_t)v11, a3, v3, v7, v8);

  __swift_destroy_boxed_opaque_existential_0(a2);
  return v13;
}

uint64_t PinnedContentSyncStateUpdaterDelegate.__allocating_init(logger:key:supportedSyncVersionRange:domain:store:maxDataSizeInBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v18[1] = a6;
  v18[2] = a8;
  uint64_t v11 = sub_250D5DFA0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = objc_allocWithZone(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v18[3] = a7;
  uint64_t v16 = sub_250D5DE80();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  return v16;
}

uint64_t PinnedContentSyncStateUpdaterDelegate.init(logger:key:supportedSyncVersionRange:domain:store:maxDataSizeInBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = a8;
  uint64_t v10 = sub_250D5DFA0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  v15[3] = a7;
  uint64_t v13 = sub_250D5DE80();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v13;
}

id PinnedContentSyncStateUpdaterDelegate.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinnedContentSyncStateUpdaterDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250D58AD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  v18[1] = a6;
  v18[2] = a8;
  uint64_t v10 = sub_250D5DFA0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a7;
  id v15 = objc_allocWithZone((Class)type metadata accessor for PinnedContentSyncStateUpdaterDelegate());
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  v18[3] = v14;
  uint64_t v16 = sub_250D5DE80();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v16;
}

uint64_t sub_250D58C20(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v30 = a3;
  uint64_t v29 = sub_250D5DFA0();
  uint64_t v10 = *(void *)(v29 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v29);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v28 - v15;
  uint64_t v17 = *(void *)(a5 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v14);
  id v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  os_log_type_t v22 = (char *)&v28 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))((char *)&v28 - v21, a2, a5);
  sub_250D5DF80();
  type metadata accessor for PinnedContentDaemonStore();
  uint64_t v23 = swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, a5);
  uint64_t v24 = sub_250D56F34(a1, (uint64_t)v20, v23, a5, a6);
  objc_allocWithZone((Class)type metadata accessor for PinnedContentSyncStateUpdaterDelegate());
  uint64_t v25 = v29;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v16, v29);
  uint64_t v31 = v24;
  uint64_t v26 = sub_250D5DE80();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v25);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v22, a5);
  return v26;
}

uint64_t type metadata accessor for PinnedContentSyncStateUpdaterDelegate()
{
  uint64_t result = qword_269B02A78;
  if (!qword_269B02A78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_250D58F24()
{
  unint64_t result = qword_269B02A70;
  if (!qword_269B02A70)
  {
    sub_250D57080();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B02A70);
  }
  return result;
}

uint64_t sub_250D58F7C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_250D58FBC()
{
  return type metadata accessor for PinnedContentSyncStateUpdaterDelegate();
}

unint64_t static HDHealthAppDefines.sharingReminderNotificationIdentifier.getter()
{
  return 0xD00000000000002ELL;
}

id HDHealthAppDefines.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id HDHealthAppDefines.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDHealthAppDefines();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for HDHealthAppDefines()
{
  return self;
}

id HDHealthAppDefines.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDHealthAppDefines();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t static AppAnalyticsAcceptanceStateSyncEntity.syncEntityDomain.getter()
{
  return 0xD000000000000025;
}

unint64_t static AppAnalyticsAcceptanceStateSyncEntity.acceptanceStateDataKey.getter()
{
  return 0xD000000000000017;
}

void sub_250D5915C()
{
  sub_250D5BDE8((uint64_t)&unk_2701DE688);
  swift_arrayDestroy();
  unint64_t v0 = (void *)sub_250D5DFF0();
  id v1 = (void *)sub_250D5E0C0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(self, sel_schemaWithDomain_dataKeys_, v0, v1);

  qword_26B205A10 = (uint64_t)v2;
}

id static AppAnalyticsAcceptanceStateSyncEntity.stateEntitySchema.getter()
{
  if (qword_26B205A18 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_26B205A10;
  return v0;
}

unint64_t sub_250D592E0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_250D5AE4C(0, &qword_269B02B48, MEMORY[0x263F8DFB0]);
  id v2 = (void *)sub_250D5E350();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_250D59AC4(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

void static AppAnalyticsAcceptanceStateSyncEntity.save(_:profile:transaction:)(void *a1, void *a2, uint64_t a3)
{
}

void static AppAnalyticsAcceptanceStateSyncEntity.updateData(withStateStorage:profile:transaction:)(void *a1, void *a2, uint64_t a3)
{
}

id AppAnalyticsAcceptanceStateSyncEntity.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id AppAnalyticsAcceptanceStateSyncEntity.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppAnalyticsAcceptanceStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_init);
}

id AppAnalyticsAcceptanceStateSyncEntity.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppAnalyticsAcceptanceStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_250D595E4(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return;
  }
  uint64_t v2 = a2;
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  int64_t v3 = 0;
  uint64_t v45 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v46 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v47 = a1;
  while (1)
  {
    if (v6)
    {
      unint64_t v7 = __clz(__rbit64(v6));
      uint64_t v8 = (v6 - 1) & v6;
      unint64_t v9 = v7 | (v3 << 6);
    }
    else
    {
      int64_t v10 = v3 + 1;
      if (__OFADD__(v3, 1))
      {
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
        goto LABEL_84;
      }
      if (v10 >= v46) {
        return;
      }
      unint64_t v11 = *(void *)(v45 + 8 * v10);
      ++v3;
      if (!v11)
      {
        int64_t v3 = v10 + 1;
        if (v10 + 1 >= v46) {
          return;
        }
        unint64_t v11 = *(void *)(v45 + 8 * v3);
        if (!v11)
        {
          int64_t v3 = v10 + 2;
          if (v10 + 2 >= v46) {
            return;
          }
          unint64_t v11 = *(void *)(v45 + 8 * v3);
          if (!v11)
          {
            int64_t v3 = v10 + 3;
            if (v10 + 3 >= v46) {
              return;
            }
            unint64_t v11 = *(void *)(v45 + 8 * v3);
            if (!v11)
            {
              int64_t v12 = v10 + 4;
              if (v12 >= v46) {
                return;
              }
              unint64_t v11 = *(void *)(v45 + 8 * v12);
              if (!v11)
              {
                while (1)
                {
                  int64_t v3 = v12 + 1;
                  if (__OFADD__(v12, 1)) {
                    goto LABEL_86;
                  }
                  if (v3 >= v46) {
                    return;
                  }
                  unint64_t v11 = *(void *)(v45 + 8 * v3);
                  ++v12;
                  if (v11) {
                    goto LABEL_24;
                  }
                }
              }
              int64_t v3 = v12;
            }
          }
        }
      }
LABEL_24:
      uint64_t v8 = (v11 - 1) & v11;
      unint64_t v9 = __clz(__rbit64(v11)) + (v3 << 6);
    }
    uint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_250D59AC4(v14, v15);
    char v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0) {
      goto LABEL_75;
    }
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + 8 * v17);
    int64_t v50 = v3;
    if ((unint64_t)v20 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v21 = sub_250D5E340();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    unint64_t v49 = v8;
    if ((unint64_t)v16 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_250D5E340();
      swift_bridgeObjectRelease();
      if (v21 != v44) {
        goto LABEL_74;
      }
    }
    else if (v21 != *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_74;
    }
    if (v21)
    {
      uint64_t v22 = v20 & 0xFFFFFFFFFFFFFF8;
      uint64_t v23 = (v20 & 0xFFFFFFFFFFFFFF8) + 32;
      if (v20 < 0) {
        uint64_t v22 = v20;
      }
      if ((unint64_t)v20 >> 62) {
        uint64_t v23 = v22;
      }
      uint64_t v24 = v16 & 0xFFFFFFFFFFFFFF8;
      uint64_t v25 = (v16 & 0xFFFFFFFFFFFFFF8) + 32;
      if (v16 < 0) {
        uint64_t v24 = v16;
      }
      if ((unint64_t)v16 >> 62) {
        uint64_t v25 = v24;
      }
      if (v23 != v25)
      {
        if (v21 < 0) {
          goto LABEL_81;
        }
        unint64_t v26 = v20 & 0xC000000000000001;
        if ((v20 & 0xC000000000000001) != 0)
        {
          id v27 = (id)MEMORY[0x2533879B0](0, v20);
        }
        else
        {
          if (!*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_82;
          }
          id v27 = *(id *)(v20 + 32);
        }
        uint64_t v28 = v27;
        unint64_t v29 = v16 & 0xC000000000000001;
        if ((v16 & 0xC000000000000001) != 0)
        {
          id v30 = (id)MEMORY[0x2533879B0](0, v16);
        }
        else
        {
          if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_83;
          }
          id v30 = *(id *)(v16 + 32);
        }
        uint64_t v31 = v30;
        sub_250D584F8(0, (unint64_t *)&unk_269B02AF8);
        char v32 = sub_250D5E230();

        if ((v32 & 1) == 0) {
          goto LABEL_74;
        }
        if (v21 != 1) {
          break;
        }
      }
    }
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v47;
    uint64_t v2 = a2;
    unint64_t v6 = v49;
    int64_t v3 = v50;
  }
  if (!v26)
  {
    if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
    {
      id v33 = *(id *)(v20 + 40);
      if (!v29) {
        goto LABEL_54;
      }
LABEL_51:
      id v34 = (id)MEMORY[0x2533879B0](1, v16);
LABEL_56:
      uint64_t v35 = v34;
      char v36 = sub_250D5E230();

      if ((v36 & 1) == 0)
      {
LABEL_74:
        swift_bridgeObjectRelease();
LABEL_75:
        swift_bridgeObjectRelease();
        return;
      }
      uint64_t v37 = 2 - v21;
      uint64_t v38 = 6;
      while (1)
      {
        if (v37 + v38 == 6) {
          goto LABEL_6;
        }
        unint64_t v42 = v38 - 4;
        if (v26)
        {
          id v43 = (id)MEMORY[0x2533879B0](v38 - 4, v20);
          if (v29) {
            goto LABEL_58;
          }
        }
        else
        {
          if (v42 >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_79:
            __break(1u);
            goto LABEL_80;
          }
          id v43 = *(id *)(v20 + 8 * v38);
          if (v29)
          {
LABEL_58:
            id v39 = (id)MEMORY[0x2533879B0](v38 - 4, v16);
            goto LABEL_59;
          }
        }
        if (v42 >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_79;
        }
        id v39 = *(id *)(v16 + 8 * v38);
LABEL_59:
        uint64_t v40 = v39;
        char v41 = sub_250D5E230();

        ++v38;
        if ((v41 & 1) == 0) {
          goto LABEL_74;
        }
      }
    }
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  id v33 = (id)MEMORY[0x2533879B0](1, v20);
  if (v29) {
    goto LABEL_51;
  }
LABEL_54:
  if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    id v34 = *(id *)(v16 + 40);
    goto LABEL_56;
  }
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
}

unint64_t sub_250D59AC4(uint64_t a1, uint64_t a2)
{
  sub_250D5E400();
  sub_250D5E050();
  uint64_t v4 = sub_250D5E410();
  return sub_250D59B3C(a1, a2, v4);
}

unint64_t sub_250D59B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_250D5E390() & 1) == 0)
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
      while (!v14 && (sub_250D5E390() & 1) == 0);
    }
  }
  return v6;
}

id sub_250D59C20(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)sub_250D5DFF0();
  *(void *)&v19[0] = 0;
  v18[0] = 0;
  unsigned int v4 = objc_msgSend(a1, sel_data_forKey_error_, v19, v3, v18);

  id v5 = v18[0];
  unint64_t v6 = *(void **)&v19[0];
  if (!v4)
  {
    id v13 = v18[0];
    id v14 = v6;
    sub_250D5DDD0();

    swift_willThrow();
    return v5;
  }
  if (!*(void *)&v19[0])
  {
    id v15 = v18[0];
    goto LABEL_8;
  }
  v19[0] = xmmword_250D60010;
  id v7 = v6;
  id v8 = v5;
  id v9 = v7;
  sub_250D5DE10();

  unint64_t v10 = *((void *)&v19[0] + 1);
  if (*((void *)&v19[0] + 1) >> 60 == 15)
  {
LABEL_8:
    id v5 = (id)sub_250D592E0(MEMORY[0x263F8EE78]);

    return v5;
  }
  uint64_t v11 = *(void *)&v19[0];
  id v5 = (id)sub_250D584F8(0, &qword_269B02B10);
  sub_250D5AD50();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_250D60020;
  *(void *)(v12 + 32) = sub_250D584F8(0, &qword_269B02B28);
  *(void *)(v12 + 40) = sub_250D584F8(0, &qword_269B02B30);
  *(void *)(v12 + 48) = sub_250D584F8(0, &qword_269B02B38);
  *(void *)(v12 + 56) = sub_250D584F8(0, (unint64_t *)&unk_269B02AF8);
  sub_250D5E150();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    sub_250D5ADE8((uint64_t)v19, (uint64_t)v18);
    if (v18[3])
    {
      sub_250D5AE4C(0, &qword_269B02B40, MEMORY[0x263F8D060]);
      if (swift_dynamicCast())
      {
        sub_250D4311C(v11, v10);
        id v5 = v17;
LABEL_15:
        sub_250D51448((uint64_t)v19);

        return v5;
      }
    }
    else
    {
      sub_250D51448((uint64_t)v18);
    }
    id v5 = (id)sub_250D592E0(MEMORY[0x263F8EE78]);
    sub_250D4311C(v11, v10);
    goto LABEL_15;
  }
  sub_250D4311C(v11, v10);

  swift_bridgeObjectRelease();
  return v5;
}

void sub_250D59F0C(void *a1, void *a2, uint64_t a3)
{
  v19[4] = *(id *)MEMORY[0x263EF8340];
  id v6 = objc_msgSend(self, sel_pluginIdentifier);
  if (!v6)
  {
    sub_250D5E010();
    id v6 = (id)sub_250D5DFF0();
    swift_bridgeObjectRelease();
  }
  id v7 = objc_msgSend(a2, sel_profileExtensionWithIdentifier_, v6);

  if (v7)
  {
    sub_250D5E270();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_250D5AC90((uint64_t)v18, (uint64_t)v19);
  if (v19[3])
  {
    sub_250D584F8(0, &qword_269B02B08);
    if (swift_dynamicCast())
    {
      id v8 = objc_msgSend(v17, sel_appAnalyticsUpdateManager);

      if (v8)
      {
        id v9 = v8;
        id v10 = objc_msgSend(a1, sel_accepted);
        id v11 = objc_msgSend(a1, sel_agreement);
        if (!v11)
        {
          sub_250D5E010();
          id v11 = (id)sub_250D5DFF0();
          swift_bridgeObjectRelease();
        }
        id v12 = objc_msgSend(a1, sel_version);
        id v13 = objc_msgSend(a1, sel_modificationDate);
        v19[0] = 0;
        unsigned int v14 = objc_msgSend(v9, sel_setAccepted_agreement_version_modificationDate_transaction_error_, v10, v11, v12, v13, a3, v19);

        if (v14)
        {
          id v15 = v19[0];
        }
        else
        {
          id v16 = v19[0];
          sub_250D5DDD0();

          swift_willThrow();
        }
      }
    }
  }
  else
  {
    sub_250D51448((uint64_t)v19);
  }
}

void sub_250D5A188(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v67[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v48 = a2 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 64);
  int64_t v49 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  uint64_t v55 = a1;
  uint64_t v58 = a3;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      uint64_t v11 = (v8 - 1) & v8;
      unint64_t v12 = v10 | (v9 << 6);
    }
    else
    {
      BOOL v13 = __OFADD__(v9++, 1);
      if (v13) {
        goto LABEL_73;
      }
      if (v9 >= v49)
      {
LABEL_70:
        swift_release();
        return;
      }
      unint64_t v14 = *(void *)(v48 + 8 * v9);
      if (!v14)
      {
        int64_t v15 = v9 + 1;
        if (v9 + 1 >= v49) {
          goto LABEL_70;
        }
        unint64_t v14 = *(void *)(v48 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v9 + 2;
          if (v9 + 2 >= v49) {
            goto LABEL_70;
          }
          unint64_t v14 = *(void *)(v48 + 8 * v15);
          if (!v14)
          {
            int64_t v15 = v9 + 3;
            if (v9 + 3 >= v49) {
              goto LABEL_70;
            }
            unint64_t v14 = *(void *)(v48 + 8 * v15);
            if (!v14)
            {
              while (1)
              {
                int64_t v9 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_74;
                }
                if (v9 >= v49) {
                  goto LABEL_70;
                }
                unint64_t v14 = *(void *)(v48 + 8 * v9);
                ++v15;
                if (v14) {
                  goto LABEL_17;
                }
              }
            }
          }
        }
        int64_t v9 = v15;
      }
LABEL_17:
      uint64_t v11 = (v14 - 1) & v14;
      unint64_t v12 = __clz(__rbit64(v14)) + (v9 << 6);
    }
    int64_t v53 = v9;
    id v16 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v12);
    uint64_t v17 = v16[1];
    uint64_t v62 = *v16;
    unint64_t v18 = *(void *)(*(void *)(a2 + 56) + 8 * v12);
    if (v18 >> 62) {
      break;
    }
    uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v52 = v11;
    if (v19) {
      goto LABEL_20;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v8 = v52;
    int64_t v9 = v53;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_250D5E340();
  swift_bridgeObjectRelease();
  unint64_t v52 = v11;
  if (!v19) {
    goto LABEL_4;
  }
LABEL_20:
  unint64_t v20 = 0;
  unint64_t v63 = v18 & 0xC000000000000001;
  unint64_t v56 = v18 + 32;
  uint64_t v57 = v18 & 0xFFFFFFFFFFFFFF8;
  unint64_t v60 = v18;
  uint64_t v61 = v17;
  uint64_t v59 = v19;
  while (1)
  {
    if (v63)
    {
      id v21 = (id)MEMORY[0x2533879B0](v20, v18);
    }
    else
    {
      if (v20 >= *(void *)(v57 + 16)) {
        goto LABEL_72;
      }
      id v21 = *(id *)(v56 + 8 * v20);
    }
    id v64 = v21;
    BOOL v13 = __OFADD__(v20++, 1);
    if (v13)
    {
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
    }
    if (*(void *)(a1 + 16)) {
      break;
    }
LABEL_42:
    id v31 = objc_msgSend(self, sel_pluginIdentifier);
    if (!v31)
    {
      sub_250D5E010();
      id v31 = (id)sub_250D5DFF0();
      swift_bridgeObjectRelease();
    }
    id v32 = objc_msgSend(a3, sel_profileExtensionWithIdentifier_, v31);

    if (v32)
    {
      sub_250D5E270();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v66, 0, sizeof(v66));
    }
    sub_250D5AC90((uint64_t)v66, (uint64_t)v67);
    if (!v67[3])
    {
      sub_250D51448((uint64_t)v67);
      goto LABEL_22;
    }
    sub_250D584F8(0, &qword_269B02B08);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_22;
    }
    id v33 = objc_msgSend(v65, sel_appAnalyticsUpdateManager);

    if (!v33) {
      goto LABEL_22;
    }
    id v34 = v33;
    id v35 = objc_msgSend(v64, sel_accepted);
    id v36 = objc_msgSend(v64, sel_agreement);
    if (!v36)
    {
      sub_250D5E010();
      id v36 = (id)sub_250D5DFF0();
      swift_bridgeObjectRelease();
    }
    id v37 = objc_msgSend(v64, sel_version);
    id v38 = objc_msgSend(v64, sel_modificationDate);
    v67[0] = 0;
    unsigned int v39 = objc_msgSend(v34, sel_setAccepted_agreement_version_modificationDate_transaction_error_, v35, v36, v37, v38, a4, v67);

    if (!v39)
    {
      id v47 = v67[0];
      sub_250D5DDD0();

      swift_willThrow();
      uint64_t v28 = v64;
      goto LABEL_69;
    }
    id v40 = v67[0];

    unint64_t v18 = v60;
    uint64_t v17 = v61;
    a3 = v58;
    uint64_t v19 = v59;

LABEL_23:
    if (v20 == v19) {
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  unint64_t v22 = sub_250D59AC4(v62, v17);
  if ((v23 & 1) == 0)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
  unint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8 * v22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!(v24 >> 62))
  {
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v25) {
      goto LABEL_33;
    }
    goto LABEL_40;
  }
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_250D5E340();
  if (!v25)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    a3 = v58;
    uint64_t v19 = v59;
    a1 = v55;
    unint64_t v18 = v60;
    uint64_t v17 = v61;
    goto LABEL_41;
  }
LABEL_33:
  uint64_t v26 = 4;
  while (1)
  {
    if ((v24 & 0xC000000000000001) != 0) {
      id v27 = (id)MEMORY[0x2533879B0](v26 - 4, v24);
    }
    else {
      id v27 = *(id *)(v24 + 8 * v26);
    }
    uint64_t v28 = v27;
    uint64_t v29 = v26 - 3;
    if (__OFADD__(v26 - 4, 1))
    {
      __break(1u);
      goto LABEL_68;
    }
    id v30 = objc_msgSend(v27, sel_version);
    if (v30 == objc_msgSend(v64, sel_version)) {
      break;
    }

    ++v26;
    if (v29 == v25) {
      goto LABEL_40;
    }
  }
  swift_bridgeObjectRelease_n();
  id v41 = objc_msgSend(v64, sel_modificationDate);
  objc_msgSend(v41, sel_timeIntervalSinceReferenceDate);
  double v43 = v42;

  id v44 = objc_msgSend(v28, sel_modificationDate);
  objc_msgSend(v44, sel_timeIntervalSinceReferenceDate);
  double v46 = v45;

  if (v46 >= v43)
  {

    a3 = v58;
    uint64_t v19 = v59;
    a1 = v55;
    unint64_t v18 = v60;
    uint64_t v17 = v61;
LABEL_22:

    goto LABEL_23;
  }
  a3 = v58;
  sub_250D59F0C(v64, v58, a4);
  a1 = v55;
  uint64_t v17 = v61;
  uint64_t v19 = v59;
  if (!v51)
  {

    unint64_t v18 = v60;
    goto LABEL_22;
  }
LABEL_68:
  id v34 = v64;
LABEL_69:
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_250D5A880(void *a1, id a2, uint64_t a3)
{
  v39[1] = *(id *)MEMORY[0x263EF8340];
  id v7 = objc_msgSend(a2, sel_profileIdentifier);
  id v8 = objc_msgSend(v7, sel_type);

  if (v8 != (id)1) {
    return;
  }
  id v9 = sub_250D59C20(a1);
  if (v3) {
    return;
  }
  uint64_t v10 = (uint64_t)v9;
  uint64_t v11 = self;
  v39[0] = 0;
  id v12 = objc_msgSend(v11, sel_allAcceptancesInTransaction_error_, a3, v39);
  id v13 = v39[0];
  if (!v12) {
    goto LABEL_8;
  }
  unint64_t v14 = v12;
  sub_250D5AC28();
  uint64_t v15 = sub_250D5DFC0();
  id v16 = v13;

  sub_250D595E4(v10, v15);
  if (v17)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRelease();
    return;
  }
  sub_250D5A188(v15, v10, a2, a3);
  swift_bridgeObjectRelease();
  v39[0] = 0;
  id v19 = objc_msgSend(v11, sel_allAcceptancesInTransaction_error_, a3, v39);
  id v20 = v39[0];
  if (!v19)
  {
LABEL_8:
    id v18 = v39[0];
    swift_bridgeObjectRelease();
    sub_250D5DDD0();

LABEL_9:
    swift_willThrow();
    return;
  }
  id v21 = v19;
  uint64_t v22 = sub_250D5DFC0();
  id v23 = v20;

  sub_250D595E4(v22, v10);
  char v25 = v24;
  swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_7;
  }
  uint64_t v26 = self;
  id v27 = (void *)sub_250D5DFB0();
  swift_bridgeObjectRelease();
  v39[0] = 0;
  id v28 = objc_msgSend(v26, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v27, 1, v39);

  id v29 = v39[0];
  if (!v28)
  {
    id v37 = v29;
    sub_250D5DDD0();

    goto LABEL_9;
  }
  uint64_t v30 = sub_250D5DE20();
  unint64_t v32 = v31;

  id v33 = (void *)sub_250D5DE00();
  id v34 = (void *)sub_250D5DFF0();
  v39[0] = 0;
  unsigned int v35 = objc_msgSend(a1, sel_setData_forKey_error_, v33, v34, v39);

  if (v35)
  {
    id v36 = v39[0];
  }
  else
  {
    id v38 = v39[0];
    sub_250D5DDD0();

    swift_willThrow();
  }
  sub_250D43130(v30, v32);
}

uint64_t type metadata accessor for AppAnalyticsAcceptanceStateSyncEntity()
{
  return self;
}

void sub_250D5AC28()
{
  if (!qword_269B02AF0)
  {
    sub_250D584F8(255, (unint64_t *)&unk_269B02AF8);
    unint64_t v0 = sub_250D5E0B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B02AF0);
    }
  }
}

uint64_t sub_250D5AC90(uint64_t a1, uint64_t a2)
{
  sub_250D5ACF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_250D5ACF4()
{
  if (!qword_26B205CA0)
  {
    unint64_t v0 = sub_250D5E240();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B205CA0);
    }
  }
}

void sub_250D5AD50()
{
  if (!qword_269B02B18)
  {
    sub_250D5ADA8();
    unint64_t v0 = sub_250D5E380();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B02B18);
    }
  }
}

unint64_t sub_250D5ADA8()
{
  unint64_t result = qword_269B02B20;
  if (!qword_269B02B20)
  {
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269B02B20);
  }
  return result;
}

uint64_t sub_250D5ADE8(uint64_t a1, uint64_t a2)
{
  sub_250D5ACF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_250D5AE4C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, void, uint64_t, void))
{
  if (!*a2)
  {
    sub_250D5AC28();
    unint64_t v7 = a3(a1, MEMORY[0x263F8D310], v6, MEMORY[0x263F8D320]);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

id sub_250D5AEBC()
{
  sub_250D5AF44();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269B02E10 = (uint64_t)result;
  return result;
}

void sub_250D5AF14()
{
  qword_269B02E18 = 0x617A696C61636F4CLL;
  unk_269B02E20 = 0xEF74636944656C62;
}

unint64_t sub_250D5AF44()
{
  unint64_t result = qword_269B02B50;
  if (!qword_269B02B50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B02B50);
  }
  return result;
}

unint64_t static SummaryPinnedContentStateSyncEntity.syncEntityDomain.getter()
{
  return 0xD000000000000024;
}

void sub_250D5AFA4()
{
  sub_250D5BDE8((uint64_t)&unk_2701DE6B8);
  swift_arrayDestroy();
  unint64_t v0 = (void *)sub_250D5DFF0();
  uint64_t v1 = (void *)sub_250D5E0C0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(self, sel_schemaWithDomain_dataKeys_, v0, v1);

  qword_26B205B20 = (uint64_t)v2;
}

id static SummaryPinnedContentStateSyncEntity.stateEntitySchema.getter()
{
  if (qword_26B205B28 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_26B205B20;
  return v0;
}

uint64_t static SummaryPinnedContentStateSyncEntity.SyncSchemaVersion.v1.getter()
{
  return 1;
}

id static SummaryPinnedContentStateSyncEntity.updateData(withStateStorage:profile:transaction:)(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_250D5C03C(a1, a2, a3);
}

uint64_t static SummaryPinnedContentStateSyncEntity.syncDidFinish(with:stateStore:profile:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_250D5C168(a1, a3);
}

id SummaryPinnedContentStateSyncEntity.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SummaryPinnedContentStateSyncEntity.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SummaryPinnedContentStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SummaryPinnedContentStateSyncEntity.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SummaryPinnedContentStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250D5B364(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_250D5E400();
  swift_bridgeObjectRetain();
  sub_250D5E050();
  uint64_t v8 = sub_250D5E410();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    id v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_250D5E390() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_250D5E390() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_250D5B7F0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_250D5B514()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_250D5C850();
  uint64_t v3 = sub_250D5E290();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                id v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_250D5E400();
      sub_250D5E050();
      uint64_t result = sub_250D5E410();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v1 = v4;
  return result;
}

uint64_t sub_250D5B7F0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_250D5B514();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_250D5B98C();
      goto LABEL_22;
    }
    sub_250D5BB3C();
  }
  uint64_t v11 = *v4;
  sub_250D5E400();
  sub_250D5E050();
  uint64_t result = sub_250D5E410();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_250D5E390(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_250D5E3B0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_250D5E390();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_250D5B98C()
{
  id v1 = v0;
  sub_250D5C850();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_250D5E280();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_250D5BB3C()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_250D5C850();
  uint64_t v3 = sub_250D5E290();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_250D5E400();
    swift_bridgeObjectRetain();
    sub_250D5E050();
    uint64_t result = sub_250D5E410();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    id v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_250D5BDE8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_250D5E0D0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_250D5B364(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_250D5BE80(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_250D5DFA0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v15 - v9;
  sub_250D5DF80();
  type metadata accessor for PinnedContentDaemonStore();
  uint64_t v11 = swift_allocObject();
  swift_retain();
  uint64_t v12 = sub_250D421CC(a1, a2, v11);
  objc_allocWithZone((Class)type metadata accessor for PinnedContentSyncStateUpdaterDelegate());
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  v15[1] = v12;
  uint64_t v13 = sub_250D5DE80();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v13;
}

id sub_250D5C03C(uint64_t a1, void *a2, uint64_t a3)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = self;
  type metadata accessor for PinnedContentDarwinNotificationPoster();
  uint64_t v7 = swift_allocObject();
  id v8 = a2;
  uint64_t v9 = (void *)sub_250D5BE80(v8, v7);

  swift_release();
  v12[0] = 0;
  LODWORD(a1) = objc_msgSend(v6, sel_updateDataWithStateStore_delegate_profile_transaction_error_, a1, v9, v8, a3, v12);

  if (a1) {
    return v12[0];
  }
  id v11 = v12[0];
  sub_250D5DDD0();

  return (id)swift_willThrow();
}

uint64_t sub_250D5C168(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_250D5DFA0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  id v11 = (char *)&v47 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v47 - v12;
  if (a1 == 1)
  {
    sub_250D5DF80();
    id v25 = a2;
    unint64_t v26 = sub_250D5DF90();
    os_log_type_t v27 = sub_250D5E100();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      int64_t v29 = (void *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v52 = v49;
      *(_DWORD *)uint64_t v28 = 136315394;
      uint64_t v50 = v4;
      uint64_t v30 = sub_250D5E420();
      uint64_t v51 = sub_250D42E30(v30, v31, &v52);
      sub_250D5E250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2112;
      id v32 = objc_msgSend(v25, sel_profileIdentifier);
      uint64_t v51 = (uint64_t)v32;
      sub_250D5E250();
      *int64_t v29 = v32;

      _os_log_impl(&dword_250D3F000, v26, v27, "[%s]_%@: Unable to sync", (uint8_t *)v28, 0x16u);
      sub_250D58344();
      swift_arrayDestroy();
      MEMORY[0x253388320](v29, -1, -1);
      uint64_t v33 = v49;
      swift_arrayDestroy();
      MEMORY[0x253388320](v33, -1, -1);
      MEMORY[0x253388320](v28, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v50);
    }

    double v45 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    double v46 = v11;
  }
  else if (a1)
  {
    sub_250D5DF80();
    id v34 = a2;
    unsigned int v35 = sub_250D5DF90();
    os_log_type_t v36 = sub_250D5E100();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v48 = (void *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v52 = v49;
      *(_DWORD *)uint64_t v37 = 136315650;
      uint64_t v50 = v4;
      uint64_t v38 = sub_250D5E420();
      uint64_t v51 = sub_250D42E30(v38, v39, &v52);
      sub_250D5E250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2112;
      id v40 = objc_msgSend(v34, sel_profileIdentifier);
      uint64_t v51 = (uint64_t)v40;
      sub_250D5E250();
      id v41 = v48;
      *uint64_t v48 = v40;

      *(_WORD *)(v37 + 22) = 2080;
      uint64_t v51 = a1;
      type metadata accessor for HDCloudSyncStateResult(0);
      uint64_t v42 = sub_250D5E030();
      uint64_t v51 = sub_250D42E30(v42, v43, &v52);
      sub_250D5E250();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250D3F000, v35, v36, "[%s]_%@: Unknown sync result: %s", (uint8_t *)v37, 0x20u);
      sub_250D58344();
      swift_arrayDestroy();
      MEMORY[0x253388320](v41, -1, -1);
      uint64_t v44 = v49;
      swift_arrayDestroy();
      MEMORY[0x253388320](v44, -1, -1);
      MEMORY[0x253388320](v37, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v50);
    }

    double v45 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    double v46 = v8;
  }
  else
  {
    sub_250D5DF80();
    id v14 = a2;
    unint64_t v15 = sub_250D5DF90();
    os_log_type_t v16 = sub_250D5E110();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      int64_t v18 = (void *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v52 = v49;
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v19 = sub_250D5E420();
      uint64_t v21 = sub_250D42E30(v19, v20, &v52);
      uint64_t v50 = v4;
      uint64_t v51 = v21;
      sub_250D5E250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2112;
      id v22 = objc_msgSend(v14, sel_profileIdentifier);
      uint64_t v51 = (uint64_t)v22;
      sub_250D5E250();
      *int64_t v18 = v22;

      _os_log_impl(&dword_250D3F000, v15, v16, "[%s]_%@: Sync complete!", (uint8_t *)v17, 0x16u);
      sub_250D58344();
      swift_arrayDestroy();
      MEMORY[0x253388320](v18, -1, -1);
      uint64_t v23 = v49;
      swift_arrayDestroy();
      MEMORY[0x253388320](v23, -1, -1);
      MEMORY[0x253388320](v17, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v50);
    }

    double v45 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    double v46 = v13;
  }
  return v45(v46, v4);
}

uint64_t type metadata accessor for SummaryPinnedContentStateSyncEntity()
{
  return self;
}

ValueMetadata *type metadata accessor for SummaryPinnedContentStateSyncEntity.SyncSchemaVersion()
{
  return &type metadata for SummaryPinnedContentStateSyncEntity.SyncSchemaVersion;
}

void sub_250D5C850()
{
  if (!qword_269B02B60)
  {
    unint64_t v0 = sub_250D5E2A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B02B60);
    }
  }
}

uint64_t sub_250D5C8B0()
{
  return sub_250D5DEC0();
}

void sub_250D5C974(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_250D5DDC0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_250D5C9D8()
{
  return sub_250D5DEB0();
}

uint64_t sub_250D5CA9C()
{
  return sub_250D5DEA0();
}

uint64_t sub_250D5CB60()
{
  return sub_250D5DE90();
}

id HealthAppHealthDaemonOrchestrationClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id HealthAppHealthDaemonOrchestrationClient.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient_connection;
  id v2 = objc_allocWithZone((Class)sub_250D5DED0());
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for HealthAppHealthDaemonOrchestrationClient();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for HealthAppHealthDaemonOrchestrationClient()
{
  return self;
}

id HealthAppHealthDaemonOrchestrationClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthAppHealthDaemonOrchestrationClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for HealthAppHealthDaemonOrchestrationClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HealthAppHealthDaemonOrchestrationClient);
}

uint64_t dispatch thunk of HealthAppHealthDaemonOrchestrationClient.requestBackgroundGenerationForFeedItemsAfterUnlock(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of HealthAppHealthDaemonOrchestrationClient.requestBackgroundGenerationForAllModelsAfterUnlock(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of HealthAppHealthDaemonOrchestrationClient.runOrRequestBackgroundGeneration(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of HealthAppHealthDaemonOrchestrationClient.runBackgroundGeneration(plugins:commitAsUrgent:generationType:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t sub_250D5CEF4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_250D5CF2C(uint64_t a1)
{
  sub_250D5C974(a1, *(void *)(v1 + 16));
}

uint64_t sub_250D5DCE0()
{
  return MEMORY[0x270F30D00]();
}

uint64_t sub_250D5DCF0()
{
  return MEMORY[0x270F30D08]();
}

uint64_t sub_250D5DD00()
{
  return MEMORY[0x270F30D10]();
}

uint64_t sub_250D5DD10()
{
  return MEMORY[0x270F30D18]();
}

uint64_t sub_250D5DD20()
{
  return MEMORY[0x270F30D20]();
}

uint64_t sub_250D5DD30()
{
  return MEMORY[0x270F30D28]();
}

uint64_t sub_250D5DD40()
{
  return MEMORY[0x270F30D30]();
}

uint64_t sub_250D5DD50()
{
  return MEMORY[0x270F30D38]();
}

uint64_t sub_250D5DD60()
{
  return MEMORY[0x270F30D40]();
}

uint64_t sub_250D5DD70()
{
  return MEMORY[0x270F30D48]();
}

uint64_t sub_250D5DD80()
{
  return MEMORY[0x270F30D50]();
}

uint64_t sub_250D5DD90()
{
  return MEMORY[0x270F30D58]();
}

uint64_t sub_250D5DDA0()
{
  return MEMORY[0x270F30D60]();
}

uint64_t sub_250D5DDB0()
{
  return MEMORY[0x270F30D68]();
}

uint64_t sub_250D5DDC0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_250D5DDD0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_250D5DDE0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_250D5DDF0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_250D5DE00()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_250D5DE10()
{
  return MEMORY[0x270EF0168]();
}

uint64_t sub_250D5DE20()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_250D5DE30()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_250D5DE40()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_250D5DE50()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_250D5DE60()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_250D5DE70()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_250D5DE80()
{
  return MEMORY[0x270F31930]();
}

uint64_t sub_250D5DE90()
{
  return MEMORY[0x270F30DD8]();
}

uint64_t sub_250D5DEA0()
{
  return MEMORY[0x270F30DE0]();
}

uint64_t sub_250D5DEB0()
{
  return MEMORY[0x270F30DE8]();
}

uint64_t sub_250D5DEC0()
{
  return MEMORY[0x270F30DF0]();
}

uint64_t sub_250D5DED0()
{
  return MEMORY[0x270F30DF8]();
}

uint64_t sub_250D5DEE0()
{
  return MEMORY[0x270F30E40]();
}

uint64_t sub_250D5DEF0()
{
  return MEMORY[0x270F30E48]();
}

uint64_t sub_250D5DF00()
{
  return MEMORY[0x270F30E50]();
}

uint64_t sub_250D5DF10()
{
  return MEMORY[0x270F30E58]();
}

uint64_t sub_250D5DF20()
{
  return MEMORY[0x270F30E60]();
}

uint64_t sub_250D5DF30()
{
  return MEMORY[0x270F30E68]();
}

uint64_t sub_250D5DF40()
{
  return MEMORY[0x270F30E70]();
}

uint64_t sub_250D5DF50()
{
  return MEMORY[0x270F30E78]();
}

uint64_t sub_250D5DF60()
{
  return MEMORY[0x270F30E88]();
}

uint64_t sub_250D5DF70()
{
  return MEMORY[0x270F30E90]();
}

uint64_t sub_250D5DF80()
{
  return MEMORY[0x270F30D70]();
}

uint64_t sub_250D5DF90()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_250D5DFA0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_250D5DFB0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_250D5DFC0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_250D5DFD0()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_250D5DFE0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_250D5DFF0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_250D5E000()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_250D5E010()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_250D5E020()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_250D5E030()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_250D5E040()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_250D5E050()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_250D5E060()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_250D5E070()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_250D5E080()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_250D5E090()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_250D5E0A0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_250D5E0B0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_250D5E0C0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_250D5E0D0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_250D5E0E0()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_250D5E0F0()
{
  return MEMORY[0x270EF33C0]();
}

uint64_t sub_250D5E100()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_250D5E110()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_250D5E120()
{
  return MEMORY[0x270EF33F8]();
}

uint64_t sub_250D5E130()
{
  return MEMORY[0x270F31938]();
}

uint64_t sub_250D5E140()
{
  return MEMORY[0x270F31940]();
}

uint64_t sub_250D5E150()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_250D5E160()
{
  return MEMORY[0x270EF34D8]();
}

uint64_t sub_250D5E170()
{
  return MEMORY[0x270F30D78]();
}

uint64_t sub_250D5E180()
{
  return MEMORY[0x270F30D80]();
}

uint64_t sub_250D5E190()
{
  return MEMORY[0x270F30D88]();
}

uint64_t sub_250D5E1A0()
{
  return MEMORY[0x270F30D90]();
}

uint64_t sub_250D5E1B0()
{
  return MEMORY[0x270F30D98]();
}

uint64_t sub_250D5E1C0()
{
  return MEMORY[0x270F30DA0]();
}

uint64_t sub_250D5E1D0()
{
  return MEMORY[0x270F30DA8]();
}

uint64_t sub_250D5E1E0()
{
  return MEMORY[0x270F30DB0]();
}

uint64_t sub_250D5E1F0()
{
  return MEMORY[0x270F30DB8]();
}

uint64_t sub_250D5E200()
{
  return MEMORY[0x270F30DC0]();
}

uint64_t sub_250D5E210()
{
  return MEMORY[0x270F30DC8]();
}

uint64_t sub_250D5E220()
{
  return MEMORY[0x270F30DD0]();
}

uint64_t sub_250D5E230()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_250D5E240()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_250D5E250()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_250D5E260()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_250D5E270()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_250D5E280()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_250D5E290()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_250D5E2A0()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_250D5E2B0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_250D5E2C0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_250D5E2D0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_250D5E2E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_250D5E2F0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_250D5E300()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_250D5E310()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_250D5E320()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_250D5E330()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_250D5E340()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_250D5E350()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_250D5E360()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_250D5E370()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_250D5E380()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_250D5E390()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_250D5E3A0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_250D5E3B0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_250D5E3C0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_250D5E3D0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_250D5E3E0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_250D5E3F0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_250D5E400()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_250D5E410()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_250D5E420()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AllHealthAppAnalyticsAgreements()
{
  return MEMORY[0x270F30EC0]();
}

uint64_t HDEntityCategoryForKeyValueCategory()
{
  return MEMORY[0x270F319C8]();
}

uint64_t HDSQLiteBindFoundationValueToStatement()
{
  return MEMORY[0x270F31A60]();
}

uint64_t HDSQLiteColumnAsBoolean()
{
  return MEMORY[0x270F31A90]();
}

uint64_t HDSQLiteColumnAsDouble()
{
  return MEMORY[0x270F31AA0]();
}

uint64_t HDSQLiteColumnAsInt64()
{
  return MEMORY[0x270F31AA8]();
}

uint64_t HDSQLiteColumnAsString()
{
  return MEMORY[0x270F31AB8]();
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x270EF35F8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKCreateSerialUtilityDispatchQueue()
{
  return MEMORY[0x270EF3670]();
}

uint64_t HKHealthKitFrameworkBundle()
{
  return MEMORY[0x270EF36F0]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x270EF3808]();
}

uint64_t MobileInstallationWaitForSystemAppMigrationWithCompletion()
{
  return MEMORY[0x270F4ADF8]();
}

uint64_t NSStringFromHKNotificationInstructionAction()
{
  return MEMORY[0x270EF38D8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x270FA0350]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}